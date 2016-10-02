


/* Name: VARUN MITTAL
   USC ID: 1904-2446-54 */


/* a */   


SELECT lion_ID FROM lion  WHERE sdo_relate(lion.position, SDO_geometry(2003,NULL,NULL,
                                       SDO_elem_info_array(1,1003,3),
                                       SDO_ordinate_array(150,200,400,350)),'mask=inside') = 'TRUE'; 

/* b */

 SELECT l.lion_ID FROM lion l,pond p  WHERE sdo_within_distance(l.position, p.shape, 'distance=150')='TRUE' AND p.pond_id='P1'; 

/* d */

SELECT p.pond_id FROM pond p,lion l WHERE sdo_nn(p.shape,l.position,'sdo_num_res=3')='TRUE' and l.lion_id='L2';

/* f */

SELECT l.lion_id,p.pond_id from TABLE(sdo_join('lion','position','pond','shape','mask=inside'))c,lion l, pond p WHERE c.rowid1=l.rowid AND c.rowid2=p.rowid;

/* h */

SELECT region_id from region,lion,pond where sdo_inside(lion.position,region.shape)='TRUE' MINUS select region_id from region,lion,pond where sdo_inside(pond.shape,region.shape)='TRUE';

/* i */

 SELECT lion_id from lion,ambulancearea MINUS select lion_id from lion,ambulancearea where sdo_inside(lion.position,ambulancearea.shape) ='TRUE';
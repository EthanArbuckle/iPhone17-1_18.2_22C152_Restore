@interface ENUCoordinate
+ (id)fromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5;
- (ENUCoordinate)init;
- (ENUCoordinate)initWithEast:(double)a3 north:(double)a4 up:(double)a5;
- (double)east;
- (double)north;
- (double)up;
- (void)setEast:(double)a3;
- (void)setFromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5;
- (void)setNorth:(double)a3;
- (void)setUp:(double)a3;
@end

@implementation ENUCoordinate

- (ENUCoordinate)init
{
  return (ENUCoordinate *)((uint64_t (*)(ENUCoordinate *, char *))MEMORY[0x270F9A6D0])(self, sel_initWithEast_north_up_);
}

- (ENUCoordinate)initWithEast:(double)a3 north:(double)a4 up:(double)a5
{
  self->_east = a3;
  self->_north = a4;
  self->_up = a5;
  return self;
}

+ (id)fromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(ENUCoordinate);
  objc_msgSend_setFromLatLonOrigin_andEcefOrigin_andEcefPoint_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);

  return v10;
}

- (void)setFromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v78 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_latitude(v78, v10, v11, v12, v13);
  double v15 = v14;
  objc_msgSend_latitude(v78, v16, v17, v18, v19);
  double v21 = v20;
  objc_msgSend_longitude(v78, v22, v23, v24, v25);
  double v27 = v26;
  objc_msgSend_longitude(v78, v28, v29, v30, v31);
  double v33 = v32;
  objc_msgSend_x(v9, v34, v35, v36, v37);
  double v39 = v38;
  objc_msgSend_x(v8, v40, v41, v42, v43);
  double v45 = v44;
  double v76 = v27;
  double v77 = v21;
  objc_msgSend_y(v9, v46, v47, v48, v49);
  double v51 = v50;
  objc_msgSend_y(v8, v52, v53, v54, v55);
  double v57 = v56;
  objc_msgSend_z(v9, v58, v59, v60, v61);
  double v75 = v62;
  objc_msgSend_z(v8, v63, v64, v65, v66);
  double v68 = v67;
  double v69 = v51 - v57;
  double v70 = v39 - v45;
  double v71 = sin(v33 * 0.0174532925);
  double v72 = cos(v76 * 0.0174532925);
  double v73 = sin(v77 * 0.0174532925);
  long double v74 = cos(v15 * 0.0174532925);
  self->_east = v72 * v69 - v71 * v70;
  self->_north = -(v73 * v71) * v69 + -(v73 * v72) * v70 + v74 * (v75 - v68);
  self->_up = v74 * v71 * v69 + v74 * v72 * v70 + v73 * (v75 - v68);
}

- (double)east
{
  return self->_east;
}

- (void)setEast:(double)a3
{
  self->_east = a3;
}

- (double)north
{
  return self->_north;
}

- (void)setNorth:(double)a3
{
  self->_north = a3;
}

- (double)up
{
  return self->_up;
}

- (void)setUp:(double)a3
{
  self->_up = a3;
}

@end
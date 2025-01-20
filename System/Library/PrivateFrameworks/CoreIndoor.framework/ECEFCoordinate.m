@interface ECEFCoordinate
+ (id)fromLatLon:(id)a3;
- (ECEFCoordinate)init;
- (ECEFCoordinate)initWithX:(double)a3 y:(double)a4 z:(double)a5;
- (double)x;
- (double)y;
- (double)z;
- (id)initFromLatLon:(id)a3;
- (point_xy<double,)toBoostEnuWithLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 usingENU:(id)a5;
- (void)setFromLatLon:(id)a3;
- (void)setFromX:(double)a3 y:(double)a4 z:(double)a5;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setZ:(double)a3;
@end

@implementation ECEFCoordinate

- (ECEFCoordinate)init
{
  return (ECEFCoordinate *)objc_msgSend_initWithX_y_z_(self, a2, v2, v3, v4, NAN, NAN, NAN);
}

- (ECEFCoordinate)initWithX:(double)a3 y:(double)a4 z:(double)a5
{
  objc_msgSend_setFromX_y_z_(self, a2, v5, v6, v7, a3, a4, a5);
  return self;
}

- (void)setFromX:(double)a3 y:(double)a4 z:(double)a5
{
  self->_x = a3;
  self->_y = a4;
  self->_z = a5;
}

- (id)initFromLatLon:(id)a3
{
  uint64_t v6 = objc_msgSend_fromLatLon_(ECEFCoordinate, a2, (uint64_t)a3, v3, v4);

  return v6;
}

+ (id)fromLatLon:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(ECEFCoordinate);
  objc_msgSend_setFromLatLon_(v4, v5, (uint64_t)v3, v6, v7);

  return v4;
}

- (void)setFromLatLon:(id)a3
{
  id v44 = a3;
  objc_msgSend_latitude(v44, v4, v5, v6, v7);
  double v9 = cos(v8 * 0.0174532925);
  objc_msgSend_latitude(v44, v10, v11, v12, v13);
  double v15 = sin(v14 * 0.0174532925);
  objc_msgSend_longitude(v44, v16, v17, v18, v19);
  double v21 = cos(v20 * 0.0174532925);
  objc_msgSend_longitude(v44, v22, v23, v24, v25);
  double v27 = sin(v26 * 0.0174532925);
  objc_msgSend_altitude(v44, v28, v29, v30, v31);
  double v32 = 6378137.0 / sqrt(v15 * -0.00669437999 * v15 + 1.0);
  self->_x = v21 * (v9 * (v32 + v33));
  objc_msgSend_altitude(v44, v34, v35, v36, v37);
  self->_y = v27 * (v9 * (v32 + v38));
  objc_msgSend_altitude(v44, v39, v40, v41, v42);
  self->_z = v15 * (v43 + v32 * 0.99330562);
}

- (point_xy<double,)toBoostEnuWithLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 usingENU:(id)a5
{
  id v8 = a5;
  objc_msgSend_setFromLatLonOrigin_andEcefOrigin_andEcefPoint_(v8, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)self);
  objc_msgSend_east(v8, v10, v11, v12, v13);
  double v15 = v14;
  objc_msgSend_north(v8, v16, v17, v18, v19);
  double v21 = v20;

  double v22 = v15;
  double v23 = v21;
  result.var0[1] = v23;
  result.var0[0] = v22;
  return result;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
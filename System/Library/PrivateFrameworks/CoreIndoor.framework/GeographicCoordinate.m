@interface GeographicCoordinate
+ (id)fromECEFCoordinate:(id)a3;
- (GeographicCoordinate)init;
- (GeographicCoordinate)initWithLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5;
- (double)altitude;
- (double)latitude;
- (double)longitude;
- (id)initFromECEFCoordinate:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setFromECEFCoordinate:(id)a3;
- (void)setFromLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation GeographicCoordinate

- (GeographicCoordinate)init
{
  v8.receiver = self;
  v8.super_class = (Class)GeographicCoordinate;
  v2 = [(GeographicCoordinate *)&v8 init];
  return (GeographicCoordinate *)objc_msgSend_initWithLatitude_longitude_andAltitude_(v2, v3, v4, v5, v6, NAN, NAN, NAN);
}

- (GeographicCoordinate)initWithLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  objc_msgSend_setFromLatitude_longitude_andAltitude_(self, a2, v5, v6, v7, a3, a4, a5);
  return self;
}

- (void)setFromLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  self->_latitude = a3;
  self->_longitude = a4;
  self->_altitude = a5;
}

+ (id)fromECEFCoordinate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(GeographicCoordinate);
  objc_msgSend_setFromECEFCoordinate_(v4, v5, (uint64_t)v3, v6, v7);

  return v4;
}

- (id)initFromECEFCoordinate:(id)a3
{
  uint64_t v6 = objc_msgSend_fromECEFCoordinate_(GeographicCoordinate, a2, (uint64_t)a3, v3, v4);

  return v6;
}

- (void)setFromECEFCoordinate:(id)a3
{
  id v60 = a3;
  objc_msgSend_x(v60, v4, v5, v6, v7);
  double v9 = v8;
  objc_msgSend_x(v60, v10, v11, v12, v13);
  double v15 = v14;
  objc_msgSend_y(v60, v16, v17, v18, v19);
  double v21 = v20;
  objc_msgSend_y(v60, v22, v23, v24, v25);
  double v27 = v26;
  objc_msgSend_y(v60, v28, v29, v30, v31);
  long double v33 = v32;
  objc_msgSend_x(v60, v34, v35, v36, v37);
  double v38 = sqrt(v21 * v27 + v9 * v15);
  self->_longitude = atan2(v33, v39) / 0.0174532925;
  double v44 = v38 * 0.99330562;
  double v45 = 0.0;
  double v46 = 1.57079633;
  if (v38 * 0.99330562 == 0.0)
  {
    v47 = v60;
  }
  else
  {
    unsigned int v48 = 0;
    double v49 = 0.0;
    double v50 = 0.0;
    objc_msgSend_z(v60, v40, v41, v42, v43, 0x3FF921FB54442D18);
    while (1)
    {
      double v46 = atan2(v51, v44);
      __double2 v56 = __sincos_stret(v46);
      double v57 = 6378137.0 / sqrt(v56.__sinval * -0.00669437999 * v56.__sinval + 1.0);
      double v45 = v38 / v56.__cosval - v57;
      if (vabdd_f64(v49, v46) >= 0.000001)
      {
        v47 = v60;
        if (v48 > 8) {
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v58 = vabdd_f64(v50, v45) < 0.001 || v48 >= 9;
        v47 = v60;
        if (v58) {
          goto LABEL_15;
        }
      }
      ++v48;
      double v44 = v38 * (v57 / (v45 + v57) * -0.00669437999 + 1.0);
      double v49 = v46;
      double v50 = v38 / v56.__cosval - v57;
      if (v44 == 0.0) {
        break;
      }
      objc_msgSend_z(v47, v52, v53, v54, v55, *(void *)&v59);
    }
    double v46 = v59;
  }
LABEL_15:
  self->_latitude = v46 / 0.0174532925;
  self->_altitude = v45;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

@end
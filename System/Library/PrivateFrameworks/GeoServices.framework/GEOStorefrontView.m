@interface GEOStorefrontView
- (GEOOrientedPosition)lookAt;
- (GEOStorefrontImagery)imageryInfo;
- (GEOStorefrontView)init;
- (GEOStorefrontView)initWithStorefrontView:(id)a3;
- (unint64_t)identifier;
@end

@implementation GEOStorefrontView

- (GEOStorefrontView)init
{
  result = (GEOStorefrontView *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOStorefrontView)initWithStorefrontView:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4
    || ([v4 hasLookAt] & 1) == 0 && (objc_msgSend(v5, "hasLookAtGeo") & 1) == 0
    || ![v5 hasPhotoPosition])
  {
    goto LABEL_18;
  }
  v40.receiver = self;
  v40.super_class = (Class)GEOStorefrontView;
  v6 = [(GEOStorefrontView *)&v40 init];
  self = v6;
  if (v6)
  {
    if ([v5 hasImdataId]) {
      uint64_t v7 = [v5 imdataId];
    }
    else {
      uint64_t v7 = 0;
    }
    v6->_identifier = v7;
    if ([v5 hasPhotoPosition])
    {
      v8 = [GEOStorefrontImagery alloc];
      v9 = [v5 photoPosition];
      uint64_t v10 = [(GEOStorefrontImagery *)v8 initWithPhotoPosition:v9];
      imageryInfo = v6->_imageryInfo;
      v6->_imageryInfo = (GEOStorefrontImagery *)v10;

      if (!v6->_imageryInfo) {
        goto LABEL_18;
      }
    }
    if ([v5 hasLookAt])
    {
      v12 = [v5 lookAt];
      char v13 = GEOOrientedPositionFromPDPosition(v12, (uint64_t)&v6->_lookAt);

      if ((v13 & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      if (![v5 hasLookAtGeo])
      {
LABEL_18:
        v6 = 0;
        goto LABEL_22;
      }
      id v14 = [v5 lookAtGeo];
      [v14 latitude];
      double v16 = v15;
      [v14 longitude];
      double v18 = v17;
      [v14 altitude];
      double v20 = v19;
      __double2 v21 = __sincos_stret(v16 * 0.00555555556 * 3.14159265);
      double v22 = 6378137.0 / sqrt(v21.__sinval * -0.00669437999 * v21.__sinval + 1.0);
      double v23 = v21.__cosval * (v22 + v20);
      __double2 v24 = __sincos_stret(v18 * 0.00555555556 * 3.14159265);

      self->_lookAt.position.double x = v24.__cosval * v23;
      self->_lookAt.position.double y = v24.__sinval * v23;
      self->_lookAt.position.double z = v21.__sinval * (v20 + v22 * 0.99330562);

      v25 = [v5 lookAtGeo];
      char v26 = [v25 hasAltitude];

      if ((v26 & 1) == 0)
      {
        v27 = self->_imageryInfo;
        if (v27)
        {
          [(GEOStorefrontImagery *)v27 position];
          double v28 = v37;
          double v29 = v38;
          double v30 = v39;
        }
        else
        {
          double v30 = 0.0;
          double v29 = 0.0;
          double v28 = 0.0;
        }
        double v31 = sqrt(v29 * v29 + v28 * v28 + v30 * v30);
        double x = self->_lookAt.position.x;
        double y = self->_lookAt.position.y;
        double z = self->_lookAt.position.z;
        double v35 = v31 / sqrt(y * y + x * x + z * z);
        self->_lookAt.position.double x = x * v35;
        self->_lookAt.position.double y = y * v35;
        self->_lookAt.position.double z = z * v35;
      }
    }
    self = self;
    v6 = self;
  }
LABEL_22:

  return v6;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (GEOStorefrontImagery)imageryInfo
{
  return self->_imageryInfo;
}

- (GEOOrientedPosition)lookAt
{
  long long v3 = *(_OWORD *)&self[1].position.x;
  *(_OWORD *)&retstr->position.double x = *(_OWORD *)&self->yaw;
  *(_OWORD *)&retstr->position.double z = v3;
  *(double *)&retstr->roll = self[1].position.z;
  return self;
}

- (void).cxx_destruct
{
}

@end
@interface MKLookAroundGroundViewInfo
- (BOOL)isHeadingInRange:(double)a3;
- (GEOLocationInfo)locationInfo;
- (MKLookAroundGroundViewInfo)initWithStartHeading:(double)a3 endHeading:(double)a4 localityName:(id)a5 locationName:(id)a6 secondaryLocationName:(id)a7;
- (double)endHeading;
- (double)startHeading;
@end

@implementation MKLookAroundGroundViewInfo

- (MKLookAroundGroundViewInfo)initWithStartHeading:(double)a3 endHeading:(double)a4 localityName:(id)a5 locationName:(id)a6 secondaryLocationName:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MKLookAroundGroundViewInfo;
  v15 = [(MKLookAroundGroundViewInfo *)&v23 init];
  v16 = v15;
  if (v15)
  {
    v15->_startHeading = a3;
    v15->_endHeading = a4;
    v17 = (GEOLocationInfo *)objc_alloc_init(MEMORY[0x1E4F64668]);
    locationInfo = v16->_locationInfo;
    v16->_locationInfo = v17;

    v19 = (void *)[v12 copy];
    [(GEOLocationInfo *)v16->_locationInfo setLocalityName:v19];

    v20 = (void *)[v13 copy];
    [(GEOLocationInfo *)v16->_locationInfo setLocationName:v20];

    v21 = (void *)[v14 copy];
    [(GEOLocationInfo *)v16->_locationInfo setSecondaryLocationName:v21];
  }
  return v16;
}

- (BOOL)isHeadingInRange:(double)a3
{
  [(MKLookAroundGroundViewInfo *)self startHeading];
  double v6 = v5;
  [(MKLookAroundGroundViewInfo *)self endHeading];
  if (v6 >= v7)
  {
    if (v6 <= v7) {
      return 0;
    }
    if (v6 <= a3 && v7 < a3) {
      return 1;
    }
    BOOL v8 = a3 >= 0.0;
  }
  else
  {
    BOOL v8 = v6 <= a3;
  }
  return v7 > a3 && v8;
}

- (double)startHeading
{
  return self->_startHeading;
}

- (double)endHeading
{
  return self->_endHeading;
}

- (GEOLocationInfo)locationInfo
{
  return self->_locationInfo;
}

- (void).cxx_destruct
{
}

@end
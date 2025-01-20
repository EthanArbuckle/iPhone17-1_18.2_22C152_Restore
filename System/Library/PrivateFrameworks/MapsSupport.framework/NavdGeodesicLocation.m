@interface NavdGeodesicLocation
- ($F24F406B2B787EFB06265DBA3D28CBD5)location;
- (NavdGeodesicLocation)initWithLocation:(id)a3 timeInterval:(double)a4;
- (double)distanceTo:(id)a3;
- (double)timeInterval;
@end

@implementation NavdGeodesicLocation

- (NavdGeodesicLocation)initWithLocation:(id)a3 timeInterval:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)NavdGeodesicLocation;
  result = [(NavdGeodesicLocation *)&v8 init];
  if (result)
  {
    result->_location.latitude = var0;
    result->_location.longitude = var1;
    result->_timeInterval = a4;
  }
  return result;
}

- (double)distanceTo:(id)a3
{
  GEOCalculateDistance();
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)location
{
  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

@end
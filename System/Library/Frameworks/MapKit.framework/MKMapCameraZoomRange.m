@interface MKMapCameraZoomRange
+ (BOOL)supportsSecureCoding;
- (BOOL)_bouncesZoom;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapCameraZoomRange:(id)a3;
- (CLLocationDistance)maxCenterCoordinateDistance;
- (CLLocationDistance)minCenterCoordinateDistance;
- (MKMapCameraZoomRange)init;
- (MKMapCameraZoomRange)initWithCoder:(id)a3;
- (MKMapCameraZoomRange)initWithMaxCenterCoordinateDistance:(CLLocationDistance)maxDistance;
- (MKMapCameraZoomRange)initWithMinCenterCoordinateDistance:(CLLocationDistance)minDistance;
- (MKMapCameraZoomRange)initWithMinCenterCoordinateDistance:(CLLocationDistance)minDistance maxCenterCoordinateDistance:(CLLocationDistance)maxDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setBouncesZoom:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKMapCameraZoomRange

- (MKMapCameraZoomRange)init
{
  return [(MKMapCameraZoomRange *)self initWithMinCenterCoordinateDistance:-1.0 maxCenterCoordinateDistance:-1.0];
}

- (MKMapCameraZoomRange)initWithMinCenterCoordinateDistance:(CLLocationDistance)minDistance maxCenterCoordinateDistance:(CLLocationDistance)maxDistance
{
  v12.receiver = self;
  v12.super_class = (Class)MKMapCameraZoomRange;
  v6 = [(MKMapCameraZoomRange *)&v12 init];
  v7 = v6;
  if (v6)
  {
    if (minDistance < 0.0 && fabs(minDistance + 1.0) >= 0.000001
      || (fabs(maxDistance + 1.0) >= 0.000001 ? (BOOL v8 = maxDistance < 0.0) : (BOOL v8 = 0),
          minDistance > maxDistance ? (BOOL v9 = maxDistance == -1.0) : (BOOL v9 = 1),
          !v9 || v8))
    {
      NSLog(&cfstr_UnableToCreate.isa, *(void *)&minDistance, *(void *)&maxDistance);
      v10 = 0;
      goto LABEL_16;
    }
    v6->_minCenterCoordinateDistance = minDistance;
    v6->_maxCenterCoordinateDistance = maxDistance;
    v6->_bouncesZoom = 0;
  }
  v10 = v6;
LABEL_16:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapCameraZoomRange)initWithMinCenterCoordinateDistance:(CLLocationDistance)minDistance
{
  return [(MKMapCameraZoomRange *)self initWithMinCenterCoordinateDistance:minDistance maxCenterCoordinateDistance:-1.0];
}

- (MKMapCameraZoomRange)initWithMaxCenterCoordinateDistance:(CLLocationDistance)maxDistance
{
  return [(MKMapCameraZoomRange *)self initWithMinCenterCoordinateDistance:-1.0 maxCenterCoordinateDistance:maxDistance];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) initWithMinCenterCoordinateDistance:self->_minCenterCoordinateDistance maxCenterCoordinateDistance:self->_maxCenterCoordinateDistance];
  v5 = v4;
  if (v4)
  {
    v4[8] = self->_bouncesZoom;
    v6 = v4;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(MKMapCameraZoomRange *)self isEqualToMapCameraZoomRange:v4]
    && v4[8] == self->_bouncesZoom;

  return v5;
}

- (BOOL)isEqualToMapCameraZoomRange:(id)a3
{
  id v4 = a3;
  double minCenterCoordinateDistance = self->_minCenterCoordinateDistance;
  [v4 minCenterCoordinateDistance];
  if (minCenterCoordinateDistance == v6
    && (double maxCenterCoordinateDistance = self->_maxCenterCoordinateDistance,
        [v4 maxCenterCoordinateDistance],
        maxCenterCoordinateDistance == v8))
  {
    int bouncesZoom = self->_bouncesZoom;
    BOOL v10 = bouncesZoom == [v4 _bouncesZoom];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"MKMapCameraZoomRangeMinDistance" forKey:self->_minCenterCoordinateDistance];
  [v4 encodeDouble:@"MKMapCameraZoomRangeMaxDistance" forKey:self->_maxCenterCoordinateDistance];
  if (self->_bouncesZoom) {
    [v4 encodeBool:1 forKey:@"MKMapCameraZoomRangeBouncesZoom"];
  }
}

- (MKMapCameraZoomRange)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"MKMapCameraZoomRangeMinDistance"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"MKMapCameraZoomRangeMaxDistance"];
  double v8 = v7;
  int v9 = [v4 decodeBoolForKey:@"MKMapCameraZoomRangeBouncesZoom"];

  BOOL v10 = [(MKMapCameraZoomRange *)self initWithMinCenterCoordinateDistance:v6 maxCenterCoordinateDistance:v8];
  v11 = v10;
  if (v9) {
    [(MKMapCameraZoomRange *)v10 _setBouncesZoom:1];
  }

  return v11;
}

- (CLLocationDistance)minCenterCoordinateDistance
{
  return self->_minCenterCoordinateDistance;
}

- (CLLocationDistance)maxCenterCoordinateDistance
{
  return self->_maxCenterCoordinateDistance;
}

- (BOOL)_bouncesZoom
{
  return self->_bouncesZoom;
}

- (void)_setBouncesZoom:(BOOL)a3
{
  self->_int bouncesZoom = a3;
}

@end
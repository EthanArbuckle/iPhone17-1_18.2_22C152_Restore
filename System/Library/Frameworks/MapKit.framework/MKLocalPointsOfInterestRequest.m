@interface MKLocalPointsOfInterestRequest
- ($DC1C8D958DDC8D67D0023B74A9319680)_clampedCoordinateRegionForCoordinateRegion:(SEL)a3;
- (BOOL)_createdFromRegion;
- (BOOL)_isValidCoordinateRegion:(id *)a3;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationDistance)radius;
- (MKCoordinateRegion)region;
- (MKLocalPointsOfInterestRequest)initWithCenterCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius;
- (MKLocalPointsOfInterestRequest)initWithCoordinateRegion:(MKCoordinateRegion)region;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (double)_deriveRadiusFromCoordinateRegion:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_maxResultCount;
- (void)_setMaxResultCount:(int64_t)a3;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
@end

@implementation MKLocalPointsOfInterestRequest

- (MKLocalPointsOfInterestRequest)initWithCenterCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v15.receiver = self;
  v15.super_class = (Class)MKLocalPointsOfInterestRequest;
  v7 = [(MKLocalPointsOfInterestRequest *)&v15 init];
  if (!v7) {
    goto LABEL_5;
  }
  v16.double latitude = latitude;
  v16.double longitude = longitude;
  if (!CLLocationCoordinate2DIsValid(v16))
  {
    v13 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&latitude, *(void *)&longitude];
    NSLog(&cfstr_InvalidCoordin_2.isa, v13);

LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (radius <= 0.0)
  {
    NSLog(&cfstr_InvalidRadiusP.isa, *(void *)&radius);
    goto LABEL_8;
  }
  v7->_coordinate.double latitude = latitude;
  v7->_coordinate.double longitude = longitude;
  v7->_radius = radius;
  v17.origin.x = MKMapRectMakeWithRadialDistance(latitude, longitude, radius);
  MKCoordinateRegion v18 = MKCoordinateRegionForMapRect(v17);
  -[MKLocalPointsOfInterestRequest _clampedCoordinateRegionForCoordinateRegion:](v7, "_clampedCoordinateRegionForCoordinateRegion:", v18.center.latitude, v18.center.longitude, v18.span.latitudeDelta, v18.span.longitudeDelta);
  v7->_region.center.double latitude = v8;
  v7->_region.center.double longitude = v9;
  v7->_region.span.latitudeDelta = v10;
  v7->_region.span.longitudeDelta = v11;
LABEL_5:
  v12 = v7;
LABEL_9:

  return v12;
}

- (MKLocalPointsOfInterestRequest)initWithCoordinateRegion:(MKCoordinateRegion)region
{
  double longitudeDelta = region.span.longitudeDelta;
  double latitudeDelta = region.span.latitudeDelta;
  double longitude = region.center.longitude;
  double latitude = region.center.latitude;
  v19.receiver = self;
  v19.super_class = (Class)MKLocalPointsOfInterestRequest;
  v7 = [(MKLocalPointsOfInterestRequest *)&v19 init];
  CLLocationDegrees v8 = v7;
  if (v7)
  {
    if (!-[MKLocalPointsOfInterestRequest _isValidCoordinateRegion:](v7, "_isValidCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta))
    {
      objc_super v15 = NSString;
      CLLocationCoordinate2D v16 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&latitude, *(void *)&longitude];
      MKMapRect v17 = [v15 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v16, *(void *)&latitudeDelta, *(void *)&longitudeDelta];

      NSLog(&cfstr_InvalidMkcoord_0.isa, v17);
      v14 = 0;
      goto LABEL_6;
    }
    -[MKLocalPointsOfInterestRequest _clampedCoordinateRegionForCoordinateRegion:](v8, "_clampedCoordinateRegionForCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
    v8->_region.center.double latitude = v9;
    v8->_region.center.double longitude = v10;
    v8->_region.span.double latitudeDelta = v11;
    v8->_region.span.double longitudeDelta = v12;
    v8->_createdFromRegion = 1;
    v8->_coordinate = v8->_region.center;
    -[MKLocalPointsOfInterestRequest _deriveRadiusFromCoordinateRegion:](v8, "_deriveRadiusFromCoordinateRegion:");
    v8->_radius = v13;
  }
  v14 = v8;
LABEL_6:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [(MKLocalPointsOfInterestRequest *)self _createdFromRegion];
  v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (v5) {
    uint64_t v7 = objc_msgSend(v6, "initWithCoordinateRegion:", self->_region.center.latitude, self->_region.center.longitude, self->_region.span.latitudeDelta, self->_region.span.longitudeDelta);
  }
  else {
    uint64_t v7 = objc_msgSend(v6, "initWithCenterCoordinate:radius:", self->_coordinate.latitude, self->_coordinate.longitude, self->_radius);
  }
  CLLocationDegrees v8 = (void *)v7;
  uint64_t v9 = [(MKPointOfInterestFilter *)self->_pointOfInterestFilter copy];
  CLLocationDegrees v10 = (void *)v8[3];
  v8[3] = v9;

  v8[4] = self->_maxResultCount;
  return v8;
}

- (BOOL)_isValidCoordinateRegion:(id *)a3
{
  BOOL result = 0;
  if (v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0) {
    return v3 <= 90.0;
  }
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)_clampedCoordinateRegionForCoordinateRegion:(SEL)a3
{
  return self;
}

- (double)_deriveRadiusFromCoordinateRegion:(id *)a3
{
  GEOMapRectForCoordinateRegion();
  BOOL v7 = v5 <= v6;
  double v8 = v3 + v5 * 0.5;
  double v9 = v4 + v6;
  double v10 = v6 * 0.5;
  double v11 = v4 + v10;
  double v12 = v3 + v5;
  if (v7)
  {
    double v12 = v8;
    double v13 = v9;
  }
  else
  {
    double v13 = v4 + v10;
  }
  if (v7) {
    double v3 = v8;
  }
  else {
    double v4 = v11;
  }
  return MKMetersBetweenMapPoints(*(MKMapPoint *)&v3, *(MKMapPoint *)&v12) * 0.5;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocationDistance)radius
{
  return self->_radius;
}

- (MKCoordinateRegion)region
{
  double latitude = self->_region.center.latitude;
  double longitude = self->_region.center.longitude;
  double latitudeDelta = self->_region.span.latitudeDelta;
  double longitudeDelta = self->_region.span.longitudeDelta;
  result.span.double longitudeDelta = longitudeDelta;
  result.span.double latitudeDelta = latitudeDelta;
  result.center.double longitude = longitude;
  result.center.double latitude = latitude;
  return result;
}

- (BOOL)_createdFromRegion
{
  return self->_createdFromRegion;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
}

- (int64_t)_maxResultCount
{
  return self->_maxResultCount;
}

- (void)_setMaxResultCount:(int64_t)a3
{
  self->_maxResultCount = a3;
}

- (void).cxx_destruct
{
}

@end
@interface MKCircle
+ (BOOL)supportsSecureCoding;
+ (MKCircle)circleWithCenterCoordinate:(CLLocationCoordinate2D)coord radius:(CLLocationDistance)radius;
+ (MKCircle)circleWithMapRect:(MKMapRect)mapRect;
- (BOOL)intersectsMapRect:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationDistance)radius;
- (MKCircle)initWithCoder:(id)a3;
- (MKMapRect)boundingMapRect;
- (id)_initWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKCircle

- (id)_initWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v13.receiver = self;
  v13.super_class = (Class)MKCircle;
  v7 = [(MKCircle *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_coordinate.double latitude = latitude;
    v7->_coordinate.double longitude = longitude;
    v7->_radius = a4;
    v7->_boundingMapRect.origin.x = MKMapRectMakeWithRadialDistance(latitude, longitude, a4);
    v8->_boundingMapRect.origin.y = v9;
    v8->_boundingMapRect.size.width = v10;
    v8->_boundingMapRect.size.height = v11;
  }
  return v8;
}

+ (MKCircle)circleWithCenterCoordinate:(CLLocationCoordinate2D)coord radius:(CLLocationDistance)radius
{
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCenterCoordinate:radius:", coord.latitude, coord.longitude, radius);

  return (MKCircle *)v4;
}

+ (MKCircle)circleWithMapRect:(MKMapRect)mapRect
{
  double height = mapRect.size.height;
  double width = mapRect.size.width;
  double y = mapRect.origin.y;
  double x = mapRect.origin.x;
  double v7 = mapRect.origin.x + mapRect.size.width * 0.5;
  double v8 = mapRect.origin.y + mapRect.size.height * 0.5;
  v18.double x = v7;
  v18.double y = v8;
  CLLocationCoordinate2D v9 = MKCoordinateForMapPoint(v18);
  if (width > height) {
    double v10 = x + width;
  }
  else {
    double v10 = v7;
  }
  if (width > height) {
    double v11 = x;
  }
  else {
    double v11 = v7;
  }
  if (width > height) {
    double v12 = v8;
  }
  else {
    double v12 = y + height;
  }
  if (width > height) {
    double v13 = v8;
  }
  else {
    double v13 = y;
  }
  CLLocationDistance v14 = MKMetersBetweenMapPoints(*(MKMapPoint *)&v11, *(MKMapPoint *)&v10) * 0.5;
  v15 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCenterCoordinate:radius:", v9.latitude, v9.longitude, v14);

  return (MKCircle *)v15;
}

- (BOOL)intersectsMapRect:(id)a3
{
  return MKMapRectIntersectsRect((MKMapRect)self->_boundingMapRect, (MKMapRect)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKCircle)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MKCircle;
  v5 = [(MKShape *)&v25 initWithCoder:v4];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKCircleLatitude"];
  double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKCircleLongitude"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKCircleRadius"];
  CLLocationCoordinate2D v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v8 != 0)
  {
    [v6 doubleValue];
    CLLocationDegrees v18 = v17;
    [v7 doubleValue];
    v5->_coordinate = CLLocationCoordinate2DMake(v18, v19);
    [v9 doubleValue];
    v5->_radius = v20;
    v5->_boundingMapRect.origin.double x = MKMapRectMakeWithRadialDistance(v5->_coordinate.latitude, v5->_coordinate.longitude, v20);
    v5->_boundingMapRect.origin.double y = v21;
    v5->_boundingMapRect.size.double width = v22;
    v5->_boundingMapRect.size.double height = v23;

LABEL_11:
    v16 = v5;
    goto LABEL_12;
  }
  double v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F281F8];
  uint64_t v26 = *MEMORY[0x1E4F28228];
  v27[0] = @"Expected circle data missing.";
  CLLocationDistance v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v15 = [v12 errorWithDomain:v13 code:4864 userInfo:v14];
  [v4 failWithError:v15];

  v16 = 0;
LABEL_12:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MKCircle;
  id v4 = a3;
  [(MKShape *)&v8 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithDouble:", self->_coordinate.latitude, v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"MKCircleLatitude"];

  v6 = [NSNumber numberWithDouble:self->_coordinate.longitude];
  [v4 encodeObject:v6 forKey:@"MKCircleLongitude"];

  double v7 = [NSNumber numberWithDouble:self->_radius];
  [v4 encodeObject:v7 forKey:@"MKCircleRadius"];
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

- (MKMapRect)boundingMapRect
{
  double x = self->_boundingMapRect.origin.x;
  double y = self->_boundingMapRect.origin.y;
  double width = self->_boundingMapRect.size.width;
  double height = self->_boundingMapRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end
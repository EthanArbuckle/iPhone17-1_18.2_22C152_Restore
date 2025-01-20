@interface RTLocationOfInterest
- ($E52F3E051E5C75A06C7E7E376FB84C16)bestFitMapRect;
- (CLLocationCoordinate2D)coordinate;
- (id)overlayColor;
- (id)polygon;
@end

@implementation RTLocationOfInterest

- (id)overlayColor
{
  return +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = [(RTLocationOfInterest *)self location];
  [v3 latitude];
  CLLocationDegrees v5 = v4;
  v6 = [(RTLocationOfInterest *)self location];
  [v6 longitude];
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v5, v7);

  double latitude = v8.latitude;
  double longitude = v8.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)polygon
{
  v2 = self;
  [(RTLocationOfInterest *)self coordinate];
  double v4 = v3;
  double v6 = v5;
  CLLocationDegrees v7 = [v2 location];
  [v7 horizontalUncertainty];
  double v9 = v8;
  if (v8 <= 1.0)
  {
    double v11 = 100.0;
  }
  else
  {
    v2 = [v2 location];
    [v2 horizontalUncertainty];
    double v11 = v10;
  }
  v12 = +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v4, v6, v11);
  if (v9 > 1.0) {

  }
  return v12;
}

- ($E52F3E051E5C75A06C7E7E376FB84C16)bestFitMapRect
{
  double y = MKMapRectNull.origin.y;
  double width = MKMapRectNull.size.width;
  double height = MKMapRectNull.size.height;
  double v5 = [(RTLocationOfInterest *)self polygon];
  [v5 boundingMapRect];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  double x = MKMapRectNull.origin.x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  uint64_t v21 = v13;

  return ($E52F3E051E5C75A06C7E7E376FB84C16)MKMapRectUnion(*(MKMapRect *)&x, *(MKMapRect *)&v18);
}

@end
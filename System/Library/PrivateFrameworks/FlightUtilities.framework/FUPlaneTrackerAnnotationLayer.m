@interface FUPlaneTrackerAnnotationLayer
- (CALayer)planeImageLayer;
- (CLLocationCoordinate2D)currentLocation;
- (CLLocationCoordinate2D)endLocation;
- (CLLocationCoordinate2D)geodesicLocationForStartPosition:(CLLocationCoordinate2D)a3 endPosition:(CLLocationCoordinate2D)a4 positionPercentage:(double)a5;
- (CLLocationCoordinate2D)startLocation;
- (FUPlaneTrackerAnnotationLayer)init;
- (double)defaultHeadingForStartPosition:(CLLocationCoordinate2D)a3 endPosition:(CLLocationCoordinate2D)a4 positionPercentage:(double)a5;
- (void)setEndLocation:(CLLocationCoordinate2D)a3;
- (void)setPlaneImage:(id)a3;
- (void)setPlaneImageLayer:(id)a3;
- (void)setStartLocation:(CLLocationCoordinate2D)a3;
- (void)updatePlaneStateForProgress:(double)a3;
@end

@implementation FUPlaneTrackerAnnotationLayer

- (void)setPlaneImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  [v4 size];
  double v8 = v7;
  id v14 = [(FUPlaneTrackerAnnotationLayer *)self planeImageLayer];
  objc_msgSend(v14, "setBounds:", 0.0, 0.0, v6, v8);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v6;
  v16.size.height = v8;
  double MidX = CGRectGetMidX(v16);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v6;
  v17.size.height = v8;
  objc_msgSend(v14, "setPosition:", MidX, CGRectGetMidY(v17));
  id v10 = objc_alloc_init(MEMORY[0x263F157E8]);
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v6, v8);
  id v11 = v4;
  uint64_t v12 = [v11 CGImage];

  [v10 setContents:v12];
  [v14 setMask:v10];
  id v13 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

  -[FUPlaneTrackerAnnotationLayer setBounds:](self, "setBounds:", 0.0, 0.0, v6, v8);
}

- (FUPlaneTrackerAnnotationLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)FUPlaneTrackerAnnotationLayer;
  v2 = [(FUPlaneTrackerAnnotationLayer *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F157E8] layer];
    [(FUPlaneTrackerAnnotationLayer *)v2 setPlaneImageLayer:v3];
    [(FUPlaneTrackerAnnotationLayer *)v2 addSublayer:v3];
  }
  return v2;
}

- (void)updatePlaneStateForProgress:(double)a3
{
  -[FUPlaneTrackerAnnotationLayer setCurrentProgress:](self, "setCurrentProgress:");
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(FUPlaneTrackerAnnotationLayer *)self startLocation];
  double v6 = v5;
  double v8 = v7;
  [(FUPlaneTrackerAnnotationLayer *)self endLocation];
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", v6, v8, v9, v10, a3);
  double v12 = v11;
  double v14 = v13;
  v15 = [(FUPlaneTrackerAnnotationLayer *)self delegate];
  objc_msgSend(v15, "setCoordinate:", v12, v14);

  [(FUPlaneTrackerAnnotationLayer *)self startLocation];
  double v17 = v16;
  double v19 = v18;
  [(FUPlaneTrackerAnnotationLayer *)self endLocation];
  -[FUPlaneTrackerAnnotationLayer defaultHeadingForStartPosition:endPosition:positionPercentage:](self, "defaultHeadingForStartPosition:endPosition:positionPercentage:", v17, v19, v20, v21, a3);
  CGAffineTransformMakeRotation(&v25, v22 * -0.0174532925);
  v23 = [(FUPlaneTrackerAnnotationLayer *)self planeImageLayer];
  CGAffineTransform v24 = v25;
  [v23 setAffineTransform:&v24];

  [MEMORY[0x263F158F8] commit];
}

- (CLLocationCoordinate2D)currentLocation
{
  [(FUPlaneTrackerAnnotationLayer *)self startLocation];
  double v4 = v3;
  double v6 = v5;
  [(FUPlaneTrackerAnnotationLayer *)self endLocation];
  double v8 = v7;
  double v10 = v9;
  [(FUPlaneTrackerAnnotationLayer *)self currentProgress];

  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", v4, v6, v8, v10, v11);
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (CLLocationCoordinate2D)geodesicLocationForStartPosition:(CLLocationCoordinate2D)a3 endPosition:(CLLocationCoordinate2D)a4 positionPercentage:(double)a5
{
  double v6 = a4.latitude * 0.0174532925;
  double v7 = a3.longitude * 0.0174532925;
  CLLocationDegrees v8 = a4.longitude * 0.0174532925;
  double v27 = a4.longitude * 0.0174532925;
  __double2 v9 = __sincos_stret(a3.latitude * 0.0174532925);
  __double2 v10 = __sincos_stret(v6);
  long double v11 = cos(v7 - v8);
  long double v12 = acos(v9.__cosval * v10.__cosval * v11 + v9.__sinval * v10.__sinval);
  double v13 = sin((1.0 - a5) * v12);
  double v14 = sin(v12);
  double v15 = v13 / v14;
  long double v16 = sin(v12 * a5) / v14;
  __double2 v17 = __sincos_stret(v7);
  __double2 v18 = __sincos_stret(v27);
  long double v19 = v18.__cosval * (v10.__cosval * v16) + v9.__cosval * v15 * v17.__cosval;
  long double v20 = v18.__sinval * (v10.__cosval * v16) + v9.__cosval * v15 * v17.__sinval;
  double v21 = atan2(v10.__sinval * v16 + v15 * v9.__sinval, sqrt(v20 * v20 + v19 * v19));
  long double v22 = atan2(v20, v19);
  CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v21 * 57.2957795, v22 * 57.2957795);
  double longitude = v24.longitude;
  CLLocationDegrees latitude = -84.99;
  if (v24.latitude >= -84.99)
  {
    CLLocationDegrees latitude = v24.latitude;
    if (v24.latitude > 84.99) {
      CLLocationDegrees latitude = 84.99;
    }
  }
  double v26 = latitude;
  result.double longitude = longitude;
  result.CLLocationDegrees latitude = v26;
  return result;
}

- (double)defaultHeadingForStartPosition:(CLLocationCoordinate2D)a3 endPosition:(CLLocationCoordinate2D)a4 positionPercentage:(double)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v7 = a3.longitude;
  double v8 = a3.latitude;
  if (a5 <= 0.99) {
    double v10 = a5 + 0.01;
  }
  else {
    double v10 = 1.0;
  }
  if (a5 > 0.99) {
    a5 = 0.99;
  }
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", a3.latitude, a3.longitude, a4.latitude, a4.longitude, a5);
  MKMapPoint v11 = MKMapPointForCoordinate(v17);
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", v8, v7, latitude, longitude, v10);
  MKMapPoint v12 = MKMapPointForCoordinate(v18);
  double v13 = v12.x - v11.x;
  double v14 = v12.y - v11.y;
  double v15 = sqrt(v14 * v14 + v13 * v13);
  double result = 0.0;
  if (v15 != 0.0) {
    return (atan2(v13 / v15, v14 / v15) + -1.57079633) * 57.2957795;
  }
  return result;
}

- (CLLocationCoordinate2D)startLocation
{
  double latitude = self->_startLocation.latitude;
  double longitude = self->_startLocation.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setStartLocation:(CLLocationCoordinate2D)a3
{
  self->_startLocation = a3;
}

- (CLLocationCoordinate2D)endLocation
{
  double latitude = self->_endLocation.latitude;
  double longitude = self->_endLocation.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setEndLocation:(CLLocationCoordinate2D)a3
{
  self->_endLocation = a3;
}

- (CALayer)planeImageLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planeImageLayer);

  return (CALayer *)WeakRetained;
}

- (void)setPlaneImageLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
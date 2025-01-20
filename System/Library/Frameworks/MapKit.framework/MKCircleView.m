@interface MKCircleView
- (MKCircleView)initWithCircle:(MKCircle *)circle;
- (void)createPath;
@end

@implementation MKCircleView

- (MKCircleView)initWithCircle:(MKCircle *)circle
{
  v4.receiver = self;
  v4.super_class = (Class)MKCircleView;
  return [(MKOverlayPathView *)&v4 initWithOverlay:circle];
}

- (void)createPath
{
  Mutable = CGPathCreateMutable();
  objc_super v4 = [(MKOverlayView *)self overlay];
  [v4 coordinate];
  CLLocationDegrees v6 = v5;
  CLLocationDegrees v8 = v7;

  v20.latitude = v6;
  v20.longitude = v8;
  MKMapPoint v9 = MKMapPointForCoordinate(v20);
  -[MKOverlayView pointForMapPoint:](self, "pointForMapPoint:", v9.x, v9.y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  GEOMapPointsPerMeterAtLatitude();
  double v15 = v14;
  v16 = [(MKOverlayView *)self overlay];
  [v16 radius];
  CGFloat v18 = v15 * v17;

  CGPathAddArc(Mutable, 0, v11, v13, v18, 0.0, 6.28318531, 1);
  [(MKOverlayPathView *)self setPath:Mutable];

  CGPathRelease(Mutable);
}

@end
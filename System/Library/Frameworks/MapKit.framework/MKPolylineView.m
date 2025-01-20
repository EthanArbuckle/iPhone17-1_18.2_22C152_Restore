@interface MKPolylineView
- (void)createPath;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation MKPolylineView

- (void)createPath
{
  [(MKOverlayView *)self _originMapPoint];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(MKOverlayView *)self overlay];
  v8 = (double *)[v7 points];

  v9 = [(MKOverlayView *)self overlay];
  unint64_t v10 = [v9 pointCount];

  if (v10 >= 2)
  {
    Mutable = CGPathCreateMutable();
    double v13 = *v8;
    double v14 = v8[1];
    v12 = v8 + 3;
    CGPathMoveToPoint(Mutable, 0, v13 - v4, v14 - v6);
    unint64_t v15 = v10 - 1;
    do
    {
      CGPathAddLineToPoint(Mutable, 0, *(v12 - 1) - v4, *v12 - v6);
      v12 += 2;
      --v15;
    }
    while (v15);
    [(MKOverlayPathView *)self setPath:Mutable];
    CGPathRelease(Mutable);
  }
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  id v8 = [(MKOverlayView *)self overlay];
  v9 = (double *)[v8 points];
  unint64_t v10 = [(MKOverlayView *)self overlay];
  unint64_t v11 = [v10 pointCount];
  [(MKOverlayView *)self _originMapPoint];
  double v13 = v12;
  double v15 = v14;
  Mutable = CGPathCreateMutable();
  _MKPolylineAddToPath(Mutable, v9, v11, v13, v15, a4, 0.0, 1.0, -1.0);

  if (Mutable && !CGPathIsEmpty(Mutable))
  {
    [(MKOverlayPathView *)self applyStrokePropertiesToContext:a5 atZoomScale:a4];
    [(MKOverlayPathView *)self strokePath:Mutable inContext:a5];
  }

  CGPathRelease(Mutable);
}

@end
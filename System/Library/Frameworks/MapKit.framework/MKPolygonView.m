@interface MKPolygonView
- (MKPolygonView)initWithPolygon:(MKPolygon *)polygon;
- (void)createPath;
- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4;
@end

@implementation MKPolygonView

- (MKPolygonView)initWithPolygon:(MKPolygon *)polygon
{
  v4.receiver = self;
  v4.super_class = (Class)MKPolygonView;
  return [(MKOverlayPathView *)&v4 initWithOverlay:polygon];
}

- (void)createPath
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(MKOverlayView *)self _originMapPoint];
  double v4 = v3;
  double v6 = v5;
  v7 = [(MKOverlayView *)self overlay];
  PathForPolygon = CreatePathForPolygon(v7, v4, v6);

  v9 = [(MKOverlayView *)self overlay];
  v10 = [v9 interiorPolygons];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = CreatePathForPolygon(*(void **)(*((void *)&v18 + 1) + 8 * v15), v4, v6);
        if (v16)
        {
          v17 = v16;
          CGPathAddPath(PathForPolygon, 0, v16);
          CGPathRelease(v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  -[MKOverlayPathView setPath:](self, "setPath:", PathForPolygon, (void)v18);
  CGPathRelease(PathForPolygon);
}

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  double v6 = [(MKOverlayPathView *)self fillColor];

  if (a3 && v6)
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextDrawPath(a4, kCGPathEOFill);
  }
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  double v6 = [(MKOverlayPathView *)self strokeColor];

  if (a3 && v6)
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextStrokePath(a4);
  }
}

@end
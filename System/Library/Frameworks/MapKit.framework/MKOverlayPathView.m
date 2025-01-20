@interface MKOverlayPathView
- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4;
- (CGFloat)lineDashPhase;
- (CGFloat)lineWidth;
- (CGFloat)miterLimit;
- (CGLineCap)lineCap;
- (CGLineJoin)lineJoin;
- (CGPathRef)path;
- (MKOverlayPathView)initWithOverlay:(id)a3;
- (NSArray)lineDashPattern;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (void)applyFillPropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale;
- (void)applyStrokePropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale;
- (void)dealloc;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
- (void)fillPath:(CGPathRef)path inContext:(CGContextRef)context;
- (void)invalidatePath;
- (void)setFillColor:(UIColor *)fillColor;
- (void)setLineCap:(CGLineCap)lineCap;
- (void)setLineDashPattern:(NSArray *)lineDashPattern;
- (void)setLineDashPhase:(CGFloat)lineDashPhase;
- (void)setLineJoin:(CGLineJoin)lineJoin;
- (void)setLineWidth:(CGFloat)lineWidth;
- (void)setMiterLimit:(CGFloat)miterLimit;
- (void)setPath:(CGPathRef)path;
- (void)setStrokeColor:(UIColor *)strokeColor;
- (void)strokePath:(CGPathRef)path inContext:(CGContextRef)context;
@end

@implementation MKOverlayPathView

- (void)setFillColor:(UIColor *)fillColor
{
  v7 = fillColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fillColor != v7)
  {
    [(MKOverlayPathView *)v5 willChangeValueForKey:@"setFillColor"];
    objc_storeStrong((id *)&v5->_fillColor, fillColor);
    v6 = [(MKOverlayView *)v5 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)v5 didChangeValueForKey:@"setFillColor"];
  }
  objc_sync_exit(v5);
}

- (UIColor)fillColor
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fillColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  v7 = strokeColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_strokeColor != v7)
  {
    [(MKOverlayPathView *)v5 willChangeValueForKey:@"setStrokeColor"];
    objc_storeStrong((id *)&v5->_strokeColor, strokeColor);
    v6 = [(MKOverlayView *)v5 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)v5 didChangeValueForKey:@"setStrokeColor"];
  }
  objc_sync_exit(v5);
}

- (UIColor)strokeColor
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_strokeColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineWidth != lineWidth)
  {
    [(MKOverlayPathView *)obj willChangeValueForKey:@"setLineWidth"];
    obj->_lineWidth = lineWidth;
    v4 = [(MKOverlayView *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)obj didChangeValueForKey:@"setLineWidth"];
  }
  objc_sync_exit(obj);
}

- (CGFloat)lineWidth
{
  v2 = self;
  objc_sync_enter(v2);
  double lineWidth = v2->_lineWidth;
  objc_sync_exit(v2);

  return lineWidth;
}

- (void)setLineJoin:(CGLineJoin)lineJoin
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineJoin != lineJoin)
  {
    [(MKOverlayPathView *)obj willChangeValueForKey:@"setLineJoin"];
    obj->_lineJoin = lineJoin;
    v4 = [(MKOverlayView *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)obj didChangeValueForKey:@"setLineJoin"];
  }
  objc_sync_exit(obj);
}

- (CGLineJoin)lineJoin
{
  v2 = self;
  objc_sync_enter(v2);
  CGLineJoin lineJoin = v2->_lineJoin;
  objc_sync_exit(v2);

  return lineJoin;
}

- (void)setLineCap:(CGLineCap)lineCap
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineCap != lineCap)
  {
    [(MKOverlayPathView *)obj willChangeValueForKey:@"setLineCap"];
    obj->_lineCap = lineCap;
    v4 = [(MKOverlayView *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)obj didChangeValueForKey:@"setLineCap"];
  }
  objc_sync_exit(obj);
}

- (CGLineCap)lineCap
{
  v2 = self;
  objc_sync_enter(v2);
  CGLineCap lineCap = v2->_lineCap;
  objc_sync_exit(v2);

  return lineCap;
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_miterLimit != miterLimit)
  {
    [(MKOverlayPathView *)obj willChangeValueForKey:@"setMiterLimit"];
    obj->_miterLimit = miterLimit;
    v4 = [(MKOverlayView *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)obj didChangeValueForKey:@"setMiterLimit"];
  }
  objc_sync_exit(obj);
}

- (CGFloat)miterLimit
{
  v2 = self;
  objc_sync_enter(v2);
  double miterLimit = v2->_miterLimit;
  objc_sync_exit(v2);

  return miterLimit;
}

- (void)setLineDashPhase:(CGFloat)lineDashPhase
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineDashPhase != lineDashPhase)
  {
    [(MKOverlayPathView *)obj willChangeValueForKey:@"setLineDashPhase"];
    obj->_lineDashPhase = lineDashPhase;
    v4 = [(MKOverlayView *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathView *)obj didChangeValueForKey:@"setLineDashPhase"];
  }
  objc_sync_exit(obj);
}

- (CGFloat)lineDashPhase
{
  v2 = self;
  objc_sync_enter(v2);
  double lineDashPhase = v2->_lineDashPhase;
  objc_sync_exit(v2);

  return lineDashPhase;
}

- (MKOverlayPathView)initWithOverlay:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKOverlayPathView;
  v3 = [(MKOverlayView *)&v6 initWithOverlay:a3];
  v4 = v3;
  if (v3)
  {
    [(MKOverlayPathView *)v3 setLineJoin:1];
    [(MKOverlayPathView *)v4 setLineCap:1];
    [(MKOverlayPathView *)v4 _performInitialConfiguration];
  }
  return v4;
}

- (CGPathRef)path
{
  v2 = self;
  objc_sync_enter(v2);
  path = v2->_path;
  if (!path)
  {
    [(MKOverlayPathView *)v2 createPath];
    path = v2->_path;
  }
  objc_sync_exit(v2);

  return path;
}

- (void)setPath:(CGPathRef)path
{
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  v5 = obj->_path;
  if (v5 != path)
  {
    CGPathRelease(v5);
    CGPathRef v6 = CGPathRetain(path);
    v4 = obj;
    obj->_path = v6;
  }
  objc_sync_exit(v4);
}

- (void)invalidatePath
{
  [(MKOverlayPathView *)self setPath:0];

  [(MKOverlayView *)self setNeedsDisplay];
}

- (NSArray)lineDashPattern
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lineDashPattern;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
  v7 = lineDashPattern;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_lineDashPattern != v7)
  {
    [(MKOverlayPathView *)v4 willChangeValueForKey:@"lineDashPattern"];
    uint64_t v5 = [(NSArray *)v7 copy];
    CGPathRef v6 = v4->_lineDashPattern;
    v4->_lineDashPattern = (NSArray *)v5;

    [(MKOverlayView *)v4 setNeedsDisplay];
    [(MKOverlayPathView *)v4 didChangeValueForKey:@"lineDashPattern"];
  }
  objc_sync_exit(v4);
}

- (void)applyStrokePropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v7 = [(MKOverlayPathView *)self strokeColor];

  if (v7)
  {
    id v8 = [(MKOverlayPathView *)self strokeColor];
    CGContextSetStrokeColorWithColor(context, (CGColorRef)[v8 CGColor]);

    [(MKOverlayPathView *)self contentScaleFactor];
    double v10 = v9;
    [(MKOverlayPathView *)self lineWidth];
    double v12 = v11;
    CGLineJoin v13 = [(MKOverlayPathView *)self lineJoin];
    CGLineCap v14 = [(MKOverlayPathView *)self lineCap];
    [(MKOverlayPathView *)self miterLimit];
    if (v15 <= 0.0) {
      double v16 = 10.0;
    }
    else {
      double v16 = v15;
    }
    BOOL v17 = _MKLinkedOnOrAfterReleaseSet(2310);
    double v18 = 1.0;
    if (!v17) {
      double v18 = zoomScale;
    }
    double v19 = v16 / v18;
    [(MKOverlayPathView *)self lineDashPhase];
    double v21 = v20;
    v22 = [(MKOverlayPathView *)self lineDashPattern];
    if (v12 <= 0.0)
    {
      uint64_t v23 = vcvtmd_s64_f64(log2(zoomScale) + 0.5);
      if (v23 >= -21) {
        uint64_t v24 = (v23 & (v23 >> 63)) + 21;
      }
      else {
        uint64_t v24 = 0;
      }
      double v12 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v24];
    }
    CGContextSetLineWidth(context, v10 * (v12 / zoomScale));
    CGContextSetLineJoin(context, v13);
    CGContextSetLineCap(context, v14);
    CGContextSetMiterLimit(context, v10 * v19);
    if (v22)
    {
      double v25 = v21 / zoomScale;
      size_t v26 = [v22 count];
      v27 = (CGFloat *)malloc_type_malloc(8 * v26, 0x100004000313F17uLL);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v28 = v22;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v36;
        do
        {
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v36 != v32) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v33), "cgFloatValue", (void)v35);
            v27[v31 + v33++] = v10 * (v34 / zoomScale);
          }
          while (v30 != v33);
          uint64_t v30 = [v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
          v31 += v33;
        }
        while (v30);
      }

      CGContextSetLineDash(context, v25, v27, v26);
      free(v27);
    }
  }
}

- (void)applyFillPropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale
{
  CGPathRef v6 = [(MKOverlayPathView *)self fillColor];

  if (v6)
  {
    id v7 = [(MKOverlayPathView *)self fillColor];
    CGContextSetFillColorWithColor(context, (CGColorRef)[v7 CGColor]);
  }
}

- (void)strokePath:(CGPathRef)path inContext:(CGContextRef)context
{
  if (path && self->_strokeColor)
  {
    CGContextBeginPath(context);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
  }
}

- (void)fillPath:(CGPathRef)path inContext:(CGContextRef)context
{
  if (path && self->_fillColor)
  {
    CGContextBeginPath(context);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
  }
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  id v7 = self;
  objc_sync_enter(v7);
  if (v7->_path || ([(MKOverlayPathView *)v7 createPath], v7->_path))
  {
    id v8 = (const CGPath *)MEMORY[0x18C138850]();
    char v9 = 0;
  }
  else
  {
    id v8 = 0;
    char v9 = 1;
  }
  objc_sync_exit(v7);

  if ((v9 & 1) == 0 && v8)
  {
    [(MKOverlayPathView *)v7 applyFillPropertiesToContext:a5 atZoomScale:a4];
    [(MKOverlayPathView *)v7 fillPath:v8 inContext:a5];
    [(MKOverlayPathView *)v7 applyStrokePropertiesToContext:a5 atZoomScale:a4];
    [(MKOverlayPathView *)v7 strokePath:v8 inContext:a5];
    CGPathRelease(v8);
  }
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double rect2 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double var1 = a3.var0.var1;
  double v7 = a3.var0.var0;
  char v9 = [(MKOverlayView *)self overlay];
  [v9 boundingMapRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(MKOverlayPathView *)self strokeColor];

  if (v18)
  {
    [(MKOverlayPathView *)self lineWidth];
    if (v19 <= 0.0)
    {
      uint64_t v20 = vcvtmd_s64_f64(log2(a4) + 0.5);
      if (v20 >= -21) {
        uint64_t v21 = (v20 & (v20 >> 63)) + 21;
      }
      else {
        uint64_t v21 = 0;
      }
      double v19 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v21];
    }
    double v22 = INFINITY;
    if (v11 != INFINITY || (double v23 = INFINITY, v13 != INFINITY))
    {
      double v24 = v19 / a4;
      double v23 = v11 - v24;
      double v22 = v13 - v24;
      double v15 = v15 + v24 * 2.0;
      double v17 = v17 + v24 * 2.0;
    }
  }
  else
  {
    double v22 = v13;
    double v23 = v11;
  }
  double v25 = v23;
  double v26 = v15;
  double v27 = v17;
  double v28 = v7;
  double v29 = var1;
  double v30 = var0;
  double v31 = rect2;

  return MKMapRectIntersectsRect(*(MKMapRect *)(&v22 - 1), *(MKMapRect *)&v28);
}

- (void)dealloc
{
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)MKOverlayPathView;
  [(MKOverlayView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineDashPattern, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
@interface MKOverlayPathRenderer
+ (BOOL)_externalSubclassOverridesDrawingMethods;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (BOOL)_externalSubclassOverridesDrawingMethods;
- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4;
- (BOOL)shouldRasterize;
- (CGFloat)lineDashPhase;
- (CGFloat)lineWidth;
- (CGFloat)miterLimit;
- (CGLineCap)lineCap;
- (CGLineJoin)lineJoin;
- (CGPathRef)path;
- (MKOverlayPathRenderer)initWithOverlay:(id)a3;
- (MKUsageCounter)_usageCounter;
- (NSArray)lineDashPattern;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (void)_animateVectorGeometryIfNecessaryForKey:(id)a3 withStepHandler:(id)a4;
- (void)_decodePropertiesWithCoder:(id)a3;
- (void)_encodePropertiesWithCoder:(id)a3;
- (void)_performInitialConfiguration;
- (void)_setUsageCounter:(id)a3;
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
- (void)setShouldRasterize:(BOOL)shouldRasterize;
- (void)setStrokeColor:(UIColor *)strokeColor;
- (void)strokePath:(CGPathRef)path inContext:(CGContextRef)context;
@end

@implementation MKOverlayPathRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_externalSubclassOverridesDrawingMethods
{
  uint64_t v3 = [a1 _mapkitLeafClass];
  if (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_drawMapRect_zoomScale_inContext_, v3) & 1) != 0|| (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_applyStrokePropertiesToContext_atZoomScale_, v3) & 1) != 0|| (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_applyFillPropertiesToContext_atZoomScale_, v3) & 1) != 0|| (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_strokePath_inContext_, v3))
  {
    return 1;
  }

  return objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_fillPath_inContext_, v3);
}

- (BOOL)_canProvideVectorGeometry
{
  return 0;
}

- (void)_performInitialConfiguration
{
  self->_externalSubclassOverridesDrawingMethods = [(id)objc_opt_class() _externalSubclassOverridesDrawingMethods];
  self->_runningVectorGeometryAnimationsLock._os_unfair_lock_opaque = 0;
}

- (void)setShouldRasterize:(BOOL)shouldRasterize
{
  BOOL v3 = shouldRasterize;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_shouldRasterize != v3)
  {
    obj->_shouldRasterize = v3;
    [(MKOverlayRenderer *)obj setNeedsDisplay];
    id WeakRetained = objc_loadWeakRetained((id *)&obj->_usageCounter);

    v4 = obj;
    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&obj->_usageCounter);
      [v6 countUsageOfTypeIfNeeded:53];

      v4 = obj;
    }
  }
  objc_sync_exit(v4);
}

- (void)_animateVectorGeometryIfNecessaryForKey:(id)a3 withStepHandler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(void, float))a4;
  if ([(MKOverlayPathRenderer *)self _canProvideVectorGeometry]) {
    [(MKOverlayRenderer *)self _animateIfNecessaryForKey:v7 withStepHandler:v6];
  }
  else {
    v6[2](v6, 1.0);
  }
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MKOverlayPathRenderer;
  [(MKOverlayRenderer *)&v26 _decodePropertiesWithCoder:v4];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathRendererStrokeColor"];
  strokeColor = self->_strokeColor;
  self->_strokeColor = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathRendererFillColor"];
  fillColor = self->_fillColor;
  self->_fillColor = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathLineWidth"];
  v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    self->_lineWidth = v11;
  }
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathRendererLineJoin"];
  v13 = v12;
  if (v12) {
    self->_lineJoin = [v12 integerValue];
  }
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathRendererLineCap"];
  v15 = v14;
  if (v14) {
    self->_lineCap = [v14 integerValue];
  }
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathRendererMiterLimit"];
  v17 = v16;
  if (v16)
  {
    [v16 doubleValue];
    self->_miterLimit = v18;
  }
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKOverlayPathRendererLineDashPhase"];
  v20 = v19;
  if (v19)
  {
    [v19 doubleValue];
    self->_lineDashPhase = v21;
  }
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v25 = [v4 decodeObjectOfClasses:v24 forKey:@"MKOverlayPathRendererLineDashPattern"];
  if (v25) {
    objc_storeStrong((id *)&self->_lineDashPattern, v25);
  }
}

- (void)_encodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKOverlayPathRenderer;
  [(MKOverlayRenderer *)&v13 _encodePropertiesWithCoder:v4];
  strokeColor = self->_strokeColor;
  if (strokeColor) {
    [v4 encodeObject:strokeColor forKey:@"MKOverlayPathRendererStrokeColor"];
  }
  fillColor = self->_fillColor;
  if (fillColor) {
    [v4 encodeObject:fillColor forKey:@"MKOverlayPathRendererFillColor"];
  }
  id v7 = [NSNumber numberWithDouble:self->_lineWidth];
  [v4 encodeObject:v7 forKey:@"MKOverlayPathLineWidth"];

  v8 = [NSNumber numberWithInt:self->_lineJoin];
  [v4 encodeObject:v8 forKey:@"MKOverlayPathRendererLineJoin"];

  v9 = [NSNumber numberWithInt:self->_lineCap];
  [v4 encodeObject:v9 forKey:@"MKOverlayPathRendererLineCap"];

  v10 = [NSNumber numberWithDouble:self->_miterLimit];
  [v4 encodeObject:v10 forKey:@"MKOverlayPathRendererMiterLimit"];

  double v11 = [NSNumber numberWithDouble:self->_lineDashPhase];
  [v4 encodeObject:v11 forKey:@"MKOverlayPathRendererLineDashPhase"];

  lineDashPattern = self->_lineDashPattern;
  if (lineDashPattern) {
    [v4 encodeObject:lineDashPattern forKey:@"MKOverlayPathRendererLineDashPattern"];
  }
}

- (void)setFillColor:(UIColor *)fillColor
{
  id v7 = fillColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fillColor != v7)
  {
    [(MKOverlayPathRenderer *)v5 willChangeValueForKey:@"setFillColor"];
    objc_storeStrong((id *)&v5->_fillColor, fillColor);
    id v6 = [(MKOverlayRenderer *)v5 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)v5 didChangeValueForKey:@"setFillColor"];
  }
  objc_sync_exit(v5);
}

- (UIColor)fillColor
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_fillColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  id v7 = strokeColor;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_strokeColor != v7)
  {
    [(MKOverlayPathRenderer *)v5 willChangeValueForKey:@"setStrokeColor"];
    objc_storeStrong((id *)&v5->_strokeColor, strokeColor);
    id v6 = [(MKOverlayRenderer *)v5 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)v5 didChangeValueForKey:@"setStrokeColor"];
  }
  objc_sync_exit(v5);
}

- (UIColor)strokeColor
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_strokeColor;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lineWidth != lineWidth)
  {
    [(MKOverlayPathRenderer *)obj willChangeValueForKey:@"setLineWidth"];
    obj->_lineWidth = lineWidth;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)obj didChangeValueForKey:@"setLineWidth"];
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
    [(MKOverlayPathRenderer *)obj willChangeValueForKey:@"setLineJoin"];
    obj->_lineJoin = lineJoin;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)obj didChangeValueForKey:@"setLineJoin"];
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
    [(MKOverlayPathRenderer *)obj willChangeValueForKey:@"setLineCap"];
    obj->_lineCap = lineCap;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)obj didChangeValueForKey:@"setLineCap"];
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
    [(MKOverlayPathRenderer *)obj willChangeValueForKey:@"setMiterLimit"];
    obj->_miterLimit = miterLimit;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)obj didChangeValueForKey:@"setMiterLimit"];
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
    [(MKOverlayPathRenderer *)obj willChangeValueForKey:@"setLineDashPhase"];
    obj->_lineDashPhase = lineDashPhase;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKOverlayPathRenderer *)obj didChangeValueForKey:@"setLineDashPhase"];
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

- (MKOverlayPathRenderer)initWithOverlay:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKOverlayPathRenderer;
  BOOL v3 = [(MKOverlayRenderer *)&v6 initWithOverlay:a3];
  id v4 = v3;
  if (v3)
  {
    [(MKOverlayPathRenderer *)v3 setLineJoin:1];
    [(MKOverlayPathRenderer *)v4 setLineCap:1];
    [(MKOverlayPathRenderer *)v4 _performInitialConfiguration];
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
    [(MKOverlayPathRenderer *)v2 createPath];
    path = v2->_path;
  }
  objc_sync_exit(v2);

  return path;
}

- (void)setPath:(CGPathRef)path
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  v5 = obj->_path;
  if (v5 != path)
  {
    CGPathRelease(v5);
    CGPathRef v6 = CGPathRetain(path);
    id v4 = obj;
    obj->_path = v6;
  }
  objc_sync_exit(v4);
}

- (void)invalidatePath
{
  [(MKOverlayPathRenderer *)self setPath:0];

  [(MKOverlayRenderer *)self setNeedsDisplay];
}

- (NSArray)lineDashPattern
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lineDashPattern;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
  id v7 = lineDashPattern;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_lineDashPattern != v7)
  {
    [(MKOverlayPathRenderer *)v4 willChangeValueForKey:@"lineDashPattern"];
    uint64_t v5 = [(NSArray *)v7 copy];
    CGPathRef v6 = v4->_lineDashPattern;
    v4->_lineDashPattern = (NSArray *)v5;

    [(MKOverlayRenderer *)v4 setNeedsDisplay];
    [(MKOverlayPathRenderer *)v4 didChangeValueForKey:@"lineDashPattern"];
  }
  objc_sync_exit(v4);
}

- (void)applyStrokePropertiesToContext:(CGContextRef)context atZoomScale:(MKZoomScale)zoomScale
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = [(MKOverlayPathRenderer *)self strokeColor];

  if (v7)
  {
    id v8 = [(MKOverlayPathRenderer *)self strokeColor];
    CGContextSetStrokeColorWithColor(context, (CGColorRef)[v8 CGColor]);

    [(MKOverlayRenderer *)self contentScaleFactor];
    double v10 = v9;
    [(MKOverlayPathRenderer *)self lineWidth];
    double v12 = v11;
    CGLineJoin v13 = [(MKOverlayPathRenderer *)self lineJoin];
    CGLineCap v14 = [(MKOverlayPathRenderer *)self lineCap];
    [(MKOverlayPathRenderer *)self miterLimit];
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
    [(MKOverlayPathRenderer *)self lineDashPhase];
    double v21 = v20;
    v22 = [(MKOverlayPathRenderer *)self lineDashPattern];
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
  CGPathRef v6 = [(MKOverlayPathRenderer *)self fillColor];

  if (v6)
  {
    id v7 = [(MKOverlayPathRenderer *)self fillColor];
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
  if (v7->_path || ([(MKOverlayPathRenderer *)v7 createPath], v7->_path))
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
    [(MKOverlayPathRenderer *)v7 applyFillPropertiesToContext:a5 atZoomScale:a4];
    [(MKOverlayPathRenderer *)v7 fillPath:v8 inContext:a5];
    [(MKOverlayPathRenderer *)v7 applyStrokePropertiesToContext:a5 atZoomScale:a4];
    [(MKOverlayPathRenderer *)v7 strokePath:v8 inContext:a5];
    CGPathRelease(v8);
  }
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double rect2 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double var1 = a3.var0.var1;
  double v7 = a3.var0.var0;
  char v9 = [(MKOverlayRenderer *)self overlay];
  [v9 boundingMapRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(MKOverlayPathRenderer *)self strokeColor];

  if (v18)
  {
    [(MKOverlayPathRenderer *)self lineWidth];
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
  v3.super_class = (Class)MKOverlayPathRenderer;
  [(MKOverlayRenderer *)&v3 dealloc];
}

- (BOOL)_externalSubclassOverridesDrawingMethods
{
  return self->_externalSubclassOverridesDrawingMethods;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (MKUsageCounter)_usageCounter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);

  return (MKUsageCounter *)WeakRetained;
}

- (void)_setUsageCounter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_usageCounter);
  objc_storeStrong((id *)&self->_runningVectorGeometryAnimations, 0);
  objc_storeStrong((id *)&self->_lineDashPattern, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
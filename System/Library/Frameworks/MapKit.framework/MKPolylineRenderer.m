@interface MKPolylineRenderer
+ (BOOL)supportsSecureCoding;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (CGFloat)strokeEnd;
- (CGFloat)strokeStart;
- (MKPolylineRenderer)initWithCoder:(id)a3;
- (id)_vectorGeometry;
- (id)vectorDataForOverlay:(id)a3;
- (void)_decodePropertiesWithCoder:(id)a3;
- (void)_performInitialConfiguration;
- (void)_setNeedsVectorGeometryUpdate;
- (void)_updateRenderColors;
- (void)_updateVectorGeometry:(id)a3;
- (void)createPath;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setLineCap:(int)a3;
- (void)setLineJoin:(int)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeEnd:(CGFloat)strokeEnd;
- (void)setStrokeStart:(CGFloat)strokeStart;
@end

@implementation MKPolylineRenderer

- (void)createPath
{
  [(MKOverlayRenderer *)self _originMapPoint];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(MKOverlayRenderer *)self overlay];
  v8 = (double *)[v7 points];

  v9 = [(MKOverlayRenderer *)self overlay];
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
    [(MKOverlayPathRenderer *)self setPath:Mutable];
    CGPathRelease(Mutable);
  }
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  [(MKPolylineRenderer *)self strokeStart];
  double v9 = v8;
  [(MKPolylineRenderer *)self strokeEnd];
  double v11 = v10;
  if (vabdd_f64(v9, v10) >= 0.00000011920929)
  {
    id v12 = [(MKOverlayRenderer *)self overlay];
    double v13 = (double *)[v12 points];
    double v14 = [(MKOverlayRenderer *)self overlay];
    unint64_t v15 = [v14 pointCount];
    [(MKOverlayRenderer *)self _originMapPoint];
    double v17 = v16;
    double v19 = v18;
    Mutable = CGPathCreateMutable();
    _MKPolylineAddToPath(Mutable, v13, v15, v17, v19, a4, 0.0, 1.0, -1.0);

    if (Mutable && !CGPathIsEmpty(Mutable))
    {
      [(MKOverlayPathRenderer *)self applyStrokePropertiesToContext:a5 atZoomScale:a4];
      v21 = [(MKOverlayRenderer *)self overlay];
      unint64_t v22 = [v21 pointCount];

      if (v22 >= 2 && (v9 > 0.0 || v11 < 1.0))
      {
        CGContextGetLineWidth();
        CGFloat v24 = v23;
        CGLineCap LineCap = CGContextGetLineCap();
        CGLineJoin LineJoin = CGContextGetLineJoin();
        CGContextGetMiterLimit();
        CGFloat v27 = v26;
        v28 = CGPathCreateMutable();
        id v29 = [(MKOverlayRenderer *)self overlay];
        v30 = (double *)[v29 points];
        v31 = [(MKOverlayRenderer *)self overlay];
        unint64_t v32 = [v31 pointCount];
        [(MKOverlayRenderer *)self _originMapPoint];
        double v34 = v33;
        double v36 = v35;
        v37 = [(MKOverlayRenderer *)self overlay];
        [v37 _mapPointsLength];
        _MKPolylineAddToPath(v28, v30, v32, v34, v36, a4, v9, v11, v38);

        if (v9 <= 0.0) {
          CGLineCap v39 = LineCap;
        }
        else {
          CGLineCap v39 = kCGLineCapButt;
        }
        if (v11 >= 1.0) {
          CGLineCap v40 = LineCap;
        }
        else {
          CGLineCap v40 = kCGLineCapButt;
        }
        CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(v28, v39, v40, LineJoin, v24, v27);
        CGPathRelease(v28);
        CGContextAddPath(a5, CopyByStrokingPath);
        CGContextClip(a5);
        CGPathRelease(CopyByStrokingPath);
      }
      [(MKOverlayPathRenderer *)self strokePath:Mutable inContext:a5];
    }
    CGPathRelease(Mutable);
  }
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  v3.receiver = self;
  v3.super_class = (Class)MKPolylineRenderer;
  [(MKOverlayPathRenderer *)&v3 _performInitialConfiguration];
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolylineRenderer)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolylineRendererPolyline"];
  double v6 = [(MKPolylineRenderer *)self initWithPolyline:v5];
  id v7 = v6;
  if (v6) {
    [(MKPolylineRenderer *)v6 _decodePropertiesWithCoder:v4];
  }

  return v7;
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolylineRendererStrokeStart"];
  double v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    self->_strokeStart = v7;
  }
  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolylineRendererStrokeEnd"];
  double v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKPolylineRenderer;
  [(MKOverlayPathRenderer *)&v11 _decodePropertiesWithCoder:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(MKOverlayRenderer *)self overlay];
  [v4 encodeObject:v5 forKey:@"MKPolylineRendererPolyline"];

  double v6 = [NSNumber numberWithDouble:self->_strokeStart];
  [v4 encodeObject:v6 forKey:@"MKPolylineRendererStrokeStart"];

  double v7 = [NSNumber numberWithDouble:self->_strokeEnd];
  [v4 encodeObject:v7 forKey:@"MKPolylineRendererStrokeEnd"];

  v8.receiver = self;
  v8.super_class = (Class)MKPolylineRenderer;
  [(MKOverlayPathRenderer *)&v8 _encodePropertiesWithCoder:v4];
}

- (CGFloat)strokeStart
{
  v2 = self;
  objc_sync_enter(v2);
  double strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (CGFloat)strokeEnd
{
  v2 = self;
  objc_sync_enter(v2);
  double strokeEnd = v2->_strokeEnd;
  objc_sync_exit(v2);

  return strokeEnd;
}

- (void)setStrokeStart:(CGFloat)strokeStart
{
  id v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(strokeStart, v4->_strokeStart) >= 0.00000011920929)
  {
    [(MKPolylineRenderer *)v4 willChangeValueForKey:@"strokeStart"];
    double v5 = v4->_strokeStart;
    v4->_double strokeStart = strokeStart;
    double v6 = [(MKOverlayRenderer *)v4 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKPolylineRenderer *)v4 didChangeValueForKey:@"strokeStart"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MKPolylineRenderer_setStrokeStart___block_invoke;
    v7[3] = &unk_1E54BB710;
    v7[4] = v4;
    *(double *)&v7[5] = v5;
    *(CGFloat *)&v7[6] = strokeStart;
    [(MKOverlayPathRenderer *)v4 _animateVectorGeometryIfNecessaryForKey:@"strokeStart" withStepHandler:v7];
  }
  objc_sync_exit(v4);
}

uint64_t __37__MKPolylineRenderer_setStrokeStart___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setStrokeStart:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  id v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(strokeEnd, v4->_strokeEnd) >= 0.00000011920929)
  {
    [(MKPolylineRenderer *)v4 willChangeValueForKey:@"strokeEnd"];
    double v5 = v4->_strokeEnd;
    v4->_double strokeEnd = strokeEnd;
    double v6 = [(MKOverlayRenderer *)v4 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKPolylineRenderer *)v4 didChangeValueForKey:@"strokeEnd"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__MKPolylineRenderer_setStrokeEnd___block_invoke;
    v7[3] = &unk_1E54BB710;
    v7[4] = v4;
    *(double *)&v7[5] = v5;
    *(CGFloat *)&v7[6] = strokeEnd;
    [(MKOverlayPathRenderer *)v4 _animateVectorGeometryIfNecessaryForKey:@"strokeEnd" withStepHandler:v7];
  }
  objc_sync_exit(v4);
}

uint64_t __35__MKPolylineRenderer_setStrokeEnd___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setStrokeEnd:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setLineWidth:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setLineWidth:](&v7, sel_setLineWidth_);
  [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry lineWidth];
  if (fabs(a3) < 0.000001 || fabs(v5) < 0.000001)
  {
    [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry setLineWidth:a3];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__MKPolylineRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E54BB710;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"lineWidth" withStepHandler:v6];
  }
}

uint64_t __35__MKPolylineRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setLineWidth:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setStrokeColor:(id)a3
{
  id v4 = a3;
  double v5 = [(MKOverlayPathRenderer *)self strokeColor];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F428B8] clearColor];
  }
  objc_super v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKPolylineRenderer;
  [(MKOverlayPathRenderer *)&v15 setStrokeColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__MKPolylineRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  double v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"strokeColor" withStepHandler:v11];
}

void __37__MKPolylineRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
{
  objc_super v3 = objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(void *)(a1 + 40), a2);
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  id v5 = v4;

  id v6 = v5;
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 208), "setColor:", objc_msgSend(v6, "CGColor"));
}

- (void)setAlpha:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__MKPolylineRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E54BB710;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"alpha" withStepHandler:v6];
}

uint64_t __31__MKPolylineRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setLineJoin:(int)a3
{
  BOOL v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setLineJoin:](&v7, sel_setLineJoin_);
  if (a3 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * v5;
  }
  [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry setLineJoin:v6];
}

- (void)setLineCap:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setLineCap:](&v6, sel_setLineCap_);
  if (a3 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = a3 == 0;
  }
  [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry setLineCap:v5];
}

- (void)setMiterLimit:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKPolylineRenderer;
  -[MKOverlayPathRenderer setMiterLimit:](&v6, sel_setMiterLimit_);
  double v5 = 10.0;
  if (a3 > 0.0) {
    double v5 = a3;
  }
  [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry setMiterLimit:v5];
}

- (BOOL)_canProvideVectorGeometry
{
  if ([(MKOverlayPathRenderer *)self shouldRasterize]) {
    return 0;
  }
  if ([(MKOverlayPathRenderer *)self _externalSubclassOverridesDrawingMethods])
  {
    return 0;
  }
  objc_super v3 = [(MKOverlayPathRenderer *)self lineDashPattern];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0;
  }
  id v7 = [(MKOverlayPathRenderer *)self strokeColor];
  BOOL v5 = CGColorGetPattern((CGColorRef)[v7 CGColor]) == 0;

  return v5;
}

- (id)_vectorGeometry
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!self->_vectorGeometry && [(MKPolylineRenderer *)self _canProvideVectorGeometry])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB3AC8]);
    id v4 = [(MKPolylineRenderer *)self polyline];
    uint64_t v5 = [v4 points];
    objc_super v6 = [(MKPolylineRenderer *)self polyline];
    uint64_t v7 = [v6 elevations];
    objc_super v8 = [(MKPolylineRenderer *)self polyline];
    uint64_t v9 = [v8 pointCount];
    id v10 = [(MKPolylineRenderer *)self polyline];
    objc_super v11 = objc_msgSend(v3, "initWithMapPoints:elevations:count:needsElevationCorrection:", v5, v7, v9, objc_msgSend(v10, "needsElevationCorrection"));

    id v12 = objc_alloc(MEMORY[0x1E4FB3AD0]);
    v18[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    double v14 = (VKVectorOverlayPolylineGroup *)[v12 initWithPolylines:v13];
    vectorGeometry = self->_vectorGeometry;
    self->_vectorGeometry = v14;

    [(MKPolylineRenderer *)self _updateVectorGeometry:self->_vectorGeometry];
  }
  double v16 = self->_vectorGeometry;

  return v16;
}

- (void)_updateVectorGeometry:(id)a3
{
  id v10 = a3;
  [(MKOverlayPathRenderer *)self lineWidth];
  objc_msgSend(v10, "setLineWidth:");
  id v4 = [(MKOverlayPathRenderer *)self strokeColor];
  objc_msgSend(v10, "setColor:", objc_msgSend(v4, "CGColor"));

  [(MKOverlayRenderer *)self alpha];
  objc_msgSend(v10, "setAlpha:");
  CGLineJoin v5 = [(MKOverlayPathRenderer *)self lineJoin];
  if (v5 == kCGLineJoinBevel) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * (v5 == kCGLineJoinMiter);
  }
  [v10 setLineJoin:v6];
  CGLineCap v7 = [(MKOverlayPathRenderer *)self lineCap];
  if (v7 == kCGLineCapSquare) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = v7 == kCGLineCapButt;
  }
  [v10 setLineCap:v8];
  [(MKOverlayPathRenderer *)self miterLimit];
  if (v9 <= 0.0) {
    double v9 = 10.0;
  }
  [v10 setMiterLimit:v9];
  [(MKPolylineRenderer *)self strokeStart];
  objc_msgSend(v10, "setStrokeStart:");
  [(MKPolylineRenderer *)self strokeEnd];
  objc_msgSend(v10, "setStrokeEnd:");
}

- (void)_setNeedsVectorGeometryUpdate
{
  if (self->_vectorGeometry) {
    -[MKPolylineRenderer _updateVectorGeometry:](self, "_updateVectorGeometry:");
  }
}

- (id)vectorDataForOverlay:(id)a3
{
  if ([(MKPolylineRenderer *)self _canProvideVectorGeometry])
  {
    id v4 = [(MKPolylineRenderer *)self _vectorGeometry];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateRenderColors
{
  if (self->_vectorGeometry)
  {
    id v3 = [(MKOverlayRenderer *)self _mapView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__MKPolylineRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [v3 _withEffectiveTraitCollection:v5];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKPolylineRenderer;
  [(MKOverlayRenderer *)&v4 _updateRenderColors];
}

void __41__MKPolylineRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strokeColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setColor:", objc_msgSend(v2, "CGColor"));
}

- (void).cxx_destruct
{
}

@end
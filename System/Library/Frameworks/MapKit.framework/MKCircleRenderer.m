@interface MKCircleRenderer
+ (BOOL)supportsSecureCoding;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (CGFloat)strokeEnd;
- (CGFloat)strokeStart;
- (MKCircleRenderer)initWithCircle:(MKCircle *)circle;
- (MKCircleRenderer)initWithCoder:(id)a3;
- (id)_vectorData;
- (id)vectorDataForOverlay:(id)a3;
- (void)_decodePropertiesWithCoder:(id)a3;
- (void)_performInitialConfiguration;
- (void)_updateRenderColors;
- (void)createPath;
- (void)encodeWithCoder:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeEnd:(CGFloat)strokeEnd;
- (void)setStrokeStart:(CGFloat)strokeStart;
- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4;
@end

@implementation MKCircleRenderer

- (MKCircleRenderer)initWithCircle:(MKCircle *)circle
{
  v4.receiver = self;
  v4.super_class = (Class)MKCircleRenderer;
  return [(MKOverlayPathRenderer *)&v4 initWithOverlay:circle];
}

- (void)createPath
{
  Mutable = CGPathCreateMutable();
  objc_super v4 = [(MKOverlayRenderer *)self overlay];
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;

  [(MKOverlayRenderer *)self pointForMapPoint:MKTilePointForCoordinate(v6, v8, 21.0)];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  GEOMapPointsPerMeterAtLatitude();
  double v14 = v13;
  v15 = [(MKOverlayRenderer *)self overlay];
  [v15 radius];
  CGFloat v17 = v14 * v16;

  CGPathAddArc(Mutable, 0, v10, v12, v17, 0.0, 6.28318531, 1);
  [(MKOverlayPathRenderer *)self setPath:Mutable];

  CGPathRelease(Mutable);
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGContextGetLineWidth();
  CGFloat v8 = v7;
  [(MKCircleRenderer *)self strokeStart];
  double v10 = v9;
  [(MKCircleRenderer *)self strokeEnd];
  double v12 = v11;
  if (fabs(v8) < 0.00000011920929
    || ((double v13 = fabs(v11 + -1.0), fabs(v10) < 0.00000011920929) ? (v14 = v13 < 0.00000011920929) : (v14 = 0), v14))
  {
    v32.receiver = self;
    v32.super_class = (Class)MKCircleRenderer;
    [(MKOverlayPathRenderer *)&v32 strokePath:a3 inContext:a4];
  }
  else
  {
    Mutable = CGPathCreateMutable();
    double v16 = [(MKOverlayRenderer *)self overlay];
    [v16 coordinate];
    double v18 = v17;
    double v20 = v19;

    [(MKOverlayRenderer *)self pointForMapPoint:MKTilePointForCoordinate(v18, v20, 21.0)];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    GEOMapPointsPerMeterAtLatitude();
    double v26 = v25;
    v27 = [(MKOverlayRenderer *)self overlay];
    [v27 radius];
    CGFloat v29 = v26 * v28;

    CGPathAddArc(Mutable, 0, v22, v24, v29, (v10 + v10) * 3.14159265 + -1.57079633, (v12 + v12) * 3.14159265 + -1.57079633, 0);
    CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(Mutable, kCGLineCapButt, kCGLineCapButt, kCGLineJoinRound, v8, 0.0);
    CGPathRelease(Mutable);
    CGContextAddPath(a4, CopyByStrokingPath);
    CGContextClip(a4);
    v31.receiver = self;
    v31.super_class = (Class)MKCircleRenderer;
    [(MKOverlayPathRenderer *)&v31 strokePath:a3 inContext:a4];
    CGPathRelease(CopyByStrokingPath);
  }
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  v3.receiver = self;
  v3.super_class = (Class)MKCircleRenderer;
  [(MKOverlayPathRenderer *)&v3 _performInitialConfiguration];
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
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
  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeStart, obj->_strokeStart) >= 0.00000011920929)
  {
    [(MKCircleRenderer *)obj willChangeValueForKey:@"strokeStart"];
    obj->_double strokeStart = strokeStart;
    objc_super v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKCircleRenderer *)obj didChangeValueForKey:@"strokeStart"];
  }
  objc_sync_exit(obj);
}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeEnd, obj->_strokeEnd) >= 0.00000011920929)
  {
    [(MKCircleRenderer *)obj willChangeValueForKey:@"strokeEnd"];
    obj->_double strokeEnd = strokeEnd;
    objc_super v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKCircleRenderer *)obj didChangeValueForKey:@"strokeEnd"];
  }
  objc_sync_exit(obj);
}

- (void)setLineWidth:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKCircleRenderer;
  -[MKOverlayPathRenderer setLineWidth:](&v7, sel_setLineWidth_);
  [(VKVectorOverlayCircle *)self->_vectorData lineWidth];
  if (fabs(a3) < 0.000001 || fabs(v5) < 0.000001)
  {
    [(VKVectorOverlayCircle *)self->_vectorData setLineWidth:a3];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__MKCircleRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E54BB710;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"lineWidth" withStepHandler:v6];
  }
}

uint64_t __33__MKCircleRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setLineWidth:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  double v5 = [(MKOverlayPathRenderer *)self fillColor];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F428B8] clearColor];
  }
  CGFloat v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKCircleRenderer;
  [(MKOverlayPathRenderer *)&v15 setFillColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__MKCircleRenderer_setFillColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  BOOL v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"fillColor" withStepHandler:v11];
}

void __33__MKCircleRenderer_setFillColor___block_invoke(uint64_t a1, float a2)
{
  objc_super v3 = objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(void *)(a1 + 40), a2);
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  id v5 = v4;

  id v6 = v5;
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 208), "setFillColor:", objc_msgSend(v6, "CGColor"));
}

- (void)setStrokeColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MKOverlayPathRenderer *)self strokeColor];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F428B8] clearColor];
  }
  CGFloat v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKCircleRenderer;
  [(MKOverlayPathRenderer *)&v15 setStrokeColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__MKCircleRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  BOOL v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"strokeColor" withStepHandler:v11];
}

void __35__MKCircleRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
{
  objc_super v3 = objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(void *)(a1 + 40), a2);
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  id v5 = v4;

  id v6 = v5;
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 208), "setStrokeColor:", objc_msgSend(v6, "CGColor"));
}

- (void)setAlpha:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKCircleRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  [(VKVectorOverlayCircle *)self->_vectorData alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__MKCircleRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E54BB710;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"alpha" withStepHandler:v6];
}

uint64_t __29__MKCircleRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
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
  id v5 = [(MKOverlayPathRenderer *)self strokeColor];
  if (CGColorGetPattern((CGColorRef)[v5 CGColor]))
  {

    return 0;
  }
  id v6 = [(MKOverlayPathRenderer *)self fillColor];
  CGPatternRef Pattern = CGColorGetPattern((CGColorRef)[v6 CGColor]);

  if (Pattern) {
    return 0;
  }
  CGFloat v8 = [(MKOverlayRenderer *)self overlay];
  [v8 boundingMapRect];
  double v10 = v9;

  return v10 <= 268435456.0 && self->_strokeStart <= 0.0 && self->_strokeEnd >= 1.0;
}

- (id)_vectorData
{
  if (!self->_vectorData && [(MKCircleRenderer *)self _canProvideVectorGeometry])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB3AA8]);
    uint64_t v4 = [(MKOverlayRenderer *)self overlay];
    [v4 boundingMapRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(MKOverlayPathRenderer *)self lineWidth];
    double v14 = v13;
    id v15 = [(MKOverlayPathRenderer *)self fillColor];
    uint64_t v16 = [v15 CGColor];
    id v17 = [(MKOverlayPathRenderer *)self strokeColor];
    uint64_t v18 = [v17 CGColor];
    [(MKOverlayRenderer *)self alpha];
    double v20 = (VKVectorOverlayCircle *)objc_msgSend(v3, "initWithMapRect:lineWidth:fillColor:strokeColor:alpha:", v16, v18, v6, v8, v10, v12, v14, v19);
    vectorData = self->_vectorData;
    self->_vectorData = v20;
  }
  CGFloat v22 = self->_vectorData;

  return v22;
}

- (id)vectorDataForOverlay:(id)a3
{
  if ([(MKCircleRenderer *)self _canProvideVectorGeometry])
  {
    uint64_t v4 = [(MKCircleRenderer *)self _vectorData];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_updateRenderColors
{
  if (self->_vectorData)
  {
    id v3 = [(MKOverlayRenderer *)self _mapView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__MKCircleRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [v3 _withEffectiveTraitCollection:v5];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKCircleRenderer;
  [(MKOverlayRenderer *)&v4 _updateRenderColors];
}

void __39__MKCircleRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fillColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setFillColor:", objc_msgSend(v2, "CGColor"));

  id v3 = [*(id *)(a1 + 32) strokeColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setStrokeColor:", objc_msgSend(v3, "CGColor"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKCircleRenderer)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKCircleRendererCircle"];
  double v6 = [(MKCircleRenderer *)self initWithCircle:v5];
  double v7 = v6;
  if (v6) {
    [(MKCircleRenderer *)v6 _decodePropertiesWithCoder:v4];
  }

  return v7;
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKCircleRendererStrokeStart"];
  double v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    self->_double strokeStart = v7;
  }
  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKCircleRendererStrokeEnd"];
  double v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    self->_double strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKCircleRenderer;
  [(MKOverlayPathRenderer *)&v11 _decodePropertiesWithCoder:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(MKOverlayRenderer *)self overlay];
  [v4 encodeObject:v5 forKey:@"MKCircleRendererCircle"];

  double v6 = [NSNumber numberWithDouble:self->_strokeStart];
  [v4 encodeObject:v6 forKey:@"MKCircleRendererStrokeStart"];

  double v7 = [NSNumber numberWithDouble:self->_strokeEnd];
  [v4 encodeObject:v7 forKey:@"MKCircleRendererStrokeEnd"];

  v8.receiver = self;
  v8.super_class = (Class)MKCircleRenderer;
  [(MKOverlayPathRenderer *)&v8 _encodePropertiesWithCoder:v4];
}

- (void).cxx_destruct
{
}

@end
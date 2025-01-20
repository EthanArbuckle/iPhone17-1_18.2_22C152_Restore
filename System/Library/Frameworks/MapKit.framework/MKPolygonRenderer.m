@interface MKPolygonRenderer
+ (BOOL)supportsSecureCoding;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (CGFloat)strokeEnd;
- (CGFloat)strokeStart;
- (MKPolygonRenderer)initWithCoder:(id)a3;
- (MKPolygonRenderer)initWithPolygon:(MKPolygon *)polygon;
- (id)_vectorGeometry;
- (id)vectorDataForOverlay:(id)a3;
- (void)_decodePropertiesWithCoder:(id)a3;
- (void)_performInitialConfiguration;
- (void)_updateRenderColors;
- (void)createPath;
- (void)encodeWithCoder:(id)a3;
- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)setAlpha:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setLineJoin:(int)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeEnd:(CGFloat)strokeEnd;
- (void)setStrokeStart:(CGFloat)strokeStart;
- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4;
@end

@implementation MKPolygonRenderer

- (MKPolygonRenderer)initWithPolygon:(MKPolygon *)polygon
{
  v4.receiver = self;
  v4.super_class = (Class)MKPolygonRenderer;
  return [(MKOverlayPathRenderer *)&v4 initWithOverlay:polygon];
}

- (void)createPath
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(MKOverlayRenderer *)self _originMapPoint];
  double v4 = v3;
  double v6 = v5;
  v7 = [(MKOverlayRenderer *)self overlay];
  PathForPolygon = CreatePathForPolygon(v7, v4, v6);

  v9 = [(MKOverlayRenderer *)self overlay];
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

  -[MKOverlayPathRenderer setPath:](self, "setPath:", PathForPolygon, (void)v18);
  CGPathRelease(PathForPolygon);
}

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  double v6 = [(MKOverlayPathRenderer *)self fillColor];

  if (a3 && v6)
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextDrawPath(a4, kCGPathEOFill);
  }
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v6 = [(MKOverlayPathRenderer *)self strokeColor];

  if (a3 && v6)
  {
    [(MKPolygonRenderer *)self strokeStart];
    double v8 = v7;
    [(MKPolygonRenderer *)self strokeEnd];
    double v10 = v9;
    if (v8 > 0.0 || v9 < 1.0)
    {
      CGContextGetLineWidth();
      CGFloat v12 = v11;
      CGLineCap LineCap = CGContextGetLineCap();
      uint64_t LineJoin = CGContextGetLineJoin();
      CGContextGetMiterLimit();
      CGFloat v16 = v15;
      v17 = [(MKOverlayRenderer *)self overlay];
      [(MKOverlayRenderer *)self _originMapPoint];
      StrokeClipPathForPolygon = _MKPolygonRendererCreateStrokeClipPathForPolygon(v17, v18, v19, v8, v10);

      if (StrokeClipPathForPolygon)
      {
        CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(StrokeClipPathForPolygon, kCGLineCapButt, kCGLineCapButt, (CGLineJoin)LineJoin, v12, v16);
        CGContextAddPath(a4, CopyByStrokingPath);
        CGPathRelease(StrokeClipPathForPolygon);
        CGPathRelease(CopyByStrokingPath);
      }
      v22 = a4;
      uint64_t v23 = [(MKOverlayRenderer *)self overlay];
      v24 = [v23 interiorPolygons];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v42;
        if (v8 <= 0.0) {
          CGLineCap v29 = LineCap;
        }
        else {
          CGLineCap v29 = kCGLineCapButt;
        }
        if (v10 < 1.0) {
          CGLineCap LineCap = kCGLineCapButt;
        }
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v42 != v28) {
              objc_enumerationMutation(v25);
            }
            v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            [(MKOverlayRenderer *)self _originMapPoint];
            v34 = _MKPolygonRendererCreateStrokeClipPathForPolygon(v31, v32, v33, v8, v10);
            if (v34)
            {
              v35 = v34;
              uint64_t v36 = LineJoin;
              v37 = _MKCGPathCreateCopyByStrokingPath(v34, v29, LineCap, (CGLineJoin)LineJoin, v12, v16);
              CGContextAddPath(v22, v37);
              CGPathRelease(v35);
              v38 = v37;
              uint64_t LineJoin = v36;
              CGPathRelease(v38);
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v27);
      }

      a4 = v22;
      CGContextClip(v22);

      a3 = v39;
    }
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextStrokePath(a4);
  }
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  v3.receiver = self;
  v3.super_class = (Class)MKPolygonRenderer;
  [(MKOverlayPathRenderer *)&v3 _performInitialConfiguration];
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolygonRenderer)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolygonRendererPolygon"];
  double v6 = [(MKPolygonRenderer *)self initWithPolygon:v5];
  double v7 = v6;
  if (v6) {
    [(MKPolygonRenderer *)v6 _decodePropertiesWithCoder:v4];
  }

  return v7;
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolygonRendererStrokeStart"];
  double v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    self->_strokeStart = v7;
  }
  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolygonRendererStrokeEnd"];
  double v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKPolygonRenderer;
  [(MKOverlayPathRenderer *)&v11 _decodePropertiesWithCoder:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(MKOverlayRenderer *)self overlay];
  [v4 encodeObject:v5 forKey:@"MKPolygonRendererPolygon"];

  double v6 = [NSNumber numberWithDouble:self->_strokeStart];
  [v4 encodeObject:v6 forKey:@"MKPolygonRendererStrokeStart"];

  double v7 = [NSNumber numberWithDouble:self->_strokeEnd];
  [v4 encodeObject:v7 forKey:@"MKPolygonRendererStrokeEnd"];

  v8.receiver = self;
  v8.super_class = (Class)MKPolygonRenderer;
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
  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeStart, obj->_strokeStart) >= 0.00000011920929)
  {
    [(MKPolygonRenderer *)obj willChangeValueForKey:@"strokeStart"];
    obj->_double strokeStart = strokeStart;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKPolygonRenderer *)obj didChangeValueForKey:@"strokeStart"];
  }
  objc_sync_exit(obj);
}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(strokeEnd, obj->_strokeEnd) >= 0.00000011920929)
  {
    [(MKPolygonRenderer *)obj willChangeValueForKey:@"strokeEnd"];
    obj->_double strokeEnd = strokeEnd;
    id v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKPolygonRenderer *)obj didChangeValueForKey:@"strokeEnd"];
  }
  objc_sync_exit(obj);
}

- (void)setLineWidth:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setLineWidth:](&v7, sel_setLineWidth_);
  [(VKVectorOverlayPolygonGroup *)self->_vectorData lineWidth];
  if (fabs(a3) < 0.000001 || fabs(v5) < 0.000001)
  {
    [(VKVectorOverlayPolygonGroup *)self->_vectorData setLineWidth:a3];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__MKPolygonRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E54BB710;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"lineWidth" withStepHandler:v6];
  }
}

uint64_t __34__MKPolygonRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setLineWidth:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setLineJoin:(int)a3
{
  BOOL v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setLineJoin:](&v7, sel_setLineJoin_);
  if (a3 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * v5;
  }
  [(VKVectorOverlayPolygonGroup *)self->_vectorData setLineJoin:v6];
}

- (void)setMiterLimit:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayPathRenderer setMiterLimit:](&v5, sel_setMiterLimit_);
  [(VKVectorOverlayPolygonGroup *)self->_vectorData setMiterLimit:a3];
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MKOverlayPathRenderer *)self fillColor];
  uint64_t v6 = v5;
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
  v15.super_class = (Class)MKPolygonRenderer;
  [(MKOverlayPathRenderer *)&v15 setFillColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__MKPolygonRenderer_setFillColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  uint64_t v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"fillColor" withStepHandler:v11];
}

void __34__MKPolygonRenderer_setFillColor___block_invoke(uint64_t a1, float a2)
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
  objc_super v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKPolygonRenderer;
  [(MKOverlayPathRenderer *)&v15 setStrokeColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__MKPolygonRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  uint64_t v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"strokeColor" withStepHandler:v11];
}

void __36__MKPolygonRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
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
  v7.super_class = (Class)MKPolygonRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  [(VKVectorOverlayPolygonGroup *)self->_vectorData alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MKPolygonRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E54BB710;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"alpha" withStepHandler:v6];
}

uint64_t __30__MKPolygonRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
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
  uint64_t v5 = [(MKOverlayRenderer *)self overlay];
  int v6 = [v5 _isSimple];

  if (!v6) {
    return 0;
  }
  id v7 = [(MKOverlayPathRenderer *)self strokeColor];
  CGPatternRef Pattern = CGColorGetPattern((CGColorRef)[v7 CGColor]);

  if (Pattern) {
    return 0;
  }
  id v9 = [(MKOverlayPathRenderer *)self fillColor];
  CGPatternRef v10 = CGColorGetPattern((CGColorRef)[v9 CGColor]);

  return !v10 && self->_strokeStart <= 0.0 && self->_strokeEnd >= 1.0;
}

- (id)_vectorGeometry
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!self->_vectorData && [(MKPolygonRenderer *)self _canProvideVectorGeometry])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB3AB8]);
    id v4 = [(MKOverlayRenderer *)self overlay];
    uint64_t v5 = [v4 points];
    int v6 = [(MKOverlayRenderer *)self overlay];
    id v7 = objc_msgSend(v3, "initWithMapPoints:count:", v5, objc_msgSend(v6, "pointCount"));

    id v8 = objc_alloc(MEMORY[0x1E4FB3AC0]);
    v18[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    CGPatternRef v10 = (VKVectorOverlayPolygonGroup *)[v8 initWithPolygons:v9];
    vectorData = self->_vectorData;
    self->_vectorData = v10;

    [(MKOverlayPathRenderer *)self lineWidth];
    -[VKVectorOverlayPolygonGroup setLineWidth:](self->_vectorData, "setLineWidth:");
    CGLineJoin v12 = [(MKOverlayPathRenderer *)self lineJoin];
    if (v12 == kCGLineJoinBevel) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2 * (v12 == kCGLineJoinMiter);
    }
    [(VKVectorOverlayPolygonGroup *)self->_vectorData setLineJoin:v13];
    id v14 = [(MKOverlayPathRenderer *)self fillColor];
    -[VKVectorOverlayPolygonGroup setFillColor:](self->_vectorData, "setFillColor:", [v14 CGColor]);

    id v15 = [(MKOverlayPathRenderer *)self strokeColor];
    -[VKVectorOverlayPolygonGroup setStrokeColor:](self->_vectorData, "setStrokeColor:", [v15 CGColor]);

    [(MKOverlayRenderer *)self alpha];
    -[VKVectorOverlayPolygonGroup setAlpha:](self->_vectorData, "setAlpha:");
    [(MKOverlayPathRenderer *)self miterLimit];
    -[VKVectorOverlayPolygonGroup setMiterLimit:](self->_vectorData, "setMiterLimit:");
  }
  CGFloat v16 = self->_vectorData;

  return v16;
}

- (id)vectorDataForOverlay:(id)a3
{
  if ([(MKPolygonRenderer *)self _canProvideVectorGeometry])
  {
    id v4 = [(MKPolygonRenderer *)self _vectorGeometry];
  }
  else
  {
    id v4 = 0;
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
    v5[2] = __40__MKPolygonRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [v3 _withEffectiveTraitCollection:v5];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKPolygonRenderer;
  [(MKOverlayRenderer *)&v4 _updateRenderColors];
}

void __40__MKPolygonRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fillColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setFillColor:", objc_msgSend(v2, "CGColor"));

  id v3 = [*(id *)(a1 + 32) strokeColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setStrokeColor:", objc_msgSend(v3, "CGColor"));
}

- (void).cxx_destruct
{
}

@end
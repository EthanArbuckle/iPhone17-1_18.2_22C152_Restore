@interface MKMultiPolylineRenderer
+ (BOOL)supportsSecureCoding;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (MKMultiPolylineRenderer)initWithCoder:(id)a3;
- (double)_strokeEnd;
- (double)_strokeStart;
- (id)_vectorGeometry;
- (id)vectorDataForOverlay:(id)a3;
- (void)_decodePropertiesWithCoder:(id)a3;
- (void)_performInitialConfiguration;
- (void)_setStrokeEnd:(double)a3;
- (void)_setStrokeStart:(double)a3;
- (void)_updateRenderColors;
- (void)createPath;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setLineCap:(int)a3;
- (void)setLineJoin:(int)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation MKMultiPolylineRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  v3.receiver = self;
  v3.super_class = (Class)MKMultiPolylineRenderer;
  [(MKOverlayPathRenderer *)&v3 _performInitialConfiguration];
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMultiPolylineRenderer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPolylinePolyline"];
  v6 = [(MKMultiPolylineRenderer *)self initWithMultiPolyline:v5];
  v7 = v6;
  if (v6) {
    [(MKMultiPolylineRenderer *)v6 _decodePropertiesWithCoder:v4];
  }

  return v7;
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPolylineRendererStrokeStart"];
  v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    self->_strokeStart = v7;
  }
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPolylineRendererStrokeEnd"];
  v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKMultiPolylineRenderer;
  [(MKOverlayPathRenderer *)&v11 _decodePropertiesWithCoder:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MKMultiPolylineRenderer *)self multiPolyline];
  [v4 encodeObject:v5 forKey:@"MKMultiPolylinePolyline"];

  v6 = [NSNumber numberWithDouble:self->_strokeStart];
  [v4 encodeObject:v6 forKey:@"MKMultiPolylineRendererStrokeStart"];

  double v7 = [NSNumber numberWithDouble:self->_strokeEnd];
  [v4 encodeObject:v7 forKey:@"MKMultiPolylineRendererStrokeEnd"];

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPolylineRenderer;
  [(MKOverlayPathRenderer *)&v8 _encodePropertiesWithCoder:v4];
}

- (double)_strokeStart
{
  v2 = self;
  objc_sync_enter(v2);
  double strokeStart = v2->_strokeStart;
  objc_sync_exit(v2);

  return strokeStart;
}

- (double)_strokeEnd
{
  v2 = self;
  objc_sync_enter(v2);
  double strokeEnd = v2->_strokeEnd;
  objc_sync_exit(v2);

  return strokeEnd;
}

- (void)_setStrokeStart:(double)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(a3, v4->_strokeStart) >= 0.00000011920929)
  {
    [(MKMultiPolylineRenderer *)v4 willChangeValueForKey:@"strokeStart"];
    double strokeStart = v4->_strokeStart;
    v4->_double strokeStart = a3;
    v6 = [(MKOverlayRenderer *)v4 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKMultiPolylineRenderer *)v4 didChangeValueForKey:@"strokeStart"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__MKMultiPolylineRenderer__setStrokeStart___block_invoke;
    v7[3] = &unk_1E54BB710;
    v7[4] = v4;
    *(double *)&v7[5] = strokeStart;
    *(double *)&v7[6] = a3;
    [(MKOverlayPathRenderer *)v4 _animateVectorGeometryIfNecessaryForKey:@"strokeStart" withStepHandler:v7];
  }
  objc_sync_exit(v4);
}

uint64_t __43__MKMultiPolylineRenderer__setStrokeStart___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setStrokeStart:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)_setStrokeEnd:(double)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (vabdd_f64(a3, v4->_strokeEnd) >= 0.00000011920929)
  {
    [(MKMultiPolylineRenderer *)v4 willChangeValueForKey:@"strokeEnd"];
    double strokeEnd = v4->_strokeEnd;
    v4->_double strokeEnd = a3;
    v6 = [(MKOverlayRenderer *)v4 _renderer];
    [v6 setNeedsDisplayForReason:2];

    [(MKMultiPolylineRenderer *)v4 didChangeValueForKey:@"strokeEnd"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__MKMultiPolylineRenderer__setStrokeEnd___block_invoke;
    v7[3] = &unk_1E54BB710;
    v7[4] = v4;
    *(double *)&v7[5] = strokeEnd;
    *(double *)&v7[6] = a3;
    [(MKOverlayPathRenderer *)v4 _animateVectorGeometryIfNecessaryForKey:@"strokeEnd" withStepHandler:v7];
  }
  objc_sync_exit(v4);
}

uint64_t __41__MKMultiPolylineRenderer__setStrokeEnd___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setStrokeEnd:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)createPath
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  Mutable = CGPathCreateMutable();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(MKOverlayRenderer *)self overlay];
  v5 = [v4 polylines];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        [(MKOverlayRenderer *)self _originMapPoint];
        double v12 = v11;
        double v14 = v13;
        id v15 = v10;
        v16 = (double *)[v15 points];
        unint64_t v17 = [v15 pointCount];
        if (v17 >= 2)
        {
          unint64_t v18 = v17;
          double v20 = *v16;
          double v21 = v16[1];
          v19 = v16 + 3;
          CGPathMoveToPoint(Mutable, 0, v20 - v12, v21 - v14);
          unint64_t v22 = v18 - 1;
          do
          {
            CGPathAddLineToPoint(Mutable, 0, *(v19 - 1) - v12, *v19 - v14);
            v19 += 2;
            --v22;
          }
          while (v22);
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  [(MKOverlayPathRenderer *)self setPath:Mutable];
  CGPathRelease(Mutable);
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  [(MKOverlayRenderer *)self _originMapPoint];
  double v9 = v8;
  double v11 = v10;
  Mutable = CGPathCreateMutable();
  [(MKMultiPolylineRenderer *)self _strokeStart];
  double v14 = v13;
  v45 = self;
  [(MKMultiPolylineRenderer *)self _strokeEnd];
  double v16 = v15;
  BOOL v17 = v14 > 0.0;
  if (v15 < 1.0) {
    BOOL v17 = 1;
  }
  BOOL v46 = v17;
  if (v17) {
    unint64_t v18 = CGPathCreateMutable();
  }
  else {
    unint64_t v18 = 0;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v19 = [(MKOverlayRenderer *)self overlay];
  double v20 = [v19 polylines];

  id obj = v20;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    char v23 = 0;
    uint64_t v24 = *(void *)v49;
    v43 = v18;
    v44 = Mutable;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(id *)(*((void *)&v48 + 1) + 8 * i);
        v27 = (double *)[v26 points];
        unint64_t v28 = [v26 pointCount];
        if (v28 >= 2)
        {
          unint64_t v29 = v28;
          _MKPolylineAddToPath(Mutable, v27, v28, v9, v11, a4, 0.0, 1.0, -1.0);
          if (!CGPathIsEmpty(Mutable))
          {
            if ((v23 & 1) == 0) {
              [(MKOverlayPathRenderer *)v45 applyStrokePropertiesToContext:a5 atZoomScale:a4];
            }
            if (v46)
            {
              CGContextGetLineWidth();
              CGFloat v31 = v30;
              CGLineCap LineCap = CGContextGetLineCap();
              CGLineJoin LineJoin = CGContextGetLineJoin();
              CGContextGetMiterLimit();
              CGFloat v35 = v34;
              v36 = a5;
              v37 = CGPathCreateMutable();
              [v26 _mapPointsLength];
              _MKPolylineAddToPath(v37, v27, v29, v9, v11, a4, v14, v16, v38);
              if (v14 <= 0.0) {
                CGLineCap v39 = LineCap;
              }
              else {
                CGLineCap v39 = kCGLineCapButt;
              }
              if (v16 >= 1.0) {
                CGLineCap v40 = LineCap;
              }
              else {
                CGLineCap v40 = kCGLineCapButt;
              }
              unint64_t v18 = v43;
              CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(v37, v39, v40, LineJoin, v31, v35);
              CGPathAddPath(v43, 0, CopyByStrokingPath);
              v42 = v37;
              a5 = v36;
              Mutable = v44;
              CGPathRelease(v42);
              CGPathRelease(CopyByStrokingPath);
            }
            char v23 = 1;
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v22);
  }

  if (Mutable && !CGPathIsEmpty(Mutable))
  {
    if (v18)
    {
      CGContextAddPath(a5, v18);
      CGContextClip(a5);
    }
    [(MKOverlayPathRenderer *)v45 strokePath:Mutable inContext:a5];
  }
  CGPathRelease(Mutable);
  CGPathRelease(v18);
}

- (void)setLineWidth:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolylineRenderer;
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
    v6[2] = __40__MKMultiPolylineRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E54BB710;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"lineWidth" withStepHandler:v6];
  }
}

uint64_t __40__MKMultiPolylineRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setLineWidth:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setStrokeColor:(id)a3
{
  id v4 = a3;
  double v5 = [(MKOverlayPathRenderer *)self strokeColor];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F428B8] clearColor];
  }
  double v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKMultiPolylineRenderer;
  [(MKOverlayPathRenderer *)&v15 setStrokeColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__MKMultiPolylineRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  double v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"strokeColor" withStepHandler:v11];
}

void __42__MKMultiPolylineRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
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
  v7.super_class = (Class)MKMultiPolylineRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  [(VKVectorOverlayPolylineGroup *)self->_vectorGeometry alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MKMultiPolylineRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E54BB710;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"alpha" withStepHandler:v6];
}

uint64_t __36__MKMultiPolylineRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setLineJoin:(int)a3
{
  BOOL v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolylineRenderer;
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
  v6.super_class = (Class)MKMultiPolylineRenderer;
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
  v6.super_class = (Class)MKMultiPolylineRenderer;
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
  v2 = self;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_vectorGeometry && [(MKMultiPolylineRenderer *)self _canProvideVectorGeometry])
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v4 = [(MKOverlayRenderer *)v2 overlay];
    BOOL v5 = [v4 polylines];
    objc_super v6 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    p_isa = (id *)&v2->super.super.super.isa;
    id v7 = [(MKOverlayRenderer *)v2 overlay];
    double v8 = [v7 polylines];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x1E4FB3AC8]);
          id v15 = v13;
          double v16 = objc_msgSend(v14, "initWithMapPoints:elevations:count:needsElevationCorrection:", objc_msgSend(v15, "points"), objc_msgSend(v15, "elevations"), objc_msgSend(v15, "pointCount"), objc_msgSend(v15, "needsElevationCorrection"));
          [v6 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }

    BOOL v17 = v6;
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB3AD0]) initWithPolylines:v6];
    v2 = (MKMultiPolylineRenderer *)p_isa;
    id v19 = p_isa[26];
    p_isa[26] = (id)v18;

    [p_isa lineWidth];
    objc_msgSend(p_isa[26], "setLineWidth:");
    id v20 = [p_isa strokeColor];
    objc_msgSend(p_isa[26], "setColor:", objc_msgSend(v20, "CGColor"));

    [p_isa alpha];
    objc_msgSend(p_isa[26], "setAlpha:");
    int v21 = [p_isa lineJoin];
    if (v21 == 2) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2 * (v21 == 0);
    }
    [p_isa[26] setLineJoin:v22];
    int v23 = [p_isa lineCap];
    if (v23 == 2) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = v23 == 0;
    }
    [p_isa[26] setLineCap:v24];
    [p_isa _strokeStart];
    objc_msgSend(p_isa[26], "setStrokeStart:");
    [p_isa _strokeEnd];
    objc_msgSend(p_isa[26], "setStrokeEnd:");
    [p_isa miterLimit];
    if (v25 <= 0.0) {
      double v25 = 10.0;
    }
    [p_isa[26] setMiterLimit:v25];
  }
  vectorGeometry = v2->_vectorGeometry;

  return vectorGeometry;
}

- (id)vectorDataForOverlay:(id)a3
{
  if ([(MKMultiPolylineRenderer *)self _canProvideVectorGeometry])
  {
    uint64_t v4 = [(MKMultiPolylineRenderer *)self _vectorGeometry];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_updateRenderColors
{
  if (self->_vectorGeometry)
  {
    objc_super v3 = [(MKOverlayRenderer *)self _mapView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__MKMultiPolylineRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [v3 _withEffectiveTraitCollection:v5];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKMultiPolylineRenderer;
  [(MKOverlayRenderer *)&v4 _updateRenderColors];
}

void __46__MKMultiPolylineRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strokeColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setColor:", objc_msgSend(v2, "CGColor"));
}

- (void).cxx_destruct
{
}

@end
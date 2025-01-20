@interface MKMultiPolygonRenderer
+ (BOOL)supportsSecureCoding;
+ (Class)_mapkitLeafClass;
- (BOOL)_canProvideVectorGeometry;
- (MKMultiPolygonRenderer)initWithCoder:(id)a3;
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
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)setAlpha:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setLineJoin:(int)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4;
@end

@implementation MKMultiPolygonRenderer

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (void)_performInitialConfiguration
{
  v3.receiver = self;
  v3.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayPathRenderer *)&v3 _performInitialConfiguration];
  self->_strokeStart = 0.0;
  self->_strokeEnd = 1.0;
}

- (void)dealloc
{
  paths = self->_paths;
  if (paths)
  {
    if (self->_pathsCount)
    {
      unint64_t v4 = 0;
      do
        CGPathRelease(self->_paths[v4++]);
      while (v4 < self->_pathsCount);
      paths = self->_paths;
    }
    free(paths);
  }
  v5.receiver = self;
  v5.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayPathRenderer *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMultiPolygonRenderer)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPolygonPolygon"];
  v6 = [(MKMultiPolygonRenderer *)self initWithMultiPolygon:v5];
  v7 = v6;
  if (v6) {
    [(MKMultiPolygonRenderer *)v6 _decodePropertiesWithCoder:v4];
  }

  return v7;
}

- (void)_decodePropertiesWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPolygonRendererStrokeStart"];
  v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    self->_strokeStart = v7;
  }
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPolygonRendererStrokeEnd"];
  v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    self->_strokeEnd = v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayPathRenderer *)&v11 _decodePropertiesWithCoder:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MKMultiPolygonRenderer *)self multiPolygon];
  [v4 encodeObject:v5 forKey:@"MKMultiPolygonPolygon"];

  v6 = [NSNumber numberWithDouble:self->_strokeStart];
  [v4 encodeObject:v6 forKey:@"MKMultiPolygonRendererStrokeStart"];

  double v7 = [NSNumber numberWithDouble:self->_strokeEnd];
  [v4 encodeObject:v7 forKey:@"MKMultiPolygonRendererStrokeEnd"];

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayPathRenderer *)&v8 _encodePropertiesWithCoder:v4];
}

- (void)createPath
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(MKOverlayRenderer *)self _originMapPoint];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(MKOverlayRenderer *)self overlay];
  objc_super v8 = [v7 polygons];
  v29 = (const CGPath **)malloc_type_malloc(8 * [v8 count], 0x6004044C4A2DFuLL);

  Mutable = CGPathCreateMutable();
  v9 = [(MKOverlayRenderer *)self overlay];
  double v10 = [v9 polygons];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [(MKOverlayRenderer *)self overlay];
      v14 = [v13 polygons];
      v15 = [v14 objectAtIndexedSubscript:v12];

      v16 = CGPathCreateMutable();
      _AddPathForPolygon(v16, v15, v4, v6);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v17 = [v15 interiorPolygons];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(id *)(*((void *)&v31 + 1) + 8 * v21);
            if ((unint64_t)[v22 pointCount] > 2)
            {
              v23 = CGPathCreateMutable();
              _AddPathForPolygon(v23, v22, v4, v6);

              if (v23)
              {
                CGPathAddPath(v16, 0, v23);
                CGPathRelease(v23);
              }
            }
            else
            {
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v19);
      }

      v29[v12] = v16;
      CGPathAddPath(Mutable, 0, v16);

      ++v12;
      v24 = [(MKOverlayRenderer *)self overlay];
      v25 = [v24 polygons];
      unint64_t v26 = [v25 count];
    }
    while (v12 < v26);
  }
  self->_paths = v29;
  v27 = [(MKOverlayRenderer *)self overlay];
  v28 = [v27 polygons];
  self->_pathsCount = [v28 count];

  [(MKOverlayPathRenderer *)self setPath:Mutable];
  CGPathRelease(Mutable);
}

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  if (!self->_paths)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKMultiPolygonRenderer;
    [(MKOverlayPathRenderer *)&v10 fillPath:a3 inContext:a4];
  }
  double v6 = [(MKOverlayPathRenderer *)self fillColor];

  if (v6)
  {
    unint64_t pathsCount = self->_pathsCount;
    if (pathsCount)
    {
      for (unint64_t i = 0; i < pathsCount; ++i)
      {
        v9 = self->_paths[i];
        if (v9)
        {
          CGContextSaveGState(a4);
          CGContextBeginPath(a4);
          CGContextAddPath(a4, v9);
          CGContextDrawPath(a4, kCGPathEOFill);
          CGContextRestoreGState(a4);
          unint64_t pathsCount = self->_pathsCount;
        }
      }
    }
  }
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  double v7 = [(MKOverlayPathRenderer *)self strokeColor];

  if (a3 && v7)
  {
    [(MKMultiPolygonRenderer *)self _strokeStart];
    double v9 = v8;
    [(MKMultiPolygonRenderer *)self _strokeEnd];
    double v11 = v10;
    if (v9 > 0.0 || v10 < 1.0)
    {
      v38 = a3;
      CGContextGetLineWidth();
      CGFloat v13 = v12;
      CGLineCap LineCap = CGContextGetLineCap();
      CGLineJoin LineJoin = CGContextGetLineJoin();
      CGContextGetMiterLimit();
      CGFloat v17 = v16;
      [(MKOverlayRenderer *)self _originMapPoint];
      double v19 = v18;
      double v21 = v20;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v22 = [(MKOverlayRenderer *)self overlay];
      v23 = [v22 polygons];

      id obj = v23;
      uint64_t v41 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v41)
      {
        uint64_t v40 = *(void *)v48;
        if (v9 <= 0.0) {
          CGLineCap v24 = LineCap;
        }
        else {
          CGLineCap v24 = kCGLineCapButt;
        }
        if (v11 < 1.0) {
          CGLineCap LineCap = kCGLineCapButt;
        }
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v48 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = v25;
            unint64_t v26 = *(void **)(*((void *)&v47 + 1) + 8 * v25);
            StrokeClipPathForPolygon = _MKPolygonRendererCreateStrokeClipPathForPolygon(v26, v19, v21, v9, v11);
            if (StrokeClipPathForPolygon)
            {
              v28 = StrokeClipPathForPolygon;
              CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(StrokeClipPathForPolygon, kCGLineCapButt, kCGLineCapButt, LineJoin, v13, v17);
              CGContextAddPath(a4, CopyByStrokingPath);
              CGPathRelease(v28);
              CGPathRelease(CopyByStrokingPath);
            }
            v30 = [v26 interiorPolygons];
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v44 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  v35 = _MKPolygonRendererCreateStrokeClipPathForPolygon(*(void **)(*((void *)&v43 + 1) + 8 * i), v19, v21, v9, v11);
                  if (v35)
                  {
                    uint64_t v36 = v35;
                    v37 = _MKCGPathCreateCopyByStrokingPath(v35, v24, LineCap, LineJoin, v13, v17);
                    CGContextAddPath(a4, v37);
                    CGPathRelease(v36);
                    CGPathRelease(v37);
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v51 count:16];
              }
              while (v32);
            }

            uint64_t v25 = v42 + 1;
          }
          while (v42 + 1 != v41);
          uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v41);
      }

      CGContextClip(a4);
      a3 = v38;
    }
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextStrokePath(a4);
  }
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
  id obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(a3, obj->_strokeStart) >= 0.00000011920929)
  {
    [(MKMultiPolygonRenderer *)obj willChangeValueForKey:@"strokeStart"];
    obj->_double strokeStart = a3;
    double v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKMultiPolygonRenderer *)obj didChangeValueForKey:@"strokeStart"];
  }
  objc_sync_exit(obj);
}

- (void)_setStrokeEnd:(double)a3
{
  id obj = self;
  objc_sync_enter(obj);
  if (vabdd_f64(a3, obj->_strokeEnd) >= 0.00000011920929)
  {
    [(MKMultiPolygonRenderer *)obj willChangeValueForKey:@"strokeEnd"];
    obj->_double strokeEnd = a3;
    double v4 = [(MKOverlayRenderer *)obj _renderer];
    [v4 setNeedsDisplayForReason:2];

    [(MKMultiPolygonRenderer *)obj didChangeValueForKey:@"strokeEnd"];
  }
  objc_sync_exit(obj);
}

- (void)setLineWidth:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolygonRenderer;
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
    v6[2] = __39__MKMultiPolygonRenderer_setLineWidth___block_invoke;
    v6[3] = &unk_1E54BB710;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    *(double *)&v6[6] = a3;
    [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"lineWidth" withStepHandler:v6];
  }
}

uint64_t __39__MKMultiPolygonRenderer_setLineWidth___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) setLineWidth:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setLineJoin:(int)a3
{
  BOOL v5 = a3 == 0;
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolygonRenderer;
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
  v5.super_class = (Class)MKMultiPolygonRenderer;
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
  double v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayPathRenderer *)&v15 setFillColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__MKMultiPolygonRenderer_setFillColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"fillColor" withStepHandler:v11];
}

void __39__MKMultiPolygonRenderer_setFillColor___block_invoke(uint64_t a1, float a2)
{
  double v3 = objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(void *)(a1 + 40), a2);
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  id v5 = v4;

  id v6 = v5;
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 224), "setFillColor:", objc_msgSend(v6, "CGColor"));
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
  double v8 = v7;

  v15.receiver = self;
  v15.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayPathRenderer *)&v15 setStrokeColor:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__MKMultiPolygonRenderer_setStrokeColor___block_invoke;
  v11[3] = &unk_1E54BCE88;
  id v12 = v8;
  id v13 = v4;
  v14 = self;
  id v9 = v4;
  id v10 = v8;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"strokeColor" withStepHandler:v11];
}

void __41__MKMultiPolygonRenderer_setStrokeColor___block_invoke(uint64_t a1, float a2)
{
  double v3 = objc_msgSend(*(id *)(a1 + 32), "_mapkit_blendedColorWithFraction:ofColor:", *(void *)(a1 + 40), a2);
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  id v5 = v4;

  id v6 = v5;
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 224), "setStrokeColor:", objc_msgSend(v6, "CGColor"));
}

- (void)setAlpha:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPolygonRenderer;
  -[MKOverlayRenderer setAlpha:](&v7, sel_setAlpha_);
  [(VKVectorOverlayPolygonGroup *)self->_vectorData alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MKMultiPolygonRenderer_setAlpha___block_invoke;
  v6[3] = &unk_1E54BB710;
  v6[4] = self;
  v6[5] = v5;
  *(double *)&v6[6] = a3;
  [(MKOverlayPathRenderer *)self _animateVectorGeometryIfNecessaryForKey:@"alpha" withStepHandler:v6];
}

uint64_t __35__MKMultiPolygonRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) setAlpha:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (BOOL)_canProvideVectorGeometry
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(MKOverlayPathRenderer *)self shouldRasterize]) {
    return 0;
  }
  if ([(MKOverlayPathRenderer *)self _externalSubclassOverridesDrawingMethods])
  {
    return 0;
  }
  double v3 = [(MKOverlayPathRenderer *)self lineDashPattern];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(MKOverlayRenderer *)self overlay];
  id v6 = [v5 polygons];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v16 + 1) + 8 * v10) _isSimple])
        {

          return 0;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v11 = [(MKOverlayPathRenderer *)self strokeColor];
  CGPatternRef Pattern = CGColorGetPattern((CGColorRef)[v11 CGColor]);

  if (Pattern) {
    return 0;
  }
  id v13 = [(MKOverlayPathRenderer *)self fillColor];
  CGPatternRef v14 = CGColorGetPattern((CGColorRef)[v13 CGColor]);

  return !v14 && self->_strokeStart <= 0.0 && self->_strokeEnd >= 1.0;
}

- (id)_vectorGeometry
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_vectorData && [(MKMultiPolygonRenderer *)self _canProvideVectorGeometry])
  {
    double v3 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v4 = [(MKOverlayRenderer *)self overlay];
    uint64_t v5 = [v4 polygons];
    id v6 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [(MKOverlayRenderer *)self overlay];
    uint64_t v8 = [v7 polygons];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x1E4FB3AB8]);
          id v15 = v13;
          long long v16 = objc_msgSend(v14, "initWithMapPoints:count:", objc_msgSend(v15, "points"), objc_msgSend(v15, "pointCount"));
          [v6 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    long long v17 = (VKVectorOverlayPolygonGroup *)[objc_alloc(MEMORY[0x1E4FB3AC0]) initWithPolygons:v6];
    vectorData = self->_vectorData;
    self->_vectorData = v17;

    [(MKOverlayPathRenderer *)self lineWidth];
    -[VKVectorOverlayPolygonGroup setLineWidth:](self->_vectorData, "setLineWidth:");
    CGLineJoin v19 = [(MKOverlayPathRenderer *)self lineJoin];
    if (v19 == kCGLineJoinBevel) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2 * (v19 == kCGLineJoinMiter);
    }
    [(VKVectorOverlayPolygonGroup *)self->_vectorData setLineJoin:v20];
    id v21 = [(MKOverlayPathRenderer *)self fillColor];
    -[VKVectorOverlayPolygonGroup setFillColor:](self->_vectorData, "setFillColor:", [v21 CGColor]);

    id v22 = [(MKOverlayPathRenderer *)self strokeColor];
    -[VKVectorOverlayPolygonGroup setStrokeColor:](self->_vectorData, "setStrokeColor:", [v22 CGColor]);

    [(MKOverlayRenderer *)self alpha];
    -[VKVectorOverlayPolygonGroup setAlpha:](self->_vectorData, "setAlpha:");
    [(MKOverlayPathRenderer *)self miterLimit];
    -[VKVectorOverlayPolygonGroup setMiterLimit:](self->_vectorData, "setMiterLimit:");
  }
  v23 = self->_vectorData;

  return v23;
}

- (id)vectorDataForOverlay:(id)a3
{
  if ([(MKMultiPolygonRenderer *)self _canProvideVectorGeometry])
  {
    uint64_t v4 = [(MKMultiPolygonRenderer *)self _vectorGeometry];
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
    double v3 = [(MKOverlayRenderer *)self _mapView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__MKMultiPolygonRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [v3 _withEffectiveTraitCollection:v5];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKMultiPolygonRenderer;
  [(MKOverlayRenderer *)&v4 _updateRenderColors];
}

void __45__MKMultiPolygonRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fillColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "setFillColor:", objc_msgSend(v2, "CGColor"));

  id v3 = [*(id *)(a1 + 32) strokeColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "setStrokeColor:", objc_msgSend(v3, "CGColor"));
}

- (void).cxx_destruct
{
}

@end
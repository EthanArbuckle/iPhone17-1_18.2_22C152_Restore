@interface PDFSimplePageLayer
- (BOOL)enablesTileUpdates;
- (BOOL)isVisible;
- (CGAffineTransform)layerEffectTransform;
- (PDFSimplePageLayer)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5;
- (id)_pageLayerEffects;
- (id)geometryInterface;
- (id)page;
- (id)pageLayerEffectForID:(id)a3;
- (id)renderingProperties;
- (int64_t)displayBox;
- (unint64_t)visibilityDelegateIndex;
- (void)_pageDidRotate:(id)a3;
- (void)_updateGeometry;
- (void)_updateLayerEffect:(id)a3 withPageTransform:(CGAffineTransform *)a4;
- (void)addPageLayerEffect:(id)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)removePageLayerEffectForID:(id)a3;
- (void)scalePageLayerEffects:(double)a3;
- (void)setNeedsTilesUpdate;
- (void)setVisibilityDelegateIndex:(unint64_t)a3;
- (void)updatePageLayerEffectForID:(id)a3;
- (void)updatePageLayerEffects;
@end

@implementation PDFSimplePageLayer

- (PDFSimplePageLayer)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PDFSimplePageLayer;
  v11 = [(PDFSimplePageLayer *)&v28 init];
  if (v11)
  {
    v12 = [v8 document];
    objc_storeWeak((id *)&v11->_page, v8);
    objc_storeWeak((id *)&v11->_geometryInterface, v9);
    objc_storeWeak((id *)&v11->_renderingProperties, v10);
    [(PDFSimplePageLayer *)v11 setValue:MEMORY[0x263EFFA88] forKeyPath:@"separatedOptions.enableContext"];
    objc_msgSend(v8, "boundsForBox:", objc_msgSend(v10, "displayBox"));
    double v14 = v13;
    double v16 = v15;
    PDFPointMake(0.0, 0.0);
    [(PDFSimplePageLayer *)v11 setFrame:PDFRectToCGRect(v17)];
    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v11 selector:sel__pageDidRotate_ name:@"PDFPageDidRotate" object:v12];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v11 selector:sel__pageDidRotate_ name:@"PDFPageDidChangeBounds" object:v12];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v11 selector:sel__pageChangedPageRef_ name:@"PDFPagePageRefChanged" object:v8];

    v21 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    effectsLayer = v11->_effectsLayer;
    v11->_effectsLayer = v21;

    [(PDFSimplePageLayer *)v11 addSublayer:v11->_effectsLayer];
    -[CALayer setFrame:](v11->_effectsLayer, "setFrame:", 0.0, 0.0, v14, v16);
    [(CALayer *)v11->_effectsLayer setAllowsGroupBlending:0];
    uint64_t v23 = objc_opt_new();
    pageLayerEffects = v11->_pageLayerEffects;
    v11->_pageLayerEffects = (NSMutableDictionary *)v23;

    [(PDFSimplePageLayer *)v11 setContentsScale:2.0];
    [(PDFSimplePageLayer *)v11 setMinificationFilter:*MEMORY[0x263F15DA8]];
    uint64_t v25 = [v12 indexForPage:v8];
    v26 = [NSString stringWithFormat:@"PDFPageLayer, page index %d", v25];
    [(PDFSimplePageLayer *)v11 setName:v26];
  }
  return v11;
}

- (void)dealloc
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__updateGeometry object:0];
  v3.receiver = self;
  v3.super_class = (Class)PDFSimplePageLayer;
  [(PDFSimplePageLayer *)&v3 dealloc];
}

- (id)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return WeakRetained;
}

- (id)geometryInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);

  return WeakRetained;
}

- (id)renderingProperties
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);

  return WeakRetained;
}

- (void)setNeedsTilesUpdate
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__updateGeometry object:0];

  [(PDFSimplePageLayer *)self performSelector:sel__updateGeometry withObject:0 afterDelay:0.25];
}

- (int64_t)displayBox
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
  int64_t v3 = [WeakRetained displayBox];

  return v3;
}

- (BOOL)isVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);
  [WeakRetained rootViewBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained extendedRootViewBounds];
    CGFloat v5 = v12;
    CGFloat v7 = v13;
    CGFloat v9 = v14;
    CGFloat v11 = v15;
  }
  [(PDFSimplePageLayer *)self bounds];
  objc_msgSend(WeakRetained, "convertRectToRootView:fromPageLayer:", self, PDFRectFromCGRect(v16, v17, v18, v19));
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  BOOL v20 = PDFRectIntersectsRect(v22, v23);

  return v20;
}

- (void)addPageLayerEffect:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    pageLayerEffects = self->_pageLayerEffects;
    double v6 = [v13 UUID];
    CGFloat v7 = [(NSMutableDictionary *)pageLayerEffects objectForKey:v6];

    if (v7)
    {
      [v7 removeFromSuperlayer];
      double v8 = self->_pageLayerEffects;
      CGFloat v9 = [v7 UUID];
      [(NSMutableDictionary *)v8 removeObjectForKey:v9];
    }
    [(CALayer *)self->_effectsLayer addSublayer:v13];
    double v10 = self->_pageLayerEffects;
    CGFloat v11 = [v13 UUID];
    [(NSMutableDictionary *)v10 setObject:v13 forKey:v11];

    double v12 = [v13 UUID];
    [(PDFSimplePageLayer *)self updatePageLayerEffectForID:v12];

    [MEMORY[0x263F158F8] commit];
    id v4 = v13;
  }
}

- (void)removePageLayerEffectForID:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_pageLayerEffects, "objectForKey:");
  if (v4)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [v4 removeFromSuperlayer];
    [(NSMutableDictionary *)self->_pageLayerEffects removeObjectForKey:v5];
    [MEMORY[0x263F158F8] commit];
  }
}

- (id)pageLayerEffectForID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pageLayerEffects objectForKey:a3];
}

- (void)updatePageLayerEffectForID:(id)a3
{
  id v4 = [(PDFSimplePageLayer *)self pageLayerEffectForID:a3];
  if (v4)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(PDFSimplePageLayer *)self layerEffectTransform];
    [(PDFSimplePageLayer *)self _updateLayerEffect:v4 withPageTransform:&v5];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)updatePageLayerEffects
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  [(PDFSimplePageLayer *)self layerEffectTransform];
  int64_t v3 = [(PDFSimplePageLayer *)self _pageLayerEffects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9[0] = v14;
        v9[1] = v15;
        v9[2] = v16;
        [(PDFSimplePageLayer *)self _updateLayerEffect:v8 withPageTransform:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }
    while (v5);
  }
  [MEMORY[0x263F158F8] commit];
}

- (CGAffineTransform)layerEffectTransform
{
  BOOL v5 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:0];
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  id v7 = objc_loadWeakRetained((id *)&self->_renderingProperties);
  uint64_t v8 = [v7 displayBox];
  if (WeakRetained)
  {
    [WeakRetained transformForBox:v8];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return (CGAffineTransform *)+[PDFPage setNativeRotationDrawingEnabledForThisThread:v5];
}

- (void)scalePageLayerEffects:(double)a3
{
  [(CALayer *)self->_effectsLayer frame];
  double v6 = v5;
  double v8 = v7;
  effectsLayer = self->_effectsLayer;
  CGAffineTransformMakeScale(&v10, a3, a3);
  [(CALayer *)effectsLayer setAffineTransform:&v10];
  -[CALayer setFrame:](self->_effectsLayer, "setFrame:", 0.0, 0.0, v6, v8);
}

- (BOOL)enablesTileUpdates
{
  return 0;
}

- (void)setVisibilityDelegateIndex:(unint64_t)a3
{
  self->_visibilityDelegateIndex = a3;
}

- (unint64_t)visibilityDelegateIndex
{
  return self->_visibilityDelegateIndex;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(PDFSimplePageLayer *)self frame];
  v8.b = 0.0;
  v8.c = 0.0;
  v8.a = 1.0;
  *(_OWORD *)&v8.d = xmmword_214423050;
  v8.ty = v5;
  CGContextConcatCTM(a3, &v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  id v7 = objc_loadWeakRetained((id *)&self->_renderingProperties);
  objc_msgSend(WeakRetained, "drawWithBox:inContext:", objc_msgSend(v7, "displayBox"), a3);

  CGContextRestoreGState(a3);
}

- (void)_updateGeometry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);
  v3.n128_u64[0] = 0;
  v4.n128_u64[0] = 0;
  objc_msgSend(WeakRetained, "convertRootViewRect:toPageLayer:", self, PDFRectMake(v3, v4, 1.0, 1.0));
  double v6 = 1.0 / v5;
  [(PDFSimplePageLayer *)self setContentsScale:1.0 / v5];
  self->_contentsScale = v6;
  [(PDFSimplePageLayer *)self setNeedsDisplay];
}

- (id)_pageLayerEffects
{
  return (id)[(NSMutableDictionary *)self->_pageLayerEffects allValues];
}

- (void)_updateLayerEffect:(id)a3 withPageTransform:(CGAffineTransform *)a4
{
  id v6 = a3;
  [v6 pageFrame];
  double v8 = v7;
  double CenterPoint = PDFRectGetCenterPoint(v9, v10, v7);
  double v13 = PDFPointToCGPoint(CenterPoint, v12);
  float64x2_t v15 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v14), *(float64x2_t *)&a4->a, v13));
  double v16 = PDFPointFromCGPoint(v15.f64[0], v15.f64[1]);
  PDFRectMakeFromCenter(v16, v17, v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  uint64_t v19 = [WeakRetained rotation];
  id v20 = objc_loadWeakRetained((id *)&self->_renderingProperties);
  objc_msgSend(WeakRetained, "boundsForBox:", objc_msgSend(v20, "displayBox"));
  double v22 = v21;
  double v24 = v23;

  PDFRectRotate(v19, v22, v24);
  long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v28[0] = *MEMORY[0x263F000D0];
  v28[1] = v25;
  v28[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  objc_msgSend(v6, "setFrame:", PDFRectToCGRect(objc_msgSend(v6, "setAffineTransform:", v28)));
  if ([v6 shouldRotateContent])
  {
    double v26 = PDFDegToRad((double)v19);
    CGAffineTransformMakeRotation(&v27, v26);
    [v6 setAffineTransform:&v27];
  }
  [v6 update];
}

- (void)_pageDidRotate:(id)a3
{
  __n128 v4 = [a3 userInfo];
  id v8 = [v4 objectForKeyedSubscript:@"page"];

  id v5 = [(PDFSimplePageLayer *)self page];

  id v6 = v8;
  if (v8 == v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
    objc_msgSend(v8, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));

    PDFPointMake(0.0, 0.0);
    if ([v8 rotation] != 90) {
      [v8 rotation];
    }
    [MEMORY[0x263F158F8] begin];
    -[PDFSimplePageLayer setFrame:](self, "setFrame:", PDFRectToCGRect([MEMORY[0x263F158F8] setDisableActions:1]));
    [(PDFSimplePageLayer *)self display];
    [MEMORY[0x263F158F8] commit];
    [(PDFSimplePageLayer *)self updatePageLayerEffects];
    id v6 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectsLayer, 0);
  objc_storeStrong((id *)&self->_pageLayerEffects, 0);
  objc_destroyWeak((id *)&self->_renderingProperties);
  objc_destroyWeak((id *)&self->_geometryInterface);

  objc_destroyWeak((id *)&self->_page);
}

@end
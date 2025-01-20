@interface PDFPageLayer
- (BOOL)_hasTileWithFrameInLayer:(CGRect)a3;
- (BOOL)_isTile:(id)a3 occludedByTiles:(id)a4;
- (BOOL)enablesTileUpdates;
- (BOOL)isVisible;
- (CGAffineTransform)layerEffectTransform;
- (CGRect)_layerTileToRootViewBounds:(id)a3;
- (CGRect)_pageLayerVisibleRect;
- (PDFPageLayer)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5;
- (id)_pageLayerEffects;
- (id)_subtractRectB:(CGRect)a3 fromRectA:(CGRect)a4;
- (id)geometryInterface;
- (id)page;
- (id)pageLayerEffectForID:(id)a3;
- (id)renderingProperties;
- (int64_t)displayBox;
- (unint64_t)visibilityDelegateIndex;
- (void)_forceTileUpdate;
- (void)_hideTileLayer:(BOOL)a3;
- (void)_printRectsArray:(id)a3;
- (void)_releasePageLayerEffects;
- (void)_releaseTiles;
- (void)_renderingPropertyUpdate:(id)a3;
- (void)_setEnablePageShadows:(BOOL)a3;
- (void)_tileUpdateComplete;
- (void)_updateLayerEffect:(id)a3 withPageTransform:(CGAffineTransform *)a4;
- (void)_updateTiles;
- (void)addPageLayerEffect:(id)a3;
- (void)applyTileLayoutScale:(double)a3;
- (void)dealloc;
- (void)forceTileUpdate;
- (void)removePageLayerEffectForID:(id)a3;
- (void)restoreOriginalTileLayout;
- (void)saveOriginalTileLayout;
- (void)scalePageLayerEffects:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEnableTileUpdates:(BOOL)a3;
- (void)setNeedsTilesUpdate;
- (void)setVisibilityDelegateIndex:(unint64_t)a3;
- (void)tileDrawingComplete:(id)a3;
- (void)updatePageLayerEffectForID:(id)a3;
- (void)updatePageLayerEffects;
@end

@implementation PDFPageLayer

- (PDFPageLayer)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)PDFPageLayer;
  v11 = [(PDFPageLayer *)&v46 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_page, v8);
    objc_storeWeak((id *)&v12->_geometryInterface, v9);
    objc_storeWeak((id *)&v12->_renderingProperties, v10);
    v12->_oldPageRotation = [v8 rotation];
    v13 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    tilesLayer = v12->_tilesLayer;
    v12->_tilesLayer = v13;

    [(CALayer *)v12->_tilesLayer setMasksToBounds:1];
    [(CALayer *)v12->_tilesLayer setZPosition:-800.0];
    [(CALayer *)v12->_tilesLayer setAllowsEdgeAntialiasing:0];
    [(PDFPageLayer *)v12 insertSublayer:v12->_tilesLayer above:v12];
    v15 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    shadowLayer = v12->_shadowLayer;
    v12->_shadowLayer = v15;

    v17 = v12->_shadowLayer;
    id v18 = [MEMORY[0x263F825C8] whiteColor];
    -[CALayer setBackgroundColor:](v17, "setBackgroundColor:", [v18 CGColor]);

    [(CALayer *)v12->_shadowLayer setZPosition:-1000.0];
    [(PDFPageLayer *)v12 insertSublayer:v12->_shadowLayer below:v12->_tilesLayer];
    v19 = v12->_tilesLayer;
    CGAffineTransformMakeScale(&v45, 1.0, -1.0);
    [(CALayer *)v19 setAffineTransform:&v45];
    objc_msgSend(v8, "boundsForBox:", objc_msgSend(v10, "displayBox"));
    double v21 = v20;
    double v23 = v22;
    v12->_oldBoundsForBox.origin.x = v24;
    v12->_oldBoundsForBox.origin.y = v25;
    v12->_oldBoundsForBox.size.width = v20;
    v12->_oldBoundsForBox.size.height = v22;
    PDFPointMake(0.0, 0.0);
    [(PDFPageLayer *)v12 setFrame:PDFRectToCGRect(v26)];
    v27 = v12->_tilesLayer;
    [(PDFPageLayer *)v12 bounds];
    -[CALayer setFrame:](v27, "setFrame:");
    v28 = v12->_shadowLayer;
    [(PDFPageLayer *)v12 bounds];
    -[CALayer setFrame:](v28, "setFrame:");
    v12->_zoomGenerationDelay = 0.25;
    v12->_visibilityDelegateIndex = 0x7FFFFFFFFFFFFFFFLL;
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tiles = v12->_tiles;
    v12->_tiles = v29;

    v12->_tileLayerHidden = 0;
    v12->_allowUpdate = 1;
    atomic_store(0, (unsigned __int8 *)&v12->_isTiling);
    atomic_store(0, (unsigned __int8 *)&v12->_requestedTiling);
    [(PDFPageLayer *)v12 setAllowsGroupBlending:0];
    -[PDFPageLayer _setEnablePageShadows:](v12, "_setEnablePageShadows:", [v10 enablePageShadows]);
    v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v12 selector:sel__renderingPropertyUpdate_ name:@"PDFRenderingPropertiesChanged" object:0];

    v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 addObserver:v12 selector:sel__pageDidRotate_ name:@"PDFPageDidRotate" object:v8];

    v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v12 selector:sel__pageDidRotate_ name:@"PDFPageDidChangeBounds" object:v8];

    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v12 selector:sel__pageChangedPageRef_ name:@"PDFPagePageRefChanged" object:v8];

    v35 = [[PDFTimer alloc] initWithThrottleDelay:sel__forceTileUpdate forSelector:v12 forTarget:0.1];
    forcedUpdateTimer = v12->_forcedUpdateTimer;
    v12->_forcedUpdateTimer = v35;

    v37 = [v8 document];
    uint64_t v38 = [v37 indexForPage:v8];

    v39 = [NSString stringWithFormat:@"PDFPageLayer, page index %d", v38];
    [(PDFPageLayer *)v12 setName:v39];

    v40 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    effectsLayer = v12->_effectsLayer;
    v12->_effectsLayer = v40;

    [(PDFPageLayer *)v12 addSublayer:v12->_effectsLayer];
    -[CALayer setFrame:](v12->_effectsLayer, "setFrame:", 0.0, 0.0, v21, v23);
    [(CALayer *)v12->_effectsLayer setAllowsGroupBlending:0];
    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pageLayerEffects = v12->_pageLayerEffects;
    v12->_pageLayerEffects = v42;
  }
  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFPageLayer;
  [(PDFPageLayer *)&v4 dealloc];
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
  char v3 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_isTiling, (unsigned __int8 *)&v3, 1u);
  if (v3)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_requestedTiling);
  }
  else if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PDFPageLayer *)self _updateTiles];
    [(PDFPageLayer *)self _tileUpdateComplete];
  }
  else
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __35__PDFPageLayer_setNeedsTilesUpdate__block_invoke;
    v4[3] = &unk_2642043A0;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x263EF83A0], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __35__PDFPageLayer_setNeedsTilesUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateTiles];
    [v2 _tileUpdateComplete];
    id WeakRetained = v2;
  }
}

- (int64_t)displayBox
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
  int64_t v3 = [WeakRetained displayBox];

  return v3;
}

- (void)_tileUpdateComplete
{
  atomic_store(0, (unsigned __int8 *)&self->_isTiling);
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_requestedTiling, (unsigned __int8 *)&v2, 0);
  if (v2 == 1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PDFPageLayer__tileUpdateComplete__block_invoke;
    block[3] = &unk_264203940;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __35__PDFPageLayer__tileUpdateComplete__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsTilesUpdate];
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
  [(PDFPageLayer *)self bounds];
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
    [(PDFPageLayer *)self updatePageLayerEffectForID:v12];

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

- (id)_pageLayerEffects
{
  return (id)[(NSMutableDictionary *)self->_pageLayerEffects allValues];
}

- (void)updatePageLayerEffectForID:(id)a3
{
  id v4 = [(PDFPageLayer *)self pageLayerEffectForID:a3];
  if (v4)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(PDFPageLayer *)self layerEffectTransform];
    [(PDFPageLayer *)self _updateLayerEffect:v4 withPageTransform:&v5];
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
  [(PDFPageLayer *)self layerEffectTransform];
  int64_t v3 = [(PDFPageLayer *)self _pageLayerEffects];
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
        [(PDFPageLayer *)self _updateLayerEffect:v8 withPageTransform:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }
    while (v5);
  }
  [MEMORY[0x263F158F8] commit];
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

- (void)setEnableTileUpdates:(BOOL)a3
{
  self->_allowUpdate = a3;
}

- (void)forceTileUpdate
{
}

- (void)_forceTileUpdate
{
  if (!self->_isForcingUpdate)
  {
    self->_isForcingUpdate = 1;
    [(PDFPageLayer *)self setNeedsTilesUpdate];
  }
}

- (BOOL)enablesTileUpdates
{
  return self->_allowUpdate;
}

- (void)saveOriginalTileLayout
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v2 = self->_tiles;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(char **)(*((void *)&v16 + 1) + 8 * v6);
        double v8 = v7 + 112;
        objc_msgSend(v7, "frame", (void)v16);
        *(double *)double v8 = PDFRectFromCGRect(v9, v10, v11, v12);
        *((void *)v8 + 1) = v13;
        *((void *)v8 + 2) = v14;
        *((void *)v8 + 3) = v15;
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (void)restoreOriginalTileLayout
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = self->_tiles;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = *MEMORY[0x263F15DF0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        double v9 = PDFRectToCGRect(v3);
        objc_msgSend(v8, "setFrame:", v9, (void)v10);
        uint64_t v3 = [v8 setContentsGravity:v6];
        ++v7;
      }
      while (v4 != v7);
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (void)applyTileLayoutScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_tiles;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x263F15E20];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        double v10 = PDFRectToCGRect(v4);
        objc_msgSend(v9, "setFrame:", v10, (void)v11);
        uint64_t v4 = [v9 setContentsGravity:v7];
        ++v8;
      }
      while (v5 != v8);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

- (void)setVisibilityDelegateIndex:(unint64_t)a3
{
  self->_visibilityDelegateIndex = a3;
}

- (unint64_t)visibilityDelegateIndex
{
  return self->_visibilityDelegateIndex;
}

- (void)setBounds:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PDFPageLayer;
  -[PDFPageLayer setBounds:](&v18, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CALayer *)self->_tilesLayer frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(PDFPageLayer *)self bounds];
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    tilesLayer = self->_tilesLayer;
    [(PDFPageLayer *)self bounds];
    -[CALayer setFrame:](tilesLayer, "setFrame:");
    shadowLayer = self->_shadowLayer;
    [(PDFPageLayer *)self bounds];
    -[CALayer setFrame:](shadowLayer, "setFrame:");
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_releaseTiles
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_tiles count])
  {
    [MEMORY[0x263F158F8] begin];
    uint64_t v3 = (void *)MEMORY[0x2166A0EA0]([MEMORY[0x263F158F8] setDisableActions:1]);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v4 = self->_tiles;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "removeFromSuperlayer", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->_tiles removeAllObjects];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_releasePageLayerEffects
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableDictionary *)self->_pageLayerEffects objectEnumerator];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeFromSuperlayer];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->_pageLayerEffects removeAllObjects];
}

- (void)_hideTileLayer:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_tileLayerHidden != a3)
  {
    BOOL v3 = a3;
    self->_tileLayerHidden = a3;
    -[CALayer setHidden:](self->_tilesLayer, "setHidden:");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = self->_tiles;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setHidden:", v3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setEnablePageShadows:(BOOL)a3
{
  shadowLayer = self->_shadowLayer;
  uint64_t v14 = shadowLayer;
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x263F825C8];
    uint64_t v6 = shadowLayer;
    uint64_t v7 = self;
    uint64_t v8 = [v5 blackColor];
    id v9 = [v8 colorWithAlphaComponent:0.0586];
    -[PDFPageLayer setBorderColor:](v7, "setBorderColor:", [v9 CGColor]);

    [(PDFPageLayer *)v7 setBorderWidth:1.0];
    [(PDFPageLayer *)v7 setShadowPathIsBounds:1];
    LODWORD(v10) = 1043878380;
    [(PDFPageLayer *)v7 setShadowOpacity:v10];
    [(PDFPageLayer *)v7 setShadowRadius:2.0];
    -[PDFPageLayer setShadowOffset:](v7, "setShadowOffset:", 0.0, -1.0);

    [(CALayer *)v6 setShadowPathIsBounds:1];
    LODWORD(v11) = 1036831949;
    [(CALayer *)v6 setShadowOpacity:v11];
    [(CALayer *)v6 setShadowRadius:6.0];
    -[CALayer setShadowOffset:](v6, "setShadowOffset:", 0.0, -2.0);
  }
  else
  {
    long long v12 = shadowLayer;
    long long v13 = self;
    [(PDFPageLayer *)v13 setBorderWidth:0.0];
    [(PDFPageLayer *)v13 setShadowOpacity:0.0];
    [(PDFPageLayer *)v13 setShadowRadius:0.0];

    [(CALayer *)v12 setShadowOpacity:0.0];
    [(CALayer *)v12 setShadowRadius:0.0];
  }
}

- (void)tileDrawingComplete:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  context = (void *)MEMORY[0x2166A0EA0]();
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v7 = self->_tiles;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(_DWORD **)(*((void *)&v52 + 1) + 8 * i);
        if (([v12 isWorking] & 1) == 0)
        {
          long long v13 = v5;
          if (v12[26] < v4[26] || (v14 = [v12 hasContent], long long v13 = v6, v14)) {
            [v13 addObject:v12];
          }
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v9);
  }

  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        if ([v6 count]
          && [(PDFPageLayer *)self _isTile:v21 occludedByTiles:v6])
        {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v18);
  }

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  while ([v15 count])
  {
    double v22 = [v15 lastObject];
    [v15 removeLastObject];
    [v22 removeFromSuperlayer];
    [(NSMutableArray *)self->_tiles removeObject:v22];
  }
  [MEMORY[0x263F158F8] commit];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v23 = self->_tiles;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v45;
    while (2)
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [*(id *)(*((void *)&v44 + 1) + 8 * k) contents];

        if (!v28)
        {
          int v29 = 0;
          goto LABEL_34;
        }
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v44 objects:v58 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
  int v29 = 1;
LABEL_34:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v31 = WeakRetained;
  if (v29 && WeakRetained)
  {
    v56[1] = @"pageViewFrameInPDFView";
    v57[0] = WeakRetained;
    v56[0] = @"page";
    v32 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", self->_lastLayerFrameInRootView.origin.x, self->_lastLayerFrameInRootView.origin.y, self->_lastLayerFrameInRootView.size.width, self->_lastLayerFrameInRootView.size.height);
    v57[1] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 postNotificationName:@"PDFPageDrawingComplete" object:self userInfo:v33];
  }
  if (GetDefaultsWriteLogPerfTimes())
  {
    v35 = [v31 document];
    uint64_t v36 = [v35 indexForPage:v31];

    if (v29)
    {
      v37 = [MEMORY[0x263EFF910] date];
      [v37 timeIntervalSince1970];
      unint64_t v39 = (unint64_t)(v38 * 1000.0);

      v40 = [MEMORY[0x263EFF910] date];
      [v40 timeIntervalSinceDate:self->_lastZoomChange];
      float v42 = v41;

      NSLog(&cfstr_Pdfkit2Logperf_1.isa, v36, v39, v42);
    }
    NSLog(&cfstr_Pdfkit2Logperf_2.isa, v36, -[NSMutableArray count](self->_tiles, "count"), [v16 count], objc_msgSend(v6, "count"), context);
  }
}

- (BOOL)_isTile:(id)a3 occludedByTiles:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = (void *)MEMORY[0x263F08D40];
  [(PDFPageLayer *)self _layerTileToRootViewBounds:v6];
  uint64_t v10 = objc_msgSend(v9, "PDFKitValueWithPDFRect:");
  [v8 addObject:v10];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        -[PDFPageLayer _layerTileToRootViewBounds:](self, "_layerTileToRootViewBounds:", *(void *)(*((void *)&v33 + 1) + 8 * i), (void)v33);
        if (v18 > 0.0001)
        {
          double v20 = v19;
          if (v19 > 0.0001)
          {
            double v21 = v16;
            double v22 = v17;
            double v23 = v18;
            if ([v8 count])
            {
              unint64_t v24 = 0;
              do
              {
                uint64_t v25 = [v8 objectAtIndex:0];
                [v8 removeObjectAtIndex:0];
                [v25 PDFKitPDFRectValue];
                v30 = -[PDFPageLayer _subtractRectB:fromRectA:](self, "_subtractRectB:fromRectA:", v21, v22, v23, v20, v26, v27, v28, v29);
                if (v30 || [0 count]) {
                  [v8 addObjectsFromArray:v30];
                }

                ++v24;
              }
              while (v24 < [v8 count]);
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }

  BOOL v31 = [v8 count] == 0;
  return v31;
}

- (id)_subtractRectB:(CGRect)a3 fromRectA:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v128[1] = *MEMORY[0x263EF8340];
  v148.origin.double x = v11;
  v148.origin.double y = v10;
  v148.size.double width = v9;
  v148.size.double height = v8;
  if (!PDFRectIntersectsRect(a4, v148))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", x, y, width, height);
    v128[0] = v13;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:1];
LABEL_5:

    goto LABEL_6;
  }
  v131.origin.double x = v11;
  v131.origin.double y = v10;
  v131.size.double width = v9;
  v131.size.double height = v8;
  v149.origin.double x = x;
  v149.origin.double y = y;
  v149.size.double width = width;
  v149.size.double height = height;
  if (PDFRectContainsRect(v131, v149))
  {
    id v12 = 0;
    goto LABEL_6;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (x >= v11) {
    double v15 = v11;
  }
  else {
    double v15 = x;
  }
  if (y >= v10) {
    double v16 = v10;
  }
  else {
    double v16 = y;
  }
  double v17 = x + width;
  double v127 = v11 + v9;
  if (x + width < v11 + v9) {
    double v17 = v11 + v9;
  }
  double v124 = v15;
  double v125 = v17;
  double v18 = y + height;
  double v126 = v10 + v8;
  if (y + height < v10 + v8) {
    double v18 = v10 + v8;
  }
  double v122 = v18;
  double v123 = v16;
  double v19 = PDFPointMake(v15, v16);
  unint64_t v21 = v20;
  double v22 = PDFPointMake(v11, v10);
  double v24 = v23;
  v25.n128_f64[0] = v19;
  v26.n128_u64[0] = v21;
  PDFPageLayerTileRectFromPoints(v25, v26, v22, v24);
  v150.origin.double x = v27;
  v150.origin.double y = v28;
  v150.size.double width = v29;
  v150.size.double height = v30;
  v132.origin.double x = x;
  v132.origin.double y = y;
  v132.size.double width = width;
  v132.size.double height = height;
  CGRect v133 = PDFRectIntersection(v132, v150);
  if (v133.size.width > 0.0001 && v133.size.height > 0.0001)
  {
    BOOL v31 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v133.origin.x, v133.origin.y);
    [v12 addObject:v31];
  }
  double v32 = PDFPointMake(v11, v123);
  unint64_t v34 = v33;
  double v35 = PDFPointMake(v127, v10);
  double v37 = v36;
  v38.n128_f64[0] = v32;
  v39.n128_u64[0] = v34;
  PDFPageLayerTileRectFromPoints(v38, v39, v35, v37);
  v151.origin.double x = v40;
  v151.origin.double y = v41;
  v151.size.double width = v42;
  v151.size.double height = v43;
  v134.origin.double x = x;
  v134.origin.double y = y;
  v134.size.double width = width;
  v134.size.double height = height;
  CGRect v135 = PDFRectIntersection(v134, v151);
  if (v135.size.width > 0.0001 && v135.size.height > 0.0001)
  {
    long long v44 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v135.origin.x, v135.origin.y);
    [v12 addObject:v44];
  }
  double v45 = PDFPointMake(v127, v123);
  unint64_t v47 = v46;
  double v48 = PDFPointMake(v125, v10);
  double v50 = v49;
  v51.n128_f64[0] = v45;
  v52.n128_u64[0] = v47;
  PDFPageLayerTileRectFromPoints(v51, v52, v48, v50);
  v152.origin.double x = v53;
  v152.origin.double y = v54;
  v152.size.double width = v55;
  v152.size.double height = v56;
  v136.origin.double x = x;
  v136.origin.double y = y;
  v136.size.double width = width;
  v136.size.double height = height;
  CGRect v137 = PDFRectIntersection(v136, v152);
  if (v137.size.width > 0.0001 && v137.size.height > 0.0001)
  {
    v57 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v137.origin.x, v137.origin.y);
    [v12 addObject:v57];
  }
  double v58 = PDFPointMake(v124, v10);
  unint64_t v60 = v59;
  double v61 = PDFPointMake(v11, v126);
  double v63 = v62;
  v64.n128_f64[0] = v58;
  v65.n128_u64[0] = v60;
  PDFPageLayerTileRectFromPoints(v64, v65, v61, v63);
  v153.origin.double x = v66;
  v153.origin.double y = v67;
  v153.size.double width = v68;
  v153.size.double height = v69;
  v138.origin.double x = x;
  v138.origin.double y = y;
  v138.size.double width = width;
  v138.size.double height = height;
  CGRect v139 = PDFRectIntersection(v138, v153);
  if (v139.size.width > 0.0001 && v139.size.height > 0.0001)
  {
    v70 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v139.origin.x, v139.origin.y);
    [v12 addObject:v70];
  }
  double v71 = PDFPointMake(v127, v10);
  unint64_t v73 = v72;
  double v74 = PDFPointMake(v125, v126);
  double v76 = v75;
  v77.n128_f64[0] = v71;
  v78.n128_u64[0] = v73;
  PDFPageLayerTileRectFromPoints(v77, v78, v74, v76);
  v154.origin.double x = v79;
  v154.origin.double y = v80;
  v154.size.double width = v81;
  v154.size.double height = v82;
  v140.origin.double x = x;
  v140.origin.double y = y;
  v140.size.double width = width;
  v140.size.double height = height;
  CGRect v141 = PDFRectIntersection(v140, v154);
  if (v141.size.width > 0.0001 && v141.size.height > 0.0001)
  {
    v83 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v141.origin.x, v141.origin.y);
    [v12 addObject:v83];
  }
  double v84 = PDFPointMake(v124, v126);
  unint64_t v86 = v85;
  double v87 = PDFPointMake(v11, v122);
  double v89 = v88;
  v90.n128_f64[0] = v84;
  v91.n128_u64[0] = v86;
  PDFPageLayerTileRectFromPoints(v90, v91, v87, v89);
  v155.origin.double x = v92;
  v155.origin.double y = v93;
  v155.size.double width = v94;
  v155.size.double height = v95;
  v142.origin.double x = x;
  v142.origin.double y = y;
  v142.size.double width = width;
  v142.size.double height = height;
  CGRect v143 = PDFRectIntersection(v142, v155);
  if (v143.size.width > 0.0001 && v143.size.height > 0.0001)
  {
    v96 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v143.origin.x, v143.origin.y);
    [v12 addObject:v96];
  }
  double v97 = PDFPointMake(v11, v126);
  unint64_t v99 = v98;
  double v100 = PDFPointMake(v127, v122);
  double v102 = v101;
  v103.n128_f64[0] = v97;
  v104.n128_u64[0] = v99;
  PDFPageLayerTileRectFromPoints(v103, v104, v100, v102);
  v156.origin.double x = v105;
  v156.origin.double y = v106;
  v156.size.double width = v107;
  v156.size.double height = v108;
  v144.origin.double x = x;
  v144.origin.double y = y;
  v144.size.double width = width;
  v144.size.double height = height;
  CGRect v145 = PDFRectIntersection(v144, v156);
  if (v145.size.width > 0.0001 && v145.size.height > 0.0001)
  {
    v109 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v145.origin.x, v145.origin.y);
    [v12 addObject:v109];
  }
  double v110 = PDFPointMake(v127, v126);
  unint64_t v112 = v111;
  double v113 = PDFPointMake(v125, v122);
  double v115 = v114;
  v116.n128_f64[0] = v110;
  v117.n128_u64[0] = v112;
  PDFPageLayerTileRectFromPoints(v116, v117, v113, v115);
  v157.origin.double x = v118;
  v157.origin.double y = v119;
  v157.size.double width = v120;
  v157.size.double height = v121;
  v146.origin.double x = x;
  v146.origin.double y = y;
  v146.size.double width = width;
  v146.size.double height = height;
  CGRect v147 = PDFRectIntersection(v146, v157);
  if (v147.size.width > 0.0001 && v147.size.height > 0.0001)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v147.origin.x, v147.origin.y);
    [v12 addObject:v13];
    goto LABEL_5;
  }
LABEL_6:

  return v12;
}

- (CGRect)_layerTileToRootViewBounds:(id)a3
{
  p_geometryInterface = &self->_geometryInterface;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_geometryInterface);
  [v5 bounds];
  objc_msgSend(v5, "convertRect:toLayer:", self);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  CGFloat v15 = PDFRectFromCGRect(v8, v10, v12, v14);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(PDFPageLayer *)self bounds];
  v54.origin.CGFloat x = PDFRectFromCGRect(v22, v23, v24, v25);
  v59.origin.CGFloat x = v15;
  v59.origin.CGFloat y = v17;
  v59.size.CGFloat width = v19;
  v59.size.CGFloat height = v21;
  CGRect v55 = PDFRectIntersection(v54, v59);
  objc_msgSend(WeakRetained, "convertRectToRootView:fromPageLayer:", self, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  [WeakRetained rootViewBounds];
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained extendedRootViewBounds];
    CGFloat v35 = v42;
    CGFloat v37 = v43;
    CGFloat v39 = v44;
    CGFloat v41 = v45;
  }
  v56.origin.CGFloat x = v27;
  v56.origin.CGFloat y = v29;
  v56.size.CGFloat width = v31;
  v56.size.CGFloat height = v33;
  v60.origin.CGFloat x = v35;
  v60.origin.CGFloat y = v37;
  v60.size.CGFloat width = v39;
  v60.size.CGFloat height = v41;
  CGRect v57 = PDFRectIntersection(v56, v60);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;

  double v50 = x;
  double v51 = y;
  double v52 = width;
  double v53 = height;
  result.size.CGFloat height = v53;
  result.size.CGFloat width = v52;
  result.origin.CGFloat y = v51;
  result.origin.CGFloat x = v50;
  return result;
}

- (CGRect)_pageLayerVisibleRect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);
  [WeakRetained rootViewBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained extendedRootViewBounds];
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  [(PDFPageLayer *)self frame];
  CGFloat v20 = PDFRectFromCGRect(v16, v17, v18, v19);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  objc_msgSend(WeakRetained, "convertRootViewRect:toPageLayer:", self, v5, v7, v9, v11);
  v42.origin.CGFloat x = v27;
  v42.origin.CGFloat y = v28;
  v42.size.CGFloat width = v29;
  v42.size.CGFloat height = v30;
  v39.origin.CGFloat x = v20;
  v39.origin.CGFloat y = v22;
  v39.size.CGFloat width = v24;
  v39.size.CGFloat height = v26;
  CGRect v40 = PDFRectIntersection(v39, v42);
  CGFloat x = v40.origin.x;
  CGFloat y = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;

  double v35 = x;
  double v36 = y;
  double v37 = width;
  double v38 = height;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (BOOL)_hasTileWithFrameInLayer:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = self->_tiles;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "frame", (void)v19);
        if (vabdd_f64(PDFRectFromCGRect(v11, v12, v13, v14), x) < 0.0001
          && vabdd_f64(v15, y) < 0.0001
          && vabdd_f64(v16, width) < 0.0001
          && vabdd_f64(v17, height) < 0.0001)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v8;
}

- (void)_printRectsArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  NSLog(&cfstr_RectCountD.isa, [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v8) PDFKitPDFRectValue];
        double v13 = PDFRectToString(v9, v10, v11, v12);
        NSLog(&cfstr_Rectvalue.isa, v13);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_renderingPropertyUpdate:(id)a3
{
  id v7 = [a3 userInfo];
  id v4 = [v7 objectForKey:@"PDFRenderingPropertyKey"];
  uint64_t v5 = [v4 integerValue];

  if (v5)
  {
    if (v5 == 6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
      -[PDFPageLayer _setEnablePageShadows:](self, "_setEnablePageShadows:", [WeakRetained enablePageShadows]);
    }
  }
  else
  {
    [(PDFPageLayer *)self setNeedsTilesUpdate];
    [(PDFPageLayer *)self updatePageLayerEffects];
  }
}

- (void)_updateTiles
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
  id v4 = WeakRetained;
  if (!self->_tileLayerHidden && self->_allowUpdate && [WeakRetained enableTileUpdates])
  {
    if ([(PDFPageLayer *)self isVisible] && (GetDefaultsWriteDrawTiles() & 1) != 0)
    {
      BOOL isForcingUpdate = self->_isForcingUpdate;
      if (self->_isForcingUpdate) {
        ++self->_generationCount;
      }
      id v6 = objc_loadWeakRetained((id *)&self->_page);
      objc_msgSend(v6, "boundsForBox:", objc_msgSend(v4, "displayBox"));
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      int64_t oldPageRotation = self->_oldPageRotation;
      CGRect v144 = v6;
      if (oldPageRotation != [v6 rotation]
        || (v167.origin.double x = v8,
            v167.origin.double y = v10,
            v167.size.double width = v12,
            v167.size.double height = v14,
            !PDFRectEqualToRect(self->_oldBoundsForBox, v167)))
      {
        self->_int64_t oldPageRotation = [v6 rotation];
        self->_oldBoundsForBox.origin.double x = v8;
        self->_oldBoundsForBox.origin.double y = v10;
        self->_oldBoundsForBox.size.double width = v12;
        self->_oldBoundsForBox.size.double height = v14;
        [(PDFPageLayer *)self clearTiles];
      }
      double v140 = v12;
      id v16 = objc_loadWeakRetained((id *)&self->_geometryInterface);
      [v16 rootViewBounds];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      obuint64_t j = v14;
      if (objc_opt_respondsToSelector())
      {
        [v16 extendedRootViewBounds];
        double v18 = v25;
        double v20 = v26;
        double v22 = v27;
        double v24 = v28;
      }
      [(PDFPageLayer *)self bounds];
      objc_msgSend(v16, "convertRectToRootView:fromPageLayer:", self, PDFRectFromCGRect(v29, v30, v31, v32));
      double v34 = v33;
      double v118 = v35;
      double v37 = v36;
      double v39 = v38;
      CGRect v143 = +[PDFTilePool sharedPool];
      double v40 = (double)(int)[v143 tileSurfaceSize];
      v41.n128_u64[0] = 0;
      v42.n128_u64[0] = 0;
      double v125 = v16;
      objc_msgSend(v16, "convertRootViewRect:toPageLayer:", self, PDFRectMake(v41, v42, v40, v40));
      double v135 = v40;
      double v126 = v43;
      double v124 = v40 / v43;
      if (vabdd_f64(self->_lastLayoutZoomFactor, v40 / v43) > 0.0001)
      {
        CGFloat v44 = v34;
        double v45 = [MEMORY[0x263EFF910] date];
        [v45 timeIntervalSinceDate:self->_lastZoomChange];
        double v47 = v46;

        if (self->_lastZoomChange && v47 < self->_zoomGenerationDelay)
        {
          if (!self->_zoomChangeScheduled)
          {
            self->_zoomChangeScheduled = 1;
            objc_initWeak((id *)&location, self);
            dispatch_time_t v48 = dispatch_time(0, (uint64_t)(self->_zoomGenerationDelay * 1000000000.0));
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __28__PDFPageLayer__updateTiles__block_invoke;
            block[3] = &unk_2642043A0;
            objc_copyWeak(&v161, (id *)&location);
            dispatch_after(v48, MEMORY[0x263EF83A0], block);
            objc_destroyWeak(&v161);
            objc_destroyWeak((id *)&location);
          }
LABEL_69:

          goto LABEL_2;
        }
        self->_lastLayoutZoomFactor = v124;
        double v34 = v44;
        self->_lastLayerFrameInRootView.origin.double x = v44;
        self->_lastLayerFrameInRootView.origin.double y = v118;
        self->_lastLayerFrameInRootView.size.double width = v37;
        self->_lastLayerFrameInRootView.size.double height = v39;
        ++self->_generationCount;
        double v49 = [MEMORY[0x263EFF910] date];
        lastZoomChange = self->_lastZoomChange;
        self->_lastZoomChange = v49;

        [(PDFPageLayer *)self updatePageLayerEffects];
      }
      id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
      v53.n128_f64[0] = v18 - v34;
      if (v34 >= v18) {
        int v121 = 0;
      }
      else {
        int v121 = (int)(v53.n128_f64[0] / v135);
      }
      CGFloat v134 = v22;
      uint64_t v116 = 224;
      double v54 = v20 - v118;
      CGRect v142 = v4;
      if (v118 >= v20)
      {
        int v56 = 0;
        double v55 = v135;
      }
      else
      {
        double v55 = v135;
        int v56 = (int)(v54 / v135);
      }
      double v57 = v24 + v54;
      CGFloat v133 = v24;
      if (v39 <= v24) {
        double v57 = v39;
      }
      int v120 = (int)(v57 / v55);
      if (v56 <= v120)
      {
        double v58 = v22 + v53.n128_f64[0];
        if (v37 <= v22) {
          double v58 = v37;
        }
        int v59 = (int)(v58 / v55);
        float v60 = v124 * ceil(v140 * v124) / (v140 * v124);
        float v61 = v124 * ceil(obj * v124) / (obj * v124);
        double v122 = v61;
        double v123 = v60;
        int v119 = v59;
        int v62 = v59 + 1;
        double v63 = (_OWORD *)MEMORY[0x263F000D0];
        double v130 = v34;
        double v132 = v18;
        do
        {
          if (v121 <= v119)
          {
            double obja = v118 + (double)v56 * v55;
            int v64 = v121;
            do
            {
              v53.n128_f64[0] = v34 + (double)v64 * v55;
              v52.n128_f64[0] = obja;
              v165.origin.double x = PDFRectMake(v53, v52, v55, v55);
              double x = v165.origin.x;
              double y = v165.origin.y;
              double width = v165.size.width;
              double height = v165.size.height;
              v168.origin.double x = v18;
              double v69 = v20;
              v168.origin.double y = v20;
              v168.size.double height = v133;
              v168.size.double width = v134;
              if (PDFRectIntersectsRect(v165, v168))
              {
                v52.n128_f64[0] = v126 * (double)v56;
                v53.n128_f64[0] = v126 * (double)v64;
                double v70 = PDFRectMake(v53, v52, v126, v126);
                double v74 = v70;
                double v75 = v71;
                double v141 = v72;
                double v76 = v73;
                if (isForcingUpdate
                  || !-[PDFPageLayer _hasTileWithFrameInLayer:](self, "_hasTileWithFrameInLayer:", v70, v71, v72, v73))
                {
                  long long v129 = v63[1];
                  *(_OWORD *)&location.a = *v63;
                  long long v128 = *(_OWORD *)&location.a;
                  *(_OWORD *)&location.c = v129;
                  *(_OWORD *)&location.tdouble x = v63[2];
                  long long v127 = *(_OWORD *)&location.tx;
                  CGAffineTransformMakeTranslation(&t2, -v74, -v75);
                  *(_OWORD *)&t1.a = v128;
                  *(_OWORD *)&t1.c = v129;
                  *(_OWORD *)&t1.tdouble x = v127;
                  CGAffineTransformConcat(&location, &t1, &t2);
                  CGAffineTransformMakeScale(&v156, v123, v122);
                  CGAffineTransform v155 = location;
                  CGAffineTransformConcat(&t1, &v155, &v156);
                  CGAffineTransform location = t1;
                  __n128 v77 = [PDFPageLayerTile alloc];
                  uint64_t generationCount = self->_generationCount;
                  CGAffineTransform t1 = location;
                  CGFloat v79 = -[PDFPageLayerTile initWithFrame:forPageLayer:withRenderingTransform:tileContentsScale:generationID:](v77, "initWithFrame:forPageLayer:withRenderingTransform:tileContentsScale:generationID:", self, &t1, generationCount, v74, v75, v141, v76, v124);
                  -[PDFPageLayerTile setRootViewFrame:](v79, "setRootViewFrame:", x, y, width, height);
                  if ([v125 flipsTileContents])
                  {
                    CGAffineTransformMakeScale(&v154, 1.0, -1.0);
                    [(PDFPageLayerTile *)v79 setAffineTransform:&v154];
                  }
                  objc_msgSend(v51, "addObject:", v79, v116);
                }
              }
              ++v64;
              double v34 = v130;
              double v18 = v132;
              double v20 = v69;
              double v55 = v135;
            }
            while (v62 != v64);
          }
        }
        while (v56++ != v120);
      }
      CGRect v131 = v51;
      CGFloat v81 = -[NSMutableArray sortedArrayUsingComparator:](self->_tiles, "sortedArrayUsingComparator:", &__block_literal_global_7, v116);
      id v82 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id objb = v81;
      uint64_t v83 = [objb countByEnumeratingWithState:&v150 objects:v163 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v151;
        do
        {
          for (uint64_t i = 0; i != v84; ++i)
          {
            if (*(void *)v151 != v85) {
              objc_enumerationMutation(objb);
            }
            double v87 = *(_DWORD **)(*((void *)&v150 + 1) + 8 * i);
            if (v87[26] >= self->_generationCount - 8
              && (([*(id *)(*((void *)&v150 + 1) + 8 * i) isWorking] & 1) != 0
               || ([v87 hasContent] & 1) != 0
               || v87[26] >= self->_generationCount))
            {
              [v87 bounds];
              objc_msgSend(v87, "convertRect:toLayer:", self);
              objc_msgSend(v125, "convertRectToRootView:fromPageLayer:", self, PDFRectFromCGRect(v88, v89, v90, v91));
              v169.origin.double x = v18;
              v169.origin.double y = v20;
              v169.size.double width = v134;
              v169.size.double height = v133;
              if (PDFRectIntersectsRect(v166, v169)) {
                continue;
              }
            }
            [v82 addObject:v87];
          }
          uint64_t v84 = [objb countByEnumeratingWithState:&v150 objects:v163 count:16];
        }
        while (v84);
      }

      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      while ([v82 count])
      {
        CGFloat v92 = [v82 lastObject];
        [v82 removeLastObject];
        [v92 removeFromSuperlayer];
        [(NSMutableArray *)self->_tiles removeObject:v92];
      }
      [MEMORY[0x263F158F8] commit];
      [v125 rootViewBounds];
      double CenterPoint = PDFRectGetCenterPoint(v93, v94, v95);
      v149[0] = MEMORY[0x263EF8330];
      v149[1] = 3221225472;
      v149[2] = __28__PDFPageLayer__updateTiles__block_invoke_3;
      v149[3] = &__block_descriptor_48_e47_q24__0__PDFPageLayerTile_8__PDFPageLayerTile_16l;
      *(double *)&v149[4] = CenterPoint;
      v149[5] = v97;
      unint64_t v98 = [v51 sortedArrayUsingComparator:v149];
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v136 = v98;
      uint64_t v99 = [v136 countByEnumeratingWithState:&v145 objects:v162 count:16];
      if (v99)
      {
        uint64_t v100 = v99;
        uint64_t v101 = *(void *)v146;
        do
        {
          for (uint64_t j = 0; j != v100; ++j)
          {
            if (*(void *)v146 != v101) {
              objc_enumerationMutation(v136);
            }
            uint64_t v103 = *(void *)(*((void *)&v145 + 1) + 8 * j);
            [(CALayer *)self->_tilesLayer addSublayer:v103];
            [(NSMutableArray *)self->_tiles addObject:v103];
            [(id)v103 setZPosition:-800.0];
            double v104 = *(double *)(v103 + 88);
            [(id)v103 frame];
            double v109 = PDFRectFromCGRect(v105, v106, v107, v108);
            double v111 = v110;
            ++_updateTiles_requestTag;
            long long v112 = *(_OWORD *)(v103 + 40);
            long long v113 = *(_OWORD *)(v103 + 72);
            *(_OWORD *)&location.c = *(_OWORD *)(v103 + 56);
            *(_OWORD *)&location.tdouble x = v113;
            *(_OWORD *)&location.a = v112;
            objc_msgSend(v143, "requestPDFTileSurfaceForTarget:forPage:withRenderingProperties:atZoomFactor:frame:transform:tag:", v103, v144, v142, &location, v104, v109, v114, v111, v115);
          }
          uint64_t v100 = [v136 countByEnumeratingWithState:&v145 objects:v162 count:16];
        }
        while (v100);
      }

      [MEMORY[0x263F158F8] commit];
      if (isForcingUpdate) {
        *((unsigned char *)&self->super.super.isa + v117) = 0;
      }

      id v4 = v142;
      goto LABEL_69;
    }
    self->_BOOL isForcingUpdate = 0;
    [(PDFPageLayer *)self _releaseTiles];
  }
LABEL_2:
}

void __28__PDFPageLayer__updateTiles__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    int v2 = WeakRetained;
    [WeakRetained _updateTiles];
    id WeakRetained = v2;
  }
}

uint64_t __28__PDFPageLayer__updateTiles__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a2 + 104) < *(_DWORD *)(a3 + 104)) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __28__PDFPageLayer__updateTiles__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 rootViewFrame];
  double CenterPoint = PDFRectGetCenterPoint(v6, v7, v8);
  double v11 = sqrt((v10 - *(double *)(a1 + 40)) * (v10 - *(double *)(a1 + 40))+ (CenterPoint - *(double *)(a1 + 32)) * (CenterPoint - *(double *)(a1 + 32)));
  [v5 rootViewFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = PDFRectGetCenterPoint(v13, v15, v17);
  if (v11 >= sqrt((v19 - *(double *)(a1 + 40)) * (v19 - *(double *)(a1 + 40))+ (v18 - *(double *)(a1 + 32)) * (v18 - *(double *)(a1 + 32))))return 1; {
  else
  }
    return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLayerEffects, 0);
  objc_storeStrong((id *)&self->_effectsLayer, 0);
  objc_storeStrong((id *)&self->_forcedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_lastZoomChange, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_tilesLayer, 0);
  objc_destroyWeak((id *)&self->_renderingProperties);
  objc_destroyWeak((id *)&self->_geometryInterface);

  objc_destroyWeak((id *)&self->_page);
}

@end
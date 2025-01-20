@interface MKTileOverlayRenderer
+ (BOOL)_externalSubclassOverridesDrawingMethods;
+ (id)keyPathsForValuesAffectingVisibleKeyframeIndex;
- (BOOL)_mayExtendOutsideBounds;
- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4;
- (BOOL)overlayCanProvideRasterTileData:(id)a3;
- (MKTileOverlayRenderer)initWithOverlay:(id)a3;
- (NSNumber)visibleKeyframeOverride;
- (UIImage)colorMap;
- (id)rasterTileProviderForOverlay:(id)a3;
- (unint64_t)_visibleKeyframeIndex;
- (void)_playWithLoopCount:(unint64_t)a3;
- (void)_updateColorMap;
- (void)_updateRenderColors;
- (void)dealloc;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadData;
- (void)setAlpha:(double)a3;
- (void)setColorMap:(id)a3;
- (void)setVisibleKeyframeOverride:(id)a3;
@end

@implementation MKTileOverlayRenderer

+ (BOOL)_externalSubclassOverridesDrawingMethods
{
  uint64_t v3 = objc_opt_class();
  if (objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_drawMapRect_zoomScale_inContext_, v3))return 1; {

  }
  return objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_canDrawMapRect_zoomScale_, v3);
}

- (MKTileOverlayRenderer)initWithOverlay:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17.receiver = self;
    v17.super_class = (Class)MKTileOverlayRenderer;
    v5 = [(MKOverlayRenderer *)&v17 initWithOverlay:v4];

    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F64AC0]) initWithMaxCapacity:512];
      pendingRequests = v5->_pendingRequests;
      v5->_pendingRequests = (GEOTileKeyList *)v6;

      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create(0, v8);
      pendingRequestsLock = v5->_pendingRequestsLock;
      v5->_pendingRequestsLock = (OS_dispatch_queue *)v9;

      v5->_externalSubclassOverridesDrawingMethods = [(id)objc_opt_class() _externalSubclassOverridesDrawingMethods];
    }
    self = v5;
    v11 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v14 = [NSString stringWithFormat:@"Expected a MKTileOverlay but got %@", v4];

    v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];
    [v15 raise];

    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  if (self->_loopsRemaining) {
    [(VKRasterTileOverlayProviderData *)self->_rasterProvider removeObserver:self forKeyPath:@"visibleKeyframeIndex" context:VisibleKeyframeIndexContext];
  }
  v3.receiver = self;
  v3.super_class = (Class)MKTileOverlayRenderer;
  [(MKOverlayRenderer *)&v3 dealloc];
}

- (BOOL)_mayExtendOutsideBounds
{
  return 0;
}

- (void)setAlpha:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MKTileOverlayRenderer;
  -[MKOverlayRenderer setAlpha:](&v8, sel_setAlpha_);
  rasterProvider = self->_rasterProvider;
  if (rasterProvider)
  {
    [(VKRasterTileOverlayProviderData *)rasterProvider alpha];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__MKTileOverlayRenderer_setAlpha___block_invoke;
    v7[3] = &unk_1E54BB710;
    v7[4] = self;
    v7[5] = v6;
    *(double *)&v7[6] = a3;
    [(MKOverlayRenderer *)self _animateIfNecessaryForKey:@"alpha" withStepHandler:v7];
  }
}

uint64_t __34__MKTileOverlayRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) setAlpha:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

- (void)setColorMap:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_colorMap != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_colorMap, a3);
    [(MKTileOverlayRenderer *)self _updateColorMap];
    v5 = v6;
  }
}

+ (id)keyPathsForValuesAffectingVisibleKeyframeIndex
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"rasterProvider.visibleKeyframeIndex"];
}

- (unint64_t)_visibleKeyframeIndex
{
  unint64_t result = (unint64_t)self->_rasterProvider;
  if (result) {
    return [(id)result visibleKeyframeIndex];
  }
  return result;
}

- (void)setVisibleKeyframeOverride:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_visibleKeyframeOverride, a3);
  if (v10)
  {
    v5 = [(MKOverlayRenderer *)self overlay];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = [(MKOverlayRenderer *)self overlay];
      int v8 = [v10 intValue];
      if (v8 >= (int)[v7 keyframesCount])
      {
        id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Invalid index" userInfo:0];
        objc_exception_throw(v9);
      }
      -[VKRasterTileOverlayProviderData setKeyframeIndexOverride:](self->_rasterProvider, "setKeyframeIndexOverride:", [v10 intValue]);
    }
  }
  else
  {
    [(VKRasterTileOverlayProviderData *)self->_rasterProvider setKeyframeIndexOverride:0xFFFFFFFFLL];
  }
}

- (void)_playWithLoopCount:(unint64_t)a3
{
  v5 = [(MKOverlayRenderer *)self overlay];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (a3)
  {
    if (isKindOfClass)
    {
      v7 = [(MKOverlayRenderer *)self overlay];
      uint64_t v8 = [v7 keyframesCount];

      if (v8)
      {
        self->_loopsRemaining = a3;
        [(MKTileOverlayRenderer *)self setVisibleKeyframeOverride:0];
        rasterProvider = self->_rasterProvider;
        if (rasterProvider)
        {
          uint64_t v10 = VisibleKeyframeIndexContext;
          [(VKRasterTileOverlayProviderData *)rasterProvider addObserver:self forKeyPath:@"visibleKeyframeIndex" options:3 context:v10];
        }
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ((void *)VisibleKeyframeIndexContext == a6)
  {
    uint64_t v13 = *MEMORY[0x1E4F284E0];
    id v14 = a5;
    v15 = [v14 objectForKeyedSubscript:v13];
    unint64_t v16 = [v15 unsignedIntegerValue];

    objc_super v17 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    unint64_t v18 = [v17 unsignedIntegerValue];
    if (v18 < v16)
    {
      if ((unint64_t loopsRemaining = self->_loopsRemaining) == 0
        && (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
         || (*(_WORD *)buf = 0,
             _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _loopsRemaining > 0", buf, 2u), (unint64_t loopsRemaining = self->_loopsRemaining) == 0))|| (v20 = loopsRemaining - 1, (self->_unint64_t loopsRemaining = v20) == 0))
      {
        [v11 removeObserver:self forKeyPath:v10 context:a6];
        [(MKTileOverlayRenderer *)self setVisibleKeyframeOverride:&unk_1ED97EFA0];
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MKTileOverlayRenderer;
    id v12 = a5;
    [(MKTileOverlayRenderer *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v7 = a3.var0.var1;
  double v8 = a3.var0.var0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = [(MKOverlayRenderer *)self overlay];
  [(MKOverlayRenderer *)self contentScaleFactor];
  id v12 = objc_msgSend(v10, "_tilesInMapRect:zoomScale:contentScale:", v8, v7, var0, var1, a4, v11);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v12;
  char v14 = 0;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v19 = [v18 image];

        if (v19)
        {
          char v14 = 1;
        }
        else
        {
          long long v38 = 0uLL;
          unint64_t v20 = [(MKOverlayRenderer *)self overlay];
          if (v18) {
            [v18 path];
          }
          else {
            memset(v29, 0, sizeof(v29));
          }
          *(void *)&long long v38 = [v20 _keyForPath:v29];
          *((void *)&v38 + 1) = v21;

          uint64_t v25 = 0;
          v26 = &v25;
          uint64_t v27 = 0x2020000000;
          pendingRequestsLock = self->_pendingRequestsLock;
          char v28 = 0;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke;
          block[3] = &unk_1E54BF038;
          long long v37 = v38;
          block[4] = self;
          block[5] = &v25;
          dispatch_sync(pendingRequestsLock, block);
          if (!*((unsigned char *)v26 + 24))
          {
            v23 = [(MKOverlayRenderer *)self overlay];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_2;
            v34[3] = &unk_1E54BF060;
            v34[4] = v18;
            v34[5] = self;
            long long v35 = v38;
            [v23 _loadTile:&v38 result:v34];
          }
          _Block_object_dispose(&v25, 8);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  return v14 & 1;
}

uint64_t __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) containsKey:a1 + 48];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 112);
    return [v3 addKey:a1 + 48];
  }
  return result;
}

void __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [*(id *)(a1 + 32) frame];
    double v7 = objc_msgSend(*(id *)(a1 + 40), "_renderer", v3, v4, v5, v6);
    [*(id *)(a1 + 32) scale];
    uint64_t v9 = vcvtmd_s64_f64(log2(v8) + 0.5);
    if (v9 >= -21) {
      uint64_t v10 = v9 + 19;
    }
    else {
      uint64_t v10 = -2;
    }
    [v7 setNeedsDisplayInRect:&v13 level:v10 reason:3];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(NSObject **)(v11 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_3;
  block[3] = &unk_1E54BAC80;
  block[4] = v11;
  long long v15 = *(_OWORD *)(a1 + 48);
  dispatch_sync(v12, block);
}

uint64_t __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) removeKey:a1 + 40];
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v9 = a3.var0.var1;
  double v10 = a3.var0.var0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = [(MKOverlayRenderer *)self overlay];
  [(MKOverlayRenderer *)self contentScaleFactor];
  char v14 = objc_msgSend(v12, "_tilesInMapRect:zoomScale:contentScale:", v10, v9, var0, var1, a4, v13);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    double v19 = 1.0 / a4;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "image", (void)v38);

        if (v22)
        {
          CFDataRef v23 = [v21 image];
          v24 = CGImageSourceCreateWithData(v23, 0);

          if (v24)
          {
            if (CGImageSourceGetCount(v24))
            {
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v24, 0, 0);
              CFRelease(v24);
              if (ImageAtIndex)
              {
                [v21 frame];
                -[MKOverlayRenderer rectForMapRect:](self, "rectForMapRect:");
                CGFloat v27 = v26;
                CGFloat v29 = v28;
                CGFloat v31 = v30;
                CGFloat v33 = v32;
                CGContextSaveGState(a5);
                v44.origin.x = v27;
                v44.origin.y = v29;
                v44.size.width = v31;
                v44.size.height = v33;
                CGFloat MinX = CGRectGetMinX(v44);
                v45.origin.x = v27;
                v45.origin.y = v29;
                v45.size.width = v31;
                v45.size.height = v33;
                CGFloat MinY = CGRectGetMinY(v45);
                CGContextTranslateCTM(a5, MinX, MinY);
                CGContextScaleCTM(a5, v19, v19);
                size_t Height = CGImageGetHeight(ImageAtIndex);
                CGContextTranslateCTM(a5, 0.0, (double)Height);
                CGContextScaleCTM(a5, 1.0, -1.0);
                CGFloat Width = (double)CGImageGetWidth(ImageAtIndex);
                v46.size.height = (double)CGImageGetHeight(ImageAtIndex);
                v46.origin.x = 0.0;
                v46.origin.y = 0.0;
                v46.size.width = Width;
                CGContextDrawImage(a5, v46, ImageAtIndex);
                CGContextRestoreGState(a5);
                CGImageRelease(ImageAtIndex);
              }
            }
            else
            {
              CFRelease(v24);
            }
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v17);
  }
}

- (void)reloadData
{
  uint64_t v3 = [(MKOverlayRenderer *)self overlay];
  [v3 _flushCaches];

  [(MKOverlayRenderer *)self setNeedsDisplay];
}

- (BOOL)overlayCanProvideRasterTileData:(id)a3
{
  if (self->_externalSubclassOverridesDrawingMethods) {
    return 0;
  }
  uint64_t v4 = [(MKOverlayRenderer *)self overlay];
  [v4 tileSize];
  double v6 = v5;
  double v7 = [(MKOverlayRenderer *)self overlay];
  [v7 tileSize];
  double v9 = vabdd_f64(v6, v8);

  if (v9 >= 0.000001) {
    return 0;
  }
  uint64_t v11 = [(MKOverlayRenderer *)self overlay];
  [v11 tileSize];
  BOOL v10 = v12 <= 512.0;

  return v10;
}

- (id)rasterTileProviderForOverlay:(id)a3
{
  rasterProvider = self->_rasterProvider;
  if (!rasterProvider)
  {
    double v5 = [(MKOverlayRenderer *)self overlay];
    uint64_t v6 = [v5 minimumZ];

    double v7 = [(MKOverlayRenderer *)self overlay];
    uint64_t v8 = [v7 maximumZ];

    uint64_t v9 = 0xFFFFFFFFLL;
    uint64_t v10 = v6 >= 0xFFFFFFFFLL ? 0xFFFFFFFFLL : v6;
    unsigned int v29 = v10 & ~(v10 >> 63);
    uint64_t v11 = v8 >= 0xFFFFFFFFLL ? 0xFFFFFFFFLL : v8;
    unsigned int v28 = v11 & ~(v11 >> 63);
    double v12 = [(MKOverlayRenderer *)self overlay];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v14 = [(MKOverlayRenderer *)self overlay];
      [v14 keyframesCount];
      unsigned __int16 v15 = (unint64_t)[v14 keyframesCount] > 0xFFFE ? -1 : objc_msgSend(v14, "keyframesCount");
      [v14 duration];
      double v17 = v18;
      uint64_t v16 = [v14 shouldCrossfade];
      visibleKeyframeOverride = self->_visibleKeyframeOverride;
      uint64_t v9 = visibleKeyframeOverride ? [(NSNumber *)visibleKeyframeOverride intValue] : 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v16 = 0;
      unsigned __int16 v15 = 1;
      double v17 = 0.0;
    }
    [(MKTileOverlayRenderer *)self willChangeValueForKey:@"rasterProvider"];
    id v20 = objc_alloc(MEMORY[0x1E4FB3A70]);
    uint64_t v21 = [(MKOverlayRenderer *)self overlay];
    uint64_t v22 = [v21 _providerID];
    CFDataRef v23 = [(MKOverlayRenderer *)self overlay];
    [v23 tileSize];
    uint64_t v25 = (VKRasterTileOverlayProviderData *)[v20 initWithProviderID:v22 tileSize:v24 minimumZ:v29 maximumZ:v28 keyframesCount:v15 duration:v16 crossfadeKeyframes:v17];
    double v26 = self->_rasterProvider;
    self->_rasterProvider = v25;

    [(MKOverlayRenderer *)self alpha];
    -[VKRasterTileOverlayProviderData setAlpha:](self->_rasterProvider, "setAlpha:");
    [(VKRasterTileOverlayProviderData *)self->_rasterProvider setKeyframeIndexOverride:v9];
    [(MKTileOverlayRenderer *)self _updateColorMap];
    [(MKTileOverlayRenderer *)self didChangeValueForKey:@"rasterProvider"];
    rasterProvider = self->_rasterProvider;
    if (self->_loopsRemaining)
    {
      [(VKRasterTileOverlayProviderData *)rasterProvider addObserver:self forKeyPath:@"visibleKeyframeIndex" options:3 context:VisibleKeyframeIndexContext];
      rasterProvider = self->_rasterProvider;
    }
  }

  return rasterProvider;
}

- (void)_updateRenderColors
{
  if (self->_rasterProvider)
  {
    uint64_t v3 = [(MKOverlayRenderer *)self _mapView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__MKTileOverlayRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [v3 _withEffectiveTraitCollection:v5];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKTileOverlayRenderer;
  [(MKOverlayRenderer *)&v4 _updateRenderColors];
}

uint64_t __44__MKTileOverlayRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColorMap];
}

- (void)_updateColorMap
{
  if (self->_rasterProvider)
  {
    uint64_t v3 = [(UIImage *)self->_colorMap CGImage];
    rasterProvider = self->_rasterProvider;
    [(VKRasterTileOverlayProviderData *)rasterProvider setColorMap:v3];
  }
}

- (UIImage)colorMap
{
  return self->_colorMap;
}

- (NSNumber)visibleKeyframeOverride
{
  return self->_visibleKeyframeOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleKeyframeOverride, 0);
  objc_storeStrong((id *)&self->_colorMap, 0);
  objc_storeStrong((id *)&self->_rasterProvider, 0);
  objc_storeStrong((id *)&self->_pendingRequestsLock, 0);

  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
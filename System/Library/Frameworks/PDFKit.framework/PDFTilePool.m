@interface PDFTilePool
+ (id)sharedPool;
- (CGContext)_createContextForTileSurface:(id)a3 ofRequest:(id)a4;
- (PDFTilePool)init;
- (id)_createTileSurfaceForRequest:(id)a3;
- (int)activeTileCount;
- (int)tileSurfaceSize;
- (int)tileSurfaceType;
- (void)_colorizeTileEdgesForRequest:(id)a3 context:(CGContext *)a4 tileSize:(int)a5;
- (void)_renderTileForRequest:(id)a3;
- (void)dealloc;
- (void)releasePDFTileSurface:(id)a3;
- (void)requestPDFTileSurfaceForTarget:(id)a3 forPage:(id)a4 withRenderingProperties:(id)a5 atZoomFactor:(double)a6 frame:(CGRect)a7 transform:(CGAffineTransform *)a8 tag:(int)a9;
- (void)setTileSurfaceType:(int)a3;
@end

@implementation PDFTilePool

+ (id)sharedPool
{
  if (sharedPool_onceToken != -1) {
    dispatch_once(&sharedPool_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedPool_singleton;

  return v2;
}

uint64_t __25__PDFTilePool_sharedPool__block_invoke()
{
  v0 = objc_alloc_init(PDFTilePool);
  uint64_t v1 = sharedPool_singleton;
  sharedPool_singleton = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (PDFTilePool)init
{
  v18.receiver = self;
  v18.super_class = (Class)PDFTilePool;
  v2 = [(PDFTilePool *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFTilePoolPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    if (GetUseWhippet())
    {
      v5 = 0;
      v2->_private->surfaceType = 2;
    }
    else
    {
      v2->_private->surfaceType = GetUseIOSurfaceForTiles();
      v5 = MEMORY[0x263EF83A8];
      id v6 = MEMORY[0x263EF83A8];
    }
    v7 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("PDFKit.PDFTilePool.workQueue", v7);
    v9 = v2->_private;
    workQueue = v9->workQueue;
    v9->workQueue = (OS_dispatch_queue *)v8;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(4);
    v12 = v2->_private;
    workQueueThrottle = v12->workQueueThrottle;
    v12->workQueueThrottle = (OS_dispatch_semaphore *)v11;

    v2->_private->surfacesLock._os_unfair_lock_opaque = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = v2->_private;
    surfaces = v15->surfaces;
    v15->surfaces = v14;
  }
  return v2;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_private->surfacesLock);
  [(NSMutableDictionary *)self->_private->surfaces enumerateKeysAndObjectsUsingBlock:&__block_literal_global_52];
  [(NSMutableDictionary *)self->_private->surfaces removeAllObjects];
  os_unfair_lock_unlock(&self->_private->surfacesLock);
  v3.receiver = self;
  v3.super_class = (Class)PDFTilePool;
  [(PDFTilePool *)&v3 dealloc];
}

uint64_t __22__PDFTilePool_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 releaseSurface];
}

- (int)tileSurfaceSize
{
  return 1024;
}

- (void)setTileSurfaceType:(int)a3
{
  self->_private->surfaceType = a3;
}

- (int)tileSurfaceType
{
  return self->_private->surfaceType;
}

- (void)requestPDFTileSurfaceForTarget:(id)a3 forPage:(id)a4 withRenderingProperties:(id)a5 atZoomFactor:(double)a6 frame:(CGRect)a7 transform:(CGAffineTransform *)a8 tag:(int)a9
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  v19 = (PDFRenderingProperties *)a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_alloc_init(TileRenderRequest);
  objc_storeWeak((id *)&v22->target, v21);

  objc_storeWeak((id *)&v22->page, v20);
  renderingProperties = v22->renderingProperties;
  v22->renderingProperties = v19;
  v24 = v19;

  v22->tileFrame.origin.CGFloat x = x;
  v22->tileFrame.origin.CGFloat y = y;
  v22->tileFrame.size.CGFloat width = width;
  v22->tileFrame.size.CGFloat height = height;
  v22->zoomFactor = a6;
  long long v26 = *(_OWORD *)&a8->c;
  long long v25 = *(_OWORD *)&a8->tx;
  *(_OWORD *)&v22->matrix.a = *(_OWORD *)&a8->a;
  *(_OWORD *)&v22->matrix.c = v26;
  *(_OWORD *)&v22->matrix.tCGFloat x = v25;
  v22->tag = a9;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  v31 = v22;
  workQueue = self->_private->workQueue;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __111__PDFTilePool_requestPDFTileSurfaceForTarget_forPage_withRenderingProperties_atZoomFactor_frame_transform_tag___block_invoke;
  v29[3] = &unk_264204320;
  v29[4] = self;
  v29[5] = v30;
  v28 = v22;
  dispatch_async(workQueue, v29);
  _Block_object_dispose(v30, 8);
}

void __111__PDFTilePool_requestPDFTileSurfaceForTarget_forPage_withRenderingProperties_atZoomFactor_frame_transform_tag___block_invoke(uint64_t a1)
{
  dsema = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 32) _renderTileForRequest:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  dispatch_semaphore_signal(dsema);
}

- (id)_createTileSurfaceForRequest:(id)a3
{
  v27[5] = *MEMORY[0x263EF8340];
  v4 = (id *)a3;
  v5 = objc_alloc_init(PDFTileSurface);
  v5->tileId = atomic_fetch_add(gPDFTileSurfaceCount, 1u);
  id WeakRetained = objc_loadWeakRetained(v4 + 2);

  v7 = [WeakRetained document];
  v5->pageNumber = [v7 indexForPage:WeakRetained];

  v5->int type = [(PDFTilePool *)self tileSurfaceType];
  uint64_t v8 = [(PDFTilePool *)self tileSurfaceSize];
  v5->tileSize = v8;
  int type = v5->type;
  switch(type)
  {
    case 2:
      v24[0] = *MEMORY[0x263F0EF50];
      v10 = [NSNumber numberWithInt:v8];
      v25[0] = v10;
      v24[1] = *MEMORY[0x263F0EDF8];
      dispatch_semaphore_t v11 = [NSNumber numberWithInt:v8];
      v25[1] = v11;
      v24[2] = *MEMORY[0x263F0EE48];
      v12 = NSNumber;
      if (MGGetBoolAnswer()) {
        uint64_t v13 = 1999843442;
      }
      else {
        uint64_t v13 = 1111970369;
      }
      v14 = [v12 numberWithInt:v13];
      uint64_t v15 = *MEMORY[0x263F0ED48];
      v25[2] = v14;
      v25[3] = &unk_26C52E340;
      uint64_t v16 = *MEMORY[0x263F0EE40];
      v24[3] = v15;
      v24[4] = v16;
      v25[4] = &unk_26C52E328;
      CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
      goto LABEL_16;
    case 1:
      v26[0] = *MEMORY[0x263F0EF50];
      v10 = [NSNumber numberWithInt:v8];
      v27[0] = v10;
      v26[1] = *MEMORY[0x263F0EDF8];
      dispatch_semaphore_t v11 = [NSNumber numberWithInt:v8];
      v27[1] = v11;
      v26[2] = *MEMORY[0x263F0EE48];
      objc_super v18 = NSNumber;
      if (MGGetBoolAnswer()) {
        uint64_t v19 = 1380411457;
      }
      else {
        uint64_t v19 = 1380401729;
      }
      v14 = [v18 numberWithInt:v19];
      v27[2] = v14;
      v26[3] = *MEMORY[0x263F0ED48];
      id v20 = NSNumber;
      if (MGGetBoolAnswer()) {
        uint64_t v21 = 8;
      }
      else {
        uint64_t v21 = 4;
      }
      v22 = [v20 numberWithInt:v21];
      v26[4] = *MEMORY[0x263F0EE40];
      v27[3] = v22;
      v27[4] = &unk_26C52E328;
      CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];

LABEL_16:
      goto LABEL_18;
    case 0:
      v5->cgImageRef = 0;
      goto LABEL_19;
  }
  CFDictionaryRef v17 = 0;
LABEL_18:
  v5->ioSurfaceRef = IOSurfaceCreate(v17);

LABEL_19:

  return v5;
}

- (CGContext)_createContextForTileSurface:(id)a3 ofRequest:(id)a4
{
  id v5 = a3;
  int v6 = [(PDFTilePool *)self tileSurfaceSize];
  if (MGGetBoolAnswer() && *((_DWORD *)v5 + 5) == 2) {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
  }
  else {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  uint64_t v8 = DeviceRGB;
  int v9 = *((_DWORD *)v5 + 5);
  switch(v9)
  {
    case 0:
      uint64_t v8 = CGColorSpaceCreateDeviceRGB();
      size_t v12 = v6;
      v14 = 0;
      size_t v15 = v6;
      size_t v16 = 8;
      size_t v13 = 0;
      goto LABEL_17;
    case 2:
      if (MGGetBoolAnswer())
      {
        if (getIOSurfaceContextOptions_onceToken != -1) {
          dispatch_once(&getIOSurfaceContextOptions_onceToken, &__block_literal_global_115);
        }
      }
      else if (getIOSurfaceContextOptions_onceToken != -1)
      {
        dispatch_once(&getIOSurfaceContextOptions_onceToken, &__block_literal_global_115);
      }
      uint64_t v20 = CGIOSurfaceContextCreateWithOptions();
      goto LABEL_22;
    case 1:
      IOSurfaceLock(*((IOSurfaceRef *)v5 + 3), 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(*((IOSurfaceRef *)v5 + 3));
      int v11 = MGGetBoolAnswer();
      size_t v12 = v6;
      if (v11)
      {
        size_t v13 = 8 * v6;
        v14 = BaseAddress;
        size_t v15 = v6;
        size_t v16 = 16;
        CFDictionaryRef v17 = v8;
        uint32_t v18 = 4353;
LABEL_18:
        uint64_t v20 = (uint64_t)CGBitmapContextCreate(v14, v12, v15, v16, v13, v17, v18);
LABEL_22:
        uint64_t v19 = (CGContext *)v20;
        goto LABEL_23;
      }
      size_t v13 = 4 * v6;
      v14 = BaseAddress;
      size_t v15 = v6;
      size_t v16 = 8;
LABEL_17:
      CFDictionaryRef v17 = v8;
      uint32_t v18 = 1;
      goto LABEL_18;
  }
  uint64_t v19 = 0;
LABEL_23:
  CGColorSpaceRelease(v8);

  return v19;
}

- (void)_renderTileForRequest:(id)a3
{
  v4 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained(v4 + 1);
  id v6 = objc_loadWeakRetained(v4 + 2);
  v7 = [v4[3] pdfView];
  if (WeakRetained && v6)
  {
    v28 = v7;
    [WeakRetained hasStartedWork];
    double MachSeconds = GetMachSeconds();
    uint64_t v9 = [(PDFTilePool *)self _createTileSurfaceForRequest:v4];
    os_unfair_lock_lock(&self->_private->surfacesLock);
    surfaces = self->_private->surfaces;
    int v11 = [NSNumber numberWithInt:*(unsigned int *)(v9 + 8)];
    [(NSMutableDictionary *)surfaces setObject:v9 forKey:v11];

    os_unfair_lock_unlock(&self->_private->surfacesLock);
    size_t v12 = [(PDFTilePool *)self _createContextForTileSurface:v9 ofRequest:v4];
    BOOL v26 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:0];
    BOOL v13 = +[PDFPage shouldHideAnnotationsForThisThread];
    +[PDFPage setShouldHideAnnotationsForThisThread:1];
    BOOL v14 = +[PDFPage isExcludingAKAnnotationRenderingForThisThread];
    +[PDFPage setExcludingAKAnnotationRenderingForThisThread:1];
    LOBYTE(v11) = GetDefaultsWriteColorTileEdge();
    int v15 = [(PDFTilePool *)self tileSurfaceSize];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__PDFTilePool__renderTileForRequest___block_invoke;
    aBlock[3] = &unk_264204348;
    int v38 = v15;
    v33 = v4;
    id v34 = v28;
    id v27 = v6;
    id v16 = v6;
    char v39 = (char)v11;
    id v35 = v16;
    v36 = self;
    v37 = v12;
    CFDictionaryRef v17 = (void (**)(void *, CGContext *))_Block_copy(aBlock);
    v17[2](v17, v12);
    +[PDFPage setExcludingAKAnnotationRenderingForThisThread:v14];
    +[PDFPage setShouldHideAnnotationsForThisThread:v13];
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:v26];
    if (!*(_DWORD *)(v9 + 20)) {
      *(void *)(v9 + 32) = CGBitmapContextCreateImage(v12);
    }
    CGContextFlush(v12);
    CGContextRelease(v12);
    if (*(_DWORD *)(v9 + 20) == 1) {
      IOSurfaceUnlock(*(IOSurfaceRef *)(v9 + 24), 0, 0);
    }
    if (GetDefaultsWriteLogPerfTimes())
    {
      float v18 = MachSeconds;
      uint64_t v19 = [v16 document];
      uint64_t v20 = [v19 indexForPage:v16];

      uint64_t v21 = [MEMORY[0x263EFF910] date];
      [v21 timeIntervalSince1970];
      unint64_t v23 = (unint64_t)(v22 * 1000.0);

      double v24 = GetMachSeconds();
      NSLog(&cfstr_Pdfkit2Logperf.isa, v20, v23, v24 - v18);
      NSLog(&cfstr_Pdfkit2Logperf_0.isa, [(NSMutableDictionary *)self->_private->surfaces count]);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PDFTilePool__renderTileForRequest___block_invoke_2;
    block[3] = &unk_264203F98;
    id v30 = WeakRetained;
    id v31 = (id)v9;
    id v25 = (id)v9;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v6 = v27;
    v7 = v28;
  }
}

uint64_t __37__PDFTilePool__renderTileForRequest___block_invoke(uint64_t a1, CGContextRef c)
{
  CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
  v10.size.CGFloat width = (double)*(int *)(a1 + 72);
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat height = v10.size.width;
  CGContextFillRect(c, v10);
  uint64_t v4 = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(v4 + 72);
  long long v8 = *(_OWORD *)(v4 + 88);
  long long v9 = *(_OWORD *)(v4 + 104);
  CGContextSetCTM();
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "drawPage:toContext:", *(void *)(a1 + 48), c, v7, v8, v9);
    uint64_t result = [*(id *)(a1 + 40) drawPagePost:*(void *)(a1 + 48) toContext:c];
  }
  else
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 48), "drawWithBox:toContext:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "displayBox", v7, v8, v9), c);
  }
  if (*(unsigned char *)(a1 + 76)) {
    return [*(id *)(a1 + 56) _colorizeTileEdgesForRequest:*(void *)(a1 + 32) context:*(void *)(a1 + 64) tileSize:*(unsigned int *)(a1 + 72)];
  }
  return result;
}

void __37__PDFTilePool__renderTileForRequest___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166A0EA0]();
  [*(id *)(a1 + 32) recievePDFTileSurface:*(void *)(a1 + 40)];
}

- (void)_colorizeTileEdgesForRequest:(id)a3 context:(CGContext *)a4 tileSize:(int)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v7 = (unsigned int *)a3;
  CGContextSaveGState(a4);
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v21 = *MEMORY[0x263F000D0];
  *(_OWORD *)double v22 = *MEMORY[0x263F000D0];
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v20 = v8;
  *(_OWORD *)&v22[16] = v8;
  *(_OWORD *)&v22[32] = v19;
  CGContextSetCTM();
  double v9 = (double)(rand() % 100) / 100.0;
  double v10 = (double)(rand() % 100) / 100.0;
  double v11 = (double)(rand() % 100) / 100.0;
  CGContextSaveGState(a4);
  CGContextSetLineWidth(a4, 16.0);
  CGContextSetRGBStrokeColor(a4, v9, v10, v11, 0.8);
  double v12 = (double)a5;
  v25.size.CGFloat width = (double)a5 + -16.0;
  v25.origin.CGFloat x = 8.0;
  v25.origin.CGFloat y = 8.0;
  v25.size.CGFloat height = v25.size.width;
  CGContextStrokeRect(a4, v25);
  CGContextRestoreGState(a4);
  if (_colorizeTileEdgesForRequest_context_tileSize__onceToken != -1) {
    dispatch_once(&_colorizeTileEdgesForRequest_context_tileSize__onceToken, &__block_literal_global_72);
  }
  if (_colorizeTileEdgesForRequest_context_tileSize__stringAttributes)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", v7[30]);
    BOOL v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFAttributedStringRef v14 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v13, (CFDictionaryRef)_colorizeTileEdgesForRequest_context_tileSize__stringAttributes);
    if (v14)
    {
      CFAttributedStringRef v15 = v14;
      CTLineRef v16 = CTLineCreateWithAttributedString(v14);
      if (v16)
      {
        CFDictionaryRef v17 = v16;
        *(_OWORD *)double v22 = v21;
        *(_OWORD *)&v22[16] = v20;
        *(_OWORD *)&v22[32] = v19;
        CGContextSetTextMatrix(a4, (CGAffineTransform *)v22);
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v17, 0);
        *(void *)double v22 = 0x4049000000000000;
        *(double *)&v22[8] = v12 + -50.0 - BoundsWithOptions.size.height;
        *(double *)&v22[16] = v12 + -50.0 - BoundsWithOptions.size.width;
        *(double *)&v22[24] = *(double *)&v22[8];
        *(double *)&v22[32] = *(double *)&v22[16];
        *(int64x2_t *)&v22[40] = vdupq_n_s64(0x4049000000000000uLL);
        uint64_t v23 = 0x4049000000000000;
        CGContextSetRGBFillColor(a4, v9, v10, v11, 0.8);
        for (uint64_t i = 0; i != 64; i += 16)
        {
          CGContextSaveGState(a4);
          CGContextSetTextPosition(a4, *(CGFloat *)&v22[i], *(CGFloat *)&v22[i + 8]);
          CTLineDraw(v17, a4);
          CGContextRestoreGState(a4);
        }
        CFRelease(v15);
        CFRelease(v17);
      }
    }
  }
  CGContextRestoreGState(a4);
}

void __61__PDFTilePool__colorizeTileEdgesForRequest_context_tileSize___block_invoke()
{
  v8[4] = *MEMORY[0x263EF8340];
  CTFontRef v0 = CTFontCreateWithName(@"Helvetica", 100.0, 0);
  if (v0)
  {
    CTFontRef v1 = v0;
    uint64_t v2 = *MEMORY[0x263F03C68];
    v7[0] = *MEMORY[0x263F039A0];
    v7[1] = v2;
    v8[0] = v0;
    v8[1] = MEMORY[0x263EFFA88];
    v8[2] = &unk_26C52E6A0;
    uint64_t v3 = *MEMORY[0x263F03CB0];
    v7[2] = *MEMORY[0x263F03CB8];
    v7[3] = v3;
    id v4 = [MEMORY[0x263F825C8] blackColor];
    v8[3] = [v4 CGColor];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
    id v6 = (void *)_colorizeTileEdgesForRequest_context_tileSize__stringAttributes;
    _colorizeTileEdgesForRequest_context_tileSize__stringAttributes = v5;

    CFRelease(v1);
  }
  else
  {
    NSLog(&cfstr_FailedToCreate_0.isa, @"Helvetica");
  }
}

- (void)releasePDFTileSurface:(id)a3
{
  p_surfacesLock = &self->_private->surfacesLock;
  uint64_t v5 = (unsigned int *)a3;
  os_unfair_lock_lock(p_surfacesLock);
  surfaces = self->_private->surfaces;
  long long v7 = [NSNumber numberWithInt:v5[2]];
  long long v8 = [(NSMutableDictionary *)surfaces objectForKey:v7];

  double v9 = self->_private->surfaces;
  double v10 = NSNumber;
  uint64_t v11 = v5[2];

  double v12 = [v10 numberWithInt:v11];
  [(NSMutableDictionary *)v9 removeObjectForKey:v12];

  [v8 releaseSurface];
  if (GetDefaultsWriteLogPerfTimes()) {
    NSLog(&cfstr_Pdfkit2Logperf_0.isa, [(NSMutableDictionary *)self->_private->surfaces count]);
  }

  BOOL v13 = &self->_private->surfacesLock;

  os_unfair_lock_unlock(v13);
}

- (int)activeTileCount
{
  return [(NSMutableDictionary *)self->_private->surfaces count];
}

- (void).cxx_destruct
{
}

@end
@interface PKMetalRendererController
- (BOOL)drawStrokes:(void *)a3 intoTile:(uint64_t)a4 renderCount:(char)a5 offscreen:;
- (CGImageRef)renderStrokesSync:(_OWORD *)a3 clippedToStrokeSpaceRect:(CGFloat)a4 strokeTransform:(CGFloat)a5 imageClipRect:(CGFloat)a6;
- (__n128)_updateRendererStrokeTransformWithTransform:(__n128)result offset:(double)a4;
- (__n128)setPaperTransform:(uint64_t)a1;
- (__n128)setStrokeTransform:(uint64_t)a1;
- (double)_latestLatency;
- (id).cxx_construct;
- (uint64_t)_drawStrokesAfterClear:(_OWORD *)a3 clippedToStrokeSpaceRect:(CGFloat)a4 strokeTransform:(CGFloat)a5 useLayerContext:(CGFloat)a6 progress:(CGFloat)a7;
- (uint64_t)_renderAheadWithTransform:(uint64_t)a1 at:(_OWORD *)a2;
- (uint64_t)prerenderWithTransform:(double)a3 inputScale:(double)a4 at:;
- (void)_drawStrokesAfterClear:(long long *)a3 clippedToStrokeSpaceRect:(char)a4 strokeTransform:(void *)a5 useLayerContext:(double)a6 renderCompletion:(double)a7;
- (void)_logStrokeDuration;
- (void)_recordStrokeStatistics;
- (void)_renderLiveStrokeAndPresentWithTransform:(uint64_t)a1 at:(_OWORD *)a2 setDirtyRect:(int)a3;
- (void)addBlockToCallAfterPresenting:(uint64_t)a1;
- (void)addInputPoint:(uint64_t)a1;
- (void)buildRenderCacheForStrokes:(uint64_t)a1;
- (void)callBlockAfterPresenting:(uint64_t)a1;
- (void)callBlockOnRenderQueue:(uint64_t)a1;
- (void)cancelAllRendering;
- (void)cancelLongRunningRenders;
- (void)changeRenderSize;
- (void)commandQueue;
- (void)dealloc;
- (void)device;
- (void)didFinishRendering:(uint64_t)a1;
- (void)drawStrokesAfterClear:(long long *)a3 clippedToStrokeSpaceRect:(char)a4 strokeTransform:(void *)a5 useLayerContext:(double)a6 completion:(double)a7;
- (void)drawTexture:(uint64_t)a1;
- (void)drawingBeganWithStroke:(char)a3 forPreview:;
- (void)drawingCancelledForPreview:(uint64_t)a1;
- (void)drawingEnded:(void *)a3 finishStrokeBlock:;
- (void)flushMemoryIfPossible;
- (void)initWithPixelSize:(uint64_t)a3 actualSize:(void *)a4 pixelFormat:(double)a5 sixChannelBlendingMode:(double)a6 metalConfig:(double)a7;
- (void)liveStrokeParticlesToFrame:(double)a3 strokes:(double)a4 startTime:(double)a5 duration:(double)a6;
- (void)pokeEventDispatcher;
- (void)purgeOriginalBackFramebuffer;
- (void)purgeRenderCachesForStrokes:(uint64_t)a1;
- (void)renderImageTexture:(long long *)a3 imageTextureTransform:(void *)a4 withTiles:(long long *)a5 tileTransform:;
- (void)renderStrokes:(long long *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 imageClipRect:(double)a6 completion:(double)a7;
- (void)renderTilesIntoTiles:(uint64_t)a1;
- (void)renderWithTransform:(double)a3 inputScale:(double)a4 at:;
- (void)replaceInkTexture:(uint64_t)a3 image:;
- (void)resumeLongRunningRenders;
- (void)resumeLongRunningRendersAfterAllWorkIsDone;
- (void)setAlternativeStrokes:(double)a3 alpha:(double)a4 originalStrokeAlpha:;
- (void)setBackboardPaperMultiply:(uint64_t)a1;
- (void)setBackgroundColor:(uint64_t)a1;
- (void)setCanvasOffset:(double)a3;
- (void)setCanvasOffsetPresentationOffsetBlock:(uint64_t)a1;
- (void)setCombineStrokesAllowed:(uint64_t)a1;
- (void)setContentZoomScale:(uint64_t)a1;
- (void)setDrawBitmapEraserMask:(uint64_t)a1;
- (void)setFadeOutStrokesMode:(uint64_t)a1;
- (void)setInvertColors:(uint64_t)a1;
- (void)setIsPDFCanvasForAnalytics:(uint64_t)a1;
- (void)setLinedPaper:(uint64_t)a1;
- (void)setLiveRenderingOverrideColor:(uint64_t)a1;
- (void)setLiveStrokeElapsedTime:(uint64_t)a1;
- (void)setLiveStrokeMaxSize:(double)a3;
- (void)setLiveStrokeMode:(uint64_t)a1;
- (void)setLiveStrokeStrokes:(double)a3 animationBounds:(double)a4;
- (void)setMultiplyPresentationLayer:(uint64_t)a1;
- (void)setPaperTextureImage:(uint64_t)a1;
- (void)setPixelSize:(double)a3 actualSize:(double)a4;
- (void)setPresentationLayer:(uint64_t)a1;
- (void)setPreviewStrokeAlpha:(uint64_t)a1;
- (void)setPreviewStrokeMaxPoints:(uint64_t)a1;
- (void)setResourceCacheSize:(uint64_t)a1;
- (void)setSixChannelBlendingMode:(uint64_t)a1;
- (void)setViewScissor:(double)a3;
- (void)setup;
- (void)signalVSyncSemaphore:(double)a3 presentationTime:(unint64_t)a4;
- (void)teardown;
- (void)updateCyclePreCACommit:(uint64_t)a1 isDrawing:(char)a2;
- (void)updateTiles:(void *)a3 withNewStrokes:(void *)a4 completionBlock:;
@end

@implementation PKMetalRendererController

- (void)setSixChannelBlendingMode:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 600) != a2)
    {
      *(void *)(a1 + 600) = a2;
      v2 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PKMetalRendererController_setSixChannelBlendingMode___block_invoke;
      block[3] = &unk_1E64C5368;
      block[4] = a1;
      dispatch_async(v2, block);
    }
  }
}

- (void)setInvertColors:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 508) != a2)
  {
    *(unsigned char *)(a1 + 508) = a2;
    if (*(unsigned char *)(a1 + 16))
    {
      uint64_t v2 = *(void *)(a1 + 624);
      if (v2) {
        *(unsigned char *)(v2 + 965) = a2;
      }
    }
    else
    {
      v3 = *(NSObject **)(a1 + 24);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __45__PKMetalRendererController_setInvertColors___block_invoke;
      v4[3] = &unk_1E64C6618;
      v4[4] = a1;
      char v5 = a2;
      dispatch_async(v3, v4);
    }
  }
}

- (void)setDrawBitmapEraserMask:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 509) != a2)
    {
      *(unsigned char *)(a1 + 509) = a2;
      uint64_t v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __53__PKMetalRendererController_setDrawBitmapEraserMask___block_invoke;
      v3[3] = &unk_1E64C6618;
      v3[4] = a1;
      char v4 = a2;
      dispatch_async(v2, v3);
    }
  }
}

- (void)setBackgroundColor:(uint64_t)a1
{
  if (a1)
  {
    CGColorRef v3 = CGColorRetain(color);
    char v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__PKMetalRendererController_setBackgroundColor___block_invoke;
    v5[3] = &unk_1E64C73F8;
    v5[4] = a1;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

- (void)initWithPixelSize:(uint64_t)a3 actualSize:(void *)a4 pixelFormat:(double)a5 sixChannelBlendingMode:(double)a6 metalConfig:(double)a7
{
  v15 = a4;
  if (a1)
  {
    v47.receiver = a1;
    v47.super_class = (Class)PKMetalRendererController;
    v16 = (char *)objc_msgSendSuper2(&v47, sel_init);
    a1 = v16;
    if (!+[PKMetalUtility isMetalAvailable])
    {
      v16[96] = 1;

      a1 = 0;
      goto LABEL_19;
    }
    if (v16)
    {
      +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", a5, a6);
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      *((void *)v16 + 67) = 0x3FF0000000000000;
      *((void *)v16 + 75) = a3;
      v16[509] = 0;
      if (!v15) {
        v15 = objc_alloc_init(PKMetalConfig);
      }
      objc_storeStrong((id *)v16 + 1, v15);
      uint64_t v21 = -[PKMetalConfig renderQueue](v15);
      v22 = (void *)*((void *)v16 + 3);
      *((void *)v16 + 3) = v21;

      atomic_exchange(v16 + 48, 1u);
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      v24 = (void *)*((void *)v16 + 5);
      *((void *)v16 + 5) = v23;

      dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 5));
      if (_UIUpdateCycleEnabled())
      {
        dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
        v26 = (void *)*((void *)v16 + 62);
        *((void *)v16 + 62) = v25;
      }
      if (-[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlendingMode:metalConfig:]::onceToken != -1) {
        dispatch_once(&-[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlendingMode:metalConfig:]::onceToken, &__block_literal_global_28);
      }
      v27 = [PKMetalRenderer alloc];
      v28 = -[PKMetalConfig device](v15);
      v29 = -[PKMetalConfig resourceHandler](v15);
      v30 = -[PKMetalRenderer initWithDrawingPixelSize:actualSize:device:resourceHandler:sixChannelBlendingMode:pixelFormat:]((id *)&v27->super.isa, v28, v29, *((void **)v16 + 75));
      v31 = (void *)*((void *)v16 + 78);
      *((void *)v16 + 78) = v30;

      uint64_t v32 = *((void *)v16 + 78);
      if (v32)
      {
        *(unsigned char *)(v32 + 966) = v16[509];
        uint64_t v33 = *((void *)v16 + 78);
        *((void *)v16 + 65) = a2;
        if (v33)
        {
          v34 = *(id *)(v33 + 192);
          if (v34)
          {
            uint64_t v35 = v34[56];
            goto LABEL_14;
          }
LABEL_22:
          uint64_t v35 = 0;
LABEL_14:
          *((void *)v16 + 66) = v35;

          uint64_t v36 = *((void *)v16 + 78);
          if (v36)
          {
            v37 = *(id *)(v36 + 192);
            if (v37)
            {
              BOOL v38 = v37[429] != 0;
LABEL_17:
              v16[505] = v38;

              v39 = objc_alloc_init(PKStrokeGenerator);
              v40 = (void *)*((void *)v16 + 68);
              *((void *)v16 + 68) = v39;

              uint64_t v41 = MEMORY[0x1E4F1DAB8];
              long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
              *((_OWORD *)v16 + 43) = *MEMORY[0x1E4F1DAB8];
              *((_OWORD *)v16 + 44) = v42;
              *((_OWORD *)v16 + 45) = *(_OWORD *)(v41 + 32);
              uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
              v44 = (void *)*((void *)v16 + 11);
              *((void *)v16 + 11) = v43;

              *((void *)v16 + 13) = v18;
              *((void *)v16 + 14) = v20;
              *((double *)v16 + 15) = a7;
              *((double *)v16 + 16) = a8;
              long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
              *(_OWORD *)(v16 + 440) = *MEMORY[0x1E4F1DB20];
              *(_OWORD *)(v16 + 456) = v45;
              goto LABEL_19;
            }
          }
          else
          {
            v37 = 0;
          }
          BOOL v38 = 0;
          goto LABEL_17;
        }
      }
      else
      {
        *((void *)v16 + 65) = a2;
      }
      v34 = 0;
      goto LABEL_22;
    }
  }
LABEL_19:

  return a1;
}

void __105__PKMetalRendererController_initWithPixelSize_actualSize_pixelFormat_sixChannelBlendingMode_metalConfig___block_invoke()
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  mach_timebase_info((mach_timebase_info_t)&dword_1EA3C1EBC);
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v1 = [v0 maximumFramesPerSecond];

  double v2 = 1.0 / (double)v1;
  *(double *)&_MergedGlobals_111 = v2;
  *(double *)&qword_1EB3C5D50 = v2 + 0.001;
  BOOL v3 = v2 < 0.01;
  uint64_t v4 = qword_1C4829CE0[v2 < 0.01];
  uint64_t v5 = qword_1C4829CF0[v3];
  qword_1EB3C5D58 = 0x3F50624DD2F1A9FCLL;
  qword_1EB3C5D60 = v4;
  qword_1EB3C5D68 = v5;
  long long v29 = xmmword_1C4829D20;
  int v30 = 372777383;
  long long v27 = xmmword_1C4829D34;
  int v28 = -858079590;
  if (MGIsDeviceOneOfType())
  {
    _MergedGlobals_159 = 257;
    qword_1EB3C5D60 = 0x3F85CFAACD9E83E4;
    qword_1EB3C5D68 = 0x3F70624DD2F1A9FCLL;
    byte_1EA3C1EB8 = 1;
  }
  int v30 = -340360463;
  long long v29 = xmmword_1C4829D48;
  long long v27 = xmmword_1C4829D5C;
  int v28 = 1605231531;
  if (MGIsDeviceOneOfType()) {
    HIBYTE(_MergedGlobals_159) = 1;
  }
  v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", &v27, 0);
  v7 = [v6 objectForKey:@"PKFinalRenderMaximumMidFrameTouchWaitTime"];
  BOOL v8 = v7 == 0;

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v9 doubleForKey:@"PKFinalRenderMaximumMidFrameTouchWaitTime"];
    qword_1EB3C5D60 = v10;
  }
  v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v12 = [v11 objectForKey:@"PKFinalRenderMinimumMidFrameTouchWaitTime"];
  BOOL v13 = v12 == 0;

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v14 doubleForKey:@"PKFinalRenderMinimumMidFrameTouchWaitTime"];
    qword_1EB3C5D68 = v15;
  }
  v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v17 = [v16 objectForKey:@"PKFinalRenderFirstTouchWaitTime"];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v19 doubleForKey:@"PKFinalRenderFirstTouchWaitTime"];
    qword_1EB3C5D70 = v20;
  }
  uint64_t v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v22 = [v21 objectForKey:@"PKFinalRenderInitialMaxDelay"];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v24 doubleForKey:@"PKFinalRenderInitialMaxDelay"];
    qword_1EB3C5D60 = v25;
  }
  v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  byte_1EA3C1EB9 = [v26 BOOLForKey:@"PKAlwaysRenderLiveStrokesAsPreview"];
}

- (void)device
{
  if (a1)
  {
    double v2 = (void *)a1[78];
    if (v2) {
      double v2 = (void *)v2[3];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)commandQueue
{
  if (a1)
  {
    double v2 = (void *)a1[78];
    if (v2) {
      double v2 = (void *)v2[4];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPixelSize:(double)a3 actualSize:(double)a4
{
  if (a1)
  {
    -[PKMetalRendererController cancelLongRunningRenders](a1);
    uint64_t v10 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PKMetalRendererController_setPixelSize_actualSize___block_invoke;
    block[3] = &unk_1E64C7358;
    block[4] = a1;
    *(double *)&void block[5] = a2;
    *(double *)&block[6] = a3;
    *(double *)&block[7] = a4;
    *(double *)&block[8] = a5;
    dispatch_async(v10, block);
  }
}

- (void)cancelLongRunningRenders
{
  if (a1)
  {
    double v2 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Cancel long-running render.", v3, 2u);
    }

    atomic_fetch_add((atomic_uint *volatile)(a1 + 32), 1u);
  }
}

void __53__PKMetalRendererController_setPixelSize_actualSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Drawing setPixelSize:actualSize:", v10, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (*(double *)(v5 + 104) == *(double *)(a1 + 40) && *(double *)(v5 + 112) == *(double *)(a1 + 48))
    {
      *(_OWORD *)(v5 + 120) = *(_OWORD *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7)
      {
        uint64_t v8 = *(void *)(v7 + 624);
        if (v8)
        {
          long long v9 = *(_OWORD *)(a1 + 56);
          *(_OWORD *)(v8 + 248) = v9;
          *(double *)(v8 + 264) = *(double *)(v8 + 224) / *(double *)&v9;
        }
      }
    }
    else
    {
      *(_OWORD *)(v5 + 104) = *(_OWORD *)(a1 + 40);
      *(_OWORD *)(*(void *)(a1 + 32) + 120) = *(_OWORD *)(a1 + 56);
      -[PKMetalRenderer updateActualSize:pixelSize:](*(void *)(*(void *)(a1 + 32) + 624), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    -[PKMetalRendererController resumeLongRunningRenders](*(void *)(a1 + 32));
  }
}

- (void)resumeLongRunningRenders
{
  if (a1)
  {
    uint64_t v2 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v3 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Resume long-running render.", v3, 2u);
    }

    atomic_fetch_add((atomic_uint *volatile)(a1 + 32), 0xFFFFFFFF);
  }
}

- (void)teardown
{
  if (a1)
  {
    -[PKMetalRendererController cancelAllRendering](a1);
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    unsigned int v3 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PKMetalRendererController_teardown__block_invoke;
    block[3] = &unk_1E64C5870;
    uint64_t v4 = v2;
    long long v9 = v4;
    uint64_t v10 = a1;
    dispatch_async(v3, block);

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__PKMetalRendererController_teardown__block_invoke_2;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    uint64_t v7 = v4;
    uint64_t v5 = v4;
    dispatch_async(v3, v6);
  }
}

- (void)cancelAllRendering
{
  if (a1)
  {
    dispatch_semaphore_t v2 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v3 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Cancel all rendering.", v3, 2u);
    }

    atomic_store(1u, (unsigned int *)(a1 + 36));
  }
}

intptr_t __37__PKMetalRendererController_teardown__block_invoke(uint64_t a1)
{
  intptr_t result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(a1 + 40) + 96) = 1;
  return result;
}

intptr_t __37__PKMetalRendererController_teardown__block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2 = +[PKRendererVSyncController sharedController]();
  -[PKRendererVSyncController removeRendererController:]((uint64_t)v2, *(void **)(a1 + 32));

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PKMetalRendererController_teardown__block_invoke_3;
  block[3] = &unk_1E64C5368;
  void block[4] = v3;
  dispatch_sync(v4, block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __37__PKMetalRendererController_teardown__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 328);
  *(void *)(v2 + 328) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 320);
  *(void *)(v4 + 320) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 336);
  *(void *)(v6 + 336) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(void **)(v8 + 344);
  *(void *)(v8 + 344) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 624);
  *(void *)(v10 + 624) = 0;

  v12 = *(CGImage **)(*(void *)(a1 + 32) + 352);
  if (v12)
  {
    CGImageRelease(v12);
    *(void *)(*(void *)(a1 + 32) + 352) = 0;
  }
}

- (void)dealloc
{
  if (!self->_isTorndown) {
    objc_exception_throw(@"PKMetalRendererController was not fully torndown before dealloc.");
  }
  v2.receiver = self;
  v2.super_class = (Class)PKMetalRendererController;
  [(PKMetalRendererController *)&v2 dealloc];
}

- (void)setup
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PKMetalRendererController_setup__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __34__PKMetalRendererController_setup__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    atomic_load((unsigned int *)(v1 + 36));
  }
  return result;
}

- (void)signalVSyncSemaphore:(double)a3 presentationTime:(unint64_t)a4
{
  atomic_store(a4, &self->_lastPresentationTime);
  atomic_store(0, (unint64_t *)&self->_skipRendersUntilTime);
  kdebug_trace();
  atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_lastFrameDuration);
  if ((_UIUpdateCycleEnabled() & 1) == 0
    && (atomic_exchange_explicit(&self->_readyToBeginRender._Value, 1u, memory_order_acquire) & 1) == 0)
  {
    canBeginRenderSemaphore = self->_canBeginRenderSemaphore;
    dispatch_semaphore_signal(canBeginRenderSemaphore);
  }
}

- (void)resumeLongRunningRendersAfterAllWorkIsDone
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKMetalRendererController_resumeLongRunningRendersAfterAllWorkIsDone__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_sync(v1, block);
  }
}

void __71__PKMetalRendererController_resumeLongRunningRendersAfterAllWorkIsDone__block_invoke(uint64_t a1)
{
}

- (void)setPresentationLayer:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__PKMetalRendererController_setPresentationLayer___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __50__PKMetalRendererController_setPresentationLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8[0] = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Set presentation layer.", (uint8_t *)v8, 2u);
    }

    uint64_t v5 = +[PKRendererVSyncController sharedController]();
    -[PKRendererVSyncController addRendererController:]((uint64_t)v5, *(void **)(a1 + 32));

    id v6 = *(id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 584));

    if (v6 != WeakRetained) {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 584), *(id *)(a1 + 40));
    }
  }
}

- (void)setMultiplyPresentationLayer:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__PKMetalRendererController_setMultiplyPresentationLayer___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __58__PKMetalRendererController_setMultiplyPresentationLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Set multiply presentation layer.", (uint8_t *)v7, 2u);
    }

    id v5 = *(id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 592));

    if (v5 != WeakRetained) {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 592), *(id *)(a1 + 40));
    }
  }
}

- (CGImageRef)renderStrokesSync:(_OWORD *)a3 clippedToStrokeSpaceRect:(CGFloat)a4 strokeTransform:(CGFloat)a5 imageClipRect:(CGFloat)a6
{
  id v21 = a2;
  if (a1)
  {
    long long v22 = a3[1];
    v26[0] = *a3;
    v26[1] = v22;
    v26[2] = a3[2];
    -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:progress:](a1, v21, v26, a4, a5, a6, a7, 0, 0);
    CGImageRef v23 = -[PKMetalRenderer newCGImageWithClipRect:](*(void *)(a1 + 624), a8, a9, a10, a11);
    uint64_t v24 = *(void *)(a1 + 624);
    if (v24)
    {
    }
  }
  else
  {
    CGImageRef v23 = 0;
  }

  return v23;
}

- (uint64_t)_drawStrokesAfterClear:(_OWORD *)a3 clippedToStrokeSpaceRect:(CGFloat)a4 strokeTransform:(CGFloat)a5 useLayerContext:(CGFloat)a6 progress:(CGFloat)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v17 = a9;
  if (a1)
  {
    if (atomic_load((unsigned int *)(a1 + 36)))
    {
      a1 = 0;
    }
    else
    {
      uint64_t v19 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = [v16 count];
        _os_log_debug_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEBUG, "Draw clear and clipped commands %ld.", buf, 0xCu);
      }

      id v20 = *(id *)(a1 + 624);
      long long v21 = a3[1];
      v26[0] = *a3;
      v26[1] = v21;
      v26[2] = a3[2];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __118__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_progress___block_invoke;
      v23[3] = &unk_1E64C73D0;
      id v24 = v17;
      uint64_t v25 = a1;
      a1 = -[PKMetalRenderer clearAndRenderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:]((uint64_t)v20, v16, v26, v23, a4, a5, a6, a7);
    }
  }

  return a1;
}

- (void)renderStrokes:(long long *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 imageClipRect:(double)a6 completion:(double)a7
{
  id v23 = a2;
  id v24 = a4;
  uint64_t v25 = v24;
  if (a1)
  {
    long long v26 = a3[1];
    v33[0] = *a3;
    v33[1] = v26;
    v33[2] = a3[2];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __109__PKMetalRendererController_renderStrokes_clippedToStrokeSpaceRect_strokeTransform_imageClipRect_completion___block_invoke;
    v27[3] = &unk_1E64C7380;
    v27[4] = a1;
    double v29 = a9;
    double v30 = a10;
    double v31 = a11;
    double v32 = a12;
    id v28 = v24;
    -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:renderCompletion:](a1, v23, v33, 0, v27, a5, a6, a7, a8);
  }
}

void __109__PKMetalRendererController_renderStrokes_clippedToStrokeSpaceRect_strokeTransform_imageClipRect_completion___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 600);
  id v5 = -[PKMetalRenderer newCGImageWithClipRect:](*(void *)(v3 + 624), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  if (!v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!v5) {
      goto LABEL_13;
    }
    long long v9 = v5;
    goto LABEL_12;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(CGImage **)(v6 + 624);
  }
  else {
    id v7 = 0;
  }
  CGImageRef v8 = -[PKMetalRenderer newSixChannelMultiplyCGImageWithClipRect:](v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v5) {
    CGImageRelease(v5);
  }
  if (v8)
  {
    long long v9 = v8;
LABEL_12:
    CGImageRelease(v9);
  }
LABEL_13:
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 624);
  if (v10)
  {
  }
}

- (void)_drawStrokesAfterClear:(long long *)a3 clippedToStrokeSpaceRect:(char)a4 strokeTransform:(void *)a5 useLayerContext:(double)a6 renderCompletion:(double)a7
{
  id v17 = a2;
  id v18 = a5;
  if (a1)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v17, "count"));
    id v20 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_renderCompletion___block_invoke;
    block[3] = &unk_1E64C73A8;
    void block[4] = a1;
    id v21 = v17;
    double v28 = a6;
    double v29 = a7;
    double v30 = a8;
    double v31 = a9;
    long long v22 = a3[1];
    long long v32 = *a3;
    long long v33 = v22;
    long long v34 = a3[2];
    char v35 = a4;
    id v25 = v21;
    id v26 = v19;
    id v27 = v18;
    id v23 = v19;
    dispatch_async(v20, block);
  }
}

- (void)buildRenderCacheForStrokes:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[PKMetalRenderer buildRenderCacheForStrokes:](*(void *)(a1 + 624), v3);
  }
}

uint64_t __126__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_renderCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  CGFloat v5 = *(double *)(a1 + 64);
  CGFloat v6 = *(double *)(a1 + 72);
  CGFloat v7 = *(double *)(a1 + 80);
  CGFloat v8 = *(double *)(a1 + 88);
  long long v9 = *(_OWORD *)(a1 + 112);
  v12[0] = *(_OWORD *)(a1 + 96);
  v12[1] = v9;
  v12[2] = *(_OWORD *)(a1 + 128);
  -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:progress:](v2, v3, v12, v5, v6, v7, v8, 0, v4);
  [*(id *)(a1 + 40) count];
  uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v10();
}

BOOL __118__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_progress___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    return 0;
  }
  signed int v3 = atomic_load((unsigned int *)(v2 + 32));
  return v3 > 0;
}

void __55__PKMetalRendererController_setSixChannelBlendingMode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void **)(v1 + 624);
    id v20 = v2;
    if (v2)
    {
      uint64_t v3 = v2[125];
      uint64_t v4 = (CGColor *)v2[30];
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v3 = 0;
    }
    CGFloat v5 = CGColorRetain(v4);
    CGFloat v6 = (uint64_t *)(v1 + 624);

    CGFloat v7 = *(void **)(v1 + 624);
    if (v7) {
      CGFloat v7 = (void *)v7[24];
    }
    id v21 = v7;
    CGFloat v8 = [PKMetalRenderer alloc];
    if (v21) {
      long long v9 = (void *)v21[54];
    }
    else {
      long long v9 = 0;
    }
    id v10 = v9;
    v11 = -[PKMetalRenderer initWithDrawingPixelSize:actualSize:device:resourceHandler:sixChannelBlendingMode:pixelFormat:]((id *)&v8->super.isa, v10, v21, *(void **)(v1 + 600));
    objc_storeStrong((id *)(v1 + 624), v11);

    if (*v6)
    {
      *(void *)(*v6 + 1000) = v3;
      uint64_t v12 = *v6;
    }
    else
    {
      uint64_t v12 = 0;
    }
    -[PKMetalRenderer setBackgroundColor:](v12, (uint64_t)v5);
    -[PKMetalRenderer setLinedPaper:](*(void *)(v1 + 624), *(void **)(v1 + 552));
    uint64_t v13 = *(void *)(v1 + 624);
    if (!v13) {
      goto LABEL_26;
    }
    int v14 = *(unsigned __int8 *)(v1 + 506);
    if (*(unsigned __int8 *)(v13 + 963) != v14)
    {
      *(unsigned char *)(v13 + 963) = v14;
      uint64_t v13 = *v6;
      if (!*v6) {
        goto LABEL_26;
      }
    }
    *(_OWORD *)(v13 + 1048) = *(_OWORD *)(v1 + 640);
    uint64_t v15 = *(void *)(v1 + 624);
    if (v15
      && (*(unsigned char *)(v15 + 962) = *(unsigned char *)(v1 + 507), (uint64_t v16 = *(void *)(v1 + 624)) != 0)
      && (*(unsigned char *)(v16 + 965) = *(unsigned char *)(v1 + 508), (uint64_t v17 = *(void *)(v1 + 624)) != 0))
    {
      *(unsigned char *)(v17 + 966) = *(unsigned char *)(v1 + 509);
      uint64_t v18 = *v6;
    }
    else
    {
LABEL_26:
      uint64_t v18 = 0;
    }
    uint64_t v19 = *(CGImage **)(v1 + 352);
    if (v19) {
      -[PKMetalRenderer setPaperTextureImage:](v18, v19);
    }
    CGColorRelease(v5);
  }
}

uint64_t __53__PKMetalRendererController_setDrawBitmapEraserMask___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2) {
      *(unsigned char *)(v2 + 966) = *(unsigned char *)(result + 40);
    }
  }
  return result;
}

- (void)setPreviewStrokeAlpha:(uint64_t)a1
{
  if (a1)
  {
    if (vabdd_f64(*(double *)(a1 + 616), a2) >= 0.00999999978)
    {
      *(double *)(a1 + 616) = a2;
      uint64_t v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __51__PKMetalRendererController_setPreviewStrokeAlpha___block_invoke;
      v3[3] = &unk_1E64C73F8;
      v3[4] = a1;
      *(double *)&void v3[5] = a2;
      dispatch_async(v2, v3);
    }
  }
}

double __51__PKMetalRendererController_setPreviewStrokeAlpha___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2)
    {
      double result = *(double *)(a1 + 40);
      *(double *)(v2 + 1024) = result;
    }
  }
  return result;
}

- (void)setPreviewStrokeMaxPoints:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 608) != a2)
    {
      *(void *)(a1 + 608) = a2;
      uint64_t v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __55__PKMetalRendererController_setPreviewStrokeMaxPoints___block_invoke;
      v3[3] = &unk_1E64C73F8;
      v3[4] = a1;
      void v3[5] = a2;
      dispatch_async(v2, v3);
    }
  }
}

double __55__PKMetalRendererController_setPreviewStrokeMaxPoints___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2)
    {
      double result = (double)*(unint64_t *)(a1 + 40);
      *(double *)(v2 + 1032) = result;
    }
  }
  return result;
}

- (void)setLiveStrokeMode:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 506) != a2)
    {
      *(unsigned char *)(a1 + 506) = a2;
      uint64_t v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __47__PKMetalRendererController_setLiveStrokeMode___block_invoke;
      v3[3] = &unk_1E64C6618;
      v3[4] = a1;
      char v4 = a2;
      dispatch_async(v2, v3);
    }
  }
}

uint64_t __47__PKMetalRendererController_setLiveStrokeMode___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2)
    {
      int v3 = *(unsigned __int8 *)(result + 40);
      if (*(unsigned __int8 *)(v2 + 963) != v3) {
        *(unsigned char *)(v2 + 963) = v3;
      }
    }
  }
  return result;
}

- (void)setLiveStrokeMaxSize:(double)a3
{
  if (a1)
  {
    if (*(double *)(a1 + 640) != a2 || *(double *)(a1 + 648) != a3)
    {
      *(double *)(a1 + 640) = a2;
      *(double *)(a1 + 648) = a3;
      char v4 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PKMetalRendererController_setLiveStrokeMaxSize___block_invoke;
      block[3] = &unk_1E64C55F0;
      void block[4] = a1;
      *(double *)&void block[5] = a2;
      *(double *)&block[6] = a3;
      dispatch_async(v4, block);
    }
  }
}

__n128 __50__PKMetalRendererController_setLiveStrokeMaxSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2)
    {
      __n128 result = *(__n128 *)(a1 + 40);
      *(__n128 *)(v2 + 1048) = result;
    }
  }
  return result;
}

- (void)setFadeOutStrokesMode:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 507) != a2)
    {
      *(unsigned char *)(a1 + 507) = a2;
      uint64_t v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __51__PKMetalRendererController_setFadeOutStrokesMode___block_invoke;
      v3[3] = &unk_1E64C6618;
      v3[4] = a1;
      char v4 = a2;
      dispatch_async(v2, v3);
    }
  }
}

uint64_t __51__PKMetalRendererController_setFadeOutStrokesMode___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2) {
      *(unsigned char *)(v2 + 962) = *(unsigned char *)(result + 40);
    }
  }
  return result;
}

- (void)setLiveStrokeStrokes:(double)a3 animationBounds:(double)a4
{
  id v11 = a2;
  uint64_t v12 = v11;
  if (a1)
  {
    uint64_t v13 = *(NSObject **)(a1 + 24);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__PKMetalRendererController_setLiveStrokeStrokes_animationBounds___block_invoke;
    v14[3] = &unk_1E64C7420;
    v14[4] = a1;
    id v15 = v11;
    double v16 = a3;
    double v17 = a4;
    double v18 = a5;
    double v19 = a6;
    dispatch_async(v13, v14);
  }
}

__n128 __66__PKMetalRendererController_setLiveStrokeStrokes_animationBounds___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 432);
  *(void *)(v3 + 432) = v2;

  uint64_t v5 = *(void *)(a1 + 32) + 440;
  __n128 result = *(__n128 *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 64);
  *(__n128 *)uint64_t v5 = result;
  *(_OWORD *)(v5 + 16) = v7;
  return result;
}

- (void)liveStrokeParticlesToFrame:(double)a3 strokes:(double)a4 startTime:(double)a5 duration:(double)a6
{
  id v15 = a2;
  double v16 = v15;
  if (a1)
  {
    double v17 = *(NSObject **)(a1 + 24);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__PKMetalRendererController_liveStrokeParticlesToFrame_strokes_startTime_duration___block_invoke;
    v18[3] = &unk_1E64C7448;
    double v21 = a3;
    double v22 = a4;
    double v23 = a5;
    double v24 = a6;
    id v19 = v15;
    uint64_t v20 = a1;
    double v25 = a7;
    double v26 = a8;
    dispatch_async(v17, v18);
  }
}

void __83__PKMetalRendererController_liveStrokeParticlesToFrame_strokes_startTime_duration___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v75 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          [v10 _pointsCount];
          [v10 _bounds];
          v84.origin.double x = v11;
          v84.origin.double y = v12;
          v84.size.double width = v13;
          v84.size.double height = v14;
          v82.origin.double x = x;
          v82.origin.double y = y;
          v82.size.double width = width;
          v82.size.double height = height;
          CGRect v83 = CGRectUnion(v82, v84);
          double x = v83.origin.x;
          double y = v83.origin.y;
          double width = v83.size.width;
          double height = v83.size.height;
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v74 objects:v80 count:16];
      }
      while (v7);
    }

    v71 = 0;
    v72 = 0;
    v73 = 0;
    unint64_t v15 = [*(id *)(a1 + 32) count];
    unint64_t v16 = v15;
    if (v15)
    {
      if (0xAAAAAAAAAAAAAAABLL * ((v73 - v72) >> 3) >= v15)
      {
        bzero(v72, 24 * ((24 * v15 - 24) / 0x18) + 24);
        v72 = (char *)(24 * ((24 * v16 - 24) / 0x18) + 24);
      }
      else
      {
        if (v15 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v17 = 0x5555555555555556 * ((v73 - v71) >> 3);
        if (v17 <= v15) {
          unint64_t v17 = v15;
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v73 - v71) >> 3) >= 0x555555555555555) {
          unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18 > 0xAAAAAAAAAAAAAAALL) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        id v19 = (char *)operator new(24 * v18);
        size_t v20 = 24 * ((24 * v16 - 24) / 0x18) + 24;
        bzero(v19, v20);
        v71 = v19;
        v72 = &v19[v20];
        v73 = &v19[24 * v18];
      }
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v21 = [obj countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v21)
    {
      uint64_t v22 = 0;
      uint64_t v64 = *(void *)v68;
      do
      {
        uint64_t v65 = v21;
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v68 != v64) {
            objc_enumerationMutation(obj);
          }
          double v23 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          double v24 = v71;
          unint64_t v25 = [v23 _pointsCount];
          double v26 = &v24[24 * v22];
          double v28 = (char **)(v26 + 8);
          id v27 = (char *)*((void *)v26 + 1);
          double v29 = *(char **)v26;
          unint64_t v30 = (uint64_t)&v27[-*(void *)v26] >> 3;
          if (v25 <= v30)
          {
            if (v25 >= v30) {
              goto LABEL_43;
            }
            objc_super v47 = &v29[8 * v25];
            goto LABEL_42;
          }
          double v31 = &v24[24 * v22];
          unint64_t v32 = v25 - v30;
          uint64_t v35 = *((void *)v31 + 2);
          uint64_t v34 = (uint64_t)(v31 + 16);
          uint64_t v33 = v35;
          if (v25 - v30 <= (v35 - (uint64_t)v27) >> 3)
          {
            bzero(v27, 8 * v32);
            objc_super v47 = &v27[8 * v32];
LABEL_42:
            void *v28 = v47;
            goto LABEL_43;
          }
          if (v25 >> 61) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v36 = v33 - (void)v29;
          uint64_t v37 = v36 >> 2;
          if (v36 >> 2 <= v25) {
            uint64_t v37 = v25;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v37;
          }
          v39 = (void *)v34;
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v34, v38);
          uint64_t v62 = v41;
          v61 = v40;
          long long v42 = &v40[8 * v30];
          bzero(v42, 8 * v32);
          uint64_t v43 = *v28;
          v44 = *(char **)v26;
          long long v45 = v42;
          if (*v28 != *(char **)v26)
          {
            do
            {
              uint64_t v46 = *((void *)v43 - 1);
              v43 -= 8;
              *((void *)v45 - 1) = v46;
              v45 -= 8;
            }
            while (v43 != v44);
            uint64_t v43 = *(char **)v26;
          }
          *(void *)double v26 = v45;
          void *v28 = &v42[8 * v32];
          void *v39 = &v61[8 * v62];
          if (v43) {
            operator delete(v43);
          }
LABEL_43:
          uint64_t v48 = objc_msgSend(v23, "_pointsCount", v61, v62);
          if (v48)
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              [v23 _locationAtIndex:k];
              double v52 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * ((v50 - x) / width);
              double v53 = *(double *)(a1 + 56) + *(double *)(a1 + 72) * ((v51 - y) / height);
              double v54 = v52 - v50;
              double v55 = v53 - v51;
              double v56 = sqrt(v55 * v55 + v54 * v54);
              if (v56 > 100.0)
              {
                double v52 = v50 + v54 * (1.0 / v56) * 100.0;
                double v53 = v51 + v55 * (1.0 / v56) * 100.0;
              }
              *(float *)&uint64_t v57 = v52;
              float v58 = v53;
              *((float *)&v57 + 1) = v58;
              *(void *)(*(void *)&v71[24 * v22] + 8 * k) = v57;
            }
          }
          ++v22;
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v21);
    }

    uint64_t v59 = *(void *)(a1 + 40);
    if (v59) {
      uint64_t v60 = *(void *)(v59 + 624);
    }
    else {
      uint64_t v60 = 0;
    }
    -[PKMetalRenderer generateLiveStrokeCachesForStrokes:destinationLocations:startTime:duration:](v60, *(void **)(a1 + 32));
    v78 = &v71;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  }
}

- (void)setLiveStrokeElapsedTime:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 560) != a2)
    {
      *(double *)(a1 + 560) = a2;
      uint64_t v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __54__PKMetalRendererController_setLiveStrokeElapsedTime___block_invoke;
      v3[3] = &unk_1E64C73F8;
      v3[4] = a1;
      *(double *)&void v3[5] = a2;
      dispatch_async(v2, v3);
    }
  }
}

double __54__PKMetalRendererController_setLiveStrokeElapsedTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2)
    {
      double result = *(double *)(a1 + 40);
      *(double *)(v2 + 1040) = result;
    }
  }
  return result;
}

- (void)setResourceCacheSize:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__PKMetalRendererController_setResourceCacheSize___block_invoke;
    v3[3] = &unk_1E64C73F8;
    v3[4] = a1;
    void v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

void __50__PKMetalRendererController_setResourceCacheSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v2 = (void *)v2[78];
    if (v2) {
      uint64_t v2 = (void *)v2[24];
    }
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v5 = -[PKMetalResourceHandler strokeRenderCache](v3);
  if (v5) {
    v5[8] = v4;
  }
}

- (void)purgeRenderCachesForStrokes:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = (void *)[v3 copy];
    id v6 = *(NSObject **)(a1 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PKMetalRendererController_purgeRenderCachesForStrokes___block_invoke;
    v8[3] = &unk_1E64C5870;
    v8[4] = a1;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

void __57__PKMetalRendererController_purgeRenderCachesForStrokes___block_invoke(uint64_t a1)
{
}

- (void)setPaperTextureImage:(uint64_t)a1
{
  if (a1)
  {
    CGImageRef v3 = CGImageRetain(image);
    uint64_t v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__PKMetalRendererController_setPaperTextureImage___block_invoke;
    v5[3] = &unk_1E64C73F8;
    v5[4] = a1;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

void __50__PKMetalRendererController_setPaperTextureImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Set background image", v7, 2u);
    }

    CGImageRelease(*(CGImageRef *)(*(void *)(a1 + 32) + 352));
    *(void *)(*(void *)(a1 + 32) + 352) = CGImageRetain(*(CGImageRef *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 624);
    }
    else {
      uint64_t v6 = 0;
    }
    -[PKMetalRenderer setPaperTextureImage:](v6, *(CGImage **)(a1 + 40));
  }
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

void __48__PKMetalRendererController_setBackgroundColor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Set background color", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 624);
    }
    else {
      uint64_t v6 = 0;
    }
    -[PKMetalRenderer setBackgroundColor:](v6, *(void *)(a1 + 40));
  }
  CGColorRelease(*(CGColorRef *)(a1 + 40));
}

- (void)setLiveRenderingOverrideColor:(uint64_t)a1
{
  if (a1)
  {
    CGColorRef v3 = CGColorRetain(color);
    uint64_t v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__PKMetalRendererController_setLiveRenderingOverrideColor___block_invoke;
    v5[3] = &unk_1E64C73F8;
    v5[4] = a1;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

void __59__PKMetalRendererController_setLiveRenderingOverrideColor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Set live rendering override color", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 624);
    }
    else {
      uint64_t v6 = 0;
    }
    -[PKMetalRenderer setLiveRenderingOverrideColor:](v6, *(CGColorRef *)(a1 + 40));
  }
  CGColorRelease(*(CGColorRef *)(a1 + 40));
}

- (__n128)setStrokeTransform:(uint64_t)a1
{
  if (a1)
  {
    long long v2 = *a2;
    long long v3 = a2[2];
    *(_OWORD *)(a1 + 704) = a2[1];
    *(_OWORD *)(a1 + 720) = v3;
    *(_OWORD *)(a1 + 688) = v2;
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PKMetalRendererController_setStrokeTransform___block_invoke;
    block[3] = &unk_1E64C5500;
    void block[4] = a1;
    long long v5 = a2[1];
    long long v8 = *a2;
    long long v9 = v5;
    long long v10 = a2[2];
    dispatch_async(v4, block);
  }
  return result;
}

double __48__PKMetalRendererController_setStrokeTransform___block_invoke(uint64_t a1)
{
  uint64_t v1 = (_OWORD *)(*(void *)(a1 + 32) + 376);
  long long v2 = *(_OWORD *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 72);
  v1[1] = *(_OWORD *)(a1 + 56);
  v1[2] = v3;
  *uint64_t v1 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    goto LABEL_4;
  }
  if (!atomic_load((unsigned int *)(v4 + 36)))
  {
    uint64_t v4 = *(void *)(a1 + 32);
LABEL_4:
    long long v6 = *(_OWORD *)(a1 + 56);
    v9[0] = *(_OWORD *)(a1 + 40);
    v9[1] = v6;
    long long v10 = *(_OWORD *)(a1 + 72);
    v7.n128_u64[1] = *((void *)&v10 + 1);
    v7.n128_u64[0] = *(void *)(v4 + 360);
    *(void *)&long long v2 = [(PKMetalRendererController *)v4 _updateRendererStrokeTransformWithTransform:v7 offset:*(double *)(v4 + 368)].n128_u64[0];
  }
  return *(double *)&v2;
}

- (__n128)_updateRendererStrokeTransformWithTransform:(__n128)result offset:(double)a4
{
  if (a1)
  {
    CGAffineTransformMakeTranslation(&t1, -result.n128_f64[0], -a4);
    long long v6 = a2[1];
    *(_OWORD *)&v10.a = *a2;
    *(_OWORD *)&v10.c = v6;
    *(_OWORD *)&v10.tdouble x = a2[2];
    CGAffineTransformConcat(&v12, &t1, &v10);
    long long v7 = *(_OWORD *)&v12.c;
    *a2 = *(_OWORD *)&v12.a;
    a2[1] = v7;
    result.n128_u64[0] = *(void *)&v12.tx;
    a2[2] = *(_OWORD *)&v12.tx;
    uint64_t v8 = *(void *)(a1 + 624);
    if (v8)
    {
      __n128 result = *(__n128 *)a2;
      long long v9 = a2[2];
      *(_OWORD *)(v8 + 288) = a2[1];
      *(_OWORD *)(v8 + 304) = v9;
      *(__n128 *)(v8 + 272) = result;
    }
  }
  return result;
}

- (void)setContentZoomScale:(uint64_t)a1
{
  if (a1)
  {
    *(double *)(a1 + 536) = a2;
    long long v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__PKMetalRendererController_setContentZoomScale___block_invoke;
    v3[3] = &unk_1E64C73F8;
    v3[4] = a1;
    *(double *)&void v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

double __49__PKMetalRendererController_setContentZoomScale___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 624);
  if (v1)
  {
    double result = *(double *)(a1 + 40);
    *(double *)(v1 + 992) = result;
  }
  return result;
}

- (void)setLinedPaper:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 copy];
    long long v6 = *(void **)(a1 + 552);
    *(void *)(a1 + 552) = v5;

    long long v7 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKMetalRendererController_setLinedPaper___block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v7, block);
  }
}

void __43__PKMetalRendererController_setLinedPaper___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 624);
  }
  else {
    uint64_t v2 = 0;
  }
  -[PKMetalRenderer setLinedPaper:](v2, *(void **)(v1 + 552));
}

- (__n128)setPaperTransform:(uint64_t)a1
{
  if (a1)
  {
    long long v2 = *a2;
    long long v3 = a2[2];
    *(_OWORD *)(a1 + 752) = a2[1];
    *(_OWORD *)(a1 + 768) = v3;
    *(_OWORD *)(a1 + 736) = v2;
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PKMetalRendererController_setPaperTransform___block_invoke;
    block[3] = &unk_1E64C5500;
    void block[4] = a1;
    long long v5 = a2[1];
    long long v8 = *a2;
    long long v9 = v5;
    long long v10 = a2[2];
    dispatch_async(v4, block);
  }
  return result;
}

__n128 __47__PKMetalRendererController_setPaperTransform___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (!atomic_load((unsigned int *)(v1 + 36)))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (v3)
      {
        uint64_t v4 = *(void *)(v3 + 624);
        if (v4)
        {
          uint64_t v5 = v4 + 1064;
          __n128 result = *(__n128 *)(a1 + 40);
          long long v7 = *(_OWORD *)(a1 + 72);
          *(_OWORD *)(v5 + 16) = *(_OWORD *)(a1 + 56);
          *(_OWORD *)(v5 + 32) = v7;
          *(__n128 *)uint64_t v5 = result;
        }
      }
    }
  }
  return result;
}

- (void)setViewScissor:(double)a3
{
  if (a1)
  {
    *(double *)(a1 + 656) = a2;
    *(double *)(a1 + 664) = a3;
    *(double *)(a1 + 672) = a4;
    *(double *)(a1 + 680) = a5;
    uint64_t v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PKMetalRendererController_setViewScissor___block_invoke;
    block[3] = &unk_1E64C7358;
    void block[4] = a1;
    *(double *)&void block[5] = a2;
    *(double *)&block[6] = a3;
    *(double *)&void block[7] = a4;
    *(double *)&block[8] = a5;
    dispatch_async(v5, block);
  }
}

BOOL __44__PKMetalRendererController_setViewScissor___block_invoke(BOOL result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1) {
    return -[PKMetalRenderer setViewScissor:](0, *(CGFloat *)(result + 40), *(CGFloat *)(result + 48), *(CGFloat *)(result + 56), *(CGFloat *)(result + 64));
  }
  if (!atomic_load((unsigned int *)(v1 + 36)))
  {
    uint64_t v3 = *(void *)(result + 32);
    CGFloat v4 = *(double *)(result + 40);
    CGFloat v5 = *(double *)(result + 48);
    CGFloat v6 = *(double *)(result + 56);
    CGFloat v7 = *(double *)(result + 64);
    if (v3) {
      uint64_t v8 = *(void *)(v3 + 624);
    }
    else {
      uint64_t v8 = 0;
    }
    return -[PKMetalRenderer setViewScissor:](v8, v4, v5, v6, v7);
  }
  return result;
}

- (void)setBackboardPaperMultiply:(uint64_t)a1
{
  if (a1)
  {
    long long v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PKMetalRendererController_setBackboardPaperMultiply___block_invoke;
    v3[3] = &unk_1E64C73F8;
    v3[4] = a1;
    *(double *)&void v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

double __55__PKMetalRendererController_setBackboardPaperMultiply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (!atomic_load((unsigned int *)(v1 + 36)))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (v3)
      {
        uint64_t v4 = *(void *)(v3 + 624);
        if (v4)
        {
          double result = *(double *)(a1 + 40);
          *(double *)(v4 + 1000) = result;
        }
      }
    }
  }
  return result;
}

- (void)setCombineStrokesAllowed:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 510) = a2;
    long long v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__PKMetalRendererController_setCombineStrokesAllowed___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

double __54__PKMetalRendererController_setCombineStrokesAllowed___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 624);
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)&double result = -[PKMetalRenderer setCombineStrokesAllowed:](v3, v1 != 0).n128_u64[0];
  return result;
}

- (void)setIsPDFCanvasForAnalytics:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PKMetalRendererController_setIsPDFCanvasForAnalytics___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t __56__PKMetalRendererController_setIsPDFCanvasForAnalytics___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 504) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)drawStrokes:(void *)a3 intoTile:(uint64_t)a4 renderCount:(char)a5 offscreen:
{
  id v9 = a2;
  id v10 = a3;
  CGFloat v11 = v10;
  if (a1)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    CGAffineTransform v12 = *(NSObject **)(a1 + 24);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke;
    v15[3] = &unk_1E64C7498;
    v15[4] = a1;
    id v16 = v10;
    uint64_t v19 = a4;
    id v17 = v9;
    unint64_t v18 = &v21;
    char v20 = a5;
    dispatch_sync(v12, v15);
    BOOL v13 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      if (*(unsigned char *)(v4 + 83)) {
        return;
      }
      unint64_t v4 = atomic_load((unint64_t *)(v4 + 16));
    }
    if (v4 == *(void *)(a1 + 64))
    {
      CGFloat v5 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v20;
        _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "Draw tile %@.", buf, 0xCu);
      }

      uint64_t v6 = [*(id *)(a1 + 48) count];
      CGFloat v7 = *(void **)(a1 + 32);
      if (v6)
      {
        if (v7) {
          CGFloat v7 = (void *)v7[78];
        }
        uint64_t v8 = v7;
        id v9 = *(void **)(a1 + 40);
        id v10 = *(void **)(a1 + 48);
        uint64_t v11 = *(unsigned __int8 *)(a1 + 72);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke_34;
        v21[3] = &unk_1E64C7470;
        v21[4] = *(void *)(a1 + 32);
        id v12 = v9;
        uint64_t v13 = *(void *)(a1 + 64);
        id v22 = v12;
        uint64_t v23 = v13;
        -[PKMetalRenderer updateTile:strokes:clear:waitUntilCompleted:offscreen:stopBlock:]((uint64_t)v8, v12, v10, 1, 1, v11, v21);

        uint64_t v14 = *(void *)(a1 + 32);
        if (v14) {
          uint64_t v15 = *(void *)(v14 + 624);
        }
        else {
          uint64_t v15 = 0;
        }
        -[PKMetalRenderer purgeOriginalBackFramebuffer](v15);
        uint64_t v16 = *(void *)(a1 + 32);
        if (v16)
        {
          int v17 = atomic_load((unsigned int *)(v16 + 32));
          if (v17 > 0) {
            goto LABEL_21;
          }
        }
        unint64_t v18 = *(void *)(a1 + 40);
        if (v18)
        {
          if (*(unsigned char *)(v18 + 83))
          {
LABEL_21:

            return;
          }
          unint64_t v18 = atomic_load((unint64_t *)(v18 + 16));
        }
        if (v18 == *(void *)(a1 + 64)) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        goto LABEL_21;
      }
      if (v7) {
        uint64_t v19 = v7[78];
      }
      else {
        uint64_t v19 = 0;
      }
      -[PKMetalRenderer clearTile:waitUntilCompleted:](v19, *(void **)(a1 + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke_34(void *a1)
{
  uint64_t v1 = a1[4];
  if (!v1 || (int v2 = atomic_load((unsigned int *)(v1 + 32)), v2 <= 0))
  {
    unint64_t v3 = a1[5];
    if (!v3) {
      return v3 != a1[6];
    }
    if ((*(unsigned char *)(v3 + 83) & 1) == 0)
    {
      unint64_t v3 = atomic_load((unint64_t *)(v3 + 16));
      return v3 != a1[6];
    }
  }
  return 1;
}

- (void)updateTiles:(void *)a3 withNewStrokes:(void *)a4 completionBlock:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(NSObject **)(a1 + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PKMetalRendererController_updateTiles_withNewStrokes_completionBlock___block_invoke;
    v11[3] = &unk_1E64C57D0;
    id v12 = v7;
    uint64_t v13 = a1;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v10, v11);
  }
}

void __72__PKMetalRendererController_updateTiles_withNewStrokes_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        id v7 = objc_msgSend(*(id *)(a1 + 32), "lastObject", (void)v9);

        -[PKMetalRenderer updateTile:strokes:clear:waitUntilCompleted:offscreen:stopBlock:](*(void *)(*(void *)(a1 + 40) + 624), v6, *(void **)(a1 + 48), 0, v6 == v7, 0, 0);
        uint64_t v8 = *(void *)(a1 + 56);
        if (v8 && v6 == v7) {
          (*(void (**)(void))(v8 + 16))();
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)renderImageTexture:(long long *)a3 imageTextureTransform:(void *)a4 withTiles:(long long *)a5 tileTransform:
{
  id v9 = a2;
  id v10 = a4;
  if (a1)
  {
    long long v11 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PKMetalRendererController_renderImageTexture_imageTextureTransform_withTiles_tileTransform___block_invoke;
    block[3] = &unk_1E64C74C0;
    void block[4] = a1;
    id v15 = v9;
    long long v12 = a3[1];
    long long v17 = *a3;
    long long v18 = v12;
    long long v19 = a3[2];
    id v16 = v10;
    long long v13 = a5[1];
    long long v20 = *a5;
    long long v21 = v13;
    long long v22 = a5[2];
    dispatch_sync(v11, block);
  }
}

void __94__PKMetalRendererController_renderImageTexture_imageTextureTransform_withTiles_tileTransform___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Render tiles.", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 624);
    }
    else {
      uint64_t v6 = 0;
    }
    long long v7 = *(_OWORD *)(a1 + 72);
    v12[0] = *(_OWORD *)(a1 + 56);
    v12[1] = v7;
    v12[2] = *(_OWORD *)(a1 + 88);
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    long long v10 = *(_OWORD *)(a1 + 120);
    v11[0] = *(_OWORD *)(a1 + 104);
    v11[1] = v10;
    v11[2] = *(_OWORD *)(a1 + 136);
    -[PKMetalRenderer renderImageTexture:imageTextureTransform:withTiles:tileTransform:waitUntilCompleted:](v6, v8, v12, v9, v11, 1);
  }
}

- (void)renderTilesIntoTiles:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__PKMetalRendererController_renderTilesIntoTiles___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

void __50__PKMetalRendererController_renderTilesIntoTiles___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Render tile into tile.", v11, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 40) keyEnumerator];
    uint64_t v6 = [v5 nextObject];
    if (v6)
    {
      do
      {
        uint64_t v7 = [v5 nextObject];
        uint64_t v8 = *(void **)(a1 + 32);
        if (v8) {
          uint64_t v8 = (void *)v8[78];
        }
        id v9 = v8;
        long long v10 = [*(id *)(a1 + 40) objectForKey:v6];
        -[PKMetalRenderer renderTiles:intoTile:waitUntilCompleted:]((uint64_t)v9, v10, v6, v7 == 0);

        uint64_t v6 = (void *)v7;
      }
      while (v7);
    }
  }
}

- (void)drawTexture:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__PKMetalRendererController_drawTexture___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __41__PKMetalRendererController_drawTexture___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Draw texture.", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 624);
    }
    else {
      uint64_t v6 = 0;
    }
    -[PKMetalRenderer renderTexture:](v6, *(void **)(a1 + 40));
  }
}

- (void)flushMemoryIfPossible
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PKMetalRendererController_flushMemoryIfPossible__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __50__PKMetalRendererController_flushMemoryIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    goto LABEL_5;
  }
  if (atomic_load((unsigned int *)(v1 + 36))) {
    return;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    -[PKMetalRenderer flushMemoryIfPossible](*(void *)(v3 + 624));
  }
  else {
LABEL_5:
  }
    -[PKMetalRenderer flushMemoryIfPossible](0);
}

- (void)purgeOriginalBackFramebuffer
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKMetalRendererController_purgeOriginalBackFramebuffer__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __57__PKMetalRendererController_purgeOriginalBackFramebuffer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    goto LABEL_5;
  }
  if (atomic_load((unsigned int *)(v1 + 36))) {
    return;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    -[PKMetalRenderer purgeOriginalBackFramebuffer](*(void *)(v3 + 624));
  }
  else {
LABEL_5:
  }
    -[PKMetalRenderer purgeOriginalBackFramebuffer](0);
}

- (void)drawStrokesAfterClear:(long long *)a3 clippedToStrokeSpaceRect:(char)a4 strokeTransform:(void *)a5 useLayerContext:(double)a6 completion:(double)a7
{
  id v17 = a2;
  id v18 = a5;
  long long v19 = v18;
  if (a1)
  {
    long long v20 = a3[1];
    v23[0] = *a3;
    v23[1] = v20;
    v23[2] = a3[2];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke;
    v21[3] = &unk_1E64C57F8;
    id v22 = v18;
    -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:renderCompletion:](a1, v17, v23, a4, v21, a6, a7, a8, a9);
  }
}

void __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke_2;
  v5[3] = &unk_1E64C74E8;
  id v6 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (double)_latestLatency
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 24);
  if (v1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__PKMetalRendererController__latestLatency__block_invoke;
    v4[3] = &unk_1E64C5848;
    v4[4] = a1;
    void v4[5] = &v5;
    dispatch_sync(v1, v4);
    double v2 = v6[3];
  }
  else
  {
    double v2 = 0.0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

double __43__PKMetalRendererController__latestLatency__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 576);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)drawingBeganWithStroke:(char)a3 forPreview:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PKMetalRendererController_drawingBeganWithStroke_forPreview___block_invoke;
    block[3] = &unk_1E64C6640;
    void block[4] = a1;
    char v10 = a3;
    id v9 = v5;
    dispatch_sync(v7, block);
  }
}

void __63__PKMetalRendererController_drawingBeganWithStroke_forPreview___block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_1C4829D00[*(double *)&_MergedGlobals_111 < 0.01];
  uint64_t v3 = *(void *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 224));
  *(void *)(v3 + 152) = 0;
  *(void *)(v3 + 160) = 0;
  *(void *)(v3 + 216) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 224));
  uint64_t v4 = *(void *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 312));
  *(void *)(v4 + 240) = 0;
  *(void *)(v4 + 248) = 0;
  *(void *)(v4 + 304) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 312));
  *(void *)(*(void *)(a1 + 32) + 136) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(a1 + 48);
  *(CFTimeInterval *)(*(void *)(a1 + 32) + 488) = CACurrentMediaTime();
  id v5 = [*(id *)(a1 + 40) ink];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 480);
  *(void *)(v7 + 480) = v6;

  uint64_t v9 = *(void *)(a1 + 32);
  if (!v9) {
    goto LABEL_8;
  }
  if (atomic_load((unsigned int *)(v9 + 36))) {
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 624);
  }
  else {
LABEL_8:
  }
    uint64_t v12 = 0;
  long long v13 = *(void **)(a1 + 40);

  -[PKMetalRenderer drawingBeganWithStroke:forPreview:](v12, v13);
}

- (void)_recordStrokeStatistics
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 224);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    uint64_t v3 = *(void *)(a1 + 152);
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      double v4 = PKRunningStat::min((PKRunningStat *)(a1 + 144));
      double v5 = PKRunningStat::mean((PKRunningStat *)(a1 + 144)) * 1000.0;
      double v6 = PKRunningStat::max((PKRunningStat *)(a1 + 144)) * 1000.0;
      double v7 = PKRunningStat::variance((PKRunningStat *)(a1 + 144));
      os_unfair_lock_lock(v2);
      uint64_t v8 = *(void *)(a1 + 160);
      os_unfair_lock_unlock(v2);
      os_unfair_lock_lock(v2);
      uint64_t v9 = *(void *)(a1 + 152);
      os_unfair_lock_unlock(v2);
      double v10 = (double)v8 / (double)v9;
      uint64_t v11 = os_log_create("com.apple.pencilkit", "Latency");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134219008;
        double v25 = v4 * 1000.0;
        __int16 v26 = 2048;
        double v27 = v5;
        __int16 v28 = 2048;
        double v29 = sqrt(v7) * 1000.0;
        __int16 v30 = 2048;
        double v31 = v6;
        __int16 v32 = 2048;
        double v33 = v10;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Stroke latency min: %g, mean: %g, std deviation: %g, max: %g, percentage high: %g", (uint8_t *)&v24, 0x34u);
      }

      *(double *)(a1 + 576) = v5;
      BOOL v12 = *(unsigned char *)(a1 + 473) == 0;
      uint64_t v13 = +[PKStatisticsManager sharedStatisticsManager]();
      uint64_t v14 = (void *)v13;
      if (v12) {
        -[PKStatisticsManager recordLatency:mean:max:percentageOverLatencyThreshold:isInPDF:](v13);
      }
      else {
        -[PKStatisticsManager recordHoverLatency:mean:max:shadowEnabled:isInPDF:](v13);
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    uint64_t v15 = *(void *)(a1 + 240);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
    if (v15)
    {
      double v16 = PKRunningStat::min((PKRunningStat *)(a1 + 232));
      double v17 = PKRunningStat::mean((PKRunningStat *)(a1 + 232)) * 1000.0;
      double v18 = PKRunningStat::max((PKRunningStat *)(a1 + 232)) * 1000.0;
      double v19 = PKRunningStat::variance((PKRunningStat *)(a1 + 232));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
      uint64_t v20 = *(void *)(a1 + 248);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
      uint64_t v21 = *(void *)(a1 + 240);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
      id v22 = os_log_create("com.apple.pencilkit", "Latency");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134219008;
        double v25 = v16 * 1000.0;
        __int16 v26 = 2048;
        double v27 = v17;
        __int16 v28 = 2048;
        double v29 = sqrt(v19) * 1000.0;
        __int16 v30 = 2048;
        double v31 = v18;
        __int16 v32 = 2048;
        double v33 = (double)v20 / (double)v21;
        _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_DEFAULT, "Stroke latency with prediction min: %g, mean: %g, std deviation: %g, max: %g, percentage high: %g", (uint8_t *)&v24, 0x34u);
      }

      if (!*(unsigned char *)(a1 + 473))
      {
        uint64_t v23 = +[PKStatisticsManager sharedStatisticsManager]();
        -[PKStatisticsManager recordPerceivedLatency:mean:max:isInPDF:]((uint64_t)v23);
      }
    }
  }
}

- (void)drawingEnded:(void *)a3 finishStrokeBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    double v7 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke;
    block[3] = &unk_1E64C5820;
    void block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_sync(v7, block);
  }
}

void __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (atomic_load((unsigned int *)(v2 + 36))) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  -[PKMetalRendererController _logStrokeDuration](v4);
  -[PKMetalRendererController _recordStrokeStatistics](*(void *)(a1 + 32));
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[78];
  }
  id v6 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke_2;
  v8[3] = &unk_1E64C5390;
  double v7 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  -[PKMetalRenderer drawingEnded:finishStrokeBlock:]((uint64_t)v6, v7, v8);
}

- (void)_logStrokeDuration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = CACurrentMediaTime();
    uint64_t v3 = os_log_create("com.apple.pencilkit", "Stroke Drawing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v2 - *(double *)(a1 + 488);
      uint64_t v5 = *(void *)(a1 + 480);
      id v6 = @"YES";
      if (!*(unsigned char *)(a1 + 473)) {
        id v6 = @"NO";
      }
      int v7 = 134218498;
      double v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      BOOL v12 = v6;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Stroke Duration: %.3f, ink: %@, forPreview: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

uint64_t __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)drawingCancelledForPreview:(uint64_t)a1
{
  if (a1)
  {
    double v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PKMetalRendererController_drawingCancelledForPreview___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_sync(v2, v3);
  }
}

void __56__PKMetalRendererController_drawingCancelledForPreview___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (atomic_load((unsigned int *)(v2 + 36))) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (*(unsigned char *)(v4 + 473))
  {
    -[PKMetalRendererController _logStrokeDuration](v4);
    -[PKMetalRendererController _recordStrokeStatistics](*(void *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  -[PKMetalRenderer drawingCancelledForPreview:](*(void *)(v4 + 624), *(unsigned char *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 472) = 1;
}

- (void)setAlternativeStrokes:(double)a3 alpha:(double)a4 originalStrokeAlpha:
{
  id v7 = a2;
  double v8 = v7;
  if (a1)
  {
    __int16 v9 = *(NSObject **)(a1 + 24);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PKMetalRendererController_setAlternativeStrokes_alpha_originalStrokeAlpha___block_invoke;
    v10[3] = &unk_1E64C7510;
    v10[4] = a1;
    id v11 = v7;
    double v12 = a3;
    double v13 = a4;
    dispatch_async(v9, v10);
  }
}

void __77__PKMetalRendererController_setAlternativeStrokes_alpha_originalStrokeAlpha___block_invoke(uint64_t a1)
{
}

- (void)changeRenderSize
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKMetalRendererController_changeRenderSize__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __45__PKMetalRendererController_changeRenderSize__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || (unsigned int v2 = atomic_load((unsigned int *)(v1 + 36))) == 0)
  {
    uint64_t v3 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEBUG, "Drawing resize.", v4, 2u);
    }
  }
}

uint64_t __51__PKMetalRendererController__present_setDirtyRect___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 presentedTime];
  double v5 = v4 - *(double *)(a1 + 40);
  if (v5 > 0.0)
  {
    double v6 = v5 + *(double *)&qword_1EB3C5D50;
    double v7 = v4 + *(double *)&qword_1EB3C5D50 - *(double *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = (os_unfair_lock_s *)(v8 + 224);
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 224));
    uint64_t v10 = *(void *)(v8 + 152);
    os_unfair_lock_unlock(v9);
    if (v10 < 10 || (double v11 = PKRunningStat::mean((PKRunningStat *)(*(void *)(a1 + 32) + 144)), v6 < v11 + v11))
    {
      PKRunningStat::push((PKRunningStat *)(*(void *)(a1 + 32) + 144), v6);
      PKRunningStat::push((PKRunningStat *)(*(void *)(a1 + 32) + 232), v7);
    }
    return kdebug_trace();
  }
  return result;
}

uint64_t __51__PKMetalRendererController__present_setDirtyRect___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  if (*(void *)(a1 + 48)) {
    [MEMORY[0x1E4F39CF8] setLowLatency:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "present", (void)v7);
    (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  return objc_msgSend(MEMORY[0x1E4F39CF8], "commit", (void)v7);
}

- (void)_renderLiveStrokeAndPresentWithTransform:(uint64_t)a1 at:(_OWORD *)a2 setDirtyRect:(int)a3
{
  if (a1)
  {
    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 584));
    [WeakRetained contentsScale];
    CGFloat v8 = v7;

    id v9 = objc_loadWeakRetained((id *)(a1 + 584));
    [v9 drawableSize];
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = *(void **)(a1 + 624);
    long long v15 = a2[1];
    *(_OWORD *)&t1.a = *a2;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tdouble x = a2[2];
    double v16 = v14;
    CGAffineTransformMakeScale(&t2, v8, v8);
    CGAffineTransformConcat(&v51, &t1, &t2);
    [(PKMetalRenderer *)v16 renderLiveStrokeWithTransform:v11 renderBufferSize:v13];

    kdebug_trace();
    id v17 = *(id *)(a1 + 328);
    id v18 = *(id *)(a1 + 344);
    id v19 = *(id *)(a1 + 320);
    uint64_t v20 = *(void **)(a1 + 328);
    *(void *)(a1 + 328) = 0;

    uint64_t v21 = *(void **)(a1 + 320);
    *(void *)(a1 + 320) = 0;

    id v22 = *(void **)(a1 + 344);
    *(void *)(a1 + 344) = 0;

    uint64_t v23 = *(void **)(a1 + 336);
    *(void *)(a1 + 336) = 0;

    objc_super v47 = v19;
    if (v19)
    {
      id v24 = objc_loadWeakRetained((id *)(a1 + 512));
      char v25 = objc_opt_respondsToSelector();
    }
    else
    {
      char v25 = 0;
    }
    __int16 v26 = (void *)[*(id *)(a1 + 88) copy];
    [*(id *)(a1 + 88) removeAllObjects];
    id v48 = *(id *)(a1 + 624);
    kdebug_trace();
    [*(id *)(a1 + 544) latestTimestamp];
    uint64_t v28 = v27;
    [*(id *)(a1 + 544) latestNonPredictedTimestamp];
    double v30 = v29;
    id v31 = objc_loadWeakRetained((id *)(a1 + 584));
    [v31 setInputTime:v30];

    if (v17 && v30 > 0.0)
    {
      uint64_t v32 = 6;
      if (byte_1EA3C1EB8) {
        uint64_t v32 = 8;
      }
      if (*(void *)(a1 + 136) > v32)
      {
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __51__PKMetalRendererController__present_setDirtyRect___block_invoke;
        v58[3] = &unk_1E64C7538;
        *(double *)&v58[5] = v30;
        v58[6] = v28;
        v58[4] = a1;
        [v17 addPresentedHandler:v58];
      }
    }
    unint64_t v33 = (unint64_t)_Block_copy(*(const void **)(a1 + 424));
    long long v57 = *(_OWORD *)(a1 + 360);
    if (v17 && a3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v34 = *(double **)(a1 + 624);
      if (v34)
      {
        double v35 = v34[91];
        double v36 = v34[92];
        double v37 = v34[93];
        double v38 = v34[94];
      }
      else
      {
        double v36 = 0.0;
        double v37 = 0.0;
        double v38 = 0.0;
        double v35 = 0.0;
      }
      objc_msgSend(v17, "setDirtyRect:", v35, v36, v37, v38);
      objc_msgSend(v18, "setDirtyRect:", v35, v36, v37, v38);
    }
    BOOL v39 = (v33 | [v26 count]) != 0;
    if (v33) {
      v40 = 0;
    }
    else {
      v40 = v17;
    }
    if (v33) {
      uint64_t v41 = 0;
    }
    else {
      uint64_t v41 = v18;
    }
    -[PKMetalRenderer finishLiveStrokeAndPresentDrawable:multiplyDrawable:waitUntilScheduled:]((uint64_t)v48, v40, v41, v39);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKMetalRendererController__present_setDirtyRect___block_invoke_2;
    aBlock[3] = &unk_1E64C7560;
    id v42 = (id)v33;
    id v55 = v42;
    id v43 = v26;
    id v53 = v43;
    id v44 = v17;
    id v54 = v44;
    long long v56 = v57;
    long long v45 = _Block_copy(aBlock);
    if (v33)
    {
      dispatch_sync(MEMORY[0x1E4F14428], v45);
    }
    else if (v39)
    {
      dispatch_async(MEMORY[0x1E4F14428], v45);
    }
    if (v25)
    {
      id v46 = objc_loadWeakRetained((id *)(a1 + 512));
      [v46 metalRendererController:a1 didCommitRenderingIntoTexture:v47];
    }
    kdebug_trace();
  }
}

- (void)pokeEventDispatcher
{
  if (a1 && (_UIUpdateCycleEnabled() & 1) == 0)
  {
    uint64_t v1 = MEMORY[0x1E4F14428];
    dispatch_async(v1, &__block_literal_global_54);
  }
}

void __48__PKMetalRendererController_pokeEventDispatcher__block_invoke()
{
  id v0 = [(id)*MEMORY[0x1E4FB2608] valueForKeyPath:@"eventDispatcher"];
  [v0 eventFetcherDidReceiveEvents:0];
}

- (void)renderWithTransform:(double)a3 inputScale:(double)a4 at:
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    long long v5 = a2[1];
    long long v7 = *a2;
    long long v8 = v5;
    block[2] = __63__PKMetalRendererController_renderWithTransform_inputScale_at___block_invoke;
    block[3] = &unk_1E64C7588;
    void block[4] = a1;
    long long v9 = a2[2];
    double v10 = a3;
    double v11 = a4;
    dispatch_async(v4, block);
  }
}

void __63__PKMetalRendererController_renderWithTransform_inputScale_at___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v7 = 0;
    uint64_t v4 = (long long *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 56);
    long long src = *(_OWORD *)(a1 + 40);
    long long v19 = v14;
    long long v20 = *(_OWORD *)(a1 + 72);
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)(v2 + 624);
  if (!v3)
  {
    uint64_t v4 = (long long *)(a1 + 40);
    long long v15 = *(_OWORD *)(a1 + 56);
    long long src = *(_OWORD *)(a1 + 40);
    long long v19 = v15;
    long long v20 = *(_OWORD *)(a1 + 72);
LABEL_4:
    objc_copyStruct((void *)(v2 + 784), &src, 48, 1, 0);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      *(void *)(v6 + 632) = *(void *)(a1 + 88);
      uint64_t v7 = *(void *)(a1 + 32);
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  *(unsigned char *)(v3 + 961) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = (long long *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 56);
  long long src = *(_OWORD *)(a1 + 40);
  long long v19 = v5;
  long long v20 = *(_OWORD *)(a1 + 72);
  if (v2) {
    goto LABEL_4;
  }
LABEL_13:
  uint64_t v7 = 0;
LABEL_6:
  long long v8 = *v4;
  long long v9 = v4[2];
  v17[1] = v4[1];
  v17[2] = v9;
  v17[0] = v8;
  if (-[PKMetalRendererController _renderAheadWithTransform:at:](v7, v17))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      -[PKMetalRenderer getAndRenderNewPoints:](*(void *)(v10 + 624), *(void **)(v10 + 544));
      uint64_t v11 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v11 = 0;
    }
    long long v12 = *v4;
    long long v13 = v4[2];
    v16[1] = v4[1];
    v16[2] = v13;
    v16[0] = v12;
    -[PKMetalRendererController _renderLiveStrokeAndPresentWithTransform:at:setDirtyRect:](v11, v16, 0);
    ++*(void *)(*(void *)(a1 + 32) + 136);
  }
}

- (uint64_t)_renderAheadWithTransform:(uint64_t)a1 at:(_OWORD *)a2
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 512));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (*(void *)(a1 + 320))
    {
      uint64_t v6 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "Already had texture target!";
LABEL_9:
        _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    id v31 = objc_loadWeakRetained((id *)(a1 + 512));
    uint64_t v32 = [v31 nextTextureTargetForMetalRendererController:a1];
    unint64_t v33 = *(void **)(a1 + 320);
    *(void *)(a1 + 320) = v32;

    if (*(void *)(a1 + 320)) {
      goto LABEL_11;
    }
LABEL_61:
    uint64_t v29 = 0;
    goto LABEL_23;
  }
  if (!*(void *)(a1 + 328))
  {
    id v34 = objc_loadWeakRetained((id *)(a1 + 584));
    char v35 = [v34 isDrawableAvailable];

    if ((v35 & 1) == 0)
    {
      id v22 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_DEFAULT, "PKMetalRendererController: No drawable available; skipping frame",
          buf,
          2u);
      }
      uint64_t v29 = 0;
      goto LABEL_22;
    }
    id v36 = objc_loadWeakRetained((id *)(a1 + 584));
    uint64_t v37 = [v36 nextDrawable];
    double v38 = *(void **)(a1 + 328);
    *(void *)(a1 + 328) = v37;

    if (!*(void *)(a1 + 328))
    {
      BOOL v39 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_DEFAULT, "No drawable available, trying discardContents", buf, 2u);
      }

      id v40 = objc_loadWeakRetained((id *)(a1 + 584));
      [v40 discardContents];

      id v41 = objc_loadWeakRetained((id *)(a1 + 584));
      uint64_t v42 = [v41 nextDrawable];
      id v43 = *(void **)(a1 + 328);
      *(void *)(a1 + 328) = v42;

      if (!*(void *)(a1 + 328))
      {
        id v44 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C44F8000, v44, OS_LOG_TYPE_ERROR, "Unable to setup current drawable", buf, 2u);
        }
      }
    }
    id v45 = objc_loadWeakRetained((id *)(a1 + 592));
    BOOL v46 = v45 == 0;

    if (!v46)
    {
      id v47 = objc_loadWeakRetained((id *)(a1 + 592));
      uint64_t v48 = [v47 nextDrawable];
      v49 = *(void **)(a1 + 344);
      *(void *)(a1 + 344) = v48;

      id v50 = objc_loadWeakRetained((id *)(a1 + 592));
      LODWORD(v47) = v50 == 0;

      if (v47)
      {
        CGAffineTransform v51 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C44F8000, v51, OS_LOG_TYPE_DEFAULT, "No multiply drawable available, trying discardContents", buf, 2u);
        }

        id v52 = objc_loadWeakRetained((id *)(a1 + 592));
        [v52 discardContents];

        id v53 = objc_loadWeakRetained((id *)(a1 + 592));
        uint64_t v54 = [v53 nextDrawable];
        id v55 = *(void **)(a1 + 344);
        *(void *)(a1 + 344) = v54;
      }
      if (!*(void *)(a1 + 344))
      {
        long long v56 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C44F8000, v56, OS_LOG_TYPE_ERROR, "Unable to setup current multiply drawable", buf, 2u);
        }
      }
    }
    long long v57 = *(void **)(a1 + 328);
    if (v57)
    {
      float v58 = [v57 texture];
      double v59 = (double)(unint64_t)[v58 width];
      double v60 = (double)(unint64_t)[v58 height];
      if (*(double *)(a1 + 104) != v59 || *(double *)(a1 + 112) != v60)
      {
        v61 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          uint64_t v71 = *(void *)(a1 + 104);
          uint64_t v72 = *(void *)(a1 + 112);
          *(_DWORD *)buf = 134218752;
          double v79 = v59;
          __int16 v80 = 2048;
          double v81 = v60;
          __int16 v82 = 2048;
          uint64_t v83 = v71;
          __int16 v84 = 2048;
          uint64_t v85 = v72;
          _os_log_error_impl(&dword_1C44F8000, v61, OS_LOG_TYPE_ERROR, "Drawable has incorrect size: %g %g vs %g %g", buf, 0x2Au);
        }

        uint64_t v62 = *(void **)(a1 + 328);
        *(void *)(a1 + 328) = 0;
      }
    }
    v63 = *(void **)(a1 + 344);
    if (v63)
    {
      uint64_t v64 = [v63 texture];
      double v65 = (double)(unint64_t)[v64 width];
      double v66 = (double)(unint64_t)[v64 height];
      if (*(double *)(a1 + 104) != v65 || *(double *)(a1 + 112) != v66)
      {
        long long v67 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          uint64_t v73 = *(void *)(a1 + 104);
          uint64_t v74 = *(void *)(a1 + 112);
          *(_DWORD *)buf = 134218752;
          double v79 = v65;
          __int16 v80 = 2048;
          double v81 = v66;
          __int16 v82 = 2048;
          uint64_t v83 = v73;
          __int16 v84 = 2048;
          uint64_t v85 = v74;
          _os_log_error_impl(&dword_1C44F8000, v67, OS_LOG_TYPE_ERROR, "Multiply drawable has incorrect size: %g %g vs %g %g", buf, 0x2Au);
        }

        long long v68 = *(void **)(a1 + 344);
        *(void *)(a1 + 344) = 0;
      }
    }
    if (*(void *)(a1 + 328))
    {
      id v69 = objc_loadWeakRetained((id *)(a1 + 592));
      if (!v69)
      {
        uint64_t v6 = 0;
        goto LABEL_10;
      }
      BOOL v70 = *(void *)(a1 + 344) == 0;

      if (!v70) {
        goto LABEL_11;
      }
    }
    goto LABEL_61;
  }
  uint64_t v6 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v7 = "Already had drawable!";
    goto LABEL_9;
  }
LABEL_10:

LABEL_11:
  uint64_t v8 = *(void *)(a1 + 624);
  if (v8) {
    *(void *)(v8 + 1008) = *(void *)(a1 + 632);
  }
  id v9 = *(id *)(a1 + 544);
  [v9 eraserIndicatorAlpha];
  uint64_t v11 = *(void *)(a1 + 624);
  if (v11) {
    *(void *)(v11 + 1016) = v10;
  }

  id v12 = objc_loadWeakRetained((id *)(a1 + 584));
  [v12 contentsScale];
  CGFloat v14 = v13;

  id v15 = objc_loadWeakRetained((id *)(a1 + 584));
  [v15 drawableSize];
  double v17 = v16;
  double v19 = v18;

  long long v20 = *(void **)(a1 + 328);
  if (v20)
  {
    uint64_t v21 = [v20 texture];
  }
  else
  {
    uint64_t v21 = *(id *)(a1 + 320);
  }
  id v22 = v21;
  uint64_t v23 = *(void **)(a1 + 344);
  if (v23)
  {
    id v24 = [v23 texture];
  }
  else
  {
    id v24 = *(id *)(a1 + 336);
  }
  char v25 = v24;
  __int16 v26 = *(void **)(a1 + 624);
  long long v27 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v27;
  *(_OWORD *)&t1.tdouble x = a2[2];
  id v28 = v26;
  CGAffineTransformMakeScale(&v75, v14, v14);
  CGAffineTransformConcat(&v77, &t1, &v75);
  [(PKMetalRenderer *)(uint64_t)v28 renderAheadWithTransform:1 onPaper:v22 renderBufferSize:v25 destinationTexture:v17 destinationMultiplyTexture:v19];

  uint64_t v29 = 1;
LABEL_22:

LABEL_23:
  kdebug_trace();
  return v29;
}

- (uint64_t)prerenderWithTransform:(double)a3 inputScale:(double)a4 at:
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 584));
  if (WeakRetained)
  {
  }
  else
  {
    uint64_t v9 = (uint64_t)objc_loadWeakRetained((id *)(a1 + 512));

    if (!v9) {
      return v9;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F28F80] processInfo];
  [v10 systemUptime];
  double v12 = v11;

  if (a4 - v12 > *(double *)&_MergedGlobals_111) {
    a4 = v12 + *(double *)&_MergedGlobals_111;
  }
  long long v13 = a2[1];
  src[0] = *a2;
  src[1] = v13;
  src[2] = a2[2];
  uint64_t v9 = 1;
  objc_copyStruct((void *)(a1 + 784), src, 48, 1, 0);
  *(double *)(a1 + 632) = a3;
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(a1 + 80), 1u);
  id v15 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKMetalRendererController_prerenderWithTransform_inputScale_at___block_invoke;
  block[3] = &unk_1E64C75B0;
  void block[4] = a1;
  *(double *)&void block[5] = a4;
  unsigned int v22 = add;
  long long v16 = a2[1];
  long long v19 = *a2;
  long long v20 = v16;
  long long v21 = a2[2];
  dispatch_async(v15, block);
  return v9;
}

uint64_t __66__PKMetalRendererController_prerenderWithTransform_inputScale_at___block_invoke(uint64_t a1)
{
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 80), 0xFFFFFFFF);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (unsigned int v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    if (!*(_DWORD *)(a1 + 96) || (int v5 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 80)), v5 < 1))
    {
      if (HIBYTE(_MergedGlobals_159) == 1 && (*(void *)(*(void *)(a1 + 32) + 136) | 2) == 3)
      {
        _UIMachTimeForMediaTime();
        uint64_t result = kdebug_trace();
        ++*(void *)(*(void *)(a1 + 32) + 136);
        return result;
      }
      if (_UIUpdateCycleEnabled() && (uint64_t v6 = *(void *)(a1 + 32), *(void *)(v6 + 496)))
      {
        double v7 = *(double *)(a1 + 40);
        double v8 = COERCE_DOUBLE(atomic_load((unint64_t *)(v6 + 72)));
        if (v7 < v8)
        {
          int v9 = -5;
          while (!__CFADD__(v9++, 1))
          {
            usleep(0xFAu);
            double v11 = COERCE_DOUBLE(atomic_load((unint64_t *)(v6 + 72)));
            if (v7 >= v11) {
              goto LABEL_18;
            }
          }
          goto LABEL_3;
        }
LABEL_18:
        int v12 = 1;
      }
      else
      {
        int v12 = 0;
      }
      _UIMachTimeForMediaTime();
      kdebug_trace();
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 624);
      if (v13)
      {
        CGFloat v14 = (_OWORD *)(v13 + 728);
        long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        _OWORD *v14 = *MEMORY[0x1E4F1DB20];
        v14[1] = v15;
      }
      long long v16 = +[PKRendererVSyncController sharedController]();
      if (-[PKRendererVSyncController isActive]((uint64_t)v16))
      {
        char v17 = _UIUpdateCycleEnabled();

        if ((v17 & 1) == 0)
        {
          double v18 = *(NSObject **)(*(void *)(a1 + 32) + 40);
          dispatch_time_t v19 = dispatch_time(0, (uint64_t)(*(double *)&_MergedGlobals_111 * 3.0 * 1000000000.0));
          if (!dispatch_semaphore_wait(v18, v19)) {
            atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
          }
        }
      }
      else
      {
      }
      [*(id *)(*(void *)(a1 + 32) + 544) latestNonPredictedTimestamp];
      double v21 = v20;
      unsigned int v22 = [MEMORY[0x1E4F28F80] processInfo];
      [v22 systemUptime];
      double v24 = v23;

      uint64_t v25 = mach_absolute_time();
      uint64_t v26 = v25;
      unint64_t v27 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 64));
      if (v27
        && v25 > v27
        && (double)((v25 - v27) * dword_1EA3C1EBC / unk_1EA3C1EC0) / 1000000000.0 < *(double *)&_MergedGlobals_111
                                                                                                * 0.5)
      {
        uint64_t v26 = v27;
      }
      double v28 = *(double *)&qword_1EB3C5D58;
      char v29 = _UIUpdateCycleEnabled();
      uint64_t v30 = *(void *)(a1 + 32);
      if (v29) {
        goto LABEL_36;
      }
      uint64_t v31 = 5;
      if (byte_1EA3C1EB8) {
        uint64_t v31 = 7;
      }
      if (*(void *)(v30 + 136) >= v31)
      {
LABEL_36:
        uint64_t v33 = *(void *)(v30 + 624);
        if (v33) {
          LODWORD(v33) = *(void *)(v33 + 632) == *(void *)(v33 + 624);
        }
        int v32 = v33 ^ 1;
      }
      else
      {
        int v32 = 0;
      }
      uint64_t v34 = [*(id *)(v30 + 544) inputType];
      uint64_t v35 = v34;
      if (v32 && v34 == 1)
      {
        double v28 = *(double *)&qword_1EB3C5D60;
      }
      else if (v32 && *(double *)&_MergedGlobals_111 > 0.01)
      {
        double v28 = *(double *)&_MergedGlobals_111 * 0.5;
      }
      -[PKMetalRendererController pokeEventDispatcher](*(void *)(a1 + 32));
      uint64_t v36 = *(void *)(a1 + 32);
      long long v37 = *(_OWORD *)(v36 + 392);
      v68[0] = *(_OWORD *)(v36 + 376);
      v68[1] = v37;
      long long v69 = *(_OWORD *)(v36 + 408);
      v38.n128_u64[1] = *((void *)&v69 + 1);
      v38.n128_u64[0] = *(void *)(v36 + 360);
      *(void *)&double v39 = [(PKMetalRendererController *)v36 _updateRendererStrokeTransformWithTransform:v38 offset:*(double *)(v36 + 368)].n128_u64[0];
      uint64_t v40 = *(void *)(a1 + 32);
      if (v40 && *(unsigned char *)(v40 + 506))
      {
        uint64_t v41 = *(void *)(v40 + 624);
        if (v41)
        {
          -[PKMetalRenderer finishRendering](*(void *)(v40 + 624));
          *(unsigned char *)(v41 + 72) = 1;
          uint64_t v40 = *(void *)(a1 + 32);
        }
        uint64_t v42 = objc_msgSend(*(id *)(v40 + 432), "count", v39);
        uint64_t v40 = *(void *)(a1 + 32);
        if (v42)
        {
          if (v40) {
            uint64_t v43 = *(void *)(v40 + 624);
          }
          else {
            uint64_t v43 = 0;
          }
          -[PKMetalRenderer renderStrokes:stopBlock:](v43, *(void **)(v40 + 432), 0);
          uint64_t v44 = *(void *)(a1 + 32);
          if (v44) {
            uint64_t v45 = *(void *)(v44 + 624);
          }
          else {
            uint64_t v45 = 0;
          }
          -[PKMetalRenderer addStrokeSpaceDrawableDirtyRect:](v45, *(double *)(v44 + 440), *(double *)(v44 + 448), *(double *)(v44 + 456), *(double *)(v44 + 464));
          uint64_t v40 = *(void *)(a1 + 32);
        }
      }
      long long v46 = *(_OWORD *)(a1 + 64);
      v67[0] = *(_OWORD *)(a1 + 48);
      v67[1] = v46;
      v67[2] = *(_OWORD *)(a1 + 80);
      if (-[PKMetalRendererController _renderAheadWithTransform:at:](v40, v67))
      {
        uint64_t v47 = unk_1EA3C1EC0 * (unint64_t)(v28 * 1000000000.0) / dword_1EA3C1EBC + v26;
        uint64_t v48 = mach_absolute_time();
        double v49 = 0.0;
        if (v47 > v48) {
          double v49 = (double)((v47 - v48) * dword_1EA3C1EBC / unk_1EA3C1EC0) / 1000000000.0;
        }
        if (v12)
        {
          id v50 = *(NSObject **)(*(void *)(a1 + 32) + 496);
          dispatch_time_t v51 = dispatch_time(0, (uint64_t)(v49 * 1000000000.0));
          if (dispatch_semaphore_wait(v50, v51)) {
            kdebug_trace();
          }
        }
        else if (v49 > 0.001 && v35 == 1)
        {
          mach_wait_until(unk_1EA3C1EC0* (unint64_t)(*(double *)&qword_1EB3C5D70 * 1000000000.0)/ dword_1EA3C1EBC+ v26);
          kdebug_trace();
          [*(id *)(*(void *)(a1 + 32) + 544) latestNonPredictedTimestamp];
          unsigned __int8 v53 = _MergedGlobals_159;
          if (v52 != v21) {
            unsigned __int8 v53 = 0;
          }
          if ((v53 & (v24 - v52 > 0.01)) != 0) {
            double v54 = v24 + 0.006;
          }
          else {
            double v54 = v52 + dbl_1C4829D10[*(double *)&_MergedGlobals_111 < 0.01];
          }
          unint64_t v55 = 330000 * (unint64_t)unk_1EA3C1EC0 / dword_1EA3C1EBC;
          uint64_t v56 = v26
              - v55
              + (unint64_t)(*(double *)&qword_1EB3C5D68 * 1000000000.0)
              * unk_1EA3C1EC0
              / dword_1EA3C1EBC;
          while (1)
          {
            uint64_t v57 = v47 >= v56 + v55 ? v56 + v55 : v47;
            mach_wait_until(v57);
            -[PKMetalRendererController pokeEventDispatcher](*(void *)(a1 + 32));
            uint64_t v58 = mach_absolute_time();
            mach_wait_until(100000 * (unint64_t)unk_1EA3C1EC0 / dword_1EA3C1EBC + v58);
            [*(id *)(*(void *)(a1 + 32) + 544) latestNonPredictedTimestamp];
            if (v59 > v54) {
              break;
            }
            uint64_t v56 = mach_absolute_time();
            if (v56 >= v47) {
              goto LABEL_78;
            }
          }
        }
        else
        {
          if (v28 > 0.0) {
            mach_wait_until(v47);
          }
LABEL_78:
          -[PKMetalRendererController pokeEventDispatcher](*(void *)(a1 + 32));
          uint64_t v60 = mach_absolute_time();
          mach_wait_until(100000 * (unint64_t)unk_1EA3C1EC0 / dword_1EA3C1EBC + v60);
        }
        -[PKMetalRenderer getAndRenderNewPoints:](*(void *)(*(void *)(a1 + 32) + 624), *(void **)(*(void *)(a1 + 32) + 544));
        uint64_t v61 = *(void *)(a1 + 32);
        BOOL v62 = *(unsigned char *)(v61 + 472) == 0;
        *(unsigned char *)(v61 + 472) = 0;
        uint64_t v63 = *(void *)(a1 + 32);
        long long v64 = *(_OWORD *)(a1 + 64);
        v66[0] = *(_OWORD *)(a1 + 48);
        v66[1] = v64;
        v66[2] = *(_OWORD *)(a1 + 80);
        -[PKMetalRendererController _renderLiveStrokeAndPresentWithTransform:at:setDirtyRect:](v63, v66, v62);
        ++*(void *)(*(void *)(a1 + 32) + 136);
        if (v12)
        {
          double v65 = *(double *)(a1 + 40) + *(double *)&_MergedGlobals_111 * 2.0 + -0.001;
          if (CACurrentMediaTime() < v65) {
            atomic_store(*(unint64_t *)&v65, (unint64_t *)(*(void *)(a1 + 32) + 72));
          }
        }
      }
      else
      {
        kdebug_trace();
        _UIMachTimeForMediaTime();
      }
      goto LABEL_4;
    }
  }
LABEL_3:
  _UIMachTimeForMediaTime();
LABEL_4:

  return kdebug_trace();
}

- (void)updateCyclePreCACommit:(uint64_t)a1 isDrawing:(char)a2
{
  if (a1 && *(void *)(a1 + 496))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke;
    aBlock[3] = &unk_1E64C5368;
    void aBlock[4] = a1;
    uint64_t v4 = (void (**)(void))_Block_copy(aBlock);
    int v5 = v4;
    if (a2)
    {
      if (*(unsigned char *)(a1 + 506))
      {
        uint64_t v6 = *(void **)(a1 + 544);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_2;
        v18[3] = &unk_1E64C5390;
        dispatch_time_t v19 = v4;
        [v6 whenFinishedProcessingPointsCallCompletion:v18];
        double v7 = v19;
      }
      else
      {
        dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_3;
        _OWORD v16[3] = &unk_1E64C5368;
        double v7 = v8;
        char v17 = v7;
        int v9 = _Block_copy(v16);
        uint64_t v10 = *(void **)(a1 + 544);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_4;
        v13[3] = &unk_1E64C75D8;
        id v14 = v5;
        id v11 = v9;
        id v15 = v11;
        [v10 whenFinishedProcessingPointsCallCompletion:v13];
        dispatch_time_t v12 = dispatch_time(0, 500000);
        if (dispatch_semaphore_wait(v7, v12)) {
          kdebug_trace();
        }
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

intptr_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke(uint64_t a1)
{
  kdebug_trace();
  if (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 496)))
  {
    return kdebug_trace();
  }
  else
  {
    unsigned int v3 = *(NSObject **)(*(void *)(a1 + 32) + 496);
    return dispatch_semaphore_wait(v3, 0);
  }
}

uint64_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

intptr_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_3(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

uint64_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)didFinishRendering:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    int v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PKMetalRendererController_didFinishRendering___block_invoke;
    v6[3] = &unk_1E64C5E48;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __48__PKMetalRendererController_didFinishRendering___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || (unsigned int v2 = atomic_load((unsigned int *)(v1 + 36))) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4 && (id v5 = *(id *)(v4 + 624)) != 0)
      {
        id v7 = v5;
        BOOL v6 = *((void *)v5 + 79) == *((void *)v5 + 78);
      }
      else
      {
        id v7 = 0;
        BOOL v6 = 0;
      }
      (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v6);
    }
  }
}

- (void)addBlockToCallAfterPresenting:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKMetalRendererController_addBlockToCallAfterPresenting___block_invoke;
    v6[3] = &unk_1E64C5E48;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __59__PKMetalRendererController_addBlockToCallAfterPresenting___block_invoke(uint64_t a1)
{
}

- (void)callBlockAfterPresenting:(uint64_t)a1
{
  if (a1)
  {
    unsigned int v2 = *(void **)(a1 + 88);
    id v3 = _Block_copy(aBlock);
    objc_msgSend(v2, "addObject:");
  }
}

- (void)setCanvasOffset:(double)a3
{
  if (a1)
  {
    id v3 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKMetalRendererController_setCanvasOffset___block_invoke;
    block[3] = &unk_1E64C55F0;
    void block[4] = a1;
    *(double *)&void block[5] = a2;
    *(double *)&void block[6] = a3;
    dispatch_async(v3, block);
  }
}

double __45__PKMetalRendererController_setCanvasOffset___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 360) = *(_OWORD *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(v1 + 704);
  v5[0] = *(_OWORD *)(v1 + 688);
  v5[1] = v2;
  long long v6 = *(_OWORD *)(v1 + 720);
  v3.n128_u64[1] = *((void *)&v6 + 1);
  v3.n128_u64[0] = *(void *)(v1 + 360);
  *(void *)&double result = [(PKMetalRendererController *)v1 _updateRendererStrokeTransformWithTransform:v3 offset:*(double *)(v1 + 368)].n128_u64[0];
  return result;
}

- (void)replaceInkTexture:(uint64_t)a3 image:
{
  id v5 = a2;
  if (a1)
  {
    long long v6 = *(void **)(a1 + 624);
    id v8 = v5;
    if (v6) {
      long long v6 = (void *)v6[24];
    }
    id v7 = v6;
    -[PKMetalResourceHandler replaceInkTexture:image:]((uint64_t)v7, v8, a3);

    id v5 = v8;
  }
}

- (void)setCanvasOffsetPresentationOffsetBlock:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__PKMetalRendererController_setCanvasOffsetPresentationOffsetBlock___block_invoke;
    v6[3] = &unk_1E64C5E48;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __68__PKMetalRendererController_setCanvasOffsetPresentationOffsetBlock___block_invoke(uint64_t a1)
{
  long long v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 424);
  *(void *)(v3 + 424) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 624);
  if (v5) {
    *(unsigned char *)(v5 + 964) = *(void *)(a1 + 40) != 0;
  }
}

uint64_t __45__PKMetalRendererController_setInvertColors___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2) {
      *(unsigned char *)(v2 + 965) = *(unsigned char *)(result + 40);
    }
  }
  return result;
}

- (void)callBlockOnRenderQueue:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PKMetalRendererController_callBlockOnRenderQueue___block_invoke;
    block[3] = &unk_1E64C5390;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __52__PKMetalRendererController_callBlockOnRenderQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addInputPoint:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    long long v3 = a2[5];
    long long v12 = a2[4];
    long long v13 = v3;
    long long v4 = a2[7];
    long long v14 = a2[6];
    long long v15 = v4;
    long long v5 = a2[1];
    long long v8 = *a2;
    long long v9 = v5;
    long long v6 = a2[3];
    long long v10 = a2[2];
    long long v11 = v6;
    block[2] = __43__PKMetalRendererController_addInputPoint___block_invoke;
    block[3] = &unk_1E64C7600;
    void block[4] = a1;
    dispatch_async(v2, block);
  }
}

void *__43__PKMetalRendererController_addInputPoint___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 624);
    if (v2) {
      return memmove((void *)(v2 + 808), result + 5, 0x80uLL);
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_destroyWeak((id *)&self->_multiplyPresentationLayer);
  objc_destroyWeak((id *)&self->_presentationLayer);
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateCycleSemaphore, 0);
  objc_storeStrong((id *)&self->_currentInkIdentifier, 0);
  objc_storeStrong((id *)&self->_liveStrokeStrokes, 0);
  objc_storeStrong(&self->_canvasOffsetBlock, 0);
  objc_storeStrong((id *)&self->_currentMultiplyDrawable, 0);
  objc_storeStrong((id *)&self->_currentMultiplyTextureTarget, 0);
  objc_storeStrong((id *)&self->_currentDrawable, 0);
  objc_storeStrong((id *)&self->_currentTextureTarget, 0);
  objc_storeStrong((id *)&self->_postPresentCallbacks, 0);
  objc_storeStrong((id *)&self->_canBeginRenderSemaphore, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);

  objc_storeStrong((id *)&self->_metalConfig, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 144) = 0;
  *((void *)self + 27) = 0;
  *((_DWORD *)self + 56) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((unsigned char *)self + 232) = 0;
  *((void *)self + 38) = 0;
  *((_DWORD *)self + 78) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  return self;
}

@end
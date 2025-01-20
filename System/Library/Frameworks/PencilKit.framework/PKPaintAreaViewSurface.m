@interface PKPaintAreaViewSurface
- (BOOL)eraserBeganAtLocation:(CGPoint)a3;
- (BOOL)isDrawing;
- (BOOL)isErasingObjects;
- (BOOL)isMipmapped;
- (BOOL)waitingForStrokeToEnd;
- (CGAffineTransform)strokeTransform;
- (CGPoint)previousPoint;
- (CGSize)drawingSize;
- (NSMutableArray)strokesToErase;
- (NSMutableSet)strokeIDsToErase;
- (OS_dispatch_queue)dispatchQueue;
- (PKController)drawingController;
- (PKDrawingUUID)drawingUUID;
- (PKPaintAreaView)paintAreaView;
- (PKPaintAreaViewSurface)initWithPaintSurface:(id)a3 dispatchQueue:(id)a4 device:(id)a5;
- (PKPaintSurface)surface;
- (double)textureScale;
- (id)CIImageFromTexture:(id)a3;
- (id)nextTextureTargetForMetalRendererController:(id)a3;
- (void)_didFinishErasingStrokes:(BOOL)a3;
- (void)_setupPKController;
- (void)dealloc;
- (void)dispatchSyncOnSurfaceQueue:(id)a3;
- (void)drawingBegan:(id *)a3 activeInputProperties:(unint64_t)a4 inputType:(int64_t)a5;
- (void)drawingCancelled;
- (void)drawingChanged:(id)a3;
- (void)drawingEndedWithDetectedShape:(id)a3 completionBlock:(id)a4;
- (void)eraseStrokesForPoint:(CGPoint)a3 prevPoint:(CGPoint)a4;
- (void)eraserCancelled;
- (void)eraserEnded;
- (void)eraserMovedToLocation:(CGPoint)a3;
- (void)metalRendererController:(id)a3 didCommitRenderingIntoTexture:(id)a4;
- (void)setIsDrawing:(BOOL)a3;
- (void)setPaintAreaView:(id)a3;
- (void)setPreviousPoint:(CGPoint)a3;
- (void)vsync:(double)a3;
@end

@implementation PKPaintAreaViewSurface

- (PKPaintAreaViewSurface)initWithPaintSurface:(id)a3 dispatchQueue:(id)a4 device:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPaintAreaViewSurface;
  v12 = [(PKPaintAreaViewSurface *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_surface, a3);
    objc_storeStrong((id *)&v13->_device, a5);
    objc_storeStrong((id *)&v13->_dispatchQueue, a4);
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    textureSet = v13->_textureSet;
    v13->_textureSet = (NSMutableArray *)v14;

    int64x2_t v16 = vdupq_n_s64(0x7FF8000000000000uLL);
    v13->_previousPoint = (CGPoint)v16;
    v13->_oldEraseLocation = (CGPoint)v16;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__PKPaintAreaViewSurface_initWithPaintSurface_dispatchQueue_device___block_invoke;
    v18[3] = &unk_1E64C5870;
    v19 = v13;
    id v20 = v9;
    [(PKPaintAreaViewSurface *)v19 dispatchSyncOnSurfaceQueue:v18];
  }
  return v13;
}

double __68__PKPaintAreaViewSurface_initWithPaintSurface_dispatchQueue_device___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) paintSurfaceDrawingSize];
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)(v2 + 136) = v3;
  *(void *)(v2 + 144) = v4;
  [*(id *)(a1 + 40) paintSurfaceTextureScale];
  *(void *)(*(void *)(a1 + 32) + 112) = v5;
  *(float64x2_t *)(*(void *)(a1 + 32) + 24) = vrndaq_f64(vmulq_n_f64(*(float64x2_t *)(*(void *)(a1 + 32) + 136), *(double *)(*(void *)(a1 + 32) + 112)));
  *(unsigned char *)(*(void *)(a1 + 32) + 75) = [*(id *)(a1 + 40) paintSurfaceIsMipmapped];
  v6 = [*(id *)(a1 + 40) paintSurfaceDrawing];
  uint64_t v7 = [v6 uuid];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 128);
  *(void *)(v8 + 128) = v7;

  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    [v10 paintSurfaceStrokeTransform];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  *(_OWORD *)(v11 + 168) = v13;
  *(_OWORD *)(v11 + 184) = v14;
  double result = *(double *)&v15;
  *(_OWORD *)(v11 + 200) = v15;
  return result;
}

- (void)dealloc
{
  -[PKController teardown]((id *)&self->_drawingController->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)PKPaintAreaViewSurface;
  [(PKPaintAreaViewSurface *)&v3 dealloc];
}

- (id)CIImageFromTexture:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v5 = *MEMORY[0x1E4F1E3A0];
  v9[0] = *MEMORY[0x1E4F1E390];
  v9[1] = v5;
  v10[0] = DeviceRGB;
  v10[1] = MEMORY[0x1E4F1CC38];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  CGColorSpaceRelease(DeviceRGB);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithMTLTexture:v3 options:v6];

  return v7;
}

- (void)dispatchSyncOnSurfaceQueue:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  dispatchQueue = self->_dispatchQueue;
  block = v4;
  if (!dispatchQueue)
  {
    int v6 = [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v4 = block;
    if (v6)
    {
      block[2](block);
      goto LABEL_6;
    }
    dispatchQueue = MEMORY[0x1E4F14428];
  }
  dispatch_sync(dispatchQueue, v4);
LABEL_6:
}

- (void)drawingBegan:(id *)a3 activeInputProperties:(unint64_t)a4 inputType:(int64_t)a5
{
  [(PKPaintAreaViewSurface *)self setIsDrawing:1];
  if (!self->_drawingController)
  {
    [(PKPaintAreaViewSurface *)self _setupPKController];
    memset(&v61, 0, sizeof(v61));
    [(PKPaintAreaViewSurface *)self strokeTransform];
    CGAffineTransformMakeScale(&t2, self->_textureScale, self->_textureScale);
    CGAffineTransformConcat(&v61, &t1, &t2);
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__11;
    v57 = __Block_byref_object_dispose__11;
    id v58 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__11;
    v51 = __Block_byref_object_dispose__11;
    id v52 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__11;
    v45[4] = __Block_byref_object_dispose__11;
    id v46 = 0;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke;
    v44[3] = &unk_1E64C7CC0;
    v44[4] = self;
    v44[5] = &v53;
    v44[6] = v45;
    v44[7] = &v47;
    [(PKPaintAreaViewSurface *)self dispatchSyncOnSurfaceQueue:v44];
    drawingController = self->_drawingController;
    if (drawingController) {
      drawingController = (PKController *)drawingController->_rendererController;
    }
    id v10 = drawingController;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = self->_drawingController;
    long long v13 = (void *)v54[5];
    long long v14 = (void *)v48[5];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_2;
    v40[3] = &unk_1E64C7448;
    CGAffineTransform v43 = v61;
    v41 = v10;
    dispatch_semaphore_t v42 = v11;
    long long v15 = v11;
    int64x2_t v16 = v10;
    -[PKController setDrawing:imageTexture:completion:]((uint64_t)v12, v13, v14, v40);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&v47, 8);

    _Block_object_dispose(&v53, 8);
  }
  if (!-[PKPaintAreaViewSurface eraserBeganAtLocation:](self, "eraserBeganAtLocation:", a3->var0.var0.x, a3->var0.var0.y))
  {
    [(PKPaintAreaViewSurface *)self strokeTransform];
    CGAffineTransformInvert(&v39, &v38);
    double a = v39.a;
    double b = v39.b;
    v19 = [(PKPaintAreaViewSurface *)self surface];
    id v20 = [v19 paintSurfaceDrawing];
    objc_super v21 = (void *)[v20 newStroke];

    v22 = [(PKPaintAreaViewSurface *)self paintAreaView];
    v23 = [v22 tool];
    v24 = [v23 ink];
    [v21 _setInk:v24];

    if (!a5)
    {
      v25 = [(PKPaintAreaViewSurface *)self paintAreaView];
      v26 = [v25 traitCollection];
      uint64_t v27 = [v26 forceTouchCapability];

      if (v27 == 1) {
        a3->var1 = -1.0;
      }
    }
    v28 = -[PKController inputController](&self->_drawingController->super.isa);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_3;
    v36[3] = &unk_1E64C5870;
    v36[4] = self;
    id v29 = v21;
    id v37 = v29;
    [v28 drawingBeganWithStroke:v29 inputType:a5 activeInputProperties:a4 inputScale:v36 start:sqrt(b * b + a * a)];

    v30 = -[PKController inputController](&self->_drawingController->super.isa);
    long long v31 = *(_OWORD *)&a3->var9;
    v35[4] = *(_OWORD *)&a3->var7;
    v35[5] = v31;
    long long v32 = *(_OWORD *)&a3->var13;
    v35[6] = *(_OWORD *)&a3->var11;
    v35[7] = v32;
    long long v33 = *(_OWORD *)&a3->var1;
    v35[0] = a3->var0;
    v35[1] = v33;
    long long v34 = *(_OWORD *)&a3->var5;
    v35[2] = *(_OWORD *)&a3->var3;
    v35[3] = v34;
    [v30 addPoint:v35];
  }
}

void __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) surface];
  id v3 = [v2 paintSurfaceDrawing];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) surface];
  uint64_t v8 = [v7 paintSurfaceTexture];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v11
    && (unint64_t)[v11 width] >= 2
    && (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) height] >= 2)
  {
    v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v13 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    objc_storeStrong(v13, v12);
  }
}

intptr_t __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 80);
  -[PKMetalRendererController setStrokeTransform:](*(void *)(a1 + 32), v5);
  id v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

void __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_3(uint64_t a1)
{
  -[PKController didStartLiveInteraction](*(void *)(*(void *)(a1 + 32) + 8));
  long long v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2) {
    long long v2 = (void *)v2[8];
  }
  id v3 = v2;
  -[PKMetalRendererController drawingBeganWithStroke:forPreview:]((uint64_t)v3, *(void **)(a1 + 40), 0);
}

- (void)_setupPKController
{
  long long v13 = objc_alloc_init(PKMetalConfig);
  id v3 = (PKController *)-[PKController initWithPixelSize:actualSize:singleComponent:sixChannelBlendingMode:metalConfig:]([PKController alloc], 0, 0, v13, self->_pixelSize.width, self->_pixelSize.height, self->_drawingSize.width, self->_drawingSize.height);
  drawingController = self->_drawingController;
  self->_drawingController = v3;

  uint64_t v5 = self->_drawingController;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, self);
  }
  int v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  uint64_t v7 = self->_drawingController;
  if (v7) {
    uint64_t v7 = (PKController *)v7->_rendererController;
  }
  uint64_t v8 = v7;
  id v9 = v6;
  -[PKMetalRendererController setBackgroundColor:]((uint64_t)v8, (CGColorRef)[v9 CGColor]);

  id v10 = self->_drawingController;
  if (v10)
  {
    dispatch_semaphore_t v11 = v10->_rendererController;
    v12 = v11;
    if (v11) {
      objc_storeWeak((id *)&v11->_delegate, self);
    }
  }
  else
  {
    v12 = 0;
  }
}

- (void)drawingEndedWithDetectedShape:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  BOOL v8 = [(PKPaintAreaViewSurface *)self isDrawing];
  [(PKPaintAreaViewSurface *)self setIsDrawing:0];
  if (self->_isErasingObjects)
  {
    [(PKPaintAreaViewSurface *)self eraserEnded];
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    if (v8) {
      self->_waitingForStrokeToEnd = 1;
    }
    id v9 = -[PKController inputController](&self->_drawingController->super.isa);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke;
    void v10[3] = &unk_1E64C7D08;
    id v11 = v6;
    v12 = self;
    BOOL v14 = v8;
    long long v13 = v7;
    [v9 drawingEndedEstimatesTimeout:v10 completion:0.1];
  }
}

void __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    v14[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = [v6 strokes];

      uint64_t v5 = (void *)v7;
    }
    -[PKController addNewRenderedStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](*(void *)(*(void *)(a1 + 40) + 8), v5, 0, 0, &__block_literal_global_37);
  }
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v8 = *(void **)(*(void *)(a1 + 40) + 8);
    if (v8) {
      BOOL v8 = (void *)v8[8];
    }
    id v9 = v8;
    id v10 = -[PKController inputController](*(void **)(*(void *)(a1 + 40) + 8));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_4;
    v12[3] = &unk_1E64C5E48;
    id v11 = *(void **)(a1 + 48);
    v12[4] = *(void *)(a1 + 40);
    id v13 = v11;
    -[PKMetalRendererController drawingEnded:finishStrokeBlock:]((uint64_t)v9, v10, v12);
  }
}

void __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_2()
{
}

void __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_5;
  v2[3] = &unk_1E64C5E48;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

intptr_t __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_5(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  objc_sync_exit(v2);

  intptr_t result = *(void *)(a1 + 40);
  if (result) {
    intptr_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(v4 + 80);
    return dispatch_semaphore_signal(v5);
  }
  return result;
}

- (void)drawingCancelled
{
  BOOL v3 = [(PKPaintAreaViewSurface *)self isDrawing];
  [(PKPaintAreaViewSurface *)self setIsDrawing:0];
  if (self->_isErasingObjects)
  {
    [(PKPaintAreaViewSurface *)self eraserCancelled];
  }
  else
  {
    uint64_t v4 = self->_drawingController;
    uint64_t v5 = -[PKController inputController](v4);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__PKPaintAreaViewSurface_drawingCancelled__block_invoke;
    v7[3] = &unk_1E64C65A0;
    v7[4] = self;
    BOOL v9 = v3;
    id v6 = v4;
    BOOL v8 = v6;
    [v5 drawingCancelledWithCompletion:v7];
  }
}

void __42__PKPaintAreaViewSurface_drawingCancelled__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  objc_sync_exit(v2);

  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = *(void **)(a1 + 40);
    if (v3) {
      BOOL v3 = (void *)v3[8];
    }
    uint64_t v4 = v3;
    -[PKMetalRendererController drawingCancelledForPreview:]((uint64_t)v4, 0);

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = *(NSObject **)(v5 + 80);
      dispatch_semaphore_signal(v6);
    }
  }
}

- (void)vsync:(double)a3
{
  if ([(PKPaintAreaViewSurface *)self isDrawing]
    || (uint64_t v5 = self->_drawingController) != 0 && v5->_liveInteraction
    || self->_isErasingObjects)
  {
    memset(&v16, 0, sizeof(v16));
    [(PKPaintAreaViewSurface *)self strokeTransform];
    [(PKPaintAreaViewSurface *)self textureScale];
    CGFloat v7 = v6;
    [(PKPaintAreaViewSurface *)self textureScale];
    CGAffineTransformMakeScale(&t2, v7, v8);
    CGAffineTransformConcat(&v16, &t1, &t2);
    double v9 = sqrt(v16.b * v16.b + v16.a * v16.a);
    drawingController = self->_drawingController;
    if (drawingController) {
      drawingController = (PKController *)drawingController->_rendererController;
    }
    id v11 = drawingController;
    CGAffineTransform v13 = v16;
    -[PKMetalRendererController setStrokeTransform:]((uint64_t)v11, (long long *)&v13);
    memset(v12, 0, sizeof(v12));
    -[PKMetalRendererController renderWithTransform:inputScale:at:]((uint64_t)v11, v12, v9, a3);
  }
}

- (BOOL)eraserBeganAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_isErasingObjects = 0;
  double v6 = [(PKPaintAreaViewSurface *)self paintAreaView];
  CGFloat v7 = [v6 tool];
  CGFloat v8 = [v7 ink];

  double v9 = [v8 identifier];
  LODWORD(v7) = [v9 isEqual:@"com.apple.ink.objectEraser"];

  if (v7
    && (*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    self->_isErasingObjects = 1;
    -[PKPaintAreaViewSurface eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", x, y, x, y);
    self->_oldEraseLocation.double x = x;
    self->_oldEraseLocation.double y = y;
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)eraserMovedToLocation:(CGPoint)a3
{
  CGFloat x = a3.x;
  if ((*(void *)&a3.x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    double y = a3.y;
    if ((*(void *)&a3.y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
      double v6 = self->_oldEraseLocation.x;
      double v7 = self->_oldEraseLocation.y;
      if ((*(void *)&v6 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
        || (*(void *)&self->_oldEraseLocation.y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        goto LABEL_7;
      }
      double v9 = -(a3.x - v6);
      if (a3.x - v6 >= 0.0) {
        double v9 = a3.x - v6;
      }
      if (v9 <= self->_drawingSize.width * 0.5)
      {
        double v10 = y - v7;
        if (y - v7 < 0.0) {
          double v10 = -(y - v7);
        }
        if (v10 <= self->_drawingSize.height * 0.5) {
LABEL_7:
        }
          [(PKPaintAreaViewSurface *)self eraseStrokesForPoint:a3.x prevPoint:y];
      }
      self->_oldEraseLocation.CGFloat x = x;
      self->_oldEraseLocation.double y = y;
    }
  }
}

- (void)eraseStrokesForPoint:(CGPoint)a3 prevPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!self->_strokesToErase)
  {
    double v9 = [MEMORY[0x1E4F1CA48] array];
    strokesToErase = self->_strokesToErase;
    self->_strokesToErase = v9;

    id v11 = [MEMORY[0x1E4F1CA80] set];
    strokeIDsToErase = self->_strokeIDsToErase;
    self->_strokeIDsToErase = v11;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  CGAffineTransform v38 = __Block_byref_object_copy__11;
  CGAffineTransform v39 = __Block_byref_object_dispose__11;
  id v40 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__PKPaintAreaViewSurface_eraseStrokesForPoint_prevPoint___block_invoke;
  v28[3] = &unk_1E64C7D30;
  id v29 = 0;
  v30 = &v35;
  CGFloat v31 = v7;
  CGFloat v32 = v6;
  CGFloat v33 = x;
  CGFloat v34 = y;
  v28[4] = self;
  [(PKPaintAreaViewSurface *)self dispatchSyncOnSurfaceQueue:v28];
  if ([(id)v36[5] count])
  {
    uint64_t v13 = [(NSMutableArray *)self->_strokesToErase count];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v14 = objc_msgSend((id)v36[5], "array", 0);
    id v15 = +[PKStroke copyStrokes:v14 hidden:1];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v20 = self->_strokeIDsToErase;
          objc_super v21 = [v19 _strokeUUID];
          LOBYTE(v20) = [(NSMutableSet *)v20 containsObject:v21];

          if ((v20 & 1) == 0)
          {
            [(NSMutableArray *)self->_strokesToErase addObject:v19];
            v22 = self->_strokeIDsToErase;
            v23 = [v19 _strokeUUID];
            [(NSMutableSet *)v22 addObject:v23];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v41 count:16];
      }
      while (v16);
    }

    if ([(NSMutableArray *)self->_strokesToErase count] != v13) {
      -[PKController updateDrawingWithErasedStrokes:]((uint64_t)self->_drawingController, self->_strokesToErase);
    }
  }

  _Block_object_dispose(&v35, 8);
}

void __57__PKPaintAreaViewSurface_eraseStrokesForPoint_prevPoint___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) surface];
  id v2 = [v6 paintSurfaceDrawing];
  uint64_t v3 = objc_msgSend(v2, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_didFinishErasingStrokes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_strokesToErase copy];
  strokesToErase = self->_strokesToErase;
  self->_strokesToErase = 0;

  strokeIDsToErase = self->_strokeIDsToErase;
  self->_strokeIDsToErase = 0;

  if (v5)
  {
    if ([v5 count]) {
      BOOL v8 = !v3;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __51__PKPaintAreaViewSurface__didFinishErasingStrokes___block_invoke;
      v9[3] = &unk_1E64C5870;
      v9[4] = self;
      id v10 = v5;
      [(PKPaintAreaViewSurface *)self dispatchSyncOnSurfaceQueue:v9];
    }
  }
}

void __51__PKPaintAreaViewSurface__didFinishErasingStrokes___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) surface];
  BOOL v3 = [v2 paintSurfaceDrawing];

  uint64_t v4 = +[PKModifyStrokesCommand commandForErasingStrokes:*(void *)(a1 + 40) drawing:v3];
  [v4 applyToDrawing:v3];
  uint64_t v5 = (void *)[v3 copy];

  [*(id *)(a1 + 32) drawingChanged:v5];
  id v6 = os_log_create("com.apple.pencilkit", "Erase");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [*(id *)(a1 + 40) count];
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_log_debug_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEBUG, "Erased %lu strokes", (uint8_t *)&v8, 0xCu);
  }
}

- (void)eraserEnded
{
  self->_isErasingObjects = 0;
  [(PKPaintAreaViewSurface *)self _didFinishErasingStrokes:1];
}

- (void)eraserCancelled
{
  self->_isErasingObjects = 0;
  [(PKPaintAreaViewSurface *)self _didFinishErasingStrokes:0];
}

- (id)nextTextureTargetForMetalRendererController:(id)a3
{
  uint64_t v4 = self->_textureSet;
  objc_sync_enter(v4);
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  if ((unint64_t)[(NSMutableArray *)self->_textureSet count] >= 2)
  {
    uint64_t v7 = [(NSMutableArray *)self->_textureSet firstObject];
    [(NSMutableArray *)self->_textureSet removeObjectAtIndex:0];
    if (self->_pixelSize.width == (double)(unint64_t)[v7 width]
      && self->_pixelSize.height == (double)(unint64_t)[v7 height])
    {
      objc_sync_exit(v4);
      goto LABEL_12;
    }
  }
  objc_sync_exit(v4);

  int v8 = [(PKPaintAreaViewSurface *)self paintAreaView];
  uint64_t v4 = [v8 delegate];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(PKPaintAreaViewSurface *)self paintAreaView];
    uint64_t v10 = [(PKPaintAreaViewSurface *)self surface];
    uint64_t v11 = [(NSMutableArray *)v4 paintAreaView:v9 newTextureForSurface:v10];
  }
  else
  {
    uint64_t v12 = [(PKPaintAreaViewSurface *)self drawingController];
    uint64_t v13 = (void *)v12;
    if (v12) {
      BOOL v14 = *(void **)(v12 + 64);
    }
    else {
      BOOL v14 = 0;
    }
    id v15 = v14;
    uint64_t v9 = -[PKMetalRendererController device](v15);

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, (unint64_t)width, (unint64_t)height, -[PKPaintAreaViewSurface isMipmapped](self, "isMipmapped"));
    [v10 setTextureType:2];
    [v10 setSampleCount:1];
    [v10 setUsage:5];
    [v10 setStorageMode:2];
    uint64_t v11 = [v9 newTextureWithDescriptor:v10];
  }
  uint64_t v7 = (void *)v11;

LABEL_12:

  return v7;
}

- (void)metalRendererController:(id)a3 didCommitRenderingIntoTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PKPaintAreaViewSurface *)self dispatchQueue];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPaintAreaViewSurface_metalRendererController_didCommitRenderingIntoTexture___block_invoke;
  block[3] = &unk_1E64C53E0;
  id v15 = v7;
  uint64_t v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __80__PKPaintAreaViewSurface_metalRendererController_didCommitRenderingIntoTexture___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) mipmapLevelCount] >= 2
    && [*(id *)(a1 + 40) isMipmapped])
  {
    id v2 = -[PKMetalRendererController commandQueue](*(void **)(a1 + 48));
    id v8 = [v2 commandBuffer];

    BOOL v3 = [v8 blitCommandEncoder];
    [v3 generateMipmapsForTexture:*(void *)(a1 + 32)];
    [v3 endEncoding];
    [v8 commit];
    [v8 waitUntilScheduled];
  }
  uint64_t v4 = [*(id *)(a1 + 40) surface];
  id v9 = [v4 paintSurfaceTexture];

  id v5 = *(id *)(*(void *)(a1 + 40) + 16);
  objc_sync_enter(v5);
  if ((unint64_t)[*(id *)(*(void *)(a1 + 40) + 16) count] <= 3
    && *(double *)(*(void *)(a1 + 40) + 24) == (double)(unint64_t)[v9 width]
    && *(double *)(*(void *)(a1 + 40) + 32) == (double)(unint64_t)[v9 height]
    && [v9 pixelFormat] == 80)
  {
    [*(id *)(*(void *)(a1 + 40) + 16) addObject:v9];
  }
  objc_sync_exit(v5);

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) surface];
  [v7 setPaintSurfaceTexture:v6];
}

- (void)drawingChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaintAreaViewSurface *)self surface];
  uint64_t v6 = [(PKPaintAreaViewSurface *)self paintAreaView];
  id v7 = [v6 delegate];

  if (v5)
  {
    id v8 = [(PKPaintAreaViewSurface *)self dispatchQueue];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v10 = MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PKPaintAreaViewSurface_drawingChanged___block_invoke;
    long long v12[3] = &unk_1E64C6668;
    id v13 = v5;
    id v14 = v4;
    id v15 = v7;
    uint64_t v16 = self;
    dispatch_async(v10, v12);
  }
}

void __41__PKPaintAreaViewSurface_drawingChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) paintSurfaceDrawing];
  BOOL v3 = [v2 uuid];
  id v4 = [*(id *)(a1 + 40) uuid];
  int v5 = [v3 isEqual:v4];

  if (v5) {
    [v2 mergeWithDrawing:*(void *)(a1 + 40)];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 56) paintAreaView];
    id v8 = (id)[v6 paintAreaView:v7 didUpdateDrawingForSurface:*(void *)(a1 + 32)];
  }
  id v9 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v2;
    _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "Drawing changed %@", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)setIsDrawing:(BOOL)a3
{
  self->_isDrawing = a3;
}

- (BOOL)waitingForStrokeToEnd
{
  return self->_waitingForStrokeToEnd;
}

- (BOOL)isErasingObjects
{
  return self->_isErasingObjects;
}

- (NSMutableArray)strokesToErase
{
  return self->_strokesToErase;
}

- (NSMutableSet)strokeIDsToErase
{
  return self->_strokeIDsToErase;
}

- (PKController)drawingController
{
  return self->_drawingController;
}

- (PKPaintAreaView)paintAreaView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paintAreaView);

  return (PKPaintAreaView *)WeakRetained;
}

- (void)setPaintAreaView:(id)a3
{
}

- (PKPaintSurface)surface
{
  return self->_surface;
}

- (CGSize)drawingSize
{
  double width = self->_drawingSize.width;
  double height = self->_drawingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)textureScale
{
  return self->_textureScale;
}

- (CGAffineTransform)strokeTransform
{
  long long v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[4].b;
  return self;
}

- (BOOL)isMipmapped
{
  return self->_isMipmapped;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (PKDrawingUUID)drawingUUID
{
  return self->_drawingUUID;
}

- (CGPoint)previousPoint
{
  double x = self->_previousPoint.x;
  double y = self->_previousPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousPoint:(CGPoint)a3
{
  self->_previousPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingUUID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_surface, 0);
  objc_destroyWeak((id *)&self->_paintAreaView);
  objc_storeStrong((id *)&self->_strokeIDsToErase, 0);
  objc_storeStrong((id *)&self->_strokesToErase, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_textureSet, 0);

  objc_storeStrong((id *)&self->_drawingController, 0);
}

@end
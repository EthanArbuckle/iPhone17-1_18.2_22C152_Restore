@interface CAMLiquidShutterRenderer
- ($01BB1521EC52D44A8E7628F5261DCEC8)shadowColor;
- ($E2C29196C7A5C696474C6955C5A9CE06)_fragmentForShape:(id *)a3 scale:(double)a4;
- ($ED9ACE23B2ABDDA4A8E6119A50F2AC7F)centerShape;
- ($ED9ACE23B2ABDDA4A8E6119A50F2AC7F)dragHandleShape;
- (BOOL)_backgrounded;
- (BOOL)showDragHandle;
- (CAMLiquidShutterRenderer)initWithDevice:(id)a3 commandQueue:(id)a4 pixelFormat:(unint64_t)a5;
- (CAMetalLayer)metalLayer;
- (MTLCommandQueue)_commandQueue;
- (MTLDevice)_device;
- (MTLRenderPipelineState)_renderPipelineState;
- (double)blurRadius;
- (double)shadowSize;
- (float)_orthographicMatrixWithLeft:(float)a1 right:(float)a2 bottom:top:near:far:;
- (unint64_t)_lastRenderedID;
- (unint64_t)_neededRenderID;
- (void)_applicationDidEnterBackground;
- (void)_applicationWillEnterForeground;
- (void)_setBackgrounded:(BOOL)a3;
- (void)dealloc;
- (void)markNeedsRender;
- (void)renderIfNecessary;
- (void)setBlurRadius:(double)a3;
- (void)setCenterShape:(id *)a3;
- (void)setDragHandleShape:(id *)a3;
- (void)setMetalLayer:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowSize:(double)a3;
- (void)setShowDragHandle:(BOOL)a3;
- (void)set_lastRenderedID:(unint64_t)a3;
- (void)set_neededRenderID:(unint64_t)a3;
@end

@implementation CAMLiquidShutterRenderer

- (CAMLiquidShutterRenderer)initWithDevice:(id)a3 commandQueue:(id)a4 pixelFormat:(unint64_t)a5
{
  v81[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v80.receiver = self;
  v80.super_class = (Class)CAMLiquidShutterRenderer;
  v11 = [(CAMLiquidShutterRenderer *)&v80 init];
  if (v11)
  {
    v12 = CAMCameraUIFrameworkBundle();
    v13 = objc_opt_new();
    v14 = [v12 URLForResource:@"ShutterLiquid" withExtension:@"metallib"];
    [v13 setUrl:v14];

    id v79 = 0;
    uint64_t v15 = [v9 newBinaryArchiveWithDescriptor:v13 error:&v79];
    id v72 = v79;
    v74 = (void *)v15;
    if (!v15)
    {
      v16 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't load pre-compiled metal library file: ShutterLiquid.metallib", buf, 2u);
      }
    }
    id v77 = 0;
    v73 = v12;
    v17 = (void *)[v9 newDefaultLibraryWithBundle:v12 error:&v77];
    id v18 = v77;
    v19 = v18;
    if (!v17)
    {
      v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:]((uint64_t)v19, v20, v45, v46, v47, v48, v49, v50);
      }
      v44 = 0;
      v51 = v72;
      goto LABEL_18;
    }
    id v70 = v18;
    id v71 = v10;
    v20 = objc_alloc_init(MEMORY[0x263F129C0]);
    v21 = [v20 colorAttachments];
    v22 = [v21 objectAtIndexedSubscript:0];
    [v22 setPixelFormat:a5];

    v23 = [v20 colorAttachments];
    v24 = [v23 objectAtIndexedSubscript:0];
    [v24 setBlendingEnabled:1];

    v25 = [v20 colorAttachments];
    v26 = [v25 objectAtIndexedSubscript:0];
    [v26 setRgbBlendOperation:0];

    v27 = [v20 colorAttachments];
    v28 = [v27 objectAtIndexedSubscript:0];
    [v28 setAlphaBlendOperation:0];

    v29 = [v20 colorAttachments];
    v30 = [v29 objectAtIndexedSubscript:0];
    [v30 setSourceRGBBlendFactor:4];

    v31 = [v20 colorAttachments];
    v32 = [v31 objectAtIndexedSubscript:0];
    [v32 setSourceAlphaBlendFactor:4];

    v33 = [v20 colorAttachments];
    v34 = [v33 objectAtIndexedSubscript:0];
    [v34 setDestinationRGBBlendFactor:5];

    v35 = [v20 colorAttachments];
    v36 = [v35 objectAtIndexedSubscript:0];
    [v36 setDestinationAlphaBlendFactor:5];

    v37 = (void *)[v17 newFunctionWithName:@"ShutterLiquidVertex"];
    [v20 setVertexFunction:v37];

    v38 = (void *)[v17 newFunctionWithName:@"ShutterLiquidFragment"];
    [v20 setFragmentFunction:v38];

    v81[0] = v74;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:1];
    [v20 setBinaryArchives:v39];

    id v76 = 0;
    v40 = (MTLRenderPipelineState *)[v9 newRenderPipelineStateWithDescriptor:v20 options:4 reflection:0 error:&v76];
    id v41 = v76;
    v42 = v41;
    if (v40)
    {
      id v43 = v41;
    }
    else
    {
      v52 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:]((uint64_t)v42, v52, v53, v54, v55, v56, v57, v58);
      }

      [v20 setBinaryArchives:MEMORY[0x263EFFA68]];
      id v75 = v42;
      v40 = (MTLRenderPipelineState *)[v9 newRenderPipelineStateWithDescriptor:v20 error:&v75];
      id v43 = v75;

      if (!v40)
      {
        v60 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:]((uint64_t)v43, v60, v64, v65, v66, v67, v68, v69);
        }
        v44 = 0;
        goto LABEL_17;
      }
    }
    objc_storeStrong((id *)&v11->__device, a3);
    objc_storeStrong((id *)&v11->__commandQueue, a4);
    renderPipelineState = v11->__renderPipelineState;
    v11->__renderPipelineState = v40;
    v60 = v40;

    v11->_showDragHandle = 1;
    *(_OWORD *)&v11->_blurRadius = xmmword_209C7BBC0;
    v11->_shadowColor.r = 0.0;
    v11->_shadowColor.g = 0.0;
    v11->_shadowColor.b = 0.0;
    v11->_shadowColor.a = 0.2;
    v61 = [MEMORY[0x263F08A00] defaultCenter];
    [v61 addObserver:v11 selector:sel__applicationWillEnterForeground name:*MEMORY[0x263F833B8] object:0];

    v62 = [MEMORY[0x263F08A00] defaultCenter];
    [v62 addObserver:v11 selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F83330] object:0];

    v44 = v11;
LABEL_17:
    v51 = v72;
    v19 = v70;

    id v10 = v71;
LABEL_18:

    goto LABEL_19;
  }
  v44 = 0;
LABEL_19:

  return v44;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CAMLiquidShutterRenderer;
  [(CAMLiquidShutterRenderer *)&v4 dealloc];
}

- (void)setCenterShape:(id *)a3
{
  BOOL v5 = self->_centerShape.position.x == a3->var0.x
    && self->_centerShape.position.y == a3->var0.y
    && self->_centerShape.size == a3->var1
    && self->_centerShape.power == a3->var3;
  if (!v5
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_centerShape.color.r, *(float64x2_t *)&a3->var2.var0), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_centerShape.color.b, *(float64x2_t *)&a3->var2.var2))), 0xFuLL))) & 1) == 0)
  {
    CGPoint var0 = a3->var0;
    long long v7 = *(_OWORD *)&a3->var1;
    long long v8 = *(_OWORD *)&a3->var2.var3;
    *(_OWORD *)&self->_centerShape.color.g = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)&self->_centerShape.color.a = v8;
    self->_centerShape.position = var0;
    *(_OWORD *)&self->_centerShape.size = v7;
    [(CAMLiquidShutterRenderer *)self markNeedsRender];
  }
}

- (void)setDragHandleShape:(id *)a3
{
  BOOL v5 = self->_dragHandleShape.position.x == a3->var0.x
    && self->_dragHandleShape.position.y == a3->var0.y
    && self->_dragHandleShape.size == a3->var1
    && self->_dragHandleShape.power == a3->var3;
  if (!v5
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dragHandleShape.color.r, *(float64x2_t *)&a3->var2.var0), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dragHandleShape.color.b, *(float64x2_t *)&a3->var2.var2))), 0xFuLL))) & 1) == 0)
  {
    CGPoint var0 = a3->var0;
    long long v7 = *(_OWORD *)&a3->var1;
    long long v8 = *(_OWORD *)&a3->var2.var3;
    *(_OWORD *)&self->_dragHandleShape.color.g = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)&self->_dragHandleShape.color.a = v8;
    self->_dragHandleShape.position = var0;
    *(_OWORD *)&self->_dragHandleShape.size = v7;
    [(CAMLiquidShutterRenderer *)self markNeedsRender];
  }
}

- (void)setShowDragHandle:(BOOL)a3
{
  if ([(CAMLiquidShutterRenderer *)self showDragHandle] != a3)
  {
    self->_showDragHandle = a3;
    [(CAMLiquidShutterRenderer *)self markNeedsRender];
  }
}

- (void)setBlurRadius:(double)a3
{
  if (self->_blurRadius != a3)
  {
    self->_blurRadius = a3;
    [(CAMLiquidShutterRenderer *)self markNeedsRender];
  }
}

- (void)setShadowSize:(double)a3
{
  if (self->_shadowSize != a3)
  {
    self->_shadowSize = a3;
    [(CAMLiquidShutterRenderer *)self markNeedsRender];
  }
}

- (void)setShadowColor:(id)a3
{
  if (self->_shadowColor.r != a3.var0
    || self->_shadowColor.g != a3.var1
    || self->_shadowColor.b != a3.var2
    || self->_shadowColor.a != a3.var3)
  {
    self->_shadowColor = ($59EB6295AEC70A1E4031341B6A0DE1A8)a3;
    [(CAMLiquidShutterRenderer *)self markNeedsRender];
  }
}

- (void)markNeedsRender
{
  unint64_t v3 = [(CAMLiquidShutterRenderer *)self _neededRenderID] + 1;
  [(CAMLiquidShutterRenderer *)self set_neededRenderID:v3];
}

- (void)_applicationWillEnterForeground
{
  [(CAMLiquidShutterRenderer *)self _setBackgrounded:0];
  [(CAMLiquidShutterRenderer *)self renderIfNecessary];
}

- (void)_applicationDidEnterBackground
{
}

- (void)renderIfNecessary
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(CAMLiquidShutterRenderer *)self _neededRenderID];
  unint64_t v4 = [(CAMLiquidShutterRenderer *)self _lastRenderedID];
  BOOL v5 = [(CAMLiquidShutterRenderer *)self metalLayer];
  if (v5 && v3 > v4)
  {
    v51 = v5;
    BOOL v6 = [(CAMLiquidShutterRenderer *)self _backgrounded];

    if (!v6)
    {
      long long v7 = [(CAMLiquidShutterRenderer *)self metalLayer];
      [v7 drawableSize];
      double v9 = v8;
      double v11 = v10;

      v12 = [(CAMLiquidShutterRenderer *)self metalLayer];
      [v12 contentsScale];
      double v14 = v13;

      long long v70 = 0u;
      long long v71 = 0u;
      long long v69 = 0u;
      [(CAMLiquidShutterRenderer *)self centerShape];
      [(CAMLiquidShutterRenderer *)self _fragmentForShape:v68 scale:v14];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v65 = 0u;
      [(CAMLiquidShutterRenderer *)self dragHandleShape];
      [(CAMLiquidShutterRenderer *)self _fragmentForShape:v64 scale:v14];
      *(float *)&double v15 = v9;
      *(float *)&double v16 = v11;
      LODWORD(v17) = 1120403456;
      [(CAMLiquidShutterRenderer *)self _orthographicMatrixWithLeft:0.0 right:v15 bottom:v16 top:0.0 near:0.0 far:v17];
      long long v18 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      v63[0] = *MEMORY[0x263EF89A8];
      v63[1] = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
      v63[2] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
      v63[3] = v19;
      v63[4] = v20;
      v63[5] = v21;
      v63[6] = v22;
      v63[7] = v23;
      uint64_t v72 = v69;
      float v73 = *((float *)&v69 + 2) + (float)(*((float *)&v71 + 1) * 2.0);
      uint64_t v74 = v65;
      float v75 = *((float *)&v65 + 2) + (float)(*((float *)&v67 + 1) * 2.0);
      v57[0] = v69;
      v57[1] = v70;
      int v60 = 0;
      v57[2] = v71;
      v57[3] = v65;
      v57[4] = v66;
      v57[5] = v67;
      int v58 = [(CAMLiquidShutterRenderer *)self showDragHandle];
      int v59 = 1056964608;
      [(CAMLiquidShutterRenderer *)self shadowSize];
      *(float *)&double v24 = v24;
      int v61 = LODWORD(v24);
      [(CAMLiquidShutterRenderer *)self shadowColor];
      float64_t v52 = v25;
      [(CAMLiquidShutterRenderer *)self shadowColor];
      v26.f64[0] = v52;
      v26.f64[1] = v27;
      int32x2_t v53 = (int32x2_t)vcvt_f32_f64(v26);
      [(CAMLiquidShutterRenderer *)self shadowColor];
      float64_t v50 = v28;
      [(CAMLiquidShutterRenderer *)self shadowColor];
      v29.f64[0] = v50;
      v29.f64[1] = v30;
      float32x4_t v62 = vcvt_hight_f32_f64(v53, v29);
      v31 = [(CAMLiquidShutterRenderer *)self metalLayer];
      v32 = [v31 nextDrawable];

      id v33 = objc_alloc_init(MEMORY[0x263F129A0]);
      v34 = [v33 colorAttachments];
      v35 = [v34 objectAtIndexedSubscript:0];
      objc_msgSend(v35, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

      v36 = [v33 colorAttachments];
      v37 = [v36 objectAtIndexedSubscript:0];
      [v37 setLoadAction:2];

      v38 = [v33 colorAttachments];
      v39 = [v38 objectAtIndexedSubscript:0];
      [v39 setStoreAction:1];

      v40 = [v32 texture];
      id v41 = [v33 colorAttachments];
      v42 = [v41 objectAtIndexedSubscript:0];
      [v42 setTexture:v40];

      id v43 = [(CAMLiquidShutterRenderer *)self _commandQueue];
      v44 = [v43 commandBuffer];

      uint64_t v45 = [v44 renderCommandEncoderWithDescriptor:v33];
      uint64_t v46 = [(CAMLiquidShutterRenderer *)self _renderPipelineState];
      [v45 setRenderPipelineState:v46];

      [v45 setVertexBytes:v63 length:128 atIndex:0];
      [v45 setVertexBytes:&v72 length:32 atIndex:1];
      [v45 setFragmentBytes:v57 length:128 atIndex:0];
      [v45 drawPrimitives:0 vertexStart:0 vertexCount:2];
      [v45 endEncoding];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke;
      v55[3] = &unk_263FA6358;
      id v56 = v32;
      id v47 = v32;
      [v44 addScheduledHandler:v55];
      unint64_t v48 = [(CAMLiquidShutterRenderer *)self _neededRenderID];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2;
      v54[3] = &unk_263FA6380;
      *(CFAbsoluteTime *)&v54[5] = Current;
      v54[4] = self;
      v54[6] = v48;
      [v44 addCompletedHandler:v54];
      [v44 commit];
    }
  }
  else
  {
  }
}

uint64_t __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) present];
}

void __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = 0;
  switch([v3 status])
  {
    case 0:
      unint64_t v4 = @"NotEnqueued";
      break;
    case 1:
      unint64_t v4 = @"Enqueued";
      break;
    case 2:
      unint64_t v4 = @"Committed";
      break;
    case 3:
      unint64_t v4 = @"Scheduled";
      break;
    case 5:
      BOOL v5 = NSString;
      BOOL v6 = [v3 error];
      long long v7 = [v6 description];
      unint64_t v4 = [v5 stringWithFormat:@"Error: %@", v7];

      break;
    default:
      break;
  }
  double v8 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  if (v4)
  {
    double v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2_cold_1((uint64_t)v4, v9, v8);
    }
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_37;
    v11[3] = &unk_263FA04E0;
    uint64_t v10 = *(void *)(a1 + 48);
    v11[4] = *(void *)(a1 + 32);
    v11[5] = v10;
    cam_perform_on_main_asap(v11);
    if (v8 <= 0.25) {
      goto LABEL_11;
    }
    double v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = v8;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Dynamic shutter render took %.4f seconds", buf, 0xCu);
    }
  }

LABEL_11:
}

unint64_t __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_37(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) _lastRenderedID];
  if (result < *(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "set_lastRenderedID:");
  }
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)_fragmentForShape:(id *)a3 scale:(double)a4
{
  uint64_t v5 = v4;
  float32x4_t v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var2.var0), *(float64x2_t *)&a3->var2.var2);
  float32x2_t v7 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)a3->var0, a4));
  *(_OWORD *)uint64_t v4 = 0u;
  *(float32x2_t *)uint64_t v4 = v7;
  float v8 = a3->var1 * a4;
  *(float *)(v4 + 8) = v8;
  *(float32x4_t *)(v4 + 16) = v6;
  *(_OWORD *)(v4 + 32) = 0u;
  float var3 = a3->var3;
  *(float *)(v4 + 32) = var3;
  [(CAMLiquidShutterRenderer *)self blurRadius];
  float v11 = *(float *)&a4;
  float v13 = v12 * a4;
  *(float *)(v5 + 36) = v13;
  result.var2 = v10;
  result.var1 = v11;
  result.CGPoint var0 = v13;
  return result;
}

- (float)_orthographicMatrixWithLeft:(float)a1 right:(float)a2 bottom:top:near:far:
{
  __asm { FMOV            V3.4S, #1.0 }
  return 2.0 / (float)(a2 - a1);
}

- ($ED9ACE23B2ABDDA4A8E6119A50F2AC7F)centerShape
{
  CGPoint var0 = self[2].var0;
  retstr->CGPoint var0 = *(CGPoint *)&self[1].var2.var3;
  *(CGPoint *)&retstr->var1 = var0;
  long long v4 = *(_OWORD *)&self[2].var2.var1;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2.float var3 = v4;
  return self;
}

- ($ED9ACE23B2ABDDA4A8E6119A50F2AC7F)dragHandleShape
{
  CGPoint var0 = self[3].var0;
  retstr->CGPoint var0 = *(CGPoint *)&self[2].var2.var3;
  *(CGPoint *)&retstr->var1 = var0;
  long long v4 = *(_OWORD *)&self[3].var2.var1;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var2.float var3 = v4;
  return self;
}

- (BOOL)showDragHandle
{
  return self->_showDragHandle;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)shadowSize
{
  return self->_shadowSize;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)shadowColor
{
  double r = self->_shadowColor.r;
  double g = self->_shadowColor.g;
  double b = self->_shadowColor.b;
  double a = self->_shadowColor.a;
  result.float var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.CGPoint var0 = r;
  return result;
}

- (CAMetalLayer)metalLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  return (CAMetalLayer *)WeakRetained;
}

- (void)setMetalLayer:(id)a3
{
}

- (MTLDevice)_device
{
  return self->__device;
}

- (MTLCommandQueue)_commandQueue
{
  return self->__commandQueue;
}

- (MTLRenderPipelineState)_renderPipelineState
{
  return self->__renderPipelineState;
}

- (BOOL)_backgrounded
{
  return self->__backgrounded;
}

- (void)_setBackgrounded:(BOOL)a3
{
  self->__backgrounded = a3;
}

- (unint64_t)_neededRenderID
{
  return self->__neededRenderID;
}

- (void)set_neededRenderID:(unint64_t)a3
{
  self->__neededRenderID = a3;
}

- (unint64_t)_lastRenderedID
{
  return self->__lastRenderedID;
}

- (void)set_lastRenderedID:(unint64_t)a3
{
  self->__lastRenderedID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__renderPipelineState, 0);
  objc_storeStrong((id *)&self->__commandQueue, 0);
  objc_storeStrong((id *)&self->__device, 0);
  objc_destroyWeak((id *)&self->_metalLayer);
}

- (void)initWithDevice:(uint64_t)a3 commandQueue:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDevice:(uint64_t)a3 commandQueue:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDevice:(uint64_t)a3 commandQueue:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Dynamic shutter render did not complete successfully. Time: %.4f Command buffer status: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
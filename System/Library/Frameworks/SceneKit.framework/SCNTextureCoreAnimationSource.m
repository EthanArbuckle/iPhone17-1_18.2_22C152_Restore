@interface SCNTextureCoreAnimationSource
- (BOOL)prefersGL3;
- (BOOL)requiresMainThreadUpdates;
- (BOOL)supportsMetal;
- (CALayer)layer;
- (CGSize)layerSizeInPixels;
- (__C3DTexture)_textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (double)__renderLayer:(id)a3 withCARenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:(BOOL)a7 forceUpdate:(BOOL *)a8 didUpdate:;
- (double)__renderLayerUsingMetal:(id)a3 withCARenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:(BOOL)a7 forceUpdate:(BOOL *)a8 didUpdate:;
- (double)__updateTextureWithLayer:(id)a3 texture:(id)a4 engineContext:(__C3DEngineContext *)a5 sampler:(__C3DTextureSampler *)a6;
- (double)layerContentsScaleFactor;
- (float)clearValue;
- (id)layerToFocusForRenderedLayer:(id)a3;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7;
- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7 isMainThread:(BOOL)a8;
- (void)cleanup:(__C3DRendererContext *)a3;
- (void)dealloc;
- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)setLayer:(id)a3;
@end

@implementation SCNTextureCoreAnimationSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureCoreAnimationSource;
  [(SCNTextureSource *)&v3 dealloc];
}

- (BOOL)supportsMetal
{
  return 1;
}

- (BOOL)prefersGL3
{
  return 1;
}

- (void)setLayer:(id)a3
{
  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  if (C3DEngineContextGetRenderContext((uint64_t)a3))
  {
    id v11 = [(SCNTextureCoreAnimationSource *)self metalTextureWithEngineContext:a3 textureSampler:a4 nextFrameTime:a5 status:a6];
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    -[SCNMTLRenderContext _drawFullScreenTexture:over:](RenderContext, v11, 0);
  }
  else
  {
    v13 = objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a3, self->_layer, self, 0);
    objc_msgSend((id)objc_msgSend(v13, "layer"), "beginTime");
    double v15 = CACurrentMediaTime() - v14;
    *(void *)&double v16 = C3DEngineContextGetViewport((__n128 *)a3).n128_u64[0];
    layer = self->_layer;
    [(SCNTextureCoreAnimationSource *)self __renderLayer:layer withCARenderer:v13 engineContext:a3 viewport:1 atTime:0 forceUpdate:v16 didUpdate:v15];
  }
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return a3;
}

- (float)clearValue
{
  return 0.0;
}

- (BOOL)requiresMainThreadUpdates
{
  return 0;
}

- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7 isMainThread:(BOOL)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  [MEMORY[0x263F158F8] begin];
  if (!a8) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  [MEMORY[0x263F158F8] setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F15FC8]];
  if (v11) {
    [a7 setLayer:a3];
  }
  if (v10)
  {
    id v16 = [(SCNTextureCoreAnimationSource *)self layerToFocusForRenderedLayer:a3];
    if (v16 != a3)
    {
      objc_msgSend(a3, "setAnchorPoint:", 0.0, 0.0);
      objc_msgSend(v16, "setAnchorPoint:", 0.0, 0.0);
      objc_msgSend(a3, "setPosition:", 0.0, 0.0);
      objc_msgSend(v16, "setPosition:", 0.0, 0.0);
    }
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    [v16 contentsScale];
    double v22 = v21 * v18;
    double v23 = v21 * v20;
    if (v21 * v18 != 0.0 || v23 != 0.0)
    {
      double v24 = width / v22;
      double v25 = height / v23;
      BOOL v26 = [(SCNTextureSource *)self shouldFlip];
      if (v26)
      {
        if (v16 == a3)
        {
          [a3 anchorPoint];
          CGFloat v29 = v22 * ((v24 + -1.0) * v28);
          [a3 anchorPoint];
          CATransform3DMakeTranslation(&v42, v29, v23 * ((v25 + -1.0) * v30), 0.0);
          CATransform3D v41 = v42;
          v27 = &v41;
        }
        else
        {
          CATransform3DMakeTranslation(&v44, 0.0, height, 0.0);
          CATransform3D v43 = v44;
          v27 = &v43;
        }
      }
      else
      {
        CATransform3DMakeTranslation(&v40, 0.0, 0.0, 0.0);
        CATransform3D v39 = v40;
        v27 = &v39;
      }
      [a3 setTransform:v27];
      CATransform3DMakeScale(&a, v24, v25, 1.0);
      if (a3) {
        [a3 transform];
      }
      else {
        memset(&b, 0, sizeof(b));
      }
      CATransform3DConcat(&v38, &a, &b);
      CATransform3D v35 = v38;
      [a3 setTransform:&v35];
      if (v26)
      {
        CATransform3DMakeScale(&v33, 1.0, -1.0, 1.0);
        if (a3) {
          [a3 transform];
        }
        else {
          memset(&v32, 0, sizeof(v32));
        }
        CATransform3DConcat(&v34, &v33, &v32);
        CATransform3D v31 = v34;
        [a3 setTransform:&v31];
      }
    }
  }
  [MEMORY[0x263F158F8] commit];
}

- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  int v14 = pthread_main_np();
  if (v14 || ![(SCNTextureCoreAnimationSource *)self requiresMainThreadUpdates])
  {
    -[SCNTextureCoreAnimationSource _resizeLayer:toSize:updateLayer:updateTransform:caRenderer:isMainThread:](self, "_resizeLayer:toSize:updateLayer:updateTransform:caRenderer:isMainThread:", a3, v9, v8, a7, v14 != 0, width, height);
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__SCNTextureCoreAnimationSource__resizeLayer_toSize_updateLayer_updateTransform_caRenderer___block_invoke;
    v15[3] = &unk_264004F98;
    v15[4] = self;
    v15[5] = a3;
    *(double *)&v15[7] = width;
    *(double *)&v15[8] = height;
    BOOL v16 = v9;
    BOOL v17 = v8;
    v15[6] = a7;
    dispatch_async(MEMORY[0x263EF83A0], v15);
  }
}

uint64_t __92__SCNTextureCoreAnimationSource__resizeLayer_toSize_updateLayer_updateTransform_caRenderer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resizeLayer:toSize:updateLayer:updateTransform:caRenderer:isMainThread:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(void *)(a1 + 48), 1, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)__renderLayerUsingMetal:(id)a3 withCARenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:(BOOL)a7 forceUpdate:(BOOL *)a8 didUpdate:
{
  double v11 = v8;
  float64x2_t rect2 = vcvt_hight_f64_f32(*(float32x4_t *)&a6);
  [a4 bounds];
  v24.size.double width = rect2.f64[0];
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.double height = rect2.f64[1];
  if (!CGRectEqualToRect(v22, v24)) {
    objc_msgSend(a4, "setBounds:", 0.0, 0.0, *(_OWORD *)&rect2);
  }
  id v15 = (id)[a4 layer];
  if (v15 != a3 || a3 && ([a3 transform], v21 > 0.0)) {
    [(SCNTextureCoreAnimationSource *)self _resizeLayer:a3 toSize:v15 != a3 updateLayer:1 updateTransform:a4 caRenderer:*(_OWORD *)&rect2];
  }
  [a4 beginFrameAtTime:0 timeStamp:v11];
  if (a7 || ([a4 updateBounds], !CGRectIsEmpty(v23)))
  {
    if (a8) {
      *a8 = 1;
    }
    objc_msgSend(a4, "addUpdateRect:", 0.0, 0.0, *(_OWORD *)&rect2);
    [a4 render];
    [a4 nextFrameTime];
    double v17 = v18;
    [a4 endFrame];
  }
  else
  {
    [a4 nextFrameTime];
    double v17 = v16;
    [a4 endFrame];
    if (a8) {
      *a8 = 0;
    }
  }
  return v17;
}

- (double)__renderLayer:(id)a3 withCARenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:(BOOL)a7 forceUpdate:(BOOL *)a8 didUpdate:
{
  double v11 = v8;
  __n128 v27 = *(__n128 *)&a6;
  id v15 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a5];
  [MEMORY[0x263F146E8] setCurrentContext:C3DRendererContextGetGLContext((uint64_t)v15)];
  float64x2_t rect2 = vcvt_hight_f64_f32((float32x4_t)v27);
  *(double *)&long long v16 = C3DRendererContextGetViewport();
  long long v25 = v16;
  C3DRendererContextSetViewport(v27);
  [a4 bounds];
  v42.size.double width = rect2.f64[0];
  v42.origin.x = 0.0;
  v42.origin.y = 0.0;
  v42.size.double height = rect2.f64[1];
  if (!CGRectEqualToRect(v40, v42)) {
    objc_msgSend(a4, "setBounds:", 0.0, 0.0, *(_OWORD *)&rect2, v25);
  }
  id v17 = (id)objc_msgSend(a4, "layer", v25);
  if (v17 == a3)
  {
    if (!a3)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      goto LABEL_5;
    }
    [a3 transform];
    if (*((double *)&v34 + 1) <= 0.0) {
      goto LABEL_5;
    }
  }
  [(SCNTextureCoreAnimationSource *)self _resizeLayer:a3 toSize:v17 != a3 updateLayer:1 updateTransform:a4 caRenderer:*(_OWORD *)&rect2];
LABEL_5:
  [a4 beginFrameAtTime:0 timeStamp:v11];
  if (a7 || ([a4 updateBounds], !CGRectIsEmpty(v41)))
  {
    if (a8) {
      *a8 = 1;
    }
    *(void *)double v30 = 0;
    *(void *)params = 0;
    [(SCNTextureCoreAnimationSource *)self clearValue];
    int32x4_t v29 = vdupq_lane_s32(v20, 0);
    C3DRendererContextClear((uint64_t)v15, 0x4000u, (float32x4_t *)&v29);
    int IsEnabled = glIsEnabled(0xB44u);
    int v22 = glIsEnabled(0xBE2u);
    glDisable(0xBE2u);
    glDisable(0xB44u);
    glGetIntegerv(0x80CBu, &params[1]);
    glGetIntegerv(0x80CAu, params);
    glGetIntegerv(0x80C9u, &v30[1]);
    glGetIntegerv(0x80C8u, v30);
    glBlendFunc(0x302u, 0x303u);
    C3DRendererContextUnbindProgramObject((uint64_t)v15);
    C3DRendererContextUnbindBufferObjects((uint64_t)v15);
    objc_msgSend(a4, "addUpdateRect:", 0.0, 0.0, *(_OWORD *)&rect2);
    [a4 render];
    [a4 nextFrameTime];
    double v19 = v23;
    [a4 endFrame];
    if (IsEnabled) {
      glEnable(0xB44u);
    }
    glBlendFuncSeparate(v30[1], v30[0], params[1], params[0]);
    if (v22) {
      glEnable(0xBE2u);
    }
    C3DRendererContextSetViewport(v26);
  }
  else
  {
    [a4 nextFrameTime];
    double v19 = v18;
    [a4 endFrame];
    if (a8) {
      *a8 = 0;
    }
  }
  return v19;
}

- (double)__updateTextureWithLayer:(id)a3 texture:(id)a4 engineContext:(__C3DEngineContext *)a5 sampler:(__C3DTextureSampler *)a6
{
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)a5);
  if (Scene)
  {
    uint64_t AnimationManager = C3DSceneGetAnimationManager(Scene);
    if (!AnimationManager)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[SCNTextureCoreAnimationSource __updateTextureWithLayer:texture:engineContext:sampler:](v13);
      }
    }
    double SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  }
  else
  {
    double SystemTime = 0.0;
  }
  if (self->super._framebufferSize.width <= 0.0) {
    return INFINITY;
  }
  if (self->_lastUpdate == SystemTime) {
    return INFINITY;
  }
  id v15 = objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a5, a3, self, a4);
  objc_msgSend((id)objc_msgSend(v15, "layer"), "beginTime");
  double v17 = CACurrentMediaTime() - v16;
  double lastUpdate = self->_lastUpdate;
  if (lastUpdate == 0.0) {
    goto LABEL_15;
  }
  if (SystemTime >= self->_nextUpdateDate + -0.0166666667) {
    goto LABEL_15;
  }
  if (SystemTime == lastUpdate) {
    return INFINITY;
  }
  [v15 beginFrameAtTime:0 timeStamp:v17];
  [v15 updateBounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [v15 endFrame];
  v34.origin.x = v20;
  v34.origin.y = v22;
  v34.size.double width = v24;
  v34.size.double height = v26;
  if (CGRectIsEmpty(v34)) {
    return INFINITY;
  }
LABEL_15:
  self->_double lastUpdate = SystemTime;
  if (!a4) {
    [(SCNTextureOffscreenRenderingSource *)self _bindFramebuffer:a5];
  }
  char v33 = 0;
  *(void *)&double v29 = vcvt_hight_f32_f64(0, (float64x2_t)self->super._framebufferSize).u64[0];
  if (a4)
  {
    [(SCNTextureCoreAnimationSource *)self __renderLayerUsingMetal:a3 withCARenderer:v15 engineContext:a5 viewport:1 atTime:&v33 forceUpdate:v29 didUpdate:v17];
    double v27 = v30;
  }
  else
  {
    [(SCNTextureCoreAnimationSource *)self __renderLayer:a3 withCARenderer:v15 engineContext:a5 viewport:1 atTime:&v33 forceUpdate:v29 didUpdate:v17];
    double v27 = v31;
    [(SCNTextureOffscreenRenderingSource *)self _unbindFramebuffer:a5];
  }
  if (v33 && C3DTextureSamplerGetMipFilter((uint64_t)a6)) {
    [(SCNTextureOffscreenRenderingSource *)self _buildMipmaps:a5];
  }
  self->_nextUpdateDate = 3.40282347e38;
  if (v27 != INFINITY && v27 != 3.40282347e38)
  {
    double v32 = CACurrentMediaTime() - v27;
    if (v32 > 0.0) {
      self->_nextUpdateDate = SystemTime + v32;
    }
  }
  return v27;
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureCoreAnimationSource;
  [(SCNTextureOffscreenRenderingSource *)&v3 cleanup:a3];
}

- (CGSize)layerSizeInPixels
{
  v2 = [(SCNTextureCoreAnimationSource *)self layer];
  [(CALayer *)v2 bounds];
  double v4 = v3;
  double v6 = v5;
  [(CALayer *)v2 contentsScale];
  double v8 = v7 * v6;
  double v9 = v7 * v4;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (double)layerContentsScaleFactor
{
  v2 = [(SCNTextureCoreAnimationSource *)self layer];

  [(CALayer *)v2 contentsScale];
  return result;
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  if ([(SCNTextureCoreAnimationSource *)self layer])
  {
    [(SCNTextureCoreAnimationSource *)self layerSizeInPixels];
    double v11 = 0;
    if (v9 > 0.0)
    {
      float64_t v28 = v10;
      float64_t v29 = v9;
      if (v10 > 0.0)
      {
        id v12 = (id)[MEMORY[0x263F146E8] currentContext];
        v13 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a3];
        [MEMORY[0x263F146E8] setCurrentContext:C3DRendererContextGetGLContext((uint64_t)v13)];
        double v11 = [(SCNTextureCoreAnimationSource *)self _textureWithEngineContext:a3 textureSampler:a4 nextFrameTime:a5];
        glFlush();
        if (v12)
        {
          [MEMORY[0x263F146E8] setCurrentContext:v12];
        }
        if (v11)
        {
          uint64_t IOSurface = C3DTextureGetIOSurface((uint64_t)v11);
          if (IOSurface)
          {
            id v15 = (const void *)IOSurface;
            double v11 = [(SCNTextureSource *)self glTextureCache];
            if (!v11)
            {
              v16.f64[0] = v29;
              v16.f64[1] = v28;
              double v17 = COERCE_DOUBLE(vcvt_f32_f64(v16));
              uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)a3);
              double v11 = (__C3DTexture *)C3DCreateTextureFromIOSurface(RendererContextGL, v15, 6408, (uint64_t)a4, v17);
              [(SCNTextureSource *)self setGlTextureCache:v11];
              CFRelease(v11);
            }
          }
        }
      }
    }
  }
  else
  {
    double v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    return 0;
  }
  return v11;
}

- (__C3DTexture)_textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Stats = C3DEngineContextGetStats((uint64_t)a3);
  double v10 = CACurrentMediaTime();
  double v11 = [(SCNTextureCoreAnimationSource *)self layer];
  if (v11)
  {
    id v12 = v11;
    [(SCNTextureCoreAnimationSource *)self layerSizeInPixels];
    int v14 = 0;
    if (v15 > 0.0 && v13 > 0.0)
    {
      int v14 = -[SCNTextureOffscreenRenderingSource __prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:](self, "__prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:", a3, a4, 0);
      [(SCNTextureCoreAnimationSource *)self __updateTextureWithLayer:v12 texture:0 engineContext:a3 sampler:a4];
      *(void *)a5 = v16;
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v10;
  }
  else
  {
    double v17 = scn_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    return 0;
  }
  return v14;
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  if ([(SCNTextureCoreAnimationSource *)self supportsMetal])
  {
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    id v12 = (void *)-[SCNMTLRenderContext device](RenderContext);
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)a3);
    double v14 = CACurrentMediaTime();
    double v15 = [(SCNTextureCoreAnimationSource *)self layer];
    if (v15)
    {
      uint64_t v16 = v15;
      [(SCNTextureCoreAnimationSource *)self layerSizeInPixels];
      double v18 = v17;
      double v20 = v19;
      self->super._framebufferSize.double width = v17;
      self->super._framebufferSize.double height = v19;
      id v21 = [(SCNTextureSource *)self MTLTextureCache];
      if (v21)
      {
        uint64_t v22 = v21;
        BOOL v23 = 0;
      }
      else
      {
        char v33 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:C3DMetalFramebufferPixelFormat(0) width:(unint64_t)v18 height:(unint64_t)v20 mipmapped:0];
        [v33 setStorageMode:2];
        [v33 setUsage:5];
        uint64_t v22 = (void *)[v12 newTextureWithDescriptor:v33];
        [(SCNTextureSource *)self setMTLTextureCache:v22];

        BOOL v23 = 1;
      }
      a6->var0 = v23;
      a6->var1 = 1;
      [(SCNTextureCoreAnimationSource *)self __updateTextureWithLayer:v16 texture:v22 engineContext:a3 sampler:a4];
      *(void *)a5 = v34;
      double v32 = CACurrentMediaTime();
    }
    else
    {
      uint64_t v24 = scn_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
      double v32 = CACurrentMediaTime();
      uint64_t v22 = 0;
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + v32 - v14;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)SCNTextureCoreAnimationSource;
    return [(SCNTextureSource *)&v36 metalTextureWithEngineContext:a3 textureSampler:a4 nextFrameTime:a5 status:a6];
  }
  return v22;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)__updateTextureWithLayer:(os_log_t)log texture:engineContext:sampler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "animationManager";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

- (void)textureWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
@interface SCNTextureSpriteKitSource
- (SKScene)scene;
- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (double)__updateTextureWithSKScene:(id)a3 engineContext:(__C3DEngineContext *)a4 sampler:(__C3DTextureSampler *)a5;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)__renderSKScene:(id)a3 withSKSCNRenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:;
- (void)cleanup:(__C3DRendererContext *)a3;
- (void)dealloc;
- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (void)setScene:(id)a3;
@end

@implementation SCNTextureSpriteKitSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureSpriteKitSource;
  [(SCNTextureSource *)&v3 dealloc];
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)a3);
  uint64_t AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SCNTextureCoreAnimationSource __updateTextureWithLayer:texture:engineContext:sampler:](v9);
    }
  }
  double SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  v11 = objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a3, self->_scene, self, 0);
  __n128 Viewport = C3DEngineContextGetViewport((__n128 *)a3);
  if (objc_opt_respondsToSelector())
  {
    if ([(SKScene *)self->_scene _isDirty]) {
      C3DEngineContextSetNextFrameTimeToAsap((uint64_t)a3);
    }
    else {
      [(SKScene *)self->_scene _notifyNextDirtyState];
    }
  }
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  if (RenderContext)
  {
    uint64_t v13 = RenderContext;
    objc_msgSend(v11, "setBounds:", Viewport.n128_f32[0], Viewport.n128_f32[1], Viewport.n128_f32[2], Viewport.n128_f32[3]);
    if ((SKScene *)[v11 scene] != self->_scene) {
      objc_msgSend(v11, "setScene:");
    }
    -[SCNMTLRenderContext renderSKSceneWithRenderer:overlay:atTime:](v13, v11, 0);
  }
  else
  {
    [(SCNTextureSpriteKitSource *)self __renderSKScene:self->_scene withSKSCNRenderer:v11 engineContext:a3 viewport:Viewport.n128_f64[0] atTime:SystemTime];
  }
}

- (void)__renderSKScene:(id)a3 withSKSCNRenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:
{
  double v7 = v6;
  __n128 v18 = *(__n128 *)&a6;
  v11 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a5];
  __n128 Viewport = C3DEngineContextGetViewport((__n128 *)a5);
  C3DRendererContextSetViewport(v18);
  objc_msgSend(a4, "setBounds:", v18.n128_f32[0], v18.n128_f32[1], v18.n128_f32[2], v18.n128_f32[3]);
  if ((id)[a4 scene] != a3) {
    objc_msgSend(a4, "setScene:", a3, *(_OWORD *)&Viewport);
  }
  objc_msgSend(a4, "updateAtTime:", v7, *(_OWORD *)&Viewport);
  int IsEnabled = glIsEnabled(0xB44u);
  int v13 = glIsEnabled(0xBE2u);
  glDisable(0xBE2u);
  glDisable(0xB44u);
  *(void *)v19 = 0;
  *(void *)params = 0;
  glGetIntegerv(0x80CBu, &params[1]);
  glGetIntegerv(0x80CAu, params);
  glGetIntegerv(0x80C9u, &v19[1]);
  glGetIntegerv(0x80C8u, v19);
  glBlendFunc(0x302u, 0x303u);
  C3DRendererContextUnbindProgramObject((uint64_t)v11);
  C3DRendererContextUnbindBufferObjects((uint64_t)v11);
  uint64_t BoundFramebuffer = C3DRendererContextGetBoundFramebuffer((uint64_t)v11);
  if (BoundFramebuffer) {
    uint64_t FBO = C3DFramebufferGetFBO(BoundFramebuffer);
  }
  else {
    uint64_t FBO = 0;
  }
  [a4 renderToFramebuffer:FBO shouldClear:1];
  if (IsEnabled) {
    glEnable(0xB44u);
  }
  glBlendFuncSeparate(v19[1], v19[0], params[1], params[0]);
  if (v13) {
    glEnable(0xBE2u);
  }
  C3DRendererContextSetViewport(v17);
}

- (double)__updateTextureWithSKScene:(id)a3 engineContext:(__C3DEngineContext *)a4 sampler:(__C3DTextureSampler *)a5
{
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)a4);
  uint64_t AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SCNTextureCoreAnimationSource __updateTextureWithLayer:texture:engineContext:sampler:](v11);
    }
  }
  double SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  if (self->super._framebuffer)
  {
    if (self->_lastUpdate != SystemTime)
    {
      self->_lastUpdate = SystemTime;
      uint64_t v13 = objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a4, a3, self, 0);
      [(SCNTextureOffscreenRenderingSource *)self _bindFramebuffer:a4];
      [(SCNTextureSpriteKitSource *)self __renderSKScene:a3 withSKSCNRenderer:v13 engineContext:a4 viewport:*(double *)vcvt_hight_f32_f64(0, (float64x2_t)self->super._framebufferSize).i64 atTime:SystemTime];
      [(SCNTextureOffscreenRenderingSource *)self _unbindFramebuffer:a4];
      if (C3DTextureSamplerGetMipFilter((uint64_t)a5)) {
        [(SCNTextureOffscreenRenderingSource *)self _buildMipmaps:a4];
      }
    }
  }
  return SystemTime;
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureSpriteKitSource;
  [(SCNTextureOffscreenRenderingSource *)&v3 cleanup:a3];
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Stats = C3DEngineContextGetStats((uint64_t)a3);
  double v10 = CACurrentMediaTime();
  v11 = [(SCNTextureSpriteKitSource *)self scene];
  if (v11)
  {
    v12 = v11;
    [(SKScene *)v11 size];
    v14 = 0;
    if (v15 > 0.0 && v13 > 0.0)
    {
      v14 = -[SCNTextureOffscreenRenderingSource __prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:](self, "__prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:", a3, a4, 1);
      [(SCNTextureSpriteKitSource *)self __updateTextureWithSKScene:v12 engineContext:a3 sampler:a4];
      *(void *)a5 = v16;
    }
    double v17 = CACurrentMediaTime();
  }
  else
  {
    __n128 v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SCNTextureSpriteKitSource textureWithEngineContext:textureSampler:nextFrameTime:](v18);
    }
    double v17 = CACurrentMediaTime();
    v14 = 0;
  }
  *(double *)(Stats + 160) = *(double *)(Stats + 160) + v17 - v10;
  return v14;
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  v11 = (void *)-[SCNMTLRenderContext device](RenderContext);
  uint64_t Stats = C3DEngineContextGetStats((uint64_t)a3);
  double v13 = [(SCNTextureSpriteKitSource *)self scene];
  if (v13)
  {
    v14 = v13;
    double v15 = CACurrentMediaTime();
    [(SKScene *)v14 size];
    double v17 = v16;
    double v19 = v18;
    id v20 = [(SCNTextureSource *)self MTLTextureCache];
    if (!v20)
    {
      v21 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:C3DMetalFramebufferPixelFormat(0) width:(unint64_t)v17 height:(unint64_t)v19 mipmapped:0];
      [v21 setStorageMode:2];
      [v21 setUsage:21];
      id v20 = (id)[v11 newTextureWithDescriptor:v21];
      [(SCNTextureSource *)self setMTLTextureCache:v20];
    }
    uint64_t Scene = C3DEngineContextGetScene((uint64_t)a3);
    uint64_t AnimationManager = C3DSceneGetAnimationManager(Scene);
    double SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
    if (!v20 || (double v25 = SystemTime, self->_lastUpdate == SystemTime))
    {
      BOOL v28 = 0;
LABEL_22:
      a6->var0 = v28;
      a6->var1 = 1;
      *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v15;
      return v20;
    }
    self->_lastUpdate = SystemTime;
    v26 = objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a3, v14, self, 0);
    if (objc_opt_respondsToSelector()) {
      int v27 = [(SKScene *)v14 _isDirty] ^ 1;
    }
    else {
      int v27 = 0;
    }
    objc_msgSend(v26, "setBounds:", 0.0, 0.0, v17, v19);
    if ((SKScene *)[v26 scene] != v14)
    {
      v30 = scn_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_20B249000, v30, OS_LOG_TYPE_DEFAULT, "Warning: SCNTextureSource unexpected SKScene", v33, 2u);
      }
    }
    [v26 updateAtTime:v25];
    if (C3DLinearRenderingIsEnabled())
    {
      v31 = objc_msgSend(v20, "newTextureViewWithPixelFormat:", SCNMTLPixelFormatNonSRGBVariant(objc_msgSend(v20, "pixelFormat")));
      [v26 renderToTexture:v31 commandQueue:-[SCNMTLRenderContext commandQueue](RenderContext)];

      if (!v27)
      {
LABEL_18:
        *a5 = v25;
LABEL_21:
        BOOL v28 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      [v26 renderToTexture:v20 commandQueue:-[SCNMTLRenderContext commandQueue](RenderContext)];
      if (!v27) {
        goto LABEL_18;
      }
    }
    [(SKScene *)v14 _notifyNextDirtyState];
    goto LABEL_21;
  }
  v29 = scn_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[SCNTextureSpriteKitSource textureWithEngineContext:textureSampler:nextFrameTime:](v29);
  }
  return 0;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (void)textureWithEngineContext:(os_log_t)log textureSampler:nextFrameTime:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: SCNTextureSpriteKitSource::textureProxy -> no scene", v1, 2u);
}

@end
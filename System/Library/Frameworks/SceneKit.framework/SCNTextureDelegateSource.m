@interface SCNTextureDelegateSource
- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (id)delegate;
- (void)__updateTextureWithDelegate:(id)a3 engineContext:(__C3DEngineContext *)a4;
- (void)cleanup:(__C3DRendererContext *)a3;
- (void)dealloc;
- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SCNTextureDelegateSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureDelegateSource;
  [(SCNTextureSource *)&v3 dealloc];
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  v7 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3, a4, a5);
  if (v7) {
    uint64_t GLContext = C3DRendererContextGetGLContext((uint64_t)v7);
  }
  else {
    uint64_t GLContext = 0;
  }
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)a3);
  uint64_t AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      C3DAnimationManagerSetSystemTime_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  [self->_delegate drawInContext:GLContext atTime:C3DAnimationManagerGetSystemTime(AnimationManager)];
}

- (void)__updateTextureWithDelegate:(id)a3 engineContext:(__C3DEngineContext *)a4
{
  v6 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a4];
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)a4);
  uint64_t AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      C3DAnimationManagerSetSystemTime_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  double SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  if (self->super._framebuffer)
  {
    double v18 = SystemTime;
    double lastUpdate = self->_lastUpdate;
    if (lastUpdate != v18
      && (lastUpdate == 0.0
       || v18 > self->_nextUpdateDate
       || (objc_opt_respondsToSelector() & 1) != 0 && [self->_delegate needsUpdate]))
    {
      self->_double lastUpdate = v18;
      uint64_t GLContext = C3DRendererContextGetGLContext((uint64_t)v6);
      [(SCNTextureOffscreenRenderingSource *)self _bindFramebuffer:a4];
      [self->_delegate drawInContext:GLContext atTime:v18];
      [(SCNTextureOffscreenRenderingSource *)self _unbindFramebuffer:a4];
      char v21 = objc_opt_respondsToSelector();
      double v22 = 0.0;
      if (v21) {
        objc_msgSend(self->_delegate, "nextFrameTime", 0.0);
      }
      self->_nextUpdateDate = v18 + v22;
    }
  }
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureDelegateSource;
  [(SCNTextureOffscreenRenderingSource *)&v3 cleanup:a3];
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Stats = C3DEngineContextGetStats((uint64_t)a3);
  double v9 = CACurrentMediaTime();
  id v10 = [(SCNTextureDelegateSource *)self delegate];
  if (v10)
  {
    id v11 = v10;
    [v10 contentSize];
    uint64_t v13 = 0;
    if (v14 > 0.0 && v12 > 0.0)
    {
      uint64_t v13 = -[SCNTextureOffscreenRenderingSource __prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:](self, "__prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:", a3, a4, 0);
      [(SCNTextureDelegateSource *)self __updateTextureWithDelegate:v11 engineContext:a3];
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v9;
  }
  else
  {
    uint64_t v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SCNTextureDelegateSource textureWithEngineContext:textureSampler:nextFrameTime:](v15);
    }
    return 0;
  }
  return v13;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)textureWithEngineContext:(os_log_t)log textureSampler:nextFrameTime:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: SCNTextureDelegateSource::textureProxy -> no delegate", v1, 2u);
}

@end
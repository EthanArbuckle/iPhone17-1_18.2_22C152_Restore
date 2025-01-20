@interface SCNTextureSource
- (BOOL)prefersGL3;
- (BOOL)shouldFlip;
- (BOOL)supportsMetal;
- (__C3DRendererContext)rendererContextForTextureSourceWithEngineContext:(__C3DEngineContext *)a3;
- (__C3DTexture)_textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (double)nextFrameTime;
- (double)textureSize;
- (id)MTLTextureCache;
- (id)glTextureCache;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)cleanup:(__C3DRendererContext *)a3;
- (void)dealloc;
- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (void)setGlTextureCache:(id)a3;
- (void)setMTLTextureCache:(id)a3;
- (void)setSize:(SCNTextureSource *)self;
@end

@implementation SCNTextureSource

- (void)setSize:(SCNTextureSource *)self
{
  *(void *)self->_size = v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureSource;
  [(SCNTextureSource *)&v3 dealloc];
}

- (BOOL)shouldFlip
{
  return 1;
}

- (BOOL)supportsMetal
{
  return 1;
}

- (BOOL)prefersGL3
{
  return 0;
}

- (__C3DRendererContext)rendererContextForTextureSourceWithEngineContext:(__C3DEngineContext *)a3
{
  RendererContextGL = (__C3DRendererContext *)C3DEngineContextGetRendererContextGL((uint64_t)a3);
  if ([(SCNTextureSource *)self prefersGL3] || !RendererContextGL)
  {
    if (C3DTextureSourceGetSharedRendererContext_onceToken != -1) {
      dispatch_once(&C3DTextureSourceGetSharedRendererContext_onceToken, &__block_literal_global_129);
    }
    return (__C3DRendererContext *)C3DTextureSourceGetSharedRendererContext_rendererContext;
  }
  return RendererContextGL;
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  v6 = scn_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:](a2);
  }
  return 0;
}

- (__C3DTexture)_textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  v6 = scn_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:](a2);
  }
  return 0;
}

- (double)textureSize
{
  objc_super v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:](a2);
  }
  __asm { FMOV            V0.2S, #1.0 }
  return result;
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  if (!C3DEngineContextGetRenderContext((uint64_t)a3))
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SCNTextureSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  if ([(SCNTextureSource *)self supportsMetal])
  {
    uint64_t IOSurface = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:", C3DRendererContextGetGLContext((uint64_t)-[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3)));
    id result = [(SCNTextureSource *)self _textureWithEngineContext:a3 textureSampler:a4 nextFrameTime:a5];
    if (!result) {
      return result;
    }
    uint64_t IOSurface = C3DTextureGetIOSurface((uint64_t)result);
    glFlush();
  }
  id result = [(SCNTextureSource *)self MTLTextureCache];
  if (!result)
  {
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    v21 = (void *)-[SCNMTLRenderContext device](RenderContext);
    [(SCNTextureSource *)self textureSize];
    long long v26 = v22;
    if (C3DLinearRenderingIsEnabled()) {
      uint64_t v23 = 71;
    }
    else {
      uint64_t v23 = 70;
    }
    v24 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v23, (unint64_t)*(float *)&v26, (unint64_t)*((float *)&v26 + 1), 0, v26);
    [v24 setStorageMode:2 * (IOSurface == 0)];
    [v24 setUsage:1];
    v25 = (void *)[v21 newTextureWithDescriptor:v24 iosurface:IOSurface plane:0];
    [(SCNTextureSource *)self setMTLTextureCache:v25];
    return v25;
  }
  return result;
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  v6 = scn_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:](a2);
  }
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:](a2);
  }
}

- (double)nextFrameTime
{
  return INFINITY;
}

- (id)MTLTextureCache
{
  return self->_mtlTextureCache;
}

- (void)setMTLTextureCache:(id)a3
{
  id mtlTextureCache = self->_mtlTextureCache;
  if (mtlTextureCache != a3)
  {

    self->_id mtlTextureCache = a3;
  }
}

- (id)glTextureCache
{
  return self->_glTextureCache;
}

- (void)setGlTextureCache:(id)a3
{
  id glTextureCache = self->_glTextureCache;
  if (glTextureCache != a3)
  {

    self->_id glTextureCache = a3;
  }
}

- (void)textureWithEngineContext:(const char *)a1 textureSampler:nextFrameTime:.cold.1(const char *a1)
{
  NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: SCNTextureSource abstract method invoked %@", v3, v4, v5, v6, v7);
}

- (void)metalTextureWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 status:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
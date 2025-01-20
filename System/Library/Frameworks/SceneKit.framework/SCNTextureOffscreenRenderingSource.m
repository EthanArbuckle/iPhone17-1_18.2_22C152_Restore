@interface SCNTextureOffscreenRenderingSource
- (__C3DTexture)__prepareFramebufferWithSize:(CGSize)a3 withEngineContext:(__C3DEngineContext *)a4 textureSampler:(__C3DTextureSampler *)a5 needsStencil:(BOOL)a6;
- (float32x2_t)textureSize;
- (void)_bindFramebuffer:(__C3DEngineContext *)a3;
- (void)_buildMipmaps:(__C3DEngineContext *)a3;
- (void)_createFramebufferWithEngineContext:(__C3DEngineContext *)a3 size:(CGSize)a4;
- (void)_unbindFramebuffer:(__C3DEngineContext *)a3;
- (void)cleanup:(__C3DRendererContext *)a3;
@end

@implementation SCNTextureOffscreenRenderingSource

- (float32x2_t)textureSize
{
  return vcvt_f32_f64(*(float64x2_t *)(a1 + 40));
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  framebuffer = self->_framebuffer;
  if (framebuffer)
  {
    C3DRendererContextDeleteFramebuffer((uint64_t)a3, (uint64_t)framebuffer, 1);
    CFRelease(self->_framebuffer);
  }
  self->_framebufferSize.width = 0.0;
}

- (void)_createFramebufferWithEngineContext:(__C3DEngineContext *)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  BOOL v6 = ![(SCNTextureSource *)self supportsMetal] && C3DEngineContextGetRenderContext((uint64_t)a3) != 0;
  int v7 = [(SCNTextureSource *)self prefersGL3] || v6;
  v8 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a3];
  uint64_t v9 = (uint64_t)v8;
  framebuffer = self->_framebuffer;
  if (framebuffer)
  {
    C3DRendererContextDeleteFramebuffer((uint64_t)v8, (uint64_t)framebuffer, 1);
    v11 = self->_framebuffer;
    if (v11)
    {
      CFRelease(v11);
      self->_framebuffer = 0;
    }
  }
  if (v7)
  {
    if (((int)width & 0xB) != 0) {
      double width = (double)(int)(((int)width & 0xFFFFFFFC) + 4);
    }
    uint64_t v12 = 0x8000000;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = (__C3DFramebuffer *)C3DFramebufferCreate();
  self->_framebuffer = v13;
  v14.f64[0] = width;
  v14.f64[1] = height;
  C3DFramebufferSetSize((uint64_t)v13, COERCE_DOUBLE(vcvt_f32_f64(vrndpq_f64(v14))));
  uint64_t v15 = C3DRenderTargetDescriptionMake(1u, 1);
  C3DFramebufferAddRenderTargetDescription((uint64_t)self->_framebuffer, 0, v15 & 0xFFFFFFFFF7FFFFFFLL | v12);
  v16 = self->_framebuffer;

  C3DRendererContextSetupFramebuffer(v9, (uint64_t)v16);
}

- (__C3DTexture)__prepareFramebufferWithSize:(CGSize)a3 withEngineContext:(__C3DEngineContext *)a4 textureSampler:(__C3DTextureSampler *)a5 needsStencil:(BOOL)a6
{
  double height = a3.height;
  double width = a3.width;
  p_framebufferSize = &self->_framebufferSize;
  if (a3.width != self->_framebufferSize.width || a3.height != self->_framebufferSize.height)
  {
    -[SCNTextureSource setMTLTextureCache:](self, "setMTLTextureCache:", 0, a5, a6);
    [(SCNTextureSource *)self setGlTextureCache:0];
    p_framebufferSize->double width = width;
    p_framebufferSize->double height = height;
    int WrapModeS = C3DTextureSamplerGetWrapModeS((uint64_t)a5);
    int WrapModeT = C3DTextureSamplerGetWrapModeT((uint64_t)a5);
    if ((WrapModeS & 0xFFFFFFFD) != 1 || (WrapModeT & 0xFFFFFFFD) != 1 || C3DTextureSamplerUseMipmaps((uint64_t)a5))
    {
      double width = (double)(int)C3DMakePowerOfTwo((int)width);
      double height = (double)(int)C3DMakePowerOfTwo((int)height);
    }
    -[SCNTextureOffscreenRenderingSource _createFramebufferWithEngineContext:size:](self, "_createFramebufferWithEngineContext:size:", a4, width, height);
  }
  framebuffer = self->_framebuffer;

  return (__C3DTexture *)C3DFramebufferGetTextureWithSlot((uint64_t)framebuffer, 0);
}

- (void)_buildMipmaps:(__C3DEngineContext *)a3
{
  if (!C3DEngineContextGetRenderContext((uint64_t)a3))
  {
    v5 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a3];
    TextureWithSlot = C3DFramebufferGetTextureWithSlot((uint64_t)self->_framebuffer, 0);
    if (TextureWithSlot)
    {
      uint64_t v7 = (uint64_t)TextureWithSlot;
      if (!C3DTextureGetIOSurface((uint64_t)TextureWithSlot))
      {
        GLenum TargetMode = C3DTextureGetTargetMode(v7);
        GLuint ID = C3DTextureGetID(v7);
        _C3DRendererContextBindTextureGL((uint64_t)v5, TargetMode, ID);
        glGenerateMipmap(TargetMode);
      }
    }
  }
}

- (void)_bindFramebuffer:(__C3DEngineContext *)a3
{
  v4 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a3];
  framebuffer = self->_framebuffer;

  C3DRendererContextBindFramebuffer((uint64_t)v4, (uint64_t)framebuffer);
}

- (void)_unbindFramebuffer:(__C3DEngineContext *)a3
{
  v3 = [(SCNTextureSource *)self rendererContextForTextureSourceWithEngineContext:a3];

  C3DRendererContextUnbindFramebuffer((uint64_t)v3);
}

@end
@interface SCNMaterialPropertyTextureProviderSource
- (SCNMaterialPropertyTextureProvider)textureProvider;
- (id)cachedTextureWithURL:(id)a3 token:(id *)a4;
- (id)cachedTextureWithURL:(id)a3 token:(id *)a4 didFallbackToDefaultTexture:(BOOL *)a5;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)connectToProxy:(__C3DImageProxy *)a3;
- (void)dealloc;
- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (void)setTextureProvider:(id)a3;
@end

@implementation SCNMaterialPropertyTextureProviderSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMaterialPropertyTextureProviderSource;
  [(SCNTextureSource *)&v3 dealloc];
}

- (void)setTextureProvider:(id)a3
{
  if (self->_textureProvider != a3)
  {

    self->_texture = 0;
    self->_textureProvider = (SCNMaterialPropertyTextureProvider *)a3;
  }
}

- (SCNMaterialPropertyTextureProvider)textureProvider
{
  return self->_textureProvider;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  C3DImageProxySetSource((uint64_t)a3, self, 0);
  v4[0] = xmmword_26BF71C58;
  v4[1] = *(_OWORD *)&off_26BF71C68;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  self->_engineContext = a3;
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  uint64_t v9 = RenderContext;
  if (self->_texture)
  {
    BOOL v10 = 0;
  }
  else
  {
    self->_texture = (MTLTexture *)-[SCNMaterialPropertyTextureProvider newTextureForDevice:](self->_textureProvider, "newTextureForDevice:", -[SCNMTLRenderContext device](RenderContext));
    BOOL v10 = 1;
  }
  a6->var0 = v10;
  a6->var1 = 1;
  __renderToTexture(self->_textureProvider, (uint64_t)self->_texture, (uint64_t)self, v9);
  return self->_texture;
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  self->_engineContext = a3;
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  textureProvider = self->_textureProvider;
  texture = self->_texture;

  __renderToTexture(textureProvider, (uint64_t)texture, (uint64_t)self, RenderContext);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4
{
  return [(SCNMaterialPropertyTextureProviderSource *)self cachedTextureWithURL:a3 token:a4 didFallbackToDefaultTexture:0];
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4 didFallbackToDefaultTexture:(BOOL *)a5
{
  if (a4) {
    *a4 = 0;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__SCNMaterialPropertyTextureProviderSource_cachedTextureWithURL_token_didFallbackToDefaultTexture___block_invoke;
  v17[3] = &unk_264006880;
  v17[4] = a3;
  IfNeededForSource = (void *)C3DImageCopyCachedImageOrCreateIfNeededForSource(a3, 1, (uint64_t)v17);
  BOOL v10 = IfNeededForSource;
  if (a4) {
    *a4 = IfNeededForSource;
  }
  BOOL v16 = 0;
  uint64_t RenderContext = (id *)C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  v12 = (void *)-[SCNMTLRenderContext resourceManager]((uint64_t)RenderContext);
  v13 = (void *)[v12 renderResourceForImage:v10 sampler:C3DTextureSamplerGetDefault() options:0 engineContext:self->_engineContext didFallbackToDefaultTexture:&v16];
  CFAutorelease(v10);
  if (v16)
  {
    v14 = -[SCNMTLRenderContext resourceManagerMonitor](RenderContext);
    if (v14) {
      [v14 renderContext:RenderContext, a3, objc_msgSend(NSString, "stringWithFormat:", @"SCNMaterialPropertyTextureProviderHelper could not find texture for %@", a3) didFallbackToDefaultTextureForSource message];
    }
  }
  if (a5) {
    *a5 = v16;
  }
  return v13;
}

uint64_t __99__SCNMaterialPropertyTextureProviderSource_cachedTextureWithURL_token_didFallbackToDefaultTexture___block_invoke(uint64_t a1)
{
  return C3DImageCreateWithURL(*(const void **)(a1 + 32));
}

@end
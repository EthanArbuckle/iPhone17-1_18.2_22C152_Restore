@interface SCNTextureUIKitSource
- (BOOL)isOpaque;
- (BOOL)requiresMainThreadUpdates;
- (BOOL)shouldFlip;
- (BOOL)supportsMetal;
- (CALayer)uiWindowLayer;
- (CGSize)layerSizeInPixels;
- (SCNTextureUIKitSource)init;
- (UIView)uiView;
- (UIWindow)uiWindow;
- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5;
- (double)layerContentsScaleFactor;
- (float)clearValue;
- (id)layer;
- (id)layerToFocusForRenderedLayer:(id)a3;
- (id)source;
- (void)_layerTreeDidUpdate;
- (void)cleanup:(__C3DRendererContext *)a3;
- (void)dealloc;
- (void)setIsOpaque:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setUiView:(id)a3;
- (void)setUiWindow:(id)a3;
- (void)setUiWindowLayer:(id)a3;
- (void)setup;
@end

@implementation SCNTextureUIKitSource

- (SCNTextureUIKitSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureUIKitSource;
  result = [(SCNTextureUIKitSource *)&v3 init];
  if (result) {
    atomic_fetch_add(gSCNTextureUIKitSourceInstanceCount, 1u);
  }
  return result;
}

- (BOOL)supportsMetal
{
  return 0;
}

- (BOOL)shouldFlip
{
  return 1;
}

- (BOOL)requiresMainThreadUpdates
{
  return 1;
}

- (void)dealloc
{
  atomic_fetch_add(gSCNTextureUIKitSourceInstanceCount, 0xFFFFFFFF);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  uiWindow = self->_uiWindow;
  uiView = self->_uiView;
  self->_uiWindow = 0;
  self->_uiView = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SCNTextureUIKitSource_dealloc__block_invoke;
  block[3] = &unk_264005FA0;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x263EF83A0], block);

  v5.receiver = self;
  v5.super_class = (Class)SCNTextureUIKitSource;
  [(SCNTextureCoreAnimationSource *)&v5 dealloc];
}

void __32__SCNTextureUIKitSource_dealloc__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
}

- (void)setup
{
  objc_super v3 = [(CALayer *)self->_uiWindowLayer superlayer];
  v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v4 addObserver:self selector:sel__layerTreeDidUpdate name:@"SCNLayerTreeDidChange" object:v3];
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SCNTextureUIKitSource;
  [(SCNTextureCoreAnimationSource *)&v3 cleanup:a3];
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return self->_uiWindowLayer;
}

- (float)clearValue
{
  LOBYTE(v2) = self->_isOpaque;
  return (float)v2;
}

- (id)layer
{
  return [(CALayer *)self->_uiWindowLayer superlayer];
}

- (double)layerContentsScaleFactor
{
  unsigned int v2 = (void *)[MEMORY[0x263F1C920] mainScreen];

  [v2 scale];
  return result;
}

- (CGSize)layerSizeInPixels
{
  [(CALayer *)self->_uiWindowLayer bounds];
  double v4 = v3;
  double v6 = v5;
  [(SCNTextureUIKitSource *)self layerContentsScaleFactor];
  if (v7 == 0.0) {
    double v7 = 1.0;
  }
  double v8 = v6 * v7;
  double v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  [MEMORY[0x263F158F8] flush];
  v10.receiver = self;
  v10.super_class = (Class)SCNTextureUIKitSource;
  return [(SCNTextureCoreAnimationSource *)&v10 textureWithEngineContext:a3 textureSampler:a4 nextFrameTime:a5];
}

- (void)_layerTreeDidUpdate
{
  double v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  id source = self->_source;

  [v3 postNotificationName:@"SCNUITreeDidChange" object:source];
}

- (UIWindow)uiWindow
{
  return self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
}

- (CALayer)uiWindowLayer
{
  return self->_uiWindowLayer;
}

- (void)setUiWindowLayer:(id)a3
{
}

- (UIView)uiView
{
  return self->_uiView;
}

- (void)setUiView:(id)a3
{
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

@end
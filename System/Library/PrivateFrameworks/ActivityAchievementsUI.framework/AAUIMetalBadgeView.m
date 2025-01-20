@interface AAUIMetalBadgeView
+ (Class)layerClass;
- (AAUIBadgeModelConfiguration)configuration;
- (AAUIBadgeViewDrawableDelegate)delegate;
- (AAUIMetalBadgeRenderer)renderer;
- (BOOL)isPaused;
- (CAMetalLayer)metalLayer;
- (UIImage)backTextureImage;
- (id)initUsingEarnedShader:(BOOL)a3 delegate:(id)a4;
- (id)snapshot;
- (void)cleanupAfterSnapshot;
- (void)resizeBadgeForCurrentViewSize;
- (void)setBackTextureImage:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMetalLayer:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRenderer:(id)a3;
@end

@implementation AAUIMetalBadgeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)snapshot
{
  v2 = [(AAUIMetalBadgeView *)self renderer];
  v3 = [v2 snapshot];

  return v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIMetalBadgeView *)self renderer];
  [v5 setConfiguration:v4];
}

- (void)cleanupAfterSnapshot
{
  id v2 = [(AAUIMetalBadgeView *)self renderer];
  [v2 cleanupAfterSnapshot];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AAUIMetalBadgeView *)self renderer];
  [v4 setPaused:v3];
}

- (BOOL)isPaused
{
  id v2 = [(AAUIMetalBadgeView *)self renderer];
  char v3 = [v2 isPaused];

  return v3;
}

- (id)initUsingEarnedShader:(BOOL)a3 delegate:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIMetalBadgeView;
  v7 = -[AAUIMetalBadgeView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_useEarnedShader = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    [(AAUIMetalBadgeView *)v8 setAutoresizingMask:18];
    uint64_t v9 = [(AAUIMetalBadgeView *)v8 layer];
    metalLayer = v8->_metalLayer;
    v8->_metalLayer = (CAMetalLayer *)v9;

    v11 = [[AAUIMetalBadgeRenderer alloc] initWithCAMetalLayer:v8->_metalLayer useEarnedShader:v8->_useEarnedShader];
    renderer = v8->_renderer;
    v8->_renderer = v11;

    objc_initWeak(&location, v8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__AAUIMetalBadgeView_initUsingEarnedShader_delegate___block_invoke;
    v14[3] = &unk_264860C78;
    objc_copyWeak(&v15, &location);
    [(AAUIMetalBadgeRenderer *)v8->_renderer setStateUpdateBlock:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIMetalBadgeView;
  -[AAUIMetalBadgeView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AAUIMetalBadgeView *)self resizeBadgeForCurrentViewSize];
}

- (void)resizeBadgeForCurrentViewSize
{
  id v2 = [(AAUIMetalBadgeView *)self renderer];
  [v2 resizeBadgeForCurrentViewSize];
}

- (AAUIMetalBadgeRenderer)renderer
{
  return self->_renderer;
}

id __53__AAUIMetalBadgeView_initUsingEarnedShader_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  char v3 = [v2 updateBadgeModelForDrawable:WeakRetained];

  return v3;
}

- (AAUIBadgeViewDrawableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIBadgeViewDrawableDelegate *)WeakRetained;
}

- (AAUIBadgeModelConfiguration)configuration
{
  id v2 = [(AAUIMetalBadgeView *)self renderer];
  char v3 = [v2 configuration];

  return (AAUIBadgeModelConfiguration *)v3;
}

- (void)setBackTextureImage:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIMetalBadgeView *)self renderer];
  [v5 setBackTextureImage:v4];
}

- (UIImage)backTextureImage
{
  id v2 = [(AAUIMetalBadgeView *)self renderer];
  char v3 = [v2 backTextureImage];

  return (UIImage *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (CAMetalLayer)metalLayer
{
  return self->_metalLayer;
}

- (void)setMetalLayer:(id)a3
{
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
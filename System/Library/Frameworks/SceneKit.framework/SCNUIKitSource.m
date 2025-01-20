@interface SCNUIKitSource
- (BOOL)isOpaque;
- (BOOL)supportsMetal;
- (SCNUIKitSource)init;
- (UIView)uiView;
- (UIWindow)uiWindow;
- (id)prepareWindowIfNeeded;
- (id)textureSource;
- (void)dealloc;
- (void)setUiView:(id)a3;
- (void)setUiWindow:(id)a3;
@end

@implementation SCNUIKitSource

- (SCNUIKitSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNUIKitSource;
  return [(SCNUIKitSource *)&v3 init];
}

- (BOOL)supportsMetal
{
  return 0;
}

- (id)prepareWindowIfNeeded
{
  if (!self->_uiWindow && !self->_windowPreparing)
  {
    self->_windowPreparing = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    v5 = __39__SCNUIKitSource_prepareWindowIfNeeded__block_invoke;
    v6 = &unk_264004DF8;
    v7 = self;
    if (pthread_main_np() == 1) {
      v5((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  return self->_uiWindow;
}

void __39__SCNUIKitSource_prepareWindowIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiView"), "bounds");
  v8 = -[_SCNSnapshotWindow initWithFrame:]([_SCNSnapshotWindow alloc], "initWithFrame:", v2, v3, v4, v5);
  -[_SCNSnapshotWindow setWindowScene:](v8, "setWindowScene:", objc_msgSend((id)objc_msgSend((id)gCurrentSCNViewEvent, "window"), "windowScene"));
  [(_SCNSnapshotWindow *)v8 setHidden:1];
  LODWORD(v6) = 1.0;
  [(_SCNSnapshotWindow *)v8 setCharge:v6];
  [(_SCNSnapshotWindow *)v8 setWindowLevel:10000.0];
  -[_SCNSnapshotWindow addSubview:](v8, "addSubview:", [*(id *)(a1 + 32) uiView]);
  objc_msgSend((id)objc_msgSend((id)-[_SCNSnapshotWindow subviews](v8, "subviews"), "firstObject"), "setNeedsDisplay");
  [(_SCNSnapshotWindow *)v8 setNeedsDisplay];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiView"), "isOpaque");
  *(void *)(*(void *)(a1 + 32) + 24) = [(_SCNSnapshotWindow *)v8 layer];
  v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) superlayer];
  [v7 setValue:MEMORY[0x263EFFA88] forKey:@"SCN_isBackingUIView"];
  [*(id *)(a1 + 32) setUiWindow:v8];
  -[_SCNSnapshotWindow setPosition:](v8, "setPosition:", -10000.0, 0.0);
  [(_SCNSnapshotWindow *)v8 setHidden:0];
}

- (id)textureSource
{
  if (![(SCNUIKitSource *)self prepareWindowIfNeeded]) {
    return 0;
  }
  double v3 = objc_alloc_init(SCNTextureUIKitSource);
  [(SCNTextureUIKitSource *)v3 setUiView:[(SCNUIKitSource *)self uiView]];
  [(SCNTextureUIKitSource *)v3 setUiWindow:[(SCNUIKitSource *)self uiWindow]];
  [(SCNTextureUIKitSource *)v3 setUiWindowLayer:self->_uiWindowLayer];
  [(SCNTextureUIKitSource *)v3 setIsOpaque:self->_isOpaque];
  [(SCNTextureUIKitSource *)v3 setSource:self];
  [(SCNTextureUIKitSource *)v3 setup];
  return v3;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)dealloc
{
  id uiWindow = self->_uiWindow;
  id uiView = self->_uiView;
  self->_id uiWindow = 0;
  self->_id uiView = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __25__SCNUIKitSource_dealloc__block_invoke;
  block[3] = &unk_264005FA0;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v5.receiver = self;
  v5.super_class = (Class)SCNUIKitSource;
  [(SCNUIKitSource *)&v5 dealloc];
}

void __25__SCNUIKitSource_dealloc__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
}

- (UIView)uiView
{
  return (UIView *)self->_uiView;
}

- (void)setUiView:(id)a3
{
}

- (UIWindow)uiWindow
{
  return (UIWindow *)self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
}

@end
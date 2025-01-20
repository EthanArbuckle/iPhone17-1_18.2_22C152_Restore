@interface BPSRemoteImageView
- (BPSRemoteImageView)init;
- (NSString)desiredImageName;
- (NSString)fallbackImageName;
- (void)dealloc;
- (void)setDesiredImageName:(id)a3;
- (void)setFallbackImageName:(id)a3;
- (void)updateImagesWithAnimation;
- (void)updateImagesWithAnimation:(BOOL)a3;
@end

@implementation BPSRemoteImageView

- (BPSRemoteImageView)init
{
  v5.receiver = self;
  v5.super_class = (Class)BPSRemoteImageView;
  v2 = [(BPSRemoteImageView *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_updateImagesWithAnimation name:*MEMORY[0x263F5B9C0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BPSRemoteImageView;
  [(BPSRemoteImageView *)&v4 dealloc];
}

- (void)updateImagesWithAnimation
{
}

- (void)updateImagesWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke;
  v10[3] = &unk_264408700;
  v10[4] = self;
  objc_super v5 = (void (**)(void))MEMORY[0x21D4A9390](v10, a2);
  v6 = v5;
  if (v3)
  {
    v7 = (void *)MEMORY[0x263F1CB60];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke_2;
    v8[3] = &unk_264408CD0;
    v9 = v5;
    [v7 transitionWithView:self duration:5242880 options:v8 animations:&__block_literal_global_2 completion:0.45];
  }
  else
  {
    v5[2](v5);
  }
}

void __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F1C6B0] imageNamed:*(void *)(*(void *)(a1 + 32) + 504)];
  if (!v2)
  {
    BOOL v3 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 512);
    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v3 imageNamed:v4 inBundle:v5];

    if (PBIsInternalInstall()
      && CFPreferencesGetAppBooleanValue(@"DebugMobileAssetLoading", @"com.apple.Bridge", 0))
    {
      [v11 size];
      UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
      objc_msgSend(v11, "drawAtPoint:", 0.0, 0.0);
      v6 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
      [v6 setFill];

      [v11 size];
      CGFloat v8 = v7;
      [v11 size];
      v15.size.height = v9;
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      v15.size.width = v8;
      UIRectFillUsingBlendMode(v15, kCGBlendModePlusLighter);
      uint64_t v10 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
      uint64_t v2 = v10;
    }
    else
    {
      uint64_t v2 = (uint64_t)v11;
    }
  }
  id v12 = (id)v2;
  [*(id *)(a1 + 32) setImage:v2];
}

uint64_t __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)desiredImageName
{
  return self->_desiredImageName;
}

- (void)setDesiredImageName:(id)a3
{
}

- (NSString)fallbackImageName
{
  return self->_fallbackImageName;
}

- (void)setFallbackImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImageName, 0);
  objc_storeStrong((id *)&self->_desiredImageName, 0);
}

@end
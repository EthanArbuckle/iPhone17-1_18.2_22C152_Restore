@interface AEDecorativeTileSource
+ (id)_imageTileWithImage:(id)a3;
+ (id)_imageTileWithImageNamed:(id)a3;
+ (id)_imageTileWithSystemImageName:(id)a3;
+ (void)registerCommonDecorativeTilesToReusePool:(id)a3;
@end

@implementation AEDecorativeTileSource

+ (id)_imageTileWithSystemImageName:(id)a3
{
  v4 = (void *)MEMORY[0x263F82818];
  id v5 = a3;
  v6 = [v4 configurationWithScale:1];
  v7 = [MEMORY[0x263F827E8] _systemImageNamed:v5];

  v8 = [v7 imageWithConfiguration:v6];

  v9 = [MEMORY[0x263F825C8] whiteColor];
  v10 = [v8 imageWithTintColor:v9 renderingMode:1];

  v11 = [a1 _imageTileWithImage:v10];

  return v11;
}

+ (id)_imageTileWithImageNamed:(id)a3
{
  v4 = (void *)MEMORY[0x263F827E8];
  id v5 = a3;
  v6 = AssetExplorerBundle();
  v7 = [v4 imageNamed:v5 inBundle:v6];

  v8 = [a1 _imageTileWithImage:v7];

  return v8;
}

+ (id)_imageTileWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F82828];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithImage:v4];

  v6 = [[AEGenericViewTile alloc] initWithView:v5];
  return v6;
}

+ (void)registerCommonDecorativeTilesToReusePool:(id)a3
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke;
  v8[3] = &__block_descriptor_40_e5__8__0l;
  v8[4] = a1;
  id v4 = a3;
  [v4 registerReusableObjectForReuseIdentifier:795209734 creationHandler:v8];
  [v4 registerReusableObjectForReuseIdentifier:795209735 creationHandler:&__block_literal_global_676];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_3;
  v7[3] = &__block_descriptor_40_e5__8__0l;
  v7[4] = a1;
  [v4 registerReusableObjectForReuseIdentifier:795209731 creationHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_4;
  v6[3] = &__block_descriptor_40_e5__8__0l;
  v6[4] = a1;
  [v4 registerReusableObjectForReuseIdentifier:795209732 creationHandler:v6];
  [v4 registerReusableObjectForReuseIdentifier:795209736 creationHandler:&__block_literal_global_221];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_6;
  v5[3] = &__block_descriptor_40_e5__8__0l;
  v5[4] = a1;
  [v4 registerReusableObjectForReuseIdentifier:795209738 creationHandler:v5];
}

id __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = AssetExplorerBundle();
  id v4 = [v2 imageNamed:@"Gradient_shadow" inBundle:v3];

  id v5 = objc_msgSend(v4, "resizableImageWithCapInsets:", 0.0, 1.0, 0.0, 0.0);
  v6 = [*(id *)(a1 + 32) _imageTileWithImage:v5];
  v7 = [v6 view];
  v8 = [v7 layer];
  [v8 setCornerRadius:12.5];

  uint64_t v9 = *MEMORY[0x263F15A20];
  v10 = [v6 view];
  v11 = [v10 layer];
  [v11 setCornerCurve:v9];

  v12 = [v6 view];
  v13 = [v12 layer];
  [v13 setMaskedCorners:12];

  v14 = [v6 view];
  v15 = [v14 layer];
  [v15 setAllowsGroupOpacity:0];

  v16 = [v6 view];
  [v16 setClipsToBounds:1];

  return v6;
}

uint64_t __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _imageTileWithImageNamed:@"Video_badge"];
}

uint64_t __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _imageTileWithImageNamed:@"Loop_badge"];
}

id __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = objc_msgSend(MEMORY[0x263F086E0], "px_bundle");
  id v4 = [v2 imageNamed:@"spatial" inBundle:v3];

  id v5 = [MEMORY[0x263F825C8] whiteColor];
  v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  v7 = [*(id *)(a1 + 32) _imageTileWithImage:v6];

  return v7;
}

AEGridOverlayView *__67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_5()
{
  v0 = objc_alloc_init(AEGridOverlayView);
  return v0;
}

AEGenericViewTile *__67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_2()
{
  v0 = [AEGradientShadowView alloc];
  v1 = -[AEGradientShadowView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v2 = [(AEGradientShadowView *)v1 layer];
  [v2 setCornerRadius:12.5];

  v3 = [[AEGenericViewTile alloc] initWithView:v1];
  return v3;
}

@end
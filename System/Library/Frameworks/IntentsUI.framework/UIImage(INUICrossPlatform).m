@interface UIImage(INUICrossPlatform)
+ (id)_inui_imageWithLightModeImage:()INUICrossPlatform darkModeImage:;
+ (uint64_t)_inui_imageNamed:()INUICrossPlatform inBundle:;
@end

@implementation UIImage(INUICrossPlatform)

+ (id)_inui_imageWithLightModeImage:()INUICrossPlatform darkModeImage:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 imageAsset];
  v8 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  [v7 registerImage:v6 withTraitCollection:v8];

  return v5;
}

+ (uint64_t)_inui_imageNamed:()INUICrossPlatform inBundle:
{
  return [MEMORY[0x263F1C6B0] imageNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
}

@end
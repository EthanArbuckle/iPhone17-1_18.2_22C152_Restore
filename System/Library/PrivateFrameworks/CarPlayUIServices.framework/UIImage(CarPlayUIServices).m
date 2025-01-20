@interface UIImage(CarPlayUIServices)
+ (id)crsui_imageNamed:()CarPlayUIServices compatibleWithTraitCollection:;
+ (id)crsui_wallpaperImageNamed:()CarPlayUIServices compatibleWithTraitCollection:;
@end

@implementation UIImage(CarPlayUIServices)

+ (id)crsui_imageNamed:()CarPlayUIServices compatibleWithTraitCollection:
{
  v5 = (void *)MEMORY[0x263F1C6B0];
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 bundleWithIdentifier:@"com.apple.CarPlayUIServices"];
  v10 = [v5 imageNamed:v8 inBundle:v9 compatibleWithTraitCollection:v7];

  return v10;
}

+ (id)crsui_wallpaperImageNamed:()CarPlayUIServices compatibleWithTraitCollection:
{
  id v5 = a3;
  if ([a4 userInterfaceStyle] == 1) {
    v6 = @"-Light";
  }
  else {
    v6 = @"-Dark";
  }
  id v7 = [v5 stringByAppendingString:v6];

  id v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarPlayUIServices"];
  v9 = [v8 pathForResource:v7 ofType:@"heic"];

  v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9];
  v11 = [MEMORY[0x263F1C6B0] imageWithData:v10];

  return v11;
}

@end
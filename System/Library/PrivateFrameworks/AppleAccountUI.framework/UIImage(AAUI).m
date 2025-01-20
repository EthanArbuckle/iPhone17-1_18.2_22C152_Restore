@interface UIImage(AAUI)
+ (id)descriptorForDataclassWithSize:()AAUI;
+ (id)imageForDataclassWithBundleID:()AAUI;
+ (id)imageForDataclassWithType:()AAUI;
+ (id)imageForTableUIWithType:()AAUI;
@end

@implementation UIImage(AAUI)

+ (id)imageForDataclassWithType:()AAUI
{
  v4 = (objc_class *)MEMORY[0x263F4B540];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithType:v5];

  v7 = [a1 descriptorForDataclassWithSize:56.0];
  v8 = [v6 prepareImageForDescriptor:v7];

  v9 = (void *)MEMORY[0x263F827E8];
  uint64_t v10 = [v8 CGImage];
  [v8 scale];
  v11 = objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);

  return v11;
}

+ (id)imageForDataclassWithBundleID:()AAUI
{
  v4 = (objc_class *)MEMORY[0x263F4B540];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5];

  v7 = [a1 descriptorForDataclassWithSize:56.0];
  v8 = [v6 prepareImageForDescriptor:v7];

  v9 = (void *)MEMORY[0x263F827E8];
  uint64_t v10 = [v8 CGImage];
  [v8 scale];
  v11 = objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);

  return v11;
}

+ (id)descriptorForDataclassWithSize:()AAUI
{
  id v2 = objc_alloc(MEMORY[0x263F4B558]);
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 scale];
  id v5 = objc_msgSend(v2, "initWithSize:scale:", a1, a1, v4 * 3.0);

  [v5 setDrawBorder:1];
  v6 = [MEMORY[0x263F82DA0] currentTraitCollection];
  objc_msgSend(v5, "setAppearance:", objc_msgSend(v6, "userInterfaceStyle") != 1);

  v7 = [MEMORY[0x263F82DA0] currentTraitCollection];
  if ([v7 layoutDirection]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v5 setLanguageDirection:v8];

  v9 = [MEMORY[0x263F82DA0] currentTraitCollection];
  objc_msgSend(v5, "setContrast:", objc_msgSend(v9, "accessibilityContrast") == 1);

  return v5;
}

+ (id)imageForTableUIWithType:()AAUI
{
  v3 = (objc_class *)MEMORY[0x263F4B540];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithType:v4];

  v6 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B5A0]];
  v7 = [v5 prepareImageForDescriptor:v6];
  uint64_t v8 = (void *)MEMORY[0x263F827E8];
  uint64_t v9 = [v7 CGImage];
  [v7 scale];
  uint64_t v10 = objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);

  return v10;
}

@end
@interface AMUIAmbientPresentationSceneExtension
+ (id)clientComponents;
+ (id)settingsExtensions;
@end

@implementation AMUIAmbientPresentationSceneExtension

+ (id)settingsExtensions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)clientComponents
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end
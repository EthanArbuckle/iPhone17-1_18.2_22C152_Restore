@interface HMDUserDataModel
+ (id)hmbProperties;
@end

@implementation HMDUserDataModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_136253 != -1) {
    dispatch_once(&hmbProperties_onceToken_136253, &__block_literal_global_136254);
  }
  v2 = (void *)hmbProperties__properties_136255;
  return v2;
}

void __33__HMDUserDataModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"settingsRootUUID";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_136255;
  hmbProperties__properties_136255 = v1;
}

@end
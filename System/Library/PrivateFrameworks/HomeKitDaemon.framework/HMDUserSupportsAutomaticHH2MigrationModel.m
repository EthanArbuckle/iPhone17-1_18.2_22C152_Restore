@interface HMDUserSupportsAutomaticHH2MigrationModel
+ (id)hmbProperties;
@end

@implementation HMDUserSupportsAutomaticHH2MigrationModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_185259 != -1) {
    dispatch_once(&hmbProperties_onceToken_185259, &__block_literal_global_185260);
  }
  v2 = (void *)hmbProperties__properties_185261;
  return v2;
}

void __58__HMDUserSupportsAutomaticHH2MigrationModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"supportsAutomaticHH2Migration";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[1] = @"supportsHH2MigrationByOwnerAuto";
  v5[0] = v0;
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)hmbProperties__properties_185261;
  hmbProperties__properties_185261 = v2;
}

@end
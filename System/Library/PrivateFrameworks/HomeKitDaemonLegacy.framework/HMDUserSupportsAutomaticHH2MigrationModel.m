@interface HMDUserSupportsAutomaticHH2MigrationModel
+ (id)hmbProperties;
@end

@implementation HMDUserSupportsAutomaticHH2MigrationModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_69989 != -1) {
    dispatch_once(&hmbProperties_onceToken_69989, &__block_literal_global_69990);
  }
  v2 = (void *)hmbProperties__properties_69991;
  return v2;
}

void __58__HMDUserSupportsAutomaticHH2MigrationModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"supportsAutomaticHH2Migration";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[1] = @"supportsHH2MigrationByOwnerAuto";
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)hmbProperties__properties_69991;
  hmbProperties__properties_69991 = v2;
}

@end
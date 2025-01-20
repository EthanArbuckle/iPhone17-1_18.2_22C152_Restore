@interface HMDUserDataModel
+ (id)hmbProperties;
@end

@implementation HMDUserDataModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_92326 != -1) {
    dispatch_once(&hmbProperties_onceToken_92326, &__block_literal_global_92327);
  }
  v2 = (void *)hmbProperties__properties_92328;
  return v2;
}

void __33__HMDUserDataModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"settingsRootUUID";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_92328;
  hmbProperties__properties_92328 = v1;
}

@end
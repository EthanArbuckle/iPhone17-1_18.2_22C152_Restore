@interface HMDMediaContentProfileAccessControlModel
+ (id)hmbProperties;
@end

@implementation HMDMediaContentProfileAccessControlModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_40726 != -1) {
    dispatch_once(&hmbProperties_onceToken_40726, &__block_literal_global_40727);
  }
  v2 = (void *)hmbProperties__properties_40728;
  return v2;
}

void __57__HMDMediaContentProfileAccessControlModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"accessories";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_40728;
  hmbProperties__properties_40728 = v1;
}

@end
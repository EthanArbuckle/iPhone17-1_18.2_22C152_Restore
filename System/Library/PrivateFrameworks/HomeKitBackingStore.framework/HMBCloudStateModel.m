@interface HMBCloudStateModel
+ (id)hmbProperties;
@end

@implementation HMBCloudStateModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_6317 != -1) {
    dispatch_once(&hmbProperties_onceToken_6317, &__block_literal_global_6318);
  }
  v2 = (void *)hmbProperties__properties_6319;
  return v2;
}

void __35__HMBCloudStateModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"serverChangeToken";
  v0 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_6319;
  hmbProperties__properties_6319 = v1;
}

@end
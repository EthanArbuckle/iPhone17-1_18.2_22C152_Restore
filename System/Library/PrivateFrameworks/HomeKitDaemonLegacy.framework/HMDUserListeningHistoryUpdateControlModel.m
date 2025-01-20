@interface HMDUserListeningHistoryUpdateControlModel
+ (id)hmbProperties;
@end

@implementation HMDUserListeningHistoryUpdateControlModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_185939 != -1) {
    dispatch_once(&hmbProperties_onceToken_185939, &__block_literal_global_185940);
  }
  v2 = (void *)hmbProperties__properties_185941;
  return v2;
}

void __58__HMDUserListeningHistoryUpdateControlModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"accessories";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_185941;
  hmbProperties__properties_185941 = v1;
}

@end
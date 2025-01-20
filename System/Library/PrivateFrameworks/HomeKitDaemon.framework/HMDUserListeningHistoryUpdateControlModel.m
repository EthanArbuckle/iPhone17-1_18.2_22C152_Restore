@interface HMDUserListeningHistoryUpdateControlModel
+ (id)hmbProperties;
@end

@implementation HMDUserListeningHistoryUpdateControlModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_206472 != -1) {
    dispatch_once(&hmbProperties_onceToken_206472, &__block_literal_global_206473);
  }
  v2 = (void *)hmbProperties__properties_206474;
  return v2;
}

void __58__HMDUserListeningHistoryUpdateControlModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"accessories";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_206474;
  hmbProperties__properties_206474 = v1;
}

@end
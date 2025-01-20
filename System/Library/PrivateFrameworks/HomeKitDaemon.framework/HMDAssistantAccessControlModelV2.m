@interface HMDAssistantAccessControlModelV2
+ (id)hmbProperties;
@end

@implementation HMDAssistantAccessControlModelV2

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_121921 != -1) {
    dispatch_once(&hmbProperties_onceToken_121921, &__block_literal_global_121922);
  }
  v2 = (void *)hmbProperties__properties_121923;
  return v2;
}

void __49__HMDAssistantAccessControlModelV2_hmbProperties__block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = @"accessoryUUIDs";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v7[0] = v0;
  v6[1] = @"siriEndpointAccessoryUUIDs";
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v7[1] = v1;
  v6[2] = @"requiresAuthenticationForSecureRequests";
  v2 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v7[2] = v2;
  v6[3] = @"activityNotificationsEnabledForPersonalRequests";
  v3 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v7[3] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)hmbProperties__properties_121923;
  hmbProperties__properties_121923 = v4;
}

@end
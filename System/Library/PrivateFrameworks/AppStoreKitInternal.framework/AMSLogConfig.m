@interface AMSLogConfig
@end

@implementation AMSLogConfig

void __57__AMSLogConfig_AppStoreKitInternal__ask_generalLogConfig__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4DDA8]);
  [v2 setSubsystem:@"com.apple.AppStoreKitInternal"];
  [v2 setCategory:@"ASK General"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)ask_generalLogConfig_logConfig;
  ask_generalLogConfig_logConfig = v0;
}

@end
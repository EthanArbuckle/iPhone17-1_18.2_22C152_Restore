@interface AMSLogConfig(AppStoreKitInternal)
+ (id)ask_generalLogConfig;
@end

@implementation AMSLogConfig(AppStoreKitInternal)

+ (id)ask_generalLogConfig
{
  if (ask_generalLogConfig_onceToken != -1) {
    dispatch_once(&ask_generalLogConfig_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)ask_generalLogConfig_logConfig;
  return v0;
}

@end
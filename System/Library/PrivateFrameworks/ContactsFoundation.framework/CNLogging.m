@interface CNLogging
+ (OS_os_log)apiUsageLog;
+ (OS_os_log)notificationOSLog;
+ (OS_os_log)sdkBreakageLog;
@end

@implementation CNLogging

+ (OS_os_log)apiUsageLog
{
  if (apiUsageLog_cn_once_token_1 != -1) {
    dispatch_once(&apiUsageLog_cn_once_token_1, &__block_literal_global_4_3);
  }
  v2 = (void *)apiUsageLog_cn_once_object_1;

  return (OS_os_log *)v2;
}

uint64_t __24__CNLogging_apiUsageLog__block_invoke()
{
  apiUsageLog_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)notificationOSLog
{
  if (notificationOSLog_cn_once_token_0 != -1) {
    dispatch_once(&notificationOSLog_cn_once_token_0, &__block_literal_global_36);
  }
  v2 = (void *)notificationOSLog_cn_once_object_0;

  return (OS_os_log *)v2;
}

uint64_t __30__CNLogging_notificationOSLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "notifications");
  uint64_t v1 = notificationOSLog_cn_once_object_0;
  notificationOSLog_cn_once_object_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)sdkBreakageLog
{
  if (sdkBreakageLog_cn_once_token_2 != -1) {
    dispatch_once(&sdkBreakageLog_cn_once_token_2, &__block_literal_global_7_1);
  }
  v2 = (void *)sdkBreakageLog_cn_once_object_2;

  return (OS_os_log *)v2;
}

uint64_t __27__CNLogging_sdkBreakageLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "sdk");
  uint64_t v1 = sdkBreakageLog_cn_once_object_2;
  sdkBreakageLog_cn_once_object_2 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
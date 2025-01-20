@interface CRLogging
+ (OS_os_log)client;
+ (OS_os_log)log;
@end

@implementation CRLogging

+ (OS_os_log)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_4);
  }
  return (OS_os_log *)log_cn_once_object_1;
}

+ (OS_os_log)client
{
  if (client_cn_once_token_2 != -1) {
    dispatch_once(&client_cn_once_token_2, &__block_literal_global_4);
  }
  return (OS_os_log *)client_cn_once_object_2;
}

os_log_t __16__CRLogging_log__block_invoke()
{
  os_log_t result = os_log_create("com.apple.corerecents", "sync");
  log_cn_once_object_1 = (uint64_t)result;
  return result;
}

os_log_t __19__CRLogging_client__block_invoke()
{
  os_log_t result = os_log_create("com.apple.corerecents", "client");
  client_cn_once_object_2 = (uint64_t)result;
  return result;
}

@end
@interface ABSLog
+ (id)apiLog;
+ (id)log;
@end

@implementation ABSLog

+ (id)log
{
  if (log_cn_once_token_0 != -1) {
    dispatch_once(&log_cn_once_token_0, &__block_literal_global_7);
  }
  v2 = (void *)log_cn_once_object_0;

  return v2;
}

uint64_t __13__ABSLog_log__block_invoke()
{
  log_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "addressbook");

  return MEMORY[0x270F9A758]();
}

+ (id)apiLog
{
  if (apiLog_cn_once_token_1 != -1) {
    dispatch_once(&apiLog_cn_once_token_1, &__block_literal_global_11);
  }
  v2 = (void *)apiLog_cn_once_object_1;

  return v2;
}

uint64_t __16__ABSLog_apiLog__block_invoke()
{
  apiLog_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "addressbook-api");

  return MEMORY[0x270F9A758]();
}

@end
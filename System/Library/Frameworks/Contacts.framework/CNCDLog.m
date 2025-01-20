@interface CNCDLog
+ (OS_os_log)saving;
@end

@implementation CNCDLog

+ (OS_os_log)saving
{
  if (saving_cn_once_token_0 != -1) {
    dispatch_once(&saving_cn_once_token_0, &__block_literal_global_141);
  }
  v2 = (void *)saving_cn_once_object_0;

  return (OS_os_log *)v2;
}

uint64_t __17__CNCDLog_saving__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "saving");
  uint64_t v1 = saving_cn_once_object_0;
  saving_cn_once_object_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
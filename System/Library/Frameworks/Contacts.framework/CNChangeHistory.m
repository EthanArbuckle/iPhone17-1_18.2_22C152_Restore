@interface CNChangeHistory
+ (OS_os_log)os_log;
@end

@implementation CNChangeHistory

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_25 != -1) {
    dispatch_once(&os_log_cn_once_token_0_25, &__block_literal_global_145);
  }
  v2 = (void *)os_log_cn_once_object_0_25;

  return (OS_os_log *)v2;
}

uint64_t __25__CNChangeHistory_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "change-history");
  uint64_t v1 = os_log_cn_once_object_0_25;
  os_log_cn_once_object_0_25 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
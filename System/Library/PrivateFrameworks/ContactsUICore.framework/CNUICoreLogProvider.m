@interface CNUICoreLogProvider
+ (OS_os_log)actions_os_log;
+ (OS_os_log)color_os_log;
+ (OS_os_log)corerecents_os_log;
+ (OS_os_log)likenesses_os_log;
+ (OS_os_log)static_identity_os_log;
@end

@implementation CNUICoreLogProvider

+ (OS_os_log)likenesses_os_log
{
  if (likenesses_os_log_cn_once_token_2 != -1) {
    dispatch_once(&likenesses_os_log_cn_once_token_2, &__block_literal_global_4_0);
  }
  v2 = (void *)likenesses_os_log_cn_once_object_2;
  return (OS_os_log *)v2;
}

uint64_t __40__CNUICoreLogProvider_likenesses_os_log__block_invoke()
{
  likenesses_os_log_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts.ui", "likenesses");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)actions_os_log
{
  if (actions_os_log_cn_once_token_1 != -1) {
    dispatch_once(&actions_os_log_cn_once_token_1, &__block_literal_global_47);
  }
  v2 = (void *)actions_os_log_cn_once_object_1;
  return (OS_os_log *)v2;
}

uint64_t __37__CNUICoreLogProvider_actions_os_log__block_invoke()
{
  actions_os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.ui", "actions");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)corerecents_os_log
{
  if (corerecents_os_log_cn_once_token_3 != -1) {
    dispatch_once(&corerecents_os_log_cn_once_token_3, &__block_literal_global_7_0);
  }
  v2 = (void *)corerecents_os_log_cn_once_object_3;
  return (OS_os_log *)v2;
}

uint64_t __41__CNUICoreLogProvider_corerecents_os_log__block_invoke()
{
  corerecents_os_log_cn_once_object_3 = (uint64_t)os_log_create("com.apple.contacts.ui", "core-recents");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)static_identity_os_log
{
  if (static_identity_os_log_cn_once_token_4 != -1) {
    dispatch_once(&static_identity_os_log_cn_once_token_4, &__block_literal_global_10_0);
  }
  v2 = (void *)static_identity_os_log_cn_once_object_4;
  return (OS_os_log *)v2;
}

uint64_t __45__CNUICoreLogProvider_static_identity_os_log__block_invoke()
{
  static_identity_os_log_cn_once_object_4 = (uint64_t)os_log_create("com.apple.contacts.ui", "staticid");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)color_os_log
{
  if (color_os_log_cn_once_token_5 != -1) {
    dispatch_once(&color_os_log_cn_once_token_5, &__block_literal_global_13_0);
  }
  v2 = (void *)color_os_log_cn_once_object_5;
  return (OS_os_log *)v2;
}

uint64_t __35__CNUICoreLogProvider_color_os_log__block_invoke()
{
  color_os_log_cn_once_object_5 = (uint64_t)os_log_create("com.apple.contacts.ui", "color");
  return MEMORY[0x270F9A758]();
}

@end
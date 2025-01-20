@interface MOLogger
+ (OS_os_log)blame;
+ (OS_os_log)effective;
+ (OS_os_log)sandboxing;
+ (OS_os_log)store;
+ (OS_os_log)subscription;
+ (OS_os_log)xpc;
@end

@implementation MOLogger

+ (OS_os_log)store
{
  if (store_onceToken != -1) {
    dispatch_once(&store_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)store_log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)subscription
{
  if (subscription_onceToken != -1) {
    dispatch_once(&subscription_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)subscription_log;
  return (OS_os_log *)v2;
}

uint64_t __24__MOLogger_subscription__block_invoke()
{
  subscription_log = (uint64_t)os_log_create("com.apple.ManagedSettingsObjC", "subscription");
  return MEMORY[0x1F41817F8]();
}

uint64_t __17__MOLogger_store__block_invoke()
{
  store_log = (uint64_t)os_log_create("com.apple.ManagedSettingsObjC", "store");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)effective
{
  if (effective_onceToken != -1) {
    dispatch_once(&effective_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)effective_log;
  return (OS_os_log *)v2;
}

uint64_t __21__MOLogger_effective__block_invoke()
{
  effective_log = (uint64_t)os_log_create("com.apple.ManagedSettingsObjC", "effective");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)blame
{
  if (blame_onceToken != -1) {
    dispatch_once(&blame_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)blame_log;
  return (OS_os_log *)v2;
}

uint64_t __17__MOLogger_blame__block_invoke()
{
  blame_log = (uint64_t)os_log_create("com.apple.ManagedSettingsObjC", "blame");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)sandboxing
{
  if (sandboxing_onceToken != -1) {
    dispatch_once(&sandboxing_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sandboxing_log;
  return (OS_os_log *)v2;
}

uint64_t __22__MOLogger_sandboxing__block_invoke()
{
  sandboxing_log = (uint64_t)os_log_create("com.apple.ManagedSettingsObjC", "sandboxing");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)xpc
{
  if (xpc_onceToken != -1) {
    dispatch_once(&xpc_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)xpc_log;
  return (OS_os_log *)v2;
}

uint64_t __15__MOLogger_xpc__block_invoke()
{
  xpc_log = (uint64_t)os_log_create("com.apple.ManagedSettingsObjC", "xpc");
  return MEMORY[0x1F41817F8]();
}

@end
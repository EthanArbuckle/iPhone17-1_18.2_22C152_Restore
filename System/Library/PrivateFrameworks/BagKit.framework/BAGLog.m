@interface BAGLog
+ (OS_os_log)resourceVending;
@end

@implementation BAGLog

+ (OS_os_log)resourceVending
{
  if (resourceVending_onceToken != -1) {
    dispatch_once(&resourceVending_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)resourceVending___log;

  return (OS_os_log *)v2;
}

uint64_t __25__BAGLog_resourceVending__block_invoke()
{
  resourceVending___log = (uint64_t)os_log_create("com.apple.Registration", "BagKitResourceVending");

  return MEMORY[0x270F9A758]();
}

@end
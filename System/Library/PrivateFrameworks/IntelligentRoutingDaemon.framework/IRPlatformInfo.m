@interface IRPlatformInfo
+ (BOOL)isIOS;
+ (BOOL)isInternalInstall;
+ (BOOL)isRunningInUnitTesting;
+ (BOOL)isSupportedPlatform;
+ (BOOL)isTVOS;
@end

@implementation IRPlatformInfo

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_25);
  }
  return isInternalInstall_sIsInternalInstall;
}

void __35__IRPlatformInfo_isInternalInstall__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [@"com.apple.IntelligentRouting" UTF8String];
  isInternalInstall_sIsInternalInstall = os_variant_has_internal_content();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isInternalInstall_sIsInternalInstall) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "sIsInternalInstall %@", (uint8_t *)&v2, 0xCu);
  }
}

+ (BOOL)isRunningInUnitTesting
{
  if (isRunningInUnitTesting_onceToken != -1) {
    dispatch_once(&isRunningInUnitTesting_onceToken, &__block_literal_global_9_0);
  }
  return 0;
}

+ (BOOL)isTVOS
{
  return 0;
}

+ (BOOL)isSupportedPlatform
{
  return 1;
}

+ (BOOL)isIOS
{
  return 1;
}

@end
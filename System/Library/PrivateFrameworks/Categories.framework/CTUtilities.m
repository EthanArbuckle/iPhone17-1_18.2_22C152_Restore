@interface CTUtilities
+ (BOOL)isClassCLocked;
@end

@implementation CTUtilities

+ (BOOL)isClassCLocked
{
  if (MKBDeviceUnlockedSinceBoot()) {
    return 0;
  }
  v3 = (const void *)MGCopyAnswer();
  BOOL v2 = v3 == (const void *)*MEMORY[0x263EFFB40];
  if (v3)
  {
    CFRelease(v3);
  }
  else
  {
    v4 = +[CTLogging contextKitHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213B5E000, v4, OS_LOG_TYPE_INFO, "No response from MobileGestalt.", v6, 2u);
    }
  }
  return v2;
}

@end
@interface CALNNotificationUtilities
+ (BOOL)shouldBehaveAsRestart;
+ (id)_pathForSentinelFile;
+ (void)createSentinelFileIfNeeded;
@end

@implementation CALNNotificationUtilities

+ (BOOL)shouldBehaveAsRestart
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [a1 _pathForSentinelFile];
  char v5 = [v3 fileExistsAtPath:v4] ^ 1;

  return v5;
}

+ (void)createSentinelFileIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not create sentinel file", v1, 2u);
}

+ (id)_pathForSentinelFile
{
  return @"/tmp/CalNotificationsAvailable";
}

@end
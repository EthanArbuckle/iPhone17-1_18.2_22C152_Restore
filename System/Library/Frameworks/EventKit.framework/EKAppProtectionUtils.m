@interface EKAppProtectionUtils
+ (BOOL)isReminderAppLocked;
+ (id)reminderApApp;
@end

@implementation EKAppProtectionUtils

+ (BOOL)isReminderAppLocked
{
  v2 = [a1 reminderApApp];
  char v3 = [v2 isLocked];

  return v3;
}

+ (id)reminderApApp
{
  if (reminderApApp_onceToken != -1) {
    dispatch_once(&reminderApApp_onceToken, &__block_literal_global_76);
  }
  v2 = (void *)reminderApApp__reminderApApp;

  return v2;
}

uint64_t __37__EKAppProtectionUtils_reminderApApp__block_invoke()
{
  reminderApApp__reminderApApp = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:*MEMORY[0x1E4F57908]];

  return MEMORY[0x1F41817F8]();
}

@end
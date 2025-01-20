@interface CHFeatureFlags
- (BOOL)callHistorySearchEnabled;
- (BOOL)increaseCallHistoryEnabled;
- (BOOL)keepCallsEnabled;
- (BOOL)protectedAppsEnabled;
@end

@implementation CHFeatureFlags

- (BOOL)increaseCallHistoryEnabled
{
  return MEMORY[0x1F40C9FB0]("TelephonyUtilities", "increaseCallHistory");
}

- (BOOL)protectedAppsEnabled
{
  return MEMORY[0x1F40C9FB0]("AppProtection", "protected_apps");
}

- (BOOL)keepCallsEnabled
{
  return MEMORY[0x1F40C9FB0]("TelephonyUtilities", "KeepCalls");
}

- (BOOL)callHistorySearchEnabled
{
  return MEMORY[0x1F40C9FB0]("TelephonyUtilities", "callHistorySearch");
}

@end
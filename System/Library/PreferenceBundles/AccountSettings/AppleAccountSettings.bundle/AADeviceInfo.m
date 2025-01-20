@interface AADeviceInfo
+ (BOOL)aas_hasiCloudSignOutRestriction;
@end

@implementation AADeviceInfo

+ (BOOL)aas_hasiCloudSignOutRestriction
{
  id v2 = objc_alloc_init((Class)DMFiCloudPolicyMonitor);
  id v3 = [v2 iCloudLogoutPolicy];
  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_49034(v3 == 0, v4);
  }

  if (v3) {
    LOBYTE(v5) = 1;
  }
  else {
    BOOL v5 = CFPreferencesGetAppBooleanValue(@"FAFamilyRestrictSignout", @"com.apple.Preferences", 0) != 0;
  }

  return v5;
}

@end
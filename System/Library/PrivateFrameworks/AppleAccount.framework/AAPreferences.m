@interface AAPreferences
+ (BOOL)disableADPStateHealing;
+ (BOOL)isAppleAccountInformationCacheEnabled;
+ (BOOL)isCustomHealthCheckIntervalEnabled;
+ (BOOL)isExperimentalModeEnabled;
+ (BOOL)isHealthCheckTTREnabled;
+ (BOOL)isMomentsDataclassEnabled;
+ (BOOL)isMultipleFullAccountsEnabled;
+ (BOOL)isNeverSkipCustodianCheckEnabled;
+ (BOOL)isRunningInStoreDemoMode;
+ (BOOL)isSignInSecurityRedesignEnabled;
+ (BOOL)isSignInSecurityRedesignMacOSEnabled;
+ (BOOL)isSimulateUnhealthyCustodianEnabled;
+ (BOOL)isSpyglass2023Enabled;
+ (BOOL)isYorktownEnabled;
+ (BOOL)shouldEnableAccountUserNotifications;
+ (BOOL)shouldEnableFastSignIn;
+ (BOOL)shouldShowAccountContacts;
+ (BOOL)shouldSkipIdMSFinalizeCustodian;
+ (BOOL)shouldSkipIdMSKeyUpdate;
+ (BOOL)shouldSkipRecoveryInfoRecordStorage;
+ (BOOL)shouldUseUnifiedLoginEndpoint;
+ (BOOL)simulate2FAFA;
+ (id)getCustodianInfo;
+ (int64_t)customHealthCheckIntervalMinutes;
+ (int64_t)customHealthCheckReachabilityIntervalMinutes;
+ (int64_t)customHealthCheckVersion;
+ (void)isMultipleFullAccountsEnabled;
+ (void)setCustodianInfo:(id)a3;
+ (void)setCustomHealthCheckIntervalEnabled:(BOOL)a3;
+ (void)setCustomHealthCheckIntervalMinutes:(int64_t)a3;
+ (void)setCustomHealthCheckVersion:(int64_t)a3;
+ (void)setCustomHealthFailureReachabilityIntervalMinutes:(int64_t)a3;
+ (void)setDisableADPStateHealing:(BOOL)a3;
+ (void)setExperimentalModeEnabled:(BOOL)a3;
+ (void)setHealthCheckTTREnabled:(BOOL)a3;
+ (void)setMultipleFullAccountsEnabled:(BOOL)a3;
+ (void)setNeverSkipCustodianCheckEnabled:(BOOL)a3;
+ (void)setShouldShowAccountContacts:(BOOL)a3;
+ (void)setShouldUseUnifiedLoginEndpoint:(BOOL)a3;
+ (void)setSimulateUnhealthyCustodianEnabled:(BOOL)a3;
- (BOOL)isLCDeletionChangeCKStatusToDeclinedEnabled;
@end

@implementation AAPreferences

+ (BOOL)isMultipleFullAccountsEnabled
{
  if ([MEMORY[0x1E4F47018] isInternalBuild]) {
    BOOL v2 = CFPreferencesGetAppBooleanValue(@"AAMultipleFullAccounts", @"com.apple.appleaccount", 0) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAPreferences isMultipleFullAccountsEnabled];
  }

  return v2;
}

+ (void)setMultipleFullAccountsEnabled:(BOOL)a3
{
  v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"AAMultipleFullAccounts", v3, @"com.apple.appleaccount");
}

+ (BOOL)shouldUseUnifiedLoginEndpoint
{
  return CFPreferencesGetAppBooleanValue(@"AAUseLegacyLoginEndpoint", @"com.apple.appleaccount", 0) != 1;
}

+ (void)setShouldUseUnifiedLoginEndpoint:(BOOL)a3
{
  v3 = (const void *)[NSNumber numberWithBool:!a3];

  CFPreferencesSetAppValue(@"AAUseLegacyLoginEndpoint", v3, @"com.apple.appleaccount");
}

+ (BOOL)shouldEnableFastSignIn
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldEnableAccountUserNotifications
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldShowAccountContacts
{
  return CFPreferencesGetAppBooleanValue(@"AAShowAccountContacts", @"com.apple.appleaccount", 0) != 0;
}

+ (void)setShouldShowAccountContacts:(BOOL)a3
{
  v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"AAShowAccountContacts", v3, @"com.apple.appleaccount");
}

+ (BOOL)isRunningInStoreDemoMode
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (BOOL)isExperimentalModeEnabled
{
  int v2 = [MEMORY[0x1E4F47018] isInternalBuild];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"AAExperimentalMode", @"com.apple.appleaccount", 0) != 0;
  }
  return v2;
}

+ (void)setExperimentalModeEnabled:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"AAExperimentalMode", v3, @"com.apple.appleaccount");
}

+ (BOOL)isHealthCheckTTREnabled
{
  if (CFPreferencesGetAppBooleanValue(@"AADisableHealthCheckTTR", @"com.apple.appleaccount", 0)) {
    return 0;
  }
  BOOL v3 = (void *)MEMORY[0x1E4F47018];

  return [v3 isInternalBuild];
}

+ (void)setHealthCheckTTREnabled:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:!a3];

  CFPreferencesSetAppValue(@"AADisableHealthCheckTTR", v3, @"com.apple.appleaccount");
}

+ (BOOL)isSimulateUnhealthyCustodianEnabled
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AASimulateUnhealthyCustodian", @"com.apple.appleaccount", 0);
  if (AppBooleanValue)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F47018];
    LOBYTE(AppBooleanValue) = [v3 isInternalBuild];
  }
  return AppBooleanValue;
}

+ (void)setSimulateUnhealthyCustodianEnabled:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"AASimulateUnhealthyCustodian", v3, @"com.apple.appleaccount");
}

+ (BOOL)isCustomHealthCheckIntervalEnabled
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AACustomHealthCheckIntervalEnabled", @"com.apple.appleaccount", 0);
  if (AppBooleanValue)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F47018];
    LOBYTE(AppBooleanValue) = [v3 isInternalBuild];
  }
  return AppBooleanValue;
}

+ (void)setCustomHealthCheckIntervalEnabled:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"AACustomHealthCheckIntervalEnabled", v3, @"com.apple.appleaccount");
}

+ (BOOL)isNeverSkipCustodianCheckEnabled
{
  return CFPreferencesGetAppBooleanValue(@"AANeverSkipCustodianCheck", @"com.apple.appleaccount", 0) != 0;
}

+ (void)setNeverSkipCustodianCheckEnabled:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"AANeverSkipCustodianCheck", v3, @"com.apple.appleaccount");
}

+ (int64_t)customHealthCheckIntervalMinutes
{
  return CFPreferencesGetAppIntegerValue(@"AACustomHealthCheckIntervalMinutes", @"com.apple.appleaccount", 0);
}

+ (void)setCustomHealthCheckIntervalMinutes:(int64_t)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithInteger:a3];

  CFPreferencesSetAppValue(@"AACustomHealthCheckIntervalMinutes", v3, @"com.apple.appleaccount");
}

+ (int64_t)customHealthCheckReachabilityIntervalMinutes
{
  return CFPreferencesGetAppIntegerValue(@"AACustomHealthCheckReachabilityIntervalMinutes", @"com.apple.appleaccount", 0);
}

+ (void)setCustomHealthFailureReachabilityIntervalMinutes:(int64_t)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithInteger:a3];

  CFPreferencesSetAppValue(@"AACustomHealthCheckReachabilityIntervalMinutes", v3, @"com.apple.appleaccount");
}

+ (int64_t)customHealthCheckVersion
{
  return CFPreferencesGetAppIntegerValue(@"AACustomHealthCheckversion", @"com.apple.appleaccount", 0);
}

+ (void)setCustomHealthCheckVersion:(int64_t)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithInteger:a3];

  CFPreferencesSetAppValue(@"AACustomHealthCheckversion", v3, @"com.apple.appleaccount");
}

+ (BOOL)isYorktownEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSpyglass2023Enabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMomentsDataclassEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAppleAccountInformationCacheEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSignInSecurityRedesignEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSignInSecurityRedesignMacOSEnabled
{
  return 0;
}

- (BOOL)isLCDeletionChangeCKStatusToDeclinedEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldSkipIdMSKeyUpdate
{
  int v2 = [MEMORY[0x1E4F47018] isInternalBuild];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"AASkipIdMSKeyUpdate", @"com.apple.appleaccount", 0) != 0;
  }
  return v2;
}

+ (BOOL)shouldSkipIdMSFinalizeCustodian
{
  int v2 = [MEMORY[0x1E4F47018] isInternalBuild];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"AASkipIdMSFinalizeCustodian", @"com.apple.appleaccount", 0) != 0;
  }
  return v2;
}

+ (BOOL)shouldSkipRecoveryInfoRecordStorage
{
  int v2 = [MEMORY[0x1E4F47018] isInternalBuild];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"AASkipRecoveryInfoRecordStorage", @"com.apple.appleaccount", 0) != 0;
  }
  return v2;
}

+ (void)setCustodianInfo:(id)a3
{
  CFPreferencesSetAppValue(@"AACustodianInfo", a3, @"com.apple.appleaccount");
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];

  CFPreferencesSynchronize(@"com.apple.appleaccount", v3, v4);
}

+ (id)getCustodianInfo
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.appleaccount", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFStringRef v4 = (void *)CFPreferencesCopyValue(@"AACustodianInfo", @"com.apple.appleaccount", v2, v3);

  return v4;
}

+ (BOOL)simulate2FAFA
{
  int v2 = [MEMORY[0x1E4F47018] isInternalBuild];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"AASimulate2FAFA", @"com.apple.appleaccount", 0) != 0;
  }
  return v2;
}

+ (BOOL)disableADPStateHealing
{
  BOOL v2 = +[AADeviceInfo isInternalBuild];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"disableWalrusStatusMismatchDetectionEnabled", @"com.apple.appleaccount", 0) != 0;
  }
  return v2;
}

+ (void)setDisableADPStateHealing:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[AADeviceInfo isInternalBuild])
  {
    CFPreferencesSetAppValue(@"disableWalrusStatusMismatchDetectionEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.appleaccount");
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPreferencesSynchronize(@"com.apple.appleaccount", v4, v5);
  }
}

+ (void)isMultipleFullAccountsEnabled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v2 = @"NO";
  if (a1) {
    BOOL v2 = @"YES";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "AAPreferences: Multiple full accounts are enabled on this platform: %@", (uint8_t *)&v3, 0xCu);
}

@end
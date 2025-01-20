@interface AAUIFeatureFlags
+ (BOOL)isAccountDataclassListRedesignEnabled;
+ (BOOL)isConvertToMAIDEnabled;
+ (BOOL)isLCInviteAcceptanceEnabled;
+ (BOOL)isNewSignInProgressEnabled;
+ (BOOL)isPrintableSummaryEnabled;
+ (BOOL)isRecoveryContactUpsellTipEnabled;
+ (BOOL)isShowDataclassDetailFromAppsEnabled;
+ (BOOL)isSignInSecurityRedesignEnabled;
+ (BOOL)isSignInSecurityRedesignMacOSEnabled;
+ (BOOL)isTobleroneEnabled;
+ (void)isAccountDataclassListRedesignEnabled;
+ (void)isConvertToMAIDEnabled;
+ (void)isNewSignInProgressEnabled;
+ (void)isPrintableSummaryEnabled;
+ (void)isRecoveryContactUpsellTipEnabled;
+ (void)isShowDataclassDetailFromAppsEnabled;
+ (void)isSignInSecurityRedesignEnabled;
+ (void)isSignInSecurityRedesignMacOSEnabled;
@end

@implementation AAUIFeatureFlags

+ (BOOL)isTobleroneEnabled
{
  v2 = [MEMORY[0x263F3C090] shared];
  v3 = [v2 stateForFeature:@"Toblerone" domain:@"AppleAccountUI"];

  if (v3) {
    BOOL v4 = [v3 value] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)isNewSignInProgressEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isNewSignInProgressEnabled]();
  }

  return v2;
}

+ (BOOL)isLCInviteAcceptanceEnabled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v2 = [MEMORY[0x263F29270] sharedBag];
  v3 = [v2 configurationAtKey:@"inheritanceCfgs"];

  BOOL v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: inheritanceCfgs from urlbag: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"inviteAcceptance"];
  if (v5)
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "LCInvite: Returning LCInviteAcceptance from urlbag: %@", (uint8_t *)&v9, 0xCu);
    }

    LOBYTE(v6) = [v5 BOOLValue];
  }
  else
  {
    LODWORD(v6) = _os_feature_enabled_impl();
    v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      LODWORD(v10) = v6;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "LCInvite: No IdMS feature flag found. is OS FeatureFlag Enabled %d", (uint8_t *)&v9, 8u);
    }
  }
  return (char)v6;
}

+ (BOOL)isPrintableSummaryEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isPrintableSummaryEnabled]();
  }

  return v2;
}

+ (BOOL)isConvertToMAIDEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isConvertToMAIDEnabled]();
  }

  return v2;
}

+ (BOOL)isAccountDataclassListRedesignEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isAccountDataclassListRedesignEnabled]();
  }

  return v2;
}

+ (BOOL)isSignInSecurityRedesignEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isSignInSecurityRedesignEnabled]();
  }

  return v2;
}

+ (BOOL)isSignInSecurityRedesignMacOSEnabled
{
  char v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isSignInSecurityRedesignMacOSEnabled](v2);
  }

  return 0;
}

+ (BOOL)isRecoveryContactUpsellTipEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isRecoveryContactUpsellTipEnabled]();
  }

  return v2;
}

+ (BOOL)isShowDataclassDetailFromAppsEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[AAUIFeatureFlags isShowDataclassDetailFromAppsEnabled]();
  }

  return v2;
}

+ (void)isNewSignInProgressEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AppleAccountUI/AppleIDSignInProgress=%d", v2, v3, v4, v5, v6);
}

+ (void)isPrintableSummaryEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AppleAccountUI/PrintableAccountRecoverySummary=%d", v2, v3, v4, v5, v6);
}

+ (void)isConvertToMAIDEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AppleAccountUI/ConvertToMAID=%d", v2, v3, v4, v5, v6);
}

+ (void)isAccountDataclassListRedesignEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AppleAccountUI/AccountDataclassListRedesign=%d", v2, v3, v4, v5, v6);
}

+ (void)isSignInSecurityRedesignEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AuthKit/SignInSecurityRedesign=%d", v2, v3, v4, v5, v6);
}

+ (void)isSignInSecurityRedesignMacOSEnabled
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "AuthKit/SignInSecurityRedesign is disabled.", v1, 2u);
}

+ (void)isRecoveryContactUpsellTipEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AppleAccountUI/RecoveryContactUpsellTip=%d", v2, v3, v4, v5, v6);
}

+ (void)isShowDataclassDetailFromAppsEnabled
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4(&dword_209754000, v0, v1, "AppleAccountUI/ShowDataclassDetailFromApps=%d", v2, v3, v4, v5, v6);
}

@end
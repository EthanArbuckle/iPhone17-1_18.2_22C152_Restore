@interface AACloudPolicyRestrictions
+ (BOOL)policyRestrictsDataclass:(id)a3;
+ (id)_managedIcloudPolicyIdentifierForDataclass;
+ (id)_policyRestrictionIdentifierForDataclass:(id)a3;
@end

@implementation AACloudPolicyRestrictions

+ (id)_managedIcloudPolicyIdentifierForDataclass
{
  if (_managedIcloudPolicyIdentifierForDataclass_onceToken != -1) {
    dispatch_once(&_managedIcloudPolicyIdentifierForDataclass_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_managedIcloudPolicyIdentifierForDataclass_iCloudPolicyIdentifiersDictionary;

  return v2;
}

void __71__AACloudPolicyRestrictions__managedIcloudPolicyIdentifierForDataclass__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v0 setObject:@"DisableBookmarksiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17530]];
  [v0 setObject:@"DisableFMMiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17588]];
  [v0 setObject:@"DisableAddressBookiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17578]];
  [v0 setObject:@"DisableCalendariCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17568]];
  [v0 setObject:@"DisableMailiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F175C8]];
  [v0 setObject:@"DisableNotesiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F175F0]];
  [v0 setObject:@"DisableRemindersiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17610]];
  [v0 setObject:@"DisableKeychainCloudSync" forKeyedSubscript:*MEMORY[0x1E4F175C0]];
  [v0 setObject:@"DisableCloudSync" forKeyedSubscript:*MEMORY[0x1E4F17640]];
  [v0 setObject:@"DisablePhotosiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17600]];
  [v0 setObject:@"DisableFreeformiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F17598]];
  [v0 setObject:@"DisableImagePlaygroundiCloudSetting" forKeyedSubscript:*MEMORY[0x1E4F175B0]];
  v1 = (void *)_managedIcloudPolicyIdentifierForDataclass_iCloudPolicyIdentifiersDictionary;
  _managedIcloudPolicyIdentifierForDataclass_iCloudPolicyIdentifiersDictionary = (uint64_t)v0;
}

+ (id)_policyRestrictionIdentifierForDataclass:(id)a3
{
  id v3 = a3;
  v4 = +[AACloudPolicyRestrictions _managedIcloudPolicyIdentifierForDataclass];
  v5 = [v4 objectForKey:v3];

  return v5;
}

+ (BOOL)policyRestrictsDataclass:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = +[AACloudPolicyRestrictions _policyRestrictionIdentifierForDataclass:v3];
  v5 = (__CFString *)v4;
  if (v4)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v4, @"com.apple.icloud.managed", 0);
    BOOL v7 = AppBooleanValue != 0;
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[AACloudPolicyRestrictions policyRestrictsDataclass:v8];
    }
  }
  else
  {
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[AACloudPolicyRestrictions policyRestrictsDataclass:]((uint64_t)v3, v8);
    }
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)policyRestrictsDataclass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "Policy identifier does not exist for %@", (uint8_t *)&v2, 0xCu);
}

+ (void)policyRestrictsDataclass:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"YES";
  if ((a2 & 1) == 0) {
    uint64_t v3 = @"NO";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  BOOL v7 = v3;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Policy restriction for %@ is %@", (uint8_t *)&v4, 0x16u);
}

@end
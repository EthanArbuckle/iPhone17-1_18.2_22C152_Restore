@interface AACloudPolicyRestrictions
+ (BOOL)policyRestrictsDataclass:(id)a3;
+ (id)_managedIcloudPolicyIdentifierForDataclass;
+ (id)_policyRestrictionIdentifierForDataclass:(id)a3;
@end

@implementation AACloudPolicyRestrictions

+ (id)_managedIcloudPolicyIdentifierForDataclass
{
  if (qword_268C87D60 != -1) {
    dispatch_once(&qword_268C87D60, &unk_26F49FC70);
  }
  v2 = (void *)qword_268C87D58;
  return v2;
}

+ (id)_policyRestrictionIdentifierForDataclass:(id)a3
{
  id v3 = a3;
  v6 = objc_msgSend__managedIcloudPolicyIdentifierForDataclass(AACloudPolicyRestrictions, v4, v5);
  v8 = objc_msgSend_objectForKey_(v6, v7, (uint64_t)v3);

  return v8;
}

+ (BOOL)policyRestrictsDataclass:(id)a3
{
  id v3 = a3;
  objc_msgSend__policyRestrictionIdentifierForDataclass_(AACloudPolicyRestrictions, v4, (uint64_t)v3);
  CFStringRef v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v5;
  if (v5)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, @"com.apple.icloud.managed", 0);
    BOOL v8 = AppBooleanValue != 0;
    v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_24053A78C((uint64_t)v3, AppBooleanValue != 0, v9);
    }
  }
  else
  {
    v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_24053A714((uint64_t)v3, v9);
    }
    BOOL v8 = 0;
  }

  return v8;
}

@end
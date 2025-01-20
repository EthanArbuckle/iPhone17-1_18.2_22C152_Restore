@interface CNSensitiveContentUIEntitlementVerifier
+ (id)log;
- (BOOL)canShowSensitiveContentUI;
- (BOOL)processCanReadCommunicationSafetySettings;
- (BOOL)processHasCommunicationFilterEntitlements;
- (BOOL)processHasScreentimeEntitlements;
- (BOOL)processHasUserSafetyEntitlements;
- (CNEntitlementVerifier)entitlementVerifier;
- (CNSensitiveContentUIEntitlementVerifier)init;
- (void)setEntitlementVerifier:(id)a3;
@end

@implementation CNSensitiveContentUIEntitlementVerifier

- (void).cxx_destruct
{
}

- (void)setEntitlementVerifier:(id)a3
{
}

- (CNEntitlementVerifier)entitlementVerifier
{
  return self->_entitlementVerifier;
}

- (BOOL)canShowSensitiveContentUI
{
  if ([(CNSensitiveContentUIEntitlementVerifier *)self processHasScreentimeEntitlements]&& [(CNSensitiveContentUIEntitlementVerifier *)self processCanReadCommunicationSafetySettings]&& [(CNSensitiveContentUIEntitlementVerifier *)self processHasUserSafetyEntitlements])
  {
    return 1;
  }
  v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "Unable to show sensitive content UI, process is not correctly entitled", v5, 2u);
  }

  return 0;
}

- (BOOL)processHasUserSafetyEntitlements
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CNSensitiveContentUIEntitlementVerifier *)self entitlementVerifier];
  v8[0] = @"com.apple.developer.usersafety.client";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  char v4 = [v2 currentProcessHasArrayWithStringValue:@"analysis" forAnyEntitlement:v3 error:0];

  if ((v4 & 1) == 0)
  {
    v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Missing user saftey entitlements", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)processHasCommunicationFilterEntitlements
{
  v2 = [(CNSensitiveContentUIEntitlementVerifier *)self entitlementVerifier];
  char v3 = [v2 currentProcessHasBooleanEntitlement:@"com.apple.private.communicationsfilter" error:0];

  if ((v3 & 1) == 0)
  {
    char v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Missing communcation filter entitlements", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)processCanReadCommunicationSafetySettings
{
  v2 = [(CNSensitiveContentUIEntitlementVerifier *)self entitlementVerifier];
  char v3 = [v2 currentProcessHasArrayWithStringValue:@"com.apple.communicationSafetySettings" forAnyEntitlement:&unk_1ED915AD0 error:0];

  if ((v3 & 1) == 0)
  {
    char v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Missing shared preference access for communication safety settings", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)processHasScreentimeEntitlements
{
  char v3 = [(CNSensitiveContentUIEntitlementVerifier *)self entitlementVerifier];
  int v4 = [v3 currentProcessHasBooleanEntitlement:@"com.apple.private.screentime-communication" error:0];

  v5 = [(CNSensitiveContentUIEntitlementVerifier *)self entitlementVerifier];
  int v6 = v4 & [v5 currentProcessHasArrayWithStringValue:@"com.apple.ScreenTimeAgent.communication" forAnyEntitlement:&unk_1ED915AB8 error:0];

  if ((v6 & 1) == 0)
  {
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEBUG, "Missing screentime entitlements", v9, 2u);
    }
  }
  return v6;
}

- (CNSensitiveContentUIEntitlementVerifier)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNSensitiveContentUIEntitlementVerifier;
  v2 = [(CNSensitiveContentUIEntitlementVerifier *)&v7 init];
  if (v2)
  {
    char v3 = (CNEntitlementVerifier *)objc_alloc_init(MEMORY[0x1E4F5A3D0]);
    entitlementVerifier = v2->_entitlementVerifier;
    v2->_entitlementVerifier = v3;

    v5 = v2;
  }

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_1_21486 != -1) {
    dispatch_once(&log_cn_once_token_1_21486, &__block_literal_global_21487);
  }
  v2 = (void *)log_cn_once_object_1_21488;

  return v2;
}

void __46__CNSensitiveContentUIEntitlementVerifier_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNSensitiveContentUIEntitlementVerifier");
  v1 = (void *)log_cn_once_object_1_21488;
  log_cn_once_object_1_21488 = (uint64_t)v0;
}

@end
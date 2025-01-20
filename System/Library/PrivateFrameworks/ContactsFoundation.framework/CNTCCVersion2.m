@interface CNTCCVersion2
+ (id)bundleIdentifierForIdentity:(id)a3;
+ (id)os_log;
- (BOOL)isAuthorizationRestricted;
- (BOOL)isUnitTesting;
- (BOOL)shouldRepromptUponForegrounding;
- (CNTCCVersion2)init;
- (NSNumber)isUnitTestingCachedValue;
- (NSNumber)simulateStatus;
- (OS_tcc_credential)cachedCredentialForReprompt;
- (OS_tcc_message_options)cachedMessagesForReprompt;
- (OS_tcc_message_options)messageOptionsForAsyncPrompt;
- (OS_tcc_message_options)messageOptionsForSyncNoPrompt;
- (OS_tcc_server)server;
- (OS_tcc_service)service;
- (id)authorizationRecordForBundleIdentifier:(id)a3;
- (id)authorizationRecords;
- (id)bundleIdentifierForAuditToken:(id)a3 assumedIdentity:(id)a4;
- (id)cachedCallbackForReprompt;
- (id)credentialForAuditToken:(id)a3 assumedIdentity:(id)a4;
- (id)isUnitTestingImpl;
- (int64_t)checkAuthorizationStatusOfAuditToken:(id)a3 assumedIdentity:(id)a4;
- (int64_t)checkAuthorizationStatusOfCurrentProcess;
- (int64_t)checkAuthorizationStatusOfCurrentProcessUsingAssumedIdentity:(id)a3;
- (void)appWillGoForeground:(id)a3;
- (void)requestAuthorization:(int64_t)a3 auditToken:(id)a4 assumedIdentity:(id)a5 completionHandler:(id)a6;
- (void)requestAuthorizationWithCredential:(id)a3 messageOptions:(id)a4 completionHandler:(id)a5;
- (void)saveAuthorizationRecord:(id)a3;
- (void)saveAuthorizationRecord:(id)a3 dontKillApp:(BOOL)a4;
- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5;
- (void)setCachedCallbackForReprompt:(id)a3;
- (void)setCachedCredentialForReprompt:(id)a3;
- (void)setIsUnitTestingCachedValue:(id)a3;
- (void)setShouldRepromptUponForegrounding:(BOOL)a3;
- (void)setSimulateStatus:(id)a3;
- (void)simulateStatus:(int64_t)a3;
- (void)stopSimulation;
@end

@implementation CNTCCVersion2

id __30__CNTCCVersion2_isUnitTesting__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[7];
  if (!v3)
  {
    uint64_t v4 = [v2 isUnitTestingImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }

  return v3;
}

- (CNTCCVersion2)init
{
  v14.receiver = self;
  v14.super_class = (Class)CNTCCVersion2;
  v2 = [(CNTCCVersion2 *)&v14 init];
  if (v2)
  {
    uint64_t v3 = tcc_server_create();
    server = v2->_server;
    v2->_server = (OS_tcc_server *)v3;

    uint64_t v5 = tcc_service_singleton_for_CF_name();
    service = v2->_service;
    v2->_service = (OS_tcc_service *)v5;

    uint64_t v7 = tcc_message_options_create();
    messageOptionsForSyncNoPrompt = v2->_messageOptionsForSyncNoPrompt;
    v2->_messageOptionsForSyncNoPrompt = (OS_tcc_message_options *)v7;

    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_policy();
    uint64_t v9 = tcc_message_options_create();
    messageOptionsForAsyncPrompt = v2->_messageOptionsForAsyncPrompt;
    v2->_messageOptionsForAsyncPrompt = (OS_tcc_message_options *)v9;

    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_rights_mask();
    v2->_shouldRepromptUponForegrounding = 0;
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel_appWillGoForeground_ name:@"UIApplicationDidBecomeActiveNotification" object:0];

    v12 = v2;
  }

  return v2;
}

- (id)isUnitTestingImpl
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 executablePath];

  if (([v3 hasSuffix:@"CNTestsHostiOS"] & 1) != 0
    || ([v3 hasSuffix:@"CNTestsHostiOS_XPC"] & 1) != 0
    || ([v3 hasSuffix:@"otest"] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v3 hasSuffix:@"xctest"];
  }
  uint64_t v5 = [NSNumber numberWithBool:v4];

  return v5;
}

+ (id)bundleIdentifierForIdentity:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v3 stringWithUTF8String:tcc_identity_get_identifier()];
  uint64_t type = tcc_identity_get_type();

  if (type)
  {
    uint64_t v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CNTCCVersion2 bundleIdentifierForIdentity:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    id v14 = 0;
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

- (void)appWillGoForeground:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = +[CNEnvironmentBase currentEnvironment];
  uint64_t v5 = [v4 featureFlags];
  int v6 = [v5 isFeatureEnabled:20];

  if (v6)
  {
    uint64_t v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = [(CNTCCVersion2 *)self shouldRepromptUponForegrounding];
      _os_log_impl(&dword_19091D000, v7, OS_LOG_TYPE_DEFAULT, "CNTCCVersion2, app is coming into the foreground. reprompt? %d", (uint8_t *)v11, 8u);
    }

    if ([(CNTCCVersion2 *)self shouldRepromptUponForegrounding])
    {
      self->_shouldRepromptUponForegrounding = 0;
      uint64_t v8 = [(CNTCCVersion2 *)self cachedCredentialForReprompt];
      uint64_t v9 = [(CNTCCVersion2 *)self cachedMessagesForReprompt];
      uint64_t v10 = [(CNTCCVersion2 *)self cachedCallbackForReprompt];
      [(CNTCCVersion2 *)self requestAuthorizationWithCredential:v8 messageOptions:v9 completionHandler:v10];
    }
  }
}

- (BOOL)shouldRepromptUponForegrounding
{
  return self->_shouldRepromptUponForegrounding;
}

uint64_t __85__CNTCCVersion2_requestAuthorizationWithCredential_messageOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __85__CNTCCVersion2_requestAuthorizationWithCredential_messageOptions_completionHandler___block_invoke_cold_1(a3, v5, v6, v7, v8, v9, v10, v11);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    int64_t v13 = +[CNTCCAppAuthorizationRecord authorizationStatusFromAuthorizationRight:tcc_authorization_record_get_authorization_right()];
    id v14 = +[CNEnvironmentBase currentEnvironment];
    v15 = [v14 featureFlags];
    int v16 = [v15 isFeatureEnabled:20];

    if (v16) {
      BOOL v17 = (v13 & 0xFFFFFFFFFFFFFFFBLL) == 0;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
      v18 = _Block_copy(*(const void **)(a1 + 56));
      uint64_t v19 = *(void *)(a1 + 32);
      v20 = *(void **)(v19 + 72);
      *(void *)(v19 + 72) = v18;

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 48));
    }
    v21 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v21();
  }
}

- (int64_t)checkAuthorizationStatusOfAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNTCCVersion2 *)self simulateStatus];

  if (v8)
  {
    uint64_t v9 = [(CNTCCVersion2 *)self simulateStatus];
    int64_t v10 = [v9 integerValue];
  }
  else
  {
    if ([(CNTCCVersion2 *)self isUnitTesting])
    {
      int64_t v10 = 3;
      goto LABEL_4;
    }
    uint64_t v9 = [(CNTCCVersion2 *)self credentialForAuditToken:v6 assumedIdentity:v7];
    if (v9)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      uint64_t v12 = [(CNTCCVersion2 *)self messageOptionsForSyncNoPrompt];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __70__CNTCCVersion2_checkAuthorizationStatusOfAuditToken_assumedIdentity___block_invoke;
      v13[3] = &unk_1E56A1118;
      v13[4] = &v14;
      [(CNTCCVersion2 *)self requestAuthorizationWithCredential:v9 messageOptions:v12 completionHandler:v13];

      int64_t v10 = v15[3];
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      int64_t v10 = 0;
    }
  }

LABEL_4:
  return v10;
}

- (BOOL)isAuthorizationRestricted
{
  uint64_t v3 = [(CNTCCVersion2 *)self simulateStatus];

  return !v3 && ![(CNTCCVersion2 *)self isUnitTesting] && TCCAccessRestricted() != 0;
}

- (BOOL)isUnitTesting
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CNTCCVersion2_isUnitTesting__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)simulateStatus
{
  return self->_simulateStatus;
}

- (void)requestAuthorizationWithCredential:(id)a3 messageOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CNTCCVersion2 *)self server];
  uint64_t v12 = [(CNTCCVersion2 *)self service];
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  tcc_server_message_request_authorization();
}

- (OS_tcc_service)service
{
  return self->_service;
}

- (OS_tcc_server)server
{
  return self->_server;
}

- (OS_tcc_message_options)messageOptionsForSyncNoPrompt
{
  return self->_messageOptionsForSyncNoPrompt;
}

- (id)credentialForAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "audit_token");
    uint64_t v8 = tcc_credential_create_for_process_with_audit_token_and_assumed_identity();
  }
  else if (v5)
  {
    objc_msgSend(v5, "audit_token");
    uint64_t v8 = tcc_credential_create_for_process_with_audit_token();
  }
  else if (v6)
  {
    uint64_t v8 = tcc_credential_create_for_self_with_assumed_identity();
  }
  else
  {
    uint64_t v8 = tcc_credential_singleton_for_self();
  }
  id v9 = (void *)v8;

  return v9;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_8 != -1) {
    dispatch_once(&os_log_cn_once_token_1_8, &__block_literal_global_45);
  }
  v2 = (void *)os_log_cn_once_object_1_8;

  return v2;
}

uint64_t __70__CNTCCVersion2_checkAuthorizationStatusOfAuditToken_assumedIdentity___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __23__CNTCCVersion2_os_log__block_invoke()
{
  os_log_cn_once_object_1_8 = (uint64_t)os_log_create("com.apple.contacts", "CNTCCVersion2");

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMessagesForReprompt, 0);
  objc_storeStrong(&self->_cachedCallbackForReprompt, 0);
  objc_storeStrong((id *)&self->_cachedCredentialForReprompt, 0);
  objc_storeStrong((id *)&self->_isUnitTestingCachedValue, 0);
  objc_storeStrong((id *)&self->_simulateStatus, 0);
  objc_storeStrong((id *)&self->_messageOptionsForAsyncPrompt, 0);
  objc_storeStrong((id *)&self->_messageOptionsForSyncNoPrompt, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (int64_t)checkAuthorizationStatusOfCurrentProcess
{
  return [(CNTCCVersion2 *)self checkAuthorizationStatusOfAuditToken:0 assumedIdentity:0];
}

- (int64_t)checkAuthorizationStatusOfCurrentProcessUsingAssumedIdentity:(id)a3
{
  return [(CNTCCVersion2 *)self checkAuthorizationStatusOfAuditToken:0 assumedIdentity:a3];
}

- (void)requestAuthorization:(int64_t)a3 auditToken:(id)a4 assumedIdentity:(id)a5 completionHandler:(id)a6
{
  id v15 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = [(CNTCCVersion2 *)self simulateStatus];

  if (v11)
  {
    uint64_t v12 = [(CNTCCVersion2 *)self simulateStatus];
    v10[2](v10, [v12 integerValue]);
  }
  else if ([(CNTCCVersion2 *)self isUnitTesting])
  {
    v10[2](v10, 3);
  }
  else
  {
    id v13 = [(CNTCCVersion2 *)self credentialForAuditToken:v15 assumedIdentity:v9];
    if (v13)
    {
      id v14 = [(CNTCCVersion2 *)self messageOptionsForAsyncPrompt];
      [(CNTCCVersion2 *)self requestAuthorizationWithCredential:v13 messageOptions:v14 completionHandler:v10];
    }
    else
    {
      v10[2](v10, 0);
    }
  }
}

- (id)bundleIdentifierForAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNTCCVersion2 *)self credentialForAuditToken:v6 assumedIdentity:v7];
  if (v8)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    id v19 = 0;
    id v9 = [(CNTCCVersion2 *)self server];
    id v10 = [(CNTCCVersion2 *)self messageOptionsForSyncNoPrompt];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    tcc_server_message_get_identity_for_credential();

    if (v15[5])
    {
      uint64_t v11 = objc_msgSend((id)objc_opt_class(), "bundleIdentifierForIdentity:", v15[5], v13, 3221225472, __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke, &unk_1E56A1168, self, &v14);
    }
    else
    {
      uint64_t v11 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    id v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke_cold_1(a3, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)authorizationRecords
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CNTCCVersion2 *)self server];
  id v5 = [(CNTCCVersion2 *)self messageOptionsForSyncNoPrompt];
  id v6 = [(CNTCCVersion2 *)self service];
  id v8 = v3;
  tcc_server_message_get_authorization_records_by_service();

  return v8;
}

void __37__CNTCCVersion2_authorizationRecords__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [[CNTCCAppAuthorizationRecord alloc] initWithTCCAuthorizationRecord:v3];

    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)authorizationRecordForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNTCCVersion2 *)self authorizationRecords];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CNTCCVersion2_authorizationRecordForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E56A11B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __56__CNTCCVersion2_authorizationRecordForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)saveAuthorizationRecord:(id)a3
{
}

- (void)saveAuthorizationRecord:(id)a3 dontKillApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 authorizationStatus];
  id v8 = [v6 bundleIdentifier];

  [(CNTCCVersion2 *)self setAuthorizationStatus:v7 forBundleIdentifier:v8 noKillApp:v4];
}

- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5
{
  BOOL v5 = a5;
  [a4 UTF8String];
  id v11 = (id)tcc_identity_create();
  +[CNTCCAppAuthorizationRecord authorizationRightFromAuthorizationStatus:a3];
  id v8 = [(CNTCCVersion2 *)self messageOptionsForSyncNoPrompt];
  if (v5) {
    tcc_message_options_set_nokill_policy();
  }
  uint64_t v9 = [(CNTCCVersion2 *)self server];
  id v10 = [(CNTCCVersion2 *)self service];
  tcc_server_message_set_authorization_value();
}

- (void)simulateStatus:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(CNTCCVersion2 *)self setSimulateStatus:v4];
}

- (void)stopSimulation
{
}

- (OS_tcc_message_options)messageOptionsForAsyncPrompt
{
  return self->_messageOptionsForAsyncPrompt;
}

- (void)setSimulateStatus:(id)a3
{
}

- (NSNumber)isUnitTestingCachedValue
{
  return self->_isUnitTestingCachedValue;
}

- (void)setIsUnitTestingCachedValue:(id)a3
{
}

- (void)setShouldRepromptUponForegrounding:(BOOL)a3
{
  self->_shouldRepromptUponForegrounding = a3;
}

- (OS_tcc_credential)cachedCredentialForReprompt
{
  return self->_cachedCredentialForReprompt;
}

- (void)setCachedCredentialForReprompt:(id)a3
{
}

- (id)cachedCallbackForReprompt
{
  return self->_cachedCallbackForReprompt;
}

- (void)setCachedCallbackForReprompt:(id)a3
{
}

- (OS_tcc_message_options)cachedMessagesForReprompt
{
  return self->_cachedMessagesForReprompt;
}

void __85__CNTCCVersion2_requestAuthorizationWithCredential_messageOptions_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)bundleIdentifierForIdentity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
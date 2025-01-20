@interface AKAppleIDAuthenticationController
+ (NSSet)sensitiveAuthenticationKeys;
+ (NSSet)sensitiveTokenKeys;
+ (NSSet)sensitiveTokenKeysForFullRedaction;
+ (NSSet)tokenDictionaryKeys;
- (AKAppleIDAuthenticationController)init;
- (AKAppleIDAuthenticationController)initWithDaemonXPCEndpoint:(id)a3;
- (AKAppleIDAuthenticationController)initWithIdentifier:(id)a3;
- (AKAppleIDAuthenticationController)initWithIdentifier:(id)a3 daemonXPCEndpoint:(id)a4;
- (AKAppleIDAuthenticationDelegate)delegate;
- (BOOL)deleteAuthorizationDatabaseWithAltDSID:(id)a3 error:(id *)a4;
- (BOOL)isDevicePasscodeProtected:(id *)a3;
- (BOOL)performEdpCompleteKeyDropWithAltDSID:(id)a3 error:(id *)a4;
- (BOOL)performEdpMigrationWithAltDSID:(id)a3 error:(id *)a4;
- (BOOL)performRemoveEdpTokenWithAltDSID:(id)a3 error:(id *)a4;
- (BOOL)revokeAuthorizationForApplicationWithClientID:(id)a3 error:(id *)a4;
- (BOOL)synchronizeFollowUpItemsForContext:(id)a3 error:(id *)a4;
- (id)_authenticationServiceConnection;
- (id)_serverFriendlyUsername:(id)a3;
- (id)_urlBagFromCache:(BOOL)a3 altDSID:(id)a4 withError:(id *)a5;
- (id)accountNamesForAltDSID:(id)a3;
- (id)activeLoginCode:(id *)a3;
- (id)deallocHandler;
- (id)deviceListWithContext:(id)a3 error:(id *)a4;
- (id)fetchAuthorizedAppListWithContext:(id)a3 error:(id *)a4;
- (void)authenticateWithContext:(id)a3 completion:(id)a4;
- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)clearSessionCacheWithCompletion:(id)a3;
- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteDeviceListCacheWithCompletion:(id)a3;
- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4;
- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5;
- (void)deviceListWithContext:(id)a3 completion:(id)a4;
- (void)endProximityAuthenticationForContext:(id)a3 completion:(id)a4;
- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4;
- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchDeviceListWithContext:(id)a3 completion:(id)a4;
- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4;
- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5;
- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5;
- (void)generateLoginCodeWithCompletion:(id)a3;
- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4;
- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)getUserInformationWithContext:(id)a3 completion:(id)a4;
- (void)isCreateAppleIDAllowedWithCompletion:(id)a3;
- (void)performCheckInForAccountWithAltDSID:(id)a3 completion:(id)a4;
- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5;
- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4;
- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4;
- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4;
- (void)persistMasterKeyVerifier:(id)a3 context:(id)a4 completion:(id)a5;
- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5;
- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3;
- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5;
- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5;
- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5;
- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6;
- (void)setDeallocHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4;
- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5;
- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5;
- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 completion:(id)a5;
- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)verifyMasterKey:(id)a3 context:(id)a4 completion:(id)a5;
- (void)warmUpVerificationSessionWithCompletion:(id)a3;
@end

@implementation AKAppleIDAuthenticationController

- (AKAppleIDAuthenticationController)initWithIdentifier:(id)a3 daemonXPCEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKAppleIDAuthenticationController;
  v8 = [(AKAppleIDAuthenticationController *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    serviceID = v8->_serviceID;
    v8->_serviceID = (NSString *)v9;

    v11 = [[AKAppleIDAuthenticationContextManager alloc] initWithAuthenticationController:v8];
    contextManager = v8->_contextManager;
    v8->_contextManager = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    connectionLock = v8->_connectionLock;
    v8->_connectionLock = v13;

    [(NSLock *)v8->_connectionLock setName:@"AKAppleIDAuthenticationControllerXPCLock"];
    objc_storeStrong((id *)&v8->_daemonXPCEndpoint, a4);
  }

  return v8;
}

- (AKAppleIDAuthenticationController)init
{
  return [(AKAppleIDAuthenticationController *)self initWithIdentifier:0 daemonXPCEndpoint:0];
}

+ (NSSet)sensitiveAuthenticationKeys
{
  if (sensitiveAuthenticationKeys_onceToken != -1) {
    dispatch_once(&sensitiveAuthenticationKeys_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sensitiveAuthenticationKeys_sensitiveAuthenticationKeys;

  return (NSSet *)v2;
}

uint64_t __64__AKAppleIDAuthenticationController_sensitiveAuthenticationKeys__block_invoke()
{
  sensitiveAuthenticationKeys_sensitiveAuthenticationKeys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AKPassword", @"AKRawPassword", 0);

  return MEMORY[0x1F41817F8]();
}

+ (NSSet)sensitiveTokenKeys
{
  if (sensitiveTokenKeys_onceToken != -1) {
    dispatch_once(&sensitiveTokenKeys_onceToken, &__block_literal_global_234);
  }
  v2 = (void *)sensitiveTokenKeys_sensitiveTokenKeys;

  return (NSSet *)v2;
}

uint64_t __55__AKAppleIDAuthenticationController_sensitiveTokenKeys__block_invoke()
{
  sensitiveTokenKeys_sensitiveTokenKeys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AKPasswordResetTokenKey", @"AKShortLivedToken", @"AKIdentityToken", @"AKCustodianSetupToken", @"AKInheritanceBeneficiarySetupToken", @"GsIdmsToken", @"token", 0);

  return MEMORY[0x1F41817F8]();
}

+ (NSSet)sensitiveTokenKeysForFullRedaction
{
  if (sensitiveTokenKeysForFullRedaction_onceToken != -1) {
    dispatch_once(&sensitiveTokenKeysForFullRedaction_onceToken, &__block_literal_global_236);
  }
  v2 = (void *)sensitiveTokenKeysForFullRedaction_sensitiveTokenKeys;

  return (NSSet *)v2;
}

uint64_t __71__AKAppleIDAuthenticationController_sensitiveTokenKeysForFullRedaction__block_invoke()
{
  sensitiveTokenKeysForFullRedaction_sensitiveTokenKeys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"edpToken", @"X-Apple-I-RT", 0);

  return MEMORY[0x1F41817F8]();
}

+ (NSSet)tokenDictionaryKeys
{
  if (tokenDictionaryKeys_onceToken != -1) {
    dispatch_once(&tokenDictionaryKeys_onceToken, &__block_literal_global_238);
  }
  v2 = (void *)tokenDictionaryKeys_tokenDictionaryKeys;

  return (NSSet *)v2;
}

uint64_t __56__AKAppleIDAuthenticationController_tokenDictionaryKeys__block_invoke()
{
  tokenDictionaryKeys_tokenDictionaryKeys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AKIDMSToken", @"t", 0);

  return MEMORY[0x1F41817F8]();
}

- (AKAppleIDAuthenticationController)initWithIdentifier:(id)a3
{
  return [(AKAppleIDAuthenticationController *)self initWithIdentifier:a3 daemonXPCEndpoint:0];
}

- (AKAppleIDAuthenticationController)initWithDaemonXPCEndpoint:(id)a3
{
  return [(AKAppleIDAuthenticationController *)self initWithIdentifier:0 daemonXPCEndpoint:a3];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "%@ deallocated", v2, v3, v4, v5, v6);
}

- (AKAppleIDAuthenticationDelegate)delegate
{
  return [(AKAppleIDAuthenticationContextManager *)self->_contextManager delegate];
}

- (void)setDelegate:(id)a3
{
}

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[AKAppleIDAuthenticationController authenticateWithContext:completion:] requires a non-nil value for the context parameter."];
  }
  v8 = _os_activity_create(&dword_193494000, "authkit/authenticate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  v13 = _AKSignpostLogSystem();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v15 = [v6 authenticationType];
    objc_super v16 = [v6 _proxiedAppBundleID];
    *(_DWORD *)buf = 67240450;
    *(_DWORD *)v47 = v15;
    *(_WORD *)&v47[4] = 2114;
    *(void *)&v47[6] = v16;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthenticateWithContext", " AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x12u);
  }
  v17 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [v6 authenticationType];
    v19 = [v6 _proxiedAppBundleID];
    *(_DWORD *)buf = 134218498;
    *(void *)v47 = v10;
    *(_WORD *)&v47[8] = 1026;
    *(_DWORD *)&v47[10] = v18;
    __int16 v48 = 2114;
    v49 = v19;
    _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthenticateWithContext  AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x1Cu);
  }
  uint64_t v20 = [(AKAppleIDAuthenticationContextManager *)self->_contextManager registerContext:v6];
  v21 = (void *)v20;
  if (v7 && v20) {
    v7[2](v7, 0, v20);
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke;
  v40[3] = &unk_1E575EE80;
  v40[4] = self;
  id v22 = v6;
  id v41 = v22;
  os_signpost_id_t v43 = v10;
  uint64_t v44 = v12;
  v23 = v7;
  id v42 = v23;
  v24 = (void *)MEMORY[0x1996FE880](v40);
  if (self->_serviceID) {
    objc_msgSend(v22, "setServiceIdentifier:");
  }
  v25 = [(AKAppleIDAuthenticationController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0) {
    objc_msgSend(v22, "set_ignoreShouldContinueProxy:", 1);
  }
  v26 = [v22 username];
  v27 = [(AKAppleIDAuthenticationController *)self _serverFriendlyUsername:v26];
  [v22 setUsername:v27];

  v28 = _AKLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [v22 debugDescription];
    *(_DWORD *)buf = 138412290;
    *(void *)v47 = v29;
    _os_log_impl(&dword_193494000, v28, OS_LOG_TYPE_DEFAULT, "Request with %@", buf, 0xCu);
  }
  v30 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_260;
  v38[3] = &unk_1E575EAC0;
  id v31 = v24;
  id v39 = v31;
  v32 = [v30 remoteObjectProxyWithErrorHandler:v38];

  v33 = [v22 _sanitizedCopy];
  if ([v33 isContextEligibleForSilentAuth])
  {
    if ([v22 _capabilityForUIDisplay] == 1)
    {
      v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[AKAppleIDAuthenticationController authenticateWithContext:completion:]();
      }
    }
    else
    {
      v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[AKAppleIDAuthenticationController authenticateWithContext:completion:]();
      }
    }
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_262;
  v36[3] = &unk_1E575EAE8;
  id v35 = v31;
  id v37 = v35;
  [v32 authenticateWithContext:v33 completion:v36];

  os_activity_scope_leave(&state);
}

void __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1[4] + 32) unregisterContext:a1[5]];
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  else
  {
    id v7 = 0;
  }
  double Nanoseconds = (double)_AKSignpostGetNanoseconds(a1[7], a1[8]);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v21 = 67240192;
    LODWORD(v22) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AuthenticateWithContext", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v21, 8u);
  }
  double v12 = Nanoseconds / 1000000000.0;

  v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = a1[7];
    int v15 = [v6 code];
    int v21 = 134218496;
    uint64_t v22 = v14;
    __int16 v23 = 2048;
    double v24 = v12;
    __int16 v25 = 1026;
    int v26 = v15;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthenticateWithContext  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v21, 0x1Cu);
  }

  objc_super v16 = [NSNumber numberWithDouble:v12];
  [v7 setObject:v16 forKeyedSubscript:@"AuthenticateWithContext"];

  if (v7)
  {
    v17 = (void *)[v5 mutableCopy];
    int v18 = (void *)[v7 copy];
    [v17 setObject:v18 forKeyedSubscript:@"AKTimeSeries"];

    uint64_t v19 = [v17 copy];
    id v5 = (id)v19;
  }
  uint64_t v20 = a1[6];
  if (v20) {
    (*(void (**)(uint64_t, id, id))(v20 + 16))(v20, v5, v6);
  }
}

void __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_260(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AKTriageLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_262(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AKTriageLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "ak_redactedCopy");
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service came back with: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endProximityAuthenticationForContext:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[AKAppleIDAuthenticationController endProximityAuthenticationForContext:completion:] requires a non-nil value for the context parameter."];
  }
  v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate(v8);
  uint64_t v11 = v10;

  double v12 = _AKSignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = [v6 authenticationType];
    int v15 = [v6 _proxiedAppBundleID];
    *(_DWORD *)buf = 67240450;
    *(_DWORD *)id v37 = v14;
    *(_WORD *)&v37[4] = 2114;
    *(void *)&v37[6] = v15;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EndProximityAuth", " AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x12u);
  }
  objc_super v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v6 authenticationType];
    int v18 = [v6 _proxiedAppBundleID];
    *(_DWORD *)buf = 134218498;
    *(void *)id v37 = v9;
    *(_WORD *)&v37[8] = 1026;
    *(_DWORD *)&v37[10] = v17;
    __int16 v38 = 2114;
    id v39 = v18;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EndProximityAuth  AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x1Cu);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke;
  v31[3] = &unk_1E575EE80;
  v31[4] = self;
  id v32 = v6;
  os_signpost_id_t v34 = v9;
  uint64_t v35 = v11;
  id v33 = v7;
  id v19 = v7;
  id v20 = v6;
  int v21 = (void *)MEMORY[0x1996FE880](v31);
  uint64_t v22 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_266;
  v29[3] = &unk_1E575EAC0;
  id v23 = v21;
  id v30 = v23;
  double v24 = [v22 remoteObjectProxyWithErrorHandler:v29];

  __int16 v25 = [v20 _sanitizedCopy];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_267;
  v27[3] = &unk_1E575EAE8;
  id v28 = v23;
  id v26 = v23;
  [v24 endProximityAuthenticationForContext:v25 completion:v27];
}

void __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1[4] + 32) unregisterContext:a1[5]];
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[7], a1[8]);
  v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[7];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v16 = 67240192;
    LODWORD(v17) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "EndProximityAuth", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[7];
    int v14 = [v6 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:EndProximityAuth  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }

  uint64_t v15 = a1[6];
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }
}

void __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AKTriageLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_267(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AKTriageLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "ak_redactedCopy");
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service came back with: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = _os_activity_create(&dword_193494000, "authkit/set-in-use", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v9, &v16);
  id v10 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_269];

  double v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [NSNumber numberWithInteger:a5];
    int v14 = (void *)v13;
    uint64_t v15 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    if (v6) {
      uint64_t v15 = @"YES";
    }
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service for altDSID %@, service %@, inUse %@.", buf, 0x20u);
  }
  [v11 setAppleIDWithAltDSID:v8 inUse:v6 forService:a5 completion:&__block_literal_global_279];

  os_activity_scope_leave(&v16);
}

void __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }
}

void __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_276(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (a2) {
      BOOL v6 = @"YES";
    }
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@.", (uint8_t *)&v7, 0x16u);
  }
}

- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v9 = _os_activity_create(&dword_193494000, "authkit/set-in-use", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v9, &v16);
  id v10 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_281];

  double v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [NSNumber numberWithInteger:a5];
    int v14 = (void *)v13;
    uint64_t v15 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    if (v6) {
      uint64_t v15 = @"YES";
    }
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service for DSID %@, service %@, inUse %@.", buf, 0x20u);
  }
  [v11 setAppleIDWithDSID:v8 inUse:v6 forService:a5 completion:&__block_literal_global_284];

  os_activity_scope_leave(&v16);
}

void __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }
}

void __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_282(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (a2) {
      BOOL v6 = @"YES";
    }
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@.", (uint8_t *)&v7, 0x16u);
  }
}

- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v26 = v8;
  __int16 v9 = _os_activity_create(&dword_193494000, "authkit/fetch-user-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke;
  v21[3] = &unk_1E575EEC8;
  uint64_t v23 = v25;
  id v10 = v7;
  id v22 = v10;
  uint64_t v11 = (void *)MEMORY[0x1996FE880](v21);
  double v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  int v14 = [v12 remoteObjectProxyWithErrorHandler:v19];

  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch user information for: %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_285;
  v17[3] = &unk_1E575EAE8;
  id v16 = v13;
  id v18 = v16;
  [v14 fetchUserInformationForAltDSID:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_285(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend(v5, "ak_redactedCopy");
    int v9 = 138478083;
    id v10 = v8;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUserInformationWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/fetch-user-info-with-context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke;
  v21[3] = &unk_1E575EEF0;
  void v21[4] = self;
  id v9 = v7;
  id v22 = v9;
  id v10 = (void *)MEMORY[0x1996FE880](v21);
  __int16 v11 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v20 = v12;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v19];

  int v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v6 altDSID];
    *(_DWORD *)buf = 138412546;
    __int16 v25 = v15;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch user information for altDSID (%@) with context: %@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_287;
  v17[3] = &unk_1E575EF18;
  id v16 = v12;
  id v18 = v16;
  [v13 getUserInformationWithContext:v6 completion:v17];

  os_activity_scope_leave(&state);
}

uint64_t __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_287(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138478083;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  int v8 = self;
  __int16 v26 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/fetch-user-info-typed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke;
  v21[3] = &unk_1E575EF40;
  uint64_t v23 = v25;
  id v10 = v7;
  id v22 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v21);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  int v14 = [v12 remoteObjectProxyWithErrorHandler:v19];

  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch user information for: %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_288;
  v17[3] = &unk_1E575EF18;
  id v16 = v13;
  id v18 = v16;
  [v14 getUserInformationForAltDSID:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_288(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138478083;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  id v11 = self;
  uint64_t v29 = v11;
  uint64_t v12 = _os_activity_create(&dword_193494000, "authkit/update-user-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke;
  v24[3] = &unk_1E575EF68;
  __int16 v26 = v28;
  id v13 = v10;
  id v25 = v13;
  int v14 = (void *)MEMORY[0x1996FE880](v24);
  uint64_t v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_2;
  v22[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v23 = v16;
  uint64_t v17 = [v15 remoteObjectProxyWithErrorHandler:v22];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v8;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to update user information for: %@", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_289;
  v20[3] = &unk_1E575EF90;
  id v19 = v16;
  id v21 = v19;
  [v17 updateUserInformationForAltDSID:v8 userInformation:v9 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_289(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  int v8 = self;
  id v27 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/fetch-auth-mode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke;
  v22[3] = &unk_1E575EFB8;
  double v24 = v26;
  id v10 = v7;
  id v23 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v22);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v21 = v13;
  int v14 = [v12 remoteObjectProxyWithErrorHandler:v20];

  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v6 username];
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v16;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch auth mode for: %@", buf, 0xCu);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_291;
  v18[3] = &unk_1E575EFE0;
  id v17 = v13;
  id v19 = v17;
  [v14 fetchAuthModeWithContext:v6 completion:v18];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);
}

void __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_291(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Result of remote call: %lu. Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDeviceListWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__AKAppleIDAuthenticationController_fetchDeviceListWithContext_completion___block_invoke;
  v8[3] = &unk_1E575F008;
  id v9 = v6;
  id v7 = v6;
  [(AKAppleIDAuthenticationController *)self deviceListWithContext:a3 completion:v8];
}

void __75__AKAppleIDAuthenticationController_fetchDeviceListWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = [a2 deviceList];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)deviceListWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/fetch-device-list", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  void v24[4] = __Block_byref_object_dispose_;
  id v9 = self;
  id v25 = v9;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke;
  v21[3] = &unk_1E575F030;
  id v23 = v24;
  id v10 = v7;
  id v22 = v10;
  uint64_t v11 = (void *)MEMORY[0x1996FE880](v21);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v9 _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  int v14 = [v12 remoteObjectProxyWithErrorHandler:v19];

  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch device list information for: %{public}@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_293;
  v17[3] = &unk_1E575F008;
  id v16 = v13;
  id v18 = v16;
  [v14 deviceListWithContext:v6 completion:v17];

  _Block_object_dispose(v24, 8);
  os_activity_scope_leave(&state);
}

void __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)deviceListWithContext:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_193494000, "authkit/fetch-device-list", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  id v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke;
  v20[3] = &unk_1E575F058;
  void v20[4] = &v27;
  v20[5] = &v21;
  int v8 = (void *)MEMORY[0x1996FE880](v20);
  id v9 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v19 = v10;
  id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v18];

  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v6;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch device list information for: %{public}@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_294;
  v16[3] = &unk_1E575F008;
  id v13 = v10;
  id v17 = v13;
  [v11 deviceListWithContext:v6 completion:v16];
  if (a4) {
    *a4 = (id) v28[5];
  }
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  os_activity_scope_leave(&state);

  return v14;
}

void __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchAuthorizedAppListWithContext:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_193494000, "authkit/fetch-app-list", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke;
  v14[3] = &unk_1E575F080;
  v14[4] = &v15;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

  __int16 v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch app list information for: %@", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke_295;
  v13[3] = &unk_1E575F0A8;
  v13[4] = &v21;
  v13[5] = &v15;
  [v9 fetchAppListWithAltDSID:v6 completion:v13];
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  os_activity_scope_leave(&state);

  return v11;
}

void __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (BOOL)deleteAuthorizationDatabaseWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_193494000, "authkit/delete-authorization-list", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  double v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke;
  v15[3] = &unk_1E575F080;
  v15[4] = &v20;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];

  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to wipe authorization database", buf, 2u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke_297;
  v13[3] = &unk_1E575F0D0;
  v13[4] = &v20;
  v13[5] = &v16;
  [v9 deleteAuthorizationDatabaseWithAltDSID:v6 completion:v13];
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v11 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke_297(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v7 = self;
  id v35 = v7;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/silent-TTR", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke;
  v30[3] = &unk_1E575EF68;
  id v32 = v34;
  id v9 = v6;
  id v31 = v9;
  id v10 = (void *)MEMORY[0x1996FE880](v30);
  char v11 = _AKSignpostLogSystem();
  os_signpost_id_t v12 = _AKSignpostCreate(v11);
  uint64_t v14 = v13;

  __int16 v15 = _AKSignpostLogSystem();
  uint64_t v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "TriggerSilentTTR", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v17 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v12;
    _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TriggerSilentTTR  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v18 = [(AKAppleIDAuthenticationController *)v7 _authenticationServiceConnection];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_298;
  v26[3] = &unk_1E575F0F8;
  os_signpost_id_t v28 = v12;
  uint64_t v29 = v14;
  id v19 = v10;
  id v27 = v19;
  uint64_t v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v26];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_299;
  v22[3] = &unk_1E575F120;
  os_signpost_id_t v24 = v12;
  uint64_t v25 = v14;
  id v21 = v19;
  id v23 = v21;
  [v20 performSilentTTRFor:a3 completion:v22];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_298(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v5 = _AKSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TriggerSilentTTR", (const char *)&unk_19357E265, (uint8_t *)&v11, 2u);
  }

  id v8 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[5];
    int v11 = 134218240;
    uint64_t v12 = v9;
    __int16 v13 = 2048;
    double v14 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:TriggerSilentTTR ", (uint8_t *)&v11, 0x16u);
  }

  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_299(void *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "TriggerSilentTTR", (const char *)&unk_19357E265, (uint8_t *)&v21, 2u);
  }

  id v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[5];
    int v21 = 134218240;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    double v24 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:TriggerSilentTTR ", (uint8_t *)&v21, 0x16u);
  }

  uint64_t v12 = _AKLogSystem();
  __int16 v13 = v12;
  if (a2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_299_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_299_cold_2();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)revokeAuthorizationForApplicationWithClientID:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = _os_activity_create(&dword_193494000, "authkit/revoke-authorization", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  __int16 v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke;
  v14[3] = &unk_1E575F080;
  v14[4] = &v19;
  os_signpost_id_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to revoke authorization for clientID: %@", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke_300;
  v13[3] = &unk_1E575F0D0;
  v13[4] = &v19;
  v13[5] = &v15;
  [v9 revokeAuthorizationForApplicationWithClientID:v6 completion:v13];
  if (a4) {
    *a4 = (id) v20[5];
  }
  BOOL v11 = *((unsigned char *)v16 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke_300(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)warmUpVerificationSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  uint64_t v5 = self;
  id v24 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/satori-warmup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke;
  v19[3] = &unk_1E575EF68;
  uint64_t v21 = v23;
  id v7 = v4;
  id v20 = v7;
  id v8 = (void *)MEMORY[0x1996FE880](v19);
  os_signpost_id_t v9 = [(AKAppleIDAuthenticationController *)v5 _authenticationServiceConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_2;
  v17[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v18 = v10;
  BOOL v11 = [v9 remoteObjectProxyWithErrorHandler:v17];

  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to warmup verification session", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_301;
  v14[3] = &unk_1E575EF90;
  id v13 = v10;
  id v15 = v13;
  [v11 warmUpVerificationSessionWithCompletion:v14];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v23, 8);
}

void __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_301(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "WarmUp Session completed...", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  BOOL v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  uint64_t v14 = self;
  id v33 = v14;
  id v15 = _os_activity_create(&dword_193494000, "authkit/set-configuration-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke;
  v28[3] = &unk_1E575EF68;
  uint64_t v30 = v32;
  id v16 = v13;
  id v29 = v16;
  uint64_t v17 = (void *)MEMORY[0x1996FE880](v28);
  id v18 = [(AKAppleIDAuthenticationController *)v14 _authenticationServiceConnection];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_2;
  v26[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v27 = v19;
  id v20 = [v18 remoteObjectProxyWithErrorHandler:v26];

  uint64_t v21 = _AKLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = @"(null)";
    if (v11) {
      uint64_t v22 = v11;
    }
    *(_DWORD *)buf = 138412546;
    id v35 = v10;
    __int16 v36 = 2112;
    os_signpost_id_t v37 = v22;
    _os_log_impl(&dword_193494000, v21, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to set: %@ for identifier: %@.", buf, 0x16u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_305;
  v24[3] = &unk_1E575EF90;
  id v23 = v19;
  id v25 = v23;
  [v20 setConfigurationInfo:v10 forIdentifier:v11 forAltDSID:v12 completion:v24];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v32, 8);
}

void __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_305(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    os_signpost_id_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  void v28[4] = __Block_byref_object_dispose_;
  id v11 = self;
  id v29 = v11;
  uint64_t v12 = _os_activity_create(&dword_193494000, "authkit/fetch-configuration-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke;
  v24[3] = &unk_1E575EEC8;
  id v26 = v28;
  id v13 = v10;
  id v25 = v13;
  uint64_t v14 = (void *)MEMORY[0x1996FE880](v24);
  id v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_2;
  v22[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v23 = v16;
  uint64_t v17 = [v15 remoteObjectProxyWithErrorHandler:v22];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v8;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch configuration for identifiers: %@.", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_306;
  v20[3] = &unk_1E575EAE8;
  id v19 = v16;
  id v21 = v19;
  [v17 configurationInfoWithIdentifiers:v8 forAltDSID:v9 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138478083;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  void v24[4] = __Block_byref_object_dispose_;
  int v8 = self;
  id v25 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/check-upgrade-eligibility", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke;
  v20[3] = &unk_1E575EF68;
  uint64_t v22 = v24;
  id v10 = v7;
  id v21 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v20);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v19 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_307;
  v16[3] = &unk_1E575EF90;
  id v15 = v13;
  id v17 = v15;
  [v14 checkSecurityUpgradeEligibilityForContext:v6 completion:v16];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v24, 8);
}

void __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_307(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "HSA 2 eligibility check came back with result: %@ and error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateLoginCodeWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  void v21[4] = __Block_byref_object_dispose_;
  id v5 = self;
  uint64_t v22 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/generate-login-code", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke;
  v17[3] = &unk_1E575F148;
  id v19 = v21;
  id v7 = v4;
  id v18 = v7;
  int v8 = (void *)MEMORY[0x1996FE880](v17);
  id v9 = [(AKAppleIDAuthenticationController *)v5 _authenticationServiceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_2;
  v15[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_309;
  v13[3] = &unk_1E575F170;
  id v12 = v10;
  id v14 = v12;
  [v11 generateLoginCodeWithCompletion:v13];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v21, 8);
}

void __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Generated code: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  void v26[4] = __Block_byref_object_dispose_;
  __int16 v10 = self;
  id v27 = v10;
  id v11 = _os_activity_create(&dword_193494000, "authkit/validate-login-code", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke;
  v22[3] = &unk_1E575EF68;
  id v24 = v26;
  id v12 = v9;
  id v23 = v12;
  id v13 = (void *)MEMORY[0x1996FE880](v22);
  id v14 = [(AKAppleIDAuthenticationController *)v10 _authenticationServiceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_2;
  v20[3] = &unk_1E575EAC0;
  id v15 = v13;
  id v21 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_310;
  v18[3] = &unk_1E575EF90;
  id v17 = v15;
  id v19 = v17;
  [v16 validateLoginCode:a3 forAppleID:v8 withCompletion:v18];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);
}

void __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  void v24[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v25 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/perform-circle-request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke;
  v20[3] = &unk_1E575F198;
  uint64_t v22 = v24;
  id v10 = v7;
  id v21 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v20);
  id v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_312;
  v16[3] = &unk_1E575F1C0;
  id v15 = v13;
  id v17 = v15;
  [v14 performCircleRequestWithContext:v6 completion:v16];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v24, 8);
}

void __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 completion:(id)a4
{
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = _os_activity_create(&dword_193494000, "authkit/check-in", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  id v14 = self;
  uint64_t v32 = v14;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke;
  v28[3] = &unk_1E575F1E8;
  uint64_t v30 = v31;
  id v15 = v12;
  id v29 = v15;
  id v16 = (void *)MEMORY[0x1996FE880](v28);
  id v17 = [(AKAppleIDAuthenticationController *)v14 _authenticationServiceConnection];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_2;
  v26[3] = &unk_1E575EAC0;
  id v18 = v16;
  id v27 = v18;
  id v19 = [v17 remoteObjectProxyWithErrorHandler:v26];

  id v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v10;
    __int16 v36 = 2048;
    unint64_t v37 = a5;
    _os_log_impl(&dword_193494000, v20, OS_LOG_TYPE_DEFAULT, "Calling remote authentication service to perform check-in for altDSID: %@ with reason: %lu", buf, 0x16u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_313;
  v23[3] = &unk_1E575F210;
  id v21 = v10;
  id v24 = v21;
  id v22 = v18;
  id v25 = v22;
  [v19 performCheckInForAccountWithAltDSID:v21 event:v11 reason:a5 completion:v23];

  _Block_object_dispose(v31, 8);
  os_activity_scope_leave(&state);
}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Remote call to peform check-in for account with altDSID (%@) returned", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_313_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_193494000, "authkit/check-in", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  void v29[4] = __Block_byref_object_dispose_;
  id v12 = self;
  uint64_t v30 = v12;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke;
  v26[3] = &unk_1E575F1E8;
  uint64_t v28 = v29;
  id v13 = v10;
  id v27 = v13;
  id v14 = (void *)MEMORY[0x1996FE880](v26);
  id v15 = [(AKAppleIDAuthenticationController *)v12 _authenticationServiceConnection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_2;
  v24[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v25 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v24];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Calling remote authentication service to perform check-in for altDSID: %@", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_314;
  v21[3] = &unk_1E575F210;
  id v19 = v8;
  id v22 = v19;
  id v20 = v16;
  id v23 = v20;
  [v17 performCheckInForAccountWithAltDSID:v19 event:v9 completion:v21];

  _Block_object_dispose(v29, 8);
  os_activity_scope_leave(&state);
}

void __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_314(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Remote call to peform check-in for account with altDSID (%@) returned", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_313_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  void v26[4] = __Block_byref_object_dispose_;
  id v10 = self;
  id v27 = v10;
  id v11 = _os_activity_create(&dword_193494000, "authkit/report-sign-out", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke;
  v22[3] = &unk_1E575EF68;
  id v24 = v26;
  id v12 = v9;
  id v23 = v12;
  id v13 = (void *)MEMORY[0x1996FE880](v22);
  id v14 = [(AKAppleIDAuthenticationController *)v10 _authenticationServiceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_2;
  v20[3] = &unk_1E575EAC0;
  id v15 = v13;
  id v21 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_315;
  v18[3] = &unk_1E575EF90;
  id v17 = v15;
  id v19 = v17;
  [v16 reportSignOutForAppleID:v8 service:a4 completion:v18];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);
}

void __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_315(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3
{
  id v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  uint64_t v5 = self;
  id v23 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/report-sign-out-all", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke;
  v18[3] = &unk_1E575EF68;
  id v20 = v22;
  id v7 = v4;
  id v19 = v7;
  id v8 = (void *)MEMORY[0x1996FE880](v18);
  id v9 = [(AKAppleIDAuthenticationController *)v5 _authenticationServiceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_2;
  v15[3] = &unk_1E575F1E8;
  id v17 = v22;
  id v10 = v8;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_316;
  v13[3] = &unk_1E575EF90;
  id v12 = v10;
  id v14 = v12;
  [v11 reportSignOutForAllAppleIDsWithCompletion:v13];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v22, 8);
}

void __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  void v28[4] = __Block_byref_object_dispose_;
  id v11 = self;
  id v29 = v11;
  id v12 = _os_activity_create(&dword_193494000, "authkit/update-state-with-response", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke;
  v24[3] = &unk_1E575EF68;
  id v26 = v28;
  id v13 = v10;
  id v25 = v13;
  id v14 = (void *)MEMORY[0x1996FE880](v24);
  id v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_2;
  v22[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v23 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v22];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Asking akd to update state for %@ with auth response: %@", buf, 0x16u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_317;
  v20[3] = &unk_1E575EF90;
  id v19 = v16;
  id v21 = v19;
  [v17 updateStateWithExternalAuthenticationResponse:v8 forContext:v9 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_317(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Result of updating auth state: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  void v28[4] = __Block_byref_object_dispose_;
  id v11 = self;
  id v29 = v11;
  uint64_t v12 = _os_activity_create(&dword_193494000, "authkit/update-state-with-response", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke;
  v24[3] = &unk_1E575EF68;
  id v26 = v28;
  id v13 = v10;
  id v25 = v13;
  id v14 = (void *)MEMORY[0x1996FE880](v24);
  id v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_2;
  v22[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v23 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v22];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Asking akd to update state for %@ with auth response: %@", buf, 0x16u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_318;
  v20[3] = &unk_1E575EF90;
  id v19 = v16;
  id v21 = v19;
  [v17 updateStateWithExternalAuthenticationResponse:v8 forAppleID:v9 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_318(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Result of updating auth state: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isDevicePasscodeProtected:(id *)a3
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy_;
  v18[3] = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v4 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke;
  v16[3] = &unk_1E575F080;
  void v16[4] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke_2;
  v15[3] = &unk_1E575F0D0;
  void v15[4] = &v20;
  void v15[5] = &v17;
  [v5 isDevicePasscodeProtected:v15];
  if (a3) {
    *a3 = *(id *)(v18[0] + 40);
  }
  if (*(void *)(v18[0] + 40))
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationController isDevicePasscodeProtected:]((uint64_t)v18, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  char v13 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

void __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke(uint64_t a1, void *a2)
{
}

void __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)activeLoginCode:(id *)a3
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy_;
  v18[3] = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v4 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke;
  v16[3] = &unk_1E575F080;
  void v16[4] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke_2;
  v15[3] = &unk_1E575F238;
  void v15[4] = &v20;
  void v15[5] = &v17;
  [v5 activeLoginCode:v15];
  if (a3) {
    *a3 = *(id *)(v18[0] + 40);
  }
  if (*(void *)(v18[0] + 40))
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationController activeLoginCode:]((uint64_t)v18, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke(uint64_t a1, void *a2)
{
}

void __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  uint64_t v8 = self;
  id v35 = v8;
  uint64_t v9 = _os_activity_create(&dword_193494000, "authkit/fetch-load-delegate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _AKSignpostLogSystem();
  id v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchServerLoadDelegate", " enableTelemetry=YES ", buf, 2u);
  }

  id v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchServerLoadDelegate  enableTelemetry=YES ", buf, 0xCu);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke;
  v28[3] = &unk_1E575F260;
  os_signpost_id_t v31 = v11;
  uint64_t v32 = v13;
  uint64_t v30 = v34;
  id v17 = v7;
  id v29 = v17;
  id v18 = (void *)MEMORY[0x1996FE880](v28);
  id v19 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_321;
  v26[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v27 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v26];

  uint64_t v22 = _AKLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v37 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "Asking akd for AKAppleIDServerResourceLoadDelegate for altDSID %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_322;
  v24[3] = &unk_1E575F288;
  id v23 = v20;
  id v25 = v23;
  [v21 getServerUILoadDelegateForAltDSID:v6 completion:v24];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchServerLoadDelegate", (const char *)&unk_19357E265, (uint8_t *)&v16, 2u);
  }

  os_signpost_id_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v16 = 134218240;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchServerLoadDelegate ", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v13 = *(void *)(a1[5] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  uint64_t v15 = a1[4];
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }
}

void __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_321(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of getting AKAppleIDServerResourceLoadDelegate: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  int v8 = self;
  id v35 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/fetch-load-delegate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  __int16 v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchServerLoadDelegate", " enableTelemetry=YES ", buf, 2u);
  }

  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchServerLoadDelegate  enableTelemetry=YES ", buf, 0xCu);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke;
  v28[3] = &unk_1E575F260;
  os_signpost_id_t v31 = v11;
  uint64_t v32 = v13;
  uint64_t v30 = v34;
  id v17 = v7;
  id v29 = v17;
  __int16 v18 = (void *)MEMORY[0x1996FE880](v28);
  double v19 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_323;
  v26[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v27 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v26];

  uint64_t v22 = _AKLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v37 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "Asking akd for AKAppleIDServerResourceLoadDelegate for context %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_324;
  v24[3] = &unk_1E575F288;
  id v23 = v20;
  id v25 = v23;
  [v21 getServerUILoadDelegateWithContext:v6 completion:v24];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  int v8 = _AKSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchServerLoadDelegate", (const char *)&unk_19357E265, (uint8_t *)&v16, 2u);
  }

  os_signpost_id_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v16 = 134218240;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchServerLoadDelegate ", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v13 = *(void *)(a1[5] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  uint64_t v15 = a1[4];
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }
}

void __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_323(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_324(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of getting AKAppleIDServerResourceLoadDelegate: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)synchronizeFollowUpItemsForContext:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_193494000, "authkit/sync-follow-up-items", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  int v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 altDSID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Synchronizing follow ups for altDSID: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  os_signpost_id_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  __int16 v10 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke;
  v18[3] = &unk_1E575F080;
  void v18[4] = &buf;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v18];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke_2;
  v17[3] = &unk_1E575F0D0;
  void v17[4] = &v19;
  v17[5] = &buf;
  [v11 synchronizeFollowUpItemsForContext:v6 completion:v17];
  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v20 + 24)) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v24 = 138412546;
    id v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Synchronized follow ups %@ with error %@", v24, 0x16u);
  }

  BOOL v15 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v15;
}

void __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  uint8_t v24[4] = __Block_byref_object_dispose_;
  int v8 = self;
  id v25 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/sync-follow-up-items", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke;
  v20[3] = &unk_1E575EF68;
  char v22 = v24;
  id v10 = v7;
  id v21 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v20);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v19 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_325;
  v16[3] = &unk_1E575EF90;
  id v15 = v13;
  id v17 = v15;
  [v14 synchronizeFollowUpItemsForContext:v6 completion:v16];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v24, 8);
}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_325(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Synchronized follow ups %@ with error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  int v8 = self;
  __int16 v26 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/followup-teardown", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke;
  v21[3] = &unk_1E575EF68;
  id v23 = v25;
  id v10 = v7;
  id v22 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v21);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v19];

  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Asking akd to teardown: %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_326;
  v17[3] = &unk_1E575EF90;
  id v16 = v13;
  id v18 = v16;
  [v14 teardownFollowUpWithContext:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_326(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_326_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v8 = self;
  __int16 v26 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/renew-recovery-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke;
  v21[3] = &unk_1E575EEC8;
  id v23 = v25;
  id v10 = v7;
  id v22 = v10;
  id v11 = (void *)MEMORY[0x1996FE880](v21);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v19];

  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Asking akd to fetch a new recovery token token with info: %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_327;
  v17[3] = &unk_1E575EAE8;
  id v16 = v13;
  id v18 = v16;
  [v14 renewRecoveryTokenWithContext:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_327(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_327_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyMasterKey:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  void v28[4] = __Block_byref_object_dispose_;
  id v11 = self;
  uint64_t v29 = v11;
  uint64_t v12 = _os_activity_create(&dword_193494000, "authkit/verify-master-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke;
  v24[3] = &unk_1E575EEC8;
  __int16 v26 = v28;
  id v13 = v10;
  id v25 = v13;
  uint64_t v14 = (void *)MEMORY[0x1996FE880](v24);
  id v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_2;
  v22[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v23 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v22];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v9;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Asking akd to verify master key with info: %@", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_328;
  v20[3] = &unk_1E575EAE8;
  id v19 = v16;
  id v21 = v19;
  [v17 verifyMasterKey:v8 withContext:v9 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_328(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_328_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)persistMasterKeyVerifier:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(AKPersistRecoveryKeyContext);
  [(AKPersistRecoveryKeyContext *)v11 setVerifier:v10];

  [(AKPersistRecoveryKeyContext *)v11 setKeyType:0];
  [(AKAppleIDAuthenticationController *)self persistRecoveryKeyWithContext:v11 authContext:v9 completion:v8];
}

- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  void v28[4] = __Block_byref_object_dispose_;
  id v11 = self;
  uint64_t v29 = v11;
  uint64_t v12 = _os_activity_create(&dword_193494000, "authkit/persist-recovery-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke;
  v24[3] = &unk_1E575EF68;
  __int16 v26 = v28;
  id v13 = v10;
  id v25 = v13;
  uint64_t v14 = (void *)MEMORY[0x1996FE880](v24);
  id v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_2;
  v22[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v23 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v22];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Asking akd to persist recovery key with persistKeyContext: %@, authContext:%@", buf, 0x16u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_330;
  v20[3] = &unk_1E575EF90;
  id v19 = v16;
  id v21 = v19;
  [v17 persistRecoveryKeyWithContext:v8 authContext:v9 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_330(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_330_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  id v11 = self;
  __int16 v36 = v11;
  uint64_t v12 = _os_activity_create(&dword_193494000, "authkit/validate-vetting-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke;
  v31[3] = &unk_1E575EF68;
  id v33 = v35;
  id v13 = v10;
  id v32 = v13;
  uint64_t v14 = (void *)MEMORY[0x1996FE880](v31);
  id v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_2;
  v29[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v30 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v29];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Asking akd to validate vetting token %@ for altDSID: %@", buf, 0x16u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_331;
  v23[3] = &unk_1E575F2D8;
  id v19 = v9;
  id v24 = v19;
  id v25 = v11;
  id v20 = v16;
  id v28 = v20;
  id v21 = v17;
  id v26 = v21;
  id v22 = v8;
  id v27 = v22;
  [v21 validateVettingToken:v22 forAltDSID:v19 completion:v23];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_331(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = [v5 domain];
    if ([v7 isEqual:@"AKAuthenticationError"])
    {
      uint64_t v8 = [v6 code];

      if (v8 == -7058)
      {
        id v9 = _AKLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Vetting-token validation failed due to expired master token. Attempting to re-auth...", buf, 2u);
        }

        id v10 = objc_alloc_init(AKAppleIDAuthenticationContext);
        id v11 = [v6 userInfo];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"AKUsername"];
        [(AKAppleIDAuthenticationContext *)v10 setUsername:v12];

        [(AKAppleIDAuthenticationContext *)v10 setAltDSID:*(void *)(a1 + 32)];
        [(AKAppleIDAuthenticationContext *)v10 setIsUsernameEditable:0];
        [(AKAppleIDAuthenticationContext *)v10 _setProxyingForApp:1];
        id v13 = *(void **)(a1 + 40);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_333;
        v16[3] = &unk_1E575F2B0;
        id v20 = *(id *)(a1 + 64);
        id v17 = *(id *)(a1 + 48);
        id v18 = *(id *)(a1 + 56);
        id v19 = *(id *)(a1 + 32);
        [v13 authenticateWithContext:v10 completion:v16];

        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = @"NO";
    if (a2) {
      id v15 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "Result: Is token valid? %@. Error: %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_13:
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_333(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_333_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Master token should be fresh now. Reattempting vetting token-validation...", buf, 2u);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_334;
    v10[3] = &unk_1E575EF90;
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    [v7 validateVettingToken:v8 forAltDSID:v9 completion:v10];
  }
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_334(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Result afer reauth: Is token valid? %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isCreateAppleIDAllowedWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  void v21[4] = __Block_byref_object_dispose_;
  id v5 = self;
  id v22 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/create-appleid-allowed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke;
  v17[3] = &unk_1E575EF68;
  id v19 = v21;
  id v7 = v4;
  id v18 = v7;
  int v8 = (void *)MEMORY[0x1996FE880](v17);
  uint64_t v9 = [(AKAppleIDAuthenticationController *)v5 _authenticationServiceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_335;
  v15[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_336;
  v13[3] = &unk_1E575EF90;
  id v12 = v10;
  id v14 = v12;
  [v11 isCreateAppleIDAllowedWithCompletion:v13];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v21, 8);
}

void __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (v5)
  {
    int v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_cold_1();
    }
  }
  uint64_t v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (a2) {
      id v10 = @"YES";
    }
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Allow create AppleID is determined to be - %@", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_335(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_336(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accountNamesForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v5 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_338];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_339;
  v9[3] = &unk_1E575F300;
  v9[4] = &v10;
  [v6 accountNamesForAltDSID:v4 completion:v9];
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v7;
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();
  }
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_339(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_339_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_339_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = v5;
    int v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
}

- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  void v26[4] = __Block_byref_object_dispose_;
  int v8 = self;
  id v27 = v8;
  uint64_t v9 = _os_activity_create(&dword_193494000, "authkit/fetch-url-bag", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke;
  v22[3] = &unk_1E575EEC8;
  id v24 = v26;
  id v10 = v7;
  id v23 = v10;
  int v11 = (void *)MEMORY[0x1996FE880](v22);
  uint64_t v12 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_2;
  v20[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v21 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v20];

  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to url bag", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_341;
  v17[3] = &unk_1E575EAE8;
  id v16 = v13;
  id v18 = v16;
  [v14 fetchURLBagForAltDSID:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);
}

void __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_341(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching URL bag. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_urlBagFromCache:(BOOL)a3 altDSID:(id)a4 withError:(id *)a5
{
  BOOL v5 = a3;
  id v7 = a4;
  int v8 = _os_activity_create(&dword_193494000, "authkit/fetch-url-bag", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  void v17[4] = __Block_byref_object_dispose_;
  id v18 = 0;
  id v9 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke;
  v16[3] = &unk_1E575F080;
  void v16[4] = v17;
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];

  int v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Synchronously calling out to remote auth service to url bag", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke_342;
  v14[3] = &unk_1E575F328;
  void v14[4] = &v19;
  void v14[5] = v17;
  [v10 fetchURLBagFromCache:v5 altDSID:v7 completion:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);

  return v12;
}

void __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke_342(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching URL bag. Error: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  void v30[4] = __Block_byref_object_dispose_;
  uint64_t v11 = self;
  id v31 = v11;
  id v12 = _os_activity_create(&dword_193494000, "authkit/urlbag-update", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke;
  v26[3] = &unk_1E575EF68;
  id v28 = v30;
  id v13 = v10;
  id v27 = v13;
  id v14 = (void *)MEMORY[0x1996FE880](v26);
  uint64_t v15 = [(AKAppleIDAuthenticationController *)v11 _authenticationServiceConnection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_2;
  v24[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v25 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v24];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "Synchronously calling out to remote auth service to force update URL Bag for altDSID: %@", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_343;
  v21[3] = &unk_1E575F350;
  id v19 = v8;
  id v22 = v19;
  id v20 = v16;
  id v23 = v20;
  [v17 forceURLBagUpdateForAltDSID:v19 urlSwitchData:v9 completion:v21];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_343(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Finished updating urlbag update for AltDSID: %@ with result: %d error:%@", (uint8_t *)&v8, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_authenticationServiceConnection
{
  [(NSLock *)self->_connectionLock lock];
  authenticationServiceConnection = self->_authenticationServiceConnection;
  if (!authenticationServiceConnection)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    if (daemonXPCEndpoint) {
      id v6 = (NSXPCConnection *)[v5 initWithListenerEndpoint:self->_daemonXPCEndpoint];
    }
    else {
      id v6 = (NSXPCConnection *)[v5 initWithMachServiceName:@"com.apple.ak.auth.xpc" options:0];
    }
    uint64_t v7 = self->_authenticationServiceConnection;
    self->_authenticationServiceConnection = v6;

    int v8 = self->_authenticationServiceConnection;
    uint64_t v9 = +[AKAppleIDAuthenticationDaemonInterface XPCInterface];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_authenticationServiceConnection setExportedObject:self->_contextManager];
    __int16 v10 = self->_authenticationServiceConnection;
    int v11 = +[AKAppleIDAuthenticationClientInterface XPCInterface];
    [(NSXPCConnection *)v10 setExportedInterface:v11];

    objc_initWeak(&location, self);
    __int16 v12 = self->_authenticationServiceConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke;
    v18[3] = &unk_1E575EA98;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v18];
    id v13 = self->_authenticationServiceConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_347;
    v16[3] = &unk_1E575EA98;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:v16];
    [(NSXPCConnection *)self->_authenticationServiceConnection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    authenticationServiceConnection = self->_authenticationServiceConnection;
  }
  uint64_t v14 = authenticationServiceConnection;
  [(NSLock *)self->_connectionLock unlock];

  return v14;
}

void __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_cold_1();
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] lock];
    [v4[3] invalidate];
    id v5 = v4[3];
    v4[3] = 0;

    [v4[5] unlock];
  }
}

void __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_347(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_193494000, v2, OS_LOG_TYPE_DEFAULT, "Connection to akd was invalidated.", (uint8_t *)v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] lock];
    id v5 = v4[3];
    v4[3] = 0;

    [v4[5] unlock];
  }
}

- (void)clearSessionCacheWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_193494000, "authkit/clear-session-cache", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  void v17[4] = __Block_byref_object_dispose_;
  id v6 = self;
  id v18 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke;
  v14[3] = &unk_1E575EF68;
  id v16 = v17;
  id v7 = v4;
  id v15 = v7;
  int v8 = (void *)MEMORY[0x1996FE880](v14);
  uint64_t v9 = [(AKAppleIDAuthenticationController *)v6 _authenticationServiceConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2;
  v12[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v13 = v10;
  int v11 = [v9 remoteObjectProxyWithErrorHandler:v12];

  [v11 clearSessionCacheWithCompletion:v10];
  _Block_object_dispose(v17, 8);

  os_activity_scope_leave(&state);
}

void __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v7 = self;
  id v26 = v7;
  int v8 = _os_activity_create(&dword_193494000, "authkit/fetch-global-config", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke;
  v21[3] = &unk_1E575EEC8;
  id v23 = v25;
  id v9 = v6;
  id v22 = v9;
  id v10 = (void *)MEMORY[0x1996FE880](v21);
  int v11 = [(AKAppleIDAuthenticationController *)v7 _authenticationServiceConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v20 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v19];

  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service for global config", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_348;
  v16[3] = &unk_1E575EAE8;
  id v15 = v12;
  id v17 = v15;
  [v13 fetchGlobalConfigurationUsingPolicy:a3 completion:v16];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_348(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching global config. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke;
  v20[3] = &unk_1E575EAE8;
  id v21 = v7;
  id v8 = v7;
  id v9 = (void *)MEMORY[0x1996FE880](v20);
  uint64_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [v6 debugDescription];
    *(_DWORD *)long long buf = 138412290;
    id v23 = v11;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "Request with %@", buf, 0xCu);
  }
  id v12 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_349;
  v18[3] = &unk_1E575EAC0;
  id v13 = v9;
  id v19 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_350;
  v16[3] = &unk_1E575EAE8;
  id v17 = v13;
  id v15 = v13;
  [v14 performPasswordResetWithContext:v6 completion:v16];
}

uint64_t __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_349(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_350(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v5, "ak_redactedCopy");
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Remote authentication service came back with: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke;
  v15[3] = &unk_1E575EAC0;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];

  int v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController deleteDeviceListCacheWithContext:completion:]();
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_351;
  v13[3] = &unk_1E575EF90;
  id v14 = v9;
  id v12 = v9;
  [v10 deleteDeviceListCacheWithContext:v6 completion:v13];
}

void __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_351(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_351_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)deleteDeviceListCacheWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke;
  v12[3] = &unk_1E575EAC0;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v12];

  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController deleteDeviceListCacheWithCompletion:]();
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke_352;
  v10[3] = &unk_1E575EF90;
  id v11 = v6;
  id v9 = v6;
  [v7 deleteDeviceListCacheWithCompletion:v10];
}

void __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke_352(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_351_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke;
  v18[3] = &unk_1E575EAC0;
  id v12 = v8;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];

  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController fetchTokensWithAltDSID:tokenIdentifiers:completion:]();
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_353;
  v16[3] = &unk_1E575EAE8;
  id v17 = v12;
  id v15 = v12;
  [v13 fetchTokensWithAltDSID:v10 tokenIdentifiers:v9 completion:v16];
}

void __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_353(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_353_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke;
  v18[3] = &unk_1E575EAC0;
  id v12 = v8;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];

  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController deleteTokensFromCacheWithAltDSID:tokenIdentifiers:completion:]();
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_354;
  v16[3] = &unk_1E575EF90;
  id v17 = v12;
  id v15 = v12;
  [v13 deleteTokensFromCacheWithAltDSID:v10 tokenIdentifiers:v9 completion:v16];
}

void __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_354(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_354_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (BOOL)performEdpMigrationWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_193494000, "authkit/edp-migration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__AKAppleIDAuthenticationController_performEdpMigrationWithAltDSID_error___block_invoke;
  v14[3] = &unk_1E575F080;
  void v14[4] = &v19;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController performEdpMigrationWithAltDSID:error:]();
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__AKAppleIDAuthenticationController_performEdpMigrationWithAltDSID_error___block_invoke_355;
  v13[3] = &unk_1E575F0D0;
  void v13[4] = &v19;
  v13[5] = &v15;
  [v9 performEdpMigrationWithAltDSID:v6 completion:v13];
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __74__AKAppleIDAuthenticationController_performEdpMigrationWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __74__AKAppleIDAuthenticationController_performEdpMigrationWithAltDSID_error___block_invoke_355(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __74__AKAppleIDAuthenticationController_performEdpMigrationWithAltDSID_error___block_invoke_355_cold_1();
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)performEdpCompleteKeyDropWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_193494000, "authkit/edp-complete", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke;
  v14[3] = &unk_1E575F080;
  void v14[4] = &v19;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController performEdpCompleteKeyDropWithAltDSID:error:]();
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke_356;
  v13[3] = &unk_1E575F0D0;
  void v13[4] = &v19;
  v13[5] = &v15;
  [v9 performEdpCompleteKeyDropWithAltDSID:v6 completion:v13];
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke_356(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke_356_cold_1();
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)performRemoveEdpTokenWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_193494000, "authkit/remove-edp-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(AKAppleIDAuthenticationController *)self _authenticationServiceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__AKAppleIDAuthenticationController_performRemoveEdpTokenWithAltDSID_error___block_invoke;
  v14[3] = &unk_1E575F080;
  void v14[4] = &v19;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController performEdpCompleteKeyDropWithAltDSID:error:]();
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__AKAppleIDAuthenticationController_performRemoveEdpTokenWithAltDSID_error___block_invoke_357;
  v13[3] = &unk_1E575F0D0;
  void v13[4] = &v19;
  v13[5] = &v15;
  [v9 performRemoveEdpTokenWithAltDSID:v6 completion:v13];
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __76__AKAppleIDAuthenticationController_performRemoveEdpTokenWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __76__AKAppleIDAuthenticationController_performRemoveEdpTokenWithAltDSID_error___block_invoke_357(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke_356_cold_1();
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)_serverFriendlyUsername:(id)a3
{
  id v3 = a3;
  if ([v3 length] && (objc_msgSend(v3, "containsString:", @"@") & 1) == 0)
  {
    if (AAAFoundationSwiftLibraryCore()) {
      getAAFPhoneNumberFormatterClass();
    }
    id v5 = objc_opt_new();
    id v4 = [v5 normalizedFormatFor:v3];
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  void v23[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v24 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke;
  v20[3] = &unk_1E575F378;
  id v22 = v23;
  id v9 = v7;
  id v21 = v9;
  id v10 = (void *)MEMORY[0x1996FE880](v20);
  char v11 = [(AKAppleIDAuthenticationController *)v8 _authenticationServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];

  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController fetchBirthdayForAltDSID:completion:]();
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke_362;
  v16[3] = &unk_1E575F3A0;
  id v15 = v12;
  id v17 = v15;
  [v13 fetchBirthdayForAltDSID:v6 completion:v16];

  _Block_object_dispose(v23, 8);
}

void __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v12, v7, v8);
  }
}

void __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke_362(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_debug_impl(&dword_193494000, v10, OS_LOG_TYPE_DEBUG, "Result of fetch birthday - %@-%@, with error - %@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)deallocHandler
{
  return self->_deallocHandler;
}

- (void)setDeallocHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocHandler, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_contextManager, 0);
  objc_storeStrong((id *)&self->_authenticationServiceConnection, 0);
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

- (void)authenticateWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_193494000, v0, OS_LOG_TYPE_FAULT, "Interactive authentication requested by background daemon, client error, AKAppleIDAuthenticationTypeSilentPreferred should be used", v1, 2u);
}

- (void)authenticateWithContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_193494000, v0, OS_LOG_TYPE_FAULT, "Interactive authentication requested by UI context, please investigate why silent auth could not be used", v1, 2u);
}

void __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Remote authentication service returned an error: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Remote authentication service returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_299_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_193494000, a1, a3, "Remote Auth Service SilentTTR returned success: %@", a5, a6, a7, a8, 2u);
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_299_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Remote Auth Service SilentTTR returned an error: %@", v2, v3, v4, v5, v6);
}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_313_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to perform check-in: %@", v2, v3, v4, v5, v6);
}

- (void)isDevicePasscodeProtected:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activeLoginCode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to synchronize follow ups due to xpc error: %@", v2, v3, v4, v5, v6);
}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_326_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Completed teardown request; Error: %@", v2, v3, v4, v5, v6);
}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_327_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to renew recovery token: %@", v2, v3, v4, v5, v6);
}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_328_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to verify master key: %@", v2, v3, v4, v5, v6);
}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_330_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to persist recovery key: %@", v2, v3, v4, v5, v6);
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_333_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Unable to refresh expired master token for vetting-token validation.", v1, 2u);
}

void __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error getting create Apple ID state - %@", v2, v3, v4, v5, v6);
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_339_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Account name list: %@", v2, v3, v4, v5, v6);
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_339_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to get account name list: %@", v2, v3, v4, v5, v6);
}

void __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Connection to akd was interrupted!", v1, 2u);
}

void __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 136315394;
  uint64_t v5 = "-[AKAppleIDAuthenticationController clearSessionCacheWithCompletion:]_block_invoke_2";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Connection to session remote service '%s' returned an error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)deleteDeviceListCacheWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Calling out to remote auth service to delete device list cache information for: %{public}@", v2, v3, v4, v5, v6);
}

void __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_351_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_193494000, v0, v1, "Result of remote call status: %d and error: %@");
}

- (void)deleteDeviceListCacheWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling out to remote auth service to delete device list cache information", v2, v3, v4, v5, v6);
}

- (void)fetchTokensWithAltDSID:tokenIdentifiers:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling out to remote auth service to fetch tokens", v2, v3, v4, v5, v6);
}

void __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_353_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_193494000, v1, OS_LOG_TYPE_DEBUG, "Result of fetch tokens remote call data: %@ and error: %@", v2, 0x16u);
}

- (void)deleteTokensFromCacheWithAltDSID:tokenIdentifiers:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling out to remote auth service to delete tokens", v2, v3, v4, v5, v6);
}

void __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_354_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_193494000, v0, v1, "Result of delete tokens remote call result: %d and error: %@");
}

- (void)performEdpMigrationWithAltDSID:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling out to remote auth service to perform EDP migration", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDAuthenticationController_performEdpMigrationWithAltDSID_error___block_invoke_355_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_193494000, v0, v1, "Result of EDP migration remote call result: %{BOOL}d and error: %@");
}

- (void)performEdpCompleteKeyDropWithAltDSID:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling out to remote auth service to perform EDP complete key drop", v2, v3, v4, v5, v6);
}

void __80__AKAppleIDAuthenticationController_performEdpCompleteKeyDropWithAltDSID_error___block_invoke_356_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_193494000, v0, v1, "Result of EDP complete remote call result: %{BOOL}d and error: %@");
}

- (void)fetchBirthdayForAltDSID:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling out to remote auth service to fetch birthday", v2, v3, v4, v5, v6);
}

@end
@interface ASCAgent
- (ASCAgent)initWithTrafficController:(id)a3 connection:(id)a4 publicKeyCredentialManager:(id)a5 signInEventCollector:(id)a6;
- (BOOL)_allowListExclusivelyMatchesPlatformLoginChoices:(id)a3;
- (BOOL)_canCreateICloudKeychainPasskeyPreflightWithError:(id *)a3;
- (BOOL)_canPerformConditionalRegistrationInICloudKeychainForUsername:(id)a3 relyingParty:(id)a4;
- (BOOL)_clientHasAuthKitDeveloperEntitlement;
- (BOOL)_clientHasNecessaryAuthKitEntitlements;
- (BOOL)_clientIsAuthKitOwner;
- (BOOL)_clientIsInternalAuthKit;
- (BOOL)_clientIsPrivateAuthKit;
- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)_hasAnyCredentialsAvailableForRequestContext:(id)a3;
- (BOOL)_hasSignInOptionsForRequestContext:(id)a3;
- (BOOL)_isClientWithApplicationIdentifier:(id)a3 properlyEntitledForRequestContext:(id)a4 error:(id *)a5;
- (BOOL)_isConnection:(id)a3 entitledToDeletePasskeysForRelyingParty:(id)a4;
- (BOOL)_isExtensionEnabled:(id)a3;
- (BOOL)_isRPIDValid:(id)a3 forOrigin:(id)a4;
- (BOOL)_isValidContext:(id)a3;
- (BOOL)_shouldAddCABLEChoiceForRequestContext:(id)a3;
- (BOOL)_shouldApplyQuirksToClientWithApplicationIdentifier:(id)a3;
- (BOOL)_showExtensionEnablementAlert:(id)a3;
- (BOOL)isCABLEAuthenticatorRequest;
- (id)_allAvailableLoginChoicesForRequestContext:(id)a3;
- (id)_allTransportsForAssertionRequest:(id)a3;
- (id)_bundleIDFromAppID:(id)a3;
- (id)_cableLoginChoiceForRequestContext:(id)a3;
- (id)_implicitlySelectAssertionLoginChoiceFromChoices:(id)a3 forContext:(id)a4;
- (id)_noCredentialsFoundErrorForRequestContext:(id)a3;
- (id)_teamIDfromAppID:(id)a3;
- (id)encodeGetAssertionCTAPCommandForAuthenticatorWithUserVerificationAvailability:(unint64_t)a3 authenticatorSupportedExtensions:(id)a4;
- (id)encodeMakeCredentialCTAPCommandForAuthenticatorWithUserVerificationAvailability:(unint64_t)a3 authenticatorSupportedExtensions:(id)a4;
- (unint64_t)_allowedAuthenticatorModalitiesForRequestContext:(id)a3;
- (unsigned)_approvalStateForApplicationIdentifier:(id)a3 relyingParty:(id)a4;
- (void)_authorizationCompletedWithCredential:(id)a3 error:(id)a4;
- (void)_configureAppleIDCredentialWithContext:(id)a3 completionHandler:(id)a4;
- (void)_configureLoginChoicesForPresentationContext:(id)a3 withRequestContext:(id)a4;
- (void)_configurePasswordCredentialsWithCompletionHandler:(id)a3;
- (void)_configurePublicKeyCredentialsWithAssertionOptions:(id)a3 forProcessWithApplicationIdentifier:(id)a4 requestStyle:(int64_t)a5 completionHandler:(id)a6;
- (void)_credentialRequestedForCABLELoginChoice:(id)a3;
- (void)_credentialRequestedForPasswordLoginChoice:(id)a3 completionHandler:(id)a4;
- (void)_credentialRequestedForPlatformLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5;
- (void)_credentialRequestedForSecurityKeyLoginChoice:(id)a3;
- (void)_openPasswordOptions:(id)a3;
- (void)_performAuthKitAuthorizationValidationForAccount:(id)a3;
- (void)_prepareForAuthorizationRequestsForContext:(id)a3 clientConnection:(id)a4 withPresentationHandler:(id)a5;
- (void)_presentAuthorizationRequestWithContext:(id)a3 implicitlySelectedLoginChoice:(id)a4 forProcess:(id)a5 completionHandler:(id)a6;
- (void)_requestConditionalRegistrationOnProvider:(id)a3 presentationContext:(id)a4 requestContext:(id)a5 completionHandler:(id)a6;
- (void)authorizationPresenter:(id)a3 credentialRequestedForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6;
- (void)authorizationPresenter:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5;
- (void)authorizationPresenter:(id)a3 startCABLEAuthenticationWithCompletionHandler:(id)a4;
- (void)authorizationPresenter:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5;
- (void)browserPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4;
- (void)cableClientWillAuthenticate:(id)a3;
- (void)cableClientWillConnect:(id)a3;
- (void)cancelCurrentRequest;
- (void)clearAllPlatformPublicKeyCredentialsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4;
- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5;
- (void)didCompleteAssertionWithCredential:(id)a3 error:(id)a4;
- (void)didCompleteRegistrationWithCredential:(id)a3 error:(id)a4;
- (void)didFetchPlatformLoginChoices:(id)a3;
- (void)didFetchSecurityKeyLoginChoices:(id)a3;
- (void)didReceiveError:(int64_t)a3;
- (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3;
- (void)openCABLEURL:(id)a3 fromSourceApplication:(id)a4 withCompletionHandler:(id)a5;
- (void)performAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4;
- (void)performAuthorizationRequestsForContext:(id)a3 withPresenter:(id)a4 completionHandler:(id)a5;
- (void)performSilentAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4;
- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3;
- (void)presentCABLESheetWithCompletionHandler:(id)a3;
- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5;
- (void)requestPINWithRemainingRetries:(unint64_t)a3 completionHandler:(id)a4;
- (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3;
- (void)test_addAutoFillEvent:(id)a3 url:(id)a4;
- (void)test_addCredentialProviderExtensionLoginChoiceWithName:(id)a3 extensionBundleID:(id)a4 containingAppBundleID:(id)a5;
- (void)test_clearCredentialProviderExtensionLoginChoices;
- (void)test_setIsClientEntitledWebBrowser:(BOOL)a3;
- (void)test_setOverrideCanCreateICloudKeychainPasskey:(BOOL)a3;
- (void)test_setOverrideEntitlements:(id)a3;
- (void)test_setOverrideExtensionStates:(id)a3;
- (void)test_setOverrideISLAContextValid:(BOOL)a3;
- (void)userSelectedLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5;
@end

@implementation ASCAgent

- (ASCAgent)initWithTrafficController:(id)a3 connection:(id)a4 publicKeyCredentialManager:(id)a5 signInEventCollector:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)ASCAgent;
  v15 = [(ASCAgent *)&v37 init];
  if (v15)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_219326000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AuthorizationRequestReceivedToShowingUI", "", buf, 2u);
    }
    os_activity_t v17 = _os_activity_create(&dword_219326000, "ASCAgent request", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    authorizationActivity = v15->_authorizationActivity;
    v15->_authorizationActivity = (OS_os_activity *)v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(1);
    internalSemaphore = v15->_internalSemaphore;
    v15->_internalSemaphore = (OS_dispatch_semaphore *)v19;

    objc_storeStrong((id *)&v15->_authorizationTrafficController, a3);
    uint64_t v21 = [MEMORY[0x263F08C38] UUID];
    authorizationTrafficControllerToken = v15->_authorizationTrafficControllerToken;
    v15->_authorizationTrafficControllerToken = (NSUUID *)v21;

    objc_storeStrong((id *)&v15->_connection, a4);
    objc_storeStrong((id *)&v15->_publicKeyCredentialManager, a5);
    objc_storeStrong((id *)&v15->_signInEventCollector, a6);
    *(_OWORD *)buf = 0u;
    long long v36 = 0u;
    if (v12) {
      [v12 auditToken];
    }
    long long v33 = *(_OWORD *)buf;
    long long v34 = v36;
    if ((WBSAuditTokenHasEntitlement() & 1) != 0
      || (long long v33 = *(_OWORD *)buf, v34 = v36, (WBSAuditTokenHasEntitlement() & 1) != 0))
    {
      char HasEntitlement = 1;
    }
    else
    {
      long long v33 = *(_OWORD *)buf;
      long long v34 = v36;
      char HasEntitlement = WBSAuditTokenHasEntitlement();
    }
    v15->_isClientEntitledWebBrowser = HasEntitlement;
    long long v33 = *(_OWORD *)buf;
    long long v34 = v36;
    v15->_isClientEntitledInternalProcess = WBSAuditTokenHasEntitlement();
    v24 = [MEMORY[0x263F66568] sharedManager];
    [v24 addWeakObserver:v15];

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    test_credentialProviderExtensionLoginChoices = v15->_test_credentialProviderExtensionLoginChoices;
    v15->_test_credentialProviderExtensionLoginChoices = v25;

    v27 = v15->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__ASCAgent_initWithTrafficController_connection_publicKeyCredentialManager_signInEventCollector___block_invoke;
    block[3] = &unk_26439ED00;
    v28 = v15;
    v32 = v28;
    os_activity_apply(v27, block);
    v29 = v28;
  }
  return v15;
}

void __97__ASCAgent_initWithTrafficController_connection_publicKeyCredentialManager_signInEventCollector___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134349056;
    uint64_t v5 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Initializing ASCAgent %{public}p.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)performAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)performAuthorizationRequestsForContext:(id)a3 withPresenter:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x263F08D68] currentConnection];
  objc_storeStrong((id *)&self->_requestPresenter, a4);
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke;
  block[3] = &unk_26439ED00;
  id v13 = v8;
  id v28 = v13;
  os_activity_apply(authorizationActivity, block);
  internalSemaphore = self->_internalSemaphore;
  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(internalSemaphore, v15)) {
    v16 = &__block_literal_global_0;
  }
  else {
    v16 = &__block_literal_global_62;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, v16);
  id v17 = objc_alloc_init(MEMORY[0x263F663B8]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_64;
  v26[3] = &unk_26439ED00;
  v26[4] = self;
  [v17 setHandler:v26];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_67;
  v21[3] = &unk_26439EDE0;
  id v22 = v17;
  v23 = self;
  id v24 = v11;
  id v25 = v10;
  id v18 = v11;
  id v19 = v10;
  id v20 = v17;
  [(ASCAgent *)self _prepareForAuthorizationRequestsForContext:v13 clientConnection:v18 withPresentationHandler:v21];
}

uint64_t __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_INFO, "Beginning request: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) logRequest];
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_59()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_59_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_60()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[ASCAgent performAuthorizationRequestsForContext:withPresenter:completionHandler:]_block_invoke";
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Acquired lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_64(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 184));
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 176);

  os_activity_apply(v2, &__block_literal_global_66);
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[ASCAgent performAuthorizationRequestsForContext:withPresenter:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Released lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    id v17 = *(NSObject **)(*(void *)(a1 + 40) + 176);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_68;
    block[3] = &unk_26439ED00;
    id v22 = v6;
    os_activity_apply(v17, block);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    goto LABEL_15;
  }
  uint64_t v8 = [v5 savedAccountContext];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = v8;

  uint64_t v11 = [v5 requestStyle];
  if (v11 == 2)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v16);
  }
  else if (v11 == 1)
  {
    id v19 = _Block_copy(*(const void **)(a1 + 56));
    uint64_t v20 = *(void *)(a1 + 40);
    v16 = *(void **)(v20 + 96);
    *(void *)(v20 + 96) = v19;
  }
  else
  {
    if (v11) {
      goto LABEL_13;
    }
    id v12 = _Block_copy(*(const void **)(a1 + 56));
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = *(void **)(v13 + 96);
    *(void *)(v13 + 96) = v12;

    dispatch_time_t v15 = *(void **)(a1 + 40);
    if (v15[9])
    {
      v16 = 0;
    }
    else
    {
      v16 = [MEMORY[0x263F29CB8] processHandleForNSXPCConnection:*(void *)(a1 + 48)];
      dispatch_time_t v15 = *(void **)(a1 + 40);
    }
    [v15 _presentAuthorizationRequestWithContext:v5 implicitlySelectedLoginChoice:0 forProcess:v16 completionHandler:*(void *)(a1 + 56)];
  }

LABEL_13:
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "test_runBlockToRunAfterReceivingRequest");
  }
LABEL_15:
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_68(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_68_cold_1(a1, v2);
  }
}

- (void)performSilentAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08D68] currentConnection];
  if ([v6 requestStyle] == 2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke;
    v10[3] = &unk_26439EEA0;
    v10[4] = self;
    id v12 = v7;
    id v11 = v8;
    [(ASCAgent *)self _prepareForAuthorizationRequestsForContext:v6 clientConnection:v11 withPresentationHandler:v10];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v57[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_74;
    aBlock[3] = &unk_26439EE30;
    aBlock[4] = *(void *)(a1 + 32);
    id v51 = *(id *)(a1 + 48);
    uint64_t v8 = (void (**)(void *, void, void *))_Block_copy(aBlock);
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9) {
      [v9 auditToken];
    }
    else {
      memset(v49, 0, sizeof(v49));
    }
    id v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v49 length:32];
    uint64_t v13 = [[ASCAuthorizationPresentationContext alloc] initWithRequestContext:v5 appIdentifier:0 shouldUseRelyingPartyForServiceName:1 auditTokenData:v12];
    [*(id *)(a1 + 32) _configureLoginChoicesForPresentationContext:v13 withRequestContext:v5];
    if ([v5 isRegistrationRequest])
    {
      id v14 = [(ASCAuthorizationPresentationContext *)v13 loginChoices];
      objc_msgSend(v14, "safari_firstObjectPassingTest:", &__block_literal_global_80);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v15 isRegistrationRequest] & 1) == 0)
      {
        v26 = *(NSObject **)(*(void *)(a1 + 32) + 176);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4;
        v47[3] = &unk_26439ED00;
        id v48 = v15;
        id v15 = v15;
        os_activity_apply(v26, v47);
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v56 = *MEMORY[0x263F08338];
        v57[0] = @"Found an unexpected credential in conditional registration request.";
        id v28 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
        v29 = [v27 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v28];
        v8[2](v8, 0, v29);

        goto LABEL_25;
      }
    }
    else
    {
      v16 = *(void **)(a1 + 32);
      id v17 = [(ASCAuthorizationPresentationContext *)v13 loginChoices];
      id v15 = [v16 _implicitlySelectAssertionLoginChoiceFromChoices:v17 forContext:v5];

      if (!v15)
      {
        os_activity_apply(*(os_activity_t *)(*(void *)(a1 + 32) + 176), &__block_literal_global_88);
        v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v54 = *MEMORY[0x263F08338];
        v55 = @"Could not find the requested credential.";
        id v15 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id v14 = [v30 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v15];
        v8[2](v8, 0, v14);
        goto LABEL_25;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v15;
      if ([v14 isRegistrationRequest])
      {
        [v5 setIsConditionalRegistrationRequest:1];
        uint64_t v18 = [*(id *)(a1 + 32) _bundleIDFromAppID:*(void *)(*(void *)(a1 + 32) + 64)];
        if ([*(id *)(*(void *)(a1 + 32) + 64) isEqualToString:@"AuthenticationServicesCoreUnitTests"])
        {
          uint64_t v19 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariApplicationPlatformBundleIdentifier");

          uint64_t v18 = (void *)v19;
        }
        uint64_t v20 = *(void *)(a1 + 32);
        v38 = v18;
        if (*(unsigned char *)(v20 + 80)
          || *(unsigned char *)(v20 + 81)
          && (char v32 = [v18 isEqualToString:@"com.apple.sfapp"],
              uint64_t v20 = *(void *)(a1 + 32),
              (v32 & 1) == 0))
        {
          long long v36 = *(void **)(v20 + 112);
          uint64_t v35 = [v14 userVisibleName];
          uint64_t v21 = [v14 relyingPartyIdentifier];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_99;
          v43[3] = &unk_26439EE78;
          v43[4] = *(void *)(a1 + 32);
          objc_super v37 = (id *)&v44;
          v44 = v13;
          id v22 = &v45;
          id v45 = v5;
          v23 = (id *)&v46;
          v46 = v8;
          id v24 = (void *)v35;
          [v36 providerForRecentlyFilledCredentialWithUsername:v35 forRelyingPartyIdentifier:v21 inAppWithBundleIdentifier:v38 completionHandler:v43];

          id v25 = v38;
        }
        else
        {
          long long v33 = *(void **)(v20 + 112);
          id v24 = [v14 userVisibleName];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_101;
          v39[3] = &unk_26439EE78;
          v39[4] = *(void *)(a1 + 32);
          objc_super v37 = (id *)&v40;
          v40 = v13;
          id v22 = &v41;
          id v41 = v5;
          v23 = (id *)&v42;
          v42 = v8;
          long long v34 = v33;
          id v25 = v38;
          [v34 providerForRecentlyFilledCredentialWithUsername:v24 forAppWithBundleIdentifier:v38 completionHandler:v39];
        }

        id v15 = v14;
        goto LABEL_25;
      }
    }
    v31 = *(void **)(a1 + 32);
    id v14 = [v5 authenticatedContext];
    [v31 userSelectedLoginChoice:v15 authenticatedContext:v14 completionHandler:v8];
LABEL_25:

    id v11 = v51;
    goto LABEL_26;
  }
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2;
  block[3] = &unk_26439ED00;
  id v53 = v6;
  os_activity_apply(v10, block);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v11 = v53;
LABEL_26:
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_68_cold_1(a1, v2);
  }
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _authorizationCompletedWithCredential:v5 error:v6];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[8];
  uint64_t v9 = (void *)v7[1];
  uint64_t v10 = v7[2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_75;
  v14[3] = &unk_26439EE08;
  id v11 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  [v9 endAuthorizationForAppIdentifier:v8 token:v10 clearanceHandler:v14];
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_75(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isRegistrationRequest];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4_cold_1();
  }
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_86()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_86_cold_1();
  }
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_99(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestConditionalRegistrationOnProvider:a2 presentationContext:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_101(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestConditionalRegistrationOnProvider:a2 presentationContext:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_requestConditionalRegistrationOnProvider:(id)a3 presentationContext:(id)a4 requestContext:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy_;
  objc_super v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  if ([v10 isEqualToString:*MEMORY[0x263F664C8]])
  {
    id v32 = 0;
    BOOL v14 = [(ASCAgent *)self _canCreateICloudKeychainPasskeyPreflightWithError:&v32];
    id v15 = v32;
    if (v14)
    {
      id v16 = [v11 loginChoices];
      uint64_t v17 = objc_msgSend(v16, "safari_firstObjectPassingTest:", &__block_literal_global_103);
      uint64_t v18 = (void *)v34[5];
      v34[5] = v17;

      uint64_t v19 = [(id)v34[5] name];
      uint64_t v20 = [(id)v34[5] relyingPartyIdentifier];
      BOOL v21 = [(ASCAgent *)self _canPerformConditionalRegistrationInICloudKeychainForUsername:v19 relyingParty:v20];

      if (v21)
      {
        uint64_t v22 = v34[5];
        v23 = [v12 authenticatedContext];
        [(ASCAgent *)self userSelectedLoginChoice:v22 authenticatedContext:v23 completionHandler:v13];
      }
      else
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_105);
        v23 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:2 userInfo:0];
        v13[2](v13, 0, v23);
      }
    }
    else
    {
      v13[2](v13, 0, v15);
    }
  }
  else if (v10)
  {
    id v24 = [MEMORY[0x263F66568] sharedManager];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_106;
    v26[3] = &unk_26439EEF0;
    v26[4] = self;
    v30 = v13;
    v31 = &v33;
    id v27 = v11;
    id v28 = v10;
    id v29 = v12;
    [v24 getExtensionWithBundleID:v28 completion:v26];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_114);
    id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:12 userInfo:0];
    v13[2](v13, 0, v25);
  }
  _Block_object_dispose(&v33, 8);
}

uint64_t __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2) {
    uint64_t v3 = [v2 isExternal] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_cold_1();
  }
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F66568];
  id v4 = a2;
  id v5 = [v3 sharedManager];
  char v6 = [v5 extensionSupportsConditionalPasskeyRegistration:v4];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) loginChoices];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_110;
    v14[3] = &unk_26439EEC8;
    id v15 = *(id *)(a1 + 48);
    uint64_t v8 = objc_msgSend(v7, "safari_firstObjectPassingTest:", v14);
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = [MEMORY[0x263F29CB8] processHandleForNSXPCConnection:*(void *)(*(void *)(a1 + 32) + 48)];
    [*(id *)(a1 + 32) _presentAuthorizationRequestWithContext:*(void *)(a1 + 56) implicitlySelectedLoginChoice:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forProcess:v11 completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    os_activity_apply(*(os_activity_t *)(*(void *)(a1 + 32) + 176), &__block_literal_global_109);
    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v13);
  }
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_107()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_107_cold_1();
  }
}

uint64_t __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_110(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 loginChoiceKind] == 2)
  {
    id v4 = [v3 externalCredentialProviderBundleID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_112()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_112_cold_1();
  }
}

- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  if (WBSAuditTokenHasEntitlement())
  {
    id v10 = [MEMORY[0x263F662C0] sharedManager];
    uint64_t v11 = [v10 keyBagLockStatus];

    if (v11)
    {
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[ASCAgent getPasskeysDataForRelyingParty:withCompletionHandler:]();
      }
    }
    id v13 = -[ASPublicKeyCredentialManagerInterface allPasskeysDataForRelyingParty:](self->_publicKeyCredentialManager, "allPasskeysDataForRelyingParty:", v6, v15, v16);
    v7[2](v7, v13);
  }
  else
  {
    BOOL v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ASCAgent getPasskeysDataForRelyingParty:withCompletionHandler:]();
    }
    v7[2](v7, 0);
  }
}

- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_219326000, v11, OS_LOG_TYPE_INFO, "Received request to delete passkey %{public}@ for %{public}@.", buf, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x263F08D68] currentConnection];
  if ([(ASCAgent *)self _isConnection:v12 entitledToDeletePasskeysForRelyingParty:v8])
  {
    id v13 = [MEMORY[0x263F662C0] sharedManager];
    uint64_t v14 = [v13 keyBagLockStatus];

    if (v14)
    {
      long long v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ASCAgent deletePasskeyForRelyingParty:withCredentialID:completionHandler:]();
      }
      long long v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08338];
      id v24 = @"KeyBag is currently locked.";
      id v17 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v18 = [v16 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v17];
      v10[2](v10, 0, v18);
    }
    else
    {
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      id v22 = 0;
      uint64_t v21 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager deletePasskeyForRelyingParty:v8 withCredentialID:v9 error:&v22];
      id v17 = v22;
      v10[2](v10, v21, v17);
    }
  }
  else
  {
    uint64_t v19 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[ASCAgent deletePasskeyForRelyingParty:withCredentialID:completionHandler:]();
    }
    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    v10[2](v10, 0, v17);
  }
}

- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "Received request to delete all passkeys for %{public}@.", buf, 0xCu);
  }
  id v9 = [MEMORY[0x263F08D68] currentConnection];
  if ([(ASCAgent *)self _isConnection:v9 entitledToDeletePasskeysForRelyingParty:v6])
  {
    id v10 = [MEMORY[0x263F662C0] sharedManager];
    uint64_t v11 = [v10 keyBagLockStatus];

    if (v11)
    {
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ASCAgent deleteAllPasskeysForRelyingParty:completionHandler:]();
      }
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08338];
      uint64_t v21 = @"KeyBag is currently locked.";
      id v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      long long v15 = [v13 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v14];
      v7[2](v7, 0, v15);
    }
    else
    {
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      id v19 = 0;
      uint64_t v18 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager deleteAllPasskeysForRelyingParty:v6 error:&v19];
      id v14 = v19;
      v7[2](v7, v18, v14);
    }
  }
  else
  {
    long long v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ASCAgent deleteAllPasskeysForRelyingParty:completionHandler:]();
    }
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    v7[2](v7, 0, v14);
  }
}

- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = [(ASCAgent *)self _canCreateICloudKeychainPasskeyPreflightWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, id))a5;
  uint64_t v11 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 auditToken];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  if (WBSAuditTokenHasEntitlement())
  {
    publicKeyCredentialManager = self->_publicKeyCredentialManager;
    id v14 = objc_alloc(MEMORY[0x263F66350]);
    long long v15 = [v8 base64EncodedStringWithOptions:0];
    long long v16 = (void *)[v14 initWithCredentialID:v15 groupID:&stru_26CAB9030];
    id v20 = 0;
    uint64_t v17 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager renamePasskeywithIdentifier:v16 newName:v9 error:&v20];
    id v18 = v20;

    v10[2](v10, v17, v18);
  }
  else
  {
    id v19 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[ASCAgent renamePasskeyWithCredentialID:newName:completionHandler:]();
    }
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    v10[2](v10, 0, v18);
  }
}

- (void)_openPasswordOptions:(id)a3
{
  id v3 = NSURL;
  id v4 = (void (**)(id, id))a3;
  BOOL v5 = [v3 URLWithString:@"prefs:root=General&path=AUTOFILL"];
  id v6 = [MEMORY[0x263F01880] defaultWorkspace];
  id v8 = 0;
  [v6 openSensitiveURL:v5 withOptions:0 error:&v8];
  id v7 = v8;

  v4[2](v4, v7);
}

- (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = [MEMORY[0x263F08D68] currentConnection];
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  id v7 = WBSApplicationIdentifierFromAuditToken();

  id v8 = [(ASCAgent *)self _bundleIDFromAppID:v7];
  id v9 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariApplicationPlatformBundleIdentifier");
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v11 = (id)*MEMORY[0x263F664C8];

    id v8 = v11;
  }
  if ([(ASCAgent *)self _isExtensionEnabled:v8])
  {
    v4[2](v4, 1);
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"turnOnAutoFillRequestLastDate-%@", v8];
    id v13 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    id v14 = objc_msgSend(v13, "safari_dateForKey:", v12);

    if (v14
      && ([MEMORY[0x263EFF910] now],
          long long v15 = objc_claimAutoreleasedReturnValue(),
          [v15 timeIntervalSinceDate:v14],
          double v17 = v16,
          v15,
          v17 <= 10.0))
    {
      long long v21 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219326000, v21, OS_LOG_TYPE_INFO, "AutoFill enablement API failed request because not enough time passed since last request.", buf, 2u);
      }
      BOOL v18 = 0;
    }
    else
    {
      BOOL v18 = [(ASCAgent *)self _showExtensionEnablementAlert:v8];
      id v19 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
      id v20 = [MEMORY[0x263EFF910] now];
      objc_msgSend(v19, "safari_setDate:forKey:", v20, v12);
    }
    v4[2](v4, v18);
  }
}

- (BOOL)_isExtensionEnabled:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F664C8]])
  {
    id v4 = [MEMORY[0x263F66550] sharedFeatureManager];
    char v5 = [v4 shouldAutoFillPasswordsFromKeychain];
  }
  else
  {
    id v4 = [MEMORY[0x263F66568] sharedManager];
    id v6 = [v4 getEnabledExtensionsSynchronously];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__ASCAgent__isExtensionEnabled___block_invoke;
    v8[3] = &unk_26439EF18;
    id v9 = v3;
    char v5 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v8);
  }
  return v5;
}

uint64_t __32__ASCAgent__isExtensionEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "sf_bundleIdentifierForContainingApp");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_showExtensionEnablementAlert:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 isEqualToString:*MEMORY[0x263F664C8]];
  if (v4)
  {
    char v5 = _WBSLocalizedString();
    id v6 = 0;
LABEL_14:
    BOOL v18 = NSString;
    id v19 = _WBSLocalizedString();
    id v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v5);

    long long v21 = NSString;
    long long v22 = _WBSLocalizedString();
    long long v23 = objc_msgSend(v21, "localizedStringWithFormat:", v22, v5);

    uint64_t v24 = *MEMORY[0x263EFFFD8];
    v38[0] = *MEMORY[0x263EFFFC8];
    v38[1] = v24;
    v39[0] = v23;
    v39[1] = v20;
    v38[2] = *MEMORY[0x263F00000];
    id v25 = _WBSLocalizedString();
    v39[2] = v25;
    v38[3] = *MEMORY[0x263EFFFE8];
    id v26 = _WBSLocalizedString();
    v39[3] = v26;
    __int16 v27 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    CFDictionaryRef v28 = (const __CFDictionary *)[v27 mutableCopy];

    uint64_t v29 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 2uLL, 0, v28);
    CFOptionFlags responseFlags = 3;
    CFUserNotificationReceiveResponse(v29, 0.0, &responseFlags);
    CFRelease(v29);
    BOOL v15 = (responseFlags & 3) == 0;
    if ((responseFlags & 3) == 0)
    {
      v30 = [MEMORY[0x263F66550] sharedFeatureManager];
      [v30 setShouldAutoFillPasswords:1];

      if (v4)
      {
        v31 = [MEMORY[0x263F66550] sharedFeatureManager];
        [v31 setShouldAutoFillPasswordsFromKeychain:1];
      }
      else
      {
        v31 = [MEMORY[0x263F66568] sharedManager];
        [v31 setExtension:v6 isEnabled:1];
      }
    }
    goto LABEL_20;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [MEMORY[0x263F66568] sharedManager];
  id v6 = [v7 extensionsSync];

  uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v8)
  {
LABEL_11:
    BOOL v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v35;
LABEL_5:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v35 != v10) {
      objc_enumerationMutation(v6);
    }
    uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
    id v13 = objc_msgSend(v12, "sf_bundleIdentifierForContainingApp");
    char v14 = [v13 isEqualToString:v3];

    if (v14) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  id v16 = v12;

  if (v16)
  {
    double v17 = [v16 _plugIn];
    char v5 = [v17 localizedContainingName];

    id v6 = v16;
    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_21:

  return v15;
}

- (id)_implicitlySelectAssertionLoginChoiceFromChoices:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] != 1)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke;
    block[3] = &unk_26439ED00;
    id v18 = v6;
    os_activity_apply(authorizationActivity, block);
    id v10 = 0;
    id v9 = v18;
    goto LABEL_14;
  }
  uint64_t v8 = [v6 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = self->_authorizationActivity;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_148;
    v15[3] = &unk_26439ED00;
    id v9 = v8;
    id v16 = v9;
    os_activity_apply(v12, v15);

    id v10 = 0;
    goto LABEL_14;
  }
  id v9 = v8;
  if (![v9 isRegistrationRequest])
  {
    id v13 = [v7 authenticatedContext];
    if (v13)
    {
      if ([(ASCAgent *)self _isValidContext:v13])
      {
        id v10 = v9;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_154);
    }
    id v10 = 0;
    goto LABEL_12;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_151);
  id v10 = 0;
LABEL_13:

LABEL_14:

  return v10;
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_cold_1(a1, v2);
  }
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_148()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_148_cold_1();
  }
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_149()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_149_cold_1();
  }
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_152()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_152_cold_1();
  }
}

- (void)cancelCurrentRequest
{
  internalSemaphore = self->_internalSemaphore;
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(internalSemaphore, v4)) {
    char v5 = &__block_literal_global_156;
  }
  else {
    char v5 = &__block_literal_global_159;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, v5);
  [(ASCAuthorizationTrafficController *)self->_authorizationTrafficController cancelAuthorizationForAppIdentifierIfNecessary:self->_clientApplicationIdentifier token:self->_authorizationTrafficControllerToken];
  uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:2 userInfo:0];
  publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
  id v8 = (id)v6;
  if (publicKeyCredentialOperationUUID) {
    [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager cancelOperationIfNecessaryWithUUID:publicKeyCredentialOperationUUID overrideError:v6];
  }
  else {
    [(ASCAgent *)self _authorizationCompletedWithCredential:0 error:v6];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_internalSemaphore);
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_162);
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __32__ASCAgent_cancelCurrentRequest__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke_157()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[ASCAgent cancelCurrentRequest]_block_invoke";
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Acquired lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke_160()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[ASCAgent cancelCurrentRequest]_block_invoke";
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Released lock for %s", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_prepareForAuthorizationRequestsForContext:(id)a3 clientConnection:(id)a4 withPresentationHandler:(id)a5
{
  v38[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  [v8 sanitizeRequestTypesForAutoFillRequestIfNecessary];
  [v8 applyMagicCredentialIDIfNecessary];
  if ([v8 isCABLEAuthenticatorRequest]
    && !+[ASCWebKitSPISupport shouldUseAlternateCredentialStore])
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_165);
    char v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08338];
    _WBSLocalizedString();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    double v17 = v14;
    uint64_t v18 = 5;
LABEL_19:
    __int16 v27 = [v17 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:v18 userInfo:v16];
    v10[2](v10, 0, v27);

    goto LABEL_21;
  }
  uint64_t v11 = [v8 proxiedAppIdentifier];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    if (v9)
    {
      [v9 auditToken];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
    }
    WBSApplicationIdentifierFromAuditToken();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = v13;

  if (![v15 length])
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_171);
    id v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08338];
    long long v36 = @"The calling process does not have an application identifier. Make sure it is properly configured.";
    id v16 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    double v17 = v26;
    uint64_t v18 = 1;
    goto LABEL_19;
  }
  if ([(ASCAgent *)self _shouldApplyQuirksToClientWithApplicationIdentifier:v15])
  {
    uint64_t v19 = [v8 requestTypes];
    if ((ascCredentialRequestTypesAllPasskey() & v19) != 0)
    {
      id v20 = [v8 relyingPartyIdentifier];
      long long v21 = +[ASFeatureManager sharedManager];
      int v22 = [v21 arePasskeysDisallowedForRelyingParty:v20];

      if (v22)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_178);
        [v8 removePasskeyRequests];
      }
    }
  }
  id v32 = 0;
  BOOL v23 = [(ASCAgent *)self _isClientWithApplicationIdentifier:v15 properlyEntitledForRequestContext:v8 error:&v32];
  id v16 = v32;
  if (v23)
  {
    authorizationTrafficController = self->_authorizationTrafficController;
    authorizationTrafficControllerToken = self->_authorizationTrafficControllerToken;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_182;
    v28[3] = &unk_26439EFB8;
    v31 = v10;
    v28[4] = self;
    id v15 = v15;
    id v29 = v15;
    id v30 = v8;
    [(ASCAuthorizationTrafficController *)authorizationTrafficController beginAuthorizationForApplicationIdentifier:v15 token:authorizationTrafficControllerToken withClearanceHandler:v28];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_181);
    v10[2](v10, 0, v16);
  }
LABEL_21:
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_cold_1();
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_169()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_169_cold_1();
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_176()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Dropping passkey requests from quirked relying party.", v1, 2u);
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_179()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_179_cold_1();
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_182(id *a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    objc_storeStrong((id *)a1[4] + 8, a1[5]);
    objc_storeStrong((id *)a1[4] + 7, a1[6]);
    uint64_t v7 = dispatch_group_create();
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    char v66 = 0;
    uint64_t v8 = [*((id *)a1[4] + 7) requestTypes];
    if ((v8 & 2) != 0)
    {
      dispatch_group_enter(v7);
      id v9 = a1[4];
      id v10 = a1[6];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2;
      v63[3] = &unk_26439ED00;
      v64 = v7;
      [v9 _configureAppleIDCredentialWithContext:v10 completionHandler:v63];
    }
    if (v8)
    {
      dispatch_group_enter(v7);
      id v11 = a1[4];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3;
      v61[3] = &unk_26439ED00;
      v62 = v7;
      [v11 _configurePasswordCredentialsWithCompletionHandler:v61];
    }
    if ((v8 & 0x28) == 0) {
      goto LABEL_17;
    }
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    if ((v8 & 8) != 0)
    {
      id v13 = [a1[6] platformKeyCredentialAssertionOptions];
      [v12 addObject:v13];
    }
    if ((v8 & 0x20) != 0)
    {
      char v14 = [a1[6] securityKeyCredentialAssertionOptions];
      [v12 addObject:v14];
    }
    dispatch_group_enter(v7);
    id v15 = [v12 firstObject];
    id v16 = [v15 origin];

    v44 = [a1[6] relyingPartyIdentifier];
    double v17 = a1[4];
    if (v17[80])
    {
      uint64_t v18 = [v16 length];
      double v17 = a1[4];
      if (v18)
      {
        if (![a1[4] _isRPIDValid:v44 forOrigin:v16])
        {
          id v38 = objc_alloc_init(_TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher);
          v39 = a1[4];
          v40 = (void *)v39[32];
          v39[32] = v38;

          uint64_t v41 = (void *)*((void *)a1[4] + 32);
          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4;
          v55[3] = &unk_26439EF40;
          v42 = v7;
          v60 = v65;
          id v43 = a1[4];
          v56[0] = v42;
          v56[1] = v43;
          id v57 = v12;
          id v58 = a1[5];
          id v59 = a1[6];
          [v41 isOrigin:v16 relatedToRelyingPartyIdentifier:v44 completionHandler:v55];
          long long v21 = (id *)v56;

          goto LABEL_16;
        }
        double v17 = a1[4];
      }
    }
    id v19 = a1[5];
    uint64_t v20 = objc_msgSend(a1[6], "requestStyle", v44);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2_189;
    v53[3] = &unk_26439ED00;
    uint64_t v54 = v7;
    [v17 _configurePublicKeyCredentialsWithAssertionOptions:v12 forProcessWithApplicationIdentifier:v19 requestStyle:v20 completionHandler:v53];
    long long v21 = (id *)&v54;
LABEL_16:

LABEL_17:
    if ((v8 & 4) != 0)
    {
      int v22 = [a1[6] platformKeyCredentialCreationOptions];
      BOOL v23 = [v22 origin];

      uint64_t v24 = [a1[6] relyingPartyIdentifier];
      if (*((unsigned char *)a1[4] + 80)
        && [v23 length]
        && ([a1[4] _isRPIDValid:v24 forOrigin:v23] & 1) == 0)
      {
        dispatch_group_enter(v7);
        id v25 = objc_alloc_init(_TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher);
        id v26 = a1[4];
        __int16 v27 = (void *)v26[32];
        v26[32] = v25;

        CFDictionaryRef v28 = (void *)*((void *)a1[4] + 32);
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3_190;
        v50[3] = &unk_26439EF68;
        id v51 = v7;
        v52 = v65;
        [v28 isOrigin:v23 relatedToRelyingPartyIdentifier:v24 completionHandler:v50];
      }
    }
    if (v8 == 16)
    {
      id v29 = a1[4];
      id v30 = (void *)*((void *)v29 + 13);
      v31 = [*((id *)v29 + 7) securityKeyCredentialCreationOptions];
      id v32 = (id *)a1[4];
      long long v33 = [v32[7] globalFrameID];
      uint64_t v34 = [v30 beginCreatingNewSecurityKeyCredentialIfAvailableWithOptions:v31 delegate:v32 webFrameIdentifier:v33 parentActivity:*((void *)a1[4] + 22)];
      uint64_t v35 = a1[4];
      long long v36 = (void *)v35[21];
      v35[21] = v34;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_192;
    block[3] = &unk_26439EF90;
    id v37 = a1[4];
    id v48 = v65;
    void block[4] = v37;
    id v47 = a1[7];
    uint64_t v49 = v8;
    id v46 = a1[6];
    dispatch_group_notify(v7, MEMORY[0x263EF83A0], block);

    _Block_object_dispose(v65, 8);
    goto LABEL_29;
  }
  if (!v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServicesCore.AuthorizationError", 0, @"Traffic controller denied request.");
  }
  (*((void (**)(void))a1[7] + 2))();
LABEL_29:
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2(uint64_t a1)
{
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3(uint64_t a1)
{
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F663B8]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_5;
  v14[3] = &unk_26439ED00;
  id v15 = *(id *)(a1 + 32);
  [v6 setHandler:v14];
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = [*(id *)(a1 + 64) requestStyle];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_187;
    v12[3] = &unk_26439ED00;
    id v13 = v6;
    [v7 _configurePublicKeyCredentialsWithAssertionOptions:v8 forProcessWithApplicationIdentifier:v9 requestStyle:v10 completionHandler:v12];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    id v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_cold_1();
    }
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_5(uint64_t a1)
{
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2_189(uint64_t a1)
{
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_3_190(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F663B8]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_191;
  v8[3] = &unk_26439ED00;
  id v9 = *(id *)(a1 + 32);
  [v6 setHandler:v8];
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_cold_1();
    }
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_191(uint64_t a1)
{
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_192(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_192_cold_1();
    }
    [*(id *)(*(void *)(a1 + 32) + 8) endAuthorizationForAppIdentifier:*(void *)(*(void *)(a1 + 32) + 64) token:*(void *)(*(void *)(a1 + 32) + 16) clearanceHandler:&__block_literal_global_195];
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08338];
    v12[0] = @"The requested RPID did not match the origin or related origins.";
    id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v6 = [v4 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:17 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (([*(id *)(a1 + 32) _hasSignInOptionsForRequestContext:*(void *)(a1 + 40)] & 1) != 0
      || (v7 & 0x14) != 0)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      v9();
    }
    else
    {
      os_activity_apply(*(os_activity_t *)(*(void *)(a1 + 32) + 176), &__block_literal_global_201);
      [*(id *)(*(void *)(a1 + 32) + 8) endAuthorizationForAppIdentifier:*(void *)(*(void *)(a1 + 32) + 64) token:*(void *)(*(void *)(a1 + 32) + 16) clearanceHandler:&__block_literal_global_204];
      uint64_t v8 = *(void *)(a1 + 48);
      id v10 = [*(id *)(a1 + 32) _noCredentialsFoundErrorForRequestContext:*(void *)(*(void *)(a1 + 32) + 56)];
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_2_199()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Canceling request due to no matching credentials.", v1, 2u);
  }
}

- (BOOL)_isRPIDValid:(id)a3 forOrigin:(id)a4
{
  id v5 = a3;
  id v6 = [NSURL URLWithString:a4];
  uint64_t v7 = [v6 host];

  if (!v7) {
    goto LABEL_8;
  }
  if (([v5 isEqualToString:v7] & 1) == 0)
  {
    id v9 = objc_msgSend(v7, "safari_domainFromHost");
    if ([v5 hasSuffix:v9])
    {

LABEL_7:
      uint64_t v12 = objc_msgSend(v5, "safari_effectiveTopLevelDomainForHost");
      int v8 = [v5 isEqualToString:v12] ^ 1;

      goto LABEL_9;
    }
    id v10 = objc_msgSend(v7, "safari_highLevelDomainFromHost");
    int v11 = [v5 hasSuffix:v10];

    if (v11) {
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v8) = 0;
    goto LABEL_9;
  }
  LOBYTE(v8) = 1;
LABEL_9:

  return v8;
}

- (id)_noCredentialsFoundErrorForRequestContext:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isCABLEAuthenticatorRequest])
  {
    v39 = v3;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v4 = [MEMORY[0x263F66568] sharedManager];
    id v5 = [v4 getEnabledExtensionsSynchronously];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      id v9 = 0;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v13 = [MEMORY[0x263F66568] sharedManager];
          int v14 = [v13 extensionSupportsPasskeys:v12];

          if (v14)
          {
            id v15 = v12;

            char v8 = 1;
            id v9 = v15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
      id v9 = 0;
    }

    id v19 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v20 = objc_msgSend(v9, "sf_bundleIdentifierForContainingApp");
    long long v21 = (void *)[v19 initWithBundleIdentifier:v20 allowPlaceholder:0 error:0];
    int v22 = [v21 localizedName];

    id v3 = v39;
    BOOL v23 = [v39 platformKeyCredentialAssertionOptions];
    uint64_t v24 = [v23 allowedCredentials];
    uint64_t v25 = [v24 count];

    id v26 = (void *)MEMORY[0x263F087E8];
    if (v25)
    {
      if (v8)
      {
        uint64_t v52 = *MEMORY[0x263F08338];
        __int16 v27 = NSString;
        CFDictionaryRef v28 = _WBSLocalizedString();
        id v29 = [v39 relyingPartyIdentifier];
        id v30 = objc_msgSend(v27, "localizedStringWithFormat:", v28, v22, v29);
        id v53 = v30;
        v31 = NSDictionary;
        id v32 = &v53;
        long long v33 = &v52;
      }
      else
      {
        uint64_t v50 = *MEMORY[0x263F08338];
        uint64_t v35 = NSString;
        CFDictionaryRef v28 = _WBSLocalizedString();
        id v29 = [v39 relyingPartyIdentifier];
        id v30 = objc_msgSend(v35, "localizedStringWithFormat:", v28, v29);
        id v51 = v30;
        v31 = NSDictionary;
        id v32 = &v51;
        long long v33 = &v50;
      }
    }
    else if (v8)
    {
      uint64_t v48 = *MEMORY[0x263F08338];
      uint64_t v34 = NSString;
      CFDictionaryRef v28 = _WBSLocalizedString();
      id v29 = [v39 relyingPartyIdentifier];
      id v30 = objc_msgSend(v34, "localizedStringWithFormat:", v28, v22, v29);
      uint64_t v49 = v30;
      v31 = NSDictionary;
      id v32 = &v49;
      long long v33 = &v48;
    }
    else
    {
      uint64_t v46 = *MEMORY[0x263F08338];
      long long v36 = NSString;
      CFDictionaryRef v28 = _WBSLocalizedString();
      id v29 = [v39 relyingPartyIdentifier];
      id v30 = objc_msgSend(v36, "localizedStringWithFormat:", v28, v29);
      id v47 = v30;
      v31 = NSDictionary;
      id v32 = &v47;
      long long v33 = &v46;
    }
    id v37 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:1];
    uint64_t v18 = [v26 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:5 userInfo:v37];
  }
  else
  {
    if ([v3 isClientLinkedOnOrAfterIOS15Aligned]) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 0;
    }
    double v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08338];
    id v45 = @"No credentials available for login.";
    id v9 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v18 = [v17 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:v16 userInfo:v9];
  }

  return v18;
}

- (void)presentCABLESheetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ASCAuthorizationPresenter);
  requestPresenter = self->_requestPresenter;
  self->_requestPresenter = (ASCAuthorizationPresenterHostProtocol *)v5;

  [(ASCAuthorizationPresenterHostProtocol *)self->_requestPresenter setDelegate:self];
  uint64_t v7 = [ASCAuthorizationPresentationContext alloc];
  requestContext = self->_requestContext;
  clientApplicationIdentifier = self->_clientApplicationIdentifier;
  BOOL isClientEntitledWebBrowser = self->_isClientEntitledWebBrowser;
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v21 length:32];
  id v13 = [(ASCAuthorizationPresentationContext *)v7 initWithRequestContext:requestContext appIdentifier:clientApplicationIdentifier shouldUseRelyingPartyForServiceName:isClientEntitledWebBrowser auditTokenData:v12];

  int v14 = [(ASCAgent *)self _cableLoginChoiceForRequestContext:self->_requestContext];
  [(ASCAuthorizationPresentationContext *)v13 addLoginChoice:v14];

  id v15 = [(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialAssertionOptions];

  if (v15)
  {
    id v16 = [[ASCSecurityKeyPublicKeyCredentialLoginChoice alloc] initAssertionPlaceholderChoice];
    [(ASCAuthorizationPresentationContext *)v13 addLoginChoice:v16];
  }
  double v17 = self->_requestPresenter;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke;
  v19[3] = &unk_26439EE30;
  v19[4] = self;
  id v20 = v4;
  id v18 = v4;
  [(ASCAuthorizationPresenterHostProtocol *)v17 presentAuthorizationWithContext:v13 forProcess:0 completionHandler:v19];
}

void __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke_2;
  double v17 = &unk_26439EFE0;
  id v18 = v5;
  id v19 = v6;
  id v8 = v6;
  id v9 = v5;
  os_activity_apply(v7, &v14);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "dismiss", v14, v15, v16, v17);
  uint64_t v10 = *(void *)(a1 + 32);
  int v11 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 200);
  *(void *)(v12 + 200) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 0;
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9 != 0);
}

void __51__ASCAgent_presentCABLESheetWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    id v5 = v2;
    id v6 = objc_msgSend(v3, "safari_privacyPreservingDescription");
    int v7 = 141558530;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_219326000, v5, OS_LOG_TYPE_DEFAULT, "Completed sheet for AutoFill request: %{mask.hash}@ %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)userSelectedLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  switch([v10 loginChoiceKind])
  {
    case 1:
      [(ASCAgent *)self _credentialRequestedForPasswordLoginChoice:v10 completionHandler:v9];
      break;
    case 2:
      [(ASCAgent *)self _credentialRequestedForPlatformLoginChoice:v10 authenticatedContext:v8 completionHandler:v9];
      break;
    case 3:
      [(ASCAgent *)self _credentialRequestedForSecurityKeyLoginChoice:v10];
      break;
    case 4:
      [(ASCAgent *)self _credentialRequestedForCABLELoginChoice:v10];
      break;
    default:
      break;
  }
}

- (void)_configureAppleIDCredentialWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F663B8]);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke;
  v20[3] = &unk_26439F008;
  id v9 = v7;
  id v21 = v9;
  [v8 setHandler:v20];
  if ([(ASCAgent *)self _clientHasNecessaryAuthKitEntitlements])
  {
    id v10 = [(ASCAgent *)self _bundleIDFromAppID:self->_clientApplicationIdentifier];
    if (v10)
    {
      __int16 v11 = [MEMORY[0x263F290F0] sharedInstance];
      uint64_t v12 = [v11 authKitAccountRequestingAuthorization];

      uint64_t v13 = [v6 appleIDAuthorizationRequest];
      [v13 setAuthkitAccount:v12];

      id v14 = objc_alloc_init(MEMORY[0x263F29138]);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_230;
      v16[3] = &unk_26439F058;
      v16[4] = self;
      id v17 = v12;
      id v18 = v6;
      id v19 = v8;
      id v15 = v12;
      [v14 getCredentialStateForClientID:v10 completion:v16];
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_227);
    }
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_224);
  }
}

uint64_t __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_cold_1();
  }
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_225()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_225_cold_1();
  }
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_230(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    [*(id *)(a1 + 32) _performAuthKitAuthorizationValidationForAccount:*(void *)(a1 + 40)];
    id v5 = objc_alloc_init(MEMORY[0x263F29160]);
    id v6 = [*(id *)(a1 + 48) appleIDAuthorizationRequest];
    id v7 = [v6 authkitAccount];
    [v5 setAuthkitAccount:v7];

    id v8 = [*(id *)(a1 + 32) _bundleIDFromAppID:*(void *)(*(void *)(a1 + 32) + 64)];
    [v5 setClientID:v8];

    id v9 = [*(id *)(a1 + 32) _teamIDfromAppID:*(void *)(*(void *)(a1 + 32) + 64)];
    [v5 setTeamID:v9];

    [v5 setShouldHideCreateOption:1];
    id v10 = objc_alloc_init(MEMORY[0x263F291B8]);
    [v10 setAuthorizationRequest:v5];
    id v11 = objc_alloc_init(MEMORY[0x263F29138]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_233;
    v13[3] = &unk_26439F030;
    id v14 = *(id *)(a1 + 56);
    id v15 = v11;
    uint64_t v16 = *(void *)(a1 + 32);
    id v12 = v11;
    [v12 getPresentationContextForRequestContext:v10 completion:v13];
  }
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_233(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 48) + 176);
    os_activity_apply(v4, &__block_literal_global_235);
  }
  else
  {
    *(void *)(*(void *)(a1 + 48) + 40) = [a2 loginChoices];
    MEMORY[0x270F9A758]();
  }
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_3()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_3_cold_1();
  }
}

- (void)clearAllPlatformPublicKeyCredentialsWithCompletionHandler:(id)a3
{
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  uint64_t v4 = (void (**)(void))a3;
  [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager clearAllCredentials];
  v4[2]();
}

- (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[ASCWebKitSPISupport shouldUseAlternateCredentialStore]);
}

- (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ASFeatureManager sharedManager];
  uint64_t v8 = [v9 arePasskeysDisallowedForRelyingParty:v7];

  (*((void (**)(id, uint64_t))a4 + 2))(v6, v8);
}

- (void)openCABLEURL:(id)a3 fromSourceApplication:(id)a4 withCompletionHandler:(id)a5
{
  v37[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke;
  block[3] = &unk_26439EFE0;
  id v12 = v8;
  id v32 = v12;
  id v13 = v9;
  id v33 = v13;
  os_activity_apply(authorizationActivity, block);
  id v14 = [MEMORY[0x263F08D68] currentConnection];
  id v15 = v14;
  if (v14)
  {
    [v14 auditToken];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  char HasEntitlement = WBSAuditTokenHasEntitlement();

  if ((HasEntitlement & 1) == 0)
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_240);
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08338];
    v37[0] = @"Client is missing required entitlement";
    id v21 = NSDictionary;
    int v22 = (__CFString **)v37;
    BOOL v23 = &v36;
LABEL_9:
    id v19 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
    uint64_t v24 = [v20 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v19];
    v10[2](v10, v24);

    goto LABEL_10;
  }
  if (!v12)
  {
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08338];
    uint64_t v35 = @"Invalid request: missing caBLE URL";
    id v21 = NSDictionary;
    int v22 = &v35;
    BOOL v23 = &v34;
    goto LABEL_9;
  }
  authorizationTrafficController = self->_authorizationTrafficController;
  authorizationTrafficControllerToken = self->_authorizationTrafficControllerToken;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_247;
  v25[3] = &unk_26439EFB8;
  CFDictionaryRef v28 = v10;
  v25[4] = self;
  id v26 = v12;
  id v27 = v13;
  [(ASCAuthorizationTrafficController *)authorizationTrafficController beginAuthorizationForApplicationIdentifier:@"com.apple.AuthenticationServicesCore.caBLEAuthenticator" token:authorizationTrafficControllerToken withClearanceHandler:v25];

  id v19 = v28;
LABEL_10:
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138478083;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Open caBLE URL: %{private}@, sourceApplication: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_238()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_238_cold_1();
  }
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_247(uint64_t a1, char a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
    __int16 v7 = objc_alloc_init(ASCAuthorizationPresenter);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = v7;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setDelegate:");
    id v10 = [ASCAuthorizationPresentationContext alloc];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 208);
    id v12 = *(id *)(a1 + 48);
    if (v12)
    {
      if (shouldRequireCABLEAuthenticatorConsentForSourceApplication_onceToken != -1) {
        dispatch_once(&shouldRequireCABLEAuthenticatorConsentForSourceApplication_onceToken, &__block_literal_global_672);
      }
      uint64_t v13 = [(id)shouldRequireCABLEAuthenticatorConsentForSourceApplication_systemScannerApplications containsObject:v12] ^ 1;
    }
    else
    {
      uint64_t v13 = 1;
    }

    id v15 = -[ASCAuthorizationPresentationContext _initWithCABLEAuthenticatorURL:shouldRequireConsent:passkeyURLType:](v10, "_initWithCABLEAuthenticatorURL:shouldRequireConsent:passkeyURLType:", v11, v13, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "as_passkeyURLType"));
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 72);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    _OWORD v21[2] = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_26439EE30;
    void v21[4] = v16;
    id v22 = *(id *)(a1 + 56);
    [v17 presentAuthorizationWithContext:v15 forProcess:0 completionHandler:v21];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v5);
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08338];
      v24[0] = @"Traffic controller denied request.";
      id v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v20 = [v18 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:0 userInfo:v19];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v20);
    }
  }
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_3;
  id v21 = &unk_26439EFE0;
  id v22 = v5;
  id v23 = v6;
  id v8 = v6;
  id v9 = v5;
  os_activity_apply(v7, &v18);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "finishTransactionWithCredential:error:", v9, v8, v18, v19, v20, v21);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 216);
  *(void *)(v10 + 216) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 104);
  uint64_t v14 = *(void *)(v12 + 168);
  id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:12 userInfo:0];
  [v13 cancelOperationIfNecessaryWithUUID:v14 overrideError:v15];

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 168);
  *(void *)(v16 + 168) = 0;

  [*(id *)(*(void *)(a1 + 32) + 8) endAuthorizationForAppIdentifier:@"com.apple.AuthenticationServicesCore.caBLEAuthenticator" token:*(void *)(*(void *)(a1 + 32) + 16) clearanceHandler:&__block_literal_global_253];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id)WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = @"success";
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Finishing caBLE transaction: %{public}@", (uint8_t *)&v5, 0xCu);
    if (!v3) {
  }
    }
}

- (void)browserPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 auditToken];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }

  uint64_t v11 = (void *)MEMORY[0x263F67DE8];
  uint64_t v12 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v13 = v12;
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  char v14 = [v11 checkBrowserEngineEntitlementForAuditToken:v23];

  if ((v14 & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a2;
    os_activity_apply(authorizationActivity, block);
LABEL_15:
    v8[2](v8, MEMORY[0x263EFFA68]);
    goto LABEL_16;
  }
  long long v20 = v24;
  long long v21 = v25;
  int v15 = TCCAccessCheckAuditToken();
  uint64_t v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  uint64_t v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ASCAgent browserPasskeysForRelyingParty:completionHandler:]();
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_219326000, v17, OS_LOG_TYPE_INFO, "TCC access granted for browser passkey request.", (uint8_t *)&v20, 2u);
  }
  uint64_t v18 = -[ASPublicKeyCredentialManagerInterface browserPasskeysForRelyingParty:](self->_publicKeyCredentialManager, "browserPasskeysForRelyingParty:", v7, v20, v21);
  ((void (**)(id, void *))v8)[2](v8, v18);

LABEL_16:
}

void __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke_cold_1(a1, v2);
  }
}

- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  id v9 = v8;
  if (v8) {
    [v8 auditToken];
  }
  uint64_t v10 = WBSApplicationIdentifierFromAuditToken();
  uint64_t v11 = [MEMORY[0x263F662C8] sharedMonitor];
  char v12 = [v11 canKeychainSyncBeEnabled];

  if (v12)
  {
    BOOL v13 = self->_isClientEntitledWebBrowser
       || [(ASCAgent *)self _approvalStateForApplicationIdentifier:v10 relyingParty:v6] == 1;
  }
  else
  {
    char v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASCAgent getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:]();
    }
    BOOL v13 = 0;
  }
  v7[2](v7, v13);
}

- (void)_configurePasswordCredentialsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __63__ASCAgent__configurePasswordCredentialsWithCompletionHandler___block_invoke;
  uint64_t v11 = &unk_26439F0A0;
  char v12 = self;
  id v5 = v4;
  id v13 = v5;
  id v6 = _Block_copy(&v8);
  id v7 = [(ASCCredentialRequestContext *)self->_requestContext proxiedAssociatedDomains];
  if (v7) {
    [MEMORY[0x263F665A0] getCredentialsForAppWithAppID:0 externallyVerifiedAndApprovedSharedWebCredentialDomains:v7 completionHandler:v6];
  }
  else {
    [MEMORY[0x263F665A0] getCredentialsForAppWithAppID:self->_clientApplicationIdentifier completionHandler:v6];
  }
}

uint64_t __63__ASCAgent__configurePasswordCredentialsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_258);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

uint64_t __63__ASCAgent__configurePasswordCredentialsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isExternalPasskey] ^ 1;
}

- (void)_configurePublicKeyCredentialsWithAssertionOptions:(id)a3 forProcessWithApplicationIdentifier:(id)a4 requestStyle:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  char v12 = _Block_copy(a6);
  id didLoadPlatformCredentialsCallback = self->_didLoadPlatformCredentialsCallback;
  self->_id didLoadPlatformCredentialsCallback = v12;

  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  id v17 = [(ASCCredentialRequestContext *)self->_requestContext globalFrameID];
  int v15 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager beginAssertionsWithOptions:v11 forProcessWithApplicationIdentifier:v10 delegate:self requestStyle:a5 webFrameIdentifier:v17 parentActivity:self->_authorizationActivity];

  publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
  self->_publicKeyCredentialOperationUUID = v15;
}

- (void)_configureLoginChoicesForPresentationContext:(id)a3 withRequestContext:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(ASCAgent *)self _allAvailableLoginChoicesForRequestContext:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addLoginChoice:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_allAvailableLoginChoicesForRequestContext:(id)a3
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  v105 = v4;
  uint64_t v6 = [v4 requestTypes];
  char v7 = v6;
  uint64_t v99 = v6;
  if ((v6 & 2) != 0 && self->_existingAppleIDCredentialAvailableForLogIn)
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v8 = self->_appleIDChoices;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v131 objects:v145 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v132 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [[ASCAppleIDLoginChoice alloc] initWithAppleIDLoginChoice:*(void *)(*((void *)&v131 + 1) + 8 * i)];
          [v5 addObject:v13];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v131 objects:v145 count:16];
      }
      while (v10);
    }

    char v7 = v99;
  }
  v104 = self;
  if (v7)
  {
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    obuint64_t j = self->_passwordCredentials;
    uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v127 objects:v144 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v128;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v128 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v127 + 1) + 8 * j);
          if (objc_msgSend(v18, "isExternal", v99))
          {
            uint64_t v19 = [v18 externalCredential];
          }
          else
          {
            uint64_t v19 = 0;
          }
          long long v20 = [ASCPasswordLoginChoice alloc];
          long long v21 = [v18 user];
          id v22 = [v18 site];
          id v23 = [v18 customTitle];
          long long v24 = [v18 groupName];
          long long v25 = [(ASCPasswordLoginChoice *)v20 initWithUsername:v21 site:v22 externalCredentialIdentity:v19 customTitle:v23 groupName:v24];

          [v5 addObject:v25];
        }
        uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v127 objects:v144 count:16];
      }
      while (v15);
    }

    self = v104;
    char v7 = v99;
  }
  int obja = -[ASCAgent _allowedAuthenticatorModalitiesForRequestContext:](self, "_allowedAuthenticatorModalitiesForRequestContext:", v105, v99);
  if ((v7 & 4) != 0 && (obja & 8) != 0)
  {
    if ([(NSArray *)self->_test_overrideExtensionStates count])
    {
      long long v125 = 0uLL;
      long long v126 = 0uLL;
      long long v123 = 0uLL;
      long long v124 = 0uLL;
      id v26 = self->_test_overrideExtensionStates;
      uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v123 objects:v143 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v124;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v124 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v123 + 1) + 8 * k);
            id v32 = [v105 platformKeyCredentialCreationOptions];
            [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager computeClientDataIfNeededForCreationOptions:v32];
            id v33 = [v31 localizedDisplayName];
            uint64_t v34 = [ASCPlatformPublicKeyCredentialLoginChoice alloc];
            uint64_t v35 = [v31 providerBundleID];
            id v36 = [(ASCPlatformPublicKeyCredentialLoginChoice *)v34 initRegistrationChoiceWithOptions:v32 externalCredentialProviderName:v33 externalCredentialProviderBundleID:v35];
            [v5 addObject:v36];

            self = v104;
          }
          uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v123 objects:v143 count:16];
        }
        while (v28);
LABEL_42:
        char v7 = v100;
      }
    }
    else
    {
      long long v121 = 0uLL;
      long long v122 = 0uLL;
      long long v119 = 0uLL;
      long long v120 = 0uLL;
      id v37 = [MEMORY[0x263F66568] sharedManager];
      id v26 = [v37 getEnabledExtensionsSynchronously];

      uint64_t v38 = [(NSArray *)v26 countByEnumeratingWithState:&v119 objects:v142 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v120;
        do
        {
          for (uint64_t m = 0; m != v39; ++m)
          {
            if (*(void *)v120 != v40) {
              objc_enumerationMutation(v26);
            }
            long long v42 = *(void **)(*((void *)&v119 + 1) + 8 * m);
            long long v43 = [v105 platformKeyCredentialCreationOptions];
            [(ASPublicKeyCredentialManagerInterface *)v104->_publicKeyCredentialManager computeClientDataIfNeededForCreationOptions:v43];
            id v44 = objc_alloc(MEMORY[0x263F01878]);
            id v45 = objc_msgSend(v42, "sf_bundleIdentifierForContainingApp");
            uint64_t v46 = (void *)[v44 initWithBundleIdentifier:v45 allowPlaceholder:0 error:0];
            id v47 = [v46 localizedName];

            uint64_t v48 = [ASCPlatformPublicKeyCredentialLoginChoice alloc];
            uint64_t v49 = objc_msgSend(v42, "sf_bundleIdentifierForContainingApp");
            id v50 = [(ASCPlatformPublicKeyCredentialLoginChoice *)v48 initRegistrationChoiceWithOptions:v43 externalCredentialProviderName:v47 externalCredentialProviderBundleID:v49];
            [v5 addObject:v50];
          }
          uint64_t v39 = [(NSArray *)v26 countByEnumeratingWithState:&v119 objects:v142 count:16];
        }
        while (v39);
        self = v104;
        goto LABEL_42;
      }
    }
  }
  if (v7 & 4) != 0 && (obja)
  {
    id v51 = [ASCPlatformPublicKeyCredentialLoginChoice alloc];
    uint64_t v52 = [v105 platformKeyCredentialCreationOptions];
    id v53 = [(ASCPlatformPublicKeyCredentialLoginChoice *)v51 initRegistrationChoiceWithOptions:v52];
    [v5 addObject:v53];
  }
  if ((v7 & 8) != 0)
  {
    v101 = v5;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    uint64_t v54 = self->_platformLoginChoices;
    uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v115 objects:v141 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v116;
      do
      {
        for (uint64_t n = 0; n != v56; ++n)
        {
          if (*(void *)v116 != v57) {
            objc_enumerationMutation(v54);
          }
          id v59 = *(void **)(*((void *)&v115 + 1) + 8 * n);
          v60 = [v59 externalCredentialProviderName];
          if (v60) {
            BOOL v61 = (obja & 8) != 0;
          }
          else {
            BOOL v61 = 0;
          }

          v62 = [v59 relyingPartyIdentifier];
          char v63 = [v62 isEqualToString:@"apple.com"];

          v64 = [v59 externalCredentialProviderName];
          BOOL v65 = v64 == 0;

          if (v61 || (v63 & 1) != 0 || (v65 & obja) != 0) {
            [v101 addObject:v59];
          }
        }
        uint64_t v56 = [(NSArray *)v54 countByEnumeratingWithState:&v115 objects:v141 count:16];
      }
      while (v56);
    }

    self = v104;
    char v7 = v100;
    id v5 = v101;
  }
  if ((v7 & 0x10) != 0 && (obja & 4) != 0)
  {
    char v66 = [ASCSecurityKeyPublicKeyCredentialLoginChoice alloc];
    v67 = [v105 securityKeyCredentialCreationOptions];
    id v68 = [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)v66 initRegistrationChoiceWithOptions:v67];
    [v5 addObject:v68];
  }
  if ((v7 & 0x20) != 0 && (obja & 4) != 0)
  {
    if ([(NSArray *)self->_securityKeyLoginChoices count])
    {
      [v5 addObjectsFromArray:self->_securityKeyLoginChoices];
    }
    else
    {
      id v69 = [[ASCSecurityKeyPublicKeyCredentialLoginChoice alloc] initAssertionPlaceholderChoice];
      [v5 addObject:v69];
    }
  }
  if ((obja & 2) != 0)
  {
    v70 = [(ASCAgent *)self _cableLoginChoiceForRequestContext:v105];
    [v5 addObject:v70];
  }
  if ((v7 & 9) != 0)
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v71 = [MEMORY[0x263F66568] sharedManager];
    v72 = [v71 getEnabledExtensionsSynchronously];

    v73 = v72;
    uint64_t v74 = [v72 countByEnumeratingWithState:&v111 objects:v140 count:16];
    if (!v74) {
      goto LABEL_86;
    }
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v112;
    while (1)
    {
      for (iuint64_t i = 0; ii != v75; ++ii)
      {
        if (*(void *)v112 != v76) {
          objc_enumerationMutation(v73);
        }
        v78 = *(void **)(*((void *)&v111 + 1) + 8 * ii);
        id v79 = objc_alloc(MEMORY[0x263F01878]);
        v80 = objc_msgSend(v78, "sf_bundleIdentifierForContainingApp");
        id v110 = 0;
        v81 = (void *)[v79 initWithBundleIdentifier:v80 allowPlaceholder:0 error:&v110];
        id v82 = v110;
        v83 = [v81 localizedName];

        if (v82)
        {
          v84 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_84;
          }
          v85 = v84;
          v86 = objc_msgSend(v78, "sf_bundleIdentifierForContainingApp");
          *(_DWORD *)buf = 138543618;
          v137 = v86;
          __int16 v138 = 2112;
          id v139 = v82;
          _os_log_error_impl(&dword_219326000, v85, OS_LOG_TYPE_ERROR, "failed to get LSApplicationRecord for app with bundle ID %{public}@: %@", buf, 0x16u);
        }
        else
        {
          v87 = [ASCCredentialProviderExtensionLoginChoice alloc];
          v86 = [v78 identifier];
          v88 = objc_msgSend(v78, "sf_bundleIdentifierForContainingApp");
          v89 = [(ASCCredentialProviderExtensionLoginChoice *)v87 initWithProviderName:v83 providerBundleID:v86 providerExtensionContainingAppBundleID:v88];
          [v5 addObject:v89];
        }
LABEL_84:
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v111 objects:v140 count:16];
      if (!v75)
      {
LABEL_86:

        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        v90 = v104->_test_credentialProviderExtensionLoginChoices;
        uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v106 objects:v135 count:16];
        if (v91)
        {
          uint64_t v92 = v91;
          uint64_t v93 = *(void *)v107;
          do
          {
            for (juint64_t j = 0; jj != v92; ++jj)
            {
              if (*(void *)v107 != v93) {
                objc_enumerationMutation(v90);
              }
              [v5 addObject:*(void *)(*((void *)&v106 + 1) + 8 * jj)];
            }
            uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v106 objects:v135 count:16];
          }
          while (v92);
        }

        break;
      }
    }
  }
  if (([v105 requestOptions] & 1) != 0
    && (objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_268),
        v95 = objc_claimAutoreleasedReturnValue(),
        uint64_t v96 = [v95 count],
        v95,
        !v96))
  {
    id v97 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v97 = v5;
  }

  return v97;
}

BOOL __55__ASCAgent__allAvailableLoginChoicesForRequestContext___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 loginChoiceKind] < 4;
}

- (unint64_t)_allowedAuthenticatorModalitiesForRequestContext:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F66568] sharedManager];
  int v6 = [v5 atLeastOneEnabledExtensionSupportsPasskeys];

  if (v6)
  {
    char v7 = [MEMORY[0x263F66550] sharedFeatureManager];
    unsigned int v8 = [v7 shouldAutoFillPasswordsFromKeychain];

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 1;
  }
  unint64_t v10 = [v4 requestTypes];
  if ((v10 & 4) != 0)
  {
    long long v12 = [v4 platformKeyCredentialCreationOptions];
    long long v13 = [v12 attestationPreference];
    int v14 = [v13 isEqualToString:@"enterprise"];

    uint64_t v15 = 8;
    if (v14) {
      uint64_t v15 = 0;
    }
    if (!v6) {
      uint64_t v15 = 0;
    }
    uint64_t v11 = v15 | v9;
  }
  else
  {
    uint64_t v11 = 0;
  }
  unint64_t v16 = v11 | (v10 >> 2) & 4;
  if ((v10 & 0x28) == 0) {
    goto LABEL_33;
  }
  uint64_t v17 = [(ASCAgent *)self _allTransportsForAssertionRequest:v4];
  BOOL v18 = [(ASCAgent *)self _allowListExclusivelyMatchesPlatformLoginChoices:v4];
  if ([v17 count])
  {
    id v32 = self;
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"usb", @"nfc", @"ble", 0);
    uint64_t v19 = v31 = v6;
    int v30 = [v17 isSubsetOfSet:v19];
    unsigned int v29 = [v17 intersectsSet:v19] ^ 1;
    long long v20 = +[ASCPublicKeyCredentialDescriptor cableTransports];
    int v21 = [v17 isSubsetOfSet:v20];

    id v22 = [MEMORY[0x263EFFA08] setWithObject:@"internal"];
    int v23 = [v17 isEqualToSet:v22];

    self = v32;
    unsigned int v24 = v29;
    int v6 = v31;
    if (v30 | v21) {
      uint64_t v9 = 0;
    }
  }
  else
  {
    int v23 = 0;
    unsigned int v24 = 0;
  }
  uint64_t v25 = v16 | 8;
  if (!v6) {
    uint64_t v25 = v16;
  }
  uint64_t v26 = v25 | v9;
  if ((v10 & 8) == 0) {
    uint64_t v26 = v16;
  }
  BOOL v27 = (v10 & 0x20) == 0 || v18;
  unint64_t v16 = v27 | v24 ? v26 : v26 | 4;

  if (((v18 | v23) & 1) == 0)
  {
LABEL_33:
    if ([(ASCAgent *)self _shouldAddCABLEChoiceForRequestContext:v4]) {
      v16 |= 2uLL;
    }
  }

  return v16;
}

- (BOOL)_allowListExclusivelyMatchesPlatformLoginChoices:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  int v6 = [v5 platformKeyCredentialAssertionOptions];
  char v7 = [v6 allowedCredentials];
  unsigned int v8 = [v4 setWithArray:v7];

  uint64_t v9 = [v5 securityKeyCredentialAssertionOptions];

  unint64_t v10 = [v9 allowedCredentials];
  [v8 addObjectsFromArray:v10];

  if ([v8 count]
    && (unint64_t v11 = [v8 count], v11 <= -[NSArray count](self->_platformLoginChoices, "count")))
  {
    long long v13 = objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_286);
    int v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = [(NSArray *)self->_platformLoginChoices safari_mapObjectsUsingBlock:&__block_literal_global_289];
    unint64_t v16 = [v14 setWithArray:v15];

    char v12 = [v13 isSubsetOfSet:v16];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

id __61__ASCAgent__allowListExclusivelyMatchesPlatformLoginChoices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 credentialID];
  uint64_t v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

id __61__ASCAgent__allowListExclusivelyMatchesPlatformLoginChoices___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  uint64_t v3 = [v2 credentialID];

  return v3;
}

- (id)_allTransportsForAssertionRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = [v3 requestTypes];
  id v5 = [MEMORY[0x263EFF9C0] set];
  if ((v4 & 8) != 0)
  {
    char v7 = [v3 platformKeyCredentialAssertionOptions];
    id v8 = [v7 allowedCredentials];

    if (![v8 count])
    {
LABEL_25:

      goto LABEL_28;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) transports];
          if (!v13)
          {

            goto LABEL_25;
          }
          int v14 = (void *)v13;
          [v5 addObjectsFromArray:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    if ((v4 & 0x20) == 0) {
      goto LABEL_3;
    }
  }
  else if ((v4 & 0x20) == 0)
  {
LABEL_3:
    id v6 = v5;
    goto LABEL_29;
  }
  uint64_t v15 = [v3 securityKeyCredentialAssertionOptions];
  id v16 = [v15 allowedCredentials];

  if ([v16 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v16;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "transports", (void)v24);
          if (!v21)
          {

            goto LABEL_27;
          }
          id v22 = (void *)v21;
          [v5 addObjectsFromArray:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    goto LABEL_3;
  }
LABEL_27:

LABEL_28:
  id v6 = 0;
LABEL_29:

  return v6;
}

- (id)_cableLoginChoiceForRequestContext:(id)a3
{
  if (!self->_cableClient)
  {
    char v4 = -[ASCABLEClient initWithDelegate:isRegistrationRequest:]([_TtC26AuthenticationServicesCore13ASCABLEClient alloc], "initWithDelegate:isRegistrationRequest:", self, ([a3 requestTypes] & 0x14) != 0);
    cableClient = self->_cableClient;
    self->_cableClient = v4;
  }
  id v6 = [ASCABLELoginChoice alloc];
  char v7 = [(ASCABLEClient *)self->_cableClient qrCodeURL];
  id v8 = [(ASCABLELoginChoice *)v6 initWithQRCodeURL:v7];

  return v8;
}

- (void)_presentAuthorizationRequestWithContext:(id)a3 implicitlySelectedLoginChoice:(id)a4 forProcess:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v33 = a6;
  char v12 = (void *)MEMORY[0x263EFF8F8];
  connectiouint64_t n = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(v38, 0, sizeof(v38));
  }
  int v14 = [v12 dataWithBytes:v38 length:32];
  uint64_t v15 = [v10 globalFrameID];

  id v16 = [ASCAuthorizationPresentationContext alloc];
  uint64_t v17 = v10;
  uint64_t v18 = v16;
  clientApplicationIdentifier = self->_clientApplicationIdentifier;
  if (v15)
  {
    id v32 = v11;
    id v20 = objc_alloc(MEMORY[0x263F662B8]);
    uint64_t v21 = [v17 globalFrameID];
    id v22 = [v21 webPageID];
    int v23 = [v17 globalFrameID];
    long long v24 = [v23 webFrameID];
    long long v25 = (void *)[v20 initWithPageID:v22 frameID:v24];
    long long v26 = [(ASCAuthorizationPresentationContext *)v18 initWithRequestContext:v17 appIdentifier:clientApplicationIdentifier frameIdentifier:v25 shouldUseRelyingPartyForServiceName:self->_isClientEntitledWebBrowser auditTokenData:v14];

    id v11 = v32;
    if (v32)
    {
LABEL_6:
      [(ASCAuthorizationPresentationContext *)v26 addLoginChoice:v11];
      goto LABEL_9;
    }
  }
  else
  {
    long long v26 = [(ASCAuthorizationPresentationContext *)v16 initWithRequestContext:v17 appIdentifier:self->_clientApplicationIdentifier shouldUseRelyingPartyForServiceName:self->_isClientEntitledWebBrowser auditTokenData:v14];
    if (v11) {
      goto LABEL_6;
    }
  }
  [(ASCAgent *)self _configureLoginChoicesForPresentationContext:v26 withRequestContext:v17];
LABEL_9:
  if (!self->_requestPresenter)
  {
    long long v27 = objc_alloc_init(ASCAuthorizationPresenter);
    requestPresenter = self->_requestPresenter;
    self->_requestPresenter = (ASCAuthorizationPresenterHostProtocol *)v27;

    [(ASCAuthorizationPresenterHostProtocol *)self->_requestPresenter setDelegate:self];
  }
  long long v29 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_219326000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AuthorizationRequestReceivedToShowingUI", "", buf, 2u);
  }
  long long v30 = self->_requestPresenter;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __111__ASCAgent__presentAuthorizationRequestWithContext_implicitlySelectedLoginChoice_forProcess_completionHandler___block_invoke;
  v35[3] = &unk_26439EE30;
  v35[4] = self;
  id v36 = v33;
  id v31 = v33;
  [(ASCAuthorizationPresenterHostProtocol *)v30 presentAuthorizationWithContext:v26 forProcess:v34 completionHandler:v35];
}

void __111__ASCAgent__presentAuthorizationRequestWithContext_implicitlySelectedLoginChoice_forProcess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = 0;
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_hasSignInOptionsForRequestContext:(id)a3
{
  id v4 = a3;
  if ([(ASCAgent *)self _hasAnyCredentialsAvailableForRequestContext:v4])
  {
    LOBYTE(v5) = 1;
  }
  else if ([v4 isProxiedRequest])
  {
    BOOL v5 = [v4 requestTypes] & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_hasAnyCredentialsAvailableForRequestContext:(id)a3
{
  id v3 = [(ASCAgent *)self _allAvailableLoginChoicesForRequestContext:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)_clientHasNecessaryAuthKitEntitlements
{
  if ([(ASCAgent *)self _clientHasAuthKitDeveloperEntitlement]
    || [(ASCAgent *)self _clientIsAuthKitOwner]
    || [(ASCAgent *)self _clientIsInternalAuthKit])
  {
    return 1;
  }

  return [(ASCAgent *)self _clientIsPrivateAuthKit];
}

- (BOOL)_clientIsAuthKitOwner
{
  uint64_t v2 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.authkit.client.owner"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_clientHasAuthKitDeveloperEntitlement
{
  uint64_t v2 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.developer.applesignin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 firstObject];
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_clientIsInternalAuthKit
{
  uint64_t v2 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.authkit.client.internal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_clientIsPrivateAuthKit
{
  uint64_t v2 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.authkit.client.private"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)_bundleIDFromAppID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASCCredentialRequestContext *)self->_requestContext proxiedBundleIdentifier];

  if (v5)
  {
    id v6 = [(ASCCredentialRequestContext *)self->_requestContext proxiedBundleIdentifier];
  }
  else
  {
    id v13 = 0;
    id v6 = objc_msgSend(v4, "safari_bundleIdentifierFromApplicationIdentifier:", &v13);
    id v7 = v13;
    id v8 = v7;
    if (v7)
    {
      authorizationActivity = self->_authorizationActivity;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __31__ASCAgent__bundleIDFromAppID___block_invoke;
      v11[3] = &unk_26439ED00;
      id v12 = v7;
      os_activity_apply(authorizationActivity, v11);
    }
  }

  return v6;
}

void __31__ASCAgent__bundleIDFromAppID___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __31__ASCAgent__bundleIDFromAppID___block_invoke_cold_1(a1, v2);
  }
}

- (id)_teamIDfromAppID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASCCredentialRequestContext *)self->_requestContext proxiedTeamIdentifier];

  if (v5)
  {
    id v6 = [(ASCCredentialRequestContext *)self->_requestContext proxiedTeamIdentifier];
  }
  else
  {
    id v13 = 0;
    id v6 = objc_msgSend(v4, "safari_teamIdentifierFromApplicationIdentifier:", &v13);
    id v7 = v13;
    id v8 = v7;
    if (v7)
    {
      authorizationActivity = self->_authorizationActivity;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __29__ASCAgent__teamIDfromAppID___block_invoke;
      v11[3] = &unk_26439ED00;
      id v12 = v7;
      os_activity_apply(authorizationActivity, v11);
    }
  }

  return v6;
}

void __29__ASCAgent__teamIDfromAppID___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __29__ASCAgent__teamIDfromAppID___block_invoke_cold_1(a1, v2);
  }
}

- (void)_performAuthKitAuthorizationValidationForAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F29160]);
  id v6 = v5;
  if (v4)
  {
    [v5 setAuthkitAccount:v4];
    id v7 = objc_alloc_init(MEMORY[0x263F291B8]);
    [v7 setAuthorizationRequest:v6];
    id v15 = 0;
    char v8 = [MEMORY[0x263F29180] canPerformAuthorizationRequest:v7 error:&v15];
    id v9 = v15;
    id v10 = v9;
    if (v9)
    {
      authorizationActivity = self->_authorizationActivity;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke;
      v13[3] = &unk_26439ED00;
      id v14 = v9;
      os_activity_apply(authorizationActivity, v13);
    }
    self->_existingAppleIDCredentialAvailableForLogIuint64_t n = v8;
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASCAgent _performAuthKitAuthorizationValidationForAccount:]();
    }
    self->_existingAppleIDCredentialAvailableForLogIuint64_t n = 0;
  }
}

void __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke_cold_1(a1, v2);
  }
}

- (unsigned)_approvalStateForApplicationIdentifier:(id)a3 relyingParty:(id)a4
{
  v60[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v33 = a4;
  id v57 = 0;
  id v37 = v5;
  id v34 = objc_msgSend(objc_alloc(MEMORY[0x263F01858]), "safari_initWithExtensionApplicationIdentifier:error:", v37, &v57);
  id v6 = v57;
  id v7 = v6;
  if (v6 && (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x263F08410], -10814) & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke;
    block[3] = &unk_26439ED00;
    id v56 = v7;
    os_activity_apply(authorizationActivity, block);
  }
  uint64_t v9 = *MEMORY[0x263F665F8];
  v60[0] = @"com.apple.AppSSO.idp-extension";
  v60[1] = v9;
  v60[2] = @"com.apple.ui-services";
  id v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
  id v10 = [v34 extensionPointRecord];
  uint64_t v35 = [v10 identifier];

  id v36 = v37;
  if (v35)
  {
    id v36 = v37;
    if ([v31 containsObject:v35])
    {
      id v11 = [v34 containingBundleRecord];
      id v36 = [v11 applicationIdentifier];
    }
  }
  id v12 = objc_alloc(MEMORY[0x263F6BD78]);
  id v32 = (void *)[v12 initWithServiceType:*MEMORY[0x263F6BDB0] applicationIdentifier:v36 domain:v33];
  id v54 = v7;
  id v13 = [MEMORY[0x263F6BD70] serviceDetailsWithServiceSpecifier:v32 error:&v54];
  id v29 = v54;

  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 2;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v47;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v46 + 1) + 8 * v17);
        if (*((unsigned char *)v51 + 24) == 2
          && !objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v17), "siteApprovalState", v29))
        {
          *((unsigned char *)v51 + 24) = 0;
        }
        else if (objc_msgSend(v18, "isApproved", v29))
        {
          *((unsigned char *)v51 + 24) = 1;
          goto LABEL_21;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v19 = [v14 countByEnumeratingWithState:&v46 objects:v59 count:16];
      uint64_t v15 = v19;
    }
    while (v19);
  }
LABEL_21:
  long long v30 = v14;

  unsigned __int8 v20 = *((unsigned char *)v51 + 24);
  if (!v20)
  {
    uint64_t v21 = dispatch_group_create();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v58 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v43 != v24) {
            objc_enumerationMutation(v22);
          }
          long long v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (!objc_msgSend(v26, "siteApprovalState", v29))
          {
            os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_308);
            dispatch_group_enter(v21);
            v39[0] = MEMORY[0x263EF8330];
            v39[1] = 3221225472;
            v39[2] = __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_309;
            v39[3] = &unk_26439F108;
            long long v41 = &v50;
            void v39[4] = self;
            void v39[5] = v26;
            uint64_t v40 = v21;
            [v26 waitForSiteApprovalWithCompletionHandler:v39];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v58 count:16];
      }
      while (v23);
    }

    dispatch_time_t v27 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v21, v27);

    unsigned __int8 v20 = *((unsigned char *)v51 + 24);
  }
  _Block_object_dispose(&v50, 8);

  return v20;
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_cold_1(a1, v2);
  }
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_306()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "SWC approval state was unspecified, will wait for approval", v1, 2u);
  }
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    char v8 = *(NSObject **)(*(void *)(a1 + 32) + 176);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2;
    block[3] = &unk_26439ED00;
    id v11 = v6;
    os_activity_apply(v8, block);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 2
    && ![*(id *)(a1 + 40) siteApprovalState])
  {
    char v9 = 0;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 40) isApproved])
  {
    char v9 = 1;
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2_cold_1(a1, v2);
  }
}

- (BOOL)_isClientWithApplicationIdentifier:(id)a3 properlyEntitledForRequestContext:(id)a4 error:(id *)a5
{
  v94[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v9 requestStyle] == 2)
  {
    connectiouint64_t n = self->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection auditToken];
    }
    else
    {
      long long v73 = 0u;
      long long v74 = 0u;
    }
    if (WBSAuditTokenHasEntitlement())
    {
      authorizationActivity = self->_authorizationActivity;
      id v12 = &__block_literal_global_312;
LABEL_13:
      os_activity_apply(authorizationActivity, v12);
      goto LABEL_14;
    }
    if ([v9 requestTypes] == 8)
    {
      authorizationActivity = self->_authorizationActivity;
      if (!self->_isClientEntitledWebBrowser)
      {
        os_activity_apply(authorizationActivity, &__block_literal_global_315);
        if (a5)
        {
          uint64_t v21 = (void *)MEMORY[0x263F087E8];
          uint64_t v93 = *MEMORY[0x263F08338];
          v94[0] = @"Only entitled web browsers can make this request.";
          id v22 = NSDictionary;
          uint64_t v23 = (__CFString **)v94;
          uint64_t v24 = &v93;
          goto LABEL_27;
        }
LABEL_60:
        BOOL v16 = 0;
        goto LABEL_42;
      }
      id v12 = &__block_literal_global_321;
      goto LABEL_13;
    }
    if ([v9 requestTypes] != 4)
    {
      uint64_t v38 = self->_authorizationActivity;
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_335;
      v69[3] = &unk_26439ED00;
      id v70 = v9;
      os_activity_apply(v38, v69);
      if (a5)
      {
        uint64_t v39 = (void *)MEMORY[0x263F087E8];
        uint64_t v87 = *MEMORY[0x263F08338];
        v88 = @"Silent requests are only allowed for platform assertions.";
        uint64_t v40 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        *a5 = [v39 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v40];
      }
      BOOL v16 = 0;
      id v13 = v70;
      goto LABEL_41;
    }
    if (self->_isClientEntitledWebBrowser)
    {
      authorizationActivity = self->_authorizationActivity;
      id v12 = &__block_literal_global_324;
      goto LABEL_13;
    }
    uint64_t v52 = [v9 relyingPartyIdentifier];
    int v53 = [(ASCAgent *)self _approvalStateForApplicationIdentifier:v8 relyingParty:v52];

    switch(v53)
    {
      case 0:
        if (a5)
        {
          id v54 = (void *)MEMORY[0x263F087E8];
          uint64_t v91 = *MEMORY[0x263F08338];
          uint64_t v55 = NSString;
          id v13 = [v9 relyingPartyIdentifier];
          id v56 = [v55 stringWithFormat:@"Unable to verify webcredentials association of %@ with domain %@. Please try again in a few seconds.", v8, v13];
          uint64_t v92 = v56;
          id v57 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
          *a5 = [v54 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v57];

LABEL_53:
          BOOL v16 = 0;
          goto LABEL_41;
        }
        goto LABEL_60;
      case 2:
        id v58 = self->_authorizationActivity;
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_331;
        v71[3] = &unk_26439ED00;
        id v59 = v9;
        id v72 = v59;
        os_activity_apply(v58, v71);
        if (a5)
        {
          v60 = (void *)MEMORY[0x263F087E8];
          uint64_t v89 = *MEMORY[0x263F08338];
          BOOL v61 = NSString;
          v62 = [v59 relyingPartyIdentifier];
          char v63 = [v61 stringWithFormat:@"Application with identifier %@ is not associated with domain %@", v8, v62];
          v90 = v63;
          v64 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          *a5 = [v60 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v64];
        }
        BOOL v16 = 0;
        id v13 = v72;
        goto LABEL_41;
      case 1:
        authorizationActivity = self->_authorizationActivity;
        id v12 = &__block_literal_global_327;
        goto LABEL_13;
    }
  }
LABEL_14:
  if (![v9 isProxiedRequest])
  {
    id v13 = [v9 relyingPartyIdentifier];
    uint64_t v17 = [v9 platformKeyCredentialCreationOptions];
    uint64_t v18 = [v17 attestationPreference];

    if ([v18 isEqualToString:@"enterprise"]
      && (+[ASFeatureManager sharedManager],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 canRequestEnterpriseAttestationForRelyingParty:v13],
          v19,
          (v20 & 1) == 0))
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_354);
      if (a5)
      {
        id v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v81 = *MEMORY[0x263F08338];
        uint64_t v35 = [NSString stringWithFormat:@"This device is not configured to allow enterprise attestation for “%@”.", v13];
        id v82 = v35;
        id v36 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        *a5 = [v34 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v36];
      }
    }
    else
    {
      if (self->_isClientEntitledWebBrowser)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_360);
LABEL_24:
        BOOL v16 = 1;
LABEL_40:

        goto LABEL_41;
      }
      if ([v9 isUsingWebBrowserOnlyOptions])
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_363);
        if (a5)
        {
          long long v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v79 = *MEMORY[0x263F08338];
          v80 = @"Only entitled web browsers can use these options.";
          long long v26 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          *a5 = [v25 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v26];
        }
      }
      if (!v13) {
        goto LABEL_24;
      }
      int v27 = [(ASCAgent *)self _approvalStateForApplicationIdentifier:v8 relyingParty:v13];
      if (v27)
      {
        if (v27 != 2) {
          goto LABEL_24;
        }
        uint64_t v28 = [NSString stringWithFormat:@"Application with identifier %@ is not associated with domain %@", v8, v13];
        id v29 = (void *)v28;
        if (a5)
        {
          long long v30 = (void *)MEMORY[0x263F087E8];
          uint64_t v77 = *MEMORY[0x263F08338];
          uint64_t v78 = v28;
          id v31 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          *a5 = [v30 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v31];
        }
        id v32 = self->_authorizationActivity;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_367;
        block[3] = &unk_26439ED00;
        id v66 = v29;
        id v33 = v29;
        os_activity_apply(v32, block);
      }
      else if (a5)
      {
        long long v41 = (void *)MEMORY[0x263F087E8];
        uint64_t v75 = *MEMORY[0x263F08338];
        long long v42 = NSString;
        long long v43 = [v9 relyingPartyIdentifier];
        long long v44 = [v42 stringWithFormat:@"Unable to verify webcredentials association of %@ with domain %@. Please try again in a few seconds.", v8, v43];
        uint64_t v76 = v44;
        long long v45 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        *a5 = [v41 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v45];
      }
    }
    BOOL v16 = 0;
    goto LABEL_40;
  }
  if (![(ASCAgent *)self _connection:self->_connection hasEntitlement:@"com.apple.authentication-services-core.allow-authentication-request-proxying"])
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_341);
    if (a5)
    {
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v85 = *MEMORY[0x263F08338];
      v86 = @"Client does not have entitlement for using proxied credential request context.";
      id v22 = NSDictionary;
      uint64_t v23 = &v86;
      uint64_t v24 = &v85;
LABEL_27:
      id v13 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
      [v21 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v13];
      BOOL v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    goto LABEL_60;
  }
  id v13 = [v9 relyingPartyIdentifier];
  if (v13)
  {
    if (!self->_isClientEntitledWebBrowser)
    {
      id v14 = [v9 proxiedAssociatedDomains];
      char v15 = [v14 containsObject:v13];

      if ((v15 & 1) == 0)
      {
        long long v46 = self->_authorizationActivity;
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_345;
        v67[3] = &unk_26439ED00;
        id v13 = v13;
        id v68 = v13;
        os_activity_apply(v46, v67);
        if (a5)
        {
          long long v47 = (void *)MEMORY[0x263F087E8];
          uint64_t v83 = *MEMORY[0x263F08338];
          long long v48 = NSString;
          long long v49 = [v9 proxiedAppName];
          uint64_t v50 = [v48 stringWithFormat:@"\"%@\" is not associated with domain \"%@\".", v49, v13];
          v84 = v50;
          id v51 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          *a5 = [v47 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v51];
        }
        goto LABEL_53;
      }
    }
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_351);
  BOOL v16 = 1;
LABEL_41:

LABEL_42:
  return v16;
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Allowing silent internal request.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_313()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_313_cold_1();
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_319()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Allowing silent request from web browser.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_322()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Allowing conditional request from web browser.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_325()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Allowing conditional request from associated app.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_331(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_331_cold_1(a1, v2);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_335(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_335_cold_1(a1, v2);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_339()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_339_cold_1();
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_345()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_345_cold_1();
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_349()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Allowing proxied request.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_352()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_352_cold_1();
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_358()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Allowing request from web browser.", v1, 2u);
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_361()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_361_cold_1();
  }
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_367()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_367_cold_1();
  }
}

- (BOOL)_shouldApplyQuirksToClientWithApplicationIdentifier:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(MEMORY[0x263F086E0], "safari_isSafariFamilyBundleIdentifier:", v3)) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x263F66520]];
  }

  return v4;
}

- (BOOL)_shouldAddCABLEChoiceForRequestContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requestTypes];
  if ((ascCredentialRequestTypesAllPublicKey() & v5) == 0
    || [v4 requestStyle] == 2
    || !+[_ASDevice isCABLEClient]
    || !+[ASCWebKitSPISupport shouldUseAlternateCredentialStore](ASCWebKitSPISupport, "shouldUseAlternateCredentialStore")|| ([v4 isProxiedRequest] & 1) != 0|| (objc_msgSend(v4, "isCABLEAuthenticatorRequest") & 1) != 0)
  {
    goto LABEL_10;
  }
  id v6 = [v4 platformKeyCredentialCreationOptions];
  if ([v6 shouldHideHybrid])
  {

    goto LABEL_10;
  }
  id v7 = [v4 platformKeyCredentialAssertionOptions];
  char v8 = [v7 shouldHideHybrid];

  if (v8) {
    goto LABEL_10;
  }
  if (![v4 isRegistrationRequest])
  {
    if (!self->_isClientEntitledWebBrowser && (v5 & 8) == 0) {
      goto LABEL_10;
    }
    if ((v5 & 8) != 0) {
      [v4 platformKeyCredentialAssertionOptions];
    }
    else {
    id v12 = [v4 securityKeyCredentialAssertionOptions];
    }
    id v11 = [v12 allowedCredentials];

    if ([v11 count]) {
      char v9 = objc_msgSend(v11, "safari_containsObjectPassingTest:", &__block_literal_global_371);
    }
    else {
      char v9 = 1;
    }
LABEL_27:

    goto LABEL_11;
  }
  if (!self->_isClientEntitledWebBrowser)
  {
    char v9 = v5 != 16;
    goto LABEL_11;
  }
  if (v5 != 4)
  {
    if (v5 != 16)
    {
      char v9 = 1;
      goto LABEL_11;
    }
    id v11 = [v4 securityKeyCredentialCreationOptions];
    char v9 = [v11 residentKeyPreference] != 1;
    goto LABEL_27;
  }
LABEL_10:
  char v9 = 0;
LABEL_11:

  return v9;
}

uint64_t __51__ASCAgent__shouldAddCABLEChoiceForRequestContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 transports];
  if ([v3 count] && (objc_msgSend(v2, "hasInternalTransport") & 1) == 0) {
    uint64_t v4 = [v2 hasCABLETransport];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (void)authorizationPresenter:(id)a3 credentialRequestedForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
}

- (void)_credentialRequestedForPasswordLoginChoice:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v23 = self;
  char v8 = self->_passwordCredentials;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
      id v14 = [v6 username];
      char v15 = [v13 user];
      char v16 = [v14 isEqualToString:v15];

      if (v16) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v17 = [ASCPasswordCredential alloc];
    uint64_t v18 = [v13 user];
    uint64_t v19 = [v13 password];
    char v20 = [v13 site];
    uint64_t v21 = [v13 creationDate];
    id v22 = [(ASCPasswordCredential *)v17 initWithUser:v18 password:v19 site:v20 creationDate:v21 externalProviderBundleIdentifier:0];

    if (!v22) {
      goto LABEL_12;
    }
    v7[2](v7, v22, 0);
  }
  else
  {
LABEL_9:

LABEL_12:
    os_activity_apply((os_activity_t)v23->_authorizationActivity, &__block_literal_global_374);
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    ((void (**)(id, void *, ASCPasswordCredential *))v7)[2](v7, 0, v22);
  }
}

void __73__ASCAgent__credentialRequestedForPasswordLoginChoice_completionHandler___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __73__ASCAgent__credentialRequestedForPasswordLoginChoice_completionHandler___block_invoke_cold_1();
  }
}

- (void)_credentialRequestedForPlatformLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  uint64_t v9 = _Block_copy(a5);
  passkeyCredentialCallbacuint64_t k = self->_passkeyCredentialCallback;
  self->_passkeyCredentialCallbacuint64_t k = v9;

  int v11 = [v17 isRegistrationRequest];
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  if (v11)
  {
    id v13 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialCreationOptions];
    id v14 = [(ASCCredentialRequestContext *)self->_requestContext globalFrameID];
    char v15 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager createNewPlatformCredentialWithOptions:v13 authenticatedContext:v8 delegate:self webFrameIdentifier:v14 parentActivity:self->_authorizationActivity isConditionalRegistration:[(ASCCredentialRequestContext *)self->_requestContext isConditionalRegistrationRequest]];
    publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
    self->_publicKeyCredentialOperationUUID = v15;
  }
  else
  {
    [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager assertUsingPlatformCredentialForLoginChoice:v17 authenticatedContext:v8];
  }
}

- (void)_credentialRequestedForSecurityKeyLoginChoice:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 credentialKind];
  switch(v5)
  {
    case 0:
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      id v7 = [(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialCreationOptions];
      id v8 = [(ASCCredentialRequestContext *)self->_requestContext globalFrameID];
      id v9 = (id)[(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager beginCreatingNewSecurityKeyCredentialIfAvailableWithOptions:v7 delegate:self webFrameIdentifier:v8 parentActivity:self->_authorizationActivity];
      goto LABEL_8;
    case 2:
      if ([(ASCCredentialRequestContext *)self->_requestContext requestStyle] != 1) {
        break;
      }
      uint64_t v10 = self->_publicKeyCredentialManager;
      publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:12 userInfo:0];
      [(ASPublicKeyCredentialManagerInterface *)v10 cancelOperationIfNecessaryWithUUID:publicKeyCredentialOperationUUID overrideError:v12];

      id v13 = self->_publicKeyCredentialManager;
      id v7 = [(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialAssertionOptions];
      v17[0] = v7;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      clientApplicationIdentifier = self->_clientApplicationIdentifier;
      char v15 = [(ASCCredentialRequestContext *)self->_requestContext globalFrameID];
      id v16 = (id)[(ASPublicKeyCredentialManagerInterface *)v13 beginAssertionsWithOptions:v8 forProcessWithApplicationIdentifier:clientApplicationIdentifier delegate:self requestStyle:0 webFrameIdentifier:v15 parentActivity:self->_authorizationActivity];

LABEL_8:
      break;
    case 1:
      [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager assertUsingSecurityKeyCredentialForLoginChoice:v4];
      break;
  }
}

- (void)_credentialRequestedForCABLELoginChoice:(id)a3
{
  BOOL didStartCABLEClient = self->_didStartCABLEClient;
  authorizationActivity = self->_authorizationActivity;
  if (didStartCABLEClient)
  {
    os_activity_apply(authorizationActivity, &__block_literal_global_376);
  }
  else
  {
    os_activity_apply(authorizationActivity, &__block_literal_global_379);
    self->_BOOL didStartCABLEClient = 1;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_380;
    aBlock[3] = &unk_26439F178;
    aBlock[4] = self;
    id v6 = _Block_copy(aBlock);
    id v7 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialAssertionOptions];
    if (v7
      || ([(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialAssertionOptions], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      cableClient = self->_cableClient;
      id v9 = [v7 relyingPartyIdentifier];
      uint64_t v10 = cableClient;
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v12 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialCreationOptions];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialCreationOptions];
      }
      id v7 = v14;

      char v15 = self->_cableClient;
      id v9 = [v7 relyingPartyIdentifier];
      uint64_t v10 = v15;
      uint64_t v11 = 0;
    }
    [(ASCABLEClient *)v10 performAuthenticationOperation:v11 forRelyingPartyIdentifier:v9 completionHandler:v6];
  }
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "caBLE client already started", v1, 2u);
  }
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_377()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Starting caBLE client", v1, 2u);
  }
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_380(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 56) requestStyle] != 1)
  {
    id v7 = [v6 domain];
    if ([v7 isEqualToString:@"com.apple.AuthenticationServicesCore.AuthorizationError"])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 16)
      {
        [*(id *)(*(void *)(a1 + 32) + 72) updateInterfaceForUserVisibleError:v6];
        goto LABEL_11;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _authorizationCompletedWithCredential:v5 error:v6];
    goto LABEL_11;
  }
  if (v6 && [v6 code] == 12)
  {
    os_activity_apply(*(os_activity_t *)(*(void *)(a1 + 32) + 176), &__block_literal_global_382);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 72);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_383;
    v11[3] = &unk_26439F150;
    void v11[4] = v9;
    id v12 = v5;
    id v13 = v6;
    [v10 authorizationRequestFinishedWithCredential:v12 error:v13 completionHandler:v11];
  }
LABEL_11:
}

void __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Not propagating internal cancel for caBLE in AutoFill", v1, 2u);
  }
}

uint64_t __52__ASCAgent__credentialRequestedForCABLELoginChoice___block_invoke_383(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authorizationCompletedWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (BOOL)_canPerformConditionalRegistrationInICloudKeychainForUsername:(id)a3 relyingParty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F662A0] isAutomaticPasskeyUpgradesEnabled])
  {
    if (![(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager passkeyExistsForRelyingParty:v7 username:v6])
    {
      BOOL v9 = 1;
      goto LABEL_7;
    }
    uint64_t v8 = &__block_literal_global_389;
  }
  else
  {
    uint64_t v8 = &__block_literal_global_386;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, v8);
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

void __87__ASCAgent__canPerformConditionalRegistrationInICloudKeychainForUsername_relyingParty___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Automatic passkey upgrades is off", v1, 2u);
  }
}

void __87__ASCAgent__canPerformConditionalRegistrationInICloudKeychainForUsername_relyingParty___block_invoke_387()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_INFO, "Matching passkey already exists.", v1, 2u);
  }
}

- (void)authorizationPresenter:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5
{
  id v13 = a4;
  if (self->_userEnteredPINCallback)
  {
    id v7 = a5;
    uint64_t v8 = _Block_copy(v7);

    pinResultCallbacuint64_t k = self->_pinResultCallback;
    self->_pinResultCallbacuint64_t k = v8;

    (*((void (**)(void))self->_userEnteredPINCallback + 2))();
    userEnteredPINCallbacuint64_t k = self->_userEnteredPINCallback;
    self->_userEnteredPINCallbacuint64_t k = 0;
  }
  else
  {
    authorizationActivity = self->_authorizationActivity;
    id v12 = (void (**)(id, void, void *))a5;
    os_activity_apply(authorizationActivity, &__block_literal_global_391);
    userEnteredPINCallbacuint64_t k = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:0];
    v12[2](v12, 0, userEnteredPINCallback);
  }
}

void __76__ASCAgent_authorizationPresenter_validateUserEnteredPIN_completionHandler___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __76__ASCAgent_authorizationPresenter_validateUserEnteredPIN_completionHandler___block_invoke_cold_1();
  }
}

- (void)authorizationPresenter:(id)a3 startCABLEAuthenticationWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_393);
  uint64_t v8 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v9 = [_TtC26AuthenticationServicesCore20ASCABLEAuthenticator alloc];
  cableAuthenticationURL = self->_cableAuthenticationURL;
  id v27 = 0;
  uint64_t v11 = [(ASCABLEAuthenticator *)v9 initWithCaBLEURL:cableAuthenticationURL error:&v27];
  id v12 = v27;
  cableAuthenticator = self->_cableAuthenticator;
  self->_cableAuthenticator = v11;

  if (self->_cableAuthenticator)
  {
    objc_initWeak(&location, self);
    id v14 = self->_authorizationActivity;
    char v15 = self->_cableAuthenticator;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_396;
    v19[3] = &unk_26439F1A0;
    objc_copyWeak(&v23, &location);
    id v16 = v14;
    char v20 = v16;
    id v22 = v7;
    id v21 = v8;
    [(ASCABLEAuthenticator *)v15 startWithCompletionHandler:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_395;
    block[3] = &unk_26439ED00;
    id v18 = v12;
    id v26 = v18;
    os_activity_apply(authorizationActivity, block);
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v18);
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Starting caBLE authentication", v1, 2u);
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_395(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_395_cold_1(a1, v2);
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_396(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      BOOL v9 = WeakRetained[22];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_400;
      block[3] = &unk_26439ED00;
      id v10 = v5;
      id v20 = v10;
      os_activity_apply(v9, block);
      id v11 = a1[5];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_401;
      v14[3] = &unk_26439F1A0;
      objc_copyWeak(&v18, a1 + 7);
      id v15 = a1[4];
      id v17 = a1[6];
      id v16 = a1[5];
      [v8 _prepareForAuthorizationRequestsForContext:v10 clientConnection:v11 withPresentationHandler:v14];

      objc_destroyWeak(&v18);
      id v12 = v20;
    }
    else
    {
      id v13 = a1[4];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      _OWORD v21[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_399;
      v21[3] = &unk_26439ED00;
      id v22 = v6;
      os_activity_apply(v13, v21);
      (*((void (**)(void))a1[6] + 2))();
      id v12 = v22;
    }
  }
  else
  {
    os_activity_apply((os_activity_t)a1[4], &__block_literal_global_398);
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_cold_1();
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_399(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_399_cold_1(a1, v2);
  }
}

uint64_t __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_400(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_INFO, "Beginning caBLE request: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) logRequest];
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_401(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v8 = [ASCAuthorizationPresentationContext alloc];
      BOOL v9 = (void *)MEMORY[0x263EFF8F8];
      id v10 = *(void **)(a1 + 40);
      if (v10) {
        [v10 auditToken];
      }
      else {
        memset(v15, 0, sizeof(v15));
      }
      id v12 = [v9 dataWithBytes:v15 length:32];
      id v13 = [(ASCAuthorizationPresentationContext *)v8 initWithRequestContext:v5 appIdentifier:0 shouldUseRelyingPartyForServiceName:1 auditTokenData:v12];

      [WeakRetained _configureLoginChoicesForPresentationContext:v13 withRequestContext:v5];
      (*(void (**)(void, ASCAuthorizationPresentationContext *, void, uint64_t))(*(void *)(a1 + 48)
                                                                                             + 16))(*(void *)(a1 + 48), v13, 0, v14);
    }
    else
    {
      id v11 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_405;
      block[3] = &unk_26439ED00;
      id v17 = v6;
      os_activity_apply(v11, block);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    os_activity_apply(*(os_activity_t *)(a1 + 32), &__block_literal_global_404);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_402()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_402_cold_1();
  }
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_405(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_405_cold_1(a1, v2);
  }
}

- (void)authorizationPresenter:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5
{
}

- (void)didFetchPlatformLoginChoices:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x263F662D8] sharedProvider];
  id v5 = [v4 cachedGroups];

  if ([v5 count])
  {
    objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_409);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = (NSArray *)v10;
  }
  platformLoginChoices = self->_platformLoginChoices;
  self->_platformLoginChoices = v6;

  id didLoadPlatformCredentialsCallback = (void (**)(void))self->_didLoadPlatformCredentialsCallback;
  if (didLoadPlatformCredentialsCallback)
  {
    didLoadPlatformCredentialsCallback[2]();
    id v9 = self->_didLoadPlatformCredentialsCallback;
    self->_id didLoadPlatformCredentialsCallback = 0;
  }
}

BOOL __41__ASCAgent_didFetchPlatformLoginChoices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSharedCredential])
  {
    uint64_t v3 = [MEMORY[0x263F662D8] sharedProvider];
    id v4 = [v2 groupID];
    id v5 = [v3 cachedGroupWithID:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)didFetchSecurityKeyLoginChoices:(id)a3
{
  objc_storeStrong((id *)&self->_securityKeyLoginChoices, a3);
  id v5 = a3;
  requestPresenter = self->_requestPresenter;
  id v7 = [(ASCAgent *)self _allAvailableLoginChoicesForRequestContext:self->_requestContext];
  [(ASCAuthorizationPresenterHostProtocol *)requestPresenter updateInterfaceWithLoginChoices:v7];
}

- (void)requestPINWithRemainingRetries:(unint64_t)a3 completionHandler:(id)a4
{
  aBlocuint64_t k = a4;
  userEnteredPINCallbacuint64_t k = (void (**)(id, void))self->_userEnteredPINCallback;
  if (userEnteredPINCallback) {
    userEnteredPINCallback[2](userEnteredPINCallback, 0);
  }
  BOOL v6 = _Block_copy(aBlock);
  id v7 = self->_userEnteredPINCallback;
  self->_userEnteredPINCallbacuint64_t k = v6;

  [(ASCAuthorizationPresenterHostProtocol *)self->_requestPresenter presentPINEntryInterface];
}

- (void)didReceiveError:(int64_t)a3
{
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:a3 userInfo:0];
  if ((unint64_t)a3 > 0xD) {
    goto LABEL_10;
  }
  if (((1 << a3) & 0x2070) != 0)
  {
    [(ASCAuthorizationPresenterHostProtocol *)self->_requestPresenter updateInterfaceForUserVisibleError:v5];
    goto LABEL_6;
  }
  if (((1 << a3) & 0x700) != 0)
  {
    (*((void (**)(void))self->_pinResultCallback + 2))();
    goto LABEL_6;
  }
  if (a3 != 7)
  {
LABEL_10:
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__ASCAgent_didReceiveError___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a3;
    os_activity_apply(authorizationActivity, block);
    goto LABEL_6;
  }
  if ([(ASCCredentialRequestContext *)self->_requestContext isCABLEAuthenticatorRequest]) {
    [(ASCABLEAuthenticator *)self->_cableAuthenticator sendExcludedCredentialMatchError];
  }
LABEL_6:
}

void __28__ASCAgent_didReceiveError___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __28__ASCAgent_didReceiveError___block_invoke_cold_1();
  }
}

- (void)didCompleteRegistrationWithCredential:(id)a3 error:(id)a4
{
  passkeyCredentialCallbacuint64_t k = (void (**)(id, id, id))self->_passkeyCredentialCallback;
  if (passkeyCredentialCallback)
  {
    passkeyCredentialCallback[2](passkeyCredentialCallback, a3, a4);
    id v6 = self->_passkeyCredentialCallback;
    self->_passkeyCredentialCallbacuint64_t k = 0;
  }
  else
  {
    [(ASCAgent *)self _authorizationCompletedWithCredential:a3 error:a4];
  }
}

- (void)didCompleteAssertionWithCredential:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  passkeyCredentialCallbacuint64_t k = (void (**)(id, id, id))self->_passkeyCredentialCallback;
  if (passkeyCredentialCallback)
  {
    passkeyCredentialCallback[2](passkeyCredentialCallback, v6, v7);
    id v9 = self->_passkeyCredentialCallback;
    self->_passkeyCredentialCallbacuint64_t k = 0;
  }
  else
  {
    if ([(ASCCredentialRequestContext *)self->_requestContext requestStyle] != 1
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      [(ASCAgent *)self _authorizationCompletedWithCredential:v6 error:v7];
      goto LABEL_8;
    }
    requestPresenter = self->_requestPresenter;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__ASCAgent_didCompleteAssertionWithCredential_error___block_invoke;
    v11[3] = &unk_26439F150;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(ASCAuthorizationPresenterHostProtocol *)requestPresenter authorizationRequestFinishedWithCredential:v12 error:v13 completionHandler:v11];

    id v9 = v12;
  }

LABEL_8:
}

uint64_t __53__ASCAgent_didCompleteAssertionWithCredential_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authorizationCompletedWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_authorizationCompletedWithCredential:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ASCCredentialRequestContext *)self->_requestContext isCABLEAuthenticatorRequest])
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke;
    block[3] = &unk_26439F150;
    void block[4] = self;
    id v9 = v6;
    id v62 = v9;
    id v7 = v7;
    id v63 = v7;
    os_activity_apply(authorizationActivity, block);
    publicKeyCredentialOperationUUID = self->_publicKeyCredentialOperationUUID;
    if (publicKeyCredentialOperationUUID)
    {
      publicKeyCredentialManager = self->_publicKeyCredentialManager;
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:12 userInfo:0];
      [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager cancelOperationIfNecessaryWithUUID:publicKeyCredentialOperationUUID overrideError:v12];
    }
    if (objc_msgSend(v7, "safari_matchesErrorDomain:andCode:", @"com.apple.AuthenticationServicesCore.AuthorizationError", 12))
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_413);
    }
    else
    {
      id v13 = [(ASCCredentialRequestContext *)self->_requestContext globalFrameID];

      if (v13)
      {
        uint64_t v14 = [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager internalErrorToWKErrorIfApplicable:v7];

        id v7 = (id)v14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v9;
        if ([v15 isExternal])
        {
          id v16 = [v15 rawClientDataJSON];

          if (!v16)
          {
            id v17 = self->_publicKeyCredentialManager;
            id v18 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialAssertionOptions];
            [(ASPublicKeyCredentialManagerInterface *)v17 computeClientDataIfNeededForAssertionOptions:v18];

            uint64_t v19 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialAssertionOptions];
            id v20 = [v19 clientDataJSON];
            [v15 setRawClientDataJSON:v20];
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v9;
        if ([v21 isExternal])
        {
          id v22 = [v21 rawClientDataJSON];

          if (!v22)
          {
            id v23 = self->_publicKeyCredentialManager;
            long long v24 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialCreationOptions];
            [(ASPublicKeyCredentialManagerInterface *)v23 computeClientDataIfNeededForCreationOptions:v24];

            long long v25 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialCreationOptions];
            id v26 = [v25 clientDataJSON];
            [v21 setRawClientDataJSON:v26];
          }
        }
      }
      BOOL v27 = [(ASCCredentialRequestContext *)self->_requestContext isConditionalRegistrationRequest];
      if (v9 && v27)
      {
        id v28 = v9;
        uint64_t v29 = [v28 relyingPartyIdentifier];
        if (([v28 isExternal] & 1) == 0
          && ([v29 isEqualToString:@"apple.com"] & 1) == 0)
        {
          if (!self->_isClientEntitledWebBrowser)
          {
            clientApplicationIdentifier = self->_clientApplicationIdentifier;
            id v60 = 0;
            id v31 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:clientApplicationIdentifier error:&v60];
            id v32 = v60;
            if (v31)
            {
              uint64_t v33 = [v31 localizedName];
              id v34 = v29;
              uint64_t v29 = (void *)v33;
            }
            else
            {
              uint64_t v35 = self->_authorizationActivity;
              v58[0] = MEMORY[0x263EF8330];
              v58[1] = 3221225472;
              v58[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_417;
              v58[3] = &unk_26439ED00;
              id v59 = v7;
              os_activity_apply(v35, v58);
              id v34 = v59;
            }
          }
          id v36 = [MEMORY[0x263F66340] sharedNotificationManager];
          id v37 = [v28 relyingPartyIdentifier];
          id v54 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialCreationOptions];
          uint64_t v38 = [v54 userName];
          uint64_t v39 = [v28 credentialID];
          [v36 scheduleAutomaticallyCreatedPasskeyNotificationWithServiceName:v29 relyingPartyID:v37 userName:v38 credentialID:v39 completionHandler:&__block_literal_global_421];
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v9;
        uint64_t v41 = [v40 externalProviderBundleIdentifier];
        long long v42 = (void *)v41;
        long long v43 = (void *)*MEMORY[0x263F664C8];
        if (v41) {
          long long v43 = (void *)v41;
        }
        id v44 = v43;

        signInEventCollector = self->_signInEventCollector;
        long long v46 = [v40 user];
        long long v47 = [(ASCAgent *)self _bundleIDFromAppID:self->_clientApplicationIdentifier];
        [(ASPasswordSignInEventCollector *)signInEventCollector didUseCredentialForUsername:v46 forHost:0 fromProviderWithBundleIdentifier:v44 inAppWithBundleIdentifier:v47];
      }
      [(ASCAuthorizationPresenterHostProtocol *)self->_requestPresenter dismiss];
      if (self->_authorizationCompletionHandler)
      {
        long long v48 = self->_clientApplicationIdentifier;
        authorizationTrafficController = self->_authorizationTrafficController;
        authorizationTrafficControllerTokeuint64_t n = self->_authorizationTrafficControllerToken;
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_2;
        v55[3] = &unk_26439F150;
        void v55[4] = self;
        id v56 = v9;
        id v57 = v7;
        [(ASCAuthorizationTrafficController *)authorizationTrafficController endAuthorizationForAppIdentifier:v48 token:authorizationTrafficControllerToken clearanceHandler:v55];
      }
      [(ASCABLEClient *)self->_cableClient cancelIfNecessary];
      cableClient = self->_cableClient;
      self->_cableClient = 0;

      cableAuthenticator = self->_cableAuthenticator;
      self->_cableAuthenticator = 0;

      int v53 = [MEMORY[0x263F66568] sharedManager];
      [v53 removeObserver:self];
    }
  }
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    id v5 = (void *)a1[6];
    id v6 = v2;
    id v7 = objc_msgSend(v5, "safari_privacyPreservingDescription");
    uint64_t v8 = *(void *)(a1[4] + 168);
    int v9 = 134218754;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_impl(&dword_219326000, v6, OS_LOG_TYPE_DEFAULT, "Completing authorization: %p %{public}@ %{public}@ %{public}@", (uint8_t *)&v9, 0x2Au);
  }
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_411()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Received internal cancel. Dropping.", v1, 2u);
  }
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_417(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_417_cold_1(a1, v2);
  }
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 176);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_3;
  block[3] = &unk_26439ED00;
  void block[4] = v2;
  os_activity_apply(v3, block);
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 96) + 16))();
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = 0;
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);
    int v4 = 138477827;
    uint64_t v5 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Completed request for %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return [(ASCCredentialRequestContext *)self->_requestContext isCABLEAuthenticatorRequest];
}

- (void)dealloc
{
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__ASCAgent_dealloc__block_invoke;
  block[3] = &unk_26439ED00;
  void block[4] = self;
  os_activity_apply(authorizationActivity, block);
  int v4 = self->_publicKeyCredentialOperationUUID;
  if (v4) {
    [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager cancelOperationIfNecessaryWithUUID:v4 overrideError:0];
  }
  [(ASCAuthorizationTrafficController *)self->_authorizationTrafficController cancelAuthorizationForAppIdentifierIfNecessary:self->_clientApplicationIdentifier token:self->_authorizationTrafficControllerToken];

  v5.receiver = self;
  v5.super_class = (Class)ASCAgent;
  [(ASCAgent *)&v5 dealloc];
}

void __19__ASCAgent_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134349056;
    uint64_t v5 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Dealloc for %{public}p. Cancelling any outstanding requests.", (uint8_t *)&v4, 0xCu);
  }
}

- (id)encodeMakeCredentialCTAPCommandForAuthenticatorWithUserVerificationAvailability:(unint64_t)a3 authenticatorSupportedExtensions:(id)a4
{
  id v6 = a4;
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  uint64_t v8 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialCreationOptions];
  if (v8)
  {
    int v9 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager encodeMakeCredentialCommandWithOptions:v8 authenticatorUserVerificationAvailability:a3 authenticatorSupportedExtensions:v6];
  }
  else
  {
    uint64_t v10 = [(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialCreationOptions];
    int v9 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager encodeMakeCredentialCommandWithOptions:v10 authenticatorUserVerificationAvailability:a3 authenticatorSupportedExtensions:v6];
  }

  return v9;
}

- (id)encodeGetAssertionCTAPCommandForAuthenticatorWithUserVerificationAvailability:(unint64_t)a3 authenticatorSupportedExtensions:(id)a4
{
  id v6 = a4;
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  uint64_t v8 = [(ASCCredentialRequestContext *)self->_requestContext platformKeyCredentialAssertionOptions];
  if (v8)
  {
    int v9 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager encodeGetAssertionCommandWithOptions:v8 authenticatorUserVerificationAvailability:a3 authenticatorSupportedExtensions:v6];
  }
  else
  {
    uint64_t v10 = [(ASCCredentialRequestContext *)self->_requestContext securityKeyCredentialAssertionOptions];
    int v9 = [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager encodeGetAssertionCommandWithOptions:v10 authenticatorUserVerificationAvailability:a3 authenticatorSupportedExtensions:v6];
  }

  return v9;
}

- (void)cableClientWillConnect:(id)a3
{
}

- (void)cableClientWillAuthenticate:(id)a3
{
}

- (BOOL)_canCreateICloudKeychainPasskeyPreflightWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_test_overrideCanCreateICloudKeychainPasskey
    && [MEMORY[0x263F662A0] isInternalInstall])
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[ASCAgent _canCreateICloudKeychainPasskeyPreflightWithError:]";
      _os_log_impl(&dword_219326000, v5, OS_LOG_TYPE_INFO, "Using test override for %s", buf, 0xCu);
    }
    return [(NSNumber *)self->_test_overrideCanCreateICloudKeychainPasskey BOOLValue];
  }
  else
  {
    id v7 = [MEMORY[0x263F662C8] sharedMonitor];
    char v8 = [v7 isKeychainSyncEnabled];

    if (v8)
    {
      return 1;
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_425);
      int v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08338];
      uint64_t v12 = @"iCloud Keychain is off.";
      uint64_t v10 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      *a3 = [v9 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v10];

      return 0;
    }
  }
}

void __62__ASCAgent__canCreateICloudKeychainPasskeyPreflightWithError___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __62__ASCAgent__canCreateICloudKeychainPasskeyPreflightWithError___block_invoke_cold_1();
  }
}

- (BOOL)_isConnection:(id)a3 entitledToDeletePasskeysForRelyingParty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "safari_arrayForEntitlement:containingObjectsOfClass:", @"com.apple.private.authentication-services.delete-passkeys-by-rpid", objc_opt_class());

  if ([v7 count]) {
    char v8 = [v7 containsObject:v5];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSDictionary *)self->_test_overrideEntitlements count]
    && [MEMORY[0x263F662A0] isInternalInstall])
  {
    char v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v13 = "-[ASCAgent _connection:hasEntitlement:]";
      _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "Using test override for %s", buf, 0xCu);
    }
    char HasEntitlement = [(NSDictionary *)self->_test_overrideEntitlements safari_BOOLForKey:v7];
  }
  else
  {
    if (v6) {
      [v6 auditToken];
    }
    char HasEntitlement = WBSAuditTokenHasEntitlement();
  }
  BOOL v10 = HasEntitlement;

  return v10;
}

- (BOOL)_isValidContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_test_overrideIsLAContextValid && [MEMORY[0x263F662A0] isInternalInstall])
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[ASCAgent _isValidContext:]";
      _os_log_impl(&dword_219326000, v5, OS_LOG_TYPE_INFO, "Using test override for %s", buf, 0xCu);
    }
    BOOL v6 = [(NSNumber *)self->_test_overrideIsLAContextValid BOOLValue];
  }
  else
  {
    uint64_t v7 = WBSAuthenticationPolicyForPasswordManager();
    uint64_t v16 = &unk_26CAC2750;
    uint64_t v17 = MEMORY[0x263EFFA88];
    char v8 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v15 = 0;
    int v9 = [v4 evaluatePolicy:v7 options:v8 error:&v15];
    id v10 = v15;

    BOOL v6 = v9 != 0;
    if (!v9)
    {
      authorizationActivity = self->_authorizationActivity;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __28__ASCAgent__isValidContext___block_invoke;
      v13[3] = &unk_26439ED00;
      id v14 = v10;
      os_activity_apply(authorizationActivity, v13);
    }
  }

  return v6;
}

void __28__ASCAgent__isValidContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __28__ASCAgent__isValidContext___block_invoke_cold_1(a1, v2);
  }
}

- (void)test_setIsClientEntitledWebBrowser:(BOOL)a3
{
  self->_BOOL isClientEntitledWebBrowser = a3;
}

- (void)test_setOverrideEntitlements:(id)a3
{
  self->_test_overrideEntitlements = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)test_setOverrideCanCreateICloudKeychainPasskey:(BOOL)a3
{
  self->_test_overrideCanCreateICloudKeychainPasskey = [NSNumber numberWithBool:a3];

  MEMORY[0x270F9A758]();
}

- (void)test_setOverrideISLAContextValid:(BOOL)a3
{
  self->_test_overrideIsLAContextValid = [NSNumber numberWithBool:a3];

  MEMORY[0x270F9A758]();
}

- (void)test_setOverrideExtensionStates:(id)a3
{
  self->_test_overrideExtensionStates = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)test_addCredentialProviderExtensionLoginChoiceWithName:(id)a3 extensionBundleID:(id)a4 containingAppBundleID:(id)a5
{
  test_credentialProviderExtensionLoginChoices = self->_test_credentialProviderExtensionLoginChoices;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[ASCCredentialProviderExtensionLoginChoice alloc] initWithProviderName:v10 providerBundleID:v9 providerExtensionContainingAppBundleID:v8];

  [(NSMutableArray *)test_credentialProviderExtensionLoginChoices addObject:v11];
}

- (void)test_clearCredentialProviderExtensionLoginChoices
{
}

- (void)test_addAutoFillEvent:(id)a3 url:(id)a4
{
  signInEventCollector = self->_signInEventCollector;
  uint64_t v6 = *MEMORY[0x263F664C8];
  uint64_t v7 = (void *)MEMORY[0x263F086E0];
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v7, "safari_safariApplicationPlatformBundleIdentifier");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(ASPasswordSignInEventCollector *)signInEventCollector didUseCredentialForUsername:v9 forURL:v8 fromProviderWithBundleIdentifier:v6 inBrowserWithBundleIdentifier:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_credentialProviderExtensionLoginChoices, 0);
  objc_storeStrong((id *)&self->_relatedOriginFetcher, 0);
  objc_storeStrong((id *)&self->_test_overrideExtensionStates, 0);
  objc_storeStrong((id *)&self->_test_overrideIsLAContextValid, 0);
  objc_storeStrong((id *)&self->_test_overrideCanCreateICloudKeychainPasskey, 0);
  objc_storeStrong((id *)&self->_test_overrideEntitlements, 0);
  objc_storeStrong((id *)&self->_cableAuthenticator, 0);
  objc_storeStrong((id *)&self->_cableAuthenticationURL, 0);
  objc_storeStrong((id *)&self->_cableClient, 0);
  objc_storeStrong((id *)&self->_internalSemaphore, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialOperationUUID, 0);
  objc_storeStrong(&self->_passkeyCredentialCallback, 0);
  objc_storeStrong(&self->_pinResultCallback, 0);
  objc_storeStrong(&self->_userEnteredPINCallback, 0);
  objc_storeStrong(&self->_didLoadPlatformCredentialsCallback, 0);
  objc_storeStrong((id *)&self->_securityKeyLoginChoices, 0);
  objc_storeStrong((id *)&self->_platformLoginChoices, 0);
  objc_storeStrong((id *)&self->_signInEventCollector, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialManager, 0);
  objc_storeStrong(&self->_authorizationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_savedAccountContext, 0);
  objc_storeStrong((id *)&self->_requestPresenter, 0);
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_appleIDChoices, 0);
  objc_storeStrong((id *)&self->_passwordCredentials, 0);
  objc_storeStrong((id *)&self->_authorizationTrafficControllerToken, 0);

  objc_storeStrong((id *)&self->_authorizationTrafficController, 0);
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_59_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__ASCAgent_performAuthorizationRequestsForContext_withPresenter_completionHandler___block_invoke_2_68_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Could not perform authorization: %{public}@", v6, v7, v8, v9, v10);
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_219326000, v0, v1, "Found unexpected implicitly selected login choice: %{public}@", v2);
}

void __79__ASCAgent_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Could not find implicitly selected login choice.", v2, v3, v4, v5, v6);
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Not performing conditional registration.", v2, v3, v4, v5, v6);
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_107_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Selected credential provider does not support conditional registration.", v2, v3, v4, v5, v6);
}

void __107__ASCAgent__requestConditionalRegistrationOnProvider_presentationContext_requestContext_completionHandler___block_invoke_2_112_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Got a conditional registration request but don't know where to send it (probably a web extension?)", v2, v3, v4, v5, v6);
}

- (void)getPasskeysDataForRelyingParty:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_219326000, v0, v1, "Attempting to fetch passkey data while KeyBag is locked. This likely won't work.", v2, v3, v4, v5, v6);
}

- (void)getPasskeysDataForRelyingParty:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_219326000, v0, v1, "Unentitled client attempted to read passkey data.", v2, v3, v4, v5, v6);
}

- (void)deletePasskeyForRelyingParty:withCredentialID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Not deleting passkey. KeyBag is currently locked.", v2, v3, v4, v5, v6);
}

- (void)deletePasskeyForRelyingParty:withCredentialID:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_219326000, v0, v1, "Unentitled client attempted to delete passkey for %{public}@.", v2, v3, v4, v5, v6);
}

- (void)deleteAllPasskeysForRelyingParty:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Not deleting passkeys. KeyBag is currently locked.", v2, v3, v4, v5, v6);
}

- (void)deleteAllPasskeysForRelyingParty:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_219326000, v0, v1, "Unentitled client attempted to delete passkeys for %{public}@.", v2, v3, v4, v5, v6);
}

- (void)renamePasskeyWithCredentialID:newName:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_219326000, v0, v1, "Unentitled client attempted to rename passkey.", v2, v3, v4, v5, v6);
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  [(id)OUTLINED_FUNCTION_1() count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v3, v4, "Found unexpected number of login choices: %{public}ld", v5, v6, v7, v8, v9);
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_148_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_219326000, v0, v1, "Expected passkey for implicitly selected login choice, but found: %{public}@", v2);
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_149_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Unexpected found registration login choice.", v2, v3, v4, v5, v6);
}

void __72__ASCAgent__implicitlySelectAssertionLoginChoiceFromChoices_forContext___block_invoke_152_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Attempted to perform silent assertion without authenticated context.", v2, v3, v4, v5, v6);
}

void __32__ASCAgent_cancelCurrentRequest__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Attempted to perform caBLE transaction with passkeys disabled.", v2, v3, v4, v5, v6);
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_169_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Attempted to perform authorization from process without application identifier.", v2, v3, v4, v5, v6);
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_179_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Client is not properly entitled for this request. Rejecting.", v2, v3, v4, v5, v6);
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_4_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_219326000, v0, v1, "Error evaluating passkey related origins: %{public}@", v2);
}

void __96__ASCAgent__prepareForAuthorizationRequestsForContext_clientConnection_withPresentationHandler___block_invoke_192_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "The requested RPID did not match the origin or related origins.", v2, v3, v4, v5, v6);
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Client does not have necessary entitlements to access Sign in with Apple credentials.", v2, v3, v4, v5, v6);
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_225_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Unable to fetch client bundle identifier.", v2, v3, v4, v5, v6);
}

void __69__ASCAgent__configureAppleIDCredentialWithContext_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Unable to fetch presentation context for Sign in with Apple.", v2, v3, v4, v5, v6);
}

void __69__ASCAgent_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_238_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Client is missing required entitlement open caBLE URLs", v2, v3, v4, v5, v6);
}

- (void)browserPasskeysForRelyingParty:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "TCC access denied for browser passkey request.", v2, v3, v4, v5, v6);
}

void __61__ASCAgent_browserPasskeysForRelyingParty_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_219326000, v2, OS_LOG_TYPE_FAULT, "Rejecting invocation of restricted method %{public}@ from unentitled process.", v5, 0xCu);
}

- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Passkeys are unavailable because iCloud Keychain has been disabled by a configuration profile.", v2, v3, v4, v5, v6);
}

void __31__ASCAgent__bundleIDFromAppID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Failed to get application bundle identifier with error: %{public}@", v6, v7, v8, v9, v10);
}

void __29__ASCAgent__teamIDfromAppID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Failed to get application team identifier with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_performAuthKitAuthorizationValidationForAccount:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Failed to get AuthKit account when checking for Sign in with Apple credential.", v2, v3, v4, v5, v6);
}

void __61__ASCAgent__performAuthKitAuthorizationValidationForAccount___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Cannot perform AuthKit authorization due to error: %{public}@", v6, v7, v8, v9, v10);
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Error checking extension application identifier: %{public}@", v6, v7, v8, v9, v10);
}

void __64__ASCAgent__approvalStateForApplicationIdentifier_relyingParty___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Error while waiting for site approval: %{public}@", v6, v7, v8, v9, v10);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_313_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Client attempted to make silent request without web browser entitlement", v2, v3, v4, v5, v6);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_331_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1() relyingPartyIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Client attempted to make conditional request for non-associated rp: %{private}@", v6, v7, v8, v9, v10);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_335_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  [(id)OUTLINED_FUNCTION_1() requestTypes];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v3, v4, "Client attempted to make silent request for unsupported credential types: %{public}ld", v5, v6, v7, v8, v9);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_339_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Client is making proxied credential request but is not entitled to do so.", v2, v3, v4, v5, v6);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_345_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_219326000, v0, v1, "Proxied client is not associated with %{public}@", v2);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_352_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Requested enterprise attestation for unconfigured relying party.", v2, v3, v4, v5, v6);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_361_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Client tried to use web-browser-only options.", v2, v3, v4, v5, v6);
}

void __87__ASCAgent__isClientWithApplicationIdentifier_properlyEntitledForRequestContext_error___block_invoke_367_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_219326000, v0, v1, "%{public}@", v2);
}

void __73__ASCAgent__credentialRequestedForPasswordLoginChoice_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Could not find a credential for the user's login choice.", v2, v3, v4, v5, v6);
}

void __76__ASCAgent_authorizationPresenter_validateUserEnteredPIN_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Unexpectedly received PIN callback.", v2, v3, v4, v5, v6);
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_395_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Failed to create caBLE authenticator: %{public}@", v6, v7, v8, v9, v10);
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Could not authenticator: agent no longer exists.", v2, v3, v4, v5, v6);
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_399_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Failed to start caBLE authenticator: %{public}@", v6, v7, v8, v9, v10);
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_2_402_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Could not prepare for caBLE authorization: agent no longer exists.", v2, v3, v4, v5, v6);
}

void __81__ASCAgent_authorizationPresenter_startCABLEAuthenticationWithCompletionHandler___block_invoke_405_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Failed to prepare for caBLE authorization: %{public}@", v6, v7, v8, v9, v10);
}

void __28__ASCAgent_didReceiveError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_219326000, v0, v1, "Received unexpected error: %ld", v2);
}

void __56__ASCAgent__authorizationCompletedWithCredential_error___block_invoke_417_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Could not fetch application record for client: %{public}@", v6, v7, v8, v9, v10);
}

void __62__ASCAgent__canCreateICloudKeychainPasskeyPreflightWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Cannot create a passkey. iCloud Keychain is off.", v2, v3, v4, v5, v6);
}

void __28__ASCAgent__isValidContext___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Invalid LAContext provided: %{public}@.", v6, v7, v8, v9, v10);
}

@end
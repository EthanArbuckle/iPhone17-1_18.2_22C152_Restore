@interface ASAgentAutoFillListener
- (ASAgentAutoFillListener)initWithPublicKeyCredentialManager:(id)a3 signInEventCollector:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8;
- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8;
- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6;
- (void)didFillCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6;
- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6;
- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6;
- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3;
- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPasskeysForRunningAssertionWithApplicationIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getPasskeysForRunningAssertionWithWebFrameIdentifier:(id)a3 completionHandler:(id)a4;
- (void)isOrigin:(id)a3 relatedToRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5;
- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3;
- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7;
- (void)userSelectedAutoFillNearbyDevice:(id)a3 completionHandler:(id)a4;
- (void)userSelectedAutoFillPasskey:(id)a3 authenticatedLAContext:(id)a4 savedAccountContext:(id)a5 completionHandler:(id)a6;
@end

@implementation ASAgentAutoFillListener

- (ASAgentAutoFillListener)initWithPublicKeyCredentialManager:(id)a3 signInEventCollector:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASAgentAutoFillListener;
  v9 = [(ASAgentAutoFillListener *)&v18 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F08D88]);
    v11 = WBSAuthenticationServicesAgentAutoFillServiceName();
    uint64_t v12 = [v10 initWithMachServiceName:v11];
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v12;

    [(NSXPCListener *)v9->_listener setDelegate:v9];
    objc_storeStrong((id *)&v9->_publicKeyCredentialManager, a3);
    [v7 setPasskeyAutoFillManagerDelegate:v9];
    uint64_t v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    weakActiveConnections = v9->_weakActiveConnections;
    v9->_weakActiveConnections = (NSHashTable *)v14;

    v9->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_signInEventCollector, a4);
    [(NSXPCListener *)v9->_listener resume];
    v16 = v9;
  }

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  long long v14 = 0u;
  long long v15 = 0u;
  if (v7) {
    [v7 auditToken];
  }
  v13[0] = v14;
  v13[1] = v15;
  int v9 = isClientWithAuditTokenProperlyEntitled(v13);
  if (v9)
  {
    os_unfair_lock_lock(&self->_internalLock);
    [(NSHashTable *)self->_weakActiveConnections addObject:v8];
    os_unfair_lock_unlock(&self->_internalLock);
    id v10 = WBSAuthenticationServicesAgentDelegateInterface();
    [v8 setRemoteObjectInterface:v10];

    v11 = WBSAuthenticationServicesAgentInterface();
    [v8 setExportedInterface:v11];

    [v8 setExportedObject:self];
    [v8 resume];
  }

  return v9;
}

- (void)getPasskeysForRunningAssertionWithApplicationIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  int v9 = v8;
  if (v8)
  {
    [v8 auditToken];
    if ((WBSAuditTokenHasEntitlement() & 1) == 0)
    {
      [v9 auditToken];
      goto LABEL_6;
    }
LABEL_7:
    id v10 = [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager autoFillOperationUUIDForApplicationIdentifier:v6];
    if (v10)
    {
      v11 = [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager autoFillPasskeysForOperationUUID:v10];
      uint64_t v12 = [v11 first];
      v13 = [v11 second];
      v7[2](v7, v12, v13);
    }
    else
    {
      v7[2](v7, (void *)MEMORY[0x263EFFA68], 0);
    }

    goto LABEL_14;
  }
  memset(&v16[2], 0, 32);
  if (WBSAuditTokenHasEntitlement()) {
    goto LABEL_7;
  }
  memset(v16, 0, 32);
LABEL_6:
  if (isClientWithAuditTokenProperlyEntitled(v16)) {
    goto LABEL_7;
  }
  long long v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 0;
    _os_log_impl(&dword_219326000, v14, OS_LOG_TYPE_DEFAULT, "Rejecting unentitled process from requesting passkeys.", (uint8_t *)v15, 2u);
  }
  v7[2](v7, (void *)MEMORY[0x263EFFA68], 0);
LABEL_14:
}

- (void)getPasskeysForRunningAssertionWithWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  int v9 = v8;
  if (v8) {
    [v8 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  if (isClientWithAuditTokenProperlyEntitled(v17))
  {
    id v10 = [[ASGlobalFrameIdentifier alloc] initWithCoreFrameIdentifier:v6];
    v11 = [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager autoFillOperationUUIDForWebFrameIdentifier:v10];
    if (v11)
    {
      uint64_t v12 = [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager autoFillPasskeysForOperationUUID:v11];
      v13 = [v12 first];
      long long v14 = [v12 second];
      v7[2](v7, v13, v14);
    }
    else
    {
      v7[2](v7, (void *)MEMORY[0x263EFFA68], 0);
    }
  }
  else
  {
    long long v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl(&dword_219326000, v15, OS_LOG_TYPE_DEFAULT, "Rejecting unentitled process from requesting passkeys.", (uint8_t *)v16, 2u);
    }
    v7[2](v7, (void *)MEMORY[0x263EFFA68], 0);
  }
}

- (void)userSelectedAutoFillPasskey:(id)a3 authenticatedLAContext:(id)a4 savedAccountContext:(id)a5 completionHandler:(id)a6
{
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  long long v15 = (void (**)(void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v12 identifier];
  long long v14 = [v12 operationUUID];

  [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager assertUsingAutoFillPasskeyWithIdentifier:v13 authenticatedContext:v11 savedAccountContext:v10 forOperationUUID:v14];
  v15[2]();
}

- (void)userSelectedAutoFillNearbyDevice:(id)a3 completionHandler:(id)a4
{
  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  id v6 = a4;
  id v7 = [a3 operationUUID];
  [(ASPublicKeyCredentialManagerInterface *)publicKeyCredentialManager presentCABLESheetForOperationUUID:v7 withCompletionHandler:v6];
}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7
{
  v40[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v14 = a7;
  long long v15 = +[ASFeatureManager sharedManager];
  v16 = [MEMORY[0x263F08D68] currentConnection];
  v17 = v16;
  if (v16) {
    [v16 auditToken];
  }
  else {
    memset(v39, 0, sizeof(v39));
  }
  char v18 = [v15 isClientEntitledForInternalTestingWithAuditToken:v39];

  if (v18)
  {
    v19 = [ASCPublicKeyCredentialCreationOptions alloc];
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    v22 = [v21 dataUsingEncoding:4];
    v40[0] = &unk_26CAC2738;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
    v23 = v33 = self;
    v25 = v35;
    v24 = v36;
    v26 = v13;
    id v27 = v13;
    v28 = v34;
    v29 = [(ASCPublicKeyCredentialCreationOptions *)v19 initWithChallenge:v22 clientDataJSON:0 clientDataHash:0 relyingPartyIdentifier:v35 userName:v27 userIdentifier:v34 userDisplayName:v36 supportedAlgorithmIdentifiers:v23 attestationPreference:@"none" userVerificationPreference:0 excludedCredentials:0 extensions:0 origin:0];

    v30 = objc_alloc_init(ASPublicKeyCredentialOperationTestDelegate);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __122__ASAgentAutoFillListener_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke;
    v37[3] = &unk_26439ED68;
    id v38 = v14;
    [(ASPublicKeyCredentialOperationTestDelegate *)v30 setDidCompletionRegistrationCallback:v37];
    id v31 = (id)[(ASPublicKeyCredentialManagerInterface *)v33->_publicKeyCredentialManager createNewPlatformCredentialWithOptions:v29 authenticatedContext:0 delegate:v30 webFrameIdentifier:0 parentActivity:MEMORY[0x263EF8420] isConditionalRegistration:0];
  }
  else
  {
    v32 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[ASAgentAutoFillListener test_createPasskeyWithUserName:displayName:relyingPartyIdentifier:userHandle:completionHandler:](v32, a2);
    }
    (*((void (**)(id, void))v14 + 2))(v14, 0);
    v26 = v13;
    v25 = v35;
    v24 = v36;
    v28 = v34;
  }
}

void __122__ASAgentAutoFillListener_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_219326000, v7, OS_LOG_TYPE_INFO, "Test passkey creation completed: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5 != 0);
}

- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
}

- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
}

- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v20) = 1;
  v21 = [[ASCPlatformPublicKeyCredentialAssertion alloc] initWithRelyingPartyIdentifier:v18 authenticatorData:v17 signature:v16 userHandle:v15 rawClientDataJSON:0 credentialID:v14 extensions:0 attachment:@"platform" isExternal:v20];

  [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager completeAssertionWithExternalPasskeyForWebFrameIdentifier:v19 usingCredential:v21];
}

- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v20) = 1;
  v21 = [[ASCPlatformPublicKeyCredentialAssertion alloc] initWithRelyingPartyIdentifier:v18 authenticatorData:v17 signature:v16 userHandle:v15 rawClientDataJSON:0 credentialID:v14 extensions:0 attachment:@"platform" isExternal:v20];

  [(ASPublicKeyCredentialManagerInterface *)self->_publicKeyCredentialManager completeAssertionWithExternalPasskeyForApplicationIdentifier:v19 usingCredential:v21];
}

- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3
{
}

- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6
{
}

- (void)didFillCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6
{
  if (a4)
  {
    signInEventCollector = self->_signInEventCollector;
    -[ASPasswordSignInEventCollector didUseCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:](signInEventCollector, "didUseCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:", a3);
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ASAgentAutoFillListener didFillCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:](v7);
    }
  }
}

- (void)isOrigin:(id)a3 relatedToRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  __int16 v10 = objc_alloc_init(_TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__ASAgentAutoFillListener_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_26439ED90;
  id v13 = v7;
  id v11 = v7;
  [(ASCRelatedOriginFetcher *)v10 isOrigin:v9 relatedToRelyingPartyIdentifier:v8 completionHandler:v12];
}

uint64_t __86__ASAgentAutoFillListener_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v4;
    _os_log_impl(&dword_219326000, v5, OS_LOG_TYPE_INFO, "Passkeys loaded for %{public}@", buf, 0xCu);
  }
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_weakActiveConnections;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "remoteObjectProxy", (void)v13);
        [v12 newPasskeysAvailableForApplicationIdentifier:v4];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInEventCollector, 0);
  objc_storeStrong((id *)&self->_weakActiveConnections, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialManager, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)test_createPasskeyWithUserName:(void *)a1 displayName:(const char *)a2 relyingPartyIdentifier:userHandle:completionHandler:.cold.1(void *a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = NSStringFromSelector(a2);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_219326000, v3, OS_LOG_TYPE_FAULT, "Rejecting invocation of restricted method %{public}@ from unentitled process.", (uint8_t *)&v5, 0xCu);
}

- (void)didFillCredentialForUsername:(os_log_t)log forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[ASAgentAutoFillListener didFillCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:]";
  _os_log_error_impl(&dword_219326000, log, OS_LOG_TYPE_ERROR, "Nil URL passed to %s", (uint8_t *)&v1, 0xCu);
}

@end
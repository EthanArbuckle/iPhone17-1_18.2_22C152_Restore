@interface DCBiometricStoreClient
- (DCBiometricStoreClient)init;
- (NSXPCConnection)serverConnection;
- (id)createDaemonDisconnectedError;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)bioBindingUnboundACL:(id)a3;
- (void)boundAppletPresentmentACL:(id)a3;
- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3;
- (void)credentialAuthenticationTokenStatus:(id)a3;
- (void)dealloc;
- (void)deleteGlobalAuthACLWithCompletion:(id)a3;
- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4;
- (void)generatePhoneTokenWithNonce:(id)a3 keyBlob:(id)a4 pairingID:(id)a5 completion:(id)a6;
- (void)generatePrearmTrustCertificateWithNonce:(id)a3 pairingID:(id)a4 completion:(id)a5;
- (void)getCASDCertificate:(id)a3;
- (void)getGlobalProgenitorKeyAttestation:(id)a3;
- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3;
- (void)globalAuthACLWithCompletion:(id)a3;
- (void)init;
- (void)invalidate;
- (void)migratePrearmTrustBlob:(id)a3 completion:(id)a4;
- (void)nonceForAuthorizationTokenWithCompletion:(id)a3;
- (void)passcodeBindingUnboundACL:(id)a3;
- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4;
- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(id)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5;
- (void)revokeCredentialAuthorizationToken:(id)a3;
- (void)setGlobalAuthACL:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)setModifiedGlobalAuthACL:(id)a3 externalizedLAContext:(id)a4 completion:(id)a5;
- (void)setServerConnection:(id)a3;
@end

@implementation DCBiometricStoreClient

- (DCBiometricStoreClient)init
{
  v3 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient init]();
  }

  v18.receiver = self;
  v18.super_class = (Class)DCBiometricStoreClient;
  v4 = [(DCBiometricStoreClient *)&v18 init];
  if (v4)
  {
    v5 = DC_LOG_CLIENT_1();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DCBiometricStoreClient init](v5);
    }

    v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.idcredd.biometrics.xpc" options:4096];
    [(DCBiometricStoreClient *)v4 setServerConnection:v6];

    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5A3368];
    v8 = [(DCBiometricStoreClient *)v4 serverConnection];
    [v8 setRemoteObjectInterface:v7];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [(DCBiometricStoreClient *)v4 serverConnection];
    v13 = [v12 remoteObjectInterface];
    [v13 setClasses:v11 forSelector:sel_globalAuthACLTemplateUUIDsWithCompletion_ argumentIndex:0 ofReply:1];

    v14 = [(DCBiometricStoreClient *)v4 serverConnection];
    v15 = [v14 remoteObjectInterface];
    [v15 setClasses:v11 forSelector:sel_setModifiedGlobalAuthACL_externalizedLAContext_completion_ argumentIndex:0 ofReply:1];

    v16 = [(DCBiometricStoreClient *)v4 serverConnection];
    [v16 activate];
  }
  return v4;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient dealloc called", v2, v3, v4, v5, v6);
}

- (void)bioBindingUnboundACL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient bioBindingUnboundACL:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2;
  v9[3] = &unk_264228CE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 bioBindingUnboundACL:v9];
}

uint64_t __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_2();
    }

    v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)passcodeBindingUnboundACL:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient passcodeBindingUnboundACL:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2;
  v9[3] = &unk_264228CE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 passcodeBindingUnboundACL:v9];
}

uint64_t __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_2();
    }

    v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setGlobalAuthACL:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient setGlobalAuthACL:ofType:completion:]();
  }

  v11 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke;
  v13[3] = &unk_264228C90;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 setGlobalAuthACL:v9 ofType:a4 completion:v13];
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_1();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_3();
    }
  }
  else
  {
    if (v5) {
      __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_2();
    }

    id v4 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setModifiedGlobalAuthACL:(id)a3 externalizedLAContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient setModifiedGlobalAuthACL:externalizedLAContext:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v8;
  id v18 = v12;
  v13 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2;
  v15[3] = &unk_264228D08;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 setModifiedGlobalAuthACL:v10 externalizedLAContext:v9 completion:v15];
}

uint64_t __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_2();
    }

    v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)globalAuthACLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient globalAuthACLWithCompletion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2;
  v9[3] = &unk_264229290;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 globalAuthACLWithCompletion:v9];
}

uint64_t __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_2();
    }

    v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient deleteGlobalAuthACLWithCompletion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2;
  v9[3] = &unk_264229180;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 deleteGlobalAuthACLWithCompletion:v9];
}

uint64_t __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v6) {
      __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_2();
    }

    id v5 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2;
  v9[3] = &unk_2642292B8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 globalAuthACLTemplateUUIDsWithCompletion:v9];
}

uint64_t __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = DC_LOG_CLIENT_1();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v9) {
      __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v9) {
      __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_2();
    }

    id v8 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2;
  v9[3] = &unk_2642292E0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 nonceForAuthorizationTokenWithCompletion:v9];
}

uint64_t __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_2();
    }

    id v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient prearmCredentialWithAuthorizationToken:completion:]();
  }

  BOOL v9 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke;
  v11[3] = &unk_264228C90;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 prearmCredentialWithAuthorizationToken:v7 completion:v11];
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_1();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_3();
    }
  }
  else
  {
    if (v5) {
      __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_2();
    }

    id v4 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient establishPrearmTrustV2:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2;
  v12[3] = &unk_264229308;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 establishPrearmTrustV2:v7 completion:v12];
}

uint64_t __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_2();
    }

    id v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)revokeCredentialAuthorizationToken:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient revokeCredentialAuthorizationToken:]();
  }

  id v6 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke;
  v8[3] = &unk_264228C90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 revokeCredentialAuthorizationToken:v8];
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_1();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_3();
    }
  }
  else
  {
    if (v5) {
      __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_2();
    }

    id v4 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generatePhoneTokenWithNonce:(id)a3 keyBlob:(id)a4 pairingID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient generatePhoneTokenWithNonce:keyBlob:pairingID:completion:]();
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke;
  v20[3] = &unk_264228CB8;
  id v15 = v10;
  id v21 = v15;
  id v16 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2;
  v18[3] = &unk_264229330;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 generatePhoneTokenWithNonce:v13 keyBlob:v12 pairingID:v11 completion:v18];
}

uint64_t __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_3();
    }
  }
  else
  {
    if (v8) {
      __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_2();
    }

    id v7 = DC_LOG_MILESTONE_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generatePrearmTrustCertificateWithNonce:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient generatePrearmTrustCertificateWithNonce:pairingID:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2;
  v15[3] = &unk_264229358;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 generatePrearmTrustCertificateWithNonce:v10 pairingID:v9 completion:v15];
}

uint64_t __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)migratePrearmTrustBlob:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient migratePrearmTrustBlob:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2;
  v12[3] = &unk_264228CE0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 migratePrearmTrustBlob:v7 completion:v12];
}

uint64_t __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialAuthenticationTokenStatus:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient credentialAuthenticationTokenStatus:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2;
  v9[3] = &unk_264229380;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 credentialAuthenticationTokenStatus:v9];
}

uint64_t __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_2();
    }
  }
  else if (v6)
  {
    __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getCASDCertificate:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient getCASDCertificate:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__DCBiometricStoreClient_getCASDCertificate___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2;
  v9[3] = &unk_264228CE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getCASDCertificate:v9];
}

uint64_t __45__DCBiometricStoreClient_getCASDCertificate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getGlobalProgenitorKeyAttestation:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient getGlobalProgenitorKeyAttestation:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2;
  v9[3] = &unk_264229308;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getGlobalProgenitorKeyAttestation:v9];
}

uint64_t __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient getGlobalThirdPartyProgenitorKeyAttestation:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2;
  v9[3] = &unk_264229308;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getGlobalThirdPartyProgenitorKeyAttestation:v9];
}

uint64_t __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)boundAppletPresentmentACL:(id)a3
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient boundAppletPresentmentACL:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2;
  v9[3] = &unk_264228CE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 boundAppletPresentmentACL:v9];
}

uint64_t __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_1();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(id)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient refreshProgenitorKeyDesignationsWithSessionHandoffToken:onlyIfNeeded:completion:]();
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke;
  v16[3] = &unk_264228CB8;
  id v11 = v8;
  id v17 = v11;
  id v12 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2;
  v14[3] = &unk_264228C90;
  void v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 refreshProgenitorKeyDesignationsWithSessionHandoffToken:v9 onlyIfNeeded:v5 completion:v14];
}

uint64_t __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_1();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_2();
    }
  }
  else if (v5)
  {
    __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCBiometricStoreClient clearProgenitorKeyDesignationsWithCompletion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke;
  v11[3] = &unk_264228CB8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(DCBiometricStoreClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2;
  v9[3] = &unk_264228C90;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 clearProgenitorKeyDesignationsWithCompletion:v9];
}

uint64_t __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_1();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_2();
    }
  }
  else if (v5)
  {
    __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient invalidate", v2, v3, v4, v5, v6);
}

- (id)createDaemonDisconnectedError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"DCBiometricStore" code:-5001 userInfo:0];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DCBiometricStoreClient *)self serverConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_264228C90;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_1();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) createDaemonDisconnectedError];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient init called", v2, v3, v4, v5, v6);
}

- (void)bioBindingUnboundACL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient bioBindingUnboundACL", v2, v3, v4, v5, v6);
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient bioBindingUnboundACL returned successfully", v2, v3, v4, v5, v6);
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient bioBindingUnboundACL returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)passcodeBindingUnboundACL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient passcodeBindingUnboundACL", v2, v3, v4, v5, v6);
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient passcodeBindingUnboundACL returned successfully", v2, v3, v4, v5, v6);
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient passcodeBindingUnboundACL returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)setGlobalAuthACL:ofType:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient setGlobalAuthACL", v2, v3, v4, v5, v6);
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient setGlobalAuthACL returned successfully", v2, v3, v4, v5, v6);
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient setGlobalAuthACL returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)setModifiedGlobalAuthACL:externalizedLAContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient setModifiedGlobalAuthACL", v2, v3, v4, v5, v6);
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient setModifiedGlobalAuthACL returned successfully", v2, v3, v4, v5, v6);
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient setModifiedGlobalAuthACL returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)globalAuthACLWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient globalAuthACLWithCompletion", v2, v3, v4, v5, v6);
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient globalAuthACLWithCompletion returned successfully", v2, v3, v4, v5, v6);
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient globalAuthACLWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)deleteGlobalAuthACLWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient deleteGlobalAuthACLWithCompletion", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient deleteGlobalAuthACLWithCompletion returned successfully", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient deleteGlobalAuthACLWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion", v2, v3, v4, v5, v6);
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion returned successfully", v2, v3, v4, v5, v6);
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)nonceForAuthorizationTokenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion", v2, v3, v4, v5, v6);
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion returned successfully", v2, v3, v4, v5, v6);
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)prearmCredentialWithAuthorizationToken:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient prearmCredentialWithAuthorizationToken", v2, v3, v4, v5, v6);
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient prearmCredentialWithAuthorizationToken returned successfully", v2, v3, v4, v5, v6);
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient prearmCredentialWithAuthorizationToken returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)establishPrearmTrustV2:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient establishPrearmTrustV2", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient establishPrearmTrustV2 returned successfully", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient establishPrearmTrustV2 returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)revokeCredentialAuthorizationToken:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient revokeCredentialAuthorizationToken", v2, v3, v4, v5, v6);
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient revokeCredentialAuthorizationToken returned successfully", v2, v3, v4, v5, v6);
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient revokeCredentialAuthorizationToken returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generatePhoneTokenWithNonce:keyBlob:pairingID:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient generatePhoneTokenWithNonce", v2, v3, v4, v5, v6);
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient generatePhoneTokenWithNonce returned successfully", v2, v3, v4, v5, v6);
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient generatePhoneTokenWithNonce returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generatePrearmTrustCertificateWithNonce:pairingID:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient generatePrearmTrustCertificateForWatchWithNonce", v2, v3, v4, v5, v6);
}

void __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient generatePrearmTrustCertificateForWatchWithNonce returned successfully", v2, v3, v4, v5, v6);
}

void __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient generatePrearmTrustCertificateForWatchWithNonce returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)migratePrearmTrustBlob:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient migratePrearmTrustBlob", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient migratePrearmTrustBlob returned successfully", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient migratePrearmTrustBlob returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)credentialAuthenticationTokenStatus:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient credentialAuthenticationTokenStatus", v2, v3, v4, v5, v6);
}

void __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient credentialAuthenticationTokenStatus returned successfully", v2, v3, v4, v5, v6);
}

void __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient credentialAuthenticationTokenStatus returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)getCASDCertificate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
}

void __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
}

void __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_214B14000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
}

- (void)getGlobalProgenitorKeyAttestation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
}

void __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
}

void __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_214B14000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
}

void __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
}

void __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_214B14000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
}

- (void)boundAppletPresentmentACL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
}

void __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_214B14000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
}

void __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_214B14000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:onlyIfNeeded:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient refreshProgenitorKeyDesignations", v2, v3, v4, v5, v6);
}

void __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient refreshProgenitorKeyDesignations returned successfully", v2, v3, v4, v5, v6);
}

void __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient refreshProgenitorKeyDesignations returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)clearProgenitorKeyDesignationsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient clearProgenitorKeyDesignations", v2, v3, v4, v5, v6);
}

void __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCBiometricStoreClient clearProgenitorKeyDesignations returned successfully", v2, v3, v4, v5, v6);
}

void __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCBiometricStoreClient clearProgenitorKeyDesignations returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_214B14000, v0, OS_LOG_TYPE_ERROR, "DCBiometricStoreClient remote object proxy error: %{public}@", v1, 0xCu);
}

@end
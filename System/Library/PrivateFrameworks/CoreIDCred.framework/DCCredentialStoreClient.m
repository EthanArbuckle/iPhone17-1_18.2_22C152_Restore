@interface DCCredentialStoreClient
- (DCCredentialStoreClient)init;
- (NSXPCConnection)serverConnection;
- (id)createDaemonDisconnectedError;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)activeRegionsInPartitions:(id)a3 docType:(id)a4 completion:(id)a5;
- (void)allElementsOfCredential:(id)a3 authData:(id)a4 completion:(id)a5;
- (void)associateExternalPresentmentKeyWithCredential:(id)a3 publicKeyIdentifier:(id)a4 completion:(id)a5;
- (void)authorizeDeviceKeySigningKeyOfCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5;
- (void)authorizeRemoteKeySigningKeyWithCredential:(id)a3 remoteKey:(id)a4 completion:(id)a5;
- (void)checkCompletenessOfCredential:(id)a3 completion:(id)a4;
- (void)clearPresentmentKeyUsageForCredential:(id)a3 completion:(id)a4;
- (void)configureWithPartitions:(id)a3 completion:(id)a4;
- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5;
- (void)credentialIdentifierForPublicKeyIdentifier:(id)a3 completion:(id)a4;
- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4;
- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 completion:(id)a5;
- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 region:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)deleteCredential:(id)a3 completion:(id)a4;
- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 authData:(id)a5 completion:(id)a6;
- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4;
- (void)generateAccountKeyAuthorizationForCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5;
- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4;
- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4;
- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4;
- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5;
- (void)init;
- (void)invalidate;
- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)keyInfoForCredential:(id)a3 completion:(id)a4;
- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3;
- (void)payloadAuthACLForCredential:(id)a3 completion:(id)a4;
- (void)payloadsOfCredential:(id)a3 completion:(id)a4;
- (void)propertiesOfCredential:(id)a3 completion:(id)a4;
- (void)replacePayloadOfCredential:(id)a3 withPayload:(id)a4 format:(unint64_t)a5 completion:(id)a6;
- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)setServerConnection:(id)a3;
- (void)setStateOfCredential:(id)a3 to:(unint64_t)a4 completion:(id)a5;
@end

@implementation DCCredentialStoreClient

- (DCCredentialStoreClient)init
{
  v3 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient init]();
  }

  v65.receiver = self;
  v65.super_class = (Class)DCCredentialStoreClient;
  v4 = [(DCCredentialStoreClient *)&v65 init];
  if (v4)
  {
    v5 = DC_LOG_CLIENT_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DCCredentialStoreClient init](v5);
    }

    v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.idcredd.storage.xpc" options:4096];
    [(DCCredentialStoreClient *)v4 setServerConnection:v6];

    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5A2CB8];
    v8 = [(DCCredentialStoreClient *)v4 serverConnection];
    [v8 setRemoteObjectInterface:v7];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [(DCCredentialStoreClient *)v4 serverConnection];
    v13 = [v12 remoteObjectInterface];
    [v13 setClasses:v11 forSelector:sel_payloadsOfCredential_completion_ argumentIndex:0 ofReply:1];

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);

    v22 = [(DCCredentialStoreClient *)v4 serverConnection];
    v23 = [v22 remoteObjectInterface];
    [v23 setClasses:v21 forSelector:sel_elementsOfCredential_elementIdentifiers_authData_completion_ argumentIndex:0 ofReply:1];

    v24 = [(DCCredentialStoreClient *)v4 serverConnection];
    v25 = [v24 remoteObjectInterface];
    [v25 setClasses:v21 forSelector:sel_allElementsOfCredential_authData_completion_ argumentIndex:0 ofReply:1];

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);

    v32 = [(DCCredentialStoreClient *)v4 serverConnection];
    v33 = [v32 remoteObjectInterface];
    [v33 setClasses:v31 forSelector:sel_generateKeySigningKeyForCredential_completion_ argumentIndex:0 ofReply:1];

    v34 = [(DCCredentialStoreClient *)v4 serverConnection];
    v35 = [v34 remoteObjectInterface];
    [v35 setClasses:v31 forSelector:sel_generateDeviceEncryptionKeyForCredential_completion_ argumentIndex:0 ofReply:1];

    v36 = [(DCCredentialStoreClient *)v4 serverConnection];
    v37 = [v36 remoteObjectInterface];
    [v37 setClasses:v31 forSelector:sel_generatePresentmentKeyForCredential_completion_ argumentIndex:0 ofReply:1];

    v38 = [(DCCredentialStoreClient *)v4 serverConnection];
    v39 = [v38 remoteObjectInterface];
    [v39 setClasses:v31 forSelector:sel_generatePresentmentKeysForCredential_numKeys_completion_ argumentIndex:0 ofReply:1];

    v40 = [(DCCredentialStoreClient *)v4 serverConnection];
    v41 = [v40 remoteObjectInterface];
    [v41 setClasses:v31 forSelector:sel_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion_ argumentIndex:0 ofReply:1];

    v42 = [(DCCredentialStoreClient *)v4 serverConnection];
    v43 = [v42 remoteObjectInterface];
    [v43 setClasses:v31 forSelector:sel_createAccountKeySigningKeyForAccountKeyIdentifier_completion_ argumentIndex:0 ofReply:1];

    v44 = [(DCCredentialStoreClient *)v4 serverConnection];
    v45 = [v44 remoteObjectInterface];
    [v45 setClasses:v31 forSelector:sel_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion_ argumentIndex:0 ofReply:1];

    v46 = [(DCCredentialStoreClient *)v4 serverConnection];
    v47 = [v46 remoteObjectInterface];
    [v47 setClasses:v31 forSelector:sel_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion_ argumentIndex:0 ofReply:1];

    v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v48, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);

    v53 = [(DCCredentialStoreClient *)v4 serverConnection];
    v54 = [v53 remoteObjectInterface];
    [v54 setClasses:v52 forSelector:sel_occupiedLegacySEKeySlotsWithCompletion_ argumentIndex:0 ofReply:1];

    v55 = (void *)MEMORY[0x263EFFA08];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    v60 = objc_msgSend(v55, "setWithObjects:", v56, v57, v58, v59, objc_opt_class(), 0);

    v61 = [(DCCredentialStoreClient *)v4 serverConnection];
    v62 = [v61 remoteObjectInterface];
    [v62 setClasses:v60 forSelector:sel_keyInfoForCredential_completion_ argumentIndex:0 ofReply:1];

    v63 = [(DCCredentialStoreClient *)v4 serverConnection];
    [v63 activate];
  }
  return v4;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient dealloc called", v2, v3, v4, v5, v6);
}

- (void)configureWithPartitions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient configureWithPartitions:completion:]();
  }

  v9 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke;
  v11[3] = &unk_264228C90;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 configureWithPartitions:v7 completion:v11];
}

void __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient createCredentialInPartition:options:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v8;
  id v18 = v12;
  v13 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2;
  v15[3] = &unk_264229130;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 createCredentialInPartition:v10 options:v9 completion:v15];
}

uint64_t __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient generateKeySigningKeyForCredential:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2;
  v12[3] = &unk_264229158;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 generateKeySigningKeyForCredential:v7 completion:v12];
}

uint64_t __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2;
  v12[3] = &unk_264229180;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 isAccountKeySigningKeyAvailableForAccountKeyIdentifier:v7 completion:v12];
}

uint64_t __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v6)
  {
    __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient createAccountKeySigningKeyForAccountKeyIdentifier:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2;
  v12[3] = &unk_264229158;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 createAccountKeySigningKeyForAccountKeyIdentifier:v7 completion:v12];
}

uint64_t __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2;
  v12[3] = &unk_264228C90;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 deleteAccountKeySigningKeyForAccountKeyIdentifier:v7 completion:v12];
}

uint64_t __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v5)
  {
    __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2;
  v12[3] = &unk_264229158;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 retrieveAccountKeySigningKeyForAccountKeyIdentifier:v7 completion:v12];
}

uint64_t __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient generateDeviceEncryptionKeyForCredential:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2;
  v12[3] = &unk_264229158;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 generateDeviceEncryptionKeyForCredential:v7 completion:v12];
}

uint64_t __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateAccountKeyAuthorizationForCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke;
  v16[3] = &unk_264228CB8;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2;
  v14[3] = &unk_2642291A8;
  void v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 generateAccountKeyAuthorizationForCredential:v11 accountKeyIdentifier:v10 completion:v14];
}

uint64_t __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = DC_LOG_CLIENT_0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v11) {
      __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v11)
  {
    __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient generatePresentmentKeyForCredential:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2;
  v12[3] = &unk_264229158;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 generatePresentmentKeyForCredential:v7 completion:v12];
}

uint64_t __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient generatePresentmentKeysForCredential:numKeys:completion:]();
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke;
  v16[3] = &unk_264228CB8;
  id v11 = v8;
  id v17 = v11;
  id v12 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2;
  v14[3] = &unk_264228D08;
  void v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 generatePresentmentKeysForCredential:v9 numKeys:a4 completion:v14];
}

uint64_t __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)authorizeDeviceKeySigningKeyOfCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential:accountKeyIdentifier:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2;
  v15[3] = &unk_264228CE0;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 authorizeDeviceKeySigningKeyOfCredential:v10 accountKeyIdentifier:v9 completion:v15];
}

uint64_t __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)authorizeRemoteKeySigningKeyWithCredential:(id)a3 remoteKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential:remoteKey:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2;
  v15[3] = &unk_264228CE0;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 authorizeRemoteKeySigningKeyWithCredential:v10 remoteKey:v9 completion:v15];
}

uint64_t __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)associateExternalPresentmentKeyWithCredential:(id)a3 publicKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient associateExternalPresentmentKeyWithCredential:publicKeyIdentifier:completion:]();
  }

  id v12 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_264228C90;
  void v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v12 associateExternalPresentmentKeyWithCredential:v10 publicKeyIdentifier:v9 completion:v14];
}

void __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialIdentifierForPublicKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2;
  v12[3] = &unk_264229130;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 credentialIdentifierForPublicKeyIdentifier:v7 completion:v12];
}

uint64_t __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)replacePayloadOfCredential:(id)a3 withPayload:(id)a4 format:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient replacePayloadOfCredential:withPayload:format:completion:]();
  }

  id v14 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke;
  v16[3] = &unk_264228C90;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 replacePayloadOfCredential:v12 withPayload:v11 format:a5 completion:v16];
}

void __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient credentialIdentifiersInPartitions:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2;
  v12[3] = &unk_2642291D0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 credentialIdentifiersInPartitions:v7 completion:v12];
}

uint64_t __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient credentialIdentifiersInPartitions:docType:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2;
  v15[3] = &unk_2642291D0;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 credentialIdentifiersInPartitions:v10 docType:v9 completion:v15];
}

uint64_t __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 region:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient credentialIdentifiersInPartitions:docType:region:completion:]();
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke;
  v20[3] = &unk_264228CB8;
  id v15 = v12;
  id v21 = v15;
  id v16 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2;
  v18[3] = &unk_2642291D0;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 credentialIdentifiersInPartitions:v13 docType:v10 region:v11 completion:v18];
}

uint64_t __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activeRegionsInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient activeRegionsInPartitions:docType:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke;
  v17[3] = &unk_264228CB8;
  id v12 = v9;
  id v18 = v12;
  id v13 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2;
  v15[3] = &unk_2642291F8;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 activeRegionsInPartitions:v10 docType:v8 completion:v15];
}

uint64_t __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient deleteCredential:completion:]();
  }

  id v9 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke;
  v11[3] = &unk_264228C90;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 deleteCredential:v7 completion:v11];
}

void __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient propertiesOfCredential:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2;
  v12[3] = &unk_264229220;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 propertiesOfCredential:v7 completion:v12];
}

uint64_t __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 code];
    id v9 = DC_LOG_CLIENT_0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 == -5015)
    {
      if (v10) {
        __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_2();
      }
    }
    else if (v10)
    {
      __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_3();
    }
  }
  else
  {
    id v9 = DC_LOG_CLIENT_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setStateOfCredential:(id)a3 to:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient setStateOfCredential:to:completion:]();
  }

  id v11 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke;
  v13[3] = &unk_264228C90;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 setStateOfCredential:v9 to:a4 completion:v13];
}

void __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)payloadAuthACLForCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient payloadAuthACLForCredential:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  BOOL v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2;
  v12[3] = &unk_264228CE0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 payloadAuthACLForCredential:v7 completion:v12];
}

uint64_t __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 authData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData:completion:]();
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke;
  v20[3] = &unk_264228CB8;
  id v15 = v10;
  id v21 = v15;
  id v16 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2;
  v18[3] = &unk_2642291D0;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 elementsOfCredential:v13 elementIdentifiers:v12 authData:v11 completion:v18];
}

uint64_t __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkCompletenessOfCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStoreClient checkCompletenessOfCredential:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2;
  v12[3] = &unk_264229248;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 checkCompletenessOfCredential:v7 completion:v12];
}

uint64_t __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = DC_LOG_CLIENT_0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v6)
  {
    __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient invalidate", v2, v3, v4, v5, v6);
}

- (void)payloadsOfCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke;
  v13[3] = &unk_264228CB8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2;
  v11[3] = &unk_264228D08;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 payloadsOfCredential:v8 completion:v11];
}

uint64_t __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)allElementsOfCredential:(id)a3 authData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke;
  v16[3] = &unk_264228CB8;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2;
  v14[3] = &unk_2642291D0;
  void v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 allElementsOfCredential:v11 authData:v10 completion:v14];
}

uint64_t __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke;
  v10[3] = &unk_264228CB8;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2;
  v8[3] = &unk_264228D08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 occupiedLegacySEKeySlotsWithCompletion:v8];
}

uint64_t __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke;
  v9[3] = &unk_264228C90;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 eraseLegacySEKeySlot:a3 completion:v9];
}

void __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearPresentmentKeyUsageForCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke;
  v10[3] = &unk_264228C90;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 clearPresentmentKeyUsageForCredential:v7 completion:v10];
}

void __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)keyInfoForCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke;
  v13[3] = &unk_264228CB8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(DCCredentialStoreClient *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2;
  v11[3] = &unk_264228D08;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 keyInfoForCredential:v8 completion:v11];
}

uint64_t __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)createDaemonDisconnectedError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"DCCredentialStore" code:-5001 userInfo:0];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DCCredentialStoreClient *)self serverConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_264228C90;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
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
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient init called", v2, v3, v4, v5, v6);
}

- (void)configureWithPartitions:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient configure", v2, v3, v4, v5, v6);
}

void __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient configureWithPartitions returned successfully", v2, v3, v4, v5, v6);
}

void __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient configureWithPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)createCredentialInPartition:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient createCredential", v2, v3, v4, v5, v6);
}

void __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient createCredentialInPartition returned successfully", v2, v3, v4, v5, v6);
}

void __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient createCredentialInPartition returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generateKeySigningKeyForCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateKeySigningKeyForCredential", v2, v3, v4, v5, v6);
}

void __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateKeySigningKeyForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateKeySigningKeyForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
}

void __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient createAccountKeySigningKeyForLabel", v2, v3, v4, v5, v6);
}

void __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient createAccountKeySigningKeyForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
}

void __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient createAccountKeySigningKeyForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
}

void __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
}

void __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generateDeviceEncryptionKeyForCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateDeviceEncryptionKeyForCredential", v2, v3, v4, v5, v6);
}

void __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateDeviceEncryptionKeyForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateDeviceEncryptionKeyForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateAccountKeyAuthorizationForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient generateAccountKeyAuthorizationForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generatePresentmentKeyForCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generatePresentmentKeyForCredential", v2, v3, v4, v5, v6);
}

void __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generatePresentmentKeyForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient generatePresentmentKeyForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generatePresentmentKeysForCredential:numKeys:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generatePresentmentKeysForCredential", v2, v3, v4, v5, v6);
}

void __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient generatePresentmentKeysForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient generatePresentmentKeysForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)authorizeDeviceKeySigningKeyOfCredential:accountKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential", v2, v3, v4, v5, v6);
}

void __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)authorizeRemoteKeySigningKeyWithCredential:remoteKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential", v2, v3, v4, v5, v6);
}

void __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential returned successfully", v2, v3, v4, v5, v6);
}

void __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)associateExternalPresentmentKeyWithCredential:publicKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient associateExternalPresentmentKeyWithCredential", v2, v3, v4, v5, v6);
}

void __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient associateExternalPresentmentKeyWithCredential returned successfully", v2, v3, v4, v5, v6);
}

void __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient associateExternalPresentmentKeyWithCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)credentialIdentifierForPublicKeyIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier", v2, v3, v4, v5, v6);
}

void __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
}

void __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)replacePayloadOfCredential:withPayload:format:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient replacePayloadOfCredential", v2, v3, v4, v5, v6);
}

void __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient replacePayloadOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient replacePayloadOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)credentialIdentifiersInPartitions:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitions", v2, v3, v4, v5, v6);
}

void __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitions returned successfully", v2, v3, v4, v5, v6);
}

void __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)credentialIdentifiersInPartitions:docType:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocType", v2, v3, v4, v5, v6);
}

void __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocType returned successfully", v2, v3, v4, v5, v6);
}

void __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocType returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)credentialIdentifiersInPartitions:docType:region:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_214B14000, v1, OS_LOG_TYPE_DEBUG, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocTypeRegion docType %@ region %@", v2, 0x16u);
}

void __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocTypeRegion returned successfully", v2, v3, v4, v5, v6);
}

void __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocTypeRegion returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)activeRegionsInPartitions:docType:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient activeRegionsInPartitions docType %@", v2, v3, v4, v5, v6);
}

void __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient activeRegionsInPartitions returned successfully", v2, v3, v4, v5, v6);
}

void __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient activeRegionsInPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)deleteCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient deleteCredential", v2, v3, v4, v5, v6);
}

void __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient deleteCredential returned successfully", v2, v3, v4, v5, v6);
}

void __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient deleteCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)propertiesOfCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient propertiesOfCredential", v2, v3, v4, v5, v6);
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient propertiesOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient propertiesOfCredential returned with error: unknown credential", v2, v3, v4, v5, v6);
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient propertiesOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)setStateOfCredential:to:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient setStateOfCredential", v2, v3, v4, v5, v6);
}

void __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient setStateOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient setStateOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)payloadAuthACLForCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient payloadAuthACLForCredential", v2, v3, v4, v5, v6);
}

void __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient payloadAuthACLForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient payloadAuthACLForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)elementsOfCredential:elementIdentifiers:authData:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData:", v2, v3, v4, v5, v6);
}

void __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData: returned successfully", v2, v3, v4, v5, v6);
}

void __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData: returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)checkCompletenessOfCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient checkCompletenessOfCredential", v2, v3, v4, v5, v6);
}

void __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient checkCompletenessOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient checkCompletenessOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient payloadsOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient payloadsOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient allElementsOfCredential returned successfully", v2, v3, v4, v5, v6);
}

void __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient allElementsOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient occupiedLegacySEKeySlotsWithCompletion returned successfully", v2, v3, v4, v5, v6);
}

void __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient occupiedLegacySEKeySlotsWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient eraseLegacySEKeySlot returned successfully", v2, v3, v4, v5, v6);
}

void __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient eraseLegacySEKeySlot returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient clearPresentmentKeyUsageForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient clearPresentmentKeyUsageForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient keyInfoForCredential returned successfully", v2, v3, v4, v5, v6);
}

void __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCCredentialStoreClient keyInfoForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_214B14000, v0, OS_LOG_TYPE_ERROR, "DCCredentialStoreClient remote object proxy error: %{public}@", v1, 0xCu);
}

@end
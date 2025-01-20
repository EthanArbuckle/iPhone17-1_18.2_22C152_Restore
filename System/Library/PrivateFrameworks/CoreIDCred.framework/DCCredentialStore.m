@interface DCCredentialStore
- (BOOL)hasBeenConfigured;
- (DCCredentialStore)initWithPartitions:(id)a3;
- (DCCredentialStoreClient)client;
- (NSArray)partitions;
- (void)activeRegionsInPartitions:(id)a3 docType:(id)a4 completion:(id)a5;
- (void)allElementsOfCredential:(id)a3 authData:(id)a4 completion:(id)a5;
- (void)allElementsOfCredential:(id)a3 completion:(id)a4;
- (void)associateExternalPresentmentKeyWithCredential:(id)a3 publicKeyIdentifier:(id)a4 completion:(id)a5;
- (void)authorizeDeviceKeySigningKeyOfCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5;
- (void)authorizeRemoteKeySigningKeyWithCredential:(id)a3 remoteKey:(id)a4 completion:(id)a5;
- (void)checkCompletenessOfCredential:(id)a3 completion:(id)a4;
- (void)clearPresentmentKeyUsageForCredential:(id)a3 completion:(id)a4;
- (void)configureIfNeededWithContinuation:(id)a3 errorHandler:(id)a4;
- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5;
- (void)credentialIdentifierForPublicKeyIdentifier:(id)a3 completion:(id)a4;
- (void)credentialIdentifiers:(id)a3;
- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4;
- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 completion:(id)a5;
- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 region:(id)a5 completion:(id)a6;
- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)deleteCredential:(id)a3 completion:(id)a4;
- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 authData:(id)a5 completion:(id)a6;
- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 completion:(id)a5;
- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4;
- (void)finishConfiguration;
- (void)generateAccountKeyAuthorizationForCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5;
- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4;
- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4;
- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4;
- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5;
- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)keyInfoForCredential:(id)a3 completion:(id)a4;
- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3;
- (void)payloadAuthACLForCredential:(id)a3 completion:(id)a4;
- (void)payloadsOfCredential:(id)a3 completion:(id)a4;
- (void)propertiesOfCredential:(id)a3 completion:(id)a4;
- (void)replacePayloadOfCredential:(id)a3 withPayload:(id)a4 format:(unint64_t)a5 completion:(id)a6;
- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)setHasBeenConfigured:(BOOL)a3;
- (void)setStateOfCredential:(id)a3 to:(unint64_t)a4 completion:(id)a5;
@end

@implementation DCCredentialStore

- (DCCredentialStore)initWithPartitions:(id)a3
{
  id v4 = a3;
  v5 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStore initWithPartitions:]();
  }

  v12.receiver = self;
  v12.super_class = (Class)DCCredentialStore;
  v6 = [(DCCredentialStore *)&v12 init];
  v6->_lock._os_unfair_lock_opaque = 0;
  v7 = objc_alloc_init(DCCredentialStoreClient);
  client = v6->_client;
  v6->_client = v7;

  uint64_t v9 = [v4 copy];
  partitions = v6->_partitions;
  v6->_partitions = (NSArray *)v9;

  v6->_hasBeenConfigured = 0;
  return v6;
}

- (void)configureIfNeededWithContinuation:(id)a3 errorHandler:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  if ([(DCCredentialStore *)self hasBeenConfigured])
  {
LABEL_9:
    v6[2](v6);
    goto LABEL_10;
  }
  v8 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:]();
  }

  if (!self->_client)
  {
    v11 = DC_LOG_CLIENT_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:]();
    }

    goto LABEL_9;
  }
  uint64_t v9 = [(DCCredentialStore *)self client];
  v10 = [(DCCredentialStore *)self partitions];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke;
  v12[3] = &unk_2642293B0;
  v12[4] = self;
  id v13 = v7;
  v14 = v6;
  [v9 configureWithPartitions:v10 completion:v12];

LABEL_10:
}

void __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT_2();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(v3, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5) {
      __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) finishConfiguration];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)finishConfiguration
{
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_3;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 createCredentialInPartition:*(void *)(a1 + 40) options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_4;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 generateKeySigningKeyForCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_5;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 isAccountKeySigningKeyAvailableForAccountKeyIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_6;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 retrieveAccountKeySigningKeyForAccountKeyIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_7;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 createAccountKeySigningKeyForAccountKeyIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_8;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 deleteAccountKeySigningKeyForAccountKeyIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateAccountKeyAuthorizationForCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_9;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 generateAccountKeyAuthorizationForCredential:*(void *)(a1 + 40) accountKeyIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_10;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 generateDeviceEncryptionKeyForCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_11;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 generatePresentmentKeyForCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke;
  v14[3] = &unk_264229428;
  void v14[4] = self;
  id v15 = v8;
  int64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_12;
  v12[3] = &unk_264228CB8;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v14 errorHandler:v12];
}

void __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 generatePresentmentKeysForCredential:*(void *)(a1 + 40) numKeys:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authorizeDeviceKeySigningKeyOfCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_13;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 authorizeDeviceKeySigningKeyOfCredential:*(void *)(a1 + 40) accountKeyIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authorizeRemoteKeySigningKeyWithCredential:(id)a3 remoteKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_14;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 authorizeRemoteKeySigningKeyWithCredential:*(void *)(a1 + 40) remoteKey:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)associateExternalPresentmentKeyWithCredential:(id)a3 publicKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_15;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 associateExternalPresentmentKeyWithCredential:*(void *)(a1 + 40) publicKeyIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialIdentifierForPublicKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_16;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 credentialIdentifierForPublicKeyIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)replacePayloadOfCredential:(id)a3 withPayload:(id)a4 format:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke;
  v18[3] = &unk_264229450;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  unint64_t v22 = a5;
  id v21 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_17;
  v16[3] = &unk_264228CB8;
  id v17 = v21;
  id v13 = v21;
  id v14 = v11;
  id v15 = v10;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v18 errorHandler:v16];
}

void __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 replacePayloadOfCredential:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48) format:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

uint64_t __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setStateOfCredential:(id)a3 to:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke;
  v14[3] = &unk_264229428;
  void v14[4] = self;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_18;
  v12[3] = &unk_264228CB8;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v14 errorHandler:v12];
}

void __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 setStateOfCredential:*(void *)(a1 + 40) to:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_19;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 credentialIdentifiersInPartitions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_20;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 credentialIdentifiersInPartitions:*(void *)(a1 + 40) docType:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 region:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke;
  v20[3] = &unk_264229478;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_21;
  v18[3] = &unk_264228CB8;
  id v19 = v24;
  id v14 = v24;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v20 errorHandler:v18];
}

void __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 credentialIdentifiersInPartitions:*(void *)(a1 + 40) docType:*(void *)(a1 + 48) region:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activeRegionsInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_22;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 activeRegionsInPartitions:*(void *)(a1 + 40) docType:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(DCCredentialStore *)self partitions];
  [(DCCredentialStore *)self credentialIdentifiersInPartitions:v5 completion:v4];
}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__DCCredentialStore_deleteCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__DCCredentialStore_deleteCredential_completion___block_invoke_23;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __49__DCCredentialStore_deleteCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__DCCredentialStore_deleteCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 deleteCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __49__DCCredentialStore_deleteCredential_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_24;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 propertiesOfCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)payloadAuthACLForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_25;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 payloadAuthACLForCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 completion:(id)a5
{
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 authData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke;
  v20[3] = &unk_264229478;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_26;
  v18[3] = &unk_264228CB8;
  id v19 = v24;
  id v14 = v24;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v20 errorHandler:v18];
}

void __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 elementsOfCredential:*(void *)(a1 + 40) elementIdentifiers:*(void *)(a1 + 48) authData:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkCompletenessOfCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_27;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 checkCompletenessOfCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasBeenConfigured
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasBeenConfigured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenConfigured:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasBeenConfigured = a3;

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialStoreClient)client
{
  return self->_client;
}

- (NSArray)partitions
{
  return self->_partitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partitions, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)payloadsOfCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_214;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 payloadsOfCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allElementsOfCredential:(id)a3 completion:(id)a4
{
}

- (void)allElementsOfCredential:(id)a3 authData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke;
  v16[3] = &unk_2642293D8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_215;
  v14[3] = &unk_264228CB8;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v16 errorHandler:v14];
}

void __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 allElementsOfCredential:*(void *)(a1 + 40) authData:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_215(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke;
  v8[3] = &unk_2642294A0;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_216;
  v6[3] = &unk_264228CB8;
  id v7 = v9;
  id v5 = v9;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v8 errorHandler:v6];
}

void __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 occupiedLegacySEKeySlotsWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_216(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke;
  v10[3] = &unk_2642294C8;
  void v10[4] = self;
  int64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_217;
  v8[3] = &unk_264228CB8;
  id v9 = v11;
  id v7 = v11;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v10 errorHandler:v8];
}

void __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 eraseLegacySEKeySlot:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_217(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearPresentmentKeyUsageForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_218;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 clearPresentmentKeyUsageForCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)keyInfoForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke;
  v12[3] = &unk_264229400;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_219;
  v10[3] = &unk_264228CB8;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(DCCredentialStore *)self configureIfNeededWithContinuation:v12 errorHandler:v10];
}

void __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 keyInfoForCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_219(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initWithPartitions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore init called", v2, v3, v4, v5, v6);
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore configureIfNeeded no client set", v2, v3, v4, v5, v6);
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore configure needed", v2, v3, v4, v5, v6);
}

void __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore configure completed successfully", v2, v3, v4, v5, v6);
}

void __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_214B14000, a2, OS_LOG_TYPE_DEBUG, "DCCredentialStore configure return error %{error}@", (uint8_t *)&v4, 0xCu);
}

void __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore createCredential", v2, v3, v4, v5, v6);
}

void __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore generateKeySigningKeyForCredential", v2, v3, v4, v5, v6);
}

void __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore isAccountKeySigningKeyAvailableForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore retrieveAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore createAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore deleteAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore generateAccountKeyAuthorizationForCredential", v2, v3, v4, v5, v6);
}

void __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore generateDeviceEncryptionKeyForCredential", v2, v3, v4, v5, v6);
}

void __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore generatePresentmentKeyForCredential", v2, v3, v4, v5, v6);
}

void __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore generatePresentmentKeysForCredential", v2, v3, v4, v5, v6);
}

void __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore authorizeDeviceKeySigningKeyOfCredential", v2, v3, v4, v5, v6);
}

void __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore authorizeRemoteKeySigningKeyWithCredential", v2, v3, v4, v5, v6);
}

void __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore associateExternalPresentmentKeyWithCredential", v2, v3, v4, v5, v6);
}

void __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore credentialIdentifierForPublicKeyIdentifier", v2, v3, v4, v5, v6);
}

void __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore replacePayloadOfCredential", v2, v3, v4, v5, v6);
}

void __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore setStateofCredential", v2, v3, v4, v5, v6);
}

void __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore credentialIdentifiersInPartitions", v2, v3, v4, v5, v6);
}

void __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore credentialIdentifiersInPartitionsDocType", v2, v3, v4, v5, v6);
}

void __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore credentialIdentifiersInPartitionsDocTypeRegion", v2, v3, v4, v5, v6);
}

void __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore activeRegionsInPartitions", v2, v3, v4, v5, v6);
}

void __49__DCCredentialStore_deleteCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore deleteCredential", v2, v3, v4, v5, v6);
}

void __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore propertiesOfCredential", v2, v3, v4, v5, v6);
}

void __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore payloadAuthACLForCredential", v2, v3, v4, v5, v6);
}

void __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore elementsOfCredential", v2, v3, v4, v5, v6);
}

void __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore checkCompletenessOfCredential", v2, v3, v4, v5, v6);
}

void __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore payloadsOfCredential", v2, v3, v4, v5, v6);
}

void __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore allElementsOfCredential:", v2, v3, v4, v5, v6);
}

void __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore occupiedLegacySEKeySlotsWithCompletion", v2, v3, v4, v5, v6);
}

void __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore eraseLegacySEKeySlot", v2, v3, v4, v5, v6);
}

void __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore clearPresentmentKeyUsageForCredential", v2, v3, v4, v5, v6);
}

void __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStore keyInfoForCredential", v2, v3, v4, v5, v6);
}

@end
@interface CDPDPCSController
- (BOOL)_shoudAllowKeyFetchForService:(id)a3;
- (BOOL)isCloudProtectionEnabledLocally:(id *)a3;
- (BOOL)isCompanionInKeychainCircle:(id *)a3;
- (CDPContext)context;
- (CDPDPCSController)init;
- (CDPDPCSController)initWithContext:(id)a3 pcsProxy:(id)a4;
- (CDPProtectedCloudStorageProxy)pcsProxy;
- (_PCSIdentitySetData)_getOrSetupIdentitySetRef:(id *)a3;
- (id)_contextSetupDictionary;
- (id)_edpContextSetupDictionary;
- (id)_fetchKeyForPCSIdentityRef:(_PCSIdentityData *)a3;
- (id)pcsKeysForService:(id)a3 error:(id *)a4;
- (void)_checkiCDPStatusNetwork:(BOOL)a3 withCompletion:(id)a4;
- (void)_enableCDPWithCompletion:(id)a3;
- (void)_reauthenticateAndCheckiCDPStatusWithNetwork:(BOOL)a3 completion:(id)a4;
- (void)_renewCredentialsWithError:(id)a3 completion:(id)a4;
- (void)changePasswordWithCompletion:(id)a3;
- (void)checkiCDPStatusNetwork:(BOOL)a3 withCompletion:(id)a4;
- (void)enableCDPWithCompletion:(id)a3;
- (void)getRecoveryTokenInfo:(id)a3;
- (void)recoverAndSynchronizeKeysWithCompletion:(id)a3;
- (void)recoverKeysWithCompletion:(id)a3;
- (void)repairEDPStateWithCompletion:(id)a3;
- (void)resetProtectedDataShouldJoinCDP:(BOOL)a3 edpOnly:(BOOL)a4 withCompletion:(id)a5;
- (void)setContext:(id)a3;
- (void)setPcsProxy:(id)a3;
- (void)setupEDPIdentitiesWithCompletion:(id)a3;
- (void)validateEDPIdentitiesWithCompletion:(id)a3;
@end

@implementation CDPDPCSController

- (CDPDPCSController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPDPCSController;
  v2 = [(CDPDPCSController *)&v6 init];
  if (v2)
  {
    v3 = (CDPProtectedCloudStorageProxy *)objc_alloc_init(MEMORY[0x263F343D0]);
    pcsProxy = v2->_pcsProxy;
    v2->_pcsProxy = v3;
  }
  return v2;
}

- (CDPDPCSController)initWithContext:(id)a3 pcsProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPDPCSController;
  v9 = [(CDPDPCSController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pcsProxy, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)recoverKeysWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Starting to recover PCS state", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CDPDPCSController_recoverKeysWithCompletion___block_invoke;
  v7[3] = &unk_26432EDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDPCSController *)self checkiCDPStatusNetwork:1 withCompletion:v7];
}

void __47__CDPDPCSController_recoverKeysWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)v6[1];
    id v8 = [v6 _contextSetupDictionary];
    id v12 = 0;
    int v9 = [v7 pcsRestoreLocalBackup:v8 error:&v12];
    id v10 = v12;
  }
  else
  {
    _CDPStateError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    int v9 = 0;
  }
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "PCS State restored %{BOOL}d with error: %@", buf, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)recoverAndSynchronizeKeysWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Starting to synchronize PCS state", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CDPDPCSController_recoverAndSynchronizeKeysWithCompletion___block_invoke;
  v7[3] = &unk_26432EDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDPCSController *)self checkiCDPStatusNetwork:1 withCompletion:v7];
}

void __61__CDPDPCSController_recoverAndSynchronizeKeysWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)v6[1];
    id v8 = [v6 _contextSetupDictionary];
    id v12 = 0;
    int v9 = [v7 pcsSynchronizeKeysWithInfo:v8 error:&v12];
    id v10 = v12;
  }
  else
  {
    _CDPStateError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    int v9 = 0;
  }
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "PCS State synchronized %{BOOL}d with error: %@", buf, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkiCDPStatusNetwork:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v7 = v6;
  id v14 = v7;
  id v8 = _Block_copy(aBlock);
  int v9 = [(CDPContext *)self->_context passwordEquivToken];

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke_2;
    v10[3] = &unk_26432F6A8;
    v10[4] = self;
    BOOL v12 = v4;
    id v11 = v8;
    [(CDPDPCSController *)self _checkiCDPStatusNetwork:v4 withCompletion:v10];
  }
  else
  {
    [(CDPDPCSController *)self _reauthenticateAndCheckiCDPStatusWithNetwork:v4 completion:v8];
  }
}

uint64_t __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 isAuthenticationError]) {
    [*(id *)(a1 + 32) _reauthenticateAndCheckiCDPStatusWithNetwork:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_reauthenticateAndCheckiCDPStatusWithNetwork:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDPCSController _reauthenticateAndCheckiCDPStatusWithNetwork:completion:]();
  }

  context = self->_context;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__CDPDPCSController__reauthenticateAndCheckiCDPStatusWithNetwork_completion___block_invoke;
  v10[3] = &unk_26432F6A8;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(CDPContext *)context reauthenticateUserWithCompletion:v10];
}

uint64_t __77__CDPDPCSController__reauthenticateAndCheckiCDPStatusWithNetwork_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _checkiCDPStatusNetwork:*(unsigned __int8 *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)_checkiCDPStatusNetwork:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, id))a4;
  id v17 = 0;
  id v7 = [(CDPDPCSController *)self _getOrSetupIdentitySetRef:&v17];
  id v8 = v17;
  if (v7)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CDPDPCSController _checkiCDPStatusNetwork:withCompletion:](v4, v9);
    }

    pcsProxy = self->_pcsProxy;
    if (v4)
    {
      id v11 = [(CDPDPCSController *)self _contextSetupDictionary];
      id v16 = 0;
      uint64_t v12 = [(CDPProtectedCloudStorageProxy *)pcsProxy pcsIdentitySetIsInICDPNetwork:v7 options:v11 error:&v16];
      id v13 = v16;
    }
    else
    {
      id v15 = 0;
      uint64_t v12 = [(CDPProtectedCloudStorageProxy *)pcsProxy pcsIdentitySetIsInICDPLocal:v7 error:&v15];
      id v13 = v15;
    }
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController _checkiCDPStatusNetwork:withCompletion:](v12, (uint64_t)v13, v14);
    }

    if (v6) {
      v6[2](v6, v12, v13);
    }
    CFRelease(v7);
  }
  else if (v6)
  {
    v6[2](v6, 0, v8);
  }
}

- (BOOL)isCloudProtectionEnabledLocally:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Checking local iCDP state...", buf, 2u);
  }

  id v6 = [(CDPDPCSController *)self _contextSetupDictionary];
  pcsProxy = self->_pcsProxy;
  id v15 = 0;
  id v8 = (const void *)[(CDPProtectedCloudStorageProxy *)pcsProxy pcsIdentityCreateWithInfo:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (v8)
  {
    id v11 = self->_pcsProxy;
    uint64_t v14 = 0;
    char v12 = [(CDPProtectedCloudStorageProxy *)v11 pcsIdentitySetIsInICDPLocal:v8 error:&v14];
    CFRelease(v8);
  }
  else
  {
    char v12 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v12;
}

- (BOOL)isCompanionInKeychainCircle:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Checking companion circle state...", buf, 2u);
  }

  id v6 = [(CDPDPCSController *)self _contextSetupDictionary];
  pcsProxy = self->_pcsProxy;
  id v15 = 0;
  id v8 = (const void *)[(CDPProtectedCloudStorageProxy *)pcsProxy pcsIdentityCreateWithInfo:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (v8)
  {
    id v11 = self->_pcsProxy;
    uint64_t v14 = 0;
    char v12 = [(CDPProtectedCloudStorageProxy *)v11 pcsIdentitySetCompanionInCircle:v8 error:&v14];
    CFRelease(v8);
  }
  else
  {
    char v12 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v12;
}

- (_PCSIdentitySetData)_getOrSetupIdentitySetRef:(id *)a3
{
  BOOL v4 = [(CDPDPCSController *)self _contextSetupDictionary];
  pcsProxy = self->_pcsProxy;
  id v15 = 0;
  id v6 = (_PCSIdentitySetData *)[(CDPProtectedCloudStorageProxy *)pcsProxy pcsIdentityCreateWithInfo:v4 error:&v15];
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {
    id v9 = v7;
LABEL_6:
    char v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDPCSController _getOrSetupIdentitySetRef:]();
    }
    goto LABEL_8;
  }
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CDPDPCSController _getOrSetupIdentitySetRef:]();
  }

  id v11 = self->_pcsProxy;
  id v14 = v8;
  id v6 = (_PCSIdentitySetData *)[(CDPProtectedCloudStorageProxy *)v11 pcsIdentitySetupWithInfo:v4 error:&v14];
  id v9 = v14;

  if (v6) {
    goto LABEL_6;
  }
  char v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CDPDPCSController _getOrSetupIdentitySetRef:]();
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)enableCDPWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CDPDPCSController_enableCDPWithCompletion___block_invoke;
  v6[3] = &unk_26432EDC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CDPDPCSController *)self _enableCDPWithCompletion:v6];
}

void __45__CDPDPCSController_enableCDPWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 isAuthenticationError])
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_17;
    v10[3] = &unk_26432EDC0;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 40);
    [v8 reauthenticateUserWithCompletion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
    }
  }
}

uint64_t __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_17(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _enableCDPWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)_enableCDPWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, id))a3;
  uint64_t v5 = [(CDPDPCSController *)self _contextSetupDictionary];
  pcsProxy = self->_pcsProxy;
  id v9 = 0;
  uint64_t v7 = [(CDPProtectedCloudStorageProxy *)pcsProxy pcsIdentityMigrateToiCDPWithInfo:v5 error:&v9];
  id v8 = v9;
  if (v4) {
    v4[2](v4, v7, v8);
  }
}

- (id)pcsKeysForService:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Checking PCS identities for service: %@", buf, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v6)
  {
    id v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController pcsKeysForService:error:]();
    }

    if (a4)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = -5003;
LABEL_20:
      objc_msgSend(v18, "cdp_errorWithCode:", v19);
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_21:
    id v16 = 0;
    goto LABEL_27;
  }
  if (![(CDPDPCSController *)self _shoudAllowKeyFetchForService:v6])
  {
    v20 = _CDPLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController pcsKeysForService:error:].cold.5();
    }

    if (a4)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = -5302;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v9 = [(CDPDPCSController *)self _contextSetupDictionary];
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDPCSController pcsKeysForService:error:].cold.4();
  }

  uint64_t v11 = [(CDPProtectedCloudStorageProxy *)self->_pcsProxy pcsIdentityCreateWithInfo:v9 error:a4];
  if (v11)
  {
    char v12 = (const void *)v11;
    uint64_t v25 = *MEMORY[0x263F62200];
    id v26 = v6;
    id v13 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDPCSController pcsKeysForService:error:]();
    }

    id v23 = v8;
    v24 = v13;
    id v15 = v13;
    PCSIdentitySetEnumerateIdentities();
    CFRelease(v12);
  }
  else if (a4)
  {
    v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController pcsKeysForService:error:](a4);
    }

    id v16 = 0;
    goto LABEL_26;
  }
  id v16 = (void *)[v8 copy];
LABEL_26:

LABEL_27:
  return v16;
}

void __45__CDPDPCSController_pcsKeysForService_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _fetchKeyForPCSIdentityRef:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CDPDPCSController_pcsKeysForService_error___block_invoke_cold_1(a1);
  }
}

- (id)_fetchKeyForPCSIdentityRef:(_PCSIdentityData *)a3
{
  _PCSIdentityGetKey();
  v3 = (void *)_PCSKeyCopyExportedPrivateKey();
  id v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (BOOL)_shoudAllowKeyFetchForService:(id)a3
{
  uint64_t v3 = _shoudAllowKeyFetchForService__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_shoudAllowKeyFetchForService__onceToken, &__block_literal_global_1);
  }
  char v5 = [(id)_shoudAllowKeyFetchForService__allowedServices containsObject:v4];

  return v5;
}

uint64_t __51__CDPDPCSController__shoudAllowKeyFetchForService___block_invoke()
{
  _shoudAllowKeyFetchForService__allowedServices = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F62190], *MEMORY[0x263F62198], *MEMORY[0x263F621B8], *MEMORY[0x263F621B0], *MEMORY[0x263F621A8], *MEMORY[0x263F621C8], *MEMORY[0x263F621A0], *MEMORY[0x263F621C0], *MEMORY[0x263F34808], *MEMORY[0x263F34810], 0);
  return MEMORY[0x270F9A758]();
}

- (void)setupEDPIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  p_context = &self->_context;
  uint64_t v6 = [(CDPContext *)self->_context dsid];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [(CDPContext *)*p_context password];
  if (!v8)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [(CDPContext *)*p_context passwordVersion];
  if (!v10)
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = [(CDPContext *)*p_context srpProtocol];
  if (!v12)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v13 = (void *)v12;
  uint64_t v14 = [(CDPContext *)*p_context srpSalt];
  if (!v14)
  {

    goto LABEL_9;
  }
  id v15 = (void *)v14;
  id v16 = [(CDPContext *)*p_context srpIteration];

  if (v16)
  {
    id v17 = [(CDPDPCSController *)self _edpContextSetupDictionary];
    pcsProxy = self->_pcsProxy;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke;
    v21[3] = &unk_26432F720;
    v21[4] = self;
    id v22 = v17;
    id v23 = v4;
    id v19 = v17;
    [(CDPProtectedCloudStorageProxy *)pcsProxy edpPCSGuitarfishSetupIdentities:v19 completion:v21];

LABEL_16:
    goto LABEL_17;
  }
LABEL_12:
  v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CDPDPCSController setupEDPIdentitiesWithCompletion:]();
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7202);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void, id))v4 + 2))(v4, 2, 0, v19);
    goto LABEL_16;
  }
LABEL_17:
}

void __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = a2;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_debug_impl(&dword_218640000, v9, OS_LOG_TYPE_DEBUG, "%@: Setup EDP State: %lu, Error: %@", buf, 0x20u);
  }

  if ([v8 isAuthenticationErrorIncludingUnderlyingErrors])
  {
    uint64_t v10 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_24;
    v14[3] = &unk_26432F6F8;
    v14[4] = v10;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    [v10 _renewCredentialsWithError:v8 completion:v14];
  }
  else
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v7, v8);
    }
  }
}

void __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_24(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_24_cold_1();
    }

    uint64_t v5 = a1[6];
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, void, id))(v5 + 16))(v5, 2, 0, v3);
    }
  }
  else
  {
    [*(id *)(a1[4] + 8) edpPCSGuitarfishSetupIdentities:a1[5] completion:a1[6]];
  }
}

- (void)validateEDPIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDPContext *)self->_context passwordVersion];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(CDPContext *)self->_context dsid];

    if (v7)
    {
      id v8 = [(CDPDPCSController *)self _edpContextSetupDictionary];
      pcsProxy = self->_pcsProxy;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __57__CDPDPCSController_validateEDPIdentitiesWithCompletion___block_invoke;
      v12[3] = &unk_26432F748;
      v12[4] = self;
      id v13 = v8;
      id v14 = v4;
      id v10 = v8;
      [(CDPProtectedCloudStorageProxy *)pcsProxy edpPCSGuitarfishValidateIdentities:v10 completion:v12];

LABEL_8:
      goto LABEL_9;
    }
  }
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CDPDPCSController validateEDPIdentitiesWithCompletion:]();
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7202);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, uint64_t, void, id))v4 + 2))(v4, 2, 1, 0, v10);
    goto LABEL_8;
  }
LABEL_9:
}

void __57__CDPDPCSController_validateEDPIdentitiesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = v15;
    __int16 v21 = 2048;
    uint64_t v22 = a2;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_debug_impl(&dword_218640000, v11, OS_LOG_TYPE_DEBUG, "%@: Validate EDP State: %lu, Error: %@", buf, 0x20u);
  }

  if ([v10 isAuthenticationErrorIncludingUnderlyingErrors])
  {
    uint64_t v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__CDPDPCSController_validateEDPIdentitiesWithCompletion___block_invoke_27;
    v16[3] = &unk_26432F6F8;
    v16[4] = v12;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [v12 _renewCredentialsWithError:v10 completion:v16];
  }
  else
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_cold_1();
    }

    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v14 + 16))(v14, a2, a3, v9, v10);
    }
  }
}

void __57__CDPDPCSController_validateEDPIdentitiesWithCompletion___block_invoke_27(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__CDPDPCSController_validateEDPIdentitiesWithCompletion___block_invoke_27_cold_1();
    }

    uint64_t v5 = a1[6];
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, void, id))(v5 + 16))(v5, 2, 1, 0, v3);
    }
  }
  else
  {
    [*(id *)(a1[4] + 8) edpPCSGuitarfishValidateIdentities:a1[5] completion:a1[6]];
  }
}

- (void)repairEDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  p_context = &self->_context;
  if ([(CDPContext *)self->_context isProxSignIn])
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPDPCSController repairEDPStateWithCompletion:]((uint64_t)&self->_context, v6, v7, v8, v9, v10, v11, v12);
    }

    goto LABEL_5;
  }
  uint64_t v16 = [(CDPContext *)*p_context dsid];
  if (v16)
  {
    id v17 = (void *)v16;
    uint64_t v18 = [(CDPContext *)*p_context password];
    if (v18)
    {
      __int16 v19 = (void *)v18;
      uint64_t v20 = [(CDPContext *)*p_context passwordVersion];
      if (v20)
      {
        __int16 v21 = (void *)v20;
        uint64_t v22 = [(CDPContext *)*p_context srpProtocol];
        if (v22)
        {
          __int16 v23 = (void *)v22;
          uint64_t v24 = [(CDPContext *)*p_context srpSalt];
          if (v24)
          {
            uint64_t v25 = (void *)v24;
            id v26 = [(CDPContext *)*p_context srpIteration];

            if (v26)
            {
LABEL_5:
              id v13 = [(CDPDPCSController *)self _edpContextSetupDictionary];
              pcsProxy = self->_pcsProxy;
              v28[0] = MEMORY[0x263EF8330];
              v28[1] = 3221225472;
              v28[2] = __50__CDPDPCSController_repairEDPStateWithCompletion___block_invoke;
              v28[3] = &unk_26432EE60;
              v28[4] = self;
              id v29 = v13;
              id v30 = v4;
              id v15 = v13;
              [(CDPProtectedCloudStorageProxy *)pcsProxy edpPCSGuitarfishRepairIdentities:v15 completion:v28];

LABEL_21:
              goto LABEL_22;
            }
            goto LABEL_17;
          }
        }
      }
    }
  }
LABEL_17:
  v27 = _CDPLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[CDPDPCSController repairEDPStateWithCompletion:]();
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7202);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void, id))v4 + 2))(v4, 2, 0, v15);
    goto LABEL_21;
  }
LABEL_22:
}

void __50__CDPDPCSController_repairEDPStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    uint64_t v19 = a2;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_debug_impl(&dword_218640000, v8, OS_LOG_TYPE_DEBUG, "%@: Repair EDP State: %lu, RT needed: %d, repair Error: %@", buf, 0x26u);
  }

  if ([v7 isAuthenticationErrorIncludingUnderlyingErrors])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__CDPDPCSController_repairEDPStateWithCompletion___block_invoke_29;
    v13[3] = &unk_26432F6F8;
    v13[4] = v9;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v9 _renewCredentialsWithError:v7 completion:v13];
  }
  else
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, v7);
    }
  }
}

void __50__CDPDPCSController_repairEDPStateWithCompletion___block_invoke_29(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__CDPDPCSController_repairEDPStateWithCompletion___block_invoke_29_cold_1();
    }

    uint64_t v5 = a1[6];
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, void, id))(v5 + 16))(v5, 2, 0, v3);
    }
  }
  else
  {
    [*(id *)(a1[4] + 8) edpPCSGuitarfishRepairIdentities:a1[5] completion:a1[6]];
  }
}

- (void)_renewCredentialsWithError:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F34328] sharedInstance];
  id v7 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v8 = [v6 primaryAppleAccount];
  uint64_t v9 = [v6 primaryAccountDSID];
  if (v9)
  {
    uint64_t v10 = [(CDPContext *)self->_context dsid];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [(CDPContext *)self->_context dsid];
      id v13 = [v12 stringValue];
      int v14 = [v9 isEqualToString:v13];

      if (v14)
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __59__CDPDPCSController__renewCredentialsWithError_completion___block_invoke;
        v17[3] = &unk_26432F770;
        id v18 = v5;
        [v7 renewCredentialsForAccount:v8 completion:v17];
        id v15 = v18;
LABEL_9:

        goto LABEL_10;
      }
    }
  }
  uint64_t v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CDPDPCSController _renewCredentialsWithError:completion:]((uint64_t)v9, (uint64_t)self);
  }

  if (v5)
  {
    id v15 = _CDPStateError();
    (*((void (**)(id, void *))v5 + 2))(v5, v15);
    goto LABEL_9;
  }
LABEL_10:
}

void __59__CDPDPCSController__renewCredentialsWithError_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__CDPDPCSController__renewCredentialsWithError_completion___block_invoke_cold_1();
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

- (void)getRecoveryTokenInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPContext *)self->_context dsid];

  if (v5)
  {
    uint64_t v6 = [(CDPDPCSController *)self _edpContextSetupDictionary];
    [(CDPProtectedCloudStorageProxy *)self->_pcsProxy edpPCSGuitarfishGetRecoveryTokenInfo:v6 completion:v4];
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController getRecoveryTokenInfo:]();
    }

    if (v4)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7202);
      (*((void (**)(id, uint64_t, void, void, void *))v4 + 2))(v4, 2, 0, 0, v8);
    }
  }
}

- (void)changePasswordWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void, void *))a3;
  id v5 = [(CDPDPCSController *)self _edpContextSetupDictionary];
  if (v5)
  {
    [(CDPProtectedCloudStorageProxy *)self->_pcsProxy edpPCSGuitarfishChangePassword:v5 completion:v4];
  }
  else
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController changePasswordWithCompletion:]();
    }

    if (v4)
    {
      id v7 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7202);
      v4[2](v4, 2, 0, v7);
    }
  }
}

- (id)_edpContextSetupDictionary
{
  return (id)[MEMORY[0x263F343C8] setupDictionaryWithContext:self->_context];
}

- (void)resetProtectedDataShouldJoinCDP:(BOOL)a3 edpOnly:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, uint64_t, void, void *))a5;
  uint64_t v9 = [(CDPDPCSController *)self _edpContextSetupDictionary];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [NSNumber numberWithBool:v6];
  [v10 setObject:v11 forKeyedSubscript:@"kPCSShouldJoinCDP"];

  uint64_t v12 = [NSNumber numberWithBool:v5];
  [v10 setObject:v12 forKeyedSubscript:@"kPCSRPDDBROnly"];

  if (v10)
  {
    [(CDPProtectedCloudStorageProxy *)self->_pcsProxy edpPCSResetProtectedData:v10 completion:v8];
  }
  else
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPDPCSController resetProtectedDataShouldJoinCDP:edpOnly:withCompletion:]();
    }

    if (v8)
    {
      int v14 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7202);
      v8[2](v8, 2, 1, 0, v14);
    }
  }
}

- (id)_contextSetupDictionary
{
  return (id)[MEMORY[0x263F343C8] setupDictionaryWithContext:self->_context];
}

- (CDPProtectedCloudStorageProxy)pcsProxy
{
  return self->_pcsProxy;
}

- (void)setPcsProxy:(id)a3
{
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pcsProxy, 0);
}

- (void)_reauthenticateAndCheckiCDPStatusWithNetwork:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Silent auth requested prior to checking CDP state", v2, v3, v4, v5, v6);
}

- (void)_checkiCDPStatusNetwork:(os_log_t)log withCompletion:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "PCSIdentitySetIsICDPNetwork returned isEnabled=%i error=%@", (uint8_t *)v3, 0x12u);
}

- (void)_checkiCDPStatusNetwork:(char)a1 withCompletion:(NSObject *)a2 .cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Checking iCDP State. Networked: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)_getOrSetupIdentitySetRef:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "PCSIdentitySetup returned NULL with error: %@", v2, v3, v4, v5, v6);
}

- (void)_getOrSetupIdentitySetRef:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "PCS Identity fetched", v2, v3, v4, v5, v6);
}

- (void)_getOrSetupIdentitySetRef:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "PCSIdentityCreate return NULL with error: %@", v2, v3, v4, v5, v6);
}

void __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating on error from enableCDPWithCompletion: %@", v2, v3, v4, v5, v6);
}

- (void)pcsKeysForService:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "No service name provided, no key to fetch.", v1, 2u);
}

- (void)pcsKeysForService:(id *)a1 error:.cold.2(id *a1)
{
  uint64_t v1 = [*a1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)pcsKeysForService:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Fetching keys for service %@", v2, v3, v4, v5, v6);
}

- (void)pcsKeysForService:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Fetching keys with setupInfo: %{private}@", v2, v3, v4, v5, v6);
}

- (void)pcsKeysForService:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Fetching keys for %@ is not allowed.", v2, v3, v4, v5, v6);
}

void __45__CDPDPCSController_pcsKeysForService_error___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) count];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

- (void)setupEDPIdentitiesWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Missing dsid or password or password metadata on CDPContext. EDP setup is not possible. CDPContext=%@");
}

void __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Renew Credentials skipped for non-auth errors, returning result back to caller", v2, v3, v4, v5, v6);
}

void __54__CDPDPCSController_setupEDPIdentitiesWithCompletion___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SetupEDP failed with authentication error: %@", v2, v3, v4, v5, v6);
}

- (void)validateEDPIdentitiesWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Missing password version or DSID on CDPContext. EDP validate is not possible. CDPContext=%@");
}

void __57__CDPDPCSController_validateEDPIdentitiesWithCompletion___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "ValidateEDP failed with authentication error: %@", v2, v3, v4, v5, v6);
}

- (void)repairEDPStateWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_218640000, a2, a3, "CDPContext=%@: isProxSignIn, skipping the password and password metadata checks because prox flows does not have password. Calling PCS repair directly...", a5, a6, a7, a8, 2u);
}

- (void)repairEDPStateWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Missing password or password metadata on CDPContext. EDP setup is not possible. CDPContext=%@");
}

void __50__CDPDPCSController_repairEDPStateWithCompletion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "RepairEDP failed with authentication error: %@", v2, v3, v4, v5, v6);
}

- (void)_renewCredentialsWithError:(uint64_t)a1 completion:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a2 + 16) dsid];
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x2Au);
}

void __59__CDPDPCSController__renewCredentialsWithError_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to renew credentials for account with error %@", v2, v3, v4, v5, v6);
}

- (void)getRecoveryTokenInfo:.cold.1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Missing DSID on CDPContext. Reading Recovery Token is not possible.  CDPContext=%@");
}

- (void)changePasswordWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "%@: Missing password or password metadata on CDPContext. EDP change password is not possible.", v2, v3, v4, v5, v6);
}

- (void)resetProtectedDataShouldJoinCDP:edpOnly:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "%@: Params dictionary is nil. EDP RPD is not possible.", v2, v3, v4, v5, v6);
}

@end
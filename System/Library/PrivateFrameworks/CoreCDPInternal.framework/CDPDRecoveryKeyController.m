@interface CDPDRecoveryKeyController
- (BOOL)isRecoveryKeyAvailableWithError:(id *)a3;
- (BOOL)isWalrusRecoveryKeyAvailableWithError:(id *)a3;
- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4;
- (CDPAuthProviderInternal)recoveryAuthProvider;
- (CDPDAuthProviderInternal)internalAuthProvider;
- (CDPDCircleProxy)circleProxy;
- (CDPDOctagonTrustProxy)otProxy;
- (CDPDRecoveryKeyController)initWithContext:(id)a3;
- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4;
- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5;
- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 circleProxy:(id)a6 secureBackupProxy:(id)a7 octagonTrustProxy:(id)a8 pcsProxy:(id)a9;
- (CDPDSecureBackupProxy)sbProxy;
- (CDPStateUIProviderInternal)uiProvider;
- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4;
- (void)_authenticateAndPerformRecoveryKeyOperation:(id)a3 completion:(id)a4;
- (void)authenticateAndDeleteRecoveryKeyWithCompletion:(id)a3;
- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteRecoveryKeyWithCompletion:(id)a3;
- (void)generateNewRecoveryKey:(id)a3;
- (void)generateRandomRecoveryKey:(id)a3;
- (void)recoverAndSynchronizeStateWithServer:(id)a3;
- (void)recoverDataUsingMasterKeyWithCompletion:(id)a3;
- (void)recoverState:(id)a3;
- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 validateRecoveryKeyWithContext:(id)a4 completion:(id)a5;
- (void)setCircleProxy:(id)a3;
- (void)setInternalAuthProvider:(id)a3;
- (void)setOtProxy:(id)a3;
- (void)setRecoveryAuthProvider:(id)a3;
- (void)setSbProxy:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)verifyRecoveryKey:(id)a3;
@end

@implementation CDPDRecoveryKeyController

- (CDPDRecoveryKeyController)initWithContext:(id)a3
{
  return [(CDPDRecoveryKeyController *)self initWithContext:a3 uiProvider:0];
}

- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4
{
  return [(CDPDRecoveryKeyController *)self initWithContext:a3 uiProvider:a4 authProvider:0];
}

- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F34340];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithContext:v11];
  v13 = [[CDPDSecureBackupProxyImpl alloc] initWithContext:v11];
  v14 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:v11];
  id v15 = objc_alloc_init(MEMORY[0x263F343D0]);
  v16 = [(CDPDRecoveryKeyController *)self initWithContext:v11 uiProvider:v10 authProvider:v9 circleProxy:v12 secureBackupProxy:v13 octagonTrustProxy:v14 pcsProxy:v15];

  return v16;
}

- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 circleProxy:(id)a6 secureBackupProxy:(id)a7 octagonTrustProxy:(id)a8 pcsProxy:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = [(CDPDRecoveryKeyController *)self init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_context, a3);
    objc_storeStrong((id *)&v20->_uiProvider, a4);
    objc_storeStrong((id *)&v20->_recoveryAuthProvider, a5);
    v21 = objc_alloc_init(CDPDAuthProxyImpl);
    internalAuthProvider = v20->_internalAuthProvider;
    v20->_internalAuthProvider = (CDPDAuthProviderInternal *)v21;

    objc_storeStrong((id *)&v20->_circleProxy, a6);
    objc_storeStrong((id *)&v20->_sbProxy, a7);
    objc_storeStrong((id *)&v20->_otProxy, a8);
    v23 = -[CDPDPCSController initWithContext:pcsProxy:]([CDPDPCSController alloc], "initWithContext:pcsProxy:", v20->_context, v18, v28, v29, v30, v31);
    pcsController = v20->_pcsController;
    v20->_pcsController = v23;

    v25 = [[CDPDSecureBackupController alloc] initWithContext:v20->_context secureBackupProxy:v20->_sbProxy octagonTrustProxy:v20->_otProxy];
    secureBackupController = v20->_secureBackupController;
    v20->_secureBackupController = v25;
  }
  return v20;
}

- (void)recoverState:(id)a3
{
}

- (void)recoverAndSynchronizeStateWithServer:(id)a3
{
}

- (BOOL)isRecoveryKeyAvailableWithError:(id *)a3
{
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryKeyController isRecoveryKeyAvailableWithError:]();
  }

  return [(CDPDSecureBackupController *)self->_secureBackupController supportsRecoveryKeyWithError:a3];
}

- (BOOL)isWalrusRecoveryKeyAvailableWithError:(id *)a3
{
  return [(CDPDSecureBackupController *)self->_secureBackupController supportsWalrusRecoveryKeyWithError:a3];
}

- (void)verifyRecoveryKey:(id)a3
{
  id v4 = a3;
  v5 = [(CDPContext *)self->_context dsid];

  if (v5)
  {
    v6 = [(CDPDDeviceSecretValidator *)[CDPDRecoveryKeyValidator alloc] initWithContext:self->_context delegate:self];
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__4;
    v13[4] = __Block_byref_object_dispose__4;
    v14 = self;
    uiProvider = v14->_uiProvider;
    context = self->_context;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__CDPDRecoveryKeyController_verifyRecoveryKey___block_invoke;
    v10[3] = &unk_26432FFD0;
    id v11 = v4;
    v12 = v13;
    [(CDPStateUIProviderInternal *)uiProvider cdpContext:context promptForRecoveryKeyWithSecretValidator:v6 completion:v10];

    _Block_object_dispose(v13, 8);
LABEL_7:

    goto LABEL_8;
  }
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryKeyController verifyRecoveryKey:]();
  }

  if (v4)
  {
    _CDPStateError();
    v6 = (CDPDRecoveryKeyValidator *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDRecoveryKeyValidator *))v4 + 2))(v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:
}

void __47__CDPDRecoveryKeyController_verifyRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Recovery key verification UI flow completed with success: %{BOOL}d - %@", (uint8_t *)v10, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)generateNewRecoveryKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPContext *)self->_context dsid];

  if (v5)
  {
    v6 = [CDPDRecoveryKeyValidatorImpl alloc];
    context = self->_context;
    uint64_t v8 = [(CDPDRecoveryKeyController *)self otProxy];
    id v9 = [(CDPDRecoveryKeyValidatorImpl *)v6 initWithContext:context delegate:self octagonTrustProxy:v8];

    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__4;
    v20[4] = __Block_byref_object_dispose__4;
    id v10 = self;
    v21 = v10;
    uiProvider = v10->_uiProvider;
    id v12 = self->_context;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke;
    v15[3] = &unk_264330020;
    uint64_t v13 = v9;
    id v16 = v13;
    id v17 = v10;
    id v18 = v4;
    v19 = v20;
    [(CDPStateUIProviderInternal *)uiProvider cdpContext:v12 presentRecoveryKeyWithValidator:v13 completion:v15];

    _Block_object_dispose(v20, 8);
LABEL_7:

    goto LABEL_8;
  }
  v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryKeyController verifyRecoveryKey:]();
  }

  if (v4)
  {
    _CDPStateError();
    uint64_t v13 = (CDPDRecoveryKeyValidatorImpl *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDRecoveryKeyValidatorImpl *))v4 + 2))(v4, 0, v13);
    goto LABEL_7;
  }
LABEL_8:
}

void __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v25 = a2;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Recovery key UI flow completed with success %{BOOL}d - %@", buf, 0x12u);
  }

  if (a2 && [*(id *)(a1 + 32) recoveryKeyVerified])
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Recovery Key verified!", buf, 2u);
    }

    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 40);
    id v9 = [*(id *)(a1 + 32) recoveryKey];
    id v23 = 0;
    id v10 = [v8 generateVerifierWithRecoveryKey:v9 error:&v23];
    id v11 = v23;

    if (!v10 || v11)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void **)(v12 + 72);
      uint64_t v14 = *(void *)(v12 + 8);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_25;
      v19[3] = &unk_26432FFF8;
      id v21 = *(id *)(a1 + 48);
      char v22 = a2;
      id v20 = v5;
      [v13 cdpContext:v14 persistMasterKeyVerifier:v10 completion:v19];
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(void, void, id))(v15 + 16))(*(void *)(a1 + 48), 0, v5);
    }
    else
    {
      id v16 = _CDPStateError();
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
}

void __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_25_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryKeyController authenticateAndGenerateNewRecoveryKeyWithCompletion:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_264330048;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDRecoveryKeyController *)self _authenticateAndPerformRecoveryKeyOperation:v7 completion:v6];
}

uint64_t __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 32) generateNewRecoveryKey:*(void *)(a1 + 40)];
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryKeyController authenticateAndDeleteRecoveryKeyWithCompletion:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_264330048;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDRecoveryKeyController *)self _authenticateAndPerformRecoveryKeyOperation:v7 completion:v6];
}

uint64_t __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 32) deleteRecoveryKeyWithCompletion:*(void *)(a1 + 40)];
}

- (void)_authenticateAndPerformRecoveryKeyOperation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CDPDRecoveryKeyController *)self uiProvider];

  uint64_t v9 = _CDPLogSystem();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    id v18 = [(CDPDRecoveryKeyController *)self uiProvider];
    context = self->_context;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke;
    v28[3] = &unk_264330070;
    id v29 = v6;
    id v30 = v7;
    [v18 cdpContext:context promptForLocalSecretWithCompletion:v28];

    id v20 = v29;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:](v10, v21, v22, v23, v24, v25, v26, v27);
  }

  if (v7)
  {
    id v20 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5306);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v20);
LABEL_9:
  }
}

void __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_1((uint64_t)v6, v15);
    }

    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v6);
    }
  }
}

- (void)deleteRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  secureBackupController = self->_secureBackupController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_264330098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDSecureBackupController *)secureBackupController disableRecoveryKeyFromAllSystemsWithCompletion:v7];
}

void __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 72);
    uint64_t v5 = *(void *)(v3 + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2;
    v6[3] = &unk_26432F680;
    id v7 = *(id *)(a1 + 40);
    [v4 cdpContext:v5 persistMasterKeyVerifier:MEMORY[0x263EFFA78] completion:v6];
  }
}

void __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateRandomRecoveryKey:(id)a3
{
  id v4 = a3;
  id v5 = [CDPDRecoveryKeyValidatorImpl alloc];
  context = self->_context;
  id v7 = [(CDPDRecoveryKeyController *)self otProxy];
  id v8 = [(CDPDRecoveryKeyValidatorImpl *)v5 initWithContext:context delegate:self octagonTrustProxy:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke;
  v11[3] = &unk_2643300E8;
  uint64_t v13 = self;
  id v14 = v4;
  uint64_t v12 = v8;
  id v9 = v4;
  uint64_t v10 = v8;
  [(CDPDRecoveryKeyValidatorImpl *)v10 generateRecoveryKey:v11];
}

void __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_2;
  v7[3] = &unk_2643300C0;
  id v8 = v4;
  id v5 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v5;
  uint64_t v9 = *(void *)(a1 + 40);
  id v6 = v3;
  [v8 confirmRecoveryKey:v6 completion:v7];
}

void __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([MEMORY[0x263F34400] shouldClearRKCacheAfterGeneration])
  {
    id v5 = +[CDPRecoveryKeyCache sharedInstance];
    [v5 deleteCache];
  }
  if (v4
    || ([*(id *)(a1 + 32) recoveryKey],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 40);
    id v8 = [*(id *)(a1 + 32) recoveryKey];
    id v17 = 0;
    uint64_t v9 = [v7 generateVerifierWithRecoveryKey:v8 error:&v17];
    id v10 = v17;

    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(v11 + 72);
      uint64_t v13 = *(void *)(v11 + 8);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_3;
      v14[3] = &unk_26432ED48;
      id v16 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 48);
      [v12 cdpContext:v13 persistMasterKeyVerifier:v9 completion:v14];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)recoverDataUsingMasterKeyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [CDPDAccountRecoveryValidator alloc];
  context = self->_context;
  recoveryAuthProvider = self->_recoveryAuthProvider;
  id v8 = [(CDPDRecoveryKeyController *)self otProxy];
  uint64_t v9 = [(CDPDAccountRecoveryValidator *)v5 initWithContext:context authProvider:recoveryAuthProvider octagonTrustProxy:v8];

  uiProvider = self->_uiProvider;
  uint64_t v11 = self->_context;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke;
  v14[3] = &unk_26432FF58;
  id v15 = v9;
  id v16 = self;
  id v17 = v4;
  id v12 = v4;
  uint64_t v13 = v9;
  [(CDPStateUIProviderInternal *)uiProvider cdpContext:v11 promptForRecoveryKeyWithValidator:v13 completion:v14];
}

void __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2
    && ([*(id *)(a1 + 32) recoveredInfo],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Prompt for Recovery Key came back with success and recoveredInfo, attempting to cache with proxy %@", buf, 0xCu);
    }

    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 48);
    id v10 = [*(id *)(a1 + 32) recoveryKey];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_34;
    v14[3] = &unk_264330098;
    id v16 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 32);
    [v9 cacheRecoveryKey:v10 completionBlock:v14];
  }
  else
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v5);
    }
    else
    {
      uint64_t v13 = _CDPStateError();
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }
}

void __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) recoveredInfo];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  return (id)[(CDPDCircleProxy *)self->_circleProxy generateRecoveryKeyWithInfo:a3 error:a4];
}

- (void)secretValidator:(id)a3 validateRecoveryKeyWithContext:(id)a4 completion:(id)a5
{
  context = self->_context;
  id v8 = a5;
  id v11 = a4;
  uint64_t v9 = [(CDPContext *)context type];
  secureBackupController = self->_secureBackupController;
  if (v9 == 9) {
    [(CDPDSecureBackupController *)secureBackupController validateAndRepairRecoveryKeyMismatchWithContext:v11 authProvider:self->_internalAuthProvider circleProxy:self->_circleProxy completion:v8];
  }
  else {
    [(CDPDSecureBackupController *)secureBackupController validateRecoveryKeyWithContext:v11 completion:v8];
  }
}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  return 0;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "CDPDRecoveryKeyController %p deallocated", v2, v3, v4, v5, v6);
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
}

- (CDPDSecureBackupProxy)sbProxy
{
  return self->_sbProxy;
}

- (void)setSbProxy:(id)a3
{
}

- (CDPDOctagonTrustProxy)otProxy
{
  return self->_otProxy;
}

- (void)setOtProxy:(id)a3
{
}

- (CDPAuthProviderInternal)recoveryAuthProvider
{
  return self->_recoveryAuthProvider;
}

- (void)setRecoveryAuthProvider:(id)a3
{
}

- (CDPDAuthProviderInternal)internalAuthProvider
{
  return self->_internalAuthProvider;
}

- (void)setInternalAuthProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAuthProvider, 0);
  objc_storeStrong((id *)&self->_recoveryAuthProvider, 0);
  objc_storeStrong((id *)&self->_otProxy, 0);
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_pcsController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)isRecoveryKeyAvailableWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Checking recovery key status from Secure Backup", v2, v3, v4, v5, v6);
}

- (void)verifyRecoveryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Invalid context, assuming no primary account available", v2, v3, v4, v5, v6);
}

void __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to persist RK verifier: %@", v2, v3, v4, v5, v6);
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Beginning authentication before generating new recovery key", v2, v3, v4, v5, v6);
}

void __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Beginning authentication before deleting recovery key", v2, v3, v4, v5, v6);
}

void __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authenticateAndPerformRecoveryKeyOperation:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authenticateAndPerformRecoveryKeyOperation:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to get local secret with error (%s): %@", (uint8_t *)&v2, 0x16u);
}

void __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to persist verifier: %@", v2, v3, v4, v5, v6);
}

void __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Recovery Key prompt came back with error: %@", v2, v3, v4, v5, v6);
}

@end
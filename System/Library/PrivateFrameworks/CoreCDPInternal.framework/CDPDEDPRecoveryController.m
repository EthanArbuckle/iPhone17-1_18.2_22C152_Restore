@interface CDPDEDPRecoveryController
- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4;
- (CDPContext)cdpContext;
- (CDPDAuthProviderInternal)authProvider;
- (CDPDEDPRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 pcsController:(id)a6;
- (CDPDPCSController)pcsController;
- (CDPStateUIProviderInternal)uiProvider;
- (id)_edpAttemptsRemainingPrimaryForAccount:(id)a3;
- (id)_edpAttemptsRemainingRecoveryForAccount:(id)a3;
- (id)_edpHealthPrimaryForAccount:(id)a3;
- (id)_edpHealthRecoveryForAccount:(id)a3;
- (id)_edpPVMatchesForAccount:(id)a3;
- (id)_getAppleAccountForAltDSID:(id)a3;
- (unint64_t)_updateEDPStateOnContextFromRawState:(id)a3;
- (void)_clearAllEDPFollowUps;
- (void)_clearEDPFollowUp;
- (void)_fetchEDPRecoveryTokenWithCompletion:(id)a3;
- (void)_interactiveRepairWithCompletion:(id)a3;
- (void)_postRepairEDPCDPFollowUp;
- (void)_refreshContextWithSilentAuthWithCompletion:(id)a3;
- (void)_refreshedEDPStateWithCompletion:(id)a3;
- (void)_silentPasswordChangeWithCompletion:(id)a3;
- (void)_updateAccountPropertiesWithTokenInfoWithCompletion:(id)a3;
- (void)clearCDPEDPFollowUp;
- (void)createEDPLivenessDictionaryWithCompletion:(id)a3;
- (void)edpHealthIgnoringErrorWithCompletion:(id)a3;
- (void)fetchEDPRecoveryTokenWithCompletion:(id)a3;
- (void)performInitialInteractiveEDPRepairWithCompletion:(id)a3;
- (void)processADPDisablement;
- (void)repairEDPStateWithCompletion:(id)a3;
- (void)resetProtectedDataShouldJoinCDP:(BOOL)a3 edpOnly:(BOOL)a4 withCompletion:(id)a5;
- (void)secretValidator:(id)a3 didRequestEDPRecoveryTokenRepairWithContext:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5;
- (void)secretValidator:(id)a3 didRequestRepairEDPStateWithContext:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 didRequestValidateEDPIdentitiesWithContext:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 didRequestValidateEDPRecoveryToken:(id)a4 withContext:(id)a5 completion:(id)a6;
- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 validateRecoveryKeyWithContext:(id)a4 completion:(id)a5;
- (void)setAuthProvider:(id)a3;
- (void)setCdpContext:(id)a3;
- (void)setPcsController:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)setupEDPStateWithCompletion:(id)a3;
- (void)silentlyRepairEDPStateWithCompletion:(id)a3;
- (void)uploadEDPRecoveryTokenForReason:(unint64_t)a3 completion:(id)a4;
- (void)validateEDPIdentitiesWithCompletion:(id)a3;
- (void)validateEDPRecoveryToken:(id)a3 completion:(id)a4;
@end

@implementation CDPDEDPRecoveryController

- (CDPDEDPRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 pcsController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CDPDEDPRecoveryController;
  v15 = [(CDPDEDPRecoveryController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_cdpContext, a3);
    objc_storeStrong((id *)&v16->_uiProvider, a4);
    objc_storeStrong((id *)&v16->_authProvider, a5);
    objc_storeStrong((id *)&v16->_pcsController, a6);
  }

  return v16;
}

- (void)_refreshContextWithSilentAuthWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[CDPDEDPRecoveryController _refreshContextWithSilentAuthWithCompletion:]";
    __int16 v14 = 1024;
    int v15 = 67;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  v6 = [(CDPDEDPRecoveryController *)self cdpContext];
  int v7 = [v6 hasSRPPasswordMetadata];

  if (v7)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDEDPRecoveryController _refreshContextWithSilentAuthWithCompletion:]();
    }

    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    v9 = [(CDPDEDPRecoveryController *)self cdpContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__CDPDEDPRecoveryController__refreshContextWithSilentAuthWithCompletion___block_invoke;
    v10[3] = &unk_26432ECA8;
    v10[4] = self;
    id v11 = v4;
    [v9 refreshWithSilentAuthWithCompletion:v10];
  }
}

void __73__CDPDEDPRecoveryController__refreshContextWithSilentAuthWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 hasSRPPasswordMetadata])
  {
    [*(id *)(a1 + 32) setCdpContext:v5];
    int v7 = [*(id *)(a1 + 32) pcsController];
    [v7 setContext:v5];

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
    }
  }
  else
  {
    v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __73__CDPDEDPRecoveryController__refreshContextWithSilentAuthWithCompletion___block_invoke_cold_1();
    }

    v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -7202, v6);
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
    }
  }
}

- (void)setupEDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F345D0] category:*MEMORY[0x263F34830]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke;
  aBlock[3] = &unk_26432ECD0;
  v19 = v20;
  id v5 = v4;
  id v18 = v5;
  id v6 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (![MEMORY[0x263F34400] isGuitarfishEnabled]) {
    goto LABEL_4;
  }
  int v7 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v7 isBeneficiaryFlow])
  {

LABEL_4:
    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    v6[2](v6, 0, v8);
    goto LABEL_5;
  }
  v9 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v9 edpState] == 2)
  {
  }
  else
  {
    v10 = [(CDPDEDPRecoveryController *)self cdpContext];
    char v11 = [v10 _recoveryMethodAvailable];

    if ((v11 & 1) == 0) {
      goto LABEL_4;
    }
  }
  id v12 = [(CDPDEDPRecoveryController *)self cdpContext];
  int v13 = [v12 _recoveryMethodAvailable];

  if (v13)
  {
    __int16 v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDEDPRecoveryController setupEDPStateWithCompletion:]();
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_70;
  v15[3] = &unk_26432ED48;
  v15[4] = self;
  uint64_t v16 = v6;
  [(CDPDEDPRecoveryController *)self _refreshContextWithSilentAuthWithCompletion:v15];
  uint64_t v8 = v16;
LABEL_5:

  _Block_object_dispose(v20, 8);
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [NSNumber numberWithBool:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:*MEMORY[0x263F20330]];

  if (v8) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) populateUnderlyingErrorsStartingWithRootError:v8];
  }
  id v6 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v6 sendEvent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_70(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) != 0 || [v5 code] != -7202)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v8 = [*(id *)(a1 + 32) pcsController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71;
    v10[3] = &unk_26432ED20;
    objc_copyWeak(&v12, &location);
    id v9 = *(id *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 setupEDPIdentitiesWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_70_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = _CDPStateError();
    goto LABEL_19;
  }
  if (a3)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_3();
    }

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_72;
    v17[3] = &unk_26432ECF8;
    v17[4] = WeakRetained;
    [WeakRetained _updateAccountPropertiesWithTokenInfoWithCompletion:v17];
  }
  if (a2 == 1)
  {
    [WeakRetained _postRepairEDPCDPFollowUp];
    [WeakRetained _clearEDPFollowUp];
    int v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_2();
    }

    goto LABEL_18;
  }
  if (a2)
  {
    __int16 v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v16;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_error_impl(&dword_218640000, v14, OS_LOG_TYPE_ERROR, "%@: setupEDPStateWithCompletion failed to setup with state:%lu and error:%@", buf, 0x20u);
    }

LABEL_18:
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", 7201, v7);
LABEL_19:
    int v15 = (void *)v12;
    (*(void (**)(uint64_t, void, uint64_t))(v11 + 16))(v11, 0, v12);

    goto LABEL_20;
  }
  [WeakRetained _clearEDPFollowUp];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_20:
}

uint64_t __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_72(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) uploadEDPRecoveryTokenForReason:1 completion:0];
  }
  return result;
}

- (void)performInitialInteractiveEDPRepairWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDEDPRecoveryController performInitialInteractiveEDPRepairWithCompletion:]();
  }

  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    id v6 = [(CDPDEDPRecoveryController *)self cdpContext];
    if ([v6 edpState] == 2)
    {
      id v7 = [(CDPDEDPRecoveryController *)self cdpContext];
      int v8 = [v7 isBeneficiaryFlow];

      if (!v8)
      {
        objc_initWeak(&location, self);
        id v9 = [(CDPDEDPRecoveryController *)self pcsController];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __78__CDPDEDPRecoveryController_performInitialInteractiveEDPRepairWithCompletion___block_invoke;
        v11[3] = &unk_26432ED70;
        objc_copyWeak(&v13, &location);
        id v12 = v4;
        [v9 repairEDPStateWithCompletion:v11];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (v4)
  {
    v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v10);
  }
LABEL_10:
}

void __78__CDPDEDPRecoveryController_performInitialInteractiveEDPRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v6) {
      __78__CDPDEDPRecoveryController_performInitialInteractiveEDPRepairWithCompletion___block_invoke_cold_2();
    }

    [WeakRetained _interactiveRepairWithCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6) {
      __78__CDPDEDPRecoveryController_performInitialInteractiveEDPRepairWithCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, void, void))(v7 + 16))(v7, 1, 0, 0);
    }
  }
}

- (void)repairEDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (![MEMORY[0x263F34400] isGuitarfishEnabled]) {
    goto LABEL_10;
  }
  id v5 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v5 edpState] != 2)
  {

    goto LABEL_10;
  }
  BOOL v6 = [(CDPDEDPRecoveryController *)self cdpContext];
  int v7 = [v6 isBeneficiaryFlow];

  if (v7)
  {
LABEL_10:
    if (!v4) {
      goto LABEL_13;
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
LABEL_12:
    int v15 = (void *)v14;
    (*((void (**)(id, void, void, uint64_t))v4 + 2))(v4, 0, 0, v14);

    goto LABEL_13;
  }
  int v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDEDPRecoveryController repairEDPStateWithCompletion:](self, v8);
  }

  id v9 = [(CDPDEDPRecoveryController *)self cdpContext];
  uint64_t v10 = [v9 password];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [(CDPDEDPRecoveryController *)self cdpContext];
    id v13 = [v12 oldPassword];

    if (v13)
    {
      [(CDPDEDPRecoveryController *)self _silentPasswordChangeWithCompletion:v4];
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v16 = [(CDPDEDPRecoveryController *)self cdpContext];
  v17 = [v16 password];

  if (v17)
  {
    [(CDPDEDPRecoveryController *)self silentlyRepairEDPStateWithCompletion:v4];
    goto LABEL_13;
  }
  id v18 = [(CDPDEDPRecoveryController *)self uiProvider];

  if (v18)
  {
    [(CDPDEDPRecoveryController *)self _interactiveRepairWithCompletion:v4];
    goto LABEL_13;
  }
  uint64_t v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[CDPDEDPRecoveryController repairEDPStateWithCompletion:]();
  }

  if (v4)
  {
    uint64_t v14 = _CDPStateError();
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_silentPasswordChangeWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[CDPDEDPRecoveryController _silentPasswordChangeWithCompletion:]";
    __int16 v11 = 1024;
    int v12 = 202;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke;
  v7[3] = &unk_26432EDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDEDPRecoveryController *)self _refreshContextWithSilentAuthWithCompletion:v7];
}

void __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if ((a2 & 1) != 0 || [v5 code] != -7202)
  {
    if (v6)
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke_cold_1();
      }

      uint64_t v10 = (void *)v6[2];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke_75;
      v14[3] = &unk_26432ED98;
      __int16 v11 = *(void **)(a1 + 40);
      v14[4] = *(void *)(a1 + 32);
      v14[5] = v6;
      id v15 = v11;
      [v10 changePasswordWithCompletion:v14];
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        uint64_t v13 = _CDPStateError();
        (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v13);
      }
    }
  }
  else
  {
    int v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v5);
    }
  }
}

void __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke_75(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138413058;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = a2;
      __int16 v19 = 2048;
      uint64_t v20 = a3;
      _os_log_error_impl(&dword_218640000, v8, OS_LOG_TYPE_ERROR, "%@: failed to re-seal DBR after password change with %{public}@, PCSGuitarfishState:%ld, PCSGuitarfishFlags:%ld", (uint8_t *)&v13, 0x2Au);
    }
  }
  if (a2 == 1)
  {
    [*(id *)(a1 + 40) _postRepairEDPCDPFollowUp];
    [*(id *)(a1 + 40) _clearEDPFollowUp];
  }
  else if (!a2)
  {
    [*(id *)(a1 + 40) _clearEDPFollowUp];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_12:
      v10();
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    uint64_t v10 = *(void (**)(void))(v11 + 16);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)silentlyRepairEDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  id v5 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v5 type] == 13)
  {

LABEL_4:
    uint64_t v8 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34560] category:*MEMORY[0x263F34830]];
    uint64_t v9 = v35;
    goto LABEL_5;
  }
  id v6 = [(CDPDEDPRecoveryController *)self cdpContext];
  uint64_t v7 = [v6 type];

  if (v7 == 11) {
    goto LABEL_4;
  }
  uint64_t v18 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v18 type] == 2)
  {
  }
  else
  {
    uint64_t v20 = [(CDPDEDPRecoveryController *)self cdpContext];
    uint64_t v21 = [v20 type];

    if (v21 != 1) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34568] category:*MEMORY[0x263F34830]];
  uint64_t v9 = v29;
LABEL_5:
  uint64_t v10 = (void *)v9[5];
  v9[5] = v8;

LABEL_6:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke;
  aBlock[3] = &unk_26432EDE8;
  void aBlock[4] = self;
  v26 = &v34;
  v27 = &v28;
  id v11 = v4;
  id v25 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  if (![MEMORY[0x263F34400] isGuitarfishEnabled]) {
    goto LABEL_14;
  }
  int v13 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v13 edpState] != 2)
  {

    goto LABEL_14;
  }
  uint64_t v14 = [(CDPDEDPRecoveryController *)self cdpContext];
  int v15 = [v14 isBeneficiaryFlow];

  if (v15)
  {
LABEL_14:
    __int16 v19 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(void *, void, void, void *))v12 + 2))(v12, 0, 0, v19);

    goto LABEL_15;
  }
  id v16 = [(CDPDEDPRecoveryController *)self cdpContext];
  __int16 v17 = [v16 oldPassword];

  if (v17)
  {
    [(CDPDEDPRecoveryController *)self _silentPasswordChangeWithCompletion:v12];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2;
    v22[3] = &unk_26432EDC0;
    v22[4] = self;
    id v23 = v12;
    [(CDPDEDPRecoveryController *)self _refreshContextWithSilentAuthWithCompletion:v22];
  }
LABEL_15:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v19 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) cdpContext];
  if ([v7 type] == 13)
  {

LABEL_4:
    uint64_t v10 = [NSNumber numberWithBool:a2];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v10 forKeyedSubscript:*MEMORY[0x263F20330]];

    if (v19) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "populateUnderlyingErrorsStartingWithRootError:");
    }
    id v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    uint64_t v12 = *(void *)(a1 + 48);
LABEL_7:
    [v11 sendEvent:*(void *)(*(void *)(v12 + 8) + 40)];

    goto LABEL_8;
  }
  uint64_t v8 = [*(id *)(a1 + 32) cdpContext];
  uint64_t v9 = [v8 type];

  if (v9 == 11) {
    goto LABEL_4;
  }
  int v15 = [*(id *)(a1 + 32) cdpContext];
  if ([v15 type] == 2)
  {

LABEL_16:
    uint64_t v18 = [NSNumber numberWithBool:a2];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v18 forKeyedSubscript:*MEMORY[0x263F20330]];

    if (v19) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "populateUnderlyingErrorsStartingWithRootError:");
    }
    id v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    uint64_t v12 = *(void *)(a1 + 56);
    goto LABEL_7;
  }
  id v16 = [*(id *)(a1 + 32) cdpContext];
  uint64_t v17 = [v16 type];

  if (v17 == 1) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = v19;
  if (v13)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v13 + 16))(v13, a2, a3, v19);
    uint64_t v14 = v19;
  }
}

void __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if ((a2 & 1) != 0 || [v5 code] != -7202)
  {
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2_cold_2();
    }

    if (v6)
    {
      uint64_t v10 = (void *)v6[2];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_78;
      v14[3] = &unk_26432EE10;
      v14[4] = v6;
      id v15 = *(id *)(a1 + 40);
      [v10 repairEDPStateWithCompletion:v14];
    }
    else
    {
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2_cold_1();
      }

      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        uint64_t v13 = _CDPStateError();
        (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v13);
      }
    }
  }
  else
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2_cold_3();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v5);
    }
  }
}

void __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_78(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v10 = a4;
  if (!a2)
  {
    [*(id *)(a1 + 32) _clearEDPFollowUp];
    uint64_t v9 = *(void *)(a1 + 40);
    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v8 = *(void (**)(void))(v9 + 16);
    goto LABEL_8;
  }
  if (a3)
  {
    [*(id *)(a1 + 32) _postRepairEDPCDPFollowUp];
    [*(id *)(a1 + 32) _clearEDPFollowUp];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
    v8();
  }
LABEL_9:
}

- (void)_interactiveRepairWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v5 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v5 type] == 2)
  {

LABEL_4:
    uint64_t v8 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34568] category:*MEMORY[0x263F34830]];
    uint64_t v9 = (void *)v24[5];
    v24[5] = v8;

    goto LABEL_5;
  }
  id v6 = [(CDPDEDPRecoveryController *)self cdpContext];
  uint64_t v7 = [v6 type];

  if (v7 == 1) {
    goto LABEL_4;
  }
LABEL_5:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke;
  aBlock[3] = &unk_26432EE38;
  void aBlock[4] = self;
  __int16 v22 = &v23;
  id v10 = v4;
  id v21 = v10;
  id v11 = _Block_copy(aBlock);
  uint64_t v12 = [(CDPDEDPRecoveryController *)self cdpContext];
  uint64_t v13 = [MEMORY[0x263F343B8] builderForKey:@"INTERACTIVE_AUTH_DEFAULT_BUTTON_TITLE" inTable:@"Localizable-EDP"];
  uint64_t v14 = [v13 localizedString];
  [v12 setInteractiveAuthDefaultButtonString:v14];

  [(CDPDEDPRecoveryController *)self setCdpContext:v12];
  id v15 = [(CDPDEDPRecoveryController *)self uiProvider];
  id v16 = [(CDPDEDPRecoveryController *)self cdpContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2;
  v18[3] = &unk_26432EE88;
  v18[4] = self;
  id v17 = v11;
  id v19 = v17;
  [v15 cdpContext:v16 promptForInteractiveAuthenticationWithCompletion:v18];

  _Block_object_dispose(&v23, 8);
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v14 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) cdpContext];
  if ([v7 type] == 2)
  {
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) cdpContext];
    uint64_t v9 = [v8 type];

    if (v9 != 1) {
      goto LABEL_7;
    }
  }
  id v10 = [NSNumber numberWithBool:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v10 forKeyedSubscript:*MEMORY[0x263F20330]];

  if (v14) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "populateUnderlyingErrorsStartingWithRootError:");
  }
  id v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v11 sendEvent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

LABEL_7:
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = v14;
  if (v12)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v12 + 16))(v12, a2, a3, v14);
    uint64_t v13 = v14;
  }
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)*(id *)(a1 + 32);
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2_cold_3();
  }

  if (v7)
  {
    if (v5)
    {
      [v7[1] updateWithAuthenticationResults:v5];
      id v9 = v7[1];
      id v10 = [v7 pcsController];
      [v10 setContext:v9];

      id v11 = [v7 pcsController];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_83;
      v20[3] = &unk_26432EE60;
      uint64_t v12 = *(void **)(a1 + 40);
      v20[4] = *(void *)(a1 + 32);
      void v20[5] = v7;
      id v21 = v12;
      [v11 repairEDPStateWithCompletion:v20];

      goto LABEL_19;
    }
    if ((objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5307) & 1) != 0
      || objc_msgSend(v6, "ak_isAuthenticationErrorWithCode:", -7003))
    {
      id v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2_cold_1();
      }

      uint64_t v16 = *(void *)(a1 + 40);
      if (v16)
      {
        id v17 = *(void (**)(void))(v16 + 16);
LABEL_18:
        v17();
      }
    }
    else
    {
      uint64_t v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2_cold_2();
      }

      uint64_t v19 = *(void *)(a1 + 40);
      if (v19)
      {
        id v17 = *(void (**)(void))(v19 + 16);
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13)
    {
      id v14 = _CDPStateError();
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v14);
    }
  }
LABEL_19:
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_83(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138413058;
    uint64_t v16 = v14;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 1024;
    int v20 = a3;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_debug_impl(&dword_218640000, v8, OS_LOG_TYPE_DEBUG, "%@: Repair EDP State: %lu, Recovery Token needed: %d, repair Error: %@", (uint8_t *)&v15, 0x26u);
  }

  if (a2)
  {
    if (a3)
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_83_cold_2();
      }

      [*(id *)(a1 + 40) _postRepairEDPCDPFollowUp];
      [*(id *)(a1 + 40) _clearEDPFollowUp];
    }
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      id v11 = *(void (**)(void))(v10 + 16);
LABEL_14:
      v11();
    }
  }
  else
  {
    uint64_t v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_83_cold_1();
    }

    [*(id *)(a1 + 40) _clearEDPFollowUp];
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      id v11 = *(void (**)(void))(v13 + 16);
      goto LABEL_14;
    }
  }
}

- (void)edpHealthIgnoringErrorWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CDPDEDPRecoveryController_edpHealthIgnoringErrorWithCompletion___block_invoke;
  v6[3] = &unk_26432EEB0;
  id v7 = v4;
  id v5 = v4;
  [(CDPDEDPRecoveryController *)self validateEDPIdentitiesWithCompletion:v6];
}

uint64_t __66__CDPDEDPRecoveryController_edpHealthIgnoringErrorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)validateEDPIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    id v5 = [(CDPDEDPRecoveryController *)self cdpContext];
    if ([v5 edpState] == 2)
    {
      id v6 = [(CDPDEDPRecoveryController *)self cdpContext];
      int v7 = [v6 isBeneficiaryFlow];

      if (!v7)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke;
        v9[3] = &unk_26432ED48;
        v9[4] = self;
        id v10 = v4;
        [(CDPDEDPRecoveryController *)self _refreshContextWithSilentAuthWithCompletion:v9];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if (v4)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(id, uint64_t, void, void *))v4 + 2))(v4, 8, 0, v8);
  }
LABEL_8:
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) != 0 || [v5 code] != -7202)
  {
    id v9 = [*(id *)(a1 + 32) pcsController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86;
    v10[3] = &unk_26432EED8;
    id v11 = *(id *)(a1 + 40);
    [v9 validateEDPIdentitiesWithCompletion:v10];
  }
  else
  {
    int v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, void, void *))(v8 + 16))(v8, 8, 0, v6);
    }
  }
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  if (a2 == 1)
  {
    uint64_t v14 = _CDPLogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (a3 == 10)
    {
      if (v15) {
        __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_3((uint64_t)v10, v14);
      }

      uint64_t v16 = *(void *)(a1 + 32);
      if (v16)
      {
        uint64_t v13 = *(void (**)(void))(v16 + 16);
        goto LABEL_20;
      }
    }
    else
    {
      if (v15) {
        __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_4((uint64_t)v10, a3, v14);
      }

      uint64_t v19 = *(void *)(a1 + 32);
      if (v19)
      {
        uint64_t v13 = *(void (**)(void))(v19 + 16);
        goto LABEL_20;
      }
    }
  }
  else if (a2 == 2)
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_2();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      uint64_t v13 = *(void (**)(void))(v12 + 16);
LABEL_20:
      v13();
    }
  }
  else
  {
    __int16 v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_1();
    }

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v13 = *(void (**)(void))(v18 + 16);
      goto LABEL_20;
    }
  }
}

- (void)createEDPLivenessDictionaryWithCompletion:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void))a3;
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    id v5 = [(CDPDEDPRecoveryController *)self cdpContext];
    if ([v5 edpState] == 2)
    {
      id v6 = [(CDPDEDPRecoveryController *)self cdpContext];
      int v7 = [v6 isBeneficiaryFlow];

      if (!v7)
      {
        uint64_t v8 = [(CDPDEDPRecoveryController *)self cdpContext];
        uint64_t v9 = [v8 edpHealth];

        id v10 = [MEMORY[0x263EFF9A0] dictionary];
        id v11 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v12 = [(CDPDEDPRecoveryController *)self cdpContext];
        uint64_t v13 = [v12 altDSID];
        uint64_t v14 = [(CDPDEDPRecoveryController *)self _getAppleAccountForAltDSID:v13];

        if (v9)
        {
          BOOL v15 = [(CDPDEDPRecoveryController *)self _edpHealthPrimaryForAccount:v14];

          if (v15)
          {
            uint64_t v16 = [(CDPDEDPRecoveryController *)self _edpHealthPrimaryForAccount:v14];
            [v10 setObject:v16 forKeyedSubscript:@"state"];
          }
          __int16 v17 = [(CDPDEDPRecoveryController *)self _edpHealthRecoveryForAccount:v14];

          if (v17)
          {
            uint64_t v18 = [(CDPDEDPRecoveryController *)self _edpHealthRecoveryForAccount:v14];
            [v11 setObject:v18 forKeyedSubscript:@"state"];
          }
        }
        else
        {
          [v10 setObject:&unk_26C9D2FB0 forKeyedSubscript:@"state"];
          [v11 setObject:&unk_26C9D2FB0 forKeyedSubscript:@"state"];
        }
        int v20 = [(CDPDEDPRecoveryController *)self _edpPVMatchesForAccount:v14];

        if (v20)
        {
          __int16 v21 = [(CDPDEDPRecoveryController *)self _edpPVMatchesForAccount:v14];
          [v10 setObject:v21 forKeyedSubscript:@"pvmi"];
        }
        id v22 = [(CDPDEDPRecoveryController *)self _edpAttemptsRemainingPrimaryForAccount:v14];

        if (v22)
        {
          uint64_t v23 = [(CDPDEDPRecoveryController *)self _edpAttemptsRemainingPrimaryForAccount:v14];
          [v10 setObject:v23 forKeyedSubscript:@"ar"];
        }
        uint64_t v24 = [(CDPDEDPRecoveryController *)self _edpAttemptsRemainingRecoveryForAccount:v14];

        if (v24)
        {
          uint64_t v25 = [(CDPDEDPRecoveryController *)self _edpAttemptsRemainingRecoveryForAccount:v14];
          [v11 setObject:v25 forKeyedSubscript:@"ar"];
        }
        v27[0] = @"edpPrimary";
        v27[1] = @"edpRecovery";
        v28[0] = v10;
        v28[1] = v11;
        v26 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
        if (v4) {
          v4[2](v4, v26, 0);
        }

        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if (v4)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v19);
  }
LABEL_12:
}

- (id)_edpHealthPrimaryForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"edpHealthPrimary"];
}

- (id)_edpHealthRecoveryForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"edpHealthRecovery"];
}

- (id)_edpPVMatchesForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"edpPVMatches"];
}

- (id)_edpAttemptsRemainingPrimaryForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"edpAttemptsRemainingPrimary"];
}

- (id)_edpAttemptsRemainingRecoveryForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"edpAttemptsRemainingRecovery"];
}

- (id)_getAppleAccountForAltDSID:(id)a3
{
  return (id)[MEMORY[0x263F34328] appleAccountForAltDSID:a3];
}

- (void)validateEDPRecoveryToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  id v22 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F345A8] category:*MEMORY[0x263F34830]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke;
  aBlock[3] = &unk_26432ECD0;
  int v20 = v21;
  id v8 = v7;
  id v19 = v8;
  uint64_t v9 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (![MEMORY[0x263F34400] isGuitarfishEnabled]) {
    goto LABEL_6;
  }
  id v10 = [(CDPDEDPRecoveryController *)self cdpContext];
  if ([v10 edpState] != 2)
  {

    goto LABEL_6;
  }
  id v11 = [(CDPDEDPRecoveryController *)self cdpContext];
  int v12 = [v11 isBeneficiaryFlow];

  if (v12)
  {
LABEL_6:
    BOOL v15 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    v9[2](v9, 0, v15);
    goto LABEL_7;
  }
  uint64_t v13 = [(CDPDEDPRecoveryController *)self pcsController];
  uint64_t v14 = [v13 context];
  [v14 setEdpRecoveryToken:v6];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_2;
  v16[3] = &unk_26432ED48;
  v16[4] = self;
  __int16 v17 = v9;
  [(CDPDEDPRecoveryController *)self _refreshContextWithSilentAuthWithCompletion:v16];
  BOOL v15 = v17;
LABEL_7:

  _Block_object_dispose(v21, 8);
}

void __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [NSNumber numberWithBool:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:*MEMORY[0x263F20330]];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) populateUnderlyingErrorsStartingWithRootError:v8];
  id v6 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v6 sendEvent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) != 0 || [v5 code] != -7202)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v8 = [*(id *)(a1 + 32) pcsController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92;
    v9[3] = &unk_26432ED70;
    objc_copyWeak(&v11, &location);
    id v10 = *(id *)(a1 + 40);
    [v8 repairEDPStateWithCompletion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_70_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!WeakRetained)
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = _CDPStateError();
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    goto LABEL_13;
  }
  if (a2 == 1)
  {
    [WeakRetained _postRepairEDPCDPFollowUp];
    [v8 _clearEDPFollowUp];
    int v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -7207, v6);
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92_cold_4();
    }

    (*(void (**)(void, void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v12);
LABEL_13:

    goto LABEL_17;
  }
  if (a2)
  {
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92_cold_2();
    }
  }
  else
  {
    [WeakRetained _clearEDPFollowUp];
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92_cold_3();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_17:
}

- (void)processADPDisablement
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__CDPDEDPRecoveryController_processADPDisablement__block_invoke;
  v3[3] = &unk_26432EF00;
  objc_copyWeak(&v4, &location);
  [(CDPDEDPRecoveryController *)self _updateAccountPropertiesWithTokenInfoWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__CDPDEDPRecoveryController_processADPDisablement__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2) {
      [WeakRetained uploadEDPRecoveryTokenForReason:3 completion:0];
    }
  }
  else
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_1();
    }
  }
}

- (void)_updateAccountPropertiesWithTokenInfoWithCompletion:(id)a3
{
  id v4 = a3;
  pcsController = self->_pcsController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke;
  v7[3] = &unk_26432EF28;
  id v8 = v4;
  id v6 = v4;
  [(CDPDPCSController *)pcsController getRecoveryTokenInfo:v7];
}

void __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke_cold_2();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v10);
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F34328] sharedInstance];
    uint64_t v14 = [v13 primaryAppleAccount];

    [v14 setAccountProperty:v9 forKey:@"edpRecoveryTokenIdCreatedBySelf"];
    id v20 = 0;
    [MEMORY[0x263F34328] saveVerifiedAccount:v14 error:&v20];
    id v15 = v20;
    uint64_t v16 = _CDPLogSystem();
    __int16 v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "[CDPDEDPRecoveryController] Account saved.", v19, 2u);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      (*(void (**)(uint64_t, BOOL, id))(v18 + 16))(v18, v15 == 0, v15);
    }
  }
}

- (void)uploadEDPRecoveryTokenForReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    uint64_t v7 = [(CDPDEDPRecoveryController *)self cdpContext];
    if ([v7 edpState] == 2)
    {
      id v8 = [(CDPDEDPRecoveryController *)self cdpContext];
      int v9 = [v8 isBeneficiaryFlow];

      if (!v9)
      {
        id v10 = [MEMORY[0x263F34328] sharedInstance];
        uint64_t v11 = [v10 primaryAppleAccount];

        uint64_t v12 = [[CDPDEDPRecoveryTokenUploader alloc] initWithAccount:v11 cdpContext:self->_cdpContext authProvider:self->_authProvider];
        pcsController = self->_pcsController;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __72__CDPDEDPRecoveryController_uploadEDPRecoveryTokenForReason_completion___block_invoke;
        v16[3] = &unk_26432EF78;
        v16[4] = self;
        __int16 v17 = v12;
        id v18 = v6;
        unint64_t v19 = a3;
        uint64_t v14 = v12;
        [(CDPDPCSController *)pcsController getRecoveryTokenInfo:v16];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if (v6)
  {
    id v15 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v15);
  }
LABEL_8:
}

void __72__CDPDEDPRecoveryController_uploadEDPRecoveryTokenForReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke_cold_2();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v10);
    }
  }
  else
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy_;
    v19[4] = __Block_byref_object_dispose_;
    id v20 = [MEMORY[0x263F202A8] analyticsEventWithContext:*(void *)(*(void *)(a1 + 32) + 8) eventName:*MEMORY[0x263F345C8] category:*MEMORY[0x263F34830]];
    uint64_t v13 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__CDPDEDPRecoveryController_uploadEDPRecoveryTokenForReason_completion___block_invoke_95;
    v15[3] = &unk_26432EF50;
    __int16 v17 = v19;
    uint64_t v18 = v13;
    uint64_t v14 = *(void **)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    [v14 uploadRecoveryToken:v8 tokenId:v9 reason:v13 completion:v15];

    _Block_object_dispose(v19, 8);
  }
}

void __72__CDPDEDPRecoveryController_uploadEDPRecoveryTokenForReason_completion___block_invoke_95(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[6];
    int v11 = 134218498;
    uint64_t v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_218640000, v6, OS_LOG_TYPE_DEBUG, "CDPDEDPRecoveryController: Token for reason: %ld uploaded: %{BOOL}d. Error: %@", (uint8_t *)&v11, 0x1Cu);
  }

  uint64_t v7 = [NSNumber numberWithBool:a2];
  [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v7 forKeyedSubscript:*MEMORY[0x263F20330]];

  [*(id *)(*(void *)(a1[5] + 8) + 40) populateUnderlyingErrorsStartingWithRootError:v5];
  id v8 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v8 sendEvent:*(void *)(*(void *)(a1[5] + 8) + 40)];

  uint64_t v9 = a1[4];
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (void)fetchEDPRecoveryTokenWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34590] category:*MEMORY[0x263F34830]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDEDPRecoveryController_fetchEDPRecoveryTokenWithCompletion___block_invoke;
  aBlock[3] = &unk_26432EFA0;
  uint64_t v18 = v19;
  id v5 = v4;
  id v17 = v5;
  id v6 = _Block_copy(aBlock);
  if ([MEMORY[0x263F34400] isGuitarfishEnabled]
    && ([(CDPDEDPRecoveryController *)self cdpContext],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isBeneficiaryFlow],
        v7,
        !v8))
  {
    objc_initWeak(&location, self);
    uint64_t v10 = [(CDPDEDPRecoveryController *)self cdpContext];
    uint64_t v11 = [v10 edpState];

    if (v11 == 2)
    {
      [(CDPDEDPRecoveryController *)self _fetchEDPRecoveryTokenWithCompletion:v6];
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__CDPDEDPRecoveryController_fetchEDPRecoveryTokenWithCompletion___block_invoke_2;
      v12[3] = &unk_26432EFC8;
      objc_copyWeak(&v14, &location);
      id v13 = v6;
      [(CDPDEDPRecoveryController *)self _refreshedEDPStateWithCompletion:v12];

      objc_destroyWeak(&v14);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(void *, void, void *))v6 + 2))(v6, 0, v9);
  }
  _Block_object_dispose(v19, 8);
}

void __65__CDPDEDPRecoveryController_fetchEDPRecoveryTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "count") != 0);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:*MEMORY[0x263F20330]];

  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) populateUnderlyingErrorsStartingWithRootError:v5];
  }
  uint64_t v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v7 sendEvent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __65__CDPDEDPRecoveryController_fetchEDPRecoveryTokenWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if ([WeakRetained _updateEDPStateOnContextFromRawState:v3] == 2)
    {
      [WeakRetained _fetchEDPRecoveryTokenWithCompletion:*(void *)(a1 + 32)];
    }
    else
    {
      id v5 = _CDPLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __65__CDPDEDPRecoveryController_fetchEDPRecoveryTokenWithCompletion___block_invoke_2_cold_1();
      }

      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_refreshedEDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDEDPRecoveryController *)self authProvider];
  uint64_t v6 = [(CDPDEDPRecoveryController *)self cdpContext];
  uint64_t v7 = [v6 altDSID];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke;
  v9[3] = &unk_26432EFF0;
  id v10 = v4;
  id v8 = v4;
  [v5 getUserInformationForAltDSID:v7 completion:v9];
}

void __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke_cold_3();
    }
  }
  else
  {
    id v8 = [v5 edpState];

    uint64_t v7 = _CDPLogSystem();
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v9) {
        __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke_cold_2();
      }
    }
    else if (v9)
    {
      __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke_cold_1();
    }
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = [v5 edpState];
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
  }
}

- (void)_fetchEDPRecoveryTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDEDPRecoveryController *)self pcsController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CDPDEDPRecoveryController__fetchEDPRecoveryTokenWithCompletion___block_invoke;
  v7[3] = &unk_26432EF28;
  id v8 = v4;
  id v6 = v4;
  [v5 getRecoveryTokenInfo:v7];
}

void __66__CDPDEDPRecoveryController__fetchEDPRecoveryTokenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke_cold_2();
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v8, v10);
  }
}

- (unint64_t)_updateEDPStateOnContextFromRawState:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDEDPRecoveryController *)self cdpContext];
  unint64_t v6 = [v5 _parseEDPStateFromRawState:v4];

  uint64_t v7 = [(CDPDEDPRecoveryController *)self cdpContext];
  [v7 setEdpState:v6];

  id v8 = [(CDPDEDPRecoveryController *)self pcsController];
  id v9 = [v8 context];
  [v9 setEdpState:v6];

  return v6;
}

- (void)resetProtectedDataShouldJoinCDP:(BOOL)a3 edpOnly:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F345C0] category:*MEMORY[0x263F34830]];
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    id v10 = [(CDPDEDPRecoveryController *)self cdpContext];
    if ([v10 edpState] == 2)
    {
      uint64_t v11 = [(CDPDEDPRecoveryController *)self cdpContext];
      int v12 = [v11 isBeneficiaryFlow];

      if (!v12)
      {
        objc_initWeak(&location, self);
        id v13 = _CDPLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[CDPDEDPRecoveryController resetProtectedDataShouldJoinCDP:edpOnly:withCompletion:]();
        }

        pcsController = self->_pcsController;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke;
        v18[3] = &unk_26432F018;
        objc_copyWeak(&v22, &location);
        id v15 = v9;
        BOOL v23 = v6;
        id v19 = v15;
        id v20 = self;
        id v21 = v8;
        [(CDPDPCSController *)pcsController resetProtectedDataShouldJoinCDP:v6 edpOnly:v5 withCompletion:v18];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  id v16 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
  [v9 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F20330]];
  [v9 populateUnderlyingErrorsStartingWithRootError:v16];
  id v17 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v17 sendEvent:v9];

  if (v8) {
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }

LABEL_11:
}

void __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v6)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F20330]];
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F20330]];
    if (!*(unsigned char *)(a1 + 64))
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke_cold_1();
      }

      [WeakRetained clearCDPEDPFollowUp];
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke_99;
    v12[3] = &unk_26432ECF8;
    void v12[4] = WeakRetained;
    [WeakRetained _updateAccountPropertiesWithTokenInfoWithCompletion:v12];
  }
  id v10 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v10 sendEvent:*(void *)(a1 + 32)];

  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, v6 == 0, v6);
  }
}

uint64_t __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke_99(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) uploadEDPRecoveryTokenForReason:2 completion:0];
  }
  return result;
}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
  BOOL v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[CDPDEDPRecoveryController secretValidator:recoverSecureBackupWithContext:completion:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)secretValidator:(id)a3 validateRecoveryKeyWithContext:(id)a4 completion:(id)a5
{
  BOOL v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[CDPDEDPRecoveryController secretValidator:validateRecoveryKeyWithContext:completion:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CDPDEDPRecoveryController secretValidator:shouldContinueValidationAfterError:]";
    __int16 v8 = 1024;
    int v9 = 762;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

- (void)secretValidator:(id)a3 didRequestValidateEDPIdentitiesWithContext:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  int v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[CDPDEDPRecoveryController secretValidator:didRequestValidateEDPIdentitiesWithContext:completion:]";
    __int16 v13 = 1024;
    int v14 = 767;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v11, 0x12u);
  }

  [(CDPDEDPRecoveryController *)self setCdpContext:v8];
  uint64_t v10 = [(CDPDEDPRecoveryController *)self pcsController];
  [v10 setContext:v8];

  [(CDPDEDPRecoveryController *)self validateEDPIdentitiesWithCompletion:v7];
}

- (void)secretValidator:(id)a3 didRequestRepairEDPStateWithContext:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  int v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[CDPDEDPRecoveryController secretValidator:didRequestRepairEDPStateWithContext:completion:]";
    __int16 v13 = 1024;
    int v14 = 774;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v11, 0x12u);
  }

  [(CDPDEDPRecoveryController *)self setCdpContext:v8];
  uint64_t v10 = [(CDPDEDPRecoveryController *)self pcsController];
  [v10 setContext:v8];

  [(CDPDEDPRecoveryController *)self repairEDPStateWithCompletion:v7];
}

- (void)secretValidator:(id)a3 didRequestEDPRecoveryTokenRepairWithContext:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[CDPDEDPRecoveryController secretValidator:didRequestEDPRecoveryTokenRepairWithContext:successfulCDPRecoveryC"
          "ontinuationHandler:]";
    __int16 v16 = 1024;
    int v17 = 781;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v14, 0x12u);
  }

  [(CDPDEDPRecoveryController *)self setCdpContext:v9];
  uint64_t v12 = [(CDPDEDPRecoveryController *)self pcsController];
  [v12 setContext:v9];

  __int16 v13 = [(CDPDEDPRecoveryController *)self uiProvider];
  [v13 cdpContext:v9 promptForEDPRecoveryTokenWithValidator:v10 successfulCDPRecoveryContinuationHandler:v8];
}

- (void)secretValidator:(id)a3 didRequestValidateEDPRecoveryToken:(id)a4 withContext:(id)a5 completion:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[CDPDEDPRecoveryController secretValidator:didRequestValidateEDPRecoveryToken:withContext:completion:]";
    __int16 v16 = 1024;
    int v17 = 788;
    _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v14, 0x12u);
  }

  [(CDPDEDPRecoveryController *)self setCdpContext:v10];
  __int16 v13 = [(CDPDEDPRecoveryController *)self pcsController];
  [v13 setContext:v10];

  [(CDPDEDPRecoveryController *)self validateEDPRecoveryToken:v11 completion:v9];
}

- (void)_postRepairEDPCDPFollowUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Posting the Fix All (EDP and CDP) CFU", v2, v3, v4, v5, v6);
}

- (void)_clearEDPFollowUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Clearing the EDP only fix CFU", v2, v3, v4, v5, v6);
}

- (void)clearCDPEDPFollowUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Clearing the fix all (CDP+EDP) CFU", v2, v3, v4, v5, v6);
}

- (void)_clearAllEDPFollowUps
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Clearing all EDP CFUs - EDP only and fix all (EDP+CDP)", v2, v3, v4, v5, v6);
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void)setCdpContext:(id)a3
{
}

- (CDPDPCSController)pcsController
{
  return self->_pcsController;
}

- (void)setPcsController:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (CDPDAuthProviderInternal)authProvider
{
  return self->_authProvider;
}

- (void)setAuthProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authProvider, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_pcsController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

- (void)_refreshContextWithSilentAuthWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "SRP password metadata exists.", v2, v3, v4, v5, v6);
}

void __73__CDPDEDPRecoveryController__refreshContextWithSilentAuthWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "SRP password metadata still does not exist after refreshing with silent auth", v2, v3, v4, v5, v6);
}

- (void)setupEDPStateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_recoveryMethodAvailable was set. Refreshing the context with a silent auth...", v2, v3, v4, v5, v6);
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_70_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "EDP: setupEDPStateWithCompletion: no password metadata available. Failing with %@. Returning early.", v2, v3, v4, v5, v6);
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "EDP recovery controller was deallocated", v2, v3, v4, v5, v6);
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  __int16 v3 = 2048;
  uint64_t v4 = 1;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_218640000, v1, OS_LOG_TYPE_ERROR, "%@: setupEDPStateWithCompletion failed to setup with state:%lu and error:%@", v2, 0x20u);
}

void __57__CDPDEDPRecoveryController_setupEDPStateWithCompletion___block_invoke_71_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@: got recovery token from PCS.", v2, v3, v4, v5, v6);
}

- (void)performInitialInteractiveEDPRepairWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Performing initial interactive EDP repair if needed, and checking if recovery token is needed", v2, v3, v4, v5, v6);
}

void __78__CDPDEDPRecoveryController_performInitialInteractiveEDPRepairWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "EDP state is already good. No need for interactive repair.", v2, v3, v4, v5, v6);
}

void __78__CDPDEDPRecoveryController_performInitialInteractiveEDPRepairWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "EDP state is %lu. Initial interactive repair is needed.", v2, v3, v4, v5, v6);
}

- (void)repairEDPStateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218640000, v0, v1, "%@: Impossible to silent repair or interactive repair during repairEDPStateWithCompletion", v2, v3, v4, v5, v6);
}

- (void)repairEDPStateWithCompletion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 uiProvider];
  uint64_t v5 = [a1 cdpContext];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = [v5 type];
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "%@: repairEDPStateWithCompletion gets called, uiProvider is: %@, cdpContextType is:%lu", (uint8_t *)&v6, 0x20u);
}

void __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Initiating silent EDP password change....", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController__silentPasswordChangeWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "EDP: password change: repairEDPStateWithCompletion: no password metadata available. Failing with %@. Returning early.", v2, v3, v4, v5, v6);
}

void __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "EDP controller was deallocated", v1, 2u);
}

void __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Initiating silent EDP repair via Password....", v2, v3, v4, v5, v6);
}

void __66__CDPDEDPRecoveryController_silentlyRepairEDPStateWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "EDP: silent repair via password: no password metadata available. Failing with %@. Returning early.", v2, v3, v4, v5, v6);
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: User canceled the interactive auth during repairEDPStateWithCompletion. Error: %@, not offering recovery token yet");
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: UI provider failed to perform interactive authentication during repairEDPStateWithCompletion. Error: %@, offering recovery token");
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@: Interactive auth completed during repairEDPStateWithCompletion", v2, v3, v4, v5, v6);
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_83_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@: EDP state is good, clearing EDP followup!", v2, v3, v4, v5, v6);
}

void __62__CDPDEDPRecoveryController__interactiveRepairWithCompletion___block_invoke_83_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@: Recovery Token needed, clearing EDP followup and post fix-all followup", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "EDP: validateEDPIdentitiesWithCompletion: no password metadata available. Failing with %@. Returning early.", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "EDP state good", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v2 = 2048;
  uint64_t v3 = 2;
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Failed to validate EDP identities with error: %{public}@, state: %ld", v1, 0x16u);
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 10;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "EDP only repair needed, flags: %ld, error: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __65__CDPDEDPRecoveryController_validateEDPIdentitiesWithCompletion___block_invoke_86_cold_4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "EDP+CDP repair needed, flags: %ld, error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Token recovery failed due to error %@", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Token successfully validated", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController_validateEDPRecoveryToken_completion___block_invoke_92_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Token was not valid. Error=%@", v2, v3, v4, v5, v6);
}

void __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "[CDPDEDPRecoveryController] Updating account with generated tokenID: %@ failed. Error: %@");
}

void __81__CDPDEDPRecoveryController__updateAccountPropertiesWithTokenInfoWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to getRecoveryToken with error: %@", v2, v3, v4, v5, v6);
}

void __65__CDPDEDPRecoveryController_fetchEDPRecoveryTokenWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Denying access to fetchEDPRecoveryToken due to edp ineligiblity with value: %@", v2, v3, v4, v5, v6);
}

void __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "edpState is not present in userInfo", v2, v3, v4, v5, v6);
}

void __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "edpState is present in userInfo", v2, v3, v4, v5, v6);
}

void __62__CDPDEDPRecoveryController__refreshedEDPStateWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to get updated edpState value from server with error: %@", v2, v3, v4, v5, v6);
}

- (void)resetProtectedDataShouldJoinCDP:edpOnly:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@: Calling resetProtectedData on PCS...", v2, v3, v4, v5, v6);
}

void __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@: Clearing CDPEDP CFU after RPD...", v2, v3, v4, v5, v6);
}

void __84__CDPDEDPRecoveryController_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to perform RPD with error: %@", v2, v3, v4, v5, v6);
}

- (void)secretValidator:(uint64_t)a3 recoverSecureBackupWithContext:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)secretValidator:(uint64_t)a3 validateRecoveryKeyWithContext:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
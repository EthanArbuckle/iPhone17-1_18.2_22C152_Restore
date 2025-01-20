@interface CDPDRecoveryValidatedJoinFlowController
- (BOOL)_isProbationActive;
- (BOOL)_isWalrusEnabled;
- (BOOL)secretValidator:(id)a3 shouldAcceptRecoveryError:(id *)a4;
- (BOOL)shouldOfferPiggybackingBasedRecovery;
- (NSArray)cdpDevices;
- (id)_accountResetRecoveryOptionWithCompletion:(id)a3;
- (id)_cancelRecoveryOptionWithCompletion:(id)a3;
- (id)_custodianRecoveryOptionWithCompletion:(id)a3;
- (id)_deviceSelectionRecoveryOptionWithCompletion:(id)a3;
- (id)_edpRecoveryTokenOptionWithCompletion:(id)a3;
- (id)_entryHardLimitCustodianRecoveryAvailableBodyForDevice:(id)a3;
- (id)_entryHardLimitDeviceSelectionAvailableBodyForDevice:(id)a3;
- (id)_entryHardLimitEDPRecoveryTokenAvailableBodyForDevice:(id)a3;
- (id)_entryHardLimitNoResetForSignInForDevice:(id)a3;
- (id)_entryHardLimitPiggybackingAvailableBodyForDevice:(id)a3;
- (id)_entryHardLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:(id)a3;
- (id)_entryHardLimitRecoveryKeyAvailableBodyForDevice:(id)a3;
- (id)_entryHardLimitRepairBodyForDevice:(id)a3;
- (id)_entryLimitCustodianRecoveryAvailableBodyForDevice:(id)a3;
- (id)_entryLimitDeviceSelectionAvailableBodyForDevice:(id)a3;
- (id)_entryLimitNoResetForDevice:(id)a3;
- (id)_entryLimitNoResetForRepairForDevice:(id)a3;
- (id)_entryLimitPiggybackingAvailableBodyForDevice:(id)a3;
- (id)_entryLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:(id)a3;
- (id)_entryLimitRecoveryKeyAvailableBodyForDevice:(id)a3;
- (id)_entryLimitResetAvailableBodyForDevice:(id)a3;
- (id)_entryLimitSignInBodyForDevice:(id)a3;
- (id)_entryLimitTitleForDevice:(id)a3;
- (id)_fallbackRecoveryOptionsForLimitType:(unint64_t)a3 withCompletion:(id)a4;
- (id)_hardLimitErrorBodyWithDevice:(id)a3;
- (id)_infoDictionaryWithTitle:(id)a3 andBody:(id)a4;
- (id)_limitErrorBodyForDevice:(id)a3 limitType:(unint64_t)a4;
- (id)_piggybackingRecoveryOptionWithCompletion:(id)a3;
- (id)_recoveryKeyRecoveryOptionWithCompletion:(id)a3;
- (id)_recoveryMethodRecoveryOptionWithCompletion:(id)a3;
- (id)_resetDataErrorForCurrentContextWithRecoveryIndexMap:(id)a3;
- (id)_resetProtectedDataErrorUnrecoverable;
- (id)_skipErrorUnrecoverable;
- (id)_skipSignInRecoveryOptionWithCompletion:(id)a3;
- (id)_tryAgainLaterOptionWithCompletion:(id)a3;
- (id)_userInfoForLimit:(unint64_t)a3 withDevice:(id)a4;
- (void)_addEDPEscapeOfferIfNeededToValidator:(id)a3 nonCancelCompletion:(id)a4;
- (void)_escapeOfferForDevices:(id)a3 remoteApproval:(BOOL)a4 forMultipleICSC:(BOOL)a5 completion:(id)a6;
- (void)_handleHardLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4;
- (void)_handleLimit:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5;
- (void)_handleNoRecoveryFactorsWithMask:(unint64_t)a3 validator:(id)a4;
- (void)_handleResetOptionWithResetRequested:(BOOL)a3 localSecret:(id)a4 validator:(id)a5;
- (void)_handleSoftLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4;
- (void)_populateUserInfo:(id)a3 recoveryIndexHandlers:(id)a4 withRecoveryOptions:(id)a5;
- (void)_shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:(id)a3;
- (void)_showAccountResetConfirmationWithCompletion:(id)a3;
- (void)_showEntryLimitError:(id)a3 withRecoveryOptionHandlers:(id)a4 defaultIndex:(int64_t)a5 completion:(id)a6;
- (void)_showQuotaScreenWithCompletion:(id)a3;
- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5;
- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:(id)a3;
- (void)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 validationHandler:(id)a5 completion:(id)a6;
- (void)remoteSecretValidator:(id)a3 applyToJoinCircleWithJoinHandler:(id)a4;
- (void)remoteSecretValidator:(id)a3 attemptCircleJoinWithPiggybackingContext:(id)a4 completion:(id)a5;
- (void)remoteSecretValidator:(id)a3 attemptCustodianRecoveryWithInfo:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 didFailRecovery:(id)a4 withError:(id)a5 completion:(id)a6;
- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5;
- (void)secretValidatorWillAttemptRecovery;
- (void)setCdpDevices:(id)a3;
- (void)shouldOfferPiggybackingBasedRecovery;
@end

@implementation CDPDRecoveryValidatedJoinFlowController

- (void)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 validationHandler:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v13 = self;
  v22 = v13;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __117__CDPDRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_validationHandler_completion___block_invoke;
  v16[3] = &unk_26432F2A0;
  v19 = v21;
  BOOL v20 = v8;
  id v14 = v11;
  id v17 = v14;
  id v15 = v12;
  id v18 = v15;
  [(CDPDRecoveryValidatedJoinFlowController *)v13 _escapeOfferForDevices:v10 remoteApproval:0 forMultipleICSC:v8 completion:v16];

  _Block_object_dispose(v21, 8);
}

void __117__CDPDRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_validationHandler_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [CDPDRemoteDeviceSecretValidator alloc];
  v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) recoveryContext];
  v6 = [v5 context];
  v7 = [(CDPDDeviceSecretValidator *)v4 initWithContext:v6 delegate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  [(CDPDDeviceSecretValidator *)v7 setIsUsingMultipleICSC:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __117__CDPDRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_validationHandler_completion___block_invoke_2;
  id v14 = &unk_26432F278;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v8;
  uint64_t v16 = v9;
  [(CDPDRemoteDeviceSecretValidator *)v7 setValidSecretHandler:&v11];
  -[CDPDDeviceSecretValidator setSupportedEscapeOfferMask:](v7, "setSupportedEscapeOfferMask:", a2, v11, v12, v13, v14);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, CDPDRemoteDeviceSecretValidator *))(v10 + 16))(v10, v7);
  }
}

void __117__CDPDRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_validationHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (BOOL)shouldOfferPiggybackingBasedRecovery
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F34400] isInternalBuild]
    && CFPreferencesGetAppBooleanValue(@"offerPiggybackingForCDPRepair", @"com.apple.corecdp", 0))
  {
    uint64_t v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryValidatedJoinFlowController shouldOfferPiggybackingBasedRecovery]();
    }
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = [MEMORY[0x263F290F0] sharedInstance];
    v6 = [(CDPDRecoveryFlowController *)self recoveryContext];
    v7 = [v6 context];
    id v8 = [v7 altDSID];
    uint64_t v3 = [v5 authKitAccountWithAltDSID:v8];

    uint64_t v9 = [MEMORY[0x263F290F0] sharedInstance];
    int v10 = [v9 piggybackingApprovalEligible:v3];

    int v11 = [MEMORY[0x263F34400] isCDPRepairWithProximityBasedPiggybackingEnabled];
    uint64_t v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [(CDPDRecoveryFlowController *)self recoveryContext];
      id v18 = [v17 context];
      v19[0] = 67109632;
      v19[1] = v11;
      __int16 v20 = 2048;
      uint64_t v21 = [v18 type];
      __int16 v22 = 1024;
      int v23 = v10;
      _os_log_debug_impl(&dword_218640000, v12, OS_LOG_TYPE_DEBUG, "piggybackingBasedCDPRecoveryFeatureEnabled = %d CDPRepairContext = %ld piggybackingApprovalEligible = %d", (uint8_t *)v19, 0x18u);
    }
    if (v11)
    {
      v13 = (void *)MEMORY[0x263F34350];
      id v14 = [(CDPDRecoveryFlowController *)self recoveryContext];
      id v15 = [v14 context];
      int v4 = objc_msgSend(v13, "isSubsetOfContextTypeRepair:", objc_msgSend(v15, "type")) & v10;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

- (void)_escapeOfferForDevices:(id)a3 remoteApproval:(BOOL)a4 forMultipleICSC:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v9 = (void (**)(id, uint64_t))a6;
  id v10 = a3;
  int v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:completion:](self, v11);
  }

  unint64_t v12 = [v10 count];
  if (v12 < 2)
  {
    uint64_t v14 = 1;
  }
  else
  {
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Escape available: other devices", buf, 2u);
    }

    uint64_t v14 = 3;
  }
  if (([MEMORY[0x263F34400] isVirtualMachine] & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x263F34350];
    uint64_t v16 = [(CDPDRecoveryFlowController *)self recoveryContext];
    id v17 = [v16 context];
    LOBYTE(v15) = objc_msgSend(v15, "isSubsetOfContextTypeRepair:", objc_msgSend(v17, "type"));

    if ((v15 & 1) != 0 || !v6)
    {
      id v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Escape available: account reset", buf, 2u);
      }

      v14 |= 8uLL;
    }
  }
  v19 = (void *)MEMORY[0x263F34350];
  __int16 v20 = [(CDPDRecoveryFlowController *)self recoveryContext];
  uint64_t v21 = [v20 context];
  LODWORD(v19) = objc_msgSend(v19, "isSubsetOfContextTypeSignIn:", objc_msgSend(v21, "type"));

  if (v19)
  {
    __int16 v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Escape available: skip flow", buf, 2u);
    }

    v14 |= 0x10uLL;
  }
  int v23 = [(CDPDRecoveryFlowController *)self secureBackupController];
  id v33 = 0;
  int v24 = [v23 supportsRecoveryKeyWithError:&v33];
  id v25 = v33;

  if (v24)
  {
    v26 = _CDPLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "Escape available: recovery key", buf, 2u);
    }

    v14 |= 0x20uLL;
  }
  if (v25)
  {
    v27 = _CDPLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CDPDRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:completion:]();
    }
  }
  v28 = [(CDPDRecoveryFlowController *)self recoveryContext];
  v29 = [v28 context];
  int v30 = [v29 _supportsCustodianRecovery];

  if (v30)
  {
    v31 = _CDPLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v31, OS_LOG_TYPE_DEFAULT, "Escape available: Custodian Recovery", buf, 2u);
    }

    v14 |= 0x40uLL;
  }
  if ([(CDPDRecoveryValidatedJoinFlowController *)self shouldOfferPiggybackingBasedRecovery])
  {
    v32 = _CDPLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v32, OS_LOG_TYPE_DEFAULT, "Escape available: Piggybacking", buf, 2u);
    }

    v14 |= 0x80uLL;
  }
  if (v9) {
    v9[2](v9, v14);
  }
}

- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __113__CDPDRecoveryValidatedJoinFlowController_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator___block_invoke;
  uint64_t v16 = &unk_26432F2C8;
  id v17 = v9;
  id v18 = self;
  id v19 = v8;
  BOOL v20 = a4;
  id v10 = v8;
  id v11 = v9;
  unint64_t v12 = _Block_copy(&v13);
  -[CDPDRecoveryValidatedJoinFlowController _addEDPEscapeOfferIfNeededToValidator:nonCancelCompletion:](self, "_addEDPEscapeOfferIfNeededToValidator:nonCancelCompletion:", v11, v12, v13, v14, v15, v16);
}

void __113__CDPDRecoveryValidatedJoinFlowController_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) supportedEscapeOfferMask];
  if ((v2 & 0x20) != 0)
  {
    int v6 = 0;
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) recoveryContext];
    int v4 = [v3 context];
    int v5 = [v4 _recoveryMethodAvailable];

    int v6 = v5 ^ 1;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 48));
  uint64_t v7 = [*(id *)(a1 + 48) count];
  if ((v2 & 0x1C0) != 0 || v7 != 0 || v6 == 0)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    v16.receiver = *(id *)(a1 + 40);
    v16.super_class = (Class)CDPDRecoveryValidatedJoinFlowController;
    objc_msgSendSuper2(&v16, sel_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator_, v10, v11, v12);
  }
  else if ((v2 & 8) != 0)
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "User attempted to sign in after burning out all recovery options, present hard limits", buf, 2u);
    }

    [*(id *)(a1 + 40) _handleNoRecoveryFactorsWithMask:v2 validator:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 32);
    _CDPStateError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v13 cancelValidationWithError:v15];
  }
}

- (void)_addEDPEscapeOfferIfNeededToValidator:(id)a3 nonCancelCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryValidatedJoinFlowController _addEDPEscapeOfferIfNeededToValidator:nonCancelCompletion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __101__CDPDRecoveryValidatedJoinFlowController__addEDPEscapeOfferIfNeededToValidator_nonCancelCompletion___block_invoke;
  v11[3] = &unk_26432EDC0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(CDPDRecoveryValidatedJoinFlowController *)self _shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:v11];
}

void __101__CDPDRecoveryValidatedJoinFlowController__addEDPEscapeOfferIfNeededToValidator_nonCancelCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if ((objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5307) & 1) != 0
    || objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7003))
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __101__CDPDRecoveryValidatedJoinFlowController__addEDPEscapeOfferIfNeededToValidator_nonCancelCompletion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) cancelValidationWithError:v5];
  }
  else
  {
    if (a2)
    {
      id v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __101__CDPDRecoveryValidatedJoinFlowController__addEDPEscapeOfferIfNeededToValidator_nonCancelCompletion___block_invoke_cold_2();
      }

      objc_msgSend(*(id *)(a1 + 32), "setSupportedEscapeOfferMask:", objc_msgSend(*(id *)(a1 + 32), "supportedEscapeOfferMask") | 0x100);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  if ([(CDPDRecoveryValidatedJoinFlowController *)self _isWalrusEnabled])
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryValidatedJoinFlowController _shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:]();
    }

    id v6 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    v4[2](v4, 0, v6);
  }
  else
  {
    id v7 = [(CDPDRecoveryFlowController *)self recoveryContext];
    id v6 = [v7 context];

    int v8 = [v6 type] == 2 || objc_msgSend(v6, "type") == 1;
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(CDPDRecoveryValidatedJoinFlowController *)v6 _shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:v9];
    }

    if (v8)
    {
      id v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CDPDRecoveryValidatedJoinFlowController _shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:]();
      }

      uint64_t v11 = [(CDPDRecoveryFlowController *)self edpController];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __99__CDPDRecoveryValidatedJoinFlowController__shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion___block_invoke;
      v12[3] = &unk_26432F2F0;
      id v13 = v4;
      [v11 performInitialInteractiveEDPRepairWithCompletion:v12];
    }
    else if (v4)
    {
      v4[2](v4, 0, 0);
    }
  }
}

void __99__CDPDRecoveryValidatedJoinFlowController__shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __99__CDPDRecoveryValidatedJoinFlowController__shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion___block_invoke_cold_1(a3, (uint64_t)v6, v7);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a3, v6);
  }
}

- (void)remoteSecretValidator:(id)a3 applyToJoinCircleWithJoinHandler:(id)a4
{
  id v5 = a4;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryValidatedJoinFlowController remoteSecretValidator:applyToJoinCircleWithJoinHandler:]();
  }

  id v7 = [(CDPDRecoveryFlowController *)self circleController];
  [v7 applyToJoinCircleWithJoinHandler:v5];
}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:(id)a3
{
  int v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryValidatedJoinFlowController cancelRemoteSecretValidatorApplicationToJoinCircle:]();
  }

  id v5 = [(CDPDRecoveryFlowController *)self circleController];
  [v5 cancelApplicationToJoinCircle];
}

- (void)remoteSecretValidator:(id)a3 attemptCustodianRecoveryWithInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CDPDRecoveryFlowController *)self circleController];
  id v10 = [v9 circleProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke;
  v12[3] = &unk_26432F318;
  id v13 = v7;
  id v11 = v7;
  [v10 recoverOctagonUsingCustodianInfo:v8 completion:v12];
}

void __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke_cold_1(v3 == 0, (uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteSecretValidator:(id)a3 attemptCircleJoinWithPiggybackingContext:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CDPDRecoveryFlowController *)self circleController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke;
  v11[3] = &unk_26432F340;
  id v12 = v7;
  id v10 = v7;
  [v9 joinCircleWithContext:v8 completion:v11];
}

void __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  char v6 = [a2 didJoin];
  id v7 = _CDPLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_1();
    }
  }
  else if (v8)
  {
    __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)secretValidatorWillAttemptRecovery
{
  id v2 = [(CDPDRecoveryFlowController *)self circleController];
  [v2 prepareCircleStateForRecovery];
}

- (BOOL)secretValidator:(id)a3 shouldAcceptRecoveryError:(id *)a4
{
  return 1;
}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to recover a record with context: %@", buf, 0xCu);
  }

  id v10 = [(CDPDRecoveryFlowController *)self secureBackupController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke;
  v12[3] = &unk_26432F368;
  id v13 = v8;
  id v11 = v8;
  [v10 performEscrowRecoveryWithRecoveryContext:v7 completion:v12];
}

void __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 recoveredClique];

  id v8 = _CDPLogSystem();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 recoveredClique];
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Recovered a clique: %@", (uint8_t *)&v12, 0xCu);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke_cold_1();
    }

    id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v11();
}

- (void)secretValidator:(id)a3 didFailRecovery:(id)a4 withError:(id)a5 completion:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13) {
    -[CDPDRecoveryValidatedJoinFlowController secretValidator:didFailRecovery:withError:completion:]();
  }
  uint64_t v14 = (void (**)(void, void, void))v13;
  if ([v12 isLoginHardLimit])
  {
    [(CDPDRecoveryValidatedJoinFlowController *)self _handleHardLimitErrorForCurrentContextWithDevice:v11 completion:v14];
  }
  else if ([v12 isLoginSoftLimit])
  {
    [(CDPDRecoveryValidatedJoinFlowController *)self _handleSoftLimitErrorForCurrentContextWithDevice:v11 completion:v14];
  }
  else
  {
    uint64_t v15 = objc_msgSend(v12, "cdp_isCDPErrorWithCode:", -5206) ^ 1;
    uint64_t v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v15;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Non-terminating error detected, with retry option: %{BOOL}d", (uint8_t *)v17, 8u);
    }

    ((void (**)(void, uint64_t, id))v14)[2](v14, v15, v12);
  }
}

- (void)_handleHardLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Starting handling hard limit error...", v9, 2u);
  }

  [(CDPDRecoveryValidatedJoinFlowController *)self _handleLimit:2 forDevice:v7 completion:v6];
}

- (void)_handleSoftLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Starting handling soft limit error...", v9, 2u);
  }

  [(CDPDRecoveryValidatedJoinFlowController *)self _handleLimit:1 forDevice:v7 completion:v6];
}

- (void)_handleLimit:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v66 = v8;
  v70 = [(CDPDRecoveryValidatedJoinFlowController *)self _userInfoForLimit:a3 withDevice:v8];
  v69 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v10 = (void *)MEMORY[0x263F202A8];
  id v11 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v12 = [v11 context];
  id v13 = (void *)MEMORY[0x263F34798];
  if (a3 != 1) {
    id v13 = (void *)MEMORY[0x263F34648];
  }
  uint64_t v14 = [v10 analyticsEventWithContext:v12 eventName:*v13 category:*MEMORY[0x263F34830]];

  uint64_t v15 = [(CDPDRecoveryValidatedJoinFlowController *)self _fallbackRecoveryOptionsForLimitType:a3 withCompletion:v9];
  v71 = [(CDPDRecoveryValidatedJoinFlowController *)self _cancelRecoveryOptionWithCompletion:v9];
  v67 = v9;
  uint64_t v16 = [(CDPDRecoveryValidatedJoinFlowController *)self _tryAgainLaterOptionWithCompletion:v9];
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v65 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v82 != v21) {
          objc_enumerationMutation(v18);
        }
        int v23 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if (v23)
        {
          int v24 = [v23 telemetryRecoveryOption];
          [v17 addObject:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v20);
  }

  if (v71) {
    [v68 addObject:v71];
  }
  if (v16) {
    [v72 addObject:v16];
  }
  id v25 = [(CDPDRecoveryFlowController *)self validator];
  __int16 v26 = [v25 supportedEscapeOfferMask];

  if ((v26 & 0x82) != 0)
  {
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v18];
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v72];
    v27 = v16;
    if (!v16) {
      goto LABEL_62;
    }
    goto LABEL_32;
  }
  if ((v26 & 0x160) != 0)
  {
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v18];
    if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled]) {
      id v28 = v72;
    }
    else {
      id v28 = v68;
    }
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v28];
    int v29 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
    if (v16 && v29)
    {
      v27 = v16;
    }
    else
    {
      if (!v71) {
        goto LABEL_62;
      }
      v27 = v71;
    }
LABEL_32:
    v31 = [v27 telemetryRecoveryOption];
    [v17 addObject:v31];
LABEL_33:

    goto LABEL_62;
  }
  int v30 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
  if ((v26 & 8) == 0)
  {
    if (!v30)
    {
      uint64_t v36 = [(CDPDRecoveryValidatedJoinFlowController *)self _skipSignInRecoveryOptionWithCompletion:v67];
      v31 = (void *)v36;
      if (v36)
      {
        uint64_t v85 = v36;
        v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
        [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v37];
      }
      v38 = [v31 telemetryRecoveryOption];
      [v17 addObject:v38];

      goto LABEL_33;
    }
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v72];
    if (!v16) {
      goto LABEL_62;
    }
    v27 = v16;
    goto LABEL_32;
  }
  if (!v30)
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke_2;
    v73[3] = &unk_26432F390;
    id v75 = v67;
    unint64_t v76 = a3;
    v73[4] = self;
    id v74 = v66;
    v39 = [(CDPDRecoveryValidatedJoinFlowController *)self _accountResetRecoveryOptionWithCompletion:v73];
    if (v39)
    {
      [v65 addObject:v39];
      if (a3 == 2)
      {
        if (![v18 count])
        {
          v40 = self;
          v42 = v69;
          v41 = v70;
          id v43 = v65;
LABEL_52:
          [(CDPDRecoveryValidatedJoinFlowController *)v40 _populateUserInfo:v41 recoveryIndexHandlers:v42 withRecoveryOptions:v43];
LABEL_55:
          v46 = [v39 telemetryRecoveryOption];
          [v17 addObject:v46];

          v31 = v75;
          goto LABEL_33;
        }
LABEL_51:
        [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v18];
        v40 = self;
        v41 = v70;
        v42 = v69;
        id v43 = v68;
        goto LABEL_52;
      }
    }
    else if (a3 == 2)
    {
      goto LABEL_51;
    }
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v72];
    if (v16)
    {
      v45 = [v16 telemetryRecoveryOption];
      [v17 addObject:v45];
    }
    goto LABEL_55;
  }
  if (a3 == 2)
  {
    v32 = (void *)MEMORY[0x263F34350];
    id v33 = [(CDPDRecoveryFlowController *)self recoveryContext];
    v34 = [v33 context];
    LODWORD(v32) = objc_msgSend(v32, "isSubsetOfContextTypeSignIn:", objc_msgSend(v34, "type"));

    if (!v32)
    {
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke;
      v77[3] = &unk_26432F390;
      v77[4] = self;
      id v79 = v67;
      uint64_t v80 = 2;
      id v78 = v66;
      v47 = [(CDPDRecoveryValidatedJoinFlowController *)self _accountResetRecoveryOptionWithCompletion:v77];
      if (v47) {
        [v65 addObject:v47];
      }
      [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v65];
      v48 = [v47 telemetryRecoveryOption];
      [v17 addObject:v48];

      [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v68];
      if (v71)
      {
        v49 = [v71 telemetryRecoveryOption];
        [v17 addObject:v49];
      }
      v35 = v79;
      goto LABEL_61;
    }
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v72];
    if (v16)
    {
      v35 = [v16 telemetryRecoveryOption];
      [v17 addObject:v35];
LABEL_61:
    }
  }
  else if (a3 == 1)
  {
    [(CDPDRecoveryValidatedJoinFlowController *)self _populateUserInfo:v70 recoveryIndexHandlers:v69 withRecoveryOptions:v72];
    if (v16)
    {
      v44 = [v16 telemetryRecoveryOption];
      [v17 addObject:v44];
    }
  }
LABEL_62:
  v50 = _CDPStateError();
  v51 = objc_msgSend(v17, "aaf_arrayAsCommaSeperatedString");
  [v14 setObject:v51 forKeyedSubscript:*MEMORY[0x263F345E8]];

  v52 = NSNumber;
  v53 = [(CDPDRecoveryFlowController *)self recoveryContext];
  v54 = [v53 context];
  v55 = objc_msgSend(v52, "numberWithInteger:", objc_msgSend(v54, "totalEscrowDeviceCount"));
  [v14 setObject:v55 forKeyedSubscript:*MEMORY[0x263F347A8]];

  v56 = NSNumber;
  v57 = [(CDPDRecoveryFlowController *)self recoveryContext];
  v58 = [v57 context];
  v59 = objc_msgSend(v56, "numberWithInteger:", objc_msgSend(v58, "validEscrowDeviceCount"));
  [v14 setObject:v59 forKeyedSubscript:*MEMORY[0x263F347B0]];

  v60 = NSNumber;
  v61 = [(CDPDRecoveryFlowController *)self recoveryContext];
  v62 = [v61 context];
  v63 = objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v62, "totalRecoveryAttempts"));
  [v14 setObject:v63 forKeyedSubscript:*MEMORY[0x263F34680]];

  v64 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v64 sendEvent:v14];

  [(CDPDRecoveryValidatedJoinFlowController *)self _showEntryLimitError:v50 withRecoveryOptionHandlers:v69 defaultIndex:0 completion:v67];
}

void __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke(void *a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = a1[6];
    _CDPStateError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v7);
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v4 = a1[7];
    id v6 = (void *)a1[4];
    [v6 _handleLimit:v4 forDevice:v3 completion:v5];
  }
}

void __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = a1[6];
    _CDPStateError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v7);
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v4 = a1[7];
    id v6 = (void *)a1[4];
    [v6 _handleLimit:v4 forDevice:v3 completion:v5];
  }
}

- (void)_populateUserInfo:(id)a3 recoveryIndexHandlers:(id)a4 withRecoveryOptions:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = *MEMORY[0x263F08340];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v14)
        {
          uint64_t v15 = [v7 objectForKeyedSubscript:v12];
          if (v15)
          {
            uint64_t v16 = [v7 objectForKeyedSubscript:v12];
            id v17 = (void *)[v16 mutableCopy];
          }
          else
          {
            id v17 = [MEMORY[0x263EFF980] array];
          }

          id v18 = [v14 localizedRecoveryOption];
          [v17 addObject:v18];

          uint64_t v19 = [v14 recoveryHandler];
          uint64_t v20 = _Block_copy(v19);
          uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
          [v8 setObject:v20 forKeyedSubscript:v21];

          [v7 setObject:v17 forKeyedSubscript:v12];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (id)_userInfoForLimit:(unint64_t)a3 withDevice:(id)a4
{
  id v6 = a4;
  if (a3 != 2)
  {
    if (a3 != 1)
    {
      uint64_t v11 = 0;
      goto LABEL_10;
    }
    id v7 = self;
    id v8 = v6;
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  if (![MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    id v7 = self;
    id v8 = v6;
    uint64_t v9 = 2;
LABEL_8:
    uint64_t v10 = [(CDPDRecoveryValidatedJoinFlowController *)v7 _limitErrorBodyForDevice:v8 limitType:v9];
    goto LABEL_9;
  }
  uint64_t v10 = [(CDPDRecoveryValidatedJoinFlowController *)self _hardLimitErrorBodyWithDevice:v6];
LABEL_9:
  uint64_t v11 = (void *)v10;
LABEL_10:
  uint64_t v12 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitTitleForDevice:v6];
  id v13 = [(CDPDRecoveryValidatedJoinFlowController *)self _infoDictionaryWithTitle:v12 andBody:v11];

  return v13;
}

- (id)_fallbackRecoveryOptionsForLimitType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to fallback recovery options...", buf, 2u);
  }

  uint64_t v9 = [(CDPDRecoveryFlowController *)self validator];
  int v10 = [v9 supportedEscapeOfferMask];

  if ((v10 & 2) != 0)
  {
    uint64_t v11 = [(CDPDRecoveryValidatedJoinFlowController *)self _deviceSelectionRecoveryOptionWithCompletion:v6];
    goto LABEL_17;
  }
  if ((v10 & 0x80) != 0)
  {
    uint64_t v11 = [(CDPDRecoveryValidatedJoinFlowController *)self _piggybackingRecoveryOptionWithCompletion:v6];
    goto LABEL_17;
  }
  if ((~v10 & 0x60) == 0)
  {
    if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
    {
      uint64_t v11 = [(CDPDRecoveryValidatedJoinFlowController *)self _recoveryMethodRecoveryOptionWithCompletion:v6];
LABEL_17:
      uint64_t v12 = (void *)v11;
      [v7 addObject:v11];

      goto LABEL_18;
    }
LABEL_15:
    uint64_t v11 = [(CDPDRecoveryValidatedJoinFlowController *)self _recoveryKeyRecoveryOptionWithCompletion:v6];
    goto LABEL_17;
  }
  if ((v10 & 0x20) != 0) {
    goto LABEL_15;
  }
  if ((v10 & 0x40) != 0)
  {
    uint64_t v11 = [(CDPDRecoveryValidatedJoinFlowController *)self _custodianRecoveryOptionWithCompletion:v6];
    goto LABEL_17;
  }
  if (a3 == 2 && (v10 & 0x100) != 0)
  {
    uint64_t v11 = [(CDPDRecoveryValidatedJoinFlowController *)self _edpRecoveryTokenOptionWithCompletion:v6];
    goto LABEL_17;
  }
LABEL_18:
  if (![v7 count])
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "No fallback available", v15, 2u);
    }
  }
  return v7;
}

- (id)_skipSignInRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Skip", buf, 2u);
  }

  uint64_t v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_OK"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F34858]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__CDPDRecoveryValidatedJoinFlowController__skipSignInRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __83__CDPDRecoveryValidatedJoinFlowController__skipSignInRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_accountResetRecoveryOptionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Reset", buf, 2u);
  }

  id v6 = objc_alloc_init(CDPDRecoveryOption);
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled]) {
    [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA" inTable:@"Localizable-Walrus"];
  }
  else {
  id v7 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_RESET"];
  }
  id v8 = [v7 localizedString];
  [(CDPDRecoveryOption *)v6 setLocalizedRecoveryOption:v8];

  [(CDPDRecoveryOption *)v6 setTelemetryRecoveryOption:*MEMORY[0x263F34918]];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke;
  v11[3] = &unk_26432F430;
  void v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  [(CDPDRecoveryOption *)v6 setRecoveryHandler:v11];

  return v6;
}

void __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v2, OS_LOG_TYPE_DEFAULT, "User elected to Reset Encrypted Data, confirming...", buf, 2u);
  }

  int v3 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_67;
    v7[3] = &unk_26432F3E0;
    v7[4] = v4;
    [v4 _showQuotaScreenWithCompletion:v7];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_2;
    v5[3] = &unk_26432F408;
    id v6 = *(id *)(a1 + 40);
    [v4 _showAccountResetConfirmationWithCompletion:v5];
  }
}

void __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 validator];
  [v4 _handleResetOptionWithResetRequested:a2 localSecret:v5 validator:v6];
}

uint64_t __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleResetOptionWithResetRequested:(BOOL)a3 localSecret:(id)a4 validator:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v6)
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:].cold.4();
    }
    goto LABEL_13;
  }
  int v10 = [(CDPDRecoveryFlowController *)self uiProvider];

  id v11 = _CDPLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (!v10)
  {
    if (v12) {
      -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:](v11, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_13:

    int v29 = [(CDPDRecoveryFlowController *)self validator];
    int v30 = _CDPStateError();
    [v29 cancelValidationWithError:v30];

LABEL_14:
    goto LABEL_15;
  }
  if (v12) {
    -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:](v11, v13, v14, v15, v16, v17, v18, v19);
  }

  uint64_t v20 = (void *)MEMORY[0x263F34328];
  uint64_t v21 = [(CDPDRecoveryFlowController *)self recoveryContext];
  __int16 v22 = [v21 context];
  long long v23 = [v22 dsid];
  long long v24 = [v23 stringValue];
  int v25 = [v20 isICDPEnabledForDSID:v24];

  if (v8 || !v25)
  {
    v31 = _CDPLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:](v31, v32, v33, v34, v35, v36, v37, v38);
    }

    int v29 = [(CDPDRecoveryFlowController *)self validator];
    [v29 resetAccountCDPStateWithEscapeOptionsOffered:1 andSetSecret:v8];
    goto LABEL_14;
  }
  long long v26 = [(CDPDRecoveryFlowController *)self uiProvider];
  v27 = [(CDPDRecoveryFlowController *)self recoveryContext];
  uint64_t v28 = [v27 context];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke;
  v39[3] = &unk_26432F458;
  v39[4] = self;
  id v40 = v9;
  [v26 cdpContext:v28 createLocalSecretWithCompletion:v39];

LABEL_15:
}

void __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || [v6 code] == -5502)
  {
    id v8 = [*(id *)(a1 + 32) validator];
    [v8 resetAccountCDPStateWithEscapeOptionsOffered:1 andSetSecret:v5];
  }
  else
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) cancelValidationWithError:v7];
  }
}

- (id)_cancelRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Cancel", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F34858]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__CDPDRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __79__CDPDRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_tryAgainLaterOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Try Again", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN_TRY_LATER"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F34940]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = _CDPStateError();
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (id)_deviceSelectionRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Choose Another Device", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_CHOOSE_ANOTHER_DEVICE"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F34890]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = _CDPStateError();
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (id)_piggybackingRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Send Code to My Devices", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_PIGGYBACKING"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F348B0]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = _CDPStateError();
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (id)_recoveryKeyRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Recovery Key", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_RK"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F34910]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__CDPDRecoveryValidatedJoinFlowController__recoveryKeyRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __84__CDPDRecoveryValidatedJoinFlowController__recoveryKeyRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_custodianRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Custodian", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled]) {
    id v6 = @"REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_CONTACT";
  }
  else {
    id v6 = @"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN";
  }
  id v7 = [MEMORY[0x263F343B8] builderForKey:v6];
  id v8 = [v7 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v8];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F348F0]];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__CDPDRecoveryValidatedJoinFlowController__custodianRecoveryOptionWithCompletion___block_invoke;
  v11[3] = &unk_26432F3B8;
  id v12 = v3;
  id v9 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v11];

  return v5;
}

void __82__CDPDRecoveryValidatedJoinFlowController__custodianRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_recoveryMethodRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Recovery Method", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_METHOD"];
  id v7 = [v6 localizedString];
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v7];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:*MEMORY[0x263F34910]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__CDPDRecoveryValidatedJoinFlowController__recoveryMethodRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v10];

  return v5;
}

void __87__CDPDRecoveryValidatedJoinFlowController__recoveryMethodRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_edpRecoveryTokenOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: EDP Recovery Token", buf, 2u);
  }

  id v5 = objc_alloc_init(CDPDRecoveryOption);
  id v6 = CDPLocalizedStringInTable();
  [(CDPDRecoveryOption *)v5 setLocalizedRecoveryOption:v6];

  [(CDPDRecoveryOption *)v5 setTelemetryRecoveryOption:@"Guitarfish recovery option"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__CDPDRecoveryValidatedJoinFlowController__edpRecoveryTokenOptionWithCompletion___block_invoke;
  v9[3] = &unk_26432F3B8;
  id v10 = v3;
  id v7 = v3;
  [(CDPDRecoveryOption *)v5 setRecoveryHandler:v9];

  return v5;
}

void __81__CDPDRecoveryValidatedJoinFlowController__edpRecoveryTokenOptionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__CDPDRecoveryValidatedJoinFlowController__edpRecoveryTokenOptionWithCompletion___block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = _CDPStateError();
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (void)_showEntryLimitError:(id)a3 withRecoveryOptionHandlers:(id)a4 defaultIndex:(int64_t)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(CDPDRecoveryFlowController *)self uiProvider];
    *(_DWORD *)buf = 138412546;
    long long v24 = v14;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to preset alert (using: %@) for error: %@", buf, 0x16u);
  }
  uint64_t v15 = [(CDPDRecoveryFlowController *)self uiProvider];

  if (v15)
  {
    uint64_t v16 = [(CDPDRecoveryFlowController *)self uiProvider];
    uint64_t v17 = [(CDPDRecoveryFlowController *)self recoveryContext];
    uint64_t v18 = [v17 context];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    _DWORD v19[2] = __115__CDPDRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke;
    v19[3] = &unk_26432F480;
    id v20 = v11;
    id v22 = v12;
    id v21 = v10;
    [v16 cdpContext:v18 showError:v21 withDefaultIndex:a5 withCompletion:v19];
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v10);
  }
}

void __115__CDPDRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithInteger:a2];
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "User responded to presented alert with option: %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithInteger:a2];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v8[2](v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = _CDPStateErrorWithUnderlying();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

- (id)_hardLimitErrorBodyWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self validator];
  __int16 v6 = [v5 supportedEscapeOfferMask];

  if ((v6 & 2) != 0)
  {
    uint64_t v10 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitDeviceSelectionAvailableBodyForDevice:v4];
  }
  else if ((v6 & 0x80) != 0)
  {
    uint64_t v10 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitPiggybackingAvailableBodyForDevice:v4];
  }
  else
  {
    if ((v6 & 0x20) != 0)
    {
      if ((v6 & 0x40) != 0) {
        [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:v4];
      }
      else {
        [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitRecoveryKeyAvailableBodyForDevice:v4];
      }
      goto LABEL_8;
    }
    if ((v6 & 0x40) != 0)
    {
      uint64_t v10 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitCustodianRecoveryAvailableBodyForDevice:v4];
    }
    else
    {
      if ((v6 & 0x100) == 0)
      {
        id v7 = (void *)MEMORY[0x263F34350];
        id v8 = [(CDPDRecoveryFlowController *)self recoveryContext];
        uint64_t v9 = [v8 context];
        LODWORD(v7) = objc_msgSend(v7, "isSubsetOfContextTypeSignIn:", objc_msgSend(v9, "type"));

        if (v7) {
          [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitNoResetForSignInForDevice:v4];
        }
        else {
          [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitRepairBodyForDevice:v4];
        }
        uint64_t v10 = LABEL_8:;
        goto LABEL_11;
      }
      uint64_t v10 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitEDPRecoveryTokenAvailableBodyForDevice:v4];
    }
  }
LABEL_11:
  int v11 = (void *)v10;

  return v11;
}

- (id)_limitErrorBodyForDevice:(id)a3 limitType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CDPDRecoveryFlowController *)self validator];
  __int16 v8 = [v7 supportedEscapeOfferMask];

  if ((v8 & 2) != 0)
  {
    uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitDeviceSelectionAvailableBodyForDevice:v6];
  }
  else if ((v8 & 0x80) != 0)
  {
    uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitPiggybackingAvailableBodyForDevice:v6];
  }
  else if ((v8 & 0x20) != 0)
  {
    if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled] && (v8 & 0x40) != 0)
    {
      uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:v6];
    }
    else
    {
      uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitRecoveryKeyAvailableBodyForDevice:v6];
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitCustodianRecoveryAvailableBodyForDevice:v6];
  }
  else if (a4 == 2 && (v8 & 0x100) != 0)
  {
    uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryHardLimitEDPRecoveryTokenAvailableBodyForDevice:v6];
  }
  else if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitNoResetForDevice:v6];
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F34350];
    uint64_t v13 = [(CDPDRecoveryFlowController *)self recoveryContext];
    uint64_t v14 = [v13 context];
    LODWORD(v12) = objc_msgSend(v12, "isSubsetOfContextTypeRepair:", objc_msgSend(v14, "type"));

    if (v12) {
      [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitNoResetForRepairForDevice:v6];
    }
    else {
    uint64_t v9 = [(CDPDRecoveryValidatedJoinFlowController *)self _entryLimitSignInBodyForDevice:v6];
    }
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)_entryLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v6 = [v5 context];
  int v7 = [v6 idmsRecovery];

  __int16 v8 = NSString;
  if (v7) {
    uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK_AND_RC";
  }
  else {
    uint64_t v9 = @"REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK_AND_RC";
  }
  uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:v9];
  int v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v12 = [v11 localizedString];
  uint64_t v13 = [v4 localizedName];

  uint64_t v14 = [v8 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];

  return v14;
}

- (id)_entryHardLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v6 = [v5 context];
  int v7 = [v6 idmsRecovery];

  __int16 v8 = NSString;
  if (v7) {
    uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC";
  }
  else {
    uint64_t v9 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC";
  }
  uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:v9];
  int v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v12 = [v11 localizedString];
  uint64_t v13 = [v4 localizedName];

  uint64_t v14 = [v8 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];

  return v14;
}

- (id)_entryHardLimitPiggybackingAvailableBodyForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  id v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_TRUSTED_DEVICES"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryHardLimitRecoveryKeyAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v6 = [v5 context];
  int v7 = [v6 idmsRecovery];

  __int16 v8 = NSString;
  if (v7) {
    uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK";
  }
  else {
    uint64_t v9 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK";
  }
  uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:v9];
  int v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v12 = [v11 localizedString];
  uint64_t v13 = [v4 localizedName];

  uint64_t v14 = [v8 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];

  return v14;
}

- (id)_entryHardLimitCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v6 = [v5 context];
  int v7 = [v6 idmsRecovery];

  __int16 v8 = NSString;
  if (v7) {
    uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC";
  }
  else {
    uint64_t v9 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC";
  }
  uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:v9];
  int v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v12 = [v11 localizedString];
  uint64_t v13 = [v4 localizedName];

  uint64_t v14 = [v8 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];

  return v14;
}

- (id)_entryHardLimitNoResetForSignInForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  id v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_METHOD"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryHardLimitRepairBodyForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  id v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_RPD"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryHardLimitDeviceSelectionAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v6 = [v5 context];
  int v7 = [v6 idmsRecovery];

  __int16 v8 = NSString;
  if (v7) {
    uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC";
  }
  else {
    uint64_t v9 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC";
  }
  uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:v9];
  int v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v12 = [v11 localizedString];
  uint64_t v13 = [v4 localizedName];

  uint64_t v14 = [v8 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];

  return v14;
}

- (id)_entryLimitNoResetForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  id v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_METHOD"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryHardLimitEDPRecoveryTokenAvailableBodyForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  id v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_EDP_RECOVERY_TOKEN" inTable:@"Localizable-EDP"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryLimitTitleForDevice:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F343B8];
  id v4 = a3;
  id v5 = [v3 builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_TITLE"];
  uint64_t v6 = [v4 localSecretType];

  int v7 = [v5 addSecretType:v6];
  __int16 v8 = [v7 localizedString];

  return v8;
}

- (id)_entryLimitSignInBodyForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  uint64_t v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_SIGNIN"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryLimitNoResetForRepairForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  uint64_t v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_NO_RESET"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryLimitResetAvailableBodyForDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  uint64_t v6 = [v4 builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_RESET"];
  int v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  __int16 v8 = [v7 localizedString];
  uint64_t v9 = [v5 localizedName];

  uint64_t v10 = [v3 stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  return v10;
}

- (id)_entryLimitRecoveryKeyAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
    uint64_t v6 = [v5 context];
    int v7 = [v6 idmsRecovery];

    __int16 v8 = NSString;
    if (v7) {
      uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK";
    }
    else {
      uint64_t v9 = @"REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK";
    }
    int v11 = [MEMORY[0x263F343B8] builderForKey:v9];
    id v12 = objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    uint64_t v13 = [v12 localizedString];
    uint64_t v14 = [v4 localizedName];
    uint64_t v18 = [v8 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v10 = NSString;
    int v11 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_GLOBAL_LIMIT"];
    id v12 = objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    uint64_t v13 = [v4 modelClass];
    uint64_t v14 = [v12 addDeviceClass:v13];
    uint64_t v15 = [v14 localizedString];
    uint64_t v16 = [v4 localizedName];
    uint64_t v17 = [v4 localizedName];
    uint64_t v18 = [v10 stringWithValidatedFormat:v15, @"%@%@", 0, v16, v17 validFormatSpecifiers error];
  }
  return v18;
}

- (id)_entryLimitCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    id v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
    uint64_t v6 = [v5 context];
    int v7 = [v6 idmsRecovery];

    __int16 v8 = NSString;
    if (v7) {
      uint64_t v9 = @"RECOVERY_REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RC";
    }
    else {
      uint64_t v9 = @"REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RC";
    }
    int v11 = [MEMORY[0x263F343B8] builderForKey:v9];
    id v12 = objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    uint64_t v13 = [v12 localizedString];
    uint64_t v14 = [v4 localizedName];
    uint64_t v16 = [v8 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v10 = NSString;
    int v11 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_HELP_PROMPT_MESSAGE"];
    id v12 = objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    uint64_t v13 = [v12 localizedString];
    uint64_t v14 = [v4 localizedName];
    uint64_t v15 = [v4 localizedName];
    uint64_t v16 = [v10 stringWithValidatedFormat:v13, @"%@%@", 0, v14, v15 validFormatSpecifiers error];
  }
  return v16;
}

- (id)_entryLimitDeviceSelectionAvailableBodyForDevice:(id)a3
{
  cdpDevices = self->_cdpDevices;
  id v4 = a3;
  uint64_t v5 = [(NSArray *)cdpDevices prevailingLocalSecretType];
  int v6 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
  int v7 = NSString;
  if (v6)
  {
    __int16 v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_OTHER_ICSC"];
    uint64_t v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    uint64_t v10 = [v9 localizedString];
    int v11 = [v4 localizedName];

    id v12 = [v7 stringWithValidatedFormat:v10, @"%@", 0, v11 validFormatSpecifiers error];
  }
  else
  {
    __int16 v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_ANOTHER_DEVICE"];
    uint64_t v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    uint64_t v10 = [v9 addSecretType:v5];
    int v11 = [v10 localizedString];
    uint64_t v13 = [v4 localizedName];

    id v12 = [v7 stringWithValidatedFormat:v11, @"%@", 0, v13 validFormatSpecifiers error];
  }
  return v12;
}

- (id)_entryLimitPiggybackingAvailableBodyForDevice:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F34400];
  id v4 = a3;
  int v5 = [v3 isICSCHarmonizationEnabled];
  int v6 = NSString;
  if (v5) {
    int v7 = @"REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_TRUSTED_DEVICES";
  }
  else {
    int v7 = @"PIGGYBACKING_RECOVERY_HELP_PROMPT_MESSAGE";
  }
  __int16 v8 = [MEMORY[0x263F343B8] builderForKey:v7];
  uint64_t v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  uint64_t v10 = [v9 localizedString];
  int v11 = [v4 localizedName];
  id v12 = [v4 localizedName];

  uint64_t v13 = [v6 stringWithValidatedFormat:v10, @"%@%@", 0, v11, v12 validFormatSpecifiers error];

  return v13;
}

- (id)_infoDictionaryWithTitle:(id)a3 andBody:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  __int16 v8 = v7;
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08338]];
  }

  return v8;
}

- (void)_showQuotaScreenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDRecoveryFlowController *)self uiProvider];

  if (v5)
  {
    id v7 = [(CDPDRecoveryFlowController *)self uiProvider];
    [v7 presentQuotaScreenWithCompletion:v4];
  }
  else
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryValidatedJoinFlowController _showQuotaScreenWithCompletion:]();
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)_showAccountResetConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Prompting user for Reset confirmation", buf, 2u);
  }

  id v6 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v7 = [(CDPDRecoveryValidatedJoinFlowController *)self _resetDataErrorForCurrentContextWithRecoveryIndexMap:v6];
  __int16 v8 = [(CDPDRecoveryFlowController *)self uiProvider];

  if (v8)
  {
    uint64_t v9 = [(CDPDRecoveryFlowController *)self uiProvider];
    uint64_t v10 = [(CDPDRecoveryFlowController *)self recoveryContext];
    int v11 = [v10 context];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__CDPDRecoveryValidatedJoinFlowController__showAccountResetConfirmationWithCompletion___block_invoke;
    v12[3] = &unk_26432F4A8;
    id v13 = v6;
    id v14 = v4;
    [v9 cdpContext:v11 showError:v7 withDefaultIndex:1 withCompletion:v12];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __87__CDPDRecoveryValidatedJoinFlowController__showAccountResetConfirmationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithInteger:a2];
    int v10 = 138412290;
    int v11 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Reset confirmation prompt came back with: %@", (uint8_t *)&v10, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithInteger:a2];
  __int16 v8 = [v6 objectForKeyedSubscript:v7];
  [v8 BOOLValue];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_resetDataErrorForCurrentContextWithRecoveryIndexMap:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(CDPDRecoveryValidatedJoinFlowController *)self _isWalrusEnabled];
  id v6 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  if (v5)
  {
    id v7 = [MEMORY[0x263F343B8] builderForKey:@"RPD_CONFIRMATION_STEP_2_TITLE" inTable:@"Localizable-Walrus"];
    __int16 v8 = [v7 localizedString];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];

    uint64_t v9 = [MEMORY[0x263F343B8] builderForKey:@"RPD_CONFIRMATION_STEP_2_MESSAGE" inTable:@"Localizable-Walrus"];
    int v10 = [v9 localizedString];
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08338]];

    int v11 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE"];
    uint64_t v12 = [v11 localizedString];
    v32[0] = v12;
    id v13 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
    id v14 = [v13 localizedString];
    v32[1] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08340]];

    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26C9D2FE0];
    uint64_t v16 = _CDPLogSystem();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    uint64_t v17 = "Showing RPD error alert for Walrus user. RecoveryMap is %@";
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F343B8] builderForKey:@"RESET_CONFIRMATION_DIALOG_TITLE"];
    uint64_t v19 = [v18 localizedString];
    [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x263F08320]];

    id v20 = [MEMORY[0x263F343B8] builderForKey:@"RESET_CONFIRMATION_DIALOG_MESSAGE"];
    id v21 = [v20 localizedString];
    [v6 setObject:v21 forKeyedSubscript:*MEMORY[0x263F08338]];

    id v22 = [MEMORY[0x263F343B8] builderForKey:@"RESET_CONFIRMATION_DIALOG_BUTTON_RESET"];
    long long v23 = [v22 localizedString];
    long long v24 = objc_msgSend(MEMORY[0x263F343B8], "builderForKey:", @"GENERIC_CANCEL_BUTTON", v23);
    __int16 v25 = [v24 localizedString];
    v29[1] = v25;
    id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    [v6 setObject:v26 forKeyedSubscript:*MEMORY[0x263F08340]];

    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26C9D2FE0];
    uint64_t v16 = _CDPLogSystem();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    uint64_t v17 = "Showing RPD error alert for non-Walrus user. RecoveryMap is %@";
  }
  _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
LABEL_7:

  uint64_t v27 = _CDPStateError();

  return v27;
}

- (id)_resetProtectedDataErrorUnrecoverable
{
  v24[2] = *MEMORY[0x263EF8340];
  BOOL v2 = [(CDPDRecoveryValidatedJoinFlowController *)self _isWalrusEnabled];
  uint64_t v3 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v4 = _CDPLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Showing RPD unrecoverable error alert for Walrus user", v22, 2u);
    }

    id v6 = [MEMORY[0x263F343B8] builderForKey:@"RPD_CONFIRMATION_STEP_2_TITLE" inTable:@"Localizable-Walrus"];
    id v7 = [v6 localizedString];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];

    __int16 v8 = [MEMORY[0x263F343B8] builderForKey:@"RPD_CONFIRMATION_STEP_2_MESSAGE" inTable:@"Localizable-Walrus"];
    uint64_t v9 = [v8 localizedString];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08338]];

    int v10 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
    int v11 = [v10 localizedString];
    v24[0] = v11;
    uint64_t v12 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA" inTable:@"Localizable-Walrus"];
    id v13 = [v12 localizedString];
    v24[1] = v13;
    id v14 = v24;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Showing RPD unrecoverable error alert for non-Walrus user", v22, 2u);
    }

    uint64_t v15 = [MEMORY[0x263F343B8] builderForKey:@"RESET_CONFIRMATION_DIALOG_TITLE_NO_RECOVERY"];
    uint64_t v16 = [v15 localizedString];
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08320]];

    uint64_t v17 = [MEMORY[0x263F343B8] builderForKey:@"RESET_CONFIRMATION_DIALOG_MESSAGE_NO_RECOVERY"];
    uint64_t v18 = [v17 localizedString];
    [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x263F08338]];

    int v10 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
    int v11 = [v10 localizedString];
    v23[0] = v11;
    uint64_t v12 = [MEMORY[0x263F343B8] builderForKey:@"RESET_CONFIRMATION_DIALOG_BUTTON_RESET_NO_RECOVERY"];
    id v13 = [v12 localizedString];
    v23[1] = v13;
    id v14 = v23;
  }
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [v3 setObject:v19 forKeyedSubscript:*MEMORY[0x263F08340]];

  id v20 = _CDPStateError();

  return v20;
}

- (id)_skipErrorUnrecoverable
{
  v14[1] = *MEMORY[0x263EF8340];
  [(CDPDRecoveryValidatedJoinFlowController *)self _isWalrusEnabled];
  BOOL v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Showing RPD skip error alert for non-Walrus user", v13, 2u);
  }

  id v4 = [MEMORY[0x263F343B8] builderForKey:@"SKIP_CONFIRMATION_DIALOG_TITLE_NO_RECOVERY"];
  BOOL v5 = [v4 localizedString];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];

  id v6 = [MEMORY[0x263F343B8] builderForKey:@"SKIP_CONFIRMATION_DIALOG_MESSAGE_NO_RECOVERY"];
  id v7 = [v6 localizedString];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08338]];

  __int16 v8 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_ESCAPE_OPTION_SKIP"];
  uint64_t v9 = [v8 localizedString];
  v14[0] = v9;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08340]];

  int v11 = _CDPStateError();

  return v11;
}

- (BOOL)_isProbationActive
{
  uint64_t v3 = [MEMORY[0x263F34328] sharedInstance];
  id v4 = [(CDPDRecoveryFlowController *)self recoveryContext];
  [v4 rpdProbationDuration];
  double v6 = v5;
  id v7 = [(CDPDRecoveryFlowController *)self recoveryContext];
  __int16 v8 = [v7 context];
  char v9 = [v3 rpdProbationIsInEffectForDuration:v8 context:v6];

  return v9;
}

- (void)_handleNoRecoveryFactorsWithMask:(unint64_t)a3 validator:(id)a4
{
  id v6 = a4;
  id v7 = [(CDPDRecoveryFlowController *)self uiProvider];

  if (v7)
  {
    if ([MEMORY[0x263F34400] shouldCentralizeRPDFlow])
    {
      id v22 = [CDPEscapeOffersLedger alloc];
      uint64_t v8 = [(CDPDRecoveryFlowController *)self recoveryContext];
      char v9 = [MEMORY[0x263F343A8] sharedInstance];
      uint64_t v10 = [v9 hasLocalSecret];
      int v11 = [MEMORY[0x263F34328] sharedInstance];
      uint64_t v12 = [MEMORY[0x263F34400] isVirtualMachine];
      id v13 = [(CDPDRecoveryFlowController *)self recoveryContext];
      id v14 = [v13 context];
      uint64_t v15 = -[CDPEscapeOffersLedger initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:](v22, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:", a3, v8, v10, v11, v12, [v14 isICDPEnabledFromNetwork]);

      LOBYTE(v8) = [(CDPEscapeOffersLedger *)v15 canOfferRPD];
      if ((v8 & 1) == 0)
      {
LABEL_4:
        uint64_t v16 = [(CDPDRecoveryValidatedJoinFlowController *)self _skipErrorUnrecoverable];
        char v17 = 0;
LABEL_10:
        uint64_t v19 = [(CDPDRecoveryFlowController *)self uiProvider];
        id v20 = [(CDPDRecoveryFlowController *)self recoveryContext];
        id v21 = [v20 context];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        void v23[2] = __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke;
        v23[3] = &unk_26432F4F8;
        char v25 = v17;
        v23[4] = self;
        id v24 = v6;
        [v19 cdpContext:v21 showError:v16 withDefaultIndex:1 withCompletion:v23];

        goto LABEL_11;
      }
    }
    else if (![(CDPDRecoveryValidatedJoinFlowController *)self _isProbationActive])
    {
      goto LABEL_4;
    }
    uint64_t v16 = [(CDPDRecoveryValidatedJoinFlowController *)self _resetProtectedDataErrorUnrecoverable];
    char v17 = 1;
    goto LABEL_10;
  }
  uint64_t v18 = _CDPLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryValidatedJoinFlowController _handleNoRecoveryFactorsWithMask:validator:]();
  }

  [(CDPDRecoveryValidatedJoinFlowController *)self _handleResetOptionWithResetRequested:0 localSecret:0 validator:v6];
LABEL_11:
}

void __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [NSNumber numberWithInteger:a2];
    *(_DWORD *)buf = 138412290;
    int v11 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Reset confirmation prompt came back with: %@", buf, 0xCu);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (a2 == 1)
    {
      id v6 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_236;
      v8[3] = &unk_26432F4D0;
      v8[4] = v6;
      id v9 = *(id *)(a1 + 40);
      [v6 _showQuotaScreenWithCompletion:v8];

      return;
    }
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_2();
    }
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_1();
    }
  }

  [*(id *)(a1 + 32) _handleResetOptionWithResetRequested:0 localSecret:0 validator:*(void *)(a1 + 40)];
}

uint64_t __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_236(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResetOptionWithResetRequested:a2 localSecret:a3 validator:*(void *)(a1 + 40)];
}

- (BOOL)_isWalrusEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CDPDRecoveryFlowController *)self recoveryContext];
    double v5 = [v4 context];
    int v10 = 134217984;
    uint64_t v11 = [v5 walrusStatus];
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Walrus status on recovery context is %ld", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v7 = [v6 context];
  BOOL v8 = [v7 walrusStatus] == 1;

  return v8;
}

- (NSArray)cdpDevices
{
  return self->_cdpDevices;
}

- (void)setCdpDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)shouldOfferPiggybackingBasedRecovery
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Overriding shouldOfferPiggybackingBasedRecovery to offer Piggybacking for CDPRepair ", v2, v3, v4, v5, v6);
}

- (void)_escapeOfferForDevices:remoteApproval:forMultipleICSC:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "_escapeOfferForDevices: Encountered error while checking RK support: %@", v2, v3, v4, v5, v6);
}

- (void)_escapeOfferForDevices:(void *)a1 remoteApproval:(NSObject *)a2 forMultipleICSC:completion:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a1 recoveryContext];
  uint64_t v5 = [v4 context];
  uint8_t v6 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "type"));
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Context Type: %@", v7, 0xCu);
}

- (void)_addEDPEscapeOfferIfNeededToValidator:nonCancelCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Injecting EDP state repair if needed", v2, v3, v4, v5, v6);
}

void __101__CDPDRecoveryValidatedJoinFlowController__addEDPEscapeOfferIfNeededToValidator_nonCancelCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "User cancelled from the password prompt. Cancelling entire flow. Error: %@", v2, v3, v4, v5, v6);
}

void __101__CDPDRecoveryValidatedJoinFlowController__addEDPEscapeOfferIfNeededToValidator_nonCancelCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Adding EDP recovery token to escape offer mask", v2, v3, v4, v5, v6);
}

- (void)_shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User is Walrus enabled, will not use EDP Recovery Token as an escape offer...", v2, v3, v4, v5, v6);
}

- (void)_shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Beginning initial password based repair if needed", v2, v3, v4, v5, v6);
}

- (void)_shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = [a1 type];
  _os_log_debug_impl(&dword_218640000, a3, OS_LOG_TYPE_DEBUG, "isRequiredContext=%{BOOL}d because CDPContextType is %ld", (uint8_t *)v4, 0x12u);
}

void __99__CDPDRecoveryValidatedJoinFlowController__shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion___block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[CDPDRecoveryValidatedJoinFlowController _shouldOfferEDPRecoveryTokenBasedRecoveryWithCompletion:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = a1 & 1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "%s: recoveryTokenNeeded=%{BOOL}d, error=%@", (uint8_t *)&v3, 0x1Cu);
}

- (void)remoteSecretValidator:applyToJoinCircleWithJoinHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "CDPDRemoteDeviceSecretValidatorDelegate applying to join circle", v2, v3, v4, v5, v6);
}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "CDPDRemoteDeviceSecretValidatorDelegate cancelling application to join circle", v2, v3, v4, v5, v6);
}

void __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Recover Octagon using custodian info completed - isJoined: %{BOOL}d, error: %@", (uint8_t *)v3, 0x12u);
}

void __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Joined circle with error: %@", v2, v3, v4, v5, v6);
}

void __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to join circle with error: %@", v2, v3, v4, v5, v6);
}

void __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "clique recovery failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)secretValidator:didFailRecovery:withError:completion:.cold.1()
{
}

- (void)_handleResetOptionWithResetRequested:(uint64_t)a3 localSecret:(uint64_t)a4 validator:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleResetOptionWithResetRequested:(uint64_t)a3 localSecret:(uint64_t)a4 validator:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleResetOptionWithResetRequested:(uint64_t)a3 localSecret:(uint64_t)a4 validator:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleResetOptionWithResetRequested:localSecret:validator:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "CDPDRecoveryValidatedJoinFlowController: UI Provider is nil, only option is to cancel flow", v2, v3, v4, v5, v6);
}

void __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Failed to create local secret, cancelling flow. Error: %@", v2, v3, v4, v5, v6);
}

void __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User elected to: Try Again", v2, v3, v4, v5, v6);
}

void __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User elected to: Select Device", v2, v3, v4, v5, v6);
}

void __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User elected to: Send Code to My Devices", v2, v3, v4, v5, v6);
}

void __81__CDPDRecoveryValidatedJoinFlowController__edpRecoveryTokenOptionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User elected to use EDP recovery token", v2, v3, v4, v5, v6);
}

- (void)_showQuotaScreenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "uiProvider is nil, cannot present Quota Screen", v2, v3, v4, v5, v6);
}

- (void)_handleNoRecoveryFactorsWithMask:validator:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "UI Provider is nil, only option is to cancel flow", v2, v3, v4, v5, v6);
}

void __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Currently in probation, only option is to try again later", v2, v3, v4, v5, v6);
}

void __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User opted to try again later, dismissing flow", v2, v3, v4, v5, v6);
}

@end
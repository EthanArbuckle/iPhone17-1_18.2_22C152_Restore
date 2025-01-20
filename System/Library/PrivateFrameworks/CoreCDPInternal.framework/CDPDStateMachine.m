@interface CDPDStateMachine
- (BOOL)_checkSecureBackupCachedSecretValue;
- (BOOL)_eligibleForSilentAuthenticatedRepair;
- (BOOL)_eligibleToSkipAuth;
- (BOOL)_isEligibleForSOSJoin;
- (BOOL)_isInSOSCircle;
- (BOOL)_localDeviceHasLocalSecret;
- (BOOL)_needsSOSRepair;
- (BOOL)_shouldRejoinCircleAfterPerformingRPDType:(unint64_t)a3;
- (BOOL)attemptedCDPEnable;
- (BOOL)shouldAllowCDPEnrollment;
- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3;
- (CDPContext)context;
- (CDPDCircleControl)circleController;
- (CDPDEDPRecoveryController)edpController;
- (CDPDLockAssertion)lockAssertion;
- (CDPDPCSController)pcsController;
- (CDPDSecureBackupControl)secureBackupController;
- (CDPDSecureBackupEnableCapable)secureBackupEnableController;
- (CDPDStateMachine)initWithContext:(id)a3 connection:(id)a4;
- (CDPDStateMachine)initWithContext:(id)a3 uiProvider:(id)a4;
- (CDPDStateMachine)initWithContext:(id)a3 uiProvider:(id)a4 connection:(id)a5;
- (CDPStateUIProviderInternal)uiProvider;
- (id)_errorForICSCCreationNotAttemptedWithResult:(id)a3 cliqueStatus:(int64_t)a4;
- (id)_makeCDPEntryEventWithContext:(id)a3;
- (id)_makeEDPRepairStartEventWithContext:(id)a3 cdpdAccount:(id)a4;
- (id)_makeEscrowRecordControllerWithCurrentContext;
- (id)_makeICSCCreationMissingWhenExpectedEventWithContext:(id)a3 error:(id)a4;
- (id)_makeSOSCompatibilityModeEnableEvent:(BOOL)a3 error:(id)a4;
- (id)_populateBaseStartEvent:(id)a3 withContext:(id)a4 cdpdAccount:(id)a5;
- (id)_predicateForRecordUpgradeCheck;
- (id)_predicateForRecordUpgradeCheckIgnoringBottled;
- (id)_predicateForRepair;
- (id)_recoveryFlowControllerForKeychainSyncSystem:(int64_t)a3 recoveryContext:(id)a4;
- (id)circlePeerIDForSecureBackupController:(id)a3;
- (id)contextForController:(id)a3;
- (id)secureChannelContextForController:(id)a3;
- (void)_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:(id)a3 localSecretType:(unint64_t)a4 useSecureBackupCachedSecret:(BOOL)a5 circleJoinResult:(id)a6 completion:(id)a7;
- (void)_attemptBackupRecoveryWithLocalSecret:(id)a3 type:(unint64_t)a4 useSecureBackupCachedSecret:(BOOL)a5 circleJoinResult:(id)a6 completion:(id)a7;
- (void)_attemptBeneficiaryTrustWithInheritanceKey:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5;
- (void)_attemptCDPEnable:(id)a3;
- (void)_authenticatedRepairCloudDataProtectionStateWithCompletion:(id)a3;
- (void)_confirmCDPEligibilityWithCompletion:(id)a3;
- (void)_continuePerformEDPRepairWithResult:(id)a3 completion:(id)a4;
- (void)_continueRepairCloudDataProtectionStateWithCompletion:(id)a3;
- (void)_continueShouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)_disableRecoveryKeyWithCompletion:(id)a3;
- (void)_eligibleForSilentAuthenticatedRepair;
- (void)_enableCustodianRecoveryIfAvailableForContext:(id)a3;
- (void)_enableKVSForAccount:(id)a3 store:(id)a4 completion:(id)a5;
- (void)_enableSOSViews;
- (void)_enableSecureBackupWithCircleJoinResult:(id)a3 completion:(id)a4;
- (void)_enableSecureBackupWithJoinResult:(id)a3 completion:(id)a4;
- (void)_enrollOrDisableCDPAfterEnabledStateVerified:(id)a3;
- (void)_fetchUserInfo;
- (void)_handleBeneficiaryTrustWithCompletion:(id)a3;
- (void)_handleCloudDataProtectionStateWithCompletion:(id)a3;
- (void)_handleInteractiveRecoveryFlowWithCircleJoinResult:(id)a3 completion:(id)a4;
- (void)_handlePreflightError:(id)a3 completion:(id)a4;
- (void)_handleiCDPStatusCheckError:(id)a3 completion:(id)a4;
- (void)_initDependenciesWithContext:(id)a3;
- (void)_isEligibleForRecoveryTokenWithContext:(id)a3 cdpStateMachineError:(id)a4 completion:(id)a5;
- (void)_joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired;
- (void)_joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion:(id)a3;
- (void)_performEDPRepairWithResult:(id)a3 completion:(id)a4;
- (void)_performInteractivelyAuthenticatedRepair:(id)a3;
- (void)_performSilentlyAuthenticatedRepair:(id)a3;
- (void)_populateBaseFinishEvent:(id)a3 didSucceed:(BOOL)a4 error:(id)a5 shouldCompleteSignIn:(BOOL)a6 context:(id)a7 octagonCliqueStatus:(int64_t)a8 cdpdAccount:(id)a9;
- (void)_postEDPRepairFinishEventWithContext:(id)a3 didSucceed:(BOOL)a4 error:(id)a5 shouldCompleteSignIn:(BOOL)a6 octagonCliqueStatus:(int64_t)a7 cdpdAccount:(id)a8;
- (void)_postFollowUpForSecureBackupCacheInvalidationError;
- (void)_postRecoveryEnableSecureBackupWithContext:(id)a3 completion:(id)a4;
- (void)_preflightAccountStateWithContext:(id)a3 completion:(id)a4;
- (void)_promptForEDPRecoveryTokenWithCompletion:(id)a3;
- (void)_recoverSecureBackupWithCircleJoinResult:(id)a3 completion:(id)a4;
- (void)_refreshAndAuthenticateWithContext:(id)a3;
- (void)_resetAccountCDPStateWithCompletion:(id)a3;
- (void)_shouldAttemptGuitarfishRepairWithCompletion:(id)a3;
- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)_updateCDPEnableEventWithError:(id)a3 error:(id)a4 didEnable:(BOOL)a5;
- (void)_updateSOSCompatibilityMode;
- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4;
- (void)dealloc;
- (void)handleCloudDataProtectionStateWithCompletion:(id)a3;
- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3;
- (void)promptForLocalSecretWithCompletion:(id)a3;
- (void)repairCloudDataProtectionStateWithCompletion:(id)a3;
- (void)reportCDPEntryEventWithContext:(id)a3;
- (void)reportEDPRepairStartEventWithContext:(id)a3 cdpdAccount:(id)a4;
- (void)resetAccountCDPStateWithCompletion:(id)a3;
- (void)setAttemptedCDPEnable:(BOOL)a3;
- (void)setCircleController:(id)a3;
- (void)setContext:(id)a3;
- (void)setEdpController:(id)a3;
- (void)setLockAssertion:(id)a3;
- (void)setPcsController:(id)a3;
- (void)setSecureBackupController:(id)a3;
- (void)setSecureBackupEnableController:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
@end

@implementation CDPDStateMachine

- (CDPDStateMachine)initWithContext:(id)a3 uiProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CDPDStateMachine *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_uiProvider, a4);
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine initWithContext:uiProvider:]();
    }

    [(CDPDStateMachine *)v10 _initDependenciesWithContext:v7];
    if (CFPreferencesGetAppBooleanValue(@"FakeDepletedRecords", @"com.apple.corecdp", 0))
    {
      v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CDPDStateMachine initWithContext:uiProvider:]();
      }

      [(CDPDSecureBackupControl *)v10->_secureBackupController setFakeNearlyDepletedRecords:1];
    }
    v13 = (CDPInheritanceTrustController *)objc_alloc_init(MEMORY[0x263F34398]);
    inheritanceTrustController = v10->_inheritanceTrustController;
    v10->_inheritanceTrustController = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.cdpd.statemachineDefaultQueue", v16);
    cdpdStatemachineDefaultQueue = v10->_cdpdStatemachineDefaultQueue;
    v10->_cdpdStatemachineDefaultQueue = (OS_dispatch_queue *)v17;
  }
  return v10;
}

- (CDPDStateMachine)initWithContext:(id)a3 uiProvider:(id)a4 connection:(id)a5
{
  id v9 = a5;
  v10 = [(CDPDStateMachine *)self initWithContext:a3 uiProvider:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_connection, a5);
  }

  return v11;
}

- (CDPDStateMachine)initWithContext:(id)a3 connection:(id)a4
{
  id v7 = a4;
  id v8 = [(CDPDStateMachine *)self initWithContext:a3 uiProvider:0];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_connection, a4);
  }

  return v9;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "CDPDStateMachine %p deallocated", v2, v3, v4, v5, v6);
}

- (void)_isEligibleForRecoveryTokenWithContext:(id)a3 cdpStateMachineError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  if ([v8 isBeneficiaryFlow])
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine _isEligibleForRecoveryTokenWithContext:cdpStateMachineError:completion:]();
    }

    if (v10)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = -5302;
LABEL_11:
      v15 = objc_msgSend(v12, "cdp_errorWithCode:", v13);
      v10[2](v10, 0, v15);
LABEL_17:
    }
  }
  else
  {
    if (!objc_msgSend(v9, "cdp_anyDescendantErrorDownToMaxDepth:matchesPredicate:", 3, &__block_literal_global_10))
    {
      BOOL v16 = [v8 type] == 1 || objc_msgSend(v8, "type") == 2;
      pcsController = self->_pcsController;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __91__CDPDStateMachine__isEligibleForRecoveryTokenWithContext_cdpStateMachineError_completion___block_invoke_40;
      v18[3] = &unk_26432F6A8;
      id v19 = v8;
      BOOL v21 = v16;
      v20 = v10;
      [(CDPDPCSController *)pcsController checkiCDPStatusNetwork:1 withCompletion:v18];

      v15 = v19;
      goto LABEL_17;
    }
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "We just cancelled / cancelled RPD from the token screen. We should not show the token screen again.", buf, 2u);
    }

    if (v10)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = -7213;
      goto LABEL_11;
    }
  }
}

BOOL __91__CDPDStateMachine__isEligibleForRecoveryTokenWithContext_cdpStateMachineError_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 code] == -7213;
}

void __91__CDPDStateMachine__isEligibleForRecoveryTokenWithContext_cdpStateMachineError_completion___block_invoke_40(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) isiCDPEligible];
  int v7 = v6;
  uint64_t v8 = *(unsigned char *)(a1 + 48) != 0;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v8 = 1;
    if (([*(id *)(a1 + 32) isProxSignIn] & 1) == 0)
    {
      if (a2) {
        uint64_t v8 = [*(id *)(a1 + 32) forceInteractiveCDPEDPRepair];
      }
    }
  }
  v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [*(id *)(a1 + 32) type];
    int v13 = [*(id *)(a1 + 32) isProxSignIn];
    int v14 = [*(id *)(a1 + 32) forceInteractiveCDPEDPRepair];
    int v15 = 136316674;
    BOOL v16 = "-[CDPDStateMachine _isEligibleForRecoveryTokenWithContext:cdpStateMachineError:completion:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 1024;
    int v22 = v7;
    __int16 v23 = 1024;
    int v24 = v13;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 1024;
    int v28 = v14;
    _os_log_debug_impl(&dword_218640000, v10, OS_LOG_TYPE_DEBUG, "%s: isEligibleForRecoveryToken=%{BOOL}d because contextType=%ld, isICDPEligible=%{BOOL}d, isProxSignIn=%{BOOL}d, isICDPEnabled=%{BOOL}d, forceInteractiveCDPEDPRepair=%{BOOL}d", (uint8_t *)&v15, 0x34u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v8, v5);
  }
}

- (void)_performEDPRepairWithResult:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v15 = "-[CDPDStateMachine _performEDPRepairWithResult:completion:]";
    __int16 v16 = 1024;
    int v17 = 227;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  if ([MEMORY[0x263F34400] isGuitarfishEnabled]
    && [(CDPContext *)self->_context edpState] == 2)
  {
    if (![(CDPContext *)self->_context isBeneficiaryFlow])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __59__CDPDStateMachine__performEDPRepairWithResult_completion___block_invoke;
      v11[3] = &unk_26432FF58;
      v11[4] = self;
      id v12 = v6;
      id v13 = v7;
      [(CDPDStateMachine *)self _continuePerformEDPRepairWithResult:v12 completion:v11];

      goto LABEL_11;
    }
    BOOL v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine _performEDPRepairWithResult:completion:]();
    }
  }
  if (v7)
  {
    v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
LABEL_11:
}

void __59__CDPDStateMachine__performEDPRepairWithResult_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = objc_alloc_init(CDPDAccount);
  objc_msgSend(*(id *)(a1 + 32), "_postEDPRepairFinishEventWithContext:didSucceed:error:shouldCompleteSignIn:octagonCliqueStatus:cdpdAccount:", *(void *)(*(void *)(a1 + 32) + 8), a2, v7, objc_msgSend(*(id *)(a1 + 40), "shouldCompleteSignIn"), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "cliqueStatus"), v5);
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)_continuePerformEDPRepairWithResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 cloudDataProtectionEnabled];
  BOOL v9 = objc_alloc_init(CDPDAccount);
  [(CDPDStateMachine *)self reportEDPRepairStartEventWithContext:self->_context cdpdAccount:v9];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke;
  aBlock[3] = &unk_26432F6A8;
  char v24 = v8;
  aBlock[4] = self;
  id v10 = v7;
  id v23 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke_2;
  v17[3] = &unk_264330A50;
  objc_copyWeak(&v20, &location);
  id v12 = v11;
  id v19 = v12;
  id v13 = v6;
  id v18 = v13;
  int v14 = _Block_copy(v17);
  if ([(CDPContext *)self->_context _alwaysPromptForEDPRecoveryToken])
  {
    int v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine _continuePerformEDPRepairWithResult:completion:]();
    }

    [(CDPDStateMachine *)self _promptForEDPRecoveryTokenWithCompletion:v12];
  }
  else
  {
    if ([(CDPContext *)self->_context isProxSignIn])
    {
      __int16 v16 = [(CDPDStateMachine *)self edpController];
      [v16 performInitialInteractiveEDPRepairWithCompletion:v14];
    }
    else
    {
      __int16 v16 = [(CDPDStateMachine *)self edpController];
      [v16 silentlyRepairEDPStateWithCompletion:v14];
    }
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v6 = a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 32), "edpController", v5);
    [v7 clearCDPEDPFollowUp];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v10);
  }
  return MEMORY[0x270F9A790]();
}

void __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke_2(id *a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 6);
  BOOL v9 = WeakRetained;
  if (a3)
  {
    uint64_t v10 = WeakRetained[1];
    uint64_t v11 = [a1[4] error];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke_3;
    v12[3] = &unk_264330A28;
    id v15 = a1[5];
    id v13 = v9;
    char v16 = a2;
    id v14 = v7;
    [v13 _isEligibleForRecoveryTokenWithContext:v10 cdpStateMachineError:v11 completion:v12];
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke_3_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  if (!a2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
    v7();
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) _promptForEDPRecoveryTokenWithCompletion:*(void *)(a1 + 48)];
LABEL_9:
}

- (id)_makeEDPRepairStartEventWithContext:(id)a3 cdpdAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F202A8] analyticsEventWithContext:v6 eventName:*MEMORY[0x263F345B8] category:*MEMORY[0x263F34830]];
  id v9 = [(CDPDStateMachine *)self _populateBaseStartEvent:v8 withContext:v6 cdpdAccount:v7];
  uint64_t v10 = [(CDPDStateMachine *)self secureBackupController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CDPDStateMachine *)self secureBackupController];
    id v20 = 0;
    uint64_t v13 = [v12 supportsRecoveryKeyWithError:&v20];
    id v14 = v20;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v15 = [NSNumber numberWithBool:v13];
  [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x263F346F8]];

  char v16 = NSNumber;
  int v17 = [v6 altDSID];
  id v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v7, "recoveryContactCountForAltDSID:", v17));

  [v8 setObject:v18 forKeyedSubscript:*MEMORY[0x263F34688]];
  return v8;
}

- (void)reportEDPRepairStartEventWithContext:(id)a3 cdpdAccount:(id)a4
{
  id v5 = [(CDPDStateMachine *)self _makeEDPRepairStartEventWithContext:a3 cdpdAccount:a4];
  uint64_t v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v4 sendEvent:v5];
}

- (void)_promptForEDPRecoveryTokenWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(CDPContext *)self->_context isBeneficiaryFlow])
  {
    id v6 = [(CDPDDeviceSecretValidator *)[CDPDRemoteDeviceSecretValidator alloc] initWithContext:self->_context delegate:self->_edpController];
    [(CDPDDeviceSecretValidator *)v6 setSupportedEscapeOfferMask:256];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke;
    v14[3] = &unk_26432FA90;
    id v7 = v4;
    v14[4] = self;
    id v15 = v7;
    [(CDPDRemoteDeviceSecretValidator *)v6 setValidSecretHandler:v14];
    uiProvider = self->_uiProvider;
    if (uiProvider)
    {
      context = self->_context;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_61;
      v12[3] = &unk_26432F3B8;
      id v13 = v7;
      [(CDPStateUIProviderInternal *)uiProvider cdpContext:context promptForEDPRecoveryTokenWithValidator:v6 successfulCDPRecoveryContinuationHandler:v12];
      uint64_t v10 = v13;
    }
    else
    {
      char v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CDPDStateMachine _promptForEDPRecoveryTokenWithCompletion:]();
      }

      if (!v7) {
        goto LABEL_13;
      }
      uint64_t v10 = _CDPStateError();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
    }

LABEL_13:
    goto LABEL_14;
  }
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _isEligibleForRecoveryTokenWithContext:cdpStateMachineError:completion:]();
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    id v6 = (CDPDRemoteDeviceSecretValidator *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDRemoteDeviceSecretValidator *))v4 + 2))(v4, 0, v6);
LABEL_14:
  }
}

void __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else if ([v5 userDidCancel])
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = _CDPStateError();
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
  else if ([v5 userDidReset])
  {
    char v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_cold_2();
    }

    id v12 = *(void **)(a1 + 32);
    if (!v12[10])
    {
      id v13 = objc_alloc_init(MEMORY[0x263F343E0]);
      [v13 setContext:*(void *)(*(void *)(a1 + 32) + 8)];
      id v14 = [CDPEscapeOffersLedger alloc];
      uint64_t v15 = [MEMORY[0x263F343A8] hasLocalSecret];
      char v16 = [MEMORY[0x263F34328] sharedInstance];
      uint64_t v17 = -[CDPEscapeOffersLedger initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:](v14, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:", 256, v13, v15, v16, [MEMORY[0x263F34400] isVirtualMachine], objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "isICDPEnabledFromNetwork"));
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = *(void **)(v18 + 80);
      *(void *)(v18 + 80) = v17;

      [*(id *)(*(void *)(a1 + 32) + 80) insert:256];
      id v12 = *(void **)(a1 + 32);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_55;
    v20[3] = &unk_264330A78;
    v20[4] = v12;
    id v21 = *(id *)(a1 + 40);
    [v12 resetAccountCDPStateWithCompletion:v20];
  }
}

void __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Will show RPD completed alert", buf, 2u);
  }

  id v5 = [v3 error];

  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 error];
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Error while performing RPD: %@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v8 + 8);
    uint64_t v9 = *(void **)(v8 + 16);
    char v11 = [v3 error];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_56;
    v18[3] = &unk_26432FA40;
    id v12 = &v19;
    id v19 = *(id *)(a1 + 40);
    [v9 cdpContext:v10 showResetFailedAlertWithUnderlyingError:v11 completion:v18];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v13 + 8);
    id v14 = *(void **)(v13 + 16);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_58;
    v16[3] = &unk_26432FA40;
    id v12 = &v17;
    id v17 = *(id *)(a1 + 40);
    [v14 cdpContext:v15 showResetCompletedAlertWithCompletion:v16];
  }
}

void __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        uint64_t v7 = *(void (**)(void))(v6 + 16);
LABEL_9:
        v7();
      }
    }
  }
  else
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Reset failed confirmation alert was not shown due to: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_9;
    }
  }
}

void __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        uint64_t v7 = *(void (**)(void))(v6 + 16);
LABEL_9:
        v7();
      }
    }
  }
  else
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Reset completed confirmation alert was not shown due to: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_9;
    }
  }
}

uint64_t __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_61(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_postEDPRepairFinishEventWithContext:(id)a3 didSucceed:(BOOL)a4 error:(id)a5 shouldCompleteSignIn:(BOOL)a6 octagonCliqueStatus:(int64_t)a7 cdpdAccount:(id)a8
{
  BOOL v9 = a6;
  BOOL v11 = a4;
  uint64_t v13 = (void *)MEMORY[0x263F202A8];
  context = self->_context;
  uint64_t v15 = *MEMORY[0x263F345B0];
  uint64_t v16 = *MEMORY[0x263F34830];
  id v17 = a8;
  id v18 = a5;
  id v20 = [v13 analyticsEventWithContext:context eventName:v15 category:v16];
  [(CDPDStateMachine *)self _populateBaseFinishEvent:v20 didSucceed:v11 error:v18 shouldCompleteSignIn:v9 context:self->_context octagonCliqueStatus:a7 cdpdAccount:v17];

  id v19 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v19 sendEvent:v20];
}

- (void)handleCloudDataProtectionStateWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, uint64_t, void))a3;
  p_context = &self->_context;
  int v6 = [(CDPContext *)self->_context isSharediPad];
  uint64_t v7 = _CDPLogSystem();
  uint64_t v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine handleCloudDataProtectionStateWithCompletion:]((uint64_t)&self->_context, v8, v10, v11, v12, v13, v14, v15);
    }

    if ([(CDPDStateMachine *)self _isInSOSCircle])
    {
      v4[2](v4, 1, 1, 0);
      goto LABEL_43;
    }
    [(CDPDStateMachine *)self reportCDPEntryEventWithContext:self->_context];
    int v16 = _os_feature_enabled_impl();
    if (v16)
    {
      if (handleCloudDataProtectionStateWithCompletion__once != -1) {
        dispatch_once(&handleCloudDataProtectionStateWithCompletion__once, &__block_literal_global_66);
      }
      id v17 = handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore;
      dispatch_time_t v18 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v17, v18);
    }
    id v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = self;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "State machine %@ is starting...", buf, 0xCu);
    }

    [(CDPDStateMachine *)self _updateSOSCompatibilityMode];
    id v38 = 0;
    id v20 = +[CDPDLockAssertion lockWithError:&v38];
    id v21 = v38;
    lockAssertion = self->_lockAssertion;
    self->_lockAssertion = v20;

    int v23 = [(CDPContext *)self->_context _ignoreLockAssertErrors];
    if (v23)
    {
      char v24 = _CDPLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "Ignoring lock assert errors", buf, 2u);
      }
    }
    if (!self->_lockAssertion)
    {
      v30 = [v21 domain];
      if ([v30 isEqualToString:*MEMORY[0x263F08438]] && objc_msgSend(v21, "code") == 16)
      {
      }
      else
      {

        if (!v23)
        {
          if (v16) {
            dispatch_semaphore_signal((dispatch_semaphore_t)handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore);
          }
          v31 = _CDPLogSystem();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[CDPDStateMachine handleCloudDataProtectionStateWithCompletion:]();
          }

          if (v4)
          {
            v32 = _CDPStateError();
            ((void (**)(id, uint64_t, uint64_t, void *))v4)[2](v4, 0, 0, v32);
          }
          goto LABEL_42;
        }
      }
    }
    __int16 v25 = _CDPLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "Successfully took device lock assertion or assertion already taken, proceeding with state machine", buf, 2u);
    }

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_68;
    aBlock[3] = &unk_264330B18;
    aBlock[4] = self;
    char v37 = v16;
    v36 = v4;
    int v26 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x263F34400] isGuitarfishEnabled]
      && ([(CDPContext *)*p_context edpState] == 2
       && (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", -[CDPContext type](*p_context, "type")) & 1) != 0
       || [(CDPContext *)*p_context _recoveryMethodAvailable]))
    {
      uint64_t v27 = [(CDPContext *)self->_context type];
      int v28 = [(CDPDStateMachine *)self edpController];
      uint64_t v29 = v28;
      if (v27 == 12)
      {
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_90;
        v33[3] = &unk_26432F680;
        v34 = v26;
        [v29 setupEDPStateWithCompletion:v33];

LABEL_41:
LABEL_42:

        goto LABEL_43;
      }
      [v28 setupEDPStateWithCompletion:&__block_literal_global_99];
    }
    v26[2](v26);
    goto LABEL_41;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "CDP is not supported on MAID accounts on shared iPads", buf, 2u);
  }

  if (v4)
  {
    BOOL v9 = _CDPStateError();
    ((void (**)(id, uint64_t, uint64_t, void *))v4)[2](v4, 1, 0, v9);
  }
LABEL_43:
}

uint64_t __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke()
{
  handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore = (uint64_t)dispatch_semaphore_create(1);
  return MEMORY[0x270F9A758]();
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) circleStatus];
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2;
  v4[3] = &unk_264330AF0;
  v4[4] = v3;
  uint64_t v6 = v2;
  char v7 = *(unsigned char *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 _handleCloudDataProtectionStateWithCompletion:v4];
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) cliqueStatus];
  if ([v3 shouldCompleteSignIn]
    && [v3 cloudDataProtectionEnabled]
    && *(void *)(a1 + 48) != 1)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Successfully enabled iCDP and landed in circle. Updating keychain status and notifying clients.", buf, 2u);
    }

    uint64_t v6 = [*(id *)(a1 + 32) circleController];
    char v7 = [v6 circleProxy];
    id v8 = objc_alloc(MEMORY[0x263F343E8]);
    BOOL v9 = [*(id *)(a1 + 32) context];
    uint64_t v10 = (void *)[v8 initWithContext:v9];
    uint64_t v11 = [*(id *)(a1 + 32) context];
    uint64_t v12 = +[CDPDKeychainSync keyChainSyncWithProxy:v7 sosCircleProxy:v10 context:v11];

    [v12 updateKeychainSyncStateIfNeededWithCompletion:&__block_literal_global_73];
    uint64_t v13 = [MEMORY[0x263F087C8] defaultCenter];
    [v13 postNotificationName:*MEMORY[0x263F34268] object:0 userInfo:0 deliverImmediately:1];
  }
  *(void *)buf = 0;
  v59 = buf;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__7;
  v62 = __Block_byref_object_dispose__7;
  id v63 = 0;
  if ([v3 shouldCompleteSignIn]
    && [v3 cloudDataProtectionEnabled])
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v64) = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Reporting success to circle proxy", (uint8_t *)&v64, 2u);
    }

    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
    [v15 reportSuccess];
    int v16 = 1;
    goto LABEL_28;
  }
  id v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v18 = [v3 error];
    LODWORD(v64) = 138412290;
    *(void *)((char *)&v64 + 4) = v18;
    _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Reporting error to circle proxy %@", (uint8_t *)&v64, 0xCu);
  }
  id v19 = [v3 error];
  id v20 = [v19 domain];
  int v21 = [v20 isEqualToString:*MEMORY[0x263F342B0]];

  if (v21)
  {
    uint64_t v22 = [v3 error];
    int v23 = (void *)*((void *)v59 + 5);
    *((void *)v59 + 5) = v22;
  }
  else
  {
    char v24 = (void *)MEMORY[0x263F087E8];
    int v23 = [v3 error];
    uint64_t v25 = objc_msgSend(v24, "cdp_errorWithCode:underlyingError:", -2, v23);
    int v26 = (void *)*((void *)v59 + 5);
    *((void *)v59 + 5) = v25;
  }
  uint64_t v27 = (void *)MEMORY[0x263F34350];
  int v28 = [*(id *)(a1 + 32) context];
  if (!objc_msgSend(v27, "isSubsetOfContextTypeSignIn:", -[NSObject type](v28, "type"))
    || ![MEMORY[0x263F34400] isAudioAccessory])
  {
    goto LABEL_22;
  }
  uint64_t v29 = [v3 error];
  v30 = [v29 domain];
  int v31 = [v30 isEqualToString:*MEMORY[0x263F28F30]];

  if (v31)
  {
    int v28 = _CDPLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      v32 = [v3 error];
      __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_cold_2(v32, v67, v28);
    }
LABEL_22:
  }
  v33 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
  v34 = [v3 error];
  [v33 reportFailure:v34];

  v35 = [v3 error];
  LODWORD(v33) = v35 == 0;

  if (!v33)
  {
    int v16 = 0;
    goto LABEL_29;
  }
  uint64_t v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_cold_1();
  }
  int v16 = 0;
LABEL_28:

LABEL_29:
  if ([*(id *)(*(void *)(a1 + 32) + 8) keychainSyncSystem] == 1)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 32) circleSyncingStatus])
    {
LABEL_31:
      uint64_t v36 = 0;
      goto LABEL_36;
    }
  }
  else if (!v16)
  {
    goto LABEL_31;
  }
  char v37 = [*(id *)(a1 + 32) _errorForICSCCreationNotAttemptedWithResult:v3 cliqueStatus:v4];
  if (v37)
  {
    id v38 = [*(id *)(a1 + 32) _makeICSCCreationMissingWhenExpectedEventWithContext:*(void *)(*(void *)(a1 + 32) + 8) error:v37];
    v39 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v39 sendEvent:v38];
  }
  uint64_t v36 = 1;
LABEL_36:
  v40 = [MEMORY[0x263F202A8] analyticsEventWithContext:*(void *)(*(void *)(a1 + 32) + 8) eventName:*MEMORY[0x263F344F8] category:*MEMORY[0x263F34830]];
  uint64_t v41 = objc_alloc_init(CDPDAccount);
  objc_msgSend(*(id *)(a1 + 32), "_populateBaseFinishEvent:didSucceed:error:shouldCompleteSignIn:context:octagonCliqueStatus:cdpdAccount:", v40, v36, *((void *)v59 + 5), objc_msgSend(v3, "shouldCompleteSignIn"), *(void *)(*(void *)(a1 + 32) + 8), v4, v41);
  v42 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v42 sendEvent:v40];

  *(void *)&long long v64 = 0;
  *((void *)&v64 + 1) = &v64;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  char v66 = [v3 shouldCompleteSignIn];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_76;
  aBlock[3] = &unk_264330AC8;
  id v43 = v3;
  uint64_t v45 = *(void *)(a1 + 32);
  uint64_t v44 = a1 + 32;
  id v52 = v43;
  uint64_t v53 = v45;
  v55 = &v64;
  v56 = buf;
  char v57 = *(unsigned char *)(v44 + 24);
  id v54 = *(id *)(v44 + 8);
  v46 = _Block_copy(aBlock);
  v47 = *(void **)v44;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_89;
  v49[3] = &unk_26432F680;
  id v48 = v46;
  id v50 = v48;
  [v47 _performEDPRepairWithResult:v43 completion:v49];

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(buf, 8);
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_71(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Updated keychain sync with success: %{BOOL}d, error: %{public}@", (uint8_t *)v6, 0x12u);
  }
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_76(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      goto LABEL_13;
    }
    id v5 = [MEMORY[0x263F34388] contextForStateRepair];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 8) altDSID];
    [v5 setAltDSID:v6];

    __int16 v7 = +[CDPDFollowUpController sharedInstance];
    [v7 clearFollowUpWithContext:v5 error:0];
    goto LABEL_6;
  }
  id v3 = [*(id *)(a1 + 32) error];
  if (objc_msgSend(v3, "cdp_isCDPErrorWithCode:", -5307))
  {
    int v4 = 1;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) error];
    int v4 = objc_msgSend(v8, "cdp_isCDPErrorWithCode:", 5906);
  }
  if (CFPreferencesGetAppBooleanValue(@"TreatAllErrorsAsFatal", @"com.apple.corecdp", 0)
    || [MEMORY[0x263F34400] isAudioAccessory])
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Detected a pref to require all failures to be fatal or platform is HomePod, failing out...", buf, 2u);
    }
    goto LABEL_12;
  }
  if (([*(id *)(*(void *)(a1 + 40) + 8) failSignInOnError] & 1) == 0 && !v4)
  {
    id v17 = (void *)MEMORY[0x263F34328];
    dispatch_time_t v18 = [*(id *)(*(void *)(a1 + 40) + 8) dsid];
    id v19 = [v18 stringValue];
    int v20 = [v17 isICDPEnabledForDSID:v19];

    uint64_t v21 = [*(id *)(*(void *)(a1 + 40) + 8) keychainSyncSystem];
    if (v21) {
      int v22 = 0;
    }
    else {
      int v22 = v20;
    }
    int v23 = _CDPLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = v21 == 0;
      uint64_t v25 = [*(id *)(a1 + 32) error];
      int v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "keychainSyncSystem"));
      *(_DWORD *)buf = 138544386;
      v39 = v25;
      __int16 v40 = 1024;
      int v41 = v22;
      __int16 v42 = 1024;
      int v43 = v20;
      __int16 v44 = 1024;
      BOOL v45 = v24;
      __int16 v46 = 2112;
      v47 = v26;
      _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "Detected a non-fatal error %{public}@, allowing user to continue sign in. Posting CFU: %{BOOL}d iCDPEnabled: %{BOOL}d isOctagon: %{BOOL}d keychainSyncSystem: %@", buf, 0x28u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    int v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = 0;

    if (v22)
    {
      id v5 = [MEMORY[0x263F34388] contextForStateRepair];
      [v5 setRepairType:2];
      uint64_t v29 = [*(id *)(*(void *)(a1 + 40) + 8) altDSID];
      [v5 setAltDSID:v29];

      v30 = [*(id *)(*(void *)(a1 + 40) + 8) telemetryFlowID];
      [v5 setTelemetryFlowID:v30];

      int v31 = [*(id *)(*(void *)(a1 + 40) + 8) telemetryDeviceSessionID];
      [v5 setTelemetryDeviceSessionID:v31];

      __int16 v7 = +[CDPDFollowUpController sharedInstance];
      [v7 postFollowUpItemForContext:v5 error:0];
LABEL_6:

LABEL_12:
    }
  }
LABEL_13:
  uint64_t v9 = (void *)os_transaction_create();
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  v34 = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_83;
  v35 = &unk_264330AA0;
  uint64_t v36 = *(void *)(a1 + 40);
  id v11 = v9;
  id v37 = v11;
  dispatch_after(v10, MEMORY[0x263EF83A0], &v32);
  if (*(unsigned char *)(a1 + 72)) {
    dispatch_semaphore_signal((dispatch_semaphore_t)handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore);
  }
  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v13 = dispatch_queue_create("CDPRecoveryKeyCache-Queue", v12);

  dispatch_async(v13, &__block_literal_global_87);
  if (objc_msgSend(*(id *)(a1 + 32), "cloudDataProtectionEnabled", v32, v33, v34, v35, v36)) {
    [*(id *)(a1 + 40) _joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired];
  }
  uint64_t v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v39 = v15;
    _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "State machine %@ finished", buf, 0xCu);
  }

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, void, uint64_t, void))(v16 + 16))(v16, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), [*(id *)(a1 + 32) cloudDataProtectionEnabled], *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_83(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_218640000, v2, OS_LOG_TYPE_DEFAULT, "Uncaching all secrets after 30 seconds, fail safe...", v4, 2u);
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) secureBackupProxy];
  [v3 uncacheAllSecrets];
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_85()
{
  id v0 = +[CDPRecoveryKeyCache sharedInstance];
  [v0 deleteCache];
}

uint64_t __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_90(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_90_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_97(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_97_cold_1();
  }
}

- (id)_populateBaseStartEvent:(id)a3 withContext:(id)a4 cdpdAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connection = self->_connection;
  if (connection)
  {
    uint64_t v12 = [(NSXPCConnection *)connection aaf_processName];
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F347F8]];
  }
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[CDPDCircleControl cliqueStatus](self->_circleController, "cliqueStatus"));
  [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x263F34538]];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x263F34528]];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isPiggybackingRecovery"));
  [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x263F34698]];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isTTSURecovery"));
  [v8 setObject:v16 forKeyedSubscript:*MEMORY[0x263F346A0]];

  id v17 = [v9 dsid];
  dispatch_time_t v18 = [v17 stringValue];
  uint64_t v19 = [v10 isICDPEnabledForDSID:v18 checkWithServer:0];

  int v20 = [NSNumber numberWithBool:v19];
  [v8 setObject:v20 forKeyedSubscript:*MEMORY[0x263F34518]];

  uint64_t v21 = [MEMORY[0x263F202D8] localSecretType];
  [v8 setObject:v21 forKeyedSubscript:*MEMORY[0x263F34678]];

  int v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "keychainSyncSystem"));
  [v8 setObject:v22 forKeyedSubscript:*MEMORY[0x263F34668]];

  int v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "totalEscrowDeviceCount"));
  [v8 setObject:v23 forKeyedSubscript:*MEMORY[0x263F347A8]];

  BOOL v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "maxDeviceRecoveryAttempts"));
  [v8 setObject:v24 forKeyedSubscript:*MEMORY[0x263F34680]];

  return v8;
}

- (void)_populateBaseFinishEvent:(id)a3 didSucceed:(BOOL)a4 error:(id)a5 shouldCompleteSignIn:(BOOL)a6 context:(id)a7 octagonCliqueStatus:(int64_t)a8 cdpdAccount:(id)a9
{
  BOOL v11 = a6;
  BOOL v13 = a4;
  uint64_t v16 = NSNumber;
  id v28 = a9;
  id v17 = a7;
  id v18 = a5;
  id v19 = a3;
  int v20 = [v16 numberWithBool:v13];
  [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x263F34558]];

  [v19 populateUnderlyingErrorsStartingWithRootError:v18];
  uint64_t v21 = [NSNumber numberWithBool:v11];
  [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x263F34778]];

  int v22 = [NSNumber numberWithInteger:a8];
  [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x263F34538]];

  int v23 = objc_msgSend(NSNumber, "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x263F34528]];

  BOOL v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "keychainSyncSystem"));
  [v19 setObject:v24 forKeyedSubscript:*MEMORY[0x263F34668]];

  uint64_t v25 = [v17 dsid];

  int v26 = [v25 stringValue];
  uint64_t v27 = [v28 isICDPEnabledForDSID:v26 checkWithServer:0];

  id v29 = [NSNumber numberWithBool:v27];
  [v19 setObject:v29 forKeyedSubscript:*MEMORY[0x263F34518]];
}

- (id)_errorForICSCCreationNotAttemptedWithResult:(id)a3 cliqueStatus:(int64_t)a4
{
  id v6 = a3;
  if (![MEMORY[0x263F34400] isInternalBuild]
    || !CFPreferencesGetAppBooleanValue(@"ForceICSCMissingEvent", @"com.apple.corecdp", 0))
  {
    id v9 = [(CDPDStateMachine *)self context];
    uint64_t v10 = [v9 keychainSyncSystem];

    if (v10)
    {
      BOOL v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:]0();
      }
    }
    else
    {
      uint64_t v12 = [(CDPDStateMachine *)self context];
      int v13 = [v12 isBeneficiaryAccount];

      if (v13)
      {
        BOOL v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:]();
        }
      }
      else if (a4)
      {
        BOOL v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.9();
        }
      }
      else
      {
        if (([MEMORY[0x263F343A8] hasLocalSecret] & 1) == 0)
        {
          BOOL v11 = _CDPLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.8();
          }
          goto LABEL_24;
        }
        uint64_t v15 = [(CDPDStateMachine *)self context];
        int v16 = [v15 secureBackupEnablementNotRequired];

        if (!v16)
        {
          id v18 = [(CDPDStateMachine *)self context];
          int v19 = [v18 disableAsyncModeRequested];

          int v20 = [(CDPDStateMachine *)self context];
          uint64_t v21 = v20;
          if (v19)
          {
            int v22 = [v20 didAttemptSecureBackupEnablement];

            int v23 = _CDPLogSystem();
            BOOL v11 = v23;
            if (v22)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
                -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:]();
              }
              goto LABEL_24;
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.4();
            }

            uint64_t v25 = (void *)MEMORY[0x263F087E8];
            int v26 = [v6 error];
            uint64_t v27 = v25;
            uint64_t v28 = -7300;
          }
          else
          {
            int v24 = [v20 willAttemptAsyncSecureBackupEnablement];

            if (v24)
            {
              BOOL v11 = _CDPLogSystem();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
                -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.5();
              }
              goto LABEL_24;
            }
            id v29 = [(CDPDStateMachine *)self context];
            int v30 = [v29 didAttemptSecureBackupEnablement];

            int v31 = _CDPLogSystem();
            BOOL v11 = v31;
            if (v30)
            {
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.6();
              }
              goto LABEL_24;
            }
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.7();
            }

            uint64_t v32 = (void *)MEMORY[0x263F087E8];
            int v26 = [v6 error];
            uint64_t v27 = v32;
            uint64_t v28 = -7301;
          }
          uint64_t v14 = objc_msgSend(v27, "cdp_errorWithCode:underlyingError:", v28, v26);

          goto LABEL_25;
        }
        BOOL v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:]();
        }
      }
    }
LABEL_24:

    uint64_t v14 = 0;
    goto LABEL_25;
  }
  __int16 v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:]1();
  }

  id v8 = [v6 error];

  if (v8) {
    [v6 error];
  }
  else {
  uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
  }
LABEL_25:

  return v14;
}

- (id)_makeICSCCreationMissingWhenExpectedEventWithContext:(id)a3 error:(id)a4
{
  id v5 = (void *)MEMORY[0x263F202A8];
  uint64_t v6 = *MEMORY[0x263F34610];
  uint64_t v7 = *MEMORY[0x263F34830];
  id v8 = a4;
  id v9 = [v5 analyticsEventWithContext:a3 eventName:v6 category:v7];
  [v9 populateUnderlyingErrorsStartingWithRootError:v8];

  return v9;
}

- (id)_makeCDPEntryEventWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:v4 eventName:*MEMORY[0x263F34630] category:*MEMORY[0x263F34830]];
  uint64_t v6 = objc_alloc_init(CDPDAccount);
  id v7 = [(CDPDStateMachine *)self _populateBaseStartEvent:v5 withContext:v4 cdpdAccount:v6];

  return v5;
}

- (void)reportCDPEntryEventWithContext:(id)a3
{
  id v4 = [(CDPDStateMachine *)self _makeCDPEntryEventWithContext:a3];
  id v3 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v3 sendEvent:v4];
}

- (void)_handleCloudDataProtectionStateWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CDPContext *)self->_context appleID];
    *(_DWORD *)buf = 141558274;
    uint64_t v21 = 1752392040;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v6;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Starting preflight of account for %{mask.hash}@", buf, 0x16u);
  }
  id v7 = [(CDPContext *)self->_context beneficiaryIdentifier];

  if (v7)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CDPContext *)self->_context appleID];
      uint64_t v10 = [(CDPContext *)self->_context beneficiaryIdentifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = (uint64_t)v9;
      __int16 v22 = 2160;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Skipping account preflight for %@ due to presence of beneficiary identifier: %{mask.hash}@", buf, 0x20u);
    }
    [(CDPDStateMachine *)self _handleBeneficiaryTrustWithCompletion:v4];
  }
  else
  {
    BOOL v11 = [(CDPDStateMachine *)self context];
    int v12 = [v11 isFederatedAccount];

    int v13 = [(CDPDStateMachine *)self context];
    char v14 = [v13 managedAccountsAllowedInCDP];

    if (!v12 || (v14 & 1) != 0)
    {
      context = self->_context;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke;
      v18[3] = &unk_26432EDC0;
      void v18[4] = self;
      id v19 = v4;
      [(CDPDStateMachine *)self _preflightAccountStateWithContext:context completion:v18];
    }
    else
    {
      uint64_t v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(CDPDStateMachine *)self _handleCloudDataProtectionStateWithCompletion:v15];
      }

      int v16 = _CDPStateError();
      [(CDPDStateMachine *)self _handlePreflightError:v16 completion:v4];
    }
  }
}

void __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v22 = a2;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Preflight finished with shouldProceed=%i error=%@", buf, 0x12u);
  }

  if (!a2)
  {
    [*(id *)(a1 + 32) _handlePreflightError:v5 completion:*(void *)(a1 + 40)];
    goto LABEL_21;
  }
  int v7 = [MEMORY[0x263F34400] isAudioAccessory];
  id v8 = *(id **)(a1 + 32);
  if (v7)
  {
    [v8 _enrollOrDisableCDPAfterEnabledStateVerified:*(void *)(a1 + 40)];
    goto LABEL_21;
  }
  if ([v8[1] isiCDPEligible]
    && ([*(id *)(*(void *)(a1 + 32) + 8) password],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Credential was provided, attempting to register...", buf, 2u);
    }

    BOOL v11 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
    char v12 = [v11 tryRegisteringCredentials];

    if (v12) {
      goto LABEL_18;
    }
    int v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_cold_1();
    }

    char v14 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
    [v14 registerCredentials];
  }
  else
  {
    char v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Credential was not provided or we are not HSA2/MAID... moving on!", buf, 2u);
    }
  }

LABEL_18:
  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
  [v15 waitForUpdate];

  int v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Checking iCDP status...", buf, 2u);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 24);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_104;
  v19[3] = &unk_26432EDC0;
  v19[4] = v17;
  id v20 = *(id *)(a1 + 40);
  [v18 checkiCDPStatusNetwork:1 withCompletion:v19];

LABEL_21:
}

void __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_104(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished checking iCDP status with isEnabled=%i error=%@", buf, 0x12u);
  }

  if (a2)
  {
    [*(id *)(a1 + 32) _enrollOrDisableCDPAfterEnabledStateVerified:*(void *)(a1 + 40)];
  }
  else
  {
    int v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [*(id *)(a1 + 32) _handleiCDPStatusCheckError:v5 completion:*(void *)(a1 + 40)];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_105;
      v8[3] = &unk_264330B40;
      id v9 = *(id *)(a1 + 40);
      [v7 _attemptCDPEnable:v8];
    }
  }
}

uint64_t __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_105(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleiCDPStatusCheckError:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  if ([v8 isAuthKitUnableToPromptError])
  {
    if (![v8 isAuthKitUnableToPromptDueToNetworkError])
    {
      if (!v5) {
        goto LABEL_8;
      }
      uint64_t v6 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v8];
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    goto LABEL_8;
  }
  uint64_t v6 = +[CDPStateHandlerResult resultWithError:v8];
LABEL_7:
  int v7 = (void *)v6;
  v5[2](v5, v6);

LABEL_8:
}

- (void)_handleBeneficiaryTrustWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Prompting for access key for beneficiary trust.", buf, 2u);
  }

  *(void *)buf = 0;
  id v13 = buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  int v16 = __Block_byref_object_dispose__7;
  uint64_t v17 = self;
  context = v17->_context;
  uiProvider = v17->_uiProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke;
  v9[3] = &unk_264330B90;
  v9[4] = v17;
  int v11 = buf;
  id v8 = v4;
  id v10 = v8;
  [(CDPStateUIProviderInternal *)uiProvider cdpContext:context promptForBeneficiaryAccessKeyWithCompletion:v9];

  _Block_object_dispose(buf, 8);
}

void __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Successfully obtained access code. Trying to recover trust...", buf, 2u);
    }

    id v12 = v5;
    id v13 = *(id *)(a1 + 40);
    cdp_dispatch_async_with_qos();

    id v9 = v12;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke_cold_1();
    }

    id v9 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

void __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke_107(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) _attemptBeneficiaryTrustWithInheritanceKey:a1[4] retryCount:0 completion:a1[5]];
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_attemptBeneficiaryTrustWithInheritanceKey:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a4;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Checking for circle status in order to put beneficiary account in trust, attempt #%lu.", buf, 0xCu);
  }

  int v11 = [(CDPDStateMachine *)self circleController];
  uint64_t v12 = [v11 circleStatus];

  if (v12 == 4 || v12 == 2)
  {
    inheritanceTrustController = self->_inheritanceTrustController;
    context = self->_context;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke;
    v27[3] = &unk_26432F318;
    id v28 = v9;
    [(CDPInheritanceTrustController *)inheritanceTrustController recoverOctagonWithContext:context inheritanceKey:v8 completion:v27];
    uint64_t v15 = v28;
LABEL_6:

    goto LABEL_7;
  }
  if (a4 <= 4 && v12 == 5)
  {
    int v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[CDPDStateMachine _attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:](a4 ^ 2, v16);
    }

    uint64_t v17 = _CDPSignpostLogSystem();
    os_signpost_id_t v18 = _CDPSignpostCreate();

    id v19 = _CDPSignpostLogSystem();
    id v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218640000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "NoCKAccountBackOffRetry", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v21 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = v18;
      _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: NoCKAccountBackOffRetry  enableTelemetry=YES ", buf, 0xCu);
    }

    dispatch_time(0, 1000000000 * (a4 ^ 2));
    id v25 = v8;
    id v26 = v9;
    cdp_dispatch_after_with_qos();

    uint64_t v15 = v25;
    goto LABEL_6;
  }
  int v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[CDPDStateMachine _attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:]();
  }

  __int16 v23 = _CDPStateError();
  id v24 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v23];
  if (v9) {
    (*((void (**)(id, void *))v9 + 2))(v9, v24);
  }

LABEL_7:
}

void __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"failure";
    if (!v3) {
      id v5 = @"success";
    }
    int v10 = 138412290;
    int v11 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Beneficiary trust recovery was a %@.", (uint8_t *)&v10, 0xCu);
  }

  if (v3)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke_cold_1();
    }

    int v7 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v3];
  }
  else
  {
    if (!*(void *)(a1 + 32)) {
      goto LABEL_16;
    }
    int v7 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:1 shouldCompleteSignIn:1 error:0];
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      int v11 = v7;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Completing the beneficiary trust with results: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, __CFString *))(v9 + 16))(v9, v7);
  }

LABEL_16:
}

uint64_t __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke_116(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  id v3 = _CDPSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    int v10 = 67240192;
    LODWORD(v11) = v6;
    _os_signpost_emit_with_name_impl(&dword_218640000, v4, OS_SIGNPOST_INTERVAL_END, v5, "NoCKAccountBackOffRetry", " NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v10, 8u);
  }

  int v7 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 56);
    __int16 v12 = 2048;
    double v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v14 = 1026;
    int v15 = v8;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: NoCKAccountBackOffRetry  NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v10, 0x1Cu);
  }

  return [*(id *)(a1 + 32) _attemptBeneficiaryTrustWithInheritanceKey:*(void *)(a1 + 40) retryCount:*(void *)(a1 + 80) completion:*(void *)(a1 + 48)];
}

- (void)_enrollOrDisableCDPAfterEnabledStateVerified:(id)a3
{
  id v4 = a3;
  if ([(CDPContext *)self->_context isiCDPEligible])
  {
    if (([(CDPContext *)self->_context _forceManateeReset] & 1) != 0
      || [(CDPContext *)self->_context _forceEDPReset])
    {
      os_signpost_id_t v5 = _CDPLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "CDP Reset has been requested... hold on to your hats...", buf, 2u);
      }

      if (!self->_ledger)
      {
        id v6 = objc_alloc_init(MEMORY[0x263F343E0]);
        [v6 setContext:self->_context];
        int v7 = [CDPEscapeOffersLedger alloc];
        uint64_t v8 = [MEMORY[0x263F34328] sharedInstance];
        uint64_t v9 = -[CDPEscapeOffersLedger initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:](v7, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:", 0, v6, 1, v8, [MEMORY[0x263F34400] isVirtualMachine], -[CDPContext isICDPEnabledFromNetwork](self->_context, "isICDPEnabledFromNetwork"));
        ledger = self->_ledger;
        self->_ledger = v9;
      }
      [(CDPDStateMachine *)self resetAccountCDPStateWithCompletion:v4];
    }
    else
    {
      double v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "iCDP is enabled on HSA2/MAID account, attempting to join circle...", buf, 2u);
      }

      circleController = self->_circleController;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke;
      v15[3] = &unk_264330C08;
      v15[4] = self;
      id v16 = v4;
      [(CDPDCircleControl *)circleController joinCircleWithCompletion:v15];
    }
  }
  else
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "iCDP is enabled, but the account is not HSA2 enabled or an allowed managed account. Used to roll back iCDP enrollment previously, but these days we don't...", buf, 2u);
    }

    __int16 v12 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:1 shouldCompleteSignIn:1 error:0];
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v12);
    }
  }
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(*(void *)(a1 + 32) + 8) forceInteractiveCDPEDPRepair];
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_3();
  }

  if ((([v5 didJoin] ^ 1 | v7) & 1) == 0)
  {
    double v13 = [*(id *)(a1 + 32) context];
    uint64_t v14 = [v13 keychainSyncSystem];

    if (v14 != 1)
    {
      [*(id *)(a1 + 32) _enableSecureBackupWithJoinResult:v5 completion:*(void *)(a1 + 40)];
      goto LABEL_18;
    }
    int v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_2();
    }

    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = +[CDPStateHandlerResult successResult];
    goto LABEL_16;
  }
  int v9 = [v5 needsBackupRecovery] | v7;
  int v10 = _CDPLogSystem();
  uint64_t v11 = v10;
  if (v9 == 1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to RECOVER backup", buf, 2u);
    }

    __int16 v12 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_117;
    v19[3] = &unk_2643307D8;
    v19[4] = v12;
    id v20 = *(id *)(a1 + 40);
    [v12 _recoverSecureBackupWithCircleJoinResult:v5 completion:v19];

    goto LABEL_18;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_1();
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16)
  {
    uint64_t v17 = +[CDPStateHandlerResult resultWithError:v6];
LABEL_16:
    os_signpost_id_t v18 = (void *)v17;
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v17);
  }
LABEL_18:
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_117(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v19 = a2;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Finished recovering backup with didRecover=%i didRequestReset=%i error=%@", buf, 0x18u);
  }

  if (a3)
  {
    if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "type")))
    {
      int v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_117_cold_1();
      }

      uint64_t v10 = *(void *)(a1 + 40);
      if (v10)
      {
        uint64_t v11 = _CDPStateError();
        __int16 v12 = +[CDPStateHandlerResult resultWithError:v11];
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
      }
    }
    else
    {
      int v15 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_118;
      v16[3] = &unk_264330A78;
      void v16[4] = v15;
      id v17 = *(id *)(a1 + 40);
      [v15 resetAccountCDPStateWithCompletion:v16];
    }
  }
  else
  {
    double v13 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:a2 shouldCompleteSignIn:a2 error:v7];
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v13);
    }
  }
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Will show RPD completed alert", buf, 2u);
  }

  id v5 = [v3 error];

  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 error];
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Error while performing RPD: %@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v8 + 8);
    int v9 = *(void **)(v8 + 16);
    uint64_t v11 = [v3 error];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_119;
    v24[3] = &unk_264330BE0;
    __int16 v12 = &v26;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = &v25;
    id v25 = v3;
    id v26 = v13;
    id v15 = v3;
    [v9 cdpContext:v10 showResetFailedAlertWithUnderlyingError:v11 completion:v24];
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v16 + 8);
    id v17 = *(void **)(v16 + 16);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_120;
    v21[3] = &unk_264330BE0;
    __int16 v12 = &v23;
    id v19 = *(id *)(a1 + 40);
    uint64_t v14 = &v22;
    id v22 = v3;
    id v23 = v19;
    id v20 = v3;
    [v17 cdpContext:v18 showResetCompletedAlertWithCompletion:v21];
  }
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_119(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Reset failed confirmation alert was not shown due to: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 32));
  }
LABEL_9:
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_120(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Reset completed confirmation alert was not shown due to: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 32));
  }
LABEL_9:
}

- (void)_disableRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  secureBackupDisableController = self->_secureBackupDisableController;
  if (secureBackupDisableController)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke;
    v8[3] = &unk_26432F318;
    id v9 = v4;
    [(CDPDSecureBackupDisableCapable *)secureBackupDisableController disableRecoveryKeyWithCompletion:v8];
  }
  else if (v4)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

void __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Successfully disabled recovery key!", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)resetAccountCDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:*MEMORY[0x263F34730] category:*MEMORY[0x263F34830]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke;
  aBlock[3] = &unk_26432FF58;
  id v6 = v5;
  id v18 = v6;
  id v19 = self;
  id v7 = v4;
  id v20 = v7;
  int v8 = _Block_copy(aBlock);
  uint64_t v9 = [(CDPContext *)self->_context isICDPEnabledFromNetwork];
  if ([MEMORY[0x263F34400] shouldCentralizeRPDFlow])
  {
    uint64_t v10 = [[CDPDRPDExecutor alloc] initWithSbDeleter:self->_secureBackupDisableController ledger:self->_ledger circleControl:self->_circleController cdpContext:self->_context edpController:self->_edpController isICDPEnabled:v9];
    uint64_t v11 = (void *)os_transaction_create();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_126;
    v13[3] = &unk_264330C30;
    v13[4] = self;
    id v15 = v8;
    id v16 = v7;
    id v14 = v11;
    id v12 = v11;
    [(CDPDRPDExecutor *)v10 performRPDWithCompletionHandler:v13];
  }
  else
  {
    [(CDPDStateMachine *)self _resetAccountCDPStateWithCompletion:v8];
  }
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*MEMORY[0x263F34558]];

  id v7 = _CDPLogSystem();
  int v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "CDP reset succeeded, attempting to join/create the circle again", buf, 2u);
    }

    uint64_t v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v9 sendEvent:*(void *)(a1 + 32)];

    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(v10 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_122;
    v15[3] = &unk_264330C08;
    v15[4] = v10;
    id v16 = *(id *)(a1 + 48);
    [v11 joinCircleIgnoringBackups:1 completion:v15];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v5];
    id v12 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v12 sendEvent:*(void *)(a1 + 32)];

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      id v14 = +[CDPStateHandlerResult resultWithError:v5];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
    }
  }
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 didJoin])
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = +[CDPStateHandlerResult resultWithError:v6];
LABEL_14:
    id v15 = (void *)v14;
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v14);

    goto LABEL_15;
  }
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Joined circle after CDP reset. Attempting to disable RK...", buf, 2u);
  }

  [*(id *)(a1 + 32) _disableRecoveryKeyWithCompletion:0];
  int v8 = [MEMORY[0x263F343A8] sharedInstance];
  int v9 = [v8 hasLocalSecret];

  uint64_t v10 = _CDPLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Joined circle after CDP reset. Enabling secure backup...", buf, 2u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_123;
    v16[3] = &unk_26432F680;
    id v12 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    [v12 _enableSecureBackupWithCircleJoinResult:v5 completion:v16];

    goto LABEL_15;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Joined circle after CDP reset. Skipping secure backup because we don't have a secret", buf, 2u);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    uint64_t v14 = +[CDPStateHandlerResult successResult];
    goto LABEL_14;
  }
LABEL_15:
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_123(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling secure backup after CDP reset with didEnable=%i error=%@...", (uint8_t *)v8, 0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    id v7 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:a2 shouldCompleteSignIn:a2 error:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_126(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_126_cold_1((uint64_t)v5, a2, v6);
  }

  if ([*(id *)(a1 + 32) _shouldRejoinCircleAfterPerformingRPDType:a2])
  {
    (*(void (**)(void, BOOL, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5 == 0, v5);
  }
  else
  {
    if (v5) {
      +[CDPStateHandlerResult resultWithError:v5];
    }
    else {
    id v7 = +[CDPStateHandlerResult successResult];
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
    }
  }
}

- (BOOL)_shouldRejoinCircleAfterPerformingRPDType:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFFDLL;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _shouldRejoinCircleAfterPerformingRPDType:]();
  }

  return v3 == 1;
}

- (void)_enableSecureBackupWithJoinResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke;
  aBlock[3] = &unk_264330438;
  id v8 = v7;
  id v19 = v8;
  void aBlock[4] = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = _Block_copy(aBlock);
  if ([v9 requiresEscrowRecordsFetch])
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Checking for existing records before enabling secure backup...", buf, 2u);
    }

    secureBackupController = self->_secureBackupController;
    uint64_t v13 = [(CDPDStateMachine *)self _predicateForRecordUpgradeCheckIgnoringBottled];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_128;
    v14[3] = &unk_264330410;
    v14[4] = self;
    id v15 = v10;
    [(CDPDSecureBackupControl *)secureBackupController checkForExistingRecordMatchingPredicate:v13 forceFetch:0 completion:v14];
  }
  else
  {
    (*((void (**)(void *, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = +[CDPStateHandlerResult resultWithError:v5];
LABEL_15:
      uint64_t v14 = (void *)v8;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v8);
LABEL_16:
    }
  }
  else
  {
    if (a2)
    {
      id v9 = [MEMORY[0x263F343A8] sharedInstance];
      int v10 = [v9 hasLocalSecret];

      if (v10)
      {
        uint64_t v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Enabling secure backup...", buf, 2u);
        }

        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_127;
        v16[3] = &unk_26432ED48;
        id v18 = *(id *)(a1 + 48);
        id v17 = *(id *)(a1 + 40);
        [v12 _enableSecureBackupWithCircleJoinResult:v13 completion:v16];

        uint64_t v14 = v18;
        goto LABEL_16;
      }
    }
    id v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Device is in circle but has no local secret or already has a secure backup enabled, skipping secure backup enable", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setSecureBackupEnablementNotRequired:1];
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = +[CDPStateHandlerResult successResult];
      goto LABEL_15;
    }
  }
}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_127(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling secure backup with didEnable=%i error=%@...", (uint8_t *)v8, 0x12u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:peeriCloudKeychainState:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:peeriCloudKeychainState:error:", a2, a2, [*(id *)(a1 + 32) remotePeeriCKState], v5);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v8)
    {
      uint64_t v7 = [*(id *)(a1 + 32) context];
      [v7 _alwaysCreateEscrowRecord];
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)_handlePreflightError:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  if ([(CDPContext *)self->_context isiCDPEligible]) {
    int v8 = 1;
  }
  else {
    int v8 = objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeRepair:", -[CDPContext type](self->_context, "type"));
  }
  int v9 = [(CDPContext *)self->_context isFederatedAccount];
  id v10 = [(CDPDStateMachine *)self context];
  int v11 = [v10 managedAccountsAllowedInCDP];

  id v12 = _CDPLogSystem();
  uint64_t v13 = v12;
  if (v8 && v9 ^ 1 | v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPDStateMachine _handlePreflightError:completion:]();
    }

    if (v7)
    {
      id v14 = +[CDPStateHandlerResult resultWithError:v6];
      v7[2](v7, v14);
LABEL_17:
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Account preflight failed with error, continuing state machine - %@", (uint8_t *)&v16, 0xCu);
    }

    if (v7)
    {
      if ([MEMORY[0x263F34400] isAudioAccessory]) {
        id v14 = v6;
      }
      else {
        id v14 = 0;
      }
      id v15 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v14];
      v7[2](v7, v15);

      goto LABEL_17;
    }
  }
}

- (void)_updateCDPEnableEventWithError:(id)a3 error:(id)a4 didEnable:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = NSNumber;
  id v9 = a4;
  id v14 = a3;
  id v10 = [v8 numberWithBool:v5];
  [v14 setObject:v10 forKeyedSubscript:*MEMORY[0x263F34558]];

  int v11 = [NSNumber numberWithBool:v5];
  [v14 setObject:v11 forKeyedSubscript:*MEMORY[0x263F34518]];

  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[CDPDCircleControl cliqueStatus](self->_circleController, "cliqueStatus"));
  [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x263F34538]];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x263F34528]];

  [v14 populateUnderlyingErrorsStartingWithRootError:v9];
}

- (void)_attemptCDPEnable:(id)a3
{
  id v4 = a3;
  context = self->_context;
  id v14 = 0;
  int v6 = [(CDPContext *)context isiCDPEligibleWithError:&v14];
  id v7 = v14;
  if (v6)
  {
    if (!self->_attemptedCDPEnable)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __38__CDPDStateMachine__attemptCDPEnable___block_invoke;
      v12[3] = &unk_26432EDC0;
      void v12[4] = self;
      id v13 = v4;
      [(CDPDStateMachine *)self _confirmCDPEligibilityWithCompletion:v12];

      goto LABEL_13;
    }
    int v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPDStateMachine _attemptCDPEnable:]();
    }

    if (v4)
    {
      id v9 = _CDPStateError();
      id v10 = +[CDPStateHandlerResult resultWithError:v9];

LABEL_11:
      (*((void (**)(id, void *))v4 + 2))(v4, v10);
    }
  }
  else
  {
    int v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine _attemptCDPEnable:]();
    }

    if (v4)
    {
      id v10 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v7];
      goto LABEL_11;
    }
  }
LABEL_13:
}

void __38__CDPDStateMachine__attemptCDPEnable___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = objc_alloc(MEMORY[0x263F202A8]);
    id v7 = (void *)[v6 initWithEventName:*MEMORY[0x263F344F0] eventCategory:*MEMORY[0x263F34830] initData:0];
    int v8 = [*(id *)(*(void *)(a1 + 32) + 8) telemetryFlowID];

    if (v8)
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 8) telemetryFlowID];
      [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F20348]];
    }
    id v10 = [*(id *)(*(void *)(a1 + 32) + 8) telemetryDeviceSessionID];

    if (v10)
    {
      int v11 = [*(id *)(*(void *)(a1 + 32) + 8) telemetryDeviceSessionID];
      [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x263F20320]];
    }
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to enable iCDP...", buf, 2u);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 24);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __38__CDPDStateMachine__attemptCDPEnable___block_invoke_130;
    v17[3] = &unk_26432FF58;
    void v17[4] = v13;
    id v18 = v7;
    id v19 = *(id *)(a1 + 40);
    id v15 = v7;
    [v14 enableCDPWithCompletion:v17];

    goto LABEL_13;
  }
  int v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __38__CDPDStateMachine__attemptCDPEnable___block_invoke_cold_1();
  }

  if (*(void *)(a1 + 40))
  {
    id v15 = +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:1 error:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_13:
  }
}

void __38__CDPDStateMachine__attemptCDPEnable___block_invoke_130(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling iCDP with didEnable=%i error=%@", (uint8_t *)v10, 0x12u);
  }

  [*(id *)(a1 + 32) _updateCDPEnableEventWithError:*(void *)(a1 + 40) error:v5 didEnable:a2];
  id v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v7 sendEvent:*(void *)(a1 + 40)];

  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
    [*(id *)(a1 + 32) _handleCloudDataProtectionStateWithCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = +[CDPStateHandlerResult resultWithError:v5];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

- (void)_updateSOSCompatibilityMode
{
  unint64_t v3 = [(CDPDStateMachine *)self context];
  if ([v3 isSOSNeeded])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [(CDPDStateMachine *)self context];
    uint64_t v4 = [v5 isSOSCompatibilityOptInNeeded];
  }
  id v6 = [(CDPDStateMachine *)self context];
  id v11 = 0;
  BOOL v7 = +[CDPCompatibilityModeUpdater setSOSCompatibilityMode:v4 context:v6 error:&v11];
  id v8 = v11;

  if (v4)
  {
    id v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    id v10 = [(CDPDStateMachine *)self _makeSOSCompatibilityModeEnableEvent:v7 error:v8];
    [v9 sendEvent:v10];
  }
}

- (id)_makeSOSCompatibilityModeEnableEvent:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void *)MEMORY[0x263F202A8];
  context = self->_context;
  uint64_t v7 = *MEMORY[0x263F34738];
  uint64_t v8 = *MEMORY[0x263F34830];
  id v9 = a4;
  id v10 = [v5 analyticsEventWithContext:context eventName:v7 category:v8];
  id v11 = [NSNumber numberWithBool:v4];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F34558]];

  [v10 populateUnderlyingErrorsStartingWithRootError:v9];
  return v10;
}

- (void)_initDependenciesWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keychainSyncSystem];
  id v6 = @"SOS";
  if (!v5) {
    id v6 = @"Octagon";
  }
  uint64_t v7 = v6;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _initDependenciesWithContext:]();
  }

  if ([v4 keychainSyncSystem] == 1)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F343E8]) initWithContext:v4];
    id v10 = [[CDPDSOSCircleController alloc] initWithUiProvider:self->_uiProvider delegate:self circleProxy:v9 octagonTrustProxy:0];
    circleController = self->_circleController;
    self->_circleController = (CDPDCircleControl *)v10;

    id v12 = [[CDPDSOSSecureBackupController alloc] initWithContext:v4 uiProvider:self->_uiProvider delegate:self];
    secureBackupController = self->_secureBackupController;
    self->_secureBackupController = (CDPDSecureBackupControl *)v12;
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F34340]) initWithContext:v4];
    id v14 = [CDPDCircleController alloc];
    uiProvider = self->_uiProvider;
    int v16 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:v4];
    id v17 = [(CDPDCircleController *)v14 initWithUiProvider:uiProvider delegate:self circleProxy:v9 octagonTrustProxy:v16];
    id v18 = self->_circleController;
    self->_circleController = v17;

    id v19 = [[CDPDSecureBackupController alloc] initWithContext:v4 uiProvider:self->_uiProvider delegate:self];
    objc_storeStrong((id *)&self->_secureBackupController, v19);
    objc_storeStrong((id *)&self->_secureBackupEnableController, v19);
    secureBackupController = self->_secureBackupDisableController;
    self->_secureBackupDisableController = (CDPDSecureBackupDisableCapable *)v19;
  }

  id v20 = [CDPDPCSController alloc];
  id v21 = objc_alloc_init(MEMORY[0x263F343D0]);
  id v22 = [(CDPDPCSController *)v20 initWithContext:v4 pcsProxy:v21];
  pcsController = self->_pcsController;
  self->_pcsController = v22;

  uint64_t v24 = objc_alloc_init(CDPDAuthProxyImpl);
  id v25 = [[CDPDEDPRecoveryController alloc] initWithContext:v4 uiProvider:self->_uiProvider authProvider:v24 pcsController:self->_pcsController];
  [(CDPDStateMachine *)self setEdpController:v25];
}

- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (v6)
  {
    if (self->_context) {
      goto LABEL_19;
    }
    uint64_t v7 = [MEMORY[0x263F34328] sharedInstance];
    uint64_t v8 = [v7 contextForPrimaryAccount];
    context = self->_context;
    self->_context = v8;

    if (self->_context)
    {
LABEL_19:
      if (CFPreferencesGetAppBooleanValue(@"FakeRepairStateRequired", @"com.apple.corecdp", 0))
      {
        id v10 = _CDPLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:]();
        }

        v6[2](v6, 1, 0);
      }
      else
      {
        id v11 = [(CDPDCircleControl *)self->_circleController circleProxy];
        [v11 waitForUpdate];

        id v12 = [(CDPContext *)self->_context passwordEquivToken];

        if (v12)
        {
          [(CDPDStateMachine *)self _continueShouldPerformRepairWithOptionForceFetch:v4 completion:v6];
        }
        else
        {
          id v22 = _CDPLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Missing PET, starting to re-authenticate", buf, 2u);
          }

          id v23 = [(NSXPCConnection *)self->_connection processName];
          uint64_t v24 = [(NSXPCConnection *)self->_connection bundleID];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke;
          v25[3] = &unk_264330C58;
          v25[4] = self;
          BOOL v27 = v4;
          id v26 = v6;
          +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithClientAppName:v23 clientAppBundleId:v24 withCompletion:v25];
        }
      }
    }
    else
    {
      uint64_t v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:](v13, v14, v15, v16, v17, v18, v19, v20);
      }

      id v21 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5102);
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v21);
    }
  }
}

void __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    [*(id *)(a1 + 32) _refreshAndAuthenticateWithContext:v8];
    [*(id *)(a1 + 32) _continueShouldPerformRepairWithOptionForceFetch:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
}

- (void)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (!v6) {
    goto LABEL_13;
  }
  if (self->_context) {
    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  context = self->_context;
  self->_context = v7;

  if (self->_context)
  {
    -[CDPDStateMachine _initDependenciesWithContext:](self, "_initDependenciesWithContext:");
LABEL_5:
    if (CFPreferencesGetAppBooleanValue(@"FakeRepairStateRequired", @"com.apple.corecdp", 0))
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:]();
      }

      v6[2](v6, 1, 0);
    }
    else
    {
      id v10 = [(CDPDCircleControl *)self->_circleController circleProxy];
      [v10 waitForUpdate];

      [(CDPDStateMachine *)self _continueShouldPerformRepairWithOptionForceFetch:v4 completion:v6];
    }
    goto LABEL_13;
  }
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CDPDStateMachine shouldPerformRepairWithOptionForceFetch:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5102);
  ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v19);

LABEL_13:
}

- (void)_shouldAttemptGuitarfishRepairWithCompletion:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    id v5 = [(CDPDStateMachine *)self context];
    if ([v5 edpState] == 2)
    {
      int v6 = [(CDPContext *)self->_context isBeneficiaryFlow];

      if (!v6)
      {
        uint64_t v7 = [(CDPDStateMachine *)self edpController];
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        _DWORD v8[2] = __65__CDPDStateMachine__shouldAttemptGuitarfishRepairWithCompletion___block_invoke;
        v8[3] = &unk_26432EEB0;
        id v9 = v4;
        [v7 validateEDPIdentitiesWithCompletion:v8];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
LABEL_8:
}

uint64_t __65__CDPDStateMachine__shouldAttemptGuitarfishRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  _CDPStateErrorWithUnderlying();
  objc_claimAutoreleasedReturnValue();
  switch(a2)
  {
    case 0:
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        id v5 = *(void (**)(void))(v6 + 16);
        goto LABEL_8;
      }
      break;
    case 1:
    case 2:
    case 4:
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4)
      {
        id v5 = *(void (**)(void))(v4 + 16);
        goto LABEL_8;
      }
      break;
    case 8:
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7)
      {
        id v5 = *(void (**)(void))(v7 + 16);
LABEL_8:
        v5();
      }
      break;
    default:
      break;
  }
  return MEMORY[0x270F9A790]();
}

- (void)_continueShouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v7 = v6;
  id v35 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke_154;
  v32[3] = &unk_26432EDC0;
  v32[4] = self;
  id v9 = v8;
  id v33 = v9;
  id v10 = (void (**)(void *, uint64_t, void *))_Block_copy(v32);
  if ([(CDPContext *)self->_context isiCDPEligible])
  {
    id v11 = [(CDPDCircleControl *)self->_circleController circleProxy];
    id v31 = 0;
    uint64_t v12 = [v11 combinedCircleStatus:&v31];
    id v13 = v31;

    BOOL v14 = [(CDPDStateMachine *)self _localDeviceHasLocalSecret];
    BOOL v15 = v14;
    if (v12 == 4 && !v14)
    {
      uint64_t v16 = _CDPLogSystem();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = (uint64_t)v13;
      uint64_t v17 = "HSA2/MAID account that has no local secret and never had a circle, repair not suggested (circle status: CDPS"
            "yncingStatusAbsent, error: %@)";
      uint64_t v18 = v16;
      uint32_t v19 = 12;
      goto LABEL_29;
    }
    if (v12 != 1)
    {
      id v21 = _CDPLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [NSNumber numberWithUnsignedInteger:v12];
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = (uint64_t)v22;
        __int16 v38 = 2112;
        id v39 = v13;
        _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "HSA2/MAID account that is not in circle, suggesting repair needed: %@, %@", buf, 0x16u);
      }
      if (v10)
      {
        id v23 = _CDPStateErrorWithUnderlying();
        v10[2](v10, 1, v23);
      }
      goto LABEL_32;
    }
    if ([(CDPContext *)self->_context isBeneficiaryAccount])
    {
      uint64_t v16 = _CDPLogSystem();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = "Local account is a beneficiary alias and is already in circle, repair not needed";
LABEL_28:
      uint64_t v18 = v16;
      uint32_t v19 = 2;
LABEL_29:
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_30:

      if (v10) {
        v10[2](v10, 0, 0);
      }
      goto LABEL_32;
    }
    if (!v15)
    {
      uint64_t v16 = _CDPLogSystem();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = "Local device does not have local secret and is already in circle, repair not needed";
      goto LABEL_28;
    }
    uint64_t v24 = [(CDPDStateMachine *)self _makeEscrowRecordControllerWithCurrentContext];
    if (v24)
    {
      if (v4) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 0;
      }
      id v26 = _CDPLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v37 = v25;
        __int16 v38 = 2112;
        id v39 = v24;
        __int16 v40 = 2112;
        int v41 = self;
        _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "Using fetchSource (%lu) for escrow record controller (%@) in state machine (%@)", buf, 0x20u);
      }

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke_155;
      v29[3] = &unk_264330C80;
      unint64_t v30 = v10;
      [v24 generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:v25 withCompletion:v29];
      BOOL v27 = v30;
    }
    else
    {
      id v28 = _CDPLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[CDPDStateMachine _continueShouldPerformRepairWithOptionForceFetch:completion:]();
      }

      if (!v10) {
        goto LABEL_39;
      }
      BOOL v27 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
      v10[2](v10, 0, v27);
    }

LABEL_39:
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v20, OS_LOG_TYPE_DEFAULT, "non-HSA2/allowed MAID account detected, skipping validation", buf, 2u);
  }

  if (v10) {
    v10[2](v10, 0, 0);
  }
LABEL_33:
}

void __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "shouldPerformRepair: %{BOOL}d, error: %{public}@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

uint64_t __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke_154(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) != 0)
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
  else
  {
    BOOL v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "CDP Repair does not appear to be needed, checking with EDP...", v7, 2u);
    }

    return [*(id *)(a1 + 32) _shouldAttemptGuitarfishRepairWithCompletion:*(void *)(a1 + 40)];
  }
}

void __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v10 = [v5 deviceViability];
    uint64_t v11 = [v10 recordViability];

    if (v11 == 1)
    {
      uint64_t v12 = [v5 deviceViability];
      char v13 = [v12 hasMachineId];

      if (v13)
      {
        int v14 = [MEMORY[0x263F34400] shouldValidatePasscodeGenerations];
        BOOL v15 = [v5 deviceViability];
        uint64_t v16 = [v15 localSecretViability];

        uint64_t v17 = _CDPLogSystem();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (!v14 || v16 != 3)
        {
          if (v18)
          {
            LOWORD(v25) = 0;
            _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Local device record is viable. No need for repair.", (uint8_t *)&v25, 2u);
          }

          uint64_t v24 = *(void *)(a1 + 32);
          if (v24) {
            (*(void (**)(uint64_t, void, void))(v24 + 16))(v24, 0, 0);
          }
          goto LABEL_24;
        }
        if (v18)
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Passcode generation associated with the escrow record does not appear to match the local one.", (uint8_t *)&v25, 2u);
        }

        uint64_t v19 = *(void *)(a1 + 32);
        if (!v19) {
          goto LABEL_24;
        }
        uint64_t v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v21 = -5322;
      }
      else
      {
        id v23 = _CDPLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "Device does not have a machine ID.", (uint8_t *)&v25, 2u);
        }

        uint64_t v19 = *(void *)(a1 + 32);
        if (!v19) {
          goto LABEL_24;
        }
        uint64_t v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v21 = -5312;
      }
    }
    else
    {
      id v22 = _CDPLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Escrow record for current device is not viable", (uint8_t *)&v25, 2u);
      }

      uint64_t v19 = *(void *)(a1 + 32);
      if (!v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = -5305;
    }
    __int16 v9 = objc_msgSend(v20, "cdp_errorWithCode:", v21);
    (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, 1, v9);
    goto LABEL_23;
  }
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Found error while attempting to generate escrow status report: %@", (uint8_t *)&v25, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    __int16 v9 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5311, v6);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
LABEL_23:
  }
LABEL_24:
}

- (id)_makeEscrowRecordControllerWithCurrentContext
{
  uint64_t v2 = [[CDPDEscrowRecordController alloc] initWithContext:self->_context];
  return v2;
}

- (BOOL)_localDeviceHasLocalSecret
{
  uint64_t v2 = [MEMORY[0x263F343A8] sharedInstance];
  char v3 = [v2 hasLocalSecret];

  return v3;
}

- (id)_predicateForRepair
{
  uint64_t v2 = [(CDPDCircleControl *)self->_circleController peerID];
  char v3 = v2;
  if (v2)
  {
    BOOL v4 = (void *)MEMORY[0x263F08A98];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__CDPDStateMachine__predicateForRepair__block_invoke;
    v7[3] = &unk_26432F228;
    id v8 = v2;
    id v5 = [v4 predicateWithBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __39__CDPDStateMachine__predicateForRepair__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_predicateForRecordUpgradeCheckIgnoringBottled
{
  uint64_t v2 = [(CDPDCircleControl *)self->_circleController peerID];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A98];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__CDPDStateMachine__predicateForRecordUpgradeCheckIgnoringBottled__block_invoke;
    v7[3] = &unk_26432F228;
    id v8 = v2;
    id v5 = [v4 predicateWithBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL __66__CDPDStateMachine__predicateForRecordUpgradeCheckIgnoringBottled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 machineID];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_predicateForRecordUpgradeCheck
{
  uint64_t v2 = [(CDPDCircleControl *)self->_circleController peerID];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A98];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__CDPDStateMachine__predicateForRecordUpgradeCheck__block_invoke;
    v7[3] = &unk_26432F228;
    id v8 = v2;
    id v5 = [v4 predicateWithBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL __51__CDPDStateMachine__predicateForRecordUpgradeCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 machineID];
    if (v5)
    {
      BOOL v6 = [v3 simplePublicKey];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_fetchUserInfo
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "piggybackingApprovalEligible is not available in caches...fetching from server", v2, v3, v4, v5, v6);
}

void __34__CDPDStateMachine__fetchUserInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint8_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __34__CDPDStateMachine__fetchUserInfo__block_invoke_cold_1();
  }
}

- (void)repairCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4 = a3;
  [(CDPDStateMachine *)self _updateSOSCompatibilityMode];
  [(CDPDStateMachine *)self _fetchUserInfo];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine repairCloudDataProtectionStateWithCompletion:](self);
  }

  if (![(CDPDStateMachine *)self _isInSOSCircle])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke;
    aBlock[3] = &unk_2643307D8;
    void aBlock[4] = self;
    id v6 = v4;
    id v18 = v6;
    BOOL v7 = _Block_copy(aBlock);
    if (([(CDPContext *)self->_context isBeneficiaryFlow] & 1) == 0
      && [(CDPContext *)self->_context edpState] == 2
      && [MEMORY[0x263F34400] isGuitarfishEnabled])
    {
      if ([(CDPContext *)self->_context type] == 2)
      {
        id v8 = _CDPLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine repairCloudDataProtectionStateWithCompletion:](self);
        }

        __int16 v9 = [(CDPDStateMachine *)self edpController];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_166;
        v15[3] = &unk_26432F2F0;
        id v16 = v7;
        [v9 performInitialInteractiveEDPRepairWithCompletion:v15];

        id v10 = v16;
      }
      else
      {
        if ([(CDPContext *)self->_context type] != 13 && [(CDPContext *)self->_context type] != 11) {
          goto LABEL_13;
        }
        uint64_t v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine repairCloudDataProtectionStateWithCompletion:](self);
        }

        uint64_t v12 = [(CDPDStateMachine *)self edpController];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_167;
        v13[3] = &unk_26432F2F0;
        id v14 = v7;
        [v12 silentlyRepairEDPStateWithCompletion:v13];

        id v10 = v14;
      }
    }
    else
    {
      [(CDPDStateMachine *)self _continueRepairCloudDataProtectionStateWithCompletion:v6];
    }
LABEL_13:

    goto LABEL_14;
  }
  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
LABEL_14:
}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_165;
    v8[3] = &unk_26432ED48;
    id v4 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 _continueShouldPerformRepairWithOptionForceFetch:1 completion:v8];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) context];
    [v6 setForceInteractiveCDPEDPRepair:1];

    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) _continueRepairCloudDataProtectionStateWithCompletion:*(void *)(a1 + 40)];
  }
}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_165(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v7) {
      __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_165_cold_1();
    }

    [*(id *)(a1 + 32) _continueRepairCloudDataProtectionStateWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (v7) {
      __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_165_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
    }
  }
}

uint64_t __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_167(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_continueRepairCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDStateMachine__continueRepairCloudDataProtectionStateWithCompletion___block_invoke;
  aBlock[3] = &unk_26432EDC0;
  void aBlock[4] = self;
  id v5 = v4;
  id v18 = v5;
  id v6 = _Block_copy(aBlock);
  if ([(CDPDCircleControl *)self->_circleController circleStatus] != 1)
  {
    uint64_t v8 = [(CDPContext *)self->_context password];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [MEMORY[0x263F34328] sharedInstance];
      uint64_t v11 = [v10 primaryAccountStashedPRK];
      if (v11)
      {

LABEL_11:
        uint64_t v12 = [(CDPDCircleControl *)self->_circleController circleProxy];
        [v12 registerCredentials];

        [(CDPDStateMachine *)self _authenticatedRepairCloudDataProtectionStateWithCompletion:v6];
        goto LABEL_20;
      }
      BOOL v13 = [(CDPDStateMachine *)self _eligibleToSkipAuth];

      if (v13) {
        goto LABEL_11;
      }
    }
    else if ([(CDPDStateMachine *)self _eligibleToSkipAuth])
    {
      goto LABEL_11;
    }
    id v14 = [(CDPContext *)self->_context password];
    if (v14)
    {
    }
    else if (![(CDPDStateMachine *)self _eligibleForSilentAuthenticatedRepair])
    {
      [(CDPDStateMachine *)self _performInteractivelyAuthenticatedRepair:v6];
      goto LABEL_20;
    }
    BOOL v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Attempt silent authentication as we do not have stashed PRK and we do have password.", v16, 2u);
    }

    goto LABEL_19;
  }
  if (![MEMORY[0x263F34400] isAudioAccessory])
  {
LABEL_19:
    [(CDPDStateMachine *)self _performSilentlyAuthenticatedRepair:v6];
    goto LABEL_20;
  }
  BOOL v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "[HomePod only] We are already in circle, ignoring repair request and calling completion(true, nil)", v16, 2u);
  }

  if (v5) {
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
  }
LABEL_20:
}

void __74__CDPDStateMachine__continueRepairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
  BOOL v7 = v6;
  if (a2)
  {
    [v6 reportSuccess];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    _DWORD v10[2] = __74__CDPDStateMachine__continueRepairCloudDataProtectionStateWithCompletion___block_invoke_2;
    v10[3] = &unk_264330CC8;
    uint64_t v8 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    char v13 = 1;
    id v11 = v5;
    [v8 _joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion:v10];
  }
  else
  {
    [v6 reportFailure:v5];

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
}

uint64_t __74__CDPDStateMachine__continueRepairCloudDataProtectionStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)_eligibleToSkipAuth
{
  uint64_t v3 = [(CDPContext *)self->_context passwordEquivToken];
  if (v3) {
    BOOL v4 = [(CDPDStateMachine *)self _eligibleForSilentAuthenticatedRepair];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_eligibleForSilentAuthenticatedRepair
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = +[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled];
  BOOL v4 = _CDPLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      -[CDPDStateMachine _eligibleForSilentAuthenticatedRepair]();
    }

    uint64_t v6 = [(CDPContext *)self->_context keychainSyncSystem];
    BOOL v7 = [(CDPDStateMachine *)self _needsSOSRepair];
    if (v6) {
      int v8 = 0;
    }
    else {
      int v8 = !v7;
    }
    BOOL v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v10[0] = 67109632;
      v10[1] = v6 == 0;
      __int16 v11 = 1024;
      BOOL v12 = v7;
      __int16 v13 = 1024;
      int v14 = v8;
      _os_log_debug_impl(&dword_218640000, v4, OS_LOG_TYPE_DEBUG, "Determined silent auth eligibility (isOT:%i, needsSOSRepair:%i): %i", (uint8_t *)v10, 0x14u);
    }
  }
  else
  {
    if (v5) {
      -[CDPDStateMachine _eligibleForSilentAuthenticatedRepair]();
    }
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)_needsSOSRepair
{
  if (![(CDPContext *)self->_context isSOSCompatibilityOptInNeeded]) {
    return 0;
  }
  BOOL v3 = (void *)MEMORY[0x263F343E8];
  BOOL v4 = [(CDPContext *)self->_context altDSID];
  BOOL v5 = [v3 syncingStatusForAltDSID:v4] != 1;

  return v5;
}

- (void)_performSilentlyAuthenticatedRepair:(id)a3
{
  id v4 = a3;
  BOOL v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Starting silent authentication for repair", buf, 2u);
  }

  context = self->_context;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke;
  v8[3] = &unk_26432EE88;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[CDPAuthenticationHelper silentAuthenticationForContext:context withCompletion:v8];
}

void __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    objc_msgSend(v7, "set_alwaysCreateEscrowRecord:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_alwaysCreateEscrowRecord"));
    objc_msgSend(v7, "setType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "type"));
    objc_msgSend(v7, "setSosCompatibilityType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sosCompatibilityType"));
    objc_msgSend(v7, "setKeychainSyncSystem:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "keychainSyncSystem"));
    objc_msgSend(v7, "setIsSOSCFUFlow:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "isSOSCFUFlow"));
    int v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      uint64_t v15 = [v7 type];
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "_performSilentlyAuthenticatedRepair: set refreshedContext type to %ld", (uint8_t *)&v14, 0xCu);
    }

    id v9 = [*(id *)(*(void *)(a1 + 32) + 8) password];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 8) oldPassword];
    [v7 setNewPassword:v9 oldPassword:v10];

    __int16 v11 = [*(id *)(*(void *)(a1 + 32) + 8) cachedLocalSecret];
    [v7 setCachedLocalSecret:v11];

    objc_msgSend(v7, "setCachedLocalSecretType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cachedLocalSecretType"));
    BOOL v12 = [*(id *)(*(void *)(a1 + 32) + 8) sharingChannel];
    [v7 setSharingChannel:v12];

    objc_msgSend(v7, "setDidAttemptSecureBackupEnablement:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "didAttemptSecureBackupEnablement"));
    objc_msgSend(v7, "setWillAttemptAsyncSecureBackupEnablement:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "willAttemptAsyncSecureBackupEnablement"));
    objc_msgSend(v7, "setSecureBackupEnablementNotRequired:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "secureBackupEnablementNotRequired"));
    objc_msgSend(v7, "setForceInteractiveCDPEDPRepair:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "forceInteractiveCDPEDPRepair"));
    [*(id *)(a1 + 32) _refreshAndAuthenticateWithContext:v7];
    [*(id *)(a1 + 32) _authenticatedRepairCloudDataProtectionStateWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    __int16 v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _performInteractivelyAuthenticatedRepair:*(void *)(a1 + 40)];
  }
}

- (void)_performInteractivelyAuthenticatedRepair:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (self->_uiProvider)
  {
    id v6 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    uiProvider = self->_uiProvider;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke;
    v9[3] = &unk_26432EE88;
    v9[4] = self;
    id v10 = v5;
    [(CDPStateUIProviderInternal *)uiProvider cdpContext:v6 promptForInteractiveAuthenticationWithCompletion:v9];
  }
  else if (v4)
  {
    int v8 = _CDPStateError();
    ((void (**)(void, void, void *))v5)[2](v5, 0, v8);
  }
}

void __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    objc_msgSend(v7, "set_alwaysCreateEscrowRecord:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_alwaysCreateEscrowRecord"));
    objc_msgSend(v7, "setSosCompatibilityType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sosCompatibilityType"));
    objc_msgSend(v7, "setKeychainSyncSystem:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "keychainSyncSystem"));
    objc_msgSend(v7, "setIsSOSCFUFlow:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "isSOSCFUFlow"));
    objc_msgSend(v7, "setType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "type"));
    int v8 = [*(id *)(*(void *)(a1 + 32) + 8) cachedLocalSecret];
    [v7 setCachedLocalSecret:v8];

    objc_msgSend(v7, "setCachedLocalSecretType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cachedLocalSecretType"));
    objc_msgSend(v7, "setDidAttemptSecureBackupEnablement:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "didAttemptSecureBackupEnablement"));
    objc_msgSend(v7, "setWillAttemptAsyncSecureBackupEnablement:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "willAttemptAsyncSecureBackupEnablement"));
    objc_msgSend(v7, "setSecureBackupEnablementNotRequired:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "secureBackupEnablementNotRequired"));
    [*(id *)(a1 + 32) _refreshAndAuthenticateWithContext:v7];
    [*(id *)(a1 + 32) _authenticatedRepairCloudDataProtectionStateWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
    }
  }
}

- (void)_refreshAndAuthenticateWithContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing with context", (uint8_t *)&v19, 2u);
  }

  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  int v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(CDPContext *)*p_context type];
    uint64_t v10 = [(CDPContext *)*p_context appleID];
    __int16 v11 = [(CDPContext *)*p_context dsid];
    BOOL v12 = [(CDPContext *)*p_context altDSID];
    int v19 = 134219522;
    uint64_t v20 = v9;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    __int16 v25 = 2160;
    uint64_t v26 = 1752392040;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "_refreshAndAuthenticateWithContext: context type: %ld, appleID: %{mask.hash}@, dsid: %{mask.hash}@, adsid: %{mask.hash}@", (uint8_t *)&v19, 0x48u);
  }
  [(CDPDStateMachine *)self _initDependenciesWithContext:v5];
  __int16 v13 = [CDPDPCSController alloc];
  context = self->_context;
  id v15 = objc_alloc_init(MEMORY[0x263F343D0]);
  uint64_t v16 = [(CDPDPCSController *)v13 initWithContext:context pcsProxy:v15];
  pcsController = self->_pcsController;
  self->_pcsController = v16;

  id v18 = [(CDPDCircleControl *)self->_circleController circleProxy];
  [v18 registerCredentials];
}

- (void)_authenticatedRepairCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __79__CDPDStateMachine__authenticatedRepairCloudDataProtectionStateWithCompletion___block_invoke;
  v6[3] = &unk_26432F2F0;
  id v7 = v4;
  id v5 = v4;
  [(CDPDStateMachine *)self handleCloudDataProtectionStateWithCompletion:v6];
}

uint64_t __79__CDPDStateMachine__authenticatedRepairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  }
  return result;
}

- (BOOL)shouldAllowCDPEnrollment
{
  return 1;
}

- (void)_preflightAccountStateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
  uint64_t v10 = v9;
  if (v9)
  {
    __int16 v11 = [v9 accountProperties];
    BOOL v12 = [v11 objectForKeyedSubscript:@"personID"];

    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v13 = [v6 dsid];
    if (!v13) {
      goto LABEL_6;
    }
    int v14 = (void *)v13;
    id v15 = [v6 dsid];
    uint64_t v16 = [v15 stringValue];
    int v17 = [v12 isEqualToString:v16];

    if (v17)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke;
      v21[3] = &unk_26432F680;
      id v22 = v7;
      [(CDPDStateMachine *)self _enableKVSForAccount:v10 store:v8 completion:v21];
      id v18 = v22;
    }
    else
    {
LABEL_6:
      int v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CDPDStateMachine _preflightAccountStateWithContext:completion:]((uint64_t)v12, v6, v19);
      }

      if (!v7) {
        goto LABEL_15;
      }
      id v18 = _CDPStateError();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
    }

LABEL_15:
    goto LABEL_16;
  }
  uint64_t v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CDPDStateMachine _preflightAccountStateWithContext:completion:]();
  }

  if (v7)
  {
    BOOL v12 = _CDPStateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_15;
  }
LABEL_16:
}

void __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    int v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      id v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }
}

- (void)_enableKVSForAccount:(id)a3 store:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _enableKVSForAccount:store:completion:]();
  }

  __int16 v11 = [v7 enabledDataclasses];
  uint64_t v12 = *MEMORY[0x263EFB428];
  char v13 = [v11 containsObject:*MEMORY[0x263EFB428]];

  int v14 = _CDPLogSystem();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "KVS is already enabled!", buf, 2u);
    }

    if (v9) {
      v9[2](v9, 1, 0);
    }
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Enabling KVS...", buf, 2u);
    }

    [v7 setEnabled:1 forDataclass:v12];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__CDPDStateMachine__enableKVSForAccount_store_completion___block_invoke;
    v16[3] = &unk_26432F680;
    int v17 = v9;
    [v8 saveAccount:v7 withCompletionHandler:v16];
  }
}

void __58__CDPDStateMachine__enableKVSForAccount_store_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling KVS with success=%i error=%{public}@", buf, 0x12u);
  }

  if (a2)
  {
    id v7 = 0;
  }
  else
  {
    if (v5)
    {
      uint64_t v10 = *MEMORY[0x263F08608];
      id v11 = v5;
      id v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    }
    else
    {
      id v8 = 0;
    }
    id v7 = _CDPStateError();
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v7);
  }
}

- (void)_confirmCDPEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CDPDStateMachine *)self shouldAllowCDPEnrollment])
  {
    secureBackupController = self->_secureBackupController;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __57__CDPDStateMachine__confirmCDPEligibilityWithCompletion___block_invoke;
    v8[3] = &unk_26432F680;
    id v9 = v4;
    [(CDPDSecureBackupControl *)secureBackupController isEligibleForCDPWithCompletion:v8];
  }
  else
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Enabling iCDP on sign-in is disabled", v7, 2u);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __57__CDPDStateMachine__confirmCDPEligibilityWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_checkSecureBackupCachedSecretValue
{
  return [MEMORY[0x263F34400] useCDPContextSecretInsteadOfSBDSecretFeatureEnabled] ^ 1;
}

- (void)_recoverSecureBackupWithCircleJoinResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDPDStateMachine *)self context];
  int v9 = [v8 isLocalSecretCached];

  if (v9)
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to recover backup using the cached local secret...", buf, 2u);
    }

    id v11 = [(CDPContext *)self->_context cachedLocalSecret];
    uint64_t v12 = [(CDPContext *)self->_context cachedLocalSecretType];
    int v13 = [(CDPDStateMachine *)self context];
    uint64_t v14 = [v13 _useSecureBackupCachedPassphrase];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke;
    v20[3] = &unk_26432F2F0;
    id v21 = v7;
    [(CDPDStateMachine *)self _attemptBackupRecoveryWithLocalSecret:v11 type:v12 useSecureBackupCachedSecret:v14 circleJoinResult:v6 completion:v20];

    id v15 = v21;
    goto LABEL_11;
  }
  if ([(CDPContext *)self->_context keychainSyncSystem] == 1)
  {
    uint64_t v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Attempting to recover backup without using local secret for SOS Compatibility Mode", buf, 2u);
    }

    [(CDPDStateMachine *)self _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:0 localSecretType:0 useSecureBackupCachedSecret:0 circleJoinResult:v6 completion:v7];
  }
  else
  {
    if (self->_uiProvider)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke_173;
      v18[3] = &unk_26432F2F0;
      id v19 = v7;
      [(CDPDStateMachine *)self _handleInteractiveRecoveryFlowWithCircleJoinResult:v6 completion:v18];
      id v15 = v19;
LABEL_11:

      goto LABEL_12;
    }
    int v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CDPDStateMachine _recoverSecureBackupWithCircleJoinResult:completion:]();
    }

    if (v7) {
      (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
    }
  }
LABEL_12:
}

void __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 1024;
    int v12 = a3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Finished recovery attempt using the cached local secret with didRecover=%i didRequestReset=%i error=%@", (uint8_t *)v10, 0x18u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);
  }
}

void __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke_173(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 1024;
    int v12 = a3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Finished recovery attempt using the secret provided by user. didRecover=%i didRequestReset=%i error=%@", (uint8_t *)v10, 0x18u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);
  }
}

- (void)_handleInteractiveRecoveryFlowWithCircleJoinResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F343A8] sharedInstance];
  int v9 = [v8 hasLocalSecret];

  if (v9)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke;
    aBlock[3] = &unk_264330CF0;
    void aBlock[4] = self;
    id v20 = v6;
    id v21 = v7;
    id v10 = v7;
    __int16 v11 = _Block_copy(aBlock);
    int v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Prompting for local secret before recovering backup", buf, 2u);
    }

    [(CDPStateUIProviderInternal *)self->_uiProvider cdpContext:self->_context promptForLocalSecretWithCompletion:v11];
    __int16 v13 = v20;
  }
  else
  {
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Proceeding with backup recovery attempt without a local device secret", buf, 2u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_176;
    v16[3] = &unk_26432F2F0;
    id v17 = v7;
    id v15 = v7;
    [(CDPDStateMachine *)self _attemptBackupRecoveryWithLocalSecret:0 type:0 useSecureBackupCachedSecret:0 circleJoinResult:v6 completion:v16];
    __int16 v13 = v17;
  }
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Proceeding with backup recovery attempt now that the local secret is known...", buf, 2u);
    }

    int v9 = [v5 validatedSecret];
    [*(id *)(*(void *)(a1 + 32) + 8) setCachedLocalSecret:v9];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setCachedLocalSecretType:", objc_msgSend(v5, "secretType"));
    id v10 = *(void **)(a1 + 32);
    __int16 v11 = [v5 validatedSecret];
    uint64_t v12 = [v5 secretType];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_174;
    v15[3] = &unk_26432F2F0;
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    [v10 _attemptBackupRecoveryWithLocalSecret:v11 type:v12 useSecureBackupCachedSecret:0 circleJoinResult:v13 completion:v15];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_cold_1();
    }

    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, void, void, id))(v14 + 16))(v14, 0, 0, v6);
    }
  }
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_174(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_174_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);
  }
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_176(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Finished backup recovery attempt without local secret with didRecover=%i error=%@", (uint8_t *)v10, 0x12u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);
  }
}

- (void)_attemptBackupRecoveryWithLocalSecret:(id)a3 type:(unint64_t)a4 useSecureBackupCachedSecret:(BOOL)a5 circleJoinResult:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v41 = a7;
  uint64_t v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:]();
  }

  id v15 = [(CDPDStateMachine *)self secureBackupController];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    __int16 v23 = 0;
    id v18 = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v16 = [(CDPDStateMachine *)self secureBackupController];
  id v53 = 0;
  int v17 = [v16 supportsRecoveryKeyWithError:&v53];
  id v18 = v53;

  if (!v17)
  {
    __int16 v23 = 0;
    if (!v18) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  id v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:]();
  }

  id v20 = +[CDPRecoveryKeyCache sharedInstance];
  id v21 = [(CDPDStateMachine *)self context];
  id v22 = [v21 altDSID];
  __int16 v23 = [v20 fetchRecoveryKeyFromCacheForAltDSID:v22];

  if (v18)
  {
LABEL_11:
    id v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:]();
    }
    goto LABEL_13;
  }
LABEL_14:
  if (v12) {
    int v24 = 1;
  }
  else {
    int v24 = v9;
  }
  if (v23) {
    int v25 = 1;
  }
  else {
    int v25 = v24;
  }
  uint64_t v26 = _CDPLogSystem();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      id v28 = @"recovery key...";
      if (!v23) {
        id v28 = @"local secret...";
      }
      *(_DWORD *)buf = 138412290;
      v55 = v28;
      _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "Attempting SILENT recovery with the %@", buf, 0xCu);
    }

    __int16 v29 = objc_alloc_init(CDPDSecureBackupContext);
    [(CDPDSecureBackupContext *)v29 setLocalSecret:v12];
    [(CDPDSecureBackupContext *)v29 setRecoverySecret:v12];
    [(CDPDSecureBackupContext *)v29 setUsePreviouslyCachedSecret:v9];
    [(CDPDSecureBackupContext *)v29 setSilentRecovery:1];
    [(CDPDSecureBackupContext *)v29 setLocalSecretType:a4];
    [(CDPDSecureBackupContext *)v29 setCircleJoinResult:v13];
    uint64_t v30 = [(CDPDSecureBackupContext *)v29 recoveryKey];
    __int16 v31 = (void *)v30;
    if (v30) {
      uint64_t v32 = (void *)v30;
    }
    else {
      uint64_t v32 = v23;
    }
    [(CDPDSecureBackupContext *)v29 setRecoveryKey:v32];

    if ([MEMORY[0x263F34400] isSilentBurnInMiniBuddyEnabled])
    {
      uint64_t v33 = [(CDPDStateMachine *)self context];
      BOOL v34 = [v33 type] == 10;

      if (v34)
      {
        id v35 = _CDPLogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218640000, v35, OS_LOG_TYPE_DEFAULT, "Adding non-viable throttle header in silent burn in mini-buddy flow", buf, 2u);
        }

        [(CDPDSecureBackupContext *)v29 setNonViableRequiresRepair:1];
      }
    }
    [(CDPDCircleControl *)self->_circleController prepareCircleStateForRecovery];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke;
    aBlock[3] = &unk_264330D18;
    void aBlock[4] = self;
    id v48 = v12;
    unint64_t v51 = a4;
    BOOL v52 = v9;
    id v49 = v13;
    id v36 = v41;
    id v50 = v36;
    uint64_t v37 = _Block_copy(aBlock);
    objc_initWeak((id *)buf, self);
    secureBackupController = self->_secureBackupController;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_184;
    v42[3] = &unk_264330D40;
    objc_copyWeak(&v46, (id *)buf);
    id v39 = v37;
    id v44 = v39;
    v42[4] = self;
    __int16 v40 = v29;
    int v43 = v40;
    id v45 = v36;
    [(CDPDSecureBackupControl *)secureBackupController performEscrowRecoveryWithRecoveryContext:v40 completion:v42];

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "Local secret is not present, proceeding to recovery by prompting for remote secret", buf, 2u);
    }

    [(CDPDStateMachine *)self _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:0 localSecretType:0 useSecureBackupCachedSecret:0 circleJoinResult:v13 completion:v41];
  }
}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Silent recovery failed, attempting to recover by prompting for remote secret. error=%@", (uint8_t *)&v5, 0xCu);
  }

  if ([v3 isMissingCachedPassphraseError]) {
    [*(id *)(*(void *)(a1 + 32) + 8) setCachedPassphraseMissing:1];
  }
  [*(id *)(a1 + 32) _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:*(void *)(a1 + 40) localSecretType:*(void *)(a1 + 64) useSecureBackupCachedSecret:*(unsigned __int8 *)(a1 + 72) circleJoinResult:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_184(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v8 = [v5 recoveredClique];

      if (v8)
      {
        BOOL v9 = [*(id *)(*(void *)(a1 + 32) + 32) circleProxy];
        id v10 = [v5 recoveredClique];
        [v9 didJoinCircleAfterRecovery:v10];

        __int16 v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to enable secure backup after successful SILENT recovery", buf, 2u);
        }

        [*(id *)(a1 + 40) setNonViableRequiresRepair:0];
        uint64_t v12 = *(void *)(a1 + 40);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_185;
        v18[3] = &unk_26432F680;
        id v19 = *(id *)(a1 + 56);
        [WeakRetained _postRecoveryEnableSecureBackupWithContext:v12 completion:v18];
        id v13 = v19;
      }
      else
      {
        uint64_t v14 = _CDPLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Attempting joinAfterRestore SILENT recovery for SOS only flow", buf, 2u);
        }

        id v15 = [WeakRetained circleController];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_186;
        v16[3] = &unk_26432F680;
        id v17 = *(id *)(a1 + 56);
        [v15 joinCircleAfterRecoveryWithCompletion:v16];

        id v13 = v17;
      }
    }
  }
}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_185(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling secure backup after successful SILENT recovery with didEnable=%i error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void, id))(v7 + 16))(v7, a2, 0, v5);
  }
}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_186(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished joining circle with didJoin=%i error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void, id))(v7 + 16))(v7, a2, 0, v5);
  }
}

- (void)_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:(id)a3 localSecretType:(unint64_t)a4 useSecureBackupCachedSecret:(BOOL)a5 circleJoinResult:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:]();
  }

  id v16 = objc_alloc_init(MEMORY[0x263F343E0]);
  [(CDPDStateMachine *)self _enableCustodianRecoveryIfAvailableForContext:self->_context];
  [v16 setContext:self->_context];
  objc_msgSend(v16, "setHasPeersForRemoteApproval:", objc_msgSend(v13, "hasPeersForRemoteApproval"));
  objc_msgSend(v16, "setIsWalrusEnabled:", -[CDPContext walrusStatus](self->_context, "walrusStatus") == 1);
  id v17 = [(CDPDStateMachine *)self context];
  id v18 = -[CDPDStateMachine _recoveryFlowControllerForKeychainSyncSystem:recoveryContext:](self, "_recoveryFlowControllerForKeychainSyncSystem:recoveryContext:", [v17 keychainSyncSystem], v16);

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke;
  v23[3] = &unk_264330D68;
  id v24 = v12;
  int v25 = self;
  BOOL v30 = a5;
  id v28 = v14;
  unint64_t v29 = a4;
  id v26 = v13;
  id v27 = v16;
  id v19 = v16;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [v18 beginRecovery:v23];
}

void __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 validSecret];
  if (v7 || [v5 secretType] == 4 || objc_msgSend(v5, "secretType") == 6)
  {
  }
  else if ([v5 secretType] != 7)
  {
    if ([v5 userDidCancel])
    {
      id v14 = _CDPLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "User cancelled remote device secret entry", buf, 2u);
      }
    }
    else
    {
      int v15 = [v5 userDidReset];
      id v16 = _CDPLogSystem();
      id v14 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "User requested reset of their CDP state!", buf, 2u);
        }

        if (!*(void *)(a1 + 64)) {
          goto LABEL_10;
        }
        id v17 = [v5 cachedSecretForReenrollment];

        if (v17)
        {
          id v18 = [v5 cachedSecretForReenrollment];
          id v19 = [v18 validatedSecret];
          [*(id *)(*(void *)(a1 + 40) + 8) setCachedLocalSecret:v19];

          id v20 = [v5 cachedSecretForReenrollment];
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "setCachedLocalSecretType:", objc_msgSend(v20, "secretType"));
        }
        id v21 = [CDPEscapeOffersLedger alloc];
        uint64_t v22 = [v5 requiredEscapeOffers];
        uint64_t v23 = *(void *)(a1 + 56);
        uint64_t v24 = [MEMORY[0x263F343A8] hasLocalSecret];
        int v25 = [MEMORY[0x263F34328] sharedInstance];
        uint64_t v26 = -[CDPEscapeOffersLedger initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:](v21, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:", v22, v23, v24, v25, [MEMORY[0x263F34400] isVirtualMachine], objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "isICDPEnabledFromNetwork"));
        uint64_t v27 = *(void *)(a1 + 40);
        id v28 = *(void **)(v27 + 80);
        *(void *)(v27 + 80) = v26;

        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "insert:", objc_msgSend(v5, "escapeOffersPresentedMask"));
        id v8 = (CDPDSecureBackupContext *)[objc_alloc(MEMORY[0x263F343C0]) initWithContext:*(void *)(*(void *)(a1 + 40) + 8)];
        if ([(CDPDSecureBackupContext *)v8 isManateeAvailable:0]) {
          [*(id *)(*(void *)(a1 + 40) + 80) satisfyManateeRequirementsForEDPRPD];
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_9:

        goto LABEL_10;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_cold_1();
      }
    }

    uint64_t v29 = *(void *)(a1 + 64);
    if (!v29) {
      goto LABEL_10;
    }
    id v13 = *(void (**)(void))(v29 + 16);
    goto LABEL_17;
  }
  if (*(void *)(a1 + 32)
    || [*(id *)(a1 + 40) _checkSecureBackupCachedSecretValue] && *(unsigned char *)(a1 + 80))
  {
    id v8 = objc_alloc_init(CDPDSecureBackupContext);
    [(CDPDSecureBackupContext *)v8 setLocalSecretType:*(void *)(a1 + 72)];
    [(CDPDSecureBackupContext *)v8 setLocalSecret:*(void *)(a1 + 32)];
    [(CDPDSecureBackupContext *)v8 setUsePreviouslyCachedSecret:*(unsigned __int8 *)(a1 + 80)];
    [(CDPDSecureBackupContext *)v8 setCircleJoinResult:*(void *)(a1 + 48)];
    __int16 v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to enable secure backup after successful INTERACTIVE recovery with multiple-ICSC already in use", buf, 2u);
    }

    id v10 = *(void **)(a1 + 40);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_187;
    v30[3] = &unk_26432F680;
    id v31 = *(id *)(a1 + 64);
    [v10 _postRecoveryEnableSecureBackupWithContext:v8 completion:v30];

    goto LABEL_9;
  }
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Skipping enable of SecureBackup after successful INTERACTIVE recovery due to no local secret being present", buf, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 64);
  if (v12)
  {
    id v13 = *(void (**)(void))(v12 + 16);
LABEL_17:
    v13();
  }
LABEL_10:
}

void __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_187(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling secure backup after successful INTERACTIVE recovery with didEnable=%i error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void, id))(v7 + 16))(v7, a2, 0, v5);
  }
}

- (id)_recoveryFlowControllerForKeychainSyncSystem:(int64_t)a3 recoveryContext:(id)a4
{
  if (a3 == 1)
  {
    id v5 = a4;
    id v6 = [CDPDSOSRecoveryValidatedJoinFlowController alloc];
    uiProvider = self->_uiProvider;
    secureBackupController = self->_secureBackupController;
    __int16 v9 = [(CDPDStateMachine *)self circleController];
    id v10 = [(CDPDRecoveryFlowController *)v6 initWithContext:v5 uiProvider:uiProvider secureBackupController:secureBackupController circleController:v9];
  }
  else
  {
    id v11 = a4;
    uint64_t v12 = [CDPDRecoveryValidatedJoinFlowController alloc];
    id v13 = self->_uiProvider;
    id v14 = self->_secureBackupController;
    int v15 = [(CDPDStateMachine *)self circleController];
    id v10 = [(CDPDRecoveryFlowController *)v12 initWithContext:v11 uiProvider:v13 secureBackupController:v14 circleController:v15];

    __int16 v9 = [(CDPDStateMachine *)self edpController];
    [(CDPDRecoveryFlowController *)v10 setEdpController:v9];
  }

  return v10;
}

- (void)_enableCustodianRecoveryIfAvailableForContext:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = [v3 altDSID];
  id v6 = [v4 authKitAccountWithAltDSID:v5];

  if (v6)
  {
    uint64_t v7 = [v4 custodianEnabledForAccount:v6];
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine _enableCustodianRecoveryIfAvailableForContext:]();
    }

    __int16 v9 = v3;
    uint64_t v10 = v7;
  }
  else
  {
    __int16 v9 = v3;
    uint64_t v10 = 0;
  }
  objc_msgSend(v9, "set_supportsCustodianRecovery:", v10);
}

- (void)_postRecoveryEnableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine _postRecoveryEnableSecureBackupWithContext:completion:]();
  }

  if (self->_secureBackupEnableController)
  {
    __int16 v9 = [v6 circleJoinResult];
    if ([v9 hasPeersWithCDPBackupRecords])
    {
      BOOL v10 = [(CDPContext *)self->_context disableAsyncModeRequested];

      if (!v10)
      {
        [(CDPContext *)self->_context setWillAttemptAsyncSecureBackupEnablement:1];
        id v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CDPDStateMachine _postRecoveryEnableSecureBackupWithContext:completion:]();
        }

        uint64_t v12 = (void *)os_transaction_create();
        uint64_t v18 = MEMORY[0x263EF8330];
        uint64_t v19 = 3221225472;
        id v20 = __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke;
        id v21 = &unk_264330D90;
        id v22 = v6;
        uint64_t v23 = self;
        id v24 = v12;
        id v13 = v12;
        cdp_dispatch_async_with_qos();
        if (v7) {
          v7[2](v7, 1, 0);
        }

        goto LABEL_13;
      }
    }
    else
    {
    }
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDStateMachine _postRecoveryEnableSecureBackupWithContext:completion:]();
    }

    secureBackupEnableController = self->_secureBackupEnableController;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_193;
    v16[3] = &unk_26432EDC0;
    void v16[4] = self;
    id v17 = v7;
    [(CDPDSecureBackupEnableCapable *)secureBackupEnableController upgradeICSCRecordsThenEnableSecureBackupWithContext:v6 completion:v16];
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v13);
LABEL_13:
  }
}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v2, OS_LOG_TYPE_DEFAULT, "We don't want to back up the recovery key after silently recovering with the recovery key. Removing from backup context", buf, 2u);
  }

  [*(id *)(a1 + 32) setRecoveryKey:0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(void **)(v3 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_192;
  v6[3] = &unk_264330800;
  void v6[4] = v3;
  id v7 = *(id *)(a1 + 48);
  [v5 checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:v4 completion:v6];
}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_192(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Finished asynchronous enabling Secure Backup", buf, 2u);
  }

  if (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", -5501))
  {
    [*(id *)(a1 + 32) _postFollowUpForSecureBackupCacheInvalidationError];
  }
  else if (v4)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_192_cold_1();
    }
  }
  uint64_t v9 = 0;
  if ([MEMORY[0x263F34400] deferSOSFromSignIn]
    && SOSCCFetchCompatibilityMode())
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Skipping uncaching, letting async'd SOS state machine do the job", v8, 2u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 104) unlock];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 40) secureBackupProxy];
    [v7 uncacheAllSecrets];
  }
}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_193(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  [*(id *)(*(void *)(a1 + 32) + 8) setDidAttemptSecureBackupEnablement:1];
  if (a2)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 40) secureBackupProxy];
    [v5 uncacheAllSecrets];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) unlock];
}

- (void)_postFollowUpForSecureBackupCacheInvalidationError
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Secure backup thinks there is no cached passphrase, but there is a local secret. Due to the asynchronous nature of this code path, we can't prompt for the passcode and must instead post a CFU.", v2, v3, v4, v5, v6);
}

- (void)_enableSecureBackupWithCircleJoinResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (self->_secureBackupEnableController)
  {
    uint64_t v9 = objc_alloc_init(CDPDSecureBackupContext);
    BOOL v10 = [(CDPContext *)self->_context cachedLocalSecret];
    [(CDPDSecureBackupContext *)v9 setLocalSecret:v10];

    [(CDPDSecureBackupContext *)v9 setLocalSecretType:[(CDPContext *)self->_context cachedLocalSecretType]];
    [(CDPDSecureBackupContext *)v9 setUsePreviouslyCachedSecret:[(CDPContext *)self->_context _useSecureBackupCachedPassphrase]];
    [(CDPDSecureBackupContext *)v9 setCircleJoinResult:v6];
    id v11 = [(CDPContext *)self->_context telemetryDeviceSessionID];
    [(CDPDSecureBackupContext *)v9 setTelemetryDeviceSessionID:v11];

    uint64_t v12 = [(CDPContext *)self->_context telemetryFlowID];
    [(CDPDSecureBackupContext *)v9 setTelemetryFlowID:v12];

    if ([v6 hasPeersWithCDPBackupRecords]
      && ![(CDPContext *)self->_context disableAsyncModeRequested])
    {
      [(CDPContext *)self->_context setWillAttemptAsyncSecureBackupEnablement:1];
      id v21 = (void *)os_transaction_create();
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      uint64_t v33 = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke;
      BOOL v34 = &unk_264330D90;
      id v35 = self;
      id v36 = v9;
      id v37 = v21;
      id v22 = v21;
      cdp_dispatch_async_with_qos();
      if (v8) {
        v8[2](v8, 1, 0);
      }

      goto LABEL_18;
    }
    id v13 = [(CDPDStateMachine *)self context];
    int v14 = [v13 isLocalSecretCached];

    if (v14)
    {
      int v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to enable secure backup using the cached secret", buf, 2u);
      }

      secureBackupEnableController = self->_secureBackupEnableController;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_195;
      v28[3] = &unk_26432EDC0;
      v28[4] = self;
      uint64_t v29 = v8;
      [(CDPDSecureBackupEnableCapable *)secureBackupEnableController upgradeICSCRecordsThenEnableSecureBackupWithContext:v9 completion:v28];
      id v17 = v29;
    }
    else
    {
      if (!self->_uiProvider)
      {
        uint64_t v23 = _CDPLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CDPDStateMachine _enableSecureBackupWithCircleJoinResult:completion:]();
        }

        if (v8) {
          v8[2](v8, 0, 0);
        }
        goto LABEL_18;
      }
      uint64_t v18 = [(CDPDSecureBackupControl *)self->_secureBackupController secureBackupProxy];
      [v18 uncacheAllSecrets];

      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_196;
      aBlock[3] = &unk_264330CF0;
      int v25 = v9;
      uint64_t v26 = self;
      uint64_t v27 = v8;
      uint64_t v19 = _Block_copy(aBlock);
      id v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v20, OS_LOG_TYPE_DEFAULT, "Asking the UI provider to prompt for the local device secret", buf, 2u);
      }

      [(CDPStateUIProviderInternal *)self->_uiProvider cdpContext:self->_context promptForLocalSecretWithCompletion:v19];
      id v17 = v25;
    }

LABEL_18:
    goto LABEL_19;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    uint64_t v9 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, CDPDSecureBackupContext *))v8)[2](v8, 0, v9);
    goto LABEL_18;
  }
LABEL_19:
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_2;
  v4[3] = &unk_264330800;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v3 enableSecureBackupWithContext:v2 completion:v4];
}

uint64_t __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_218640000, v2, OS_LOG_TYPE_DEFAULT, "Finished asynchronous enabling Secure Backup", v5, 2u);
  }

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) secureBackupProxy];
  [v3 uncacheAllSecrets];

  return [*(id *)(*(void *)(a1 + 32) + 104) unlock];
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_195(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 8) setDidAttemptSecureBackupEnablement:1];
  if (a2)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 40) secureBackupProxy];
    [v6 uncacheAllSecrets];
  }
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Finished enabling secure backup using the cached secret with didEnable=%i error=%@", (uint8_t *)v9, 0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) unlock];
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocalSecretType:", objc_msgSend(v5, "secretType"));
    uint64_t v8 = [v5 validatedSecret];
    [*(id *)(a1 + 32) setLocalSecret:v8];

    [*(id *)(a1 + 32) setUsePreviouslyCachedSecret:0];
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Got a valid local secret, attempting to enable secure backup", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v10 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_197;
    v17[3] = &unk_26432EDC0;
    void v17[4] = v10;
    id v18 = *(id *)(a1 + 48);
    [v12 upgradeICSCRecordsThenEnableSecureBackupWithContext:v11 completion:v17];
  }
  else
  {
    uint64_t v13 = [v6 code];
    int v14 = _CDPLogSystem();
    int v15 = v14;
    if (v13 == -5307)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "User cancelled local device secret entry", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_196_cold_1();
    }

    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
    }
  }
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_197(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 8) setDidAttemptSecureBackupEnablement:1];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (BOOL)_isInSOSCircle
{
  BOOL result = 0;
  if ([(CDPContext *)self->_context keychainSyncSystem] == 1)
  {
    uint64_t v3 = (void *)MEMORY[0x263F343E8];
    uint64_t v4 = [(CDPContext *)self->_context altDSID];
    uint64_t v5 = [v3 syncingStatusForAltDSID:v4];

    if (v5)
    {
      if (v5 == 1
        || ([(CDPContext *)self->_context isSOSCompatibilityOptInNeeded] & 1) == 0)
      {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)_isEligibleForSOSJoin
{
  int v3 = [MEMORY[0x263F34400] deferSOSFromSignIn];
  BOOL v4 = +[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled];
  if (v3) {
    BOOL v5 = !v4;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5
      && ([(CDPContext *)self->_context sosCompatibilityType] & 1) != 0
      && [(CDPContext *)self->_context keychainSyncSystem] == 0;
}

- (void)_joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired
{
  if ([(CDPDStateMachine *)self _isEligibleForSOSJoin])
  {
    if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")))
    {
      int v3 = (void *)[(CDPContext *)self->_context copy];
      [v3 setKeychainSyncSystem:1];
      BOOL v4 = [[CDPDStateMachine alloc] initWithContext:v3 uiProvider:0];
      BOOL v5 = (void *)os_transaction_create();
      id v6 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke;
      block[3] = &unk_264330D90;
      uint64_t v10 = v4;
      uint64_t v11 = self;
      id v12 = v5;
      id v7 = v5;
      uint64_t v8 = v4;
      dispatch_async(v6, block);
    }
  }
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2;
  v6[3] = &unk_264330DB8;
  id v3 = v2;
  uint64_t v4 = a1[5];
  BOOL v5 = (void *)a1[6];
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v3 handleCloudDataProtectionStateWithCompletion:v6];
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v25 = a2;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Finished SOS join with: shouldCompleteSOSSignIn = %d, sosEnabled = %d, sosError = %@", buf, 0x18u);
  }

  id v9 = [MEMORY[0x263F34388] contextForSOSCompatibilityMode];
  uint64_t v10 = [*(id *)(a1 + 32) context];
  uint64_t v11 = [v10 altDSID];
  [v9 setAltDSID:v11];

  id v12 = objc_alloc_init(MEMORY[0x263F34390]);
  if (v7 || (a3 & 1) == 0)
  {
    int v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_3();
    }

    uint64_t v16 = [*(id *)(a1 + 32) context];
    id v17 = [v16 telemetryFlowID];
    [v9 setTelemetryFlowID:v17];

    id v18 = [*(id *)(a1 + 32) context];
    uint64_t v19 = [v18 telemetryDeviceSessionID];
    [v9 setTelemetryDeviceSessionID:v19];

    id v23 = 0;
    [v12 postFollowUpWithContext:v9 error:&v23];
    id v13 = v23;
    if (v13)
    {
      int v14 = _CDPLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_2();
      }
      goto LABEL_13;
    }
  }
  else
  {
    [*(id *)(a1 + 32) _enableSOSViews];
    id v22 = 0;
    [v12 clearFollowUpWithContext:v9 error:&v22];
    id v13 = v22;
    if (v13)
    {
      int v14 = _CDPLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_1();
      }
LABEL_13:
    }
  }
  id v20 = [*(id *)(a1 + 32) secureBackupController];
  id v21 = [v20 secureBackupProxy];
  [v21 uncacheAllSecrets];

  [*(id *)(*(void *)(a1 + 40) + 104) unlock];
}

- (void)_joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if ([(CDPDStateMachine *)self _isEligibleForSOSJoin])
  {
    [(CDPContext *)self->_context setKeychainSyncSystem:1];
    [(CDPDStateMachine *)self _initDependenciesWithContext:self->_context];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke;
    v7[3] = &unk_26432EDC0;
    void v7[4] = self;
    uint64_t v8 = v4;
    [(CDPDStateMachine *)self repairCloudDataProtectionStateWithCompletion:v7];
  }
  else
  {
    BOOL v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "repairCloudDataProtection: Not running SOS state machine", v6, 2u);
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

void __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v20 = a2;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "repairCloudDataProtection: Finished SOS repair with: didRepairSOS = %d, sosRepairError = %@", buf, 0x12u);
  }

  id v7 = [MEMORY[0x263F34388] contextForSOSCompatibilityMode];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) altDSID];
  [v7 setAltDSID:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F34390]);
  if (!v5 && (a2 & 1) != 0)
  {
    [*(id *)(a1 + 32) _enableSOSViews];
    id v17 = 0;
    [v9 clearFollowUpWithContext:v7 error:&v17];
    id v10 = v17;
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_1();
    }
    goto LABEL_13;
  }
  id v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke_cold_3();
  }

  id v13 = [*(id *)(*(void *)(a1 + 32) + 8) telemetryFlowID];
  [v7 setTelemetryFlowID:v13];

  int v14 = [*(id *)(*(void *)(a1 + 32) + 8) telemetryDeviceSessionID];
  [v7 setTelemetryDeviceSessionID:v14];

  id v18 = 0;
  [v9 postFollowUpWithContext:v7 error:&v18];
  id v10 = v18;
  if (v10)
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_2();
    }
LABEL_13:
  }
LABEL_14:
  int v15 = [*(id *)(*(void *)(a1 + 32) + 40) secureBackupProxy];
  [v15 uncacheAllSecrets];

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
}

- (void)_enableSOSViews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F16D30]);
  uint64_t v4 = [(CDPDStateMachine *)self context];
  id v5 = [v4 cliqueConfiguration];
  id v6 = (void *)[v3 initWithContextData:v5];

  id v22 = 0;
  LODWORD(v5) = [v6 fetchUserControllableViewsSyncingEnabled:&v22];
  id v7 = v22;
  if (v5)
  {
    uint64_t v8 = [(CDPDCircleControl *)self->_circleController circleProxy];
    id v21 = 0;
    int v9 = [v8 setUserControllableViewsSyncStatus:1 error:&v21];
    id v10 = v21;

    uint64_t v11 = _CDPLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        id v13 = "repairCloudDataProtection: Successfully enabled SOS views";
LABEL_15:
        id v18 = v11;
        uint32_t v19 = 2;
LABEL_19:
        _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, v13, buf, v19);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if (!v12) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    id v13 = "repairCloudDataProtection: Failed to enable SOS views: %@";
    goto LABEL_18;
  }
  id v10 = _CDPLogSystem();
  BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "repairCloudDataProtection: Octagon reports user controllable views are not enabled! disabling for SOS", buf, 2u);
    }

    int v15 = [(CDPDCircleControl *)self->_circleController circleProxy];
    id v20 = 0;
    int v16 = [v15 setUserControllableViewsSyncStatus:0 error:&v20];
    id v10 = v20;

    uint64_t v11 = _CDPLogSystem();
    BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        id v13 = "repairCloudDataProtection: Successfully disabled SOS views";
        goto LABEL_15;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (!v17) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    id v13 = "repairCloudDataProtection: Failed to disable SOS views: %@";
LABEL_18:
    id v18 = v11;
    uint32_t v19 = 12;
    goto LABEL_19;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "repairCloudDataProtection: Failed to fetch user controllable views from clique, error: %@", buf, 0xCu);
  }
LABEL_21:
}

- (void)_resetAccountCDPStateWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  if (([(CDPContext *)self->_context _forceReset] & 1) == 0
    && (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")) & 1) != 0
    || !self->_secureBackupDisableController)
  {
    if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")))
    {
      int v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[CDPDStateMachine _resetAccountCDPStateWithCompletion:]();
      }
    }
    goto LABEL_12;
  }
  id v5 = [MEMORY[0x263F291C0] currentDevice];
  int v6 = [v5 isVirtualMachine];

  id v7 = _CDPLogSystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CDPDStateMachine _resetAccountCDPStateWithCompletion:]();
    }

LABEL_12:
    if (v4)
    {
      id v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
      v4[2](v4, 0, v10);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Hold on to your hats. User has requested a CDP reset.", buf, 2u);
  }

  secureBackupDisableController = self->_secureBackupDisableController;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke;
  v12[3] = &unk_26432EDC0;
  void v12[4] = self;
  id v13 = v4;
  [(CDPDSecureBackupDisableCapable *)secureBackupDisableController deleteAllBackupRecordsWithCompletion:v12];

LABEL_17:
}

void __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke_cold_1();
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 32) resetCircleIncludingCloudKitData:1 cloudKitResetReasonDescription:@"CoreCDP-user-elected" withCompletion:*(void *)(a1 + 40)];
}

- (id)circlePeerIDForSecureBackupController:(id)a3
{
  return (id)[(CDPDCircleControl *)self->_circleController peerID];
}

- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 circleJoinResult];
  if (v5
    && (int v6 = (void *)v5,
        [v4 circleJoinResult],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 requiresInitialSync],
        v7,
        v6,
        !v8))
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Initial sync not required, skipping...", v12, 2u);
    }

    char v9 = 1;
  }
  else
  {
    char v9 = [(CDPDCircleControl *)self->_circleController synchronizeCircleViews];
  }

  return v9;
}

- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3
{
}

- (void)promptForLocalSecretWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDStateMachine promptForLocalSecretWithCompletion:]((uint64_t)self, v5);
  }

  [(CDPStateUIProviderInternal *)self->_uiProvider cdpContext:self->_context promptForLocalSecretWithCompletion:v4];
}

- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4
{
}

- (id)contextForController:(id)a3
{
  return self->_context;
}

- (id)secureChannelContextForController:(id)a3
{
  id v4 = a3;
  if (([(CDPContext *)self->_context isPiggybackingRecovery] & 1) != 0
    || [(CDPContext *)self->_context isTTSURecovery])
  {
    uint64_t v5 = [CDPDSecureChannelContext alloc];
    context = self->_context;
    id v7 = [v4 circleProxy];
    int v8 = [(CDPDSecureChannelContext *)v5 initWithContext:context circleProxy:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (CDPDEDPRecoveryController)edpController
{
  return self->_edpController;
}

- (void)setEdpController:(id)a3
{
}

- (CDPDSecureBackupControl)secureBackupController
{
  return self->_secureBackupController;
}

- (void)setSecureBackupController:(id)a3
{
}

- (CDPDSecureBackupEnableCapable)secureBackupEnableController
{
  return self->_secureBackupEnableController;
}

- (void)setSecureBackupEnableController:(id)a3
{
}

- (CDPDCircleControl)circleController
{
  return self->_circleController;
}

- (void)setCircleController:(id)a3
{
}

- (CDPDPCSController)pcsController
{
  return self->_pcsController;
}

- (void)setPcsController:(id)a3
{
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (BOOL)attemptedCDPEnable
{
  return self->_attemptedCDPEnable;
}

- (void)setAttemptedCDPEnable:(BOOL)a3
{
  self->_attemptedCDPEnable = a3;
}

- (CDPDLockAssertion)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setLockAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edpController, 0);
  objc_storeStrong((id *)&self->_lockAssertion, 0);
  objc_storeStrong((id *)&self->_cdpdStatemachineDefaultQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_inheritanceTrustController, 0);
  objc_storeStrong((id *)&self->_secureBackupDisableController, 0);
  objc_storeStrong((id *)&self->_secureBackupEnableController, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_pcsController, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:uiProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "**** DEBUG **** Fake nearly depleted records mode is ENABLED", v2, v3, v4, v5, v6);
}

- (void)initWithContext:uiProvider:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "UI Provider is %@", v2, v3, v4, v5, v6);
}

- (void)_isEligibleForRecoveryTokenWithContext:cdpStateMachineError:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Beneficiary flows are not eligible for EDP recovery token", v2, v3, v4, v5, v6);
}

- (void)_performEDPRepairWithResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Beneficiary flows are not eligible for EDP repair", v2, v3, v4, v5, v6);
}

- (void)_continuePerformEDPRepairWithResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Forcing token entry", v2, v3, v4, v5, v6);
}

void __67__CDPDStateMachine__continuePerformEDPRepairWithResult_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Could not determine iCDP status, failing EDP repair with error: %@", v2, v3, v4, v5, v6);
}

- (void)_promptForEDPRecoveryTokenWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "UI Provider missing for token prompt entry", v2, v3, v4, v5, v6);
}

void __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User canceled token entry", v2, v3, v4, v5, v6);
}

void __61__CDPDStateMachine__promptForEDPRecoveryTokenWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User requested reset from token entry screen", v2, v3, v4, v5, v6);
}

- (void)handleCloudDataProtectionStateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Make sure device is unlocked before calling handleCloudDataProtectionStateWithCompletion:", v2, v3, v4, v5, v6);
}

- (void)handleCloudDataProtectionStateWithCompletion:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_0(&dword_218640000, v0, v1, "CDP State Machine failed without error... investigate lack of error", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_218640000, log, OS_LOG_TYPE_FAULT, "HomePod failed CDP join with AuthKit error: %@", buf, 0xCu);
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_2_90_cold_1()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_1_4(&dword_218640000, v0, v1, "CDPDStateMachine: EDP did %@ set up with error=%@. Then continueHandleCloudDataProtectionState... ");
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_97_cold_1()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_1_4(&dword_218640000, v0, v1, "CDPDStateMachine: Regualr sign-in flow: EDP did %@ set up with error=%@");
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "iCSC creation is not needed if this is a beneficiary", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "iCSC creation will not be attempted if viable escrow record already exists", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "In sync mode & we did attempt secure backup enablement.", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "In sync mode, we should have attempted secure backup enablement but we did not.", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "In async mode & we did schedule iCSC creation on an async queue.", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Async mode, but no peersWithCDPBackupRecords so we attempted sync secure backup enablement.", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "In async mode, we should have scheduled iCSC creation on the async queue but we did not.", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "iCSC creation will not be attempted if the user does not have a local secret", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Must be in Octagon Clique to create an iCSC", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "iCSC creation will not be attempted if the keychain sync system is anything other than Octagon", v2, v3, v4, v5, v6);
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Detected a pref to behave as if iCSC creation was not attempted when expected.", v2, v3, v4, v5, v6);
}

- (void)_handleCloudDataProtectionStateWithCompletion:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 context];
  uint8_t v6 = [v5 altDSID];
  v7[0] = 67109890;
  v7[1] = a2;
  __int16 v8 = 1024;
  int v9 = 0;
  __int16 v10 = 2160;
  uint64_t v11 = 1752392040;
  __int16 v12 = 2112;
  id v13 = v6;
  _os_log_error_impl(&dword_218640000, a3, OS_LOG_TYPE_ERROR, "Account not allowed in CDP due to being federated (%{BOOL}d) and MAIDinCDP is (%{BOOL}d): %{mask.hash}@", (uint8_t *)v7, 0x22u);
}

void __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Failed to register credentials with Security, lets try again...", v2, v3, v4, v5, v6);
}

void __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to get the beneficiary access key. %@", v2, v3, v4, v5, v6);
}

- (void)_attemptBeneficiaryTrustWithInheritanceKey:(uint64_t)a1 retryCount:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_218640000, a2, OS_LOG_TYPE_FAULT, "Scheduling to join beneficiary trust after %@ seconds as security says there isn't a CK account yet.", v4, 0xCu);
}

- (void)_attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Circle status is unexpected for beneficiary trust. Failing…", v2, v3, v4, v5, v6);
}

void __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to recover octagon with beneficiary access key. %@", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to join circle and recovery is not needed, aborting (error as %@)", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "We are in SOS only mode, calling callback with success", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_12(&dword_218640000, v0, v1, "CDPContext forceInteractiveCDPEDPRepair=%{BOOL}d", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_117_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_0(&dword_218640000, v0, v1, "Resetting during sign in flow is illegal, operation will not be performed.", v2, v3, v4, v5, v6);
}

void __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to disable recovery key with error: %@", v2, v3, v4, v5, v6);
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "CDP reset failed, can not proceed: %@", v2, v3, v4, v5, v6);
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_126_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_4(&dword_218640000, a2, a3, "Type of RPD performed: %ld. Error = %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_shouldRejoinCircleAfterPerformingRPDType:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_12(&dword_218640000, v0, v1, "_shouldRejoinCircle = %{BOOL}d", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to check for existing records before enabling secure backup with error: %@", v2, v3, v4, v5, v6);
}

- (void)_handlePreflightError:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Account preflight failed with error, aborting CDP state machine - %@", v2, v3, v4, v5, v6);
}

- (void)_attemptCDPEnable:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Enabling iCDP has already been attempted, but checking the status reports iCDP is still not enabled. Aborting.", v2, v3, v4, v5, v6);
}

- (void)_attemptCDPEnable:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "iCDP is not enabled, and the account is not HSA2 enabled or an allowed MAID account", v2, v3, v4, v5, v6);
}

void __38__CDPDStateMachine__attemptCDPEnable___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Not eligible for iCDP - %@", v2, v3, v4, v5, v6);
}

- (void)_initDependenciesWithContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Attempting to enable CDP for sync system %@", v2, v3, v4, v5, v6);
}

- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "**** DEBUG **** Fake that we must repair", v2, v3, v4, v5, v6);
}

void __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to refresh context: %@", v2, v3, v4, v5, v6);
}

- (void)shouldPerformRepairWithOptionForceFetch:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_continueShouldPerformRepairWithOptionForceFetch:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Will not be able to fetch escrow record status report because escrow record is nil. Aborting.", v2, v3, v4, v5, v6);
}

void __34__CDPDStateMachine__fetchUserInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_218640000, v0, v1, "Fetched user info %@ from server with error = %@");
}

- (void)repairCloudDataProtectionStateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 context];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "State machine repairing EDP interactively with context: %@", v4, v5, v6, v7, v8);
}

- (void)repairCloudDataProtectionStateWithCompletion:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 context];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "State machine repairing EDP silently with context: %@", v4, v5, v6, v7, v8);
}

- (void)repairCloudDataProtectionStateWithCompletion:(void *)a1 .cold.3(void *a1)
{
  os_log_t v1 = [a1 context];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "State machine repairing CDP with context: %@", v4, v5, v6, v7, v8);
}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "EDP recovery successful", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "EDP repair failed, continue with CDP state machine repair", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_165_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "EDP is good now, but CDP is broken and needs repair", v2, v3, v4, v5, v6);
}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_165_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "CDP repair isn't needed", v2, v3, v4, v5, v6);
}

- (void)_eligibleForSilentAuthenticatedRepair
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "SOS feature is disabled on this device, eligible for silent authenticated repair", v2, v3, v4, v5, v6);
}

void __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to perform silent authentication for repair with error %@", v2, v3, v4, v5, v6);
}

void __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "UI provider failed to perform interactive authentication for repair with error %@", v2, v3, v4, v5, v6);
}

- (void)_preflightAccountStateWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Account preflight failed - No primary account is present", v2, v3, v4, v5, v6);
}

- (void)_preflightAccountStateWithContext:(NSObject *)a3 completion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 dsid];
  int v6 = 141558786;
  uint64_t v7 = 1752392040;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2160;
  uint64_t v11 = 1752392040;
  __int16 v12 = 2112;
  id v13 = v5;
  _os_log_error_impl(&dword_218640000, a3, OS_LOG_TYPE_ERROR, "Account preflight failed - Primary account DSID (%{mask.hash}@) does not match the DSID specified in the context (%{mask.hash}@)", (uint8_t *)&v6, 0x2Au);
}

void __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to enable KVS with error %@", v2, v3, v4, v5, v6);
}

- (void)_enableKVSForAccount:store:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Found primary account", v2, v3, v4, v5, v6);
}

- (void)_recoverSecureBackupWithCircleJoinResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Failed to recover SecureBackup because no UI provider is present to request the local and/or remote device secrets", v2, v3, v4, v5, v6);
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to get a local device secret from the UI provider with error %@", v2, v3, v4, v5, v6);
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_174_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_11_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_218640000, v1, OS_LOG_TYPE_DEBUG, "Finished backup recovery attempt with the user-provided local secret with didRecover=%i error=%@", v2, 0x12u);
}

- (void)_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "_attemptBackupRecoveryWithLocalSecret: Encountered error while checking RK support: %@", v2, v3, v4, v5, v6);
}

- (void)_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_attemptBackupRecoveryWithLocalSecret: fetching RK from the keychain", v2, v3, v4, v5, v6);
}

- (void)_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_13(&dword_218640000, v0, v1, "%s: useSecureBackupCachedSecret=%{BOOL}d, circleJoinResult=%@", v2);
}

- (void)_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_13(&dword_218640000, v0, v1, "%s: useSecureBackupCachedSecret=%{BOOL}d, circleJoinResult=%@", v2);
}

void __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Error prompting user for remote device secret - %@", v2, v3, v4, v5, v6);
}

- (void)_enableCustodianRecoveryIfAvailableForContext:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_12(&dword_218640000, v0, v1, "_enableCustodianRecoveryIfAvailableForContext: returning %i", v2, v3, v4, v5, v6);
}

- (void)_postRecoveryEnableSecureBackupWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Calling upgradeICSCRecordsThenEnableSecureBackupWithContext", v2, v3, v4, v5, v6);
}

- (void)_postRecoveryEnableSecureBackupWithContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Context hasPeersWithCDPBackupRecords and async mode is enabled.", v2, v3, v4, v5, v6);
}

- (void)_postRecoveryEnableSecureBackupWithContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_postRecoveryEnableSecureBackupWithContext called.", v2, v3, v4, v5, v6);
}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_192_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Experienced error while enabling secure backup: %@", v2, v3, v4, v5, v6);
}

- (void)_enableSecureBackupWithCircleJoinResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Failed to enable SecureBackup because no UI provider is present to request the local device secret", v2, v3, v4, v5, v6);
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_196_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Error prompting user for local device secret - %@", v2, v3, v4, v5, v6);
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "repairCloudDataProtection: failed to clear sosCompatibilityCFU with error: %@", v2, v3, v4, v5, v6);
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "repairCloudDataProtection: failed to post sosCompatibilityCFU with error: %@", v2, v3, v4, v5, v6);
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SOS only state machine run failed: %@. Posting follow up...", v2, v3, v4, v5, v6);
}

void __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "repairCloudDataProtection: SOS only state repair failed: %@. Posting follow up...", v2, v3, v4, v5, v6);
}

- (void)_resetAccountCDPStateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_0(&dword_218640000, v0, v1, "We dont support RPD during signin flow", v2, v3, v4, v5, v6);
}

- (void)_resetAccountCDPStateWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_0(&dword_218640000, v0, v1, "Reset data is not supported on virtual machines.", v2, v3, v4, v5, v6);
}

void __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to delete all backup records with error: %@", v2, v3, v4, v5, v6);
}

- (void)promptForLocalSecretWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Prompting for local secret using uiProvider=(%@) and context=(%@)", (uint8_t *)&v4, 0x16u);
}

@end
@interface CDPDSOSRecoveryValidatedJoinFlowController
- (BOOL)secretValidator:(id)a3 shouldAcceptRecoveryError:(id *)a4;
- (id)_cancelRecoveryOptionWithCompletion:(id)a3;
- (id)_entryLimitNoResetForRepairForDevice:(id)a3;
- (id)_entryLimitRemoteApprovalAvailableBodyForDevice:(id)a3;
- (id)_entryLimitTitleForDevice:(id)a3 forLimitType:(unint64_t)a4;
- (id)_infoDictionaryWithTitle:(id)a3 andBody:(id)a4;
- (id)_makeRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5;
- (id)_makeRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3;
- (id)_okRecoveryOptionWithCompletion:(id)a3;
- (id)_remoteApprovalRecoveryOptionWithCompletion:(id)a3;
- (id)_userInfoForLimit:(unint64_t)a3 withDevice:(id)a4;
- (unint64_t)_escapeOfferForDevices:(id)a3 remoteApproval:(BOOL)a4 forMultipleICSC:(BOOL)a5;
- (void)_handleHardLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4;
- (void)_handleLimit:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5;
- (void)_handleSoftLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4;
- (void)_populateUserInfo:(id)a3 recoveryIndexHandlers:(id)a4 withRecoveryOption:(id)a5;
- (void)_showEntryLimitError:(id)a3 withRecoveryOptionHandlers:(id)a4 defaultIndex:(int64_t)a5 completion:(id)a6;
- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5;
- (void)beginRemoteApprovalWithValidator:(id)a3;
- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:(id)a3;
- (void)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 validationHandler:(id)a5 completion:(id)a6;
- (void)remoteSecretValidator:(id)a3 applyToJoinCircleWithJoinHandler:(id)a4;
- (void)secretValidator:(id)a3 didFailRecovery:(id)a4 withError:(id)a5 completion:(id)a6;
- (void)secretValidatorWillAttemptRecovery;
- (void)sendRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5;
- (void)sendRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3;
@end

@implementation CDPDSOSRecoveryValidatedJoinFlowController

- (void)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 validationHandler:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, id))a6;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__9;
  v27[4] = __Block_byref_object_dispose__9;
  v13 = self;
  v28 = v13;
  v14 = [CDPDRemoteDeviceSecretValidator alloc];
  v15 = [(CDPDRecoveryFlowController *)v13 recoveryContext];
  v16 = [v15 context];
  v17 = [(CDPDDeviceSecretValidator *)v14 initWithContext:v16 delegate:v13];

  [(CDPDDeviceSecretValidator *)v17 setIsUsingMultipleICSC:v8];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __120__CDPDSOSRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_validationHandler_completion___block_invoke;
  v24 = &unk_26432F278;
  id v18 = v11;
  id v25 = v18;
  v26 = v27;
  [(CDPDRemoteDeviceSecretValidator *)v17 setValidSecretHandler:&v21];
  v19 = [(CDPDRecoveryFlowController *)v13 recoveryContext];
  -[CDPDDeviceSecretValidator setSupportedEscapeOfferMask:](v17, "setSupportedEscapeOfferMask:", -[CDPDSOSRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:](v13, "_escapeOfferForDevices:remoteApproval:forMultipleICSC:", v10, [v19 hasPeersForRemoteApproval] | !v8, v8));

  v20 = v17;
  if (v12) {
    v12[2](v12, v20);
  }

  _Block_object_dispose(v27, 8);
}

void __120__CDPDSOSRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_validationHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (unint64_t)_escapeOfferForDevices:(id)a3 remoteApproval:(BOOL)a4 forMultipleICSC:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  BOOL v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSOSRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:](self, v8);
  }

  unint64_t v9 = [v7 count];
  if (v9 < 2)
  {
    unint64_t v11 = 1;
    if (!v5) {
      return v11;
    }
    goto LABEL_9;
  }
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Escape available: other devices", buf, 2u);
  }

  unint64_t v11 = 3;
  if (v5)
  {
LABEL_9:
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Escape available: remote approval", v14, 2u);
    }

    v11 |= 4uLL;
  }
  return v11;
}

- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (![v8 count])
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "User attempted to get into SOS after burning out all recovery options, present remote approval option", buf, 2u);
    }

    unint64_t v11 = [(CDPDRecoveryFlowController *)self uiProvider];

    if (v11)
    {
      v12 = [(CDPDRecoveryFlowController *)self recoveryContext];
      int v13 = [v12 hasPeersForRemoteApproval];

      if (v13)
      {
        v14 = [(CDPDRecoveryFlowController *)self recoveryContext];
        v15 = [v14 context];
        [(CDPDSOSRecoveryValidatedJoinFlowController *)self sendRemoteApprovalStartedBreadCrumbEventWithContext:v15];

        v16 = [(CDPDRecoveryFlowController *)self uiProvider];
        v17 = [(CDPDRecoveryFlowController *)self recoveryContext];
        id v18 = [v17 context];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __116__CDPDSOSRecoveryValidatedJoinFlowController_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator___block_invoke;
        v22[3] = &unk_26432ECF8;
        id v19 = v9;
        id v23 = v19;
        [v16 cdpContext:v18 presentRemoteApprovalWithCompletion:v22];

        [(CDPDSOSRecoveryValidatedJoinFlowController *)self beginRemoteApprovalWithValidator:v19];
        goto LABEL_13;
      }
      v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSOSRecoveryValidatedJoinFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:]();
      }
    }
    else
    {
      v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSOSRecoveryValidatedJoinFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:]();
      }
    }

    goto LABEL_13;
  }
  v21.receiver = self;
  v21.super_class = (Class)CDPDSOSRecoveryValidatedJoinFlowController;
  [(CDPDRecoveryFlowController *)&v21 beginInteractiveRecoveryForDevices:v8 isUsingMultipleICSC:v6 usingValidator:v9];
LABEL_13:
}

void __116__CDPDSOSRecoveryValidatedJoinFlowController_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "presentRemoteApprovalWithCompletion completed with error: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([v4 code] == -5307)
  {
    [*(id *)(a1 + 32) cancelApproveFromAnotherDevice];
    BOOL v6 = *(void **)(a1 + 32);
    id v7 = _CDPStateError();
    [v6 cancelValidationWithError:v7];
  }
}

- (void)sendRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  id v4 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _makeRemoteApprovalStartedBreadCrumbEventWithContext:a3];
  uint64_t v3 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v3 sendEvent:v4];
}

- (id)_makeRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  return (id)[MEMORY[0x263F202A8] analyticsEventWithContext:a3 eventName:*MEMORY[0x263F34718] category:*MEMORY[0x263F34830]];
}

- (void)sendRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  id v6 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _makeRemoteApprovalCompletedEventWithContext:a3 didApprove:a4 error:a5];
  BOOL v5 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v5 sendEvent:v6];
}

- (id)_makeRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void *)MEMORY[0x263F202A8];
  uint64_t v8 = *MEMORY[0x263F34710];
  uint64_t v9 = *MEMORY[0x263F34830];
  id v10 = a5;
  unint64_t v11 = [v7 analyticsEventWithContext:a3 eventName:v8 category:v9];
  v12 = v11;
  if (v5) {
    uint64_t v13 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v13 = MEMORY[0x263EFFA80];
  }
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F34558]];
  [v12 populateUnderlyingErrorsStartingWithRootError:v10];

  return v12;
}

- (void)remoteSecretValidator:(id)a3 applyToJoinCircleWithJoinHandler:(id)a4
{
  id v5 = a4;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSOSRecoveryValidatedJoinFlowController remoteSecretValidator:applyToJoinCircleWithJoinHandler:]();
  }

  id v7 = [(CDPDRecoveryFlowController *)self circleController];
  [v7 applyToJoinCircleWithJoinHandler:v5];
}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:(id)a3
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSOSRecoveryValidatedJoinFlowController cancelRemoteSecretValidatorApplicationToJoinCircle:]();
  }

  id v5 = [(CDPDRecoveryFlowController *)self circleController];
  [v5 cancelApplicationToJoinCircle];
}

- (void)secretValidatorWillAttemptRecovery
{
  id v2 = [(CDPDRecoveryFlowController *)self circleController];
  [v2 prepareCircleStateForRecovery];
}

- (BOOL)secretValidator:(id)a3 shouldAcceptRecoveryError:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_218640000, "cdp: Post Recovery Circle Join", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  objc_super v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [(CDPDRecoveryFlowController *)self circleController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_shouldAcceptRecoveryError___block_invoke;
  v13[3] = &unk_264330E40;
  v15 = &v23;
  v16 = &v17;
  id v10 = v8;
  v14 = v10;
  [v9 joinCircleAfterRecoveryWithCompletion:v13];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v18[5];
  }
  char v11 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __88__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_shouldAcceptRecoveryError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)secretValidator:(id)a3 didFailRecovery:(id)a4 withError:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13) {
    -[CDPDSOSRecoveryValidatedJoinFlowController secretValidator:didFailRecovery:withError:completion:]();
  }
  v14 = (void (**)(void, void, void))v13;
  if ([v12 isLoginHardLimit])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke;
    v18[3] = &unk_264330938;
    v18[4] = self;
    id v19 = v12;
    id v20 = v10;
    objc_super v21 = v14;
    [(CDPDSOSRecoveryValidatedJoinFlowController *)self _handleHardLimitErrorForCurrentContextWithDevice:v11 completion:v18];
  }
  else if ([v12 isLoginSoftLimit])
  {
    [(CDPDSOSRecoveryValidatedJoinFlowController *)self _handleSoftLimitErrorForCurrentContextWithDevice:v11 completion:v14];
  }
  else
  {
    v15 = [v12 domain];
    if ([v15 isEqualToString:*MEMORY[0x263F342B0]]) {
      BOOL v16 = [v12 code] != -5206;
    }
    else {
      BOOL v16 = 1;
    }

    uint64_t v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v23 = v16;
      _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Non-terminating error detected, with retry option: %{BOOL}d", buf, 8u);
    }

    ((void (**)(void, BOOL, id))v14)[2](v14, v16, v12);
  }
}

void __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 domain];
  if (![v6 isEqualToString:*MEMORY[0x263F342B0]])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v5 code];

  if (v7 != -5209)
  {
LABEL_5:
    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_6;
  }
  id v8 = a1[4];
  uint64_t v9 = [v8 recoveryContext];
  id v10 = [v9 context];
  [v8 sendRemoteApprovalStartedBreadCrumbEventWithContext:v10];

  id v11 = [a1[4] uiProvider];
  id v12 = [a1[4] recoveryContext];
  id v13 = [v12 context];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  BOOL v16 = __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2;
  uint64_t v17 = &unk_2643309D8;
  id v18 = a1[5];
  id v19 = a1[6];
  id v20 = a1[7];
  char v21 = a2;
  [v11 cdpContext:v13 presentRemoteApprovalWithCompletion:&v14];

  objc_msgSend(a1[4], "beginRemoteApprovalWithValidator:", a1[6], v14, v15, v16, v17);
LABEL_6:
}

void __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2_cold_1(a1, v2);
  }

  if ([*(id *)(a1 + 32) code] == -5307)
  {
    [*(id *)(a1 + 40) cancelApproveFromAnotherDevice];
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = _CDPStateError();
    [v3 cancelValidationWithError:v4];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v7 = _CDPStateError();
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
}

- (void)beginRemoteApprovalWithValidator:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__CDPDSOSRecoveryValidatedJoinFlowController_beginRemoteApprovalWithValidator___block_invoke;
  v3[3] = &unk_26432ECF8;
  v3[4] = self;
  [a3 approveFromAnotherDeviceWithCompletion:v3];
}

void __79__CDPDSOSRecoveryValidatedJoinFlowController_beginRemoteApprovalWithValidator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 recoveryContext];
  id v8 = [v7 context];
  [v5 sendRemoteApprovalCompletedEventWithContext:v8 didApprove:a2 error:v6];

  uint64_t v9 = [*(id *)(a1 + 32) uiProvider];
  id v11 = v9;
  if (a2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  [v9 dismissRemoteApprovalWaitingScreenWithAction:v10];
}

- (void)_handleHardLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Starting handling hard limit error...", v9, 2u);
  }

  [(CDPDSOSRecoveryValidatedJoinFlowController *)self _handleLimit:2 forDevice:v7 completion:v6];
}

- (void)_handleSoftLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Starting handling soft limit error...", v9, 2u);
  }

  [(CDPDSOSRecoveryValidatedJoinFlowController *)self _handleLimit:1 forDevice:v7 completion:v6];
}

- (void)_handleLimit:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5
{
  id v13 = a5;
  id v8 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _userInfoForLimit:a3 withDevice:a4];
  uint64_t v9 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  uint64_t v10 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _remoteApprovalRecoveryOptionWithCompletion:v13];
  if (v10)
  {
    id v11 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _cancelRecoveryOptionWithCompletion:v13];
    [(CDPDSOSRecoveryValidatedJoinFlowController *)self _populateUserInfo:v8 recoveryIndexHandlers:v9 withRecoveryOption:v10];
  }
  else
  {
    id v11 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _okRecoveryOptionWithCompletion:v13];
  }
  [(CDPDSOSRecoveryValidatedJoinFlowController *)self _populateUserInfo:v8 recoveryIndexHandlers:v9 withRecoveryOption:v11];

  id v12 = _CDPStateError();
  [(CDPDSOSRecoveryValidatedJoinFlowController *)self _showEntryLimitError:v12 withRecoveryOptionHandlers:v9 defaultIndex:0 completion:v13];
}

- (void)_populateUserInfo:(id)a3 recoveryIndexHandlers:(id)a4 withRecoveryOption:(id)a5
{
  id v7 = a3;
  if (a5)
  {
    uint64_t v8 = *MEMORY[0x263F08340];
    id v18 = v7;
    id v9 = a5;
    id v10 = a4;
    id v11 = [v18 objectForKeyedSubscript:v8];
    if (v11)
    {
      id v12 = [v18 objectForKeyedSubscript:v8];
      id v13 = (void *)[v12 mutableCopy];
    }
    else
    {
      id v13 = [MEMORY[0x263EFF980] array];
    }

    uint64_t v14 = [v9 localizedRecoveryOption];
    [v13 addObject:v14];

    uint64_t v15 = [v9 recoveryHandler];

    BOOL v16 = _Block_copy(v15);
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    [v10 setObject:v16 forKeyedSubscript:v17];

    [v18 setObject:v13 forKeyedSubscript:v8];
    id v7 = v18;
  }
}

- (id)_userInfoForLimit:(unint64_t)a3 withDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    uint64_t v7 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _hardLimitErrorBodyWithDevice:v6];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v7 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _softLimitErrorBodyForDevice:v6];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:
  id v9 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _entryLimitTitleForDevice:v6 forLimitType:a3];
  id v10 = [(CDPDSOSRecoveryValidatedJoinFlowController *)self _infoDictionaryWithTitle:v9 andBody:v8];

  return v10;
}

- (id)_remoteApprovalRecoveryOptionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDPDRecoveryFlowController *)self validator];
  if (([v5 supportedEscapeOfferMask] & 4) == 0)
  {

LABEL_7:
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "No fallback available", buf, 2u);
    }
    id v9 = 0;
    goto LABEL_10;
  }
  id v6 = [(CDPDRecoveryFlowController *)self recoveryContext];
  int v7 = [v6 hasPeersForRemoteApproval];

  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Creating recovery option: Remote Approval", buf, 2u);
  }

  id v9 = objc_opt_new();
  id v10 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_APPROVE"];
  id v11 = [v10 localizedString];
  [v9 setLocalizedRecoveryOption:v11];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__CDPDSOSRecoveryValidatedJoinFlowController__remoteApprovalRecoveryOptionWithCompletion___block_invoke;
  v14[3] = &unk_26432F3B8;
  uint64_t v15 = v4;
  [v9 setRecoveryHandler:v14];
  id v12 = v15;
LABEL_10:

  return v9;
}

void __90__CDPDSOSRecoveryValidatedJoinFlowController__remoteApprovalRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
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

  uint64_t v5 = objc_opt_new();
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  int v7 = [v6 localizedString];
  [v5 setLocalizedRecoveryOption:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__CDPDSOSRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [v5 setRecoveryHandler:v10];

  return v5;
}

void __82__CDPDSOSRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_okRecoveryOptionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Creating recovery option: OK", buf, 2u);
  }

  uint64_t v5 = objc_opt_new();
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  int v7 = [v6 localizedString];
  [v5 setLocalizedRecoveryOption:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__CDPDSOSRecoveryValidatedJoinFlowController__okRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_26432F3B8;
  id v11 = v3;
  id v8 = v3;
  [v5 setRecoveryHandler:v10];

  return v5;
}

void __78__CDPDSOSRecoveryValidatedJoinFlowController__okRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_showEntryLimitError:(id)a3 withRecoveryOptionHandlers:(id)a4 defaultIndex:(int64_t)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(CDPDRecoveryFlowController *)self uiProvider];
    *(_DWORD *)buf = 138412546;
    BOOL v23 = v14;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to preset alert (using: %@) for error: %@", buf, 0x16u);
  }
  uint64_t v15 = [(CDPDRecoveryFlowController *)self uiProvider];

  if (v15)
  {
    BOOL v16 = [(CDPDRecoveryFlowController *)self uiProvider];
    uint64_t v17 = [(CDPDRecoveryFlowController *)self recoveryContext];
    id v18 = [v17 context];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __118__CDPDSOSRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke;
    v19[3] = &unk_26432F4A8;
    id v20 = v11;
    id v21 = v12;
    [v16 cdpContext:v18 showError:v10 withDefaultIndex:a5 withCompletion:v19];
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v10);
  }
}

void __118__CDPDSOSRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSNumber numberWithInteger:a2];
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "User responded to presented alert with option: %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  int v7 = [NSNumber numberWithInteger:a2];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v8[2](v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = _CDPStateError();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

- (id)_entryLimitTitleForDevice:(id)a3 forLimitType:(unint64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F343B8];
  id v6 = a3;
  int v7 = [v5 builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_TITLE"];
  uint64_t v8 = [v6 localSecretType];

  uint64_t v9 = [v7 addSecretType:v8];
  id v10 = [v9 localizedString];

  if (a4 == 2)
  {
    uint64_t v11 = CDPLocalizedString();

    id v10 = (void *)v11;
  }
  return v10;
}

- (id)_entryLimitNoResetForRepairForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  int v6 = [v5 hasPeersForRemoteApproval];

  int v7 = NSString;
  if (v6) {
    uint64_t v8 = @"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_REMOTE_APPROVAL_NO_RESET";
  }
  else {
    uint64_t v8 = @"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_NO_RESET";
  }
  uint64_t v9 = [MEMORY[0x263F343B8] builderForKey:v8];
  id v10 = objc_msgSend(v9, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  uint64_t v11 = [v10 localizedString];
  id v12 = [v4 localizedName];

  uint64_t v13 = [v7 stringWithValidatedFormat:v11, @"%@", 0, v12 validFormatSpecifiers error];

  return v13;
}

- (id)_entryLimitRemoteApprovalAvailableBodyForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDPDRecoveryFlowController *)self recoveryContext];
  int v6 = [v5 hasPeersForRemoteApproval];

  if (v6)
  {
    int v7 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_SOS_ENTRY_MULTIPLE_INCORRECT_MESSAGE_REMOTE_APPROVAL"];
    uint64_t v8 = [v4 localSecretType];

    uint64_t v9 = [v7 addSecretType:v8];
    id v10 = [v9 localizedString];
  }
  else
  {
    uint64_t v11 = NSString;
    int v7 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_SOS_ENTRY_MULTIPLE_INCORRECT_MESSAGE_NO_REMOTE_APPROVAL"];
    uint64_t v9 = objc_msgSend(v7, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    id v12 = [v9 localizedString];
    uint64_t v13 = [v4 localizedName];

    id v10 = [v11 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];
  }
  return v10;
}

- (id)_infoDictionaryWithTitle:(id)a3 andBody:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  uint64_t v8 = v7;
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08338]];
  }

  return v8;
}

- (void)_escapeOfferForDevices:(void *)a1 remoteApproval:(NSObject *)a2 forMultipleICSC:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  id v4 = [a1 recoveryContext];
  id v5 = [v4 context];
  id v6 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "type"));
  int v7 = 138412290;
  uint64_t v8 = v6;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Context Type: %@", (uint8_t *)&v7, 0xCu);
}

- (void)beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "uiProvider is nil while trying to present remote approval", v2, v3, v4, v5, v6);
}

- (void)beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "No peers found for remote approval", v2, v3, v4, v5, v6);
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

- (void)secretValidator:didFailRecovery:withError:completion:.cold.1()
{
}

void __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "presentRemoteApprovalWithCompletion completed with error: %@", (uint8_t *)&v3, 0xCu);
}

@end
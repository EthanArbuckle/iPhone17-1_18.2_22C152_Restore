@interface CDPDRecoveryFlowController
- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4;
- (CDPDCircleControl)circleController;
- (CDPDEDPRecoveryController)edpController;
- (CDPDRecoveryFlowController)initWithContext:(id)a3 uiProvider:(id)a4 secureBackupController:(id)a5 circleController:(id)a6;
- (CDPDRecoveryFlowController)initWithContext:(id)a3 uiProvider:(id)a4 secureBackupController:(id)a5 circleProxy:(id)a6 octagonProxy:(id)a7;
- (CDPDSecureBackupController)secureBackupController;
- (CDPRecoveryFlowContext)recoveryContext;
- (CDPRemoteDeviceSecretValidatorProtocol)validator;
- (CDPStateUIProviderInternal)uiProvider;
- (unint64_t)_escapeOfferForDevices:(id)a3;
- (void)_updateEventWithDevices:(id)a3 withDevices:(id)a4;
- (void)_updateInteractiveRecoverStartEvent:(id)a3 withDevices:(id)a4;
- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5;
- (void)beginRecovery:(id)a3;
- (void)dealloc;
- (void)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 validationHandler:(id)a5 completion:(id)a6;
- (void)retrieveInflatedDevices:(id)a3;
- (void)secretValidator:(id)a3 didRequestEDPRecoveryTokenRepairWithContext:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5;
- (void)secretValidator:(id)a3 didRequestRepairEDPStateWithContext:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 didRequestValidateEDPIdentitiesWithContext:(id)a4 completion:(id)a5;
- (void)secretValidator:(id)a3 didRequestValidateEDPRecoveryToken:(id)a4 withContext:(id)a5 completion:(id)a6;
- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5;
- (void)setCircleController:(id)a3;
- (void)setEdpController:(id)a3;
- (void)setRecoveryContext:(id)a3;
- (void)setSecureBackupController:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)setValidator:(id)a3;
@end

@implementation CDPDRecoveryFlowController

- (CDPDRecoveryFlowController)initWithContext:(id)a3 uiProvider:(id)a4 secureBackupController:(id)a5 circleProxy:(id)a6 octagonProxy:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CDPDRecoveryFlowController;
  v18 = [(CDPDRecoveryFlowController *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_recoveryContext, a3);
    objc_storeStrong((id *)&v19->_uiProvider, a4);
    objc_storeStrong((id *)&v19->_secureBackupController, a5);
    v20 = [[CDPDCircleController alloc] initWithUiProvider:v14 delegate:0 circleProxy:v16 octagonTrustProxy:v17];
    circleController = v19->_circleController;
    v19->_circleController = (CDPDCircleControl *)v20;
  }
  return v19;
}

- (CDPDRecoveryFlowController)initWithContext:(id)a3 uiProvider:(id)a4 secureBackupController:(id)a5 circleController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CDPDRecoveryFlowController;
  id v15 = [(CDPDRecoveryFlowController *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_recoveryContext, a3);
    objc_storeStrong((id *)&v16->_uiProvider, a4);
    objc_storeStrong((id *)&v16->_secureBackupController, a5);
    objc_storeStrong((id *)&v16->_circleController, a6);
  }

  return v16;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "CDPDRecoveryFlowController deallocated", v1, 2u);
}

- (void)_updateEventWithDevices:(id)a3 withDevices:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 += [*(id *)(*((void *)&v19 + 1) + 8 * i) remainingAttempts];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F347B0]];

  id v14 = NSNumber;
  id v15 = [(CDPDRecoveryFlowController *)self recoveryContext];
  id v16 = [v15 context];
  id v17 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v16, "totalEscrowDeviceCount"));
  [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F347A8]];

  objc_super v18 = [NSNumber numberWithInteger:v10];
  [v6 setObject:v18 forKeyedSubscript:*MEMORY[0x263F34680]];
}

- (void)_updateInteractiveRecoverStartEvent:(id)a3 withDevices:(id)a4
{
  id v6 = a3;
  [(CDPDRecoveryFlowController *)self _updateEventWithDevices:v6 withDevices:a4];
  id v7 = [(CDPDRecoveryFlowController *)self secureBackupController];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CDPDRecoveryFlowController *)self secureBackupController];
    id v28 = 0;
    uint64_t v10 = [v9 supportsRecoveryKeyWithError:&v28];
    id v11 = v28;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = 0;
  }
  id v12 = [NSNumber numberWithBool:v10];
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F346F8]];

  id v13 = NSNumber;
  id v14 = [MEMORY[0x263F343A8] sharedInstance];
  id v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "supportsSecureBackupRecovery"));
  [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F347A0]];

  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[CDPDCircleControl cliqueStatus](self->_circleController, "cliqueStatus"));
  [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x263F34538]];

  id v17 = objc_msgSend(NSNumber, "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F34528]];

  objc_super v18 = objc_alloc_init(CDPDAccount);
  long long v19 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
  long long v20 = [v19 dsid];
  long long v21 = [v20 stringValue];
  uint64_t v22 = [(CDPDAccount *)v18 isICDPEnabledForDSID:v21 checkWithServer:0];

  objc_super v23 = NSNumber;
  uint64_t v24 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
  v25 = [v24 altDSID];
  v26 = objc_msgSend(v23, "numberWithUnsignedInteger:", -[CDPDAccount recoveryContactCountForAltDSID:](v18, "recoveryContactCountForAltDSID:", v25));

  v27 = [NSNumber numberWithBool:v22];
  [v6 setObject:v27 forKeyedSubscript:*MEMORY[0x263F34518]];

  [v6 setObject:v26 forKeyedSubscript:*MEMORY[0x263F34688]];
}

- (void)beginRecovery:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F202A8];
  id v6 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
  id v7 = [v5 analyticsEventWithContext:v6 eventName:*MEMORY[0x263F34658] category:*MEMORY[0x263F34830]];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__CDPDRecoveryFlowController_beginRecovery___block_invoke;
  v10[3] = &unk_26432F108;
  v10[4] = self;
  id v11 = v7;
  id v12 = v4;
  id v8 = v4;
  id v9 = v7;
  [(CDPDRecoveryFlowController *)self retrieveInflatedDevices:v10];
}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) _updateInteractiveRecoverStartEvent:*(void *)(a1 + 40) withDevices:v7];
  if (v8)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_2();
    }

    [*(id *)(a1 + 40) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
    [*(id *)(a1 + 40) populateUnderlyingErrorsStartingWithRootError:v8];
    uint64_t v10 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v10 sendEvent:*(void *)(a1 + 40)];

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v8);
    }
  }
  else
  {
    if (*(void *)(*(void *)(a1 + 32) + 48)) {
      uint64_t v12 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v12 = MEMORY[0x263EFFA80];
    }
    [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:*MEMORY[0x263F34558]];
    id v13 = *(void **)(a1 + 32);
    if (v13[6])
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_25;
      v22[3] = &unk_26432F0E0;
      v22[4] = v13;
      uint64_t v14 = *(void *)(a1 + 48);
      id v23 = *(id *)(a1 + 40);
      id v24 = v7;
      char v25 = a2;
      [v13 recoveryValidatorWithDevices:v24 forMultipleICSC:a2 validationHandler:v14 completion:v22];
    }
    else
    {
      id v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_1(v15);
      }

      id v16 = [*(id *)(*(void *)(a1 + 32) + 24) context];
      [v16 keychainSyncSystem];

      id v17 = *(void **)(a1 + 40);
      objc_super v18 = _CDPStateError();
      [v17 populateUnderlyingErrorsStartingWithRootError:v18];

      long long v19 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
      [v19 sendEvent:*(void *)(a1 + 40)];

      uint64_t v20 = *(void *)(a1 + 48);
      long long v21 = _CDPStateError();
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_25(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  id v5 = a2;
  id v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v4 sendEvent:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) beginInteractiveRecoveryForDevices:*(void *)(a1 + 48) isUsingMultipleICSC:*(unsigned __int8 *)(a1 + 56) usingValidator:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 validationHandler:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v16 = (void (**)(id, void *))a6;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [CDPDDeviceSecretValidator alloc];
  id v13 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
  uint64_t v14 = [(CDPDDeviceSecretValidator *)v12 initWithContext:v13 delegate:self];

  [(CDPDDeviceSecretValidator *)v14 setIsUsingMultipleICSC:v7];
  [(CDPDDeviceSecretValidator *)v14 setValidSecretHandler:v10];

  unint64_t v15 = [(CDPDRecoveryFlowController *)self _escapeOfferForDevices:v11];
  [(CDPDDeviceSecretValidator *)v14 setSupportedEscapeOfferMask:v15];
  if (v16) {
    v16[2](v16, v14);
  }
}

- (unint64_t)_escapeOfferForDevices:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryFlowController _escapeOfferForDevices:](self, v5);
  }

  unint64_t v6 = [v4 count];
  if (v6 < 2) {
    return 16;
  }
  BOOL v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CDPDRecoveryFlowController _escapeOfferForDevices:]";
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%s Escape available: other devices", (uint8_t *)&v9, 0xCu);
  }

  return 18;
}

- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:](v8, (uint64_t)self);
    }

    p_recoveryContext = &self->_recoveryContext;
    uint64_t v12 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
    uint64_t v13 = [v12 walrusStatus];

    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:]((id *)&self->_recoveryContext);
    }

    if ([MEMORY[0x263F34400] isGuitarfishEnabled])
    {
      if (v13 == 1)
      {
        BOOL v26 = 1;
      }
      else
      {
        char v25 = [(CDPRecoveryFlowContext *)*p_recoveryContext context];
        BOOL v26 = [v25 edpState] == 2;
      }
      v27 = _CDPLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:]((id *)&self->_recoveryContext);
      }

      if (!v26) {
        goto LABEL_22;
      }
    }
    else if (v13 != 1)
    {
LABEL_22:
      id v28 = _CDPLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_218640000, v28, OS_LOG_TYPE_DEFAULT, "Invoking cdpContext:promptForRemoteSecretWithDevices in CDPDRecoveryFlowController", v32, 2u);
      }

      uiProvider = self->_uiProvider;
      v30 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
      v31 = (void *)[v8 copy];
      [(CDPStateUIProviderInternal *)uiProvider cdpContext:v30 promptForRemoteSecretWithDevices:v31 offeringRemoteApproval:[(CDPRecoveryFlowContext *)self->_recoveryContext hasPeersForRemoteApproval] validator:v9];

      goto LABEL_25;
    }
    long long v21 = [(CDPRecoveryFlowContext *)*p_recoveryContext context];
    -[CDPRecoveryFlowContext setIsWalrusEnabled:](*p_recoveryContext, "setIsWalrusEnabled:", [v21 walrusStatus] == 1);

    uint64_t v22 = [v8 count];
    id v23 = (double *)&CDPRPDExtendedProbationTimeInterval;
    if (!v22) {
      id v23 = (double *)&CDPRPDProbationTimeInterval;
    }
    [(CDPRecoveryFlowContext *)*p_recoveryContext setRpdProbationDuration:*v23];
    id v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "Invoking cdpRecoveryFlowContext:promptForRemoteSecretWithDevices in CDPDRecoveryFlowController", buf, 2u);
    }

    [(CDPStateUIProviderInternal *)self->_uiProvider cdpRecoveryFlowContext:self->_recoveryContext promptForRemoteSecretWithDevices:v8 validator:v9];
  }
  else
  {
    unint64_t v15 = [v8 objectAtIndexedSubscript:0];
    id v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:].cold.4(v15);
    }

    id v17 = self->_uiProvider;
    objc_super v18 = [(CDPRecoveryFlowContext *)self->_recoveryContext context];
    uint64_t v19 = [v15 hasNumericSecret];
    uint64_t v20 = [v15 numericSecretLength];
    -[CDPStateUIProviderInternal cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](v17, "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", v18, v19, v20, [v15 hasRandomSecret], v9);
  }
LABEL_25:
}

- (void)retrieveInflatedDevices:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryFlowController retrieveInflatedDevices:](v5);
  }

  [(CDPDSecureBackupController *)self->_secureBackupController clearAccountInfoCache];
  secureBackupController = self->_secureBackupController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke;
  v8[3] = &unk_26432F130;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CDPDSecureBackupController *)secureBackupController getBackupRecordDevicesWithOptionForceFetch:0 completion:v8];
}

void __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 32) useCircleInfoToUpdateNameForDevices:a3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  return 1;
}

- (void)secretValidator:(id)a3 didRequestValidateEDPIdentitiesWithContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryFlowController secretValidator:didRequestValidateEDPIdentitiesWithContext:completion:](self);
  }

  uint64_t v12 = [(CDPDRecoveryFlowController *)self edpController];
  [v12 secretValidator:v10 didRequestValidateEDPIdentitiesWithContext:v9 completion:v8];
}

- (void)secretValidator:(id)a3 didRequestRepairEDPStateWithContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryFlowController secretValidator:didRequestRepairEDPStateWithContext:completion:](self);
  }

  uint64_t v12 = [(CDPDRecoveryFlowController *)self edpController];
  [v12 secretValidator:v10 didRequestRepairEDPStateWithContext:v9 completion:v8];
}

- (void)secretValidator:(id)a3 didRequestEDPRecoveryTokenRepairWithContext:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryFlowController secretValidator:didRequestEDPRecoveryTokenRepairWithContext:successfulCDPRecoveryContinuationHandler:](self);
  }

  uint64_t v12 = [(CDPDRecoveryFlowController *)self edpController];
  [v12 secretValidator:v10 didRequestEDPRecoveryTokenRepairWithContext:v9 successfulCDPRecoveryContinuationHandler:v8];
}

- (void)secretValidator:(id)a3 didRequestValidateEDPRecoveryToken:(id)a4 withContext:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryFlowController secretValidator:didRequestValidateEDPRecoveryToken:withContext:completion:](self);
  }

  unint64_t v15 = [(CDPDRecoveryFlowController *)self edpController];
  [v15 secretValidator:v13 didRequestValidateEDPRecoveryToken:v12 withContext:v11 completion:v10];
}

- (CDPRemoteDeviceSecretValidatorProtocol)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
}

- (CDPDEDPRecoveryController)edpController
{
  return self->_edpController;
}

- (void)setEdpController:(id)a3
{
}

- (CDPRecoveryFlowContext)recoveryContext
{
  return self->_recoveryContext;
}

- (void)setRecoveryContext:(id)a3
{
}

- (CDPDCircleControl)circleController
{
  return self->_circleController;
}

- (void)setCircleController:(id)a3
{
}

- (CDPDSecureBackupController)secureBackupController
{
  return self->_secureBackupController;
}

- (void)setSecureBackupController:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_recoveryContext, 0);
  objc_storeStrong((id *)&self->_edpController, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "We are unable to show UI as the UI provider is missing.", v1, 2u);
}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Recovery flow failed due to device inflation error. %@", v1, 0xCu);
}

- (void)_escapeOfferForDevices:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = NSNumber;
  id v4 = [a1 recoveryContext];
  id v5 = [v4 context];
  id v6 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "type"));
  int v7 = 136315394;
  id v8 = "-[CDPDRecoveryFlowController _escapeOfferForDevices:]";
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "%s Context Type: %@", (uint8_t *)&v7, 0x16u);
}

- (void)beginInteractiveRecoveryForDevices:(id *)a1 isUsingMultipleICSC:usingValidator:.cold.1(id *a1)
{
  v1 = [*a1 context];
  [v1 edpState];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Interactive recovery with EDP status - %lu", v4, v5, v6, v7, v8);
}

- (void)beginInteractiveRecoveryForDevices:(id *)a1 isUsingMultipleICSC:usingValidator:.cold.2(id *a1)
{
  v1 = [*a1 context];
  [v1 walrusStatus];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Interactive recovery with walrus status - %lu", v4, v5, v6, v7, v8);
}

- (void)beginInteractiveRecoveryForDevices:(void *)a1 isUsingMultipleICSC:(uint64_t)a2 usingValidator:.cold.3(void *a1, uint64_t a2)
{
  [a1 count];
  [*(id *)(a2 + 24) hasPeersForRemoteApproval];
  OUTLINED_FUNCTION_2_1(&dword_218640000, v3, v4, "Requesting UI provider prompt for a remote device secret from one of %lu devices (offeringRemoteApproval=%i)", v5, v6, v7, v8, 0);
}

- (void)beginInteractiveRecoveryForDevices:(void *)a1 isUsingMultipleICSC:usingValidator:.cold.4(void *a1)
{
  [a1 hasNumericSecret];
  uint64_t v8 = [a1 numericSecretLength];
  OUTLINED_FUNCTION_2_1(&dword_218640000, v2, v3, "Requesting UI provider prompt for an ICSC isNumeric=%i numericLength=%@", v4, v5, v6, v7, 2u);
}

- (void)retrieveInflatedDevices:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Fetching backup record devices", v1, 2u);
}

void __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Failed to fetch backup record devices: %@", v1, 0xCu);
}

- (void)secretValidator:(void *)a1 didRequestValidateEDPIdentitiesWithContext:completion:.cold.1(void *a1)
{
  v1 = [a1 edpController];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "CDPDRecoveryFlowController forwarding validateEDPIdentities call to %@", v4, v5, v6, v7, v8);
}

- (void)secretValidator:(void *)a1 didRequestRepairEDPStateWithContext:completion:.cold.1(void *a1)
{
  v1 = [a1 edpController];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "CDPDRecoveryFlowController forwarding repairEDPState call to %@", v4, v5, v6, v7, v8);
}

- (void)secretValidator:(void *)a1 didRequestEDPRecoveryTokenRepairWithContext:successfulCDPRecoveryContinuationHandler:.cold.1(void *a1)
{
  v1 = [a1 edpController];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "CDPDRecoveryFlowController forwarding edpRecoveryTokenRepair call to %@", v4, v5, v6, v7, v8);
}

- (void)secretValidator:(void *)a1 didRequestValidateEDPRecoveryToken:withContext:completion:.cold.1(void *a1)
{
  v1 = [a1 edpController];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "CDPDRecoveryFlowController forwarding validateEDPRecoveryToken call to %@", v4, v5, v6, v7, v8);
}

@end
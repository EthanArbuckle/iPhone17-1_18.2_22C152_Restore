@interface CDPDEscrowRecordController
- (AAFKeychainManager)keychainManager;
- (BOOL)_clearLastEscrowRepairAttemptDate:(id *)a3;
- (BOOL)_isEligibleForEscrowRecordOperationsWithError:(id *)a3;
- (BOOL)_isEscrowRecordRepairPermitted;
- (BOOL)_setLastEscrowRepairAttemptDate:(id)a3 error:(id *)a4;
- (BOOL)_shouldPerformSilentRepairForEscrowRecordState:(unint64_t)a3;
- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3;
- (BOOL)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 error:(id *)a4;
- (CDPContext)context;
- (CDPDCircleController)circleController;
- (CDPDCircleProxy)circleProxy;
- (CDPDEscrowRecordController)initWithContext:(id)a3;
- (CDPDEscrowRecordController)initWithContext:(id)a3 circleProxy:(id)a4 octagonTrustProxy:(id)a5 secureBackupProxy:(id)a6;
- (CDPDOctagonTrustProxy)octagonTrustProxy;
- (CDPDSecureBackupController)secureBackupController;
- (CDPDSecureBackupProxy)secureBackupProxy;
- (id)_cdpStateMachineWithNilUIProvider;
- (id)_escrowRecordHealthCheckFailureCountForAccount:(id)a3;
- (id)_firstUsableRecordForCurrentPeerWithSerialNumber:(id)a3 fromRecords:(id)a4;
- (id)_getAccountRepresentationForAltDSID:(id)a3;
- (id)_getAppleAccountForAltDSID:(id)a3;
- (id)_lastEscrowRepairAttemptDate:(id *)a3;
- (id)_lastEscrowRepairAttemptDateDescriptor;
- (id)circlePeerIDForSecureBackupController:(id)a3;
- (id)secureChannelContextForController:(id)a3;
- (unint64_t)_combinedCircleStatusUsingCache:(BOOL)a3 error:(id *)a4;
- (void)_beginSilentEscrowRecordRepairWithState:(unint64_t)a3 completion:(id)a4;
- (void)_checkAllRecordsForCurrentDeviceUsingCache:(BOOL)a3 completion:(id)a4;
- (void)_checkFirstUsableRecordForDeviceFromSource:(int64_t)a3 completion:(id)a4;
- (void)_continueSilentEscrowRecordRepairWithState:(unint64_t)a3 completion:(id)a4;
- (void)_determineEligibilityForSilentRepairWithCompletion:(id)a3;
- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:(id)a3;
- (void)_deviceEscrowRecordStateUsingCache:(BOOL)a3 completion:(id)a4;
- (void)_escrowRecordStateForDevice:(id)a3 usingCache:(BOOL)a4 completion:(id)a5;
- (void)_fetchAllEscrowRecordsFromSource:(int64_t)a3 completion:(id)a4;
- (void)_isEscrowRecordRepairPermitted;
- (void)_performSilentEscrowRecordRepairWithCompletion:(id)a3;
- (void)_shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4;
- (void)_tlkRecoveryViewsForRecord:(id)a3 usingCache:(BOOL)a4 completion:(id)a5;
- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4;
- (void)generateEscrowRecordStatusReportForLocalDeviceUsingCache:(BOOL)a3 withCompletion:(id)a4;
- (void)generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:(int64_t)a3 withCompletion:(id)a4;
- (void)performSilentEscrowRecordRepairWithCompletion:(id)a3;
- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3;
- (void)promptForLocalSecretWithCompletion:(id)a3;
- (void)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4;
@end

@implementation CDPDEscrowRecordController

- (CDPDEscrowRecordController)initWithContext:(id)a3 circleProxy:(id)a4 octagonTrustProxy:(id)a5 secureBackupProxy:(id)a6
{
  id v11 = a3;
  id v29 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 dsid];
  if (v14
    && (v15 = (void *)v14,
        [v11 altDSID],
        v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    v30.receiver = self;
    v30.super_class = (Class)CDPDEscrowRecordController;
    v17 = [(CDPDEscrowRecordController *)&v30 init];
    v18 = v17;
    v19 = v29;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_context, a3);
      objc_storeStrong((id *)&v18->_circleProxy, a4);
      objc_storeStrong((id *)&v18->_octagonTrustProxy, a5);
      objc_storeStrong((id *)&v18->_secureBackupProxy, a6);
      v20 = (AAFKeychainManager *)objc_alloc_init(MEMORY[0x263F202F8]);
      keychainManager = v18->_keychainManager;
      v18->_keychainManager = v20;

      v22 = [[CDPDCircleController alloc] initWithUiProvider:0 delegate:v18 circleProxy:v29 octagonTrustProxy:v12];
      circleController = v18->_circleController;
      v18->_circleController = v22;

      v24 = [[CDPDSecureBackupController alloc] initWithContext:v11 secureBackupProxy:v13 octagonTrustProxy:v12];
      secureBackupController = v18->_secureBackupController;
      v18->_secureBackupController = v24;

      [(CDPDSecureBackupController *)v18->_secureBackupController setDelegate:v18];
    }
    self = v18;
    v26 = self;
  }
  else
  {
    v27 = _CDPLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[CDPDEscrowRecordController initWithContext:circleProxy:octagonTrustProxy:secureBackupProxy:]();
    }

    v26 = 0;
    v19 = v29;
  }

  return v26;
}

- (CDPDEscrowRecordController)initWithContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F34340];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContext:v5];
  v7 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:v5];
  v8 = [[CDPDSecureBackupProxyImpl alloc] initWithContext:v5];
  v9 = [(CDPDEscrowRecordController *)self initWithContext:v5 circleProxy:v6 octagonTrustProxy:v7 secureBackupProxy:v8];

  return v9;
}

- (void)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__CDPDEscrowRecordController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke;
  v8[3] = &unk_26432FB70;
  id v9 = v6;
  id v7 = v6;
  [(CDPDEscrowRecordController *)self _shouldPerformSilentEscrowRecordRepairUsingCache:v4 completion:v8];
}

uint64_t __89__CDPDEscrowRecordController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  }
  return result;
}

- (void)performSilentEscrowRecordRepairWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = +[CDPDLockAssertion lock];
  id v7 = [MEMORY[0x263F08C38] UUID];
  v8 = [v7 UUIDString];
  id v9 = [(CDPDEscrowRecordController *)self context];
  [v9 setTelemetryFlowID:v8];

  v10 = [(CDPDEscrowRecordController *)self context];
  [v10 populateWalrusStatus];

  id v11 = (void *)MEMORY[0x263F202A8];
  id v12 = [(CDPDEscrowRecordController *)self context];
  id v13 = [v11 analyticsEventWithContext:v12 eventName:*MEMORY[0x263F34790] category:*MEMORY[0x263F34830]];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__CDPDEscrowRecordController_performSilentEscrowRecordRepairWithCompletion___block_invoke;
  v18[3] = &unk_26432FB98;
  id v19 = v6;
  id v20 = v13;
  id v21 = v5;
  id v22 = v4;
  id v14 = v5;
  id v15 = v4;
  id v16 = v13;
  id v17 = v6;
  [(CDPDEscrowRecordController *)self _performSilentEscrowRecordRepairWithCompletion:v18];
}

void __76__CDPDEscrowRecordController_performSilentEscrowRecordRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  [*(id *)(a1 + 32) unlock];
  id v5 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:*MEMORY[0x263F34558]];

  [*(id *)(a1 + 40) populateUnderlyingErrorsStartingWithRootError:v8];
  id v6 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v6 sendEvent:*(void *)(a1 + 40)];

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (BOOL)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [MEMORY[0x263F20318] isInternalBuild];
  id v8 = _CDPLogSystem();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "%@: Attempting to update the last silent escrow record repair attempt date (%@)", (uint8_t *)&v12, 0x16u);
    }

    BOOL v10 = [(CDPDEscrowRecordController *)self _setLastEscrowRepairAttemptDate:v6 error:a4];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CDPDEscrowRecordController updateLastSilentEscrowRecordRepairAttemptDate:error:]();
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (void)_shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__CDPDEscrowRecordController__shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke;
  v8[3] = &unk_26432FBC0;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CDPDEscrowRecordController *)self _deviceEscrowRecordStateUsingCache:v4 completion:v8];
}

void __90__CDPDEscrowRecordController__shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) _shouldPerformSilentRepairForEscrowRecordState:a2];
  if (a2 == 4)
  {
    uint64_t v6 = [v9 code];
    id v7 = v9;
    if (v6 == -5403)
    {

      id v7 = 0;
    }
  }
  else
  {
    id v7 = v9;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    BOOL v10 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, v5);
    id v7 = v10;
  }
}

- (BOOL)_shouldPerformSilentRepairForEscrowRecordState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_218640000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "%@: Determining if silent repair should be performed for state (%lu)", (uint8_t *)&v10, 0x16u);
  }

  if ([(CDPDEscrowRecordController *)self _isEscrowRecordRepairPermitted])
  {
    switch(a3)
    {
      case 0uLL:
        uint64_t v6 = _CDPLogSystem();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        int v10 = 138412290;
        id v11 = self;
        id v7 = "%@: Silent repair should not be performed for unknown state";
        goto LABEL_9;
      case 1uLL:
        uint64_t v6 = _CDPLogSystem();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        int v10 = 138412290;
        id v11 = self;
        id v7 = "%@: Silent repair should not be performed for viable state";
        goto LABEL_9;
      case 2uLL:
        uint64_t v6 = _CDPLogSystem();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        int v10 = 138412290;
        id v11 = self;
        id v9 = "%@: Silent repair should be performed for not found state";
        break;
      case 3uLL:
        LODWORD(v5) = [MEMORY[0x263F34400] isSilentEscrowRecordViabilityRepairEnabled];
        uint64_t v6 = _CDPLogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412546;
          id v11 = self;
          __int16 v12 = 1024;
          LODWORD(v13) = v5;
          _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "%@: Silent repair can be perfomed for non viable state (%{BOOL}d)", (uint8_t *)&v10, 0x12u);
        }
        goto LABEL_11;
      case 4uLL:
        uint64_t v6 = _CDPLogSystem();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        int v10 = 138412290;
        id v11 = self;
        id v9 = "%@: Silent burn recovery can be perfomed for missing circle state";
        break;
      default:
        return v5 & 1;
    }
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
LABEL_22:
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = self;
      id v7 = "%@: Silent repair should not be performed due to rate limiting";
LABEL_9:
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    }
LABEL_10:
    LOBYTE(v5) = 0;
  }
LABEL_11:

  return v5 & 1;
}

- (void)_performSilentEscrowRecordRepairWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke;
  aBlock[3] = &unk_26432FBE8;
  id v11 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_2;
  v8[3] = &unk_26432EE10;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CDPDEscrowRecordController *)self _determineEligibilityForSilentRepairWithCompletion:v8];
}

uint64_t __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned int a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, a3 & a4, a5);
  }
  return result;
}

void __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = a2;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%@: Proceeding with silent escrow record repair for state (%lu)", buf, 0x16u);
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_58;
    v9[3] = &unk_26432FC10;
    id v7 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = a2;
    [v7 _beginSilentEscrowRecordRepairWithState:a2 completion:v9];
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

uint64_t __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 1, a2, a3);
}

- (void)generateEscrowRecordStatusReportForLocalDeviceUsingCache:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v11 = 0;
  BOOL v7 = [(CDPDEscrowRecordController *)self _isEligibleForEscrowRecordOperationsWithError:&v11];
  id v8 = v11;
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke;
    v9[3] = &unk_26432FC38;
    void v9[4] = self;
    id v10 = v6;
    [(CDPDEscrowRecordController *)self _fetchAllEscrowRecordsFromSource:a3 completion:v9];
  }
  else if (v6)
  {
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v8);
  }
}

void __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    int v9 = [MEMORY[0x263F34400] shouldValidatePasscodeGenerations];
    id v10 = objc_alloc(MEMORY[0x263F34378]);
    id v11 = v10;
    if (v9)
    {
      __int16 v12 = [MEMORY[0x263F343A8] sharedInstance];
      uint64_t v13 = (void *)[v11 initWithRecords:v5 localDevice:v12];

      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v13, 0);
      }
    }
    else
    {
      uint64_t v15 = (void *)[v10 initWithDefaultValues];
      uint64_t v16 = [MEMORY[0x263F343A8] sharedInstance];
      id v17 = [v16 serialNumber];

      v18 = [*(id *)(a1 + 32) _firstUsableRecordForCurrentPeerWithSerialNumber:v17 fromRecords:v5];
      id v19 = v18;
      if (v18)
      {
        id v20 = [v18 escrowInformationMetadata];
        id v21 = [v20 clientMetadata];
        id v22 = [v21 deviceName];

        v23 = [v19 serialNumber];
        v24 = _CDPLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v15;
          v25 = v17;
          v26 = v23;
          v27 = v22;
          uint64_t v28 = *(void *)(a1 + 32);
          id v29 = [v19 recordId];
          *(_DWORD *)buf = 138544386;
          uint64_t v36 = v28;
          id v22 = v27;
          v23 = v26;
          id v17 = v25;
          uint64_t v15 = v34;
          __int16 v37 = 2160;
          uint64_t v38 = 1752392040;
          __int16 v39 = 2112;
          v40 = v29;
          __int16 v41 = 2112;
          v42 = v22;
          __int16 v43 = 2112;
          v44 = v23;
          _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Processing device escrow record with id: %{mask.hash}@ (name: '%@', serial: %@)", buf, 0x34u);
        }
        objc_super v30 = [v15 updatedReportWithRecord:v19];

        uint64_t v31 = *(void *)(a1 + 40);
        if (v31) {
          (*(void (**)(uint64_t, void *, void))(v31 + 16))(v31, v30, 0);
        }
      }
      else
      {
        v32 = _CDPLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_1();
        }

        uint64_t v33 = *(void *)(a1 + 40);
        if (v33) {
          (*(void (**)(uint64_t, void *, void))(v33 + 16))(v33, v15, 0);
        }
        objc_super v30 = v15;
      }
    }
  }
}

- (id)_firstUsableRecordForCurrentPeerWithSerialNumber:(id)a3 fromRecords:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.7(v7);
  }

  if (![v6 count] || !objc_msgSend(v5, "length"))
  {
    int v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:](v6);
    }
    goto LABEL_39;
  }
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.6();
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (!v10)
  {
LABEL_39:
    id v26 = 0;
    goto LABEL_44;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v36;
  id v29 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v36 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      uint64_t v15 = objc_msgSend(v14, "serialNumber", v29);
      char v16 = [v15 isEqualToString:v5];

      id v17 = _CDPLogSystem();
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        id v22 = [v14 serialNumber];
        *(_DWORD *)buf = 138543874;
        v42 = self;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v22;
        __int16 v45 = 2112;
        id v46 = v5;
        v23 = v18;
        v24 = "%{public}@: Skipping record with serial number (%@). This device has a serial number of (%@)";
        goto LABEL_33;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.5(v39, &v40, v18);
      }

      id v19 = [v14 label];
      char v20 = [v19 hasPrefix:@"com.apple.icdp.record"];

      id v21 = _CDPLogSystem();
      v18 = v21;
      if ((v20 & 1) == 0)
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        id v22 = [v14 label];
        *(_DWORD *)buf = 138543874;
        v42 = self;
        __int16 v43 = 2160;
        uint64_t v44 = 1752392040;
        __int16 v45 = 2112;
        id v46 = v22;
        v23 = v18;
        v24 = "%{public}@: Skipping record with incorrect label %{mask.hash}@";
        goto LABEL_33;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.4(&v33, v34, v18);
      }

      if ([v14 hasRecordStatus] && objc_msgSend(v14, "recordStatus") == 1)
      {
        v18 = _CDPLogSystem();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        id v22 = [v14 recordId];
        *(_DWORD *)buf = 138543874;
        v42 = self;
        __int16 v43 = 2160;
        uint64_t v44 = 1752392040;
        __int16 v45 = 2112;
        id v46 = v22;
        v23 = v18;
        v24 = "%{public}@: Record %{mask.hash}@ has invalid status.";
        goto LABEL_33;
      }
      v25 = _CDPLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:](&v31, v32, v25);
      }

      if ([v14 hasRecordViability]
        && ([v14 recordViability] == 1
         || ![v14 recordViability]))
      {
        v27 = _CDPLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:](v14);
        }

        id v26 = v14;
        goto LABEL_43;
      }
      v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v14 recordId];
        *(_DWORD *)buf = 138543874;
        v42 = self;
        __int16 v43 = 2160;
        uint64_t v44 = 1752392040;
        __int16 v45 = 2112;
        id v46 = v22;
        v23 = v18;
        v24 = "%{public}@: Record %{mask.hash}@ is not partially or fully viable. Skipping update.";
LABEL_33:
        _os_log_error_impl(&dword_218640000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);
      }
LABEL_34:
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  id v26 = 0;
LABEL_43:
  id v6 = v29;
LABEL_44:

  return v26;
}

- (void)_determineEligibilityForSilentRepairWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CDPDEscrowRecordController *)self context];
  char v6 = [v5 isLocalSecretCached];

  if (v6)
  {
    if ([(CDPDEscrowRecordController *)self _isEscrowRecordRepairPermitted])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __81__CDPDEscrowRecordController__determineEligibilityForSilentRepairWithCompletion___block_invoke;
      v12[3] = &unk_26432EE10;
      v12[4] = self;
      id v13 = v4;
      [(CDPDEscrowRecordController *)self _shouldPerformSilentEscrowRecordRepairUsingCache:1 completion:v12];

      goto LABEL_13;
    }
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = self;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "%@: Cannot silently repair escrow record due to rate limiting", buf, 0xCu);
    }

    if (v4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = -5203;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = self;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%@: Cannot silently repair escrow record without cached local secret", buf, 0xCu);
    }

    if (v4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = -5003;
LABEL_12:
      uint64_t v11 = objc_msgSend(v8, "cdp_errorWithCode:", v9);
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v11);
    }
  }
LABEL_13:
}

void __81__CDPDEscrowRecordController__determineEligibilityForSilentRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = v7;
  if ((a3 & 1) != 0
    || [v7 code] == 51
    && ([v8 domain],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:@"com.apple.security.trustedpeers.container"],
        v9,
        v10))
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "%@: Double checking if silent escrow record repair should be performed (using network)", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(a1 + 32) _shouldPerformSilentEscrowRecordRepairUsingCache:0 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t, void, void *))(v13 + 16))(v13, a2, 0, v8);
    }
  }
}

- (BOOL)_isEscrowRecordRepairPermitted
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v14 = 0;
  v3 = [(CDPDEscrowRecordController *)self _lastEscrowRepairAttemptDate:&v14];
  id v4 = v14;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPDEscrowRecordController _isEscrowRecordRepairPermitted]((uint64_t)self);
    }
    BOOL v6 = 0;
    goto LABEL_18;
  }
  id v5 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%@: Fetched last escrow repair attempt date (%@)", buf, 0x16u);
    }

    id v5 = [v3 dateByAddingTimeInterval:15552000.0];
    [v5 timeIntervalSinceNow];
    double v9 = v8;
    int v10 = _CDPLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    BOOL v6 = v9 <= 0.0;
    if (v9 > 0.0)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = self;
        uint64_t v12 = "%@: Escrow record repair will not be allowed at this time";
        goto LABEL_16;
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      uint64_t v12 = "%@: Escrow record repair will be allowed at this time";
LABEL_16:
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }

    goto LABEL_18;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = self;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%@: Could not find an existing keychain value for last escrow repair attempt date, allowing repair to proceed", buf, 0xCu);
  }
  BOOL v6 = 1;
LABEL_18:

  return v6;
}

- (BOOL)_isEligibleForEscrowRecordOperationsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = [(CDPDEscrowRecordController *)self context];
  BOOL v6 = [v5 altDSID];
  BOOL v7 = [(CDPDEscrowRecordController *)self _getAccountRepresentationForAltDSID:v6];

  if (v7)
  {
    double v8 = [MEMORY[0x263F343A8] sharedInstance];
    if ([v8 hasLocalSecret])
    {
      double v9 = [(CDPDEscrowRecordController *)self circleController];
      uint64_t v10 = [v9 circleStatus];

      if (v10 == 1)
      {
        BOOL v11 = 1;
LABEL_19:

        goto LABEL_20;
      }
      __int16 v17 = _CDPLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        char v20 = self;
        __int16 v21 = 2048;
        uint64_t v22 = v10;
        _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "%@: Cannot determine escrow record state for device not in circle (%lu)", (uint8_t *)&v19, 0x16u);
      }

      if (a3)
      {
        uint64_t v16 = -5403;
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        char v20 = self;
        _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "%@: Will not determine escrow record state for device without local secret (not eligible)", (uint8_t *)&v19, 0xCu);
      }

      if (a3)
      {
        uint64_t v16 = -5500;
LABEL_17:
        objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", v16);
        BOOL v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    BOOL v11 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(CDPDEscrowRecordController *)self context];
    id v14 = [v13 altDSID];
    int v19 = 138412802;
    char v20 = self;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "%@: Cannot determine escrow record for unknown account with altDSID (%{mask.hash}@)", (uint8_t *)&v19, 0x20u);
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5108);
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(CDPDEscrowRecordController *)self context];
  BOOL v6 = [v5 altDSID];
  BOOL v7 = [(CDPDEscrowRecordController *)self _getAppleAccountForAltDSID:v6];

  if (v7)
  {
    double v8 = [(CDPDEscrowRecordController *)self _escrowRecordHealthCheckFailureCountForAccount:v7];

    if (v8)
    {
      objc_opt_class();
      id v9 = [(CDPDEscrowRecordController *)self _escrowRecordHealthCheckFailureCountForAccount:v7];
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }

      int v17 = [v10 intValue];
      v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = "unknown";
        if (v17 > 0) {
          int v19 = "non-viable or not found";
        }
        int v22 = 138412546;
        __int16 v23 = self;
        __int16 v24 = 2080;
        uint64_t v25 = (uint64_t)v19;
        _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "%@: Used precomputed escrowRecordHealthCheckFailureCount bit and determined escrow record state is %s.", (uint8_t *)&v22, 0x16u);
      }

      if (v17 < 1)
      {
        char v20 = _CDPLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingAccountsHealthCheckCache:]();
        }

        if (v4)
        {
          __int16 v21 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5324);
          v4[2](v4, 0, v21);
        }
      }
      else if (v4)
      {
        v4[2](v4, 2, 0);
      }
      goto LABEL_22;
    }
    uint64_t v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingAccountsHealthCheckCache:]();
    }

    if (v4)
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = -5323;
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(CDPDEscrowRecordController *)self context];
      uint64_t v13 = [v12 altDSID];
      int v22 = 138412802;
      __int16 v23 = self;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "%@: Cannot determine escrow record for unknown account with altDSID (%{mask.hash}@)", (uint8_t *)&v22, 0x20u);
    }
    if (v4)
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = -5108;
LABEL_13:
      objc_msgSend(v14, "cdp_errorWithCode:", v15);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v10);
LABEL_22:
    }
  }
}

- (void)_deviceEscrowRecordStateUsingCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, void, id))a4;
  BOOL v7 = [(CDPDEscrowRecordController *)self context];
  double v8 = [v7 altDSID];
  id v9 = [(CDPDEscrowRecordController *)self _getAccountRepresentationForAltDSID:v8];

  if (!v9)
  {
    v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [(CDPDEscrowRecordController *)self context];
      char v20 = [v19 altDSID];
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = self;
      __int16 v41 = 2160;
      uint64_t v42 = 1752392040;
      __int16 v43 = 2112;
      uint64_t v44 = v20;
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "%@: Cannot determine escrow record for unknown account with altDSID (%{mask.hash}@)", buf, 0x20u);
    }
    if (!v6) {
      goto LABEL_26;
    }
    __int16 v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = -5108;
LABEL_24:
    objc_msgSend(v21, "cdp_errorWithCode:", v22);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v13);
LABEL_25:

    goto LABEL_26;
  }
  id v10 = [MEMORY[0x263F343A8] sharedInstance];
  char v11 = [v10 hasLocalSecret];

  if ((v11 & 1) == 0)
  {
    __int16 v23 = _CDPLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = self;
      _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "%@: Will not determine escrow record state for device without local secret (not eligible)", buf, 0xCu);
    }

    if (!v6) {
      goto LABEL_26;
    }
    __int16 v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = -5500;
    goto LABEL_24;
  }
  if ([v9 isSilentEscrowRecordRepairEnabledV2])
  {
    id v38 = 0;
    unint64_t v12 = [(CDPDEscrowRecordController *)self _combinedCircleStatusUsingCache:v4 error:&v38];
    id v13 = v38;
    if ([v9 isSilentBurnCDPRepairEnabled])
    {
      if ([MEMORY[0x263F34400] isSilentBurnInMiniBuddyEnabled])
      {
        id v14 = [(CDPDEscrowRecordController *)self context];
        uint64_t v15 = [v14 type];

        if (v15 == 10 && v12 != 1)
        {
          uint64_t v16 = _CDPLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = self;
            _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "%@: Device not in circle; will try a silent burn recovery...",
              buf,
              0xCu);
          }

          if (v6)
          {
            int v17 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5403, v13);
            v6[2](v6, 4, v17);
          }
          goto LABEL_25;
        }
      }
    }
    else
    {
      uint64_t v25 = _CDPLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = self;
        _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "%@: Cannot perform silent burn in mini-buddy due to server-side disablement", buf, 0xCu);
      }
    }
    if (v4)
    {
      [(CDPDEscrowRecordController *)self _deviceEscrowRecordStateUsingAccountsHealthCheckCache:v6];
    }
    else if ([MEMORY[0x263F34400] shouldValidatePasscodeGenerations])
    {
      __int16 v26 = [(CDPDEscrowRecordController *)self circleController];
      v27 = [v26 peerID];

      if (v27)
      {
        uint64_t v28 = [(CDPDEscrowRecordController *)self secureBackupController];
        int v29 = [v28 isSimulateNonViableEscrowRecordEnabled];

        if (v29)
        {
          objc_super v30 = _CDPLogSystem();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = self;
            _os_log_impl(&dword_218640000, v30, OS_LOG_TYPE_DEFAULT, "%@: Simulating escrow record as non-viable record only for testing", buf, 0xCu);
          }

          if (v6) {
            v6[2](v6, 3, 0);
          }
        }
        else
        {
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke;
          v36[3] = &unk_26432FC60;
          v36[4] = self;
          long long v37 = v6;
          [(CDPDEscrowRecordController *)self generateEscrowRecordStatusReportForLocalDeviceUsingCache:0 withCompletion:v36];
        }
      }
      else
      {
        uint8_t v31 = _CDPLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingCache:completion:]();
        }

        if (v6)
        {
          v32 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5309);
          v6[2](v6, 4, v32);
        }
      }
    }
    else
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_68;
      v33[3] = &unk_26432FC88;
      v33[4] = self;
      v34 = v6;
      char v35 = 0;
      [(CDPDEscrowRecordController *)self _checkAllRecordsForCurrentDeviceUsingCache:0 completion:v33];
    }
    goto LABEL_25;
  }
  __int16 v24 = _CDPLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = self;
    _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "%@: Cannot determine escrow record state due to server-side disablement", buf, 0xCu);
  }

  if (v6)
  {
    __int16 v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = -5004;
    goto LABEL_24;
  }
LABEL_26:
}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = _CDPLogSystem();
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      v18 = [v5 deviceViability];
      char v11 = [v18 recordId];
      unint64_t v12 = [v5 deviceViability];
      int v13 = [v12 localViability];
      id v14 = [v5 deviceViability];
      [v14 localViability];
      uint64_t v15 = CDPEscrowRecordStateString();
      *(_DWORD *)buf = 138413314;
      uint64_t v20 = v10;
      __int16 v21 = 2160;
      uint64_t v22 = 1752392040;
      __int16 v23 = 2112;
      __int16 v24 = v11;
      __int16 v25 = 1024;
      int v26 = v13;
      __int16 v27 = 2114;
      uint64_t v28 = v15;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "%@: Report indicates that the current device's most viable record is: (%{mask.hash}@ with state: %d (%{public}@)", buf, 0x30u);
    }
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16)
    {
      int v17 = [v5 deviceViability];
      (*(void (**)(uint64_t, uint64_t, void))(v16 + 16))(v16, [v17 localViability], 0);
    }
  }
}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_68_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = *(void (**)(void))(v8 + 16);
LABEL_6:
      v9();
    }
  }
  else
  {
    uint64_t v10 = _CDPLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = [v5 recordID];
        int v16 = 138412546;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        int v19 = v13;
        _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "%@: Determed that current device has an existing escrow record (%@)", (uint8_t *)&v16, 0x16u);
      }
      [*(id *)(a1 + 32) _escrowRecordStateForDevice:v5 usingCache:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
    }
    else
    {
      if (v11)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v16 = 138412290;
        uint64_t v17 = v14;
        _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "%@: Existing escrow record for current device could not be found", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v15 = *(void *)(a1 + 40);
      if (v15)
      {
        uint64_t v9 = *(void (**)(void))(v15 + 16);
        goto LABEL_6;
      }
    }
  }
}

- (void)_checkAllRecordsForCurrentDeviceUsingCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(CDPDEscrowRecordController *)self circleController];
  uint64_t v8 = [v7 peerID];

  if (v8)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __84__CDPDEscrowRecordController__checkAllRecordsForCurrentDeviceUsingCache_completion___block_invoke;
    v11[3] = &unk_26432FCB0;
    id v12 = v6;
    [(CDPDEscrowRecordController *)self _checkFirstUsableRecordForDeviceFromSource:v4 completion:v11];
    uint64_t v9 = v12;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingCache:completion:]();
  }

  if (v6)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5309);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __84__CDPDEscrowRecordController__checkAllRecordsForCurrentDeviceUsingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = (objc_class *)MEMORY[0x263F34368];
  id v6 = a2;
  BOOL v7 = (void *)[[v5 alloc] initWithEscrowRecord:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v9);
  }
}

- (void)_escrowRecordStateForDevice:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v18 = self;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "%@: Checking if device (%@) is missing TLK recoverability using cache (%{BOOL}d)", buf, 0x1Cu);
  }

  BOOL v11 = [v8 record];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke;
  v14[3] = &unk_26432FCD8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(CDPDEscrowRecordController *)self _tlkRecoveryViewsForRecord:v11 usingCache:v6 completion:v14];
}

void __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v6 isRecordNotViableError])
  {
    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) recordID];
      int v21 = 138412802;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      __int16 v24 = v9;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%@: Checking TLK recoverability for escrow record (%@) exposed its non viableness (%@)", (uint8_t *)&v21, 0x20u);
    }
LABEL_4:

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      BOOL v11 = *(void (**)(void))(v10 + 16);
LABEL_11:
      v11();
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v6)
  {
    uint64_t v14 = [*(id *)(a1 + 32) secureBackupController];
    int v15 = [v14 isSimulateNonViableEscrowRecordEnabled];

    BOOL v7 = _CDPLogSystem();
    BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        uint64_t v18 = *(void *)(a1 + 32);
        __int16 v19 = [*(id *)(a1 + 40) recordID];
        int v21 = 138412802;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        __int16 v24 = v19;
        __int16 v25 = 2112;
        id v26 = v5;
        _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%@: Checked TLK recoverability for escrow record (%@) and found views (%@)", (uint8_t *)&v21, 0x20u);
      }
      [v5 count];
      uint64_t v20 = *(void *)(a1 + 48);
      if (v20)
      {
        BOOL v11 = *(void (**)(void))(v20 + 16);
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if (v16)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%@: Simulating escrow record as non-viable record only for testing", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_4;
  }
  id v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke_cold_1(a1, v12);
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    BOOL v11 = *(void (**)(void))(v13 + 16);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_tlkRecoveryViewsForRecord:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [v8 recordId];
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = self;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    __int16 v24 = v11;
    __int16 v25 = 1024;
    BOOL v26 = v6;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking for recoverable TLK views in record (%{mask.hash}@) is missing TLK recoverability using cache (%{BOOL}d)", buf, 0x26u);
  }
  id v12 = [(CDPDEscrowRecordController *)self context];
  uint64_t v13 = +[CDPDSecureBackupConfiguration configurationWithContext:v12];

  uint64_t v14 = [v13 accountInfoFetchSetupDictionary];
  int v15 = [(CDPDEscrowRecordController *)self octagonTrustProxy];
  id v18 = 0;
  BOOL v16 = [v15 tlkRecoverabilityForEscrow:v14 record:v8 source:v6 error:&v18];
  id v17 = v18;

  if (v9) {
    v9[2](v9, v16, v17);
  }
}

- (void)_beginSilentEscrowRecordRepairWithState:(unint64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke;
  aBlock[3] = &unk_26432FD00;
  id v15 = v6;
  unint64_t v16 = a3;
  void aBlock[4] = self;
  id v7 = v6;
  id v8 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  id v9 = [(CDPDEscrowRecordController *)self context];
  uint64_t v10 = [v9 passwordEquivToken];

  BOOL v11 = _CDPLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "%@: Context already has PET, auth is not necessary", buf, 0xCu);
    }

    v8[2](v8, 1, 0);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "%@: Context does not have a PET, attempting to perform silent auth", buf, 0xCu);
    }

    uint64_t v13 = [(CDPDEscrowRecordController *)self context];
    [v13 reauthenticateUserWithCompletion:v8];
  }
}

void __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v8 context];
      uint64_t v10 = [v9 passwordEquivToken];
      int v13 = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2160;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%@: Context is authenticated and has PET (%{mask.hash}@}", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 32) _continueSilentEscrowRecordRepairWithState:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      BOOL v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5109, v5);
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
}

- (void)_continueSilentEscrowRecordRepairWithState:(unint64_t)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF910] date];
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = self;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "%@: Attempting to set the current date (%@) as last escrow repair attempt date", buf, 0x16u);
  }

  id v25 = 0;
  BOOL v9 = [(CDPDEscrowRecordController *)self _setLastEscrowRepairAttemptDate:v7 error:&v25];
  id v10 = v25;
  uint64_t v11 = _CDPLogSystem();
  BOOL v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      uint64_t v29 = v7;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "%@: Successfully saved current date (%@) as last escrow repair attempt date, proceeding with silent repair attempt", buf, 0x16u);
    }

    if (a3 == 4)
    {
      int v13 = [(CDPDEscrowRecordController *)self _cdpStateMachineWithNilUIProvider];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke;
      v23[3] = &unk_26432EDC0;
      v23[4] = self;
      id v24 = v6;
      [v13 repairCloudDataProtectionStateWithCompletion:v23];
    }
    else
    {
      uint64_t v14 = objc_alloc_init(CDPDSecureBackupContext);
      __int16 v15 = [(CDPDEscrowRecordController *)self context];
      -[CDPDSecureBackupContext setUsePreviouslyCachedSecret:](v14, "setUsePreviouslyCachedSecret:", [v15 _useSecureBackupCachedPassphrase]);

      uint64_t v16 = [(CDPDEscrowRecordController *)self context];
      -[CDPDSecureBackupContext setSynchronous:](v14, "setSynchronous:", [v16 _disableAsyncSecureBackupEnrollment]);

      __int16 v17 = [(CDPDEscrowRecordController *)self context];
      id v18 = [v17 cachedLocalSecret];
      [(CDPDSecureBackupContext *)v14 setLocalSecret:v18];

      uint64_t v19 = [(CDPDEscrowRecordController *)self context];
      -[CDPDSecureBackupContext setLocalSecretType:](v14, "setLocalSecretType:", [v19 cachedLocalSecretType]);

      [(CDPDSecureBackupContext *)v14 setNonViableRequiresRepair:a3 == 3];
      uint64_t v20 = [(CDPDEscrowRecordController *)self secureBackupController];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_75;
      v21[3] = &unk_26432EDC0;
      v21[4] = self;
      id v22 = v6;
      [v20 enableSecureBackupWithContext:v14 completion:v21];
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPDEscrowRecordController _continueSilentEscrowRecordRepairWithState:completion:]((uint64_t)self);
    }

    if (v6) {
      (*((void (**)(id, void, id))v6 + 2))(v6, 0, v10);
    }
  }
}

void __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "%@: silent repair with state machine completed with result: %{BOOL}d error: %@", (uint8_t *)&v9, 0x1Cu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

void __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_75(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 domain];
  if ([v6 isEqual:*MEMORY[0x263F329B0]] && objc_msgSend(v5, "code") == -1002)
  {
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) secureBackupController];
    int v8 = [v7 simulateEPThrottle];

    if (!v8) {
      goto LABEL_8;
    }
  }
  int v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_75_cold_1();
  }

LABEL_8:
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

- (void)_checkFirstUsableRecordForDeviceFromSource:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke;
  v8[3] = &unk_26432FD28;
  void v8[4] = self;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(CDPDEscrowRecordController *)self _fetchAllEscrowRecordsFromSource:a3 completion:v8];
}

void __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
    goto LABEL_15;
  }
  id v9 = [MEMORY[0x263F343A8] sharedInstance];
  int64_t v10 = [v9 serialNumber];

  __int16 v11 = [*(id *)(a1 + 32) _firstUsableRecordForCurrentPeerWithSerialNumber:v10 fromRecords:v5];
  int v12 = _CDPLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 48);
      int v22 = 138413058;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2050;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      uint64_t v16 = "%@: First usable record matching the serial number (%@) with source (%{public}ld) is (%@)";
      __int16 v17 = v12;
      uint32_t v18 = 42;
LABEL_11:
      _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
    }
  }
  else if (v13)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 48);
    int v22 = 138412802;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2050;
    uint64_t v27 = v20;
    uint64_t v16 = "%@: Could not find a record matching serial number (%@) with source (%{public}ld).";
    __int16 v17 = v12;
    uint32_t v18 = 32;
    goto LABEL_11;
  }

  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v11, 0);
  }

LABEL_15:
}

- (void)_fetchAllEscrowRecordsFromSource:(int64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(CDPDEscrowRecordController *)self secureBackupController];
  uint64_t v8 = [v7 configuration];
  id v9 = [v8 accountInfoFetchSetupDictionary];

  int64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = +[CDPDSecureBackupController _sanitizedInfoDictionary:v9];
    *(_DWORD *)buf = 138412802;
    __int16 v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "%@: Fetching all escrow records from source (%ld) with account info (%@)", buf, 0x20u);
  }
  octagonTrustProxy = self->_octagonTrustProxy;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke;
  v14[3] = &unk_26432FD50;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [(CDPDOctagonTrustProxy *)octagonTrustProxy fetchAllEscrowRecords:v9 source:a3 completion:v14];
}

void __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      int64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "%@: Successfully fetched all escrow records (%@)", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      int64_t v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

- (id)_lastEscrowRepairAttemptDateDescriptor
{
  id v2 = objc_alloc_init(MEMORY[0x263F202F0]);
  [v2 setItemClass:1];
  [v2 setItemAccessible:4];
  [v2 setInvisible:2];
  [v2 setSynchronizable:1];
  [v2 setUseDataProtection:2];
  [v2 setService:@"com.apple.cdpd.escrow-repair.svc"];
  [v2 setLabel:@"com.apple.cdpd.escrow-repair.label.last-attempt-date"];
  return v2;
}

- (id)_lastEscrowRepairAttemptDate:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = [(CDPDEscrowRecordController *)self _lastEscrowRepairAttemptDateDescriptor];
  id v6 = [(CDPDEscrowRecordController *)self keychainManager];
  id v19 = 0;
  id v7 = [v6 keychainItemForDescriptor:v5 error:&v19];
  id v8 = v19;

  uint64_t v9 = [v7 value];
  if ([v8 code] == -25300)
  {
    int64_t v10 = [v8 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x263F08410]];

    if (v11)
    {
      uint64_t v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = self;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "%@: Last escrow repair attempt date not found in keychain (%@)", buf, 0x16u);
      }

LABEL_12:
      id v16 = 0;
      goto LABEL_15;
    }
  }
  if (!v9)
  {
    if (a3)
    {
      id v16 = 0;
      *a3 = v8;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  id v18 = 0;
  int v13 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v18];
  id v14 = v18;
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = 0;
    if (a3) {
      *a3 = v14;
    }
  }
  else
  {
    id v16 = v13;
  }

LABEL_15:
  return v16;
}

- (BOOL)_setLastEscrowRepairAttemptDate:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v16 = 0;
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v16];
    id v7 = v16;
    id v8 = v7;
    if (v6)
    {
      uint64_t v9 = [(CDPDEscrowRecordController *)self _lastEscrowRepairAttemptDateDescriptor];
      int64_t v10 = (void *)[objc_alloc(MEMORY[0x263F202E8]) initWithDescriptor:v9 value:v6];
      int v11 = [(CDPDEscrowRecordController *)self keychainManager];
      id v15 = 0;
      [v11 addOrUpdateKeychainItem:v10 error:&v15];
      id v12 = v15;

      BOOL v13 = v12 == 0;
      if (a4)
      {
        if (v12) {
          *a4 = v12;
        }
      }
    }
    else
    {
      BOOL v13 = 0;
      if (a4) {
        *a4 = v7;
      }
    }

    return v13;
  }
  else
  {
    return [(CDPDEscrowRecordController *)self _clearLastEscrowRepairAttemptDate:a4];
  }
}

- (BOOL)_clearLastEscrowRepairAttemptDate:(id *)a3
{
  id v5 = [(CDPDEscrowRecordController *)self _lastEscrowRepairAttemptDateDescriptor];
  id v6 = [(CDPDEscrowRecordController *)self keychainManager];
  [v6 deleteKeychainItemsForDescriptor:v5 error:a3];

  return a3 != 0;
}

- (unint64_t)_combinedCircleStatusUsingCache:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = [(CDPDEscrowRecordController *)self circleProxy];
  id v8 = v7;
  if (v5)
  {
    uint64_t v17 = 0;
    uint64_t v9 = (id *)&v17;
    uint64_t v10 = [v7 combinedCachedCircleStatus:&v17];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v9 = (id *)&v16;
    uint64_t v10 = [v7 combinedCircleStatus:&v16];
  }
  unint64_t v11 = v10;
  id v12 = *v9;

  BOOL v13 = _CDPLogSystem();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = self;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = v5;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v12;
      _os_log_error_impl(&dword_218640000, v14, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve combined circle status using cache (%{BOOL}d) with error (%@)", buf, 0x1Cu);
    }

    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = self;
      __int16 v20 = 2048;
      *(void *)uint64_t v21 = v11;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v5;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "%@: Retrieved combined circle status (%lu) using cache (%{BOOL}d)", buf, 0x1Cu);
    }
  }
  return v11;
}

- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4
{
  if (a4)
  {
    BOOL v5 = (void *)MEMORY[0x263F087E8];
    id v6 = a4;
    objc_msgSend(v5, "cdp_errorWithCode:", -5004);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))a4 + 2))(v6, 0, 0, v7);
  }
}

- (id)secureChannelContextForController:(id)a3
{
  return 0;
}

- (id)circlePeerIDForSecureBackupController:(id)a3
{
  v3 = [(CDPDEscrowRecordController *)self circleController];
  BOOL v4 = [v3 peerID];

  return v4;
}

- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3
{
  v3 = [(CDPDEscrowRecordController *)self circleController];
  char v4 = [v3 synchronizeCircleViews];

  return v4;
}

- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (void)promptForLocalSecretWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  char v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[CDPDEscrowRecordController promptForLocalSecretWithCompletion:]();
  }

  if (v3)
  {
    BOOL v5 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    v3[2](v3, 0, v5);
  }
}

- (id)_cdpStateMachineWithNilUIProvider
{
  id v2 = [[CDPDStateMachine alloc] initWithContext:self->_context uiProvider:0];
  return v2;
}

- (id)_escrowRecordHealthCheckFailureCountForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"escrowRecordHealthCheckFailureCount"];
}

- (id)_getAppleAccountForAltDSID:(id)a3
{
  return (id)[MEMORY[0x263F34328] appleAccountForAltDSID:a3];
}

- (id)_getAccountRepresentationForAltDSID:(id)a3
{
  return (id)[MEMORY[0x263F34330] representationForAltDSID:a3];
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (CDPDOctagonTrustProxy)octagonTrustProxy
{
  return self->_octagonTrustProxy;
}

- (CDPDSecureBackupProxy)secureBackupProxy
{
  return self->_secureBackupProxy;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (CDPDCircleController)circleController
{
  return self->_circleController;
}

- (CDPDSecureBackupController)secureBackupController
{
  return self->_secureBackupController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_secureBackupProxy, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:circleProxy:octagonTrustProxy:secureBackupProxy:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218640000, v0, v1, "Expected valid context (%@) with non-null DSID and altDSID", v2, v3, v4, v5, v6);
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218640000, v0, v1, "%@: Unexpected request to remove last silent escrow record repair attempt date", v2, v3, v4, v5, v6);
}

void __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%{public}@: There are no usable records for the local device matching serial number (%@)");
}

void __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to check all records with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(void *)a1 fromRecords:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "Exiting early from usable records check. AllRecordsCount=(%lu), serialNumber=(%@)", v3, v4, v5, v6, 2u);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(void *)a1 fromRecords:.cold.2(void *a1)
{
  id v7 = [a1 recordId];
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "Returning record %{mask.hash}@ because it is partially or fully viable.", v3, v4, v5, v6, 2u);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(os_log_t)log fromRecords:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Checking if record (1) hasRecordViability and (2) the viability is either partially or fully viable", buf, 2u);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(os_log_t)log fromRecords:.cold.4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Checking if record (1) hasRecordStatus and (2) record status is any value other than INVALID", buf, 2u);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(os_log_t)log fromRecords:.cold.5(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = @"com.apple.icdp.record";
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Checking if record's label has prefix '%@'", buf, 0xCu);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:.cold.6()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Beginning account escrow record evaluation to find viable escrow records matching this device's serial number: %@", v1, 0xCu);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(os_log_t)log fromRecords:.cold.7(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Ensuring the following items are not empty: array of records, serial number", v1, 2u);
}

- (void)_isEscrowRecordRepairPermitted
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_218640000, v1, v2, "%@: Failed to fetch keychain value for last escrow repair attempt date with error (%@)", (void)v3, DWORD2(v3));
}

- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "%@: escrowRecordHealthCheckFailureCountKey is not available in Accounts DB cache. Maybe the account health check was never run.", v1, 0xCu);
}

- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "%@: escrowRecordHealthCheckFailureCountKey = 0, indicating that we have a healthy escrow record for the device. MiniBuddy should not have attempted the repair. Please use the eligibility SPI shouldPerformSilentEscrowRecordRepairWithContext before attempting the repair.", v2, v3, v4, v5, v6);
}

- (void)_deviceEscrowRecordStateUsingCache:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "%@: Cannot silently repair escrow record for current device with nil peerID", v2, v3, v4, v5, v6);
}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_218640000, v1, v2, "%@: Failed to determine if device already has escrow record with error (%{public}@)", (void)v3, DWORD2(v3));
}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_68_cold_1()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Failed to determine if device already has escrow record with error (%@)");
}

void __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) recordID];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to check TLK recoverability for record with ID (%@)", (uint8_t *)&v5, 0x16u);
}

void __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Unable to continue silent escrow record repair due to auth error (%@)");
}

- (void)_continueSilentEscrowRecordRepairWithState:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_218640000, v1, v2, "%@: Failed to set last escrow repair attempt date in keychain with error (%@)", (void)v3, DWORD2(v3));
}

void __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_218640000, v0, v1, "%@: Failed to repair the non-viable escrow record as the request was dropped by escrow proxy with error (%@)");
}

void __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to check all records with error: %@", v2, v3, v4, v5, v6);
}

void __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_218640000, v1, v2, "%@: Failed to fetch all escrow records with error (%{public}@)", (void)v3, DWORD2(v3));
}

- (void)promptForLocalSecretWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218640000, v0, v1, "%@: Prompting for local secret is not supported in this flow", v2, v3, v4, v5, v6);
}

@end
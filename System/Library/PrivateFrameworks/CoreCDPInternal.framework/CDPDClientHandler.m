@interface CDPDClientHandler
- (BOOL)_allowDataRecovery;
- (BOOL)_allowFollowUps;
- (BOOL)_allowRecoveryKey;
- (BOOL)_allowStateMachineAccess;
- (BOOL)_allowUtilityAccess;
- (BOOL)_localDeviceHasLocalSecret;
- (BOOL)_shouldForceUseSecureBackupCachedPassphraseWithContext:(id)a3 clientType:(unint64_t)a4;
- (CDPDClientHandler)initWithConnection:(id)a3 entitlements:(unint64_t)a4 clientType:(unint64_t)a5;
- (void)_performRecoveryWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 errorProviuder:(id)a6 resultParser:(id)a7 secureBackUpController:(id)a8 completion:(id)a9;
- (void)_removeObserver;
- (void)_startObservingConnectionStateForRepairWithStateMachine:(id)a3 context:(id)a4;
- (void)_updateSOSCompatibilityMode:(BOOL)a3 context:(id)a4;
- (void)attemptToEscrowPreRecord:(id)a3 context:(id)a4 completion:(id)a5;
- (void)attemptToEscrowPreRecord:(id)a3 preRecordUUID:(id)a4 secretType:(unint64_t)a5 context:(id)a6 completion:(id)a7;
- (void)authenticateAndDeleteRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)broadcastWalrusStateChange;
- (void)circleStatusForContext:(id)a3 completion:(id)a4;
- (void)clearFollowUpWithContext:(id)a3 completion:(id)a4;
- (void)cliqueStatusForContext:(id)a3 completion:(id)a4;
- (void)combinedWalrusStatusWithContext:(id)a3 completion:(id)a4;
- (void)createEDPLivenessDictionaryWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)deviceEscrowRecordRecoverableWithContext:(id)a3 completion:(id)a4;
- (void)fetchEDPTokenForContext:(id)a3 completion:(id)a4;
- (void)fetchEscrowRecordDevicesWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5;
- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4;
- (void)finishCyrusFlowAfterTermsAgreementWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)finishOfflineLocalSecretChangeWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)generateEscrowRecordStatusReportForContext:(id)a3 usingCache:(BOOL)a4 withCompletion:(id)a5;
- (void)generateNewRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)generateRandomRecoveryKeyWithContext:(id)a3 completion:(id)a4;
- (void)handleCloudDataProtectionStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)hasLocalSecretWithCompletion:(id)a3;
- (void)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4 completion:(id)a5;
- (void)isOTEnabledForContext:(id)a3 completion:(id)a4;
- (void)isRecoveryKeyAvailableWithCompletion:(id)a3;
- (void)isUserVisibleKeychainSyncEnabledWithCompletion:(id)a3;
- (void)isWalrusRecoveryKeyAvailableWithCompletion:(id)a3;
- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 context:(id)a5 uiProvider:(id)a6 completion:(id)a7;
- (void)pcsKeysForServices:(id)a3 completion:(id)a4;
- (void)performRecoveryWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 completion:(id)a6;
- (void)performSilentEscrowRecordRepairWithContext:(id)a3 completion:(id)a4;
- (void)postFollowUpWithContext:(id)a3 completion:(id)a4;
- (void)recoverAndSynchronizeSquirrelWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)recoverSquirrelWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)removeNonViewAwarePeersFromCircleWithContext:(id)a3 completion:(id)a4;
- (void)repairCloudDataProtectionStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)repairEDPStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)repairWalrusWithCompletion:(id)a3;
- (void)saveTermsAcceptance:(id)a3 completion:(id)a4;
- (void)sendEvent:(id)a3;
- (void)setKeyChainSyncCompatibilityState:(unint64_t)a3 withAltDSID:(id)a4;
- (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)shouldPerformAuthenticatedRepairForContext:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)shouldPerformRepairForContext:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)shouldPerformSilentEscrowRecordRepairWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5;
- (void)startCircleApplicationApprovalServerWithContext:(id)a3 completion:(id)a4;
- (void)startSilentEscrowRecordRepairWithContext:(id)a3 completion:(id)a4;
- (void)synchronizeUserVisibleKeychainSyncEligibilityForContext:(id)a3 completion:(id)a4;
- (void)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 context:(id)a4 completion:(id)a5;
- (void)updateWalrusStatus:(unint64_t)a3 authenticatedContext:(id)a4 completion:(id)a5;
- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4;
- (void)validateEDPIdentitiesWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(id)a3 completion:(id)a4;
- (void)verifyRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5;
- (void)walrusStatusWithContext:(id)a3 completion:(id)a4;
- (void)webAccessStatusWithCompletion:(id)a3;
@end

@implementation CDPDClientHandler

- (CDPDClientHandler)initWithConnection:(id)a3 entitlements:(unint64_t)a4 clientType:(unint64_t)a5
{
  id v9 = a3;
  v10 = [(CDPDClientHandler *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a3);
    v11->_entitlements = a4;
    v11->_clientType = a5;
    v12 = [[CDPWalrusDaemonService alloc] initWithEntitlements:a4];
    walrusDaemonService = v11->_walrusDaemonService;
    v11->_walrusDaemonService = v12;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walrusDaemonService, 0);
  objc_storeStrong(&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __56__CDPDClientHandler_walrusStatusWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)walrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setEndpoint:3540853470];
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CDPDClientHandler_walrusStatusWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432FA40;
  id v12 = v8;
  id v9 = v8;
  v10 = _Block_copy(aBlock);
  [(CDPWalrusDaemonService *)self->_walrusDaemonService walrusStatusWithContext:v6 completion:v10];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Deallocated %@", v2, v3, v4, v5, v6);
}

- (void)_removeObserver
{
  if (self->_notificationObject)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_notificationObject];
  }
}

- (void)fetchEscrowRecordDevicesWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [v8 setEndpoint:1288689617];
  v10 = _Block_copy(v9);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke;
  aBlock[3] = &unk_2643302D8;
  id v11 = v10;
  id v20 = v11;
  id v12 = _Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowDataRecovery])
  {
    BOOL v13 = !v6;
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:]();
    }

    v15 = [[CDPDSecureBackupController alloc] initWithContext:v8 uiProvider:0 delegate:0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_40;
    v17[3] = &unk_264330328;
    id v18 = v12;
    [(CDPDSecureBackupController *)v15 getBackupRecordDevicesWithOptionForceFetch:v13 completion:v17];

    goto LABEL_9;
  }
  v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:]();
  }

  if (v12)
  {
    _CDPStateError();
    v15 = (CDPDSecureBackupController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDSecureBackupController *))v12 + 2))(v12, 0, v15);
LABEL_9:
  }
}

uint64_t __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_40(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Fetched escrow record devices with error: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
  }
}

- (void)validateEDPIdentitiesWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t, void, void *))a5;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    id v11 = [MEMORY[0x263F34350] preflightContext:v8];
    uint64_t v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler validateEDPIdentitiesWithContext:uiProvider:completion:]();
    }

    id v13 = objc_alloc_init(MEMORY[0x263F343D0]);
    v14 = objc_alloc_init(CDPDAuthProxyImpl);
    v15 = [[CDPDPCSController alloc] initWithContext:v11 pcsProxy:v13];
    v16 = [[CDPDEDPRecoveryController alloc] initWithContext:v11 uiProvider:v9 authProvider:v14 pcsController:v15];
    [(CDPDEDPRecoveryController *)v16 validateEDPIdentitiesWithCompletion:v10];

    goto LABEL_9;
  }
  v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler validateEDPIdentitiesWithContext:uiProvider:completion:]();
  }

  if (v10)
  {
    id v11 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    v10[2](v10, 8, 0, v11);
LABEL_9:
  }
}

- (void)createEDPLivenessDictionaryWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    id v8 = [MEMORY[0x263F34350] preflightContext:v6];
    id v9 = objc_alloc_init(MEMORY[0x263F343D0]);
    int v10 = objc_alloc_init(CDPDAuthProxyImpl);
    id v11 = [[CDPDPCSController alloc] initWithContext:v8 pcsProxy:v9];
    uint64_t v12 = [[CDPDEDPRecoveryController alloc] initWithContext:v8 uiProvider:0 authProvider:v10 pcsController:v11];
    [(CDPDEDPRecoveryController *)v12 createEDPLivenessDictionaryWithCompletion:v7];

LABEL_7:
    goto LABEL_8;
  }
  id v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler validateEDPIdentitiesWithContext:uiProvider:completion:]();
  }

  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    v7[2](v7, 0, v8);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)repairEDPStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    id v11 = [MEMORY[0x263F34350] preflightContext:v8];
    uint64_t v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Starting EDP state repair...", buf, 2u);
    }

    id v13 = objc_alloc_init(MEMORY[0x263F343D0]);
    v14 = objc_alloc_init(CDPDAuthProxyImpl);
    v15 = [[CDPDPCSController alloc] initWithContext:v11 pcsProxy:v13];
    v16 = [[CDPDEDPRecoveryController alloc] initWithContext:v11 uiProvider:v9 authProvider:v14 pcsController:v15];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__CDPDClientHandler_repairEDPStateWithContext_uiProvider_completion___block_invoke;
    v18[3] = &unk_26432F2F0;
    id v19 = v10;
    [(CDPDEDPRecoveryController *)v16 repairEDPStateWithCompletion:v18];

    goto LABEL_9;
  }
  v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler repairEDPStateWithContext:uiProvider:completion:]();
  }

  if (v10)
  {
    id v11 = _CDPStateError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v11);
LABEL_9:
  }
}

void __69__CDPDClientHandler_repairEDPStateWithContext_uiProvider_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
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
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Finished EDP repair with: didRepair = %{BOOL}d, recoveryTokenNeeded=%{BOOL}d, repairError = %@", (uint8_t *)v10, 0x18u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v7);
  }
}

- (void)fetchEDPTokenForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    if ([(CDPDClientHandler *)self _allowStateMachineAccess]
      && [v6 edpState] == 2)
    {
      id v8 = [MEMORY[0x263F34350] preflightContext:v6];
      uint64_t v9 = objc_alloc_init(CDPDAuthProxyImpl);
      id v10 = objc_alloc_init(MEMORY[0x263F343D0]);
      __int16 v11 = [[CDPDPCSController alloc] initWithContext:v8 pcsProxy:v10];
      int v12 = [[CDPDEDPRecoveryController alloc] initWithContext:v6 uiProvider:0 authProvider:v9 pcsController:v11];
      [(CDPDEDPRecoveryController *)v12 fetchEDPRecoveryTokenWithCompletion:v7];

LABEL_10:
      goto LABEL_11;
    }
    __int16 v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler fetchEDPTokenForContext:completion:](v6);
    }
  }
  if (v7)
  {
    id v8 = _CDPStateError();
    v7[2](v7, 0, v8);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)deviceEscrowRecordRecoverableWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setEndpoint:1888483151];
  id v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432F318;
  id v9 = v8;
  id v24 = v9;
  id v10 = _Block_copy(aBlock);
  BOOL v11 = [(CDPDClientHandler *)self _allowDataRecovery];
  int v12 = _CDPLogSystem();
  __int16 v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler deviceEscrowRecordRecoverableWithContext:completion:]();
    }

    id v14 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:v6];
    uint64_t v15 = +[CDPDSecureBackupConfiguration configurationWithContext:v6];
    v16 = [v15 accountInfoFetchSetupDictionary];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_53;
    v19[3] = &unk_264330350;
    id v21 = v16;
    id v22 = v10;
    id v20 = v14;
    id v17 = v16;
    id v18 = v14;
    [(CDPDOctagonTrustProxyImpl *)v18 fetchEscrowRecords:v17 forceFetch:1 completion:v19];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:]();
  }

  if (v10)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    (*((void (**)(void *, void *))v10 + 2))(v10, v15);
LABEL_9:
  }
}

uint64_t __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_53(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      id v7 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5305);
    }
    id v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_53_cold_1();
    }

    uint64_t v22 = a1[6];
    if (v22) {
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v7);
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v25 = v5;
      BOOL v11 = 0;
      uint64_t v12 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F34368]) initWithEscrowRecord:v14];
          if ([v15 isCurrentDevice])
          {
            v16 = (void *)a1[4];
            uint64_t v17 = a1[5];
            id v27 = v11;
            id v18 = [v16 tlkRecoverabilityForEscrow:v17 record:v14 error:&v27];
            id v19 = v27;

            if (v18)
            {
              v23 = _CDPLogSystem();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "Found one escrow record for current device that is recoverable!", buf, 2u);
              }

              id v20 = 0;
              id v5 = v25;
              goto LABEL_28;
            }
            BOOL v11 = v19;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      id v5 = v25;
      if (v11)
      {
        id v20 = v11;
        id v19 = v20;
        goto LABEL_26;
      }
    }
    else
    {
    }
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = 0;
LABEL_26:
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_53_cold_2();
    }
LABEL_28:

    uint64_t v24 = a1[6];
    if (v24) {
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, v20);
    }

    id v7 = 0;
  }
}

- (void)handleCloudDataProtectionStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = a5;
  [v10 setEndpoint:3142422530];
  uint64_t v12 = _Block_copy(v11);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F2F0;
  id v13 = v12;
  id v28 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  BOOL v15 = [(CDPDClientHandler *)self _allowStateMachineAccess];
  v16 = _CDPLogSystem();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Starting state machine...", buf, 2u);
    }

    BOOL v18 = [(CDPDClientHandler *)self _shouldForceUseSecureBackupCachedPassphraseWithContext:v10 clientType:self->_clientType];
    id v19 = _CDPLogSystem();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v20) {
        -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:]();
      }
    }
    else if (v20)
    {
      -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:]();
    }

    objc_msgSend(v10, "set_useSecureBackupCachedPassphrase:", v18);
    id v21 = [MEMORY[0x263F34350] preflightContext:v10];
    uint64_t v22 = [[CDPDStateMachine alloc] initWithContext:v21 uiProvider:v9 connection:self->_connection];
    [(CDPDClientHandler *)self _startObservingConnectionStateForRepairWithStateMachine:v22 context:v21];
    if ([v10 type] == 12 || objc_msgSend(v10, "type") == 11)
    {
      v23 = _CDPLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:]((uint64_t)self, v10);
      }
    }
    else
    {
      [v10 setType:1];
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_56;
    v24[3] = &unk_2643307D8;
    v24[4] = self;
    id v25 = v14;
    [(CDPDStateMachine *)v22 handleCloudDataProtectionStateWithCompletion:v24];

    goto LABEL_20;
  }
  if (v17)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Denying access to state machine. Missing entitlement.", buf, 2u);
  }

  if (v14)
  {
    id v21 = _CDPStateError();
    (*((void (**)(void *, void, void, void *))v14 + 2))(v14, 0, 0, v21);
LABEL_20:
  }
}

uint64_t __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_56(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  [*(id *)(a1 + 32) _removeObserver];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v7 + 16))(v7, a2, a3, v8);
  }
}

- (BOOL)_shouldForceUseSecureBackupCachedPassphraseWithContext:(id)a3 clientType:(unint64_t)a4
{
  if (objc_msgSend(MEMORY[0x263F34400], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled", a3)) {
    return 0;
  }
  BOOL v7 = [(CDPDClientHandler *)self _localDeviceHasLocalSecret];
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler _shouldForceUseSecureBackupCachedPassphraseWithContext:clientType:](a4 == 2, v7, v8);
  }

  return a4 == 2 && v7;
}

- (BOOL)_localDeviceHasLocalSecret
{
  uint64_t v2 = [MEMORY[0x263F343A8] sharedInstance];
  char v3 = [v2 hasLocalSecret];

  return v3;
}

- (void)repairCloudDataProtectionStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = a5;
  [v10 setEndpoint:844041777];
  uint64_t v12 = _Block_copy(v11);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v13 = v12;
  id v24 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    BOOL v15 = [MEMORY[0x263F34350] preflightContext:v10];
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Starting state repair...", buf, 2u);
    }

    BOOL v17 = [[CDPDStateMachine alloc] initWithContext:v15 uiProvider:v9 connection:self->_connection];
    [(CDPDClientHandler *)self _startObservingConnectionStateForRepairWithStateMachine:v17 context:v15];
    if ([v15 type] == 13)
    {
      BOOL v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:]((uint64_t)self, v10);
      }
    }
    else
    {
      [v15 setType:2];
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_59;
    v20[3] = &unk_26432EDC0;
    v20[4] = self;
    id v21 = v14;
    [(CDPDStateMachine *)v17 repairCloudDataProtectionStateWithCompletion:v20];

    goto LABEL_14;
  }
  id v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler repairCloudDataProtectionStateWithContext:uiProvider:completion:]();
  }

  if (v14)
  {
    BOOL v15 = _CDPStateError();
    (*((void (**)(void *, void, void *))v14 + 2))(v14, 0, v15);
LABEL_14:
  }
}

uint64_t __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) _removeObserver];
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Finished repair with: didRepair = %d, repairError = %@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)startCircleApplicationApprovalServerWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setEndpoint:2121843186];
  id v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v9 = v8;
  id v29 = v9;
  id v10 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke_2;
  v26[3] = &unk_26432F680;
  id v11 = v10;
  id v27 = v11;
  uint64_t v12 = (void (**)(void *, void, id))_Block_copy(v26);
  BOOL v13 = [(CDPDClientHandler *)self _allowStateMachineAccess];
  uint64_t v14 = _CDPLogSystem();
  BOOL v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Starting accepting side server...", buf, 2u);
    }

    v16 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    if (v16)
    {
      [v6 augmentWithCredentialsFromContext:v16];
      BOOL v17 = [CDPDSecureChannelContext alloc];
      BOOL v18 = (void *)[objc_alloc(MEMORY[0x263F34340]) initWithContext:v6];
      id v19 = [(CDPDSecureChannelContext *)v17 initWithContext:v6 circleProxy:v18];

      id v24 = 0;
      BOOL v20 = [(CDPDSecureChannelContext *)v19 initialize:&v24];
      id v21 = v24;
      if (v20)
      {
        uint64_t v22 = [[CDPDSecureChannelController alloc] initWithContext:v19];
        [(CDPDSecureChannelController *)v22 startCircleApplicationApprovalServerWithContext:v6 completion:v12];
      }
      else
      {
        v12[2](v12, 0, v21);
      }
    }
    else
    {
      v23 = _CDPLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CDPDClientHandler startCircleApplicationApprovalServerWithContext:completion:]();
      }

      _CDPStateError();
      id v19 = (CDPDSecureChannelContext *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v19);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler startCircleApplicationApprovalServerWithContext:completion:]();
    }

    v16 = _CDPStateError();
    v12[2](v12, 0, v16);
  }
}

uint64_t __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Application server completed result %{BOOL}d and error: %@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)_startObservingConnectionStateForRepairWithStateMachine:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke;
  v14[3] = &unk_264330828;
  objc_copyWeak(&v17, &location);
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  uint64_t v12 = [v8 addObserverForName:@"CDPDConnectionInvalidatedNotification" object:connection queue:0 usingBlock:v14];
  id notificationObject = self->_notificationObject;
  self->_id notificationObject = v12;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeObserver];
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_cold_1();
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_64;
    v6[3] = &unk_264330800;
    id v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    [v5 shouldPerformRepairWithOptionForceFetch:0 completion:v6];
  }
}

void __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    if ([v5 code] == -5305 || objc_msgSend(v11, "code") == -5312)
    {
      uint64_t v6 = [MEMORY[0x263F34388] contextForConfirmExistingSecret];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F34388] contextForStateRepair];
    }
    id v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) altDSID];
    [v7 setAltDSID:v8];

    __int16 v9 = [*(id *)(a1 + 32) telemetryFlowID];
    [v7 setTelemetryFlowID:v9];

    id v10 = [*(id *)(a1 + 32) telemetryDeviceSessionID];
    [v7 setTelemetryDeviceSessionID:v10];

    [*(id *)(a1 + 40) postFollowUpWithContext:v7 completion:0];
    id v5 = v11;
  }
}

- (void)generateEscrowRecordStatusReportForContext:(id)a3 usingCache:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  __int16 v9 = (void (**)(id, void, void *))a5;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    id v10 = [[CDPDEscrowRecordController alloc] initWithContext:v8];
    [(CDPDEscrowRecordController *)v10 generateEscrowRecordStatusReportForLocalDeviceUsingCache:v6 withCompletion:v9];
  }
  else
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler generateEscrowRecordStatusReportForContext:usingCache:withCompletion:]();
    }

    if (v9)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
      v9[2](v9, 0, v12);
    }
  }
}

- (void)shouldPerformRepairForContext:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [v8 setEndpoint:546710380];
  id v10 = _Block_copy(v9);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v11 = v10;
  id v31 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  BOOL v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Checking whether repair should be performed on the CDP state...", buf, 2u);
  }

  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    uint64_t v14 = v8;
    if (v8
      || ([MEMORY[0x263F34350] contextForPrimaryAccount],
          (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = [[CDPDStateMachine alloc] initWithContext:v14 connection:self->_connection];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke_68;
      v26[3] = &unk_26432EDC0;
      id v27 = v15;
      id v28 = v12;
      id v16 = v15;
      [(CDPDStateMachine *)v16 shouldPerformRepairWithOptionForceFetch:v6 completion:v26];
    }
    else
    {
      BOOL v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      if (!v12)
      {
        uint64_t v14 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5102);
      id v16 = (CDPDStateMachine *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void, CDPDStateMachine *))v12 + 2))(v12, 0, v16);
      uint64_t v14 = 0;
    }
    goto LABEL_11;
  }
  id v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]();
  }

  uint64_t v14 = v8;
  if (v12)
  {
    _CDPStateError();
    id v16 = (CDPDStateMachine *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDStateMachine *))v12 + 2))(v12, 0, v16);
    uint64_t v14 = v8;
LABEL_11:
  }
LABEL_12:
}

uint64_t __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke_68(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "State machine status check completed shouldRepair=%{BOOL}d error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)shouldPerformAuthenticatedRepairForContext:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [v8 setEndpoint:546710380];
  id v10 = _Block_copy(v9);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v11 = v10;
  id v22 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  BOOL v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Checking whether authenticated repair should be performed on the CDP state...", buf, 2u);
  }

  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    uint64_t v14 = [[CDPDStateMachine alloc] initWithContext:v8 connection:self->_connection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke_69;
    v17[3] = &unk_26432EDC0;
    BOOL v18 = v14;
    id v19 = v12;
    id v15 = v14;
    [(CDPDStateMachine *)v15 _shouldPerformAuthenticatedRepairWithOptionForceFetch:v6 completion:v17];

LABEL_9:
    goto LABEL_10;
  }
  id v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]();
  }

  if (v12)
  {
    _CDPStateError();
    id v15 = (CDPDStateMachine *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDStateMachine *))v12 + 2))(v12, 0, v15);
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "State machine status check completed shouldRepair=%{BOOL}d error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)attemptToEscrowPreRecord:(id)a3 preRecordUUID:(id)a4 secretType:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
}

- (void)attemptToEscrowPreRecord:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 setEndpoint:3950444510];
  uint64_t v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v21 = v12;
  BOOL v13 = _Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    [v9 setType:6];
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Handing change in an attempt to escrow preRecord: %@...", buf, 0xCu);
    }

    id v15 = [[CDPDLocalSecretController alloc] initWithContext:v9];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke_71;
    v17[3] = &unk_26432EDC0;
    id v18 = v8;
    id v19 = v13;
    [(CDPDLocalSecretController *)v15 attemptToEscrowPreRecord:v18 completion:v17];

    goto LABEL_9;
  }
  id v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]();
  }

  if (v13)
  {
    _CDPStateError();
    id v15 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDLocalSecretController *))v13 + 2))(v13, 0, v15);
LABEL_9:
  }
}

uint64_t __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke_71(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "State machine finished handling preRecord %@ change with didUpdate=%{BOOL}d error=%@", (uint8_t *)&v9, 0x1Cu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 context:(id)a5 uiProvider:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [v13 setEndpoint:1996176790];
  id v16 = _Block_copy(v15);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v17 = v16;
  id v26 = v17;
  id v18 = _Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    [v13 setType:6];
    id v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "Handing change in local secret...", buf, 2u);
    }

    uint64_t v20 = [[CDPDLocalSecretController alloc] initWithContext:v13];
    [(CDPDLocalSecretController *)v20 setUiProvider:v14];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke_72;
    v22[3] = &unk_26432F680;
    id v23 = v18;
    [(CDPDLocalSecretController *)v20 localSecretChangedTo:v12 secretType:a4 completion:v22];

    goto LABEL_9;
  }
  id v21 = _CDPLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]();
  }

  if (v18)
  {
    _CDPStateError();
    uint64_t v20 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDLocalSecretController *))v18 + 2))(v18, 0, v20);
LABEL_9:
  }
}

uint64_t __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "State machine finished handling local secret change with didUpdate=%{BOOL}d error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)finishOfflineLocalSecretChangeWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEndpoint:4249179058];
  uint64_t v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v22 = v12;
  id v13 = _Block_copy(aBlock);
  BOOL v14 = [(CDPDClientHandler *)self _allowStateMachineAccess];
  id v15 = _CDPLogSystem();
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Finishing offline local secret change...", buf, 2u);
    }

    [v8 setType:3];
    id v17 = [[CDPDLocalSecretController alloc] initWithContext:v8];
    [(CDPDLocalSecretController *)v17 setUiProvider:v9];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_73;
    v18[3] = &unk_26432F680;
    id v19 = v13;
    [(CDPDLocalSecretController *)v17 finishOfflineLocalSecretChangeWithCompletion:v18];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]();
  }

  if (v13)
  {
    _CDPStateError();
    id v17 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDLocalSecretController *))v13 + 2))(v13, 0, v17);
LABEL_9:
  }
}

uint64_t __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Updated local secret after offline change", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_73_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)finishCyrusFlowAfterTermsAgreementWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEndpoint:1979543336];
  uint64_t v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v22 = v12;
  id v13 = _Block_copy(aBlock);
  BOOL v14 = [(CDPDClientHandler *)self _allowStateMachineAccess];
  id v15 = _CDPLogSystem();
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Finishing Cyrus terms flow by collecting passcode...", buf, 2u);
    }

    [v8 setType:7];
    id v17 = [[CDPDLocalSecretController alloc] initWithContext:v8];
    [(CDPDLocalSecretController *)v17 setUiProvider:v9];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_74;
    v18[3] = &unk_26432F680;
    id v19 = v13;
    [(CDPDLocalSecretController *)v17 finishOfflineLocalSecretChangeWithCompletion:v18];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]();
  }

  if (v13)
  {
    _CDPStateError();
    id v17 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, CDPDLocalSecretController *))v13 + 2))(v13, 0, v17);
LABEL_9:
  }
}

uint64_t __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Created backup after terms agreement.", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_74_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)clearFollowUpWithContext:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [0 setEndpoint:3725776297];
  uint64_t v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CDPDClientHandler_clearFollowUpWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v9 = v8;
  id v19 = v9;
  id v10 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  BOOL v11 = [(CDPDClientHandler *)self _allowFollowUps];
  id v12 = _CDPLogSystem();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to clear a follow up: %@", buf, 0xCu);
    }

    BOOL v14 = +[CDPDFollowUpController sharedInstance];
    id v17 = 0;
    uint64_t v15 = [v14 clearFollowUpWithContext:v6 error:&v17];
    id v16 = v17;

    if (!v10) {
      goto LABEL_10;
    }
LABEL_9:
    v10[2](v10, v15, v16);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler clearFollowUpWithContext:completion:]();
  }

  _CDPStateError();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0;
  if (v10) {
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __57__CDPDClientHandler_clearFollowUpWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)postFollowUpWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [0 setEndpoint:3045827236];
  uint64_t v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CDPDClientHandler_postFollowUpWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v9 = v8;
  id v25 = v9;
  id v10 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  UMUserManagerClass = (void *)UserManagementLibraryCore();
  if (UMUserManagerClass) {
    UMUserManagerClass = getUMUserManagerClass();
  }
  id v12 = [UMUserManagerClass sharedManager];
  if ([v12 isSharedIPad])
  {
    id v13 = [v6 followUpType];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F34318]];

    if (v14)
    {
      uint64_t v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[CDPDClientHandler postFollowUpWithContext:completion:]();
      }

      if (v10)
      {
        id v16 = _CDPStateError();
        v10[2](v10, 0, v16);
      }
      id v17 = 0;
      goto LABEL_20;
    }
  }
  else
  {
  }
  BOOL v18 = [(CDPDClientHandler *)self _allowFollowUps];
  id v19 = _CDPLogSystem();
  uint64_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_218640000, v20, OS_LOG_TYPE_DEFAULT, "Attempting to post a follow up: %@", buf, 0xCu);
    }

    id v21 = +[CDPDFollowUpController sharedInstance];
    id v23 = 0;
    uint64_t v22 = [v21 postFollowUpItemForContext:v6 error:&v23];
    id v17 = v23;

    if (!v10) {
      goto LABEL_20;
    }
LABEL_19:
    v10[2](v10, v22, v17);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler postFollowUpWithContext:completion:]();
  }

  _CDPStateError();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = 0;
  if (v10) {
    goto LABEL_19;
  }
LABEL_20:
}

uint64_t __56__CDPDClientHandler_postFollowUpWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)saveTermsAcceptance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [0 setEndpoint:3677280585];
  uint64_t v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CDPDClientHandler_saveTermsAcceptance_completion___block_invoke;
  aBlock[3] = &unk_26432F318;
  id v17 = v8;
  id v9 = v8;
  id v10 = (void (**)(void *, CDPDTermsInfoBackupController *))_Block_copy(aBlock);
  BOOL v11 = [(CDPDClientHandler *)self _allowDataRecovery];
  id v12 = _CDPLogSystem();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Calling out to controller to save terms.", v15, 2u);
    }

    int v14 = objc_alloc_init(CDPDTermsInfoBackupController);
    [(CDPDTermsInfoBackupController *)v14 saveTermsAcceptance:v6 completion:v10];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler saveTermsAcceptance:completion:]();
    }

    _CDPStateError();
    int v14 = (CDPDTermsInfoBackupController *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);
  }
}

uint64_t __52__CDPDClientHandler_saveTermsAcceptance_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [0 setEndpoint:819347453];
  uint64_t v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CDPDClientHandler_fetchTermsAcceptanceForAccount_completion___block_invoke;
  aBlock[3] = &unk_26432F1E0;
  id v17 = v8;
  id v9 = v8;
  id v10 = (void (**)(void *, void, CDPDTermsInfoBackupController *))_Block_copy(aBlock);
  BOOL v11 = [(CDPDClientHandler *)self _allowDataRecovery];
  id v12 = _CDPLogSystem();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Calling out to controller to fetch terms.", v15, 2u);
    }

    int v14 = objc_alloc_init(CDPDTermsInfoBackupController);
    [(CDPDTermsInfoBackupController *)v14 fetchTermsAcceptanceForAccount:v6 completion:v10];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler fetchTermsAcceptanceForAccount:completion:]();
    }

    _CDPStateError();
    int v14 = (CDPDTermsInfoBackupController *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v14);
  }
}

uint64_t __63__CDPDClientHandler_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performRecoveryWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  id v14 = a6;
  [v13 setEndpoint:2705534175];
  uint64_t v15 = _Block_copy(v14);

  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  id v29 = __83__CDPDClientHandler_performRecoveryWithContext_uiProvider_authProvider_completion___block_invoke;
  long long v30 = &unk_26432F1E0;
  id v16 = v15;
  id v31 = v16;
  id v17 = (void (**)(void *, void, CDPDRecoveryKeyController *))_Block_copy(&aBlock);
  BOOL v18 = [(CDPDClientHandler *)self _allowDataRecovery];
  id v19 = _CDPLogSystem();
  uint64_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v11;
      _os_log_impl(&dword_218640000, v20, OS_LOG_TYPE_DEFAULT, "Initiating Account Recovery with UI provider: %@", buf, 0xCu);
    }

    if (v11)
    {
      if ([v13 idmsMasterKeyRecovery])
      {
        id v21 = _CDPLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "Starting RK based Account Recovery flow", buf, 2u);
        }

        uint64_t v22 = [[CDPDRecoveryKeyController alloc] initWithContext:v13 uiProvider:v11 authProvider:v12];
        [(CDPDRecoveryKeyController *)v22 recoverDataUsingMasterKeyWithCompletion:v17];
        goto LABEL_23;
      }
      objc_msgSend(v13, "set_authProvider:", v12);
      id v23 = _CDPLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "Initiating info recovery", buf, 2u);
      }

      if ([v13 idmsRecovery])
      {
        uint64_t v22 = [(CDPDBackupErrorProviderImpl *)[CDPDBackupIDMSErrorProvider alloc] initWithContext:v13 uiProvider:v11];
        uint64_t v24 = off_26432DF88;
      }
      else
      {
        uint64_t v22 = [v13 findMyiPhoneUUID];

        if (!v22)
        {
          id v25 = 0;
          goto LABEL_22;
        }
        uint64_t v22 = objc_alloc_init(CDPDBackupErrorProviderImpl);
        uint64_t v24 = off_26432DF78;
      }
      id v25 = objc_alloc_init(*v24);
LABEL_22:
      id v26 = [[CDPDSecureBackupController alloc] initWithContext:v13 uiProvider:v11 delegate:0];
      -[CDPDClientHandler _performRecoveryWithContext:uiProvider:authProvider:errorProviuder:resultParser:secureBackUpController:completion:](self, "_performRecoveryWithContext:uiProvider:authProvider:errorProviuder:resultParser:secureBackUpController:completion:", v13, v11, v12, v22, v25, v26, v17, aBlock, v28, v29, v30);

      goto LABEL_23;
    }
    if (v17)
    {
LABEL_14:
      _CDPStateError();
      uint64_t v22 = (CDPDRecoveryKeyController *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0, v22);
LABEL_23:
    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler performRecoveryWithContext:uiProvider:authProvider:completion:]();
    }

    if (v17) {
      goto LABEL_14;
    }
  }
}

uint64_t __83__CDPDClientHandler_performRecoveryWithContext_uiProvider_authProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performRecoveryWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 errorProviuder:(id)a6 resultParser:(id)a7 secureBackUpController:(id)a8 completion:(id)a9
{
  id v14 = a9;
  uint64_t v15 = (objc_class *)MEMORY[0x263F343E0];
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init(v15);
  [v21 setContext:v20];
  uint64_t v22 = [CDPDBackupInfoRecoveryFlowController alloc];
  id v23 = (void *)[objc_alloc(MEMORY[0x263F34340]) initWithContext:v20];
  uint64_t v24 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:v20];

  id v25 = [(CDPDRecoveryFlowController *)v22 initWithContext:v21 uiProvider:v19 secureBackupController:v16 circleProxy:v23 octagonProxy:v24];
  [(CDPDBackupInfoRecoveryFlowController *)v25 setErrorProvider:v18];

  [(CDPDBackupInfoRecoveryFlowController *)v25 setResultParser:v17];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __135__CDPDClientHandler__performRecoveryWithContext_uiProvider_authProvider_errorProviuder_resultParser_secureBackUpController_completion___block_invoke;
  v27[3] = &unk_26432F1E0;
  id v28 = v14;
  id v26 = v14;
  [(CDPDBackupInfoRecoveryFlowController *)v25 beginRecoveryWithCompletion:v27];
}

void __135__CDPDClientHandler__performRecoveryWithContext_uiProvider_authProvider_errorProviuder_resultParser_secureBackUpController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "info recovery completed with error: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  [0 setEndpoint:3014816511];
  int v9 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDClientHandler_isICDPEnabledForDSID_checkWithServer_completion___block_invoke;
  aBlock[3] = &unk_26432F408;
  id v10 = v9;
  id v14 = v10;
  uint64_t v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v11)
  {
    id v12 = objc_alloc_init(CDPDAccount);
    v11[2](v11, [(CDPDAccount *)v12 isICDPEnabledForDSID:v7 checkWithServer:v6]);
  }
}

uint64_t __69__CDPDClientHandler_isICDPEnabledForDSID_checkWithServer_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hasLocalSecretWithCompletion:(id)a3
{
  id v3 = a3;
  [0 setEndpoint:540884795];
  uint64_t v4 = _Block_copy(v3);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CDPDClientHandler_hasLocalSecretWithCompletion___block_invoke;
  aBlock[3] = &unk_26432F408;
  id v5 = v4;
  id v9 = v5;
  BOOL v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v6)
  {
    id v7 = [MEMORY[0x263F343A8] sharedInstance];
    v6[2](v6, [v7 hasLocalSecret]);
  }
}

uint64_t __50__CDPDClientHandler_hasLocalSecretWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)isUserVisibleKeychainSyncEnabledWithCompletion:(id)a3
{
  id v3 = a3;
  [0 setEndpoint:3358439441];
  uint64_t v4 = _Block_copy(v3);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CDPDClientHandler_isUserVisibleKeychainSyncEnabledWithCompletion___block_invoke;
  aBlock[3] = &unk_26432F408;
  id v5 = v4;
  id v9 = v5;
  BOOL v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v6)
  {
    id v7 = +[CDPDKeychainSync keyChainSync];
    v6[2](v6, [v7 isUserVisibleKeychainSyncEnabled]);
  }
}

uint64_t __68__CDPDClientHandler_isUserVisibleKeychainSyncEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  [0 setEndpoint:581976373];
  BOOL v6 = _Block_copy(v5);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v14 = v6;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  id v9 = +[CDPDKeychainSync keyChainSync];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2;
  v11[3] = &unk_26432F680;
  id v12 = v8;
  id v10 = v8;
  [v9 setUserVisibleKeychainSyncEnabled:v4 withCompletion:v11];
}

uint64_t __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeNonViewAwarePeersFromCircleWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setEndpoint:3866505848];
  id v7 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v17 = v7;
  id v8 = v7;
  id v9 = _Block_copy(aBlock);
  id v10 = (void *)[objc_alloc(MEMORY[0x263F34340]) initWithContext:v5];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F343E8]) initWithContext:v5];
  id v12 = +[CDPDKeychainSync keyChainSyncWithProxy:v10 sosCircleProxy:v11 context:v5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_2;
  v14[3] = &unk_26432F680;
  id v15 = v9;
  id v13 = v9;
  [v12 removeNonViewAwarePeersFromCircleWithCompletion:v14];
}

uint64_t __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)synchronizeUserVisibleKeychainSyncEligibilityForContext:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (v9)
  {
    id v5 = a4;
    id v6 = [[CDPDKeychainSync alloc] initWithContext:v9];
    [(CDPDKeychainSync *)v6 updateKeychainSyncStateIfNeededWithCompletion:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    id v8 = a4;
    objc_msgSend(v7, "cdp_errorWithCode:", -5003);
    id v6 = (CDPDKeychainSync *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDKeychainSync *))a4 + 2))(v8, 0, v6);
  }
}

- (void)isOTEnabledForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    id v8 = objc_opt_new();
    id v9 = v8;
    if (v7) {
      v7[2](v7, [v8 isOTEnabledForContext:v6], 0);
    }
    goto LABEL_8;
  }
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler isOTEnabledForContext:completion:]();
  }

  if (v7)
  {
    id v9 = _CDPStateError();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v9);
LABEL_8:
  }
}

- (void)cliqueStatusForContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    if (v7)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F34340]) initWithContext:v7];
      id v14 = 0;
      uint64_t v10 = [v9 cliqueStatus:&v14];
      id v11 = v14;
      if (v8) {
        v8[2](v8, v10, v11);
      }

      goto LABEL_14;
    }
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler cliqueStatusForContext:completion:](a2, v13);
    }

    if (v8)
    {
LABEL_13:
      id v9 = _CDPStateError();
      v8[2](v8, -1, v9);
LABEL_14:
    }
  }
  else
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler cliqueStatusForContext:completion:](a2, v12);
    }

    if (v8) {
      goto LABEL_13;
    }
  }
}

- (void)circleStatusForContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    if (v7)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F343E8]) initWithContext:v7];
      id v14 = 0;
      uint64_t v10 = [v9 cachedSOSCircleStatus:&v14];
      id v11 = v14;
      if (v8) {
        v8[2](v8, v10, v11);
      }

      goto LABEL_14;
    }
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler cliqueStatusForContext:completion:](a2, v13);
    }

    if (v8)
    {
LABEL_13:
      id v9 = _CDPStateError();
      v8[2](v8, 0xFFFFFFFFLL, v9);
LABEL_14:
    }
  }
  else
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler cliqueStatusForContext:completion:](a2, v12);
    }

    if (v8) {
      goto LABEL_13;
    }
  }
}

- (void)setKeyChainSyncCompatibilityState:(unint64_t)a3 withAltDSID:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    if ([MEMORY[0x263F34400] deferSOSFromSignIn])
    {
      if ((v4 & 3) == 1)
      {
        id v7 = _CDPLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:]();
        }
      }
      id v8 = [MEMORY[0x263F34350] contextForAccountWithAltDSID:v6];
      [(CDPDClientHandler *)self _updateSOSCompatibilityMode:(v4 & 3) != 0 context:v8];
      if ([(CDPDClientHandler *)self _allowFollowUps])
      {
        id v9 = [MEMORY[0x263F34388] contextForSOSCompatibilityMode];
        [v9 setAltDSID:v6];
        id v10 = objc_alloc_init(MEMORY[0x263F34390]);
        id v11 = v10;
        if (v4) {
          [v10 postFollowUpWithContext:v9 error:0];
        }
        else {
          [v10 clearFollowUpWithContext:v9 error:0];
        }
      }
      else
      {
        id v9 = _CDPLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:](self, v9);
        }
      }
    }
    else
    {
      id v8 = _CDPLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:]();
      }
    }
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:].cold.4();
    }
  }
}

- (void)_updateSOSCompatibilityMode:(BOOL)a3 context:(id)a4
{
  id v8 = 0;
  +[CDPCompatibilityModeUpdater setSOSCompatibilityMode:a3 context:a4 error:&v8];
  id v4 = v8;
  id v5 = _CDPLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler _updateSOSCompatibilityMode:context:]();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Successfully set SOSCCSetCompatibilityMode", v7, 2u);
  }
}

- (void)recoverAndSynchronizeSquirrelWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEndpoint:4233277675];
  id v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__CDPDClientHandler_recoverAndSynchronizeSquirrelWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v19 = v12;
  id v13 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    id v14 = [CDPDRecoveryKeyController alloc];
    id v15 = [MEMORY[0x263F34350] preflightContext:v8];
    id v16 = [(CDPDRecoveryKeyController *)v14 initWithContext:v15 uiProvider:v9];
    [(CDPDRecoveryKeyController *)v16 recoverAndSynchronizeStateWithServer:v13];

LABEL_7:
    goto LABEL_8;
  }
  id v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:]();
  }

  if (v13)
  {
    id v15 = _CDPStateError();
    v13[2](v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __84__CDPDClientHandler_recoverAndSynchronizeSquirrelWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recoverSquirrelWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEndpoint:2013313151];
  id v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CDPDClientHandler_recoverSquirrelWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v19 = v12;
  id v13 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    id v14 = [CDPDRecoveryKeyController alloc];
    id v15 = [MEMORY[0x263F34350] preflightContext:v8];
    id v16 = [(CDPDRecoveryKeyController *)v14 initWithContext:v15 uiProvider:v9];
    [(CDPDRecoveryKeyController *)v16 recoverAndSynchronizeStateWithServer:v13];

LABEL_7:
    goto LABEL_8;
  }
  id v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:]();
  }

  if (v13)
  {
    id v15 = _CDPStateError();
    v13[2](v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __70__CDPDClientHandler_recoverSquirrelWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)isRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  [0 setEndpoint:266770439];
  id v5 = _Block_copy(v4);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CDPDClientHandler_isRecoveryKeyAvailableWithCompletion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v6 = v5;
  id v15 = v6;
  id v7 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    id v8 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    id v9 = [[CDPDRecoveryKeyController alloc] initWithContext:v8];
    id v13 = 0;
    uint64_t v10 = [(CDPDRecoveryKeyController *)v9 isRecoveryKeyAvailableWithError:&v13];
    id v11 = v13;
    if (v7) {
      v7[2](v7, v10, v11);
    }

    goto LABEL_9;
  }
  id v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:]();
  }

  if (v7)
  {
    id v8 = _CDPStateError();
    v7[2](v7, 0, v8);
LABEL_9:
  }
}

uint64_t __58__CDPDClientHandler_isRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)isWalrusRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  [0 setEndpoint:266770439];
  id v5 = _Block_copy(v4);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CDPDClientHandler_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v6 = v5;
  id v15 = v6;
  id v7 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    id v8 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    id v9 = [[CDPDRecoveryKeyController alloc] initWithContext:v8];
    id v13 = 0;
    uint64_t v10 = [(CDPDRecoveryKeyController *)v9 isWalrusRecoveryKeyAvailableWithError:&v13];
    id v11 = v13;
    if (v7) {
      v7[2](v7, v10, v11);
    }

    goto LABEL_9;
  }
  id v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:]();
  }

  if (v7)
  {
    id v8 = _CDPStateError();
    v7[2](v7, 0, v8);
LABEL_9:
  }
}

uint64_t __64__CDPDClientHandler_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  BOOL v19 = [(CDPDClientHandler *)self _allowRecoveryKey];
  id v20 = _CDPLogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[CDPDClientHandler authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:]();
    }

    [v8 setType:4];
    id v29 = [CDPDRecoveryKeyController alloc];
    long long v30 = [MEMORY[0x263F34350] preflightContext:v8];
    id v31 = [(CDPDRecoveryKeyController *)v29 initWithContext:v30 uiProvider:v9];
    [(CDPDRecoveryKeyController *)v31 authenticateAndGenerateNewRecoveryKeyWithCompletion:v10];

    goto LABEL_11;
  }
  if (v21) {
    -[CDPDClientHandler authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:](v20, v22, v23, v24, v25, v26, v27, v28);
  }

  if (v10)
  {
    long long v30 = _CDPStateError();
    v10[2](v10, 0, v30);
LABEL_11:
  }
}

- (void)generateNewRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEndpoint:3301729261];
  id v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDPDClientHandler_generateNewRecoveryKeyWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v19 = v12;
  uint64_t v13 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    [v8 setType:4];
    uint64_t v14 = [CDPDRecoveryKeyController alloc];
    uint64_t v15 = [MEMORY[0x263F34350] preflightContext:v8];
    uint64_t v16 = [(CDPDRecoveryKeyController *)v14 initWithContext:v15 uiProvider:v9];
    [(CDPDRecoveryKeyController *)v16 generateNewRecoveryKey:v13];

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:]();
  }

  if (v13)
  {
    uint64_t v15 = _CDPStateError();
    v13[2](v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __77__CDPDClientHandler_generateNewRecoveryKeyWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)verifyRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEndpoint:1660048000];
  id v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CDPDClientHandler_verifyRecoveryKeyWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v12 = v11;
  id v17 = v12;
  uint64_t v13 = (void (**)(void *, void, CDPDRecoveryKeyController *))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    uint64_t v14 = [[CDPDRecoveryKeyController alloc] initWithContext:v8 uiProvider:v9];
    [(CDPDRecoveryKeyController *)v14 verifyRecoveryKey:v13];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler verifyRecoveryKeyWithContext:uiProvider:completion:]();
  }

  if (v13)
  {
    _CDPStateError();
    uint64_t v14 = (CDPDRecoveryKeyController *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v14);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __72__CDPDClientHandler_verifyRecoveryKeyWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  BOOL v19 = [(CDPDClientHandler *)self _allowRecoveryKey];
  id v20 = _CDPLogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[CDPDClientHandler authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:]();
    }

    [v8 setType:4];
    id v29 = [CDPDRecoveryKeyController alloc];
    long long v30 = [MEMORY[0x263F34350] preflightContext:v8];
    id v31 = [(CDPDRecoveryKeyController *)v29 initWithContext:v30 uiProvider:v9];
    [(CDPDRecoveryKeyController *)v31 authenticateAndDeleteRecoveryKeyWithCompletion:v10];

    goto LABEL_11;
  }
  if (v21) {
    -[CDPDClientHandler authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:](v20, v22, v23, v24, v25, v26, v27, v28);
  }

  if (v10)
  {
    long long v30 = _CDPStateError();
    v10[2](v10, 0, v30);
LABEL_11:
  }
}

- (void)deleteRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = a5;
  [v10 setEndpoint:1512741306];
  uint64_t v12 = _Block_copy(v11);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v13 = v12;
  id v24 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    uint64_t v15 = [CDPDRecoveryKeyController alloc];
    uint64_t v16 = [MEMORY[0x263F34350] preflightContext:v10];
    uint64_t v17 = [(CDPDRecoveryKeyController *)v15 initWithContext:v16 uiProvider:v9];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2;
    v20[3] = &unk_264330438;
    id v22 = v14;
    v20[4] = self;
    id v21 = v10;
    [(CDPDRecoveryKeyController *)v17 deleteRecoveryKeyWithCompletion:v20];

    uint64_t v18 = v22;
LABEL_7:

    goto LABEL_8;
  }
  BOOL v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:]();
  }

  if (v14)
  {
    uint64_t v18 = _CDPStateError();
    (*((void (**)(void *, void, void *))v14 + 2))(v14, 0, v18);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_2();
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_14:
      v8();
    }
  }
  else if ([*(id *)(a1 + 32) _allowFollowUps])
  {
    id v9 = [MEMORY[0x263F34388] contextForRecoveryKeyMismatchHealing];
    id v10 = [*(id *)(a1 + 40) altDSID];
    [v9 setAltDSID:v10];

    id v11 = objc_alloc_init(MEMORY[0x263F34390]);
    [v11 clearFollowUpWithContext:v9 error:0];
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, a2, 0);
    }
  }
  else
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_1((id *)(a1 + 32), v13);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      id v8 = *(void (**)(void))(v14 + 16);
      goto LABEL_14;
    }
  }
}

- (void)generateRandomRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setEndpoint:4019745616];
  id v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDClientHandler_generateRandomRecoveryKeyWithContext_completion___block_invoke;
  aBlock[3] = &unk_264330850;
  id v9 = v8;
  id v16 = v9;
  id v10 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if ([(CDPDClientHandler *)self _allowRecoveryKey])
  {
    [v6 setType:4];
    id v11 = [CDPDRecoveryKeyController alloc];
    uint64_t v12 = [MEMORY[0x263F34350] preflightContext:v6];
    id v13 = [(CDPDRecoveryKeyController *)v11 initWithContext:v12];
    [(CDPDRecoveryKeyController *)v13 generateRandomRecoveryKey:v10];

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:]();
  }

  if (v10)
  {
    uint64_t v12 = _CDPStateError();
    v10[2](v10, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __69__CDPDClientHandler_generateRandomRecoveryKeyWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, id))a4;
  if (!v5)
  {
    id v5 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  }
  id v7 = objc_alloc_init(MEMORY[0x263F34360]);
  id v10 = 0;
  uint64_t v8 = [v7 verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:v5 error:&v10];
  id v9 = v10;
  if (v6) {
    v6[2](v6, v8, v9);
  }
}

- (void)combinedWalrusStatusWithContext:(id)a3 completion:(id)a4
{
}

- (void)repairWalrusWithCompletion:(id)a3
{
}

- (void)broadcastWalrusStateChange
{
}

- (void)updateWalrusStatus:(unint64_t)a3 authenticatedContext:(id)a4 completion:(id)a5
{
}

- (void)webAccessStatusWithCompletion:(id)a3
{
  id v4 = a3;
  [0 setEndpoint:1504201822];
  id v5 = _Block_copy(v4);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CDPDClientHandler_webAccessStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_26432FA40;
  id v9 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);
  [(CDPWalrusDaemonService *)self->_walrusDaemonService webAccessStatusWithCompletion:v7];
}

uint64_t __51__CDPDClientHandler_webAccessStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [0 setEndpoint:2557521267];
  id v7 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CDPDClientHandler_updateWebAccessStatus_completion___block_invoke;
  aBlock[3] = &unk_26432F318;
  id v11 = v7;
  id v8 = v7;
  id v9 = _Block_copy(aBlock);
  [(CDPWalrusDaemonService *)self->_walrusDaemonService updateWebAccessStatus:a3 completion:v9];
}

uint64_t __54__CDPDClientHandler_updateWebAccessStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pcsKeysForServices:(id)a3 completion:(id)a4
{
}

- (void)shouldPerformSilentEscrowRecordRepairWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    [v8 setType:10];
    id v10 = [[CDPDEscrowRecordController alloc] initWithContext:v8];
    [(CDPDEscrowRecordController *)v10 shouldPerformSilentEscrowRecordRepairUsingCache:v6 completion:v9];
  }
  else
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler shouldPerformSilentEscrowRecordRepairWithContext:usingCache:completion:]();
    }

    if (v9)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
      v9[2](v9, 0, v12);
    }
  }
}

- (void)startSilentEscrowRecordRepairWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    if (v7) {
      v7[2](v7, 1, 0);
    }
    [v6 setType:10];
    id v8 = [[CDPDEscrowRecordController alloc] initWithContext:v6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__CDPDClientHandler_startSilentEscrowRecordRepairWithContext_completion___block_invoke;
    v11[3] = &unk_26432ECF8;
    uint64_t v12 = v8;
    id v9 = v8;
    [(CDPDEscrowRecordController *)v9 performSilentEscrowRecordRepairWithCompletion:v11];

    goto LABEL_9;
  }
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler startSilentEscrowRecordRepairWithContext:completion:]();
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    id v9 = (CDPDEscrowRecordController *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, CDPDEscrowRecordController *))v7)[2](v7, 0, v9);
LABEL_9:
  }
}

void __73__CDPDClientHandler_startSilentEscrowRecordRepairWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      id v7 = "Successfully performed silent escrow record repair in background!";
      id v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138412290;
    id v11 = v4;
    id v7 = "Failed to perform silent escrow record repair in background with error: %@";
    id v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)performSilentEscrowRecordRepairWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    [v6 setType:10];
    id v8 = [[CDPDEscrowRecordController alloc] initWithContext:v6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__CDPDClientHandler_performSilentEscrowRecordRepairWithContext_completion___block_invoke;
    v11[3] = &unk_26432EDC0;
    uint64_t v12 = v8;
    id v13 = v7;
    uint32_t v9 = v8;
    [(CDPDEscrowRecordController *)v9 performSilentEscrowRecordRepairWithCompletion:v11];

LABEL_7:
    goto LABEL_8;
  }
  int v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler performSilentEscrowRecordRepairWithContext:completion:]();
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    uint32_t v9 = (CDPDEscrowRecordController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDEscrowRecordController *))v7 + 2))(v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __75__CDPDClientHandler_performSilentEscrowRecordRepairWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v7) {
      goto LABEL_7;
    }
    LOWORD(v12) = 0;
    id v8 = "Successfully performed silent escrow record repair!";
    uint32_t v9 = v6;
    uint32_t v10 = 2;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    int v12 = 138412290;
    id v13 = v5;
    id v8 = "Failed to perform silent escrow record repair with error: %@";
    uint32_t v9 = v6;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
LABEL_7:

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint32_t v10 = (void (**)(id, uint64_t, id))a5;
  if ([(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    [v9 setType:10];
    uint64_t v11 = [[CDPDEscrowRecordController alloc] initWithContext:v9];
    id v17 = 0;
    uint64_t v12 = [(CDPDEscrowRecordController *)v11 updateLastSilentEscrowRecordRepairAttemptDate:v8 error:&v17];
    id v13 = v17;
    uint64_t v14 = _CDPLogSystem();
    uint64_t v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated last silent escrow record repair attempt date (%@)", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CDPDClientHandler updateLastSilentEscrowRecordRepairAttemptDate:context:completion:]();
    }

    if (v10) {
      v10[2](v10, v12, v13);
    }

    goto LABEL_14;
  }
  id v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CDPDClientHandler updateLastSilentEscrowRecordRepairAttemptDate:context:completion:]();
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5302);
    uint64_t v11 = (CDPDEscrowRecordController *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
LABEL_14:
  }
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if ([(CDPDClientHandler *)self _allowDataRecovery]
    || [(CDPDClientHandler *)self _allowStateMachineAccess])
  {
    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass) {
      UMUserManagerClass = getUMUserManagerClass();
    }
    id v6 = [UMUserManagerClass sharedManager];
    int v7 = [v6 isSharedIPad];

    if (v7)
    {
      id v8 = _CDPLogSystemAnalytics();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CDPDClientHandler sendEvent:]();
      }
    }
    else
    {
      id v8 = +[CDPDAnalyticsTransport transportForEvent:v4];
      [v8 sendEvent:v4];
    }
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPDClientHandler sendEvent:]();
    }
  }
}

- (BOOL)_allowFollowUps
{
  return (LOBYTE(self->_entitlements) >> 4) & 1;
}

- (BOOL)_allowDataRecovery
{
  return (LOBYTE(self->_entitlements) >> 3) & 1;
}

- (BOOL)_allowRecoveryKey
{
  return (LOBYTE(self->_entitlements) >> 5) & 1;
}

- (BOOL)_allowStateMachineAccess
{
  return (LOBYTE(self->_entitlements) >> 1) & 1;
}

- (BOOL)_allowUtilityAccess
{
  return (LOBYTE(self->_entitlements) >> 2) & 1;
}

- (void)fetchEscrowRecordDevicesWithContext:usingCache:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Fetching escrow record devices...", v2, v3, v4, v5, v6);
}

- (void)fetchEscrowRecordDevicesWithContext:usingCache:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access to data recovery, missing entitlements.", v2, v3, v4, v5, v6);
}

- (void)validateEDPIdentitiesWithContext:uiProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Checking EDP health...", v2, v3, v4, v5, v6);
}

- (void)validateEDPIdentitiesWithContext:uiProvider:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access to EDP state information, missing entitlements.", v2, v3, v4, v5, v6);
}

- (void)repairEDPStateWithContext:uiProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "repairEDPStateWithContext: Denying access to EDP state repair. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)fetchEDPTokenForContext:(void *)a1 completion:.cold.1(void *a1)
{
  [a1 edpState];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "%s: Denying access to fetch EDP token. Eligible: %ld", v3, v4, v5, v6, 2u);
}

- (void)deviceEscrowRecordRecoverableWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Checking current device's escrow record for recoverability...", v2, v3, v4, v5, v6);
}

void __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to fetch escrow records with error: %{public}@", v2, v3, v4, v5, v6);
}

void __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_53_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to find any escrow record for this device that is recoverable: %@", v2, v3, v4, v5, v6);
}

- (void)handleCloudDataProtectionStateWithContext:(uint64_t)a1 uiProvider:(void *)a2 completion:.cold.1(uint64_t a1, void *a2)
{
  [a2 type];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v2, v3, "%@: Do not override CDPContextType=%ld", v4, v5, v6, v7, 2u);
}

- (void)handleCloudDataProtectionStateWithContext:uiProvider:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Forcing _useSecureBackupCachedPassphrase=YES", v2, v3, v4, v5, v6);
}

- (void)handleCloudDataProtectionStateWithContext:uiProvider:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Setting _useSecureBackupCachedPassphrase=NO", v2, v3, v4, v5, v6);
}

- (void)_shouldForceUseSecureBackupCachedPassphraseWithContext:(os_log_t)log clientType:.cold.1(char a1, char a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "_shouldForceUseSecureBackupCachedPassphrase: clientTypeIsBuddy=%{BOOL}d, hasSecret=%{BOOL}d", (uint8_t *)v3, 0xEu);
}

- (void)repairCloudDataProtectionStateWithContext:uiProvider:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "repairCloudDataProtection: Denying access to state repair. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)startCircleApplicationApprovalServerWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Approving TTSU attempted without primary iCloud account, failing...", v2, v3, v4, v5, v6);
}

- (void)startCircleApplicationApprovalServerWithContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to state repair. Missing entitlement.", v2, v3, v4, v5, v6);
}

void __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "CDP flow interrupted", v2, v3, v4, v5, v6);
}

- (void)generateEscrowRecordStatusReportForContext:usingCache:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access to escrow record status (missing entitlements).", v2, v3, v4, v5, v6);
}

- (void)shouldPerformRepairForContext:(uint64_t)a3 forceFetch:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)shouldPerformRepairForContext:forceFetch:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to state machine. Missing entitlements", v2, v3, v4, v5, v6);
}

void __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_73_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to update local secret after offline change: %@", v2, v3, v4, v5, v6);
}

void __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to create delayed backup: %@", v2, v3, v4, v5, v6);
}

- (void)clearFollowUpWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to cleraing follow ups. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)postFollowUpWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "Shared iPads don't have iCK, please investigate why repair CDP CFU was issued!", v1, 2u);
}

- (void)postFollowUpWithContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to posting follow ups. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)saveTermsAcceptance:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Client is not permitted to save terms.", v2, v3, v4, v5, v6);
}

- (void)fetchTermsAcceptanceForAccount:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Client is not permitted to fetch terms.", v2, v3, v4, v5, v6);
}

- (void)performRecoveryWithContext:uiProvider:authProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to back up data. Missing entitlements", v2, v3, v4, v5, v6);
}

- (void)isOTEnabledForContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to check OT status operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)cliqueStatusForContext:(const char *)a1 completion:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sel_getName(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2(&dword_218640000, a2, v3, "%s: Did not recieve a context, failing!", v4);
}

- (void)cliqueStatusForContext:(const char *)a1 completion:(NSObject *)a2 .cold.2(const char *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sel_getName(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2(&dword_218640000, a2, v3, "%s: Missing entitlement, failing!", v4);
}

- (void)setKeyChainSyncCompatibilityState:(void *)a1 withAltDSID:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109376;
  v4[1] = [a1 _allowFollowUps];
  __int16 v5 = 1024;
  int v6 = [a1 _allowUtilityAccess];
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Denying access to followUps: %d, utilities: %d. Missing entitlement.", (uint8_t *)v4, 0xEu);
}

- (void)setKeyChainSyncCompatibilityState:withAltDSID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "SOS Compatibility: Invalid state. We can't have CDPSOSCompatibilityTypeOptInNeeded but not CDPSOSCompatibilityTypeSOSNeeded.", v1, 2u);
}

- (void)setKeyChainSyncCompatibilityState:withAltDSID:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "DeferSOSFromSignIn feature flag not enabled", v2, v3, v4, v5, v6);
}

- (void)setKeyChainSyncCompatibilityState:withAltDSID:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to check setKeyChainSyncCompatibilityState status operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)_updateSOSCompatibilityMode:context:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to update SOSCCSetCompatibilityMode with error: %@", v2, v3, v4, v5, v6);
}

- (void)recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access to recovery key operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)isRecoveryKeyAvailableWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying access recovery key operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Recovery key is allowed. Calling authenticateAndGenerateNewRecoveryKeyWithCompletion on CDPDRecoveryKeyController", v2, v3, v4, v5, v6);
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyRecoveryKeyWithContext:uiProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Denying verify recovery key operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Recovery key is allowed. Calling authenticateAndDeleteRecoveryKeyWithCompletion on CDPDRecoveryKeyController", v2, v3, v4, v5, v6);
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = [*a1 _allowFollowUps];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Denying access to followUps: %d. Missing entitlement.", (uint8_t *)v4, 8u);
}

void __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Error deleting Recovery Key: %@", v2, v3, v4, v5, v6);
}

- (void)shouldPerformSilentEscrowRecordRepairWithContext:usingCache:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access (missing entitlement).", v2, v3, v4, v5, v6);
}

- (void)startSilentEscrowRecordRepairWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access to start repairing escrow record (missing entitlement).", v2, v3, v4, v5, v6);
}

- (void)performSilentEscrowRecordRepairWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access to perform escrow record repair (missing entitlement).", v2, v3, v4, v5, v6);
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:context:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_218640000, v1, OS_LOG_TYPE_ERROR, "Failed to update last silent escrow record repair attempt date (%@) with error: %@", v2, 0x16u);
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:context:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying access to update last silent escrow record repair attempt date (missing entitlement).", v2, v3, v4, v5, v6);
}

- (void)sendEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Dropping event (On Shared iPad), not supported: %@", v2, v3, v4, v5, v6);
}

- (void)sendEvent:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Telemetry Event submission reported without entitlements!", v2, v3, v4, v5, v6);
}

@end
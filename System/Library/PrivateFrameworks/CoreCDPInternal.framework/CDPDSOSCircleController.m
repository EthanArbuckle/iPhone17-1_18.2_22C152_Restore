@interface CDPDSOSCircleController
- (BOOL)synchronizeCircleViews;
- (CDPDCircleDelegate)delegate;
- (CDPDCircleProxy)circleProxy;
- (CDPDSOSCircleController)initWithUiProvider:(id)a3 delegate:(id)a4 circleProxy:(id)a5 octagonTrustProxy:(id)a6;
- (CDPStateUIProviderInternal)uiProvider;
- (id)_peerDeviceNamesByPeerID;
- (id)peerID;
- (int)circleSyncingStatus;
- (int64_t)cliqueStatus;
- (unint64_t)_peerCount;
- (unint64_t)circleStatus;
- (void)_joinCircleIgnoringBackups:(BOOL)a3 completion:(id)a4;
- (void)_requestCircleJoinWithObserver:(id)a3 requestBlock:(id)a4 completion:(id)a5;
- (void)_requestToJoinAfterRestoreAndWaitForSuccessWithHandler:(id)a3;
- (void)_requestToJoinAndWaitForSuccessWithHandler:(id)a3;
- (void)_requestToJoinWithObserver:(id)a3 completion:(id)a4;
- (void)_requestToJoinWithRequestBlock:(id)a3 completion:(id)a4;
- (void)applyToJoinCircleWithJoinHandler:(id)a3;
- (void)cancelApplicationToJoinCircle;
- (void)dealloc;
- (void)joinCircleAfterRecoveryWithCompletion:(id)a3;
- (void)joinCircleWithCompletion:(id)a3;
- (void)prepareCircleStateForRecovery;
- (void)resetCircleIncludingCloudKitData:(BOOL)a3 cloudKitResetReasonDescription:(id)a4 withCompletion:(id)a5;
- (void)setCircleProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)useCircleInfoToUpdateNameForDevices:(id)a3;
@end

@implementation CDPDSOSCircleController

- (CDPDSOSCircleController)initWithUiProvider:(id)a3 delegate:(id)a4 circleProxy:(id)a5 octagonTrustProxy:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(CDPDSOSCircleController *)self init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uiProvider, a3);
    objc_storeWeak((id *)&v14->_delegate, v11);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.cdpd.circleRequestQueue", v15);
    requestSynchronizationQueue = v14->_requestSynchronizationQueue;
    v14->_requestSynchronizationQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v14->_circleProxy, a5);
  }

  return v14;
}

- (void)dealloc
{
  [(CDPDCircleStateObserver *)self->_circleJoinObserver stopObservingCircleStatusChange];
  v3.receiver = self;
  v3.super_class = (Class)CDPDSOSCircleController;
  [(CDPDSOSCircleController *)&v3 dealloc];
}

- (unint64_t)circleStatus
{
  return [(CDPDCircleProxy *)self->_circleProxy combinedCircleStatus:0];
}

- (int)circleSyncingStatus
{
  return [(CDPDCircleProxy *)self->_circleProxy cachedSOSCircleStatus:0];
}

- (int64_t)cliqueStatus
{
  return [(CDPDCircleProxy *)self->_circleProxy cliqueStatus:0];
}

- (id)peerID
{
  return (id)[(CDPDCircleProxy *)self->_circleProxy peerId];
}

- (BOOL)synchronizeCircleViews
{
  return [(CDPDCircleProxy *)self->_circleProxy synchronizeCircleViews];
}

- (void)prepareCircleStateForRecovery
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v2 = [(CDPDSOSCircleController *)self circleStatus];
  objc_super v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v2;
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Circle status before attempting recovery is %lu", buf, 0xCu);
  }

  if (v2 == 3)
  {
    *(void *)buf = 0;
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to reset to offering in SOS", v15, 2u);
    }

    int v5 = SOSCCResetToOffering();
    uint64_t v6 = *(void *)buf;
    v7 = _CDPLogSystem();
    v8 = v7;
    if (!v5 || v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(CDPDCircleController *)(uint64_t)buf prepareCircleStateForRecovery];
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Successfully reset SOS circle to offering", v15, 2u);
    }
  }
}

- (void)joinCircleWithCompletion:(id)a3
{
}

- (void)_joinCircleIgnoringBackups:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = _os_activity_create(&dword_218640000, "cdp: circle join", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  unint64_t v8 = [(CDPDSOSCircleController *)self circleStatus];
  uint64_t v9 = objc_alloc_init(CDPDCircleJoinResult);
  [(CDPDCircleJoinResult *)v9 setCircleStatus:v8];
  [(CDPDCircleJoinResult *)v9 setRequiresEscrowRecordsFetch:1];
  [(CDPDCircleJoinResult *)v9 setRequiresInitialSync:1];
  if (v8 == 1)
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSOSCircleController _joinCircleIgnoringBackups:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    [(CDPDCircleJoinResult *)v9 setDidJoin:1];
    goto LABEL_5;
  }
  if ([(CDPDSOSCircleController *)self _peerCount])
  {
    v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Circle has peers for remote approval", buf, 2u);
    }

    [(CDPDCircleJoinResult *)v9 setHasPeersForRemoteApproval:1];
  }
  else
  {
    v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "Circle does NOT have peers for remote approval", buf, 2u);
    }
  }
  if (v8 == 2 || v8 == 4)
  {
    v20 = _CDPLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v20, OS_LOG_TYPE_DEFAULT, "Falling back to recovery based circle flows...", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke;
    v23[3] = &unk_264330768;
    id v26 = v6;
    BOOL v28 = a3;
    unint64_t v27 = v8;
    v24 = v9;
    v25 = self;
    [WeakRetained circleController:self secureBackupRecordsArePresentWithCompletion:v23];

    v22 = v26;
    goto LABEL_21;
  }
  if (v8 != 3)
  {
    v22 = _CDPStateError();
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v22);
LABEL_21:

    goto LABEL_22;
  }
  [(CDPDCircleJoinResult *)v9 setNeedsBackupRecovery:1];
LABEL_5:
  (*((void (**)(id, CDPDCircleJoinResult *, void))v6 + 2))(v6, v9, 0);
LABEL_22:

  os_activity_scope_leave(&state);
}

void __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) setHasPeersWithCDPBackupRecords:a3];
  if (((a2 & 1) != 0 || a3) && !*(unsigned char *)(a1 + 64) || *(void *)(a1 + 56) == 1)
  {
    [*(id *)(a1 + 32) setNeedsBackupRecovery:1];
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v15();
    goto LABEL_11;
  }
  uint64_t v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Circle status is CDPSyncingStatusAbsent and backups are NOT present... Trying to create and join the circle", buf, 2u);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_17;
  v18[3] = &unk_26432ED48;
  uint64_t v17 = *(void **)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  [v17 _requestToJoinAndWaitForSuccessWithHandler:v18];

LABEL_11:
}

uint64_t __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [*(id *)(a1 + 32) setDidJoin:a2];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (unint64_t)_peerCount
{
  return [(CDPDCircleProxy *)self->_circleProxy peerCount];
}

- (void)joinCircleAfterRecoveryWithCompletion:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, id))a3;
  circleProxy = self->_circleProxy;
  id v47 = 0;
  int v6 = [(CDPDCircleProxy *)circleProxy requestToJoinCircleAfterRestore:&v47];
  id v7 = v47;
  unint64_t v8 = _CDPLogSystem();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Circle join request succeeded after backup recovery", buf, 2u);
    }

    unint64_t v10 = [(CDPDSOSCircleController *)self circleStatus];
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v49 = v10;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Circle status after successful request to join is %lu", buf, 0xCu);
    }

    if (v10 == 3)
    {
      v29 = self->_circleProxy;
      id v43 = 0;
      [(CDPDCircleProxy *)v29 resetToOffering:&v43];
      uint64_t v15 = (CDPDCircleStateObserver *)v43;
      if (v4) {
        v4[2](v4, 0, v15);
      }
      goto LABEL_38;
    }
    if (v10 != 1)
    {
      v30 = objc_alloc_init(CDPDCircleStateObserver);
      v31 = self->_circleProxy;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke;
      v38[3] = &unk_264330790;
      v39 = v30;
      v40 = self;
      v41 = v4;
      unint64_t v42 = v10;
      uint64_t v15 = v30;
      [(CDPDCircleStateObserver *)v15 observeCircleStateWithCircleProxy:v31 changeHandler:v38];

LABEL_38:
      goto LABEL_39;
    }
    id v12 = objc_alloc(MEMORY[0x263F16D30]);
    uint64_t v13 = [(CDPDCircleProxy *)self->_circleProxy cdpContext];
    uint64_t v14 = [v13 cliqueConfiguration];
    uint64_t v15 = (CDPDCircleStateObserver *)[v12 initWithContextData:v14];

    id v46 = 0;
    LODWORD(v14) = [(CDPDCircleStateObserver *)v15 fetchUserControllableViewsSyncingEnabled:&v46];
    id v16 = v46;
    if (v14)
    {
      uint64_t v17 = self->_circleProxy;
      id v45 = 0;
      int v18 = [(CDPDCircleProxy *)v17 setUserControllableViewsSyncStatus:1 error:&v45];
      id v19 = v45;
      id v20 = _CDPLogSystem();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          v22 = "Successfully enabled SOS views";
LABEL_29:
          v36 = v20;
          uint32_t v37 = 2;
LABEL_33:
          _os_log_impl(&dword_218640000, v36, OS_LOG_TYPE_DEFAULT, v22, buf, v37);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      if (!v21) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v49 = (unint64_t)v19;
      v22 = "Failed to enable SOS views: %@";
    }
    else
    {
      id v19 = _CDPLogSystem();
      BOOL v32 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v49 = (unint64_t)v16;
          _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "Failed to fetch user controllable views from clique, error: %@", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v32)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "Octagon reports user controllable views are not enabled! disabling for SOS", buf, 2u);
      }

      v33 = self->_circleProxy;
      id v44 = 0;
      int v34 = [(CDPDCircleProxy *)v33 setUserControllableViewsSyncStatus:0 error:&v44];
      id v19 = v44;
      id v20 = _CDPLogSystem();
      BOOL v35 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          v22 = "Successfully disabled SOS views";
          goto LABEL_29;
        }
LABEL_34:

LABEL_35:
        if (v4) {
          v4[2](v4, 1, 0);
        }

        goto LABEL_38;
      }
      if (!v35) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v49 = (unint64_t)v19;
      v22 = "Failed to disable SOS views: %@";
    }
    v36 = v20;
    uint32_t v37 = 12;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CDPDSOSCircleController joinCircleAfterRecoveryWithCompletion:]((uint64_t)v7, v9, v23, v24, v25, v26, v27, v28);
  }

  if (v4) {
    v4[2](v4, 0, v7);
  }
LABEL_39:
}

void __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    id v12 = *(void **)(*(void *)(a1 + 40) + 24);
    id v15 = 0;
    [v12 resetToOffering:&v15];
    uint64_t v13 = v15;
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, void, NSObject *))(v14 + 16))(v14, 0, v13);
    }
    goto LABEL_11;
  }
  if (a2 != 1)
  {
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_1(a1, v13);
    }
LABEL_11:

    return;
  }
  objc_super v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  [*(id *)(a1 + 32) stopObservingCircleStatusChange];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, 1, 0);
  }
}

- (void)resetCircleIncludingCloudKitData:(BOOL)a3 cloudKitResetReasonDescription:(id)a4 withCompletion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    _CDPStateError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
  }
}

- (void)useCircleInfoToUpdateNameForDevices:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CDPDSOSCircleController *)self _peerDeviceNamesByPeerID];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138412546;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "recordID", v17, (void)v18);

        if (v13)
        {
          uint64_t v14 = [v12 recordID];
          id v15 = [v5 objectForKey:v14];

          if (v15)
          {
            id v16 = _CDPLogSystem();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v17;
              uint64_t v23 = v12;
              __int16 v24 = 2112;
              uint64_t v25 = v15;
              _os_log_debug_impl(&dword_218640000, v16, OS_LOG_TYPE_DEBUG, "Updating device name for %@ to '%@' based on circle info", buf, 0x16u);
            }

            [v12 setLocalizedName:v15];
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

- (id)_peerDeviceNamesByPeerID
{
  return (id)[(CDPDCircleProxy *)self->_circleProxy peerDeviceNamesByPeerID];
}

- (void)applyToJoinCircleWithJoinHandler:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(CDPDCircleStateObserver);
  circleJoinObserver = self->_circleJoinObserver;
  self->_circleJoinObserver = v4;

  [(CDPDSOSCircleController *)self _requestToJoinWithObserver:self->_circleJoinObserver completion:v6];
}

- (void)_requestToJoinWithObserver:(id)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__CDPDSOSCircleController__requestToJoinWithObserver_completion___block_invoke;
  v4[3] = &unk_26432FE90;
  v4[4] = self;
  [(CDPDSOSCircleController *)self _requestCircleJoinWithObserver:a3 requestBlock:v4 completion:a4];
}

uint64_t __65__CDPDSOSCircleController__requestToJoinWithObserver_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) requestToJoinCircle:a2];
}

- (void)_requestToJoinAndWaitForSuccessWithHandler:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__CDPDSOSCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_26432FE90;
  v3[4] = self;
  [(CDPDSOSCircleController *)self _requestToJoinWithRequestBlock:v3 completion:a3];
}

uint64_t __70__CDPDSOSCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) requestToJoinCircle:a2];
}

- (void)_requestToJoinAfterRestoreAndWaitForSuccessWithHandler:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__CDPDSOSCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_26432FE90;
  v3[4] = self;
  [(CDPDSOSCircleController *)self _requestToJoinWithRequestBlock:v3 completion:a3];
}

uint64_t __82__CDPDSOSCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) requestToJoinCircleAfterRestore:a2];
}

- (void)_requestToJoinWithRequestBlock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = objc_alloc_init(CDPDCircleStateObserver);
  [(CDPDSOSCircleController *)self _requestCircleJoinWithObserver:v8 requestBlock:v7 completion:v6];
}

- (void)_requestCircleJoinWithObserver:(id)a3 requestBlock:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (uint64_t (**)(id, id *))a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Requesting to join circle with handler", buf, 2u);
  }

  if ([(CDPDSOSCircleController *)self circleStatus] == 1)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSOSCircleController _requestCircleJoinWithObserver:requestBlock:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    *(void *)buf = 0;
    v33 = buf;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke;
    aBlock[3] = &unk_26432FEE0;
    aBlock[4] = self;
    v31 = buf;
    id v20 = v8;
    id v29 = v20;
    v30 = v10;
    long long v21 = _Block_copy(aBlock);
    circleProxy = self->_circleProxy;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_25;
    v26[3] = &unk_26432F3B8;
    id v23 = v21;
    id v27 = v23;
    [v20 observeChangeToState:1 circleProxy:circleProxy handler:v26];
    id v25 = 0;
    LOBYTE(circleProxy) = v9[2](v9, &v25);
    id v24 = v25;
    if ((circleProxy & 1) == 0) {
      (*((void (**)(id, void, id))v23 + 2))(v23, 0, v24);
    }

    _Block_object_dispose(buf, 8);
  }
}

void __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2;
  block[3] = &unk_26432FEB8;
  uint64_t v13 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_sync(v6, block);
}

uint64_t __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 56) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    [*(id *)(result + 32) stopObservingCircleStatusChange];
    int v3 = *(unsigned __int8 *)(v2 + 64);
    id v4 = _CDPLogSystem();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Successfully joined the circle", v12, 2u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    result = *(void *)(v2 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(v2 + 64), *(void *)(v2 + 40));
    }
  }
  return result;
}

uint64_t __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelApplicationToJoinCircle
{
  [(CDPDCircleStateObserver *)self->_circleJoinObserver stopObservingCircleStatusChange];
  circleJoinObserver = self->_circleJoinObserver;
  self->_circleJoinObserver = 0;
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (CDPDCircleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CDPDCircleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_requestSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_circleJoinObserver, 0);
}

- (void)_joinCircleIgnoringBackups:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)joinCircleAfterRecoveryWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Circle status is now %lu (waiting for CDPSyncingStatusIn or CDPSyncingStatusPending)", (uint8_t *)&v3, 0xCu);
}

void __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_requestCircleJoinWithObserver:(uint64_t)a3 requestBlock:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
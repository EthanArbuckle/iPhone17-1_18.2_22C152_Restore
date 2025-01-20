@interface DSAlternateDeviceAccessManager
+ (id)sharedManager;
- (BOOL)hasAlternateAccess;
- (BOOL)hasAlternateFaceID;
- (BOOL)hasAlternateTouchID;
- (BOOL)hasMultipleFaceIDs;
- (BOOL)hasMultipleTouchIDs;
- (DSAlternateDeviceAccessDelegate)delegate;
- (DSAlternateDeviceAccessManager)init;
- (DSContinuityStore)continuityStore;
- (DSWifiSyncStore)remotePairingStore;
- (LAContext)authContext;
- (NSArray)continuityDevices;
- (NSArray)pairedComputers;
- (OS_dispatch_queue)workQueue;
- (id)mirroringDevices;
- (id)syncingDevices;
- (unint64_t)fetchCompletedTime;
- (void)fetchAccessMethodsWithCompletion:(id)a3;
- (void)performFetchWithCompletion:(id)a3;
- (void)resetAllAccessMethodsWithCompletion:(id)a3;
- (void)sendSummaryAnalyticsWithReviewAction:(BOOL)a3 resetAction:(BOOL)a4 exit:(BOOL)a5;
- (void)setAuthContext:(id)a3;
- (void)setContinuityDevices:(id)a3;
- (void)setContinuityStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchCompletedTime:(unint64_t)a3;
- (void)setFetchNeeded:(BOOL)a3;
- (void)setHasMultipleFaceIDs:(BOOL)a3;
- (void)setHasMultipleTouchIDs:(BOOL)a3;
- (void)setPairedComputers:(id)a3;
- (void)setRemotePairingStore:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startPresentationWithNavigationController:(id)a3;
@end

@implementation DSAlternateDeviceAccessManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DSAlternateDeviceAccessManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager___utility;
  return v2;
}

uint64_t __47__DSAlternateDeviceAccessManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager___utility;
  sharedManager___utility = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (DSAlternateDeviceAccessManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)DSAlternateDeviceAccessManager;
  uint64_t v2 = [(DSAlternateDeviceAccessManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_providerLock._os_unfair_lock_opaque = 0;
    os_log_t v4 = os_log_create("com.apple.DigitalSeparation", "DSAlternateDeviceAccessManager");
    v5 = (void *)DSLog_10;
    DSLog_10 = (uint64_t)v4;

    dispatch_queue_t v6 = dispatch_queue_create("DeviceAssetProviderQueue", 0);
    [(DSAlternateDeviceAccessManager *)v3 setWorkQueue:v6];

    id v7 = objc_alloc_init(MEMORY[0x263F3A350]);
    [(DSAlternateDeviceAccessManager *)v3 setContinuityStore:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F3A398]);
    [(DSAlternateDeviceAccessManager *)v3 setRemotePairingStore:v8];

    [(DSAlternateDeviceAccessManager *)v3 setFetchNeeded:1];
  }
  return v3;
}

- (void)startPresentationWithNavigationController:(id)a3
{
  id v4 = a3;
  v5 = [(DSAlternateDeviceAccessManager *)self delegate];

  if (v5)
  {
    dispatch_queue_t v6 = [(DSAlternateDeviceAccessManager *)self delegate];
    [v6 tearDown];
  }
  id v7 = [[DSAlternateDeviceAccessDelegate alloc] initWithPresentingViewController:v4];

  [(DSAlternateDeviceAccessManager *)self setDelegate:v7];
  id v8 = [(DSAlternateDeviceAccessManager *)self delegate];
  [v8 startFlowWithType:2];
}

- (void)fetchAccessMethodsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  unint64_t v6 = [(DSAlternateDeviceAccessManager *)self fetchCompletedTime];
  if (v5 < v6)
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_FAULT)) {
      -[DSAlternateDeviceAccessManager fetchAccessMethodsWithCompletion:]();
    }
    unint64_t v6 = 0;
  }
  unint64_t v7 = v5 - v6;
  double v8 = (double)(v5 - v6) / 1000000000.0;
  v9 = DSLog_10;
  if (v7 > 0x6FC23ABFFLL)
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      double v17 = v8;
      _os_log_impl(&dword_235BFC000, v9, OS_LOG_TYPE_INFO, "Last fetch was %{public}fs ago", buf, 0xCu);
    }
    if (atomic_load((unsigned int *)&self->_fetchState))
    {
      v11 = DSLog_10;
      if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235BFC000, v11, OS_LOG_TYPE_INFO, "Fetching alternate device access methods", buf, 2u);
      }
      objc_initWeak((id *)buf, self);
      v12 = [(DSAlternateDeviceAccessManager *)self workQueue];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __67__DSAlternateDeviceAccessManager_fetchAccessMethodsWithCompletion___block_invoke;
      v13[3] = &unk_264C6F158;
      objc_copyWeak(&v15, (id *)buf);
      id v14 = v4;
      dispatch_async(v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      (*((void (**)(id, BOOL, void))v4 + 2))(v4, [(DSAlternateDeviceAccessManager *)self hasAlternateAccess], 0);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v17 = v8;
      _os_log_impl(&dword_235BFC000, v9, OS_LOG_TYPE_DEFAULT, "Not fetching since the last fetch was %{public}fs ago", buf, 0xCu);
    }
    atomic_store(0, (unsigned int *)&self->_fetchState);
    (*((void (**)(id, BOOL, void))v4 + 2))(v4, [(DSAlternateDeviceAccessManager *)self hasAlternateAccess], 0);
  }
}

void __67__DSAlternateDeviceAccessManager_fetchAccessMethodsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performFetchWithCompletion:*(void *)(a1 + 32)];
}

- (void)performFetchWithCompletion:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)DSLog_10);
  unint64_t v6 = (id)DSLog_10;
  unint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235BFC000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "fetch", " enableTelemetry=YES ", buf, 2u);
  }

  double v8 = [MEMORY[0x263EFF980] array];
  v9 = [(DSAlternateDeviceAccessManager *)self continuityStore];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke;
  v12[3] = &unk_264C6F268;
  id v13 = v8;
  id v14 = self;
  id v15 = v4;
  os_signpost_id_t v16 = v5;
  id v10 = v4;
  id v11 = v8;
  [v9 fetchPairedDevicesWithCompletion:v12];
}

void __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_ERROR)) {
      __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke_cold_1();
    }
    [*(id *)(a1 + 32) addObject:v6];
  }
  unint64_t v7 = [*(id *)(a1 + 40) remotePairingStore];
  double v8 = [*(id *)(a1 + 40) workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke_293;
  v14[3] = &unk_264C6F240;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(a1 + 48);
  id v15 = v9;
  uint64_t v16 = v10;
  uint64_t v12 = *(void *)(a1 + 56);
  id v17 = v5;
  uint64_t v19 = v12;
  id v18 = v11;
  id v13 = v5;
  [v7 fetchPairedDevicesOnQueue:v8 completion:v14];
}

void __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_ERROR)) {
      __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke_293_cold_1();
    }
    [*(id *)(a1 + 32) addObject:v5];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 40), "setHasMultipleFaceIDs:", +[DSBiometricManager pearlIdentityCount](DSBiometricManager, "pearlIdentityCount") > 1);
  objc_msgSend(*(id *)(a1 + 40), "setHasMultipleTouchIDs:", +[DSBiometricManager touchIDCount](DSBiometricManager, "touchIDCount") > 1);
  [*(id *)(a1 + 40) setContinuityDevices:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setPairedComputers:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  atomic_store(0, (unsigned int *)(*(void *)(a1 + 40) + 12));
  [*(id *)(a1 + 40) setFetchCompletedTime:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  unint64_t v7 = DSLog_10;
  if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v7, OS_LOG_TYPE_INFO, "Finished fetching alternate device access methods", buf, 2u);
  }
  double v8 = (id)DSLog_10;
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_235BFC000, v9, OS_SIGNPOST_INTERVAL_END, v10, "fetch", " enableTelemetry=YES ", v12, 2u);
  }

  if ([*(id *)(a1 + 32) count])
  {
    id v11 = [MEMORY[0x263F3A360] errorWithCode:11 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    id v11 = 0;
  }
  (*(void (**)(void, uint64_t, void *))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [*(id *)(a1 + 40) hasAlternateAccess], v11);
}

- (void)setFetchNeeded:(BOOL)a3
{
  int v3 = 0;
  atomic_compare_exchange_strong(&self->_fetchState, (unsigned int *)&v3, 1u);
  if (a3) {
    [(DSAlternateDeviceAccessManager *)self setFetchCompletedTime:0];
  }
}

- (void)resetAllAccessMethodsWithCompletion:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)DSLog_10);
  id v6 = (id)DSLog_10;
  unint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235BFC000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "stopAll", " enableTelemetry=YES ", buf, 2u);
  }

  double v8 = dispatch_group_create();
  if ([(DSAlternateDeviceAccessManager *)self hasAlternateFaceID])
  {
    id v9 = [DSBiometricManager alloc];
    os_signpost_id_t v10 = [(DSAlternateDeviceAccessManager *)self authContext];
    id v11 = [(DSBiometricManager *)v9 initWithContext:v10];

    [(DSBiometricManager *)v11 deleteAllPearlIdentities];
  }
  else if ([(DSAlternateDeviceAccessManager *)self hasAlternateTouchID])
  {
    +[DSBiometricManager deleteAllTouchIDs];
  }
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  id v13 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v13 recoveryPasscodeAvailable])
  {
    dispatch_group_enter(v8);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke;
    v33[3] = &unk_264C6F030;
    id v34 = v12;
    v35 = v8;
    [v13 clearRecoveryPasscodeWithCompletion:v33];
  }
  dispatch_group_enter(v8);
  id v14 = [(DSAlternateDeviceAccessManager *)self continuityStore];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_2;
  v30[3] = &unk_264C6F030;
  id v15 = v12;
  id v31 = v15;
  uint64_t v16 = v8;
  v32 = v16;
  [v14 unpairAllDevicesWithCompletion:v30];

  dispatch_group_enter(v16);
  id v17 = [(DSAlternateDeviceAccessManager *)self remotePairingStore];
  id v18 = [(DSAlternateDeviceAccessManager *)self workQueue];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_300;
  v27[3] = &unk_264C6F030;
  id v19 = v15;
  id v28 = v19;
  v29 = v16;
  v20 = v16;
  [v17 removeAllPairedDevicesOnQueue:v18 completion:v27];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_301;
  v23[3] = &unk_264C6F290;
  v23[4] = self;
  id v24 = v19;
  id v25 = v4;
  os_signpost_id_t v26 = v5;
  id v21 = v4;
  id v22 = v19;
  dispatch_group_notify(v20, MEMORY[0x263EF83A0], v23);
}

void __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  int v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_ERROR)) {
      __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_2_cold_1();
    }
    [*(id *)(a1 + 32) addObject:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_300(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_ERROR)) {
      __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_300_cold_1();
    }
    [*(id *)(a1 + 32) addObject:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_301(uint64_t a1)
{
  [*(id *)(a1 + 32) setFetchNeeded:1];
  uint64_t v2 = (id)DSLog_10;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_235BFC000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopAll", " enableTelemetry=YES ", v6, 2u);
  }

  if ([*(id *)(a1 + 40) count])
  {
    os_signpost_id_t v5 = [MEMORY[0x263F3A360] errorWithCode:12 underlyingErrors:*(void *)(a1 + 40)];
  }
  else
  {
    os_signpost_id_t v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sendSummaryAnalyticsWithReviewAction:(BOOL)a3 resetAction:(BOOL)a4 exit:(BOOL)a5
{
  if (a4)
  {
    id v6 = [(DSAlternateDeviceAccessManager *)self mirroringDevices];
    [v6 count];

    unint64_t v7 = [(DSAlternateDeviceAccessManager *)self syncingDevices];
    [v7 count];

    if (![(DSAlternateDeviceAccessManager *)self hasAlternateFaceID]) {
      [(DSAlternateDeviceAccessManager *)self hasAlternateTouchID];
    }
  }
  AnalyticsSendEventLazy();
}

id __88__DSAlternateDeviceAccessManager_sendSummaryAnalyticsWithReviewAction_resetAction_exit___block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"didReviewAccess";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v9[0] = v2;
  v8[1] = @"didResetAccess";
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v9[1] = v3;
  v8[2] = @"didGoToSafetyCheck";
  os_signpost_id_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  v9[2] = v4;
  v8[3] = @"numMethodsReset";
  os_signpost_id_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v9[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)mirroringDevices
{
  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  os_signpost_id_t v4 = [(DSAlternateDeviceAccessManager *)self continuityDevices];
  os_signpost_id_t v5 = [v4 valueForKey:@"name"];

  os_unfair_lock_unlock(p_providerLock);
  return v5;
}

- (id)syncingDevices
{
  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  os_signpost_id_t v4 = [(DSAlternateDeviceAccessManager *)self pairedComputers];
  os_signpost_id_t v5 = [v4 valueForKey:@"deviceName"];

  os_unfair_lock_unlock(p_providerLock);
  return v5;
}

- (BOOL)hasAlternateFaceID
{
  uint64_t v2 = self;
  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  LOBYTE(v2) = [(DSAlternateDeviceAccessManager *)v2 hasMultipleFaceIDs];
  os_unfair_lock_unlock(p_providerLock);
  return (char)v2;
}

- (BOOL)hasAlternateTouchID
{
  uint64_t v2 = self;
  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  LOBYTE(v2) = [(DSAlternateDeviceAccessManager *)v2 hasMultipleTouchIDs];
  os_unfair_lock_unlock(p_providerLock);
  return (char)v2;
}

- (BOOL)hasAlternateAccess
{
  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  if ([(DSAlternateDeviceAccessManager *)self hasMultipleFaceIDs]
    || [(DSAlternateDeviceAccessManager *)self hasMultipleTouchIDs])
  {
    BOOL v4 = 1;
  }
  else
  {
    os_signpost_id_t v5 = [(DSAlternateDeviceAccessManager *)self continuityDevices];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(DSAlternateDeviceAccessManager *)self pairedComputers];
      BOOL v4 = [v6 count] != 0;
    }
  }
  os_unfair_lock_unlock(p_providerLock);
  return v4;
}

- (DSContinuityStore)continuityStore
{
  return self->_continuityStore;
}

- (void)setContinuityStore:(id)a3
{
}

- (DSWifiSyncStore)remotePairingStore
{
  return self->_remotePairingStore;
}

- (void)setRemotePairingStore:(id)a3
{
}

- (DSAlternateDeviceAccessDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)continuityDevices
{
  return self->_continuityDevices;
}

- (void)setContinuityDevices:(id)a3
{
}

- (NSArray)pairedComputers
{
  return self->_pairedComputers;
}

- (void)setPairedComputers:(id)a3
{
}

- (BOOL)hasMultipleFaceIDs
{
  return self->_hasMultipleFaceIDs;
}

- (void)setHasMultipleFaceIDs:(BOOL)a3
{
  self->_hasMultipleFaceIDs = a3;
}

- (BOOL)hasMultipleTouchIDs
{
  return self->_hasMultipleTouchIDs;
}

- (void)setHasMultipleTouchIDs:(BOOL)a3
{
  self->_hasMultipleTouchIDs = a3;
}

- (unint64_t)fetchCompletedTime
{
  return self->_fetchCompletedTime;
}

- (void)setFetchCompletedTime:(unint64_t)a3
{
  self->_fetchCompletedTime = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pairedComputers, 0);
  objc_storeStrong((id *)&self->_continuityDevices, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_remotePairingStore, 0);
  objc_storeStrong((id *)&self->_continuityStore, 0);
}

- (void)fetchAccessMethodsWithCompletion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2050;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_235BFC000, v1, OS_LOG_TYPE_FAULT, "mach_continuous_time walked backwards (now: %{public}llu, then: %{public}llu)", v2, 0x16u);
}

void __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error fetching continuity devices: %@", v2, v3, v4, v5, v6);
}

void __61__DSAlternateDeviceAccessManager_performFetchWithCompletion___block_invoke_293_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error fetching remote devices: %@", v2, v3, v4, v5, v6);
}

void __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error disconnecting continuity devices: %@", v2, v3, v4, v5, v6);
}

void __70__DSAlternateDeviceAccessManager_resetAllAccessMethodsWithCompletion___block_invoke_300_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error unpairing remote devices: %@", v2, v3, v4, v5, v6);
}

@end
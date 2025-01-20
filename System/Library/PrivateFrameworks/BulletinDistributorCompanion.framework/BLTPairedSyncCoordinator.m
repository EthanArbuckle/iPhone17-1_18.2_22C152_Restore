@interface BLTPairedSyncCoordinator
+ (id)syncState;
+ (void)reportProgress:(double)a3;
+ (void)syncDidComplete;
- (BLTPairedSyncCoordinator)init;
- (BOOL)clientSyncComplete;
- (PSYInitialSyncStateObserver)pairedInitialSyncObserver;
- (PSYSyncCoordinator)pairedSyncCoordinator;
- (PSYSyncSessionObserver)pairedSyncObserver;
- (void)_initInitialSyncStateComplete;
- (void)_reportProgress:(double)a3;
- (void)_syncDidComplete;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)setClientSyncComplete:(BOOL)a3;
- (void)setPairedInitialSyncObserver:(id)a3;
- (void)setPairedSyncCoordinator:(id)a3;
- (void)setPairedSyncObserver:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4;
@end

@implementation BLTPairedSyncCoordinator

+ (id)syncState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__BLTPairedSyncCoordinator_syncState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (syncState_onceToken != -1) {
    dispatch_once(&syncState_onceToken, block);
  }
  v2 = +[BLTPairedSyncState sharedInstance];
  return v2;
}

uint64_t __37__BLTPairedSyncCoordinator_syncState__block_invoke(uint64_t a1)
{
  __sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BLTPairedSyncCoordinator)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)BLTPairedSyncCoordinator;
  v2 = [(BLTPairedSyncCoordinator *)&v15 init];
  if (v2)
  {
    v3 = +[BLTPairedSyncState sharedInstance];
    uint64_t v4 = [MEMORY[0x263F5BB20] syncCoordinatorWithServiceName:@"com.apple.pairedsync.bulletindistributor"];
    pairedSyncCoordinator = v2->_pairedSyncCoordinator;
    v2->_pairedSyncCoordinator = (PSYSyncCoordinator *)v4;

    v6 = v2->_pairedSyncCoordinator;
    v7 = BLTWorkQueue();
    [(PSYSyncCoordinator *)v6 setDelegate:v2 queue:v7];

    v8 = (PSYInitialSyncStateObserver *)objc_alloc_init(MEMORY[0x263F5BB18]);
    pairedInitialSyncObserver = v2->_pairedInitialSyncObserver;
    v2->_pairedInitialSyncObserver = v8;

    [(PSYInitialSyncStateObserver *)v2->_pairedInitialSyncObserver setDelegate:v2];
    uint64_t v10 = [(PSYSyncCoordinator *)v2->_pairedSyncCoordinator syncRestriction];
    v11 = blt_general_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v10;
      _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_DEFAULT, "Paired sync coordinator says current sync restriction is %lu", buf, 0xCu);
    }

    [v3 setState:2 * (v10 != 1)];
    if (v10 == 1)
    {
      v12 = (PSYSyncSessionObserver *)objc_alloc_init(MEMORY[0x263F5BB28]);
      pairedSyncObserver = v2->_pairedSyncObserver;
      v2->_pairedSyncObserver = v12;

      [(PSYSyncSessionObserver *)v2->_pairedSyncObserver setDelegate:v2];
      [(PSYSyncSessionObserver *)v2->_pairedSyncObserver startObservingSyncSessionsWithCompletion:&__block_literal_global];
    }
    [(BLTPairedSyncCoordinator *)v2 _initInitialSyncStateComplete];
  }
  return v2;
}

- (void)_initInitialSyncStateComplete
{
  v3 = [MEMORY[0x263F57730] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke;
  v4[3] = &unk_264683F70;
  v4[4] = self;
  [v3 waitForPairingStorePathPairingID:v4];
}

void __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = blt_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Requesting initial sync state for %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) requestInitialSyncStateForPairingIdentifier:v4 completion:&__block_literal_global_10];
}

void __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke_7(uint64_t a1, char a2)
{
  v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke_2;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v5 = a2;
  dispatch_async(v3, block);
}

void __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 32)) {
      v3 = "";
    }
    else {
      v3 = " NOT";
    }
    int v5 = 136315138;
    int v6 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "PSY says initial sync state is%s complete", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[BLTPairedSyncState sharedInstance];
  [v4 setInitialSyncComplete:*(unsigned __int8 *)(a1 + 32)];
}

+ (void)syncDidComplete
{
}

- (void)_syncDidComplete
{
  self->_clientSyncComplete = 1;
  id v2 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator activeSyncSession];
  [v2 syncDidComplete];
}

+ (void)reportProgress:(double)a3
{
}

- (void)_reportProgress:(double)a3
{
  id v4 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator activeSyncSession];
  [v4 reportProgress:a3];
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5 = a4;
  int v6 = BLTWorkQueue();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke;
  v8[3] = &unk_264683BB0;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke_2;
  v3[3] = &unk_264683F98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateNewlyRunningActivitiesWithBlock:v3];
}

void __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [a3 activityInfo];
  id v5 = [v4 label];

  uint64_t v6 = 4;
  id v7 = BLTCanStartListeningDuringPairedSyncActivities;
  while (![v5 isEqualToString:*v7])
  {
    ++v7;
    if (!--v6) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_INFO, "PSY Observer says %@ is now running", (uint8_t *)&v12, 0xCu);
  }

  id v9 = +[BLTPairedSyncState sharedInstance];
  [v9 leaveState:0];

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = 0;

LABEL_8:
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = blt_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Received beginSyncSession.", v8, 2u);
  }

  uint64_t v6 = +[BLTPairedSyncState sharedInstance];
  [v6 leaveState:1];

  if (self->_clientSyncComplete)
  {
    id v7 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator activeSyncSession];
    [v7 syncDidComplete];
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator syncRestriction];
  id v4 = blt_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "Received syncCoordinatorDidChangeSyncRestriction. Coordinator says current sync restriction is %lu", (uint8_t *)&v6, 0xCu);
  }

  if (v3 != 1)
  {
    id v5 = +[BLTPairedSyncState sharedInstance];
    [v5 leaveState:1];
  }
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v4 = BLTWorkQueue();
  dispatch_async(v4, &__block_literal_global_17);
}

void __96__BLTPairedSyncCoordinator_initialSyncStateObserver_initialSyncDidCompleteForPairingIdentifier___block_invoke()
{
  v0 = blt_general_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_222F4C000, v0, OS_LOG_TYPE_DEFAULT, "InitialSyncState observer says initial sync is entirely complete", v2, 2u);
  }

  v1 = +[BLTPairedSyncState sharedInstance];
  [v1 setInitialSyncComplete:1];
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  id v4 = BLTWorkQueue();
  dispatch_async(v4, &__block_literal_global_19);
}

void __89__BLTPairedSyncCoordinator_initialSyncStateObserver_syncDidCompleteForPairingIdentifier___block_invoke()
{
  v0 = blt_general_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_222F4C000, v0, OS_LOG_TYPE_DEFAULT, "InitialSyncState observer says sync is entirely complete", v2, 2u);
  }

  v1 = +[BLTPairedSyncState sharedInstance];
  [v1 setInitialSyncComplete:1];
}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (void)setPairedSyncCoordinator:(id)a3
{
}

- (PSYInitialSyncStateObserver)pairedInitialSyncObserver
{
  return self->_pairedInitialSyncObserver;
}

- (void)setPairedInitialSyncObserver:(id)a3
{
}

- (PSYSyncSessionObserver)pairedSyncObserver
{
  return self->_pairedSyncObserver;
}

- (void)setPairedSyncObserver:(id)a3
{
}

- (BOOL)clientSyncComplete
{
  return self->_clientSyncComplete;
}

- (void)setClientSyncComplete:(BOOL)a3
{
  self->_clientSyncComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncObserver, 0);
  objc_storeStrong((id *)&self->_pairedInitialSyncObserver, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
}

@end
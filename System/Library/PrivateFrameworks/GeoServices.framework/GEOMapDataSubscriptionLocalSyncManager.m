@interface GEOMapDataSubscriptionLocalSyncManager
- (GEOMapDataSubscriptionLocalSyncManager)initWithPersistence:(id)a3 tileDB:(id)a4 dataConfiguration:(id)a5;
- (GEOMapDataSubscriptionPersistence)persistence;
- (GEOMapDataSubscriptionSyncManagerDelegate)delegate;
- (id)_pairedDeviceDaemonConnection;
- (id)_pairedDeviceSubscriptionStatesSummary;
- (void)_considerDisplayingLowDiskSpaceNotification;
- (void)_fetchStatesForSubscriptionsWithIdentifiers:(void *)a3 completionHandler:;
- (void)_pairedDeviceConnectivityDidChange:(id)a3;
- (void)_pairedDevicesDidChange:(id)a3;
- (void)_synchronizedSubscriptionsDidChange;
- (void)_updateObservedStateSubscriptionIdentifiersForPairedDevice;
- (void)_updatePairedDevicesWithCompletionHandler:(uint64_t)a1;
- (void)beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:(id)a3;
- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3;
- (void)dealloc;
- (void)didAddSubscription:(id)a3;
- (void)didUpdateSubscriptionWithIdentifier:(id)a3;
- (void)endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:(id)a3;
- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)handlePairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setNeedsPairedDeviceStateSynchronization;
- (void)setPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4;
@end

@implementation GEOMapDataSubscriptionLocalSyncManager

- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = a3;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
  {
    db = self->_db;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke_2;
    v12[3] = &unk_1E53DA278;
    v9 = &v13;
    id v13 = v6;
    id v10 = v6;
    [(GEOTileDB *)db fetchAllSubscriptionsToSyncToPairedDevice:0 queue:v7 callback:v12];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    v9 = &v15;
    id v15 = v6;
    id v11 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "_geo_map:", &__block_literal_global_78);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  block[3] = &unk_1E53D7F70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __80__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceSubscriptionStatesSummary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (!v3)
  {
    if (*(void *)(v2 + 88))
    {
      id v4 = +[GEOPairedDeviceFilePaths urlFor:forDevice:](GEOPairedDeviceFilePaths, "urlFor:forDevice:", 1);
      v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
      id v6 = [[GEOPairedDeviceSubscriptionStatesSummary alloc] initWithData:v5];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v6;

      if (!*(void *)(*(void *)(a1 + 32) + 104))
      {
        id v9 = objc_alloc_init(GEOPairedDeviceSubscriptionStatesSummary);
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(v10 + 104);
        *(void *)(v10 + 104) = v9;
      }
      v3 = *(void **)(*(void *)(a1 + 32) + 104);
    }
    else
    {
      v3 = 0;
    }
  }
  id v12 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v12, v3);
}

void __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(void *)(a1 + 32));
  v3 = v2;
  if (v2)
  {
    if ([v2 hasLastUpdatedTimestamp])
    {
      id v4 = (void *)MEMORY[0x1E4F1C9C8];
      [v3 lastUpdatedTimestamp];
      v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v5 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E53D7C50;
    id v6 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v11 = v5;
    id v12 = v7;
    id v8 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2;
    v13[3] = &unk_1E53DA028;
    id v9 = *(NSObject **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v9, v13);
    id v8 = v14;
  }
}

- (id)_pairedDeviceSubscriptionStatesSummary
{
  if (a1)
  {
    uint64_t v3 = 0;
    id v4 = &v3;
    uint64_t v5 = 0x3032000000;
    id v6 = __Block_byref_object_copy__89;
    id v7 = __Block_byref_object_dispose__89;
    id v8 = 0;
    geo_isolate_sync();
    id v1 = (id)v4[5];
    _Block_object_dispose(&v3, 8);
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

- (GEOMapDataSubscriptionLocalSyncManager)initWithPersistence:(id)a3 tileDB:(id)a4 dataConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (NanoRegistryLibraryCore()
    && (v32.receiver = self,
        v32.super_class = (Class)GEOMapDataSubscriptionLocalSyncManager,
        id v11 = [(GEOMapDataSubscriptionLocalSyncManager *)&v32 init],
        (self = v11) != 0))
  {
    objc_storeWeak((id *)&v11->_persistence, v8);
    objc_storeStrong((id *)&self->_db, a4);
    geo_dispatch_queue_create_with_qos();
    id v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    workQueue = self->_workQueue;
    self->_workQueue = v12;

    id v14 = (geo_isolater *)geo_isolater_create();
    isolation = self->_isolation;
    self->_isolation = v14;

    objc_storeStrong((id *)&self->_offlineDataConfiguration, a5);
    v16 = [MEMORY[0x1E4F1CA48] array];
    observedIdentifiers = self->_observedIdentifiers;
    self->_observedIdentifiers = v16;

    v18 = [MEMORY[0x1E4F1CA60] dictionary];
    observedStates = self->_observedStates;
    self->_observedStates = v18;

    dispatch_group_t v20 = dispatch_group_create();
    objc_storeStrong((id *)&self->_initialNanoRegistryFetchGroup, v20);
    dispatch_group_enter(v20);
    objc_initWeak(&location, self);
    v21 = +[GEOKeyBagNotification sharedObject];
    v22 = self->_workQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke;
    v27[3] = &unk_1E53ED088;
    objc_copyWeak(&v30, &location);
    v23 = v20;
    v28 = v23;
    v24 = self;
    v29 = v24;
    [v21 runAfterFirstUnlock:v22 block:v27];

    self = v24;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = getNRPairedDeviceRegistryDevicesDidUpdateNotification();
    [v4 addObserver:WeakRetained selector:sel__pairedDevicesDidChange_ name:v5 object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:WeakRetained selector:sel__pairedDeviceConnectivityDidChange_ name:@"GEOPairedDeviceConnectionConnectivityDidChange" object:0];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_2;
    v17[3] = &unk_1E53D79D8;
    id v18 = *(id *)(a1 + 32);
    -[GEOMapDataSubscriptionLocalSyncManager _updatePairedDevicesWithCompletionHandler:]((uint64_t)WeakRetained, v17);
    id v7 = (void *)WeakRetained[3];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_3;
    v15[3] = &unk_1E53ED060;
    objc_copyWeak(&v16, v2);
    uint64_t v8 = MapsFeature_AddBlockListener(MapsFeaturesConfig_StandaloneWatchOffline, off_1E9111DF8, v7, v15);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v9 + 96);
    *(void *)(v9 + 96) = v8;

    id v11 = *(NSObject **)(a1 + 32);
    id v12 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_4;
    block[3] = &unk_1E53D7B90;
    objc_copyWeak(&v14, v2);
    dispatch_group_notify(v11, v12, block);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_2(uint64_t a1)
{
}

- (void)_updatePairedDevicesWithCompletionHandler:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
    {
      id v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
      uint64_t v5 = [v4 getPairedDevices];
      id v6 = objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_178);
      id v7 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = [v6 count];
        uint64_t v9 = [v5 count];
        *(_DWORD *)buf = 134349312;
        uint64_t v22 = v8;
        __int16 v23 = 2050;
        uint64_t v24 = v9 - [v6 count];
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "[PairedDevice] Found %{public}llu supported paired devices, %{public}llu unsupported devices", buf, 0x16u);
      }

      v19[1] = (id)MEMORY[0x1E4F143A8];
      v19[2] = (id)3221225472;
      v19[3] = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_36;
      v19[4] = &unk_1E53D8998;
      v19[5] = (id)a1;
      id v10 = v6;
      id v20 = v10;
      geo_isolate_sync_data();
      id v11 = objc_msgSend(v10, "_geo_map:", &__block_literal_global_40_1);
      if ([v11 count]
        || !GEOConfigGetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8))
      {
        if ([v11 count]
          && (GEOConfigGetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8) & 1) == 0)
        {
          id v14 = GEOGetSubscriptionsLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "[PairedDevice] Became aware of supported device pairing(s) for the first time. Setting initial sync values if appropriate", buf, 2u);
          }

          GEOConfigSetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8);
          objc_initWeak((id *)buf, (id)a1);
          id v15 = *(void **)(a1 + 40);
          uint64_t v16 = *(void *)(a1 + 24);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_41;
          v17[3] = &unk_1E53ED120;
          void v17[4] = a1;
          id v18 = v3;
          objc_copyWeak(v19, (id *)buf);
          [v15 fetchAllSubscriptionsWithQueue:v16 callback:v17];
          objc_destroyWeak(v19);

          objc_destroyWeak((id *)buf);
        }
        else
        {
          -[GEOMapDataSubscriptionLocalSyncManager _considerDisplayingLowDiskSpaceNotification]((dispatch_queue_t *)a1);
          if (v3) {
            v3[2](v3);
          }
        }
      }
      else
      {
        id v12 = GEOGetSubscriptionsLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "[PairedDevice] No supported device pairings remain. Clearing sync flags", buf, 2u);
        }

        [*(id *)(a1 + 40) clearShouldSyncSubscriptionsForPairedDevice:0];
        _setValue(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8, 0, 0, 0);
        _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1E9115A78, 0, 0, 0);
      }
    }
    else if (GEOConfigGetBOOL(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8))
    {
      id v13 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "[PairedDevice] Feature flag is disabled. Clearing paired device sync configuration", buf, 2u);
      }

      [*(id *)(a1 + 40) clearShouldSyncSubscriptionsForPairedDevice:0];
      _setValue(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8, 0, 0, 0);
    }
  }
}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOMapDataSubscriptionLocalSyncManager _updatePairedDevicesWithCompletionHandler:]((uint64_t)WeakRetained, 0);
}

void __87__GEOMapDataSubscriptionLocalSyncManager_initWithPersistence_tileDB_dataConfiguration___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsPairedDeviceStateSynchronization];
}

- (void)dealloc
{
  MapsFeature_RemoveBlockListener(self->_featureFlagObserver);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapDataSubscriptionLocalSyncManager;
  [(GEOMapDataSubscriptionLocalSyncManager *)&v3 dealloc];
}

- (id)_pairedDeviceDaemonConnection
{
  if (a1)
  {
    uint64_t v3 = 0;
    id v4 = &v3;
    uint64_t v5 = 0x3032000000;
    id v6 = __Block_byref_object_copy__89;
    id v7 = __Block_byref_object_dispose__89;
    id v8 = 0;
    geo_isolate_sync();
    id v1 = (id)v4[5];
    _Block_object_dispose(&v3, 8);
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 112));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanomaps.xpc.GeoServices" options:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED836110];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRemoteObjectInterface:v5];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExportedObject:*(void *)(a1 + 32)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke_2;
    uint64_t v9 = &unk_1E53D7B90;
    objc_copyWeak(&v10, &location);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInvalidationHandler:&v6];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "resume", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    geo_isolate_sync_data();
  }
}

void __71__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceDaemonConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;
}

- (void)setNeedsPairedDeviceStateSynchronization
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__GEOMapDataSubscriptionLocalSyncManager_setNeedsPairedDeviceStateSynchronization__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __82__GEOMapDataSubscriptionLocalSyncManager_setNeedsPairedDeviceStateSynchronization__block_invoke(uint64_t a1)
{
  if (GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1E9115A48) != 1)
  {
    -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(void *)(a1 + 32));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v9 data];
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F1C9B8] data];
    }
    uint64_t v5 = v4;

    uint64_t v6 = objc_alloc_init(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest);
    uint64_t v7 = objc_msgSend(v5, "_geo_SHA256Hash");
    [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)v6 setSummarySHA256Hash:v7];

    id v8 = +[GEOPairedDeviceConnection sharedInstance];
    [v8 sendCheckinWithSubscriptionStateSummary:v6];

    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice](*(void *)(a1 + 32));
  }
}

- (void)_updateObservedStateSubscriptionIdentifiersForPairedDevice
{
  if (a1)
  {
    uint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1E9115A48);
    if (UInteger == 2) {
      goto LABEL_4;
    }
    uint64_t v3 = UInteger;
    id v4 = -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection](a1);
    uint64_t v5 = [v4 remoteObjectProxy];
    [v5 updateObservedStateSubscriptionIdentifiers];

    if (v3 != 1)
    {
LABEL_4:
      uint64_t v11 = 0;
      id v12 = &v11;
      uint64_t v13 = 0x3032000000;
      id v14 = __Block_byref_object_copy__89;
      id v15 = __Block_byref_object_dispose__89;
      id v16 = 0;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = a1;
      geo_isolate_sync_data();
      uint64_t v6 = objc_alloc_init(GEOPairedDeviceSubscriptionStateSynchronizationRequest);
      uint64_t v7 = objc_msgSend((id)v12[5], "mutableCopy", v9, 3221225472, __100__GEOMapDataSubscriptionLocalSyncManager__updateObservedStateSubscriptionIdentifiersForPairedDevice__block_invoke, &unk_1E53D89C0, v10, &v11);
      [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)v6 setIdentifiersToObserves:v7];

      id v8 = +[GEOPairedDeviceConnection sharedInstance];
      [v8 sendSetObservedSubscriptionIdentifiers:v6];

      _Block_object_dispose(&v11, 8);
    }
  }
}

- (void)_pairedDevicesDidChange:(id)a3
{
  id v4 = GEOGetSubscriptionsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "[PairedDevice] Paired devices changed", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GEOMapDataSubscriptionLocalSyncManager__pairedDevicesDidChange___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __66__GEOMapDataSubscriptionLocalSyncManager__pairedDevicesDidChange___block_invoke(uint64_t a1)
{
}

- (void)_pairedDeviceConnectivityDidChange:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPairedDeviceConnection sharedInstance];
  int v3 = [v2 isConnected];

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__89;
  uint64_t v25 = __Block_byref_object_dispose__89;
  id v26 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_2;
  id v18 = &unk_1E53D7C00;
  uint64_t v19 = v4;
  id v20 = &v21;
  geo_isolate_sync_data();
  if ([(id)v22[5] count])
  {
    uint64_t v5 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"not connected";
      if (v3) {
        uint64_t v6 = @"connected";
      }
      *(_DWORD *)buf = 138543362;
      v29 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "[PairedDevice] Paired device connectivity changed (%{public}@). Updating observed state(s) accordingly", buf, 0xCu);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v22[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(a1 + 32), "fetchStateForPairedDeviceSubscriptionWithIdentifier:callbackQueue:completionHandler:", MEMORY[0x1E4F143A8], 3221225472, __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_29, &unk_1E53ED0B0, *(void *)(a1 + 32), *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v27 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v21, 8);
}

void __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __77__GEOMapDataSubscriptionLocalSyncManager__pairedDeviceConnectivityDidChange___block_invoke_29(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 delegate];
    [v5 syncManager:*(void *)(a1 + 32) didUpdatePairedDeviceState:v4 forIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didAddSubscription:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
  {
    initialNanoRegistryFetchGroup = self->_initialNanoRegistryFetchGroup;
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke;
    v7[3] = &unk_1E53D8998;
    v7[4] = self;
    id v8 = v4;
    dispatch_group_notify(initialNanoRegistryFetchGroup, workQueue, v7);
  }
}

void __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = *(void *)(a1 + 32);
  geo_isolate_sync_data();
  if (*((unsigned char *)v10 + 24))
  {
    uint64_t BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8);
    uint64_t v3 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = objc_msgSend(*(id *)(a1 + 40), "identifier", v7, 3221225472, __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke_2, &unk_1E53D89C0, v8, &v9);
      *(_DWORD *)buf = 67109635;
      int v14 = BOOL;
      __int16 v15 = 2160;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2113;
      id v18 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[PairedDevice] Setting should_sync = %i for new subscription '%{private, mask.hash}@' (if not already configured)", buf, 0x1Cu);
    }
    id v5 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v6 = [*(id *)(a1 + 40) identifier];
    [v5 setSubscriptionWithIdentifier:v6 shouldSync:BOOL toPairedDevice:0 shouldOverwriteExistingValue:0];
  }
  else
  {
    uint64_t v6 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "[PairedDevice] Not configuring sync state because there are no paired devices", buf, 2u);
    }
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __61__GEOMapDataSubscriptionLocalSyncManager_didAddSubscription___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)didUpdateSubscriptionWithIdentifier:(id)a3
{
  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection]((uint64_t)self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v4 remoteObjectProxy];
  [v3 setNeedsSubscriptionSynchronizationUpdate];
}

- (void)_synchronizedSubscriptionsDidChange
{
  if (a1)
  {
    notify_post(GEOMapDataSubscriptionManagerPairedDeviceSubscriptionsDidChangeDarwinNotification);
    -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection](a1);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v3 remoteObjectProxy];
    [v2 setNeedsSubscriptionSynchronizationUpdate];
  }
}

uint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:@"3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"];
  uint64_t v5 = [v3 supportsCapability:v4];

  return v5;
}

void __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = [*(id *)(a1 + 40) count] != 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = (id)[v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v7 = getNRDevicePropertyIsActive();
        uint64_t v8 = [v6 valueForProperty:v7];
        int v9 = [v8 BOOLValue];

        if (v9)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 88) pairingID];
  uint64_t v11 = [v3 pairingID];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(void *)(v13 + 88))
    {
      int v14 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "[PairedDevice] Active device changed", v18, 2u);
      }

      uint64_t v13 = *(void *)(a1 + 32);
    }
    __int16 v15 = *(void **)(v13 + 104);
    *(void *)(v13 + 104) = 0;
  }
  uint64_t v16 = *(void *)(a1 + 32);
  __int16 v17 = *(void **)(v16 + 88);
  *(void *)(v16 + 88) = v3;
}

uint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  return [a2 pairingID];
}

void __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 || !v6)
  {
    uint64_t v10 = dispatch_group_create();
    uint64_t v11 = objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_45_0);
    if ([v11 count])
    {
      dispatch_group_enter(v10);
      char v12 = *(void **)(a1 + 32);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      id v26 = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_46;
      v27 = &unk_1E53ED0F8;
      id location = &v30;
      objc_copyWeak(&v30, (id *)(a1 + 48));
      id v28 = v11;
      v29 = v10;
      id v22 = v28;
      uint64_t v13 = v25;
      if (v12)
      {
        if (_GEOConfigHasValue(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8)
          || (uint64_t v14 = 1000000
                  * GEOConfigGetUint64(GeoOfflineConfig_SyncToWatchDefaultEnabledSizeThreshold, (uint64_t)off_1E91159C8)) == 0)
        {
          uint64_t BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8);
          v26((uint64_t)v13, BOOL);
        }
        else
        {
          __int16 v15 = objc_msgSend(v22, "_geo_map:", &__block_literal_global_52_2, &v30);
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          objc_super v32 = __115__GEOMapDataSubscriptionLocalSyncManager__setInitialSyncToWatchStateIfNecessaryForSubscriptions_completionHandler___block_invoke_2;
          v33 = &unk_1E53ED148;
          uint64_t v16 = v13;
          id v34 = v15;
          id v35 = v16;
          uint64_t v36 = v14;
          id v17 = v15;
          -[GEOMapDataSubscriptionLocalSyncManager _fetchStatesForSubscriptionsWithIdentifiers:completionHandler:](v12, v17, &buf);
        }
      }

      objc_destroyWeak(location);
    }
    else
    {
      long long v19 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "[PairedDevice] No offline subscriptions found", (uint8_t *)&buf, 2u);
      }
    }
    long long v20 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_48;
    block[3] = &unk_1E53DA028;
    id v24 = *(id *)(a1 + 40);
    dispatch_group_notify(v10, v20, block);
  }
  else
  {
    uint64_t v8 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "[PairedDevice] Error fetching existing subscriptions. Will retry initial configuration later: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    _setValue(GeoOfflineConfig_HasPerformedInitialPairedDeviceSyncMigration, (uint64_t)off_1E91159F8, 0, 0, 0);
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

unint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [*(id *)(a1 + 32) count];
      *(_DWORD *)long long buf = 67109376;
      int v20 = a2;
      __int16 v21 = 2048;
      uint64_t v22 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "[PairedDevice] Setting should sync to %i for %llu subscriptions", buf, 0x12u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          dispatch_queue_t v12 = WeakRetained[5];
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "identifier", (void)v14);
          [v12 setSubscriptionWithIdentifier:v13 shouldSync:a2 toPairedDevice:0];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    -[GEOMapDataSubscriptionLocalSyncManager _synchronizedSubscriptionsDidChange]((uint64_t)WeakRetained);
    -[GEOMapDataSubscriptionLocalSyncManager _considerDisplayingLowDiskSpaceNotification](WeakRetained);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

- (void)_considerDisplayingLowDiskSpaceNotification
{
  dispatch_assert_queue_V2(a1[3]);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__89;
    long long v19 = __Block_byref_object_dispose__89;
    id v20 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke;
    dispatch_queue_t v12 = &unk_1E53D89C0;
    uint64_t v13 = a1;
    long long v14 = &v15;
    geo_isolate_sync_data();
    if (v16[5])
    {
      id v2 = _getValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1E9115A78, 1, 0, 0, 0);
      if (v2
        && ([(id)v16[5] UUIDString],
            id v3 = objc_claimAutoreleasedReturnValue(),
            int v4 = [v2 isEqualToString:v3],
            v3,
            v4))
      {
        id v5 = GEOGetSubscriptionsLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "[PairedDevice] Already considered displaying low-space notification for active device", buf, 2u);
        }
      }
      else
      {
        dispatch_queue_t v6 = a1[3];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_54;
        v7[3] = &unk_1E53ED210;
        v7[4] = a1;
        void v7[5] = &v15;
        [(dispatch_queue_t *)a1 fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:v6 completionHandler:v7];
      }
    }
    else
    {
      _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1E9115A78, 0, 0, 0);
    }
    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __84__GEOMapDataSubscriptionLocalSyncManager__updatePairedDevicesWithCompletionHandler___block_invoke_48(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __115__GEOMapDataSubscriptionLocalSyncManager__setInitialSyncToWatchStateIfNecessaryForSubscriptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __115__GEOMapDataSubscriptionLocalSyncManager__setInitialSyncToWatchStateIfNecessaryForSubscriptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v14 = objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v28);
          if (!v14)
          {
            long long v16 = GEOGetSubscriptionsLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 141558275;
              uint64_t v33 = 1752392040;
              __int16 v34 = 2113;
              uint64_t v35 = v13;
              _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "[PairedDevice] Missing state for identifier '%{private,mask.hash}@'. Not considering disabling sync-to-watch by default.", buf, 0x16u);
            }

            uint64_t v17 = *(void *)(a1 + 40);
            uint64_t BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8);
            (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, BOOL);

            goto LABEL_26;
          }
          uint64_t v15 = v14;
          v10 += [v14 downloadedDataSize];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }

    unint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = GEOGetSubscriptionsLog();
    id v24 = v23;
    if (v10 >= v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v33 = v10;
        __int16 v34 = 2048;
        uint64_t v35 = v27;
        _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_INFO, "[PairedDevice] Current offline data size (%{bytes}llu) is above threshold (%{bytes}llu). Disabling sync-to-watch by default.", buf, 0x16u);
      }

      GEOConfigSetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8);
      uint64_t v26 = 0;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v33 = v10;
        __int16 v34 = 2048;
        uint64_t v35 = v25;
        _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "[PairedDevice] Current offline data size (%{bytes}llu) is less than threshold (%{bytes}llu). Not disabling sync-to-watch by default.", buf, 0x16u);
      }

      uint64_t v26 = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v26);
  }
  else
  {
    long long v19 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138477827;
      uint64_t v33 = (uint64_t)v6;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to fetch states for subscriptions. Not considering disabling sync-to-watch by default: %{private}@", buf, 0xCu);
    }

    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = GEOConfigGetBOOL(GeoOfflineConfig_SyncToWatchEnabled, (uint64_t)off_1E91159B8);
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v21);
  }
LABEL_26:
}

- (void)_fetchStatesForSubscriptionsWithIdentifiers:(void *)a3 completionHandler:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v14 = a3;
  if (a1)
  {
    if ([v15 count])
    {
      uint64_t v17 = [a1 delegate];
      if (v17)
      {
        *(void *)long long buf = 0;
        uint64_t v33 = buf;
        uint64_t v34 = 0x3032000000;
        uint64_t v35 = __Block_byref_object_copy__89;
        uint64_t v36 = __Block_byref_object_dispose__89;
        id v37 = 0;
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = __Block_byref_object_copy__89;
        v30[4] = __Block_byref_object_dispose__89;
        objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v5 = dispatch_group_create();
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id obj = v15;
        uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v42 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v27 != v7) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              dispatch_group_enter(v5);
              uint64_t v10 = a1[3];
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_2;
              v22[3] = &unk_1E53ED238;
              id v24 = buf;
              uint64_t v25 = v30;
              v22[4] = v9;
              uint64_t v23 = v5;
              [v17 syncManager:a1 fetchStateForSubscriptionWithIdentifier:v9 callbackQueue:v10 completionHandler:v22];
            }
            uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v42 count:16];
          }
          while (v6);
        }

        uint64_t v11 = a1[3];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_3;
        block[3] = &unk_1E53D9928;
        id v19 = v14;
        uint64_t v20 = buf;
        uint64_t v21 = v30;
        dispatch_group_notify(v5, v11, block);

        _Block_object_dispose(v30, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: delegate != ((void *)0)", buf, 2u);
        }
        uint64_t v13 = a1[3];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_65;
        v38[3] = &unk_1E53DA028;
        id v39 = v14;
        dispatch_async(v13, v38);
      }
    }
    else
    {
      dispatch_queue_t v12 = a1[3];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke;
      v40[3] = &unk_1E53DA028;
      id v41 = v14;
      dispatch_async(v12, v40);
    }
  }
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) pairingID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 count])
    {
      uint64_t v7 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_55;
      v10[3] = &unk_1E53ED1E8;
      id v11 = v5;
      long long v12 = *(_OWORD *)(a1 + 32);
      -[GEOMapDataSubscriptionLocalSyncManager _fetchStatesForSubscriptionsWithIdentifiers:completionHandler:](v7, v11, v10);
      uint64_t v8 = v11;
    }
    else
    {
      uint64_t v9 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "[PairedDevice] No subscriptions will sync to active watch. No need to query available disk space", buf, 2u);
      }

      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) UUIDString];
      _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1E9115A78, v8, 1, 0);
    }
  }
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = (GEOPairedDeviceGetStorageInfoRequest *)*(id *)(a1 + 32);
    uint64_t v8 = [(GEOPairedDeviceGetStorageInfoRequest *)v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v14 = [v5 objectForKeyedSubscript:v13];
          if (!v14)
          {
            long long v16 = GEOGetSubscriptionsLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 141558275;
              uint64_t v31 = 1752392040;
              __int16 v32 = 2113;
              uint64_t v33 = v13;
              _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "[PairedDevice] Missing state for identifier '%{private,mask.hash}@'. Not considering displaying low-space notification", buf, 0x16u);
            }

            goto LABEL_20;
          }
          id v15 = v14;
          v10 += [v14 downloadedDataSize];
        }
        uint64_t v9 = [(GEOPairedDeviceGetStorageInfoRequest *)v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }

    uint64_t v17 = v10
        + (unint64_t)(GEOConfigGetDouble(GeoOfflineConfig_DownloadAvailableDiskCapacityAdditionalMultiplier, (uint64_t)off_1E9115A58)* (double)v10);
    id v18 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134349056;
      uint64_t v31 = v17;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "[PairedDevice] Sync-to-watch subscriptions require up to %{public,bytes}llu. Checking available disk space on paired device", buf, 0xCu);
    }

    uint64_t v7 = objc_alloc_init(GEOPairedDeviceGetStorageInfoRequest);
    id v19 = +[GEOPairedDeviceConnection sharedInstance];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_57;
    v22[3] = &unk_1E53ED1C0;
    uint64_t v25 = v17;
    int8x16_t v21 = *(int8x16_t *)(a1 + 32);
    id v20 = (id)v21.i64[0];
    int8x16_t v23 = vextq_s8(v21, v21, 8uLL);
    uint64_t v24 = *(void *)(a1 + 48);
    [v19 sendGetStorageInfo:v7 withReply:v22];
  }
  else
  {
    GEOGetSubscriptionsLog();
    uint64_t v7 = (GEOPairedDeviceGetStorageInfoRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138477827;
      uint64_t v31 = (uint64_t)v6;
      _os_log_impl(&dword_188D96000, &v7->super.super, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to fetch states for subscriptions. Not considering displaying low-space notification: %{private}@", buf, 0xCu);
    }
  }
LABEL_20:
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_57(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unint64_t v7 = [v5 availableStorageBytesOfflineMaps];
    unint64_t v8 = a1[7];
    if (v7 >= v8)
    {
      id v18 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "[PairedDevice] Paired device has sufficient disk space for estimated subscription sizes", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      unint64_t v9 = v8 - [v5 availableStorageBytesOfflineMaps];
      unint64_t v10 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134349056;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "[PairedDevice] Paired device requires %{public,bytes}llu additional space for synced subscriptions", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v12 = a1[4];
      uint64_t v11 = (void *)a1[5];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      unint64_t v22 = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_58;
      int8x16_t v23 = &unk_1E53ED198;
      unint64_t v25 = v9;
      uint64_t v24 = v11;
      uint64_t v13 = v24;
      id v14 = &v20;
      if (v12)
      {
        id v15 = *(void **)(v12 + 40);
        uint64_t v16 = *(void *)(v12 + 24);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        long long v27 = __105__GEOMapDataSubscriptionLocalSyncManager__fetchDisplayNamesForSubscriptionIdentifiers_completionHandler___block_invoke;
        long long v28 = &unk_1E53ED260;
        uint64_t v17 = v13;
        long long v29 = v17;
        long long v30 = v14;
        objc_msgSend(v15, "fetchSubscriptionsMatchingIdentifiers:queue:callback:", v17, v16, &buf, v20, v21, v22, v23);
      }
      id v18 = v24;
    }

    id v19 = [*(id *)(*(void *)(a1[6] + 8) + 40) UUIDString];
    _setValue(GeoOfflineConfig_LastPairedDeviceCheckedForDiskSpaceNotification, (uint64_t)off_1E9115A78, v19, 1, 0);
  }
  else
  {
    id v19 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to fetch storage info from paired device: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F29268];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_2;
  v7[3] = &unk_1E53ED170;
  id v5 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  objc_msgSend(v4, "geo_withMapsNotificationProviderDaemon:errorHandler:", v7, &__block_literal_global_62_0);
}

uint64_t __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_2(void *a1, void *a2)
{
  return [a2 pairedDeviceHasInsufficientDiskSpace:a1[6] forSubscriptions:a1[4] withDisplayNames:a1[5]];
}

void __85__GEOMapDataSubscriptionLocalSyncManager__considerDisplayingLowDiskSpaceNotification__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = GEOGetSubscriptionsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "[PairedDevice] Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_65(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5 && (uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8), v8 = *(void *)(v6 + 40), v7 = (id *)(v6 + 40), !v8))
  {
    objc_storeStrong(v7, a3);
  }
  else if (v9)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v9 forKey:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __104__GEOMapDataSubscriptionLocalSyncManager__fetchStatesForSubscriptionsWithIdentifiers_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __105__GEOMapDataSubscriptionLocalSyncManager__fetchDisplayNamesForSubscriptionIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = objc_msgSend(v10, "identifier", (void)v15);
        if ([v11 containsObject:v12])
        {
          uint64_t v13 = [v10 displayName];

          if (!v13) {
            continue;
          }
          uint64_t v12 = [v10 displayName];
          id v14 = [v10 identifier];
          [v4 setObject:v12 forKeyedSubscript:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(GEOPBCompanionSubscriptionsInfo);
  [(GEOPBCompanionSubscriptionsInfo *)v11 setPadding:1];
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E53ED320;
  id v21 = v8;
  id v22 = v10;
  id v18 = v9;
  id v19 = v11;
  uint64_t v20 = self;
  id v13 = v8;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  [(GEOTileDB *)db fetchAllSubscriptionsWithQueue:v16 callback:v17];
}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v30 = v5;
  id v31 = a3;
  if (!v5)
  {
    long long v26 = *(NSObject **)(a1 + 32);
    long long v27 = v69;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    v69[3] = &unk_1E53D7C50;
    id v71 = *(id *)(a1 + 64);
    id v70 = v31;
    dispatch_async(v26, v69);

LABEL_18:
    unint64_t v25 = (void *)v27[5];
    goto LABEL_15;
  }
  if (!objc_msgSend(v5, "count", v5, v31))
  {
    long long v28 = *(NSObject **)(a1 + 32);
    long long v27 = v66;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_3;
    v66[3] = &unk_1E53D7C50;
    id v68 = *(id *)(a1 + 64);
    id v67 = *(id *)(a1 + 40);
    dispatch_async(v28, v66);

    goto LABEL_18;
  }
  __int16 v32 = objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_69);
  if ([v32 count])
  {
    group = dispatch_group_create();
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = __Block_byref_object_copy__89;
    v61[4] = __Block_byref_object_dispose__89;
    id v62 = 0;
    uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v32;
    uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v72 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v58 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          dispatch_group_enter(group);
          id v10 = [*(id *)(a1 + 48) delegate];
          uint64_t v11 = *(void *)(a1 + 48);
          uint64_t v12 = [v9 identifier];
          uint64_t v13 = *(void *)(a1 + 32);
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_6;
          v51[3] = &unk_1E53ED288;
          v56 = v61;
          id v52 = v35;
          v53 = v9;
          id v54 = v34;
          v55 = group;
          [v10 syncManager:v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:v13 completionHandler:v51];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v72 count:16];
      }
      while (v6);
    }

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__89;
    v49[4] = __Block_byref_object_dispose__89;
    id v50 = 0;
    if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
    {
      dispatch_group_enter(group);
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = *(void **)(*(void *)(a1 + 48) + 40);
      uint64_t v16 = *(void *)(a1 + 32);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_7;
      v46[3] = &unk_1E53ED210;
      v48 = v49;
      v47 = group;
      [v15 fetchAllSubscriptionsToSyncToPairedDevice:v14 queue:v16 callback:v46];
    }
    long long v17 = +[GEOOfflineDataAccess sharedInstance];
    id v18 = [v17 offlineTileMetadataWithState:66050 error:0];

    id v19 = *(void **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_9;
    block[3] = &unk_1E53ED2F8;
    id v38 = v35;
    id v39 = v19;
    id v44 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 40);
    v45 = v49;
    id v40 = v20;
    id v41 = v34;
    uint64_t v21 = *(void *)(a1 + 48);
    id v42 = v18;
    uint64_t v43 = v21;
    id v22 = v18;
    id v23 = v34;
    id v24 = v35;
    dispatch_group_notify(group, v39, block);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v61, 8);
  }
  else
  {
    long long v29 = *(NSObject **)(a1 + 32);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_5;
    v63[3] = &unk_1E53D7C50;
    id v65 = *(id *)(a1 + 64);
    id v64 = *(id *)(a1 + 40);
    dispatch_async(v29, v63);
  }
  unint64_t v25 = v32;
LABEL_15:
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

unint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    if ((unint64_t)([v10 loadState] - 1) > 2) {
      goto LABEL_7;
    }
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    [v6 setObject:v10 forKey:v7];
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(void *)(v8 + 40)) {
      goto LABEL_7;
    }
    id v9 = v5;
    uint64_t v7 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }

LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "_geo_map:", &__block_literal_global_71);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_9(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    [*(id *)(a1 + 32) sortUsingComparator:&__block_literal_global_75];
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_12;
    uint64_t v12 = &unk_1E53ED2D0;
    v13[1] = *(void *)(a1 + 88);
    uint64_t v3 = (id *)v13;
    v13[0] = *(id *)(a1 + 56);
    uint64_t v4 = objc_msgSend(v2, "_geo_map:", &v9);
    id v5 = objc_msgSend(v4, "mutableCopy", v9, v10, v11, v12);
    [*(id *)(a1 + 48) setLoadedSubscriptions:v5];

    [*(id *)(a1 + 48) setOfflineTileMetadata:*(void *)(a1 + 64)];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 72) + 48) lastUpdatedDate];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 timeIntervalSinceReferenceDate];
      objc_msgSend(*(id *)(a1 + 48), "setOfflineLastUpdatedTimestamp:");
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    uint64_t v8 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_10;
    block[3] = &unk_1E53D7C50;
    uint64_t v3 = &v16;
    id v16 = *(id *)(a1 + 80);
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v8, block);
    uint64_t v4 = v15;
  }
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

GEOPBCompanionSubscription *__121__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(GEOPBCompanionSubscription);
  id v5 = [v3 identifier];
  [(GEOPBCompanionSubscription *)v4 setIdentifier:v5];

  uint64_t v6 = [v3 displayName];
  [(GEOPBCompanionSubscription *)v4 setDisplayName:v6];

  uint64_t v7 = [v3 region];
  [(GEOPBCompanionSubscription *)v4 setRegion:v7];

  -[GEOPBCompanionSubscription setDataType:](v4, "setDataType:", [v3 dataTypes]);
  -[GEOPBCompanionSubscription setPolicy:](v4, "setPolicy:", [v3 policy]);
  uint64_t v8 = [v3 _originatingBundleIdentifier];
  [(GEOPBCompanionSubscription *)v4 setOriginatingBundleIdentifier:v8];

  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v10 = [v3 identifier];
  -[GEOPBCompanionSubscription setSyncToWatch:](v4, "setSyncToWatch:", [v9 containsObject:v10]);

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v3 identifier];

  uint64_t v13 = [v11 objectForKey:v12];

  if (v13) {
    -[GEOPBCompanionSubscription setDownloadedDataBytes:](v4, "setDownloadedDataBytes:", [v13 downloadedDataSize]);
  }

  return v4;
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = a5;
  id v12 = a6;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
  {
    [(GEOTileDB *)self->_db setSubscriptionWithIdentifier:v10 shouldSync:v8 toPairedDevice:0];
    -[GEOMapDataSubscriptionLocalSyncManager _synchronizedSubscriptionsDidChange]((uint64_t)self);
    uint64_t v13 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    uint64_t v14 = __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke_2;
  }
  else
  {
    uint64_t v13 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    uint64_t v14 = __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke;
  }
  void v13[2] = v14;
  v13[3] = &unk_1E53DA028;
  void v13[4] = v12;
  id v15 = v12;
  dispatch_async(v11, v13);
}

void __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __129__GEOMapDataSubscriptionLocalSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __118__GEOMapDataSubscriptionLocalSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v13 = objc_alloc_init(GEOPairedDeviceSubscriptionStartStopDownloadRequest);
  uint64_t v7 = (void *)[v6 mutableCopy];

  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v13 setIdentifiers:v7];
  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v13 setShouldDownload:1];
  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v13 setMode:a4];
  uint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1E9115A48);
  if (UInteger == 2)
  {
    id v10 = +[GEOPairedDeviceConnection sharedInstance];
    [v10 sendStartStopSubscriptionDownload:v13];
  }
  else
  {
    if (UInteger != 1)
    {
      if (UInteger) {
        goto LABEL_8;
      }
      uint64_t v9 = +[GEOPairedDeviceConnection sharedInstance];
      [v9 sendStartStopSubscriptionDownload:v13];
    }
    id v10 = -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection]((uint64_t)self);
    uint64_t v11 = [v10 remoteObjectProxy];
    id v12 = [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v13 data];
    [v11 startOrStopDownloadForSubscriptionIdentifiers:v12];
  }
LABEL_8:
}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_alloc_init(GEOPairedDeviceSubscriptionStartStopDownloadRequest);
  id v5 = (void *)[v4 mutableCopy];

  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v11 setIdentifiers:v5];
  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v11 setShouldDownload:0];
  uint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_SubscriptionIDSMessagesMode, (uint64_t)off_1E9115A48);
  if (UInteger == 2)
  {
    BOOL v8 = +[GEOPairedDeviceConnection sharedInstance];
    [v8 sendStartStopSubscriptionDownload:v11];
  }
  else
  {
    if (UInteger != 1)
    {
      if (UInteger) {
        goto LABEL_8;
      }
      uint64_t v7 = +[GEOPairedDeviceConnection sharedInstance];
      [v7 sendStartStopSubscriptionDownload:v11];
    }
    BOOL v8 = -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceDaemonConnection]((uint64_t)self);
    uint64_t v9 = [v8 remoteObjectProxy];
    id v10 = [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)v11 data];
    [v9 startOrStopDownloadForSubscriptionIdentifiers:v10];
  }
LABEL_8:
}

uint64_t __125__GEOMapDataSubscriptionLocalSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(GEOPairedDeviceGetStorageInfoRequest);
  BOOL v8 = +[GEOPairedDeviceConnection sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E53ED348;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 sendGetStorageInfo:v7 withReply:v11];
}

void __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E53D95B8;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __128__GEOMapDataSubscriptionLocalSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) hasAvailableStorageBytesOfflineMaps]) {
    uint64_t v3 = [*(id *)(a1 + 32) availableStorageBytesOfflineMaps];
  }
  else {
    uint64_t v3 = -1;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

- (void)setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [[GEOPairedDeviceSubscriptionStatesSummary alloc] initWithData:v10];

  if (v11)
  {
    [(GEOMapDataSubscriptionLocalSyncManager *)self setPairedDeviceSubscriptionsSummary:v11 callbackQueue:v8 completionHandler:v9];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: summary", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__GEOMapDataSubscriptionLocalSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v13 = v9;
    dispatch_async(v8, block);
  }
}

void __120__GEOMapDataSubscriptionLocalSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"Invalid serialized summary data"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E53D94C8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = GEOGetSubscriptionsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received new subscription state summary", buf, 2u);
  }

  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v3 = -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(void *)(a1 + 32));
  *(void *)long long buf = 0;
  v48 = buf;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__89;
  v51 = __Block_byref_object_dispose__89;
  id v52 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  id v40 = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_85;
  id v41 = &unk_1E53ED370;
  v45 = buf;
  uint64_t v42 = v4;
  id v5 = v3;
  id v43 = v5;
  v46 = &v53;
  id v44 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  if (!*((void *)v48 + 5))
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_2;
    v36[3] = &unk_1E53DA028;
    long long v27 = *(NSObject **)(a1 + 48);
    id v37 = *(id *)(a1 + 56);
    dispatch_async(v27, v36);
    id v6 = v37;
    goto LABEL_18;
  }
  id v6 = +[GEOPairedDeviceFilePaths urlFor:forDevice:](GEOPairedDeviceFilePaths, "urlFor:forDevice:", 1);
  uint64_t v7 = [v6 URLByDeletingLastPathComponent];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v35 = 0;
    char v12 = [v11 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v13 = v35;

    if ((v12 & 1) == 0)
    {
      unint64_t v25 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long v57 = 138543362;
        id v58 = v13;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_FAULT, "[PairedDevice] Failed to create directory for paired device subscriptions state summary: %{public}@", v57, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_91;
      block[3] = &unk_1E53D7C50;
      id v19 = &v34;
      id v20 = *(NSObject **)(a1 + 48);
      id v26 = *(id *)(a1 + 56);
      id v22 = &v33;
      id v33 = v13;
      id v34 = v26;
      id v23 = v13;
      id v24 = block;
      goto LABEL_17;
    }
  }
  id v14 = [*(id *)(a1 + 40) data];
  id v15 = +[GEOPairedDeviceFilePaths urlFor:1 forDevice:*((void *)v48 + 5)];
  id v31 = 0;
  char v16 = [v14 writeToURL:v15 options:1073741825 error:&v31];
  id v17 = v31;

  if ((v16 & 1) == 0)
  {
    id v18 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long v57 = 138543362;
      id v58 = v17;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_FAULT, "[PairedDevice] Failed to write paired device subscriptions state summary: %{public}@", v57, 0xCu);
    }
  }
  if (*((unsigned char *)v54 + 24)) {
    notify_post(GEOMapDataSubscriptionManagerPairedDeviceOfflineLastUpdatedDateDidChangeDarwinNotification);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_92;
  v28[3] = &unk_1E53D7C50;
  id v19 = &v30;
  id v20 = *(NSObject **)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v22 = &v29;
  id v29 = v17;
  id v30 = v21;
  id v23 = v17;
  id v24 = v28;
LABEL_17:
  dispatch_async(v20, v24);

LABEL_18:
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v53, 8);
}

void __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_85(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 88));
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 lastUpdatedTimestamp];
    double v4 = v3;
    [*(id *)(a1 + 48) lastUpdatedTimestamp];
    char v6 = vabdd_f64(v4, v5) >= 0.00000011920929;
  }
  else
  {
    char v6 = [*(id *)(a1 + 48) hasLastUpdatedTimestamp];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = (id *)(*(void *)(a1 + 32) + 104);

  objc_storeStrong(v8, v7);
}

void __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"No supported active device"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_91(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __110__GEOMapDataSubscriptionLocalSyncManager_setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __125__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke;
  v8[3] = &unk_1E53D7C50;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);
}

void __125__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 data];
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v2, 0);
}

- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__89;
  long long v27 = __Block_byref_object_dispose__89;
  id v28 = 0;
  v20[2] = MEMORY[0x1E4F143A8];
  v20[3] = 3221225472;
  v20[4] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v20[5] = &unk_1E53DC248;
  id v22 = &v23;
  v20[6] = self;
  id v11 = v8;
  id v21 = v11;
  geo_isolate_sync_data();
  if (v24[5])
  {
    char v12 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 141558275;
      uint64_t v30 = 1752392040;
      __int16 v31 = 2113;
      id v32 = v11;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "[PairedDevice] Returning cached state for currently-observed subscription '%{private, mask.hash}@'", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_93;
    block[3] = &unk_1E53DBFB0;
    id v13 = (id *)v20;
    v20[0] = v10;
    v20[1] = &v23;
    dispatch_async(v9, block);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    v14[3] = &unk_1E53DC000;
    id v18 = v10;
    id v15 = v11;
    char v16 = self;
    id v17 = v9;
    [(GEOMapDataSubscriptionLocalSyncManager *)self fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:v17 completionHandler:v14];

    id v13 = &v18;
  }

  _Block_object_dispose(&v23, 8);
}

void __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v14 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v25 = (uint64_t)v6;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "[PairedDevice] Error fetching list of synced subscription identifiers. Failing to return state: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v5 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v14 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 141558275;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2113;
      uint64_t v27 = v15;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "[PairedDevice] Subscription '%{private, mask.hash}@' is not in the list of synced subscriptions. Returning null state", buf, 0x16u);
    }
LABEL_13:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_18;
  }
  id v7 = objc_alloc_init(GEOMapDataSubscriptionState);
  id v8 = -[GEOMapDataSubscriptionLocalSyncManager _pairedDeviceSubscriptionStatesSummary](*(void *)(a1 + 40));
  id v9 = [v8 subscriptionStatesForKey:*(void *)(a1 + 32)];
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v8 && [v9 fullyDownloaded])
  {
    int v11 = [v8 isUpdateAvailable];
    uint64_t v12 = 0;
    if (v11) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
  }
  else
  {
    char v16 = +[GEOPairedDeviceConnection sharedInstance];
    char v17 = [v16 isConnected];

    if ((v17 & 1) == 0) {
      [v10 setObject:&unk_1ED73E290 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingReasonKey"];
    }
    uint64_t v13 = 0;
    uint64_t v12 = 5;
  }
  -[GEOMapDataSubscriptionState _setLoadState:downloadState:downloadProgress:lastError:downloadedDataCount:downloadedDataSize:userInfo:]((uint64_t)v7, v13, v12, 0, 0, 0, 0, v10);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_96;
  v21[3] = &unk_1E53D7C50;
  id v18 = *(NSObject **)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v22 = v7;
  id v23 = v19;
  id v20 = v7;
  dispatch_async(v18, v21);

LABEL_18:
}

uint64_t __126__GEOMapDataSubscriptionLocalSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:(id)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = a3;
  geo_isolate_sync_data();
  if (*((unsigned char *)v6 + 24)) {
    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice]((uint64_t)self);
  }

  _Block_object_dispose(&v5, 8);
}

uint64_t __104__GEOMapDataSubscriptionLocalSyncManager_beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 56) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result ^ 1;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 56);
    return [v4 addObject:v3];
  }
  return result;
}

- (void)endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:(id)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = a3;
  geo_isolate_sync_data();
  if (*((unsigned char *)v6 + 24)) {
    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice]((uint64_t)self);
  }

  _Block_object_dispose(&v5, 8);
}

uint64_t __102__GEOMapDataSubscriptionLocalSyncManager_endMonitoringStateForPairedDeviceSubscriptionWithIdentifier___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 56) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    [*(id *)(a1[4] + 56) removeObject:a1[5]];
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 64);
    return [v4 removeObjectForKey:v3];
  }
  return result;
}

void __100__GEOMapDataSubscriptionLocalSyncManager__updateObservedStateSubscriptionIdentifiersForPairedDevice__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__89;
  uint64_t v25 = __Block_byref_object_dispose__89;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  char v17 = __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke;
  id v18 = &unk_1E53D89C0;
  id v19 = self;
  id v20 = &v21;
  geo_isolate_sync_data();
  char v8 = objc_alloc_init(GEOPairedDeviceSubscriptionStateSynchronizationRequest);
  id v9 = (void *)[(id)v22[5] mutableCopy];
  [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)v8 setIdentifiersToObserves:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke_2;
  v12[3] = &unk_1E53D7C50;
  uint64_t v13 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v6, v12);

  _Block_object_dispose(&v21, 8);
}

void __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __137__GEOMapDataSubscriptionLocalSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) data];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [[GEOPairedDeviceSubscriptionStateUpdate alloc] initWithData:v8];
    if (v11)
    {
      [(GEOMapDataSubscriptionLocalSyncManager *)self handlePairedDeviceStateUpdate:v11 callbackQueue:v9 completionHandler:v10];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke_2;
      v12[3] = &unk_1E53DA028;
      id v13 = v10;
      dispatch_async(v9, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: serializedUpdate != ((void *)0)", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    uint64_t v15 = (GEOPairedDeviceSubscriptionStateUpdate *)v10;
    dispatch_async(v9, block);
    id v11 = v15;
  }
}

void __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __114__GEOMapDataSubscriptionLocalSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)handlePairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 identifier];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__89;
  id v18 = __Block_byref_object_dispose__89;
  id v19 = 0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync();
  uint64_t v12 = v15[5];
  if (v12)
  {
    -[GEOMapDataSubscriptionState _updateWithPairedDeviceState:](v12, v8);
    id v13 = [(GEOMapDataSubscriptionLocalSyncManager *)self delegate];
    [v13 syncManager:self didUpdatePairedDeviceState:v15[5] forIdentifier:v11];
  }
  else
  {
    -[GEOMapDataSubscriptionLocalSyncManager _updateObservedStateSubscriptionIdentifiersForPairedDevice]((uint64_t)self);
  }

  _Block_object_dispose(&v14, 8);
}

void __104__GEOMapDataSubscriptionLocalSyncManager_handlePairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1[4] + 56) containsObject:a1[5]];
  uint64_t v3 = GEOGetSubscriptionsLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = a1[5];
      int v13 = 141558275;
      uint64_t v14 = 1752392040;
      __int16 v15 = 2113;
      uint64_t v16 = v5;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received state update for subscription '%{private, mask.hash}@'", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v6 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (!*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v9 = objc_alloc_init(GEOMapDataSubscriptionState);
      uint64_t v10 = *(void *)(a1[6] + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [*(id *)(a1[4] + 64) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v12 = a1[5];
      int v13 = 141558275;
      uint64_t v14 = 1752392040;
      __int16 v15 = 2113;
      uint64_t v16 = v12;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received state update for non-observed subscription '%{private, mask.hash}@'", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (GEOMapDataSubscriptionPersistence)persistence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistence);

  return (GEOMapDataSubscriptionPersistence *)WeakRetained;
}

- (GEOMapDataSubscriptionSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceDaemonConnection, 0);
  objc_storeStrong((id *)&self->_subscriptionsSummary, 0);
  objc_storeStrong(&self->_featureFlagObserver, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_initialNanoRegistryFetchGroup, 0);
  objc_storeStrong((id *)&self->_observedStates, 0);
  objc_storeStrong((id *)&self->_observedIdentifiers, 0);
  objc_storeStrong((id *)&self->_offlineDataConfiguration, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_persistence);
}

@end
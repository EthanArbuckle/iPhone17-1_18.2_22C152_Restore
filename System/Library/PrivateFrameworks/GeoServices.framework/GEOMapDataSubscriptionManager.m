@interface GEOMapDataSubscriptionManager
+ (GEOMapDataSubscriptionManager)sharedManager;
+ (void)_setSharedManagerUseLocalPersistence:(BOOL)a3;
- (GEOMapDataSubscriptionManager)init;
- (GEOMapDataSubscriptionManager)initWithPersistence:(id)a3 downloadManager:(id)a4 syncManager:(id)a5;
- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 dataTypes:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_addStateObserver:(id)a3;
- (void)_addStateObserver:(id)a3 forPairedDeviceSubscriptionWithIdentifier:(id)a4;
- (void)_addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11;
- (void)_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)_externallyManagedDownloaderDidFinish:(id)a3 withError:(id)a4;
- (void)_fetchFullyDownloadedSubscriptionsOfType:(unint64_t)a3 includeOutOfDate:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)_fetchSubscriptionsForSyncToWatch:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4 auditToken:(id)a5;
- (void)_handlePairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_registerExternallyManagedDownloader:(id)a3;
- (void)_removeStateObserver:(id)a3;
- (void)_removeStateObserver:(id)a3 forPairedDeviceSubscriptionWithIdentifier:(id)a4;
- (void)_runAutomaticOfflineDataUpdateBackgroundTask:(id)a3;
- (void)_runRetryOfflineDownloadBackgroundTask:(id)a3;
- (void)_setNeedsPairedDeviceStateSynchronization;
- (void)_setPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_setSubscriptionShouldSyncToPairedDeviceWithRequest:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5;
- (void)addSubscriptionWithIdentifier:(id)a3 dataTypes:(unint64_t)a4 policy:(int64_t)a5 region:(id)a6 displayName:(id)a7 expirationDate:(id)a8 callbackQueue:(id)a9 completionHandler:(id)a10;
- (void)addSubscriptionWithIdentifier:(id)a3 dataTypes:(unint64_t)a4 policy:(int64_t)a5 region:(id)a6 expirationDate:(id)a7 callbackQueue:(id)a8 completionHandler:(id)a9;
- (void)cancelDownloadForPairedDeviceSubscriptionIdentifier:(id)a3;
- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3;
- (void)cancelDownloadForSubscriptionIdentifier:(id)a3;
- (void)cancelDownloadForSubscriptionIdentifiers:(id)a3;
- (void)downloadManager:(id)a3 didUpdateState:(id)a4 forIdentifier:(id)a5;
- (void)downloadManager:(id)a3 fetchShouldSyncToActivePairedDeviceForIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchAllExpiredSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchAllSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchStateForSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4;
- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)startDownloadForPairedDeviceSubscriptionIdentifier:(id)a3 mode:(unint64_t)a4;
- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4;
- (void)startDownloadForSubscriptionIdentifier:(id)a3 mode:(unint64_t)a4;
- (void)startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4;
- (void)subscriptionPersistence:(id)a3 didAddSubscription:(id)a4;
- (void)subscriptionPersistence:(id)a3 didRemoveSubscriptionWithIdentifier:(id)a4;
- (void)subscriptionPersistence:(id)a3 didUpdateSubscriptionWithIdentifier:(id)a4;
- (void)syncManager:(id)a3 didUpdatePairedDeviceState:(id)a4 forIdentifier:(id)a5;
- (void)syncManager:(id)a3 fetchStateForSubscriptionWithIdentifier:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation GEOMapDataSubscriptionManager

- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchAllSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
}

- (GEOMapDataSubscriptionManager)initWithPersistence:(id)a3 downloadManager:(id)a4 syncManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GEOMapDataSubscriptionManager;
  v11 = [(GEOMapDataSubscriptionManager *)&v26 init];
  if (v11)
  {
    uint64_t v12 = geo_isolater_create();
    isolation = v11->_isolation;
    v11->_isolation = (geo_isolater *)v12;

    if (v8) {
      v14 = (GEOMapDataSubscriptionRemotePersistence *)v8;
    }
    else {
      v14 = objc_alloc_init(GEOMapDataSubscriptionRemotePersistence);
    }
    persistence = v11->_persistence;
    v11->_persistence = (GEOMapDataSubscriptionPersistence *)v14;

    [(GEOMapDataSubscriptionPersistence *)v11->_persistence setDelegate:v11];
    if (v9) {
      v16 = (GEOMapDataSubscriptionRemoteDownloadManager *)v9;
    }
    else {
      v16 = objc_alloc_init(GEOMapDataSubscriptionRemoteDownloadManager);
    }
    downloadManager = v11->_downloadManager;
    v11->_downloadManager = (GEOMapDataSubscriptionDownloadManager *)v16;

    [(GEOMapDataSubscriptionDownloadManager *)v11->_downloadManager setDelegate:v11];
    if (v10) {
      v18 = (GEOMapDataSubscriptionRemoteSyncManager *)v10;
    }
    else {
      v18 = objc_alloc_init(GEOMapDataSubscriptionRemoteSyncManager);
    }
    syncManager = v11->_syncManager;
    v11->_syncManager = (GEOMapDataSubscriptionSyncManager *)v18;

    [(GEOMapDataSubscriptionSyncManager *)v11->_syncManager setDelegate:v11];
    uint64_t v20 = geo_dispatch_queue_create_with_qos();
    stateObservationQueue = v11->_stateObservationQueue;
    v11->_stateObservationQueue = (OS_dispatch_queue *)v20;

    v22 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED835FF0 queue:v11->_stateObservationQueue];
    stateObservers = v11->_stateObservers;
    v11->_stateObservers = v22;

    v24 = v11;
  }

  return v11;
}

+ (GEOMapDataSubscriptionManager)sharedManager
{
  if (qword_1EB2A0368 != -1) {
    dispatch_once(&qword_1EB2A0368, &__block_literal_global_169);
  }
  v2 = (void *)qword_1EB2A0360;

  return (GEOMapDataSubscriptionManager *)v2;
}

- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
}

- (void)_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
}

- (GEOMapDataSubscriptionManager)init
{
  return [(GEOMapDataSubscriptionManager *)self initWithPersistence:0 downloadManager:0 syncManager:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceStateObservers, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_stateObservationQueue, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchAllExpiredSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
}

+ (void)_setSharedManagerUseLocalPersistence:(BOOL)a3
{
  if (qword_1EB2A0360 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _sSingleton == nil", v4, 2u);
  }
  _MergedGlobals_308 = a3;
}

void __46__GEOMapDataSubscriptionManager_sharedManager__block_invoke()
{
  if (_MergedGlobals_308)
  {
    v0 = _GEOGetSharedTileDB();
    if (v0)
    {
      v1 = [GEOMapDataSubscriptionLocalPersistence alloc];
      v2 = +[GEOOfflineDataConfiguration sharedConfiguration];
      v3 = [(GEOMapDataSubscriptionLocalPersistence *)v1 initWithTileDB:v0 offlineDataConfiguration:v2];

      v4 = [GEOMapDataSubscriptionLocalDownloadManager alloc];
      v5 = +[GEOOfflineDataConfiguration sharedConfiguration];
      v6 = [(GEOMapDataSubscriptionLocalDownloadManager *)v4 initWithTileDB:v0 dataConfiguration:v5];

      v7 = [GEOMapDataSubscriptionLocalSyncManager alloc];
      id v8 = +[GEOOfflineDataConfiguration sharedConfiguration];
      id v9 = [(GEOMapDataSubscriptionLocalSyncManager *)v7 initWithPersistence:v3 tileDB:v0 dataConfiguration:v8];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: diskCache != nil", v12, 2u);
      }
      id v9 = 0;
      v6 = 0;
      v3 = 0;
    }
  }
  else
  {
    id v9 = 0;
    v6 = 0;
    v3 = 0;
  }
  id v10 = [[GEOMapDataSubscriptionManager alloc] initWithPersistence:v3 downloadManager:v6 syncManager:v9];
  v11 = (void *)qword_1EB2A0360;
  qword_1EB2A0360 = (uint64_t)v10;
}

- (void)addSubscriptionWithIdentifier:(id)a3 dataTypes:(unint64_t)a4 policy:(int64_t)a5 region:(id)a6 expirationDate:(id)a7 callbackQueue:(id)a8 completionHandler:(id)a9
{
}

- (void)addSubscriptionWithIdentifier:(id)a3 dataTypes:(unint64_t)a4 policy:(int64_t)a5 region:(id)a6 displayName:(id)a7 expirationDate:(id)a8 callbackQueue:(id)a9 completionHandler:(id)a10
{
  id v17 = a10;
  persistence = self->_persistence;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __146__GEOMapDataSubscriptionManager_addSubscriptionWithIdentifier_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke;
  v20[3] = &unk_1E53EBB10;
  id v21 = v17;
  id v19 = v17;
  [(GEOMapDataSubscriptionPersistence *)persistence addSubscriptionWithIdentifier:a3 auditToken:0 dataTypes:a4 policy:a5 region:a6 displayName:a7 expirationDate:a8 callbackQueue:a9 completionHandler:v20];
}

uint64_t __146__GEOMapDataSubscriptionManager_addSubscriptionWithIdentifier_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)_addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11
{
}

- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchStateForSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)_registerExternallyManagedDownloader:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager registerExternallyManagedDownloader:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(registerExternallyManagedDownloader:)]", v5, 2u);
  }
}

- (void)_externallyManagedDownloaderDidFinish:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager externallyManagedDownloaderDidFinish:v6 withError:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(externallyManagedDownloaderDidFinish:withError:)]", v8, 2u);
  }
}

- (void)startDownloadForSubscriptionIdentifier:(id)a3 mode:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  downloadManager = self->_downloadManager;
  id v9 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v9 count:1];
  -[GEOMapDataSubscriptionDownloadManager startDownloadForSubscriptionIdentifiers:mode:auditToken:](downloadManager, "startDownloadForSubscriptionIdentifiers:mode:auditToken:", v8, a4, 0, v9, v10);
}

- (void)startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
}

- (void)_startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
}

- (void)cancelDownloadForSubscriptionIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  downloadManager = self->_downloadManager;
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  -[GEOMapDataSubscriptionDownloadManager cancelDownloadForSubscriptionIdentifiers:](downloadManager, "cancelDownloadForSubscriptionIdentifiers:", v6, v7, v8);
}

- (void)cancelDownloadForSubscriptionIdentifiers:(id)a3
{
}

- (void)forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4
{
}

- (void)_forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
}

- (void)_runAutomaticOfflineDataUpdateBackgroundTask:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager runAutomaticOfflineDataUpdateBackgroundTask:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(runAutomaticOfflineDataUpdateBackgroundTask:)]", v5, 2u);
  }
}

- (void)_runRetryOfflineDownloadBackgroundTask:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager runRetryOfflineDownloadBackgroundTask:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(runRetryOfflineDownloadBackgroundTask:)]", v5, 2u);
  }
}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 dataTypes:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6
{
  return (id)[(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager determineEstimatedSizeForSubscriptionWithRegion:a3 dataTypes:a4 queue:a5 completionHandler:a6];
}

- (void)_fetchSubscriptionsForSyncToWatch:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 pairingID];
  [(GEOMapDataSubscriptionManager *)self _fetchSubscriptionsForSyncToWatchWithIdentifier:v10 callbackQueue:v9 completionHandler:v8];
}

- (void)_fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)_fetchFullyDownloadedSubscriptionsOfType:(unint64_t)a3 includeOutOfDate:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E53EBB88;
  id v17 = v11;
  unint64_t v18 = a3;
  id v15 = v10;
  v16 = self;
  BOOL v19 = a4;
  id v12 = v11;
  id v13 = v10;
  [(GEOMapDataSubscriptionManager *)self fetchAllSubscriptionsWithCallbackQueue:v13 completionHandler:v14];
}

void __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v18 = v5;
  id v19 = a3;
  if (v5)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_3;
    v41[3] = &__block_descriptor_40_e32_B16__0__GEOMapDataSubscription_8l;
    v41[4] = *(void *)(a1 + 56);
    uint64_t v20 = objc_msgSend(v5, "_geo_filtered:", v41);
    if ([v20 count])
    {
      id v6 = dispatch_group_create();
      v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__80;
      v37[4] = __Block_byref_object_dispose__80;
      id v38 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v20;
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v34 != v8) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            dispatch_group_enter(v6);
            id v11 = *(void **)(a1 + 40);
            id v12 = [v10 identifier];
            uint64_t v13 = *(void *)(a1 + 32);
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_86;
            v27[3] = &unk_1E53EBB38;
            v31 = v37;
            id v28 = v22;
            v29 = v10;
            char v32 = *(unsigned char *)(a1 + 64);
            v30 = v6;
            [v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:v13 completionHandler:v27];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v7);
      }

      v14 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2_88;
      block[3] = &unk_1E53EBB60;
      id v25 = *(id *)(a1 + 48);
      objc_super v26 = v37;
      id v24 = v22;
      id v15 = v22;
      dispatch_group_notify(v6, v14, block);

      _Block_object_dispose(v37, 8);
    }
    else
    {
      id v17 = *(NSObject **)(a1 + 32);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_4;
      v39[3] = &unk_1E53DA028;
      v40 = *(id *)(a1 + 48);
      dispatch_async(v17, v39);
      id v6 = v40;
    }
  }
  else
  {
    v16 = *(NSObject **)(a1 + 32);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2;
    v42[3] = &unk_1E53D7C50;
    id v44 = *(id *)(a1 + 48);
    id v43 = v19;
    dispatch_async(v16, v42);
  }
}

uint64_t __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

BOOL __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & [a2 dataTypes]) != 0;
}

uint64_t __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    goto LABEL_8;
  }
  uint64_t v6 = [v7 loadState];
  if (v6 == 1)
  {
    if (!*(unsigned char *)(a1 + 64)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v6 == 2) {
LABEL_7:
  }
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2_88(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[4];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifier:(id)a3 mode:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  syncManager = self->_syncManager;
  id v9 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v9 count:1];
  -[GEOMapDataSubscriptionSyncManager startDownloadForPairedDeviceSubscriptionIdentifiers:mode:](syncManager, "startDownloadForPairedDeviceSubscriptionIdentifiers:mode:", v8, a4, v9, v10);
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  syncManager = self->_syncManager;
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];
  -[GEOMapDataSubscriptionSyncManager cancelDownloadForPairedDeviceSubscriptionIdentifiers:](syncManager, "cancelDownloadForPairedDeviceSubscriptionIdentifiers:", v6, v7, v8);
}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3
{
}

- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
}

- (void)_addStateObserver:(id)a3
{
}

- (void)_removeStateObserver:(id)a3
{
}

- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)_addStateObserver:(id)a3 forPairedDeviceSubscriptionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v8 = v7;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  geo_isolate_sync_data();
  if (*((unsigned char *)v14 + 24)) {
    -[GEOMapDataSubscriptionSyncManager beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:](self->_syncManager, "beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:", v8, v10, 3221225472, __93__GEOMapDataSubscriptionManager__addStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke, &unk_1E53DC438, self, v8, v9, &v13);
  }

  _Block_object_dispose(&v13, 8);
}

void __93__GEOMapDataSubscriptionManager__addStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v2 == 0;
  if (!v2)
  {
    if (!*(void *)(a1[4] + 56))
    {
      uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v4 = a1[4];
      id v5 = *(void **)(v4 + 56);
      *(void *)(v4 + 56) = v3;
    }
    id v6 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED835FF0 queue:*(void *)(a1[4] + 16)];
    [*(id *)(a1[4] + 56) setObject:v6 forKeyedSubscript:a1[5]];
    uint64_t v2 = v6;
  }
  id v7 = v2;
  [v2 registerObserver:a1[6]];
}

- (void)_removeStateObserver:(id)a3 forPairedDeviceSubscriptionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v8 = v7;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  geo_isolate_sync_data();
  if (*((unsigned char *)v14 + 24)) {
    -[GEOMapDataSubscriptionSyncManager endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:](self->_syncManager, "endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:", v8, v10, 3221225472, __96__GEOMapDataSubscriptionManager__removeStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke, &unk_1E53E1400, self, v8, v9, &v13);
  }

  _Block_object_dispose(&v13, 8);
}

void __96__GEOMapDataSubscriptionManager__removeStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  [v2 unregisterObserver:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 hasObservers] ^ 1;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    [*(id *)(a1[4] + 56) removeObjectForKey:a1[5]];
  }
}

- (void)_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
}

- (void)_handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)_handlePairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(GEOMapDataSubscriptionSyncManager *)self->_syncManager handlePairedDeviceStateUpdate:v8 callbackQueue:v10 completionHandler:v9];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__GEOMapDataSubscriptionManager__handlePairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v12 = v9;
    dispatch_async(v10, block);

    uint64_t v10 = v12;
  }
}

void __96__GEOMapDataSubscriptionManager__handlePairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)_setPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(GEOMapDataSubscriptionSyncManager *)self->_syncManager setPairedDeviceSubscriptionsSummary:v8 callbackQueue:v10 completionHandler:v9];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__GEOMapDataSubscriptionManager__setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v12 = v9;
    dispatch_async(v10, block);

    uint64_t v10 = v12;
  }
}

void __102__GEOMapDataSubscriptionManager__setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_setSubscriptionShouldSyncToPairedDeviceWithRequest:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest alloc] initWithData:v10];

  if ([(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)v11 hasIdentifier])
  {
    id v12 = [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)v11 identifier];
    uint64_t v13 = [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)v11 shouldSyncToPairedDevice];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke_2;
    v17[3] = &unk_1E53DB698;
    v14 = &v18;
    id v18 = v9;
    id v15 = v9;
    [(GEOMapDataSubscriptionManager *)self setSubscriptionWithIdentifier:v12 shouldSyncToPairedDevice:v13 callbackQueue:v8 completionHandler:v17];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    v14 = &v20;
    id v20 = v9;
    id v16 = v9;
    dispatch_async(v8, block);
  }
}

void __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    id v6 = objc_alloc_init(GEOPairedDeviceConfigureSubscriptionShouldSyncReply);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [(GEOPairedDeviceConfigureSubscriptionShouldSyncReply *)v6 data];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

- (void)_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
}

- (void)_setNeedsPairedDeviceStateSynchronization
{
  if (objc_opt_respondsToSelector())
  {
    syncManager = self->_syncManager;
    [(GEOMapDataSubscriptionSyncManager *)syncManager setNeedsPairedDeviceStateSynchronization];
  }
}

- (void)downloadManager:(id)a3 didUpdateState:(id)a4 forIdentifier:(id)a5
{
}

- (void)downloadManager:(id)a3 fetchShouldSyncToActivePairedDeviceForIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8) & 1) == 0)
  {
    qos_class_self();
    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v24 = v8;
    dispatch_async(global_queue, block);

    id v10 = v24;
    goto LABEL_9;
  }
  if (!NanoRegistryLibraryCore())
  {
    id v10 = 0;
LABEL_7:
    qos_class_self();
    id v16 = geo_get_global_queue();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_3;
    v18[3] = &unk_1E53DA028;
    id v15 = &v19;
    id v19 = v8;
    dispatch_async(v16, v18);
    goto LABEL_8;
  }
  id v9 = [getNRPairedDeviceRegistryClass() sharedInstance];
  id v10 = [v9 getActivePairedDeviceExcludingAltAccount];

  if (!v10) {
    goto LABEL_7;
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"];
  int v12 = [v10 supportsCapability:v11];

  if (!v12) {
    goto LABEL_7;
  }
  syncManager = self->_syncManager;
  qos_class_self();
  v14 = (void *)geo_get_global_queue();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_2;
  v20[3] = &unk_1E53DECB8;
  id v15 = &v22;
  id v22 = v8;
  id v21 = v7;
  [(GEOMapDataSubscriptionSyncManager *)syncManager fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:v14 completionHandler:v20];

  id v16 = v21;
LABEL_8:

LABEL_9:
}

uint64_t __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [a2 containsObject:*(void *)(a1 + 32)];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

uint64_t __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionPersistence:(id)a3 didAddSubscription:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager didAddSubscription:v5];
  }
  if (objc_opt_respondsToSelector()) {
    [(GEOMapDataSubscriptionSyncManager *)self->_syncManager didAddSubscription:v5];
  }
}

- (void)subscriptionPersistence:(id)a3 didUpdateSubscriptionWithIdentifier:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [(GEOMapDataSubscriptionSyncManager *)self->_syncManager didUpdateSubscriptionWithIdentifier:v5];
  }
}

- (void)subscriptionPersistence:(id)a3 didRemoveSubscriptionWithIdentifier:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [(GEOMapDataSubscriptionDownloadManager *)self->_downloadManager didRemoveSubscriptionWithIdentifier:v5];
  }
  [(GEOMapDataSubscriptionPersistence *)self->_persistence pruneShiftEntries];
}

- (void)syncManager:(id)a3 didUpdatePairedDeviceState:(id)a4 forIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__80;
  id v15 = __Block_byref_object_dispose__80;
  id v16 = 0;
  id v10 = a5;
  geo_isolate_sync_data();
  [(id)v12[5] subscriptionManager:self didUpdatePairedDeviceState:v9 forIdentifier:v10];

  _Block_object_dispose(&v11, 8);
}

void __86__GEOMapDataSubscriptionManager_syncManager_didUpdatePairedDeviceState_forIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)syncManager:(id)a3 fetchStateForSubscriptionWithIdentifier:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
}

@end
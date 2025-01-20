@interface GEOMapDataSubscriptionLocalDownloadManager
+ (Class)_backgroundTaskSchedulerClass;
- (GEOMapDataSubscriptionDownloadManagerDelegate)delegate;
- (GEOMapDataSubscriptionLocalDownloadManager)initWithTileDB:(id)a3 dataConfiguration:(id)a4;
- (_GEOMapDataSubscriptionDownloadState)_stateForSubscriptionWithIdentifier:(uint64_t)a1;
- (id)_createDownloaderForSubscription:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 dataTypes:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6;
- (uint64_t)_stopObservingWaitingConditionsIfNecessary;
- (void)_cancelCurrentUpdateSession:(int)a3 dueToTaskDeferral:;
- (void)_cancelDownloadForSubscriptionIdentifier:(int)a3 shouldPersistPausedState:;
- (void)_cancelDownloadGroup:(uint64_t)a1 startNextDownloadIfNecessary:(void *)a2 dueToTaskDeferral:(int)a3;
- (void)_determineAutomaticOfflineUpdateDelay:(uint64_t)a1;
- (void)_determineIfShouldScheduleAutomaticUpdate:(uint64_t)a1;
- (void)_enqueueDownloadForSubscriptions:(uint64_t)a3 mode:(void *)a4 auditToken:(uint64_t)a5 reason:(uint64_t)a6 updateType:(int)a7 enqueueAtHead:;
- (void)_ensureOfflineRetryTaskScheduled:(uint64_t)a1;
- (void)_finishedDownloadGroup:(uint64_t)a1;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_offlineRetryBackgroundTaskFired:(char)a3 onlyWaitingForNonCellular:;
- (void)_scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:(double)a3 onlyWaitingForNonCellular:;
- (void)_scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:(double)a3 maxRandomizedDelay:;
- (void)_startNextDownloadIfNecessary;
- (void)_startObservingWaitingConditionsIfNecessary;
- (void)_startObservingWaitingConditionsIfNecessaryForIdentifier:(void *)a3 state:;
- (void)_startUpdateForUserInitiatedSubscriptionsForDataType:(uint64_t)a3 mode:(uint64_t)a4 updateType:(void *)a5 auditToken:(void *)a6 forBackgroundTask:(void *)a7 startedHandler:;
- (void)_stopObservingWaitingConditionsIfNecessaryForIdentifier:(uint64_t)a1;
- (void)_updateStateForSubscriptionWithIdentifier:(void *)a3 callbackQueue:(void *)a4 completionHandler:;
- (void)_updateStateWithDownloadState:(void *)a3 forIdentifier:;
- (void)_updateStateWithDownloader:(void *)a3 forIdentifier:(void *)a4 error:;
- (void)_updateWaitingReasons;
- (void)cancelDownloadForSubscriptionIdentifiers:(id)a3;
- (void)dealloc;
- (void)didAddSubscription:(id)a3;
- (void)didAddSubscription:(id)a3 completionHandler:(id)a4;
- (void)didRemoveSubscriptionWithIdentifier:(id)a3;
- (void)externallyManagedDownloaderDidFinish:(id)a3 withError:(id)a4;
- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchStateForSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4 auditToken:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)offlineDataConfiguration:(id)a3 didChangeUpdateAvailability:(BOOL)a4;
- (void)registerExternallyManagedDownloader:(id)a3;
- (void)runAutomaticOfflineDataUpdateBackgroundTask:(id)a3;
- (void)runRetryOfflineDownloadBackgroundTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5;
- (void)subscriptionDownloadGroupDidDefer:(id)a3;
- (void)subscriptionDownloader:(id)a3 didFinishWithError:(id)a4;
- (void)subscriptionDownloader:(id)a3 willUseOfflineDataVersions:(id)a4 completionHandler:(id)a5;
@end

@implementation GEOMapDataSubscriptionLocalDownloadManager

void __117__GEOMapDataSubscriptionLocalDownloadManager_fetchLastUpdatedDateForOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) lastUpdatedDate];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __117__GEOMapDataSubscriptionLocalDownloadManager_fetchLastUpdatedDateForOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v8[3] = &unk_1E53D7C50;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);
}

void __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_4(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v31;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v31 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v30 + 1) + 8 * v4);
        id v6 = GEOGetSubscriptionsDownloadManagerLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v7 = [v5 identifier];
          *(_DWORD *)buf = 141558275;
          uint64_t v35 = 1752392040;
          __int16 v36 = 2113;
          v37 = v7;
          _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Subscription '%{private, mask.hash}@' is queued for download", buf, 0x16u);
        }
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = [v5 identifier];
        uint64_t v10 = -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v8, v9);

        v11 = -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v10);
        BOOL v12 = v11 == 0;

        if (!v12)
        {
          if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloadersToCancel.count == 0", buf, 2u);
          }
          v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          if (!v13)
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
            v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;

            v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          }
          v17 = -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v10);
          [v13 addObject:v17];

          -[_GEOMapDataSubscriptionDownloadState setDownloader:](v10, 0);
        }
        if (v10)
        {
          uint64_t v18 = *(void *)(a1 + 64);
          os_unfair_lock_lock((os_unfair_lock_t)(v10 + 8));
          if (*(void *)(v10 + 56) != v18)
          {
            *(void *)(v10 + 56) = v18;
            -[_GEOMapDataSubscriptionDownloadState _updateProgressDownloadReason](v10);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
          -[_GEOMapDataSubscriptionDownloadState setQueuedForDownload:](v10, 1);
          uint64_t v19 = *(void *)(a1 + 72);
          os_unfair_lock_lock((os_unfair_lock_t)(v10 + 8));
          *(void *)(v10 + 40) = v19;
          os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
          uint64_t v20 = *(void *)(a1 + 80);
          os_unfair_lock_lock((os_unfair_lock_t)(v10 + 8));
          *(void *)(v10 + 48) = v20;
          os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
          v21 = *(void **)(v10 + 96);
        }
        else
        {
          -[_GEOMapDataSubscriptionDownloadState setQueuedForDownload:](0, 1);
          v21 = 0;
        }
        id v22 = v21;
        BOOL v23 = [v22 downloadState] == 5;
        uint64_t v24 = *(void *)(a1 + 40);
        v25 = [v5 identifier];
        if (v23) {
          -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v24, v25, (void *)v10);
        }
        else {
          -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v24, v25);
        }

        v26 = *(void **)(a1 + 48);
        v27 = [v5 identifier];
        [v26 setObject:v22 forKeyedSubscript:v27];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      uint64_t v2 = v28;
    }
    while (v28);
  }
}

- (void)subscriptionDownloader:(id)a3 willUseOfflineDataVersions:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  v11 = [(GEOOfflineDataConfiguration *)self->_dataConfiguration activeVersions];
  if ([v9 isEqualToDictionary:v11])
  {
    int BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1E9115858);

    if (!BOOL)
    {
      p_currentUpdateSession = (id *)&self->_currentUpdateSession;
      currentUpdateSession = self->_currentUpdateSession;
      if (!currentUpdateSession)
      {
        if ([(GEOOfflineDataConfiguration *)self->_dataConfiguration isUpdateAvailable])
        {
          dataConfiguration = self->_dataConfiguration;
          v16 = _getOfflineTileMetadata(self->_tileDB, v9);
          [(GEOOfflineDataConfiguration *)dataConfiguration updateCompletedWithVersions:v9 tileMetadata:v16];
        }
LABEL_17:
        v10[2](v10, 1);
        goto LABEL_18;
      }
LABEL_10:
      uint64_t v19 = [(GEOMapDataSubscriptionUpdateSession *)currentUpdateSession offlineDataVersions];

      id v20 = *p_currentUpdateSession;
      if (v19)
      {
        v21 = [v20 offlineDataVersions];
        char v22 = [v21 isEqualToDictionary:v9];

        if ((v22 & 1) == 0)
        {
          BOOL v23 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = [*p_currentUpdateSession completedSubscriptions];
            uint64_t v25 = [v24 count];
            *(_DWORD *)buf = 134349056;
            uint64_t v37 = v25;
            _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_INFO, "Latest offline data versions changed mid-update. Will re-download %{public}llu subscriptions which had already been updated", buf, 0xCu);
          }
          [(GEOMapDataSubscriptionUpdateSession *)self->_currentUpdateSession setOfflineDataVersions:v9];
          v26 = [(GEOMapDataSubscriptionDownloadGroup *)self->_currentUpdateSession completedSubscriptions];
          [(GEOMapDataSubscriptionDownloadGroup *)self->_currentUpdateSession restartedSubscriptions:v26];
          uint64_t v27 = [(GEOMapDataSubscriptionDownloadGroup *)self->_currentUpdateSession downloadMode];
          uint64_t v28 = [(GEOMapDataSubscriptionDownloadGroup *)self->_currentUpdateSession auditToken];
          -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:]((uint64_t)self, v26, v27, v28, 3, [(GEOMapDataSubscriptionUpdateSession *)self->_currentUpdateSession updateType], 1);
        }
      }
      else
      {
        [v20 setOfflineDataVersions:v9];
      }
      goto LABEL_17;
    }
  }
  else
  {
  }
  v17 = GEOGetSubscriptionsDownloadManagerLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [(GEOOfflineDataConfiguration *)self->_dataConfiguration activeVersions];
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = (uint64_t)v18;
    __int16 v38 = 2114;
    id v39 = v9;
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_INFO, "Latest offline data versions differ from active versions: %{public}@ -> %{public}@", buf, 0x16u);
  }
  [(GEOOfflineDataConfiguration *)self->_dataConfiguration setLatestAvailableVersions:v9];
  p_currentUpdateSession = (id *)&self->_currentUpdateSession;
  currentUpdateSession = self->_currentUpdateSession;
  if (currentUpdateSession) {
    goto LABEL_10;
  }
  tileDB = self->_tileDB;
  workQueue = self->_workQueue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke;
  v31[3] = &unk_1E53DC000;
  uint64_t v35 = v10;
  id v32 = v8;
  long long v33 = self;
  id v34 = v9;
  [(GEOTileDB *)tileDB fetchAllSubscriptionsWithQueue:workQueue callback:v31];

LABEL_18:
}

- (void)_startObservingWaitingConditionsIfNecessaryForIdentifier:(void *)a3 state:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    geo_assert_isolated();
    id v6 = *(void **)(a1 + 120);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
      id v8 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v7;

      id v6 = *(void **)(a1 + 120);
    }
    uint64_t v9 = [v6 count];
    [*(id *)(a1 + 120) addObject:v10];
    if (v9)
    {
      if (*(unsigned char *)(a1 + 128)) {
        -[_GEOMapDataSubscriptionDownloadState setWaitingUserInfo:]((uint64_t)v5, *(void **)(a1 + 136));
      }
    }
    else
    {
      -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessary](a1);
    }
  }
}

+ (Class)_backgroundTaskSchedulerClass
{
  uint64_t v2 = (void *)BackgroundSystemTasksLibraryCore();
  if (v2)
  {
    uint64_t v2 = getBGSystemTaskSchedulerClass();
  }

  return (Class)v2;
}

- (GEOMapDataSubscriptionLocalDownloadManager)initWithTileDB:(id)a3 dataConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)GEOMapDataSubscriptionLocalDownloadManager;
  uint64_t v9 = [(GEOMapDataSubscriptionLocalDownloadManager *)&v24 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tileDB, a3);
    objc_storeStrong((id *)&v10->_dataConfiguration, a4);
    uint64_t v11 = +[GEOResourceManifestManager modernManager];
    manifestManager = v10->_manifestManager;
    v10->_manifestManager = (GEOResourceManifestManager *)v11;

    uint64_t v13 = geo_dispatch_queue_create_with_workloop_qos();
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = geo_isolater_create();
    isolation = v10->_isolation;
    v10->_isolation = (geo_isolater *)v15;

    GEORegisterPListStateCaptureLegacy();
    v17 = +[GEOKeyBagNotification sharedObject];
    uint64_t v18 = v10->_workQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__GEOMapDataSubscriptionLocalDownloadManager_initWithTileDB_dataConfiguration___block_invoke;
    v22[3] = &unk_1E53D79D8;
    uint64_t v19 = v10;
    BOOL v23 = v19;
    [v17 runAfterFirstUnlock:v18 block:v22];

    id v20 = v19;
  }

  return v10;
}

void __79__GEOMapDataSubscriptionLocalDownloadManager_initWithTileDB_dataConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) registerObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2)
  {
    if ([v2[4] isUpdateAvailable])
    {
      objc_initWeak(&location, v2);
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      id v8 = __90__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineUpdateTaskScheduledIfNecessary__block_invoke;
      uint64_t v9 = &unk_1E53DBE98;
      objc_copyWeak(&v11, &location);
      id v10 = v2;
      -[GEOMapDataSubscriptionLocalDownloadManager _determineIfShouldScheduleAutomaticUpdate:]((uint64_t)v2, &v6);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_initWeak(&location, v3);
      uint64_t v4 = (void *)v3[8];
      uint64_t v5 = v3[1];
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      id v8 = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke;
      uint64_t v9 = &unk_1E53DA328;
      objc_copyWeak(&v11, &location);
      id v10 = (id *)v3;
      [v4 fetchAllSubscriptionsWithQueue:v5 callback:&v6];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)dealloc
{
  [(GEOOfflineDataConfiguration *)self->_dataConfiguration unregisterObserver:self];
  GEOUnregisterStateCaptureLegacy();
  subscriptionStates = self->_subscriptionStates;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__GEOMapDataSubscriptionLocalDownloadManager_dealloc__block_invoke;
  v5[3] = &unk_1E53DBE48;
  v5[4] = self;
  [(NSMutableDictionary *)subscriptionStates enumerateKeysAndObjectsUsingBlock:v5];
  v4.receiver = self;
  v4.super_class = (Class)GEOMapDataSubscriptionLocalDownloadManager;
  [(GEOMapDataSubscriptionLocalDownloadManager *)&v4 dealloc];
}

void __53__GEOMapDataSubscriptionLocalDownloadManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [&unk_1ED73EC20 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(&unk_1ED73EC20);
        }
        [v4 removeObserver:*(void *)(a1 + 32) forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:_KVOContext];
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_1ED73EC20 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  id v3 = v5;

  return v3;
}

void __73__GEOMapDataSubscriptionLocalDownloadManager_captureStatePlistWithHints___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        long long v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "objectForKeyedSubscript:", v8, (void)v11);
        long long v10 = [v9 description];
        [v2 setObject:v10 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:@"subscriptionStates"];
}

- (void)_determineAutomaticOfflineUpdateDelay:(uint64_t)a1
{
  id v3 = a2;
  if (GEOConfigGetBOOL(GeoOfflineConfig_AutomaticUpdatesEnabled, (uint64_t)off_1E91157B8))
  {
    char v4 = [*(id *)(a1 + 32) isUpdateRequired];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v6 = [*(id *)(a1 + 32) lastUpdatedDate];
    [v5 timeIntervalSinceDate:v6];
    uint64_t v8 = v7;

    long long v9 = *(void **)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke_2;
    v13[3] = &unk_1E53DBE70;
    long long v11 = (id *)v14;
    v14[0] = v3;
    v14[1] = v8;
    char v15 = v4;
    [v9 calculateSizeOfAllOfflineDataWithCallbackQueue:v10 callback:v13];
  }
  else
  {
    long long v12 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke;
    block[3] = &unk_1E53DA028;
    long long v11 = &v17;
    id v17 = v3;
    dispatch_async(v12, block);
  }
}

uint64_t __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(-1.0);
}

uint64_t __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    char v4 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Failed to calculate downloaded offline data size", (uint8_t *)&v15, 2u);
    }

    v5.n128_u64[0] = -1.0;
    return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16))(v5);
  }
  else
  {
    v7.n128_f64[0] = GEOAutomaticUpdateFrequencyForOfflineDataSize(a2);
    if (v7.n128_f64[0] >= 0.0)
    {
      double v9 = v7.n128_f64[0];
      uint64_t v10 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v15 = 134218240;
        double v16 = v9;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Autoupdate frequency is %.0f. Time since last update is %.0f", (uint8_t *)&v15, 0x16u);
      }

      if (*(unsigned char *)(a1 + 48))
      {
        long long v13 = GEOGetSubscriptionsDownloadManagerLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "Active layers do not match required layers. Automatic update should be scheduled more-aggressively", (uint8_t *)&v15, 2u);
        }

        v14.n128_u64[0] = 0;
        return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16))(v14);
      }
      else
      {
        v12.n128_f64[0] = fmax(v9 - fmax(*(double *)(a1 + 40), 0.0), 0.0);
        return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16))(v12);
      }
    }
    else
    {
      uint64_t v8 = *(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16);
      v7.n128_u64[0] = -1.0;
      return v8(v7);
    }
  }
}

void __90__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineUpdateTaskScheduledIfNecessary__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      __n128 v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      uint64_t v6 = [v5 taskRequestForIdentifier:@"com.apple.geod.UpdateOfflineData"];

      if (v6)
      {
        __n128 v7 = GEOGetSubscriptionsDownloadManagerLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Offline update background task is already scheduled", buf, 2u);
        }
      }
      else if ([WeakRetained[4] isUpdateAvailable])
      {
        uint64_t v8 = GEOGetSubscriptionsDownloadManagerLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v13 = 0;
          _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Offline autoupdate should be scheduled, but no background task exists. Scheduling new background task", v13, 2u);
        }

        double Double = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1E9115708);
        uint64_t Uint64 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818);
        if (Double >= ((double)(unint64_t)Uint64 + (double)(unint64_t)Uint64) / 3.0)
        {
          uint64_t v12 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818);
          double v11 = ((double)(unint64_t)v12 + (double)(unint64_t)v12) / 3.0;
        }
        else
        {
          double v11 = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1E9115708);
        }
        -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:]((uint64_t)WeakRetained, vcvtmd_u64_f64(v11), a3);
      }
    }
  }
}

- (void)_scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:(double)a3 maxRandomizedDelay:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(void *)(a1 + 72))
  {
    if (BackgroundSystemTasksLibraryCore())
    {
      __n128 v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      uint64_t v6 = [v5 taskRequestForIdentifier:@"com.apple.geod.UpdateOfflineData"];

      if (!v6)
      {
        id v7 = (id)[objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()) initWithIdentifier:@"com.apple.geod.UpdateOfflineData"];
        [v7 setPriority:1];
        [v7 setRequiresExternalPower:1];
        [v7 setRequiresSignificantUserInactivity:1];
        [v7 setExpectedDuration:300.0];
        [v7 setResourceIntensive:1];
        [v7 setRequiresProtectionClass:3];
        [v7 setRequiresNetworkConnectivity:1];
        [v7 setRequiresInexpensiveNetworkConnectivity:1];
        objc_msgSend(v7, "setRequiresMinimumBatteryLevel:", GEOConfigGetUInteger(GeoOfflineConfig_AutoUpdateMinimumBatteryLevel, (uint64_t)off_1E9115A08));
        [v7 setNetworkDownloadSize:524288000];
        _configureBackgroundTaskDisallowingCellular(v7);
        objc_msgSend(v7, "setScheduleAfter:", fmax(a3, 1.0));
        if (a2) {
          [v7 setRandomInitialDelay:(double)a2];
        }

        uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        id v12 = 0;
        char v9 = [v8 submitTaskRequest:v7 error:&v12];
        id v10 = v12;

        if ((v9 & 1) == 0)
        {
          double v11 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v14 = v10;
            _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Error scheduling automatic update background task: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Did not schedule automatic update background task because BackgroundSystemTasks is not supported", buf, 2u);
      }
    }
  }
}

- (void)_determineIfShouldScheduleAutomaticUpdate:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke;
    v5[3] = &unk_1E53DC520;
    v5[4] = a1;
    id v6 = v3;
    -[GEOMapDataSubscriptionLocalDownloadManager _determineAutomaticOfflineUpdateDelay:](a1, v5);
  }
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v21 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v20 = a1;
    BOOL v23 = objc_msgSend(v22, "_geo_filtered:", &__block_literal_global_33);
    if ([v23 count])
    {
      uint64_t v27 = [*((id *)WeakRetained + 4) activeVersions];
      if ([v27 count])
      {
        objc_super v24 = [*((id *)WeakRetained + 4) requiredLayers];
        if ([v24 count])
        {
          uint64_t v25 = [v27 allKeys];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v6 = v24;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v47;
            while (2)
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v47 != v8) {
                  objc_enumerationMutation(v6);
                }
                if (([v25 containsObject:*(void *)(*((void *)&v46 + 1) + 8 * v9)] & 1) == 0)
                {
                  uint64_t v19 = GEOGetSubscriptionsDownloadManagerLog();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "Required layers do not match active layers. Data update is required, so will not consider scheduling individual retries", buf, 2u);
                  }

                  goto LABEL_24;
                }
                ++v9;
              }
              while (v7 != v9);
              uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v51 count:16];
              if (v7) {
                continue;
              }
              break;
            }
          }

          *(void *)buf = 0;
          v43 = buf;
          uint64_t v44 = 0x2020000000;
          char v45 = 0;
          v40[0] = 0;
          v40[1] = v40;
          v40[2] = 0x2020000000;
          char v41 = 0;
          id v10 = dispatch_group_create();
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id obj = v23;
          uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v37;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v37 != v12) {
                  objc_enumerationMutation(obj);
                }
                id v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
                dispatch_group_enter(v10);
                uint64_t v15 = (void *)*((void *)WeakRetained + 8);
                double v16 = [v14 identifier];
                uint64_t v17 = *((void *)WeakRetained + 1);
                v29[0] = MEMORY[0x1E4F143A8];
                v29[1] = 3221225472;
                v29[2] = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_80;
                v29[3] = &unk_1E53DBEE8;
                id v30 = v27;
                long long v31 = v14;
                id v32 = WeakRetained;
                id v34 = buf;
                uint64_t v35 = v40;
                long long v33 = v10;
                [v15 fetchSubscriptionMetadataWithIdentifier:v16 queue:v17 callback:v29];

                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
            }
            while (v11);
          }

          uint64_t v18 = *((void *)WeakRetained + 1);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_83;
          block[3] = &unk_1E53D89E8;
          void block[4] = *(void *)(v20 + 32);
          block[5] = buf;
          block[6] = v40;
          dispatch_group_notify(v10, v18, block);

          _Block_object_dispose(v40, 8);
          _Block_object_dispose(buf, 8);
LABEL_24:
        }
      }
    }
  }
}

unint64_t __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 policy] == 1) {
    unint64_t v3 = ((unint64_t)[v2 dataTypes] >> 10) & 1;
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_2_81;
    uint64_t v18 = &unk_1E53DBEC0;
    id v8 = v5;
    id v19 = v8;
    uint64_t v20 = &v21;
    [v7 enumerateKeysAndObjectsUsingBlock:&v15];
    if (*((unsigned char *)v22 + 24)) {
      goto LABEL_12;
    }
    uint64_t v9 = objc_msgSend(v8, "downloadState", v15, v16, v17, v18);
    if (v9)
    {
      if (v9 != 2)
      {
        if (v9 == 3)
        {
          uint64_t v10 = *(void *)(a1 + 72);
LABEL_11:
          *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
        }
LABEL_12:

        _Block_object_dispose(&v21, 8);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v11 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 141558275;
        uint64_t v26 = 1752392040;
        __int16 v27 = 2113;
        uint64_t v28 = v12;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Fixing download state for existing failed subscription: %{private, mask.hash}@", buf, 0x16u);
      }
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [*(id *)(a1 + 40) identifier];
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](v13, 2, v14);
    }
    uint64_t v10 = *(void *)(a1 + 64);
    goto LABEL_11;
  }
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_2_81(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 unsignedIntValue];
  uint64_t v9 = [v7 unsignedLongLongValue];

  uint64_t result = [*(id *)(a1 + 32) isFullyLoadedForDataType:1024 dataSubtype:v8 version:v9 associatedDataCount:0 associatedDataSize:0];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)_updateStateWithDownloadState:(void *)a3 forIdentifier:
{
  id v5 = a3;
  if (a1)
  {
    [*(id *)(a1 + 64) setDownloadState:a2 forSubscriptionWithIdentifier:v5];
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__11;
    uint64_t v15 = __Block_byref_object_dispose__11;
    id v16 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    id v6 = v5;
    uint64_t v10 = a2;
    uint64_t v9 = v6;
    geo_isolate_sync_data();
    if (v12[5])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, v12[5], v6, v8, 3221225472, __90__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloadState_forIdentifier___block_invoke, &unk_1E53DC098, a1, v6, &v11, v10);
    }
    _Block_object_dispose(&v11, 8);
  }
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_83(uint64_t *a1)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    -[GEOMapDataSubscriptionLocalDownloadManager _ensureOfflineRetryTaskScheduled:](a1[4], 0);
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v2 = a1[4];
    -[GEOMapDataSubscriptionLocalDownloadManager _ensureOfflineRetryTaskScheduled:](v2, 1);
  }
}

- (void)_ensureOfflineRetryTaskScheduled:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    char v4 = GEOMapDataSubscriptionOfflineDownloadInexpensiveBackgroundTaskIdentifier;
    if (!a2) {
      char v4 = GEOMapDataSubscriptionOfflineDownloadRetryBackgroundTaskIdentifier;
    }
    id v5 = *v4;
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
    id v7 = [v6 taskRequestForIdentifier:v5];

    uint64_t v8 = GEOGetSubscriptionsDownloadManagerLog();
    uint64_t v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 138543362;
        id v14 = v5;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "Offline retry background task is already scheduled (%{public}@)", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 138543362;
        id v14 = v5;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Offline retry should be scheduled, but no background task exists. Scheduling new background task (%{public}@)", (uint8_t *)&v13, 0xCu);
      }

      if (a2) {
        uint64_t v10 = &GeoOfflineConfig_OfflineDownloadWaitForInexpensiveNetworkingDelay;
      }
      else {
        uint64_t v10 = &GeoOfflineConfig_FailedOfflineDownloadRetryDelay;
      }
      uint64_t v11 = (uint64_t *)&unk_1E91158E8;
      if (!a2) {
        uint64_t v11 = (uint64_t *)&unk_1E91158F8;
      }
      double Double = GEOConfigGetDouble(*v10, *v11);
      -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:onlyWaitingForNonCellular:]((char *)a1, a2, Double);
    }
  }
}

- (void)_scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:(double)a3 onlyWaitingForNonCellular:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = 48;
    if (a2) {
      uint64_t v6 = 40;
    }
    -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadGroup:startNextDownloadIfNecessary:dueToTaskDeferral:]((uint64_t)a1, *(void **)&a1[v6], 0);
    if (BackgroundSystemTasksLibraryCore())
    {
      id v7 = GEOMapDataSubscriptionOfflineDownloadInexpensiveBackgroundTaskIdentifier;
      if (!a2) {
        id v7 = GEOMapDataSubscriptionOfflineDownloadRetryBackgroundTaskIdentifier;
      }
      uint64_t v8 = *v7;
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      uint64_t v10 = [v9 taskRequestForIdentifier:v8];

      if (v10)
      {
        uint64_t v11 = GEOGetSubscriptionsDownloadManagerLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v20 = v8;
          _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "NOT scheduling background task %{public}@ because it is already scheduled", buf, 0xCu);
        }

        if (a2)
        {
          v18[1] = (id)MEMORY[0x1E4F143A8];
          v18[2] = (id)3221225472;
          v18[3] = __135__GEOMapDataSubscriptionLocalDownloadManager__scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay_onlyWaitingForNonCellular___block_invoke;
          v18[4] = &unk_1E53D79D8;
          v18[5] = a1;
          geo_isolate_sync();
        }
      }
      else
      {
        id v12 = (id)[objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()) initWithIdentifier:v8];
        [v12 setPriority:2];
        [v12 setRequiresUserInactivity:a2 ^ 1u];
        [v12 setRequiresProtectionClass:3];
        [v12 setRequiresNetworkConnectivity:1];
        objc_msgSend(v12, "setRequiresMinimumBatteryLevel:", GEOConfigGetUInteger(GeoOfflineConfig_DownloadMinimumBatteryLevel, (uint64_t)off_1E9115A18));
        [v12 setRequiresExternalPower:a2 ^ 1u];
        [v12 setNetworkDownloadSize:524288000];
        _configureBackgroundTaskDisallowingCellular(v12);
        objc_msgSend(v12, "setScheduleAfter:", fmax(a3, 1.0));
        if ((a2 ^ 1)) {
          [v12 setRequiresInexpensiveNetworkConnectivity:1];
        }
        else {
          [v12 setTrySchedulingBefore:a3 + 10.0];
        }

        int v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        v18[0] = 0;
        char v14 = [v13 submitTaskRequest:v12 error:v18];
        uint64_t v15 = v18[0];

        id v16 = GEOGetSubscriptionsDownloadManagerLog();
        uint64_t v17 = v16;
        if (v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v20 = v8;
            __int16 v21 = 2048;
            double v22 = a3;
            _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Scheduled offline retry background task (%{public}@) with delay %.0f", buf, 0x16u);
          }

          if (a2) {
            geo_isolate_sync();
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v15;
            _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Error scheduling offline retry background task: %{public}@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      uint64_t v8 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Did not schedule offline retry background task because BackgroundSystemTasks is not supported", buf, 2u);
      }
    }
  }
}

- (void)runAutomaticOfflineDataUpdateBackgroundTask:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__GEOMapDataSubscriptionLocalDownloadManager_runAutomaticOfflineDataUpdateBackgroundTask___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __90__GEOMapDataSubscriptionLocalDownloadManager_runAutomaticOfflineDataUpdateBackgroundTask___block_invoke(uint64_t a1)
{
}

- (void)_startUpdateForUserInitiatedSubscriptionsForDataType:(uint64_t)a3 mode:(uint64_t)a4 updateType:(void *)a5 auditToken:(void *)a6 forBackgroundTask:(void *)a7 startedHandler:
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a1)
  {
    id v16 = *(void **)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke;
    v18[3] = &unk_1E53DC158;
    uint64_t v22 = a2;
    uint64_t v23 = a4;
    v18[4] = a1;
    id v19 = v14;
    id v21 = v15;
    uint64_t v24 = a3;
    id v20 = v13;
    [v16 fetchAllSubscriptionsWithQueue:v17 callback:v18];
  }
}

- (void)runRetryOfflineDownloadBackgroundTask:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__GEOMapDataSubscriptionLocalDownloadManager_runRetryOfflineDownloadBackgroundTask___block_invoke;
  v7[3] = &unk_1E53D8998;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __84__GEOMapDataSubscriptionLocalDownloadManager_runRetryOfflineDownloadBackgroundTask___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  int v3 = [v2 isEqualToString:@"com.apple.geod.OfflineDownload.Inexpensive"];

  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    char v6 = 1;
LABEL_5:
    -[GEOMapDataSubscriptionLocalDownloadManager _offlineRetryBackgroundTaskFired:onlyWaitingForNonCellular:](v4, v5, v6);
    return;
  }
  id v7 = [*(id *)(a1 + 32) identifier];
  int v8 = [v7 isEqualToString:@"com.apple.geod.OfflineDownload.FailedRetry"];

  if (v8)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    char v6 = 0;
    goto LABEL_5;
  }
  uint64_t v9 = GEOGetSubscriptionsDownloadManagerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    int v11 = 138543362;
    id v12 = v10;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, "Unexpected background task identifier: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 32) setTaskCompleted];
}

- (void)_offlineRetryBackgroundTaskFired:(char)a3 onlyWaitingForNonCellular:
{
  id v5 = a2;
  char v6 = v5;
  if (a1)
  {
    id v7 = *(void **)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke;
    v9[3] = &unk_1E53DC328;
    v9[4] = a1;
    char v11 = a3;
    id v10 = v5;
    [v7 fetchAllSubscriptionsWithQueue:v8 callback:v9];
  }
}

- (void)didAddSubscription:(id)a3
{
}

- (void)didAddSubscription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 policy] == 1)
  {
    uint64_t v8 = [v6 identifier];
    workQueue = self->_workQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__GEOMapDataSubscriptionLocalDownloadManager_didAddSubscription_completionHandler___block_invoke;
    v10[3] = &unk_1E53DBF10;
    id v11 = v6;
    id v12 = self;
    id v13 = v7;
    [(GEOMapDataSubscriptionLocalDownloadManager *)self fetchStateForSubscriptionWithIdentifier:v8 callbackQueue:workQueue completionHandler:v10];
  }
}

void __83__GEOMapDataSubscriptionLocalDownloadManager_didAddSubscription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 141558275;
      uint64_t v22 = 1752392040;
      __int16 v23 = 2113;
      uint64_t v24 = v8;
      uint64_t v9 = "Failed to fetch state for newly-added subscription '%{private, mask.hash}@'. Ignoring";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_188D96000, v10, v11, v9, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v12 = [v5 loadState];
  if ((unint64_t)(v12 - 1) < 3)
  {
    id v7 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 141558275;
      uint64_t v22 = 1752392040;
      __int16 v23 = 2113;
      uint64_t v24 = v8;
      uint64_t v9 = "Newly-added/modified subscription '%{private, mask.hash}@' is already fully-downloaded. Ignoring";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v12 && (unint64_t)[v5 downloadState] <= 2)
  {
    if (GEOConfigGetUInteger(GeoOfflineConfig_DownloadMinimumBatteryLevel, (uint64_t)off_1E9115A18)
      && ([*(id *)(a1 + 32) dataTypes] & 0x400) != 0)
    {
      uint64_t v17 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 141558275;
        uint64_t v22 = 1752392040;
        __int16 v23 = 2113;
        uint64_t v24 = v18;
        _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_INFO, "Scheduling background download task for newly-added subscription '%{private, mask.hash}@'", buf, 0x16u);
      }
      -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:onlyWaitingForNonCellular:](*(char **)(a1 + 40), 1, 0.0);
      uint64_t v19 = *(void *)(a1 + 40);
      id v7 = [*(id *)(a1 + 32) identifier];
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](v19, 3, v7);
    }
    else
    {
      id v14 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 141558275;
        uint64_t v22 = 1752392040;
        __int16 v23 = 2113;
        uint64_t v24 = v15;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Enqueuing download for newly-added subscription '%{private, mask.hash}@'", buf, 0x16u);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 32);
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](v16, v7, 0, 0, 1, 0, 0);
    }
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

- (void)_enqueueDownloadForSubscriptions:(uint64_t)a3 mode:(void *)a4 auditToken:(uint64_t)a5 reason:(uint64_t)a6 updateType:(int)a7 enqueueAtHead:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v36 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if ([v13 count])
    {
      id v14 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134349056;
        *(void *)((char *)&buf + 4) = [v13 count];
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Enqueuing downloads of %{public}llu subscriptions", (uint8_t *)&buf, 0xCu);
      }

      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke;
      v59[3] = &unk_1E53DC1A8;
      id v60 = v36;
      uint64_t v35 = objc_msgSend(v13, "_geo_map:", v59);
      id v15 = *(void **)(a1 + 80);
      if (v15)
      {
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_2;
        v57[3] = &unk_1E53DC1F8;
        id v58 = v13;
        objc_msgSend(v15, "_geo_filter:", v57);
        if (a7)
        {
          uint64_t v16 = (void *)[v35 mutableCopy];
          [v16 addObjectsFromArray:*(void *)(a1 + 80)];
          uint64_t v17 = *(void **)(a1 + 80);
          *(void *)(a1 + 80) = v16;
        }
        else
        {
          [*(id *)(a1 + 80) addObjectsFromArray:v35];
        }
        uint64_t v19 = v58;
      }
      else
      {
        uint64_t v18 = [v35 mutableCopy];
        uint64_t v19 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v18;
      }

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v64 = 0x3032000000;
      v65 = __Block_byref_object_copy__11;
      v66 = __Block_byref_object_dispose__11;
      id v67 = 0;
      uint64_t v46 = MEMORY[0x1E4F143A8];
      uint64_t v47 = 3221225472;
      long long v48 = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_4;
      long long v49 = &unk_1E53DC220;
      id v50 = v13;
      uint64_t v51 = a1;
      p_long long buf = &buf;
      uint64_t v54 = a6;
      uint64_t v55 = a3;
      uint64_t v56 = a5;
      id v21 = v20;
      id v52 = v21;
      geo_isolate_sync_data();
      if ([*(id *)(*((void *)&buf + 1) + 40) count])
      {
        if ([*(id *)(*((void *)&buf + 1) + 40) count] != 1
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)char v45 = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloadersToCancel.count == 1", v45, 2u);
        }
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "firstObject", v35);
        BOOL v23 = v22 == *(void **)(a1 + 88);

        if (!v23 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)char v45 = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloadersToCancel.firstObject == _currentDownloader", v45, 2u);
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v24 = *(id *)(*((void *)&buf + 1) + 40);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v62 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v24);
              }
              [*(id *)(*((void *)&v41 + 1) + 8 * i) cancel];
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v62 count:16];
          }
          while (v25);
        }
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v28 = v21;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v61 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(v28);
            }
            uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            long long v33 = objc_msgSend(v28, "objectForKeyedSubscript:", v32, v35);
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
            [WeakRetained downloadManager:a1 didUpdateState:v33 forIdentifier:v32];
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v61 count:16];
        }
        while (v29);
      }

      -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](a1);
      _Block_object_dispose(&buf, 8);
    }
  }
}

- (void)didRemoveSubscriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__GEOMapDataSubscriptionLocalDownloadManager_didRemoveSubscriptionWithIdentifier___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __82__GEOMapDataSubscriptionLocalDownloadManager_didRemoveSubscriptionWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) removeSubscriptionWithIdentifier:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) removeSubscriptionWithIdentifier:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) removeSubscriptionWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(a1 + 40);

  -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](v2, v3, 0);
}

- (void)_cancelDownloadForSubscriptionIdentifier:(int)a3 shouldPersistPausedState:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v26 = 0;
    __int16 v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__11;
    uint64_t v30 = __Block_byref_object_dispose__11;
    id v31 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke;
    uint64_t v22 = &unk_1E53DC248;
    uint64_t v25 = &v26;
    uint64_t v23 = a1;
    id v6 = v5;
    id v24 = v6;
    geo_isolate_sync_data();
    if (a3) {
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](a1, 1, v6);
    }
    uint64_t v7 = v27[5];
    if (v7)
    {
      if (v7 != *(void *)(a1 + 88) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloader == _currentDownloader", buf, 2u);
      }
      id v8 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 141558275;
        *(void *)&uint8_t buf[4] = 1752392040;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Canceling currently-downloading subscription '%{private, mask.hash}@'", buf, 0x16u);
      }

      [(id)v27[5] cancel];
      uint64_t v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](a1, 0, v6, v9);
    }
    else
    {
      id v10 = *(void **)(a1 + 80);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke_121;
      v17[3] = &unk_1E53DC270;
      id v11 = v6;
      id v18 = v11;
      uint64_t v12 = [v10 indexOfObjectPassingTest:v17];
      id v13 = GEOGetSubscriptionsDownloadManagerLog();
      id v14 = v13;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 141558275;
          *(void *)&uint8_t buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Asked to cancel subscription '%{private, mask.hash}@' which is neither downloading nor queued for download", buf, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 141558275;
          *(void *)&uint8_t buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Canceling queued-for-download subscription '%{private, mask.hash}@'", buf, 0x16u);
        }

        [*(id *)(a1 + 80) removeObjectAtIndex:v12];
      }
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v33 = __Block_byref_object_copy__11;
      id v34 = __Block_byref_object_dispose__11;
      id v35 = 0;
      id v15 = v11;
      geo_isolate_sync_data();
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        [WeakRetained downloadManager:a1 didUpdateState:*(void *)(*(void *)&buf[8] + 40) forIdentifier:v15];
      }
      _Block_object_dispose(buf, 8);

      uint64_t v9 = v18;
    }

    _Block_object_dispose(&v26, 8);
  }
}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 dataTypes:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = -1;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__11;
  v55[4] = __Block_byref_object_dispose__11;
  id v56 = 0;
  id v13 = dispatch_group_create();
  if (a4 == 1024)
  {
    v58[3] = 0;
    uint64_t v49 = 0;
    id v50 = &v49;
    uint64_t v51 = 0x3032000000;
    id v52 = __Block_byref_object_copy__11;
    v53 = __Block_byref_object_dispose__11;
    id v54 = 0;
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    char v45 = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_2;
    uint64_t v46 = &unk_1E53D7C00;
    uint64_t v47 = self;
    long long v48 = &v49;
    geo_isolate_sync();
    id v14 = objc_alloc_init(GEOPBOfflineDataBatchesSizeRequest);
    [(GEOPBOfflineDataBatchesSizeRequest *)v14 setRegion:v10];
    uint64_t Uint64 = GEOConfigGetUint64(GeoOfflineConfig_OfflineClientVersionModifier, (uint64_t)off_1E91159D8);
    if (Uint64) {
      [(GEOPBOfflineDataBatchesSizeRequest *)v14 setClientVersionModifier:Uint64];
    }
    id v16 = v10;
    id v17 = v12;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = [(GEOOfflineDataConfiguration *)self->_dataConfiguration requiredLayers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v61 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v18);
          }
          -[GEOPBOfflineDataBatchesSizeRequest addLayers:](v14, "addLayers:", [*(id *)(*((void *)&v39 + 1) + 8 * i) intValue]);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v61 count:16];
      }
      while (v19);
    }

    id v12 = v17;
    id v10 = v16;
    dispatch_group_enter(v13);
    uint64_t v22 = (void *)v50[5];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_3;
    v35[3] = &unk_1E53DBF60;
    v35[4] = self;
    long long v37 = v55;
    long long v38 = &v57;
    uint64_t v36 = v13;
    [v22 startWithRequest:v14 traits:0 options:0 completionHandler:v35];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_5;
    v32[3] = &unk_1E53D89C0;
    long long v33 = v14;
    id v34 = &v49;
    uint64_t v23 = v14;
    id v24 = (void *)MEMORY[0x18C120660](v32);

    _Block_object_dispose(&v49, 8);
  }
  else
  {
    id v24 = &__block_literal_global_88;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_6;
  block[3] = &unk_1E53D9928;
  id v25 = v12;
  id v29 = v25;
  uint64_t v30 = &v57;
  id v31 = v55;
  dispatch_group_notify(v13, v11, block);
  uint64_t v26 = GEOCancellableForBlock(v24);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);

  return v26;
}

void __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    int v3 = objc_alloc_init(GEOOfflineDataSizeEstimationServiceRequester);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

void __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  uint64_t v9 = v5;
  id v6 = v5;
  id v7 = v8;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  int v3 = (id *)(v2 + 40);
  if (!v4) {
    objc_storeStrong(v3, *(id *)(a1 + 32));
  }
  uint64_t result = [*(id *)(a1 + 40) hasSizeBytes];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) sizeBytes];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += result;
  }
  return result;
}

uint64_t __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancelRequest:*(void *)(a1 + 32)];
}

uint64_t __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)fetchStateForSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = GEOGetSubscriptionsDownloadManagerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 141558275;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2113;
    id v15 = v8;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Fetching state for subscription '%{private, mask.hash}@'", (uint8_t *)&v12, 0x16u);
  }

  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, v8, v10, v9);
}

- (void)_updateStateForSubscriptionWithIdentifier:(void *)a3 callbackQueue:(void *)a4 completionHandler:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(void **)(a1 + 64);
    v18[0] = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v12 = *(void *)(a1 + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
    v13[3] = &unk_1E53DC000;
    id v17 = v9;
    id v14 = v8;
    uint64_t v15 = a1;
    id v16 = v7;
    [v10 fetchSubscriptionsMatchingIdentifiers:v11 queue:v12 callback:v13];
  }
}

void __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v9 = *(void **)(v7 + 64);
    uint64_t v10 = *(void *)(v7 + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3;
    v16[3] = &unk_1E53DBFD8;
    v16[4] = v7;
    id v17 = v8;
    id v18 = v5;
    id v20 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 32);
    [v9 fetchSubscriptionMetadataWithIdentifier:v17 queue:v10 callback:v16];
  }
  else if (*(void *)(a1 + 56))
  {
    if (v6)
    {
      id v11 = v6;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"Subscription not found"];
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E53D7C50;
    id v14 = *(id *)(a1 + 56);
    id v22 = v12;
    id v23 = v14;
    id v15 = v12;
    dispatch_async(v13, block);
  }
}

uint64_t __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__11;
  uint64_t v28 = __Block_byref_object_dispose__11;
  id v29 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_4;
  id v18 = &unk_1E53DBF88;
  uint64_t v19 = v7;
  id v20 = *(id *)(a1 + 40);
  id v8 = v5;
  id v21 = v8;
  id v22 = *(id *)(a1 + 48);
  id v23 = &v24;
  geo_isolate_sync_data();
  if (v8 && v25[5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [WeakRetained downloadManager:*(void *)(a1 + 32) didUpdateState:v25[5] forIdentifier:*(void *)(a1 + 40)];
  }
  uint64_t v10 = *(void **)(a1 + 64);
  if (v10)
  {
    id v11 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_5;
    block[3] = &unk_1E53DBFB0;
    id v13 = v10;
    id v14 = &v24;
    dispatch_async(v11, block);
  }
  _Block_object_dispose(&v24, 8);
}

void __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v26 = (id)v2;
  if (!*(void *)(a1 + 48)) {
    goto LABEL_21;
  }
  int v3 = [*(id *)(a1 + 56) firstObject];
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) activeVersions];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 32) latestAvailableVersions];
  int v7 = [*(id *)(*(void *)(a1 + 32) + 32) isUpdateAvailable];
  char v22 = [*(id *)(*(void *)(a1 + 32) + 32) isUpdateRequired];
  id v8 = *(void **)(*(void *)(a1 + 32) + 24);
  id v9 = v3;
  id v25 = v4;
  id v23 = v5;
  id v10 = v6;
  id v24 = v8;
  if (v26)
  {
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2020000000;
    uint64_t v82 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2020000000;
    uint64_t v78 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    char v74 = 1;
    uint64_t v67 = 0;
    uint64_t v68 = &v67;
    uint64_t v69 = 0x2020000000;
    char v70 = 1;
    char v11 = [v9 dataTypes];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke;
    v61[3] = &unk_1E53DBDF8;
    id v12 = v25;
    id v62 = v12;
    v63 = &v79;
    uint64_t v64 = &v75;
    v65 = &v71;
    v66 = &v67;
    _GEOEnumerateTileSetsForSubscriptionDataTypes(v24, v11, v61);
    if (([v9 dataTypes] & 0x400) == 0)
    {
LABEL_19:
      os_unfair_lock_lock_with_options();
      *((unsigned char *)v26 + 12) = *((unsigned char *)v72 + 24);
      *((unsigned char *)v26 + 13) = *((unsigned char *)v68 + 24);
      *((unsigned char *)v26 + 14) = v22;
      *((void *)v26 + 2) = v80[3];
      *((void *)v26 + 3) = v76[3];
      *((void *)v26 + 8) = [v12 downloadState];
      -[_GEOMapDataSubscriptionDownloadState _updateExternalState]((uint64_t)v26);
      os_unfair_lock_unlock((os_unfair_lock_t)v26 + 2);

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v79, 8);
      goto LABEL_20;
    }
    uint64_t v57 = 0;
    id v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    uint64_t v49 = 0;
    id v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0;
    if ([v10 count])
    {
      *((unsigned char *)v58 + 24) = 1;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_2;
      void v40[3] = &unk_1E53DBE20;
      id v41 = v12;
      long long v42 = &v49;
      uint64_t v43 = &v45;
      uint64_t v44 = &v57;
      [v10 enumerateKeysAndObjectsUsingBlock:v40];
    }
    char v13 = v7 ^ 1;
    if (!*((unsigned char *)v58 + 24)) {
      char v13 = 1;
    }
    if ((v13 & 1) == 0) {
      *((unsigned char *)v58 + 24) = 0;
    }
    uint64_t v36 = 0;
    long long v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    if (v7 && [v23 count])
    {
      *((unsigned char *)v54 + 24) = 1;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_3;
      v27[3] = &unk_1E53DBE20;
      id v28 = v12;
      id v29 = &v36;
      uint64_t v30 = &v32;
      id v31 = &v53;
      [v23 enumerateKeysAndObjectsUsingBlock:v27];
    }
    id v14 = v72;
    *((unsigned char *)v72 + 24) &= *((unsigned char *)v58 + 24);
    char v15 = *((unsigned char *)v68 + 24);
    int v16 = (v15 & v54[3]);
    *((unsigned char *)v68 + 24) = v15 & v54[3];
    if (*((unsigned char *)v14 + 24))
    {
      v80[3] += v50[3];
      id v17 = v46;
    }
    else
    {
      if (!v16)
      {
LABEL_18:
        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v49, 8);
        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v57, 8);
        goto LABEL_19;
      }
      v80[3] += v37[3];
      id v17 = v33;
    }
    v76[3] += v17[3];
    goto LABEL_18;
  }
LABEL_20:

  uint64_t v2 = (uint64_t)v26;
LABEL_21:
  if (v2) {
    id v18 = *(void **)(v2 + 96);
  }
  else {
    id v18 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v18);
  uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) downloadState];
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(a1 + 40);
  if (v19 == 5) {
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v20, v21, v26);
  }
  else {
    -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v20, v21);
  }
}

- (_GEOMapDataSubscriptionDownloadState)_stateForSubscriptionWithIdentifier:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    geo_assert_isolated();
    uint64_t v4 = *(void **)(a1 + 112);
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      id v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      uint64_t v4 = *(void **)(a1 + 112);
    }
    int v7 = [v4 objectForKeyedSubscript:v3];
    if (!v7)
    {
      int v7 = objc_alloc_init(_GEOMapDataSubscriptionDownloadState);
      [*(id *)(a1 + 112) setObject:v7 forKeyedSubscript:v3];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v8 = [&unk_1ED73EC20 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(&unk_1ED73EC20);
            }
            [(_GEOMapDataSubscriptionDownloadState *)v7 addObserver:a1 forKeyPath:*(void *)(*((void *)&v13 + 1) + 8 * i) options:0 context:_KVOContext];
          }
          uint64_t v9 = [&unk_1ED73EC20 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)_stopObservingWaitingConditionsIfNecessaryForIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    geo_assert_isolated();
    if ([*(id *)(a1 + 120) containsObject:v3])
    {
      [*(id *)(a1 + 120) removeObject:v3];
      if (![*(id *)(a1 + 120) count]) {
        -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessary](a1);
      }
    }
  }
}

uint64_t __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (void)_startObservingWaitingConditionsIfNecessary
{
  if (a1)
  {
    geo_assert_isolated();
    if (!*(unsigned char *)(a1 + 128))
    {
      if ([*(id *)(a1 + 120) count])
      {
        uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        id v3 = [v2 taskRequestForIdentifier:@"com.apple.geod.OfflineDownload.Inexpensive"];

        if (v3)
        {
          uint64_t v4 = +[GEONetworkObserver sharedNetworkObserver];
          [v4 addNetworkReachableObserver:a1 selector:sel__networkReachabilityChanged_];

          if ([v3 requiresExternalPower])
          {
            uint64_t v5 = +[GEOSystemMonitor sharedInstance];
            [v5 addPowerAdapterObserver:a1 queue:*(void *)(a1 + 8)];
          }
          if ([v3 requiresMinimumBatteryLevel])
          {
            id v6 = +[GEOSystemMonitor sharedInstance];
            objc_msgSend(v6, "addBatteryLevelObserver:onlyWhenCharging:queue:", a1, objc_msgSend(v3, "requiresExternalPower"), *(void *)(a1 + 8));
          }
          *(unsigned char *)(a1 + 128) = 1;
          int v7 = *(NSObject **)(a1 + 8);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __89__GEOMapDataSubscriptionLocalDownloadManager__startObservingWaitingConditionsIfNecessary__block_invoke;
          block[3] = &unk_1E53D79D8;
          void block[4] = a1;
          dispatch_async(v7, block);
        }
      }
    }
  }
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__startObservingWaitingConditionsIfNecessary__block_invoke(uint64_t a1)
{
}

- (void)_updateWaitingReasons
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
  id v3 = [v2 taskRequestForIdentifier:@"com.apple.geod.OfflineDownload.Inexpensive"];

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v3) {
    goto LABEL_18;
  }
  uint64_t v5 = +[GEONetworkObserver sharedNetworkObserver];
  if ([v5 isNetworkReachable])
  {
    id v6 = +[GEONetworkObserver sharedNetworkObserver];
    int v7 = [v6 isCellConnection];

    if (!v7)
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v8 = 1;
LABEL_8:
  if ([v3 requiresExternalPower])
  {
    uint64_t v9 = +[GEOSystemMonitor sharedInstance];
    int v10 = [v9 isPowerAdapterConnected];

    if (!v10) {
      v8 |= 2uLL;
    }
  }
  if ([v3 requiresMinimumBatteryLevel])
  {
    if (![v3 requiresExternalPower]
      || (+[GEOSystemMonitor sharedInstance],
          char v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isPowerAdapterConnected],
          v11,
          v12))
    {
      long long v13 = +[GEOSystemMonitor sharedInstance];
      unint64_t v14 = [v13 batteryLevel];
      unint64_t v15 = [v3 requiresMinimumBatteryLevel];

      if (v14 < v15)
      {
        v8 |= 4uLL;
        long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "requiresMinimumBatteryLevel"));
        [v4 setObject:v16 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"];

LABEL_17:
        id v17 = [NSNumber numberWithUnsignedInteger:v8];
        [v4 setObject:v17 forKeyedSubscript:@"GEOMapDataSubscriptionStateWaitingReasonKey"];

        goto LABEL_18;
      }
    }
  }
  if (v8) {
    goto LABEL_17;
  }
LABEL_18:
  id v28 = v3;
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  uint64_t v35 = __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke;
  uint64_t v36 = &unk_1E53D99F0;
  uint64_t v37 = a1;
  id v19 = v4;
  id v38 = v19;
  id v39 = v18;
  geo_isolate_sync();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v39;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v26 = [v20 objectForKeyedSubscript:v25];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        [WeakRetained downloadManager:a1 didUpdateState:v26 forIdentifier:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v22);
  }
}

- (uint64_t)_stopObservingWaitingConditionsIfNecessary
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = geo_assert_isolated();
    if (*(unsigned char *)(v1 + 128))
    {
      *(unsigned char *)(v1 + 128) = 0;
      uint64_t v2 = +[GEOSystemMonitor sharedInstance];
      [v2 removePowerAdapterObserver:v1];

      id v3 = +[GEOSystemMonitor sharedInstance];
      [v3 removeBatteryLevelObserver:v1];

      uint64_t v4 = *(void **)(v1 + 136);
      *(void *)(v1 + 136) = 0;

      uint64_t v5 = *(void **)(v1 + 112);
      return [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_102_0];
    }
  }
  return result;
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__stopObservingWaitingConditionsIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)registerExternallyManagedDownloader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 subscription];
    int v7 = [v6 identifier];
    -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:]((uint64_t)self, v5, v7, 0);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloader != ((void *)0)", v8, 2u);
  }
}

- (void)_updateStateWithDownloader:(void *)a3 forIdentifier:(void *)a4 error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a3;
  id v9 = a4;
  if (a1)
  {
    int v10 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134349571;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2113;
      id v28 = v8;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "Associating downloader %{public}p with subscription '%{private, mask.hash}@'", buf, 0x20u);
    }

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v28 = __Block_byref_object_copy__11;
    long long v29 = __Block_byref_object_dispose__11;
    id v30 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__11;
    uint64_t v25 = __Block_byref_object_dispose__11;
    id v26 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    unint64_t v15 = __93__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloader_forIdentifier_error___block_invoke;
    long long v16 = &unk_1E53DC070;
    uint64_t v17 = a1;
    char v11 = v8;
    uint64_t v18 = v11;
    id v19 = v7;
    id v20 = v9;
    geo_isolate_sync_data();
    if (v22[5])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, v22[5], v11, v13, 3221225472, __93__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloader_forIdentifier_error___block_invoke, &unk_1E53DC070, a1, v11, v19, v20, buf, &v21);
    }
    objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "cancel", v13, v14, v15, v16, v17);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)externallyManagedDownloaderDidFinish:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 subscription];
    id v9 = [v8 identifier];
    global_queue = (void *)geo_get_global_queue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__GEOMapDataSubscriptionLocalDownloadManager_externallyManagedDownloaderDidFinish_withError___block_invoke;
    v11[3] = &unk_1E53DC048;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, v9, global_queue, v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloader != ((void *)0)", buf, 2u);
  }
}

void __93__GEOMapDataSubscriptionLocalDownloadManager_externallyManagedDownloaderDidFinish_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) subscription];
  id v3 = [v4 identifier];
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](v2, 0, v3, *(void **)(a1 + 48));
}

void __93__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloader_forIdentifier_error___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v14);
  id v3 = *(void **)(a1 + 48);

  if (v2 != v3)
  {
    id v4 = -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v14);

    if (v4)
    {
      uint64_t v5 = -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v14);
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    -[_GEOMapDataSubscriptionDownloadState setDownloader:]((uint64_t)v14, *(void **)(a1 + 48));
    uint64_t v8 = *(void **)(a1 + 56);
    id v9 = v8;
    if (v14)
    {
      [v14 willChangeValueForKey:@"lastError"];
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)v14 + 9, v8);
      -[_GEOMapDataSubscriptionDownloadState _updateExternalState]((uint64_t)v14);
      os_unfair_lock_unlock((os_unfair_lock_t)v14 + 2);
      [v14 didChangeValueForKey:@"lastError"];

      int v10 = (void *)*((void *)v14 + 12);
    }
    else
    {

      int v10 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v10);
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) downloadState];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    if (v11 == 5) {
      -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v12, v13, v14);
    }
    else {
      -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v12, v13);
    }
  }
}

void __90__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloadState_forIdentifier___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  id v9 = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = v2 + 2;
    os_unfair_lock_lock(v2 + 2);
    *(void *)&v9[16]._os_unfair_lock_opaque = v3;
    -[_GEOMapDataSubscriptionDownloadState _updateExternalState]((uint64_t)v9);
    os_unfair_lock_unlock(v4);
    uint64_t v5 = *(void **)&v9[24]._os_unfair_lock_opaque;
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) downloadState];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  if (v6 == 5) {
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v7, v8, v9);
  }
  else {
    -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v7, v8);
  }
}

- (void)startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    tileDB = self->_tileDB;
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__GEOMapDataSubscriptionLocalDownloadManager_startDownloadForSubscriptionIdentifiers_mode_auditToken___block_invoke;
    v12[3] = &unk_1E53DC0C0;
    id v13 = v8;
    id v14 = self;
    unint64_t v16 = a4;
    id v15 = v9;
    [(GEOTileDB *)tileDB fetchSubscriptionsMatchingIdentifiers:v13 queue:workQueue callback:v12];
  }
}

void __102__GEOMapDataSubscriptionLocalDownloadManager_startDownloadForSubscriptionIdentifiers_mode_auditToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "clearDownloadStateForSubscriptionWithIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), (void)v13);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    if ([v5 count]) {
      -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](*(void *)(a1 + 40), v5, *(void *)(a1 + 56), *(void **)(a1 + 48), 2, 0, 0);
    }
  }
  else
  {
    uint64_t v12 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Failed to look up subscriptions: %{public}@", buf, 0xCu);
    }
  }
}

- (void)forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  id v8 = a5;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_forceUpdateForUserInitiatedSubscriptionsForDataType_mode_auditToken___block_invoke;
  v11[3] = &unk_1E53D7FC0;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(workQueue, v11);
}

void __114__GEOMapDataSubscriptionLocalDownloadManager_forceUpdateForUserInitiatedSubscriptionsForDataType_mode_auditToken___block_invoke(uint64_t a1)
{
}

void __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v22 = a3;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_2;
  v41[3] = &__block_descriptor_40_e32_B16__0__GEOMapDataSubscription_8l;
  v41[4] = *(void *)(a1 + 64);
  uint64_t v21 = v5;
  id v6 = objc_msgSend(v5, "_geo_filtered:", v41);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__11;
  v39[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        id v12 = *(void **)(a1 + 32);
        unint64_t v13 = [v11 identifier];
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_3;
        v32[3] = &unk_1E53DC108;
        uint64_t v34 = v39;
        void v32[4] = v11;
        uint64_t v33 = v7;
        [v12 fetchStateForSubscriptionWithIdentifier:v13 callbackQueue:v14 completionHandler:v32];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v8);
  }

  long long v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_4;
  block[3] = &unk_1E53DC130;
  uint64_t v16 = *(void *)(a1 + 72);
  long long v29 = v39;
  uint64_t v30 = v16;
  id v25 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 80);
  id v28 = v17;
  uint64_t v31 = v18;
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 32);
  id v26 = v19;
  uint64_t v27 = v20;
  dispatch_group_notify(v7, v15, block);

  _Block_object_dispose(v39, 8);
}

BOOL __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & [a2 dataTypes]) != 0;
}

void __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_3(void *a1, void *a2)
{
  if ((unint64_t)([a2 loadState] - 1) <= 2) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:a1[4]];
  }
  uint64_t v3 = a1[5];

  dispatch_group_leave(v3);
}

void __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 72) - 1;
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = off_1E53DC568[v2];
  }
  id v4 = GEOGetSubscriptionsDownloadManagerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v3;
    __int16 v17 = 2050;
    uint64_t v18 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Initiating %{public}@ update for %{public}llu subscriptions", buf, 0x16u);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v6 = -[GEOMapDataSubscriptionUpdateSession initWithSubscriptions:downloadMode:updateType:auditToken:backgroundTask:delegate:delegateQueue:]([GEOMapDataSubscriptionUpdateSession alloc], "initWithSubscriptions:downloadMode:updateType:auditToken:backgroundTask:delegate:delegateQueue:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(a1 + 80), *(void *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 48) + 8));
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = v6;
    if (v7)
    {
      -[GEOMapDataSubscriptionLocalDownloadManager _cancelCurrentUpdateSession:dueToTaskDeferral:](v7, 0, 0);
      if (BackgroundSystemTasksLibraryCore()
        && ([(GEOMapDataSubscriptionUpdateSession *)v8 updateType] == 2
         || [(GEOMapDataSubscriptionUpdateSession *)v8 updateType] == 3))
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        uint64_t v10 = [v9 taskRequestForIdentifier:@"com.apple.geod.UpdateOfflineData"];

        if (v10)
        {
          uint64_t v11 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Canceling scheduled automatic offline update background task due to forced update", buf, 2u);
          }

          id v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
          *(void *)long long buf = 0;
          [v12 cancelTaskRequestWithIdentifier:@"com.apple.geod.UpdateOfflineData" error:buf];
        }
      }
      objc_storeStrong((id *)(v7 + 72), v6);
      unint64_t v13 = [*(id *)(v7 + 72) subscriptions];
      -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](v7, v13, [*(id *)(v7 + 72) downloadMode], 0, 3, -[GEOMapDataSubscriptionUpdateSession updateType](v8, "updateType"), 1);
    }
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setTaskCompleted];
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
}

- (void)_cancelCurrentUpdateSession:(int)a3 dueToTaskDeferral:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1 && *(void *)(a1 + 72))
  {
    id v6 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Canceling current in-progress update session", buf, 2u);
    }

    id v7 = *(id *)(a1 + 88);
    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = 0;

      uint64_t v9 = [v7 subscription];
      uint64_t v10 = [v9 identifier];
      uint64_t v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](a1, 0, v10, v11);

      [v7 cancel];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = [*(id *)(a1 + 72) subscriptions];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) identifier];
          -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](a1, v17, 0);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [*(id *)(a1 + 72) backgroundTask];
    uint64_t v19 = v18;
    if (a3)
    {
      if (v18)
      {
        uint64_t v20 = [*(id *)(a1 + 72) backgroundTask];
        id v26 = 0;
        char v21 = [v20 setTaskExpiredWithRetryAfter:&v26 error:0.0];
        id v22 = v26;

        if ((v21 & 1) == 0)
        {
          uint64_t v23 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v32 = v22;
            _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Failed to expire background task: %{public}@", buf, 0xCu);
          }

          id v24 = [*(id *)(a1 + 72) backgroundTask];
          [v24 setTaskCompleted];
        }
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      [v18 setTaskCompleted];
      id v22 = v19;
    }

    id v25 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    if (a2) {
      -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](a1);
    }
  }
}

- (void)_startNextDownloadIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if ([*(id *)(a1 + 80) count])
    {
      if (!*(void *)(a1 + 88))
      {
        if ([*(id *)(a1 + 80) count])
        {
          uint64_t v2 = [*(id *)(a1 + 80) indexOfObjectPassingTest:&__block_literal_global_125];
          uint64_t v3 = *(void **)(a1 + 80);
          if (v2 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v4 = [v3 firstObject];
            uint64_t v2 = 0;
          }
          else
          {
            id v4 = [v3 objectAtIndexedSubscript:v2];
          }
          [*(id *)(a1 + 80) removeObjectAtIndex:v2];
        }
        else
        {
          id v4 = 0;
        }
        uint64_t v5 = [v4 subscription];
        if (v5)
        {
          id v6 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            id v7 = [v5 identifier];
            *(_DWORD *)long long buf = 141558275;
            *(void *)&uint8_t buf[4] = 1752392040;
            *(_WORD *)&unsigned char buf[12] = 2113;
            *(void *)&buf[14] = v7;
            _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Starting download for subscription: %{private, mask.hash}@", buf, 0x16u);
          }
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000;
          uint64_t v16 = 0;
          id v14 = v5;
          geo_isolate_sync_data();
          uint64_t v8 = *(void *)(*(void *)&buf[8] + 24);
          uint64_t v9 = [v4 auditToken];
          uint64_t v10 = [(id)a1 _createDownloaderForSubscription:v14 mode:v8 auditToken:v9];
          uint64_t v11 = *(void **)(a1 + 88);
          *(void *)(a1 + 88) = v10;

          id v12 = *(void **)(a1 + 88);
          uint64_t v13 = [v14 identifier];
          -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](a1, v12, v13, 0);

          [*(id *)(a1 + 88) resume];
          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
}

void __81__GEOMapDataSubscriptionLocalDownloadManager__failCurrentUpdateSessionWithError___block_invoke(uint64_t a1, double a2)
{
  id v4 = GEOGetSubscriptionsDownloadManagerLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2 >= 0.0)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Forced offline data update failed. Rescheduling automatic update", buf, 2u);
    }

    -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:](*(void *)(a1 + 32), 0, a2);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Forced offline data update failed. NOT scheduling automatic update because they are disabled", v6, 2u);
    }
  }
}

- (void)_finishedDownloadGroup:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    BOOL v5 = [v3 remainingSubscriptions];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: group.remainingSubscriptions.count == 0", buf, 2u);
      }
    }
    else
    {
      id v7 = [v4 backgroundTask];
      [v7 setTaskCompleted];

      if (*(void **)(a1 + 40) == v4)
      {
        *(void *)(a1 + 40) = 0;

        geo_isolate_sync();
      }
      else if (*(void **)(a1 + 48) == v4)
      {
        *(void *)(a1 + 48) = 0;
      }
    }
  }
}

uint64_t __69__GEOMapDataSubscriptionLocalDownloadManager__finishedDownloadGroup___block_invoke(uint64_t a1)
{
  return -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessary](*(void *)(a1 + 32));
}

_GEOMapDataSubscriptionQueuedDownload *__127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[_GEOMapDataSubscriptionQueuedDownload alloc] initWithSubscription:v3 auditToken:*(void *)(a1 + 32)];

  return v4;
}

BOOL __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_3;
  v8[3] = &unk_1E53DC1D0;
  id v9 = v3;
  id v5 = v3;
  BOOL v6 = [v4 indexOfObjectPassingTest:v8] == 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) subscription];
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)cancelDownloadForSubscriptionIdentifiers:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__GEOMapDataSubscriptionLocalDownloadManager_cancelDownloadForSubscriptionIdentifiers___block_invoke;
  v7[3] = &unk_1E53D8998;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __87__GEOMapDataSubscriptionLocalDownloadManager_cancelDownloadForSubscriptionIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](*(void *)(a1 + 40), *(void **)(*((void *)&v7 + 1) + 8 * v6++), 1);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = -[_GEOMapDataSubscriptionDownloadState downloader](v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke_121(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 subscription];
  long long v7 = [v6 identifier];
  uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

void __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke_123(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = v2 + 2;
    uint64_t v8 = v2;
    os_unfair_lock_lock(v2 + 2);
    uint64_t v4 = *(void *)&v8[8]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3);
    uint64_t v2 = v8;
    if (v4)
    {
      -[_GEOMapDataSubscriptionDownloadState setQueuedForDownload:]((uint64_t)v8, 0);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)&v8[24]._os_unfair_lock_opaque);
      uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) downloadState];
      uint64_t v6 = *(void *)(a1 + 32);
      long long v7 = *(void **)(a1 + 40);
      if (v5 == 5) {
        -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v6, v7, v8);
      }
      else {
        -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v6, v7);
      }
      uint64_t v2 = v8;
    }
  }
}

BOOL __72__GEOMapDataSubscriptionLocalDownloadManager__popNextSubscriptionToLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 subscription];
  BOOL v3 = [v2 policy] == 1;

  return v3;
}

- (id)_createDownloaderForSubscription:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!GEOConfigGetBOOL(GeoServicesConfig_ShouldAttributeSubscriptionDownloads, (uint64_t)off_1E9114F58)) {
    goto LABEL_6;
  }
  long long v10 = (GEOApplicationAuditToken *)v9;
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = [v8 _originatingBundleIdentifier];
  if (![v11 length])
  {
    long long v10 = 0;
    goto LABEL_15;
  }
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldAttributeSubscriptionDownloadsToOriginatingBundle, (uint64_t)off_1E9114F68);

  if (!BOOL)
  {
LABEL_6:
    long long v10 = 0;
    goto LABEL_7;
  }
  uint64_t v13 = [GEOApplicationAuditToken alloc];
  uint64_t v11 = [v8 _originatingBundleIdentifier];
  long long v10 = [(GEOApplicationAuditToken *)v13 initWithProxiedApplicationBundleId:v11];
LABEL_15:

LABEL_7:
  id v14 = [GEOMapDataSubscriptionDownloader alloc];
  tileDB = self->_tileDB;
  uint64_t v16 = [(GEOOfflineDataConfiguration *)self->_dataConfiguration requiredLayers];
  workQueue = self->_workQueue;
  uint64_t v18 = GEOGetSubscriptionsDownloadManagerLog();
  currentUpdateSession = self->_currentUpdateSession;
  if (currentUpdateSession) {
    currentUpdateSession = [(GEOMapDataSubscriptionUpdateSession *)currentUpdateSession updateType];
  }
  uint64_t v20 = ~((_BYTE)a4 << 7) & 0x80;
  if ((a4 & 2) != 0) {
    v20 |= 0x50uLL;
  }
  char v21 = [(GEOMapDataSubscriptionDownloader *)v14 initWithSubscription:v8 diskCache:tileDB requiredOfflineLayers:v16 delegate:self delegateQueue:workQueue reason:0 requestOptions:v20 & 0xFFFFFFFFFFFFFFDFLL | (32 * ((a4 >> 2) & 1)) auditToken:v10 manifestManager:0 log:v18 logPrefix:&stru_1ED51F370 tileRequesterCreationBlock:&__block_literal_global_133_0 tileDownloader:0 offlineDownloader:0 updateType:currentUpdateSession];

  return v21;
}

GEOVoltaireTileRequester *__95__GEOMapDataSubscriptionLocalDownloadManager__createDownloaderForSubscription_mode_auditToken___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (a2 == 2)
  {
    uint64_t v11 = [(GEOSimpleTileRequester *)[GEOVoltaireTileRequester alloc] initWithTileRequest:v8 delegateQueue:v9 delegate:v10];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: providerID == GEOVoltaireTileProvider", v13, 2u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

void __75__GEOMapDataSubscriptionLocalDownloadManager__startNextDownloadIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) identifier];
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v2, v3);
  uint64_t v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[_GEOMapDataSubscriptionDownloadState downloadMode](v4);
}

- (void)_cancelDownloadGroup:(uint64_t)a1 startNextDownloadIfNecessary:(void *)a2 dueToTaskDeferral:(int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v7 = [v5 subscriptions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identifier];
          -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](a1, v12, 0);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [v6 backgroundTask];
    id v14 = v13;
    if (a3)
    {
      if (v13)
      {
        uint64_t v15 = [v6 backgroundTask];
        id v21 = 0;
        char v16 = [v15 setTaskExpiredWithRetryAfter:&v21 error:0.0];
        id v17 = v21;

        if ((v16 & 1) == 0)
        {
          uint64_t v18 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v27 = v17;
            _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Failed to expire background task: %{public}@", buf, 0xCu);
          }

          uint64_t v19 = [v6 backgroundTask];
          [v19 setTaskCompleted];
        }
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      [v13 setTaskCompleted];
      id v17 = v14;
    }

    uint64_t v20 = (void *)(a1 + 40);
    if (*(void **)(a1 + 40) == v6 || (uint64_t v20 = (void *)(a1 + 48), *(void **)(a1 + 48) == v6))
    {
      *uint64_t v20 = 0;
    }
    -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](a1);
  }
}

void __135__GEOMapDataSubscriptionLocalDownloadManager__scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay_onlyWaitingForNonCellular___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessary](v2);
  }
}

void __135__GEOMapDataSubscriptionLocalDownloadManager__scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay_onlyWaitingForNonCellular___block_invoke_135(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessary](v2);
  }
}

void __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  id v5 = objc_msgSend(v17, "_geo_filtered:", &__block_literal_global_137);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__11;
  v33[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        dispatch_group_enter(v6);
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = [v10 identifier];
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_3;
        v25[3] = &unk_1E53DC2D8;
        id v27 = v33;
        v25[4] = v10;
        char v28 = *(unsigned char *)(a1 + 48);
        id v26 = v6;
        [v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:v13 completionHandler:v25];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  id v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_4;
  block[3] = &unk_1E53DC300;
  long long v23 = v33;
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v21 = v15;
  uint64_t v22 = v16;
  char v24 = *(unsigned char *)(a1 + 48);
  dispatch_group_notify(v6, v14, block);

  _Block_object_dispose(v33, 8);
}

unint64_t __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (![v4 loadState])
  {
    uint64_t v3 = [v4 downloadState];
    if (!v3 || v3 == 5 || v3 == 4 && !*(unsigned char *)(a1 + 56)) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(a1 + 32)];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  uint64_t v3 = GEOGetSubscriptionsDownloadManagerLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
      *(_DWORD *)long long buf = 134349056;
      uint64_t v13 = v5;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Retrying download for %{public}llu subscriptions", buf, 0xCu);
    }

    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 6;
    }
    uint64_t v7 = [[GEOMapDataSubscriptionDownloadGroup alloc] initWithSubscriptions:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) downloadMode:v6 auditToken:0 backgroundTask:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40) delegateQueue:*(void *)(*(void *)(a1 + 40) + 8)];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = 40;
    if (!*(unsigned char *)(a1 + 56)) {
      uint64_t v9 = 48;
    }
    uint64_t v10 = *(void **)(v8 + v9);
    *(void *)(v8 + v9) = v7;
    uint64_t v11 = v7;

    -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](*(void *)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6, 0, 5, 0, 0);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "No un-downloaded offline subscriptions match criteria. Nothing to retry", buf, 2u);
    }

    [*(id *)(a1 + 32) setTaskCompleted];
    geo_isolate_sync();
  }
}

uint64_t __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_138(uint64_t a1)
{
  return -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessary](*(void *)(a1 + 32));
}

void __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v23 = a3;
  char v24 = v5;
  if (v23)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v22 = objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_141);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 0;
    group = dispatch_group_create();
    unint64_t v6 = [v22 count];
    uint64_t v7 = "N6google8protobuf17GeneratedCodeInfoE" + 21;
    if (v6 >= 2)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v34 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (([v12 dataTypes] & 0x400) != 0)
            {
              uint64_t v13 = [v12 identifier];
              uint64_t v14 = [*(id *)(a1 + 32) subscription];
              id v15 = [v14 identifier];
              char v16 = [v13 isEqualToString:v15];

              if ((v16 & 1) == 0)
              {
                dispatch_group_enter(group);
                id v17 = *(void **)(a1 + 40);
                id v18 = [v12 identifier];
                uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                v30[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_3;
                v30[3] = &unk_1E53DC350;
                long long v32 = v37;
                long long v31 = group;
                [v17 fetchStateForSubscriptionWithIdentifier:v18 callbackQueue:v19 completionHandler:v30];
              }
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v9);
      }

      uint64_t v7 = "neratedCodeInfoE";
    }
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = *(NSObject **)(v20 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = *((void *)v7 + 481);
    block[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_4;
    block[3] = &unk_1E53DC378;
    long long v29 = v37;
    void block[4] = v20;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    dispatch_group_notify(group, v21, block);

    _Block_object_dispose(v37, 8);
  }
}

unint64_t __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  if ((unint64_t)([a2 loadState] - 1) <= 2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_4(void *a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
  uint64_t v3 = GEOGetSubscriptionsDownloadManagerLog();
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Downloader would use new data versions, but existing subscriptions need to be updated first", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unint64_t v6 = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Downloader would use new data versions, but there are no existing, fully-downloaded subscriptions. Allowing", v6, 2u);
    }

    [*(id *)(a1[4] + 32) updateCompletedWithVersions:a1[5] tileMetadata:0];
  }
  return (*(uint64_t (**)(void, BOOL))(a1[6] + 16))(a1[6], *(unsigned char *)(*(void *)(a1[7] + 8) + 24) == 0);
}

- (void)subscriptionDownloader:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (GEOMapDataSubscriptionDownloader *)a3;
  id v7 = a4;
  if (self->_currentDownloader != v6) {
    goto LABEL_32;
  }
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  id v8 = GEOGetSubscriptionsDownloadManagerLog();
  uint64_t v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      char v16 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
      id v17 = [v16 identifier];
      *(_DWORD *)long long buf = 141558275;
      *(void *)&uint8_t buf[4] = 1752392040;
      *(_WORD *)&unsigned char buf[12] = 2113;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Successfully downloaded subscription '%{private, mask.hash}@'", buf, 0x16u);
    }
    tileDB = self->_tileDB;
    uint64_t v19 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
    uint64_t v20 = [v19 identifier];
    [(GEOTileDB *)tileDB clearDownloadStateForSubscriptionWithIdentifier:v20];

    if (self->_currentUpdateSession) {
      goto LABEL_29;
    }
    id v21 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
    if (([v21 dataTypes] & 0x400) != 0)
    {
      uint64_t v22 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
      BOOL v23 = [v22 policy] == 1;

      if (!v23) {
        goto LABEL_26;
      }
      [(GEOOfflineDataConfiguration *)self->_dataConfiguration setLastUpdatedDateToNow];
      char v24 = [(GEOOfflineDataConfiguration *)self->_dataConfiguration tileMetadata];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        id v26 = self->_tileDB;
        id v27 = [(GEOOfflineDataConfiguration *)self->_dataConfiguration activeVersions];
        id v28 = _getOfflineTileMetadata(v26, v27);
        [(GEOOfflineDataConfiguration *)self->_dataConfiguration setTileMetadata:v28];
      }
      long long v29 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
      long long v30 = GEOGetSubscriptionsDownloadManagerLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v31 = [v29 identifier];
        *(_DWORD *)long long buf = 141558275;
        *(void *)&uint8_t buf[4] = 1752392040;
        *(_WORD *)&unsigned char buf[12] = 2113;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_INFO, "Finished downloading offline subscription '%{private, mask.hash}@' for the first time. Asking to display notification", buf, 0x16u);
      }
      id v21 = dispatch_group_create();
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v66) = 0;
      if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1E9111DF8))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (WeakRetained)
        {
          dispatch_group_enter(v21);
          long long v33 = [v29 identifier];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke;
          v58[3] = &unk_1E53DC3A0;
          char v60 = buf;
          uint64_t v59 = v21;
          [WeakRetained downloadManager:self fetchShouldSyncToActivePairedDeviceForIdentifier:v33 completionHandler:v58];
        }
      }
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2;
      block[3] = &unk_1E53D7C00;
      id v56 = v29;
      uint64_t v57 = buf;
      id v35 = v29;
      dispatch_group_notify(v21, workQueue, block);

      _Block_object_dispose(buf, 8);
    }

LABEL_26:
    if (!self->_currentUpdateSession) {
      notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
    uint64_t v11 = [v10 identifier];
    *(_DWORD *)long long buf = 141558531;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&unsigned char buf[12] = 2113;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    id v66 = v7;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Finished download of subscription '%{private, mask.hash}@' with error: %{public}@", buf, 0x20u);
  }
  uint64_t v12 = [v7 domain];
  uint64_t v13 = GEOErrorDomain();
  if ([v12 isEqualToString:v13])
  {
    BOOL v14 = [v7 code] == -28;

    if (v14)
    {
      if (self->_currentUpdateSession)
      {
        id v15 = GEOGetSubscriptionsDownloadManagerLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_FAULT, "Encountered version mismatch error during update. That should not be possible.", buf, 2u);
        }
      }
      else
      {
        *((unsigned char *)v62 + 24) = 1;
      }
    }
  }
  else
  {
  }
LABEL_29:
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  id v66 = 0;
  if (*((unsigned char *)v62 + 24))
  {
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    uint64_t v49 = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_148;
    id v50 = &unk_1E53DC410;
    uint64_t v51 = self;
    uint64_t v52 = v6;
    uint64_t v53 = buf;
    id v54 = &v61;
    geo_isolate_sync_data();
  }
  BOOL v36 = self->_currentUpdateSession != 0;
  long long v37 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
  char v38 = [v37 identifier];
  id v39 = self->_workQueue;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_149;
  void v40[3] = &unk_1E53DC460;
  BOOL v46 = v36;
  uint64_t v44 = &v61;
  id v41 = v7;
  long long v42 = v6;
  uint64_t v43 = self;
  uint64_t v45 = buf;
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, v38, v39, v40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v61, 8);
LABEL_32:
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F29268];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_3;
  v5[3] = &unk_1E53DC3C8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  objc_msgSend(v2, "geo_withMapsNotificationProviderDaemon:errorHandler:", v5, &__block_literal_global_147);
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) displayName];
  [v4 finishedDownloadingOfflineSubscription:v6 withDisplayName:v5 willSyncToPairedDevice:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = GEOGetSubscriptionsDownloadManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_148(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) subscription];
  int v4 = [v3 identifier];
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v2, v4);
  id v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[_GEOMapDataSubscriptionDownloadState downloadMode](v5);
  uint64_t v6 = -[_GEOMapDataSubscriptionDownloadState downloadReason](v5);
  if (v6 == (os_unfair_lock_s *)3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = -[_GEOMapDataSubscriptionDownloadState downloadReason](v5);
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Unexpected download reason: %lli", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6 == (os_unfair_lock_s *)4)
  {
    uint64_t v7 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Not initiating update because update already occurred/failed", (uint8_t *)&v8, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v87 = a2;
  id v88 = a3;
  if (*(unsigned char *)(a1 + 72) || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || !*(void *)(a1 + 32)) {
    goto LABEL_3;
  }
  BOOL v46 = [*(id *)(a1 + 40) subscription];
  if (([v46 dataTypes] & 0x400) == 0)
  {

LABEL_3:
    int v5 = 0;
    int v6 = 0;
    goto LABEL_4;
  }
  uint64_t v73 = [*(id *)(a1 + 32) domain];
  char v74 = GEOErrorDomain();
  if ([v73 isEqualToString:v74])
  {
    uint64_t v75 = [*(id *)(a1 + 32) code];

    if (v75 == -2) {
      goto LABEL_3;
    }
  }
  else
  {
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v109 = 0;
  uint64_t v76 = *(void *)(a1 + 48);
  uint64_t v93 = MEMORY[0x1E4F143A8];
  uint64_t v94 = 3221225472;
  v95 = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_150;
  v96 = &unk_1E53D7BD8;
  uint64_t v97 = v76;
  id v98 = *(id *)(a1 + 40);
  v99 = buf;
  geo_isolate_sync_data();
  uint64_t v77 = *(void *)(*(void *)&buf[8] + 24);
  if (!v77 || v77 == 3)
  {
    uint64_t v78 = [*(id *)(a1 + 32) domain];
    if ([v78 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      if ([*(id *)(a1 + 32) code] == -1005)
      {

LABEL_76:
        int v6 = 1;
        uint64_t v79 = 3;
        goto LABEL_77;
      }
      BOOL v80 = [*(id *)(a1 + 32) code] == -1009;

      if (v80) {
        goto LABEL_76;
      }
    }
    else
    {
    }
  }
  int v6 = 0;
  uint64_t v79 = 2;
LABEL_77:
  uint64_t v81 = *(void *)(a1 + 48);
  uint64_t v82 = [*(id *)(a1 + 40) subscription];
  v83 = [v82 identifier];
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](v81, v79, v83);

  _Block_object_dispose(buf, 8);
  int v5 = 1;
LABEL_4:
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = [*(id *)(a1 + 40) subscription];
  uint64_t v9 = [v8 identifier];
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](v7, 0, v9, *(void **)(a1 + 32));

  uint64_t v10 = *(void **)(*(void *)(a1 + 48) + 88);
  *(void *)(*(void *)(a1 + 48) + 88) = 0;

  uint64_t v11 = *(void **)(*(void *)(a1 + 48) + 72);
  uint64_t v12 = [*(id *)(a1 + 40) subscription];
  [v11 finishedDownloadingSubscription:v12 withError:*(void *)(a1 + 32)];

  uint64_t v13 = *(void **)(*(void *)(a1 + 48) + 72);
  if (!v13) {
    goto LABEL_45;
  }
  if (*(void *)(a1 + 32))
  {
    BOOL v14 = [v13 subscriptions];
    id v15 = [*(id *)(a1 + 40) subscription];
    char v16 = [v14 containsObject:v15];

    uint64_t v17 = *(void *)(a1 + 48);
    if (v16)
    {
      id v86 = *(id *)(a1 + 32);
      if (v17)
      {
        id v18 = *(void **)(v17 + 72);
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = [*(id *)(v17 + 72) remainingSubscriptions];
          id v21 = GEOGetSubscriptionsDownloadManagerLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = [v20 count];
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v86;
            *(_WORD *)&unsigned char buf[12] = 2050;
            *(void *)&buf[14] = v22;
            _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Update session failed with error: %{public}@. Canceling download of %{public}llu remaining subscriptions", buf, 0x16u);
          }

          long long v102 = 0u;
          long long v103 = 0u;
          long long v101 = 0u;
          long long v100 = 0u;
          id v23 = v20;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v100 objects:buf count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v101;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v101 != v25) {
                  objc_enumerationMutation(v23);
                }
                id v27 = objc_msgSend(*(id *)(*((void *)&v100 + 1) + 8 * i), "identifier", v86, v87, v88);
                -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](v17, v27, 0);
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v100 objects:buf count:16];
            }
            while (v24);
          }

          id v28 = [*(id *)(v17 + 72) backgroundTask];
          [v28 setTaskCompleted];

          long long v29 = *(void **)(v17 + 72);
          *(void *)(v17 + 72) = 0;

          if (([v19 updateType] == 2 || objc_msgSend(v19, "updateType") == 3)
            && objc_msgSend(*(id *)(v17 + 32), "isUpdateAvailable", v86))
          {
            *(void *)&long long v104 = MEMORY[0x1E4F143A8];
            *((void *)&v104 + 1) = 3221225472;
            v105 = __81__GEOMapDataSubscriptionLocalDownloadManager__failCurrentUpdateSessionWithError___block_invoke;
            v106 = &unk_1E53DC180;
            uint64_t v107 = v17;
            -[GEOMapDataSubscriptionLocalDownloadManager _determineAutomaticOfflineUpdateDelay:](v17, &v104);
          }
          else if (objc_msgSend(v19, "updateType", v86) == 1)
          {
            if (([*(id *)(v17 + 32) isUpdateAvailable] & 1) == 0
              && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              LOWORD(v104) = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _dataConfiguration.updateAvailable", (uint8_t *)&v104, 2u);
            }
            double Double = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesRetryDelay, (uint64_t)off_1E91156F8);
            uint64_t v48 = GEOGetSubscriptionsDownloadManagerLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              LODWORD(v104) = 134217984;
              *(void *)((char *)&v104 + 4) = (unint64_t)Double;
              _os_log_impl(&dword_188D96000, v48, OS_LOG_TYPE_INFO, "Automatic offline data update failed. Retrying after a minimum of %llu seconds", (uint8_t *)&v104, 0xCu);
            }

            -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:](v17, 0, Double);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _currentUpdateSession != ((void *)0)", buf, 2u);
        }
      }

      goto LABEL_45;
    }
    uint64_t v13 = *(void **)(v17 + 72);
  }
  long long v30 = [v13 remainingSubscriptions];
  BOOL v31 = [v30 count] == 0;

  if (!v31) {
    goto LABEL_45;
  }
  uint64_t v32 = *(void *)(a1 + 48);
  if (!v32) {
    goto LABEL_45;
  }
  long long v33 = *(void **)(v32 + 72);
  if (!v33)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_45;
    }
    *(_WORD *)long long buf = 0;
    v84 = MEMORY[0x1E4F14500];
    v85 = "Assertion failed: _currentUpdateSession != ((void *)0)";
LABEL_84:
    _os_log_fault_impl(&dword_188D96000, v84, OS_LOG_TYPE_FAULT, v85, buf, 2u);
    goto LABEL_45;
  }
  long long v34 = [v33 remainingSubscriptions];
  BOOL v35 = [v34 count] == 0;

  if (!v35)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_45;
    }
    *(_WORD *)long long buf = 0;
    v84 = MEMORY[0x1E4F14500];
    v85 = "Assertion failed: _currentUpdateSession.remainingSubscriptions.count == 0";
    goto LABEL_84;
  }
  BOOL v36 = GEOGetSubscriptionsDownloadManagerLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_INFO, "Successfully completed current update session", buf, 2u);
  }

  long long v37 = [*(id *)(v32 + 72) backgroundTask];
  [v37 setTaskCompleted];

  char v38 = [*(id *)(v32 + 72) offlineDataVersions];
  BOOL v39 = v38 == 0;

  if (v39)
  {
    _setValue(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1E9115858, 0, 0, 0);
  }
  else
  {
    uint64_t v40 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_INFO, "Switching to new active offline data versions", buf, 2u);
    }

    id v41 = *(void **)(v32 + 32);
    long long v42 = [*(id *)(v32 + 72) offlineDataVersions];
    uint64_t v43 = *(void **)(v32 + 64);
    uint64_t v44 = [*(id *)(v32 + 72) offlineDataVersions];
    uint64_t v45 = _getOfflineTileMetadata(v43, v44);
    [v41 updateCompletedWithVersions:v42 tileMetadata:v45];
  }
  uint64_t v49 = *(void **)(v32 + 72);
  *(void *)(v32 + 72) = 0;

  notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
LABEL_45:
  id v50 = *(void **)(*(void *)(a1 + 48) + 40);
  uint64_t v51 = objc_msgSend(*(id *)(a1 + 40), "subscription", v86);
  [v50 finishedDownloadingSubscription:v51 withError:*(void *)(a1 + 32)];

  uint64_t v52 = *(void **)(*(void *)(a1 + 48) + 48);
  uint64_t v53 = [*(id *)(a1 + 40) subscription];
  [v52 finishedDownloadingSubscription:v53 withError:*(void *)(a1 + 32)];

  uint64_t v54 = *(void *)(a1 + 48);
  if (*(void *)(v54 + 40))
  {
    uint64_t v55 = [*(id *)(*(void *)(a1 + 48) + 40) remainingSubscriptions];
    BOOL v56 = [v55 count] == 0;

    uint64_t v54 = *(void *)(a1 + 48);
    if (v56)
    {
      -[GEOMapDataSubscriptionLocalDownloadManager _finishedDownloadGroup:](v54, *(void **)(v54 + 40));
      uint64_t v54 = *(void *)(a1 + 48);
    }
  }
  uint64_t v57 = *(void **)(v54 + 48);
  if (v57)
  {
    id v58 = [v57 remainingSubscriptions];
    BOOL v59 = [v58 count] == 0;

    if (v59) {
      -[GEOMapDataSubscriptionLocalDownloadManager _finishedDownloadGroup:](*(void *)(a1 + 48), *(void **)(*(void *)(a1 + 48) + 48));
    }
  }
  if (v5)
  {
    char v60 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v60, OS_LOG_TYPE_INFO, "Offline subscription failed. Scheduling automatic retry", buf, 2u);
    }

    if (v6) {
      uint64_t v61 = &GeoOfflineConfig_OfflineDownloadWaitForInexpensiveNetworkingDelay;
    }
    else {
      uint64_t v61 = &GeoOfflineConfig_FailedOfflineDownloadRetryDelay;
    }
    id v62 = (uint64_t *)&unk_1E91158E8;
    if (!v6) {
      id v62 = (uint64_t *)&unk_1E91158F8;
    }
    double v63 = GEOConfigGetDouble(*v61, *v62);
    -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:onlyWaitingForNonCellular:](*(char **)(a1 + 48), v6, v63);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    char v64 = [*(id *)(a1 + 40) subscription];
    v65 = [*(id *)(a1 + 40) auditToken];
    uint64_t v66 = *(void *)(a1 + 48);
    uint64_t v67 = [*(id *)(a1 + 40) subscription];
    uint64_t v68 = [v67 dataTypes];
    uint64_t v69 = *(void *)(a1 + 64);
    uint64_t v70 = *(void *)(*(void *)(v69 + 8) + 24);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_151;
    v89[3] = &unk_1E53DC438;
    v89[4] = *(void *)(a1 + 48);
    id v90 = v64;
    id v91 = v65;
    uint64_t v92 = v69;
    id v71 = v65;
    id v72 = v64;
    -[GEOMapDataSubscriptionLocalDownloadManager _startUpdateForUserInitiatedSubscriptionsForDataType:mode:updateType:auditToken:forBackgroundTask:startedHandler:](v66, v68, v70, 3, v71, 0, v89);
  }
  else
  {
    -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](*(void *)(a1 + 48));
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_150(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) subscription];
  int v4 = [v3 identifier];
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v2, v4);
  int v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    os_unfair_lock_lock(v6 + 2);
    uint64_t v5 = *(void *)&v6[16]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v6 + 2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_151(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) subscriptions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_152;
  v6[3] = &unk_1E53DC1D0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v6];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v8[0] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](v4, v5, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void **)(a1 + 48), 4, 0, 0);
  }
}

uint64_t __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_152(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  uint64_t v11 = v10;
  if ((void *)_KVOContext == a6)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E53D8998;
    void block[4] = self;
    id v15 = v10;
    dispatch_async(workQueue, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOMapDataSubscriptionLocalDownloadManager;
    [(GEOMapDataSubscriptionLocalDownloadManager *)&v13 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

void __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__11;
  char v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  id v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  if (v7[5] && v13[5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", *(void *)(a1 + 32), v7[5], v13[5], v3, 3221225472, __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2, &unk_1E53DC410, v4, v5, &v6, &v12);
  }
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

void __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1[4] + 112);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1[4] + 112), "objectForKeyedSubscript:", v7, (void)v12);
        uint64_t v9 = (void *)a1[5];

        if (v8 == v9)
        {
          uint64_t v10 = a1[5];
          if (v10) {
            id v11 = *(void **)(v10 + 96);
          }
          else {
            id v11 = 0;
          }
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v11);
          objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)subscriptionDownloadGroupDidDefer:(id)a3
{
  uint64_t v4 = (GEOMapDataSubscriptionUpdateSession *)a3;
  uint64_t v5 = v4;
  if (self->_currentUpdateSession == v4)
  {
    id v7 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Current update has been deferred", buf, 2u);
    }

    -[GEOMapDataSubscriptionLocalDownloadManager _cancelCurrentUpdateSession:dueToTaskDeferral:]((uint64_t)self, 1, 1);
  }
  else if ((GEOMapDataSubscriptionUpdateSession *)self->_offlineInexpensiveDownloadGroup == v4 {
         || (GEOMapDataSubscriptionUpdateSession *)self->_offlineRetryFailedDownloadGroup == v4)
  }
  {
    uint64_t v6 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Retry download group has been deferred", v8, 2u);
    }

    -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadGroup:startNextDownloadIfNecessary:dueToTaskDeferral:]((uint64_t)self, v5, 1);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: group == _currentUpdateSession || group == _offlineInexpensiveDownloadGroup || group == _offlineRetryFailedDownloadGroup", v10, 2u);
  }
}

- (void)offlineDataConfiguration:(id)a3 didChangeUpdateAvailability:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__11;
  BOOL v31 = __Block_byref_object_dispose__11;
  id v32 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke;
  uint64_t v24 = &unk_1E53D89C0;
  uint64_t v25 = self;
  id v26 = &v27;
  geo_isolate_sync_data();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)v28[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, *(void **)(*((void *)&v17 + 1) + 8 * v10++), self->_workQueue, &__block_literal_global_156);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v33 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v27, 8);
  if (!self->_currentUpdateSession)
  {
    if (a4)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke_3;
      v15[3] = &unk_1E53DC4A8;
      v15[4] = self;
      -[GEOMapDataSubscriptionLocalDownloadManager _determineIfShouldScheduleAutomaticUpdate:]((uint64_t)self, v15);
    }
    else if (BackgroundSystemTasksLibraryCore())
    {
      id v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      long long v12 = [v11 taskRequestForIdentifier:@"com.apple.geod.UpdateOfflineData"];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        long long v14 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        uint64_t v16 = 0;
        [v14 cancelTaskRequestWithIdentifier:@"com.apple.geod.UpdateOfflineData" error:&v16];
      }
    }
  }
}

void __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke_3(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    uint64_t v5 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Informed of new offline data versions. Scheduling automatic update", v10, 2u);
    }

    double Double = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1E9115708);
    uint64_t Uint64 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818);
    if (Double >= ((double)(unint64_t)Uint64 + (double)(unint64_t)Uint64) / 3.0)
    {
      uint64_t v9 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818);
      double v8 = ((double)(unint64_t)v9 + (double)(unint64_t)v9) / 3.0;
    }
    else
    {
      double v8 = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1E9115708);
    }
    -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:](*(void *)(a1 + 32), vcvtmd_u64_f64(v8), a3);
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 0.0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_2;
    v8[3] = &unk_1E53DC4F8;
    void v8[4] = v4;
    double v10 = a2;
    id v9 = *(id *)(a1 + 40);
    [v5 fetchAllSubscriptionsWithQueue:v6 callback:v8];
  }
  else
  {
    uint64_t v3 = GEOGetSubscriptionsDownloadManagerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Automatic updates are disabled. No need to schedule any update", v7, 2u);
    }

    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(-1.0);
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  uint64_t v5 = objc_msgSend(v15, "_geo_filtered:", &__block_literal_global_158);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__11;
  void v29[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        dispatch_group_enter(v6);
        id v11 = *(void **)(a1 + 32);
        long long v12 = [v10 identifier];
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_4;
        v22[3] = &unk_1E53DC108;
        uint64_t v24 = v29;
        void v22[4] = v10;
        id v23 = v6;
        [v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:v13 completionHandler:v22];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }

  long long v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_5;
  block[3] = &unk_1E53DC4D0;
  long long v20 = v29;
  uint64_t v21 = *(void *)(a1 + 48);
  id v19 = *(id *)(a1 + 40);
  dispatch_group_notify(v6, v14, block);

  _Block_object_dispose(v29, 8);
}

unint64_t __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_4(void *a1, void *a2)
{
  if ((unint64_t)([a2 loadState] - 1) <= 2) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:a1[4]];
  }
  uint64_t v3 = a1[5];

  dispatch_group_leave(v3);
}

uint64_t __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_5(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) count];
  uint64_t v3 = GEOGetSubscriptionsDownloadManagerLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = a1[6];
      int v9 = 134217984;
      uint64_t v10 = v5;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Should schedule autoupdate after %.1f seconds", (uint8_t *)&v9, 0xCu);
    }

    v6.n128_u64[0] = a1[6];
    return (*(uint64_t (**)(__n128))(a1[4] + 16))(v6);
  }
  else
  {
    if (v4)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "No fully-downloaded offline subscriptions -- no need to schedule any update", (uint8_t *)&v9, 2u);
    }

    v8.n128_u64[0] = -1.0;
    return (*(uint64_t (**)(__n128))(a1[4] + 16))(v8);
  }
}

void __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 136) isEqualToDictionary:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = v2;

    uint64_t v5 = *(void *)(a1 + 32);
    __n128 v6 = *(void **)(v5 + 112);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke_2;
    v7[3] = &unk_1E53DC548;
    void v7[4] = v5;
    id v8 = *(id *)(a1 + 48);
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = a3;
  -[_GEOMapDataSubscriptionDownloadState setWaitingUserInfo:]((uint64_t)v5, *(void **)(*(void *)(a1 + 32) + 136));
  if (v5) {
    __n128 v6 = (void *)v5[12];
  }
  else {
    __n128 v6 = 0;
  }
  if ([v6 downloadState] == 5)
  {
    if (v5) {
      uint64_t v7 = v5[12];
    }
    else {
      uint64_t v7 = 0;
    }
    [*(id *)(a1 + 40) setObject:v7 forKey:v8];
  }
}

- (void)_networkReachabilityChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__GEOMapDataSubscriptionLocalDownloadManager__networkReachabilityChanged___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __74__GEOMapDataSubscriptionLocalDownloadManager__networkReachabilityChanged___block_invoke(uint64_t a1)
{
}

- (GEOMapDataSubscriptionDownloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionDownloadManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWaitingUserInfo, 0);
  objc_storeStrong((id *)&self->_waitingObservers, 0);
  objc_storeStrong((id *)&self->_subscriptionStates, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_pendingSubscriptionsToLoad, 0);
  objc_storeStrong((id *)&self->_currentUpdateSession, 0);
  objc_storeStrong((id *)&self->_tileDB, 0);
  objc_storeStrong((id *)&self->_offlineDataSizeEstimationRequester, 0);
  objc_storeStrong((id *)&self->_offlineRetryFailedDownloadGroup, 0);
  objc_storeStrong((id *)&self->_offlineInexpensiveDownloadGroup, 0);
  objc_storeStrong((id *)&self->_dataConfiguration, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
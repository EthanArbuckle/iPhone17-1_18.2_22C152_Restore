@interface ASDAppQuery
+ (id)_defaultExecutor;
+ (id)queryDefaultPairedWatchForBetaApps;
+ (id)queryForAlmondApps;
+ (id)queryForAppClipWithStoreItemID:(int64_t)a3;
+ (id)queryForBeagleApps;
+ (id)queryForBetaApps;
+ (id)queryForBetaAppsOnPairedDevice:(id)a3;
+ (id)queryForBetaAppsWithStoreItemIDs:(id)a3;
+ (id)queryForBundleAtPath:(id)a3;
+ (id)queryForBundleIDs:(id)a3;
+ (id)queryForStoreApps;
+ (id)queryForStoreItemIDs:(id)a3;
+ (id)queryForSystemAppsOnPairedDevice:(id)a3;
+ (id)queryForUpdates;
+ (id)queryWithPredicate:(id)a3;
+ (id)queryWithPredicate:(id)a3 onPairedDevice:(id)a4;
+ (void)anyWithPredicate:(id)a3 withResultHandler:(id)a4;
- (ASDAppQuery)init;
- (ASDAppQuery)initWithPredicate:(id)a3;
- (ASDAppQuery)initWithPredicate:(id)a3 onPairedDevice:(id)a4;
- (ASDAppQuery)initWithPredicate:(id)a3 queryExecutor:(id)a4 serviceBroker:(id)a5 notificationCenter:(id)a6;
- (ASDAppQueryResultsObserver)observer;
- (NSPredicate)predicate;
- (id)_downloadProgressForApp:(void *)a3 fromRemoteProgress:;
- (id)_installProgressForApp:(uint64_t)a1 fromRemoteProgress:(void *)a2;
- (id)_postProcessProgressForApp:(void *)a3 fromRemoteProgress:;
- (id)_removeCachedResultsForBundleIDs:(uint64_t)a1;
- (id)_replaceCachedResultsWithResults:(id *)a1;
- (int64_t)queryOptions;
- (void)_debugReceivedApps:(uint64_t)a1;
- (void)_executeQueryWithPredicate:(void *)a3 onPairedDevice:(void *)a4 withCompletion:;
- (void)_handleAppsRemovedWithBundleIDs:(uint64_t)a1;
- (void)_handleAppsUpdatedWithResults:(uint64_t)a1;
- (void)_handleBrokerConnectionNotification:(id)a3;
- (void)_handleCancelForApp:(char)a3 reportRemotely:;
- (void)_handleNotificationErrorWithUserInfo:(uint64_t)a1;
- (void)_handleNotificationRefreshWithUserInfo:(uint64_t)a1;
- (void)_handlePauseForApp:(uint64_t)a1;
- (void)_handleQueryOptionsWithResults:(uint64_t)a1;
- (void)_handleResumeForApp:(uint64_t)a1;
- (void)_newProgressForApp:(uint64_t)a1 fromRemoteProgress:(void *)a2 usingServiceBroker:(void *)a3;
- (void)_sendResultsChangedWithResults:(uint64_t)a1;
- (void)_unitTest_setHasRunOnce:(BOOL)a3;
- (void)_updateCachedResultsWithResults:(uint64_t)a1;
- (void)dealloc;
- (void)executeQueryWithResultHandler:(id)a3;
- (void)notificationCenter:(id)a3 receivedNotifications:(id)a4;
- (void)notificationCenter:(id)a3 receivedProgress:(id)a4;
- (void)setObserver:(id)a3;
- (void)setQueryOptions:(int64_t)a3;
@end

@implementation ASDAppQuery

void __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_2;
  v12[3] = &unk_1E58B2E40;
  v12[4] = v7;
  id v13 = v5;
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_sync(v8, v12);
}

uint64_t __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)executeQueryWithResultHandler:(id)a3
{
  id v4 = a3;
  predicate = self->_predicate;
  device = self->_device;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke;
  v8[3] = &unk_1E58B2E68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[ASDAppQuery _executeQueryWithPredicate:onPairedDevice:withCompletion:]((uint64_t)self, predicate, device, v8);
}

- (void)_executeQueryWithPredicate:(void *)a3 onPairedDevice:(void *)a4 withCompletion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 17))
    {
      uint64_t v11 = (*(void *)(a1 + 80) >> 1) & 1;
      v12 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke;
      v17[3] = &unk_1E58B2D30;
      id v13 = &v18;
      id v18 = v9;
      [v12 executeUpdatesQueryWithPredicateReloadingFromServer:v11 onPairedDevice:v8 withResultHandler:v17];
    }
    else
    {
      id v14 = *(void **)(a1 + 48);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke_2;
      v15[3] = &unk_1E58B2D30;
      id v13 = &v16;
      id v16 = v9;
      [v14 executeQueryWithPredicate:v7 onPairedDevice:v8 withResultHandler:v15];
    }
  }
}

void __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_2(uint64_t a1)
{
  -[ASDAppQuery _debugReceivedApps:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = -[ASDAppQuery _replaceCachedResultsWithResults:]((id *)v2, v3);
    -[ASDAppQuery _handleQueryOptionsWithResults:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_3;
    v12[3] = &unk_1E58B2E18;
    id v6 = &v14;
    id v14 = *(id *)(a1 + 56);
    id v7 = &v13;
    id v13 = *(id *)(a1 + 40);
    id v8 = v12;
  }
  else
  {
    id v5 = *(NSObject **)(v2 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_4;
    v9[3] = &unk_1E58B2E18;
    id v6 = &v11;
    id v11 = *(id *)(a1 + 56);
    id v7 = &v10;
    id v10 = *(id *)(a1 + 48);
    id v8 = v9;
  }
  dispatch_async(v5, v8);
}

- (id)_replaceCachedResultsWithResults:(id *)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v3 = a2;
    -[ASDAppQuery _updateCachedResultsWithResults:]((uint64_t)v2, v3);
    id v4 = (void *)MEMORY[0x1E4F1CA80];
    id v5 = [v2[7] allKeys];
    id v6 = [v4 setWithArray:v5];

    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [v3 valueForKey:@"bundleID"];

    id v9 = [v7 setWithArray:v8];
    [v6 minusSet:v9];

    id v10 = [v6 allObjects];
    -[ASDAppQuery _removeCachedResultsForBundleIDs:]((uint64_t)v2, v10);
    uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_removeCachedResultsForBundleIDs:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v10, (void)v18);
        v12 = v11;
        if (v11)
        {
          id v13 = [v11 progress];
          id v14 = v13;
          if (v13) {
            objc_msgSend(v13, "setCompletedUnitCount:", objc_msgSend(v13, "totalUnitCount"));
          }
          id v15 = [[ASDApp alloc] initWithBundleID:v10];
          if ([v12 isStoreApp])
          {
            [(ASDApp *)v15 setStatus:256];
            -[ASDApp setStoreItemID:](v15, "setStoreItemID:", [v12 storeItemID]);
          }
          [v4 addObject:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 56) removeObjectsForKeys:v5];
  id v16 = (void *)[v4 copy];

  return v16;
}

- (void)_handleQueryOptionsWithResults:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v9 + 1) + 8 * v8++) loadUpdateMetadataIfNecessary];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)_debugReceivedApps:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = ASDLogHandleForCategory(13);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      uint64_t v6 = [v3 count];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __34__ASDAppQuery__debugReceivedApps___block_invoke;
      v7[3] = &unk_1E58B2EE0;
      v7[4] = a1;
      v7[5] = v6;
      [v3 enumerateObjectsUsingBlock:v7];
    }
  }
}

+ (id)queryForStoreApps
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isAppClip == NO AND isStoreApp == YES"];
  id v4 = (void *)[v2 initWithPredicate:v3];

  return v4;
}

+ (id)queryForBetaApps
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isBetaApp == YES"];
  id v4 = (void *)[v2 initWithPredicate:v3];

  return v4;
}

+ (id)queryForUpdates
{
  id v2 = objc_alloc((Class)a1);
  if (v2)
  {
    id v2 = (unsigned char *)[v2 init];
    if (v2) {
      v2[17] = 1;
    }
  }
  return v2;
}

- (ASDAppQuery)init
{
  id v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  id v4 = [(ASDAppQuery *)self initWithPredicate:v3];

  return v4;
}

- (ASDAppQuery)initWithPredicate:(id)a3 queryExecutor:(id)a4 serviceBroker:(id)a5 notificationCenter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ASDAppQuery;
  uint64_t v14 = [(ASDAppQuery *)&v27 init];
  if (v14)
  {
    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDAppQuery", v15);
    dispatchQueue = v14->_dispatchQueue;
    v14->_dispatchQueue = (OS_dispatch_queue *)v16;

    long long v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDAppQuery.notify", v18);
    notificationQueue = v14->_notificationQueue;
    v14->_notificationQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [v10 copy];
    predicate = v14->_predicate;
    v14->_predicate = (NSPredicate *)v21;

    objc_storeStrong((id *)&v14->_serviceBroker, a5);
    objc_storeStrong((id *)&v14->_queryExecutor, a4);
    uint64_t v23 = objc_opt_new();
    resultCache = v14->_resultCache;
    v14->_resultCache = (NSMutableDictionary *)v23;

    objc_storeStrong((id *)&v14->_notificationCenter, a6);
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v14 selector:sel__handleBrokerConnectionNotification_ name:ASDServiceBrokerConnectedNotification object:v14->_serviceBroker];
  }
  return v14;
}

- (ASDAppQuery)initWithPredicate:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ASDAppQuery _defaultExecutor]();
  uint64_t v6 = +[ASDServiceBroker defaultBroker];
  uint64_t v7 = +[ASDNotificationCenter defaultCenter];
  uint64_t v8 = [(ASDAppQuery *)self initWithPredicate:v4 queryExecutor:v5 serviceBroker:v6 notificationCenter:v7];

  return v8;
}

+ (id)_defaultExecutor
{
  self;
  if (_MergedGlobals_23 != -1) {
    dispatch_once(&_MergedGlobals_23, &__block_literal_global_0);
  }
  v0 = (void *)qword_1EB4D6400;
  return v0;
}

- (void)_updateCachedResultsWithResults:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  if (a1)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v3 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v57;
      uint64_t v53 = *MEMORY[0x1E4F288B0];
      *(void *)&long long v4 = 138543618;
      long long v49 = v4;
      uint64_t v54 = *(void *)v57;
      do
      {
        uint64_t v7 = 0;
        uint64_t v51 = v5;
        do
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v56 + 1) + 8 * v7);
          long long v9 = objc_msgSend(v8, "bundleID", v49);
          if (v9)
          {
            id v10 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
            id v11 = [v10 progress];

            id v12 = [v8 remoteProgress];
            id v13 = v12;
            if (v12)
            {
              if (!v11)
              {
                id v11 = -[ASDAppQuery _newProgressForApp:fromRemoteProgress:usingServiceBroker:](a1, v8, v12);
                v28 = -[ASDAppQuery _downloadProgressForApp:fromRemoteProgress:](a1, v8, v13);
                [v8 setDownloadProgress:v28];

                v29 = -[ASDAppQuery _installProgressForApp:fromRemoteProgress:](a1, v13);
                [v8 setInstallProgress:v29];

                objc_msgSend(v8, "setProgressPhase:", -[NSObject phase](v13, "phase"));
                v30 = -[ASDAppQuery _postProcessProgressForApp:fromRemoteProgress:](a1, v8, v13);
                [v8 setPostProcessProgress:v30];
                goto LABEL_26;
              }
              objc_msgSend(v11, "setCompletedUnitCount:", -[NSObject completedUnitCount](v12, "completedUnitCount"));
              uint64_t v14 = [v13 downloadCompletedUnitCount];
              id v15 = [v8 downloadProgress];
              [v15 setCompletedUnitCount:v14];

              uint64_t v16 = [v13 downloadTotalUnitCount];
              v17 = [v8 downloadProgress];
              [v17 setTotalUnitCount:v16];

              if ([v13 phase] == 2)
              {
                long long v18 = NSNumber;
                [v13 throughput];
                dispatch_queue_t v19 = objc_msgSend(v18, "numberWithDouble:");
                long long v20 = [v8 downloadProgress];
                [v20 setThroughput:v19];

                uint64_t v21 = [v8 downloadProgress];
                v22 = NSNumber;
                [v13 throughput];
                uint64_t v23 = objc_msgSend(v22, "numberWithDouble:");
                [v21 setUserInfoObject:v23 forKey:v53];

                uint64_t v24 = [v13 secondsRemaining];
                if (v24 < 0)
                {
                  uint64_t v25 = 0;
                }
                else
                {
                  uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject secondsRemaining](v13, "secondsRemaining"));
                  v50 = (void *)v25;
                }
                v31 = [v8 downloadProgress];
                [v31 setEstimatedTimeRemaining:v25];

                if ((v24 & 0x8000000000000000) == 0) {
              }
                }
              uint64_t v32 = [v13 installCompletedUnitCount];
              v33 = [v8 installProgress];
              [v33 setCompletedUnitCount:v32];

              uint64_t v34 = [v13 installTotalUnitCount];
              v35 = [v8 installProgress];
              [v35 setTotalUnitCount:v34];

              objc_msgSend(v8, "setProgressPhase:", -[NSObject phase](v13, "phase"));
              uint64_t v36 = [v13 postProcessCompletedUnitCount];
              v37 = [v8 postProcessProgress];
              [v37 setCompletedUnitCount:v36];

              uint64_t v38 = [v13 postProcessTotalUnitCount];
              v39 = [v8 postProcessProgress];
              [v39 setTotalUnitCount:v38];

              if ([v13 phase] == 5)
              {
                v40 = NSNumber;
                [v13 throughput];
                v41 = objc_msgSend(v40, "numberWithDouble:");
                v42 = [v8 postProcessProgress];
                [v42 setThroughput:v41];

                v43 = [v8 postProcessProgress];
                v44 = NSNumber;
                [v13 throughput];
                v45 = objc_msgSend(v44, "numberWithDouble:");
                [v43 setUserInfoObject:v45 forKey:v53];

                uint64_t v46 = [v13 secondsRemaining];
                if (v46 < 0)
                {
                  v47 = 0;
                  v30 = v52;
                }
                else
                {
                  v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject secondsRemaining](v13, "secondsRemaining"));
                  v47 = v30;
                }
                v48 = [v8 postProcessProgress];
                [v48 setEstimatedTimeRemaining:v47];

                v52 = v30;
                uint64_t v5 = v51;
                if ((v46 & 0x8000000000000000) == 0) {
LABEL_26:
                }
              }
              objc_msgSend(v8, "setHasPostProcessing:", -[NSObject hasPostProcessing](v13, "hasPostProcessing"));
              objc_msgSend(v8, "setEssentialBackgroundAssetDownloadEstimate:", -[NSObject essentialBackgroundAssetDownloadEstimate](v13, "essentialBackgroundAssetDownloadEstimate"));
              [v8 setProgress:v11];
              uint64_t v6 = v54;
LABEL_28:
            }
            else if (v11)
            {
              objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "totalUnitCount"));
              goto LABEL_28;
            }
            [*(id *)(a1 + 56) setObject:v8 forKeyedSubscript:v9];
            goto LABEL_30;
          }
          id v13 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            v26 = objc_opt_class();
            *(_DWORD *)buf = v49;
            v61 = v26;
            __int16 v62 = 2114;
            v63 = v8;
            id v27 = v26;
            _os_log_fault_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_FAULT, "[%{public}@]: Encountered result with no bundleID: %{public}@", buf, 0x16u);
          }
LABEL_30:

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v5);
    }
  }
}

- (void)setQueryOptions:(int64_t)a3
{
  self->_queryOptions = a3;
  -[ASDAppQueryExecutor setQueryOptions:](self->_queryExecutor, "setQueryOptions:");
}

uint64_t __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)setObserver:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__ASDAppQuery_setObserver___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __27__ASDAppQuery_setObserver___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v2, "addNotificationObserver:forName:");
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return objc_msgSend(v3, "addProgressObserver:");
  }
  else
  {
    objc_msgSend(v2, "removeNotificationObserver:forName:");
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    return objc_msgSend(v5, "removeProgressObserver:");
  }
}

- (void)dealloc
{
  [(ASDNotificationCenter *)self->_notificationCenter removeNotificationObserver:self forName:@"LS"];
  [(ASDNotificationCenter *)self->_notificationCenter removeProgressObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)ASDAppQuery;
  [(ASDAppQuery *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serviceBroker, 0);
  objc_storeStrong((id *)&self->_resultCache, 0);
  objc_storeStrong((id *)&self->_queryExecutor, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __31__ASDAppQuery__defaultExecutor__block_invoke()
{
  v0 = [ASDAppQueryExecutor alloc];
  v1 = +[ASDServiceBroker defaultBroker];
  uint64_t v2 = [(ASDAppQueryExecutor *)v0 initWithServiceBroker:v1];

  objc_super v3 = (void *)qword_1EB4D6400;
  qword_1EB4D6400 = v2;
}

+ (id)queryForAlmondApps
{
  id v2 = objc_alloc((Class)a1);
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"softwarePlatform == %ld", 1);
  id v4 = (void *)[v2 initWithPredicate:v3];

  return v4;
}

+ (id)queryForAppClipWithStoreItemID:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"isAppClip == YES AND isStoreApp == YES AND storeItemID == %lld", a3);
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithPredicate:v4];

  return v5;
}

+ (id)queryForBeagleApps
{
  id v2 = objc_alloc((Class)a1);
  objc_super v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isOcelot == YES"];
  id v4 = (void *)[v2 initWithPredicate:v3];

  return v4;
}

+ (id)queryForBetaAppsWithStoreItemIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isAppClip == NO AND isBetaApp == YES AND storeItemID IN %@", v4];

  uint64_t v7 = (void *)[v5 initWithPredicate:v6];
  return v7;
}

+ (id)queryForBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleID IN %@", v4];

  uint64_t v7 = (void *)[v5 initWithPredicate:v6];
  return v7;
}

+ (id)queryForBundleAtPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundlePath == %@", v4];

  uint64_t v7 = (void *)[v5 initWithPredicate:v6];
  return v7;
}

+ (id)queryDefaultPairedWatchForBetaApps
{
  objc_super v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Please note that this ASDAppQuery doesn't return real results yet.", v8, 2u);
  }

  id v4 = objc_alloc((Class)a1);
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isBetaApp == YES"];
  id v6 = (void *)[v4 initWithPredicate:v5];

  return v6;
}

+ (id)queryForBetaAppsOnPairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isBetaApp == YES"];
  uint64_t v7 = (void *)[v5 initWithPredicate:v6 onPairedDevice:v4];

  return v7;
}

+ (id)queryForStoreItemIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isAppClip == NO AND isStoreApp == YES AND storeItemID IN %@", v4];

  uint64_t v7 = (void *)[v5 initWithPredicate:v6];
  return v7;
}

+ (id)queryForSystemAppsOnPairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isSystemApp == YES"];
  uint64_t v7 = (void *)[v5 initWithPredicate:v6 onPairedDevice:v4];

  return v7;
}

+ (id)queryWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPredicate:v4];

  return v5;
}

+ (id)queryWithPredicate:(id)a3 onPairedDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithPredicate:v7 onPairedDevice:v6];

  return v8;
}

- (ASDAppQuery)initWithPredicate:(id)a3 onPairedDevice:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  long long v9 = +[ASDAppQuery _defaultExecutor]();
  id v10 = +[ASDServiceBroker defaultBroker];
  id v11 = +[ASDNotificationCenter defaultCenter];
  id v12 = v7;
  if (self)
  {
    id v13 = [(ASDAppQuery *)self initWithPredicate:v8 queryExecutor:v9 serviceBroker:v10 notificationCenter:v11];
    self = v13;
    if (v13) {
      objc_storeStrong((id *)&v13->_device, a4);
    }
  }

  return self;
}

- (ASDAppQueryResultsObserver)observer
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__ASDAppQuery_observer__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDAppQueryResultsObserver *)v3;
}

uint64_t __23__ASDAppQuery_observer__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  return MEMORY[0x1F41817F8]();
}

+ (void)anyWithPredicate:(id)a3 withResultHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ASDAppQuery _defaultExecutor]();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASDAppQuery_anyWithPredicate_withResultHandler___block_invoke;
  v9[3] = &unk_1E58B2D30;
  id v10 = v5;
  id v8 = v5;
  [v7 executeQueryWithPredicate:v6 onPairedDevice:0 withResultHandler:v9];
}

void __50__ASDAppQuery_anyWithPredicate_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

uint64_t __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)notificationCenter:(id)a3 receivedNotifications:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke;
  v8[3] = &unk_1E58B2DF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 16))
  {
    id v2 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke_41;
    v5[3] = &unk_1E58B2E90;
    v5[4] = v1;
    [v2 enumerateObjectsUsingBlock:v5];
  }
  else
  {
    id v3 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      _os_log_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring notifications until query has been run at least once", buf, 0xCu);
    }
  }
}

void __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v3 name];
  char v6 = [v5 isEqualToString:@"LS"];

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:@"RD"];
    if (!v7)
    {
LABEL_8:
      id v11 = objc_msgSend(v4, "objectForKeyedSubscript:", @"AC", *(_OWORD *)v33, *(void *)&v33[16], v34);
      if ([v11 isEqualToString:@"RD"])
      {
        uint64_t v14 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = objc_opt_class();
          *(_DWORD *)v33 = 138543362;
          *(void *)&v33[4] = v15;
          id v16 = v15;
          _os_log_impl(&dword_19BF6A000, v14, OS_LOG_TYPE_INFO, "[%{public}@]: Handling apps registered notification", v33, 0xCu);
        }
        uint64_t v17 = *(void *)(a1 + 32);
        if (!v17) {
          goto LABEL_35;
        }
        long long v18 = [v4 objectForKeyedSubscript:@"AP"];
        if ([v18 count]) {
          -[ASDAppQuery _handleAppsUpdatedWithResults:](v17, v18);
        }
      }
      else if ([v11 isEqualToString:@"UR"])
      {
        dispatch_queue_t v19 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          long long v20 = objc_opt_class();
          *(_DWORD *)v33 = 138543362;
          *(void *)&v33[4] = v20;
          id v21 = v20;
          _os_log_impl(&dword_19BF6A000, v19, OS_LOG_TYPE_INFO, "[%{public}@]: Handling apps unregistered notification", v33, 0xCu);
        }
        uint64_t v22 = *(void *)(a1 + 32);
        if (!v22) {
          goto LABEL_35;
        }
        long long v18 = [v4 objectForKeyedSubscript:@"BI"];
        if ([v18 count]) {
          -[ASDAppQuery _handleAppsRemovedWithBundleIDs:](v22, v18);
        }
      }
      else
      {
        if ([v11 isEqualToString:@"RL"])
        {
          uint64_t v24 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = objc_opt_class();
            *(_DWORD *)v33 = 138543362;
            *(void *)&v33[4] = v25;
            id v26 = v25;
            _os_log_impl(&dword_19BF6A000, v24, OS_LOG_TYPE_INFO, "[%{public}@]: Handling apps refreshed notification", v33, 0xCu);
          }
          -[ASDAppQuery _handleNotificationRefreshWithUserInfo:](*(void *)(a1 + 32), v4);
          goto LABEL_35;
        }
        int v27 = [v11 isEqualToString:@"ER"];
        v28 = ASDLogHandleForCategory(13);
        long long v18 = v28;
        if (v27)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = objc_opt_class();
            *(_DWORD *)v33 = 138543618;
            *(void *)&v33[4] = v29;
            *(_WORD *)&v33[12] = 2114;
            *(void *)&v33[14] = v3;
            id v30 = v29;
            _os_log_impl(&dword_19BF6A000, v18, OS_LOG_TYPE_INFO, "[%{public}@]: Handling app error notification action: %{public}@", v33, 0x16u);
          }
          -[ASDAppQuery _handleNotificationErrorWithUserInfo:](*(void *)(a1 + 32), v4);
          goto LABEL_35;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v31 = objc_opt_class();
          *(_DWORD *)v33 = 138543618;
          *(void *)&v33[4] = v31;
          *(_WORD *)&v33[12] = 2114;
          *(void *)&v33[14] = v3;
          id v32 = v31;
          _os_log_error_impl(&dword_19BF6A000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Received unhandled action: %{public}@", v33, 0x16u);
        }
      }

LABEL_35:
      goto LABEL_36;
    }
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 72);
    if (v8)
    {
      id v9 = [v8 pairingID];
      char v10 = [v9 isEqual:v7];

      id v11 = ASDLogHandleForCategory(13);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if ((v10 & 1) == 0)
      {
        if (v12)
        {
          *(_DWORD *)v33 = 138543618;
          *(void *)&v33[4] = objc_opt_class();
          *(_WORD *)&v33[12] = 2114;
          *(void *)&v33[14] = v7;
          id v23 = *(id *)&v33[4];
          _os_log_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring notification for unmatched device: %{public}@", v33, 0x16u);
        }
        goto LABEL_35;
      }
      if (v12)
      {
        *(_DWORD *)v33 = 138543618;
        *(void *)&v33[4] = objc_opt_class();
        *(_WORD *)&v33[12] = 2114;
        *(void *)&v33[14] = v7;
        id v13 = *(id *)&v33[4];
        _os_log_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_INFO, "[%{public}@]: Handling device specific notification: %{public}@", v33, 0x16u);
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v33 = 138543618;
      *(void *)&v33[4] = objc_opt_class();
      *(_WORD *)&v33[12] = 2114;
      *(void *)&v33[14] = v3;
      id v11 = *(id *)&v33[4];
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Received unexpected notification: %{public}@", v33, 0x16u);
      goto LABEL_35;
    }
  }
LABEL_36:
}

- (void)_handleNotificationRefreshWithUserInfo:(uint64_t)a1
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = [a2 objectForKeyedSubscript:@"BI"];
    if ([v3 count])
    {
      id v4 = (void *)MEMORY[0x1E4F28BA0];
      id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleID IN %@", v3];
      uint64_t v6 = *(void *)(a1 + 88);
      v13[0] = v5;
      v13[1] = v6;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      id v8 = [v4 andPredicateWithSubpredicates:v7];
    }
    else
    {
      id v8 = *(id *)(a1 + 88);
    }
    id v9 = *(void **)(a1 + 72);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke;
    v11[3] = &unk_1E58B2FD0;
    v11[4] = a1;
    id v12 = v3;
    id v10 = v3;
    -[ASDAppQuery _executeQueryWithPredicate:onPairedDevice:withCompletion:](a1, v8, v9, v11);
  }
}

- (void)_handleNotificationErrorWithUserInfo:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 objectForKeyedSubscript:@"AP"];
    if ([v3 count]) {
      -[ASDAppQuery _handleAppsUpdatedWithResults:](a1, v3);
    }
  }
}

- (void)notificationCenter:(id)a3 receivedProgress:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ASDAppQuery_notificationCenter_receivedProgress___block_invoke;
  v8[3] = &unk_1E58B2DF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __51__ASDAppQuery_notificationCenter_receivedProgress___block_invoke(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v3 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
    if (!v3) {
      goto LABEL_45;
    }
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v85;
    uint64_t v81 = *MEMORY[0x1E4F288B0];
    *(void *)&long long v4 = 138543874;
    long long v77 = v4;
    unint64_t v7 = 0x1E4F28000uLL;
    v82 = v2;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v79 = v5;
      do
      {
        if (*(void *)v85 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v84 + 1) + 8 * v8);
        id v10 = *(void **)(*(void *)(a1 + 32) + 56);
        id v11 = objc_msgSend(v9, "bundleID", v77);
        id v12 = [v10 objectForKeyedSubscript:v11];

        if (!v12)
        {
          if (![v9 reportRemotely]) {
            goto LABEL_15;
          }
          uint64_t v17 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            long long v18 = objc_opt_class();
            id v19 = v18;
            long long v20 = [v9 bundleID];
            *(_DWORD *)buf = 138543618;
            id v89 = v18;
            __int16 v90 = 2114;
            v91 = v20;
            _os_log_impl(&dword_19BF6A000, v17, OS_LOG_TYPE_INFO, "[%{public}@]: Found untracked progress for remote install: %{public}@", buf, 0x16u);
          }
          id v21 = [ASDApp alloc];
          uint64_t v22 = [v9 bundleID];
          id v23 = [(ASDApp *)v21 initWithBundleID:v22];

          [(ASDApp *)v23 setStatus:1];
          [(ASDApp *)v23 setRemoteProgress:v9];
          uint64_t v24 = *(void *)(a1 + 32);
          v94 = v23;
          uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
          -[ASDAppQuery _updateCachedResultsWithResults:](v24, v25);

          id v26 = *(void **)(*(void *)(a1 + 32) + 56);
          int v27 = [v9 bundleID];
          id v12 = [v26 objectForKeyedSubscript:v27];

          unint64_t v7 = 0x1E4F28000;
          if (!v12)
          {
LABEL_15:
            id v12 = ASDLogHandleForCategory(13);
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
              goto LABEL_43;
            }
            v28 = objc_opt_class();
            id v13 = v28;
            v29 = [v9 bundleID];
            *(_DWORD *)buf = 138543618;
            id v89 = v28;
            __int16 v90 = 2114;
            v91 = v29;
            _os_log_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring untracked progress for: %{public}@", buf, 0x16u);

            goto LABEL_17;
          }
        }
        if ([v12 isInstalled])
        {
          id v13 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = objc_opt_class();
            id v15 = v14;
            id v16 = [v9 bundleID];
            *(_DWORD *)buf = 138543618;
            id v89 = v14;
            __int16 v90 = 2114;
            v91 = v16;
            _os_log_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring progress for installed: %{public}@", buf, 0x16u);

            unint64_t v7 = 0x1E4F28000;
          }
LABEL_17:

          goto LABEL_43;
        }
        id v30 = [v12 progress];
        if (!v30)
        {
          v45 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            uint64_t v46 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v89 = v46;
            __int16 v90 = 2114;
            v91 = v12;
            id v47 = v46;
            _os_log_impl(&dword_19BF6A000, v45, OS_LOG_TYPE_INFO, "[%{public}@]: Progress started for: %{public}@", buf, 0x16u);
          }
          v31 = -[ASDAppQuery _newProgressForApp:fromRemoteProgress:usingServiceBroker:](*(void *)(a1 + 32), v12, v9);
          [v12 setProgress:v31];
          v48 = -[ASDAppQuery _downloadProgressForApp:fromRemoteProgress:](*(void *)(a1 + 32), v12, v9);
          [v12 setDownloadProgress:v48];

          long long v49 = -[ASDAppQuery _installProgressForApp:fromRemoteProgress:](*(void *)(a1 + 32), v9);
          [v12 setInstallProgress:v49];

          -[NSObject setProgressPhase:](v12, "setProgressPhase:", [v9 phase]);
          v50 = -[ASDAppQuery _postProcessProgressForApp:fromRemoteProgress:](*(void *)(a1 + 32), v12, v9);
          [v12 setPostProcessProgress:v50];
LABEL_37:

          goto LABEL_38;
        }
        v31 = v30;
        objc_msgSend(v30, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount"));
        id v32 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v73 = objc_opt_class();
          id v74 = v73;
          [v31 fractionCompleted];
          *(_DWORD *)buf = v77;
          id v89 = v73;
          unint64_t v7 = 0x1E4F28000;
          __int16 v90 = 2048;
          v91 = v75;
          __int16 v92 = 2114;
          v93 = v12;
          _os_log_debug_impl(&dword_19BF6A000, v32, OS_LOG_TYPE_DEBUG, "[%{public}@]: Setting %.2f for: %{public}@", buf, 0x20u);
        }
        uint64_t v33 = [v9 downloadCompletedUnitCount];
        uint64_t v34 = [v12 downloadProgress];
        [v34 setCompletedUnitCount:v33];

        uint64_t v35 = [v9 downloadTotalUnitCount];
        uint64_t v36 = [v12 downloadProgress];
        [v36 setTotalUnitCount:v35];

        if ([v9 phase] == 2)
        {
          v37 = *(void **)(v7 + 3792);
          [v9 throughput];
          uint64_t v38 = objc_msgSend(v37, "numberWithDouble:");
          v39 = [v12 downloadProgress];
          [v39 setThroughput:v38];

          v40 = [v12 downloadProgress];
          v41 = *(void **)(v7 + 3792);
          [v9 throughput];
          v42 = objc_msgSend(v41, "numberWithDouble:");
          [v40 setUserInfoObject:v42 forKey:v81];

          uint64_t v43 = [v9 secondsRemaining];
          if (v43 < 0)
          {
            uint64_t v44 = 0;
          }
          else
          {
            uint64_t v44 = objc_msgSend(*(id *)(v7 + 3792), "numberWithInteger:", objc_msgSend(v9, "secondsRemaining"));
            v78 = (void *)v44;
          }
          uint64_t v51 = [v12 downloadProgress];
          [v51 setEstimatedTimeRemaining:v44];

          if ((v43 & 0x8000000000000000) == 0) {
          unint64_t v7 = 0x1E4F28000uLL;
          }
        }
        uint64_t v52 = [v9 installCompletedUnitCount];
        uint64_t v53 = [v12 installProgress];
        [v53 setCompletedUnitCount:v52];

        uint64_t v54 = [v9 installTotalUnitCount];
        v55 = [v12 installProgress];
        [v55 setTotalUnitCount:v54];

        -[NSObject setProgressPhase:](v12, "setProgressPhase:", [v9 phase]);
        uint64_t v56 = [v9 postProcessCompletedUnitCount];
        long long v57 = [v12 postProcessProgress];
        [v57 setCompletedUnitCount:v56];

        uint64_t v58 = [v9 postProcessTotalUnitCount];
        long long v59 = [v12 postProcessProgress];
        [v59 setTotalUnitCount:v58];

        if ([v9 phase] == 5)
        {
          uint64_t v60 = v6;
          v61 = *(void **)(v7 + 3792);
          [v9 throughput];
          __int16 v62 = objc_msgSend(v61, "numberWithDouble:");
          v63 = [v12 postProcessProgress];
          [v63 setThroughput:v62];

          v64 = [v12 postProcessProgress];
          uint64_t v65 = *(void **)(v7 + 3792);
          [v9 throughput];
          v66 = objc_msgSend(v65, "numberWithDouble:");
          [v64 setUserInfoObject:v66 forKey:v81];

          uint64_t v67 = [v9 secondsRemaining];
          if (v67 < 0)
          {
            v68 = 0;
            v50 = v80;
          }
          else
          {
            v50 = objc_msgSend(*(id *)(v7 + 3792), "numberWithInteger:", objc_msgSend(v9, "secondsRemaining"));
            v68 = v50;
          }
          v69 = [v12 postProcessProgress];
          [v69 setEstimatedTimeRemaining:v68];

          v80 = v50;
          id v2 = v82;
          uint64_t v6 = v60;
          uint64_t v5 = v79;
          if (v67 < 0) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        id v2 = v82;
LABEL_38:
        -[NSObject setHasPostProcessing:](v12, "setHasPostProcessing:", [v9 hasPostProcessing]);
        -[NSObject setEssentialBackgroundAssetDownloadEstimate:](v12, "setEssentialBackgroundAssetDownloadEstimate:", [v9 essentialBackgroundAssetDownloadEstimate]);
        if ([v31 isFinished])
        {
          v70 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            v71 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v89 = v71;
            __int16 v90 = 2114;
            v91 = v12;
            id v72 = v71;
            _os_log_impl(&dword_19BF6A000, v70, OS_LOG_TYPE_INFO, "[%{public}@]: Progress complete for: %{public}@", buf, 0x16u);

            id v2 = v82;
          }
        }
        [v2 addObject:v12];

        unint64_t v7 = 0x1E4F28000;
LABEL_43:

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
      if (!v5)
      {
LABEL_45:

        -[ASDAppQuery _sendResultsChangedWithResults:](*(void *)(a1 + 32), v2);
        goto LABEL_48;
      }
    }
  }
  id v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v89 = (id)objc_opt_class();
    id v76 = v89;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring progress until query has been run at least once", buf, 0xCu);
  }
LABEL_48:
}

- (void)_newProgressForApp:(uint64_t)a1 fromRemoteProgress:(void *)a2 usingServiceBroker:(void *)a3
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)[a2 copy];
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v5, "totalUnitCount"));
    [v7 setPausable:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke;
    v18[3] = &unk_1E58B2DF0;
    v18[4] = a1;
    id v8 = v6;
    id v19 = v8;
    [v7 setPausingHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_2;
    v16[3] = &unk_1E58B2DF0;
    v16[4] = a1;
    id v9 = v8;
    id v17 = v9;
    [v7 setResumingHandler:v16];
    [v7 setCancellable:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_3;
    void v13[3] = &unk_1E58B2FA8;
    v13[4] = a1;
    id v14 = v9;
    id v10 = v5;
    id v15 = v10;
    id v11 = v9;
    [v7 setCancellationHandler:v13];
    objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount"));
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_downloadProgressForApp:(void *)a3 fromRemoteProgress:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)[a2 copy];
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v5, "downloadTotalUnitCount"));
    [v7 setKind:*MEMORY[0x1E4F28898]];
    objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v5, "downloadCompletedUnitCount"));
    if ([v5 phase] == 2)
    {
      id v8 = NSNumber;
      [v5 throughput];
      id v9 = objc_msgSend(v8, "numberWithDouble:");
      [v7 setThroughput:v9];

      id v10 = NSNumber;
      [v5 throughput];
      id v11 = objc_msgSend(v10, "numberWithDouble:");
      [v7 setUserInfoObject:v11 forKey:*MEMORY[0x1E4F288B0]];

      if (([v5 secondsRemaining] & 0x8000000000000000) == 0)
      {
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "secondsRemaining"));
        [v7 setEstimatedTimeRemaining:v12];
      }
    }
    [v7 setPausable:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke;
    v22[3] = &unk_1E58B2DF0;
    v22[4] = a1;
    id v13 = v6;
    id v23 = v13;
    [v7 setPausingHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_2;
    v20[3] = &unk_1E58B2DF0;
    v20[4] = a1;
    id v14 = v13;
    id v21 = v14;
    [v7 setResumingHandler:v20];
    [v7 setCancellable:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_3;
    v17[3] = &unk_1E58B2FA8;
    void v17[4] = a1;
    id v18 = v14;
    id v19 = v5;
    id v15 = v14;
    [v7 setCancellationHandler:v17];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_installProgressForApp:(uint64_t)a1 fromRemoteProgress:(void *)a2
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F28F90];
    id v3 = a2;
    long long v4 = objc_msgSend(v2, "discreteProgressWithTotalUnitCount:", objc_msgSend(v3, "installTotalUnitCount"));
    uint64_t v5 = [v3 installCompletedUnitCount];

    [v4 setCompletedUnitCount:v5];
    [v4 setPausable:0];
    [v4 setCancellable:0];
  }
  else
  {
    long long v4 = 0;
  }
  return v4;
}

- (id)_postProcessProgressForApp:(void *)a3 fromRemoteProgress:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)[a2 copy];
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v5, "postProcessTotalUnitCount"));
    [v7 setKind:*MEMORY[0x1E4F28898]];
    objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v5, "postProcessCompletedUnitCount"));
    if ([v5 phase] == 5)
    {
      id v8 = NSNumber;
      [v5 throughput];
      id v9 = objc_msgSend(v8, "numberWithDouble:");
      [v7 setThroughput:v9];

      id v10 = NSNumber;
      [v5 throughput];
      id v11 = objc_msgSend(v10, "numberWithDouble:");
      [v7 setUserInfoObject:v11 forKey:*MEMORY[0x1E4F288B0]];

      if (([v5 secondsRemaining] & 0x8000000000000000) == 0)
      {
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "secondsRemaining"));
        [v7 setEstimatedTimeRemaining:v12];
      }
    }
    [v7 setPausable:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke;
    v22[3] = &unk_1E58B2DF0;
    v22[4] = a1;
    id v13 = v6;
    id v23 = v13;
    [v7 setPausingHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_2;
    v20[3] = &unk_1E58B2DF0;
    v20[4] = a1;
    id v14 = v13;
    id v21 = v14;
    [v7 setResumingHandler:v20];
    [v7 setCancellable:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_3;
    v17[3] = &unk_1E58B2FA8;
    void v17[4] = a1;
    id v18 = v14;
    id v19 = v5;
    id v15 = v14;
    [v7 setCancellationHandler:v17];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)_sendResultsChangedWithResults:(uint64_t)a1
{
  id v3 = a2;
  long long v4 = v3;
  if (a1 && [v3 count])
  {
    -[ASDAppQuery _handleQueryOptionsWithResults:](a1, v4);
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__ASDAppQuery__sendResultsChangedWithResults___block_invoke;
    v6[3] = &unk_1E58B2DF0;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)_unitTest_setHasRunOnce:(BOOL)a3
{
  self->_hasRunOnce = a3;
}

- (void)_handleBrokerConnectionNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ASDAppQuery__handleBrokerConnectionNotification___block_invoke;
  block[3] = &unk_1E58B2EB8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __51__ASDAppQuery__handleBrokerConnectionNotification___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = (id)objc_opt_class();
      id v3 = v5;
      _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Forcing query refresh following broker connection", (uint8_t *)&v4, 0xCu);
    }
    -[ASDAppQuery _handleNotificationRefreshWithUserInfo:](*(void *)(a1 + 32), 0);
  }
}

void __34__ASDAppQuery__debugReceivedApps___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134218754;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a3 + 1;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEBUG, "%p app %lu of %lu: %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)_handlePauseForApp:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    int v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Requesting pause: %{public}@", buf, 0xCu);
    }

    id v5 = *(void **)(a1 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__ASDAppQuery__handlePauseForApp___block_invoke;
    v6[3] = &unk_1E58B2F30;
    id v7 = v3;
    [v5 getLibraryServiceWithCompletionHandler:v6];
  }
}

void __34__ASDAppQuery__handlePauseForApp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__ASDAppQuery__handlePauseForApp___block_invoke_2;
    v12[3] = &unk_1E58B2F08;
    __int16 v13 = *(id *)(a1 + 32);
    uint64_t v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    id v7 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__ASDAppQuery__handlePauseForApp___block_invoke_50;
    v10[3] = &unk_1E58B2F08;
    id v11 = v7;
    [v6 pauseApp:v11 withReplyHandler:v10];

    uint64_t v8 = v13;
  }
  else
  {
    uint64_t v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to pause: %{public}@ error: %{public}@", buf, 0x16u);
    }
  }
}

void __34__ASDAppQuery__handlePauseForApp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to pause: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __34__ASDAppQuery__handlePauseForApp___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to pause: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Completed pause: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_handleResumeForApp:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    int v4 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Requesting resume: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = *(void **)(a1 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__ASDAppQuery__handleResumeForApp___block_invoke;
    v6[3] = &unk_1E58B2F30;
    id v7 = v3;
    [v5 getLibraryServiceWithCompletionHandler:v6];
  }
}

void __35__ASDAppQuery__handleResumeForApp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__ASDAppQuery__handleResumeForApp___block_invoke_2;
    v12[3] = &unk_1E58B2F08;
    __int16 v13 = *(id *)(a1 + 32);
    uint64_t v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    id v7 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__ASDAppQuery__handleResumeForApp___block_invoke_52;
    v10[3] = &unk_1E58B2F08;
    id v11 = v7;
    [v6 resumeApp:v11 withReplyHandler:v10];

    int v8 = v13;
  }
  else
  {
    int v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to resume: %{public}@ error: %{public}@", buf, 0x16u);
    }
  }
}

void __35__ASDAppQuery__handleResumeForApp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to resume: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __35__ASDAppQuery__handleResumeForApp___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to resume: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Completed resume: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_handleCancelForApp:(char)a3 reportRemotely:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Requesting cancelation: %{public}@", buf, 0xCu);
    }

    uint64_t v7 = *(void **)(a1 + 64);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke;
    v8[3] = &unk_1E58B2F80;
    char v10 = a3;
    v8[4] = a1;
    id v9 = v5;
    [v7 getLibraryServiceWithCompletionHandler:v8];
  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_7;
    }
    uint64_t v31 = 0;
    id v32 = &v31;
    uint64_t v33 = 0x2050000000;
    uint64_t v7 = (void *)qword_1EB4D6408;
    uint64_t v34 = qword_1EB4D6408;
    if (!qword_1EB4D6408)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNRPairedDeviceRegistryClass_block_invoke;
      uint64_t v36 = &unk_1E58B3000;
      v37 = &v31;
      __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)buf);
      uint64_t v7 = (void *)v32[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v31, 8);
    id v9 = [v8 sharedInstance];
    char v10 = [v9 getActivePairedDevice];
    id v11 = [v10 pairingID];

    if (v11)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_2;
      v29[3] = &unk_1E58B2F58;
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v12 = a1 + 32;
      v29[4] = v13;
      id v30 = *(id *)(v12 + 8);
      uint64_t v14 = [v5 remoteObjectProxyWithErrorHandler:v29];
      uint64_t v15 = *(void **)(v12 + 8);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_53;
      v27[3] = &unk_1E58B2F58;
      v27[4] = *(void *)v12;
      id v28 = v15;
      [v14 cancelApp:v28 onPairedDevice:v11 withReplyHandler:v27];
    }
    else
    {
LABEL_7:
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_54;
      v25[3] = &unk_1E58B2F58;
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v16 = a1 + 32;
      v25[4] = v17;
      id v26 = *(id *)(v16 + 8);
      uint64_t v18 = [v5 remoteObjectProxyWithErrorHandler:v25];
      id v19 = *(void **)(v16 + 8);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_55;
      v23[3] = &unk_1E58B2F58;
      v23[4] = *(void *)v16;
      id v24 = v19;
      [v18 cancelApp:v24 withReplyHandler:v23];
    }
  }
  else
  {
    long long v20 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v36 = v6;
      _os_log_error_impl(&dword_19BF6A000, v20, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel: %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel remote: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel remote: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Completed remote cancelation: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(13);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Completed cancelation: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

void __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke(uint64_t a1)
{
}

void __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_2(uint64_t a1)
{
}

void __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  char v3 = [*(id *)(a1 + 48) reportRemotely];
  -[ASDAppQuery _handleCancelForApp:reportRemotely:](v1, v2, v3);
}

void __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke(uint64_t a1)
{
}

void __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_2(uint64_t a1)
{
}

void __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  char v3 = [*(id *)(a1 + 48) reportRemotely];
  -[ASDAppQuery _handleCancelForApp:reportRemotely:](v1, v2, v3);
}

void __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke(uint64_t a1)
{
}

void __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_2(uint64_t a1)
{
}

void __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  char v3 = [*(id *)(a1 + 48) reportRemotely];
  -[ASDAppQuery _handleCancelForApp:reportRemotely:](v1, v2, v3);
}

- (void)_handleAppsRemovedWithBundleIDs:(uint64_t)a1
{
  if (a1)
  {
    -[ASDAppQuery _removeCachedResultsForBundleIDs:](a1, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ASDAppQuery _sendResultsChangedWithResults:](a1, v3);
  }
}

- (void)_handleAppsUpdatedWithResults:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v10 = v3;
    int v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v5 = [v10 filteredArrayUsingPredicate:*(void *)(a1 + 88)];
    if ([v5 count])
    {
      -[ASDAppQuery _updateCachedResultsWithResults:](a1, v5);
      [v4 addObjectsFromArray:v5];
    }
    uint64_t v6 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:*(void *)(a1 + 88)];
    uint64_t v7 = [v10 filteredArrayUsingPredicate:v6];
    if ([v7 count])
    {
      uint64_t v8 = [v7 valueForKey:@"bundleID"];
      uint64_t v9 = -[ASDAppQuery _removeCachedResultsForBundleIDs:](a1, v8);

      [v4 addObjectsFromArray:v9];
    }
    -[ASDAppQuery _sendResultsChangedWithResults:](a1, v4);

    id v3 = v10;
  }
}

void __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke_2;
    block[3] = &unk_1E58B2FA8;
    block[4] = v7;
    id v12 = v5;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v6;
      id v10 = v15;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Received refresh notification but refresh failed: %{public}@", buf, 0x16u);
    }
  }
}

void __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke_2(uint64_t a1)
{
  -[ASDAppQuery _debugReceivedApps:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 48) count];
  int v4 = *(id **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    -[ASDAppQuery _handleAppsUpdatedWithResults:](*(void *)(a1 + 32), v3);
    id v13 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 48)];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [*(id *)(a1 + 40) valueForKey:@"bundleID"];
    uint64_t v7 = [v5 setWithArray:v6];
    [v13 minusSet:v7];

    if (![v13 count]) {
      goto LABEL_10;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [v13 allObjects];
    -[ASDAppQuery _handleAppsRemovedWithBundleIDs:](v8, v9);
  }
  else
  {
    id v10 = v3;
    id v13 = v10;
    if (!v4) {
      goto LABEL_10;
    }
    uint64_t v11 = -[ASDAppQuery _replaceCachedResultsWithResults:](v4, v10);
    if (v11)
    {
      id v12 = [v13 arrayByAddingObjectsFromArray:v11];
    }
    else
    {
      id v12 = (void *)[v13 copy];
    }
    uint64_t v9 = v12;
    -[ASDAppQuery _sendResultsChangedWithResults:]((uint64_t)v4, v12);
  }
LABEL_10:
}

void __46__ASDAppQuery__sendResultsChangedWithResults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v4 appQuery:*(void *)(a1 + 32) resultsDidChange:*(void *)(a1 + 40)];
  }
}

- (int64_t)queryOptions
{
  return self->_queryOptions;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 88, 1);
}

@end
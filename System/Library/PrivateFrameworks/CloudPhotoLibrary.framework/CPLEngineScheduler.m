@interface CPLEngineScheduler
+ (id)platformImplementationProtocol;
+ (id)validElements;
- (BOOL)_syncSessionIsPossible;
- (BOOL)hasAScheduledSyncSession;
- (BOOL)isClientInForeground;
- (BOOL)isMinglingEnabled;
- (BOOL)isSynchronizationDisabledWithReasonError:(id *)a3;
- (BOOL)waitForEngineElementToBeBlocked:(id)a3 timeout:(double)a4;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineScheduler)initWithEngineLibrary:(id)a3;
- (CPLPlatformObject)platformObject;
- (CPLSyncSessionConfiguration)configuration;
- (CPLSyncSessionPredictor)predictor;
- (id)_minimalDateForFirstSync;
- (id)_pathToFirstSynchronizationMarker;
- (id)componentName;
- (id)requiredStateObserverBlock;
- (id)shouldBackOffOnErrorBlock;
- (unint64_t)requiredState;
- (void)_backOff;
- (void)_disableFastRelaunchProtection;
- (void)_disableRetryAfterLocked;
- (void)_disableSynchronizationBecauseContainerHasBeenWipedLocked;
- (void)_disableSynchronizationWithReasonLocked:(id)a3;
- (void)_enableSynchronizationWithReasonLocked:(id)a3;
- (void)_handleResetAnchorWithError:(id)a3 completionHandler:(id)a4;
- (void)_handleResetClientCacheWithError:(id)a3 completionHandler:(id)a4;
- (void)_handleResetCloudCacheWithError:(id)a3 completionHandler:(id)a4;
- (void)_handleResetGlobalAnchorWithError:(id)a3 completionHandler:(id)a4;
- (void)_keepSessionInformation:(id)a3;
- (void)_noteServerIsUnavailableWithErrorLocked:(id)a3 reason:(id)a4;
- (void)_noteSyncSession:(id)a3 failedDuringPhase:(unint64_t)a4 withError:(id)a5;
- (void)_noteSyncSessionNeededFromState:(unint64_t)a3 minimumDelay:(double)intervalForRetry;
- (void)_noteSyncSessionNeededFromState:(unint64_t)a3 proposedScheduleDate:(id)a4;
- (void)_noteSyncSessionNeededFromStateDontRewindImmediately:(unint64_t)a3;
- (void)_prepareFirstSession;
- (void)_reallyNoteServerHasChangesLocked;
- (void)_reallyStartSyncSession:(id)a3;
- (void)_reallyUnscheduleSession;
- (void)_resetFirstSynchronizationMarker;
- (void)_scheduleNextSyncSession;
- (void)_setRequiredFirstState:(unint64_t)requiredFirstState;
- (void)_startRequiredSyncSession:(id)a3;
- (void)_startSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4 rewind:(BOOL)a5;
- (void)_stopPreparingFirstSession;
- (void)_unscheduleNextSyncSession;
- (void)_updateLastSyncDateIfNecessaryLocked;
- (void)_updateOverridingForeground;
- (void)_writeFirstSynchronizationMarker;
- (void)blockAllSyncSessionsWithReason:(id)a3 onlyIfBlocked:(BOOL)a4 block:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)disableMingling;
- (void)disableSynchronizationIfBlockedWithReason:(id)a3 completionHandler:(id)a4;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)forceStartSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4;
- (void)getCurrentRequiredStateWithCompletionHandler:(id)a3;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)kickOffSyncSession;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)noteClientIsInSyncWithClientCache;
- (void)noteClientIsNotInSyncWithClientCache;
- (void)noteClientNeedsToPull;
- (void)noteContainerHasBeenWiped;
- (void)noteNetworkStateDidChange;
- (void)noteQuotaHasChanged;
- (void)noteResourceDownloadQueueIsFull;
- (void)noteScopeListNeedsUpdate;
- (void)noteScopeNeedsToPullFromTransport;
- (void)noteScopeNeedsToPushHighPriorityToTransport;
- (void)noteScopeNeedsToPushToTransportWithChangeTypes:(unint64_t)a3;
- (void)noteScopeNeedsToUploadComputeState;
- (void)noteScopeNeedsUpdate;
- (void)noteServerHasChanges;
- (void)noteServerIsUnavailableWithError:(id)a3;
- (void)noteServerMightBeAvailableNow;
- (void)noteStoreNeedsCleanup;
- (void)noteStoreNeedsSetup;
- (void)noteStoreNeedsToUpdateDisabledFeatures;
- (void)noteSyncSession:(id)a3 failedDuringPhase:(unint64_t)a4 withError:(id)a5;
- (void)noteSyncSession:(id)a3 stateWillBeAttempted:(unint64_t)a4;
- (void)noteSyncSessionSucceeded:(id)a3;
- (void)noteTransportNeedsUpdate;
- (void)openWithCompletionHandler:(id)a3;
- (void)resetBackoffInterval;
- (void)setRequiredStateObserverBlock:(id)a3;
- (void)setShouldBackOffOnErrorBlock:(id)a3;
- (void)startRequiredSyncSessionNow:(id)a3;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)willRunEngineElement:(id)a3;
@end

@implementation CPLEngineScheduler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldBackOffOnErrorBlock, 0);
  objc_storeStrong(&self->_requiredStateObserverBlock, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong(&self->_syncObserver, 0);
  objc_storeStrong((id *)&self->_lastScopeIdentifiersExludedFromMingling, 0);
  objc_storeStrong((id *)&self->_lastScopeIdentifiersExcludedFromPushToTransport, 0);
  objc_storeStrong((id *)&self->_lastSessionInformation, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulSyncSessionDate, 0);
  objc_storeStrong((id *)&self->_deferDate, 0);
  objc_storeStrong((id *)&self->_lastSyncSessionDateCausedByForeground, 0);
  objc_storeStrong((id *)&self->_blockingLock, 0);
  objc_storeStrong((id *)&self->_unblockOnceElements, 0);
  objc_storeStrong((id *)&self->_blockWaiters, 0);
  objc_storeStrong((id *)&self->_blockedElements, 0);
  objc_storeStrong((id *)&self->_blockingElements, 0);
  objc_storeStrong((id *)&self->_disablingReasons, 0);
  objc_storeStrong((id *)&self->_unavailabilityReason, 0);
  objc_storeStrong((id *)&self->_unavailabilityLimitDate, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proposedScheduleDate, 0);
  objc_storeStrong((id *)&self->_nextSession, 0);
  objc_storeStrong((id *)&self->_preparingFirstSessionStartDate, 0);
}

- (void)setShouldBackOffOnErrorBlock:(id)a3
{
}

- (id)shouldBackOffOnErrorBlock
{
  return self->_shouldBackOffOnErrorBlock;
}

- (void)setRequiredStateObserverBlock:(id)a3
{
}

- (id)requiredStateObserverBlock
{
  return self->_requiredStateObserverBlock;
}

- (CPLSyncSessionPredictor)predictor
{
  return self->_predictor;
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 isEqualToString:@"server-unavailable"])
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__CPLEngineScheduler_testKey_value_completionHandler___block_invoke;
    v14[3] = &unk_1E60A6868;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    v11 = v14;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6896;
    block[3] = &unk_1E60A6978;
    id v18 = v11;
    v12 = queue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v12, v13);
  }
  else
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
  }
}

uint64_t __54__CPLEngineScheduler_testKey_value_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = +[CPLErrors unknownError];
  [v2 _noteServerIsUnavailableWithErrorLocked:v3 reason:a1[5]];

  v4 = *(uint64_t (**)(void))(a1[6] + 16);
  return v4();
}

- (BOOL)hasAScheduledSyncSession
{
  v2 = self;
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_304);
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, &__block_literal_global_306);
  v4 = [(CPLEngineScheduler *)v2 engineLibrary];
  v5 = [v4 store];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_3;
  v15[3] = &unk_1E60A78C8;
  id v16 = v3;
  id v6 = v3;
  id v7 = (id)[v5 performReadTransactionWithBlock:v15];

  dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = v2->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_4;
  block[3] = &unk_1E60A5CE8;
  void block[4] = v2;
  block[5] = &v11;
  dispatch_sync(queue, block);
  LOBYTE(v2) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v2;
}

uint64_t __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 48)) {
    BOOL v2 = *(void *)(v1 + 104) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (unint64_t)requiredState
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_300);
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, &__block_literal_global_302);
  v4 = [(CPLEngineScheduler *)self engineLibrary];
  v5 = [v4 store];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__CPLEngineScheduler_requiredState__block_invoke_3;
  v16[3] = &unk_1E60A78C8;
  id v17 = v3;
  id v6 = v3;
  id v7 = (id)[v5 performReadTransactionWithBlock:v16];

  dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 14;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CPLEngineScheduler_requiredState__block_invoke_4;
  block[3] = &unk_1E60A5CE8;
  void block[4] = self;
  block[5] = &v12;
  dispatch_sync(queue, block);
  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __35__CPLEngineScheduler_requiredState__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __35__CPLEngineScheduler_requiredState__block_invoke_4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)_resetFirstSynchronizationMarker
{
  if (self->_didWriteFirstSyncMarker)
  {
    dispatch_block_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [(CPLEngineScheduler *)self _pathToFirstSynchronizationMarker];
    [v3 removeItemAtURL:v4 error:0];

    self->_didWriteFirstSyncMarker = 0;
  }
}

- (id)_minimalDateForFirstSync
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v4 = [(CPLEngineScheduler *)self _pathToFirstSynchronizationMarker];
  v5 = (void *)[v3 initWithContentsOfURL:v4];

  if (v5) {
    self->_didWriteFirstSyncMarker = 1;
  }
  id v6 = [v5 objectForKey:@"date"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v6 timeIntervalSinceNow], v7 > 0.0))
  {
    id v8 = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingTimeInterval:600.0];
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (void)_writeFirstSynchronizationMarker
{
  v7[1] = *MEMORY[0x1E4F143B8];
  self->_didWriteFirstSyncMarker = 1;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = @"date";
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v5 = [(CPLEngineScheduler *)self _pathToFirstSynchronizationMarker];
  [v4 writeToURL:v5 atomically:1];
}

- (id)_pathToFirstSynchronizationMarker
{
  BOOL v2 = [(CPLEngineScheduler *)self engineLibrary];
  id v3 = [v2 clientLibraryBaseURL];
  v4 = [v3 URLByAppendingPathComponent:@"lastsyncafterlaunch.plist" isDirectory:0];

  return v4;
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E60A7878;
  v19[4] = self;
  id v5 = v4;
  id v20 = v5;
  id v6 = (void *)MEMORY[0x1BA994060](v19);
  double v7 = [(CPLEngineScheduler *)self platformObject];
  if (objc_opt_respondsToSelector())
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_3;
    v17[3] = &unk_1E60A78A0;
    v17[4] = self;
    id v18 = v6;
    id v8 = v6;
    [v7 getStatusDictionaryWithCompletionHandler:v17];
    unint64_t v9 = v18;
  }
  else
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_5;
    v15[3] = &unk_1E60A6978;
    id v16 = v6;
    uint64_t v11 = v15;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6896;
    block[3] = &unk_1E60A6978;
    id v22 = v11;
    uint64_t v12 = queue;
    id v13 = v6;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v12, v14);

    unint64_t v9 = v16;
  }
}

void __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 120) || [*(id *)(v5 + 144) count])
  {
    id v6 = @"disabled";
LABEL_4:
    [v4 setObject:v6 forKeyedSubscript:@"state"];
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 80) <= 0xDuLL)
  {
    id v6 = @"syncing";
    goto LABEL_4;
  }
  if (*(void *)(v10 + 16) > 0xDuLL)
  {
    id v6 = @"quiet";
    goto LABEL_4;
  }
  [v4 setObject:@"scheduler" forKeyedSubscript:@"state"];
  uint64_t v11 = +[CPLEngineSyncManager descriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 setObject:v11 forKeyedSubscript:@"requiredState"];

  uint64_t v12 = NSNumber;
  id v13 = [*(id *)(*(void *)(a1 + 32) + 48) expectedDate];
  dispatch_block_t v14 = v13;
  if (!v13)
  {
    dispatch_block_t v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  [v14 timeIntervalSinceNow];
  uint64_t v15 = objc_msgSend(v12, "numberWithDouble:");
  [v4 setObject:v15 forKeyedSubscript:@"date"];

  if (!v13) {
LABEL_5:
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 184);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_2;
  v19 = &unk_1E60A6728;
  uint64_t v20 = v7;
  id v9 = v4;
  id v21 = v9;
  dispatch_sync(v8, &v16);
  if (v3) {
    objc_msgSend(v9, "addEntriesFromDictionary:", v3, v16, v17, v18, v19, v20);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E60A9C70;
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  uint64_t v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 152) count])
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(*(void *)(a1 + 32) + 152)];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "allKeys", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 removeObject:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    if ([v2 count])
    {
      id v8 = [v2 allObjects];
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:@"blocking"];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 160) count])
    {
      dispatch_block_t v9 = [*(id *)(*(void *)(a1 + 32) + 160) allKeys];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:@"blocked"];
    }
  }
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E60A7828;
  v19[4] = self;
  id v5 = v4;
  id v20 = v5;
  uint64_t v6 = (void *)MEMORY[0x1BA994060](v19);
  uint64_t v7 = [(CPLEngineScheduler *)self platformObject];
  if (objc_opt_respondsToSelector())
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_3;
    v17[3] = &unk_1E60A7850;
    v17[4] = self;
    id v18 = v6;
    id v8 = v6;
    [v7 getStatusWithCompletionHandler:v17];
    dispatch_block_t v9 = v18;
  }
  else
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_5;
    v15[3] = &unk_1E60A6978;
    uint64_t v16 = v6;
    long long v11 = v15;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6896;
    block[3] = &unk_1E60A6978;
    id v22 = v11;
    long long v12 = queue;
    id v13 = v6;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v12, v14);

    dispatch_block_t v9 = v16;
  }
}

void __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  if (!v5)
  {
    long long v10 = *(void **)(v4 + 120);
    if (v10)
    {
      double v11 = *(double *)(v4 + 128);
      long long v12 = (void *)MEMORY[0x1E4F28E78];
      [v10 timeIntervalSinceNow];
      double v14 = fmax(v13, 0.0);
      if (v11 == 0.0)
      {
        double v72 = v14;
        uint64_t v15 = @"Synchronization is disabled because server is unavailable for %.0fs";
      }
      else
      {
        double v73 = v14;
        double v72 = v11;
        uint64_t v15 = @"Synchronization is disabled - %@ (for %.0fs)";
      }
      objc_msgSend(v12, "stringWithFormat:", v15, *(void *)&v72, *(void *)&v73);
      uint64_t v17 = LABEL_17:;
      goto LABEL_18;
    }
    uint64_t v18 = [*(id *)(v4 + 144) count];
    uint64_t v19 = *(void *)(a1 + 32);
    unint64_t v20 = *(void *)(v19 + 16);
    if (v18)
    {
      id v21 = (void *)MEMORY[0x1E4F28E78];
      if (v20 > 0xD)
      {
        id v8 = [*(id *)(v19 + 144) allObjects];
        id v22 = [v8 componentsJoinedByString:@", "];
        dispatch_block_t v9 = [v21 stringWithFormat:@"Synchronization is disabled because of: %@", v22];
        goto LABEL_24;
      }
      id v8 = +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
      id v22 = [*(id *)(*(void *)(a1 + 32) + 144) allObjects];
      v23 = [v22 componentsJoinedByString:@", "];
      [v21 stringWithFormat:@"Needs to start a sync session from %@ but synchronization is disabled because of: %@", v8, v23, v74, v75];
    }
    else
    {
      if (v20 > 0xD)
      {
        if (*(void *)(v19 + 80) <= 0xDuLL)
        {
          v41 = (void *)MEMORY[0x1E4F28E78];
          uint64_t v42 = *(void *)(v19 + 104);
          id v8 = +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
          [v41 stringWithFormat:@"Currently in %@ %@", v42, v8];
          goto LABEL_4;
        }
        v43 = [(id)v19 engineLibrary];
        v44 = [v43 store];
        char v45 = [v44 isClientInSyncWithClientCache];

        if (v45) {
          uint64_t v16 = @"No action is required. No sync session is scheduled";
        }
        else {
          uint64_t v16 = @"Waiting for client to push or pull at least one batch. No sync session is scheduled";
        }
        goto LABEL_9;
      }
      uint64_t v24 = *(void *)(v19 + 48);
      if (!v24)
      {
        if (*(void *)(v19 + 80) > 0xDuLL)
        {
          v56 = [(id)v19 engineLibrary];
          v57 = [v56 systemMonitor];
          int v58 = [v57 isNetworkConnected];

          if (!v58)
          {
            v64 = (void *)MEMORY[0x1E4F28E78];
            id v8 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
            [v64 stringWithFormat:@"Needs to start a sync session from %@, at least, but network is unreachable", v8, *(void *)&v73];
            goto LABEL_4;
          }
          uint64_t v59 = *(void *)(a1 + 32);
          if (*(void *)(v59 + 16) >= 7uLL)
          {
            v60 = [(id)v59 engineLibrary];
            v61 = [v60 store];
            char v62 = [v61 isClientInSyncWithClientCache];

            uint64_t v59 = *(void *)(a1 + 32);
            if ((v62 & 1) == 0)
            {
              v70 = (void *)MEMORY[0x1E4F28E78];
              id v8 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(v59 + 16)];
              [v70 stringWithFormat:@"Needs to start a sync session from %@, at least, waiting for client to push or pull at least one batch", v8, *(void *)&v73];
              goto LABEL_4;
            }
          }
          uint64_t v63 = *(void *)(v59 + 104);
          if (!v63)
          {
            uint64_t v65 = *(void *)(v59 + 16);
            if (v65 == 8)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v59 + 280));
              char v67 = [WeakRetained isExceedingQuota];

              uint64_t v68 = *(void *)(a1 + 32);
              if (v67)
              {
                v69 = (void *)MEMORY[0x1E4F28E78];
                id v8 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(v68 + 16)];
                [v69 stringWithFormat:@"Needs to start a sync session from %@, at least, but user is over-quota", v8, *(void *)&v73];
                goto LABEL_4;
              }
              uint64_t v65 = *(void *)(v68 + 16);
            }
            v71 = (void *)MEMORY[0x1E4F28E78];
            id v8 = +[CPLEngineSyncManager shortDescriptionForState:v65];
            [v71 stringWithFormat:@"Needs to start a sync session from %@, at least, but there is no session scheduled yet", v8, *(void *)&v73];
            goto LABEL_4;
          }
          [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ just started", v63, *(void *)&v73];
          goto LABEL_17;
        }
        v46 = (void *)MEMORY[0x1E4F28E78];
        uint64_t v47 = *(void *)(v19 + 104);
        v48 = +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
        v49 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
        dispatch_block_t v9 = [v46 stringWithFormat:@"Currently in %@ - %@ (required phase is %@)", v47, v48, v49];

        id v8 = [*(id *)(*(void *)(a1 + 32) + 104) currentSessionInformation];
        if (![v8 count]) {
          goto LABEL_25;
        }
        id v22 = [v8 componentsJoinedByString:@"\n\t"];
        [v9 appendFormat:@"\nCurrent session info:\n\t%@", v22];
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v25 = *(void *)(v19 + 216);
      if (v25)
      {
        v26 = (void *)MEMORY[0x1E4F28E78];
        v27 = +[CPLDateFormatter stringFromDateAgo:v25 now:0];
        v28 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
        dispatch_block_t v9 = [v26 stringWithFormat:@"%@ has been deferred %@ (will resume from %@)", v24, v27, v28];

        goto LABEL_26;
      }
      id v8 = [*(id *)(v19 + 48) expectedDate];
      v50 = (void *)MEMORY[0x1E4F28E78];
      uint64_t v51 = *(void *)(a1 + 32);
      uint64_t v52 = *(void *)(v51 + 48);
      id v22 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(v51 + 16)];
      uint64_t v53 = [*(id *)(*(void *)(a1 + 32) + 48) whenItWillStartDescription];
      v23 = (void *)v53;
      if (*(unsigned char *)(*(void *)(a1 + 32) + 226)) {
        v54 = @", delayed because of fast relaunch";
      }
      else {
        v54 = &stru_1F0D5F858;
      }
      if (v8)
      {
        v55 = +[CPLDateFormatter stringFromDate:v8];
        dispatch_block_t v9 = [v50 stringWithFormat:@"Will start %@ from %@, at least, %@%@ (%@)", v52, v22, v23, v54, v55];

        goto LABEL_14;
      }
      [v50 stringWithFormat:@"Will start %@ from %@, at least, %@%@", v52, v22, v53, v54];
    dispatch_block_t v9 = };
LABEL_14:

    goto LABEL_24;
  }
  [v5 timeIntervalSinceNow];
  if (v6 >= -1.0)
  {
    uint64_t v16 = @"Preparing first sync session";
LABEL_9:
    uint64_t v17 = [(__CFString *)v16 mutableCopy];
LABEL_18:
    dispatch_block_t v9 = (void *)v17;
    goto LABEL_26;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F28E78];
  id v8 = +[CPLDateFormatter stringFromDateAgo:*(void *)(*(void *)(a1 + 32) + 8) now:0];
  [v7 stringWithFormat:@"Preparing first sync session (started %@)", v8, *(void *)&v73];
  dispatch_block_t v9 = LABEL_4:;
LABEL_25:

LABEL_26:
  uint64_t v29 = *(void *)(a1 + 32);
  if (*(void *)(v29 + 88) <= 0xDuLL)
  {
    v30 = +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
    v31 = +[CPLEngineSyncManager shortDescriptionForState:11];
    [v9 appendFormat:@" - should also rewind to %@ once %@ is done", v30, v31];

    uint64_t v29 = *(void *)(a1 + 32);
  }
  if (*(void *)(v29 + 104)) {
    v32 = @"current";
  }
  else {
    v32 = @"next";
  }
  v33 = [*(id *)(v29 + 288) currentPrediction];
  [v9 appendFormat:@"\nPrediction for %@ session: %@", v32, v33];

  if (v3) {
    [v9 appendFormat:@"\n%@", v3];
  }
  uint64_t v34 = *(void *)(a1 + 32);
  v35 = *(NSObject **)(v34 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E60A6728;
  void block[4] = v34;
  id v36 = v9;
  id v77 = v36;
  dispatch_sync(v35, block);
  if ([*(id *)(*(void *)(a1 + 32) + 240) count])
  {
    v37 = [*(id *)(*(void *)(a1 + 32) + 240) componentsJoinedByString:@"\n\t"];
    [v36 appendFormat:@"\nLast session info:\n\t%@", v37];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 248) count])
  {
    v38 = [*(id *)(*(void *)(a1 + 32) + 248) componentsJoinedByString:@", "];
    [v36 appendFormat:@"\nScopes excluded from push-to-transport: %@", v38];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 256) count])
  {
    v39 = [*(id *)(*(void *)(a1 + 32) + 256) componentsJoinedByString:@", "];
    [v36 appendFormat:@"\nScopes excluded from mingling: %@", v39];
  }
  v40 = *(void **)(a1 + 32);
  if (v40[25])
  {
    [v36 appendString:@"\nMingling is disabled: waiting for client to finish pushing everything before starting pulling changes"];
    v40 = *(void **)(a1 + 32);
  }
  if (v40[17])
  {
    [v36 appendString:@"\nRunning in foreground mode"];
    v40 = *(void **)(a1 + 32);
  }
  if (v40[24]) {
    [v36 appendString:@"\nSignificant work in progress"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E60A9C70;
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  double v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  uint64_t v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 152) count])
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(*(void *)(a1 + 32) + 152)];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = [*(id *)(*(void *)(a1 + 32) + 160) allKeys];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 removeObject:*(void *)(*((void *)&v14 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }

    if ([v2 count])
    {
      id v8 = *(void **)(a1 + 40);
      dispatch_block_t v9 = [v2 allObjects];
      long long v10 = [v9 componentsJoinedByString:@", "];
      [v8 appendFormat:@"\nBlocking elements: %@", v10];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 160) count])
    {
      id v11 = *(void **)(a1 + 40);
      id v12 = [*(id *)(*(void *)(a1 + 32) + 160) allKeys];
      double v13 = [v12 componentsJoinedByString:@", "];
      [v11 appendFormat:@"\nBlocked elements: %@", v13];
    }
  }
}

- (id)componentName
{
  BOOL v2 = [(CPLEngineScheduler *)self platformObject];
  id v3 = [v2 componentName];

  return v3;
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__CPLEngineScheduler_closeAndDeactivate_completionHandler___block_invoke;
  v12[3] = &unk_1E60AA2D8;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

void __59__CPLEngineScheduler_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
  BOOL v2 = [*(id *)(a1 + 32) platformObject];
  [v2 closeAndDeactivate:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];

  if (*(void *)(*(void *)(a1 + 32) + 264))
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:*(void *)(*(void *)(a1 + 32) + 264) name:@"CPLSyncSessionBlockedStateDidChangeNotification" object:0];

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 264);
    *(void *)(v4 + 264) = 0;
  }
}

- (void)_stopPreparingFirstSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  preparingFirstSessionStartDate = self->_preparingFirstSessionStartDate;
  if (preparingFirstSessionStartDate)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring normal first sync session because it has been superseded", v6, 2u);
      }

      preparingFirstSessionStartDate = self->_preparingFirstSessionStartDate;
    }
    self->_preparingFirstSessionStartDate = 0;

    uint64_t v5 = [(CPLEngineScheduler *)self platformObject];
    [v5 unschedulePersistedSyncSession];
  }
}

- (void)_prepareFirstSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_preparingFirstSessionStartDate)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    preparingFirstSessionStartDate = self->_preparingFirstSessionStartDate;
    self->_preparingFirstSessionStartDate = v3;

    uint64_t v5 = [(CPLEngineScheduler *)self platformObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke;
    v6[3] = &unk_1E60A7800;
    v6[4] = self;
    [v5 schedulePersistedSyncSessionIfAvailableWithCompletionHandler:v6];
  }
}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2;
  v10[3] = &unk_1E60A6728;
  void v10[4] = v4;
  id v11 = v3;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (*(void *)(v2 + 8))
  {
    objc_storeStrong((id *)(v2 + 48), v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 48);
    if (v5) {
      BOOL v6 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      uint64_t v7 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v26 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Found persisted %{public}@", buf, 0xCu);
      }

      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v4 + 48);
    }
    if (v5 && [*(id *)(v4 + 144) count])
    {
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v9 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [*(id *)(*(void *)(a1 + 32) + 144) allObjects];
          id v11 = [v10 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543362;
          v26 = v11;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Unscheduling persisted sync session. Reasons: %{public}@", buf, 0xCu);
        }
      }
      [*(id *)(a1 + 32) _unscheduleNextSyncSession];
    }
    id v12 = [*(id *)(a1 + 32) engineLibrary];
    id v13 = [v12 store];

    if ([v13 isClientInSyncWithClientCache])
    {
      uint64_t v14 = *(void *)(a1 + 32);
      long long v15 = *(void **)(v14 + 8);
      *(void *)(v14 + 8) = 0;

      id v16 = *(void **)(a1 + 32);
      if (v16[6])
      {
        v16[2] = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v21 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Scheduler is ready, requesting a full session soon", buf, 2u);
          }

          id v16 = *(void **)(a1 + 32);
        }
        v16[7] = 0x4014000000000000;
        [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:1 proposedScheduleDate:0];
        *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
      }
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_151;
      v22[3] = &unk_1E60AB550;
      id v13 = v13;
      uint64_t v19 = *(void *)(a1 + 32);
      id v23 = v13;
      uint64_t v24 = v19;
      id v20 = (id)[v13 performReadTransactionWithBlock:v22];
    }
  }
  else
  {
    if (!v3) {
      return;
    }
    if (!_CPLSilentLogging)
    {
      long long v17 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring persisted sync session %@", buf, 0xCu);
      }

      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v13 = [(id)v2 platformObject];
    [v13 unscheduleSyncSession:*(void *)(a1 + 40)];
  }
}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke_151(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cleanupTasks];
  if ([v2 hasCleanupTasks])
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Store has clean tasks to do, requesting a full session soon", buf, 2u);
      }
    }
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 72);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_152;
    v16[3] = &unk_1E60A5DD8;
    void v16[4] = v4;
    BOOL v6 = v16;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __cpl_dispatch_async_block_invoke_6896;
    id v20 = &unk_1E60A6978;
    id v21 = v6;
    uint64_t v7 = v5;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v7, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v9 + 72);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2_153;
    v14[3] = &unk_1E60A6728;
    v14[4] = v9;
    id v15 = *(id *)(a1 + 32);
    id v11 = v14;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __cpl_dispatch_async_block_invoke_6896;
    id v20 = &unk_1E60A6978;
    id v21 = v11;
    id v12 = v10;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v12, v13);
  }
}

uint64_t __42__CPLEngineScheduler__prepareFirstSession__block_invoke_152(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 8) = 0;

    uint64_t v4 = *(void **)(v3 + 32);
    if (v4[6])
    {
      [v4 _unscheduleNextSyncSession];
      uint64_t v4 = *(void **)(v3 + 32);
    }
    v4[7] = 0x4014000000000000;
    result = [*(id *)(v3 + 32) _noteSyncSessionNeededFromState:2 proposedScheduleDate:0];
    *(void *)(*(void *)(v3 + 32) + 56) = 0x3FB99999A0000000;
  }
  return result;
}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2_153(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = 0;

    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Client is not in sync with client cache. Waiting before dispatching the first sync session", v5, 2u);
      }
    }
    if (*(void *)(*(void *)(a1 + 32) + 48))
    {
      if (([*(id *)(a1 + 40) isClientInSyncWithClientCache] & 1) == 0) {
        [*(id *)(a1 + 32) _unscheduleNextSyncSession];
      }
    }
  }
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineScheduler *)self platformObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60A6AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 openWithCompletionHandler:v7];
}

void __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E60A6868;
  id v11 = v3;
  uint64_t v12 = v4;
  id v13 = *(id *)(a1 + 40);
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v15 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v2();
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 112) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 280));
    int v5 = [WeakRetained containerHasBeenWiped];

    id v6 = *(void **)(a1 + 40);
    if (v5)
    {
      uint64_t v7 = [v6 platformObject];
      [v7 unschedulePersistedSyncSession];

      [*(id *)(a1 + 40) _disableSynchronizationBecauseContainerHasBeenWipedLocked];
    }
    else
    {
      [v6 _prepareFirstSession];
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E60A9428;
    v12[4] = *(void *)(a1 + 40);
    uint64_t v9 = [v8 addObserverForName:@"CPLSyncSessionBlockedStateDidChangeNotification" object:0 queue:0 usingBlock:v12];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 264);
    *(void *)(v10 + 264) = v9;

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E60A6728;
  void v10[4] = v4;
  id v11 = v3;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 112))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 40) object];
    if (!v2
      || (id v3 = *(void **)(*(void *)(v1 + 32) + 104)) != 0
      && (uint64_t v12 = (void *)v2,
          [v3 rescheduler],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          uint64_t v2 = (uint64_t)v12,
          v4 == v12))
    {
      uint64_t v13 = v2;
      int v5 = [*(id *)(v1 + 40) userInfo];
      id v6 = [v5 objectForKeyedSubscript:@"isBlocked"];
      uint64_t v7 = [v6 BOOLValue];

      id v8 = [*(id *)(v1 + 40) userInfo];
      dispatch_block_t v9 = [v8 objectForKeyedSubscript:@"syncRequested"];
      uint64_t v10 = [v9 BOOLValue];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v1 + 32) + 280));
      [WeakRetained updateBlockedMetrics:v7 syncRequested:v10];

      uint64_t v2 = v13;
    }
    return MEMORY[0x1F41817F8](v3, v2);
  }
  return result;
}

- (void)getCurrentRequiredStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CPLEngineScheduler_getCurrentRequiredStateWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A9C70;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __67__CPLEngineScheduler_getCurrentRequiredStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (CPLSyncSessionConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  id v3 = [WeakRetained configuration];

  return (CPLSyncSessionConfiguration *)v3;
}

- (void)resetBackoffInterval
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLEngineScheduler_resetBackoffInterval__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __42__CPLEngineScheduler_resetBackoffInterval__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 120))
  {
    [*(id *)(result + 120) timeIntervalSinceNow];
    uint64_t result = *(void *)(a1 + 32);
    if (v3 < 0.0)
    {
      [(id)result _disableRetryAfterLocked];
      uint64_t result = *(void *)(a1 + 32);
    }
  }
  if (*(double *)(result + 56) > 0.100000001)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)dispatch_block_t v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Resetting back-off interval", v5, 2u);
      }

      uint64_t result = *(void *)(a1 + 32);
    }
    *(void *)(result + 56) = 0x3FB99999A0000000;
  }
  return result;
}

- (void)noteQuotaHasChanged
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  double v3 = [(CPLEngineScheduler *)self engineLibrary];
  id v4 = [v3 store];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke;
  v8[3] = &unk_1E60AB878;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = v11;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_3;
  v7[3] = &unk_1E60AB878;
  v7[4] = self;
  void v7[5] = v11;
  id v6 = (id)[v5 performWriteTransactionWithBlock:v8 completionHandler:v7];

  _Block_object_dispose(v11, 8);
}

void __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_2;
  v6[3] = &unk_1E60AB500;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 do:v6];
}

void __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (!v4)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      goto LABEL_10;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 72);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_147;
    v12[3] = &unk_1E60A5DD8;
    v12[4] = v8;
    uint64_t v10 = v12;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v14 = __cpl_dispatch_async_block_invoke_6896;
    id v15 = &unk_1E60A6978;
    id v16 = v10;
    uint64_t v5 = v9;
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v5, v11);

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v5 = [*(id *)(a1 + 32) engineLibrary];
  if ([v5 libraryIsCorrupted]) {
    goto LABEL_9;
  }
  char v6 = [v3 isLibraryClosed];

  if ((v6 & 1) == 0 && !_CPLSilentLogging)
  {
    uint64_t v5 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 error];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Quota change transaction error: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_147(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v3 < 0.0) {
      [*(id *)(a1 + 32) _disableRetryAfterLocked];
    }
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Quota has changed and some scopes were marked as being over quota. Requesting to push", v6, 2u);
    }
  }
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:7 proposedScheduleDate:0];
}

uint64_t __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) scopes];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 enumeratorForScopesIncludeInactive:0];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v18 = a2;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v11)
        {
          char v12 = [v4 flagsForScope:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if ([v12 valueForFlag:2])
          {
            [v12 setValue:0 forFlag:2];
            id v19 = v8;
            int v13 = [v4 updateFlags:v12 forScope:v11 error:&v19];
            id v14 = v19;

            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
            {

              if (!v13) {
                goto LABEL_17;
              }
            }
            else
            {
              id v15 = [*(id *)(a1 + 32) pushRepository];
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v15 isEmpty] ^ 1;

              if ((v13 & 1) == 0)
              {
LABEL_17:

                if (v18)
                {
                  id v14 = v14;
                  uint64_t v16 = 0;
                  *uint64_t v18 = v14;
                }
                else
                {
                  uint64_t v16 = 0;
                }
                goto LABEL_22;
              }
            }
            uint64_t v8 = v14;
          }
          else
          {
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  uint64_t v16 = 1;
  id v14 = v8;
LABEL_22:

  return v16;
}

- (void)noteSyncSession:(id)a3 failedDuringPhase:(unint64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 isCPLOperationDeferredError]
    && [v8 shouldConsiderRequestingMoreTime])
  {
    uint64_t v10 = [(CPLEngineScheduler *)self engineLibrary];
    uint64_t v11 = [v10 store];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__CPLEngineScheduler_noteSyncSession_failedDuringPhase_withError___block_invoke;
    v14[3] = &unk_1E60A77C0;
    id v15 = v11;
    id v16 = v8;
    uint64_t v17 = self;
    unint64_t v19 = a4;
    id v18 = v9;
    id v12 = v11;
    id v13 = (id)[v12 performReadTransactionWithBlock:v14];
  }
  else
  {
    [(CPLEngineScheduler *)self _noteSyncSession:v8 failedDuringPhase:a4 withError:v9];
  }
}

uint64_t __66__CPLEngineScheduler_noteSyncSession_failedDuringPhase_withError___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) syncSessionShouldRequestMoreTime])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 40);
        int v5 = 138412290;
        uint64_t v6 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "%@ has been deferred and should request more time", (uint8_t *)&v5, 0xCu);
      }
    }
    [*(id *)(a1 + 40) noteSyncSessionInformation:@"Session should likely have requested more time to avoid deferral"];
    [*(id *)(a1 + 40) setShouldHaveRequestedMoreTime:1];
  }
  return [*(id *)(a1 + 48) _noteSyncSession:*(void *)(a1 + 40) failedDuringPhase:*(void *)(a1 + 64) withError:*(void *)(a1 + 56)];
}

- (void)_noteSyncSession:(id)a3 failedDuringPhase:(unint64_t)a4 withError:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke;
  v17[3] = &unk_1E60A7798;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  SEL v20 = a2;
  unint64_t v21 = a4;
  id v12 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  id v13 = queue;
  id v14 = v10;
  id v15 = v9;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke(uint64_t a1)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 104) == *(void *)(a1 + 40))
  {
    uint64_t v2 = *(id *)(a1 + 48);
    if (![v2 isCPLOperationDeferredError])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 42) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
      goto LABEL_32;
    }
    int v6 = [*(id *)(a1 + 40) shouldConsiderRequestingMoreTime];
    uint64_t v7 = *(void **)(a1 + 40);
    if (v6)
    {
      if ([v7 shouldRequestMoreTime])
      {
        if (!_CPLSilentLogging)
        {
          id v8 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = *(void **)(a1 + 40);
            *(_DWORD *)long long buf = 138412290;
            v109 = v9;
            _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "%@ has been deferred again and should request even more time", buf, 0xCu);
          }
        }
        id v10 = *(void **)(a1 + 40);
        uint64_t v11 = @"Session should likely request even more time to avoid more deferrals";
      }
      else
      {
        uint64_t v16 = *(void *)(a1 + 32);
        if (!*(unsigned char *)(v16 + 42))
        {
          if (_CPLSilentLogging)
          {
            char v13 = 1;
            goto LABEL_28;
          }
          uint64_t v42 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = *(void **)(a1 + 40);
            *(_DWORD *)long long buf = 138412290;
            v109 = v43;
            _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_DEFAULT, "%@ has been deferred and should request more time if deferred again", buf, 0xCu);
          }

          char v13 = 1;
LABEL_27:
          uint64_t v16 = *(void *)(a1 + 32);
LABEL_28:
          *(unsigned char *)(v16 + 42) = v13;
          int v19 = [*(id *)(a1 + 40) shouldHaveRequestedMoreTime];
          uint64_t v20 = *(void *)(a1 + 32);
          if (v19)
          {
            *(unsigned char *)(v20 + 41) = 1;
            uint64_t v21 = +[CPLErrors cplErrorWithCode:258 underlyingError:v2 description:@"Sync session should have requested more time"];

            uint64_t v2 = v21;
          }
          else
          {
            *(unsigned char *)(v20 + 41) = 0;
            [*(id *)(a1 + 40) setShouldRequestMoreTime:0];
          }
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
          [WeakRetained updateBlockedMetrics:1 syncRequested:0];

LABEL_32:
          [*(id *)(a1 + 32) _keepSessionInformation:*(void *)(a1 + 40)];
          uint64_t v23 = *(void *)(a1 + 32);
          uint64_t v24 = *(void **)(v23 + 232);
          *(void *)(v23 + 232) = 0;

          id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
          [v25 reportUnsuccessfulSync];

          *(void *)(*(void *)(a1 + 32) + 80) = 14;
          if (!_CPLSilentLogging)
          {
            v26 = __CPLSchedulerOSLogDomain_7035();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v27 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(a1 + 64)];
              *(_DWORD *)long long buf = 138412546;
              v109 = v27;
              __int16 v110 = 2112;
              v111 = v2;
              _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEBUG, "Sync session failed %@: %@", buf, 0x16u);
            }
          }
          id v28 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
          uint64_t v29 = [v28 systemMonitor];
          [v29 updateDiskPressureState];

          if (![v2 isCPLError])
          {
            int v31 = 0;
            BOOL v32 = 1;
LABEL_42:
            int v33 = 1;
            goto LABEL_105;
          }
          uint64_t v30 = [v2 code];
          int v31 = 0;
          BOOL v32 = 1;
          if (v30 <= 256)
          {
            if (v30 <= 39)
            {
              int v33 = 1;
              switch(v30)
              {
                case 18:
                  int v31 = 0;
                  BOOL v32 = (unint64_t)(*(void *)(a1 + 64) - 9) < 0xFFFFFFFFFFFFFFFELL;
                  goto LABEL_105;
                case 19:
                case 23:
                  goto LABEL_105;
                case 20:
                  v44 = *(void **)(a1 + 32);
                  v105[0] = MEMORY[0x1E4F143A8];
                  v105[1] = 3221225472;
                  v105[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_130;
                  v105[3] = &unk_1E60A6660;
                  v105[4] = v44;
                  id v106 = *(id *)(a1 + 40);
                  v107 = v2;
                  [v44 _handleResetClientCacheWithError:v107 completionHandler:v105];
                  uint64_t v45 = *(void *)(a1 + 32);
                  v46 = *(void **)(v45 + 104);
                  *(void *)(v45 + 104) = 0;

                  uint64_t v47 = v106;
                  goto LABEL_101;
                case 21:
                  v48 = *(void **)(a1 + 32);
                  uint64_t v92 = MEMORY[0x1E4F143A8];
                  uint64_t v93 = 3221225472;
                  v94 = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_2;
                  v95 = &unk_1E60A6660;
                  v96 = v48;
                  id v97 = *(id *)(a1 + 40);
                  v98 = v2;
                  [v48 _handleResetCloudCacheWithError:v98 completionHandler:&v92];
                  uint64_t v49 = *(void *)(a1 + 32);
                  v50 = *(void **)(v49 + 104);
                  *(void *)(v49 + 104) = 0;

                  uint64_t v47 = v97;
                  goto LABEL_101;
                case 22:
                  if (*(void *)(a1 + 64) == 4)
                  {
                    if (!_CPLSilentLogging)
                    {
                      uint64_t v51 = __CPLSchedulerOSLogDomain_7035();
                      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_impl(&dword_1B4CAC000, v51, OS_LOG_TYPE_DEFAULT, "Glboal sync anchor expired, will pull all scopes from the beginning", buf, 2u);
                      }
                    }
                    uint64_t v52 = *(void **)(a1 + 32);
                    v102[0] = MEMORY[0x1E4F143A8];
                    v102[1] = 3221225472;
                    v102[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_131;
                    v102[3] = &unk_1E60A6660;
                    v102[4] = v52;
                    id v103 = *(id *)(a1 + 40);
                    v104 = v2;
                    [v52 _handleResetGlobalAnchorWithError:v104 completionHandler:v102];
                    uint64_t v53 = *(void *)(a1 + 32);
                    v54 = *(void **)(v53 + 104);
                    *(void *)(v53 + 104) = 0;

                    goto LABEL_104;
                  }
                  if (!_CPLSilentLogging)
                  {
                    v71 = __CPLSchedulerOSLogDomain_7035();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl(&dword_1B4CAC000, v71, OS_LOG_TYPE_DEFAULT, "Sync anchor expired, we can't trust the cloud cache anymore", buf, 2u);
                    }
                  }
                  double v72 = *(void **)(a1 + 32);
                  v99[0] = MEMORY[0x1E4F143A8];
                  v99[1] = 3221225472;
                  v99[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_132;
                  v99[3] = &unk_1E60A6660;
                  v99[4] = v72;
                  id v100 = *(id *)(a1 + 40);
                  v101 = v2;
                  [v72 _handleResetCloudCacheWithError:v101 completionHandler:v99];
                  uint64_t v73 = *(void *)(a1 + 32);
                  uint64_t v74 = *(void **)(v73 + 104);
                  *(void *)(v73 + 104) = 0;

                  uint64_t v47 = v100;
LABEL_101:

                  int v33 = 0;
                  int v31 = 1;
                  break;
                case 24:
                  [*(id *)(a1 + 32) _handleResetAnchorWithError:v2 completionHandler:&__block_literal_global_134];
                  goto LABEL_104;
                default:
                  goto LABEL_42;
              }
              goto LABEL_105;
            }
            if (v30 != 40 && v30 != 41)
            {
              int v33 = 1;
              if (v30 != 82) {
                goto LABEL_105;
              }
LABEL_93:
              char v62 = [*(id *)(a1 + 32) platformObject];
              [v62 noteSyncSession:*(void *)(a1 + 40) failedWithError:v2];

              uint64_t v63 = *(void *)(a1 + 32);
              v64 = *(void **)(v63 + 104);
              *(void *)(v63 + 104) = 0;

              goto LABEL_94;
            }
            BOOL v32 = 0;
            int v31 = 0;
            goto LABEL_42;
          }
          if (v30 <= 999)
          {
            if (v30 == 257)
            {
              uint64_t v65 = [*(id *)(a1 + 32) platformObject];
              [v65 noteSyncSession:*(void *)(a1 + 40) failedWithError:v2];

              objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(a1 + 32) + 104));
              uint64_t v66 = [MEMORY[0x1E4F1C9C8] date];
              uint64_t v67 = *(void *)(a1 + 32);
              uint64_t v68 = *(void **)(v67 + 216);
              *(void *)(v67 + 216) = v66;

              uint64_t v69 = *(void *)(a1 + 32);
              v70 = *(void **)(v69 + 104);
              *(void *)(v69 + 104) = 0;

              [*(id *)(*(void *)(a1 + 32) + 48) dropExpectedDate];
LABEL_94:
              int v31 = 0;
              int v33 = 0;
              goto LABEL_105;
            }
            int v33 = 1;
            if (v30 != 258)
            {
LABEL_105:
              uint64_t v75 = *(void *)(a1 + 32);
              unint64_t v76 = *(void *)(v75 + 88);
              unint64_t v77 = *(void *)(v75 + 16);
              if (v76 >= v77) {
                unint64_t v78 = v77;
              }
              else {
                unint64_t v78 = v76;
              }
              unint64_t v79 = objc_msgSend(*(id *)(a1 + 40), "requiredStateAtEndOfSyncSession", v92, v93, v94, v95, v96);
              if (v78 >= v79) {
                unint64_t v80 = v79;
              }
              else {
                unint64_t v80 = v78;
              }
              *(void *)(*(void *)(a1 + 32) + 16) = v80;
              if (v33)
              {
                v81 = [*(id *)(a1 + 32) platformObject];
                [v81 noteSyncSession:*(void *)(a1 + 40) failedWithError:v2];

                uint64_t v82 = *(void *)(a1 + 32);
                v83 = *(void **)(v82 + 104);
                *(void *)(v82 + 104) = 0;

                uint64_t v84 = *(void *)(a1 + 32);
                if (*(void *)(v84 + 24) == *(void *)(v84 + 32) && (unint64_t v85 = *(void *)(a1 + 64), v85 <= 0xD))
                {
                  if (v32)
                  {
                    [(id)v84 _backOff];
                    uint64_t v84 = *(void *)(a1 + 32);
                  }
                  uint64_t v86 = *(void *)(v84 + 304);
                  if (v86)
                  {
                    if (*(double *)(v84 + 56) > 5.0)
                    {
                      char v87 = (*(uint64_t (**)(void))(v86 + 16))(*(void *)(v84 + 304));
                      uint64_t v84 = *(void *)(a1 + 32);
                      if ((v87 & 1) == 0)
                      {
                        uint64_t v88 = *(void *)(v84 + 296);
                        unint64_t v85 = 14;
                        if (v88)
                        {
                          (*(void (**)(void, uint64_t))(v88 + 16))(*(void *)(v84 + 296), 14);
                          uint64_t v84 = *(void *)(a1 + 32);
                        }
                      }
                    }
                  }
                  [(id)v84 _noteSyncSessionNeededFromState:v85 proposedScheduleDate:0];
                }
                else
                {
                  if (v32)
                  {
                    [(id)v84 _backOff];
                    uint64_t v84 = *(void *)(a1 + 32);
                  }
                  uint64_t v89 = *(void *)(v84 + 304);
                  if (v89)
                  {
                    if (*(double *)(v84 + 56) > 5.0)
                    {
                      char v90 = (*(uint64_t (**)(void))(v89 + 16))(*(void *)(v84 + 304));
                      uint64_t v84 = *(void *)(a1 + 32);
                      if ((v90 & 1) == 0)
                      {
                        uint64_t v91 = *(void *)(v84 + 296);
                        if (v91)
                        {
                          (*(void (**)(void, uint64_t))(v91 + 16))(*(void *)(v84 + 296), 14);
                          uint64_t v84 = *(void *)(a1 + 32);
                        }
                        [(id)v84 _noteSyncSessionNeededFromState:14 proposedScheduleDate:0];
                        uint64_t v84 = *(void *)(a1 + 32);
                      }
                    }
                  }
                  [(id)v84 _scheduleNextSyncSession];
                }
                [*(id *)(a1 + 40) noteClientNeedsToPullIfNecessary];
              }
              else if (v31)
              {
                [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:14 proposedScheduleDate:0];
              }
              [*(id *)(a1 + 32) _updateOverridingForeground];
              goto LABEL_135;
            }
            if (_CPLSilentLogging)
            {
LABEL_66:
              BOOL v32 = 0;
LABEL_104:
              int v31 = 0;
              goto LABEL_105;
            }
            v37 = __CPLSchedulerOSLogDomain_7035();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
LABEL_65:

              goto LABEL_66;
            }
            v38 = *(void **)(a1 + 40);
            *(_DWORD *)long long buf = 138412290;
            v109 = v38;
            v39 = "%@ has been deferred and should have requested more time - retrying immediately";
            v40 = v37;
            uint32_t v41 = 12;
          }
          else
          {
            int v33 = 1;
            switch(v30)
            {
              case 1000:
                uint64_t v34 = *(void **)(a1 + 32);
                v35 = v2;
                id v36 = 0;
                goto LABEL_92;
              case 1001:
                id v55 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
                [v55 setICloudLibraryClientVersionTooOld:1];

                uint64_t v34 = *(void **)(a1 + 32);
                id v36 = @"client is too old";
                goto LABEL_91;
              case 1002:
              case 1003:
              case 1005:
              case 1006:
              case 1007:
              case 1008:
                goto LABEL_105;
              case 1004:
                if (*(void *)(*(void *)(a1 + 32) + 16) >= *(void *)(a1 + 64))
                {
                  v56 = [v2 userInfo];
                  v57 = [v56 objectForKeyedSubscript:@"CPLErrorRetryAfterDate"];

                  if (v57 && ([v57 timeIntervalSinceNow], double v59 = fmin(v58, 86400.0), v59 > 5.0))
                  {
                    BOOL v32 = 0;
                    *(double *)(*(void *)(a1 + 32) + 56) = v59;
                  }
                  else
                  {
                    BOOL v32 = 1;
                  }
                }
                goto LABEL_104;
              case 1009:
                if (!_CPLSilentLogging)
                {
                  v60 = __CPLSchedulerOSLogDomain_7035();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_1B4CAC000, v60, OS_LOG_TYPE_ERROR, "Encryption keys are invalid - disabling synchronization temporarily", buf, 2u);
                  }
                }
                uint64_t v34 = *(void **)(a1 + 32);
                id v36 = @"encryption keys are invalid";
                goto LABEL_91;
              case 1010:
                if (!_CPLSilentLogging)
                {
                  v61 = __CPLSchedulerOSLogDomain_7035();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_1B4CAC000, v61, OS_LOG_TYPE_DEFAULT, "Encryption keys are not available yet - disabling synchronization temporarily", buf, 2u);
                  }
                }
                uint64_t v34 = *(void **)(a1 + 32);
                id v36 = @"waiting for encryption keys";
LABEL_91:
                v35 = v2;
LABEL_92:
                [v34 _noteServerIsUnavailableWithErrorLocked:v35 reason:v36];
                goto LABEL_93;
              default:
                int v33 = 1;
                if (v30 != 10000) {
                  goto LABEL_105;
                }
                if (_CPLSilentLogging) {
                  goto LABEL_66;
                }
                v37 = __CPLSchedulerOSLogDomain_7035();
                if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_65;
                }
                *(_WORD *)long long buf = 0;
                v39 = "Scheduler has been asked to retry sync session immediately";
                v40 = v37;
                uint32_t v41 = 2;
                break;
            }
          }
          _os_log_impl(&dword_1B4CAC000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
          goto LABEL_65;
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v17 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = *(void **)(a1 + 40);
            *(_DWORD *)long long buf = 138412290;
            v109 = v18;
            _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "%@ has been deferred twice in a row and should request more time", buf, 0xCu);
          }
        }
        id v10 = *(void **)(a1 + 40);
        uint64_t v11 = @"Session should likely request more time to avoid more deferrals";
      }
      [v10 noteSyncSessionInformation:v11];
      [*(id *)(a1 + 40) setShouldHaveRequestedMoreTime:1];
    }
    else
    {
      char v12 = [v7 shouldHaveRequestedMoreTime];
      char v13 = 0;
      if ((v12 & 1) != 0 || _CPLSilentLogging) {
        goto LABEL_27;
      }
      id v14 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        v109 = v15;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "%@ has been deferred for external reasons", buf, 0xCu);
      }
    }
    char v13 = 0;
    goto LABEL_27;
  }
  if (_CPLSilentLogging) {
    return;
  }
  uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v4 = *(NSObject **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 104);
    *(_DWORD *)long long buf = 138412802;
    v109 = v3;
    __int16 v110 = 2114;
    v111 = v4;
    __int16 v112 = 2114;
    uint64_t v113 = v5;
    _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "%@: ignoring %{public}@ - current session is %{public}@", buf, 0x20u);
  }
LABEL_135:
}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_130(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 noteSyncSession:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_131(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 noteSyncSession:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_132(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 noteSyncSession:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 noteSyncSession:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

- (void)_handleResetGlobalAnchorWithError:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = [a3 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"CPLErrorResetReason"];
  id v10 = (void *)v9;
  uint64_t v11 = @"needs refresh";
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  char v12 = v11;

  char v13 = [(CPLEngineScheduler *)self engineLibrary];
  id v14 = [v13 store];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke;
  v22[3] = &unk_1E60AB550;
  id v23 = v14;
  uint64_t v24 = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_120;
  v19[3] = &unk_1E60A7770;
  id v20 = v7;
  SEL v21 = a2;
  v19[4] = self;
  id v15 = v7;
  uint64_t v16 = v12;
  id v17 = v14;
  id v18 = (id)[v17 performWriteTransactionWithBlock:v22 completionHandler:v19];
}

void __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60AB750;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 do:v4];
}

void __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_120(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 error];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    if ([v4 libraryIsCorrupted])
    {
    }
    else
    {
      char v5 = [v10 isLibraryClosed];

      if ((v5 & 1) == 0)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
        [v6 handleFailureInMethod:v7 object:v8 file:v9 lineNumber:1481 description:@"Store is in a very bad state."];

        abort();
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Resetting global sync anchor", v8, 2u);
    }
  }
  char v5 = [*(id *)(a1 + 32) scopes];
  uint64_t v6 = [v5 storeScopeListSyncAnchor:0 error:a2];

  if (v6) {
    [*(id *)(a1 + 32) noteOtherResetEvent:@"globalAnchor" cause:*(void *)(a1 + 40)];
  }
  return v6;
}

- (void)_handleResetAnchorWithError:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"CPLErrorResetReason"];
  id v10 = (void *)v9;
  uint64_t v11 = @"needs refresh";
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  char v12 = v11;

  char v13 = [v8 objectForKeyedSubscript:@"CPLErrorScopeIdentifiers"];
  id v14 = [(CPLEngineScheduler *)self engineLibrary];
  id v15 = [v14 store];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke;
  v24[3] = &unk_1E60AA170;
  id v25 = v13;
  id v26 = v15;
  uint64_t v27 = v12;
  id v28 = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_116;
  v21[3] = &unk_1E60A7770;
  id v22 = v7;
  SEL v23 = a2;
  v21[4] = self;
  id v16 = v7;
  id v17 = v12;
  id v18 = v15;
  id v19 = v13;
  id v20 = (id)[v18 performWriteTransactionWithBlock:v24 completionHandler:v21];
}

void __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60AB778;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  [a2 do:v6];
}

void __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_116(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 error];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    if ([v4 libraryIsCorrupted])
    {
    }
    else
    {
      char v5 = [v10 isLibraryClosed];

      if ((v5 & 1) == 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
        [v6 handleFailureInMethod:v7 object:v8 file:v9 lineNumber:1457 description:@"Store is in a very bad state."];

        abort();
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) count])
  {
    if (!_CPLSilentLogging)
    {
      id v15 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v23 = v16;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "Reset sync anchor for all scopes with reason '%{public}@'", buf, 0xCu);
      }
    }
    id v4 = [*(id *)(a1 + 56) engineLibrary];
    id v5 = [v4 store];
    uint64_t v7 = [v5 resetSyncAnchorWithCause:*(void *)(a1 + 48) error:a2];
    goto LABEL_25;
  }
  id v4 = [*(id *)(a1 + 40) scopes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  uint64_t v7 = v6 == 0;
  if (!v6)
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v8 = v6;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      char v12 = objc_msgSend(v4, "scopeWithIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      if (v12)
      {
        if (([v4 resetSyncAnchorForScope:v12 error:a2] & 1) == 0)
        {

          goto LABEL_25;
        }
        ++v9;
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v8) {
      continue;
    }
    break;
  }

  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      char v13 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v23 = v9;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Reset sync anchor for %lu scopes of %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 40) noteOtherResetEvent:@"anchor" cause:*(void *)(a1 + 48)];
  }
  uint64_t v7 = 1;
LABEL_26:

  return v7;
}

- (void)_handleResetCloudCacheWithError:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 userInfo];
  uint64_t v9 = [v8 objectForKey:@"CPLErrorResetReason"];

  uint64_t v10 = [(CPLEngineScheduler *)self engineLibrary];
  uint64_t v11 = [v10 store];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke;
  v18[3] = &unk_1E60AB550;
  v18[4] = self;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60A7770;
  id v16 = v7;
  SEL v17 = a2;
  void v15[4] = self;
  id v12 = v7;
  id v13 = v9;
  id v14 = (id)[v11 performWriteTransactionWithBlock:v18 completionHandler:v15];
}

void __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60AB750;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 do:v4];
}

void __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 error];

  id v4 = [*(id *)(a1 + 32) engineLibrary];
  id v5 = v4;
  if (!v3)
  {
    uint64_t v11 = [v4 syncManager];
    [v11 resetTransportUserIdentifier];

    goto LABEL_6;
  }
  if ([v4 libraryIsCorrupted])
  {
LABEL_6:

    goto LABEL_7;
  }
  char v6 = [v12 isLibraryClosed];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
    [v7 handleFailureInMethod:v8 object:v9 file:v10 lineNumber:1410 description:@"Store is in a very bad state."];

    abort();
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) engineLibrary];
  id v5 = [v4 store];
  char v6 = v5;
  if (*(void *)(a1 + 40)) {
    id v7 = *(__CFString **)(a1 + 40);
  }
  else {
    id v7 = @"cloud cache invalid";
  }
  uint64_t v8 = [v5 resetCompleteSyncStateWithCause:v7 error:a2];

  return v8;
}

- (void)_handleResetClientCacheWithError:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 userInfo];
  uint64_t v9 = [v8 objectForKey:@"CPLErrorResetReason"];

  uint64_t v10 = [(CPLEngineScheduler *)self engineLibrary];
  uint64_t v11 = [v10 store];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke;
  v18[3] = &unk_1E60AB550;
  v18[4] = self;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60A7770;
  id v16 = v7;
  SEL v17 = a2;
  void v15[4] = self;
  id v12 = v7;
  id v13 = v9;
  id v14 = (id)[v11 performWriteTransactionWithBlock:v18 completionHandler:v15];
}

void __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60AB750;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 do:v4];
}

void __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 error];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    if ([v4 libraryIsCorrupted])
    {
    }
    else
    {
      char v5 = [v10 isLibraryClosed];

      if ((v5 & 1) == 0)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
        [v6 handleFailureInMethod:v7 object:v8 file:v9 lineNumber:1392 description:@"Store is in a very bad state."];

        abort();
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) engineLibrary];
  char v5 = [v4 store];
  char v6 = v5;
  if (*(void *)(a1 + 40)) {
    uint64_t v7 = *(__CFString **)(a1 + 40);
  }
  else {
    uint64_t v7 = @"Client cache invalid";
  }
  uint64_t v8 = [v5 resetLocalSyncStateWithCause:v7 error:a2];

  return v8;
}

- (void)noteSyncSessionSucceeded:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CPLEngineScheduler_noteSyncSessionSucceeded___block_invoke;
  void v11[3] = &unk_1E60A65C0;
  v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  uint64_t v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __47__CPLEngineScheduler_noteSyncSessionSucceeded___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v3 == v2)
  {
    if ([v3 shouldRequestMoreTime]) {
      BOOL v8 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v9 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_block_t v10 = *(void **)(a1 + 40);
        int v34 = 138412290;
        v35 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "%@ with extended running time succeeded", (uint8_t *)&v34, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 42) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
    [*(id *)(a1 + 32) _keepSessionInformation:*(void *)(a1 + 40)];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = *(void *)(a1 + 32);
    SEL v13 = *(void **)(v12 + 232);
    *(void *)(v12 + 232) = v11;

    [*(id *)(a1 + 32) _resetFirstSynchronizationMarker];
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    [v4 requestAttachedLibrary];
    id v14 = [v4 systemMonitor];
    [v14 updateDiskPressureState];

    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 120);
    *(void *)(v15 + 120) = 0;

    uint64_t v17 = *(void *)(a1 + 32);
    long long v18 = *(void **)(v17 + 128);
    *(void *)(v17 + 128) = 0;

    *(void *)(*(void *)(a1 + 32) + 80) = 14;
    *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
    id v19 = *(void **)(a1 + 32);
    if (v19[4] == v19[3])
    {
      long long v20 = [v19 platformObject];
      [v20 noteSyncSessionSucceeded:*(void *)(a1 + 40)];

      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(void **)(v21 + 104);
      *(void *)(v21 + 104) = 0;

      [*(id *)(a1 + 32) _setRequiredFirstState:14];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v23 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = *(void **)(a1 + 40);
          id v25 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
          int v34 = 138543618;
          v35 = v24;
          __int16 v36 = 2114;
          v37 = v25;
          _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ did succeed but we were asked to do %{public}@ meanwhile. Restarting immediately", (uint8_t *)&v34, 0x16u);
        }
        id v19 = *(void **)(a1 + 32);
      }
      [v19 _startRequiredSyncSession:*(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 40) noteClientNeedsToPullIfNecessary];
    unint64_t v26 = [*(id *)(a1 + 40) requiredStateAtEndOfSyncSession];
    unint64_t v27 = v26;
    uint64_t v28 = *(void *)(a1 + 32);
    unint64_t v29 = *(void *)(v28 + 88);
    if (v29 == 14 && v26 <= 0xD)
    {
      int v30 = [*(id *)(a1 + 40) shouldRescheduleASyncSession];
      int v31 = *(void **)(a1 + 32);
      if (v30)
      {
        BOOL v32 = [*(id *)(a1 + 40) proposedRescheduleDate];
        [v31 _noteSyncSessionNeededFromState:v27 proposedScheduleDate:v32];
      }
      else
      {
        [*(id *)(a1 + 32) _setRequiredFirstState:v27];
      }
    }
    else
    {
      if (v29 >= v26) {
        unint64_t v29 = v26;
      }
      *(void *)(v28 + 88) = v29;
    }
    int v33 = *(void **)(a1 + 32);
    if (v33[11] <= 0xDuLL)
    {
      objc_msgSend(v33, "_noteSyncSessionNeededFromState:proposedScheduleDate:");
      int v33 = *(void **)(a1 + 32);
    }
    [v33 _updateLastSyncDateIfNecessaryLocked];
    [*(id *)(a1 + 32) _updateOverridingForeground];
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      char v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 104);
      int v34 = 138412802;
      v35 = v5;
      __int16 v36 = 2114;
      v37 = v6;
      __int16 v38 = 2114;
      uint64_t v39 = v7;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%@: ignoring %{public}@ - current session is %{public}@", (uint8_t *)&v34, 0x20u);
    }
  }
}

- (void)_keepSessionInformation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 popSessionInformation];
  lastSessionInformation = self->_lastSessionInformation;
  self->_lastSessionInformation = v5;

  uint64_t v7 = [v4 scopeIdentifiersExcludedFromMingling];
  BOOL v8 = [v7 allObjects];
  lastScopeIdentifiersExludedFromMingling = self->_lastScopeIdentifiersExludedFromMingling;
  self->_lastScopeIdentifiersExludedFromMingling = v8;

  id v12 = [v4 scopeIdentifiersExcludedFromPushToTransport];

  dispatch_block_t v10 = [v12 allObjects];
  lastScopeIdentifiersExcludedFromPushToTransport = self->_lastScopeIdentifiersExcludedFromPushToTransport;
  self->_lastScopeIdentifiersExcludedFromPushToTransport = v10;
}

- (void)noteSyncSession:(id)a3 stateWillBeAttempted:(unint64_t)a4
{
  id v7 = a3;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__CPLEngineScheduler_noteSyncSession_stateWillBeAttempted___block_invoke;
  v13[3] = &unk_1E60A7748;
  v13[4] = self;
  id v14 = v7;
  SEL v15 = a2;
  unint64_t v16 = a4;
  id v9 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  dispatch_block_t v10 = queue;
  id v11 = v7;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);
}

void __59__CPLEngineScheduler_noteSyncSession_stateWillBeAttempted___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 104) != *(void *)(a1 + 40))
  {
    if (_CPLSilentLogging) {
      return;
    }
    uint64_t v3 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 104);
      int v20 = 138412802;
      uint64_t v21 = v4;
      __int16 v22 = 2112;
      uint64_t v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@: ignoring %@ - current session is %@", (uint8_t *)&v20, 0x20u);
    }
    goto LABEL_5;
  }
  if (*(void *)(v2 + 120))
  {
    [*(id *)(v2 + 120) timeIntervalSinceNow];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v7 < 0.0)
    {
      [(id)v2 _disableRetryAfterLocked];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(v2 + 88) > 0xDuLL || *(void *)(a1 + 56) < 0xCuLL)
  {
    unint64_t v8 = *(void *)(v2 + 80);
    if (v8 <= *(void *)(v2 + 16) && *(void *)(a1 + 56) > v8 && *(void *)(v2 + 24) == *(void *)(v2 + 32))
    {
      objc_msgSend((id)v2, "_setRequiredFirstState:");
      uint64_t v2 = *(void *)(a1 + 32);
    }
    *(void *)(v2 + 80) = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) _updateLastSyncDateIfNecessaryLocked];
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 232);
    *(void *)(v10 + 232) = v9;

    unint64_t v12 = *(void *)(a1 + 56);
    if (v12 > 0xD)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v3 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = *(void **)(a1 + 40);
          id v19 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(a1 + 56)];
          int v20 = 138543618;
          uint64_t v21 = v18;
          __int16 v22 = 2114;
          uint64_t v23 = v19;
          _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ has reached %{public}@", (uint8_t *)&v20, 0x16u);
        }
LABEL_5:
      }
    }
    else
    {
      SEL v13 = *(void **)(a1 + 32);
      unint64_t v14 = v13[4];
      if (v13[3] < v14 && v12 <= v13[2])
      {
        if (!_CPLSilentLogging)
        {
          SEL v15 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v16 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(a1 + 56)];
            uint64_t v17 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
            int v20 = 138412546;
            uint64_t v21 = v16;
            __int16 v22 = 2112;
            uint64_t v23 = v17;
            _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEBUG, "Sync manager is attempting %@ so we don't need to schedule %@", (uint8_t *)&v20, 0x16u);
          }
          SEL v13 = *(void **)(a1 + 32);
          unint64_t v14 = v13[4];
        }
        v13[3] = v14;
      }
    }
  }
  else
  {
    objc_msgSend((id)v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:");
  }
}

- (void)_updateLastSyncDateIfNecessaryLocked
{
  if (self->_requiredFirstState >= self->_pendingRequiredFirstState) {
    unint64_t pendingRequiredFirstState = self->_pendingRequiredFirstState;
  }
  else {
    unint64_t pendingRequiredFirstState = self->_requiredFirstState;
  }
  currentSession = self->_currentSession;
  if (currentSession)
  {
    unint64_t v5 = [(CPLSyncSession *)currentSession requiredStateAtEndOfSyncSession];
    if (pendingRequiredFirstState >= v5) {
      unint64_t pendingRequiredFirstState = v5;
    }
  }
  if (pendingRequiredFirstState >= 0xC && self->_needsToUpdateLastSyncDate)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Updating last successful sync date", v9, 2u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    unint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained updateLastSuccessfullSyncDate:v8];

    self->_needsToUpdateLastSyncDate = 0;
  }
}

- (void)noteNetworkStateDidChange
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CPLEngineScheduler_noteNetworkStateDidChange__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void *__47__CPLEngineScheduler_noteNetworkStateDidChange__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  uint64_t result = *(void **)(a1 + 32);
  if (result[2] <= 0xDuLL && result[10] == 14 && !result[6] && !result[13])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Notified that network state did change. Attempting to relaunch a sync session", v4, 2u);
      }

      uint64_t result = *(void **)(a1 + 32);
    }
    return (void *)[result _scheduleNextSyncSession];
  }
  return result;
}

- (void)noteContainerHasBeenWiped
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CPLEngineScheduler_noteContainerHasBeenWiped__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __47__CPLEngineScheduler_noteContainerHasBeenWiped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableSynchronizationBecauseContainerHasBeenWipedLocked];
}

- (void)noteServerMightBeAvailableNow
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CPLEngineScheduler_noteServerMightBeAvailableNow__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __51__CPLEngineScheduler_noteServerMightBeAvailableNow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableRetryAfterLocked];
}

- (void)noteServerIsUnavailableWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLEngineScheduler_noteServerIsUnavailableWithError___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  double v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __55__CPLEngineScheduler_noteServerIsUnavailableWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteServerIsUnavailableWithErrorLocked:*(void *)(a1 + 40) reason:0];
}

- (void)_noteServerIsUnavailableWithErrorLocked:(id)a3 reason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (!unavailabilityLimitDate) {
    goto LABEL_8;
  }
  [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
  if (v9 < 0.0) {
    [(CPLEngineScheduler *)self _disableRetryAfterLocked];
  }
  if (!self->_unavailabilityLimitDate)
  {
LABEL_8:
    id v11 = [(CPLEngineScheduler *)self engineLibrary];
    unint64_t v12 = [v11 syncManager];
    [v12 cancelCurrentSyncSession];

    id v13 = [v6 userInfo];
    uint64_t v10 = [v13 objectForKey:@"CPLErrorRetryAfterDate"];

    if (v10)
    {
      [v10 timeIntervalSinceNow];
      if (v14 <= 86400.0)
      {
        unint64_t v16 = v10;
        goto LABEL_14;
      }
      SEL v15 = (void *)MEMORY[0x1E4F1C9C8];
    }
    else
    {
      SEL v15 = (void *)MEMORY[0x1E4F1C9C8];
    }
    objc_msgSend(v15, "dateWithTimeIntervalSinceNow:");
    unint64_t v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    uint64_t v17 = self->_unavailabilityLimitDate;
    self->_unavailabilityLimitDate = v16;

    [(CPLEngineScheduler *)self _backOff];
    [(NSDate *)self->_unavailabilityLimitDate timeIntervalSinceNow];
    uint64_t v19 = (uint64_t)fmax(v18, 2.0);
    if (!_CPLSilentLogging)
    {
      int v20 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v29 = v19;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Server will be unavailable for %llds", buf, 0xCu);
      }
    }
    if (v7)
    {
      uint64_t v21 = (NSString *)v7;
      unavailabilityReason = self->_unavailabilityReason;
      self->_unavailabilityReason = v21;
    }
    else
    {
      unavailabilityReason = [v6 userInfo];
      uint64_t v23 = [unavailabilityReason objectForKeyedSubscript:@"CPLErrorRetryAfterReason"];
      __int16 v24 = self->_unavailabilityReason;
      self->_unavailabilityReason = v23;
    }
    dispatch_time_t v25 = dispatch_walltime(0, 1000000000 * v19);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CPLEngineScheduler__noteServerIsUnavailableWithErrorLocked_reason___block_invoke;
    block[3] = &unk_1E60A5DD8;
    void block[4] = self;
    dispatch_after(v25, queue, block);
    goto LABEL_22;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v10 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Ignoring spurious server unavailability error", buf, 2u);
    }
LABEL_22:
  }
}

uint64_t __69__CPLEngineScheduler__noteServerIsUnavailableWithErrorLocked_reason___block_invoke(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "End of server unavailability reached", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _disableRetryAfterLocked];
}

- (void)_disableRetryAfterLocked
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    self->_unavailabilityLimitDate = 0;

    unavailabilityReason = self->_unavailabilityReason;
    self->_unavailabilityReason = 0;

    if (self->_requiredFirstState > 0xD)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v8) = 0;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Server should be available now", (uint8_t *)&v8, 2u);
        }
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v5 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = +[CPLEngineSyncManager shortDescriptionForState:self->_requiredFirstState];
          int v8 = 138412290;
          double v9 = v6;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Server should be available now. Rescheduling a sync session from at least %@", (uint8_t *)&v8, 0xCu);
        }
      }
      [(CPLEngineScheduler *)self _unscheduleNextSyncSession];
      [(CPLEngineScheduler *)self _scheduleNextSyncSession];
    }
  }
}

- (BOOL)isSynchronizationDisabledWithReasonError:(id *)a3
{
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = __Block_byref_object_copy__7094;
  id v13 = __Block_byref_object_dispose__7095;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CPLEngineScheduler_isSynchronizationDisabledWithReasonError___block_invoke;
  block[3] = &unk_1E60AB220;
  void block[4] = self;
  void block[5] = &v15;
  void block[6] = &v9;
  dispatch_sync(queue, block);
  int v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && *((unsigned char *)v16 + 24))
  {
    *a3 = (id) v10[5];
    int v5 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t __63__CPLEngineScheduler_isSynchronizationDisabledWithReasonError___block_invoke(void *a1)
{
  uint64_t v2 = (id *)a1[4];
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = (id *)a1[4];
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = (id *)a1[4];
    }
  }
  if (v2[15])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v4 = a1[4];
    if (*(void *)(v4 + 128))
    {
      +[CPLErrors cplErrorWithCode:1000, @"%@", *(void *)(v4 + 128), v14 description];
    }
    else
    {
      [*(id *)(v4 + 120) timeIntervalSinceNow];
      +[CPLErrors cplErrorWithCode:1000, @"Server is unavailable for %.0fs (%@)", fmax(v12, 0.0), *(void *)(a1[4] + 120) description];
    uint64_t v10 = };
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v10;
  }
  else
  {
    uint64_t result = [v2[18] count];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result != 0;
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
      return result;
    }
    uint64_t v15 = [*(id *)(a1[4] + 144) allObjects];
    BOOL v6 = [v15 componentsJoinedByString:@", "];
    uint64_t v7 = +[CPLErrors cplErrorWithCode:256, @"Synchronization is disabled because of: %@", v6 description];
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v11 = v15;
  }
  return MEMORY[0x1F41817F8](v10, v11);
}

- (BOOL)isMinglingEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CPLEngineScheduler_isMinglingEnabled__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__CPLEngineScheduler_isMinglingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 200) == 0;
  return result;
}

- (void)enableMingling
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CPLEngineScheduler_enableMingling__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  char v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void *__36__CPLEngineScheduler_enableMingling__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 120))
  {
    [*(id *)(v2 + 120) timeIntervalSinceNow];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3 < 0.0)
    {
      [(id)v2 _disableRetryAfterLocked];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t v4 = *(void *)(v2 + 200);
  if (!v4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);
      }
    }
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
    uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    [v9 handleFailureInMethod:v10, v11, v12, 1128, @"%@ has been called too many times", v13 object file lineNumber description];

    abort();
  }
  *(void *)(v2 + 200) = v4 - 1;
  uint64_t result = *(void **)(a1 + 32);
  if (!result[25])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Reenabling mingling", buf, 2u);
      }

      uint64_t result = *(void **)(a1 + 32);
    }
    return (void *)[result _noteSyncSessionNeededFromState:10 proposedScheduleDate:0];
  }
  return result;
}

- (void)disableMingling
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CPLEngineScheduler_disableMingling__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __37__CPLEngineScheduler_disableMingling__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 120))
  {
    [*(id *)(v2 + 120) timeIntervalSinceNow];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3 < 0.0)
    {
      [(id)v2 _disableRetryAfterLocked];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  ++*(void *)(v2 + 200);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[25] == 1)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v5 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Disabling mingling", v10, 2u);
      }

      uint64_t v4 = *(void **)(a1 + 32);
    }
    unint64_t v6 = v4[10];
    if (v6 >= 0xA && v6 != 14)
    {
      id v8 = [v4 engineLibrary];
      char v9 = [v8 syncManager];
      [v9 cancelCurrentSyncSession];
    }
  }
}

- (void)noteClientIsEndingSignificantWork
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CPLEngineScheduler_noteClientIsEndingSignificantWork__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __55__CPLEngineScheduler_noteClientIsEndingSignificantWork__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 192);
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        char v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v16 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
    [v10 handleFailureInMethod:v11, v12, v13, 1103, @"%@ has been called too many times", v14 object file lineNumber description];

    abort();
  }
  *(void *)(v2 + 192) = v3 - 1;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4[24])
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v5 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Informing transport of significant work ending", buf, 2u);
      }

      uint64_t v4 = *(void **)(a1 + 32);
    }
    unint64_t v6 = [v4 engineLibrary];
    uint64_t v7 = [v6 transport];
    [v7 noteClientIsEndingSignificantWork];
  }
}

- (void)noteClientIsBeginningSignificantWork
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CPLEngineScheduler_noteClientIsBeginningSignificantWork__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __58__CPLEngineScheduler_noteClientIsBeginningSignificantWork__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 192);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[24] == 1)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Informing transport of significant work beginning", v6, 2u);
      }

      uint64_t v2 = *(void **)(a1 + 32);
    }
    uint64_t v4 = [v2 engineLibrary];
    dispatch_block_t v5 = [v4 transport];
    [v5 noteClientIsBeginningSignificantWork];
  }
}

- (void)unblockEngineElementOnce:(id)a3
{
  id v4 = a3;
  blockingLock = self->_blockingLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__CPLEngineScheduler_unblockEngineElementOnce___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(blockingLock, v7);
}

void __47__CPLEngineScheduler_unblockEngineElementOnce___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 176) addObject:*(void *)(a1 + 40)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "objectForKeyedSubscript:", *(void *)(a1 + 40), 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) signal];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)waitForEngineElementToBeBlocked:(id)a3 timeout:(double)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
  if (a4 > 0.0) {
    [v19 dateByAddingTimeInterval:a4];
  }
  else {
  long long v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  char v8 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int v31 = __Block_byref_object_copy__7094;
  BOOL v32 = __Block_byref_object_dispose__7095;
  id v33 = 0;
  *(void *)&long long v9 = 138412546;
  long long v18 = v9;
  do
  {
    objc_msgSend(v7, "timeIntervalSinceNow", v18);
    if (v10 <= 0.0) {
      break;
    }
    uint64_t v24 = 0;
    dispatch_time_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    blockingLock = self->_blockingLock;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__CPLEngineScheduler_waitForEngineElementToBeBlocked_timeout___block_invoke;
    block[3] = &unk_1E60AB7C8;
    void block[4] = self;
    id v21 = v6;
    __int16 v22 = &v24;
    uint64_t v23 = &v28;
    dispatch_sync(blockingLock, block);
    int v12 = *((unsigned __int8 *)v25 + 24);
    if (*((unsigned char *)v25 + 24))
    {
      if (_CPLSilentLogging)
      {
        char v8 = 1;
        goto LABEL_13;
      }
      uint64_t v13 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v19 timeIntervalSinceNow];
        *(_DWORD *)long long buf = v18;
        id v35 = v6;
        __int16 v36 = 2048;
        double v37 = -v14;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Engine is blocked on %@ - waited for %.2fs", buf, 0x16u);
      }
      char v8 = 1;
    }
    else
    {
      uint64_t v15 = (void *)v29[5];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
      uint64_t v16 = [v13 earlierDate:v7];
      [v15 waitUntilDate:v16];
    }
LABEL_13:

    _Block_object_dispose(&v24, 8);
  }
  while (!v12);
  _Block_object_dispose(&v28, 8);

  return v8 & 1;
}

void __62__CPLEngineScheduler_waitForEngineElementToBeBlocked_timeout___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
  if (v2
    && (uint64_t v3 = (void *)v2,
        char v4 = [*(id *)(a1[4] + 176) containsObject:a1[5]],
        v3,
        (v4 & 1) == 0))
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      objc_msgSend(*(id *)(a1[4] + 168), "removeObject:");
      [*(id *)(*(void *)(a1[7] + 8) + 40) unlock];
      uint64_t v7 = *(void *)(a1[7] + 8);
      char v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
    }
  }
  else if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = a1[5];
        int v13 = 138412290;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Still waiting for %@ to be blocked", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
    uint64_t v10 = *(void *)(a1[7] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [*(id *)(a1[4] + 168) addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
    int v12 = *(void **)(*(void *)(a1[7] + 8) + 40);
    [v12 lock];
  }
}

- (void)willRunEngineElement:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__7094;
  char v27 = __Block_byref_object_dispose__7095;
  id v28 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  *(void *)&long long v7 = 138412290;
  long long v14 = v7;
  do
  {
    uint64_t v19 = 0;
    int v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    blockingLock = self->_blockingLock;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __43__CPLEngineScheduler_willRunEngineElement___block_invoke;
    block[3] = &unk_1E60AB7C8;
    uint64_t v17 = &v19;
    void block[4] = self;
    id v9 = v4;
    id v16 = v9;
    long long v18 = &v23;
    dispatch_sync(blockingLock, block);
    int v10 = *((unsigned __int8 *)v20 + 24);
    if (*((unsigned char *)v20 + 24))
    {
      if (!(v5 & 1 | (_CPLSilentLogging != 0)))
      {
        uint64_t v11 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v14;
          id v30 = v4;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Blocked engine for %@", buf, 0xCu);
        }
      }
      int v12 = (void *)v24[5];
      int v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 3.0, v14);
      [v12 waitUntilDate:v13];
LABEL_8:

      char v5 = 1;
      goto LABEL_9;
    }
    if ((v5 & (_CPLSilentLogging == 0)) == 1)
    {
      int v13 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = v14;
        id v30 = v4;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Unblocked engine for %@", buf, 0xCu);
      }
      goto LABEL_8;
    }
LABEL_9:

    _Block_object_dispose(&v19, 8);
  }
  while (v10);
  _Block_object_dispose(&v23, 8);
}

void __43__CPLEngineScheduler_willRunEngineElement___block_invoke(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 152) containsObject:a1[5]];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)
    && [*(id *)(a1[4] + 176) containsObject:a1[5]])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = a1[5];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v26 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Unblocking engine once for %@", buf, 0xCu);
      }
    }
    [*(id *)(a1[4] + 176) removeObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (v4)
    {
      if (_CPLSilentLogging) {
        return;
      }
      char v5 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = a1[5];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v26 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Still blocked on %@", buf, 0xCu);
      }
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
      uint64_t v10 = *(void *)(a1[7] + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [*(id *)(*(void *)(a1[7] + 8) + 40) lock];
      char v5 = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
      if (!v5)
      {
        char v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [*(id *)(a1[4] + 160) setObject:v5 forKeyedSubscript:a1[5]];
      }
      [v5 addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
      if ([*(id *)(a1[4] + 168) count] && !_CPLSilentLogging)
      {
        int v12 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*(id *)(a1[4] + 168) count];
          uint64_t v14 = a1[5];
          *(_DWORD *)long long buf = 134218242;
          uint64_t v26 = v13;
          __int16 v27 = 2112;
          uint64_t v28 = v14;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Informing %lu waiters that %@ is blocked", buf, 0x16u);
        }
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v15 = *(id *)(a1[4] + 168);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "signal", (void)v20);
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v17);
      }
    }
  }
  else
  {
    if (!v4) {
      return;
    }
    char v5 = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
    [v5 removeObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
    if (![v5 count]) {
      [*(id *)(a1[4] + 160) removeObjectForKey:a1[5]];
    }
    [*(id *)(*(void *)(a1[7] + 8) + 40) unlock];
    uint64_t v7 = *(void *)(a1[7] + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

- (void)unblockEngineElement:(id)a3
{
  id v5 = a3;
  blockingLock = self->_blockingLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CPLEngineScheduler_unblockEngineElement___block_invoke;
  block[3] = &unk_1E60A65C0;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(blockingLock, block);
}

void __43__CPLEngineScheduler_unblockEngineElement___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 152) countForObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 152) removeObject:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 152) countForObject:*(void *)(a1 + 40)])
    {
      if (_CPLSilentLogging) {
        return;
      }
      uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void **)(a1 + 40);
        uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 152) countForObject:v3];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v19 = v3;
        __int16 v20 = 2048;
        uint64_t v21 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Unblocking '%@' but it is still blocked by %lu clients.", buf, 0x16u);
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v7 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          char v8 = *(void **)(a1 + 40);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v19 = v8;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Unblocking '%@'.", buf, 0xCu);
        }
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "objectForKeyedSubscript:", *(void *)(a1 + 40), 0);
      uint64_t v9 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v2);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) signal];
          }
          uint64_t v10 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "%@ has been called too many times with element '%@'", buf, 0x16u);
    }
  }
}

- (void)blockEngineElement:(id)a3
{
  id v4 = a3;
  blockingLock = self->_blockingLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __41__CPLEngineScheduler_blockEngineElement___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(blockingLock, v7);
}

void __41__CPLEngineScheduler_blockEngineElement___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() validElements];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 152) countForObject:*(void *)(a1 + 40)])
    {
      if (!_CPLSilentLogging)
      {
        id v4 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 40);
          uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) countForObject:v5];
          *(_DWORD *)long long v13 = 138412546;
          *(void *)&v13[4] = v5;
          *(_WORD *)&v13[12] = 2048;
          *(void *)&v13[14] = v6 + 1;
          id v7 = "Blocking '%@' (%lu clients).";
          id v8 = v4;
          uint32_t v9 = 22;
LABEL_13:
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, v7, v13, v9);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v4 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)long long v13 = 138412290;
        *(void *)&v13[4] = v12;
        id v7 = "Blocking '%@'.";
        id v8 = v4;
        uint32_t v9 = 12;
        goto LABEL_13;
      }
LABEL_14:
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "addObject:", *(void *)(a1 + 40), *(_OWORD *)v13, *(void *)&v13[16], v14);
    return;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v10 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long v13 = 138412290;
      *(void *)&v13[4] = v11;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "'%@' is an invalid element to block", v13, 0xCu);
    }
  }
}

- (void)blockAllSyncSessionsWithReason:(id)a3 onlyIfBlocked:(BOOL)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke;
  v16[3] = &unk_1E60A6280;
  BOOL v19 = a4;
  id v17 = v8;
  id v18 = v9;
  void v16[4] = self;
  uint64_t v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  uint64_t v12 = queue;
  id v13 = v8;
  id v14 = v9;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)
    && (uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104)) != 0
    && ([v2 shouldDefer] & 1) == 0
    && [*(id *)(*(void *)(a1 + 32) + 104) activityState] == 2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v9 = +[CPLErrors cplErrorWithCode:10001, @"%@ is already actively running", *(void *)(*(void *)(a1 + 32) + 104) description];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v9);
  }
  else
  {
    [*(id *)(a1 + 32) _disableSynchronizationWithReasonLocked:*(void *)(a1 + 40)];
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    uint64_t v5 = [v4 syncManager];
    uint64_t v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke_2;
    v10[3] = &unk_1E60A6868;
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = *(id *)(a1 + 48);
    [v5 cancelAndBlockAllSyncSessionsWithReason:v7 block:v10];
  }
}

void __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke_2(void *a1)
{
  uint64_t v2 = [[CPLEngineSchedulerBlocker alloc] initWithReason:a1[4] scheduler:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CPLEngineScheduler_enableSynchronizationWithReason___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __54__CPLEngineScheduler_enableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 _enableSynchronizationWithReasonLocked:v4];
}

- (void)_enableSynchronizationWithReasonLocked:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(NSCountedSet *)self->_disablingReasons countForObject:v5])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v12 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412546;
        id v18 = v13;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "%@ has been called too many times with reason '%@'", buf, 0x16u);
      }
    }
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    dispatch_block_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
    long long v16 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, v15, 883, @"%@ has been called too many times with reason '%@'", v16, v5 object file lineNumber description];

    abort();
  }
  [(NSCountedSet *)self->_disablingReasons removeObject:v5];
  if ([(NSCountedSet *)self->_disablingReasons count])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(NSCountedSet *)self->_disablingReasons allObjects];
        id v8 = [v7 componentsJoinedByString:@", "];
        *(_DWORD *)long long buf = 138543618;
        id v18 = v5;
        __int16 v19 = 2114;
        id v20 = v8;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Reenabling synchonization for reason '%{public}@'. Synchronization is still disabled for reasons: %{public}@", buf, 0x16u);
      }
    }
  }
  else if (self->_requiredFirstState > 0xD)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v18 = v5;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Reenabling synchonization for reason '%{public}@'. Synchronization is now fully enabled", buf, 0xCu);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v9 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = +[CPLEngineSyncManager shortDescriptionForState:self->_requiredFirstState];
        *(_DWORD *)long long buf = 138543618;
        id v18 = v5;
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Reenabling synchonization for reason '%{public}@'. Synchronization is now fully enabled and should restart soon from at least %{public}@", buf, 0x16u);
      }
    }
    self->_intervalForRetry = 0.100000001;
    if (!self->_currentSession) {
      [(CPLEngineScheduler *)self _scheduleNextSyncSession];
    }
  }
}

- (void)disableSynchronizationIfBlockedWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__CPLEngineScheduler_disableSynchronizationIfBlockedWithReason_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __82__CPLEngineScheduler_disableSynchronizationIfBlockedWithReason_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (id *)a1[4];
  if (v2[13]
    && (char v3 = [v2[13] shouldDefer], v2 = (id *)a1[4], (v3 & 1) == 0)
    && (v4 = [v2[13] activityState], uint64_t v2 = (id *)a1[4], v4 == 2))
  {
    uint64_t v5 = a1[6];
    id v8 = +[CPLErrors cplErrorWithCode:10001, @"%@ is already actively running", v2[13] description];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
  }
  else
  {
    if (v2[15])
    {
      [v2[15] timeIntervalSinceNow];
      uint64_t v2 = (id *)a1[4];
      if (v6 < 0.0)
      {
        [v2 _disableRetryAfterLocked];
        uint64_t v2 = (id *)a1[4];
      }
    }
    [v2 _disableSynchronizationWithReasonLocked:a1[5]];
    id v7 = *(void (**)(void))(a1[6] + 16);
    v7();
  }
}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLEngineScheduler_disableSynchronizationWithReason___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  double v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __55__CPLEngineScheduler_disableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 _disableSynchronizationWithReasonLocked:v4];
}

- (void)_disableSynchronizationWithReasonLocked:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Disabling synchronization for reason '%{public}@'", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NSCountedSet *)self->_disablingReasons addObject:v4];
  if (self->_nextSession) {
    [(CPLEngineScheduler *)self _unscheduleNextSyncSession];
  }
  double v6 = [(CPLEngineScheduler *)self engineLibrary];
  id v7 = [v6 syncManager];
  [v7 cancelCurrentSyncSession];
}

- (void)_disableSynchronizationBecauseContainerHasBeenWipedLocked
{
  if (([(NSCountedSet *)self->_disablingReasons containsObject:@"container has been wiped"] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      double v3 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Disabling synchronization because container has been wiped - engine and transport must be wiped", v4, 2u);
      }
    }
    [(CPLEngineScheduler *)self _disableSynchronizationWithReasonLocked:@"container has been wiped"];
  }
}

- (BOOL)isClientInForeground
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CPLEngineScheduler_isClientInForeground__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__CPLEngineScheduler_isClientInForeground__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 136) != 0;
  return result;
}

- (void)noteClientIsInBackground
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CPLEngineScheduler_noteClientIsInBackground__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  char v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __46__CPLEngineScheduler_noteClientIsInBackground__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 120))
  {
    [*(id *)(result + 120) timeIntervalSinceNow];
    uint64_t result = *(void *)(a1 + 32);
    if (v3 < 0.0)
    {
      [(id)result _disableRetryAfterLocked];
      uint64_t result = *(void *)(a1 + 32);
    }
  }
  uint64_t v4 = *(void *)(result + 136);
  if (!v4)
  {
    if (!_CPLSilentLogging)
    {
      __int16 v19 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)long long buf = 138412290;
        __int16 v27 = v20;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);
      }
    }
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
    uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 40));
    [v21 handleFailureInMethod:v22, v23, v24, 808, @"%@ has been called too many times", v25 object file lineNumber description];

    abort();
  }
  *(void *)(result + 136) = v4 - 1;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 136))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 280));
    id v7 = [WeakRetained syncManager];
    [v7 setSyncSessionShouldBeForeground:0];

    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    char v9 = [v8 owner];
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    [v9 engineLibrary:v10 noteClientIsInForeground:0];

    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    id v12 = [v11 transport];
    [v12 noteClientIsInBackground];

    +[CPLSyncIndicator setForeground:0];
    *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
    id v13 = *(void **)(a1 + 32);
    if (!v13[6] && v13[2] <= 0xDuLL && v13[10] == 14)
    {
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = v14;
      if (*(void *)(*(void *)(a1 + 32) + 208))
      {
        objc_msgSend(v14, "timeIntervalSinceDate:");
        if (v16 > 60.0)
        {
          if (!_CPLSilentLogging)
          {
            id v17 = __CPLSchedulerOSLogDomain_7035();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              id v18 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
              *(_DWORD *)long long buf = 138412290;
              __int16 v27 = v18;
              _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEBUG, "All clients are now in background and we need a sync session, scheduling one now from at least %@", buf, 0xCu);
            }
          }
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), v15);
          [*(id *)(a1 + 32) _scheduleNextSyncSession];
        }
      }

      id v13 = *(void **)(a1 + 32);
    }
    return [v13 _updateOverridingForeground];
  }
  return result;
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__CPLEngineScheduler_noteClientIsInForegroundQuietly___block_invoke;
  v7[3] = &unk_1E60AA7B8;
  v7[4] = self;
  BOOL v8 = a3;
  uint64_t v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  uint64_t v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __54__CPLEngineScheduler_noteClientIsInForegroundQuietly___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 120))
  {
    [*(id *)(v2 + 120) timeIntervalSinceNow];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3 < 0.0)
    {
      [(id)v2 _disableRetryAfterLocked];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  ++*(void *)(v2 + 136);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 136) == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 280));
    id v7 = [WeakRetained syncManager];
    [v7 setSyncSessionShouldBeForeground:1];

    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    char v9 = [v8 owner];
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    [v9 engineLibrary:v10 noteClientIsInForeground:1];

    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    id v12 = [v11 transport];
    [v12 noteClientIsInForeground];

    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    id v14 = [v13 systemMonitor];

    if ([v14 canBoostOperations])
    {
      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
      double v16 = [v15 systemMonitor];
      uint64_t v17 = [v16 canBoostBackgroundOperations];

      id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
      __int16 v19 = [v18 transport];
      [v19 cancelBlockedTasksIncludingBackground:v17];
    }
    +[CPLSyncIndicator setForeground:1];

    uint64_t v5 = *(void *)(a1 + 32);
  }
  id v20 = objc_loadWeakRetained((id *)(v5 + 280));
  uint64_t v21 = [v20 supervisor];

  int v22 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40) || !v21)
  {
LABEL_12:
    if (v22)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v23 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v35 = 0;
          uint64_t v24 = "Some client is in foreground but we have been asked not to trigger a sync session";
LABEL_26:
          uint64_t v28 = v23;
          uint32_t v29 = 2;
LABEL_27:
          _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEFAULT, v24, v35, v29);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
    uint64_t v25 = *(void *)(a1 + 32);
    if (*(void *)(v25 + 16) <= 0xDuLL && *(void *)(v25 + 80) <= 0xDuLL)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v26 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
          *(_DWORD *)id v35 = 138543362;
          *(void *)&v35[4] = v27;
          _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "Some client is in foreground, current required state is %{public}@", v35, 0xCu);
        }
        uint64_t v25 = *(void *)(a1 + 32);
      }
      [(id)v25 _disableFastRelaunchProtection];
      goto LABEL_29;
    }
    if (*(void *)(v25 + 208))
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      if (v30 <= 60.0)
      {
        if (_CPLSilentLogging) {
          goto LABEL_29;
        }
        uint64_t v23 = __CPLSchedulerOSLogDomain_7035();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        [v4 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 208)];
        *(_DWORD *)id v35 = 134217984;
        *(void *)&v35[4] = v33;
        uint64_t v24 = "Some client is in foreground but we already did a sync session for foreground clients %.0fs ago";
        goto LABEL_40;
      }
      uint64_t v25 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v25 + 208), v4);
    uint64_t v31 = *(void **)(a1 + 32);
    if (!v31[13])
    {
      if (!_CPLSilentLogging)
      {
        int v34 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v35 = 0;
          _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Some client is in foreground. Scheduling a sync session soon", v35, 2u);
        }

        uint64_t v31 = *(void **)(a1 + 32);
      }
      [v31 _noteSyncSessionNeededFromState:2 proposedScheduleDate:0];
      goto LABEL_29;
    }
    if (_CPLSilentLogging) {
      goto LABEL_29;
    }
    uint64_t v23 = __CPLSchedulerOSLogDomain_7035();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 104);
    *(_DWORD *)id v35 = 138543362;
    *(void *)&v35[4] = v32;
    uint64_t v24 = "Some client is in foreground but we are already in %{public}@";
LABEL_40:
    uint64_t v28 = v23;
    uint32_t v29 = 12;
    goto LABEL_27;
  }
  if ([v21 schedulerShouldStartSyncSessionMovingToForeground:*(void *)(a1 + 32) currentSession:*(void *)(*(void *)(a1 + 32) + 104)])
  {
    int v22 = *(unsigned __int8 *)(a1 + 40);
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v23 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v35 = 0;
      uint64_t v24 = "Some client is in foreground but supervisor asked not to trigger a sync session";
      goto LABEL_26;
    }
LABEL_28:
  }
LABEL_29:
  objc_msgSend(*(id *)(a1 + 32), "_updateOverridingForeground", *(_OWORD *)v35);
}

- (void)noteResourceDownloadQueueIsFull
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CPLEngineScheduler_noteResourceDownloadQueueIsFull__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __53__CPLEngineScheduler_noteResourceDownloadQueueIsFull__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v3 < 0.0) {
      [*(id *)(a1 + 32) _disableRetryAfterLocked];
    }
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_block_t v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Notified that Resource Download queue is full", v6, 2u);
    }
  }
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:13 proposedScheduleDate:0];
}

- (void)noteServerHasChanges
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLEngineScheduler_noteServerHasChanges__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __42__CPLEngineScheduler_noteServerHasChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80) <= 0xDuLL
    && ([(id)v2 platformObject],
        double v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 shouldCoalesceServerChangesNotification],
        v3,
        uint64_t v2 = *(void *)(a1 + 32),
        v4))
  {
    *(unsigned char *)(v2 + 96) = 1;
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CPLEngineScheduler_noteServerHasChanges__block_invoke_2;
    block[3] = &unk_1E60A5DD8;
    void block[4] = v6;
    dispatch_after(v5, v7, block);
  }
  else
  {
    [(id)v2 _reallyNoteServerHasChangesLocked];
  }
}

unsigned char *__42__CPLEngineScheduler_noteServerHasChanges__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[96]) {
    return (unsigned char *)[result _reallyNoteServerHasChangesLocked];
  }
  return result;
}

- (void)_reallyNoteServerHasChangesLocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v3 = [(CPLEngineScheduler *)self engineLibrary];
  int v4 = [v3 store];

  if ([v4 shouldSyncScopeList])
  {
    unavailabilityLimitDate = self->_unavailabilityLimitDate;
    if (unavailabilityLimitDate)
    {
      [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
      if (v6 < 0.0) {
        [(CPLEngineScheduler *)self _disableRetryAfterLocked];
      }
    }
    [(CPLEngineScheduler *)self _noteSyncSessionNeededFromStateDontRewindImmediately:4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Notified that Server has changes to be pulled", buf, 2u);
      }
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke;
    v9[3] = &unk_1E60AB578;
    id v10 = v4;
    id v8 = (id)[v10 performWriteTransactionWithBlock:v9 completionHandler:&__block_literal_global_7154];
  }
  self->_shouldNoteServerHasChanges = 0;
}

void __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke_2;
  v3[3] = &unk_1E60AB410;
  id v4 = *(id *)(a1 + 32);
  [a2 do:v3];
}

uint64_t __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) scopes];
  uint64_t v4 = [v3 setAllScopesHasChangesToPullFromTransportWithError:a2];

  return v4;
}

- (void)_noteSyncSessionNeededFromStateDontRewindImmediately:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t currentSyncState = self->_currentSyncState;
  if (currentSyncState <= a3 || currentSyncState > 0xB)
  {
    -[CPLEngineScheduler _noteSyncSessionNeededFromState:proposedScheduleDate:](self, "_noteSyncSessionNeededFromState:proposedScheduleDate:");
  }
  else if (self->_requiredFirstState > a3 && self->_pendingRequiredFirstState > a3)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = +[CPLEngineSyncManager shortDescriptionForState:a3];
        char v9 = +[CPLEngineSyncManager shortDescriptionForState:self->_currentSyncState];
        id v10 = +[CPLEngineSyncManager shortDescriptionForState:11];
        int v11 = 138543874;
        id v12 = v8;
        __int16 v13 = 2114;
        id v14 = v9;
        __int16 v15 = 2114;
        double v16 = v10;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Notified that we need to rewind to %{public}@ but we will wait for %{public}@...%{public}@ to be finished", (uint8_t *)&v11, 0x20u);
      }
    }
    self->_unint64_t pendingRequiredFirstState = a3;
  }
}

- (void)noteClientIsNotInSyncWithClientCache
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CPLEngineScheduler_noteClientIsNotInSyncWithClientCache__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void *__58__CPLEngineScheduler_noteClientIsNotInSyncWithClientCache__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void **)(a1 + 32);
  if (result[10] <= 0xDuLL)
  {
    if (_CPLSilentLogging) {
      goto LABEL_14;
    }
    double v3 = __CPLSchedulerOSLogDomain_7035();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 104);
    int v9 = 138543362;
    uint64_t v10 = v4;
    dispatch_block_t v5 = "Stopping %{public}@ until client is in sync with the engine";
    double v6 = v3;
    uint32_t v7 = 12;
    goto LABEL_12;
  }
  if (result[2] <= 0xDuLL && _CPLSilentLogging == 0)
  {
    double v3 = __CPLSchedulerOSLogDomain_7035();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      uint64_t result = *(void **)(a1 + 32);
      goto LABEL_14;
    }
    LOWORD(v9) = 0;
    dispatch_block_t v5 = "Unscheduling sync session until client is in sync with the engine";
    double v6 = v3;
    uint32_t v7 = 2;
LABEL_12:
    _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, v7);
    goto LABEL_13;
  }
LABEL_14:
  if (result[2] >= 7uLL) {
    return (void *)[result _unscheduleNextSyncSession];
  }
  return result;
}

- (void)noteClientIsInSyncWithClientCache
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CPLEngineScheduler_noteClientIsInSyncWithClientCache__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __55__CPLEngineScheduler_noteClientIsInSyncWithClientCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 120))
  {
    [*(id *)(v2 + 120) timeIntervalSinceNow];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3 < 0.0)
    {
      [(id)v2 _disableRetryAfterLocked];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(v2 + 56) = 0x3FB99999A0000000;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Notified that we need to perform an initial sync now that the client is in sync with the engine", v6, 2u);
    }
  }
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:8 proposedScheduleDate:0];
}

- (void)noteClientNeedsToPull
{
  double v3 = [(CPLEngineScheduler *)self engineLibrary];
  uint64_t v4 = [v3 store];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CPLEngineScheduler_noteClientNeedsToPull__block_invoke;
  v8[3] = &unk_1E60AB068;
  id v9 = v4;
  id v10 = v3;
  uint64_t v11 = self;
  id v5 = v3;
  id v6 = v4;
  id v7 = (id)[v6 performReadTransactionWithBlock:v8];
}

void __43__CPLEngineScheduler_noteClientNeedsToPull__block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] scopes];
  if ([v2 hasStagedSyncAnchors])
  {

LABEL_7:
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [a1[5] store];
        id v8 = [v7 pullQueue];
        int v9 = 134217984;
        uint64_t v10 = [v8 countOfQueuedBatches];
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "There is %lu batches in the pull queue and staged sync anchors. Notifying who might be interested", (uint8_t *)&v9, 0xCu);
      }
    }
    [a1[5] notifyAttachedObjectsPullQueueIsFull];
    id v5 = [a1[6] platformObject];
    [v5 noteClientNeedsToPull];
    goto LABEL_12;
  }
  double v3 = [a1[4] pullQueue];
  char v4 = [v3 isEmpty];

  if ((v4 & 1) == 0) {
    goto LABEL_7;
  }
  if (_CPLSilentLogging) {
    return;
  }
  id v5 = __CPLSchedulerOSLogDomain_7035();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "There is no changes in the pull queue and no staged sync anchors", (uint8_t *)&v9, 2u);
  }
LABEL_12:
}

- (void)noteScopeNeedsToUploadComputeState
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CPLEngineScheduler_noteScopeNeedsToUploadComputeState__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  char v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __56__CPLEngineScheduler_noteScopeNeedsToUploadComputeState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  return [v2 _noteSyncSessionNeededFromState:12 proposedScheduleDate:0];
}

- (void)noteScopeNeedsToPullFromTransport
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CPLEngineScheduler_noteScopeNeedsToPullFromTransport__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  char v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __55__CPLEngineScheduler_noteScopeNeedsToPullFromTransport__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  [v2 _noteSyncSessionNeededFromState:10 proposedScheduleDate:0];
  id v4 = [*(id *)(a1 + 32) platformObject];
  [v4 noteServerHasChanges];
}

- (void)noteScopeNeedsToPushToTransportWithChangeTypes:(unint64_t)a3
{
  unint64_t v3 = 122;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CPLEngineScheduler_noteScopeNeedsToPushToTransportWithChangeTypes___block_invoke;
  v8[3] = &unk_1E60A6598;
  if (a3) {
    unint64_t v3 = a3;
  }
  void v8[4] = self;
  v8[5] = v3;
  dispatch_block_t v5 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v10 = v5;
  id v6 = queue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

void __69__CPLEngineScheduler_noteScopeNeedsToPushToTransportWithChangeTypes___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v3 < 0.0) {
      [*(id *)(a1 + 32) _disableRetryAfterLocked];
    }
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_block_t v7 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Client has put some changes in push repository", v7, 2u);
    }
  }
  [*(id *)(a1 + 32) _disableFastRelaunchProtection];
  double v5 = 60.0;
  if (*(void *)(a1 + 40) != 32) {
    double v5 = 0.0;
  }
  [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:8 minimumDelay:v5];
  id v6 = [*(id *)(a1 + 32) platformObject];
  [v6 noteScopeNeedsToPushToTransport];
}

- (void)noteScopeNeedsToPushHighPriorityToTransport
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CPLEngineScheduler_noteScopeNeedsToPushHighPriorityToTransport__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __65__CPLEngineScheduler_noteScopeNeedsToPushHighPriorityToTransport__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v3 < 0.0) {
      [*(id *)(a1 + 32) _disableRetryAfterLocked];
    }
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Client has put some high priority changes in push repository", v6, 2u);
    }
  }
  [*(id *)(a1 + 32) _disableFastRelaunchProtection];
  [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:7 proposedScheduleDate:0];
  dispatch_block_t v5 = [*(id *)(a1 + 32) platformObject];
  [v5 noteScopeNeedsToPushToTransport];
}

- (void)_disableFastRelaunchProtection
{
  if (self->_protectAgainstFastRelaunch) {
    self->_protectAgainstFastRelaunch = 0;
  }
  if (self->_delayedFirstSyncBecauseOfRapidLaunch)
  {
    self->_delayedFirstSyncBecauseOfRapidLaunch = 0;
    self->_intervalForRetry = 5.0;
    nextSession = self->_nextSession;
    if (nextSession && [(CPLSyncSession *)nextSession isInMoreThanTimeInverval:5.0])
    {
      if (!_CPLSilentLogging)
      {
        id v4 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling sync session soon after disabling fast relaunch protection", buf, 2u);
        }
      }
      [(CPLEngineScheduler *)self _reallyUnscheduleSession];
      [(CPLEngineScheduler *)self _scheduleNextSyncSession];
    }
    else if (!_CPLSilentLogging)
    {
      dispatch_block_t v5 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Disabling fast relaunch protection", v6, 2u);
      }
    }
  }
}

- (void)noteScopeNeedsUpdate
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLEngineScheduler_noteScopeNeedsUpdate__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __42__CPLEngineScheduler_noteScopeNeedsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  return [v2 _noteSyncSessionNeededFromState:5 proposedScheduleDate:0];
}

- (void)noteScopeListNeedsUpdate
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CPLEngineScheduler_noteScopeListNeedsUpdate__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __46__CPLEngineScheduler_noteScopeListNeedsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  return [v2 _noteSyncSessionNeededFromState:4 proposedScheduleDate:0];
}

- (void)noteTransportNeedsUpdate
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CPLEngineScheduler_noteTransportNeedsUpdate__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __46__CPLEngineScheduler_noteTransportNeedsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] timeIntervalSinceNow];
    uint64_t v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      [v2 _disableRetryAfterLocked];
      uint64_t v2 = *(id **)(a1 + 32);
    }
  }
  return [v2 _noteSyncSessionNeededFromState:3 proposedScheduleDate:0];
}

- (void)noteStoreNeedsCleanup
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CPLEngineScheduler_noteStoreNeedsCleanup__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __43__CPLEngineScheduler_noteStoreNeedsCleanup__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _disableRetryAfterLocked];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16) >= 3uLL && _CPLSilentLogging == 0)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Will need to cleanup database before next sync session", v6, 2u);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 56) = 0x3FB99999A0000000;
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:2 proposedScheduleDate:0];
}

- (void)noteStoreNeedsToUpdateDisabledFeatures
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CPLEngineScheduler_noteStoreNeedsToUpdateDisabledFeatures__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __60__CPLEngineScheduler_noteStoreNeedsToUpdateDisabledFeatures__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _disableRetryAfterLocked];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[2] >= 2uLL && _CPLSilentLogging == 0)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Will need to update disabled features before next sync session", v8, 2u);
    }

    uint64_t v2 = *(void **)(a1 + 32);
  }
  dispatch_block_t v5 = [v2 engineLibrary];
  id v6 = [v5 syncManager];
  [v6 requestDisabledFeaturesUpdate];

  *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:1 proposedScheduleDate:0];
}

- (void)noteStoreNeedsSetup
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CPLEngineScheduler_noteStoreNeedsSetup__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __41__CPLEngineScheduler_noteStoreNeedsSetup__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _disableRetryAfterLocked];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[2] >= 2uLL && _CPLSilentLogging == 0)
  {
    id v4 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Will need to setup engine before next sync session", v8, 2u);
    }

    uint64_t v2 = *(void **)(a1 + 32);
  }
  dispatch_block_t v5 = [v2 engineLibrary];
  id v6 = [v5 syncManager];
  [v6 discardTransportUserIdentifier];

  *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:1 proposedScheduleDate:0];
}

- (void)kickOffSyncSession
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CPLEngineScheduler_kickOffSyncSession__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  double v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __40__CPLEngineScheduler_kickOffSyncSession__block_invoke(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Forcing a sync session right now", v11, 2u);
    }
  }
  [*(id *)(a1 + 32) _resetFirstSynchronizationMarker];
  *(unsigned char *)(*(void *)(a1 + 32) + 226) = 0;
  *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 120);
  *(void *)(v3 + 120) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 232);
  *(void *)(v7 + 232) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 48))
  {
    uint64_t result = [*(id *)(v9 + 48) isInMoreThanTimeInverval:*(double *)(v9 + 56)];
    if (!result) {
      return result;
    }
    uint64_t v9 = *(void *)(a1 + 32);
  }
  [(id)v9 _unscheduleNextSyncSession];
  return [*(id *)(a1 + 32) _noteSyncSessionNeededFromState:1 proposedScheduleDate:0];
}

- (void)forceStartSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__CPLEngineScheduler_forceStartSyncSession_withMinimalPhase___block_invoke;
  v12[3] = &unk_1E60A65C0;
  v12[4] = self;
  id v13 = v6;
  unint64_t v14 = a4;
  id v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  uint64_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

uint64_t __61__CPLEngineScheduler_forceStartSyncSession_withMinimalPhase___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetFirstSynchronizationMarker];
  *(unsigned char *)(*(void *)(a1 + 32) + 226) = 0;
  *(void *)(*(void *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = 0;

  [*(id *)(a1 + 32) _unscheduleNextSyncSession];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 216);
  *(void *)(v8 + 216) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void *)(v10 + 16);
  unint64_t v12 = *(void *)(a1 + 48);
  if (v11 > v12)
  {
    *(void *)(v10 + 16) = v12;
    uint64_t v10 = *(void *)(a1 + 32);
    unint64_t v11 = *(void *)(v10 + 16);
  }
  if (v11 <= 0xB)
  {
    *(unsigned char *)(v10 + 40) = 1;
    uint64_t v10 = *(void *)(a1 + 32);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  return [(id)v10 _startRequiredSyncSession:v13];
}

- (void)startRequiredSyncSessionNow:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__CPLEngineScheduler_startRequiredSyncSessionNow___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6896;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __50__CPLEngineScheduler_startRequiredSyncSessionNow___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 112))
  {
    if (*(void *)(v2 + 48) == *(void *)(a1 + 40))
    {
      uint64_t v3 = *(void **)(v2 + 120);
      if (v3)
      {
        [v3 timeIntervalSinceNow];
        if (v4 < 0.0) {
          [*(id *)(a1 + 32) _disableRetryAfterLocked];
        }
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v5 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v6 = *(void *)(a1 + 40);
          uint64_t v7 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 16)];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v10 = v6;
          __int16 v11 = 2112;
          unint64_t v12 = v7;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "It's time to start %@ from %@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 32) _startRequiredSyncSession:*(void *)(a1 + 40)];
    }
    else
    {
      id v8 = [(id)v2 platformObject];
      [v8 noteSyncSessionSucceeded:*(void *)(a1 + 40)];
    }
  }
}

- (void)_backOff
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
    if (v4 < 0.0) {
      [(CPLEngineScheduler *)self _disableRetryAfterLocked];
    }
  }
  double v5 = self->_intervalForRetry + self->_intervalForRetry;
  self->_double intervalForRetry = v5;
  double v6 = 5.0;
  if (v5 < 5.0 || (double v6 = 3600.0, v5 > 3600.0)) {
    self->_double intervalForRetry = v6;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double intervalForRetry = self->_intervalForRetry;
      int v9 = 134217984;
      double v10 = intervalForRetry;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Will back-off retry to %.0fs", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_noteSyncSessionNeededFromState:(unint64_t)a3 minimumDelay:(double)intervalForRetry
{
  if (self->_requiredFirstState == 14
    && (double v6 = intervalForRetry, intervalForRetry = self->_intervalForRetry, intervalForRetry < v6))
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    unavailabilityLimitDate = self->_unavailabilityLimitDate;
    if (unavailabilityLimitDate
      && ([(NSDate *)unavailabilityLimitDate timeIntervalSinceDate:v7], v9 >= v6))
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [v7 dateByAddingTimeInterval:v6];
    }

    id v10 = v11;
  }
  else
  {
    id v10 = 0;
  }
  id v12 = v10;
  -[CPLEngineScheduler _noteSyncSessionNeededFromState:proposedScheduleDate:](self, "_noteSyncSessionNeededFromState:proposedScheduleDate:", a3, v10, intervalForRetry);
}

- (void)_noteSyncSessionNeededFromState:(unint64_t)a3 proposedScheduleDate:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
    if (v9 < 0.0) {
      [(CPLEngineScheduler *)self _disableRetryAfterLocked];
    }
  }
  if (self->_opened)
  {
    unint64_t pendingRequiredFirstState = self->_pendingRequiredFirstState;
    if (pendingRequiredFirstState <= 0xD && pendingRequiredFirstState >= a3) {
      self->_unint64_t pendingRequiredFirstState = 14;
    }
    p_proposedScheduleDate = &self->_proposedScheduleDate;
    objc_storeStrong((id *)&self->_proposedScheduleDate, a4);
    unint64_t requiredFirstState = self->_requiredFirstState;
    if (requiredFirstState > a3 && self->_intervalForRetry > 5.0)
    {
      if (!_CPLSilentLogging)
      {
        unint64_t v14 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          double intervalForRetry = self->_intervalForRetry;
          id v16 = +[CPLEngineSyncManager shortDescriptionForState:a3];
          int v39 = 134218242;
          double v40 = intervalForRetry;
          __int16 v41 = 2114;
          uint64_t v42 = v16;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Resetting backoff interval to %.0fs because we are asked to start from %{public}@", (uint8_t *)&v39, 0x16u);
        }
      }
      self->_double intervalForRetry = 5.0;
      uint64_t v17 = self->_unavailabilityLimitDate;
      self->_unavailabilityLimitDate = 0;

      unavailabilityReason = self->_unavailabilityReason;
      self->_unavailabilityReason = 0;

      unint64_t requiredFirstState = self->_requiredFirstState;
    }
    if (requiredFirstState >= a3)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v25 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = +[CPLEngineSyncManager shortDescriptionForState:a3];
          int v39 = 138543362;
          double v40 = *(double *)&v26;
          _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_DEFAULT, "We are asked to schedule a sync session from %{public}@", (uint8_t *)&v39, 0xCu);
        }
      }
      [(CPLEngineScheduler *)self _setRequiredFirstState:a3];
      ++self->_currentRequestGeneration;
      currentSession = self->_currentSession;
      if (currentSession)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v28 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint32_t v29 = self->_currentSession;
            double v30 = +[CPLEngineSyncManager shortDescriptionForState:a3];
            int v39 = 138543618;
            double v40 = *(double *)&v29;
            __int16 v41 = 2114;
            uint64_t v42 = v30;
            _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEBUG, "We are in the middle of %{public}@. Let's use it and rewind to %{public}@", (uint8_t *)&v39, 0x16u);
          }
          currentSession = self->_currentSession;
        }
        [(CPLEngineScheduler *)self _reallyStartSyncSession:currentSession];
      }
      else
      {
        [(CPLEngineScheduler *)self _scheduleNextSyncSession];
      }
      goto LABEL_54;
    }
    unint64_t currentSyncState = self->_currentSyncState;
    if (self->_currentSession && currentSyncState >= a3)
    {
      if (!_CPLSilentLogging)
      {
        id v20 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = +[CPLEngineSyncManager shortDescriptionForState:self->_currentSyncState];
          int v22 = +[CPLEngineSyncManager shortDescriptionForState:a3];
          uint64_t v23 = +[CPLEngineSyncManager shortDescriptionForState:self->_requiredFirstState];
          int v39 = 138543874;
          double v40 = *(double *)&v21;
          __int16 v41 = 2114;
          uint64_t v42 = v22;
          __int16 v43 = 2114;
          v44 = v23;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "We are in the middle of %{public}@ and are requested to rewind to %{public}@ but we will already rewind to %{public}@", (uint8_t *)&v39, 0x20u);
        }
        goto LABEL_53;
      }
LABEL_54:
      uint64_t v24 = *p_proposedScheduleDate;
      *p_proposedScheduleDate = 0;
LABEL_55:

      goto LABEL_56;
    }
    if (currentSyncState < a3)
    {
      if (!_CPLSilentLogging)
      {
        id v20 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = +[CPLEngineSyncManager shortDescriptionForState:self->_currentSyncState];
          uint64_t v32 = +[CPLEngineSyncManager shortDescriptionForState:a3];
          int v39 = 138543618;
          double v40 = *(double *)&v31;
          __int16 v41 = 2114;
          uint64_t v42 = v32;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEBUG, "We are in the middle of %{public}@ and requested %{public}@ will happen later in the sync session.", (uint8_t *)&v39, 0x16u);
        }
        goto LABEL_53;
      }
      goto LABEL_54;
    }
    nextSession = self->_nextSession;
    if (!nextSession
      || self->_deferDate
      || ([(CPLSyncSession *)nextSession expectedDate],
          uint64_t v38 = objc_claimAutoreleasedReturnValue(),
          v38,
          !v38))
    {
      [(CPLEngineScheduler *)self _scheduleNextSyncSession];
    }
    if (self->_nextSession)
    {
      if (_CPLSilentLogging) {
        goto LABEL_54;
      }
      id v20 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = +[CPLEngineSyncManager shortDescriptionForState:a3];
        id v35 = +[CPLEngineSyncManager shortDescriptionForState:self->_requiredFirstState];
        uint64_t v36 = [(CPLSyncSession *)self->_nextSession whenItWillStartDescription];
        int v39 = 138543874;
        double v40 = *(double *)&v34;
        __int16 v41 = 2114;
        uint64_t v42 = v35;
        __int16 v43 = 2114;
        v44 = v36;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "We are asked to schedule a sync session from %{public}@ but we have already been asked to start from %{public}@ (should happen %{public}@)", (uint8_t *)&v39, 0x20u);

LABEL_52:
      }
    }
    else
    {
      if (_CPLSilentLogging) {
        goto LABEL_54;
      }
      id v20 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = +[CPLEngineSyncManager shortDescriptionForState:a3];
        double v37 = +[CPLEngineSyncManager shortDescriptionForState:self->_requiredFirstState];
        int v39 = 138543618;
        double v40 = *(double *)&v34;
        __int16 v41 = 2114;
        uint64_t v42 = v37;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "We are asked to schedule a sync session from %{public}@ but we have already been asked to start from %{public}@ (no date scheduled yet)", (uint8_t *)&v39, 0x16u);

        goto LABEL_52;
      }
    }
LABEL_53:

    goto LABEL_54;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v24 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Not scheduling sync sessions until the scheduler is fully ready", (uint8_t *)&v39, 2u);
    }
    goto LABEL_55;
  }
LABEL_56:
}

- (void)_unscheduleNextSyncSession
{
  if (self->_nextSession) {
    [(CPLEngineScheduler *)self _reallyUnscheduleSession];
  }
}

- (void)_reallyUnscheduleSession
{
  if (self->_nextSession)
  {
    uint64_t v3 = [(CPLEngineScheduler *)self platformObject];
    [v3 unscheduleSyncSession:self->_nextSession];

    nextSession = self->_nextSession;
    self->_nextSession = 0;

    deferDate = self->_deferDate;
    self->_deferDate = 0;

    [(CPLEngineScheduler *)self _updateOverridingForeground];
  }
}

- (void)_scheduleNextSyncSession
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
    if (v4 < 0.0) {
      [(CPLEngineScheduler *)self _disableRetryAfterLocked];
    }
  }
  [(CPLEngineScheduler *)self _stopPreparingFirstSession];
  proposedScheduleDate = self->_proposedScheduleDate;
  if (proposedScheduleDate)
  {
    [(NSDate *)proposedScheduleDate timeIntervalSinceNow];
    if (v6 >= 0.100000001) {
      double intervalForRetry = v6;
    }
    else {
      double intervalForRetry = 0.100000001;
    }
  }
  else
  {
    double intervalForRetry = self->_intervalForRetry;
  }
  nextSession = self->_nextSession;
  if (!nextSession)
  {
    if (!self->_currentSession) {
      goto LABEL_27;
    }
    if (_CPLSilentLogging) {
      return;
    }
    id v12 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      currentSession = self->_currentSession;
      int v40 = 138543362;
      __int16 v41 = currentSession;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "No need to schedule a sync session as we are already in the middle of %{public}@", (uint8_t *)&v40, 0xCu);
    }
LABEL_42:

    return;
  }
  if (self->_deferDate)
  {
    if (_CPLSilentLogging)
    {
LABEL_15:
      [(CPLEngineScheduler *)self _reallyUnscheduleSession];
      goto LABEL_27;
    }
    double v9 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_nextSession;
      id v11 = +[CPLDateFormatter stringForTimeIntervalAgo:self->_deferDate now:0];
      int v40 = 138543618;
      __int16 v41 = v10;
      __int16 v42 = 2114;
      __int16 v43 = v11;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has been deferred %{public}@ - scheduling a new sync session", (uint8_t *)&v40, 0x16u);
    }
LABEL_14:

    goto LABEL_15;
  }
  unint64_t v14 = [(CPLSyncSession *)nextSession expectedDate];

  if (!v14)
  {
    if (_CPLSilentLogging) {
      goto LABEL_15;
    }
    double v9 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v29 = self->_nextSession;
      int v40 = 138543362;
      __int16 v41 = v29;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has no expected date - scheduling a new sync session", (uint8_t *)&v40, 0xCu);
    }
    goto LABEL_14;
  }
  id v12 = [(CPLSyncSession *)self->_nextSession expectedDate];
  [v12 timeIntervalSinceNow];
  if (v15 <= intervalForRetry)
  {
    if (!_CPLSilentLogging)
    {
      double v30 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = [(CPLSyncSession *)self->_nextSession whenItWillStartDescription];
        int v40 = 138543362;
        __int16 v41 = v31;
        _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_DEBUG, "No need to reschedule a sync session. A session is expected to start %{public}@", (uint8_t *)&v40, 0xCu);
      }
    }
    goto LABEL_42;
  }
  if (!_CPLSilentLogging)
  {
    id v16 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = self->_nextSession;
      int v40 = 138543362;
      __int16 v41 = v17;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@'s expected date is too far away - scheduling a new sync session", (uint8_t *)&v40, 0xCu);
    }
  }
  [(CPLEngineScheduler *)self _reallyUnscheduleSession];

LABEL_27:
  unint64_t requiredFirstState = self->_requiredFirstState;
  if (requiredFirstState <= 0xD)
  {
    if (requiredFirstState < 7
      || ([(CPLEngineScheduler *)self engineLibrary],
          __int16 v19 = objc_claimAutoreleasedReturnValue(),
          [v19 store],
          id v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 isClientInSyncWithClientCache],
          v20,
          v19,
          v21))
    {
      if ([(CPLEngineScheduler *)self _syncSessionIsPossible])
      {
        int v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:intervalForRetry];
        lastSuccessfulSyncSessionDate = self->_lastSuccessfulSyncSessionDate;
        id v24 = v22;
        uint64_t v25 = lastSuccessfulSyncSessionDate;
        uint64_t v26 = v25;
        if (_decentNextSessionDate_onceToken == -1)
        {
          if (!v25) {
            goto LABEL_44;
          }
        }
        else
        {
          dispatch_once(&_decentNextSessionDate_onceToken, &__block_literal_global_580);
          if (!v26) {
            goto LABEL_44;
          }
        }
        [v24 timeIntervalSinceDate:v26];
        if (v27 < *(double *)&_decentNextSessionDate_secondSessionCoalescingInterval)
        {
          -[NSDate dateByAddingTimeInterval:](v26, "dateByAddingTimeInterval:");
          id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
          uint64_t v32 = v28;

          if (self->_protectAgainstFastRelaunch)
          {
            uint64_t v33 = [(CPLEngineScheduler *)self _minimalDateForFirstSync];
            if (v33 && [v32 compare:v33] == -1)
            {
              if (!_CPLSilentLogging)
              {
                int v34 = __CPLSchedulerOSLogDomain_7035();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v40) = 0;
                  _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Delaying first sync because we relaunched too fast", (uint8_t *)&v40, 2u);
                }
              }
              id v35 = v33;

              self->_delayedFirstSyncBecauseOfRapidLaunch = 1;
              uint64_t v32 = v35;
            }
          }
          uint64_t v36 = [(CPLEngineScheduler *)self platformObject];
          double v37 = [v36 scheduleNextSyncSessionAtDate:v32];
          uint64_t v38 = self->_nextSession;
          self->_nextSession = v37;

          deferDate = self->_deferDate;
          self->_deferDate = 0;

          goto LABEL_55;
        }
LABEL_44:
        id v28 = v24;
        goto LABEL_45;
      }
    }
  }
LABEL_55:
  [(CPLEngineScheduler *)self _updateOverridingForeground];
}

- (void)_startRequiredSyncSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v4 = (CPLSyncSession *)a3;
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
    if (v6 < 0.0) {
      [(CPLEngineScheduler *)self _disableRetryAfterLocked];
    }
  }
  if (self->_opened)
  {
    if (self->_currentSyncState > 0xD)
    {
      nextSession = self->_nextSession;
      if (nextSession)
      {
        if (nextSession == v4)
        {
          if (self->_deferDate && !_CPLSilentLogging)
          {
            double v15 = __CPLSchedulerOSLogDomain_7035();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              int v16 = 138543362;
              uint64_t v17 = v4;
              _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "Restarting deferred %{public}@", (uint8_t *)&v16, 0xCu);
            }
          }
          [(CPLEngineScheduler *)self _reallyStartSyncSession:v4];
        }
        else if (!_CPLSilentLogging)
        {
          id v7 = __CPLSchedulerOSLogDomain_7035();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v13 = self->_nextSession;
            int v16 = 138412546;
            uint64_t v17 = v4;
            __int16 v18 = 2112;
            __int16 v19 = v13;
            double v9 = "Dropping request for sync session %@ from implementation as we scheduled %@";
            goto LABEL_21;
          }
LABEL_22:
        }
      }
      else if (!_CPLSilentLogging)
      {
        unint64_t v14 = __CPLSchedulerOSLogDomain_7035();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 138412290;
          uint64_t v17 = v4;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Dropping request for sync session %@ from implementation as we cancelled that scheduling", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v7 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        currentSession = self->_currentSession;
        int v16 = 138412546;
        uint64_t v17 = v4;
        __int16 v18 = 2112;
        __int16 v19 = currentSession;
        double v9 = "Dropping request for sync session %@ from implementation as we are already in the middle of %@";
LABEL_21:
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v16, 0x16u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else if (self->_requiredFirstState <= 0xD && _CPLSilentLogging == 0)
  {
    id v7 = __CPLSchedulerOSLogDomain_7035();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v11 = +[CPLEngineSyncManager shortDescriptionForState:self->_requiredFirstState];
      int v16 = 138412290;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Dropping one request for a sync session from %@ because we are closed", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_22;
  }
}

- (void)_reallyStartSyncSession:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v5 = (CPLSyncSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession != v5 && currentSession != 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v20 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = self->_currentSession;
        *(_DWORD *)long long buf = 138412546;
        uint64_t v25 = v5;
        __int16 v26 = 2112;
        double v27 = v21;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Trying to start %@ while %@ is already running", buf, 0x16u);
      }
    }
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
    [v22 handleFailureInMethod:a2, self, v23, 261, @"Trying to start %@ while %@ is already running", v5, self->_currentSession object file lineNumber description];

    abort();
  }
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    [(NSDate *)unavailabilityLimitDate timeIntervalSinceNow];
    if (v9 < 0.0) {
      [(CPLEngineScheduler *)self _disableRetryAfterLocked];
    }
  }
  nextSession = self->_nextSession;
  self->_nextSession = 0;

  deferDate = self->_deferDate;
  self->_deferDate = 0;

  if ([(CPLEngineScheduler *)self _syncSessionIsPossible]
    && ([(CPLEngineScheduler *)self platformObject],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 shouldStartSyncSessionFromState:self->_requiredFirstState],
        v12,
        v13))
  {
    if (self->_requiredFirstState < 7
      || ([(CPLEngineScheduler *)self engineLibrary],
          unint64_t v14 = objc_claimAutoreleasedReturnValue(),
          [v14 store],
          double v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 isClientInSyncWithClientCache],
          v15,
          v14,
          v16)
      && self->_requiredFirstState <= 0xD)
    {
      self->_lastRequestGeneration = self->_currentRequestGeneration;
      -[CPLEngineScheduler _startSyncSession:withMinimalPhase:rewind:](self, "_startSyncSession:withMinimalPhase:rewind:", v5);
    }
    else if (!self->_currentSession)
    {
      __int16 v19 = [(CPLEngineScheduler *)self platformObject];
      [v19 noteSyncSessionSucceeded:v5];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v17 = __CPLSchedulerOSLogDomain_7035();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEBUG, "We were prevented to start a required sync session by implementation. Rescheduling", buf, 2u);
      }
    }
    if (!self->_currentSession)
    {
      __int16 v18 = [(CPLEngineScheduler *)self platformObject];
      [v18 noteSyncSessionSucceeded:v5];

      [(CPLEngineScheduler *)self _scheduleNextSyncSession];
    }
  }
  [(CPLEngineScheduler *)self _updateOverridingForeground];
}

- (void)_startSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4 rewind:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v9 = (CPLSyncSession *)a3;
  id v10 = v9;
  if (v5 && self->_currentSession != v9) {
    goto LABEL_24;
  }
  if (self->_protectAgainstFastRelaunch)
  {
    self->_protectAgainstFastRelaunch = 0;
    [(CPLEngineScheduler *)self _writeFirstSynchronizationMarker];
  }
  if (self->_delayedFirstSyncBecauseOfRapidLaunch) {
    self->_delayedFirstSyncBecauseOfRapidLaunch = 0;
  }
  if (self->_currentSession != v10)
  {
    if (_CPLSilentLogging) {
      goto LABEL_20;
    }
    id v11 = __CPLSchedulerOSLogDomain_7035();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v12 = +[CPLEngineSyncManager shortDescriptionForState:a4];
    int v13 = (void *)v12;
    unint64_t v14 = " (don't rewind)";
    *(_DWORD *)int v22 = 138412802;
    *(void *)&void v22[4] = v10;
    if (v5) {
      unint64_t v14 = "";
    }
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v12;
    *(_WORD *)&v22[22] = 2080;
    uint64_t v23 = v14;
    double v15 = "Starting %@ with minimal phase %@%s";
    goto LABEL_18;
  }
  if (_CPLSilentLogging) {
    goto LABEL_20;
  }
  id v11 = __CPLSchedulerOSLogDomain_7035();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = +[CPLEngineSyncManager shortDescriptionForState:a4];
    int v13 = (void *)v16;
    uint64_t v17 = " (don't rewind)";
    *(_DWORD *)int v22 = 138412802;
    *(void *)&void v22[4] = v10;
    if (v5) {
      uint64_t v17 = "";
    }
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v16;
    *(_WORD *)&v22[22] = 2080;
    uint64_t v23 = v17;
    double v15 = "Ensure %@ goes through phase %@%s";
LABEL_18:
    _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, v15, v22, 0x20u);
  }
LABEL_19:

LABEL_20:
  if (self->_nextSessionShouldRequestMoreTime
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        __int16 v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 BOOLForKey:@"CPLAllSessionsShouldRequestMoreTime"],
        v18,
        v19))
  {
    -[CPLSyncSession setShouldRequestMoreTime:](v10, "setShouldRequestMoreTime:", 1, *(_OWORD *)v22, *(void *)&v22[16], v23);
  }
  objc_storeStrong((id *)&self->_currentSession, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  int v21 = [WeakRetained syncManager];
  [v21 startSyncSession:v10 withMinimalPhase:a4 rewind:v5];

LABEL_24:
}

- (BOOL)_syncSessionIsPossible
{
  return !self->_unavailabilityLimitDate && [(NSCountedSet *)self->_disablingReasons count] == 0;
}

- (void)_setRequiredFirstState:(unint64_t)requiredFirstState
{
  if (self->_requiredFirstState != requiredFirstState)
  {
    self->_unint64_t requiredFirstState = requiredFirstState;
    requiredStateObserverBlock = (void (**)(id, unint64_t))self->_requiredStateObserverBlock;
    if (requiredStateObserverBlock)
    {
      requiredStateObserverBlock[2](requiredStateObserverBlock, requiredFirstState);
      unint64_t requiredFirstState = self->_requiredFirstState;
    }
    if (requiredFirstState <= 0xB) {
      self->_needsToUpdateLastSyncDate = 1;
    }
  }
}

- (void)_updateOverridingForeground
{
  unint64_t foregroundCalls = self->_foregroundCalls;
  if (self->_isOverridingForeground)
  {
    if (!foregroundCalls || !self->_nextSession && !self->_currentSession)
    {
      double v4 = [(CPLEngineScheduler *)self engineLibrary];
      BOOL v5 = [v4 systemMonitor];
      [v5 stopOverridingSystemBudgets:8 reason:2];
      BOOL v6 = 0;
LABEL_9:

      self->_isOverridingForeground = v6;
    }
  }
  else if (foregroundCalls && self->_currentSession)
  {
    double v4 = [(CPLEngineScheduler *)self engineLibrary];
    BOOL v5 = [v4 systemMonitor];
    [v5 startOverridingSystemBudgets:8 reason:2];
    BOOL v6 = 1;
    goto LABEL_9;
  }
}

- (CPLEngineScheduler)initWithEngineLibrary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CPLEngineScheduler;
  BOOL v6 = [(CPLEngineScheduler *)&v37 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    id v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.scheduler", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v7->_needsToUpdateLastSyncDate = 1;
    v7->_double intervalForRetry = 0.100000001;
    v7->_unint64_t requiredFirstState = 14;
    *(int64x2_t *)&v7->_unint64_t currentSyncState = vdupq_n_s64(0xEuLL);
    id v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    disablingReasons = v7->_disablingReasons;
    v7->_disablingReasons = v11;

    int v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    blockingElements = v7->_blockingElements;
    v7->_blockingElements = v13;

    double v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    blockedElements = v7->_blockedElements;
    v7->_blockedElements = v15;

    uint64_t v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    blockWaiters = v7->_blockWaiters;
    v7->_blockWaiters = v17;

    int v19 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    unblockOnceElements = v7->_unblockOnceElements;
    v7->_unblockOnceElements = v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.cpl.blocking", 0);
    blockingLock = v7->_blockingLock;
    v7->_blockingLock = (OS_dispatch_queue *)v21;

    v7->_protectAgainstFastRelaunch = 1;
    uint64_t v23 = [CPLSyncSessionPredictor alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_engineLibrary);
    uint64_t v25 = [WeakRetained libraryIdentifier];
    uint64_t v26 = [(CPLSyncSessionPredictor *)v23 initWithIdentifier:v25];
    predictor = v7->_predictor;
    v7->_predictor = (CPLSyncSessionPredictor *)v26;

    uint64_t v28 = +[CPLPlatform currentPlatform];
    uint64_t v29 = [v28 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v29;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v32 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          int v39 = v33;
          id v34 = v33;
          _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      id v35 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m"];
      [v35 handleFailureInMethod:a2, v7, v36, 192, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
  }

  return v7;
}

+ (id)validElements
{
  if (validElements_onceToken != -1) {
    dispatch_once(&validElements_onceToken, &__block_literal_global_90);
  }
  uint64_t v2 = (void *)validElements_validElements;
  return v2;
}

uint64_t __35__CPLEngineScheduler_validElements__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", CPLEngineElementUpload, CPLEngineElementSuccessfulUpload, CPLEngineElementEndOfUpload, CPLEngineElementEndOfUploadHighPriority, CPLEngineElementMingling, CPLEngineElementPushSweetSpot, CPLEngineElementClientPullsBatch, CPLEngineElementPullSweetSpot, CPLEngineElementDownloadResource, CPLEngineElementDownloadResourcesInBackground, CPLEngineElementProcessStagedScopes, CPLEngineElementUploadComputeStates, CPLEngineElementStartForceSync, 0);
  uint64_t v2 = validElements_validElements;
  validElements_validElements = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)platformImplementationProtocol
{
  uint64_t v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [v2 stringByAppendingString:@"Implementation"];
  double v4 = NSProtocolFromString(v3);

  return v4;
}

@end
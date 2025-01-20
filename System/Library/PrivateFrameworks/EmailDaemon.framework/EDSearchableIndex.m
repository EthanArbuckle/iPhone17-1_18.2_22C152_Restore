@interface EDSearchableIndex
+ (BOOL)isIncrementalIndexingType:(int64_t)a3;
+ (BOOL)isValidTransaction:(int64_t)a3;
+ (OS_os_log)indexWhileLockedLog;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)_localClientState;
+ (id)_localClientStateURL;
+ (id)_reindexReasonString:(int64_t)a3;
+ (void)_saveLocalClientState:(id)a3;
- (BOOL)_processIndexingBatch:(id)a3 clientState:(id)a4 itemsNotIndexed:(id)a5;
- (BOOL)canIndexAttachments;
- (BOOL)clientStateFetched;
- (BOOL)enableSpotlightVerification;
- (BOOL)isActive;
- (BOOL)isDataSourceIndexingPermitted;
- (BOOL)isIndexingDisabledForPPT;
- (BOOL)isPerformingBlockAffectingDataSourceAndIndex;
- (BOOL)isPersistenceAvailable;
- (BOOL)isPluggedIn;
- (BOOL)skipIndexExclusionCheck;
- (CSSearchableIndex)searchIndex;
- (EDSearchableIndex)initWithName:(id)a3 dataSource:(id)a4;
- (EDSearchableIndexDataSource)dataSource;
- (EDSearchableIndexSchedulableDelegate)schedulableDelegate;
- (EDSearchableIndexState)state;
- (EFFuture)delayDataSourceAssignmentFuture;
- (EFObservable)powerObservable;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (NSSet)currentReasons;
- (NSSet)dataSourceRefreshReasons;
- (NSSet)exclusionReasons;
- (NSSet)purgeReasons;
- (NSString)copyDiagnosticInformation;
- (NSString)indexName;
- (NSString)searchableIndexBundleID;
- (double)_throttleRequestedSize:(unint64_t *)a3 targetTime:(double)a4 action:(id)a5;
- (double)coalescingDelaySeconds;
- (double)dataSourceUpdateTimeLimit;
- (id)_consumeBatchOfSize:(unint64_t)a3;
- (id)_eventDataForTransitionState:(id)a3;
- (id)_identifiersForItems:(id)a3;
- (id)_identifiersStringForItems:(id)a3 maxLength:(unint64_t)a4;
- (id)_missingIdentifiersForIdentifiersNeedingReindex:(id)a3;
- (id)_processDomainRemovals:(id)a3;
- (id)_suggestionsService;
- (id)bundleIDForSearchableIndexVerifier:(id)a3;
- (id)dataSamplesForSearchableIndexVerifier:(id)a3 searchableIndex:(id)a4 count:(unint64_t)a5 lastVerifiedMessageID:(int64_t)a6;
- (id)knownTransactionIDsForSearchableIndexVerifier:(id)a3;
- (int64_t)_nextTransaction;
- (int64_t)_transaction;
- (int64_t)resumeCount;
- (unint64_t)currentMaximumBatchSize;
- (unint64_t)signpostID;
- (void)_clearOrphanedSearchableMessagesFromDatabase;
- (void)_coalescingTimerFired;
- (void)_collectAnalyticsForReindexReason:(int64_t)a3;
- (void)_collectAnalyticsForReindexReason:(int64_t)a3 withInfo:(id)a4;
- (void)_dataSourceAssignTransaction:(int64_t)a3 forIdentifiers:(id)a4 completion:(id)a5;
- (void)_dataSourceAssignTransaction:(int64_t)a3 updates:(id)a4 completion:(id)a5;
- (void)_dataSourceInvalidateItemsGreaterThanTransaction:(int64_t)a3 completion:(id)a4;
- (void)_dataSourcePrepareToIndexItems:(id)a3 fromRefresh:(BOOL)a4 withCompletion:(id)a5;
- (void)_dataSourceRequestNeededUpdatesExcludingIdentifiers:(id)a3 completion:(id)a4;
- (void)_dataSourceScheduleWork:(id)a3;
- (void)_dataSourceVerifyRepresentativeSampleWithCompletion:(id)a3;
- (void)_doIndexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5;
- (void)_fetchLastClientState;
- (void)_getDomainRemovals:(id *)a3 identifierRemovals:(id *)a4;
- (void)_handleFailingTransactionIDs:(id)a3;
- (void)_indexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5;
- (void)_invalidateItemsInTransactions:(id)a3;
- (void)_logSignpostForIndexingBatchAssignedDomainRemovalCount:(unint64_t)a3;
- (void)_logSignpostForIndexingBatchAssignedUpdatesWithItemsIndexedCount:(unint64_t)a3;
- (void)_logSignpostForIndexingBatchCompletedWithItemsIndexedCount:(id)a3;
- (void)_logSignpostForIndexingBatchStartWithPendingItemsCount:(id)a3;
- (void)_noteNeedsLastClientStateFetch;
- (void)_powerStateChanged;
- (void)_processAttachmentItemsForSuggestionsService:(id)a3;
- (void)_processIdentifierRemovals:(id)a3;
- (void)_processRefreshRequestWithCompletion:(id)a3;
- (void)_processSpotlightVerificationWithCompletion:(id)a3;
- (void)_queueConsumeBudgetElapsedPeriod:(double)a3;
- (void)_queueConsumeBudgetItemCount:(unint64_t)a3 lastItemDateReceived:(id)a4;
- (void)_queueRefresh;
- (void)_queueTransitionFromRefresh:(BOOL)a3;
- (void)_registerDistantFutureSpotlightVerification;
- (void)_registerStateCaptureHandler;
- (void)_resume;
- (void)_resumeIndexingScheduler;
- (void)_scheduleDataSourceRefresh;
- (void)_scheduleProcessPendingItemsFromRefresh:(BOOL)a3;
- (void)_scheduleSpotlightVerification;
- (void)_scheduleSpotlightVerificationOnIndexingQueueWithCompletion:(id)a3;
- (void)_sendAnalyticsForReindexReason:(int64_t)a3;
- (void)_startCoalescingTimer;
- (void)_stopCoalescingTimer;
- (void)_storeLastKnownReindexReason:(int64_t)a3 withInfo:(id)a4;
- (void)_suspend;
- (void)_suspendIndexingScheduler;
- (void)_transitionWithBudgetTimeUsed:(double)a3;
- (void)_verifySpotlightIndex;
- (void)applicationWillResume;
- (void)applicationWillSuspend;
- (void)attachmentBecameAvailable:(id)a3;
- (void)beginUpdatesAffectingDataSourceAndIndex;
- (void)dealloc;
- (void)endUpdatesAffectingDataSourceAndIndex;
- (void)generatedSummariesDidUpdate:(id)a3;
- (void)indexAttachmentsForMessageWithIdentifier:(id)a3 immediately:(BOOL)a4;
- (void)indexItems:(id)a3;
- (void)indexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5;
- (void)indexItems:(id)a3 immediately:(BOOL)a4;
- (void)indexMessages:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5;
- (void)markMessagesAsPrinted:(id)a3;
- (void)redonateAllItemsWithAcknowledgementHandler:(id)a3;
- (void)refresh;
- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4;
- (void)removeItemsForDomainIdentifier:(id)a3;
- (void)removeItemsWithIdentifiers:(id)a3;
- (void)removeItemsWithIdentifiers:(id)a3 reasons:(id)a4 fromRefresh:(BOOL)a5;
- (void)removeMessages:(id)a3;
- (void)resetIndexForNewLibraryWithCompletionHandler:(id)a3;
- (void)resume;
- (void)richLinkBecameAvailable:(id)a3;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4;
- (void)setClientStateFetched:(BOOL)a3;
- (void)setCoalescingDelaySeconds:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourceIndexingPermitted:(BOOL)a3;
- (void)setDataSourceUpdateTimeLimit:(double)a3;
- (void)setDelayDataSourceAssignmentFuture:(id)a3;
- (void)setEnableSpotlightVerification:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setIndexingDisabledForPPT:(BOOL)a3;
- (void)setPersistenceAvailable:(BOOL)a3;
- (void)setSchedulableDelegate:(id)a3;
- (void)setSearchIndex:(id)a3;
- (void)setSearchableIndexBundleID:(id)a3;
- (void)setSkipIndexExclusionCheck:(BOOL)a3;
- (void)setState:(id)a3;
- (void)suspend;
- (void)test_resetSpotlightIndex;
- (void)test_tearDown;
@end

@implementation EDSearchableIndex

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_307(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 countOfItemsInPendingQueues];

  id v4 = [*(id *)(a1 + 32) state];
  v2 = [v4 preprocessingItems];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count];
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) state];
  [v3 setScheduledProcessing:0];

  id v4 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 clientStateFetched];

  id v5 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 countOfItemsInPendingQueues];

  id v6 = [*(id *)(a1 + 32) state];
  v2 = [v6 preprocessingItems];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 count];
}

void __41__EDSearchableIndex__consumeBatchOfSize___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 pendingItems];
  uint64_t v4 = [v3 count];

  id v5 = [*(id *)(a1 + 32) state];
  uint64_t v6 = [v5 processBatchOfSize:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = [*(id *)(a1 + 32) state];
  v10 = [v9 pendingItems];
  uint64_t v11 = [v10 count];

  if (v4 != v11)
  {
    v12 = [*(id *)(a1 + 32) _identifiersStringForItems:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) maxLength:150];
    v13 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218498;
      uint64_t v17 = v4 - v11;
      __int16 v18 = 2048;
      uint64_t v19 = v4;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "consuming %lu items out of a potential %lu new processingItems: %{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
  if ((unint64_t)(v11 - 4) <= 0xB)
  {
    v14 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Allowing immediate indexing of %lu pending items", (uint8_t *)&v16, 0xCu);
    }

    v15 = [*(id *)(a1 + 32) state];
    [v15 setIndexImmediately:1];
  }
}

uint64_t __51__EDSearchableIndex__transitionWithBudgetTimeUsed___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _queueConsumeBudgetElapsedPeriod:*(double *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _queueTransitionFromRefresh:0];
}

- (void)_queueConsumeBudgetElapsedPeriod:(double)a3
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  id v5 = [(EDSearchableIndex *)self schedulableDelegate];
  [v5 searchableIndexSchedulable:self didIndexForTime:a3];
}

- (void)_queueTransitionFromRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  id v5 = [(EDSearchableIndex *)self state];
  if ([v5 isActive])
  {
  }
  else
  {
    char v6 = _os_feature_enabled_impl();

    if ((v6 & 1) == 0) {
      return;
    }
  }
  uint64_t v7 = [(EDSearchableIndex *)self state];
  char v8 = [v7 clientStateFetched];

  if (v8)
  {
    v9 = [(EDSearchableIndex *)self state];
    unint64_t v10 = [v9 countOfItemsInPendingQueues];

    uint64_t v11 = [(EDSearchableIndex *)self state];
    int v12 = [v11 needsImmediateProcessing];

    v13 = [(EDSearchableIndex *)self state];
    [v13 setIndexImmediately:0];

    unint64_t throttledIndexingBatchSize = self->_throttledIndexingBatchSize;
    v15 = [(EDSearchableIndex *)self state];
    int v16 = [v15 coalesceTimerFired];

    uint64_t v17 = [(EDSearchableIndex *)self state];
    [v17 setCoalesceTimerFired:0];
    if (v10) {
      int v18 = v16;
    }
    else {
      int v18 = 0;
    }
    unint64_t v19 = 16;
    if (throttledIndexingBatchSize < 0x10) {
      unint64_t v19 = throttledIndexingBatchSize;
    }
    if (v19 <= v10) {
      int v20 = 1;
    }
    else {
      int v20 = v18;
    }

    if ((v20 | v12) == 1)
    {
      [(EDSearchableIndex *)self _stopCoalescingTimer];
      [(EDSearchableIndex *)self _scheduleProcessPendingItemsFromRefresh:v3];
    }
    else if (v10 - 1 <= 0xE)
    {
      [(EDSearchableIndex *)self _startCoalescingTimer];
    }
    v24 = [(EDSearchableIndex *)self schedulableDelegate];
    int v25 = [v24 hasAvailableIndexingBudgetForSearchableIndexSchedulable:self];

    v26 = [(EDSearchableIndex *)self state];
    int v27 = [v26 queueContentsAllowsRefresh];

    v28 = [(EDSearchableIndex *)self state];
    int v29 = [v28 persistenceAvailable];

    if (v29)
    {
      v30 = [(EDSearchableIndex *)self state];
      if ([v30 needsToScheduleRefresh] & v25 & v27)
      {
        BOOL v31 = [(EDSearchableIndex *)self isPerformingBlockAffectingDataSourceAndIndex];

        if (!v31) {
          [(EDSearchableIndex *)self _scheduleDataSourceRefresh];
        }
      }
      else
      {
      }
      v32 = [(EDSearchableIndex *)self state];
      int v33 = [v32 needsToScheduleVerification];

      if (v33)
      {
        [(EDSearchableIndex *)self _scheduleSpotlightVerification];
      }
    }
  }
  else
  {
    v21 = [(id)objc_opt_class() indexWhileLockedLog];
    if (v21 && (EFProtectedDataAvailable() & 1) == 0 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[EDSearchableIndex _queueTransitionFromRefresh:]();
    }

    uint64_t v22 = [(EDSearchableIndex *)self state];
    int v23 = [v22 isActive];

    if (v23) {
      [(EDSearchableIndex *)self _fetchLastClientState];
    }
  }
}

- (EDSearchableIndexState)state
{
  return self->_state;
}

- (EDSearchableIndexSchedulableDelegate)schedulableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulableDelegate);

  return (EDSearchableIndexSchedulableDelegate *)WeakRetained;
}

- (void)_transitionWithBudgetTimeUsed:(double)a3
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__EDSearchableIndex__transitionWithBudgetTimeUsed___block_invoke;
  v4[3] = &unk_1E6BFFA50;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v4];
}

- (int64_t)_nextTransaction
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__EDSearchableIndex__nextTransaction__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke(uint64_t a1)
{
  v54[2] = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = -86;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 32);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2;
  v34[3] = &unk_1E6C054D0;
  v34[4] = v2;
  v34[5] = &v43;
  v34[6] = &v39;
  v34[7] = &v35;
  [v3 performSyncBlock:v34];
  uint64_t v4 = [*(id *)(a1 + 32) schedulableDelegate];
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (*((unsigned char *)v44 + 24))
  {
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 72), &state);
    id v5 = [NSNumber numberWithUnsignedInteger:v40[3]];
    uint64_t v6 = *(void *)(a1 + 32);
    v53[1] = @"preprocessing";
    v54[0] = v5;
    v53[0] = @"pending";
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:v36[3]];
    v54[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
    [v4 searchableIndexSchedulable:v6 didGeneratePowerEventWithIdentifier:@"Start Indexing Batch" eventData:v8];

    [*(id *)(a1 + 32) _logSignpostForIndexingBatchStartWithPendingItemsCount:v5];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v9 = *(char **)(a1 + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3;
    v23[3] = &unk_1E6C055C0;
    char v24 = *(unsigned char *)(a1 + 48);
    v23[4] = v9;
    v23[5] = &v25;
    v23[6] = &v30;
    [v9 _throttleRequestedSize:v9 + 48 targetTime:v23 action:0.5];
    double v11 = v10;
    os_activity_scope_leave(&state);
    [*(id *)(a1 + 40) invalidate];
    int v12 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v26[3];
      *(_DWORD *)buf = 134218240;
      uint64_t v50 = v13;
      __int16 v51 = 2048;
      double v52 = v11;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "batch of %lu items took %.4gs to index", buf, 0x16u);
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    double v11 = 0.0;
  }
  [*(id *)(a1 + 32) _transitionWithBudgetTimeUsed:v11];
  v14 = [NSNumber numberWithUnsignedInteger:v31[3]];
  [*(id *)(a1 + 32) _logSignpostForIndexingBatchCompletedWithItemsIndexedCount:v14];
  if (v11 > 0.0 && v31[3])
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = *(void **)(v15 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_307;
    v22[3] = &unk_1E6C055E8;
    v22[4] = v15;
    v22[5] = &v39;
    v22[6] = &v35;
    [v16 performSyncBlock:v22];
    v48[0] = v14;
    v47[0] = @"countOfItemsIndexed";
    v47[1] = @"elapsedTime";
    uint64_t v17 = [NSNumber numberWithDouble:v11];
    v48[1] = v17;
    v47[2] = @"itemsPerSecond";
    int v18 = [NSNumber numberWithDouble:(double)(unint64_t)v31[3] / v11];
    v48[2] = v18;
    v47[3] = @"pending";
    unint64_t v19 = [NSNumber numberWithUnsignedInteger:v40[3]];
    v48[3] = v19;
    v47[4] = @"preprocessing";
    int v20 = [NSNumber numberWithUnsignedInteger:v36[3]];
    v48[4] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:5];

    [v4 searchableIndexSchedulable:*(void *)(a1 + 32) didGenerateImportantPowerEventWithIdentifier:@"Finished Indexing Batch" eventData:v21];
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

void __37__EDSearchableIndex__nextTransaction__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) state];
  uint64_t v2 = [v3 transaction] + 1;
  [v3 setTransaction:v2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

void __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_331(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_331_cold_1();
    }
  }
  else
  {
    uint64_t v15 = a1;
    uint64_t v4 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = *(id *)(v15 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v10 = [v9 attributeSet];
          double v11 = [v10 relatedUniqueIdentifier];
          if (v11)
          {
            int v12 = [v10 accountIdentifier];
            BOOL v13 = v12 == 0;

            if (!v13)
            {
              v14 = (void *)[v9 copy];
              [v4 addObject:v14];
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    if ([v4 count]) {
      [*(id *)(v15 + 40) _processAttachmentItemsForSuggestionsService:v4];
    }
  }
}

id __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) skipIndexExclusionCheck] & 1) != 0
    || ([*(id *)(a1 + 40) shouldExcludeFromIndex] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) searchableItem];
    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) searchableIndexBundleID];
      uint64_t v4 = [v2 attributeSet];
      [v4 setBundleID:v3];

      id v5 = *(void **)(a1 + 48);
      uint64_t v6 = [v2 attributeSet];
      [v5 addTransactionValueToAttributeSet:v6];

      id v7 = v2;
    }
    else if (([*(id *)(a1 + 40) alwaysMarkAsIndexed] & 1) == 0)
    {
      [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id __42__EDSearchableIndex__identifiersForItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];

  return v2;
}

- (BOOL)skipIndexExclusionCheck
{
  return self->_skipIndexExclusionCheck;
}

- (NSString)searchableIndexBundleID
{
  return self->_searchableIndexBundleID;
}

id __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fetchIndexableAttachments];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 120);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_2;
  v10[3] = &unk_1E6C05680;
  v10[4] = v5;
  id v7 = v3;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v8 = [v4 onScheduler:v6 map:v10];

  return v8;
}

uint64_t __45__EDSearchableIndex__dataSourceScheduleWork___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

uint64_t __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 32) _consumeBatchOfSize:a2];
  unint64_t v42 = [*v3 _identifiersStringForItems:v4 maxLength:150];
  uint64_t v5 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v42;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Indexing batch of %@ items: %{public}@", buf, 0x16u);
  }
  id v7 = [(id)objc_opt_class() indexWhileLockedLog];
  if (v7 && (EFProtectedDataAvailable() & 1) == 0)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Indexing batch of %@ items: %{public}@", buf, 0x16u);
    }
  }

  double v10 = *(void **)(a1 + 32);
  id v72 = 0;
  id v73 = 0;
  [v10 _getDomainRemovals:&v73 identifierRemovals:&v72];
  id v11 = v73;
  id v43 = v72;
  uint64_t v12 = [v4 count];
  uint64_t v13 = [v43 count];
  if (v13 + v12 + [v11 count])
  {
    v14 = +[EDSearchableIndexClientState clientState];
    v40 = +[EDSearchableIndexClientState clientState];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v75 = __Block_byref_object_copy__34;
    v76 = __Block_byref_object_dispose__34;
    id v77 = (id)0xAAAAAAAAAAAAAAAALL;
    id v15 = v14;
    id v77 = v15;
    objc_msgSend(v15, "setTransaction:", objc_msgSend(*(id *)(a1 + 32), "_nextTransaction"));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_295;
    aBlock[3] = &unk_1E6C05520;
    aBlock[4] = *(void *)(a1 + 32);
    id v16 = v4;
    id v70 = v16;
    id v71 = v42;
    uint64_t v39 = _Block_copy(aBlock);
    uint64_t v41 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:9];
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    long long v17 = [*(id *)(a1 + 32) _processDomainRemovals:v11];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_299;
    void v54[3] = &unk_1E6C05548;
    id v55 = v11;
    id v19 = v39;
    id v62 = v19;
    id v20 = v15;
    uint64_t v21 = *(void *)(a1 + 32);
    id v37 = v20;
    id v56 = v20;
    uint64_t v57 = v21;
    id v22 = v40;
    id v58 = v22;
    v63 = buf;
    v64 = &v65;
    id v23 = v16;
    id v59 = v23;
    id v38 = v18;
    id v60 = v38;
    id v24 = v43;
    id v61 = v24;
    uint64_t v25 = [v17 onScheduler:v41 then:v54];

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_302;
    v48[3] = &unk_1E6C05570;
    v48[4] = *(void *)(a1 + 32);
    id v26 = v23;
    id v49 = v26;
    id v27 = v38;
    id v50 = v27;
    id v51 = v24;
    id v28 = v19;
    id v53 = v28;
    id v29 = v22;
    id v52 = v29;
    uint64_t v30 = [v25 onScheduler:v41 then:v48];

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_304;
    v44[3] = &unk_1E6C05598;
    id v31 = v26;
    v47 = buf;
    uint64_t v32 = *(void *)(a1 + 32);
    id v45 = v31;
    uint64_t v46 = v32;
    uint64_t v33 = [v30 onScheduler:v41 recover:v44];

    id v34 = (id)[v33 result:0];
    if ([*(id *)(a1 + 32) canIndexAttachments]
      && *((unsigned char *)v66 + 24)
      && !*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 32) refresh];
    }

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(buf, 8);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 24);
  uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v35;
}

- (double)_throttleRequestedSize:(unint64_t *)a3 targetTime:(double)a4 action:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v10 = [v9 thermalState];

  if ((unint64_t)(v10 - 1) >= 3)
  {
    if (v10) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = *a3;
    }
  }
  else
  {
    if (!_throttleRequestedSize_targetTime_action__lastLog
      || ([MEMORY[0x1E4F1C9C8] now],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v11 timeIntervalSinceDate:_throttleRequestedSize_targetTime_action__lastLog],
          double v13 = v12,
          v11,
          v13 > 300.0))
    {
      v14 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Throttling batch size based on thermal conditions", buf, 2u);
      }

      uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
      id v16 = (void *)_throttleRequestedSize_targetTime_action__lastLog;
      _throttleRequestedSize_targetTime_action__lastLog = v15;
    }
    unint64_t v17 = 4;
  }
  *(void *)buf = 0;
  uint64_t v35 = buf;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  id v29 = __62__EDSearchableIndex__throttleRequestedSize_targetTime_action___block_invoke;
  uint64_t v30 = &unk_1E6C05398;
  uint64_t v32 = buf;
  id v18 = v8;
  id v31 = v18;
  unint64_t v33 = v17;
  id v19 = v28;
  uint64_t v20 = mach_absolute_time();
  v29((uint64_t)v19);
  uint64_t v21 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_1 != -1) {
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_1, &__block_literal_global_770);
  }
  uint64_t v23 = EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_1;
  unint64_t v22 = *(unsigned int *)algn_1EB5F6FD4;

  unint64_t v24 = [(EDSearchableIndex *)self currentMaximumBatchSize];
  unint64_t v25 = *a3;
  unint64_t v26 = *((void *)v35 + 3);
  if (v26) {
    unint64_t v25 = vcvtad_u64_f64(a4 / ((double)((v21 - v20) * v23 / v22) / 1000000000.0 / (double)v26) * 0.7 + (double)v25 * 0.3);
  }
  if (v25 <= 4) {
    unint64_t v25 = 4;
  }
  if (v25 >= v24) {
    unint64_t v25 = v24;
  }
  *a3 = v25;

  _Block_object_dispose(buf, 8);
  return (double)((v21 - v20) * v23 / v22) / 1000000000.0;
}

void __62__EDSearchableIndex__throttleRequestedSize_targetTime_action___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E0190280]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_processIndexingBatch:(id)a3 clientState:(id)a4 itemsNotIndexed:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 count];
  if (v10)
  {
    id v11 = +[EDSearchableIndex signpostLog];
    os_signpost_id_t v12 = [(EDSearchableIndex *)self signpostID];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "EDSearchableIndexCreateSearchableItems", "", buf, 2u);
    }

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke;
    v46[3] = &unk_1E6C056A8;
    v46[4] = self;
    id v47 = v37;
    id v48 = v9;
    double v13 = objc_msgSend(v8, "ef_map:", v46);
    v14 = [MEMORY[0x1E4F60D70] join:v13];
    id v45 = 0;
    uint64_t v15 = [v14 result:&v45];
    id v36 = v45;
    id v16 = objc_msgSend(v15, "ef_filter:", *MEMORY[0x1E4F60CE8]);

    unint64_t v17 = +[EDSearchableIndex signpostLog];
    os_signpost_id_t v18 = [(EDSearchableIndex *)self signpostID];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v17, OS_SIGNPOST_INTERVAL_END, v18, "EDSearchableIndexCreateSearchableItems", "", buf, 2u);
    }

    if (!v16)
    {
      id v19 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v36, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndex _processIndexingBatch:clientState:itemsNotIndexed:]();
      }
    }
    uint64_t v20 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v16 count];
      unint64_t throttledIndexingBatchSize = self->_throttledIndexingBatchSize;
      *(_DWORD *)buf = 134218496;
      uint64_t v51 = v21;
      __int16 v52 = 2048;
      uint64_t v53 = v10;
      __int16 v54 = 2048;
      unint64_t v55 = throttledIndexingBatchSize;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "indexing %lu / %lu items, throttled batch size %lu", buf, 0x20u);
    }

    uint64_t v23 = [(id)objc_opt_class() indexWhileLockedLog];
    if (v23 && (EFProtectedDataAvailable() & 1) == 0)
    {
      unint64_t v24 = v23;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [v16 count];
        unint64_t v26 = self->_throttledIndexingBatchSize;
        *(_DWORD *)buf = 134218496;
        uint64_t v51 = v25;
        __int16 v52 = 2048;
        uint64_t v53 = v10;
        __int16 v54 = 2048;
        unint64_t v55 = v26;
        _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "indexing %lu / %lu items, throttled batch size %lu", buf, 0x20u);
      }
    }
    if ([v16 count])
    {
      id v27 = [(EDSearchableIndex *)self searchIndex];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_331;
      v42[3] = &unk_1E6C056D0;
      id v28 = v16;
      id v43 = v28;
      v44 = self;
      [v27 indexSearchableItems:v28 completionHandler:v42];

      if ([(EDSearchableIndex *)self canIndexAttachments])
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v49 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v39 != v31) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = [*(id *)(*((void *)&v38 + 1) + 8 * i) attributeSet];
              id v34 = [(id)v33 attachmentPaths];

              LOBYTE(v33) = [v34 count] == 0;
              if ((v33 & 1) == 0)
              {
                LOBYTE(v30) = 1;
                goto LABEL_34;
              }
            }
            uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v49 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }
LABEL_34:
      }
      else
      {
        LOBYTE(v30) = 0;
      }
    }
    else
    {
      LOBYTE(v30) = 0;
    }
  }
  else
  {
    LOBYTE(v30) = 0;
  }

  return v30;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__EDSearchableIndex_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_7 != -1) {
    dispatch_once(&signpostLog_onceToken_7, block);
  }
  uint64_t v2 = (void *)signpostLog_log_7;

  return (OS_os_log *)v2;
}

- (id)_identifiersStringForItems:(id)a3 maxLength:(unint64_t)a4
{
  uint64_t v5 = [(EDSearchableIndex *)self _identifiersForItems:a3];
  uint64_t v6 = NSString;
  id v7 = [v5 componentsJoinedByString:@","];
  id v8 = [v6 stringWithFormat:@"[%@]", v7];

  unint64_t v9 = [v8 length];
  if (v9 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = v9;
  }
  id v11 = [v8 substringToIndex:v10];

  return v11;
}

- (id)_identifiersForItems:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_322);

  return v3;
}

- (void)_dataSourceScheduleWork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.email.searchableIndex.dataSourceWorkBlock"];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __45__EDSearchableIndex__dataSourceScheduleWork___block_invoke;
  os_signpost_id_t v12 = &unk_1E6C007D8;
  id v6 = v4;
  id v14 = v6;
  id v7 = v5;
  id v13 = v7;
  id v8 = _Block_copy(&v9);
  -[EFStoppableScheduler performBlock:](self->_dataSourceScheduler, "performBlock:", v8, v9, v10, v11, v12);
}

id __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_299(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [EDSearchableIndexUpdates alloc];
    id v3 = [*(id *)(a1 + 32) allObjects];
    id v4 = [(EDSearchableIndexUpdates *)v2 initWithRemovedDomainIdentifiers:v3];

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "_logSignpostForIndexingBatchAssignedDomainRemovalCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  objc_msgSend(*(id *)(a1 + 56), "setTransaction:", objc_msgSend(*(id *)(a1 + 48), "_nextTransaction"));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 56));
  uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
  id v6 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v7 = [*(id *)(a1 + 48) signpostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EDSearchableIndexCSProcessing", "BatchBeginCoreSpotlightBatch", (uint8_t *)&v18, 2u);
  }

  id v8 = [*(id *)(a1 + 48) searchIndex];
  [v8 beginIndexBatch];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [*(id *)(a1 + 48) _processIndexingBatch:*(void *)(a1 + 64) clientState:*(void *)(a1 + 56) itemsNotIndexed:*(void *)(a1 + 72)];
  [*(id *)(a1 + 48) _processIdentifierRemovals:*(void *)(a1 + 80)];
  uint64_t v9 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 56);
    int v18 = 138412290;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Ending batch with client state: %@", (uint8_t *)&v18, 0xCu);
  }

  id v11 = [(id)objc_opt_class() indexWhileLockedLog];
  if (v11 && (EFProtectedDataAvailable() & 1) == 0 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    int v18 = 138412290;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Ending batch with client state: %@", (uint8_t *)&v18, 0xCu);
  }

  id v13 = [*(id *)(a1 + 48) searchIndex];
  id v14 = [*(id *)(a1 + 56) archiveRepresentation];
  uint64_t v15 = [v5 errorOnlyCompletionHandlerAdapter];
  [v13 endIndexBatchWithClientState:v14 completionHandler:v15];

  id v16 = [v5 future];

  return v16;
}

- (CSSearchableIndex)searchIndex
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  searchIndex = v2->_searchIndex;
  if (!searchIndex)
  {
    id v4 = (id)*MEMORY[0x1E4F28340];
    uint64_t v5 = [MEMORY[0x1E4F60D58] currentDevice];
    int v6 = [v5 isAppleSilicon];

    if (v6)
    {
      id v7 = (id)*MEMORY[0x1E4F28358];

      id v4 = v7;
    }
    id v8 = [(EDSearchableIndex *)v2 searchableIndexBundleID];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F23838]);
      indexName = v2->_indexName;
      id v11 = [(EDSearchableIndex *)v2 searchableIndexBundleID];
      uint64_t v12 = [v9 initWithName:indexName protectionClass:v4 bundleIdentifier:v11];
      id v13 = v2->_searchIndex;
      v2->_searchIndex = (CSSearchableIndex *)v12;
    }
    else
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F23838]) initWithName:v2->_indexName protectionClass:v4];
      id v11 = v2->_searchIndex;
      v2->_searchIndex = (CSSearchableIndex *)v14;
    }

    uint64_t v15 = [(EDSearchableIndex *)v2 state];
    int v16 = [v15 persistenceAvailable];

    if (v16) {
      [(CSSearchableIndex *)v2->_searchIndex setIndexDelegate:v2];
    }

    searchIndex = v2->_searchIndex;
  }
  unint64_t v17 = searchIndex;
  objc_sync_exit(v2);

  return v17;
}

uint64_t __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_279(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) _suspendIndexingScheduler];
  uint64_t v5 = [*v4 dataSource];
  int v6 = [v5 itemsToRemoveForSearchableIndex:*v4];

  if ([v6 count])
  {
    id v7 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138412290;
      id v37 = v8;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Removing %@ items", buf, 0xCu);
    }
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 dataSourceRefreshReasons];
    [v9 removeItemsWithIdentifiers:v6 reasons:v10 fromRefresh:1];
  }
  id v11 = [*(id *)(a1 + 32) dataSource];
  uint64_t v12 = [v11 itemsToIndexForSearchableIndex:*(void *)(a1 + 32) excludingIdentifiers:*(void *)(a1 + 40) count:a2 cancelationToken:*(void *)(a1 + 48)];

  if ([v12 count])
  {
    id v13 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412802;
      id v37 = v14;
      __int16 v38 = 2048;
      uint64_t v39 = v15;
      __int16 v40 = 2048;
      uint64_t v41 = a2;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_INFO, "Indexing %@ items throttledDataSourceBatchSize:%lu batchSize:%lu", buf, 0x20u);
    }
    [*(id *)(a1 + 32) _indexItems:v12 fromRefresh:1 immediately:0];
  }
  int v16 = [*(id *)(a1 + 32) dataSource];
  unint64_t v17 = [v16 domainsToRemoveForSearchableIndex:*(void *)(a1 + 32)];

  if ([v17 count])
  {
    int v18 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      *(_DWORD *)buf = 138412290;
      id v37 = v19;
      _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_INFO, "Removing %@ domains", buf, 0xCu);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(a1 + 32) removeItemsForDomainIdentifier:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v21);
    }
  }
  [*(id *)(a1 + 32) _resumeIndexingScheduler];
  uint64_t v24 = [v12 count];
  if (v24 || [*(id *)(a1 + 48) isCanceled])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if ([*(id *)(a1 + 32) isDataSourceIndexingPermitted])
  {
    unint64_t v26 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v37 = 0;
      __int16 v38 = 2048;
      uint64_t v39 = a2;
      _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Data source returned %lu out of %lu requested items to index.", buf, 0x16u);
    }

    id v27 = [*(id *)(a1 + 32) schedulableDelegate];
    [v27 indexingDidFinishForSearchableIndexSchedulable:*(void *)(a1 + 32) backlogComplete:1];

    uint64_t v28 = *(void *)(a1 + 32);
    id v29 = *(void **)(v28 + 32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_280;
    v30[3] = &unk_1E6BFF2F0;
    v30[4] = v28;
    [v29 performBlock:v30];
  }

  return v24;
}

- (EDSearchableIndexDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (EDSearchableIndexDataSource *)WeakRetained;
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_276(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_276_cold_1();
    }

    [WeakRetained cancel];
    id v4 = [*(id *)(a1 + 32) schedulableDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 didCancelDataSourceUpdateRequestForSearchableIndexSchedulable:*(void *)(a1 + 32)];
    }
  }
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke(id *a1)
{
  uint64_t v2 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v3 = [a1[4] signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EDSearchableIndexDataSourceUpdates", "", buf, 2u);
  }

  *(void *)buf = 0;
  long long v32 = buf;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  if ([a1[4] isPerformingBlockAffectingDataSourceAndIndex])
  {
    v32[24] = 1;
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60D40]) initWithLabel:@"com.apple.mail.searchableIndex.dataSourceCancelation"];
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, v4);
    uint64_t v5 = a1[4];
    int v6 = (void *)v5[4];
    [v5 dataSourceUpdateTimeLimit];
    double v8 = v7;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_276;
    v24[3] = &unk_1E6BFF198;
    objc_copyWeak(&v25, location);
    v24[4] = a1[4];
    id v9 = (id)[v6 afterDelay:v24 performBlock:v8];
    uint64_t v10 = (char *)a1[4];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_279;
    v20[3] = &unk_1E6C05458;
    v20[4] = v10;
    id v21 = a1[5];
    id v11 = v4;
    id v22 = v11;
    uint64_t v23 = buf;
    [v10 _throttleRequestedSize:v10 + 56 targetTime:v20 action:0.5];
    v28[3] = v12;

    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
  }
  id v13 = a1[4];
  uint64_t v14 = (void *)v13[4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_2;
  v17[3] = &unk_1E6C05480;
  uint64_t v19 = &v27;
  v17[4] = v13;
  id v18 = a1[6];
  [v14 performSyncBlock:v17];
  if (v32[24]) {
    [a1[4] refresh];
  }
  uint64_t v15 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v16 = [a1[4] signpostID];
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(location[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_END, v16, "EDSearchableIndexDataSourceUpdates", "", (uint8_t *)location, 2u);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);
}

void __69__EDSearchableIndex__dataSourceAssignTransaction_updates_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delayDataSourceAssignmentFuture];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 56);

    if (v3 >= 1)
    {
      id v4 = [*(id *)(a1 + 32) delayDataSourceAssignmentFuture];
      id v5 = (id)[v4 result];
    }
  }
  int v6 = [*(id *)(a1 + 32) dataSource];
  id v8 = [v6 searchableIndex:*(void *)(a1 + 32) assignTransaction:*(void *)(a1 + 56) updates:*(void *)(a1 + 40)];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3_297(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_INFO, "Clearing %lu items %{public}@ from processingItems", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 48) state];
  [v5 didIndexItems:*(void *)(a1 + 32)];
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2_296(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3_297;
    v5[3] = &unk_1E6BFF7A8;
    id v6 = *(id *)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = v4;
    [v2 performSyncBlock:v5];
  }
}

id __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_302(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v2, OS_SIGNPOST_INTERVAL_END, v3, "EDSearchableIndexCSProcessing", "BatchEndCoreSpotlightBatch", (uint8_t *)&v15, 2u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) arrayByExcludingObjectsInArray:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 56) identifiers];
  id v6 = [EDSearchableIndexUpdates alloc];
  id v7 = [(EDSearchableIndexUpdates *)v6 initWithIndexedItems:v4 removedIdentifiers:v5 removedDomainIdentifiers:MEMORY[0x1E4F1CBF0]];
  uint64_t v8 = [(id)objc_opt_class() indexWhileLockedLog];
  if (v8 && (EFProtectedDataAvailable() & 1) == 0)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) _identifiersStringForItems:*(void *)(a1 + 40) maxLength:150];
      int v15 = 138412290;
      os_signpost_id_t v16 = v10;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Recording successful index of items: %@", (uint8_t *)&v15, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [(EDSearchableIndexUpdates *)v7 indexedItems];
  objc_msgSend(v11, "_logSignpostForIndexingBatchAssignedUpdatesWithItemsIndexedCount:", objc_msgSend(v12, "count"));

  id v13 = [MEMORY[0x1E4F60D70] nullFuture];

  return v13;
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_295(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v7 transaction];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2_296;
  int v15 = &unk_1E6C054F8;
  char v19 = a4;
  id v11 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v11;
  id v18 = *(id *)(a1 + 48);
  [v9 _dataSourceAssignTransaction:v10 updates:v8 completion:&v12];
  objc_msgSend((id)objc_opt_class(), "_saveLocalClientState:", v7, v12, v13, v14, v15, v16);
}

void __59__EDSearchableIndex__getDomainRemovals_identifierRemovals___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [WeakRetained state];
    uint64_t v3 = [v2 removePendingDomainRemovals];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    id v6 = [WeakRetained state];
    uint64_t v7 = [v6 pendingIdentifierRemovals];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [_EDSearchableIndexPendingRemovals alloc];
    id v11 = [WeakRetained purgeReasons];
    uint64_t v12 = [WeakRetained exclusionReasons];
    uint64_t v13 = [(_EDSearchableIndexPendingRemovals *)v10 initWithPurgeReasons:v11 exclusionReasons:v12];
    uint64_t v14 = [WeakRetained state];
    [v14 setPendingIdentifierRemovals:v13];
  }
}

void __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if (![v2 queueContentsAllowsRefresh]) {
    goto LABEL_6;
  }
  uint64_t v3 = [*(id *)(a1 + 32) state];
  if (([v3 needsRefresh] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  char v4 = [*(id *)(a1 + 32) isPerformingBlockAffectingDataSourceAndIndex];

  if ((v4 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 state];
    uint64_t v7 = [v6 pendingIdentifiers];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke_2;
    v10[3] = &unk_1E6BFFBC8;
    uint64_t v8 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    [v5 _dataSourceRequestNeededUpdatesExcludingIdentifiers:v7 completion:v10];

    return;
  }
LABEL_7:
  uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v9();
}

uint64_t __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke_2;
  v4[3] = &unk_1E6BFF2F0;
  v4[4] = v2;
  [v2 _processRefreshRequestWithCompletion:v4];
  return [*(id *)(a1 + 32) _transitionWithBudgetTimeUsed:0.0];
}

void __42__EDSearchableIndex__startCoalescingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _coalescingTimerFired];
}

uint64_t __28__EDSearchableIndex_refresh__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueRefresh];
}

- (void)refresh
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__EDSearchableIndex_refresh__block_invoke;
  v3[3] = &unk_1E6BFF2F0;
  v3[4] = self;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v3];
}

- (BOOL)isPerformingBlockAffectingDataSourceAndIndex
{
  int64_t v2 = atomic_load((unint64_t *)&self->_countOfBlocksAffectingDataSourceAndIndex);
  return v2 > 0;
}

- (EFFuture)delayDataSourceAssignmentFuture
{
  return self->_delayDataSourceAssignmentFuture;
}

- (double)dataSourceUpdateTimeLimit
{
  return self->_dataSourceUpdateTimeLimit;
}

- (unint64_t)currentMaximumBatchSize
{
  p_mainThreadAccessibleIvarLock = &self->_mainThreadAccessibleIvarLock;
  os_unfair_lock_lock(&self->_mainThreadAccessibleIvarLock);
  unint64_t currentMaximumBatchSize = self->_currentMaximumBatchSize;
  os_unfair_lock_unlock(p_mainThreadAccessibleIvarLock);
  return currentMaximumBatchSize;
}

- (BOOL)canIndexAttachments
{
  return 1;
}

- (void)_suspendIndexingScheduler
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_5(&dword_1DB39C000, v0, v1, "suspending indexing scheduler", v2, v3, v4, v5, v6);
}

- (void)_stopCoalescingTimer
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  if (self->_coalescingTimer)
  {
    uint64_t v3 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "stopping coalescing timer", v5, 2u);
    }

    [(EFCancelable *)self->_coalescingTimer cancel];
    coalescingTimer = self->_coalescingTimer;
    self->_coalescingTimer = 0;
  }
}

- (void)_scheduleProcessPendingItemsFromRefresh:(BOOL)a3
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  uint64_t v5 = [(EDSearchableIndex *)self state];
  char v6 = [v5 scheduledProcessing];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[EDSearchableIndex _scheduleProcessPendingItemsFromRefresh:]();
    }

    uint64_t v8 = [(EDSearchableIndex *)self state];
    [v8 setScheduledProcessing:1];

    uint64_t v9 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.email.searchableIndex.indexingBatch"];
    indexingScheduler = self->_indexingScheduler;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke;
    v12[3] = &unk_1E6C049D8;
    BOOL v14 = a3;
    v12[4] = self;
    id v13 = v9;
    id v11 = v9;
    [(EFSuspendableScheduler *)indexingScheduler performBlock:v12];
  }
}

- (void)_scheduleDataSourceRefresh
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  uint64_t v3 = [(EDSearchableIndex *)self state];
  char v4 = [v3 scheduledRefresh];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(EDSearchableIndex *)self state];
    [v5 setScheduledRefresh:1];

    indexingScheduler = self->_indexingScheduler;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke;
    v7[3] = &unk_1E6BFF2F0;
    v7[4] = self;
    [(EFSuspendableScheduler *)indexingScheduler performBlock:v7];
  }
}

- (void)_queueRefresh
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  uint64_t v3 = [(EDSearchableIndex *)self state];
  [v3 setNeedsRefresh:1];

  [(EDSearchableIndex *)self _queueTransitionFromRefresh:1];
}

- (void)_processRefreshRequestWithCompletion:(id)a3
{
  id v4 = a3;
  [(EFSuspendableScheduler *)self->_indexingScheduler assertIsExecuting:1];
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v7];
}

- (void)_processIdentifierRemovals:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 identifiers];
      uint64_t v7 = [v6 componentsJoinedByString:@", "];
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "removing indexed items with identifiers {%@}", (uint8_t *)&v11, 0xCu);
    }
    id v8 = [(EDSearchableIndex *)self searchIndex];
    uint64_t v9 = [v4 identifiers];
    [v8 deleteSearchableItemsWithIdentifiers:v9 completionHandler:0];

    uint64_t v10 = [v4 purgedIdentifiers];
    [v8 changeStateOfSearchableItemsWithUIDs:v10 toState:1];
  }
}

- (id)_processDomainRemovals:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EFSuspendableScheduler *)self->_indexingScheduler assertIsExecuting:1];
  uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
  if ([v4 count])
  {
    id v6 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 allObjects];
      id v8 = [v7 componentsJoinedByString:@", "];
      int v15 = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "removing indexed items for domains {%@}", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v9 = [(EDSearchableIndex *)self searchIndex];
    uint64_t v10 = [v4 allObjects];
    int v11 = [v5 errorOnlyCompletionHandlerAdapter];
    [v9 deleteSearchableItemsWithDomainIdentifiers:v10 completionHandler:v11];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    [v5 finishWithResult:v12];
  }
  uint64_t v13 = [v5 future];

  return v13;
}

- (void)_logSignpostForIndexingBatchStartWithPendingItemsCount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v6 = [(EDSearchableIndex *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDSearchableIndexBatchProcessing", "BatchStartedWithPendingItemCount=%{signpost.description:attribute,public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_logSignpostForIndexingBatchCompletedWithItemsIndexedCount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v6 = [(EDSearchableIndex *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDSearchableIndexBatchProcessing", "BatchFinishedWithItemIndexedCount=%{signpost.description:attribute,public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_logSignpostForIndexingBatchAssignedUpdatesWithItemsIndexedCount:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v6 = [(EDSearchableIndex *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    unint64_t v8 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_EVENT, v6, "EDSearchableIndexBatchProcessing", "BatchAssignedDomnainRemovalCount=%{signpost.description:attribute,public}llu", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_getDomainRemovals:(id *)a3 identifierRemovals:(id *)a4
{
  [(EFSuspendableScheduler *)self->_indexingScheduler assertIsExecuting:1];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__34;
  uint64_t v23 = __Block_byref_object_dispose__34;
  id v24 = 0;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__34;
  uint64_t v17 = __Block_byref_object_dispose__34;
  id v18 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__EDSearchableIndex__getDomainRemovals_identifierRemovals___block_invoke;
  v8[3] = &unk_1E6C05658;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3 != 0;
  BOOL v11 = a4 != 0;
  v8[4] = &v13;
  v8[5] = &v19;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v8];
  if (a3) {
    *a3 = (id) v14[5];
  }
  if (a4) {
    *a4 = (id) v20[5];
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

- (void)_dataSourceRequestNeededUpdatesExcludingIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"EDSearchableIndex.m", 1199, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke;
  v12[3] = &unk_1E6C01BF0;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v10 = v8;
  id v14 = v10;
  [(EDSearchableIndex *)self _dataSourceScheduleWork:v12];
}

- (void)_dataSourceAssignTransaction:(int64_t)a3 updates:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__EDSearchableIndex__dataSourceAssignTransaction_updates_completion___block_invoke;
  v12[3] = &unk_1E6C016F8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(EDSearchableIndex *)self _dataSourceScheduleWork:v12];
}

- (id)_consumeBatchOfSize:(unint64_t)a3
{
  [(EFSuspendableScheduler *)self->_indexingScheduler assertIsExecuting:1];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__34;
  id v13 = __Block_byref_object_dispose__34;
  id v14 = 0;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__EDSearchableIndex__consumeBatchOfSize___block_invoke;
  v8[3] = &unk_1E6C05610;
  v8[4] = self;
  v8[5] = &v9;
  void v8[6] = a3;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_coalescingTimerFired
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  uint64_t v3 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "coalescing timer fired", v6, 2u);
  }

  id v4 = [(EDSearchableIndex *)self state];
  [v4 setCoalesceTimerFired:1];

  coalescingTimer = self->_coalescingTimer;
  self->_coalescingTimer = 0;

  [(EDSearchableIndex *)self _queueTransitionFromRefresh:0];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__EDSearchableIndex_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_78 != -1) {
    dispatch_once(&log_onceToken_78, block);
  }
  uint64_t v2 = (void *)log_log_78;

  return (OS_os_log *)v2;
}

+ (BOOL)isValidTransaction:(int64_t)a3
{
  return a3 > 0;
}

+ (OS_os_log)indexWhileLockedLog
{
  if (indexWhileLockedLog_onceToken != -1) {
    dispatch_once(&indexWhileLockedLog_onceToken, &__block_literal_global_66);
  }
  if (_os_feature_enabled_impl()) {
    id v2 = (id)indexWhileLockedLog_log;
  }
  else {
    id v2 = 0;
  }

  return (OS_os_log *)v2;
}

+ (void)_saveLocalClientState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F60D58] currentDevice];
  int v6 = [v5 isInternal];

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__EDSearchableIndex__saveLocalClientState___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_saveLocalClientState__onceToken != -1) {
      dispatch_once(&_saveLocalClientState__onceToken, block);
    }
    [(id)_saveLocalClientState__coalescer coalesceValue:v4];
  }
}

void __24__EDSearchableIndex_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_78;
  log_log_78 = (uint64_t)v1;
}

void __32__EDSearchableIndex_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)signpostLog_log_7;
  signpostLog_log_7 = (uint64_t)v1;
}

void __40__EDSearchableIndex_indexWhileLockedLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "IndexWhileLocked");
  os_log_t v1 = (void *)indexWhileLockedLog_log;
  indexWhileLockedLog_log = (uint64_t)v0;
}

+ (BOOL)isIncrementalIndexingType:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0x96u >> a3);
}

- (EDSearchableIndex)initWithName:(id)a3 dataSource:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)EDSearchableIndex;
  id v8 = [(EDSearchableIndex *)&v76 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__EDSearchableIndex_initWithName_dataSource___block_invoke;
    aBlock[3] = &unk_1E6C03DE0;
    id v75 = v6;
    uint64_t v11 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
    uint64_t v12 = [_EDSearchableIndexPendingRemovals alloc];
    id v13 = [v8 purgeReasons];
    id v14 = [v8 exclusionReasons];
    id v71 = [(_EDSearchableIndexPendingRemovals *)v12 initWithPurgeReasons:v13 exclusionReasons:v14];

    int64_t v15 = [[EDSearchableIndexState alloc] initWithPendingIdentifierRemovals:v71];
    uint64_t v16 = (void *)*((void *)v8 + 23);
    *((void *)v8 + 23) = v15;

    uint64_t v17 = (void *)MEMORY[0x1E4F60F38];
    id v18 = (void *)MEMORY[0x1E4F60F28];
    uint64_t v19 = v11[2](v11, @"state");
    id v20 = [v18 serialDispatchQueueSchedulerWithName:v19];
    uint64_t v21 = [v17 assertableSchedulerWithScheduler:v20];
    id v22 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v21;

    objc_storeWeak((id *)v8 + 20, v7);
    id v23 = objc_alloc_init(MEMORY[0x1E4F60258]);
    id v24 = (void *)*((void *)v8 + 19);
    *((void *)v8 + 19) = v23;

    id v25 = (void *)MEMORY[0x1E4F60F38];
    unint64_t v26 = (void *)MEMORY[0x1E4F60F28];
    uint64_t v27 = v11[2](v11, @"indexingQueue");
    uint64_t v28 = [v26 serialDispatchQueueSchedulerWithName:v27 qualityOfService:9];
    uint64_t v29 = [v25 suspendableSchedulerWithScheduler:v28];
    uint64_t v30 = (void *)*((void *)v8 + 10);
    *((void *)v8 + 10) = v29;

    id v31 = objc_alloc(MEMORY[0x1E4F60F38]);
    long long v32 = (void *)MEMORY[0x1E4F60F28];
    uint64_t v33 = v11[2](v11, @"dataSource");
    char v34 = [v32 serialDispatchQueueSchedulerWithName:v33 qualityOfService:9];
    uint64_t v35 = [v31 initWithScheduler:v34];
    id v36 = (void *)*((void *)v8 + 11);
    *((void *)v8 + 11) = v35;

    id v37 = objc_alloc(MEMORY[0x1E4F60F38]);
    __int16 v38 = (void *)MEMORY[0x1E4F60F28];
    uint64_t v39 = v11[2](v11, @"addIndexItems");
    __int16 v40 = [v38 serialDispatchQueueSchedulerWithName:v39 qualityOfService:9];
    uint64_t v41 = [v37 initWithScheduler:v40];
    uint64_t v42 = (void *)*((void *)v8 + 12);
    *((void *)v8 + 12) = v41;

    *((_DWORD *)v8 + 28) = 0;
    *((_DWORD *)v8 + 36) = 0;
    id v43 = [MEMORY[0x1E4F28F80] processInfo];
    unint64_t v44 = [v43 activeProcessorCount];

    id v45 = objc_alloc(MEMORY[0x1E4F60F38]);
    uint64_t v46 = [MEMORY[0x1E4F60F28] operationQueueSchedulerWithMaxConcurrentOperationCount:(uint64_t)((double)v44 * 0.5) + 1];
    uint64_t v47 = [v45 initWithScheduler:v46];
    id v48 = (void *)*((void *)v8 + 13);
    *((void *)v8 + 13) = v47;

    id v49 = objc_alloc(MEMORY[0x1E4F60F38]);
    id v50 = (void *)MEMORY[0x1E4F60F28];
    uint64_t v51 = v11[2](v11, @"batch");
    __int16 v52 = [v50 serialDispatchQueueSchedulerWithName:v51 qualityOfService:9];
    uint64_t v53 = [v49 initWithScheduler:v52];
    __int16 v54 = (void *)*((void *)v8 + 15);
    *((void *)v8 + 15) = v53;

    *((int64x2_t *)v8 + 3) = vdupq_n_s64(0x40uLL);
    *((void *)v8 + 8) = 64;
    *(_OWORD *)(v8 + 200) = xmmword_1DB640610;
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [v8 _suspendIndexingScheduler];
    }
    os_activity_t v55 = _os_activity_create(&dword_1DB39C000, "processing batch of indexable items", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v56 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v55;

    v8[150] = 0;
    atomic_store(0, (unint64_t *)v8 + 16);
    uint64_t v57 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v8[151] = [v57 BOOLForKey:@"DisableSpotlightVerification"] ^ 1;

    id v58 = [v8 powerObservable];
    if (v58)
    {
      id v59 = objc_alloc_init(MEMORY[0x1E4F60D40]);
      id v60 = (void *)*((void *)v8 + 2);
      *((void *)v8 + 2) = v59;

      *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)location, v8);
      id v61 = (void *)*((void *)v8 + 2);
      id v62 = (void *)MEMORY[0x1E4F60DE0];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __45__EDSearchableIndex_initWithName_dataSource___block_invoke_2;
      v72[3] = &unk_1E6C05218;
      objc_copyWeak(&v73, (id *)location);
      v63 = [v62 observerWithResultBlock:v72];
      v64 = [v58 subscribe:v63];
      [v61 addCancelable:v64];

      objc_destroyWeak(&v73);
      objc_destroyWeak((id *)location);
    }
    [v8 _registerStateCaptureHandler];
    uint64_t v65 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v65 addObserver:v8 selector:sel_richLinkBecameAvailable_ name:@"LibraryMessageRichLinkDataBecameAvailableNotification" object:0];

    if (_os_feature_enabled_impl())
    {
      v66 = [(id)objc_opt_class() indexWhileLockedLog];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v67 = NSNumber;
        char v68 = [MEMORY[0x1E4F28F80] processInfo];
        v69 = objc_msgSend(v67, "numberWithInt:", objc_msgSend(v68, "processIdentifier"));
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v69;
        _os_log_impl(&dword_1DB39C000, v66, OS_LOG_TYPE_DEFAULT, "maild started with pid %@", location, 0xCu);
      }
    }
  }
  return (EDSearchableIndex *)v8;
}

id __45__EDSearchableIndex_initWithName_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"com.apple.email.searchableIndex.%@.%@", a2, *(void *)(a1 + 32)];

  return v2;
}

void __45__EDSearchableIndex_initWithName_dataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _powerStateChanged];
}

- (void)dealloc
{
  id v3 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating searchable index", buf, 2u);
  }

  [(EFCancelationToken *)self->_cancelationToken cancel];
  [(EFCancelable *)self->_stateCancelable cancel];
  [(EFCancelable *)self->_coalescingTimer cancel];
  if (![(EDSearchableIndexState *)self->_state isActive] && (_os_feature_enabled_impl() & 1) == 0) {
    [(EFSuspendableScheduler *)self->_indexingScheduler resume];
  }
  [(CSSearchableIndex *)self->_searchIndex setIndexDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)EDSearchableIndex;
  [(EDSearchableIndex *)&v4 dealloc];
}

- (NSString)copyDiagnosticInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  char v86 = -86;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  char v84 = -86;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  char v82 = -86;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  char v80 = -86;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  char v78 = -86;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  char v76 = -86;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = -86;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  char v72 = -86;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  char v70 = -86;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  char v68 = -86;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v59 = 0;
  id v60 = &v59;
  uint64_t v61 = 0x2020000000;
  unint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v53 = 0;
  __int16 v54 = &v53;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = __Block_byref_object_copy__34;
  uint64_t v57 = __Block_byref_object_dispose__34;
  id v58 = 0;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__34;
  uint64_t v51 = __Block_byref_object_dispose__34;
  id v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  unint64_t v44 = __Block_byref_object_copy__34;
  id v45 = __Block_byref_object_dispose__34;
  id v46 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = __Block_byref_object_copy__34;
  uint64_t v39 = __Block_byref_object_dispose__34;
  id v40 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke;
  v30[3] = &unk_1E6C05240;
  v30[4] = self;
  void v30[5] = v85;
  v30[6] = v83;
  v30[7] = v81;
  v30[8] = v79;
  v30[9] = v77;
  v30[10] = v75;
  v30[11] = v73;
  v30[12] = v71;
  v30[13] = v69;
  v30[14] = v67;
  v30[15] = &v63;
  v30[16] = &v59;
  v30[17] = &v53;
  v30[18] = &v47;
  v30[19] = &v41;
  v30[20] = &v35;
  v30[21] = &v31;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v30];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  dataSourceScheduler = self->_dataSourceScheduler;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke_2;
  v25[3] = &unk_1E6C00A68;
  v25[4] = self;
  v25[5] = &v26;
  [(EFStoppableScheduler *)dataSourceScheduler performSyncBlock:v25];
  unint64_t v6 = [(EDSearchableIndex *)self currentMaximumBatchSize];
  [v3 appendString:@"==== Searchable Index State ====\n"];
  objc_msgSend(v3, "appendFormat:", @"  transaction:                    %lld\n", v64[3]);
  id v7 = NSStringFromBOOL();
  [v3 appendFormat:@"  active:                         %@ (rc=%lld)\n", v7, v60[3]];

  id v8 = NSStringFromBOOL();
  [v3 appendFormat:@"  persistenceAvailable:           %@\n", v8];

  uint64_t v9 = NSStringFromBOOL();
  [v3 appendFormat:@"  client state fetched:           %@\n", v9];

  id v10 = NSStringFromBOOL();
  [v3 appendFormat:@"  coalesce timer fired:           %@\n", v10];

  uint64_t v11 = NSStringFromBOOL();
  [v3 appendFormat:@"  scheduled processing:           %@\n", v11];

  uint64_t v12 = NSStringFromBOOL();
  [v3 appendFormat:@"  needs refresh:                  %@\n", v12];

  id v13 = NSStringFromBOOL();
  [v3 appendFormat:@"  scheduled refresh:              %@\n", v13];

  id v14 = NSStringFromBOOL();
  [v3 appendFormat:@"  needs verification:             %@\n", v14];

  int64_t v15 = NSStringFromBOOL();
  [v3 appendFormat:@"  scheduled verification:         %@\n", v15];

  objc_msgSend(v3, "appendFormat:", @"  indexing batch size:            %lu\n", v32[3]);
  objc_msgSend(v3, "appendFormat:", @"  data source batch size:         %lu\n", v27[3]);
  objc_msgSend(v3, "appendFormat:", @"  maximum batch size:             %lu\n", v6);
  uint64_t v16 = [(EDSearchableIndex *)self schedulableDelegate];
  uint64_t v17 = NSStringFromBOOL();
  [v3 appendFormat:@"  data source indexing permitted: %@\n", v17];

  [v16 hasAvailableIndexingBudgetForSearchableIndexSchedulable:self];
  id v18 = NSStringFromBOOL();
  [v3 appendFormat:@"  has available indexing budget:  %@\n", v18];

  [v16 budgetedTimeRemainingForSearchableIndexSchedulable:self];
  objc_msgSend(v3, "appendFormat:", @"  budgeted time remaining:        %.4fs\n", v19);
  objc_msgSend(v3, "appendFormat:", @"  budgeted item count remaining:  %ld\n", objc_msgSend(v16, "budgetedItemCountRemainingForSearchableIndexSchedulable:", self));
  uint64_t v20 = [(id)v54[5] count];
  objc_msgSend(v3, "appendFormat:", @"  pending items:                  %lu (%p)\n", v20, v54[5]);
  uint64_t v21 = [(id)v48[5] count];
  objc_msgSend(v3, "appendFormat:", @"  pre-processing items:           %lu (%p)\n", v21, v48[5]);
  uint64_t v22 = [(id)v42[5] count];
  objc_msgSend(v3, "appendFormat:", @"  pending removals:               %lu (%p)\n", v22, v42[5]);
  uint64_t v23 = [(id)v36[5] count];
  objc_msgSend(v3, "appendFormat:", @"  pending domain removals:        %lu (%p)\n", v23, v36[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v85, 8);
  return (NSString *)v3;
}

void __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 scheduledVerification];

  id v3 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 scheduledProcessing];

  objc_super v4 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 scheduledRefresh];

  uint64_t v5 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v5 isActive];

  unint64_t v6 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v6 persistenceAvailable];

  id v7 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v7 clientStateFetched];

  id v8 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v8 coalesceTimerFired];

  uint64_t v9 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v9 needsRefresh];

  id v10 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [v10 needsVerification];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 148);
  uint64_t v11 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = [v11 transaction];

  uint64_t v12 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = [v12 resumeCount];

  id v13 = [*(id *)(a1 + 32) state];
  id v14 = [v13 pendingItems];
  uint64_t v15 = [v14 copy];
  uint64_t v16 = *(void *)(*(void *)(a1 + 136) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  id v18 = [*(id *)(a1 + 32) state];
  uint64_t v19 = [v18 preprocessingItems];
  uint64_t v20 = [v19 copy];
  uint64_t v21 = *(void *)(*(void *)(a1 + 144) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  uint64_t v23 = [*(id *)(a1 + 32) state];
  id v24 = [v23 pendingIdentifierRemovals];
  uint64_t v25 = [v24 copy];
  uint64_t v26 = *(void *)(*(void *)(a1 + 152) + 8);
  uint64_t v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  uint64_t v28 = [*(id *)(a1 + 32) state];
  unint64_t v29 = [v28 pendingDomainRemovals];
  uint64_t v30 = [v29 copy];
  uint64_t v31 = *(void *)(*(void *)(a1 + 160) + 8);
  long long v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v30;

  *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 48);
}

uint64_t __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (void)_powerStateChanged
{
  if ([(EDSearchableIndex *)self isPluggedIn])
  {
    [(EDSearchableIndex *)self refresh];
  }
}

+ (id)_reindexReasonString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Batch Transaction Failed";
  }
  else {
    return off_1E6C05890[a3 - 1];
  }
}

- (void)_sendAnalyticsForReindexReason:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v8 = @"reason";
  objc_super v4 = [(id)objc_opt_class() _reindexReasonString:a3];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.searchableIndex.reindexAnalytics" collectionData:v5];
  id v7 = [(EDSearchableIndex *)self analyticsCollector];
  [v7 logOneTimeEvent:v6];
}

- (void)_storeLastKnownReindexReason:(int64_t)a3 withInfo:(id)a4
{
  id v15 = a4;
  id v5 = [NSString alloc];
  unint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [(id)objc_opt_class() _reindexReasonString:a3];
  id v8 = (void *)[v5 initWithFormat:@"%@: %@ %@", v6, v7, v15];

  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v11 = [v10 objectForKey:@"LastKnownReindexReasons"];
  uint64_t v12 = (void *)[v9 initWithArray:v11];

  if ((unint64_t)[v12 count] >= 0x32) {
    [v12 removeObjectAtIndex:0];
  }
  [v12 addObject:v8];
  id v13 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v14 = (void *)[v12 copy];
  [v13 setObject:v14 forKey:@"LastKnownReindexReasons"];
}

- (void)_registerStateCaptureHandler
{
  id v3 = MEMORY[0x1E4F14428];
  EFLogRegisterStateCaptureBlock();
  objc_super v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = v4;

  unint64_t v6 = (void *)MEMORY[0x1E4F14428];
}

id __49__EDSearchableIndex__registerStateCaptureHandler__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_log_t v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v2 = [v1 objectForKey:@"LastKnownReindexReasons"];
  [v0 setObject:v2 forKeyedSubscript:@"LastKnownReindexReasons"];

  id v3 = (void *)[v0 copy];

  return v3;
}

- (void)_collectAnalyticsForReindexReason:(int64_t)a3 withInfo:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(id)objc_opt_class() _reindexReasonString:a3];
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Collecting reindexing analytics for reason: %@, info: %@", (uint8_t *)&v9, 0x16u);
  }
  [(EDSearchableIndex *)self _sendAnalyticsForReindexReason:a3];
  [(EDSearchableIndex *)self _storeLastKnownReindexReason:a3 withInfo:v6];
}

- (void)_collectAnalyticsForReindexReason:(int64_t)a3
{
}

- (NSString)indexName
{
  return self->_indexName;
}

- (void)setDataSourceIndexingPermitted:(BOOL)a3
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke;
  v4[3] = &unk_1E6C05288;
  v4[4] = self;
  BOOL v5 = a3;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v4];
}

uint64_t __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 148) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 148) = v2;
    int v4 = *(unsigned __int8 *)(result + 40);
    BOOL v5 = *(void **)(result + 32);
    if (v4)
    {
      id v6 = [v5 state];
      int v7 = [v6 isActive];

      id v8 = *(void **)(v3 + 32);
      if (v7)
      {
        int v9 = [v8 state];
        [v9 setNeedsVerification:1];

        id v10 = *(void **)(v3 + 32);
        return [v10 _queueRefresh];
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke_2;
        v11[3] = &unk_1E6BFF2F0;
        v11[4] = v8;
        return [v8 _dataSourceScheduleWork:v11];
      }
    }
    else
    {
      return [v5 _queueTransitionFromRefresh:0];
    }
  }
  return result;
}

void __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke_2(uint64_t a1)
{
  int v2 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Finishing because indexing is disabled", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) schedulableDelegate];
  [v3 indexingDidFinishForSearchableIndexSchedulable:*(void *)(a1 + 32) backlogComplete:0];
}

- (void)_scheduleSpotlightVerification
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  uint64_t v3 = [(EDSearchableIndex *)self state];
  char v4 = [v3 scheduledVerification];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = [(EDSearchableIndex *)self state];
    [v5 setScheduledVerification:1];

    indexingScheduler = self->_indexingScheduler;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke;
    v7[3] = &unk_1E6BFF2F0;
    v7[4] = self;
    [(EFSuspendableScheduler *)indexingScheduler performBlock:v7];
  }
}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"LastVerificationFailureReportDate"];
  char v4 = objc_opt_new();
  BOOL v5 = v4;
  if (v3 && ([v4 timeIntervalSinceDate:v3], v6 < 604800.0))
  {
    int v7 = 1;
  }
  else
  {
    [v2 removeObjectForKey:@"LastVerificationFailureReportDate"];
    int v7 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_2;
  aBlock[3] = &unk_1E6C052F8;
  char v15 = v7;
  id v8 = v2;
  id v13 = v8;
  id v9 = v5;
  id v14 = v9;
  id v10 = _Block_copy(aBlock);
  if (v7) {
    __int16 v11 = 0;
  }
  else {
    __int16 v11 = v10;
  }
  [*(id *)(a1 + 32) _scheduleSpotlightVerificationOnIndexingQueueWithCompletion:v11];
  [*(id *)(a1 + 32) _clearOrphanedSearchableMessagesFromDatabase];
}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      if (v5) {
        [v5 addSuccessBlock:&__block_literal_global_175];
      }
      else {
        __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_3();
      }
    }
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:@"LastVerificationFailureReportDate"];
  }
}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_3()
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__34;
  id v10 = __Block_byref_object_dispose__34;
  id v11 = (id)0xAAAAAAAAAAAAAAAALL;
  id v11 = (id)[objc_alloc(MEMORY[0x1E4FA8AF0]) initWithQueue:0];
  id v0 = (void *)v7[5];
  uint64_t v1 = [MEMORY[0x1E4F28B50] mainBundle];
  int v2 = [v1 bundleIdentifier];
  uint64_t v3 = [v0 signatureWithDomain:@"Mail" type:@"Spotlight" subType:@"Verification Failed" subtypeContext:@"VerificationStateCorrupt" detectedProcess:v2 triggerThresholdValues:0];

  char v4 = (void *)v7[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_4;
  v5[3] = &unk_1E6C052D0;
  void v5[4] = &v6;
  [v4 snapshotWithSignature:v3 duration:0 events:0 payload:0 actions:v5 reply:0.0];

  _Block_object_dispose(&v6, 8);
}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA8C68]];
  if (!v4 || ((char v6 = [v4 BOOLValue], v5) ? (v7 = v6) : (v7 = 0), (v7 & 1) == 0))
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA8C58]];
    id v9 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_INFO, "Failed to get diagnostic signature with reason: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (void)_clearOrphanedSearchableMessagesFromDatabase
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__EDSearchableIndex__clearOrphanedSearchableMessagesFromDatabase__block_invoke;
  v2[3] = &unk_1E6BFF2F0;
  v2[4] = self;
  [(EDSearchableIndex *)self _dataSourceScheduleWork:v2];
}

void __65__EDSearchableIndex__clearOrphanedSearchableMessagesFromDatabase__block_invoke(uint64_t a1)
{
  int v2 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Checking messages.searchable_message for orphaned values", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) dataSource];
  [v3 clearOrphanedSearchableMessagesFromDatabase];
}

- (void)_scheduleSpotlightVerificationOnIndexingQueueWithCompletion:(id)a3
{
  id v4 = a3;
  [(EFSuspendableScheduler *)self->_indexingScheduler assertIsExecuting:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  char v6 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "verifying representative sample of items in the datasource are actually indexed", buf, 2u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke;
  v9[3] = &unk_1E6C05348;
  v9[4] = self;
  id v7 = v4;
  id v11 = v7;
  id v8 = v5;
  id v10 = v8;
  [(EDSearchableIndex *)self _processSpotlightVerificationWithCompletion:v9];
  [v8 lockWhenCondition:1];
  [v8 unlock];
  [(EDSearchableIndex *)self _transitionWithBudgetTimeUsed:0.0];
}

void __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2 == 2)
  {
    id v9 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "Spotlight found everything from the sample";
      goto LABEL_11;
    }
  }
  else
  {
    if (a2 == 1)
    {
      id v11 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_cold_1();
      }

      int v12 = *(void **)(a1 + 32);
      id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      uint64_t v14 = [v13 stringValue];
      [v12 _collectAnalyticsForReindexReason:0 withInfo:v14];

      char v15 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_184;
      v19[3] = &unk_1E6C05320;
      uint64_t v16 = v8;
      uint64_t v20 = v16;
      [v15 _promptToFileRadarAboutReindexing:v19];
      [*(id *)(a1 + 32) _handleFailingTransactionIDs:v16];
      id v9 = v20;
      goto LABEL_12;
    }
    if (a2) {
      goto LABEL_13;
    }
    id v9 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "Datasource couldn't verify or Mail didn't fetch any samples";
LABEL_11:
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
    }
  }
LABEL_12:

LABEL_13:
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, a2, v7);
  }
  [*(id *)(*(void *)(a1 + 32) + 32) assertIsExecuting:1];
  id v18 = [*(id *)(a1 + 32) state];
  [v18 setScheduledVerification:0];

  if (a2 == 1) {
    [*(id *)(a1 + 32) _scheduleSpotlightVerification];
  }
  [*(id *)(a1 + 40) lock];
  [*(id *)(a1 + 40) unlockWithCondition:1];
}

id __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_184(uint64_t a1)
{
  int v2 = NSString;
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v4 = [v2 stringWithFormat:@"Index verification failed for %@ transactions: %@", v3, *(void *)(a1 + 32)];

  return v4;
}

- (void)_registerDistantFutureSpotlightVerification
{
  if ([(EDSearchableIndex *)self enableSpotlightVerification])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64__EDSearchableIndex__registerDistantFutureSpotlightVerification__block_invoke_2;
    v4[3] = &unk_1E6C05370;
    objc_copyWeak(&v5, &location);
    id v3 = _Block_copy(v4);
    ef_xpc_activity_register();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __64__EDSearchableIndex__registerDistantFutureSpotlightVerification__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14218]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14310], 1);
}

void __64__EDSearchableIndex__registerDistantFutureSpotlightVerification__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _verifySpotlightIndex];
}

- (void)_verifySpotlightIndex
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__EDSearchableIndex__verifySpotlightIndex__block_invoke;
  v3[3] = &unk_1E6BFF2F0;
  v3[4] = self;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v3];
}

uint64_t __42__EDSearchableIndex__verifySpotlightIndex__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) state];
  [v2 setNeedsVerification:1];

  id v3 = *(void **)(a1 + 32);

  return [v3 _queueTransitionFromRefresh:0];
}

- (void)_handleFailingTransactionIDs:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[EDSearchableIndex _handleFailingTransactionIDs:]((uint64_t)v4, v7, [v4 count], v5);
  }

  char v6 = [v4 allObjects];
  [(EDSearchableIndex *)self _invalidateItemsInTransactions:v6];
}

- (void)setForeground:(BOOL)a3
{
  if (a3) {
    unint64_t v4 = 512;
  }
  else {
    unint64_t v4 = 64;
  }
  p_mainThreadAccessibleIvarLock = &self->_mainThreadAccessibleIvarLock;
  os_unfair_lock_lock(&self->_mainThreadAccessibleIvarLock);
  self->_unint64_t currentMaximumBatchSize = v4;

  os_unfair_lock_unlock(p_mainThreadAccessibleIvarLock);
}

- (void)applicationWillSuspend
{
}

- (void)applicationWillResume
{
}

+ (id)_localClientStateURL
{
  if (_localClientStateURL_onceToken != -1) {
    dispatch_once(&_localClientStateURL_onceToken, &__block_literal_global_194);
  }
  int v2 = (void *)_localClientStateURL_result;

  return v2;
}

void __41__EDSearchableIndex__localClientStateURL__block_invoke()
{
  id v0 = [MEMORY[0x1E4F60410] baseMailDirectory];
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = [v0 URLByAppendingPathComponent:@"SpotlightState.json"];
    int v2 = (void *)_localClientStateURL_result;
    _localClientStateURL_result = v1;

    id v0 = v3;
  }
}

+ (id)_localClientState
{
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    id v5 = [a1 _localClientStateURL];
    if (v5)
    {
      char v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:0];
      id v7 = +[EDSearchableIndexClientState clientStateFromData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __43__EDSearchableIndex__saveLocalClientState___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _localClientStateURL];
  id v2 = objc_alloc(MEMORY[0x1E4F60D48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EDSearchableIndex__saveLocalClientState___block_invoke_2;
  v6[3] = &unk_1E6C053C0;
  id v3 = v1;
  id v7 = v3;
  uint64_t v4 = [v2 initWithCoalescingAction:v6];
  id v5 = (void *)_saveLocalClientState__coalescer;
  _saveLocalClientState__coalescer = v4;
}

void __43__EDSearchableIndex__saveLocalClientState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 archiveRepresentation];
    [v4 writeToURL:*(void *)(a1 + 32) options:0x10000000 error:0];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
}

- (void)_fetchLastClientState
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Timed out while fetching client state", v2, v3, v4, v5, v6);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    if (!v5)
    {
      id v10 = [(id)objc_opt_class() _localClientState];
      if (v10)
      {
        id v11 = +[EDSearchableIndex log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_2((uint64_t)v10, v11);
        }

        [(id)objc_opt_class() _saveLocalClientState:0];
      }
    }
    int v12 = +[EDSearchableIndexClientState clientStateFromData:v5];
    id v13 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = &stru_1F3583658;
      *(_DWORD *)buf = 138412802;
      id v36 = v12;
      __int16 v37 = 2112;
      if (!v5) {
        uint64_t v14 = @" (new)";
      }
      __int16 v38 = v14;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "last client state: %@%@ data:%@", buf, 0x20u);
    }

    if (!v12 || ![v12 transaction])
    {
      char v15 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [v12 transaction];
        __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_1((uint64_t)v12, (uint64_t)buf);
      }

      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "transaction"));
      id v18 = [v17 stringValue];
      [v16 _collectAnalyticsForReindexReason:1 withInfo:v18];
    }
    uint64_t v19 = [*(id *)(a1 + 32) state];
    if ([v19 transaction])
    {
      uint64_t v20 = [*(id *)(a1 + 32) state];
      uint64_t v21 = [v20 transaction];
      LOBYTE(v21) = v21 == [v12 transaction];

      if (v21)
      {
LABEL_25:
        uint64_t v26 = [v12 transaction];
        uint64_t v27 = [*(id *)(a1 + 32) state];
        [v27 setTransaction:v26];

        uint64_t v28 = [*(id *)(a1 + 32) state];
        [v28 setClientStateFetched:1];

        unint64_t v29 = *(void **)(a1 + 32);
        uint64_t v30 = [v12 transaction];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __42__EDSearchableIndex__fetchLastClientState__block_invoke_2;
        v32[3] = &unk_1E6BFF2F0;
        v32[4] = *(void *)(a1 + 32);
        [v29 _dataSourceInvalidateItemsGreaterThanTransaction:v30 completion:v32];

        goto LABEL_26;
      }
      uint64_t v22 = *(void **)(a1 + 32);
      uint64_t v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "transaction"));
      id v24 = [v23 stringValue];
      [v22 _collectAnalyticsForReindexReason:1 withInfo:v24];

      uint64_t v25 = *(void **)(a1 + 32);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __42__EDSearchableIndex__fetchLastClientState__block_invoke_210;
      v33[3] = &unk_1E6C05320;
      id v34 = v12;
      [v25 _promptToFileRadarAboutReindexing:v33];
      uint64_t v19 = v34;
    }

    goto LABEL_25;
  }
  uint64_t v8 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v7, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_3();
  }

  id v9 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __42__EDSearchableIndex__fetchLastClientState__block_invoke_214;
  v31[3] = &unk_1E6BFF2F0;
  v31[4] = v9;
  [v9 _dataSourceScheduleWork:v31];
LABEL_26:
}

id __42__EDSearchableIndex__fetchLastClientState__block_invoke_210(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "transaction"));
  uint64_t v3 = [v1 stringWithFormat:@"Invalidated items greater than transaction: %@", v2];

  return v3;
}

uint64_t __42__EDSearchableIndex__fetchLastClientState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) refresh];
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_214(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulableDelegate];
  [v2 indexingDidFinishForSearchableIndexSchedulable:*(void *)(a1 + 32) backlogComplete:0];
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_2_216(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) tryLockWhenCondition:0])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) unlockWithCondition:1];
  }
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_217(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulableDelegate];
  [v2 indexingDidFinishForSearchableIndexSchedulable:*(void *)(a1 + 32) backlogComplete:0];
}

- (void)_noteNeedsLastClientStateFetch
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:0];
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__EDSearchableIndex__noteNeedsLastClientStateFetch__block_invoke;
  v4[3] = &unk_1E6BFF2F0;
  void v4[4] = self;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v4];
}

void __51__EDSearchableIndex__noteNeedsLastClientStateFetch__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) state];
  [v1 setClientStateFetched:0];
}

- (int64_t)_transaction
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__EDSearchableIndex__transaction__block_invoke;
  v5[3] = &unk_1E6C00A68;
  void v5[4] = self;
  void v5[5] = &v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__EDSearchableIndex__transaction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 transaction];
}

- (id)_eventDataForTransitionState:(id)a3
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  v21[0] = v19;
  v20[0] = @"state";
  v20[1] = @"resumeCount";
  uint64_t v4 = NSNumber;
  id v5 = [(EDSearchableIndex *)self state];
  uint64_t v6 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "resumeCount"));
  v21[1] = v6;
  v20[2] = @"pending";
  id v7 = NSNumber;
  uint64_t v8 = [(EDSearchableIndex *)self state];
  unint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "countOfItemsInPendingQueues"));
  v21[2] = v9;
  v20[3] = @"preprocessingItemCount";
  id v10 = NSNumber;
  id v11 = [(EDSearchableIndex *)self state];
  int v12 = [v11 preprocessingItems];
  id v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v21[3] = v13;
  v20[4] = @"persistenceAvailable";
  uint64_t v14 = NSNumber;
  char v15 = [(EDSearchableIndex *)self state];
  uint64_t v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "persistenceAvailable"));
  v21[4] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];

  return v17;
}

- (void)_suspend
{
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  id v8 = [(EDSearchableIndex *)self state];
  uint64_t v3 = [v8 suspend];

  uint64_t v4 = @"still resumed";
  if (v3 < 0) {
    uint64_t v4 = @"already suspended";
  }
  if (!v3) {
    uint64_t v4 = @"suspending";
  }
  unint64_t v9 = v4;
  id v5 = [(EDSearchableIndex *)self schedulableDelegate];
  uint64_t v6 = [(EDSearchableIndex *)self _eventDataForTransitionState:v9];
  [v5 searchableIndexSchedulable:self didGenerateImportantPowerEventWithIdentifier:@"suspend" eventData:v6];

  if (!v3)
  {
    [v5 indexingDidSuspendForSearchableIndexSchedulable:self];
    id v7 = [(EDSearchableIndex *)self state];
    [v7 setIsActive:0];

    if ((_os_feature_enabled_impl() & 1) == 0) {
      [(EDSearchableIndex *)self _suspendIndexingScheduler];
    }
    [(EDSearchableIndex *)self _queueTransitionFromRefresh:0];
  }
}

- (void)suspend
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__EDSearchableIndex_suspend__block_invoke;
  v3[3] = &unk_1E6BFF2F0;
  v3[4] = self;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v3];
}

uint64_t __28__EDSearchableIndex_suspend__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suspend];
}

- (void)_resume
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  uint64_t v3 = [(EDSearchableIndex *)self state];
  uint64_t v4 = [v3 resume];

  id v5 = @"still suspended";
  if (v4 > 1) {
    id v5 = @"already resumed";
  }
  if (v4 == 1) {
    id v5 = @"resuming";
  }
  uint64_t v6 = v5;
  id v7 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [(EDSearchableIndex *)self state];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = [v11 resumeCount];
    _os_log_debug_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEBUG, "-[EDSearchableIndex resume]: %@ (%lld)", (uint8_t *)&v12, 0x16u);
  }
  id v8 = [(EDSearchableIndex *)self schedulableDelegate];
  unint64_t v9 = [(EDSearchableIndex *)self _eventDataForTransitionState:v6];
  [v8 searchableIndexSchedulable:self didGenerateImportantPowerEventWithIdentifier:@"resume" eventData:v9];

  if (v4 == 1)
  {
    [v8 indexingDidResumeForSearchableIndexSchedulable:self];
    id v10 = [(EDSearchableIndex *)self state];
    [v10 setIsActive:1];

    if ((_os_feature_enabled_impl() & 1) == 0) {
      [(EDSearchableIndex *)self _resumeIndexingScheduler];
    }
    [(EDSearchableIndex *)self _queueTransitionFromRefresh:0];
  }
}

- (void)resume
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__EDSearchableIndex_resume__block_invoke;
  v3[3] = &unk_1E6BFF2F0;
  v3[4] = self;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v3];
}

uint64_t __27__EDSearchableIndex_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resume];
}

- (void)setPersistenceAvailable:(BOOL)a3
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EDSearchableIndex_setPersistenceAvailable___block_invoke;
  v4[3] = &unk_1E6C05288;
  void v4[4] = self;
  BOOL v5 = a3;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v4];
}

void __45__EDSearchableIndex_setPersistenceAvailable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  int v3 = [v2 persistenceAvailable];
  int v4 = *(unsigned __int8 *)(a1 + 40);

  if (v4 != v3)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) state];
    [v6 setPersistenceAvailable:v5];

    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      id v8 = [*(id *)(a1 + 32) searchIndex];
      [v8 setIndexDelegate:v7];

      [*(id *)(a1 + 32) _resume];
      unint64_t v9 = *(void **)(a1 + 32);
      [v9 _queueRefresh];
    }
    else
    {
      id v10 = *(void **)(a1 + 32);
      [v10 _suspend];
    }
  }
}

- (BOOL)isPersistenceAvailable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__EDSearchableIndex_isPersistenceAvailable__block_invoke;
  v5[3] = &unk_1E6C00A68;
  void v5[4] = self;
  void v5[5] = &v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__EDSearchableIndex_isPersistenceAvailable__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 persistenceAvailable];
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__EDSearchableIndex_isActive__block_invoke;
  v5[3] = &unk_1E6C00A68;
  void v5[4] = self;
  void v5[5] = &v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__EDSearchableIndex_isActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isActive];
}

- (int64_t)resumeCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__EDSearchableIndex_resumeCount__block_invoke;
  v5[3] = &unk_1E6C00A68;
  void v5[4] = self;
  void v5[5] = &v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __32__EDSearchableIndex_resumeCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 resumeCount];
}

- (BOOL)isIndexingDisabledForPPT
{
  id v2 = self;
  p_indexingDisabledForPPTLock = &self->_indexingDisabledForPPTLock;
  os_unfair_lock_lock(&self->_indexingDisabledForPPTLock);
  LOBYTE(v2) = v2->_indexingDisabledForPPT;
  os_unfair_lock_unlock(p_indexingDisabledForPPTLock);
  return (char)v2;
}

- (void)setIndexingDisabledForPPT:(BOOL)a3
{
  p_indexingDisabledForPPTLock = &self->_indexingDisabledForPPTLock;
  os_unfair_lock_lock(&self->_indexingDisabledForPPTLock);
  self->_indexingDisabledForPPT = a3;

  os_unfair_lock_unlock(p_indexingDisabledForPPTLock);
}

- (BOOL)clientStateFetched
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EDSearchableIndex_clientStateFetched__block_invoke;
  v5[3] = &unk_1E6C00A68;
  void v5[4] = self;
  void v5[5] = &v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__EDSearchableIndex_clientStateFetched__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 clientStateFetched];
}

- (void)setClientStateFetched:(BOOL)a3
{
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__EDSearchableIndex_setClientStateFetched___block_invoke;
  v4[3] = &unk_1E6C05288;
  void v4[4] = self;
  BOOL v5 = a3;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v4];
}

void __43__EDSearchableIndex_setClientStateFetched___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) state];
  [v2 setClientStateFetched:v1];
}

- (void)_dataSourceAssignTransaction:(int64_t)a3 forIdentifiers:(id)a4 completion:(id)a5
{
  id v10 = a5;
  uint64_t v8 = objc_msgSend(a4, "ef_map:", &__block_literal_global_260);
  char v9 = [[EDSearchableIndexUpdates alloc] initWithIndexedItems:v8];
  [(EDSearchableIndex *)self _dataSourceAssignTransaction:a3 updates:v9 completion:v10];
}

EDSearchableIndexItem *__76__EDSearchableIndex__dataSourceAssignTransaction_forIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [[EDSearchableIndexItem alloc] initWithIdentifier:v2];

  return v3;
}

- (void)_dataSourceInvalidateItemsGreaterThanTransaction:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__EDSearchableIndex__dataSourceInvalidateItemsGreaterThanTransaction_completion___block_invoke;
  v8[3] = &unk_1E6C044A8;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(EDSearchableIndex *)self _dataSourceScheduleWork:v8];
}

uint64_t __81__EDSearchableIndex__dataSourceInvalidateItemsGreaterThanTransaction_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSource];
  [v2 searchableIndex:*(void *)(a1 + 32) invalidateItemsGreaterThanTransaction:*(void *)(a1 + 48)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_280(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) state];
  [v1 didCompleteBacklog];
}

uint64_t __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  if (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 0.0) {
    objc_msgSend(*(id *)(a1 + 32), "_queueConsumeBudgetElapsedPeriod:");
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_dataSourceVerifyRepresentativeSampleWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__EDSearchableIndex__dataSourceVerifyRepresentativeSampleWithCompletion___block_invoke;
    v6[3] = &unk_1E6BFFBC8;
    void v6[4] = self;
    id v7 = v4;
    [(EDSearchableIndex *)self _dataSourceScheduleWork:v6];
  }
}

void __73__EDSearchableIndex__dataSourceVerifyRepresentativeSampleWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [[EDSearchableIndexVerifier alloc] initWithDataSource:*(void *)(a1 + 32)];
  [(EDSearchableIndexVerifier *)v2 verifyDataSamplesWithCompletionHandler:*(void *)(a1 + 40) scheduler:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)_dataSourcePrepareToIndexItems:(id)a3 fromRefresh:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = v9;
  if (v6)
  {
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke;
    aBlock[3] = &unk_1E6C01BF0;
    void aBlock[4] = self;
    id v13 = v8;
    id v14 = v10;
    id v11 = _Block_copy(aBlock);
    [(EDSearchableIndex *)self _dataSourceScheduleWork:v11];
  }
}

void __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v1 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v2 = [*(id *)(a1 + 32) signpostID];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v1, OS_SIGNPOST_INTERVAL_BEGIN, v2, "EDSearchableIndexDataSourcePrepare", "", buf, 2u);
  }

  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v3)
  {
    uint64_t v37 = *(void *)v53;
    *(void *)&long long v4 = 138413058;
    long long v33 = v4;
    do
    {
      uint64_t v38 = v3;
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "indexingType", v33);
        if (+[EDSearchableIndex isIncrementalIndexingType:](EDSearchableIndex, "isIncrementalIndexingType:", v7)&& ([*(id *)(a1 + 32) dataSource], id v8 = objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "indexingTypeForSearchableIndex:item:", *(void *)(a1 + 32), v6), v8, v9 != v7))
        {
          *(void *)buf = 0;
          uint64_t v47 = buf;
          uint64_t v48 = 0x3032000000;
          uint64_t v49 = __Block_byref_object_copy__34;
          id v50 = __Block_byref_object_dispose__34;
          id v51 = 0;
          uint64_t v10 = *(void *)(a1 + 32);
          id v11 = *(void **)(v10 + 32);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_283;
          v45[3] = &unk_1E6C00A68;
          v45[4] = v10;
          v45[5] = buf;
          [v11 performSyncBlock:v45];
          __int16 v39 = [v6 identifier];
          if (objc_msgSend(*((id *)v47 + 5), "containsObject:"))
          {
            uint64_t v9 = v7;
          }
          else
          {
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            int v12 = *(id *)(a1 + 40);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v64 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v42;
              while (2)
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v42 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                  if (v16 != v6
                    && !+[EDSearchableIndex isIncrementalIndexingType:](EDSearchableIndex, "isIncrementalIndexingType:", [*(id *)(*((void *)&v41 + 1) + 8 * j) indexingType]))
                  {
                    uint64_t v17 = [v16 identifier];
                    char v18 = [v17 isEqualToString:v39];

                    if (v18)
                    {
                      uint64_t v9 = v7;
                      goto LABEL_30;
                    }
                  }
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v64 count:16];
                if (v13) {
                  continue;
                }
                break;
              }
            }

            if (v9 == 5)
            {
              uint64_t v27 = +[EDSearchableIndex log];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v28 = [v6 identifier];
                *(_DWORD *)uint64_t v56 = 138412802;
                uint64_t v57 = v6;
                __int16 v58 = 2114;
                uint64_t v59 = v28;
                __int16 v60 = 2048;
                uint64_t v61 = v7;
                _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "Changing indexingType for item %@ identifier: %{public}@ from %ld using setNeedsAllAttributesIncludingDataDetectionResultsIndexingType", v56, 0x20u);
              }
              [v6 setNeedsAllAttributesIncludingDataDetectionResultsIndexingType];
              uint64_t v9 = 5;
            }
            else if (v9)
            {
              [v6 setIndexingType:v9];
              int v12 = +[EDSearchableIndex log];
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                unint64_t v29 = [v6 identifier];
                *(_DWORD *)uint64_t v56 = v33;
                uint64_t v57 = v6;
                __int16 v58 = 2114;
                uint64_t v59 = v29;
                __int16 v60 = 2048;
                uint64_t v61 = v7;
                __int16 v62 = 2048;
                uint64_t v63 = v9;
                _os_log_error_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_ERROR, "Unexpected changing of indexingType for item %@ identifier: %{public}@ from %ld to %ld", v56, 0x2Au);
              }
LABEL_30:
            }
            else
            {
              id v19 = +[EDSearchableIndex log];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = [v6 identifier];
                *(_DWORD *)uint64_t v56 = 138412802;
                uint64_t v57 = v6;
                __int16 v58 = 2114;
                uint64_t v59 = v20;
                __int16 v60 = 2048;
                uint64_t v61 = v7;
                _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Changing indexingType for item %@ identifier: %{public}@ from %ld using setNeedsAllAttributesIndexingType", v56, 0x20u);
              }
              [v6 setNeedsAllAttributesIndexingType];
              uint64_t v9 = 0;
            }
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          uint64_t v9 = v7;
        }
        if (v9 != 3 && v9 != 6)
        {
          uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "indexingType"));
          uint64_t v23 = [v34 objectForKeyedSubscript:v22];

          if (!v23)
          {
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "indexingType"));
            [v34 setObject:v24 forKeyedSubscript:v25];

            uint64_t v23 = v24;
          }
          uint64_t v26 = [v6 identifier];
          [v23 addObject:v26];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v3);
  }

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_284;
  v40[3] = &unk_1E6C054A8;
  v40[4] = *(void *)(a1 + 32);
  [v34 enumerateKeysAndObjectsUsingBlock:v40];
  uint64_t v30 = *(void *)(a1 + 48);
  if (v30) {
    (*(void (**)(void))(v30 + 16))();
  }
  uint64_t v31 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v32 = [*(id *)(a1 + 32) signpostID];
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v31, OS_SIGNPOST_INTERVAL_END, v32, "EDSearchableIndexDataSourcePrepare", "", buf, 2u);
  }
}

void __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_283(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) state];
  uint64_t v2 = [v5 pendingIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  BOOL v6 = [*(id *)(a1 + 32) dataSource];
  objc_msgSend(v6, "searchableIndex:assignIndexingType:forIdentifiers:", *(void *)(a1 + 32), objc_msgSend(v7, "integerValue"), v5);
}

- (id)bundleIDForSearchableIndexVerifier:(id)a3
{
  uint64_t v3 = [(EDSearchableIndex *)self searchableIndexBundleID];

  return v3;
}

- (id)dataSamplesForSearchableIndexVerifier:(id)a3 searchableIndex:(id)a4 count:(unint64_t)a5 lastVerifiedMessageID:(int64_t)a6
{
  id v9 = a4;
  uint64_t v10 = [(EDSearchableIndex *)self dataSource];
  id v11 = [v10 verificationDataSamplesForSearchableIndex:v9 count:a5 lastVerifiedMessageID:a6];

  return v11;
}

- (id)knownTransactionIDsForSearchableIndexVerifier:(id)a3
{
  long long v4 = [(EDSearchableIndex *)self dataSource];
  id v5 = [v4 distinctTransactionIDsForSearchableIndex:self];

  return v5;
}

- (void)_startCoalescingTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  if (!self->_coalescingTimer)
  {
    uint64_t v3 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double coalescingDelaySeconds = self->_coalescingDelaySeconds;
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = coalescingDelaySeconds;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "starting coalescing timer (t=%fs)", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    stateTransitionScheduler = self->_stateTransitionScheduler;
    double v6 = self->_coalescingDelaySeconds;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __42__EDSearchableIndex__startCoalescingTimer__block_invoke;
    v9[3] = &unk_1E6C00E78;
    objc_copyWeak(&v10, (id *)buf);
    id v7 = [(EFAssertableScheduler *)stateTransitionScheduler afterDelay:v9 performBlock:v6];
    coalescingTimer = self->_coalescingTimer;
    self->_coalescingTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_queueConsumeBudgetItemCount:(unint64_t)a3 lastItemDateReceived:(id)a4
{
  id v7 = a4;
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  double v6 = [(EDSearchableIndex *)self schedulableDelegate];
  [v6 searchableIndexSchedulable:self didIndexItemCount:a3 lastItemDateReceived:v7];
}

- (void)_resumeIndexingScheduler
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_5(&dword_1DB39C000, v0, v1, "resuming indexing scheduler", v2, v3, v4, v5, v6);
}

- (void)_logSignpostForIndexingBatchAssignedDomainRemovalCount:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[EDSearchableIndex signpostLog];
  os_signpost_id_t v6 = [(EDSearchableIndex *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    unint64_t v8 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_EVENT, v6, "EDSearchableIndexBatchProcessing", "BatchAssignedDomnainRemovalCount=%{signpost.description:attribute,public}llu", (uint8_t *)&v7, 0xCu);
  }
}

id __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_304(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = [*(id *)(a1 + 32) count];
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transaction];
    uint64_t v14 = objc_msgSend(v3, "ef_publicDescription");
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = v12;
    __int16 v26 = 2048;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    unint64_t v29 = v14;
    _os_log_error_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_ERROR, "Spotlight failed to index %ld items (transaction=%lld) failed with error: %{public}@", buf, 0x20u);
  }
  uint64_t v5 = [(id)objc_opt_class() indexWhileLockedLog];
  if (v5 && (EFProtectedDataAvailable() & 1) == 0)
  {
    os_signpost_id_t v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [*(id *)(a1 + 32) count];
      uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transaction];
      uint64_t v17 = objc_msgSend(v3, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      unint64_t v29 = v17;
      _os_log_error_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_ERROR, "Spotlight failed to index %ld items (transaction=%lld) failed with error: %{public}@", buf, 0x20u);
    }
  }

  [*(id *)(a1 + 40) _noteNeedsLastClientStateFetch];
  int v7 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_305;
  uint64_t v21 = &unk_1E6BFFAF0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v22 = v8;
  uint64_t v23 = v9;
  [v7 performSyncBlock:&v18];
  id v10 = objc_msgSend(MEMORY[0x1E4F60D70], "futureWithError:", v3, v18, v19, v20, v21);

  return v10;
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_305(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_INFO, "Clearing %lu items from processingItems due to indexing failure", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) state];
  [v4 failedToIndexItems:*(void *)(a1 + 32)];
}

void __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) assertIsExecuting:1];
  id v2 = [*(id *)(a1 + 32) state];
  [v2 setScheduledRefresh:0];
}

- (void)beginUpdatesAffectingDataSourceAndIndex
{
}

- (void)endUpdatesAffectingDataSourceAndIndex
{
}

void __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) assertIsExecuting:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) state];
  [v2 setNeedsRefresh:0];
}

- (void)_processSpotlightVerificationWithCompletion:(id)a3
{
  id v4 = a3;
  [(EFSuspendableScheduler *)self->_indexingScheduler assertIsExecuting:1];
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__EDSearchableIndex__processSpotlightVerificationWithCompletion___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v7];
}

uint64_t __65__EDSearchableIndex__processSpotlightVerificationWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  int v3 = [v2 needsVerification];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) state];
    [v4 setNeedsVerification:0];

    int v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v5 _dataSourceVerifyRepresentativeSampleWithCompletion:v6];
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "spotlight requests to reindex items with identifiers %@", buf, 0xCu);
  }

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  uint64_t v13 = [v12 stringValue];
  [(EDSearchableIndex *)self _collectAnalyticsForReindexReason:2 withInfo:v13];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
  v23[3] = &unk_1E6C05320;
  id v14 = v9;
  id v24 = v14;
  [(EDSearchableIndex *)self _promptToFileRadarAboutReindexing:v23];
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2;
  v19[3] = &unk_1E6C03B20;
  void v19[4] = self;
  id v16 = v14;
  id v20 = v16;
  id v17 = v10;
  id v22 = v17;
  id v18 = v8;
  id v21 = v18;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v19];
}

id __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1)
{
  id v2 = NSString;
  int v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v4 = [v2 stringWithFormat:@"Spotlight requested that Mail reindex %@ items: %@", v3, *(void *)(a1 + 32)];

  return v4;
}

void __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  [v2 setClientStateFetched:0];

  int v3 = [*(id *)(a1 + 32) _missingIdentifiersForIdentifiersNeedingReindex:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_3;
  v7[3] = &unk_1E6C05720;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 48);
  [v3 onScheduler:v4 addSuccessBlock:v7];
}

void __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_4;
  id v9 = &unk_1E6C056F8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  id v5 = (void (**)(void *, void))_Block_copy(&v6);
  if (objc_msgSend(v3, "count", v6, v7, v8, v9)) {
    [*(id *)(a1 + 40) deleteSearchableItemsWithIdentifiers:v3 completionHandler:v5];
  }
  else {
    v5[2](v5, 0);
  }
}

uint64_t __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 refresh];
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[EDSearchableIndex searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:]();
  }

  [(EDSearchableIndex *)self _collectAnalyticsForReindexReason:3];
  [(EDSearchableIndex *)self _promptToFileRadarAboutReindexing:&__block_literal_global_341];
  [(EDSearchableIndex *)self redonateAllItemsWithAcknowledgementHandler:v5];
}

__CFString *__89__EDSearchableIndex_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke()
{
  return @"Spotlight requested that Mail reindex all items.";
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  char v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "spotlight updated items with summaries: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    [(EDSearchableIndex *)self generatedSummariesDidUpdate:v6];
  }
}

- (id)_missingIdentifiersForIdentifiersNeedingReindex:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F60E18] promise];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __69__EDSearchableIndex__missingIdentifiersForIdentifiersNeedingReindex___block_invoke;
  v9[3] = &unk_1E6C01E58;
  id v6 = v5;
  id v10 = v6;
  [(EDSearchableIndex *)self _dataSourceAssignTransaction:0 forIdentifiers:v4 completion:v9];
  uint64_t v7 = [v6 future];

  return v7;
}

uint64_t __69__EDSearchableIndex__missingIdentifiersForIdentifiersNeedingReindex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (void)_invalidateItemsInTransactions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke;
  v6[3] = &unk_1E6BFFAF0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EDSearchableIndex *)self _dataSourceScheduleWork:v6];
}

void __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) dataSource];
  id v4 = [v3 searchableIndex:*v2 invalidateItemsInTransactions:*(void *)(a1 + 40)];

  id v5 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v9 = [v4 count];
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Deleting %lu items from Spotlight index: %{public}@", buf, 0x16u);
  }

  id v6 = [*(id *)(a1 + 32) searchIndex];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke_345;
  v7[3] = &unk_1E6C01E80;
  v7[4] = *(void *)(a1 + 32);
  [v6 deleteSearchableItemsWithIdentifiers:v4 completionHandler:v7];
}

uint64_t __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke_345(uint64_t a1)
{
  return [*(id *)(a1 + 32) refresh];
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(EDSearchableIndex *)self searchIndex];
  [(EDSearchableIndex *)self searchableIndex:v7 reindexSearchableItemsWithIdentifiers:v8 acknowledgementHandler:v6];
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  id v5 = a3;
  id v4 = [(EDSearchableIndex *)self searchIndex];
  [(EDSearchableIndex *)self searchableIndex:v4 reindexAllSearchableItemsWithAcknowledgementHandler:v5];
}

- (void)generatedSummariesDidUpdate:(id)a3
{
  id v5 = a3;
  id v4 = [(EDSearchableIndex *)self dataSource];
  [v4 searchableIndex:self indexGeneratedSummaries:v5];
}

- (void)redonateAllItemsWithAcknowledgementHandler:(id)a3
{
  id v4 = a3;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v7];
}

void __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke(uint64_t a1)
{
  id v2 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Redonating All Items", buf, 2u);
  }

  [*(id *)(a1 + 32) _suspendIndexingScheduler];
  id v3 = [*(id *)(a1 + 32) state];
  [v3 startReindex];

  [(id)objc_opt_class() _saveLocalClientState:0];
  id v4 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating all items", buf, 2u);
  }

  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke_346;
  v6[3] = &unk_1E6BFFBC8;
  void v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  [v5 _dataSourceInvalidateItemsGreaterThanTransaction:0 completion:v6];
}

uint64_t __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke_346(uint64_t a1)
{
  [*(id *)(a1 + 32) _resumeIndexingScheduler];
  if (*(void *)(a1 + 40))
  {
    id v2 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Invoking acknowledgement handler", v4, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return [*(id *)(a1 + 32) refresh];
}

- (void)resetIndexForNewLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v7];
}

void __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _suspendIndexingScheduler];
  id v2 = [*(id *)(a1 + 32) state];
  [v2 startReindex];

  [(id)objc_opt_class() _saveLocalClientState:0];
  id v3 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all items from Spotlight", buf, 2u);
  }

  id v4 = [*(id *)(a1 + 32) searchIndex];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_347;
  v6[3] = &unk_1E6C01C80;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 deleteAllSearchableItemsWithCompletionHandler:v6];
}

void __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_347(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_347_cold_1();
    }
  }
  [*(id *)(a1 + 32) _resumeIndexingScheduler];
  if (*(void *)(a1 + 40))
  {
    id v5 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Invoking completion handler", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)indexItems:(id)a3
{
}

- (void)indexItems:(id)a3 immediately:(BOOL)a4
{
}

- (void)indexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5
{
  id v8 = a3;
  if ([(EDSearchableIndex *)self isIndexingDisabledForPPT])
  {
    uint64_t v9 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EDSearchableIndex indexItems:fromRefresh:immediately:]();
    }
  }
  else if ([v8 count])
  {
    addIndexItemsScheduler = self->_addIndexItemsScheduler;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__EDSearchableIndex_indexItems_fromRefresh_immediately___block_invoke;
    v11[3] = &unk_1E6C05768;
    v11[4] = self;
    id v12 = v8;
    BOOL v13 = a4;
    BOOL v14 = a5;
    [(EFStoppableScheduler *)addIndexItemsScheduler performBlock:v11];
  }
}

uint64_t __56__EDSearchableIndex_indexItems_fromRefresh_immediately___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _indexItems:*(void *)(a1 + 40) fromRefresh:*(unsigned __int8 *)(a1 + 48) immediately:*(unsigned __int8 *)(a1 + 49)];
}

- (void)_indexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count])
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__34;
    id v26 = __Block_byref_object_dispose__34;
    id v27 = 0;
    uint64_t v9 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = [(EDSearchableIndex *)self _identifiersStringForItems:v8 maxLength:150];
      *(_DWORD *)buf = 134218754;
      id v29 = v8;
      __int16 v30 = 2114;
      uint64_t v31 = v14;
      __int16 v32 = 1024;
      BOOL v33 = v6;
      __int16 v34 = 1024;
      BOOL v35 = v5;
      _os_log_debug_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEBUG, "%p indexItems:%{public}@ fromRefresh:%{BOOL}d i:%{BOOL}d", buf, 0x22u);
    }
    stateTransitionScheduler = self->_stateTransitionScheduler;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke;
    v19[3] = &unk_1E6C00A40;
    id v21 = &v22;
    void v19[4] = self;
    id v11 = v8;
    id v20 = v11;
    [(EFAssertableScheduler *)stateTransitionScheduler performSyncBlock:v19];
    if ([(id)v23[5] count])
    {
      id v12 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        [(EDSearchableIndex *)self _identifiersStringForItems:v23[5] maxLength:150];
        objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndex _indexItems:fromRefresh:immediately:]();
      }

      uint64_t v13 = [v11 arrayByExcludingObjectsInArray:v23[5]];

      id v11 = (id)v13;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_348;
    v15[3] = &unk_1E6C05768;
    v15[4] = self;
    id v8 = v11;
    id v16 = v8;
    BOOL v17 = v6;
    BOOL v18 = v5;
    [(EDSearchableIndex *)self _dataSourcePrepareToIndexItems:v8 fromRefresh:v6 withCompletion:v15];

    _Block_object_dispose(&v22, 8);
  }
}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) state];
  uint64_t v2 = [v5 prepareToIndexItems:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_348(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_2;
  v5[3] = &unk_1E6C05768;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  __int16 v8 = *(_WORD *)(a1 + 48);
  [v2 performBlock:v5];
}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3;
  v10[3] = &unk_1E6C05790;
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  uint64_t v2 = objc_msgSend((id)v9.i64[0], "ef_compactMap:", v10);
  id v3 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) _identifiersStringForItems:v5 maxLength:150];
    int v7 = *(unsigned __int8 *)(a1 + 48);
    int v8 = *(unsigned __int8 *)(a1 + 49);
    *(_DWORD *)buf = 134218754;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    int v19 = v8;
    _os_log_debug_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEBUG, "%p prepared indexItems:%{public}@ fromRefresh:%{BOOL}d i:%{BOOL}d", buf, 0x22u);
  }
  [*(id *)(a1 + 40) _doIndexItems:v2 fromRefresh:*(unsigned __int8 *)(a1 + 48) immediately:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v4 = [*(id *)(a1 + 40) state];
  [v4 didPrepareItems:*(void *)(a1 + 32)];
}

EDSearchableIndexPendingItem *__57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) state];
  uint64_t v5 = [v4 preparingItems];
  int v6 = [v5 containsObject:v3];

  if (v6)
  {
    int v7 = [[EDSearchableIndexPendingItem alloc] initWithItem:v3];
  }
  else
  {
    int v8 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = [v3 identifier];
      __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3_cold_1(v9, v10, v12, v8);
    }

    int v7 = 0;
  }

  return v7;
}

- (void)_doIndexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v49 = a4;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  [(EFAssertableScheduler *)self->_stateTransitionScheduler assertIsExecuting:1];
  int v7 = [(EDSearchableIndex *)self state];
  if ([v7 isActive])
  {

LABEL_4:
    if (v5)
    {
      uint64_t v9 = [(EDSearchableIndex *)self state];
      [v9 setIndexImmediately:1];
    }
    __int16 v10 = [(EDSearchableIndex *)self state];
    int8x16_t v11 = [v10 pendingItems];
    uint64_t v12 = [v11 count];

    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v44 = v12;
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = v46;
    uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v81 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v60 != v14) {
            objc_enumerationMutation(obj);
          }
          __int16 v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          int v17 = objc_msgSend(v16, "identifier", v44);
          __int16 v18 = [(EDSearchableIndex *)self state];
          int v19 = [v18 pendingIdentifierRemovals];
          uint64_t v20 = [v19 identifiers];
          int v21 = [v20 containsObject:v17];

          if (v21)
          {
            uint64_t v22 = +[EDSearchableIndex log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v64 = (uint64_t)v17;
              _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Skipping index of %{public}@ identifier because it is present in self.state.pendingIdentifierRemovals", buf, 0xCu);
            }
LABEL_19:
          }
          else
          {
            uint64_t v23 = [(EDSearchableIndex *)self state];
            uint64_t v24 = [v23 indexItem:v16];

            switch(v24)
            {
              case 0:
                uint64_t v25 = [v16 items];
                id v26 = (void *)[v25 copy];

                preprocessingScheduler = self->_preprocessingScheduler;
                v54[0] = MEMORY[0x1E4F143A8];
                v54[1] = 3221225472;
                v54[2] = __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke;
                void v54[3] = &unk_1E6C04D60;
                uint64_t v22 = v26;
                long long v55 = v22;
                uint64_t v56 = self;
                uint64_t v57 = v16;
                BOOL v58 = v49;
                [(EFStoppableScheduler *)preprocessingScheduler performBlock:v54];
                __int16 v28 = [v16 referenceItem];
                [v51 addObject:v28];

                goto LABEL_19;
              case 1:
                uint64_t v22 = [v16 referenceItem];
                [v51 addObject:v22];
                goto LABEL_19;
              case 2:
                uint64_t v22 = [v16 referenceItem];
                [v48 addObject:v22];
                goto LABEL_19;
              case 3:
                uint64_t v22 = [v16 referenceItem];
                [v50 addObject:v22];
                goto LABEL_19;
              default:
                break;
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v81 count:16];
      }
      while (v13);
    }

    uint64_t v29 = [v50 count];
    __int16 v30 = [(EDSearchableIndex *)self state];
    uint64_t v31 = [v30 pendingItems];
    uint64_t v32 = [v31 count];

    uint64_t v33 = [v51 count];
    id v45 = [(EDSearchableIndex *)self _identifiersStringForItems:v50 maxLength:150];
    uint64_t v47 = [(EDSearchableIndex *)self _identifiersStringForItems:v48 maxLength:150];
    long long v52 = [(EDSearchableIndex *)self _identifiersStringForItems:v51 maxLength:150];
    __int16 v34 = objc_msgSend(v50, "ef_compactMap:", &__block_literal_global_354);
    BOOL v35 = [[EDSearchableIndexUpdates alloc] initWithRemovedIdentifiers:v34];
    [(EDSearchableIndex *)self _dataSourceAssignTransaction:-1 updates:v35 completion:0];
    uint64_t v36 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [obj count];
      uint64_t v38 = [(EDSearchableIndex *)self state];
      __int16 v39 = [v38 pendingItems];
      uint64_t v40 = [v39 count];
      *(_DWORD *)buf = 134220034;
      uint64_t v64 = v37;
      __int16 v65 = 2048;
      uint64_t v66 = v29;
      __int16 v67 = 2114;
      char v68 = v45;
      __int16 v69 = 2114;
      char v70 = v47;
      __int16 v71 = 2048;
      uint64_t v72 = v29 + v44 - v32;
      __int16 v73 = 2048;
      uint64_t v74 = v33;
      __int16 v75 = 2114;
      char v76 = v52;
      __int16 v77 = 2048;
      uint64_t v78 = v40;
      __int16 v79 = 1024;
      BOOL v80 = v49;
      _os_log_impl(&dword_1DB39C000, v36, OS_LOG_TYPE_DEFAULT, "Requested %lu items to be indexed (new: %lu %{public}@ existing: %{public}@ deferred: %lu preprocess: %lu %{public}@ pending: %lu) fromRefresh: %{BOOL}d", buf, 0x58u);
    }
    if (v29)
    {
      if (v49)
      {
        long long v41 = [v50 lastObject];
        long long v42 = [v41 dateReceived];
        [(EDSearchableIndex *)self _queueConsumeBudgetItemCount:v29 lastItemDateReceived:v42];
      }
      -[EDSearchableIndex _queueTransitionFromRefresh:](self, "_queueTransitionFromRefresh:", v49, v44);
    }

    goto LABEL_32;
  }
  char v8 = _os_feature_enabled_impl();

  if (v8) {
    goto LABEL_4;
  }
  long long v43 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v64 = [v46 count];
    _os_log_impl(&dword_1DB39C000, v43, OS_LOG_TYPE_INFO, "Requested %lu items to be indexed while inactive", buf, 0xCu);
  }

  [(EDSearchableIndex *)self _queueRefresh];
LABEL_32:
}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke(uint64_t a1)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  int v17 = __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_2;
  __int16 v18 = &unk_1E6BFF2F0;
  id v19 = *(id *)(a1 + 32);
  uint64_t v2 = v16;
  uint64_t v3 = mach_absolute_time();
  v17((uint64_t)v2);
  uint64_t v4 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_1 != -1) {
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_1, &__block_literal_global_770);
  }
  double v5 = (double)((v4 - v3)
              * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_1
              / *(unsigned int *)algn_1EB5F6FD4)
     / 1000000000.0;

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3;
  v7[3] = &unk_1E6C057B8;
  int v6 = *(void **)(*(void *)(a1 + 40) + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 56);
  uint64_t v9 = &v12;
  double v10 = v5;
  [v6 performSyncBlock:v7];
  if (*((unsigned char *)v13 + 24)) {
    [*(id *)(a1 + 40) refresh];
  }
  _Block_object_dispose(&v12, 8);
}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        double v5 = *(void **)(*((void *)&v6 + 1) + 8 * i);
        if (objc_msgSend(v5, "requiresPreprocessing", (void)v6)) {
          [v5 preprocess];
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v2);
  }
}

uint64_t __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  int v3 = [v2 didPreprocessItem:*(void *)(a1 + 40)];

  if (v3)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = 0;
    }
    else
    {
      long long v6 = [*(id *)(a1 + 40) referenceItem];
      uint64_t v4 = [v6 shouldIndexImmediatelyPostPreprocessing];
    }
    long long v7 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      long long v8 = [*(id *)(a1 + 40) identifier];
      __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_1(v8, v4, buf, v7);
    }

    long long v9 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v9 _doIndexItems:v5 fromRefresh:*(unsigned __int8 *)(a1 + 64) immediately:v4];
  }
  else
  {
    double v5 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 40) identifier];
      objc_claimAutoreleasedReturnValue();
      __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_2();
    }
  }

  if (*(unsigned char *)(a1 + 64))
  {
    double v10 = [*(id *)(a1 + 32) state];
    int v11 = [v10 queueContentsAllowsRefresh];

    if (v11) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return [*(id *)(a1 + 32) _queueConsumeBudgetElapsedPeriod:*(double *)(a1 + 56)];
}

id __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_351(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];

  return v2;
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(EDSearchableIndex *)self currentReasons];
  [(EDSearchableIndex *)self removeItemsWithIdentifiers:v5 reasons:v4 fromRefresh:0];
}

- (void)removeItemsWithIdentifiers:(id)a3 reasons:(id)a4 fromRefresh:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke;
    aBlock[3] = &unk_1E6C05800;
    void aBlock[4] = self;
    BOOL v20 = a5;
    id v19 = v9;
    double v10 = _Block_copy(aBlock);
    stateTransitionScheduler = self->_stateTransitionScheduler;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_355;
    v13[3] = &unk_1E6C05828;
    id v16 = v10;
    id v14 = v8;
    uint64_t v15 = self;
    BOOL v17 = a5;
    id v12 = v10;
    [(EFAssertableScheduler *)stateTransitionScheduler performBlock:v13];
  }
}

void __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 32) assertIsExecuting:1];
  if ([v3 count])
  {
    uint64_t v4 = [v3 componentsJoinedByString:@","];
    unint64_t v5 = [v4 length];
    if (v5 >= 0x96) {
      uint64_t v6 = 150;
    }
    else {
      uint64_t v6 = v5;
    }
    long long v7 = [v4 substringToIndex:v6];

    id v8 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(unsigned __int8 *)(a1 + 48);
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Removing identifiers:%{public}@ fromRefresh:%{BOOL}d", (uint8_t *)&v11, 0x12u);
    }

    double v10 = [*(id *)(a1 + 32) state];
    [v10 removeIdentifiersFromPendingQueues:v3 reasons:*(void *)(a1 + 40)];
  }
}

void __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_355(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_2;
  v3[3] = &unk_1E6C05850;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _dataSourceScheduleWork:v3];
}

void __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSource];
  [v2 searchableIndex:*(void *)(a1 + 32) willRemoveIdentifiers:*(void *)(a1 + 40) type:0];
  id v3 = [v2 childIdentifiersToRemoveFromSearchableIndex:*(void *)(a1 + 32) whenRemovingParentIdentifiers:*(void *)(a1 + 40)];
  if ([v3 count]) {
    [v2 searchableIndex:*(void *)(a1 + 32) willRemoveIdentifiers:v3 type:0];
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_3;
  v7[3] = &unk_1E6C05828;
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  char v11 = *(unsigned char *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 performBlock:v7];
}

uint64_t __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v2 = 1;
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) state];
    [v3 setIndexImmediately:1];

    BOOL v2 = *(unsigned char *)(a1 + 56) != 0;
  }
  id v4 = *(void **)(a1 + 40);

  return [v4 _queueTransitionFromRefresh:v2];
}

- (void)removeItemsForDomainIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke;
  v6[3] = &unk_1E6BFFAF0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EDSearchableIndex *)self _dataSourceScheduleWork:v6];
}

void __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (uint64_t *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) dataSource];
  uint64_t v4 = *v2;
  v12[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v3 searchableIndex:v4 willRemoveIdentifiers:v5 type:1];

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke_2;
  v9[3] = &unk_1E6BFFAF0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 performBlock:v9];
}

uint64_t __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Removing all items for domain: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) state];
  [v4 removeItemsForDomainIdentifier:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 40) _queueTransitionFromRefresh:0];
}

- (void)test_resetSpotlightIndex
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDSearchableIndex.m", 2352, @"%s can only be called from unit tests", "-[EDSearchableIndex test_resetSpotlightIndex]");
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __45__EDSearchableIndex_test_resetSpotlightIndex__block_invoke;
  v9[3] = &unk_1E6BFF2F0;
  id v5 = v4;
  id v10 = v5;
  [(EDSearchableIndex *)self resetIndexForNewLibraryWithCompletionHandler:v9];
  while (dispatch_semaphore_wait(v5, 0x64uLL))
  {
    int v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.01];
    [v6 runUntilDate:v7];
  }
}

intptr_t __45__EDSearchableIndex_test_resetSpotlightIndex__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeMessages:(id)a3
{
  objc_msgSend(a3, "ef_mapSelector:", sel_persistentID);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex removeItemsWithIdentifiers:](self, "removeItemsWithIdentifiers:");
}

- (void)indexAttachmentsForMessageWithIdentifier:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithBool:v4];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to index attachment from message %@ immediately %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [(EDSearchableIndex *)self dataSource];
  [v9 searchableIndex:self prepareToIndexAttachmentsForMessageWithIdentifier:v6];

  if (v4)
  {
    id v10 = [(EDSearchableIndex *)self dataSource];
    uint64_t v11 = [v10 searchableIndex:self attachmentItemsForMessageWithIdentifier:v6];

    [(EDSearchableIndex *)self indexItems:v11];
  }
  else
  {
    [(EDSearchableIndex *)self refresh];
  }
}

- (void)_processAttachmentItemsForSuggestionsService:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  uint64_t v25 = [(EDSearchableIndex *)self _suggestionsService];
  if (v25)
  {
    uint64_t v24 = [v26 firstObject];
    if (v24)
    {
      BOOL v4 = objc_opt_new();
      id v5 = objc_opt_new();
      id v6 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      obuint64_t j = v26;
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(obj);
            }
            id v10 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "attributeSet", v24);
            uint64_t v11 = [v10 contentType];
            int v12 = (void *)v11;
            if (v11) {
              id v13 = (__CFString *)v11;
            }
            else {
              id v13 = &stru_1F3583658;
            }
            [v4 addObject:v13];

            uint64_t v14 = [v10 displayName];
            uint64_t v15 = (void *)v14;
            if (v14) {
              uint64_t v16 = (__CFString *)v14;
            }
            else {
              uint64_t v16 = &stru_1F3583658;
            }
            [v5 addObject:v16];

            BOOL v17 = [v10 contentURL];
            uint64_t v18 = [v17 path];
            id v19 = (void *)v18;
            if (v18) {
              BOOL v20 = (__CFString *)v18;
            }
            else {
              BOOL v20 = &stru_1F3583658;
            }
            [v6 addObject:v20];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v7);
      }

      int v21 = [v24 attributeSet];
      [v21 setAttachmentTypes:v4];
      [v21 setAttachmentNames:v5];
      [v21 setAttachmentPaths:v6];
      uint64_t v22 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = obj;
        _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Processing attachment items %@ with suggestions service", buf, 0xCu);
      }

      [v25 dissectAttachmentsFromSearchableItem:v24 options:3 withCompletion:&__block_literal_global_364];
    }
    else
    {
      BOOL v4 = +[EDSearchableIndex log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[EDSearchableIndex _processAttachmentItemsForSuggestionsService:](v4);
      }
    }

    uint64_t v23 = v24;
  }
  else
  {
    uint64_t v23 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[EDSearchableIndex _processAttachmentItemsForSuggestionsService:]();
    }
  }
}

void __66__EDSearchableIndex__processAttachmentItemsForSuggestionsService___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = +[EDSearchableIndex log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDSearchableIndex__processAttachmentItemsForSuggestionsService___block_invoke_cold_1();
    }
  }
}

- (id)_suggestionsService
{
  if (_suggestionsService_onceToken != -1) {
    dispatch_once(&_suggestionsService_onceToken, &__block_literal_global_366);
  }
  BOOL v2 = (void *)_suggestionsService_suggestionsInstance;

  return v2;
}

uint64_t __40__EDSearchableIndex__suggestionsService__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F5DB70] serviceForMail];
  id v1 = (void *)_suggestionsService_suggestionsInstance;
  _suggestionsService_suggestionsInstance = v0;

  BOOL v2 = (void *)_suggestionsService_suggestionsInstance;

  return [v2 setSyncTimeout:1.0];
}

- (void)indexMessages:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5
{
  id v7 = a3;
  [(EDSearchableIndex *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndex indexMessages:includeBody:indexingType:]", "EDSearchableIndex.m", 2436, "0");
}

- (void)markMessagesAsPrinted:(id)a3
{
  id v5 = a3;
  [(EDSearchableIndex *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndex markMessagesAsPrinted:]", "EDSearchableIndex.m", 2440, "0");
}

- (EFObservable)powerObservable
{
  return 0;
}

- (BOOL)isPluggedIn
{
  return 1;
}

- (void)attachmentBecameAvailable:(id)a3
{
  uint64_t v4 = [a3 object];
  if (v4)
  {
    id v6 = (void *)v4;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v6 persistentID];
      if (v5) {
        [(EDSearchableIndex *)self indexAttachmentsForMessageWithIdentifier:v5 immediately:1];
      }
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)richLinkBecameAvailable:(id)a3
{
  uint64_t v4 = +[EDSearchableIndex log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Rich link data became available, starting a data source refresh", v5, 2u);
  }

  [(EDSearchableIndex *)self refresh];
}

- (NSSet)dataSourceRefreshReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"MonitoredActivityReasonCompacting"];
}

- (NSSet)purgeReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"MonitoredActivityReasonCompacting", @"MonitoredActivityReasonMoving", @"MonitoredActivityReasonArchiving", 0);
}

- (NSSet)exclusionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"MonitoredActivityReasonDeleting", @"MonitoredActivityReasonJunking", 0);
}

- (NSSet)currentReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"MonitoredActivityReasonCompacting"];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDSearchableIndex.m", 2514, @"%s can only be called from unit tests", "-[EDSearchableIndex test_tearDown]");
  }
  [(EFStoppableScheduler *)self->_dataSourceScheduler stopAndWait];
  if ([(EDSearchableIndex *)self isActive]) {
    [(EFSuspendableScheduler *)self->_indexingScheduler stopAndWait];
  }
  [(EFStoppableScheduler *)self->_addIndexItemsScheduler stopAndWait];
  [(EFStoppableScheduler *)self->_preprocessingScheduler stopAndWait];
  [(EFStoppableScheduler *)self->_indexingBatchScheduler stopAndWait];
  stateTransitionScheduler = self->_stateTransitionScheduler;

  [(EFAssertableScheduler *)stateTransitionScheduler stopAndWait];
}

- (BOOL)isDataSourceIndexingPermitted
{
  return self->_dataSourceIndexingPermitted;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setDataSource:(id)a3
{
}

- (void)setSchedulableDelegate:(id)a3
{
}

- (void)setSearchIndex:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (void)setSkipIndexExclusionCheck:(BOOL)a3
{
  self->_skipIndexExclusionCheck = a3;
}

- (BOOL)enableSpotlightVerification
{
  return self->_enableSpotlightVerification;
}

- (void)setEnableSpotlightVerification:(BOOL)a3
{
  self->_enableSpotlightVerification = a3;
}

- (void)setSearchableIndexBundleID:(id)a3
{
}

- (double)coalescingDelaySeconds
{
  return self->_coalescingDelaySeconds;
}

- (void)setCoalescingDelaySeconds:(double)a3
{
  self->_double coalescingDelaySeconds = a3;
}

- (void)setDataSourceUpdateTimeLimit:(double)a3
{
  self->_dataSourceUpdateTimeLimit = a3;
}

- (void)setDelayDataSourceAssignmentFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayDataSourceAssignmentFuture, 0);
  objc_storeStrong((id *)&self->_searchableIndexBundleID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_destroyWeak((id *)&self->_schedulableDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_lastReindexRadarPrompt, 0);
  objc_storeStrong((id *)&self->_indexingBatchScheduler, 0);
  objc_storeStrong((id *)&self->_preprocessingScheduler, 0);
  objc_storeStrong((id *)&self->_addIndexItemsScheduler, 0);
  objc_storeStrong((id *)&self->_dataSourceScheduler, 0);
  objc_storeStrong((id *)&self->_indexingScheduler, 0);
  objc_storeStrong((id *)&self->_batchIndexingActivity, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_stateTransitionScheduler, 0);
  objc_storeStrong((id *)&self->_stateCancelable, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);

  objc_storeStrong((id *)&self->_indexName, 0);
}

void __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_FAULT, "Spotlight index and Mail database are out of sync, items may be missing or duplicated", v1, 2u);
}

- (void)_handleFailingTransactionIDs:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Removing corrupt indexes for %lu transactions: %{public}@", buf, 0x16u);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11(a1, a2, 5.778e-34);
  *(_WORD *)(v2 + 12) = 2048;
  *(void *)(v2 + 14) = v3;
  _os_log_error_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_ERROR, "Received corrupted client state: %@, transaction: %lld, will cause full re-index.", v4, 0x16u);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_FAULT, "CoreSpotlight failed to return our client state (old state: %@)", (uint8_t *)&v2, 0xCu);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "failed to retrieve last client state: %{public}@", v5);
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_276_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_FAULT, "Data source updates took too long to return results. Canceling.", v1, 2u);
}

- (void)_queueTransitionFromRefresh:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Unable to index while locked without client state", v2, v3, v4, v5, v6);
}

- (void)_scheduleProcessPendingItemsFromRefresh:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_5(&dword_1DB39C000, v0, v1, "scheduling processing of pending items", v2, v3, v4, v5, v6);
}

- (void)_processIndexingBatch:clientState:itemsNotIndexed:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "generating searchable items failed: %{public}@", v5);
}

void __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_331_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "indexing searchable items failed: %{public}@", v5);
}

- (void)searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Spotlight requested that Mail reindex all items", v2, v3, v4, v5, v6);
}

void __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_347_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "failed to delete all items from domain: %{public}@", v5);
}

- (void)indexItems:fromRefresh:immediately:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "WARNING: Skipping indexing, indexing is disabled. This is intended for testing purposes only.", v2, v3, v4, v5, v6);
}

- (void)_indexItems:fromRefresh:immediately:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Index items usage issue - indexing identifiers(s) %{public}@ that were removed", v5);
}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "%p dropped item: %{public}@", buf, 0x16u);
}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_1(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2 & 1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Finished processing item %{public}@ immediately: %{BOOL}d", buf, 0x12u);
}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  _os_log_debug_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEBUG, "Skipped processing item - no longer in preprocessingItems %{public}@", v4, 0xCu);
}

- (void)_processAttachmentItemsForSuggestionsService:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Unable to connect to suggestions service mail protocol", v2, v3, v4, v5, v6);
}

- (void)_processAttachmentItemsForSuggestionsService:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Nil searchableItem for item: %@", (uint8_t *)&v1, 0xCu);
}

void __66__EDSearchableIndex__processAttachmentItemsForSuggestionsService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to process the attachment items %{public}@", v5);
}

@end
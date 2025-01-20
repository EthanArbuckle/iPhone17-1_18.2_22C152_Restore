@interface HDActivitySummaryQueryHelper
- (BOOL)orderByDateAscending;
- (BOOL)shouldIncludePrivateProperties;
- (BOOL)shouldIncludeStatistics;
- (HDActivitySummaryQueryHelper)initWithProfile:(id)a3 filter:(id)a4 batchedInitialResultsHandler:(id)a5 batchedUpdateHandler:(id)a6;
- (id)batchedInitialResultsHandler;
- (id)batchedUpdateHandler;
- (int64_t)enumeratedSummaryCount;
- (unint64_t)limit;
- (void)_queue_deliverActivitySummariesMatchingPredicate:(uint64_t)a1;
- (void)_queue_deliverActivitySummariesToClient:(char)a3 isFinalBatch:(char)a4 clearPendingBatches:;
- (void)_queue_deliverErrorToClient:(uint64_t)a1;
- (void)_queue_deliverUpdates;
- (void)_queue_stop;
- (void)_queue_updatePreviousActivityCachesWithNewCaches:(uint64_t)a1;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)pause;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setLimit:(unint64_t)a3;
- (void)setOrderByDateAscending:(BOOL)a3;
- (void)setShouldIncludePrivateProperties:(BOOL)a3;
- (void)setShouldIncludeStatistics:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation HDActivitySummaryQueryHelper

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4 && self->_needsUpdateAfterUnlock)
  {
    self->_needsUpdateAfterUnlock = 0;
    -[HDActivitySummaryQueryHelper _queue_deliverUpdates]((uint64_t)self);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDActivitySummaryQueryHelper_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E62F30F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __52__HDActivitySummaryQueryHelper_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 41))
  {
    _HKInitializeLogging();
    v1 = *MEMORY[0x1E4F29F90];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG)) {
      return;
    }
    *(_WORD *)buf = 0;
    v2 = "Received samples while _needsUpdateAfterUnlock=YES";
    v3 = v1;
    uint32_t v4 = 2;
LABEL_18:
    _os_log_debug_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEBUG, v2, buf, v4);
    return;
  }
  uint64_t v6 = [*(id *)(a1 + 40) longLongValue];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6 <= *(void *)(v7 + 56))
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E4F29F90];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG)) {
      return;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v82 = v18;
    __int16 v83 = 2048;
    uint64_t v84 = v19;
    v2 = "Anchor %@ <= %ld, skipping";
    v3 = v17;
    uint32_t v4 = 22;
    goto LABEL_18;
  }
  id v8 = *(id *)(a1 + 48);
  id v9 = v8;
  if (*(void *)(v7 + 24))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v77 objects:buf count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v78 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v77 + 1) + 8 * i);
          if ([MEMORY[0x1E4F2B8E8] filter:*(void *)(v7 + 24) acceptsDataObject:v16]) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v77 objects:buf count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = v8;
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v20 = [v10 countByEnumeratingWithState:&v63 objects:v76 count:16];
  unint64_t v21 = 0x1E4F28000uLL;
  if (!v20) {
    goto LABEL_29;
  }
  uint64_t v22 = v20;
  char v23 = 0;
  uint64_t v24 = *(void *)v64;
  do
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v64 != v24) {
        objc_enumerationMutation(v10);
      }
      v26 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * j), "cacheIndex"));
      v27 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v26];
      BOOL v28 = v27 == 0;

      v23 |= v28;
    }
    uint64_t v22 = [v10 countByEnumeratingWithState:&v63 objects:v76 count:16];
  }
  while (v22);
  if (v23)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverUpdates](*(void *)(a1 + 32));
  }
  else
  {
LABEL_29:
    uint64_t v30 = *(void *)(a1 + 32);
    v29 = *(void **)(a1 + 40);
    id v31 = v10;
    id v32 = v29;
    v33 = v32;
    if (v30)
    {
      v57 = v32;
      id v59 = v10;
      id v62 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v58 = v31;
      obuint64_t j = v31;
      uint64_t v34 = [obj countByEnumeratingWithState:&v72 objects:buf count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v61 = *(void *)v73;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v73 != v61) {
              objc_enumerationMutation(obj);
            }
            id v37 = *(id *)(*((void *)&v72 + 1) + 8 * k);
            unint64_t v38 = v21;
            v39 = objc_msgSend(*(id *)(v21 + 3792), "numberWithLongLong:", objc_msgSend(v37, "cacheIndex"));
            v40 = [*(id *)(v30 + 48) objectForKeyedSubscript:v39];
            v41 = [v37 sourceRevision];
            v42 = [v41 source];

            *(void *)&long long v77 = MEMORY[0x1E4F143A8];
            *((void *)&v77 + 1) = 3221225472;
            *(void *)&long long v78 = __71__HDActivitySummaryQueryHelper__queue_addActivityCacheToCachedSamples___block_invoke;
            *((void *)&v78 + 1) = &unk_1E630B948;
            *(void *)&long long v79 = v42;
            id v43 = v42;
            uint64_t v44 = [v40 indexOfObjectWithOptions:0 passingTest:&v77];
            if (v44 == 0x7FFFFFFFFFFFFFFFLL) {
              [v40 addObject:v37];
            }
            else {
              [v40 replaceObjectAtIndex:v44 withObject:v37];
            }

            v45 = [*(id *)(v30 + 48) objectForKeyedSubscript:v39];
            [v62 setObject:v45 forKeyedSubscript:v39];

            unint64_t v21 = v38;
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v72 objects:buf count:16];
        }
        while (v35);
      }

      v46 = [MEMORY[0x1E4F1CA48] array];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v47 = [v62 allValues];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:&v77 count:16];
      id v10 = v59;
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v69;
        do
        {
          for (uint64_t m = 0; m != v49; ++m)
          {
            if (*(void *)v69 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = objc_msgSend(MEMORY[0x1E4F2ABA8], "_mostSignificantCacheAmongCaches:", *(void *)(*((void *)&v68 + 1) + 8 * m), v57);
            v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ABA8]), "_initWithActivityCache:shouldIncludePrivateProperties:", v52, objc_msgSend((id)v30, "shouldIncludePrivateProperties"));
            [v46 addObject:v53];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v68 objects:&v77 count:16];
        }
        while (v49);
      }

      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __91__HDActivitySummaryQueryHelper__queue_updateActivitySummariesWithNewActivityCaches_anchor___block_invoke;
      v67[3] = &unk_1E630B920;
      v67[4] = v30;
      [v46 sortUsingComparator:v67];
      if ([v46 count]) {
        -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesToClient:isFinalBatch:clearPendingBatches:](v30, v46, 1, 0);
      }
      uint64_t v54 = *(void *)(v30 + 56);
      v33 = v57;
      uint64_t v55 = objc_msgSend(v57, "integerValue", v57);
      if (v54 <= v55) {
        uint64_t v56 = v55;
      }
      else {
        uint64_t v56 = v54;
      }
      *(void *)(v30 + 56) = v56;

      id v31 = v58;
    }
  }
}

uint64_t __71__HDActivitySummaryQueryHelper__queue_addActivityCacheToCachedSamples___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 sourceRevision];
  uint32_t v4 = [v3 source];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HDActivitySummaryQueryHelper_start__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__HDActivitySummaryQueryHelper_start__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    v3 = [WeakRetained dataManager];
    uint32_t v4 = [MEMORY[0x1E4F2B2C0] activityCacheType];
    [v3 addObserver:v1 forDataType:v4];

    if (*(unsigned char *)(v1 + 40))
    {
      -[HDActivitySummaryQueryHelper _queue_deliverUpdates](v1);
    }
    else
    {
      uint64_t v5 = *(void **)(v1 + 16);
      -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesMatchingPredicate:](v1, v5);
    }
  }
}

- (void)_queue_deliverActivitySummariesMatchingPredicate:(uint64_t)a1
{
  id v3 = a2;
  uint32_t v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 42))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke;
    v6[3] = &unk_1E630B8A8;
    v6[4] = a1;
    [v4 batchedActivitySummariesWithPredicate:v3 maxBatchSize:200 handler:v6];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke_2;
    v5[3] = &unk_1E630B8D0;
    v5[4] = a1;
    [v4 activitySummariesWithPredicate:v3 handler:v5];
  }
}

- (void)_queue_deliverUpdates
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = *(void **)(a1 + 16);
    id v18 = 0;
    id v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x1E4F65D58];
    uint64_t v6 = [NSNumber numberWithLongLong:v2];
    uint64_t v7 = HDDataEntityPredicateForRowID((uint64_t)v6, 5);
    id v8 = [v5 compoundPredicateWithPredicate:v4 otherPredicate:v7];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v23[0] = @"cache_index";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v12 = [WeakRetained database];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v20 = __85__HDActivitySummaryQueryHelper__fetchActivityCacheIndicesWithAnchor_predicate_error___block_invoke;
    unint64_t v21 = &unk_1E62F4CC0;
    id v13 = v9;
    id v22 = v13;
    LOBYTE(v7) = +[HDHealthEntity enumerateProperties:v10 withPredicate:v8 healthDatabase:v12 error:&v18 enumerationHandler:&buf];

    if ((v7 & 1) == 0)
    {

      id v13 = 0;
    }

    id v14 = v18;
    if (objc_msgSend(v14, "hk_isDatabaseAccessibilityError"))
    {
      *(unsigned char *)(a1 + 41) = 1;
    }
    else if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Error fetching activity cache indices: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      -[HDActivitySummaryQueryHelper _queue_deliverErrorToClient:](a1, v14);
    }
    else if ([v13 count])
    {
      uint64_t v16 = HDActivityCacheEntityPredicateForCacheIndices((uint64_t)v13);
      v17 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v16 otherPredicate:*(void *)(a1 + 16)];
      -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesMatchingPredicate:](a1, v17);
    }
  }
}

uint64_t __85__HDActivitySummaryQueryHelper__fetchActivityCacheIndicesWithAnchor_predicate_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = MEMORY[0x1C1879F70](a4, 0);
  [v4 addObject:v5];

  return 1;
}

- (void)_queue_updatePreviousActivityCachesWithNewCaches:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__HDActivitySummaryQueryHelper__queue_updatePreviousActivityCachesWithNewCaches___block_invoke;
    v16[3] = &unk_1E630B8F8;
    v16[4] = a1;
    [a2 enumerateKeysAndObjectsUsingBlock:v16];
    id v3 = [*(id *)(a1 + 48) allKeys];
    id v4 = (void *)[v3 mutableCopy];

    [v4 sortUsingSelector:sel_compare_];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((unint64_t)[v4 count] >= 6)
    {
      do
      {
        uint64_t v6 = [v4 firstObject];
        [v5 addObject:v6];

        [v4 removeObjectAtIndex:0];
      }
      while ((unint64_t)[v4 count] > 5);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

void __81__HDActivitySummaryQueryHelper__queue_updatePreviousActivityCachesWithNewCaches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v6 forKeyedSubscript:v5];
}

- (HDActivitySummaryQueryHelper)initWithProfile:(id)a3 filter:(id)a4 batchedInitialResultsHandler:(id)a5 batchedUpdateHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HDActivitySummaryQueryHelper;
  long long v14 = [(HDActivitySummaryQueryHelper *)&v33 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_filter, a4);
    uint64_t v16 = [(_HKFilter *)v15->_filter predicateWithProfile:v10];
    predicate = v15->_predicate;
    v15->_predicate = (HDSQLitePredicate *)v16;

    uint64_t v18 = [[HDActivitySummaryBuilder alloc] initWithProfile:v10 filter:v11];
    activitySummaryBuilder = v15->_activitySummaryBuilder;
    v15->_activitySummaryBuilder = v18;

    [(HDActivitySummaryBuilder *)v15->_activitySummaryBuilder setShouldIncludePrivateProperties:1];
    [(HDActivitySummaryBuilder *)v15->_activitySummaryBuilder setShouldIncludeStatistics:0];
    [(HDActivitySummaryBuilder *)v15->_activitySummaryBuilder setOrderByDateAscending:1];
    [(HDActivitySummaryBuilder *)v15->_activitySummaryBuilder setLimit:0];
    uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    previousActivityCachesByCacheIndex = v15->_previousActivityCachesByCacheIndex;
    v15->_previousActivityCachesByCacheIndex = v20;

    uint64_t v22 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v22;

    uint64_t v24 = HKCreateSerialDispatchQueue();
    clientQueue = v15->_clientQueue;
    v15->_clientQueue = (OS_dispatch_queue *)v24;

    v26 = _Block_copy(v12);
    id batchedInitialResultsHandler = v15->_batchedInitialResultsHandler;
    v15->_id batchedInitialResultsHandler = v26;

    BOOL v28 = _Block_copy(v13);
    id batchedUpdateHandler = v15->_batchedUpdateHandler;
    v15->_id batchedUpdateHandler = v28;

    v15->_shouldBatchSummaries = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    id v31 = [WeakRetained database];
    [v31 addProtectedDataObserver:v15 queue:v15->_queue];
  }
  return v15;
}

- (void)dealloc
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained database];
  [v5 removeProtectedDataObserver:self];

  id v6 = objc_loadWeakRetained((id *)p_profile);
  id v7 = [v6 dataManager];
  uint64_t v8 = [MEMORY[0x1E4F2B2C0] activityCacheType];
  [v7 removeObserver:self forDataType:v8];

  v9.receiver = self;
  v9.super_class = (Class)HDActivitySummaryQueryHelper;
  [(HDActivitySummaryQueryHelper *)&v9 dealloc];
}

- (void)pause
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HDActivitySummaryQueryHelper_pause__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__HDActivitySummaryQueryHelper_pause__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = [WeakRetained dataManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F2B2C0] activityCacheType];
  [v2 removeObserver:v3 forDataType:v4];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HDActivitySummaryQueryHelper_stop__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __36__HDActivitySummaryQueryHelper_stop__block_invoke(uint64_t a1)
{
}

- (void)_queue_stop
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v3 = [WeakRetained dataManager];
    id v4 = [MEMORY[0x1E4F2B2C0] activityCacheType];
    [v3 removeObserver:a1 forDataType:v4];

    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    id v6 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    id v7 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;
  }
}

- (void)setShouldIncludePrivateProperties:(BOOL)a3
{
}

- (BOOL)shouldIncludePrivateProperties
{
  return [(HDActivitySummaryBuilder *)self->_activitySummaryBuilder shouldIncludePrivateProperties];
}

- (void)setShouldIncludeStatistics:(BOOL)a3
{
}

- (BOOL)shouldIncludeStatistics
{
  return [(HDActivitySummaryBuilder *)self->_activitySummaryBuilder shouldIncludeStatistics];
}

- (void)setOrderByDateAscending:(BOOL)a3
{
}

- (BOOL)orderByDateAscending
{
  return [(HDActivitySummaryBuilder *)self->_activitySummaryBuilder orderByDateAscending];
}

- (void)setLimit:(unint64_t)a3
{
}

- (unint64_t)limit
{
  return [(HDActivitySummaryBuilder *)self->_activitySummaryBuilder limit];
}

- (void)_queue_deliverErrorToClient:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = _Block_copy(*(const void **)(a1 + 88));
    if (!*(unsigned char *)(a1 + 40))
    {
      id v5 = _Block_copy(*(const void **)(a1 + 80));

      id v4 = v5;
    }
    *(unsigned char *)(a1 + 40) = 1;
    -[HDActivitySummaryQueryHelper _queue_stop](a1);
    if (v4)
    {
      id v6 = *(NSObject **)(a1 + 72);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __60__HDActivitySummaryQueryHelper__queue_deliverErrorToClient___block_invoke;
      v7[3] = &unk_1E62F3CA8;
      id v9 = v4;
      id v8 = v3;
      dispatch_async(v6, v7);
    }
  }
}

uint64_t __60__HDActivitySummaryQueryHelper__queue_deliverErrorToClient___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 1, 0, *(void *)(a1 + 32));
}

- (void)_queue_deliverActivitySummariesToClient:(char)a3 isFinalBatch:(char)a4 clearPendingBatches:
{
  id v7 = a2;
  if (a1)
  {
    id v8 = _Block_copy(*(const void **)(a1 + 88));
    if (!*(unsigned char *)(a1 + 40))
    {
      id v9 = _Block_copy(*(const void **)(a1 + 80));

      id v8 = v9;
    }
    *(unsigned char *)(a1 + 40) = 1;
    if (*(void *)(a1 + 88))
    {
      if (!v8)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      -[HDActivitySummaryQueryHelper _queue_stop](a1);
      if (!v8) {
        goto LABEL_7;
      }
    }
    id v10 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesToClient_isFinalBatch_clearPendingBatches___block_invoke;
    block[3] = &unk_1E630B880;
    id v13 = v8;
    id v12 = v7;
    char v14 = a3;
    char v15 = a4;
    dispatch_async(v10, block);

    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __105__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesToClient_isFinalBatch_clearPendingBatches___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), 0);
}

void __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, char a6, void *a7)
{
  id v19 = a2;
  id v13 = a3;
  id v14 = a7;
  char v15 = v14;
  if (v19)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesToClient:isFinalBatch:clearPendingBatches:](*(void *)(a1 + 32), v19, a5, a6);
  }
  else if (objc_msgSend(v14, "hk_isDatabaseAccessibilityError"))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  }
  else if (v15)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverErrorToClient:](*(void *)(a1 + 32), v15);
  }
  if (a5)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(v16 + 56);
    if (v17 <= a4) {
      uint64_t v17 = a4;
    }
    *(void *)(v16 + 56) = v17;
    if (v13) {
      -[HDActivitySummaryQueryHelper _queue_updatePreviousActivityCachesWithNewCaches:](*(void *)(a1 + 32), v13);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    *(void *)(v18 + 96) = [*(id *)(v18 + 32) enumeratedSummaryCount];
  }
}

void __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v15 = a2;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v15)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesToClient:isFinalBatch:clearPendingBatches:](*(void *)(a1 + 32), v15, 1, 1);
  }
  else if (objc_msgSend(v10, "hk_isDatabaseAccessibilityError"))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  }
  else if (v11)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverErrorToClient:](*(void *)(a1 + 32), v11);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v12 + 56);
  if (v13 <= a4) {
    uint64_t v13 = a4;
  }
  *(void *)(v12 + 56) = v13;
  if (v9) {
    -[HDActivitySummaryQueryHelper _queue_updatePreviousActivityCachesWithNewCaches:](*(void *)(a1 + 32), v9);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  *(void *)(v14 + 96) = [*(id *)(v14 + 32) enumeratedSummaryCount];
}

uint64_t __91__HDActivitySummaryQueryHelper__queue_updateActivitySummariesWithNewActivityCaches_anchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) orderByDateAscending])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "_activitySummaryIndex"));
    id v8 = NSNumber;
    id v9 = v6;
  }
  else
  {
    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "_activitySummaryIndex"));
    id v8 = NSNumber;
    id v9 = v5;
  }
  id v10 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "_activitySummaryIndex"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (id)batchedInitialResultsHandler
{
  return self->_batchedInitialResultsHandler;
}

- (id)batchedUpdateHandler
{
  return self->_batchedUpdateHandler;
}

- (int64_t)enumeratedSummaryCount
{
  return self->_enumeratedSummaryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchedUpdateHandler, 0);
  objc_storeStrong(&self->_batchedInitialResultsHandler, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousActivityCachesByCacheIndex, 0);
  objc_storeStrong((id *)&self->_activitySummaryBuilder, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end
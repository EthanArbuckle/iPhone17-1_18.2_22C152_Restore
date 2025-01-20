@interface CPLEnginePushRepository
- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4;
- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4;
- (BOOL)deleteAllChangesWithError:(id *)a3;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)discardChangeWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4;
- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4;
- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (BOOL)hasChangesWithScopeFilter:(id)a3;
- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3;
- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 overwrittenRecord:(BOOL *)a5 error:(id *)a6;
- (BOOL)reinjectChange:(id)a3 priority:(unint64_t)a4 error:(id *)a5;
- (BOOL)reinjectExtractedBatch:(id)a3 overwrittenRecordIdentifiers:(id *)a4 error:(id *)a5;
- (BOOL)resetPriorityForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6;
- (BOOL)storeChange:(id)a3 pushContext:(id)a4 error:(id *)a5;
- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4;
- (CPLBatchExtractionStrategy)extractionStrategy;
- (CPLEnginePushRepository)initWithEngineStore:(id)a3 name:(id)a4;
- (id)_outgoingResources;
- (id)_timingStatisticStatuses;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4;
- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4;
- (id)countPerFlagsForScopeWithIdentifier:(id)a3;
- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4;
- (id)status;
- (id)storedExtractedBatch;
- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3;
- (unint64_t)maximumResourceSizePerBatchForRemainingTime:(double)a3;
- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3;
- (unint64_t)scopeType;
- (void)addPushObserver:(id)a3 withIdentifier:(id)a4;
- (void)notePushRepositoryStoredSomeChanges;
- (void)removePushObserverWithIdentifier:(id)a3;
- (void)setExtractionStrategy:(id)a3;
- (void)updateApproximativeUploadRate:(double)a3;
- (void)updateTimingStatisticForKey:(id)a3 duration:(double)a4 recordCount:(unint64_t)a5 error:(BOOL)a6 cancelled:(BOOL)a7;
@end

@implementation CPLEnginePushRepository

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushObservers, 0);
  objc_storeStrong((id *)&self->_timingStatistics, 0);
  objc_storeStrong((id *)&self->_lastUploadRateUpdateDate, 0);
  objc_storeStrong((id *)&self->_timingStatisticQueue, 0);
  objc_storeStrong((id *)&self->_uploadRateQueue, 0);
  objc_storeStrong((id *)&self->_lastStrategyName, 0);
  objc_storeStrong((id *)&self->_extractionStrategy, 0);
  objc_storeStrong((id *)&self->_propertiesPerClass, 0);
}

- (id)status
{
  v19.receiver = self;
  v19.super_class = (Class)CPLEnginePushRepository;
  v3 = [(CPLEngineStorage *)&v19 status];
  v4 = (void *)[v3 mutableCopy];

  extractionStrategy = self->_extractionStrategy;
  if (extractionStrategy)
  {
    v6 = [(CPLBatchExtractionStrategy *)extractionStrategy name];
    v7 = [(CPLBatchExtractionStrategy *)self->_extractionStrategy currentStepDescription];
    [v4 appendFormat:@"\nCurrent strategy: %@ (step: %@)", v6, v7];
  }
  else if (self->_lastStrategyName)
  {
    [v4 appendFormat:@"\nLast strategy: %@", self->_lastStrategyName];
  }
  uploadRateQueue = self->_uploadRateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CPLEnginePushRepository_status__block_invoke;
  block[3] = &unk_1E60A6728;
  block[4] = self;
  id v9 = v4;
  id v18 = v9;
  dispatch_sync(uploadRateQueue, block);
  v10 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[CPLEnginePushRepository maximumResourceSizePerBatchForRemainingTime:](self, "maximumResourceSizePerBatchForRemainingTime:", 3600.0), 1);
  [v9 appendFormat:@"\nBatch max size: %@", v10];

  v11 = [(CPLEnginePushRepository *)self _timingStatisticStatuses];
  if ([v11 count])
  {
    v12 = [v11 componentsJoinedByString:@"\n\t"];
    [v9 appendFormat:@"\nTiming stats:\n\t%@", v12];
  }
  if ([(NSMutableDictionary *)self->_pushObservers count])
  {
    v13 = [(NSMutableDictionary *)self->_pushObservers allKeys];
    v14 = [v13 componentsJoinedByString:@", "];
    [v9 appendFormat:@"\nObservers: %@", v14];
  }
  id v15 = v9;

  return v15;
}

void __33__CPLEnginePushRepository_status__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 80))
  {
    v3 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x1E4F28B68] stringFromByteCount:(uint64_t)*(double *)(v1 + 96) countStyle:1];
    v4 = +[CPLDateFormatter stringFromDateAgo:*(void *)(*(void *)(a1 + 32) + 80) now:0];
    [v3 appendFormat:@"\nLast approx. upload rate: %@/s - %@", v5, v4];
  }
}

- (void)removePushObserverWithIdentifier:(id)a3
{
}

- (void)addPushObserver:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_pushObservers)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pushObservers = self->_pushObservers;
    self->_pushObservers = v7;
  }
  id v9 = (void *)[v11 copy];
  v10 = (void *)MEMORY[0x1BA994060]();
  [(NSMutableDictionary *)self->_pushObservers setObject:v10 forKeyedSubscript:v6];
}

- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 acknowledgeContributorsUpdates:v6 error:a4];

  return (char)a4;
}

- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  v8 = [v7 contributorsUpdatesForScopeWithIdentifier:v6 maxCount:a4];

  return v8;
}

- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  v8 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v8 deleteSharingFlagsWithMaxCount:a3 deletedCount:a4 error:a5];

  return (char)a5;
}

- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLEngineStorage *)self platformObject];
  v8 = [v7 scopedIdentifiersForChangesWithFlag:a3 forScopeWithIdentifier:v6];

  return v8;
}

- (id)countPerFlagsForScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 countPerFlagsForScopeWithIdentifier:v4];

  return v6;
}

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a3) = [v7 getRelatedScopedIdentifier:a3 forRecordWithScopedIdentifier:v6];

  return (char)a3;
}

- (id)_timingStatisticStatuses
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__878;
  v10 = __Block_byref_object_dispose__879;
  id v11 = 0;
  timingStatisticQueue = self->_timingStatisticQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(timingStatisticQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 88))
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(result + 32) + 88), "count"));
    uint64_t v3 = *(void *)(*(void *)(v1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = *(void **)(*(void *)(v1 + 32) + 88);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke_2;
    v6[3] = &unk_1E60A6F00;
    v6[4] = *(void *)(v1 + 40);
    return [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

void __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithFormat:@"%@: %@", v7, v6];

  [v4 addObject:v8];
}

- (void)updateTimingStatisticForKey:(id)a3 duration:(double)a4 recordCount:(unint64_t)a5 error:(BOOL)a6 cancelled:(BOOL)a7
{
  id v12 = a3;
  timingStatisticQueue = self->_timingStatisticQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__CPLEnginePushRepository_updateTimingStatisticForKey_duration_recordCount_error_cancelled___block_invoke;
  block[3] = &unk_1E60A6ED8;
  block[4] = self;
  id v16 = v12;
  double v17 = a4;
  unint64_t v18 = a5;
  BOOL v19 = a6;
  BOOL v20 = a7;
  id v14 = v12;
  dispatch_sync(timingStatisticQueue, block);
}

void __92__CPLEnginePushRepository_updateTimingStatisticForKey_duration_recordCount_error_cancelled___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(_CPLTimingStatistic);
    [*(id *)(*(void *)(a1 + 32) + 88) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v2 = v3;
  }
  id v4 = v2;
  [v2 updateWithDuration:*(void *)(a1 + 56) recordCount:*(unsigned __int8 *)(a1 + 64) error:*(unsigned __int8 *)(a1 + 65) cancelled:*(double *)(a1 + 48)];
}

- (unint64_t)maximumResourceSizePerBatchForRemainingTime:(double)a3
{
  id v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 engineLibrary];
  id v7 = [v6 systemMonitor];

  if (![v7 isOnCellularOrUnknown])
  {
    if (a3 < 10.0)
    {
      unint64_t v9 = 10485760;
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uploadRateQueue = self->_uploadRateQueue;
    uint64_t v16 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__CPLEnginePushRepository_maximumResourceSizePerBatchForRemainingTime___block_invoke;
    block[3] = &unk_1E60A6EB0;
    block[4] = self;
    void block[5] = &v13;
    block[6] = fmin(a3, 120.0);
    dispatch_sync(uploadRateQueue, block);
    unint64_t v9 = v14[3];
    _Block_object_dispose(&v13, 8);
    goto LABEL_8;
  }
  char v8 = [v7 isDataBudgetOverriden];
  unint64_t v9 = 10485760;
  if (a3 >= 10.0 && (v8 & 1) != 0) {
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

void *__71__CPLEnginePushRepository_maximumResourceSizePerBatchForRemainingTime___block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 80);
  if (result && (result = (void *)[result timeIntervalSinceNow], v3 >= -600.0))
  {
    unint64_t v4 = (unint64_t)(*(double *)(*(void *)(a1 + 32) + 96) * *(double *)(a1 + 48));
    if (v4 >= 0x6400000) {
      unint64_t v4 = 104857600;
    }
    if (v4 <= 0xA00000) {
      unint64_t v4 = 10485760;
    }
  }
  else
  {
    unint64_t v4 = 10485760;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void)updateApproximativeUploadRate:(double)a3
{
  if (a3 > 0.0)
  {
    v15[6] = v6;
    v15[7] = v5;
    v15[14] = v3;
    v15[15] = v4;
    uploadRateQueue = self->_uploadRateQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__CPLEnginePushRepository_updateApproximativeUploadRate___block_invoke;
    v15[3] = &unk_1E60A6598;
    v15[4] = self;
    *(double *)&v15[5] = a3;
    dispatch_async(uploadRateQueue, v15);
    v10 = [(CPLEngineStorage *)self engineStore];
    id v11 = [v10 engineLibrary];
    id v12 = [v11 scheduler];
    uint64_t v13 = [v12 predictor];
    id v14 = [NSNumber numberWithLongLong:(uint64_t)a3];
    [v13 updatePredictedValue:v14 forType:@"uploadSpeed"];
  }
}

double __57__CPLEnginePushRepository_updateApproximativeUploadRate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 96) = result;
  return result;
}

- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasAnyChangeWithRelatedScopedIdentifier:v4];

  return v6;
}

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 hasChangesWithRelatedScopedIdentifier:v6 class:a4];

  return (char)a4;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 allChangesWithScopeIdentifier:v4];

  return v6;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CPLEngineStorage *)self platformObject];
  char v8 = [v7 allChangesWithClass:a3 relatedScopedIdentifier:v6];

  return v8;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 changeWithScopedIdentifier:v4];

  return v6;
}

- (CPLBatchExtractionStrategy)extractionStrategy
{
  return self->_extractionStrategy;
}

- (void)setExtractionStrategy:(id)a3
{
  uint64_t v5 = (CPLBatchExtractionStrategy *)a3;
  extractionStrategy = self->_extractionStrategy;
  if (extractionStrategy != v5)
  {
    if (v5)
    {
      lastStrategyName = self->_lastStrategyName;
      self->_lastStrategyName = 0;
    }
    else
    {
      lastStrategyName = [(CPLBatchExtractionStrategy *)extractionStrategy name];
      char v8 = (NSString *)[lastStrategyName copy];
      unint64_t v9 = self->_lastStrategyName;
      self->_lastStrategyName = v8;
    }
    objc_storeStrong((id *)&self->_extractionStrategy, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 checkInBatchStorage:v6 error:a4];

  return (char)a4;
}

- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(CPLEngineStorage *)self platformObject];
  id v7 = [v6 checkOutBatchStorageWithPriority:a3 error:a4];

  return v7;
}

- (BOOL)resetPriorityForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v11 resetPriorityForScopeWithIdentifier:v10 maxCount:a4 hasMore:a5 error:a6];

  return (char)a6;
}

- (BOOL)reinjectChange:(id)a3 priority:(unint64_t)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [v9 _pushContext];
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      double v17 = __CPLStorageOSLogDomain_903();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v9;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "%@ should have a push context here", buf, 0xCu);
      }
    }
    unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
    [v18 handleFailureInMethod:a2, self, v19, 254, @"%@ should have a push context here", v9 object file lineNumber description];

    abort();
  }
  id v11 = v10;
  if ([v10 priority] > a4)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v20 = __CPLStorageOSLogDomain_903();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v25 = v9;
        __int16 v26 = 2048;
        unint64_t v27 = a4;
        __int16 v28 = 2048;
        uint64_t v29 = [v11 priority];
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Trying to re-inject %@ with priority %lu while its priority is already %lu", buf, 0x20u);
      }
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
    [v21 handleFailureInMethod:a2, self, v22, 255, @"Trying to re-inject %@ with priority %lu while its priority is already %lu", v9, a4, objc_msgSend(v11, "priority") object file lineNumber description];

    abort();
  }
  id v12 = (void *)[v11 copyContextWithPriority:a4];
  [v9 _setPushContext:v12];
  uint64_t v13 = [v9 dequeueOrder];
  char v23 = 0;
  if (!_CPLSilentLogging)
  {
    id v14 = __CPLStorageOSLogDomain_903();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v9;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = [v11 priority];
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Re-injecting %@ with priority %lu (previously was %lu)", buf, 0x20u);
    }
  }
  BOOL v15 = [(CPLEnginePushRepository *)self reinjectChange:v9 dequeueOrder:v13 overwrittenRecord:&v23 error:a5];

  return v15;
}

- (id)storedExtractedBatch
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  uint64_t v3 = [v2 storedExtractedBatch];

  return v3;
}

- (BOOL)reinjectExtractedBatch:(id)a3 overwrittenRecordIdentifiers:(id *)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(CPLEngineStorage *)self engineStore];
  id v11 = [v10 resourceStorage];
  id v12 = [v11 fileStorage];
  [v12 setTrackAllStoresAndDeletesUntilEndOfTransaction:1];

  uint64_t v13 = [v9 clientCacheIdentifier];
  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      v35 = __CPLStorageOSLogDomain_903();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_ERROR, "Can't re-inject an extracted batch without a client cache identifier", buf, 2u);
      }
    }
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
    [v36 handleFailureInMethod:a2 object:self file:v37 lineNumber:214 description:@"Can't re-inject an extracted batch without a client cache identifier"];

    abort();
  }
  id v14 = (void *)v13;
  BOOL v15 = [(CPLEngineStorage *)self engineStore];
  uint64_t v16 = [v15 clientCacheIdentifier];

  if (v16 && ([v14 isEqual:v16] & 1) != 0)
  {
    v38 = a4;
    v39 = v14;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v40 = v9;
    unint64_t v18 = [v9 batch];
    BOOL v19 = [v18 records];

    BOOL v20 = [MEMORY[0x1E4F1C9C8] date];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;
    uint64_t v23 = [v19 count];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v24 = v19;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = v23 + (uint64_t)v22;
      uint64_t v28 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          buf[0] = 0;
          if (![(CPLEnginePushRepository *)self reinjectChange:v30 dequeueOrder:v27 overwrittenRecord:buf error:a5])
          {

            BOOL v32 = 0;
            id *v38 = v17;
            goto LABEL_21;
          }
          if (buf[0])
          {
            v31 = [v30 scopedIdentifier];
            [v17 addObject:v31];
          }
          --v27;
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    id *v38 = v17;
    [(CPLEnginePushRepository *)self notePushRepositoryStoredSomeChanges];
    BOOL v32 = 1;
LABEL_21:

    id v14 = v39;
    id v9 = v40;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v33 = __CPLStorageOSLogDomain_903();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v33, OS_LOG_TYPE_ERROR, "Ignoring extracted batch for re-inject because a reset sync has happened after the extraction", buf, 2u);
      }
    }
    *a4 = (id)MEMORY[0x1E4F1CBF0];
    BOOL v32 = 1;
  }

  return v32;
}

- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    char v8 = [(CPLEngineStorage *)self engineStore];
    id v9 = [v8 clientCacheIdentifier];

    id v10 = [v7 clientCacheIdentifier];

    if (v10)
    {
      unint64_t v11 = v9;
      id v12 = [v7 clientCacheIdentifier];
      unint64_t v13 = (unint64_t)v12;
      if (v11 && v12)
      {
        char v14 = [(id)v11 isEqual:v12];

        if ((v14 & 1) == 0) {
          goto LABEL_6;
        }
      }
      else
      {

        if (v11 | v13)
        {
LABEL_6:
          if (!_CPLSilentLogging)
          {
            BOOL v15 = __CPLStorageOSLogDomain_903();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = [v7 clientCacheIdentifier];
              *(_DWORD *)buf = 138412546;
              unint64_t v27 = v11;
              __int16 v28 = 2112;
              uint64_t v29 = v16;
              _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Trying to store extracted batch with the wrong client cache identifier (%@ vs. %@)", buf, 0x16u);
            }
          }
          id v17 = [MEMORY[0x1E4F28B00] currentHandler];
          unint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
          BOOL v19 = [v7 clientCacheIdentifier];
          [v17 handleFailureInMethod:a2, self, v18, 194, @"Trying to store extracted batch with the wrong client cache identifier (%@ vs. %@)", v11, v19 object file lineNumber description];

          abort();
        }
      }
    }
    else
    {
      if (!v9)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v23 = __CPLStorageOSLogDomain_903();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Trying to store an extracted batch but we don't have a client cache identifier", buf, 2u);
          }
        }
        id v24 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
        [v24 handleFailureInMethod:a2 object:self file:v25 lineNumber:198 description:@"Trying to store an extracted batch but we don't have a client cache identifier"];

        abort();
      }
      [v7 setClientCacheIdentifier:v9];
    }
  }
  BOOL v20 = [(CPLEngineStorage *)self platformObject];
  char v21 = [v20 storeExtractedBatch:v7 error:a4];

  return v21;
}

- (BOOL)deleteAllChangesWithError:(id *)a3
{
  id v4 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a3) = [v4 deleteAllChangesWithError:a3];

  return (char)a3;
}

- (BOOL)discardChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  id v12 = 0;
  int v8 = [v7 deleteChangeWithScopedIdentifier:v6 discardedUploadIdentifier:&v12 error:a4];

  id v9 = v12;
  if (v8 && v9)
  {
    id v10 = [(CPLEnginePushRepository *)self _outgoingResources];
    LOBYTE(v8) = [v10 deleteResourcesToUploadWithUploadIdentifier:v9 error:a4];
  }
  return v8;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasSomeChangeWithScopedIdentifier:v4];

  return v6;
}

- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 overwrittenRecord:(BOOL *)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = [v11 _pushContext];
  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v23 = __CPLStorageOSLogDomain_903();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v11;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "%@ should come with a push context", buf, 0xCu);
      }
    }
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
    [v24 handleFailureInMethod:a2, self, v25, 149, @"%@ should come with a push context", v11 object file lineNumber description];

    abort();
  }
  unint64_t v13 = (void *)v12;
  if ([v11 supportsResources])
  {
    if ([v11 hasChangeType:8])
    {
      char v14 = [v13 uploadIdentifier];

      if (!v14)
      {
        if (!_CPLSilentLogging)
        {
          char v21 = __CPLStorageOSLogDomain_903();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v11;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Trying to reinject %@ without an upload identifier", buf, 0xCu);
          }
        }
        if (a6)
        {
          +[CPLErrors cplErrorWithCode:100 description:@"Trying to reinject a resourceful change without an upload identifier"];
          id v17 = 0;
          BOOL v20 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        id v17 = 0;
        goto LABEL_18;
      }
    }
  }
  BOOL v15 = [(CPLEngineStorage *)self platformObject];
  id v26 = 0;
  int v16 = [v15 reinjectChange:v11 dequeueOrder:a4 discardedUploadIdentifier:&v26 overwrittenRecord:a5 error:a6];
  id v17 = v26;

  if (v16 && v17)
  {
    unint64_t v18 = [(CPLEnginePushRepository *)self _outgoingResources];
    char v19 = [v18 deleteResourcesToUploadWithUploadIdentifier:v17 error:a6];

    if ((v19 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_19;
  }
LABEL_10:
  [(CPLBatchExtractionStrategy *)self->_extractionStrategy resetConditionallyFromNewIncomingChange:v11];
  [(CPLEnginePushRepository *)self notePushRepositoryStoredSomeChanges];
  BOOL v20 = 1;
LABEL_19:

  return v20;
}

- (BOOL)storeChange:(id)a3 pushContext:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      double v22 = __CPLStorageOSLogDomain_903();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v9;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "%@ should be pushed with push context", buf, 0xCu);
      }
    }
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    id v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m"];
    [v23 handleFailureInMethod:a2, self, v24, 123, @"%@ should be pushed with push context", v9 object file lineNumber description];

    abort();
  }
  id v11 = v10;
  if ([v9 supportsResources])
  {
    if ([v9 hasChangeType:8])
    {
      uint64_t v12 = [v11 uploadIdentifier];

      if (!v12)
      {
        uint64_t v13 = [v11 pushContextAddingUploadIdentifier];

        id v11 = (void *)v13;
      }
    }
  }
  char v14 = [(CPLEngineStorage *)self platformObject];
  id v28 = 0;
  int v15 = [v14 storeChange:v9 pushContext:v11 discardedUploadIdentifier:&v28 error:a5];
  id v16 = v28;

  if (!v15 || !v16)
  {
    if (!v15) {
      goto LABEL_9;
    }
LABEL_11:
    [(CPLBatchExtractionStrategy *)self->_extractionStrategy resetConditionallyFromNewIncomingChange:v9];
    pushObservers = self->_pushObservers;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__CPLEnginePushRepository_storeChange_pushContext_error___block_invoke;
    v25[3] = &unk_1E60A6E80;
    id v26 = v9;
    id v27 = v11;
    [(NSMutableDictionary *)pushObservers enumerateKeysAndObjectsUsingBlock:v25];
    [(CPLEnginePushRepository *)self notePushRepositoryStoredSomeChanges];

    BOOL v19 = 1;
    goto LABEL_12;
  }
  id v17 = [(CPLEnginePushRepository *)self _outgoingResources];
  char v18 = [v17 deleteResourcesToUploadWithUploadIdentifier:v16 error:a5];

  if (v18) {
    goto LABEL_11;
  }
LABEL_9:
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

uint64_t __57__CPLEnginePushRepository_storeChange_pushContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a3 + 16))(a3, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)hasChangesWithScopeFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasChangesWithScopeFilter:v4];

  return v6;
}

- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a3) = [v7 hasChangesWithPriorityGreaterThanPriority:a3 inScopeWithIdentifier:v6];

  return a3;
}

- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a3) = [v7 hasChangesWithPriorityLowerThanPriority:a3 inScopeWithIdentifier:v6];

  return a3;
}

- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 minimumPriorityForChangesInScopeWithIdentifier:v4];

  return v6;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasChangesInScopeWithIdentifier:v4];

  return v6;
}

- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 countOfChangesInScopeWithIdentifier:v4];

  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = [(CPLEngineStorage *)self platformObject];
  id v25 = 0;
  LODWORD(a4) = [v11 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 discardedUploadIdentifiers:&v25 error:a6];
  id v12 = v25;

  if (a4)
  {
    if ([v12 count])
    {
      uint64_t v13 = [(CPLEnginePushRepository *)self _outgoingResources];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            if (!objc_msgSend(v13, "deleteResourcesToUploadWithUploadIdentifier:error:", *(void *)(*((void *)&v21 + 1) + 8 * i), a6, (void)v21))
            {
              BOOL v19 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      BOOL v19 = 1;
LABEL_14:
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)notePushRepositoryStoredSomeChanges
{
  id v2 = [(CPLEngineStorage *)self engineStore];
  [v2 notePushRepositoryStoredSomeChanges];
}

- (id)_outgoingResources
{
  id v2 = [(CPLEngineStorage *)self engineStore];
  uint64_t v3 = [v2 outgoingResources];

  return v3;
}

- (unint64_t)scopeType
{
  return 1;
}

- (CPLEnginePushRepository)initWithEngineStore:(id)a3 name:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CPLEnginePushRepository;
  id v4 = [(CPLEngineStorage *)&v14 initWithEngineStore:a3 name:a4];
  if (v4)
  {
    uint64_t v5 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.uploadrate", v5);
    uploadRateQueue = v4->_uploadRateQueue;
    v4->_uploadRateQueue = (OS_dispatch_queue *)v6;

    int v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.timingstatistic", v8);
    timingStatisticQueue = v4->_timingStatisticQueue;
    v4->_timingStatisticQueue = (OS_dispatch_queue *)v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    timingStatistics = v4->_timingStatistics;
    v4->_timingStatistics = v11;
  }
  return v4;
}

@end
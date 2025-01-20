@interface HDHeadphoneAudioExposureBucketCollection
- (BOOL)isDirty;
- (HDHeadphoneAudioExposureBucketCollection)init;
- (HDHeadphoneAudioExposureBucketCollection)initWithBuckets:(id)a3;
- (id)_bucketsWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5;
- (id)_lock_snapshotStatisticsForNowDate:(id)a3 error:(id *)a4;
- (id)_lock_updateWithSampleBatch:(id)a3 error:(id *)a4;
- (id)_updateWithSampleBatch:(id)a3 needsRebuild:(BOOL *)a4 error:(id *)a5;
- (id)copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5;
- (id)snapshotStatisticsForNowDate:(id)a3 error:(id *)a4;
- (id)unitTesting_snapshotBuckets;
- (void)clear;
- (void)insertBuckets:(id)a3;
- (void)pruneWithNowDate:(id)a3;
- (void)setDirty:(BOOL)a3;
@end

@implementation HDHeadphoneAudioExposureBucketCollection

- (HDHeadphoneAudioExposureBucketCollection)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDHeadphoneAudioExposureBucketCollection;
  v2 = [(HDHeadphoneAudioExposureBucketCollection *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    storage = v2->_storage;
    v2->_storage = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (HDHeadphoneAudioExposureBucketCollection)initWithBuckets:(id)a3
{
  id v4 = a3;
  v5 = [(HDHeadphoneAudioExposureBucketCollection *)self init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    storage = v5->_storage;
    v5->_storage = v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    [(HDHeadphoneAudioExposureBucketCollection *)v5 insertBuckets:v4];
    v8 = v5;
  }

  return v5;
}

- (id)copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = self->_storage;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v21 + 1) + 8 * v15) copyWithEarliestStartDate:v8 resetDoseToZero:v6 error:a5];
        if (!v16)
        {
          os_unfair_lock_unlock(p_lock);
          v19 = 0;
          goto LABEL_11;
        }
        v17 = (void *)v16;
        [v9 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  id v18 = objc_alloc((Class)objc_opt_class());
  v11 = (NSMutableArray *)[v9 copy];
  v19 = (void *)[v18 initWithBuckets:v11];
LABEL_11:

  return v19;
}

- (id)snapshotStatisticsForNowDate:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = [(HDHeadphoneAudioExposureBucketCollection *)self _lock_snapshotStatisticsForNowDate:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)_lock_snapshotStatisticsForNowDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  storage = self->_storage;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__HDHeadphoneAudioExposureBucketCollection__lock_snapshotStatisticsForNowDate_error___block_invoke;
  v12[3] = &unk_264795E30;
  id v8 = v6;
  id v13 = v8;
  id v9 = [(NSMutableArray *)storage hk_firstObjectPassingTest:v12];
  if (v9
    || ([(NSMutableArray *)self->_storage lastObject],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = [v9 snapshotStatisticsWithError:a4];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"missing all buckets");
    v10 = 0;
  }

  return v10;
}

uint64_t __85__HDHeadphoneAudioExposureBucketCollection__lock_snapshotStatisticsForNowDate_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 dateInterval];
  uint64_t v4 = [v3 containsDate:*(void *)(a1 + 32)];

  return v4;
}

- (void)clear
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_storage removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)pruneWithNowDate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  storage = self->_storage;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke;
  v9[3] = &unk_264795E58;
  id v10 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableArray *)storage enumerateObjectsUsingBlock:v9];
  [(NSMutableArray *)self->_storage removeObjectsAtIndexes:v7];
  os_unfair_lock_unlock(&self->_lock);
}

void __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 isExpiredForNowDate:*(void *)(a1 + 32)])
  {
    unint64_t v5 = [*(id *)(a1 + 40) count];
    if (v5 >= [*(id *)(*(void *)(a1 + 48) + 8) count] - 1)
    {
      _HKInitializeLogging();
      id v7 = *MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
        __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke_cold_1(v7);
      }
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      [v6 addIndex:a3];
    }
  }
}

- (void)insertBuckets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableArray *)self->_storage addObjectsFromArray:v4];
    [(NSMutableArray *)self->_storage sortUsingComparator:&__block_literal_global_2];
    os_unfair_lock_unlock(&self->_lock);
  }
}

uint64_t __58__HDHeadphoneAudioExposureBucketCollection_insertBuckets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 dateInterval];
  id v7 = [v6 endDate];
  id v8 = [v5 dateInterval];
  id v9 = [v8 endDate];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    id v11 = [v4 dateInterval];
    uint64_t v12 = [v11 startDate];
    id v13 = [v5 dateInterval];
    uint64_t v14 = [v13 startDate];
    uint64_t v10 = [v12 compare:v14];
  }
  return v10;
}

- (id)_updateWithSampleBatch:(id)a3 needsRebuild:(BOOL *)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v10 = [(HDHeadphoneAudioExposureBucketCollection *)self _lock_updateWithSampleBatch:v9 error:a5];

  if (([v10 includedSeries] & 1) == 0) {
    self->_dirty = 1;
  }
  if (v10) {
    id v11 = (void *)[(NSMutableArray *)self->_storage copy];
  }
  else {
    id v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  if (self->_dirty)
  {
    if (a4)
    {
      *a4 = 1;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v12 = *MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
        -[HDHeadphoneAudioExposureBucketCollection _updateWithSampleBatch:needsRebuild:error:](v12);
      }
    }
  }

  return v11;
}

- (id)_bucketsWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = self->_storage;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithEarliestStartDate:resetDoseToZero:error:", v8, v6, a5, (void)v20);
        if (!v16)
        {
          os_unfair_lock_unlock(p_lock);

          id v18 = 0;
          goto LABEL_11;
        }
        v17 = (void *)v16;
        [v9 addObject:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  id v18 = (void *)[v9 copy];
LABEL_11:

  return v18;
}

- (id)_lock_updateWithSampleBatch:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v7 = [v6 samples];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = +[HDHeadphoneExposureStatisticUpdateResult resultForAggregation];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = self->_storage;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "updateWithSampleBatch:error:", v6, a4, (void)v19);
          if (!v15)
          {

            id v17 = 0;
            goto LABEL_12;
          }
          uint64_t v16 = (void *)v15;
          [v9 combineWithResult:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v17 = v9;
LABEL_12:
  }
  else
  {
    id v17 = +[HDHeadphoneExposureStatisticUpdateResult resultForEmptySamplesAdded];
  }

  return v17;
}

- (id)unitTesting_snapshotBuckets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_storage hk_map:&__block_literal_global_291];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

id __71__HDHeadphoneAudioExposureBucketCollection_unitTesting_snapshotBuckets__block_invoke(uint64_t a1, void *a2)
{
  id v7 = 0;
  v2 = [a2 snapshotStatisticsWithError:&v7];
  id v3 = v7;
  id v4 = v3;
  if (!v2 || v3)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      __71__HDHeadphoneAudioExposureBucketCollection_unitTesting_snapshotBuckets__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }

  return v2;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
}

void __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22615C000, log, OS_LOG_TYPE_FAULT, "Refusing to prune last bucket from memory cache.", v1, 2u);
}

- (void)_updateWithSampleBatch:(os_log_t)log needsRebuild:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22615C000, log, OS_LOG_TYPE_ERROR, "Unable to request rebuild after partially apply sample batch to calculator.", v1, 2u);
}

void __71__HDHeadphoneAudioExposureBucketCollection_unitTesting_snapshotBuckets__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22615C000, a2, OS_LOG_TYPE_FAULT, "Failed to compute current statistics: %@", (uint8_t *)&v2, 0xCu);
}

@end
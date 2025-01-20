@interface HDQuantitySeriesManager
- (BOOL)discardSeries:(id)a3 error:(id *)a4;
- (BOOL)insertValues:(id)a3 series:(id)a4 error:(id *)a5;
- (HDProfile)profile;
- (HDQuantitySeriesManager)init;
- (HDQuantitySeriesManager)initWithProfile:(id)a3;
- (id)_observersForType:(os_unfair_lock_s *)a1;
- (id)_synchronousObserversForType:(os_unfair_lock_s *)a1;
- (id)freezeSeries:(id)a3 metadata:(id)a4 endDate:(id)a5 error:(id *)a6;
- (void)_notifyForValues:(void *)a3 series:(void *)a4 anchor:(char)a5 journaled:;
- (void)_notifyObserver:(void *)a3 samplesAdded:(void *)a4 anchor:quantityCount:journaled:;
- (void)_notifyObserver:(void *)a3 values:(void *)a4 series:(void *)a5 anchor:(uint64_t)a6 journaled:;
- (void)_runOnCommitOfTransaction:(void *)a3 block:;
- (void)_synchronousNotifyForValues:(os_unfair_lock_s *)a1 series:(void *)a2 anchor:(void *)a3 journaled:(void *)a4;
- (void)addObserver:(id)a3 forType:(id)a4 queue:(id)a5;
- (void)addSynchronousObserver:(id)a3 forType:(id)a4;
- (void)removeObserver:(id)a3 forType:(id)a4;
- (void)samplesAdded:(id)a3 type:(id)a4 anchor:(id)a5 transaction:(id)a6;
- (void)samplesJournaled:(id)a3 type:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4 transaction:(id)a5;
@end

@implementation HDQuantitySeriesManager

- (HDQuantitySeriesManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDQuantitySeriesManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDQuantitySeriesManager;
  v5 = [(HDQuantitySeriesManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_observerLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observerLock_observersByType = v6->_observerLock_observersByType;
    v6->_observerLock_observersByType = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observerLock_synchronousObserversByType = v6->_observerLock_synchronousObserversByType;
    v6->_observerLock_synchronousObserversByType = v9;
  }
  return v6;
}

- (BOOL)insertValues:(id)a3 series:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = [WeakRetained database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke;
  v19[3] = &unk_1E62F5A88;
  id v20 = v8;
  id v21 = v9;
  v22 = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_3;
  v15[3] = &unk_1E6301508;
  id v16 = v20;
  id v17 = v21;
  v18 = self;
  id v12 = v21;
  id v13 = v20;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v19 inaccessibilityHandler:v15];

  return (char)a5;
}

uint64_t __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = [a1[6] profile];
  BOOL v9 = +[HDQuantitySampleSeriesEntity insertValues:v6 series:v7 profile:v8 error:a3];

  if (v9
    && (id v10 = a1[5],
        [a1[6] profile],
        v11 = objc_claimAutoreleasedReturnValue(),
        +[HDDataEntity dataEntityForObject:v10 profile:v11 error:a3], id v12 = objc_claimAutoreleasedReturnValue(), v11, v12))
  {
    id v14 = a1[5];
    id v13 = (os_unfair_lock_s *)a1[6];
    id v15 = a1[4];
    id v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
    -[HDQuantitySeriesManager _synchronousNotifyForValues:series:anchor:journaled:](v13, v15, v14, v16);

    id v17 = [v5 protectedDatabase];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_2;
    v21[3] = &unk_1E62F6A40;
    v21[4] = a1[6];
    id v22 = a1[4];
    id v23 = a1[5];
    id v24 = v12;
    id v18 = v12;
    [v17 onCommit:v21 orRollback:0];

    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void)_synchronousNotifyForValues:(os_unfair_lock_s *)a1 series:(void *)a2 anchor:(void *)a3 journaled:(void *)a4
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [v8 quantityType];
    v11 = -[HDQuantitySeriesManager _synchronousObserversForType:](a1, v10);

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__HDQuantitySeriesManager__synchronousNotifyForValues_series_anchor_journaled___block_invoke;
    v12[3] = &unk_1E6301580;
    v12[4] = a1;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    char v16 = 0;
    [v11 notifyObservers:v12];
  }
}

void __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_2(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 56), "persistentID"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDQuantitySeriesManager _notifyForValues:series:anchor:journaled:](v1, v2, v3, v4, 0);
}

- (void)_notifyForValues:(void *)a3 series:(void *)a4 anchor:(char)a5 journaled:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v12 = [v10 quantityType];
    id v13 = -[HDQuantitySeriesManager _observersForType:](a1, v12);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__HDQuantitySeriesManager__notifyForValues_series_anchor_journaled___block_invoke;
    v14[3] = &unk_1E6301580;
    v14[4] = a1;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    char v18 = a5;
    [v13 notifyObservers:v14];
  }
}

BOOL __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_3(void **a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = [a1[6] profile];
  BOOL v8 = +[HDQuantitySampleSeriesEntity insertValues:v5 series:v6 profile:v7 error:a3];

  if (v8)
  {
    -[HDQuantitySeriesManager _synchronousNotifyForValues:series:anchor:journaled:]((os_unfair_lock_s *)a1[6], a1[4], a1[5], 0);
    -[HDQuantitySeriesManager _notifyForValues:series:anchor:journaled:]((os_unfair_lock_s *)a1[6], a1[4], a1[5], 0, 1);
  }
  return v8;
}

- (id)freezeSeries:(id)a3 metadata:(id)a4 endDate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = [a3 UUID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = +[HDQuantitySampleSeriesEntity freezeSeriesWithIdentifier:v12 metadata:v11 endDate:v10 profile:WeakRetained error:a6];

  return v14;
}

- (BOOL)discardSeries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 _frozen])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Cannot discard a frozen series.");
    BOOL v7 = 0;
  }
  else
  {
    BOOL v8 = objc_alloc_init(HDDataDeletionConfiguration);
    [(HDDataDeletionConfiguration *)v8 setGenerateDeletedObjects:0];
    [(HDDataDeletionConfiguration *)v8 setFailIfNotFound:0];
    [(HDDataDeletionConfiguration *)v8 setNotifyObservers:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v10 = [WeakRetained database];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__HDQuantitySeriesManager_discardSeries_error___block_invoke;
    v16[3] = &unk_1E62F5A88;
    v16[4] = self;
    id v17 = v6;
    char v18 = v8;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__HDQuantitySeriesManager_discardSeries_error___block_invoke_2;
    v13[3] = &unk_1E6301508;
    v13[4] = self;
    id v14 = v17;
    id v15 = v18;
    id v11 = v18;
    BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a4 block:v16 inaccessibilityHandler:v13];
  }
  return v7;
}

uint64_t __47__HDQuantitySeriesManager_discardSeries_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  BOOL v7 = [WeakRetained dataManager];
  BOOL v8 = [*(id *)(a1 + 40) UUID];
  v16[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v10 = [v7 deleteObjectsWithUUIDCollection:v9 configuration:*(void *)(a1 + 48) error:a3];

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) quantityType];
    id v15 = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v11 samplesOfTypesWereRemoved:v13 anchor:0 transaction:v5];
  }
  return v10;
}

uint64_t __47__HDQuantitySeriesManager_discardSeries_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v6 = [WeakRetained dataManager];
  BOOL v7 = [*(id *)(a1 + 40) UUID];
  v15[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v9 = [v6 deleteObjectsWithUUIDCollection:v8 configuration:*(void *)(a1 + 48) error:a3];

  if (v9)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) quantityType];
    id v14 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v10 samplesOfTypesWereRemoved:v12 anchor:0 transaction:0];
  }
  return v9;
}

- (void)_notifyObserver:(void *)a3 samplesAdded:(void *)a4 anchor:quantityCount:journaled:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v36 = a3;
  id v45 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v7, "transactionalQuantityInsertHandlerForProfile:journaled:count:");
    v46 = (void (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v44 = [v36 lastObject];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      obuint64_t j = v36;
      uint64_t v40 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v40)
      {
        id v38 = v7;
        uint64_t v39 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v54 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v10 = [v9 codableQuantitySample];
            id v11 = [v10 quantitySeriesDatas];

            if (v11)
            {
              uint64_t v42 = i;
              id v12 = [v11 lastObject];
              id v13 = [v9 quantityType];
              uint64_t v48 = [v13 canonicalUnit];
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              v41 = v11;
              id v43 = v11;
              uint64_t v14 = [v43 countByEnumeratingWithState:&v49 objects:v57 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v47 = *(void *)v50;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    id v17 = v12;
                    if (*(void *)v50 != v47) {
                      objc_enumerationMutation(v43);
                    }
                    char v18 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                    uint64_t v19 = (void *)MEMORY[0x1C187C0E0]();
                    id v20 = (void *)MEMORY[0x1E4F2B370];
                    [v18 value];
                    id v21 = objc_msgSend(v20, "quantityWithUnit:doubleValue:", v48);
                    id v22 = objc_alloc(MEMORY[0x1E4F28C18]);
                    id v23 = (void *)MEMORY[0x1E4F1C9C8];
                    [v18 startDate];
                    id v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
                    [v18 endDate];
                    double v26 = v25;
                    [v18 startDate];
                    v28 = (void *)[v22 initWithStartDate:v24 duration:v26 - v27];

                    id v12 = v17;
                    BOOL v30 = v44 == v9 && v18 == v17;
                    ((void (**)(void, void *, void *, void *, void *, id, BOOL))v46)[2](v46, v21, v13, v28, v9, v45, v30);
                  }
                  uint64_t v15 = [v43 countByEnumeratingWithState:&v49 objects:v57 count:16];
                }
                while (v15);
              }

              id v7 = v38;
              id v11 = v41;
              uint64_t i = v42;
              v31 = (void *)v48;
            }
            else
            {
              id v32 = objc_alloc(MEMORY[0x1E4F28C18]);
              v33 = [v9 startDate];
              v34 = [v9 endDate];
              id v12 = (void *)[v32 initWithStartDate:v33 endDate:v34];

              id v13 = [v9 quantity];
              v31 = [v9 quantityType];
              ((void (**)(void, void *, void *, void *, void *, id, BOOL))v46)[2](v46, v13, v31, v12, v9, v45, v44 == v9);
            }
          }
          uint64_t v40 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v40);
      }
    }
  }
}

- (void)samplesAdded:(id)a3 type:(id)a4 anchor:(id)a5 transaction:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v29 = a5;
  id v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HDQuantitySeriesManager.m", 159, @"Invalid parameter not satisfying: %@", @"[type isKindOfClass:[HKQuantityType class]]" object file lineNumber description];
  }
  uint64_t v14 = [v11 count];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v39 + 1) + 8 * v19) codableQuantitySample];
        id v21 = [v20 quantitySeriesDatas];

        if (v21) {
          uint64_t v14 = v14 + [v21 count] - 1;
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);
  }

  id v22 = -[HDQuantitySeriesManager _synchronousObserversForType:]((os_unfair_lock_s *)self, v12);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke;
  v35[3] = &unk_1E6301530;
  v35[4] = self;
  id v23 = v15;
  id v36 = v23;
  id v24 = v29;
  id v37 = v24;
  uint64_t v38 = v14;
  [v22 notifyObservers:v35];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_2;
  v30[3] = &unk_1E62F2ED0;
  v30[4] = self;
  id v31 = v12;
  id v32 = v23;
  id v33 = v24;
  uint64_t v34 = v14;
  id v25 = v24;
  id v26 = v23;
  id v27 = v12;
  -[HDQuantitySeriesManager _runOnCommitOfTransaction:block:]((uint64_t)self, v13, v30);
}

- (id)_synchronousObserversForType:(os_unfair_lock_s *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 6;
    id v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
    uint64_t v2 = [*(id *)(v2 + 16) objectForKeyedSubscript:v4];

    os_unfair_lock_unlock(v3);
  }

  return (id)v2;
}

void __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke(uint64_t a1, void *a2)
{
}

void __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = -[HDQuantitySeriesManager _observersForType:](*(os_unfair_lock_s **)(a1 + 32), *(void **)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_3;
  v5[3] = &unk_1E6301530;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 notifyObservers:v5];
}

- (id)_observersForType:(os_unfair_lock_s *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    id v3 = a1 + 6;
    id v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
    uint64_t v2 = [*(id *)(v2 + 8) objectForKeyedSubscript:v4];

    os_unfair_lock_unlock(v3);
  }

  return (id)v2;
}

void __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)_runOnCommitOfTransaction:(void *)a3 block:
{
  id v6 = a2;
  id v5 = a3;
  if (a1)
  {
    if (v6) {
      [v6 onCommit:v5 orRollback:&__block_literal_global_110];
    }
    else {
      v5[2](v5);
    }
  }
}

- (void)samplesJournaled:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDQuantitySeriesManager.m", 188, @"Invalid parameter not satisfying: %@", @"[type isKindOfClass:[HKQuantityType class]]" object file lineNumber description];
  }
  uint64_t v9 = -[HDQuantitySeriesManager _observersForType:]((os_unfair_lock_s *)self, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke;
  v16[3] = &unk_1E6301558;
  v16[4] = self;
  id v10 = v7;
  id v17 = v10;
  [v9 notifyObservers:v16];
  id v11 = -[HDQuantitySeriesManager _synchronousObserversForType:]((os_unfair_lock_s *)self, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke_2;
  v14[3] = &unk_1E6301558;
  v14[4] = self;
  id v15 = v10;
  id v12 = v10;
  [v11 notifyObservers:v14];
}

void __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  [v3 count];
  -[HDQuantitySeriesManager _notifyObserver:samplesAdded:anchor:quantityCount:journaled:](v2, v4, v3, 0);
}

void __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  [v3 count];
  -[HDQuantitySeriesManager _notifyObserver:samplesAdded:anchor:quantityCount:journaled:](v2, v4, v3, 0);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4 transaction:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v18 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2, self, @"HDQuantitySeriesManager.m", 204, @"Invalid parameter not satisfying: %@", @"[type isKindOfClass:[HKQuantityType class]]" object file lineNumber description];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v14 = -[HDQuantitySeriesManager _synchronousObserversForType:]((os_unfair_lock_s *)self, v12);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke;
        v25[3] = &unk_1E6301558;
        id v26 = WeakRetained;
        id v27 = v12;
        id v15 = WeakRetained;
        [v14 notifyObservers:v25];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_2;
  v21[3] = &unk_1E62F4978;
  id v23 = self;
  SEL v24 = a2;
  id v22 = obj;
  id v17 = obj;
  -[HDQuantitySeriesManager _runOnCommitOfTransaction:block:]((uint64_t)self, v18, v21);
}

uint64_t __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 profile:*(void *)(a1 + 32) didDiscardSeriesOfType:*(void *)(a1 + 40)];
}

void __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"HDQuantitySeriesManager.m", 216, @"Invalid parameter not satisfying: %@", @"[type isKindOfClass:[HKQuantityType class]]" object file lineNumber description];
        }
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
        uint64_t v8 = -[HDQuantitySeriesManager _observersForType:](*(os_unfair_lock_s **)(a1 + 40), v6);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_3;
        v12[3] = &unk_1E6301558;
        id v13 = WeakRetained;
        uint64_t v14 = v6;
        id v9 = WeakRetained;
        [v8 notifyObservers:v12];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 profile:*(void *)(a1 + 32) didDiscardSeriesOfType:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3 forType:(id)a4 queue:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_observerLock);
  uint64_t v10 = [(NSMutableDictionary *)self->_observerLock_observersByType objectForKeyedSubscript:v8];
  if (!v10)
  {
    _HKInitializeLogging();
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    id v12 = [NSString stringWithFormat:@"series-observers-%@", v8];
    uint64_t v10 = (void *)[v11 initWithName:v12 loggingCategory:*MEMORY[0x1E4F29F28]];

    [(NSMutableDictionary *)self->_observerLock_observersByType setObject:v10 forKeyedSubscript:v8];
  }
  [v10 registerObserver:v13 queue:v9];
  os_unfair_lock_unlock(&self->_observerLock);
}

- (void)addSynchronousObserver:(id)a3 forType:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_observerLock);
  id v7 = [(NSMutableDictionary *)self->_observerLock_synchronousObserversByType objectForKeyedSubscript:v6];
  if (!v7)
  {
    _HKInitializeLogging();
    id v8 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    id v9 = [NSString stringWithFormat:@"series-observers-%@", v6];
    id v7 = (void *)[v8 initWithName:v9 loggingCategory:*MEMORY[0x1E4F29F28]];

    [(NSMutableDictionary *)self->_observerLock_synchronousObserversByType setObject:v7 forKeyedSubscript:v6];
  }
  [v7 registerObserver:v10];
  os_unfair_lock_unlock(&self->_observerLock);
}

- (void)removeObserver:(id)a3 forType:(id)a4
{
  p_observerLock = &self->_observerLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_observerLock);
  id v9 = [(NSMutableDictionary *)self->_observerLock_observersByType objectForKeyedSubscript:v7];
  [v9 unregisterObserver:v8];

  id v10 = [(NSMutableDictionary *)self->_observerLock_synchronousObserversByType objectForKeyedSubscript:v7];

  [v10 unregisterObserver:v8];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)_notifyObserver:(void *)a3 values:(void *)a4 series:(void *)a5 anchor:(uint64_t)a6 journaled:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v35 = a5;
  if (a1)
  {
    uint64_t v34 = [v13 quantityType];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v11, "transactionalQuantityInsertHandlerForProfile:journaled:count:", WeakRetained, a6, objc_msgSend(v12, "count"));
    id v36 = (void (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      id v30 = WeakRetained;
      id v32 = v11;
      uint64_t v33 = [v12 lastObject];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v31 = v12;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if ([v20 hasDuration])
            {
              [v20 duration];
              if (v21 >= 0.0)
              {
                id v22 = objc_alloc(MEMORY[0x1E4F28C18]);
                id v23 = (void *)MEMORY[0x1E4F1C9C8];
                [v20 timeInterval];
                SEL v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
                [v20 duration];
                id v26 = (void *)[v22 initWithStartDate:v24 duration:v25];

                id v27 = (void *)MEMORY[0x1E4F2B370];
                long long v28 = [v34 canonicalUnit];
                [v20 value];
                long long v29 = objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);

                ((void (**)(void, void *, void *, void *, id, id, BOOL))v36)[2](v36, v29, v34, v26, v13, v35, v33 == v20);
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v17);
      }

      id v12 = v31;
      id v11 = v32;
      id WeakRetained = v30;
    }
  }
}

void __68__HDQuantitySeriesManager__notifyForValues_series_anchor_journaled___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x1C187C0E0]();
  -[HDQuantitySeriesManager _notifyObserver:values:series:anchor:journaled:](*(void *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

void __79__HDQuantitySeriesManager__synchronousNotifyForValues_series_anchor_journaled___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x1C187C0E0]();
  -[HDQuantitySeriesManager _notifyObserver:values:series:anchor:journaled:](*(void *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observerLock_synchronousObserversByType, 0);

  objc_storeStrong((id *)&self->_observerLock_observersByType, 0);
}

@end
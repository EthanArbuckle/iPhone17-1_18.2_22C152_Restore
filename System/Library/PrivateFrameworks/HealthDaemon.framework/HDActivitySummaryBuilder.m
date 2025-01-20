@interface HDActivitySummaryBuilder
- (BOOL)_enumerateActivitySummariesAndCachesWithPredicate:(void *)a3 largestAnchor:(uint64_t)a4 error:(void *)a5 handler:;
- (BOOL)enumerateActivitySummariesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)orderByDateAscending;
- (BOOL)shouldIncludePrivateProperties;
- (BOOL)shouldIncludeStatistics;
- (HDActivitySummaryBuilder)init;
- (HDActivitySummaryBuilder)initWithProfile:(id)a3;
- (HDActivitySummaryBuilder)initWithProfile:(id)a3 filter:(id)a4;
- (HDDatabaseTransactionContext)databaseTransactionContext;
- (int64_t)enumeratedSummaryCount;
- (unint64_t)limit;
- (void)activitySummariesWithPredicate:(id)a3 handler:(id)a4;
- (void)batchedActivitySummariesWithPredicate:(id)a3 maxBatchSize:(unint64_t)a4 handler:(id)a5;
- (void)setDatabaseTransactionContext:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setOrderByDateAscending:(BOOL)a3;
- (void)setShouldIncludePrivateProperties:(BOOL)a3;
- (void)setShouldIncludeStatistics:(BOOL)a3;
@end

@implementation HDActivitySummaryBuilder

- (HDActivitySummaryBuilder)initWithProfile:(id)a3
{
  return [(HDActivitySummaryBuilder *)self initWithProfile:a3 filter:0];
}

- (void)activitySummariesWithPredicate:(id)a3 handler:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  v7 = (void (**)(id, id, id, uint64_t, void))a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = 0;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDActivitySummaryBuilder_activitySummariesWithPredicate_handler___block_invoke;
  v15[3] = &unk_1E62FE840;
  id v11 = v10;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  BOOL v13 = -[HDActivitySummaryBuilder _enumerateActivitySummariesAndCachesWithPredicate:largestAnchor:error:handler:]((uint64_t)self, v8, &v19, (uint64_t)&v18, v15);

  id v14 = v18;
  if (v13) {
    v7[2](v7, v11, v12, v19, 0);
  }
  else {
    ((void (**)(id, id, id, uint64_t, id))v7)[2](v7, 0, 0, 0, v14);
  }
}

void __67__HDActivitySummaryBuilder_activitySummariesWithPredicate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 addObject:v7];
  id v8 = *(void **)(a1 + 40);
  id v9 = NSNumber;
  uint64_t v10 = [v7 _activitySummaryIndex];

  id v11 = [v9 numberWithLongLong:v10];
  [v8 setObject:v6 forKeyedSubscript:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseTransactionContext, 0);
  objc_storeStrong((id *)&self->_filter, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (HDActivitySummaryBuilder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDActivitySummaryBuilder)initWithProfile:(id)a3 filter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDActivitySummaryBuilder;
  id v8 = [(HDActivitySummaryBuilder *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_filter, a4);
    *(_WORD *)&v9->_shouldIncludePrivateProperties = 1;
    v9->_orderByDateAscending = 1;
    v9->_limit = 0;
  }

  return v9;
}

- (BOOL)enumerateActivitySummariesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HDActivitySummaryBuilder_enumerateActivitySummariesWithPredicate_error_handler___block_invoke;
  v11[3] = &unk_1E62FE818;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a4) = -[HDActivitySummaryBuilder _enumerateActivitySummariesAndCachesWithPredicate:largestAnchor:error:handler:]((uint64_t)self, a3, 0, (uint64_t)a4, v11);

  return (char)a4;
}

uint64_t __82__HDActivitySummaryBuilder_enumerateActivitySummariesWithPredicate_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_enumerateActivitySummariesAndCachesWithPredicate:(void *)a3 largestAnchor:(uint64_t)a4 error:(void *)a5 handler:
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v8 = a5;
  if (a1)
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0;
    id v9 = [*(id *)(a1 + 16) filterIgnoringActivityCacheIndexFilter];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke;
    aBlock[3] = &unk_1E62FE890;
    aBlock[4] = a1;
    v50 = v51;
    id v25 = v9;
    id v48 = v25;
    id v49 = v8;
    uint64_t v10 = _Block_copy(aBlock);
    objc_super v11 = [MEMORY[0x1E4F2B2C0] activityCacheType];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v13 = +[HDSampleEntity entityEnumeratorWithType:v11 profile:WeakRetained];

    [v13 setPredicate:v26];
    id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    [v13 setEncodingOption:v14 forKey:@"IncludePrivateActivityCacheProperties"];

    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
    [v13 setEncodingOption:v15 forKey:@"IncludeActivityCacheStatistics"];

    id v16 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"cache_index" entityClass:objc_opt_class() ascending:*(unsigned __int8 *)(a1 + 26)];
    v52[0] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    [v13 setOrderingTerms:v17];

    [v13 setDatabaseTransactionContext:*(void *)(a1 + 40)];
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 1;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0x8000000000000000;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke_292;
    v27[3] = &unk_1E62FE8B8;
    v30 = v38;
    v31 = &v43;
    id v19 = v10;
    id v29 = v19;
    id v20 = v18;
    id v28 = v20;
    v32 = &v34;
    v33 = &v39;
    if ([v13 enumerateWithError:a4 handler:v27])
    {
      v21 = (void *)[v20 copy];
      (*((void (**)(id, void *))v19 + 2))(v19, v21);

      *(void *)(a1 + 48) = v35[3];
      id v20 = 0;
      if (a3) {
        *a3 = v40[3];
      }
      BOOL v22 = 1;
    }
    else
    {
      BOOL v22 = *((unsigned char *)v44 + 24) == 0;
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(v51, 8);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)batchedActivitySummariesWithPredicate:(id)a3 maxBatchSize:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v43 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__80;
  uint64_t v41 = __Block_byref_object_dispose__80;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__80;
  v35 = __Block_byref_object_dispose__80;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HDActivitySummaryBuilder_batchedActivitySummariesWithPredicate_maxBatchSize_handler___block_invoke;
  v18[3] = &unk_1E62FE868;
  unint64_t v24 = a4;
  v21 = &v31;
  BOOL v22 = &v27;
  id v10 = v9;
  v23 = &v37;
  uint64_t v25 = 0;
  id v19 = 0;
  id v20 = v10;
  LODWORD(v9) = -[HDActivitySummaryBuilder _enumerateActivitySummariesAndCachesWithPredicate:largestAnchor:error:handler:]((uint64_t)self, v8, &v43, (uint64_t)&v26, v18);
  id v11 = v26;
  id v12 = v11;
  if (v9)
  {
    id v13 = 0;
    uint64_t v14 = v32[5];
    uint64_t v15 = v38[5];
    uint64_t v16 = v43;
    BOOL v17 = *((unsigned char *)v28 + 24) != 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    BOOL v17 = 0;
    id v13 = v11;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, BOOL, id))v10 + 2))(v10, v14, v15, v16, 1, v17, v13);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

void __87__HDActivitySummaryBuilder_batchedActivitySummariesWithPredicate_maxBatchSize_handler___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  if ((unint64_t)[v5 count] >= a1[9])
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    (*(void (**)(void))(a1[5] + 16))();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = *(void *)(a1[8] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v7];
  uint64_t v14 = *(void **)(*(void *)(a1[8] + 8) + 40);
  uint64_t v15 = NSNumber;
  uint64_t v16 = [v7 _activitySummaryIndex];

  id v17 = [v15 numberWithLongLong:v16];
  [v14 setObject:v6 forKeyedSubscript:v17];
}

BOOL __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = *(void *)(a1[4] + 32);
    if (v4 && *(void *)(*(void *)(a1[7] + 8) + 24) == v4)
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F2ABA8] _mostSignificantCacheAmongCaches:v3];
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F2ABA8]) _initWithActivityCache:v6 shouldIncludePrivateProperties:*(unsigned __int8 *)(a1[4] + 24)];
      id v8 = v7;
      if (*(unsigned char *)(a1[4] + 24))
      {
        uint64_t v9 = [v7 _startDate];
        if (!v9
          || (id v10 = (void *)v9,
              [v8 _endDate],
              id v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              v10,
              !v11))
        {
          _HKInitializeLogging();
          uint64_t v12 = (void *)*MEMORY[0x1E4F29EE8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EE8], OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = v12;
            int v17 = 138413058;
            id v18 = v8;
            __int16 v19 = 2112;
            id v20 = v6;
            __int16 v21 = 2048;
            uint64_t v22 = [v3 count];
            __int16 v23 = 2112;
            id v24 = v3;
            _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "Activity summary without start/end date: %@ from cache: %@ out of %ld caches: %@", (uint8_t *)&v17, 0x2Au);
          }
        }
      }
      uint64_t v13 = a1[5];
      if (!v13 || [MEMORY[0x1E4F2B8E8] filter:v13 acceptsActivitySummary:v8])
      {
        ++*(void *)(*(void *)(a1[7] + 8) + 24);
        LOBYTE(v17) = 0;
        (*(void (**)(void))(a1[6] + 16))(a1[6]);
      }
      unint64_t v14 = *(void *)(a1[4] + 32);
      if (v14) {
        BOOL v5 = *(void *)(*(void *)(a1[7] + 8) + 24) < v14;
      }
      else {
        BOOL v5 = 1;
      }
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

uint64_t __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke_292(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 cacheIndex];
  if (v6 != *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = (void *)[*(id *)(a1 + 32) copy];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    [*(id *)(a1 + 32) removeAllObjects];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  }
  [*(id *)(a1 + 32) addObject:v5];
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v11 = *(void *)(v10 + 24);
  if (v11 <= a3) {
    uint64_t v11 = a3;
  }
  *(void *)(v10 + 24) = v11;
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v12;
}

- (BOOL)shouldIncludePrivateProperties
{
  return self->_shouldIncludePrivateProperties;
}

- (void)setShouldIncludePrivateProperties:(BOOL)a3
{
  self->_shouldIncludePrivateProperties = a3;
}

- (BOOL)shouldIncludeStatistics
{
  return self->_shouldIncludeStatistics;
}

- (void)setShouldIncludeStatistics:(BOOL)a3
{
  self->_shouldIncludeStatistics = a3;
}

- (BOOL)orderByDateAscending
{
  return self->_orderByDateAscending;
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  self->_orderByDateAscending = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (HDDatabaseTransactionContext)databaseTransactionContext
{
  return self->_databaseTransactionContext;
}

- (void)setDatabaseTransactionContext:(id)a3
{
}

- (int64_t)enumeratedSummaryCount
{
  return self->_enumeratedSummaryCount;
}

@end
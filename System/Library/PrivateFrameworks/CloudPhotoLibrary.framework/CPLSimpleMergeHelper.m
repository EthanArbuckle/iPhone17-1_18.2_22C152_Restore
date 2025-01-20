@interface CPLSimpleMergeHelper
+ (id)_mergerWithConflictsForStore:(id)a3 conflictingScopeIdentifiers:(id)a4;
+ (id)_mergerWithNoConflictsForStore:(id)a3;
- (BOOL)_changeCanConflict:(id)a3;
- (CPLEngineStore)store;
- (CPLSimpleMergeHelper)initWithEngineStore:(id)a3;
- (id)mergerForBatch:(id)a3 error:(id *)a4;
@end

@implementation CPLSimpleMergeHelper

- (void).cxx_destruct
{
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (id)mergerForBatch:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CPLEngineStore *)self->_store pullQueue];
  if ([v7 isEmpty])
  {
    v8 = +[CPLSimpleMergeHelper _mergerWithNoConflictsForStore:self->_store];
    goto LABEL_44;
  }
  if (![v7 compactChangeBatchesWithError:a4])
  {
    v8 = 0;
    goto LABEL_44;
  }
  v38 = self;
  v39 = v7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v35 = v6;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v12) {
    goto LABEL_23;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v47 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v17 = [v16 scopedIdentifier];
      v18 = [v17 scopeIdentifier];

      if (([v9 containsObject:v18] & 1) == 0)
      {
        if (([v40 containsObject:v18] & 1) == 0)
        {
          v51 = v18;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
          char v20 = [v39 hasSomeChangeInScopesWithIdentifiers:v19];

          if ((v20 & 1) == 0)
          {
            v21 = v9;
            goto LABEL_17;
          }
          [v40 addObject:v18];
        }
        if ([v10 containsObject:v18]) {
          goto LABEL_21;
        }
        if ([(CPLSimpleMergeHelper *)v38 _changeCanConflict:v16])
        {
          v21 = v10;
LABEL_17:
          [v21 addObject:v18];
          goto LABEL_21;
        }
        v22 = [v16 allRelatedScopedIdentifiers];
        if ([v22 count]) {
          [v37 unionSet:v22];
        }
      }
LABEL_21:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
  }
  while (v13);
LABEL_23:

  v7 = v39;
  if ([v37 count])
  {
    v23 = v10;
    v36 = [(CPLEngineStore *)v38->_store idMapping];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v24 = v37;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v43;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v30 = [v29 scopeIdentifier];
          if (([v23 containsObject:v30] & 1) == 0)
          {
            char v41 = 0;
            v31 = [v36 cloudScopedIdentifierForLocalScopedIdentifier:v29 isFinal:&v41];
            if (!v31) {
              v31 = (void *)[v29 copy];
            }
            if ([v39 hasSomeChangeWithScopedIdentifier:v31])
            {
              [v23 addObject:v30];

              goto LABEL_39;
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_39:

    id v10 = v23;
  }
  uint64_t v32 = [v10 count];
  store = v38->_store;
  if (v32) {
    +[CPLSimpleMergeHelper _mergerWithConflictsForStore:store conflictingScopeIdentifiers:v10];
  }
  else {
  v8 = +[CPLSimpleMergeHelper _mergerWithNoConflictsForStore:store];
  }
  id v6 = v35;

LABEL_44:
  return v8;
}

- (BOOL)_changeCanConflict:(id)a3
{
  id v3 = a3;
  if ([v3 isAssetChange]) {
    BOOL v4 = [v3 changeType] != 2;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (CPLSimpleMergeHelper)initWithEngineStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleMergeHelper;
  id v6 = [(CPLSimpleMergeHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

+ (id)_mergerWithConflictsForStore:(id)a3 conflictingScopeIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [CPLSimpleMerger alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__CPLSimpleMergeHelper__mergerWithConflictsForStore_conflictingScopeIdentifiers___block_invoke;
  v12[3] = &unk_1E60AB750;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [(CPLSimpleMerger *)v7 initWithMergeBlock:v12];

  return v10;
}

uint64_t __81__CPLSimpleMergeHelper__mergerWithConflictsForStore_conflictingScopeIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [*(id *)(a1 + 32) scopes];
  id v5 = [v4 filterForIncludedScopeIdentifiers:*(void *)(a1 + 40)];

  if (!_CPLSilentLogging)
  {
    if (__CPLMergerOSLogDomain_onceToken != -1) {
      dispatch_once(&__CPLMergerOSLogDomain_onceToken, &__block_literal_global_10384);
    }
    id v6 = (void *)__CPLMergerOSLogDomain_result;
    if (os_log_type_enabled((os_log_t)__CPLMergerOSLogDomain_result, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 pullQueue];
      uint64_t v10 = [v9 countOfQueuedBatches];
      uint64_t v11 = [*(id *)(a1 + 40) count];
      int v19 = 134218240;
      uint64_t v20 = v10;
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning pull queue (%lu batches) of %lu scopes, transient repository and reset mingled records in the cloud cache", (uint8_t *)&v19, 0x16u);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) pullQueue];
  int v13 = [v12 deleteAllChangesWithScopeFilter:v5 error:a2];

  if (v13
    && ([*(id *)(a1 + 32) transientPullRepository],
        id v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 resetMingledRecordsWithScopeFilter:v5 error:a2],
        v14,
        v15))
  {
    v16 = [*(id *)(a1 + 32) cloudCache];
    uint64_t v17 = [v16 discardStagedChangesWithScopeFilter:v5 error:a2];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)_mergerWithNoConflictsForStore:(id)a3
{
  id v3 = [[CPLSimpleMerger alloc] initWithMergeBlock:0];
  return v3;
}

@end
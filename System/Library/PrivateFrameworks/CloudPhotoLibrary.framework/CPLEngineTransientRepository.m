@interface CPLEngineTransientRepository
+ (id)orderedClassesForChanges;
+ (id)orderedClassesForChangesForLargeSync;
+ (id)orderedClassesForDelete;
- (BOOL)_appendBatchToStorage:(id)a3 alreadyMingled:(BOOL)a4 countOfAssetChanges:(unint64_t *)a5 error:(id *)a6;
- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 countOfAssetChanges:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3;
- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3;
- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3;
- (BOOL)hasUnmingledChanges;
- (BOOL)hasUnmingledChangesForScope:(id)a3;
- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3;
- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3;
- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6;
- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)resetTransientRepositoryForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)shouldKeepDeleteChange:(id)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6;
- (CPLEngineTransientRepository)initWithEngineStore:(id)a3 name:(id)a4;
- (id)_sharedDeleteFromDelete:(id)a3;
- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)allUnmingledChangesWithScopeIdentifier:(id)a3;
- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)batchStorageForScope:(id)a3;
- (id)cachedRecordWithScopedIdentifier:(id)a3;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4;
- (id)status;
- (id)unmingledChangeWithScopedIdentifier:(id)a3;
- (unint64_t)countOfUnmingledRecords;
- (unint64_t)maximumCountOfRecordsInBatches;
- (unint64_t)scopeType;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setMaximumCountOfRecordsInBatches:(unint64_t)a3;
@end

@implementation CPLEngineTransientRepository

- (void).cxx_destruct
{
}

- (unint64_t)maximumCountOfRecordsInBatches
{
  return self->_maximumCountOfRecordsInBatches;
}

- (id)status
{
  v6.receiver = self;
  v6.super_class = (Class)CPLEngineTransientRepository;
  v3 = [(CPLEngineStorage *)&v6 status];
  v4 = (void *)[v3 mutableCopy];

  if ([(NSMutableArray *)self->_observers count]) {
    objc_msgSend(v4, "appendFormat:", @"\n%lu observers", -[NSMutableArray count](self->_observers, "count"));
  }
  return v4;
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineTransientRepository;
  BOOL v4 = [(CPLEngineStorage *)&v9 openWithError:a3];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int64_t v6 = [v5 integerForKey:@"CPLMaximumSizeForPulledBatches"];

    if (v6 >= 1)
    {
      if (!_CPLSilentLogging)
      {
        v7 = __CPLStorageOSLogDomain_8796();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int64_t v11 = v6;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Will give batches with a maximum size of %lu", buf, 0xCu);
        }
      }
      self->_maximumCountOfRecordsInBatches = v6;
    }
  }
  return v4;
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasStashedChangesForScopeWithIdentifier:v4];

  return v6;
}

- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  int64_t v11 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v11 unstashRecordsForScopeWithIdentifier:v10 maxCount:a4 hasMore:a5 error:a6];

  return (char)a6;
}

- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 stashChangeWithScopedIdentifier:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasUnmingledOrStashedRecordsWithScopeFilter:v4];

  return v6;
}

- (BOOL)resetTransientRepositoryForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    v7 = __CPLStorageOSLogDomain_8796();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int64_t v11 = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Deleting all transient changes in storage", v11, 2u);
    }
  }
  v8 = [(CPLEngineStorage *)self platformObject];
  char v9 = [v8 deleteAllRecordsForScopeWithIdentifier:v6 error:a4];

  return v9;
}

- (unint64_t)countOfUnmingledRecords
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfUnmingledRecords];

  return v3;
}

- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    v7 = __CPLStorageOSLogDomain_8796();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int64_t v11 = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Deleting mingled records", v11, 2u);
    }
  }
  v8 = [(CPLEngineStorage *)self platformObject];
  char v9 = [v8 deleteMingledRecordsForScopeWithIdentifier:v6 error:a4];

  return v9;
}

- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 resetMingledRecordsWithScopeFilter:v6 error:a4];

  if (v8)
  {
    observers = self->_observers;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__CPLEngineTransientRepository_resetMingledRecordsWithScopeFilter_error___block_invoke;
    v11[3] = &unk_1E60A7E90;
    v11[4] = self;
    id v12 = v6;
    [(NSMutableArray *)observers enumerateObjectsUsingBlock:v11];
  }
  return v8;
}

uint64_t __73__CPLEngineTransientRepository_resetMingledRecordsWithScopeFilter_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 transientRepository:*(void *)(a1 + 32) didResetMingledRecordsForScopesWithFiler:*(void *)(a1 + 40)];
}

- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasOnlyMingledRecordsWithScopeIdentifier:v4];

  return v6;
}

- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasUnmingledNonStashedRecordsForScopeWithIdentifier:v4];

  return v6;
}

- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasMingledRecordsForScopeWithIdentifier:v4];

  return v6;
}

- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 markUnmingledChangeWithScopedIdentifierAsMingled:v6 error:a4];

  return (char)a4;
}

- (id)allUnmingledChangesWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 allUnmingledChangesWithScopeIdentifier:v4];

  return v6;
}

- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 allUnmingledChangesWithClass:a3 relatedScopedIdentifier:v6];

  return v8;
}

- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 allUnmingledDeletedChangesWithClass:a3 scopeIdentifier:v6];

  return v8;
}

- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 allUnmingledNonDeletedChangesWithClass:a3 scopeIdentifier:v6];

  return v8;
}

- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 allUnmingledChangesWithClass:a3 scopeIdentifier:v6];

  return v8;
}

- (id)unmingledChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 unmingledChangeWithScopedIdentifier:v4];

  return v6;
}

- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  int64_t v11 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v11 popChangeBatchOfRemappedRecords:a3 scope:v10 maximumCount:a5 error:a6];

  return (char)a6;
}

- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 nextBatchOfRemappedRecordsInScope:v6 maximumCount:a4];

  return v8;
}

- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 countOfAssetChanges:(unint64_t *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!_CPLSilentLogging)
  {
    int64_t v11 = __CPLStorageOSLogDomain_8796();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      uint64_t v15 = [v10 count];
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Adding %lu records in disk storage", (uint8_t *)&v14, 0xCu);
    }
  }
  if (a5) {
    *a5 = 0;
  }
  BOOL v12 = [(CPLEngineTransientRepository *)self _appendBatchToStorage:v10 alreadyMingled:v8 countOfAssetChanges:a5 error:a6];

  return v12;
}

- (BOOL)_appendBatchToStorage:(id)a3 alreadyMingled:(BOOL)a4 countOfAssetChanges:(unint64_t *)a5 error:(id *)a6
{
  BOOL v46 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v52 = objc_alloc_init(CPLChangeBatch);
  v56 = self;
  char v9 = [(CPLEngineStorage *)self engineStore];
  v50 = [v9 remappedRecords];
  id v10 = [v9 sharingScopeIdentifier];
  v47 = v9;
  v49 = [v9 ignoredRecords];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v8;
  uint64_t v54 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v54)
  {
    SEL v44 = a2;
    id v11 = 0;
    unint64_t v55 = 0;
    uint64_t v53 = *(void *)v60;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v60 != v53) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v59 + 1) + 8 * v12);
      int v14 = (void *)MEMORY[0x1BA993DF0]();
      uint64_t v15 = [v13 scopedIdentifier];
      uint64_t v16 = [v15 scopeIdentifier];
      v17 = [(CPLEngineStorage *)v56 mainScopeIdentifier];
      int v18 = [v16 isEqualToString:v17];

      if ((v18 & 1) == 0 && v10)
      {
        v19 = [v15 scopeIdentifier];
        int v18 = [v19 isEqualToString:v10];
      }
      if (![v13 isDelete])
      {
        id v23 = v13;
        objc_opt_class();
        v55 += objc_opt_isKindOfClass() & 1;
        if (v18) {
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      if (v10)
      {
        v20 = [v15 scopeIdentifier];
        int v21 = [v20 isEqualToString:v10];

        if (v21)
        {
          id v22 = [(CPLEngineTransientRepository *)v56 _sharedDeleteFromDelete:v13];
          goto LABEL_24;
        }
      }
      if (!v15)
      {
        if (!_CPLSilentLogging)
        {
          v41 = __CPLStorageOSLogDomain_8796();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v64 = 0;
            _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_ERROR, "Got a delete change with no identifier: %@", buf, 0xCu);
          }
        }
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepository.m"];
        [v42 handleFailureInMethod:v44, v56, v43, 378, @"Got a delete change with no identifier: %@", 0 object file lineNumber description];

        abort();
      }
      v24 = [(CPLEngineTransientRepository *)v56 cachedRecordWithScopedIdentifier:v15];
      if (v24) {
        break;
      }
      v27 = [(CPLEngineTransientRepository *)v56 changeWithScopedIdentifier:v15];
      if (v27)
      {
        v24 = v27;
        if ([v27 changeType] != 1024) {
          break;
        }
      }
      if ([(CPLEngineTransientRepository *)v56 shouldKeepDeleteChange:v13 forRecordWithScopedIdentifier:v15])
      {
        id v22 = v13;
LABEL_24:
        id v23 = v22;
        if (v18) {
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      id v23 = 0;
      if (v18) {
        goto LABEL_30;
      }
LABEL_31:
      if (([v13 isDelete] & 1) != 0
        || [v13 hasChangeType:2]
        && ([v13 realIdentifier],
            v35 = objc_claimAutoreleasedReturnValue(),
            v35,
            !v35))
      {
        v32 = [v13 scopedIdentifier];
        v33 = (void *)[v32 copy];
        id v57 = v11;
        int v34 = [v50 removeRemappedRecordWithScopedIdentifier:v33 error:&v57];
        id v31 = v57;

        id v11 = v31;
        if (!v34)
        {
LABEL_44:

          if (a6)
          {
            id v11 = v31;
            char v37 = 0;
            *a6 = v11;
          }
          else
          {
            char v37 = 0;
            id v11 = v31;
          }
          v39 = v52;
          goto LABEL_52;
        }
      }
      if (v23) {
        [(CPLChangeBatch *)v52 addRecord:v23];
      }

      if (v54 == ++v12)
      {
        uint64_t v36 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
        uint64_t v54 = v36;
        if (v36) {
          goto LABEL_3;
        }
        goto LABEL_47;
      }
    }
    uint64_t v25 = objc_opt_class();
    if (v25 == objc_opt_class()) {
      id v26 = (id)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v15];
    }
    else {
      id v26 = v13;
    }
    id v23 = v26;
    v28 = [v24 relatedIdentifier];
    if (v28) {
      [v23 setRelatedIdentifier:v28];
    }

    if (v18)
    {
LABEL_30:
      v29 = [v13 scopedIdentifier];
      id v58 = v11;
      int v30 = [v49 removeRecordWithScopedIdentifier:v29 error:&v58];
      id v31 = v58;

      id v11 = v31;
      if (!v30) {
        goto LABEL_44;
      }
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  id v11 = 0;
  unint64_t v55 = 0;
LABEL_47:

  if (a5) {
    *a5 = v55;
  }
  v38 = [(CPLEngineStorage *)v56 platformObject];
  v39 = v52;
  char v37 = [v38 appendBatch:v52 alreadyMingled:v46 error:a6];

LABEL_52:
  return v37;
}

- (id)_sharedDeleteFromDelete:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 cloudCache];

  v7 = [v4 scopedIdentifier];
  id v8 = [v6 targetForRecordWithSharedCloudScopedIdentifier:v7];
  char v9 = [v8 scopedIdentifier];
  id v10 = [(CPLEngineTransientRepository *)self cachedRecordWithScopedIdentifier:v9];

  if (!v10)
  {
    id v10 = [(CPLEngineTransientRepository *)self changeWithScopedIdentifier:v7];
    if ([v10 changeType] == 1024)
    {
    }
    else if (v10)
    {
      int v14 = [v10 relatedIdentifier];
      goto LABEL_8;
    }
    int v18 = [v8 scopedIdentifier];
    BOOL v19 = [(CPLEngineTransientRepository *)self shouldKeepDeleteChange:v4 forRecordWithScopedIdentifier:v18];

    if (v19)
    {
      id v17 = v4;
      id v10 = 0;
      int v14 = 0;
    }
    else
    {
      id v10 = 0;
      int v14 = 0;
      id v17 = 0;
    }
    goto LABEL_18;
  }
  id v11 = [v10 relatedScopedIdentifier];
  if (v11)
  {
    uint64_t v12 = [v6 targetForRecordWithCloudScopedIdentifier:v11];
    v13 = [v12 otherScopedIdentifier];
    int v14 = [v13 identifier];
  }
  else
  {
    int v14 = 0;
  }

LABEL_8:
  uint64_t v15 = objc_opt_class();
  if (v15 == objc_opt_class()) {
    id v16 = (id)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v7];
  }
  else {
    id v16 = v4;
  }
  id v17 = v16;
  if (v14) {
    [v16 setRelatedIdentifier:v14];
  }
LABEL_18:

  return v17;
}

- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasStashedRecordWithScopedIdentifier:v4];

  return v6;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 recordWithScopedIdentifier:v4];

  return v6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasRecordWithScopedIdentifier:v4];

  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (BOOL)shouldKeepDeleteChange:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v26 = 0;
  id v8 = [(CPLEngineStorage *)self engineStore];
  char v9 = [v8 idMapping];
  id v10 = [v9 localScopedIdentifierForCloudScopedIdentifier:v7 isFinal:&v26];

  if (v10)
  {
    id v11 = [(CPLEngineStorage *)self engineStore];
    uint64_t v12 = [v11 quarantinedRecords];
    int v13 = [v12 isRecordWithScopedIdentifierQuarantined:v10];

    if (v13)
    {
      if (_CPLSilentLogging)
      {
        BOOL v15 = 1;
        goto LABEL_19;
      }
      int v14 = __CPLStorageOSLogDomain_8796();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v6;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "%@ is a delete for a quarantined record. Keeping.", buf, 0xCu);
      }
      goto LABEL_6;
    }
  }
  id v16 = [(CPLEngineStorage *)self engineStore];
  id v17 = [v16 cloudCache];
  int v14 = [v17 targetForRecordWithCloudScopedIdentifier:v7];

  uint64_t v18 = [v14 otherScopedIdentifier];
  if (!v18) {
    goto LABEL_13;
  }
  BOOL v19 = (void *)v18;
  v20 = [(CPLEngineStorage *)self engineStore];
  int v21 = [v20 ignoredRecords];
  id v22 = [v14 otherScopedIdentifier];
  int v23 = [v21 hasRecordWithScopedIdentifier:v22];

  if (!v23)
  {
LABEL_13:
    if (_CPLSilentLogging)
    {
      BOOL v15 = 0;
      goto LABEL_18;
    }
    v24 = __CPLStorageOSLogDomain_8796();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "%@ is a delete for a record we don't know or has already been deleted. Ignoring.", buf, 0xCu);
    }
    BOOL v15 = 0;
    goto LABEL_17;
  }
  if (!_CPLSilentLogging)
  {
    v24 = __CPLStorageOSLogDomain_8796();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "%@ is a delete of a record shadowing an other record", buf, 0xCu);
    }
    BOOL v15 = 1;
LABEL_17:

    goto LABEL_18;
  }
LABEL_6:
  BOOL v15 = 1;
LABEL_18:

LABEL_19:
  return v15;
}

- (id)cachedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 cloudCache];
  id v7 = [v6 recordWithScopedIdentifier:v4 isFinal:0];

  return v7;
}

- (id)batchStorageForScope:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 scopeType];
  if ((unint64_t)(v5 - 4) < 2)
  {
    id v6 = [(CPLEngineStorage *)self engineStore];
    id v7 = [v6 sharingScopeIdentifier];
    if (v7)
    {
      id v8 = [v6 scopes];
      uint64_t v9 = [v8 scopeForSharingScope:v4];
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = [[CPLInvalidBatchStorage alloc] initWithTransientRepository:self scope:v4];

LABEL_11:
        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v5 == 1)
  {
    id v6 = [(CPLEngineStorage *)self engineStore];
    id v7 = [v6 sharingScopeIdentifier];
    if (v7)
    {
      id v8 = [v6 scopes];
      uint64_t v12 = [v8 sharingScopeForScope:v4];
      if (v12)
      {
        int v13 = (void *)v12;
        int v14 = [v8 flagsForScope:v12];
        if (![v14 valueForFlag:52]
          || ([v14 valueForFlag:64] & 1) != 0)
        {
          BOOL v15 = [CPLSharedRecordMerger alloc];
          id v16 = [(CPLEngineStorage *)self engineStore];
          id v17 = [v16 engineLibrary];
          [v17 transport];
          uint64_t v18 = v23 = v14;
          [v18 propertyMapping];
          BOOL v19 = v24 = v8;
          v20 = [(CPLSharedRecordMerger *)v15 initWithMapping:v19];

          id v11 = [[CPLSharedBatchStorage alloc] initWithTransientRepository:self scope:v4 sharedScope:v13 merger:v20];
          goto LABEL_11;
        }
        if (!_CPLSilentLogging)
        {
          int v21 = __CPLStorageOSLogDomain_8796();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            char v26 = v13;
            __int16 v27 = 2112;
            id v28 = v14;
            __int16 v29 = 2112;
            id v30 = v4;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring %@ (%@) for %@", buf, 0x20u);
          }
        }
      }
      goto LABEL_17;
    }
LABEL_18:
  }
  id v11 = [[CPLEngineTransientRepositoryBatchStorage alloc] initWithTransientRepository:self scope:v4];
LABEL_20:

  return v11;
}

- (BOOL)hasUnmingledChangesForScope:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasUnmingledChangesForScope:v4];

  return v6;
}

- (BOOL)hasUnmingledChanges
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasUnmingledChanges];

  return v3;
}

- (unint64_t)scopeType
{
  return 1;
}

- (void)setMaximumCountOfRecordsInBatches:(unint64_t)a3
{
  unint64_t v3 = 100;
  if (a3) {
    unint64_t v3 = a3;
  }
  self->_maximumCountOfRecordsInBatches = v3;
}

- (CPLEngineTransientRepository)initWithEngineStore:(id)a3 name:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineTransientRepository;
  id v4 = [(CPLEngineStorage *)&v9 initWithEngineStore:a3 name:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_maximumCountOfRecordsInBatches = 100;
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v5->_observers;
    v5->_observers = v6;
  }
  return v5;
}

+ (id)orderedClassesForChangesForLargeSync
{
  if (orderedClassesForChangesForLargeSync_onceToken != -1) {
    dispatch_once(&orderedClassesForChangesForLargeSync_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)orderedClassesForChangesForLargeSync_orderedClasses;
  return v2;
}

void __68__CPLEngineTransientRepository_orderedClassesForChangesForLargeSync__block_invoke()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];
  v1 = (void *)orderedClassesForChangesForLargeSync_orderedClasses;
  orderedClassesForChangesForLargeSync_orderedClasses = v0;
}

+ (id)orderedClassesForChanges
{
  if (orderedClassesForChanges_onceToken != -1) {
    dispatch_once(&orderedClassesForChanges_onceToken, &__block_literal_global_14_8845);
  }
  v2 = (void *)orderedClassesForChanges_orderedClasses;
  return v2;
}

void __56__CPLEngineTransientRepository_orderedClassesForChanges__block_invoke()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];
  v1 = (void *)orderedClassesForChanges_orderedClasses;
  orderedClassesForChanges_orderedClasses = v0;
}

+ (id)orderedClassesForDelete
{
  if (orderedClassesForDelete_onceToken != -1) {
    dispatch_once(&orderedClassesForDelete_onceToken, &__block_literal_global_8847);
  }
  v2 = (void *)orderedClassesForDelete_orderedClasses;
  return v2;
}

void __55__CPLEngineTransientRepository_orderedClassesForDelete__block_invoke()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];
  v1 = (void *)orderedClassesForDelete_orderedClasses;
  orderedClassesForDelete_orderedClasses = v0;
}

@end
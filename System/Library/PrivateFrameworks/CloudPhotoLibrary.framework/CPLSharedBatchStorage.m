@interface CPLSharedBatchStorage
- (BOOL)_keepIgnoredRecord:(id)a3 shadowingRecord:(id)a4 inScope:(id)a5 error:(id *)a6;
- (BOOL)_transferIgnoredRecordToTransientPullRepository:(id)a3 error:(id *)a4;
- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)isRecordWithScopedIdentifierStashed:(id)a3;
- (BOOL)removeChange:(id)a3 error:(id *)a4;
- (BOOL)stashChange:(id)a3 error:(id *)a4;
- (CPLEngineScope)sharedScope;
- (CPLSharedBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4 sharedScope:(id)a5 merger:(id)a6;
- (CPLSharedRecordMerger)merger;
- (id)_allChangesMatchingChangeType:(unint64_t)a3 enumerator:(id)a4;
- (id)_correctPrivateScopedIdentifierForSharedScopedIdentifier:(id)a3 currentPrivateScopedIdentifier:(id)a4;
- (id)_mergedRecordWithPrivateChange:(id)a3 sharedScopedIdentifier:(id *)a4;
- (id)_mergedRecordWithSharedChange:(id)a3 target:(id)a4;
- (id)_privateScopedIdentifierForSharedScopedIdentifier:(id)a3;
- (id)_remapSharedRecord:(id)a3 target:(id)a4;
- (id)_sharedRecordAsPrivateRecord:(id)a3 target:(id)a4;
- (id)_targetForPrivateScopedIdentifier:(id)a3;
- (id)_targetForSharedScopedIdentifier:(id)a3;
- (id)_unionEnumerationWithPrivateRecordEnumeratorGenerator:(id)a3 sharedRecordGenerator:(id)a4;
- (id)_updatePrivateScopedIdentifierForUnknownTarget:(id)a3;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5;
- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3;
- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3;
- (void)beginExtractingBatch;
- (void)cleanupAfterExtractingBatch;
@end

@implementation CPLSharedBatchStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merger, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_alreadyProcessedChanges, 0);
  objc_storeStrong((id *)&self->_ignoredRecords, 0);
  objc_storeStrong((id *)&self->_remappedRecords, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
}

- (CPLSharedRecordMerger)merger
{
  return self->_merger;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  v14 = NSStringFromSelector(a2);
  [v12 handleFailureInMethod:a2, self, v13, 984, @"%@ should not be used here", v14 object file lineNumber description];

  abort();
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  if (a4) {
    *a4 = 1;
  }
  return [(CPLSharedBatchStorage *)self _privateScopedIdentifierForSharedScopedIdentifier:a3];
}

- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 968, @"%@ should not be used here", v8 object file lineNumber description];

  abort();
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 964, @"%@ should not be used here", v9 object file lineNumber description];

  abort();
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  v14 = NSStringFromSelector(a2);
  [v12 handleFailureInMethod:a2, self, v13, 960, @"%@ should not be used here", v14 object file lineNumber description];

  abort();
}

- (void)cleanupAfterExtractingBatch
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v3 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
      sharedScope = self->_sharedScope;
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      __int16 v10 = 2112;
      id v11 = sharedScope;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Finished extracting batch for %@/%@", buf, 0x16u);
    }
  }
  alreadyProcessedChanges = self->_alreadyProcessedChanges;
  self->_alreadyProcessedChanges = 0;

  v7.receiver = self;
  v7.super_class = (Class)CPLSharedBatchStorage;
  [(CPLEngineTransientRepositoryBatchStorage *)&v7 cleanupAfterExtractingBatch];
}

- (void)beginExtractingBatch
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CPLSharedBatchStorage;
  [(CPLEngineTransientRepositoryBatchStorage *)&v8 beginExtractingBatch];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  alreadyProcessedChanges = self->_alreadyProcessedChanges;
  self->_alreadyProcessedChanges = v3;

  if (!_CPLSilentLogging)
  {
    id v5 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
      sharedScope = self->_sharedScope;
      *(_DWORD *)buf = 138412546;
      __int16 v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = sharedScope;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Begin extracting batch for %@/%@", buf, 0x16u);
    }
  }
}

- (BOOL)removeChange:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CPLSharedBatchStorage;
  if ([(CPLEngineTransientRepositoryBatchStorage *)&v34 removeChange:v7 error:a4])
  {
    objc_super v8 = [v7 scopedIdentifier];
    v9 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:v8];

    __int16 v10 = [v9 otherScopedIdentifier];
    if (!v10)
    {
      char v17 = 1;
LABEL_23:

      goto LABEL_24;
    }
    __int16 v11 = [v7 _ignoredRecord];
    if (v11)
    {
      int v12 = [v7 isMasterChange];
      uint64_t v13 = [v11 scopedIdentifier];
      v14 = v13;
      if (v12)
      {
        v15 = [v9 scopedIdentifier];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            v24 = __CPLStorageOSLogDomain();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = [v9 scopedIdentifier];
              *(_DWORD *)buf = 138412546;
              v36 = v11;
              __int16 v37 = 2112;
              v38 = v25;
              _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "%@ is incorrectly ignored for %@", buf, 0x16u);
            }
          }
          v26 = [MEMORY[0x1E4F28B00] currentHandler];
          v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
          v28 = [v9 scopedIdentifier];
          [v26 handleFailureInMethod:a2, self, v27, 918, @"%@ is incorrectly ignored for %@", v11, v28 object file lineNumber description];

          abort();
        }
        if ([v9 targetState] == 1)
        {
          if (![(CPLSharedBatchStorage *)self _transferIgnoredRecordToTransientPullRepository:v11 error:a4])goto LABEL_8; {
        }
          }
        else if (![(CPLSharedBatchStorage *)self _keepIgnoredRecord:v11 shadowingRecord:v7 inScope:self->_sharedScope error:a4])
        {
          goto LABEL_8;
        }
      }
      else
      {
        int v18 = [v13 isEqual:v10];

        if ((v18 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            v29 = __CPLStorageOSLogDomain();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = [v9 scopedIdentifier];
              *(_DWORD *)buf = 138412802;
              v36 = v11;
              __int16 v37 = 2112;
              v38 = v30;
              __int16 v39 = 2112;
              v40 = v10;
              _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_ERROR, "%@ is incorrectly ignored for %@ - it should be %@", buf, 0x20u);
            }
          }
          v31 = [MEMORY[0x1E4F28B00] currentHandler];
          v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
          v33 = [v9 scopedIdentifier];
          [v31 handleFailureInMethod:a2, self, v32, 926, @"%@ is incorrectly ignored for %@ - it should be %@", v11, v33, v10 object file lineNumber description];

          abort();
        }
        if ([v9 shouldUploadToOtherRecord])
        {
          char v17 = [(CPLSharedBatchStorage *)self _transferIgnoredRecordToTransientPullRepository:v11 error:a4];
          goto LABEL_22;
        }
        v19 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
        BOOL v20 = [(CPLSharedBatchStorage *)self _keepIgnoredRecord:v11 shadowingRecord:v7 inScope:v19 error:a4];

        if (!v20)
        {
LABEL_8:
          char v17 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    if (!_CPLSilentLogging)
    {
      v21 = __CPLStorageOSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEBUG, "Automatically mingling %@", buf, 0xCu);
      }
    }
    v22 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
    char v17 = [v22 markUnmingledChangeWithScopedIdentifierAsMingled:v10 error:a4];

    goto LABEL_22;
  }
  char v17 = 0;
LABEL_24:

  return v17;
}

- (BOOL)_keepIgnoredRecord:(id)a3 shadowingRecord:(id)a4 inScope:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  int v12 = CPLIgnoredDateForRecord(v10, a4, self->_now);
  if (!_CPLSilentLogging)
  {
    uint64_t v13 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v10 scopedIdentifier];
      v15 = +[CPLDateFormatter stringFromDateAgo:v12 now:self->_now];
      int v18 = 138543618;
      v19 = v14;
      __int16 v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Keeping ignored record %{public}@ with ignored date %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  BOOL v16 = -[CPLEngineIgnoredRecords addIgnoredRecord:ignoredDate:otherScopeIndex:error:](self->_ignoredRecords, "addIgnoredRecord:ignoredDate:otherScopeIndex:error:", v10, v12, [v11 cloudIndex], a6);

  return v16;
}

- (BOOL)_transferIgnoredRecordToTransientPullRepository:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = [v6 scopedIdentifier];
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Automatically mingling previously ignored record %@", (uint8_t *)&v13, 0xCu);
    }
  }
  v9 = objc_alloc_init(CPLChangeBatch);
  [(CPLChangeBatch *)v9 addRecord:v6];
  id v10 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
  char v11 = [v10 appendBatch:v9 alreadyMingled:1 countOfAssetChanges:0 error:a4];

  return v11;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
  id v6 = [v5 scopeIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    objc_super v8 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
    v9 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
    if ([v8 hasUnmingledChangesForScope:v9]) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = [v8 hasUnmingledChangesForScope:self->_sharedScope];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CPLSharedBatchStorage;
    unsigned __int8 v10 = [(CPLEngineTransientRepositoryBatchStorage *)&v12 hasChangesInScopeWithIdentifier:v4];
  }

  return v10;
}

- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  int v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  objc_super v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 881, @"%@ should not be used on %@", v8, objc_opt_class() object file lineNumber description];

  abort();
}

- (id)changeWithScopedIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = NSStringFromSelector(a2);
      int v16 = 138412546;
      char v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v16, 0x16u);
    }
  }
  objc_super v8 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
  v9 = [v8 unmingledChangeWithScopedIdentifier:v5];

  if (v9)
  {
    unsigned __int8 v10 = [(CPLSharedBatchStorage *)self _mergedRecordWithPrivateChange:v9 sharedScopedIdentifier:0];
  }
  else
  {
    char v11 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:v5];
    objc_super v12 = [v11 otherScopedIdentifier];
    if (v12
      && ([(CPLEngineTransientRepositoryBatchStorage *)self transientRepository],
          int v13 = objc_claimAutoreleasedReturnValue(),
          [v13 unmingledChangeWithScopedIdentifier:v12],
          v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      unsigned __int8 v10 = [(CPLSharedBatchStorage *)self _mergedRecordWithSharedChange:v14 target:v11];
    }
    else
    {

      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    objc_super v8 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      Class v24 = a3;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ %@", buf, 0x20u);
    }
  }
  unsigned __int8 v10 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
  char v11 = [v10 scopeIdentifier];
  int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke;
    v18[3] = &unk_1E60A6B48;
    v18[4] = self;
    Class v20 = a3;
    id v19 = v7;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke_2;
    v17[3] = &unk_1E60A6B98;
    v17[4] = self;
    v17[5] = a3;
    int v13 = [(CPLSharedBatchStorage *)self _unionEnumerationWithPrivateRecordEnumeratorGenerator:v18 sharedRecordGenerator:v17];
    v14 = [(CPLSharedBatchStorage *)self _allChangesMatchingChangeType:0 enumerator:v13];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CPLSharedBatchStorage;
    v14 = [(CPLEngineTransientRepositoryBatchStorage *)&v16 allNonDeletedChangesWithClass:a3 scopeIdentifier:v7];
  }

  return v14;
}

id __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  v3 = [v2 allUnmingledChangesWithClass:*(void *)(a1 + 48) scopeIdentifier:*(void *)(a1 + 40)];

  return v3;
}

id __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) scopeIdentifier];
  id v5 = [v2 allUnmingledChangesWithClass:v3 scopeIdentifier:v4];

  return v5;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v18 = v7;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);
    }
  }
  objc_super v8 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
  v9 = [v8 scopeIdentifier];
  int v10 = [v5 isEqualToString:v9];

  if (v10)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke;
    v15[3] = &unk_1E60A6BC0;
    v15[4] = self;
    id v16 = v5;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke_2;
    v14[3] = &unk_1E60A73F8;
    v14[4] = self;
    char v11 = [(CPLSharedBatchStorage *)self _unionEnumerationWithPrivateRecordEnumeratorGenerator:v15 sharedRecordGenerator:v14];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CPLSharedBatchStorage;
    char v11 = [(CPLEngineTransientRepositoryBatchStorage *)&v13 allChangesWithScopeIdentifier:v5];
  }

  return v11;
}

id __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  uint64_t v3 = [v2 allUnmingledChangesWithScopeIdentifier:*(void *)(a1 + 40)];

  return v3;
}

id __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) scopeIdentifier];
  id v4 = [v2 allUnmingledChangesWithScopeIdentifier:v3];

  return v4;
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_super v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 832, @"Trying to extract batches using unsupported %@", v9 object file lineNumber description];

  abort();
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5
{
  id v7 = a4;
  objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
  v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
  int v10 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, v9, 828, @"Trying to extract batches using unsupported %@", v10 object file lineNumber description];

  abort();
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (!_CPLSilentLogging)
  {
    int v10 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      char v11 = NSStringFromSelector(a2);
      int v12 = +[CPLRecordChange descriptionForChangeType:a5];
      *(_DWORD *)buf = 138413058;
      __int16 v25 = v11;
      __int16 v26 = 2112;
      Class v27 = a3;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ %@ %@", buf, 0x2Au);
    }
  }
  objc_super v13 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
  v14 = [v13 scopeIdentifier];
  int v15 = [v9 isEqualToString:v14];

  if (v15)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke;
    v21[3] = &unk_1E60A6B48;
    v21[4] = self;
    Class v23 = a3;
    id v22 = v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke_2;
    v20[3] = &unk_1E60A6B98;
    v20[4] = self;
    v20[5] = a3;
    id v16 = [(CPLSharedBatchStorage *)self _unionEnumerationWithPrivateRecordEnumeratorGenerator:v21 sharedRecordGenerator:v20];
    char v17 = [(CPLSharedBatchStorage *)self _allChangesMatchingChangeType:a5 enumerator:v16];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CPLSharedBatchStorage;
    char v17 = [(CPLEngineTransientRepositoryBatchStorage *)&v19 allChangesWithClass:a3 scopeIdentifier:v9 changeType:a5];
  }

  return v17;
}

id __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  uint64_t v3 = [v2 allUnmingledChangesWithClass:*(void *)(a1 + 48) scopeIdentifier:*(void *)(a1 + 40)];

  return v3;
}

id __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) scopeIdentifier];
  id v5 = [v2 allUnmingledChangesWithClass:v3 scopeIdentifier:v4];

  return v5;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    objc_super v8 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v44 = v9;
      __int16 v45 = 2112;
      Class v46 = a3;
      __int16 v47 = 2112;
      id v48 = v7;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ %@", buf, 0x20u);
    }
  }
  int v10 = [v7 scopeIdentifier];
  char v11 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
  int v12 = [v11 scopeIdentifier];
  int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke;
    v39[3] = &unk_1E60A6B48;
    v39[4] = self;
    Class v41 = a3;
    id v15 = v7;
    id v40 = v15;
    id v16 = (void *)MEMORY[0x1BA994060](v39);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_2;
    v36[3] = &unk_1E60A6B70;
    v36[4] = self;
    id v37 = v15;
    Class v38 = a3;
    char v17 = (void *)MEMORY[0x1BA994060](v36);
    __int16 v18 = [CPLUnionEnumerator alloc];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_3;
    v33[3] = &unk_1E60A6B00;
    id v35 = v16;
    v33[4] = self;
    id v19 = v14;
    id v34 = v19;
    id v20 = v16;
    uint64_t v21 = (void *)MEMORY[0x1BA994060](v33);
    v42[0] = v21;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_5;
    v29[3] = &unk_1E60A6B00;
    v31 = self;
    id v32 = v17;
    id v30 = v19;
    id v22 = v19;
    id v23 = v17;
    Class v24 = (void *)MEMORY[0x1BA994060](v29);
    v42[1] = v24;
    __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    __int16 v26 = [(CPLUnionEnumerator *)v18 initWithEnumeratorGenerators:v25];
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CPLSharedBatchStorage;
    __int16 v26 = [(CPLEngineTransientRepositoryBatchStorage *)&v28 allChangesWithClass:a3 relatedScopedIdentifier:v7];
  }

  return v26;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transientRepository];
  uint64_t v3 = [v2 allUnmingledChangesWithClass:*(void *)(a1 + 48) relatedScopedIdentifier:*(void *)(a1 + 40)];

  return v3;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _targetForPrivateScopedIdentifier:*(void *)(a1 + 40)];
  if ([v2 targetState] == 1
    || ([v2 otherScopedIdentifier], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = (void *)v3;
    id v5 = [*(id *)(a1 + 32) transientRepository];
    id v6 = [v5 allUnmingledChangesWithClass:*(void *)(a1 + 48) relatedScopedIdentifier:v4];
  }
  return v6;
}

CPLMapEnumerator *__69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_3(void *a1)
{
  v2 = [CPLMapEnumerator alloc];
  uint64_t v3 = (*(void (**)(void))(a1[6] + 16))();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_4;
  v7[3] = &unk_1E60A6AD8;
  id v4 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v4;
  id v5 = [(CPLMapEnumerator *)v2 initWithEnumerator:v3 map:v7];

  return v5;
}

CPLMapEnumerator *__69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_5(uint64_t a1)
{
  v2 = [CPLMapEnumerator alloc];
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_6;
  v8[3] = &unk_1E60A6AD8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = [(CPLMapEnumerator *)v2 initWithEnumerator:v3 map:v8];

  return v6;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 scopedIdentifier];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) _targetForSharedScopedIdentifier:v4];
    if (![v3 supportsSharingScopedIdentifier]) {
      goto LABEL_6;
    }
    id v7 = [*(id *)(a1 + 40) transientRepository];
    id v8 = [v6 scopedIdentifier];
    id v9 = [v7 unmingledChangeWithScopedIdentifier:v8];

    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 40);
      id v13 = v4;
      uint64_t v5 = [v10 _mergedRecordWithPrivateChange:v9 sharedScopedIdentifier:&v13];
      id v11 = v13;

      id v4 = v11;
    }
    else
    {
LABEL_6:
      uint64_t v5 = [*(id *)(a1 + 40) _mergedRecordWithSharedChange:v3 target:v6];
    }
  }
  return v5;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = 0;
  id v4 = [v3 _mergedRecordWithPrivateChange:a2 sharedScopedIdentifier:&v7];
  id v5 = v7;
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }

  return v4;
}

- (id)_allChangesMatchingChangeType:(unint64_t)a3 enumerator:(id)a4
{
  id v7 = a4;
  if (a3 == 1024)
  {
    id v8 = &__block_literal_global_116;
  }
  else
  {
    if (a3)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      int v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
      id v13 = +[CPLRecordChange descriptionForChangeType:a3];
      [v11 handleFailureInMethod:a2, self, v12, 754, @"Trying to extract batches using change type %@", v13 object file lineNumber description];

      abort();
    }
    id v8 = &__block_literal_global_34;
  }
  id v9 = [[CPLMapEnumerator alloc] initWithEnumerator:v7 map:v8];

  return v9;
}

id __66__CPLSharedBatchStorage__allChangesMatchingChangeType_enumerator___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDelete]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __66__CPLSharedBatchStorage__allChangesMatchingChangeType_enumerator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFullRecord]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_unionEnumerationWithPrivateRecordEnumeratorGenerator:(id)a3 sharedRecordGenerator:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = [CPLUnionEnumerator alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke;
  v23[3] = &unk_1E60A6B00;
  id v25 = v6;
  v23[4] = self;
  id v10 = v8;
  id v24 = v10;
  id v11 = v6;
  int v12 = (void *)MEMORY[0x1BA994060](v23);
  v26[0] = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_3;
  v19[3] = &unk_1E60A6B00;
  uint64_t v21 = self;
  id v22 = v7;
  id v20 = v10;
  id v13 = v10;
  id v14 = v7;
  id v15 = (void *)MEMORY[0x1BA994060](v19);
  v26[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  char v17 = [(CPLUnionEnumerator *)v9 initWithEnumeratorGenerators:v16];

  return v17;
}

CPLMapEnumerator *__101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke(void *a1)
{
  id v2 = [CPLMapEnumerator alloc];
  id v3 = (*(void (**)(void))(a1[6] + 16))();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_2;
  v7[3] = &unk_1E60A6AD8;
  id v4 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v4;
  id v5 = [(CPLMapEnumerator *)v2 initWithEnumerator:v3 map:v7];

  return v5;
}

CPLMapEnumerator *__101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_3(uint64_t a1)
{
  id v2 = [CPLMapEnumerator alloc];
  id v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_4;
  v8[3] = &unk_1E60A6AD8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = [(CPLMapEnumerator *)v2 initWithEnumerator:v3 map:v8];

  return v6;
}

id __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 scopedIdentifier];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) _targetForSharedScopedIdentifier:v4];
    uint64_t v5 = [*(id *)(a1 + 40) _mergedRecordWithSharedChange:v3 target:v6];
  }
  return v5;
}

id __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = 0;
  id v4 = [v3 _mergedRecordWithPrivateChange:a2 sharedScopedIdentifier:&v7];
  id v5 = v7;
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }

  return v4;
}

- (id)_mergedRecordWithSharedChange:(id)a3 target:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (CPLRecordTarget *)a4;
  id v8 = [v6 scopedIdentifier];
  id v9 = [(NSMutableDictionary *)self->_alreadyProcessedChanges objectForKeyedSubscript:v8];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = v10;
    goto LABEL_61;
  }
  if ([v6 isMasterChange])
  {
    int v12 = [(CPLRecordTarget *)v7 scopedIdentifier];
    id v13 = [(CPLEngineIgnoredRecords *)self->_ignoredRecords recordWithScopedIdentifier:v12];
    id v14 = (CPLRecordTarget *)[v13 copy];
    if ([v6 isDelete])
    {
      if (!v13)
      {
        switch([(CPLRecordTarget *)v7 targetState])
        {
          case 0:
          case 2:
            id v15 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v12 otherScopedIdentifier:v8 targetState:0];
            id v35 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
            [v35 setTarget:v15 forRecordWithScopedIdentifier:v12];

            char v17 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v6 target:v7];
            goto LABEL_7;
          case 1:
          case 3:
            v73 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v12 isFinal:0];
            if (v73)
            {
              __int16 v18 = v73;
              [(CPLRecordTarget *)v73 setSharingRecordChangeData:0];
              id v15 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v12 otherScopedIdentifier:v8 targetState:1];
              [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
              v74 = uint64_t v87 = 56;
              [v74 setTarget:v15 forRecordWithScopedIdentifier:v12];

              goto LABEL_30;
            }
            __int16 v18 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v6 target:v7];
            break;
          default:
            __int16 v18 = 0;
            goto LABEL_31;
        }
        goto LABEL_31;
      }
      id v15 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v12, v8, [v13 isDelete] ^ 1);
      id v16 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
      [v16 setTarget:v15 forRecordWithScopedIdentifier:v12];

      char v17 = v13;
LABEL_7:
      __int16 v18 = v17;
LABEL_30:

LABEL_31:
      goto LABEL_46;
    }
    uint64_t v87 = 56;
    if (!v14)
    {
      if ([(CPLRecordTarget *)v7 targetState] != 1
        || ([(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v12 isFinal:1], (uint64_t v36 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v14 = 0;
        char v24 = 1;
        uint64_t v25 = 2;
LABEL_28:
        id v15 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v12 otherScopedIdentifier:v8 targetState:v25];
        id v37 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
        [v37 setTarget:v15 forRecordWithScopedIdentifier:v12];

        __int16 v18 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v6 target:v7];
        if ((v24 & 1) == 0)
        {
          Class v38 = [(CPLRecordTarget *)v14 recordChangeData];
          [(CPLRecordTarget *)v18 setRecordChangeData:v38];
        }
        goto LABEL_30;
      }
      id v14 = (CPLRecordTarget *)v36;
    }
    char v24 = 0;
    uint64_t v25 = 3;
    goto LABEL_28;
  }
  int v19 = [v6 isDelete];
  uint64_t v20 = [(CPLRecordTarget *)v7 targetState];
  if (v19)
  {
    switch(v20)
    {
      case 0:
        goto LABEL_26;
      case 1:
        cloudCache = self->_cloudCache;
        id v22 = [(CPLRecordTarget *)v7 scopedIdentifier];
        id v23 = [(CPLEngineCloudCache *)cloudCache recordWithScopedIdentifier:v22 isFinal:0];

        if (v23)
        {
          __int16 v18 = v23;
          [(CPLRecordTarget *)v18 setSharingRecordChangeData:0];
          goto LABEL_44;
        }
        v75 = [CPLRecordTarget alloc];
        v76 = [(CPLRecordTarget *)v7 scopedIdentifier];
        v77 = [(CPLRecordTarget *)v75 initWithScopedIdentifier:v76 otherScopedIdentifier:v8 targetState:0];

        v78 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
        v79 = [(CPLRecordTarget *)v7 scopedIdentifier];
        [v78 setTarget:v77 forRecordWithScopedIdentifier:v79];

        v80 = self;
        id v81 = v6;
        v82 = v7;
        break;
      case 2:
        if (_CPLSilentLogging) {
          goto LABEL_41;
        }
        Class v46 = __CPLStorageOSLogDomain();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 138412290;
        id v90 = v6;
        __int16 v47 = "%@ has been unshared";
        goto LABEL_39;
      case 3:
        if (_CPLSilentLogging) {
          goto LABEL_41;
        }
        Class v46 = __CPLStorageOSLogDomain();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 138412290;
        id v90 = v6;
        __int16 v47 = "%@ has been unshared (will need to clean-up sparse record) ";
LABEL_39:
        _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);
LABEL_40:

LABEL_41:
        id v48 = [CPLRecordTarget alloc];
        uint64_t v49 = [(CPLRecordTarget *)v7 scopedIdentifier];
        id v23 = [(CPLRecordTarget *)v48 initWithScopedIdentifier:v49 otherScopedIdentifier:v8 targetState:0];

        v50 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
        v51 = [(CPLRecordTarget *)v7 scopedIdentifier];
        [v50 setTarget:v23 forRecordWithScopedIdentifier:v51];

        v43 = self;
        id v44 = v6;
        __int16 v45 = v7;
        goto LABEL_42;
      default:
        goto LABEL_25;
    }
LABEL_76:
    __int16 v18 = [(CPLSharedBatchStorage *)v80 _sharedRecordAsPrivateRecord:v81 target:v82];
  }
  else
  {
    if (!v20)
    {
      __int16 v26 = [(CPLSharedBatchStorage *)self _updatePrivateScopedIdentifierForUnknownTarget:v7];

      remappedRecords = self->_remappedRecords;
      objc_super v28 = [(CPLRecordTarget *)v26 scopedIdentifier];
      id v14 = [(CPLEngineRemappedRecords *)remappedRecords realScopedIdentifierForRemappedScopedIdentifier:v28];

      id v29 = [(CPLRecordTarget *)v14 identifier];
      id v30 = [(CPLRecordTarget *)v26 scopedIdentifier];
      v31 = [v30 identifier];
      int v32 = [v29 isEqualToString:v31];

      if (!v32)
      {
        if (!_CPLSilentLogging)
        {
          v63 = __CPLStorageOSLogDomain();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v64 = [(CPLRecordTarget *)v26 scopedIdentifier];
            *(_DWORD *)buf = 138412802;
            id v90 = v6;
            __int16 v91 = 2112;
            v92 = v64;
            __int16 v93 = 2112;
            v94 = v14;
            _os_log_impl(&dword_1B4CAC000, v63, OS_LOG_TYPE_DEFAULT, "%@'s private counterpart %@ is remapped to %@ - ignoring shared record for now", buf, 0x20u);
          }
        }
        v65 = objc_opt_class();
        v66 = [(CPLRecordTarget *)v26 scopedIdentifier];
        id v11 = (CPLRecordTarget *)[v65 newRecordWithScopedIdentifier:v66];

        v67 = [(CPLRecordTarget *)v14 identifier];
        [(CPLRecordTarget *)v11 setRealIdentifier:v67];

        [(CPLRecordTarget *)v11 _setIgnoredRecord:v6];
        [(NSMutableDictionary *)self->_alreadyProcessedChanges setObject:v11 forKeyedSubscript:v8];
        uint64_t v10 = 0;
        id v7 = v26;
        goto LABEL_60;
      }

      id v7 = v26;
    }
    switch([(CPLRecordTarget *)v7 targetState])
    {
      case 0:
        goto LABEL_32;
      case 1:
        v33 = self->_cloudCache;
        id v34 = [(CPLRecordTarget *)v7 scopedIdentifier];
        __int16 v18 = [(CPLEngineCloudCache *)v33 recordWithScopedIdentifier:v34 isFinal:0];

        if (v18)
        {
          id v14 = (CPLRecordTarget *)v6;
          goto LABEL_46;
        }
LABEL_32:
        __int16 v39 = [CPLRecordTarget alloc];
        id v40 = [(CPLRecordTarget *)v7 scopedIdentifier];
        id v23 = [(CPLRecordTarget *)v39 initWithScopedIdentifier:v40 otherScopedIdentifier:v8 targetState:2];

        Class v41 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
        v42 = [(CPLRecordTarget *)v7 scopedIdentifier];
        [v41 setTarget:v23 forRecordWithScopedIdentifier:v42];

        v43 = self;
        id v44 = v6;
        __int16 v45 = v23;
LABEL_42:
        v52 = [(CPLSharedBatchStorage *)v43 _sharedRecordAsPrivateRecord:v44 target:v45];
        goto LABEL_43;
      case 2:
LABEL_26:
        __int16 v18 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v6 target:v7];
        goto LABEL_45;
      case 3:
        v68 = self->_cloudCache;
        v69 = [(CPLRecordTarget *)v7 scopedIdentifier];
        id v23 = [(CPLEngineCloudCache *)v68 recordWithScopedIdentifier:v69 isFinal:0];

        if (!v23)
        {
          v83 = [CPLRecordTarget alloc];
          v84 = [(CPLRecordTarget *)v7 scopedIdentifier];
          v77 = [(CPLRecordTarget *)v83 initWithScopedIdentifier:v84 otherScopedIdentifier:v8 targetState:2];

          v85 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
          v86 = [(CPLRecordTarget *)v7 scopedIdentifier];
          [v85 setTarget:v77 forRecordWithScopedIdentifier:v86];

          v80 = self;
          id v81 = v6;
          v82 = v77;
          goto LABEL_76;
        }
        merger = self->_merger;
        v71 = [(CPLSharedBatchStorage *)self _remapSharedRecord:v6 target:v7];
        [(CPLSharedRecordMerger *)merger mergeRecord:v71 isSharedRecord:1 inPrivateRecord:v23];

        v72 = [v8 scopeIdentifier];
        [(CPLRecordTarget *)v23 setSharingScopeIdentifier:v72];

        v52 = v23;
LABEL_43:
        __int16 v18 = v52;
        break;
      default:
LABEL_25:
        id v14 = 0;
        __int16 v18 = 0;
        goto LABEL_46;
    }
  }
LABEL_44:

LABEL_45:
  id v14 = 0;
LABEL_46:
  id v88 = 0;
  char v53 = -[CPLRecordTarget validateChangeWithError:](v18, "validateChangeWithError:", &v88, v87);
  id v54 = v88;
  if ((v53 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v55 = __CPLStorageOSLogDomain();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v90 = v6;
        __int16 v91 = 2112;
        v92 = v18;
        __int16 v93 = 2112;
        v94 = v7;
        __int16 v95 = 2112;
        id v96 = v54;
        _os_log_impl(&dword_1B4CAC000, v55, OS_LOG_TYPE_ERROR, "Failed to merge incoming shared %@: %@ (%@): %@", buf, 0x2Au);
      }
    }
    v56 = self->_cloudCache;
    v57 = [(CPLRecordTarget *)v7 scopedIdentifier];
    uint64_t v58 = [(CPLEngineCloudCache *)v56 recordWithScopedIdentifier:v57 isFinal:0];

    __int16 v18 = (CPLRecordTarget *)v58;
    if (!v58)
    {
      v59 = objc_opt_class();
      v60 = [(CPLRecordTarget *)v7 scopedIdentifier];
      __int16 v18 = (CPLRecordTarget *)[v59 newDeleteChangeWithScopedIdentifier:v60];
    }
  }
  if (!_CPLSilentLogging)
  {
    v61 = __CPLStorageOSLogDomain();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v90 = v6;
      __int16 v91 = 2112;
      v92 = v7;
      __int16 v93 = 2112;
      v94 = v18;
      _os_log_impl(&dword_1B4CAC000, v61, OS_LOG_TYPE_DEFAULT, "Merging record with shared change %@ - %@ -> %@", buf, 0x20u);
    }
  }
  if (v14) {
    [(CPLRecordTarget *)v18 _setIgnoredRecord:v14];
  }
  [(NSMutableDictionary *)self->_alreadyProcessedChanges setObject:v18 forKeyedSubscript:v8];
  uint64_t v10 = v18;

  id v11 = v10;
LABEL_60:

LABEL_61:
  return v11;
}

- (id)_updatePrivateScopedIdentifierForUnknownTarget:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (CPLRecordTarget *)a3;
  id v5 = [(CPLRecordTarget *)v4 otherScopedIdentifier];
  id v6 = [(CPLRecordTarget *)v4 scopedIdentifier];
  if (v5)
  {
    id v7 = [(CPLSharedBatchStorage *)self _correctPrivateScopedIdentifierForSharedScopedIdentifier:v5 currentPrivateScopedIdentifier:v6];
    if (([v7 isEqual:v6] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLStorageOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412546;
          int v12 = v5;
          __int16 v13 = 2112;
          id v14 = v7;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Automatically found private scoped identifier of %@ to be %@", (uint8_t *)&v11, 0x16u);
        }
      }
      id v9 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v7 otherScopedIdentifier:v5 targetState:[(CPLRecordTarget *)v4 targetState]];

      id v4 = v9;
    }
  }
  return v4;
}

- (id)_mergedRecordWithPrivateChange:(id)a3 sharedScopedIdentifier:(id *)a4
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 scopedIdentifier];
  id v9 = [(NSMutableDictionary *)self->_alreadyProcessedChanges objectForKeyedSubscript:v8];
  if (v9)
  {
    id v10 = v9;
    goto LABEL_59;
  }
  int v11 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
  int v12 = [v11 targetForRecordWithScopedIdentifier:v8];

  SEL v124 = a2;
  if (![v7 isMasterChange])
  {
    if (![v7 supportsSharingScopedIdentifier])
    {
      id v29 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8];

      id v23 = v7;
      id v28 = 0;
      v125 = 0;
      goto LABEL_14;
    }
    if ([v7 isDelete])
    {
      char v24 = v12;
      if (!v12)
      {
        char v24 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:v8];
      }
      int v12 = v24;
      uint64_t v25 = [v24 otherScopedIdentifier];
      __int16 v26 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
      Class v27 = [v26 unmingledChangeWithScopedIdentifier:v25];

      v125 = (__CFString *)v25;
      if (v27)
      {
        id v28 = 0;
      }
      else
      {
        id v28 = [(CPLEngineIgnoredRecords *)self->_ignoredRecords recordWithScopedIdentifier:v25];
        Class v27 = v28;
        if (!v28)
        {
          switch([v12 targetState])
          {
            case 0:
            case 1:
              id v29 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8 otherScopedIdentifier:v25 targetState:0];

              id v23 = v7;
              goto LABEL_103;
            case 2:
              id v23 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0];
              if (!v23) {
                goto LABEL_86;
              }
              goto LABEL_87;
            case 3:
              v119 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0];
              if (!v119) {
                goto LABEL_83;
              }
              id v23 = v119;
              [v119 setRecordChangeData:0];
              v78 = [CPLRecordTarget alloc];
              v79 = v8;
              uint64_t v80 = v25;
              break;
            default:
              id v28 = 0;
              id v23 = 0;
              goto LABEL_140;
          }
LABEL_93:
          id v29 = [(CPLRecordTarget *)v78 initWithScopedIdentifier:v79 otherScopedIdentifier:v80 targetState:2];

LABEL_103:
          id v28 = 0;
          goto LABEL_14;
        }
      }
      int v61 = [v27 isDelete];
      v62 = [CPLRecordTarget alloc];
      if (v61)
      {
        uint64_t v63 = [(CPLRecordTarget *)v62 initWithScopedIdentifier:v8 otherScopedIdentifier:v25 targetState:0];

        id v23 = v7;
      }
      else
      {
        uint64_t v63 = [(CPLRecordTarget *)v62 initWithScopedIdentifier:v8 otherScopedIdentifier:v25 targetState:2];

        id v23 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v27 target:v63];
        [v23 setRecordChangeData:0];
      }

      int v12 = (void *)v63;
LABEL_140:
      if (!v12) {
        goto LABEL_15;
      }
      goto LABEL_39;
    }
    Class v38 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
    int v39 = [v7 isSharedInScopeWithIdentifier:v38];

    if (!v39)
    {
      uint64_t v58 = [v12 otherScopedIdentifier];
      v59 = v58;
      if (v58)
      {
        v60 = v58;
      }
      else
      {
        id v81 = [CPLScopedIdentifier alloc];
        v82 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
        v83 = [v8 identifier];
        v60 = [(CPLScopedIdentifier *)v81 initWithScopeIdentifier:v82 identifier:v83];
      }
      uint64_t v84 = [(CPLEngineRemappedRecords *)self->_remappedRecords realScopedIdentifierForRemappedScopedIdentifier:v60];
      v85 = (void *)v84;
      if (v84) {
        v86 = (void *)v84;
      }
      else {
        v86 = v60;
      }
      uint64_t v87 = v86;

      id v88 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
      v125 = v87;
      id v28 = [v88 unmingledChangeWithScopedIdentifier:v87];

      if ([v28 isDelete])
      {

        id v28 = 0;
      }
      id v29 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8 otherScopedIdentifier:v87 targetState:1];

      id v23 = v7;
LABEL_14:
      int v12 = v29;
      if (v29) {
        goto LABEL_39;
      }
      goto LABEL_15;
    }
    id v40 = [v7 sharingRecordScopedIdentifier];
    Class v41 = [v40 identifier];
    int v42 = [v41 isEqualToString:@"__INVALID__"];

    if (v42)
    {
      if (_CPLSilentLogging)
      {
LABEL_126:
        v108 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8];

        id v23 = (id)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v8];
LABEL_127:
        id v28 = 0;
        v125 = 0;
        int v12 = v108;
LABEL_139:

        goto LABEL_140;
      }
      v43 = __CPLStorageOSLogDomain();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v128 = v8;
        _os_log_impl(&dword_1B4CAC000, v43, OS_LOG_TYPE_DEFAULT, "Sparse private %@ is pointing to an invalid shared record - deleting", buf, 0xCu);
      }
LABEL_125:

      goto LABEL_126;
    }
    if (v40 && self->_automaticallyFixBadPrivateAsset)
    {
      v66 = [v40 identifier];
      v67 = [v8 identifier];
      char v68 = [v66 isEqualToString:v67];

      if ((v68 & 1) == 0)
      {
        v69 = [CPLScopedIdentifier alloc];
        v70 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
        v71 = [v8 identifier];
        v72 = [(CPLScopedIdentifier *)v69 initWithScopeIdentifier:v70 identifier:v71];

        v43 = [(CPLEngineRemappedRecords *)self->_remappedRecords realScopedIdentifierForRemappedScopedIdentifier:v72];

        if (!v43
          || ([v43 identifier],
              v73 = objc_claimAutoreleasedReturnValue(),
              [v40 identifier],
              v74 = objc_claimAutoreleasedReturnValue(),
              char v75 = [v73 isEqualToString:v74],
              v74,
              v73,
              (v75 & 1) == 0))
        {
          if (!_CPLSilentLogging)
          {
            v109 = __CPLStorageOSLogDomain();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
            {
              v110 = [v43 identifier];
              *(_DWORD *)buf = 138412802;
              id v128 = v8;
              __int16 v129 = 2112;
              uint64_t v130 = (uint64_t)v40;
              __int16 v131 = 2114;
              id v132 = v110;
              _os_log_impl(&dword_1B4CAC000, v109, OS_LOG_TYPE_DEFAULT, "Sparse private %@ is pointing to %@ but the private sparse should be %{public}@ - deleting", buf, 0x20u);
            }
          }
          goto LABEL_125;
        }
      }
    }
    else if (!v40)
    {
      __int16 v93 = [CPLScopedIdentifier alloc];
      v94 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
      __int16 v95 = [v8 identifier];
      v89 = [(CPLScopedIdentifier *)v93 initWithScopeIdentifier:v94 identifier:v95];

LABEL_110:
      uint64_t v96 = [(CPLEngineRemappedRecords *)self->_remappedRecords realScopedIdentifierForRemappedScopedIdentifier:v89];
      uint64_t v97 = (void *)v96;
      if (v96) {
        v98 = (void *)v96;
      }
      else {
        v98 = v89;
      }
      v99 = v98;

      v100 = v99;
      v101 = [(CPLSharedBatchStorage *)self _correctPrivateScopedIdentifierForSharedScopedIdentifier:v99 currentPrivateScopedIdentifier:v8];
      if (([v101 isEqual:v8] & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v107 = __CPLStorageOSLogDomain();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v128 = v8;
            __int16 v129 = 2112;
            uint64_t v130 = (uint64_t)v100;
            __int16 v131 = 2112;
            id v132 = v101;
            _os_log_impl(&dword_1B4CAC000, v107, OS_LOG_TYPE_DEFAULT, "Sparse private %@ is pointing to %@ but the private sparse should be %@ - ignoring", buf, 0x20u);
          }
        }
        v108 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8];

        id v23 = (id)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v8];
        goto LABEL_127;
      }
      v102 = v101;
      [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
      v104 = v103 = v100;
      uint64_t v105 = [v104 unmingledChangeWithScopedIdentifier:v103];

      v125 = v103;
      if (v105)
      {
        v106 = (void *)v105;
        id v28 = 0;
      }
      else
      {
        id v28 = [(CPLEngineIgnoredRecords *)self->_ignoredRecords recordWithScopedIdentifier:v103];
        v106 = v28;
        if (!v28)
        {
          v118 = v102;
          if (!v12)
          {
            int v12 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:v8];
          }
          if (([v12 targetState] & 0xFFFFFFFFFFFFFFFELL) != 2
            || ([(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0], (uint64_t v120 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v111 = 0;
            id v28 = 0;
            goto LABEL_137;
          }
          v121 = (void *)v120;
          v123 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8 otherScopedIdentifier:v103 targetState:3];

          v111 = 0;
          id v28 = 0;
          uint64_t v117 = 0;
          v116 = v121;
          goto LABEL_135;
        }
      }
      v111 = v106;
      int v112 = [v106 isDelete];
      v113 = [CPLRecordTarget alloc];
      if (v112)
      {
        uint64_t v114 = [(CPLRecordTarget *)v113 initWithScopedIdentifier:v8 otherScopedIdentifier:v125 targetState:0];

LABEL_136:
        int v12 = (void *)v114;
        v118 = v102;
LABEL_137:
        id v23 = (id)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v8];
        goto LABEL_138;
      }
      uint64_t v114 = [(CPLRecordTarget *)v113 initWithScopedIdentifier:v8 otherScopedIdentifier:v125 targetState:3];

      uint64_t v115 = [(CPLSharedBatchStorage *)self _remapSharedRecord:v111 target:v114];
      if (!v115) {
        goto LABEL_136;
      }
      v116 = (void *)v115;
      v123 = (CPLRecordTarget *)v114;
      uint64_t v117 = 1;
      v118 = v102;
LABEL_135:
      [(CPLSharedRecordMerger *)self->_merger mergeRecord:v116 isSharedRecord:v117 inPrivateRecord:v7];
      id v23 = v7;

      int v12 = v123;
LABEL_138:

      goto LABEL_139;
    }
    v89 = v40;
    goto LABEL_110;
  }
  __int16 v13 = [CPLScopedIdentifier alloc];
  id v14 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
  uint64_t v15 = [v8 identifier];
  uint64_t v16 = [(CPLScopedIdentifier *)v13 initWithScopeIdentifier:v14 identifier:v15];

  char v17 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
  v125 = (__CFString *)v16;
  __int16 v18 = [v17 unmingledChangeWithScopedIdentifier:v16];

  if (v18) {
    goto LABEL_5;
  }
  v33 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:1];
  if (v33)
  {
    id v34 = v33;
    id v35 = [v33 sharingRecordChangeData];

    if (v35)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v36 = __CPLStorageOSLogDomain();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v128 = v34;
          __int16 v129 = 2112;
          uint64_t v130 = v16;
          _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_DEFAULT, "Upgrading %@ in cloud cache to shared master %@", buf, 0x16u);
        }
      }
      __int16 v18 = (void *)[v34 copy];

      [v18 setScopedIdentifier:v16];
      [v18 awakeFromStorage];
      id v37 = [v18 sharingRecordChangeData];
      [v18 setRecordChangeData:v37];

      [v18 setSharingRecordChangeData:0];
      if (v18)
      {
LABEL_5:
        int v19 = [v18 isDelete];
        int v20 = [v7 isDelete];
        uint64_t v21 = [CPLRecordTarget alloc];
        if (v19)
        {
          uint64_t v22 = [(CPLRecordTarget *)v21 initWithScopedIdentifier:v8 otherScopedIdentifier:v16 targetState:v20 ^ 1u];

          id v23 = v7;
          [v23 setSharingRecordChangeData:0];
        }
        else
        {
          if (!v20)
          {
            uint64_t v22 = [(CPLRecordTarget *)v21 initWithScopedIdentifier:v8 otherScopedIdentifier:v16 targetState:3];

            id v23 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v18 target:v22];
            id v44 = [v7 recordChangeData];
            [v23 setRecordChangeData:v44];

            id v28 = v7;
            goto LABEL_37;
          }
          uint64_t v22 = [(CPLRecordTarget *)v21 initWithScopedIdentifier:v8 otherScopedIdentifier:v16 targetState:2];

          id v23 = [(CPLSharedBatchStorage *)self _sharedRecordAsPrivateRecord:v18 target:v22];
          [v23 setRecordChangeData:0];
        }

        id v28 = 0;
LABEL_37:
        int v12 = (void *)v22;
        goto LABEL_38;
      }
    }
    else
    {
    }
  }
  v64 = v12;
  if (!v12)
  {
    v64 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:v8];
  }
  int v12 = v64;
  switch([v64 targetState])
  {
    case 0:
      v65 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8 otherScopedIdentifier:v16 targetState:1];

      id v23 = v7;
      id v28 = 0;
      int v12 = v65;
      goto LABEL_38;
    case 1:
      if ([v7 isDelete])
      {
        v76 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8 otherScopedIdentifier:v16 targetState:0];

        int v12 = v76;
      }
      goto LABEL_83;
    case 2:
      if (![v7 isDelete])
      {
        id v28 = (id)[v7 copy];
        id v90 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v8 otherScopedIdentifier:v16 targetState:3];

        uint64_t v91 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0];
        if (v91)
        {
          id v23 = (id)v91;
          v92 = [v7 recordChangeData];
          [v23 setRecordChangeData:v92];
        }
        else
        {
          id v23 = v7;
        }
        int v12 = v90;
LABEL_38:
        if (v12) {
          goto LABEL_39;
        }
LABEL_15:
        if (!_CPLSilentLogging)
        {
          id v30 = __CPLStorageOSLogDomain();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v128 = v7;
            _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Target for %@ should have been determined by now", buf, 0xCu);
          }
        }
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        int v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
        [v31 handleFailureInMethod:v124, self, v32, 450, @"Target for %@ should have been determined by now", v7 object file lineNumber description];
LABEL_158:

        abort();
      }
      id v23 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0];
      if (!v23) {
LABEL_86:
      }
        id v23 = v7;
LABEL_87:
      [v23 setRecordChangeData:0];
LABEL_88:
      id v28 = 0;
      if (!v12) {
        goto LABEL_15;
      }
LABEL_39:
      __int16 v45 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
      [v45 setTarget:v12 forRecordWithScopedIdentifier:v8];

      if (!v23)
      {
        if (!_CPLSilentLogging)
        {
          v122 = __CPLStorageOSLogDomain();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v128 = v7;
            _os_log_impl(&dword_1B4CAC000, v122, OS_LOG_TYPE_ERROR, "failed to create merged private record from %@", buf, 0xCu);
          }
        }
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        int v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
        [v31 handleFailureInMethod:v124, self, v32, 453, @"failed to create merged private record from %@", v7 object file lineNumber description];
        goto LABEL_158;
      }
      Class v46 = v12;
      __int16 v47 = v125;
      if (a4)
      {
        id v48 = v125;
        *a4 = v48;
        if (v48) {
          [(NSMutableDictionary *)self->_alreadyProcessedChanges setObject:v23 forKeyedSubscript:v48];
        }
      }
      [v23 setSharingRecordIdentifier:0];
      id v126 = 0;
      char v49 = [v23 validateChangeWithError:&v126];
      id v50 = v126;
      if ((v49 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v51 = __CPLStorageOSLogDomain();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = objc_opt_class();
            *(_DWORD *)buf = 138413314;
            id v128 = v52;
            __int16 v129 = 2112;
            uint64_t v130 = (uint64_t)v8;
            __int16 v131 = 2112;
            id v132 = v23;
            __int16 v133 = 2112;
            v134 = v46;
            __int16 v135 = 2112;
            id v136 = v50;
            id v53 = v52;
            _os_log_impl(&dword_1B4CAC000, v51, OS_LOG_TYPE_ERROR, "Failed to merge incoming private <%@ %@>: %@ (%@): %@", buf, 0x34u);

            __int16 v47 = v125;
          }
        }
        uint64_t v54 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0];

        id v23 = (id)v54;
        if (!v54) {
          id v23 = (id)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v8];
        }
      }
      [(NSMutableDictionary *)self->_alreadyProcessedChanges setObject:v23 forKeyedSubscript:v8];
      if (!_CPLSilentLogging)
      {
        v55 = __CPLStorageOSLogDomain();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          v56 = @"no shared record";
          *(_DWORD *)buf = 138412802;
          if (v47) {
            v56 = v47;
          }
          id v128 = v8;
          __int16 v129 = 2112;
          uint64_t v130 = (uint64_t)v56;
          __int16 v131 = 2112;
          id v132 = v23;
          _os_log_impl(&dword_1B4CAC000, v55, OS_LOG_TYPE_DEBUG, "Merging private record %@/%@ to %@", buf, 0x20u);
        }
      }
      if (v28) {
        [v23 _setIgnoredRecord:v28];
      }
      id v10 = v23;

LABEL_59:
      return v10;
    case 3:
      if (![v7 isDelete])
      {
        id v28 = (id)[v7 copy];
        id v23 = v7;
        goto LABEL_38;
      }
      v77 = [(CPLEngineCloudCache *)self->_cloudCache recordWithScopedIdentifier:v8 isFinal:0];
      if (!v77)
      {
LABEL_83:
        id v23 = v7;
        goto LABEL_88;
      }
      id v23 = v77;
      [v77 setRecordChangeData:0];
      v78 = [CPLRecordTarget alloc];
      v79 = v8;
      uint64_t v80 = v16;
      break;
    default:
      id v28 = 0;
      id v23 = 0;
      goto LABEL_38;
  }
  goto LABEL_93;
}

- (id)_correctPrivateScopedIdentifierForSharedScopedIdentifier:(id)a3 currentPrivateScopedIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = -[CPLEngineRemappedRecords scopedIdentifiersRemappedToScopedIdentifier:](self->_remappedRecords, "scopedIdentifiersRemappedToScopedIdentifier:", a3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    id v13 = v10;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
      uint64_t v15 = [CPLScopedIdentifier alloc];
      uint64_t v16 = [v14 identifier];
      id v10 = [(CPLScopedIdentifier *)v15 initRelativeToScopedIdentifier:v6 identifier:v16];

      if ([(CPLEngineCloudCache *)self->_cloudCache hasRecordWithScopedIdentifier:v10])
      {
        break;
      }

      ++v12;
      id v13 = v10;
      if (v9 == v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    if (v10) {
      goto LABEL_15;
    }
  }
  else
  {
    id v10 = 0;
LABEL_13:

    id v13 = v10;
  }
  id v13 = v13;
  id v10 = v13;
LABEL_15:
  if (v10) {
    char v17 = v10;
  }
  else {
    char v17 = v6;
  }
  id v18 = v17;

  return v18;
}

- (id)_sharedRecordAsPrivateRecord:(id)a3 target:(id)a4
{
  id v6 = a3;
  id v7 = [(CPLSharedBatchStorage *)self _remapSharedRecord:v6 target:a4];
  uint64_t v8 = [v6 recordChangeData];
  [v7 setSharingRecordChangeData:v8];

  [v7 setRecordChangeData:0];
  uint64_t v9 = [v6 scopedIdentifier];

  id v10 = [v9 scopeIdentifier];
  [v7 setSharingScopeIdentifier:v10];

  return v7;
}

- (id)_remapSharedRecord:(id)a3 target:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      char v17 = __CPLStorageOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "%@ should have a target here", buf, 0xCu);
      }
    }
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    int v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
    [v18 handleFailureInMethod:a2, self, v19, 115, @"%@ should have a target here", v7 object file lineNumber description];

    abort();
  }
  uint64_t v9 = v8;
  id v23 = 0;
  id v10 = [v7 translateToClientChangeUsingIDMapping:self error:&v23];
  id v11 = v23;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      long long v20 = __CPLStorageOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v7;
        __int16 v26 = 2112;
        id v27 = v11;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Failed to remap shared record %@: %@", buf, 0x16u);
      }
    }
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m"];
    [v21 handleFailureInMethod:a2, self, v22, 118, @"Failed to remap shared record %@: %@", v7, v11 object file lineNumber description];

    abort();
  }
  uint64_t v12 = [v10 scopedIdentifier];
  id v13 = [v9 scopedIdentifier];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [v9 scopedIdentifier];
    [v10 setScopedIdentifier:v15];

    [v10 awakeFromStorage];
  }

  return v10;
}

- (BOOL)isRecordWithScopedIdentifierStashed:(id)a3
{
  id v4 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:a3];
  id v5 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
  id v6 = [v4 scopedIdentifier];
  char v7 = [v5 hasStashedRecordWithScopedIdentifier:v6];

  if (v7)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    id v8 = [v4 otherScopedIdentifier];

    if (v8)
    {
      uint64_t v9 = [v4 otherScopedIdentifier];
      LOBYTE(v8) = [v5 hasStashedRecordWithScopedIdentifier:v9];
    }
  }

  return (char)v8;
}

- (BOOL)stashChange:(id)a3 error:(id *)a4
{
  id v6 = [a3 scopedIdentifier];
  char v7 = [(CPLSharedBatchStorage *)self _targetForPrivateScopedIdentifier:v6];

  id v8 = [(CPLEngineTransientRepositoryBatchStorage *)self transientRepository];
  uint64_t v9 = [v7 scopedIdentifier];
  int v10 = [v8 stashChangeWithScopedIdentifier:v9 error:a4];

  if (v10)
  {
    id v11 = [v7 otherScopedIdentifier];

    if (v11)
    {
      uint64_t v12 = [v7 otherScopedIdentifier];
      char v13 = [v8 stashChangeWithScopedIdentifier:v12 error:a4];
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)_privateScopedIdentifierForSharedScopedIdentifier:(id)a3
{
  id v3 = [(CPLSharedBatchStorage *)self _targetForSharedScopedIdentifier:a3];
  id v4 = [v3 scopedIdentifier];

  return v4;
}

- (id)_targetForSharedScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
  id v6 = [v5 targetForRecordWithOtherScopedIdentifier:v4];

  if (!v6)
  {
    id v6 = [(CPLEngineCloudCache *)self->_cloudCache targetForRecordWithSharedCloudScopedIdentifier:v4 trustRecordChangeData:1];
    char v7 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
    id v8 = [v6 scopedIdentifier];
    [v7 addKnownTarget:v6 forRecordWithScopedIdentifier:v8];
  }
  return v6;
}

- (id)_targetForPrivateScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
  id v6 = [v5 targetForRecordWithScopedIdentifier:v4];

  if (!v6)
  {
    id v6 = [(CPLEngineCloudCache *)self->_cloudCache targetForRecordWithCloudScopedIdentifier:v4 trustRecordChangeData:1];
    char v7 = [(CPLEngineTransientRepositoryBatchStorage *)self targetMapping];
    [v7 addKnownTarget:v6 forRecordWithScopedIdentifier:v4];
  }
  return v6;
}

- (CPLSharedBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4 sharedScope:(id)a5 merger:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CPLSharedBatchStorage;
  char v13 = [(CPLEngineTransientRepositoryBatchStorage *)&v27 initWithTransientRepository:v10 scope:a4];
  char v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sharedScope, a5);
    objc_storeStrong((id *)&v14->_merger, a6);
    uint64_t v15 = [v10 engineStore];
    uint64_t v16 = [v15 cloudCache];
    cloudCache = v14->_cloudCache;
    v14->_cloudCache = (CPLEngineCloudCache *)v16;

    uint64_t v18 = [v15 ignoredRecords];
    ignoredRecords = v14->_ignoredRecords;
    v14->_ignoredRecords = (CPLEngineIgnoredRecords *)v18;

    uint64_t v20 = [v15 remappedRecords];
    remappedRecords = v14->_remappedRecords;
    v14->_remappedRecords = (CPLEngineRemappedRecords *)v20;

    long long v22 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    now = v14->_now;
    v14->_now = v22;

    char v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v25 = [v24 valueForKey:@"CPLAutomaticallyFixBadSparsePrivateAsset"];

    if (v25)
    {
      if (objc_opt_respondsToSelector()) {
        v14->_automaticallyFixBadPrivateAsset = [v25 BOOLValue];
      }
    }
    else
    {
      v14->_automaticallyFixBadPrivateAsset = 0;
    }
  }
  return v14;
}

@end
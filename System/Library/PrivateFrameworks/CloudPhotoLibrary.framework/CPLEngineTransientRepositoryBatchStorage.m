@interface CPLEngineTransientRepositoryBatchStorage
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)isRecordWithScopedIdentifierStashed:(id)a3;
- (BOOL)removeChange:(id)a3 error:(id *)a4;
- (BOOL)stashChange:(id)a3 error:(id *)a4;
- (CPLEngineScope)scope;
- (CPLEngineTransientRepository)transientRepository;
- (CPLEngineTransientRepositoryBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4;
- (CPLRecordTargetMapping)targetMapping;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5;
- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)changeWithScopedIdentifier:(id)a3;
- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3;
- (void)beginExtractingBatch;
- (void)cleanupAfterExtractingBatch;
@end

@implementation CPLEngineTransientRepositoryBatchStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_transientRepository, 0);
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineTransientRepository)transientRepository
{
  return self->_transientRepository;
}

- (void)cleanupAfterExtractingBatch
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(CPLRecordTargetMapping *)self->_targetMapping hasUpdatedTargets]) {
    BOOL v3 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    v4 = __CPLStorageOSLogDomain_497();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(CPLRecordTargetMapping *)self->_targetMapping updatedTargetsDescription];
      int v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "After extraction, updated targets:\n%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)beginExtractingBatch
{
  BOOL v3 = objc_alloc_init(CPLRecordTargetMapping);
  targetMapping = self->_targetMapping;
  self->_targetMapping = v3;

  v5 = self->_targetMapping;
  [(CPLRecordTargetMapping *)v5 startTrackingUpdates];
}

- (BOOL)removeChange:(id)a3 error:(id *)a4
{
  transientRepository = self->_transientRepository;
  int v6 = [a3 scopedIdentifier];
  LOBYTE(a4) = [(CPLEngineTransientRepository *)transientRepository markUnmingledChangeWithScopedIdentifierAsMingled:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  return [(CPLEngineTransientRepository *)self->_transientRepository hasUnmingledNonStashedRecordsForScopeWithIdentifier:a3];
}

- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m"];
  uint64_t v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 73, @"%@ should not be used on %@", v8, objc_opt_class() object file lineNumber description];

  abort();
}

- (id)changeWithScopedIdentifier:(id)a3
{
  return [(CPLEngineTransientRepository *)self->_transientRepository unmingledChangeWithScopedIdentifier:a3];
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  return [(CPLEngineTransientRepository *)self->_transientRepository allUnmingledNonDeletedChangesWithClass:a3 scopeIdentifier:a4];
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  return [(CPLEngineTransientRepository *)self->_transientRepository allUnmingledChangesWithScopeIdentifier:a3];
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m"];
  v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 57, @"Trying to extract batches using unsupported %@", v9 object file lineNumber description];

  abort();
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5
{
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m"];
  v10 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, v9, 53, @"Trying to extract batches using unsupported %@", v10 object file lineNumber description];

  abort();
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5
{
  id v9 = a4;
  if (a5)
  {
    if (a5 != 1024)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m"];
      v18 = +[CPLRecordChange descriptionForChangeType:a5];
      [v16 handleFailureInMethod:a2, self, v17, 48, @"Trying to extract batches using change type %@", v18 object file lineNumber description];

      abort();
    }
    transientRepository = self->_transientRepository;
    v11 = [(CPLEngineScope *)self->_scope scopeIdentifier];
    uint64_t v12 = [(CPLEngineTransientRepository *)transientRepository allUnmingledDeletedChangesWithClass:a3 scopeIdentifier:v11];
  }
  else
  {
    v13 = self->_transientRepository;
    v11 = [(CPLEngineScope *)self->_scope scopeIdentifier];
    uint64_t v12 = [(CPLEngineTransientRepository *)v13 allUnmingledNonDeletedChangesWithClass:a3 scopeIdentifier:v11];
  }
  v14 = (void *)v12;

  return v14;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  return [(CPLEngineTransientRepository *)self->_transientRepository allUnmingledChangesWithClass:a3 relatedScopedIdentifier:a4];
}

- (BOOL)isRecordWithScopedIdentifierStashed:(id)a3
{
  return [(CPLEngineTransientRepository *)self->_transientRepository hasStashedRecordWithScopedIdentifier:a3];
}

- (BOOL)stashChange:(id)a3 error:(id *)a4
{
  transientRepository = self->_transientRepository;
  id v6 = [a3 scopedIdentifier];
  LOBYTE(a4) = [(CPLEngineTransientRepository *)transientRepository stashChangeWithScopedIdentifier:v6 error:a4];

  return (char)a4;
}

- (CPLEngineTransientRepositoryBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineTransientRepositoryBatchStorage;
  id v9 = [(CPLEngineTransientRepositoryBatchStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transientRepository, a3);
    objc_storeStrong((id *)&v10->_scope, a4);
  }

  return v10;
}

@end
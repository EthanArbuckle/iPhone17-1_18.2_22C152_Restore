@interface CPLInvalidBatchStorage
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (CPLInvalidBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4;
@end

@implementation CPLInvalidBatchStorage

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineTransientRepositoryBatchStorage *)self scope];
  v6 = [v5 scopeIdentifier];
  char v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLInvalidBatchStorage;
    BOOL v8 = [(CPLEngineTransientRepositoryBatchStorage *)&v10 hasChangesInScopeWithIdentifier:v4];
  }

  return v8;
}

- (CPLInvalidBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 hasUnmingledChangesForScope:v8])
  {
    if (!_CPLSilentLogging)
    {
      v11 = __CPLStorageOSLogDomain_497();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ should have no changes to mingle any more", buf, 0xCu);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m"];
    [v12 handleFailureInMethod:a2, self, v13, 100, @"%@ should have no changes to mingle any more", v8 object file lineNumber description];

    abort();
  }
  v14.receiver = self;
  v14.super_class = (Class)CPLInvalidBatchStorage;
  v9 = [(CPLEngineTransientRepositoryBatchStorage *)&v14 initWithTransientRepository:v7 scope:v8];

  return v9;
}

@end
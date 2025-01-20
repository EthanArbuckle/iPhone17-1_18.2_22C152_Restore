@interface CPLUploadComputeStatesTask
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)taskIdentifier;
@end

@implementation CPLUploadComputeStatesTask

- (id)taskIdentifier
{
  return @"engine.sync.uploadcomputestates";
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [CPLUploadComputeStatesScopeTask alloc];
  v15 = [(CPLEngineSyncTask *)self engineLibrary];
  v16 = [(CPLUploadComputeStatesScopeTask *)v14 initWithEngineLibrary:v15 session:v12 clientCacheIdentifier:v10 scope:v13 transportScope:v11];

  return v16;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  v3 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  v4 = [v3 enumeratorForScopesNeedingToUploadComputeState];

  return v4;
}

@end
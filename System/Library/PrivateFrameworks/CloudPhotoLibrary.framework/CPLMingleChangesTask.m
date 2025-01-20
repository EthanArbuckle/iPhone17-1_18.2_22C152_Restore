@interface CPLMingleChangesTask
- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4;
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)scopeFilterInTransaction:(id)a3;
- (id)taskIdentifier;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLMingleChangesTask

- (id)taskIdentifier
{
  return @"engine.sync.mingle";
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  [(CPLMingleChangesTask *)self hash];
  kdebug_trace();
  if (!v4)
  {
    v5 = [(CPLEngineSyncTask *)self session];
    [v5 noteClientNeedsToPullIfNecessary];
  }
  v6.receiver = self;
  v6.super_class = (Class)CPLMingleChangesTask;
  [(CPLEngineSyncTask *)&v6 taskDidFinishWithError:v4];
}

- (void)launch
{
  [(CPLMingleChangesTask *)self hash];
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CPLMingleChangesTask;
  [(CPLEngineMultiscopeSyncTask *)&v3 launch];
}

- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLMingleChangesTask;
  if (![(CPLEngineMultiscopeSyncTask *)&v22 shouldProcessScope:v6 inTransaction:a4])
  {
    v9 = [(CPLEngineMultiscopeSyncTask *)self scopes];
    goto LABEL_9;
  }
  BOOL v7 = +[CPLScopeChange supportsDirectMinglingForScopeWithType:](CPLScopeChange, "supportsDirectMinglingForScopeWithType:", [v6 scopeType]);
  v8 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  v9 = v8;
  if (!v7)
  {
LABEL_9:
    int v11 = 0;
    goto LABEL_10;
  }
  if ([v8 valueForFlag:52 forScope:v6])
  {
    if (_CPLSilentLogging)
    {
      LOBYTE(v11) = 0;
      goto LABEL_16;
    }
    v10 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring mingling for %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if ([(CPLEngineSyncTask *)self forceSync]) {
    goto LABEL_21;
  }
  v15 = [v9 transientSyncAnchorForScope:v6];
  if (v15)
  {

LABEL_21:
    int v11 = 1;
    goto LABEL_10;
  }
  v16 = [v9 engineStore];
  v17 = [v16 transientPullRepository];
  char v18 = [v17 hasUnmingledChangesForScope:v6];

  if (v18) {
    goto LABEL_21;
  }
  v19 = [v9 sharingScopeForScope:v6];
  if (v19)
  {
    v20 = [v9 engineStore];
    v21 = [v20 transientPullRepository];
    int v11 = [v21 hasUnmingledChangesForScope:v19];
  }
  else
  {
    int v11 = 0;
  }

LABEL_10:
  if (!_CPLSilentLogging)
  {
    v12 = __CPLTaskOSLogDomain_13362();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = @"NO";
      if (v11) {
        v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Should mingle changes for %@: %@", buf, 0x16u);
    }
  }
LABEL_16:

  return v11;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [CPLMingleChangesScopeTask alloc];
  v15 = [(CPLEngineSyncTask *)self engineLibrary];
  v16 = [(CPLMingleChangesScopeTask *)v14 initWithEngineLibrary:v15 session:v12 clientCacheIdentifier:v10 scope:v13 transportScope:v11];

  return v16;
}

- (id)scopeFilterInTransaction:(id)a3
{
  id v4 = [(CPLEngineSyncTask *)self session];
  v5 = [v4 scopeIdentifiersExcludedFromMingling];

  if (v5)
  {
    id v6 = [(CPLEngineMultiscopeSyncTask *)self scopes];
    BOOL v7 = [v6 filterForExcludedScopeIdentifiers:v5];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  objc_super v3 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  id v4 = [v3 enumeratorForScopesWithMingling];

  return v4;
}

@end
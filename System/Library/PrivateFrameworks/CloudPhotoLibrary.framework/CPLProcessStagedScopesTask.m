@interface CPLProcessStagedScopesTask
- (BOOL)shouldSkipScopesWithMissingTransportScope;
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)taskIdentifier;
- (void)didProcessStagedScope:(id)a3;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLProcessStagedScopesTask

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4 || !self->_hasProcessedStagedScopes)
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLProcessStagedScopesTask;
    [(CPLEngineSyncTask *)&v8 taskDidFinishWithError:v4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v5 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Some staged scopes have been fully processed, we will need to do some cleanup", buf, 2u);
      }
    }
    v6 = [(CPLEngineSyncTask *)self session];
    [v6 requestSyncStateAtEndOfSyncSession:2 reschedule:1];

    v7 = +[CPLErrors cplErrorWithCode:10000 description:@"Need to clean-up staged scopes"];
    v9.receiver = self;
    v9.super_class = (Class)CPLProcessStagedScopesTask;
    [(CPLEngineSyncTask *)&v9 taskDidFinishWithError:v7];
  }
}

- (id)taskIdentifier
{
  return @"engine.sync.processtagedscopes";
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [CPLProcessStagedScopesScopeTask alloc];
  v15 = [(CPLEngineSyncTask *)self engineLibrary];
  v16 = [(CPLProcessStagedScopesScopeTask *)v14 initWithEngineLibrary:v15 session:v12 clientCacheIdentifier:v10 scope:v13 transportScope:v11];

  return v16;
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 0;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  id v4 = [v3 primaryScope];
  if (v4)
  {
    v5 = [v3 sharingScopeForScope:v4];
    if (v5)
    {
      v6 = [v3 stagingScopeForScope:v5];

      if (v6)
      {
LABEL_4:
        v11[0] = v5;
        v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

        goto LABEL_13;
      }
      objc_super v8 = [v3 scopeChangeForScope:v5];
      if (v8
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v8 areSomeUsersExiting] & 1) != 0)
      {
        int v9 = [v3 valueForFlag:4 forScope:v5];

        if (!v9) {
          goto LABEL_4;
        }
      }
      else
      {
      }
    }
  }
  v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_13:

  return v7;
}

- (void)didProcessStagedScope:(id)a3
{
  self->_hasProcessedStagedScopes = 1;
}

@end
@interface CPLReshareTask
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)scopeFilterInTransaction:(id)a3;
- (id)taskIdentifier;
@end

@implementation CPLReshareTask

- (id)taskIdentifier
{
  return @"engine.sync.reshare";
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [CPLReshareScopeTask alloc];
  v15 = [(CPLEngineSyncTask *)self engineLibrary];
  v16 = [(CPLReshareScopeTask *)v14 initWithEngineLibrary:v15 session:v12 clientCacheIdentifier:v10 scope:v13 transportScope:v11];

  return v16;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  v5 = [v4 primaryScope];
  if (v5 && ([v4 valueForFlag:24 forScope:v5] & 1) == 0)
  {
    v6 = [v4 sharingScopeForScope:v5];
    if (v6)
    {
      if (([v4 valueForFlag:262232 forScope:v6] & 1) == 0)
      {
        v7 = [(CPLEngineSyncTask *)self engineLibrary];
        v8 = [v7 store];
        v9 = [v8 ignoredRecords];
        id v10 = [v6 scopeIdentifier];
        id v11 = _CPLCutoffDate();
        char v12 = [v9 scopeIdentifier:v10 hasIgnoredRecordsBeforeDate:v11];

        if (v12)
        {
          v15[0] = v6;
          id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

          goto LABEL_9;
        }
      }
    }
  }
  id v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:

  return v13;
}

- (id)scopeFilterInTransaction:(id)a3
{
  v4 = [(CPLEngineSyncTask *)self session];
  v5 = [v4 scopeIdentifiersExcludedFromMingling];

  if (v5)
  {
    v6 = [(CPLEngineMultiscopeSyncTask *)self scopes];
    v7 = [v6 filterForExcludedScopeIdentifiers:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
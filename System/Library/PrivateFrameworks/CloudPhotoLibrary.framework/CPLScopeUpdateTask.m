@interface CPLScopeUpdateTask
- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4;
- (BOOL)shouldSkipScopesWithMissingTransportScope;
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)taskIdentifier;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLScopeUpdateTask

- (void).cxx_destruct
{
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLScopeUpdateTask;
    [(CPLEngineSyncTask *)&v9 taskDidFinishWithError:v4];
  }
  else
  {
    v5 = [(CPLEngineSyncTask *)self engineLibrary];
    v6 = [v5 store];

    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke;
    v11[3] = &unk_1E60AB040;
    id v7 = v6;
    id v12 = v7;
    v13 = self;
    v14 = v15;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_5;
    v10[3] = &unk_1E60AB878;
    v10[4] = self;
    v10[5] = v15;
    id v8 = (id)[v7 performWriteTransactionWithBlock:v11 completionHandler:v10];

    _Block_object_dispose(v15, 8);
  }
}

void __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 scopes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_2;
  v7[3] = &unk_1E60AB850;
  id v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v6 = v5;
  [v4 do:v7];
}

void __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = [*(id *)(a1 + 32) session];
    [v4 requestSyncStateAtEndOfSyncSession:4 reschedule:1];
  }
  v5 = [v3 error];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 error];
    v15.receiver = v6;
    v15.super_class = (Class)CPLScopeUpdateTask;
    objc_msgSendSuper2(&v15, sel_taskDidFinishWithError_, v7);
  }
  else
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      v11 = [*(id *)(a1 + 32) engineLibrary];
      id v12 = [v11 supervisor];
      [v12 scopeUpdateTaskDidFinishSuccessfully:*(void *)(a1 + 32)];

      v13.receiver = *(id *)(a1 + 32);
      v13.super_class = (Class)CPLScopeUpdateTask;
      objc_msgSendSuper2(&v13, sel_taskDidFinishWithError_, 0);
      goto LABEL_12;
    }
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v9 = +[CPLEngineSyncManager shortDescriptionForState:4];
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Restarting from %@ to verify all scopes", buf, 0xCu);
      }
    }
    v10 = *(void **)(a1 + 32);
    id v7 = +[CPLErrors cplErrorWithCode:10000 description:@"Need to verify all scopes"];
    v14.receiver = v10;
    v14.super_class = (Class)CPLScopeUpdateTask;
    objc_msgSendSuper2(&v14, sel_taskDidFinishWithError_, v7);
  }

LABEL_12:
}

uint64_t __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = [*(id *)(a1 + 32) enumeratorForDeletedStagedScopes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v26 = a2;
    id v7 = 0;
    uint64_t v8 = *(void *)v30;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
      v11 = [*(id *)(a1 + 32) stagingScopeForScope:v10];
      if (v11)
      {
        if ([*(id *)(a1 + 32) valueForFlag:4 forScope:v11])
        {
          if (!_CPLSilentLogging)
          {
            id v12 = __CPLTaskOSLogDomain_16338();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v34 = v10;
              __int16 v35 = 2112;
              v36 = v11;
              objc_super v13 = v12;
              objc_super v14 = "%@ has been deleted and staged to %@ but this scope has also been deleted - removing staged flag";
              uint32_t v15 = 22;
              goto LABEL_20;
            }
            goto LABEL_21;
          }
          goto LABEL_22;
        }
      }
      else
      {
        char v16 = *(void **)(*(void *)(a1 + 40) + 152);
        v17 = [v10 scopeIdentifier];
        LODWORD(v16) = [v16 containsObject:v17];

        if (!v16)
        {
          if (!_CPLSilentLogging)
          {
            id v12 = __CPLTaskOSLogDomain_16338();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v10;
              objc_super v13 = v12;
              objc_super v14 = "%@ is staged and deleted with no corresponding staging scope - removing staged flag";
              uint32_t v15 = 12;
LABEL_20:
              _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
            }
LABEL_21:
          }
LABEL_22:
          v19 = *(void **)(a1 + 32);
          id v28 = v7;
          int v20 = [v19 setValue:0 forFlag:64 forScope:v10 error:&v28];
          id v21 = v28;

          if (!v20)
          {
            id v7 = v21;
LABEL_30:

            if (v26)
            {
              id v7 = v7;
              uint64_t v24 = 0;
              void *v26 = v7;
            }
            else
            {
              uint64_t v24 = 0;
            }
            goto LABEL_33;
          }
          v22 = *(void **)(a1 + 32);
          id v27 = v21;
          int v23 = [v22 setScopeNeedsToBePulledByClient:v10 error:&v27];
          id v7 = v27;

          if (!v23) {
            goto LABEL_30;
          }
          goto LABEL_24;
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v18 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v10;
            _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "%@ has just been deleted with no corresponding staging scope - checking all scopes before discarding it", buf, 0xCu);
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
LABEL_24:

      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v6) {
          goto LABEL_3;
        }

        goto LABEL_28;
      }
    }
  }

  id v7 = 0;
LABEL_28:
  uint64_t v24 = 1;
LABEL_33:

  return v24;
}

- (id)taskIdentifier
{
  return @"engine.sync.updatescope";
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  objc_super v14 = [CPLScopeUpdateScopeTask alloc];
  uint32_t v15 = [(CPLEngineSyncTask *)self engineLibrary];
  char v16 = [(CPLScopeUpdateScopeTask *)v14 initWithEngineLibrary:v15 session:v13 clientCacheIdentifier:v11 scope:v10 transportScope:v12];

  if (+[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [v10 scopeType]))
  {
    possibleStagedScopes = self->_possibleStagedScopes;
    if (!possibleStagedScopes)
    {
      uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v19 = self->_possibleStagedScopes;
      self->_possibleStagedScopes = v18;

      possibleStagedScopes = self->_possibleStagedScopes;
    }
    int v20 = [v10 scopeIdentifier];
    [(NSMutableSet *)possibleStagedScopes addObject:v20];
  }
  return v16;
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 0;
}

- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLScopeUpdateTask;
  BOOL v7 = -[CPLEngineMultiscopeSyncTask shouldProcessScope:inTransaction:](&v9, sel_shouldProcessScope_inTransaction_, v6, a4)|| [v6 scopeType] == 0;

  return v7;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  id v3 = [(CPLEngineMultiscopeSyncTask *)self scopes];
  id v4 = [v3 enumeratorForScopesNeedingUpdateFromTransport];

  return v4;
}

@end
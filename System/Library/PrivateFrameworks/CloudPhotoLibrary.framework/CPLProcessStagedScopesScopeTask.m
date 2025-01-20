@interface CPLProcessStagedScopesScopeTask
+ (void)initialize;
- (CPLProcessStagedScopesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (id)taskIdentifier;
- (void)_checkDestinationAndProcessCleanup;
- (void)_cleanupStagedScopeInTransaction:(id)a3 store:(id)a4;
- (void)_deleteStagingScopeIfNecessary;
- (void)_excludeScopes;
- (void)_startActualCleanup;
- (void)cancel;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLProcessStagedScopesScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_deleteTask, 0);
  objc_storeStrong((id *)&self->_cleanupTask, 0);
  objc_storeStrong((id *)&self->_checkDestinationTask, 0);
  objc_storeStrong((id *)&self->_stagingTransportScope, 0);
  objc_storeStrong((id *)&self->_destinationTransportScope, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_stagingScope, 0);
  objc_storeStrong((id *)&self->_destinationScopeChange, 0);
  objc_storeStrong((id *)&self->_destinationScope, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4 && (self->_destinationScope || self->_stagingScope))
  {
    v5 = [(CPLEngineScopedTask *)self store];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke;
    v12[3] = &unk_1E60AB550;
    id v13 = v5;
    v14 = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_3;
    v9[3] = &unk_1E60AB550;
    id v10 = v4;
    v11 = self;
    id v6 = v5;
    id v7 = (id)[v6 performWriteTransactionWithBlock:v12 completionHandler:v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLProcessStagedScopesScopeTask;
    [(CPLEngineSyncTask *)&v8 taskDidFinishWithError:v4];
  }
}

void __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_2;
  v6[3] = &unk_1E60AB750;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 do:v6];
}

void __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  id v4 = [a2 error];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v5 = *(void **)(a1 + 32);
  }
  v6.receiver = v3;
  v6.super_class = (Class)CPLProcessStagedScopesScopeTask;
  objc_msgSendSuper2(&v6, sel_taskDidFinishWithError_, v5);
}

uint64_t __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) scopes];
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 112);
  if (v5
    && ([v5 scopeIdentifier],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        [v4 scopeWithIdentifier:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7)
    && (int v8 = [v4 setScopeNeedsUpdateFromTransport:v7 error:a2], v7, !v8))
  {
    uint64_t v12 = 0;
  }
  else
  {
    v9 = *(void **)(*(void *)(a1 + 40) + 128);
    if (v9)
    {
      id v10 = [v9 scopeIdentifier];
      v11 = [v4 scopeWithIdentifier:v10];

      if (v11) {
        uint64_t v12 = [v4 setScopeNeedsUpdateFromTransport:v11 error:a2];
      }
      else {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
  }

  return v12;
}

- (id)taskIdentifier
{
  return @"engine.sync.processtagedscopes";
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLProcessStagedScopesScopeTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CPLProcessStagedScopesScopeTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  uint64_t v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __41__CPLProcessStagedScopesScopeTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) cancel];
  [*(id *)(*(void *)(a1 + 32) + 168) cancel];
  v2 = *(void **)(*(void *)(a1 + 32) + 176);
  return [v2 cancel];
}

- (void)launch
{
  v9.receiver = self;
  v9.super_class = (Class)CPLProcessStagedScopesScopeTask;
  [(CPLEngineSyncTask *)&v9 launch];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__CPLProcessStagedScopesScopeTask_launch__block_invoke;
  v8[3] = &unk_1E60A6598;
  v8[4] = self;
  v8[5] = a2;
  uint64_t v5 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v11 = v5;
  dispatch_block_t v6 = queue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

void __41__CPLProcessStagedScopesScopeTask_launch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) engineLibrary];
  v3 = [v2 store];

  id v4 = [v3 scopes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__CPLProcessStagedScopesScopeTask_launch__block_invoke_2;
  v9[3] = &unk_1E60AB528;
  uint64_t v5 = *(void *)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  id v11 = v3;
  uint64_t v12 = v5;
  id v6 = v3;
  id v7 = v4;
  id v8 = (id)[v6 performReadTransactionWithBlock:v9];
}

void __41__CPLProcessStagedScopesScopeTask_launch__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isScopeValidInTransaction:v3])
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 32) scope];
        *(_DWORD *)buf = 138412290;
        v58 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%@ is staged and needs to be cleaned-up first", buf, 0xCu);
      }
    }
    id v6 = [*(id *)(a1 + 32) session];
    id v7 = [*(id *)(a1 + 32) scope];
    uint64_t v8 = [*(id *)(a1 + 40) scopeForSharingScope:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 112);
    *(void *)(v9 + 112) = v8;

    id v11 = [*(id *)(*(void *)(a1 + 32) + 112) scopeIdentifier];
    uint64_t v12 = [*(id *)(a1 + 48) mainScopeIdentifier];
    int v13 = [v11 isEqualToString:v12];

    if (v13) {
      *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
    }
    if (*(void *)(*(void *)(a1 + 32) + 112))
    {
      uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "scopeChangeForScope:");
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(v15 + 120);
      *(void *)(v15 + 120) = v14;
    }
    uint64_t v17 = [*(id *)(a1 + 40) stagingScopeForScope:v7];
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 128);
    *(void *)(v18 + 128) = v17;

    uint64_t v20 = *(void *)(a1 + 32);
    if (*(void *)(v20 + 128))
    {
      if (*(void *)(v20 + 112))
      {
        v21 = objc_msgSend(*(id *)(a1 + 40), "flagsForScope:");
        if ([v21 valueForFlag:25])
        {
          if (!_CPLSilentLogging)
          {
            v22 = __CPLTaskOSLogDomain_20476();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(void *)(a1 + 32);
              v24 = *(void **)(v23 + 128);
              uint64_t v25 = *(void *)(v23 + 112);
              *(_DWORD *)buf = 138412802;
              v58 = v7;
              __int16 v59 = 2112;
              v60 = v24;
              __int16 v61 = 2112;
              uint64_t v62 = v25;
              _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "%@ is staged to %@ but %@ is disabled so the staging zone will just be considered as read-only too", buf, 0x20u);
            }
          }
          [*(id *)(a1 + 32) taskDidFinishWithError:0];
          goto LABEL_27;
        }
        if ([v21 valueForFlag:25])
        {
          v31 = [v7 scopeIdentifier];
          v32 = [*(id *)(*(void *)(a1 + 32) + 112) scopeIdentifier];
          [v6 noteSyncSessionInformation:@"%@ is staged and needs to be cleaned-up but %@ is not usable", v31, v32];

          [v6 requestSyncStateAtEndOfSyncSession:4 reschedule:0];
          v33 = *(void **)(a1 + 32);
          v34 = +[CPLErrors cplErrorWithCode:10000, @"%@ is inactive and needs to be refreshed", v7 description];
          [v33 taskDidFinishWithError:v34];

LABEL_27:
LABEL_48:

          goto LABEL_49;
        }
        if (!_CPLSilentLogging)
        {
          v36 = __CPLTaskOSLogDomain_20476();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = *(void *)(a1 + 32);
            v38 = *(void **)(v37 + 128);
            uint64_t v39 = *(void *)(v37 + 112);
            *(_DWORD *)buf = 138412802;
            v58 = v7;
            __int16 v59 = 2112;
            v60 = v38;
            __int16 v61 = 2112;
            uint64_t v62 = v39;
            _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_DEFAULT, "%@ is staged to %@ and needs to be cleaned-up to %@ allowing metadata sync", buf, 0x20u);
          }
        }
LABEL_34:

        if (!_dontProcessStagedScopes)
        {
          v40 = *(void **)(a1 + 32);
          if (v40[16])
          {
            if (v40[14])
            {
              [v40 _cleanupStagedScopeInTransaction:v3 store:*(void *)(a1 + 48)];
              goto LABEL_48;
            }
            if (!_CPLSilentLogging)
            {
              v54 = __CPLTaskOSLogDomain_20476();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v7;
                _os_log_impl(&dword_1B4CAC000, v54, OS_LOG_TYPE_ERROR, "We should have a destination scope for %@ at this point", buf, 0xCu);
              }
            }
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v55 = *(void *)(a1 + 56);
            uint64_t v56 = *(void *)(a1 + 32);
            v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m"];
            [v46 handleFailureInMethod:v55, v56, v53, 402, @"We should have a destination scope for %@ at this point", v7 object file lineNumber description];
          }
          else
          {
            if (!_CPLSilentLogging)
            {
              v50 = __CPLTaskOSLogDomain_20476();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v7;
                _os_log_impl(&dword_1B4CAC000, v50, OS_LOG_TYPE_ERROR, "We should have a staging scope for %@ at this point", buf, 0xCu);
              }
            }
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v51 = *(void *)(a1 + 56);
            uint64_t v52 = *(void *)(a1 + 32);
            v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m"];
            [v46 handleFailureInMethod:v51, v52, v53, 401, @"We should have a staging scope for %@ at this point", v7 object file lineNumber description];
          }

LABEL_66:
          abort();
        }
        goto LABEL_46;
      }
      v30 = [v7 scopeIdentifier];
      [v6 noteSyncSessionInformation:@"%@ is staged and needs to be cleaned-up but there is no destination scope to use", v30];

      [*(id *)(a1 + 32) _excludeScopes];
      [*(id *)(a1 + 32) taskDidFinishWithError:0];
LABEL_45:
      if (!_dontProcessStagedScopes)
      {
LABEL_47:
        [*(id *)(a1 + 32) _excludeScopes];
        [*(id *)(a1 + 32) taskDidFinishWithError:0];
        goto LABEL_48;
      }
LABEL_46:
      v42 = [v7 scopeIdentifier];
      [v6 noteSyncSessionInformation:@"Settings are preventing clean-up of %@", v42];

      goto LABEL_47;
    }
    v21 = [*(id *)(a1 + 40) scopeChangeForScope:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v43 = __CPLTaskOSLogDomain_20476();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v58 = v7;
          __int16 v59 = 2112;
          v60 = v44;
          id v45 = v44;
          _os_log_impl(&dword_1B4CAC000, v43, OS_LOG_TYPE_ERROR, "Unexpected scope change class for %@: %@", buf, 0x16u);
        }
      }
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v47 = *(void *)(a1 + 56);
      uint64_t v48 = *(void *)(a1 + 32);
      v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m"];
      [v46 handleFailureInMethod:v47, v48, v49, 370, @"Unexpected scope change class for %@: %@", v7, objc_opt_class() object file lineNumber description];

      goto LABEL_66;
    }
    if ([v21 isCurrentUserExiting])
    {
      if ([v7 scopeType] == 4)
      {
        v28 = [v21 exitingUserIdentifiers];
        uint64_t v29 = [v28 count];

        if (v29 == 1)
        {
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v7);
          goto LABEL_34;
        }
        v35 = [v7 scopeIdentifier];
        [v6 noteSyncSessionInformation:@"%@ is dismantled and is waiting for some users to be staged before being cleaned-up", v35];
        goto LABEL_44;
      }
    }
    else
    {
      if ([v21 areSomeUsersExiting])
      {
        v35 = [v7 scopeIdentifier];
        [v6 noteSyncSessionInformation:@"Waiting for other participants to exit %@ before allowing metadata sync", v35];
LABEL_44:

        goto LABEL_45;
      }
      if (!_CPLSilentLogging)
      {
        v41 = __CPLTaskOSLogDomain_20476();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v7;
          __int16 v59 = 2112;
          v60 = v21;
          _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_ERROR, "%@ needs to be cleaned-up but there is not staging scope available:\n%@", buf, 0x16u);
        }
      }
    }
    v35 = [v7 scopeIdentifier];
    [v6 noteSyncSessionInformation:@"%@ is waiting to be staged and needs to be cleaned-up before allowing metadata sync", v35];
    goto LABEL_44;
  }
  v26 = *(void **)(a1 + 32);
  v27 = +[CPLErrors operationCancelledError];
  [v26 taskDidFinishWithError:v27];

LABEL_49:
}

- (void)_cleanupStagedScopeInTransaction:(id)a3 store:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(CPLEngineSyncTask *)self engineLibrary];
  id v7 = [v6 transport];

  v24 = [v5 scopes];
  uint64_t v8 = [[CPLTransportScopeMapping alloc] initWithTranslator:v7];
  transportScopeMapping = self->_transportScopeMapping;
  self->_transportScopeMapping = v8;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  destinationScope = self->_destinationScope;
  v33[0] = self->_stagingScope;
  v33[1] = destinationScope;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(CPLEngineScope **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v24 transportScopeForScope:v15];
        if (!v16)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v20 = __CPLTaskOSLogDomain_20476();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = [(CPLEngineScopedTask *)self scope];
              *(_DWORD *)buf = 138412546;
              v30 = v15;
              __int16 v31 = 2112;
              v32 = v21;
              _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Transport scope for %@ is unknown. Can't clean-up %@", buf, 0x16u);
            }
          }
          v22 = +[CPLErrors cplErrorWithCode:32 description:@"missing transport scope"];
          [(CPLProcessStagedScopesScopeTask *)self taskDidFinishWithError:v22];

          goto LABEL_19;
        }
        uint64_t v17 = v16;
        if (self->_destinationScope == v15) {
          objc_storeStrong((id *)&self->_destinationTransportScope, v16);
        }
        if (v15 == self->_stagingScope) {
          objc_storeStrong((id *)&self->_stagingTransportScope, v17);
        }
        uint64_t v18 = self->_transportScopeMapping;
        v19 = [(CPLEngineScope *)v15 scopeIdentifier];
        [(CPLTransportScopeMapping *)v18 setObject:v17 forKeyedSubscript:v19];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  [(CPLProcessStagedScopesScopeTask *)self _checkDestinationAndProcessCleanup];
LABEL_19:
}

- (void)_checkDestinationAndProcessCleanup
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) engineLibrary];
  id v4 = [v3 scheduler];
  [v4 willRunEngineElement:CPLEngineElementProcessStagedScopes];

  int v5 = [*v2 isCancelled];
  id v6 = *v2;
  if (v5)
  {
    id v27 = +[CPLErrors operationCancelledError];
    [v6 taskDidFinishWithError:v27];
  }
  else
  {
    id v7 = [*v2 engineLibrary];
    id v8 = [v7 transport];

    uint64_t v9 = [v8 createGroupForStagedScopeCleanup];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 184);
    *(void *)(v10 + 184) = v9;

    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__20529;
    v34[4] = __Block_byref_object_dispose__20530;
    id v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 1;
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = v12[18];
    uint64_t v14 = v12[14];
    uint64_t v15 = v12[15];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_46;
    v28[3] = &unk_1E60AABA8;
    v28[4] = v12;
    id v16 = v8;
    id v29 = v16;
    v30 = v34;
    __int16 v31 = v32;
    uint64_t v17 = [v16 getScopeInfoWithTransportScope:v13 scope:v14 previousScopeChange:v15 completionHandler:v28];
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 160);
    *(void *)(v18 + 160) = v17;

    if (!_CPLSilentLogging)
    {
      uint64_t v20 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(a1 + 32);
        uint64_t v22 = v21[14];
        uint64_t v23 = [v21 scope];
        uint64_t v24 = *(void *)(a1 + 32);
        uint64_t v25 = *(void *)(v24 + 128);
        uint64_t v26 = *(void *)(v24 + 112);
        *(_DWORD *)buf = 138413058;
        uint64_t v37 = v22;
        __int16 v38 = 2112;
        uint64_t v39 = v23;
        __int16 v40 = 2112;
        uint64_t v41 = v25;
        __int16 v42 = 2112;
        uint64_t v43 = v26;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Checking %@ before clean-up of %@ (%@ -> %@)", buf, 0x2Au);
      }
    }
    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 160) withTransportGroup:*(void *)(*(void *)(a1 + 32) + 184)];

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);
  }
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_46(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 104);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_2;
  v24[3] = &unk_1E60AAB80;
  v24[4] = v15;
  id v25 = v14;
  id v26 = v11;
  id v27 = v12;
  uint64_t v31 = a2;
  id v28 = v13;
  id v29 = *(id *)(a1 + 40);
  long long v30 = *(_OWORD *)(a1 + 48);
  uint64_t v17 = v24;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v33 = v17;
  uint64_t v18 = v16;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v14;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0;

  id v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "taskDidFinishWithError:");
  }
  else
  {
    int v5 = [v4 store];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_3;
    v13[3] = &unk_1E60AAB58;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 96);
    v13[4] = v6;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = v5;
    id v7 = *(id *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 88);
    id v18 = v7;
    uint64_t v19 = v8;
    uint64_t v20 = v9;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_55;
    v12[3] = &unk_1E60AB7F0;
    v12[5] = v8;
    v12[6] = v9;
    void v12[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v11 = (id)[v10 performWriteTransactionWithBlock:v13 completionHandler:v12];
  }
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_3(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = a1[12];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = v3[14];
  uint64_t v6 = v3[18];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[8];
  uint64_t v10 = a1[9];
  id v11 = a2;
  id v12 = [v3 session];
  +[CPLScopeUpdateScopeTask updateScopeWithNewScopeType:v42 scope:v5 updatedScopeChange:v4 updatedFlags:v7 oldTransportScope:v6 updatedTransportScope:v8 shouldUpdateTransportScope:&__block_literal_global_20536 store:v9 transport:v10 session:v12 inTransaction:v11];

  id v13 = [v11 error];

  if (!v13)
  {
    id v14 = [(id)a1[8] scopes];
    id v15 = [v14 validLocalScopeIndexes];
    char v16 = objc_msgSend(v15, "containsIndex:", objc_msgSend(*(id *)(a1[4] + 112), "localIndex"));

    id v17 = a1;
    if (v16)
    {
      id v18 = [v14 flagsForScope:*(void *)(a1[4] + 112)];
      if ([v18 valueForFlag:52])
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v19 = __CPLTaskOSLogDomain_20476();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = (void *)v17[4];
            uint64_t v21 = v20[14];
            id v22 = [v20 scope];
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = v21;
            __int16 v45 = 2112;
            v46 = v22;
            _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "%@ has become invalid as a destination to clean-up %@", buf, 0x16u);
          }
        }
        dispatch_block_t v23 = [*(id *)(v17[4] + 112) scopeIdentifier];
        uint64_t v24 = +[CPLErrors cplErrorWithCode:32, @"%@ is not a valid destination for clean-up", v23 description];
        uint64_t v25 = *(void *)(v17[10] + 8);
        id v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
      else if ([v18 valueForFlag:8])
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v31 = __CPLTaskOSLogDomain_20476();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)v17[4];
            uint64_t v33 = v32[14];
            v34 = [v32 scope];
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = v33;
            __int16 v45 = 2112;
            v46 = v34;
            _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_DEFAULT, "%@ is disabled and thus not a good destination to clean-up %@", buf, 0x16u);
          }
        }
        *(unsigned char *)(*(void *)(v17[11] + 8) + 24) = 0;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v35 = __CPLTaskOSLogDomain_20476();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (void *)v17[4];
            uint64_t v37 = v36[14];
            __int16 v38 = [v36 scope];
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = v37;
            __int16 v45 = 2112;
            v46 = v38;
            _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_DEFAULT, "%@ is ready to be the destination to clean-up %@", buf, 0x16u);
          }
        }
        uint64_t v39 = [v14 scopeChangeForScope:*(void *)(v17[4] + 112)];
        uint64_t v40 = v17[4];
        uint64_t v41 = *(void **)(v40 + 120);
        *(void *)(v40 + 120) = v39;
      }
    }
    else
    {
      id v27 = [*(id *)(a1[4] + 112) scopeIdentifier];
      uint64_t v28 = +[CPLErrors cplErrorWithCode:32, @"%@ has become after updating scope info", v27 description];
      uint64_t v29 = *(void *)(a1[10] + 8);
      long long v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
  }
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_55(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 error];
  if (v3 || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) _startActualCleanup];
    goto LABEL_7;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v7 error];
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v4 taskDidFinishWithError:v6];

LABEL_7:
}

uint64_t __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_4()
{
  return 1;
}

- (void)_startActualCleanup
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isCancelled];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v22 = +[CPLErrors operationCancelledError];
    objc_msgSend(v3, "taskDidFinishWithError:");
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) engineLibrary];
    dispatch_block_t v5 = [v4 transport];

    uint64_t v6 = [v5 createGroupForStagedScopeCleanup];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 184);
    *(void *)(v7 + 184) = v6;

    uint64_t v9 = [*(id *)(a1 + 32) scope];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[16];
    uint64_t v12 = v10[14];
    uint64_t v13 = v10[17];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2;
    v24[3] = &unk_1E60AABD0;
    v24[4] = v10;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_41;
    v23[3] = &unk_1E60AB8A0;
    v23[4] = v10;
    uint64_t v14 = [v5 cleanupStagedScope:v9 stagingScope:v11 destinationScope:v12 transportScopeMapping:v13 progressHandler:v24 completionHandler:v23];
    uint64_t v15 = *(void *)(a1 + 32);
    char v16 = *(void **)(v15 + 168);
    *(void *)(v15 + 168) = v14;

    if (!_CPLSilentLogging)
    {
      id v17 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [*(id *)(a1 + 32) scope];
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(v19 + 128);
        uint64_t v21 = *(void *)(v19 + 112);
        *(_DWORD *)buf = 138412802;
        id v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        uint64_t v30 = v21;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Launching clean-up process of %@ (%@ -> %@)", buf, 0x20u);
      }
    }
    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 168) withTransportGroup:*(void *)(*(void *)(a1 + 32) + 184)];
  }
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 104);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_3;
  v7[3] = &unk_1E60A6598;
  v7[4] = v2;
  void v7[5] = a2;
  uint64_t v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v9 = v4;
  dispatch_block_t v5 = v3;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_block_t v5 = *(void **)(v4 + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2_42;
  v10[3] = &unk_1E60A6728;
  v10[4] = v4;
  id v11 = v3;
  dispatch_block_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2_42(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 168);
  *(void *)(v2 + 168) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if ([v4 isCPLErrorWithCode:255])
    {
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v5 = __CPLTaskOSLogDomain_20476();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_block_t v6 = [*(id *)(a1 + 32) scope];
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v6;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Clean-up of %@ is not implemented. Disabling metadata sync until some other device actually do the work", buf, 0xCu);
        }
      }
      uint64_t v7 = [*(id *)(a1 + 32) session];
      id v8 = [*(id *)(a1 + 32) scope];
      dispatch_block_t v9 = [v8 scopeIdentifier];
      [v7 noteSyncSessionInformation:@"Clean-up of %@ is not implemented. Disabling metadata sync until some other device does the work", v9];

      [*(id *)(a1 + 32) _excludeScopes];
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v18 = __CPLTaskOSLogDomain_20476();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [*(id *)(a1 + 32) scope];
          uint64_t v20 = *(void *)(a1 + 32);
          uint64_t v21 = *(void *)(a1 + 40);
          uint64_t v22 = *(void *)(v20 + 128);
          uint64_t v23 = *(void *)(v20 + 112);
          *(_DWORD *)buf = 138413058;
          uint64_t v25 = v19;
          __int16 v26 = 2112;
          uint64_t v27 = v22;
          __int16 v28 = 2112;
          uint64_t v29 = v23;
          __int16 v30 = 2112;
          uint64_t v31 = v21;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Clean-up of %@ (%@ -> %@) failed: %@", buf, 0x2Au);
        }
      }
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
    }
    return [v10 taskDidFinishWithError:v11];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v12 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 32) scope];
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(v14 + 128);
        uint64_t v16 = *(void *)(v14 + 112);
        *(_DWORD *)buf = 138413058;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v15;
        __int16 v28 = 2112;
        uint64_t v29 = v16;
        __int16 v30 = 2112;
        uint64_t v31 = v15;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Clean-up of %@ (%@ -> %@) finished. Deleting %@ now", buf, 0x2Au);
      }
    }
    return [*(id *)(a1 + 32) _deleteStagingScopeIfNecessary];
  }
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 168))
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(a1 + 32) scope];
        uint64_t v5 = *(void *)(a1 + 40);
        int v8 = 138412546;
        dispatch_block_t v9 = v4;
        __int16 v10 = 2048;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Estimated remaining count of records to clean-up %@: %lu", (uint8_t *)&v8, 0x16u);
      }
      uint64_t v2 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v2 + 192))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = [(id)v2 engineLibrary];
      [v7 setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:v6];
    }
  }
}

- (void)_deleteStagingScopeIfNecessary
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke;
  v6[3] = &unk_1E60A6598;
  void v6[4] = self;
  void v6[5] = a2;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v13 = +[CPLErrors operationCancelledError];
    [v3 taskDidFinishWithError:v13];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) engineLibrary];
    dispatch_block_t v5 = [v4 transport];

    long long v6 = *(_OWORD *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 152);
    uint64_t v9 = *(void *)(v7 + 128);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2;
    v14[3] = &unk_1E60AAB10;
    long long v15 = v6;
    uint64_t v10 = [v5 deleteTransportScope:v8 scope:v9 completionHandler:v14];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 176);
    *(void *)(v11 + 176) = v10;

    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 176) withTransportGroup:*(void *)(*(void *)(a1 + 32) + 184)];
  }
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_block_t v5 = *(void **)(v4 + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_3;
  v10[3] = &unk_1E60A65C0;
  v10[4] = v4;
  id v11 = v3;
  uint64_t v12 = *(void *)(a1 + 40);
  long long v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20474;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 176);
  *(void *)(v2 + 176) = 0;

  if (*(void *)(a1 + 40))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v6;
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
      }
    }
    uint64_t v7 = [*(id *)(a1 + 32) session];
    [v7 requestSyncStateAtEndOfSyncSession:4 reschedule:0];

    [*(id *)(a1 + 32) taskDidFinishWithError:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) engineLibrary];
    dispatch_block_t v9 = [v8 store];

    uint64_t v10 = [v9 scopes];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_26;
    v15[3] = &unk_1E60AB550;
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = v10;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_30;
    v14[3] = &unk_1E60AAAE8;
    uint64_t v11 = *(void *)(a1 + 48);
    void v14[4] = v16;
    v14[5] = v11;
    id v12 = v10;
    id v13 = (id)[v9 performWriteTransactionWithBlock:v15 completionHandler:v14];
  }
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_26(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2_27;
  v4[3] = &unk_1E60AB750;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 do:v4];
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        dispatch_block_t v9 = objc_opt_class();
        uint64_t v10 = *(void **)(a1 + 32);
        id v11 = v9;
        id v12 = [v10 delegate];
        *(_DWORD *)buf = 138412802;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        uint64_t v24 = v9;
        __int16 v25 = 2112;
        __int16 v26 = v12;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Delegate of %@ is supposed to be %@ but is %@", buf, 0x20u);
      }
    }
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m"];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [*(id *)(a1 + 32) delegate];
    [v13 handleFailureInMethod:v14, v15, v16, 164, @"Delegate of %@ is supposed to be %@ but is %@", v17, v18, v19 object file lineNumber description];

    abort();
  }
  uint64_t v4 = [*(id *)(a1 + 32) scope];
  [v3 didProcessStagedScope:v4];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v20 error];
  [v5 taskDidFinishWithError:v6];
}

uint64_t __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2_27(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_20476();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 128);
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Marking %@ as deleted", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t result = [*(id *)(a1 + 40) setValue:1 forFlag:4 forScope:*(void *)(*(void *)(a1 + 32) + 128) error:a2];
  if (result)
  {
    uint64_t v7 = [*(id *)(a1 + 32) scope];
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Removing staged flag from %@", (uint8_t *)&v11, 0xCu);
      }
    }
    if (![*(id *)(a1 + 40) setValue:0 forFlag:64 forScope:v7 error:a2]) {
      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v9 = __CPLTaskOSLogDomain_20476();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling cleanup tasks for %@", (uint8_t *)&v11, 0xCu);
      }
    }
    if ([*(id *)(a1 + 40) addCleanupTasksForScope:v7 error:a2])
    {
      int v10 = [*(id *)(a1 + 40) setScopeNeedsToBePulledByClient:v7 error:a2];

      if (v10) {
        return [*(id *)(a1 + 40) setScopeHasChangesToPullFromTransport:*(void *)(*(void *)(a1 + 32) + 112) error:a2];
      }
    }
    else
    {
LABEL_18:
    }
    return 0;
  }
  return result;
}

- (void)_excludeScopes
{
  id v7 = [(CPLEngineSyncTask *)self session];
  id v3 = [(CPLEngineScopedTask *)self scope];
  uint64_t v4 = [v3 scopeIdentifier];
  [v7 excludeScopeIdentifierFromPushToTransport:v4];

  destinationScope = self->_destinationScope;
  if (destinationScope)
  {
    uint64_t v6 = [(CPLEngineScope *)destinationScope scopeIdentifier];
    [v7 excludeScopeIdentifierFromPushToTransport:v6];
  }
  [v7 requestSyncStateAtEndOfSyncSession:4 reschedule:0];
}

- (CPLProcessStagedScopesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  v12.receiver = self;
  v12.super_class = (Class)CPLProcessStagedScopesScopeTask;
  id v7 = [(CPLEngineScopedTask *)&v12 initWithEngineLibrary:a3 session:a4 clientCacheIdentifier:a5 scope:a6 transportScope:a7];
  if (v7)
  {
    uint64_t v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("engine.sync.processtagedscopes", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

+ (void)initialize
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _dontProcessStagedScopes = [v2 BOOLForKey:@"CPLDontProcessStagedScopes"];
}

@end
@interface CPLScopeUpdateScopeTask
+ (void)_updateScopeWithNewScopeType:(int64_t)a3 scope:(id)a4 updatedScopeChange:(id)a5 updatedFlags:(id)a6 oldTransportScope:(id)a7 updatedTransportScope:(id)a8 shouldUpdateTransportScope:(id)a9 store:(id)a10 transport:(id)a11 session:(id)a12 inTransaction:(id)a13;
+ (void)updateScopeWithNewScopeType:(int64_t)a3 scope:(id)a4 updatedScopeChange:(id)a5 updatedFlags:(id)a6 oldTransportScope:(id)a7 updatedTransportScope:(id)a8 shouldUpdateTransportScope:(id)a9 store:(id)a10 transport:(id)a11 session:(id)a12 inTransaction:(id)a13;
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (CPLScopeUpdateScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (id)taskIdentifier;
- (void)_fetchTransportScope;
- (void)_getLibraryInfo;
- (void)_lookForStagingScopeWithIdentifier:(id)a3 transportScope:(id)a4;
- (void)_markScopeAsDeletedAndSucceedTaskWithFlags:(id)a3;
- (void)_markScopeAsFeatureDisabledWithFlags:(id)a3;
- (void)_markScopeHasBadTransportScopeWithError:(id)a3;
- (void)_performAdditionalChecksWithNewScopeType:(int64_t)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 oldTransportScope:(id)a6 updatedTransportScope:(id)a7 completionHandler:(id)a8;
- (void)_updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_updateScopeWithNewScopeType:(int64_t)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 oldTransportScope:(id)a6 session:(id)a7 updatedTransportScope:(id)a8;
- (void)cancel;
- (void)launch;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CPLScopeUpdateScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookForStagingScopeTask, 0);
  objc_storeStrong((id *)&self->_fetchedTransportScope, 0);
  objc_storeStrong((id *)&self->_fetchTransportScope, 0);
  objc_storeStrong((id *)&self->_getLibraryInfo, 0);
  objc_storeStrong((id *)&self->_previousScopeChange, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__CPLScopeUpdateScopeTask_task_didFinishWithError___block_invoke;
  v14[3] = &unk_1E60A6660;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v19 = v9;
  v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

uint64_t __51__CPLScopeUpdateScopeTask_task_didFinishWithError___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 152)) {
    return [*(id *)(result + 40) taskDidFinishWithError:*(void *)(result + 48)];
  }
  return result;
}

- (id)taskIdentifier
{
  return @"engine.sync.updatescope";
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CPLEngineSyncTask *)self session];
  int v6 = [v5 shouldDefer];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)dispatch_block_t v13 = 138412290;
        *(void *)&v13[4] = objc_opt_class();
        id v8 = *(id *)&v13[4];
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v13, 0xCu);
      }
    }
    v9 = +[CPLErrors sessionHasBeenDeferredError];
    [v4 setError:v9];

    BOOL v10 = 0;
  }
  else
  {
    id v11 = [v4 error];
    BOOL v10 = v11 == 0;
  }
  return v10;
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLScopeUpdateScopeTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__CPLScopeUpdateScopeTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __33__CPLScopeUpdateScopeTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) cancel];
  [*(id *)(*(void *)(a1 + 32) + 128) cancel];
  v2 = *(void **)(*(void *)(a1 + 32) + 152);
  return [v2 cancel];
}

- (void)launch
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CPLScopeUpdateScopeTask;
  [(CPLEngineSyncTask *)&v10 launch];
  v3 = [(CPLEngineScopedTask *)self transportScope];

  if (v3)
  {
    id v4 = [(CPLEngineScopedTask *)self store];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__CPLScopeUpdateScopeTask_launch__block_invoke;
    v9[3] = &unk_1E60AB578;
    v9[4] = self;
    id v5 = (id)[v4 performReadTransactionWithBlock:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v6 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(CPLEngineScopedTask *)self scope];
        objc_super v8 = [v7 scopeIdentifier];
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Will need to fetch transport scope for %@", buf, 0xCu);
      }
    }
    [(CPLScopeUpdateScopeTask *)self _fetchTransportScope];
  }
}

uint64_t __33__CPLScopeUpdateScopeTask_launch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) store];
  v3 = [v2 scopes];
  id v4 = [*(id *)(a1 + 32) scope];
  uint64_t v5 = [v3 scopeChangeForScope:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  objc_super v8 = *(void **)(a1 + 32);
  return [v8 _getLibraryInfo];
}

- (void)_fetchTransportScope
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v17 = +[CPLErrors operationCancelledError];
    [v3 taskDidFinishWithError:v17];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    dispatch_block_t v5 = [v4 transport];

    uint64_t v6 = [*(id *)(a1 + 32) scope];
    id v7 = *(unsigned char **)(a1 + 32);
    if (v7[144])
    {
      id v8 = 0;
    }
    else
    {
      id v8 = [v7 transportScope];
      id v7 = *(unsigned char **)(a1 + 32);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2;
    v18[3] = &unk_1E60AA2B0;
    v18[4] = v7;
    uint64_t v9 = [v5 fetchTransportScopeForScope:v6 transportScope:v8 completionHandler:v18];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 128);
    *(void *)(v10 + 128) = v9;

    if (!v8)
    {
      id v12 = [v6 scopeIdentifier];
      uint64_t v13 = [*(id *)(a1 + 32) store];
      uint64_t v14 = [v13 mainScopeIdentifier];
      int v15 = [v12 isEqualToString:v14];

      if (v15) {
        [*(id *)(*(void *)(a1 + 32) + 128) setShouldCreateScopeIfNecessary:1];
      }
    }
    v16 = [v5 createGroupForSetup];
    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 128) withTransportGroup:v16];
  }
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 104);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3;
  v18[3] = &unk_1E60A6750;
  id v19 = v9;
  id v20 = v7;
  uint64_t v21 = v10;
  id v22 = v8;
  id v12 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v24 = v12;
  uint64_t v13 = v11;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    if (*(void *)(a1 + 40))
    {
      id v2 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v3 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          id v4 = [*(id *)(a1 + 48) scope];
          dispatch_block_t v5 = [v4 scopeIdentifier];
          *(_DWORD *)buf = 138412290;
          v18 = v5;
          _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Transport returned no transport scope for %@ but no error either", buf, 0xCu);
        }
      }
      id v2 = +[CPLErrors unknownError];
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 136), *(id *)(a1 + 40));
  if (v2)
  {
    if ([v2 isCPLErrorWithCode:23])
    {
      [*(id *)(a1 + 48) _markScopeAsDeletedAndSucceedTaskWithFlags:*(void *)(a1 + 56)];
    }
    else
    {
      int v9 = [v2 isCPLErrorWithCode:1002];
      uint64_t v10 = *(void **)(a1 + 48);
      if (v9) {
        [v10 _markScopeAsFeatureDisabledWithFlags:0];
      }
      else {
        [v10 taskDidFinishWithError:v2];
      }
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 48) store];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_69;
    v15[3] = &unk_1E60AB550;
    int8x16_t v13 = *(int8x16_t *)(a1 + 40);
    id v7 = (id)v13.i64[0];
    int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3_71;
    v14[3] = &unk_1E60AB578;
    void v14[4] = *(void *)(a1 + 48);
    id v8 = (id)[v6 performWriteTransactionWithBlock:v15 completionHandler:v14];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = *(void **)(v11 + 128);
  *(void *)(v11 + 128) = 0;
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) store];
    dispatch_block_t v5 = [v4 scopes];

    uint64_t v6 = [*(id *)(a1 + 32) scope];
    uint64_t v7 = [v5 scopeChangeForScope:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 112);
    *(void *)(v8 + 112) = v7;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2_70;
    v14[3] = &unk_1E60AB778;
    id v15 = v5;
    id v16 = *(id *)(a1 + 40);
    id v17 = v6;
    uint64_t v18 = *(void *)(a1 + 32);
    id v10 = v6;
    id v11 = v5;
    [v3 do:v14];
  }
  else
  {
    id v12 = [v3 error];

    if (!v12)
    {
      int8x16_t v13 = +[CPLErrors operationCancelledError];
      [v3 setError:v13];
    }
  }
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3_71(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    dispatch_block_t v5 = [v6 error];
    [v4 taskDidFinishWithError:v5];
  }
  else
  {
    [v4 _getLibraryInfo];
  }
}

uint64_t __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2_70(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) setTransportScope:*(void *)(a1 + 40) forScope:*(void *)(a1 + 48) error:a2];
  if (result)
  {
    dispatch_block_t v5 = [*(id *)(a1 + 56) transportScope];

    if (v5)
    {
      return 1;
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 48);
      return [v6 setupInitialSyncTransportGroupsForScope:v7 error:a2];
    }
  }
  return result;
}

- (void)_getLibraryInfo
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v18 = +[CPLErrors operationCancelledError];
    [v3 taskDidFinishWithError:v18];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    dispatch_block_t v5 = [v4 transport];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[17];
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [v6 transportScope];
    }
    int v9 = v8;
    id v10 = [*(id *)(a1 + 32) scope];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 112);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_2;
    v19[3] = &unk_1E60AA288;
    v19[4] = v11;
    id v20 = v9;
    id v13 = v9;
    uint64_t v14 = [v5 getScopeInfoWithTransportScope:v13 scope:v10 previousScopeChange:v12 completionHandler:v19];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 120);
    *(void *)(v15 + 120) = v14;

    id v17 = [v5 createGroupForLibraryStateCheck];
    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 120) withTransportGroup:v17];
  }
}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 104);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_3;
  v24[3] = &unk_1E60AA260;
  id v25 = v14;
  uint64_t v26 = v15;
  uint64_t v31 = a2;
  id v27 = v11;
  id v28 = v12;
  id v29 = *(id *)(a1 + 40);
  id v30 = v13;
  id v17 = v24;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v33 = v17;
  id v18 = v16;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v14;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);
}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 isCPLErrorWithCode:32])
    {
      id v3 = *(unsigned char **)(a1 + 40);
      if (v3[144])
      {
        [v3 _markScopeHasBadTransportScopeWithError:*(void *)(a1 + 32)];
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v12 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [*(id *)(a1 + 40) scope];
            *(_DWORD *)buf = 138412290;
            dispatch_block_t v23 = v13;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "We will need to determine the transport scope for %@ again", buf, 0xCu);
          }
          id v3 = *(unsigned char **)(a1 + 40);
        }
        v3[144] = 1;
        [*(id *)(a1 + 40) _fetchTransportScope];
      }
    }
    else if ([*(id *)(a1 + 32) isCPLErrorWithCode:23])
    {
      [*(id *)(a1 + 40) _markScopeAsDeletedAndSucceedTaskWithFlags:0];
    }
    else
    {
      int v10 = [*(id *)(a1 + 32) isCPLErrorWithCode:1002];
      id v11 = *(void **)(a1 + 40);
      if (v10) {
        [v11 _markScopeAsFeatureDisabledWithFlags:0];
      }
      else {
        [v11 taskDidFinishWithError:*(void *)(a1 + 32)];
      }
    }
  }
  else
  {
    dispatch_block_t v5 = *(void **)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_67;
    v16[3] = &unk_1E60AA238;
    v16[4] = v5;
    uint64_t v21 = v8;
    id v17 = v4;
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 72);
    [v5 _performAdditionalChecksWithNewScopeType:v8 updatedScopeChange:v17 updatedFlags:v6 oldTransportScope:v7 updatedTransportScope:v9 completionHandler:v16];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void **)(v14 + 120);
  *(void *)(v14 + 120) = 0;
}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        dispatch_block_t v5 = [*(id *)(a1 + 32) scope];
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Additional checks for %@ failed: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    [*(id *)(a1 + 32) taskDidFinishWithError:v3];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [v7 session];
    [v7 _updateScopeWithNewScopeType:v6 updatedScopeChange:v8 updatedFlags:v9 oldTransportScope:v10 session:v11 updatedTransportScope:*(void *)(a1 + 64)];
  }
}

- (void)_performAdditionalChecksWithNewScopeType:(int64_t)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 oldTransportScope:(id)a6 updatedTransportScope:(id)a7 completionHandler:(id)a8
{
  id v19 = a4;
  id v11 = (void (**)(id, void))a8;
  int v12 = [(CPLEngineScopedTask *)self scope];
  uint64_t v13 = [v12 scopeType];

  if (v13 == a3)
  {
    v11[2](v11, 0);
    goto LABEL_13;
  }
  __int16 v14 = [(CPLEngineScopedTask *)self scope];
  id v15 = [v14 scopeIdentifier];

  if (a3 == 6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_11:
      v11[2](v11, 0);
      goto LABEL_12;
    }
    uint64_t v16 = [v19 stagedScopeChange];
    id v17 = v16;
    if (v16)
    {
      a3 = [v16 scopeType];
      uint64_t v18 = [v17 scopeIdentifier];

      id v15 = (void *)v18;
    }
    else
    {
      a3 = 6;
    }
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4) {
    goto LABEL_11;
  }
  [(CPLScopeUpdateScopeTask *)self _updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier:v15 completionHandler:v11];
LABEL_12:

LABEL_13:
}

- (void)_updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  void v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  SEL v18 = a2;
  uint64_t v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v14 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v14);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) store];
    id v4 = [v3 scopes];
    dispatch_block_t v5 = [v3 engineLibrary];
    uint64_t v6 = [v5 transport];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2;
    v15[3] = &unk_1E60AA210;
    id v7 = *(void **)(a1 + 40);
    void v15[4] = *(void *)(a1 + 32);
    id v16 = v4;
    id v17 = v7;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v20 = v8;
    uint64_t v21 = v9;
    id v18 = v6;
    id v19 = v3;
    id v10 = v3;
    id v11 = v6;
    id v12 = v4;
    id v13 = (id)[v10 performReadTransactionWithBlock:v15];
  }
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] checkScopeIsValidInTransaction:v3])
  {
    uint64_t v4 = [a1[5] primaryScope];
    if (!v4)
    {
LABEL_18:
      (*((void (**)(void))a1[9] + 2))();
      goto LABEL_19;
    }
    dispatch_block_t v5 = (void *)v4;
    uint64_t v6 = [a1[5] sharingScopeForScope:v4];
    uint64_t v7 = [v6 scopeIdentifier];
    id v8 = (void *)v7;
    unint64_t v9 = (unint64_t)a1[6];
    if (v7) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      uint64_t v11 = v7 | v9;

      if (v11) {
        goto LABEL_15;
      }
    }
    else
    {
      char v15 = objc_msgSend((id)v7, "isEqual:");

      if ((v15 & 1) == 0)
      {
LABEL_15:
        uint64_t v16 = [a1[5] transportScopeForScope:v5];
        if (v16)
        {
          id v17 = (void *)v16;

          id v18 = [a1[5] scopeChangeForScope:v5];
          id v19 = a1[4];
          id v20 = (void *)v19[13];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_60;
          v27[3] = &unk_1E60AA1E8;
          v27[4] = v19;
          id v35 = a1[9];
          id v28 = a1[7];
          id v29 = v17;
          id v30 = v5;
          id v31 = v18;
          id v32 = a1[6];
          id v33 = a1[8];
          id v34 = a1[5];
          uint64_t v21 = v27;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __cpl_dispatch_async_block_invoke_16404;
          block[3] = &unk_1E60A6978;
          id v37 = v21;
          id v22 = v20;
          id v23 = v18;
          id v24 = v5;
          id v25 = v17;
          dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          dispatch_async(v22, v26);

          goto LABEL_19;
        }
      }
    }

    goto LABEL_18;
  }
  id v12 = [v3 error];

  id v13 = (void (**)(id, void *))a1[9];
  if (v12) {
    [v3 error];
  }
  else {
  id v14 = +[CPLErrors operationCancelledError];
  }
  v13[2](v13, v14);

LABEL_19:
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_60(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 96);
    id v13 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_61;
    v14[3] = &unk_1E60AA1C0;
    void v14[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 96);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 80);
    id v18 = *(id *)(a1 + 88);
    uint64_t v7 = [v3 getScopeInfoWithTransportScope:v4 scope:v5 previousScopeChange:v6 completionHandler:v14];
    uint64_t v8 = *(void *)(a1 + 32);
    unint64_t v9 = *(void **)(v8 + 120);
    *(void *)(v8 + 120) = v7;

    if (!_CPLSilentLogging)
    {
      BOOL v10 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Fetching rewind sync anchors from %@", buf, 0xCu);
      }
    }
    id v12 = [*(id *)(a1 + 40) createGroupForLibraryStateCheck];
    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 120) withTransportGroup:v12];
  }
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_61(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  BOOL v10 = *(void **)(*(void *)(a1 + 32) + 104);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_3;
  v17[3] = &unk_1E60AA198;
  id v18 = v9;
  id v25 = *(id *)(a1 + 72);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v8;
  id v21 = v11;
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v24 = *(id *)(a1 + 64);
  id v12 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v27 = v12;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
LABEL_3:
    v2();
    goto LABEL_24;
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
    uint64_t v3 = *(void *)(a1 + 88);
    uint64_t v4 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 64);
        uint64_t v16 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = v15;
        __int16 v30 = 2114;
        uint64_t v31 = v14;
        __int16 v32 = 2112;
        uint64_t v33 = v16;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "While checking for rewind sync anchors for %@ (related to %{public}@), got an unexpected scope change: %@", buf, 0x20u);
      }
    }
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
    goto LABEL_3;
  }
  uint64_t v5 = [*(id *)(a1 + 48) rewindAnchorsPerSharingScopes];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 64)];
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 56);
        uint64_t v8 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v8;
        __int16 v30 = 2112;
        uint64_t v31 = v9;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Identified a new shared library (%{public}@) and %@ might need to rewind", buf, 0x16u);
      }
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_63;
    v24[3] = &unk_1E60AA170;
    void v24[4] = *(void *)(a1 + 40);
    BOOL v10 = *(void **)(a1 + 72);
    id v25 = *(id *)(a1 + 80);
    id v26 = *(id *)(a1 + 56);
    id v27 = v6;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_65;
    v22[3] = &unk_1E60AB2A0;
    id v11 = *(id *)(a1 + 88);
    v22[4] = *(void *)(a1 + 40);
    id v23 = v11;
    id v12 = (id)[v10 performWriteTransactionWithBlock:v24 completionHandler:v22];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 56);
        uint64_t v18 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v18;
        __int16 v30 = 2112;
        uint64_t v31 = v19;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Identified a new shared library (%{public}@) but there is no need to rewind %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }

LABEL_24:
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = *(void **)(v20 + 120);
  *(void *)(v20 + 120) = 0;
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_63(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([a1[4] checkScopeIsValidInTransaction:v3])
  {
    id v4 = a1[5];
    uint64_t v5 = [a1[6] scopeIdentifier];
    uint64_t v6 = [v4 scopeWithIdentifier:v5];

    uint64_t v7 = [v6 localIndex];
    if (v7 == [a1[6] localIndex])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_64;
      v11[3] = &unk_1E60AAF20;
      id v12 = a1[5];
      id v13 = a1[7];
      id v14 = v6;
      [v3 do:v11];

      uint64_t v8 = v12;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v9 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = a1[6];
          *(_DWORD *)buf = 138412290;
          id v16 = v10;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%@ has been invalidated before being able to set rewind sync anchors", buf, 0xCu);
        }
      }
      uint64_t v8 = +[CPLErrors operationCancelledError];
      [v3 setError:v8];
    }
  }
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 error];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [v8 error];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_5:

    goto LABEL_7;
  }
  int v6 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v5 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
LABEL_7:
}

uint64_t __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_64(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRewindSyncAnchor:*(void *)(a1 + 40) forScope:*(void *)(a1 + 48) error:a2];
}

- (void)_updateScopeWithNewScopeType:(int64_t)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 oldTransportScope:(id)a6 session:(id)a7 updatedTransportScope:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  uint64_t v17 = [(CPLEngineScopedTask *)self store];
  uint64_t v18 = [(CPLEngineSyncTask *)self engineLibrary];
  uint64_t v19 = [v18 transport];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke;
  v28[3] = &unk_1E60AA148;
  v28[4] = self;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v33 = v19;
  id v34 = v17;
  int64_t v35 = a3;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_56;
  v27[3] = &unk_1E60AB578;
  v27[4] = self;
  id v20 = v17;
  id v21 = v19;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v13;
  id v26 = (id)[v20 performWriteTransactionWithBlock:v28 completionHandler:v27];
}

void __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v15 = *(void *)(a1 + 88);
    id v16 = (void *)v4;
    uint64_t v5 = [*(id *)(a1 + 32) scope];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_2;
    v17[3] = &unk_1E60AA120;
    void v17[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    id v12 = [*(id *)(a1 + 32) session];
    [v16 _updateScopeWithNewScopeType:v15 scope:v5 updatedScopeChange:v6 updatedFlags:v7 oldTransportScope:v8 updatedTransportScope:v9 shouldUpdateTransportScope:v17 store:v10 transport:v11 session:v12 inTransaction:v3];
  }
  else
  {
    id v13 = [v3 error];

    if (!v13)
    {
      id v14 = +[CPLErrors operationCancelledError];
      [v3 setError:v14];
    }
  }
}

void __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 error];
  [v2 taskDidFinishWithError:v3];
}

BOOL __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 136);
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 40) concreteScopeFromTransportScope:*(void *)(*(void *)(a1 + 32) + 136)];
        uint64_t v8 = [*(id *)(a1 + 40) concreteScopeFromTransportScope:*(void *)(a1 + 48)];
        int v10 = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Updated fetched transport scope from %@ to %@", (uint8_t *)&v10, 0x16u);
      }
      uint64_t v4 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v4 + 136), *(id *)(a1 + 48));
  }

  return v5 == 0;
}

- (void)_markScopeHasBadTransportScopeWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLTaskOSLogDomain_16338();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CPLEngineScopedTask *)self scope];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Transport scope for %@ is invalid", buf, 0xCu);
    }
  }
  uint64_t v7 = [(CPLEngineScopedTask *)self store];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke;
  v12[3] = &unk_1E60AB578;
  v12[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_3;
  v10[3] = &unk_1E60AB550;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  id v9 = (id)[v7 performWriteTransactionWithBlock:v12 completionHandler:v10];
}

void __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_2;
    v6[3] = &unk_1E60AB410;
    v6[4] = *(void *)(a1 + 32);
    [v3 do:v6];
  }
  else
  {
    id v4 = [v3 error];

    if (!v4)
    {
      uint64_t v5 = +[CPLErrors operationCancelledError];
      [v3 setError:v5];
    }
  }
}

void __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 error];
  id v5 = (id)v4;
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  [v3 taskDidFinishWithError:v4];
}

uint64_t __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) store];
  id v5 = [v4 scopes];

  uint64_t v6 = [*(id *)(a1 + 32) scope];
  uint64_t v7 = [v5 setTransportScope:0 forScope:v6 error:a2];

  return v7;
}

- (void)_markScopeAsFeatureDisabledWithFlags:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLTaskOSLogDomain_16338();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CPLEngineScopedTask *)self scope];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Feature is disabled for %@", buf, 0xCu);
    }
  }
  uint64_t v7 = [(CPLEngineScopedTask *)self store];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke;
  v11[3] = &unk_1E60AB550;
  void v11[4] = self;
  id v12 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_3;
  v10[3] = &unk_1E60AB578;
  v10[4] = self;
  id v8 = v4;
  id v9 = (id)[v7 performWriteTransactionWithBlock:v11 completionHandler:v10];
}

void __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_2;
    v7[3] = &unk_1E60AB750;
    id v4 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    [v3 do:v7];
  }
  else
  {
    id v5 = [v3 error];

    if (!v5)
    {
      uint64_t v6 = +[CPLErrors operationCancelledError];
      [v3 setError:v6];
    }
  }
}

void __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 error];
  [v2 taskDidFinishWithError:v3];
}

uint64_t __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) store];
  id v5 = [v4 scopes];

  uint64_t v6 = [*(id *)(a1 + 32) transportScope];
  if (v6)
  {
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = v16[17];
    if (v17)
    {
      id v18 = [v16 scope];
      int v19 = [v5 setTransportScope:v17 forScope:v18 error:a2];

      if (!v19) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    id v9 = [v7 scope];
    int v10 = [v5 updateFlags:v8 forScope:v9 error:a2];

    if (v10)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
LABEL_6:
  id v11 = [v7 scope];
  id v12 = [v5 scopeChangeForScope:v11];

  id v13 = [v12 libraryInfo];

  if (v13)
  {
    [v12 setLibraryState:0];
    uint64_t v14 = [*(id *)(a1 + 32) scope];
    uint64_t v15 = [v5 storeScopeChange:v12 forScope:v14 error:a2];
  }
  else
  {
    uint64_t v15 = 1;
  }

LABEL_13:
  return v15;
}

- (void)_markScopeAsDeletedAndSucceedTaskWithFlags:(id)a3
{
  id v5 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__16427;
  v16[4] = __Block_byref_object_dispose__16428;
  id v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__16427;
  void v14[4] = __Block_byref_object_dispose__16428;
  id v15 = 0;
  uint64_t v6 = [(CPLEngineScopedTask *)self store];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke;
  v10[3] = &unk_1E60AA0D0;
  v10[4] = self;
  id v7 = v5;
  id v12 = v14;
  SEL v13 = a2;
  id v11 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_41;
  v9[3] = &unk_1E60AB7F0;
  v9[4] = self;
  void v9[5] = v16;
  v9[6] = v14;
  id v8 = (id)[v6 performWriteTransactionWithBlock:v10 completionHandler:v9];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_2;
    v7[3] = &unk_1E60AA0A8;
    id v4 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    long long v9 = *(_OWORD *)(a1 + 48);
    [v3 do:v7];
  }
  else
  {
    id v5 = [v3 error];

    if (!v5)
    {
      uint64_t v6 = +[CPLErrors operationCancelledError];
      [v3 setError:v6];
    }
  }
}

void __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_41(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 error];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 error];
    [v4 taskDidFinishWithError:v5];
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) {
         && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  }
  {
    objc_msgSend(*(id *)(a1 + 32), "_lookForStagingScopeWithIdentifier:transportScope:");
  }
  else
  {
    [*(id *)(a1 + 32) taskDidFinishWithError:0];
  }
}

uint64_t __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) store];
  id v5 = [v4 scopes];

  id v6 = [*(id *)(a1 + 32) transportScope];
  if (v6)
  {
  }
  else
  {
    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = v20[17];
    if (v21)
    {
      id v22 = [v20 scope];
      uint64_t v10 = [v5 setTransportScope:v21 forScope:v22 error:a2];

      if (!v10) {
        goto LABEL_26;
      }
    }
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    long long v9 = [v7 scope];
    uint64_t v10 = [v5 updateFlags:v8 forScope:v9 error:a2];

    if (!v10) {
      goto LABEL_26;
    }
    id v7 = *(void **)(a1 + 32);
  }
  id v11 = [v7 scope];
  BOOL v12 = +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [v11 scopeType]);
  if (v12) {
    uint64_t v13 = 68;
  }
  else {
    uint64_t v13 = 4;
  }

  uint64_t v14 = [*(id *)(a1 + 32) scope];
  uint64_t v10 = [v5 setValue:1 forFlag:v13 forScope:v14 error:a2];

  if (v12)
  {
    id v15 = [*(id *)(a1 + 32) scope];
    id v16 = [v5 stagingScopeForScope:v15];

    if (v16)
    {
LABEL_25:

      goto LABEL_26;
    }
    id v17 = *(void **)(a1 + 32);
    id v18 = (void *)v17[17];
    if (v18)
    {
      id v19 = v18;
    }
    else
    {
      id v19 = [v17 transportScope];
    }
    id v23 = v19;
    id v24 = [*(id *)(a1 + 32) engineLibrary];
    id v25 = [v24 transport];
    id v46 = 0;
    id v47 = 0;
    id v26 = [*(id *)(a1 + 32) scope];
    id v27 = [*(id *)(a1 + 32) transportUserIdentifier];
    v44 = v23;
    int v45 = [v25 getProposedStagingScopeIdentifier:&v47 stagingTransportScope:&v46 forScope:v26 transportScope:v23 transportUserIdentifier:v27];
    id v28 = v47;
    id obj = v46;
    id v29 = v46;

    id v16 = 0;
    if (v45)
    {
      if (v28)
      {
        if (v29)
        {
          id v30 = [v5 scopeWithIdentifier:v28];

          if (v30)
          {
            id v16 = 0;
          }
          else
          {
            id v16 = [v5 createScopeWithIdentifier:v28 scopeType:0 flags:16 transportScope:v29 error:a2];
            if (v16) {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
            }
          }
          goto LABEL_24;
        }
        if (!_CPLSilentLogging)
        {
          v39 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = [*(id *)(a1 + 32) scope];
            *(_DWORD *)buf = 138412290;
            v49 = v40;
            _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_ERROR, "We should have a proposed staging scope transport scope for %@ here", buf, 0xCu);
          }
        }
        id v34 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v41 = *(void *)(a1 + 56);
        uint64_t v42 = *(void *)(a1 + 32);
        id v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m"];
        v38 = [*(id *)(a1 + 32) scope];
        [v34 handleFailureInMethod:v41, v42, v37, 214, @"We should have a proposed staging scope transport scope for %@ here", v38, obj object file lineNumber description];
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v32 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            id v33 = [*(id *)(a1 + 32) scope];
            *(_DWORD *)buf = 138412290;
            v49 = v33;
            _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "We should have a proposed staging scope identifier for %@ here", buf, 0xCu);
          }
        }
        id v34 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v35 = *(void *)(a1 + 56);
        uint64_t v36 = *(void *)(a1 + 32);
        id v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m"];
        v38 = [*(id *)(a1 + 32) scope];
        [v34 handleFailureInMethod:v35, v36, v37, 213, @"We should have a proposed staging scope identifier for %@ here", v38, obj object file lineNumber description];
      }

      abort();
    }
LABEL_24:

    goto LABEL_25;
  }
LABEL_26:

  return v10;
}

- (void)_lookForStagingScopeWithIdentifier:(id)a3 transportScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CPLScopeUpdateScopeTask__lookForStagingScopeWithIdentifier_transportScope___block_invoke;
  v14[3] = &unk_1E60A6660;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  long long v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16404;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __77__CPLScopeUpdateScopeTask__lookForStagingScopeWithIdentifier_transportScope___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v13 = +[CPLErrors operationCancelledError];
    objc_msgSend(v2, "taskDidFinishWithError:");
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = [*(id *)(a1 + 32) scope];
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        id v15 = v4;
        __int16 v16 = 2114;
        uint64_t v17 = v5;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@ is staged with no known staging scope - will try to look for it directly as %{public}@", buf, 0x16u);
      }
    }
    id v6 = [CPLScopeUpdateScopeTask alloc];
    id v7 = [*(id *)(a1 + 32) engineLibrary];
    uint64_t v8 = [*(id *)(a1 + 32) session];
    long long v9 = [*(id *)(a1 + 32) clientCacheIdentifier];
    uint64_t v10 = [(CPLScopeUpdateScopeTask *)v6 initWithEngineLibrary:v7 session:v8 clientCacheIdentifier:v9 scope:*(void *)(a1 + 40) transportScope:*(void *)(a1 + 48)];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 152);
    *(void *)(v11 + 152) = v10;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 152) launch];
  }
}

- (CPLScopeUpdateScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  v12.receiver = self;
  v12.super_class = (Class)CPLScopeUpdateScopeTask;
  id v7 = [(CPLEngineScopedTask *)&v12 initWithEngineLibrary:a3 session:a4 clientCacheIdentifier:a5 scope:a6 transportScope:a7];
  if (v7)
  {
    uint64_t v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("engine.sync.updatescope", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

+ (void)updateScopeWithNewScopeType:(int64_t)a3 scope:(id)a4 updatedScopeChange:(id)a5 updatedFlags:(id)a6 oldTransportScope:(id)a7 updatedTransportScope:(id)a8 shouldUpdateTransportScope:(id)a9 store:(id)a10 transport:(id)a11 session:(id)a12 inTransaction:(id)a13
{
  id v37 = a4;
  id v35 = a5;
  id v34 = a6;
  id v17 = a7;
  id v36 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = [v19 scopes];
  id v24 = [v37 scopeIdentifier];
  id v25 = [v23 scopeWithIdentifier:v24];

  if (v25 && (uint64_t v26 = [v25 cloudIndex], v26 == objc_msgSend(v37, "cloudIndex")))
  {
    id v28 = v34;
    id v27 = v35;
    [a1 _updateScopeWithNewScopeType:a3 scope:v37 updatedScopeChange:v35 updatedFlags:v34 oldTransportScope:v17 updatedTransportScope:v36 shouldUpdateTransportScope:v18 store:v19 transport:v20 session:v21 inTransaction:v22];
  }
  else
  {
    [v37 scopeIdentifier];
    v30 = id v29 = v17;
    id v31 = +[CPLErrors cplErrorWithCode:32, @"%@ has become stale before updating scope info", v30 description];
    [v22 setError:v31];

    id v17 = v29;
    id v28 = v34;
    id v27 = v35;
  }
}

+ (void)_updateScopeWithNewScopeType:(int64_t)a3 scope:(id)a4 updatedScopeChange:(id)a5 updatedFlags:(id)a6 oldTransportScope:(id)a7 updatedTransportScope:(id)a8 shouldUpdateTransportScope:(id)a9 store:(id)a10 transport:(id)a11 session:(id)a12 inTransaction:(id)a13
{
  id v35 = a4;
  id v34 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v37 = a13;
  id v24 = [v21 scopes];
  id v25 = v24;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __199__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_scope_updatedScopeChange_updatedFlags_oldTransportScope_updatedTransportScope_shouldUpdateTransportScope_store_transport_session_inTransaction___block_invoke_2;
  v42[3] = &unk_1E60AA0F8;
  id v43 = v35;
  id v44 = v17;
  if (!v20) {
    id v20 = &__block_literal_global_16450;
  }
  int64_t v53 = a3;
  SEL v54 = a2;
  id v55 = a1;
  id v45 = v34;
  id v46 = v24;
  id v47 = v19;
  id v48 = v18;
  id v49 = v22;
  id v50 = v21;
  id v51 = v23;
  id v52 = v20;
  id v41 = v23;
  id v39 = v21;
  id v26 = v22;
  id v27 = v20;
  id v28 = v18;
  id v29 = v19;
  id v30 = v25;
  id v31 = v34;
  id v32 = v17;
  id v33 = v35;
  [v37 do:v42];
}

uint64_t __199__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_scope_updatedScopeChange_updatedFlags_oldTransportScope_updatedTransportScope_shouldUpdateTransportScope_store_transport_session_inTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 112);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  if (!v7)
  {
    if (v4)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v5;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "%@ is a scope we don't support anymore", buf, 0xCu);
        }
      }
    }
    else if ([v5 scopeType])
    {
      if (!_CPLSilentLogging)
      {
        objc_super v12 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v5;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@ was degraded and can't be identified anymore", buf, 0xCu);
        }
      }
      uint64_t v4 = [v5 scopeType];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v22 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v5;
          _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "%@ is a scope we still don't support", buf, 0xCu);
        }
      }
      uint64_t v4 = 0;
    }
LABEL_36:
    if (v4 == [v5 scopeType])
    {
      int v23 = 1;
      id v24 = v5;
    }
    else
    {
      id v25 = [*(id *)(a1 + 56) flagsForScope:v5];
      id v26 = *(void **)(a1 + 56);
      id v27 = [v5 scopeIdentifier];
      id v28 = [v26 scopeWithIdentifier:v27];

      if (!v28)
      {
        if (!_CPLSilentLogging)
        {
          v93 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            v94 = +[CPLScopeChange descriptionForScopeType:v4];
            *(_DWORD *)buf = 138412546;
            id v106 = v5;
            __int16 v107 = 2112;
            id v108 = v94;
            _os_log_impl(&dword_1B4CAC000, v93, OS_LOG_TYPE_ERROR, "Failed to find %@ after upgrading its scope type to %@", buf, 0x16u);
          }
        }
        v88 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v96 = *(void *)(a1 + 120);
        uint64_t v95 = *(void *)(a1 + 128);
        v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m"];
        v98 = +[CPLScopeChange descriptionForScopeType:v4];
        [v88 handleFailureInMethod:v96, v95, v97, 367, @"Failed to find %@ after upgrading its scope type to %@", v5, v98 object file lineNumber description];

LABEL_143:
        goto LABEL_144;
      }
      id v24 = v28;

      id v29 = *(void **)(a1 + 56);
      id v30 = [v24 scopeIdentifier];
      if ([v29 shouldAutoactivateScopeWithIdentifier:v30 scopeType:v4])
      {
        int v31 = [v25 valueForFlag:0x10000];

        if (v31
          && [v25 valueForFlag:16]
          && ([v25 valueForFlag:32] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            id v32 = __CPLTaskOSLogDomain_16338();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = [v24 scopeIdentifier];
              id v34 = +[CPLScopeChange descriptionForScopeType:v4];
              *(_DWORD *)buf = 138543618;
              id v106 = v33;
              __int16 v107 = 2114;
              id v108 = v34;
              _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_DEFAULT, "Identified %{public}@ as %{public}@ - enabling sync for this scope", buf, 0x16u);
            }
          }
          [v25 setValue:0 forFlag:16];
        }
      }
      else
      {
      }
      if (v6 && [v6 hasFlagUpdates])
      {
        [v25 updateFlags:v6];

        id v6 = 0;
      }
      if (!_CPLSilentLogging)
      {
        id v35 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = [v24 scopeIdentifier];
          id v37 = +[CPLScopeChange descriptionForScopeType:v4];
          *(_DWORD *)buf = 138543874;
          id v106 = v36;
          __int16 v107 = 2114;
          id v108 = v37;
          __int16 v109 = 2114;
          v110 = v25;
          _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_DEFAULT, "After scope type for %{public}@ was upgraded to %{public}@, scope flags are %{public}@", buf, 0x20u);
        }
      }
      int v23 = [*(id *)(a1 + 56) updateFlags:v25 forScope:v24 error:a2];

      if (!v23) {
        goto LABEL_62;
      }
    }
    if (v6 && [v6 hasFlagUpdates])
    {
      v38 = [*(id *)(a1 + 56) flagsForScope:v24];
      id v39 = v38;
      if (v38 && (uint64_t v40 = [v38 flags], v40 != objc_msgSend(v6, "flags")))
      {
        [v39 updateFlags:v6];
        if (!_CPLSilentLogging)
        {
          id v55 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = [v24 scopeIdentifier];
            *(_DWORD *)buf = 138543618;
            id v106 = v56;
            __int16 v107 = 2114;
            id v108 = v39;
            _os_log_impl(&dword_1B4CAC000, v55, OS_LOG_TYPE_DEFAULT, "Updating flags for %{public}@: %{public}@", buf, 0x16u);
          }
        }
        char v57 = [*(id *)(a1 + 56) updateFlags:v6 forScope:v24 error:a2];

        if ((v57 & 1) == 0) {
          goto LABEL_85;
        }
      }
      else
      {
      }
LABEL_63:
      if (*(void *)(a1 + 64)
        && (objc_msgSend(*(id *)(a1 + 72), "isEqual:") & 1) == 0
        && (*(unsigned int (**)(void))(*(void *)(a1 + 104) + 16))())
      {
        if (!_CPLSilentLogging)
        {
          id v41 = __CPLTaskOSLogDomain_16338();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = [*(id *)(a1 + 80) concreteScopeFromTransportScope:*(void *)(a1 + 72)];
            id v43 = [*(id *)(a1 + 80) concreteScopeFromTransportScope:*(void *)(a1 + 64)];
            *(_DWORD *)buf = 138412546;
            id v106 = v42;
            __int16 v107 = 2112;
            id v108 = v43;
            _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_DEFAULT, "Updated transport scope from %@ to %@", buf, 0x16u);
          }
        }
        int v44 = [*(id *)(a1 + 56) setTransportScope:*(void *)(a1 + 64) forScope:v24 error:a2];
        if (!v44)
        {
LABEL_84:
          if (!v44) {
            goto LABEL_85;
          }
LABEL_120:
          v77 = *(void **)(a1 + 96);
          if (v77)
          {
            v78 = [v77 scopeFilter];
            if (v78)
            {
              v79 = [*(id *)(a1 + 56) updatedScopeFilter:v78];
              if (v79 != v78)
              {
                if (!_CPLSilentLogging)
                {
                  v80 = __CPLTaskOSLogDomain_16338();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                  {
                    v81 = *(void **)(a1 + 96);
                    v82 = [v78 simpleDescription];
                    v83 = [v79 simpleDescription];
                    *(_DWORD *)buf = 138412802;
                    id v106 = v81;
                    __int16 v107 = 2114;
                    id v108 = v82;
                    __int16 v109 = 2114;
                    v110 = v83;
                    _os_log_impl(&dword_1B4CAC000, v80, OS_LOG_TYPE_DEFAULT, "Updating scope filter for %@ from %{public}@ to %{public}@", buf, 0x20u);
                  }
                }
                [*(id *)(a1 + 96) updateScopeFilter:v79];
              }
            }
          }
          uint64_t v21 = 1;
          goto LABEL_131;
        }
      }
      else
      {
        int v44 = 1;
      }
      if (!v24) {
        goto LABEL_84;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_84;
      }
      id v45 = *(id *)(a1 + 48);
      id v46 = [v45 stagedScopeChange];
      id v47 = v46;
      if (!v46
        || (id v48 = *(void **)(a1 + 88),
            [v46 scopeIdentifier],
            id v49 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v48) = [v48 mainScopeSupportsSharingScopeWithIdentifier:v49],
            v49,
            !v48))
      {

        goto LABEL_120;
      }
      if (+[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [v47 scopeType]))
      {
        id v50 = [v47 scopeIdentifier];
        uint64_t v51 = [*(id *)(a1 + 56) scopeWithIdentifier:v50];
        if (v51)
        {
          id v52 = (void *)v51;
          if (!_CPLSilentLogging)
          {
            int64_t v53 = __CPLTaskOSLogDomain_16338();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v106 = v52;
              __int16 v107 = 2112;
              id v108 = v24;
              __int16 v109 = 2112;
              v110 = v47;
              _os_log_impl(&dword_1B4CAC000, v53, OS_LOG_TYPE_DEFAULT, "Updating staged %@ from info provided by %@: %@", buf, 0x20u);
            }
          }
          int v54 = [*(id *)(a1 + 56) storeScopeChange:v47 forScope:v52 error:a2];
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            v58 = __CPLTaskOSLogDomain_16338();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v106 = v24;
              __int16 v107 = 2114;
              id v108 = v50;
              __int16 v109 = 2112;
              v110 = v47;
              _os_log_impl(&dword_1B4CAC000, v58, OS_LOG_TYPE_DEFAULT, "%@ is a staging scope for unknown %{public}@. Assuming it has been deleted before we know. Using staged scope change: %@", buf, 0x20u);
            }
          }
          [*(id *)(a1 + 56) beginCreatingScopeWithIdentifier:v50];
          v59 = *(void **)(a1 + 56);
          [v47 scopeType];
          [v45 stagedScopeFlags];
          uint64_t v60 = [v45 stagedTransportScope];
          v61 = v50;
          v62 = (void *)v60;
          v104 = v61;
          id v52 = objc_msgSend(v59, "createScopeWithIdentifier:scopeType:flags:transportScope:error:");

          if (!v52) {
            goto LABEL_117;
          }
          v63 = [*(id *)(a1 + 56) flagsForScope:v52];
          if (!_CPLSilentLogging)
          {
            v64 = __CPLTaskOSLogDomain_16338();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v106 = v52;
              _os_log_impl(&dword_1B4CAC000, v64, OS_LOG_TYPE_DEFAULT, "Marking %@ as deleted immediately", buf, 0xCu);
            }
          }
          id v65 = v52;
          BOOL v66 = +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [v65 scopeType]);

          uint64_t v67 = v66 ? 68 : 4;
          [v63 setValue:1 forFlag:v67];
          v68 = *(void **)(a1 + 56);
          [v65 scopeIdentifier];
          v102 = v63;
          v69 = v103 = v65;
          if (objc_msgSend(v68, "shouldAutoactivateScopeWithIdentifier:scopeType:", v69, objc_msgSend(v65, "scopeType")))
          {
            int v70 = [v102 valueForFlag:0x10000];

            v71 = v102;
            if (v70
              && [v102 valueForFlag:16]
              && ([v102 valueForFlag:32] & 1) == 0)
            {
              if (!_CPLSilentLogging)
              {
                v72 = __CPLTaskOSLogDomain_16338();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  [v65 scopeIdentifier];
                  v74 = v73 = v72;
                  v75 = +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", [v103 scopeType]);
                  *(_DWORD *)buf = 138543618;
                  id v106 = v74;
                  __int16 v107 = 2114;
                  id v108 = v75;
                  _os_log_impl(&dword_1B4CAC000, v73, OS_LOG_TYPE_DEFAULT, "Identified %{public}@ as %{public}@ (inferred from staging scope) - enabling sync for this scope", buf, 0x16u);

                  v72 = v73;
                  v71 = v102;
                  id v65 = v103;
                }
              }
              [v71 setValue:0 forFlag:16];
            }
          }
          else
          {

            v71 = v102;
          }
          int v76 = [*(id *)(a1 + 56) updateFlags:v71 forScope:v65 error:a2];

          if (v76) {
            int v54 = [*(id *)(a1 + 56) storeScopeChange:v47 forScope:v65 error:a2];
          }
          else {
LABEL_117:
          }
            int v54 = 0;
          id v50 = v104;
          [*(id *)(a1 + 56) endCreatingScopeWithIdentifier:v104];
        }

        if (!v54) {
          goto LABEL_85;
        }
        goto LABEL_120;
      }
      if (!_CPLSilentLogging)
      {
        v99 = __CPLTaskOSLogDomain_16338();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v47;
          _os_log_impl(&dword_1B4CAC000, v99, OS_LOG_TYPE_ERROR, "Staging is unsupported for %@", buf, 0xCu);
        }
      }
      v88 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v101 = *(void *)(a1 + 120);
      uint64_t v100 = *(void *)(a1 + 128);
      v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m"];
      [v88 handleFailureInMethod:v101, v100, v97, 403, @"Staging is unsupported for %@", v47 object file lineNumber description];
      goto LABEL_143;
    }
LABEL_62:
    if (!v23)
    {
LABEL_85:
      uint64_t v21 = 0;
LABEL_131:
      id v5 = v24;
      goto LABEL_132;
    }
    goto LABEL_63;
  }
  if (v4 != [v7 scopeType])
  {
    if (!_CPLSilentLogging)
    {
      v85 = __CPLTaskOSLogDomain_16338();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v86 = +[CPLScopeChange descriptionForScopeType:v4];
        v87 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        id v106 = v86;
        __int16 v107 = 2112;
        id v108 = v87;
        _os_log_impl(&dword_1B4CAC000, v85, OS_LOG_TYPE_ERROR, "Invalid scope type %@ for scope change %@", buf, 0x16u);
      }
    }
    v88 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v89 = *(void *)(a1 + 120);
    uint64_t v90 = *(void *)(a1 + 128);
    v91 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m"];
    v92 = +[CPLScopeChange descriptionForScopeType:v4];
    [v88 handleFailureInMethod:v89, v90, v91, 323, @"Invalid scope type %@ for scope change %@", v92, *(void *)(a1 + 48) object file lineNumber description];

LABEL_144:
    abort();
  }
  if ([*(id *)(a1 + 56) storeScopeChange:*(void *)(a1 + 48) forScope:v5 error:a2])
  {
    uint64_t v8 = [*(id *)(a1 + 48) libraryState];
    dispatch_queue_t v9 = v8;
    if (v8) {
      int v10 = [v8 isDisabled];
    }
    else {
      int v10 = 0;
    }
    id v13 = [*(id *)(a1 + 56) flagsForScope:v5];
    uint64_t v14 = v13;
    if (v10)
    {
      char v15 = [*(id *)(a1 + 56) setValue:1 forFlag:8 forScope:v5 error:a2];
      __int16 v16 = [v9 disabledDate];
      id v17 = v16;
      if (v15)
      {
        char v18 = [*(id *)(a1 + 56) setDisabledDate:v16 forScope:v5 error:a2];

        if ((v18 & 1) == 0) {
          goto LABEL_29;
        }
LABEL_26:
        id v19 = *(void **)(a1 + 56);
        id v20 = [v9 deleteDate];
        LODWORD(v19) = [v19 setDeleteDate:v20 forScope:v5 error:a2];

        if (v19) {
          goto LABEL_36;
        }
        goto LABEL_30;
      }
    }
    else
    {
      if (![v13 valueForFlag:8]
        || ([v14 valueForFlag:0x40000] & 1) != 0)
      {
        goto LABEL_26;
      }
      [v14 setValue:0 forFlag:8];
      if ([*(id *)(a1 + 56) updateFlags:v14 forScope:v5 error:a2])
      {
        [*(id *)(a1 + 56) setDisabledDate:0 forScope:v5 error:a2];
        goto LABEL_26;
      }
    }
LABEL_29:
  }
LABEL_30:
  uint64_t v21 = 0;
LABEL_132:

  return v21;
}

uint64_t __199__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_scope_updatedScopeChange_updatedFlags_oldTransportScope_updatedTransportScope_shouldUpdateTransportScope_store_transport_session_inTransaction___block_invoke()
{
  return 1;
}

@end
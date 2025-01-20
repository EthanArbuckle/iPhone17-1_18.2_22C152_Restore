@interface CPLTransportUpdateScopeTask
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (id)taskIdentifier;
- (void)cancel;
- (void)launch;
@end

@implementation CPLTransportUpdateScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTask, 0);
  objc_storeStrong((id *)&self->_deleteTask, 0);
}

- (id)taskIdentifier
{
  return @"engine.sync.transportupdate";
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)CPLTransportUpdateScopeTask;
  [(CPLEngineSyncTask *)&v6 cancel];
  v3 = [(CPLEngineScopedTask *)self store];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CPLTransportUpdateScopeTask_cancel__block_invoke;
  v5[3] = &unk_1E60AB578;
  v5[4] = self;
  id v4 = (id)[v3 performReadTransactionWithBlock:v5];
}

uint64_t __37__CPLTransportUpdateScopeTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) cancel];
  v2 = *(void **)(*(void *)(a1 + 32) + 112);
  return [v2 cancel];
}

- (void)launch
{
  v14.receiver = self;
  v14.super_class = (Class)CPLTransportUpdateScopeTask;
  [(CPLEngineSyncTask *)&v14 launch];
  v3 = [(CPLEngineScopedTask *)self store];
  id v4 = [v3 scopes];
  v5 = [(CPLEngineScopedTask *)self scope];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke;
  v10[3] = &unk_1E60AA170;
  v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v13 = v3;
  id v6 = v3;
  id v7 = v5;
  id v8 = v4;
  id v9 = (id)[v6 performReadTransactionWithBlock:v10];
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke(id *a1, uint64_t a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (![a1[4] checkScopeIsValidInTransaction:a2]) {
    return;
  }
  if (![a1[4] isCancelled])
  {
    uint64_t v4 = [a1[5] transportUpdateTaskForScope:a1[6]];
    v5 = [a1[5] flagsForScope:a1[6]];
    if ([v5 valueForFlag:32])
    {
      if ([a1[6] scopeType] != 1)
      {
        if (!_CPLSilentLogging)
        {
          id v6 = __CPLTaskOSLogDomain();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            id v7 = [a1[6] scopeIdentifier];
            *(_DWORD *)buf = 138412290;
            v52 = v7;
            _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Deleting transport scope for %@", buf, 0xCu);
          }
        }
        id v8 = [a1[4] engineLibrary];
        id v9 = [v8 transport];

        v10 = [a1[4] transportScope];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_9;
        v46[3] = &unk_1E60A6D90;
        v46[4] = a1[4];
        id v11 = a1[6];
        id v47 = a1[7];
        id v48 = a1[5];
        id v49 = a1[6];
        uint64_t v50 = v4;
        uint64_t v12 = [v9 deleteTransportScope:v10 scope:v11 completionHandler:v46];
        id v13 = a1[4];
        objc_super v14 = (void *)v13[13];
        v13[13] = v12;

        v15 = a1[4];
        uint64_t v16 = v15[13];
        v17 = [v9 createGroupForTransportScopeDelete];
        [v15 launchTransportTask:v16 withTransportGroup:v17];

        id v18 = v47;
LABEL_20:

LABEL_27:
        return;
      }
    }
    else if (([v5 valueForFlag:20] & 1) == 0)
    {
      v19 = [a1[4] engineLibrary];
      id v9 = [v19 transport];

      v20 = [a1[4] transportScope];
      v21 = [a1[4] scope];
      v22 = [a1[5] scopeChangeForScope:a1[6]];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_5;
      v41[3] = &unk_1E60A6D90;
      v41[4] = a1[4];
      id v42 = a1[7];
      id v43 = a1[5];
      id v44 = a1[6];
      uint64_t v45 = v4;
      uint64_t v23 = [v9 updateTransportScope:v20 scope:v21 scopeChange:v22 completionHandler:v41];
      v24 = a1[4];
      v25 = (void *)v24[14];
      v24[14] = v23;

      v26 = a1[4];
      uint64_t v27 = v26[14];
      if (v27)
      {
        if (!_CPLSilentLogging)
        {
          v28 = __CPLTaskOSLogDomain();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [a1[6] scopeIdentifier];
            *(_DWORD *)buf = 138412290;
            v52 = v29;
            _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEFAULT, "Dispatching update transport for %@", buf, 0xCu);
          }
          v26 = a1[4];
          uint64_t v27 = v26[14];
        }
        v30 = [v9 createGroupForTransportScopeUpdate];
        [v26 launchTransportTask:v27 withTransportGroup:v30];

        id v18 = v42;
        goto LABEL_20;
      }
    }
    if (!_CPLSilentLogging)
    {
      v31 = __CPLTaskOSLogDomain();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [a1[6] scopeIdentifier];
        *(_DWORD *)buf = 138412290;
        v52 = v32;
        _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_DEFAULT, "Ignoring transport update for %@", buf, 0xCu);
      }
    }
    id v33 = a1[7];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_13;
    v37[3] = &unk_1E60A6D68;
    id v38 = a1[5];
    id v39 = a1[6];
    uint64_t v40 = v4;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_3_15;
    v36[3] = &unk_1E60AB578;
    v36[4] = a1[4];
    id v34 = (id)[v33 performWriteTransactionWithBlock:v37 completionHandler:v36];

    id v9 = v38;
    goto LABEL_27;
  }
  id v3 = a1[4];
  id v35 = +[CPLErrors operationCancelledError];
  objc_msgSend(v3, "taskDidFinishWithError:");
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3;
    if (![v3 isCPLErrorWithCode:1002])
    {
      [*(id *)(a1 + 32) taskDidFinishWithError:v4];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 104);
      *(void *)(v9 + 104) = 0;

      goto LABEL_6;
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_2;
  v12[3] = &unk_1E60A6D68;
  v5 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v14 = v6;
  uint64_t v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_4;
  v11[3] = &unk_1E60AB578;
  v11[4] = *(void *)(a1 + 32);
  id v8 = (id)[v5 performWriteTransactionWithBlock:v12 completionHandler:v11];

  uint64_t v4 = v13;
LABEL_6:
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3;
    if (([v3 isCPLErrorWithCode:1002] & 1) == 0
      && ![v4 isCPLErrorWithCode:23])
    {
      [*(id *)(a1 + 32) taskDidFinishWithError:v4];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(void *)(v9 + 112) = 0;

      goto LABEL_6;
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_6;
  v12[3] = &unk_1E60A6D68;
  v5 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v14 = v6;
  uint64_t v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_8;
  v11[3] = &unk_1E60AB578;
  v11[4] = *(void *)(a1 + 32);
  id v8 = (id)[v5 performWriteTransactionWithBlock:v12 completionHandler:v11];

  uint64_t v4 = v13;
LABEL_6:
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_13(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_2_14;
  v6[3] = &unk_1E60A7108;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 do:v6];
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_3_15(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 error];
  [v2 taskDidFinishWithError:v3];
}

uint64_t __37__CPLTransportUpdateScopeTask_launch__block_invoke_2_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setScope:*(void *)(a1 + 40) hasCompletedTransportUpdate:*(void *)(a1 + 48) error:a2];
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_6(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_7;
  v6[3] = &unk_1E60A7108;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 do:v6];
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 error];
  [v3 taskDidFinishWithError:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = 0;
}

uint64_t __37__CPLTransportUpdateScopeTask_launch__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) setScope:*(void *)(a1 + 40) hasCompletedTransportUpdate:*(void *)(a1 + 48) error:a2];
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v5 setScopeNeedsUpdateFromTransport:v6 error:a2];
  }
  return result;
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CPLTransportUpdateScopeTask_launch__block_invoke_3;
  v6[3] = &unk_1E60A7108;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 do:v6];
}

void __37__CPLTransportUpdateScopeTask_launch__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 error];
  [v3 taskDidFinishWithError:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = 0;
}

uint64_t __37__CPLTransportUpdateScopeTask_launch__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) setScope:*(void *)(a1 + 40) hasCompletedTransportUpdate:*(void *)(a1 + 48) error:a2];
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (+[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [*(id *)(a1 + 40) scopeType]))
    {
      uint64_t v6 = 68;
    }
    else
    {
      uint64_t v6 = 4;
    }
    uint64_t v7 = *(void *)(a1 + 40);
    return [v5 setValue:1 forFlag:v6 forScope:v7 error:a2];
  }
  return result;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CPLEngineSyncTask *)self session];
  int v6 = [v5 shouldDefer];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLTaskOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v13 = 138412290;
        *(void *)&v13[4] = objc_opt_class();
        id v8 = *(id *)&v13[4];
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v13, 0xCu);
      }
    }
    uint64_t v9 = +[CPLErrors sessionHasBeenDeferredError];
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

@end
@interface CPLReshareScopeTask
- (CPLReshareScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (id)scopesForTask;
- (id)taskIdentifier;
- (void)_bumpIgnoredDatesOfRecords:(id)a3 hasResharedSomeRecords:(BOOL)a4;
- (void)_bumpIgnoredDatesOfRejectedRecords:(id)a3;
- (void)_doOneIteration;
- (void)cancel;
- (void)launch;
@end

@implementation CPLReshareScopeTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_reshareTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_primaryScope, 0);
  objc_storeStrong((id *)&self->_cutoffDate, 0);
}

- (id)taskIdentifier
{
  return @"engine.sync.reshare";
}

- (id)scopesForTask
{
  if (self->_primaryScope)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLReshareScopeTask;
    v3 = [(CPLEngineScopedTask *)&v7 scopesForTask];
    v4 = [v3 arrayByAddingObject:self->_primaryScope];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CPLReshareScopeTask;
    v4 = [(CPLEngineScopedTask *)&v6 scopesForTask];
  }
  return v4;
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLReshareScopeTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__CPLReshareScopeTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6630;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __29__CPLReshareScopeTask_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) cancel];
}

- (void)launch
{
  v8.receiver = self;
  v8.super_class = (Class)CPLReshareScopeTask;
  [(CPLEngineSyncTask *)&v8 launch];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__CPLReshareScopeTask_launch__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6630;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __29__CPLReshareScopeTask_launch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doOneIteration];
}

- (void)_doOneIteration
{
  if ([(CPLEngineSyncTask *)self isCancelled])
  {
    id v9 = +[CPLErrors operationCancelledError];
    [(CPLEngineSyncTask *)self taskDidFinishWithError:v9];
  }
  else
  {
    v3 = [(CPLEngineSyncTask *)self engineLibrary];
    v4 = [v3 store];

    v5 = [v4 scopes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke;
    v10[3] = &unk_1E60AB068;
    v10[4] = self;
    id v11 = v5;
    id v12 = v4;
    id v6 = v4;
    id v7 = v5;
    id v8 = (id)[v6 performReadTransactionWithBlock:v10];
  }
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke(id *a1, uint64_t a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  char v3 = [a1[4] isScopeValidInTransaction:a2];
  id v4 = a1[4];
  if (v3)
  {
    v5 = [a1[4] scope];
    if (*((void *)a1[4] + 14))
    {
LABEL_3:
      id v6 = [a1[6] ignoredRecords];
      id v7 = a1[4];
      uint64_t v8 = v7[13];
      id v9 = [v7 scope];
      id v10 = [v9 scopeIdentifier];
      id v11 = [v6 ignoredRecordsBeforeDate:v8 scopeIdentifier:v10 maximumCount:100];

      if ([v11 count])
      {
        v65 = v5;
        id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
        v13 = [a1[6] cloudCache];
        v66 = a1;
        v69 = [a1[6] remappedRecords];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v64 = v11;
        id v14 = v11;
        id v70 = (id)[v14 countByEnumeratingWithState:&v76 objects:v80 count:16];
        if (!v70) {
          goto LABEL_25;
        }
        uint64_t v15 = *(void *)v77;
        uint64_t v67 = *(void *)v77;
        id v68 = v14;
        while (1)
        {
          for (i = 0; i != v70; i = (char *)i + 1)
          {
            if (*(void *)v77 != v15) {
              objc_enumerationMutation(v14);
            }
            v17 = [*(id *)(*((void *)&v76 + 1) + 8 * i) record];
            v18 = [v17 scopedIdentifier];
            v19 = [v13 targetForRecordWithSharedCloudScopedIdentifier:v18];

            if ([v19 targetState])
            {
              if ([v19 targetState] == 1)
              {
                v20 = [v19 scopedIdentifier];
                [v12 setObject:v17 forKeyedSubscript:v20];
              }
              else
              {
                if (_CPLSilentLogging) {
                  goto LABEL_23;
                }
                v20 = __CPLTaskOSLogDomain_6632();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  v28 = [v17 scopedIdentifier];
                  v29 = [v19 scopedIdentifier];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&buf[4] = v28;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v29;
                  *(_WORD *)&buf[22] = 2112;
                  v82 = v19;
                  _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Skipping ignored record %@ as %@ target is not direct: %@", buf, 0x20u);
                }
              }
            }
            else
            {
              v21 = v13;
              v22 = v12;
              v23 = [v19 scopedIdentifier];
              v20 = [v69 realScopedIdentifierForRemappedScopedIdentifier:v23];

              v24 = [v20 identifier];
              v25 = [v19 scopedIdentifier];
              v26 = [v25 identifier];
              char v27 = [v24 isEqualToString:v26];

              if (v27)
              {
                id v12 = v22;
                v13 = v21;
                uint64_t v15 = v67;
                id v14 = v68;
              }
              else
              {
                id v12 = v22;
                v13 = v21;
                uint64_t v15 = v67;
                if (!_CPLSilentLogging)
                {
                  v30 = __CPLTaskOSLogDomain_6632();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    v31 = [v19 scopedIdentifier];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = v31;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v17;
                    _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_DEFAULT, "Will delete old remapped %@ to expose %@", buf, 0x16u);
                  }
                }
                v32 = objc_opt_class();
                v33 = [v17 scopedIdentifier];
                v34 = (void *)[v32 newDeleteChangeWithScopedIdentifier:v33];
                v35 = [v19 scopedIdentifier];
                [v12 setObject:v34 forKeyedSubscript:v35];

                id v14 = v68;
              }
            }

LABEL_23:
          }
          id v70 = (id)[v14 countByEnumeratingWithState:&v76 objects:v80 count:16];
          if (!v70)
          {
LABEL_25:

            uint64_t v36 = [v12 count];
            v37 = v66[4];
            if (v36)
            {
              v38 = (void *)v37[16];
              v72[0] = MEMORY[0x1E4F143A8];
              v72[1] = 3221225472;
              v72[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke_18;
              v72[3] = &unk_1E60A6750;
              v72[4] = v37;
              id v73 = v12;
              v5 = v65;
              id v74 = v65;
              id v75 = v14;
              v39 = v72;
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __cpl_dispatch_async_block_invoke_6630;
              v82 = &unk_1E60A6978;
              id v83 = v39;
              v40 = v38;
              dispatch_block_t v41 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
              dispatch_async(v40, v41);
            }
            else
            {
              [v37 _bumpIgnoredDatesOfRecords:v14 hasResharedSomeRecords:0];
              v5 = v65;
            }
            id v11 = v64;

            goto LABEL_45;
          }
        }
      }
      if (!_CPLSilentLogging)
      {
        v48 = __CPLTaskOSLogDomain_6632();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v48, OS_LOG_TYPE_DEFAULT, "All eligible ignored records have been process", buf, 2u);
        }
      }
      [a1[4] taskDidFinishWithError:0];
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v42 = [a1[5] scopeForSharingScope:v5];
    v43 = a1[4];
    v44 = (void *)v43[14];
    v43[14] = v42;

    v45 = a1[4];
    if (v45[14])
    {
      if (!objc_msgSend(a1[5], "valueForFlag:forScope:", 24))
      {
        uint64_t v49 = [a1[5] transportScopeForScope:*((void *)a1[4] + 14)];
        if (v49)
        {
          v50 = (void *)v49;
          id v51 = a1[4];
          v52 = (void *)*((void *)v51 + 15);
          v53 = [*((id *)v51 + 14) scopeIdentifier];
          [v52 addTransportScope:v50 forScopeWithIdentifier:v53];

          v54 = [a1[4] engineLibrary];
          v55 = [v54 transport];
          uint64_t v56 = [v55 createGroupForReshare];
          v57 = a1[4];
          v58 = (void *)v57[18];
          v57[18] = v56;

          goto LABEL_3;
        }
        if (!_CPLSilentLogging)
        {
          v59 = __CPLTaskOSLogDomain_6632();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            uint64_t v60 = *((void *)a1[4] + 14);
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v60;
            _os_log_impl(&dword_1B4CAC000, v59, OS_LOG_TYPE_ERROR, "%@ has no transport scope", buf, 0xCu);
          }
        }
        v61 = (id *)a1[4];
        v62 = [v61[14] scopeIdentifier];
        v63 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v62];
        [v61 taskDidFinishWithError:v63];

LABEL_46:
        return;
      }
      if (!_CPLSilentLogging)
      {
        v46 = __CPLTaskOSLogDomain_6632();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = *((void *)a1[4] + 14);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v47;
          _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_DEFAULT, "Won't reshare ignored records for %@ as %@ is not available", buf, 0x16u);
        }
      }
      v45 = a1[4];
    }
    [v45 taskDidFinishWithError:0];
    goto LABEL_46;
  }
  id v71 = +[CPLErrors operationCancelledError];
  objc_msgSend(v4, "taskDidFinishWithError:");
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke_18(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  char v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v15 = +[CPLErrors operationCancelledError];
    [v3 taskDidFinishWithError:v15];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    v5 = [v4 transport];

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(v8 + 112);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(v8 + 120);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke_2;
    v16[3] = &unk_1E60AB6B0;
    v16[4] = v8;
    id v17 = v7;
    CFAbsoluteTime v19 = Current;
    id v18 = *(id *)(a1 + 56);
    uint64_t v12 = [v5 reshareRecordsTaskWithRecords:v17 sourceScope:v9 destinationScope:v10 transportScopeMapping:v11 completionHandler:v16];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 136);
    *(void *)(v13 + 136) = v12;

    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 136) withTransportGroup:*(void *)(*(void *)(a1 + 32) + 144)];
  }
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke_3;
  v10[3] = &unk_1E60A6700;
  v10[4] = v4;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6630;
  block[3] = &unk_1E60A6978;
  id v16 = v6;
  id v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if ([v4 isCPLErrorWithCode:18])
    {
      v5 = [*(id *)(a1 + 40) userInfo];
      double v6 = [v5 objectForKeyedSubscript:@"CPLErrorRejectedRecordIdentifiersAndReasons"];

      if ([*(id *)&v6 count])
      {
        if (!_CPLSilentLogging)
        {
          id v7 = __CPLTaskOSLogDomain_6632();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = [*(id *)(a1 + 48) count];
            int v18 = 134218242;
            uint64_t v19 = v8;
            __int16 v20 = 2114;
            CFAbsoluteTime v21 = v6;
            _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Failed to reshare %lu records - some records have been rejected: %{public}@", (uint8_t *)&v18, 0x16u);
          }
        }
        dispatch_block_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = [*(id *)&v6 allKeys];
        [v9 _bumpIgnoredDatesOfRejectedRecords:v10];

        return;
      }
    }
    if (!_CPLSilentLogging)
    {
      id v15 = __CPLTaskOSLogDomain_6632();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [*(id *)(a1 + 48) count];
        double v17 = *(double *)(a1 + 40);
        int v18 = 134218242;
        uint64_t v19 = v16;
        __int16 v20 = 2112;
        CFAbsoluteTime v21 = v17;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Failed to reshare %lu records: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    [*(id *)(a1 + 32) taskDidFinishWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v11 = __CPLTaskOSLogDomain_6632();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 48) count];
        CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
        uint64_t v14 = [*(id *)(a1 + 48) allKeys];
        int v18 = 134218498;
        uint64_t v19 = v12;
        __int16 v20 = 2048;
        CFAbsoluteTime v21 = v13;
        __int16 v22 = 2114;
        v23 = v14;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Reshared %lu records successfully in %.1fs:\n%{public}@", (uint8_t *)&v18, 0x20u);
      }
    }
    [*(id *)(a1 + 32) _bumpIgnoredDatesOfRecords:*(void *)(a1 + 56) hasResharedSomeRecords:1];
  }
}

- (void)_bumpIgnoredDatesOfRejectedRecords:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineSyncTask *)self engineLibrary];
  double v6 = [v5 store];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke;
  v11[3] = &unk_1E60AB550;
  id v12 = v6;
  id v13 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_3;
  v10[3] = &unk_1E60AB578;
  v10[4] = self;
  id v7 = v4;
  id v8 = v6;
  id v9 = (id)[v8 performWriteTransactionWithBlock:v11 completionHandler:v10];
}

void __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_2;
  v4[3] = &unk_1E60AB750;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 do:v4];
}

void __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v3 error];
    [v5 taskDidFinishWithError:v6];
  }
  else
  {
    id v7 = (void *)v5[16];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_4;
    v11[3] = &unk_1E60A5DD8;
    void v11[4] = v5;
    id v8 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6630;
    block[3] = &unk_1E60A6978;
    id v13 = v8;
    id v9 = v7;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);
  }
}

uint64_t __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doOneIteration];
}

uint64_t __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) ignoredRecords];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:21600.0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      id v12 = v9;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        id v17 = v12;
        int v14 = [v4 setIgnoredDate:v5 forRecordWithScopedIdentifier:v13 error:&v17];
        id v9 = v17;

        if (!v14)
        {

          if (a2)
          {
            id v9 = v9;
            uint64_t v15 = 0;
            *a2 = v9;
          }
          else
          {
            uint64_t v15 = 0;
          }
          goto LABEL_15;
        }
        ++v11;
        id v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }

  uint64_t v15 = 1;
LABEL_15:

  return v15;
}

- (void)_bumpIgnoredDatesOfRecords:(id)a3 hasResharedSomeRecords:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPLEngineSyncTask *)self engineLibrary];
  uint64_t v8 = [v7 store];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke;
  v13[3] = &unk_1E60A76E0;
  id v14 = v8;
  id v15 = v6;
  BOOL v17 = a4;
  uint64_t v16 = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_4;
  v12[3] = &unk_1E60AB578;
  v12[4] = self;
  id v9 = v6;
  id v10 = v8;
  id v11 = (id)[v10 performWriteTransactionWithBlock:v13 completionHandler:v12];
}

void __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_2;
  v10[3] = &unk_1E60AB750;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  [v3 do:v10];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (!*(unsigned char *)(v4 + 152))
    {
      *(unsigned char *)(v4 + 152) = 1;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_3;
      v7[3] = &unk_1E60AB750;
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      id v8 = v5;
      uint64_t v9 = v6;
      [v3 do:v7];
    }
  }
}

void __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v3 error];
    [v5 taskDidFinishWithError:v6];
  }
  else
  {
    uint64_t v7 = (void *)v5[16];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_5;
    v11[3] = &unk_1E60A5DD8;
    void v11[4] = v5;
    id v8 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6630;
    block[3] = &unk_1E60A6978;
    id v13 = v8;
    uint64_t v9 = v7;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);
  }
}

uint64_t __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doOneIteration];
}

uint64_t __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) ignoredRecords];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:7200.0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v17 = a2;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      uint64_t v10 = 0;
      id v11 = v8;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * v10) record];
        id v13 = [v12 scopedIdentifier];
        id v19 = v11;
        int v14 = [v4 setIgnoredDate:v5 forRecordWithScopedIdentifier:v13 error:&v19];
        id v8 = v19;

        if (!v14)
        {

          if (v17)
          {
            id v8 = v8;
            uint64_t v15 = 0;
            void *v17 = v8;
          }
          else
          {
            uint64_t v15 = 0;
          }
          goto LABEL_15;
        }
        ++v10;
        id v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v15 = 1;
LABEL_15:

  return v15;
}

uint64_t __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) scopes];
  if ([v4 setScopeHasChangesToPullFromTransport:*(void *)(*(void *)(a1 + 40) + 112) error:a2])
  {
    id v5 = [*(id *)(a1 + 40) scope];
    uint64_t v6 = [v4 setScopeHasChangesToPullFromTransport:v5 error:a2];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (CPLReshareScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CPLReshareScopeTask;
  int v14 = [(CPLEngineScopedTask *)&v28 initWithEngineLibrary:a3 session:a4 clientCacheIdentifier:a5 scope:v12 transportScope:v13];
  if (v14)
  {
    uint64_t v15 = _CPLCutoffDate();
    cutoffDate = v14->_cutoffDate;
    v14->_cutoffDate = (NSDate *)v15;

    BOOL v17 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v18 = dispatch_queue_create("engine.sync.reshare", v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v18;

    long long v20 = [CPLTransportScopeMapping alloc];
    long long v21 = [(CPLEngineSyncTask *)v14 engineLibrary];
    long long v22 = [v21 transport];
    uint64_t v23 = [(CPLTransportScopeMapping *)v20 initWithTranslator:v22];
    transportScopeMapping = v14->_transportScopeMapping;
    v14->_transportScopeMapping = (CPLTransportScopeMapping *)v23;

    uint64_t v25 = v14->_transportScopeMapping;
    v26 = [v12 scopeIdentifier];
    [(CPLTransportScopeMapping *)v25 addTransportScope:v13 forScopeWithIdentifier:v26];
  }
  return v14;
}

@end
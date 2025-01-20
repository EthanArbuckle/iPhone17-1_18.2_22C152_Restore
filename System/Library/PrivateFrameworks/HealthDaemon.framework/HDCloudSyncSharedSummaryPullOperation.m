@interface HDCloudSyncSharedSummaryPullOperation
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSharedSummaryPullOperation

- (void)main
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self profile];
  v4 = [v3 daemon];
  v5 = [v4 behavior];
  int v6 = [v5 healthAppHiddenOrNotInstalled];

  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@ Health App is hidden or not installed", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
  else
  {
    v8 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = self->_taskGroup;
    self->_taskGroup = v8;

    [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
    v10 = [(HDCloudSyncOperation *)self configuration];
    v11 = [v10 cachedCloudState];
    id v39 = 0;
    v12 = [v11 zonesByIdentifierWithError:&v39];
    id v13 = v39;

    if (v12 || !v13)
    {
      v15 = objc_msgSend(v12, "hk_filter:", &__block_literal_global_52);
      uint64_t v16 = [v15 count];
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E4F29FA8];
      BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        id v33 = v13;
        if (v18)
        {
          v19 = v17;
          uint64_t v20 = [v15 count];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          __int16 v42 = 2048;
          uint64_t v43 = v20;
          _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Starting ingest from %lu zones", buf, 0x16u);
        }
        [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v32 = v15;
        id obj = [v15 allKeys];
        uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v36 != v23) {
                objc_enumerationMutation(obj);
              }
              v25 = self->_taskGroup;
              id v26 = *(id *)(*((void *)&v35 + 1) + 8 * i);
              [(HDSynchronousTaskGroup *)v25 beginTask];
              v27 = [[HDInsertSharedSummaryTransactionOperation alloc] initWithZoneIdentifier:v26];

              v28 = [(HDCloudSyncOperation *)self profile];
              *(void *)buf = 0;
              BOOL v29 = [(HDJournalableOperation *)v27 performOrJournalWithProfile:v28 error:buf];
              id v30 = *(id *)buf;

              v31 = self->_taskGroup;
              if (v29) {
                [(HDSynchronousTaskGroup *)v31 finishTask];
              }
              else {
                [(HDSynchronousTaskGroup *)v31 failTaskWithError:v30];
              }
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v22);
        }

        [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
        id v13 = v33;
        v15 = v32;
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = self;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No zones to pull.", buf, 0xCu);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v13;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v13];
    }
  }
}

BOOL __45__HDCloudSyncSharedSummaryPullOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 zoneIdentifier];
  uint64_t v8 = 0;
  id v9 = 0;
  int v4 = objc_msgSend(v3, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v9, &v8);
  id v5 = v9;

  if (v4) {
    BOOL v6 = [v2 scope] == 3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
}

@end
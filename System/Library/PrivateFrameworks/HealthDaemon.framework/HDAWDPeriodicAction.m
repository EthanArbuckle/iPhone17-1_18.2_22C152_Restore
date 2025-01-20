@interface HDAWDPeriodicAction
@end

@implementation HDAWDPeriodicAction

void __42___HDAWDPeriodicAction__beginWaitingToRun__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[18];
  if (!(v3 % v2[8]))
  {
    -[_HDAWDPeriodicAction _queue_setWaitingToRun:]((uint64_t)v2, v2[9]);
    v2 = *(void **)(a1 + 32);
  }
  -[_HDAWDPeriodicAction _queue_setIntervalCounter:]((uint64_t)v2, v3 + 1);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 96));
    if (*(unsigned char *)(v4 + 56))
    {
      v5 = NSString;
      v6 = (void *)MEMORY[0x1E4F29128];
      id v7 = *(id *)(v4 + 160);
      v8 = [v6 UUID];
      v9 = [v8 UUIDString];
      v10 = [v5 stringWithFormat:@"%@-%@", v7, v9];

      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 88));
      v12 = [WeakRetained database];
      id v20 = 0;
      v13 = [v12 takeAccessibilityAssertionWithOwnerIdentifier:v10 timeout:&v20 error:300.0];
      id v14 = v20;

      if (v13)
      {
        v16 = *(void **)(v4 + 104);
        v15 = (id *)(v4 + 104);
        id v17 = v16;
        v18 = v17;
        if (v17) {
          [v17 invalidate];
        }
        objc_storeStrong(v15, v13);
      }
      else
      {
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v4;
          __int16 v23 = 2114;
          id v24 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to take database accessibility assertion during activity preparation: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

void __45___HDAWDPeriodicAction_setLastProcessedDate___block_invoke(uint64_t a1)
{
}

void __29___HDAWDPeriodicAction_reset__block_invoke(uint64_t a1)
{
  -[_HDAWDPeriodicAction _queue_setWaitingToRun:](*(void *)(a1 + 32), 0);
  -[_HDAWDPeriodicAction _queue_setLastSubmissionAttemptDate:](*(void *)(a1 + 32), 0);
  -[_HDAWDPeriodicAction _queue_setIntervalCounter:](*(void *)(a1 + 32), 0);
  uint64_t v2 = *(void *)(a1 + 32);

  -[_HDAWDPeriodicAction _queue_setLastProcessedDate:](v2, 0);
}

void __41___HDAWDPeriodicAction_lastProcessedDate__block_invoke(uint64_t a1)
{
}

void __49___HDAWDPeriodicAction_lastSubmissionAttemptDate__block_invoke(uint64_t a1)
{
}

uint64_t __39___HDAWDPeriodicAction_intervalCounter__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 144);
  return result;
}

void __29___HDAWDPeriodicAction_start__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = [HDPeriodicActivity alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 88));
    uint64_t v4 = (os_log_t *)MEMORY[0x1E4F29F28];
    uint64_t v5 = [(HDPeriodicActivity *)v2 initWithProfile:WeakRetained name:*(void *)(v1 + 160) interval:v1 delegate:*MEMORY[0x1E4F29F28] loggingCategory:(double)*(uint64_t *)(v1 + 40)];
    v6 = *(void **)(v1 + 120);
    *(void *)(v1 + 120) = v5;

    _HKInitializeLogging();
    id v7 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(v1 + 160);
      int v9 = 138543618;
      uint64_t v10 = v1;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@: Registered XPC activity %{public}@ for periodic updates", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __69___HDAWDPeriodicAction__doIfWaitingOnMaintenanceQueueWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = a2;
  if (v3)
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__100;
    v32 = __Block_byref_object_dispose__100;
    id v33 = 0;
    uint64_t v5 = *(NSObject **)(v3 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke;
    block[3] = &unk_1E62FA0E8;
    block[4] = v3;
    block[5] = &v34;
    block[6] = &v28;
    dispatch_sync(v5, block);
    if (*((unsigned char *)v35 + 24))
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(v3 + 160);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Attempting to submit metric for %@", buf, 0xCu);
      }
      uint64_t v8 = +[HKDaemonTransaction transactionWithOwner:v3 activityName:*(void *)(v3 + 160)];
      int v9 = (void *)v29[5];
      id v26 = 0;
      id v10 = v9;
      __int16 v11 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v11 setCacheScope:1];
      if (v10) {
        [(HDMutableDatabaseTransactionContext *)v11 addAccessibilityAssertion:v10];
      }
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 88));
      uint64_t v13 = [WeakRetained database];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __66___HDAWDPeriodicAction__runBlockWithAccessibilityAssertion_error___block_invoke;
      v39 = &unk_1E62F6A18;
      uint64_t v40 = v3;
      int v14 = [v13 performWithTransactionContext:v11 error:&v26 block:buf];

      id v15 = v26;
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(v3 + 160);
        v18 = @"NO";
        *(_DWORD *)buf = 138412802;
        if (v14) {
          v18 = @"YES";
        }
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2114;
        v39 = v15;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "%@ Submission success: %{public}@, error: %{public}@", buf, 0x20u);
      }
      id v19 = v15;
      id v20 = v19;
      if (v19) {
        id v21 = v19;
      }

      uint64_t v22 = *(NSObject **)(v3 + 96);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_332;
      v39 = &unk_1E62F8638;
      uint64_t v40 = v3;
      char v41 = v14;
      dispatch_sync(v22, buf);
      [v8 invalidate];
    }
    else
    {
      id v20 = 0;
    }
    __int16 v23 = *(NSObject **)(v3 + 96);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_2;
    v25[3] = &unk_1E62F6B28;
    v25[4] = &v28;
    dispatch_sync(v23, v25);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    id v20 = 0;
  }
  id v24 = v20;
  v4[2](v4);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F29F28];
  uint64_t v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = *(void *)(v10 + 160);
    uint64_t v12 = *(void *)(v10 + 136);
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_debug_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEBUG, "%@ Last submitted at %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v4 = a1[4];
  if (v4)
  {
    if (*(void *)(v4 + 136))
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
      [v5 timeIntervalSinceDate:*(void *)(v4 + 136)];
      LOBYTE(v4) = v6 > *(double *)(v4 + 80);
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    _HKInitializeLogging();
    uint64_t v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1[4] + 160);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%@ Skipping submission: last attempt was too recent", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 104));
  uint64_t v8 = a1[4];
  int v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = 0;
}

void __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_332(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  -[_HDAWDPeriodicAction _queue_setLastSubmissionAttemptDate:](v2, v3);

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(v4 + 128);
    if (v6 <= 1) {
      uint64_t v6 = 1;
    }
    uint64_t v5 = v6 - 1;
  }

  -[_HDAWDPeriodicAction _queue_setWaitingToRun:](v4, v5);
}

uint64_t __46___HDAWDPeriodicAction__doIfWaitingWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

uint64_t __66___HDAWDPeriodicAction__runBlockWithAccessibilityAssertion_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 112) + 16))();
}

uint64_t __59___HDAWDPeriodicAction_performPeriodicActivity_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = 2;
  }
  return (*(uint64_t (**)(void, uint64_t, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2, *(double *)(*(void *)(a1 + 32) + 80));
}

@end
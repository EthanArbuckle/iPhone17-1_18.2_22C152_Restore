@interface HKWorkoutObserver
@end

@implementation HKWorkoutObserver

void __42___HKWorkoutObserver_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startTaskServerIfNeeded];
}

void __34___HKWorkoutObserver_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 24))
    {
      v3 = [*(id *)(v2 + 56) clientQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __34___HKWorkoutObserver_setDelegate___block_invoke_2;
      v6[3] = &unk_1E58BBBD0;
      id v4 = *(id *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 32);
      id v7 = v4;
      uint64_t v8 = v5;
      dispatch_async(v3, v6);
    }
  }
}

uint64_t __34___HKWorkoutObserver_setDelegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateWorkoutSnapshot:*(void *)(*(void *)(a1 + 40) + 16)];
}

uint64_t __30___HKWorkoutObserver_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));

  return MEMORY[0x1F41817F8]();
}

void __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 56) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BB9A0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    v3 = *(void **)(v1 + 40);
    id v5 = (id)[*(id *)(a1 + 40) copy];
    id v4 = _Block_copy(v5);
    [v3 addObject:v4];
  }
}

void __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BBEC0;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_waitForAutomaticWorkoutRecoveryWithCompletion:", *(void *)(a1 + 32));
}

void __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4_cold_1(a1, (uint64_t)v3, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __43___HKWorkoutObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

uint64_t __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v8 removeAllObjects];
}

void __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1[5] + 8) + 40) didUpdateWorkoutSnapshot:a1[4]];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __46___HKWorkoutObserver__startTaskServerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_startTaskServerIfNeeded");
}

uint64_t __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "%{public}@: Failed to register for automatic workout recovery completion: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)(a1 + 32) + 72);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "Unable to fetch workout observer %@ proxy after interrupted connection with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end
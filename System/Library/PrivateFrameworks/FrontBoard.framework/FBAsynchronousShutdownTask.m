@interface FBAsynchronousShutdownTask
+ (void)startTaskWithName:(id)a3 timeout:(double)a4 workItem:(id)a5;
+ (void)waitForTasks;
@end

@implementation FBAsynchronousShutdownTask

+ (void)waitForTasks
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 componentsJoinedByString:@", "];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "Shutdown tasks timed out: %{public}@. Shutting down now.", (uint8_t *)&v4, 0xCu);
}

id __42__FBAsynchronousShutdownTask_waitForTasks__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 8);
}

+ (void)startTaskWithName:(id)a3 timeout:(double)a4 workItem:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = (void *)[a3 copy];
  v9 = objc_alloc_init(FBAsynchronousShutdownTask);
  objc_storeStrong((id *)&v9->_name, v8);
  v9->_interval = a4;
  v10 = FBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    name = v9->_name;
    *(_DWORD *)buf = 138543618;
    v41 = name;
    __int16 v42 = 2048;
    double v43 = a4;
    _os_log_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEFAULT, "Starting shutdown task \"%{public}@\" with %.1fs timeout.", buf, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  if (!__lock_group)
  {
    dispatch_group_t v12 = dispatch_group_create();
    v13 = (void *)__lock_group;
    __lock_group = (uint64_t)v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = (void *)__lock_tasks;
    __lock_tasks = (uint64_t)v14;
  }
  [(id)__lock_tasks addObject:v9];
  v16 = (id)__lock_group;
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  dispatch_group_enter(v16);
  v17 = (void *)MEMORY[0x1E4F627F8];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke;
  v37[3] = &unk_1E5C4B1B8;
  v18 = v9;
  v38 = v18;
  v39 = v16;
  v19 = v16;
  v20 = [v17 sentinelWithCompletion:v37];
  v21 = [NSString stringWithFormat:@"FBSShutdownTask:%@", v8];
  SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
  v23 = [MEMORY[0x1E4F1C9C8] date];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_10;
  block[3] = &unk_1E5C4B4A8;
  id v31 = SerialWithQoS;
  v32 = v18;
  id v33 = v8;
  id v34 = v23;
  id v35 = v20;
  id v36 = v7;
  id v24 = v20;
  id v25 = v23;
  id v26 = v8;
  v27 = v18;
  v28 = SerialWithQoS;
  id v29 = v7;
  dispatch_async(v28, block);
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isFailed])
  {
    v3 = FBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) { {
      __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_cold_1(a1, v3);
    }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2;
  v4[3] = &unk_1E5C4B480;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  [(id)__lock_tasks removeObject:*(void *)(a1 + 32)];
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  int v4 = FBLogCommon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) { {
      __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2_cold_1(a1, v3, v5);
    }
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) timeIntervalSinceNow];
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    double v11 = -v7;
    _os_log_impl(&dword_1A62FC000, v5, OS_LOG_TYPE_DEFAULT, "Shutdown task \"%{public}@\" complete after %.2fs", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 56) signal];
}

- (void).cxx_destruct
{
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "Shutdown task \"%{public}@\" dropped completion handler on the floor.", (uint8_t *)&v3, 0xCu);
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) timeIntervalSinceNow];
  double v7 = -v6;
  int v8 = [a2 descriptionWithMultilinePrefix:0];
  int v9 = 138543874;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  double v12 = v7;
  __int16 v13 = 2114;
  id v14 = v8;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "Shutdown task \"%{public}@\" failed after %.2fs with error: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end
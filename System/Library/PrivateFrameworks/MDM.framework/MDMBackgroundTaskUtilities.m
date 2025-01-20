@interface MDMBackgroundTaskUtilities
+ (void)cancelBackgroundTask:(id)a3;
+ (void)scheduleOneShotBackgroundTask:(id)a3 usingQueue:(id)a4 interval:(double)a5 gracePeriod:(double)a6 callback:(id)a7;
@end

@implementation MDMBackgroundTaskUtilities

+ (void)scheduleOneShotBackgroundTask:(id)a3 usingQueue:(id)a4 interval:(double)a5 gracePeriod:(double)a6 callback:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v11 = (__CFString *)a3;
  id v12 = a7;
  v13 = (void *)MEMORY[0x263F29900];
  id v14 = a4;
  v15 = [v13 sharedScheduler];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __101__MDMBackgroundTaskUtilities_scheduleOneShotBackgroundTask_usingQueue_interval_gracePeriod_callback___block_invoke;
  v33[3] = &unk_264B9D280;
  id v16 = v12;
  id v34 = v16;
  char v17 = [v15 registerForTaskWithIdentifier:v11 usingQueue:v14 launchHandler:v33];

  if ((v17 & 1) == 0)
  {
    v18 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v11;
      _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_ERROR, "DMCBackgroundActivityManager: Failed to register for task with name: %{public}@", buf, 0xCu);
    }
  }
  v19 = [MEMORY[0x263F29900] sharedScheduler];
  v20 = [v19 taskRequestForIdentifier:v11];

  if (!v20)
  {
    v22 = (void *)[objc_alloc(MEMORY[0x263F298E0]) initWithIdentifier:v11];
    [v22 setRequiresNetworkConnectivity:1];
    [v22 setRequiresExternalPower:0];
    [v22 setScheduleAfter:a5];
    [v22 setTrySchedulingBefore:a5 + a6];
    v23 = [MEMORY[0x263F29900] sharedScheduler];
    id v32 = 0;
    char v24 = [v23 submitTaskRequest:v22 error:&v32];
    v25 = (__CFString *)v32;

    v26 = *(NSObject **)(DMCLogObjects() + 8);
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v27 = "DMCBackgroundActivityManager: request submmited";
        v28 = v26;
        os_log_type_t v29 = OS_LOG_TYPE_INFO;
        uint32_t v30 = 2;
LABEL_14:
        _os_log_impl(&dword_230A49000, v28, v29, v27, buf, v30);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v31 = @"Unknown";
      if (v25) {
        v31 = v25;
      }
      *(_DWORD *)buf = 138412290;
      v36 = v31;
      v27 = "DMCBackgroundActivityManager: Failed to submit task with error: %@";
      v28 = v26;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      uint32_t v30 = 12;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  v21 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v21, OS_LOG_TYPE_INFO, "DMCBackgroundActivityManager: Task has been submitted. Abort...", buf, 2u);
  }
LABEL_16:
}

void __101__MDMBackgroundTaskUtilities_scheduleOneShotBackgroundTask_usingQueue_interval_gracePeriod_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_INFO, "DMCBackgroundActivityManager: launchHandler called!", v5, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v3 setTaskCompleted];
}

+ (void)cancelBackgroundTask:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F29900] sharedScheduler];
  id v7 = 0;
  [v4 cancelTaskRequestWithIdentifier:v3 error:&v7];
  id v5 = v7;

  if (v5)
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v9 = v3;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "DMCBackgroundActivityManager: Failed to cancel task (%{public}@) with error: %{public}@", buf, 0x16u);
    }
  }
}

@end
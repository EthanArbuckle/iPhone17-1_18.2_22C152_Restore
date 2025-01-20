@interface DPPeriodicTaskManager
@end

@implementation DPPeriodicTaskManager

void __39___DPPeriodicTaskManager_registerTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      *(void *)&long long v32 = 0;
      *((void *)&v32 + 1) = &v32;
      uint64_t v33 = 0x2020000000;
      BOOL v34 = 0;
      BOOL v34 = xpc_activity_set_state(v3, 4);
      v5 = +[_DPLog framework];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = [*(id *)(a1 + 32) name];
        int v7 = *(unsigned __int8 *)(*((void *)&v32 + 1) + 24);
        *(_DWORD *)buf = 138412546;
        v29 = v6;
        __int16 v30 = 1024;
        int v31 = v7;
        _os_log_impl(&dword_1DC55E000, v5, OS_LOG_TYPE_INFO, "Running activity %@, extended=%d", buf, 0x12u);
      }
      v8 = +[_DPCoreAnalyticsCollector sharedInstance];
      v27[0] = &unk_1F37A0370;
      v26[0] = @"duration";
      v26[1] = @"activityName";
      v9 = [*(id *)(a1 + 32) name];
      v26[2] = @"activityState";
      v27[1] = v9;
      v27[2] = &unk_1F37A0388;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
      [v8 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.MaintenanceActivity" withMetrics:v10];

      v11 = [MEMORY[0x1E4F28F80] processInfo];
      [v11 systemUptime];
      uint64_t v13 = v12;

      v14 = [*(id *)(a1 + 32) queue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __39___DPPeriodicTaskManager_registerTask___block_invoke_50;
      v21[3] = &unk_1E6C44190;
      id v22 = *(id *)(a1 + 32);
      v23 = v3;
      v24 = &v32;
      uint64_t v25 = v13;
      dispatch_async(v14, v21);

      _Block_object_dispose(&v32, 8);
    }
  }
  else
  {
    v15 = +[_DPLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [*(id *)(a1 + 32) name];
      LODWORD(v32) = 138412290;
      *(void *)((char *)&v32 + 4) = v16;
      _os_log_impl(&dword_1DC55E000, v15, OS_LOG_TYPE_INFO, "Checking-in activity %@", (uint8_t *)&v32, 0xCu);
    }
    xpc_object_t v17 = xpc_activity_copy_criteria(v3);
    if (!v17
      || ([*(id *)(a1 + 32) executionCriteria],
          v18 = objc_claimAutoreleasedReturnValue(),
          BOOL v19 = xpc_equal(v17, v18),
          v18,
          !v19))
    {
      v20 = [*(id *)(a1 + 32) executionCriteria];
      xpc_activity_set_criteria(v3, v20);
    }
  }
}

void __39___DPPeriodicTaskManager_registerTask___block_invoke_50(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  getpid();
  proc_set_cpumon_params();
  id v2 = [*(id *)(a1 + 32) name];
  [v2 UTF8String];
  v3 = (void *)os_transaction_create();

  v4 = (void *)MEMORY[0x1E019F810]();
  v5 = [*(id *)(a1 + 32) handler];
  v5[2](v5, *(void *)(a1 + 40));

  getpid();
  proc_set_cpumon_defaults();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [*(id *)(a1 + 32) name];
      int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138412546;
      BOOL v19 = v7;
      __int16 v20 = 1024;
      int v21 = v8;
      _os_log_impl(&dword_1DC55E000, v6, OS_LOG_TYPE_INFO, "Done running activity %@, extended=%d", buf, 0x12u);
    }
    v9 = [MEMORY[0x1E4F28F80] processInfo];
    [v9 systemUptime];
    double v11 = v10;

    uint64_t v12 = +[_DPCoreAnalyticsCollector sharedInstance];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithDouble:", v11 - *(double *)(a1 + 56), @"duration");
    v17[0] = v13;
    v16[1] = @"activityName";
    v14 = [*(id *)(a1 + 32) name];
    v16[2] = @"activityState";
    v17[1] = v14;
    v17[2] = &unk_1F37A03A0;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    [v12 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.MaintenanceActivity" withMetrics:v15];
  }
}

@end
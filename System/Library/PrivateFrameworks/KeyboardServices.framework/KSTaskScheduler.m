@interface KSTaskScheduler
@end

@implementation KSTaskScheduler

void __34___KSTaskScheduler_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedManager;
  sharedInstance__sharedManager = v0;
}

void __33___KSTaskScheduler_registerTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      *(void *)v22 = 0;
      *(void *)&v22[8] = v22;
      *(void *)&v22[16] = 0x2020000000;
      BOOL v23 = 0;
      BOOL v23 = xpc_activity_set_state(v3, 4);
      v5 = KSCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = [*(id *)(a1 + 32) name];
        int v7 = *(unsigned __int8 *)(*(void *)&v22[8] + 24);
        *(_DWORD *)buf = 136315650;
        v17 = "-[_KSTaskScheduler registerTask:]_block_invoke";
        __int16 v18 = 2112;
        v19 = v6;
        __int16 v20 = 1024;
        int v21 = v7;
        _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  Running activity %@, extended=%d", buf, 0x1Cu);
      }
      v8 = [*(id *)(a1 + 32) queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __33___KSTaskScheduler_registerTask___block_invoke_70;
      block[3] = &unk_2648906D0;
      v13 = v3;
      id v14 = *(id *)(a1 + 32);
      v15 = v22;
      dispatch_async(v8, block);

      _Block_object_dispose(v22, 8);
    }
  }
  else
  {
    v9 = KSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [*(id *)(a1 + 32) name];
      *(_DWORD *)v22 = 136315394;
      *(void *)&v22[4] = "-[_KSTaskScheduler registerTask:]_block_invoke";
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v10;
      _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, "%s  Checking-in activity %@", v22, 0x16u);
    }
    v11 = [*(id *)(a1 + 32) executionCriteria];
    xpc_activity_set_criteria(v3, v11);
  }
}

void __33___KSTaskScheduler_registerTask___block_invoke_70(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  getpid();
  proc_set_cpumon_params();
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 136315394;
      v17 = "-[_KSTaskScheduler registerTask:]_block_invoke";
      __int16 v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  xpc activity should be deffered, deffering %@", buf, 0x16u);
    }
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v5 = (void *)os_transaction_create();
    v6 = (void *)MEMORY[0x230F44DF0]();
    int v7 = [*(id *)(a1 + 40) handler];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33___KSTaskScheduler_registerTask___block_invoke_72;
    v14[3] = &unk_2648906A8;
    v2 = v4;
    v15 = v2;
    ((void (**)(void, void *))v7)[2](v7, v14);

    [*(id *)(a1 + 40) maxRunTime];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    if (dispatch_semaphore_wait(v2, v9))
    {
      v10 = KSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __33___KSTaskScheduler_registerTask___block_invoke_70_cold_1(v10);
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
      v11 = KSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [*(id *)(a1 + 40) name];
        int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 136315650;
        v17 = "-[_KSTaskScheduler registerTask:]_block_invoke";
        __int16 v18 = 2112;
        v19 = v12;
        __int16 v20 = 1024;
        int v21 = v13;
        _os_log_impl(&dword_22B2BC000, v11, OS_LOG_TYPE_INFO, "%s  Done running activity %@, extended=%d", buf, 0x1Cu);
      }
    }

    getpid();
    proc_set_cpumon_defaults();
  }
}

intptr_t __33___KSTaskScheduler_registerTask___block_invoke_72(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __33___KSTaskScheduler_registerTask___block_invoke_70_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[_KSTaskScheduler registerTask:]_block_invoke_2";
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  Scheduled sync task timed out", (uint8_t *)&v1, 0xCu);
}

@end
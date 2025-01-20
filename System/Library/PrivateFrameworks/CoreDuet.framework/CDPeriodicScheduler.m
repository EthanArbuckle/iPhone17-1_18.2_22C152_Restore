@interface CDPeriodicScheduler
@end

@implementation CDPeriodicScheduler

uint64_t __38___CDPeriodicScheduler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_CDPeriodicScheduler);
  uint64_t v1 = sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __36___CDPeriodicScheduler_registerJob___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  v6 = [v5 activity];

  if (!v6) {
    [*v4 setActivity:v3];
  }
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (!state)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __36___CDPeriodicScheduler_registerJob___block_invoke_cold_3((uint64_t)v4);
    }
    id v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {
      v16 = [*v4 executionCriteria];
      BOOL v17 = xpc_equal(v8, v16);

      if (v17) {
        goto LABEL_27;
      }
    }
    v15 = [*v4 executionCriteria];
    xpc_activity_set_criteria(v3, v15);
    goto LABEL_16;
  }
  if (state == 2)
  {
    id v8 = [*v4 handler];
    v9 = [*v4 activity];
    v10 = v9;
    if (!v8)
    {
      xpc_activity_set_completion_status();

      goto LABEL_27;
    }
    BOOL v11 = xpc_activity_set_state(v9, 4);

    if (!v11)
    {
      v12 = [*v4 activity];
      BOOL should_defer = xpc_activity_should_defer(v12);

      if (should_defer)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          v14 = [*v4 jobName];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Warning: deferring activity '%@' before it started", (uint8_t *)&buf, 0xCu);
        }
        v15 = [*v4 activity];
        xpc_activity_set_state((xpc_activity_t)v15, 3);
LABEL_16:

LABEL_27:
        goto LABEL_28;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        __36___CDPeriodicScheduler_registerJob___block_invoke_cold_2((uint64_t)v4);
      }
      v18 = [*v4 activity];
      xpc_activity_set_completion_status();
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __36___CDPeriodicScheduler_registerJob___block_invoke_cold_1((uint64_t)v4);
    }
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __36___CDPeriodicScheduler_registerJob___block_invoke_61;
    v34 = &unk_1E560D978;
    id v8 = v8;
    id v36 = v8;
    id v35 = *v4;
    v19 = (void *)MEMORY[0x192FB31A0](&v31);
    v20 = objc_msgSend(*v4, "queue", v31, v32, v33, v34);
    v21 = [NSString stringWithUTF8String:_CDPeriodicSchedulerDefaultQueueName];
    v22 = [NSString stringWithUTF8String:dispatch_queue_get_label(v20)];
    int v23 = [v21 isEqualToString:v22];

    if (v23)
    {
      id v24 = v19;
      v25 = v20;
      v26 = (void *)os_transaction_create();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v38 = __cd_dispatch_async_capture_tx_block_invoke_1;
      v39 = &unk_1E560D978;
      id v40 = v26;
      id v41 = v24;
      id v27 = v24;
      id v28 = v26;
      dispatch_async(v25, &buf);
    }
    else
    {
      v29 = v20;
      id v30 = v19;
      id v28 = (id)os_transaction_create();
      dispatch_sync(v29, v30);
    }
    goto LABEL_27;
  }
LABEL_28:
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_61(uint64_t a1)
{
  getpid();
  proc_set_cpumon_params();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  getpid();
  proc_set_cpumon_defaults();
  v3 = *(void **)(a1 + 32);
  v2 = (id *)(a1 + 32);
  if (([v3 isHandlerAsynchronous] & 1) == 0)
  {
    v4 = [*v2 activity];
    xpc_activity_state_t state = xpc_activity_get_state(v4);

    if (state == 3)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __36___CDPeriodicScheduler_registerJob___block_invoke_61_cold_1((uint64_t)v2);
      }
    }
    else
    {
      v6 = [*v2 activity];
      xpc_activity_set_state(v6, 5);

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __36___CDPeriodicScheduler_registerJob___block_invoke_61_cold_2((uint64_t)v2);
      }
    }
  }
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_3(a1) jobName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Running activity %@", v3, v4, v5, v6, v7);
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_3(a1) jobName];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to set activity '%@' state to continue", v2, 0xCu);
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_3(a1) jobName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Checking-in activity %@", v3, v4, v5, v6, v7);
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_61_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_3(a1) jobName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Deferring activity %@", v3, v4, v5, v6, v7);
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_61_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_3(a1) jobName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Done running activity %@", v3, v4, v5, v6, v7);
}

@end
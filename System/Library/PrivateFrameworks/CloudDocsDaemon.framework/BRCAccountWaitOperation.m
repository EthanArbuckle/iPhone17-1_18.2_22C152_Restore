@interface BRCAccountWaitOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCAccountWaitOperation)initWithCKContainer:(id)a3;
- (id)createActivity;
- (id)descriptionForCKAccountStatus:(int64_t)a3 dumpContext:(id)a4;
- (id)subclassableDescriptionWithContext:(id)a3;
- (void)_accountChangeHandler;
- (void)_accountDidChange;
- (void)cancel;
- (void)dealloc;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)resumeIfNecessary;
- (void)start;
@end

@implementation BRCAccountWaitOperation

- (BRCAccountWaitOperation)initWithCKContainer:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BRCAccountWaitOperation;
  v6 = [(_BRCOperation *)&v43 initWithName:@"account-waiter"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ckContainer, a3);
    v8 = +[BRCUserDefaults defaultsForMangledID:0];
    v9 = [BRCConstantThrottle alloc];
    [v8 accountWaiterErrorRetryBackoff];
    uint64_t v10 = -[BRCConstantThrottle initWithName:andRetryBackoff:](v9, "initWithName:andRetryBackoff:", @"AccountWaiterThrottle");
    throttle = v7->_throttle;
    v7->_throttle = (BRCThrottle *)v10;

    [(_BRCOperation *)v7 setOperationFailureThrottle:v7->_throttle];
    v12 = [(_BRCOperation *)v7 callbackQueue];
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v12);
    source = v7->_source;
    v7->_source = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v7);
    v15 = v7->_source;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke;
    v40[3] = &unk_1E6993C50;
    objc_copyWeak(&v41, &location);
    v16 = v15;
    v17 = v40;
    v18 = v16;
    v19 = v17;
    v20 = v19;
    v21 = (void (**)(void *))MEMORY[0x1E4F59658];
    v22 = v19;
    if (*MEMORY[0x1E4F59658])
    {
      v22 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v19);
    }
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v22);
    dispatch_source_set_event_handler(v18, v23);

    v24 = v7->_source;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_2;
    v38[3] = &unk_1E6993698;
    v25 = v7;
    v39 = v25;
    v26 = v24;
    v27 = v38;
    v28 = v27;
    if (*v21)
    {
      uint64_t v29 = (*v21)(v27);

      v28 = (void *)v29;
    }
    dispatch_source_set_cancel_handler(v26, v28);

    v30 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v31 = dispatch_queue_attr_make_with_autorelease_frequency(v30, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.bird.account-waiter-refresh-queue", v31);

    refetchPacerQueue = v25->_refetchPacerQueue;
    v25->_refetchPacerQueue = (OS_dispatch_queue *)v32;

    [v8 accountWaiterRefreshPacerDelay];
    uint64_t v34 = br_pacer_create();
    refetchPacer = v25->_refetchPacer;
    v25->_refetchPacer = (br_pacer *)v34;

    objc_copyWeak(&v37, &location);
    br_pacer_set_event_handler();
    br_pacer_resume();
    objc_destroyWeak(&v37);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accountChangeHandler];
}

uint64_t __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(unsigned char *)(*(void *)(a1 + 32) + 537) = 1;
  objc_sync_exit(v2);

  v3 = *(void **)(a1 + 32);
  return [v3 finishIfCancelled];
}

void __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_3_cold_1();
    }

    [WeakRetained _accountDidChange];
  }
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "account-waiter", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (id)descriptionForCKAccountStatus:(int64_t)a3 dumpContext:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 0:
      v6 = @"unavailable";
      goto LABEL_8;
    case 1:
      uint64_t v7 = +[BRCDumpContext highlightedString:@"available" type:7 context:v5];
      goto LABEL_9;
    case 2:
      v6 = @"restricted";
      goto LABEL_8;
    case 3:
      v6 = @"no account";
      goto LABEL_8;
    case 4:
      v6 = @"temporarily unavailable";
      goto LABEL_8;
    default:
      v6 = @"unhandled account status";
LABEL_8:
      uint64_t v7 = +[BRCDumpContext stringFromErrorString:v6 context:v5];
LABEL_9:
      v8 = (void *)v7;

      return v8;
  }
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(BRCAccountWaitOperation *)v5 descriptionForCKAccountStatus:v5->_lastAccountStatus dumpContext:v4];
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 1;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)BRCAccountWaitOperation;
  [(_BRCOperation *)&v3 cancel];
  dispatch_source_cancel((dispatch_source_t)self->_source);
  [(BRCAccountWaitOperation *)self resumeIfNecessary];
}

- (void)resumeIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_resumed)
  {
    dispatch_resume((dispatch_object_t)obj->_source);
    obj->_resumed = 1;
  }
  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(BRCAccountWaitOperation *)self resumeIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)BRCAccountWaitOperation;
  [(_BRCOperation *)&v3 dealloc];
}

- (void)_accountChangeHandler
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx handling account change%@");
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v22 = *(_OWORD *)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 56);
  v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)block = 134218498;
    *(void *)&block[4] = v22;
    *(_WORD *)&block[12] = 2048;
    *(void *)&block[14] = a2;
    *(_WORD *)&block[22] = 2112;
    v27 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got status %ld%@", block, 0x20u);
  }

  v8 = [*(id *)(a1 + 32) callbackQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31;
  v19[3] = &unk_1E6993F70;
  v19[4] = *(void *)(a1 + 32);
  uint64_t v21 = a2;
  id v9 = v5;
  id v20 = v9;
  uint64_t v10 = v8;
  v11 = v19;
  v12 = (void *)MEMORY[0x1D9438760]();
  long long v24 = 0uLL;
  uint64_t v25 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v24);
  dispatch_source_t v13 = brc_bread_crumbs();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = v24;
    label = dispatch_queue_get_label(v10);
    *(_DWORD *)block = 134218498;
    *(void *)&block[4] = v17;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v27 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v30 = v24;
  uint64_t v31 = v25;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_5;
  v27 = &unk_1E6993710;
  v15 = v10;
  v28 = v15;
  v16 = v11;
  id v29 = v16;
  dispatch_async(v15, block);

  __brc_leave_section((uint64_t *)&v22);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(void *)(*(void *)(a1 + 32) + 528) = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) resumeIfNecessary];
  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 537);
  objc_sync_exit(v2);

  if (!v3)
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
        id v4 = brc_bread_crumbs();
        id v5 = brc_default_log();
        if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_3();
        }

        dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 504));
        v6 = *(void **)(a1 + 32);
        uint64_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
        [v6 completedWithResult:v7 error:*(void *)(a1 + 40)];

        return;
      case 1:
        goto LABEL_9;
      case 2:
        v14 = brc_bread_crumbs();
        v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_5();
        }
        goto LABEL_18;
      case 3:
        v14 = brc_bread_crumbs();
        v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_4();
        }
        goto LABEL_18;
      case 4:
        v14 = brc_bread_crumbs();
        v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_6();
        }
LABEL_18:

        br_pacer_signal_at_most_after_min_interval();
        break;
      default:
        v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_2();
        }

LABEL_9:
        uint64_t v10 = brc_bread_crumbs();
        v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_1();
        }

        dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 504));
        v12 = *(void **)(a1 + 32);
        dispatch_source_t v13 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
        [v12 completedWithResult:v13 error:0];

        break;
    }
  }
}

- (void)_accountDidChange
{
}

- (void)start
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__accountDidChange name:*MEMORY[0x1E4F19BE0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)BRCAccountWaitOperation;
  [(_BRCOperation *)&v4 start];
}

- (void)main
{
  id v2 = self;
  objc_sync_enter(v2);
  v2->_resumed = 1;
  objc_sync_exit(v2);

  dispatch_source_merge_data((dispatch_source_t)v2->_source, 1uLL);
  source = v2->_source;
  dispatch_resume(source);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  br_pacer_cancel();
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F19BE0] object:0];

  v9.receiver = self;
  v9.super_class = (Class)BRCAccountWaitOperation;
  [(_BRCOperation *)&v9 finishWithResult:v7 error:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refetchPacer, 0);
  objc_storeStrong((id *)&self->_refetchPacerQueue, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Simulating an account did change to refresh the CK account status%@", v2, v3, v4, v5, v6);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Account is now available%@", v2, v3, v4, v5, v6);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown account status%@", v1, 0xCu);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Error when asking CloudKit about the account status: %@%@", v1, 0x16u);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] No account loaded yet, let's wait for the account notification from CloudKit%@", v2, v3, v4, v5, v6);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Account is restricted let's wait for a notification from CloudKit%@", v2, v3, v4, v5, v6);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_31_cold_6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Account is temporarily unavailable, let's wait for a notification from CloudKit%@", v2, v3, v4, v5, v6);
}

@end
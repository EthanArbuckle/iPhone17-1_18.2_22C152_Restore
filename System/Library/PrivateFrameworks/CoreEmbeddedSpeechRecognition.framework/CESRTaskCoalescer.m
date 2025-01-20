@interface CESRTaskCoalescer
+ (BOOL)isTaskCoalescenceDisabled;
+ (void)setTaskCoalescenceDisabled:(BOOL)a3;
- (BOOL)_didIncomingTask:(id)a3 arriveInCoalescingWindowWithLastTask:(id)a4;
- (CESRTaskCoalescer)init;
- (CESRTaskCoalescer)initWithManagerName:(id)a3 coalescenceInterval:(double)a4 coalescenceDelay:(double)a5 executionQueue:(id)a6;
- (OS_os_transaction)transaction;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)submitTaskWithId:(unsigned __int16)a3 taskBlock:(id)a4 completion:(id)a5;
- (void)wait;
@end

@implementation CESRTaskCoalescer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistryQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistry, 0);

  objc_storeStrong((id *)&self->_managerName, 0);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (BOOL)_didIncomingTask:(id)a3 arriveInCoalescingWindowWithLastTask:(id)a4
{
  id v6 = a4;
  v7 = [a3 date];
  [v7 timeIntervalSince1970];
  double v9 = v8;
  v10 = [v6 date];

  [v10 timeIntervalSince1970];
  double v12 = v9 - v11;

  return v12 < self->_coalescenceInterval;
}

- (void)_endTransaction
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_transactionCounter - 1;
  v2->_transactionCounter = v3;
  if (!v3)
  {
    v4 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      transaction = v2->_transaction;
      int v8 = 136315650;
      double v9 = "-[CESRTaskCoalescer _endTransaction]";
      __int16 v10 = 2112;
      double v11 = managerName;
      __int16 v12 = 2112;
      v13 = transaction;
      _os_log_debug_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_DEBUG, "%s (%@) Releasing OS transaction: %@", (uint8_t *)&v8, 0x20u);
    }
    v5 = v2->_transaction;
    v2->_transaction = 0;
  }
  objc_sync_exit(v2);
}

- (void)_beginTransaction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  unsigned int transactionCounter = v2->_transactionCounter;
  v2->_unsigned int transactionCounter = transactionCounter + 1;
  if (!transactionCounter)
  {
    uint64_t v4 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v4;

    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      int v8 = v2->_transaction;
      int v9 = 136315650;
      __int16 v10 = "-[CESRTaskCoalescer _beginTransaction]";
      __int16 v11 = 2112;
      __int16 v12 = managerName;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_debug_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_DEBUG, "%s (%@) Acquired OS transaction: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_sync_exit(v2);
}

- (void)wait
{
  dispatch_sync((dispatch_queue_t)self->_taskRegistryQueue, &__block_literal_global_293);
  taskExecutionQueue = self->_taskExecutionQueue;

  dispatch_sync(taskExecutionQueue, &__block_literal_global_55);
}

- (void)submitTaskWithId:(unsigned __int16)a3 taskBlock:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(CESRTaskCoalescer *)self _beginTransaction];
  __int16 v10 = [NSNumber numberWithUnsignedShort:v6];
  __int16 v11 = NSNumber;
  atomic_fetch_add((atomic_uint *volatile)&self->_eventIdCounter, 1u);
  __int16 v12 = objc_msgSend(v11, "numberWithUnsignedInteger:");
  __int16 v13 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    managerName = self->_managerName;
    *(_DWORD *)buf = 136315906;
    v33 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]";
    __int16 v34 = 2112;
    v35 = managerName;
    __int16 v36 = 2112;
    v37 = v10;
    __int16 v38 = 2112;
    v39 = v12;
    _os_log_debug_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_DEBUG, "%s (%@) Received task with taskId: %@ and eventId: %@", buf, 0x2Au);
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke;
  aBlock[3] = &unk_1E61C3820;
  aBlock[4] = self;
  id v31 = v9;
  id v15 = v9;
  v16 = _Block_copy(aBlock);
  taskRegistryQueue = self->_taskRegistryQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2;
  v24[3] = &unk_1E61C2BE0;
  v24[4] = self;
  id v25 = v10;
  id v26 = v12;
  id v27 = v14;
  id v28 = v16;
  id v29 = v8;
  id v18 = v8;
  id v19 = v14;
  id v20 = v16;
  id v21 = v12;
  id v22 = v10;
  dispatch_async(taskRegistryQueue, v24);
}

uint64_t __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _endTransaction];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[CESRTaskCoalescer isTaskCoalescenceDisabled];
  if (v2)
  {
    int v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(CESRCoalescedTask **)(a1 + 40);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = *(CESRCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      id v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke_2";
      __int16 v29 = 2112;
      uint64_t v30 = v5;
      __int16 v31 = 2112;
      v32 = v4;
      __int16 v33 = 2112;
      __int16 v34 = v6;
      _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s (%@) Task coalescence is currently disabled (taskId: %@ eventId: %@)", buf, 0x2Au);
    }
  }
  v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  id v8 = v7;
  if (v7) {
    char v9 = v2;
  }
  else {
    char v9 = 1;
  }
  if (v9 & 1) != 0 || ([v7 isExecuted])
  {
    __int16 v10 = [[CESRCoalescedTask alloc] initWithTaskId:*(void *)(a1 + 40) eventId:*(void *)(a1 + 48) date:*(void *)(a1 + 56) taskBlock:*(void *)(a1 + 72) completionQueue:*(void *)(*(void *)(a1 + 32) + 56) completion:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v10 forKey:*(void *)(a1 + 40)];
    if ((v9 & 1) != 0
      || ![*(id *)(a1 + 32) _didIncomingTask:v10 arriveInCoalescingWindowWithLastTask:v8])
    {
      id v18 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136315650;
        id v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        __int16 v29 = 2112;
        uint64_t v30 = v24;
        __int16 v31 = 2112;
        v32 = v10;
        _os_log_debug_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_DEBUG, "%s (%@) Enqueueing incoming task for execution - %@", buf, 0x20u);
      }
      id v19 = *(NSObject **)(*(void *)(a1 + 32) + 64);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_53;
      block[3] = &unk_1E61C38C0;
      id v26 = v10;
      dispatch_async(v19, block);
    }
    else
    {
      __int16 v11 = (void *)*MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(v12 + 8);
        uint64_t v14 = NSNumber;
        double v15 = *(double *)(v12 + 48);
        v16 = v11;
        v17 = [v14 numberWithDouble:v15];
        *(_DWORD *)buf = 136315906;
        id v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        __int16 v29 = 2112;
        uint64_t v30 = v13;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 2112;
        __int16 v34 = v10;
        _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s (%@) Delaying %@s before executing incoming task within coalescing window - (%@)", buf, 0x2Au);
      }
      [(CESRCoalescedTask *)v10 executeAfterDelay:*(void *)(*(void *)(a1 + 32) + 64) onQueue:*(double *)(*(void *)(a1 + 32) + 48)];
    }
  }
  else
  {
    id v20 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      id v21 = *(CESRCoalescedTask **)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
      v23 = *(CESRCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      id v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      v32 = v21;
      __int16 v33 = 2112;
      __int16 v34 = v23;
      __int16 v35 = 2112;
      __int16 v36 = v8;
      _os_log_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_INFO, "%s (%@) Dropping incoming task (taskId: %@ eventId: %@) as a task with the same taskId is already enqueued and has not been executed: (%@)", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute];
}

- (CESRTaskCoalescer)initWithManagerName:(id)a3 coalescenceInterval:(double)a4 coalescenceDelay:(double)a5 executionQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CESRTaskCoalescer;
  uint64_t v12 = [(CESRTaskCoalescer *)&v33 init];
  if (!v12) {
    goto LABEL_6;
  }
  uint64_t v13 = [v10 copy];
  managerName = v12->_managerName;
  v12->_managerName = (NSString *)v13;

  if (![(NSString *)v12->_managerName length])
  {
    v23 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v12->_managerName;
      *(_DWORD *)buf = 136315394;
      __int16 v35 = "-[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]";
      __int16 v36 = 2112;
      uint64_t v37 = v24;
      _os_log_error_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_ERROR, "%s Manager name must be nonempty. Received: %@", buf, 0x16u);
    }
    goto LABEL_12;
  }
  atomic_store(0, &v12->_eventIdCounter);
  double v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  taskRegistry = v12->_taskRegistry;
  v12->_taskRegistry = v15;

  transaction = v12->_transaction;
  v12->_transaction = 0;

  v12->_unsigned int transactionCounter = 0;
  v12->_coalescenceInterval = a4;
  if (a4 <= 0.0)
  {
    id v25 = (void *)*MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      uint64_t v22 = 0;
      goto LABEL_13;
    }
    id v26 = NSNumber;
    id v27 = v25;
    id v28 = [v26 numberWithDouble:a4];
    *(_DWORD *)buf = 136315394;
    __int16 v35 = "-[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]";
    __int16 v36 = 2112;
    uint64_t v37 = v28;
    __int16 v29 = "%s Coalescence interval must be greater than 0. Received: %@";
LABEL_15:
    _os_log_error_impl(&dword_1B8CCB000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);

    goto LABEL_12;
  }
  v12->_coalescenceDelay = a5;
  if (a5 <= 0.0)
  {
    uint64_t v30 = (void *)*MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v32 = NSNumber;
    id v27 = v30;
    id v28 = [v32 numberWithDouble:a5];
    *(_DWORD *)buf = 136315394;
    __int16 v35 = "-[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]";
    __int16 v36 = 2112;
    uint64_t v37 = v28;
    __int16 v29 = "%s Coalescence delay must be greater than 0. Received: %@";
    goto LABEL_15;
  }
  id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v20 = dispatch_queue_create("taskRegistryQueue", v19);
  taskRegistryQueue = v12->_taskRegistryQueue;
  v12->_taskRegistryQueue = (OS_dispatch_queue *)v20;

  objc_storeStrong((id *)&v12->_taskExecutionQueue, a6);
LABEL_6:
  uint64_t v22 = v12;
LABEL_13:

  return v22;
}

- (CESRTaskCoalescer)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

+ (void)setTaskCoalescenceDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = @"Enabling";
    if (v3) {
      uint64_t v5 = @"Disabling";
    }
    int v8 = 136315394;
    char v9 = "+[CESRTaskCoalescer setTaskCoalescenceDisabled:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s %@ task coalescence.", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [NSNumber numberWithBool:v3];
  [v6 setObject:v7 forKey:@"Disable Coalescence"];
}

+ (BOOL)isTaskCoalescenceDisabled
{
  if (+[CESRUtilities isCustomerInstall]) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"Disable Coalescence"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0) {
    char v2 = [v4 BOOLValue];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

@end
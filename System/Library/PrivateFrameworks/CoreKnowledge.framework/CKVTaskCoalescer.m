@interface CKVTaskCoalescer
- (BOOL)_didIncomingTask:(id)a3 arriveInCoalescingWindowWithLastTask:(id)a4;
- (CKVTaskCoalescer)init;
- (CKVTaskCoalescer)initWithManagerName:(id)a3 coalescenceInterval:(double)a4 coalescenceDelay:(double)a5 dispatchQoS:(unsigned int)a6 settings:(id)a7;
- (OS_os_transaction)transaction;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)submitTaskWithId:(unsigned __int16)a3 taskBlock:(id)a4 completion:(id)a5;
@end

@implementation CKVTaskCoalescer

uint64_t __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute];
}

- (void)submitTaskWithId:(unsigned __int16)a3 taskBlock:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(CKVTaskCoalescer *)self _beginTransaction];
  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v6];
  v11 = (void *)MEMORY[0x1E4F28ED0];
  atomic_fetch_add((atomic_uint *volatile)&self->_eventIdCounter, 1u);
  v12 = objc_msgSend(v11, "numberWithUnsignedInteger:");
  v13 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
  {
    managerName = self->_managerName;
    *(_DWORD *)buf = 136315906;
    v33 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]";
    __int16 v34 = 2112;
    v35 = managerName;
    __int16 v36 = 2112;
    v37 = v10;
    __int16 v38 = 2112;
    v39 = v12;
    _os_log_debug_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_DEBUG, "%s (%@) Received task with taskId: %@ and eventId: %@", buf, 0x2Au);
  }
  v14 = [MEMORY[0x1E4F1C9C8] now];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke;
  aBlock[3] = &unk_1E5CF9B90;
  aBlock[4] = self;
  id v31 = v9;
  id v15 = v9;
  v16 = _Block_copy(aBlock);
  taskRegistryQueue = self->_taskRegistryQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2;
  v24[3] = &unk_1E5CF9748;
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

    uint64_t v6 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      id v8 = v2->_transaction;
      int v9 = 136315650;
      v10 = "-[CKVTaskCoalescer _beginTransaction]";
      __int16 v11 = 2112;
      v12 = managerName;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_DEBUG, "%s (%@) Acquired OS transaction: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_sync_exit(v2);
}

void __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 72) isTaskCoalescenceDisabled];
  if (v2)
  {
    v3 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(CKVCoalescedTask **)(a1 + 40);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = *(CKVCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      id v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke_2";
      __int16 v29 = 2112;
      uint64_t v30 = v5;
      __int16 v31 = 2112;
      v32 = v4;
      __int16 v33 = 2112;
      __int16 v34 = v6;
      _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s (%@) Task coalescence is currently disabled (taskId: %@ eventId: %@)", buf, 0x2Au);
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
    v10 = [[CKVCoalescedTask alloc] initWithTaskId:*(void *)(a1 + 40) eventId:*(void *)(a1 + 48) date:*(void *)(a1 + 56) taskBlock:*(void *)(a1 + 72) completionQueue:*(void *)(*(void *)(a1 + 32) + 56) completion:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v10 forKey:*(void *)(a1 + 40)];
    if ((v9 & 1) != 0
      || ![*(id *)(a1 + 32) _didIncomingTask:v10 arriveInCoalescingWindowWithLastTask:v8])
    {
      id v18 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136315650;
        id v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        __int16 v29 = 2112;
        uint64_t v30 = v24;
        __int16 v31 = 2112;
        v32 = v10;
        _os_log_debug_impl(&dword_1A77B3000, v18, OS_LOG_TYPE_DEBUG, "%s (%@) Enqueueing incoming task for execution - %@", buf, 0x20u);
      }
      id v19 = *(NSObject **)(*(void *)(a1 + 32) + 64);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_40;
      block[3] = &unk_1E5CF9B68;
      id v26 = v10;
      dispatch_async(v19, block);
    }
    else
    {
      __int16 v11 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(v12 + 8);
        v14 = (void *)MEMORY[0x1E4F28ED0];
        double v15 = *(double *)(v12 + 48);
        v16 = v11;
        v17 = [v14 numberWithDouble:v15];
        *(_DWORD *)buf = 136315906;
        id v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        __int16 v29 = 2112;
        uint64_t v30 = v13;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 2112;
        __int16 v34 = v10;
        _os_log_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_INFO, "%s (%@) Delaying %@s before executing incoming task within coalescing window - (%@)", buf, 0x2Au);
      }
      [(CKVCoalescedTask *)v10 executeAfterDelay:*(void *)(*(void *)(a1 + 32) + 64) onQueue:*(double *)(*(void *)(a1 + 32) + 48)];
    }
  }
  else
  {
    id v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      id v21 = *(CKVCoalescedTask **)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
      v23 = *(CKVCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      id v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      v32 = v21;
      __int16 v33 = 2112;
      __int16 v34 = v23;
      __int16 v35 = 2112;
      __int16 v36 = v8;
      _os_log_impl(&dword_1A77B3000, v20, OS_LOG_TYPE_INFO, "%s (%@) Dropping incoming task (taskId: %@ eventId: %@) as a task with the same taskId is already enqueued and has not been executed: (%@)", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistryQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistry, 0);
  objc_storeStrong((id *)&self->_managerName, 0);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)_endTransaction
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_transactionCounter - 1;
  v2->_unsigned int transactionCounter = v3;
  if (!v3)
  {
    uint64_t v4 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      transaction = v2->_transaction;
      int v8 = 136315650;
      double v9 = "-[CKVTaskCoalescer _endTransaction]";
      __int16 v10 = 2112;
      double v11 = managerName;
      __int16 v12 = 2112;
      uint64_t v13 = transaction;
      _os_log_debug_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_DEBUG, "%s (%@) Releasing OS transaction: %@", (uint8_t *)&v8, 0x20u);
    }
    uint64_t v5 = v2->_transaction;
    v2->_transaction = 0;
  }
  objc_sync_exit(v2);
}

uint64_t __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke(uint64_t a1)
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

- (CKVTaskCoalescer)initWithManagerName:(id)a3 coalescenceInterval:(double)a4 coalescenceDelay:(double)a5 dispatchQoS:(unsigned int)a6 settings:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  v40.receiver = self;
  v40.super_class = (Class)CKVTaskCoalescer;
  uint64_t v14 = [(CKVTaskCoalescer *)&v40 init];
  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v15 = [v12 copy];
  managerName = v14->_managerName;
  v14->_managerName = (NSString *)v15;

  if (![(NSString *)v14->_managerName length])
  {
    __int16 v29 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      id v28 = 0;
      goto LABEL_18;
    }
    uint64_t v30 = v14->_managerName;
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    __int16 v43 = 2112;
    v44 = v30;
    __int16 v31 = "%s Manager name must be nonempty. Received: %@";
LABEL_10:
    _os_log_error_impl(&dword_1A77B3000, v29, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
    goto LABEL_17;
  }
  atomic_store(0, &v14->_eventIdCounter);
  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  taskRegistry = v14->_taskRegistry;
  v14->_taskRegistry = v17;

  transaction = v14->_transaction;
  v14->_transaction = 0;

  v14->_unsigned int transactionCounter = 0;
  v14->_coalescenceInterval = a4;
  if (a4 <= 0.0)
  {
    v32 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    __int16 v33 = (void *)MEMORY[0x1E4F28ED0];
    __int16 v34 = v32;
    __int16 v35 = [v33 numberWithDouble:a4];
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    __int16 v43 = 2112;
    v44 = v35;
    __int16 v36 = "%s Coalescence interval must be greater than 0. Received: %@";
LABEL_15:
    _os_log_error_impl(&dword_1A77B3000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

    goto LABEL_17;
  }
  v14->_coalescenceDelay = a5;
  if (a5 <= 0.0)
  {
    uint64_t v37 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    __int16 v38 = (void *)MEMORY[0x1E4F28ED0];
    __int16 v34 = v37;
    __int16 v35 = [v38 numberWithDouble:a5];
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    __int16 v43 = 2112;
    v44 = v35;
    __int16 v36 = "%s Coalescence delay must be greater than 0. Received: %@";
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v14->_settings, a7);
  if (!v14->_settings)
  {
    __int16 v29 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    __int16 v43 = 2112;
    v44 = 0;
    __int16 v31 = "%s invalid settings: %@";
    goto LABEL_10;
  }
  id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v21 = dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)a6, 0);
  dispatch_queue_t v22 = dispatch_queue_create("taskRegistryQueue", v21);
  taskRegistryQueue = v14->_taskRegistryQueue;
  v14->_taskRegistryQueue = (OS_dispatch_queue *)v22;

  uint64_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v25 = dispatch_queue_attr_make_with_qos_class(v24, (dispatch_qos_class_t)a6, 0);
  dispatch_queue_t v26 = dispatch_queue_create("taskExecutionQueue", v25);
  taskExecutionQueue = v14->_taskExecutionQueue;
  v14->_taskExecutionQueue = (OS_dispatch_queue *)v26;

LABEL_7:
  id v28 = v14;
LABEL_18:

  return v28;
}

- (CKVTaskCoalescer)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

@end
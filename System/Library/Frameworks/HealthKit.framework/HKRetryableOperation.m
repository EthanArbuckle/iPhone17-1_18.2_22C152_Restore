@interface HKRetryableOperation
- (HKRetryableOperation)initWithQueue:(id)a3 retryCount:(int)a4;
- (NSMutableArray)pendingOperations;
- (void)_queue_performPendingOperation:(id)a3;
- (void)_queue_performRetryableOperation:(id)a3 completion:(id)a4;
@end

@implementation HKRetryableOperation

- (HKRetryableOperation)initWithQueue:(id)a3 retryCount:(int)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKRetryableOperation;
  v8 = [(HKRetryableOperation *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_retryCount = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingOperations = v9->_pendingOperations;
    v9->_pendingOperations = v10;
  }
  return v9;
}

- (void)_queue_performRetryableOperation:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v10 = +[HKPendingOperationRecord pendingOperation:v8 completion:v7];

  uint64_t v9 = [(NSMutableArray *)self->_pendingOperations count];
  [(NSMutableArray *)self->_pendingOperations addObject:v10];
  if (!v9) {
    [(HKRetryableOperation *)self _queue_performPendingOperation:v10];
  }
}

- (void)_queue_performPendingOperation:(id)a3
{
  id v4 = a3;
  v5 = [v4 operationHandler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke;
  v8[3] = &unk_1E58BF268;
  id v9 = v4;
  id v10 = self;
  v6 = (void (*)(void *, void *))v5[2];
  id v7 = v4;
  v6(v5, v8);
}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) errorCount];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(NSObject **)(v9 + 8);
  if (v8 >= *(void *)(v9 + 16)) {
    a3 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2;
  v12[3] = &unk_1E58BF240;
  char v15 = a2;
  v12[4] = v9;
  id v13 = *(id *)(a1 + 32);
  id v14 = v7;
  char v16 = a3;
  id v11 = v7;
  dispatch_async(v10, v12);
}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    _HKInitializeLogging();
    v2 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v3;
      _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Retryable operation finished successfully.", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_27;
    block[3] = &unk_1E58BF218;
    id v20 = *(id *)(a1 + 40);
    char v22 = *(unsigned char *)(a1 + 56);
    id v21 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

    v5 = v20;
LABEL_5:

    goto LABEL_10;
  }
  int v6 = *(unsigned __int8 *)(a1 + 57);
  _HKInitializeLogging();
  id v7 = HKLogDataCollection;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(v9 + 16);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Retryable operation reached maximum retry count of %lu.", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_29;
    char v15 = &unk_1E58BF218;
    id v16 = *(id *)(a1 + 40);
    char v18 = *(unsigned char *)(a1 + 56);
    id v17 = *(id *)(a1 + 48);
    dispatch_async(v11, &v12);

    v5 = v16;
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
    __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2_cold_1(a1, v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "setErrorCount:", objc_msgSend(*(id *)(a1 + 40), "errorCount") + 1);
LABEL_10:
  uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "firstObject", v12, v13, v14, v15);
  if (v8) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_performPendingOperation:", v8);
  }
}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_27(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_29(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (NSMutableArray)pendingOperations
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  uint64_t v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HKRetryableOperation_pendingOperations__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableArray *)v3;
}

void __41__HKRetryableOperation_pendingOperations__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingOperations, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Retryable operation failed but will be retried: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
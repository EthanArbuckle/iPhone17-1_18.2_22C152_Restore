@interface ASAsyncTransactionQueue
- (ASAsyncTransactionQueue)initWithDescription:(id)a3 targetSerialQueue:(id)a4;
- (void)performTransaction:(id)a3;
@end

@implementation ASAsyncTransactionQueue

- (ASAsyncTransactionQueue)initWithDescription:(id)a3 targetSerialQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAsyncTransactionQueue;
  v9 = [(ASAsyncTransactionQueue *)&v13 init];
  if (v9)
  {
    uint64_t v10 = HDCreateSerialUtilityDispatchQueue();
    lockingQueue = v9->_lockingQueue;
    v9->_lockingQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_targetQueue, a4);
    objc_storeStrong((id *)&v9->_description, a3);
  }

  return v9;
}

- (void)performTransaction:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08C38] UUID];
  v6 = [v5 UUIDString];

  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 138543618;
    v16 = description;
    __int16 v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transaction created with identifier: %{public}@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__ASAsyncTransactionQueue_performTransaction___block_invoke;
  v12[3] = &unk_265215FD0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v4;
  id v9 = v4;
  id v10 = v6;
  v11 = (void *)MEMORY[0x24C557E50](v12);
  dispatch_async((dispatch_queue_t)self->_lockingQueue, v11);
}

void __46__ASAsyncTransactionQueue_performTransaction___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (os_log_t *)MEMORY[0x263F23AC0];
  v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v5;
    __int16 v23 = 2114;
    uint64_t v24 = v4;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transaction starting, identifier: %{public}@", buf, 0x16u);
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [MEMORY[0x263F431B0] transactionWithOwner:*(void *)(a1 + 32) activityName:*(void *)(*(void *)(a1 + 32) + 24)];
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  __int16 v17 = __46__ASAsyncTransactionQueue_performTransaction___block_invoke_281;
  v18 = &unk_265216368;
  id v20 = *(id *)(a1 + 48);
  id v9 = v6;
  uint64_t v19 = v9;
  dispatch_async(v8, &v15);
  dispatch_time_t v10 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    ASLoggingInitialize();
    v11 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __46__ASAsyncTransactionQueue_performTransaction___block_invoke_cold_1(a1 + 32, a1, v11);
    }
  }
  objc_msgSend(v7, "invalidate", v15, v16, v17, v18);
  ASLoggingInitialize();
  v12 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v14;
    __int16 v23 = 2114;
    uint64_t v24 = v13;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transaction finished, identifier: %{public}@", buf, 0x16u);
  }
}

void __46__ASAsyncTransactionQueue_performTransaction___block_invoke_281(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__ASAsyncTransactionQueue_performTransaction___block_invoke_2;
  v2[3] = &unk_2652157F0;
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

intptr_t __46__ASAsyncTransactionQueue_performTransaction___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_lockingQueue, 0);
}

void __46__ASAsyncTransactionQueue_performTransaction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Transaction lock operation timed out! identifier: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end
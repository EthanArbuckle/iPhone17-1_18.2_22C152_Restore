@interface HDExtendedDatabaseTransaction
- (BOOL)commitWithErrorOut:(id *)a3;
- (BOOL)performInTransactionWithErrorOut:(id *)a3 block:(id)a4;
- (BOOL)rollbackDueToError:(id)a3 errorOut:(id *)a4;
- (HDDatabase)database;
- (HDExtendedDatabaseTransaction)initWithDatabase:(id)a3 context:(id)a4 transactionTimeout:(double)a5 continuationTimeout:(double)a6 error:(id *)a7;
- (NSUUID)transactionIdentifier;
- (double)continuationTimeout;
- (double)transactionTimeout;
- (void)_enableAutomaticRollbackTimer;
- (void)dealloc;
@end

@implementation HDExtendedDatabaseTransaction

- (HDExtendedDatabaseTransaction)initWithDatabase:(id)a3 context:(id)a4 transactionTimeout:(double)a5 continuationTimeout:(double)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  if (!v13)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"HDExtendedDatabaseTransaction.m", 52, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
  }
  if (a5 <= 0.0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"HDExtendedDatabaseTransaction.m", 53, @"Invalid parameter not satisfying: %@", @"transactionTimeout > 0" object file lineNumber description];
  }
  if (a6 <= 0.0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HDExtendedDatabaseTransaction.m", 54, @"Invalid parameter not satisfying: %@", @"continuationTimeout > 0" object file lineNumber description];
  }
  v49.receiver = self;
  v49.super_class = (Class)HDExtendedDatabaseTransaction;
  v15 = [(HDExtendedDatabaseTransaction *)&v49 init];
  if (v15)
  {
    uint64_t v16 = (uint64_t)v15;
    objc_storeWeak((id *)&v15->_database, v13);
    *(double *)(v16 + 96) = a5;
    *(double *)(v16 + 104) = a6;
    uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
    v18 = *(void **)(v16 + 16);
    *(void *)(v16 + 16) = v17;

    uint64_t v19 = HKCreateSerialDispatchQueue();
    v20 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v19;

    uint64_t v21 = HKCreateSerialDispatchQueue();
    v22 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v21;

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    v24 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v23;

    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    v26 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v25;

    v27 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v28 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v27);
    v29 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = v28;

    objc_initWeak(&location, (id)v16);
    v30 = *(NSObject **)(v16 + 64);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke;
    handler[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v47, &location);
    dispatch_source_set_event_handler(v30, handler);
    -[HDExtendedDatabaseTransaction _enableAutomaticRollbackTimer](v16);
    dispatch_resume(*(dispatch_object_t *)(v16 + 64));
    *(void *)(v16 + 80) = 0;
    v31 = *(NSObject **)(v16 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_304;
    block[3] = &unk_1E62F31C0;
    v32 = (HDExtendedDatabaseTransaction *)(id)v16;
    v44 = v32;
    id v45 = v14;
    dispatch_async(v31, block);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v16 + 48), 0xFFFFFFFFFFFFFFFFLL);
    lastError = v32->_lastError;
    if (lastError)
    {
      v34 = lastError;
      v35 = v34;
      if (a7) {
        *a7 = v34;
      }
      else {
        _HKLogDroppedError();
      }

      v32 = 0;
    }
    else
    {
      dispatch_time_t v36 = dispatch_time(0, (uint64_t)(*(double *)(v16 + 96) * 1000000000.0));
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_2;
      v41[3] = &unk_1E62F6BD0;
      objc_copyWeak(&v42, &location);
      dispatch_after(v36, v27, v41);

      objc_destroyWeak(&v42);
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1C187C0E0]();
  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Rollback due to automatic rollback timer timeout");
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = 0;
  char v6 = [WeakRetained rollbackDueToError:v3 errorOut:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      id v10 = objc_loadWeakRetained(v4);
      *(_DWORD *)buf = 138412290;
      id v13 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "'%@', rollback due to automatic rollback timer timeout", buf, 0xCu);
    }
  }
}

- (void)_enableAutomaticRollbackTimer
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 64);
    if (v2)
    {
      if (*(void *)(a1 + 80) <= 1uLL)
      {
        dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 104) * 1000000000.0));
        uint64_t v4 = (uint64_t)(*(double *)(a1 + 104) * 1000000000.0);
        dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, v4);
      }
    }
  }
}

void __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_304(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    if (!WeakRetained)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__transaction_runTransactionWithContext_, v1, @"HDExtendedDatabaseTransaction.m", 189, @"Invalid parameter not satisfying: %@", @"healthDatabase" object file lineNumber description];
    }
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    char v12 = 0;
    v9[6] = sel__transaction_runTransactionWithContext_;
    id v10 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__HDExtendedDatabaseTransaction__transaction_runTransactionWithContext___block_invoke;
    v9[3] = &unk_1E62F6778;
    v9[4] = v1;
    v9[5] = v11;
    char v4 = [WeakRetained performTransactionWithContext:v2 error:&v10 block:v9 inaccessibilityHandler:0];
    id v5 = v10;
    id v6 = v10;
    if (!*(void *)(v1 + 88) && v6) {
      objc_storeStrong((id *)(v1 + 88), v5);
    }
    *(unsigned char *)(v1 + 8) = v4;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
    id v7 = objc_loadWeakRetained((id *)(v1 + 24));
    [v7 finalizeExtendedTransactionForIdentifier:*(void *)(v1 + 16)];

    _Block_object_dispose(v11, 8);
  }
}

void __103__HDExtendedDatabaseTransaction_initWithDatabase_context_transactionTimeout_continuationTimeout_error___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1C187C0E0]();
  dispatch_time_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Rollback due to transaction timeout");
  char v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = 0;
  char v6 = [WeakRetained rollbackDueToError:v3 errorOut:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      id v10 = objc_loadWeakRetained(v4);
      *(_DWORD *)buf = 138412290;
      id v13 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "'%@', rollback due to transaction timeout", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  automaticRollbackTimer = self->_automaticRollbackTimer;
  if (automaticRollbackTimer)
  {
    dispatch_source_cancel(automaticRollbackTimer);
    char v4 = self->_automaticRollbackTimer;
    self->_automaticRollbackTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HDExtendedDatabaseTransaction;
  [(HDExtendedDatabaseTransaction *)&v5 dealloc];
}

- (BOOL)performInTransactionWithErrorOut:(id *)a3 block:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__79;
  dispatch_semaphore_t v25 = __Block_byref_object_dispose__79;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dataQueue = self->_dataQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HDExtendedDatabaseTransaction_performInTransactionWithErrorOut_block___block_invoke;
  v13[3] = &unk_1E62FE7F0;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  v15 = &v17;
  uint64_t v16 = &v21;
  dispatch_sync(dataQueue, v13);
  if (*((unsigned char *)v18 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = (id)v22[5];
    id v11 = v10;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v9 = *((unsigned char *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __72__HDExtendedDatabaseTransaction_performInTransactionWithErrorOut_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80) == 1)
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 64));
    dispatch_time_t v3 = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 56));
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 48), 0xFFFFFFFFFFFFFFFFLL);
    -[HDExtendedDatabaseTransaction _enableAutomaticRollbackTimer](*(void *)(a1 + 32));
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Extended transaction is no longer in progress.");
    uint64_t v9 = *(void *)(a1 + 32);
    id v7 = *(void **)(v9 + 88);
    *(void *)(v9 + 88) = v8;
  }

  id v10 = *(void **)(*(void *)(a1 + 32) + 88);
  id v11 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

  objc_storeStrong(v11, v10);
}

- (BOOL)commitWithErrorOut:(id *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HDExtendedDatabaseTransaction_commitWithErrorOut___block_invoke;
  v4[3] = &unk_1E62F6130;
  v4[4] = self;
  return [(HDExtendedDatabaseTransaction *)self performInTransactionWithErrorOut:a3 block:v4];
}

uint64_t __52__HDExtendedDatabaseTransaction_commitWithErrorOut___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 2;
  return 1;
}

- (BOOL)rollbackDueToError:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HDExtendedDatabaseTransaction_rollbackDueToError_errorOut___block_invoke;
  v9[3] = &unk_1E62F2AE0;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  [(HDExtendedDatabaseTransaction *)self performInTransactionWithErrorOut:a4 block:v9];
  LOBYTE(a4) = self->_status == 3;

  return (char)a4;
}

uint64_t __61__HDExtendedDatabaseTransaction_rollbackDueToError_errorOut___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 3;
  return 1;
}

uint64_t __72__HDExtendedDatabaseTransaction__transaction_runTransactionWithContext___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  *(void *)(a1[4] + 80) = 1;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 48));
  id v6 = (os_log_t *)MEMORY[0x1E4F29F18];
  while (2)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = *(NSObject **)(v7 + 56);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(*(double *)(v7 + 104) * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v9))
    {
      *(void *)(a1[4] + 80) = 3;
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 103, @"Rollback due to HDExtendedDatabaseTransaction continuation timeout");
      id v11 = *(void **)(a1[4] + 88);
      *(void *)(a1[4] + 88) = v10;

      *a3 = *(id *)(a1[4] + 88);
      _HKInitializeLogging();
      char v12 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = a1[4];
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "'%@', rollback due to HDExtendedDatabaseTransaction continuation timeout", buf, 0xCu);
      }
    }
    uint64_t v13 = a1[4];
    if (*(void *)(v13 + 80) == 1)
    {
      uint64_t v14 = *(void *)(v13 + 72);
      if (v14)
      {
        id v25 = 0;
        char v15 = (*(uint64_t (**)(uint64_t, id, id *))(v14 + 16))(v14, v5, &v25);
        id v16 = v25;
        id v17 = v25;
        *(unsigned char *)(a1[4] + 8) = v15;
        uint64_t v18 = a1[4];
        if (!*(unsigned char *)(v18 + 8)) {
          objc_storeStrong((id *)(v18 + 88), v16);
        }

        uint64_t v13 = a1[4];
        if (!*(unsigned char *)(v13 + 8))
        {
          *(void *)(v13 + 80) = 3;
          uint64_t v13 = a1[4];
        }
      }
    }
    switch(*(void *)(v13 + 80))
    {
      case 0:
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a1[6] object:a1[4] file:@"HDExtendedDatabaseTransaction.m" lineNumber:234 description:@"Invalid transaction status."];

        continue;
      case 1:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v13 + 48));
        continue;
      case 2:
        uint64_t v23 = 1;
        break;
      case 3:
        _HKInitializeLogging();
        uint64_t v21 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a1[4] + 88);
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v22;
          _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_INFO, "Transaction was rolled back, last error: %@", buf, 0xCu);
        }
        uint64_t v23 = 0;
        break;
      default:
        continue;
    }
    break;
  }

  return v23;
}

- (NSUUID)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (HDDatabase)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);

  return (HDDatabase *)WeakRetained;
}

- (double)transactionTimeout
{
  return self->_transactionTimeout;
}

- (double)continuationTimeout
{
  return self->_continuationTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong(&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_automaticRollbackTimer, 0);
  objc_storeStrong((id *)&self->_pendingWorkSemaphore, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_destroyWeak((id *)&self->_database);

  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
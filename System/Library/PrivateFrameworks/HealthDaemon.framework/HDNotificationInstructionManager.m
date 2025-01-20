@interface HDNotificationInstructionManager
- (BOOL)enumerateValidNotificationInstructionsForClientIdentifier:(id)a3 action:(int64_t)a4 error:(id *)a5 enumerationBlock:(id)a6;
- (BOOL)invalidateNotificationInstructionsWithMessageIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)obliterateNotificationInstructionsWithError:(id *)a3;
- (HDNotificationInstructionManager)initWithProfile:(id)a3;
- (HDNotificationInstructionManager)initWithProfile:(id)a3 unitTest_nowDate:(id)a4 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a5;
- (NSDate)unitTest_nowDate;
- (id)diagnosticDescription;
- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded;
- (void)_lock_unregisterObserver:(void *)a3 clientIdentifier:;
- (void)_queue_enqueueMaintenanceInvalidationIfNeeded;
- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(void *)a1;
- (void)currentDate;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)insertNotificationInstruction:(id)a3 completion:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)registerObserver:(id)a3 forClientIdentifier:(id)a4 queue:(id)a5;
- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3;
- (void)setUnitTest_nowDate:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)unregisterObserver:(id)a3 forClientIdentifier:(id)a4;
@end

@implementation HDNotificationInstructionManager

- (HDNotificationInstructionManager)initWithProfile:(id)a3
{
  return [(HDNotificationInstructionManager *)self initWithProfile:a3 unitTest_nowDate:0 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:0];
}

- (HDNotificationInstructionManager)initWithProfile:(id)a3 unitTest_nowDate:(id)a4 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDNotificationInstructionManager;
  v11 = [(HDNotificationInstructionManager *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    uint64_t v13 = HKCreateSerialDispatchQueue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_lock._os_unfair_lock_opaque = 0;
    if (v9) {
      objc_storeStrong((id *)&v12->_unitTest_nowDate, a4);
    }
    if (v10) {
      [(HDNotificationInstructionManager *)v12 setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:v10];
    }
    v12->_queue_hasEnqueuedMaintenanceWork = 0;
    v15 = [v8 daemon];
    v16 = [v15 behavior];
    v12->_queue_hasInstructionsToInvalidate = [v16 invalidatesNotificationInstructionsOnLaunch];

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_observersByClientIdentifier = v12->_lock_observersByClientIdentifier;
    v12->_lock_observersByClientIdentifier = v17;

    [v8 registerProfileReadyObserver:v12 queue:v12->_queue];
    v19 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v19 addObject:v12];
  }
  return v12;
}

- (id)diagnosticDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F17EA5D8];
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __57__HDNotificationInstructionManager_diagnosticDescription__block_invoke;
  v11 = &unk_1E62F31C0;
  id v12 = v3;
  uint64_t v13 = self;
  id v5 = v3;
  dispatch_async_and_wait(queue, &v8);
  v6 = objc_msgSend(v5, "componentsJoinedByString:", @"\n", v8, v9, v10, v11);

  return v6;
}

void __57__HDNotificationInstructionManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"\t- hasEnqueuedMaintenanceWork: %d", *(unsigned __int8 *)(*(void *)(a1 + 40) + 25));
  [v2 addObject:v3];

  v4 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"\t- hasInstructionsToInvalidate: %d", *(unsigned __int8 *)(*(void *)(a1 + 40) + 24));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];
}

- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "unitTest_didEvaluateIfMaintenanceWorkIsNeeded");
  id v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      int v9 = 138543874;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2048;
      id v12 = a1;
      __int16 v13 = 1024;
      int v14 = a2;
      id v8 = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Did evaluate for maintenance work: %d", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)currentDate
{
  if (a1)
  {
    v2 = (void *)a1[6];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)profileDidBecomeReady:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = [v5 database];
  [v6 addProtectedDataObserver:self queue:self->_queue];

  v7 = [v5 database];

  LODWORD(v5) = [v7 isProtectedDataAvailable];
  if (v5)
  {
    -[HDNotificationInstructionManager _queue_enqueueMaintenanceInvalidationIfNeeded]((uint64_t)self);
  }
}

- (void)_queue_enqueueMaintenanceInvalidationIfNeeded
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(unsigned char *)(a1 + 24) && !*(unsigned char *)(a1 + 25))
    {
      v2 = [(id)a1 maintenanceOperationName];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v4 = [WeakRetained database];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke;
      v9[3] = &unk_1E6305B88;
      v9[4] = a1;
      id v5 = +[HDMaintenanceOperation maintenanceOperationWithName:v2 database:v4 asynchronousBlock:v9];

      id v6 = objc_loadWeakRetained((id *)(a1 + 8));
      v7 = [v6 daemon];
      id v8 = [v7 maintenanceWorkCoordinator];
      [v8 enqueueMaintenanceOperation:v5];

      *(unsigned char *)(a1 + 25) = 1;
      -[HDNotificationInstructionManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:]((void *)a1, 1);
    }
    else
    {
      -[HDNotificationInstructionManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:]((void *)a1, 0);
    }
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    -[HDNotificationInstructionManager _queue_enqueueMaintenanceInvalidationIfNeeded]((uint64_t)self);
  }
}

void __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke_2;
  v9[3] = &unk_1E62F4928;
  v9[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async_and_wait(v7, v9);
}

uint64_t __81__HDNotificationInstructionManager__queue_enqueueMaintenanceInvalidationIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    id v25 = 0;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    id v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__139;
    v34 = __Block_byref_object_dispose__139;
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    BOOL v4 = [WeakRetained database];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke;
    v37 = &unk_1E6305BD8;
    id v38 = (id)v2;
    v39 = &v26;
    v40 = &v30;
    uint64_t v41 = 50;
    BOOL v5 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v4 error:&v25 block:buf];

    if (v5)
    {
      uint64_t v6 = v27;
      if (*((unsigned char *)v27 + 24))
      {
        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = [v31[5] count] == 50;
        uint64_t v6 = v27;
      }
      *((unsigned char *)v6 + 24) = v7;
      id v8 = (void *)[v31[5] copy];
    }
    else
    {
      id v8 = 0;
      BOOL v7 = 1;
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    id v9 = v25;
    if (v8)
    {
      if (![v8 count]) {
        goto LABEL_11;
      }

      id v10 = (void *)[v8 copy];
      id v30 = 0;
      id v11 = v10;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
      id v12 = objc_loadWeakRetained((id *)(v2 + 8));
      __int16 v13 = [v12 database];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __72__HDNotificationInstructionManager__queue_invalidateInstructions_error___block_invoke;
      v37 = &unk_1E62F2AE0;
      id v14 = v11;
      id v38 = v14;
      v39 = (uint64_t *)v2;
      LOBYTE(v11) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:&v30 block:buf];

      id v9 = v30;
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        v19 = (void *)*MEMORY[0x1E4F29F80];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
        {
          v22 = v19;
          v23 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          id v24 = v23;
          _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Error invalidating instructions: %{public}@", buf, 0x16u);
        }
      }
      else
      {
LABEL_11:
        *(unsigned char *)(v2 + 24) = v7;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v15 = (void *)*MEMORY[0x1E4F29F80];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        id v18 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking for invalid instructions: %{public}@", buf, 0x16u);
      }
    }

    *(unsigned char *)(v2 + 25) = 0;
  }
  v20 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v20();
}

BOOL __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = -[HDNotificationInstructionManager currentDate](*(void **)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke_2;
  v11[3] = &unk_1E6305BB0;
  id v12 = v5;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v8 = v5;
  BOOL v9 = +[HDNotificationInstructionEntity enumerateNotificationInstructionsWithSetCriteriaNotExpiredBeforeDate:v6 transaction:v8 limit:v7 error:a3 enumerationHandler:v11];

  return v9;
}

uint64_t __101__HDNotificationInstructionManager__queue_readInvalidInstructionsAndCheckForValidInstructions_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 criteria];
  uint64_t v7 = a1[4];
  id v13 = 0;
  uint64_t v8 = [v6 isValidWithDatabaseTransaction:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    if (v8 == 2)
    {
      [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v5];
    }
    else if (v8 == 1)
    {
      uint64_t v10 = 1;
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      goto LABEL_12;
    }
    uint64_t v10 = 1;
    goto LABEL_12;
  }
  id v11 = v9;
  if (v11)
  {
    if (a3) {
      *a3 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

uint64_t __72__HDNotificationInstructionManager__queue_invalidateInstructions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) messageIdentifier];
        id v11 = -[HDNotificationInstructionManager currentDate](*(void **)(a1 + 40));
        BOOL v12 = +[HDNotificationInstructionEntity invalidateNotificationInstructionWithMessageIdentifier:v10 modificationDate:v11 transaction:v5 error:a3];

        if (!v12)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)enumerateValidNotificationInstructionsForClientIdentifier:(id)a3 action:(int64_t)a4 error:(id *)a5 enumerationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = -[HDNotificationInstructionManager currentDate](self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = [WeakRetained database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke;
  v19[3] = &unk_1E62FEF68;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  int64_t v23 = a4;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  LOBYTE(a5) = +[HDNotificationInstructionEntity attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase:v14 error:a5 block:v19];

  return (char)a5;
}

BOOL __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke_2;
  v12[3] = &unk_1E6305C00;
  id v13 = v5;
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v9 = v5;
  BOOL v10 = +[HDNotificationInstructionEntity enumerateNotificationInstructionsWithClientIdentifier:v8 action:v6 notExpiredBeforeDate:v14 transaction:v9 error:a3 enumerationHandler:v12];

  return v10;
}

uint64_t __124__HDNotificationInstructionManager_enumerateValidNotificationInstructionsForClientIdentifier_action_error_enumerationBlock___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  id v14 = 0;
  uint64_t v8 = [v5 isValidWithDatabaseTransaction:v6 date:v7 error:&v14];
  id v9 = v14;
  BOOL v10 = v9;
  if (v8)
  {
    if (v8 != 1)
    {
      uint64_t v11 = 1;
      goto LABEL_11;
    }
LABEL_5:
    uint64_t v11 = (*(uint64_t (**)(void))(a1[6] + 16))();
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "hk_isDatabaseAccessibilityError")) {
    goto LABEL_5;
  }
  id v12 = v10;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (void)insertNotificationInstruction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HDNotificationInstructionManager_insertNotificationInstruction_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __77__HDNotificationInstructionManager_insertNotificationInstruction_completion___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  id v11 = 0;
  id v4 = v2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    id v6 = [WeakRetained database];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke;
    v12[3] = &unk_1E62F2AE0;
    id v7 = v4;
    id v13 = v7;
    uint64_t v14 = v3;
    BOOL v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:&v11 block:v12];

    if (v8)
    {
      id v9 = [v7 criteria];

      if (v9) {
        *(unsigned char *)(v3 + 24) = 1;
      }
    }
  }
  id v10 = v11;
  (*(void (**)(void))(a1[6] + 16))();
}

BOOL __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke(int8x16_t *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = +[HDNotificationInstructionEntity insertOrIgnoreNotificationInstruction:a1[2].i64[0] transaction:v5 error:a3];
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke_2;
    v10[3] = &unk_1E62F31C0;
    int8x16_t v9 = a1[2];
    id v7 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    [v5 onCommit:v10 orRollback:0];
  }
  return v6;
}

void __87__HDNotificationInstructionManager__queue_insertOrIgnoreNotificationInstruction_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 28));
    uint64_t v3 = *(void **)(v1 + 32);
    id v4 = [v2 clientIdentifier];
    id v5 = [v3 objectForKeyedSubscript:v4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __88__HDNotificationInstructionManager__notifyObserversForDidInsertNotificationInstruction___block_invoke;
    v6[3] = &unk_1E6305C28;
    v6[4] = v1;
    id v7 = v2;
    [v5 notifyObservers:v6];

    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 28));
  }
}

- (BOOL)invalidateNotificationInstructionsWithMessageIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v8 = [WeakRetained database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__HDNotificationInstructionManager_invalidateNotificationInstructionsWithMessageIdentifiers_error___block_invoke;
  v11[3] = &unk_1E62F2AE0;
  id v12 = v6;
  id v13 = self;
  id v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v11];

  return (char)a4;
}

uint64_t __99__HDNotificationInstructionManager_invalidateNotificationInstructionsWithMessageIdentifiers_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        int8x16_t v11 = -[HDNotificationInstructionManager currentDate](*(void **)(a1 + 40));
        LODWORD(v10) = +[HDNotificationInstructionEntity invalidateNotificationInstructionWithMessageIdentifier:v10 modificationDate:v11 transaction:v5 error:a3];

        if (!v10)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)obliterateNotificationInstructionsWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained database];
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v5 error:a3 block:&__block_literal_global_171];

  return (char)a3;
}

BOOL __80__HDNotificationInstructionManager_obliterateNotificationInstructionsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDNotificationInstructionEntity obliterateNotificationInstructionsWithTransaction:a2 error:a3];
}

- (void)registerObserver:(id)a3 forClientIdentifier:(id)a4 queue:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_lock_observersByClientIdentifier objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v12 = HKLogInfrastructure();
    uint64_t v10 = (void *)[v11 initWithName:v8 loggingCategory:v12];

    [(NSMutableDictionary *)self->_lock_observersByClientIdentifier setObject:v10 forKeyedSubscript:v8];
  }
  [v10 registerObserver:v13 queue:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3 forClientIdentifier:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDNotificationInstructionManager _lock_unregisterObserver:clientIdentifier:]((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_unregisterObserver:(void *)a3 clientIdentifier:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 28));
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__HDNotificationInstructionManager__lock_unregisterObserver_clientIdentifier___block_invoke;
    v8[3] = &unk_1E62F31C0;
    v8[4] = a1;
    id v9 = v5;
    [v7 unregisterObserver:v6 runIfLastObserver:v8];
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(NSMutableDictionary *)self->_lock_observersByClientIdentifier allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDNotificationInstructionManager _lock_unregisterObserver:clientIdentifier:]((uint64_t)self, v4, *(void **)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __88__HDNotificationInstructionManager__notifyObserversForDidInsertNotificationInstruction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notificationInstructionManager:*(void *)(a1 + 32) didInsertNotificationInstruction:*(void *)(a1 + 40)];
}

uint64_t __78__HDNotificationInstructionManager__lock_unregisterObserver_clientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3
{
}

- (NSDate)unitTest_nowDate
{
  return self->_unitTest_nowDate;
}

- (void)setUnitTest_nowDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_nowDate, 0);
  objc_storeStrong(&self->unitTest_didEvaluateIfMaintenanceWorkIsNeeded, 0);
  objc_storeStrong((id *)&self->_lock_observersByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end
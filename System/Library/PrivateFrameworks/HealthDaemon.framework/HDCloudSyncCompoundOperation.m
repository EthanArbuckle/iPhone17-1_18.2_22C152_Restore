@interface HDCloudSyncCompoundOperation
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
- (BOOL)continueOnSubOperationError;
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)hasEncounteredSubOperationError;
- (HDCloudSyncCompoundOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncCompoundOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 name:(id)a5 continueOnSubOperationError:(BOOL)a6;
- (NSArray)operations;
- (NSString)name;
- (id)_compoundError;
- (id)description;
- (id)preparationHandler;
- (id)unitTest_currentOperation;
- (void)_clearOperationAndRunRemaining:(uint64_t)a1;
- (void)_invalidate;
- (void)_recordError:(uint64_t)a1;
- (void)_runRemainingOperations;
- (void)addOperation:(id)a3 transitionHandler:(id)a4;
- (void)addOperationOfClass:(Class)a3 transitionHandler:(id)a4;
- (void)main;
- (void)setPreparationHandler:(id)a3;
- (void)skip;
- (void)start;
@end

@implementation HDCloudSyncCompoundOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncCompoundOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncCompoundOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 name:(id)a5 continueOnSubOperationError:(BOOL)a6
{
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncCompoundOperation;
  v11 = [(HDCloudSyncOperation *)&v17 initWithConfiguration:a3 cloudState:a4];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    operations = v11->_operations;
    v11->_operations = v14;

    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_continueOnSubOperationError = a6;
  }

  return v11;
}

- (void)start
{
  uint64_t v3 = [(HDCloudSyncCompoundOperation *)self preparationHandler];
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, HDCloudSyncCompoundOperation *))(v3 + 16))(v3, self);
  }
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncCompoundOperation;
  [(HDCloudSyncOperation *)&v5 start];
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncCompoundOperation;
  BOOL v5 = [(HDCloudSyncOperation *)&v7 finishWithSuccess:a3 error:a4];
  -[HDCloudSyncCompoundOperation _invalidate]((uint64_t)self);
  return v5;
}

- (void)_invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1 + 104);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_super v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (!objc_msgSend(v7, "status", (void)v10)) {
            [v7 skip];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }

    [*(id *)(a1 + 104) removeAllObjects];
    v8 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    v9 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_operations count])
  {
    uint64_t v3 = 100 * [(NSMutableArray *)self->_operations count];
    uint64_t v4 = [(HDCloudSyncOperation *)self progress];
    [v4 setTotalUnitCount:v3];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = self->_operations;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v11 = [(HDCloudSyncOperation *)self progress];
          long long v12 = [v10 progress];
          [v11 addChild:v12 withPendingUnitCount:100];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __36__HDCloudSyncCompoundOperation_main__block_invoke;
    v20[3] = &unk_1E62F2950;
    v20[4] = self;
    long long v13 = [(NSMutableArray *)self->_operations lastObject];
    [v13 setOnError:v20];

    v14 = [(NSMutableArray *)self->_operations lastObject];
    [v14 setOnSuccess:&v19];

    uint64_t v15 = [(HDCloudSyncOperation *)self cloudState];
    v16 = [(NSMutableArray *)self->_operations firstObject];
    [v16 setCloudState:v15];

    objc_super v17 = (NSArray *)[(NSMutableArray *)self->_operations copy];
    remainingOperations = self->_remainingOperations;
    self->_remainingOperations = v17;

    -[HDCloudSyncCompoundOperation _runRemainingOperations]((uint64_t)self);
  }
  else
  {
    [(HDCloudSyncCompoundOperation *)self finishWithSuccess:1 error:0];
  }
}

void __36__HDCloudSyncCompoundOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  -[HDCloudSyncCompoundOperation _recordError:](*(void *)(a1 + 32), v6);
  uint64_t v4 = *(unsigned char **)(a1 + 32);
  if (v4[152])
  {
    uint64_t v5 = -[HDCloudSyncCompoundOperation _compoundError]((uint64_t)v4);
    [v4 finishWithSuccess:0 error:v5];
  }
  else
  {
    [v4 finishWithSuccess:0 error:v6];
  }
}

- (void)_recordError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    uint64_t v4 = *(void **)(a1 + 144);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      uint64_t v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v3 = v7;
  }
}

- (id)_compoundError
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    uint64_t v2 = [*(id *)(a1 + 144) count];
    id v3 = *(void **)(a1 + 144);
    if (v2 == 1)
    {
      uint64_t v4 = [v3 firstObject];
    }
    else if ((unint64_t)[v3 count] < 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      id v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = *MEMORY[0x1E4F29B70];
      long long v10 = @"HDCloudSyncCompoundOperationUnderlyingErrorsKey";
      id v7 = (void *)[*(id *)(a1 + 144) copy];
      v11[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      uint64_t v4 = [v5 errorWithDomain:v6 code:711 userInfo:v8];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __36__HDCloudSyncCompoundOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 cloudState];
  [*(id *)(a1 + 32) setCloudState:v3];

  uint64_t v4 = -[HDCloudSyncCompoundOperation _compoundError](*(void *)(a1 + 32));
  id v7 = (id)v4;
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v5 = 1;
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 32) finishWithSuccess:v5 error:v6];
}

- (void)_runRemainingOperations
{
  if (a1 && (atomic_exchange((atomic_uchar *volatile)(a1 + 136), 1u) & 1) == 0)
  {
    if ([(id)a1 status] == 1)
    {
      uint64_t v2 = 0;
      while (1)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
        if (*(void *)(a1 + 120) || ![*(id *)(a1 + 128) count])
        {
          id v3 = 0;
        }
        else
        {
          id v3 = [*(id *)(a1 + 128) firstObject];
          objc_storeStrong((id *)(a1 + 120), v3);
          uint64_t v4 = objc_msgSend(*(id *)(a1 + 128), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 128), "count") - 1);
          uint64_t v5 = *(void **)(a1 + 128);
          *(void *)(a1 + 128) = v4;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));

        if (!v3) {
          break;
        }
        [v3 start];
        uint64_t v2 = v3;
        if ([(id)a1 status] != 1) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      id v3 = 0;
LABEL_13:
    }
    atomic_store(0, (unsigned __int8 *)(a1 + 136));
  }
}

- (void)skip
{
  v3.receiver = self;
  v3.super_class = (Class)HDCloudSyncCompoundOperation;
  [(HDCloudSyncOperation *)&v3 skip];
  -[HDCloudSyncCompoundOperation _invalidate]((uint64_t)self);
}

- (BOOL)hasEncounteredSubOperationError
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_operationErrors count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)operations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_operations copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)addOperationOfClass:(Class)a3 transitionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 alloc];
  uint64_t v8 = [(HDCloudSyncOperation *)self configuration];
  v9 = [(HDCloudSyncOperation *)self cloudState];
  id v10 = (id)[v7 initWithConfiguration:v8 cloudState:v9];

  [(HDCloudSyncCompoundOperation *)self addOperation:v10 transitionHandler:v6];
}

- (void)_clearOperationAndRunRemaining:(uint64_t)a1
{
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if (*(id *)(a1 + 120) == v4)
  {
    *(void *)(a1 + 120) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:sel__clearOperationAndRunRemaining_, a1, @"HDCloudSyncCompoundOperation.m", 195, @"Invalid parameter not satisfying: %@", @"isCurrentOperation" object file lineNumber description];
  }
  -[HDCloudSyncCompoundOperation _runRemainingOperations](a1);
}

- (void)addOperation:(id)a3 transitionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(HDCloudSyncOperation *)self status])
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDCloudSyncCompoundOperation.m", 234, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMutableArray *)self->_operations lastObject];
  id v10 = (void *)v9;
  if (!v8 || v9)
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke;
    v20[3] = &unk_1E63076D0;
    objc_copyWeak(&v23, &location);
    id v12 = v7;
    id v21 = v12;
    id v13 = v8;
    id v22 = v13;
    [v10 setOnError:v20];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke_2;
    v16[3] = &unk_1E63076F8;
    objc_copyWeak(&v19, &location);
    id v14 = v12;
    id v17 = v14;
    id v18 = v13;
    [v10 setOnSuccess:v16];
    [(NSMutableArray *)self->_operations addObject:v14];
    os_unfair_lock_unlock(&self->_lock);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDCloudSyncCompoundOperation.m", 240, @"Invalid parameter not satisfying: %@", @"preceedingOperation != nil" object file lineNumber description];
  }
}

void __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  if (WeakRetained)
  {
    id v14 = [WeakRetained cloudState];
    [v12 setCloudState:v14];

    if (v13 && WeakRetained[152]) {
      v13[2](v13, v10, v12);
    }
    -[HDCloudSyncCompoundOperation _recordError:]((uint64_t)WeakRetained, v11);
    if (WeakRetained[152]) {
      -[HDCloudSyncCompoundOperation _clearOperationAndRunRemaining:]((uint64_t)WeakRetained, v10);
    }
    else {
      [WeakRetained finishWithSuccess:0 error:v11];
    }
  }
}

void __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = v4;
  id v8 = v5;
  uint64_t v9 = v6;
  if (WeakRetained)
  {
    id v10 = [v7 cloudState];
    [WeakRetained setCloudState:v10];

    id v11 = [v7 cloudState];
    [v8 setCloudState:v11];

    if (v9) {
      v9[2](v9, v7, v8);
    }
    -[HDCloudSyncCompoundOperation _clearOperationAndRunRemaining:]((uint64_t)WeakRetained, v7);
  }
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  name = self->_name;
  id v7 = [(HDCloudSyncCompoundOperation *)self operations];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [(HDCloudSyncCompoundOperation *)self operations];
  id v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_183);
  id v11 = [v10 componentsJoinedByString:@", "];
  id v12 = [v3 stringWithFormat:@"<%@:%p %@ (%ld): %@>", v5, self, name, v8, v11];

  return v12;
}

NSString *__43__HDCloudSyncCompoundOperation_description__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (id)unitTest_currentOperation
{
  return self->_currentOperation;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)continueOnSubOperationError
{
  return self->_continueOnSubOperationError;
}

- (id)preparationHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPreparationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preparationHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_operationErrors, 0);
  objc_storeStrong((id *)&self->_remainingOperations, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);

  objc_storeStrong((id *)&self->_operations, 0);
}

@end
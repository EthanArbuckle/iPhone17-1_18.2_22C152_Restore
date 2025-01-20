@interface HDProtectedDataOperationScheduler
- (HDProtectedDataOperationScheduler)initWithProfile:(id)a3;
- (id)diagnosticDescription;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)registerObserver:(id)a3;
- (void)registerProtectedDataAvailableObserver:(id)a3;
- (void)startEnqueuedWorkWithName:(id)a3;
- (void)startWorkNow:(BOOL)a3 name:(id)a4 asynchronousBlock:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDProtectedDataOperationScheduler

- (HDProtectedDataOperationScheduler)initWithProfile:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDProtectedDataOperationScheduler;
  v5 = [(HDProtectedDataOperationScheduler *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v7;

    v6->_queue_hasNotifiedForProfileReady = 0;
    id v9 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v10 = [NSString stringWithFormat:@"%@-all", objc_opt_class()];
    v11 = HKLogInfrastructure();
    uint64_t v12 = [v9 initWithName:v10 loggingCategory:v11];
    clientQueue_allClients = v6->_clientQueue_allClients;
    v6->_clientQueue_allClients = (HKSynchronousObserverSet *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v15 = [NSString stringWithFormat:@"%@-awaiting-protected-data-available", objc_opt_class()];
    v16 = HKLogInfrastructure();
    uint64_t v17 = [v14 initWithName:v15 loggingCategory:v16];
    clientQueue_clientsAwaitingProtectedDataAvailable = v6->_clientQueue_clientsAwaitingProtectedDataAvailable;
    v6->_clientQueue_clientsAwaitingProtectedDataAvailable = (HKSynchronousObserverSet *)v17;

    v19 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v19 addObject:v6];
  }
  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDProtectedDataOperationScheduler_registerObserver___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __54__HDProtectedDataOperationScheduler_registerObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) registerObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 40))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "protectedDataOperationSchedulerProfileIsReady:");
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    [WeakRetained registerProfileReadyObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HDProtectedDataOperationScheduler_unregisterObserver___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

uint64_t __56__HDProtectedDataOperationScheduler_unregisterObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) unregisterObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v3 unregisterObserver:v2];
}

- (void)registerProtectedDataAvailableObserver:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HDProtectedDataOperationScheduler_registerProtectedDataAvailableObserver___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

uint64_t __76__HDProtectedDataOperationScheduler_registerProtectedDataAvailableObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained database];
  [v3 addProtectedDataObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v5 = [v4 database];
  int v6 = [v5 isProtectedDataAvailable];

  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 protectedDataOperationSchedulerProtectedDataIsAvailable:v8];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v11 registerObserver:v10];
  }
}

- (void)startWorkNow:(BOOL)a3 name:(id)a4 asynchronousBlock:(id)a5
{
  BOOL v6 = a3;
  p_profile = &self->_profile;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  v11 = [WeakRetained database];
  id v16 = +[HDMaintenanceOperation maintenanceOperationWithName:v9 database:v11 asynchronousBlock:v8];

  id v12 = objc_loadWeakRetained((id *)p_profile);
  v13 = [v12 daemon];
  id v14 = [v13 maintenanceWorkCoordinator];
  v15 = v14;
  if (v6) {
    [v14 startOperationImmediately:v16];
  }
  else {
    [v14 enqueueMaintenanceOperation:v16];
  }
}

- (void)startEnqueuedWorkWithName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v6 = [WeakRetained daemon];
  uint64_t v7 = [v6 maintenanceWorkCoordinator];
  char v8 = [v7 startNextOperationWithNameImmediately:v4];

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    id v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v4;
      id v10 = v12;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not find a pending operation with name: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_queue_hasNotifiedForProfileReady = 1;
  clientQueue_allClients = self->_clientQueue_allClients;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HDProtectedDataOperationScheduler_profileDidBecomeReady___block_invoke;
  v5[3] = &unk_1E62FFA18;
  v5[4] = self;
  [(HKSynchronousObserverSet *)clientQueue_allClients notifyObservers:v5];
}

uint64_t __59__HDProtectedDataOperationScheduler_profileDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protectedDataOperationSchedulerProfileIsReady:*(void *)(a1 + 32)];
}

- (id)diagnosticDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F17E96F0];
  clientQueue = self->_clientQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke;
  int v11 = &unk_1E62F31C0;
  id v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_async_and_wait(clientQueue, &v8);
  BOOL v6 = objc_msgSend(v5, "componentsJoinedByString:", @"\n", v8, v9, v10, v11, v12);

  return v6;
}

void __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke_2;
  v2[3] = &unk_1E62FFA18;
  id v3 = *(id *)(a1 + 40);
  [v1 notifyObservers:v2];
}

void __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 addObject:v3];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clientQueue_clientsAwaitingProtectedDataAvailable = self->_clientQueue_clientsAwaitingProtectedDataAvailable;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__HDProtectedDataOperationScheduler_database_protectedDataDidBecomeAvailable___block_invoke;
    v20[3] = &unk_1E62FFA40;
    v20[4] = self;
    id v8 = v6;
    id v21 = v8;
    [(HKSynchronousObserverSet *)clientQueue_clientsAwaitingProtectedDataAvailable notifyObservers:v20];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          -[HKSynchronousObserverSet unregisterObserver:](self->_clientQueue_clientsAwaitingProtectedDataAvailable, "unregisterObserver:", *(void *)(*((void *)&v16 + 1) + 8 * v13++), (void)v16);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v11);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v15 = [WeakRetained database];
    [v15 removeProtectedDataObserver:self];
  }
}

void __78__HDProtectedDataOperationScheduler_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 protectedDataOperationSchedulerProtectedDataIsAvailable:v3];
  [*(id *)(a1 + 40) addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue_clientsAwaitingProtectedDataAvailable, 0);
  objc_storeStrong((id *)&self->_clientQueue_allClients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end
@interface HKClinicalIngestionStore
- (HKClinicalIngestionStore)init;
- (HKClinicalIngestionStore)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (HKObserverSet)ingestionStateChangeObservers;
- (NSString)description;
- (id)_actionCompletionWithObjectOnClientQueue:(id)a3;
- (void)_establishProxyConnection;
- (void)_establishProxyConnectionIfNoObserversArePresent;
- (void)_executeCheapCallOnPluginServerProxy:(id)a3;
- (void)_fetchHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3;
- (void)abortIngestionWithCompletion:(id)a3;
- (void)addIngestionStateListener:(id)a3;
- (void)clientRemote_updateIngestionState:(int64_t)a3;
- (void)currentIngestionStateWithCompletion:(id)a3;
- (void)ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)ingestHealthRecordsWithOptions:(unint64_t)a3 reason:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6;
- (void)pingWithCompletion:(id)a3;
- (void)removeIngestionStateListener:(id)a3;
- (void)resetHealthRecordsLastExtractedRowIDWithCompletion:(id)a3;
- (void)setIngestionStateChangeObservers:(id)a3;
@end

@implementation HKClinicalIngestionStore

- (HKClinicalIngestionStore)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalIngestionStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKClinicalIngestionStore;
  v6 = [(HKClinicalIngestionStore *)&v24 init];
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A818]);
    v9 = [(id)objc_opt_class() taskIdentifier];
    v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = [v8 initWithHealthStore:v5 taskIdentifier:v9 exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
    objc_initWeak(&location, v7);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __48__HKClinicalIngestionStore_initWithHealthStore___block_invoke;
    v21 = &unk_2645EEE58;
    objc_copyWeak(&v22, &location);
    [(HKTaskServerProxyProvider *)v7->_proxyProvider setAutomaticProxyReconnectionHandler:&v18];
    v7->_lastKnownIngestionState = 0;
    id v13 = objc_alloc(MEMORY[0x263F0A5A8]);
    v14 = HKLogInfrastructure();
    uint64_t v15 = objc_msgSend(v13, "initWithName:loggingCategory:", @"HKClinicalIngestionStore-ingestionStateChangeObservers", v14, v18, v19, v20, v21);
    ingestionStateChangeObservers = v7->_ingestionStateChangeObservers;
    v7->_ingestionStateChangeObservers = (HKObserverSet *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__HKClinicalIngestionStore_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:v4];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return (NSString *)v6;
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke;
  v8[3] = &unk_2645EEE80;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ingestHealthRecordsWithOptions:(unint64_t)a3 reason:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a6];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke;
  v18[3] = &unk_2645EEEA8;
  unint64_t v22 = a3;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke_2;
  v16[3] = &unk_2645EE630;
  id v17 = v21;
  id v13 = v21;
  id v14 = v11;
  id v15 = v10;
  [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v18 errorHandler:v16];
}

uint64_t __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_ingestHealthRecordsWithOptions:reason:accountIdentifiers:completion:", a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
}

- (void)ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a6];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke;
  v18[3] = &unk_2645EEEA8;
  id v19 = v10;
  id v20 = v11;
  unint64_t v22 = a5;
  id v21 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke_2;
  v16[3] = &unk_2645EE630;
  id v17 = v21;
  id v13 = v21;
  id v14 = v11;
  id v15 = v10;
  [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v18 errorHandler:v16];
}

uint64_t __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_ingestHealthRecordsWithFHIRDocumentHandle:accountIdentifier:options:completion:", a1[4], a1[5], a1[7], a1[6]);
}

uint64_t __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)abortIngestionWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueErrorHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke;
  v8[3] = &unk_2645EEE80;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_abortIngestionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetHealthRecordsLastExtractedRowIDWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke;
  v8[3] = &unk_2645EEE80;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetHealthRecordsLastExtractedRowIDWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addIngestionStateListener:(id)a3
{
  id v4 = a3;
  [(HKClinicalIngestionStore *)self _establishProxyConnectionIfNoObserversArePresent];
  [(HKObserverSet *)self->_ingestionStateChangeObservers registerObserver:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke;
  v6[3] = &unk_2645EEEF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKClinicalIngestionStore *)self currentIngestionStateWithCompletion:v6];
}

uint64_t __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(result + 32);
    uint64_t v2 = *(void *)(result + 40);
    id v4 = *(void **)(v3 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke_2;
    v5[3] = &unk_2645EEED0;
    v5[4] = v3;
    v5[5] = a2;
    return [v4 notifyObserver:v2 handler:v5];
  }
  return result;
}

uint64_t __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clinicalIngestionStore:*(void *)(a1 + 32) ingestionStateDidUpdateTo:*(void *)(a1 + 40)];
}

- (void)removeIngestionStateListener:(id)a3
{
}

- (void)currentIngestionStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, int64_t))a3;
  os_unfair_lock_lock(&self->_ivarLock);
  int64_t lastKnownIngestionState = self->_lastKnownIngestionState;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (lastKnownIngestionState)
  {
    v4[2](v4, lastKnownIngestionState);
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke;
    v8[3] = &unk_2645EEE80;
    id v9 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2;
    v6[3] = &unk_2645EED00;
    void v6[4] = self;
    id v7 = v9;
    [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
  }
}

uint64_t __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ingestionStateWithCompletion:", *(void *)(a1 + 32));
}

void __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2_cold_1(a1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clientRemote_updateIngestionState:(int64_t)a3
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_lastKnownIngestionState == a3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_int64_t lastKnownIngestionState = a3;
    os_unfair_lock_unlock(p_ivarLock);
    ingestionStateChangeObservers = self->_ingestionStateChangeObservers;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__HKClinicalIngestionStore_clientRemote_updateIngestionState___block_invoke;
    v7[3] = &unk_2645EEED0;
    v7[4] = self;
    v7[5] = a3;
    [(HKObserverSet *)ingestionStateChangeObservers notifyObservers:v7];
  }
}

uint64_t __62__HKClinicalIngestionStore_clientRemote_updateIngestionState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clinicalIngestionStore:*(void *)(a1 + 32) ingestionStateDidUpdateTo:*(void *)(a1 + 40)];
}

- (void)_fetchHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (id)_actionCompletionWithObjectOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke;
  v8[3] = &unk_2645EEF48;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)[v8 copy];

  return v6;
}

void __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) healthStore];
  id v10 = [v9 clientQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke_2;
  v14[3] = &unk_2645EEF20;
  id v11 = *(id *)(a1 + 40);
  id v16 = v8;
  id v17 = v11;
  char v18 = a2;
  id v15 = v7;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, v14);
}

uint64_t __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)_establishProxyConnectionIfNoObserversArePresent
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  uint64_t v4 = [(HKObserverSet *)self->_ingestionStateChangeObservers count];
  os_unfair_lock_unlock(p_ivarLock);
  if (!v4)
  {
    [(HKClinicalIngestionStore *)self _establishProxyConnection];
  }
}

- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  uint64_t v4 = [(HKObserverSet *)self->_ingestionStateChangeObservers count];
  os_unfair_lock_unlock(&self->_ivarLock);
  if (v4) {
    [(HKClinicalIngestionStore *)self _executeCheapCallOnPluginServerProxy:v5];
  }
}

- (void)_establishProxyConnection
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke;
  v3[3] = &unk_2645EEF70;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2;
  v2[3] = &unk_2645EE770;
  v2[4] = self;
  [(HKClinicalIngestionStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v3 errorHandler:v2];
}

uint64_t __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _executeCheapCallOnPluginServerProxy:a2];
}

void __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2_cold_1(a1);
  }
}

- (void)_executeCheapCallOnPluginServerProxy:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
    -[HKClinicalIngestionStore _executeCheapCallOnPluginServerProxy:]((uint64_t)self);
  }
  objc_msgSend(v4, "remote_pingWithCompletion:", &__block_literal_global_5);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKObserverSet)ingestionStateChangeObservers
{
  return self->_ingestionStateChangeObservers;
}

- (void)setIngestionStateChangeObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestionStateChangeObservers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_221D38000, v1, v2, "%{public}@ failed to get current ingestion state: %{public}@", (void)v3, DWORD2(v3));
}

void __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_221D38000, v1, v2, "%{public}@: error establishing proxy connection: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_executeCheapCallOnPluginServerProxy:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_221D38000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: making cheap XCP call to establish connection on %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
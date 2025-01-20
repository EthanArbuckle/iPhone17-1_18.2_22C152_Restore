@interface HKMCExperienceStore
+ (id)taskIdentifier;
- (HKMCExperienceStore)initWithHealthStore:(id)a3;
- (id)getCachedPregnancyModelWithError:(id *)a3;
- (void)client_experienceModelDidUpdate:(id)a3;
- (void)deleteAllPregnancySetupRecordsWithCompletion:(id)a3;
- (void)deleteSetupRecord:(id)a3 completion:(id)a4;
- (void)fetchExperienceModelWithCompletion:(id)a3;
- (void)persistSetupRecord:(id)a3 completion:(id)a4;
- (void)persistSetupRecord:(id)a3 mergeWith:(id)a4 completion:(id)a5;
- (void)registerObserver:(id)a3 completionHandler:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKMCExperienceStore

- (HKMCExperienceStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMCExperienceStore;
  v5 = [(HKMCExperienceStore *)&v18 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A818]);
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKTaskServerProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    id v11 = objc_alloc_init(MEMORY[0x263F0A810]);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setTaskConfiguration:v11];

    id v12 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v13 = [v12 initWithName:@"HKMCExperienceStoreObservers" loggingCategory:*MEMORY[0x263F09930]];
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

uint64_t __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_286(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(void *)(a1 + 32));
}

void __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_2249E9000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning observation", buf, 0xCu);
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_286;
  v8[3] = &unk_2646E97C0;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2;
  v6[3] = &unk_2646E97E8;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getExperienceModelWithCompletion:", *(void *)(a1 + 32));
}

- (void)registerObserver:(id)a3 completionHandler:(id)a4
{
  proxyProvider = self->_proxyProvider;
  id v7 = a3;
  v8 = [(HKTaskServerProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:a4];
  observers = self->_observers;
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke;
  v12[3] = &unk_2646E94C0;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [(HKObserverSet *)observers registerObserver:v7 queue:queue runIfFirstObserver:v12];
}

- (void)fetchExperienceModelWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_2249E9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will begin fetching experience model", buf, 0xCu);
  }
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v4];

  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke;
  v11[3] = &unk_2646E97C0;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke_2;
  v9[3] = &unk_2646E97E8;
  v9[4] = self;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HKMCExperienceStore_unregisterObserver___block_invoke;
  v4[3] = &unk_2646E9600;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __42__HKMCExperienceStore_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_2249E9000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HKMCExperienceStore_unregisterObserver___block_invoke_2;
  v7[3] = &unk_2646E9830;
  v7[4] = v4;
  return [v5 fetchProxyWithHandler:&__block_literal_global_1 errorHandler:v7];
}

uint64_t __42__HKMCExperienceStore_unregisterObserver___block_invoke_290(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __42__HKMCExperienceStore_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __42__HKMCExperienceStore_unregisterObserver___block_invoke_2_cold_1();
  }
}

void __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __42__HKMCExperienceStore_unregisterObserver___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)persistSetupRecord:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received a persist record request", buf, 0xCu);
  }
  uint64_t v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v7];

  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke;
  v15[3] = &unk_2646E9858;
  id v16 = v6;
  id v17 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2;
  v13[3] = &unk_2646E97E8;
  v13[4] = self;
  id v14 = v17;
  id v11 = v17;
  id v12 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_persistSetupRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)persistSetupRecord:(id)a3 mergeWith:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_2249E9000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received a persist record request", buf, 0xCu);
  }
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__HKMCExperienceStore_persistSetupRecord_mergeWith_completion___block_invoke;
  v19[3] = &unk_2646E9880;
  id v20 = v8;
  id v21 = v9;
  id v22 = v12;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__HKMCExperienceStore_persistSetupRecord_mergeWith_completion___block_invoke_2;
  v17[3] = &unk_2646E97E8;
  v17[4] = self;
  id v18 = v22;
  id v14 = v22;
  id v15 = v9;
  id v16 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v17];
}

uint64_t __63__HKMCExperienceStore_persistSetupRecord_mergeWith_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_persistSetupRecord:mergeWith:completion:", a1[4], a1[5], a1[6]);
}

void __63__HKMCExperienceStore_persistSetupRecord_mergeWith_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSetupRecord:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received a delete record request", buf, 0xCu);
  }
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v7];

  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__HKMCExperienceStore_deleteSetupRecord_completion___block_invoke;
  v15[3] = &unk_2646E9858;
  id v16 = v6;
  id v17 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__HKMCExperienceStore_deleteSetupRecord_completion___block_invoke_2;
  v13[3] = &unk_2646E97E8;
  v13[4] = self;
  id v14 = v17;
  id v11 = v17;
  id v12 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __52__HKMCExperienceStore_deleteSetupRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSetupRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __52__HKMCExperienceStore_deleteSetupRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __52__HKMCExperienceStore_deleteSetupRecord_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteAllPregnancySetupRecordsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = self;
    _os_log_impl(&dword_2249E9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting all setup records", buf, 0xCu);
  }
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v4];

  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke;
  v11[3] = &unk_2646E97C0;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2;
  v9[3] = &unk_2646E97E8;
  v9[4] = self;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAllPregnancySetupRecordsWithCompletion:", *(void *)(a1 + 32));
}

void __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)getCachedPregnancyModelWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_2249E9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting cached model", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke;
  v12[3] = &unk_2646E98D0;
  v12[4] = &v13;
  void v12[5] = &buf;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3;
  v11[3] = &unk_2646E98F8;
  void v11[4] = self;
  v11[5] = &buf;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v12 errorHandler:v11];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  id v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&buf, 8);
  return v9;
}

uint64_t __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_2;
  v3[3] = &unk_2646E98A8;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getCachedPregnancyModelWithCompletion:", v3);
}

void __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3_cold_1();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)client_experienceModelDidUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)long long buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of an updated experience model", buf, 0xCu);
  }
  observers = self->_observers;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__HKMCExperienceStore_client_experienceModelDidUpdate___block_invoke;
  v10[3] = &unk_2646E9920;
  id v11 = v4;
  id v9 = v4;
  [(HKObserverSet *)observers notifyObservers:v10];
}

uint64_t __55__HKMCExperienceStore_client_experienceModelDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 experienceModelDidUpdate:*(void *)(a1 + 32)];
}

void __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2249E9000, v0, v1, "[%{public}@] Failed to communicate with task server when starting observation: %{public}@");
}

void __42__HKMCExperienceStore_unregisterObserver___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2249E9000, v0, v1, "[%{public}@] Failed to communicate with task server when ending observation: %{public}@");
}

void __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2249E9000, v4, v5, "[%{public}@] Failed to communicate with task server when writing record: %{public}@", v6, v7, v8, v9, v10);
}

void __52__HKMCExperienceStore_deleteSetupRecord_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2249E9000, v4, v5, "[%{public}@] Failed to communicate with task server when deleting record: %{public}@", v6, v7, v8, v9, v10);
}

void __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2249E9000, v0, v1, "[%{public}@] Failed to communicate with task server when deleting records: %{public}@");
}

void __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2249E9000, v0, v1, "[%{public}@] Failed to communicate with task server when fetching cached model: %{public}@");
}

@end
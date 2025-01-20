@interface HKHRCardioFitnessStore
+ (id)taskIdentifier;
- (HKHRCardioFitnessStore)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (void)saveCardioFitnessEventWithValue:(id)a3 threshold:(id)a4 dateInterval:(id)a5 completion:(id)a6;
- (void)saveCardioFitnessEventWithValue:(id)a3 threshold:(id)a4 dateInterval:(id)a5 options:(unint64_t)a6 completion:(id)a7;
@end

@implementation HKHRCardioFitnessStore

- (HKHRCardioFitnessStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRCardioFitnessStore;
  v6 = [(HKHRCardioFitnessStore *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    v9 = +[HKHRCardioFitnessStore taskIdentifier];
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 initWithHealthStore:v5 taskIdentifier:v9 exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)saveCardioFitnessEventWithValue:(id)a3 threshold:(id)a4 dateInterval:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a6];
  proxyProvider = self->_proxyProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke;
  v21[3] = &unk_1E6D49628;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke_2;
  v19[3] = &unk_1E6D49650;
  id v20 = v25;
  id v15 = v25;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v21 errorHandler:v19];
}

void __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v8 = [v5 startDate];
  v7 = [*(id *)(a1 + 48) endDate];
  objc_msgSend(v6, "remote_saveCardioFitnessAlertWithValue:threshold:startDate:endDate:options:completion:", v3, v4, v8, v7, 0, *(void *)(a1 + 56));
}

uint64_t __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveCardioFitnessEventWithValue:(id)a3 threshold:(id)a4 dateInterval:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a7];
  proxyProvider = self->_proxyProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke;
  v23[3] = &unk_1E6D49678;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  unint64_t v28 = a6;
  id v27 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke_2;
  v21[3] = &unk_1E6D49650;
  id v22 = v27;
  id v17 = v27;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v23 errorHandler:v21];
}

void __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v8 = [v5 startDate];
  v7 = [*(id *)(a1 + 48) endDate];
  objc_msgSend(v6, "remote_saveCardioFitnessAlertWithValue:threshold:startDate:endDate:options:completion:", v3, v4, v8, v7, *(void *)(a1 + 64), *(void *)(a1 + 56));
}

uint64_t __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
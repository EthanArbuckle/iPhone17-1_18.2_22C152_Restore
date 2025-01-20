@interface ACHEarnedInstanceAwardingSourceRecord
- (ACHEarnedInstanceAwarding)source;
- (ACHEarnedInstanceAwardingSourceRecord)initWithSource:(id)a3 earnedInstanceStore:(id)a4 dataStore:(id)a5 registrationDate:(id)a6;
- (NSArray)dataStorePropertyKeys;
- (NSDate)registrationDate;
- (NSDateInterval)lastCompletedEvaluationInterval;
- (NSDateInterval)lastScheduledEvaluationInterval;
- (NSDictionary)dataStoreProperties;
- (NSString)description;
- (NSString)uniqueName;
- (void)addEvaluationOperationWithDateInterval:(id)a3 databaseContext:(id)a4 evaluationBlock:(id)a5 completion:(id)a6;
- (void)addEvaluationOperationWithDateInterval:(id)a3 evaluationBlock:(id)a4 completion:(id)a5;
- (void)cancelAllEvaluationOperations;
- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4;
- (void)setDataStoreProperties:(id)a3;
@end

@implementation ACHEarnedInstanceAwardingSourceRecord

- (ACHEarnedInstanceAwardingSourceRecord)initWithSource:(id)a3 earnedInstanceStore:(id)a4 dataStore:(id)a5 registrationDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ACHEarnedInstanceAwardingSourceRecord;
  v15 = [(ACHEarnedInstanceAwardingSourceRecord *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_source, a3);
    objc_storeWeak((id *)&v16->_earnedInstanceStore, v12);
    objc_storeWeak((id *)&v16->_dataStore, v13);
    objc_storeStrong((id *)&v16->_registrationDate, a6);
    uint64_t v17 = HKCreateSerialDispatchQueue();
    internalQueue = v16->_internalQueue;
    v16->_internalQueue = (OS_dispatch_queue *)v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v19;

    [(NSOperationQueue *)v16->_operationQueue setMaxConcurrentOperationCount:1];
    v21 = HKCreateSerialDispatchQueue();
    [(NSOperationQueue *)v16->_operationQueue setUnderlyingQueue:v21];

    [(NSOperationQueue *)v16->_operationQueue setQualityOfService:17];
    id WeakRetained = objc_loadWeakRetained((id *)&v16->_dataStore);
    [WeakRetained addPropertyProvider:v16];
  }
  return v16;
}

- (void)cancelAllEvaluationOperations
{
}

- (NSDateInterval)lastCompletedEvaluationInterval
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__ACHEarnedInstanceAwardingSourceRecord_lastCompletedEvaluationInterval__block_invoke;
  v5[3] = &unk_264516580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDateInterval *)v3;
}

void __72__ACHEarnedInstanceAwardingSourceRecord_lastCompletedEvaluationInterval__block_invoke(uint64_t a1)
{
}

- (NSDateInterval)lastScheduledEvaluationInterval
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__ACHEarnedInstanceAwardingSourceRecord_lastScheduledEvaluationInterval__block_invoke;
  v5[3] = &unk_264516580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDateInterval *)v3;
}

void __72__ACHEarnedInstanceAwardingSourceRecord_lastScheduledEvaluationInterval__block_invoke(uint64_t a1)
{
}

- (void)addEvaluationOperationWithDateInterval:(id)a3 evaluationBlock:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  id v11 = a3;
  dispatch_assert_queue_not_V2(internalQueue);
  id v12 = ACHEvaluationDateIntervalFor(v11);

  id v13 = self->_internalQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke;
  v17[3] = &unk_264516FA8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v8;
  id v20 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v12;
  dispatch_sync(v13, v17);
}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    id v19 = v2;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling evaluation operation, dateInterval=%@, identifier=%{public}@", buf, 0x20u);
  }
  uint64_t v6 = (void *)MEMORY[0x263F086D0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_292;
  v9[3] = &unk_264516F80;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v2;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = [v6 blockOperationWithBlock:v9];
  [*(id *)(*(void *)(a1 + 32) + 24) addOperation:v8];
}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_292(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__12;
  v54[4] = __Block_byref_object_dispose__12;
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
  id v3 = [@"com.apple.activityawardsd.evaluation." stringByAppendingString:v2];
  [v3 UTF8String];
  id v55 = (id)os_transaction_create();

  v4 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v57 = v5;
    __int16 v58 = 2114;
    uint64_t v59 = v6;
    _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing evaluation operation with identifier %{public}@", buf, 0x16u);
  }
  id v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v53 = 0;
  id v9 = (*(void (**)(void))(v8 + 16))();
  id v10 = 0;
  id v11 = [MEMORY[0x263EFF910] date];
  [v11 timeIntervalSinceDate:v7];
  id v13 = v12;

  if (!v10)
  {
    __int16 v18 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
      uint64_t v20 = [v9 count];
      *(_DWORD *)buf = 138543874;
      v57 = v19;
      __int16 v58 = 2048;
      uint64_t v59 = v20;
      __int16 v60 = 2048;
      id v61 = v13;
      _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Source returned %ld earned instances in %lf seconds; saving...",
        buf,
        0x20u);
    }
    uint64_t v17 = [MEMORY[0x263EFF910] date];
    if ([v9 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      id v48 = 0;
      char v22 = [WeakRetained addEarnedInstances:v9 error:&v48];
      id v23 = v48;
    }
    else
    {
      id v23 = 0;
      char v22 = 1;
    }
    objc_super v24 = [MEMORY[0x263EFF910] date];
    [v24 timeIntervalSinceDate:v17];
    uint64_t v26 = v25;

    v27 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      char v28 = v22;
      v29 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
      *(_DWORD *)buf = 138543618;
      v57 = v29;
      __int16 v58 = 2048;
      uint64_t v59 = v26;
      _os_log_impl(&dword_21F5DA000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saved earned instances in %lf seconds", buf, 0x16u);

      char v22 = v28;
    }

    v30 = [MEMORY[0x263EFF910] date];
    [v30 timeIntervalSinceDate:v7];
    v32 = v31;

    v33 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      char v34 = v22;
      v35 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
      uint64_t v36 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v57 = v35;
      __int16 v58 = 2114;
      uint64_t v59 = v36;
      __int16 v60 = 2048;
      id v61 = v32;
      _os_log_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed evaluation operation with identifier %{public}@ in %lf seconds", buf, 0x20u);

      char v22 = v34;
    }

    uint64_t v37 = *(void *)(a1 + 32);
    v38 = *(NSObject **)(v37 + 32);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_298;
    v41[3] = &unk_264516F58;
    char v47 = v22;
    id v42 = v23;
    uint64_t v43 = v37;
    id v44 = *(id *)(a1 + 48);
    id v45 = *(id *)(a1 + 64);
    v46 = v54;
    id v39 = v23;
    dispatch_async(v38, v41);

    goto LABEL_18;
  }
  id v14 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v40 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueName];
    *(_DWORD *)buf = 138543874;
    v57 = v40;
    __int16 v58 = 2048;
    uint64_t v59 = (uint64_t)v13;
    __int16 v60 = 2112;
    id v61 = v10;
    _os_log_error_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Source failed in %lf seconds with error: %@", buf, 0x20u);
  }
  id v15 = *(void **)(a1 + 64);
  if (v15)
  {
    __int16 v16 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_297;
    block[3] = &unk_264516F08;
    id v51 = v15;
    id v50 = v10;
    v52 = v54;
    dispatch_async(v16, block);

    uint64_t v17 = v51;
LABEL_18:
  }
  _Block_object_dispose(v54, 8);
}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_297(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_298(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) && !*(void *)(a1 + 32)) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), *(id *)(a1 + 48));
  }
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    id v3 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_2;
    v8[3] = &unk_264516F30;
    id v10 = v2;
    char v12 = *(unsigned char *)(a1 + 72);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 64);
    id v9 = v4;
    uint64_t v11 = v5;
    dispatch_async(v3, v8);
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __107__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_evaluationBlock_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)addEvaluationOperationWithDateInterval:(id)a3 databaseContext:(id)a4 evaluationBlock:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = ACHEvaluationDateIntervalFor(a3);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke;
  block[3] = &unk_264517048;
  void block[4] = self;
  id v20 = v13;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  id v18 = v13;
  dispatch_async(internalQueue, block);
}

void __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v4;
    __int16 v25 = 2114;
    uint64_t v26 = v2;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling evaluation operation, source=%{public}@, dateInterval=%@, identifier=%{public}@", buf, 0x20u);
  }

  uint64_t v6 = (void *)MEMORY[0x263F086D0];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_299;
  id v14 = &unk_264517020;
  id v15 = v2;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v19 = v7;
  uint64_t v16 = v8;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 64);
  id v9 = v2;
  id v10 = [v6 blockOperationWithBlock:&v11];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addOperation:", v10, v11, v12, v13, v14);
}

void __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_299(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v3;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Executing evaluation operation with identifier %{public}@", buf, 0xCu);
  }

  uint64_t v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSinceDate:v4];
  uint64_t v8 = v7;

  id v9 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v5 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v31 = v10;
    __int16 v32 = 2048;
    uint64_t v33 = v8;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Source returned %ld earned instances in %lf seconds", buf, 0x16u);
  }

  if ([v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    uint64_t v12 = *(void *)(a1 + 48);
    id v29 = 0;
    char v13 = [WeakRetained addEarnedInstances:v5 databaseContext:v12 error:&v29];
    id v14 = v29;
  }
  else
  {
    id v14 = 0;
    char v13 = 1;
  }
  id v15 = [MEMORY[0x263EFF910] date];
  [v15 timeIntervalSinceDate:v4];
  uint64_t v17 = v16;

  id v18 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v19;
    __int16 v32 = 2048;
    uint64_t v33 = v17;
    _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "Completed evaluation operation with identifier %{public}@ in %lf seconds", buf, 0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = *(NSObject **)(v20 + 32);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_300;
  v23[3] = &unk_264516FF8;
  char v28 = v13;
  id v24 = v14;
  uint64_t v25 = v20;
  id v26 = *(id *)(a1 + 56);
  id v27 = *(id *)(a1 + 72);
  id v22 = v14;
  dispatch_async(v21, v23);
}

void __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_300(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32)) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), *(id *)(a1 + 48));
  }
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_2;
    block[3] = &unk_264516FD0;
    id v6 = v2;
    char v7 = *(unsigned char *)(a1 + 64);
    id v5 = *(id *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

uint64_t __123__ACHEarnedInstanceAwardingSourceRecord_addEvaluationOperationWithDateInterval_databaseContext_evaluationBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (NSString)uniqueName
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(ACHEarnedInstanceAwarding *)self->_source uniqueName];
  uint64_t v4 = [v2 stringWithFormat:@"%@-SourceRecord", v3];

  return (NSString *)v4;
}

- (NSArray)dataStorePropertyKeys
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"LastCompletedEvaluationStart";
  v4[1] = @"LastCompletedEvaluationEnd";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return (NSArray *)v2;
}

- (NSDictionary)dataStoreProperties
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__ACHEarnedInstanceAwardingSourceRecord_dataStoreProperties__block_invoke;
  v5[3] = &unk_264516620;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __60__ACHEarnedInstanceAwardingSourceRecord_dataStoreProperties__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    v14[0] = @"LastCompletedEvaluationStart";
    id v3 = NSNumber;
    uint64_t v4 = [v2 startDate];
    [v4 timeIntervalSinceReferenceDate];
    id v5 = objc_msgSend(v3, "numberWithDouble:");
    v14[1] = @"LastCompletedEvaluationEnd";
    v15[0] = v5;
    uint64_t v6 = NSNumber;
    char v7 = [*(id *)(*(void *)(a1 + 32) + 48) endDate];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
    v15[1] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    char v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = MEMORY[0x263EFFA78];
  }
}

- (void)setDataStoreProperties:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ACHEarnedInstanceAwardingSourceRecord_setDataStoreProperties___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __64__ACHEarnedInstanceAwardingSourceRecord_setDataStoreProperties___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"LastCompletedEvaluationStart"];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"LastCompletedEvaluationEnd"];
  [v13 doubleValue];
  double v4 = v3;
  [v2 doubleValue];
  if (v4 > 0.0)
  {
    double v6 = v5;
    if (v5 > 0.0)
    {
      char v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v4];
      id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v6];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v8];
      uint64_t v10 = ACHEvaluationDateIntervalFor(v9);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = v10;
    }
  }
}

- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__ACHEarnedInstanceAwardingSourceRecord_dataStoreDidClearAllProperties_completion___block_invoke;
  v8[3] = &unk_264517070;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, v8);
}

uint64_t __83__ACHEarnedInstanceAwardingSourceRecord_dataStoreDidClearAllProperties_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (NSString)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHEarnedInstanceAwardingSourceRecord;
  uint64_t v4 = [(ACHEarnedInstanceAwardingSourceRecord *)&v8 description];
  id v5 = [(ACHEarnedInstanceAwarding *)self->_source uniqueName];
  double v6 = [v3 stringWithFormat:@"%@ <\n            uniqueName:\"%@\"\n            registrationDate:\"%@\"\n            lastScheduledEvaluationInterval:\"%@\"\n            lastCompletedEvaluationInterval:\"%@\"\n            >", v4, v5, self->_registrationDate, self->_lastScheduledEvaluationInterval, self->_lastCompletedEvaluationInterval];

  return (NSString *)v6;
}

- (ACHEarnedInstanceAwarding)source
{
  return self->_source;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_lastCompletedEvaluationInterval, 0);
  objc_storeStrong((id *)&self->_lastScheduledEvaluationInterval, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_earnedInstanceStore);
  objc_destroyWeak((id *)&self->_dataStore);
}

@end
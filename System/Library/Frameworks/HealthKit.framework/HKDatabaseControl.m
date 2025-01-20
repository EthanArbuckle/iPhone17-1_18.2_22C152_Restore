@interface HKDatabaseControl
+ (id)taskIdentifier;
- (HKDatabaseControl)initWithHealthStore:(id)a3;
- (id)healthDatabaseIdentifierWithError:(id *)a3;
- (void)getHealthDirectorySizeInBytesWithCompletion:(id)a3;
- (void)hkqa_generateDemoDataWithDurationInDays:(int64_t)a3 completion:(id)a4;
- (void)hkqa_statisticsWithCompletion:(id)a3;
- (void)obliterateHealthDataWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)performMigrationWithCompletion:(id)a3;
@end

@implementation HKDatabaseControl

- (HKDatabaseControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDatabaseControl;
  v5 = [(HKDatabaseControl *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)healthDatabaseIdentifierWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  v21 = __Block_byref_object_dispose__20;
  id v22 = 0;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke;
  v10[3] = &unk_1E58C2560;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_2;
  v3[3] = &unk_1E58C2538;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getHealthDatabaseIdentifierWithCompletion:", v3);
}

void __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)getHealthDirectorySizeInBytesWithCompletion:(id)a3
{
  long long v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2588;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthDirectorySizeInBytesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)obliterateHealthDataWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke;
  v11[3] = &unk_1E58C25B0;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_obliterateHealthDataWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performMigrationWithCompletion:(id)a3
{
  long long v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2588;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performMigrationWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hkqa_generateDemoDataWithDurationInDays:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke;
  v11[3] = &unk_1E58C25B0;
  int64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_hkqa_generateDemoDataWithDurationInDays:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hkqa_statisticsWithCompletion:(id)a3
{
  long long v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2588;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_hkqa_statisticsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end
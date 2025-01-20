@interface HKDiagnosticStore
+ (id)taskIdentifier;
- (HKDiagnosticStore)initWithHealthStore:(id)a3;
- (id)fetchSQLPragma:(int64_t)a3 error:(id *)a4;
- (void)fetchDiagnosticsForKeys:(id)a3 completion:(id)a4;
- (void)fetchPragma:(int64_t)a3 completion:(id)a4;
- (void)fetchURLForAnalyticsFileWithName:(id)a3 completion:(id)a4;
@end

@implementation HKDiagnosticStore

- (HKDiagnosticStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDiagnosticStore;
  v5 = [(HKDiagnosticStore *)&v12 init];
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

- (void)fetchDiagnosticsForKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HKDiagnosticStore_fetchDiagnosticsForKeys_completion___block_invoke;
  v13[3] = &unk_1E58C8EA8;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HKDiagnosticStore_fetchDiagnosticsForKeys_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __56__HKDiagnosticStore_fetchDiagnosticsForKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDiagnosticsWithKeys:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __56__HKDiagnosticStore_fetchDiagnosticsForKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchURLForAnalyticsFileWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HKDiagnosticStore_fetchURLForAnalyticsFileWithName_completion___block_invoke;
  v13[3] = &unk_1E58C8EA8;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HKDiagnosticStore_fetchURLForAnalyticsFileWithName_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __65__HKDiagnosticStore_fetchURLForAnalyticsFileWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchURLForAnalyticsFileWithName:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __65__HKDiagnosticStore_fetchURLForAnalyticsFileWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchSQLPragma:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__57;
  v22 = __Block_byref_object_dispose__57;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__57;
  v16 = __Block_byref_object_dispose__57;
  id v17 = 0;
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__HKDiagnosticStore_fetchSQLPragma_error___block_invoke;
  v11[3] = &unk_1E58C8ED0;
  v11[5] = &v12;
  v11[6] = a3;
  void v11[4] = &v18;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__HKDiagnosticStore_fetchSQLPragma_error___block_invoke_3;
  v10[3] = &unk_1E58BDBD8;
  v10[4] = &v12;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v11 errorHandler:v10];
  id v6 = (id)v13[5];
  v7 = v6;
  if (v6)
  {
    if (a4) {
      *a4 = v6;
    }
    else {
      _HKLogDroppedError(v6);
    }
  }

  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __42__HKDiagnosticStore_fetchSQLPragma_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__HKDiagnosticStore_fetchSQLPragma_error___block_invoke_2;
  v4[3] = &unk_1E58C55E8;
  long long v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchSQLPragma:completion:", v2, v4);
}

void __42__HKDiagnosticStore_fetchSQLPragma_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __42__HKDiagnosticStore_fetchSQLPragma_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)fetchPragma:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__HKDiagnosticStore_fetchPragma_completion___block_invoke;
  v11[3] = &unk_1E58C8EF8;
  int64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__HKDiagnosticStore_fetchPragma_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __44__HKDiagnosticStore_fetchPragma_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSQLPragma:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __44__HKDiagnosticStore_fetchPragma_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end
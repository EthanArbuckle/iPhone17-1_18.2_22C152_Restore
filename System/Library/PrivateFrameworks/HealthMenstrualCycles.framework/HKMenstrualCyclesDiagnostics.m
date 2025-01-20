@interface HKMenstrualCyclesDiagnostics
- (HKHealthStore)healthStore;
- (HKMenstrualCyclesDiagnostics)initWithHealthStore:(id)a3;
- (id)_actionCompletionOnClientQueue:(id)a3;
- (void)triggerAnalysisForDiagnosticsWithCompletion:(id)a3;
@end

@implementation HKMenstrualCyclesDiagnostics

- (HKMenstrualCyclesDiagnostics)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMenstrualCyclesDiagnostics;
  v6 = [(HKMenstrualCyclesDiagnostics *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A818]);
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v8 initWithHealthStore:v5 taskIdentifier:@"HKMCDiagnosticsServer" exportedObject:v7 taskUUID:v9];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)triggerAnalysisForDiagnosticsWithCompletion:(id)a3
{
  v4 = [(HKMenstrualCyclesDiagnostics *)self _actionCompletionOnClientQueue:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke;
  v9[3] = &unk_2646E9250;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke_2;
  v7[3] = &unk_2646E9278;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAnalysisForDiagnosticsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_2646E92C8;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_2646E92A0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
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
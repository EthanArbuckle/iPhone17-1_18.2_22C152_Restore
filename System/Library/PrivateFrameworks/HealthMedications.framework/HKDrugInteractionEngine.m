@interface HKDrugInteractionEngine
+ (id)clientInterface;
+ (id)serverInterface;
- (HKDrugInteractionEngine)init;
- (HKDrugInteractionEngine)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)interactionClassForLifestyleFactor:(unint64_t)a3 completion:(id)a4;
- (void)interactionClassesForConceptWithIdentifier:(id)a3 completion:(id)a4;
- (void)interactionClassesForMedication:(id)a3 completion:(id)a4;
- (void)interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 completion:(id)a5;
- (void)interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 completion:(id)a5;
- (void)interactionResultsForInteractionClasses:(id)a3 completion:(id)a4;
- (void)interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 completion:(id)a5;
- (void)numberOfInteractionsForConceptWithIdentifier:(id)a3 completion:(id)a4;
- (void)numberOfInteractionsForMedication:(id)a3 completion:(id)a4;
- (void)setHealthStore:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)unitTest_noOpWithCompletion:(id)a3;
@end

@implementation HKDrugInteractionEngine

- (HKDrugInteractionEngine)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKDrugInteractionEngine)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKDrugInteractionEngine;
  v6 = [(HKDrugInteractionEngine *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    healthStore = v7->_healthStore;
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 initWithHealthStore:healthStore taskIdentifier:@"HDDrugInteractionEngineServerIdentifier" exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)interactionClassesForConceptWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke;
  v13[3] = &unk_1E62EBC58;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E62EB1F0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionClassesForConceptWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactionClassesForMedication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke;
  v13[3] = &unk_1E62EBC58;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke_2;
  v11[3] = &unk_1E62EB1F0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionClassesForMedication:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactionClassForLifestyleFactor:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke;
  v11[3] = &unk_1E62EBC80;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionClassForLifestyleFactor:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)numberOfInteractionsForConceptWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke;
  v13[3] = &unk_1E62EBC58;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E62EB1F0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberOfInteractionsForConceptWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)numberOfInteractionsForMedication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke;
  v13[3] = &unk_1E62EBC58;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke_2;
  v11[3] = &unk_1E62EB1F0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberOfInteractionsForMedication:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactionResultsForInteractionClasses:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke;
  v13[3] = &unk_1E62EBC58;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke_2;
  v11[3] = &unk_1E62EB1F0;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultsForInteractionClasses:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke;
  v17[3] = &unk_1E62EBCA8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke_2;
  v15[3] = &unk_1E62EB1F0;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultForFirstMedication:secondMedication:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke;
  v15[3] = &unk_1E62EBCD0;
  id v16 = v8;
  unint64_t v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke_2;
  v13[3] = &unk_1E62EB1F0;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultForMedication:lifestyleFactor:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke;
  v17[3] = &unk_1E62EBCA8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke_2;
  v15[3] = &unk_1E62EB1F0;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultsForMedications:lifestyleFactors:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1721448];
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F172AE50];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
  [v2 setClasses:v3 forSelector:sel_remote_interactionClassesForConceptWithIdentifier_completion_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v3 forSelector:sel_remote_interactionClassesForMedication_completion_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v3 forSelector:sel_remote_interactionResultsForInteractionClasses_completion_ argumentIndex:0 ofReply:0];
  id v4 = (id)objc_msgSend(v2, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_interactionResultsForInteractionClasses_completion_, 0, 1);
  id v5 = (id)objc_msgSend(v2, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_interactionResultsForMedications_lifestyleFactors_completion_, 0, 1);
  id v6 = (id)objc_msgSend(v2, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_interactionResultsForMedications_lifestyleFactors_completion_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return +[HKDrugInteractionEngine clientInterface];
}

- (id)remoteInterface
{
  return +[HKDrugInteractionEngine serverInterface];
}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E62EBCF8;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E62EB1F0;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
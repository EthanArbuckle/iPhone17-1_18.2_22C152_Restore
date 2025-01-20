@interface HealthAppAnalyticsStore
+ (void)setUserDidAccept:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5;
- (HealthAppAnalyticsStore)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)setUserDidAccept:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 completion:(id)a6;
- (void)setUserDidAccept:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5;
@end

@implementation HealthAppAnalyticsStore

+ (void)setUserDidAccept:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = [HealthAppAnalyticsStore alloc];
  id v10 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  v11 = [(HealthAppAnalyticsStore *)v9 initWithHealthStore:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke;
  v14[3] = &unk_1E6D40C40;
  v15 = v11;
  id v16 = v7;
  id v12 = v7;
  v13 = v11;
  [(HealthAppAnalyticsStore *)v13 setUserDidAccept:v6 currentAgreement:v8 completion:v14];
}

uint64_t __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HealthAppAnalyticsStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HealthAppAnalyticsStore;
  BOOL v6 = [(HealthAppAnalyticsStore *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    uint64_t v9 = HealthAppAnalyticsStoreTaskServerIdentifier;
    id v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 initWithHealthStore:v5 taskIdentifier:v9 exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;
  }
  return v7;
}

- (void)setUserDidAccept:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke;
  v17[3] = &unk_1E6D40C90;
  BOOL v22 = a3;
  int64_t v21 = a5;
  id v18 = v10;
  v19 = self;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_4;
  v15[3] = &unk_1E6D40CE0;
  v15[4] = self;
  id v16 = v20;
  id v13 = v20;
  id v14 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

void __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_2;
  v7[3] = &unk_1E6D40C40;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v5;
  objc_msgSend(a2, "remote_setAccepted:agreement:version:completion:", v3, v4, v6, v7);
}

void __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_3;
  block[3] = &unk_1E6D40C68;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_5;
  v7[3] = &unk_1E6D40CB8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)setUserDidAccept:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke;
  v15[3] = &unk_1E6D40D08;
  BOOL v19 = a3;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_4;
  v13[3] = &unk_1E6D40CE0;
  v13[4] = self;
  id v14 = v18;
  id v11 = v18;
  id v12 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

void __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_2;
  v6[3] = &unk_1E6D40C40;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  objc_msgSend(a2, "remote_setAccepted:currentAgreement:completion:", v3, v4, v6);
}

void __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_3;
  block[3] = &unk_1E6D40C68;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_5;
  v7[3] = &unk_1E6D40CB8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B5B768];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B5B7C8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
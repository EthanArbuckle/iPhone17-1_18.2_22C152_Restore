@interface ACHClient
- (ACHClient)initWithHealthStore:(id)a3;
- (ACHServerInterface)serverProxy;
- (HKPluginProxyProvider)pluginProxyProvider;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)serverQueue;
- (id)_clientQueueCompletion:(id)a3;
- (id)exportedInterface;
- (id)injectedErrorHandler;
- (void)_addPluginProxyErrorHandler:(id)a3;
- (void)_remoteProxy:(id)a3 errorHandler:(id)a4;
- (void)addEarnedInstance:(id)a3 completion:(id)a4;
- (void)addTemplate:(id)a3 completion:(id)a4;
- (void)availableMobileAssetsWithCompletion:(id)a3;
- (void)fetchAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)fetchActivityChallengeAssetsServerURLWithCompletion:(id)a3;
- (void)fetchAllAchievementsWithCompletion:(id)a3;
- (void)fetchAllEarnedInstancesWithCompletion:(id)a3;
- (void)fetchAllTemplatesWithCompletion:(id)a3;
- (void)fetchEphemeralAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)forceAwardingSchedulerWithCompletion:(id)a3;
- (void)monthlyChallengeForDate:(id)a3 completion:(id)a4;
- (void)removeAllEarnedInstancesWithCompletion:(id)a3;
- (void)removeAllTemplatesWithCompletion:(id)a3;
- (void)removeEarnedInstance:(id)a3 completion:(id)a4;
- (void)removeTemplate:(id)a3 completion:(id)a4;
- (void)runMonthlyChallengesWithCompletion:(id)a3;
- (void)setActivityChallengeAssetsServerURL:(id)a3 completion:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setInjectedErrorHandler:(id)a3;
- (void)setPluginProxyProvider:(id)a3;
- (void)setServerProxy:(id)a3;
- (void)setServerQueue:(id)a3;
- (void)templateForMonthlyChallengeType:(unint64_t)a3 completion:(id)a4;
@end

@implementation ACHClient

- (ACHClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHClient;
  v5 = [(ACHClient *)&v13 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueueWithQOSClass();
    serverQueue = v5->_serverQueue;
    v5->_serverQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueueWithQOSClass();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F0A5F8]) initWithHealthStore:v4 pluginIdentifier:@"com.apple.ActivityAchievements.Plugin" exportedObject:v5];
    pluginProxyProvider = v5->_pluginProxyProvider;
    v5->_pluginProxyProvider = (HKPluginProxyProvider *)v10;
  }
  return v5;
}

- (id)exportedInterface
{
  return 0;
}

- (void)fetchAllTemplatesWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_2;
  v5[3] = &unk_2645129B0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_fetchAllTemplatesWithCompletion:", v5);
}

void __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addTemplate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__ACHClient_addTemplate_completion___block_invoke;
  v12[3] = &unk_264512A28;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__ACHClient_addTemplate_completion___block_invoke_2;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __36__ACHClient_addTemplate_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = [v3 _clientQueueCompletion:v4];
  objc_msgSend(v5, "remote_addTemplate:completion:", v2, v6);
}

uint64_t __36__ACHClient_addTemplate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeTemplate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__ACHClient_removeTemplate_completion___block_invoke;
  v12[3] = &unk_264512A28;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__ACHClient_removeTemplate_completion___block_invoke_2;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __39__ACHClient_removeTemplate_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = [v3 _clientQueueCompletion:v4];
  objc_msgSend(v5, "remote_removeTemplate:completion:", v2, v6);
}

uint64_t __39__ACHClient_removeTemplate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllTemplatesWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke;
  v8[3] = &unk_264512A50;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke_2;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 _clientQueueCompletion:v3];
  objc_msgSend(v4, "remote_removeAllTemplatesWithCompletion:", v5);
}

uint64_t __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllEarnedInstancesWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_2;
  v5[3] = &unk_2645129B0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_fetchAllEarnedInstancesWithCompletion:", v5);
}

void __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addEarnedInstance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__ACHClient_addEarnedInstance_completion___block_invoke;
  v12[3] = &unk_264512A28;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__ACHClient_addEarnedInstance_completion___block_invoke_2;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __42__ACHClient_addEarnedInstance_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = [v3 _clientQueueCompletion:v4];
  objc_msgSend(v5, "remote_addEarnedInstance:completion:", v2, v6);
}

uint64_t __42__ACHClient_addEarnedInstance_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeEarnedInstance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__ACHClient_removeEarnedInstance_completion___block_invoke;
  v12[3] = &unk_264512A28;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__ACHClient_removeEarnedInstance_completion___block_invoke_2;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __45__ACHClient_removeEarnedInstance_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = [v3 _clientQueueCompletion:v4];
  objc_msgSend(v5, "remote_removeEarnedInstance:completion:", v2, v6);
}

uint64_t __45__ACHClient_removeEarnedInstance_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllEarnedInstancesWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke;
  v8[3] = &unk_264512A50;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke_2;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 _clientQueueCompletion:v3];
  objc_msgSend(v4, "remote_removeAllEarnedInstancesWithCompletion:", v5);
}

uint64_t __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllAchievementsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_2;
  v5[3] = &unk_2645129B0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_fetchAllAchievementsWithCompletion:", v5);
}

void __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke;
  v12[3] = &unk_264512AA0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_4;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_2;
  v6[3] = &unk_264512A78;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  objc_msgSend(a2, "remote_fetchAchievementWithTemplateUniqueName:completion:", v4, v6);
}

void __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEphemeralAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke;
  v12[3] = &unk_264512AA0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_4;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_2;
  v6[3] = &unk_264512A78;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  objc_msgSend(a2, "remote_fetchEphemeralAchievementWithTemplateUniqueName:completion:", v4, v6);
}

void __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceAwardingSchedulerWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_2;
  v5[3] = &unk_264512AF0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_forceAwardingSchedulerWithCompletion:", v5);
}

void __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_3;
    block[3] = &unk_264512AC8;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runMonthlyChallengesWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_2;
  v5[3] = &unk_264512AF0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_runMonthlyChallengesWithCompletion:", v5);
}

void __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_3;
    block[3] = &unk_264512AC8;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)templateForMonthlyChallengeType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke;
  v10[3] = &unk_264512B40;
  unint64_t v12 = a3;
  void v10[4] = self;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_4;
  v8[3] = &unk_264512A00;
  id v9 = v11;
  id v7 = v11;
  [(ACHClient *)self _remoteProxy:v10 errorHandler:v8];
}

void __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_2;
  v6[3] = &unk_264512B18;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  objc_msgSend(a2, "remote_templateForMonthlyChallengeType:completion:", v4, v6);
}

void __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)monthlyChallengeForDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke;
  v12[3] = &unk_264512AA0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_4;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __48__ACHClient_monthlyChallengeForDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_2;
  v6[3] = &unk_264512B18;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  objc_msgSend(a2, "remote_monthlyChallengeForDate:completion:", v4, v6);
}

void __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchActivityChallengeAssetsServerURLWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_2;
  v5[3] = &unk_264512B68;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_fetchActivityChallengeAssetsServerURLWithCompletion:", v5);
}

void __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_3;
    block[3] = &unk_2645122C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActivityChallengeAssetsServerURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke;
  v12[3] = &unk_264512AA0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_4;
  v10[3] = &unk_264512A00;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  [(ACHClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_2;
  v6[3] = &unk_264512AF0;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  objc_msgSend(a2, "remote_setActivityChallengeAssetsServerURL:completion:", v4, v6);
}

void __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_3;
    block[3] = &unk_264512AC8;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)availableMobileAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke;
  v8[3] = &unk_2645129D8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_4;
  v6[3] = &unk_264512A00;
  id v7 = v9;
  id v5 = v9;
  [(ACHClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_2;
  v5[3] = &unk_264512B90;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_availableMobileAssetsWithCompletion:", v5);
}

void __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) clientQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_3;
    v5[3] = &unk_264512388;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACHClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ACHClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_264512BE0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __39__ACHClient__remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pluginProxyProvider];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__ACHClient__remoteProxy_errorHandler___block_invoke_2;
  v4[3] = &unk_264512BB8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchPluginProxyWithHandler:v3 errorHandler:v4];
}

void __39__ACHClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ACHLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__ACHClient__remoteProxy_errorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  id v5 = [*(id *)(a1 + 32) injectedErrorHandler];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) injectedErrorHandler];
    ((void (**)(void, id))v6)[2](v6, v3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    }
  }
}

- (id)_clientQueueCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__ACHClient__clientQueueCompletion___block_invoke;
  v8[3] = &unk_264512AF0;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x223C4F6B0](v8);

  return v6;
}

void __36__ACHClient__clientQueueCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ACHClient__clientQueueCompletion___block_invoke_2;
    block[3] = &unk_264512AC8;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __36__ACHClient__clientQueueCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_addPluginProxyErrorHandler:(id)a3
{
  self->_injectedErrorHandler = (id)MEMORY[0x223C4F6B0](a3, a2);

  MEMORY[0x270F9A758]();
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (ACHServerInterface)serverProxy
{
  return self->_serverProxy;
}

- (void)setServerProxy:(id)a3
{
}

- (HKPluginProxyProvider)pluginProxyProvider
{
  return self->_pluginProxyProvider;
}

- (void)setPluginProxyProvider:(id)a3
{
}

- (id)injectedErrorHandler
{
  return self->_injectedErrorHandler;
}

- (void)setInjectedErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectedErrorHandler, 0);
  objc_storeStrong((id *)&self->_pluginProxyProvider, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_storeStrong((id *)&self->_serverQueue, 0);
}

void __39__ACHClient__remoteProxy_errorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch plugin proxy with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
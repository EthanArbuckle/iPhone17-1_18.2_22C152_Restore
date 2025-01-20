@interface ACHQuery
+ (BOOL)supportsTaskServers;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (ACHQuery)initWithInitialAchievementsHandler:(id)a3 newAchievementsHandler:(id)a4 updatedAchievementsHandler:(id)a5 removedAchievementsHandler:(id)a6;
- (id)errorHandler;
- (id)initialAchievementsHandler;
- (id)newAchievementsHandler;
- (id)removedAchievementsHandler;
- (id)updatedAchievementsHandler;
- (void)client_achievementsDidFinishInitialFetch:(id)a3;
- (void)client_deliverNewAchievements:(id)a3;
- (void)client_deliverRemovedAchievements:(id)a3;
- (void)client_deliverUpdatedAchievements:(id)a3;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInitialAchievementsHandler:(id)a3;
- (void)setNewAchievementsHandler:(id)a3;
- (void)setRemovedAchievementsHandler:(id)a3;
- (void)setUpdatedAchievementsHandler:(id)a3;
@end

@implementation ACHQuery

- (ACHQuery)initWithInitialAchievementsHandler:(id)a3 newAchievementsHandler:(id)a4 updatedAchievementsHandler:(id)a5 removedAchievementsHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ACHQuery;
  v14 = [(HKQuery *)&v24 _initWithObjectType:0 predicate:0];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    id initialAchievementsHandler = v14->_initialAchievementsHandler;
    v14->_id initialAchievementsHandler = (id)v15;

    uint64_t v17 = [v11 copy];
    id newAchievementsHandler = v14->_newAchievementsHandler;
    v14->_id newAchievementsHandler = (id)v17;

    uint64_t v19 = [v12 copy];
    id updatedAchievementsHandler = v14->_updatedAchievementsHandler;
    v14->_id updatedAchievementsHandler = (id)v19;

    uint64_t v21 = [v13 copy];
    id removedAchievementsHandler = v14->_removedAchievementsHandler;
    v14->_id removedAchievementsHandler = (id)v21;
  }
  return v14;
}

- (void)setErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__ACHQuery_setErrorHandler___block_invoke;
  v8[3] = &unk_264512360;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __28__ACHQuery_setErrorHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)client_achievementsDidFinishInitialFetch:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke;
  v7[3] = &unk_2645123B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F582000, v2, OS_LOG_TYPE_DEFAULT, "Query finished initial fetch", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) initialAchievementsHandler];
  id v4 = (void *)[v3 copy];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) clientQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_278;
    v7[3] = &unk_264512388;
    id v9 = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, v7);

    id v6 = v9;
  }
  else
  {
    id v6 = ACHLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_cold_1(v6);
    }
  }
}

uint64_t __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_278(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)client_deliverNewAchievements:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ACHQuery_client_deliverNewAchievements___block_invoke;
  v7[3] = &unk_2645123B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__ACHQuery_client_deliverNewAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_21F582000, v2, OS_LOG_TYPE_DEFAULT, "Query received [%lu] new achievements", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) newAchievementsHandler];
  v5 = (void *)[v4 copy];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) clientQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__ACHQuery_client_deliverNewAchievements___block_invoke_279;
    v7[3] = &unk_264512388;
    id v9 = v5;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

uint64_t __42__ACHQuery_client_deliverNewAchievements___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)client_deliverUpdatedAchievements:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke;
  v7[3] = &unk_2645123B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_21F582000, v2, OS_LOG_TYPE_DEFAULT, "Query received [%lu] updated achievements", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) updatedAchievementsHandler];
  v5 = (void *)[v4 copy];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) clientQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke_280;
    v7[3] = &unk_264512388;
    id v9 = v5;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

uint64_t __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke_280(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)client_deliverRemovedAchievements:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ACHQuery_client_deliverRemovedAchievements___block_invoke;
  v7[3] = &unk_2645123B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__ACHQuery_client_deliverRemovedAchievements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_21F582000, v2, OS_LOG_TYPE_DEFAULT, "Query received [%lu] removed achievements", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) removedAchievementsHandler];
  v5 = (void *)[v4 copy];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) clientQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__ACHQuery_client_deliverRemovedAchievements___block_invoke_281;
    v7[3] = &unk_264512388;
    id v9 = v5;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

uint64_t __46__ACHQuery_client_deliverRemovedAchievements___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)ACHQuery;
  [(HKQuery *)&v6 queue_queryDidDeactivate:v4];

  [(ACHQuery *)self setInitialAchievementsHandler:0];
  [(ACHQuery *)self setNewAchievementsHandler:0];
  [(ACHQuery *)self setUpdatedAchievementsHandler:0];
  [(ACHQuery *)self setRemovedAchievementsHandler:0];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuery *)self queue];
  dispatch_assert_queue_V2(v5);

  objc_super v6 = [(ACHQuery *)self errorHandler];
  id v7 = (void *)[v6 copy];

  if (v7)
  {
    id v8 = [(HKQuery *)self clientQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __31__ACHQuery_queue_deliverError___block_invoke;
    v9[3] = &unk_264512388;
    id v11 = v7;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

uint64_t __31__ACHQuery_queue_deliverError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)supportsTaskServers
{
  return 1;
}

+ (id)clientInterfaceProtocol
{
  return &unk_26D0FF888;
}

+ (void)configureClientInterface:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ACHQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  objc_super v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  [v3 setClasses:v6 forSelector:sel_client_achievementsDidFinishInitialFetch_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v6 forSelector:sel_client_deliverNewAchievements_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v6 forSelector:sel_client_deliverUpdatedAchievements_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v6 forSelector:sel_client_deliverRemovedAchievements_ argumentIndex:0 ofReply:0];
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (id)initialAchievementsHandler
{
  return self->_initialAchievementsHandler;
}

- (void)setInitialAchievementsHandler:(id)a3
{
}

- (id)newAchievementsHandler
{
  return self->_newAchievementsHandler;
}

- (void)setNewAchievementsHandler:(id)a3
{
}

- (id)updatedAchievementsHandler
{
  return self->_updatedAchievementsHandler;
}

- (void)setUpdatedAchievementsHandler:(id)a3
{
}

- (id)removedAchievementsHandler
{
  return self->_removedAchievementsHandler;
}

- (void)setRemovedAchievementsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_removedAchievementsHandler, 0);
  objc_storeStrong(&self->_updatedAchievementsHandler, 0);
  objc_storeStrong(&self->_newAchievementsHandler, 0);
  objc_storeStrong(&self->_initialAchievementsHandler, 0);

  objc_storeStrong(&self->_errorHandler, 0);
}

void __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F582000, log, OS_LOG_TYPE_ERROR, "ACHQuery initialAchievementsHandler not provided!", v1, 2u);
}

@end
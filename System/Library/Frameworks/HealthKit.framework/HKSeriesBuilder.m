@interface HKSeriesBuilder
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskServerIdentifier;
+ (void)configureServerInterface:(id)a3;
- (HKHealthStore)store;
- (HKRetryableOperation)retryableOperation;
- (HKSeriesBuilder)init;
- (HKSeriesBuilderConfiguration)configuration;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSString)description;
- (NSUUID)identifier;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)resourceQueue;
- (id)_initWithHealthStore:(id)a3 identifier:(id)a4 configuration:(id)a5;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)state;
- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4;
- (void)_resourceQueue_discardWithHandler:(id)a3;
- (void)clientRemote_didChangeToState:(int64_t)a3 completion:(id)a4;
- (void)discard;
- (void)freezeBuilderWithCompletion:(id)a3;
- (void)recoverWithCompletion:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)setRetryableOperation:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation HKSeriesBuilder

- (HKSeriesBuilder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithHealthStore:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)HKSeriesBuilder;
  v12 = [(HKSeriesBuilder *)&v31 init];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    uint64_t v13 = [v11 device];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [v11 device];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
      }
    }
    if (v10)
    {
      uint64_t v17 = [v10 copy];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
    }
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v17;

    uint64_t v19 = HKCreateSerialDispatchQueue(v12, @"completionQueue");
    completionQueue = v12->_completionQueue;
    v12->_completionQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = HKCreateSerialDispatchQueue(v12, @"resourceQueue");
    resourceQueue = v12->_resourceQueue;
    v12->_resourceQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = [v11 copy];
    configuration = v12->_configuration;
    v12->_configuration = (HKSeriesBuilderConfiguration *)v23;

    objc_storeStrong((id *)&v12->_store, a3);
    atomic_store(0, (unsigned int *)&v12->_state);
    v25 = [[HKRetryableOperation alloc] initWithQueue:v12->_resourceQueue retryCount:5];
    retryableOperation = v12->_retryableOperation;
    v12->_retryableOperation = v25;

    v27 = [(id)objc_opt_class() taskServerIdentifier];
    if (v27)
    {
      v28 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v9 taskIdentifier:v27 exportedObject:v12 taskUUID:v12->_identifier];
      proxyProvider = v12->_proxyProvider;
      v12->_proxyProvider = v28;

      [(HKTaskServerProxyProvider *)v12->_proxyProvider setTaskConfiguration:v11];
    }
  }
  return v12;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSUUID *)self->_identifier UUIDString];
  v6 = HKSeriesBuilderStateToString([(HKSeriesBuilder *)self state]);
  v7 = [v3 stringWithFormat:@"<%@:%p %@ %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)discard
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__31;
  id v9 = __Block_byref_object_dispose__31;
  id v10 = 0;
  v3 = [(HKSeriesBuilder *)self resourceQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__HKSeriesBuilder_discard__block_invoke;
  v4[3] = &unk_1E58BBBA8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  [(id)v6[5] raise];
  _Block_object_dispose(&v5, 8);
}

uint64_t __26__HKSeriesBuilder_discard__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__HKSeriesBuilder_discard__block_invoke_2;
  v3[3] = &unk_1E58BBE28;
  v3[4] = v1;
  return objc_msgSend(v1, "_resourceQueue_discardWithHandler:", v3);
}

void __26__HKSeriesBuilder_discard__block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG)) {
    __26__HKSeriesBuilder_discard__block_invoke_2_cold_1(a1, v2);
  }
}

- (void)freezeBuilderWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v11 = v4;
    uint64_t v5 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(HKSeriesBuilder *)self resourceQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_4;
  v5[3] = &unk_1E58C4960;
  v5[4] = v2;
  return objc_msgSend(v3, "_queue_performRetryableOperation:completion:", v5, v1);
}

void __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_5;
  v8[3] = &unk_1E58C4938;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_7;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

void __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_6;
  v3[3] = &unk_1E58BBD38;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_freezeWithCompletion:", v3);
}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recoverWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v11 = v4;
    id v5 = _Block_copy(aBlock);
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(HKSeriesBuilder *)self resourceQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BB978;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __41__HKSeriesBuilder_recoverWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_4;
  v5[3] = &unk_1E58C4960;
  v5[4] = v2;
  return objc_msgSend(v3, "_queue_performRetryableOperation:completion:", v5, v1);
}

void __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_5;
  v8[3] = &unk_1E58C4938;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_7;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

void __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_6;
  v3[3] = &unk_1E58BBD38;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_recoverWithCompletion:", v3);
}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v8);

  if (v6 && [v6 count])
  {
    retryableOperation = self->_retryableOperation;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke;
    v10[3] = &unk_1E58BBDB0;
    v10[4] = self;
    id v11 = v6;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v10 completion:v7];
  }
  else
  {
    v7[2](v7, 1, 0);
  }
}

void __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2;
  v8[3] = &unk_1E58C4988;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_4;
  v6[3] = &unk_1E58BBD88;
  id v7 = v10;
  id v5 = v10;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

void __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addMetadata:completion:", v3, v4);
}

uint64_t __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_discardWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(HKSeriesBuilder *)self state];
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    int64_t v7 = v6;
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3A8];
    uint64_t v10 = objc_opt_class();
    id v11 = "discarded";
    if (v7 == 2) {
      id v11 = "completed";
    }
    [v8 raise:v9, @"%@ series has been %s.", v10, v11 format];
  }
  if (!v4) {
    id v4 = &__block_literal_global_73;
  }
  retryableOperation = self->_retryableOperation;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_2;
  v13[3] = &unk_1E58C4960;
  v13[4] = self;
  [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v13 completion:v4];
}

void __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_3;
  v8[3] = &unk_1E58C4938;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_5;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

void __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_4;
  v3[3] = &unk_1E58BBD38;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_discardWithCompletion:", v3);
}

uint64_t __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setState:(int64_t)a3
{
}

- (int64_t)state
{
  return (int)atomic_load((unsigned int *)&self->_state);
}

- (void)clientRemote_didChangeToState:(int64_t)a3 completion:(id)a4
{
  int64_t v6 = (void (**)(id, uint64_t, void))a4;
  [(HKSeriesBuilder *)self setState:a3];
  v6[2](v6, 1, 0);
}

+ (id)taskServerIdentifier
{
  return 0;
}

+ (id)clientInterface
{
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECFA038];
  [a1 configureClientInterface:v3];

  return v3;
}

+ (id)serverInterface
{
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED4BDD0];
  [a1 configureServerInterface:v3];

  return v3;
}

+ (void)configureServerInterface:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  objc_msgSend(v3, "hk_secureCodingClasses");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v5 forSelector:sel_remote_addMetadata_completion_ argumentIndex:0 ofReply:0];
}

- (id)exportedInterface
{
  return +[HKSeriesBuilder clientInterface];
}

- (id)remoteInterface
{
  return +[HKSeriesBuilder serverInterface];
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (HKRetryableOperation)retryableOperation
{
  return self->_retryableOperation;
}

- (void)setRetryableOperation:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKSeriesBuilderConfiguration)configuration
{
  return self->_configuration;
}

- (HKHealthStore)store
{
  return self->_store;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_retryableOperation, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __26__HKSeriesBuilder_discard__block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_begin_catch(a1);
  uint64_t v5 = *(void *)(*(void *)(a3 + 40) + 8);
  int64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_end_catch();
}

void __26__HKSeriesBuilder_discard__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_debug_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEBUG, "%@ series discarded", (uint8_t *)&v3, 0xCu);
}

@end
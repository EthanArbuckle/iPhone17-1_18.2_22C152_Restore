@interface HKHealthStoreProvider
+ (id)taskIdentifier;
- (HKHealthStoreProvider)init;
- (HKHealthStoreProvider)initWithHealthStore:(id)a3;
- (HKHealthStoreProvider)initWithProxyProvider:(id)a3;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)fetchAvailableIdentifiersWithCompletion:(id)a3;
- (void)fetchStoreForIdentifier:(id)a3 completion:(id)a4;
- (void)requestAuthorizationToNewStoreToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5;
- (void)requestAuthorizationToNewStoreWithCompletion:(id)a3;
@end

@implementation HKHealthStoreProvider

- (HKHealthStoreProvider)init
{
  v3 = objc_alloc_init(HKHealthStore);
  v4 = [(HKHealthStoreProvider *)self initWithHealthStore:v3];

  return v4;
}

- (HKHealthStoreProvider)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v5 = [HKTaskServerProxyProvider alloc];
  v6 = [(id)objc_opt_class() taskIdentifier];
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [(HKTaskServerProxyProvider *)v5 initWithHealthStore:v4 taskIdentifier:v6 exportedObject:self taskUUID:v7];

  [(HKProxyProvider *)v8 setShouldRetryOnInterruption:0];
  v9 = [(HKHealthStoreProvider *)self initWithProxyProvider:v8];

  return v9;
}

- (HKHealthStoreProvider)initWithProxyProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthStoreProvider;
  v6 = [(HKHealthStoreProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyProvider, a3);
  }

  return v7;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchStoreForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E58BE3B0;
  id v8 = v7;
  id v22 = v8;
  id v9 = v6;
  id v21 = v9;
  v10 = _Block_copy(aBlock);
  v11 = [(HKHealthStoreProviderProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  id v16 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E58C4538;
  id v18 = v9;
  id v19 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_3;
  v15[3] = &unk_1E58BBD88;
  id v12 = v8;
  id v13 = v11;
  id v14 = v9;
  [(HKHealthStoreProvider *)self _fetchProxyWithHandler:v17 errorHandler:v15];
}

void __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [[HKHealthStore alloc] _initWithIdentifier:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0);
  }
}

uint64_t __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchForIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAvailableIdentifiersWithCompletion:(id)a3
{
  uint64_t v4 = [(HKHealthStoreProviderProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke;
  v8[3] = &unk_1E58C4560;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthStoreProvider *)self _fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAvailableIdentifiersWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationToNewStoreWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58C4588;
  id v5 = v4;
  id v15 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [(HKHealthStoreProviderProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v6];

  id v11 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_2;
  v12[3] = &unk_1E58C4560;
  id v13 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_3;
  v10[3] = &unk_1E58BBD88;
  id v8 = v5;
  id v9 = v7;
  [(HKHealthStoreProvider *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

void __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    id v7 = [[HKHealthStore alloc] _initWithIdentifier:v5];
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

uint64_t __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestAuthorizationToNewIdentifierWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationToNewStoreToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke;
  aBlock[3] = &unk_1E58C4588;
  id v11 = v10;
  id v25 = v11;
  id v12 = _Block_copy(aBlock);
  id v13 = [(HKHealthStoreProviderProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v12];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_2;
  v20[3] = &unk_1E58C45B0;
  id v21 = v8;
  id v22 = v9;
  id v23 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_3;
  v18[3] = &unk_1E58BBD88;
  id v19 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v9;
  id v17 = v8;
  [(HKHealthStoreProvider *)self _fetchProxyWithHandler:v20 errorHandler:v18];
}

void __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    id v7 = [[HKHealthStore alloc] _initWithIdentifier:v5];
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

uint64_t __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_2(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestAuthorizationToNewIdentifierToShareTypes:readTypes:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
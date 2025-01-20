@interface HKRaceRouteClusterStore
+ (id)taskIdentifier;
- (HKRaceRouteClusterStore)initWithHealthStore:(id)a3;
- (void)fetchRaceRouteClustersForActivityType:(unint64_t)a3 completion:(id)a4;
@end

@implementation HKRaceRouteClusterStore

- (HKRaceRouteClusterStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRaceRouteClusterStore;
  v5 = [(HKRaceRouteClusterStore *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;
  }
  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchRaceRouteClustersForActivityType:(unint64_t)a3 completion:(id)a4
{
  v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HKRaceRouteClusterStore_fetchRaceRouteClustersForActivityType_completion___block_invoke;
  v11[3] = &unk_1E58C8340;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HKRaceRouteClusterStore_fetchRaceRouteClustersForActivityType_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __76__HKRaceRouteClusterStore_fetchRaceRouteClustersForActivityType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRaceRouteClustersForActivityType:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__HKRaceRouteClusterStore_fetchRaceRouteClustersForActivityType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end
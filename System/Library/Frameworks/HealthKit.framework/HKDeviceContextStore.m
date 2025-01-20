@interface HKDeviceContextStore
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskIdentifier;
- (HKDeviceContextStore)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)fetchEntriesWithCompletion:(id)a3;
- (void)numberOfDeviceContextsPerDeviceType:(id)a3;
@end

@implementation HKDeviceContextStore

- (HKDeviceContextStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKDeviceContextStore;
  v6 = [(HKDeviceContextStore *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = [HKTaskServerProxyProvider alloc];
    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [(HKTaskServerProxyProvider *)v8 initWithHealthStore:v5 taskIdentifier:@"HKDeviceContextStoreServerIdentifier" exportedObject:v7 taskUUID:v9];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;
  }
  return v7;
}

- (void)fetchEntriesWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2EA0;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchEntriesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)numberOfDeviceContextsPerDeviceType:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke;
  v9[3] = &unk_1E58C2EA0;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberOfDeviceContextsPerDeviceType:", *(void *)(a1 + 32));
}

uint64_t __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED529D0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_fetchEntriesWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52A30];
}

- (id)remoteInterface
{
  return +[HKDeviceContextStore serverInterface];
}

- (id)exportedInterface
{
  return +[HKDeviceContextStore clientInterface];
}

+ (id)taskIdentifier
{
  return @"HKDeviceContextStoreServerIdentifier";
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
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
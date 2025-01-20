@interface HKDeviceKeyValueStore
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskIdentifier;
- (HKDeviceKeyValueStore)initWithProtectionCategory:(int64_t)a3 domain:(id)a4 healthStore:(id)a5;
- (HKDeviceKeyValueStoreDelegate)delegate;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSString)domain;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)protectionCategory;
- (void)clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3;
- (void)fetchEntriesForKey:(id)a3 completion:(id)a4;
- (void)mostRecentEntryForKey:(id)a3 completion:(id)a4;
- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setDate:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)startObservingDeviceKeyValueStoreWithCompletion:(id)a3;
@end

@implementation HKDeviceKeyValueStore

- (HKDeviceKeyValueStore)initWithProtectionCategory:(int64_t)a3 domain:(id)a4 healthStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKDeviceKeyValueStore;
  v10 = [(HKDeviceKeyValueStore *)&v20 init];
  if (v10)
  {
    v11 = [HKTaskServerProxyProvider alloc];
    v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [(HKTaskServerProxyProvider *)v11 initWithHealthStore:v9 taskIdentifier:@"HKDeviceKeyValueStoreServerIdentifier" exportedObject:v10 taskUUID:v12];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v13;

    v15 = objc_alloc_init(HKDeviceKeyValueStoreTaskConfiguration);
    v16 = (void *)[v8 copy];
    [(HKDeviceKeyValueStoreTaskConfiguration *)v15 setDomain:v16];

    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v15];
    v10->_protectionCategory = a3;
    uint64_t v17 = [v8 copy];
    domain = v10->_domain;
    v10->_domain = (NSString *)v17;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)fetchEntriesForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke;
  v13[3] = &unk_1E58C0D78;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchEntriesForDomain:key:protectionCategory:completion:", *(void *)(a1[4] + 40), a1[5], *(void *)(a1[4] + 32), a1[6]);
}

uint64_t __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mostRecentEntryForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke;
  v13[3] = &unk_1E58C0D78;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_mostRecentEntryForDomain:key:protectionCategory:completion:", *(void *)(a1[4] + 40), a1[5], *(void *)(a1[4] + 32), a1[6]);
}

uint64_t __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C0DA0;
  id v18 = v8;
  id v19 = v9;
  objc_super v20 = self;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v21;
  id v12 = v21;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setData:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(void *)(a1[6] + 40), *(void *)(a1[6] + 32), a1[7]);
}

uint64_t __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C0DA0;
  id v18 = v8;
  id v19 = v9;
  objc_super v20 = self;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v21;
  id v12 = v21;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDate:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(void *)(a1[6] + 40), *(void *)(a1[6] + 32), a1[7]);
}

uint64_t __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C0DA0;
  id v18 = v8;
  id v19 = v9;
  objc_super v20 = self;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v21;
  id v12 = v21;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setNumber:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(void *)(a1[6] + 40), *(void *)(a1[6] + 32), a1[7]);
}

uint64_t __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C0DA0;
  id v18 = v8;
  id v19 = v9;
  objc_super v20 = self;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v21;
  id v12 = v21;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setString:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(void *)(a1[6] + 40), *(void *)(a1[6] + 32), a1[7]);
}

uint64_t __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startObservingDeviceKeyValueStoreWithCompletion:(id)a3
{
  v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke;
  v9[3] = &unk_1E58C0DC8;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingDeviceKeyValueStoreWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HKDeviceKeyValueStoreDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HKDeviceKeyValueStoreDelegate *)WeakRetained;
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52550];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_fetchEntriesForDomain_key_protectionCategory_completion_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v5 forSelector:sel_remote_mostRecentEntryForDomain_key_protectionCategory_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED008A8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)remoteInterface
{
  return +[HKDeviceKeyValueStore serverInterface];
}

- (id)exportedInterface
{
  return +[HKDeviceKeyValueStore clientInterface];
}

+ (id)taskIdentifier
{
  return @"HKDeviceKeyValueStoreServerIdentifier";
}

- (void)clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__HKDeviceKeyValueStore_clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup___block_invoke;
    v7[3] = &unk_1E58BBBD0;
    id v8 = WeakRetained;
    id v9 = v4;
    dispatch_sync(v6, v7);
  }
}

uint64_t __82__HKDeviceKeyValueStore_clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 deviceKeyValueStoreDidUpdateForStorageGroup:v4];
  }
  return result;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (int64_t)protectionCategory
{
  return self->_protectionCategory;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
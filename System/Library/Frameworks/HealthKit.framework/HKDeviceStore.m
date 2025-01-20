@interface HKDeviceStore
+ (id)taskIdentifier;
- (HKDeviceStore)initWithHealthStore:(id)a3;
- (void)deleteDevice:(id)a3 completion:(id)a4;
- (void)fetchAllDevicesWithCompletion:(id)a3;
- (void)fetchDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5;
- (void)fetchGymkitAndBluetoothDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5;
@end

@implementation HKDeviceStore

- (HKDeviceStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDeviceStore;
  v5 = [(HKDeviceStore *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HKDeviceStore_fetchDevicesMatchingValues_forProperty_completion___block_invoke;
  v17[3] = &unk_1E58C3108;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HKDeviceStore_fetchDevicesMatchingValues_forProperty_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __67__HKDeviceStore_fetchDevicesMatchingValues_forProperty_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDevicesMatchingValues:forProperty:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __67__HKDeviceStore_fetchDevicesMatchingValues_forProperty_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchGymkitAndBluetoothDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__HKDeviceStore_fetchGymkitAndBluetoothDevicesMatchingValues_forProperty_completion___block_invoke;
  v17[3] = &unk_1E58C3108;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__HKDeviceStore_fetchGymkitAndBluetoothDevicesMatchingValues_forProperty_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __85__HKDeviceStore_fetchGymkitAndBluetoothDevicesMatchingValues_forProperty_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchGymkitAndBluetoothDevicesMatchingValues:forProperty:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __85__HKDeviceStore_fetchGymkitAndBluetoothDevicesMatchingValues_forProperty_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllDevicesWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__HKDeviceStore_fetchAllDevicesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C3130;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HKDeviceStore_fetchAllDevicesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __47__HKDeviceStore_fetchAllDevicesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllDevicesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __47__HKDeviceStore_fetchAllDevicesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__HKDeviceStore_deleteDevice_completion___block_invoke;
  v13[3] = &unk_1E58C3158;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__HKDeviceStore_deleteDevice_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __41__HKDeviceStore_deleteDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDevice:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __41__HKDeviceStore_deleteDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end
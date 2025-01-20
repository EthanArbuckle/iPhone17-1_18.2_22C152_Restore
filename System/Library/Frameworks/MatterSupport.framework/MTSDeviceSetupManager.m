@interface MTSDeviceSetupManager
+ (id)logCategory;
- (MTSDeviceSetupManager)init;
- (MTSDeviceSetupManager)initWithServerProxy:(id)a3;
- (MTSXPCServerProxy)serverProxy;
- (void)dealloc;
- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MTSDeviceSetupManager

- (void).cxx_destruct
{
}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 8, 1);
}

- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Performing Matter device setup"];
  v10 = (void *)MEMORY[0x245697870]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [v9 identifier];
    v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    v23 = v13;
    __int16 v24 = 2114;
    v25 = v15;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing Matter device setup using request: %@", buf, 0x20u);
  }
  v16 = [(MTSDeviceSetupManager *)v11 serverProxy];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__MTSDeviceSetupManager_performDeviceSetupUsingRequest_completionHandler___block_invoke;
  v19[3] = &unk_2651C5C28;
  v19[4] = v11;
  id v20 = v9;
  id v21 = v8;
  id v17 = v8;
  id v18 = v9;
  [v16 performDeviceSetupUsingRequest:v6 completionHandler:v19];
}

void __74__MTSDeviceSetupManager_performDeviceSetupUsingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [*(id *)(a1 + 40) identifier];
      v10 = [v9 shortDescription];
      int v16 = 138543874;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_2450FD000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to perform Matter device setup setup: %@", (uint8_t *)&v16, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    v12 = objc_msgSend(MEMORY[0x263F087E8], "mts_errorWithCode:", 1);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [*(id *)(a1 + 40) identifier];
      v15 = [v14 shortDescription];
      int v16 = 138543618;
      id v17 = v13;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_2450FD000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully performed Matter device setup setup", (uint8_t *)&v16, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)dealloc
{
  [(MTSXPCServerProxy *)self->_serverProxy invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTSDeviceSetupManager;
  [(MTSDeviceSetupManager *)&v3 dealloc];
}

- (MTSDeviceSetupManager)initWithServerProxy:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSDeviceSetupManager;
    id v7 = [(MTSDeviceSetupManager *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_serverProxy, a3);
    }

    return v8;
  }
  else
  {
    v10 = (MTSDeviceSetupManager *)_HMFPreconditionFailure();
    return [(MTSDeviceSetupManager *)v10 init];
  }
}

- (MTSDeviceSetupManager)init
{
  objc_super v3 = objc_alloc_init(MTSXPCServerProxy);
  v4 = [(MTSDeviceSetupManager *)self initWithServerProxy:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1) {
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_568);
  }
  v2 = (void *)logCategory__hmf_once_v4;

  return v2;
}

uint64_t __36__MTSDeviceSetupManager_logCategory__block_invoke()
{
  logCategory__hmf_once_v4 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end
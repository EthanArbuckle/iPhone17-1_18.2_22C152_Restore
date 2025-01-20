@interface MTSSystemCommissionerPairingManager
+ (id)logCategory;
- (MTSSystemCommissionerPairingManager)init;
- (MTSSystemCommissionerPairingManager)initWithServerProxy:(id)a3;
- (MTSXPCServerProxy)serverProxy;
- (void)dealloc;
- (void)fetchPairingsWithCompletionHandler:(id)a3;
- (void)removePairingWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation MTSSystemCommissionerPairingManager

- (void).cxx_destruct
{
}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 8, 1);
}

- (void)removePairingWithUUID:(id)a3 completionHandler:(id)a4
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
  v9 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Remove system commissioner pairing"];
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
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing system commissioner pairing with UUID: %@", buf, 0x20u);
  }
  v16 = [(MTSSystemCommissionerPairingManager *)v11 serverProxy];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__MTSSystemCommissionerPairingManager_removePairingWithUUID_completionHandler___block_invoke;
  v19[3] = &unk_2651C5C28;
  v19[4] = v11;
  id v20 = v9;
  id v21 = v8;
  id v17 = v8;
  id v18 = v9;
  [v16 removeSystemCommissionerPairingWithUUID:v6 completionHandler:v19];
}

void __79__MTSSystemCommissionerPairingManager_removePairingWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
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
      int v17 = 138543874;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      v11 = "%{public}@[%{public}@] Failed to remove system commissioner pairing: %@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [*(id *)(a1 + 40) identifier];
    v10 = [v9 shortDescription];
    int v17 = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    v11 = "%{public}@[%{public}@] Successfully removed system commissioner pairing";
    v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v15, v16);
}

- (void)fetchPairingsWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Fetch system commissioner pairings"];
  id v7 = (void *)MEMORY[0x245697870]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 identifier];
    v12 = [v11 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching system commissioner pairings", buf, 0x16u);
  }
  os_log_type_t v13 = [(MTSSystemCommissionerPairingManager *)v8 serverProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__MTSSystemCommissionerPairingManager_fetchPairingsWithCompletionHandler___block_invoke;
  v16[3] = &unk_2651C5C00;
  v16[4] = v8;
  id v17 = v6;
  id v18 = v5;
  id v14 = v5;
  id v15 = v6;
  [v13 fetchSystemCommissionerPairingsWithCompletionHandler:v16];
}

void __74__MTSSystemCommissionerPairingManager_fetchPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x245697870]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 40) identifier];
      os_log_type_t v13 = [v12 shortDescription];
      int v18 = 138543874;
      __int16 v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = [v5 count];
      id v14 = "%{public}@[%{public}@] Fetched %ld system commissioner pairings";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v15, v16, v14, (uint8_t *)&v18, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    os_log_type_t v13 = [v12 shortDescription];
    int v18 = 138543874;
    __int16 v19 = v11;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v6;
    id v14 = "%{public}@[%{public}@] Failed to fetch system commissioner pairings: %@";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v17);
}

- (void)dealloc
{
  [(MTSXPCServerProxy *)self->_serverProxy invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTSSystemCommissionerPairingManager;
  [(MTSSystemCommissionerPairingManager *)&v3 dealloc];
}

- (MTSSystemCommissionerPairingManager)initWithServerProxy:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSSystemCommissionerPairingManager;
    id v7 = [(MTSSystemCommissionerPairingManager *)&v12 init];
    id v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_serverProxy, a3);
    }

    return v8;
  }
  else
  {
    v10 = (MTSSystemCommissionerPairingManager *)_HMFPreconditionFailure();
    return [(MTSSystemCommissionerPairingManager *)v10 init];
  }
}

- (MTSSystemCommissionerPairingManager)init
{
  objc_super v3 = objc_alloc_init(MTSXPCServerProxy);
  id v4 = [(MTSSystemCommissionerPairingManager *)self initWithServerProxy:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1) {
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_813);
  }
  v2 = (void *)logCategory__hmf_once_v7;

  return v2;
}

uint64_t __50__MTSSystemCommissionerPairingManager_logCategory__block_invoke()
{
  logCategory__hmf_once_id v7 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end
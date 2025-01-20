@interface MTSDevicePairingManager
+ (id)logCategory;
- (MTSDevicePairingManager)initWithSystemCommissionerPairing:(id)a3;
- (MTSDevicePairingManager)initWithSystemCommissionerPairing:(id)a3 serverProxy:(id)a4;
- (MTSSystemCommissionerPairing)systemCommissionerPairing;
- (MTSXPCServerProxy)serverProxy;
- (id)logIdentifier;
- (void)dealloc;
- (void)fetchPairingsWithCompletionHandler:(id)a3;
- (void)openCommissioningWindowWithDuration:(double)a3 completionHandler:(id)a4;
- (void)readCommissioningWindowStatusWithCompletionHandler:(id)a3;
- (void)removeAllPairingsWithCompletionHandler:(id)a3;
- (void)removePairingWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation MTSDevicePairingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);

  objc_storeStrong((id *)&self->_systemCommissionerPairing, 0);
}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 16, 1);
}

- (MTSSystemCommissionerPairing)systemCommissionerPairing
{
  return (MTSSystemCommissionerPairing *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(MTSDevicePairingManager *)self systemCommissionerPairing];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)readCommissioningWindowStatusWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  v6 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Read commissioning window status"];
  v7 = (void *)MEMORY[0x245697870]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 identifier];
    v12 = [v11 shortDescription];
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    __int16 v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Reading commissioning window status", buf, 0x16u);
  }
  v13 = [(MTSDevicePairingManager *)v8 serverProxy];
  v14 = [(MTSDevicePairingManager *)v8 systemCommissionerPairing];
  v15 = [v14 uuid];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__MTSDevicePairingManager_readCommissioningWindowStatusWithCompletionHandler___block_invoke;
  v18[3] = &unk_2651C5BA8;
  v18[4] = v8;
  id v19 = v6;
  id v20 = v5;
  id v16 = v5;
  id v17 = v6;
  [v13 readCommissioningWindowStatusForSystemCommissionerPairingUUID:v15 completionHandler:v18];
}

void __78__MTSDevicePairingManager_readCommissioningWindowStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x245697870]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 40) identifier];
      v13 = [v12 shortDescription];
      int v18 = 138543874;
      id v19 = v11;
      __int16 v20 = 2114;
      v21 = v13;
      __int16 v22 = 2112;
      id v23 = v6;
      v14 = "%{public}@[%{public}@] Failed to read commissioning window status: %@";
      v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v15, v16, v14, (uint8_t *)&v18, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    int v18 = 138543874;
    id v19 = v11;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2112;
    id v23 = v5;
    v14 = "%{public}@[%{public}@] Successfully read commissioning window status: %@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v17);
}

- (void)openCommissioningWindowWithDuration:(double)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  v7 = v6;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Open commissioning window"];
  v9 = (void *)MEMORY[0x245697870]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v8 identifier];
    v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v12;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_2450FD000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Opening commissioning window", buf, 0x16u);
  }
  v15 = [(MTSDevicePairingManager *)v10 serverProxy];
  os_log_type_t v16 = [(MTSDevicePairingManager *)v10 systemCommissionerPairing];
  uint64_t v17 = [v16 uuid];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __81__MTSDevicePairingManager_openCommissioningWindowWithDuration_completionHandler___block_invoke;
  v20[3] = &unk_2651C5B80;
  v20[4] = v10;
  id v21 = v8;
  id v22 = v7;
  id v18 = v7;
  id v19 = v8;
  [v15 openCommissioningWindowForSystemCommissionerPairingUUID:v17 duration:v20 completionHandler:a3];
}

void __81__MTSDevicePairingManager_openCommissioningWindowWithDuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x245697870]();
  id v11 = *(id *)(a1 + 32);
  v12 = HMFGetOSLogHandle();
  v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [*(id *)(a1 + 40) identifier];
      os_log_type_t v16 = [v15 shortDescription];
      int v23 = 138544130;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      v26 = v16;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v8;
      uint64_t v17 = "%{public}@[%{public}@] Successfully opened commissioning window with setup QR code: %@, manual pairing code: %@";
      id v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_INFO;
      uint32_t v20 = 42;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v18, v19, v17, (uint8_t *)&v23, v20);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [*(id *)(a1 + 40) identifier];
    os_log_type_t v16 = [v15 shortDescription];
    int v23 = 138543874;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2112;
    id v28 = v9;
    uint64_t v17 = "%{public}@[%{public}@] Failed to open commissioning window: %@";
    id v18 = v13;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    uint32_t v20 = 32;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v8, v9, v21, v22);
}

- (void)removeAllPairingsWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Remove all device pairings"];
  id v7 = (void *)MEMORY[0x245697870]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    id v11 = [v6 identifier];
    v12 = [v11 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing all device pairings", buf, 0x16u);
  }
  v13 = [(MTSDevicePairingManager *)v8 serverProxy];
  v14 = [(MTSDevicePairingManager *)v8 systemCommissionerPairing];
  v15 = [v14 uuid];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__MTSDevicePairingManager_removeAllPairingsWithCompletionHandler___block_invoke;
  v18[3] = &unk_2651C5C28;
  v18[4] = v8;
  id v19 = v6;
  id v20 = v5;
  id v16 = v5;
  id v17 = v6;
  [v13 removeAllDevicePairingsForSystemCommissionerPairingUUID:v15 completionHandler:v18];
}

void __66__MTSDevicePairingManager_removeAllPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) identifier];
      v10 = [v9 shortDescription];
      int v17 = 138543874;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      id v11 = "%{public}@[%{public}@] Failed to remove all device pairings: %@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 40) identifier];
    v10 = [v9 shortDescription];
    int v17 = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    id v11 = "%{public}@[%{public}@] Successfully removed all device pairings";
    v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v15, v16);
}

- (void)removePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Remove device pairing"];
  v10 = (void *)MEMORY[0x245697870]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v13 = HMFGetLogIdentifier();
    uint32_t v14 = [v9 identifier];
    uint64_t v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    __int16 v27 = v15;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing device pairing with UUID: %@", buf, 0x20u);
  }
  uint64_t v16 = [(MTSDevicePairingManager *)v11 serverProxy];
  int v17 = [(MTSDevicePairingManager *)v11 systemCommissionerPairing];
  id v18 = [v17 uuid];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67__MTSDevicePairingManager_removePairingWithUUID_completionHandler___block_invoke;
  v21[3] = &unk_2651C5C28;
  v21[4] = v11;
  id v22 = v9;
  id v23 = v8;
  id v19 = v8;
  id v20 = v9;
  [v16 removeDevicePairingWithUUID:v6 forSystemCommissionerPairingUUID:v18 completionHandler:v21];
}

void __67__MTSDevicePairingManager_removePairingWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) identifier];
      v10 = [v9 shortDescription];
      int v17 = 138543874;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      id v11 = "%{public}@[%{public}@] Failed to remove device pairing: %@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 40) identifier];
    v10 = [v9 shortDescription];
    int v17 = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    id v11 = "%{public}@[%{public}@] Successfully removed device pairing";
    v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v15, v16);
}

- (void)fetchPairingsWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Fetch all device pairings"];
  id v7 = (void *)MEMORY[0x245697870]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    id v11 = [v6 identifier];
    v12 = [v11 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all device pairings", buf, 0x16u);
  }
  os_log_type_t v13 = [(MTSDevicePairingManager *)v8 serverProxy];
  uint32_t v14 = [(MTSDevicePairingManager *)v8 systemCommissionerPairing];
  uint64_t v15 = [v14 uuid];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__MTSDevicePairingManager_fetchPairingsWithCompletionHandler___block_invoke;
  v18[3] = &unk_2651C5C00;
  v18[4] = v8;
  id v19 = v6;
  id v20 = v5;
  id v16 = v5;
  id v17 = v6;
  [v13 fetchDevicePairingsForSystemCommissionerPairingUUID:v15 completionHandler:v18];
}

void __62__MTSDevicePairingManager_fetchPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x245697870]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 40) identifier];
      os_log_type_t v13 = [v12 shortDescription];
      int v18 = 138543874;
      id v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = [v5 count];
      uint32_t v14 = "%{public}@[%{public}@] Fetched %ld device pairings";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_2450FD000, v15, v16, v14, (uint8_t *)&v18, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    os_log_type_t v13 = [v12 shortDescription];
    int v18 = 138543874;
    id v19 = v11;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v6;
    uint32_t v14 = "%{public}@[%{public}@] Failed to fetch device pairings: %@";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v17);
}

- (void)dealloc
{
  [(MTSXPCServerProxy *)self->_serverProxy invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTSDevicePairingManager;
  [(MTSDevicePairingManager *)&v3 dealloc];
}

- (MTSDevicePairingManager)initWithSystemCommissionerPairing:(id)a3 serverProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v8 = v7;
  if (!v7)
  {
LABEL_7:
    os_log_type_t v13 = (MTSDevicePairingManager *)_HMFPreconditionFailure();
    return [(MTSDevicePairingManager *)v13 initWithSystemCommissionerPairing:v15];
  }
  v16.receiver = self;
  v16.super_class = (Class)MTSDevicePairingManager;
  id v9 = [(MTSDevicePairingManager *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    systemCommissionerPairing = v9->_systemCommissionerPairing;
    v9->_systemCommissionerPairing = (MTSSystemCommissionerPairing *)v10;

    objc_storeStrong((id *)&v9->_serverProxy, a4);
  }

  return v9;
}

- (MTSDevicePairingManager)initWithSystemCommissionerPairing:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MTSXPCServerProxy);
  id v6 = [(MTSDevicePairingManager *)self initWithSystemCommissionerPairing:v4 serverProxy:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1) {
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_404);
  }
  v2 = (void *)logCategory__hmf_once_v16;

  return v2;
}

uint64_t __38__MTSDevicePairingManager_logCategory__block_invoke()
{
  logCategory__hmf_once_objc_super v16 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end
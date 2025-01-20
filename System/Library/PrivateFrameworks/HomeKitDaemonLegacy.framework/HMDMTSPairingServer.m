@interface HMDMTSPairingServer
+ (id)logCategory;
- (HMDMTSPairingServer)initWithAccessoryBrowser:(id)a3;
- (HMDMTSPairingServer)initWithSystemCommissionerPairingManager:(id)a3;
- (HMMTRSystemCommissionerPairingManager)systemCommissionerPairingManager;
- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3;
- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDMTSPairingServer

- (void).cxx_destruct
{
}

- (HMMTRSystemCommissionerPairingManager)systemCommissionerPairingManager
{
  return (HMMTRSystemCommissionerPairingManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing system commissioner device pairing with UUID: %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [(HMDMTSPairingServer *)v9 systemCommissionerPairingManager];
  [v12 removeSystemCommissionerPairingWithUUID:v6 completionHandler:v7];
}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching system commissioner device pairings", (uint8_t *)&v10, 0xCu);
  }
  v9 = [(HMDMTSPairingServer *)v6 systemCommissionerPairingManager];
  [v9 fetchSystemCommissionerPairingsWithCompletionHandler:v4];
}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading commissioning window status for system commissioner pairing UUID: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [(HMDMTSPairingServer *)v9 systemCommissionerPairingManager];
  [v12 readCommissioningWindowStatusForSystemCommissionerPairingUUID:v6 completionHandler:v7];
}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v15 = 138543618;
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Opening commissioning window for system commissioner pairing UUID: %@", (uint8_t *)&v15, 0x16u);
  }
  v14 = [(HMDMTSPairingServer *)v11 systemCommissionerPairingManager];
  [v14 openCommissioningWindowForSystemCommissionerPairingUUID:v8 duration:v9 completionHandler:a4];
}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing all device pairings for system commissioner pairing UUID: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [(HMDMTSPairingServer *)v9 systemCommissionerPairingManager];
  [v12 removeAllDevicePairingsForSystemCommissionerPairingUUID:v6 completionHandler:v7];
}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing device pairing with UUID: %@", (uint8_t *)&v16, 0x16u);
  }
  __int16 v15 = [(HMDMTSPairingServer *)v12 systemCommissionerPairingManager];
  [v15 removeDevicePairingWithUUID:v8 forSystemCommissionerPairingUUID:v9 completionHandler:v10];
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching all device pairings for system commissioner device pairing with UUID: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [(HMDMTSPairingServer *)v9 systemCommissionerPairingManager];
  [v12 fetchDevicePairingsForSystemCommissionerPairingUUID:v6 completionHandler:v7];
}

- (HMDMTSPairingServer)initWithSystemCommissionerPairingManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)HMDMTSPairingServer;
    id v7 = [(HMDMTSPairingServer *)&v13 init];
    id v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_systemCommissionerPairingManager, a3);
    }

    return v8;
  }
  else
  {
    id v10 = (HMDMTSPairingServer *)_HMFPreconditionFailure();
    return [(HMDMTSPairingServer *)v10 initWithAccessoryBrowser:v12];
  }
}

- (HMDMTSPairingServer)initWithAccessoryBrowser:(id)a3
{
  id v4 = [a3 chipAccessoryServerBrowser];
  id v5 = [v4 systemCommissionerPairingManager];
  id v6 = [(HMDMTSPairingServer *)self initWithSystemCommissionerPairingManager:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_162780 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_162780, &__block_literal_global_162781);
  }
  v2 = (void *)logCategory__hmf_once_v8_162782;
  return v2;
}

uint64_t __34__HMDMTSPairingServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_162782;
  logCategory__hmf_once_v8_162782 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
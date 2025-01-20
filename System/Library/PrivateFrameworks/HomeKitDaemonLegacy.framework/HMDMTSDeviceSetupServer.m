@interface HMDMTSDeviceSetupServer
+ (id)logCategory;
- (HMDAccessorySetupManager)accessorySetupManager;
- (HMDMTSDeviceSetupServer)initWithAccessorySetupManager:(id)a3;
- (void)clientProxy:(id)a3 performDeviceSetupUsingRequest:(id)a4 completionHandler:(id)a5;
@end

@implementation HMDMTSDeviceSetupServer

- (void).cxx_destruct
{
}

- (HMDAccessorySetupManager)accessorySetupManager
{
  return (HMDAccessorySetupManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)clientProxy:(id)a3 performDeviceSetupUsingRequest:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Performing Matter ecosystem device setup using request: %@", buf, 0x16u);
  }
  v15 = [(HMDMTSDeviceSetupServer *)v12 accessorySetupManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__HMDMTSDeviceSetupServer_clientProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke;
  v17[3] = &unk_1E6A17D78;
  v17[4] = v12;
  id v18 = v10;
  id v16 = v10;
  [v15 launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest:v9 clientProxy:v8 completionHandler:v17];
}

void __88__HMDMTSDeviceSetupServer_clientProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      id v9 = "%{public}@Matter ecosystem device setup failed with error %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v15 = 138543362;
    id v16 = v8;
    id v9 = "%{public}@Matter ecosystem device setup completed successfully!";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v13, v14);
}

- (HMDMTSDeviceSetupServer)initWithAccessorySetupManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDMTSDeviceSetupServer;
    v7 = [(HMDMTSDeviceSetupServer *)&v12 init];
    id v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_accessorySetupManager, a3);
    }

    return v8;
  }
  else
  {
    id v10 = (void *)_HMFPreconditionFailure();
    return (HMDMTSDeviceSetupServer *)+[HMDMTSDeviceSetupServer logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_57279 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_57279, &__block_literal_global_57280);
  }
  v2 = (void *)logCategory__hmf_once_v4_57281;
  return v2;
}

uint64_t __38__HMDMTSDeviceSetupServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_57281;
  logCategory__hmf_once_v4_57281 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
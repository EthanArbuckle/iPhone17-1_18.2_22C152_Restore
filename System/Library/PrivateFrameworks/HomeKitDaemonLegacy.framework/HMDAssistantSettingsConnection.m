@interface HMDAssistantSettingsConnection
+ (id)logCategory;
- (HMDAssistantSettingsConnection)initWithScheduler:(id)a3;
- (HMDAssistantSettingsConnectionDataSource)dataSource;
- (HMFScheduler)scheduler;
- (id)connectionForEndpointUUID:(id)a3;
- (id)deleteSiriHistoryOperationWithConnection:(id)a3;
- (void)deleteSiriHistoryWithEndpointUUID:(id)a3 completionHandler:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation HMDAssistantSettingsConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMFScheduler)scheduler
{
  return (HMFScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAssistantSettingsConnectionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAssistantSettingsConnectionDataSource *)WeakRetained;
}

- (id)deleteSiriHistoryOperationWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [[HMDAppleMediaAccessoryDeleteSiriHistoryOperation alloc] initWithSettingsConnection:v3];

  return v4;
}

- (id)connectionForEndpointUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Device does not support siri endpoint history deletion", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (void)deleteSiriHistoryWithEndpointUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v30 = v11;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleting siri history for endpoint with uuid: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMDAssistantSettingsConnection *)v9 dataSource];
  v13 = [v12 connectionForEndpointUUID:v6];
  if (v13)
  {
    v14 = [v12 deleteSiriHistoryOperationWithConnection:v13];
    if (v14)
    {
      objc_initWeak((id *)buf, v14);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __86__HMDAssistantSettingsConnection_deleteSiriHistoryWithEndpointUUID_completionHandler___block_invoke;
      v26[3] = &unk_1E6A10B58;
      objc_copyWeak(&v28, (id *)buf);
      v26[4] = v9;
      id v27 = v7;
      [v14 setCompletionBlock:v26];
      v15 = [(HMDAssistantSettingsConnection *)v9 scheduler];
      id v16 = (id)[v15 performOperation:v14];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = v9;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v30 = v24;
        __int16 v31 = 2112;
        id v32 = v6;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a delete operation for endpoint uuid: %@ datasource: %@", buf, 0x20u);
      }
      v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      (*((void (**)(id, void *))v7 + 2))(v7, v25);

      v14 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = v9;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a connection for endpoint uuid: %@ datasource: %@", buf, 0x20u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }
}

void __86__HMDAssistantSettingsConnection_deleteSiriHistoryWithEndpointUUID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained error];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history operation completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Delete siri history operation completed", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HMDAssistantSettingsConnection)initWithScheduler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAssistantSettingsConnection;
  id v6 = [(HMDAssistantSettingsConnection *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scheduler, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_28453 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_28453, &__block_literal_global_28454);
  }
  v2 = (void *)logCategory__hmf_once_v7_28455;
  return v2;
}

uint64_t __45__HMDAssistantSettingsConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_28455;
  logCategory__hmf_once_v7_28455 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
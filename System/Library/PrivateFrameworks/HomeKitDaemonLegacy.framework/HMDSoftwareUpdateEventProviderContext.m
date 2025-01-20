@interface HMDSoftwareUpdateEventProviderContext
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDSUControllerManager)suControllerManager;
- (HMDSoftwareUpdateEventProviderContext)initWithAccessory:(id)a3 workQueue:(id)a4 eventStoreReadHandle:(id)a5 eventForwarder:(id)a6 suControllerManagerFactory:(id)a7;
- (HMEEventForwarder)eventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (NSString)eventSource;
- (OS_dispatch_queue)workQueue;
- (double)eventTimeStamp;
- (id)lastEventForTopicSuffixID:(unint64_t)a3;
- (id)suControllerManagerFactory;
- (void)configureWithDelegate:(id)a3;
- (void)forwardEvent:(id)a3 withTopicSuffixID:(unint64_t)a4;
- (void)managerStatus:(id)a3;
- (void)scanWithOptions:(id)a3;
- (void)setSuControllerManager:(id)a3;
- (void)setSuControllerManagerFactory:(id)a3;
@end

@implementation HMDSoftwareUpdateEventProviderContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suControllerManagerFactory, 0);
  objc_storeStrong((id *)&self->_suControllerManager, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setSuControllerManagerFactory:(id)a3
{
}

- (id)suControllerManagerFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSuControllerManager:(id)a3
{
}

- (HMDSUControllerManager)suControllerManager
{
  return (HMDSUControllerManager *)objc_getProperty(self, a2, 40, 1);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 32, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (double)eventTimeStamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (NSString)eventSource
{
  v2 = [(HMDSoftwareUpdateEventProviderContext *)self accessory];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return (NSString *)v4;
}

- (id)lastEventForTopicSuffixID:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDSoftwareUpdateEventProviderContext *)self accessory];
  v6 = [v5 uuid];
  v7 = [v5 home];
  v8 = [v7 uuid];

  v9 = 0;
  if (v6 && v8)
  {
    v10 = [MEMORY[0x1E4F2E580] topicFromSuffixID:a3 homeUUID:v8 accessoryUUID:v6];
    if (v10)
    {
      v11 = [(HMDSoftwareUpdateEventProviderContext *)self eventStoreReadHandle];
      v9 = [v11 lastEventForTopic:v10];
    }
    else
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        int v17 = 138544130;
        v18 = v15;
        __int16 v19 = 2048;
        unint64_t v20 = a3;
        __int16 v21 = 2112;
        v22 = v8;
        __int16 v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with suffix: %ld, homeUUID: %@, accessoryUUID: %@", (uint8_t *)&v17, 0x2Au);
      }
      v9 = 0;
    }
  }
  return v9;
}

- (void)forwardEvent:(id)a3 withTopicSuffixID:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HMDSoftwareUpdateEventProviderContext *)self accessory];
  v8 = [v7 uuid];
  v9 = [v7 home];
  v10 = [v9 uuid];

  if (v8 && v10)
  {
    v11 = [MEMORY[0x1E4F2E580] topicFromSuffixID:a4 homeUUID:v10 accessoryUUID:v8];
    if (v11)
    {
      v12 = [(HMDSoftwareUpdateEventProviderContext *)self eventForwarder];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __72__HMDSoftwareUpdateEventProviderContext_forwardEvent_withTopicSuffixID___block_invoke;
      v21[3] = &unk_1E6A197F0;
      v21[4] = self;
      [v12 forwardEvent:v6 topic:v11 completion:v21];
    }
    else
    {
      int v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        unint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v23 = v20;
        __int16 v24 = 2048;
        unint64_t v25 = a4;
        __int16 v26 = 2112;
        v27 = v10;
        __int16 v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with suffix: %ld, homeUUID: %@, accessoryUUID: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v23 = v16;
      __int16 v24 = 2112;
      unint64_t v25 = (unint64_t)v10;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil value in homeUUID: %@, accessoryUUID: %@", buf, 0x20u);
    }
  }
}

void __72__HMDSoftwareUpdateEventProviderContext_forwardEvent_withTopicSuffixID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the event: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)scanWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateEventProviderContext *)self suControllerManager];
  [v5 scanForUpdates:v4];
}

- (void)managerStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateEventProviderContext *)self suControllerManager];
  [v5 managerStatus:v4];
}

- (void)configureWithDelegate:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDSoftwareUpdateEventProviderContext *)self suControllerManagerFactory];
  id v5 = v6[2](v6, v4);

  [(HMDSoftwareUpdateEventProviderContext *)self setSuControllerManager:v5];
}

- (HMDSoftwareUpdateEventProviderContext)initWithAccessory:(id)a3 workQueue:(id)a4 eventStoreReadHandle:(id)a5 eventForwarder:(id)a6 suControllerManagerFactory:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDSoftwareUpdateEventProviderContext;
  int v17 = [(HMDSoftwareUpdateEventProviderContext *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_eventStoreReadHandle, a5);
    objc_storeStrong((id *)&v18->_eventForwarder, a6);
    __int16 v19 = _Block_copy(v16);
    id suControllerManagerFactory = v18->_suControllerManagerFactory;
    v18->_id suControllerManagerFactory = v19;
  }
  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_65952 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_65952, &__block_literal_global_65953);
  }
  v2 = (void *)logCategory__hmf_once_v5_65954;
  return v2;
}

uint64_t __52__HMDSoftwareUpdateEventProviderContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_65954;
  logCategory__hmf_once_v5_65954 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
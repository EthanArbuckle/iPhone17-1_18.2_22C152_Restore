@interface HMDSoftwareUpdateEventListener
+ (id)logCategory;
- (BOOL)isSoftwareUpdateAvailable;
- (BOOL)isSoftwareUpdateDownloadedAndReadyForInstallation;
- (HMDSoftwareUpdateEventListener)initWithContext:(id)a3;
- (HMDSoftwareUpdateEventListenerContext)context;
- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptorForLastEvent;
- (id)logIdentifier;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)registerForEvents;
@end

@implementation HMDSoftwareUpdateEventListener

- (void).cxx_destruct
{
}

- (HMDSoftwareUpdateEventListenerContext)context
{
  return (HMDSoftwareUpdateEventListenerContext *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDSoftwareUpdateEventListener *)self context];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v19 = 138543874;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive cached event: %@, for topic: %@", (uint8_t *)&v19, 0x20u);
  }
  v15 = [(HMDSoftwareUpdateEventListener *)v12 context];
  [v15 updateAppBadgeAndBulletinNotification];

  if ([(HMDSoftwareUpdateEventListener *)v12 isSoftwareUpdateAvailable])
  {
    v16 = [(HMDSoftwareUpdateEventListener *)v12 context];
    v17 = [(HMDSoftwareUpdateEventListener *)v12 context];
    v18 = [v17 softwareUpdateDescriptorForLastEvent];
    [v16 handleSoftwareUpdateDidBecomeAvailableWithDescriptor:v18];
  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v16 = 138543874;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Did receive event: %@, for topic: %@", (uint8_t *)&v16, 0x20u);
  }
  v12 = [(HMDSoftwareUpdateEventListener *)v9 context];
  [v12 updateAppBadgeAndBulletinNotification];

  if ([(HMDSoftwareUpdateEventListener *)v9 isSoftwareUpdateAvailable])
  {
    v13 = [(HMDSoftwareUpdateEventListener *)v9 context];
    v14 = [(HMDSoftwareUpdateEventListener *)v9 context];
    v15 = [v14 softwareUpdateDescriptorForLastEvent];
    [v13 handleSoftwareUpdateDidBecomeAvailableWithDescriptor:v15];
  }
}

- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptorForLastEvent
{
  v2 = [(HMDSoftwareUpdateEventListener *)self context];
  v3 = [v2 softwareUpdateDescriptorForLastEvent];

  return (HMSoftwareUpdateDescriptor *)v3;
}

- (BOOL)isSoftwareUpdateAvailable
{
  v2 = [(HMDSoftwareUpdateEventListener *)self context];
  uint64_t v3 = [v2 softwareUpdateStatusForLastEvent];

  return v3 > 2;
}

- (BOOL)isSoftwareUpdateDownloadedAndReadyForInstallation
{
  v2 = [(HMDSoftwareUpdateEventListener *)self context];
  uint64_t v3 = [v2 softwareUpdateStatusForLastEvent];

  return v3 == 8 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)registerForEvents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering for events", buf, 0xCu);
  }
  id v7 = [(HMDSoftwareUpdateEventListener *)v4 context];
  id v8 = [v7 topicForSoftwareUpdateDescriptor];

  if (v8)
  {
    id v9 = [(HMDSoftwareUpdateEventListener *)v4 context];
    int v16 = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__HMDSoftwareUpdateEventListener_registerForEvents__block_invoke;
    v15[3] = &unk_264A2E660;
    v15[4] = v4;
    [v9 registerConsumer:v4 topicFilters:v10 completion:v15];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = v4;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Not registering for events because failed to get software update topic", buf, 0xCu);
    }
  }
}

void __51__HMDSoftwareUpdateEventListener_registerForEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"error: %@, ", v6];
  }
  else
  {
    id v7 = &stru_26E2EB898;
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v14 = v11;
    __int16 v15 = 2112;
    int v16 = v7;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribed with %@cachedEvents: %@", buf, 0x20u);
  }
  v12 = [*(id *)(a1 + 32) context];
  [v12 updateAppBadgeAndBulletinNotification];
}

- (HMDSoftwareUpdateEventListener)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSoftwareUpdateEventListener;
  id v6 = [(HMDSoftwareUpdateEventListener *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_64967 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_64967, &__block_literal_global_64968);
  }
  v2 = (void *)logCategory__hmf_once_v6_64969;
  return v2;
}

void __45__HMDSoftwareUpdateEventListener_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_64969;
  logCategory__hmf_once_v6_64969 = v0;
}

@end
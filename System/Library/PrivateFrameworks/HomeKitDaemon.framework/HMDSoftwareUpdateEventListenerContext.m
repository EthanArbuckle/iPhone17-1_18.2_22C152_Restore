@interface HMDSoftwareUpdateEventListenerContext
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDSoftwareUpdateEventListenerContext)initWithAccessory:(id)a3 subscriptionProvider:(id)a4 eventStoreReadHandle:(id)a5;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMESubscriptionProviding)subscriptionProvider;
- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptorForLastEvent;
- (NSString)topicForSoftwareUpdateDescriptor;
- (id)logIdentifier;
- (int64_t)softwareUpdateStatusForLastEvent;
- (void)handleSoftwareUpdateDidBecomeAvailableWithDescriptor:(id)a3;
- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)updateAppBadgeAndBulletinNotification;
@end

@implementation HMDSoftwareUpdateEventListenerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 24, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDSoftwareUpdateEventListenerContext *)self accessory];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)handleSoftwareUpdateDidBecomeAvailableWithDescriptor:(id)a3
{
  id v7 = a3;
  v4 = [(HMDSoftwareUpdateEventListenerContext *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  [v6 handleSoftwareUpdateDidBecomeAvailableWithDescriptor:v7];
}

- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptorForLastEvent
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(HMDSoftwareUpdateEventListenerContext *)self topicForSoftwareUpdateDescriptor];
  if (v3)
  {
    v4 = [(HMDSoftwareUpdateEventListenerContext *)self eventStoreReadHandle];
    v5 = [v4 lastEventForTopic:v3];

    if (v5)
    {
      id v6 = [MEMORY[0x263F0E7D8] descriptorFromEvent:v5];
      id v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        v13 = (void *)MEMORY[0x230FBD990]();
        v14 = self;
        v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = HMFGetLogIdentifier();
          int v18 = 138543618;
          v19 = v16;
          __int16 v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from event: %@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v18 = 138543618;
        v19 = v12;
        __int16 v20 = 2112;
        v21 = v3;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve last event for topic: %@", (uint8_t *)&v18, 0x16u);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (HMSoftwareUpdateDescriptor *)v7;
}

- (int64_t)softwareUpdateStatusForLastEvent
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(HMDSoftwareUpdateEventListenerContext *)self topicForSoftwareUpdateDescriptor];
  if (v3)
  {
    v4 = [(HMDSoftwareUpdateEventListenerContext *)self eventStoreReadHandle];
    v5 = [v4 lastEventForTopic:v3];

    if (v5)
    {
      id v6 = [MEMORY[0x263F0E7D8] descriptorFromEvent:v5];
      id v7 = v6;
      if (v6)
      {
        int64_t v8 = [v6 status];
      }
      else
      {
        v13 = (void *)MEMORY[0x230FBD990]();
        v14 = self;
        v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = HMFGetLogIdentifier();
          int v18 = 138543618;
          v19 = v16;
          __int16 v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from event: %@", (uint8_t *)&v18, 0x16u);
        }
        int64_t v8 = 0;
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v18 = 138543618;
        v19 = v12;
        __int16 v20 = 2112;
        v21 = v3;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve last event for topic: %@", (uint8_t *)&v18, 0x16u);
      }
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (NSString)topicForSoftwareUpdateDescriptor
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(HMDSoftwareUpdateEventListenerContext *)self accessory];
  v4 = [v3 uuid];
  v5 = [v3 home];
  id v6 = [v5 uuid];

  if (v4 && v6)
  {
    id v7 = (void *)*MEMORY[0x263F0B318];
    int64_t v8 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B318] homeUUID:v6 accessoryUUID:v4];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        int v20 = 138544130;
        v21 = v18;
        __int16 v22 = 2048;
        v23 = v7;
        __int16 v24 = 2112;
        v25 = v6;
        __int16 v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with suffix: %ld, homeUUID: %@, accessoryUUID: %@", (uint8_t *)&v20, 0x2Au);
      }
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v20 = 138543874;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v6;
      __int16 v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with homeUUID: %@, accessoryUUID: %@", (uint8_t *)&v20, 0x20u);
    }
    v9 = 0;
  }

  return (NSString *)v9;
}

- (void)updateAppBadgeAndBulletinNotification
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating app badge and bulletin", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [(HMDSoftwareUpdateEventListenerContext *)v4 accessory];
  int64_t v8 = [v7 home];

  if (v8)
  {
    [v8 reevaluateAccessoryInfo];
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = v4;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot update app badge and bulletin because home is nil", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDSoftwareUpdateEventListenerContext *)self subscriptionProvider];
  [v11 registerConsumer:v10 topicFilters:v9 completion:v8];
}

- (HMDSoftwareUpdateEventListenerContext)initWithAccessory:(id)a3 subscriptionProvider:(id)a4 eventStoreReadHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDSoftwareUpdateEventListenerContext;
  id v11 = [(HMDSoftwareUpdateEventListenerContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeStrong((id *)&v12->_subscriptionProvider, a4);
    objc_storeStrong((id *)&v12->_eventStoreReadHandle, a5);
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_132505 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_132505, &__block_literal_global_132506);
  }
  v2 = (void *)logCategory__hmf_once_v10_132507;
  return v2;
}

void __52__HMDSoftwareUpdateEventListenerContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_132507;
  logCategory__hmf_once_v10_132507 = v0;
}

@end
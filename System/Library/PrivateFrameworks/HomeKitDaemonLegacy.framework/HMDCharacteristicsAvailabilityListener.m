@interface HMDCharacteristicsAvailabilityListener
+ (id)logCategory;
- (HMDCharacteristicsAvailabilityListener)initWithAccessory:(id)a3 workQueue:(id)a4 interestedCharacteristicTypesByServiceType:(id)a5;
- (HMDCharacteristicsAvailabilityListenerDelegate)delegate;
- (HMDHAPAccessory)accessory;
- (HMDNotificationRegistration)notificationRegistration;
- (NSDictionary)interestedCharacteristicTypesByServiceType;
- (NSSet)availableCharacteristics;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_accessoryCharacteristicsToObserve;
- (void)_notifyDelegate;
- (void)_registerForNotifications;
- (void)handleCharacteristicsUpdated:(id)a3;
- (void)handleServicesUpdated:(id)a3;
- (void)setAvailableCharacteristics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation HMDCharacteristicsAvailabilityListener

- (NSSet)availableCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interestedCharacteristicTypesByServiceType, 0);
  objc_storeStrong((id *)&self->_availableCharacteristics, 0);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (HMDNotificationRegistration)notificationRegistration
{
  return (HMDNotificationRegistration *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCharacteristicsAvailabilityListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCharacteristicsAvailabilityListenerDelegate *)WeakRetained;
}

- (NSDictionary)interestedCharacteristicTypesByServiceType
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableCharacteristics:(id)a3
{
}

- (void)handleServicesUpdated:(id)a3
{
  v4 = [(HMDCharacteristicsAvailabilityListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HMDCharacteristicsAvailabilityListener_handleServicesUpdated___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __64__HMDCharacteristicsAvailabilityListener_handleServicesUpdated___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Services updated", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _notifyDelegate];
}

- (void)handleCharacteristicsUpdated:(id)a3
{
  v4 = [(HMDCharacteristicsAvailabilityListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HMDCharacteristicsAvailabilityListener_handleCharacteristicsUpdated___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __71__HMDCharacteristicsAvailabilityListener_handleCharacteristicsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Characteristics updated", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _notifyDelegate];
}

- (void)_notifyDelegate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCharacteristicsAvailabilityListener *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDCharacteristicsAvailabilityListener *)self _accessoryCharacteristicsToObserve];
  v5 = [(HMDCharacteristicsAvailabilityListener *)self availableCharacteristics];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    int v7 = (void *)MEMORY[0x1D9452090]([(HMDCharacteristicsAvailabilityListener *)self setAvailableCharacteristics:v4]);
    v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of characteristics update: %@", (uint8_t *)&v13, 0x16u);
    }
    v11 = [(HMDCharacteristicsAvailabilityListener *)v8 delegate];
    v12 = [(HMDCharacteristicsAvailabilityListener *)v8 availableCharacteristics];
    [v11 listener:v8 didUpdateAvailableCharacteristics:v12];
  }
}

- (id)_accessoryCharacteristicsToObserve
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCharacteristicsAvailabilityListener *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v24 = self;
  v5 = [(HMDCharacteristicsAvailabilityListener *)self accessory];
  char v6 = [v5 services];

  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [(HMDCharacteristicsAvailabilityListener *)v24 interestedCharacteristicTypesByServiceType];
        int v13 = [v11 serviceType];
        v14 = objc_msgSend(v12, "hmf_setForKey:", v13);

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = [v11 findCharacteristicWithType:*(void *)(*((void *)&v25 + 1) + 8 * j)];
              if (v20) {
                [v4 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v17);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  v21 = (void *)[v4 copy];
  return v21;
}

- (void)_registerForNotifications
{
  id v3 = [(HMDCharacteristicsAvailabilityListener *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v6 = [(HMDCharacteristicsAvailabilityListener *)self accessory];
  v4 = [(HMDCharacteristicsAvailabilityListener *)self notificationRegistration];
  [v4 addObserver:sel_handleServicesUpdated_ name:@"kHMDNotificationServicesUpdated" object:v6];

  v5 = [(HMDCharacteristicsAvailabilityListener *)self notificationRegistration];
  [v5 addObserver:sel_handleCharacteristicsUpdated_ name:@"kHMDNotificationCharacteristicsUpdated" object:v6];
}

- (void)start
{
  id v3 = [(HMDCharacteristicsAvailabilityListener *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDCharacteristicsAvailabilityListener *)self _registerForNotifications];
  [(HMDCharacteristicsAvailabilityListener *)self _notifyDelegate];
}

- (HMDCharacteristicsAvailabilityListener)initWithAccessory:(id)a3 workQueue:(id)a4 interestedCharacteristicTypesByServiceType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HMDCharacteristicsAvailabilityListener;
  v11 = [(HMDCharacteristicsAvailabilityListener *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workQueue, a4);
    objc_storeWeak((id *)&v12->_accessory, v8);
    int v13 = [[HMDNotificationRegistration alloc] initWithRegisterer:v12];
    notificationRegistration = v12->_notificationRegistration;
    v12->_notificationRegistration = v13;

    objc_storeStrong((id *)&v12->_interestedCharacteristicTypesByServiceType, a5);
    id v15 = NSString;
    uint64_t v16 = [v8 home];
    uint64_t v17 = [v16 name];
    uint64_t v18 = [v8 name];
    v19 = [v8 uuid];
    v20 = [v15 stringWithFormat:@"%@/%@/%@", v17, v18, v19];
    uint64_t v21 = [v20 copy];
    logIdentifier = v12->_logIdentifier;
    v12->_logIdentifier = (NSString *)v21;
  }
  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_191644 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_191644, &__block_literal_global_191645);
  }
  v2 = (void *)logCategory__hmf_once_v4_191646;
  return v2;
}

uint64_t __53__HMDCharacteristicsAvailabilityListener_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_191646;
  logCategory__hmf_once_v4_191646 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
@interface HMDDoorbellPressTracker
+ (id)logCategory;
- (BOOL)doorbellPressInDateInterval:(id)a3 doorbellAccessory:(id)a4;
- (HMDDoorbellPressTracker)initWithWorkQueue:(id)a3 notificationCenter:(id)a4;
- (NSMutableDictionary)dateOfLastDoorbellPressByAccessoryUUID;
- (NSMutableDictionary)registrationsByAccessoryUUID;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (os_unfair_lock_s)lock;
- (void)_handleCharacteristicsValueUpdatedNotification:(id)a3;
- (void)handleCharacteristicsValueUpdatedNotification:(id)a3;
- (void)setDateOfLastDoorbellPressByAccessoryUUID:(id)a3;
- (void)setRegistrationsByAccessoryUUID:(id)a3;
- (void)startTrackingPressesForDoorbellAccessory:(id)a3 registration:(id)a4;
- (void)stopTrackingPressesForDoorbellAccessory:(id)a3 registration:(id)a4;
@end

@implementation HMDDoorbellPressTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationsByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_dateOfLastDoorbellPressByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)setRegistrationsByAccessoryUUID:(id)a3
{
}

- (NSMutableDictionary)registrationsByAccessoryUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDateOfLastDoorbellPressByAccessoryUUID:(id)a3
{
}

- (NSMutableDictionary)dateOfLastDoorbellPressByAccessoryUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDDoorbellPressTracker *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__HMDDoorbellPressTracker_handleCharacteristicsValueUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __73__HMDDoorbellPressTracker_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCharacteristicsValueUpdatedNotification:*(void *)(a1 + 40)];
}

- (void)_handleCharacteristicsValueUpdatedNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDoorbellPressTracker *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_159659);
  v11 = [v10 firstObject];

  if (v11)
  {
    v12 = [v11 accessory];
    os_unfair_lock_lock_with_options();
    v13 = [MEMORY[0x263EFF910] now];
    v14 = [(HMDDoorbellPressTracker *)self dateOfLastDoorbellPressByAccessoryUUID];
    v15 = [v12 uuid];
    [v14 setObject:v13 forKeyedSubscript:v15];

    os_unfair_lock_unlock(&self->_lock);
    context = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [(HMDDoorbellPressTracker *)v16 dateOfLastDoorbellPressByAccessoryUUID];
      v18 = [v12 uuid];
      v19 = [v23 objectForKeyedSubscript:v18];
      v20 = [v12 name];
      v21 = [v12 uuid];
      *(_DWORD *)buf = 138544130;
      v26 = v22;
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2112;
      v30 = v20;
      __int16 v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updated date of last doorbell press to: %@ for doorbell: %@/%@", buf, 0x2Au);
    }
  }
}

uint64_t __74__HMDDoorbellPressTracker__handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 type];
  if ([v3 isEqualToString:*MEMORY[0x263F0C208]])
  {
    id v4 = [v2 service];
    v5 = [v4 type];
    uint64_t v6 = [v5 isEqualToString:*MEMORY[0x263F0D6C0]];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)doorbellPressInDateInterval:(id)a3 doorbellAccessory:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMDDoorbellPressTracker *)self dateOfLastDoorbellPressByAccessoryUUID];
  id v9 = [v7 uuid];
  v10 = [v8 objectForKeyedSubscript:v9];

  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [v7 name];
    v16 = [v7 uuid];
    int v19 = 138544130;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    v24 = v15;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Date of last doorbell press: %@ for doorbell accessory: %@/%@", (uint8_t *)&v19, 0x2Au);
  }
  if (v10) {
    char v17 = [v6 containsDate:v10];
  }
  else {
    char v17 = 0;
  }

  return v17;
}

- (void)stopTrackingPressesForDoorbellAccessory:(id)a3 registration:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMDDoorbellPressTracker *)self registrationsByAccessoryUUID];
  id v9 = [v6 uuid];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [v6 name];
      __int16 v29 = [v6 uuid];
      *(_DWORD *)buf = 138544130;
      id v31 = v27;
      __int16 v32 = 2112;
      uint64_t v33 = v28;
      __int16 v34 = 2112;
      v35 = v29;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@No existing registrations found for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x230FBD990]([v10 removeObject:v7]);
  v12 = self;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = [v6 name];
    v16 = [v6 uuid];
    *(_DWORD *)buf = 138544130;
    id v31 = v14;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2112;
    v35 = v16;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Stopped tracking presses for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);
  }
  if (![v10 count])
  {
    char v17 = [(HMDDoorbellPressTracker *)v12 notificationCenter];
    [v17 removeObserver:v12 name:@"HMDNotificationCharacteristicValueUpdated" object:v6];

    v18 = [(HMDDoorbellPressTracker *)v12 registrationsByAccessoryUUID];
    int v19 = [v6 uuid];
    [v18 removeObjectForKey:v19];

    v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v21 = v12;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = [v6 name];
      __int16 v25 = [v6 uuid];
      *(_DWORD *)buf = 138543874;
      id v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@No more registrations for doorbell accessory: %@/%@", buf, 0x20u);
    }
LABEL_9:
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startTrackingPressesForDoorbellAccessory:(id)a3 registration:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 findCharacteristicType:*MEMORY[0x263F0C208] forServiceType:*MEMORY[0x263F0D6C0]];
  if (v8)
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v9 = [(HMDDoorbellPressTracker *)self registrationsByAccessoryUUID];
    v10 = [v6 uuid];
    v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      HMFGetOSLogHandle();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = [v6 name];
        char v17 = [v6 uuid];
        *(_DWORD *)buf = 138544130;
        id v32 = v15;
        __int16 v33 = 2112;
        __int16 v34 = v16;
        __int16 v35 = 2112;
        __int16 v36 = v17;
        __int16 v37 = 2112;
        id v38 = v7;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Already tracking presses for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);
      }
    }
    else
    {
      v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      v24 = [(HMDDoorbellPressTracker *)self registrationsByAccessoryUUID];
      __int16 v25 = [v6 uuid];
      [v24 setObject:v11 forKeyedSubscript:v25];

      v26 = [(HMDDoorbellPressTracker *)self notificationCenter];
      [v26 addObserver:self selector:sel_handleCharacteristicsValueUpdatedNotification_ name:@"HMDNotificationCharacteristicValueUpdated" object:v6];

      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      HMFGetOSLogHandle();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = [v6 name];
        __int16 v29 = [v6 uuid];
        *(_DWORD *)buf = 138544130;
        id v32 = v27;
        __int16 v33 = 2112;
        __int16 v34 = v28;
        __int16 v35 = 2112;
        __int16 v36 = v29;
        __int16 v37 = 2112;
        id v38 = v7;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Started tracking presses for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);
      }
    }

    [v11 addObject:v7];

    os_unfair_lock_unlock(lock);
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      v22 = [v6 name];
      id v23 = [v6 uuid];
      *(_DWORD *)buf = 138543874;
      id v32 = v21;
      __int16 v33 = 2112;
      __int16 v34 = v22;
      __int16 v35 = 2112;
      __int16 v36 = v23;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Accessory: %@/%@ is not a doorbell", buf, 0x20u);
    }
  }
}

- (HMDDoorbellPressTracker)initWithWorkQueue:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDDoorbellPressTracker;
  id v9 = [(HMDDoorbellPressTracker *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    objc_storeStrong((id *)&v10->_workQueue, a3);
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    dateOfLastDoorbellPressByAccessoryUUID = v10->_dateOfLastDoorbellPressByAccessoryUUID;
    v10->_dateOfLastDoorbellPressByAccessoryUUID = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    registrationsByAccessoryUUID = v10->_registrationsByAccessoryUUID;
    v10->_registrationsByAccessoryUUID = (NSMutableDictionary *)v13;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_159679 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_159679, &__block_literal_global_8_159680);
  }
  id v2 = (void *)logCategory__hmf_once_v14_159681;
  return v2;
}

void __38__HMDDoorbellPressTracker_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v14_159681;
  logCategory__hmf_once_v14_159681 = v0;
}

@end
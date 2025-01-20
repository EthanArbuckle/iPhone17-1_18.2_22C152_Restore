@interface HMDNaturalLightingCurveWriter
+ (id)logCategory;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)supportsDeviceWithCapabilities:(id)a3;
- (HMDLightProfile)lightProfile;
- (HMDLightProfileDataSource)dataSource;
- (HMDNaturalLightingCurveWriter)initWithUUID:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5;
- (HMDNaturalLightingCurveWriter)initWithUUID:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5 dataSource:(id)a6 notificationCenter:(id)a7 timerFactory:(id)a8;
- (HMFTimer)periodicCharacteristicWriteTimer;
- (NSNotificationCenter)notificationCenter;
- (NSString)logIdentifier;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (double)naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold;
- (double)naturalLightingCurveUpdateInterval;
- (id)timerFactory;
- (void)configureWithLightProfile:(id)a3;
- (void)handleActiveTransitionContextUpdated:(id)a3;
- (void)handleCurrentDevicePrimaryResidentChangedWithReason:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)setCurrentDevicePrimaryResident:(BOOL)a3;
- (void)setLightProfile:(id)a3;
- (void)setPeriodicCharacteristicWriteTimer:(id)a3;
- (void)synchronizeCurveWithActiveTransitionContext:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)writeForNaturalLightingEnabledWithReason:(id)a3;
- (void)writeWithNaturalLightingEnabled:(BOOL)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation HMDNaturalLightingCurveWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_periodicCharacteristicWriteTimer, 0);
  objc_destroyWeak((id *)&self->_lightProfile);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setCurrentDevicePrimaryResident:(BOOL)a3
{
  self->_currentDevicePrimaryResident = a3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_currentDevicePrimaryResident;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 88, 1);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 80, 1);
}

- (double)naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold
{
  return self->_naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold;
}

- (double)naturalLightingCurveUpdateInterval
{
  return self->_naturalLightingCurveUpdateInterval;
}

- (void)setPeriodicCharacteristicWriteTimer:(id)a3
{
}

- (HMFTimer)periodicCharacteristicWriteTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLightProfile:(id)a3
{
}

- (HMDLightProfile)lightProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lightProfile);
  return (HMDLightProfile *)WeakRetained;
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  return [a3 supportsNaturalLighting];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDNaturalLightingCurveWriter *)self periodicCharacteristicWriteTimer];

  if (v6 == v4)
  {
    v12 = [(HMDNaturalLightingCurveWriter *)self lightProfile];
    v13 = [v12 settings];
    int v14 = [v13 isNaturalLightingEnabled];

    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Rewriting the characteristic because timer: %@ fired", buf, 0x16u);
      }
      v20 = [NSString stringWithFormat:@"timer expired: %@", v4];
      [(HMDNaturalLightingCurveWriter *)v16 writeForNaturalLightingEnabledWithReason:v20];
    }
    else
    {
      if (v18)
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v23 = v21;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Canceling periodic characteristic writer timer because natural lighting is no longer enabled", buf, 0xCu);
      }
      [(HMDNaturalLightingCurveWriter *)v16 setPeriodicCharacteristicWriteTimer:0];
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(HMDNaturalLightingCurveWriter *)v8 periodicCharacteristicWriteTimer];
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received timer did fire callback for unknown timer. Expected: %@ received: %@", buf, 0x20u);
    }
  }
}

- (void)writeForNaturalLightingEnabledWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDNaturalLightingCurveWriter *)self setPeriodicCharacteristicWriteTimer:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HMDNaturalLightingCurveWriter_writeForNaturalLightingEnabledWithReason___block_invoke;
  v7[3] = &unk_1E6A196E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMDNaturalLightingCurveWriter *)self writeWithNaturalLightingEnabled:1 reason:v6 completion:v7];
}

void __74__HMDNaturalLightingCurveWriter_writeForNaturalLightingEnabledWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      v10 = "%{public}@Failed to update the curve with reason %@:%@";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    v10 = "%{public}@Successfully updated curve with reason %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)synchronizeCurveWithActiveTransitionContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v27 = 138543362;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing curve...", (uint8_t *)&v27, 0xCu);
  }
  v10 = [(HMDNaturalLightingCurveWriter *)v7 lightProfile];
  v11 = [v10 accessory];
  os_log_type_t v12 = [v11 home];

  if (!v12)
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v27 = 138543362;
      uint64_t v28 = v22;
      v23 = "%{public}@Sychronizing curve failed, home is not configured";
      __int16 v24 = v20;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
LABEL_14:
      _os_log_impl(&dword_1D49D5000, v24, v25, v23, (uint8_t *)&v27, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (![(HMDNaturalLightingCurveWriter *)v7 isCurrentDevicePrimaryResident])
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      int v27 = 138543362;
      uint64_t v28 = v22;
      v23 = "%{public}@Skipping synchronizing curve, device is not a primary resident";
      goto LABEL_13;
    }
LABEL_15:

    goto LABEL_16;
  }
  uint32_t v13 = [v10 naturalLightingCurve];
  uint64_t v14 = [v13 checksum];

  int v15 = [v4 transitionChecksum];
  uint64_t v16 = [v15 unsignedLongLongValue];

  __int16 v17 = [v4 transitionChecksum];

  uint64_t v18 = (void *)MEMORY[0x1D9452090]();
  __int16 v19 = v7;
  id v20 = HMFGetOSLogHandle();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v17 && v14 == v16)
  {
    if (v21)
    {
      v22 = HMFGetLogIdentifier();
      int v27 = 138543362;
      uint64_t v28 = v22;
      v23 = "%{public}@Skipping synchronizing curve, transition checksum has not changed";
LABEL_13:
      __int16 v24 = v20;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v21)
  {
    __int16 v26 = HMFGetLogIdentifier();
    int v27 = 138543362;
    uint64_t v28 = v26;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Start sychronizing curve", (uint8_t *)&v27, 0xCu);
  }
  [(HMDNaturalLightingCurveWriter *)v19 writeForNaturalLightingEnabledWithReason:@"curve updated"];
LABEL_16:
}

- (void)writeWithNaturalLightingEnabled:(BOOL)a3 reason:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  v10 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if ([(HMDNaturalLightingCurveWriter *)self isCurrentDevicePrimaryResident])
  {
    v11 = [(HMDNaturalLightingCurveWriter *)self lightProfile];
    os_log_type_t v12 = v11;
    if (v11)
    {
      [v11 setNaturalLightingEnabled:v6 completion:v9];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
      v9[2](v9, v18);
    }
  }
  else
  {
    uint32_t v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping curve write with reason because current device is not a primary resident: %@", (uint8_t *)&v19, 0x16u);
    }
    __int16 v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    v9[2](v9, v17);
  }
}

- (void)handleCurrentDevicePrimaryResidentChangedWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    [(HMDNaturalLightingCurveWriter *)v7 isCurrentDevicePrimaryResident];
    v10 = HMFBooleanToString();
    int v12 = 138543874;
    uint32_t v13 = v9;
    __int16 v14 = 2112;
    int v15 = v10;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling current device primary resident changed: %@ with reason: %@", (uint8_t *)&v12, 0x20u);
  }
  v11 = [(HMDNaturalLightingCurveWriter *)v7 lightProfile];
  if ([(HMDNaturalLightingCurveWriter *)v7 isCurrentDevicePrimaryResident])
  {
    [v11 setNaturalLightingCharacteristicsNotificationEnabled:1 forObserver:v7];
  }
  else
  {
    [v11 setNaturalLightingCharacteristicsNotificationEnabled:0 forObserver:v7];
    [(HMDNaturalLightingCurveWriter *)v7 setPeriodicCharacteristicWriteTimer:0];
  }
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HMDNaturalLightingCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__HMDNaturalLightingCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) lightProfile];
  id v3 = [v2 accessory];
  id v4 = [v3 home];
  uint64_t v5 = [v4 isCurrentDeviceConfirmedPrimaryResident];

  if (v5 != [*(id *)(a1 + 32) isCurrentDevicePrimaryResident])
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) isCurrentDevicePrimaryResident];
      v10 = HMFBooleanToString();
      v11 = HMFBooleanToString();
      int v14 = 138543874;
      int v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      int v19 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device primary changed from: (%@->%@)", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 32) setCurrentDevicePrimaryResident:v5];
    int v12 = *(void **)(a1 + 32);
    uint32_t v13 = [*(id *)(a1 + 40) name];
    [v12 handleCurrentDevicePrimaryResidentChangedWithReason:v13];
  }
}

- (void)handleActiveTransitionContextUpdated:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDNaturalLightingCurveWriter *)self isCurrentDevicePrimaryResident])
  {
    if (v4)
    {
      id v6 = [(HMDNaturalLightingCurveWriter *)self dataSource];
      id v7 = [v6 date];

      id v8 = [v4 startDate];
      uint64_t v9 = [(HMDNaturalLightingCurveWriter *)self dataSource];
      v10 = [v9 date];
      [v10 timeIntervalSinceDate:v8];
      double v12 = v11;

      if (v12 >= 0.0)
      {
        __int16 v26 = [(HMDNaturalLightingCurveWriter *)self dataSource];
        [v26 naturalLightingCurveUpdateInterval];
        double v28 = v27;

        double v29 = v28 - v12;
        if (v28 - v12 <= 0.0)
        {
          v45 = (void *)MEMORY[0x1D9452090]();
          int v14 = self;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = HMFGetLogIdentifier();
            int v51 = 138543874;
            v52 = v47;
            __int16 v53 = 2048;
            double v54 = v12;
            __int16 v55 = 2048;
            double v56 = v28;
            _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Updating curve since time elapsed since transition start is greater than curve update interval %f:%f", (uint8_t *)&v51, 0x20u);
          }
          id v17 = @"transition start is greater than curve update interval";
        }
        else
        {
          double v30 = (double)(unint64_t)[v4 millisecondsElapsedSinceStartDate] / 1000.0;
          double v31 = vabdd_f64(v30, v12);
          v32 = [(HMDNaturalLightingCurveWriter *)self dataSource];
          [v32 naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold];
          double v34 = v33;

          v35 = (void *)MEMORY[0x1D9452090]();
          int v14 = self;
          v36 = HMFGetOSLogHandle();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
          if (v31 < v34)
          {
            if (v37)
            {
              v38 = HMFGetLogIdentifier();
              int v51 = 138543618;
              v52 = v38;
              __int16 v53 = 2048;
              double v54 = v29;
              _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Starting timer for natural lighting curve update: %fs", (uint8_t *)&v51, 0x16u);
            }
            v39 = [(HMDNaturalLightingCurveWriter *)v14 timerFactory];
            v40 = v39[2](v39, 0, v29);
            [(HMDNaturalLightingCurveWriter *)v14 setPeriodicCharacteristicWriteTimer:v40];

            v41 = [(HMDNaturalLightingCurveWriter *)v14 periodicCharacteristicWriteTimer];
            [v41 setDelegate:v14];

            v42 = [(HMDNaturalLightingCurveWriter *)v14 workQueue];
            v43 = [(HMDNaturalLightingCurveWriter *)v14 periodicCharacteristicWriteTimer];
            [v43 setDelegateQueue:v42];

            v44 = [(HMDNaturalLightingCurveWriter *)v14 periodicCharacteristicWriteTimer];
            [v44 resume];

            goto LABEL_25;
          }
          if (v37)
          {
            v48 = HMFGetLogIdentifier();
            v49 = [(HMDNaturalLightingCurveWriter *)v14 dataSource];
            [v49 naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold];
            int v51 = 138544386;
            v52 = v48;
            __int16 v53 = 2048;
            double v54 = v30;
            __int16 v55 = 2048;
            double v56 = v12;
            __int16 v57 = 2048;
            double v58 = v31;
            __int16 v59 = 2048;
            uint64_t v60 = v50;
            _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating curve because accessory time (%fs) and controller time (%fs) difference (%fs) is greater than threshold (%fs)", (uint8_t *)&v51, 0x34u);
          }
          id v17 = @"accessory and controller time difference";
        }
      }
      else
      {
        uint32_t v13 = (void *)MEMORY[0x1D9452090]();
        int v14 = self;
        int v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          __int16 v16 = HMFGetLogIdentifier();
          int v51 = 138543874;
          v52 = v16;
          __int16 v53 = 2112;
          double v54 = *(double *)&v7;
          __int16 v55 = 2112;
          double v56 = *(double *)&v8;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating curve because transition start date is ahead of the current date %@:%@", (uint8_t *)&v51, 0x20u);
        }
        id v17 = @"start date is ahead of the current date";
      }
      [(HMDNaturalLightingCurveWriter *)v14 writeForNaturalLightingEnabledWithReason:v17];
LABEL_25:

      goto LABEL_26;
    }
    id v22 = (void *)MEMORY[0x1D9452090]();
    uint64_t v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v25 = HMFGetLogIdentifier();
      int v51 = 138543618;
      v52 = v25;
      __int16 v53 = 2112;
      double v54 = 0.0;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Stopping characteristic write timer because active transition context is not set: %@", (uint8_t *)&v51, 0x16u);
    }
    [(HMDNaturalLightingCurveWriter *)v23 setPeriodicCharacteristicWriteTimer:0];
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1D9452090]();
    int v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v51 = 138543362;
      v52 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping active transition context update because current device is not primary resident", (uint8_t *)&v51, 0xCu);
    }
  }
LABEL_26:
}

- (void)configureWithLightProfile:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDNaturalLightingCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 accessory];
  id v7 = [v6 home];

  id v8 = (void *)MEMORY[0x1D9452090]([(HMDNaturalLightingCurveWriter *)self setLightProfile:v4]);
  uint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  double v12 = [v7 residentDeviceManager];
  [v12 addDataSource:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__HMDNaturalLightingCurveWriter_configureWithLightProfile___block_invoke;
  v16[3] = &unk_1E6A197F0;
  v16[4] = v9;
  [v12 confirmWithCompletionHandler:v16];
  uint32_t v13 = [(HMDNaturalLightingCurveWriter *)v9 notificationCenter];
  int v14 = [v7 residentDeviceManager];
  [v13 addObserver:v9 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v14];

  int v15 = [(HMDNaturalLightingCurveWriter *)v9 notificationCenter];
  [v15 addObserver:v9 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  -[HMDNaturalLightingCurveWriter setCurrentDevicePrimaryResident:](v9, "setCurrentDevicePrimaryResident:", [v7 isCurrentDeviceConfirmedPrimaryResident]);
  [(HMDNaturalLightingCurveWriter *)v9 handleCurrentDevicePrimaryResidentChangedWithReason:@"Configure"];
}

void __59__HMDNaturalLightingCurveWriter_configureWithLightProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      uint64_t v9 = "%{public}@Failed to confirm primary resident with error: %@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    int v14 = v8;
    uint64_t v9 = "%{public}@Successfully confirmed primary resident";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (HMDNaturalLightingCurveWriter)initWithUUID:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5 dataSource:(id)a6 notificationCenter:(id)a7 timerFactory:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDNaturalLightingCurveWriter;
  __int16 v19 = [(HMDNaturalLightingCurveWriter *)&v25 init];
  if (v19)
  {
    uint64_t v20 = _Block_copy(v18);
    id timerFactory = v19->_timerFactory;
    v19->_id timerFactory = v20;

    objc_storeStrong((id *)&v19->_UUID, a3);
    objc_storeStrong((id *)&v19->_workQueue, a4);
    objc_storeStrong((id *)&v19->_logIdentifier, a5);
    objc_storeStrong((id *)&v19->_dataSource, a6);
    objc_storeStrong((id *)&v19->_notificationCenter, a7);
  }

  return v19;
}

- (HMDNaturalLightingCurveWriter)initWithUUID:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  os_log_type_t v11 = objc_alloc_init(HMDLightProfileDataSource);
  uint32_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v13 = [(HMDNaturalLightingCurveWriter *)self initWithUUID:v10 workQueue:v9 logIdentifier:v8 dataSource:v11 notificationCenter:v12 timerFactory:&__block_literal_global_188178];

  return v13;
}

id __70__HMDNaturalLightingCurveWriter_initWithUUID_workQueue_logIdentifier___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_188184 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_188184, &__block_literal_global_22_188185);
  }
  v2 = (void *)logCategory__hmf_once_v20_188186;
  return v2;
}

uint64_t __44__HMDNaturalLightingCurveWriter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_188186;
  logCategory__hmf_once_v20_188186 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
@interface HMDHomeNaturalLightingContextUpdater
+ (id)logCategory;
- (BOOL)areEncodedBrightnessLevelTransitionPointsValid:(id)a3;
- (BOOL)isDemoModeEnabled;
- (HMDHome)home;
- (HMDHomeNaturalLightingContextUpdater)initWithHome:(id)a3 demoModeEnabled:(BOOL)a4;
- (HMDHomeNaturalLightingContextUpdater)initWithHome:(id)a3 workQueue:(id)a4 demoModeEnabled:(BOOL)a5 logIdentifier:(id)a6 notificationCenter:(id)a7 dataSource:(id)a8;
- (HMDLightProfileDataSource)dataSource;
- (HMDNaturalLightingCurve)curve;
- (NSNotificationCenter)notificationCenter;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve:(id)a3;
- (id)colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve:(id)a3;
- (int64_t)colorTemperatureForTransitionPoint:(id)a3;
- (int64_t)curveMaximumBrightness;
- (int64_t)curveMinimumBrightness;
- (int64_t)timeOfDayForMinimumBrightnessTransitionPoint:(id)a3 maximumBrighnessTransitionPoint:(id)a4;
- (void)configure;
- (void)handleResidentDeviceUpdated:(id)a3;
- (void)initalizeCurve;
- (void)setCurve:(id)a3;
- (void)setCurveMaximumBrightness:(int64_t)a3;
- (void)setCurveMinimumBrightness:(int64_t)a3;
- (void)updateNaturalLightingContext;
@end

@implementation HMDHomeNaturalLightingContextUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curve, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (BOOL)isDemoModeEnabled
{
  return self->_demoModeEnabled;
}

- (void)setCurve:(id)a3
{
}

- (HMDNaturalLightingCurve)curve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 72, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurveMaximumBrightness:(int64_t)a3
{
  self->_curveMaximumBrightness = a3;
}

- (int64_t)curveMaximumBrightness
{
  return self->_curveMaximumBrightness;
}

- (void)setCurveMinimumBrightness:(int64_t)a3
{
  self->_curveMinimumBrightness = a3;
}

- (int64_t)curveMinimumBrightness
{
  return self->_curveMinimumBrightness;
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)updateNaturalLightingContext
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDHomeNaturalLightingContextUpdater *)self home];
  v5 = v4;
  if (!v4)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v35 = 138543362;
      v36 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping updating natural lighting context, home is not set", (uint8_t *)&v35, 0xCu);
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_21;
  }
  char v6 = [v4 isCurrentDeviceConfirmedPrimaryResident];
  BOOL v7 = [(HMDHomeNaturalLightingContextUpdater *)self isDemoModeEnabled];
  if ((v6 & 1) == 0 && !v7)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      HMFBooleanToString();
      v12 = (HMDNaturalLightingContext *)objc_claimAutoreleasedReturnValue();
      v13 = HMFBooleanToString();
      int v35 = 138543874;
      v36 = v11;
      __int16 v37 = 2112;
      v38 = v12;
      __int16 v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping updating natural lighting context, device is primary resident: %@ and demo mode is enabled: %@", (uint8_t *)&v35, 0x20u);

LABEL_8:
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v14 = [(HMDHomeNaturalLightingContextUpdater *)self curve];
  if (v14)
  {
    v15 = [HMDNaturalLightingContext alloc];
    v16 = [(HMDHomeNaturalLightingContextUpdater *)self dataSource];
    v17 = [v16 localTimeZone];
    v18 = [(HMDNaturalLightingContext *)v15 initWithCurve:v14 timeZone:v17];
  }
  else
  {
    v18 = 0;
  }
  v19 = [v5 naturalLightingContext];
  BOOL v20 = [(HMDNaturalLightingContext *)v19 isEqual:v18];
  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      v25 = HMFGetLogIdentifier();
      int v35 = 138543618;
      v36 = v25;
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Skipping updating natural lighting context, since it is already set: %@", (uint8_t *)&v35, 0x16u);
    }
  }
  else
  {
    if (v24)
    {
      v26 = HMFGetLogIdentifier();
      int v35 = 138543618;
      v36 = v26;
      __int16 v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting context to %@", (uint8_t *)&v35, 0x16u);
    }
    v27 = [HMDHomeModel alloc];
    v28 = [v5 uuid];
    v29 = [v5 homeManager];
    v30 = [v29 uuid];
    v31 = [(HMDBackingStoreModelObject *)v27 initWithObjectChangeType:2 uuid:v28 parentUUID:v30];

    [(HMDHomeModel *)v31 setNaturalLightingContext:v18];
    v32 = [v5 backingStore];
    v33 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v34 = [v32 transaction:@"Updating natural lighting context" options:v33];

    [v34 add:v31];
    [v34 run];
  }
LABEL_21:
}

- (int64_t)colorTemperatureForTransitionPoint:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = objc_msgSend(v4, "hmf_numberForKey:", @"ColorTemperature");
  BOOL v7 = v6;
  if (v6 && [v6 integerValue] > 0)
  {
    int64_t v8 = +[HMDNaturalLightingCurve colorTemperatureMiredsFromKelvins:](HMDNaturalLightingCurve, "colorTemperatureMiredsFromKelvins:", [v7 integerValue]);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = @"ColorTemperature";
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness Transition Point: %@ is missing key: %@", (uint8_t *)&v14, 0x20u);
    }
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)timeOfDayForMinimumBrightnessTransitionPoint:(id)a3 maximumBrighnessTransitionPoint:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v6 = (__CFString *)a3;
  BOOL v7 = (__CFString *)a4;
  int64_t v8 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(__CFString *)v6 hmf_numberForKey:@"TimeOfDay"];
  if (v9)
  {
    v10 = [(__CFString *)v7 hmf_numberForKey:@"TimeOfDay"];
    if (v10)
    {
      if ([v9 isEqualToNumber:v10])
      {
        int64_t v11 = [v9 longLongValue];
LABEL_14:

        goto LABEL_15;
      }
      __int16 v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v24 = 138544130;
        v25 = v19;
        __int16 v26 = 2112;
        v27 = @"TimeOfDay";
        __int16 v28 = 2112;
        v29 = v7;
        __int16 v30 = 2112;
        v31 = v6;
        uint64_t v20 = "%{public}@Maximum Brightness Transition Point: %@ key value:%@ doesn't match Minimum Brightness Transition Point: %@";
        v21 = v18;
        uint32_t v22 = 42;
        goto LABEL_12;
      }
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v24 = 138543874;
        v25 = v19;
        __int16 v26 = 2112;
        v27 = v7;
        __int16 v28 = 2112;
        v29 = @"TimeOfDay";
        uint64_t v20 = "%{public}@Maximum Brightness Transition Point: %@ is missing key: %@";
        v21 = v18;
        uint32_t v22 = 32;
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);
      }
    }

    int64_t v11 = -1;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x1D9452090]();
  v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    int v24 = 138543874;
    v25 = v15;
    __int16 v26 = 2112;
    v27 = v6;
    __int16 v28 = 2112;
    v29 = @"TimeOfDay";
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness Transition Point: %@ is missing key: %@", (uint8_t *)&v24, 0x20u);
  }
  int64_t v11 = -1;
LABEL_15:

  return v11;
}

- (id)colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke;
  v25[3] = &unk_1E6A16E90;
  v25[4] = self;
  char v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v25);
  BOOL v7 = objc_msgSend(v6, "hmf_arrayForKey:", @"ColorTemperatureTransitionPoints");
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke_40;
  v24[3] = &unk_1E6A17240;
  v24[4] = self;
  objc_msgSend(v7, "na_filter:", v24);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v8 count] > 2)
  {
    int v14 = [v8 sortedArrayUsingComparator:&__block_literal_global_43_172996];

    v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Validating minimum brightness transition points dictionary", buf, 0xCu);
    }
    if ([(HMDHomeNaturalLightingContextUpdater *)v16 areEncodedBrightnessLevelTransitionPointsValid:v14])
    {
      id v8 = v14;
      v13 = v8;
    }
    else
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v16;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint32_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate minimum brightness transitions points dictionary", buf, 0xCu);
      }
      v13 = 0;
      id v8 = v14;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    int64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = 3;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Color Temperature Transition Points specified for minimum Brightness: %@ are less than %ld", buf, 0x20u);
    }
    v13 = 0;
  }

  return v13;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", @"Brightness");
  v5 = v4;
  if (!v4)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      int v14 = v11;
      __int16 v15 = 2112;
      __int16 v16 = @"Brightness";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing %@ key in %@", (uint8_t *)&v13, 0x20u);
    }
    goto LABEL_8;
  }
  uint64_t v6 = [v4 integerValue];
  if (v6 >= [*(id *)(a1 + 32) curveMaximumBrightness] || objc_msgSend(v5, "integerValue") < 1)
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurveMinimumBrightness:", objc_msgSend(v5, "integerValue"));
  uint64_t v7 = 1;
LABEL_9:

  return v7;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = isKindOfClass & (v3 != 0);
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543874;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      __int16 v16 = @"ColorTemperatureTransitionPoints";
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness, Object: %@ for key: %@ is not of type: NSDictionary", (uint8_t *)&v11, 0x20u);
    }
  }

  return v5;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a2, "hmf_numberForKey:", @"TimeOfDay");
  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"TimeOfDay");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke;
  v25[3] = &unk_1E6A16E90;
  v25[4] = self;
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v25);
  uint64_t v7 = objc_msgSend(v6, "hmf_arrayForKey:", @"ColorTemperatureTransitionPoints");
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke_35;
  v24[3] = &unk_1E6A17240;
  v24[4] = self;
  objc_msgSend(v7, "na_filter:", v24);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v8 count] > 2)
  {
    id v14 = [v8 sortedArrayUsingComparator:&__block_literal_global_39_173004];

    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Validating maximum brightness transition points dictionary", buf, 0xCu);
    }
    if ([(HMDHomeNaturalLightingContextUpdater *)v16 areEncodedBrightnessLevelTransitionPointsValid:v14])
    {
      id v8 = v14;
      __int16 v13 = v8;
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v16;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint32_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate maximum brightness transitions points dictionary", buf, 0xCu);
      }
      __int16 v13 = 0;
      id v8 = v14;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = 3;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Color Temperature Transition Points specified for maximum Brightness: %@ are less than %ld", buf, 0x20u);
    }
    __int16 v13 = 0;
  }

  return v13;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", @"Brightness");
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543874;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      __int16 v15 = @"Brightness";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Missing %@ key in Natural Lighting Curve entry: %@", (uint8_t *)&v12, 0x20u);
    }
    goto LABEL_7;
  }
  if ([v4 integerValue] != 100)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurveMaximumBrightness:", objc_msgSend(v5, "integerValue"));
  uint64_t v6 = 1;
LABEL_8:

  return v6;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = isKindOfClass & (v3 != 0);
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543874;
      int v12 = v9;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      __int16 v16 = @"ColorTemperatureTransitionPoints";
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Maximum Brightness, Object: %@ for key: %@ is not of type: NSDictionary", (uint8_t *)&v11, 0x20u);
    }
  }

  return v5;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a2, "hmf_numberForKey:", @"TimeOfDay");
  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"TimeOfDay");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)areEncodedBrightnessLevelTransitionPointsValid:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = objc_msgSend(v6, "hmf_numberForKey:", @"TimeOfDay");
  if ([v7 isEqualToNumber:&unk_1F2DC9D30])
  {
    id v8 = [v4 lastObject];
    id v9 = objc_msgSend(v8, "hmf_numberForKey:", @"TimeOfDay");
    if ([v9 isEqualToNumber:&unk_1F2DC9D48])
    {
      v10 = objc_msgSend(v6, "hmf_numberForKey:", @"ColorTemperature");
      int v11 = objc_msgSend(v8, "hmf_numberForKey:", @"ColorTemperature");
      char v12 = [v10 isEqualToNumber:v11];
      if ((v12 & 1) == 0)
      {
        context = (void *)MEMORY[0x1D9452090]();
        __int16 v13 = self;
        id v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v27 = v24;
          __int16 v28 = 2112;
          uint64_t v29 = (uint64_t)v10;
          __int16 v30 = 2112;
          uint64_t v31 = v11;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@First transition point color temperature:%@ doesn't match last transition point color temperature: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint32_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2048;
        uint64_t v29 = 86400000;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Last transition point time of day doesn't end at %llums", buf, 0x16u);
      }
      char v12 = 0;
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      __int16 v28 = 2048;
      uint64_t v29 = 0;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@First transition point doesn't begin at %llums", buf, 0x16u);
    }
    char v12 = 0;
  }

  return v12;
}

- (void)initalizeCurve
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v87 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Initializing transitions points for the curve", buf, 0xCu);
  }
  id v8 = [(HMDHomeNaturalLightingContextUpdater *)v5 dataSource];
  id v9 = [v8 naturalLightingCurveResourceFileContent];

  v10 = objc_msgSend(v9, "hmf_arrayForKey:", @"NaturalLightingCurve");
  int v11 = objc_msgSend(v10, "na_filter:", &__block_literal_global_173019);

  if (!v11)
  {
    v42 = (void *)MEMORY[0x1D9452090]();
    v43 = v5;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v87 = v45;
      __int16 v88 = 2112;
      uint64_t v89 = (uint64_t)v9;
      __int16 v90 = 2112;
      uint64_t v91 = @"NaturalLightingCurve";
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Missing natural lighting curve key in resource file content %@:%@", buf, 0x20u);
    }
    goto LABEL_52;
  }
  uint64_t v12 = [v11 count];
  if (v12 != 2)
  {
    uint64_t v46 = v12;
    v42 = (void *)MEMORY[0x1D9452090]();
    v47 = v5;
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v87 = v49;
      __int16 v88 = 2048;
      uint64_t v89 = v46;
      __int16 v90 = 2048;
      uint64_t v91 = 2;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Natural Lighting Curve Brightness Level count: %lu is not equal to supported brightness level count: %lu", buf, 0x20u);
    }
LABEL_52:
    goto LABEL_75;
  }
  __int16 v13 = [(HMDHomeNaturalLightingContextUpdater *)v5 colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve:v11];
  if ([v13 count])
  {
    id v14 = [(HMDHomeNaturalLightingContextUpdater *)v5 colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve:v11];
    if ([v14 count])
    {
      uint64_t v15 = [v14 count];
      if (v15 == [v13 count])
      {
        v71 = v9;
        __int16 v16 = [MEMORY[0x1E4F1CA48] array];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        v72 = v14;
        id obj = v14;
        uint64_t v74 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        if (v74)
        {
          uint64_t v19 = 0;
          uint64_t v75 = *(void *)v82;
          uint64_t v76 = 0;
          v70 = v11;
          v73 = v5;
          while (2)
          {
            uint64_t v20 = 0;
            uint64_t v78 = v19;
            do
            {
              if (*(void *)v82 != v75) {
                objc_enumerationMutation(obj);
              }
              v21 = *(void **)(*((void *)&v81 + 1) + 8 * v20);
              uint64_t v22 = [v13 objectAtIndex:v76 + v20];
              v79 = (void *)v22;
              uint64_t v80 = [(HMDHomeNaturalLightingContextUpdater *)v5 timeOfDayForMinimumBrightnessTransitionPoint:v21 maximumBrighnessTransitionPoint:v22];
              if (v80 < 0)
              {
                v66 = (void *)MEMORY[0x1D9452090]();
                v56 = v5;
                v68 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v57 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  __int16 v88 = 2048;
                  uint64_t v89 = v80;
                  v58 = "%{public}@Invalid time of day for transition point: %lld";
                  goto LABEL_69;
                }
                goto LABEL_70;
              }
              uint64_t v23 = [(HMDHomeNaturalLightingContextUpdater *)v5 colorTemperatureForTransitionPoint:v21];
              if (v23 < 0)
              {
                v66 = (void *)MEMORY[0x1D9452090]();
                v63 = v5;
                v68 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v57 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  __int16 v88 = 2048;
                  uint64_t v89 = v80;
                  v58 = "%{public}@Invalid minimum brightness color temperature value: %lld";
                  goto LABEL_69;
                }
                goto LABEL_70;
              }
              uint64_t v24 = v23;
              uint64_t v25 = [(HMDHomeNaturalLightingContextUpdater *)v5 colorTemperatureForTransitionPoint:v22];
              if (v25 < 0)
              {
                v66 = (void *)MEMORY[0x1D9452090]();
                v64 = v5;
                v68 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v57 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  __int16 v88 = 2048;
                  uint64_t v89 = v80;
                  v58 = "%{public}@Invalid maximum brightness color temperature value: %lld";
                  goto LABEL_69;
                }
                goto LABEL_70;
              }
              uint64_t v26 = v25;
              if (v24 >= v25) {
                uint64_t v27 = v25;
              }
              else {
                uint64_t v27 = v24;
              }
              if (v24 <= v25) {
                uint64_t v28 = v25;
              }
              else {
                uint64_t v28 = v24;
              }
              BOOL v29 = v18 > v27 || v18 == 0;
              if (v29) {
                uint64_t v18 = v27;
              }
              if (v17 < v28 || v17 == 0) {
                uint64_t v17 = v28;
              }
              if (v80 - v78 < 0)
              {
                v66 = (void *)MEMORY[0x1D9452090]();
                v65 = v5;
                v68 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v57 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  __int16 v88 = 2048;
                  uint64_t v89 = v80;
                  v58 = "%{public}@Target completion duration for transition point at %lld is invalid";
                  goto LABEL_69;
                }
LABEL_70:
                int v11 = v70;
                id v9 = v71;

                goto LABEL_71;
              }
              if (v80 == v78)
              {
                [obj firstObject];
                uint64_t v31 = v16;
                v33 = uint64_t v32 = v13;

                BOOL v29 = v21 == v33;
                __int16 v13 = v32;
                __int16 v16 = v31;
                uint64_t v5 = v73;
                if (!v29)
                {
                  v66 = (void *)MEMORY[0x1D9452090]();
                  v67 = v73;
                  v68 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    v57 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v87 = v57;
                    __int16 v88 = 2048;
                    uint64_t v89 = v78;
                    v58 = "%{public}@Target completion duration for non-first transition point at %lld is zero.";
LABEL_69:
                    _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);
                  }
                  goto LABEL_70;
                }
              }
              v34 = objc_msgSend(MEMORY[0x1E4F5BC90], "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:", -[HMDHomeNaturalLightingContextUpdater curveMinimumBrightness](v5, "curveMinimumBrightness"), v24, 100, v26, v80 - v78);
              [v16 addObject:v34];

              ++v20;
              uint64_t v19 = v80;
              uint64_t v78 = v80;
            }
            while (v74 != v20);
            v76 += v20;
            int v11 = v70;
            uint64_t v74 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
            if (v74) {
              continue;
            }
            break;
          }
        }

        if ([v16 count])
        {
          int v35 = [(HMDNaturalLightingCurve *)[HMDMutableNaturalLightingCurve alloc] initWithVersion:1 transitionPoints:v16 minimumBrightness:[(HMDHomeNaturalLightingContextUpdater *)v5 curveMinimumBrightness] maximumBrightness:[(HMDHomeNaturalLightingContextUpdater *)v5 curveMaximumBrightness] minimumColorTemperature:v18 maximumColorTemperature:v17];
          id v9 = v71;
          v36 = objc_msgSend(v71, "hmf_numberForKey:", @"ColorTemperatureValueUpdateInterval");
          uint64_t v37 = [v36 longLongValue];

          if (v37 >= 1) {
            [(HMDNaturalLightingCurve *)v35 setColorTemperatureUpdateIntervalInMilliseconds:v37];
          }
          v38 = objc_msgSend(v71, "hmf_numberForKey:", @"ColorTemperatureNotifyIntervalThreshold");
          uint64_t v39 = [v38 longLongValue];

          id v14 = v72;
          if (v39 >= 1) {
            [(HMDNaturalLightingCurve *)v35 setColorTemperatureNotifyIntervalThresholdInMilliseconds:v39];
          }
          v40 = objc_msgSend(v71, "hmf_numberForKey:", @"ColorTemperatureNotifyValueChangeThreshold");
          uint64_t v41 = [v40 integerValue];

          if (v41 >= 1) {
            [(HMDNaturalLightingCurve *)v35 setColorTemperatureNotifyValueChangeThreshold:v41];
          }
          [(HMDHomeNaturalLightingContextUpdater *)v5 setCurve:v35];
          [(HMDHomeNaturalLightingContextUpdater *)v5 updateNaturalLightingContext];
        }
        else
        {
          v59 = (void *)MEMORY[0x1D9452090]();
          v60 = v5;
          v61 = HMFGetOSLogHandle();
          id v9 = v71;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v62 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v87 = v62;
            _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@No transition points found", buf, 0xCu);
          }
LABEL_71:
          id v14 = v72;
        }
      }
      else
      {
        v50 = (void *)MEMORY[0x1D9452090]();
        v51 = v5;
        v52 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v53 = HMFGetLogIdentifier();
          uint64_t v54 = [v14 count];
          uint64_t v55 = [v13 count];
          *(_DWORD *)buf = 138543874;
          v87 = v53;
          __int16 v88 = 2048;
          uint64_t v89 = v54;
          __int16 v90 = 2048;
          uint64_t v91 = v55;
          _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness Transition Points: %lu don't match maximum Brightness Transition Points: %lu", buf, 0x20u);
        }
      }
    }
  }
LABEL_75:
}

uint64_t __54__HMDHomeNaturalLightingContextUpdater_initalizeCurve__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (void)handleResidentDeviceUpdated:(id)a3
{
  id v4 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDHomeNaturalLightingContextUpdater_handleResidentDeviceUpdated___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __68__HMDHomeNaturalLightingContextUpdater_handleResidentDeviceUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNaturalLightingContext];
}

- (void)configure
{
  uint64_t v3 = [(HMDHomeNaturalLightingContextUpdater *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomeNaturalLightingContextUpdater *)self notificationCenter];
  uint64_t v5 = [(HMDHomeNaturalLightingContextUpdater *)self home];
  uint64_t v6 = [v5 residentDeviceManager];
  [v4 addObserver:self selector:sel_handleResidentDeviceUpdated_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v6];

  uint64_t v7 = [(HMDHomeNaturalLightingContextUpdater *)self notificationCenter];
  [v7 addObserver:self selector:sel_handleResidentDeviceUpdated_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  [(HMDHomeNaturalLightingContextUpdater *)self initalizeCurve];
}

- (HMDHomeNaturalLightingContextUpdater)initWithHome:(id)a3 workQueue:(id)a4 demoModeEnabled:(BOOL)a5 logIdentifier:(id)a6 notificationCenter:(id)a7 dataSource:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDHomeNaturalLightingContextUpdater;
  uint64_t v19 = [(HMDHomeNaturalLightingContextUpdater *)&v24 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v14);
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v20->_dataSource, a8);
    uint64_t v21 = [v16 copy];
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_notificationCenter, a7);
    v20->_demoModeEnabled = a5;
  }

  return v20;
}

- (HMDHomeNaturalLightingContextUpdater)initWithHome:(id)a3 demoModeEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(HMDLightProfileDataSource);
  id v8 = [v6 workQueue];
  id v9 = [v6 name];
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v11 = [(HMDHomeNaturalLightingContextUpdater *)self initWithHome:v6 workQueue:v8 demoModeEnabled:v4 logIdentifier:v9 notificationCenter:v10 dataSource:v7];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t36_173042 != -1) {
    dispatch_once(&logCategory__hmf_once_t36_173042, &__block_literal_global_52_173043);
  }
  id v2 = (void *)logCategory__hmf_once_v37_173044;
  return v2;
}

uint64_t __51__HMDHomeNaturalLightingContextUpdater_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v37_173044;
  logCategory__hmf_once_v37_173044 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
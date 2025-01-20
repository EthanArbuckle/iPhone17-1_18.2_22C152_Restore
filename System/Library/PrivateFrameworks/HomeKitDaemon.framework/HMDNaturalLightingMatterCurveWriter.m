@interface HMDNaturalLightingMatterCurveWriter
+ (id)logCategory;
- (BOOL)isAccessoryColorTemp:(id)a3 closeToCurveColorTemp:(id)a4;
- (BOOL)isDemoMode;
- (BOOL)isTimerRunning;
- (BOOL)naturalLightingAllowed;
- (HMDHAPAccessory)accessory;
- (HMDLightProfile)lightProfile;
- (HMDLightProfileDataSource)dataSource;
- (HMDNaturalLightingCurve)naturalLightingCurve;
- (HMDNaturalLightingMatterCurveWriter)initWithWorkQueue:(id)a3 accessory:(id)a4;
- (HMDNaturalLightingMatterCurveWriter)initWithWorkQueue:(id)a3 accessory:(id)a4 dataSource:(id)a5 notificationCenter:(id)a6 timerFactory:(id)a7;
- (HMFTimer)periodicWriteTimer;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)regularTransitionTime;
- (OS_dispatch_queue)workQueue;
- (id)isNaturalLightingAllowed;
- (id)logIdentifier;
- (id)setNaturalLightingEnabled:(BOOL)a3;
- (id)timerFactory;
- (unsigned)getShortTransitionTimeForAccessoryColorTemp:(id)a3 curveColorTemp:(id)a4;
- (void)checkIfNaturalLightingAllowed;
- (void)configurePostNaturalLightingContext;
- (void)configurePreNaturalLightingContext;
- (void)configureWithLightProfile:(id)a3;
- (void)disableNaturalLightingCurveWithCompletion:(id)a3;
- (void)disableNaturalLightingWithReason:(id)a3 message:(id)a4;
- (void)enableNaturalLightingWithReason:(id)a3;
- (void)enableNaturalLightingWithReason:(id)a3 message:(id)a4;
- (void)enableOrUpdateNaturalLightingCurveWithColorMode:(id)a3 accessoryColorTemp:(id)a4 completion:(id)a5;
- (void)enableOrUpdateNaturalLightingCurveWithCompletion:(id)a3;
- (void)getDemoModeTransitionTime:(id *)a3 newColorTemp:(id *)a4 accessoryColorTemp:(id)a5 colorMode:(id)a6;
- (void)getTransitionTime:(id *)a3 newColorTemp:(id *)a4 accessoryColorTemp:(id)a5 colorMode:(id)a6;
- (void)handleAccessoryConnected:(id)a3;
- (void)handleAccessoryFirmwareVersionChangedNotification:(id)a3;
- (void)handleColorControlAttributeReport:(id)a3;
- (void)handleColorTemperatureAttributes:(id)a3;
- (void)handleHomeNaturalLightingContextUpdated:(id)a3;
- (void)handleMobileAssetsUpdatedNotification:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handleSetNaturalLightingEnabledMessage:(id)a3 lightProfile:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setLightProfile:(id)a3;
- (void)setNaturalLightingAllowed:(BOOL)a3;
- (void)setNaturalLightingCurve:(id)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4;
- (void)setPeriodicWriteTimer:(id)a3;
- (void)setStartUpColorTemperature;
- (void)startPeriodicWriteTimerWithInterval:(id)a3;
- (void)stopPeriodicWriteTimer;
- (void)timerDidFire:(id)a3;
- (void)updateNaturalLightingEnabledFromAttributes;
- (void)updateSettingsIfNaturalLightingSupportedByAccessory;
@end

@implementation HMDNaturalLightingMatterCurveWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_naturalLightingCurve, 0);
  objc_storeStrong((id *)&self->_periodicWriteTimer, 0);
  objc_destroyWeak((id *)&self->_lightProfile);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setNaturalLightingAllowed:(BOOL)a3
{
  self->_naturalLightingAllowed = a3;
}

- (BOOL)naturalLightingAllowed
{
  return self->_naturalLightingAllowed;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNaturalLightingCurve:(id)a3
{
}

- (HMDNaturalLightingCurve)naturalLightingCurve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeriodicWriteTimer:(id)a3
{
}

- (HMFTimer)periodicWriteTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
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
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDNaturalLightingMatterCurveWriter *)self lightProfile];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)handleColorControlAttributeReport:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 path];
  v6 = [v5 attribute];

  v7 = [(HMDNaturalLightingMatterCurveWriter *)self lightProfile];
  int v8 = [v7 isNaturalLightingEnabled];

  if (v8 && [v6 isEqualToNumber:&unk_26E473BB8])
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v20 = [v4 path];
      v13 = [v20 endpoint];
      v19 = [v4 path];
      v14 = [v19 cluster];
      [v4 path];
      v15 = v21 = v9;
      v16 = [v15 attribute];
      v17 = [v4 value];
      *(_DWORD *)buf = 138544386;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2112;
      v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling MTRAttributeReport with endpoint: %@, cluster: %@, attribute: %@, value: %@", buf, 0x34u);

      v9 = v21;
    }

    v18 = [v4 value];
    if ([v18 intValue] != 2) {
      [(HMDNaturalLightingMatterCurveWriter *)v10 disableNaturalLightingWithReason:@"accessory-attribute-unexpected-color-mode" message:0];
    }
  }
}

- (void)handleAccessoryFirmwareVersionChangedNotification:(id)a3
{
  id v4 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__HMDNaturalLightingMatterCurveWriter_handleAccessoryFirmwareVersionChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __89__HMDNaturalLightingMatterCurveWriter_handleAccessoryFirmwareVersionChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling firmware version changed notification", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) checkIfNaturalLightingAllowed];
}

- (void)handleAccessoryConnected:(id)a3
{
  id v4 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMDNaturalLightingMatterCurveWriter_handleAccessoryConnected___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __64__HMDNaturalLightingMatterCurveWriter_handleAccessoryConnected___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) lightProfile];
  id v3 = [*(id *)(a1 + 32) accessory];
  id v4 = [v3 home];
  char v5 = [v4 isCurrentDeviceConfirmedPrimaryResident];

  v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [*(id *)(a1 + 32) accessory];
      v12 = [v11 name];
      [v2 isNaturalLightingSupported];
      v13 = HMFBooleanToString();
      [v2 isNaturalLightingSupported];
      v14 = HMFBooleanToString();
      int v18 = 138544130;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ became connected natural lighting supported:%@ enabled:%@", (uint8_t *)&v18, 0x2Au);
    }
    int v15 = [v2 isNaturalLightingSupported];
    v16 = *(void **)(a1 + 32);
    if (v15) {
      [v16 updateNaturalLightingEnabledFromAttributes];
    }
    else {
      [v16 updateSettingsIfNaturalLightingSupportedByAccessory];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not handling accessory connected notification on non-primary resident", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceHomeUUIDNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v24 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident updated notification", buf, 0xCu);
  }
  v13 = [(HMDNaturalLightingMatterCurveWriter *)v10 accessory];
  v14 = [v13 home];
  int v15 = [v14 uuid];
  char v16 = objc_msgSend(v8, "hmf_isEqualToUUID:", v15);

  if (v16)
  {
    v17 = [(HMDNaturalLightingMatterCurveWriter *)v10 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HMDNaturalLightingMatterCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v10;
    dispatch_async(v17, block);
  }
  else
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v10;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v21;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring resident update for other home: %@", buf, 0x16u);
    }
  }
}

void __79__HMDNaturalLightingMatterCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) lightProfile];
  id v3 = [v2 accessory];
  id v4 = [v3 home];
  int v5 = [v4 isCurrentDeviceConfirmedPrimaryResident];

  if (v5)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      v10 = [*(id *)(a1 + 32) lightProfile];
      [v10 isNaturalLightingSupported];
      v11 = HMFBooleanToString();
      v12 = [*(id *)(a1 + 32) lightProfile];
      [v12 isNaturalLightingEnabled];
      v13 = HMFBooleanToString();
      int v14 = 138543874;
      int v15 = v9;
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device became primary resident, natural lighting supported:%@ enabled:%@", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 32) checkIfNaturalLightingAllowed];
  }
}

- (void)handleMobileAssetsUpdatedNotification:(id)a3
{
  id v4 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDNaturalLightingMatterCurveWriter_handleMobileAssetsUpdatedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __77__HMDNaturalLightingMatterCurveWriter_handleMobileAssetsUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling mobile assets updated notification", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) checkIfNaturalLightingAllowed];
}

- (void)handleHomeNaturalLightingContextUpdated:(id)a3
{
  id v4 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDNaturalLightingMatterCurveWriter_handleHomeNaturalLightingContextUpdated___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDNaturalLightingMatterCurveWriter_handleHomeNaturalLightingContextUpdated___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling home natural lighting context updated notification", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) configurePostNaturalLightingContext];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v19 = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Periodic write timer fired", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v9 = [(HMDNaturalLightingMatterCurveWriter *)v6 workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(HMDNaturalLightingMatterCurveWriter *)v6 periodicWriteTimer];

  if (v10 != v4)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v15 = [(HMDNaturalLightingMatterCurveWriter *)v12 periodicWriteTimer];
      int v19 = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received timer did fire callback for unknown timer. Expected: %@ received: %@", (uint8_t *)&v19, 0x20u);

LABEL_10:
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  __int16 v16 = [(HMDNaturalLightingMatterCurveWriter *)v6 accessory];
  v17 = [v16 naturalLightingEnabled];
  char v18 = [v17 BOOLValue];

  if ((v18 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Not acting on timer expiry because natural lighting is not enabled", (uint8_t *)&v19, 0xCu);
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  [(HMDNaturalLightingMatterCurveWriter *)v6 enableNaturalLightingWithReason:@"periodic-timer-expired"];
LABEL_12:
}

- (void)stopPeriodicWriteTimer
{
}

- (void)startPeriodicWriteTimerWithInterval:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (double)[v4 longValue];
  v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v9;
    __int16 v18 = 2048;
    double v19 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting Periodic write timer for %f seconds", (uint8_t *)&v16, 0x16u);
  }
  id v10 = [(HMDNaturalLightingMatterCurveWriter *)v7 timerFactory];
  v11 = v10[2](v10, 0, v5);
  [(HMDNaturalLightingMatterCurveWriter *)v7 setPeriodicWriteTimer:v11];

  v12 = [(HMDNaturalLightingMatterCurveWriter *)v7 periodicWriteTimer];
  [v12 setDelegate:v7];

  v13 = [(HMDNaturalLightingMatterCurveWriter *)v7 workQueue];
  int v14 = [(HMDNaturalLightingMatterCurveWriter *)v7 periodicWriteTimer];
  [v14 setDelegateQueue:v13];

  int v15 = [(HMDNaturalLightingMatterCurveWriter *)v7 periodicWriteTimer];
  [v15 resume];
}

- (void)getDemoModeTransitionTime:(id *)a3 newColorTemp:(id *)a4 accessoryColorTemp:(id)a5 colorMode:(id)a6
{
  uint64_t v8 = 1800000 * (++getDemoModeTransitionTime_newColorTemp_accessoryColorTemp_colorMode__count % 0x30u) + 2000;
  uint64_t v9 = [(HMDNaturalLightingMatterCurveWriter *)self naturalLightingCurve];
  objc_msgSend(v9, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(&unk_26E473BA0, "integerValue"), v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  *a3 = [NSNumber numberWithUnsignedShort:20];
}

- (BOOL)isAccessoryColorTemp:(id)a3 closeToCurveColorTemp:(id)a4
{
  id v5 = a4;
  int v6 = [a3 shortValue];
  int v7 = [v5 shortValue];

  unsigned int v8 = v6 - v7;
  if (v6 - v7 < 0) {
    unsigned int v8 = v7 - v6;
  }
  return v8 < 0xB;
}

- (NSNumber)regularTransitionTime
{
  uint64_t v2 = (unsigned __int16)(arc4random_uniform(0x78u) + 1800);
  id v3 = NSNumber;
  return (NSNumber *)[v3 numberWithUnsignedShort:v2];
}

- (unsigned)getShortTransitionTimeForAccessoryColorTemp:(id)a3 curveColorTemp:(id)a4
{
  id v5 = a4;
  int v6 = [a3 shortValue];
  int v7 = [v5 shortValue];

  unsigned __int16 v8 = v6 - v7;
  if (v6 - v7 < 0) {
    unsigned __int16 v8 = v7 - v6;
  }
  unsigned int v9 = v8 / 0xAu;
  if (v9 >= 0xA) {
    return 10;
  }
  else {
    return v9;
  }
}

- (void)getTransitionTime:(id *)a3 newColorTemp:(id *)a4 accessoryColorTemp:(id)a5 colorMode:(id)a6
{
  id v30 = a5;
  id v10 = a6;
  v11 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  v12 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  v13 = [v12 date];
  int v14 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  int v15 = [v14 localTimeZone];
  uint64_t v16 = [v11 millisecondsElapsedSinceStartOfDayWithDate:v13 timeZone:v15];

  v17 = [(HMDNaturalLightingMatterCurveWriter *)self naturalLightingCurve];
  __int16 v18 = objc_msgSend(v17, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(&unk_26E473BA0, "integerValue"), v16);

  LODWORD(v17) = [v10 intValue];
  if (v17 != 2)
  {
    double v19 = [NSNumber numberWithUnsignedShort:0];
    goto LABEL_5;
  }
  if ([(HMDNaturalLightingMatterCurveWriter *)self isAccessoryColorTemp:v30 closeToCurveColorTemp:v18])
  {
    double v19 = [(HMDNaturalLightingMatterCurveWriter *)self regularTransitionTime];
LABEL_5:
    *a3 = v19;
    double v20 = 0.0;
    goto LABEL_7;
  }
  uint64_t v21 = [(HMDNaturalLightingMatterCurveWriter *)self getShortTransitionTimeForAccessoryColorTemp:v30 curveColorTemp:v18];
  *a3 = [NSNumber numberWithUnsignedShort:v21];
  double v20 = (double)v21;
LABEL_7:
  __int16 v22 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  __int16 v23 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  id v24 = [v23 date];
  uint64_t v25 = [v24 dateByAddingTimeInterval:v20];
  id v26 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  uint64_t v27 = [v26 localTimeZone];
  uint64_t v28 = [v22 millisecondsElapsedSinceStartOfDayWithDate:v25 timeZone:v27];

  v29 = [(HMDNaturalLightingMatterCurveWriter *)self naturalLightingCurve];
  objc_msgSend(v29, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(&unk_26E473BA0, "integerValue"), v28);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)enableOrUpdateNaturalLightingCurveWithColorMode:(id)a3 accessoryColorTemp:(id)a4 completion:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v39 = a5;
  id v10 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    int v15 = [(HMDNaturalLightingMatterCurveWriter *)v12 accessory];
    uint64_t v16 = [v15 name];
    *(_DWORD *)buf = 138544130;
    v52 = v14;
    __int16 v53 = 2112;
    id v54 = v8;
    __int16 v55 = 2112;
    id v56 = v9;
    __int16 v57 = 2112;
    v58 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Enabling natural lighting, colorMode: %@ accessoryColorTemp: %@ for accessory: %@", buf, 0x2Au);
  }
  v17 = [(HMDNaturalLightingMatterCurveWriter *)v12 accessory];
  v40 = v8;
  if ([(HMDNaturalLightingMatterCurveWriter *)v12 isDemoMode])
  {
    id v47 = 0;
    id v48 = 0;
    [(HMDNaturalLightingMatterCurveWriter *)v12 getDemoModeTransitionTime:&v48 newColorTemp:&v47 accessoryColorTemp:v9 colorMode:v8];
    id v18 = v48;
    id v19 = v47;
    double v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = v12;
    __int16 v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    __int16 v23 = HMFGetLogIdentifier();
    id v24 = [v17 name];
    *(_DWORD *)buf = 138544386;
    v52 = v23;
    __int16 v53 = 2112;
    id v54 = v19;
    __int16 v55 = 2112;
    id v56 = v18;
    __int16 v57 = 2112;
    v58 = v24;
    __int16 v59 = 2112;
    id v60 = v9;
    uint64_t v25 = "%{public}@Demo mode: Calculated new color temp: %@ transition time: %@ for accessory: %@ with color temp: %@";
  }
  else
  {
    id v49 = 0;
    id v50 = 0;
    [(HMDNaturalLightingMatterCurveWriter *)v12 getTransitionTime:&v50 newColorTemp:&v49 accessoryColorTemp:v9 colorMode:v8];
    id v18 = v50;
    id v19 = v49;
    double v20 = (void *)MEMORY[0x230FBD990]();
    id v26 = v12;
    __int16 v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    __int16 v23 = HMFGetLogIdentifier();
    id v24 = [v17 name];
    *(_DWORD *)buf = 138544386;
    v52 = v23;
    __int16 v53 = 2112;
    id v54 = v19;
    __int16 v55 = 2112;
    id v56 = v18;
    __int16 v57 = 2112;
    v58 = v24;
    __int16 v59 = 2112;
    id v60 = v9;
    uint64_t v25 = "%{public}@Calculated new color temp: %@ transition time: %@ for accessory: %@ with color temp: %@";
  }
  _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, v25, buf, 0x34u);

LABEL_9:
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", 10 * objc_msgSend(v18, "unsignedIntValue"));
  uint64_t v28 = [v17 chipAccessoryServer];
  v29 = v28;
  if (v28)
  {
    id v30 = [v28 identifier];
    v31 = [v17 hapInstanceId];
    uint64_t v32 = [v17 matchingHAPAccessoryWithServerIdentifier:v30 instanceID:v31];

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke;
    v41[3] = &unk_264A2EED0;
    v41[4] = v12;
    v33 = v39;
    id v46 = v39;
    id v42 = v19;
    id v43 = v27;
    id v44 = v9;
    id v45 = v18;
    [v29 fetchColorControlClusterForHapAccessory:v32 completionHandler:v41];
  }
  else
  {
    v34 = (void *)MEMORY[0x230FBD990]();
    v35 = v12;
    v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v37;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@chipAccessoryServer is nil", buf, 0xCu);
    }
    uint64_t v32 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    v38 = [(HMDNaturalLightingMatterCurveWriter *)v35 regularTransitionTime];
    v33 = v39;
    (*((void (**)(id, void *, void *))v39 + 2))(v39, v32, v38);
  }
}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1[4];
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v15 = [a1[4] accessory];
      uint64_t v16 = [v15 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);
    }
    v17 = [a1[4] workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_66;
    block[3] = &unk_264A2F870;
    id v18 = a1[9];
    block[4] = a1[4];
    id v26 = v18;
    dispatch_async(v17, block);

    id v10 = v26;
  }
  else
  {
    id v8 = a1[5];
    id v9 = a1[6];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_2;
    v19[3] = &unk_264A2EEA8;
    v19[4] = a1[4];
    id v20 = a1[7];
    id v21 = a1[5];
    id v22 = a1[6];
    id v23 = a1[8];
    id v24 = a1[9];
    [v5 moveToCustomColorTemperatureValue:v8 transitionTime:v9 completionHandler:v19];

    id v10 = v20;
  }
}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_66(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:59];
  id v3 = [*(id *)(a1 + 32) regularTransitionTime];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) accessory];
    v11 = [v10 name];
    *(_DWORD *)buf = 138544642;
    id v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    __int16 v29 = v11;
    __int16 v30 = 2112;
    id v31 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed setting color temperature: [%@ -> %@] with transitionTime: %@ on accessory: %@ with error: %@", buf, 0x3Eu);
  }
  id v12 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_67;
  block[3] = &unk_264A2EE80;
  id v17 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v18 = v3;
  id v19 = v13;
  id v14 = v3;
  dispatch_async(v12, block);
}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_67(uint64_t a1)
{
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue") + 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)enableOrUpdateNaturalLightingCurveWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  id v6 = [v5 chipAccessoryServer];
  if (v6)
  {
    int v7 = [v5 chipAccessoryServer];
    uint64_t v8 = [v7 identifier];
    uint64_t v9 = [v5 hapInstanceId];
    id v10 = [v5 matchingHAPAccessoryWithServerIdentifier:v8 instanceID:v9];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke;
    v16[3] = &unk_264A2EE08;
    v16[4] = self;
    id v17 = v4;
    [v6 fetchColorControlClusterForHapAccessory:v10 completionHandler:v16];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@chipAccessoryServer is nil", buf, 0xCu);
    }
    id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    uint64_t v15 = [(HMDNaturalLightingMatterCurveWriter *)v12 regularTransitionTime];
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v10, v15);
  }
}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 32) accessory];
      uint64_t v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);
    }
    uint64_t v16 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_62;
    block[3] = &unk_264A2F870;
    id v17 = *(id *)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v21 = v17;
    dispatch_async(v16, block);

    uint64_t v9 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2;
    v18[3] = &unk_264A2EE58;
    uint64_t v8 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v8;
    [v5 readColorModeAndColorTemperatureWithCompletion:v18];
    uint64_t v9 = v19;
  }
}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_62(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:59];
  id v3 = [*(id *)(a1 + 32) regularTransitionTime];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 32) accessory];
      uint64_t v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      __int16 v29 = v15;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to read color mode and temp from accessory: %@ with error: %@", buf, 0x20u);
    }
    uint64_t v16 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_63;
    block[3] = &unk_264A2F870;
    id v17 = *(id *)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v25 = v17;
    dispatch_async(v16, block);

    id v18 = v25;
  }
  else
  {
    id v19 = [*(id *)(a1 + 32) workQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2_64;
    v20[3] = &unk_264A2EE30;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v7;
    id v22 = v8;
    id v23 = *(id *)(a1 + 40);
    dispatch_async(v19, v20);

    id v18 = v21;
  }
}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:59];
  id v3 = [*(id *)(a1 + 32) regularTransitionTime];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

uint64_t __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableOrUpdateNaturalLightingCurveWithColorMode:*(void *)(a1 + 40) accessoryColorTemp:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)disableNaturalLightingCurveWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  id v6 = [v5 chipAccessoryServer];
  if (v6)
  {
    id v7 = [v5 chipAccessoryServer];
    id v8 = [v7 identifier];
    id v9 = [v5 hapInstanceId];
    id v10 = [v5 matchingHAPAccessoryWithServerIdentifier:v8 instanceID:v9];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke;
    v16[3] = &unk_264A2EE08;
    v16[4] = self;
    id v17 = v4;
    [v6 fetchColorControlClusterForHapAccessory:v10 completionHandler:v16];
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@chipAccessoryServer is nil", buf, 0xCu);
    }
    id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    uint64_t v15 = [(HMDNaturalLightingMatterCurveWriter *)v12 regularTransitionTime];
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v10, v15);
  }
}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 32) accessory];
      uint64_t v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);
    }
    uint64_t v16 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_59;
    block[3] = &unk_264A2F870;
    id v17 = *(id *)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v21 = v17;
    dispatch_async(v16, block);

    id v9 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_2;
    v18[3] = &unk_264A2EDE0;
    id v8 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v8;
    [v5 stopMoveToColorTemperatureCommandWithCompletion:v18];
    id v9 = v19;
  }
}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_59(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:59];
  id v3 = [*(id *)(a1 + 32) regularTransitionTime];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopped moving color temperature with error: %@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_61;
  block[3] = &unk_264A2EE80;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v10;
  id v15 = v9;
  id v11 = v3;
  dispatch_async(v8, block);
}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_61(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) regularTransitionTime];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v6);

  if (v4) {
    [(HMDNaturalLightingMatterCurveWriter *)self enableOrUpdateNaturalLightingCurveWithCompletion:v7];
  }
  else {
    [(HMDNaturalLightingMatterCurveWriter *)self disableNaturalLightingCurveWithCompletion:v7];
  }
}

- (void)setStartUpColorTemperature
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  id v5 = NSNumber;
  id v6 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "naturalLightingStartUpColorTemperature"));

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v4 name];
    *(_DWORD *)buf = 138543874;
    id v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v7;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting startUpColorTemperature:%@ on accessory: %@", buf, 0x20u);
  }
  id v13 = [v4 chipAccessoryServer];
  uint64_t v14 = [v13 identifier];
  id v15 = [v4 hapInstanceId];
  uint64_t v16 = [v4 matchingHAPAccessoryWithServerIdentifier:v14 instanceID:v15];

  id v17 = [v4 chipAccessoryServer];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke;
  v19[3] = &unk_264A2EDB8;
  v19[4] = v9;
  id v20 = v7;
  id v18 = v7;
  [v17 fetchColorControlClusterForHapAccessory:v16 completionHandler:v19];
}

void __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 32) accessory];
      uint64_t v14 = [v13 name];
      *(_DWORD *)buf = 138543618;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@", buf, 0x16u);
    }
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke_57;
    v15[3] = &unk_264A2F370;
    id v8 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v8;
    [v5 writeStartUpColorTemperature:v16 completion:v15];
  }
}

void __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) accessory];
    id v10 = [v9 name];
    int v11 = 138544130;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed setting startup color temperature: %@ on accessory: %@ with error: %@", (uint8_t *)&v11, 0x2Au);
  }
}

- (void)updateSettingsIfNaturalLightingSupportedByAccessory
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  id v5 = [v4 home];
  id v6 = v5;
  if (!v4 || !v5)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v15;
      id v16 = "%{public}@Not updating natural lighting settings because accessory or home is nil";
      __int16 v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v17, v18, v16, buf, 0xCu);
LABEL_11:
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([v5 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v15;
      id v16 = "%{public}@Not updating natural lighting settings yet because current device is not a primary resident";
      __int16 v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (![(HMDNaturalLightingMatterCurveWriter *)self naturalLightingAllowed])
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    __int16 v15 = HMFGetLogIdentifier();
    uint64_t v19 = [v4 uuid];
    *(_DWORD *)buf = 138543618;
    __int16 v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v19;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating natural lighting settings because natural lighting is not allowed for this accessory: %@", buf, 0x16u);

    goto LABEL_11;
  }
  id v7 = [v4 chipAccessoryServer];
  uint64_t v8 = [v7 identifier];
  id v9 = [v4 hapInstanceId];
  id v10 = [v4 matchingHAPAccessoryWithServerIdentifier:v8 instanceID:v9];

  int v11 = [v4 chipAccessoryServer];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke;
  v20[3] = &unk_264A2ED90;
  v20[4] = self;
  id v21 = &unk_26E473B70;
  id v22 = &unk_26E473B88;
  [v11 fetchColorControlClusterForHapAccessory:v10 completionHandler:v20];

LABEL_13:
}

void __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      __int16 v15 = [*(id *)(a1 + 32) accessory];
      id v16 = [v15 name];
      *(_DWORD *)buf = 138543618;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke_55;
    v17[3] = &unk_264A2ED68;
    id v18 = *(id *)(a1 + 32);
    id v10 = [v18 workQueue];
    [v5 supportsColorTemperatureRangeWithMinColorTemperature:v8 maxColorTemperature:v9 completion:v17 queue:v10];
  }
}

void __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke_55(uint64_t a1, char a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = HMFBooleanToString();
      id v12 = [*(id *)(a1 + 32) accessory];
      __int16 v13 = [v12 name];
      int v14 = 138544130;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed reading color temperature support: %@ with error: %@ from accessory: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) lightProfile];
    [v6 updateSettingsWithNaturalLightingSupported:1];

    [*(id *)(a1 + 32) updateNaturalLightingEnabledFromAttributes];
  }
}

- (void)handleColorTemperatureAttributes:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 colorMode];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v4 shortDescription];
    int v22 = 138543618;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Color temperature attributes read from accessory: %@", (uint8_t *)&v22, 0x16u);
  }
  if (v5 && [v5 intValue] != 2)
  {
    [(HMDNaturalLightingMatterCurveWriter *)v7 disableNaturalLightingWithReason:@"accessory-attribute-colorMode-change" message:0];
    goto LABEL_16;
  }
  int v11 = [v4 remainingTime];
  id v12 = [(HMDNaturalLightingMatterCurveWriter *)v7 accessory];
  __int16 v13 = [v12 naturalLightingEnabled];
  int v14 = [v13 BOOLValue];

  if (v14 && v11 && [v11 unsignedShortValue])
  {
    __int16 v15 = @"naturalLightingEnabled";
LABEL_13:
    [(HMDNaturalLightingMatterCurveWriter *)v7 enableNaturalLightingWithReason:v15];
    goto LABEL_14;
  }
  if (v14)
  {
    __int16 v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = v7;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      __int16 v20 = [(HMDNaturalLightingMatterCurveWriter *)v17 accessory];
      __int16 v21 = [v20 name];
      int v22 = 138543618;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      __int16 v25 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is enabled and remaining time is 0, yet enabling again on accessory: %@", (uint8_t *)&v22, 0x16u);
    }
    __int16 v15 = @"naturalLightingEnabled-zero-remainingtime";
    goto LABEL_13;
  }
LABEL_14:

LABEL_16:
}

- (void)updateNaturalLightingEnabledFromAttributes
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  id v5 = [v4 home];
  id v6 = v5;
  if (!v4 || !v5)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v22 = v15;
      __int16 v16 = "%{public}@Not updating natural lighting enabled because accessory or home is nil";
      __int16 v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v17, v18, v16, buf, 0xCu);
LABEL_11:
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([v5 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v22 = v15;
      __int16 v16 = "%{public}@Not updating natural lighting settings yet because current device is not a primary resident";
      __int16 v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (![(HMDNaturalLightingMatterCurveWriter *)self naturalLightingAllowed])
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    __int16 v15 = HMFGetLogIdentifier();
    id v19 = [v4 uuid];
    *(_DWORD *)buf = 138543618;
    int v22 = v15;
    __int16 v23 = 2112;
    __int16 v24 = v19;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating natural lighting settings because natural lighting is not allowed for this accessory: %@", buf, 0x16u);

    goto LABEL_11;
  }
  id v7 = [v4 chipAccessoryServer];
  id v8 = [v7 identifier];
  uint64_t v9 = [v4 hapInstanceId];
  id v10 = [v4 matchingHAPAccessoryWithServerIdentifier:v8 instanceID:v9];

  int v11 = [v4 chipAccessoryServer];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke;
  v20[3] = &unk_264A2ED40;
  v20[4] = self;
  [v11 fetchColorControlClusterForHapAccessory:v10 completionHandler:v20];

LABEL_13:
}

void __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v14 = [*(id *)(a1 + 32) accessory];
      __int16 v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      id v19 = v13;
      __int16 v20 = 2112;
      __int16 v21 = v15;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Reading color temperature attributes from accessory", buf, 0xCu);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke_40;
    v16[3] = &unk_264A2ED18;
    id v17 = *(id *)(a1 + 32);
    id v12 = [v17 workQueue];
    [v5 readColorTemperatureAttributesWithCompletion:v16 queue:v12];
  }
}

void __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to read color temperature attributes with error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) handleColorTemperatureAttributes:v5];
  }
}

- (void)disableNaturalLightingWithReason:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNaturalLightingMatterCurveWriter *)self lightProfile];
  char v9 = [v8 isNaturalLightingEnabled];
  if (v7) {
    char v10 = 1;
  }
  else {
    char v10 = v9;
  }
  int v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Disabling natural lighting with reason: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v12);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __80__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingWithReason_message___block_invoke;
    v19[3] = &unk_264A2ECC8;
    objc_copyWeak(&v22, (id *)buf);
    id v20 = v8;
    id v21 = v7;
    [(HMDNaturalLightingMatterCurveWriter *)v12 setNaturalLightingEnabled:0 completion:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v14)
    {
      __int16 v16 = HMFGetLogIdentifier();
      id v17 = [v8 uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is already disabled for lightProfile: %@ reason: %@", buf, 0x20u);
    }
    os_log_type_t v18 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [0 respondWithError:v18];
  }
}

void __80__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingWithReason_message___block_invoke(id *a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    [a1[4] updateSettingsWithNaturalLightingEnabled:0];
    uint64_t v8 = [WeakRetained stopPeriodicWriteTimer];
    if (a1[5])
    {
      uint64_t v20 = *MEMORY[0x263F0D018];
      char v9 = [a1[4] settings];
      char v10 = encodeRootObjectForIncomingXPCMessage(v9, 0);
      v21[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

      [a1[5] respondWithPayload:v11];
    }
    id v12 = (void *)MEMORY[0x230FBD990](v8);
    id v13 = WeakRetained;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v15;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Disabled natural lighting with error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)enableNaturalLightingWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNaturalLightingMatterCurveWriter *)self lightProfile];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Enabling natural lighting with reason: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason___block_invoke;
  v11[3] = &unk_264A2ECF0;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v5;
  id v12 = v10;
  [(HMDNaturalLightingMatterCurveWriter *)v7 setNaturalLightingEnabled:1 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __71__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543874;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Enabled natural lighting completed with error: %@ transitionTime: %@", (uint8_t *)&v12, 0x20u);
    }
    if (!v5) {
      [*(id *)(a1 + 32) updateSettingsWithNaturalLightingEnabled:1];
    }
    [v9 startPeriodicWriteTimerWithInterval:v6];
  }
}

- (void)enableNaturalLightingWithReason:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDNaturalLightingMatterCurveWriter *)self lightProfile];
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Enabling natural lighting with reason: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v10);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason_message___block_invoke;
  v15[3] = &unk_264A2ECC8;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = v7;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  [(HMDNaturalLightingMatterCurveWriter *)v10 setNaturalLightingEnabled:1 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __79__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason_message___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Enabled natural lighting completed with error: %@ transitionTime: %@", buf, 0x20u);
    }
    id v12 = a1[5];
    if (v5)
    {
      [v12 updateSettingsWithNaturalLightingEnabled:0];
      [v9 stopPeriodicWriteTimer];
      [a1[4] respondWithError:v5];
    }
    else
    {
      [v12 updateSettingsWithNaturalLightingEnabled:1];
      id v15 = objc_msgSend(a1[5], "settings", *MEMORY[0x263F0D018]);
      id v16 = encodeRootObjectForIncomingXPCMessage(v15, 0);
      id v19 = v16;
      id v17 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

      [a1[4] respondWithPayload:v17];
      [v9 setStartUpColorTemperature];
      [v9 startPeriodicWriteTimerWithInterval:v6];
    }
  }
  else
  {
    id v13 = a1[4];
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v13 respondWithError:v14];
  }
}

- (BOOL)isTimerRunning
{
  uint64_t v2 = [(HMDNaturalLightingMatterCurveWriter *)self periodicWriteTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isDemoMode
{
  uint64_t v2 = [(HMDNaturalLightingMatterCurveWriter *)self dataSource];
  BOOL v3 = [v2 naturalLightingStartUpColorTemperature] == 123;

  return v3;
}

- (void)handleSetNaturalLightingEnabledMessage:(id)a3 lightProfile:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v6 messagePayload];
    int v28 = 138543618;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received message to set matter natural lighting setting: %@", (uint8_t *)&v28, 0x16u);
  }
  id v14 = [(HMDNaturalLightingMatterCurveWriter *)v10 accessory];
  id v15 = [v14 home];
  id v16 = v15;
  if (!v14 || !v15)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v10;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", (uint8_t *)&v28, 0xCu);
    }
    __int16 v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = 20;
    goto LABEL_14;
  }
  if (([v15 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    __int16 v24 = v10;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot enable natural lighting because this device is not primary resident", (uint8_t *)&v28, 0xCu);
    }
    __int16 v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = 48;
LABEL_14:
    __int16 v27 = [v21 hmErrorWithCode:v22];
    [v6 respondWithError:v27];

    goto LABEL_15;
  }
  if ([v6 BOOLForKey:*MEMORY[0x263F0D008]]) {
    [(HMDNaturalLightingMatterCurveWriter *)v10 enableNaturalLightingWithReason:@"XPCMessagge" message:v6];
  }
  else {
    [(HMDNaturalLightingMatterCurveWriter *)v10 disableNaturalLightingWithReason:@"XPCMessagge" message:v6];
  }
LABEL_15:
}

- (id)setNaturalLightingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = [(HMDNaturalLightingMatterCurveWriter *)self lightProfile];
  if ([v5 isNaturalLightingEnabled] == v3)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = (void *)v15;
      id v17 = @"disabled";
      if (v3) {
        id v17 = @"enabled";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v15;
      __int16 v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@setNaturalLightingEnabled is already %@", buf, 0x16u);
    }
    uint64_t v18 = (void *)MEMORY[0x263F42538];
    id v19 = [v5 uniqueIdentifier];
    uint64_t v20 = [v19 UUIDString];
    __int16 v30 = v20;
    __int16 v21 = [NSNumber numberWithBool:1];
    id v31 = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v6 = [v18 futureWithValue:v22];
  }
  else
  {
    id v29 = 0;
    id v6 = [MEMORY[0x263F42538] futureWithPromise:&v29];
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      HMFBooleanToString();
      int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = (uint64_t)v10;
      __int16 v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling setNaturalLightingEnabled with enabled: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v8);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __65__HMDNaturalLightingMatterCurveWriter_setNaturalLightingEnabled___block_invoke;
    v24[3] = &unk_264A2ECA0;
    objc_copyWeak(&v27, (id *)buf);
    id v25 = v29;
    id v26 = v5;
    BOOL v28 = v3;
    [(HMDNaturalLightingMatterCurveWriter *)v8 setNaturalLightingEnabled:v3 completion:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

void __65__HMDNaturalLightingMatterCurveWriter_setNaturalLightingEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v8 = [NSNumber numberWithBool:v5 == 0];
    id v9 = [*(id *)(a1 + 40) uniqueIdentifier];
    id v10 = [v9 UUIDString];
    __int16 v24 = v10;
    v25[0] = v8;
    int v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = WeakRetained;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v15;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@setNaturalLightingEnabled finished with response: %@ error: %@", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 32) fulfillWithValue:v11];
    if (v5 || !*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 40) updateSettingsWithNaturalLightingEnabled:0];
      [v13 stopPeriodicWriteTimer];
    }
    else
    {
      [*(id *)(a1 + 40) updateSettingsWithNaturalLightingEnabled:1];
      if ([v6 longValue]) {
        [v13 startPeriodicWriteTimerWithInterval:v6];
      }
    }
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v16 rejectWithError:v17];
  }
}

- (id)isNaturalLightingAllowed
{
  BOOL v3 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  id v4 = [v3 home];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F42520]);
    id v6 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
    id v7 = (void *)[v5 initWithQueue:v6];

    uint64_t v8 = (void *)MEMORY[0x263F42538];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__HMDNaturalLightingMatterCurveWriter_isNaturalLightingAllowed__block_invoke;
    v12[3] = &unk_264A2EC78;
    id v13 = v4;
    id v14 = v3;
    id v9 = [v8 inContext:v7 perform:v12];
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F42538];
    id v7 = [NSNumber numberWithBool:0];
    id v9 = [v10 futureWithValue:v7];
  }

  return v9;
}

void __63__HMDNaturalLightingMatterCurveWriter_isNaturalLightingAllowed__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) isAccessoryCertifiedForNaturalLighting:*(void *)(a1 + 40)];
  if (v1)
  {
    uint64_t v2 = v1;
  }
  else
  {
    BOOL v3 = (HMDNaturalLightingMatterCurveWriter *)_HMFPreconditionFailure();
    [(HMDNaturalLightingMatterCurveWriter *)v3 checkIfNaturalLightingAllowed];
  }
}

- (void)checkIfNaturalLightingAllowed
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  if (v3)
  {
    SEL v4 = [(HMDNaturalLightingMatterCurveWriter *)self isNaturalLightingAllowed];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__HMDNaturalLightingMatterCurveWriter_checkIfNaturalLightingAllowed__block_invoke;
    v12[3] = &unk_264A2EC28;
    void v12[4] = self;
    id v13 = v3;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__HMDNaturalLightingMatterCurveWriter_checkIfNaturalLightingAllowed__block_invoke_22;
    v10[3] = &unk_264A2EC50;
    v10[4] = self;
    id v11 = v13;
    id v5 = (id)[v4 then:v12 orRecover:v10];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Not handling natural lighting allowed because accessory is nil", buf, 0xCu);
    }
  }
}

uint64_t __68__HMDNaturalLightingMatterCurveWriter_checkIfNaturalLightingAllowed__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 BOOLValue];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) uuid];
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      int v18 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is allowed for this accessory: %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) setNaturalLightingAllowed:1];
    [*(id *)(a1 + 32) updateSettingsIfNaturalLightingSupportedByAccessory];
  }
  else
  {
    if (v8)
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) uuid];
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      int v18 = v12;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is not allowed for this accessory: %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) setNaturalLightingAllowed:0];
    id v13 = [*(id *)(a1 + 32) lightProfile];
    [v13 updateSettingsWithNaturalLightingSupported:0];
  }
  return 1;
}

uint64_t __68__HMDNaturalLightingMatterCurveWriter_checkIfNaturalLightingAllowed__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    BOOL v8 = [*(id *)(a1 + 40) uuid];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to check if natural lighting is allowed for this accessory: %@", (uint8_t *)&v10, 0x16u);
  }

  return 1;
}

- (void)configurePostNaturalLightingContext
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  int v4 = [v3 home];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = v7;
  if (v3 && v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v29 = 138543362;
      __int16 v30 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@configurePostNaturalLightingContext", (uint8_t *)&v29, 0xCu);
    }
    int v10 = [v4 naturalLightingContext];
    id v11 = [v10 curve];

    if (v11)
    {
      __int16 v12 = -[HMDNaturalLightingCurve initWithCurve:minimumColorTemperature:maximumColorTemperature:]([HMDNaturalLightingCurve alloc], "initWithCurve:minimumColorTemperature:maximumColorTemperature:", v11, [v11 minimumColorTemperature], objc_msgSend(v11, "maximumColorTemperature"));
      [(HMDNaturalLightingMatterCurveWriter *)v6 setNaturalLightingCurve:v12];

      id v13 = [(HMDNaturalLightingMatterCurveWriter *)v6 naturalLightingCurve];

      if (v13)
      {
        uint64_t v14 = [(HMDNaturalLightingMatterCurveWriter *)v6 notificationCenter];
        [v14 addObserver:v6 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

        int v15 = [(HMDNaturalLightingMatterCurveWriter *)v6 notificationCenter];
        [v15 addObserver:v6 selector:sel_handleAccessoryConnected_ name:@"HMDAccessoryConnectedNotification" object:v3];

        uint64_t v16 = [v3 bridge];
        __int16 v17 = [(HMDNaturalLightingMatterCurveWriter *)v6 notificationCenter];
        int v18 = v17;
        if (v16) {
          uint64_t v19 = v16;
        }
        else {
          uint64_t v19 = v3;
        }
        [v17 addObserver:v6 selector:sel_handleAccessoryFirmwareVersionChangedNotification_ name:@"HMDAccessoryFirmwareVersionUpdatedNotification" object:v19];

        __int16 v20 = [(HMDNaturalLightingMatterCurveWriter *)v6 notificationCenter];
        __int16 v21 = [v4 homeManager];
        __int16 v22 = [v21 mobileAssetManager];
        [v20 addObserver:v6 selector:sel_handleMobileAssetsUpdatedNotification_ name:@"HMDMobileAssetManagerFoundUpdateNotification" object:v22];

        [(HMDNaturalLightingMatterCurveWriter *)v6 checkIfNaturalLightingAllowed];
        goto LABEL_20;
      }
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = v6;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        int v29 = 138543362;
        __int16 v30 = v27;
        BOOL v28 = "%{public}@Failed to initialize the curve points";
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = v6;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        int v29 = 138543362;
        __int16 v30 = v27;
        BOOL v28 = "%{public}@configurePostNaturalLightingContext failed because curve is nil";
LABEL_18:
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v29, 0xCu);
      }
    }

LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    int v29 = 138543362;
    __int16 v30 = v23;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@configurePostNaturalLightingContext failed because accessory or home is nil", (uint8_t *)&v29, 0xCu);
  }
LABEL_21:
}

- (void)configurePreNaturalLightingContext
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  int v4 = [v3 home];

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@configurePreNaturalLightingContext, wait for natural lighting context", (uint8_t *)&v12, 0xCu);
    }
    int v10 = [(HMDNaturalLightingMatterCurveWriter *)v6 notificationCenter];
    [v10 addObserver:v6 selector:sel_handleHomeNaturalLightingContextUpdated_ name:@"HMDHomeNaturalLightingContextUpdatedNotification" object:v4];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@configurePreNaturalLightingContext failed because home is nil", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)configureWithLightProfile:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNaturalLightingMatterCurveWriter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDNaturalLightingMatterCurveWriter *)self accessory];
  uint64_t v7 = [v6 home];
  BOOL v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = (void *)MEMORY[0x230FBD990]([(HMDNaturalLightingMatterCurveWriter *)self setLightProfile:v4]);
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      id v13 = [v4 uniqueIdentifier];
      uint64_t v14 = [(HMDNaturalLightingMatterCurveWriter *)v10 accessory];
      int v15 = [v14 uuid];
      [(HMDNaturalLightingMatterCurveWriter *)v10 isDemoMode];
      HMFBooleanToString();
      uint64_t v16 = v23 = v9;
      *(_DWORD *)buf = 138544130;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      int v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring matter light profile: %@, accessory: %@ demoMode: %@ ", buf, 0x2Au);

      id v9 = v23;
    }

    __int16 v17 = [v8 naturalLightingContext];
    int v18 = [v17 curve];

    if (v18) {
      [(HMDNaturalLightingMatterCurveWriter *)v10 configurePostNaturalLightingContext];
    }
    else {
      [(HMDNaturalLightingMatterCurveWriter *)v10 configurePreNaturalLightingContext];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Not configuring matter light profile because accessory or home is nil", buf, 0xCu);
    }
  }
}

- (HMDNaturalLightingMatterCurveWriter)initWithWorkQueue:(id)a3 accessory:(id)a4 dataSource:(id)a5 notificationCenter:(id)a6 timerFactory:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDNaturalLightingMatterCurveWriter;
  int v18 = [(HMDNaturalLightingMatterCurveWriter *)&v22 init];
  if (v18)
  {
    uint64_t v19 = _Block_copy(v17);
    id timerFactory = v18->_timerFactory;
    v18->_id timerFactory = v19;

    objc_storeStrong((id *)&v18->_workQueue, a3);
    objc_storeWeak((id *)&v18->_accessory, v14);
    objc_storeStrong((id *)&v18->_dataSource, a5);
    objc_storeStrong((id *)&v18->_notificationCenter, a6);
    v18->_naturalLightingAllowed = 0;
  }

  return v18;
}

- (HMDNaturalLightingMatterCurveWriter)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = objc_alloc_init(HMDLightProfileDataSource);
  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  int v10 = [(HMDNaturalLightingMatterCurveWriter *)self initWithWorkQueue:v7 accessory:v6 dataSource:v8 notificationCenter:v9 timerFactory:&__block_literal_global_266980];

  return v10;
}

id __67__HMDNaturalLightingMatterCurveWriter_initWithWorkQueue_accessory___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t68 != -1) {
    dispatch_once(&logCategory__hmf_once_t68, &__block_literal_global_81_266987);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v69;
  return v2;
}

void __50__HMDNaturalLightingMatterCurveWriter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v69;
  logCategory__hmf_once_v69 = v0;
}

@end
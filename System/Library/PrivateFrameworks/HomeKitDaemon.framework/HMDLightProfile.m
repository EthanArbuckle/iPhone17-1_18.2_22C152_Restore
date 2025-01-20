@interface HMDLightProfile
+ (id)logCategory;
- (BOOL)enableNaturalLightingCharacteristicNotificationsForObserver:(id)a3;
- (BOOL)isNaturalLightingEnabled;
- (BOOL)isNaturalLightingSupported;
- (BOOL)shouldRetrySetNaturalLightingEnabledWithError:(id)a3;
- (BOOL)supportsCHIP;
- (BOOL)updateActiveTransitionCountWithCharacteristic:(id)a3;
- (BOOL)updateEnabledCharacteristicsNotifications;
- (BOOL)updateNaturalLightingCurve;
- (HMDCharacteristic)brightnessCharacteristic;
- (HMDCharacteristic)colorTemperatureCharacteristic;
- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener;
- (HMDHAPAccessory)hapAccessory;
- (HMDLightProfile)initWithUUID:(id)a3 workQueue:(id)a4 lightService:(id)a5 accessory:(id)a6 characteristicsAvailabilityListener:(id)a7 naturalLightingCurveWriter:(id)a8 dataSource:(id)a9;
- (HMDLightProfile)initWithUUID:(id)a3 workQueue:(id)a4 lightService:(id)a5 accessory:(id)a6 matterCurveWriter:(id)a7 dataSource:(id)a8;
- (HMDLightProfile)initWithWorkQueue:(id)a3 lightService:(id)a4 accessory:(id)a5;
- (HMDLightProfileDataSource)dataSource;
- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContext;
- (HMDNaturalLightingCurve)naturalLightingCurve;
- (HMDNaturalLightingCurveWriter)naturalLightingCurveWriter;
- (HMDNaturalLightingEnabledRetryContext)naturalLightingEnabledRetryContext;
- (HMDNaturalLightingMatterCurveWriter)matterCurveWriter;
- (HMDService)service;
- (HMLightProfileSettings)settings;
- (NSDate)lastNaturalLightingCurveUpdateDate;
- (NSDate)lastNaturalLightingEnabledDate;
- (NSDate)lastNaturalLightingUsedDate;
- (NSDate)mostRecentNaturalLightingEnabledDate;
- (NSDate)mostRecentNaturalLightingUsedDate;
- (NSHashTable)characteristicValueObservers;
- (NSSet)availableCharacteristics;
- (NSSet)notificationEnabledCharacteristics;
- (NSSet)readCharacteristicRequests;
- (NSSet)readCharacteristics;
- (NSString)clientIdentifier;
- (id)availableCharacteristicWithType:(id)a3 fromChangedObjects:(id)a4;
- (id)setNaturalLightingEnabledForMatterLightProfile:(BOOL)a3;
- (id)updateSettingsWithReadCharacteristicResponsePayload:(id)a3 error:(id *)a4;
- (unint64_t)supportedFeatures;
- (unsigned)activeTransitionsCount;
- (void)_handleAccessoryCharacteristicsChanged:(id)a3;
- (void)callSetNaturalLightingEnabledCompletion:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)disableNaturalLightingCharacteristicNotificationsForObserver:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchNaturalLightingEnabledWithCompletion:(id)a3;
- (void)handleAccessoryCharacteristicsChanged:(id)a3;
- (void)handleAccessoryNaturalLightingEnabledDidChangeNotification:(id)a3;
- (void)handleAccessorySupportsNaturalLightingDidChangeNotification:(id)a3;
- (void)handleAccessoryUnconfigured:(id)a3;
- (void)handleColorControlAttributeReport:(id)a3;
- (void)handleFetchNaturalLightColorTemperatureForBrightnessMessage:(id)a3;
- (void)handleHomeDidDisableCharacteristicNotification:(id)a3;
- (void)handleHomeDidEnableCharacteristicNotification:(id)a3;
- (void)handleHomeNaturalLightingContextUpdated:(id)a3;
- (void)handleSetNaturalLightingEnabled:(BOOL)a3;
- (void)handleSetNaturalLightingEnabledMessage:(id)a3;
- (void)handleSetNaturalLightingEnabledMessageForMatterAccessory:(id)a3;
- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4;
- (void)notifyClientsOfUpdatedSettingsWithPreviousSettings:(id)a3;
- (void)readCharacteristics:(id)a3;
- (void)readNaturalLightingCharacteristicsWithReason:(id)a3;
- (void)readNaturalLightingCharacteristicsWithReason:(id)a3 completion:(id)a4;
- (void)registerForMessages;
- (void)resetNaturalLightingEnabledRetryContext;
- (void)retrySetNaturalLightingEnabledWithContext:(id)a3 error:(id)a4;
- (void)setActiveTransitionsCount:(unsigned __int8)a3;
- (void)setBrightnessCharacteristic:(id)a3;
- (void)setCharacteristicValueObservers:(id)a3;
- (void)setColorTemperatureCharacteristic:(id)a3;
- (void)setHapAccessory:(id)a3;
- (void)setLastNaturalLightingCurveUpdateDate:(id)a3;
- (void)setLastNaturalLightingEnabledDate:(id)a3;
- (void)setLastNaturalLightingUsedDate:(id)a3;
- (void)setNaturalLightingActiveTransitionContext:(id)a3;
- (void)setNaturalLightingCharacteristicsNotificationEnabled:(BOOL)a3 forObserver:(id)a4;
- (void)setNaturalLightingCurve:(id)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4;
- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4 retryContext:(id)a5;
- (void)setNaturalLightingEnabled:(BOOL)a3 shouldRetryOnFailure:(BOOL)a4 completion:(id)a5;
- (void)setNaturalLightingEnabledRetryContext:(id)a3;
- (void)setNaturalLightingSupported:(BOOL)a3;
- (void)setNotificationEnabledCharacteristics:(id)a3;
- (void)setReadCharacteristics:(id)a3;
- (void)setSupportedFeatures:(unint64_t)a3;
- (void)synchronizeCurveToAccessory;
- (void)updateNaturalLightingEnabledForCharacteristic:(id)a3;
- (void)updateSettingsWithCharacteristics:(id)a3;
- (void)updateSettingsWithNaturalLightingEnabled:(BOOL)a3;
- (void)updateSettingsWithNaturalLightingSupported:(BOOL)a3;
- (void)updateSupportedFeaturesWithCharacteristics:(id)a3;
@end

@implementation HMDLightProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterCurveWriter, 0);
  objc_storeStrong((id *)&self->_characteristicValueObservers, 0);
  objc_storeStrong((id *)&self->_naturalLightingEnabledRetryContext, 0);
  objc_storeStrong((id *)&self->_readCharacteristics, 0);
  objc_storeStrong((id *)&self->_naturalLightingActiveTransitionContext, 0);
  objc_storeStrong((id *)&self->_lastNaturalLightingCurveUpdateDate, 0);
  objc_storeStrong((id *)&self->_colorTemperatureCharacteristic, 0);
  objc_storeStrong((id *)&self->_brightnessCharacteristic, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastNaturalLightingUsedDate, 0);
  objc_storeStrong((id *)&self->_lastNaturalLightingEnabledDate, 0);
  objc_storeStrong((id *)&self->_naturalLightingCurveWriter, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_characteristicsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_notificationEnabledCharacteristics, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_naturalLightingCurve, 0);
}

- (HMDNaturalLightingMatterCurveWriter)matterCurveWriter
{
  return (HMDNaturalLightingMatterCurveWriter *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCharacteristicValueObservers:(id)a3
{
}

- (NSHashTable)characteristicValueObservers
{
  return (NSHashTable *)objc_getProperty(self, a2, 200, 1);
}

- (void)setActiveTransitionsCount:(unsigned __int8)a3
{
  self->_activeTransitionsCount = a3;
}

- (unsigned)activeTransitionsCount
{
  return self->_activeTransitionsCount;
}

- (void)setNaturalLightingEnabledRetryContext:(id)a3
{
}

- (HMDNaturalLightingEnabledRetryContext)naturalLightingEnabledRetryContext
{
  return (HMDNaturalLightingEnabledRetryContext *)objc_getProperty(self, a2, 192, 1);
}

- (void)setReadCharacteristics:(id)a3
{
}

- (NSSet)readCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 184, 1);
}

- (void)setNaturalLightingActiveTransitionContext:(id)a3
{
}

- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContext
{
  return (HMDNaturalLightingActiveTransitionContext *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastNaturalLightingCurveUpdateDate:(id)a3
{
}

- (NSDate)lastNaturalLightingCurveUpdateDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setColorTemperatureCharacteristic:(id)a3
{
}

- (HMDCharacteristic)colorTemperatureCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBrightnessCharacteristic:(id)a3
{
}

- (HMDCharacteristic)brightnessCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 152, 1);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastNaturalLightingUsedDate:(id)a3
{
}

- (NSDate)lastNaturalLightingUsedDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastNaturalLightingEnabledDate:(id)a3
{
}

- (NSDate)lastNaturalLightingEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (HMDNaturalLightingCurveWriter)naturalLightingCurveWriter
{
  return (HMDNaturalLightingCurveWriter *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHapAccessory:(id)a3
{
}

- (HMDHAPAccessory)hapAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSupportedFeatures:(unint64_t)a3
{
  self->_supportedFeatures = a3;
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setNotificationEnabledCharacteristics:(id)a3
{
}

- (NSSet)notificationEnabledCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNaturalLightingCurve:(id)a3
{
}

- (HMDNaturalLightingCurve)naturalLightingCurve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNaturalLightingSupported:(BOOL)a3
{
  self->_naturalLightingSupported = a3;
}

- (BOOL)isNaturalLightingSupported
{
  return self->_naturalLightingSupported;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  self->_naturalLightingEnabled = a3;
}

- (BOOL)isNaturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (void)readCharacteristics:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_185);
  v6 = [(HMDLightProfile *)self hapAccessory];
  v7 = [v6 home];

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending read requests to read characteristics from the accessory: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v9);
    v13 = [(HMDAccessoryProfile *)v9 description];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__HMDLightProfile_readCharacteristics___block_invoke_186;
    v15[3] = &unk_264A2D490;
    objc_copyWeak(&v16, (id *)buf);
    [v7 readCharacteristicValues:v5 source:7 sourceForLogging:v13 qualityOfService:-1 withCompletionHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home is not configured on the accessory", buf, 0xCu);
    }
  }
}

void __39__HMDLightProfile_readCharacteristics___block_invoke_186(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

HMDCharacteristicRequest *__39__HMDLightProfile_readCharacteristics___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDCharacteristicRequest requestWithCharacteristic:a2];
}

- (id)setNaturalLightingEnabledForMatterLightProfile:(BOOL)a3
{
  v5 = [(HMDLightProfile *)self matterCurveWriter];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F42520]);
    v7 = [(HMDAccessoryProfile *)self workQueue];
    v8 = (void *)[v6 initWithQueue:v7];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__HMDLightProfile_setNaturalLightingEnabledForMatterLightProfile___block_invoke;
    v13[3] = &unk_264A2D448;
    v13[4] = self;
    BOOL v14 = a3;
    v9 = [MEMORY[0x263F42538] inContext:v8 perform:v13];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F42538];
    v11 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v9 = [v10 futureWithError:v11];
  }
  return v9;
}

void __66__HMDLightProfile_setNaturalLightingEnabledForMatterLightProfile___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) matterCurveWriter];
  id v3 = [v2 setNaturalLightingEnabled:*(unsigned __int8 *)(a1 + 40)];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = (HMDLightProfile *)_HMFPreconditionFailure();
    [(HMDLightProfile *)v5 handleColorControlAttributeReport:v7];
  }
}

- (void)handleColorControlAttributeReport:(id)a3
{
  id v4 = a3;
  v5 = [(HMDLightProfile *)self matterCurveWriter];

  if (v5)
  {
    SEL v6 = [(HMDAccessoryProfile *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__HMDLightProfile_handleColorControlAttributeReport___block_invoke;
    v7[3] = &unk_264A2F820;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __53__HMDLightProfile_handleColorControlAttributeReport___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) matterCurveWriter];
  [v2 handleColorControlAttributeReport:*(void *)(a1 + 40)];
}

- (void)updateSettingsWithNaturalLightingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  SEL v6 = [(HMDLightProfile *)self hapAccessory];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    v11 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@updateSettingsWithNaturalLightingEnabled naturalLightingEnabled: %@", buf, 0x16u);
  }
  v12 = [(HMDLightProfile *)v8 settings];
  if ([(HMDLightProfile *)v8 isNaturalLightingEnabled] != v3)
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    BOOL v14 = v8;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      [(HMDLightProfile *)v14 isNaturalLightingEnabled];
      v17 = HMFBooleanToString();
      v18 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v33 = v16;
      __int16 v34 = 2112;
      v35 = v17;
      __int16 v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating naturalLightingEnabled from: %@ to: %@", buf, 0x20u);
    }
    __int16 v19 = [v6 home];
    if ([v19 isCurrentDeviceConfirmedPrimaryResident])
    {
      id v20 = [v6 naturalLightingEnabled];
      int v21 = [v20 BOOLValue];

      if (v21 == v3) {
        goto LABEL_10;
      }
      __int16 v19 = [NSNumber numberWithBool:v3];
      id v22 = (id)[v6 saveNaturalLightingEnabled:v19];
    }

LABEL_10:
    [(HMDLightProfile *)v14 setNaturalLightingEnabled:v3];
    uint64_t v23 = [(HMDLightProfile *)v14 notifyClientsOfUpdatedSettingsWithPreviousSettings:v12];
    if (v3)
    {
      v24 = (void *)MEMORY[0x230FBD990](v23);
      v25 = v14;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Reading color temperature after natural lighting enabled", buf, 0xCu);
      }
      v28 = [(HMDLightProfile *)v25 service];
      v29 = [v28 findCharacteristicWithType:*MEMORY[0x263F0BFF8]];

      if (v29)
      {
        v31 = v29;
        v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
        [(HMDLightProfile *)v25 readCharacteristics:v30];
      }
    }
  }
}

- (void)updateSettingsWithNaturalLightingSupported:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  SEL v6 = [(HMDLightProfile *)self settings];
  id v7 = [(HMDLightProfile *)self settings];
  char v8 = [v7 supportedFeatures];

  if (((v8 & 1) == 0) == v3)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = HMFBooleanToString();
      int v19 = 138543618;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating supported features with natural lighting supported: %@", (uint8_t *)&v19, 0x16u);
    }
    [(HMDLightProfile *)v10 setSupportedFeatures:v3];
    [(HMDLightProfile *)v10 setNaturalLightingSupported:v3];
    [(HMDLightProfile *)v10 notifyClientsOfUpdatedSettingsWithPreviousSettings:v6];
    BOOL v14 = [(HMDLightProfile *)v10 hapAccessory];
    v15 = [v14 supportsNaturalLighting];
    int v16 = [v15 BOOLValue];

    if (v16 != v3)
    {
      v17 = [NSNumber numberWithBool:v3];
      id v18 = (id)[v14 saveSupportsNaturalLighting:v17];
    }
  }
}

- (void)handleSetNaturalLightingEnabledMessageForMatterAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HMDLightProfile *)self hapAccessory];
  SEL v6 = [v5 home];

  if ([v6 isCurrentDeviceConfirmedPrimaryResident])
  {
    id v7 = [(HMDLightProfile *)self matterCurveWriter];

    if (!v7)
    {
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v4 respondWithError:v11];

      goto LABEL_6;
    }
    char v8 = [(HMDLightProfile *)self matterCurveWriter];
    [v8 handleSetNaturalLightingEnabledMessage:v4 lightProfile:self];
  }
  else
  {
    char v8 = (void *)[v4 mutableCopy];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__HMDLightProfile_handleSetNaturalLightingEnabledMessageForMatterAccessory___block_invoke;
    v12[3] = &unk_264A2D420;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    [v8 setResponseHandler:v12];
    v9 = [(HMDAccessoryProfile *)self uniqueIdentifier];
    v10 = [(HMDAccessoryProfile *)self workQueue];
    [v6 redispatchToResidentMessage:v8 target:v9 responseQueue:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

LABEL_6:
}

void __76__HMDLightProfile_handleSetNaturalLightingEnabledMessageForMatterAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v13 respondWithError:v14];
LABEL_15:

    goto LABEL_16;
  }
  if (!v5)
  {
    id v14 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x263F0D018]);
    id v27 = 0;
    v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v27];
    id v16 = v27;
    if (v15)
    {
      v17 = (void *)MEMORY[0x230FBD990](objc_msgSend(WeakRetained, "updateSettingsWithNaturalLightingEnabled:", objc_msgSend(v15, "isNaturalLightingEnabled")));
      id v18 = WeakRetained;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v20 = v25 = v16;
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully updated natural lighting settings to: %@", buf, 0x16u);

        id v16 = v25;
      }

      [*(id *)(a1 + 32) respondWithPayload:v6];
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = WeakRetained;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = v26 = v21;
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        __int16 v30 = 2112;
        id v31 = v16;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode natural lighting settings: %@", buf, 0x16u);

        __int16 v21 = v26;
      }

      [*(id *)(a1 + 32) respondWithError:v16];
    }

    goto LABEL_15;
  }
  char v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543874;
    v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle message: %@ with error: %@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) respondWithError:v5];
LABEL_16:
}

- (BOOL)supportsCHIP
{
  id v2 = [(HMDLightProfile *)self hapAccessory];
  char v3 = [v2 supportsCHIP];

  return v3;
}

- (void)handleAccessoryNaturalLightingEnabledDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [(HMDAccessoryProfile *)self workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__HMDLightProfile_handleAccessoryNaturalLightingEnabledDidChangeNotification___block_invoke;
  v9[3] = &unk_264A2F820;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __78__HMDLightProfile_handleAccessoryNaturalLightingEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  char v3 = [v2 naturalLightingContext];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) settings];
    id v5 = [*(id *)(a1 + 32) naturalLightingEnabled];
    uint64_t v6 = [v5 BOOLValue];

    if (v6 != [*(id *)(a1 + 40) isNaturalLightingEnabled])
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 40);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        v11 = HMFBooleanToString();
        int v18 = 138543618;
        int v19 = v10;
        __int16 v20 = 2112;
        __int16 v21 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling notification to update naturalLightingEnabled: %@", (uint8_t *)&v18, 0x16u);
      }
      [*(id *)(a1 + 40) setNaturalLightingEnabled:v6];
      [*(id *)(a1 + 40) notifyClientsOfUpdatedSettingsWithPreviousSettings:v4];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 40);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 32) naturalLightingEnabled];
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138543874;
      int v19 = v15;
      __int16 v20 = 2112;
      __int16 v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@naturalLightingEnabled: %@ did change for accessory: %@ but context is not present", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)handleAccessorySupportsNaturalLightingDidChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if ([v7 supportsCHIP] && (_os_feature_enabled_impl() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling SupportsNaturalLighting change for matter accessory", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [(HMDAccessoryProfile *)self workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __79__HMDLightProfile_handleAccessorySupportsNaturalLightingDidChangeNotification___block_invoke;
    v13[3] = &unk_264A2F820;
    id v14 = v7;
    v15 = self;
    dispatch_async(v8, v13);
  }
}

void __79__HMDLightProfile_handleAccessorySupportsNaturalLightingDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  char v3 = [v2 naturalLightingContext];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) settings];
    id v5 = [*(id *)(a1 + 40) settings];
    char v6 = [v5 supportedFeatures];

    id v7 = [*(id *)(a1 + 32) supportsNaturalLighting];
    uint64_t v8 = [v7 BOOLValue];

    if (((((v6 & 1) == 0) ^ v8) & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 40);
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        id v13 = HMFBooleanToString();
        int v20 = 138543618;
        __int16 v21 = v12;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling notification to update supported features with natural lighting supported: %@", (uint8_t *)&v20, 0x16u);
      }
      [*(id *)(a1 + 40) setSupportedFeatures:v8];
      [*(id *)(a1 + 40) setNaturalLightingSupported:v8];
      [*(id *)(a1 + 40) notifyClientsOfUpdatedSettingsWithPreviousSettings:v4];
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 40);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [*(id *)(a1 + 32) supportsNaturalLighting];
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = 138543874;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@supportsNaturalLighting: %@ did change for accessory: %@ but context is not present", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)handleHomeNaturalLightingContextUpdated:(id)a3
{
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDLightProfile_handleHomeNaturalLightingContextUpdated___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __59__HMDLightProfile_handleHomeNaturalLightingContextUpdated___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) updateNaturalLightingCurve])
  {
    id v2 = [*(id *)(a1 + 32) settings];
    char v3 = [*(id *)(a1 + 32) hapAccessory];
    uint64_t v4 = [v3 home];
    id v5 = (void *)v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 32);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v26 = 138543362;
        id v27 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      v11 = [v3 supportsNaturalLighting];
      objc_msgSend(*(id *)(a1 + 32), "setNaturalLightingSupported:", objc_msgSend(v11, "BOOLValue"));

      objc_msgSend(*(id *)(a1 + 32), "setSupportedFeatures:", objc_msgSend(*(id *)(a1 + 32), "isNaturalLightingSupported"));
      v12 = [v3 naturalLightingEnabled];
      objc_msgSend(*(id *)(a1 + 32), "setNaturalLightingEnabled:", objc_msgSend(v12, "BOOLValue"));

      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 32);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        [*(id *)(a1 + 32) isNaturalLightingSupported];
        uint64_t v18 = HMFBooleanToString();
        [*(id *)(a1 + 32) isNaturalLightingEnabled];
        uint64_t v19 = HMFBooleanToString();
        int v26 = 138543874;
        id v27 = v17;
        __int16 v28 = 2112;
        v29 = v18;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Natural lighting context updated: naturalLightingSupported: %@ naturalLightingEnabled: %@", (uint8_t *)&v26, 0x20u);
      }
      if ([v5 isCurrentDeviceConfirmedPrimaryResident])
      {
        if (([v3 supportsCHIP] & 1) == 0)
        {
          uint64_t v20 = [v3 matterNodeID];
          if (!v20
            || (__int16 v21 = (void *)v20,
                [v3 matterNodeID],
                __int16 v22 = objc_claimAutoreleasedReturnValue(),
                int v23 = [v22 isEqual:&unk_26E473918],
                v22,
                v21,
                v23))
          {
            __int16 v24 = *(void **)(a1 + 32);
            uint64_t v25 = [v24 availableCharacteristics];
            [v24 updateSupportedFeaturesWithCharacteristics:v25];
          }
        }
      }
      [*(id *)(a1 + 32) notifyClientsOfUpdatedSettingsWithPreviousSettings:v2];
      [*(id *)(a1 + 32) synchronizeCurveToAccessory];
    }
  }
}

- (void)handleHomeDidDisableCharacteristicNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDLightProfile_handleHomeDidDisableCharacteristicNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HMDLightProfile_handleHomeDidDisableCharacteristicNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) object];
  [v1 disableNaturalLightingCharacteristicNotificationsForObserver:v2];
}

- (void)handleHomeDidEnableCharacteristicNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDLightProfile_handleHomeDidEnableCharacteristicNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HMDLightProfile_handleHomeDidEnableCharacteristicNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) object];
  [v1 enableNaturalLightingCharacteristicNotificationsForObserver:v2];
}

- (void)handleAccessoryCharacteristicsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDLightProfile_handleAccessoryCharacteristicsChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__HMDLightProfile_handleAccessoryCharacteristicsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAccessoryCharacteristicsChanged:*(void *)(a1 + 40)];
}

- (void)handleAccessoryUnconfigured:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDLightProfile_handleAccessoryUnconfigured___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HMDLightProfile_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling accessory disconnected notification: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [MEMORY[0x263EFFA08] set];
  [*(id *)(a1 + 32) setReadCharacteristics:v7];
}

- (void)fetchNaturalLightingEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDLightProfile_fetchNaturalLightingEnabledWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDLightProfile_fetchNaturalLightingEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) characteristicValueObservers];
  if ([v2 count])
  {
    id v3 = [*(id *)(a1 + 32) readCharacteristics];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 32);
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@At least one characteristic value observer subscribed and last time read was successful, so returning the cached enabled value as it should be up to date", (uint8_t *)&v13, 0xCu);
      }
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = [*(id *)(a1 + 32) settings];
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, [v10 isNaturalLightingEnabled], 0);

      return;
    }
  }
  else
  {
  }
  v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  [v11 readNaturalLightingCharacteristicsWithReason:@"Get up to date natural lighting enabled value" completion:v12];
}

- (void)setNaturalLightingCharacteristicsNotificationEnabled:(BOOL)a3 forObserver:(id)a4
{
  id v8 = a4;
  id v6 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v6);

  if (a3)
  {
    BOOL v7 = [(HMDLightProfile *)self enableNaturalLightingCharacteristicNotificationsForObserver:v8];

    if (v7)
    {
      [(HMDLightProfile *)self readNaturalLightingCharacteristicsWithReason:@"Characteristic notifications enabled"];
    }
  }
  else
  {
    [(HMDLightProfile *)self disableNaturalLightingCharacteristicNotificationsForObserver:v8];
  }
}

- (NSDate)mostRecentNaturalLightingUsedDate
{
  if ([(HMDLightProfile *)self supportedFeatures])
  {
    id v3 = [(HMDLightProfile *)self lastNaturalLightingUsedDate];
  }
  else
  {
    id v3 = 0;
  }
  return (NSDate *)v3;
}

- (NSDate)mostRecentNaturalLightingEnabledDate
{
  if ([(HMDLightProfile *)self supportedFeatures])
  {
    id v3 = [(HMDLightProfile *)self lastNaturalLightingEnabledDate];
  }
  else
  {
    id v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4
{
}

- (HMLightProfileSettings)settings
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263F0E460]), "initWithSupportedFeatures:naturalLightingEnabled:", -[HMDLightProfile supportedFeatures](self, "supportedFeatures"), -[HMDLightProfile isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
  return (HMLightProfileSettings *)v2;
}

- (NSSet)readCharacteristicRequests
{
  id v2 = [(HMDLightProfile *)self availableCharacteristics];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_172_255168);

  if ([v3 count] == 3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA08] set];
  }
  id v5 = v4;

  return (NSSet *)v5;
}

id __45__HMDLightProfile_readCharacteristicRequests__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 type];
  if (([v3 isEqualToString:@"00000143-0000-1000-8000-0026BB765291"] & 1) != 0
    || ([v3 isEqualToString:@"00000144-0000-1000-8000-0026BB765291"] & 1) != 0
    || [v3 isEqualToString:@"0000024B-0000-1000-8000-0026BB765291"])
  {
    id v4 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)updateSettingsWithReadCharacteristicResponsePayload:(id)a3 error:(id *)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v74 = a3;
  id v6 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = [(HMDLightProfile *)self readCharacteristicRequests];
  id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_169_255170);

  if (![v8 count])
  {
    v41 = [MEMORY[0x263EFFA08] set];
    [(HMDLightProfile *)self setReadCharacteristics:v41];

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    }
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v81 = v45;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Read characteristics disappeared from the light profile", buf, 0xCu);
    }
LABEL_54:
    v62 = 0;
    goto LABEL_55;
  }
  v72 = a4;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (!v9) {
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v77;
  v70 = v8;
  v71 = self;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v77 != v11) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      id v75 = 0;
      id v14 = objc_msgSend(v74, "hmd_valueOfCharacteristic:error:", v13, &v75, v70);
      id v15 = v75;
      if (!v14)
      {
        v46 = (void *)MEMORY[0x230FBD990]();
        v47 = v71;
        v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v81 = v49;
          __int16 v82 = 2112;
          id v83 = v13;
          __int16 v84 = 2112;
          id v85 = v15;
          _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Read request failed for characteristic failed %@:%@", buf, 0x20u);
        }
        v50 = [MEMORY[0x263EFFA08] set];
        [(HMDLightProfile *)v47 setReadCharacteristics:v50];

        v51 = v72;
        v52 = obj;
        if (v72)
        {
          id v53 = v15;
          id v15 = v53;
          id v18 = 0;
          goto LABEL_51;
        }
        id v18 = 0;
        goto LABEL_52;
      }
      id v16 = [v13 type];
      int v17 = [v16 isEqualToString:@"0000024B-0000-1000-8000-0026BB765291"];

      if (v17)
      {
        id v18 = v14;
        objc_opt_class();
        int v19 = objc_opt_isKindOfClass() & 1;
        if (v19) {
          uint64_t v20 = v18;
        }
        else {
          uint64_t v20 = 0;
        }
        id v21 = v20;

        if (!v19)
        {
          v54 = (void *)MEMORY[0x230FBD990]();
          v55 = v71;
          v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v58 = HMFGetLogIdentifier();
            uint64_t v59 = objc_opt_class();
            *(_DWORD *)buf = 138544130;
            v81 = v58;
            __int16 v82 = 2112;
            id v83 = v13;
            __int16 v84 = 2112;
            id v85 = v18;
            __int16 v86 = 2112;
            uint64_t v87 = v59;
            _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Value of characteristic: %@ is not of expected type %@:%@", buf, 0x2Au);
          }
          v60 = [MEMORY[0x263EFFA08] set];
          [(HMDLightProfile *)v55 setReadCharacteristics:v60];

          goto LABEL_49;
        }
      }
      else
      {
        __int16 v22 = [v13 type];
        if ([v22 isEqualToString:@"00000143-0000-1000-8000-0026BB765291"])
        {
        }
        else
        {
          int v23 = [v13 type];
          int v24 = [v23 isEqualToString:@"00000144-0000-1000-8000-0026BB765291"];

          if (!v24) {
            goto LABEL_22;
          }
        }
        id v18 = v14;
        objc_opt_class();
        int v25 = objc_opt_isKindOfClass() & 1;
        if (v25) {
          int v26 = v18;
        }
        else {
          int v26 = 0;
        }
        id v27 = v26;

        if (!v25)
        {
          v63 = (void *)MEMORY[0x230FBD990]();
          v64 = v71;
          v65 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v66 = HMFGetLogIdentifier();
            uint64_t v67 = objc_opt_class();
            *(_DWORD *)buf = 138544130;
            v81 = v66;
            __int16 v82 = 2112;
            id v83 = v13;
            __int16 v84 = 2112;
            id v85 = v18;
            __int16 v86 = 2112;
            uint64_t v87 = v67;
            _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_ERROR, "%{public}@Value of characteristic: %@ is not of expected type %@:%@", buf, 0x2Au);
          }
          v68 = [MEMORY[0x263EFFA08] set];
          [(HMDLightProfile *)v64 setReadCharacteristics:v68];

LABEL_49:
          v51 = v72;
          v52 = obj;
          if (v72)
          {
            id v53 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
LABEL_51:
            id v8 = v70;
            id *v51 = v53;
LABEL_53:

            goto LABEL_54;
          }
LABEL_52:
          id v8 = v70;
          goto LABEL_53;
        }
      }

LABEL_22:
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
    id v8 = v70;
    self = v71;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_24:

  __int16 v28 = (void *)MEMORY[0x230FBD990]([(HMDLightProfile *)self setReadCharacteristics:obj]);
  v29 = self;
  __int16 v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v81 = v31;
    __int16 v82 = 2112;
    id v83 = obj;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully handled read response payload for characteristics:%@", buf, 0x16u);
  }
  uint64_t v32 = [(HMDLightProfile *)v29 hapAccessory];
  id v33 = [v32 home];
  uint64_t v34 = [v33 naturalLightingContext];
  if (v34)
  {
    v35 = (void *)v34;
    __int16 v36 = [(HMDLightProfile *)v29 naturalLightingCurve];

    if (!v36)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      uint64_t v38 = v29;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v81 = v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Initialize the curve before updating settings", buf, 0xCu);
      }
      [(HMDLightProfile *)v38 updateNaturalLightingCurve];
    }
  }
  else
  {
  }
  v61 = [(HMDLightProfile *)v29 availableCharacteristics];
  [(HMDLightProfile *)v29 updateSettingsWithCharacteristics:v61];

  v62 = [(HMDLightProfile *)v29 settings];
LABEL_55:

  return v62;
}

uint64_t __77__HMDLightProfile_updateSettingsWithReadCharacteristicResponsePayload_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke;
  v15[3] = &unk_264A2D3B8;
  void v15[4] = self;
  BOOL v7 = objc_msgSend(v5, "na_filter:", v15);

  id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_157_255180);
  [(HMDLightProfile *)self setBrightnessCharacteristic:v8];

  uint64_t v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_159_255181);
  [(HMDLightProfile *)self setColorTemperatureCharacteristic:v9];

  [(HMDLightProfile *)self updateNaturalLightingCurve];
  [(HMDLightProfile *)self updateSettingsWithCharacteristics:v7];
  [(HMDLightProfile *)self updateEnabledCharacteristicsNotifications];
  uint64_t v10 = [(HMDLightProfile *)self readCharacteristicRequests];
  uint64_t v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_162_255182);

  uint64_t v12 = [(HMDLightProfile *)self characteristicValueObservers];
  if ([v12 count])
  {
    int v13 = [(HMDLightProfile *)self readCharacteristics];
    char v14 = [v13 isEqual:v11];

    if ((v14 & 1) == 0) {
      [(HMDLightProfile *)self readNaturalLightingCharacteristicsWithReason:@"Characteristic notifications enabled"];
    }
  }
  else
  {
  }
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 service];
  id v4 = [*(id *)(a1 + 32) service];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0BFF8]];

  return v3;
}

uint64_t __62__HMDLightProfile_listener_didUpdateAvailableCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0BF68]];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDLightProfile;
  id v4 = a3;
  [(HMDAccessoryProfile *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(HMDLightProfile *)self settings];
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0D018]];
}

- (NSSet)availableCharacteristics
{
  uint64_t v3 = [(HMDLightProfile *)self characteristicsAvailabilityListener];
  id v4 = [v3 availableCharacteristics];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HMDLightProfile_availableCharacteristics__block_invoke;
  v7[3] = &unk_264A2D3B8;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return (NSSet *)v5;
}

uint64_t __43__HMDLightProfile_availableCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 service];
  id v4 = [*(id *)(a1 + 32) service];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)callSetNaturalLightingEnabledCompletion:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v8 = (void (**)(id, id))a3;
  BOOL v7 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v7);

  [(HMDLightProfile *)self setNaturalLightingEnabledRetryContext:0];
  v8[2](v8, v6);
}

- (BOOL)shouldRetrySetNaturalLightingEnabledWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 domain];
  if (![v6 isEqualToString:*MEMORY[0x263F0C710]])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v4 code];

  if (v7 != 4)
  {
LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (void)retrySetNaturalLightingEnabledWithContext:(id)a3 error:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 completion];
  char v10 = [v6 naturalLightingEnabled];
  uint64_t v11 = [(HMDLightProfile *)self dataSource];
  uint64_t v12 = [v11 naturalLightingEnabledMaxRetryCount];

  int v13 = [(HMDLightProfile *)self dataSource];
  [v13 naturalLightingEnabledRetryInterval];
  id v15 = v14;

  if (v12 < 1 || *(double *)&v15 <= 0.0)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v36 = v22;
      __int16 v37 = 2048;
      uint64_t v38 = v12;
      __int16 v39 = 2048;
      uint64_t v40 = (uint64_t)v15;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Skipping retry because either retry count: %ld or retry interval: %f is less than or equal to 0", buf, 0x20u);
    }
    goto LABEL_6;
  }
  id v16 = [(HMDLightProfile *)self naturalLightingEnabledRetryContext];
  unint64_t v17 = [v16 retryCount] + 1;

  if (v17 > v12)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v36 = v21;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v6;
      __int16 v39 = 2048;
      uint64_t v40 = v12;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Natural Lighting enabled for retry context: %@ exhausted retry attempts: %lu", buf, 0x20u);
    }
LABEL_6:

    [(HMDLightProfile *)v19 callSetNaturalLightingEnabledCompletion:v9 error:v7];
    goto LABEL_13;
  }
  int v23 = [(HMDLightProfile *)self naturalLightingEnabledRetryContext];
  [v23 setRetryCount:v17];

  int v24 = (void *)MEMORY[0x230FBD990]();
  int v25 = self;
  int v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v36 = v27;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v6;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Will retry set Natural Lighting enabled with retry context: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v25);
  __int16 v28 = [(HMDLightProfile *)v25 dataSource];
  v29 = [(HMDAccessoryProfile *)v25 workQueue];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __67__HMDLightProfile_retrySetNaturalLightingEnabledWithContext_error___block_invoke;
  v30[3] = &unk_264A2D390;
  objc_copyWeak(v33, (id *)buf);
  id v31 = v6;
  id v32 = v9;
  v33[1] = v15;
  char v34 = v10;
  [v28 dispatchAfterTimeInterval:v29 queue:v30 block:*(double *)&v15];

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

void __67__HMDLightProfile_retrySetNaturalLightingEnabledWithContext_error___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = WeakRetained;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 56);
      int v22 = 138543874;
      int v23 = v6;
      __int16 v24 = 2112;
      int v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Retrying Natural Lighting enabled with retry context: %@ after %fs", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v9 = [v4 naturalLightingEnabledRetryContext];
    char v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      [v4 setNaturalLightingEnabled:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 40) retryContext:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = v4;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        char v14 = HMFGetLogIdentifier();
        id v15 = [v12 naturalLightingEnabledRetryContext];
        uint64_t v16 = *(void *)(a1 + 32);
        int v22 = 138543874;
        int v23 = v14;
        __int16 v24 = 2112;
        int v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Not retrying because retry context changed from (%@ -> %@)", (uint8_t *)&v22, 0x20u);
      }
    }
  }
  else
  {
    unint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    id v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      id v21 = *(void **)(a1 + 32);
      int v22 = 138543618;
      int v23 = v20;
      __int16 v24 = 2112;
      int v25 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Natural Lighting enabled for retry context %@ because self is gone", (uint8_t *)&v22, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4 retryContext:(id)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  char v10 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    char v14 = HMFGetLogIdentifier();
    HMFBooleanToString();
    id v15 = (HMDLightProfile *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled: %@ with retry context: %@", buf, 0x20u);
  }
  uint64_t v16 = [(HMDAccessoryProfile *)v12 accessory];
  unint64_t v17 = [v16 home];
  if (v17)
  {
    objc_initWeak((id *)buf, v12);
    id v18 = [v17 naturalLightingCurveWriter];
    int v19 = [MEMORY[0x263EFFA08] setWithObject:v12];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke;
    v25[3] = &unk_264A2D368;
    objc_copyWeak(&v28, (id *)buf);
    BOOL v29 = v6;
    id v27 = v8;
    id v26 = v9;
    [v18 setNaturalLightingEnabled:v6 forLightProfiles:v19 completion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v12;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = v21;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Home on accessory with light profile is not set %@:%@", buf, 0x20u);
    }
    __int16 v24 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [(HMDLightProfile *)v21 callSetNaturalLightingEnabledCompletion:v8 error:v24];
  }
}

void __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke_152;
    block[3] = &unk_264A2D340;
    id v13 = v3;
    char v14 = v5;
    char v17 = *(unsigned char *)(a1 + 56);
    id v16 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

    id v7 = v13;
  }
  else
  {
    id v7 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      uint64_t v11 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      int v19 = v10;
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic for Natural Lighting enabled: %{public}@ because self is gone", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__HMDLightProfile_setNaturalLightingEnabled_completion_retryContext___block_invoke_152(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = HMFGetLogIdentifier();
      id v15 = HMFBooleanToString();
      int v16 = 138543618;
      char v17 = v14;
      __int16 v18 = 2112;
      int v19 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully wrote characteristic for Natural Lighting enabled: %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 40) handleSetNaturalLightingEnabled:*(unsigned __int8 *)(a1 + 64)];
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    char v10 = 0;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 48)
    || ([*(id *)(a1 + 40) shouldRetrySetNaturalLightingEnabledWithError:v2] & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = HMFGetLogIdentifier();
      id v7 = HMFBooleanToString();
      int v16 = 138543874;
      char v17 = v6;
      __int16 v18 = 2114;
      int v19 = v7;
      __int16 v20 = 2114;
      id v21 = v2;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic for Natural Lighting enabled: %{public}@ error: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    char v10 = v2;
LABEL_11:
    [v8 callSetNaturalLightingEnabledCompletion:v9 error:v10];
    goto LABEL_12;
  }
  [*(id *)(a1 + 40) retrySetNaturalLightingEnabledWithContext:*(void *)(a1 + 48) error:v2];
LABEL_12:
}

- (void)setNaturalLightingEnabled:(BOOL)a3 shouldRetryOnFailure:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *))a5;
  uint64_t v9 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v9);

  [(HMDLightProfile *)self resetNaturalLightingEnabledRetryContext];
  char v10 = [(HMDLightProfile *)self settings];
  char v11 = [v10 supportedFeatures];

  if (v11)
  {
    if (v5)
    {
      char v17 = [[HMDNaturalLightingEnabledRetryContext alloc] initWithNaturalLightingEnabled:v6 completion:v8 retryCount:0];
      [(HMDLightProfile *)self setNaturalLightingEnabledRetryContext:v17];

      __int16 v18 = (void *)MEMORY[0x230FBD990]();
      int v19 = self;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        uint64_t v22 = [(HMDLightProfile *)v19 naturalLightingEnabledRetryContext];
        int v23 = 138543618;
        __int16 v24 = v21;
        __int16 v25 = 2112;
        id v26 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Created natural lighting enabled retry context: %@", (uint8_t *)&v23, 0x16u);
      }
    }
    int v16 = [(HMDLightProfile *)self naturalLightingEnabledRetryContext];
    [(HMDLightProfile *)self setNaturalLightingEnabled:v6 completion:v8 retryContext:v16];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v23 = 138543362;
      __int16 v24 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting feature is not supported", (uint8_t *)&v23, 0xCu);
    }
    int v16 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v8[2](v8, v16);
  }
}

- (void)disableNaturalLightingCharacteristicNotificationsForObserver:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    char v10 = [(HMDLightProfile *)v7 characteristicValueObservers];
    int v30 = 138543874;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v4;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing Characteristic value observer: %@ from current observers: %@", (uint8_t *)&v30, 0x20u);
  }
  char v11 = [(HMDLightProfile *)v7 characteristicValueObservers];
  [v11 removeObject:v4];

  id v12 = [(HMDLightProfile *)v7 characteristicValueObservers];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    char v14 = [(HMDLightProfile *)v7 hapAccessory];
    id v15 = [v14 home];
    int v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 removeObserver:v7 name:@"HMDAccessoryDisconnectedNotification" object:v14];

    char v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 removeObserver:v7 name:@"HMDAccessoryCharacteristicsChangedNotification" object:v14];

    __int16 v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 removeObserver:v7 name:@"HMDHomeNaturalLightingContextUpdatedNotification" object:v15];

    int v19 = [(HMDLightProfile *)v7 notificationEnabledCharacteristics];
    uint64_t v20 = [v19 count];
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v7;
    int v23 = HMFGetOSLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v24)
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v30 = 138543618;
        id v31 = v25;
        __int16 v32 = 2112;
        id v33 = v19;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications for natural lighting characteristics: %@", (uint8_t *)&v30, 0x16u);
      }
      id v26 = [v19 allObjects];
      uint64_t v27 = [(HMDLightProfile *)v22 clientIdentifier];
      [v14 setNotificationsEnabled:0 forCharacteristics:v26 clientIdentifier:v27];

      id v28 = [MEMORY[0x263EFFA08] set];
      [(HMDLightProfile *)v22 setNotificationEnabledCharacteristics:v28];
    }
    else
    {
      if (v24)
      {
        BOOL v29 = HMFGetLogIdentifier();
        int v30 = 138543362;
        id v31 = v29;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Did not find any characteristics to disable notifications", (uint8_t *)&v30, 0xCu);
      }
    }
  }
}

- (BOOL)enableNaturalLightingCharacteristicNotificationsForObserver:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HMDLightProfile *)self characteristicValueObservers];
  uint64_t v7 = [v6 count];

  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  char v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    id v12 = [(HMDLightProfile *)v9 characteristicValueObservers];
    int v21 = 138543874;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding Characteristic value observer: %@ to current observers: %@", (uint8_t *)&v21, 0x20u);
  }
  uint64_t v13 = [(HMDLightProfile *)v9 characteristicValueObservers];
  [v13 addObject:v4];

  if (v7)
  {
    BOOL v14 = 0;
  }
  else
  {
    id v15 = [(HMDLightProfile *)v9 hapAccessory];
    int v16 = [v15 home];
    char v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v9 selector:sel_handleAccessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:v15];

    __int16 v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v9 selector:sel_handleAccessoryCharacteristicsChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v15];

    int v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v9 selector:sel_handleHomeNaturalLightingContextUpdated_ name:@"HMDHomeNaturalLightingContextUpdatedNotification" object:v16];

    BOOL v14 = [(HMDLightProfile *)v9 updateEnabledCharacteristicsNotifications];
  }

  return v14;
}

- (BOOL)updateEnabledCharacteristicsNotifications
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDLightProfile *)self availableCharacteristics];
  BOOL v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_144_255212);

  if (v5)
  {
    BOOL v6 = [MEMORY[0x263EFFA08] setWithObject:v5];
  }
  else
  {
    BOOL v6 = 0;
  }
  uint64_t v7 = [(HMDLightProfile *)self characteristicValueObservers];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    int v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v24;
      __int16 v25 = "%{public}@Not enabling characteristic notifications because there are no Characteristic value observers";
LABEL_13:
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v27, 0xCu);
    }
LABEL_14:

    BOOL v11 = 0;
    goto LABEL_15;
  }
  if (![v6 count])
  {
    int v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v24;
      __int16 v25 = "%{public}@Did not find any characteristics to enable notifications";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v9 = [v6 count];
  char v10 = [(HMDLightProfile *)self notificationEnabledCharacteristics];
  BOOL v11 = v9 != [v10 count];

  id v12 = (void *)MEMORY[0x230FBD990]([(HMDLightProfile *)self setNotificationEnabledCharacteristics:v6]);
  uint64_t v13 = self;
  BOOL v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v16 = [(HMDLightProfile *)v13 notificationEnabledCharacteristics];
    int v27 = 138543618;
    id v28 = v15;
    __int16 v29 = 2112;
    int v30 = v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Enabling notifications for natural lighting characteristics: %@", (uint8_t *)&v27, 0x16u);
  }
  char v17 = [(HMDLightProfile *)v13 hapAccessory];
  __int16 v18 = [(HMDLightProfile *)v13 notificationEnabledCharacteristics];
  int v19 = [v18 allObjects];
  uint64_t v20 = [(HMDLightProfile *)v13 clientIdentifier];
  [v17 setNotificationsEnabled:1 forCharacteristics:v19 clientIdentifier:v20];

LABEL_15:
  return v11;
}

uint64_t __60__HMDLightProfile_updateEnabledCharacteristicsNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"0000024B-0000-1000-8000-0026BB765291"];

  return v3;
}

- (void)synchronizeCurveToAccessory
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDLightProfile *)self naturalLightingCurve];
  if (v4
    && (BOOL v5 = (void *)v4,
        BOOL v6 = [(HMDLightProfile *)self isNaturalLightingEnabled],
        v5,
        v6))
  {
    id v15 = [(HMDLightProfile *)self naturalLightingCurveWriter];
    uint64_t v7 = [(HMDLightProfile *)self naturalLightingActiveTransitionContext];
    [v15 synchronizeCurveWithActiveTransitionContext:v7];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = HMFGetLogIdentifier();
      [(HMDLightProfile *)v9 isNaturalLightingEnabled];
      id v12 = HMFBooleanToString();
      uint64_t v13 = [(HMDLightProfile *)v9 naturalLightingCurve];
      BOOL v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      char v17 = v11;
      __int16 v18 = 2112;
      int v19 = v12;
      __int16 v20 = 2112;
      int v21 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not rewriting curve because either natural lighting is disabled: %@ or curve is nil: %@", buf, 0x20u);
    }
  }
}

- (void)updateSettingsWithCharacteristics:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_140_255218);
  if (v6) {
    [(HMDLightProfile *)self updateActiveTransitionCountWithCharacteristic:v6];
  }
  uint64_t v7 = [(HMDLightProfile *)self settings];
  uint64_t v8 = [(HMDLightProfile *)self naturalLightingActiveTransitionContext];
  [(HMDLightProfile *)self updateSupportedFeaturesWithCharacteristics:v4];
  uint64_t v9 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_142_255219);
  [(HMDLightProfile *)self updateNaturalLightingEnabledForCharacteristic:v9];
  [(HMDLightProfile *)self notifyClientsOfUpdatedSettingsWithPreviousSettings:v7];
  char v10 = [(HMDLightProfile *)self naturalLightingActiveTransitionContext];
  char v11 = HMFEqualObjects();

  if ((v11 & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = [(HMDLightProfile *)v13 naturalLightingActiveTransitionContext];
      int v19 = 138543874;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting active transition context from %@ -> %@", (uint8_t *)&v19, 0x20u);
    }
    char v17 = [(HMDLightProfile *)v13 naturalLightingCurveWriter];
    __int16 v18 = [(HMDLightProfile *)v13 naturalLightingActiveTransitionContext];
    [v17 handleActiveTransitionContextUpdated:v18];
  }
}

uint64_t __53__HMDLightProfile_updateSettingsWithCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"00000143-0000-1000-8000-0026BB765291"];

  return v3;
}

uint64_t __53__HMDLightProfile_updateSettingsWithCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"0000024B-0000-1000-8000-0026BB765291"];

  return v3;
}

- (BOOL)updateActiveTransitionCountWithCharacteristic:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    char v10 = self;
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v23 = 138543874;
      id v24 = v12;
      __int16 v25 = 2112;
      *(void *)id v26 = v6;
      *(_WORD *)&v26[8] = 2112;
      uint64_t v27 = objc_opt_class();
      uint64_t v13 = "%{public}@Active transition count value: %@ is not of type %@";
      BOOL v14 = v11;
      uint32_t v15 = 32;
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  if ([v8 integerValue] < 0 || objc_msgSend(v8, "integerValue") >= 256)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    char v10 = self;
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v23 = 138543618;
      id v24 = v12;
      __int16 v25 = 2048;
      *(void *)id v26 = [v8 integerValue];
      uint64_t v13 = "%{public}@Active transition count value: %ld is less than 0 or greater than 255";
      BOOL v14 = v11;
      uint32_t v15 = 22;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v18 = [v8 unsignedCharValue];
  if ([(HMDLightProfile *)self activeTransitionsCount] == v18) {
    goto LABEL_13;
  }
  int v19 = (void *)MEMORY[0x230FBD990]();
  __int16 v20 = self;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    int v23 = 138543874;
    id v24 = v22;
    __int16 v25 = 1024;
    *(_DWORD *)id v26 = [(HMDLightProfile *)v20 activeTransitionsCount];
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v18;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating active transition count from (%u -> %u)", (uint8_t *)&v23, 0x18u);
  }
  [(HMDLightProfile *)v20 setActiveTransitionsCount:v18];
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (void)readNaturalLightingCharacteristicsWithReason:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDLightProfile *)self readCharacteristicRequests];
  if ([v9 count])
  {
    char v10 = [(HMDLightProfile *)self hapAccessory];
    char v11 = [v10 home];

    id v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    BOOL v14 = HMFGetOSLogHandle();
    uint32_t v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v16;
        __int16 v28 = 2112;
        __int16 v29 = v9;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending read requests to the accessory: %@ with reason: %@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, v13);
      char v17 = [v9 allObjects];
      uint64_t v18 = [(HMDAccessoryProfile *)v13 description];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke;
      v23[3] = &unk_264A2EAE0;
      objc_copyWeak(&v25, (id *)buf);
      id v24 = v7;
      [v11 readCharacteristicValues:v17 source:7 sourceForLogging:v18 qualityOfService:-1 withCompletionHandler:v23];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v21;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Home is not configured on the accessory", buf, 0xCu);
      }
      uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v22);
    }
  }
  else
  {
    int v19 = [(HMDLightProfile *)self availableCharacteristics];
    [(HMDLightProfile *)self updateSettingsWithCharacteristics:v19];

    __int16 v20 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v20);
  }
}

void __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke_2;
    v12[3] = &unk_264A2D310;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v15 = *(id *)(a1 + 32);
    id v13 = v6;
    id v14 = v5;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v16);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

void __75__HMDLightProfile_readNaturalLightingCharacteristicsWithReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
LABEL_8:
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);

    goto LABEL_11;
  }
  if (![*(id *)(a1 + 32) count])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = WeakRetained;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      char v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received empty response payload for charactersitic read requests %@:%@", buf, 0x20u);
    }
    goto LABEL_8;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = 0;
  id v4 = [WeakRetained updateSettingsWithReadCharacteristicResponsePayload:v3 error:&v15];
  id v5 = v15;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, [v4 isNaturalLightingEnabled], 0);
  }
  else {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
  }

LABEL_11:
}

- (void)readNaturalLightingCharacteristicsWithReason:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDLightProfile *)self readNaturalLightingCharacteristicsWithReason:v5 completion:&__block_literal_global_136];
}

- (BOOL)updateNaturalLightingCurve
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDLightProfile *)self brightnessCharacteristic];
  id v5 = [v4 metadata];
  uint64_t v6 = [v5 minimumValue];
  uint64_t v7 = [v6 integerValue];

  id v8 = [(HMDLightProfile *)self brightnessCharacteristic];
  uint64_t v9 = [v8 metadata];
  uint64_t v10 = [v9 maximumValue];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = [(HMDLightProfile *)self colorTemperatureCharacteristic];
  uint64_t v13 = [v12 metadata];
  id v14 = [v13 minimumValue];

  id v15 = [(HMDLightProfile *)self colorTemperatureCharacteristic];
  id v16 = [v15 metadata];
  char v17 = [v16 maximumValue];

  __int16 v18 = [(HMDAccessoryProfile *)self accessory];
  uint64_t v19 = [v18 home];
  __int16 v20 = [v19 naturalLightingContext];
  uint64_t v21 = [v20 curve];

  if ([v21 minimumBrightness] < v7 || objc_msgSend(v21, "minimumBrightness") > v11)
  {
    uint64_t v22 = MEMORY[0x230FBD990]();
    int v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v51 = v25;
      __int16 v52 = 2048;
      uint64_t v53 = [v21 minimumBrightness];
      __int16 v54 = 2048;
      uint64_t v55 = v7;
      __int16 v56 = 2048;
      uint64_t v57 = v11;
      id v26 = "%{public}@Not initializing curve because curve minimum brightness is not in supported range %ld (%ld:%ld)";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, v26, buf, 0x2Au);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([v21 maximumBrightness] < v7 || objc_msgSend(v21, "maximumBrightness") > v11)
  {
    uint64_t v22 = MEMORY[0x230FBD990]();
    int v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v51 = v25;
      __int16 v52 = 2048;
      uint64_t v53 = [v21 maximumBrightness];
      __int16 v54 = 2048;
      uint64_t v55 = v7;
      __int16 v56 = 2048;
      uint64_t v57 = v11;
      id v26 = "%{public}@Not initializing curve because curve maximum brightness is not in supported range %ld (%ld:%ld)";
      goto LABEL_9;
    }
LABEL_10:

    uint64_t v27 = (void *)v22;
LABEL_11:
    __int16 v28 = 0;
    goto LABEL_12;
  }
  if (!v14 || !v17)
  {
    uint64_t v42 = MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v51 = v45;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v14;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v17;
      v46 = "%{public}@Either minimum color temperature: %@ or maximum color temperature: %@";
      goto LABEL_24;
    }
LABEL_25:

    uint64_t v27 = (void *)v42;
    goto LABEL_11;
  }
  uint64_t v41 = [v14 integerValue];
  if (v41 > [v17 integerValue])
  {
    uint64_t v42 = MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v51 = v45;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v14;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v17;
      v46 = "%{public}@Minimum color temperature value: %@ is greater than maximum color temperature value: %@";
LABEL_24:
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, v46, buf, 0x20u);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  uint64_t v47 = [v14 integerValue];
  if (v47 > [v21 maximumColorTemperature])
  {
    uint64_t v42 = MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    v45 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v51 = v45;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v14;
    __int16 v54 = 2048;
    uint64_t v55 = [v21 maximumColorTemperature];
    v46 = "%{public}@Minimum color temperature value: %@  is greater than the curve maximum color temperature value: %ld";
    goto LABEL_24;
  }
  uint64_t v48 = [v17 integerValue];
  if (v48 < [v21 minimumColorTemperature])
  {
    uint64_t v42 = MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    v45 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v51 = v45;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v17;
    __int16 v54 = 2048;
    uint64_t v55 = [v21 minimumColorTemperature];
    v46 = "%{public}@Maximum color temperature value: %@  is less than the curve minimum color temperature value: %ld";
    goto LABEL_24;
  }
  __int16 v28 = -[HMDNaturalLightingCurve initWithCurve:minimumColorTemperature:maximumColorTemperature:]([HMDNaturalLightingCurve alloc], "initWithCurve:minimumColorTemperature:maximumColorTemperature:", v21, [v14 integerValue], objc_msgSend(v17, "integerValue"));
LABEL_12:
  __int16 v29 = [(HMDLightProfile *)self naturalLightingCurve];
  char v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    id v31 = (void *)MEMORY[0x230FBD990]();
    uint64_t v32 = self;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      __int16 v34 = HMFGetLogIdentifier();
      v49 = [(HMDLightProfile *)v32 naturalLightingCurve];
      id v35 = v21;
      uint64_t v36 = v17;
      __int16 v37 = v14;
      uint64_t v38 = [v49 checksum];
      uint64_t v39 = [(HMDNaturalLightingCurve *)v28 checksum];
      *(_DWORD *)buf = 138543874;
      v51 = v34;
      __int16 v52 = 2048;
      uint64_t v53 = v38;
      id v14 = v37;
      char v17 = v36;
      uint64_t v21 = v35;
      __int16 v54 = 2048;
      uint64_t v55 = v39;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Updated natural lighting curve from %llu -> %llu", buf, 0x20u);
    }
    [(HMDLightProfile *)v32 setNaturalLightingCurve:v28];
  }

  return v30 ^ 1;
}

- (id)availableCharacteristicWithType:(id)a3 fromChangedObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDLightProfile *)self availableCharacteristics];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__HMDLightProfile_availableCharacteristicWithType_fromChangedObjects___block_invoke;
  v14[3] = &unk_264A2D2C8;
  id v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v9;
  uint64_t v12 = objc_msgSend(v7, "na_firstObjectPassingTest:", v14);

  return v12;
}

uint64_t __70__HMDLightProfile_availableCharacteristicWithType_fromChangedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5 && [*(id *)(a1 + 32) containsObject:v5])
  {
    id v6 = [v5 type];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_handleAccessoryCharacteristicsChanged:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v4 name];
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v9;
    __int16 v41 = 2112;
    uint64_t v42 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling notification: %@", buf, 0x16u);
  }
  id v11 = [(HMDLightProfile *)v7 settings];
  uint64_t v12 = [(HMDLightProfile *)v7 naturalLightingActiveTransitionContext];
  uint64_t v13 = [v4 userInfo];
  id v14 = objc_msgSend(v13, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  id v15 = [(HMDLightProfile *)v7 availableCharacteristicWithType:@"00000144-0000-1000-8000-0026BB765291" fromChangedObjects:v14];
  id v16 = [(HMDLightProfile *)v7 hapAccessory];
  char v17 = [v16 home];
  uint64_t v18 = [v17 naturalLightingContext];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    __int16 v20 = [(HMDLightProfile *)v7 naturalLightingCurve];

    if (!v20)
    {
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v7;
      int v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Initialize the curve since natural lighting context is present", buf, 0xCu);
      }
      [(HMDLightProfile *)v22 updateNaturalLightingCurve];
    }
  }
  else
  {
  }
  if (v15)
  {
    id v25 = [(HMDLightProfile *)v7 availableCharacteristics];
    [(HMDLightProfile *)v7 updateSupportedFeaturesWithCharacteristics:v25];
  }
  id v26 = [(HMDLightProfile *)v7 availableCharacteristicWithType:@"00000143-0000-1000-8000-0026BB765291" fromChangedObjects:v14];
  if (v26) {
    [(HMDLightProfile *)v7 updateNaturalLightingEnabledForCharacteristic:v26];
  }
  uint64_t v27 = [(HMDLightProfile *)v7 availableCharacteristicWithType:@"0000024B-0000-1000-8000-0026BB765291" fromChangedObjects:v14];
  if (v27
    && [(HMDLightProfile *)v7 updateActiveTransitionCountWithCharacteristic:v27])
  {
    [(HMDLightProfile *)v7 readNaturalLightingCharacteristicsWithReason:@"Active transition count updated"];
  }
  [(HMDLightProfile *)v7 notifyClientsOfUpdatedSettingsWithPreviousSettings:v11];
  __int16 v28 = [(HMDLightProfile *)v7 naturalLightingActiveTransitionContext];
  char v29 = HMFEqualObjects();

  if ((v29 & 1) == 0)
  {
    __int16 v37 = v11;
    id v38 = v4;
    char v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = v7;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      id v33 = HMFGetLogIdentifier();
      __int16 v34 = [(HMDLightProfile *)v31 naturalLightingActiveTransitionContext];
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v33;
      __int16 v41 = 2112;
      uint64_t v42 = v12;
      __int16 v43 = 2112;
      v44 = v34;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting active transition context from %@ -> %@", buf, 0x20u);
    }
    id v35 = [(HMDLightProfile *)v31 naturalLightingCurveWriter];
    uint64_t v36 = [(HMDLightProfile *)v31 naturalLightingActiveTransitionContext];
    [v35 handleActiveTransitionContextUpdated:v36];

    id v11 = v37;
    id v4 = v38;
  }
}

- (void)updateSupportedFeaturesWithCharacteristics:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_255246);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_118_255248);
    if (!v7)
    {
      __int16 v41 = (void *)MEMORY[0x230FBD990]();
      uint64_t v42 = self;
      __int16 v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        uint64_t v45 = (__CFString *)*MEMORY[0x263F0BFF8];
        *(_DWORD *)buf = 138543874;
        long long v79 = v44;
        __int16 v80 = 2112;
        v81 = v45;
        __int16 v82 = 2112;
        id v83 = v4;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Characteristic Color Temperature: %@ is not supported, available characteristics: %@", buf, 0x20u);
      }
      goto LABEL_49;
    }
    id v8 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_121_255250);
    if (!v8)
    {
      v46 = (void *)MEMORY[0x230FBD990]();
      uint64_t v47 = self;
      uint64_t v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = HMFGetLogIdentifier();
        v50 = (__CFString *)*MEMORY[0x263F0BF68];
        *(_DWORD *)buf = 138543874;
        long long v79 = v49;
        __int16 v80 = 2112;
        v81 = v50;
        __int16 v82 = 2112;
        id v83 = v4;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Characteristics Brightness: %@ is not supported, available characteristics: %@", buf, 0x20u);
      }
      goto LABEL_48;
    }
    uint64_t v9 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_124_255252);
    if (v9)
    {
      [(HMDLightProfile *)self setNaturalLightingSupported:1];
      id v10 = [(HMDLightProfile *)self naturalLightingCurve];

      if (v10)
      {
        id v11 = [v9 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v13 = v12;

        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = self;
        id v16 = HMFGetOSLogHandle();
        char v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v73 = v14;
            uint64_t v19 = v18 = v13;
            [(__CFString *)v18 hmf_hexadecimalRepresentation];
            v71 = v9;
            __int16 v20 = v11;
            uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            long long v79 = v19;
            __int16 v80 = 2112;
            v81 = v21;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Decoding supported value transition configuration: %@", buf, 0x16u);

            id v11 = v20;
            uint64_t v9 = v71;

            uint64_t v13 = v18;
            id v14 = v73;
          }

          id v77 = 0;
          uint64_t v22 = [MEMORY[0x263F35AB8] parsedFromData:v13 error:&v77];
          v72 = v22;
          id v74 = v77;
          if (v22)
          {
            v68 = v13;
            v69 = v11;
            int v23 = [v22 transitions];
            v75[0] = MEMORY[0x263EF8330];
            v75[1] = 3221225472;
            v75[2] = __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_126;
            v75[3] = &unk_264A2D298;
            id v24 = v7;
            long long v76 = v24;
            uint64_t v25 = objc_msgSend(v23, "na_firstObjectPassingTest:", v75);

            id v26 = (void *)MEMORY[0x230FBD990]();
            uint64_t v27 = v15;
            __int16 v28 = HMFGetOSLogHandle();
            BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
            uint64_t v67 = (void *)v25;
            if (v25)
            {
              if (v29)
              {
                HMFGetLogIdentifier();
                v31 = char v30 = v26;
                *(_DWORD *)buf = 138543362;
                long long v79 = v31;
                _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Updating supported features with natural lighting feature", buf, 0xCu);

                id v26 = v30;
              }

              [(HMDLightProfile *)v27 setSupportedFeatures:1];
              uint64_t v32 = [(HMDLightProfile *)v27 hapAccessory];
              id v33 = [v32 home];
              if ([v33 isCurrentDeviceConfirmedPrimaryResident])
              {
                __int16 v34 = [v33 naturalLightingContext];

                if (v34)
                {
                  id v35 = [NSNumber numberWithBool:1];
                  id v36 = (id)[v32 saveSupportsNaturalLighting:v35];
                }
              }
            }
            else
            {
              if (v29)
              {
                HMFGetLogIdentifier();
                v66 = v65 = v26;
                *(_DWORD *)buf = 138543618;
                long long v79 = v66;
                __int16 v80 = 2112;
                v81 = v24;
                _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Characteristic: %@ doesn't support Linear Derived Transition", buf, 0x16u);

                id v26 = v65;
              }
            }
            v64 = v72;

            uint64_t v13 = v68;
            id v11 = v69;
          }
          else
          {
            v60 = (void *)MEMORY[0x230FBD990]();
            v61 = v15;
            v62 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v63 = v70 = v11;
              *(_DWORD *)buf = 138543874;
              long long v79 = v63;
              __int16 v80 = 2112;
              v81 = v13;
              __int16 v82 = 2112;
              id v83 = v74;
              _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode the supported value transition configuration from: %@ error: %@", buf, 0x20u);

              id v11 = v70;
            }

            v64 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v59 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v79 = v59;
            __int16 v80 = 2112;
            v81 = v11;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Supported Value Transition Configuration Characteristic value: %@ is not of expected type NSData", buf, 0x16u);

            uint64_t v13 = 0;
          }
        }

        goto LABEL_47;
      }
      v51 = (void *)MEMORY[0x230FBD990]();
      __int16 v52 = self;
      uint64_t v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        __int16 v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v79 = v54;
        uint64_t v55 = "%{public}@Natural lighting curve is not set";
        __int16 v56 = v53;
        os_log_type_t v57 = OS_LOG_TYPE_ERROR;
        uint32_t v58 = 12;
        goto LABEL_33;
      }
    }
    else
    {
      v51 = (void *)MEMORY[0x230FBD990]();
      __int16 v52 = self;
      uint64_t v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        __int16 v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        long long v79 = v54;
        __int16 v80 = 2112;
        v81 = @"00000144-0000-1000-8000-0026BB765291";
        __int16 v82 = 2112;
        id v83 = v4;
        uint64_t v55 = "%{public}@Supported Value Transition Characteristic: %@ is not supported, available characteristics: %@";
        __int16 v56 = v53;
        os_log_type_t v57 = OS_LOG_TYPE_INFO;
        uint32_t v58 = 32;
LABEL_33:
        _os_log_impl(&dword_22F52A000, v56, v57, v55, buf, v58);
      }
    }

LABEL_47:

LABEL_48:
LABEL_49:

    goto LABEL_50;
  }
  __int16 v37 = (void *)MEMORY[0x230FBD990]();
  id v38 = self;
  uint64_t v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    uint64_t v40 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v79 = v40;
    __int16 v80 = 2112;
    v81 = @"00000143-0000-1000-8000-0026BB765291";
    __int16 v82 = 2112;
    id v83 = v4;
    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Value Transition Control Characteristic: %@ is not supported, available characteristics: %@", buf, 0x20u);
  }
LABEL_50:
}

unint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 HAPInstanceID];
  id v5 = [v4 value];
  id v6 = [*(id *)(a1 + 32) instanceID];
  if ([v5 isEqualToNumber:v6])
  {
    uint64_t v7 = [v3 transitionTypes];
    unint64_t v8 = ((unint64_t)[v7 value] >> 1) & 1;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_122(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"00000144-0000-1000-8000-0026BB765291"];

  return v3;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_119(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0BF68]];

  return v3;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke_116(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0BFF8]];

  return v3;
}

uint64_t __62__HMDLightProfile_updateSupportedFeaturesWithCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"00000143-0000-1000-8000-0026BB765291"];

  return v3;
}

- (void)updateNaturalLightingEnabledForCharacteristic:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  unint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v66 = v9;
    __int16 v67 = 2112;
    uint64_t v68 = (uint64_t)v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting enabled with characteristic: %@", buf, 0x16u);
  }
  id v10 = [(HMDLightProfile *)v7 colorTemperatureCharacteristic];
  if (!v10)
  {
    [(HMDLightProfile *)v7 setNaturalLightingEnabled:0];
    id v26 = (void *)MEMORY[0x230FBD990]([(HMDLightProfile *)v7 setNaturalLightingActiveTransitionContext:0]);
    uint64_t v27 = v7;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v66 = v29;
      __int16 v67 = 2112;
      uint64_t v68 = 0;
      char v30 = "%{public}@Ignoring Value Transition Control Characteristic update because Color Temperature Characteristic is %@";
      id v31 = v28;
      uint32_t v32 = 22;
LABEL_19:
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    }
LABEL_20:

    goto LABEL_44;
  }
  if (!v4)
  {
    [(HMDLightProfile *)v7 setNaturalLightingEnabled:0];
    id v26 = (void *)MEMORY[0x230FBD990]([(HMDLightProfile *)v7 setNaturalLightingActiveTransitionContext:0]);
    uint64_t v27 = v7;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v66 = v29;
      char v30 = "%{public}@Value Transition Control Characteristic is nil";
      id v31 = v28;
      uint32_t v32 = 12;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v11 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      char v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_msgSend(v13, "hmf_hexadecimalRepresentation");
      *(_DWORD *)buf = 138543618;
      v66 = v17;
      __int16 v67 = 2112;
      uint64_t v68 = (uint64_t)v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Decoding Value Transition Control Characteristic value: %@", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x263F35910] parsedFromData:v13 error:0];
    __int16 v20 = [v19 naturalLightingEnabledForCharacteristic:v10];
    if (v20)
    {
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v15;
      int v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v66 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition Start", buf, 0xCu);
      }
      -[HMDLightProfile setNaturalLightingEnabled:](v22, "setNaturalLightingEnabled:", [v20 BOOLValue]);
      uint64_t v25 = [v19 naturalLightingActiveTransitionContextForCharacteristic:v10];
      [(HMDLightProfile *)v22 setNaturalLightingActiveTransitionContext:v25];
    }
    else
    {
      v64 = v19;
      uint64_t v25 = [MEMORY[0x263F35918] parsedFromData:v13 error:0];
      __int16 v37 = [v25 valueTransition];
      id v38 = [(HMDLightProfile *)v15 colorTemperatureCharacteristic];
      uint64_t v39 = [v37 naturalLightingActiveTransitionContextForCharacteristic:v38];

      if (v39)
      {
        uint64_t v40 = (void *)MEMORY[0x230FBD990]();
        __int16 v41 = v15;
        uint64_t v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          __int16 v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v66 = v43;
          _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition Control Fetch Response", buf, 0xCu);
        }
        [(HMDLightProfile *)v41 setNaturalLightingEnabled:1];
      }
      else
      {
        v44 = [v25 transitionState];
        if ([v44 isValid])
        {
          uint64_t v45 = (void *)MEMORY[0x230FBD990]();
          v46 = v15;
          uint64_t v47 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            contexta = HMFGetLogIdentifier();
            [v44 activeTransitionContexts];
            uint64_t v48 = v60 = v45;
            *(_DWORD *)buf = 138543618;
            v66 = contexta;
            __int16 v67 = 2112;
            uint64_t v68 = (uint64_t)v48;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition Control Write Response, active transition contexts are: %@", buf, 0x16u);

            uint64_t v45 = v60;
          }

          -[HMDLightProfile setNaturalLightingEnabled:](v46, "setNaturalLightingEnabled:", [v44 isNaturalLightingEnabledForCharacteristic:v10]);
          v49 = [v25 transitionState];
          v50 = [v49 naturalLightingActiveTransitionContextForCharacteristic:v10];
          [(HMDLightProfile *)v46 setNaturalLightingActiveTransitionContext:v50];
        }
        else
        {
          v51 = [MEMORY[0x263F35940] parsedFromData:v13 error:0];

          int v52 = [v51 isValid];
          context = (void *)MEMORY[0x230FBD990]();
          uint64_t v53 = v15;
          __int16 v54 = HMFGetOSLogHandle();
          BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
          if (v52)
          {
            if (v55)
            {
              v61 = HMFGetLogIdentifier();
              uint64_t v56 = [v51 activeTransitionContexts];
              *(_DWORD *)buf = 138543618;
              v66 = v61;
              __int16 v67 = 2112;
              uint64_t v68 = v56;
              os_log_type_t v57 = (void *)v56;
              _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Parsed the Value Transition Control Characteristic value update as Transition State, active transition contexts are: %@", buf, 0x16u);
            }
            -[HMDLightProfile setNaturalLightingEnabled:](v53, "setNaturalLightingEnabled:", [v51 isNaturalLightingEnabledForCharacteristic:v10]);
            uint32_t v58 = [v51 naturalLightingActiveTransitionContextForCharacteristic:v10];
            [(HMDLightProfile *)v53 setNaturalLightingActiveTransitionContext:v58];
          }
          else
          {
            if (v55)
            {
              uint64_t v59 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v66 = v59;
              __int16 v67 = 2112;
              uint64_t v68 = (uint64_t)v13;
              _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Did not handle Value Transiton Control Charactersitic update: %@", buf, 0x16u);
            }
          }
          v44 = v51;
        }
      }
      uint64_t v19 = v64;
    }
  }
  else
  {
    [(HMDLightProfile *)v7 setNaturalLightingEnabled:0];
    id v33 = (void *)MEMORY[0x230FBD990]([(HMDLightProfile *)v7 setNaturalLightingActiveTransitionContext:0]);
    __int16 v34 = v7;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v66 = v36;
      __int16 v67 = 2112;
      uint64_t v68 = (uint64_t)v11;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Value Transition Control Characteristic value is not of type data: %@", buf, 0x16u);
    }
  }

LABEL_44:
}

- (void)notifyClientsOfUpdatedSettingsWithPreviousSettings:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDLightProfile *)self settings];
  char v7 = [v6 isEqual:v4];

  if ((v7 & 1) == 0)
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDLightProfile *)v9 settings];
      *(_DWORD *)buf = 138543874;
      v49 = v11;
      __int16 v50 = 2112;
      id v51 = v4;
      __int16 v52 = 2112;
      uint64_t v53 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating settings from %@ to %@", buf, 0x20u);
    }
    id v13 = [(HMDLightProfile *)v9 settings];
    int v14 = [v13 supportedFeatures] & 1;

    if (v14 != ([v4 supportedFeatures] & 1))
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v9;
      char v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        uint64_t v19 = HMFBooleanToString();
        __int16 v20 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v49 = v18;
        __int16 v50 = 2112;
        id v51 = v19;
        __int16 v52 = 2112;
        uint64_t v53 = v20;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Requesting to sync siri data since natural lighting supported changed from %@ -> %@", buf, 0x20u);
      }
      uint64_t v21 = [(HMDAccessoryProfile *)v16 accessory];
      uint64_t v22 = [v21 home];
      int v23 = [v22 homeManager];
      [v23 assistantSyncDataChanged:@"Natural lighting support updated"];
    }
    BOOL v24 = [(HMDLightProfile *)v9 isNaturalLightingEnabled];
    int v25 = [v4 isNaturalLightingEnabled];
    if (v24)
    {
      if ((v25 & 1) == 0)
      {
        id v26 = [(HMDLightProfile *)v9 lastNaturalLightingEnabledDate];
        uint64_t v27 = [(HMDLightProfile *)v9 dataSource];
        __int16 v28 = [v27 date];
        [(HMDLightProfile *)v9 setLastNaturalLightingUsedDate:v28];
        [(HMDLightProfile *)v9 setLastNaturalLightingEnabledDate:v28];

        BOOL v29 = (void *)MEMORY[0x230FBD990]();
        char v30 = v9;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          uint32_t v32 = HMFGetLogIdentifier();
          id v33 = [(HMDLightProfile *)v30 lastNaturalLightingEnabledDate];
          *(_DWORD *)buf = 138543874;
          v49 = v32;
          __int16 v50 = 2112;
          id v51 = v33;
          __int16 v52 = 2112;
          uint64_t v53 = v26;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Updating lastNaturalLightingEnabledDate to: %@ from: %@", buf, 0x20u);
        }
      }
      if (![(HMDLightProfile *)v9 supportsCHIP]) {
        [(HMDLightProfile *)v9 synchronizeCurveToAccessory];
      }
    }
    else if (v25)
    {
      __int16 v34 = [(HMDLightProfile *)v9 dataSource];
      id v35 = [v34 date];
      [(HMDLightProfile *)v9 setLastNaturalLightingUsedDate:v35];
    }
    id v36 = [MEMORY[0x263F08A00] defaultCenter];
    [v36 postNotificationName:@"HMDLightProfile.SettingsUpdated" object:v9];

    __int16 v37 = [(HMDLightProfile *)v9 settings];
    id v38 = encodeRootObjectForIncomingXPCMessage(v37, 0);
    uint64_t v47 = v38;
    uint64_t v39 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];

    id v40 = objc_alloc(MEMORY[0x263F42570]);
    __int16 v41 = [(HMDAccessoryProfile *)v9 uniqueIdentifier];
    uint64_t v42 = (void *)[v40 initWithTarget:v41];

    id v43 = objc_alloc(MEMORY[0x263F42590]);
    v44 = (void *)[v43 initWithName:*MEMORY[0x263F0D020] destination:v42 payload:v39];
    [v44 setRequiresSPIEntitlement];
    uint64_t v45 = [(HMDAccessoryProfile *)v9 msgDispatcher];
    [v45 sendMessage:v44];
  }
}

- (void)handleSetNaturalLightingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDLightProfile *)self settings];
  [(HMDLightProfile *)self setNaturalLightingEnabled:v3];
  [(HMDLightProfile *)self notifyClientsOfUpdatedSettingsWithPreviousSettings:v6];
}

- (void)resetNaturalLightingEnabledRetryContext
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDLightProfile *)self naturalLightingEnabledRetryContext];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      int v14 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting natural lighting context: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    id v10 = [v4 completion];
    ((void (**)(void, void *))v10)[2](v10, v9);

    [(HMDLightProfile *)v6 setNaturalLightingEnabledRetryContext:0];
  }
}

- (void)handleFetchNaturalLightColorTemperatureForBrightnessMessage:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  unint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v9;
    __int16 v47 = 2112;
    uint64_t v48 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to fetch color temperature for brightness: %@", buf, 0x16u);
  }
  int v11 = [v4 numberForKey:*MEMORY[0x263F0CFD8]];
  if ([v11 integerValue] < 0)
  {
    int v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = v7;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v28;
      __int16 v47 = 2112;
      uint64_t v48 = v11;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid brightness value: %@", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v12];
  }
  else
  {
    uint64_t v12 = [(HMDLightProfile *)v7 hapAccessory];
    __int16 v13 = [v12 home];
    int v14 = [v13 naturalLightingContext];
    if (v14)
    {
      uint64_t v15 = [(HMDLightProfile *)v7 naturalLightingCurve];
      if ([v12 supportsCHIP])
      {
        uint64_t v16 = [v14 curve];

        uint64_t v15 = (void *)v16;
      }
      if (v15)
      {
        uint64_t v42 = v13;
        char v17 = [(HMDLightProfile *)v7 dataSource];
        uint64_t v18 = [(HMDLightProfile *)v7 dataSource];
        uint64_t v19 = [v18 date];
        __int16 v41 = v14;
        __int16 v20 = [v14 timeZone];
        uint64_t v21 = [v17 millisecondsElapsedSinceStartOfDayWithDate:v19 timeZone:v20];

        uint64_t v22 = objc_msgSend(v15, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(v11, "integerValue"), v21);
        int v23 = (void *)v22;
        if (v22)
        {
          uint64_t v43 = *MEMORY[0x263F0CFE8];
          uint64_t v44 = v22;
          BOOL v24 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          [v4 respondWithPayload:v24];
        }
        else
        {
          __int16 v37 = (void *)MEMORY[0x230FBD990]();
          id v38 = v7;
          uint64_t v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            id v40 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v46 = v40;
            __int16 v47 = 2112;
            uint64_t v48 = v11;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to calculate color temperature value for brightness: %@", buf, 0x16u);
          }
          BOOL v24 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
          [v4 respondWithError:v24];
        }
        int v14 = v41;
        __int16 v13 = v42;
      }
      else
      {
        id v33 = (void *)MEMORY[0x230FBD990]();
        __int16 v34 = v7;
        id v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v36;
          __int16 v47 = 2112;
          uint64_t v48 = 0;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting curve is not set: %@", buf, 0x16u);
        }
        int v23 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
        [v4 respondWithError:v23];
      }
    }
    else
    {
      BOOL v29 = (void *)MEMORY[0x230FBD990]();
      char v30 = v7;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint32_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v32;
        __int16 v47 = 2112;
        uint64_t v48 = 0;
        __int16 v49 = 2112;
        __int16 v50 = v13;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting context not set for home (%@:%@)", buf, 0x20u);
      }
      uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
      [v4 respondWithError:v15];
    }
  }
}

- (void)handleSetNaturalLightingEnabledMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  unint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v4 messagePayload];
    int v11 = [(HMDLightProfile *)v7 hapAccessory];
    [v11 supportsCHIP];
    uint64_t v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    int v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    BOOL v29 = v12;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to set Natural Lighting setting: %@ supportsCHIP: %@", buf, 0x20u);
  }
  __int16 v13 = [(HMDLightProfile *)v7 hapAccessory];
  int v14 = [v13 supportsCHIP];

  if (v14)
  {
    [(HMDLightProfile *)v7 handleSetNaturalLightingEnabledMessageForMatterAccessory:v4];
  }
  else
  {
    uint64_t v15 = [v4 BOOLForKey:*MEMORY[0x263F0D008]];
    uint64_t v16 = [v4 BOOLForKey:*MEMORY[0x263F0D010]];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    __int16 v20 = __58__HMDLightProfile_handleSetNaturalLightingEnabledMessage___block_invoke;
    uint64_t v21 = &unk_264A2F370;
    id v22 = v4;
    int v23 = v7;
    char v17 = _Block_copy(&v18);
    -[HMDLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:](v7, "setNaturalLightingEnabled:shouldRetryOnFailure:completion:", v15, v16, v17, v18, v19, v20, v21);
  }
}

void __58__HMDLightProfile_handleSetNaturalLightingEnabledMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F0D018];
    id v4 = [*(id *)(a1 + 40) settings];
    id v5 = encodeRootObjectForIncomingXPCMessage(v4, 0);
    v8[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

    [*(id *)(a1 + 32) respondWithPayload:v6];
  }
}

- (void)registerForMessages
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDLightProfile *)self hapAccessory];
  id v5 = [v4 home];
  id v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v5 naturalLightingContext];

    if (v7)
    {
      unint64_t v8 = [(HMDLightProfile *)self settings];
      uint64_t v9 = [v4 supportsNaturalLighting];
      -[HMDLightProfile setNaturalLightingSupported:](self, "setNaturalLightingSupported:", [v9 BOOLValue]);

      [(HMDLightProfile *)self setSupportedFeatures:[(HMDLightProfile *)self isNaturalLightingSupported]];
      id v10 = [v4 naturalLightingEnabled];
      -[HMDLightProfile setNaturalLightingEnabled:](self, "setNaturalLightingEnabled:", [v10 BOOLValue]);

      int v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        [(HMDLightProfile *)v12 isNaturalLightingSupported];
        uint64_t v15 = HMFBooleanToString();
        [(HMDLightProfile *)v12 isNaturalLightingEnabled];
        uint64_t v16 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        __int16 v49 = v14;
        __int16 v50 = 2112;
        uint64_t v51 = v15;
        __int16 v52 = 2112;
        uint64_t v53 = v16;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@registerForMessages: Setting naturalLightingSupported: %@ naturalLightingEnabled: %@", buf, 0x20u);
      }
      if ([(HMDLightProfile *)v12 isNaturalLightingSupported]
        || [(HMDLightProfile *)v12 isNaturalLightingEnabled])
      {
        [(HMDLightProfile *)v12 notifyClientsOfUpdatedSettingsWithPreviousSettings:v8];
      }
    }
    char v17 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v18 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    uint64_t v19 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:0 remoteAccessRequired:0];
    if ([v4 supportsCHIP])
    {
      v47[0] = v17;
      v47[1] = v18;
      v47[2] = v19;
      __int16 v20 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v21 = (void **)v47;
      uint64_t v22 = 3;
    }
    else
    {
      uint64_t v46 = v17;
      __int16 v20 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v21 = &v46;
      uint64_t v22 = 1;
    }
    uint64_t v27 = [v20 arrayWithObjects:v21 count:v22];
    __int16 v28 = (void *)MEMORY[0x230FBD990]();
    BOOL v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v49 = v31;
      __int16 v50 = 2112;
      uint64_t v51 = v6;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Registering for xpc handler messages with home: %@", buf, 0x16u);
    }
    uint32_t v32 = [(HMDAccessoryProfile *)v29 msgDispatcher];
    [v32 registerForMessage:*MEMORY[0x263F0D000] receiver:v29 policies:v27 selector:sel_handleSetNaturalLightingEnabledMessage_];

    id v33 = [(HMDAccessoryProfile *)v29 msgDispatcher];
    [v33 registerForMessage:*MEMORY[0x263F0CFF0] receiver:v29 policies:v27 selector:sel_handleFetchNaturalLightColorTemperatureForBrightnessMessage_];

    __int16 v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v29 selector:sel_handleAccessorySupportsNaturalLightingDidChangeNotification_ name:@"HMDAccessorySupportsNaturalLightingDidChangeNotification" object:v4];

    id v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:v29 selector:sel_handleAccessoryNaturalLightingEnabledDidChangeNotification_ name:@"HMDAccessoryNaturalLightingEnabledDidChangeNotification" object:v4];

    if ([v4 supportsCHIP]) {
      goto LABEL_24;
    }
    uint64_t v36 = [v4 matterNodeID];
    if (!v36) {
      goto LABEL_21;
    }
    __int16 v37 = (void *)v36;
    id v38 = [v4 matterNodeID];
    char v39 = [v38 isEqual:&unk_26E473918];

    if ((v39 & 1) == 0)
    {
LABEL_24:
      uint64_t v45 = [(HMDLightProfile *)v29 matterCurveWriter];
      [v45 configureWithLightProfile:v29];
    }
    else
    {
LABEL_21:
      id v40 = [(HMDLightProfile *)v29 naturalLightingCurveWriter];
      [v40 configureWithLightProfile:v29];

      __int16 v41 = [MEMORY[0x263F08A00] defaultCenter];
      [v41 addObserver:v29 selector:sel_handleHomeDidEnableCharacteristicNotification_ name:@"HMDHomeDidEnableCharacteristicNotifyEventNotification" object:v6];

      uint64_t v42 = [MEMORY[0x263F08A00] defaultCenter];
      [v42 addObserver:v29 selector:sel_handleHomeDidDisableCharacteristicNotification_ name:@"HMDHomeDidDisableCharacteristicNotifyEventNotification" object:v6];

      uint64_t v43 = [(HMDLightProfile *)v29 characteristicsAvailabilityListener];
      [v43 setDelegate:v29];

      uint64_t v44 = [(HMDLightProfile *)v29 characteristicsAvailabilityListener];
      [v44 start];

      if ([v6 hasCharacteristicNotificationRegistrations]
        && [(HMDLightProfile *)v29 enableNaturalLightingCharacteristicNotificationsForObserver:v6])
      {
        [(HMDLightProfile *)v29 readNaturalLightingCharacteristicsWithReason:@"Characteristic notifications enabled"];
      }
    }
  }
  else
  {
    int v23 = (void *)MEMORY[0x230FBD990]();
    BOOL v24 = self;
    int v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  id v4 = [(NSSet *)self->_notificationEnabledCharacteristics allObjects];
  [WeakRetained setNotificationsEnabled:0 forCharacteristics:v4 clientIdentifier:self->_clientIdentifier];

  v5.receiver = self;
  v5.super_class = (Class)HMDLightProfile;
  [(HMDLightProfile *)&v5 dealloc];
}

- (HMDLightProfile)initWithUUID:(id)a3 workQueue:(id)a4 lightService:(id)a5 accessory:(id)a6 matterCurveWriter:(id)a7 dataSource:(id)a8
{
  v26[1] = *MEMORY[0x263EF8340];
  id v15 = a5;
  id v16 = a6;
  id v24 = a7;
  id v23 = a8;
  v26[0] = v15;
  char v17 = (void *)MEMORY[0x263EFF8C0];
  id v18 = a4;
  id v19 = a3;
  __int16 v20 = [v17 arrayWithObjects:v26 count:1];
  v25.receiver = self;
  v25.super_class = (Class)HMDLightProfile;
  uint64_t v21 = [(HMDAccessoryProfile *)&v25 initWithAccessory:v16 uniqueIdentifier:v19 services:v20 workQueue:v18];

  if (v21)
  {
    objc_storeStrong((id *)&v21->_service, a5);
    objc_storeWeak((id *)&v21->_hapAccessory, v16);
    objc_storeStrong((id *)&v21->_matterCurveWriter, a7);
    objc_storeStrong((id *)&v21->_dataSource, a8);
  }

  return v21;
}

- (HMDLightProfile)initWithUUID:(id)a3 workQueue:(id)a4 lightService:(id)a5 accessory:(id)a6 characteristicsAvailabilityListener:(id)a7 naturalLightingCurveWriter:(id)a8 dataSource:(id)a9
{
  v38[1] = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v17 = a6;
  id v35 = a7;
  id v34 = a8;
  id v33 = a9;
  uint64_t v36 = v16;
  v38[0] = v16;
  id v18 = (void *)MEMORY[0x263EFF8C0];
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [v18 arrayWithObjects:v38 count:1];
  v37.receiver = self;
  v37.super_class = (Class)HMDLightProfile;
  uint64_t v22 = [(HMDAccessoryProfile *)&v37 initWithAccessory:v17 uniqueIdentifier:v20 services:v21 workQueue:v19];

  if (v22)
  {
    objc_storeStrong((id *)&v22->_service, a5);
    objc_storeStrong((id *)&v22->_characteristicsAvailabilityListener, a7);
    objc_storeWeak((id *)&v22->_hapAccessory, v17);
    uint64_t v23 = [MEMORY[0x263EFFA08] set];
    notificationEnabledCharacteristics = v22->_notificationEnabledCharacteristics;
    v22->_notificationEnabledCharacteristics = (NSSet *)v23;

    objc_super v25 = NSString;
    __int16 v26 = [MEMORY[0x263F08C38] UUID];
    uint64_t v27 = [v26 UUIDString];
    uint64_t v28 = [v25 stringWithFormat:@"%@.HMDLightProfile.%@", @"com.apple.HomeKitDaemon", v27, v33, v34, v35, v36];
    clientIdentifier = v22->_clientIdentifier;
    v22->_clientIdentifier = (NSString *)v28;

    objc_storeStrong((id *)&v22->_naturalLightingCurveWriter, a8);
    objc_storeStrong((id *)&v22->_dataSource, a9);
    uint64_t v30 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    characteristicValueObservers = v22->_characteristicValueObservers;
    v22->_characteristicValueObservers = (NSHashTable *)v30;
  }
  return v22;
}

- (HMDLightProfile)initWithWorkQueue:(id)a3 lightService:(id)a4 accessory:(id)a5
{
  v60[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v52 = objc_alloc_init(HMDLightProfileDataSource);
  int v11 = NSString;
  uint64_t v12 = [v9 instanceID];
  __int16 v13 = [v11 stringWithFormat:@"%@", v12];

  int v14 = (void *)MEMORY[0x263F08C38];
  id v15 = [v10 uuid];
  v60[0] = v13;
  v60[1] = @"2BB698E3-7C61-4B4F-B60A-33194DF41A06";
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  id v17 = objc_msgSend(v14, "hm_deriveUUIDFromBaseUUID:withSalts:", v15, v16);

  if (!_os_feature_enabled_impl()) {
    goto LABEL_5;
  }
  if ([v10 supportsCHIP]) {
    goto LABEL_9;
  }
  uint64_t v18 = [v10 matterNodeID];
  if (!v18) {
    goto LABEL_5;
  }
  id v19 = (void *)v18;
  id v20 = [v10 matterNodeID];
  char v21 = [v20 isEqual:&unk_26E473918];

  if ((v21 & 1) == 0)
  {
LABEL_9:
    __int16 v41 = +[HMDDeviceCapabilities deviceCapabilities];
    int v42 = [v41 isResidentCapable];

    if (v42)
    {
      uint64_t v43 = (void *)MEMORY[0x230FBD990]();
      uint64_t v44 = self;
      uint64_t v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        uint64_t v46 = v51 = v43;
        __int16 v47 = [v10 name];
        *(_DWORD *)buf = 138543618;
        os_log_type_t v57 = v46;
        __int16 v58 = 2112;
        uint64_t v59 = v47;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@HMDLightProfile creating matter curve writer for accessory: %@", buf, 0x16u);

        uint64_t v43 = v51;
      }

      uint32_t v32 = [[HMDNaturalLightingMatterCurveWriter alloc] initWithWorkQueue:v8 accessory:v10];
    }
    else
    {
      uint32_t v32 = 0;
    }
    char v39 = v52;
    id v40 = [(HMDLightProfile *)self initWithUUID:v17 workQueue:v8 lightService:v9 accessory:v10 matterCurveWriter:v32 dataSource:v52];
  }
  else
  {
LABEL_5:
    __int16 v50 = v13;
    uint64_t v22 = +[HMDDeviceCapabilities deviceCapabilities];
    int v23 = [v22 isResidentCapable];

    if (v23)
    {
      __int16 v49 = [v10 home];
      id v24 = NSString;
      objc_super v25 = [v49 name];
      [v10 name];
      id v26 = v8;
      id v27 = v9;
      v29 = uint64_t v28 = self;
      uint64_t v30 = [v17 UUIDString];
      id v31 = [v24 stringWithFormat:@"%@/%@/%@", v25, v29, v30];

      self = v28;
      id v9 = v27;
      id v8 = v26;

      uint32_t v32 = [[HMDNaturalLightingCurveWriter alloc] initWithUUID:v17 workQueue:v26 logIdentifier:v31];
    }
    else
    {
      uint32_t v32 = 0;
    }
    id v33 = (void *)MEMORY[0x263EFFA08];
    v55[0] = @"00000143-0000-1000-8000-0026BB765291";
    v55[1] = @"00000144-0000-1000-8000-0026BB765291";
    uint64_t v34 = *MEMORY[0x263F0BF68];
    v55[2] = *MEMORY[0x263F0BFF8];
    v55[3] = v34;
    v55[4] = @"0000024B-0000-1000-8000-0026BB765291";
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:5];
    uint64_t v36 = [v33 setWithArray:v35];

    uint64_t v53 = *MEMORY[0x263F0D780];
    uint64_t v54 = v36;
    objc_super v37 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v38 = [[HMDCharacteristicsAvailabilityListener alloc] initWithAccessory:v10 workQueue:v8 interestedCharacteristicTypesByServiceType:v37];
    char v39 = v52;
    id v40 = [(HMDLightProfile *)self initWithUUID:v17 workQueue:v8 lightService:v9 accessory:v10 characteristicsAvailabilityListener:v38 naturalLightingCurveWriter:v32 dataSource:v52];

    __int16 v13 = v50;
  }

  return v40;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t76 != -1) {
    dispatch_once(&logCategory__hmf_once_t76, &__block_literal_global_164_255333);
  }
  id v2 = (void *)logCategory__hmf_once_v77;
  return v2;
}

void __30__HMDLightProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v77;
  logCategory__hmf_once_id v77 = v0;
}

@end
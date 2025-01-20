@interface HMDSiriEndpointProfile
+ (BOOL)supportsSecureCoding;
+ (id)namespace;
+ (id)uniqueIdentifierFromAccessory:(id)a3;
+ (void)initialize;
- (BOOL)_notificationEnabledForType:(unint64_t)a3;
- (BOOL)manuallyDisabled;
- (HMDSiriEndpointProfile)initWithSiriEndpointServices:(id)a3;
- (HMDSiriEndpointProfile)initWithSiriEndpointServices:(id)a3 notificationCenter:(id)a4;
- (HMFStagedValue)stagedNeedsOnboarding;
- (NSArray)_allEndpointCharacteristicsToMonitor;
- (NSArray)_allSettingsCharacteristicsToMonitor;
- (NSArray)assistants;
- (NSArray)profileServices;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)activeIdentifier;
- (NSNumber)needsOnboarding;
- (NSString)clientEndpointIdentifier;
- (NSString)clientSettingsIdentifier;
- (NSString)siriEndpointVersion;
- (NSString)siriEngineVersion;
- (NSUUID)sessionHubIdentifier;
- (id)_siriEndpointActiveIdentifierCharacteristic;
- (id)_siriEndpointActiveIdentifierReadRequest;
- (id)_siriEndpointManuallyDisabledCharacteristic;
- (id)_siriEndpointManuallyDisabledReadRequest;
- (id)_siriEndpointService;
- (id)_siriEndpointSessionStatusCharacteristic;
- (id)_siriEndpointSessionStatusReadRequest;
- (id)_siriEndpointVersionCharacteristic;
- (id)_siriEndpointVersionReadRequest;
- (id)_siriService;
- (id)_siriSettingMultifunctionButtonCharacteristic;
- (id)_siriSettingMultifunctionButtonReadRequest;
- (id)_siriSettingSiriEnableCharacteristic;
- (id)_siriSettingSiriEnableReadRequest;
- (id)_siriSettingSiriEngineVersionCharacteristic;
- (id)_siriSettingSiriEngineVersionReadRequest;
- (id)_siriSettingSiriLightOnUseCharacteristic;
- (id)_siriSettingSiriLightOnUseReadRequest;
- (id)_siriSettingSiriListeningCharacteristic;
- (id)_siriSettingSiriListeningReadRequest;
- (id)_siriSettingSiriTouchCharacteristic;
- (id)_siriSettingSiriTouchReadRequest;
- (id)attributeDescriptions;
- (int64_t)multifunctionButton;
- (int64_t)sessionState;
- (int64_t)siriEnable;
- (int64_t)siriLightOnUse;
- (int64_t)siriListening;
- (int64_t)siriSoundOnUse;
- (int64_t)siriTouchToUse;
- (unint64_t)_capability;
- (unint64_t)notifications;
- (void)_handleCharacteristicChanges:(id)a3;
- (void)_handleRefreshProfileState:(id)a3;
- (void)_handleRefreshProfileState:(id)a3 completionHandler:(id)a4;
- (void)_notificationEnable:(BOOL)a3 forType:(unint64_t)a4;
- (void)_notifyProfileSettingsUpdated:(id)a3;
- (void)_setNotifications:(BOOL)a3 options:(unint64_t)a4;
- (void)_updateSessionState:(id)a3 settings:(id)a4 message:(id)a5;
- (void)addService:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleDeviceCapabilitiesUpdated:(id)a3;
- (void)handleEnableNotifications:(id)a3;
- (void)handleHomeCharacteristicValuesChanged:(id)a3;
- (void)handlePrimaryResidentChanged:(id)a3;
- (void)handleUpdateNeedsOnboarding:(id)a3;
- (void)notifyClientsDidUpdateStagedNeedsOnboarding;
- (void)refreshStateWithCompletionHandler:(id)a3;
- (void)registerForMessages;
- (void)registerForNotifications;
- (void)setActiveIdentifier:(id)a3;
- (void)setAssistants:(id)a3;
- (void)setEnable:(int64_t)a3 completionHandler:(id)a4;
- (void)setLightOnUse:(int64_t)a3 completionHandler:(id)a4;
- (void)setListening:(int64_t)a3 completionHandler:(id)a4;
- (void)setManuallyDisabled:(BOOL)a3;
- (void)setMultifunctionButton:(int64_t)a3;
- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4;
- (void)setNotifications:(unint64_t)a3;
- (void)setProfileServices:(id)a3;
- (void)setSessionHubIdentifier:(id)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setSiriEnable:(int64_t)a3;
- (void)setSiriEndpointVersion:(id)a3;
- (void)setSiriEngineVersion:(id)a3;
- (void)setSiriLightOnUse:(int64_t)a3;
- (void)setSiriListening:(int64_t)a3;
- (void)setSiriTouchToUse:(int64_t)a3;
- (void)setSoundOnUse:(int64_t)a3 completionHandler:(id)a4;
- (void)setTouchToUse:(int64_t)a3 completionHandler:(id)a4;
- (void)stageNeedsOnboarding:(int64_t)a3;
- (void)stageNeedsOnboarding:(int64_t)a3 withTimeout:(double)a4;
- (void)stagedValue:(id)a3 didExpireValue:(id)a4;
- (void)unregisterForNotifications;
- (void)updateNeedsOnboarding:(int64_t)a3 withTimeout:(double)a4;
@end

@implementation HMDSiriEndpointProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_assistants, 0);
  objc_storeStrong((id *)&self->_activeIdentifier, 0);
  objc_storeStrong((id *)&self->_clientSettingsIdentifier, 0);
  objc_storeStrong((id *)&self->_clientEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_siriEngineVersion, 0);
  objc_storeStrong((id *)&self->_stagedNeedsOnboarding, 0);
  objc_storeStrong((id *)&self->_profileServices, 0);
  objc_storeStrong((id *)&self->_siriEndpointVersion, 0);
  objc_storeStrong((id *)&self->_sessionHubIdentifier, 0);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)clientSettingsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)clientEndpointIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (HMFStagedValue)stagedNeedsOnboarding
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSessionState:(int64_t)a3
{
  self->_sessionState = a3;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setNotifications:(unint64_t)a3
{
  self->_notifications = a3;
}

- (unint64_t)notifications
{
  return self->_notifications;
}

- (void)_setNotifications:(BOOL)a3 options:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a4 == 2)
  {
    v7 = [(HMDSiriEndpointProfile *)self _allSettingsCharacteristicsToMonitor];
    uint64_t v8 = [(HMDSiriEndpointProfile *)self clientSettingsIdentifier];
LABEL_5:
    v9 = (void *)v8;
    if (v8 && [v7 count])
    {
      v10 = [(HMDAccessoryProfile *)self accessory];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      id v12 = v11;

      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      v16 = v15;
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier();
          v18 = @"Disabling";
          int v29 = 138544130;
          v30 = v17;
          if (v5) {
            v18 = @"Enabling";
          }
          __int16 v31 = 2112;
          unint64_t v32 = (unint64_t)v18;
          __int16 v33 = 2112;
          uint64_t v34 = (uint64_t)v9;
          __int16 v35 = 2112;
          v36 = v7;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Profile Notifications] %@ notifications for characteristics for %@: %@", (uint8_t *)&v29, 0x2Au);
        }
        [v12 enableNotification:v5 forCharacteristics:v7 message:0 clientIdentifier:v9];
        [(HMDSiriEndpointProfile *)v14 _notificationEnable:v5 forType:a4];
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v28 = HMFGetLogIdentifier();
          int v29 = 138543362;
          v30 = v28;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] accessory not part of profile", (uint8_t *)&v29, 0xCu);
        }
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        if (v5) {
          v23 = @"enable";
        }
        else {
          v23 = @"disable";
        }
        int v29 = 138544130;
        v30 = v22;
        __int16 v31 = 2112;
        unint64_t v32 = (unint64_t)v23;
        __int16 v33 = 2048;
        uint64_t v34 = [v7 count];
        __int16 v35 = 2112;
        v36 = v9;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] nothing to %@ because characteristic.count (%ld) or client indentifier %@", (uint8_t *)&v29, 0x2Au);
      }
    }

    return;
  }
  if (a4 == 1)
  {
    v7 = [(HMDSiriEndpointProfile *)self _allEndpointCharacteristicsToMonitor];
    uint64_t v8 = [(HMDSiriEndpointProfile *)self clientEndpointIdentifier];
    goto LABEL_5;
  }
  v24 = (void *)MEMORY[0x230FBD990](self, a2);
  v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    int v29 = 138543618;
    v30 = v27;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] options is not valid: %ld", (uint8_t *)&v29, 0x16u);
  }
}

- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4
{
  v7 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDSiriEndpointProfile_setNotifications_options___block_invoke;
  block[3] = &unk_264A21408;
  block[4] = self;
  block[5] = a4;
  BOOL v9 = a3;
  dispatch_async(v7, block);
}

void __51__HMDSiriEndpointProfile_setNotifications_options___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    [*(id *)(a1 + 32) _setNotifications:*(unsigned __int8 *)(a1 + 48) options:1];
    if ((*(unsigned char *)(a1 + 40) & 2) == 0) {
      return;
    }
  }
  else if ((v2 & 2) == 0)
  {
    v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543618;
      v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@[Notifications] options is not valid: %ld", (uint8_t *)&v10, 0x16u);
    }
    return;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
  [v8 _setNotifications:v9 options:2];
}

- (NSArray)_allSettingsCharacteristicsToMonitor
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDSiriEndpointProfile *)self _siriSettingSiriEnableCharacteristic];
  if (v4) {
    [v3 addObject:v4];
  }
  BOOL v5 = [(HMDSiriEndpointProfile *)self _siriSettingSiriListeningCharacteristic];

  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [(HMDSiriEndpointProfile *)self _siriSettingSiriTouchCharacteristic];

  if (v6) {
    [v3 addObject:v6];
  }
  uint64_t v7 = [(HMDSiriEndpointProfile *)self _siriSettingSiriLightOnUseCharacteristic];

  if (v7) {
    [v3 addObject:v7];
  }
  uint64_t v8 = [(HMDSiriEndpointProfile *)self _siriEndpointActiveIdentifierCharacteristic];

  if (v8) {
    [v3 addObject:v8];
  }
  uint64_t v9 = [(HMDSiriEndpointProfile *)self _siriEndpointManuallyDisabledCharacteristic];

  if (v9) {
    [v3 addObject:v9];
  }
  int v10 = [(HMDSiriEndpointProfile *)self _siriSettingMultifunctionButtonCharacteristic];

  if (v10) {
    [v3 addObject:v10];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(HMDSiriEndpointProfile *)self assistants];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) characteristicsToMonitor];
        [v3 addObjectsFromArray:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v17 = (void *)[v3 copy];
  return (NSArray *)v17;
}

- (NSArray)_allEndpointCharacteristicsToMonitor
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDSiriEndpointProfile *)self _siriEndpointSessionStatusCharacteristic];
  if (v4) {
    [v3 addObject:v4];
  }
  BOOL v5 = (void *)[v3 copy];

  return (NSArray *)v5;
}

- (void)_notificationEnable:(BOOL)a3 forType:(unint64_t)a4
{
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v5) {
    unint64_t v8 = [(HMDSiriEndpointProfile *)self notifications] | a4;
  }
  else {
    unint64_t v8 = [(HMDSiriEndpointProfile *)self notifications] & (a4 == 0);
  }
  [(HMDSiriEndpointProfile *)self setNotifications:v8];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_notificationEnabledForType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(a3) = (a3 & ~[(HMDSiriEndpointProfile *)self notifications]) == 0;
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__HMDSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRefreshProfileState:0 completionHandler:*(void *)(a1 + 40)];
}

- (void)setSoundOnUse:(int64_t)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void *))a4;
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)setLightOnUse:(int64_t)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    id v8 = [(HMDAccessoryProfile *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v11 = [(HMDSiriEndpointProfile *)self _siriSettingSiriLightOnUseCharacteristic];
      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v12 = [NSNumber numberWithInteger:a3 == 1];
      uint64_t v13 = [v11 authorizationData];
      uint64_t v14 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v11 value:v12 authorizationData:v13 type:0];

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        v16 = [(HMDAccessoryProfile *)self workQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __58__HMDSiriEndpointProfile_setLightOnUse_completionHandler___block_invoke;
        v26[3] = &unk_264A29D48;
        objc_copyWeak(v29, location);
        id v17 = v14;
        id v27 = v17;
        id v28 = v6;
        v29[1] = (id)a3;
        [v10 writeCharacteristicValues:v15 source:7 queue:v16 completionHandler:v26];

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x230FBD990]();
        long long v19 = self;
        long long v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = HMFGetLogIdentifier();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Light On Use] failed to create siri enable write request", (uint8_t *)location, 0xCu);
        }
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        if (v6) {
          (*((void (**)(id, id))v6 + 2))(v6, v17);
        }
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Light On Use] accessory not part of profile", (uint8_t *)location, 0xCu);
      }
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      if (v6) {
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
      }
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v7);
    }
  }
}

void __58__HMDSiriEndpointProfile_setLightOnUse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __int16 v35 = (void *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        uint64_t v36 = v6;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "error", v34);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            uint64_t v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              long long v19 = [v10 request];
              long long v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              __int16 v46 = 2112;
              v47 = v19;
              __int16 v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v36;
            }

            uint64_t v7 = (void *)v12;
          }
          else
          {
            long long v21 = [v10 request];
            long long v22 = [v21 characteristic];
            v23 = [v22 type];
            int v24 = [v23 isEqual:@"00000258-0000-1000-8000-0026BB765291"];

            if (v24)
            {
              [WeakRetained setSiriLightOnUse:v35[7]];
              v42 = @"settings-light";
              v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "siriLightOnUse"));
              v43 = v25;
              v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

              [WeakRetained _notifyProfileSettingsUpdated:v26];
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v33 = v35[5];
    if (v33) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    }
    id v3 = v34;
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = WeakRetained;
    int v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      __int16 v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);
    }
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    uint64_t v32 = v35[5];
    if (v32) {
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
    }
  }
}

- (void)setTouchToUse:(int64_t)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    uint64_t v8 = [(HMDAccessoryProfile *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v11 = [(HMDSiriEndpointProfile *)self _siriSettingSiriTouchCharacteristic];
      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v12 = [NSNumber numberWithInteger:a3 == 1];
      uint64_t v13 = [v11 authorizationData];
      id v14 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v11 value:v12 authorizationData:v13 type:0];

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        uint64_t v16 = [(HMDAccessoryProfile *)self workQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __58__HMDSiriEndpointProfile_setTouchToUse_completionHandler___block_invoke;
        v26[3] = &unk_264A29D48;
        objc_copyWeak(v29, location);
        id v17 = v14;
        id v27 = v17;
        id v28 = v6;
        v29[1] = (id)a3;
        [v10 writeCharacteristicValues:v15 source:7 queue:v16 completionHandler:v26];

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x230FBD990]();
        long long v19 = self;
        long long v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = HMFGetLogIdentifier();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Touch To Use] failed to create siri enable write request", (uint8_t *)location, 0xCu);
        }
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        if (v6) {
          (*((void (**)(id, id))v6 + 2))(v6, v17);
        }
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      int v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Touch To Use] accessory not part of profile", (uint8_t *)location, 0xCu);
      }
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      if (v6) {
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
      }
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v7);
    }
  }
}

void __58__HMDSiriEndpointProfile_setTouchToUse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __int16 v35 = (void *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        uint64_t v36 = v6;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "error", v34);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            uint64_t v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              long long v19 = [v10 request];
              long long v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              __int16 v46 = 2112;
              v47 = v19;
              __int16 v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v36;
            }

            uint64_t v7 = (void *)v12;
          }
          else
          {
            long long v21 = [v10 request];
            long long v22 = [v21 characteristic];
            v23 = [v22 type];
            int v24 = [v23 isEqual:@"00000257-0000-1000-8000-0026BB765291"];

            if (v24)
            {
              [WeakRetained setSiriTouchToUse:v35[7]];
              v42 = @"settings-touch";
              v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "siriTouchToUse"));
              v43 = v25;
              v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

              [WeakRetained _notifyProfileSettingsUpdated:v26];
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v33 = v35[5];
    if (v33) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    }
    id v3 = v34;
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = WeakRetained;
    int v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      __int16 v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);
    }
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    uint64_t v32 = v35[5];
    if (v32) {
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
    }
  }
}

- (void)setListening:(int64_t)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    uint64_t v8 = [(HMDAccessoryProfile *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v11 = [(HMDSiriEndpointProfile *)self _siriSettingSiriListeningCharacteristic];
      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v12 = [NSNumber numberWithInteger:a3 == 1];
      uint64_t v13 = [v11 authorizationData];
      id v14 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v11 value:v12 authorizationData:v13 type:0];

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        uint64_t v16 = [(HMDAccessoryProfile *)self workQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __57__HMDSiriEndpointProfile_setListening_completionHandler___block_invoke;
        v26[3] = &unk_264A29D48;
        objc_copyWeak(v29, location);
        id v17 = v14;
        id v27 = v17;
        id v28 = v6;
        v29[1] = (id)a3;
        [v10 writeCharacteristicValues:v15 source:7 queue:v16 completionHandler:v26];

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x230FBD990]();
        long long v19 = self;
        long long v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = HMFGetLogIdentifier();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Listening] failed to create siri enable write request", (uint8_t *)location, 0xCu);
        }
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        if (v6) {
          (*((void (**)(id, id))v6 + 2))(v6, v17);
        }
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      int v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Listening] accessory not part of profile", (uint8_t *)location, 0xCu);
      }
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      if (v6) {
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
      }
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v7);
    }
  }
}

void __57__HMDSiriEndpointProfile_setListening_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __int16 v35 = (void *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        uint64_t v36 = v6;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "error", v34);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            uint64_t v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              long long v19 = [v10 request];
              long long v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              __int16 v46 = 2112;
              v47 = v19;
              __int16 v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v36;
            }

            uint64_t v7 = (void *)v12;
          }
          else
          {
            long long v21 = [v10 request];
            long long v22 = [v21 characteristic];
            v23 = [v22 type];
            int v24 = [v23 isEqual:@"00000256-0000-1000-8000-0026BB765291"];

            if (v24)
            {
              [WeakRetained setSiriListening:v35[7]];
              v42 = @"settings-listening";
              v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "siriListening"));
              v43 = v25;
              v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

              [WeakRetained _notifyProfileSettingsUpdated:v26];
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v33 = v35[5];
    if (v33) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    }
    id v3 = v34;
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = WeakRetained;
    int v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      __int16 v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);
    }
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    uint64_t v32 = v35[5];
    if (v32) {
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
    }
  }
}

- (void)setEnable:(int64_t)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    uint64_t v8 = [(HMDAccessoryProfile *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v11 = [(HMDSiriEndpointProfile *)self _siriSettingSiriEnableCharacteristic];
      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v12 = [NSNumber numberWithInteger:a3 == 1];
      uint64_t v13 = [v11 authorizationData];
      id v14 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v11 value:v12 authorizationData:v13 type:0];

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        uint64_t v16 = [(HMDAccessoryProfile *)self workQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __54__HMDSiriEndpointProfile_setEnable_completionHandler___block_invoke;
        v26[3] = &unk_264A29D48;
        objc_copyWeak(v29, location);
        id v17 = v14;
        id v27 = v17;
        id v28 = v6;
        v29[1] = (id)a3;
        [v10 writeCharacteristicValues:v15 source:7 queue:v16 completionHandler:v26];

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x230FBD990]();
        long long v19 = self;
        long long v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = HMFGetLogIdentifier();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Enable] failed to create siri enable write request", (uint8_t *)location, 0xCu);
        }
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        if (v6) {
          (*((void (**)(id, id))v6 + 2))(v6, v17);
        }
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      int v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Enable] accessory not part of profile", (uint8_t *)location, 0xCu);
      }
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      if (v6) {
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
      }
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v7);
    }
  }
}

void __54__HMDSiriEndpointProfile_setEnable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __int16 v35 = (void *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        uint64_t v36 = v6;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "error", v34);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            uint64_t v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              long long v19 = [v10 request];
              long long v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              __int16 v46 = 2112;
              v47 = v19;
              __int16 v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v36;
            }

            uint64_t v7 = (void *)v12;
          }
          else
          {
            long long v21 = [v10 request];
            long long v22 = [v21 characteristic];
            v23 = [v22 type];
            int v24 = [v23 isEqual:@"00000255-0000-1000-8000-0026BB765291"];

            if (v24)
            {
              [WeakRetained setSiriEnable:v35[7]];
              v42 = @"settings-enable";
              v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "siriEnable"));
              v43 = v25;
              v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

              [WeakRetained _notifyProfileSettingsUpdated:v26];
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v33 = v35[5];
    if (v33) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    }
    id v3 = v34;
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = WeakRetained;
    int v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      __int16 v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);
    }
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    uint64_t v32 = v35[5];
    if (v32) {
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HMDSiriEndpointProfile;
  id v4 = a3;
  [(HMDAccessoryProfile *)&v15 encodeWithCoder:v4];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile sessionState](self, "sessionState", v15.receiver, v15.super_class));
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0D998]];

  uint64_t v6 = [(HMDSiriEndpointProfile *)self sessionHubIdentifier];
  uint64_t v7 = [v6 UUIDString];
  [v4 encodeObject:v7 forKey:*MEMORY[0x263F0D990]];

  uint64_t v8 = [(HMDSiriEndpointProfile *)self siriEndpointVersion];
  [v4 encodeObject:v8 forKey:*MEMORY[0x263F0D9B8]];

  unint64_t v9 = [(HMDSiriEndpointProfile *)self _capability];
  [v4 encodeInteger:v9 forKey:*MEMORY[0x263F0D948]];
  id v10 = [(HMDSiriEndpointProfile *)self siriEngineVersion];
  [v4 encodeObject:v10 forKey:*MEMORY[0x263F0D9A8]];

  v11 = [(HMDSiriEndpointProfile *)self activeIdentifier];
  [v4 encodeObject:v11 forKey:*MEMORY[0x263F0D920]];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"));
  [v4 encodeObject:v12 forKey:*MEMORY[0x263F0D968]];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
  [v4 encodeObject:v13 forKey:*MEMORY[0x263F0D970]];

  id v14 = [(HMDSiriEndpointProfile *)self assistants];
  [v4 encodeObject:v14 forKey:*MEMORY[0x263F0D940]];
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  uint64_t v5 = (void *)[v3 initWithName:@"uniqueIdentifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDSiriEndpointProfile *)self sessionState];
  uint64_t v7 = HMSiriEndpointProfileSessionStateTypeToString();
  uint64_t v8 = (void *)[v6 initWithName:@"sessionState" value:v7];
  v11[1] = v8;
  unint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)_capability
{
  id v3 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [(HMDSiriEndpointProfile *)self needsOnboarding];
    BOOL v7 = [v6 integerValue] == 0;

    if ([v5 supportsSiriEndpointOnBoarding]) {
      unint64_t v8 = v7 | 2;
    }
    else {
      unint64_t v8 = v7;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)_updateSessionState:(id)a3 settings:(id)a4 message:(id)a5
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v109 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:12];
  v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
  v110 = v11;
  if (v8)
  {
    uint64_t v12 = [v8 sessionState];
    unint64_t v13 = [v12 value];
    if (v13 >= 4) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = v13;
    }

    if (v14 != [(HMDSiriEndpointProfile *)self sessionState])
    {
      id v108 = v8;
      objc_super v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        long long v19 = HMSiriEndpointProfileSessionStateTypeToString();
        *(_DWORD *)buf = 138543618;
        v112 = v18;
        __int16 v113 = 2112;
        v114 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating session state: %@", buf, 0x16u);
      }
      long long v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile sessionState](v16, "sessionState"));
      v11 = v110;
      [v110 setValue:v20 forKey:@"HMDSiriEndpointProfilePreviousSessionStateKey"];

      id v8 = v108;
    }
    [(HMDSiriEndpointProfile *)self setSessionState:v14];
    long long v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile sessionState](self, "sessionState"));
    [v10 setValue:v21 forKey:*MEMORY[0x263F0D998]];

    long long v22 = [v8 hubUUID];
    v23 = [(HMDSiriEndpointProfile *)self sessionHubIdentifier];
    char v24 = HMFEqualObjects();

    if ((v24 & 1) == 0)
    {
      v25 = [(HMDSiriEndpointProfile *)self sessionHubIdentifier];
      v26 = [v25 UUIDString];
      [v11 setValue:v26 forKey:@"HMDSiriEndpointProfilePreviousSessionHubIdentiferKey"];
    }
    [(HMDSiriEndpointProfile *)self setSessionHubIdentifier:v22];
    id v27 = [(HMDSiriEndpointProfile *)self sessionHubIdentifier];
    id v28 = [v27 UUIDString];
    [v10 setValue:v28 forKey:*MEMORY[0x263F0D990]];
  }
  int v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  if (v9)
  {
    v30 = [v9 siriEnable];

    if (v30)
    {
      __int16 v31 = [v9 siriEnable];
      uint64_t v32 = [v31 integerValue];
      uint64_t v33 = v32 == 1 ? 1 : -1;
      uint64_t v34 = v32 ? v33 : 0;

      if ([(HMDSiriEndpointProfile *)self siriEnable] != v34)
      {
        [(HMDSiriEndpointProfile *)self setSiriEnable:v34];
        __int16 v35 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile siriEnable](self, "siriEnable"));
        [v29 setValue:v35 forKey:@"settings-enable"];
      }
    }
    uint64_t v36 = [v9 siriListening];

    if (v36)
    {
      uint64_t v37 = [v9 siriListening];
      uint64_t v38 = [v37 integerValue];
      uint64_t v39 = v38 == 1 ? 1 : -1;
      uint64_t v40 = v38 ? v39 : 0;

      if ([(HMDSiriEndpointProfile *)self siriListening] != v40)
      {
        [(HMDSiriEndpointProfile *)self setSiriListening:v40];
        long long v41 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile siriListening](self, "siriListening"));
        [v29 setValue:v41 forKey:@"settings-listening"];
      }
    }
    v42 = [v9 siriTouchToUse];

    if (v42)
    {
      v43 = [v9 siriTouchToUse];
      uint64_t v44 = [v43 integerValue];
      uint64_t v45 = v44 == 1 ? 1 : -1;
      uint64_t v46 = v44 ? v45 : 0;

      if ([(HMDSiriEndpointProfile *)self siriTouchToUse] != v46)
      {
        [(HMDSiriEndpointProfile *)self setSiriTouchToUse:v46];
        v47 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile siriTouchToUse](self, "siriTouchToUse"));
        [v29 setValue:v47 forKey:@"settings-touch"];
      }
    }
    __int16 v48 = [v9 siriLightOnUse];

    if (v48)
    {
      v49 = [v9 siriLightOnUse];
      uint64_t v50 = [v49 integerValue];
      uint64_t v51 = v50 == 1 ? 1 : -1;
      uint64_t v52 = v50 ? v51 : 0;

      if ([(HMDSiriEndpointProfile *)self siriLightOnUse] != v52)
      {
        [(HMDSiriEndpointProfile *)self setSiriLightOnUse:v52];
        v53 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile siriLightOnUse](self, "siriLightOnUse"));
        [v29 setValue:v53 forKey:@"settings-light"];
      }
    }
    v54 = [v9 siriEndpointVersion];

    if (v54)
    {
      v55 = [v9 siriEndpointVersion];
      [(HMDSiriEndpointProfile *)self setSiriEndpointVersion:v55];

      v56 = [(HMDSiriEndpointProfile *)self siriEndpointVersion];
      [v10 setValue:v56 forKey:*MEMORY[0x263F0D9B8]];
    }
    v57 = [v9 siriEngineVersion];

    if (v57)
    {
      v58 = [v9 siriEngineVersion];
      v59 = [(HMDSiriEndpointProfile *)self siriEngineVersion];
      char v60 = HMFEqualObjects();

      if ((v60 & 1) == 0)
      {
        v61 = [(HMDSiriEndpointProfile *)self siriEngineVersion];
        [v11 setValue:v61 forKey:@"HMDSiriEndpointProfilePreviousSiriEngineVersionKey"];
      }
      v62 = [v9 siriEngineVersion];
      [(HMDSiriEndpointProfile *)self setSiriEngineVersion:v62];

      v63 = [(HMDSiriEndpointProfile *)self siriEngineVersion];
      [v10 setValue:v63 forKey:*MEMORY[0x263F0D9A8]];
    }
    v64 = [v9 activeIdentifier];

    if (v64)
    {
      uint64_t v65 = [(HMDSiriEndpointProfile *)self activeIdentifier];
      if (v65)
      {
        v66 = (void *)v65;
        v67 = [v9 activeIdentifier];
        v68 = [(HMDSiriEndpointProfile *)self activeIdentifier];
        char v69 = HMFEqualObjects();

        if ((v69 & 1) == 0)
        {
          v70 = [(HMDSiriEndpointProfile *)self activeIdentifier];
          [v110 setValue:v70 forKey:@"HMDSiriEndpointProfilePreviousActiveIdentifierKey"];
        }
      }
      v71 = [v9 activeIdentifier];
      [(HMDSiriEndpointProfile *)self setActiveIdentifier:v71];

      v72 = [(HMDSiriEndpointProfile *)self activeIdentifier];
      [v10 setValue:v72 forKey:*MEMORY[0x263F0D920]];

      v11 = v110;
    }
    v73 = [v9 manuallyDisabled];

    if (v73)
    {
      v74 = [v9 manuallyDisabled];
      int v75 = [v74 BOOLValue];
      int v76 = [(HMDSiriEndpointProfile *)self manuallyDisabled];

      if (v75 != v76)
      {
        v77 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"));
        [v11 setValue:v77 forKey:@"HMDSiriEndpointProfilePreviousManuallyDisabledKey"];
      }
      v78 = [v9 manuallyDisabled];
      -[HMDSiriEndpointProfile setManuallyDisabled:](self, "setManuallyDisabled:", [v78 BOOLValue]);

      v79 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"));
      [v10 setValue:v79 forKey:*MEMORY[0x263F0D968]];
    }
    v80 = [v9 multifunctionButton];

    if (v80)
    {
      v81 = [v9 multifunctionButton];
      uint64_t v82 = [v81 integerValue];
      if (v82 == 1) {
        uint64_t v83 = 1;
      }
      else {
        uint64_t v83 = -1;
      }
      if (v82) {
        uint64_t v84 = v83;
      }
      else {
        uint64_t v84 = 0;
      }

      if (v84 != [(HMDSiriEndpointProfile *)self multifunctionButton])
      {
        v85 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
        [v11 setValue:v85 forKey:@"HMDSiriEndpointProfilePreviousMultifunctionButtonKey"];
      }
      [(HMDSiriEndpointProfile *)self setMultifunctionButton:v84];
      v86 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
      [v10 setValue:v86 forKey:*MEMORY[0x263F0D970]];
    }
    if ([v9 assistantsUpdated])
    {
      v87 = [(HMDSiriEndpointProfile *)self assistants];
      v88 = encodeRootObjectForIncomingXPCMessage(v87, 0);
      [v10 setValue:v88 forKey:*MEMORY[0x263F0D940]];
    }
  }
  uint64_t v89 = [v10 count];
  v90 = (void *)MEMORY[0x230FBD990]();
  v91 = self;
  v92 = HMFGetOSLogHandle();
  BOOL v93 = os_log_type_enabled(v92, OS_LOG_TYPE_INFO);
  if (v89)
  {
    id v94 = v8;
    if (v93)
    {
      v95 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v112 = v95;
      __int16 v113 = 2112;
      v114 = v10;
      _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_INFO, "%{public}@Notifying XPC clients of updated profile state: %@", buf, 0x16u);
    }
    id v96 = objc_alloc(MEMORY[0x263F42570]);
    v97 = [(HMDAccessoryProfile *)v91 uniqueIdentifier];
    v98 = (void *)[v96 initWithTarget:v97];

    v99 = (void *)MEMORY[0x263F42590];
    uint64_t v100 = *MEMORY[0x263F0D9B0];
    v101 = (void *)[v10 copy];
    v102 = [v99 messageWithName:v100 destination:v98 payload:v101];

    v103 = [v109 identifier];
    if (v103) {
      [v102 setIdentifier:v103];
    }
    [v102 setRequiresSPIEntitlement];
    v104 = [(HMDAccessoryProfile *)v91 msgDispatcher];
    v105 = (void *)[v102 copy];
    [v104 sendMessage:v105 completionHandler:0];

    id v8 = v94;
  }
  else
  {
    if (v93)
    {
      v106 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v112 = v106;
      _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_INFO, "%{public}@No changes, not notifying XPC clients", buf, 0xCu);
    }
  }
  if ([v110 count])
  {
    v107 = [(HMDSiriEndpointProfile *)v91 notificationCenter];
    [v107 postNotificationName:@"HMDSiriEndpointProfileUpdatedNotification" object:v91 userInfo:v110];
  }
  [(HMDSiriEndpointProfile *)v91 _notifyProfileSettingsUpdated:v29];
}

- (void)_notifyProfileSettingsUpdated:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [(HMDSiriEndpointProfile *)self notificationCenter];
    [v4 postNotificationName:@"HMDSiriEndpointProfileSettingsUpdatedNotification" object:self userInfo:v5];
  }
}

- (void)_handleRefreshProfileState:(id)a3 completionHandler:(id)a4
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v90 = a3;
  v85 = (void (**)(void))a4;
  val = self;
  id v6 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;

  uint64_t v83 = v8;
  if (v8)
  {
    id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    id v10 = [v90 arrayForKey:*MEMORY[0x263F0D978]];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v18 = *MEMORY[0x263F0D9A0];
      v114[0] = *MEMORY[0x263F0D988];
      v114[1] = v18;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:2];
    }
    long long v19 = v12;

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id obj = v19;
    uint64_t v89 = [obj countByEnumeratingWithState:&v107 objects:v113 count:16];
    if (v89)
    {
      uint64_t v86 = *MEMORY[0x263F0D988];
      uint64_t v87 = *(void *)v108;
      uint64_t v82 = *MEMORY[0x263F0D9A0];
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v108 != v87)
          {
            uint64_t v21 = v20;
            objc_enumerationMutation(obj);
            uint64_t v20 = v21;
          }
          uint64_t v91 = v20;
          long long v22 = *(void **)(*((void *)&v107 + 1) + 8 * v20);
          if ([v22 isEqual:v86])
          {
            v23 = [(HMDSiriEndpointProfile *)val _siriEndpointSessionStatusReadRequest];
            if (v23)
            {
              [v9 addObject:v23];
            }
            else
            {
              v25 = (void *)MEMORY[0x230FBD990]();
              v26 = val;
              id v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                id v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v28;
                _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint session status is not available", buf, 0xCu);
              }
            }
            int v29 = [(HMDSiriEndpointProfile *)val _siriEndpointVersionReadRequest];

            if (v29)
            {
              [v9 addObject:v29];
            }
            else
            {
              v30 = (void *)MEMORY[0x230FBD990]();
              __int16 v31 = val;
              uint64_t v32 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                uint64_t v33 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v33;
                _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint version is not available", buf, 0xCu);
              }
            }
            uint64_t v34 = [(HMDSiriEndpointProfile *)val _siriEndpointActiveIdentifierReadRequest];

            if (v34)
            {
              [v9 addObject:v34];
            }
            else
            {
              __int16 v35 = (void *)MEMORY[0x230FBD990]();
              uint64_t v36 = val;
              uint64_t v37 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                uint64_t v38 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v38;
                _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint active identifier is not available", buf, 0xCu);
              }
            }
            uint64_t v39 = [(HMDSiriEndpointProfile *)val _siriEndpointManuallyDisabledReadRequest];

            if (v39)
            {
              [v9 addObject:v39];
            }
            else
            {
              uint64_t v40 = (void *)MEMORY[0x230FBD990]();
              long long v41 = val;
              v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                v43 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v43;
                _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint manually disable is not available", buf, 0xCu);
              }
            }
            uint64_t v88 = [(HMDSiriEndpointProfile *)val _siriSettingMultifunctionButtonReadRequest];

            if (v88)
            {
              objc_msgSend(v9, "addObject:");
            }
            else
            {
              uint64_t v44 = (void *)MEMORY[0x230FBD990]();
              uint64_t v45 = val;
              uint64_t v46 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                v47 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v47;
                _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint multifunction button is not available", buf, 0xCu);
              }
            }
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            id v93 = [(HMDSiriEndpointProfile *)val assistants];
            uint64_t v48 = [v93 countByEnumeratingWithState:&v103 objects:v112 count:16];
            if (v48)
            {
              uint64_t v49 = *(void *)v104;
              do
              {
                for (uint64_t i = 0; i != v48; ++i)
                {
                  if (*(void *)v104 != v49) {
                    objc_enumerationMutation(v93);
                  }
                  uint64_t v51 = *(void **)(*((void *)&v103 + 1) + 8 * i);
                  long long v99 = 0u;
                  long long v100 = 0u;
                  long long v101 = 0u;
                  long long v102 = 0u;
                  uint64_t v52 = [v51 allCharacteristics];
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v99 objects:v111 count:16];
                  if (v53)
                  {
                    uint64_t v54 = *(void *)v100;
                    do
                    {
                      for (uint64_t j = 0; j != v53; ++j)
                      {
                        if (*(void *)v100 != v54) {
                          objc_enumerationMutation(v52);
                        }
                        v56 = +[HMDCharacteristicRequest requestWithCharacteristic:*(void *)(*((void *)&v99 + 1) + 8 * j)];
                        if (v56) {
                          [v9 addObject:v56];
                        }
                      }
                      uint64_t v53 = [v52 countByEnumeratingWithState:&v99 objects:v111 count:16];
                    }
                    while (v53);
                  }
                }
                uint64_t v48 = [v93 countByEnumeratingWithState:&v103 objects:v112 count:16];
              }
              while (v48);
            }

            v57 = (void *)v88;
          }
          else
          {
            if (![v22 isEqual:v82]) {
              goto LABEL_87;
            }
            char v24 = [(HMDSiriEndpointProfile *)val _siriSettingSiriEnableReadRequest];
            if (v24)
            {
              [v9 addObject:v24];
            }
            else
            {
              v58 = (void *)MEMORY[0x230FBD990]();
              v59 = val;
              char v60 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                v61 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v61;
                _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri enable is not available", buf, 0xCu);
              }
            }
            v62 = [(HMDSiriEndpointProfile *)val _siriSettingSiriListeningReadRequest];

            if (v62)
            {
              [v9 addObject:v62];
            }
            else
            {
              v63 = (void *)MEMORY[0x230FBD990]();
              v64 = val;
              uint64_t v65 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                v66 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v66;
                _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri listening is not available", buf, 0xCu);
              }
            }
            v67 = [(HMDSiriEndpointProfile *)val _siriSettingSiriTouchReadRequest];

            if (v67)
            {
              [v9 addObject:v67];
            }
            else
            {
              v68 = (void *)MEMORY[0x230FBD990]();
              char v69 = val;
              v70 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                v71 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v71;
                _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri touch is not available", buf, 0xCu);
              }
            }
            v72 = [(HMDSiriEndpointProfile *)val _siriSettingSiriLightOnUseReadRequest];

            if (v72)
            {
              [v9 addObject:v72];
            }
            else
            {
              v73 = (void *)MEMORY[0x230FBD990]();
              v74 = val;
              int v75 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                int v76 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v76;
                _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri light on use is not available", buf, 0xCu);
              }
            }
            v57 = [(HMDSiriEndpointProfile *)val _siriSettingSiriEngineVersionReadRequest];

            if (v57)
            {
              [v9 addObject:v57];
            }
            else
            {
              v77 = (void *)MEMORY[0x230FBD990]();
              v78 = val;
              v79 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                v80 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v116 = v80;
                _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri engine is not available", buf, 0xCu);
              }
              v57 = 0;
            }
          }

LABEL_87:
          uint64_t v20 = v91 + 1;
        }
        while (v91 + 1 != v89);
        uint64_t v89 = [obj countByEnumeratingWithState:&v107 objects:v113 count:16];
      }
      while (v89);
    }

    objc_initWeak((id *)buf, val);
    v81 = [(HMDAccessoryProfile *)val workQueue];
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __71__HMDSiriEndpointProfile__handleRefreshProfileState_completionHandler___block_invoke;
    v94[3] = &unk_264A213E0;
    objc_copyWeak(&v98, (id *)buf);
    id v17 = v9;
    id v95 = v17;
    id v96 = v90;
    v97 = v85;
    [v83 readCharacteristicValues:v17 source:7 queue:v81 completionHandler:v94];

    objc_destroyWeak(&v98);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = val;
    objc_super v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v116 = v16;
      __int16 v117 = 2112;
      v118 = v14;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile] accessory not part of profile (%@)", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v90 respondWithError:v17];
    if (v85) {
      v85[2]();
    }
  }
}

void __71__HMDSiriEndpointProfile__handleRefreshProfileState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v88 = WeakRetained;
  if ([v3 count])
  {
    uint64_t v83 = a1;
    uint64_t v87 = objc_alloc_init(HMDSiriEndpointHAPSettings);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v84 = v3;
    id v5 = v3;
    uint64_t v90 = [v5 countByEnumeratingWithState:&v96 objects:v107 count:16];
    id v6 = 0;
    BOOL v7 = 0;
    if (!v90) {
      goto LABEL_74;
    }
    uint64_t v89 = *(void *)v97;
    uint64_t v86 = *MEMORY[0x263F0C588];
    uint64_t v85 = *MEMORY[0x263F0BF08];
    while (1)
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v97 != v89) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        id v10 = [v9 error];

        if (!v10)
        {
          id v17 = [v9 request];
          uint64_t v18 = [v17 characteristic];

          long long v19 = [v18 type];
          int v20 = [v19 isEqual:@"00000254-0000-1000-8000-0026BB765291"];

          if (v20)
          {
            uint64_t v21 = v7;
            id v22 = v5;
            v23 = [v9 value];
            id v95 = 0;
            uint64_t v24 = +[HMDSiriEndpointSessionStateTLV parsedFromData:v23 error:&v95];
            id v25 = v95;

            v26 = (void *)MEMORY[0x230FBD990]();
            id v27 = WeakRetained;
            id v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              int v29 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              long long v102 = v29;
              __int16 v103 = 2112;
              uint64_t v104 = v24;
              __int16 v105 = 2112;
              id v106 = v25;
              _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Response Parsed HMDSiriEndpointSessionStateTLV: %@ with error: %@", buf, 0x20u);

              id WeakRetained = v88;
            }

            id v5 = v22;
          }
          else
          {
            v30 = [v18 type];
            int v31 = [v30 isEqualToString:v86];

            if (v31)
            {
              uint64_t v32 = [v9 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v33 = v32;
              }
              else {
                uint64_t v33 = 0;
              }
              id v25 = v33;

              [(HMDSiriEndpointHAPSettings *)v87 setSiriEndpointVersion:v25];
            }
            else
            {
              uint64_t v34 = [v18 type];
              int v35 = [v34 isEqual:@"00000255-0000-1000-8000-0026BB765291"];

              if (v35)
              {
                uint64_t v36 = [v9 value];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v37 = v36;
                }
                else {
                  uint64_t v37 = 0;
                }
                id v25 = v37;

                [(HMDSiriEndpointHAPSettings *)v87 setSiriEnable:v25];
              }
              else
              {
                uint64_t v38 = [v18 type];
                int v39 = [v38 isEqual:@"00000256-0000-1000-8000-0026BB765291"];

                if (v39)
                {
                  uint64_t v40 = [v9 value];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    long long v41 = v40;
                  }
                  else {
                    long long v41 = 0;
                  }
                  id v25 = v41;

                  [(HMDSiriEndpointHAPSettings *)v87 setSiriListening:v25];
                }
                else
                {
                  v42 = [v18 type];
                  int v43 = [v42 isEqual:@"00000257-0000-1000-8000-0026BB765291"];

                  if (v43)
                  {
                    uint64_t v44 = [v9 value];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v45 = v44;
                    }
                    else {
                      uint64_t v45 = 0;
                    }
                    id v25 = v45;

                    [(HMDSiriEndpointHAPSettings *)v87 setSiriTouchToUse:v25];
                  }
                  else
                  {
                    uint64_t v46 = [v18 type];
                    int v47 = [v46 isEqual:@"00000258-0000-1000-8000-0026BB765291"];

                    if (v47)
                    {
                      uint64_t v48 = [v9 value];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        uint64_t v49 = v48;
                      }
                      else {
                        uint64_t v49 = 0;
                      }
                      id v25 = v49;

                      [(HMDSiriEndpointHAPSettings *)v87 setSiriLightOnUse:v25];
                    }
                    else
                    {
                      uint64_t v50 = [v18 type];
                      int v51 = [v50 isEqualToString:@"0000025A-0000-1000-8000-0026BB765291"];

                      if (v51)
                      {
                        uint64_t v52 = [v9 value];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          uint64_t v53 = v52;
                        }
                        else {
                          uint64_t v53 = 0;
                        }
                        id v25 = v53;

                        [(HMDSiriEndpointHAPSettings *)v87 setSiriEngineVersion:v25];
                      }
                      else
                      {
                        uint64_t v54 = [v18 type];
                        int v55 = [v54 isEqualToString:v85];

                        if (v55)
                        {
                          v56 = [v9 value];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            v57 = v56;
                          }
                          else {
                            v57 = 0;
                          }
                          id v25 = v57;

                          [(HMDSiriEndpointHAPSettings *)v87 setActiveIdentifier:v25];
                        }
                        else
                        {
                          v58 = [v18 type];
                          int v59 = [v58 isEqualToString:@"00000227-0000-1000-8000-0026BB765291"];

                          if (v59)
                          {
                            char v60 = [v9 value];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              v61 = v60;
                            }
                            else {
                              v61 = 0;
                            }
                            id v25 = v61;

                            [(HMDSiriEndpointHAPSettings *)v87 setManuallyDisabled:v25];
                          }
                          else
                          {
                            v62 = [v18 type];
                            int v63 = [v62 isEqualToString:@"0000026B-0000-1000-8000-0026BB765291"];

                            if (v63)
                            {
                              v64 = [v9 value];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                uint64_t v65 = v64;
                              }
                              else {
                                uint64_t v65 = 0;
                              }
                              id v25 = v65;

                              [(HMDSiriEndpointHAPSettings *)v87 setMultifunctionButton:v25];
                            }
                            else
                            {
                              long long v93 = 0u;
                              long long v94 = 0u;
                              long long v91 = 0u;
                              long long v92 = 0u;
                              id v25 = [WeakRetained assistants];
                              uint64_t v66 = [v25 countByEnumeratingWithState:&v91 objects:v100 count:16];
                              if (v66)
                              {
                                uint64_t v67 = v66;
                                uint64_t v81 = (uint64_t)v7;
                                id v82 = v5;
                                uint64_t v68 = *(void *)v92;
                                do
                                {
                                  for (uint64_t j = 0; j != v67; ++j)
                                  {
                                    if (*(void *)v92 != v68) {
                                      objc_enumerationMutation(v25);
                                    }
                                    v70 = *(void **)(*((void *)&v91 + 1) + 8 * j);
                                    v71 = [v9 value];
                                    LODWORD(v70) = [v70 updateCharacteristic:v18 value:v71];

                                    if (v70) {
                                      [(HMDSiriEndpointHAPSettings *)v87 setAssistantsUpdated:1];
                                    }
                                    id WeakRetained = v88;
                                  }
                                  uint64_t v67 = [v25 countByEnumeratingWithState:&v91 objects:v100 count:16];
                                }
                                while (v67);
                                uint64_t v24 = v81;
                                id v5 = v82;
                                goto LABEL_71;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            uint64_t v24 = (uint64_t)v7;
          }
LABEL_71:

          BOOL v7 = (void *)v24;
          continue;
        }
        uint64_t v11 = [v9 error];

        id v12 = (void *)MEMORY[0x230FBD990]();
        id v13 = WeakRetained;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_super v15 = HMFGetLogIdentifier();
          uint64_t v16 = [v9 error];
          *(_DWORD *)buf = 138543618;
          long long v102 = v15;
          __int16 v103 = 2112;
          uint64_t v104 = (uint64_t)v16;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Read failed with error %@", buf, 0x16u);
        }
        id v6 = (void *)v11;
      }
      uint64_t v90 = [v5 countByEnumeratingWithState:&v96 objects:v107 count:16];
      if (!v90)
      {
LABEL_74:

        [WeakRetained _updateSessionState:v7 settings:v87 message:*(void *)(v83 + 40)];
        v72 = [*(id *)(v83 + 40) responseHandler];

        if (v72)
        {
          v73 = [*(id *)(v83 + 40) responseHandler];
          ((void (**)(void, void *, void))v73)[2](v73, v6, 0);
        }
        uint64_t v74 = *(void *)(v83 + 48);
        id v3 = v84;
        if (v74) {
          (*(void (**)(uint64_t, void *))(v74 + 16))(v74, v6);
        }

        goto LABEL_83;
      }
    }
  }
  int v75 = (void *)MEMORY[0x230FBD990]();
  id v76 = WeakRetained;
  v77 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    v78 = HMFGetLogIdentifier();
    uint64_t v79 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    long long v102 = v78;
    __int16 v103 = 2112;
    uint64_t v104 = v79;
    _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    id WeakRetained = v88;
  }

  BOOL v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
  [*(id *)(a1 + 40) respondWithError:v7];
  uint64_t v80 = *(void *)(a1 + 48);
  if (v80) {
    (*(void (**)(uint64_t, void *))(v80 + 16))(v80, v7);
  }
LABEL_83:
}

- (void)_handleRefreshProfileState:(id)a3
{
}

- (void)notifyClientsDidUpdateStagedNeedsOnboarding
{
  id v3 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDSiriEndpointProfile_notifyClientsDidUpdateStagedNeedsOnboarding__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __69__HMDSiriEndpointProfile_notifyClientsDidUpdateStagedNeedsOnboarding__block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v18 = *MEMORY[0x263F0D948];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_capability"));
  v19[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v14 = 138543618;
    objc_super v15 = v7;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying XPC clients of updated needsOnboarding: %@", (uint8_t *)&v14, 0x16u);
  }
  id v8 = objc_alloc(MEMORY[0x263F42570]);
  id v9 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v10 = (void *)[v8 initWithTarget:v9];

  uint64_t v11 = [MEMORY[0x263F42590] messageWithName:*MEMORY[0x263F0D9B0] destination:v10 payload:v3];
  [v11 setRequiresSPIEntitlement];
  id v12 = [*(id *)(a1 + 32) msgDispatcher];
  id v13 = (void *)[v11 copy];
  [v12 sendMessage:v13 completionHandler:0];
}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSiriEndpointProfile *)self stagedNeedsOnboarding];

  if (v8 == v6)
  {
    id v13 = [(HMDSiriEndpointProfile *)self stagedNeedsOnboarding];
    [v13 commitValue:&unk_26E471D10];

    [(HMDSiriEndpointProfile *)self notifyClientsDidUpdateStagedNeedsOnboarding];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      objc_super v15 = v12;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unknown stage value: %@ did expire value: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)handleEnableNotifications:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 numberForKey:*MEMORY[0x263F0D950]];
  id v6 = [v4 numberForKey:*MEMORY[0x263F0D960]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (!v5)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] parameters not specific", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v12];
  }
  -[HMDSiriEndpointProfile setNotifications:options:](self, "setNotifications:options:", [v5 BOOLValue], v7);
  [v4 respondWithSuccess];
}

- (void)handleUpdateNeedsOnboarding:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"accessoryUUID");

  uint64_t v7 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v6)
  {
    if (v9)
    {
      id v10 = [v9 uuid];
      int v11 = [v10 isEqual:v6];

      if (v11)
      {
        id v12 = (void *)MEMORY[0x230FBD990]();
        int v13 = self;
        int v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          __int16 v16 = [v4 name];
          id v17 = [v4 userInfo];
          int v24 = 138543874;
          id v25 = v15;
          __int16 v26 = 2112;
          id v27 = v16;
          __int16 v28 = 2112;
          int v29 = v17;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling %@/%@", (uint8_t *)&v24, 0x20u);
        }
        __int16 v18 = [v4 userInfo];
        id v19 = [v18 objectForKeyedSubscript:@"HMDSiriEndpointProfileNeedsOnboardingResultCodingKey"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        id v21 = v20;

        uint64_t v22 = [v21 integerValue];
        if (v22 == 3) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = 2 * (v22 == 2);
        }
        [(HMDSiriEndpointProfile *)v13 stageNeedsOnboarding:v23];
        [(HMDSiriEndpointProfile *)v13 notifyClientsDidUpdateStagedNeedsOnboarding];
      }
    }
  }
}

- (void)updateNeedsOnboarding:(int64_t)a3 withTimeout:(double)a4
{
  [(HMDSiriEndpointProfile *)self stageNeedsOnboarding:a3 withTimeout:a4];
  [(HMDSiriEndpointProfile *)self notifyClientsDidUpdateStagedNeedsOnboarding];
}

- (void)handleDeviceCapabilitiesUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMDSiriEndpointProfile_handleDeviceCapabilitiesUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__HMDSiriEndpointProfile_handleDeviceCapabilitiesUpdated___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = (void *)MEMORY[0x263EFFA08];
  v33[0] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  id v8 = [v6 setWithArray:v7];
  id v9 = objc_msgSend(v5, "hmf_arrayForKey:ofClasses:", @"HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey", v8);

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 32);
    int v27 = 138543874;
    __int16 v28 = v13;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2112;
    uint64_t v32 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling updated resident capabilities: %@ notification: %@", (uint8_t *)&v27, 0x20u);
  }
  uint64_t v15 = [*(id *)(a1 + 40) accessory];
  __int16 v16 = [v15 home];
  id v17 = [v16 residentDeviceManager];
  __int16 v18 = [v17 residentDevices];
  id v19 = objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_169_139529);

  uint64_t v20 = [v19 device];
  if (v19 && [v19 isConfirmed])
  {
    id v21 = [v20 capabilities];
    if (v21 == v4 && ([v9 containsObject:@"supportsSiriEndpointSetup"] & 1) != 0)
    {
      int v22 = [v4 supportsSiriEndpointSetup];

      if (v22)
      {
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 40);
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          __int16 v26 = HMFGetLogIdentifier();
          int v27 = 138543618;
          __int16 v28 = v26;
          __int16 v29 = 2112;
          id v30 = v20;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Current device was updated to support Siri Endpoint Settings (%@)", (uint8_t *)&v27, 0x16u);
        }
        [*(id *)(a1 + 40) _setNotifications:1 options:2];
        [*(id *)(a1 + 40) _handleRefreshProfileState:0 completionHandler:0];
      }
    }
    else
    {
    }
  }
}

uint64_t __58__HMDSiriEndpointProfile_handleDeviceCapabilitiesUpdated___block_invoke_166(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HMDSiriEndpointProfile_handlePrimaryResidentChanged___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __55__HMDSiriEndpointProfile_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 home];
  id v4 = [v3 residentDeviceManager];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v21 = v4;
  id v5 = [v4 residentDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v22 = v1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 isCurrentDevice])
        {
          id v11 = [v10 capabilities];
          int v12 = [v11 supportsSiriEndpointSetup];

          if (v12)
          {
            int v13 = [v10 isConfirmed];
            uint64_t v14 = (void *)MEMORY[0x230FBD990]();
            id v15 = *(id *)(v1 + 32);
            __int16 v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v18 = id v17 = v5;
              id v19 = HMFBooleanToString();
              *(_DWORD *)buf = 138543618;
              __int16 v28 = v18;
              __int16 v29 = 2112;
              id v30 = v19;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Current device is primary:%@ and does not support home hub", buf, 0x16u);

              id v5 = v17;
              uint64_t v1 = v22;
            }

            uint64_t v20 = *(void **)(v1 + 32);
            if (v13)
            {
              [v20 _setNotifications:1 options:2];
              [*(id *)(v1 + 32) _handleRefreshProfileState:0 completionHandler:0];
            }
            else
            {
              [v20 _setNotifications:0 options:2];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMDSiriEndpointProfile_handleAccessoryConfigured___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__HMDSiriEndpointProfile_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v11 = 138543618;
    int v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) accessory];
  id v8 = [v7 home];
  int v9 = [v8 currentDeviceSupportsSidekickSettings];

  if (v9) {
    [*(id *)(a1 + 32) _setNotifications:1 options:2];
  }
  if ([*(id *)(a1 + 32) _notificationEnabledForType:1]) {
    [*(id *)(a1 + 32) _setNotifications:1 options:1];
  }
  [*(id *)(a1 + 32) setSessionState:-1];
  return [*(id *)(a1 + 32) _handleRefreshProfileState:0 completionHandler:0];
}

- (void)handleHomeCharacteristicValuesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  if ([v6 count])
  {
    uint64_t v7 = [(HMDAccessoryProfile *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke;
    block[3] = &unk_264A2F820;
    id v18 = v6;
    id v19 = self;
    dispatch_async(v7, block);

    id v8 = v18;
  }
  else
  {
    int v9 = [v4 userInfo];
    id v8 = objc_msgSend(v9, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");

    id v10 = [(HMDAccessoryProfile *)self accessory];
    int v11 = [v10 uuid];
    int v12 = [v11 UUIDString];
    __int16 v13 = objc_msgSend(v8, "hmf_dictionaryForKey:", v12);

    if (v13)
    {
      uint64_t v14 = [(HMDAccessoryProfile *)self workQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke_2;
      v15[3] = &unk_264A2F820;
      v15[4] = self;
      id v16 = v13;
      dispatch_async(v14, v15);
    }
  }
}

void __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  __int16 v29 = [MEMORY[0x263EFF9A0] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v40;
    uint64_t v30 = *(void *)v40;
    uint64_t v31 = a1;
    do
    {
      uint64_t v5 = 0;
      uint64_t v32 = v3;
      do
      {
        if (*(void *)v40 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "accessory", v29);
        id v8 = [v7 uuid];
        int v9 = [v6 accessory];
        id v10 = [v9 uuid];
        int v11 = HMFEqualObjects();

        if (v11)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          int v12 = [*(id *)(a1 + 40) services];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v36;
            uint64_t v34 = v5;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v36 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                id v18 = [v17 instanceID];
                id v19 = [v6 service];
                uint64_t v20 = [v19 instanceID];
                int v21 = HMFEqualObjects();

                if (v21)
                {
                  uint64_t v22 = [v17 instanceID];
                  long long v23 = [v22 stringValue];

                  long long v24 = [v29 objectForKeyedSubscript:v23];
                  if (!v24)
                  {
                    long long v24 = [MEMORY[0x263EFF9A0] dictionary];
                    [v29 setObject:v24 forKeyedSubscript:v23];
                  }
                  long long v25 = [v6 instanceID];
                  long long v26 = [v25 stringValue];

                  int v27 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
                  __int16 v28 = [v6 value];
                  [v27 setObject:v28 forKeyedSubscript:@"kCharacteristicValue"];

                  [v24 setObject:v27 forKeyedSubscript:v26];
                  uint64_t v5 = v34;
                  goto LABEL_19;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
              uint64_t v5 = v34;
              if (v14) {
                continue;
              }
              break;
            }
          }
LABEL_19:

          uint64_t v4 = v30;
          a1 = v31;
          uint64_t v3 = v32;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v3);
  }

  [*(id *)(a1 + 40) _handleCharacteristicChanges:v29];
}

uint64_t __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCharacteristicChanges:*(void *)(a1 + 40)];
}

- (void)_handleCharacteristicChanges:(id)a3
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v103 = self;
  uint64_t v5 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v104 = objc_alloc_init(HMDSiriEndpointHAPSettings);
  id v8 = objc_alloc_init(MEMORY[0x263F08A30]);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = v4;
  uint64_t v90 = [obj countByEnumeratingWithState:&v126 objects:v139 count:16];
  if (v90)
  {
    context = 0;
    uint64_t v89 = *(void *)v127;
    uint64_t v101 = *MEMORY[0x263F0C588];
    uint64_t v92 = *MEMORY[0x263F0BF08];
    id v102 = v7;
    id v107 = v8;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v127 != v89)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v91 = v9;
        uint64_t v95 = *(void *)(*((void *)&v126 + 1) + 8 * v9);
        v112 = [v8 numberFromString:v89];
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v97 = [(HMDSiriEndpointProfile *)v103 services];
        uint64_t v11 = [v97 countByEnumeratingWithState:&v122 objects:v138 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v123;
          uint64_t v94 = *(void *)v123;
          do
          {
            uint64_t v14 = 0;
            uint64_t v96 = v12;
            do
            {
              if (*(void *)v123 != v13) {
                objc_enumerationMutation(v97);
              }
              uint64_t v15 = [*(id *)(*((void *)&v122 + 1) + 8 * v14) instanceID];
              int v16 = HMFEqualObjects();

              if (v16)
              {
                uint64_t v98 = v14;
                id v17 = objc_msgSend(obj, "hmf_dictionaryForKey:", v95);
                long long v118 = 0u;
                long long v119 = 0u;
                long long v120 = 0u;
                long long v121 = 0u;
                id v18 = v17;
                uint64_t v19 = [v18 countByEnumeratingWithState:&v118 objects:v137 count:16];
                if (!v19) {
                  goto LABEL_95;
                }
                uint64_t v20 = v19;
                uint64_t v111 = *(void *)v119;
                while (1)
                {
                  uint64_t v21 = 0;
                  uint64_t v108 = v20;
                  do
                  {
                    if (*(void *)v119 != v111) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v118 + 1) + 8 * v21);
                    long long v23 = [v8 numberFromString:v22];
                    long long v24 = [v7 findCharacteristic:v23 forService:v112];
                    if (v24)
                    {
                      long long v25 = objc_msgSend(v18, "hmf_dictionaryForKey:", v22);
                      long long v26 = objc_msgSend(v25, "hmf_dataForKey:", @"kCharacteristicErrorDataKey");
                      if (v26)
                      {
LABEL_43:

                        goto LABEL_44;
                      }
                      id v27 = v18;
                      id v28 = v7;
                      __int16 v29 = [v25 objectForKeyedSubscript:@"kCharacteristicValue"];
                      uint64_t v30 = [MEMORY[0x263EFF9D0] null];
                      char v31 = [v29 isEqual:v30];

                      if (v31)
                      {
                        long long v109 = v29;
                        id v7 = v28;
                        id v18 = v27;
                        id v8 = v107;
                        uint64_t v20 = v108;

                        goto LABEL_43;
                      }
                      if (!v29)
                      {
                        id v7 = v28;
                        id v18 = v27;
                        id v8 = v107;
                        uint64_t v20 = v108;
                        goto LABEL_43;
                      }
                      long long v110 = v29;
                      uint64_t v32 = [v24 type];
                      int v33 = [v32 isEqualToString:@"00000254-0000-1000-8000-0026BB765291"];

                      if (v33)
                      {
                        id v117 = 0;
                        uint64_t v34 = +[HMDSiriEndpointSessionStateTLV parsedFromData:v29 error:&v117];
                        id v35 = v117;

                        contexta = (void *)MEMORY[0x230FBD990]();
                        long long v36 = v103;
                        long long v37 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                        {
                          HMFGetLogIdentifier();
                          id v99 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          id v132 = v99;
                          __int16 v133 = 2112;
                          uint64_t v134 = v34;
                          __int16 v135 = 2112;
                          id v136 = v35;
                          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Parsed HMDSiriEndpointSessionStateTLV: %@ with error: %@", buf, 0x20u);
                        }
                        id v7 = v102;
                        long long v38 = v35;
LABEL_40:
                        id v18 = v27;
LABEL_41:
                        uint64_t v20 = v108;
                      }
                      else
                      {
                        long long v39 = [v24 type];
                        int v40 = [v39 isEqualToString:v101];

                        if (v40)
                        {
                          id v41 = v29;
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            long long v42 = v41;
                          }
                          else {
                            long long v42 = 0;
                          }
                          id v43 = v42;

                          long long v38 = v43;
                          [(HMDSiriEndpointHAPSettings *)v104 setSiriEndpointVersion:v43];
                          uint64_t v34 = (uint64_t)context;
                          id v7 = v28;
                          goto LABEL_40;
                        }
                        uint64_t v44 = [v24 type];
                        int v45 = [v44 isEqualToString:@"00000255-0000-1000-8000-0026BB765291"];

                        id v7 = v28;
                        if (v45)
                        {
                          id v46 = v110;
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            int v47 = v46;
                          }
                          else {
                            int v47 = 0;
                          }
                          id v48 = v47;

                          long long v38 = v48;
                          [(HMDSiriEndpointHAPSettings *)v104 setSiriEnable:v48];
                          uint64_t v34 = (uint64_t)context;
                          goto LABEL_40;
                        }
                        uint64_t v49 = [v24 type];
                        int v50 = [v49 isEqualToString:@"00000256-0000-1000-8000-0026BB765291"];

                        id v18 = v27;
                        if (v50)
                        {
                          id v51 = v110;
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            uint64_t v52 = v51;
                          }
                          else {
                            uint64_t v52 = 0;
                          }
                          id v53 = v52;

                          long long v38 = v53;
                          [(HMDSiriEndpointHAPSettings *)v104 setSiriListening:v53];
                          uint64_t v34 = (uint64_t)context;
                          goto LABEL_41;
                        }
                        uint64_t v54 = [v24 type];
                        int v55 = [v54 isEqualToString:@"00000257-0000-1000-8000-0026BB765291"];

                        uint64_t v20 = v108;
                        if (v55)
                        {
                          id v56 = v110;
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            v57 = v56;
                          }
                          else {
                            v57 = 0;
                          }
                          id v58 = v57;

                          long long v38 = v58;
                          [(HMDSiriEndpointHAPSettings *)v104 setSiriTouchToUse:v58];
                        }
                        else
                        {
                          int v59 = [v24 type];
                          int v60 = [v59 isEqualToString:@"00000258-0000-1000-8000-0026BB765291"];

                          if (v60)
                          {
                            id v61 = v110;
                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              v62 = v61;
                            }
                            else {
                              v62 = 0;
                            }
                            id v63 = v62;

                            long long v38 = v63;
                            [(HMDSiriEndpointHAPSettings *)v104 setSiriLightOnUse:v63];
                          }
                          else
                          {
                            v64 = [v24 type];
                            int v65 = [v64 isEqualToString:@"0000025A-0000-1000-8000-0026BB765291"];

                            if (v65)
                            {
                              id v66 = v110;
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                uint64_t v67 = v66;
                              }
                              else {
                                uint64_t v67 = 0;
                              }
                              id v68 = v67;

                              long long v38 = v68;
                              [(HMDSiriEndpointHAPSettings *)v104 setSiriEngineVersion:v68];
                            }
                            else
                            {
                              char v69 = [v24 type];
                              int v70 = [v69 isEqualToString:v92];

                              if (v70)
                              {
                                id v71 = v110;
                                objc_opt_class();
                                if (objc_opt_isKindOfClass()) {
                                  v72 = v71;
                                }
                                else {
                                  v72 = 0;
                                }
                                id v73 = v72;

                                long long v38 = v73;
                                [(HMDSiriEndpointHAPSettings *)v104 setActiveIdentifier:v73];
                              }
                              else
                              {
                                uint64_t v74 = [v24 type];
                                int v75 = [v74 isEqualToString:@"00000227-0000-1000-8000-0026BB765291"];

                                if (v75)
                                {
                                  id v76 = v110;
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass()) {
                                    v77 = v76;
                                  }
                                  else {
                                    v77 = 0;
                                  }
                                  id v78 = v77;

                                  long long v38 = v78;
                                  [(HMDSiriEndpointHAPSettings *)v104 setManuallyDisabled:v78];
                                }
                                else
                                {
                                  uint64_t v79 = [v24 type];
                                  int v80 = [v79 isEqualToString:@"0000026B-0000-1000-8000-0026BB765291"];

                                  if (!v80)
                                  {
                                    long long v115 = 0u;
                                    long long v116 = 0u;
                                    long long v113 = 0u;
                                    long long v114 = 0u;
                                    id v100 = [(HMDSiriEndpointProfile *)v103 assistants];
                                    uint64_t v84 = [v100 countByEnumeratingWithState:&v113 objects:v130 count:16];
                                    if (v84)
                                    {
                                      uint64_t v85 = v84;
                                      uint64_t v86 = *(void *)v114;
                                      do
                                      {
                                        for (uint64_t i = 0; i != v85; ++i)
                                        {
                                          if (*(void *)v114 != v86) {
                                            objc_enumerationMutation(v100);
                                          }
                                          if ([*(id *)(*((void *)&v113 + 1) + 8 * i) updateCharacteristic:v24 value:v110])-[HMDSiriEndpointHAPSettings setAssistantsUpdated:](v104, "setAssistantsUpdated:", 1); {
                                        }
                                          }
                                        uint64_t v85 = [v100 countByEnumeratingWithState:&v113 objects:v130 count:16];
                                      }
                                      while (v85);
                                      uint64_t v34 = (uint64_t)context;
                                      id v7 = v102;
                                    }
                                    else
                                    {
                                      uint64_t v34 = (uint64_t)context;
                                    }
                                    long long v38 = v100;
                                    goto LABEL_42;
                                  }
                                  id v81 = v110;
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass()) {
                                    id v82 = v81;
                                  }
                                  else {
                                    id v82 = 0;
                                  }
                                  id v83 = v82;

                                  long long v38 = v83;
                                  [(HMDSiriEndpointHAPSettings *)v104 setMultifunctionButton:v83];
                                }
                              }
                            }
                          }
                        }
                        uint64_t v34 = (uint64_t)context;
                      }
LABEL_42:

                      context = (void *)v34;
                      id v8 = v107;

                      goto LABEL_43;
                    }
LABEL_44:

                    ++v21;
                  }
                  while (v21 != v20);
                  uint64_t v88 = [v18 countByEnumeratingWithState:&v118 objects:v137 count:16];
                  uint64_t v20 = v88;
                  if (!v88)
                  {
LABEL_95:

                    uint64_t v13 = v94;
                    uint64_t v12 = v96;
                    uint64_t v14 = v98;
                    break;
                  }
                }
              }
              ++v14;
            }
            while (v14 != v12);
            uint64_t v12 = [v97 countByEnumeratingWithState:&v122 objects:v138 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v91 + 1;
      }
      while (v91 + 1 != v90);
      uint64_t v90 = [obj countByEnumeratingWithState:&v126 objects:v139 count:16];
      if (!v90) {
        goto LABEL_102;
      }
    }
  }
  context = 0;
LABEL_102:

  [(HMDSiriEndpointProfile *)v103 _updateSessionState:context settings:v104 message:0];
}

- (void)setSiriEngineVersion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  siriEngineVersion = self->_siriEngineVersion;
  self->_siriEngineVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)siriEngineVersion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_siriEngineVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)siriSoundOnUse
{
  return -1;
}

- (void)setSiriLightOnUse:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriLightOnUse = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriLightOnUse
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t siriLightOnUse = self->_siriLightOnUse;
  os_unfair_lock_unlock(p_lock);
  return siriLightOnUse;
}

- (void)setSiriTouchToUse:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriTouchToUse = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriTouchToUse
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t siriTouchToUse = self->_siriTouchToUse;
  os_unfair_lock_unlock(p_lock);
  return siriTouchToUse;
}

- (void)setSiriListening:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriListening = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriListening
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t siriListening = self->_siriListening;
  os_unfair_lock_unlock(p_lock);
  return siriListening;
}

- (void)setSiriEnable:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriEnable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriEnable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t siriEnable = self->_siriEnable;
  os_unfair_lock_unlock(p_lock);
  return siriEnable;
}

- (void)setMultifunctionButton:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_multifunctionButton = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)multifunctionButton
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t multifunctionButton = self->_multifunctionButton;
  os_unfair_lock_unlock(p_lock);
  return multifunctionButton;
}

- (void)setManuallyDisabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_manuallyDisabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)manuallyDisabled
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_manuallyDisabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActiveIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSNumber *)[v6 copy];
  activeIdentifier = self->_activeIdentifier;
  self->_activeIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)activeIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_activeIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)needsOnboarding
{
  uint64_t v3 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5 || ([v5 needsOnboarding], (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = [(HMDSiriEndpointProfile *)self stagedNeedsOnboarding];
    id v6 = [v7 value];
  }
  return (NSNumber *)v6;
}

- (void)stageNeedsOnboarding:(int64_t)a3 withTimeout:(double)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x230FBD990](self, a2);
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    int64_t v16 = a3;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Staging needsOnboarding: %ld", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(HMDSiriEndpointProfile *)v8 stagedNeedsOnboarding];
  uint64_t v12 = [NSNumber numberWithInteger:a3];
  [v11 stageValue:v12 withTimeout:a4];
}

- (void)stageNeedsOnboarding:(int64_t)a3
{
  id v5 = [MEMORY[0x263F42608] sharedPreferences];
  id v7 = [v5 preferenceForKey:@"siriProfileOnBoardingPendingTime"];

  id v6 = [v7 numberValue];
  [v6 doubleValue];
  -[HMDSiriEndpointProfile stageNeedsOnboarding:withTimeout:](self, "stageNeedsOnboarding:withTimeout:", a3);
}

- (NSArray)assistants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_assistants;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssistants:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  assistants = self->_assistants;
  self->_assistants = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)addService:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self accessory];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = (void *)MEMORY[0x263EFF980];
    id v8 = [(HMDSiriEndpointProfile *)self profileServices];
    uint64_t v9 = [v7 arrayWithArray:v8];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v14), "instanceID", (void)v25);
          int64_t v16 = [v4 instanceID];
          char v17 = [v15 isEqual:v16];

          if (v17)
          {
            uint64_t v22 = v10;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [v10 addObject:v4];
    id v18 = (void *)[v10 copy];
    [(HMDSiriEndpointProfile *)self setProfileServices:v18];

    uint64_t v19 = [v4 serviceType];
    int v20 = [v19 isEqualToString:@"0000026A-0000-1000-8000-0026BB765291"];

    if (v20)
    {
      uint64_t v21 = [(HMDSiriEndpointProfile *)self assistants];
      uint64_t v22 = (void *)[v21 mutableCopy];

      long long v23 = [[HMDSiriEndpointProfileAssistant alloc] initWithService:v4];
      [v22 addObject:v23];
      long long v24 = (void *)[v22 copy];
      [(HMDSiriEndpointProfile *)self setAssistants:v24];

LABEL_13:
    }
  }
}

- (NSArray)profileServices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_profileServices;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setProfileServices:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  profileServices = self->_profileServices;
  self->_profileServices = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSiriEndpointVersion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  siriEndpointVersion = self->_siriEndpointVersion;
  self->_siriEndpointVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)siriEndpointVersion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_siriEndpointVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSUUID)sessionHubIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sessionHubIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSessionHubIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSUUID *)[v6 copy];
  sessionHubIdentifier = self->_sessionHubIdentifier;
  self->_sessionHubIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_siriSettingMultifunctionButtonReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriSettingMultifunctionButtonCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriSettingMultifunctionButtonCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"0000026B-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriEndpointManuallyDisabledReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointManuallyDisabledCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointManuallyDisabledCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"00000227-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriEndpointActiveIdentifierReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointActiveIdentifierCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointActiveIdentifierCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointService];
  uint64_t v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0BF08]];

  return v3;
}

- (id)_siriEndpointVersionReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointVersionCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointVersionCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointService];
  uint64_t v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0C588]];

  return v3;
}

- (id)_siriEndpointSessionStatusReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointSessionStatusCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointSessionStatusCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriEndpointService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"00000254-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriSettingSiriEngineVersionReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriSettingSiriEngineVersionCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriEngineVersionCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"0000025A-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriSettingSiriLightOnUseReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriSettingSiriLightOnUseCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriLightOnUseCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"00000258-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriSettingSiriTouchReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriSettingSiriTouchCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriTouchCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"00000257-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriSettingSiriListeningReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriSettingSiriListeningCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriListeningCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"00000256-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriSettingSiriEnableReadRequest
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriSettingSiriEnableCharacteristic];
  if (v2)
  {
    uint64_t v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriEnableCharacteristic
{
  uint64_t v2 = [(HMDSiriEndpointProfile *)self _siriService];
  uint64_t v3 = [v2 findCharacteristicWithType:@"00000255-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_siriEndpointService
{
  return [(HMDAccessoryProfile *)self findServiceWithType:@"00000253-0000-1000-8000-0026BB765291"];
}

- (id)_siriService
{
  return [(HMDAccessoryProfile *)self findServiceWithType:@"00000133-0000-1000-8000-0026BB765291"];
}

- (void)unregisterForNotifications
{
  id v3 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v3 removeObserver:self];
}

- (void)registerForNotifications
{
  id v10 = [(HMDAccessoryProfile *)self accessory];
  id v3 = [v10 home];
  id v4 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v4 addObserver:self selector:sel_handleHomeCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v10];

  id v5 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v5 addObserver:self selector:sel_handleHomeCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsResponseReceivedNotification" object:v3];

  id v6 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v6 addObserver:self selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:v10];

  id v7 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v7 addObserver:self selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  id v8 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v8 addObserver:self selector:sel_handleDeviceCapabilitiesUpdated_ name:@"HMDDeviceCapabilitiiesUpdatedNotification" object:0];

  uint64_t v9 = [(HMDSiriEndpointProfile *)self notificationCenter];
  [v9 addObserver:self selector:sel_handleUpdateNeedsOnboarding_ name:@"HMDSiriEndpointProfileUpdateNeedsOnboardingNotification" object:0];
}

- (void)registerForMessages
{
  v12[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HMDSiriEndpointProfile;
  [(HMDAccessoryProfile *)&v11 registerForMessages];
  id v3 = [(HMDAccessoryProfile *)self msgDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v12[0] = v4;
  id v5 = [(HMDAccessoryProfile *)self accessory];
  id v6 = [v5 home];
  id v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:0 remoteAccessRequired:0];
  v12[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  [v3 registerForMessage:*MEMORY[0x263F0D980] receiver:self policies:v8 selector:sel__handleRefreshProfileState_];
  [v3 registerForMessage:*MEMORY[0x263F0D958] receiver:self policies:v8 selector:sel_handleEnableNotifications_];
  [(HMDSiriEndpointProfile *)self unregisterForNotifications];
  [(HMDSiriEndpointProfile *)self registerForNotifications];
  uint64_t v9 = [(HMDAccessoryProfile *)self workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__HMDSiriEndpointProfile_registerForMessages__block_invoke;
  v10[3] = &unk_264A2F7F8;
  v10[4] = self;
  dispatch_async(v9, v10);
}

void __45__HMDSiriEndpointProfile_registerForMessages__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 home];
  int v4 = [v3 currentDeviceSupportsSidekickSettings];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for characteristic notifcations since current device supports home hub", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) _setNotifications:1 options:2];
    [*(id *)(a1 + 32) _handleRefreshProfileState:0 completionHandler:0];
  }
}

- (HMDSiriEndpointProfile)initWithSiriEndpointServices:(id)a3 notificationCenter:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  int v9 = [v8 accessory];
  if (v9)
  {
    id v10 = [(id)objc_opt_class() uniqueIdentifierFromAccessory:v9];
    HMDispatchQueueNameString();
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (const char *)[v11 UTF8String];
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    v53.receiver = self;
    v53.super_class = (Class)HMDSiriEndpointProfile;
    __int16 v15 = [(HMDAccessoryProfile *)&v53 initWithAccessory:v9 uniqueIdentifier:v10 services:0 workQueue:v14];

    if (v15)
    {
      id v46 = v9;
      v15->_sessionState = -1;
      uint64_t v16 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
      sessionHubIdentifier = v15->_sessionHubIdentifier;
      v15->_sessionHubIdentifier = (NSUUID *)v16;

      siriEndpointVersion = v15->_siriEndpointVersion;
      v15->_siriEndpointVersion = (NSString *)&stru_26E2EB898;

      uint64_t v19 = v6;
      if (!v6)
      {
        uint64_t v19 = [MEMORY[0x263EFF8C0] array];
      }
      int v47 = v8;
      objc_storeStrong((id *)&v15->_profileServices, v19);
      id v48 = v6;
      if (!v6) {

      }
      objc_storeStrong((id *)&v15->_notificationCenter, a4);
      v15->_int64_t siriEnable = -1;
      v15->_int64_t siriListening = -1;
      v15->_int64_t siriTouchToUse = -1;
      v15->_int64_t siriLightOnUse = -1;
      siriEngineVersion = v15->_siriEngineVersion;
      v15->_siriEngineVersion = (NSString *)&stru_26E2EB898;

      uint64_t v21 = [NSString stringWithFormat:@"%@.HMDSiriEndpointProfile.Endpoint.%@", @"com.apple.HomeKitDaemon.Local", v10];
      clientEndpointIdentifier = v15->_clientEndpointIdentifier;
      v15->_clientEndpointIdentifier = (NSString *)v21;

      int v45 = v10;
      uint64_t v23 = [NSString stringWithFormat:@"%@.HMDSiriEndpointProfile.Settings.%@", @"com.apple.HomeKitDaemon.Local", v10];
      clientSettingsIdentifier = v15->_clientSettingsIdentifier;
      v15->_clientSettingsIdentifier = (NSString *)v23;

      v15->_manuallyDisabled = 0;
      uint64_t v44 = v15;
      v15->_int64_t multifunctionButton = -1;
      long long v25 = [MEMORY[0x263EFF980] array];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v26 = v15->_profileServices;
      uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v50 != v29) {
              objc_enumerationMutation(v26);
            }
            char v31 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            uint64_t v32 = [v31 serviceType];
            int v33 = [v32 isEqualToString:@"0000026A-0000-1000-8000-0026BB765291"];

            if (v33)
            {
              uint64_t v34 = [[HMDSiriEndpointProfileAssistant alloc] initWithService:v31];
              [v25 addObject:v34];
            }
          }
          uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v28);
      }

      uint64_t v35 = [v25 copy];
      __int16 v15 = v44;
      assistants = v44->_assistants;
      v44->_assistants = (NSArray *)v35;

      uint64_t v37 = [objc_alloc(MEMORY[0x263F42638]) initWithValue:&unk_26E471D10];
      stagedNeedsOnboarding = v44->_stagedNeedsOnboarding;
      v44->_stagedNeedsOnboarding = (HMFStagedValue *)v37;

      [(HMFStagedValue *)v15->_stagedNeedsOnboarding setDelegate:v15];
      id v6 = v48;
      int v9 = v46;
      id v8 = v47;
      id v10 = v45;
    }
    self = v15;

    long long v39 = self;
  }
  else
  {
    int v40 = (void *)MEMORY[0x230FBD990]();
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      long long v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v42;
      __int16 v57 = 2112;
      id v58 = v6;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Cannot create Siri Endpoint profile, cannot determine accessory from services %@", buf, 0x16u);
    }
    long long v39 = 0;
  }

  return v39;
}

- (HMDSiriEndpointProfile)initWithSiriEndpointServices:(id)a3
{
  int v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  id v7 = [(HMDSiriEndpointProfile *)self initWithSiriEndpointServices:v5 notificationCenter:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)uniqueIdentifierFromAccessory:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  id v6 = [v4 uuid];

  id v7 = v5;
  objc_msgSend(v6, "getUUIDBytes:", objc_msgSend(v7, "mutableBytes"));

  id v8 = (void *)MEMORY[0x263F08C38];
  int v9 = [(id)objc_opt_class() namespace];
  id v10 = objc_msgSend(v8, "hmf_UUIDWithNamespace:data:", v9, v7);

  return v10;
}

+ (id)namespace
{
  if (namespace_onceToken_139582 != -1) {
    dispatch_once(&namespace_onceToken_139582, &__block_literal_global_139583);
  }
  uint64_t v2 = (void *)namespace_namespace_139584;
  return v2;
}

void __35__HMDSiriEndpointProfile_namespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4CF0DBFA-FE71-485F-956B-20002E66B3AA"];
  uint64_t v1 = (void *)namespace_namespace_139584;
  namespace_namespace_139584 = v0;
}

+ (void)initialize
{
}

@end
@interface HUAccessoryHearingSyncManager
+ (NSSet)adaptiveTransparencySupportedDevices;
+ (NSSet)syncableSupportedDevices;
+ (id)sharedInstance;
- ($0AC6E346AE4835514AAA8AC86D8F4844)deviceState;
- (AXDispatchTimer)messageTimer;
- (BOOL)hasPairedDeviceWithHearingProtectionEnabled;
- (BOOL)hasPairedDevicesWithListeningModes;
- (BOOL)isHeadphoneStreamSelected;
- (BOOL)noiseDisabled;
- (BOOL)shouldUpdateWatchesWithListeningModes:(id)a3;
- (HUAccessoryHearingSyncManager)init;
- (NSDictionary)persistentDeviceListeningState;
- (NSMutableDictionary)cachedEnabled;
- (NSMutableDictionary)deviceListeningState;
- (NSMutableDictionary)deviceType;
- (NSMutableDictionary)nearbyDevicesListeningState;
- (id)deviceTypeForProductCode:(id)a3;
- (id)deviceTypesForAvailableAddresses:(id)a3;
- (int64_t)deviceTypeForAddress:(id)a3;
- (int64_t)listeningStateForAddress:(id)a3 andStoredState:(id)a4;
- (void)_cleanupNearbyDeviceStateDuplicatesForDevice:(id)a3;
- (void)_initCachedEnabled;
- (void)_registerForAccessoryHearingSettingsUpdate;
- (void)_registerForAccessoryManagerUpdate;
- (void)_registerForNearbyControllerUpdate;
- (void)_sendIDSMessageIfNeededForListeningModes:(id)a3 addresses:(id)a4 force:(BOOL)a5;
- (void)getDeviceTypesWithCompletion:(id)a3;
- (void)hasPairedDevicesWithListeningModes;
- (void)listeningModeDidChange:(id)a3;
- (void)processNoiseMeasurementsDisabledMessage:(id)a3 fromDevice:(id)a4;
- (void)readHearingProtectionState;
- (void)routesDidChange:(id)a3;
- (void)sendIDSMessageIfNeededForNewListeningModes:(id)a3 addresses:(id)a4 force:(BOOL)a5;
- (void)sendListeningModesIDSMessageIfNeeded;
- (void)sendUpdateToAccessory;
- (void)setCachedEnabled:(id)a3;
- (void)setDeviceListeningState:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setIsHeadphoneStreamSelected:(BOOL)a3;
- (void)setMessageTimer:(id)a3;
- (void)setNearbyDevicesListeningState:(id)a3;
- (void)setNoiseDisabled:(BOOL)a3;
- (void)setPersistentDeviceListeningState:(id)a3;
@end

@implementation HUAccessoryHearingSyncManager

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HCHPInitializeLogging();
  v3 = [NSString stringWithFormat:@"%@", v2];

  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 331, v3];
  v5 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_13);
  }
  id v2 = (void *)sharedInstance_Settings_2;

  return v2;
}

uint64_t __47__HUAccessoryHearingSyncManager_sharedInstance__block_invoke()
{
  sharedInstance_Settings_2 = objc_alloc_init(HUAccessoryHearingSyncManager);

  return MEMORY[0x270F9A758]();
}

+ (NSSet)adaptiveTransparencySupportedDevices
{
  id v2 = (void *)adaptiveTransparencySupportedDevices_AudioRouteProductIDs;
  if (!adaptiveTransparencySupportedDevices_AudioRouteProductIDs)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"76,8212", @"76,8228", 0);
    v4 = (void *)adaptiveTransparencySupportedDevices_AudioRouteProductIDs;
    adaptiveTransparencySupportedDevices_AudioRouteProductIDs = v3;

    id v2 = (void *)adaptiveTransparencySupportedDevices_AudioRouteProductIDs;
  }

  return (NSSet *)v2;
}

+ (NSSet)syncableSupportedDevices
{
  id v2 = (void *)syncableSupportedDevices_AudioRouteProductIDs;
  if (!syncableSupportedDevices_AudioRouteProductIDs)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"76,8206", @"76,8202", @"76,8212", @"76,8228", 0);
    v4 = (void *)syncableSupportedDevices_AudioRouteProductIDs;
    syncableSupportedDevices_AudioRouteProductIDs = v3;

    id v2 = (void *)syncableSupportedDevices_AudioRouteProductIDs;
  }

  return (NSSet *)v2;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)deviceState
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v3 = [(HUAccessoryHearingSyncManager *)self deviceListeningState];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__HUAccessoryHearingSyncManager_deviceState__block_invoke;
  v20[3] = &unk_2640FE2B0;
  v20[4] = self;
  v20[5] = &v25;
  v20[6] = &v21;
  [v3 enumerateKeysAndObjectsUsingBlock:v20];

  if (!v26[3])
  {
    v4 = [(HUAccessoryHearingSyncManager *)self nearbyDevicesListeningState];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_2;
    v19[3] = &unk_2640FE2D8;
    v19[4] = self;
    v19[5] = &v25;
    v19[6] = &v21;
    [v4 enumerateKeysAndObjectsUsingBlock:v19];
  }
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    uint64_t v5 = deviceState_LastListeningState;
    if (deviceState_LastListeningState != v26[3])
    {
      HCHPInitializeLogging();
      id v6 = NSString;
      v7 = [NSNumber numberWithInteger:v22[3]];
      v8 = [NSNumber numberWithInteger:v26[3]];
      uint64_t v9 = [(HUAccessoryHearingSyncManager *)self deviceListeningState];
      uint64_t v10 = [(HUAccessoryHearingSyncManager *)self nearbyDevicesListeningState];
      v11 = [(HUAccessoryHearingSyncManager *)self deviceType];
      v12 = [v6 stringWithFormat:@"Listening state %@ = %@ - %@ = %@ = %@", v7, v8, v9, v10, v11];

      v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager deviceState]", 149, v12];
      v14 = (id)*MEMORY[0x263F47298];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v13 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v30 = v15;
        _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      uint64_t v5 = v26[3];
      deviceState_LastListeningState = v5;
    }
  }
  else
  {
    uint64_t v5 = v26[3];
  }
  int64_t v16 = v22[3];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  int64_t v17 = v16;
  int64_t v18 = v5;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

void __44__HUAccessoryHearingSyncManager_deviceState__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 listeningStateForAddress:v8 andStoredState:a3];
  uint64_t v9 = [*(id *)(a1 + 32) deviceTypeForAddress:v8];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 5) {
    *a4 = 1;
  }
}

uint64_t __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_3;
  v4[3] = &unk_2640FE2B0;
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 listeningStateForAddress:v8 andStoredState:a3];
  uint64_t v9 = [*(id *)(a1 + 32) deviceTypeForAddress:v8];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 5) {
    *a4 = 1;
  }
}

- (BOOL)hasPairedDeviceWithHearingProtectionEnabled
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v3 = [v2 pairedDevices];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v24 + 1) + 8 * i) address];
        uint64_t v10 = +[HUAccessoryHearingSettings sharedInstance];
        int v11 = [v10 activeHearingProtectionEnabledForAddress:v9];

        if (v11)
        {
          HCHPInitializeLogging();
          int64_t v17 = [NSString stringWithFormat:@"Hearing Protection device %@, HP is enabled", v9];
          int64_t v18 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager hasPairedDeviceWithHearingProtectionEnabled]", 172, v17];
          v19 = (void *)*MEMORY[0x263F47298];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
          {
            id v20 = v18;
            uint64_t v21 = v19;
            uint64_t v22 = [v20 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v29 = v22;
            _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          BOOL v16 = 1;
          v12 = v4;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  HCHPInitializeLogging();
  v12 = [NSString stringWithFormat:@"No paired hearing protection device is found"];
  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager hasPairedDeviceWithHearingProtectionEnabled]", 177, v12];
  v13 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v9;
    v14 = v13;
    uint64_t v15 = [v9 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = v15;
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (HUAccessoryHearingSyncManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HUAccessoryHearingSyncManager;
  id v2 = [(HUAccessoryHearingSyncManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[HUAccessoryManager sharedInstance];
    id v4 = [v3 sharedQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__HUAccessoryHearingSyncManager_init__block_invoke;
    block[3] = &unk_2640FC960;
    uint64_t v7 = v2;
    dispatch_async(v4, block);
  }
  return v2;
}

void __37__HUAccessoryHearingSyncManager_init__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__HUAccessoryHearingSyncManager_init__block_invoke_2;
  v10[3] = &unk_2640FDB78;
  id v11 = v2;
  [v11 getDeviceTypesWithCompletion:v10];
  if (MKBDeviceFormattedForContentProtection())
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = +[HUAccessoryManager sharedInstance];
    uint64_t v5 = [v4 sharedQueue];
    uint64_t v6 = (const char *)*MEMORY[0x263F55A78];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __37__HUAccessoryHearingSyncManager_init__block_invoke_3;
    handler[3] = &unk_2640FDC78;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch(v6, (int *)(v3 + 48), v5, handler);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __37__HUAccessoryHearingSyncManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [*(id *)(a1 + 32) setDeviceListeningState:v4];

  uint64_t v5 = objc_opt_new();
  [*(id *)(a1 + 32) setPersistentDeviceListeningState:v5];

  [*(id *)(a1 + 32) _initCachedEnabled];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v6 setNearbyDevicesListeningState:v7];

  id v8 = *(void **)(a1 + 32);
  id v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];

  [v8 setDeviceType:v9];
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:*(void *)(a1 + 32) selector:sel_listeningModeDidChange_ name:*MEMORY[0x263F2B8E0] object:0];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:*(void *)(a1 + 32) selector:sel_listeningModeDidChange_ name:*MEMORY[0x263F2B8D0] object:0];

  [*(id *)(a1 + 32) _registerForAccessoryHearingSettingsUpdate];
  [*(id *)(a1 + 32) _registerForAccessoryManagerUpdate];
  [*(id *)(a1 + 32) _registerForNearbyControllerUpdate];
  [*(id *)(a1 + 32) _registerForNoiseEnabledPreferenceChange];
  id v12 = objc_alloc(MEMORY[0x263F21398]);
  v13 = +[HUAccessoryManager sharedInstance];
  v14 = [v13 sharedQueue];
  uint64_t v15 = (void *)[v12 initWithTargetSerialQueue:v14];
  [*(id *)(a1 + 32) setMessageTimer:v15];

  BOOL v16 = [*(id *)(a1 + 32) messageTimer];
  [v16 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

  id v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 addObserver:*(void *)(a1 + 32) selector:sel_routesDidChange_ name:@"com.apple.accessibility.hearingaid.audio.route.changed" object:0];
}

void __37__HUAccessoryHearingSyncManager_init__block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  id v2 = [NSString stringWithFormat:@"Lock state changed"];
  id v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager init]_block_invoke_3", 216, v2];
  id v4 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    uint64_t v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained readHearingProtectionState];
}

- (void)_initCachedEnabled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = +[HUAccessoryHearingSettings sharedInstance];
  id v4 = [v3 activeHearingProtectionEnabled];
  id v5 = (NSMutableDictionary *)[v4 mutableCopy];
  cachedEnabled = self->_cachedEnabled;
  self->_cachedEnabled = v5;

  if (!self->_cachedEnabled)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    id v8 = self->_cachedEnabled;
    self->_cachedEnabled = v7;
  }
  HCHPInitializeLogging();
  uint64_t v9 = [NSString stringWithFormat:@"Starting sync %@", self->_cachedEnabled];
  uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _initCachedEnabled]", 237, v9];
  id v11 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)_registerForAccessoryHearingSettingsUpdate
{
  objc_initWeak(&location, self);
  id v3 = +[HUAccessoryHearingSettings sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke;
  v4[3] = &unk_2640FC910;
  objc_copyWeak(&v5, &location);
  [v3 registerUpdateBlock:v4 forRetrieveSelector:sel_activeHearingProtectionEnabled withListener:self];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke(uint64_t a1)
{
  id v2 = +[HUAccessoryManager sharedInstance];
  id v3 = [v2 sharedQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke_2;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v2 = +[HUAccessoryHearingSettings sharedInstance];
  id v3 = [v2 activeHearingProtectionEnabled];

  if (v3)
  {
    id v4 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v4);
    uint64_t v6 = [WeakRetained cachedEnabled];
    char v7 = [v3 isEqualToDictionary:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = objc_loadWeakRetained(v4);
      [v8 sendUpdateToAccessory];

      id v9 = objc_loadWeakRetained(v4);
      uint64_t v10 = (void *)[v3 mutableCopy];
      [v9 setCachedEnabled:v10];

      v13 = @"HUAHPEnabledKey";
      v14[0] = v3;
      id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v12 = +[HUNearbyController sharedInstance];
      [v12 sendMessage:v11 toDevicesWithDomain:@"com.apple.hearing.accessory" withPriority:1];
    }
  }
}

- (void)readHearingProtectionState
{
  id v2 = +[HUAccessoryManager sharedInstance];
  [v2 getAvailableAddressesSupportingCharacteristic:@"a48fec08-3921-43db-82aa-afbce8ebb4fb" withCompletion:&__block_literal_global_50];
}

void __59__HUAccessoryHearingSyncManager_readHearingProtectionState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HCHPInitializeLogging();
  id v3 = [NSString stringWithFormat:@"HUAccessoryHearingSyncManager Characteristic %@, addresses %@", @"a48fec08-3921-43db-82aa-afbce8ebb4fb", v2];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager readHearingProtectionState]_block_invoke", 263, v3];
  id v5 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    char v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_57];
}

void __59__HUAccessoryHearingSyncManager_readHearingProtectionState__block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F2B998] sharedInstance];
  id v4 = [v3 deviceFromAddressString:v2];

  unsigned int v5 = [v4 getAACPCapabilityInteger:48];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d,%d", objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
  char v7 = +[HUAccessoryHearingSyncManager adaptiveTransparencySupportedDevices];
  uint64_t v8 = [v7 containsObject:v6];

  HCHPInitializeLogging();
  uint64_t v9 = NSString;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v5];
  id v11 = [NSNumber numberWithBool:v8];
  id v12 = [v9 stringWithFormat:@"HP version %@, product code %@, supported %@, for accessory %@", v10, v6, v11, v2];

  v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager readHearingProtectionState]_block_invoke", 270, v12];
  v14 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    uint64_t v16 = v14;
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = [v15 UTF8String];
    _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v17 = +[HUAccessoryHearingSettings sharedInstance];
  int64_t v18 = v17;
  if (v5) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v8;
  }
  [v17 setActiveHearingProtectionAvailable:v19 forAddress:v2];
}

- (void)_registerForAccessoryManagerUpdate
{
  v13[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = +[HUAccessoryManager sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke;
  v9[3] = &unk_2640FE390;
  id v4 = v3;
  id v10 = v4;
  objc_copyWeak(&v11, &location);
  [v4 registerDiscoveryBlock:v9 withListener:self];
  uint64_t v7 = MEMORY[0x263EF8330];
  objc_copyWeak(&v8, &location);
  unsigned int v5 = objc_msgSend(MEMORY[0x263EFEF88], "UUIDWithString:", @"a48fec08-3921-43db-82aa-afbce8ebb4fb", v7, 3221225472, __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_3, &unk_2640FE3B8);
  v13[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v4 registerUpdateBlock:&v7 forCharacteristicUUIDs:v6 withListener:self];

  [v4 registerLoggingBlock:&__block_literal_global_79 withListener:self];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  HCHPInitializeLogging();
  uint64_t v7 = [NSString stringWithFormat:@"Found new accessories %@, lost accessories %@", v5, v6];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 284, v7];
  uint64_t v9 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    id v11 = v9;
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v12 = *(void **)(a1 + 32);
  v13 = [MEMORY[0x263EFEF88] UUIDWithString:@"a48fec08-3921-43db-82aa-afbce8ebb4fb"];
  [v12 readValueForCharacteristicUUID:v13];

  v14 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_68;
  v17[3] = &unk_2640FE368;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v15 = v5;
  id v18 = v15;
  id v16 = v6;
  id v19 = v16;
  [v14 getAvailableAddressesSupportingCharacteristic:@"a48fec08-3921-43db-82aa-afbce8ebb4fb" withCompletion:v17];

  objc_destroyWeak(&v20);
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  HCHPInitializeLogging();
  id v4 = [NSString stringWithFormat:@"HUAccessoryHearingSyncManager Characteristic %@, addresses %@", @"a48fec08-3921-43db-82aa-afbce8ebb4fb", v3];
  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 289, v4];
  id v6 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained readHearingProtectionState];

  id v10 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_69;
  v15[3] = &unk_2640FE340;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  [v10 enumerateObjectsUsingBlock:v15];
  id v11 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_2;
  v13[3] = &unk_2640FE340;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  [v11 enumerateObjectsUsingBlock:v13];
  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  [v12 listeningModeDidChange:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_69(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [MEMORY[0x263F2B998] sharedInstance];
  id v4 = [v3 deviceFromAddressString:v11];

  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d,%d", objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained deviceTypeForProductCode:v5];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    id v10 = [v9 deviceType];
    [v10 setObject:v8 forKey:v11];
  }
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained deviceType];
  [v4 removeObjectForKey:v3];
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x263EFEF88];
  id v10 = a3;
  id v11 = [v9 UUIDWithString:@"a48fec08-3921-43db-82aa-afbce8ebb4fb"];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    HCHPInitializeLogging();
    v13 = [NSString stringWithFormat:@"Found value for AHP %@ - %@", v8, v7];
    id v14 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke_3", 315, v13];
    id v15 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14;
      id v17 = v15;
      *(_DWORD *)buf = 136446210;
      uint64_t v20 = [v16 UTF8String];
      _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (v8)
    {
      buf[0] = 1;
      [v8 getBytes:buf length:1];
      id WeakRetained = +[HUAccessoryHearingSettings sharedInstance];
      [WeakRetained setActiveHearingProtectionEnabled:buf[0] != 0 forAddress:v7];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained sendUpdateToAccessory];
    }
  }
}

- (void)_registerForNearbyControllerUpdate
{
  objc_initWeak(&location, self);
  id v3 = +[HUNearbyController sharedInstance];
  id v4 = +[HUAccessoryManager sharedInstance];
  id v5 = [v4 sharedQueue];
  [v3 registerQueue:v5 forDomain:@"com.apple.hearing.accessory"];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke;
  v7[3] = &unk_2640FE400;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v3 registerMessageBlock:v7 forDomain:@"com.apple.hearing.accessory" withListener:self];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_104;
  v6[3] = &unk_2640FDB50;
  v6[4] = self;
  [v3 registerDiscoveryBlock:v6 forDomain:@"com.apple.hearing.accessory" withListener:self];
  [v3 registerLoggingBlock:&__block_literal_global_123 forDomain:@"com.apple.hearing.accessory" withListener:self];
  [v3 discoverNearbyDevicesWithDomain:@"com.apple.hearing.accessory"];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) processNoiseMeasurementsDisabledMessage:v6 fromDevice:v5];
  uint64_t v7 = [v6 objectForKey:@"HUAHPEnabledKey"];
  id v8 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [WeakRetained cachedEnabled];

  v41 = (void *)v7;
  [v10 addEntriesFromDictionary:v7];
  id v11 = +[HUAccessoryHearingSettings sharedInstance];
  [v11 setActiveHearingProtectionEnabled:v10];

  v40 = [v6 objectForKey:@"HUAHPAvailableKey"];
  [v40 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_87];
  int v12 = [v6 objectForKey:@"HUListenModeKey"];
  HCHPInitializeLogging();
  v13 = [NSString stringWithFormat:@"Listening modes %@ for device %@", v12, v5];
  id v14 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 357, v13];
  id v15 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v14;
    id v17 = v15;
    *(_DWORD *)buf = 136446210;
    uint64_t v43 = [v16 UTF8String];
    _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v5)
  {
    uint64_t v18 = [v12 count];
    id v19 = objc_loadWeakRetained(v8);
    uint64_t v20 = [v19 nearbyDevicesListeningState];
    uint64_t v21 = [v5 identifier];
    if (v18)
    {
      [v20 setObject:v12 forKey:v21];

      id v19 = objc_loadWeakRetained(v8);
      [v19 _cleanupNearbyDeviceStateDuplicatesForDevice:v5];
    }
    else
    {
      [v20 removeObjectForKey:v21];
    }
    HCHPInitializeLogging();
    uint64_t v22 = NSString;
    id v23 = objc_loadWeakRetained(v8);
    long long v24 = [v23 nearbyDevicesListeningState];
    long long v25 = [v22 stringWithFormat:@"Updated nearbyDevicesListeningState: %@", v24];

    long long v26 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 369, v25];
    long long v27 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v28 = v26;
      uint64_t v29 = v27;
      uint64_t v30 = [v28 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v43 = v30;
      _os_log_impl(&dword_20CC86000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  uint64_t v31 = [v6 objectForKey:@"HUDeviceTypeKey"];
  HCHPInitializeLogging();
  v32 = [NSString stringWithFormat:@"Device types %@ for device %@", v31, v5];
  v33 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 373, v32];
  v34 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v35 = v33;
    v36 = v34;
    uint64_t v37 = [v35 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v43 = v37;
    _os_log_impl(&dword_20CC86000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v5)
  {
    id v38 = objc_loadWeakRetained(v8);
    v39 = [v38 deviceType];
    [v39 addEntriesFromDictionary:v31];
  }
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v7 = +[HUAccessoryHearingSettings sharedInstance];
  uint64_t v6 = [v4 BOOLValue];

  [v7 setActiveHearingProtectionAvailable:v6 forAddress:v5];
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_105;
    v5[3] = &unk_2640FE470;
    v5[4] = v4;
    id v6 = v3;
    [v4 getDeviceTypesWithCompletion:v5];
  }
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_105(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  int v5 = headphoneStreamSelected();
  id v6 = (NSObject **)MEMORY[0x263F47298];
  if (v5)
  {
    id v7 = +[HUAccessoryHearingSettings sharedInstance];
    id v8 = [v7 activeHearingProtectionEnabled];

    id v9 = +[HUAccessoryHearingSettings sharedInstance];
    id v10 = [v9 activeHearingProtectionAvailable];

    id v11 = [*(id *)(a1 + 32) deviceListeningState];
    if ([v10 count]) {
      [v4 setObject:v10 forKey:@"HUAHPAvailableKey"];
    }
    if ([v8 count]) {
      [v4 setObject:v8 forKey:@"HUAHPEnabledKey"];
    }
    if ([v11 count]) {
      [v4 setObject:v11 forKey:@"HUListenModeKey"];
    }
    if ([v3 count]) {
      [v4 setObject:v3 forKey:@"HUDeviceTypeKey"];
    }
  }
  else
  {
    HCHPInitializeLogging();
    id v8 = [NSString stringWithFormat:@"Headphone is not selected, NOT sending Accessory info"];
    id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke_2", 416, v8];
    int v12 = *v6;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v13 = v10;
    id v11 = v12;
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = [v13 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

LABEL_13:
  if ([v4 count])
  {
    HCHPInitializeLogging();
    id v14 = [NSString stringWithFormat:@"Sending Accessory state message to discovered devices: %@", *(void *)(a1 + 40)];
    id v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 421, v14];
    id v16 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      uint64_t v18 = v16;
      uint64_t v19 = [v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v40 = v19;
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v20 = +[HUNearbyController sharedInstance];
    [v20 sendMessage:v4 withDomain:@"com.apple.hearing.accessory" toDevices:*(void *)(a1 + 40) withPriority:1];
  }
  uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v22 = +[HUNearbyController sharedInstance];
  id v23 = [v22 nearbyDevices];
  long long v24 = objc_msgSend(v23, "ax_mappedArrayUsingBlock:", &__block_literal_global_115);

  long long v25 = [*(id *)(a1 + 32) nearbyDevicesListeningState];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_116;
  v36[3] = &unk_2640FE448;
  id v26 = v24;
  id v37 = v26;
  id v27 = v21;
  id v38 = v27;
  [v25 enumerateKeysAndObjectsUsingBlock:v36];

  HCHPInitializeLogging();
  id v28 = NSString;
  uint64_t v29 = [*(id *)(a1 + 32) nearbyDevicesListeningState];
  uint64_t v30 = [v28 stringWithFormat:@"Filtering nearby listening modes on update to nearby devices %@ - %@", v29, v27];

  uint64_t v31 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke_3", 436, v30];
  v32 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v33 = v31;
    v34 = v32;
    uint64_t v35 = [v33 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v40 = v35;
    _os_log_impl(&dword_20CC86000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setNearbyDevicesListeningState:v27];
}

uint64_t __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_112(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_116(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_121(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HCHPInitializeLogging();
  id v3 = [NSString stringWithFormat:@"%@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 442, v3];
  id v5 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)_cleanupNearbyDeviceStateDuplicatesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(HUAccessoryHearingSyncManager *)self nearbyDevicesListeningState];
  id v7 = [v4 identifier];
  id v8 = [v6 objectForKey:v7];
  uint64_t v9 = [v8 allKeys];

  uint64_t v10 = [(HUAccessoryHearingSyncManager *)self nearbyDevicesListeningState];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __78__HUAccessoryHearingSyncManager__cleanupNearbyDeviceStateDuplicatesForDevice___block_invoke;
  v14[3] = &unk_2640FE498;
  id v15 = v4;
  id v16 = v5;
  id v17 = v9;
  id v11 = v9;
  id v12 = v5;
  id v13 = v4;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];

  [(HUAccessoryHearingSyncManager *)self setNearbyDevicesListeningState:v12];
}

void __78__HUAccessoryHearingSyncManager__cleanupNearbyDeviceStateDuplicatesForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 identifier];
  char v8 = [v10 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];

    [v9 removeObjectsForKeys:*(void *)(a1 + 48)];
    id v6 = v9;
    if (![v9 count]) {
      goto LABEL_5;
    }
  }
  [*(id *)(a1 + 40) setObject:v6 forKey:v10];
LABEL_5:
}

- (NSMutableDictionary)cachedEnabled
{
  return self->_cachedEnabled;
}

- (void)setCachedEnabled:(id)a3
{
}

- (NSMutableDictionary)deviceListeningState
{
  return self->_deviceListeningState;
}

- (void)setDeviceListeningState:(id)a3
{
}

- (NSMutableDictionary)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSMutableDictionary)nearbyDevicesListeningState
{
  return self->_nearbyDevicesListeningState;
}

- (void)setNearbyDevicesListeningState:(id)a3
{
}

- (NSDictionary)persistentDeviceListeningState
{
  return self->_persistentDeviceListeningState;
}

- (void)setPersistentDeviceListeningState:(id)a3
{
}

- (void)listeningModeDidChange:(id)a3
{
  id v4 = a3;
  id v5 = +[HUAccessoryManager sharedInstance];
  id v6 = [v5 sharedQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke;
  v8[3] = &unk_2640FC938;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke(int8x16_t *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  id v2 = [NSString stringWithFormat:@"Listening state changed %@", a1[2].i64[0]];
  id v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager listeningModeDidChange:]_block_invoke", 548, v2];
  id v4 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v7 = +[HUAccessoryManager sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_127;
  v10[3] = &unk_2640FD998;
  int8x16_t v9 = a1[2];
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  [v7 getAvailableAddressesSupportingCharacteristic:0 withCompletion:v10];
}

void __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_2;
  uint64_t v19 = &unk_2640FE010;
  id v5 = v4;
  id v20 = v5;
  [v3 enumerateObjectsUsingBlock:&v16];
  HCHPInitializeLogging();
  id v6 = NSString;
  id v7 = [*(id *)(a1 + 32) deviceListeningState];
  id v8 = [v6 stringWithFormat:@"Listening modes current: %@ new: %@", v7, v5];

  int8x16_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager listeningModeDidChange:]_block_invoke", 604, v8, v16, v17, v18, v19];
  id v10 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    uint64_t v13 = [v11 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = v13;
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v14 = [*(id *)(a1 + 32) deviceListeningState];
  char v15 = [v14 isEqualToDictionary:v5];

  if ((v15 & 1) == 0) {
    [*(id *)(a1 + 32) setDeviceListeningState:v5];
  }
  [*(id *)(a1 + 32) sendIDSMessageIfNeededForNewListeningModes:v5 addresses:v3 force:*(void *)(a1 + 40) == 0];
}

void __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F2B998] sharedInstance];
  id v5 = [v4 deviceFromAddressString:v3];

  unsigned int v19 = 3;
  unsigned int v20 = 3;
  [v5 inEarStatusPrimary:&v20 secondary:&v19];
  unsigned int v6 = [v5 featureCapability:16];
  unsigned int v7 = [v5 featureCapability:17];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d,%d", objc_msgSend(v5, "vendorId"), objc_msgSend(v5, "productId"));
  int8x16_t v9 = +[HUAccessoryHearingSyncManager syncableSupportedDevices];
  int v10 = [v9 containsObject:v8];

  if (!v10 || (v6 | v7) != 1 || v20 || v19)
  {
    HCHPInitializeLogging();
    uint64_t v13 = [NSString stringWithFormat:@"Skipping device because not supported %@ [%d, %d] {%d, %d} %@", v8, v6, v7, v20, v19, v3];
    uint64_t v14 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager listeningModeDidChange:]_block_invoke", 600, v13];
    char v15 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14;
      uint64_t v17 = v15;
      uint64_t v18 = [v16 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v22 = v18;
      _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    switch([v5 listeningMode])
    {
      case 0u:
        id v11 = *(void **)(a1 + 32);
        id v12 = &unk_26C1E5768;
        goto LABEL_14;
      case 1u:
        id v11 = *(void **)(a1 + 32);
        id v12 = &unk_26C1E5720;
        goto LABEL_14;
      case 2u:
        id v11 = *(void **)(a1 + 32);
        id v12 = &unk_26C1E5708;
        goto LABEL_14;
      case 3u:
        id v11 = *(void **)(a1 + 32);
        id v12 = &unk_26C1E5738;
        goto LABEL_14;
      case 4u:
        id v11 = *(void **)(a1 + 32);
        id v12 = &unk_26C1E5750;
LABEL_14:
        [v11 setObject:v12 forKey:v3];
        break;
      default:
        break;
    }
  }
}

- (void)sendUpdateToAccessory
{
  id v2 = [MEMORY[0x263EFEF88] UUIDWithString:@"a48fec08-3921-43db-82aa-afbce8ebb4fb"];
  id v3 = +[HUAccessoryManager sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke;
  v6[3] = &unk_2640FD998;
  id v7 = v3;
  id v8 = v2;
  id v4 = v2;
  id v5 = v3;
  [v5 getAvailableAddressesSupportingCharacteristic:0 withCompletion:v6];
}

void __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke_2;
  v4[3] = &unk_2640FE4C0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 enumerateObjectsUsingBlock:v4];
}

void __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HUAccessoryHearingSettings sharedInstance];
  char v5 = [v4 activeHearingProtectionEnabledForAddress:v3];

  char v13 = v5;
  id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v13 length:1];
  HCHPInitializeLogging();
  id v7 = [NSString stringWithFormat:@"Sending update to %@ - %@ - %@", v3, v6, *(void *)(a1 + 32)];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager sendUpdateToAccessory]_block_invoke_2", 638, v7];
  int8x16_t v9 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    id v11 = v9;
    uint64_t v12 = [v10 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = v12;
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [*(id *)(a1 + 32) writeValue:v6 forCharacteristicUUID:*(void *)(a1 + 40) andAddress:v3];
}

- (void)routesDidChange:(id)a3
{
  id v4 = +[HUAccessoryManager sharedInstance];
  char v5 = [v4 sharedQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HUAccessoryHearingSyncManager_routesDidChange___block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __49__HUAccessoryHearingSyncManager_routesDidChange___block_invoke(uint64_t a1)
{
  int v2 = headphoneStreamSelected();
  uint64_t result = [*(id *)(a1 + 32) isHeadphoneStreamSelected];
  if (v2 != result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 sendListeningModesIDSMessageIfNeeded];
  }
  return result;
}

- (void)getDeviceTypesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = +[HUAccessoryManager sharedInstance];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__HUAccessoryHearingSyncManager_getDeviceTypesWithCompletion___block_invoke;
    v6[3] = &unk_2640FE4E8;
    void v6[4] = self;
    id v7 = v4;
    [v5 getAvailableAddressesSupportingCharacteristic:0 withCompletion:v6];
  }
}

void __62__HUAccessoryHearingSyncManager_getDeviceTypesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) deviceTypesForAvailableAddresses:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)deviceTypesForAvailableAddresses:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HUAccessoryHearingSyncManager_deviceTypesForAvailableAddresses___block_invoke;
  v11[3] = &unk_2640FE4C0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __66__HUAccessoryHearingSyncManager_deviceTypesForAvailableAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [MEMORY[0x263F2B998] sharedInstance];
  id v4 = [v3 deviceFromAddressString:v7];

  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d,%d", objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
  id v6 = [*(id *)(a1 + 32) deviceTypeForProductCode:v5];
  if (v6) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v7];
  }
}

- (id)deviceTypeForProductCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"76,8206"])
  {
    id v4 = &unk_26C1E5720;
  }
  else if (([v3 isEqualToString:@"76,8202"] & 1) != 0 {
         || ([v3 isEqualToString:@"76,8223"] & 1) != 0)
  }
  {
    id v4 = &unk_26C1E5708;
  }
  else if (([v3 isEqualToString:@"76,8212"] & 1) != 0 {
         || [v3 isEqualToString:@"76,8228"])
  }
  {
    id v4 = &unk_26C1E5738;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)deviceTypeForAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAccessoryHearingSyncManager *)self deviceType];
  id v6 = [v5 valueForKey:v4];

  int64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (int64_t)listeningStateForAddress:(id)a3 andStoredState:(id)a4
{
  id v5 = a3;
  int64_t v6 = [a4 unsignedIntegerValue];
  if (v6 == 3)
  {
    int64_t v7 = +[HUAccessoryHearingSettings sharedInstance];
    int v8 = [v7 activeHearingProtectionEnabledForAddress:v5];

    if (v8) {
      int64_t v6 = 5;
    }
    else {
      int64_t v6 = 3;
    }
  }

  return v6;
}

- (BOOL)shouldUpdateWatchesWithListeningModes:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = headphoneStreamSelected();
  HCHPInitializeLogging();
  int64_t v6 = NSString;
  int64_t v7 = [(HUAccessoryHearingSyncManager *)self persistentDeviceListeningState];
  int v8 = [v6 stringWithFormat:@"Headphone Selected %d, Listening modes sent to Watches: %@, new: %@", v5, v7, v4];

  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]", 731, v8];
  id v10 = (id *)MEMORY[0x263F47298];
  id v11 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v9;
    char v13 = v11;
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  if (v5)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke;
    v30[3] = &unk_2640FD220;
    v30[4] = self;
    v30[5] = &buf;
    [v4 enumerateKeysAndObjectsUsingBlock:v30];
    uint64_t v14 = [(HUAccessoryHearingSyncManager *)self persistentDeviceListeningState];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke_157;
    v27[3] = &unk_2640FD220;
    id v15 = v4;
    id v28 = v15;
    p_long long buf = &buf;
    [v14 enumerateKeysAndObjectsUsingBlock:v27];

    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      [(HUAccessoryHearingSyncManager *)self setPersistentDeviceListeningState:v15];
    }
  }
  else
  {
    uint64_t v16 = [(HUAccessoryHearingSyncManager *)self persistentDeviceListeningState];
    BOOL v17 = [v16 count] == 0;

    if (!v17)
    {
      *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
      uint64_t v18 = objc_opt_new();
      [(HUAccessoryHearingSyncManager *)self setPersistentDeviceListeningState:v18];
    }
  }
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    self->_isHeadphoneStreamSelected = v5;
  }
  unsigned int v19 = *v10;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v20 = [(HUAccessoryHearingSyncManager *)self persistentDeviceListeningState];
    [(HUAccessoryHearingSyncManager *)v20 shouldUpdateWatchesWithListeningModes:v19];
  }

  HCHPInitializeLogging();
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Listening modes for Watch changed: %d", *(unsigned __int8 *)(*((void *)&buf + 1) + 24));
  uint64_t v22 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]", 784, v21];
  uint64_t v23 = *v10;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v22 UTF8String];
    *(_DWORD *)uint64_t v31 = 136446210;
    uint64_t v32 = v24;
    _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", v31, 0xCu);
  }

  BOOL v25 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v25;
}

void __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int64_t v7 = [*(id *)(a1 + 32) persistentDeviceListeningState];
  int v8 = [v7 objectForKey:v5];

  if (!v8)
  {
    HCHPInitializeLogging();
    id v9 = [NSString stringWithFormat:@"Added listening mode %@, for device: %@", v6, v5];
    id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]_block_invoke", 743, v9];
    id v11 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      id v10 = v10;
      id v12 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v14 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
LABEL_7:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_8;
  }
  if (([v8 isEqual:v6] & 1) == 0)
  {
    HCHPInitializeLogging();
    id v9 = [NSString stringWithFormat:@"Changed listening mode %@, for device: %@", v6, v5];
    id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]_block_invoke", 748, v9];
    id v11 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
LABEL_8:
}

void __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int64_t v7 = [*(id *)(a1 + 32) objectForKey:v5];
  if (!v7)
  {
    HCHPInitializeLogging();
    int v8 = [NSString stringWithFormat:@"Removed listening mode %@, for device: %@", v6, v5];
    id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]_block_invoke", 758, v8];
    id v10 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      id v12 = v10;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v14 = [v11 UTF8String];
      _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)sendListeningModesIDSMessageIfNeeded
{
  id v3 = [(HUAccessoryHearingSyncManager *)self messageTimer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke;
  v4[3] = &unk_2640FC960;
  void v4[4] = self;
  [v3 afterDelay:v4 processBlock:0.5];
}

void __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[HUAccessoryManager sharedInstance];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2;
  v3[3] = &unk_2640FDB50;
  v3[4] = *(void *)(a1 + 32);
  [v2 getAvailableAddressesSupportingCharacteristic:0 withCompletion:v3];
}

void __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEBUG)) {
    __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2_cold_1(a1, v4);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 deviceListeningState];
  [v5 _sendIDSMessageIfNeededForListeningModes:v6 addresses:v3 force:0];
}

- (void)sendIDSMessageIfNeededForNewListeningModes:(id)a3 addresses:(id)a4 force:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HUAccessoryHearingSyncManager *)self messageTimer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __92__HUAccessoryHearingSyncManager_sendIDSMessageIfNeededForNewListeningModes_addresses_force___block_invoke;
  v13[3] = &unk_2640FE510;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [v10 afterDelay:v13 processBlock:0.5];
}

uint64_t __92__HUAccessoryHearingSyncManager_sendIDSMessageIfNeededForNewListeningModes_addresses_force___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendIDSMessageIfNeededForListeningModes:*(void *)(a1 + 40) addresses:*(void *)(a1 + 48) force:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_sendIDSMessageIfNeededForListeningModes:(id)a3 addresses:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  v30[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  if ([(HUAccessoryHearingSyncManager *)self shouldUpdateWatchesWithListeningModes:a3])
  {
    id v9 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v29 = @"HUListenModeKey";
    id v10 = [(HUAccessoryHearingSyncManager *)self persistentDeviceListeningState];
    v30[0] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v12 = [v9 dictionaryWithDictionary:v11];

    char v13 = +[HUAccessoryHearingSettings sharedInstance];
    id v14 = [v13 activeHearingProtectionEnabled];

    id v15 = [(HUAccessoryHearingSyncManager *)self deviceTypesForAvailableAddresses:v8];
    if ([v14 count]) {
      [v12 setObject:v14 forKey:@"HUAHPEnabledKey"];
    }
    if ([v15 count]) {
      [v12 setObject:v15 forKey:@"HUDeviceTypeKey"];
    }
    HCHPInitializeLogging();
    if (v5)
    {
      BOOL v16 = [NSString stringWithFormat:@"Sending to all Accessory state message: %@", v12];
      BOOL v17 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _sendIDSMessageIfNeededForListeningModes:addresses:force:]", 823, v16];
      uint64_t v18 = (void *)*MEMORY[0x263F47298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v17;
        unsigned int v20 = v18;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v28 = [v19 UTF8String];
        _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      uint64_t v21 = +[HUNearbyController sharedInstance];
      [v21 sendMessage:v12 toDevicesWithDomain:@"com.apple.hearing.accessory" excludingState:&unk_26C1E5780 withPriority:1];
    }
    else
    {
      uint64_t v22 = [NSString stringWithFormat:@"Sending to Watches Accessory state message: %@", v12];
      uint64_t v23 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager _sendIDSMessageIfNeededForListeningModes:addresses:force:]", 828, v22];
      uint64_t v24 = (void *)*MEMORY[0x263F47298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v23;
        id v26 = v24;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v28 = [v25 UTF8String];
        _os_log_impl(&dword_20CC86000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      uint64_t v21 = +[HUNearbyController sharedInstance];
      [v21 sendMessage:v12 toWatchDevicesWithDomain:@"com.apple.hearing.accessory" excludingState:&unk_26C1E5780 withPriority:1];
    }
  }
}

- (void)processNoiseMeasurementsDisabledMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = NSString;
  id v7 = a3;
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"%llu", 0x800000);
  id v9 = [v7 objectForKey:v8];

  if (v9)
  {
    HCHPInitializeLogging();
    id v10 = [NSString stringWithFormat:@"IDS received Noise Disabled: %@ from device: %@", v9, v5];
    id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager processNoiseMeasurementsDisabledMessage:fromDevice:]", 843, v10];
    id v12 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      id v14 = v12;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v16 = [v13 UTF8String];
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [v5 setState:v9 forDomain:@"com.apple.hearing.accessory"];
  }
}

- (BOOL)hasPairedDevicesWithListeningModes
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFEF30] devicesWithDiscoveryFlags:0x80000800000 error:0];
  id v3 = (os_log_t *)MEMORY[0x263F47298];
  id v4 = *MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEBUG)) {
    [(HUAccessoryHearingSyncManager *)(uint64_t)v2 hasPairedDevicesWithListeningModes];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v10 deviceFlags] & 0x4000000) != 0 || (objc_msgSend(v10, "deviceFlags") & 0x8000000) != 0)
        {
          HCHPInitializeLogging();
          id v12 = [NSString stringWithFormat:@"Has paired devices with listening modes"];
          uint64_t v17 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager hasPairedDevicesWithListeningModes]", 868, v12];
          uint64_t v18 = *v3;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = v17;
            unsigned int v20 = v18;
            uint64_t v21 = [v19 UTF8String];
            *(_DWORD *)long long buf = 136446210;
            uint64_t v28 = v21;
            _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          BOOL v16 = 1;
          id v11 = v5;
          goto LABEL_18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  HCHPInitializeLogging();
  id v11 = [NSString stringWithFormat:@"No paired devices with listening modes"];
  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSyncManager hasPairedDevicesWithListeningModes]", 872, v11];
  os_log_t v13 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v12;
    id v14 = v13;
    uint64_t v15 = [v12 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v28 = v15;
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

- (BOOL)isHeadphoneStreamSelected
{
  return self->_isHeadphoneStreamSelected;
}

- (void)setIsHeadphoneStreamSelected:(BOOL)a3
{
  self->_isHeadphoneStreamSelected = a3;
}

- (BOOL)noiseDisabled
{
  return self->_noiseDisabled;
}

- (void)setNoiseDisabled:(BOOL)a3
{
  self->_noiseDisabled = a3;
}

- (AXDispatchTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesListeningState, 0);
  objc_storeStrong((id *)&self->_persistentDeviceListeningState, 0);
  objc_storeStrong((id *)&self->_deviceListeningState, 0);

  objc_storeStrong((id *)&self->_cachedEnabled, 0);
}

- (void)shouldUpdateWatchesWithListeningModes:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_20CC86000, log, OS_LOG_TYPE_DEBUG, "Updated listening modes for Watch: %@", buf, 0xCu);
}

void __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceListeningState];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEBUG, "Routes and isHeadphoneStreamSelected are updated, deviceListeningState: %@", (uint8_t *)&v5, 0xCu);
}

- (void)hasPairedDevicesWithListeningModes
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20CC86000, a2, OS_LOG_TYPE_DEBUG, "AccessoryManager pairedDevices: %@", (uint8_t *)&v2, 0xCu);
}

@end
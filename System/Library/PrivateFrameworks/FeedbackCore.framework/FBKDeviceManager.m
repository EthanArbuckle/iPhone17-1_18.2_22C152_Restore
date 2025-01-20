@interface FBKDeviceManager
+ (id)sharedInstance;
+ (id)supportedPlatforms;
- (BOOL)canStopScan;
- (BOOL)hasAnyConfiguredDevicesMatchingPlatform:(id)a3;
- (BOOL)hasScannedAtLeastOnce;
- (BOOL)hidesNotConfiguredDevices;
- (BOOL)isScanning;
- (FBKDeviceManager)init;
- (NSArray)_notConfiguredDevicesCache;
- (NSMutableArray)postScanTaskQueue;
- (NSMutableDictionary)_notConfiguredDevicesMatchingPlatformCache;
- (NSMutableDictionary)beginPairingBlocks;
- (NSMutableDictionary)devicePinAttemptCount;
- (NSMutableDictionary)tryPinBlocks;
- (id)_allDevicesFromDEDDevices:(id)a3;
- (id)_availableDevicesWithUserVisiblePlatforms:(id)a3;
- (id)_configuredDevicesWithAvailableDevices:(id)a3;
- (id)_preferredTargetDevicesForFollowup:(id)a3 withConfiguredDevices:(id)a4;
- (id)allDevices;
- (id)availableDevices;
- (id)configuredDevices;
- (id)ded;
- (id)dedDevicesSortDescriptors;
- (id)devicesFromDefaults;
- (id)devicesMatchingPlatform:(id)a3 withDevices:(id)a4;
- (id)groupedDeviceForDEDDevice:(id)a3;
- (id)groupedDeviceWithIdentifier:(id)a3;
- (id)groupedDevicesSortDescriptors;
- (id)notConfiguredDevices;
- (id)notConfiguredDevicesMatchingPlatform:(id)a3;
- (id)preferredTargetDevicesForFollowup:(id)a3;
- (id)thisDevice;
- (int64_t)scanRequestCount;
- (unint64_t)_pinAttemptCountForDevice:(id)a3;
- (void)_drainPostScanTaskQueue;
- (void)_failedPinChallengeForDevice:(id)a3;
- (void)_incrementPinChallengeAttemptForDevice:(id)a3;
- (void)_invalidateCaches;
- (void)_postDeviceChangeNotification;
- (void)_reportPinAttemptForDevice:(id)a3 success:(BOOL)a4;
- (void)_showPinChallengeForDevice:(id)a3;
- (void)_updateStoredDevices;
- (void)_updateStoredDevicesWithConfiguredDevices:(id)a3;
- (void)beginPairingDevice:(id)a3 showUIBlock:(id)a4;
- (void)beginScanning;
- (void)decrementScanRequest;
- (void)incrementScanRequest;
- (void)promptPINForDevice:(id)a3;
- (void)runAfterScan:(id)a3;
- (void)setBeginPairingBlocks:(id)a3;
- (void)setDevicePinAttemptCount:(id)a3;
- (void)setHasScannedAtLeastOnce:(BOOL)a3;
- (void)setHidesNotConfiguredDevices:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setPostScanTaskQueue:(id)a3;
- (void)setScanRequestCount:(int64_t)a3;
- (void)setTryPinBlocks:(id)a3;
- (void)set_notConfiguredDevicesCache:(id)a3;
- (void)set_notConfiguredDevicesMatchingPlatformCache:(id)a3;
- (void)stopScanning;
- (void)successPINForDevice:(id)a3;
- (void)tryPairingDevice:(id)a3 withPin:(id)a4 completion:(id)a5;
@end

@implementation FBKDeviceManager

- (FBKDeviceManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)FBKDeviceManager;
  v2 = [(FBKDeviceManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_scanRequestCount = 0;
    *(_WORD *)&v2->_isScanning = 0;
    v2->_hidesNotConfiguredDevices = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    tryPinBlocks = v3->_tryPinBlocks;
    v3->_tryPinBlocks = (NSMutableDictionary *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    beginPairingBlocks = v3->_beginPairingBlocks;
    v3->_beginPairingBlocks = (NSMutableDictionary *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    devicePinAttemptCount = v3->_devicePinAttemptCount;
    v3->_devicePinAttemptCount = (NSMutableDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    notConfiguredDevicesMatchingPlatformCache = v3->__notConfiguredDevicesMatchingPlatformCache;
    v3->__notConfiguredDevicesMatchingPlatformCache = (NSMutableDictionary *)v10;

    notConfiguredDevicesCache = v3->__notConfiguredDevicesCache;
    v3->__notConfiguredDevicesCache = 0;

    uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    postScanTaskQueue = v3->_postScanTaskQueue;
    v3->_postScanTaskQueue = (NSMutableArray *)v13;

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v3 selector:sel__postDeviceChangeNotification name:@"FBKDeviceStateDidChange" object:0];
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__FBKDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __34__FBKDeviceManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  id v2 = (id)[(id)sharedInstance_sharedInstance thisDevice];
  [(id)sharedInstance_sharedInstance beginScanning];
  dispatch_time_t v3 = dispatch_time(0, 20000000000);
  uint64_t v4 = MEMORY[0x263EF83A0];

  dispatch_after(v3, v4, &__block_literal_global_5);
}

uint64_t __34__FBKDeviceManager_sharedInstance__block_invoke_2()
{
  return [(id)sharedInstance_sharedInstance stopScanning];
}

- (id)preferredTargetDevicesForFollowup:(id)a3
{
  id v4 = a3;
  v5 = [(FBKDeviceManager *)self configuredDevices];
  uint64_t v6 = [(FBKDeviceManager *)self _preferredTargetDevicesForFollowup:v4 withConfiguredDevices:v5];

  return v6;
}

- (id)_preferredTargetDevicesForFollowup:(id)a3 withConfiguredDevices:(id)a4
{
  *(void *)&v40[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 targetPlatform];
  v9 = +[FBKLog ffu];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 ID];
    *(_DWORD *)buf = 67109378;
    v40[0] = [v10 intValue];
    LOWORD(v40[1]) = 2114;
    *(void *)((char *)&v40[1] + 2) = v8;
    _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "target device for FFU [%i] with target platform [%{public}@]", buf, 0x12u);
  }
  if ([v8 isEqualToString:*MEMORY[0x263F3A118]])
  {
    v11 = +[FBKLog ffu];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "target device for FFU: matched ios platform, picking current device", buf, 2u);
    }

    v12 = [(FBKDeviceManager *)self thisDevice];
    v38 = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    goto LABEL_26;
  }
  v14 = [v6 bugSessionsFromOriginalFeedback];
  v12 = v14;
  if (v14)
  {
    v15 = [v14 allObjects];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      objc_super v17 = +[FBKLog ffu];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v12 valueForKeyPath:@"identifier"];
        *(_DWORD *)buf = 138543362;
        *(void *)v40 = v18;
        _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_DEFAULT, "target device for FFU: FR has bug sessions [%{public}@]", buf, 0xCu);
      }
      v19 = [v12 valueForKeyPath:@"deviceIdentifier"];
      uint64_t v33 = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      v35 = __77__FBKDeviceManager__preferredTargetDevicesForFollowup_withConfiguredDevices___block_invoke;
      v36 = &unk_264873F20;
      id v20 = v19;
      id v37 = v20;
      uint64_t v13 = objc_msgSend(v7, "ded_selectItemsPassingTest:", &v33);
      uint64_t v21 = objc_msgSend(v13, "count", v33, v34, v35, v36);
      v22 = +[FBKLog ffu];
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          uint64_t v24 = [v13 count];
          *(_DWORD *)buf = 134217984;
          *(void *)v40 = v24;
          v25 = "Preferred target device for FFU: found [%lu] devices through session";
          v26 = v22;
          uint32_t v27 = 12;
LABEL_17:
          _os_log_impl(&dword_22A36D000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
      else if (v23)
      {
        *(_WORD *)buf = 0;
        v25 = "Preferred target device for FFU: upload task session matched no devices";
        v26 = v22;
        uint32_t v27 = 2;
        goto LABEL_17;
      }

      goto LABEL_19;
    }
  }
  uint64_t v13 = (void *)MEMORY[0x263EFFA68];
LABEL_19:
  if (![v13 count])
  {
    v28 = +[FBKLog ffu];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v40 = v8;
      _os_log_impl(&dword_22A36D000, v28, OS_LOG_TYPE_DEFAULT, "target device for FFU: looking for configured device with platform [%{public}@]", buf, 0xCu);
    }

    uint64_t v29 = [(FBKDeviceManager *)self devicesMatchingPlatform:v8 withDevices:v7];

    uint64_t v13 = (void *)v29;
  }
  v30 = +[FBKLog ffu];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v13 valueForKeyPath:@"identifier"];
    *(_DWORD *)buf = 138543362;
    *(void *)v40 = v31;
    _os_log_impl(&dword_22A36D000, v30, OS_LOG_TYPE_DEFAULT, "target device for FFU: matched devices [%{public}@]", buf, 0xCu);
  }
LABEL_26:

  return v13;
}

uint64_t __77__FBKDeviceManager__preferredTargetDevicesForFollowup_withConfiguredDevices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  dispatch_time_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)hasAnyConfiguredDevicesMatchingPlatform:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F3A100]])
  {
    uint64_t v4 = +[FBKLog appHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Given platform is unspecified", buf, 2u);
    }
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v4 = +[FBKDeviceManager sharedInstance];
    id v6 = [v4 configuredDevices];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__FBKDeviceManager_hasAnyConfiguredDevicesMatchingPlatform___block_invoke;
    v9[3] = &unk_264873F20;
    id v10 = v3;
    id v7 = objc_msgSend(v6, "ded_findWithBlock:", v9);
    BOOL v5 = v7 != 0;
  }
  return v5;
}

uint64_t __60__FBKDeviceManager_hasAnyConfiguredDevicesMatchingPlatform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 platform];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)notConfiguredDevicesMatchingPlatform:(id)a3
{
  id v4 = a3;
  if ([(FBKDeviceManager *)self hidesNotConfiguredDevices])
  {
    BOOL v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v6 = [(FBKDeviceManager *)self _notConfiguredDevicesMatchingPlatformCache];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      uint64_t v8 = [(FBKDeviceManager *)self _notConfiguredDevicesMatchingPlatformCache];
      BOOL v5 = [v8 objectForKeyedSubscript:v4];
    }
    else
    {
      v9 = [(FBKDeviceManager *)self notConfiguredDevices];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __57__FBKDeviceManager_notConfiguredDevicesMatchingPlatform___block_invoke;
      v13[3] = &unk_264873F20;
      id v10 = v4;
      id v14 = v10;
      BOOL v5 = objc_msgSend(v9, "ded_selectItemsPassingTest:", v13);

      v11 = [(FBKDeviceManager *)self _notConfiguredDevicesMatchingPlatformCache];
      [v11 setObject:v5 forKeyedSubscript:v10];
    }
  }

  return v5;
}

uint64_t __57__FBKDeviceManager_notConfiguredDevicesMatchingPlatform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 platform];
  if ([v4 length])
  {
    BOOL v5 = [v3 platform];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (id)notConfiguredDevices
{
  if ([(FBKDeviceManager *)self hidesNotConfiguredDevices])
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v4 = [(FBKDeviceManager *)self _notConfiguredDevicesCache];

    if (v4)
    {
      id v3 = [(FBKDeviceManager *)self _notConfiguredDevicesCache];
    }
    else
    {
      BOOL v5 = [(FBKDeviceManager *)self availableDevices];
      id v3 = objc_msgSend(v5, "ded_rejectItemsPassingTest:", &__block_literal_global_42);

      [(FBKDeviceManager *)self set_notConfiguredDevicesCache:v3];
    }
  }

  return v3;
}

uint64_t __40__FBKDeviceManager_notConfiguredDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFBKPaired];
}

- (id)configuredDevices
{
  id v3 = [(FBKDeviceManager *)self availableDevices];
  id v4 = [(FBKDeviceManager *)self _configuredDevicesWithAvailableDevices:v3];

  return v4;
}

- (id)_configuredDevicesWithAvailableDevices:(id)a3
{
  return (id)objc_msgSend(a3, "ded_selectItemsPassingTest:", &__block_literal_global_44);
}

uint64_t __59__FBKDeviceManager__configuredDevicesWithAvailableDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFBKPaired];
}

+ (id)supportedPlatforms
{
  if (supportedPlatforms_onceToken != -1) {
    dispatch_once(&supportedPlatforms_onceToken, &__block_literal_global_46);
  }
  id v2 = (void *)supportedPlatforms_supportedPlatforms;

  return v2;
}

uint64_t __38__FBKDeviceManager_supportedPlatforms__block_invoke()
{
  supportedPlatforms_supportedPlatforms = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F3A0F8], *MEMORY[0x263F3A0E8], *MEMORY[0x263F3A110], *MEMORY[0x263F3A0F0], *MEMORY[0x263F3A118], *MEMORY[0x263F3A108], 0);

  return MEMORY[0x270F9A758]();
}

- (id)availableDevices
{
  id v3 = [(id)objc_opt_class() supportedPlatforms];
  id v4 = [(FBKDeviceManager *)self _availableDevicesWithUserVisiblePlatforms:v3];

  return v4;
}

- (id)_availableDevicesWithUserVisiblePlatforms:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FBKDeviceManager *)self allDevices];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__FBKDeviceManager__availableDevicesWithUserVisiblePlatforms___block_invoke;
  v13[3] = &unk_264873F20;
  id v14 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "ded_selectItemsPassingTest:", v13);
  uint64_t v8 = [(FBKDeviceManager *)self groupedDevicesSortDescriptors];
  v9 = [v7 sortedArrayUsingDescriptors:v8];

  if ([v9 count])
  {
    id v10 = v9;
  }
  else
  {
    objc_msgSend(v5, "ded_selectItemsPassingTest:", &__block_literal_global_49);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

uint64_t __62__FBKDeviceManager__availableDevicesWithUserVisiblePlatforms___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 platform];
  BOOL v5 = [v3 inferredPlatform];
  if (![v3 needsPairing]
    || ![v4 isEqualToString:*MEMORY[0x263F3A100]])
  {
    int v9 = [v3 isReady];
    id v7 = v4;
    if (!v9) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v8 = [*(id *)(a1 + 32) containsObject:v7];
    goto LABEL_7;
  }
  char v6 = [v5 isEqualToString:*MEMORY[0x263F3A0F8]];
  id v7 = v5;
  if (v6) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

uint64_t __62__FBKDeviceManager__availableDevicesWithUserVisiblePlatforms___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

- (id)_allDevicesFromDEDDevices:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:20];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v12 = [v11 identifier];
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];

        if (!v13)
        {
          id v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
          v15 = [v11 identifier];
          [v5 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v16 = [v11 identifier];
        objc_super v17 = [v5 objectForKeyedSubscript:v16];
        [v17 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v18 = objc_msgSend(v5, "allValues", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v23 = [[FBKGroupedDevice alloc] initWithDevices:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        [v4 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v24;
}

- (id)allDevices
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  BOOL v5 = [(FBKDeviceManager *)self ded];
  id v6 = [v5 allKnownDevices];
  v79 = self;
  uint64_t v7 = [(FBKDeviceManager *)self dedDevicesSortDescriptors];
  uint64_t v8 = [v6 sortedArrayUsingDescriptors:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v104 objects:v117 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v105 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        if ([v13 isTemporaryDevice]) {
          id v14 = v4;
        }
        else {
          id v14 = v3;
        }
        [v14 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v104 objects:v117 count:16];
    }
    while (v10);
  }

  v82 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count") + 5);
  [v82 addObjectsFromArray:v3];
  v15 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  v86 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v3;
  uint64_t v16 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v101 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        uint64_t v21 = [v20 address];
        [v86 setObject:v20 forKeyedSubscript:v21];

        v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "remoteTransport"));
        BOOL v23 = [v15 objectForKeyedSubscript:v22];

        if (!v23)
        {
          uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
          [v15 setObject:v24 forKeyedSubscript:v22];
        }
        v25 = [v15 objectForKeyedSubscript:v22];
        long long v26 = [v20 identifier];
        [v25 setObject:v20 forKeyedSubscript:v26];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
    }
    while (v17);
  }

  long long v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v28 = v4;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v96 objects:v115 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v97 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = *(void **)(*((void *)&v96 + 1) + 8 * k);
        uint64_t v34 = [v33 address];
        [v27 setObject:v33 forKeyedSubscript:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v96 objects:v115 count:16];
    }
    while (v30);
  }
  v81 = v27;
  v78 = v28;

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v35 = [(FBKDeviceManager *)v79 devicesFromDefaults];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v92 objects:v114 count:16];
  if (v36)
  {
    uint64_t v38 = v36;
    uint64_t v39 = *(void *)v93;
    *(void *)&long long v37 = 138543874;
    long long v77 = v37;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v93 != v39) {
          objc_enumerationMutation(v35);
        }
        v41 = *(void **)(*((void *)&v92 + 1) + 8 * m);
        v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v41, "remoteTransport", v77));
        v43 = [v15 objectForKeyedSubscript:v42];
        v44 = [v41 identifier];
        v45 = [v43 objectForKeyedSubscript:v44];

        if (!v45)
        {
          v46 = [v41 address];
          v47 = [v86 objectForKeyedSubscript:v46];

          if (v47)
          {
            v48 = +[FBKLog ded];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              v49 = [v41 hashingKey];
              *(_DWORD *)buf = 138543362;
              v111 = v49;
              _os_log_impl(&dword_22A36D000, v48, OS_LOG_TYPE_INFO, "will not show temp cached device [%{public}@]", buf, 0xCu);
            }
            uint64_t v50 = [v47 remoteTransport];
            if (v50 == [v41 remoteTransport] && (objc_msgSend(v47, "isTemporaryDevice") & 1) == 0)
            {
              v51 = +[FBKLog ded];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                v52 = [v41 hashingKey];
                *(_DWORD *)buf = 138543362;
                v111 = v52;
                _os_log_impl(&dword_22A36D000, v51, OS_LOG_TYPE_DEFAULT, "removing temp device [%{public}@] from defaults", buf, 0xCu);
              }
              [v41 removeFBKPairing];
              if (([v47 isFBKPaired] & 1) == 0)
              {
                v53 = +[FBKLog ded];
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  v54 = [v41 hashingKey];
                  v55 = [v47 hashingKey];
                  *(_DWORD *)buf = 138543618;
                  v111 = v54;
                  __int16 v112 = 2114;
                  *(void *)v113 = v55;
                  _os_log_impl(&dword_22A36D000, v53, OS_LOG_TYPE_DEFAULT, "updating defaults of temp device [%{public}@] with ready device [%{public}@]", buf, 0x16u);
                }
                [v47 pairToFBK];
              }
            }
          }
          else
          {
            v56 = [v41 address];
            v57 = [v81 objectForKeyedSubscript:v56];

            if (v57)
            {
              uint64_t v58 = [v57 status];
              if (v58 != [v41 status])
              {
                v59 = +[FBKLog ded];
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  v60 = [v41 hashingKey];
                  int v80 = [v41 status];
                  int v61 = [v57 status];
                  *(_DWORD *)buf = v77;
                  v111 = v60;
                  __int16 v112 = 1024;
                  *(_DWORD *)v113 = v80;
                  *(_WORD *)&v113[4] = 1024;
                  *(_DWORD *)&v113[6] = v61;
                  _os_log_debug_impl(&dword_22A36D000, v59, OS_LOG_TYPE_DEBUG, "will update cached device [%{public}@] status %i -> %i", buf, 0x18u);
                }
                objc_msgSend(v41, "setStatus:", objc_msgSend(v57, "status"));
              }
            }
            [v82 addObject:v41];
          }
        }
      }
      uint64_t v38 = [v35 countByEnumeratingWithState:&v92 objects:v114 count:16];
    }
    while (v38);
  }

  v62 = v82;
  v63 = [(FBKDeviceManager *)v79 _allDevicesFromDEDDevices:v82];
  v64 = v78;
  if ([v78 count])
  {
    v83 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v63];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v84 = v78;
    uint64_t v65 = [v84 countByEnumeratingWithState:&v88 objects:v109 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v89;
      do
      {
        for (uint64_t n = 0; n != v66; ++n)
        {
          if (*(void *)v89 != v67) {
            objc_enumerationMutation(v84);
          }
          uint64_t v69 = *(void *)(*((void *)&v88 + 1) + 8 * n);
          v87[0] = MEMORY[0x263EF8330];
          v87[1] = 3221225472;
          v87[2] = __30__FBKDeviceManager_allDevices__block_invoke;
          v87[3] = &unk_264873F20;
          v87[4] = v69;
          v70 = objc_msgSend(v63, "ded_findWithBlock:", v87);
          v71 = v70;
          if (v70)
          {
            [v70 addDevice:v69];
          }
          else
          {
            v72 = [FBKGroupedDevice alloc];
            uint64_t v108 = v69;
            v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
            v74 = [(FBKGroupedDevice *)v72 initWithDevices:v73];

            [v83 addObject:v74];
          }
        }
        uint64_t v66 = [v84 countByEnumeratingWithState:&v88 objects:v109 count:16];
      }
      while (v66);
    }

    id v75 = [MEMORY[0x263EFF8C0] arrayWithArray:v83];

    v62 = v82;
    v64 = v78;
  }
  else
  {
    id v75 = v63;
  }

  return v75;
}

uint64_t __30__FBKDeviceManager_allDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLikeDEDDevice:*(void *)(a1 + 32)];
}

- (id)thisDevice
{
  if (thisDevice_onceToken != -1) {
    dispatch_once(&thisDevice_onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)thisDevice_device;

  return v2;
}

uint64_t __30__FBKDeviceManager_thisDevice__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  id v0 = [FBKGroupedDevice alloc];
  v1 = [MEMORY[0x263F3A140] currentDevice];
  v6[0] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v3 = [(FBKGroupedDevice *)v0 initWithDevices:v2];
  id v4 = (void *)thisDevice_device;
  thisDevice_device = v3;

  uint64_t result = [(id)thisDevice_device isFBKPaired];
  if ((result & 1) == 0) {
    return [(id)thisDevice_device pairToFBK];
  }
  return result;
}

- (id)groupedDeviceForDEDDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(FBKDeviceManager *)self availableDevices];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke;
  v18[3] = &unk_264873F20;
  id v6 = v4;
  id v19 = v6;
  uint64_t v7 = objc_msgSend(v5, "ded_findWithBlock:", v18);
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = +[FBKLog ded];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_INFO, "could not get grouped device with identifer [%{public}@]", buf, 0xCu);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_55;
    v16[3] = &unk_264873F20;
    id v11 = v6;
    id v17 = v11;
    v12 = objc_msgSend(v5, "ded_findWithBlock:", v16);
    if (v12)
    {
      id v8 = v12;
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_2;
      v14[3] = &unk_264873F20;
      id v15 = v11;
      objc_msgSend(v5, "ded_findWithBlock:", v14);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

uint64_t __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dedSharingDevice];
  id v4 = [v3 address];
  uint64_t v5 = [*(id *)(a1 + 32) address];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

uint64_t __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dedIDSDevice];
  id v4 = [v3 address];
  uint64_t v5 = [*(id *)(a1 + 32) address];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)groupedDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDeviceManager *)self availableDevices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__FBKDeviceManager_groupedDeviceWithIdentifier___block_invoke;
  v9[3] = &unk_264873F20;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "ded_findWithBlock:", v9);

  return v7;
}

uint64_t __48__FBKDeviceManager_groupedDeviceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)promptPINForDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[FBKLog ded];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FBKDeviceManager promptPINForDevice:](v5);
  }

  unint64_t v6 = [(FBKDeviceManager *)self _pinAttemptCountForDevice:v4];
  uint64_t v7 = +[FBKLog ded];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [v4 publicLogDescription];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "will call pin pairing challenge block for device [%{public}@]", (uint8_t *)&v11, 0xCu);
    }
    [(FBKDeviceManager *)self _failedPinChallengeForDevice:v4];
  }
  else
  {
    if (v8)
    {
      id v10 = [v4 publicLogDescription];
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "will show pin pairing UI for device [%{public}@]", (uint8_t *)&v11, 0xCu);
    }
    [(FBKDeviceManager *)self _showPinChallengeForDevice:v4];
  }
}

- (void)successPINForDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[FBKLog ded];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FBKDeviceManager successPINForDevice:](v5);
  }

  unint64_t v6 = [(FBKDeviceManager *)self groupedDeviceForDEDDevice:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    [(FBKGroupedDevice *)v6 pairToFBK];
    BOOL v8 = +[FBKLog ded];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(FBKGroupedDevice *)v7 description];
      *(_DWORD *)buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "did pair sharing grouped device [%{public}@]", buf, 0xCu);
    }
  }
  else
  {
    [v4 pairToFBK];
    BOOL v8 = +[FBKLog ded];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v4;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "could not find grouped device for DED device after pairing success with device [%{public}@]", buf, 0xCu);
    }
  }

  [(FBKDeviceManager *)self _reportPinAttemptForDevice:v4 success:1];
  id v10 = [(FBKDeviceManager *)self devicePinAttemptCount];
  int v11 = [v4 address];
  [v10 removeObjectForKey:v11];

  if (!v7)
  {
    v12 = [FBKGroupedDevice alloc];
    id v15 = v4;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    uint64_t v7 = [(FBKGroupedDevice *)v12 initWithDevices:v13];
  }
  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"FBKDeviceManagerDidPinPairWithDevice" object:v7];
}

- (void)_showPinChallengeForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 address];

  if (v5)
  {
    unint64_t v6 = [(FBKDeviceManager *)self beginPairingBlocks];
    uint64_t v7 = [v4 address];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
      uint64_t v9 = [(FBKDeviceManager *)self beginPairingBlocks];
      id v10 = [v4 address];
      [v9 removeObjectForKey:v10];
    }
    else
    {
      uint64_t v9 = +[FBKLog ded];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FBKDeviceManager _showPinChallengeForDevice:]();
      }
    }
  }
  else
  {
    uint64_t v8 = +[FBKLog ded];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      -[FBKDeviceManager _showPinChallengeForDevice:]();
    }
  }
}

- (void)_failedPinChallengeForDevice:(id)a3
{
  id v4 = a3;
  [(FBKDeviceManager *)self _incrementPinChallengeAttemptForDevice:v4];
  [(FBKDeviceManager *)self _reportPinAttemptForDevice:v4 success:0];
}

- (void)_reportPinAttemptForDevice:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(FBKDeviceManager *)self _postDeviceChangeNotification];
  uint64_t v7 = [(FBKDeviceManager *)self tryPinBlocks];
  uint64_t v8 = [v6 address];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v9[2](v9, v4);
    id v10 = [(FBKDeviceManager *)self tryPinBlocks];
    int v11 = [v6 address];
    [v10 removeObjectForKey:v11];
  }
  else
  {
    id v10 = +[FBKLog ded];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "tried to report pin challenge outcome but found no completion block", v12, 2u);
    }
  }
}

- (unint64_t)_pinAttemptCountForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDeviceManager *)self devicePinAttemptCount];
  id v6 = [v4 address];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [(FBKDeviceManager *)self devicePinAttemptCount];
    uint64_t v9 = [v4 address];
    id v10 = [v8 objectForKeyedSubscript:v9];
    unint64_t v11 = [v10 unsignedIntegerValue];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)_incrementPinChallengeAttemptForDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(FBKDeviceManager *)self _pinAttemptCountForDevice:v4] + 1;
  id v6 = +[FBKLog ded];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 publicLogDescription];
    int v11 = 134218242;
    unint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Attempting pin challenge number [%lu] for device [%{public}@]", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
  uint64_t v9 = [(FBKDeviceManager *)self devicePinAttemptCount];
  id v10 = [v4 address];
  [v9 setObject:v8 forKeyedSubscript:v10];
}

- (void)beginPairingDevice:(id)a3 showUIBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dedSharingDevice];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 address];
    if (v9)
    {
      id v10 = (void *)[v6 copy];
      int v11 = _Block_copy(v10);
      unint64_t v12 = [(FBKDeviceManager *)self beginPairingBlocks];
      [v12 setObject:v11 forKeyedSubscript:v9];

      __int16 v13 = [(FBKDeviceManager *)self ded];
      [v13 startPairSetupForDevice:v8];
    }
    else
    {
      __int16 v13 = +[FBKLog ded];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[FBKDeviceManager beginPairingDevice:showUIBlock:]();
      }
    }
  }
  else
  {
    uint64_t v9 = +[FBKLog ded];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FBKDeviceManager beginPairingDevice:showUIBlock:]();
    }
  }
}

- (void)tryPairingDevice:(id)a3 withPin:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 dedSharingDevice];
  int v11 = v10;
  if (v10)
  {
    unint64_t v12 = [v10 address];
    if (v12)
    {
      [(FBKDeviceManager *)self _incrementPinChallengeAttemptForDevice:v11];
      __int16 v13 = (void *)[v9 copy];
      id v14 = _Block_copy(v13);
      uint64_t v15 = [(FBKDeviceManager *)self tryPinBlocks];
      [v15 setObject:v14 forKeyedSubscript:v12];

      uint64_t v16 = [(FBKDeviceManager *)self ded];
      [v16 tryPIN:v8 forDevice:v11];
    }
    else
    {
      uint64_t v16 = +[FBKLog ded];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[FBKDeviceManager tryPairingDevice:withPin:completion:]();
      }
    }
  }
  else
  {
    unint64_t v12 = +[FBKLog ded];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FBKDeviceManager beginPairingDevice:showUIBlock:]();
    }
  }
}

- (void)beginScanning
{
  uint64_t v3 = +[FBKLog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "beginScanning", buf, 2u);
  }

  [(FBKDeviceManager *)self incrementScanRequest];
  if ([(FBKDeviceManager *)self isScanning])
  {
    id v4 = +[FBKLog ded];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "already scanning", buf, 2u);
    }
  }
  else
  {
    [(FBKDeviceManager *)self setIsScanning:1];
    unint64_t v5 = +[FBKLog ded];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "will begin scanning for devices", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__FBKDeviceManager_beginScanning__block_invoke;
    block[3] = &unk_264873FE8;
    block[4] = self;
    if (beginScanning__onceToken != -1) {
      dispatch_once(&beginScanning__onceToken, block);
    }
    id v6 = [(FBKDeviceManager *)self ded];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__FBKDeviceManager_beginScanning__block_invoke_2;
    v7[3] = &unk_264874010;
    v7[4] = self;
    [v6 discoverDevicesWithCompletion:v7];
  }
}

void __33__FBKDeviceManager_beginScanning__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ded];
  [v2 configurePairingDelegate:*(void *)(a1 + 32)];
}

void __33__FBKDeviceManager_beginScanning__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__FBKDeviceManager_beginScanning__block_invoke_3;
  block[3] = &unk_264873FE8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __33__FBKDeviceManager_beginScanning__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postDeviceChangeNotification];
}

- (void)stopScanning
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[FBKLog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "stopScanning", (uint8_t *)&v9, 2u);
  }

  [(FBKDeviceManager *)self decrementScanRequest];
  BOOL v4 = [(FBKDeviceManager *)self canStopScan];
  unint64_t v5 = +[FBKLog ded];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "will stop scanning for devices", (uint8_t *)&v9, 2u);
    }

    uint64_t v7 = [(FBKDeviceManager *)self ded];
    [v7 stopDiscovery];

    [(FBKDeviceManager *)self setIsScanning:0];
    [(FBKDeviceManager *)self setHasScannedAtLeastOnce:1];
    [(FBKDeviceManager *)self _updateStoredDevices];
    [(FBKDeviceManager *)self _drainPostScanTaskQueue];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int64_t v8 = [(FBKDeviceManager *)self scanRequestCount];
      int v9 = 134217984;
      int64_t v10 = v8;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "did not stop scan yet %ld", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)runAfterScan:(id)a3
{
  id v4 = a3;
  if ([(FBKDeviceManager *)self hasScannedAtLeastOnce])
  {
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
  else
  {
    unint64_t v5 = [(FBKDeviceManager *)self postScanTaskQueue];
    id v6 = _Block_copy(v4);
    [v5 addObject:v6];
  }
  dispatch_time_t v7 = dispatch_time(0, 0x12A05F214);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__FBKDeviceManager_runAfterScan___block_invoke;
  v9[3] = &unk_264874038;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

void __33__FBKDeviceManager_runAfterScan___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) postScanTaskQueue];
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    unint64_t v5 = +[FBKLog ded];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __33__FBKDeviceManager_runAfterScan___block_invoke_cold_1();
    }

    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 40));
    id v6 = [*(id *)(a1 + 32) postScanTaskQueue];
    dispatch_time_t v7 = _Block_copy(*(const void **)(a1 + 40));
    [v6 removeObject:v7];
  }
}

- (void)_drainPostScanTaskQueue
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(FBKDeviceManager *)self postScanTaskQueue];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    dispatch_time_t v7 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_async(v7, *(dispatch_block_t *)(*((void *)&v10 + 1) + 8 * v8++));
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  int v9 = [(FBKDeviceManager *)self postScanTaskQueue];
  [v9 removeAllObjects];
}

- (id)devicesFromDefaults
{
  return (id)[MEMORY[0x263F3A140] FBKKnownDevices];
}

- (id)ded
{
  return (id)[MEMORY[0x263F3A150] sharedInstance];
}

- (void)_postDeviceChangeNotification
{
  v7[1] = *MEMORY[0x263EF8340];
  [(FBKDeviceManager *)self _invalidateCaches];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = @"configured";
  uint64_t v4 = [(FBKDeviceManager *)self configuredDevices];
  v7[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"FBKDeviceListDidChange" object:0 userInfo:v5];
}

- (void)_updateStoredDevices
{
  id v3 = [(FBKDeviceManager *)self configuredDevices];
  [(FBKDeviceManager *)self _updateStoredDevicesWithConfiguredDevices:v3];
}

- (void)_updateStoredDevicesWithConfiguredDevices:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) updateStoredCopyIfNeeded];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_invalidateCaches
{
  [(FBKDeviceManager *)self set_notConfiguredDevicesCache:0];
  id v3 = [(FBKDeviceManager *)self _notConfiguredDevicesMatchingPlatformCache];
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [(FBKDeviceManager *)self set_notConfiguredDevicesMatchingPlatformCache:v6];
  }
}

- (BOOL)canStopScan
{
  return [(FBKDeviceManager *)self scanRequestCount] == 0;
}

- (void)incrementScanRequest
{
  int64_t v3 = [(FBKDeviceManager *)self scanRequestCount] + 1;

  [(FBKDeviceManager *)self setScanRequestCount:v3];
}

- (void)decrementScanRequest
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "imbalanced calls to stopScanning found", v1, 2u);
}

- (id)devicesMatchingPlatform:(id)a3 withDevices:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__FBKDeviceManager_devicesMatchingPlatform_withDevices___block_invoke;
  v9[3] = &unk_264874060;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a4, "ded_selectItemsPassingTest:", v9);

  return v7;
}

uint64_t __56__FBKDeviceManager_devicesMatchingPlatform_withDevices___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 platform];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)dedDevicesSortDescriptors
{
  void v6[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"isCurrentDevice" ascending:0];
  v6[0] = v2;
  int64_t v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"status" ascending:1];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)groupedDevicesSortDescriptors
{
  v8[4] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"isCurrentDevice" ascending:0];
  v8[0] = v2;
  int64_t v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"platform" ascending:1];
  v8[1] = v3;
  uint64_t v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"isReady" ascending:0];
  v8[2] = v4;
  id v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"needsPairing" ascending:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (NSMutableDictionary)_notConfiguredDevicesMatchingPlatformCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_notConfiguredDevicesMatchingPlatformCache:(id)a3
{
}

- (NSArray)_notConfiguredDevicesCache
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_notConfiguredDevicesCache:(id)a3
{
}

- (int64_t)scanRequestCount
{
  return self->_scanRequestCount;
}

- (void)setScanRequestCount:(int64_t)a3
{
  self->_scanRequestCount = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (BOOL)hasScannedAtLeastOnce
{
  return self->_hasScannedAtLeastOnce;
}

- (void)setHasScannedAtLeastOnce:(BOOL)a3
{
  self->_hasScannedAtLeastOnce = a3;
}

- (NSMutableArray)postScanTaskQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPostScanTaskQueue:(id)a3
{
}

- (NSMutableDictionary)beginPairingBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBeginPairingBlocks:(id)a3
{
}

- (NSMutableDictionary)tryPinBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTryPinBlocks:(id)a3
{
}

- (NSMutableDictionary)devicePinAttemptCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDevicePinAttemptCount:(id)a3
{
}

- (BOOL)hidesNotConfiguredDevices
{
  return self->_hidesNotConfiguredDevices;
}

- (void)setHidesNotConfiguredDevices:(BOOL)a3
{
  self->_hidesNotConfiguredDevices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePinAttemptCount, 0);
  objc_storeStrong((id *)&self->_tryPinBlocks, 0);
  objc_storeStrong((id *)&self->_beginPairingBlocks, 0);
  objc_storeStrong((id *)&self->_postScanTaskQueue, 0);
  objc_storeStrong((id *)&self->__notConfiguredDevicesCache, 0);

  objc_storeStrong((id *)&self->__notConfiguredDevicesMatchingPlatformCache, 0);
}

- (void)promptPINForDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[FBKDeviceManager promptPINForDevice:]";
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)successPINForDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[FBKDeviceManager successPINForDevice:]";
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)_showPinChallengeForDevice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "device identifier is nil, cannot show pin challenge", v2, v3, v4, v5, v6);
}

- (void)_showPinChallengeForDevice:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "no show UI for pin challenge block found, cannot proceed", v2, v3, v4, v5, v6);
}

- (void)beginPairingDevice:showUIBlock:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "cannot begin pairing with nil sharing device", v2, v3, v4, v5, v6);
}

- (void)beginPairingDevice:showUIBlock:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "device has no identifier, cannot begin pairing", v2, v3, v4, v5, v6);
}

- (void)tryPairingDevice:withPin:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "device has no identifier, cannot try pin pairing", v2, v3, v4, v5, v6);
}

void __33__FBKDeviceManager_runAfterScan___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Run After Scan timed out. Calling completion block now", v2, v3, v4, v5, v6);
}

@end
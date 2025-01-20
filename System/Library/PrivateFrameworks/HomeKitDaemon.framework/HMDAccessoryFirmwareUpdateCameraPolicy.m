@interface HMDAccessoryFirmwareUpdateCameraPolicy
+ (id)logCategory;
- (BOOL)evaluate;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)_checkStreamingStatus;
- (void)_handleStreamStatusCharacteristicChanges;
- (void)_processStreamingStatus:(id)a3;
- (void)configure;
- (void)handleAccessoryConfiguredNotification:(id)a3;
- (void)handleAccessoryUnconfiguredNotification:(id)a3;
- (void)handleCharacteristicValuesChanged:(id)a3;
- (void)handleSettingsChange:(id)a3;
- (void)monitorStreamStatus:(BOOL)a3;
- (void)registerForNotifications;
@end

@implementation HMDAccessoryFirmwareUpdateCameraPolicy

- (BOOL)evaluate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  v4 = [v3 cameraProfileSettingsManager];
  v5 = [v4 currentSettings];

  if (!v5)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v9;
      v10 = "%{public}@Invalid settings, policy status evaluated to NO";
      goto LABEL_13;
    }
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  if ([v5 currentAccessMode])
  {
    if (HMIsRecordingAllowedForCameraAccessMode())
    {
      v6 = (void *)MEMORY[0x230FBD990]();
      v7 = self;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v9;
        v10 = "%{public}@Recording enabled, policy status evaluated to NO";
LABEL_13:
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v20, 0xCu);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    if (HMIsStreamingAllowedForCameraAccessMode())
    {
      v6 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryFirmwareUpdateCameraPolicy *)self _checkStreamingStatus]);
      v16 = self;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v9;
        v10 = "%{public}@Checking streaming status, policy status temporarily set to NO";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    uint64_t v18 = HMIsMotionDetectionAllowedForCameraAccessMode();
    v6 = (void *)MEMORY[0x230FBD990](v18);
    v19 = self;
    v8 = HMFGetOSLogHandle();
    BOOL v13 = 1;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    v14 = HMFGetLogIdentifier();
    int v20 = 138543362;
    v21 = v14;
    v15 = "%{public}@Policy status evaluated to YES";
LABEL_18:
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0xCu);

    goto LABEL_15;
  }
  v6 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v13 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v20 = 138543362;
    v21 = v14;
    v15 = "%{public}@Camera access mode is OFF, policy status evaluated to YES";
    goto LABEL_18;
  }
LABEL_15:

  return v13;
}

- (void)_processStreamingStatus:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    unint64_t v8 = 0x263EFF000uLL;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v29 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(id *)(*((void *)&v30 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          BOOL v13 = [(HAPTLVBase *)[HMDStreamingStatus alloc] initWithTLVData:v12];
          v14 = v13;
          if (v13 && [(HMDStreamingStatus *)v13 streamingStatus] == 1)
          {

            uint64_t v23 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          v16 = self;
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v18 = v7;
            unint64_t v19 = v8;
            id v20 = v4;
            uint64_t v22 = v21 = self;
            *(_DWORD *)buf = 138543618;
            v35 = v22;
            __int16 v36 = 2112;
            id v37 = v10;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid value type: %@", buf, 0x16u);

            self = v21;
            id v4 = v20;
            unint64_t v8 = v19;
            uint64_t v7 = v18;
            uint64_t v6 = v29;
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v23 = 1;
LABEL_20:

  v24 = (void *)MEMORY[0x230FBD990]();
  v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    v28 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v35 = v27;
    __int16 v36 = 2112;
    id v37 = v28;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to %@", buf, 0x16u);
  }
  if (v23 != [(HMDAccessoryFirmwareUpdatePolicy *)v25 status])
  {
    [(HMDAccessoryFirmwareUpdatePolicy *)v25 setStatus:v23];
    [(HMDAccessoryFirmwareUpdatePolicy *)v25 notify:v23];
  }
}

- (void)_checkStreamingStatus
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  uint64_t v5 = [v4 findCharacteristicsByType:*MEMORY[0x263F35570] forServiceType:*MEMORY[0x263F0D660]];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = +[HMDCharacteristicRequest requestWithCharacteristic:*(void *)(*((void *)&v23 + 1) + 8 * v9)];
        [v3 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    v11 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    objc_initWeak(location, self);
    v14 = [v13 home];
    v15 = [(HMDAccessoryFirmwareUpdateCameraPolicy *)self description];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke;
    v20[3] = &unk_264A2D420;
    objc_copyWeak(&v22, location);
    id v21 = v3;
    [v14 readCharacteristicValues:v21 source:7 sourceForLogging:v15 qualityOfService:-1 withCompletionHandler:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t v19 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the stream status characteristic from any of the stream services", (uint8_t *)location, 0xCu);
    }
  }
}

void __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v33 = WeakRetained;
    uint64_t v9 = HMFGetOSLogHandle();
    id v10 = v9;
    id v32 = v6;
    if (v6)
    {
      id v30 = WeakRetained;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v45 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response for read of stream status", buf, 0xCu);
      }
      id v31 = v5;

      v35 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = *(id *)(a1 + 32);
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      id v13 = v6;
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v17, "characteristic", v30);
            id v38 = 0;
            unint64_t v19 = objc_msgSend(v13, "hmd_valueOfCharacteristic:error:", v18, &v38);
            id v20 = v38;

            if (v19)
            {
              [v35 addObject:v19];
            }
            else
            {
              id v21 = (void *)MEMORY[0x230FBD990]();
              id v22 = v33;
              long long v23 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                long long v24 = HMFGetLogIdentifier();
                long long v25 = [v17 characteristic];
                *(_DWORD *)buf = 138543618;
                v45 = v24;
                __int16 v46 = 2112;
                v47 = v25;
                _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Read failed for %@", buf, 0x16u);

                id v13 = v32;
              }
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v14);
      }

      long long v26 = [v33 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke_15;
      block[3] = &unk_264A2F820;
      block[4] = v33;
      id v37 = v35;
      id v6 = v13;
      id v27 = v35;
      dispatch_async(v26, block);

      id WeakRetained = v30;
      id v5 = v31;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        uint64_t v29 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v45 = v28;
        __int16 v46 = 2112;
        v47 = v29;
        __int16 v48 = 2112;
        id v49 = v5;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read of characteristics %@ failed with error %@", buf, 0x20u);
      }
      id v6 = 0;
    }
  }
}

uint64_t __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processStreamingStatus:*(void *)(a1 + 40)];
}

- (void)handleSettingsChange:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDAccessoryFirmwareUpdateCameraPolicy_handleSettingsChange___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __63__HMDAccessoryFirmwareUpdateCameraPolicy_handleSettingsChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Settings changed, updating policy status", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) evaluateAndNotify];
}

- (void)_handleStreamStatusCharacteristicChanges
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  id v5 = [v4 findCharacteristicsByType:*MEMORY[0x263F35570] forServiceType:*MEMORY[0x263F0D660]];

  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "value", (void)v13);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(HMDAccessoryFirmwareUpdateCameraPolicy *)self _processStreamingStatus:v6];
}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__HMDAccessoryFirmwareUpdateCameraPolicy_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__HMDAccessoryFirmwareUpdateCameraPolicy_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = objc_msgSend(v2, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  if ([v3 count])
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v17 = long long v16 = v3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      uint64_t v8 = *MEMORY[0x263F35570];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "accessory", v16);
          uint64_t v12 = [v10 accessory];
          int v13 = HMFEqualObjects();

          if (v13)
          {
            long long v14 = [v10 type];
            int v15 = [v14 isEqualToString:v8];

            if (v15) {
              [v17 addObject:v10];
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    if ([v17 count]) {
      [*(id *)(a1 + 40) _handleStreamStatusCharacteristicChanges];
    }

    id v3 = v16;
  }
}

- (void)monitorStreamStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = [v4 findCharacteristicsByType:*MEMORY[0x263F35570] forServiceType:*MEMORY[0x263F0D660]];
    [v6 enableNotification:v3 forCharacteristics:v5 message:0 clientIdentifier:@"com.apple.HomeKitDaemon.firmwareUpdateCameraPolicy"];

    id v4 = v6;
  }
}

- (void)handleAccessoryUnconfiguredNotification:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryUnconfiguredNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __82__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryUnconfiguredNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is unconfigured, disabling stream status monitoring...", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 accessory];
  [v6 removeObserver:v7 name:@"HMDAccessoryCharacteristicsChangedNotification" object:v8];

  return [*(id *)(a1 + 32) monitorStreamStatus:0];
}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __80__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is configured, enabling stream status monitoring...", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 accessory];
  [v6 addObserver:v7 selector:sel_handleCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v8];

  return [*(id *)(a1 + 32) monitorStreamStatus:1];
}

- (void)registerForNotifications
{
  id v7 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleAccessoryConfiguredNotification_ name:@"HMDAccessoryConnectedNotification" object:v7];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_handleAccessoryUnconfiguredNotification_ name:@"HMDAccessoryDisconnectedNotification" object:v7];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_handleSettingsChange_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v7];

  if ([v7 isReachable])
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_handleCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v7];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryFirmwareUpdateCameraPolicy *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
      uint64_t v8 = [(HMDAccessoryFirmwareUpdatePolicy *)v6 accessory];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)configure
{
  [(HMDAccessoryFirmwareUpdateCameraPolicy *)self registerForNotifications];
  BOOL v3 = [(HMDAccessoryFirmwareUpdateCameraPolicy *)self evaluate];
  [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:v3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_27021 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_27021, &__block_literal_global_27022);
  }
  v2 = (void *)logCategory__hmf_once_v1_27023;
  return v2;
}

void __53__HMDAccessoryFirmwareUpdateCameraPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_27023;
  logCategory__hmf_once_v1_27023 = v0;
}

@end
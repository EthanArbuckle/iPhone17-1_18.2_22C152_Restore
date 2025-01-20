@interface HMDCameraRecordingSettingsControl
+ (BOOL)isSupportedAudioCodec:(id)a3;
+ (BOOL)isSupportedH264Profile:(id)a3;
+ (BOOL)isSupportedVideoCodec:(id)a3;
+ (NSArray)audioConfigurationsByPreferenceOrder;
+ (id)audioBitRateForCodecConfiguration:(id)a3;
+ (id)audioCodecForCodecConfiguration:(id)a3;
+ (id)h264ProfileForCodecConfiguration:(id)a3;
+ (id)logCategory;
+ (id)videoCodecForCodecConfiguration:(id)a3;
- (BOOL)_shouldReconfigureForChangedCharacteristic:(id)a3;
- (BOOL)canUseCachedCharacteristicValues;
- (BOOL)isCameraConfiguredForRecording;
- (BOOL)isPrimaryResident;
- (HMDCameraRecordingGeneralConfiguration)supportedRecordingConfiguration;
- (HMDCameraRecordingSelectedConfiguration)currentSelectedConfiguration;
- (HMDCameraRecordingSettingsControl)initWithWorkQueue:(id)a3 accessory:(id)a4 recordingManagementService:(id)a5;
- (HMDCameraRecordingSettingsControl)initWithWorkQueue:(id)a3 accessory:(id)a4 recordingManagementService:(id)a5 notificationCenter:(id)a6;
- (HMDCameraRecordingSettingsControlDelegate)delegate;
- (HMDCameraRecordingSupportedAudioConfiguration)supportedAudioConfiguration;
- (HMDCameraRecordingSupportedVideoConfiguration)supportedVideoConfiguration;
- (HMDCharacteristic)recordingActiveCharacteristic;
- (HMDCharacteristic)recordingSelectedConfigurationCharacteristic;
- (HMDCharacteristic)recordingSupportedAudioConfigurationCharacteristic;
- (HMDCharacteristic)recordingSupportedGeneralConfigurationCharacteristic;
- (HMDCharacteristic)recordingSupportedVideoConfigurationCharacteristic;
- (HMDHAPAccessory)accessory;
- (HMDService)recordingService;
- (NSArray)videoConfigurationsByPreferenceOrder;
- (NSDictionary)recordingConfigurationOverrides;
- (NSMutableArray)pendingConfigureCompletionHandlers;
- (NSNotificationCenter)notificationCenter;
- (NSString)clientIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_dataValueForCharacteristicOfType:(id)a3 inResponses:(id)a4;
- (id)_generalRecordingConfigurationInResponses:(id)a3;
- (id)_isRecordingActiveValueInResponses:(id)a3;
- (id)_numberValueForCharacteristicOfType:(id)a3 inResponses:(id)a4;
- (id)_preferredAudioConfigurationOverride;
- (id)_preferredVideoConfigurationOverride;
- (id)_recordingAudioConfiguration;
- (id)_recordingGeneralConfiguration;
- (id)_recordingVideoConfiguration;
- (id)_selectedRecordingConfigurationInResponses:(id)a3;
- (id)_supportedAudioConfigurationInResponses:(id)a3;
- (id)_supportedVideoConfigurationInResponses:(id)a3;
- (id)characteristicsToMonitor;
- (id)logIdentifier;
- (void)_handleCurrentIsRecordingActive:(id)a3 selectedConfiguration:(id)a4;
- (void)_handleSupportedConfigurationCharacteristicsReadResponses:(id)a3;
- (void)_invokePendingConfigureCompletionHandlersWithError:(id)a3;
- (void)_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:(id)a3;
- (void)_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:(id)a3 error:(id)a4;
- (void)_readCameraRecordingSettings;
- (void)_readSupportedCameraRecordingConfiguration;
- (void)_setSelectedRecordingConfiguration:(id)a3;
- (void)_updateSelectedRecordingConfiguration:(id)a3;
- (void)_writeCameraRecordingSettings;
- (void)configureCameraRecordingSettings;
- (void)configureCameraRecordingSettingsWithCompletion:(id)a3;
- (void)dealloc;
- (void)enableCharacteristicNotifications;
- (void)handleAccessoryConnectedNotification:(id)a3;
- (void)handleAccessoryDisconnectedNotification:(id)a3;
- (void)handleAccessoryIsNotConfiguredError;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)handleCharacteristicsUpdatedNotification:(id)a3;
- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3;
- (void)reconfigureCameraRecordingSettingsWithReason:(id)a3;
- (void)setCanUseCachedCharacteristicValues:(BOOL)a3;
- (void)setCurrentSelectedConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecordingConfigurationOverrides:(id)a3;
- (void)setSupportedAudioConfiguration:(id)a3;
- (void)setSupportedRecordingConfiguration:(id)a3;
- (void)setSupportedVideoConfiguration:(id)a3;
- (void)start;
@end

@implementation HMDCameraRecordingSettingsControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingConfigurationOverrides, 0);
  objc_storeStrong((id *)&self->_currentSelectedConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedRecordingConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingConfigureCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_recordingService, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRecordingConfigurationOverrides:(id)a3
{
}

- (NSDictionary)recordingConfigurationOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentSelectedConfiguration:(id)a3
{
}

- (HMDCameraRecordingSelectedConfiguration)currentSelectedConfiguration
{
  return (HMDCameraRecordingSelectedConfiguration *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSupportedAudioConfiguration:(id)a3
{
}

- (HMDCameraRecordingSupportedAudioConfiguration)supportedAudioConfiguration
{
  return (HMDCameraRecordingSupportedAudioConfiguration *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSupportedVideoConfiguration:(id)a3
{
}

- (HMDCameraRecordingSupportedVideoConfiguration)supportedVideoConfiguration
{
  return (HMDCameraRecordingSupportedVideoConfiguration *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSupportedRecordingConfiguration:(id)a3
{
}

- (HMDCameraRecordingGeneralConfiguration)supportedRecordingConfiguration
{
  return (HMDCameraRecordingGeneralConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCanUseCachedCharacteristicValues:(BOOL)a3
{
  self->_canUseCachedCharacteristicValues = a3;
}

- (BOOL)canUseCachedCharacteristicValues
{
  return self->_canUseCachedCharacteristicValues;
}

- (NSMutableArray)pendingConfigureCompletionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (HMDService)recordingService
{
  return (HMDService *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraRecordingSettingsControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraRecordingSettingsControlDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMDCameraRecordingSettingsControl *)self accessory];
  v5 = [v4 name];
  v6 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  v7 = [v6 instanceID];
  v8 = [v3 stringWithFormat:@"%@/%@", v5, v7];

  return v8;
}

- (BOOL)isCameraConfiguredForRecording
{
  v2 = self;
  v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDCameraRecordingSettingsControl *)v2 currentSelectedConfiguration];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)_setSelectedRecordingConfiguration:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  v7 = [v6 findCharacteristicWithType:@"00000209-0000-1000-8000-0026BB765291"];

  v8 = [v4 tlvData];
  v9 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v7 value:v8 authorizationData:0 type:0];

  v10 = [(HMDCameraRecordingSettingsControl *)self accessory];
  v16[0] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v12 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__HMDCameraRecordingSettingsControl__setSelectedRecordingConfiguration___block_invoke;
  v14[3] = &unk_264A2CEA8;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v10 writeCharacteristicValues:v11 source:7 queue:v12 completionHandler:v14];
}

void __72__HMDCameraRecordingSettingsControl__setSelectedRecordingConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v31 = a1;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
      v11 = [v10 request];
      v12 = [v11 characteristic];
      id v13 = [v12 type];
      char v14 = [v13 isEqualToString:@"00000209-0000-1000-8000-0026BB765291"];

      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v10;

    if (!v15) {
      goto LABEL_15;
    }
    v16 = [v15 error];

    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(v31 + 32);
    v19 = HMFGetOSLogHandle();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        v22 = [v15 error];
        *(_DWORD *)buf = 138543618;
        v37 = v21;
        __int16 v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@The select configuration control reply errored out: %@", buf, 0x16u);
      }
      v23 = *(void **)(v31 + 32);
      v24 = [MEMORY[0x263F087E8] hmErrorWithCode:59];
      [v23 _invokePendingConfigureCompletionHandlersWithError:v24];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v30;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully set the selected recording configuration", buf, 0xCu);
      }
      [*(id *)(v31 + 32) _updateSelectedRecordingConfiguration:*(void *)(v31 + 40)];
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = *(id *)(v31 + 32);
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@The select configuration control reply does not contain a response", buf, 0xCu);
    }
    v29 = *(void **)(v31 + 32);
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:59];
    [v29 _invokePendingConfigureCompletionHandlersWithError:v15];
  }
}

- (void)_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ((v6 != 0) != (v7 == 0)) {
    _HMFPreconditionFailure();
  }
  uint64_t v9 = [(HMDCameraRecordingSettingsControl *)self pendingConfigureCompletionHandlers];
  v10 = (void *)[v9 copy];

  v11 = [(HMDCameraRecordingSettingsControl *)self pendingConfigureCompletionHandlers];
  [v11 removeAllObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_invokePendingConfigureCompletionHandlersWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v4);

  if (v8)
  {
    [(HMDCameraRecordingSettingsControl *)self _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:0 error:v8];
  }
  else
  {
    id v5 = (HMDCameraRecordingSettingsControl *)_HMFPreconditionFailure();
    [(HMDCameraRecordingSettingsControl *)v5 _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:v7];
  }
}

- (void)_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:(id)a3
{
  id v9 = a3;
  id v4 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v4);

  if (v9)
  {
    [(HMDCameraRecordingSettingsControl *)self _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:v9 error:0];
  }
  else
  {
    id v5 = (HMDCameraRecordingSettingsControl *)_HMFPreconditionFailure();
    [(HMDCameraRecordingSettingsControl *)v5 _numberValueForCharacteristicOfType:v7 inResponses:v8];
  }
}

- (id)_numberValueForCharacteristicOfType:(id)a3 inResponses:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v8);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
      uint64_t v15 = objc_msgSend(v14, "request", (void)v23);
      uint64_t v16 = [v15 characteristic];
      long long v17 = [v16 type];
      int v18 = [v17 isEqualToString:v6];

      if (v18)
      {
        long long v19 = [v14 value];
        objc_opt_class();
        long long v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
        id v21 = v20;

        if (v21) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    long long v19 = 0;
  }

  return v19;
}

- (id)_dataValueForCharacteristicOfType:(id)a3 inResponses:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v8);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
      uint64_t v15 = objc_msgSend(v14, "request", (void)v23);
      uint64_t v16 = [v15 characteristic];
      long long v17 = [v16 type];
      int v18 = [v17 isEqualToString:v6];

      if (v18)
      {
        long long v19 = [v14 value];
        objc_opt_class();
        long long v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
        id v21 = v20;

        if (v21) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    long long v19 = 0;
  }

  return v19;
}

- (id)_supportedVideoConfigurationInResponses:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSettingsControl *)self _dataValueForCharacteristicOfType:@"00000206-0000-1000-8000-0026BB765291" inResponses:v4];
  if (v6)
  {
    id v7 = [(HAPTLVBase *)[HMDCameraRecordingSupportedVideoConfiguration alloc] initWithTLVData:v6];
    if (v7) {
      goto LABEL_9;
    }
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Failed to parse camera recording video configuration";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Response missing supported video configuration";
      goto LABEL_7;
    }
  }

  id v7 = 0;
LABEL_9:

  return v7;
}

- (id)_supportedAudioConfigurationInResponses:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSettingsControl *)self _dataValueForCharacteristicOfType:@"00000207-0000-1000-8000-0026BB765291" inResponses:v4];
  if (v6)
  {
    id v7 = [(HAPTLVBase *)[HMDCameraRecordingSupportedAudioConfiguration alloc] initWithTLVData:v6];
    if (v7) {
      goto LABEL_9;
    }
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Failed to parse camera recording audio configuration";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Response missing supported audio configuration";
      goto LABEL_7;
    }
  }

  id v7 = 0;
LABEL_9:

  return v7;
}

- (id)_generalRecordingConfigurationInResponses:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSettingsControl *)self _dataValueForCharacteristicOfType:@"00000205-0000-1000-8000-0026BB765291" inResponses:v4];
  if (v6)
  {
    id v7 = [(HAPTLVBase *)[HMDCameraRecordingGeneralConfiguration alloc] initWithTLVData:v6];
    if (v7) {
      goto LABEL_9;
    }
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Failed to parse camera recording general configuration";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Response missing supported recording configuration";
      goto LABEL_7;
    }
  }

  id v7 = 0;
LABEL_9:

  return v7;
}

- (id)_selectedRecordingConfigurationInResponses:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSettingsControl *)self _dataValueForCharacteristicOfType:@"00000209-0000-1000-8000-0026BB765291" inResponses:v4];
  if (v6)
  {
    id v7 = [(HAPTLVBase *)[HMDCameraRecordingSelectedConfiguration alloc] initWithTLVData:v6];
    if (v7) {
      goto LABEL_9;
    }
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Failed to parse camera recording selected configuration";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Response missing selected camera recording configuration";
      goto LABEL_7;
    }
  }

  id v7 = 0;
LABEL_9:

  return v7;
}

- (id)_isRecordingActiveValueInResponses:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSettingsControl *)self _numberValueForCharacteristicOfType:*MEMORY[0x263F0BEF8] inResponses:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Response missing recording active", (uint8_t *)&v14, 0xCu);
    }
  }

  return v7;
}

- (void)_handleSupportedConfigurationCharacteristicsReadResponses:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSettingsControl *)self _isRecordingActiveValueInResponses:v4];
  if ([v6 BOOLValue])
  {
    id v7 = [(HMDCameraRecordingSettingsControl *)self _generalRecordingConfigurationInResponses:v4];
    [(HMDCameraRecordingSettingsControl *)self setSupportedRecordingConfiguration:v7];

    id v8 = [(HMDCameraRecordingSettingsControl *)self _supportedVideoConfigurationInResponses:v4];
    [(HMDCameraRecordingSettingsControl *)self setSupportedVideoConfiguration:v8];

    id v9 = [(HMDCameraRecordingSettingsControl *)self _supportedAudioConfigurationInResponses:v4];
    [(HMDCameraRecordingSettingsControl *)self setSupportedAudioConfiguration:v9];

    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = [(HMDCameraRecordingSettingsControl *)v11 supportedRecordingConfiguration];
      int v47 = 138543618;
      v48 = v13;
      __int16 v49 = 2112;
      v50 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating supported recording configuration to: %@", (uint8_t *)&v47, 0x16u);
    }
    int v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = v11;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      long long v19 = [(HMDCameraRecordingSettingsControl *)v16 supportedVideoConfiguration];
      int v47 = 138543618;
      v48 = v18;
      __int16 v49 = 2112;
      v50 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating supported video configuration to: %@", (uint8_t *)&v47, 0x16u);
    }
    long long v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v16;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = HMFGetLogIdentifier();
      long long v24 = [(HMDCameraRecordingSettingsControl *)v21 supportedAudioConfiguration];
      int v47 = 138543618;
      v48 = v23;
      __int16 v49 = 2112;
      v50 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating supported audio configuration to: %@", (uint8_t *)&v47, 0x16u);
    }
    long long v25 = [(HMDCameraRecordingSettingsControl *)v21 _recordingGeneralConfiguration];
    long long v26 = [(HMDCameraRecordingSettingsControl *)v21 _recordingVideoConfiguration];
    v27 = [(HMDCameraRecordingSettingsControl *)v21 _recordingAudioConfiguration];
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    v29 = v21;
    v30 = HMFGetOSLogHandle();
    uint64_t v31 = v30;
    if (v25 && v26 && v27)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v32 = HMFGetLogIdentifier();
        int v47 = 138543618;
        v48 = v32;
        __int16 v49 = 2112;
        v50 = v25;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Setting selected general configuration: %@", (uint8_t *)&v47, 0x16u);
      }
      long long v33 = (void *)MEMORY[0x230FBD990]();
      long long v34 = v29;
      long long v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = HMFGetLogIdentifier();
        int v47 = 138543618;
        v48 = v36;
        __int16 v49 = 2112;
        v50 = v26;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Setting selected video configuration: %@", (uint8_t *)&v47, 0x16u);
      }
      v37 = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v34;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        int v47 = 138543618;
        v48 = v40;
        __int16 v49 = 2112;
        v50 = v27;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Setting selected audio configuration: %@", (uint8_t *)&v47, 0x16u);
      }
      uint64_t v41 = [[HMDCameraRecordingSelectedConfiguration alloc] initWithGeneralConfiguration:v25 videoCodecConfiguration:v26 audioCodecConfiguration:v27];
      [(HMDCameraRecordingSettingsControl *)v38 _setSelectedRecordingConfiguration:v41];
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v46 = HMFGetLogIdentifier();
        int v47 = 138543362;
        v48 = v46;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Skipping selected configuration write because of invalid selected config", (uint8_t *)&v47, 0xCu);
      }
      uint64_t v41 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      [(HMDCameraRecordingSettingsControl *)v29 _invokePendingConfigureCompletionHandlersWithError:v41];
    }
  }
  else
  {
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      int v47 = 138543618;
      v48 = v45;
      __int16 v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Recording active is disabled: %@", (uint8_t *)&v47, 0x16u);
    }
    [(HMDCameraRecordingSettingsControl *)v43 setCurrentSelectedConfiguration:0];
    long long v25 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [(HMDCameraRecordingSettingsControl *)v43 _invokePendingConfigureCompletionHandlersWithError:v25];
  }
}

- (void)_readSupportedCameraRecordingConfiguration
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSettingsControl *)self recordingActiveCharacteristic];
  id v5 = +[HMDCharacteristicRequest requestWithCharacteristic:v4];
  v16[0] = v5;
  id v6 = [(HMDCameraRecordingSettingsControl *)self recordingSupportedGeneralConfigurationCharacteristic];
  id v7 = +[HMDCharacteristicRequest requestWithCharacteristic:v6];
  v16[1] = v7;
  id v8 = [(HMDCameraRecordingSettingsControl *)self recordingSupportedAudioConfigurationCharacteristic];
  id v9 = +[HMDCharacteristicRequest requestWithCharacteristic:v8];
  void v16[2] = v9;
  uint64_t v10 = [(HMDCameraRecordingSettingsControl *)self recordingSupportedVideoConfigurationCharacteristic];
  uint64_t v11 = +[HMDCharacteristicRequest requestWithCharacteristic:v10];
  v16[3] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];

  uint64_t v13 = [(HMDCameraRecordingSettingsControl *)self accessory];
  int v14 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__HMDCameraRecordingSettingsControl__readSupportedCameraRecordingConfiguration__block_invoke;
  v15[3] = &unk_264A28890;
  v15[4] = self;
  [v13 readCharacteristicValues:v12 source:7 queue:v14 completionHandler:v15];
}

uint64_t __79__HMDCameraRecordingSettingsControl__readSupportedCameraRecordingConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSupportedConfigurationCharacteristicsReadResponses:a2];
}

- (void)_handleCurrentIsRecordingActive:(id)a3 selectedConfiguration:(id)a4
{
  v54[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v54[0] = *MEMORY[0x263F0BEF8];
  v54[1] = @"00000205-0000-1000-8000-0026BB765291";
  v54[2] = @"00000207-0000-1000-8000-0026BB765291";
  v54[3] = @"00000206-0000-1000-8000-0026BB765291";
  v54[4] = @"00000209-0000-1000-8000-0026BB765291";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:5];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        int v14 = [(HMDCameraRecordingSettingsControl *)self recordingService];
        int v15 = [v14 findCharacteristicWithType:v13];

        if (!v15)
        {
          long long v35 = (void *)MEMORY[0x230FBD990]();
          v36 = self;
          v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            __int16 v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v50 = v38;
            __int16 v51 = 2112;
            id v52 = v13;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Recording service does not have required characteristic type: %@", buf, 0x16u);
          }
          [(HMDCameraRecordingSettingsControl *)v36 setCurrentSelectedConfiguration:0];
          v39 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
          [(HMDCameraRecordingSettingsControl *)v36 _invokePendingConfigureCompletionHandlersWithError:v39];

          goto LABEL_25;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if ([v6 BOOLValue])
  {
    uint64_t v16 = [(HMDCameraRecordingSettingsControl *)self currentSelectedConfiguration];
    uint64_t v17 = [v16 tlvData];
    int v18 = [v7 tlvData];
    char v19 = [v17 isEqualToData:v18];

    if ((v19 & 1) == 0)
    {
      long long v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = HMFGetLogIdentifier();
        long long v24 = [v7 generalConfiguration];
        *(_DWORD *)buf = 138543618;
        v50 = v23;
        __int16 v51 = 2112;
        id v52 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating selected general configuration: %@", buf, 0x16u);
      }
      long long v25 = (void *)MEMORY[0x230FBD990]();
      long long v26 = v21;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        v29 = [v7 videoConfiguration];
        *(_DWORD *)buf = 138543618;
        v50 = v28;
        __int16 v51 = 2112;
        id v52 = v29;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating selected video configuration: %@", buf, 0x16u);
      }
      v30 = (void *)MEMORY[0x230FBD990]();
      uint64_t v31 = v26;
      long long v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        long long v33 = HMFGetLogIdentifier();
        long long v34 = [v7 audioConfiguration];
        *(_DWORD *)buf = 138543618;
        v50 = v33;
        __int16 v51 = 2112;
        id v52 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating selected audio configuration: %@", buf, 0x16u);
      }
      [(HMDCameraRecordingSettingsControl *)v31 _updateSelectedRecordingConfiguration:v7];
    }
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:](self, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:", v7, (void)v45);
  }
  else
  {
    v40 = (void *)MEMORY[0x230FBD990]();
    uint64_t v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v43;
      __int16 v51 = 2112;
      id v52 = v6;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Recording active is disabled: %@", buf, 0x16u);
    }
    [(HMDCameraRecordingSettingsControl *)v41 setCurrentSelectedConfiguration:0];
    v44 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [(HMDCameraRecordingSettingsControl *)v41 _invokePendingConfigureCompletionHandlersWithError:v44];
  }
LABEL_25:
}

- (void)_readCameraRecordingSettings
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSettingsControl *)self recordingActiveCharacteristic];
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self recordingSelectedConfigurationCharacteristic];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = [v4 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    uint64_t v10 = [v6 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12) {
      uint64_t v13 = [(HAPTLVBase *)[HMDCameraRecordingSelectedConfiguration alloc] initWithTLVData:v12];
    }
    else {
      uint64_t v13 = 0;
    }
    if ([(HMDCameraRecordingSettingsControl *)self canUseCachedCharacteristicValues]
      && v9
      && v13)
    {
      [(HMDCameraRecordingSettingsControl *)self _handleCurrentIsRecordingActive:v9 selectedConfiguration:v13];
    }
    else
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = self;
      long long v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = HMFGetLogIdentifier();
        [(HMDCameraRecordingSettingsControl *)v22 canUseCachedCharacteristicValues];
        uint64_t v25 = HMFBooleanToString();
        long long v26 = (void *)v25;
        v27 = @"<nil>";
        *(_DWORD *)buf = 138544130;
        uint64_t v37 = (uint64_t)v24;
        if (v9) {
          uint64_t v28 = @"<not nil>";
        }
        else {
          uint64_t v28 = @"<nil>";
        }
        if (v13) {
          v27 = @"<not nil>";
        }
        __int16 v38 = 2112;
        uint64_t v39 = v25;
        __int16 v40 = 2112;
        uint64_t v41 = v28;
        __int16 v42 = 2112;
        v43 = v27;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Reading from accessory because can use cached characteristic values is %@, recording active characteristic value is %@, and selected configuration characteristic value is %@", buf, 0x2Au);
      }
      v29 = +[HMDCharacteristicRequest requestWithCharacteristic:v4];
      v35[0] = v29;
      v30 = +[HMDCharacteristicRequest requestWithCharacteristic:v6];
      v35[1] = v30;
      uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];

      long long v32 = [(HMDCameraRecordingSettingsControl *)v22 accessory];
      long long v33 = [(HMDCameraRecordingSettingsControl *)v22 workQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __65__HMDCameraRecordingSettingsControl__readCameraRecordingSettings__block_invoke;
      v34[3] = &unk_264A28890;
      v34[4] = v22;
      [v32 readCharacteristicValues:v31 source:7 queue:v33 completionHandler:v34];
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v18 = (void *)v17;
      char v19 = @"<nil>";
      if (v4) {
        long long v20 = @"<not nil>";
      }
      else {
        long long v20 = @"<nil>";
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v17;
      uint64_t v39 = (uint64_t)v20;
      __int16 v38 = 2112;
      if (v6) {
        char v19 = @"<not nil>";
      }
      __int16 v40 = 2112;
      uint64_t v41 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Mandatory recording active characteristic (%@) or selected configuration characteristic (%@) was not found on recording service", buf, 0x20u);
    }
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [(HMDCameraRecordingSettingsControl *)v15 _invokePendingConfigureCompletionHandlersWithError:v9];
  }
}

void __65__HMDCameraRecordingSettingsControl__readCameraRecordingSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _isRecordingActiveValueInResponses:v3];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) _selectedRecordingConfigurationInResponses:v3];
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v34 = 138543618;
        long long v35 = v10;
        __int16 v36 = 2112;
        uint64_t v37 = v4;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Read is recording active: %@", (uint8_t *)&v34, 0x16u);
      }
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        int v15 = [v5 generalConfiguration];
        int v34 = 138543618;
        long long v35 = v14;
        __int16 v36 = 2112;
        uint64_t v37 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Read selected general configuration: %@", (uint8_t *)&v34, 0x16u);
      }
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        char v19 = HMFGetLogIdentifier();
        long long v20 = [v5 videoConfiguration];
        int v34 = 138543618;
        long long v35 = v19;
        __int16 v36 = 2112;
        uint64_t v37 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Read selected video configuration: %@", (uint8_t *)&v34, 0x16u);
      }
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = *(id *)(a1 + 32);
      long long v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = HMFGetLogIdentifier();
        uint64_t v25 = [v5 audioConfiguration];
        int v34 = 138543618;
        long long v35 = v24;
        __int16 v36 = 2112;
        uint64_t v37 = v25;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Read selected audio configuration: %@", (uint8_t *)&v34, 0x16u);
      }
      [*(id *)(a1 + 32) setCanUseCachedCharacteristicValues:1];
      [*(id *)(a1 + 32) _handleCurrentIsRecordingActive:v4 selectedConfiguration:v5];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        int v34 = 138543362;
        long long v35 = v31;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read selected camera recording configuration", (uint8_t *)&v34, 0xCu);
      }
      long long v32 = *(void **)(a1 + 32);
      long long v33 = [MEMORY[0x263F087E8] hmErrorWithCode:101];
      [v32 _invokePendingConfigureCompletionHandlersWithError:v33];

      uint64_t v5 = 0;
    }
  }
  else
  {
    long long v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = *(id *)(a1 + 32);
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      int v34 = 138543362;
      long long v35 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to read is recording active", (uint8_t *)&v34, 0xCu);
    }
    v30 = *(void **)(a1 + 32);
    uint64_t v5 = [MEMORY[0x263F087E8] hmErrorWithCode:101];
    [v30 _invokePendingConfigureCompletionHandlersWithError:v5];
  }
}

- (void)_updateSelectedRecordingConfiguration:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]([(HMDCameraRecordingSettingsControl *)self setCurrentSelectedConfiguration:v4]);
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate to notify that recording settings are configured", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = [(HMDCameraRecordingSettingsControl *)v7 delegate];
  [v10 recordingSettingsControlDidConfigure:v7];

  [(HMDCameraRecordingSettingsControl *)v7 _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:v4];
}

- (void)_writeCameraRecordingSettings
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSettingsControl *)self currentSelectedConfiguration];

  if (v4)
  {
    id v9 = [(HMDCameraRecordingSettingsControl *)self currentSelectedConfiguration];
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:](self, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:");
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring camera recording settings on primary resident", buf, 0xCu);
    }
    [(HMDCameraRecordingSettingsControl *)v6 _readSupportedCameraRecordingConfiguration];
  }
}

- (BOOL)_shouldReconfigureForChangedCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self recordingActiveCharacteristic];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else if ([(HMDCameraRecordingSettingsControl *)self isPrimaryResident])
  {
    char v7 = 0;
  }
  else
  {
    id v8 = [(HMDCameraRecordingSettingsControl *)self recordingSelectedConfigurationCharacteristic];
    char v7 = [v4 isEqual:v8];
  }
  return v7;
}

- (void)handleAccessoryIsNotConfiguredError
{
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDCameraRecordingSettingsControl *)self reconfigureCameraRecordingSettingsWithReason:@"Handling accessory is not configured error"];
}

- (void)reconfigureCameraRecordingSettingsWithReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543618;
    int v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Reconfiguring camera recording settings: %@", (uint8_t *)&v10, 0x16u);
  }
  [(HMDCameraRecordingSettingsControl *)v7 setCurrentSelectedConfiguration:0];
  [(HMDCameraRecordingSettingsControl *)v7 configureCameraRecordingSettings];
}

- (void)configureCameraRecordingSettingsWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(HMDCameraRecordingSettingsControl *)self pendingConfigureCompletionHandlers];
  char v7 = _Block_copy(v4);
  [v6 addObject:v7];

  id v8 = [(HMDCameraRecordingSettingsControl *)self pendingConfigureCompletionHandlers];
  unint64_t v9 = [v8 count];

  if (v9 < 2)
  {
    if ([(HMDCameraRecordingSettingsControl *)self isPrimaryResident]) {
      [(HMDCameraRecordingSettingsControl *)self _writeCameraRecordingSettings];
    }
    else {
      [(HMDCameraRecordingSettingsControl *)self _readCameraRecordingSettings];
    }
  }
  else
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Deferring new configure request to be invoked when in-progress configure finishes", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)configureCameraRecordingSettings
{
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDCameraRecordingSettingsControl *)self configureCameraRecordingSettingsWithCompletion:&__block_literal_global_184875];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    clientIdentifier = v4->_clientIdentifier;
    *(_DWORD *)buf = 138543618;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    int v14 = clientIdentifier;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating recording settings control and disabling characteristic notifications with client identifier: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_accessory);
  unint64_t v9 = [(HMDCameraRecordingSettingsControl *)v4 characteristicsToMonitor];
  [WeakRetained enableNotification:0 forCharacteristics:v9 message:0 clientIdentifier:v4->_clientIdentifier];

  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraRecordingSettingsControl;
  [(HMDCameraRecordingSettingsControl *)&v10 dealloc];
}

- (void)enableCharacteristicNotifications
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  uint64_t v5 = self;
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    id v8 = [(HMDCameraRecordingSettingsControl *)v5 characteristicsToMonitor];
    int v12 = 138543618;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for characteristics: %@", (uint8_t *)&v12, 0x16u);
  }
  unint64_t v9 = [(HMDCameraRecordingSettingsControl *)v5 accessory];
  objc_super v10 = [(HMDCameraRecordingSettingsControl *)v5 characteristicsToMonitor];
  int v11 = [(HMDCameraRecordingSettingsControl *)v5 clientIdentifier];
  [v9 enableNotification:1 forCharacteristics:v10 message:0 clientIdentifier:v11];
}

- (id)_recordingAudioConfiguration
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDCameraRecordingSettingsControl *)self _preferredAudioConfigurationOverride];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  char v6 = v5;
  if (v4) {
    [v5 addObject:v4];
  }
  v60 = (void *)v4;
  p_vtable = HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID.vtable;
  id v8 = +[HMDCameraRecordingSettingsControl audioConfigurationsByPreferenceOrder];
  [v6 addObjectsFromArray:v8];

  unint64_t v9 = (void *)MEMORY[0x230FBD990]();
  objc_super v10 = self;
  int v11 = HMFGetOSLogHandle();
  v59 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v87 = v12;
    __int16 v88 = 2112;
    v89 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred audio parameters: %@", buf, 0x16u);

    objc_super v10 = v59;
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  __int16 v13 = [(HMDCameraRecordingSettingsControl *)v10 supportedAudioConfiguration];
  __int16 v14 = [v13 codecConfigurations];

  id obj = v14;
  uint64_t v63 = [v14 countByEnumeratingWithState:&v77 objects:v85 count:16];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (v63)
  {
    uint64_t v64 = *(void *)v78;
    do
    {
      uint64_t v17 = 0;
      do
      {
        int v18 = v16;
        if (*(void *)v78 != v64) {
          objc_enumerationMutation(obj);
        }
        char v19 = *(void **)(*((void *)&v77 + 1) + 8 * v17);
        uint64_t v16 = [p_vtable + 237 audioCodecForCodecConfiguration:v19];

        uint64_t v66 = v17;
        if (v16)
        {
          uint64_t v20 = [p_vtable + 237 audioBitRateForCodecConfiguration:v19];

          if (v20)
          {
            v61 = (void *)v20;
            v62 = v16;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            v58 = v19;
            id v21 = [v19 parameters];
            id v22 = [v21 audioSampleRates];

            id v67 = v22;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v73 objects:v84 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v68 = *(void *)v74;
              while (2)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v74 != v68) {
                    objc_enumerationMutation(v67);
                  }
                  long long v26 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v71 = 0u;
                  long long v72 = 0u;
                  id v27 = v6;
                  id v28 = v6;
                  uint64_t v29 = [v28 countByEnumeratingWithState:&v69 objects:v83 count:16];
                  if (v29)
                  {
                    uint64_t v30 = v29;
                    uint64_t v31 = *(void *)v70;
LABEL_19:
                    uint64_t v32 = 0;
                    while (1)
                    {
                      if (*(void *)v70 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      long long v33 = *(void **)(*((void *)&v69 + 1) + 8 * v32);
                      uint64_t v34 = [v33 sampleRate];
                      if ([v26 type] == v34) {
                        break;
                      }
                      if (v30 == ++v32)
                      {
                        uint64_t v30 = [v28 countByEnumeratingWithState:&v69 objects:v83 count:16];
                        if (v30) {
                          goto LABEL_19;
                        }
                        goto LABEL_25;
                      }
                    }
                    id v35 = v33;

                    if (!v35) {
                      goto LABEL_27;
                    }

                    __int16 v51 = -[HMDCameraRecordingAudioSampleRate initWithSampleRate:]([HMDCameraRecordingAudioSampleRate alloc], "initWithSampleRate:", [v35 sampleRate]);
                    id v52 = [HMDCameraRecordingAudioCodecParameters alloc];
                    uint64_t v15 = v61;
                    v82 = v61;
                    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
                    v81 = v51;
                    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
                    v55 = [v35 bitRate];
                    v56 = [(HMDCameraRecordingAudioCodecParameters *)v52 initWithChannelCount:&unk_26E472808 bitRateModes:v53 audioSampleRates:v54 maxAudioBitRate:v55];

                    uint64_t v16 = v62;
                    v50 = [[HMDCameraRecordingAudioCodecConfiguration alloc] initWithAudioCodec:v62 codecParameters:v56];

                    char v6 = v27;
                    goto LABEL_44;
                  }
LABEL_25:

LABEL_27:
                  char v6 = v27;
                }
                uint64_t v24 = [v67 countByEnumeratingWithState:&v73 objects:v84 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            __int16 v36 = (void *)MEMORY[0x230FBD990]();
            objc_super v10 = v59;
            uint64_t v37 = v59;
            uint64_t v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              uint64_t v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v87 = v39;
              __int16 v88 = 2112;
              v89 = v58;
              _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping audio codec configuration %@ preferred audio configuration is not supported", buf, 0x16u);
            }
            uint64_t v15 = v61;
            uint64_t v16 = v62;
            p_vtable = (void **)(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID + 24);
          }
          else
          {
            v43 = v19;
            __int16 v36 = (void *)MEMORY[0x230FBD990]();
            uint64_t v44 = v10;
            uint64_t v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              long long v45 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v87 = v45;
              __int16 v88 = 2112;
              v89 = v43;
              _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping audio codec configuration %@ bit rate mode is not supported", buf, 0x16u);
            }
            uint64_t v15 = 0;
          }
        }
        else
        {
          __int16 v40 = v19;
          __int16 v36 = (void *)MEMORY[0x230FBD990]();
          uint64_t v41 = v10;
          uint64_t v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            __int16 v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v87 = v42;
            __int16 v88 = 2112;
            v89 = v40;
            _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping audio codec configuration %@ codec type is not supported", buf, 0x16u);
          }
        }

        uint64_t v17 = v66 + 1;
      }
      while (v66 + 1 != v63);
      uint64_t v63 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
    }
    while (v63);
  }

  long long v46 = (void *)MEMORY[0x230FBD990]();
  long long v47 = v10;
  long long v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    __int16 v49 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v87 = v49;
    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to select audio configuration", buf, 0xCu);
  }
  v50 = 0;
LABEL_44:

  return v50;
}

- (HMDCharacteristic)recordingSelectedConfigurationCharacteristic
{
  v2 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  id v3 = [v2 findCharacteristicWithType:@"00000209-0000-1000-8000-0026BB765291"];

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSupportedVideoConfigurationCharacteristic
{
  v2 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  id v3 = [v2 findCharacteristicWithType:@"00000206-0000-1000-8000-0026BB765291"];

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSupportedAudioConfigurationCharacteristic
{
  v2 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  id v3 = [v2 findCharacteristicWithType:@"00000207-0000-1000-8000-0026BB765291"];

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSupportedGeneralConfigurationCharacteristic
{
  v2 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  id v3 = [v2 findCharacteristicWithType:@"00000205-0000-1000-8000-0026BB765291"];

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingActiveCharacteristic
{
  v2 = [(HMDCameraRecordingSettingsControl *)self recordingService];
  id v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0BEF8]];

  return (HMDCharacteristic *)v3;
}

- (BOOL)isPrimaryResident
{
  v2 = [(HMDCameraRecordingSettingsControl *)self accessory];
  id v3 = [v2 home];
  char v4 = [v3 isCurrentDeviceConfirmedPrimaryResident];

  return v4;
}

- (id)characteristicsToMonitor
{
  id v3 = [MEMORY[0x263EFF980] array];
  char v4 = [(HMDCameraRecordingSettingsControl *)self recordingActiveCharacteristic];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self recordingSelectedConfigurationCharacteristic];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  char v6 = (void *)[v3 copy];
  return v6;
}

- (id)_recordingVideoConfiguration
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v44 = [(HMDCameraRecordingSettingsControl *)self _preferredVideoConfigurationOverride];
  long long v45 = [MEMORY[0x263EFF980] array];
  if (v44) {
    objc_msgSend(v45, "addObject:");
  }
  char v4 = [(HMDCameraRecordingSettingsControl *)self videoConfigurationsByPreferenceOrder];
  [v45 addObjectsFromArray:v4];

  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  long long v48 = self;
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v45;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Video parameters in order of preference: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v64 = __Block_byref_object_copy__184894;
  v65 = __Block_byref_object_dispose__184895;
  id v66 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = [(HMDCameraRecordingSettingsControl *)v48 supportedVideoConfiguration];
  id obj = [v8 codecConfigurations];

  uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v9)
  {
    objc_super v10 = 0;
    int v11 = 0;
    uint64_t v12 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        __int16 v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v15 = +[HMDCameraRecordingSettingsControl videoCodecForCodecConfiguration:v14];

        objc_super v10 = (void *)v15;
        if (v15)
        {
          uint64_t v16 = +[HMDCameraRecordingSettingsControl h264ProfileForCodecConfiguration:v14];

          if (v16)
          {
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke;
            v50[3] = &unk_264A24668;
            v50[4] = v14;
            v50[5] = buf;
            uint64_t v17 = objc_msgSend(v45, "na_firstObjectPassingTest:", v50);
            if (v17)
            {

              long long v26 = [HMDCameraRecordingVideoAttributes alloc];
              uint64_t v27 = [v17 resolution];
              obja = [(HMDCameraRecordingVideoAttributes *)v26 initWithResolution:v27 frameRate:*(void *)(*(void *)&buf[8] + 40)];
              __int16 v49 = -[HMDCameraRecordingH264Level initWithH264Level:]([HMDCameraRecordingH264Level alloc], "initWithH264Level:", [v17 h264Level]);
              id v28 = [HMDCameraRecordingVideoCodecParameters alloc];
              uint64_t v57 = v16;
              uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
              v56 = v49;
              uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
              uint64_t v31 = [v17 bitRateByFrameRate];
              uint64_t v32 = [v31 objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
              long long v33 = [v17 keyFrameInterval];
              uint64_t v34 = [(HMDCameraRecordingVideoCodecParameters *)v28 initWithProfiles:v29 levels:v30 bitRate:v32 iFrameInterval:v33];

              id v35 = [HMDCameraRecordingVideoCodecConfiguration alloc];
              v55 = obja;
              __int16 v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
              uint64_t v37 = [(HMDCameraRecordingVideoCodecConfiguration *)v35 initWithCodec:v10 codecParameters:v34 videoAttributes:v36];

              int v11 = (void *)v16;
              goto LABEL_28;
            }
            int v11 = (void *)v16;
          }
          else
          {
            id v22 = (void *)MEMORY[0x230FBD990]();
            uint64_t v23 = v48;
            HMFGetOSLogHandle();
            uint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              uint64_t v25 = HMFGetLogIdentifier();
              *(_DWORD *)v58 = 138543618;
              id v59 = v25;
              __int16 v60 = 2112;
              v61 = v14;
              _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping video codec configuration %@, H264 profile is not supported", v58, 0x16u);
            }
            int v11 = 0;
          }
        }
        else
        {
          int v18 = (void *)MEMORY[0x230FBD990]();
          char v19 = v48;
          HMFGetOSLogHandle();
          uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = HMFGetLogIdentifier();
            *(_DWORD *)v58 = 138543618;
            id v59 = v21;
            __int16 v60 = 2112;
            v61 = v14;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping video codec configuration %@, codec type is not supported", v58, 0x16u);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v11 = 0;
    objc_super v10 = 0;
  }

  uint64_t v38 = (void *)MEMORY[0x230FBD990]();
  uint64_t v39 = v48;
  HMFGetOSLogHandle();
  __int16 v40 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v42 = [(HMDCameraRecordingSettingsControl *)v39 supportedVideoConfiguration];
    *(_DWORD *)v58 = 138543618;
    id v59 = v41;
    __int16 v60 = 2112;
    v61 = v42;
    _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to select video configuration from supported video configuration: %@", v58, 0x16u);
  }
  uint64_t v17 = 0;
  uint64_t v37 = 0;
LABEL_28:
  _Block_object_dispose(buf, 8);

  return v37;
}

uint64_t __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) parameters];
  uint64_t v5 = [v4 levels];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_2;
  v15[3] = &unk_264A245F0;
  id v6 = v3;
  id v16 = v6;
  int v7 = objc_msgSend(v5, "na_any:", v15);

  id v8 = [*(id *)(a1 + 32) videoAttributes];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_3;
  v12[3] = &unk_264A24640;
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v9;
  id v10 = v6;
  LODWORD(v6) = objc_msgSend(v8, "na_any:", v12);

  return v7 & v6;
}

BOOL __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 h264Level];
  uint64_t v5 = [v3 h264Level];

  return v4 == v5;
}

uint64_t __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) resolution];
  if (v4 == [v3 resolution])
  {
    uint64_t v5 = [*(id *)(a1 + 32) bitRateByFrameRate];
    id v6 = [v5 allKeys];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_4;
    v11[3] = &unk_264A24618;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 40);
    id v12 = v7;
    uint64_t v13 = v8;
    uint64_t v9 = objc_msgSend(v6, "na_any:", v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) frameRate];
  uint64_t v6 = [v5 isEqualToNumber:v4];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v6;
}

- (id)_preferredAudioConfigurationOverride
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", @"audioBitRate");

  uint64_t v6 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  id v7 = objc_msgSend(v6, "hmf_numberForKey:", @"audioSampleRate");

  uint64_t v8 = 0;
  if (v5 && v7)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Overriden audio configuration", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v10;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v5;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Bit rate: %@kbps", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = v14;
    char v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Sample rate: %@kHz", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v8 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", [v7 integerValue], v5);
  }

  return v8;
}

- (id)_preferredVideoConfigurationOverride
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", @"keyFrameInterval");

  uint64_t v6 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  id v7 = objc_msgSend(v6, "hmf_numberForKey:", @"frameRate");

  uint64_t v8 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  uint64_t v9 = objc_msgSend(v8, "hmf_numberForKey:", @"imageWidth");

  id v10 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  int v11 = objc_msgSend(v10, "hmf_numberForKey:", @"imageHeight");

  id v12 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  uint64_t v13 = objc_msgSend(v12, "hmf_numberForKey:", @"videoBitrate");

  uint64_t v14 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  uint64_t v15 = objc_msgSend(v14, "hmf_numberForKey:", @"h264Level");

  id v16 = 0;
  if (v5 && v7 && v9 && v11 && v13 && v15)
  {
    long long v51 = v5;
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    char v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v55 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Overriden video configuration", buf, 0xCu);
    }
    id v21 = (void *)MEMORY[0x230FBD990]();
    int v22 = v18;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v24;
      __int16 v56 = 2112;
      uint64_t v57 = v7;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Frame rate: %@fps", buf, 0x16u);
    }
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = v22;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v28;
      __int16 v56 = 2112;
      uint64_t v57 = v51;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Key frame interval: %@ms", buf, 0x16u);
    }
    uint64_t v29 = (void *)MEMORY[0x230FBD990]();
    uint64_t v30 = v26;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v32;
      __int16 v56 = 2112;
      uint64_t v57 = v9;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Image width: %@px", buf, 0x16u);
    }
    long long v33 = (void *)MEMORY[0x230FBD990]();
    uint64_t v34 = v30;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      __int16 v56 = 2112;
      uint64_t v57 = v11;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Image height: %@px", buf, 0x16u);
    }
    uint64_t v37 = (void *)MEMORY[0x230FBD990]();
    uint64_t v38 = v34;
    uint64_t v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v40;
      __int16 v56 = 2112;
      uint64_t v57 = v13;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Video bit rate: %@kbps", buf, 0x16u);
    }
    id v41 = (void *)MEMORY[0x230FBD990]();
    __int16 v42 = v38;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = HMFGetLogIdentifier();
      long long v45 = HMDCameraRecordingH264LevelTypeAsString([v15 integerValue]);
      *(_DWORD *)buf = 138543618;
      v55 = v44;
      __int16 v56 = 2112;
      uint64_t v57 = v45;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@H264 Level is: %@", buf, 0x16u);
    }
    long long v46 = [[HMDCameraRecordingVideoAttributes alloc] initWithImageWidth:v9 imageHeight:v11 frameRate:v7];
    long long v47 = [HMDCameraRecordingPreferredVideoConfiguration alloc];
    uint64_t v48 = [(HMDCameraRecordingVideoAttributes *)v46 resolution];
    long long v52 = v7;
    long long v53 = v13;
    __int16 v49 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v5 = v51;
    id v16 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:](v47, "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", v48, v49, v51, [v15 integerValue]);
  }
  return v16;
}

- (id)_recordingGeneralConfiguration
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingSettingsControl *)self recordingConfigurationOverrides];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", @"prebufferLength");

  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = &unk_26E4727F0;
  }
  id v7 = v6;
  uint64_t v8 = [(HMDCameraRecordingSettingsControl *)self supportedRecordingConfiguration];
  uint64_t v9 = [v8 prebufferLength];

  if (!v9)
  {
    long long v46 = (void *)MEMORY[0x230FBD990]();
    long long v47 = self;
    uint64_t v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      __int16 v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v78 = v49;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Supported prebuffer length is nil", buf, 0xCu);
    }
    v50 = 0;
    goto LABEL_40;
  }
  if ([v7 compare:v9] == 1) {
    id v10 = v9;
  }
  else {
    id v10 = v7;
  }
  id v11 = v10;
  id v12 = (void *)MEMORY[0x230FBD990]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    long long v78 = v15;
    __int16 v79 = 2112;
    id v80 = v11;
    __int16 v81 = 2112;
    id v82 = v7;
    __int16 v83 = 2112;
    v84 = v9;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Selecting prebuffer length of %@ because preferred length is %@ and supported length is %@", buf, 0x2Au);
  }
  id v65 = v11;
  id v66 = v9;
  id v67 = v7;
  uint64_t v68 = v5;

  id v16 = [(HMDCameraRecordingSettingsControl *)v13 supportedRecordingConfiguration];
  uint64_t v17 = [v16 eventTriggerOptions];

  int v18 = (void *)MEMORY[0x230FBD990]();
  char v19 = v13;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = HMFGetLogIdentifier();
    int v22 = HMDCameraRecordingEventTriggerOptionsAsString(v17);
    *(_DWORD *)buf = 138543618;
    long long v78 = v21;
    __int16 v79 = 2112;
    id v80 = v22;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Selecting event trigger options of %@", buf, 0x16u);
  }
  uint64_t v63 = v17;

  uint64_t v23 = [(HMDCameraRecordingSettingsControl *)v19 recordingConfigurationOverrides];
  uint64_t v24 = objc_msgSend(v23, "hmf_numberForKey:", @"fragmentLength");

  uint64_t v64 = (void *)v24;
  if (v24) {
    uint64_t v25 = (void *)v24;
  }
  else {
    uint64_t v25 = &unk_26E4727F0;
  }
  id v70 = v25;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v26 = [(HMDCameraRecordingSettingsControl *)v19 supportedRecordingConfiguration];
  uint64_t v27 = [v26 mediaContainerConfigurations];

  id obj = v27;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (!v28)
  {
LABEL_30:

LABEL_36:
    uint64_t v58 = (void *)MEMORY[0x230FBD990]();
    id v59 = v19;
    __int16 v60 = HMFGetOSLogHandle();
    id v7 = v67;
    uint64_t v5 = v68;
    uint64_t v57 = v65;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v78 = v61;
      _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to select general configuration", buf, 0xCu);
    }
    v50 = 0;
    goto LABEL_39;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v72;
LABEL_17:
  uint64_t v31 = 0;
  uint64_t v32 = obj;
  while (1)
  {
    if (*(void *)v72 != v30) {
      objc_enumerationMutation(v32);
    }
    long long v33 = *(void **)(*((void *)&v71 + 1) + 8 * v31);
    uint64_t v34 = objc_msgSend(v33, "container", v63);
    uint64_t v35 = [v34 type];

    if (!v35) {
      break;
    }
    __int16 v36 = (void *)MEMORY[0x230FBD990]();
    uint64_t v37 = v19;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v78 = v39;
      __int16 v79 = 2112;
      id v80 = v33;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping container configuration: %@ unsupported container format", buf, 0x16u);
    }
LABEL_28:
    if (v29 == ++v31)
    {
      uint64_t v29 = [v32 countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (v29) {
        goto LABEL_17;
      }
      goto LABEL_30;
    }
  }
  __int16 v40 = [v33 parameters];
  id v41 = [v40 fragmentLength];

  if ([v70 compare:v41] == 1)
  {
    __int16 v42 = (void *)MEMORY[0x230FBD990]();
    v43 = v19;
    uint64_t v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      long long v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v78 = v45;
      __int16 v79 = 2112;
      id v80 = v33;
      __int16 v81 = 2112;
      id v82 = v70;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Skipping container configuration: %@, requested fragment length is %@", buf, 0x20u);

      uint64_t v32 = obj;
    }

    goto LABEL_28;
  }
  long long v51 = [[HMDCameraRecordingMediaContainerParameters alloc] initWithFragmentLength:v70];
  long long v52 = [HMDCameraRecordingMediaContainerConfiguration alloc];
  long long v53 = [v33 container];
  long long v54 = [(HMDCameraRecordingMediaContainerConfiguration *)v52 initWithMediaContainer:v53 containerParameters:v51];

  if (!v54) {
    goto LABEL_36;
  }
  v55 = [HMDCameraRecordingGeneralConfiguration alloc];
  long long v75 = v54;
  __int16 v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
  uint64_t v57 = v65;
  v50 = [(HMDCameraRecordingGeneralConfiguration *)v55 initWithPrebufferLength:v65 eventTriggerOptions:v63 mediaContainerConfigurations:v56];

  id v7 = v67;
  uint64_t v5 = v68;
LABEL_39:
  uint64_t v9 = v66;

LABEL_40:
  return v50;
}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__HMDCameraRecordingSettingsControl_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __90__HMDCameraRecordingSettingsControl_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isPrimaryResident])
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 40) name];
      int v9 = 138543618;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v9, 0x16u);
    }
    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) name];
    [v7 reconfigureCameraRecordingSettingsWithReason:v8];
  }
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = objc_msgSend(v2, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke_2;
  v11[3] = &unk_264A2D3B8;
  void v11[4] = *(void *)(a1 + 40);
  if (objc_msgSend(v3, "na_any:", v11))
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling %@", buf, 0x16u);
    }
    int v9 = *(void **)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) name];
    [v9 reconfigureCameraRecordingSettingsWithReason:v10];
  }
}

uint64_t __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldReconfigureForChangedCharacteristic:a2];
}

- (void)handleCharacteristicsUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__HMDCameraRecordingSettingsControl_handleCharacteristicsUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__HMDCameraRecordingSettingsControl_handleCharacteristicsUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) enableCharacteristicNotifications];
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) name];
  [v7 reconfigureCameraRecordingSettingsWithReason:v8];
}

- (void)handleAccessoryConnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HMDCameraRecordingSettingsControl_handleAccessoryConnectedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __74__HMDCameraRecordingSettingsControl_handleAccessoryConnectedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) configureCameraRecordingSettings];
}

- (void)handleAccessoryDisconnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMDCameraRecordingSettingsControl_handleAccessoryDisconnectedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __77__HMDCameraRecordingSettingsControl_handleAccessoryDisconnectedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@ by resetting current selected configuration", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) setCanUseCachedCharacteristicValues:0];
  return [*(id *)(a1 + 32) setCurrentSelectedConfiguration:0];
}

- (void)start
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v28 = 138543362;
    uint64_t v29 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting camera recording settings control", (uint8_t *)&v28, 0xCu);
  }
  int v8 = [(HMDCameraRecordingSettingsControl *)v5 accessory];
  if (!v8)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = v5;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v27;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Not starting camera recording settings control because accessory reference is nil", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_12;
  }
  int v9 = [(HMDCameraRecordingSettingsControl *)v5 notificationCenter];
  [v9 addObserver:v5 selector:sel_handleAccessoryConnectedNotification_ name:@"HMDAccessoryConnectedNotification" object:v8];

  __int16 v10 = [(HMDCameraRecordingSettingsControl *)v5 notificationCenter];
  [v10 addObserver:v5 selector:sel_handleAccessoryDisconnectedNotification_ name:@"HMDAccessoryDisconnectedNotification" object:v8];

  __int16 v11 = [(HMDCameraRecordingSettingsControl *)v5 notificationCenter];
  [v11 addObserver:v5 selector:sel_handleCharacteristicsUpdatedNotification_ name:@"kHMDNotificationCharacteristicsUpdated" object:v8];

  uint64_t v12 = [(HMDCameraRecordingSettingsControl *)v5 notificationCenter];
  [v12 addObserver:v5 selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v8];

  uint64_t v13 = [(HMDCameraRecordingSettingsControl *)v5 notificationCenter];
  __int16 v14 = [v8 home];
  [v13 addObserver:v5 selector:sel_handleHomePersonManagerSettingsDidChangeNotification_ name:@"HMDHomePersonManagerSettingsDidChangeNotification" object:v14];

  [(HMDCameraRecordingSettingsControl *)v5 enableCharacteristicNotifications];
  [(HMDCameraRecordingSettingsControl *)v5 configureCameraRecordingSettings];
  uint64_t v15 = [MEMORY[0x263F42608] sharedPreferences];
  uint64_t v16 = [v15 preferenceForKey:@"recordingConfigurationOverrides"];
  uint64_t v17 = [v16 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  id v19 = v18;

  [(HMDCameraRecordingSettingsControl *)v5 setRecordingConfigurationOverrides:v19];
  uint64_t v20 = [(HMDCameraRecordingSettingsControl *)v5 recordingConfigurationOverrides];

  if (v20)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    int v22 = v5;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      uint64_t v25 = [(HMDCameraRecordingSettingsControl *)v22 recordingConfigurationOverrides];
      int v28 = 138543618;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Using recording configuration overrides: %@", (uint8_t *)&v28, 0x16u);
    }
LABEL_12:
  }
}

- (NSArray)videoConfigurationsByPreferenceOrder
{
  v41[3] = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraRecordingSettingsControl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v40[0] = &unk_26E4726A0;
  v40[1] = &unk_26E4726D0;
  v41[0] = &unk_26E4726B8;
  v41[1] = &unk_26E4726B8;
  v40[2] = &unk_26E4726E8;
  v41[2] = &unk_26E472700;
  id v4 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
  v38[0] = &unk_26E4726A0;
  v38[1] = &unk_26E4726D0;
  v39[0] = &unk_26E472718;
  v39[1] = &unk_26E472730;
  v38[2] = &unk_26E4726E8;
  v39[2] = &unk_26E472748;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  id v6 = v4;
  id v7 = [(HMDCameraRecordingSettingsControl *)self accessory];
  int v8 = [v7 home];
  int v9 = [v8 personManagerSettings];
  int v10 = [v9 isFaceClassificationEnabled];

  uint64_t v11 = (uint64_t)v6;
  id v12 = v6;
  if (v10)
  {
    v36[0] = &unk_26E4726A0;
    v36[1] = &unk_26E4726D0;
    v37[0] = &unk_26E472760;
    v37[1] = &unk_26E472760;
    v36[2] = &unk_26E4726E8;
    v37[2] = &unk_26E472778;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];

    id v14 = v13;
    id v12 = v14;

    v34[0] = &unk_26E4726A0;
    v34[1] = &unk_26E4726D0;
    v35[0] = &unk_26E472778;
    v35[1] = &unk_26E472778;
    v34[2] = &unk_26E4726E8;
    void v35[2] = &unk_26E472790;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  }
  uint64_t v31 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:8 bitRateByFrameRate:v5 keyFrameInterval:&unk_26E472718 h264Level:3];
  __int16 v30 = (void *)v5;
  uint64_t v15 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:17 bitRateByFrameRate:v5 keyFrameInterval:&unk_26E472718 h264Level:3];
  int v28 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:7 bitRateByFrameRate:v12 keyFrameInterval:&unk_26E472718 h264Level:2];
  uint64_t v25 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:6 bitRateByFrameRate:v11 keyFrameInterval:&unk_26E472718 h264Level:0];
  uint64_t v27 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:3 bitRateByFrameRate:v6 keyFrameInterval:&unk_26E472718 h264Level:1];
  uint64_t v26 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:2 bitRateByFrameRate:v6 keyFrameInterval:&unk_26E472718 h264Level:0];
  uint64_t v16 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:10 bitRateByFrameRate:v12 keyFrameInterval:&unk_26E472718 h264Level:2];
  uint64_t v29 = (void *)v11;
  uint64_t v17 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:9 bitRateByFrameRate:v11 keyFrameInterval:&unk_26E472718 h264Level:0];
  int v18 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:11 bitRateByFrameRate:v12 keyFrameInterval:&unk_26E472718 h264Level:2];
  id v19 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:12 bitRateByFrameRate:v12 keyFrameInterval:&unk_26E472718 h264Level:2];
  long long v33 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:13 bitRateByFrameRate:v12 keyFrameInterval:&unk_26E472718 h264Level:2];
  uint64_t v32 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:14 bitRateByFrameRate:v12 keyFrameInterval:&unk_26E472718 h264Level:2];
  uint64_t v20 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:15 bitRateByFrameRate:v6 keyFrameInterval:&unk_26E472718 h264Level:1];
  id v21 = [[HMDCameraRecordingPreferredVideoConfiguration alloc] initWithResolution:16 bitRateByFrameRate:v6 keyFrameInterval:&unk_26E472718 h264Level:0];
  int v22 = [MEMORY[0x263EFF980] array];
  if (_os_feature_enabled_impl()) {
    [v22 addObject:v15];
  }
  [v22 addObject:v16];
  [v22 addObject:v17];
  [v22 addObject:v33];
  [v22 addObject:v32];
  [v22 addObject:v20];
  [v22 addObject:v21];
  if (_os_feature_enabled_impl()) {
    [v22 addObject:v31];
  }
  [v22 addObject:v28];
  [v22 addObject:v25];
  [v22 addObject:v18];
  [v22 addObject:v19];
  [v22 addObject:v27];
  [v22 addObject:v26];
  id v24 = (id)[v22 copy];

  return (NSArray *)v24;
}

- (HMDCameraRecordingSettingsControl)initWithWorkQueue:(id)a3 accessory:(id)a4 recordingManagementService:(id)a5 notificationCenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_11:
    uint64_t v26 = (HMDCameraRecordingSettingsControl *)_HMFPreconditionFailure();
    return [(HMDCameraRecordingSettingsControl *)v26 initWithWorkQueue:v28 accessory:v29 recordingManagementService:v30];
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDCameraRecordingSettingsControl;
  uint64_t v16 = [(HMDCameraRecordingSettingsControl *)&v31 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a3);
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v17->_recordingService, a5);
    objc_storeStrong((id *)&v17->_notificationCenter, a6);
    int v18 = NSString;
    id v19 = [MEMORY[0x263F08C38] UUID];
    uint64_t v20 = [v19 UUIDString];
    uint64_t v21 = [v18 stringWithFormat:@"%@.HMDCameraRecordingSettingsControl.%@", @"com.apple.HomeKitDaemon.Local", v20];
    clientIdentifier = v17->_clientIdentifier;
    v17->_clientIdentifier = (NSString *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] array];
    pendingConfigureCompletionHandlers = v17->_pendingConfigureCompletionHandlers;
    v17->_pendingConfigureCompletionHandlers = (NSMutableArray *)v23;
  }
  return v17;
}

- (HMDCameraRecordingSettingsControl)initWithWorkQueue:(id)a3 accessory:(id)a4 recordingManagementService:(id)a5
{
  int v8 = (void *)MEMORY[0x263F08A00];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 defaultCenter];
  id v13 = [(HMDCameraRecordingSettingsControl *)self initWithWorkQueue:v11 accessory:v10 recordingManagementService:v9 notificationCenter:v12];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t78_185028 != -1) {
    dispatch_once(&logCategory__hmf_once_t78_185028, &__block_literal_global_196);
  }
  v2 = (void *)logCategory__hmf_once_v79_185029;
  return v2;
}

void __48__HMDCameraRecordingSettingsControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v79_185029;
  logCategory__hmf_once_v79_185029 = v0;
}

+ (id)audioCodecForCodecConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 codec];
  BOOL v5 = +[HMDCameraRecordingSettingsControl isSupportedAudioCodec:v4];

  if (v5)
  {
    id v6 = [v3 codec];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)audioBitRateForCodecConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "parameters", 0);
  id v4 = [v3 bitRateModes];

  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((unint64_t)[v8 type] < 2)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (BOOL)isSupportedAudioCodec:(id)a3
{
  return (unint64_t)[a3 type] < 2;
}

+ (id)videoCodecForCodecConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 codec];
  LODWORD(a1) = [a1 isSupportedVideoCodec:v5];

  if (a1)
  {
    uint64_t v6 = [v4 codec];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)h264ProfileForCodecConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "parameters", 0);
  id v4 = [v3 profiles];

  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (+[HMDCameraRecordingSettingsControl isSupportedH264Profile:v8])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (BOOL)isSupportedH264Profile:(id)a3
{
  return (unint64_t)[a3 h264Profile] < 3;
}

+ (BOOL)isSupportedVideoCodec:(id)a3
{
  return [a3 type] == 0;
}

+ (NSArray)audioConfigurationsByPreferenceOrder
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMDCameraRecordingSettingsControl_audioConfigurationsByPreferenceOrder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (audioConfigurationsByPreferenceOrder_onceToken != -1) {
    dispatch_once(&audioConfigurationsByPreferenceOrder_onceToken, block);
  }
  v2 = (void *)audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder;
  return (NSArray *)v2;
}

void __73__HMDCameraRecordingSettingsControl_audioConfigurationsByPreferenceOrder__block_invoke(uint64_t a1)
{
  v17[5] = *MEMORY[0x263EF8340];
  v2 = [[HMDCameraRecordingPreferredAudioConfiguration alloc] initWithSampleRate:3 bitRate:&unk_26E4727A8];
  id v3 = [[HMDCameraRecordingPreferredAudioConfiguration alloc] initWithSampleRate:1 bitRate:&unk_26E4727C0];
  id v4 = [[HMDCameraRecordingPreferredAudioConfiguration alloc] initWithSampleRate:2 bitRate:&unk_26E4727D8];
  id v5 = [[HMDCameraRecordingPreferredAudioConfiguration alloc] initWithSampleRate:4 bitRate:&unk_26E4727A8];
  uint64_t v6 = [[HMDCameraRecordingPreferredAudioConfiguration alloc] initWithSampleRate:5 bitRate:&unk_26E4727A8];
  v17[0] = v2;
  v17[1] = v5;
  v17[2] = v6;
  v17[3] = v4;
  v17[4] = v3;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];
  int v8 = (void *)audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder;
  audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder = v7;

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    long long v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v12;
    __int16 v15 = 2112;
    uint64_t v16 = audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred audio configuration order: %@", (uint8_t *)&v13, 0x16u);
  }
}

@end
@interface HMDeviceManager
+ (id)sharedInstance;
- (BOOL)_deviceUpdateRegionStatus:(id)a3;
- (HMDeviceManager)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_constructPMEConfigDataBytesForDevice:(id)a3 fromConfig:(id)a4;
- (id)availableDiagnosticRecords;
- (id)availableRecords;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_accessoryDiscoveryEnsureStarted;
- (void)_accessoryDiscoveryEnsureStopped;
- (void)_activate;
- (void)_activateAHPSConnectionForDevice:(id)a3;
- (void)_checkForOcclusionInDiagnosticRecord:(id)a3 forDevice:(id)a4;
- (void)_cloudServicesClientEnsureStarted;
- (void)_cloudServicesClientEnsureStopped;
- (void)_computeOcclusionResultFromFaultCountsInRecord:(id)a3 forDevice:(id)a4;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_deviceRescindHearingAssist:(id)a3;
- (void)_deviceSetOffListeningModeAllowedIfNeeded:(id)a3;
- (void)_diagnosticDataReceived:(id)a3 identifier:(id)a4 isInternal:(BOOL)a5;
- (void)_distributedNotificationReceived:(id)a3;
- (void)_fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5;
- (void)_hearingAidConfigDataReceived:(id)a3 identifier:(id)a4;
- (void)_hearingProtectionValueReceived:(unsigned __int8)a3 identifier:(id)a4;
- (void)_invalidate;
- (void)_invalidateAHPSConnectionForDevice:(id)a3;
- (void)_loadCloudRecordForDevice:(id)a3;
- (void)_modifyDeviceConfiguration:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_multimodalContextMessageReceived:(id)a3 identifier:(id)a4;
- (void)_occlusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6;
- (void)_performActionsOnRecordChange:(id)a3;
- (void)_pmeConfigDataReceived:(id)a3 identifier:(id)a4;
- (void)_registerForHearingAccessibilitySettingsUpdate;
- (void)_registerForInternalDistributedNotification;
- (void)_registerForRegionStatusUpdates;
- (void)_resetFaultCountForDevice:(id)a3;
- (void)_retrieveHearingProtectionSettingsForDevice:(id)a3;
- (void)_saveCloudRecordForDevice:(id)a3 withConfig:(id)a4;
- (void)_sendConfigOverDeviceManager:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_sendHearingAidConfigOverAHPSConnection:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_sendPMEConfigOverAAController:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_setHearingProtectionEnabledForDevice:(id)a3 withConfig:(id)a4;
- (void)_throttleUpdatesForHearingAidConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_triggerDiagnosticCheckForIdentifier:(id)a3 completion:(id)a4;
- (void)_triggerHearingProtectionOcclusionNotificationIfNeeded:(id)a3;
- (void)_unregisterFromHearingAccessibilitySettingsUpdate;
- (void)_unregisterFromInternalDistributedNotification;
- (void)_unregisterFromRegionStatusUpdates;
- (void)_updateCloudRecords:(id)a3;
- (void)_updatePersonalAudioConfigForIdentifier:(id)a3;
- (void)activate;
- (void)fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5;
- (void)invalidate;
- (void)occlusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6;
- (void)setDispatchQueue:(id)a3;
@end

@implementation HMDeviceManager

- (id)availableRecords
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_deviceRecordMap copy];
  objc_sync_exit(v2);

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnce_0 != -1) {
    dispatch_once(&sharedInstance_sOnce_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sSelf_0;
  return v2;
}

uint64_t __33__HMDeviceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMDeviceManager);
  uint64_t v1 = sharedInstance_sSelf_0;
  sharedInstance_sSelf_0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)availableDiagnosticRecords
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_diagnosticRecordMap copy];
  objc_sync_exit(v2);

  return v3;
}

- (HMDeviceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDeviceManager;
  v2 = [(HMDeviceManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HMDeviceManager_activate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HMDeviceManager_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(HMDeviceManager *)self _accessoryDiscoveryEnsureStarted];
    [(HMDeviceManager *)self _aaControllerEnsureStarted];
    [(HMDeviceManager *)self _cloudServicesClientEnsureStarted];
    [(HMDeviceManager *)self _registerForHearingAccessibilitySettingsUpdate];
    [(HMDeviceManager *)self _registerForRegionStatusUpdates];
    [(HMDeviceManager *)self _registerForInternalDistributedNotification];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMDeviceManager_invalidate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HMDeviceManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(HMDeviceManager *)self _accessoryDiscoveryEnsureStopped];
  [(HMDeviceManager *)self _aaControllerEnsureStopped];
  [(HMDeviceManager *)self _cloudServicesClientEnsureStopped];
  [(NSMutableDictionary *)self->_deviceRecordMap removeAllObjects];
  deviceRecordMap = self->_deviceRecordMap;
  self->_deviceRecordMap = 0;

  [(NSMutableDictionary *)self->_deviceAHPSConnectionManagerMap removeAllObjects];
  deviceAHPSConnectionManagerMap = self->_deviceAHPSConnectionManagerMap;
  self->_deviceAHPSConnectionManagerMap = 0;

  [(NSMutableDictionary *)self->_diagnosticRecordMap removeAllObjects];
  diagnosticRecordMap = self->_diagnosticRecordMap;
  self->_diagnosticRecordMap = 0;

  [(HMDeviceManager *)self _unregisterFromHearingAccessibilitySettingsUpdate];
  [(HMDeviceManager *)self _unregisterFromRegionStatusUpdates];
  [(HMOcclusionNotification *)self->_occlusionNotification invalidateHearingProtectionOcclusionNotification];
  self->_activateCalled = 0;
  [(HMDeviceManager *)self _unregisterFromInternalDistributedNotification];
}

- (void)_modifyDeviceConfiguration:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v9];
  if (v11)
  {
    [(HMDeviceManager *)self _saveCloudRecordForDevice:v11 withConfig:v8];
    [v8 restoreConfigsFromCloudRecordIfNeeded:v11];
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    char v28 = 0;
    char v28 = [v8 needsUpdateToPersonalAudioForDevice:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke;
    v21[3] = &unk_265362928;
    v26 = v27;
    v21[4] = self;
    id v12 = v9;
    id v22 = v12;
    id v13 = v8;
    id v23 = v13;
    id v24 = v11;
    id v25 = v10;
    v14 = (void *)MEMORY[0x253398690](v21);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_2;
    v17[3] = &unk_265362978;
    id v15 = v14;
    id v20 = v15;
    v17[4] = self;
    id v18 = v13;
    id v19 = v12;
    [(HMDeviceManager *)self _sendConfigOverDeviceManager:v18 identifier:v19 completion:v17];

    _Block_object_dispose(v27, 8);
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v16 = NSErrorF();
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v16);
    }
  }
}

uint64_t __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!v7)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      [*(id *)(a1 + 32) _updatePersonalAudioConfigForIdentifier:*(void *)(a1 + 40)];
    }
    else if (gLogCategory_HMDeviceManager <= 10 {
           && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    }
    {
      uint64_t v6 = *(void *)(a1 + 48);
      LogPrintF();
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "enableHearingProtection", v6)) {
    [*(id *)(a1 + 32) _setHearingProtectionEnabledForDevice:*(void *)(a1 + 56) withConfig:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = v7;
  if (v3)
  {
    uint64_t v3 = (*(uint64_t (**)(uint64_t, id))(v3 + 16))(v3, v7);
    id v4 = v7;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_3;
    v10[3] = &unk_265362978;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v13 = v7;
    v10[4] = v8;
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    [v4 _sendPMEConfigOverAAController:v5 identifier:v6 completion:v10];
  }
}

void __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_4;
    v6[3] = &unk_265362950;
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    [v3 _throttleUpdatesForHearingAidConfig:v4 identifier:v5 completion:v6];
  }
}

uint64_t __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_triggerDiagnosticCheckForIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = [(NSMutableDictionary *)self->_deviceAHPSConnectionManagerMap objectForKeyedSubscript:v10];
  if (!v7)
  {
    id v9 = v10;
    uint64_t v8 = NSErrorF();
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v9 = v10;
      LogPrintF();
    }
    if (v6) {
      v6[2](v6, v8);
    }
  }
  objc_msgSend(v7, "triggerOnDemandDiagnosticCheckWithCompletionHandler:", v6, v9);
}

- (void)_accessoryDiscoveryEnsureStarted
{
  p_deviceManager = &self->_deviceManager;
  uint64_t v4 = self->_deviceManager;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F28940]);
    objc_storeStrong((id *)p_deviceManager, v5);
    [v5 setDispatchQueue:self->_dispatchQueue];
    [v5 setInterruptionHandler:&__block_literal_global_288];
    [v5 setInvalidationHandler:&__block_literal_global_291];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_3;
    v9[3] = &unk_2653629A0;
    v9[4] = self;
    [v5 setDeviceFoundHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_4;
    v8[3] = &unk_2653629A0;
    v8[4] = self;
    [v5 setDeviceLostHandler:v8];
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_5;
    v6[3] = &unk_2653629C8;
    void v6[4] = self;
    uint64_t v4 = (AADeviceManager *)v5;
    id v7 = v4;
    [(AADeviceManager *)v4 activateWithCompletion:v6];
  }
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_2()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceFound:a2];
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_HMDeviceManager <= 30)
  {
    if (gLogCategory_HMDeviceManager != -1 || (v4 = _LogCategory_Initialize(), id v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_deviceLost:", v3, v5);
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v5 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "invalidate", v5);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_accessoryDiscoveryEnsureStopped
{
  deviceManager = self->_deviceManager;
  if (deviceManager)
  {
    [(AADeviceManager *)deviceManager invalidate];
    int v4 = self->_deviceManager;
    self->_deviceManager = 0;
  }
}

- (void)_deviceFound:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = [v11 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v4];
    if (v5)
    {
      id v6 = v5;
      if (![v5 updateWithAADevice:v11]) {
        goto LABEL_13;
      }
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        id v10 = v11;
        LogPrintF();
      }
      id v6 = objc_alloc_init(MEMORY[0x263F472E8]);
      deviceRecordMap = self->_deviceRecordMap;
      if (!deviceRecordMap)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v9 = self->_deviceRecordMap;
        self->_deviceRecordMap = v8;

        deviceRecordMap = self->_deviceRecordMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceRecordMap, "setObject:forKeyedSubscript:", v6, v4, v10);
      [v6 updateWithAADevice:v11];
      [(HMDeviceManager *)self _retrieveHearingProtectionSettingsForDevice:v6];
      [(HMDeviceManager *)self _loadCloudRecordForDevice:v6];
      [(HMDeviceManager *)self _activateAHPSConnectionForDevice:v6];
    }
    [(HMDeviceManager *)self _performActionsOnRecordChange:v6];
LABEL_13:

    goto LABEL_14;
  }
  if (gLogCategory_HMDeviceManager <= 90
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_14:
}

- (void)_performActionsOnRecordChange:(id)a3
{
  id v7 = a3;
  [(HMDeviceManager *)self _deviceUpdateRegionStatus:v7];
  [(HMDeviceManager *)self _deviceSetOffListeningModeAllowedIfNeeded:v7];
  if ([v7 hearingAssistEnabled] == 1)
  {
    int v4 = [v7 bluetoothUUID];
    [(HMDeviceManager *)self _updatePersonalAudioConfigForIdentifier:v4];
  }
  [(HMDeviceManager *)self _triggerHearingProtectionOcclusionNotificationIfNeeded:v7];
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    id v6 = v7;
    LogPrintF();
  }
  id v5 = +[HMServiceDaemon sharedHMServiceDaemon];
  [v5 reportDeviceRecordChange:v7];
}

- (void)_deviceLost:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = [v9 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v4];
    if (v5)
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = v5;
        LogPrintF();
      }
      -[HMDeviceManager _invalidateAHPSConnectionForDevice:](self, "_invalidateAHPSConnectionForDevice:", v5, v8);
      [(NSMutableDictionary *)self->_deviceRecordMap setObject:0 forKeyedSubscript:v4];
      id v6 = +[HMServiceDaemon sharedHMServiceDaemon];
      [v6 reportDeviceRecordLost:v5];

      [(NSMutableDictionary *)self->_diagnosticRecordMap setObject:0 forKeyedSubscript:v4];
      id v7 = NSErrorF();
      objc_msgSend(v5, "invokePendingOcclusionCompletionsWithError:", v7, v4);
    }
  }
  else if (gLogCategory_HMDeviceManager <= 90 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_sendConfigOverDeviceManager:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_deviceManager)
  {
    id v11 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v9];
    if (v11)
    {
      if ([v8 needsUpdateToDeviceManagerForDevice:v11])
      {
        id v12 = objc_alloc_init(MEMORY[0x263F28938]);
        objc_msgSend(v12, "setEnableHearingAidGainSwipe:", objc_msgSend(v8, "enableSwipeGain"));
        objc_msgSend(v12, "setEnableHearingAssist:", objc_msgSend(v8, "enableHearingAssist"));
        objc_msgSend(v12, "setHearingAidToggle:", objc_msgSend(v8, "enableHearingAid"));
        objc_msgSend(v12, "setHearingAidEnrolled:", objc_msgSend(v8, "enrollHearingAssist"));
        id v13 = [v8 selectedAudiogram];

        if (v13)
        {
          v14 = [v8 selectedAudiogram];
          id v15 = [v14 startDate];
          [v12 setAudiogramEnrolledTimestamp:v15];
        }
        objc_msgSend(v12, "setListeningModeOffAllowed:", objc_msgSend(v8, "allowListeningModeOff"));
        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        deviceManager = self->_deviceManager;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __70__HMDeviceManager__sendConfigOverDeviceManager_identifier_completion___block_invoke;
        v19[3] = &unk_2653629F0;
        id v20 = v12;
        id v21 = v9;
        id v22 = v10;
        id v18 = v12;
        [(AADeviceManager *)deviceManager sendDeviceConfig:v18 identifier:v21 completion:v19];
      }
      else
      {
        if (gLogCategory_HMDeviceManager <= 10
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v10) {
          (*((void (**)(id, void))v10 + 2))(v10, 0);
        }
      }
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v16 = NSErrorF();
      if (v10) {
        (*((void (**)(id, void *))v10 + 2))(v10, v16);
      }
    }
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v11 = NSErrorF();
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v11);
    }
  }
}

uint64_t __70__HMDeviceManager__sendConfigOverDeviceManager_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_HMDeviceManager <= 90)
    {
      if (gLogCategory_HMDeviceManager != -1 || (v4 = _LogCategory_Initialize(), id v3 = v7, v4))
      {
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v5, v3);
}

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  int v4 = self->_aaController;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F28930]);
    [v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_aaController, v5);
    [v5 setInvalidationHandler:&__block_literal_global_315];
    if (_os_feature_enabled_impl())
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_2;
      v13[3] = &unk_265362A18;
      id v14 = v5;
      id v15 = self;
      [v14 setPmeConfigMessageHandler:v13];
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_3;
    v10[3] = &unk_265362A18;
    id v6 = v5;
    id v11 = v6;
    id v12 = self;
    [v6 setMultimodalContextMessageHandler:v10];
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_4;
    v7[3] = &unk_2653629C8;
    int v4 = (AAController *)v6;
    id v8 = v4;
    id v9 = self;
    [(AAController *)v4 activateWithCompletion:v7];
  }
}

void __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[1])
  {
    id v6 = a2;
    [v3 _pmeConfigDataReceived:a3 identifier:v6];
    [*(id *)(a1 + 40) _updatePersonalAudioConfigForIdentifier:v6];
  }
}

void *__45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v4 == result[1]) {
    return (void *)[result _multimodalContextMessageReceived:a3 identifier:a2];
  }
  return result;
}

uint64_t __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 8))
  {
    if (v3)
    {
      id v9 = v3;
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        id v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 8);
      *(void *)(v5 + 8) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_HMDeviceManager <= 30)
    {
      id v9 = 0;
      if (gLogCategory_HMDeviceManager != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = 0, v3))
      {
        id v3 = (id)LogPrintF();
LABEL_11:
        id v4 = v9;
      }
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_aaControllerEnsureStopped
{
  aaController = self->_aaController;
  if (aaController)
  {
    [(AAController *)aaController invalidate];
    id v4 = self->_aaController;
    self->_aaController = 0;
  }
}

- (id)_constructPMEConfigDataBytesForDevice:(id)a3 fromConfig:(id)a4
{
  id v5 = a4;
  id v6 = [a3 configDataPME];
  id v7 = v6;
  LODWORD(v93) = 0;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  if (v6)
  {
    [v6 getBytes:&v85 length:132];
  }
  else if (gLogCategory_HMDeviceManager <= 30 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  LOBYTE(v85) = 2;
  if (objc_msgSend(v5, "enablePMEMedia", v85, v86, v87, v88, v89, v90, v91, v92, v93))
  {
    if ([v5 enablePMEMedia] == 1) {
      char v8 = 1;
    }
    else {
      char v8 = 2;
    }
    BYTE3(v85) = v8;
  }
  if ([v5 enablePMEVoice])
  {
    if ([v5 enablePMEVoice] == 1) {
      char v9 = 1;
    }
    else {
      char v9 = 2;
    }
    BYTE2(v85) = v9;
  }
  if ([v5 enrollPMEVoice])
  {
    if ([v5 enrollPMEVoice] == 1) {
      char v10 = 1;
    }
    else {
      char v10 = 2;
    }
    BYTE1(v85) = v10;
  }
  id v11 = [v5 mediaLossArrayLeft];

  if (v11)
  {
    id v12 = [v5 mediaLossArrayLeft];
    id v13 = [v12 objectAtIndexedSubscript:0];
    [v13 floatValue];
    DWORD1(v87) = v14;

    id v15 = [v12 objectAtIndexedSubscript:1];
    [v15 floatValue];
    DWORD2(v87) = v16;

    v17 = [v12 objectAtIndexedSubscript:2];
    [v17 floatValue];
    HIDWORD(v87) = v18;

    id v19 = [v12 objectAtIndexedSubscript:3];
    [v19 floatValue];
    LODWORD(v88) = v20;

    id v21 = [v12 objectAtIndexedSubscript:4];
    [v21 floatValue];
    DWORD1(v88) = v22;

    id v23 = [v12 objectAtIndexedSubscript:5];
    [v23 floatValue];
    DWORD2(v88) = v24;

    id v25 = [v12 objectAtIndexedSubscript:6];
    [v25 floatValue];
    HIDWORD(v88) = v26;

    v27 = [v12 objectAtIndexedSubscript:7];
    [v27 floatValue];
    LODWORD(v89) = v28;
  }
  v29 = [v5 mediaLossArrayRight];

  if (v29)
  {
    v30 = [v5 mediaLossArrayRight];
    v31 = [v30 objectAtIndexedSubscript:0];
    [v31 floatValue];
    DWORD1(v91) = v32;

    v33 = [v30 objectAtIndexedSubscript:1];
    [v33 floatValue];
    DWORD2(v91) = v34;

    v35 = [v30 objectAtIndexedSubscript:2];
    [v35 floatValue];
    HIDWORD(v91) = v36;

    v37 = [v30 objectAtIndexedSubscript:3];
    [v37 floatValue];
    LODWORD(v92) = v38;

    v39 = [v30 objectAtIndexedSubscript:4];
    [v39 floatValue];
    DWORD1(v92) = v40;

    v41 = [v30 objectAtIndexedSubscript:5];
    [v41 floatValue];
    DWORD2(v92) = v42;

    v43 = [v30 objectAtIndexedSubscript:6];
    [v43 floatValue];
    HIDWORD(v92) = v44;

    v45 = [v30 objectAtIndexedSubscript:7];
    [v45 floatValue];
    LODWORD(v93) = v46;
  }
  v47 = [v5 voiceLossArrayLeft];

  if (v47)
  {
    v48 = [v5 voiceLossArrayLeft];
    v49 = [v48 objectAtIndexedSubscript:0];
    [v49 floatValue];
    DWORD1(v85) = v50;

    v51 = [v48 objectAtIndexedSubscript:1];
    [v51 floatValue];
    DWORD2(v85) = v52;

    v53 = [v48 objectAtIndexedSubscript:2];
    [v53 floatValue];
    HIDWORD(v85) = v54;

    v55 = [v48 objectAtIndexedSubscript:3];
    [v55 floatValue];
    LODWORD(v86) = v56;

    v57 = [v48 objectAtIndexedSubscript:4];
    [v57 floatValue];
    DWORD1(v86) = v58;

    v59 = [v48 objectAtIndexedSubscript:5];
    [v59 floatValue];
    DWORD2(v86) = v60;

    v61 = [v48 objectAtIndexedSubscript:6];
    [v61 floatValue];
    HIDWORD(v86) = v62;

    v63 = [v48 objectAtIndexedSubscript:7];
    [v63 floatValue];
    LODWORD(v87) = v64;
  }
  v65 = [v5 voiceLossArrayRight];

  if (v65)
  {
    v66 = [v5 voiceLossArrayRight];
    v67 = [v66 objectAtIndexedSubscript:0];
    [v67 floatValue];
    DWORD1(v89) = v68;

    v69 = [v66 objectAtIndexedSubscript:1];
    [v69 floatValue];
    DWORD2(v89) = v70;

    v71 = [v66 objectAtIndexedSubscript:2];
    [v71 floatValue];
    HIDWORD(v89) = v72;

    v73 = [v66 objectAtIndexedSubscript:3];
    [v73 floatValue];
    LODWORD(v90) = v74;

    v75 = [v66 objectAtIndexedSubscript:4];
    [v75 floatValue];
    DWORD1(v90) = v76;

    v77 = [v66 objectAtIndexedSubscript:5];
    [v77 floatValue];
    DWORD2(v90) = v78;

    v79 = [v66 objectAtIndexedSubscript:6];
    [v79 floatValue];
    HIDWORD(v90) = v80;

    v81 = [v66 objectAtIndexedSubscript:7];
    [v81 floatValue];
    LODWORD(v91) = v82;
  }
  v83 = [MEMORY[0x263EFF8F8] dataWithBytes:&v85 length:132];

  return v83;
}

- (void)_multimodalContextMessageReceived:(id)a3 identifier:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((unint64_t)[v17 length] >= 3)
  {
    id v7 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v6];
    if (v7)
    {
      if (v17 && (char v8 = (unsigned char *)[v17 bytes], *v8 == 2))
      {
        if (v8[1] == 1)
        {
          uint64_t v9 = v8[2];
          if ([v7 currentNoiseLevel] != v9)
          {
            if (gLogCategory_HMDeviceManager <= 30
              && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
            {
              char v10 = [v7 bluetoothUUID];
              unsigned int v11 = [v7 currentNoiseLevel];
              if (v11 > 2) {
                id v12 = "?";
              }
              else {
                id v12 = off_265362C10[v11];
              }
              if (v9 > 2) {
                id v13 = "?";
              }
              else {
                id v13 = off_265362C10[(char)v9];
              }
              id v15 = v12;
              int v16 = v13;
              int v14 = v10;
              LogPrintF();
            }
            objc_msgSend(v7, "setCurrentNoiseLevel:", v9, v14, v15, v16);
          }
          [(HMDeviceManager *)self _triggerHearingProtectionOcclusionNotificationIfNeeded:v7];
          goto LABEL_30;
        }
        if (gLogCategory_HMDeviceManager > 30
          || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      else if (gLogCategory_HMDeviceManager > 30 {
             || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
      }
      {
        goto LABEL_30;
      }
    }
    else if (gLogCategory_HMDeviceManager > 30 {
           || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_30;
    }
    LogPrintF();
    goto LABEL_30;
  }
LABEL_31:
}

- (void)_pmeConfigDataReceived:(id)a3 identifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v6];
  char v8 = v7;
  if (v7)
  {
    if ([v7 updateWithPMEConfigData:v12])
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSDataHex();
        v11 = char v10 = v8;
        LogPrintF();
      }
      uint64_t v9 = +[HMServiceDaemon sharedHMServiceDaemon];
      [v9 reportDeviceRecordChange:v8];
    }
  }
  else if (gLogCategory_HMDeviceManager <= 30 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_sendPMEConfigOverAAController:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(id, id))a5;
  if (_os_feature_enabled_impl())
  {
    unsigned int v11 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v9];
    if (!v11)
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v10) {
        v10[2](v10, v14);
      }
      goto LABEL_20;
    }
    if ([v8 needsUpdateToPMEConfigurationForDevice:v11])
    {
      [(HMDeviceManager *)self _aaControllerEnsureStarted];
      id v12 = [(HMDeviceManager *)self _constructPMEConfigDataBytesForDevice:v11 fromConfig:v8];
      aaController = self->_aaController;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __72__HMDeviceManager__sendPMEConfigOverAAController_identifier_completion___block_invoke;
      v15[3] = &unk_265362A40;
      id v16 = v12;
      id v17 = v9;
      int v18 = self;
      id v19 = v10;
      id v14 = v12;
      [(AAController *)aaController sendPMEConfigData:v14 destinationIdentifier:v17 completionHandler:v15];

LABEL_20:
      goto LABEL_24;
    }
    if (gLogCategory_HMDeviceManager <= 10
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unsigned int v11 = NSErrorF();
    if (v10) {
      v10[2](v10, v11);
    }
  }
LABEL_24:
}

uint64_t __72__HMDeviceManager__sendPMEConfigOverAAController_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = v3;
  if (!v3)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v12 = CUPrintNSDataHex();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 48), "_pmeConfigDataReceived:identifier:", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_pmeConfigDataReceived:identifier:", *(void *)(a1 + 32), *(void *)(a1 + 40), v9, v11);
    }
    goto LABEL_12;
  }
  id v4 = v3;
  if (gLogCategory_HMDeviceManager <= 90)
  {
    if (gLogCategory_HMDeviceManager != -1 || (int v6 = _LogCategory_Initialize(), v4 = v13, v6))
    {
      char v10 = CUPrintNSDataHex();
      LogPrintF();

LABEL_12:
      id v4 = v13;
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, v13);
    id v4 = v13;
  }
  return MEMORY[0x270F9A758](v7, v4);
}

- (void)_activateAHPSConnectionForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bluetoothUUID];
  if (v5)
  {
    int v6 = [(NSMutableDictionary *)self->_deviceAHPSConnectionManagerMap objectForKeyedSubscript:v5];
    if (!v6)
    {
      int v6 = [[HMDeviceAHPSConnectionManager alloc] initWithQueue:self->_dispatchQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke;
      v12[3] = &unk_265362A68;
      v12[4] = self;
      [(HMDeviceAHPSConnectionManager *)v6 setSettingsUpdateHandler:v12];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke_2;
      v11[3] = &unk_265362A90;
      v11[4] = self;
      [(HMDeviceAHPSConnectionManager *)v6 setHearingProtectionUpdateHandler:v11];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke_3;
      v10[3] = &unk_265362A68;
      void v10[4] = self;
      [(HMDeviceAHPSConnectionManager *)v6 setDiagnosticStatusUpdateHandler:v10];
      deviceAHPSConnectionManagerMap = self->_deviceAHPSConnectionManagerMap;
      if (!deviceAHPSConnectionManagerMap)
      {
        id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v9 = self->_deviceAHPSConnectionManagerMap;
        self->_deviceAHPSConnectionManagerMap = v8;

        deviceAHPSConnectionManagerMap = self->_deviceAHPSConnectionManagerMap;
      }
      [(NSMutableDictionary *)deviceAHPSConnectionManagerMap setObject:v6 forKeyedSubscript:v5];
      [(HMDeviceAHPSConnectionManager *)v6 activateWithBluetoothDeviceUUID:v5];
    }
  }
  else if (gLogCategory_HMDeviceManager <= 90 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _hearingAidConfigDataReceived:a3 identifier:v6];
  [*(id *)(a1 + 32) _updatePersonalAudioConfigForIdentifier:v6];
}

uint64_t __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _hearingProtectionValueReceived:a3 identifier:a2];
}

uint64_t __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _diagnosticDataReceived:a3 identifier:a2 isInternal:0];
}

- (void)_invalidateAHPSConnectionForDevice:(id)a3
{
  id v6 = [a3 bluetoothUUID];
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceAHPSConnectionManagerMap, "objectForKeyedSubscript:");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_deviceAHPSConnectionManagerMap setObject:0 forKeyedSubscript:v6];
  }
}

- (void)_diagnosticDataReceived:(id)a3 identifier:(id)a4 isInternal:(BOOL)a5
{
  id v15 = a3;
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v8];
  if (v9)
  {
    char v10 = [(NSMutableDictionary *)self->_diagnosticRecordMap objectForKeyedSubscript:v8];
    if (!v10)
    {
      if (!self->_diagnosticRecordMap)
      {
        uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        diagnosticRecordMap = self->_diagnosticRecordMap;
        self->_diagnosticRecordMap = v11;
      }
      char v10 = (void *)[objc_alloc(MEMORY[0x263F472E0]) initWithHMDeviceRecord:v9 isNewPairing:0];
      [(NSMutableDictionary *)self->_diagnosticRecordMap setObject:v10 forKeyedSubscript:v8];
    }
    [v10 updateWithDiagnosticData:v15];
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v14 = v10;
      LogPrintF();
    }
    id v13 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v13 reportDiagnosticRecordChange:v10];

    if ([v9 cloudRecordLoaded])
    {
      [(HMDeviceManager *)self _checkForOcclusionInDiagnosticRecord:v10 forDevice:v9];
      if (!a5) {
        [v10 submitMetricsForOcclusionPolicy];
      }
    }
    else if (gLogCategory_HMDeviceManager <= 30 {
           && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_HMDeviceManager <= 90 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_hearingAidConfigDataReceived:(id)a3 identifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v6];
  id v8 = v7;
  if (v7)
  {
    if ([v7 updateWithHearingAidConfigData:v11])
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        char v10 = v8;
        LogPrintF();
      }
      uint64_t v9 = +[HMServiceDaemon sharedHMServiceDaemon];
      [v9 reportDeviceRecordChange:v8];
    }
  }
  else if (gLogCategory_HMDeviceManager <= 90 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_hearingProtectionValueReceived:(unsigned __int8)a3 identifier:(id)a4
{
  uint64_t v4 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v11];
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 updateWithHearingProtectionValue:v4])
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        uint64_t v9 = v4;
        char v10 = v7;
        LogPrintF();
      }
      id v8 = +[HMServiceDaemon sharedHMServiceDaemon];
      [v8 reportDeviceRecordChange:v7];

      [(HMDeviceManager *)self _deviceSetOffListeningModeAllowedIfNeeded:v7];
    }
  }
  else if (gLogCategory_HMDeviceManager <= 90 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_sendHearingAidConfigOverAHPSConnection:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  double v9 = COERCE_DOUBLE(a4);
  id v10 = a5;
  id v11 = [(NSMutableDictionary *)self->_deviceAHPSConnectionManagerMap objectForKeyedSubscript:*(void *)&v9];
  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:*(void *)&v9];
    if (v12)
    {
      if ([v8 needsUpdateToAHPSConnectionManagerForDevice:v12])
      {
        id v13 = [v12 configDataHearingAid];
        id v14 = v13;
        float v86 = 0.0;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        memset(v81, 0, sizeof(v81));
        if (v13)
        {
          [v13 getBytes:v81 length:100];
        }
        else if (gLogCategory_HMDeviceManager <= 30 {
               && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF();
        }
        LODWORD(v81[0]) = 6554113;
        id v16 = [v8 selectedAudiogram];

        if (v16)
        {
          id v17 = +[HMHealthKitUtilities sharedInstance];
          int v18 = [v8 selectedAudiogram];
          [v17 updateHMSettingsStruct:v81 fromAudiogram:v18];
        }
        if (gLogCategory_HMDeviceManager <= 30)
        {
          float v19 = *((float *)v81 + 1);
          float v20 = *((float *)&v83 + 1);
          if (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize())
          {
            double v69 = v19;
            LogPrintF();
          }
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            double v69 = v20;
            LogPrintF();
          }
        }
        id v21 = objc_msgSend(v12, "amplification", *(void *)&v69);
        [v21 floatValue];
        float v23 = v22;

        int v24 = [v8 amplification];

        if (v24)
        {
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            id v25 = [v8 amplification];
            [v25 floatValue];
            double v71 = v23;
            double v72 = v26;
            double v70 = v9;
            LogPrintF();
          }
          v27 = objc_msgSend(v8, "amplification", *(void *)&v70, *(void *)&v71, *(void *)&v72);
          [v27 floatValue];
          float v23 = v28;
        }
        v29 = [v12 balance];
        [v29 floatValue];
        float v31 = v30;

        int v32 = [v8 balance];

        if (v32)
        {
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            v33 = [v8 balance];
            [v33 floatValue];
            double v71 = v31;
            double v72 = v34;
            double v70 = v9;
            LogPrintF();
          }
          v35 = objc_msgSend(v8, "balance", *(void *)&v70, *(void *)&v71, *(void *)&v72);
          [v35 floatValue];
          float v31 = v36;
        }
        v37 = [v12 beamFormer];
        [v37 floatValue];
        float v39 = v38;

        int v40 = [v8 beamFormer];

        if (v40)
        {
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            v41 = [v8 beamFormer];
            [v41 floatValue];
            double v71 = v39;
            double v72 = v42;
            double v70 = v9;
            LogPrintF();
          }
          v43 = objc_msgSend(v8, "beamFormer", *(void *)&v70, *(void *)&v71, *(void *)&v72);
          [v43 floatValue];
          float v39 = v44;
        }
        v45 = [v12 noiseSuppression];
        [v45 floatValue];
        float v47 = v46;

        v48 = [v8 noiseSuppression];

        if (v48)
        {
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            v49 = [v8 noiseSuppression];
            [v49 floatValue];
            double v71 = v47;
            double v72 = v50;
            double v70 = v9;
            LogPrintF();
          }
          v51 = objc_msgSend(v8, "noiseSuppression", *(void *)&v70, *(void *)&v71, *(void *)&v72);
          [v51 floatValue];
          float v47 = v52;
        }
        v53 = [v12 tone];
        [v53 floatValue];
        float v55 = v54;

        int v56 = [v8 tone];

        if (v56)
        {
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            v57 = [v8 tone];
            [v57 floatValue];
            double v71 = v55;
            double v72 = v58;
            double v70 = v9;
            LogPrintF();
          }
          v59 = objc_msgSend(v8, "tone", *(void *)&v70, *(void *)&v71, *(void *)&v72);
          [v59 floatValue];
          float v55 = v60;
        }
        float v61 = v55 * 2.0 + -1.0;
        float v62 = v23 * 2.0 + -1.0;
        float v63 = v31 * 2.0 + -1.0;
        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          double v71 = v63;
          double v72 = v62;
          double v70 = v61;
          LogPrintF();
        }
        float v64 = fmax(fmin((float)(v62 - (float)(v63 * 0.5)), 1.5), -1.5);
        float v65 = fmax(fmin((float)((float)(v63 * 0.5) + v62), 1.5), -1.5);
        float v66 = fmaxf(fminf(v61, 1.0), -1.0);
        *(void *)((char *)&v82 + 4) = __PAIR64__(LODWORD(v66), LODWORD(v64));
        *(void *)((char *)&v85 + 4) = __PAIR64__(LODWORD(v66), LODWORD(v65));
        *((float *)&v82 + 3) = v39;
        *(float *)&long long v83 = v47;
        *((float *)&v85 + 3) = v39;
        float v86 = v47;
        if (gLogCategory_HMDeviceManager > 30) {
          goto LABEL_78;
        }
        if (gLogCategory_HMDeviceManager == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_78;
          }
          float v65 = *((float *)&v85 + 1);
          float v66 = *((float *)&v82 + 2);
          float v64 = *((float *)&v82 + 1);
          float v39 = *((float *)&v82 + 3);
          float v47 = *(float *)&v83;
        }
        double v75 = v39;
        double v76 = v47;
        double v73 = v62;
        double v74 = v63;
        double v71 = v65;
        double v72 = v66;
        double v70 = v64;
        LogPrintF();
LABEL_78:
        v67 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v81, 100, *(void *)&v70, *(void *)&v71, *(void *)&v72, *(void *)&v73, *(void *)&v74, *(void *)&v75, *(void *)&v76);
        v77[0] = MEMORY[0x263EF8330];
        v77[1] = 3221225472;
        v77[2] = __81__HMDeviceManager__sendHearingAidConfigOverAHPSConnection_identifier_completion___block_invoke;
        v77[3] = &unk_265362A40;
        v77[4] = self;
        id v78 = v67;
        id v79 = *(id *)&v9;
        id v80 = v10;
        id v68 = v67;
        [v11 writeHMSettingsConfigsData:v68 completion:v77];

        goto LABEL_79;
      }
      if (gLogCategory_HMDeviceManager <= 10
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v10) {
        (*((void (**)(id, void))v10 + 2))(v10, 0);
      }
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v15 = NSErrorF();
      if (v10) {
        (*((void (**)(id, void *))v10 + 2))(v10, v15);
      }
    }
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v12 = NSErrorF();
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v12);
    }
  }
LABEL_79:
}

uint64_t __81__HMDeviceManager__sendHearingAidConfigOverAHPSConnection_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!v3)
  {
    [*(id *)(a1 + 32) _hearingAidConfigDataReceived:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48)];
    id v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v6);
    id v3 = v6;
  }
  return MEMORY[0x270F9A758](v4, v3);
}

- (void)_throttleUpdatesForHearingAidConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  latestConfigsMap = self->_latestConfigsMap;
  if (!latestConfigsMap)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v13 = self->_latestConfigsMap;
    self->_latestConfigsMap = v12;

    latestConfigsMap = self->_latestConfigsMap;
  }
  [(NSMutableDictionary *)latestConfigsMap setObject:v8 forKeyedSubscript:v9];
  uint64_t v14 = [(NSMutableDictionary *)self->_throttleTimerMap objectForKeyedSubscript:v9];
  if (v14)
  {
    id v15 = v14;
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    throttleTimerMap = self->_throttleTimerMap;
    if (!throttleTimerMap)
    {
      int v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      float v19 = self->_throttleTimerMap;
      self->_throttleTimerMap = v18;

      throttleTimerMap = self->_throttleTimerMap;
    }
    [(NSMutableDictionary *)throttleTimerMap setObject:v16 forKeyedSubscript:v9];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __77__HMDeviceManager__throttleUpdatesForHearingAidConfig_identifier_completion___block_invoke;
    handler[3] = &unk_265362AB8;
    id v15 = v16;
    id v21 = v15;
    float v22 = self;
    id v23 = v9;
    int v24 = v10;
    dispatch_source_set_event_handler(v15, handler);
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CUDispatchTimerSet();
    dispatch_activate(v15);
  }
}

void __77__HMDeviceManager__throttleUpdatesForHearingAidConfig_identifier_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v2 == v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 72) objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v9 = (id)v4;
    if (v4)
    {
      [*(id *)(a1 + 40) _sendHearingAidConfigOverAHPSConnection:v4 identifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
      uint64_t v5 = 72;
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 32);
        LogPrintF();
      }
      id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "objectForKeyedSubscript:", *(void *)(a1 + 48), v7, v8);
      dispatch_source_cancel(v6);

      uint64_t v5 = 88;
    }
    [*(id *)(*(void *)(a1 + 40) + v5) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

- (void)_cloudServicesClientEnsureStarted
{
  p_cloudServicesClient = &self->_cloudServicesClient;
  uint64_t v4 = self->_cloudServicesClient;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F28928]);
    [v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_cloudServicesClient, v5);
    [v5 setInvalidationHandler:&__block_literal_global_369];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke_2;
    v9[3] = &unk_265362AE0;
    v9[4] = self;
    [v5 setHmDeviceCloudRecordUpdateHandler:v9];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke_3;
    v6[3] = &unk_2653629C8;
    uint64_t v4 = (AACloudServicesClient *)v5;
    uint64_t v7 = v4;
    uint64_t v8 = self;
    [(AACloudServicesClient *)v4 activateWithCompletion:v6];
  }
}

void __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _updateCloudRecords:v3];
}

uint64_t __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 24))
  {
    if (v3)
    {
      id v9 = v3;
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        id v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_HMDeviceManager <= 30)
    {
      id v9 = 0;
      if (gLogCategory_HMDeviceManager != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = 0, v3))
      {
        id v3 = (id)LogPrintF();
LABEL_11:
        id v4 = v9;
      }
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_cloudServicesClientEnsureStopped
{
  if (self->_cloudServicesClient)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(AACloudServicesClient *)self->_cloudServicesClient invalidate];
    cloudServicesClient = self->_cloudServicesClient;
    self->_cloudServicesClient = 0;
  }
}

- (void)_saveCloudRecordForDevice:(id)a3 withConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudRecord];
  if (!v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F28968]);
    id v10 = [v6 bluetoothAddress];
    id v8 = (void *)[v9 initWithBluetoothAddress:v10];

    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v17 = v7;
      LogPrintF();
    }
  }
  int v11 = objc_msgSend(v7, "enableMediaAssist", v17);
  BOOL v12 = v11 != 0;
  if (v11)
  {
    objc_msgSend(v8, "setMediaAssistEnabled:", objc_msgSend(v7, "enableMediaAssist"));
    if ([v7 enableMediaAssist] == 2)
    {
      objc_msgSend(v8, "setPmeMediaEnabled:", objc_msgSend(v6, "pmeMediaEnabled"));
      objc_msgSend(v8, "setPmeVoiceEnabled:", objc_msgSend(v6, "pmeVoiceEnabled"));
    }
  }
  if ([v7 enableHearingAid] == 2)
  {
    objc_msgSend(v8, "setSwipeGainEnabled:", objc_msgSend(v6, "swipeGainEnabled"));
    BOOL v12 = 1;
  }
  int v13 = [v6 hearingAssistRegionStatus];
  if (v13 != [v8 haRegionStatus])
  {
    objc_msgSend(v8, "setHaRegionStatus:", objc_msgSend(v6, "hearingAssistRegionStatus"));
    BOOL v12 = 1;
  }
  int v14 = [v6 hearingProtectionRegionStatus];
  if (v14 == [v8 hpRegionStatus])
  {
    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v8, "setHpRegionStatus:", objc_msgSend(v6, "hearingProtectionRegionStatus"));
  }
  if ([v6 updateWithCloudRecordInfo:v8])
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v18 = v6;
      LogPrintF();
    }
    id v15 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v15 reportDeviceRecordChange:v6];
  }
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  cloudServicesClient = self->_cloudServicesClient;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__HMDeviceManager__saveCloudRecordForDevice_withConfig___block_invoke;
  v19[3] = &unk_265362B08;
  id v20 = v8;
  [(AACloudServicesClient *)cloudServicesClient modifyHMDeviceCloudRecordInfo:v20 completion:v19];

LABEL_28:
}

uint64_t __56__HMDeviceManager__saveCloudRecordForDevice_withConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HMDeviceManager <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HMDeviceManager != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_loadCloudRecordForDevice:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  cloudServicesClient = self->_cloudServicesClient;
  id v6 = [v4 bluetoothAddress];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HMDeviceManager__loadCloudRecordForDevice___block_invoke;
  v8[3] = &unk_265362B30;
  id v7 = v4;
  id v10 = self;
  int v11 = v12;
  id v9 = v7;
  [(AACloudServicesClient *)cloudServicesClient fetchHMDeviceCloudRecordInfoWithAddress:v6 completion:v8];

  _Block_object_dispose(v12, 8);
}

void __45__HMDeviceManager__loadCloudRecordForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  if (v5)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v18 = [*(id *)(a1 + 32) bluetoothAddress];
      id v20 = v5;
      LogPrintF();
    }
  }
  else if (gLogCategory_HMDeviceManager <= 30 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    id v18 = v21;
    LogPrintF();
  }
  id v6 = v21;
  if (!v21)
  {
    id v7 = objc_alloc(MEMORY[0x263F28968]);
    id v8 = [*(id *)(a1 + 32) bluetoothAddress];
    id v22 = (id)[v7 initWithBluetoothAddress:v8];

    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v18 = v22;
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v6 = v22;
  }
  id v23 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setCloudRecordLoaded:", 1, v18, v20);
  if ([*(id *)(a1 + 32) updateWithCloudRecordInfo:v23])
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      LogPrintF();
    }
    id v9 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v9 reportDeviceRecordChange:*(void *)(a1 + 32)];
  }
  id v10 = *(void **)(*(void *)(a1 + 40) + 56);
  int v11 = [*(id *)(a1 + 32) bluetoothUUID];
  BOOL v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    [v12 setIsNewPairing:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    [*(id *)(a1 + 40) _checkForOcclusionInDiagnosticRecord:v12 forDevice:*(void *)(a1 + 32)];
    [v12 submitMetricsForOcclusionPolicy];
  }
  else
  {
    if (!*(void *)(*(void *)(a1 + 40) + 56))
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = *(void **)(v14 + 56);
      *(void *)(v14 + 56) = v13;
    }
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F472E0]) initWithHMDeviceRecord:*(void *)(a1 + 32) isNewPairing:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    dispatch_source_t v16 = *(void **)(*(void *)(a1 + 40) + 56);
    id v17 = [*(id *)(a1 + 32) bluetoothUUID];
    [v16 setObject:v12 forKeyedSubscript:v17];

    [v12 updateFaultCountsFromCloudRecord:v23];
    [*(id *)(a1 + 40) _computeOcclusionResultFromFaultCountsInRecord:v12 forDevice:*(void *)(a1 + 32)];
  }
}

- (void)_updateCloudRecords:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  deviceRecordMap = self->_deviceRecordMap;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__HMDeviceManager__updateCloudRecords___block_invoke;
  v7[3] = &unk_265362B58;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)deviceRecordMap enumerateKeysAndObjectsUsingBlock:v7];
}

void __39__HMDeviceManager__updateCloudRecords___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 bluetoothAddress];
        int v11 = [v10 lowercaseString];
        BOOL v12 = [v4 bluetoothAddress];
        id v13 = [v12 lowercaseString];
        id v14 = v11;
        id v15 = v13;
        if (v14 == v15)
        {

LABEL_11:
          if (![v4 updateWithCloudRecordInfo:v9]) {
            continue;
          }
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            id v18 = v4;
            LogPrintF();
          }
          id v10 = +[HMServiceDaemon sharedHMServiceDaemon];
          [v10 reportDeviceRecordChange:v4];
LABEL_18:

          continue;
        }
        dispatch_source_t v16 = v15;
        if ((v14 == 0) == (v15 != 0))
        {

          goto LABEL_18;
        }
        char v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)_registerForHearingAccessibilitySettingsUpdate
{
  id v3 = [MEMORY[0x263F47538] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__HMDeviceManager__registerForHearingAccessibilitySettingsUpdate__block_invoke;
  v4[3] = &unk_265362650;
  v4[4] = self;
  [v3 registerUpdateBlock:v4 forRetrieveSelector:sel_activeHearingProtectionEnabled withListener:self];
}

void __65__HMDeviceManager__registerForHearingAccessibilitySettingsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDeviceManager__registerForHearingAccessibilitySettingsUpdate__block_invoke_2;
  block[3] = &unk_265362650;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __65__HMDeviceManager__registerForHearingAccessibilitySettingsUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__HMDeviceManager__registerForHearingAccessibilitySettingsUpdate__block_invoke_3;
  v4[3] = &unk_265362B58;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __65__HMDeviceManager__registerForHearingAccessibilitySettingsUpdate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveHearingProtectionSettingsForDevice:");
}

- (void)_unregisterFromHearingAccessibilitySettingsUpdate
{
  id v3 = [MEMORY[0x263F47538] sharedInstance];
  [v3 registerUpdateBlock:0 forRetrieveSelector:sel_activeHearingProtectionEnabled withListener:self];
}

- (void)_retrieveHearingProtectionSettingsForDevice:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x263F47538] sharedInstance];
  uint64_t v5 = [v10 bluetoothAddress];
  uint64_t v6 = [v4 activeHearingProtectionEnabledForAddress:v5];

  if ([v10 updateWithHearingProtectionValue:v6])
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = v6;
      id v9 = v10;
      LogPrintF();
    }
    uint64_t v7 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v7 reportDeviceRecordChange:v10];

    [(HMDeviceManager *)self _deviceSetOffListeningModeAllowedIfNeeded:v10];
  }
}

- (void)_setHearingProtectionEnabledForDevice:(id)a3 withConfig:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if ([v5 enableHearingProtection])
  {
    int v6 = [v5 enableHearingProtection];
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v9 = [v11 bluetoothUUID];
      BOOL v10 = v6 == 1;
      LogPrintF();
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x263F47538], "sharedInstance", v9, v10);
    uint64_t v8 = [v11 bluetoothAddress];
    [v7 setActiveHearingProtectionEnabled:v6 == 1 forAddress:v8];
  }
}

- (void)_checkForOcclusionInDiagnosticRecord:(id)a3 forDevice:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if ([v16 isOcclusionDetectionSupported])
  {
    uint64_t v7 = [v16 measurementInvalidReason];
    if (v7)
    {
      if ([v16 isDeviceUsedFor3MonthsOrLess])
      {
        [v6 setOcclusionResult:3 forFeatureID:2];
        [v6 setOcclusionResult:3 forFeatureID:3];
        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          id v14 = [v6 bluetoothUUID];
          LogPrintF();
        }
        id v11 = +[HMServiceDaemon sharedHMServiceDaemon];
        [v11 reportDeviceRecordChange:v6];
      }
      id v12 = v7;
    }
    else
    {
      uint64_t v8 = [v6 cloudRecord];
      int v9 = [v16 updateFaultCountsFromCloudRecord:v8];

      if (v9)
      {
        BOOL v10 = [v16 getCloudRecordForCurrentFaultCount];
        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          id v14 = v10;
          LogPrintF();
        }
        objc_msgSend(v6, "updateWithCloudRecordInfo:", v10, v14);
        [(AACloudServicesClient *)self->_cloudServicesClient modifyHMDeviceCloudRecordInfo:v10 completion:&__block_literal_global_396];
      }
      [(HMDeviceManager *)self _computeOcclusionResultFromFaultCountsInRecord:v16 forDevice:v6];
      id v12 = [v16 getOnDemandRetestReason];
      if (!v12) {
        goto LABEL_22;
      }
    }
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v14 = [v6 bluetoothUUID];
      id v15 = v12;
      LogPrintF();
    }
    id v13 = objc_msgSend(v6, "bluetoothUUID", v14, v15);
    [(HMDeviceManager *)self _triggerDiagnosticCheckForIdentifier:v13 completion:0];

LABEL_22:
  }
}

uint64_t __66__HMDeviceManager__checkForOcclusionInDiagnosticRecord_forDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HMDeviceManager <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HMDeviceManager != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_computeOcclusionResultFromFaultCountsInRecord:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __76__HMDeviceManager__computeOcclusionResultFromFaultCountsInRecord_forDevice___block_invoke;
  id v16 = &unk_265362650;
  id v7 = v6;
  id v17 = v7;
  uint64_t v8 = (void (**)(void))MEMORY[0x253398690](&v13);
  if ([v5 isOcclusionDetectionSupported])
  {
    uint64_t v9 = [v5 computeOcclusionResultForHearingProtection];
    uint64_t v10 = [v5 computeOcclusionResultForHearingTest];
    LODWORD(v9) = [v7 setOcclusionResult:v9 forFeatureID:2];
    if ((v9 | [v7 setOcclusionResult:v10 forFeatureID:3]) == 1)
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        id v12 = v7;
        LogPrintF();
      }
      id v11 = +[HMServiceDaemon sharedHMServiceDaemon];
      [v11 reportDeviceRecordChange:v7];
    }
  }
  v8[2](v8);
}

uint64_t __76__HMDeviceManager__computeOcclusionResultFromFaultCountsInRecord_forDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOcclusionResultReady:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 invokePendingOcclusionCompletionsWithError:0];
}

- (void)fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HMDeviceManager_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke;
  v13[3] = &unk_265362BA0;
  void v13[4] = self;
  id v14 = v8;
  int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __80__HMDeviceManager_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchOcclusionResultForDeviceIdentifier:*(void *)(a1 + 40) featureID:*(unsigned int *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v20 = a3;
  id v8 = (void (**)(id, uint64_t, void))a5;
  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v20];
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 occlusionResultReady])
      {
        v8[2](v8, [v10 getOcclusionResultForFeatureID:v6], 0);
        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v6 != 3 || !HMOcclusionResultIsOverallPassing()) {
          goto LABEL_20;
        }
        id v15 = [v10 bluetoothAddress];
        [(HMDeviceManager *)self _occlusionIndicationShownForDeviceAddress:v15 featureID:3 type:5 action:0];
      }
      else
      {
        id v11 = [v10 pendingOcclusionCompletionsMap];

        if (!v11)
        {
          id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v10 setPendingOcclusionCompletionsMap:v12];
        }
        uint64_t v13 = [v10 pendingOcclusionCompletionsMap];
        id v14 = [NSNumber numberWithInt:v6];
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (!v15) {
          id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        int v16 = (void *)MEMORY[0x253398690](v8);
        [v15 addObject:v16];

        id v17 = [v10 pendingOcclusionCompletionsMap];
        id v18 = [NSNumber numberWithInt:v6];
        [v17 setObject:v15 forKeyedSubscript:v18];

        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          uint64_t v19 = (void *)MEMORY[0x253398690](v8);
          LogPrintF();
        }
      }
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorF();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, id))v8)[2](v8, 0, v15);
    }

LABEL_20:
    goto LABEL_21;
  }
  if (gLogCategory_HMDeviceManager <= 90
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_21:
}

- (void)occlusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6
{
  id v10 = a3;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__HMDeviceManager_occlusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke;
  v13[3] = &unk_265362BC8;
  void v13[4] = self;
  id v14 = v10;
  int v15 = a4;
  int v16 = a5;
  int v17 = a6;
  id v12 = v10;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __82__HMDeviceManager_occlusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _occlusionIndicationShownForDeviceAddress:*(void *)(a1 + 40) featureID:*(unsigned int *)(a1 + 48) type:*(unsigned int *)(a1 + 52) action:*(unsigned int *)(a1 + 56)];
}

- (void)_occlusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  deviceRecordMap = self->_deviceRecordMap;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__HMDeviceManager__occlusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke;
  v18[3] = &unk_265362BF0;
  id v12 = v10;
  id v19 = v12;
  id v20 = &v21;
  [(NSMutableDictionary *)deviceRecordMap enumerateKeysAndObjectsUsingBlock:v18];
  uint64_t v13 = (void *)v22[5];
  if (v13)
  {
    diagnosticRecordMap = self->_diagnosticRecordMap;
    int v15 = [v13 bluetoothUUID];
    int v16 = [(NSMutableDictionary *)diagnosticRecordMap objectForKeyedSubscript:v15];

    if (v16)
    {
      [v16 occlusionIndicationShownForFeatureID:v8 type:v7 action:v6];
      [(HMDeviceManager *)self _computeOcclusionResultFromFaultCountsInRecord:v16 forDevice:v22[5]];
      if (v8 == 3 && (v7 - 3) <= 1)
      {
        int v17 = [(id)v22[5] bluetoothUUID];
        [(HMDeviceManager *)self _triggerDiagnosticCheckForIdentifier:v17 completion:0];
      }
    }
    else if (gLogCategory_HMDeviceManager <= 90 {
           && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_HMDeviceManager <= 90 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }

  _Block_object_dispose(&v21, 8);
}

void __83__HMDeviceManager__occlusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  uint64_t v7 = [v14 bluetoothAddress];
  uint64_t v8 = [v7 lowercaseString];
  id v9 = [*(id *)(a1 + 32) lowercaseString];
  id v10 = v8;
  id v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_6;
  }
  id v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_8;
  }
  char v13 = [v10 isEqual:v11];

  if (v13)
  {
LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
LABEL_8:
}

- (void)_resetFaultCountForDevice:(id)a3
{
  id v11 = a3;
  [v11 setOcclusionResult:0 forFeatureID:2];
  [v11 setOcclusionResult:0 forFeatureID:3];
  diagnosticRecordMap = self->_diagnosticRecordMap;
  id v5 = [v11 bluetoothUUID];
  uint64_t v6 = [(NSMutableDictionary *)diagnosticRecordMap objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 resetFaultCounts];
    uint64_t v7 = [v6 getCloudRecordForCurrentFaultCount];
    if (gLogCategory_HMDeviceManager <= 10
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v9 = v7;
      LogPrintF();
    }
    objc_msgSend(v11, "updateWithCloudRecordInfo:", v7, v9);
    [(AACloudServicesClient *)self->_cloudServicesClient modifyHMDeviceCloudRecordInfo:v7 completion:&__block_literal_global_412];
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    uint64_t v8 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v8 reportDeviceRecordChange:v11];

    goto LABEL_14;
  }
  if (gLogCategory_HMDeviceManager <= 10
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [v11 bluetoothUUID];
    LogPrintF();
LABEL_14:
  }
}

uint64_t __45__HMDeviceManager__resetFaultCountForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HMDeviceManager <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HMDeviceManager != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_triggerHearingProtectionOcclusionNotificationIfNeeded:(id)a3
{
  id v26 = a3;
  uint64_t v4 = [v26 hearingProtectionOcclusionResult];
  id v5 = v26;
  if (!v4) {
    goto LABEL_28;
  }
  uint64_t v4 = [v26 hearingProtectionCapability];
  id v5 = v26;
  if (v4 != 1) {
    goto LABEL_28;
  }
  uint64_t v4 = [v26 hearingProtectionRegionStatus];
  id v5 = v26;
  if (v4 != 2) {
    goto LABEL_28;
  }
  uint64_t v4 = [v26 currentNoiseLevel];
  id v5 = v26;
  if (v4 != 2) {
    goto LABEL_28;
  }
  uint64_t v6 = [v26 aaDevice];
  if ([v6 audioStreamState] == 1)
  {

    id v5 = v26;
  }
  else
  {
    uint64_t v7 = [v26 aaDevice];
    int v8 = [v7 audioStreamState];

    id v5 = v26;
    if (v8) {
      goto LABEL_28;
    }
  }
  id v9 = [v5 aaDevice];
  if ([v9 primaryPlacement] == 1)
  {
    id v10 = [v26 aaDevice];
    int v11 = [v10 secondaryPlacement];

    id v5 = v26;
    if (v11 == 1) {
      goto LABEL_13;
    }
  }
  else
  {

    id v5 = v26;
  }
  id v12 = [v5 aaDevice];
  int v13 = [v12 placementMode];

  id v5 = v26;
  if (v13 == 1) {
    goto LABEL_28;
  }
LABEL_13:
  id v14 = [v5 aaDevice];
  if ([v14 listeningMode] != 4)
  {
    int v15 = [v26 aaDevice];
    if ([v15 listeningMode] != 3)
    {
      int v16 = [v26 aaDevice];
      int v17 = [v16 listeningMode];

      id v5 = v26;
      if (v17 != 2) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
  }
  id v5 = v26;
LABEL_18:
  if ([v5 hearingProtectionOcclusionResult] != 2)
  {
    uint64_t v4 = [v26 hearingProtectionOcclusionResult];
    id v5 = v26;
    if (v4 != 3) {
      goto LABEL_28;
    }
    id v20 = [v26 bluetoothAddress];
    [(HMDeviceManager *)self _occlusionIndicationShownForDeviceAddress:v20 featureID:2 type:2 action:0];
    goto LABEL_27;
  }
  id v18 = +[HMOcclusionNotification sharedInstance];
  occlusionNotification = self->_occlusionNotification;
  self->_occlusionNotification = v18;

  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v25 = [(HMOcclusionNotification *)self->_occlusionNotification shouldShowHearingProtectionOcclusionNotification];
    LogPrintF();
  }
  uint64_t v4 = [(HMOcclusionNotification *)self->_occlusionNotification shouldShowHearingProtectionOcclusionNotification];
  id v5 = v26;
  if (v4)
  {
    uint64_t v21 = [v26 aaDevice];
    long long v22 = [v21 coreBluetoothDevice];
    uint64_t v23 = [v22 productID];

    int v24 = self->_occlusionNotification;
    id v20 = [v26 bluetoothAddress];
    [(HMOcclusionNotification *)v24 showHearingProtectionOcclusionNotification:v23 forAddress:v20];
LABEL_27:

    id v5 = v26;
  }
LABEL_28:
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_deviceSetOffListeningModeAllowedIfNeeded:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    id v5 = [v4 aaDevice];
    if ([v5 hideOffListeningModeCapability] == 2
      && [v4 hearingProtectionEnabled]
      && ![v5 listeningModeOffAllowed])
    {
      if ([v4 hearingProtectionEnabled] == 2)
      {
        char v6 = 1;
      }
      else if ([v4 hearingProtectionEnabled] == 1)
      {
        BOOL v7 = [v5 listeningMode] == 1;
        if (([v5 listeningModeConfigs] | v7)) {
          char v6 = 1;
        }
        else {
          char v6 = 2;
        }
      }
      else
      {
        char v6 = 0;
      }
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        int v8 = [v5 identifier];
        [v5 listeningMode];
        [v5 listeningModeConfigs];
        int v13 = CUPrintFlags32();
        LogPrintF();
      }
      id v9 = objc_alloc_init(MEMORY[0x263F28938]);
      [v9 setListeningModeOffAllowed:v6];
      deviceManager = self->_deviceManager;
      int v11 = [v5 identifier];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__HMDeviceManager__deviceSetOffListeningModeAllowedIfNeeded___block_invoke;
      v14[3] = &unk_2653629C8;
      id v15 = v9;
      int v16 = v5;
      id v12 = v9;
      [(AADeviceManager *)deviceManager sendDeviceConfig:v12 identifier:v11 completion:v14];
    }
  }
}

uint64_t __61__HMDeviceManager__deviceSetOffListeningModeAllowedIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (gLogCategory_HMDeviceManager <= 90)
    {
      id v7 = v3;
      if (gLogCategory_HMDeviceManager != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v7, v3))
      {
        char v6 = [*(id *)(a1 + 40) identifier];
        LogPrintF();

        id v4 = v7;
      }
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_updatePersonalAudioConfigForIdentifier:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(NSMutableDictionary *)self->_deviceRecordMap objectForKeyedSubscript:v4];
    char v6 = v5;
    if (!v5)
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_52;
    }
    id v7 = [v5 bluetoothAddress];
    if (v7)
    {
      if ([v6 pmeMediaEnabled] && objc_msgSend(v6, "pmeVoiceEnabled"))
      {
        id v40 = 0;
        long long v38 = 0u;
        long long v39 = 0u;
        if ([v6 hearingAssistEnabled] == 1)
        {
          uint64_t v8 = [v6 earLossArrayLeft];
          id v9 = (void *)*((void *)&v39 + 1);
          *((void *)&v39 + 1) = v8;

          id v10 = [v6 earLossArrayRight];
          id v11 = v40;
          id v40 = v10;

          uint64_t v12 = [v6 earLossArrayLeft];
          int v13 = (void *)*((void *)&v38 + 1);
          *((void *)&v38 + 1) = v12;

          [v6 earLossArrayRight];
          *(void *)&v39 = id v14 = (void *)v39;
        }
        else
        {
          id v15 = [v6 pmeMediaLossDataLeft];
          uint64_t v16 = HMEarLossDataToArray();
          int v17 = (void *)*((void *)&v39 + 1);
          *((void *)&v39 + 1) = v16;

          id v18 = [v6 pmeMediaLossDataRight];
          id v19 = HMEarLossDataToArray();
          id v20 = v40;
          id v40 = v19;

          uint64_t v21 = [v6 pmeVoiceLossDataLeft];
          uint64_t v22 = HMEarLossDataToArray();
          uint64_t v23 = (void *)*((void *)&v38 + 1);
          *((void *)&v38 + 1) = v22;

          id v14 = [v6 pmeVoiceLossDataRight];
          uint64_t v24 = HMEarLossDataToArray();
          uint64_t v25 = (void *)v39;
          *(void *)&long long v39 = v24;
        }
        if (*((void *)&v39 + 1) && v40)
        {
          BYTE1(v38) = [v6 pmeMediaEnabled] == 1;
          int v26 = [v6 pmeVoiceEnabled];
          LOBYTE(v38) = v26 == 1;
          BOOL v27 = v26 == 1 || BYTE1(v38) != 0;
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            float v28 = "no";
            if (v27) {
              float v28 = "yes";
            }
            int v32 = v28;
            LogPrintF();
          }
          v29 = objc_msgSend(MEMORY[0x263F5D458], "sharedInstance", v32);
          [v29 setPersonalMediaEnabled:v27 forRouteUID:v7];

          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            float v30 = [*((id *)&v39 + 1) firstObject];
            [v40 firstObject];
            v37 = float v36 = v30;
            uint64_t v34 = BYTE1(v38);
            uint64_t v35 = v38;
            v33 = v7;
            LogPrintF();
          }
          float v31 = objc_msgSend(MEMORY[0x263F5D458], "sharedInstance", v33, v34, v35, v36, v37);
          [v31 updateConfiguration:&v38 forRouteID:v7];
        }
        else if (gLogCategory_HMDeviceManager <= 30 {
               && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF();
        }
        __destructor_8_s8_s16_s24_s32((uint64_t)&v38);
        goto LABEL_51;
      }
      if (gLogCategory_HMDeviceManager > 30
        || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
      {
LABEL_51:

LABEL_52:
        goto LABEL_53;
      }
    }
    else if (gLogCategory_HMDeviceManager > 90 {
           || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_51;
    }
    LogPrintF();
    goto LABEL_51;
  }
  if (gLogCategory_HMDeviceManager <= 90
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_53:
}

- (void)_deviceRescindHearingAssist:(id)a3
{
  id v4 = a3;
  if ([v4 hearingAssistEnrolled] == 1)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F472D8]);
    [v5 setEnableHearingAssist:2];
    [v5 setEnableMediaAssist:2];
    if ([v4 hearingAidEnabled])
    {
      [v5 setEnableHearingAid:2];
      [v5 setEnableSwipeGain:2];
    }
    if ([v4 mediaAssistEnabled] == 1)
    {
      [v5 setEnablePMEMedia:2];
      [v5 setEnablePMEVoice:2];
    }
    char v6 = [v4 bluetoothUUID];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__HMDeviceManager__deviceRescindHearingAssist___block_invoke;
    v8[3] = &unk_265362B08;
    id v9 = v5;
    id v7 = v5;
    [(HMDeviceManager *)self _modifyDeviceConfiguration:v7 identifier:v6 completion:v8];
  }
  else if (gLogCategory_HMDeviceManager <= 30 {
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __47__HMDeviceManager__deviceRescindHearingAssist___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (gLogCategory_HMDeviceManager <= 30)
    {
      id v5 = v2;
      if (gLogCategory_HMDeviceManager != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
      {
LABEL_7:
        id v2 = (id)LogPrintF();
        id v3 = v5;
      }
    }
  }
  else if (gLogCategory_HMDeviceManager <= 30)
  {
    id v5 = 0;
    if (gLogCategory_HMDeviceManager != -1) {
      goto LABEL_7;
    }
    id v2 = (id)_LogCategory_Initialize();
    id v3 = 0;
    if (v2) {
      goto LABEL_7;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (BOOL)_deviceUpdateRegionStatus:(id)a3
{
  id v4 = a3;
  if (gLogCategory_HMDeviceManager <= 10
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    int v17 = [v4 bluetoothUUID];
    LogPrintF();
  }
  if (_os_feature_enabled_impl()
    && (int v5 = [v4 hearingAssistRegionStatus],
        +[HMHealthKitUtilities sharedInstance],
        char v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 getRegionSupportStatusForFeatureID:*MEMORY[0x263F09758]],
        v6,
        v5 != v7))
  {
    [v4 setHearingAssistRegionStatus:v7];
    if (v7 == 3) {
      [(HMDeviceManager *)self _deviceRescindHearingAssist:v4];
    }
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  if (_os_feature_enabled_impl())
  {
    int v9 = [v4 hearingProtectionRegionStatus];
    id v10 = +[HMHealthKitUtilities sharedInstance];
    uint64_t v11 = [v10 getRegionSupportStatusForFeatureID:*MEMORY[0x263F09760]];

    if (v9 != v11)
    {
      [v4 setHearingProtectionRegionStatus:v11];
      int v8 = 1;
    }
  }
  if (_os_feature_enabled_impl())
  {
    int v12 = [v4 hearingTestRegionStatus];
    int v13 = +[HMHealthKitUtilities sharedInstance];
    uint64_t v14 = [v13 getRegionSupportStatusForFeatureID:*MEMORY[0x263F09768]];

    if (v12 != v14)
    {
      [v4 setHearingTestRegionStatus:v14];
      goto LABEL_19;
    }
  }
  if (v8)
  {
LABEL_19:
    -[HMDeviceManager _saveCloudRecordForDevice:withConfig:](self, "_saveCloudRecordForDevice:withConfig:", v4, 0, v17);
    BOOL v15 = 1;
    goto LABEL_20;
  }
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (void)_registerForRegionStatusUpdates
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__HMDeviceManager__registerForRegionStatusUpdates__block_invoke;
  v3[3] = &unk_265362650;
  v3[4] = self;
  id v2 = +[HMHealthKitUtilities sharedInstance];
  [v2 setFeatureStatusChangedHandler:v3];
}

uint64_t __50__HMDeviceManager__registerForRegionStatusUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__HMDeviceManager__registerForRegionStatusUpdates__block_invoke_2;
  v4[3] = &unk_265362B58;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __50__HMDeviceManager__registerForRegionStatusUpdates__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_deviceUpdateRegionStatus:"))
  {
    id v4 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v4 reportDeviceRecordChange:v5];
  }
}

- (void)_unregisterFromRegionStatusUpdates
{
  id v2 = +[HMHealthKitUtilities sharedInstance];
  [v2 setFeatureStatusChangedHandler:0];
}

- (void)_distributedNotificationReceived:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMDeviceManager__distributedNotificationReceived___block_invoke;
  v7[3] = &unk_265362628;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __52__HMDeviceManager__distributedNotificationReceived___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  if (v2)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      v29 = [*(id *)(a1 + 32) userInfo];
      LogPrintF();
    }
    id v3 = objc_msgSend(v2, "objectForKeyedSubscript:", @"msg-identifier", v29);
    id v4 = [v2 objectForKeyedSubscript:@"msg-data"];
    id v5 = [v2 objectForKeyedSubscript:@"bt-address"];
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    long long v38 = __Block_byref_object_dispose__0;
    id v39 = 0;
    id v6 = *(void **)(*(void *)(a1 + 40) + 48);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __52__HMDeviceManager__distributedNotificationReceived___block_invoke_2;
    v31[3] = &unk_265362BF0;
    id v7 = v5;
    id v32 = v7;
    v33 = &v34;
    [v6 enumerateKeysAndObjectsUsingBlock:v31];
    if (!v35[5])
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_40;
    }
    id v8 = v3;
    int v9 = v8;
    if (v8 == @"occlusion-test") {
      goto LABEL_13;
    }
    if (!v8) {
      goto LABEL_27;
    }
    int v10 = [(__CFString *)v8 isEqual:@"occlusion-test"];

    if (v10)
    {
LABEL_13:
      uint64_t v11 = *(void **)(a1 + 40);
      int v12 = [(id)v35[5] bluetoothUUID];
      [v11 _diagnosticDataReceived:v4 identifier:v12 isInternal:1];
    }
    int v13 = v9;
    uint64_t v14 = v13;
    if (v13 == @"reset-occlusion-counts") {
      goto LABEL_17;
    }
    if (v13)
    {
      int v15 = [(__CFString *)v13 isEqual:@"reset-occlusion-counts"];

      if (!v15)
      {
LABEL_18:
        uint64_t v16 = v14;
        int v17 = v16;
        if (v16 == @"override-occlusion-result") {
          goto LABEL_21;
        }
        if (v16)
        {
          int v18 = [(__CFString *)v16 isEqual:@"override-occlusion-result"];

          if (!v18)
          {
LABEL_35:
            int v26 = v17;
            if (v26 == @"override-bud-to-source-context")
            {
LABEL_38:
              float v28 = *(void **)(a1 + 40);
              uint64_t v24 = [(id)v35[5] bluetoothUUID];
              [v28 _multimodalContextMessageReceived:v4 identifier:v24];
              goto LABEL_39;
            }
            uint64_t v24 = v26;
            if (v26)
            {
              int v27 = [(__CFString *)v26 isEqual:@"override-bud-to-source-context"];

              if (!v27)
              {
LABEL_40:

                _Block_object_dispose(&v34, 8);
                goto LABEL_41;
              }
              goto LABEL_38;
            }
LABEL_39:

            goto LABEL_40;
          }
LABEL_21:
          id v19 = [v2 objectForKeyedSubscript:@"feature-ID"];
          uint64_t v20 = [v19 intValue];

          uint64_t v21 = [v2 objectForKeyedSubscript:@"occlusion-result"];
          uint64_t v22 = [v21 intValue];

          [(id)v35[5] setOcclusionResult:v22 forFeatureID:v20];
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            uint64_t v30 = v35[5];
            LogPrintF();
          }
          uint64_t v25 = +[HMServiceDaemon sharedHMServiceDaemon];
          [v25 reportDeviceRecordChange:v35[5]];

          goto LABEL_35;
        }
LABEL_28:

        uint64_t v24 = v9;
        goto LABEL_39;
      }
LABEL_17:
      [*(id *)(a1 + 40) _resetFaultCountForDevice:v35[5]];
      goto LABEL_18;
    }
LABEL_27:

    uint64_t v23 = v9;
    goto LABEL_28;
  }
  if (gLogCategory_HMDeviceManager <= 90
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_41:
}

void __52__HMDeviceManager__distributedNotificationReceived___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  id v7 = [v14 bluetoothAddress];
  id v8 = [v7 lowercaseString];
  int v9 = [*(id *)(a1 + 32) lowercaseString];
  id v10 = v8;
  id v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_6;
  }
  int v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_8;
  }
  char v13 = [v10 isEqual:v11];

  if (v13)
  {
LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
LABEL_8:
}

- (void)_registerForInternalDistributedNotification
{
  if (!self->_distributedNotificationObserving && IsAppleInternalBuild())
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = [MEMORY[0x263F087C8] defaultCenter];
    [v3 addObserver:self selector:sel__distributedNotificationReceived_ name:@"com.apple.HearingModeService" object:0];
    self->_distributedNotificationObserving = 1;
  }
}

- (void)_unregisterFromInternalDistributedNotification
{
  if (self->_distributedNotificationObserving)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = [MEMORY[0x263F087C8] defaultCenter];
    [v3 removeObserver:self name:@"com.apple.HearingModeService" object:0];
    self->_distributedNotificationObserving = 0;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_throttleTimerMap, 0);
  objc_storeStrong((id *)&self->_occlusionNotification, 0);
  objc_storeStrong((id *)&self->_latestConfigsMap, 0);
  objc_storeStrong((id *)&self->_diagnosticRecordMap, 0);
  objc_storeStrong((id *)&self->_deviceRecordMap, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_deviceAHPSConnectionManagerMap, 0);
  objc_storeStrong((id *)&self->_cloudServicesClient, 0);
  objc_storeStrong((id *)&self->_aaController, 0);
}

@end
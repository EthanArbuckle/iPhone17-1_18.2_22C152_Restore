@interface HUHearingAidSettings
+ (id)sharedInstance;
- (BOOL)anyGizmoLiveHeadphoneLevelEnabled;
- (BOOL)clearPartialPairing;
- (BOOL)exportsLiveListenToFile;
- (BOOL)gizmoLiveHeadphoneLevelEnabled;
- (BOOL)gizmoLiveHeadphoneLevelNPEnabled;
- (BOOL)independentHearingAidSettings;
- (BOOL)isDeviceIDOnCloudDenylist:(id)a3;
- (BOOL)isPairedWithFakeHearingAids;
- (BOOL)isPairedWithRealHearingAids;
- (BOOL)isiCloudPaired;
- (BOOL)liveHeadphoneLevelEnabled;
- (BOOL)multideviceAudioEnabled;
- (BOOL)multideviceSettingsEnabled;
- (BOOL)shouldPushLocalAidsToiCloud;
- (BOOL)shouldStoreLocally;
- (BOOL)shouldStreamSystemSounds;
- (BOOL)shouldStreamToLeftAid;
- (BOOL)shouldStreamToRightAid;
- (BOOL)shouldUseiCloud;
- (HUHearingAidSettings)init;
- (NSArray)peripheralUUIDs;
- (NSDictionary)knownPeripheralUUIDs;
- (NSDictionary)pairedHearingAids;
- (NSString)availableHearingDeviceName;
- (OS_dispatch_queue)icloudInitializationQueue;
- (id)convertPersistentRepresentation:(id)a3 fromVersion:(float)a4 toVersion:(float)a5;
- (id)deviceIDForPairingInformation:(id)a3;
- (id)keysToSync;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (id)preferenceKeyForSelector:(SEL)a3;
- (int)availableInputEars;
- (int)earsSupportingWatch;
- (int)preferredInputEar;
- (int64_t)callAudioRoute;
- (int64_t)complicationPreferredDisplayMode;
- (int64_t)mediaAudioRoute;
- (unint64_t)hearingAidsLEAVersionFromiCloud;
- (unint64_t)usedHearingFeatures;
- (void)_initializeICloudSetup;
- (void)_updateTripleClickOptionsForPairedAids:(id)a3;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)addDeviceIDToCloudDenylist:(id)a3;
- (void)dealloc;
- (void)iCloudAccountDidChange:(id)a3;
- (void)icloudHearingSettingsDidChange:(id)a3;
- (void)logMessage:(id)a3;
- (void)pairedWatchDidChange:(id)a3;
- (void)pushLocalHearingAidsToiCloud;
- (void)removeDeviceIDFromCloudDenylist:(id)a3;
- (void)setAnyGizmoLiveHeadphoneLevelEnabled:(BOOL)a3;
- (void)setAvailableHearingDeviceName:(id)a3;
- (void)setAvailableInputEars:(int)a3;
- (void)setCallAudioRoute:(int64_t)a3;
- (void)setClearPartialPairing:(BOOL)a3;
- (void)setComplicationPreferredDisplayMode:(int64_t)a3;
- (void)setEarsSupportingWatch:(int)a3;
- (void)setExportsLiveListenToFile:(BOOL)a3;
- (void)setGizmoLiveHeadphoneLevelEnabled:(BOOL)a3;
- (void)setGizmoLiveHeadphoneLevelNPEnabled:(BOOL)a3;
- (void)setIcloudInitializationQueue:(id)a3;
- (void)setIndependentHearingAidSettings:(BOOL)a3;
- (void)setKnownPeripheralUUIDs:(id)a3;
- (void)setLiveHeadphoneLevelEnabled:(BOOL)a3;
- (void)setLocalHearingAidsFromiCloud:(id)a3;
- (void)setMediaAudioRoute:(int64_t)a3;
- (void)setMultideviceAudioEnabled:(BOOL)a3;
- (void)setMultideviceSettingsEnabled:(BOOL)a3;
- (void)setPairedHearingAids:(id)a3;
- (void)setPreferredInputEar:(int)a3;
- (void)setShouldStreamSystemSounds:(BOOL)a3;
- (void)setShouldStreamToLeftAid:(BOOL)a3;
- (void)setShouldStreamToRightAid:(BOOL)a3;
- (void)setUsedHearingFeatures:(unint64_t)a3;
- (void)updateStreamingPreference;
@end

@implementation HUHearingAidSettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  if ([a3 isEqualToString:kAXSAvailableHearingDeviceNamePreference])
  {
    _AXSAccessibilityPreferenceDomain();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = (id)*MEMORY[0x263F8B1E8];
  }

  return v3;
}

- (NSArray)peripheralUUIDs
{
  id v3 = objc_opt_new();
  v4 = [(HUHearingAidSettings *)self pairedHearingAids];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"ax_hearing_device_uuid_key"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 hcSafeAddObject:v6];
      }
    }
    v7 = [v4 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v7 objectForKey:@"ax_hearing_device_uuid_key"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 hcSafeAddObject:v8];
      }
    }
  }

  return (NSArray *)v3;
}

- (NSDictionary)pairedHearingAids
{
  id v3 = [(HCSettings *)self objectValueForKey:kAXSPairedHearingUUIDsPreference withClass:objc_opt_class() andDefaultValue:0];
  v4 = [v3 objectForKey:@"ax_hearing_device_version_key"];

  if (v4)
  {
    v7 = [v3 objectForKey:@"ax_hearing_device_version_key"];
    [v7 floatValue];
    float v9 = v8;
  }
  else
  {
    float v9 = 1.0;
  }
  LODWORD(v6) = 2.0;
  *(float *)&double v5 = v9;
  v10 = [(HUHearingAidSettings *)self convertPersistentRepresentation:v3 fromVersion:v5 toVersion:v6];

  return (NSDictionary *)v10;
}

- (id)convertPersistentRepresentation:(id)a3 fromVersion:(float)a4 toVersion:(float)a5
{
  v48[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  float v8 = v7;
  if (a4 == a5)
  {
    id v9 = v7;
    goto LABEL_27;
  }
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4 == 1.0)
  {
    v11 = [v8 objectForKey:@"ax_hearing_device_name_key"];
    if ([v11 length]) {
      [v10 setObject:v11 forKey:@"ax_hearing_device_name_key"];
    }
    v12 = [v8 objectForKey:@"ax_hearing_device_model_key"];
    v13 = [v8 objectForKey:@"ax_hearing_device_man_key"];
    if ([v12 length] && objc_msgSend(v13, "length"))
    {
      v14 = [&unk_26C1E56A8 stringValue];
      v46[1] = v13;
      v47[0] = v14;
      v46[0] = v13;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
      v48[0] = v15;
      v16 = [&unk_26C1E56C0 stringValue];
      v47[1] = v16;
      v45[0] = v12;
      v45[1] = v12;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
      v48[1] = v17;
      v18 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
      [v10 setObject:v18 forKey:@"ax_hearing_device_man_model_key"];
    }
    v19 = [v8 objectForKey:@"ax_hearing_device_lr_key"];
    if (v19) {
      [v10 setObject:v19 forKey:@"ax_hearing_device_lr_key"];
    }
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __78__HUHearingAidSettings_convertPersistentRepresentation_fromVersion_toVersion___block_invoke;
    v43[3] = &unk_2640FCF18;
    id v10 = v10;
    id v44 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v43];
  }
  else if (a4 == 2.0)
  {
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];

    id v10 = (id)v20;
  }
  if ((unint64_t)[v10 count] < 4) {
    goto LABEL_25;
  }
  if (a5 == 1.0)
  {
    v21 = [v10 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    v22 = [v10 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    v23 = [v10 objectForKey:@"ax_hearing_device_man_model_key"];
    if ([v21 count] == 4)
    {
      v24 = NSDictionary;
      v25 = [v21 objectForKey:@"ax_hearing_device_isleft_key"];
      v26 = [v21 objectForKey:@"ax_hearing_device_hiid_key"];
      v27 = [v21 objectForKey:@"ax_hearing_device_hiidother_key"];
      v28 = objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, @"ax_hearing_device_isleft_key", v26, @"ax_hearing_device_hiid_key", v27, @"ax_hearing_device_hiidother_key", 0);

      v29 = [v21 objectForKey:@"ax_hearing_device_uuid_key"];
      [v10 setObject:v28 forKey:v29];
    }
    if ([v22 count] == 4)
    {
      v30 = NSDictionary;
      v31 = [v22 objectForKey:@"ax_hearing_device_isleft_key"];
      v32 = [v22 objectForKey:@"ax_hearing_device_hiid_key"];
      v33 = [v22 objectForKey:@"ax_hearing_device_hiidother_key"];
      v34 = objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, @"ax_hearing_device_isleft_key", v32, @"ax_hearing_device_hiid_key", v33, @"ax_hearing_device_hiidother_key", 0);

      v35 = [v22 objectForKey:@"ax_hearing_device_uuid_key"];
      [v10 setObject:v34 forKey:v35];
    }
    if ([v23 count] == 2)
    {
      v36 = [&unk_26C1E56A8 stringValue];
      v37 = [v23 objectForKey:v36];
      v38 = [v37 firstObject];
      [v10 setObject:v38 forKey:@"ax_hearing_device_man_key"];

      v39 = [&unk_26C1E56C0 stringValue];
      v40 = [v23 objectForKey:v39];
      v41 = [v40 firstObject];
      [v10 setObject:v41 forKey:@"ax_hearing_device_model_key"];
    }
    [v10 removeObjectForKey:@"ax_hearing_device_left_peripheral_key"];
    [v10 removeObjectForKey:@"ax_hearing_device_right_peripheral_key"];
    [v10 removeObjectForKey:@"ax_hearing_device_man_model_key"];
    [v10 removeObjectForKey:@"ax_hearing_device_version_key"];
    id v9 = v10;

    goto LABEL_26;
  }
  if (a5 == 2.0)
  {
    id v9 = [NSDictionary dictionaryWithDictionary:v10];
  }
  else
  {
LABEL_25:
    id v9 = 0;
  }
LABEL_26:

LABEL_27:

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance_Settings_1;

  return v2;
}

uint64_t __38__HUHearingAidSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings_1 = objc_alloc_init(HUHearingAidSettings);

  return MEMORY[0x270F9A758]();
}

- (HUHearingAidSettings)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)HUHearingAidSettings;
  v2 = [(HCSettings *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("hearing-icloud-initialization", 0);
    [(HUHearingAidSettings *)v2 setIcloudInitializationQueue:v3];

    if ([MEMORY[0x263F472B0] isProtectedDataAvailable])
    {
      v4 = [(HUHearingAidSettings *)v2 icloudInitializationQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __28__HUHearingAidSettings_init__block_invoke;
      block[3] = &unk_2640FC960;
      v18 = v2;
      dispatch_async(v4, block);
    }
    else
    {
      HAInitializeLogging();
      double v5 = [NSString stringWithFormat:@"Skipping iCloud setup. Device is locked"];
      double v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings init]", 125, v5];
      id v7 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v6;
        id v9 = v7;
        uint64_t v10 = [v8 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v21 = v10;
        _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      if (MKBDeviceFormattedForContentProtection())
      {
        objc_initWeak((id *)buf, v2);
        v11 = [(HUHearingAidSettings *)v2 icloudInitializationQueue];
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __28__HUHearingAidSettings_init__block_invoke_83;
        handler[3] = &unk_2640FDC78;
        objc_copyWeak(&v16, (id *)buf);
        notify_register_dispatch((const char *)*MEMORY[0x263F55A78], &v2->_contentProtectionNotifyToken, v11, handler);

        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);
      }
    }
    if ([MEMORY[0x263F472B0] currentProcessIsHeard])
    {
      v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v2 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x263F57688] object:0];

      v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:v2 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x263F576C0] object:0];
    }
  }
  return v2;
}

uint64_t __28__HUHearingAidSettings_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeICloudSetup];
}

void __28__HUHearingAidSettings_init__block_invoke_83(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _initializeICloudSetup];
}

- (void)_initializeICloudSetup
{
  if ([(HUHearingAidSettings *)self shouldUseiCloud] && !self->_finishediCloudSetup)
  {
    self->_finishediCloudSetup = 1;
    id v10 = [(HUHearingAidSettings *)self pairedHearingAids];
    dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F085E8];
    double v5 = [MEMORY[0x263F08C40] defaultStore];
    [v3 addObserver:self selector:sel_icloudHearingSettingsDidChange_ name:v4 object:v5];

    double v6 = [MEMORY[0x263F08C40] defaultStore];
    [v6 synchronize];

    if (v10) {
      [(HUHearingAidSettings *)self pushLocalHearingAidsToiCloud];
    }
    [(HUHearingAidSettings *)self icloudHearingSettingsDidChange:0];
    id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFAE58], 0);
    id v8 = (ACMonitoredAccountStore *)[objc_alloc(MEMORY[0x263EFB248]) initWithAccountTypes:v7 delegate:self];
    accountStore = self->_accountStore;
    self->_accountStore = v8;

    [(ACMonitoredAccountStore *)self->_accountStore registerWithCompletion:&__block_literal_global_95];
    if ([(HUHearingAidSettings *)self isiCloudPaired]) {
      _AXSHearingSetDevicePairedEars();
    }
  }
}

void __46__HUHearingAidSettings__initializeICloudSetup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  dispatch_queue_t v3 = NSString;
  uint64_t v4 = [v2 count];

  double v5 = objc_msgSend(v3, "stringWithFormat:", @"Account: %d", v4);
  double v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings _initializeICloudSetup]_block_invoke", 178, v5];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    id v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)accountWasAdded:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v4 = NSString;
  double v5 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  double v6 = [v4 stringWithFormat:@"Account was added: %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings accountWasAdded:]", 192, v6];
  id v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUHearingAidSettings *)self iCloudAccountDidChange:0];
}

- (void)accountWasModified:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v4 = NSString;
  double v5 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  double v6 = [v4 stringWithFormat:@"Account was modified: %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings accountWasModified:]", 199, v6];
  id v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUHearingAidSettings *)self iCloudAccountDidChange:0];
}

- (void)accountWasRemoved:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v4 = NSString;
  double v5 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  double v6 = [v4 stringWithFormat:@"Account was removed: %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings accountWasRemoved:]", 206, v6];
  id v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUHearingAidSettings *)self iCloudAccountDidChange:0];
}

- (void)accountCredentialChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v4 = NSString;
  double v5 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  double v6 = [v4 stringWithFormat:@"Account credential has changed: %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings accountCredentialChanged:]", 213, v6];
  id v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUHearingAidSettings *)self iCloudAccountDidChange:0];
}

- (void)pairedWatchDidChange:(id)a3
{
  dispatch_queue_t v3 = [(HUHearingAidSettings *)self pairedHearingAids];
  id v6 = v3;
  if (v3)
  {
    uint64_t v4 = cloudHearingAidDescriptionForDescription(v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  double v5 = +[HANanoSettings sharedInstance];
  [v5 setValue:v4 forPreferenceKey:kAXSWatchSyncPairedUUIDsPreference];
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUHearingAidSettings;
  [(HCSettings *)&v4 dealloc];
}

- (BOOL)isPairedWithFakeHearingAids
{
  id v2 = [(HUHearingAidSettings *)self pairedHearingAids];
  dispatch_queue_t v3 = [v2 valueForKey:@"ax_hearing_device_fake_type_key"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isiCloudPaired
{
  id v2 = [(HUHearingAidSettings *)self pairedHearingAids];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_queue_t v3 = [v2 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    BOOL v4 = [v2 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    double v5 = [v3 objectForKey:@"ax_hearing_device_uuid_key"];
    uint64_t v6 = *MEMORY[0x263F47278];
    if ([v5 hasPrefix:*MEMORY[0x263F47278]])
    {
      char v7 = 1;
    }
    else
    {
      id v8 = [v4 objectForKey:@"ax_hearing_device_uuid_key"];
      char v7 = [v8 hasPrefix:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hearingAidsLEAVersionFromiCloud
{
  id v2 = [(HUHearingAidSettings *)self pairedHearingAids];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_queue_t v3 = [v2 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    BOOL v4 = [v2 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    double v5 = [v3 objectForKey:@"ax_hearing_device_lea_version_key"];
    if (v5)
    {
    }
    else
    {
      char v7 = [v4 objectForKey:@"ax_hearing_device_lea_version_key"];

      if (!v7)
      {
        unint64_t v6 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    id v8 = [v3 objectForKey:@"ax_hearing_device_lea_version_key"];
    int v9 = [v8 intValue];

    id v10 = [v4 objectForKey:@"ax_hearing_device_lea_version_key"];
    int v11 = [v10 intValue];

    if (v11 == 1 || v9 == 1) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = v11 | v9;
    }
    goto LABEL_12;
  }
  unint64_t v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)isPairedWithRealHearingAids
{
  dispatch_queue_t v3 = [(HUHearingAidSettings *)self pairedHearingAids];
  if (v3 && ![(HUHearingAidSettings *)self isPairedWithFakeHearingAids]) {
    BOOL v4 = ![(HUHearingAidSettings *)self isiCloudPaired];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

void __78__HUHearingAidSettings_convertPersistentRepresentation_fromVersion_toVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [v5 objectForKey:@"ax_hearing_device_isleft_key"];
    uint64_t v7 = [v6 BOOLValue];

    id v8 = [v5 objectForKey:@"ax_hearing_device_hiid_key"];
    int v9 = [v5 objectForKey:@"ax_hearing_device_hiidother_key"];
    id v10 = [MEMORY[0x263EFF9A0] dictionary];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 length]) {
      [v10 setObject:v8 forKey:@"ax_hearing_device_hiid_key"];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length]) {
      [v10 setObject:v9 forKey:@"ax_hearing_device_hiidother_key"];
    }
    [v10 setObject:v13 forKey:@"ax_hearing_device_uuid_key"];
    int v11 = [NSNumber numberWithBool:v7];
    [v10 setObject:v11 forKey:@"ax_hearing_device_isleft_key"];

    if (v7) {
      uint64_t v12 = @"ax_hearing_device_left_peripheral_key";
    }
    else {
      uint64_t v12 = @"ax_hearing_device_right_peripheral_key";
    }
    [*(id *)(a1 + 32) setObject:v10 forKey:v12];
  }
}

- (BOOL)shouldUseiCloud
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = SecTaskCreateFromSelf(0);
  if (!v2) {
    return 0;
  }
  dispatch_queue_t v3 = v2;
  CFErrorRef error = 0;
  BOOL v4 = (void *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", &error);
  if (error)
  {
    HAInitializeLogging();
    id v5 = [NSString stringWithFormat:@"Unable to get entitlements for client task. Error: %@", error];
    unint64_t v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings shouldUseiCloud]", 417, v5];
    uint64_t v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      int v9 = v7;
      uint64_t v10 = [v8 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v16 = v10;
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    CFRelease(error);
  }
  if (v4)
  {
    CFTypeID v11 = CFGetTypeID(v4);
    if (v11 == CFStringGetTypeID()) {
      char v12 = [v4 isEqualToString:@"com.apple.accessibility.heard"];
    }
    else {
      char v12 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    char v12 = 0;
  }
  CFRelease(v3);
  return v12;
}

- (void)icloudHearingSettingsDidChange:(id)a3
{
}

void __55__HUHearingAidSettings_icloudHearingSettingsDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08C40] defaultStore];
  id v11 = [v2 dictionaryForKey:kAXSCloudHearingAidsPreference];

  dispatch_queue_t v3 = [MEMORY[0x263F08C40] defaultStore];
  BOOL v4 = [v3 dictionaryForKey:kAXSCloudHearingDevicesPreference];

  id v5 = [*(id *)(a1 + 32) pairedHearingAids];
  if (v5)
  {
  }
  else
  {
    unint64_t v6 = [v4 valueForKey:@"ax_hearing_device_fake_type_key"];

    if (!v6)
    {
      if ([v4 count])
      {
        [*(id *)(a1 + 32) setLocalHearingAidsFromiCloud:v4];
      }
      else if ([v11 count])
      {
        int v9 = *(void **)(a1 + 32);
        LODWORD(v7) = 1.0;
        LODWORD(v8) = 2.0;
        uint64_t v10 = [v9 convertPersistentRepresentation:v11 fromVersion:v7 toVersion:v8];
        [v9 setLocalHearingAidsFromiCloud:v10];
      }
    }
  }
}

- (void)iCloudAccountDidChange:(id)a3
{
}

void __47__HUHearingAidSettings_iCloudAccountDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"New iCloud %d", objc_msgSend(*(id *)(a1 + 32), "shouldUseiCloud"));
  dispatch_queue_t v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings iCloudAccountDidChange:]_block_invoke", 455, v2];
  BOOL v4 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    unint64_t v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) shouldUseiCloud])
  {
    double v7 = [MEMORY[0x263F08C40] defaultStore];
    [v7 synchronize];

    double v8 = [*(id *)(a1 + 32) pairedHearingAids];

    if (v8) {
      [*(id *)(a1 + 32) pushLocalHearingAidsToiCloud];
    }
    [*(id *)(a1 + 32) icloudHearingSettingsDidChange:0];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 64);
  *(void *)(v9 + 64) = 0;
}

- (void)setLocalHearingAidsFromiCloud:(id)a3
{
  id v6 = a3;
  BOOL v4 = -[HUHearingAidSettings deviceIDForPairingInformation:](self, "deviceIDForPairingInformation:");
  BOOL v5 = [(HUHearingAidSettings *)self isDeviceIDOnCloudDenylist:v4];

  if (!v5) {
    [(HUHearingAidSettings *)self setPairedHearingAids:v6];
  }
}

- (BOOL)shouldPushLocalAidsToiCloud
{
  return [MEMORY[0x263F472B0] deviceIsWatch] ^ 1;
}

- (void)pushLocalHearingAidsToiCloud
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  dispatch_queue_t v3 = [NSString stringWithFormat:@"Should we push local aids to cloud? should use cloud: %d, should local aids be pushed: %d, fake hearing aids %d", -[HUHearingAidSettings shouldUseiCloud](self, "shouldUseiCloud"), -[HUHearingAidSettings shouldPushLocalAidsToiCloud](self, "shouldPushLocalAidsToiCloud"), -[HUHearingAidSettings isPairedWithFakeHearingAids](self, "isPairedWithFakeHearingAids")];
  BOOL v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings pushLocalHearingAidsToiCloud]", 493, v3];
  BOOL v5 = (os_log_t *)MEMORY[0x263F47290];
  id v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v4;
    double v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v35 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([(HUHearingAidSettings *)self shouldUseiCloud]
    && [(HUHearingAidSettings *)self shouldPushLocalAidsToiCloud]
    && ![(HUHearingAidSettings *)self isPairedWithFakeHearingAids])
  {
    HAInitializeLogging();
    uint64_t v9 = NSString;
    uint64_t v10 = [(HUHearingAidSettings *)self pairedHearingAids];
    id v11 = [v9 stringWithFormat:@"Pushing local aids to iCloud %@", v10];

    uint64_t v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings pushLocalHearingAidsToiCloud]", 496, v11];
    os_log_t v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      v15 = v13;
      uint64_t v16 = [v14 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v35 = v16;
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x263F08C40] defaultStore];
    [v17 synchronize];

    v18 = [MEMORY[0x263F08C40] defaultStore];
    [v18 removeObjectForKey:kAXSCloudHearingAidsPreference];

    objc_super v19 = [(HUHearingAidSettings *)self pairedHearingAids];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = cloudHearingAidDescriptionForDescription(v19);
      uint64_t v21 = [MEMORY[0x263F08C40] defaultStore];
      LODWORD(v22) = 2.0;
      LODWORD(v23) = 1.0;
      v24 = [(HUHearingAidSettings *)self convertPersistentRepresentation:v20 fromVersion:v22 toVersion:v23];
      [v21 setDictionary:v24 forKey:kAXSCloudHearingAidsPreference];

      v25 = [MEMORY[0x263F08C40] defaultStore];
      [v25 setDictionary:v20 forKey:kAXSCloudHearingDevicesPreference];

      v26 = [MEMORY[0x263F08C40] defaultStore];
      [v26 synchronize];
    }
    else
    {
      if (v19)
      {
LABEL_15:

        return;
      }
      HAInitializeLogging();
      v27 = [NSString stringWithFormat:@"Removing from iCloud"];
      v28 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings pushLocalHearingAidsToiCloud]", 512, v27];
      os_log_t v29 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = v28;
        v31 = v29;
        uint64_t v32 = [v30 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v35 = v32;
        _os_log_impl(&dword_20CC86000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v33 = [MEMORY[0x263F08C40] defaultStore];
      [v33 removeObjectForKey:kAXSCloudHearingAidsPreference];

      uint64_t v20 = [MEMORY[0x263F08C40] defaultStore];
      [v20 synchronize];
    }

    goto LABEL_15;
  }
}

- (id)keysToSync
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (void)logMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  HAInitializeLogging();
  BOOL v4 = [NSString stringWithFormat:@"%@", v3];

  BOOL v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings logMessage:]", 542, v4];
  id v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    double v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  if (preferenceKeyForSelector__onceToken_0 != -1) {
    dispatch_once(&preferenceKeyForSelector__onceToken_0, &__block_literal_global_189);
  }
  BOOL v4 = (void *)preferenceKeyForSelector__SelectorMap_0;
  BOOL v5 = NSStringFromSelector(a3);
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"UnknownKey";
  }
  double v8 = v7;

  return v8;
}

void __49__HUHearingAidSettings_preferenceKeyForSelector___block_invoke()
{
  id v0 = objc_alloc(NSDictionary);
  uint64_t v33 = kAXSPairedHearingUUIDsPreference;
  id v34 = v0;
  v42 = NSStringFromSelector(sel_pairedHearingAids);
  uint64_t v30 = kAXSKnownPeripheralUUIDsPreference;
  v41 = NSStringFromSelector(sel_knownPeripheralUUIDs);
  uint64_t v32 = kAXSHearingAidEarIndependencePreference;
  v40 = NSStringFromSelector(sel_independentHearingAidSettings);
  uint64_t v31 = kAXSHearingAidsStreamToLeftPreference;
  v39 = NSStringFromSelector(sel_shouldStreamToLeftAid);
  uint64_t v29 = kAXSHearingAidsStreamToRightPreference;
  v38 = NSStringFromSelector(sel_shouldStreamToRightAid);
  uint64_t v28 = kAXSHearingAidsCallAudioRoutePreference;
  v37 = NSStringFromSelector(sel_callAudioRoute);
  uint64_t v26 = kAXSHearingAidsMediaAudioRoutePreference;
  uint64_t v36 = NSStringFromSelector(sel_mediaAudioRoute);
  uint64_t v23 = kAXSHearingAidsLiveListenExportPreference;
  v27 = NSStringFromSelector(sel_exportsLiveListenToFile);
  uint64_t v24 = kAXSHearingAidMultideviceSettingsPreference;
  v25 = NSStringFromSelector(sel_multideviceSettingsEnabled);
  uint64_t v21 = kAXSHearingAidMultideviceAudioPreference;
  uint64_t v35 = NSStringFromSelector(sel_multideviceAudioEnabled);
  uint64_t v19 = kAXSHearingAidSystemSoundsStreamPreference;
  double v22 = NSStringFromSelector(sel_shouldStreamSystemSounds);
  uint64_t v17 = kAXSHearingAidComplicationPreferredDisplayModePreference;
  uint64_t v20 = NSStringFromSelector(sel_complicationPreferredDisplayMode);
  uint64_t v16 = kAXSClearPartialPairingPreference;
  v18 = NSStringFromSelector(sel_clearPartialPairing);
  uint64_t v1 = kAXSHearingAidAvailableInputEarPreference;
  v15 = NSStringFromSelector(sel_availableInputEars);
  uint64_t v2 = kAXSHearingAidEarsSupportingWatchPreference;
  id v3 = NSStringFromSelector(sel_earsSupportingWatch);
  uint64_t v4 = kAXSHearingAidInputEarPreference;
  BOOL v5 = NSStringFromSelector(sel_preferredInputEar);
  uint64_t v6 = kAXSAvailableHearingDeviceNamePreference;
  id v7 = NSStringFromSelector(sel_availableHearingDeviceName);
  uint64_t v8 = kAXSHearingFeatureUsagePreference;
  id v14 = NSStringFromSelector(sel_usedHearingFeatures);
  uint64_t v9 = kAXSLiveHeadphoneLevelEnabledPreference;
  NSStringFromSelector(sel_liveHeadphoneLevelEnabled);
  uint64_t v10 = v13 = v1;
  uint64_t v11 = objc_msgSend(v34, "initWithObjectsAndKeys:", v33, v42, v30, v41, v32, v40, v31, v39, v29, v38, v28, v37, v26, v36, v23, v27, v24,
          v25,
          v21,
          v35,
          v19,
          v22,
          v17,
          v20,
          v16,
          v18,
          v13,
          v15,
          v2,
          v3,
          v4,
          v5,
          v6,
          v7,
          v8,
          v14,
          v9,
          v10,
          0);
  uint64_t v12 = (void *)preferenceKeyForSelector__SelectorMap_0;
  preferenceKeyForSelector__SelectorMap_0 = v11;
}

- (void)_updateTripleClickOptionsForPairedAids:(id)a3
{
  _AXSSetAccessibilityEnabled();
  uint64_t v4 = (void *)_AXSTripleClickCopyOptions();
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
  }
  id v8 = (id)v6;
  int v7 = _AXSTripleClickContainsOption();
  if (a3)
  {
    if (!v7) {
      [v8 addObject:&unk_26C1E56D8];
    }
  }
  else if (v7)
  {
    [v8 removeObject:&unk_26C1E56D8];
  }
  _AXSSetTripleClickOptions();
  if (v5) {
    CFRelease(v5);
  }
}

- (void)updateStreamingPreference
{
  if ([(HUHearingAidSettings *)self shouldStreamToLeftAid]) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 0;
  }
  if ([(HUHearingAidSettings *)self shouldStreamToRightAid]) {
    uint64_t v4 = v3 | 4;
  }
  else {
    uint64_t v4 = v3;
  }

  MEMORY[0x270F90820](v4);
}

- (id)deviceIDForPairingInformation:(id)a3
{
  id v3 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__2;
  double v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v4 = [v3 objectForKey:@"ax_hearing_device_left_peripheral_key"];
  BOOL v5 = [v3 objectForKey:@"ax_hearing_device_right_peripheral_key"];
  if ([v4 count])
  {
    uint64_t v6 = [v4 objectForKey:@"ax_hearing_device_hiid_key"];
    int v7 = (void *)v25[5];
    v25[5] = v6;

    uint64_t v8 = [v4 objectForKey:@"ax_hearing_device_hiidother_key"];
LABEL_5:
    uint64_t v11 = (void *)v19[5];
    v19[5] = v8;

    goto LABEL_6;
  }
  if ([v5 count])
  {
    uint64_t v9 = [v5 objectForKey:@"ax_hearing_device_hiidother_key"];
    uint64_t v10 = (void *)v25[5];
    v25[5] = v9;

    uint64_t v8 = [v5 objectForKey:@"ax_hearing_device_hiid_key"];
    goto LABEL_5;
  }
LABEL_6:
  if (![(id)v25[5] length] || !objc_msgSend((id)v19[5], "length"))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__HUHearingAidSettings_deviceIDForPairingInformation___block_invoke;
    v17[3] = &unk_2640FDCC0;
    v17[4] = &v24;
    v17[5] = &v18;
    [v3 enumerateKeysAndObjectsUsingBlock:v17];
  }
  uint64_t v12 = [(id)v25[5] length];
  uint64_t v13 = (void *)v19[5];
  if (v12)
  {
    if ([v13 length])
    {
      id v14 = [NSString stringWithFormat:@"%@_%@", v25[5], v19[5]];
      goto LABEL_14;
    }
    uint64_t v13 = (void *)v25[5];
  }
  id v14 = v13;
LABEL_14:
  id v15 = v14;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __54__HUHearingAidSettings_deviceIDForPairingInformation___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v16 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v16 valueForKey:@"ax_hearing_device_isleft_key"];

    if (v6)
    {
      int v7 = [v16 valueForKey:@"ax_hearing_device_hiid_key"];
      uint64_t v8 = [v16 valueForKey:@"ax_hearing_device_hiidother_key"];
      uint64_t v9 = [v16 valueForKey:@"ax_hearing_device_isleft_key"];
      int v10 = [v9 BOOLValue];

      if (v10) {
        uint64_t v11 = v7;
      }
      else {
        uint64_t v11 = v8;
      }
      if (v10) {
        uint64_t v12 = v8;
      }
      else {
        uint64_t v12 = v7;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v11);
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v14 = v12;
      id v15 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v14;

      *a4 = 1;
    }
  }
}

- (void)setPairedHearingAids:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  BOOL v5 = [NSString stringWithFormat:@"Changing paired hearing aids %@", v4];
  uint64_t v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings setPairedHearingAids:]", 739, v5];
  int v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v63 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  BOOL v10 = hearingUIShouldBeAvailable();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v13 = [v4 lastObject];
      uint64_t v11 = [v12 dictionaryWithDictionary:v13];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  id v14 = [v11 valueForKey:@"ax_hearing_device_lr_key"];
  uint64_t v15 = [v14 unsignedIntegerValue];

  if ([(HUHearingAidSettings *)self isiCloudPaired] || v15 != _AXSHearingDevicePairedEars()) {
    _AXSHearingSetDevicePairedEars();
  }
  id v16 = [v11 objectForKey:@"ax_hearing_device_left_peripheral_key"];
  uint64_t v17 = [v11 objectForKey:@"ax_hearing_device_right_peripheral_key"];
  uint64_t v18 = [v16 objectForKey:@"ax_hearing_device_uuid_key"];
  uint64_t v19 = *MEMORY[0x263F47278];
  v58 = v17;
  if (([v18 hasPrefix:*MEMORY[0x263F47278]] & 1) == 0)
  {

LABEL_15:
    v56 = v16;
    BOOL v57 = v10;
    double v22 = [v4 valueForKey:@"ax_hearing_device_man_model_key"];
    id v23 = [&unk_26C1E56A8 stringValue];
    uint64_t v24 = [v22 objectForKey:v23];

    v25 = [v4 valueForKey:@"ax_hearing_device_left_peripheral_key"];
    v59 = [v25 valueForKey:@"ax_hearing_device_uuid_key"];

    uint64_t v26 = [v4 valueForKey:@"ax_hearing_device_right_peripheral_key"];
    v27 = [v26 valueForKey:@"ax_hearing_device_uuid_key"];

    uint64_t v28 = [v24 firstObject];
    if ([v28 length])
    {
      id v29 = [v24 firstObject];
      uint64_t v30 = [v24 lastObject];
      int v31 = [v29 isEqualToString:v30];

      if (v31)
      {
        uint64_t v32 = [MEMORY[0x263EFF980] array];
        [v32 hcSafeAddObject:v59];
        [v32 hcSafeAddObject:v27];
        if (![v32 count])
        {
          id v34 = 0;
          goto LABEL_29;
        }
        uint64_t v33 = [v24 firstObject];
        v60 = v33;
        v61 = v32;
        id v34 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
LABEL_28:

LABEL_29:
        _AXSHearingSetDevicePairedUUIDs();

        BOOL v10 = v57;
        id v16 = v56;
        goto LABEL_30;
      }
    }
    else
    {
    }
    uint64_t v32 = [MEMORY[0x263EFF980] array];
    [v32 hcSafeAddObject:v59];
    uint64_t v33 = [MEMORY[0x263EFF980] array];
    [v33 hcSafeAddObject:v27];
    id v34 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v35 = [v24 firstObject];
    if ([v35 length])
    {
      uint64_t v36 = [v32 count];

      if (!v36) {
        goto LABEL_24;
      }
      uint64_t v35 = [v24 firstObject];
      [v34 setObject:v32 forKey:v35];
    }

LABEL_24:
    v37 = [v24 lastObject];
    if ([v37 length])
    {
      uint64_t v38 = [v33 count];

      if (!v38) {
        goto LABEL_28;
      }
      v37 = [v24 lastObject];
      [v34 setObject:v33 forKey:v37];
    }

    goto LABEL_28;
  }
  uint64_t v20 = [v17 objectForKey:@"ax_hearing_device_uuid_key"];
  char v21 = [v20 hasPrefix:v19];

  if ((v21 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_30:
  [(HUHearingAidSettings *)self updateStreamingPreference];
  [(HUHearingAidSettings *)self _updateTripleClickOptionsForPairedAids:v11];
  [v11 setObject:&unk_26C1E5EC0 forKey:@"ax_hearing_device_version_key"];
  if (!v11)
  {
    v39 = [(HUHearingAidSettings *)self pairedHearingAids];
    v40 = [(HUHearingAidSettings *)self deviceIDForPairingInformation:v39];
    [(HUHearingAidSettings *)self addDeviceIDToCloudDenylist:v40];

    [(HUHearingAidSettings *)self setAvailableInputEars:0];
  }
  [(HCSettings *)self setValue:v11 forPreferenceKey:kAXSPairedHearingUUIDsPreference];
  v41 = [(HUHearingAidSettings *)self deviceIDForPairingInformation:v11];
  [(HUHearingAidSettings *)self removeDeviceIDFromCloudDenylist:v41];

  uint64_t v42 = [v11 count];
  _AXSHearingAidsSetPaired();
  if (_os_feature_enabled_impl())
  {
    v43 = [getAFPreferencesClass() sharedPreferences];
    int v44 = [v43 announceNotificationsOnHearingAidsSupported];

    if ((v42 != 0) != v44)
    {
      HAInitializeLogging();
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"Setting Announce Notifications on Hearing Aids Supported: %d", v42 != 0);
      v46 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingAidSettings setPairedHearingAids:]", 836, v45];
      v47 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v48 = v46;
        v49 = v47;
        uint64_t v50 = [v48 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v63 = v50;
        _os_log_impl(&dword_20CC86000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v51 = [getAFPreferencesClass() sharedPreferences];
      [v51 setAnnounceNotificationsOnHearingAidsSupported:v42 != 0];
    }
  }
  [(HUHearingAidSettings *)self pushLocalHearingAidsToiCloud];
  if (v11)
  {
    v52 = cloudHearingAidDescriptionForDescription(v11);
  }
  else
  {
    v52 = 0;
  }
  v53 = +[HANanoSettings sharedInstance];
  [v53 setValue:v52 forPreferenceKey:kAXSWatchSyncPairedUUIDsPreference];

  if (v10 != hearingUIShouldBeAvailable())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.hearing.ui.availability", 0, 0, 1u);
  }
  v55 = +[HUUtilities sharedUtilities];
  [v55 updateHearingFeatureUsage];
}

- (BOOL)clearPartialPairing
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSClearPartialPairingPreference withDefaultValue:0];
}

- (void)setClearPartialPairing:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSClearPartialPairingPreference];
}

- (NSDictionary)knownPeripheralUUIDs
{
  uint64_t v3 = kAXSKnownPeripheralUUIDsPreference;
  uint64_t v4 = objc_opt_class();

  return (NSDictionary *)[(HCSettings *)self objectValueForKey:v3 withClass:v4 andDefaultValue:0];
}

- (void)setKnownPeripheralUUIDs:(id)a3
{
}

- (BOOL)independentHearingAidSettings
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidEarIndependencePreference withDefaultValue:1];
}

- (void)setIndependentHearingAidSettings:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidEarIndependencePreference];
}

- (BOOL)shouldStreamToLeftAid
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidsStreamToLeftPreference withDefaultValue:1];
}

- (void)setShouldStreamToLeftAid:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidsStreamToLeftPreference];

  [(HUHearingAidSettings *)self updateStreamingPreference];
}

- (BOOL)shouldStreamToRightAid
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidsStreamToRightPreference withDefaultValue:1];
}

- (void)setShouldStreamToRightAid:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidsStreamToRightPreference];

  [(HUHearingAidSettings *)self updateStreamingPreference];
}

- (int64_t)callAudioRoute
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingAidsCallAudioRoutePreference withDefaultValue:2];
}

- (void)setCallAudioRoute:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidsCallAudioRoutePreference];
}

- (int64_t)mediaAudioRoute
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingAidsMediaAudioRoutePreference withDefaultValue:2];
}

- (void)setMediaAudioRoute:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidsMediaAudioRoutePreference];
}

- (BOOL)exportsLiveListenToFile
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidsLiveListenExportPreference withDefaultValue:0];
}

- (void)setExportsLiveListenToFile:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidsLiveListenExportPreference];
}

- (BOOL)multideviceSettingsEnabled
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidMultideviceSettingsPreference withDefaultValue:1];
}

- (void)setMultideviceSettingsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidMultideviceSettingsPreference];
}

- (BOOL)multideviceAudioEnabled
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidMultideviceAudioPreference withDefaultValue:1];
}

- (void)setMultideviceAudioEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidMultideviceAudioPreference];
}

- (BOOL)shouldStreamSystemSounds
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSHearingAidSystemSoundsStreamPreference withDefaultValue:0];
}

- (void)setShouldStreamSystemSounds:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidSystemSoundsStreamPreference];
}

- (int64_t)complicationPreferredDisplayMode
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingAidComplicationPreferredDisplayModePreference withDefaultValue:0];
}

- (void)setComplicationPreferredDisplayMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidComplicationPreferredDisplayModePreference];
}

- (int)availableInputEars
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingAidAvailableInputEarPreference withDefaultValue:0];
}

- (void)setAvailableInputEars:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidAvailableInputEarPreference];
}

- (int)earsSupportingWatch
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingAidEarsSupportingWatchPreference withDefaultValue:0];
}

- (void)setEarsSupportingWatch:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidEarsSupportingWatchPreference];
}

- (int)preferredInputEar
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingAidInputEarPreference withDefaultValue:6];
}

- (void)setPreferredInputEar:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingAidInputEarPreference];
}

- (NSString)availableHearingDeviceName
{
  uint64_t v3 = kAXSAvailableHearingDeviceNamePreference;
  uint64_t v4 = objc_opt_class();

  return (NSString *)[(HCSettings *)self objectValueForKey:v3 withClass:v4 andDefaultValue:0];
}

- (void)setAvailableHearingDeviceName:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(HUHearingAidSettings *)self availableHearingDeviceName];
  if (([(id)v5 isEqualToString:v4] & 1) == 0 && v4 | v5)
  {
    uint64_t v6 = HCLogHearingHandoff();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      unint64_t v8 = v4;
      _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "Set AvailableHearingDeviceName: %@", (uint8_t *)&v7, 0xCu);
    }

    [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSAvailableHearingDeviceNamePreference];
  }
}

- (unint64_t)usedHearingFeatures
{
  return [(HCSettings *)self integerValueForKey:kAXSHearingFeatureUsagePreference withDefaultValue:0];
}

- (void)setUsedHearingFeatures:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSHearingFeatureUsagePreference];
}

- (void)addDeviceIDToCloudDenylist:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = [(HCSettings *)self objectValueForKey:kAXSHearingAidsCloudDenylistPreference withClass:objc_opt_class() andDefaultValue:0];
  uint64_t v6 = [v4 arrayWithArray:v5];

  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
  }
  if ([v7 length])
  {
    [v6 addObject:v7];
    [(HCSettings *)self setValue:v6 forPreferenceKey:kAXSHearingAidsCloudDenylistPreference];
  }
}

- (void)removeDeviceIDFromCloudDenylist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v6 = [(HCSettings *)self objectValueForKey:kAXSHearingAidsCloudDenylistPreference withClass:objc_opt_class() andDefaultValue:0];
  id v7 = [v5 arrayWithArray:v6];

  if (v7 && [v4 length])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__HUHearingAidSettings_removeDeviceIDFromCloudDenylist___block_invoke;
    v9[3] = &unk_2640FDCE8;
    id v10 = v4;
    uint64_t v8 = [v7 indexOfObjectPassingTest:v9];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      [v7 removeObjectAtIndex:v8];
    }
    [(HCSettings *)self setValue:v7 forPreferenceKey:kAXSHearingAidsCloudDenylistPreference];
  }
}

uint64_t __56__HUHearingAidSettings_removeDeviceIDFromCloudDenylist___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (BOOL)isDeviceIDOnCloudDenylist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HCSettings *)self objectValueForKey:kAXSHearingAidsCloudDenylistPreference withClass:objc_opt_class() andDefaultValue:0];
  if (v5 && [v4 length])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__HUHearingAidSettings_isDeviceIDOnCloudDenylist___block_invoke;
    v8[3] = &unk_2640FDCE8;
    id v9 = v4;
    BOOL v6 = [v5 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __50__HUHearingAidSettings_isDeviceIDOnCloudDenylist___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (BOOL)liveHeadphoneLevelEnabled
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:kAXSLiveHeadphoneLevelEnabledPreference withDefaultValue:1];
}

- (void)setLiveHeadphoneLevelEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:kAXSLiveHeadphoneLevelEnabledPreference];
}

- (BOOL)anyGizmoLiveHeadphoneLevelEnabled
{
  BOOL v3 = [(HUHearingAidSettings *)self gizmoLiveHeadphoneLevelEnabled];
  return v3 | [(HUHearingAidSettings *)self gizmoLiveHeadphoneLevelNPEnabled];
}

- (BOOL)gizmoLiveHeadphoneLevelEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)gizmoLiveHeadphoneLevelNPEnabled
{
  return _os_feature_enabled_impl();
}

- (void)setAnyGizmoLiveHeadphoneLevelEnabled:(BOOL)a3
{
  self->_anyGizmoLiveHeadphoneLevelEnabled = a3;
}

- (void)setGizmoLiveHeadphoneLevelEnabled:(BOOL)a3
{
  self->_gizmoLiveHeadphoneLevelEnabled = a3;
}

- (void)setGizmoLiveHeadphoneLevelNPEnabled:(BOOL)a3
{
  self->_gizmoLiveHeadphoneLevelNPEnabled = a3;
}

- (OS_dispatch_queue)icloudInitializationQueue
{
  return self->_icloudInitializationQueue;
}

- (void)setIcloudInitializationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icloudInitializationQueue, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
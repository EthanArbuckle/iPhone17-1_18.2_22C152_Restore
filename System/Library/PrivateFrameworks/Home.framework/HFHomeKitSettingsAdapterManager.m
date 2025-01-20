@interface HFHomeKitSettingsAdapterManager
- (HFHomeKitSettingsAdapterManager)init;
- (HFHomeKitSettingsAdapterManager)initWithHomeKitSettingsVendor:(id)a3;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (NSMutableDictionary)adaptersByID;
- (id)_createAdapterForIdentifier:(id)a3;
- (id)adapterForIdentifier:(id)a3;
@end

@implementation HFHomeKitSettingsAdapterManager

- (HFHomeKitSettingsAdapterManager)initWithHomeKitSettingsVendor:(id)a3
{
  objc_initWeak(&location, a3);
  v9.receiver = self;
  v9.super_class = (Class)HFHomeKitSettingsAdapterManager;
  v4 = [(HFHomeKitSettingsAdapterManager *)&v9 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_homeKitSettingsVendor, v5);

    uint64_t v6 = objc_opt_new();
    adaptersByID = v4->_adaptersByID;
    v4->_adaptersByID = (NSMutableDictionary *)v6;
  }
  objc_destroyWeak(&location);
  return v4;
}

- (HFHomeKitSettingsAdapterManager)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomeKitSettingsAdapterManager.m", 59, @"%s is unavailable; use %@ instead",
    "-[HFHomeKitSettingsAdapterManager init]",
    v5);

  return 0;
}

- (id)adapterForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitSettingsAdapterManager *)self adaptersByID];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HFHomeKitSettingsAdapterManager_adapterForIdentifier___block_invoke;
  v9[3] = &unk_2640933C8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v6, v9);

  return v7;
}

uint64_t __56__HFHomeKitSettingsAdapterManager_adapterForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createAdapterForIdentifier:*(void *)(a1 + 40)];
}

- (id)_createAdapterForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SiriLanguageAdapter"])
  {
    id v5 = HFAccessorySettingSiriLanguageAdapter;
LABEL_17:
    id v6 = [v5 alloc];
    v7 = [(HFHomeKitSettingsAdapterManager *)self homeKitSettingsVendor];
    v8 = (void *)[v6 initWithHomeKitSettingsVendor:v7 mode:0];

    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"ManagedConfigurationAdapter"])
  {
    id v5 = HFAccessorySettingManagedConfigurationAdapter;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"MobileTimerAdapter"])
  {
    id v5 = HFAccessorySettingMobileTimerAdapter;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"MusicAdapter"])
  {
    id v5 = HFAccessorySettingMusicAdapter;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"DataAnalytics"])
  {
    id v5 = HFAccessorySettingDataAnalyticsAdapter;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"DoorbellChimeAdapter"])
  {
    id v5 = HFAccessorySettingDoorbellChimeAdapter;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"DeviceOptions"])
  {
    id v5 = HFAccessorySettingDeviceOptionsAdapter;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"SiriHistoryAdapter"])
  {
    id v5 = HFAccessorySettingSiriHistoryAdapter;
    goto LABEL_17;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeKitSettingsVendor);
  return (HFHomeKitSettingsVendor *)WeakRetained;
}

- (NSMutableDictionary)adaptersByID
{
  return self->_adaptersByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptersByID, 0);
  objc_destroyWeak((id *)&self->_homeKitSettingsVendor);
}

@end
@interface HFMediaAccessoryCommonSettingsManager
- (HFMediaAccessoryCommonSettingsManager)initWithMediaProfileContainer:(id)a3 home:(id)a4;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HMAccessorySettingsController)settingsController;
- (HMHome)home;
- (HMHomeManager)homeManager;
- (HMImmutableSetting)airPlayEnabledSetting;
- (HMImmutableSetting)announceEnabledSetting;
- (HMImmutableSetting)audioAnalysisEnabledSetting;
- (HMImmutableSetting)doorbellChimeEnabledSetting;
- (HMImmutableSetting)heySiriSetting;
- (HMImmutableSetting)tapToAccessSiriSetting;
- (NSHashTable)observers;
- (id)_settingKeyPaths;
- (id)airPlayEnabledSettingCachedValue;
- (id)announceEnabledSettingCachedValue;
- (id)audioAnalysisEnabledSettingCachedValue;
- (id)doorbellChimeEnabledSettingCachedValue;
- (id)heySiriSettingCachedValue;
- (id)settingForKeyPath:(id)a3;
- (id)settingValueForKeyPath:(id)a3;
- (id)tapToAccessSiriSettingCachedValue;
- (id)updateAccessorySettingWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPath:(id)a5 rawSettingValue:(id)a6;
- (void)_subscribeToAccessorySettings;
- (void)_updateCachedValue:(id)a3 forKeyPath:(id)a4;
- (void)_updateSettings:(id)a3;
- (void)addObserver:(id)a3;
- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAirPlayEnabledSetting:(id)a3;
- (void)setAirPlayEnabledSettingCachedValue:(id)a3;
- (void)setAnnounceEnabledSetting:(id)a3;
- (void)setAnnounceEnabledSettingCachedValue:(id)a3;
- (void)setAudioAnalysisEnabledSetting:(id)a3;
- (void)setAudioAnalysisEnabledSettingCachedValue:(id)a3;
- (void)setDoorbellChimeEnabledSetting:(id)a3;
- (void)setDoorbellChimeEnabledSettingCachedValue:(id)a3;
- (void)setHeySiriSetting:(id)a3;
- (void)setHeySiriSettingCachedValue:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setMediaProfileContainer:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setTapToAccessSiriSetting:(id)a3;
- (void)setTapToAccessSiriSettingCachedValue:(id)a3;
- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5;
@end

@implementation HFMediaAccessoryCommonSettingsManager

- (HFMediaAccessoryCommonSettingsManager)initWithMediaProfileContainer:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HFMediaAccessoryCommonSettingsManager;
  v9 = [(HFMediaAccessoryCommonSettingsManager *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    v13 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v14 = [v13 homeManager];
    homeManager = v10->_homeManager;
    v10->_homeManager = (HMHomeManager *)v14;

    v16 = +[HFHomeKitDispatcher sharedDispatcher];
    v17 = [v16 accessorySettingsDataSource];
    [v17 addObserver:v10];

    uint64_t v18 = [(HMHomeManager *)v10->_homeManager hf_accessorySettingsController];
    settingsController = v10->_settingsController;
    v10->_settingsController = (HMAccessorySettingsController *)v18;

    [(HFMediaAccessoryCommonSettingsManager *)v10 _subscribeToAccessorySettings];
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaAccessoryCommonSettingsManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaAccessoryCommonSettingsManager *)self observers];
  [v5 removeObject:v4];
}

- (id)updateAccessorySettingWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPath:(id)a5 rawSettingValue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F58190]);
  v15 = [(HFMediaAccessoryCommonSettingsManager *)self settingForKeyPath:v12];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 homeKitAccessorySettingValueForRawValue:v13];
    uint64_t v18 = [(HFMediaAccessoryCommonSettingsManager *)self settingsController];
    v19 = objc_msgSend(v18, "hf_updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:", v10, v11, v12, v17);

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __126__HFMediaAccessoryCommonSettingsManager_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_rawSettingValue___block_invoke;
    v26[3] = &unk_26409A020;
    id v20 = v14;
    id v27 = v20;
    v28 = self;
    id v29 = v17;
    id v30 = v12;
    id v31 = v13;
    id v32 = v11;
    id v21 = v17;
    id v22 = (id)[v19 addCompletionBlock:v26];

    id v23 = v20;
  }
  else
  {
    id v23 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  v24 = v23;

  return v24;
}

uint64_t __126__HFMediaAccessoryCommonSettingsManager_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_rawSettingValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    [*(id *)(a1 + 40) _updateCachedValue:*(void *)(a1 + 48) forKeyPath:*(void *)(a1 + 56)];
    v6 = +[HFHomeKitDispatcher sharedDispatcher];
    id v7 = [v6 accessorySettingsDataSource];
    [v7 updateSettingValue:*(void *)(a1 + 64) forKeyPath:*(void *)(a1 + 56) accessoryIdentifier:*(void *)(a1 + 72)];

    id v8 = *(void **)(a1 + 32);
    return [v8 finishWithNoResult];
  }
}

- (id)settingValueForKeyPath:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:HFAnnounceEnabledKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self announceEnabledSettingCachedValue];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:HFAudioAnalysisEnabledKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self audioAnalysisEnabledSettingCachedValue];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFAllowHeySiriSettingKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self heySiriSettingCachedValue];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFTapToAccessSiriSettingKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self tapToAccessSiriSettingCachedValue];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFAirPlayEnabledSettingKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self airPlayEnabledSettingCachedValue];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFDoorbellChimeEnabledKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self doorbellChimeEnabledSettingCachedValue];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:HFAnnounceEnabledKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self announceEnabledSetting];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:HFAudioAnalysisEnabledKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self audioAnalysisEnabledSetting];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFAllowHeySiriSettingKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self heySiriSetting];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFTapToAccessSiriSettingKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self tapToAccessSiriSetting];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFAirPlayEnabledSettingKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self airPlayEnabledSetting];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:HFDoorbellChimeEnabledKeyPath])
  {
    uint64_t v5 = [(HFMediaAccessoryCommonSettingsManager *)self doorbellChimeEnabledSetting];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (id)_settingKeyPaths
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = HFAllowHeySiriSettingKeyPath;
  v4[1] = HFTapToAccessSiriSettingKeyPath;
  v4[2] = HFAnnounceEnabledKeyPath;
  v4[3] = HFAirPlayEnabledSettingKeyPath;
  v4[4] = HFDoorbellChimeEnabledKeyPath;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return v2;
}

- (void)_subscribeToAccessorySettings
{
  v3 = [(HFMediaAccessoryCommonSettingsManager *)self mediaProfileContainer];
  id v4 = objc_msgSend(v3, "hf_backingAccessory");
  uint64_t v5 = [v4 uniqueIdentifier];

  v6 = [(HFMediaAccessoryCommonSettingsManager *)self _settingKeyPaths];
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 accessorySettingsDataSource];
  v9 = [(HFMediaAccessoryCommonSettingsManager *)self home];
  id v10 = [v9 uniqueIdentifier];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HFMediaAccessoryCommonSettingsManager__subscribeToAccessorySettings__block_invoke;
  v13[3] = &unk_26408C8C8;
  id v14 = v6;
  id v15 = v5;
  id v11 = v5;
  id v12 = v6;
  objc_msgSend(v8, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v10, v11, v12, 0, v13);
}

void __70__HFMediaAccessoryCommonSettingsManager__subscribeToAccessorySettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412802;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keyPaths [%@] for accessoryIdentifier [%@] - Error - [%@]", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_updateSettings:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v46;
    uint64_t v36 = *(void *)v46;
    do
    {
      uint64_t v7 = 0;
      uint64_t v37 = v5;
      do
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
        __int16 v9 = [v8 keyPath];
        int v10 = [v9 isEqualToString:HFAllowHeySiriSettingKeyPath];

        if (v10)
        {
          [(HFMediaAccessoryCommonSettingsManager *)self setHeySiriSetting:v8];
        }
        else
        {
          __int16 v11 = [v8 keyPath];
          int v12 = [v11 isEqualToString:HFTapToAccessSiriSettingKeyPath];

          if (v12)
          {
            [(HFMediaAccessoryCommonSettingsManager *)self setTapToAccessSiriSetting:v8];
          }
          else
          {
            uint64_t v13 = [v8 keyPath];
            int v14 = [v13 isEqualToString:HFAnnounceEnabledKeyPath];

            if (v14)
            {
              [(HFMediaAccessoryCommonSettingsManager *)self setAnnounceEnabledSetting:v8];
            }
            else
            {
              id v15 = [v8 keyPath];
              int v16 = [v15 isEqualToString:HFAudioAnalysisEnabledKeyPath];

              if (v16)
              {
                [(HFMediaAccessoryCommonSettingsManager *)self setAudioAnalysisEnabledSetting:v8];
              }
              else
              {
                v17 = [v8 keyPath];
                int v18 = [v17 isEqualToString:HFAirPlayEnabledSettingKeyPath];

                if (v18)
                {
                  [(HFMediaAccessoryCommonSettingsManager *)self setAirPlayEnabledSetting:v8];
                }
                else
                {
                  v19 = [v8 keyPath];
                  int v20 = [v19 isEqualToString:HFDoorbellChimeEnabledKeyPath];

                  if (v20) {
                    [(HFMediaAccessoryCommonSettingsManager *)self setDoorbellChimeEnabledSetting:v8];
                  }
                }
              }
            }
          }
        }
        id v21 = [(HFMediaAccessoryCommonSettingsManager *)self _settingKeyPaths];
        id v22 = [v8 keyPath];
        int v23 = [v21 containsObject:v22];

        if (v23)
        {
          uint64_t v39 = v7;
          v24 = [v8 value];
          v40 = v8;
          v25 = [v8 keyPath];
          [(HFMediaAccessoryCommonSettingsManager *)self _updateCachedValue:v24 forKeyPath:v25];

          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v26 = [(HFMediaAccessoryCommonSettingsManager *)self observers];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v42 != v29) {
                  objc_enumerationMutation(v26);
                }
                id v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  id v32 = [(HFMediaAccessoryCommonSettingsManager *)self mediaProfileContainer];
                  v33 = [v40 keyPath];
                  [v40 value];
                  v35 = v34 = self;
                  [v31 mediaProfileContainer:v32 didUpdateSettingKeypath:v33 value:v35];

                  self = v34;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }
            while (v28);
          }

          uint64_t v6 = v36;
          uint64_t v5 = v37;
          uint64_t v7 = v39;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v5);
  }
}

- (void)_updateCachedValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Updating Cached Value for keyPath [%@] to [%@]", (uint8_t *)&v11, 0x16u);
  }

  if ([v8 isEqualToString:HFAnnounceEnabledKeyPath])
  {
    uint64_t v10 = 104;
LABEL_15:
    objc_storeStrong((id *)((char *)&self->super.isa + v10), a3);
    goto LABEL_16;
  }
  if ([v8 isEqualToString:HFAudioAnalysisGroupKeyPath])
  {
    uint64_t v10 = 112;
    goto LABEL_15;
  }
  if ([v8 isEqualToString:HFTapToAccessSiriSettingKeyPath])
  {
    uint64_t v10 = 72;
    goto LABEL_15;
  }
  if ([v8 isEqualToString:HFAllowHeySiriSettingKeyPath])
  {
    uint64_t v10 = 96;
    goto LABEL_15;
  }
  if ([v8 isEqualToString:HFAirPlayEnabledSettingKeyPath])
  {
    uint64_t v10 = 120;
    goto LABEL_15;
  }
  if ([v8 isEqualToString:HFDoorbellChimeEnabledKeyPath])
  {
    uint64_t v10 = 128;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(HFMediaAccessoryCommonSettingsManager *)self mediaProfileContainer];
  id v8 = objc_msgSend(v7, "hf_backingAccessory");
  __int16 v9 = [v8 uniqueIdentifier];

  LODWORD(v7) = [v6 isEqual:v9];
  if (v7) {
    [(HFMediaAccessoryCommonSettingsManager *)self _updateSettings:v10];
  }
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HFMediaAccessoryCommonSettingsManager *)self mediaProfileContainer];
  int v11 = objc_msgSend(v10, "hf_backingAccessory");
  id v12 = [v11 uniqueIdentifier];

  LODWORD(v10) = [v9 isEqual:v12];
  if (v10) {
    [(HFMediaAccessoryCommonSettingsManager *)self _updateCachedValue:v13 forKeyPath:v8];
  }
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (HMImmutableSetting)tapToAccessSiriSetting
{
  return self->_tapToAccessSiriSetting;
}

- (void)setTapToAccessSiriSetting:(id)a3
{
}

- (HMImmutableSetting)heySiriSetting
{
  return self->_heySiriSetting;
}

- (void)setHeySiriSetting:(id)a3
{
}

- (HMImmutableSetting)announceEnabledSetting
{
  return self->_announceEnabledSetting;
}

- (void)setAnnounceEnabledSetting:(id)a3
{
}

- (HMImmutableSetting)audioAnalysisEnabledSetting
{
  return self->_audioAnalysisEnabledSetting;
}

- (void)setAudioAnalysisEnabledSetting:(id)a3
{
}

- (id)tapToAccessSiriSettingCachedValue
{
  return self->_tapToAccessSiriSettingCachedValue;
}

- (void)setTapToAccessSiriSettingCachedValue:(id)a3
{
}

- (HMImmutableSetting)airPlayEnabledSetting
{
  return self->_airPlayEnabledSetting;
}

- (void)setAirPlayEnabledSetting:(id)a3
{
}

- (HMImmutableSetting)doorbellChimeEnabledSetting
{
  return self->_doorbellChimeEnabledSetting;
}

- (void)setDoorbellChimeEnabledSetting:(id)a3
{
}

- (id)heySiriSettingCachedValue
{
  return self->_heySiriSettingCachedValue;
}

- (void)setHeySiriSettingCachedValue:(id)a3
{
}

- (id)announceEnabledSettingCachedValue
{
  return self->_announceEnabledSettingCachedValue;
}

- (void)setAnnounceEnabledSettingCachedValue:(id)a3
{
}

- (id)audioAnalysisEnabledSettingCachedValue
{
  return self->_audioAnalysisEnabledSettingCachedValue;
}

- (void)setAudioAnalysisEnabledSettingCachedValue:(id)a3
{
}

- (id)airPlayEnabledSettingCachedValue
{
  return self->_airPlayEnabledSettingCachedValue;
}

- (void)setAirPlayEnabledSettingCachedValue:(id)a3
{
}

- (id)doorbellChimeEnabledSettingCachedValue
{
  return self->_doorbellChimeEnabledSettingCachedValue;
}

- (void)setDoorbellChimeEnabledSettingCachedValue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_doorbellChimeEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_airPlayEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_audioAnalysisEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_announceEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_heySiriSettingCachedValue, 0);
  objc_storeStrong((id *)&self->_doorbellChimeEnabledSetting, 0);
  objc_storeStrong((id *)&self->_airPlayEnabledSetting, 0);
  objc_storeStrong(&self->_tapToAccessSiriSettingCachedValue, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEnabledSetting, 0);
  objc_storeStrong((id *)&self->_announceEnabledSetting, 0);
  objc_storeStrong((id *)&self->_heySiriSetting, 0);
  objc_storeStrong((id *)&self->_tapToAccessSiriSetting, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
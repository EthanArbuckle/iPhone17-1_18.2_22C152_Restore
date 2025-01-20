@interface HUSiriTriggerPhraseSettingDetailsItemManager
- (HFStaticItem)hsItem;
- (HFStaticItem)hsOrJSItem;
- (HFStaticItemProvider)siriTriggerPhraseSelectionItemProvider;
- (HFTransformItemProvider)siriDeviceItemProvider;
- (HFTransformItemProvider)siriOtherDeviceItemProvider;
- (HUSiriTriggerPhraseSettingDetailsItemManager)initWithSourceItem:(id)a3 delegate:(id)a4;
- (NSMutableOrderedSet)unsupportedMediaAccessories;
- (NSMutableSet)unsupportedLanguageCodes;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)home;
- (id)updateSiriTriggerPhrase:(id)a3;
- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5;
- (void)setHsItem:(id)a3;
- (void)setHsOrJSItem:(id)a3;
- (void)setSiriDeviceItemProvider:(id)a3;
- (void)setSiriOtherDeviceItemProvider:(id)a3;
- (void)setSiriTriggerPhraseSelectionItemProvider:(id)a3;
- (void)setUnsupportedLanguageCodes:(id)a3;
- (void)setUnsupportedMediaAccessories:(id)a3;
@end

@implementation HUSiriTriggerPhraseSettingDetailsItemManager

- (HUSiriTriggerPhraseSettingDetailsItemManager)initWithSourceItem:(id)a3 delegate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)[a3 copy];
  v12.receiver = self;
  v12.super_class = (Class)HUSiriTriggerPhraseSettingDetailsItemManager;
  v8 = [(HFItemManager *)&v12 initWithDelegate:v6 sourceItem:v7];

  if (v8)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)v8 home];
      *(_DWORD *)buf = 136315394;
      v14 = "-[HUSiriTriggerPhraseSettingDetailsItemManager initWithSourceItem:delegate:]";
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%s Current home = [%@]", buf, 0x16u);
    }
  }
  return v8;
}

- (id)updateSiriTriggerPhrase:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self hsOrJSItem];
  if (v6 == v4) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }

  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[HUSiriTriggerPhraseSettingDetailsItemManager updateSiriTriggerPhrase:]";
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s Now Updating Siri Trigger Phrase Options to [%lu]", buf, 0x16u);
  }

  v9 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke;
  v14[3] = &unk_1E638CA08;
  v14[4] = self;
  uint64_t v16 = v7;
  id v10 = v5;
  id v15 = v10;
  [v9 updateSiriPhraseOptions:v7 completion:v14];

  v11 = v15;
  id v12 = v10;

  return v12;
}

void __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[HUSiriTriggerPhraseSettingDetailsItemManager updateSiriTriggerPhrase:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri Trigger Phrase Options Update finished with error [%@]", buf, 0x16u);
  }

  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke_2;
    v8[3] = &unk_1E6392260;
    uint64_t v7 = *(void *)(a1 + 48);
    v8[4] = *(void *)(a1 + 32);
    v8[5] = v7;
    [v6 dispatchHomeObserverMessage:v8 sender:0];

    uint64_t v5 = MEMORY[0x1E4F1CC38];
  }
  [*(id *)(a1 + 40) finishWithResult:v5 error:v3];
}

void __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  [v4 home:v5 didUpdateSiriTriggerPhraseOptions:*(void *)(a1 + 40)];
}

- (id)home
{
  objc_opt_class();
  id v3 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 home];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HUSiriTriggerPhraseSettingDetailsItemManager;
    id v7 = [(HFItemManager *)&v10 home];
  }
  v8 = v7;

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)[v4 siriPhraseOptions];
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "siriPhraseOptions = [%lu]", buf, 0xCu);
  }

  id v6 = objc_alloc(MEMORY[0x1E4F695C0]);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke;
  v58[3] = &unk_1E6385000;
  id v7 = v4;
  id v59 = v7;
  v8 = (void *)[v6 initWithResultsBlock:v58];
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setHsOrJSItem:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F695C0]);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  v56[3] = &unk_1E6385000;
  id v44 = v7;
  id v57 = v44;
  objc_super v10 = (void *)[v9 initWithResultsBlock:v56];
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setHsItem:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self hsOrJSItem];
  v69[0] = v13;
  v14 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self hsItem];
  v69[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  uint64_t v16 = [v12 setWithArray:v15];
  uint64_t v17 = (void *)[v11 initWithItems:v16];
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setSiriTriggerPhraseSelectionItemProvider:v17];

  v18 = objc_opt_new();
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setUnsupportedMediaAccessories:v18];

  __int16 v19 = objc_opt_new();
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setUnsupportedLanguageCodes:v19];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F69288]) initWithHome:v44];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
  v55[3] = &unk_1E6385F78;
  v55[4] = self;
  [v20 setFilter:v55];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 1;
  objc_opt_class();
  id v21 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  id v24 = objc_alloc(MEMORY[0x1E4F696B0]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_281;
  v48[3] = &unk_1E63922B0;
  v48[4] = self;
  id v25 = v23;
  id v49 = v25;
  v50 = &v51;
  v26 = (void *)[v24 initWithSourceProvider:v20 transformationBlock:v48];
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setSiriDeviceItemProvider:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F68E20]);
  v28 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
  v29 = (void *)[v27 initWithHome:v28];

  [v29 setFilter:&__block_literal_global_291];
  v52[3] = 1;
  id v30 = objc_alloc(MEMORY[0x1E4F696B0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_313;
  v45[3] = &unk_1E6392300;
  id v31 = v25;
  id v46 = v31;
  v47 = &v51;
  v32 = (void *)[v30 initWithSourceProvider:v29 transformationBlock:v45];
  [(HUSiriTriggerPhraseSettingDetailsItemManager *)self setSiriOtherDeviceItemProvider:v32];

  v33 = HFLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
    v35 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriDeviceItemProvider];
    v36 = [v35 items];
    v37 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriOtherDeviceItemProvider];
    v38 = [v37 items];
    *(_DWORD *)buf = 136315906;
    v62 = "-[HUSiriTriggerPhraseSettingDetailsItemManager _buildItemProvidersForHome:]";
    __int16 v63 = 2112;
    v64 = v34;
    __int16 v65 = 2112;
    v66 = v36;
    __int16 v67 = 2112;
    v68 = v38;
    _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "%s unsupportedMediaAccessories = %@ -  siriDeviceItems = %@, sidekick items = %@", buf, 0x2Au);
  }
  v39 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriTriggerPhraseSelectionItemProvider];
  v60[0] = v39;
  v40 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriDeviceItemProvider];
  v60[1] = v40;
  v41 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriOtherDeviceItemProvider];
  v60[2] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];

  _Block_object_dispose(&v51, 8);

  return v42;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUJustSiriOrHeySiri_Setting_Title", @"HUJustSiriOrHeySiri_Setting_Title", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"1" forKeyedSubscript:*MEMORY[0x1E4F68B48]];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "siriPhraseOptions") == 3);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v6;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = 1;
  id v4 = _HULocalizedStringWithDefaultValue(@"HUHeySiri_Setting_Title", @"HUHeySiri_Setting_Title", 1);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"2" forKeyedSubscript:*MEMORY[0x1E4F68B48]];
  id v5 = NSNumber;
  if ([*(id *)(a1 + 32) siriPhraseOptions] != 1) {
    BOOL v3 = [*(id *)(a1 + 32) siriPhraseOptions] == 0;
  }
  id v6 = [v5 numberWithInt:v3];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v8;
}

uint64_t __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = &unk_1F1AD86A8;
  if ([v3 conformsToProtocol:v4]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 accessories];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_4;
    v33[3] = &unk_1E63869C8;
    v33[4] = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "na_all:", v33);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_28;
    }
    id v7 = v3;
    id v9 = [v7 mediaProfile];
    objc_super v10 = [v9 settings];
    uint64_t v11 = objc_msgSend(v10, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68478]);

    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend(v7, "hf_siriEndpointProfile");
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = (uint64_t)v7;
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "accessory = [%@] hf_siriEndpointProfile [%@]", buf, 0x16u);
    }
    if (![v7 supportsJustSiri])
    {
      if (v11)
      {
        v14 = [(id)v11 value];
        int v15 = [v14 BOOLValue];

        if (v15)
        {
          uint64_t v16 = [*(id *)(a1 + 32) unsupportedMediaAccessories];
          [v16 addObject:v7];
        }
      }
    }
    uint64_t v17 = objc_msgSend(v7, "hf_siriEndpointProfile");

    if (v17)
    {
      v18 = [v7 mediaProfile];
      __int16 v19 = objc_msgSend(v18, "hf_mediaAccessoryCommonSettingsManager");
      uint64_t v17 = [v19 settingForKeyPath:*MEMORY[0x1E4F68038]];

      if (([v7 supportsJustSiri] & 1) == 0)
      {
        if (v17)
        {
          uint64_t v20 = [(id)v17 value];
          int v21 = [v20 BOOLValue];

          if (v21)
          {
            v22 = [*(id *)(a1 + 32) unsupportedMediaAccessories];
            [v22 addObject:v7];
          }
        }
      }
      id v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v35 = v17;
        __int16 v36 = 2112;
        id v37 = v7;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "allowHSImmutableSetting = [%@] for accessory [%@]", buf, 0x16u);
      }
    }
    if ([v7 supportsJustSiri])
    {
      id v24 = [v7 mediaProfile];
      id v25 = [MEMORY[0x1E4F692A8] siriLanguageOptionFor:v24];
      v26 = [v25 recognitionLanguage];
      if (v26)
      {
        [MEMORY[0x1E4FB4FE0] sharedPreferences];
        v32 = v24;
        v28 = uint64_t v27 = v11;
        char v29 = [v28 isCompactVoiceTriggerAvailableForLanguageCode:v26];

        uint64_t v11 = v27;
        id v24 = v32;
        if ((v29 & 1) == 0)
        {
          id v30 = [*(id *)(a1 + 32) unsupportedLanguageCodes];
          [v30 addObject:v26];
        }
      }
    }
    uint64_t v8 = (v11 | v17) != 0;
  }
LABEL_28:

  return v8;
}

BOOL __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 mediaProfile];
  id v5 = [v4 settings];
  uint64_t v6 = objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68478]);

  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend(v3, "hf_siriEndpointProfile");
    int v26 = 138412546;
    uint64_t v27 = (uint64_t)v3;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "accessory = [%@] hf_siriEndpointProfile [%@]", (uint8_t *)&v26, 0x16u);
  }
  if (objc_msgSend(v3, "hf_isMediaAccessory"))
  {
    if (([v3 supportsJustSiri] & 1) == 0)
    {
      if (v6)
      {
        id v9 = [(id)v6 value];
        int v10 = [v9 BOOLValue];

        if (v10)
        {
          uint64_t v11 = [*(id *)(a1 + 32) unsupportedMediaAccessories];
          [v11 addObject:v3];
        }
      }
    }
  }
  uint64_t v12 = objc_msgSend(v3, "hf_siriEndpointProfile");

  if (v12)
  {
    uint64_t v13 = [v3 mediaProfile];
    v14 = objc_msgSend(v13, "hf_mediaAccessoryCommonSettingsManager");
    uint64_t v12 = [v14 settingForKeyPath:*MEMORY[0x1E4F68038]];

    int v15 = [v3 mediaProfile];
    uint64_t v16 = objc_msgSend(v15, "hf_mediaAccessoryCommonSettingsManager");
    [v16 addObserver:*(void *)(a1 + 32)];

    uint64_t v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      id v29 = v3;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "allowHSImmutableSetting = [%@] for accessory [%@]", (uint8_t *)&v26, 0x16u);
    }
  }
  if ([v3 supportsJustSiri])
  {
    v18 = [v3 mediaProfile];
    __int16 v19 = [MEMORY[0x1E4F692A8] siriLanguageOptionFor:v18];
    uint64_t v20 = [v19 recognitionLanguage];
    if (v20)
    {
      int v21 = [MEMORY[0x1E4FB4FE0] sharedPreferences];
      char v22 = [v21 isCompactVoiceTriggerAvailableForLanguageCode:v20];

      if ((v22 & 1) == 0)
      {
        id v23 = [*(id *)(a1 + 32) unsupportedLanguageCodes];
        [v23 addObject:v20];
      }
    }
  }
  if (objc_msgSend(v3, "hf_isMediaAccessory")) {
    BOOL v24 = (v6 | v12) != 0;
  }
  else {
    BOOL v24 = 0;
  }

  return v24;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_281(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_283;
  v12[3] = &unk_1E6392288;
  uint64_t v5 = a1[4];
  uint64_t v6 = (void *)a1[5];
  id v13 = v3;
  uint64_t v14 = v5;
  id v7 = v6;
  uint64_t v8 = a1[6];
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  int v10 = (void *)[v4 initWithSourceItem:v9 transformationBlock:v12];

  return v10;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_283(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v6 = v5;

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = &unk_1F1A3D2C0;
  id v9 = v7;
  if ([v9 conformsToProtocol:v8]) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  uint64_t v12 = [*(id *)(a1 + 40) sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  uint64_t v15 = *MEMORY[0x1E4F68980];
  [v6 setObject:&stru_1F18F92B8 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  uint64_t v16 = *(void **)(a1 + 48);
  unint64_t v17 = 0x1E4F28000;
  if (v14)
  {
    if (!v16)
    {
      v18 = [v14 homeKitSettingsVendor];
      if ([v18 conformsToProtocol:&unk_1F1AD86A8]) {
        __int16 v19 = v18;
      }
      else {
        __int16 v19 = 0;
      }
      id v20 = v19;

      int v21 = [v20 uniqueIdentifier];

      char v22 = [v11 mediaProfileContainer];
      id v23 = [v22 uniqueIdentifier];
      int v24 = [v21 isEqual:v23];

      if (v24)
      {
        id v25 = _HULocalizedStringWithDefaultValue(@"HUSelectedHomePodDescriptionText", @"HUSelectedHomePodDescriptionText", 1);
        [v6 setObject:v25 forKeyedSubscript:v15];

        [v6 setObject:&unk_1F19B5438 forKeyedSubscript:*MEMORY[0x1E4F68B48]];
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if (!v16)
  {
    goto LABEL_22;
  }
  int v26 = [v16 accessoryIdentifier];
  uint64_t v27 = [v11 mediaProfileContainer];
  __int16 v28 = objc_msgSend(v27, "hf_backingAccessory");
  id v29 = [v28 uniqueIdentifier];
  int v30 = [v26 isEqual:v29];

  if (v30)
  {
    id v31 = _HULocalizedStringWithDefaultValue(@"HUSelectedSiriEndpointDescriptionText", @"HUSelectedSiriEndpointDescriptionText", 1);
    [v6 setObject:v31 forKeyedSubscript:v15];

    [v6 setObject:&unk_1F19B5438 forKeyedSubscript:*MEMORY[0x1E4F68B48]];
    unint64_t v17 = 0x1E4F28000;
    goto LABEL_22;
  }
  unint64_t v17 = 0x1E4F28000uLL;
LABEL_21:
  v32 = [*(id *)(v17 + 3792) numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v6 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F68B48]];

  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
LABEL_22:
  v33 = *(void **)(v17 + 3792);
  [v11 isSiriDisabled];
  v34 = [v33 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

uint64_t __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_312(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5 && (objc_msgSend(v5, "hf_siriEndpointProfile"), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    uint64_t v8 = objc_msgSend(v5, "hf_primaryService");

    if (v8)
    {
      id v9 = [v5 mediaProfile];
      int v10 = objc_msgSend(v9, "hf_mediaAccessoryCommonSettingsManager");
      id v11 = [v10 settingForKeyPath:*MEMORY[0x1E4F68038]];

      uint64_t v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = objc_msgSend(v5, "hf_siriEndpointProfile");
        int v15 = 138412546;
        id v16 = v5;
        __int16 v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "accessory = [%@] hf_siriEndpointProfile [%@]", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v8 = v11 != 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_313(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_314;
  v10[3] = &unk_1E63922D8;
  id v11 = v3;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v6;
  id v7 = v3;
  uint64_t v8 = (void *)[v4 initWithSourceItem:v7 transformationBlock:v10];

  return v8;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_314(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v6 = v5;

  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = &unk_1F1A3D2C0;
  if ([v7 conformsToProtocol:v8]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = [v11 accessoryIdentifier];
    uint64_t v13 = [v10 accessory];
    id v14 = [v13 uniqueIdentifier];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {
      id v16 = _HULocalizedStringWithDefaultValue(@"HUSelectedSiriEndpointDescriptionText", @"HUSelectedSiriEndpointDescriptionText", 1);
      [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      [v6 setObject:&unk_1F19B5438 forKeyedSubscript:*MEMORY[0x1E4F68B48]];
    }
    else
    {
      __int16 v17 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68B48]];

      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  v18 = NSNumber;
  [v10 isSiriDisabled];
  uint64_t v19 = [v18 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
    uint64_t v8 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
    int v9 = objc_msgSend(v8, "hf_atleastOneMediaAccessorySupportingJustSiri");
    id v10 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
    *(_DWORD *)buf = 136315906;
    v172 = "-[HUSiriTriggerPhraseSettingDetailsItemManager _buildSectionsWithDisplayedItems:]";
    __int16 v173 = 2112;
    v174 = v7;
    __int16 v175 = 1024;
    int v176 = v9;
    __int16 v177 = 1024;
    int v178 = objc_msgSend(v10, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%s home [%@] atleastOneMediaAccessorySupportingJustSiruint64_t i = %{BOOL}d, atLeastOneMediaAccessoryWithSupportingJustSiriLanguage = %{BOOL}d", buf, 0x22u);
  }
  id v11 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
  int v12 = objc_msgSend(v11, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

  if (v12)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSiriTriggerPhraseSettingItemSectionIdentifier"];
    id v14 = _HULocalizedStringWithDefaultValue(@"HUSiriTriggerPhraseSelectionSection_Header", @"HUSiriTriggerPhraseSelectionSection_Header", 1);
    [v13 setHeaderTitle:v14];

    int v15 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
    uint64_t v16 = [v15 siriPhraseOptions];

    __int16 v17 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
    v18 = HULocalizedSiriTriggerPhrase(v17);
    id v25 = HULocalizedStringWithFormat(@"HUJustSiriOrHeySiri_Setting_Section_Footer", @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);

    int v26 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
    uint64_t v27 = [v26 count];

    v161 = v25;
    if (v27 && v16 == 3)
    {
      id v28 = v4;
      id v29 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
      int v30 = [v29 firstObject];
      id v31 = [v30 name];

      v32 = self;
      v33 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
      v34 = [v33 firstObject];
      uint64_t v35 = [v34 mediaProfile];
      __int16 v36 = objc_msgSend(v35, "hf_serviceNameComponents");

      if (v36)
      {
        id v37 = [v36 composedString];
        uint64_t v38 = v37;
        if (v37)
        {
          id v39 = v37;

          id v31 = v39;
        }
      }
      v40 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)v32 unsupportedMediaAccessories];
      if ((unint64_t)[v40 count] >= 2)
      {
        v41 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)v32 unsupportedMediaAccessories];
        [v41 count];
        uint64_t v48 = HULocalizedStringWithFormat(@"HUJustSiriOrHeySiri_Setting_Section_Footer_SeveralAccessories", @"%@%lu", v42, v43, v44, v45, v46, v47, (uint64_t)v31);

        id v31 = (void *)v48;
      }
      id v4 = v28;

      id v49 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)v32 unsupportedMediaAccessories];
      unint64_t v50 = [v49 count];
      uint64_t v51 = @"HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessory";
      if (v50 > 1) {
        uint64_t v51 = @"HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessories";
      }
      v52 = v51;

      id v59 = HULocalizedStringWithFormat(v52, @"%@", v53, v54, v55, v56, v57, v58, (uint64_t)v31);

      v60 = [v161 stringByAppendingFormat:@"\n• %@", v59];
      [v13 setFooterTitle:v60];

      id v25 = v161;
      self = v32;
    }
    else
    {
      [v13 setFooterTitle:v25];
    }
    v61 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedLanguageCodes];
    uint64_t v62 = [v61 count];

    if (v62 && v16 == 3)
    {
      v158 = v13;
      id v159 = v4;
      __int16 v63 = objc_opt_new();
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      v157 = self;
      id obj = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedLanguageCodes];
      uint64_t v64 = [obj countByEnumeratingWithState:&v166 objects:v170 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v167;
        do
        {
          for (uint64_t i = 0; i != v65; ++i)
          {
            if (*(void *)v167 != v66) {
              objc_enumerationMutation(obj);
            }
            uint64_t v68 = *(void *)(*((void *)&v166 + 1) + 8 * i);
            v69 = [MEMORY[0x1E4F4E4C8] sharedInstance];
            v70 = [v69 localizedNameForSiriLanguage:v68 inDisplayLanguage:0];

            v71 = [MEMORY[0x1E4FB4FE0] sharedPreferences];
            v72 = [v71 localizedTriggerPhraseForLanguageCode:v68];

            v79 = HULocalizedStringWithFormat(@"HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedSiriLanguage", @" %@%@", v73, v74, v75, v76, v77, v78, (uint64_t)v70);
            v80 = [NSString stringWithFormat:@"\n• %@", v79, v72];

            [v63 appendString:v80];
          }
          uint64_t v65 = [obj countByEnumeratingWithState:&v166 objects:v170 count:16];
        }
        while (v65);
      }

      uint64_t v13 = v158;
      v81 = [v158 footerTitle];
      if ([v63 length])
      {
        uint64_t v82 = [v81 stringByAppendingFormat:@"%@", v63];

        [v158 setFooterTitle:v82];
        v81 = (void *)v82;
      }
      id v25 = v161;
      id v4 = v159;
      self = v157;
    }
    v83 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriTriggerPhraseSelectionItemProvider];
    v84 = [v83 items];
    v85 = [v84 allObjects];
    v86 = [v85 sortedArrayUsingComparator:&__block_literal_global_356];

    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v164[3] = &unk_1E6386108;
    id v165 = v4;
    v87 = objc_msgSend(v86, "na_filter:", v164);
    [v13 setItems:v87];

    [v5 addObject:v13];
  }
  v88 = objc_opt_new();
  v89 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriDeviceItemProvider];
  v90 = [v89 items];
  v91 = [v90 allObjects];
  v92 = [v91 sortedArrayUsingComparator:&__block_literal_global_362];

  objc_opt_class();
  v93 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v94 = v93;
  }
  else {
    v94 = 0;
  }

  if (v94)
  {
    uint64_t v95 = [v92 sortedArrayUsingComparator:&__block_literal_global_360];
  }
  else
  {
    if ((unint64_t)[v92 count] < 3) {
      goto LABEL_37;
    }
    uint64_t v96 = [v92 firstObject];
    v97 = objc_msgSend(v92, "subarrayWithRange:", 1, objc_msgSend(v92, "count") - 1);
    v98 = objc_opt_new();
    [v98 addObject:v96];
    v99 = [v97 sortedArrayUsingComparator:&__block_literal_global_360];
    [v98 addObjectsFromArray:v99];

    uint64_t v95 = [v98 copy];
    v92 = (void *)v96;
  }

  v92 = (void *)v95;
LABEL_37:
  v100 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self siriOtherDeviceItemProvider];
  v101 = [v100 items];
  v102 = [v101 allObjects];
  v103 = [v102 sortedArrayUsingComparator:&__block_literal_global_364];

  if (v94)
  {
    uint64_t v104 = [v103 sortedArrayUsingComparator:&__block_literal_global_360];
  }
  else
  {
    if ((unint64_t)[v103 count] < 3) {
      goto LABEL_42;
    }
    uint64_t v105 = [v103 firstObject];
    v106 = objc_msgSend(v103, "subarrayWithRange:", 1, objc_msgSend(v103, "count") - 1);
    v107 = objc_opt_new();
    [v107 addObject:v105];
    v108 = [v106 sortedArrayUsingComparator:&__block_literal_global_360];
    [v107 addObjectsFromArray:v108];

    uint64_t v104 = [v107 copy];
    v103 = (void *)v105;
  }

  v103 = (void *)v104;
LABEL_42:
  objc_opt_class();
  v109 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v110 = v109;
  }
  else {
    v110 = 0;
  }
  id v111 = v110;

  objc_opt_class();
  v112 = [v111 sourceItem];

  if (objc_opt_isKindOfClass()) {
    v113 = v112;
  }
  else {
    v113 = 0;
  }

  if (v111) {
    BOOL v114 = v113 == 0;
  }
  else {
    BOOL v114 = 0;
  }
  if (v114) {
    v115 = v103;
  }
  else {
    v115 = v92;
  }
  if (v114) {
    v116 = v92;
  }
  else {
    v116 = v103;
  }
  objc_msgSend(v88, "na_safeAddObjectsFromArray:", v115);
  objc_msgSend(v88, "na_safeAddObjectsFromArray:", v116);
  if ([v88 count])
  {
    v117 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSiriDevicesItemSectionIdentifier"];
    v118 = _HULocalizedStringWithDefaultValue(@"HUSiriDevicesSection_Header", @"HUSiriDevicesSection_Header", 1);
    [v117 setHeaderTitle:v118];

    v119 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
    char v120 = objc_msgSend(v119, "hf_atleastOneMediaAccessorySupportingJustSiri");

    if ((v120 & 1) == 0)
    {
      v162 = v5;
      v121 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self home];
      v122 = HULocalizedSiriTriggerPhrase(v121);
      v129 = HULocalizedStringWithFormat(@"HUJustSiriListenOn_Setting_Section_Footer", @"%@", v123, v124, v125, v126, v127, v128, (uint64_t)v122);

      v130 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
      uint64_t v131 = [v130 count];

      if (v131)
      {
        id v160 = v4;
        v132 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
        v133 = [v132 firstObject];
        v134 = [v133 name];

        v135 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
        if ((unint64_t)[v135 count] >= 2)
        {
          v136 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
          [v136 count];
          uint64_t v143 = HULocalizedStringWithFormat(@"HUJustSiriOrHeySiri_Setting_Section_Footer_SeveralAccessories", @"%@%lu", v137, v138, v139, v140, v141, v142, (uint64_t)v134);

          v134 = (void *)v143;
        }

        v144 = [(HUSiriTriggerPhraseSettingDetailsItemManager *)self unsupportedMediaAccessories];
        unint64_t v145 = [v144 count];
        v146 = @"HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessory";
        if (v145 > 1) {
          v146 = @"HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessories";
        }
        v147 = v146;

        v154 = HULocalizedStringWithFormat(v147, @"%@", v148, v149, v150, v151, v152, v153, (uint64_t)v134);

        v155 = [v129 stringByAppendingFormat:@" %@", v154];
        [v117 setFooterTitle:v155];

        id v4 = v160;
      }
      else
      {
        [v117 setFooterTitle:v129];
      }

      id v5 = v162;
    }
    [v117 setItems:v88];
    [v5 addObject:v117];
  }

  return v5;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  uint64_t v8 = [v4 latestResults];

  int v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  v18 = v10;
  id v11 = v9;
  int v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    int v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    int v15 = v19;
  }

  return v13;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68AB8]];
  uint64_t v8 = [v4 latestResults];

  int v9 = [v8 objectForKey:v6];
  uint64_t v10 = [v7 localizedStandardCompare:v9];

  return v10;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  uint64_t v8 = [v4 latestResults];

  int v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  v18 = v10;
  id v11 = v9;
  int v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    int v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_6, &unk_1E6385480, v10);
    int v15 = v19;
  }

  return v13;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  uint64_t v8 = [v4 latestResults];

  int v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  v18 = v10;
  id v11 = v9;
  int v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    int v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_8, &unk_1E6385480, v10);
    int v15 = v19;
  }

  return v13;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v12, 0x16u);
  }

  id v11 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (HFStaticItemProvider)siriTriggerPhraseSelectionItemProvider
{
  return self->_siriTriggerPhraseSelectionItemProvider;
}

- (void)setSiriTriggerPhraseSelectionItemProvider:(id)a3
{
}

- (HFStaticItem)hsOrJSItem
{
  return self->_hsOrJSItem;
}

- (void)setHsOrJSItem:(id)a3
{
}

- (HFStaticItem)hsItem
{
  return self->_hsItem;
}

- (void)setHsItem:(id)a3
{
}

- (HFTransformItemProvider)siriDeviceItemProvider
{
  return self->_siriDeviceItemProvider;
}

- (void)setSiriDeviceItemProvider:(id)a3
{
}

- (HFTransformItemProvider)siriOtherDeviceItemProvider
{
  return self->_siriOtherDeviceItemProvider;
}

- (void)setSiriOtherDeviceItemProvider:(id)a3
{
}

- (NSMutableOrderedSet)unsupportedMediaAccessories
{
  return self->_unsupportedMediaAccessories;
}

- (void)setUnsupportedMediaAccessories:(id)a3
{
}

- (NSMutableSet)unsupportedLanguageCodes
{
  return self->_unsupportedLanguageCodes;
}

- (void)setUnsupportedLanguageCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedLanguageCodes, 0);
  objc_storeStrong((id *)&self->_unsupportedMediaAccessories, 0);
  objc_storeStrong((id *)&self->_siriOtherDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_siriDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_hsItem, 0);
  objc_storeStrong((id *)&self->_hsOrJSItem, 0);

  objc_storeStrong((id *)&self->_siriTriggerPhraseSelectionItemProvider, 0);
}

@end
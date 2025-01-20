@interface HFSiriLanguageOptionsManager
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (HFSiriLanguageOption)selectedLanguageOption;
- (HFSiriLanguageOptionsManager)initWithSettingsController:(id)a3 accessoryIdentifier:(id)a4 home:(id)a5;
- (HFSiriLanguageOptionsManager)initWithSettingsController:(id)a3 sourceItem:(id)a4 home:(id)a5;
- (HMAccessorySettingsController)settingsController;
- (HMHome)home;
- (NAFuture)availableLanguagesFuture;
- (NSHashTable)observers;
- (NSSet)availableLanguageOptions;
- (NSUUID)accessoryIdentifier;
- (id)_settingKeyPaths;
- (id)availableSiriLanguageOptions;
- (id)preferredOutputVoiceAccentOptionsForSelectedOption;
- (id)preferredOutputVoiceOptionsForSelectedOption;
- (id)preferredRecognitionLanguageOptionsForSelectedOption;
- (id)updateSelectedLanguageOption:(id)a3;
- (id)updateSelectedLanguageOption:(id)a3 accessoryIdentifier:(id)a4;
- (void)_fetchAvailableLanguagesAndGenerateOptions;
- (void)_subscribeToSiriLanguageSettings;
- (void)_updateSettingsAndNotifyObservers:(id)a3;
- (void)addObserver:(id)a3;
- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAvailableLanguageOptions:(id)a3;
- (void)setAvailableLanguagesFuture:(id)a3;
- (void)setHome:(id)a3;
- (void)setSelectedLanguageOption:(id)a3;
- (void)setSettingsController:(id)a3;
@end

@implementation HFSiriLanguageOptionsManager

- (HFSiriLanguageOptionsManager)initWithSettingsController:(id)a3 sourceItem:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a4 accessories];
  v11 = [v10 anyObject];

  v12 = [v11 uniqueIdentifier];
  v13 = [(HFSiriLanguageOptionsManager *)self initWithSettingsController:v9 accessoryIdentifier:v12 home:v8];

  return v13;
}

- (HFSiriLanguageOptionsManager)initWithSettingsController:(id)a3 accessoryIdentifier:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HFSiriLanguageOptionsManager;
  v12 = [(HFSiriLanguageOptionsManager *)&v20 init];
  if (v12)
  {
    v13 = +[HFHomeKitDispatcher sharedDispatcher];
    v14 = [v13 accessorySettingsDataSource];
    [v14 addObserver:v12];

    objc_storeStrong((id *)&v12->_settingsController, a3);
    objc_storeStrong((id *)&v12->_home, a5);
    uint64_t v15 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v15;

    objc_storeStrong((id *)&v12->_accessoryIdentifier, a4);
    v17 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    availableLanguagesFuture = v12->_availableLanguagesFuture;
    v12->_availableLanguagesFuture = v17;

    [(HFSiriLanguageOptionsManager *)v12 _fetchAvailableLanguagesAndGenerateOptions];
    [(HFSiriLanguageOptionsManager *)v12 _subscribeToSiriLanguageSettings];
  }

  return v12;
}

- (id)availableSiriLanguageOptions
{
  v3 = [(HFSiriLanguageOptionsManager *)self availableLanguageOptions];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F58190];
    v5 = [(HFSiriLanguageOptionsManager *)self availableLanguageOptions];
    v6 = [v4 futureWithResult:v5];
  }
  else
  {
    v6 = [(HFSiriLanguageOptionsManager *)self availableLanguagesFuture];
  }
  return v6;
}

- (id)preferredRecognitionLanguageOptionsForSelectedOption
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v4 = [(HFSiriLanguageOptionsManager *)self availableLanguageOptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 voiceNameWithDefaultFallback];
        id v11 = [v9 outputLanguage];
        v12 = v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          v14 = [v11 stringByAppendingString:v10];
          [v3 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v15 = [(HFSiriLanguageOptionsManager *)self availableSiriLanguageOptions];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke;
  v19[3] = &unk_2640967B8;
  v19[4] = self;
  id v20 = v3;
  id v16 = v3;
  v17 = [v15 flatMap:v19];

  return v17;
}

id __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke_2;
  id v10 = &unk_26408F580;
  v3 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v3;
  v4 = objc_msgSend(a2, "na_filter:", &v7);
  uint64_t v5 = objc_msgSend(MEMORY[0x263F58190], "futureWithResult:", v4, v7, v8, v9, v10, v11);

  return v5;
}

uint64_t __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F28530] sharedInstance];
  uint64_t v5 = [*(id *)(a1 + 32) selectedLanguageOption];
  uint64_t v6 = [v5 outputVoice];
  uint64_t v7 = [v3 recognitionLanguage];
  uint64_t v8 = [v4 voiceSimilarToVoice:v6 inSiriSessionLanguage:v7];

  id v9 = [v8 name];
  id v10 = [v8 languageCode];
  uint64_t v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12
    || ([v10 stringByAppendingString:v9],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [*(id *)(a1 + 40) containsObject:v13],
        v13,
        !v14))
  {
    long long v21 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [v3 recognitionLanguage];
      int v24 = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Most similar voice %@ in recognition language %@ not available. Using default for recognition language", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v20 = [v3 isDefaultVoiceForRecognitionLanguage];
  }
  else
  {
    uint64_t v15 = [v3 voiceNameWithDefaultFallback];
    id v16 = [v8 name];
    int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      v18 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [*(id *)(a1 + 32) selectedLanguageOption];
        int v24 = 138412546;
        id v25 = v3;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Option %@ most similar to current selected option %@", (uint8_t *)&v24, 0x16u);
      }
      uint64_t v20 = 1;
    }
    else
    {
      uint64_t v20 = 0;
    }
  }

  return v20;
}

- (id)preferredOutputVoiceAccentOptionsForSelectedOption
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(HFSiriLanguageOptionsManager *)self availableSiriLanguageOptions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke;
  v6[3] = &unk_2640967E0;
  v6[4] = self;
  v4 = [v3 flatMap:v6];

  return v4;
}

id __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v22 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "recognitionLanguage", v22);
        uint64_t v11 = [*(id *)(a1 + 32) selectedLanguageOption];
        BOOL v12 = [v11 recognitionLanguage];
        int v13 = [v10 isEqualToString:v12];

        if (v13)
        {
          int v14 = [v9 outputLanguage];
          uint64_t v15 = objc_msgSend(v22, "na_objectForKey:withDefaultValue:", v14, &__block_literal_global_124);
          [v15 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  id v16 = (void *)MEMORY[0x263EFFA08];
  int v17 = [v22 allValues];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_3;
  v23[3] = &unk_26408F610;
  v23[4] = *(void *)(a1 + 32);
  v18 = objc_msgSend(v17, "na_map:", v23);
  v19 = [v16 setWithArray:v18];

  uint64_t v20 = [MEMORY[0x263F58190] futureWithResult:v19];

  return v20;
}

uint64_t __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_2()
{
  return [MEMORY[0x263EFF9C0] set];
}

id __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_4;
  v6[3] = &unk_26408F5A8;
  v6[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  if (!v4)
  {
    id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_10_7);
    if (!v4)
    {
      id v4 = [v3 anyObject];
    }
  }

  return v4;
}

uint64_t __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F28530];
  id v4 = a2;
  uint64_t v5 = [v3 sharedInstance];
  uint64_t v6 = [*(id *)(a1 + 32) selectedLanguageOption];
  uint64_t v7 = [v6 outputVoice];
  uint64_t v8 = [v4 outputLanguage];
  id v9 = [v5 voiceSimilarToVoice:v7 inSiriSessionLanguage:v8];

  id v10 = [v4 voiceNameWithDefaultFallback];

  uint64_t v11 = [v9 name];
  uint64_t v12 = [v10 isEqualToString:v11];

  return v12;
}

uint64_t __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 isDefaultVoiceForRecognitionLanguage];
}

- (id)preferredOutputVoiceOptionsForSelectedOption
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(HFSiriLanguageOptionsManager *)self availableSiriLanguageOptions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke;
  v6[3] = &unk_2640967E0;
  v6[4] = self;
  id v4 = [v3 flatMap:v6];

  return v4;
}

id __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke_2;
  v5[3] = &unk_26408F5A8;
  v5[4] = *(void *)(a1 + 32);
  v2 = objc_msgSend(a2, "na_filter:", v5);
  id v3 = [MEMORY[0x263F58190] futureWithResult:v2];

  return v3;
}

uint64_t __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recognitionLanguage];
  uint64_t v5 = [*(id *)(a1 + 32) selectedLanguageOption];
  uint64_t v6 = [v5 recognitionLanguage];
  if ([v4 isEqualToString:v6])
  {
    uint64_t v7 = [v3 outputLanguage];
    uint64_t v8 = [*(id *)(a1 + 32) selectedLanguageOption];
    id v9 = [v8 outputLanguage];
    uint64_t v10 = [v7 isEqualToString:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSiriLanguageOptionsManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSiriLanguageOptionsManager *)self observers];
  [v5 removeObject:v4];
}

- (id)updateSelectedLanguageOption:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSiriLanguageOptionsManager *)self accessoryIdentifier];
  uint64_t v6 = [(HFSiriLanguageOptionsManager *)self updateSelectedLanguageOption:v4 accessoryIdentifier:v5];

  return v6;
}

- (id)updateSelectedLanguageOption:(id)a3 accessoryIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFSiriLanguageOptionsManager *)self availableSiriLanguageOptions];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke;
  v14[3] = &unk_264096858;
  id v15 = v7;
  id v16 = self;
  id v17 = v8;
  SEL v18 = a2;
  id v10 = v8;
  id v11 = v7;
  uint64_t v12 = [v9 flatMap:v14];

  return v12;
}

id __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__18;
  v39 = __Block_byref_object_dispose__18;
  id v40 = [*(id *)(a1 + 32) settingLanguageValue];
  if (v36[5]) {
    goto LABEL_3;
  }
  id v5 = [*(id *)(a1 + 32) allSerializedRepresentations];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_12;
  v32[3] = &unk_264096808;
  id v6 = v5;
  id v33 = v6;
  v34 = &v35;
  [v3 enumerateObjectsUsingBlock:v32];

  if (v36[5])
  {
LABEL_3:
    id v7 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [*(id *)(a1 + 40) home];
      id v11 = [v10 uniqueIdentifier];
      uint64_t v12 = [*(id *)(a1 + 40) accessoryIdentifier];
      *(_DWORD *)buf = 138413058;
      uint64_t v42 = v8;
      __int16 v43 = 2112;
      id v44 = v9;
      __int16 v45 = 2112;
      v46 = v11;
      __int16 v47 = 2112;
      v48 = v12;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Now calling updateAccessorySettingWithHomeIdentifier: for HomeID %@ Accessory ID %@", buf, 0x2Au);
    }
    int v13 = [*(id *)(a1 + 40) settingsController];
    int v14 = [*(id *)(a1 + 40) home];
    id v15 = [v14 uniqueIdentifier];
    id v16 = objc_msgSend(v13, "hf_updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:", v15, *(void *)(a1 + 48), HFSiriLanguageSettingKeyPath, v36[5]);

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_15;
    v26[3] = &unk_264096830;
    int8x16_t v25 = *(int8x16_t *)(a1 + 32);
    id v17 = (id)v25.i64[0];
    int8x16_t v27 = vextq_s8(v25, v25, 8uLL);
    v19 = *(void **)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    v30 = &v35;
    uint64_t v31 = v18;
    id v28 = v19;
    id v20 = v4;
    id v29 = v20;
    id v21 = (id)[v16 addCompletionBlock:v26];
    id v22 = v20;
  }
  else
  {
    long long v24 = (void *)MEMORY[0x263F58190];
    id v16 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v22 = [v24 futureWithError:v16];
  }

  _Block_object_dispose(&v35, 8);
  return v22;
}

void __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_12(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v12 = v5;
  id v7 = [v5 serializedRepresentation];
  uint64_t v8 = [v6 indexOfObject:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [v12 settingLanguageValue];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a3 = 1;
  }
}

void __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    [*(id *)(a1 + 32) setSelectedLanguageOption:*(void *)(a1 + 40)];
    id v5 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v8 = [*(id *)(a1 + 32) observers];
      uint64_t v9 = (void *)[v8 copy];
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2112;
      uint64_t v35 = v9;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ self.observers: %@", buf, 0x20u);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [*(id *)(a1 + 32) observers];
    id v11 = (void *)[v10 copy];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v17 = HFLogForCategory(0x26uLL);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = *(void *)(a1 + 32);
              v19 = NSStringFromSelector(*(SEL *)(a1 + 72));
              id v20 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138412802;
              uint64_t v31 = v18;
              __int16 v32 = 2112;
              id v33 = v19;
              __int16 v34 = 2112;
              uint64_t v35 = v20;
              _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying observers: %@", buf, 0x20u);
            }
            [v16 siriLanguageOptionsManager:*(void *)(a1 + 32) selectedLanguageOptionDidChange:*(void *)(a1 + 40)];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    id v21 = +[HFHomeKitDispatcher sharedDispatcher];
    id v22 = [v21 accessorySettingsDataSource];
    [v22 updateSettingValue:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKeyPath:HFSiriLanguageSettingKeyPath accessoryIdentifier:*(void *)(a1 + 48)];

    id v4 = 0;
  }
  long long v23 = *(void **)(a1 + 56);
  long long v24 = [NSNumber numberWithInt:v4 == 0];
  [v23 finishWithResult:v24 error:v4];
}

- (void)_fetchAvailableLanguagesAndGenerateOptions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(HFSiriLanguageOptionsManager *)self _settingKeyPaths];
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 accessorySettingsDataSource];
  uint64_t v6 = [(HFSiriLanguageOptionsManager *)self home];
  id v7 = [v6 uniqueIdentifier];
  uint64_t v8 = [(HFSiriLanguageOptionsManager *)self accessoryIdentifier];
  uint64_t v9 = objc_msgSend(v5, "hf_defaultSettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:", v7, v8, v3);

  uint64_t v10 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(HFSiriLanguageOptionsManager *)self accessoryIdentifier];
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "defaultSettings for Siri language option for accessoryUUID [%@] - keyPaths [%@] = [%@]", (uint8_t *)&v12, 0x20u);
  }
  [(HFSiriLanguageOptionsManager *)self _updateSettingsAndNotifyObservers:v9];
}

- (void)_subscribeToSiriLanguageSettings
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 accessorySettingsDataSource];
  id v5 = [(HFSiriLanguageOptionsManager *)self home];
  uint64_t v6 = [v5 uniqueIdentifier];
  id v7 = [(HFSiriLanguageOptionsManager *)self accessoryIdentifier];
  uint64_t v8 = [(HFSiriLanguageOptionsManager *)self _settingKeyPaths];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HFSiriLanguageOptionsManager__subscribeToSiriLanguageSettings__block_invoke;
  v9[3] = &unk_26408CDF0;
  v9[4] = self;
  objc_msgSend(v4, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v6, v7, v8, 0, v9);
}

void __64__HFSiriLanguageOptionsManager__subscribeToSiriLanguageSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) _settingKeyPaths];
      uint64_t v6 = [*(id *)(a1 + 32) accessoryIdentifier];
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

- (void)_updateSettingsAndNotifyObservers:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v4 = (HFSiriLanguageOption *)a3;
  id v5 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v60 = NSStringFromSelector(a2);
    v61 = [(HFSiriLanguageOptionsManager *)self accessoryIdentifier];
    *(_DWORD *)buf = 138413058;
    v86 = self;
    __int16 v87 = 2112;
    v88 = v60;
    __int16 v89 = 2112;
    v90 = v4;
    __int16 v91 = 2112;
    v92 = v61;
    _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "%@:%@ Updating language settings and notifying observers: %@ for accessoryID [%@]", buf, 0x2Au);
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [(HFSiriLanguageOption *)obj countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v64 = *(void *)v79;
    do
    {
      uint64_t v8 = 0;
      uint64_t v62 = v7;
      do
      {
        if (*(void *)v79 != v64) {
          objc_enumerationMutation(obj);
        }
        __int16 v9 = *(void **)(*((void *)&v78 + 1) + 8 * v8);
        uint64_t v10 = [v9 value];
        objc_opt_class();
        id v11 = v10;
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
        id v13 = v12;

        objc_opt_class();
        id v14 = v11;
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
        __int16 v16 = v15;

        v68 = v16;
        if (v13)
        {
          uint64_t v65 = v8;
          id v17 = (void *)MEMORY[0x263EFFA08];
          uint64_t v18 = objc_msgSend(v13, "na_map:", &__block_literal_global_25_8);
          v19 = [v17 setWithArray:v18];

          id v20 = [(HFSiriLanguageOptionsManager *)self availableLanguageOptions];
          id v21 = v19;
          if (v20 == v21)
          {
            int v22 = 1;
          }
          else if (v20)
          {
            int v22 = [(HFSiriLanguageOption *)v20 isEqual:v21];
          }
          else
          {
            int v22 = 0;
          }

          [(HFSiriLanguageOptionsManager *)self setAvailableLanguageOptions:v21];
          v39 = HFLogForCategory(0x26uLL);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v51 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v86 = self;
            __int16 v87 = 2112;
            v88 = v51;
            __int16 v89 = 1024;
            LODWORD(v90) = v22 ^ 1;
            uint64_t v7 = v62;
            _os_log_debug_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEBUG, "%@:%@ Available languages changed: %{BOOL}d", buf, 0x1Cu);
          }
          id v66 = v14;
          id v67 = v13;

          if ((v22 & 1) == 0)
          {
            id v40 = HFLogForCategory(0x26uLL);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              v52 = NSStringFromSelector(a2);
              v53 = [(HFSiriLanguageOptionsManager *)self observers];
              v54 = (HFSiriLanguageOption *)[v53 copy];
              *(_DWORD *)buf = 138412802;
              v86 = self;
              __int16 v87 = 2112;
              v88 = v52;
              __int16 v89 = 2112;
              v90 = v54;
              _os_log_debug_impl(&dword_20B986000, v40, OS_LOG_TYPE_DEBUG, "%@:%@ self.observers: %@", buf, 0x20u);
            }
            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            v41 = [(HFSiriLanguageOptionsManager *)self observers];
            uint64_t v42 = (void *)[v41 copy];

            uint64_t v43 = [v42 countByEnumeratingWithState:&v74 objects:v83 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v75;
              do
              {
                for (uint64_t i = 0; i != v44; ++i)
                {
                  if (*(void *)v75 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  __int16 v47 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                  if (objc_opt_respondsToSelector())
                  {
                    v48 = HFLogForCategory(0x26uLL);
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v49 = NSStringFromSelector(a2);
                      *(_DWORD *)buf = 138412802;
                      v86 = self;
                      __int16 v87 = 2112;
                      v88 = v49;
                      __int16 v89 = 2112;
                      v90 = v21;
                      _os_log_debug_impl(&dword_20B986000, v48, OS_LOG_TYPE_DEBUG, "%@:%@ Notifying observers: %@", buf, 0x20u);
                    }
                    [v47 siriLanguageOptionsManager:self availableLanguageOptionsDidChange:v21];
                  }
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v74 objects:v83 count:16];
              }
              while (v44);
            }

            uint64_t v7 = v62;
          }
          uint64_t v31 = [(HFSiriLanguageOptionsManager *)self availableLanguagesFuture];
          v50 = [(HFSiriLanguageOptionsManager *)self availableLanguageOptions];
          [v31 finishWithResult:v50];

          goto LABEL_57;
        }
        if (v16)
        {
          long long v23 = [v9 keyPath];
          int v24 = [v23 isEqualToString:HFSiriLanguageSettingKeyPath];

          if (v24)
          {
            long long v25 = HFLogForCategory(0x26uLL);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v55 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v86 = self;
              __int16 v87 = 2112;
              v88 = v55;
              __int16 v89 = 2112;
              v90 = v68;
              _os_log_debug_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEBUG, "%@:%@ siriLanguageSelection: %@", buf, 0x20u);
            }
            long long v26 = [(HFSiriLanguageOptionsManager *)self selectedLanguageOption];
            long long v27 = [v26 settingLanguageValue];
            char v28 = [v27 isEqual:v68];

            if ((v28 & 1) == 0)
            {
              id v66 = v14;
              id v67 = 0;
              id v21 = [[HFSiriLanguageOption alloc] initWithHomeKitSettingLanguageValue:v68];
              [(HFSiriLanguageOptionsManager *)self setSelectedLanguageOption:v21];
              id v29 = HFLogForCategory(0x26uLL);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                v56 = NSStringFromSelector(a2);
                [(HFSiriLanguageOptionsManager *)self observers];
                v58 = uint64_t v57 = v8;
                v59 = (HFSiriLanguageOption *)[v58 copy];
                *(_DWORD *)buf = 138412802;
                v86 = self;
                __int16 v87 = 2112;
                v88 = v56;
                __int16 v89 = 2112;
                v90 = v59;
                _os_log_debug_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEBUG, "%@:%@ self.observers: %@", buf, 0x20u);

                uint64_t v8 = v57;
              }

              long long v72 = 0u;
              long long v73 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              v30 = [(HFSiriLanguageOptionsManager *)self observers];
              uint64_t v31 = (void *)[v30 copy];

              uint64_t v32 = [v31 countByEnumeratingWithState:&v70 objects:v82 count:16];
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v65 = v8;
                uint64_t v34 = *(void *)v71;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v71 != v34) {
                      objc_enumerationMutation(v31);
                    }
                    uint64_t v36 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                    if (objc_opt_respondsToSelector())
                    {
                      uint64_t v37 = HFLogForCategory(0x26uLL);
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                      {
                        v38 = NSStringFromSelector(a2);
                        *(_DWORD *)buf = 138412802;
                        v86 = self;
                        __int16 v87 = 2112;
                        v88 = v38;
                        __int16 v89 = 2112;
                        v90 = v21;
                        _os_log_debug_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEBUG, "%@:%@ Notifying observers: %@", buf, 0x20u);
                      }
                      [v36 siriLanguageOptionsManager:self selectedLanguageOptionDidChange:v21];
                    }
                  }
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v70 objects:v82 count:16];
                }
                while (v33);
                uint64_t v7 = v62;
LABEL_57:
                uint64_t v8 = v65;
              }

              id v14 = v66;
              id v13 = v67;
            }
          }
        }

        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [(HFSiriLanguageOption *)obj countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v7);
  }
}

HFSiriLanguageOption *__66__HFSiriLanguageOptionsManager__updateSettingsAndNotifyObservers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HFSiriLanguageOption alloc] initWithHomeKitSettingLanguageValue:v2];

  return v3;
}

- (id)_settingKeyPaths
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = HFSiriAvailableLanguagesSettingKeyPath;
  v4[1] = HFSiriLanguageSettingKeyPath;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 keyPath];
  int v6 = [v5 isEqualToString:@"root.siri.recognitionLanguage"];

  if (v6)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    uint64_t v7 = [(HFSiriLanguageOptionsManager *)self preferredRecognitionLanguageOptionsForSelectedOption];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke;
    v18[3] = &unk_2640968A0;
    v18[4] = &v19;
    id v8 = (id)[v7 flatMap:v18];
  }
  else
  {
    __int16 v9 = [v4 keyPath];
    int v10 = [v9 isEqualToString:@"root.siri.outputVoice"];

    if (!v10)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v11 = [(HFSiriLanguageOptionsManager *)self preferredOutputVoiceOptionsForSelectedOption];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_2;
    v17[3] = &unk_2640968A0;
    v17[4] = &v19;
    id v12 = (id)[v11 flatMap:v17];

    uint64_t v7 = [(HFSiriLanguageOptionsManager *)self preferredOutputVoiceAccentOptionsForSelectedOption];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_3;
    v16[3] = &unk_2640968A0;
    v16[4] = &v19;
    id v13 = (id)[v7 flatMap:v16];
  }

  BOOL v14 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);
LABEL_7:

  return v14;
}

uint64_t __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)[a2 count] > 1;
  id v2 = (void *)MEMORY[0x263F58190];
  return [v2 futureWithNoResult];
}

uint64_t __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)[a2 count] > 1;
  id v2 = (void *)MEMORY[0x263F58190];
  return [v2 futureWithNoResult];
}

uint64_t __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = (unint64_t)[a2 count] > 1;
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  id v5 = (void *)MEMORY[0x263F58190];
  return [v5 futureWithNoResult];
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  uint64_t v7 = [(HFSiriLanguageOptionsManager *)self accessoryIdentifier];
  int v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);

  if (v8) {
    [(HFSiriLanguageOptionsManager *)self _updateSettingsAndNotifyObservers:v9];
  }
}

- (HFSiriLanguageOption)selectedLanguageOption
{
  return self->_selectedLanguageOption;
}

- (void)setSelectedLanguageOption:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (NSSet)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (void)setAvailableLanguageOptions:(id)a3
{
}

- (NAFuture)availableLanguagesFuture
{
  return self->_availableLanguagesFuture;
}

- (void)setAvailableLanguagesFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLanguagesFuture, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_selectedLanguageOption, 0);
}

@end
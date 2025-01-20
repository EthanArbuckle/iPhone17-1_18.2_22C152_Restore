void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t IsTrialAssetDeliveryEnabled()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.internal.ck"];
  v1 = [v0 objectForKey:@"disableTrialAssetDelivery"];
  char v2 = [v1 BOOLValue];

  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = [v0 objectForKey:@"enableTrialAssetDelivery"];
    if ([v4 BOOLValue]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = _os_feature_enabled_impl();
    }
  }
  return v3;
}

uint64_t EmbeddedSpeechNewAssetInstalled(uint64_t a1, void *a2)
{
  return [a2 updateOfflineDictationStatus];
}

void *LocStringKeyBasedOnLanguageCount(void *result, unint64_t a2, uint64_t a3)
{
  if (a2 >= 2) {
    result = (void *)[result stringByAppendingString:@"S"];
  }
  if (a3)
  {
    return (void *)[result stringByAppendingString:a3];
  }
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t DictationIsEnabled()
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationIsEnabled")) {
    return 1;
  }
  else {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "suppressDictationOptIn") ^ 1;
  }
}

uint64_t HardwareKeyboardAvailabilityChanged(uint64_t a1, void *a2)
{
  return [a2 performSelectorOnMainThread:sel_hardwareKeyboardAvailabilityChanged withObject:0 waitUntilDone:0];
}

uint64_t getMCProfileConnectionClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getMCProfileConnectionClass_softClass;
  uint64_t v8 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getMCProfileConnectionClass_block_invoke;
    v2[3] = &unk_264A00CE0;
    v2[4] = &v3;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void *__getMCKeyboardSettingsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)ManagedConfigurationLibrary();
  result = dlsym(v2, "MCKeyboardSettingsChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    void v2[5] = v2;
    long long v3 = xmmword_264A00F38;
    uint64_t v4 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary) {
    ManagedConfigurationLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t KeyboardSettingsFeedbackLibraryCore()
{
  if (!KeyboardSettingsFeedbackLibraryCore_frameworkLibrary) {
    KeyboardSettingsFeedbackLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return KeyboardSettingsFeedbackLibraryCore_frameworkLibrary;
}

uint64_t __KeyboardSettingsFeedbackLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  KeyboardSettingsFeedbackLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getTUIFeedbackControllerClass_block_invoke(uint64_t a1)
{
  KeyboardSettingsFeedbackLibraryCore();
  Class result = objc_getClass("TUIFeedbackController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  getTUIFeedbackControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getMCProfileConnectionClass_block_invoke_cold_1();
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __TIGetToggleFourOrFiveRowKeyboardValue_block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v1 = MEMORY[0x263EFFA80];

  return [v0 _configureKey:@"ToggleFourOrFiveRowKeyboard" domain:@"com.apple.keyboard" defaultValue:v1];
}

id attributedTitleForKey(void *a1, __IOHIDServiceClient *a2, void *a3, int a4)
{
  v7 = a1;
  id v8 = a3;
  if ([(__CFString *)v7 isEqualToString:@"Function"]
    && showGlobeKeyInsteadOfFunctionKey(a2))
  {

    v7 = @"Globe";
  }
  v9 = [(id)_keyToTitle objectForKeyedSubscript:v7];
  if (![(__CFString *)v7 isEqualToString:@"CapsLock"] || !a2) {
    goto LABEL_10;
  }
  v10 = (void *)IOHIDServiceClientCopyProperty(a2, @"CapsLockLanguageSwitch");
  v11 = (void *)IOHIDServiceClientCopyProperty(a2, @"KeyboardLanguage");
  if ([v11 length]
    && (([v10 BOOLValue] & 1) != 0
     || [v11 isEqualToString:@"Simplified Chinese Keyboard"]))
  {
    v12 = +[TIHardwareKeyboardController IOHIDKeyboardLanguageToCapsLockKeyLabel];
    v13 = [v12 objectForKey:v11];
  }
  else
  {
    v13 = 0;
  }

  if (!v13)
  {
LABEL_10:
    if (a4)
    {
      v14 = [(id)_keyToSymbol objectForKeyedSubscript:v7];
    }
    else
    {
      v14 = 0;
    }
    id v15 = 0;
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v15 = v13;

  v14 = 0;
  v9 = v15;
  if (v8)
  {
LABEL_14:
    uint64_t v16 = [v9 stringByAppendingString:v8];

    v9 = (void *)v16;
  }
LABEL_15:
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:v9 value:&stru_26E29DC78 table:@"Keyboard"];

  v19 = +[TIKeyboardListController attributedTitleForSymbolName:v14 cellTitle:v18];

  return v19;
}

uint64_t showGlobeKeyInsteadOfFunctionKey(__IOHIDServiceClient *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (void *)IOHIDServiceClientCopyProperty(a1, @"SupportsGlobeKey");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void __initializeDictionaries_block_invoke()
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33[0] = @"CapsLock";
  v33[1] = @"Control";
  v34[0] = &unk_26E2A6CE8;
  v34[1] = &unk_26E2A6D00;
  v33[2] = @"Option";
  v33[3] = @"Command";
  v34[2] = &unk_26E2A6D18;
  v34[3] = &unk_26E2A6D30;
  v33[4] = @"Escape";
  v33[5] = @"Function";
  v34[4] = &unk_26E2A6D48;
  v34[5] = &unk_26E2A6D60;
  v33[6] = @"Globe";
  v33[7] = @"NoAction";
  v34[6] = &unk_26E2A6D78;
  v34[7] = &unk_26E2A6D90;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:8];
  uint64_t v1 = (void *)_keyToKeyCode;
  _keyToKeyCode = v0;

  v31[0] = @"CapsLock";
  v31[1] = @"Control";
  v32[0] = @"Caps Lock";
  v32[1] = @"Control";
  v31[2] = @"Option";
  v31[3] = @"Command";
  v32[2] = @"Option";
  v32[3] = @"Command";
  v31[4] = @"Escape";
  v31[5] = @"Function";
  v32[4] = @"Escape";
  v32[5] = @"Function";
  v31[6] = @"Globe";
  v31[7] = @"NoAction";
  v32[6] = @"Globe";
  v32[7] = @"No Action";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:8];
  long long v3 = (void *)_keyToTitle;
  _keyToTitle = v2;

  v29[0] = @"CapsLock";
  v29[1] = @"Control";
  v30[0] = @"capslock";
  v30[1] = @"control";
  v29[2] = @"Option";
  v29[3] = @"Command";
  v30[2] = @"option";
  v30[3] = @"command";
  v29[4] = @"Escape";
  v29[5] = @"Function";
  v30[4] = @"escape";
  v30[5] = @"fn";
  v29[6] = @"Globe";
  v30[6] = @"globe";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];
  uint64_t v5 = (void *)_keyToSymbol;
  _keyToSymbol = v4;

  v28[0] = @"CapsLock";
  v28[1] = @"Control";
  v28[2] = @"Option";
  v28[3] = @"Command";
  v28[4] = @"Globe";
  v28[5] = @"Function";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:6];
  v7 = (void *)_srcKeys;
  _srcKeys = v6;

  v27[0] = @"CapsLock";
  v27[1] = @"Control";
  v27[2] = @"Option";
  v27[3] = @"Command";
  v27[4] = @"Escape";
  v27[5] = @"Globe";
  v27[6] = @"Function";
  v27[7] = @"NoAction";
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:8];
  v9 = (void *)_dstKeys;
  _dstKeys = v8;

  id v10 = (id)_keyToKeyCode;
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v18 = objc_msgSend(v12, "objectForKeyedSubscript:", v17, (void)v23);
        if ([v18 count])
        {
          unint64_t v19 = 0;
          do
          {
            v20 = [v18 objectAtIndexedSubscript:v19];
            [v11 setObject:v17 forKeyedSubscript:v20];

            ++v19;
          }
          while (v19 < [v18 count]);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v14);
  }

  uint64_t v21 = [v11 copy];
  v22 = (void *)_keyCodeToKey;
  _keyCodeToKey = v21;
}

void *TIDownloadButton()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263F1C6C8];
  v4[0] = [MEMORY[0x263F1C550] tintColor];
  uint64_t v1 = objc_msgSend(v0, "configurationWithPaletteColors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v4, 1));
  uint64_t v2 = (void *)[MEMORY[0x263F1C488] buttonWithType:0];
  [v2 setPreferredSymbolConfiguration:v1 forImageInState:0];
  objc_msgSend(v2, "setImage:forState:", objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", @"icloud.and.arrow.down"), 0);
  [v2 sizeToFit];
  return v2;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t getSFSpeechAssetManagerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__1;
  v7 = __Block_byref_object_dispose__1;
  uint64_t v0 = getSFSpeechAssetManagerClass_softClass;
  uint64_t v8 = getSFSpeechAssetManagerClass_softClass;
  if (!getSFSpeechAssetManagerClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getSFSpeechAssetManagerClass_block_invoke;
    v2[3] = &unk_264A00CE0;
    v2[4] = &v3;
    __getSFSpeechAssetManagerClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

Class __getSFSpeechAssetManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpeechLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SpeechLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264A01120;
    uint64_t v5 = 0;
    SpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeechLibraryCore_frameworkLibrary) {
    __getSFSpeechAssetManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SFSpeechAssetManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getSFSpeechAssetManagerClass_block_invoke_cold_2();
  }
  getSFSpeechAssetManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __SpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpeechLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t TIInputModeIsChineseShuangpin()
{
  uint64_t result = [(id)TIInputModeGetBaseLanguage() isEqualToString:@"zh"];
  if (result)
  {
    Variant = (void *)TIInputModeGetVariant();
    return [Variant isEqualToString:@"Shuangpin"];
  }
  return result;
}

BOOL TICurrentShuangpinTypeUsesSemicolon()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
  return v1 == 7 || v1 == 2;
}

uint64_t TIGetCurrentShuangpinType()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
}

void *TIGetShuangpinTypes()
{
  return &unk_26E2A6DC0;
}

uint64_t TIGetCurrentShuangpinName()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");

  return TIGetShuangpinNameFromType(v1);
}

uint64_t TIGetShuangpinNameFromType(int a1)
{
  int v2 = a1 - 2;
  if ((a1 - 2) > 5 || ((0x3Du >> v2) & 1) == 0) {
    return 0;
  }
  long long v4 = off_264A01180[v2];
  uint64_t v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return [v5 localizedStringForKey:v4 value:&stru_26E29DC78 table:@"Preferences_pinyin"];
}

void *TIFilteredLayoutsByCurrentShuangpinType(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v4 = objc_msgSend((id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
  if (v4 == 7 || v4 == 2)
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    uint64_t v6 = [a1 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(a1);
          }
          id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v10 hasPrefix:@"Pinyin-"] & 1) == 0) {
            [v2 addObject:v10];
          }
        }
        uint64_t v7 = [a1 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    uint64_t v11 = [a1 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(a1);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          if (([v15 hasPrefix:@"Shuangpin-with-Semicolon-"] & 1) == 0) {
            [v2 addObject:v15];
          }
        }
        uint64_t v12 = [a1 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
  return v2;
}

id TIUpdateShuangpinSWLayout()
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers"), "mutableCopy");
  if (result)
  {
    id v1 = result;
    int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "normalizedEnabledInputModeIdentifiers"), "indexesOfObjectsPassingTest:", &__block_literal_global_5);
    uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    int v4 = objc_msgSend((id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
    BOOL v5 = v4 == 7 || v4 == 2;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __TIUpdateShuangpinSWLayout_block_invoke_2;
    id v10 = &unk_264A01160;
    char v6 = v5;
    id v11 = v1;
    char v12 = v6;
    [v2 enumerateIndexesUsingBlock:&v7];
    return (id)+[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", v1, v7, v8, v9, v10);
  }
  return result;
}

uint64_t __TIUpdateShuangpinSWLayout_block_invoke()
{
  return TIInputModeIsChineseShuangpin();
}

uint64_t __TIUpdateShuangpinSWLayout_block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  SWLayout = (void *)TIInputModeGetSWLayout();
  BOOL v5 = SWLayout;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t result = [SWLayout hasPrefix:@"Pinyin-"];
    if (!result) {
      return result;
    }
    uint64_t v7 = @"Pinyin-";
    uint64_t v8 = [@"Pinyin-" length];
    v9 = @"Shuangpin-with-Semicolon-";
  }
  else
  {
    uint64_t result = [SWLayout hasPrefix:@"Shuangpin-with-Semicolon-"];
    if (!result) {
      return result;
    }
    uint64_t v7 = @"Shuangpin-with-Semicolon-";
    uint64_t v8 = [@"Shuangpin-with-Semicolon-" length];
    v9 = @"Pinyin-";
  }
  uint64_t result = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v9, 0, 0, v8);
  if (result)
  {
    uint64_t v10 = UIKeyboardInputModeWithNewSWLayout();
    id v11 = *(void **)(a1 + 32);
    return [v11 replaceObjectAtIndex:a2 withObject:v10];
  }
  return result;
}

uint64_t HardwareKeyboardAvailabilityChanged_0(uint64_t a1, void *a2)
{
  return [a2 performSelectorOnMainThread:sel_hardwareKeyboardAvailabilityChanged withObject:0 waitUntilDone:0];
}

uint64_t TIInputModeIsChineseWubi()
{
  uint64_t result = [(id)TIInputModeGetBaseLanguage() isEqualToString:@"zh"];
  if (result)
  {
    Variant = (void *)TIInputModeGetVariant();
    return [Variant isEqualToString:@"Wubixing"];
  }
  return result;
}

uint64_t TIGetCurrentWubiStandard()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E950]), "integerValue");
}

void *TIGetWubiStandards()
{
  return &unk_26E2A6E08;
}

uint64_t TIGetCurrentWubiStandardName()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  unsigned int v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E950]), "integerValue");

  return TIGetWubiStandardName(v1);
}

uint64_t TIGetWubiStandardName(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  int v2 = off_264A012A8[a1];
  uint64_t v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return [v3 localizedStringForKey:v2 value:&stru_26E29DC78 table:@"Preferences_wubi"];
}

id TIUIGetMultilingualIDFromInputMode()
{
  uint64_t v0 = TIInputModeGetComponentsFromIdentifier();
  uint64_t v1 = [v0 objectForKey:@"ml"];

  return v1;
}

id TIUIInputModeGetMultilingualSet(uint64_t a1)
{
  return TIUIInputModeGetMultilingualSetFromInputModes(a1, 0);
}

id TIUIInputModeGetMultilingualSetFromInputModes(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = TIUIGetMultilingualIDFromInputMode();
  if ([v3 length])
  {
    int v4 = [MEMORY[0x263EFF980] array];
    if (v2)
    {
      id v5 = v2;
    }
    else
    {
      char v6 = [MEMORY[0x263F1C748] sharedInputModeController];
      id v5 = [v6 enabledInputModeIdentifiers];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = TIUIGetMultilingualIDFromInputMode();
          if (objc_msgSend(v3, "isEqualToString:", v13, (void)v15)) {
            [v4 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    int v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

uint64_t TIUIGetMultlingualSetsAreEqual(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = TIUIGetLanguagesForMultilingualSet(v3);
  char v6 = TIUIGetLanguagesForMultilingualSet(v4);
  if ([v5 isEqualToSet:v6])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v11), "isEqualToString:", @"vi_VN", (void)v21)) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      uint64_t v12 = TIUIGetOrderedLanguagesForMultilingualSet(v3);
      uint64_t v13 = TIUIGetOrderedLanguagesForMultilingualSet(v4);
      int v14 = [v12 isEqualToArray:v13];

      if (!v14) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_10:
    }
    long long v15 = objc_msgSend(v3, "firstObject", (void)v21);
    long long v16 = TIInputModeGetSWLayout();

    long long v17 = [v4 firstObject];
    long long v18 = TIInputModeGetSWLayout();

    if (v16 == v18) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = [v16 isEqualToString:v18];
    }
  }
  else
  {
LABEL_14:
    uint64_t v19 = 0;
  }

  return v19;
}

id TIUIGetLanguagesForMultilingualSet(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  id v2 = TIUIGetOrderedLanguagesForMultilingualSet(a1);
  id v3 = [v1 setWithArray:v2];

  return v3;
}

id TIUIGetOrderedLanguagesForMultilingualSet(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = TIInputModeGetLanguageWithRegion();
        objc_msgSend(v2, "addObject:", v8, v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id TIUIKeyboardInputModeGetIdentifierFromComponents(void *a1)
{
  id v1 = a1;
  id v2 = TIInputModeGetNormalizedIdentifierFromComponents();
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [v1 objectForKey:@"sw"];
  if ([v4 length])
  {
    uint64_t v5 = [@"sw=" stringByAppendingString:v4];
    [v3 addObject:v5];
  }
  uint64_t v6 = [v1 objectForKey:@"hw"];
  if ([v6 length])
  {
    id v7 = [@"hw=" stringByAppendingString:v6];
    [v3 addObject:v7];
  }
  uint64_t v8 = [v1 objectForKey:@"ml"];
  if ([v8 length])
  {
    uint64_t v9 = [@"ml=" stringByAppendingString:v8];
    [v3 addObject:v9];
  }
  if ([v3 count])
  {
    long long v10 = [v3 componentsJoinedByString:@";"];
    uint64_t v11 = [v2 stringByAppendingFormat:@"@%@", v10];

    id v2 = (void *)v11;
  }

  return v2;
}

id TIUIGetPairedInputModesForInputMode(void *a1)
{
  uint64_t v1 = TIUIGetPairedInputModesForInputMode___onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&TIUIGetPairedInputModesForInputMode___onceToken, &__block_literal_global_7);
  }
  id v3 = [(id)TIUIGetPairedInputModesForInputMode___pairedInputModes objectForKeyedSubscript:v2];

  return v3;
}

void __TIUIGetPairedInputModesForInputMode_block_invoke()
{
  uint64_t v0 = (void *)TIUIGetPairedInputModesForInputMode___pairedInputModes;
  TIUIGetPairedInputModesForInputMode___pairedInputModes = (uint64_t)&unk_26E2A7260;
}

BOOL TIUICanAddToMultilingualSet(void *a1)
{
  return TIUICanAddInputModeToMultilingualSet(0, a1);
}

BOOL TIUICanAddInputModeToMultilingualSet(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = GetDependentMultilingualInputModes();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = TIInputModeGetNormalizedIdentifier();
        if (objc_msgSend(v5, "containsObject:", v11, v14)
          && (!v3
           || [v5 containsObject:v3]
           && (([&unk_26E2A6EE0 containsObject:v3] & 1) != 0 || isH13ANEPresentOnIOS()))
          && (unint64_t)[v6 count] < 5)
        {

          BOOL v12 = 1;
          goto LABEL_16;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = (unint64_t)[v6 count] < 2;
LABEL_16:

  return v12;
}

id GetDependentMultilingualInputModes()
{
  if (GetDependentMultilingualInputModes___onceToken != -1) {
    dispatch_once(&GetDependentMultilingualInputModes___onceToken, &__block_literal_global_134);
  }
  uint64_t v0 = (void *)GetDependentMultilingualInputModes___dependentInputModes;

  return v0;
}

id TIUIGetAddableInputModesForMultilingualSet(void *a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (TIUICanAddInputModeToMultilingualSet(0, v1))
  {
    id v2 = v1;
    id v3 = (void *)[v2 mutableCopy];
    if ([v3 count])
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = [v2 objectAtIndexedSubscript:v4];
        id v6 = TIInputModeGetNormalizedIdentifier();
        [v3 replaceObjectAtIndex:v4 withObject:v6];

        ++v4;
      }
      while (v4 < [v3 count]);
    }

    v46 = GetMultilingualInputModes();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v64;
      BOOL v12 = (void *)MEMORY[0x263EFFA68];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v64 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          if (![v46 containsObject:v14])
          {
            id v19 = v7;
            long long v18 = v12;
            goto LABEL_50;
          }
          GetDependentMultilingualInputModes();
          v16 = int v15 = v10;
          int v17 = [v16 containsObject:v14];

          int v10 = v17 | v15;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v63 objects:v70 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    char v43 = v10;
    v44 = v2;
    id v45 = v1;

    v47 = [MEMORY[0x263EFF980] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v20 = GetDependentMultilingualInputModes();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v60 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          if (([v7 containsObject:v25] & 1) == 0)
          {
            uint64_t v26 = GetRequiredInputModesForDependentInputMode(v25);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v27 = v26;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v55 objects:v68 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v56;
              while (2)
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v56 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  if ([v7 containsObject:*(void *)(*((void *)&v55 + 1) + 8 * k)])
                  {

                    if (([&unk_26E2A6EE0 containsObject:v25] & 1) != 0
                      || isH13ANEPresentOnIOS())
                    {
                      [v47 addObject:v25];
                    }
                    goto LABEL_35;
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v55 objects:v68 count:16];
                if (v29) {
                  continue;
                }
                break;
              }
            }

LABEL_35:
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v22);
    }

    id v1 = v45;
    long long v18 = v47;
    if ((v43 & 1) == 0)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v32 = GetBilingualInputModes();
      uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v52;
        do
        {
          for (uint64_t m = 0; m != v34; ++m)
          {
            if (*(void *)v52 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * m);
            if (([v7 containsObject:v37] & 1) == 0) {
              [v47 addObject:v37];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v67 count:16];
        }
        while (v34);
      }
    }
    v38 = [MEMORY[0x263F1C748] sharedInputModeController];
    v39 = [v38 enabledInputModeIdentifiers];

    v40 = (void *)MEMORY[0x263F08A98];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __TIUIGetAddableInputModesForMultilingualSet_block_invoke;
    v48[3] = &unk_264A012C8;
    id v49 = v39;
    id v50 = v44;
    id v19 = v39;
    v41 = [v40 predicateWithBlock:v48];
    [v47 filterUsingPredicate:v41];

LABEL_50:
  }
  else
  {
    long long v18 = (void *)MEMORY[0x263EFFA68];
  }

  return v18;
}

id GetMultilingualInputModes()
{
  uint64_t v0 = GetBilingualInputModes();
  id v1 = GetDependentMultilingualInputModes();
  id v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

id GetRequiredInputModesForDependentInputMode(void *a1)
{
  id v1 = a1;
  if (GetRequiredInputModesForDependentInputMode_onceToken != -1) {
    dispatch_once(&GetRequiredInputModesForDependentInputMode_onceToken, &__block_literal_global_142);
  }
  if ([(id)GetRequiredInputModesForDependentInputMode___transliterationInputModes containsObject:v1])id v2 = (id)GetRequiredInputModesForDependentInputMode___englishInputModes; {
  else
  }
    id v2 = 0;

  return v2;
}

id GetBilingualInputModes()
{
  if (GetBilingualInputModes___onceToken != -1) {
    dispatch_once(&GetBilingualInputModes___onceToken, &__block_literal_global_177);
  }
  uint64_t v0 = (void *)GetBilingualInputModes___bilingualInputModes;

  return v0;
}

uint64_t __TIUIGetAddableInputModesForMultilingualSet_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = TIUIGetProposedMultilingualSetsForAddingInputMode(a2, *(void **)(a1 + 32));
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "objectForKeyedSubscript:", @"current", (void)v12);
        char v9 = [v8 isEqualToArray:*(void *)(a1 + 40)];

        if (v9)
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

id TIUIGetProposedMultilingualSetsForAddingInputMode(void *a1, void *a2)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  v87 = GetMultilingualInputModes();
  if ([v87 containsObject:v3])
  {
    id v83 = v3;
    uint64_t v5 = [MEMORY[0x263EFF9B0] orderedSet];
    v93 = [MEMORY[0x263EFF9A0] dictionary];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v81 = v4;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v104 objects:v123 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v105 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v104 + 1) + 8 * i);
          uint64_t v11 = TIInputModeGetNormalizedIdentifier();
          if ([v87 containsObject:v11])
          {
            long long v12 = TIUIGetMultilingualIDFromInputMode();
            long long v13 = v12;
            if (v12)
            {
              id v14 = v12;
            }
            else
            {
              id v14 = [NSString stringWithFormat:@"%@%@", @"_", v10];
            }
            long long v15 = v14;

            long long v16 = [v93 objectForKeyedSubscript:v15];
            if (!v16)
            {
              long long v16 = [MEMORY[0x263EFF980] array];
              [v93 setObject:v16 forKeyedSubscript:v15];
            }
            [v16 addObject:v10];
            [v5 addObject:v15];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v104 objects:v123 count:16];
      }
      while (v7);
    }

    v82 = [MEMORY[0x263EFF980] array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v84 = v5;
    uint64_t v17 = [v84 countByEnumeratingWithState:&v100 objects:v122 count:16];
    id v3 = v83;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v86 = *(void *)v101;
      unint64_t v19 = 0x263F08000;
      do
      {
        uint64_t v20 = 0;
        uint64_t v85 = v18;
        do
        {
          if (*(void *)v101 != v86) {
            objc_enumerationMutation(v84);
          }
          uint64_t v21 = *(void **)(*((void *)&v100 + 1) + 8 * v20);
          uint64_t v22 = [v93 objectForKeyedSubscript:v21];
          if ([v21 hasPrefix:@"_"])
          {
            id v23 = v3;
            id v91 = v22;
            long long v24 = GetDependentMultilingualInputModes();
            int v25 = [v24 containsObject:v23];

            uint64_t v88 = v20;
            v89 = v22;
            if (v25)
            {
              if (([&unk_26E2A6EE0 containsObject:v23] & 1) != 0
                || isH13ANEPresentOnIOS())
              {
                GetRequiredInputModesForDependentInputMode(v23);
                id v26 = (id)objc_claimAutoreleasedReturnValue();
                long long v108 = 0u;
                long long v109 = 0u;
                long long v110 = 0u;
                long long v111 = 0u;
                id v27 = v91;
                id v28 = (id)[v27 countByEnumeratingWithState:&v108 objects:v124 count:16];
                if (v28)
                {
                  uint64_t v29 = *(void *)v109;
LABEL_27:
                  uint64_t v30 = 0;
                  while (1)
                  {
                    if (*(void *)v109 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    v31 = *(void **)(*((void *)&v108 + 1) + 8 * v30);
                    v32 = TIInputModeGetNormalizedIdentifier();
                    char v33 = [v26 containsObject:v32];

                    if (v33) {
                      break;
                    }
                    if (v28 == (id)++v30)
                    {
                      id v28 = (id)[v27 countByEnumeratingWithState:&v108 objects:v124 count:16];
                      if (v28) {
                        goto LABEL_27;
                      }
                      goto LABEL_61;
                    }
                  }
LABEL_60:
                  id v28 = v31;
LABEL_61:
                  id v3 = v83;
                  uint64_t v18 = v85;
                  uint64_t v20 = v88;
                  uint64_t v22 = v89;
                }

                goto LABEL_63;
              }
LABEL_57:
              id v28 = 0;
            }
            else
            {
              uint64_t v36 = GetBilingualInputModes();
              int v37 = [v36 containsObject:v23];

              if (!v37) {
                goto LABEL_57;
              }
              long long v110 = 0u;
              long long v111 = 0u;
              long long v108 = 0u;
              long long v109 = 0u;
              id v26 = v91;
              uint64_t v94 = [v26 countByEnumeratingWithState:&v108 objects:v124 count:16];
              if (v94)
              {
                uint64_t v38 = *(void *)v109;
                do
                {
                  for (uint64_t j = 0; j != v94; ++j)
                  {
                    if (*(void *)v109 != v38) {
                      objc_enumerationMutation(v26);
                    }
                    v31 = *(void **)(*((void *)&v108 + 1) + 8 * j);
                    TIInputModeGetNormalizedIdentifier();
                    id v27 = (id)objc_claimAutoreleasedReturnValue();
                    v40 = GetBilingualInputModes();
                    if ([v40 containsObject:v27])
                    {
                      v41 = [MEMORY[0x263EFF960] baseLanguageFromLanguage:v23];
                      [MEMORY[0x263EFF960] baseLanguageFromLanguage:v27];
                      uint64_t v42 = v38;
                      id v43 = v26;
                      id v45 = v44 = v23;
                      int v46 = [v41 isEqualToString:v45];

                      id v23 = v44;
                      id v26 = v43;
                      uint64_t v38 = v42;

                      if (!v46)
                      {
                        unint64_t v19 = 0x263F08000uLL;
                        goto LABEL_60;
                      }
                    }
                    else
                    {
                    }
                    v47 = GetDependentMultilingualInputModes();
                    if ([v47 containsObject:v27])
                    {
                      v48 = GetRequiredInputModesForDependentInputMode(v27);
                      int v49 = [v48 containsObject:v23];

                      unint64_t v19 = 0x263F08000;
                      if (v49
                        && (([&unk_26E2A6EE0 containsObject:v27] & 1) != 0
                         || (isH13ANEPresentOnIOS() & 1) != 0))
                      {
                        goto LABEL_60;
                      }
                    }
                    else
                    {

                      unint64_t v19 = 0x263F08000;
                    }
                  }
                  uint64_t v94 = [v26 countByEnumeratingWithState:&v108 objects:v124 count:16];
                }
                while (v94);
                id v28 = 0;
                id v3 = v83;
                uint64_t v18 = v85;
                uint64_t v20 = v88;
              }
              else
              {
                id v28 = 0;
              }
              uint64_t v22 = v89;
LABEL_63:
            }
            if (v28)
            {
              v95 = v28;
              id v50 = obj;
              long long v51 = [MEMORY[0x263EFF980] array];
              long long v108 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              id v52 = v50;
              uint64_t v53 = [v52 countByEnumeratingWithState:&v108 objects:v124 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                uint64_t v55 = *(void *)v109;
                do
                {
                  for (uint64_t k = 0; k != v54; ++k)
                  {
                    if (*(void *)v109 != v55) {
                      objc_enumerationMutation(v52);
                    }
                    long long v57 = TIUIGetMultilingualIDFromInputMode();
                    if ([v57 length])
                    {
                      long long v58 = objc_msgSend(*(id *)(v19 + 2584), "numberWithInteger:", objc_msgSend(v57, "integerValue"));
                      [v51 addObject:v58];
                    }
                  }
                  uint64_t v54 = [v52 countByEnumeratingWithState:&v108 objects:v124 count:16];
                }
                while (v54);
              }

              [v51 sortUsingSelector:sel_compare_];
              long long v59 = [v51 lastObject];
              uint64_t v60 = [v59 integerValue];

              long long v61 = [*(id *)(v19 + 2584) numberWithUnsignedInteger:v60 + 1];
              uint64_t v35 = [v61 stringValue];

              long long v62 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v95, 0, v35);
              uint64_t v63 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v23, v62, v35);
              long long v64 = TIUIGetPairedInputModesForInputMode(v23);
              if (![v64 count])
              {
                long long v65 = TIInputModeGetNormalizedIdentifier();
                uint64_t v66 = TIUIGetPairedInputModesForInputMode(v65);

                long long v64 = (void *)v66;
              }
              if ([v64 count])
              {
                v92 = (void *)v63;
                v67 = [MEMORY[0x263EFF980] arrayWithObject:v63];
                long long v96 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                id v68 = v64;
                uint64_t v69 = [v68 countByEnumeratingWithState:&v96 objects:v121 count:16];
                if (v69)
                {
                  uint64_t v70 = v69;
                  uint64_t v71 = *(void *)v97;
                  do
                  {
                    for (uint64_t m = 0; m != v70; ++m)
                    {
                      if (*(void *)v97 != v71) {
                        objc_enumerationMutation(v68);
                      }
                      v73 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(*(void **)(*((void *)&v96 + 1) + 8 * m), v62, v35);
                      [v67 addObject:v73];
                    }
                    uint64_t v70 = [v68 countByEnumeratingWithState:&v96 objects:v121 count:16];
                  }
                  while (v70);
                }

                v118 = v95;
                v119[0] = @"current";
                v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v118 count:1];
                v120[0] = v74;
                v119[1] = @"updated";
                v117 = v62;
                v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v117 count:1];
                v119[2] = @"added";
                v120[1] = v75;
                v120[2] = v67;
                v76 = [NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:3];
                v77 = v92;
              }
              else
              {
                v114 = v95;
                v115[0] = @"current";
                v77 = (void *)v63;
                v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
                v116[0] = v67;
                v115[1] = @"updated";
                v113 = v62;
                v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
                v116[1] = v74;
                v115[2] = @"added";
                uint64_t v112 = v63;
                v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v112 count:1];
                v116[2] = v75;
                v76 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:3];
              }
              [v82 addObject:v76];

              id v3 = v83;
              uint64_t v18 = v85;
              uint64_t v20 = v88;
              uint64_t v22 = v89;
              id v28 = v95;
LABEL_87:

              goto LABEL_88;
            }
            goto LABEL_88;
          }
          if (!TIUICanAddInputModeToMultilingualSet(v3, v22)) {
            goto LABEL_89;
          }
          uint64_t v34 = [v22 firstObject];
          GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v3, v34, v21);
          id v28 = (id)objc_claimAutoreleasedReturnValue();

          if (([obj containsObject:v28] & 1) == 0)
          {
            uint64_t v35 = TIUIGetProposedMultilingualSetByAddingInputMode(v3, v22);
            if (v35) {
              [v82 addObject:v35];
            }
            goto LABEL_87;
          }
LABEL_88:

LABEL_89:
          ++v20;
        }
        while (v20 != v18);
        uint64_t v18 = [v84 countByEnumeratingWithState:&v100 objects:v122 count:16];
      }
      while (v18);
    }

    v78 = v82;
    v79 = [v82 indexesOfObjectsPassingTest:&__block_literal_global_113];
    if ([v79 count]) {
      [v82 removeObjectsAtIndexes:v79];
    }

    id v4 = v81;
  }
  else
  {
    v78 = (void *)MEMORY[0x263EFFA68];
  }

  return v78;
}

uint64_t TIUIProposedInputModeGetCurrent(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:@"current"];
}

id GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = TIInputModeGetComponentsFromIdentifier();
  char v9 = (void *)[v8 mutableCopy];

  if (v6)
  {
    uint64_t v10 = TIInputModeGetComponentsFromIdentifier();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v9 objectForKey:@"sw"];
  if (![v11 length])
  {
    long long v12 = +[TIKeyboardListController softwareLayoutsForBaseInputMode:v5];
    long long v13 = [v10 objectForKeyedSubscript:@"sw"];
    if ([v13 length] && objc_msgSend(v12, "containsObject:", v13))
    {
      id v14 = v13;
    }
    else
    {
      id v14 = [v12 firstObject];
    }
    id v15 = v14;

    [v9 setObject:v15 forKeyedSubscript:@"sw"];
    uint64_t v11 = v15;
  }
  long long v16 = [v9 objectForKey:@"hw"];
  if (![v16 length])
  {
    uint64_t v17 = UIKeyboardGetSupportedHardwareKeyboardsForInputMode();
    uint64_t v18 = [v10 objectForKeyedSubscript:@"hw"];
    if ([v18 length] && objc_msgSend(v17, "containsObject:", v18))
    {
      id v19 = v18;
    }
    else
    {
      UIKeyboardGetDefaultHardwareKeyboardForInputMode();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v20 = v19;

    [v9 setObject:v20 forKeyedSubscript:@"hw"];
    long long v16 = v20;
  }
  [v9 setObject:v7 forKeyedSubscript:@"ml"];
  uint64_t v21 = TIUIKeyboardInputModeGetIdentifierFromComponents(v9);

  return v21;
}

id TIUIGetProposedMultilingualSetByAddingInputMode(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 firstObject];
  id v6 = TIUIGetMultilingualIDFromInputMode();

  id v7 = [v4 firstObject];
  uint64_t v8 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v3, v7, v6);

  char v9 = TIUIGetPairedInputModesForInputMode(v3);
  if ([v9 count])
  {
    uint64_t v22 = v8;
    id v23 = v3;
    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithObject:v8];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = [v4 firstObject];
          uint64_t v18 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v16, v17, v6);

          [v10 addObject:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v13);
    }

    v31[0] = @"current";
    v31[1] = @"added";
    v32[0] = v4;
    v32[1] = v10;
    id v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    uint64_t v8 = v22;
    id v3 = v23;
  }
  else
  {
    v29[1] = @"added";
    v30[0] = v4;
    id v28 = v8;
    v29[0] = @"current";
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    v30[1] = v10;
    id v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  }

  if (TIUIGetProposedInputModeIsValid(v19)) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  return v20;
}

uint64_t __TIUIGetProposedMultilingualSetsForAddingInputMode_block_invoke(uint64_t a1, void *a2)
{
  return TIUIGetProposedInputModeIsValid(a2) ^ 1;
}

uint64_t TIUIGetProposedInputModeIsValid(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = TIUIProposedInputModeGetMultilingualSet(a1);
  id v2 = [v1 firstObject];
  id v3 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();

  id v4 = (void *)MEMORY[0x263F1C740];
  id v5 = +[TIKeyboardListController inputModes];
  id v6 = [v4 multilingualSetsFromInputModeIdentifiers:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "identifier", (void)v16);
        uint64_t v13 = TIInputModeGetMultilingualSet();

        LOBYTE(v12) = TIUIGetMultlingualSetsAreEqual(v13, v3);
        if (v12)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

uint64_t TIUIProposedInputModeGetUpdated(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:@"updated"];
}

uint64_t TIUIProposedInputModeGetAdded(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:@"added"];
}

id TIUIProposedInputModeGetMultilingualSet(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"current"];
  id v3 = TIUIGetInputModesByAddingProposedInputMode(v1, v2);

  id v4 = [v3 firstObject];
  id v5 = TIUIInputModeGetMultilingualSetFromInputModes((uint64_t)v4, v3);

  return v5;
}

id TIUIGetInputModesByAddingProposedInputMode(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = (void *)[a2 mutableCopy];
  id v5 = [v3 objectForKeyedSubscript:@"current"];
  id v6 = [v3 objectForKeyedSubscript:@"updated"];
  id v7 = [v3 objectForKeyedSubscript:@"added"];
  if ([v7 count])
  {
    uint64_t v8 = [v5 lastObject];
    uint64_t v9 = [v4 indexOfObject:v8];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; objc_msgSend(v4, "insertObject:atIndex:", v15, i + v9, (void)v22))
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i++);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          v9 += i;
        }
        while (v12);
      }
    }
  }
  if (objc_msgSend(v6, "count", (void)v22) && objc_msgSend(v4, "count"))
  {
    unint64_t v16 = 0;
    do
    {
      long long v17 = [v4 objectAtIndexedSubscript:v16];
      unint64_t v18 = [v5 indexOfObject:v17];
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v19 = v18;
        if (v18 < [v6 count])
        {
          id v20 = [v6 objectAtIndexedSubscript:v19];
          [v4 replaceObjectAtIndex:v16 withObject:v20];
        }
      }

      ++v16;
    }
    while (v16 < [v4 count]);
  }

  return v4;
}

uint64_t TIUIGetCountOfUserVisibleInputModes()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C748] sharedInputModeController];
  id v1 = [v0 enabledInputModeIdentifiers];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = TIUIGetMultilingualIDFromInputMode();
        if (objc_msgSend(v9, "length", v11))
        {
          if ([v2 containsObject:v9]) {
            goto LABEL_10;
          }
          [v2 addObject:v9];
        }
        ++v6;
LABEL_10:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (!v5) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_14:

  return v6;
}

id TIUIGetLocalizedConcatenatedLanguageNamesForInputModes(void *a1)
{
  return TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(a1, 1);
}

id TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(void *a1, int a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:v4];
  }
  else
  {
    int v36 = a2;
    int v37 = v3;
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v7 = [MEMORY[0x263F1C748] sharedInputModeController];
    uint64_t v8 = [v7 enabledInputModeIdentifiers];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = TIInputModeGetLanguage();
          long long v14 = TIInputModeGetNormalizedIdentifier();
          uint64_t v15 = [v6 objectForKeyedSubscript:v13];
          if (!v15)
          {
            uint64_t v15 = [MEMORY[0x263EFF9C0] set];
            [v6 setObject:v15 forKeyedSubscript:v13];
          }
          [v15 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v37 firstObject];
    long long v17 = [MEMORY[0x263EFF960] preferredLanguages];
    unint64_t v18 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();

    unint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          if ((TIInputModeIsMultilingualOnly() & 1) == 0)
          {
            long long v25 = TIInputModeGetLanguage();
            long long v26 = [v6 objectForKeyedSubscript:v25];
            unint64_t v27 = [v26 count];

            if (v27 >= 2)
            {
              uint64_t v28 = TIInputModeGetNormalizedIdentifier();

              long long v25 = (void *)v28;
            }
            uint64_t v29 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:v25];
            [v19 addObject:v29];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v22);
    }

    if (v36)
    {
      uint64_t v30 = [v19 count];
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v32 = v31;
      if (v30 == 2) {
        char v33 = @"LIST_SEPARATOR_2";
      }
      else {
        char v33 = @"LIST_SEPARATOR";
      }
      uint64_t v34 = [v31 localizedStringForKey:v33 value:&stru_26E29DC78 table:@"Keyboard"];

      uint64_t v5 = [v19 componentsJoinedByString:v34];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v19];
    }

    id v3 = v37;
  }

  return v5;
}

uint64_t TIUIMultilingualSetGetLanguageCount(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 += TIInputModeIsMultilingualOnly() ^ 1;
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t TIUIMultilingualSetContainsTransliterationInputModes(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = TIInputModeGetNormalizedIdentifier();
        char IsTransliteration = TIInputModeIsTransliteration();

        if (IsTransliteration)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

void __GetDependentMultilingualInputModes_block_invoke()
{
  uint64_t v0 = (void *)GetDependentMultilingualInputModes___dependentInputModes;
  GetDependentMultilingualInputModes___dependentInputModes = (uint64_t)&unk_26E2A6EC8;
}

void __GetRequiredInputModesForDependentInputMode_block_invoke()
{
  uint64_t v0 = (void *)GetRequiredInputModesForDependentInputMode___transliterationInputModes;
  GetRequiredInputModesForDependentInputMode___transliterationInputModes = (uint64_t)&unk_26E2A6EF8;

  id v1 = (void *)GetRequiredInputModesForDependentInputMode___englishInputModes;
  GetRequiredInputModesForDependentInputMode___englishInputModes = (uint64_t)&unk_26E2A6F10;
}

void __GetBilingualInputModes_block_invoke()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v0 = [MEMORY[0x263F7E570] sharedInputModeController];
  id v1 = [v0 supportedInputModeIdentifiers];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    uint64_t v5 = *MEMORY[0x263F7E7A8];
    uint64_t v6 = *MEMORY[0x263F7E798];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        long long v9 = TIGetInputModeProperties();
        long long v10 = [v9 objectForKeyedSubscript:v5];
        int v11 = [v10 BOOLValue];

        if (v11)
        {
          long long v12 = [v9 objectForKeyedSubscript:v6];
          char v13 = [v12 BOOLValue];

          if ((v13 & 1) == 0) {
            [v15 addObject:v8];
          }
        }

        ++v7;
      }
      while (v3 != v7);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }

  [v15 removeObject:@"ko_KR"];
  long long v14 = (void *)GetBilingualInputModes___bilingualInputModes;
  GetBilingualInputModes___bilingualInputModes = (uint64_t)v15;
}

void ShortcutsDidChange(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __ShortcutsDidChange_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __ShortcutsDidChange_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyObserversOfChange];
}

void ManagedConfigurationLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)"), @"KeyboardController.m", 62, @"%s", *a1);
  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke"), @"KeyboardController.m", 63, @"Unable to find class %s", "MCProfileConnection");
  __break(1u);
}

void __getSFSpeechAssetManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *SpeechLibrary(void)"), @"TIKeyboardListController.m", 57, @"%s", *a1);
  __break(1u);
}

void __getSFSpeechAssetManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSFSpeechAssetManagerClass(void)_block_invoke"), @"TIKeyboardListController.m", 58, @"Unable to find class %s", "SFSpeechAssetManager");
  __break(1u);
  AFDeviceHighestLanguageModelCapabilityIdentifier();
}

uint64_t AFDeviceHighestLanguageModelCapabilityIdentifier()
{
  return MEMORY[0x270F0EC80]();
}

uint64_t AFDictationRestricted()
{
  return MEMORY[0x270F0ED18]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x270F0EE40]();
}

uint64_t AFOfflineDictationStatusStringAssetId()
{
  return MEMORY[0x270F0EE48]();
}

uint64_t AFOfflineDictationStatusStringIsHighQualityModelInstalled()
{
  return MEMORY[0x270F0EE50]();
}

uint64_t AFOfflineDictationStatusStringIsHighQualityModelSupported()
{
  return MEMORY[0x270F0EE58]();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return MEMORY[0x270F0EE60]();
}

uint64_t AFOfflineDictationStatusStringIsInstalling()
{
  return MEMORY[0x270F0EE68]();
}

uint64_t AFOfflineDictationStatusStringIsOnDeviceSearchSupported()
{
  return MEMORY[0x270F0EE70]();
}

uint64_t BKSHIDKeyboardGetDeviceProperties()
{
  return MEMORY[0x270F104D0]();
}

uint64_t BKSHIDKeyboardWantsStandardTypeOverride()
{
  return MEMORY[0x270F104D8]();
}

uint64_t BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel()
{
  return MEMORY[0x270F104F0]();
}

uint64_t BKSHIDServicesGetHardwareKeyboardLanguage()
{
  return MEMORY[0x270F10508]();
}

uint64_t BKSHIDServicesProductIdentifierFromServiceProperties()
{
  return MEMORY[0x270F10538]();
}

uint64_t BKSHIDServicesSetStandardType()
{
  return MEMORY[0x270F10570]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x270F30618]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x270EF4418](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingBlock()
{
  return MEMORY[0x270EF4438]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x270EF4478]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x270EF4490]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4658](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x270EF4660](service);
}

uint64_t IOHIDServiceClientRegisterRemovalBlock()
{
  return MEMORY[0x270EF4668]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF4680](service, key, property);
}

uint64_t IXACanLogMessageAtLevel()
{
  return MEMORY[0x270F7CBA0]();
}

uint64_t IXAFeedbackLogFacility()
{
  return MEMORY[0x270F7CBB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return MEMORY[0x270F795D0]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x270F79658]();
}

uint64_t TIGetAddKeyboardUsesPickerForInputMode()
{
  return MEMORY[0x270F7CBF0]();
}

uint64_t TIGetInputModeProperties()
{
  return MEMORY[0x270F7CBF8]();
}

uint64_t TIInputModeGetBaseLanguage()
{
  return MEMORY[0x270F7CC00]();
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x270F7CC08]();
}

uint64_t TIInputModeGetLanguage()
{
  return MEMORY[0x270F7CC10]();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return MEMORY[0x270F7CC18]();
}

uint64_t TIInputModeGetMultilingualID()
{
  return MEMORY[0x270F7CC20]();
}

uint64_t TIInputModeGetMultilingualSet()
{
  return MEMORY[0x270F7CC28]();
}

uint64_t TIInputModeGetMultilingualSetFromInputModes()
{
  return MEMORY[0x270F7CC30]();
}

uint64_t TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages()
{
  return MEMORY[0x270F7CC38]();
}

uint64_t TIInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x270F7CC40]();
}

uint64_t TIInputModeGetNormalizedIdentifierFromComponents()
{
  return MEMORY[0x270F7CC48]();
}

uint64_t TIInputModeGetSWLayout()
{
  return MEMORY[0x270F7CC50]();
}

uint64_t TIInputModeGetVariant()
{
  return MEMORY[0x270F7CC58]();
}

uint64_t TIInputModeIsMultilingualOnly()
{
  return MEMORY[0x270F7CC60]();
}

uint64_t TIInputModeIsTransliteration()
{
  return MEMORY[0x270F7CC68]();
}

uint64_t TIStatisticDistributionPushValue()
{
  return MEMORY[0x270F7CC78]();
}

uint64_t TIStatisticGetKey()
{
  return MEMORY[0x270F7CC80]();
}

uint64_t TIStatisticGetKeyForInputMode()
{
  return MEMORY[0x270F7CC90]();
}

uint64_t TIStatisticScalarIncrement()
{
  return MEMORY[0x270F7CCA0]();
}

uint64_t TIStatisticScalarSetBoolean()
{
  return MEMORY[0x270F7CCA8]();
}

uint64_t TIStatisticScalarSetValue()
{
  return MEMORY[0x270F7CCB0]();
}

uint64_t TIStatisticShouldSample()
{
  return MEMORY[0x270F7CCB8]();
}

uint64_t TUIDictationTitle()
{
  return MEMORY[0x270F7D298]();
}

uint64_t TUIKeyboardDisplayNameFromIdentifier()
{
  return MEMORY[0x270F7D2A0]();
}

uint64_t TUIKeyboardDisplayNameFromIdentifierForContext()
{
  return MEMORY[0x270F7D2A8]();
}

uint64_t TUIKeyboardTitle()
{
  return MEMORY[0x270F7D2B0]();
}

uint64_t TUIKeyboardTitleInLanguage()
{
  return MEMORY[0x270F7D2B8]();
}

uint64_t UIKeyboardCheckSpellingPossibleForInputMode()
{
  return MEMORY[0x270F06090]();
}

uint64_t UIKeyboardDeviceSupportsSplit()
{
  return MEMORY[0x270F060A0]();
}

uint64_t UIKeyboardGetActiveInputModes()
{
  return MEMORY[0x270F060B8]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x270F060C8]();
}

uint64_t UIKeyboardGetDefaultHardwareKeyboardForInputMode()
{
  return MEMORY[0x270F060D8]();
}

uint64_t UIKeyboardGetSupportedHardwareKeyboardsForInputMode()
{
  return MEMORY[0x270F060E8]();
}

uint64_t UIKeyboardGetSupportedInputModes()
{
  return MEMORY[0x270F060F0]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputMode()
{
  return MEMORY[0x270F06100]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x270F06110]();
}

uint64_t UIKeyboardInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x270F06118]();
}

uint64_t UIKeyboardInputModeGetIdentifierFromComponents()
{
  return MEMORY[0x270F06120]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x270F06130]();
}

uint64_t UIKeyboardInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x270F06138]();
}

uint64_t UIKeyboardInputModeGetRegion()
{
  return MEMORY[0x270F06148]();
}

uint64_t UIKeyboardInputModeGetVariant()
{
  return MEMORY[0x270F06150]();
}

uint64_t UIKeyboardInputModeWithNewHWLayout()
{
  return MEMORY[0x270F06158]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x270F06160]();
}

uint64_t UIKeyboardInputModesMatchingMode()
{
  return MEMORY[0x270F06168]();
}

uint64_t UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable()
{
  return MEMORY[0x270F06178]();
}

uint64_t UIKeyboardLayoutSupportsASCIIToggleKey()
{
  return MEMORY[0x270F06180]();
}

uint64_t UIKeyboardPredictionEnabledForInputModes()
{
  return MEMORY[0x270F061A0]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x270F062A0]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F062A8]();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return MEMORY[0x270F0F050]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t isH13ANEPresentOnIOS()
{
  return MEMORY[0x270F7CCC8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}
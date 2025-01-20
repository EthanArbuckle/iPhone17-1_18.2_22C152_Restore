void *LocStringKeyBasedOnLanguageCount(void *result, unint64_t a2, uint64_t a3)
{
  uint64_t vars8;

  if (a2 >= 2) {
    result = (void *)[result stringByAppendingString:@"S"];
  }
  if (a3)
  {
    return (void *)[result stringByAppendingString:a3];
  }
  return result;
}

void sub_2543D48C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
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

void sub_2543D5898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HardwareKeyboardAvailabilityChanged(uint64_t a1, void *a2)
{
  return [a2 performSelectorOnMainThread:sel_hardwareKeyboardAvailabilityChanged withObject:0 waitUntilDone:0];
}

void sub_2543D6760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getMCProfileConnectionClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getMCProfileConnectionClass_softClass;
  uint64_t v8 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getMCProfileConnectionClass_block_invoke;
    v2[3] = &unk_2653A9280;
    v2[4] = &v3;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2543D80F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMCKeyboardSettingsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)ManagedConfigurationLibrary();
  result = dlsym(v2, "MCKeyboardSettingsChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2653A92A0;
    uint64_t v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
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

void sub_2543DDCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id location)
{
  objc_destroyWeak(v54);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t IsTrialAssetDeliveryEnabled()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.internal.ck"];
  uint64_t v1 = [v0 objectForKey:@"disableTrialAssetDelivery"];
  char v2 = [v1 BOOLValue];

  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    long long v4 = [v0 objectForKey:@"enableTrialAssetDelivery"];
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

uint64_t HardwareKeyboardAvailabilityChanged_0(uint64_t a1, void *a2)
{
  return [a2 performSelectorOnMainThread:sel_hardwareKeyboardAvailabilityChanged withObject:0 waitUntilDone:0];
}

__CFString *TUIKeyboardDisplayNameFromIdentifierForContext(void *a1, uint64_t a2)
{
  long long v4 = (void *)[MEMORY[0x263F1C740] keyboardInputModeWithIdentifier:a1];
  if ([v4 isExtensionInputMode])
  {
    return (__CFString *)objc_msgSend(v4, "safe__extendedDisplayName");
  }
  if ([a1 hasPrefix:*MEMORY[0x263F1D438]]) {
    return @"QWERTY";
  }
  TIInputModeGetNormalizedIdentifier();
  uint64_t LanguageWithRegion = TIInputModeGetLanguageWithRegion();
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", LanguageWithRegion, &stru_2703C6C20, @"KeyboardTitles");
  if (([v6 isEqualToString:LanguageWithRegion] & 1) == 0 && v6) {
    return (__CFString *)v6;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF960], "localeForBundleLanguage:", objc_msgSend(MEMORY[0x263F086E0], "mainBundle"));
  if (_ReducedLanguageIdentifierForKeyboardLanguage___onceToken != -1) {
    dispatch_once(&_ReducedLanguageIdentifierForKeyboardLanguage___onceToken, &__block_literal_global_230);
  }
  if ((unint64_t)objc_msgSend((id)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts, "countForObject:", objc_msgSend(MEMORY[0x263EFF960], "baseLanguageFromLanguage:", LanguageWithRegion)) <= 1)uint64_t LanguageWithRegion = objc_msgSend(MEMORY[0x263EFF960], "baseLanguageFromLanguage:", LanguageWithRegion); {
  return (__CFString *)[v8 localizedStringForLanguage:LanguageWithRegion context:a2];
  }
}

void sub_2543E4B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t getSFSpeechAssetManagerClass()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getSFSpeechAssetManagerClass_softClass;
  uint64_t v8 = getSFSpeechAssetManagerClass_softClass;
  if (!getSFSpeechAssetManagerClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getSFSpeechAssetManagerClass_block_invoke;
    v2[3] = &unk_2653A9280;
    v2[4] = &v3;
    __getSFSpeechAssetManagerClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2543E6D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
    long long v4 = xmmword_2653A9598;
    uint64_t v5 = 0;
    SpeechLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpeechLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSFSpeechAssetManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SFSpeechAssetManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    goto LABEL_8;
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
  uint64_t v10 = (void *)IOHIDServiceClientCopyProperty(a2, @"CapsLockLanguageSwitch");
  v11 = (void *)IOHIDServiceClientCopyProperty(a2, @"KeyboardLanguage");
  if ([v11 length]
    && (([v10 BOOLValue] & 1) != 0
     || [v11 isEqualToString:@"Simplified Chinese Keyboard"]))
  {
    uint64_t v12 = +[KSHardwareKeyboardController IOHIDKeyboardLanguageToCapsLockKeyLabel];
    uint64_t v13 = [v12 objectForKey:v11];
  }
  else
  {
    uint64_t v13 = 0;
  }

  if (!v13)
  {
LABEL_10:
    if (a4)
    {
      uint64_t v14 = [(id)_keyToSymbol objectForKeyedSubscript:v7];
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v15 = 0;
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v15 = v13;

  uint64_t v14 = 0;
  v9 = v15;
  if (v8)
  {
LABEL_14:
    uint64_t v16 = [v9 stringByAppendingString:v8];

    v9 = (void *)v16;
  }
LABEL_15:
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:v9 value:&stru_2703C6C20 table:@"Keyboard"];

  v19 = +[KSKeyboardListController attributedTitleForSymbolName:v14 cellTitle:v18];

  return v19;
}

void sub_2543EC194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id location)
{
  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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
  v34[0] = &unk_2703CE4E0;
  v34[1] = &unk_2703CE4F8;
  v33[2] = @"Option";
  v33[3] = @"Command";
  v34[2] = &unk_2703CE510;
  v34[3] = &unk_2703CE528;
  v33[4] = @"Escape";
  v33[5] = @"Function";
  v34[4] = &unk_2703CE540;
  v34[5] = &unk_2703CE558;
  v33[6] = @"Globe";
  v33[7] = @"NoAction";
  v34[6] = &unk_2703CE570;
  v34[7] = &unk_2703CE588;
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
  uint64_t v3 = (void *)_keyToTitle;
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

uint64_t KSInputModeIsChineseWubi()
{
  uint64_t result = [(id)TIInputModeGetBaseLanguage() isEqualToString:@"zh"];
  if (result)
  {
    Variant = (void *)TIInputModeGetVariant();
    return [Variant isEqualToString:@"Wubixing"];
  }
  return result;
}

uint64_t KSGetCurrentWubiStandard()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E950]), "integerValue");
}

void *KSGetWubiStandards()
{
  return &unk_2703CE5A0;
}

uint64_t KSGetCurrentWubiStandardName()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  unsigned int v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E950]), "integerValue");
  return KSGetWubiStandardName(v1);
}

uint64_t KSGetWubiStandardName(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  uint64_t v2 = off_2653A95B8[a1];
  uint64_t v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return [v3 localizedStringForKey:v2 value:&stru_2703C6C20 table:@"Preferences_wubi"];
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

void sub_2543F1848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
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
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    if (v2)
    {
      id v5 = v2;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F1C748] sharedInputModeController];
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
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

uint64_t TIUIGetMultlingualSetsAreEqual(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = TIUIGetLanguagesForMultilingualSet(v3);
  uint64_t v6 = TIUIGetLanguagesForMultilingualSet(v4);
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
  TIUIGetPairedInputModesForInputMode___pairedInputModes = (uint64_t)&unk_2703CE9E0;
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
           && (([&unk_2703CE678 containsObject:v3] & 1) != 0 || isH13ANEPresentOnIOS()))
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
    dispatch_once(&GetDependentMultilingualInputModes___onceToken, &__block_literal_global_138);
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

                    if (([&unk_2703CE678 containsObject:v25] & 1) != 0
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
    v48[3] = &unk_2653A9730;
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
    dispatch_once(&GetRequiredInputModesForDependentInputMode_onceToken, &__block_literal_global_146);
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
    dispatch_once(&GetBilingualInputModes___onceToken, &__block_literal_global_181);
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
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  v90 = GetMultilingualInputModes();
  if ([v90 containsObject:v3])
  {
    id v86 = v3;
    uint64_t v5 = [MEMORY[0x263EFF9B0] orderedSet];
    v95 = [MEMORY[0x263EFF9A0] dictionary];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v83 = v4;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v106 objects:v125 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v107 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v106 + 1) + 8 * i);
          uint64_t v11 = TIInputModeGetNormalizedIdentifier();
          if ([v90 containsObject:v11])
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

            long long v16 = [v95 objectForKeyedSubscript:v15];
            if (!v16)
            {
              long long v16 = [MEMORY[0x263EFF980] array];
              [v95 setObject:v16 forKeyedSubscript:v15];
            }
            [v16 addObject:v10];
            [v5 addObject:v15];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v106 objects:v125 count:16];
      }
      while (v7);
    }

    v85 = [MEMORY[0x263EFF980] array];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v87 = v5;
    uint64_t v17 = [v87 countByEnumeratingWithState:&v102 objects:v124 count:16];
    id v3 = v86;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v103;
      unint64_t v20 = 0x263F08000;
      uint64_t v84 = *(void *)v103;
      do
      {
        uint64_t v21 = 0;
        uint64_t v88 = v18;
        do
        {
          if (*(void *)v103 != v19) {
            objc_enumerationMutation(v87);
          }
          uint64_t v22 = *(void **)(*((void *)&v102 + 1) + 8 * v21);
          uint64_t v23 = [v95 objectForKeyedSubscript:v22];
          if ([v22 hasPrefix:@"_"])
          {
            id v24 = v3;
            id v92 = v23;
            long long v25 = GetDependentMultilingualInputModes();
            int v26 = [v25 containsObject:v24];

            uint64_t v89 = v21;
            v94 = v23;
            if (v26)
            {
              if (([&unk_2703CE678 containsObject:v24] & 1) != 0
                || isH13ANEPresentOnIOS())
              {
                GetRequiredInputModesForDependentInputMode(v24);
                id v27 = (id)objc_claimAutoreleasedReturnValue();
                long long v110 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                long long v113 = 0u;
                id v28 = v92;
                id v29 = (id)[v28 countByEnumeratingWithState:&v110 objects:v126 count:16];
                if (v29)
                {
                  uint64_t v30 = *(void *)v111;
LABEL_27:
                  uint64_t v31 = 0;
                  while (1)
                  {
                    if (*(void *)v111 != v30) {
                      objc_enumerationMutation(v28);
                    }
                    v32 = *(void **)(*((void *)&v110 + 1) + 8 * v31);
                    uint64_t v33 = TIInputModeGetNormalizedIdentifier();
                    char v34 = [v27 containsObject:v33];

                    if (v34) {
                      break;
                    }
                    if (v29 == (id)++v31)
                    {
                      id v29 = (id)[v28 countByEnumeratingWithState:&v110 objects:v126 count:16];
                      if (v29) {
                        goto LABEL_27;
                      }
                      goto LABEL_61;
                    }
                  }
LABEL_60:
                  id v29 = v32;
LABEL_61:
                  id v3 = v86;
                  uint64_t v19 = v84;
                  uint64_t v18 = v88;
                  uint64_t v21 = v89;
                }

                goto LABEL_63;
              }
LABEL_57:
              id v29 = 0;
            }
            else
            {
              uint64_t v37 = GetBilingualInputModes();
              int v38 = [v37 containsObject:v24];

              if (!v38) {
                goto LABEL_57;
              }
              long long v112 = 0u;
              long long v113 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              id v27 = v92;
              uint64_t v96 = [v27 countByEnumeratingWithState:&v110 objects:v126 count:16];
              if (v96)
              {
                uint64_t v39 = *(void *)v111;
                do
                {
                  for (uint64_t j = 0; j != v96; ++j)
                  {
                    if (*(void *)v111 != v39) {
                      objc_enumerationMutation(v27);
                    }
                    v32 = *(void **)(*((void *)&v110 + 1) + 8 * j);
                    TIInputModeGetNormalizedIdentifier();
                    id v28 = (id)objc_claimAutoreleasedReturnValue();
                    v41 = GetBilingualInputModes();
                    if ([v41 containsObject:v28])
                    {
                      v42 = [MEMORY[0x263EFF960] baseLanguageFromLanguage:v24];
                      [MEMORY[0x263EFF960] baseLanguageFromLanguage:v28];
                      uint64_t v43 = v39;
                      id v44 = v27;
                      v46 = id v45 = v24;
                      int v47 = [v42 isEqualToString:v46];

                      id v24 = v45;
                      id v27 = v44;
                      uint64_t v39 = v43;

                      if (!v47)
                      {
                        unint64_t v20 = 0x263F08000uLL;
                        goto LABEL_60;
                      }
                    }
                    else
                    {
                    }
                    v48 = GetDependentMultilingualInputModes();
                    if ([v48 containsObject:v28])
                    {
                      id v49 = GetRequiredInputModesForDependentInputMode(v28);
                      int v50 = [v49 containsObject:v24];

                      unint64_t v20 = 0x263F08000;
                      if (v50
                        && (([&unk_2703CE678 containsObject:v28] & 1) != 0
                         || (isH13ANEPresentOnIOS() & 1) != 0))
                      {
                        goto LABEL_60;
                      }
                    }
                    else
                    {

                      unint64_t v20 = 0x263F08000;
                    }
                  }
                  uint64_t v96 = [v27 countByEnumeratingWithState:&v110 objects:v126 count:16];
                }
                while (v96);
                id v29 = 0;
                id v3 = v86;
                uint64_t v19 = v84;
                uint64_t v18 = v88;
              }
              else
              {
                id v29 = 0;
              }
              uint64_t v21 = v89;
LABEL_63:

              uint64_t v23 = v94;
            }

            if (v29)
            {
              v97 = v29;
              id v51 = obj;
              long long v52 = [MEMORY[0x263EFF980] array];
              long long v110 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              id v53 = v51;
              uint64_t v54 = [v53 countByEnumeratingWithState:&v110 objects:v126 count:16];
              if (v54)
              {
                uint64_t v55 = v54;
                uint64_t v56 = *(void *)v111;
                do
                {
                  for (uint64_t k = 0; k != v55; ++k)
                  {
                    if (*(void *)v111 != v56) {
                      objc_enumerationMutation(v53);
                    }
                    long long v58 = TIUIGetMultilingualIDFromInputMode();
                    if ([v58 length])
                    {
                      long long v59 = objc_msgSend(*(id *)(v20 + 2584), "numberWithInteger:", objc_msgSend(v58, "integerValue"));
                      [v52 addObject:v59];
                    }
                  }
                  uint64_t v55 = [v53 countByEnumeratingWithState:&v110 objects:v126 count:16];
                }
                while (v55);
              }

              [v52 sortUsingSelector:sel_compare_];
              long long v60 = [v52 lastObject];
              uint64_t v61 = [v60 integerValue];

              uint64_t v62 = v61 + 1;
              long long v63 = [*(id *)(v20 + 2584) numberWithUnsignedInteger:v61 + 1];
              if ([v52 containsObject:v63]) {
                TIUIGetProposedMultilingualSetsForAddingInputMode_cold_1();
              }

              long long v64 = [*(id *)(v20 + 2584) numberWithUnsignedInteger:v62];
              uint64_t v36 = [v64 stringValue];

              long long v65 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v97, 0, v36);
              long long v66 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v24, v65, v36);
              v67 = TIUIGetPairedInputModesForInputMode(v24);
              if (![v67 count])
              {
                v68 = TIInputModeGetNormalizedIdentifier();
                uint64_t v69 = TIUIGetPairedInputModesForInputMode(v68);

                v67 = (void *)v69;
              }
              if ([v67 count])
              {
                v93 = v66;
                v70 = [MEMORY[0x263EFF980] arrayWithObject:v66];
                long long v98 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                id v71 = v67;
                uint64_t v72 = [v71 countByEnumeratingWithState:&v98 objects:v123 count:16];
                if (v72)
                {
                  uint64_t v73 = v72;
                  uint64_t v74 = *(void *)v99;
                  do
                  {
                    for (uint64_t m = 0; m != v73; ++m)
                    {
                      if (*(void *)v99 != v74) {
                        objc_enumerationMutation(v71);
                      }
                      v76 = GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(*(void **)(*((void *)&v98 + 1) + 8 * m), v65, v36);
                      [v70 addObject:v76];
                    }
                    uint64_t v73 = [v71 countByEnumeratingWithState:&v98 objects:v123 count:16];
                  }
                  while (v73);
                }

                v120 = v97;
                v121[0] = @"current";
                v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
                v122[0] = v77;
                v121[1] = @"updated";
                v119 = v65;
                v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v119 count:1];
                v121[2] = @"added";
                v122[1] = v78;
                v122[2] = v70;
                v79 = [NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];
                uint64_t v19 = v84;
                long long v66 = v93;
              }
              else
              {
                v116 = v97;
                v117[0] = @"current";
                v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];
                v118[0] = v70;
                v117[1] = @"updated";
                v115 = v65;
                v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
                v118[1] = v77;
                v117[2] = @"added";
                v114 = v66;
                v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
                v118[2] = v78;
                v79 = [NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:3];
              }
              [v85 addObject:v79];

              id v3 = v86;
              uint64_t v18 = v88;
              uint64_t v21 = v89;
              id v29 = v97;
LABEL_88:

              uint64_t v23 = v94;
              goto LABEL_89;
            }
            goto LABEL_89;
          }
          if (!TIUICanAddInputModeToMultilingualSet(v3, v23)) {
            goto LABEL_90;
          }
          uint64_t v35 = [v23 firstObject];
          GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v3, v35, v22);
          id v29 = (id)objc_claimAutoreleasedReturnValue();

          if (([obj containsObject:v29] & 1) == 0)
          {
            v94 = v23;
            uint64_t v36 = TIUIGetProposedMultilingualSetByAddingInputMode(v3, v23);
            if (v36) {
              [v85 addObject:v36];
            }
            goto LABEL_88;
          }
LABEL_89:

LABEL_90:
          ++v21;
        }
        while (v21 != v18);
        uint64_t v18 = [v87 countByEnumeratingWithState:&v102 objects:v124 count:16];
      }
      while (v18);
    }

    v80 = v85;
    v81 = [v85 indexesOfObjectsPassingTest:&__block_literal_global_113];
    if ([v81 count]) {
      [v85 removeObjectsAtIndexes:v81];
    }

    id v4 = v83;
  }
  else
  {
    v80 = (void *)MEMORY[0x263EFFA68];
  }

  return v80;
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
    long long v12 = +[KSKeyboardListController softwareLayoutsForBaseInputMode:v5];
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
  id v5 = +[KSKeyboardListController inputModes];
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
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [v3 objectForKeyedSubscript:@"current"];
  id v7 = [v3 objectForKeyedSubscript:@"updated"];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"added"];
  if ([v8 count])
  {
    uint64_t v9 = [v6 lastObject];
    uint64_t v10 = [v5 indexOfObject:v9];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      TIUIGetInputModesByAddingProposedInputMode_cold_3();
    }
    id v24 = v4;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; [v5 insertObject:v16 atIndex:i + v10])
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i++);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        v10 += i;
      }
      while (v13);
    }

    id v4 = v24;
  }
  if ([v7 count])
  {
    uint64_t v17 = [v6 count];
    if (v17 != [v7 count]) {
      TIUIGetInputModesByAddingProposedInputMode_cold_2();
    }
    if ([v5 count])
    {
      unint64_t v18 = 0;
      do
      {
        long long v19 = [v5 objectAtIndexedSubscript:v18];
        unint64_t v20 = [v6 indexOfObject:v19];
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v21 = v20;
          if (v20 >= [v7 count]) {
            TIUIGetInputModesByAddingProposedInputMode_cold_1();
          }
          if (v21 < [v7 count])
          {
            uint64_t v22 = [v7 objectAtIndexedSubscript:v21];
            [v5 replaceObjectAtIndex:v18 withObject:v22];
          }
        }

        ++v18;
      }
      while (v18 < [v5 count]);
    }
  }

  return v5;
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
    uint64_t v5 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:v4];
  }
  else
  {
    int v36 = a2;
    uint64_t v37 = v3;
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
          id v15 = [v6 objectForKeyedSubscript:v13];
          if (!v15)
          {
            id v15 = [MEMORY[0x263EFF9C0] set];
            [v6 setObject:v15 forKeyedSubscript:v13];
          }
          [v15 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v37 firstObject];
    uint64_t v17 = [MEMORY[0x263EFF960] preferredLanguages];
    unint64_t v18 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();

    long long v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
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
            id v29 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:v25];
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
      uint64_t v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v32 = v31;
      if (v30 == 2) {
        uint64_t v33 = @"LIST_SEPARATOR_2";
      }
      else {
        uint64_t v33 = @"LIST_SEPARATOR";
      }
      uint64_t v34 = [v31 localizedStringForKey:v33 value:&stru_2703C6C20 table:@"Keyboard"];

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
  GetDependentMultilingualInputModes___dependentInputModes = (uint64_t)&unk_2703CE660;
}

void __GetRequiredInputModesForDependentInputMode_block_invoke()
{
  uint64_t v0 = (void *)GetRequiredInputModesForDependentInputMode___transliterationInputModes;
  GetRequiredInputModesForDependentInputMode___transliterationInputModes = (uint64_t)&unk_2703CE690;

  id v1 = (void *)GetRequiredInputModesForDependentInputMode___englishInputModes;
  GetRequiredInputModesForDependentInputMode___englishInputModes = (uint64_t)&unk_2703CE6A8;
}

void __GetBilingualInputModes_block_invoke()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v15 = [MEMORY[0x263EFF980] array];
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

uint64_t KSInputModeIsChineseShuangpin()
{
  uint64_t result = [(id)TIInputModeGetBaseLanguage() isEqualToString:@"zh"];
  if (result)
  {
    Variant = (void *)TIInputModeGetVariant();
    return [Variant isEqualToString:@"Shuangpin"];
  }
  return result;
}

BOOL KSCurrentShuangpinTypeUsesSemicolon()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
  return v1 == 7 || v1 == 2;
}

uint64_t KSGetCurrentShuangpinType()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
}

void *KSGetShuangpinTypes()
{
  return &unk_2703CE6C0;
}

uint64_t KSGetCurrentShuangpinName()
{
  uint64_t v0 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
  return KSGetShuangpinNameFromType(v1);
}

uint64_t KSGetShuangpinNameFromType(int a1)
{
  int v2 = a1 - 2;
  if ((a1 - 2) > 5 || ((0x3Du >> v2) & 1) == 0) {
    return 0;
  }
  uint64_t v4 = off_2653A97C8[v2];
  uint64_t v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return [v5 localizedStringForKey:v4 value:&stru_2703C6C20 table:@"Preferences_pinyin"];
}

void *KSFilteredLayoutsByCurrentShuangpinType(void *a1)
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
          long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
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
          id v15 = *(void **)(*((void *)&v17 + 1) + 8 * j);
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

id KSUpdateShuangpinSWLayout()
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers"), "mutableCopy");
  if (result)
  {
    id v1 = result;
    int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "normalizedEnabledInputModeIdentifiers"), "indexesOfObjectsPassingTest:", &__block_literal_global_9);
    uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    int v4 = objc_msgSend((id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x263F7E860]), "integerValue");
    BOOL v5 = v4 == 7 || v4 == 2;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    long long v9 = __KSUpdateShuangpinSWLayout_block_invoke_2;
    long long v10 = &unk_2653A97A8;
    char v6 = v5;
    id v11 = v1;
    char v12 = v6;
    [v2 enumerateIndexesUsingBlock:&v7];
    return (id)+[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", v1, v7, v8, v9, v10);
  }
  return result;
}

uint64_t __KSUpdateShuangpinSWLayout_block_invoke()
{
  return KSInputModeIsChineseShuangpin();
}

uint64_t __KSUpdateShuangpinSWLayout_block_invoke_2(uint64_t a1, uint64_t a2)
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
    long long v9 = @"Shuangpin-with-Semicolon-";
  }
  else
  {
    uint64_t result = [SWLayout hasPrefix:@"Shuangpin-with-Semicolon-"];
    if (!result) {
      return result;
    }
    uint64_t v7 = @"Shuangpin-with-Semicolon-";
    uint64_t v8 = [@"Shuangpin-with-Semicolon-" length];
    long long v9 = @"Pinyin-";
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

void sub_2543FA774(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2543FABD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2543FB6D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[KSHardwareKeyboardController readRomanCapsLockPreferenceValue:](v0);
}

void __getSFSpeechAssetManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:](v0);
}

void TIUIGetProposedMultilingualSetsForAddingInputMode_cold_1()
{
}

void TIUIGetInputModesByAddingProposedInputMode_cold_1()
{
  __assert_rtn("TIUIGetInputModesByAddingProposedInputMode", "TIUIMultilingualFunctions.m", 603, "index == NSNotFound || index < updatedInputModes.count");
}

void TIUIGetInputModesByAddingProposedInputMode_cold_2()
{
  __assert_rtn("TIUIGetInputModesByAddingProposedInputMode", "TIUIMultilingualFunctions.m", 598, "currentInputModes.count == updatedInputModes.count");
}

void TIUIGetInputModesByAddingProposedInputMode_cold_3()
{
  __assert_rtn("TIUIGetInputModesByAddingProposedInputMode", "TIUIMultilingualFunctions.m", 588, "insertionIndex != NSNotFound");
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

uint64_t UIKeyboardGetSupportedLanguages()
{
  return MEMORY[0x270F060F8]();
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
  return MEMORY[0x270F80B20]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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
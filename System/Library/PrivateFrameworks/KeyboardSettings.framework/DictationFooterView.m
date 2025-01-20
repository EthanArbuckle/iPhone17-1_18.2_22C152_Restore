@interface DictationFooterView
+ (id)dictationAutoPunctuationText;
- (DictationFooterView)initWithSpecifier:(id)a3;
- (id)explanationSuffixTextWithOfflineDictationStatus:(id)a3 privacyLinkText:(id)a4 lowStorage:(BOOL)a5;
- (id)offlineExplanationSuffixTextWithOfflineDictationStatus:(id)a3 privacyLinkText:(id)a4;
@end

@implementation DictationFooterView

- (DictationFooterView)initWithSpecifier:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)DictationFooterView;
  v4 = -[PSFooterMultiHyperlinkView initWithSpecifier:](&v23, sel_initWithSpecifier_);
  if (v4)
  {
    v5 = (void *)[a3 target];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_ABOUT_LINK", &stru_2703C6C20, @"Keyboard");
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_MANAGE_STORAGE_LINK", &stru_2703C6C20, @"Keyboard");
    id v8 = +[DictationFooterView dictationAutoPunctuationText];
    uint64_t v9 = v6;
    if ([v8 length]) {
      uint64_t v9 = [NSString stringWithFormat:@"%@ %@", v8, v6];
    }
    [(PSFooterMultiHyperlinkView *)v4 setText:v9];
    uint64_t v10 = [v5 lowStorageOnDeviceAssetStringWithLinkString:v7];
    uint64_t v11 = AFDeviceHighestLanguageModelCapabilityIdentifier();
    uint64_t v12 = [v5 offlineStatusForLanguage];
    if (v11 == 10) {
      uint64_t v13 = [(DictationFooterView *)v4 explanationSuffixTextWithOfflineDictationStatus:v12 privacyLinkText:v9 lowStorage:v10 != 0];
    }
    else {
      uint64_t v13 = [(DictationFooterView *)v4 offlineExplanationSuffixTextWithOfflineDictationStatus:v12 privacyLinkText:v9];
    }
    uint64_t v14 = v13;
    if (v13) {
      [(PSFooterMultiHyperlinkView *)v4 setText:v13];
    }
    v15 = [(PSFooterMultiHyperlinkView *)v4 text];
    if (v10)
    {
      [(PSFooterMultiHyperlinkView *)v4 setText:[(NSString *)v15 stringByAppendingFormat:@"\n\n%@", v10]];
      uint64_t v16 = [(PSFooterMultiHyperlinkView *)v4 text];
      [a3 setProperty:v16 forKey:*MEMORY[0x263F600F8]];
      uint64_t v17 = [(NSString *)[(PSFooterMultiHyperlinkView *)v4 text] rangeOfString:v6];
      objc_msgSend(a3, "addFooterHyperlinkWithRange:target:action:", v17, v18, v5, sel_presentPrivacySheet_);
      v19 = &selRef_launchManageStorage_;
    }
    else
    {
      [a3 setProperty:v15 forKey:*MEMORY[0x263F600F8]];
      v19 = &selRef_presentPrivacySheet_;
      uint64_t v7 = v6;
    }
    uint64_t v20 = [(NSString *)[(PSFooterMultiHyperlinkView *)v4 text] rangeOfString:v7];
    objc_msgSend(a3, "addFooterHyperlinkWithRange:target:action:", v20, v21, v5, *v19);
    [(PSFooterMultiHyperlinkView *)v4 refreshContentsWithSpecifier:a3];
  }
  return v4;
}

- (id)offlineExplanationSuffixTextWithOfflineDictationStatus:(id)a3 privacyLinkText:(id)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  objc_super v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v24 = [MEMORY[0x263EFF9C0] set];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__DictationFooterView_offlineExplanationSuffixTextWithOfflineDictationStatus_privacyLinkText___block_invoke;
  v14[3] = &unk_2653A9130;
  v14[4] = &v19;
  v14[5] = &v15;
  [a3 enumerateKeysAndObjectsUsingBlock:v14];
  if ([(id)v20[5] count])
  {
    uint64_t v6 = NSString;
    uint64_t v7 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if ((unint64_t)[(id)v20[5] count] < 2) {
      id v8 = @"DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGE";
    }
    else {
      id v8 = (__CFString *)[@"DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGE" stringByAppendingString:@"S"];
    }
    uint64_t v11 = [v7 localizedStringForKey:v8 value:&stru_2703C6C20 table:@"Keyboard"];
    uint64_t v10 = objc_msgSend(v6, "stringWithFormat:", v11, +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend((id)v20[5], "allObjects"), 1, 0));
  }
  else
  {
    if (!*((unsigned char *)v16 + 24))
    {
LABEL_10:
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:SFLocalizableWAPIStringKeyForKey() value:&stru_2703C6C20 table:@"Keyboard"];
  }
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v12 = (void *)[NSString stringWithFormat:@"%@ %@", v10, a4];
LABEL_11:
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v12;
}

uint64_t __94__DictationFooterView_offlineExplanationSuffixTextWithOfflineDictationStatus_privacyLinkText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = AFOfflineDictationStatusStringIsInstalled();
  if (result)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledDictationLanguages");
    uint64_t v6 = [a2 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    uint64_t result = [v5 containsObject:v6];
    if (result) {
      uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)explanationSuffixTextWithOfflineDictationStatus:(id)a3 privacyLinkText:(id)a4 lowStorage:(BOOL)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers");
  if ([v8 count] == 1
    && (uint64_t v9 = (void *)[MEMORY[0x263F7E570] sharedInputModeController],
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v10 = objc_msgSend(v9, "defaultDictationLanguagesForKeyboardLanguage:", objc_msgSend(v8, "firstObject"));
    if (!v10)
    {
      v33[0] = [v8 firstObject];
      uint64_t v10 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    }
  }
  else
  {
    uint64_t v10 = v8;
  }
  if ([v10 count] == 1
    && DictationIsEnabled()
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledDictationLanguages"), "containsObject:", objc_msgSend(v10, "firstObject")))
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "firstObject"), "stringByReplacingOccurrencesOfString:withString:", @"_", @"-");
    uint64_t v12 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v11;
    }
    [a3 objectForKeyedSubscript:v13];
    if (AFOfflineDictationStatusStringIsHighQualityModelSupported())
    {
      int IsInstalled = AFOfflineDictationStatusStringIsInstalled();
      int IsInstalling = AFOfflineDictationStatusStringIsInstalling();
      int v16 = AFOfflineDictationStatusStringIsOnDeviceSearchSupported();
      uint64_t v17 = NSString;
      char v18 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (IsInstalled)
      {
        uint64_t v19 = [v18 localizedStringForKey:@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING" value:&stru_2703C6C20 table:@"Keyboard"];
        uint64_t v20 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v16) {
          uint64_t v21 = @"DICTATION_ON_DEVICE_SERVER_SOMETIMES_NO_SEARCH";
        }
        else {
          uint64_t v21 = @"DICTATION_ON_DEVICE_SERVER_SOMETIMES";
        }
        id v31 = (id)[v20 localizedStringForKey:v21 value:&stru_2703C6C20 table:@"Keyboard"];
        id v32 = a4;
        uint64_t v30 = v19;
        v22 = @"%@ %@ %@";
        goto LABEL_28;
      }
      uint64_t v25 = [v18 localizedStringForKey:@"DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY" value:&stru_2703C6C20 table:@"Keyboard"];
      uint64_t v26 = v25;
      if (IsInstalling)
      {
        if (!a5)
        {
          v27 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v28 = @"DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING";
LABEL_27:
          id v31 = a4;
          id v32 = (id)[v27 localizedStringForKey:v28 value:&stru_2703C6C20 table:@"Keyboard"];
          uint64_t v30 = v26;
          v22 = @"%@ %@\n\n%@";
          goto LABEL_28;
        }
      }
      else if (!a5)
      {
        uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v28 = (__CFString *)SFLocalizableWAPIStringKeyForKey();
        v27 = (void *)v29;
        goto LABEL_27;
      }
      uint64_t v30 = v25;
      id v31 = a4;
      v22 = @"%@ %@";
LABEL_28:
      objc_super v23 = objc_msgSend(v17, "stringWithFormat:", v22, v30, v31, v32);
      return v23;
    }
    objc_super v23 = (void *)[NSString stringWithFormat:@"%@ %@", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER", &stru_2703C6C20, @"Keyboard", a4, v32];
  }
  else
  {
    objc_super v23 = 0;
  }
  return v23;
}

+ (id)dictationAutoPunctuationText
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F285A0] sharedPreferences];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  v3 = (void *)[MEMORY[0x263F08760] set];
  v4 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "languageCode"), "stringByReplacingOccurrencesOfString:withString:", @"-", @"_");
  uint64_t v6 = (void *)[MEMORY[0x263EFF8C0] array];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledDictationLanguages");
  if ((DictationIsEnabled() & (v7 != 0)) != 0) {
    uint64_t v6 = (void *)v7;
  }
  if (v5
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "assistantIsEnabled")
    && ([v6 containsObject:v5] & 1) == 0)
  {
    uint64_t v6 = (void *)[v6 arrayByAddingObject:v5];
  }
  v28 = (void *)v2;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    char v27 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v3 addObject:TIInputModeGetBaseLanguage()];
        uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        uint64_t v14 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
        if (v14) {
          uint64_t v13 = v14;
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationAutoPunctuationSupportedLocales"), "containsObject:", v13))objc_msgSend(v28, "addObject:", v12); {
        else
        }
          char v27 = 0;
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }
  else
  {
    char v27 = 1;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v16 = [v3 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v3);
        }
        uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        if ((unint64_t)[v3 countForObject:v20] >= 2) {
          [v4 addObject:v20];
        }
      }
      uint64_t v17 = [v3 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v17);
  }
  uint64_t v21 = [v28 count];
  char v22 = (v21 == 0) | v27;
  if (v21) {
    objc_super v23 = &stru_2703C6C20;
  }
  else {
    objc_super v23 = 0;
  }
  if ((v22 & 1) == 0)
  {
    uint64_t v24 = NSString;
    uint64_t v25 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if ((unint64_t)[v28 count] < 2) {
      uint64_t v26 = @"DICTATION_AUTO_PUNCTUATION_EXPLANATION_SUFFIX_WITH_LANGUAGE";
    }
    else {
      uint64_t v26 = (__CFString *)[@"DICTATION_AUTO_PUNCTUATION_EXPLANATION_SUFFIX_WITH_LANGUAGE" stringByAppendingString:@"S"];
    }
    objc_super v23 = (__CFString *)objc_msgSend(v24, "stringWithFormat:", objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_2703C6C20, @"Keyboard"), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v28, 1, v4));
  }
  return v23;
}

@end
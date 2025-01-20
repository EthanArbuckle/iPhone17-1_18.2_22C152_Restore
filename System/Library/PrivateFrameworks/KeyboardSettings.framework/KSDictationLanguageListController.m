@interface KSDictationLanguageListController
+ (id)isSmartLanguageSelectionEnabled;
+ (int64_t)numberOfEnabledEntries:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (KSDictationLanguageListController)init;
- (KSDictationOfflineStatusObserver)dictaionOfflineStatusObserver;
- (NSDictionary)offlineStatusForLanguage;
- (NSMutableDictionary)assetIdToLanguages;
- (NSMutableSet)onDeviceLocalesDownloading;
- (NSMutableSet)trackingDownloadStatusForAssetsIDs;
- (id)dictationFooterText;
- (id)dictationLanguagesSpecifiers;
- (id)isSLSEnabled:(id)a3;
- (id)onDeviceDictationLanguagesSpecifiers;
- (id)onDeviceNotCapableDictationLanguagesSpecifiers;
- (id)slsDictationLanguagesSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 classicDictationCellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 enhancedDictationCellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)emitNavigationEventForDictationLanguageListController;
- (void)handleSmartLanguageSelectionOnDictationLanguageToggle:(BOOL)a3 enabledDictationLanguages:(id)a4 specifier:(id)a5;
- (void)offlineDictationStatusUpdated:(id)a3;
- (void)presentPrivacySheet:(id)a3;
- (void)setAssetIdToLanguages:(id)a3;
- (void)setDictaionOfflineStatusObserver:(id)a3;
- (void)setOfflineStatusForLanguage:(id)a3;
- (void)setOnDeviceLocalesDownloading:(id)a3;
- (void)setSLSEnabled:(id)a3 specifier:(id)a4;
- (void)setTrackingDownloadStatusForAssetsIDs:(id)a3;
- (void)toggleDictationLanguage:(id)a3;
- (void)toggleSLSEnabled:(id)a3;
- (void)updateDownloadingProgressForAsset:(id)a3 stalled:(BOOL)a4;
- (void)updateDownloadingStateForAsset:(id)a3 success:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation KSDictationLanguageListController

- (void)offlineDictationStatusUpdated:(id)a3
{
  [(KSDictationLanguageListController *)self setOfflineStatusForLanguage:a3];
  [(KSDictationLanguageListController *)self reloadSpecifiers];
}

- (KSDictationLanguageListController)init
{
  v4.receiver = self;
  v4.super_class = (Class)KSDictationLanguageListController;
  v2 = [(KSDictationLanguageListController *)&v4 init];
  if (v2 && AFOfflineDictationCapable())
  {
    [(KSDictationLanguageListController *)v2 setDictaionOfflineStatusObserver:[[KSDictationOfflineStatusObserver alloc] initWithDelegate:v2]];
    -[KSDictationLanguageListController setAssetIdToLanguages:](v2, "setAssetIdToLanguages:", [MEMORY[0x263EFF9A0] dictionary]);
    -[KSDictationLanguageListController setTrackingDownloadStatusForAssetsIDs:](v2, "setTrackingDownloadStatusForAssetsIDs:", [MEMORY[0x263EFF9C0] set]);
    -[KSDictationLanguageListController setOnDeviceLocalesDownloading:](v2, "setOnDeviceLocalesDownloading:", [MEMORY[0x263EFF9C0] set]);
  }
  return v2;
}

- (void)dealloc
{
  [(KSDictationLanguageListController *)self setOfflineStatusForLanguage:0];
  [(KSDictationLanguageListController *)self setDictaionOfflineStatusObserver:0];
  [(KSDictationLanguageListController *)self setAssetIdToLanguages:0];
  [(KSDictationLanguageListController *)self setTrackingDownloadStatusForAssetsIDs:0];
  [(KSDictationLanguageListController *)self setOnDeviceLocalesDownloading:0];
  v3.receiver = self;
  v3.super_class = (Class)KSDictationLanguageListController;
  [(KSDictationLanguageListController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSDictationLanguageListController;
  [(KSDictationLanguageListController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSDictationLanguageListController;
  [(KSDictationLanguageListController *)&v4 viewDidAppear:a3];
  [(KSDictationLanguageListController *)self emitNavigationEventForDictationLanguageListController];
}

- (void)emitNavigationEventForDictationLanguageListController
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Keyboard/DictationSettings"];
  id v4 = +[KSKeyboardController localizedStringForGeneralKeyboardSpecifier];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
  v7[0] = v4;
  -[KSDictationLanguageListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", @"KEYBOARDS_SHORT", @"Keyboard", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 2), v3);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

+ (int64_t)numberOfEnabledEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  uint64_t v8 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v4);
      }
      v7 += objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i)), "BOOLValue");
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v6);
  return v7;
}

+ (id)isSmartLanguageSelectionEnabled
{
  v2 = NSNumber;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "isSmartLanguageSelectionEnabled");
  return (id)[v2 numberWithBool:v3];
}

- (id)dictationFooterText
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledDictationLanguages");
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA68];
  }
  uint64_t v6 = (void *)[v3 setWithArray:v5];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3052000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  uint64_t v39 = 0;
  uint64_t v39 = [MEMORY[0x263EFF9C0] set];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  uint64_t v33 = 0;
  uint64_t v33 = [MEMORY[0x263EFF9C0] set];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  uint64_t v27 = 0;
  uint64_t v27 = [MEMORY[0x263EFF9C0] set];
  int64_t v7 = [(KSDictationLanguageListController *)self offlineStatusForLanguage];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__KSDictationLanguageListController_dictationFooterText__block_invoke;
  v21[3] = &unk_2653A9490;
  v21[4] = v6;
  v21[5] = &v28;
  v21[6] = &v34;
  v21[7] = &v22;
  [(NSDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v21];
  if ([(id)v29[5] count])
  {
    uint64_t v8 = NSString;
    uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_HIGH_QUALITY_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGES", &stru_2703C6C20, @"Keyboard");
    v10 = (__CFString *)objc_msgSend(v8, "stringWithFormat:", v9, +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend((id)v29[5], "allObjects"), 1, 0));
  }
  else
  {
    v10 = &stru_2703C6C20;
  }
  if ([(id)v35[5] count])
  {
    long long v11 = NSString;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGES", &stru_2703C6C20, @"Keyboard");
    uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", v12, +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend((id)v35[5], "allObjects"), 1, 0));
    uint64_t v14 = [(__CFString *)v10 length];
    v15 = @"\n\n";
    if (!v14) {
      v15 = &stru_2703C6C20;
    }
    v10 = (__CFString *)[(__CFString *)v10 stringByAppendingFormat:@"%@%@", v15, v13];
  }
  if ([(id)v29[5] count]) {
    [v6 minusSet:v29[5]];
  }
  if ([(id)v35[5] count]) {
    [v6 minusSet:v35[5]];
  }
  if ([v6 count]
    && (![v6 isEqual:v23[5]] || -[__CFString length](v10, "length")))
  {
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ONLINE_EXPLANATION_SUFFIX_NOT_INSTALLED_WITH_LANGUAGES", &stru_2703C6C20, @"Dictation"), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend(v6, "allObjects"), 1, 0));
    uint64_t v17 = [(__CFString *)v10 length];
    v18 = @"\n\n";
    if (!v17) {
      v18 = &stru_2703C6C20;
    }
    v10 = (__CFString *)[(__CFString *)v10 stringByAppendingFormat:@"%@%@", v18, v16];
  }
  if (!-[__CFString length](v10, "length") && [(id)v23[5] count])
  {
    v19 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = (__CFString *)[v19 localizedStringForKey:SFLocalizableWAPIStringKeyForKey() value:&stru_2703C6C20 table:@"Keyboard"];
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  return v10;
}

uint64_t __56__KSDictationLanguageListController_dictationFooterText__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  uint64_t result = [*(id *)(a1 + 32) containsObject:v3];
  if (result)
  {
    if (AFOfflineDictationStatusStringIsHighQualityModelInstalled())
    {
      uint64_t v5 = *(void *)(a1 + 40);
    }
    else if (AFOfflineDictationStatusStringIsInstalled())
    {
      uint64_t v5 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 56);
    }
    uint64_t v6 = *(void **)(*(void *)(v5 + 8) + 40);
    return [v6 addObject:v3];
  }
  return result;
}

- (void)setSLSEnabled:(id)a3 specifier:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3, a4), "setSmartLanguageSelection:", objc_msgSend(a3, "BOOLValue"));
  [(KSDictationLanguageListController *)self reloadSpecifiers];
}

- (id)isSLSEnabled:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return (id)[v3 isSmartLanguageSelectionEnabled];
}

- (id)dictationLanguagesSpecifiers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v18)
  {
    uint64_t v16 = (int)*MEMORY[0x263F5FDB8];
    -[KSDictationLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Dictation Languages", &stru_2703C6C20, @"Dictation"));
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v3 = (void *)[MEMORY[0x263F7EC68] sharedPreferencesController];
    uint64_t v4 = objc_msgSend(v3, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
    id v5 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", @"DictationLanguagesEnabled"), "mutableCopy");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v4;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v11, "displayName"), self, 0, 0, 0, 3, 0);
          [v12 setButtonAction:sel_toggleDictationLanguage_];
          objc_msgSend(v12, "setProperty:forKey:", objc_msgSend(v11, "identifier"), v9);
          [v12 setProperty:v5 forKey:@"enabledDictationLanguages"];
          [v18 addObject:v12];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    uint64_t v13 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"DICTATION_LANGUAGES" name:0];
    id v14 = [(KSDictationLanguageListController *)self dictationFooterText];
    [v13 setProperty:v14 forKey:*MEMORY[0x263F600F8]];
    [v18 insertObject:v13 atIndex:0];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v16) = (Class)v18;
  }
  return v18;
}

- (id)slsDictationLanguagesSpecifiers
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v33)
  {
    uint64_t v28 = (int)*MEMORY[0x263F5FDB8];
    -[KSDictationLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Dictation Languages", &stru_2703C6C20, @"Dictation"));
    id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
    v31 = (void *)[MEMORY[0x263EFF980] array];
    uint64_t v3 = (void *)[MEMORY[0x263F7EC68] sharedPreferencesController];
    uint64_t v4 = objc_msgSend(v3, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
    id v5 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", @"DictationLanguagesEnabled"), "mutableCopy");
    id v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationSLSLanguagesEnabled"), "mutableCopy");
    v32 = self;
    uint64_t v27 = [(id)objc_opt_class() numberOfEnabledEntries:v5];
    if (![v6 count]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "updateEnabledDictationLanguages:", 1);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v30 = *(void *)v35;
      uint64_t v9 = *MEMORY[0x263F60138];
      uint64_t v10 = *MEMORY[0x263F602D0];
      id obj = v4;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v12, "displayName"), v32, 0, 0, 0, 3, 0);
          [v13 setButtonAction:sel_toggleDictationLanguage_];
          objc_msgSend(v13, "setProperty:forKey:", objc_msgSend(v12, "identifier"), v9);
          [v13 setProperty:v5 forKey:@"enabledDictationLanguages"];
          [v33 addObject:v13];
          id v14 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v12, "displayName"), v32, 0, 0, 0, 3, 0);
          [v14 setButtonAction:sel_toggleSLSEnabled_];
          objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v12, "identifier"), v10);
          [v31 addObject:v14];
        }
        uint64_t v4 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v8);
    }
    if ((unint64_t)[v4 count] >= 2)
    {
      if (v27 >= 2)
      {
        v15 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"SLS_TOGGLE" name:0];
        [v33 addObject:v15];
        uint64_t v16 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Automatic-Language-Detection", &stru_2703C6C20, @"Dictation"), v32, sel_setSLSEnabled_specifier_, sel_isSLSEnabled_, 0, 6, 0);
        [v16 setProperty:@"SLS Toggle Switch" forKey:*MEMORY[0x263F60138]];
        uint64_t v17 = NSString;
        int v18 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "isSmartLanguageSelectionEnabled"), "BOOLValue");
        long long v19 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v18) {
          long long v20 = @"SLS_TOGGLE_ON_EXPLANATION";
        }
        else {
          long long v20 = @"SLS_TOGGLE_OFF_EXPLANATION";
        }
        uint64_t v21 = [v19 localizedStringForKey:v20 value:&stru_2703C6C20 table:@"Dictation"];
        [v15 setProperty:objc_msgSend(v17, "stringWithFormat:", @"%@\n\n%@", v21, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SLS_EXPLANATION_SUFFIX", &stru_2703C6C20, @"Dictation", *MEMORY[0x263F600F8] forKey];
        [v33 addObject:v16];
      }
      if ((unint64_t)[v4 count] < 5) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Dictation", &stru_2703C6C20, @"Dictation");
      }
      v23 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"DICTATION_LANGUAGES" name:v22];
      uint64_t v24 = [(KSDictationLanguageListController *)v32 dictationFooterText];
      [v23 setProperty:v24 forKey:*MEMORY[0x263F600F8]];
      [v33 insertObject:v23 atIndex:0];
    }
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "isSmartLanguageSelectionEnabled"), "BOOLValue")&& (unint64_t)objc_msgSend(v4, "count") >= 5&& v27 >= 2)
    {
      v25 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", @"SLS_LANGUAGES", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Auto-Detection", &stru_2703C6C20, @"Dictation"));
      objc_msgSend(v25, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SLS_FOOTER_TEXT", &stru_2703C6C20, @"Dictation"), *MEMORY[0x263F600F8]);
      [v33 addObject:v25];
      [v33 addObjectsFromArray:v31];
    }
    *(Class *)((char *)&v32->super.super.super.super.super.isa + v28) = (Class)v33;
  }
  return v33;
}

- (void)updateDownloadingProgressForAsset:(id)a3 stalled:(BOOL)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__KSDictationLanguageListController_updateDownloadingProgressForAsset_stalled___block_invoke;
  block[3] = &unk_2653A94B8;
  block[4] = self;
  block[5] = a3;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __79__KSDictationLanguageListController_updateDownloadingProgressForAsset_stalled___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading"), "copy");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetIdToLanguages", 0), "objectForKeyedSubscript:", *(void *)(a1 + 40));
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        int v9 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v10 = (void *)[*(id *)(a1 + 32) onDeviceLocalesDownloading];
        if (v9) {
          [v10 removeObject:v8];
        }
        else {
          [v10 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  uint64_t result = objc_msgSend(v2, "isEqualToSet:", objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading"));
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) reloadSpecifiers];
  }
  return result;
}

- (void)updateDownloadingStateForAsset:(id)a3 success:(BOOL)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__KSDictationLanguageListController_updateDownloadingStateForAsset_success___block_invoke;
  block[3] = &unk_2653A94B8;
  block[4] = self;
  block[5] = a3;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __76__KSDictationLanguageListController_updateDownloadingStateForAsset_success___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trackingDownloadStatusForAssetsIDs"), "removeObject:", *(void *)(a1 + 40));
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetIdToLanguages"), "objectForKeyedSubscript:", *(void *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading"), "removeObject:", *(void *)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetIdToLanguages"), "removeObjectForKey:", *(void *)(a1 + 40));
  if (!*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 32) reloadSpecifiers];
  }
  return result;
}

- (id)onDeviceDictationLanguagesSpecifiers
{
  id v2 = self;
  uint64_t v130 = *MEMORY[0x263EF8340];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (result) {
    return result;
  }
  uint64_t v93 = (int)*MEMORY[0x263F5FDB8];
  -[KSDictationLanguageListController setTitle:](v2, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Dictation Languages", &stru_2703C6C20, @"Dictation"));
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v103 = (void *)[MEMORY[0x263F08760] set];
  uint64_t v94 = [MEMORY[0x263EFF980] array];
  v98 = (void *)[MEMORY[0x263EFF980] array];
  v96 = (void *)[MEMORY[0x263EFF9C0] set];
  v97 = (void *)[MEMORY[0x263EFF980] array];
  v100 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = (void *)[MEMORY[0x263F7EC68] sharedPreferencesController];
  uint64_t v6 = objc_msgSend(v5, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
  id v7 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", @"DictationLanguagesEnabled"), "mutableCopy");
  v92 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"DICTATION_LANGUAGES" name:0];
  objc_msgSend(v4, "addObject:");
  v101 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v122 objects:v129 count:16];
  v107 = v2;
  v95 = v4;
  if (!v8)
  {
    uint64_t v102 = 0;
    LOBYTE(v99) = 1;
    goto LABEL_33;
  }
  uint64_t v9 = v8;
  uint64_t v102 = 0;
  uint64_t v10 = *(void *)v123;
  uint64_t v11 = *MEMORY[0x263F60138];
  int v99 = 1;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v123 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v122 + 1) + 8 * v12);
      long long v14 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v13, "displayName"), v2, 0, 0, 0, 3, 0);
      [v14 setButtonAction:sel_toggleDictationLanguage_];
      objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v13, "identifier"), v11);
      [v14 setProperty:v7 forKey:@"enabledDictationLanguages"];
      [v4 addObject:v14];
      if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(v13, "identifier")), "BOOLValue"))
      {
        [v13 identifier];
        TIInputModeGetBaseLanguage();
        [v103 addObject:TIInputModeGetBaseLanguage()];
        if (!-[NSDictionary objectForKeyedSubscript:](-[KSDictationLanguageListController offlineStatusForLanguage](v2, "offlineStatusForLanguage"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "identifier"), "stringByReplacingOccurrencesOfString:withString:", @"_", @"-")))
        {
          uint64_t v15 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
          if (v15) {
            [(NSDictionary *)[(KSDictationLanguageListController *)v107 offlineStatusForLanguage] objectForKeyedSubscript:v15];
          }
        }
        if (!AFOfflineDictationStatusStringIsHighQualityModelSupported())
        {
          uint64_t v16 = [v13 identifier];
          uint64_t v17 = v100;
          goto LABEL_24;
        }
        ++v102;
        if (AFOfflineDictationStatusStringIsInstalled())
        {
          objc_msgSend(v98, "addObject:", objc_msgSend(v13, "identifier"));
          v99 &= AFOfflineDictationStatusStringIsOnDeviceSearchSupported();
          goto LABEL_25;
        }
        if (!AFOfflineDictationStatusStringIsInstalling())
        {
          uint64_t v16 = [v13 identifier];
          uint64_t v17 = v97;
LABEL_24:
          [v17 addObject:v16];
LABEL_25:
          id v2 = v107;
          goto LABEL_26;
        }
        int v18 = -[NSMutableSet containsObject:](-[KSDictationLanguageListController onDeviceLocalesDownloading](v107, "onDeviceLocalesDownloading"), "containsObject:", [v13 identifier]);
        uint64_t v19 = [v13 identifier];
        if (v18) {
          long long v20 = v96;
        }
        else {
          long long v20 = v97;
        }
        [v20 addObject:v19];
        uint64_t v21 = AFOfflineDictationStatusStringAssetId();
        if (v21)
        {
          uint64_t v22 = v21;
          [v101 addObject:v21];
          v23 = (void *)[(NSMutableDictionary *)[(KSDictationLanguageListController *)v107 assetIdToLanguages] objectForKeyedSubscript:v22];
          if (!v23)
          {
            v23 = (void *)[MEMORY[0x263EFF9C0] set];
            [(NSMutableDictionary *)[(KSDictationLanguageListController *)v107 assetIdToLanguages] setObject:v23 forKeyedSubscript:v22];
          }
          objc_msgSend(v23, "addObject:", objc_msgSend(v13, "identifier"));
          id v2 = v107;
        }
        else
        {
          id v2 = v107;
        }
        id v4 = v95;
      }
LABEL_26:
      ++v12;
    }
    while (v9 != v12);
    uint64_t v24 = [obj countByEnumeratingWithState:&v122 objects:v129 count:16];
    uint64_t v9 = v24;
  }
  while (v24);
LABEL_33:
  v25 = v101;
  v26 = (void *)v94;
  uint64_t v27 = v103;
  if ([v101 count])
  {
    objc_msgSend(v101, "minusSet:", -[KSDictationLanguageListController trackingDownloadStatusForAssetsIDs](v2, "trackingDownloadStatusForAssetsIDs"));
    if ([v101 count])
    {
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      id obja = (id)[v101 allObjects];
      uint64_t v28 = [obja countByEnumeratingWithState:&v118 objects:v128 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v119;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v119 != v30) {
              objc_enumerationMutation(obja);
            }
            uint64_t v32 = *(void *)(*((void *)&v118 + 1) + 8 * i);
            [(NSMutableSet *)[(KSDictationLanguageListController *)v107 trackingDownloadStatusForAssetsIDs] addObject:v32];
            [v25 removeObject:v32];
            uint64_t v33 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](-[KSDictationLanguageListController assetIdToLanguages](v107, "assetIdToLanguages"), "objectForKeyedSubscript:", v32), "allObjects"), "firstObject");
            if (v33)
            {
              uint64_t v34 = v33;
              long long v35 = +[KSWeakRefHolder weakRefHolderWithObject:v107];
              SFSpeechAssetManagerClass = (void *)getSFSpeechAssetManagerClass();
              uint64_t v37 = [(id)getSFSpeechAssetManagerClass() systemClientId];
              v116[5] = v32;
              v117[0] = MEMORY[0x263EF8330];
              v117[1] = 3221225472;
              v117[2] = __73__KSDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke;
              v117[3] = &unk_2653A94E0;
              v117[4] = v35;
              v117[5] = v32;
              v116[0] = MEMORY[0x263EF8330];
              v116[1] = 3221225472;
              v116[2] = __73__KSDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke_2;
              v116[3] = &unk_2653A9508;
              v116[4] = v35;
              v25 = v101;
              [SFSpeechAssetManagerClass fetchAssetsForLanguage:v34 clientIdentifier:v37 urgent:0 forceUpgrade:0 detailedProgress:v117 completion:v116];
            }
          }
          uint64_t v29 = [obja countByEnumeratingWithState:&v118 objects:v128 count:16];
        }
        while (v29);
      }
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      uint64_t v38 = [v25 countByEnumeratingWithState:&v112 objects:v127 count:16];
      id v2 = v107;
      v26 = (void *)v94;
      uint64_t v27 = v103;
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v113 != v40) {
              objc_enumerationMutation(v25);
            }
            [(NSMutableDictionary *)[(KSDictationLanguageListController *)v107 assetIdToLanguages] removeObjectForKey:*(void *)(*((void *)&v112 + 1) + 8 * j)];
          }
          uint64_t v39 = [v25 countByEnumeratingWithState:&v112 objects:v127 count:16];
        }
        while (v39);
      }
    }
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  uint64_t v42 = [v27 countByEnumeratingWithState:&v108 objects:v126 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v109;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v109 != v44) {
          objc_enumerationMutation(v27);
        }
        uint64_t v46 = *(void *)(*((void *)&v108 + 1) + 8 * k);
        if ((unint64_t)[v27 countForObject:v46] >= 2) {
          [v26 addObject:v46];
        }
      }
      uint64_t v43 = [v27 countByEnumeratingWithState:&v108 objects:v126 count:16];
    }
    while (v43);
  }
  uint64_t v47 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_ABOUT_LINK", &stru_2703C6C20, @"Keyboard");
  if (!v102)
  {
    uint64_t v51 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER", &stru_2703C6C20, @"Keyboard");
    goto LABEL_68;
  }
  if (![v100 count])
  {
    if (v102 != 1)
    {
      if (![v98 count] && !objc_msgSend(v96, "count")) {
        goto LABEL_82;
      }
      if ([v96 count])
      {
        if (![v98 count]) {
          goto LABEL_91;
        }
        v65 = NSString;
        v66 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v67 = (void *)[v65 stringWithFormat:objc_msgSend(v66, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE", objc_msgSend(v98, "count"), 0), &stru_2703C6C20, @"Keyboard", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v98, 1, v26)];
        uint64_t v50 = [v67 stringByAppendingFormat:@" %@", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER_SOMETIMES", &stru_2703C6C20, @"Keyboard"];
LABEL_92:
        v52 = (void *)v50;
        v79 = NSString;
        v83 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v81 = [v83 localizedStringForKey:LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING_WITH_LANGUAGE", objc_msgSend(v96, "count"), 0), &stru_2703C6C20, @"Keyboard" value table];
        uint64_t v82 = [v96 allObjects];
      }
      else
      {
        uint64_t v75 = [v97 count];
        v76 = NSString;
        v77 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (!v75)
        {
          uint64_t v89 = [v77 localizedStringForKey:@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING" value:&stru_2703C6C20 table:@"Keyboard"];
          v90 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          if (v99) {
            v91 = @"DICTATION_ON_DEVICE_SERVER_SOMETIMES_NO_SEARCH";
          }
          else {
            v91 = @"DICTATION_ON_DEVICE_SERVER_SOMETIMES";
          }
          uint64_t v51 = [v76 stringWithFormat:@"%@ %@", v89, objc_msgSend(v90, "localizedStringForKey:value:table:", v91, &stru_2703C6C20, @"Keyboard"];
          goto LABEL_68;
        }
        v78 = (void *)[v76 stringWithFormat:objc_msgSend(v77, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE", objc_msgSend(v98, "count"), 0), &stru_2703C6C20, @"Keyboard", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v98, 1, v26)];
        v52 = (void *)[v78 stringByAppendingFormat:@" %@", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER_SOMETIMES", &stru_2703C6C20, @"Keyboard"];
        v79 = NSString;
        v80 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_SUPPORT_DOWNLOAD_WITH_LANGUAGE", [v97 count], @"_WIFI");
        uint64_t v81 = [v80 localizedStringForKey:SFLocalizableWAPIStringKeyForKey() value:&stru_2703C6C20 table:@"Keyboard"];
        uint64_t v82 = (uint64_t)v97;
      }
      uint64_t v56 = objc_msgSend(v79, "stringWithFormat:", v81, +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v82, 1, v26));
      goto LABEL_94;
    }
    if ([v96 count])
    {
      v52 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY", &stru_2703C6C20, @"Keyboard");
      v54 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v55 = @"DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING";
LABEL_73:
      uint64_t v56 = [v54 localizedStringForKey:v55 value:&stru_2703C6C20 table:@"Keyboard"];
      goto LABEL_94;
    }
    uint64_t v70 = [v98 count];
    v71 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (!v70)
    {
      v52 = (void *)[v71 localizedStringForKey:@"DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY" value:&stru_2703C6C20 table:@"Keyboard"];
      uint64_t v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v55 = (__CFString *)SFLocalizableWAPIStringKeyForKey();
      v54 = (void *)v88;
      goto LABEL_73;
    }
    v72 = (void *)[v71 localizedStringForKey:@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING" value:&stru_2703C6C20 table:@"Keyboard"];
    v73 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v99) {
      v74 = @"DICTATION_ON_DEVICE_SERVER_SOMETIMES_NO_SEARCH";
    }
    else {
      v74 = @"DICTATION_ON_DEVICE_SERVER_SOMETIMES";
    }
    uint64_t v51 = [v72 stringByAppendingFormat:@" %@", objc_msgSend(v73, "localizedStringForKey:value:table:", v74, &stru_2703C6C20, @"Keyboard"];
LABEL_68:
    v52 = (void *)v51;
    goto LABEL_69;
  }
  if ([v98 count] || objc_msgSend(v96, "count"))
  {
    if ([v96 count])
    {
      if ([v98 count])
      {
        v48 = NSString;
        v49 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v50 = [v48 stringWithFormat:objc_msgSend(v49, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE", objc_msgSend(v98, "count"), 0), &stru_2703C6C20, @"Keyboard", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v98, 1, v26)];
        goto LABEL_92;
      }
LABEL_91:
      uint64_t v50 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY", &stru_2703C6C20, @"Keyboard");
      goto LABEL_92;
    }
    id objb = (id)[v97 count];
    v57 = NSString;
    v58 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v59 = (void *)[v57 stringWithFormat:objc_msgSend(v58, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE", objc_msgSend(v98, "count"), 0), &stru_2703C6C20, @"Keyboard", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v98, 1, v26)];
    v60 = NSString;
    v61 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v52 = objc_msgSend(v59, "stringByAppendingFormat:", @" %@", objc_msgSend(v60, "stringWithFormat:", objc_msgSend(v61, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_SERVER_SOMETIMES_WITH_LANGUAGE", objc_msgSend(v100, "count"), 0), &stru_2703C6C20, @"Keyboard"), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v100,
                        1,
                        v26)));
    if (objb)
    {
      v62 = NSString;
      v63 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_SUPPORT_DOWNLOAD_WITH_LANGUAGE", [v97 count], @"_WIFI");
      uint64_t v64 = objc_msgSend(v62, "stringWithFormat:", objc_msgSend(v63, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_2703C6C20, @"Keyboard"), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v97, 1, v26));
      goto LABEL_95;
    }
LABEL_69:
    uint64_t v53 = [v52 stringByAppendingFormat:@" %@", v47];
LABEL_97:
    v85 = (void *)v53;
    goto LABEL_98;
  }
LABEL_82:
  v52 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY", &stru_2703C6C20, @"Keyboard");
  v68 = NSString;
  v69 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  LocStringKeyBasedOnLanguageCount(@"DICTATION_ON_DEVICE_SUPPORT_DOWNLOAD_WITH_LANGUAGE", [v97 count], @"_WIFI");
  uint64_t v56 = objc_msgSend(v68, "stringWithFormat:", objc_msgSend(v69, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_2703C6C20, @"Keyboard"), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v97, 1, v26));
LABEL_94:
  uint64_t v64 = v56;
LABEL_95:
  v84 = (void *)[v52 stringByAppendingFormat:@" %@", v47];
  v85 = v84;
  if (v64)
  {
    uint64_t v53 = [v84 stringByAppendingFormat:@"\n\n%@", v64];
    goto LABEL_97;
  }
LABEL_98:
  v86 = (objc_class *)objc_opt_class();
  [v92 setProperty:NSStringFromClass(v86) forKey:*MEMORY[0x263F600C0]];
  [v92 setProperty:v85 forKey:*MEMORY[0x263F600E8]];
  v131.location = [v85 rangeOfString:v47];
  [v92 setProperty:NSStringFromRange(v131) forKey:*MEMORY[0x263F600D0]];
  uint64_t v87 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v2];
  [v92 setProperty:v87 forKey:*MEMORY[0x263F600E0]];
  [v92 setProperty:NSStringFromSelector(sel_presentPrivacySheet_) forKey:*MEMORY[0x263F600C8]];
  id result = v95;
  *(Class *)((char *)&v2->super.super.super.super.super.isa + v93) = (Class)v95;
  return result;
}

uint64_t __73__KSDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strongRef];
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 updateDownloadingProgressForAsset:v6 stalled:a3];
}

uint64_t __73__KSDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strongRef];
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 updateDownloadingStateForAsset:v6 success:a3 == 0];
}

- (void)presentPrivacySheet:(id)a3
{
  id v4 = (void *)[MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (id)onDeviceNotCapableDictationLanguagesSpecifiers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v28 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v28)
  {
    uint64_t v24 = (int)*MEMORY[0x263F5FDB8];
    -[KSDictationLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Dictation Languages", &stru_2703C6C20, @"Dictation"));
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = (void *)[MEMORY[0x263F7EC68] sharedPreferencesController];
    uint64_t v5 = objc_msgSend(v4, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
    id v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", @"DictationLanguagesEnabled"), "mutableCopy");
    v26 = (void *)[MEMORY[0x263F08760] set];
    [MEMORY[0x263EFF980] array];
    v25 = (void *)[MEMORY[0x263EFF980] array];
    uint64_t v28 = v3;
    v23 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"DICTATION_LANGUAGES" name:0];
    objc_msgSend(v3, "addObject:");
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v27 = 0;
      uint64_t v9 = *(void *)v30;
      uint64_t v10 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v12, "displayName"), self, 0, 0, 0, 3, 0);
          [v13 setButtonAction:sel_toggleDictationLanguage_];
          objc_msgSend(v13, "setProperty:forKey:", objc_msgSend(v12, "identifier"), v10);
          [v13 setProperty:v6 forKey:@"enabledDictationLanguages"];
          [v28 addObject:v13];
          if (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(v12, "identifier")), "BOOLValue"))
          {
            [v12 identifier];
            TIInputModeGetBaseLanguage();
            [v26 addObject:TIInputModeGetBaseLanguage()];
            if (-[NSDictionary objectForKeyedSubscript:](-[KSDictationLanguageListController offlineStatusForLanguage](self, "offlineStatusForLanguage"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v12, "identifier"), "stringByReplacingOccurrencesOfString:withString:", @"_", @"-")))
            {
              ++v27;
              if (AFOfflineDictationStatusStringIsInstalled()) {
                objc_msgSend(v25, "addObject:", objc_msgSend(v12, "identifier"));
              }
            }
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v27 = 0;
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_ABOUT_LINK", &stru_2703C6C20, @"Keyboard");
    uint64_t v15 = (void *)[NSString stringWithFormat:@"%@ %@", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_SERVER", &stru_2703C6C20, @"Keyboard", v14];
    if (!v27) {
      goto LABEL_19;
    }
    if ([v25 count])
    {
      uint64_t v16 = NSString;
      uint64_t v17 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v18 = [v16 stringWithFormat:objc_msgSend(v17, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(@"DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGE", objc_msgSend(v25, "count"), 0), &stru_2703C6C20, @"Keyboard", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v25, 1, 0)];
      if (!v18)
      {
LABEL_19:
        uint64_t v19 = (objc_class *)objc_opt_class();
        [v23 setProperty:NSStringFromClass(v19) forKey:*MEMORY[0x263F600C0]];
        [v23 setProperty:v15 forKey:*MEMORY[0x263F600E8]];
        v35.location = [v15 rangeOfString:v14];
        [v23 setProperty:NSStringFromRange(v35) forKey:*MEMORY[0x263F600D0]];
        uint64_t v20 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
        [v23 setProperty:v20 forKey:*MEMORY[0x263F600E0]];
        [v23 setProperty:NSStringFromSelector(sel_presentPrivacySheet_) forKey:*MEMORY[0x263F600C8]];
        *(Class *)((char *)&self->super.super.super.super.super.isa + v24) = (Class)v28;
        return v28;
      }
    }
    else
    {
      uint64_t v22 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v18 = [v22 localizedStringForKey:SFLocalizableWAPIStringKeyForKey() value:&stru_2703C6C20 table:@"Keyboard"];
      if (!v18) {
        goto LABEL_19;
      }
    }
    uint64_t v15 = (void *)[v15 stringByAppendingFormat:@"\n\n%@", v18];
    goto LABEL_19;
  }
  return v28;
}

- (id)specifiers
{
  if (_os_feature_enabled_impl())
  {
    return [(KSDictationLanguageListController *)self slsDictationLanguagesSpecifiers];
  }
  else if (AFDeviceHighestLanguageModelCapabilityIdentifier() == 10)
  {
    return [(KSDictationLanguageListController *)self onDeviceDictationLanguagesSpecifiers];
  }
  else
  {
    return [(KSDictationLanguageListController *)self onDeviceNotCapableDictationLanguagesSpecifiers];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    return [(KSDictationLanguageListController *)self tableView:a3 classicDictationCellForRowAtIndexPath:a4];
  }
  else
  {
    return [(KSDictationLanguageListController *)self tableView:a3 enhancedDictationCellForRowAtIndexPath:a4];
  }
}

- (id)tableView:(id)a3 enhancedDictationCellForRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)KSDictationLanguageListController;
  id v6 = -[KSDictationLanguageListController tableView:cellForRowAtIndexPath:](&v15, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = (void *)[(KSDictationLanguageListController *)self specifierAtIndex:[(KSDictationLanguageListController *)self indexForIndexPath:a4]];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
  int v9 = objc_msgSend((id)objc_opt_class(), "numberOfEnabledEntries:", objc_msgSend(v8, "valueForPreferenceKey:", *MEMORY[0x263F1D1B8]));
  [MEMORY[0x263F1C748] sharedInputModeController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];
    uint64_t v11 = objc_msgSend(v10, "isDictationLanguageEnabled:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x263F60138]));
    [v6 setChecked:v11];
  }
  else
  {
    LODWORD(v11) = 0;
  }
  if (v9 == 1) {
    uint64_t v12 = v11 ^ 1;
  }
  else {
    uint64_t v12 = 1;
  }
  [v6 setUserInteractionEnabled:v12];
  if (v12)
  {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "labelColor"));
    [v6 setSelectionStyle:3];
    uint64_t v13 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "secondaryLabelColor"));
    [v6 setSelectionStyle:0];
    uint64_t v13 = [MEMORY[0x263F1C550] systemGrayColor];
  }
  [v6 setTintColor:v13];
  return v6;
}

- (id)tableView:(id)a3 classicDictationCellForRowAtIndexPath:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)KSDictationLanguageListController;
  id v6 = -[KSDictationLanguageListController tableView:cellForRowAtIndexPath:](&v45, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = (void *)[(KSDictationLanguageListController *)self specifierAtIndex:[(KSDictationLanguageListController *)self indexForIndexPath:a4]];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
  int v9 = (void *)[v8 valueForPreferenceKey:*MEMORY[0x263F1D1B8]];
  if (![a4 section])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v12 = (void *)[v9 allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      int v15 = 0;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v12);
          }
          v15 += objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v41 + 1) + 8 * i)), "BOOLValue");
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v14);
    }
    else
    {
      int v15 = 0;
    }
    [MEMORY[0x263F1C748] sharedInputModeController];
    if (objc_opt_respondsToSelector())
    {
      v25 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];
      uint64_t v26 = objc_msgSend(v25, "isDictationLanguageEnabled:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x263F60138]));
      [v6 setChecked:v26];
    }
    else
    {
      LODWORD(v26) = 0;
    }
    if (v15 == 1) {
      uint64_t v27 = v26 ^ 1;
    }
    else {
      uint64_t v27 = 1;
    }
    [v6 setUserInteractionEnabled:v27];
    uint64_t v28 = (void *)MEMORY[0x263F1C550];
    if (v27) {
      goto LABEL_39;
    }
    goto LABEL_29;
  }
  if ([a4 section] == 1)
  {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "labelColor"));
    uint64_t v10 = v6;
    uint64_t v11 = 0;
LABEL_40:
    [v10 setSelectionStyle:v11];
    uint64_t v29 = 0;
    goto LABEL_41;
  }
  if ([a4 section] == 2)
  {
    [v6 setSelectionStyle:3];
    uint64_t v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationSLSLanguagesEnabled");
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v19 = objc_msgSend(v18, "allKeys", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int v22 = 0;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v19);
          }
          v22 += objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", *(void *)(*((void *)&v37 + 1) + 8 * j)), "BOOLValue");
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v21);
    }
    else
    {
      int v22 = 0;
    }
    uint64_t v30 = [v7 propertyForKey:*MEMORY[0x263F602D0]];
    if (v18)
    {
      uint64_t v31 = v30;
      objc_msgSend(v6, "setChecked:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v30), "BOOLValue"));
      int v32 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v31), "BOOLValue");
      int v33 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v31), "BOOLValue");
      if ((v22 & 0xFFFFFFFE) == 2) {
        BOOL v34 = v32;
      }
      else {
        BOOL v34 = 0;
      }
      if (v33) {
        BOOL v35 = v22 != 2;
      }
      else {
        BOOL v35 = v34;
      }
      uint64_t v28 = (void *)MEMORY[0x263F1C550];
      if (v35)
      {
LABEL_39:
        objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(v28, "labelColor"));
        uint64_t v10 = v6;
        uint64_t v11 = 3;
        goto LABEL_40;
      }
LABEL_29:
      objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(v28, "secondaryLabelColor"));
      [v6 setSelectionStyle:0];
      uint64_t v29 = [MEMORY[0x263F1C550] systemGrayColor];
LABEL_41:
      [v6 setTintColor:v29];
    }
  }
  return v6;
}

- (void)toggleSLSEnabled:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[a3 propertyForKey:*MEMORY[0x263F602B0]];
  int v6 = [v5 isChecked];
  uint64_t v7 = [a3 propertyForKey:*MEMORY[0x263F602D0]];
  id v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationSLSLanguagesEnabled"), "mutableCopy");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v9 = objc_msgSend(v8, "allKeys", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 += objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i)), "BOOLValue");
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  else
  {
    int v12 = 0;
  }
  BOOL v15 = (v12 - 4) < 0xFFFFFFFD;
  if (v6) {
    BOOL v15 = v12 == 2;
  }
  if (!v15)
  {
    uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", @"DictationLanguagesEnabled");
    if (v6)
    {
      [v5 setChecked:v6 ^ 1u];
      uint64_t v17 = [MEMORY[0x263F1C550] grayColor];
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v7), "BOOLValue")) {
        return;
      }
      [v5 setChecked:v6 ^ 1u];
      uint64_t v17 = [MEMORY[0x263F1C550] blackColor];
    }
    objc_msgSend((id)objc_msgSend(v5, "titleLabel"), "setTextColor:", v17);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v6 ^ 1u), v7);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "setDictationSLSLanguagesEnabled:", v8);
    [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) reloadData];
  }
}

- (void)handleSmartLanguageSelectionOnDictationLanguageToggle:(BOOL)a3 enabledDictationLanguages:(id)a4 specifier:(id)a5
{
  BOOL v7 = a3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationSLSLanguagesEnabled"), "mutableCopy");
  uint64_t v9 = [a5 propertyForKey:*MEMORY[0x263F60138]];
  uint64_t v10 = [(id)objc_opt_class() numberOfEnabledEntries:a4];
  if (v7)
  {
    if (!objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v9), "BOOLValue")) {
      return;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 0), v9);
    if (v10 == 2)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v11 = (void *)[v8 allKeys];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v43;
        uint64_t v15 = MEMORY[0x263EFFA80];
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(v11);
            }
            [v8 setObject:v15 forKeyedSubscript:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v13);
      }
    }
    else if (v10 >= 3 && [(id)objc_opt_class() numberOfEnabledEntries:v8] <= 1)
    {
      id v26 = (id)objc_msgSend((id)objc_msgSend(a4, "keysOfEntriesPassingTest:", &__block_literal_global_2), "mutableCopy");
      objc_msgSend(v26, "intersectSet:", objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_399));
      [v26 removeObject:v9];
      uint64_t v27 = (void *)[MEMORY[0x263F7EC68] sharedPreferencesController];
      uint64_t v28 = objc_msgSend(v27, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v39;
        while (2)
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v39 != v31) {
              objc_enumerationMutation(v28);
            }
            int v33 = *(void **)(*((void *)&v38 + 1) + 8 * j);
            if (objc_msgSend(v26, "containsObject:", objc_msgSend(v33, "identifier")))
            {
              uint64_t v25 = [v33 identifier];
              uint64_t v23 = MEMORY[0x263EFFA88];
              uint64_t v24 = v8;
              goto LABEL_23;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_24;
  }
  uint64_t v17 = [(id)objc_opt_class() numberOfEnabledEntries:v8];
  if (v10 == 1)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v18 = objc_msgSend(a4, "allKeys", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", *(void *)(*((void *)&v34 + 1) + 8 * k)), *(void *)(*((void *)&v34 + 1) + 8 * k));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v20);
    }
  }
  if (v17 <= 3 && v10 >= 1)
  {
    uint64_t v23 = [NSNumber numberWithBool:1];
    uint64_t v24 = v8;
    uint64_t v25 = v9;
LABEL_23:
    [v24 setObject:v23 forKeyedSubscript:v25];
LABEL_24:
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "setDictationSLSLanguagesEnabled:", v8);
  }
}

uint64_t __127__KSDictationLanguageListController_handleSmartLanguageSelectionOnDictationLanguageToggle_enabledDictationLanguages_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue];
}

uint64_t __127__KSDictationLanguageListController_handleSmartLanguageSelectionOnDictationLanguageToggle_enabledDictationLanguages_specifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue] ^ 1;
}

- (void)toggleDictationLanguage:(id)a3
{
  uint64_t v5 = (void *)[a3 propertyForKey:*MEMORY[0x263F602B0]];
  uint64_t v6 = [v5 isChecked];
  BOOL v7 = (void *)[a3 propertyForKey:@"enabledDictationLanguages"];
  if (_os_feature_enabled_impl()) {
    [(KSDictationLanguageListController *)self handleSmartLanguageSelectionOnDictationLanguageToggle:v6 enabledDictationLanguages:v7 specifier:a3];
  }
  uint64_t v8 = v6 ^ 1;
  [v5 setChecked:v8];
  uint64_t v9 = [NSNumber numberWithInt:v8];
  objc_msgSend(v7, "setObject:forKey:", v9, objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60138]));
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "setEnabledDictationLanguages:", v7);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F32B18], "sharedCloudSettingsManager"), "writeToCloudSettings:forStore:", &unk_2703CE4C8, @"com.apple.cloudsettings.keyboard");
  [(KSDictationLanguageListController *)self reloadSpecifiers];
}

- (NSDictionary)offlineStatusForLanguage
{
  return self->_offlineStatusForLanguage;
}

- (void)setOfflineStatusForLanguage:(id)a3
{
}

- (KSDictationOfflineStatusObserver)dictaionOfflineStatusObserver
{
  return self->_dictaionOfflineStatusObserver;
}

- (void)setDictaionOfflineStatusObserver:(id)a3
{
}

- (NSMutableDictionary)assetIdToLanguages
{
  return self->_assetIdToLanguages;
}

- (void)setAssetIdToLanguages:(id)a3
{
}

- (NSMutableSet)trackingDownloadStatusForAssetsIDs
{
  return self->_trackingDownloadStatusForAssetsIDs;
}

- (void)setTrackingDownloadStatusForAssetsIDs:(id)a3
{
}

- (NSMutableSet)onDeviceLocalesDownloading
{
  return self->_onDeviceLocalesDownloading;
}

- (void)setOnDeviceLocalesDownloading:(id)a3
{
}

@end
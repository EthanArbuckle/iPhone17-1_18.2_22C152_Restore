@interface KSKeyboardController
+ (BOOL)_isLowStorageForOnDeviceDictationAsset;
+ (id)localizedDisplayNameForInputMode:(id)a3 forDictation:(BOOL)a4;
+ (id)localizedListForInputModes:(id)a3 forDictation:(BOOL)a4 duplicatedBaseLanguages:(id)a5;
+ (id)localizedStringForGeneralKeyboardSpecifier;
+ (id)localizedStringForKeyboardController;
+ (id)singleActiveDisabledDictationLanguage;
+ (int64_t)compareUsingOrderInArray:(id)a3 withFirst:(id)a4 second:(id)a5;
+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4;
+ (void)localizeAndSortPreferencesArray:(id)a3;
- (BOOL)_supportsProKeyboard;
- (BOOL)_supportsReachableKeyboard;
- (BOOL)feedbackFeatureEnabled;
- (BOOL)needsReloadSpecifiers;
- (KSDictationOfflineStatusObserver)dictationOfflineStatusObserver;
- (KSKeyboardController)init;
- (KSUserWordsManager)dictionaryController;
- (NSArray)openShortcutsSpecifiers;
- (NSDictionary)offlineStatusForLanguage;
- (PSSpecifier)deleteWordSpecifier;
- (PSSpecifier)dictationAutoPunctuationSpecifier;
- (PSSpecifier)dictationHardwareShortcutSpecifier;
- (PSSpecifier)dictationLanguageSpecifier;
- (PSSpecifier)inlineCompletionSpecifier;
- (id)addAllPreferencesToArray:(id)a3 mapPreferenceToInputMode:(id)a4;
- (id)autoPunctuation:(id)a3;
- (id)bundle;
- (id)dictationEnabled:(id)a3;
- (id)dictationHWShortcutSpecifier;
- (id)getProKeyboardSetting:(id)a3;
- (id)getReachableKeybordSetting:(id)a3;
- (id)groupPreferences:(id)a3 forMapping:(id)a4 inputModes:(id)a5;
- (id)hardwareKeyboardSpecifier;
- (id)loadAllKeyboardPreferences;
- (id)lowStorageOnDeviceAssetStringWithLinkString:(id)a3;
- (id)mergePreferences:(id)a3 inputModesToPreferences:(id)a4;
- (id)pinyinDialect:(id)a3;
- (id)proKeyboardSpecifier;
- (id)reachableKeyboardSpecifier;
- (id)readAutocorrectionPreferenceValue:(id)a3;
- (id)readCPDeleteWordPreferenceValue:(id)a3;
- (id)readCPPreferenceValue:(id)a3;
- (id)readCheckSpellingPreferenceValue:(id)a3;
- (id)readKeyboardAllowPaddlePreferenceValue:(id)a3;
- (id)readKeyboardInlineCompletionPreferenceValue:(id)a3;
- (id)readKeyboardMathExpressionCompletionPreferenceValue:(id)a3;
- (id)readPredictionPreferenceValue:(id)a3;
- (id)readPreferenceValue:(id)a3;
- (id)readSmartTypingPreferenceValue:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)shuangpinType:(id)a3;
- (id)smartFullwidthSpace:(id)a3;
- (id)sortPreferencesKeysByInputModeOrderAndCount:(id)a3 inputModes:(id)a4;
- (id)specifiers;
- (id)wubiStandard:(id)a3;
- (unint64_t)deleteWordSpecifierIndex;
- (unint64_t)inlineCompletionSpecifierIndex;
- (void)_dismissConfirmationSheet;
- (void)addDictationItems:(id)a3;
- (void)addEnabledExtensionSpecifiersToArray:(id)a3;
- (void)addFooterTextForDialectSpecifierForGroup:(id)a3;
- (void)addFooterTextForStickers:(id)a3;
- (void)addHardwareKeyboardAndShortcuts:(id)a3;
- (void)dealloc;
- (void)dictationDisabledCancelled:(id)a3;
- (void)dictationDisabledConfirmed:(id)a3;
- (void)dictationEnabledCancelled:(id)a3;
- (void)dictationEnabledConfirmed:(id)a3;
- (void)dictationShortcutSubtitle:(id)a3;
- (void)disableLockedDownPreferencesForGroup:(id)a3;
- (void)emitNavigationEventForRootController;
- (void)feedbackFeatureEnabled;
- (void)hardwareKeyboardAvailabilityChanged;
- (void)init;
- (void)launchManageStorage:(id)a3;
- (void)loadAllKeyboardPreferences;
- (void)loadPreferenceForInputModeIdentifier:(id)a3 keyboardInputMode:(id)a4 addNewPreferencesToArray:(id)a5 defaultPreferenceIdentifiers:(id)a6 additionalPreferenceIdentifiers:(id)a7 mapPreferenceToInputMode:(id)a8;
- (void)managedKeyboardSettingsDidChange;
- (void)moveCharacterPreviewPreferenceToEndForGroup:(id)a3;
- (void)moveEnableDictationPreferenceToEndAndAddFooterTextForGroup:(id)a3;
- (void)movePeriodShortcutPreferenceToEndAndAddFooterTextForGroup:(id)a3;
- (void)moveSpaceConfirmationPreferenceToEndAndAddFooterTextForGroup:(id)a3;
- (void)offlineDictationStatusUpdated:(id)a3;
- (void)preferencesDidChange:(id)a3;
- (void)presentPrivacySheet:(id)a3;
- (void)removeDialectPreferenceIfNotApplicableForGroup:(id)a3;
- (void)removeShuangpinPreferenceIfNotApplicableForGroup:(id)a3;
- (void)setAutoPunctuation:(id)a3 specifier:(id)a4;
- (void)setAutocorrectionPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)setCheckSpellingPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)setDeleteWordSpecifier:(id)a3;
- (void)setDeleteWordSpecifierIndex:(unint64_t)a3;
- (void)setDictationAutoPunctuationSpecifier:(id)a3;
- (void)setDictationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setDictationHardwareShortcutSpecifier:(id)a3;
- (void)setDictationLanguageSpecifier:(id)a3;
- (void)setDictationOfflineStatusObserver:(id)a3;
- (void)setInlineCompletionSpecifier:(id)a3;
- (void)setInlineCompletionSpecifierIndex:(unint64_t)a3;
- (void)setKeyboardAllowPaddlePreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)setKeyboardPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)setNeedsReloadSpecifiers:(BOOL)a3;
- (void)setOfflineStatusForLanguage:(id)a3;
- (void)setPinyinDialect:(id)a3 specifier:(id)a4;
- (void)setPredictionPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)setProKeyboardSetting:(id)a3 specifier:(id)a4;
- (void)setReachableKeyboardSetting:(id)a3 specifier:(id)a4;
- (void)setShuangpinType:(id)a3 specifier:(id)a4;
- (void)setSmartFullwidthSpace:(id)a3 specifier:(id)a4;
- (void)setSmartTypingPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)setWubiStandard:(id)a3 specifier:(id)a4;
- (void)showDictationDisabledDialogForSpecifier:(id)a3;
- (void)showDictationEnableDialogForSpecifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation KSKeyboardController

- (void)offlineDictationStatusUpdated:(id)a3
{
  [(KSKeyboardController *)self setOfflineStatusForLanguage:a3];
  [(KSKeyboardController *)self reloadSpecifiers];
}

+ (BOOL)_isLowStorageForOnDeviceDictationAsset
{
  uint64_t v4 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfFileSystemForPath:error:", @"/private/var/MobileAsset/AssetsV2", &v4);
  if (v2)
  {
    v2 = (void *)[v2 objectForKey:*MEMORY[0x263F080C8]];
    if (v2) {
      LOBYTE(v2) = (unint64_t)[v2 unsignedLongLongValue] >> 22 < 0x7D;
    }
  }
  return (char)v2;
}

- (id)lowStorageOnDeviceAssetStringWithLinkString:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[MEMORY[0x263F08760] set];
  v27 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v28 = [MEMORY[0x263EFF980] array];
  v29 = (void *)[MEMORY[0x263EFF980] array];
  v30 = (void *)[MEMORY[0x263EFF980] array];
  v5 = (void *)[MEMORY[0x263F7EC68] sharedPreferencesController];
  v6 = objc_msgSend(v5, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
  id v7 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", @"DictationLanguagesEnabled"), "mutableCopy");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v31 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(v12, "identifier")), "BOOLValue"))
        {
          [v12 identifier];
          TIInputModeGetBaseLanguage();
          [v4 addObject:TIInputModeGetBaseLanguage()];
          if (!-[NSDictionary objectForKeyedSubscript:](-[KSKeyboardController offlineStatusForLanguage](self, "offlineStatusForLanguage"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v12, "identifier"), "stringByReplacingOccurrencesOfString:withString:", @"_", @"-")))
          {
            uint64_t v13 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
            if (v13) {
              [(NSDictionary *)[(KSKeyboardController *)self offlineStatusForLanguage] objectForKeyedSubscript:v13];
            }
          }
          if (AFOfflineDictationStatusStringIsHighQualityModelSupported())
          {
            ++v31;
            int IsInstalled = AFOfflineDictationStatusStringIsInstalled();
            uint64_t v15 = [v12 identifier];
            if (IsInstalled) {
              v16 = (void *)v28;
            }
            else {
              v16 = v29;
            }
          }
          else
          {
            uint64_t v15 = [v12 identifier];
            v16 = v30;
          }
          [v16 addObject:v15];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v31 = 0;
  }
  id result = (id)[v29 count];
  if (result)
  {
    if (![(id)objc_opt_class() _isLowStorageForOnDeviceDictationAsset]) {
      return 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v18 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v4);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          if ((unint64_t)[v4 countForObject:v22] >= 2) {
            [v27 addObject:v22];
          }
        }
        uint64_t v19 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v19);
    }
    id result = (id)[v29 count];
    if (result)
    {
      if ([v30 count] || v31 >= 2)
      {
        v23 = NSString;
        v24 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if ((unint64_t)[v29 count] < 2) {
          v25 = @"DICTATION_ON_DEVICE_LOW_STORAGE_WITH_LANGUAGE";
        }
        else {
          v25 = (__CFString *)[@"DICTATION_ON_DEVICE_LOW_STORAGE_WITH_LANGUAGE" stringByAppendingString:@"S"];
        }
        id result = (id)objc_msgSend(v23, "stringWithFormat:", objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_2703C6C20, @"Keyboard"), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v29, 1, v27));
        goto LABEL_42;
      }
      if (v31 == 1)
      {
        id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ON_DEVICE_LOW_STORAGE", &stru_2703C6C20, @"Keyboard");
LABEL_42:
        if (a3)
        {
          if (result) {
            return (id)[result stringByAppendingFormat:@" %@", a3];
          }
        }
        return result;
      }
      return 0;
    }
  }
  return result;
}

- (KSKeyboardController)init
{
  v11.receiver = self;
  v11.super_class = (Class)KSKeyboardController;
  v2 = [(KSKeyboardController *)&v11 init];
  if (v2)
  {
    v2->_dictionaryController = objc_alloc_init(KSUserWordsManager);
    [MEMORY[0x263F1C738] sharedInstance];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, (CFStringRef)[NSString stringWithUTF8String:*MEMORY[0x263F41D48]], 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_preferencesDidChange_ name:*MEMORY[0x263F7E858] object:0];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__dismissConfirmationSheet name:*MEMORY[0x263F1D050] object:0];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    id v7 = (void *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
    uint64_t v20 = getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
    if (!getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __getMCKeyboardSettingsChangedNotificationSymbolLoc_block_invoke;
      uint64_t v15 = &unk_2653A9280;
      v16 = &v17;
      uint64_t v8 = (void *)ManagedConfigurationLibrary();
      uint64_t v9 = dlsym(v8, "MCKeyboardSettingsChangedNotification");
      *(void *)(v16[1] + 24) = v9;
      getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = *(void *)(v16[1] + 24);
      id v7 = (void *)v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v7) {
      -[KSKeyboardController init]();
    }
    [v6 addObserver:v2 selector:sel_managedKeyboardSettingsDidChange name:*v7 object:0];
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global);
    }
    if (AFOfflineDictationCapable()) {
      v2->_dictationOfflineStatusObserver = [[KSDictationOfflineStatusObserver alloc] initWithDelegate:v2];
    }
  }
  return v2;
}

void __28__KSKeyboardController_init__block_invoke()
{
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_119);
}

uint64_t __28__KSKeyboardController_init__block_invoke_2()
{
  v0 = (void *)[MEMORY[0x263F08850] defaultManager];
  return [v0 URLForUbiquityContainerIdentifier:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)[NSString stringWithUTF8String:*MEMORY[0x263F41D48]], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardController;
  [(KSKeyboardController *)&v4 dealloc];
}

- (id)bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F60170];
  if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KanaFlick"))
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
    id v7 = NSNumber;
    BOOL v8 = [v6 indexOfObjectPassingTest:&__block_literal_global_129] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", v5), "isEqualToString:", @"KanaLeftToRight"))
    {
      v11.receiver = self;
      v11.super_class = (Class)KSKeyboardController;
      return [(KSKeyboardController *)&v11 readPreferenceValue:a3];
    }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
    id v7 = NSNumber;
    BOOL v8 = [v9 indexOfObjectPassingTest:&__block_literal_global_140] == 0x7FFFFFFFFFFFFFFFLL;
  }
  return (id)[v7 numberWithInt:v8];
}

uint64_t __44__KSKeyboardController_readPreferenceValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKeyedSubscript:", @"sw"), "_containsSubstring:", @"Flick");
  if (result) {
    *a4 = 1;
  }
  return result;
}

uint64_t __44__KSKeyboardController_readPreferenceValue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKeyedSubscript:", @"sw"), "_containsSubstring:", @"RTL");
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (void)setKeyboardPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  id v7 = (void *)[a4 propertyForKey:*MEMORY[0x263F60170]];
  if (([v7 isEqualToString:@"KanaLeftToRight"] & 1) != 0
    || [v7 isEqualToString:@"KanaFlick"])
  {
    id v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers"), "mutableCopy");
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "normalizedEnabledInputModeIdentifiers"), "indexOfObject:", @"ja_JP-Kana");
      if (v10 < [v9 count])
      {
        objc_super v11 = (void *)[v9 objectAtIndex:v10];
        int v12 = [v7 isEqualToString:@"KanaLeftToRight"];
        [a3 BOOLValue];
        if (v12) {
          [v11 _containsSubstring:@"Flick"];
        }
        else {
          [v11 _containsSubstring:@"RTL"];
        }
        [v9 replaceObjectAtIndex:v10 withObject:UIKeyboardInputModeWithNewSWLayout()];
        +[KSKeyboardListController setInputModes:v9];
      }
    }
  }
  else
  {
    if ([v7 isEqualToString:@"KeyboardPrediction"])
    {
      uint64_t v13 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
      [v13 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E838]];
    }
    else if ([v7 isEqualToString:@"KeyboardAssistant"] {
           && ([a3 BOOLValue] & 1) == 0)
    }
    {
      UIKeyboardGetCurrentInputMode();
      TIInputModeGetNormalizedIdentifier();
      TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F1D398]])
    {
      TIStatisticGetKey();
      [a3 BOOLValue];
      TIStatisticScalarSetBoolean();
    }
    if (([v7 isEqualToString:@"KeyboardAutocapitalization"] & 1) != 0
      || ([v7 isEqualToString:@"KeyboardAutocorrection"] & 1) != 0
      || ([v7 isEqualToString:@"KeyboardPeriodShortcut"] & 1) != 0
      || ([v7 isEqualToString:@"KeyboardContinuousPathEnabled"] & 1) != 0
      || ([v7 isEqualToString:@"KeyboardContinuousPathDeleteWholeWord"] & 1) != 0
      || ([v7 isEqualToString:@"KeyboardPrediction"] & 1) != 0
      || ([v7 isEqualToString:@"KeyboardInlineCompletion"] & 1) != 0
      || ([v7 isEqualToString:@"SpaceConfirmation"] & 1) != 0
      || [v7 isEqualToString:@"KeyboardCapsLock"])
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController"), "setValue:forPreferenceKey:", a3, v7);
    }
    else
    {
      [MEMORY[0x263F5FC20] setPreferenceValue:a3 specifier:a4];
    }
  }
  uint64_t v14 = *MEMORY[0x263F60138];
  if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60138]), "isEqualToString:", @"KeyboardContinuousPathEnabled"))
  {
    int v15 = [(KSKeyboardController *)self containsSpecifier:[(KSKeyboardController *)self deleteWordSpecifier]];
    if (![a3 BOOLValue] || (v15 & 1) != 0)
    {
      if (([a3 BOOLValue] & 1) == 0 && ((v15 ^ 1) & 1) == 0)
      {
        -[KSKeyboardController setDeleteWordSpecifierIndex:](self, "setDeleteWordSpecifierIndex:", objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "indexOfObject:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier")));
        [(KSKeyboardController *)self removeSpecifier:[(KSKeyboardController *)self deleteWordSpecifier] animated:1];
      }
    }
    else
    {
      [(KSKeyboardController *)self deleteWordSpecifierIndex];
      unint64_t v16 = [(KSKeyboardController *)self deleteWordSpecifierIndex];
      unint64_t v17 = objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "count");
      uint64_t v18 = [(KSKeyboardController *)self deleteWordSpecifier];
      if (v16 >= v17) {
        [(KSKeyboardController *)self addSpecifier:v18 animated:1];
      }
      else {
        [(KSKeyboardController *)self insertSpecifier:v18 atIndex:[(KSKeyboardController *)self deleteWordSpecifierIndex] animated:1];
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v14), "isEqualToString:", @"KeyboardPrediction"))
  {
    int v19 = [(KSKeyboardController *)self containsSpecifier:[(KSKeyboardController *)self inlineCompletionSpecifier]];
    if (![a3 BOOLValue] || (v19 & 1) != 0)
    {
      if (([a3 BOOLValue] & 1) == 0 && ((v19 ^ 1) & 1) == 0)
      {
        -[KSKeyboardController setInlineCompletionSpecifierIndex:](self, "setInlineCompletionSpecifierIndex:", objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "indexOfObject:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier")));
        [(KSKeyboardController *)self removeSpecifier:[(KSKeyboardController *)self inlineCompletionSpecifier] animated:1];
      }
    }
    else
    {
      [(KSKeyboardController *)self inlineCompletionSpecifierIndex];
      unint64_t v20 = [(KSKeyboardController *)self inlineCompletionSpecifierIndex];
      unint64_t v21 = objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "count");
      uint64_t v22 = [(KSKeyboardController *)self inlineCompletionSpecifier];
      if (v20 >= v21) {
        [(KSKeyboardController *)self addSpecifier:v22 animated:1];
      }
      else {
        [(KSKeyboardController *)self insertSpecifier:v22 atIndex:[(KSKeyboardController *)self inlineCompletionSpecifierIndex] animated:1];
      }
    }
  }
  uint64_t v23 = *MEMORY[0x263F60070];
  if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60070]), "isEqualToString:", @"com.apple.InputModePreferences"))
  {
    CFStringRef v24 = @"AppleKeyboardsInputModeChangedNotification";
  }
  else if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v23), "isEqualToString:", @"com.apple.keyboard.ContinuousPath"))
  {
    CFStringRef v24 = @"AppleKeyboardsContinuousPathSettingsChangedNotification";
  }
  else if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v23), "isEqualToString:", @"com.apple.keyboard.predictive"))
  {
    CFStringRef v24 = @"AppleKeyboardsPredictiveChangedNotification";
  }
  else
  {
    CFStringRef v24 = @"AppleKeyboardsSettingsChangedNotification";
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v24, 0, 0, 1u);
}

- (id)readAutocorrectionPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardAutocorrection") & 1) == 0)-[KSKeyboardController readAutocorrectionPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E7C8];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readPredictionPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardPrediction") & 1) == 0)-[KSKeyboardController readPredictionPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E830];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readKeyboardInlineCompletionPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardInlineCompletion") & 1) == 0)-[KSKeyboardController readKeyboardInlineCompletionPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E7F8];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readKeyboardMathExpressionCompletionPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardMathExpressionCompletion") & 1) == 0)-[KSKeyboardController readKeyboardMathExpressionCompletionPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E808];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readKeyboardAllowPaddlePreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardAllowPaddle") & 1) == 0)-[KSKeyboardController readKeyboardAllowPaddlePreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E7B8];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readCheckSpellingPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardCheckSpelling") & 1) == 0)-[KSKeyboardController readCheckSpellingPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E7E0];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readCPPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardContinuousPathEnabled") & 1) == 0)-[KSKeyboardController readCPPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E7F0];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (id)readCPDeleteWordPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardContinuousPathDeleteWholeWord") & 1) == 0)-[KSKeyboardController readCPDeleteWordPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E7E8];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setAutocorrectionPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardAutocorrection") & 1) == 0)-[KSKeyboardController setAutocorrectionPreferenceValue:forSpecifier:](); {
  if (![(KSKeyboardController *)self feedbackFeatureEnabled]
  }
    || !KeyboardSettingsFeedbackLibraryCore())
  {
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy_;
  int v15 = __Block_byref_object_dispose_;
  v6 = (void *)getTUIFeedbackControllerClass_softClass;
  uint64_t v16 = getTUIFeedbackControllerClass_softClass;
  if (!getTUIFeedbackControllerClass_softClass)
  {
    KeyboardSettingsFeedbackLibraryCore();
    v12[5] = (uint64_t)objc_getClass("TUIFeedbackController");
    getTUIFeedbackControllerClass_softClass = v12[5];
    v6 = (void *)v12[5];
  }
  _Block_object_dispose(&v11, 8);
  if (objc_opt_respondsToSelector())
  {
    [MEMORY[0x263F7E550] getSupportedFeedbackLanguages];
    id v7 = (void *)[v6 controller];
    int v8 = objc_msgSend(v7, "shouldCompleteStudyWithPreferenceValue:", objc_msgSend(a3, "BOOLValue"));
    uint64_t v9 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    [v9 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E7C8]];
    if (v8) {
      objc_msgSend(v7, "completeStudyWithFinalPreferenceValue:parentController:", objc_msgSend(a3, "BOOLValue"), self);
    }
  }
  else
  {
LABEL_9:
    unint64_t v10 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    [v10 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E7C8]];
  }
}

- (BOOL)feedbackFeatureEnabled
{
  if (feedbackFeatureEnabled_once_token != -1) {
    dispatch_once(&feedbackFeatureEnabled_once_token, &__block_literal_global_237);
  }
  if (feedbackFeatureEnabled_is_internal_install) {
    char v2 = objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x263EFFA40]), "initWithSuiteName:", @"com.apple.keyboard"), "BOOLForKey:", @"feedbackFeatureEnabled");
  }
  else {
    char v2 = 0;
  }
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v3 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(KSKeyboardController *)v2 feedbackFeatureEnabled];
    }
  }
  return v2;
}

uint64_t __46__KSKeyboardController_feedbackFeatureEnabled__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  feedbackFeatureEnabled_is_internal_install = result;
  return result;
}

- (void)setPredictionPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardPrediction") & 1) == 0)-[KSKeyboardController setPredictionPreferenceValue:forSpecifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  [v5 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E830]];
  v6 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v7 = *MEMORY[0x263F7E838];
  [v6 setValue:a3 forPreferenceKey:v7];
}

- (void)setKeyboardAllowPaddlePreferenceValue:(id)a3 forSpecifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardAllowPaddle") & 1) == 0)-[KSKeyboardController setKeyboardAllowPaddlePreferenceValue:forSpecifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v6 = *MEMORY[0x263F7E7B8];
  [v5 setValue:a3 forPreferenceKey:v6];
}

- (void)setCheckSpellingPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"KeyboardCheckSpelling") & 1) == 0)-[KSKeyboardController setCheckSpellingPreferenceValue:forSpecifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v6 = *MEMORY[0x263F7E7E0];
  [v5 setValue:a3 forPreferenceKey:v6];
}

- (id)readSmartTypingPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"SmartTyping") & 1) == 0)-[KSKeyboardController readSmartTypingPreferenceValue:](); {
  uint64_t v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E878];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setSmartTypingPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"SmartTyping") & 1) == 0)-[KSKeyboardController setSmartTypingPreferenceValue:forSpecifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  [v5 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E878]];
  uint64_t v6 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v7 = *MEMORY[0x263F7E868];
  [v6 setValue:a3 forPreferenceKey:v7];
}

+ (id)singleActiveDisabledDictationLanguage
{
  v7[1] = *MEMORY[0x263EF8340];
  char v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers");
  if ([v2 count] == 1
    && (uint64_t v3 = (void *)[MEMORY[0x263F7E570] sharedInputModeController],
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v4 = objc_msgSend(v3, "defaultDictationLanguagesForKeyboardLanguage:", objc_msgSend(v2, "firstObject"));
    if (!v4)
    {
      v7[0] = [v2 firstObject];
      uint64_t v4 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  if ([v4 count] == 1)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
    id result = (id)objc_msgSend((id)objc_msgSend(v5, "valueForPreferenceKey:", *MEMORY[0x263F1D1B8]), "objectForKeyedSubscript:", objc_msgSend(v4, "firstObject"));
    if (!result) {
      return result;
    }
    if (([result BOOLValue] & 1) == 0) {
      return (id)[v4 firstObject];
    }
  }
  return 0;
}

- (id)dictationEnabled:(id)a3
{
  if (DictationIsEnabled()) {
    BOOL v3 = [(id)objc_opt_class() singleActiveDisabledDictationLanguage] == 0;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = NSNumber;
  return (id)[v4 numberWithBool:v3];
}

- (void)showDictationEnableDialogForSpecifier:(id)a3
{
  [a3 setConfirmationAction:sel_dictationEnabledConfirmed_];
  [a3 setConfirmationCancelAction:sel_dictationEnabledCancelled_];
  uint64_t v4 = AFDeviceHighestLanguageModelCapabilityIdentifier();
  uint64_t v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v4 == 10) {
    uint64_t v6 = @"DICTATION_ENABLE_PROMPT_ON_DEVICE_DICTATION_CAPABLE";
  }
  else {
    uint64_t v6 = @"DICTATION_ENABLE_PROMPT";
  }
  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_2703C6C20 table:@"Keyboard"];
  uint64_t v14 = NSDictionary;
  uint64_t v15 = v7;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "sf_isiPad")) {
    int v8 = @"DICTATION_ENABLE_TITLE_IPAD";
  }
  else {
    int v8 = @"DICTATION_ENABLE_TITLE_IPHONE";
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v8, &stru_2703C6C20, @"Keyboard");
  uint64_t v10 = *MEMORY[0x263F60018];
  uint64_t v11 = *MEMORY[0x263F60010];
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ENABLE_OK", &stru_2703C6C20, @"Keyboard");
  objc_msgSend(a3, "setupWithDictionary:", objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v9, v10, v15, v11, v12, *MEMORY[0x263F60008], objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_ENABLE_CANCEL", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F5FFF8], 0));
  uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "sf_isiPad");
  [(KSKeyboardController *)self showConfirmationViewForSpecifier:a3 useAlert:v13 swapAlertButtons:0];
}

- (void)showDictationDisabledDialogForSpecifier:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "assistantIsEnabled");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F57730], "sharedInstance"), "isPaired");
  uint64_t v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v4) {
    uint64_t v6 = @"DICTATION_DISABLE_PROMPT_SIRI_ENABLED";
  }
  else {
    uint64_t v6 = @"DICTATION_DISABLE_PROMPT_SIRI_DISABLED";
  }
  uint64_t v14 = [v5 localizedStringForKey:v6 value:&stru_2703C6C20 table:@"Keyboard"];
  [a3 setConfirmationAction:sel_dictationDisabledConfirmed_];
  [a3 setConfirmationCancelAction:sel_dictationDisabledCancelled_];
  uint64_t v13 = NSDictionary;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "sf_isiPad")) {
    uint64_t v7 = @"DICTATION_DISABLE_TITLE_IPAD";
  }
  else {
    uint64_t v7 = @"DICTATION_DISABLE_TITLE_IPHONE";
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v7, &stru_2703C6C20, @"Keyboard");
  uint64_t v9 = *MEMORY[0x263F60018];
  uint64_t v10 = *MEMORY[0x263F60010];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_DISABLE_OK", &stru_2703C6C20, @"Keyboard");
  objc_msgSend(a3, "setupWithDictionary:", objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v8, v9, v14, v10, v11, *MEMORY[0x263F60008], objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_DISABLE_CANCEL", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F5FFF8], 0));
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "sf_isiPad");
  [(KSKeyboardController *)self showConfirmationViewForSpecifier:a3 useAlert:v12 swapAlertButtons:0];
}

- (void)setDictationEnabled:(id)a3 forSpecifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    [(KSKeyboardController *)self showDictationEnableDialogForSpecifier:a4];
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "dictationIsEnabled"))
  {
    [(KSKeyboardController *)self showDictationDisabledDialogForSpecifier:a4];
  }
  else
  {
    [(KSKeyboardController *)self dictationDisabledConfirmed:a4];
  }
}

- (void)dictationEnabledConfirmed:(id)a3
{
  BOOL v3 = (PSSpecifier *)a3;
  v10[1] = *MEMORY[0x263EF8340];
  [a3 setConfirmationAction:0];
  [(PSSpecifier *)v3 setConfirmationCancelAction:0];
  uint64_t v5 = [(id)objc_opt_class() singleActiveDisabledDictationLanguage];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
      uint64_t v9 = v6;
      v10[0] = MEMORY[0x263EFFA88];
      objc_msgSend(v7, "setEnabledDictationLanguages:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions"), "synchronizePreferences");
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "setDictationIsEnabled:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "synchronize");
  uint64_t v8 = [(KSKeyboardController *)self dictationAutoPunctuationSpecifier];
  if (v8) {
    BOOL v3 = v8;
  }
  if ([(KSKeyboardController *)self dictationLanguageSpecifier])
  {
    [(KSKeyboardController *)self insertSpecifier:[(KSKeyboardController *)self dictationLanguageSpecifier] afterSpecifier:v3 animated:1];
    BOOL v3 = [(KSKeyboardController *)self dictationLanguageSpecifier];
  }
  if ([(KSKeyboardController *)self dictationHardwareShortcutSpecifier])
  {
    [(KSKeyboardController *)self insertSpecifier:[(KSKeyboardController *)self dictationHardwareShortcutSpecifier] afterSpecifier:v3 animated:1];
    [(KSKeyboardController *)self dictationHardwareShortcutSpecifier];
  }
  [(KSKeyboardController *)self reloadSpecifiers];
}

- (void)dictationEnabledCancelled:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60028]), "setOn:animated:", 0, 1);
  [a3 setConfirmationAction:0];
  [a3 setConfirmationCancelAction:0];
}

- (void)dictationDisabledConfirmed:(id)a3
{
  [a3 setConfirmationAction:0];
  [a3 setConfirmationCancelAction:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "setSuppressDictationOptIn:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "setDictationIsEnabled:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences"), "synchronize");
  if ([(KSKeyboardController *)self dictationLanguageSpecifier]) {
    [(KSKeyboardController *)self removeSpecifier:[(KSKeyboardController *)self dictationLanguageSpecifier] animated:1];
  }
  if ([(KSKeyboardController *)self dictationHardwareShortcutSpecifier]) {
    [(KSKeyboardController *)self removeSpecifier:[(KSKeyboardController *)self dictationHardwareShortcutSpecifier] animated:1];
  }
  [(KSKeyboardController *)self reloadSpecifiers];
}

- (void)dictationDisabledCancelled:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60028]), "setOn:animated:", 1, 1);
  [a3 setConfirmationAction:0];
  [a3 setConfirmationCancelAction:0];
}

- (void)_dismissConfirmationSheet
{
  [(KSKeyboardController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(KSKeyboardController *)self dismissViewControllerAnimated:0 completion:0];
  }
  [(KSKeyboardController *)self reloadSpecifierID:@"Dictation" animated:0];
}

- (void)presentPrivacySheet:(id)a3
{
  int v4 = (void *)[MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)launchManageStorage:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  uint64_t v4 = [NSURL URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  [v3 openSensitiveURL:v4 withOptions:0 error:0];
}

- (id)shuangpinType:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"ShuangpinType") & 1) == 0)-[KSKeyboardController shuangpinType:](); {
  BOOL v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E860];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setShuangpinType:(id)a3 specifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"ShuangpinType") & 1) == 0)-[KSKeyboardController setShuangpinType:specifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  [v5 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E860]];
  KSUpdateShuangpinSWLayout();
}

- (id)pinyinDialect:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"PinyinDialect") & 1) == 0)-[KSKeyboardController pinyinDialect:](); {
  BOOL v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E848];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setPinyinDialect:(id)a3 specifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"PinyinDialect") & 1) == 0)-[KSKeyboardController setPinyinDialect:specifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  [v5 setValue:a3 forPreferenceKey:*MEMORY[0x263F7E848]];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleKeyboardsPreferencesChangedNotification", 0, 0, 1u);
}

- (id)wubiStandard:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"WubiStandard") & 1) == 0)-[KSKeyboardController wubiStandard:](); {
  BOOL v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E950];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setWubiStandard:(id)a3 specifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"WubiStandard") & 1) == 0)-[KSKeyboardController setWubiStandard:specifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v6 = *MEMORY[0x263F7E950];
  [v5 setValue:a3 forPreferenceKey:v6];
}

- (id)smartFullwidthSpace:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"SmartFullwidthSpace") & 1) == 0)-[KSKeyboardController smartFullwidthSpace:](); {
  BOOL v3 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v4 = *MEMORY[0x263F7E870];
  return (id)[v3 valueForPreferenceKey:v4];
}

- (void)setSmartFullwidthSpace:(id)a3 specifier:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60170]), "isEqualToString:", @"SmartFullwidthSpace") & 1) == 0)-[KSKeyboardController setSmartFullwidthSpace:specifier:](); {
  uint64_t v5 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
  }
  uint64_t v6 = *MEMORY[0x263F7E870];
  [v5 setValue:a3 forPreferenceKey:v6];
}

+ (id)localizedStringForGeneralKeyboardSpecifier
{
  id result = (id)localizedStringForGeneralKeyboardSpecifier_sKeyboardLocalizedString;
  if (!localizedStringForGeneralKeyboardSpecifier_sKeyboardLocalizedString)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.GeneralSettingsUI"];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      id v5 = objc_alloc(MEMORY[0x263F08DB0]);
      id result = (id)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", @"Keyboard", @"General", objc_msgSend(MEMORY[0x263EFF960], "currentLocale"), objc_msgSend(v4, "bundleURL"));
    }
    else
    {
      id result = +[KSKeyboardController localizedStringForKeyboardController];
    }
    localizedStringForGeneralKeyboardSpecifier_sKeyboardLocalizedString = (uint64_t)result;
  }
  return result;
}

+ (id)localizedStringForKeyboardController
{
  id result = (id)localizedStringForKeyboardController_sKeyboardControllerTitleLocalizedString;
  if (!localizedStringForKeyboardController_sKeyboardControllerTitleLocalizedString)
  {
    id v3 = objc_alloc(MEMORY[0x263F08DB0]);
    uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
    id result = (id)objc_msgSend(v3, "initWithKey:table:locale:bundleURL:", @"KEYBOARDS", @"Keyboard", v4, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL"));
    localizedStringForKeyboardController_sKeyboardControllerTitleLocalizedString = (uint64_t)result;
  }
  return result;
}

- (void)emitNavigationEventForRootController
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Keyboard"];
  id v4 = +[KSKeyboardController localizedStringForGeneralKeyboardSpecifier];
  id v5 = +[KSKeyboardController localizedStringForKeyboardController];
  v6[0] = v4;
  -[KSKeyboardController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", v5, [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1], v3);
}

+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_opt_class();
  if ([v6 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v7 = [a3 identifier];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [NSString stringWithFormat:@"settings-navigation://com.apple.Settings.General/Keyboard/%@", v7];
      uint64_t v10 = [NSURL URLWithString:v9];
      v17[0] = @"ReachableKeyboard";
      v17[1] = @"HardwareKeyboard";
      v18[0] = @"REACHABLE_KEYBOARD";
      v18[1] = @"Hardware Keyboard";
      uint64_t v11 = objc_msgSend((id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2), "objectForKeyedSubscript:", v8);
      if (v11)
      {
        uint64_t v12 = v11;
        id v13 = +[KSKeyboardController localizedStringForGeneralKeyboardSpecifier];
        id v14 = objc_alloc(MEMORY[0x263F08DB0]);
        uint64_t v15 = [MEMORY[0x263EFF960] currentLocale];
        id v16 = v13;
        objc_msgSend(a4, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", objc_msgSend(v14, "initWithKey:table:locale:bundleURL:", v12, @"Keyboard", v15, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v16, 2), v10);
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardController;
  [(PSAppListController *)&v4 viewWillAppear:a3];
  if (self->_needsReloadSpecifiers) {
    [(KSKeyboardController *)self reloadSpecifiers];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardController;
  [(KSKeyboardController *)&v4 viewDidAppear:a3];
  [(KSKeyboardController *)self emitNavigationEventForRootController];
}

- (void)preferencesDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__KSKeyboardController_preferencesDidChange___block_invoke;
  block[3] = &unk_2653A9198;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __45__KSKeyboardController_preferencesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 1409))
  {
    *(unsigned char *)(v1 + 1409) = 1;
    dispatch_time_t v3 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__KSKeyboardController_preferencesDidChange___block_invoke_2;
    block[3] = &unk_2653A9198;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __45__KSKeyboardController_preferencesDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) reloadSpecifiers];
  *(unsigned char *)(*(void *)(a1 + 32) + 1409) = 0;
  return result;
}

- (void)managedKeyboardSettingsDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__KSKeyboardController_managedKeyboardSettingsDidChange__block_invoke;
  block[3] = &unk_2653A9198;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__KSKeyboardController_managedKeyboardSettingsDidChange__block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "navigationController"), "topViewController");
  objc_super v4 = *(void **)(a1 + 32);
  if (v2 == (void *)v3)
  {
    return [v4 reloadSpecifiers];
  }
  else
  {
    [v4 setNeedsReloadSpecifiers:1];
    uint64_t result = objc_msgSend((id)objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection"), "isKeyboardShortcutsAllowed");
    if ((result & 1) == 0)
    {
      uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "navigationController"), "viewControllers"), "containsObject:", *(void *)(a1 + 32));
      if (result)
      {
        uint64_t v6 = (void *)[*(id *)(a1 + 32) navigationController];
        uint64_t v7 = *(void *)(a1 + 32);
        return [v6 popToViewController:v7 animated:1];
      }
    }
  }
  return result;
}

- (void)disableLockedDownPreferencesForGroup:(id)a3
{
  uint64_t v4 = [a3 specifierForID:@"KeyboardAutocorrection"];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v6 isPreferenceKeyLockedDown:*MEMORY[0x263F7E7C8]]) {
      [v5 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
  }
  uint64_t v7 = [a3 specifierForID:@"KeyboardPrediction"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v9 isPreferenceKeyLockedDown:*MEMORY[0x263F7E830]]) {
      [v8 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
    [a3 specifierForID:@"KeyboardInlineCompletion"];
    uint64_t v10 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v10 isPreferenceKeyLockedDown:*MEMORY[0x263F7E7F8]]) {
      [v8 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
    [a3 specifierForID:@"KeyboardMathExpressionCompletion"];
    uint64_t v11 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v11 isPreferenceKeyLockedDown:*MEMORY[0x263F7E808]]) {
      [v8 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
  }
  else
  {
    [a3 specifierForID:@"KeyboardInlineCompletion"];
    [a3 specifierForID:@"KeyboardMathExpressionCompletion"];
  }
  uint64_t v12 = [a3 specifierForID:@"KeyboardCheckSpelling"];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v14 isPreferenceKeyLockedDown:*MEMORY[0x263F7E7E0]]) {
      [v13 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
  }
  uint64_t v15 = [a3 specifierForID:@"SmartTyping"];
  if (v15)
  {
    id v16 = (void *)v15;
    unint64_t v17 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v17 isPreferenceKeyLockedDown:*MEMORY[0x263F7E878]]) {
      [v16 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
  }
  uint64_t v18 = [a3 specifierForID:@"KeyboardContinuousPathEnabled"];
  if (v18)
  {
    int v19 = (void *)v18;
    unint64_t v20 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v20 isPreferenceKeyLockedDown:*MEMORY[0x263F7E7F0]])
    {
      uint64_t v21 = *MEMORY[0x263F600A8];
      uint64_t v22 = MEMORY[0x263EFFA80];
      [v19 setProperty:v22 forKey:v21];
    }
  }
}

- (void)moveCharacterPreviewPreferenceToEndForGroup:(id)a3
{
  uint64_t v4 = [a3 specifierForID:@"KeyboardAllowPaddle"];
  if (v4)
  {
    uint64_t v5 = v4;
    if ([a3 specifierForID:@"KEYBOARD_TITLE"])
    {
      [a3 removeObject:v5];
      [a3 addObject:v5];
    }
  }
}

- (void)movePeriodShortcutPreferenceToEndAndAddFooterTextForGroup:(id)a3
{
  -[KSKeyboardController moveCharacterPreviewPreferenceToEndForGroup:](self, "moveCharacterPreviewPreferenceToEndForGroup:");
  uint64_t v4 = [a3 specifierForID:@"KeyboardPeriodShortcut"];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (void *)[a3 specifierForID:@"KEYBOARD_TITLE"];
    if (v6)
    {
      objc_msgSend(v6, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PERIOD_SHORTCUT_DESCRIPTION", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F600F8]);
      [a3 removeObject:v5];
      [a3 addObject:v5];
    }
  }
}

- (void)removeShuangpinPreferenceIfNotApplicableForGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController", 0, 0), "enabledInputModeIdentifiers");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([(id)TIInputModeGetVariant() isEqualToString:@"Shuangpin"]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v9 = [a3 specifierForID:@"ShuangpinType"];
    if (v9) {
      [a3 removeObject:v9];
    }
  }
}

- (void)removeDialectPreferenceIfNotApplicableForGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController", 0), "enabledInputModeIdentifiers");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
      if ([(id)TIInputModeGetVariant() isEqualToString:@"Pinyin"])
      {
        if ([(id)MEMORY[0x25A2782E0](v9) isEqualToString:@"Hans"]) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v10 = [a3 specifierForID:@"PinyinDialect"];
    if (v10) {
      [a3 removeObject:v10];
    }
  }
}

- (void)addFooterTextForDialectSpecifierForGroup:(id)a3
{
  uint64_t v3 = [a3 specifierForID:@"PinyinDialect"];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:SFLocalizableWAPIStringKeyForKey() value:&stru_2703C6C20 table:@"Preferences_pinyin"];
    uint64_t v7 = *MEMORY[0x263F60280];
    [v4 setProperty:v6 forKey:v7];
  }
}

- (void)moveSpaceConfirmationPreferenceToEndAndAddFooterTextForGroup:(id)a3
{
  uint64_t v4 = (void *)[a3 specifierForID:@"KEYBOARD_TITLE"];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *MEMORY[0x263F600F8];
    if (![v4 propertyForKey:*MEMORY[0x263F600F8]])
    {
      uint64_t v7 = [a3 specifierForID:@"SpaceConfirmation"];
      if (v7)
      {
        uint64_t v8 = v7;
        objc_msgSend(v5, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SPACE_CONFIRMATION_EXPLANATION", &stru_2703C6C20, @"Keyboard"), v6);
        [a3 removeObject:v8];
        [a3 addObject:v8];
      }
    }
  }
}

- (void)moveEnableDictationPreferenceToEndAndAddFooterTextForGroup:(id)a3
{
  uint64_t v5 = [a3 specifierForID:@"Dictation"];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a3 specifierForID:@"KEYBOARD_TITLE"];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [a3 specifierForID:@"KeyboardPeriodShortcut"];
      if (v9 | [a3 specifierForID:@"SpaceConfirmation"])
      {
        if ([v8 name]) {
          uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_GROUP_TITLE", &stru_2703C6C20, @"Keyboard");
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v8 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"DICTATION_GROUP_TITLE" name:v10];
        [a3 addObject:v8];
      }
      [a3 removeObject:v6];
      [a3 addObject:v6];
      [v8 setTarget:self];
      uint64_t v11 = *MEMORY[0x263F600C0];
      [v8 setProperty:@"DictationFooterView" forKey:v11];
    }
  }
}

+ (void)localizeAndSortPreferencesArray:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "name"), &stru_2703C6C20, @"Keyboard"));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [a3 sortedArrayUsingComparator:&__block_literal_global_401];
}

uint64_t __56__KSKeyboardController_localizeAndSortPreferencesArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];
  return [v4 localizedStandardCompare:v5];
}

+ (id)localizedDisplayNameForInputMode:(id)a3 forDictation:(BOOL)a4
{
  if (a4)
  {
    uint64_t v5 = (void *)TUIDictationTitle();
    if ([v5 length] && !objc_msgSend(v5, "isEqualToString:", a3)) {
      return v5;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(id)TIInputModeGetVariant() length]) {
    uint64_t v5 = (void *)TUIKeyboardTitle();
  }
  NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
  if (![v5 length]) {
    uint64_t v5 = (void *)TUIKeyboardTitle();
  }
  if (![v5 length] || objc_msgSend(NormalizedIdentifier, "isEqualToString:", v5))
  {
    uint64_t v7 = (void *)[MEMORY[0x263EFF960] currentLocale];
    uint64_t v5 = (void *)[v7 displayNameForKey:*MEMORY[0x263EFF508] value:TIInputModeGetLanguageWithRegion()];
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "identifierIsValidSystemInputMode:", NormalizedIdentifier)&& !objc_msgSend(v5, "length"))
  {
    +[KSKeyboardController localizedDisplayNameForInputMode:forDictation:]();
  }
  return v5;
}

+ (int64_t)compareUsingOrderInArray:(id)a3 withFirst:(id)a4 second:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    int64_t v11 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 isEqualToString:a4]
          && ![v13 isEqualToString:a5])
        {
          return -1;
        }
        if ([v13 isEqualToString:a5]
          && ![v13 isEqualToString:a4])
        {
          return v11;
        }
        if ([v13 isEqualToString:a4]
          && ([v13 isEqualToString:a5] & 1) != 0)
        {
          return 0;
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return [a4 localizedStandardCompare:a5];
}

- (void)loadPreferenceForInputModeIdentifier:(id)a3 keyboardInputMode:(id)a4 addNewPreferencesToArray:(id)a5 defaultPreferenceIdentifiers:(id)a6 additionalPreferenceIdentifiers:(id)a7 mapPreferenceToInputMode:(id)a8
{
  v59[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = (void *)TIGetInputModeProperties();
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "sf_isiPad")
    || (long long v14 = (void *)[v13 objectForKey:@"Preferences-iPad"]) == 0)
  {
    long long v14 = (void *)[v13 objectForKey:@"Preferences"];
  }
  uint64_t v55 = 0;
  if (AFDictationRestricted()) {
    int v15 = 0;
  }
  else {
    int v15 = objc_msgSend(MEMORY[0x263F284E8], "dictationIsSupportedForLanguageCode:error:", objc_msgSend(a4, "languageWithRegion"), &v55);
  }
  v59[0] = a3;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  int v16 = UIKeyboardPredictionEnabledForInputModes();
  if (v13)
  {
    int v38 = objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"UIKeyboardInlineCompletion"), "BOOLValue") ^ 1;
    obuint64_t j = UIKeyboardDeviceSupportsSplit();
    int v17 = objc_msgSend((id)objc_msgSend(v13, "objectForKey:", *MEMORY[0x263F7E768]), "BOOLValue") ^ 1;
    int v41 = objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"KeyboardCPAllowsDeleteWord"), "BOOLValue");
  }
  else
  {
    int v17 = 1;
    obuint64_t j = UIKeyboardDeviceSupportsSplit();
    int v41 = 0;
    int v38 = 1;
  }
  id v33 = a3;
  if (v14)
  {
    id v18 = (id)[v14 mutableCopy];
    if (UIKeyboardCheckSpellingPossibleForInputMode())
    {
      [v18 addObject:@"KeyboardCheckSpelling"];
      if (!v15)
      {
LABEL_13:
        if (!v16)
        {
LABEL_21:
          if ((v17 & 1) == 0)
          {
            [v18 addObject:@"KeyboardContinuousPathEnabled"];
            if (v41) {
              [v18 addObject:@"KeyboardContinuousPathDeleteWholeWord"];
            }
          }
          if (UIKeyboardDeviceSupportsSplit()) {
            [v18 addObject:@"RivenKeyboard"];
          }
          objc_msgSend(v18, "addObject:", @"KeyboardAssistant", v33);
          [v18 addObject:@"KeyboardAllowPaddle"];
          [v18 addObject:@"GesturesEnabled"];
          goto LABEL_27;
        }
LABEL_19:
        objc_msgSend(v18, "addObject:", @"KeyboardPrediction", v33);
        if ((v38 & 1) == 0) {
          [v18 addObject:@"KeyboardInlineCompletion"];
        }
        goto LABEL_21;
      }
    }
    else if (!v15)
    {
      goto LABEL_13;
    }
    objc_msgSend(v18, "addObject:", @"Dictation", a3);
    if (!v16) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if ([a3 isEqualToString:@"emoji"])
  {
    id v18 = (id)[MEMORY[0x263EFF980] array];
    goto LABEL_27;
  }
  id v18 = (id)[a6 mutableCopy];
  if (UIKeyboardCheckSpellingPossibleForInputMode())
  {
    if (v15) {
      goto LABEL_55;
    }
  }
  else
  {
    [v18 removeObject:@"KeyboardCheckSpelling"];
    if (v15)
    {
LABEL_55:
      if (v16) {
        goto LABEL_56;
      }
      goto LABEL_60;
    }
  }
  objc_msgSend(v18, "removeObject:", @"Dictation", a3);
  if (v16)
  {
LABEL_56:
    if (!v38) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v18, "removeObject:", @"KeyboardPrediction", v33);
LABEL_61:
  objc_msgSend(v18, "removeObject:", @"KeyboardInlineCompletion", v33);
LABEL_62:
  if ((obj & 1) == 0) {
    [v18 removeObject:@"RivenKeyboard"];
  }
  if (v17)
  {
    [v18 removeObject:@"KeyboardContinuousPathEnabled"];
  }
  else if (v41)
  {
    goto LABEL_27;
  }
  objc_msgSend(v18, "removeObject:", @"KeyboardContinuousPathDeleteWholeWord", v33);
LABEL_27:
  int v19 = objc_msgSend(MEMORY[0x263EFF980], "array", v33);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v18);
        }
        CFStringRef v24 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v24 hasPrefix:@"!"])
        {
          [v19 addObject:v24];
          objc_msgSend(v19, "addObject:", objc_msgSend(v24, "substringFromIndex:", 1));
        }
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v21);
  }
  [v18 removeObjectsInArray:v19];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = (id)[v13 objectForKey:@"AdditionalPreferencesPlist"];
  uint64_t v42 = [obja countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v42)
  {
    uint64_t v39 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(obja);
        }
        v26 = (void *)[(KSKeyboardController *)self loadSpecifiersFromPlistName:*(void *)(*((void *)&v47 + 1) + 8 * j) target:self];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v44 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void **)(*((void *)&v43 + 1) + 8 * k);
              uint64_t v32 = [v31 identifier];
              [v18 addObject:v32];
              if (([a7 containsObject:v32] & 1) == 0)
              {
                [a5 addObject:v31];
                [a7 addObject:v32];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
          }
          while (v28);
        }
      }
      uint64_t v42 = [obja countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v42);
  }
  [a8 setObject:v18 forKey:v34];
}

- (id)mergePreferences:(id)a3 inputModesToPreferences:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __65__KSKeyboardController_mergePreferences_inputModesToPreferences___block_invoke;
  v22[3] = &unk_2653A91E0;
  v22[4] = a3;
  uint64_t v6 = (void *)[a3 indexesOfObjectsPassingTest:v22];
  if (![v6 count]) {
    return a3;
  }
  id v7 = (id)[a3 mutableCopy];
  uint64_t v8 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v9 = (void *)[a3 objectsAtIndexes:v6];
  uint64_t v10 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        [v10 addObjectsFromArray:v15];
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(a4, "objectForKey:", v15));
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }
  [a4 removeObjectsForKeys:v9];
  [v7 removeObjectsAtIndexes:v6];
  uint64_t v16 = [v10 allObjects];
  [v7 insertObject:v16 atIndex:0];
  [a4 setObject:v8 forKey:v16];
  return v7;
}

uint64_t __65__KSKeyboardController_mergePreferences_inputModesToPreferences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ((unint64_t)[a2 count] > 3) {
    return 1;
  }
  id v7 = (void *)[MEMORY[0x263EFFA08] setWithArray:a2];
  int v8 = objc_msgSend(v7, "isEqualToSet:", objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", &unk_2703CE468));
  if (v8) {
    return v8 ^ 1u;
  }
  for (unint64_t i = a3 + 1; i < [*(id *)(a1 + 32) count]; ++i)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i)), "intersectsSet:", v7))return v8 ^ 1u; {
  }
    }
  return 0;
}

- (id)addAllPreferencesToArray:(id)a3 mapPreferenceToInputMode:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v16 = [a3 valueForKey:@"identifier"];
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = (void *)[MEMORY[0x263EFF9C0] set];
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeInputModes");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 normalizedIdentifier];
        uint64_t Variant = TIInputModeGetVariant();
        if (!Variant) {
          uint64_t Variant = TIInputModeGetBaseLanguage();
        }
        if (![v5 member:Variant])
        {
          [v5 addObject:Variant];
          [v6 addObject:v13];
          [(KSKeyboardController *)self loadPreferenceForInputModeIdentifier:v13 keyboardInputMode:v12 addNewPreferencesToArray:a3 defaultPreferenceIdentifiers:v16 additionalPreferenceIdentifiers:v4 mapPreferenceToInputMode:a4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  return v6;
}

- (id)groupPreferences:(id)a3 forMapping:(id)a4 inputModes:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke;
        v32[3] = &unk_2653A9208;
        v32[4] = v13;
        long long v14 = (void *)[a4 keysOfEntriesPassingTest:v32];
        if ([v14 count])
        {
          uint64_t v15 = (void *)[v7 objectForKeyedSubscript:v14];
          if (!v15)
          {
            uint64_t v15 = (void *)[MEMORY[0x263EFF980] array];
            [v7 setObject:v15 forKey:v14];
          }
          [v15 addObject:v12];
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)[v7 allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        long long v21 = (void *)[v20 allObjects];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke_2;
        v27[3] = &unk_2653A9230;
        v27[4] = a5;
        uint64_t v22 = [v21 sortedArrayUsingComparator:v27];
        id v23 = (id)[v7 objectForKey:v20];
        [v7 removeObjectForKey:v20];
        [v7 setObject:v23 forKey:v22];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v17);
  }
  return v7;
}

uint64_t __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 containsObject:*(void *)(a1 + 32)];
}

int64_t __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[KSKeyboardController compareUsingOrderInArray:*(void *)(a1 + 32) withFirst:a2 second:a3];
}

- (id)sortPreferencesKeysByInputModeOrderAndCount:(id)a3 inputModes:(id)a4
{
  uint64_t v5 = (void *)[a3 allKeys];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __79__KSKeyboardController_sortPreferencesKeysByInputModeOrderAndCount_inputModes___block_invoke;
  v7[3] = &unk_2653A9258;
  v7[4] = a4;
  return (id)[v5 sortedArrayUsingComparator:v7];
}

int64_t __79__KSKeyboardController_sortPreferencesKeysByInputModeOrderAndCount_inputModes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = [a2 count];
  unint64_t v7 = [a3 count];
  if (v6 > v7) {
    return -1;
  }
  if (v6 < v7) {
    return 1;
  }
  unint64_t v9 = v7;
  int64_t result = 0;
  if (v6 && v6 == v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [a2 objectAtIndex:0];
    uint64_t v12 = [a3 objectAtIndex:0];
    return +[KSKeyboardController compareUsingOrderInArray:v10 withFirst:v11 second:v12];
  }
  return result;
}

+ (id)localizedListForInputModes:(id)a3 forDictation:(BOOL)a4 duplicatedBaseLanguages:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        if (([a5 containsObject:TIInputModeGetBaseLanguage()]
           && (id v14 = (id)TUIKeyboardDisplayNameFromIdentifier()) != 0
           || (id v14 = +[KSKeyboardController localizedDisplayNameForInputMode:forDictation:](KSKeyboardController, "localizedDisplayNameForInputMode:forDictation:", v13, v6)) != 0)&& ([v8 containsObject:v14] & 1) == 0)
        {
          [v8 addObject:v14];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  return (id)[MEMORY[0x263F08950] localizedStringByJoiningStrings:v8];
}

- (id)loadAllKeyboardPreferences
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(KSKeyboardController *)self loadSpecifiersFromPlistName:@"Preferences_base" target:self];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(KSKeyboardController *)self addAllPreferencesToArray:v4 mapPreferenceToInputMode:v5];
  id v7 = [(KSKeyboardController *)self groupPreferences:v4 forMapping:v5 inputModes:v6];
  if (!objc_msgSend((id)objc_msgSend(v7, "allKeys"), "count")) {
    return 0;
  }
  id v8 = [(KSKeyboardController *)self sortPreferencesKeysByInputModeOrderAndCount:v7 inputModes:v6];
  if (![v8 count]) {
    -[KSKeyboardController loadAllKeyboardPreferences]();
  }
  id v9 = [(KSKeyboardController *)self mergePreferences:v8 inputModesToPreferences:v7];
  if (![v9 count]) {
    -[KSKeyboardController loadAllKeyboardPreferences]();
  }
  uint64_t v24 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v22 = [v8 count];
  uint64_t v21 = [v9 count];
  unint64_t v10 = [v6 count];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v26;
    obuint64_t j = v9;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v17 = (void *)[v7 objectForKey:v16];
        if (![v17 count]) {
          -[KSKeyboardController loadAllKeyboardPreferences]();
        }
        if (v10 >= 2)
        {
          if (v13)
          {
            id v18 = +[KSKeyboardController localizedListForInputModes:v16 forDictation:0 duplicatedBaseLanguages:0];
            goto LABEL_17;
          }
          if (v22 == v21)
          {
            id v18 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"All Keyboards", &stru_2703C6C20, @"Keyboard");
LABEL_17:
            id v19 = v18;
          }
          else
          {
            id v19 = 0;
          }
          char v13 = 1;
          goto LABEL_20;
        }
        id v19 = 0;
LABEL_20:
        +[KSKeyboardController localizeAndSortPreferencesArray:v17];
        objc_msgSend(v17, "insertObject:atIndex:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithID:name:", @"KEYBOARD_TITLE", v19), 0);
        if ([v16 count] == 1)
        {
          [v16 firstObject];
          if ([(id)TIInputModeGetVariant() isEqualToString:@"Pinyin"])
          {
            [(KSKeyboardController *)self removeShuangpinPreferenceIfNotApplicableForGroup:v17];
            [(KSKeyboardController *)self removeDialectPreferenceIfNotApplicableForGroup:v17];
            [(KSKeyboardController *)self moveSpaceConfirmationPreferenceToEndAndAddFooterTextForGroup:v17];
          }
        }
        [(KSKeyboardController *)self addFooterTextForDialectSpecifierForGroup:v17];
        [(KSKeyboardController *)self disableLockedDownPreferencesForGroup:v17];
        [(KSKeyboardController *)self movePeriodShortcutPreferenceToEndAndAddFooterTextForGroup:v17];
        [(KSKeyboardController *)self moveEnableDictationPreferenceToEndAndAddFooterTextForGroup:v17];
        [v24 addObjectsFromArray:v17];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
  return v24;
}

- (void)addHardwareKeyboardAndShortcuts:(id)a3
{
  uint64_t v5 = [a3 specifierForID:@"KEYBOARDS"];
  if (v5 && GSEventIsHardwareKeyboardAttached()) {
    objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController hardwareKeyboardSpecifier](self, "hardwareKeyboardSpecifier"), v5);
  }
  uint64_t v6 = [a3 specifierForID:@"Hardware Keyboard"];
  id v7 = [(KSKeyboardController *)self openShortcutsSpecifiers];
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v5;
  }
  objc_msgSend(a3, "ps_insertObjectsFromArray:afterObject:", v7, v8);
  uint64_t v9 = [(NSArray *)v7 lastObject];
  if (v9) {
    uint64_t v5 = v9;
  }
  if ([(KSKeyboardController *)self _supportsReachableKeyboard])
  {
    id v10 = [(KSKeyboardController *)self reachableKeyboardSpecifier];
    objc_msgSend(a3, "ps_insertObject:afterObject:", v10, v5);
    uint64_t v5 = (uint64_t)v10;
  }
  if ([(KSKeyboardController *)self _supportsProKeyboard])
  {
    id v11 = [(KSKeyboardController *)self proKeyboardSpecifier];
    objc_msgSend(a3, "ps_insertObject:afterObject:", v11, v5);
  }
}

- (void)addDictationItems:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers");
  uint64_t v6 = [a3 specifierForID:@"Dictation"];
  if ([v5 count] == 1)
  {
    id v7 = (void *)[MEMORY[0x263F7E570] sharedInputModeController];
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = objc_msgSend(v7, "defaultDictationLanguagesForKeyboardLanguage:", objc_msgSend(v5, "firstObject"));
    }
  }
  if ((unint64_t)[v5 count] < 2)
  {
    [(KSKeyboardController *)self setDictationLanguageSpecifier:0];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F5FC40];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Dictation Languages", &stru_2703C6C20, @"Dictation");
    -[KSKeyboardController setDictationLanguageSpecifier:](self, "setDictationLanguageSpecifier:", [v8 preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0]);
    id v10 = [(KSKeyboardController *)self dictationLanguageSpecifier];
    [(PSSpecifier *)v10 setProperty:@"DictationSettings" forKey:*MEMORY[0x263F60138]];
    if (v6 && DictationIsEnabled()) {
      objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"), v6);
    }
  }
  if (_os_feature_enabled_impl())
  {
    -[KSKeyboardController setDictationAutoPunctuationSpecifier:](self, "setDictationAutoPunctuationSpecifier:", objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Auto-Punctuation", &stru_2703C6C20, @"Dictation"), self, sel_setAutoPunctuation_specifier_, sel_autoPunctuation_, 0, 6, 0));
    id v11 = [(KSKeyboardController *)self dictationAutoPunctuationSpecifier];
    [(PSSpecifier *)v11 setProperty:@"AutoPunctuationSetting" forKey:*MEMORY[0x263F60138]];
    if (+[DictationFooterView dictationAutoPunctuationText])
    {
      objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier"), v6);
    }
  }
  if (v6 && DictationIsEnabled() && GSEventIsHardwareKeyboardAttached())
  {
    [(KSKeyboardController *)self setDictationHardwareShortcutSpecifier:[(KSKeyboardController *)self dictationHWShortcutSpecifier]];
    if ([(KSKeyboardController *)self dictationLanguageSpecifier])
    {
      uint64_t v12 = [(KSKeyboardController *)self dictationHardwareShortcutSpecifier];
      char v13 = [(KSKeyboardController *)self dictationLanguageSpecifier];
      id v14 = a3;
      uint64_t v15 = v12;
    }
    else
    {
      long long v16 = [(KSKeyboardController *)self dictationAutoPunctuationSpecifier];
      long long v17 = [(KSKeyboardController *)self dictationHardwareShortcutSpecifier];
      if (v16)
      {
        char v13 = [(KSKeyboardController *)self dictationAutoPunctuationSpecifier];
        id v14 = a3;
        uint64_t v15 = v17;
      }
      else
      {
        id v14 = a3;
        uint64_t v15 = v17;
        char v13 = (PSSpecifier *)v6;
      }
    }
    objc_msgSend(v14, "ps_insertObject:afterObject:", v15, v13);
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    uint64_t v4 = [(KSKeyboardController *)self loadSpecifiersFromPlistName:@"Preferences" target:self];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = [(KSKeyboardController *)self loadAllKeyboardPreferences];
      if (v6) {
        [v5 addObjectsFromArray:v6];
      }
      if ((MGGetBoolAnswer() & 1) == 0
        && !CFPreferencesGetAppBooleanValue(@"force-international", @"com.apple.keyboard.preferences", 0))
      {
        objc_msgSend(v5, "removeObject:", objc_msgSend(v5, "specifierForID:", @"KEYBOARDS"));
      }
      [(KSKeyboardController *)self addHardwareKeyboardAndShortcuts:v5];
      [(KSKeyboardController *)self addEnabledExtensionSpecifiersToArray:v5];
      [(KSKeyboardController *)self addFooterTextForStickers:v5];
      [(KSKeyboardController *)self addDictationItems:v5];
      -[KSKeyboardController setDeleteWordSpecifier:](self, "setDeleteWordSpecifier:", [v5 specifierForID:@"KeyboardContinuousPathDeleteWholeWord"]);
      uint64_t v7 = [v5 specifierForID:@"KeyboardContinuousPathEnabled"];
      if (!v7
        || (objc_msgSend(-[KSKeyboardController readCPPreferenceValue:](self, "readCPPreferenceValue:", v7), "BOOLValue") & 1) == 0)
      {
        -[KSKeyboardController setDeleteWordSpecifierIndex:](self, "setDeleteWordSpecifierIndex:", objc_msgSend(v5, "indexOfObject:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier")));
        objc_msgSend(v5, "removeObject:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier"));
      }
      -[KSKeyboardController setInlineCompletionSpecifier:](self, "setInlineCompletionSpecifier:", [v5 specifierForID:@"KeyboardInlineCompletion"]);
      uint64_t v8 = [v5 specifierForID:@"KeyboardPrediction"];
      if (!v8
        || (objc_msgSend(-[KSKeyboardController readPredictionPreferenceValue:](self, "readPredictionPreferenceValue:", v8), "BOOLValue") & 1) == 0)
      {
        -[KSKeyboardController setInlineCompletionSpecifierIndex:](self, "setInlineCompletionSpecifierIndex:", objc_msgSend(v5, "indexOfObject:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier")));
        objc_msgSend(v5, "removeObject:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier"));
      }
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
      -[KSKeyboardController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARDS", &stru_2703C6C20, @"Keyboard"));
      [(KSKeyboardController *)self setSpecifierID:@"Keyboard"];
      self->_needsReloadSpecifiers = 0;
    }
  }
  return *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
}

- (void)addFooterTextForStickers:(id)a3
{
  [MEMORY[0x263EFF980] array];
  uint64_t v4 = [a3 specifierForID:@"ShowStickers"];
  uint64_t v5 = [a3 indexOfSpecifierWithID:@"ShowStickers"];
  if (v4 && v5 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    uint64_t v6 = [a3 objectAtIndex:v5 - 1];
    uint64_t v7 = (void *)[MEMORY[0x263F5FC40] specifierWithSpecifier:v6];
    objc_msgSend(v7, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SHOW_STICKERS_DESCRIPTION", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F600F8]);
    objc_msgSend(a3, "ps_insertObject:afterObject:", v7, v6);
    [a3 removeObject:v6];
  }
}

- (void)addEnabledExtensionSpecifiersToArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController", 0), "activeInputModes");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(a3, "addObjectsFromArray:", +[KSAddExtensionKeyboardController specifiersForExtensionInputMode:parentSpecifier:](KSAddExtensionKeyboardController, "specifiersForExtensionInputMode:parentSpecifier:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), -[KSKeyboardController specifier](self, "specifier")));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)autoPunctuation:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3), "dictationAutoPunctuationEnabled");
  return (id)[v3 numberWithBool:v4];
}

- (void)setAutoPunctuation:(id)a3 specifier:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3, a4);
  uint64_t v6 = [a3 BOOLValue];
  [v5 setDictationAutoPunctuationEnabled:v6];
}

- (id)hardwareKeyboardSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Hardware Keyboard", &stru_2703C6C20, @"Keyboard");
  uint64_t v5 = (void *)[v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v5 setProperty:@"Hardware Keyboard" forKey:*MEMORY[0x263F60138]];
  return v5;
}

- (id)dictationHWShortcutSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DICTATION_SHORTCUT", &stru_2703C6C20, @"Dictation");
  uint64_t v5 = (void *)[v3 preferenceSpecifierNamed:v4 target:self set:0 get:sel_dictationShortcutSubtitle_ detail:objc_opt_class() cell:2 edit:0];
  [v5 setProperty:@"DictationHWShortcut" forKey:*MEMORY[0x263F60138]];
  return v5;
}

- (void)dictationShortcutSubtitle:(id)a3
{
  id v5 = +[KSDictationShortcutController attributedTitleForDictationShortcutValue:](KSDictationShortcutController, "attributedTitleForDictationShortcutValue:", (int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController"), "valueForPreferenceKey:", @"HWKeyboardDictationShortcut"), "intValue"));
  uint64_t v6 = objc_msgSend((id)-[KSKeyboardController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", a3), "valueLabel");
  [v6 setAttributedText:v5];
}

- (void)hardwareKeyboardAvailabilityChanged
{
  if (GSEventIsHardwareKeyboardAttached())
  {
    if (![(KSKeyboardController *)self specifierForID:@"HardwareKeyboard"]) {
      [(KSKeyboardController *)self insertSpecifier:[(KSKeyboardController *)self hardwareKeyboardSpecifier] afterSpecifierID:@"KEYBOARDS" animated:1];
    }
    if (![(KSKeyboardController *)self dictationHardwareShortcutSpecifier]) {
      [(KSKeyboardController *)self setDictationHardwareShortcutSpecifier:[(KSKeyboardController *)self dictationHWShortcutSpecifier]];
    }
    uint64_t v3 = [(KSKeyboardController *)self specifierForID:@"Dictation"];
    if ([(KSKeyboardController *)self dictationLanguageSpecifier])
    {
      uint64_t v4 = [(KSKeyboardController *)self dictationLanguageSpecifier];
    }
    else
    {
      if (![(KSKeyboardController *)self dictationAutoPunctuationSpecifier])
      {
LABEL_15:
        uint64_t v6 = [(KSKeyboardController *)self dictationHardwareShortcutSpecifier];
        [(KSKeyboardController *)self insertSpecifier:v6 afterSpecifier:v3 animated:1];
        return;
      }
      uint64_t v4 = [(KSKeyboardController *)self dictationAutoPunctuationSpecifier];
    }
    uint64_t v3 = (uint64_t)v4;
    goto LABEL_15;
  }
  [(KSKeyboardController *)self removeSpecifierID:@"HardwareKeyboard" animated:1];
  if ([(KSKeyboardController *)self dictationHardwareShortcutSpecifier])
  {
    id v5 = [(KSKeyboardController *)self dictationHardwareShortcutSpecifier];
    [(KSKeyboardController *)self removeSpecifier:v5 animated:1];
  }
}

- (BOOL)_supportsReachableKeyboard
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "_referenceBounds");
  return (v2 > 320.0) & ~objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "sf_isiPad");
}

- (id)getReachableKeybordSetting:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController", a3), "handBias");
  return (id)[v3 numberWithInteger:v4];
}

- (void)setReachableKeyboardSetting:(id)a3 specifier:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController", a3, a4);
  uint64_t v6 = [a3 integerValue];
  [v5 setHandBias:v6];
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)KSKeyboardController;
  id v4 = -[KSKeyboardController selectSpecifier:](&v6, sel_selectSpecifier_);
  +[KSKeyboardController emitNavigationEventForSpecifier:a3 viewController:v4];
  return v4;
}

- (id)reachableKeyboardSpecifier
{
  v7[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REACHABLE_KEYBOARD", &stru_2703C6C20, @"Keyboard");
  id v5 = (void *)[v3 preferenceSpecifierNamed:v4 target:self set:sel_setReachableKeyboardSetting_specifier_ get:sel_getReachableKeybordSetting_ detail:objc_opt_class() cell:2 edit:0];
  [v5 setProperty:@"ReachableKeyboard" forKey:*MEMORY[0x263F60138]];
  objc_msgSend(v5, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REACHABLE_EXPLANATION", &stru_2703C6C20, @"Keyboard"), *MEMORY[0x263F60280]);
  v7[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REACHABLE_OPTION_NONE", &stru_2703C6C20, @"Keyboard");
  v7[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REACHABLE_OPTION_LEFT", &stru_2703C6C20, @"Keyboard");
  void v7[2] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REACHABLE_OPTION_RIGHT", &stru_2703C6C20, @"Keyboard");
  objc_msgSend(v5, "setValues:titles:", &unk_2703CE480, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 3));
  return v5;
}

- (BOOL)_supportsProKeyboard
{
  if (TIGetToggleFourOrFiveRowKeyboardValue_onceToken != -1) {
    dispatch_once(&TIGetToggleFourOrFiveRowKeyboardValue_onceToken, &__block_literal_global_741);
  }
  int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController"), "valueForPreferenceKey:", @"ToggleFourOrFiveRowKeyboard"), "BOOLValue");
  if (v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F1C5C0] currentDevice];
    LOBYTE(v2) = objc_msgSend(v3, "sf_isiPad");
  }
  return v2;
}

- (id)getProKeyboardSetting:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return (id)MEMORY[0x263EFFA80];
  }
  uint64_t v4 = NSNumber;
  uint64_t v5 = [v3 enableProKeyboard];
  return (id)[v4 numberWithBool:v5];
}

- (void)setProKeyboardSetting:(id)a3 specifier:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController", a3, a4);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [a3 BOOLValue];
    [v5 setEnableProKeyboard:v6];
  }
}

- (id)proKeyboardSpecifier
{
  return (id)objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PRO_KEYBOARD", &stru_2703C6C20, @"Keyboard"), self, sel_setProKeyboardSetting_specifier_, sel_getProKeyboardSetting_, 0, 6, 0);
}

- (NSArray)openShortcutsSpecifiers
{
  if (self->_openShortcutsSpecifiers
    || (uint64_t v3 = (void *)MEMORY[0x263F5FC40],
        uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"USER_DICTIONARY", &stru_2703C6C20, @"Keyboard"), v5 = objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 2, 0), objc_msgSend(v5, "setProperty:forKey:", @"USER_DICTIONARY", *MEMORY[0x263F60138]), v6 = objc_alloc(MEMORY[0x263EFF8C0]), result = (NSArray *)objc_msgSend(v6,
                              "initWithObjects:",
                              [MEMORY[0x263F5FC40] groupSpecifierWithName:&stru_2703C6C20],
                              v5,
                              0),
        (self->_openShortcutsSpecifiers = result) != 0))
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection"), "isKeyboardShortcutsAllowed");
    id v9 = [(NSArray *)self->_openShortcutsSpecifiers lastObject];
    uint64_t v10 = [NSNumber numberWithBool:v8];
    [v9 setProperty:v10 forKey:*MEMORY[0x263F600A8]];
    return self->_openShortcutsSpecifiers;
  }
  return result;
}

- (NSDictionary)offlineStatusForLanguage
{
  return self->_offlineStatusForLanguage;
}

- (void)setOfflineStatusForLanguage:(id)a3
{
}

- (KSUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (BOOL)needsReloadSpecifiers
{
  return self->_needsReloadSpecifiers;
}

- (void)setNeedsReloadSpecifiers:(BOOL)a3
{
  self->_needsReloadSpecifiers = a3;
}

- (PSSpecifier)dictationLanguageSpecifier
{
  return self->_dictationLanguageSpecifier;
}

- (void)setDictationLanguageSpecifier:(id)a3
{
}

- (PSSpecifier)dictationAutoPunctuationSpecifier
{
  return self->_dictationAutoPunctuationSpecifier;
}

- (void)setDictationAutoPunctuationSpecifier:(id)a3
{
}

- (PSSpecifier)dictationHardwareShortcutSpecifier
{
  return self->_dictationHardwareShortcutSpecifier;
}

- (void)setDictationHardwareShortcutSpecifier:(id)a3
{
}

- (PSSpecifier)deleteWordSpecifier
{
  return self->_deleteWordSpecifier;
}

- (void)setDeleteWordSpecifier:(id)a3
{
}

- (PSSpecifier)inlineCompletionSpecifier
{
  return self->_inlineCompletionSpecifier;
}

- (void)setInlineCompletionSpecifier:(id)a3
{
}

- (unint64_t)deleteWordSpecifierIndex
{
  return self->_deleteWordSpecifierIndex;
}

- (void)setDeleteWordSpecifierIndex:(unint64_t)a3
{
  self->_deleteWordSpecifierIndex = a3;
}

- (unint64_t)inlineCompletionSpecifierIndex
{
  return self->_inlineCompletionSpecifierIndex;
}

- (void)setInlineCompletionSpecifierIndex:(unint64_t)a3
{
  self->_inlineCompletionSpecifierIndex = a3;
}

- (KSDictationOfflineStatusObserver)dictationOfflineStatusObserver
{
  return self->_dictationOfflineStatusObserver;
}

- (void)setDictationOfflineStatusObserver:(id)a3
{
}

- (void)init
{
  dlerror();
  uint64_t v0 = abort_report_np();
  -[KSKeyboardController readAutocorrectionPreferenceValue:](v0);
}

- (void)readAutocorrectionPreferenceValue:.cold.1()
{
}

- (void)readPredictionPreferenceValue:.cold.1()
{
}

- (void)readKeyboardInlineCompletionPreferenceValue:.cold.1()
{
}

- (void)readKeyboardMathExpressionCompletionPreferenceValue:.cold.1()
{
}

- (void)readKeyboardAllowPaddlePreferenceValue:.cold.1()
{
}

- (void)readCheckSpellingPreferenceValue:.cold.1()
{
}

- (void)readCPPreferenceValue:.cold.1()
{
}

- (void)readCPDeleteWordPreferenceValue:.cold.1()
{
}

- (void)setAutocorrectionPreferenceValue:forSpecifier:.cold.1()
{
}

- (void)feedbackFeatureEnabled
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)buf = 138412290;
  uint64_t v4 = [NSString stringWithFormat:@"%s Feedback %@: RC_SEED_BUILD: 0 enabled: %d", "-[KSKeyboardController feedbackFeatureEnabled]", @"KeyboardAutocorrection", a1 & 1];
  _os_log_debug_impl(&dword_2543D2000, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

- (void)setPredictionPreferenceValue:forSpecifier:.cold.1()
{
}

- (void)setKeyboardAllowPaddlePreferenceValue:forSpecifier:.cold.1()
{
}

- (void)setCheckSpellingPreferenceValue:forSpecifier:.cold.1()
{
}

- (void)readSmartTypingPreferenceValue:.cold.1()
{
}

- (void)setSmartTypingPreferenceValue:forSpecifier:.cold.1()
{
}

- (void)shuangpinType:.cold.1()
{
}

- (void)setShuangpinType:specifier:.cold.1()
{
}

- (void)pinyinDialect:.cold.1()
{
}

- (void)setPinyinDialect:specifier:.cold.1()
{
}

- (void)wubiStandard:.cold.1()
{
}

- (void)setWubiStandard:specifier:.cold.1()
{
}

- (void)smartFullwidthSpace:.cold.1()
{
}

- (void)setSmartFullwidthSpace:specifier:.cold.1()
{
}

+ (void)localizedDisplayNameForInputMode:forDictation:.cold.1()
{
}

- (void)loadAllKeyboardPreferences
{
}

@end
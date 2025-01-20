@interface PKTextInputLanguageSelectionController
+ (BOOL)hasSomeSupportedAndEnabledLocale;
+ (NSArray)_inputModesForTesting;
+ (NSArray)_preferencesLanguagesForTesting;
+ (NSArray)_preferredLanguagesForTesting;
+ (id)_currentLanguageIdentifiersForEmojiAlternatives;
+ (id)_filterEnglishWithLanguages:(id)a3 outRemapTarget:(id *)a4;
+ (id)_preferredRecognitionLocaleIdentifierFromIdentifiers:(id)a3;
+ (id)_sortedStringsArray:(id)a3 withArray:(id)a4;
+ (id)activeInputModes;
+ (id)filteredEnabledLocaleIdentifiers;
+ (id)sharedInstance;
+ (id)supportedAndEnabledLocaleIdentifiers;
+ (void)_enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:(id)a3;
+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputMode:(id)a5;
+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputMode:(id)a5 mappingYueToZh:(BOOL)a6;
+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputModeIdentifier:(id)a5;
+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputModeIdentifier:(id)a5 mappingYueToZh:(BOOL)a6;
+ (void)_performOperations:(id)a3 withActiveInputModeIdentifiers:(id)a4 preferencesLanguages:(id)a5 preferredLanguages:(id)a6;
+ (void)_performOperations:(id)a3 withActiveInputModes:(id)a4 preferencesLanguages:(id)a5 preferredLanguages:(id)a6;
+ (void)set_inputModesForTesting:(id)a3;
+ (void)set_preferencesLanguagesForTesting:(id)a3;
+ (void)set_preferredLanguagesForTesting:(id)a3;
- (BOOL)shouldIdentifyLanguages;
- (NSArray)_cachedLanguageIdentifiers;
- (NSArray)_cachedLanguageIdentifiersForEmojiAlternatives;
- (NSArray)currentLanguageIdentifiers;
- (NSArray)currentLanguageIdentifiersForEmojiAlternatives;
- (PKTextInputLanguageSelectionController)init;
- (UIImage)languageIdentificationIcon;
- (UIMenu)languageSelectionMenu;
- (id)_currentKeyboardIdentifier;
- (id)_enabledLanguagesByPreference;
- (id)_iconForLanguageIdentifier:(id)a3;
- (id)registerObserver:(id)a3;
- (void)_clearCachesAndUpdateIconObservers;
- (void)_handleKeyboardCurrentInputModeChanged:(id)a3;
- (void)_notifyLanguageSelectionDidChange;
- (void)_pencilPreferencesChangedCallback:(id)a3;
- (void)_switchToLanguageIfSupported:(id)a3;
- (void)_updateLanguageMenuIfNecessary;
- (void)_updateSelectedLanguageInCachedMenu;
- (void)_updateWithLanguageIdentifiers:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)ensureKeyboardLanguageConsistencyIfNeeded;
- (void)notifyLanguageDidChange;
- (void)removeObserver:(id)a3;
- (void)set_cachedLanguageIdentifiers:(id)a3;
- (void)set_cachedLanguageIdentifiersForEmojiAlternatives:(id)a3;
@end

@implementation PKTextInputLanguageSelectionController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKTextInputLanguageSelectionController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB3C5EB8 != -1) {
    dispatch_once(&qword_1EB3C5EB8, block);
  }
  v2 = (void *)_MergedGlobals_122;

  return v2;
}

void __56__PKTextInputLanguageSelectionController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_122;
  _MergedGlobals_122 = (uint64_t)v1;
}

- (PKTextInputLanguageSelectionController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKTextInputLanguageSelectionController;
  v2 = [(PKTextInputLanguageSelectionController *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleKeyboardPreferencesChanged_ name:*MEMORY[0x1E4FB2C18] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleKeyboardCurrentInputModeChanged_ name:*MEMORY[0x1E4FB3028] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)NotificationCallback, @"com.apple.PencilKit", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    languageSelectionControllerObservers = v2->_languageSelectionControllerObservers;
    v2->_languageSelectionControllerObservers = (NSHashTable *)v8;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C18] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB3028] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.PencilKit", 0);
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputLanguageSelectionController;
  [(PKTextInputLanguageSelectionController *)&v6 dealloc];
}

- (void)addObserver:(id)a3
{
}

- (void)_pencilPreferencesChangedCallback:(id)a3
{
  v4 = [(PKTextInputLanguageSelectionController *)self _cachedLanguageIdentifiers];

  if (!v4) {
    return;
  }
  v5 = [(PKTextInputLanguageSelectionController *)self _enabledLanguagesByPreference];
  unint64_t v6 = [(PKTextInputLanguageSelectionController *)self _cachedLanguageIdentifiers];
  unint64_t v7 = v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    if (v7 && v6)
    {
      char v8 = [(id)v6 isEqual:v7];

      unint64_t v7 = (unint64_t)v9;
      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [(PKTextInputLanguageSelectionController *)self _clearCachesAndUpdateIconObservers];
    [(PKTextInputLanguageSelectionController *)self _notifyLanguageSelectionDidChange];
    unint64_t v7 = (unint64_t)v9;
  }
LABEL_10:
}

- (void)_handleKeyboardCurrentInputModeChanged:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4FB1910], "sharedInputModeController", a3);
  v5 = [v4 additionalTextInputLocales];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    cachedLanguageMenu = self->_cachedLanguageMenu;
    self->_cachedLanguageMenu = 0;

    [(PKTextInputLanguageSelectionController *)self set_cachedLanguageIdentifiers:0];
    [(PKTextInputLanguageSelectionController *)self set_cachedLanguageIdentifiersForEmojiAlternatives:0];
  }
}

- (void)_clearCachesAndUpdateIconObservers
{
  cachedLanguageMenu = self->_cachedLanguageMenu;
  self->_cachedLanguageMenu = 0;

  [(PKTextInputLanguageSelectionController *)self set_cachedLanguageIdentifiers:0];
  [(PKTextInputLanguageSelectionController *)self set_cachedLanguageIdentifiersForEmojiAlternatives:0];

  [(PKTextInputLanguageSelectionController *)self notifyLanguageDidChange];
}

- (id)_enabledLanguagesByPreference
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
  uint64_t v3 = [v2 objectForKey:@"CurrentScribbleLanguages"];
  v4 = (void *)[v3 copy];

  v5 = +[PKTextInputLanguageSelectionController _preferencesLanguagesForTesting];
  if (v5)
  {
    uint64_t v6 = +[PKTextInputLanguageSelectionController _preferencesLanguagesForTesting];

    v4 = (void *)v6;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  id v9 = v7;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v9 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    id v9 = v7;
  }
LABEL_13:

  objc_msgSend((id)objc_opt_class(), "filteredEnabledLocaleIdentifiers", v19);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  v15 = [v14 additionalTextInputLocales];
  uint64_t v16 = [v15 count];

  v17 = v13;
  if (!v16)
  {
    v17 = [(id)objc_opt_class() _sortedStringsArray:v13 withArray:v9];
  }

  return v17;
}

- (void)_switchToLanguageIfSupported:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() supportedAndEnabledLocaleIdentifiers];
  id v17 = 0;
  uint64_t v6 = [(id)objc_opt_class() _filterEnglishWithLanguages:v5 outRemapTarget:&v17];
  id v7 = v17;
  if ([v6 containsObject:v4])
  {
    id v8 = v4;
LABEL_8:
    uint64_t v10 = [(PKTextInputLanguageSelectionController *)self currentLanguageIdentifiers];
    uint64_t v11 = [v10 firstObject];
    char v12 = [v11 isEqualToString:v8];

    if ((v12 & 1) == 0)
    {
      id v13 = [v10 mutableCopy];
      [v13 removeObject:v8];
      [v13 insertObject:v8 atIndex:0];
      v14 = [(id)objc_opt_class() _sortedStringsArray:v5 withArray:v13];
      [(PKTextInputLanguageSelectionController *)self _updateWithLanguageIdentifiers:v14];
      [(PKTextInputLanguageSelectionController *)self notifyLanguageDidChange];
      v15 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v14 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        id v19 = v16;
        _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "LanguageController: Saving languages in preferences: %@", buf, 0xCu);
      }
      +[PKSettingsDaemon setCurrentScribbleLanguageIdentifiers:v14];
    }
    goto LABEL_15;
  }
  if (v7 && [v5 containsObject:v4])
  {
    id v8 = v7;

    id v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "LanguageController: Switching to remapped language: %@", buf, 0xCu);
    }

    goto LABEL_8;
  }
  uint64_t v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "LanguageController: Rejected switching to unsupported language: %@", buf, 0xCu);
  }
  id v8 = v4;
LABEL_15:
}

- (void)_updateWithLanguageIdentifiers:(id)a3
{
  [(PKTextInputLanguageSelectionController *)self set_cachedLanguageIdentifiers:a3];
  if (self->_cachedLanguageMenu)
  {
    [(PKTextInputLanguageSelectionController *)self _updateSelectedLanguageInCachedMenu];
  }
}

- (NSArray)currentLanguageIdentifiers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKTextInputLanguageSelectionController *)self _cachedLanguageIdentifiers];

  if (!v3)
  {
    id v4 = [(PKTextInputLanguageSelectionController *)self _enabledLanguagesByPreference];
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 componentsJoinedByString:@", "];
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "LanguageController: Loading preferences. Languages: %@", (uint8_t *)&v9, 0xCu);
    }
    [(PKTextInputLanguageSelectionController *)self _updateWithLanguageIdentifiers:v4];
  }
  id v7 = [(PKTextInputLanguageSelectionController *)self _cachedLanguageIdentifiers];

  return (NSArray *)v7;
}

- (BOOL)shouldIdentifyLanguages
{
  v2 = [(PKTextInputLanguageSelectionController *)self currentLanguageIdentifiers];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (UIImage)languageIdentificationIcon
{
  BOOL v3 = [(PKTextInputLanguageSelectionController *)self currentLanguageIdentifiers];
  id v4 = [v3 firstObject];

  if (v4)
  {
    v5 = [(PKTextInputLanguageSelectionController *)self _iconForLanguageIdentifier:v4];
  }
  else
  {
    v5 = 0;
  }

  return (UIImage *)v5;
}

- (id)_iconForLanguageIdentifier:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1910];
  id v4 = a3;
  v5 = [v3 sharedInputModeController];
  uint64_t v6 = [v5 inputModeWithIdentifier:v4];

  id v7 = [v6 indicatorTextIcon];

  return v7;
}

- (void)_updateLanguageMenuIfNecessary
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!self->_cachedLanguageMenu)
  {
    v2 = self;
    BOOL v3 = [(id)objc_opt_class() filteredEnabledLocaleIdentifiers];
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v3;
    uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v30)
    {
      uint64_t v5 = *(void *)v33;
      uint64_t v27 = *MEMORY[0x1E4FB24D0];
      uint64_t v28 = *(void *)v33;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v33 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * v6);
          id v8 = [MEMORY[0x1E4FB1910] sharedInputModeController];
          int v9 = [v8 inputModeWithIdentifier:v7];

          uint64_t v10 = [v9 indicatorIcon];
          uint64_t v11 = [v9 extendedDisplayName];
          if (v11)
          {
            char v12 = (void *)v11;
            id v13 = [v9 languageWithRegion];

            if (v13)
            {
              id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
              v15 = [v9 extendedDisplayName];
              uint64_t v36 = v27;
              [v9 languageWithRegion];
              uint64_t v16 = v4;
              v18 = id v17 = v2;
              v37 = v18;
              id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
              uint64_t v20 = (void *)[v14 initWithString:v15 attributes:v19];
              [v10 setAccessibilityAttributedLabel:v20];

              v2 = v17;
              id v4 = v16;
              uint64_t v5 = v28;
            }
          }
          long long v21 = (void *)MEMORY[0x1E4FB13F0];
          long long v22 = [v9 extendedDisplayName];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __72__PKTextInputLanguageSelectionController__updateLanguageMenuIfNecessary__block_invoke;
          v31[3] = &unk_1E64C6E08;
          v31[4] = v7;
          v31[5] = v2;
          v23 = [v21 actionWithTitle:v22 image:v10 identifier:v7 handler:v31];

          uint64_t v24 = [v9 languageWithRegion];
          [v23 setAccessibilityLanguage:v24];

          [v4 addObject:v23];
          ++v6;
        }
        while (v30 != v6);
        uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v30);
    }

    uint64_t v25 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v4];
    cachedLanguageMenu = v2->_cachedLanguageMenu;
    v2->_cachedLanguageMenu = (UIMenu *)v25;
  }
}

uint64_t __72__PKTextInputLanguageSelectionController__updateLanguageMenuIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "LanguageController: Switcher menu selected %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) _switchToLanguageIfSupported:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _notifyLanguageSelectionDidChange];
}

- (void)_notifyLanguageSelectionDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSHashTable *)self->_languageSelectionControllerObservers copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "textInputLanguageSelectionControllerDidChangeLanguage:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateSelectedLanguageInCachedMenu
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_cachedLanguageMenu)
  {
    uint64_t v3 = [(PKTextInputLanguageSelectionController *)self currentLanguageIdentifiers];
    id v4 = [v3 firstObject];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(UIMenu *)self->_cachedLanguageMenu children];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v11 = [v10 identifier];
          unsigned int v12 = [v11 isEqualToString:v4];

          [v10 setState:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    id v13 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v14 = [(UIMenu *)self->_cachedLanguageMenu children];
    v15 = [v13 menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v14];
    cachedLanguageMenu = self->_cachedLanguageMenu;
    self->_cachedLanguageMenu = v15;
  }
}

- (id)registerObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PKTextInputLanguageSelectionToken tokenWithStore:self];
  observers = self->_observers;
  uint64_t v7 = (void *)[v4 copy];
  [(NSMutableDictionary *)observers setObject:v7 forKey:v5];

  if ([(PKTextInputLanguageSelectionController *)self shouldIdentifyLanguages])
  {
    uint64_t v8 = [(PKTextInputLanguageSelectionController *)self languageIdentificationIcon];
    long long v9 = [(PKTextInputLanguageSelectionController *)self languageSelectionMenu];
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v8, v9);
  }

  return v5;
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyLanguageDidChange
{
  if ([(NSMutableDictionary *)self->_observers count])
  {
    if ([(PKTextInputLanguageSelectionController *)self shouldIdentifyLanguages])
    {
      uint64_t v3 = [(PKTextInputLanguageSelectionController *)self languageIdentificationIcon];
    }
    else
    {
      uint64_t v3 = 0;
    }
    id v4 = [(PKTextInputLanguageSelectionController *)self languageSelectionMenu];
    observers = self->_observers;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PKTextInputLanguageSelectionController_notifyLanguageDidChange__block_invoke;
    v8[3] = &unk_1E64C6E30;
    id v9 = v3;
    id v10 = v4;
    id v6 = v4;
    id v7 = v3;
    [(NSMutableDictionary *)observers enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __65__PKTextInputLanguageSelectionController_notifyLanguageDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a3 + 16))(a3, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (UIMenu)languageSelectionMenu
{
  if ([(PKTextInputLanguageSelectionController *)self shouldIdentifyLanguages])
  {
    [(PKTextInputLanguageSelectionController *)self _updateLanguageMenuIfNecessary];
    [(PKTextInputLanguageSelectionController *)self _updateSelectedLanguageInCachedMenu];
    uint64_t v3 = self->_cachedLanguageMenu;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)ensureKeyboardLanguageConsistencyIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4FB18E0] hasInputOrAssistantViewsOnScreen])
  {
    uint64_t v3 = [(PKTextInputLanguageSelectionController *)self _currentKeyboardIdentifier];
    id v4 = [(PKTextInputLanguageSelectionController *)self currentLanguageIdentifiers];
    uint64_t v5 = [v4 firstObject];

    if (v3)
    {
      id v6 = v5;
      id v7 = v3;
      uint64_t v8 = v7;
      if (v6 != v7)
      {
        if (v6)
        {
          char v9 = [v6 isEqualToString:v7];

          if (v9) {
            goto LABEL_12;
          }
        }
        else
        {
        }
        id v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412290;
          unsigned int v12 = v8;
          _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "LanguageController: Propagating keyboard language to Scribble: %@", (uint8_t *)&v11, 0xCu);
        }

        [(PKTextInputLanguageSelectionController *)self _switchToLanguageIfSupported:v8];
        goto LABEL_12;
      }
    }
LABEL_12:
  }
}

- (id)_currentKeyboardIdentifier
{
  v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  uint64_t v3 = [v2 currentInputMode];

  id v6 = 0;
  [(id)objc_opt_class() _getNormalizedLanguageIdentifier:&v6 dedupLanguageKey:0 forInputMode:v3];
  id v4 = v6;

  return v4;
}

+ (id)activeInputModes
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  id v4 = [v3 activeInputModes];
  uint64_t v5 = [a1 _inputModesForTesting];

  if (v5)
  {
    uint64_t v6 = [a1 _inputModesForTesting];

    id v4 = (void *)v6;
  }
  id v7 = [v3 additionalTextInputLocales];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v10 = +[PKPaletteKeyboardUtilities textInputResponderForEditing];
    int v11 = [v3 textInputModeForResponder:v10];
    if (v11)
    {
      [v9 addObject:v11];
    }
    else
    {
      v26 = v10;
      unsigned int v12 = [v3 additionalTextInputLocales];
      uint64_t v13 = [v12 firstObject];
      uint64_t v14 = [v13 localeIdentifier];

      v15 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v16 = [v15 localeIdentifier];

      uint64_t v24 = (void *)v16;
      uint64_t v25 = (void *)v14;
      long long v17 = [MEMORY[0x1E4FAE2D8] _inputModesForLocale:v16 language:v14 modeFetcher:&__block_literal_global_22];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [MEMORY[0x1E4FB1908] keyboardInputModeWithIdentifier:*(void *)(*((void *)&v27 + 1) + 8 * i)];
            [v9 addObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v19);
      }

      id v10 = v26;
    }
    [v9 addObjectsFromArray:v4];
  }
  else
  {
    char v9 = v4;
  }

  return v9;
}

uint64_t __58__PKTextInputLanguageSelectionController_activeInputModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4163C18](a2);
}

+ (void)_enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (void (**)(id, id, unsigned char *))a3;
  id v4 = [a1 activeInputModes];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v18 = 0;
        id v19 = 0;
        [a1 _getNormalizedLanguageIdentifier:&v19 dedupLanguageKey:&v18 forInputMode:v11];
        id v12 = v19;
        id v13 = v18;
        if (v12 && ([v5 containsObject:v13] & 1) == 0)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v12];
          unsigned __int8 v17 = 0;
          if ([MEMORY[0x1E4F5C068] isLocaleSupported:v14])
          {
            [v5 addObject:v13];
            v16[2](v16, v12, &v17);
          }
          int v15 = v17;

          if (v15)
          {

            goto LABEL_15;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (NSArray)currentLanguageIdentifiersForEmojiAlternatives
{
  uint64_t v3 = [(PKTextInputLanguageSelectionController *)self _cachedLanguageIdentifiersForEmojiAlternatives];

  if (!v3)
  {
    id v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "LanguageController: Loading language identifiers for emoji alternatives.", v8, 2u);
    }

    uint64_t v5 = [(id)objc_opt_class() _currentLanguageIdentifiersForEmojiAlternatives];
    [(PKTextInputLanguageSelectionController *)self set_cachedLanguageIdentifiersForEmojiAlternatives:v5];
  }
  id v6 = [(PKTextInputLanguageSelectionController *)self _cachedLanguageIdentifiersForEmojiAlternatives];

  return (NSArray *)v6;
}

+ (id)_currentLanguageIdentifiersForEmojiAlternatives
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  id v4 = [v3 currentInputMode];
  v27[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

  id v6 = [a1 activeInputModes];
  uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v20 = 0;
        id v21 = 0;
        [a1 _getNormalizedLanguageIdentifier:&v21 dedupLanguageKey:&v20 forInputMode:v14 mappingYueToZh:0];
        id v15 = v21;
        id v16 = v20;
        if (v15 && ([v8 containsObject:v16] & 1) == 0)
        {
          unsigned __int8 v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v15];
          if ([MEMORY[0x1E4F5C068] isLocaleSupported:v17]) {
            [v8 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v18 = [v8 array];

  return v18;
}

+ (id)_filterEnglishWithLanguages:(id)a3 outRemapTarget:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v8 = [a1 _preferredLanguagesForTesting];

  if (v8)
  {
    uint64_t v9 = [a1 _preferredLanguagesForTesting];

    uint64_t v7 = (void *)v9;
  }
  uint64_t v10 = [v7 firstObject];
  id v38 = 0;
  [a1 _getNormalizedLanguageIdentifier:&v38 dedupLanguageKey:0 forInputModeIdentifier:v10];
  id v11 = v38;
  id v12 = v6;
  id v13 = MEMORY[0x1C8783A00](v11);
  int v14 = [v13 isEqualToString:@"zh"];

  id v15 = v12;
  if (v14)
  {
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__5;
    uint64_t v32 = __Block_byref_object_dispose__5;
    id v33 = 0;
    id v16 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    long long v23 = __85__PKTextInputLanguageSelectionController__filterEnglishWithLanguages_outRemapTarget___block_invoke;
    long long v24 = &unk_1E64C6E78;
    v26 = &v34;
    long long v27 = &v28;
    id v17 = v16;
    id v25 = v17;
    [v12 enumerateObjectsUsingBlock:&v21];
    id v15 = v12;
    if (*((unsigned char *)v35 + 24))
    {
      id v18 = objc_msgSend(v12, "mutableCopy", v21, v22, v23, v24);
      [v18 removeObjectsAtIndexes:v17];
      id v15 = (void *)[v18 copy];

      if (a4)
      {
        id v19 = [@"zh_" stringByAppendingString:v29[5]];
        [a1 _getNormalizedLanguageIdentifier:a4 dedupLanguageKey:0 forInputModeIdentifier:v19];
      }
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }

  return v15;
}

void __85__PKTextInputLanguageSelectionController__filterEnglishWithLanguages_outRemapTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v7 = MEMORY[0x1C8783A00]();
  if ([v7 isEqualToString:@"zh"])
  {
    uint64_t v8 = MEMORY[0x1C8783A10](v13);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v9 + 24)
      && (char v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:v8],
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8),
          (v10 & 1) == 0))
    {
      *(unsigned char *)(v9 + 24) = 0;
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;

      *a4 = 1;
    }
    else
    {
      *(unsigned char *)(v9 + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
    }
  }
  else if ([v7 isEqualToString:@"en"])
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

+ (id)filteredEnabledLocaleIdentifiers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKTextInputLanguageSelectionController_filteredEnabledLocaleIdentifiers__block_invoke;
  v7[3] = &unk_1E64C6EA0;
  id v8 = v3;
  id v4 = v3;
  [a1 _enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:v7];
  uint64_t v5 = [a1 _filterEnglishWithLanguages:v4 outRemapTarget:0];

  return v5;
}

uint64_t __74__PKTextInputLanguageSelectionController_filteredEnabledLocaleIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)supportedAndEnabledLocaleIdentifiers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PKTextInputLanguageSelectionController_supportedAndEnabledLocaleIdentifiers__block_invoke;
  v6[3] = &unk_1E64C6EA0;
  id v4 = v3;
  id v7 = v4;
  [a1 _enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:v6];

  return v4;
}

uint64_t __78__PKTextInputLanguageSelectionController_supportedAndEnabledLocaleIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (BOOL)hasSomeSupportedAndEnabledLocale
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__PKTextInputLanguageSelectionController_hasSomeSupportedAndEnabledLocale__block_invoke;
  v4[3] = &unk_1E64C6EC8;
  v4[4] = &v5;
  [a1 _enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __74__PKTextInputLanguageSelectionController_hasSomeSupportedAndEnabledLocale__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

+ (id)_preferredRecognitionLocaleIdentifierFromIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      char v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      uint64_t v9 = MEMORY[0x1C8783A00](v8);
      if (objc_msgSend(v9, "isEqualToString:", @"zh", (void)v12)) {
        break;
      }

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v8;

    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  objc_msgSend(v3, "firstObject", (void)v12);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v10;
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputMode:(id)a5
{
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputMode:(id)a5 mappingYueToZh:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = [a5 languageWithRegion];
  [a1 _getNormalizedLanguageIdentifier:a3 dedupLanguageKey:a4 forInputModeIdentifier:v10 mappingYueToZh:v6];
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputModeIdentifier:(id)a5
{
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputModeIdentifier:(id)a5 mappingYueToZh:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  MEMORY[0x1C8783A00]();
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1C8783A10](v9);

  if (v6 && [(__CFString *)v10 isEqualToString:@"yue"])
  {

    id v10 = @"zh";
  }
  if ([v11 length])
  {
    long long v12 = [NSString stringWithFormat:@"%@_%@", v10, v11];
  }
  else
  {
    long long v12 = v10;
  }
  long long v13 = v12;
  long long v15 = v10;
  if (([(__CFString *)v15 isEqualToString:@"zh"] & 1) != 0
    || (long long v14 = v15, !v6)
    && (long long v14 = v15, [(__CFString *)v15 isEqualToString:@"yue"]))
  {
    long long v14 = v13;
  }
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v14;
  }
}

+ (id)_sortedStringsArray:(id)a3 withArray:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKTextInputLanguageSelectionController__sortedStringsArray_withArray___block_invoke;
  v9[3] = &unk_1E64C6EF0;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = [a3 sortedArrayWithOptions:16 usingComparator:v9];

  return v7;
}

uint64_t __72__PKTextInputLanguageSelectionController__sortedStringsArray_withArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 indexOfObject:a2];
  uint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];

  if (v7 == v8) {
    return 0;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 > v8) {
    return 1;
  }
  uint64_t v12 = v8 == 0x7FFFFFFFFFFFFFFFLL || v7 < v8;
  return v12 << 63 >> 63;
}

+ (NSArray)_inputModesForTesting
{
  return (NSArray *)(id)__inputModesForTesting;
}

+ (void)set_inputModesForTesting:(id)a3
{
  objc_storeStrong((id *)&__inputModesForTesting, a3);
  id v4 = a3;
  id v5 = +[PKTextInputLanguageSelectionController sharedInstance];

  objc_msgSend(v5, "set_cachedLanguageIdentifiers:", 0);
}

+ (NSArray)_preferencesLanguagesForTesting
{
  return (NSArray *)(id)__preferencesLanguagesForTesting;
}

+ (void)set_preferencesLanguagesForTesting:(id)a3
{
  objc_storeStrong((id *)&__preferencesLanguagesForTesting, a3);
  id v4 = a3;
  id v5 = +[PKTextInputLanguageSelectionController sharedInstance];

  objc_msgSend(v5, "set_cachedLanguageIdentifiers:", 0);
}

+ (NSArray)_preferredLanguagesForTesting
{
  return (NSArray *)(id)__preferredLanguagesForTesting;
}

+ (void)set_preferredLanguagesForTesting:(id)a3
{
  objc_storeStrong((id *)&__preferredLanguagesForTesting, a3);
  id v4 = a3;
  id v5 = +[PKTextInputLanguageSelectionController sharedInstance];

  objc_msgSend(v5, "set_cachedLanguageIdentifiers:", 0);
}

+ (void)_performOperations:(id)a3 withActiveInputModeIdentifiers:(id)a4 preferencesLanguages:(id)a5 preferredLanguages:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [MEMORY[0x1E4FB1908] keyboardInputModeWithIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * v18)];
        if (v19) {
          [v13 addObject:v19];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  [a1 _performOperations:v9 withActiveInputModes:v13 preferencesLanguages:v11 preferredLanguages:v12];
}

+ (void)_performOperations:(id)a3 withActiveInputModes:(id)a4 preferencesLanguages:(id)a5 preferredLanguages:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = (void (**)(void))a3;
  objc_msgSend(a1, "set_inputModesForTesting:", a4);
  objc_msgSend(a1, "set_preferencesLanguagesForTesting:", v11);

  objc_msgSend(a1, "set_preferredLanguagesForTesting:", v10);
  v12[2](v12);

  objc_msgSend(a1, "set_inputModesForTesting:", 0);
  objc_msgSend(a1, "set_preferencesLanguagesForTesting:", 0);

  objc_msgSend(a1, "set_preferredLanguagesForTesting:", 0);
}

- (NSArray)_cachedLanguageIdentifiers
{
  return self->__cachedLanguageIdentifiers;
}

- (void)set_cachedLanguageIdentifiers:(id)a3
{
}

- (NSArray)_cachedLanguageIdentifiersForEmojiAlternatives
{
  return self->__cachedLanguageIdentifiersForEmojiAlternatives;
}

- (void)set_cachedLanguageIdentifiersForEmojiAlternatives:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLanguageIdentifiersForEmojiAlternatives, 0);
  objc_storeStrong((id *)&self->__cachedLanguageIdentifiers, 0);
  objc_storeStrong((id *)&self->_languageSelectionControllerObservers, 0);
  objc_storeStrong((id *)&self->_iconDisplayTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_cachedLanguageMenu, 0);
}

@end
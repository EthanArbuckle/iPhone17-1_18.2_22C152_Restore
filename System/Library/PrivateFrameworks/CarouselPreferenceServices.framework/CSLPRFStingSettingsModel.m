@interface CSLPRFStingSettingsModel
+ (BOOL)IsHermes;
+ (BOOL)activePairedWatchSupportsMoonstoneActions;
+ (id)actionNameForActionType:(unint64_t)a3;
+ (id)alternateActionNameForActionType:(unint64_t)a3;
+ (id)sfSymbolAssetNameForActionType:(unint64_t)a3;
- (BOOL)_lock_isLinkActionSupportedForIdentifier:(id)a3;
- (CSLPRFStingSettingsModel)init;
- (CSLPRFStingSettingsModelData)settingsData;
- (NSArray)defaultActionTypeItems;
- (NSDictionary)actionIdentifierToSupportedBundleIDsMap;
- (id)_buildActionIdentifierToSupportedBundleIDsMap:(id)a3;
- (id)_buildDefaultActionTypeItems;
- (id)_modelItemWithActionType:(unint64_t)a3;
- (id)accessibilityItems;
- (id)bundleIDsForActionType:(unint64_t)a3;
- (id)defaultQuickActionItems;
- (id)quickActionItems;
- (id)shortcutItems;
- (id)startWorkoutsListForBundleID:(id)a3;
- (void)_lock_rebuildModels;
- (void)_withLock:(id)a3;
- (void)rebuildModel;
- (void)setActionIdentifierToSupportedBundleIDsMap:(id)a3;
- (void)setDefaultActionTypeItems:(id)a3;
- (void)setSettingsData:(id)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFStingSettingsModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsData, 0);
  objc_storeStrong((id *)&self->_actionIdentifierToSupportedBundleIDsMap, 0);
  objc_storeStrong((id *)&self->_defaultActionTypeItems, 0);
  objc_storeStrong((id *)&self->_stingSystemSettings, 0);
}

- (void)setSettingsData:(id)a3
{
}

- (CSLPRFStingSettingsModelData)settingsData
{
  return self->_settingsData;
}

- (void)setActionIdentifierToSupportedBundleIDsMap:(id)a3
{
}

- (NSDictionary)actionIdentifierToSupportedBundleIDsMap
{
  return self->_actionIdentifierToSupportedBundleIDsMap;
}

- (void)setDefaultActionTypeItems:(id)a3
{
}

- (NSArray)defaultActionTypeItems
{
  return self->_defaultActionTypeItems;
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  v4 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22F4EA000, v4, OS_LOG_TYPE_DEFAULT, "supported sting action settings changed (StingSystemSettings), rebuilding model", v5, 2u);
  }

  [(CSLPRFStingSettingsModel *)self rebuildModel];
}

- (void)_lock_rebuildModels
{
  v3 = [(CSLPRFStingSystemSettings *)self->_stingSystemSettings read];
  settingsData = self->_settingsData;
  self->_settingsData = v3;

  id v7 = [(CSLPRFStingSettingsModelData *)self->_settingsData actionsDictionary];
  v5 = [(CSLPRFStingSettingsModel *)self _buildActionIdentifierToSupportedBundleIDsMap:v7];
  actionIdentifierToSupportedBundleIDsMap = self->_actionIdentifierToSupportedBundleIDsMap;
  self->_actionIdentifierToSupportedBundleIDsMap = v5;
}

- (void)rebuildModel
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__CSLPRFStingSettingsModel_rebuildModel__block_invoke;
  v4[3] = &unk_264A0BA38;
  v4[4] = self;
  [(CSLPRFStingSettingsModel *)self _withLock:v4];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"CSLPRFStingSettingsModelDidChangeNotification" object:self];
}

uint64_t __40__CSLPRFStingSettingsModel_rebuildModel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_rebuildModels");
}

- (BOOL)_lock_isLinkActionSupportedForIdentifier:(id)a3
{
  id v4 = a3;
  if (CSLIdentifierToLinkActionType(v4) == 2)
  {
    v5 = [(CSLPRFStingSettingsModelData *)self->_settingsData shortcutsDictionary];
  }
  else
  {
    if (CSLIdentifierToLinkActionType(v4) == 38) {
      [(CSLPRFStingSettingsModelData *)self->_settingsData accessibilityShortcutsArray];
    }
    else {
    v5 = [(NSDictionary *)self->_actionIdentifierToSupportedBundleIDsMap objectForKeyedSubscript:v4];
    }
  }
  v6 = v5;
  uint64_t v7 = [v5 count];

  return v7 != 0;
}

- (id)_modelItemWithActionType:(unint64_t)a3
{
  id v4 = +[CSLPRFStingSettingsModel actionNameForActionType:](CSLPRFStingSettingsModel, "actionNameForActionType:");
  v5 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:a3];
  if (a3 - 1 > 0x28) {
    v6 = 0;
  }
  else {
    v6 = off_264A0AC28[a3 - 1];
  }
  uint64_t v7 = v6;
  v8 = [CSLPRFStingSettingsItem alloc];
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [(CSLPRFStingSettingsItem *)v8 initWithIdentifier:v7 title:v4 actionType:v9 assetName:v5];

  return v10;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_buildActionIdentifierToSupportedBundleIDsMap:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CSLPRFStingSettingsModel__buildActionIdentifierToSupportedBundleIDsMap___block_invoke;
  v9[3] = &unk_264A0B0C0;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEFAULT, "build sting action identifier map complete %@", buf, 0xCu);
  }

  return v6;
}

void __74__CSLPRFStingSettingsModel__buildActionIdentifierToSupportedBundleIDsMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138412290;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "startActionIdentifier", v20);

        if (v13)
        {
          v14 = *(void **)(a1 + 32);
          v15 = [v12 startActionIdentifier];
          v16 = [v14 objectForKeyedSubscript:v15];

          if ([v16 count])
          {
            id v17 = [v16 mutableCopy];
            [v17 addObject:v5];
          }
          else
          {
            id v27 = v5;
            id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
          }
          v18 = *(void **)(a1 + 32);
          v19 = [v12 startActionIdentifier];
          [v18 setObject:v17 forKeyedSubscript:v19];
        }
        else
        {
          v16 = cslprf_sting_settings_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = v12;
            _os_log_error_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_ERROR, "model action requires a start action identifier, skipping %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v9);
  }
}

- (id)_buildDefaultActionTypeItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = +[CSLPRFStingSettingsModel activePairedWatchSupportsMoonstoneActions];
  if (+[CSLPRFStingSettingsModel IsHermes])
  {
    id v5 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:34];
    [v3 setObject:v5 atIndexedSubscript:0];

    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:6];
  [v3 setObject:v7 atIndexedSubscript:v6];

  long long v8 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:4];
  [v3 setObject:v8 atIndexedSubscript:v6 + 1];

  uint64_t v9 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:5];
  [v3 setObject:v9 atIndexedSubscript:v6 | 2];

  uint64_t v10 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:12];
  [v3 setObject:v10 atIndexedSubscript:v6 + 3];

  v11 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:20];
  [v3 setObject:v11 atIndexedSubscript:v6 | 4];

  id v12 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:1];
  [v3 setObject:v12 atIndexedSubscript:v6 + 5];

  uint64_t v13 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:2];
  [v3 setObject:v13 atIndexedSubscript:v6 | 6];

  if (v4)
  {
    v14 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:25];
    [v3 setObject:v14 atIndexedSubscript:v6 + 7];

    v15 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:29];
    [v3 setObject:v15 atIndexedSubscript:v6 | 8];

    v16 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:38];
    [v3 setObject:v16 atIndexedSubscript:v6 + 9];

    id v17 = [(CSLPRFStingSettingsModel *)self _modelItemWithActionType:40];
    [v3 setObject:v17 atIndexedSubscript:v6 | 0xA];
  }
  v18 = (void *)[v3 copy];

  return v18;
}

- (id)quickActionItems
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1950;
  v14 = __Block_byref_object_dispose__1951;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CSLPRFStingSettingsModel_quickActionItems__block_invoke;
  v7[3] = &unk_264A0B070;
  objc_copyWeak(&v8, &location);
  v7[4] = &v10;
  [(CSLPRFStingSettingsModel *)self _withLock:v7];
  id v3 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v11[5];
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_22F4EA000, v3, OS_LOG_TYPE_INFO, "%{public}@: quickActionItems %@", buf, 0x16u);
  }

  id v5 = (void *)[(id)v11[5] copy];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __44__CSLPRFStingSettingsModel_quickActionItems__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(WeakRetained, "defaultActionTypeItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        int v10 = objc_msgSend(WeakRetained, "_lock_isLinkActionSupportedForIdentifier:", v9);

        if (v10) {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)accessibilityItems
{
  return +[CSLPRFStingSettingsModelAccessibilityItem defaultItems];
}

- (id)shortcutItems
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__1950;
  long long v12 = __Block_byref_object_dispose__1951;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__CSLPRFStingSettingsModel_shortcutItems__block_invoke;
  v5[3] = &unk_264A0B070;
  objc_copyWeak(&v6, &location);
  v5[4] = &v8;
  [(CSLPRFStingSettingsModel *)self _withLock:v5];
  id v3 = (void *)[(id)v9[5] copy];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __41__CSLPRFStingSettingsModel_shortcutItems__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained settingsData];
  uint64_t v4 = [v3 shortcutsDictionary];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__CSLPRFStingSettingsModel_shortcutItems__block_invoke_2;
  v5[3] = &unk_264A0B478;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __41__CSLPRFStingSettingsModel_shortcutItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithArray:v6 copyItems:1];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKeyedSubscript:v7];
}

- (id)startWorkoutsListForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1950;
  uint64_t v16 = __Block_byref_object_dispose__1951;
  id v17 = 0;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__CSLPRFStingSettingsModel_startWorkoutsListForBundleID___block_invoke;
    v7[3] = &unk_264A0B098;
    objc_copyWeak(&v10, &location);
    id v8 = v4;
    uint64_t v9 = &v12;
    [(CSLPRFStingSettingsModel *)self _withLock:v7];

    objc_destroyWeak(&v10);
  }
  id v5 = (id)v13[5];
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __57__CSLPRFStingSettingsModel_startWorkoutsListForBundleID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained settingsData];
  id v3 = [v2 startWorkoutsDictionary];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v4 copyItems:1];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)defaultQuickActionItems
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__1950;
  uint64_t v12 = __Block_byref_object_dispose__1951;
  id v13 = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__CSLPRFStingSettingsModel_defaultQuickActionItems__block_invoke;
  v5[3] = &unk_264A0B070;
  objc_copyWeak(&v6, &location);
  v5[4] = &v8;
  [(CSLPRFStingSettingsModel *)self _withLock:v5];
  id v3 = (id)v9[5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __51__CSLPRFStingSettingsModel_defaultQuickActionItems__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained defaultActionTypeItems];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)bundleIDsForActionType:(unint64_t)a3
{
  if (a3 - 1 > 0x28) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = off_264A0AC28[a3 - 1];
  }
  uint64_t v5 = v4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1950;
  __int16 v18 = __Block_byref_object_dispose__1951;
  id v19 = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__CSLPRFStingSettingsModel_bundleIDsForActionType___block_invoke;
  v9[3] = &unk_264A0B098;
  objc_copyWeak(&v12, &location);
  long long v11 = &v14;
  id v6 = v5;
  uint64_t v10 = v6;
  [(CSLPRFStingSettingsModel *)self _withLock:v9];
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __51__CSLPRFStingSettingsModel_bundleIDsForActionType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained actionIdentifierToSupportedBundleIDsMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (CSLPRFStingSettingsModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSLPRFStingSettingsModel;
  v2 = [(CSLPRFStingSettingsModel *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_alloc_init(CSLPRFStingSystemSettings);
    stingSystemSettings = v3->_stingSystemSettings;
    v3->_stingSystemSettings = v4;

    [(CSLPRFStingSystemSettings *)v3->_stingSystemSettings setDelegate:v3];
    uint64_t v6 = [(CSLPRFStingSettingsModel *)v3 _buildDefaultActionTypeItems];
    defaultActionTypeItems = v3->_defaultActionTypeItems;
    v3->_defaultActionTypeItems = (NSArray *)v6;

    [(CSLPRFStingSettingsModel *)v3 rebuildModel];
  }
  return v3;
}

+ (id)alternateActionNameForActionType:(unint64_t)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 7uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_WORKOUT_PAUSE";
      goto LABEL_10;
    case 8uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_WORKOUT_RESUME";
      goto LABEL_10;
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      goto LABEL_12;
    case 0xCuLL:
    case 0xEuLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_BACKTRACK_RECORD";
      goto LABEL_10;
    case 0xDuLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_BACKTRACK_RETRACE";
      goto LABEL_10;
    case 0xFuLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_STOPWATCH_STOP";
      goto LABEL_10;
    case 0x10uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_STOPWATCH_START";
LABEL_10:
      id v7 = @"LocalizableSettings-N199";
      goto LABEL_11;
    default:
      if (a3 != 30) {
        goto LABEL_12;
      }
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_ALTERNATE_HINT_TRANSLATION_STOP";
      id v7 = @"LocalizableSettings-Translate";
LABEL_11:
      uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_26E2BF688 table:v7];

LABEL_12:
      return v3;
  }
}

+ (id)actionNameForActionType:(unint64_t)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1uLL:
    case 0x13uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_LAUNCH_FLASHLIGHT";
      goto LABEL_14;
    case 2uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_SHORTCUT";
      goto LABEL_14;
    case 4uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_STOPWATCH";
      goto LABEL_14;
    case 5uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_WAYPOINT";
      goto LABEL_14;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0x17uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_WORKOUT";
      goto LABEL_14;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_BACKTRACK";
      goto LABEL_14;
    case 0x14uLL:
    case 0x18uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_DIVE";
      goto LABEL_14;
    case 0x19uLL:
    case 0x1AuLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_VOICE_MEMO";
      goto LABEL_14;
    case 0x1DuLL:
    case 0x1EuLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_TRANSLATION";
      id v7 = @"LocalizableSettings-Translate";
      goto LABEL_15;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_REGATTA";
      id v7 = @"LocalizableSettings-Squall";
      goto LABEL_15;
    case 0x26uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_ACCESSIBILITY";
      goto LABEL_14;
    case 0x28uLL:
    case 0x29uLL:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarouselPreferenceServices"];
      uint64_t v5 = v4;
      uint64_t v6 = @"STING_ACTION_TYPE_RECOGNIZE_MUSIC";
LABEL_14:
      id v7 = @"LocalizableSettings-N199";
LABEL_15:
      uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_26E2BF688 table:v7];

      break;
    default:
      break;
  }
  return v3;
}

+ (id)sfSymbolAssetNameForActionType:(unint64_t)a3
{
  unint64_t v4 = a3 - 12;
  uint64_t v5 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v6 = [v5 getActivePairedDevice];

  if (v4 > 2)
  {
    if (a3 > 0x2A)
    {
      objc_super v9 = @"figure.run";
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"622B6312-95FA-4F09-9148-69E286A9C31F"];
  char v8 = [v6 supportsCapability:v7];

  if (v8)
  {
LABEL_5:
    objc_super v9 = off_264A0B0E0[a3];
    goto LABEL_7;
  }
  objc_super v9 = @"shoeprints.fill";
LABEL_7:

  return v9;
}

+ (BOOL)activePairedWatchSupportsMoonstoneActions
{
  if (activePairedWatchSupportsMoonstoneActions_onceToken != -1) {
    dispatch_once(&activePairedWatchSupportsMoonstoneActions_onceToken, &__block_literal_global_6);
  }
  return activePairedWatchSupportsMoonstoneActions___supportsNewActions;
}

BOOL __69__CSLPRFStingSettingsModel_activePairedWatchSupportsMoonstoneActions__block_invoke()
{
  activePairedWatchSupportsMoonstoneActions___supportsNewActions = 0;
  BOOL result = +[CSLPRFDeviceUtilities activePairedWatchSupportsMoonstoneActions];
  activePairedWatchSupportsMoonstoneActions___supportsNewActions = result;
  return result;
}

+ (BOOL)IsHermes
{
  if (IsHermes_onceToken != -1) {
    dispatch_once(&IsHermes_onceToken, &__block_literal_global_2056);
  }
  return IsHermes___isHermes;
}

BOOL __36__CSLPRFStingSettingsModel_IsHermes__block_invoke()
{
  IsHermes___isHermes = 0;
  BOOL result = +[CSLPRFDeviceUtilities isHermes];
  IsHermes___isHermes = result;
  return result;
}

@end
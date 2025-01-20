@interface CCUIModuleSettingsManager
- (BOOL)_shouldSkipControlMigrationFor:(id)a3;
- (CCUIModuleSettingsManager)init;
- (id)moduleSettingsForModuleIdentifier:(id)a3;
- (id)orderedEnabledModuleIdentifiersFromSettingsApp;
- (void)_loadDefaultSettings;
- (void)_loadMigrationSettings;
- (void)_runBlockOnListeners:(id)a3;
- (void)addObserver:(id)a3;
- (void)orderedEnabledModuleIdentifiersChangedForSettingsProvider:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation CCUIModuleSettingsManager

- (CCUIModuleSettingsManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIModuleSettingsManager;
  v2 = [(CCUIModuleSettingsManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5AD00] sharedProvider];
    settingsProvider = v2->_settingsProvider;
    v2->_settingsProvider = (CCSModuleSettingsProvider *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    [(CCUIModuleSettingsManager *)v2 _loadDefaultSettings];
    [(CCUIModuleSettingsManager *)v2 _loadMigrationSettings];
    [(CCSModuleSettingsProvider *)v2->_settingsProvider addObserver:v2];
  }
  return v2;
}

- (id)moduleSettingsForModuleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_migrationSettingsByModuleIdentifier objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [(NSDictionary *)self->_defaultSettingsByModuleIdentifier objectForKey:v4];
    if (!v5)
    {
      v6 = [CCUIModuleSettings alloc];
      v7 = SBHIconGridSizeClassForCCUIGridSizeClass();
      uint64_t v5 = [(CCUIModuleSettings *)v6 initWithGridSizeClass:v7 containerBundleIdentifier:@"com.apple.springboard"];
    }
  }

  return v5;
}

- (id)orderedEnabledModuleIdentifiersFromSettingsApp
{
  uint64_t v3 = [MEMORY[0x1E4F1C978] array];
  id v4 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedFixedModuleIdentifiers];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  v6 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedUserEnabledFixedModuleIdentifiers];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  objc_super v8 = [(CCSModuleSettingsProvider *)self->_settingsProvider orderedUserEnabledModuleIdentifiers];
  v9 = [v7 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_runBlockOnListeners:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CCUIModuleSettingsManager__runBlockOnListeners___block_invoke;
  v8[3] = &unk_1E6A8A510;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __50__CCUIModuleSettingsManager__runBlockOnListeners___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(void *)(a1 + 40));
}

- (void)orderedEnabledModuleIdentifiersChangedForSettingsProvider:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__CCUIModuleSettingsManager_orderedEnabledModuleIdentifiersChangedForSettingsProvider___block_invoke;
  v3[3] = &unk_1E6A8A538;
  v3[4] = self;
  [(CCUIModuleSettingsManager *)self _runBlockOnListeners:v3];
}

uint64_t __87__CCUIModuleSettingsManager_orderedEnabledModuleIdentifiersChangedForSettingsProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 orderedEnabledModuleIdentifiersChangedForSettingsManager:*(void *)(a1 + 32)];
}

- (void)_loadDefaultSettings
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 URLForResource:@"DefaultModuleSettings" withExtension:@"plist"];

  v22 = (void *)v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class();
        id v11 = v9;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
        }
        id v13 = v12;

        if (v13)
        {
          v14 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", v13, objc_opt_class());
          v15 = [MEMORY[0x1E4FA6280] controlCenterDomain];
          v16 = objc_msgSend(v14, "bs_safeObjectForKey:ofType:", @"gridSize", objc_opt_class());
          v17 = [v15 gridSizeClassForDescription:v16];

          v18 = objc_msgSend(v14, "bs_safeObjectForKey:ofType:", @"containerBundleIdentifier", objc_opt_class());
          v19 = [[CCUIModuleSettings alloc] initWithGridSizeClass:v17 containerBundleIdentifier:v18];
          [v24 setObject:v19 forKey:v13];
        }
        ++v8;
      }
      while (v7 != v8);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  v20 = (NSDictionary *)[v24 copy];
  defaultSettingsByModuleIdentifier = self->_defaultSettingsByModuleIdentifier;
  self->_defaultSettingsByModuleIdentifier = v20;
}

- (BOOL)_shouldSkipControlMigrationFor:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (!v5)
    {
      uint64_t v8 = @"iPhone";
      goto LABEL_7;
    }
    uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 1)
    {
      uint64_t v8 = @"iPad";
LABEL_7:
      char v9 = [v3 containsObject:v8];
      goto LABEL_8;
    }
  }
  char v9 = 0;
LABEL_8:

  return v9;
}

- (void)_loadMigrationSettings
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 URLForResource:@"ModuleParityControlMigrationList" withExtension:@"plist"];

  unint64_t v5 = 0x1E4F1C000uLL;
  long long v26 = (void *)v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v28 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        uint64_t v12 = objc_opt_class();
        id v13 = v11;
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
        }
        else
        {
          v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          v33 = SBHIconGridSizeClassForCCUIGridSizeClass();
          v16 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", v15, objc_opt_class());
          v32 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"extensionBundleIdentifier", objc_opt_class());
          uint64_t v31 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"containerBundleIdentifier", objc_opt_class());
          v30 = (void *)[v31 copy];
          long long v29 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"kind", objc_opt_class());
          v17 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"controlType", objc_opt_class());
          v18 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", @"unavailablePlatform", objc_opt_class());
          if (![(CCUIModuleSettingsManager *)self _shouldSkipControlMigrationFor:v18])
          {
            uint64_t v19 = v9;
            id v20 = v7;
            unint64_t v21 = v5;
            v22 = self;
            v23 = [[CCUIModuleSettings alloc] initWithGridSizeClass:v33 moduleContainerBundleIdentifier:v30 controlExtensionIdentifier:v32 controlContainerBundleIdentifier:v31 controlKind:v29 controlType:v17];
            objc_msgSend(v27, "bs_setSafeObject:forKey:", v23, v15);

            self = v22;
            unint64_t v5 = v21;
            id v7 = v20;
            uint64_t v9 = v19;
          }
        }
        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }

  id v24 = (NSDictionary *)[v27 copy];
  migrationSettingsByModuleIdentifier = self->_migrationSettingsByModuleIdentifier;
  self->_migrationSettingsByModuleIdentifier = v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_migrationSettingsByModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultSettingsByModuleIdentifier, 0);

  objc_storeStrong((id *)&self->_settingsProvider, 0);
}

@end
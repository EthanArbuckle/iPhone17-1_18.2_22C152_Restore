@interface CSLPRFPerApplicationSettingsModel
- (CSLPRFPerApplicationSettingsCustomizationDelegate)customizationDelegate;
- (CSLPRFPerApplicationSettingsModel)initWithApplicationLibrary:(id)a3 perApplicationSettingsClass:(Class)a4;
- (NSArray)allApplicationSettings;
- (id)_globalSettingsForCustomizedSettings:(id)a3;
- (id)_lock_customizedSettingsForBundleIdentifier:(id)a3;
- (id)bundleIdentifiersWithSettings;
- (id)globalSettings;
- (id)resolvedSettingsForApplication:(id)a3;
- (id)resolvedSettingsForBundleIdentifier:(id)a3;
- (id)settingsForApplication:(id)a3;
- (id)settingsForBundleIdentifier:(id)a3;
- (id)settingsObjectForBundleId:(id)a3 customizedSettings:(id)a4 existingSettings:(id)a5;
- (void)_processAddedOrUpdatedApplications:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationLibrary:(id)a3 didAddApplications:(id)a4;
- (void)applicationLibrary:(id)a3 didRemoveApplications:(id)a4;
- (void)applicationLibrary:(id)a3 didUpdateApplications:(id)a4;
- (void)didUpdateSettings:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCustomizationDelegate:(id)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFPerApplicationSettingsModel

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customizationDelegate);
  objc_storeStrong((id *)&self->_lock_globalSettings, 0);
  objc_storeStrong((id *)&self->_lock_settings, 0);
  objc_storeStrong((id *)&self->_syncedSettings, 0);
  objc_storeStrong((id *)&self->_observationHelper, 0);
  objc_storeStrong((id *)&self->_applicationLibrary, 0);
}

- (void)setCustomizationDelegate:(id)a3
{
}

- (CSLPRFPerApplicationSettingsCustomizationDelegate)customizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDelegate);
  return (CSLPRFPerApplicationSettingsCustomizationDelegate *)WeakRetained;
}

- (void)didUpdateSettings:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CSLPRFTwoWaySyncSetting *)self->_syncedSettings safeValueOfType:objc_opt_class()];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x263EFFA78];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  v9 = [v4 identifier];
  v10 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", v9, -[objc_class serializationClass](self->_perApplicationSettingsClass, "serializationClass"));
  if ([v4 hasCustomSetting])
  {
    v11 = [v4 serialize];
  }
  else
  {
    v11 = 0;
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    v12 = (void *)[v8 mutableCopy];
    v13 = v12;
    if (v11) {
      [v12 setValue:v11 forKey:v9];
    }
    else {
      [v12 removeObjectForKey:v9];
    }
    syncedSettings = self->_syncedSettings;
    v15 = (void *)[v13 copy];
    [(CSLPRFTwoWaySyncSetting *)syncedSettings setValue:v15];

    if ([v4 isGlobalDefault])
    {
      observationHelper = self->_observationHelper;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __55__CSLPRFPerApplicationSettingsModel_didUpdateSettings___block_invoke;
      v22[3] = &unk_264A0B410;
      v22[4] = self;
      id v23 = v4;
      [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v22];
    }
    else
    {
      v24[0] = v4;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      v18 = self->_observationHelper;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __55__CSLPRFPerApplicationSettingsModel_didUpdateSettings___block_invoke_2;
      v20[3] = &unk_264A0B410;
      v20[4] = self;
      id v21 = v17;
      id v19 = v17;
      [(CSLPRFObservationHelper *)v18 notifyObserversWithBlock:v20];
    }
  }
}

uint64_t __55__CSLPRFPerApplicationSettingsModel_didUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didChangeGlobalSettings:*(void *)(a1 + 40)];
}

uint64_t __55__CSLPRFPerApplicationSettingsModel_didUpdateSettings___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
}

- (id)_globalSettingsForCustomizedSettings:(id)a3
{
  Class perApplicationSettingsClass = self->_perApplicationSettingsClass;
  id v5 = a3;
  v6 = [(objc_class *)perApplicationSettingsClass globalDefaultIdentifer];
  v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", v6, -[objc_class serializationClass](self->_perApplicationSettingsClass, "serializationClass"));

  id v8 = [(objc_class *)self->_perApplicationSettingsClass globalSettingsWithSerialization:v7 delegate:self];

  return v8;
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = [(CSLPRFTwoWaySyncSetting *)self->_syncedSettings safeValueOfType:objc_opt_class()];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_lock_settings, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v51 count:16];
  v37 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKey:](self->_lock_settings, "objectForKey:", v11, lock);
        if (!v12)
        {
          v13 = [(CSLPRFPerApplicationSettingsModel *)self settingsObjectForBundleId:v11 customizedSettings:v4 existingSettings:0];
          if (([0 isEqual:v13] & 1) == 0) {
            [v5 addObject:v13];
          }
          lock_settings = self->_lock_settings;
          v15 = [v13 identifier];
          v16 = lock_settings;
          id v5 = v37;
          [(NSMutableDictionary *)v16 setObject:v13 forKey:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v8);
  }

  v17 = [(NSMutableDictionary *)self->_lock_settings allValues];
  v18 = (void *)[v17 copy];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v25 = objc_msgSend(v24, "identifier", lock);
        v26 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v25, -[objc_class serializationClass](self->_perApplicationSettingsClass, "serializationClass"));

        Class perApplicationSettingsClass = self->_perApplicationSettingsClass;
        v28 = [v24 application];
        v29 = [(objc_class *)perApplicationSettingsClass settingsForApplication:v28 withSerialization:v26 delegate:self];

        if (([v29 isEqual:v24] & 1) == 0) {
          [v37 addObject:v29];
        }
        v30 = self->_lock_settings;
        v31 = [v29 identifier];
        [(NSMutableDictionary *)v30 setObject:v29 forKey:v31];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v21);
  }

  v32 = self->_lock_globalSettings;
  v33 = [(CSLPRFPerApplicationSettingsModel *)self _globalSettingsForCustomizedSettings:v4];
  objc_storeStrong((id *)&self->_lock_globalSettings, v33);
  os_unfair_lock_unlock(lock);
  if ([v37 count])
  {
    observationHelper = self->_observationHelper;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __64__CSLPRFPerApplicationSettingsModel_twoWaySyncSettingDidUpdate___block_invoke;
    v40[3] = &unk_264A0B410;
    v40[4] = self;
    id v41 = v37;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v40];
  }
  if ((objc_msgSend(v33, "isEqual:", v32, lock) & 1) == 0)
  {
    v35 = self->_observationHelper;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __64__CSLPRFPerApplicationSettingsModel_twoWaySyncSettingDidUpdate___block_invoke_2;
    v38[3] = &unk_264A0B410;
    v38[4] = self;
    id v39 = v33;
    [(CSLPRFObservationHelper *)v35 notifyObserversWithBlock:v38];
  }
}

uint64_t __64__CSLPRFPerApplicationSettingsModel_twoWaySyncSettingDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
}

uint64_t __64__CSLPRFPerApplicationSettingsModel_twoWaySyncSettingDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didChangeGlobalSettings:*(void *)(a1 + 40)];
}

- (id)settingsObjectForBundleId:(id)a3 customizedSettings:(id)a4 existingSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a5 application];
  if (!v10)
  {
    v10 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:v8];
  }
  uint64_t v11 = objc_msgSend(v9, "bs_safeObjectForKey:ofType:", v8, -[objc_class serializationClass](self->_perApplicationSettingsClass, "serializationClass"));

  v12 = [(objc_class *)self->_perApplicationSettingsClass settingsForApplication:v10 withSerialization:v11 delegate:self];

  return v12;
}

- (void)applicationLibrary:(id)a3 didRemoveApplications:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NSMutableDictionary *)self->_lock_settings removeObjectForKey:*(void *)(*((void *)&v15 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  observationHelper = self->_observationHelper;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__CSLPRFPerApplicationSettingsModel_applicationLibrary_didRemoveApplications___block_invoke;
  v13[3] = &unk_264A0B410;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v13];
}

uint64_t __78__CSLPRFPerApplicationSettingsModel_applicationLibrary_didRemoveApplications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didRemoveSettings:*(void *)(a1 + 40)];
}

- (void)_processAddedOrUpdatedApplications:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CSLPRFTwoWaySyncSetting *)self->_syncedSettings safeValueOfType:objc_opt_class()];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __72__CSLPRFPerApplicationSettingsModel__processAddedOrUpdatedApplications___block_invoke;
  v49[3] = &unk_264A0B3E8;
  id v6 = v5;
  id v50 = v6;
  v51 = self;
  v35 = v4;
  uint64_t v7 = objc_msgSend(v4, "bs_mapNoNulls:", v49);
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v33 = v7;
  v34 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  os_unfair_lock_lock(&self->_lock);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v36 = v6;
  uint64_t v9 = [v6 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        long long v15 = [(NSMutableDictionary *)self->_lock_settings objectForKey:v14];
        if (!v15)
        {
          long long v16 = [(CSLPRFPerApplicationSettingsModel *)self settingsObjectForBundleId:v14 customizedSettings:v36 existingSettings:0];
          [v8 addObject:v16];
          lock_settings = self->_lock_settings;
          long long v18 = [v16 identifier];
          [(NSMutableDictionary *)lock_settings setObject:v16 forKey:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v11);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v19 = v33;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v25 = self->_lock_settings;
        v26 = [v24 identifier];
        v27 = [(NSMutableDictionary *)v25 objectForKey:v26];

        if (v27) {
          v28 = v34;
        }
        else {
          v28 = v8;
        }
        [v28 addObject:v24];
        v29 = self->_lock_settings;
        v30 = [v24 identifier];
        [(NSMutableDictionary *)v29 setObject:v24 forKey:v30];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v21);
  }

  os_unfair_lock_unlock(&self->_lock);
  if ([v8 count])
  {
    observationHelper = self->_observationHelper;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __72__CSLPRFPerApplicationSettingsModel__processAddedOrUpdatedApplications___block_invoke_2;
    v39[3] = &unk_264A0B410;
    v39[4] = self;
    id v40 = v8;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v39];
  }
  if ([v34 count])
  {
    v32 = self->_observationHelper;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __72__CSLPRFPerApplicationSettingsModel__processAddedOrUpdatedApplications___block_invoke_3;
    v37[3] = &unk_264A0B410;
    v37[4] = self;
    id v38 = v34;
    [(CSLPRFObservationHelper *)v32 notifyObserversWithBlock:v37];
  }
}

id __72__CSLPRFPerApplicationSettingsModel__processAddedOrUpdatedApplications___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 bundleIdentifier];
  id v6 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", v5, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "serializationClass"));

  uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "settingsForApplication:withSerialization:delegate:", v4, v6);

  return v7;
}

uint64_t __72__CSLPRFPerApplicationSettingsModel__processAddedOrUpdatedApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didAddSettings:*(void *)(a1 + 40)];
}

uint64_t __72__CSLPRFPerApplicationSettingsModel__processAddedOrUpdatedApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 settingsModel:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
}

- (void)applicationLibrary:(id)a3 didUpdateApplications:(id)a4
{
}

- (void)applicationLibrary:(id)a3 didAddApplications:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (id)bundleIdentifiersWithSettings
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_lock_settings allKeys];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)settingsForBundleIdentifier:(id)a3
{
  if (a3)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    id v6 = [(CSLPRFPerApplicationSettingsModel *)self _lock_customizedSettingsForBundleIdentifier:v5];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)globalSettings
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_lock_globalSettings;
  if (!v5)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"globalSettings != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      __int16 v14 = 2114;
      long long v15 = v11;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2114;
      id v19 = @"CSLPRFPerApplicationSettingsModel.m";
      __int16 v20 = 1024;
      int v21 = 107;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x22F506728);
  }
  id v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)settingsForApplication:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [v4 bundleIdentifier];
  uint64_t v7 = [(CSLPRFPerApplicationSettingsModel *)self _lock_customizedSettingsForBundleIdentifier:v6];

  if (!v7)
  {
    uint64_t v7 = [(objc_class *)self->_perApplicationSettingsClass settingsForApplication:v4 withSerialization:0 delegate:self];
    lock_settings = self->_lock_settings;
    uint64_t v9 = [v7 identifier];
    [(NSMutableDictionary *)lock_settings setObject:v7 forKey:v9];
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)_lock_customizedSettingsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  char v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_customizationDelegate);
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->_lock_settings copy];
    uint64_t v8 = [v6 settingsForBundleIdentifier:v4 fromAllSettings:v7 handled:&v11];

    if (v11) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_lock_settings objectForKey:v4];

  uint64_t v8 = (void *)v9;
LABEL_6:

  return v8;
}

- (id)resolvedSettingsForBundleIdentifier:(id)a3
{
  id v4 = [(CSLPRFPerApplicationSettingsModel *)self settingsForBundleIdentifier:a3];
  id v5 = [(CSLPRFPerApplicationSettingsModel *)self globalSettings];
  if (v4)
  {
    uint64_t v6 = [v4 resolvedSettingWithGlobalSettings:v5];

    id v5 = (void *)v6;
  }

  return v5;
}

- (id)resolvedSettingsForApplication:(id)a3
{
  id v4 = [(CSLPRFPerApplicationSettingsModel *)self settingsForApplication:a3];
  id v5 = [(CSLPRFPerApplicationSettingsModel *)self globalSettings];
  if (v4)
  {
    uint64_t v6 = [v4 resolvedSettingWithGlobalSettings:v5];

    id v5 = (void *)v6;
  }

  return v5;
}

- (NSArray)allApplicationSettings
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_lock_settings allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (CSLPRFPerApplicationSettingsModel)initWithApplicationLibrary:(id)a3 perApplicationSettingsClass:(Class)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CSLPRFPerApplicationSettingsModel;
  uint64_t v8 = [(CSLPRFPerApplicationSettingsModel *)&v22 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    lock_settings = v9->_lock_settings;
    v9->_lock_settings = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_applicationLibrary, a3);
    v9->_Class perApplicationSettingsClass = a4;
    uint64_t v12 = objc_alloc_init(CSLPRFObservationHelper);
    observationHelper = v9->_observationHelper;
    v9->_observationHelper = v12;

    __int16 v14 = [CSLPRFTwoWaySyncSetting alloc];
    long long v15 = [(objc_class *)a4 settingsKey];
    uint64_t v16 = [(CSLPRFTwoWaySyncSetting *)v14 initWithKey:v15 defaultValue:0 notification:[(objc_class *)a4 notificationName]];
    syncedSettings = v9->_syncedSettings;
    v9->_syncedSettings = (CSLPRFTwoWaySyncSetting *)v16;

    __int16 v18 = [(CSLPRFTwoWaySyncSetting *)v9->_syncedSettings safeValueOfType:objc_opt_class()];
    uint64_t v19 = [(CSLPRFPerApplicationSettingsModel *)v9 _globalSettingsForCustomizedSettings:v18];
    lock_globalSettings = v9->_lock_globalSettings;
    v9->_lock_globalSettings = (CSLPRFPerApplicationSettings *)v19;

    [(CSLPRFTwoWaySyncSetting *)v9->_syncedSettings setDelegate:v9];
    [(CSLPRFApplicationLibrary *)v9->_applicationLibrary addObserver:v9];
  }

  return v9;
}

@end
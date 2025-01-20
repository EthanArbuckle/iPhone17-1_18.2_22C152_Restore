@interface CSLPRFReturnToAppSettingsModel
+ (id)returnToAppSettingsToDictionary:(id)a3;
- (CSLPRFReturnToAppSettingsModel)init;
- (id)settingsForBundleID:(id)a3;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)reloadAppSettings;
- (void)removeObserver:(id)a3;
- (void)saveAppSettings;
- (void)setSettings:(id)a3 forBundleID:(id)a4;
@end

@implementation CSLPRFReturnToAppSettingsModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_returnToAppSettingsByBundleID, 0);
}

- (void)setSettings:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__CSLPRFReturnToAppSettingsModel_setSettings_forBundleID___block_invoke;
  v16[3] = &unk_264A0BAB0;
  v16[4] = self;
  id v8 = v7;
  id v17 = v8;
  id v9 = v6;
  id v18 = v9;
  [(CSLPRFReturnToAppSettingsModel *)self _withLock:v16];
  observers = self->_observers;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__CSLPRFReturnToAppSettingsModel_setSettings_forBundleID___block_invoke_2;
  v13[3] = &unk_264A0BAD8;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  [(CSLPRFConcurrentObserverStore *)observers enumerateObserversWithBlock:v13];
}

uint64_t __58__CSLPRFReturnToAppSettingsModel_setSettings_forBundleID___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

void __58__CSLPRFReturnToAppSettingsModel_setSettings_forBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settingsChanged:*(void *)(a1 + 32) forBundleID:*(void *)(a1 + 40)];
  }
}

- (id)settingsForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4172;
  id v15 = __Block_byref_object_dispose__4173;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CSLPRFReturnToAppSettingsModel_settingsForBundleID___block_invoke;
  v8[3] = &unk_264A0BA88;
  v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(CSLPRFReturnToAppSettingsModel *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __54__CSLPRFReturnToAppSettingsModel_settingsForBundleID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)saveAppSettings
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__4172;
  v10 = __Block_byref_object_dispose__4173;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CSLPRFReturnToAppSettingsModel_saveAppSettings__block_invoke;
  v5[3] = &unk_264A0BC58;
  v5[4] = self;
  v5[5] = &v6;
  [(CSLPRFReturnToAppSettingsModel *)self _withLock:v5];
  [(NPSDomainAccessor *)self->_npsDomainAccessor setObject:v7[5] forKey:@"ReturnToAppSettings"];
  id v3 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
  id v4 = [MEMORY[0x263EFFA08] setWithObject:@"ReturnToAppSettings"];
  [(NPSManager *)self->_npsManager synchronizeNanoDomain:@"com.apple.Carousel" keys:v4];

  _Block_object_dispose(&v6, 8);
}

uint64_t __49__CSLPRFReturnToAppSettingsModel_saveAppSettings__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)objc_opt_class() returnToAppSettingsToDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
  return MEMORY[0x270F9A758]();
}

- (void)reloadAppSettings
{
  id v3 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CSLPRFReturnToAppSettingsModel_reloadAppSettings__block_invoke;
  v4[3] = &unk_264A0BA38;
  v4[4] = self;
  [(CSLPRFReturnToAppSettingsModel *)self _withLock:v4];
}

void __51__CSLPRFReturnToAppSettingsModel_reloadAppSettings__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:@"ReturnToAppSettings"];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CSLPRFReturnToAppSettingsModel_reloadAppSettings__block_invoke_2;
  v6[3] = &unk_264A0BA10;
  v6[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
}

void __51__CSLPRFReturnToAppSettingsModel_reloadAppSettings__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[CSLPRFReturnToAppSettings alloc] initWithDictionary:v5];

  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKeyedSubscript:v6];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (CSLPRFReturnToAppSettingsModel)init
{
  v14.receiver = self;
  v14.super_class = (Class)CSLPRFReturnToAppSettingsModel;
  v2 = [(CSLPRFReturnToAppSettingsModel *)&v14 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [CSLPRFConcurrentObserverStore alloc];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = [(CSLPRFConcurrentObserverStore *)v4 initWithServiceName:v6];
    observers = v3->_observers;
    v3->_observers = (CSLPRFConcurrentObserverStore *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Carousel"];
    npsDomainAccessor = v3->_npsDomainAccessor;
    v3->_npsDomainAccessor = (NPSDomainAccessor *)v9;

    id v11 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    npsManager = v3->_npsManager;
    v3->_npsManager = v11;

    [(CSLPRFReturnToAppSettingsModel *)v3 reloadAppSettings];
  }
  return v3;
}

+ (id)returnToAppSettingsToDictionary:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CSLPRFReturnToAppSettingsModel_returnToAppSettingsToDictionary___block_invoke;
  v9[3] = &unk_264A0BA60;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = (void *)[v6 copy];
  return v7;
}

void __66__CSLPRFReturnToAppSettingsModel_returnToAppSettingsToDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 toDictionary];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

@end
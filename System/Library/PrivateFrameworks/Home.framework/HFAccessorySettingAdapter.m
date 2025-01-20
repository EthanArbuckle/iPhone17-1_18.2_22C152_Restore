@interface HFAccessorySettingAdapter
+ (id)createDefaultHomeSettingAdapterCollectionForProfile:(id)a3;
+ (id)createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:(id)a3;
- (BOOL)_setupKeyPaths;
- (BOOL)_updateRootAccessorySettings;
- (BOOL)_updateRootAccessorySettingsIfNeeded;
- (HFAccessorySettingAdapter)init;
- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4;
- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6;
- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5;
- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandlerBlock:(id)a5;
- (HFHomeKitDispatcher)dispatcher;
- (HFHomeKitSettingsValueManager)valueManager;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HMAccessory)accessory;
- (HMHome)home;
- (HMSettings)settings;
- (NSMutableDictionary)keyPathStringToFuture;
- (NSMutableDictionary)watchedSettings;
- (NSSet)keyPaths;
- (id)_beginMonitoringSettingsKeyPath:(id)a3;
- (id)_endMonitoringSettingsKeyPath:(id)a3;
- (id)_missingKeyPaths;
- (id)settingForKeyPath:(id)a3;
- (id)settingWatchFutureForKeyPath:(id)a3;
- (id)updateHandler;
- (id)updateSetting:(id)a3 value:(id)a4;
- (id)updateSettingWithKeyPath:(id)a3 value:(id)a4;
- (unint64_t)mode;
- (void)_reportUpdatedValueForSetting:(id)a3;
- (void)_setupMissingKeyPaths;
- (void)_tearDownKeyPaths;
- (void)_teardownSetting:(id)a3;
- (void)_watchSetting:(id)a3;
- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4;
- (void)setDispatcher:(id)a3;
- (void)setKeyPathStringToFuture:(id)a3;
- (void)setWatchedSettings:(id)a3;
- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5;
- (void)settings:(id)a3 didWriteValueForSettings:(id)a4 failedSettings:(id)a5 homeKitObjectIdentifiers:(id)a6;
- (void)settings:(id)a3 willWriteValueForSettings:(id)a4;
- (void)settingsDidUpdate:(id)a3;
@end

@implementation HFAccessorySettingAdapter

- (HFAccessorySettingAdapter)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingAdapter.m", 93, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingAdapter init]",
    v5);

  return 0;
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HFAccessorySettingAdapter.m", 98, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"HFAccessorySettingAdapter.m", 99, @"Invalid parameter not satisfying: %@", @"keyPaths" object file lineNumber description];

LABEL_3:
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v31.receiver = self;
  v31.super_class = (Class)HFAccessorySettingAdapter;
  v15 = [(HFAccessorySettingAdapter *)&v31 init];
  v16 = v15;
  if (v15)
  {
    v15->_mode = a5;
    uint64_t v17 = [v14 copy];
    id updateHandler = v16->_updateHandler;
    v16->_id updateHandler = (id)v17;

    objc_storeStrong((id *)&v16->_homeKitSettingsVendor, a3);
    uint64_t v19 = objc_msgSend(v12, "hf_settingsValueManager");
    valueManager = v16->_valueManager;
    v16->_valueManager = (HFHomeKitSettingsValueManager *)v19;

    uint64_t v21 = [v13 copy];
    keyPaths = v16->_keyPaths;
    v16->_keyPaths = (NSSet *)v21;

    uint64_t v23 = objc_opt_new();
    keyPathStringToFuture = v16->_keyPathStringToFuture;
    v16->_keyPathStringToFuture = (NSMutableDictionary *)v23;

    uint64_t v25 = +[HFHomeKitDispatcher sharedDispatcher];
    dispatcher = v16->_dispatcher;
    v16->_dispatcher = (HFHomeKitDispatcher *)v25;

    [(HFHomeKitDispatcher *)v16->_dispatcher addMediaObjectObserver:v16];
    [(HFHomeKitDispatcher *)v16->_dispatcher addHomeKitSettingsObserver:v16];
    [(HFAccessorySettingAdapter *)v16 _updateRootAccessorySettings];
    v27 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl(&dword_20B986000, v27, OS_LOG_TYPE_DEFAULT, "init HFAccessorySettingAdapter with keyPaths: %@", buf, 0xCu);
    }
  }
  return v16;
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandlerBlock:(id)a5
{
  return [(HFAccessorySettingAdapter *)self initWithHomeKitSettingsVendor:a3 keyPaths:a4 mode:1 updateHandler:a5];
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  return [(HFAccessorySettingAdapter *)self initWithHomeKitSettingsVendor:a3 keyPaths:a4 mode:1 updateHandler:a5];
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4
{
  return [(HFAccessorySettingAdapter *)self initWithHomeKitSettingsVendor:a3 keyPaths:a4 mode:1 updateHandler:0];
}

- (id)updateSettingWithKeyPath:(id)a3 value:(id)a4
{
  id v6 = a4;
  v7 = [(HFAccessorySettingAdapter *)self settingWatchFutureForKeyPath:a3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__HFAccessorySettingAdapter_updateSettingWithKeyPath_value___block_invoke;
  v11[3] = &unk_26408F8A8;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 flatMap:v11];

  return v9;
}

uint64_t __60__HFAccessorySettingAdapter_updateSettingWithKeyPath_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateSetting:a2 value:*(void *)(a1 + 40)];
}

- (id)settingWatchFutureForKeyPath:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HFAccessorySettingAdapter.m", 149, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = [(HFAccessorySettingAdapter *)self keyPaths];
  char v7 = [v6 containsObject:v5];

  id v8 = HFLogForCategory(0x3AuLL);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      uint64_t v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v22;
      __int16 v38 = 2112;
      v39 = v23;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_debug_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEBUG, "(%@/%@) Checking to see if we already have setting for keyPath '%@'...", buf, 0x20u);
    }
    v10 = [(HFAccessorySettingAdapter *)self watchedSettings];
    v11 = [v10 objectForKey:v5];

    if (v11
      && ([v11 setting], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      id v13 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_super v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        id v33 = NSStringFromSelector(a2);
        uint64_t v34 = [v11 setting];
        *(_DWORD *)buf = 138413058;
        v37 = v32;
        __int16 v38 = 2112;
        v39 = v33;
        __int16 v40 = 2112;
        id v41 = v5;
        __int16 v42 = 2112;
        v43 = v34;
        _os_log_debug_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEBUG, "(%@/%@) Setting '%@' is something we're watching for already! Returning: '%@'", buf, 0x2Au);
      }
      id v14 = (void *)MEMORY[0x263F58190];
      v15 = [v11 setting];
      uint64_t v16 = [v14 futureWithResult:v15];
    }
    else
    {
      uint64_t v19 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v37 = v29;
        __int16 v38 = 2112;
        v39 = v30;
        __int16 v40 = 2112;
        id v41 = v5;
        _os_log_debug_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEBUG, "(%@/%@) Setting '%@' is something we're watching for, but don't have a setting yet.  Returning a future.", buf, 0x20u);
      }
      v15 = [(HFAccessorySettingAdapter *)self keyPathStringToFuture];
      uint64_t v16 = objc_msgSend(v15, "na_objectForKey:withDefaultValue:", v5, &__block_literal_global_123);
    }
    v18 = (void *)v16;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(a2);
      v27 = [(HFAccessorySettingAdapter *)self keyPaths];
      *(_DWORD *)buf = 138413058;
      v37 = v25;
      __int16 v38 = 2112;
      v39 = v26;
      __int16 v40 = 2112;
      id v41 = v5;
      __int16 v42 = 2112;
      v43 = v27;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(%@/%@) Error; '%@' isn't part of watched keyPaths '%@'",
        buf,
        0x2Au);
    }
    uint64_t v17 = (void *)MEMORY[0x263F58190];
    v11 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:descriptionFormat:", 7, @"Could not find accessory setting for keyPath: %@", v5);
    v18 = [v17 futureWithError:v11];
  }

  return v18;
}

id __58__HFAccessorySettingAdapter_settingWatchFutureForKeyPath___block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

- (HMHome)home
{
  v2 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  v3 = objc_msgSend(v2, "hf_home");

  return (HMHome *)v3;
}

- (HFHomeKitSettingsValueManager)valueManager
{
  valueManager = self->_valueManager;
  if (!valueManager)
  {
    v4 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
    objc_msgSend(v4, "hf_settingsValueManager");
    id v5 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_valueManager;
    self->_valueManager = v5;

    valueManager = self->_valueManager;
  }
  char v7 = valueManager;
  return v7;
}

- (id)updateSetting:(id)a3 value:(id)a4
{
  v26[3] = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  char v7 = (__CFString *)a4;
  id v8 = [(HFAccessorySettingAdapter *)self valueManager];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 changeValueForSetting:v6 toValue:v7];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__HFAccessorySettingAdapter_updateSetting_value___block_invoke;
    v22[3] = &unk_26408F8F0;
    uint64_t v23 = v6;
    v24 = v7;
    id v11 = (id)[v10 addCompletionBlock:v22];

    id v12 = v23;
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F58190];
    id v14 = (void *)MEMORY[0x263F087E8];
    if (v6) {
      v15 = v6;
    }
    else {
      v15 = @"(null)";
    }
    v25[0] = @"setting";
    v25[1] = @"value";
    if (v7) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = @"(null)";
    }
    v26[0] = v15;
    v26[1] = v16;
    v25[2] = @"settings";
    uint64_t v17 = [(HFAccessorySettingAdapter *)self settings];
    id v12 = (void *)v17;
    if (v17) {
      v18 = (__CFString *)v17;
    }
    else {
      v18 = @"(null)";
    }
    v26[2] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    v20 = objc_msgSend(v14, "hf_errorWithCode:operation:options:", 25, @"updateSetting:value: failed because value manager is nil!", v19);
    v10 = [v13 futureWithError:v20];
  }
  return v10;
}

void __49__HFAccessorySettingAdapter_updateSetting_value___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x3AuLL);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Attempting to update '%@' with value '%@' failed: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "Updated '%@' with value '%@'", (uint8_t *)&v11, 0x16u);
  }
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(HFAccessorySettingAdapter *)self _updateRootAccessorySettingsIfNeeded];
  id v5 = [(HFAccessorySettingAdapter *)self watchedSettings];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 setting];

  return v7;
}

- (void)settings:(id)a3 willWriteValueForSettings:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_debug_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEBUG, "%@:%@ settings %@, settingsSet %@", buf, 0x2Au);
  }
  [(HFAccessorySettingAdapter *)self _updateRootAccessorySettingsIfNeeded];
  uint64_t v10 = [(HFAccessorySettingAdapter *)self keyPaths];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke;
  v15[3] = &unk_26408F918;
  id v16 = v10;
  id v11 = v10;
  uint64_t v12 = objc_msgSend(v8, "na_filter:", v15);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke_2;
  v14[3] = &unk_26408F940;
  v14[4] = self;
  objc_msgSend(v12, "na_each:", v14);
}

uint64_t __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 keyPath];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reportUpdatedValueForSetting:a2];
}

- (void)settings:(id)a3 didWriteValueForSettings:(id)a4 failedSettings:(id)a5 homeKitObjectIdentifiers:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v17;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_debug_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEBUG, "%@:%@ settings %@, didWrite %@, failedWrite %@", buf, 0x34u);
  }
  [(HFAccessorySettingAdapter *)self _updateRootAccessorySettingsIfNeeded];
  uint64_t v14 = [(HFAccessorySettingAdapter *)self keyPaths];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke;
  v19[3] = &unk_26408F918;
  id v20 = v14;
  id v15 = v14;
  id v16 = objc_msgSend(v12, "na_filter:", v19);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke_2;
  v18[3] = &unk_26408F940;
  v18[4] = self;
  objc_msgSend(v16, "na_each:", v18);
}

uint64_t __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 keyPath];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reportUpdatedValueForSetting:a2];
}

- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Got settings:didUpdateForIdentifier:keyPath: callback for keyPath '%@'", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(HFAccessorySettingAdapter *)self settingForKeyPath:v6];
  uint64_t v9 = HFLogForCategory(0x3AuLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Found changed setting:%@ for keyPath: %@", (uint8_t *)&v11, 0x16u);
    }

    [(HFAccessorySettingAdapter *)self _reportUpdatedValueForSetting:v8];
  }
  else
  {
    if (v10)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Cannot find changed setting for keyPath: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)settingsDidUpdate:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  id v6 = [v5 settings];

  if (v6 == v4)
  {
    id v7 = [(HFAccessorySettingAdapter *)self settings];

    if (v7 != v4)
    {
      [(HFAccessorySettingAdapter *)self _updateRootAccessorySettings];
      goto LABEL_31;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(HFAccessorySettingAdapter *)self keyPaths];
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (!v8) {
      goto LABEL_30;
    }
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v37;
    *(void *)&long long v9 = 138412546;
    long long v32 = v9;
    uint64_t v33 = *(void *)v37;
LABEL_6:
    uint64_t v12 = 0;
    uint64_t v34 = v10;
    while (1)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
      uint64_t v14 = -[HFAccessorySettingAdapter settingForKeyPath:](self, "settingForKeyPath:", v13, v32);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        id v16 = objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", v13);

        uint64_t v17 = HFLogForCategory(0x3AuLL);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v16)
        {
          id v19 = v4;
          if (v18)
          {
            *(_DWORD *)buf = v32;
            id v41 = v15;
            __int16 v42 = 2112;
            uint64_t v43 = v13;
            _os_log_debug_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEBUG, "Found watched setting '%@' @ keyPath '%@'", buf, 0x16u);
          }

          id v20 = [(HFAccessorySettingAdapter *)self settings];
          __int16 v21 = +[_HFObservedAccessorySettingState stateWithSettings:v20 forSetting:v15];

          id v22 = [(HFAccessorySettingAdapter *)self watchedSettings];
          __int16 v23 = [v15 keyPath];
          id v24 = [v22 objectForKeyedSubscript:v23];
          char v25 = [v21 isEqual:v24];

          if ((v25 & 1) == 0)
          {
            id v26 = HFLogForCategory(0x3AuLL);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v32;
              id v41 = v15;
              __int16 v42 = 2112;
              uint64_t v43 = v13;
              _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "Found metadata for setting '%@' @ keyPath '%@' has changed; notifying delegate",
                buf,
                0x16u);
            }

            __int16 v27 = [(HFAccessorySettingAdapter *)self watchedSettings];
            id v28 = [v15 keyPath];
            [v27 setObject:v21 forKey:v28];

            [(HFAccessorySettingAdapter *)self _reportUpdatedValueForSetting:v15];
          }

          id v4 = v19;
          uint64_t v11 = v33;
          uint64_t v10 = v34;
        }
        else
        {
          if (v18)
          {
            *(_DWORD *)buf = v32;
            id v41 = v15;
            __int16 v42 = 2112;
            uint64_t v43 = v13;
            _os_log_debug_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEBUG, "Setting '%@' @ keyPath '%@' was deleted.", buf, 0x16u);
          }

          [(HFAccessorySettingAdapter *)self _teardownSetting:v15];
        }
      }
      else
      {
        __int16 v29 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v32;
          id v41 = 0;
          __int16 v42 = 2112;
          uint64_t v43 = v13;
          _os_log_debug_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEBUG, "Unable to find watched setting '%@' @ keyPath '%@'", buf, 0x16u);
        }

        id v30 = [(HFAccessorySettingAdapter *)self settings];
        uint64_t v15 = objc_msgSend(v30, "hf_accessorySettingAtKeyPath:", v13);

        if (!v15) {
          goto LABEL_28;
        }
        [(HFAccessorySettingAdapter *)self _watchSetting:v15];
        uint64_t v31 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v32;
          id v41 = v15;
          __int16 v42 = 2112;
          uint64_t v43 = v13;
          _os_log_debug_impl(&dword_20B986000, v31, OS_LOG_TYPE_DEBUG, "Built setting '%@' @ keyPath '%@'", buf, 0x16u);
        }

        [(HFAccessorySettingAdapter *)self _reportUpdatedValueForSetting:v15];
      }

LABEL_28:
      if (v10 == ++v12)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (!v10)
        {
LABEL_30:

          break;
        }
        goto LABEL_6;
      }
    }
  }
LABEL_31:
}

- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4
{
  id v5 = a3;
  id v6 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  int v7 = [v6 isEqual:v5];

  if (v7)
  {
    [(HFAccessorySettingAdapter *)self _updateRootAccessorySettingsIfNeeded];
  }
}

- (BOOL)_updateRootAccessorySettingsIfNeeded
{
  v2 = self;
  v3 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  id v4 = [v3 settings];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x21053EE50]();
    id v6 = [(HFAccessorySettingAdapter *)v2 settings];
    char v7 = [v6 isEqual:v4];

    if (v7)
    {
      uint64_t v8 = [(HFAccessorySettingAdapter *)v2 _missingKeyPaths];
      uint64_t v9 = [v8 count];

      if (v9) {
        [(HFAccessorySettingAdapter *)v2 _setupMissingKeyPaths];
      }
    }
    else
    {
      LOBYTE(v2) = [(HFAccessorySettingAdapter *)v2 _updateRootAccessorySettings];
    }
    char v11 = (v7 ^ 1) & v2;
  }
  else
  {
    uint64_t v10 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Settings aren't setup yet; aborting cycling settings...",
        v13,
        2u);
    }

    char v11 = 0;
  }

  return v11;
}

- (BOOL)_updateRootAccessorySettings
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  id v4 = [v3 settings];

  id v5 = HFLogForCategory(0x3AuLL);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
      uint64_t v8 = [(HFAccessorySettingAdapter *)self settings];
      int v11 = 138413058;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      BOOL v18 = v8;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Cycling settings object for homeKitSettingsVendor %@ / adapter %@ to settings '%@' from settings '%@'", (uint8_t *)&v11, 0x2Au);
    }
    [(HFAccessorySettingAdapter *)self _tearDownKeyPaths];
    objc_storeStrong((id *)&self->_settings, v4);
    BOOL v9 = [(HFAccessorySettingAdapter *)self _setupKeyPaths];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Settings aren't setup yet; aborting cycling settings...",
        (uint8_t *)&v11,
        2u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_setupKeyPaths
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(HFAccessorySettingAdapter *)self settings];

  if (v3)
  {
    id v4 = objc_opt_new();
    [(HFAccessorySettingAdapter *)self setWatchedSettings:v4];

    id v5 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = [(HFAccessorySettingAdapter *)self keyPaths];
      *(_DWORD *)buf = 138412546;
      id v24 = self;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "Setting up adapter '%@' to watch keypaths '%@'", buf, 0x16u);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [(HFAccessorySettingAdapter *)self keyPaths];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          uint64_t v12 = [(HFAccessorySettingAdapter *)self settings];
          __int16 v13 = objc_msgSend(v12, "hf_accessorySettingAtKeyPath:", v11);

          if (v13) {
            [(HFAccessorySettingAdapter *)self _watchSetting:v13];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    uint64_t v14 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = [(HFAccessorySettingAdapter *)self watchedSettings];
      *(_DWORD *)buf = 138412546;
      id v24 = self;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_debug_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEBUG, "Adapter '%@' setup with settings '%@'", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "Cannot setup keypaths; there are no accessory settings yet!",
        buf,
        2u);
    }
  }

  return v3 != 0;
}

- (id)_missingKeyPaths
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(HFAccessorySettingAdapter *)self watchedSettings];
  id v5 = [v4 allKeys];
  id v6 = [v3 setWithArray:v5];

  uint64_t v7 = [(HFAccessorySettingAdapter *)self keyPaths];
  uint64_t v8 = objc_msgSend(v7, "na_setByRemovingObjectsFromSet:", v6);

  return v8;
}

- (void)_setupMissingKeyPaths
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x21053EE50](self, a2);
  id v4 = [(HFAccessorySettingAdapter *)self settings];

  if (!v4)
  {
    uint64_t v8 = HFLogForCategory(0x3AuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Cannot setup missing keypaths; there are no accessory settings yet!";
    goto LABEL_6;
  }
  id v5 = [(HFAccessorySettingAdapter *)self settings];
  id v6 = [v5 rootGroup];
  uint64_t v7 = [v6 groups];
  if (![v7 count])
  {
    uint64_t v10 = [(HFAccessorySettingAdapter *)self settings];
    uint64_t v11 = [v10 rootGroup];
    uint64_t v12 = [v11 settings];
    uint64_t v13 = [v12 count];

    if (v13) {
      goto LABEL_8;
    }
    uint64_t v8 = HFLogForCategory(0x3AuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Cannot setup missing keypaths; Accessory Settings haven't finished populating yet!";
LABEL_6:
    _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    goto LABEL_37;
  }

LABEL_8:
  uint64_t v8 = [(HFAccessorySettingAdapter *)self _missingKeyPaths];
  uint64_t v14 = [v8 count];
  __int16 v15 = HFLogForCategory(0x3AuLL);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    v35 = v3;
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      id v41 = self;
      __int16 v42 = 2112;
      uint64_t v43 = v8;
      _os_log_debug_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEBUG, "Setting up adapter '%@' to watch any missing keypaths: '%@'", buf, 0x16u);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v34 = v8;
    __int16 v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(NSObject **)(*((void *)&v36 + 1) + 8 * v21);
          __int16 v23 = (void *)MEMORY[0x21053EE50]();
          id v24 = [(HFAccessorySettingAdapter *)self settings];
          __int16 v25 = objc_msgSend(v24, "hf_accessorySettingAtKeyPath:", v22);

          if (v25)
          {
            id v26 = [(HFAccessorySettingAdapter *)self watchedSettings];
            uint64_t v27 = [v25 keyPath];
            id v28 = [v26 objectForKey:v27];

            __int16 v29 = HFLogForCategory(0x3AuLL);
            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (v28)
            {
              if (v30)
              {
                *(_DWORD *)buf = 138412546;
                id v41 = self;
                __int16 v42 = 2112;
                uint64_t v43 = v25;
                _os_log_debug_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEBUG, "Adapter '%@' is already watching '%@'", buf, 0x16u);
              }
            }
            else
            {
              if (v30)
              {
                *(_DWORD *)buf = 138412546;
                id v41 = self;
                __int16 v42 = 2112;
                uint64_t v43 = v25;
                _os_log_debug_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEBUG, "Adapter '%@' is setting up missed setting '%@'", buf, 0x16u);
              }

              [(HFAccessorySettingAdapter *)self _watchSetting:v25];
              long long v32 = HFLogForCategory(0x3AuLL);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                id v41 = self;
                __int16 v42 = 2112;
                uint64_t v43 = v25;
                _os_log_debug_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEBUG, "Adapter '%@' is setting up missed setting '%@'", buf, 0x16u);
              }

              [(HFAccessorySettingAdapter *)self _reportUpdatedValueForSetting:v25];
            }
          }
          else
          {
            uint64_t v31 = HFLogForCategory(0x3AuLL);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v41 = self;
              __int16 v42 = 2112;
              uint64_t v43 = v22;
              _os_log_debug_impl(&dword_20B986000, v31, OS_LOG_TYPE_DEBUG, "Adapter '%@' cannot watch keypath '%@' -- doesn't exist in HomeKit?  Please file a radar if you're seeing this a lot.", buf, 0x16u);
            }
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v19);
    }

    __int16 v15 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [(HFAccessorySettingAdapter *)self watchedSettings];
      *(_DWORD *)buf = 138412802;
      id v41 = self;
      __int16 v42 = 2112;
      uint64_t v43 = v17;
      __int16 v44 = 2112;
      uint64_t v45 = v33;
      _os_log_debug_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEBUG, "Adapter '%@' setup missed keypaths '%@' with settings '%@'", buf, 0x20u);
    }
    uint64_t v8 = v34;
    v3 = v35;
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEBUG, "All keypaths accounted for!", buf, 2u);
  }

LABEL_37:
}

- (void)_tearDownKeyPaths
{
  v3 = [(HFAccessorySettingAdapter *)self watchedSettings];
  id v4 = (void *)[v3 copy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__HFAccessorySettingAdapter__tearDownKeyPaths__block_invoke;
  v8[3] = &unk_26408F968;
  v8[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v5 = [(HFAccessorySettingAdapter *)self watchedSettings];
  uint64_t v6 = [v5 count];

  if (v6) {
    NSLog(&cfstr_AfterTeardownT.isa);
  }
  uint64_t v7 = [(HFAccessorySettingAdapter *)self watchedSettings];
  [v7 removeAllObjects];
}

void __46__HFAccessorySettingAdapter__tearDownKeyPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 setting];
  [v3 _teardownSetting:v4];
}

- (void)_watchSetting:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Adapter '%@' started watching for '%@'", buf, 0x16u);
    }

    uint64_t v6 = [(HFAccessorySettingAdapter *)self keyPathStringToFuture];
    uint64_t v7 = [v4 keyPath];
    uint64_t v8 = [v6 objectForKey:v7];

    uint64_t v9 = [(HFAccessorySettingAdapter *)self settings];
    uint64_t v10 = +[_HFObservedAccessorySettingState stateWithSettings:v9 forSetting:v4];

    uint64_t v11 = [(HFAccessorySettingAdapter *)self watchedSettings];
    uint64_t v12 = [v4 keyPath];
    objc_msgSend(v11, "na_safeSetObject:forKey:", v10, v12);

    uint64_t v13 = [(HFAccessorySettingAdapter *)self keyPathStringToFuture];
    uint64_t v14 = [v4 keyPath];
    [v13 removeObjectForKey:v14];

    __int16 v15 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Adapter '%@' is setting up '%@' for first use...", buf, 0x16u);
    }

    BOOL v16 = [(HFAccessorySettingAdapter *)self _beginMonitoringSettingsKeyPath:v4];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __43__HFAccessorySettingAdapter__watchSetting___block_invoke;
    v19[3] = &unk_26408D260;
    void v19[4] = self;
    id v20 = v4;
    id v21 = v8;
    id v17 = v8;
    id v18 = (id)[v16 addCompletionBlock:v19];
  }
}

void __43__HFAccessorySettingAdapter__watchSetting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Adapter '%@' failed to setup setting '%@' for initial state with error '%@'", (uint8_t *)&v17, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = HFLogForCategory(0x3AuLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      int v17 = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Adapter '%@' is done setting up '%@'; firing watchFuture",
        (uint8_t *)&v17,
        0x16u);
    }

    [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 40)];
  }
  else
  {
    if (v10)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v17 = 138412546;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Adapter '%@' is done setting up '%@'!", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)_teardownSetting:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HFAccessorySettingAdapter *)self watchedSettings];
    id v6 = [v4 keyPath];
    [v5 removeObjectForKey:v6];

    uint64_t v7 = [(HFAccessorySettingAdapter *)self keyPathStringToFuture];
    uint64_t v8 = [v4 keyPath];
    [v7 removeObjectForKey:v8];

    uint64_t v9 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Adapter '%@' stopped watching for '%@'", (uint8_t *)&v11, 0x16u);
    }

    id v10 = [(HFAccessorySettingAdapter *)self _endMonitoringSettingsKeyPath:v4];
  }
}

- (void)_reportUpdatedValueForSetting:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 keyPath];
  id v6 = [(HFAccessorySettingAdapter *)self keyPaths];
  if ([v6 containsObject:v5])
  {
    uint64_t v7 = [(HFAccessorySettingAdapter *)self watchedSettings];
    uint64_t v8 = [v7 objectForKeyedSubscript:v5];
    uint64_t v9 = [v8 setting];
    char v10 = [v9 isEqual:v4];

    if (v10)
    {
      int v11 = [(HFAccessorySettingAdapter *)self valueManager];
      uint64_t v12 = [v11 valueForSetting:v4];

      __int16 v13 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412802;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_INFO, "Adapter '%@' received update to setting '%@': %@", (uint8_t *)&v17, 0x20u);
      }

      [(HFAccessorySettingAdapter *)self homeKitSettingWasUpdated:v4 value:v12];
      id v14 = [(HFAccessorySettingAdapter *)self updateHandler];

      if (v14)
      {
        uint64_t v15 = [(HFAccessorySettingAdapter *)self updateHandler];
        uint64_t v16 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
        ((void (*)(NSObject *, void *, id, NSObject *))v15[2].isa)(v15, v16, v4, v12);

LABEL_10:
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v12 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = [(HFAccessorySettingAdapter *)self keyPaths];
    int v17 = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v15;
    _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Adapter %@ does not watch for keyPath '%@'; this is a bug!  This adapter watches keypaths: %@",
      (uint8_t *)&v17,
      0x20u);
    goto LABEL_10;
  }
LABEL_11:
}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", a3);
}

- (id)_endMonitoringSettingsKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (NSMutableDictionary)watchedSettings
{
  return self->_watchedSettings;
}

- (void)setWatchedSettings:(id)a3
{
}

- (NSMutableDictionary)keyPathStringToFuture
{
  return self->_keyPathStringToFuture;
}

- (void)setKeyPathStringToFuture:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_keyPathStringToFuture, 0);
  objc_storeStrong((id *)&self->_watchedSettings, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_valueManager, 0);
}

+ (id)createDefaultHomeSettingAdapterCollectionForProfile:(id)a3
{
  id v3 = a3;
  id v4 = &unk_26C155B48;
  id v5 = v3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if ([v5 conformsToProtocol:v4]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v6;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    char v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    int v11 = NSStringFromProtocol((Protocol *)v4);
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v11 file lineNumber description];

LABEL_7:
    uint64_t v8 = 0;
  }

  uint64_t v12 = [v6 accessory];
  char v13 = [v12 isCurrentAccessory];

  if ((v13 & 1) == 0) {
    NSLog(&cfstr_Hfaccessoryset_24.isa);
  }
  id v14 = [v6 accessory];
  uint64_t v15 = [v14 category];
  uint64_t v16 = [v15 categoryType];
  char v17 = [v16 isEqual:*MEMORY[0x263F0B0A0]];

  if ((v17 & 1) == 0) {
    NSLog(&cfstr_Hfaccessoryset_25.isa);
  }
  uint64_t v18 = objc_alloc_init(HFAccessorySettingDefaultAdapterCollection);
  __int16 v19 = [[HFAccessorySettingManagedConfigurationAdapter alloc] initWithHomeKitSettingsVendor:v6 mode:1];
  [(HFAccessorySettingDefaultAdapterCollection *)v18 setManagedConfigurationAdapter:v19];

  id v20 = [[HFAccessorySettingSiriLanguageAdapter alloc] initWithHomeKitSettingsVendor:v6 mode:1];
  [(HFAccessorySettingDefaultAdapterCollection *)v18 setSiriLanguageAdapter:v20];

  return v18;
}

+ (id)createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:(id)a3
{
  id v3 = a3;
  id v4 = &unk_26C155B48;
  id v5 = v3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if ([v5 conformsToProtocol:v4]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v6;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    char v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    int v11 = NSStringFromProtocol((Protocol *)v4);
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v11 file lineNumber description];

LABEL_7:
    uint64_t v8 = 0;
  }

  uint64_t v12 = [v6 accessory];
  char v13 = [v12 isCurrentAccessory];

  if ((v13 & 1) == 0) {
    NSLog(&cfstr_SHfaccessoryse.isa, "+[HFAccessorySettingAdapter(SoundBoardAdditions) createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:]");
  }
  id v14 = [v6 accessory];
  uint64_t v15 = [v14 category];
  uint64_t v16 = [v15 categoryType];
  char v17 = [v16 isEqual:*MEMORY[0x263F0B0A0]];

  if ((v17 & 1) == 0) {
    NSLog(&cfstr_SHfaccessoryse_0.isa, "+[HFAccessorySettingAdapter(SoundBoardAdditions) createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:]");
  }
  uint64_t v18 = objc_alloc_init(HFAccessorySettingDefaultAdapterCollection);
  __int16 v19 = [[HFAccessorySettingManagedConfigurationAdapter alloc] initWithHomeKitSettingsVendor:v6 mode:1];
  [(HFAccessorySettingDefaultAdapterCollection *)v18 setManagedConfigurationAdapter:v19];

  id v20 = [[HFAccessorySettingSiriLanguageAdapter alloc] initWithHomeKitSettingsVendor:v6 mode:1];
  [(HFAccessorySettingDefaultAdapterCollection *)v18 setSiriLanguageAdapter:v20];

  return v18;
}

@end
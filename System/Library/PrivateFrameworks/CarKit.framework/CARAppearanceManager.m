@interface CARAppearanceManager
+ (id)_descriptionForAppearanceSetting:(int64_t)a3;
+ (int64_t)_carUserInterfaceStyleForAppearanceMode:(unint64_t)a3;
- (BOOL)effectiveGlobalNightMode;
- (BOOL)locationBasedNightMode;
- (BOOL)locationNightModeDisabled;
- (CARAppearanceManager)initWithScreens:(id)a3 initialSystemNightMode:(BOOL)a4 initialLocationBasedNightMode:(BOOL)a5 delegate:(id)a6;
- (CARAppearanceManagerDelegate)delegate;
- (NSArray)screens;
- (NSMutableDictionary)appearanceModeDictionary;
- (NSMutableDictionary)appearanceModeSettingDictionary;
- (NSMutableDictionary)currentEffectiveMapStyle;
- (NSMutableDictionary)currentEffectiveUIStyle;
- (NSMutableDictionary)mapAppearanceModeDictionary;
- (NSMutableDictionary)mapAppearanceModeSettingDictionary;
- (NSMutableDictionary)nightModeDictionary;
- (id)_mainScreenInfo;
- (id)_screenInfoForScreenUUID:(id)a3;
- (int64_t)effectiveStyleForMapAppearanceForScreenUUID:(id)a3;
- (int64_t)effectiveStyleForUIAppearanceForScreenUUID:(id)a3;
- (void)_resolveMapsStylesAndNotify:(BOOL)a3;
- (void)_resolveUIStylesAndNotify:(BOOL)a3;
- (void)_setInitialDisplayNightModeForScreen:(id)a3;
- (void)_setInitialMapAppearanceNumberForScreen:(id)a3;
- (void)_setInitialUIAppearanceNumberForScreen:(id)a3;
- (void)handleLocationBasedNightModeUpdate:(BOOL)a3;
- (void)handleMapAppearanceUpdateWithParameters:(id)a3;
- (void)handleNightModeUpdateWithParameters:(id)a3;
- (void)handleUIAppearanceUpdateWithParameters:(id)a3;
- (void)setAppearanceModeDictionary:(id)a3;
- (void)setAppearanceModeSettingDictionary:(id)a3;
- (void)setCurrentEffectiveMapStyle:(id)a3;
- (void)setCurrentEffectiveUIStyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableLocationNightMode;
- (void)setLocationBasedNightMode:(BOOL)a3;
- (void)setLocationNightModeDisabled:(BOOL)a3;
- (void)setMapAppearanceModeDictionary:(id)a3;
- (void)setMapAppearanceModeSettingDictionary:(id)a3;
- (void)setNightModeDictionary:(id)a3;
- (void)setScreens:(id)a3;
@end

@implementation CARAppearanceManager

- (CARAppearanceManager)initWithScreens:(id)a3 initialSystemNightMode:(BOOL)a4 initialLocationBasedNightMode:(BOOL)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)CARAppearanceManager;
  v12 = [(CARAppearanceManager *)&v37 init];
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    appearanceModeDictionary = v12->_appearanceModeDictionary;
    v12->_appearanceModeDictionary = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    appearanceModeSettingDictionary = v12->_appearanceModeSettingDictionary;
    v12->_appearanceModeSettingDictionary = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentEffectiveMapStyle = v12->_currentEffectiveMapStyle;
    v12->_currentEffectiveMapStyle = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentEffectiveUIStyle = v12->_currentEffectiveUIStyle;
    v12->_currentEffectiveUIStyle = v19;

    objc_storeWeak((id *)&v12->_delegate, v11);
    v12->_locationBasedNightMode = a5;
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapAppearanceModeDictionary = v12->_mapAppearanceModeDictionary;
    v12->_mapAppearanceModeDictionary = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapAppearanceModeSettingDictionary = v12->_mapAppearanceModeSettingDictionary;
    v12->_mapAppearanceModeSettingDictionary = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nightModeDictionary = v12->_nightModeDictionary;
    v12->_nightModeDictionary = v25;

    uint64_t v27 = [v10 copy];
    screens = v12->_screens;
    v12->_screens = (NSArray *)v27;

    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __102__CARAppearanceManager_initWithScreens_initialSystemNightMode_initialLocationBasedNightMode_delegate___block_invoke;
    v34 = &unk_1E5E3BDA0;
    v29 = v12;
    v35 = v29;
    BOOL v36 = a4;
    [v10 enumerateObjectsUsingBlock:&v31];
    -[CARAppearanceManager _resolveUIStylesAndNotify:](v29, "_resolveUIStylesAndNotify:", 0, v31, v32, v33, v34);
    [(CARAppearanceManager *)v29 _resolveMapsStylesAndNotify:0];
  }
  return v12;
}

void __102__CARAppearanceManager_initWithScreens_initialSystemNightMode_initialLocationBasedNightMode_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) nightModeDictionary];
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5 = [v6 identifier];
  [v3 setObject:v4 forKey:v5];

  if ([v6 supportsAppearanceMode]) {
    [*(id *)(a1 + 32) _setInitialUIAppearanceNumberForScreen:v6];
  }
  if ([v6 supportsPerDisplayNightMode] && objc_msgSend(v6, "screenType")) {
    [*(id *)(a1 + 32) _setInitialDisplayNightModeForScreen:v6];
  }
  if ([v6 supportsMapAppearanceMode]) {
    [*(id *)(a1 + 32) _setInitialMapAppearanceNumberForScreen:v6];
  }
}

- (int64_t)effectiveStyleForUIAppearanceForScreenUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CARAppearanceManager *)self currentEffectiveUIStyle];
  id v6 = [v5 objectForKey:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (int64_t)effectiveStyleForMapAppearanceForScreenUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CARAppearanceManager *)self currentEffectiveMapStyle];
  id v6 = [v5 objectForKey:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (BOOL)effectiveGlobalNightMode
{
  v2 = self;
  v3 = [(CARAppearanceManager *)self _mainScreenInfo];
  id v4 = [(CARAppearanceManager *)v2 nightModeDictionary];
  v5 = [v3 identifier];
  id v6 = [v4 objectForKey:v5];
  char v7 = [v6 BOOLValue];

  LOBYTE(v2) = [(CARAppearanceManager *)v2 locationBasedNightMode] | v7;
  return (char)v2;
}

- (void)handleNightModeUpdateWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"DisplayUUID"];
  if (!v5)
  {
    v5 = [v4 objectForKey:@"uuid"];
  }
  id v6 = [v4 objectForKey:@"IsNightMode"];
  char v7 = [(CARAppearanceManager *)self screens];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CARAppearanceManager_handleNightModeUpdateWithParameters___block_invoke;
  v10[3] = &unk_1E5E3BDC8;
  id v11 = v5;
  id v12 = v6;
  v13 = self;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateObjectsUsingBlock:v10];

  [(CARAppearanceManager *)self _resolveUIStylesAndNotify:1];
  [(CARAppearanceManager *)self _resolveMapsStylesAndNotify:1];
}

void __60__CARAppearanceManager_handleNightModeUpdateWithParameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
  }
  else
  {
    char v5 = [v3 supportsPerDisplayNightMode];

    if (v5) {
      goto LABEL_12;
    }
  }
  id v6 = CarAppearanceLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = *(void **)(a1 + 40);
    if (v7)
    {
      int v8 = [v7 BOOLValue];
      id v9 = @"NO";
      if (v8) {
        id v9 = @"YES";
      }
    }
    else
    {
      id v9 = @"unset";
    }
    int v13 = 138543618;
    id v14 = v3;
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "Updating night mode for screenInfo: %{public}@, night mode: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id v10 = [*(id *)(a1 + 48) nightModeDictionary];
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [v3 identifier];
  [v10 setObject:v11 forKey:v12];

LABEL_12:
}

- (void)handleUIAppearanceUpdateWithParameters:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 objectForKey:@"uuid"];
  id v6 = [(CARAppearanceManager *)self _screenInfoForScreenUUID:v5];
  if (([v6 supportsAppearanceMode] & 1) == 0)
  {
    int v13 = CarAppearanceLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CARAppearanceManager handleUIAppearanceUpdateWithParameters:]();
    }
    goto LABEL_17;
  }
  char v7 = [v4 objectForKey:@"appearanceMode"];

  if (v7)
  {
    int v8 = [v4 objectForKey:@"appearanceMode"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = [(id)objc_opt_class() _carUserInterfaceStyleForAppearanceMode:v9];
    uint64_t v11 = CarAppearanceLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v10];
      int v23 = 138543618;
      v24 = v6;
      __int16 v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "UI Appearance update for screen: %{public}@ has style: %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = -1;
  }
  id v14 = [v4 objectForKey:@"appearanceSetting"];

  if (!v14) {
    goto LABEL_15;
  }
  __int16 v15 = [v4 objectForKey:@"appearanceSetting"];
  unint64_t v16 = [v15 integerValue];

  uint64_t v17 = CarAppearanceLogging();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(id)objc_opt_class() _descriptionForAppearanceSetting:v16];
    int v23 = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_1ABB00000, v17, OS_LOG_TYPE_DEFAULT, "UI Appearance update for screen: %{public}@ has setting: %{public}@", (uint8_t *)&v23, 0x16u);
  }
  if ((unint64_t)(v10 - 1) > 1 || v16 > 2)
  {
LABEL_15:
    int v13 = CarAppearanceLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CARAppearanceManager handleUIAppearanceUpdateWithParameters:]();
    }
LABEL_17:

    goto LABEL_18;
  }
  v19 = [(CARAppearanceManager *)self appearanceModeDictionary];
  v20 = [NSNumber numberWithInteger:v10];
  [v19 setObject:v20 forKey:v5];

  v21 = [(CARAppearanceManager *)self appearanceModeSettingDictionary];
  v22 = [NSNumber numberWithInteger:v16];
  [v21 setObject:v22 forKey:v5];

  [(CARAppearanceManager *)self _resolveUIStylesAndNotify:1];
LABEL_18:
}

- (void)handleMapAppearanceUpdateWithParameters:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 objectForKey:@"uuid"];
  id v6 = [(CARAppearanceManager *)self _screenInfoForScreenUUID:v5];
  if (([v6 supportsMapAppearanceMode] & 1) == 0)
  {
    int v13 = CarAppearanceLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CARAppearanceManager handleMapAppearanceUpdateWithParameters:]();
    }
    goto LABEL_17;
  }
  char v7 = [v4 objectForKey:@"appearanceMode"];

  if (v7)
  {
    int v8 = [v4 objectForKey:@"appearanceMode"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = [(id)objc_opt_class() _carUserInterfaceStyleForAppearanceMode:v9];
    uint64_t v11 = CarAppearanceLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v10];
      int v23 = 138543618;
      v24 = v6;
      __int16 v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "Map Appearance update for screen: %{public}@ has style: %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = -1;
  }
  id v14 = [v4 objectForKey:@"appearanceSetting"];

  if (!v14) {
    goto LABEL_15;
  }
  __int16 v15 = [v4 objectForKey:@"appearanceSetting"];
  unint64_t v16 = [v15 integerValue];

  uint64_t v17 = CarAppearanceLogging();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(id)objc_opt_class() _descriptionForAppearanceSetting:v16];
    int v23 = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_1ABB00000, v17, OS_LOG_TYPE_DEFAULT, "Map Appearance update for screen: %{public}@ has setting: %{public}@", (uint8_t *)&v23, 0x16u);
  }
  if ((unint64_t)(v10 - 1) > 1 || v16 > 2)
  {
LABEL_15:
    int v13 = CarAppearanceLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CARAppearanceManager handleMapAppearanceUpdateWithParameters:]();
    }
LABEL_17:

    goto LABEL_18;
  }
  v19 = [(CARAppearanceManager *)self mapAppearanceModeDictionary];
  v20 = [NSNumber numberWithInteger:v10];
  [v19 setObject:v20 forKey:v5];

  v21 = [(CARAppearanceManager *)self mapAppearanceModeSettingDictionary];
  v22 = [NSNumber numberWithInteger:v16];
  [v21 setObject:v22 forKey:v5];

  [(CARAppearanceManager *)self _resolveMapsStylesAndNotify:1];
LABEL_18:
}

- (void)handleLocationBasedNightModeUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v5 = CarAppearanceLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromBOOL();
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Location night mode update: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(CARAppearanceManager *)self setLocationBasedNightMode:v3];
  [(CARAppearanceManager *)self _resolveUIStylesAndNotify:1];
  [(CARAppearanceManager *)self _resolveMapsStylesAndNotify:1];
}

- (void)setDisableLocationNightMode
{
  BOOL v3 = CarAppearanceLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "Disabling location night mode, further updates will be ignored", v4, 2u);
  }

  [(CARAppearanceManager *)self setLocationNightModeDisabled:1];
  [(CARAppearanceManager *)self _resolveUIStylesAndNotify:0];
  [(CARAppearanceManager *)self _resolveMapsStylesAndNotify:0];
}

- (BOOL)locationBasedNightMode
{
  if (![(CARAppearanceManager *)self locationNightModeDisabled]) {
    return self->_locationBasedNightMode;
  }
  BOOL v3 = CarAppearanceLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "Location night mode is disabled, ignoring actual value", v5, 2u);
  }

  return 0;
}

+ (int64_t)_carUserInterfaceStyleForAppearanceMode:(unint64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 1) {
    int64_t v3 = -1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 1;
  }
}

- (id)_screenInfoForScreenUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__6;
  unint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  char v5 = [(CARAppearanceManager *)self screens];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CARAppearanceManager__screenInfoForScreenUUID___block_invoke;
  v9[3] = &unk_1E5E3B4D0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__CARAppearanceManager__screenInfoForScreenUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_mainScreenInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v2 = [(CARAppearanceManager *)self screens];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CARAppearanceManager__mainScreenInfo__block_invoke;
  v5[3] = &unk_1E5E3BDF0;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__CARAppearanceManager__mainScreenInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (![v7 screenType])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_setInitialDisplayNightModeForScreen:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 screenInfoResponse];
  uint64_t v6 = [v5 objectForKey:@"nightMode"];

  if (v6)
  {
    id v7 = [v5 objectForKey:@"nightMode"];
    uint64_t v8 = [v7 BOOLValue];

    id v9 = CarAppearanceLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromBOOL();
      int v14 = 138543618;
      __int16 v15 = v10;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_DEFAULT, "Screen has nightMode key with value: %{public}@ for screenInfo: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    id v11 = [(CARAppearanceManager *)self nightModeDictionary];
    uint64_t v12 = [NSNumber numberWithBool:v8];
    int v13 = [v4 identifier];
    [v11 setObject:v12 forKey:v13];
  }
}

- (void)_setInitialUIAppearanceNumberForScreen:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 screenInfoResponse];
  uint64_t v6 = [v5 objectForKey:@"uiAppearanceMode"];
  if (v6
    && (id v7 = (void *)v6,
        [v5 objectForKey:@"uiAppearanceSetting"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = CarAppearanceLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      uint64_t v27 = (uint64_t)v4;
      _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_DEFAULT, "Screen has appearanceMode key: %{public}@", (uint8_t *)&v26, 0xCu);
    }

    id v10 = objc_opt_class();
    id v11 = [v5 objectForKey:@"uiAppearanceMode"];
    uint64_t v12 = objc_msgSend(v10, "_carUserInterfaceStyleForAppearanceMode:", objc_msgSend(v11, "unsignedIntegerValue"));

    int v13 = [v5 objectForKey:@"uiAppearanceSetting"];
    unint64_t v14 = [v13 integerValue];

    __int16 v15 = CarAppearanceLogging();
    __int16 v16 = v15;
    if ((unint64_t)(v12 - 1) > 1 || v14 > 2)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v26 = 134349570;
        uint64_t v27 = v12;
        __int16 v28 = 2050;
        unint64_t v29 = v14;
        __int16 v30 = 2112;
        id v31 = v4;
        _os_log_fault_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_FAULT, "Invalid initial style (%{public}lu), setting (%{public}lu) for screenInfo: %@", (uint8_t *)&v26, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v12];
        v20 = [(id)objc_opt_class() _descriptionForAppearanceSetting:v14];
        int v26 = 138543874;
        uint64_t v27 = (uint64_t)v19;
        __int16 v28 = 2114;
        unint64_t v29 = (unint64_t)v20;
        __int16 v30 = 2114;
        id v31 = v4;
        _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_DEFAULT, "Initial ui appearance style is: %{public}@, setting: %{public}@, for screenInfo: %{public}@", (uint8_t *)&v26, 0x20u);
      }
      v21 = [(CARAppearanceManager *)self appearanceModeDictionary];
      v22 = [NSNumber numberWithInteger:v12];
      int v23 = [v4 identifier];
      [v21 setObject:v22 forKey:v23];

      __int16 v16 = [(CARAppearanceManager *)self appearanceModeSettingDictionary];
      v24 = [NSNumber numberWithInteger:v14];
      __int16 v25 = [v4 identifier];
      [v16 setObject:v24 forKey:v25];
    }
  }
  else
  {
    __int16 v16 = CarAppearanceLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      uint64_t v27 = (uint64_t)v4;
      _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_DEFAULT, "No initial appearance mode for screenInfo: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)_setInitialMapAppearanceNumberForScreen:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 screenInfoResponse];
  uint64_t v6 = [v5 objectForKey:@"mapAppearanceMode"];
  if (v6
    && (id v7 = (void *)v6,
        [v5 objectForKey:@"mapAppearanceSetting"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = CarAppearanceLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      uint64_t v27 = (uint64_t)v4;
      _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_DEFAULT, "Screen has mapAppearanceMode key: %{public}@", (uint8_t *)&v26, 0xCu);
    }

    id v10 = objc_opt_class();
    id v11 = [v5 objectForKey:@"mapAppearanceMode"];
    uint64_t v12 = objc_msgSend(v10, "_carUserInterfaceStyleForAppearanceMode:", objc_msgSend(v11, "unsignedIntegerValue"));

    int v13 = [v5 objectForKey:@"mapAppearanceSetting"];
    unint64_t v14 = [v13 integerValue];

    __int16 v15 = CarAppearanceLogging();
    __int16 v16 = v15;
    if ((unint64_t)(v12 - 1) > 1 || v14 > 2)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v26 = 134349570;
        uint64_t v27 = v12;
        __int16 v28 = 2050;
        unint64_t v29 = v14;
        __int16 v30 = 2114;
        id v31 = v4;
        _os_log_fault_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_FAULT, "Invalid initial map appearance style (%{public}lu), setting (%{public}lu) for screenInfo: %{public}@", (uint8_t *)&v26, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v12];
        v20 = [(id)objc_opt_class() _descriptionForAppearanceSetting:v14];
        int v26 = 138543874;
        uint64_t v27 = (uint64_t)v19;
        __int16 v28 = 2114;
        unint64_t v29 = (unint64_t)v20;
        __int16 v30 = 2114;
        id v31 = v4;
        _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_DEFAULT, "Initial map appearance style is: %{public}@, setting: %{public}@, for screenInfo: %{public}@", (uint8_t *)&v26, 0x20u);
      }
      v21 = [(CARAppearanceManager *)self mapAppearanceModeDictionary];
      v22 = [NSNumber numberWithInteger:v12];
      int v23 = [v4 identifier];
      [v21 setObject:v22 forKey:v23];

      __int16 v16 = [(CARAppearanceManager *)self mapAppearanceModeSettingDictionary];
      v24 = [NSNumber numberWithInteger:v14];
      __int16 v25 = [v4 identifier];
      [v16 setObject:v24 forKey:v25];
    }
  }
  else
  {
    __int16 v16 = CarAppearanceLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      uint64_t v27 = (uint64_t)v4;
      _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_DEFAULT, "No initial map appearance mode for screenInfo: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)_resolveUIStylesAndNotify:(BOOL)a3
{
  char v5 = [(CARAppearanceManager *)self screens];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CARAppearanceManager__resolveUIStylesAndNotify___block_invoke;
  v6[3] = &unk_1E5E3BDA0;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __50__CARAppearanceManager__resolveUIStylesAndNotify___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v3 = [v38 identifier];
  id v4 = [*(id *)(a1 + 32) currentEffectiveUIStyle];
  char v5 = [v4 objectForKey:v3];
  uint64_t v6 = [v5 integerValue];

  int v7 = [*(id *)(a1 + 32) locationBasedNightMode];
  uint64_t v8 = [*(id *)(a1 + 32) nightModeDictionary];
  id v9 = [v8 objectForKey:v3];
  int v10 = [v9 BOOLValue];

  int v11 = v10 | v7;
  uint64_t v12 = [*(id *)(a1 + 32) appearanceModeDictionary];
  int v13 = [v12 objectForKey:v3];

  unint64_t v14 = [*(id *)(a1 + 32) appearanceModeSettingDictionary];
  __int16 v15 = [v14 objectForKey:v3];

  uint64_t v16 = [v15 integerValue];
  v39 = v13;
  if (v13 && v15)
  {
    uint64_t v17 = [v13 integerValue];
    if (v16) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v17 == 1;
    }
    int v19 = v18;
    uint64_t v20 = 1;
    if (v7) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
    if (v11) {
      uint64_t v20 = 2;
    }
    v22 = v15;
    if (v17 == -1) {
      uint64_t v17 = v20;
    }
  }
  else
  {
    v22 = v15;
    int v19 = 0;
    if (v7) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
    if (v11) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
  }
  uint64_t v23 = v6;
  if (v19) {
    uint64_t v24 = v21;
  }
  else {
    uint64_t v24 = v17;
  }
  __int16 v25 = CarAppearanceLogging();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v24];
    uint64_t v27 = [(id)objc_opt_class() _descriptionForAppearanceSetting:v16];
    __int16 v28 = NSStringFromBOOL();
    unint64_t v29 = NSStringFromBOOL();
    *(_DWORD *)buf = 138544642;
    v42 = v26;
    __int16 v43 = 2114;
    id v44 = v38;
    __int16 v45 = 2114;
    v46 = v39;
    __int16 v47 = 2114;
    v48 = v27;
    __int16 v49 = 2114;
    v50 = v28;
    __int16 v51 = 2114;
    v52 = v29;
    _os_log_impl(&dword_1ABB00000, v25, OS_LOG_TYPE_DEFAULT, "Resolved ui style: %{public}@ for screen: %{public}@ with ui appearance value: %{public}@, appearance setting: %{public}@, location night mode: %{public}@, display night mode: %{public}@", buf, 0x3Eu);
  }
  if (v24 != v23)
  {
    __int16 v30 = CarAppearanceLogging();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v24];
      uint64_t v32 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543618;
      v42 = v31;
      __int16 v43 = 2114;
      id v44 = v32;
      _os_log_impl(&dword_1ABB00000, v30, OS_LOG_TYPE_DEFAULT, "UI Style has been updated, setting effective style to %{public}@, will notify: %{public}@", buf, 0x16u);
    }
    v33 = [*(id *)(a1 + 32) currentEffectiveUIStyle];
    v34 = [NSNumber numberWithInteger:v24];
    [v33 setObject:v34 forKey:v3];

    if (*(unsigned char *)(a1 + 40))
    {
      v35 = [*(id *)(a1 + 32) delegate];
      uint64_t v36 = *(void *)(a1 + 32);
      v40 = v3;
      objc_super v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v35 appearanceManager:v36 didUpdateUIAppearanceStyle:v24 forScreenUUIDs:v37];
    }
  }
  [*(id *)(a1 + 32) _resolveMapsStylesAndNotify:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_resolveMapsStylesAndNotify:(BOOL)a3
{
  char v5 = [(CARAppearanceManager *)self screens];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__CARAppearanceManager__resolveMapsStylesAndNotify___block_invoke;
  v6[3] = &unk_1E5E3BDA0;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __52__CARAppearanceManager__resolveMapsStylesAndNotify___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  char v5 = [*(id *)(a1 + 32) currentEffectiveMapStyle];
  uint64_t v6 = [v5 objectForKey:v4];
  uint64_t v35 = [v6 integerValue];

  int v7 = [*(id *)(a1 + 32) locationBasedNightMode];
  uint64_t v8 = [*(id *)(a1 + 32) nightModeDictionary];
  id v9 = [v8 objectForKey:v4];
  int v10 = [v9 BOOLValue];

  int v11 = v10 | v7;
  uint64_t v12 = [*(id *)(a1 + 32) mapAppearanceModeDictionary];
  int v13 = [v12 objectForKey:v4];

  unint64_t v14 = [*(id *)(a1 + 32) mapAppearanceModeSettingDictionary];
  __int16 v15 = [v14 objectForKey:v4];

  if (v13 && v15)
  {
    uint64_t v16 = [v13 integerValue];
    uint64_t v17 = v16;
    uint64_t v18 = 1;
    if (v11) {
      uint64_t v18 = 2;
    }
    if (v16 == -1) {
      uint64_t v17 = v18;
    }
  }
  else if (v11)
  {
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v17 = 1;
  }
  if (v17 == 2)
  {
    int v19 = [*(id *)(a1 + 32) currentEffectiveUIStyle];
    uint64_t v20 = [v19 objectForKey:v4];
    uint64_t v21 = [v20 integerValue];

    if (v21 == 1)
    {
      v22 = CarAppearanceLogging();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB00000, v22, OS_LOG_TYPE_DEFAULT, "Map Style is dark but ui appearance is light, setting effective map style light to match", buf, 2u);
      }

      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v17 = 2;
    }
  }
  uint64_t v23 = CarAppearanceLogging();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v17];
    __int16 v25 = NSStringFromBOOL();
    int v26 = NSStringFromBOOL();
    *(_DWORD *)buf = 138544386;
    id v38 = v24;
    __int16 v39 = 2114;
    id v40 = v3;
    __int16 v41 = 2114;
    v42 = v13;
    __int16 v43 = 2114;
    id v44 = v25;
    __int16 v45 = 2114;
    v46 = v26;
    _os_log_impl(&dword_1ABB00000, v23, OS_LOG_TYPE_DEFAULT, "Resolved map style: %{public}@ for screen: %{public}@ with ui appearance value: %{public}@, location night mode: %{public}@, display night mode: %{public}@", buf, 0x34u);
  }
  if (v17 != v35)
  {
    uint64_t v27 = CarAppearanceLogging();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:v17];
      unint64_t v29 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543618;
      id v38 = v28;
      __int16 v39 = 2114;
      id v40 = v29;
      _os_log_impl(&dword_1ABB00000, v27, OS_LOG_TYPE_DEFAULT, "Map Style has been updated, setting effective style to %{public}@, will notify: %{public}@", buf, 0x16u);
    }
    __int16 v30 = [*(id *)(a1 + 32) currentEffectiveMapStyle];
    id v31 = [NSNumber numberWithInteger:v17];
    [v30 setObject:v31 forKey:v4];

    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v32 = [*(id *)(a1 + 32) delegate];
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v36 = v4;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      [v32 appearanceManager:v33 didUpdateMapAppearanceStyle:v17 forScreenUUIDs:v34];
    }
  }
}

+ (id)_descriptionForAppearanceSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5E3BE10[a3];
  }
}

- (CARAppearanceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CARAppearanceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)screens
{
  return self->_screens;
}

- (void)setScreens:(id)a3
{
}

- (NSMutableDictionary)appearanceModeDictionary
{
  return self->_appearanceModeDictionary;
}

- (void)setAppearanceModeDictionary:(id)a3
{
}

- (NSMutableDictionary)appearanceModeSettingDictionary
{
  return self->_appearanceModeSettingDictionary;
}

- (void)setAppearanceModeSettingDictionary:(id)a3
{
}

- (NSMutableDictionary)mapAppearanceModeDictionary
{
  return self->_mapAppearanceModeDictionary;
}

- (void)setMapAppearanceModeDictionary:(id)a3
{
}

- (NSMutableDictionary)mapAppearanceModeSettingDictionary
{
  return self->_mapAppearanceModeSettingDictionary;
}

- (void)setMapAppearanceModeSettingDictionary:(id)a3
{
}

- (NSMutableDictionary)nightModeDictionary
{
  return self->_nightModeDictionary;
}

- (void)setNightModeDictionary:(id)a3
{
}

- (NSMutableDictionary)currentEffectiveUIStyle
{
  return self->_currentEffectiveUIStyle;
}

- (void)setCurrentEffectiveUIStyle:(id)a3
{
}

- (NSMutableDictionary)currentEffectiveMapStyle
{
  return self->_currentEffectiveMapStyle;
}

- (void)setCurrentEffectiveMapStyle:(id)a3
{
}

- (void)setLocationBasedNightMode:(BOOL)a3
{
  self->_locationBasedNightMode = a3;
}

- (BOOL)locationNightModeDisabled
{
  return self->_locationNightModeDisabled;
}

- (void)setLocationNightModeDisabled:(BOOL)a3
{
  self->_locationNightModeDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEffectiveMapStyle, 0);
  objc_storeStrong((id *)&self->_currentEffectiveUIStyle, 0);
  objc_storeStrong((id *)&self->_nightModeDictionary, 0);
  objc_storeStrong((id *)&self->_mapAppearanceModeSettingDictionary, 0);
  objc_storeStrong((id *)&self->_mapAppearanceModeDictionary, 0);
  objc_storeStrong((id *)&self->_appearanceModeSettingDictionary, 0);
  objc_storeStrong((id *)&self->_appearanceModeDictionary, 0);
  objc_storeStrong((id *)&self->_screens, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handleUIAppearanceUpdateWithParameters:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1ABB00000, v0, v1, "UI Appearance update has invalid style for screen: %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleUIAppearanceUpdateWithParameters:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1ABB00000, v0, v1, "Screen does not support ui appearance, ignoring update: %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleMapAppearanceUpdateWithParameters:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1ABB00000, v0, v1, "Map Appearance update has invalid style for screen: %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleMapAppearanceUpdateWithParameters:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1ABB00000, v0, v1, "Screen does not support map appearance, ignoring update: %{public}@", v2, v3, v4, v5, v6);
}

@end
@interface CSLPRFStingConfiguration
- (BOOL)isActionNone;
- (BOOL)isActionSet;
- (BOOL)isEnabled;
- (CSLPRFStingConfiguration)init;
- (CSLPRFStingConfiguration)initWithDelegate:(id)a3;
- (CSLPRFStingConfigurationDelegate)delegate;
- (NSString)bundleID;
- (NSString)description;
- (NSString)workoutIdentifier;
- (id)_lock_settingsDictionary;
- (int64_t)source;
- (unint64_t)actionType;
- (void)_withLock:(id)a3;
- (void)depthAutoLaunchAppSettingDidUpdate:(id)a3;
- (void)reset;
- (void)setActionType:(unint64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setConfigurationForBundleID:(id)a3 actionType:(unint64_t)a4 identifier:(id)a5 source:(int64_t)a6;
- (void)setDelegate:(id)a3;
- (void)setExpectedConfigurationForAction:(unint64_t)a3 source:(int64_t)a4;
- (void)setSource:(int64_t)a3;
- (void)setWorkoutIdentifier:(id)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFStingConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationHistory, 0);
  objc_storeStrong((id *)&self->_depthSetting, 0);
  objc_storeStrong((id *)&self->_stingConfigurationSetting, 0);
}

- (CSLPRFStingConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFStingConfigurationDelegate *)WeakRetained;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(CSLPRFStingConfiguration *)self bundleID];
  [v3 appendString:v4 withName:@"bundleID"];

  unint64_t v5 = [(CSLPRFStingConfiguration *)self actionType];
  if (v5 - 1 > 0x28) {
    v6 = 0;
  }
  else {
    v6 = off_264A0AC28[v5 - 1];
  }
  v7 = v6;
  [v3 appendString:v7 withName:@"actionType"];

  v8 = [(CSLPRFStingConfiguration *)self workoutIdentifier];
  [v3 appendString:v8 withName:@"workoutIdentifier"];

  unint64_t v9 = [(CSLPRFStingConfiguration *)self source] - 1;
  if (v9 > 5) {
    v10 = @"setup";
  }
  else {
    v10 = off_264A0B710[v9];
  }
  [v3 appendString:v10 withName:@"source"];
  v11 = [v3 build];

  return (NSString *)v11;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)_lock_settingsDictionary
{
  v2 = [(CSLPRFTwoWaySyncSetting *)self->_stingConfigurationSetting value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = objc_alloc_init(NSDictionary);
  }
  v4 = v3;

  return v4;
}

- (void)reset
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__CSLPRFStingConfiguration_reset__block_invoke;
  v4[3] = &unk_264A0BA38;
  v4[4] = self;
  [(CSLPRFStingConfiguration *)self _withLock:v4];
  id v3 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v6 = "-[CSLPRFStingConfiguration reset]";
    __int16 v7 = 2113;
    v8 = self;
    _os_log_impl(&dword_22F4EA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s reset stingConfigurationSetting to %{private}@", buf, 0x16u);
  }
}

void __33__CSLPRFStingConfiguration_reset__block_invoke(uint64_t a1)
{
  id v2 = [NSDictionary dictionary];
  [*(id *)(*(void *)(a1 + 32) + 16) setValue:v2];
}

- (void)setSource:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__CSLPRFStingConfiguration_setSource___block_invoke;
  v3[3] = &unk_264A0B6A0;
  v3[4] = self;
  v3[5] = a3;
  [(CSLPRFStingConfiguration *)self _withLock:v3];
}

void __38__CSLPRFStingConfiguration_setSource___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (void *)[v2 mutableCopy];

  v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v3 setObject:v4 forKeyedSubscript:@"source"];

  unint64_t v5 = (void *)[v3 copy];
  [*(id *)(*(void *)(a1 + 32) + 16) setValue:v5];

  v6 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
    int v8 = 136446467;
    uint64_t v9 = "-[CSLPRFStingConfiguration setSource:]_block_invoke";
    __int16 v10 = 2113;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22F4EA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s set stingConfigurationSetting to %{private}@", (uint8_t *)&v8, 0x16u);
  }
}

- (int64_t)source
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__CSLPRFStingConfiguration_source__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  void v4[5] = &v5;
  [(CSLPRFStingConfiguration *)self _withLock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CSLPRFStingConfiguration_source__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v2 = [v3 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
  }
}

- (void)setWorkoutIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CSLPRFStingConfiguration_setWorkoutIdentifier___block_invoke;
  v6[3] = &unk_264A0BCA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CSLPRFStingConfiguration *)self _withLock:v6];
}

void __49__CSLPRFStingConfiguration_setWorkoutIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"workoutIdentifier"];
  id v4 = (void *)[v3 copy];
  [*(id *)(*(void *)(a1 + 32) + 16) setValue:v4];

  id v5 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136446467;
    uint64_t v8 = "-[CSLPRFStingConfiguration setWorkoutIdentifier:]_block_invoke";
    __int16 v9 = 2113;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s set stingConfigurationSetting to %{private}@", (uint8_t *)&v7, 0x16u);
  }
}

- (NSString)workoutIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__3789;
  __int16 v9 = __Block_byref_object_dispose__3790;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CSLPRFStingConfiguration_workoutIdentifier__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  void v4[5] = &v5;
  [(CSLPRFStingConfiguration *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __45__CSLPRFStingConfiguration_workoutIdentifier__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 objectForKeyedSubscript:@"workoutIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  }
}

- (BOOL)isActionNone
{
  return [(CSLPRFStingConfiguration *)self actionType] == 18;
}

- (BOOL)isActionSet
{
  return [(CSLPRFStingConfiguration *)self actionType] != 0;
}

- (void)setConfigurationForBundleID:(id)a3 actionType:(unint64_t)a4 identifier:(id)a5 source:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__CSLPRFStingConfiguration_setConfigurationForBundleID_actionType_identifier_source___block_invoke;
  v14[3] = &unk_264A0B6F0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  unint64_t v17 = a4;
  int64_t v18 = a6;
  id v12 = v11;
  id v13 = v10;
  [(CSLPRFStingConfiguration *)self _withLock:v14];
}

void __85__CSLPRFStingConfiguration_setConfigurationForBundleID_actionType_identifier_source___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (void *)[v2 mutableCopy];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == 24 || v5 == 20)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __85__CSLPRFStingConfiguration_setConfigurationForBundleID_actionType_identifier_source___block_invoke_2;
    v16[3] = &unk_264A0B6C8;
    id v17 = *(id *)(a1 + 40);
    [v7 updateSettingsWithBlock:v16];
  }
  else
  {
    [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"bundleID"];
  }
  unint64_t v8 = *(void *)(a1 + 56) - 1;
  if (v8 > 0x28) {
    __int16 v9 = 0;
  }
  else {
    __int16 v9 = off_264A0AC28[v8];
  }
  id v10 = v9;
  [v4 setObject:v10 forKeyedSubscript:@"action"];

  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"workoutIdentifier"];
  id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v4 setObject:v11 forKeyedSubscript:@"source"];

  if ([v4 isEqual:v2])
  {
    cslprf_sting_settings_log();
    id v12 = (CSLPRFStingConfigurationHistoryItem *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F4EA000, &v12->super, OS_LOG_TYPE_INFO, "setConfigurationForBundleID: stingConfigurationSetting did not change", buf, 2u);
    }
  }
  else
  {
    id v13 = (void *)[v4 copy];
    [*(id *)(*(void *)(a1 + 32) + 16) setValue:v13];

    v14 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138477827;
      uint64_t v19 = v15;
      _os_log_impl(&dword_22F4EA000, v14, OS_LOG_TYPE_DEFAULT, "setConfigurationForBundleID: set stingConfigurationSetting to %{private}@", buf, 0xCu);
    }

    id v12 = [[CSLPRFStingConfigurationHistoryItem alloc] initWithBundleID:*(void *)(a1 + 40) actionType:*(void *)(a1 + 56) identifier:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 32) addHistoryItem:v12];
  }
}

void __85__CSLPRFStingConfiguration_setConfigurationForBundleID_actionType_identifier_source___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setBundleID:v2];
  [v3 setChangeSource:2];
}

- (void)setExpectedConfigurationForAction:(unint64_t)a3 source:(int64_t)a4
{
  id v9 = [(CSLPRFStingConfigurationHistory *)self->_configurationHistory itemForActionType:a3];
  uint64_t v6 = [v9 bundleID];
  uint64_t v7 = [v9 linkActionType];
  unint64_t v8 = [v9 identifier];
  [(CSLPRFStingConfiguration *)self setConfigurationForBundleID:v6 actionType:v7 identifier:v8 source:a4];
}

- (void)setBundleID:(id)a3
{
  id v4 = a3;
  if ([(CSLPRFStingConfiguration *)self actionType] == 20
    || [(CSLPRFStingConfiguration *)self actionType] == 24)
  {
    depthSetting = self->_depthSetting;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__CSLPRFStingConfiguration_setBundleID___block_invoke;
    v11[3] = &unk_264A0B6C8;
    id v12 = v4;
    id v6 = v4;
    [(CSLPRFDepthAutoLaunchAppSetting *)depthSetting updateSettingsWithBlock:v11];
    uint64_t v7 = v12;
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__CSLPRFStingConfiguration_setBundleID___block_invoke_2;
    v9[3] = &unk_264A0BCA8;
    v9[4] = self;
    id v10 = v4;
    id v8 = v4;
    [(CSLPRFStingConfiguration *)self _withLock:v9];
    uint64_t v7 = v10;
  }
}

void __40__CSLPRFStingConfiguration_setBundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setBundleID:v2];
  [v3 setChangeSource:2];
}

void __40__CSLPRFStingConfiguration_setBundleID___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"bundleID"];
  id v4 = (void *)[v3 copy];
  [*(id *)(*(void *)(a1 + 32) + 16) setValue:v4];

  uint64_t v5 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136446467;
    id v8 = "-[CSLPRFStingConfiguration setBundleID:]_block_invoke_2";
    __int16 v9 = 2113;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s set stingConfigurationSetting to %{private}@", (uint8_t *)&v7, 0x16u);
  }
}

- (NSString)bundleID
{
  if ([(CSLPRFStingConfiguration *)self actionType] == 20
    || [(CSLPRFStingConfiguration *)self actionType] == 24)
  {
    id v3 = [(CSLPRFDepthAutoLaunchAppSetting *)self->_depthSetting settings];
    id v4 = [v3 bundleID];
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy__3789;
    uint64_t v11 = __Block_byref_object_dispose__3790;
    id v12 = 0;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__CSLPRFStingConfiguration_bundleID__block_invoke;
    v6[3] = &unk_264A0BC58;
    v6[4] = self;
    void v6[5] = &v7;
    [(CSLPRFStingConfiguration *)self _withLock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return (NSString *)v4;
}

void __36__CSLPRFStingConfiguration_bundleID__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v3 objectForKeyedSubscript:@"bundleID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  }
}

- (void)setActionType:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__CSLPRFStingConfiguration_setActionType___block_invoke;
  v3[3] = &unk_264A0B6A0;
  v3[4] = self;
  v3[5] = a3;
  [(CSLPRFStingConfiguration *)self _withLock:v3];
}

void __42__CSLPRFStingConfiguration_setActionType___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (void *)[v2 mutableCopy];

  unint64_t v4 = *(void *)(a1 + 40) - 1;
  if (v4 > 0x28) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_264A0AC28[v4];
  }
  uint64_t v6 = v5;
  [v3 setObject:v6 forKeyedSubscript:@"action"];

  uint64_t v7 = (void *)[v3 copy];
  [*(id *)(*(void *)(a1 + 32) + 16) setValue:v7];

  id v8 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
    int v10 = 136446467;
    uint64_t v11 = "-[CSLPRFStingConfiguration setActionType:]_block_invoke";
    __int16 v12 = 2113;
    uint64_t v13 = v9;
    _os_log_impl(&dword_22F4EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s set stingConfigurationSetting to %{private}@", (uint8_t *)&v10, 0x16u);
  }
}

- (unint64_t)actionType
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__CSLPRFStingConfiguration_actionType__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  void v4[5] = &v5;
  [(CSLPRFStingConfiguration *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __38__CSLPRFStingConfiguration_actionType__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_settingsDictionary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v2 = [v3 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CSLIdentifierToLinkActionType(v2);
  }
}

- (void)depthAutoLaunchAppSettingDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CSLPRFStingConfiguration_depthAutoLaunchAppSettingDidUpdate___block_invoke;
  block[3] = &unk_264A0B678;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__CSLPRFStingConfiguration_depthAutoLaunchAppSettingDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained delegate];
  [v3 stingConfigurationDidUpdate:WeakRetained];

  id v4 = cslprf_settings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[CSLPRFStingConfiguration depthAutoLaunchAppSettingDidUpdate:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_22F4EA000, v4, OS_LOG_TYPE_INFO, "%s: %@ setting did update %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CSLPRFStingConfiguration_twoWaySyncSettingDidUpdate___block_invoke;
  block[3] = &unk_264A0B678;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__CSLPRFStingConfiguration_twoWaySyncSettingDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained delegate];
  [v3 stingConfigurationDidUpdate:WeakRetained];

  id v4 = cslprf_settings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[CSLPRFStingConfiguration twoWaySyncSettingDidUpdate:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_22F4EA000, v4, OS_LOG_TYPE_INFO, "%s: %@ setting did update %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFStingConfiguration)initWithDelegate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSLPRFStingConfiguration;
  uint64_t v5 = [(CSLPRFStingConfiguration *)&v16 init];
  int v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"StingSettingsConfiguration" defaultValue:0 notification:"CSLPRFStingConfigurationChangedNotification"];
    stingConfigurationSetting = v6->_stingConfigurationSetting;
    v6->_stingConfigurationSetting = v7;

    id v9 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v6->_stingConfigurationSetting;
      *(_DWORD *)buf = 138543619;
      int64_t v18 = v6;
      __int16 v19 = 2113;
      uint64_t v20 = v15;
      _os_log_debug_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ initialValue %{private}@", buf, 0x16u);
    }

    __int16 v10 = objc_alloc_init(CSLPRFDepthAutoLaunchAppSetting);
    depthSetting = v6->_depthSetting;
    v6->_depthSetting = v10;

    [(CSLPRFDepthAutoLaunchAppSetting *)v6->_depthSetting setDelegate:v6];
    uint64_t v12 = objc_alloc_init(CSLPRFStingConfigurationHistory);
    configurationHistory = v6->_configurationHistory;
    v6->_configurationHistory = v12;

    [(CSLPRFTwoWaySyncSetting *)v6->_stingConfigurationSetting setDelegate:v6];
  }

  return v6;
}

- (CSLPRFStingConfiguration)init
{
  return [(CSLPRFStingConfiguration *)self initWithDelegate:0];
}

@end
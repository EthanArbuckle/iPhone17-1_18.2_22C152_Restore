@interface CSLPRFStingQuickSwitchModel
- (BOOL)isQuickSwitchEnabled;
- (CSLPRFStingQuickSwitchModel)init;
- (CSLPRFStingQuickSwitchModel)initWithDelegate:(id)a3;
- (CSLPRFStingQuickSwitchModel)initWithDelegate:(id)a3 settingsModel:(id)a4;
- (CSLPRFStingQuickSwitchModel)initWithDelegate:(id)a3 settingsModel:(id)a4 settings:(id)a5;
- (CSLPRFStingQuickSwitchModelDelegate)delegate;
- (NSArray)allQuickSwitchItems;
- (NSArray)availableQuickSwitchActions;
- (id)existingItemForActionType:(unint64_t)a3;
- (void)lock_restoreFromSettings;
- (void)quickSwitchItemDidChange:(id)a3;
- (void)restoreFromSettings;
- (void)setDelegate:(id)a3;
- (void)setQuickSwitchEnabled:(BOOL)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFStingQuickSwitchModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQuickSwitchItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quickSwitchSettings, 0);
  objc_storeStrong((id *)&self->_stingModel, 0);
}

- (NSArray)allQuickSwitchItems
{
  return self->_allQuickSwitchItems;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFStingQuickSwitchModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFStingQuickSwitchModelDelegate *)WeakRetained;
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  [(CSLPRFStingQuickSwitchModel *)self restoreFromSettings];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained quickSwitchModelDidChange:self];
}

- (void)quickSwitchItemDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = obj->_allQuickSwitchItems;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 actionType];
        if (v11 == [v4 actionType]) {
          objc_msgSend(v10, "setAvailableForQuickSwitch:", objc_msgSend(v4, "isAvailableForQuickSwitch"));
        }
        v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isAvailableForQuickSwitch"));
        v13 = [v10 settingsItem];
        v14 = [v13 identifier];
        [v5 setObject:v12 forKeyedSubscript:v14];
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  quickSwitchSettings = obj->_quickSwitchSettings;
  v16 = (void *)[v5 copy];
  [(CSLPRFStingQuickSwitchSettings *)quickSwitchSettings setQuickSwitchActionAvailability:v16];

  objc_sync_exit(obj);
  id WeakRetained = objc_loadWeakRetained((id *)&obj->_delegate);
  [WeakRetained quickSwitchModelDidChange:obj];
}

- (NSArray)availableQuickSwitchActions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2->_allQuickSwitchItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isAvailableForQuickSwitch", (void)v11)) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v3 copy];
  objc_sync_exit(v2);

  return (NSArray *)v9;
}

- (id)existingItemForActionType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = v4->_allQuickSwitchItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "actionType", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  objc_sync_exit(v4);
  return v10;
}

- (void)setQuickSwitchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_quickSwitchEnabled == v3)
  {
    objc_sync_exit(obj);
    id v4 = obj;
  }
  else
  {
    obj->_quickSwitchEnabled = v3;
    [(CSLPRFStingQuickSwitchSettings *)obj->_quickSwitchSettings setQuickSwitchEnabled:v3];
    objc_sync_exit(obj);

    id WeakRetained = (CSLPRFStingQuickSwitchModel *)objc_loadWeakRetained((id *)&obj->_delegate);
    [(CSLPRFStingQuickSwitchModel *)WeakRetained quickSwitchModelDidChange:obj];
    id v4 = WeakRetained;
  }
}

- (BOOL)isQuickSwitchEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CSLPRFStingQuickSwitchSettings *)v2->_quickSwitchSettings isQuickSwitchEnabled];
  objc_sync_exit(v2);

  return v3;
}

- (void)lock_restoreFromSettings
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  self->_quickSwitchEnabled = [(CSLPRFStingQuickSwitchSettings *)self->_quickSwitchSettings isQuickSwitchEnabled];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id v4 = [(CSLPRFStingSettingsModel *)self->_stingModel quickActionItems];
  v25 = (NSArray *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  uint64_t v5 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CSLPRFStingSettingsModel *)self->_stingModel quickActionItems];
    uint64_t v7 = [(CSLPRFStingSettingsModel *)self->_stingModel defaultQuickActionItems];
    *(_DWORD *)buf = 138412802;
    v32 = self;
    __int16 v33 = 2112;
    v34 = v6;
    __int16 v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEFAULT, "%@: _settingsModel.quickActionItems %@ _settingsModel.defaultQuickActionItems %@", buf, 0x20u);
  }
  uint64_t v8 = [(CSLPRFStingQuickSwitchSettings *)self->_quickSwitchSettings quickSwitchActionAvailability];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(CSLPRFStingSettingsModel *)self->_stingModel quickActionItems];
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = [v13 linkActionType];
        if ((unint64_t)(v14 - 1) > 0x28) {
          long long v15 = 0;
        }
        else {
          long long v15 = off_264A0AC28[v14 - 1];
        }
        uint64_t v16 = v15;
        uint64_t v17 = [v8 objectForKeyedSubscript:v16];
        v18 = v17;
        if (v17) {
          uint64_t v19 = [v17 BOOLValue];
        }
        else {
          uint64_t v19 = 1;
        }
        -[CSLPRFStingQuickSwitchModel existingItemForActionType:](self, "existingItemForActionType:", [v13 linkActionType]);
        long long v20 = (CSLPRFStingQuickSwitchItem *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          long long v21 = v20;
          [(CSLPRFStingQuickSwitchItem *)v20 setAvailableForQuickSwitch:v19];
        }
        else
        {
          long long v21 = [[CSLPRFStingQuickSwitchItem alloc] initWithDelegate:self settingsItem:v13 availability:v19];
        }
        [(NSArray *)v25 addObject:v21];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  long long v22 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = self;
    __int16 v33 = 2112;
    v34 = v25;
    _os_log_impl(&dword_22F4EA000, v22, OS_LOG_TYPE_DEFAULT, "%@: allQuickSwitchItems %@", buf, 0x16u);
  }

  allQuickSwitchItems = self->_allQuickSwitchItems;
  self->_allQuickSwitchItems = v25;
}

- (void)restoreFromSettings
{
  id obj = self;
  objc_sync_enter(obj);
  [(CSLPRFStingQuickSwitchModel *)obj lock_restoreFromSettings];
  objc_sync_exit(obj);
}

- (CSLPRFStingQuickSwitchModel)initWithDelegate:(id)a3 settingsModel:(id)a4 settings:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CSLPRFStingQuickSwitchModel;
  uint64_t v11 = [(CSLPRFStingQuickSwitchModel *)&v16 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_stingModel, a4);
    objc_storeStrong((id *)&v12->_quickSwitchSettings, a5);
    [(CSLPRFTwoWaySyncSetting *)v12->_quickSwitchSettings setDelegate:v12];
    long long v13 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      stingModel = v12->_stingModel;
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      __int16 v19 = 2112;
      long long v20 = stingModel;
      _os_log_debug_impl(&dword_22F4EA000, v13, OS_LOG_TYPE_DEBUG, "%@: _settingsModel %@", buf, 0x16u);
    }

    [(CSLPRFStingQuickSwitchModel *)v12 restoreFromSettings];
  }

  return v12;
}

- (CSLPRFStingQuickSwitchModel)initWithDelegate:(id)a3 settingsModel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CSLPRFStingQuickSwitchSettings fetchQuickSwitchSettings];
  id v9 = [(CSLPRFStingQuickSwitchModel *)self initWithDelegate:v7 settingsModel:v6 settings:v8];

  return v9;
}

- (CSLPRFStingQuickSwitchModel)initWithDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CSLPRFStingConfiguration);
  id v6 = objc_alloc_init(CSLPRFStingSettingsModel);
  id v7 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    long long v13 = v5;
    __int16 v14 = 2112;
    long long v15 = v6;
    _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEFAULT, "%@:configuration %@ settingsModel %@", (uint8_t *)&v10, 0x20u);
  }

  id v8 = [(CSLPRFStingQuickSwitchModel *)self initWithDelegate:v4 settingsModel:v6];
  return v8;
}

- (CSLPRFStingQuickSwitchModel)init
{
  return [(CSLPRFStingQuickSwitchModel *)self initWithDelegate:0];
}

@end
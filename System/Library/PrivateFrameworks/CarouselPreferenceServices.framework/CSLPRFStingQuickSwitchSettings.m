@interface CSLPRFStingQuickSwitchSettings
+ (id)fetchQuickSwitchSettings;
- (BOOL)isQuickSwitchEnabled;
- (CSLPRFStingQuickSwitchSettings)initWithKey:(id)a3 defaultValue:(id)a4 notification:(const char *)a5;
- (NSDictionary)quickSwitchActionAvailability;
- (id)_toSettingValue;
- (void)didUpdate;
- (void)fromSetting:(id)a3;
- (void)setQuickSwitchActionAvailability:(id)a3;
- (void)setQuickSwitchEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation CSLPRFStingQuickSwitchSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_quickSwitchActionAvailability, 0);
}

- (void)setQuickSwitchActionAvailability:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  quickSwitchActionAvailability = v5->_quickSwitchActionAvailability;
  v5->_quickSwitchActionAvailability = (NSDictionary *)v6;

  v8 = [(CSLPRFStingQuickSwitchSettings *)v5 _toSettingValue];
  v9 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136446466;
    v11 = "-[CSLPRFStingQuickSwitchSettings setQuickSwitchActionAvailability:]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_INFO, "%{public}s %@", (uint8_t *)&v10, 0x16u);
  }

  [(CSLPRFStingQuickSwitchSettings *)v5 setValue:v8];
  objc_sync_exit(v5);
}

- (NSDictionary)quickSwitchActionAvailability
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_quickSwitchActionAvailability;
  objc_sync_exit(v2);

  return v3;
}

- (void)setQuickSwitchEnabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  v4->_quickSwitchEnabled = a3;
  v5 = [(CSLPRFStingQuickSwitchSettings *)v4 _toSettingValue];
  uint64_t v6 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446466;
    v8 = "-[CSLPRFStingQuickSwitchSettings setQuickSwitchEnabled:]";
    __int16 v9 = 2112;
    int v10 = v5;
    _os_log_impl(&dword_22F4EA000, v6, OS_LOG_TYPE_INFO, "%{public}s %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSLPRFStingQuickSwitchSettings *)v4 setValue:v5];
  objc_sync_exit(v4);
}

- (BOOL)isQuickSwitchEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL quickSwitchEnabled = v2->_quickSwitchEnabled;
  objc_sync_exit(v2);

  return quickSwitchEnabled;
}

- (id)_toSettingValue
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"isEnabled";
  uint64_t v3 = [NSNumber numberWithBool:self->_quickSwitchEnabled];
  id v4 = (void *)v3;
  v8[1] = @"actionAvailability";
  quickSwitchActionAvailability = self->_quickSwitchActionAvailability;
  if (!quickSwitchActionAvailability) {
    quickSwitchActionAvailability = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  v9[0] = v3;
  v9[1] = quickSwitchActionAvailability;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (void)fromSetting:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  v5 = [(CSLPRFTwoWaySyncSetting *)self safeValueOfType:objc_opt_class()];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v5)
  {
    int v7 = [v5 objectForKeyedSubscript:@"isEnabled"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v6->_BOOL quickSwitchEnabled = [v7 BOOLValue];
    }
    else {
      v6->_BOOL quickSwitchEnabled = 1;
    }
    v8 = [v5 objectForKeyedSubscript:@"actionAvailability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v6->_quickSwitchActionAvailability, v8);
    }
  }
  else
  {
    __int16 v9 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136446210;
      __int16 v12 = "-[CSLPRFStingQuickSwitchSettings fromSetting:]";
      _os_log_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_INFO, "%{public}s no value for setting, restoring default values", (uint8_t *)&v11, 0xCu);
    }

    v6->_BOOL quickSwitchEnabled = 1;
    quickSwitchActionAvailability = v6->_quickSwitchActionAvailability;
    v6->_quickSwitchActionAvailability = 0;
  }
  objc_sync_exit(v6);

  if (v4) {
    v4[2](v4);
  }
}

- (void)didUpdate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v6 = "-[CSLPRFStingQuickSwitchSettings didUpdate]";
    _os_log_impl(&dword_22F4EA000, v3, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__CSLPRFStingQuickSwitchSettings_didUpdate__block_invoke;
  v4[3] = &unk_264A0BA38;
  v4[4] = self;
  [(CSLPRFStingQuickSwitchSettings *)self fromSetting:v4];
}

uint64_t __43__CSLPRFStingQuickSwitchSettings_didUpdate__block_invoke()
{
  return BSDispatchMain();
}

id __43__CSLPRFStingQuickSwitchSettings_didUpdate__block_invoke_2(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CSLPRFStingQuickSwitchSettings;
  return objc_msgSendSuper2(&v2, sel_didUpdate);
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  updateQueue = self->_updateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__CSLPRFStingQuickSwitchSettings_setValue___block_invoke;
  v7[3] = &unk_264A0BCA8;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(updateQueue, v7);
}

id __43__CSLPRFStingQuickSwitchSettings_setValue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)CSLPRFStingQuickSwitchSettings;
  return objc_msgSendSuper2(&v3, sel_setValue_, v1);
}

- (CSLPRFStingQuickSwitchSettings)initWithKey:(id)a3 defaultValue:(id)a4 notification:(const char *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CSLPRFStingQuickSwitchSettings;
  v5 = [(CSLPRFTwoWaySyncSetting *)&v10 initWithKey:a3 defaultValue:a4 notification:a5];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.CarouselPreferenceServices.CSLPRFStingQuickSwitchSettings", 0);
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = (OS_dispatch_queue *)v6;

    v5->_BOOL quickSwitchEnabled = 1;
    quickSwitchActionAvailability = v5->_quickSwitchActionAvailability;
    v5->_quickSwitchActionAvailability = 0;

    [(CSLPRFStingQuickSwitchSettings *)v5 fromSetting:0];
  }
  return v5;
}

+ (id)fetchQuickSwitchSettings
{
  objc_super v2 = (void *)[objc_alloc((Class)a1) initWithKey:@"StingQuickSwitchSettings" defaultValue:0 notification:"CSLPRFStingQuickSwitchSettingsChangedNotification"];
  return v2;
}

@end
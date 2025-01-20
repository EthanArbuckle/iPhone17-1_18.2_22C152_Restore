@interface CSLPRFDepthAutoLaunchAppSettingLighthouseImpl
+ (id)dictionaryForSettings:(id)a3;
+ (id)settingsForDictionary:(id)a3;
- (CSLPRFDepthAutoLaunchAppSettingLighthouseImpl)init;
- (CSLPRFDepthAutoLaunchSettingCoordinatorImplDelegate)delegate;
- (CSLPRFDepthAutoLaunchSettings)settings;
- (CSLPRFTwoWaySyncSetting)underlyingSetting;
- (void)_updateWithDictionary:(id)a3;
- (void)applySettings:(id)a3;
- (void)setDelegate:(id)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFDepthAutoLaunchAppSettingLighthouseImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSetting, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

- (CSLPRFTwoWaySyncSetting)underlyingSetting
{
  return self->_underlyingSetting;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFDepthAutoLaunchSettingCoordinatorImplDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFDepthAutoLaunchSettingCoordinatorImplDelegate *)WeakRetained;
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  id v4 = [a3 value];
  [(CSLPRFDepthAutoLaunchAppSettingLighthouseImpl *)self _updateWithDictionary:v4];
}

- (void)_updateWithDictionary:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = +[CSLPRFDepthAutoLaunchAppSettingLighthouseImpl settingsForDictionary:v5];

  if ([v9 isEqual:self->_settings])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = (CSLPRFDepthAutoLaunchSettings *)[v9 copy];
    settings = self->_settings;
    self->_settings = v6;

    os_unfair_lock_unlock(p_lock);
    v8 = [(CSLPRFDepthAutoLaunchAppSettingLighthouseImpl *)self delegate];
    [v8 autoLaunchSettingCoordinator:self didUpdateSettings:v9];
  }
}

- (void)applySettings:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([v8 isEqual:self->_settings])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v4 = (CSLPRFDepthAutoLaunchSettings *)[v8 copy];
    settings = self->_settings;
    self->_settings = v4;

    v6 = +[CSLPRFDepthAutoLaunchAppSettingLighthouseImpl dictionaryForSettings:self->_settings];
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v7 = [(CSLPRFDepthAutoLaunchAppSettingLighthouseImpl *)self underlyingSetting];
      [v7 setValue:v6];
    }
  }
}

- (CSLPRFDepthAutoLaunchSettings)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(CSLPRFDepthAutoLaunchSettings *)self->_settings copy];
  os_unfair_lock_unlock(p_lock);
  return (CSLPRFDepthAutoLaunchSettings *)v4;
}

- (CSLPRFDepthAutoLaunchAppSettingLighthouseImpl)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFDepthAutoLaunchAppSettingLighthouseImpl;
  v2 = [(CSLPRFDepthAutoLaunchAppSettingLighthouseImpl *)&v7 init];
  if (v2)
  {
    v3 = -[CSLPRFTwoWaySyncSetting initWithKey:defaultValue:notification:]([CSLPRFTwoWaySyncSetting alloc], "initWithKey:defaultValue:notification:", @"AutoLaunchDepthSettings", 0, [@"com.apple.Carousel.AutoLaunchDepthSettingsChanged" UTF8String]);
    underlyingSetting = v2->_underlyingSetting;
    v2->_underlyingSetting = v3;

    [(CSLPRFTwoWaySyncSetting *)v2->_underlyingSetting setDelegate:v2];
    id v5 = [(CSLPRFTwoWaySyncSetting *)v2->_underlyingSetting value];
    [(CSLPRFDepthAutoLaunchAppSettingLighthouseImpl *)v2 _updateWithDictionary:v5];
  }
  return v2;
}

+ (id)settingsForDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CSLPRFMutableDepthAutoLaunchSettings);
  id v5 = [v3 objectForKeyedSubscript:@"bundleID"];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  [(CSLPRFMutableDepthAutoLaunchSettings *)v4 setBundleID:v9];
  v10 = [v3 objectForKeyedSubscript:@"behavior"];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  unint64_t v15 = [v14 integerValue];
  if (v15 <= 2) {
    [(CSLPRFMutableDepthAutoLaunchSettings *)v4 setAutoLaunchBehavior:v15];
  }
  v16 = [v3 objectForKeyedSubscript:@"changeSource"];
  uint64_t v17 = objc_opt_class();
  id v18 = v16;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  uint64_t v21 = [v20 integerValue];
  [(CSLPRFMutableDepthAutoLaunchSettings *)v4 setChangeSource:v21];
  v22 = [v3 objectForKeyedSubscript:@"threshold"];
  uint64_t v23 = objc_opt_class();
  id v24 = v22;
  if (v23)
  {
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }
  id v26 = v25;

  unint64_t v27 = [v26 integerValue];
  if (v27 <= 1) {
    [(CSLPRFMutableDepthAutoLaunchSettings *)v4 setThreshold:v27];
  }

  return v4;
}

+ (id)dictionaryForSettings:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  [v5 setObject:&unk_26E2C98E0 forKeyedSubscript:@"version"];
  uint64_t v6 = [v4 bundleID];
  [v5 setObject:v6 forKeyedSubscript:@"bundleID"];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "autoLaunchBehavior"));
  [v5 setObject:v7 forKeyedSubscript:@"behavior"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "changeSource"));
  [v5 setObject:v8 forKeyedSubscript:@"changeSource"];

  id v9 = NSNumber;
  uint64_t v10 = [v4 threshold];

  uint64_t v11 = [v9 numberWithInteger:v10];
  [v5 setObject:v11 forKeyedSubscript:@"threshold"];

  return v5;
}

@end
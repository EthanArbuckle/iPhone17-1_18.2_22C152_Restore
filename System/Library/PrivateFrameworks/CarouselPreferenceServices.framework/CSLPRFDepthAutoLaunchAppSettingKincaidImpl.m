@interface CSLPRFDepthAutoLaunchAppSettingKincaidImpl
- (CSLPRFDepthAutoLaunchAppSettingKincaidImpl)init;
- (CSLPRFDepthAutoLaunchSettingCoordinatorImplDelegate)delegate;
- (CSLPRFDepthAutoLaunchSettings)settings;
- (CSLPRFTwoWaySyncSetting)bundleIDSetting;
- (CSLPRFTwoWaySyncSetting)changeSourceSetting;
- (CSLPRFTwoWaySyncSetting)enabledSetting;
- (void)_withLock:(id)a3;
- (void)applySettings:(id)a3;
- (void)removeLegacySettings;
- (void)setBundleIDSetting:(id)a3;
- (void)setChangeSourceSetting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledSetting:(id)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFDepthAutoLaunchAppSettingKincaidImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSetting, 0);
  objc_storeStrong((id *)&self->_changeSourceSetting, 0);
  objc_storeStrong((id *)&self->_bundleIDSetting, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setEnabledSetting:(id)a3
{
}

- (CSLPRFTwoWaySyncSetting)enabledSetting
{
  return self->_enabledSetting;
}

- (void)setChangeSourceSetting:(id)a3
{
}

- (CSLPRFTwoWaySyncSetting)changeSourceSetting
{
  return self->_changeSourceSetting;
}

- (void)setBundleIDSetting:(id)a3
{
}

- (CSLPRFTwoWaySyncSetting)bundleIDSetting
{
  return self->_bundleIDSetting;
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
  id v5 = [(CSLPRFDepthAutoLaunchAppSettingKincaidImpl *)self delegate];
  v4 = [(CSLPRFDepthAutoLaunchAppSettingKincaidImpl *)self settings];
  [v5 autoLaunchSettingCoordinator:self didUpdateSettings:v4];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)applySettings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CSLPRFDepthAutoLaunchAppSettingKincaidImpl_applySettings___block_invoke;
  v6[3] = &unk_264A0BCA8;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(CSLPRFDepthAutoLaunchAppSettingKincaidImpl *)self _withLock:v6];
}

void __60__CSLPRFDepthAutoLaunchAppSettingKincaidImpl_applySettings___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bundleID];
  v3 = [*(id *)(a1 + 40) bundleIDSetting];
  id v4 = [v3 value];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = [*(id *)(a1 + 32) bundleID];
    id v7 = [*(id *)(a1 + 40) bundleIDSetting];
    [v7 setValue:v6];
  }
  uint64_t v8 = [*(id *)(a1 + 32) changeSource];
  v9 = [*(id *)(a1 + 40) changeSourceSetting];
  v10 = [v9 value];
  uint64_t v11 = [v10 integerValue];

  if (v8 != v11)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "changeSource"));
    v13 = [*(id *)(a1 + 40) changeSourceSetting];
    [v13 setValue:v12];
  }
  v14 = [*(id *)(a1 + 40) enabledSetting];
  v15 = [v14 value];
  int v16 = [v15 BOOLValue];

  if ([*(id *)(a1 + 32) autoLaunchBehavior] == 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Cannot set 'clock' behavior on legacy implementation", buf, 2u);
    }
    return;
  }
  if ([*(id *)(a1 + 32) autoLaunchBehavior] == 1) {
    char v17 = v16;
  }
  else {
    char v17 = 1;
  }
  if (v17)
  {
    if ([*(id *)(a1 + 32) autoLaunchBehavior]) {
      int v18 = 0;
    }
    else {
      int v18 = v16;
    }
    if (v18 != 1) {
      return;
    }
    v19 = [*(id *)(a1 + 40) enabledSetting];
    id v21 = v19;
    uint64_t v20 = MEMORY[0x263EFFA80];
  }
  else
  {
    v19 = [*(id *)(a1 + 40) enabledSetting];
    id v21 = v19;
    uint64_t v20 = MEMORY[0x263EFFA88];
  }
  [v19 setValue:v20];
}

- (CSLPRFDepthAutoLaunchSettings)settings
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  uint64_t v11 = objc_alloc_init(CSLPRFMutableDepthAutoLaunchSettings);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__CSLPRFDepthAutoLaunchAppSettingKincaidImpl_settings__block_invoke;
  v5[3] = &unk_264A0BC58;
  v5[4] = self;
  v5[5] = &v6;
  [(CSLPRFDepthAutoLaunchAppSettingKincaidImpl *)self _withLock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSLPRFDepthAutoLaunchSettings *)v3;
}

void __54__CSLPRFDepthAutoLaunchAppSettingKincaidImpl_settings__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changeSourceSetting];
  id v3 = [v2 value];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setChangeSource:", objc_msgSend(v3, "integerValue"));

  id v4 = [*(id *)(a1 + 32) bundleIDSetting];
  char v5 = [v4 value];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setBundleID:v5];

  id v7 = [*(id *)(a1 + 32) enabledSetting];
  uint64_t v6 = [v7 value];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setAutoLaunchBehavior:", objc_msgSend(v6, "BOOLValue"));
}

- (void)removeLegacySettings
{
  [(CSLPRFTwoWaySyncSetting *)self->_bundleIDSetting setValue:0];
  [(CSLPRFTwoWaySyncSetting *)self->_changeSourceSetting setValue:0];
  enabledSetting = self->_enabledSetting;
  [(CSLPRFTwoWaySyncSetting *)enabledSetting setValue:0];
}

- (CSLPRFDepthAutoLaunchAppSettingKincaidImpl)init
{
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFDepthAutoLaunchAppSettingKincaidImpl;
  v2 = [(CSLPRFDepthAutoLaunchAppSettingKincaidImpl *)&v13 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = -[CSLPRFTwoWaySyncSetting initWithKey:defaultValue:notification:]([CSLPRFTwoWaySyncSetting alloc], "initWithKey:defaultValue:notification:", @"AutoLaunchDepthApp", 0, [@"com.apple.Carousel.CSLPRFDepthAutoLaunchAppSettingChanged" UTF8String]);
    bundleIDSetting = v3->_bundleIDSetting;
    v3->_bundleIDSetting = v4;

    [(CSLPRFTwoWaySyncSetting *)v3->_bundleIDSetting setDelegate:v3];
    uint64_t v6 = -[CSLPRFTwoWaySyncSetting initWithKey:defaultValue:notification:]([CSLPRFTwoWaySyncSetting alloc], "initWithKey:defaultValue:notification:", @"AutoLaunchDepthAppChangeSource", &unk_26E2C9810, [@"CSLDepthAutoLaunchAppChangeSourceSettingChanged" UTF8String]);
    changeSourceSetting = v3->_changeSourceSetting;
    v3->_changeSourceSetting = v6;

    uint64_t v8 = [CSLPRFTwoWaySyncSetting alloc];
    uint64_t v9 = [@"com.apple.Carousel.AutoLaunchDepthEnabledChanged" UTF8String];
    uint64_t v10 = [(CSLPRFTwoWaySyncSetting *)v8 initWithKey:@"AutoLaunchDepthEnabled" defaultValue:MEMORY[0x263EFFA80] notification:v9];
    enabledSetting = v3->_enabledSetting;
    v3->_enabledSetting = (CSLPRFTwoWaySyncSetting *)v10;

    [(CSLPRFTwoWaySyncSetting *)v3->_enabledSetting setDelegate:v3];
  }
  return v3;
}

@end
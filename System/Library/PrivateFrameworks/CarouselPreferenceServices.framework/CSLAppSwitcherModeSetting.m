@interface CSLAppSwitcherModeSetting
- (CSLAppSwitcherModeSetting)init;
- (CSLAppSwitcherModeSettingDelegate)delegate;
- (int64_t)mode;
- (void)_withLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLAppSwitcherModeSetting

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setting, 0);
}

- (CSLAppSwitcherModeSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLAppSwitcherModeSettingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [v5 appSwitcherModeDidUpdate:self->_mode];
}

- (void)setMode:(int64_t)a3
{
  setting = self->_setting;
  id v4 = [NSNumber numberWithInteger:a3];
  [(CSLPRFTwoWaySyncSetting *)setting setValue:v4];
}

- (int64_t)mode
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__CSLAppSwitcherModeSetting_mode__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLAppSwitcherModeSetting *)self _withLock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__CSLAppSwitcherModeSetting_mode__block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) value];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v3 + 24) >= 2uLL) {
    *(void *)(v3 + 24) = 1;
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

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  id v4 = [(CSLAppSwitcherModeSetting *)self delegate];
  objc_msgSend(v4, "appSwitcherModeDidUpdate:", -[CSLAppSwitcherModeSetting mode](self, "mode"));
}

- (CSLAppSwitcherModeSetting)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSLAppSwitcherModeSetting;
  int64_t v2 = [(CSLAppSwitcherModeSetting *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = [CSLPRFTwoWaySyncSetting alloc];
    uint64_t v5 = [NSNumber numberWithInteger:1];
    uint64_t v6 = [(CSLPRFTwoWaySyncSetting *)v4 initWithKey:@"AppSwitcherMode" defaultValue:v5 notification:"CSLAppSwitcherModeChangedNotification"];
    setting = v3->_setting;
    v3->_setting = (CSLPRFTwoWaySyncSetting *)v6;

    [(CSLPRFTwoWaySyncSetting *)v3->_setting setDelegate:v3];
    [(CSLPRFTwoWaySyncSetting *)v3->_setting migrate:@"MRUBasedDockLayout" withMapping:&__block_literal_global_4472];
  }
  return v3;
}

void *__33__CSLAppSwitcherModeSetting_init__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    return &unk_26E2C9888;
  }
  else {
    return &unk_26E2C98A0;
  }
}

@end
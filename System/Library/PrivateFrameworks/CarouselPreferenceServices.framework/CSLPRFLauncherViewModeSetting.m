@interface CSLPRFLauncherViewModeSetting
- (CSLPRFLauncherViewModeSetting)init;
- (CSLPRFLauncherViewModeSettingDelegate)delegate;
- (int64_t)launcherViewMode;
- (unint64_t)launcherViewModeReason;
- (void)setDelegate:(id)a3;
- (void)setLauncherViewMode:(int64_t)a3 reason:(unint64_t)a4;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLPRFLauncherViewModeSetting

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reasonSetting, 0);
  objc_storeStrong((id *)&self->_modeSetting, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFLauncherViewModeSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFLauncherViewModeSettingDelegate *)WeakRetained;
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  id v3 = [(CSLPRFLauncherViewModeSetting *)self delegate];
  [v3 launcherViewModeSettingChanged];
}

- (void)setLauncherViewMode:(int64_t)a3 reason:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v7 = cslprf_dock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(CSLPRFTwoWaySyncSetting *)self->_reasonSetting value];
    int v20 = 138412802;
    v21 = @"LauncherViewModeReason";
    __int16 v22 = 1024;
    int v23 = a4;
    __int16 v24 = 1024;
    int v25 = [v8 integerValue];
    _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "setting %@ to %d was %d", (uint8_t *)&v20, 0x18u);
  }
  v9 = [(CSLPRFTwoWaySyncSetting *)self->_reasonSetting value];
  uint64_t v10 = [v9 integerValue];

  if (v10 != a4)
  {
    v11 = cslprf_dock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      v21 = @"LauncherViewModeReason";
      __int16 v22 = 1024;
      int v23 = a4;
      _os_log_impl(&dword_22F4EA000, v11, OS_LOG_TYPE_INFO, "setting %@ to %d", (uint8_t *)&v20, 0x12u);
    }

    reasonSetting = self->_reasonSetting;
    v13 = [NSNumber numberWithUnsignedInteger:a4];
    [(CSLPRFTwoWaySyncSetting *)reasonSetting setValue:v13];
  }
  v14 = [(CSLPRFTwoWaySyncSetting *)self->_modeSetting value];
  uint64_t v15 = [v14 integerValue];

  if (v15 != a3)
  {
    v16 = cslprf_dock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v20 = 67109120;
      LODWORD(v21) = a3;
      _os_log_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_INFO, "setting launcherViewMode to %d", (uint8_t *)&v20, 8u);
    }

    modeSetting = self->_modeSetting;
    v18 = [NSNumber numberWithInteger:a3];
    [(CSLPRFTwoWaySyncSetting *)modeSetting setValue:v18];

    v19 = [(CSLPRFLauncherViewModeSetting *)self delegate];
    [v19 launcherViewModeSettingChanged];
  }
}

- (unint64_t)launcherViewModeReason
{
  v2 = [(CSLPRFTwoWaySyncSetting *)self->_reasonSetting value];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)launcherViewMode
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [(CSLPRFTwoWaySyncSetting *)self->_modeSetting value];
  int64_t v3 = [v2 integerValue];
  v4 = cslprf_dock_log();
  v5 = v4;
  if ((unint64_t)(v3 - 1) > 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      v8 = @"LauncherViewMode";
      __int16 v9 = 1024;
      int v10 = v3;
      __int16 v11 = 1024;
      int v12 = 1;
      _os_log_error_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_ERROR, "value for %@ (%d) is out of range, substituting %d", (uint8_t *)&v7, 0x18u);
    }
    int64_t v3 = 1;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 67109120;
    LODWORD(v8) = v3;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "launcherViewMode is %d", (uint8_t *)&v7, 8u);
  }

  return v3;
}

- (CSLPRFLauncherViewModeSetting)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSLPRFLauncherViewModeSetting;
  v2 = [(CSLPRFLauncherViewModeSetting *)&v8 init];
  if (v2)
  {
    int64_t v3 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"LauncherViewMode" defaultValue:&unk_26E2C9840 notification:"CSLLauncherSettingsChangedNotification"];
    modeSetting = v2->_modeSetting;
    v2->_modeSetting = v3;

    [(CSLPRFTwoWaySyncSetting *)v2->_modeSetting setDelegate:v2];
    v5 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"LauncherViewModeReason" defaultValue:&unk_26E2C9858 notification:0];
    reasonSetting = v2->_reasonSetting;
    v2->_reasonSetting = v5;
  }
  return v2;
}

@end
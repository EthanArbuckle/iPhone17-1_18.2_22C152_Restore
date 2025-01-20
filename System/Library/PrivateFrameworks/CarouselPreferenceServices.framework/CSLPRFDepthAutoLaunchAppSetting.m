@interface CSLPRFDepthAutoLaunchAppSetting
+ (int64_t)preferredVersion;
- (CSLPRFDepthAutoLaunchAppSetting)init;
- (CSLPRFDepthAutoLaunchAppSetting)initWithDelegate:(id)a3;
- (CSLPRFDepthAutoLaunchAppSetting)initWithVersion:(int64_t)a3;
- (CSLPRFDepthAutoLaunchAppSettingDelegate)delegate;
- (CSLPRFDepthAutoLaunchSettingCoordinatorImpl)coordinator;
- (CSLPRFDepthAutoLaunchSettings)settings;
- (int64_t)version;
- (void)autoLaunchSettingCoordinator:(id)a3 didUpdateSettings:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateSettingsWithBlock:(id)a3;
@end

@implementation CSLPRFDepthAutoLaunchAppSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CSLPRFDepthAutoLaunchSettingCoordinatorImpl)coordinator
{
  return self->_coordinator;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFDepthAutoLaunchAppSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFDepthAutoLaunchAppSettingDelegate *)WeakRetained;
}

- (int64_t)version
{
  return self->_version;
}

- (void)autoLaunchSettingCoordinator:(id)a3 didUpdateSettings:(id)a4
{
  id v5 = [(CSLPRFDepthAutoLaunchAppSetting *)self delegate];
  [v5 depthAutoLaunchAppSettingDidUpdate:self];
}

- (void)updateSettingsWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v7 = [(CSLPRFDepthAutoLaunchAppSetting *)self settings];
  id v5 = (void *)[v7 mutableCopy];
  v4[2](v4, v5);

  if (([v7 isEqual:v5] & 1) == 0)
  {
    v6 = [(CSLPRFDepthAutoLaunchAppSetting *)self coordinator];
    [v6 applySettings:v5];
  }
}

- (CSLPRFDepthAutoLaunchSettings)settings
{
  v2 = [(CSLPRFDepthAutoLaunchAppSetting *)self coordinator];
  v3 = [v2 settings];
  v4 = (void *)[v3 copy];

  return (CSLPRFDepthAutoLaunchSettings *)v4;
}

- (CSLPRFDepthAutoLaunchAppSetting)initWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLPRFDepthAutoLaunchAppSetting *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (CSLPRFDepthAutoLaunchAppSetting)initWithVersion:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFDepthAutoLaunchAppSetting;
  id v4 = [(CSLPRFDepthAutoLaunchAppSetting *)&v13 init];
  id v5 = v4;
  if (v4)
  {
    v4->_version = a3;
    if (a3 == 1)
    {
      id v7 = objc_alloc_init(CSLPRFDepthAutoLaunchSettingsMigrator);
      [(CSLPRFDepthAutoLaunchSettingsMigrator *)v7 migrateIfNeeded];
      v8 = objc_alloc_init(CSLPRFDepthAutoLaunchAppSettingLighthouseImpl);
      coordinator = v5->_coordinator;
      v5->_coordinator = (CSLPRFDepthAutoLaunchSettingCoordinatorImpl *)v8;
    }
    else if (a3)
    {
      v10 = (void *)MEMORY[0x263EFF940];
      uint64_t v11 = *MEMORY[0x263EFF4A0];
      id v7 = [NSNumber numberWithInteger:a3];
      [v10 raise:v11, @"Unknown CSLPRFDepthAutoLaunchVersion: %@", v7 format];
    }
    else
    {
      v6 = objc_alloc_init(CSLPRFDepthAutoLaunchAppSettingKincaidImpl);
      id v7 = (CSLPRFDepthAutoLaunchSettingsMigrator *)v5->_coordinator;
      v5->_coordinator = (CSLPRFDepthAutoLaunchSettingCoordinatorImpl *)v6;
    }

    [(CSLPRFDepthAutoLaunchSettingCoordinatorImpl *)v5->_coordinator setDelegate:v5];
  }
  return v5;
}

- (CSLPRFDepthAutoLaunchAppSetting)init
{
  uint64_t v3 = [(id)objc_opt_class() preferredVersion];
  return [(CSLPRFDepthAutoLaunchAppSetting *)self initWithVersion:v3];
}

+ (int64_t)preferredVersion
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v3 = [v2 getActivePairedDevice];

  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AB8F4061-4873-40AF-9613-C8A97D0921F2"];
    unsigned int v5 = [v3 supportsCapability:v4];

    int64_t v6 = v5;
  }
  else
  {
    id v7 = cslprf_settings_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_FAULT, "NRDevice was nil", v9, 2u);
    }

    int64_t v6 = 1;
  }

  return v6;
}

@end
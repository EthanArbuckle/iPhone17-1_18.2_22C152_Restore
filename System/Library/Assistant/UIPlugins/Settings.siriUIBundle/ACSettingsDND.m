@interface ACSettingsDND
- (ACSettingsDND)init;
- (BOOL)enabled;
- (void)setEnabled:(BOOL)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation ACSettingsDND

- (ACSettingsDND)init
{
  v14.receiver = self;
  v14.super_class = (Class)ACSettingsDND;
  v2 = [(ACSettingsDND *)&v14 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedString(@"SETTING_DND");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v2->super._settingsDetailClass = 0;
    uint64_t v5 = +[DNDStateService serviceForClientIdentifier:@"com.apple.siri.Settings"];
    dndStateService = v2->_dndStateService;
    v2->_dndStateService = (DNDStateService *)v5;

    v7 = v2->_dndStateService;
    id v13 = 0;
    unsigned __int8 v8 = [(DNDStateService *)v7 addStateUpdateListener:v2 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_47E0();
    }
    uint64_t v10 = +[DNDModeAssertionService serviceForClientIdentifier:@"com.apple.siri.Settings"];
    dndModeAssertionService = v2->_dndModeAssertionService;
    v2->_dndModeAssertionService = (DNDModeAssertionService *)v10;
  }
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = DNDDefaultModeIdentifier;
    uint64_t v5 = +[DNDModeAssertionLifetime lifetimeUntilEndOfScheduleWithIdentifier:DNDDefaultScheduleIdentifier];
    v6 = +[DNDModeAssertionDetails detailsWithIdentifier:@"com.apple.siri.Settings" modeIdentifier:v4 lifetime:v5];

    dndModeAssertionService = self->_dndModeAssertionService;
    id v18 = 0;
    unsigned __int8 v8 = [(DNDModeAssertionService *)dndModeAssertionService takeModeAssertionWithDetails:v6 error:&v18];
    id v9 = v18;

    if (!v8 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_4854();
    }
  }
  else if (([(DNDModeAssertionService *)self->_dndModeAssertionService invalidateAllActiveModeAssertionsWithError:0] & 1) == 0)
  {
    uint64_t v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_48C8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (BOOL)enabled
{
  dndStateService = self->_dndStateService;
  id v7 = 0;
  uint64_t v3 = [(DNDStateService *)dndStateService queryCurrentStateWithError:&v7];
  id v4 = v7;
  unsigned __int8 v5 = [v3 isActive];

  if (v4 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_494C();
  }

  return v5;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = [(ACSettingsBasicSetting *)self delegate];
  [v5 settingChangedExternally:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndModeAssertionService, 0);

  objc_storeStrong((id *)&self->_dndStateService, 0);
}

@end
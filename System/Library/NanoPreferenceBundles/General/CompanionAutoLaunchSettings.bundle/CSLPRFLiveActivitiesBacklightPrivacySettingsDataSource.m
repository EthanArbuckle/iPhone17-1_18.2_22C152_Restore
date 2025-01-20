@interface CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource
- (BOOL)privacyDuringAlwaysOnForLiveActivities;
- (CSLPRFAppBacklightPrivacySettings)globalSettings;
- (CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource)init;
- (CSLPRFLiveActivitiesBacklightPrivacySettingsDataSourceDelegate)delegate;
- (CSLPRFPerApplicationSettingsModel)settingsModel;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setGlobalSettings:(id)a3;
- (void)setPrivacyDuringAlwaysOnForLiveActivities:(BOOL)a3;
- (void)setSettingsModel:(id)a3;
- (void)settingsModel:(id)a3 didAddSettings:(id)a4;
- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4;
- (void)settingsModel:(id)a3 didRemoveSettings:(id)a4;
- (void)settingsModel:(id)a3 didUpdateSettings:(id)a4;
- (void)start;
@end

@implementation CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource

- (CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource;
  v2 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CSLPRFPerApplicationSettingsModel);
    v4 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:2];
    v5 = (CSLPRFPerApplicationSettingsModel *)[v3 initWithApplicationLibrary:v4 perApplicationSettingsClass:objc_opt_class()];
    settingsModel = v2->_settingsModel;
    v2->_settingsModel = v5;

    uint64_t v7 = [(CSLPRFPerApplicationSettingsModel *)v2->_settingsModel globalSettings];
    globalSettings = v2->_globalSettings;
    v2->_globalSettings = (CSLPRFAppBacklightPrivacySettings *)v7;
  }
  return v2;
}

- (void)start
{
}

- (void)invalidate
{
}

- (void)dealloc
{
  [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource;
  [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)&v3 dealloc];
}

- (BOOL)privacyDuringAlwaysOnForLiveActivities
{
  return [(CSLPRFAppBacklightPrivacySettings *)self->_globalSettings privacyDuringAlwaysOnForLiveActivities] ^ 1;
}

- (void)setPrivacyDuringAlwaysOnForLiveActivities:(BOOL)a3
{
  globalSettings = self->_globalSettings;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4C24;
  v4[3] = &unk_355B8;
  BOOL v5 = a3;
  [(CSLPRFAppBacklightPrivacySettings *)globalSettings updateSettingsWithBlock:v4];
}

- (void)settingsModel:(id)a3 didAddSettings:(id)a4
{
  BOOL v5 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];

  if (v5)
  {
    id v6 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];
    [v6 dataSourceDidUpdate:self];
  }
}

- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4
{
  BOOL v5 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];

  if (v5)
  {
    id v6 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];
    [v6 dataSourceDidUpdate:self];
  }
}

- (void)settingsModel:(id)a3 didRemoveSettings:(id)a4
{
  BOOL v5 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];

  if (v5)
  {
    id v6 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];
    [v6 dataSourceDidUpdate:self];
  }
}

- (void)settingsModel:(id)a3 didUpdateSettings:(id)a4
{
  BOOL v5 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];

  if (v5)
  {
    id v6 = [(CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource *)self delegate];
    [v6 dataSourceDidUpdate:self];
  }
}

- (CSLPRFLiveActivitiesBacklightPrivacySettingsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLPRFLiveActivitiesBacklightPrivacySettingsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFPerApplicationSettingsModel)settingsModel
{
  return self->_settingsModel;
}

- (void)setSettingsModel:(id)a3
{
}

- (CSLPRFAppBacklightPrivacySettings)globalSettings
{
  return self->_globalSettings;
}

- (void)setGlobalSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSettings, 0);
  objc_storeStrong((id *)&self->_settingsModel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
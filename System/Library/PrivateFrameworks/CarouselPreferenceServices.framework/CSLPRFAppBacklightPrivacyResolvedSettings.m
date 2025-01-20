@interface CSLPRFAppBacklightPrivacyResolvedSettings
- (BOOL)isEqualToSettings:(id)a3;
- (BOOL)privacyDuringAlwaysOnForApp;
- (BOOL)privacyDuringAlwaysOnForLiveActivities;
- (BOOL)privacyDuringAlwaysOnForNotification;
- (BOOL)watchAppSupportsAlwaysOnDisplay;
- (CSLPRFAppBacklightPrivacyResolvedSettings)initWithSettings:(id)a3 globalSettings:(id)a4;
@end

@implementation CSLPRFAppBacklightPrivacyResolvedSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (BOOL)isEqualToSettings:(id)a3
{
  return CSLPRFEqualAppBacklightPrivacySettingsValues(self, a3);
}

- (BOOL)privacyDuringAlwaysOnForLiveActivities
{
  if ([(CSLPRFAppBacklightPrivacyProperties *)self->_globalSettings privacyDuringAlwaysOnForLiveActivities])return 1; {
  settings = self->_settings;
  }
  return [(CSLPRFAppBacklightPrivacyProperties *)settings privacyDuringAlwaysOnForLiveActivities];
}

- (BOOL)privacyDuringAlwaysOnForNotification
{
  if ([(CSLPRFAppBacklightPrivacyProperties *)self->_globalSettings privacyDuringAlwaysOnForNotification])return 1; {
  settings = self->_settings;
  }
  return [(CSLPRFAppBacklightPrivacyProperties *)settings privacyDuringAlwaysOnForNotification];
}

- (BOOL)privacyDuringAlwaysOnForApp
{
  if ([(CSLPRFAppBacklightPrivacyProperties *)self->_globalSettings privacyDuringAlwaysOnForApp])return 1; {
  settings = self->_settings;
  }
  return [(CSLPRFAppBacklightPrivacyProperties *)settings privacyDuringAlwaysOnForApp];
}

- (BOOL)watchAppSupportsAlwaysOnDisplay
{
  return [(CSLPRFAppBacklightPrivacyProperties *)self->_settings watchAppSupportsAlwaysOnDisplay];
}

- (CSLPRFAppBacklightPrivacyResolvedSettings)initWithSettings:(id)a3 globalSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSLPRFAppBacklightPrivacyResolvedSettings;
  v9 = [(CSLPRFAppBacklightPrivacyResolvedSettings *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeStrong((id *)&v10->_globalSettings, a4);
  }

  return v10;
}

@end
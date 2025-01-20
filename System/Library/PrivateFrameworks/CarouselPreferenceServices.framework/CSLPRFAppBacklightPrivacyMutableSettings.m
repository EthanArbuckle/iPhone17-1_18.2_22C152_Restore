@interface CSLPRFAppBacklightPrivacyMutableSettings
- (BOOL)isEqualToSettings:(id)a3;
- (BOOL)privacyDuringAlwaysOnForApp;
- (BOOL)privacyDuringAlwaysOnForLiveActivities;
- (BOOL)privacyDuringAlwaysOnForNotification;
- (BOOL)watchAppSupportsAlwaysOnDisplay;
- (CSLPRFAppBacklightPrivacyMutableSettings)initWithSettings:(id)a3;
- (void)setPrivacyDuringAlwaysOnForApp:(BOOL)a3;
- (void)setPrivacyDuringAlwaysOnForLiveActivities:(BOOL)a3;
- (void)setPrivacyDuringAlwaysOnForNotification:(BOOL)a3;
@end

@implementation CSLPRFAppBacklightPrivacyMutableSettings

- (void)setPrivacyDuringAlwaysOnForLiveActivities:(BOOL)a3
{
  self->_privacyDuringAlwaysOnForLiveActivities = a3;
}

- (BOOL)privacyDuringAlwaysOnForLiveActivities
{
  return self->_privacyDuringAlwaysOnForLiveActivities;
}

- (void)setPrivacyDuringAlwaysOnForNotification:(BOOL)a3
{
  self->_privacyDuringAlwaysOnForNotification = a3;
}

- (BOOL)privacyDuringAlwaysOnForNotification
{
  return self->_privacyDuringAlwaysOnForNotification;
}

- (void)setPrivacyDuringAlwaysOnForApp:(BOOL)a3
{
  self->_privacyDuringAlwaysOnForApp = a3;
}

- (BOOL)privacyDuringAlwaysOnForApp
{
  return self->_privacyDuringAlwaysOnForApp;
}

- (BOOL)watchAppSupportsAlwaysOnDisplay
{
  return self->_watchAppSupportsAlwaysOnDisplay;
}

- (BOOL)isEqualToSettings:(id)a3
{
  return CSLPRFEqualAppBacklightPrivacySettingsValues(self, a3);
}

- (CSLPRFAppBacklightPrivacyMutableSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFAppBacklightPrivacyMutableSettings;
  v5 = [(CSLPRFAppBacklightPrivacyMutableSettings *)&v7 init];
  if (v5)
  {
    v5->_watchAppSupportsAlwaysOnDisplay = [v4 watchAppSupportsAlwaysOnDisplay];
    v5->_privacyDuringAlwaysOnForApp = [v4 privacyDuringAlwaysOnForApp];
    v5->_privacyDuringAlwaysOnForNotification = [v4 privacyDuringAlwaysOnForNotification];
    v5->_privacyDuringAlwaysOnForLiveActivities = [v4 privacyDuringAlwaysOnForLiveActivities];
  }

  return v5;
}

@end
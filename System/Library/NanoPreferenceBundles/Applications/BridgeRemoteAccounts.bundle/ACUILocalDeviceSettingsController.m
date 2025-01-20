@interface ACUILocalDeviceSettingsController
- (BOOL)fetchSettingSet;
- (int)fetchSetting;
- (int)pollInterval;
- (void)setDefaultPollIntervalIfNeeded;
- (void)setFetchSetting:(int)a3;
- (void)setFetchSettingSet:(BOOL)a3;
- (void)setPollInterval:(int)a3;
@end

@implementation ACUILocalDeviceSettingsController

- (void)setPollInterval:(int)a3
{
}

- (int)pollInterval
{
  return [(ACUILocalDeviceSettingsController *)self fetchSetting];
}

- (void)setDefaultPollIntervalIfNeeded
{
  if (![(ACUILocalDeviceSettingsController *)self fetchSettingSet]) {
    [(ACUILocalDeviceSettingsController *)self setPollInterval:1800];
  }
}

- (BOOL)fetchSettingSet
{
  return self->_fetchSettingSet;
}

- (void)setFetchSettingSet:(BOOL)a3
{
  self->_fetchSettingSet = a3;
}

- (int)fetchSetting
{
  return self->_fetchSetting;
}

- (void)setFetchSetting:(int)a3
{
  self->_fetchSetting = a3;
}

@end
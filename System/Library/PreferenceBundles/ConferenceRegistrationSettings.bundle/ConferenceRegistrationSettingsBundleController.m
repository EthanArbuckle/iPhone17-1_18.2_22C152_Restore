@interface ConferenceRegistrationSettingsBundleController
- (id)name;
- (id)settingsClassName;
- (int64_t)serviceType;
- (void)faceTimeTappedWithSpecifier:(id)a3;
@end

@implementation ConferenceRegistrationSettingsBundleController

- (int64_t)serviceType
{
  return 0;
}

- (id)settingsClassName
{
  return @"CNFRegSettingsController";
}

- (id)name
{
  return @"FaceTimeSettingsBundle";
}

- (void)faceTimeTappedWithSpecifier:(id)a3
{
}
@end
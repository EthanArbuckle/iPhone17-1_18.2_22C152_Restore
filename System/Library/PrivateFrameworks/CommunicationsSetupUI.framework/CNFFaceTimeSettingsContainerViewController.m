@interface CNFFaceTimeSettingsContainerViewController
- (id)name;
- (id)settingsClassName;
- (id)specifierTitle;
- (int64_t)serviceType;
@end

@implementation CNFFaceTimeSettingsContainerViewController

- (id)specifierTitle
{
  v2 = CommunicationsSetupUIBundle();
  v3 = CNFRegStringTableName();
  v4 = [v2 localizedStringForKey:@"FACETIME" value:&stru_26D05D4F8 table:v3];

  return v4;
}

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

@end
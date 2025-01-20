@interface CKMessagesSettingsContainerViewController
- (id)name;
- (id)settingsClassName;
- (id)specifierTitle;
- (int64_t)serviceType;
@end

@implementation CKMessagesSettingsContainerViewController

- (id)specifierTitle
{
  v2 = CommunicationsSetupUIBundle();
  v3 = CNFRegStringTableName();
  v4 = [v2 localizedStringForKey:@"MESSAGES" value:&stru_26D05D4F8 table:v3];

  return v4;
}

- (int64_t)serviceType
{
  return 1;
}

- (id)settingsClassName
{
  if (_os_feature_enabled_impl()) {
    return @"CKModernSettingsViewController";
  }
  else {
    return @"CKSettingsMessagesController";
  }
}

- (id)name
{
  return @"MessagesSettingsBundle";
}

@end
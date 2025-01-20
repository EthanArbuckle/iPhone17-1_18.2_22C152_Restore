@interface CKMessagesSettingsBundleController
- (id)name;
- (id)settingsClassName;
- (int64_t)serviceType;
- (void)messagesTappedWithSpecifier:(id)a3;
@end

@implementation CKMessagesSettingsBundleController

- (int64_t)serviceType
{
  return 1;
}

- (id)settingsClassName
{
  return @"CKSettingsMessagesController";
}

- (id)name
{
  return @"MessagesSettingsBundle";
}

- (void)messagesTappedWithSpecifier:(id)a3
{
}
@end
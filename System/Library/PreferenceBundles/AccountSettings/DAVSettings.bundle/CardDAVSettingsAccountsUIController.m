@interface CardDAVSettingsAccountsUIController
- (id)acAccountTypeString;
- (id)settingsPlistName;
- (int64_t)defaultDADataclassesToEnable;
@end

@implementation CardDAVSettingsAccountsUIController

- (id)acAccountTypeString
{
  return ACAccountTypeIdentifierCardDAV;
}

- (int64_t)defaultDADataclassesToEnable
{
  return 10;
}

- (id)settingsPlistName
{
  return @"CardDAVAccountSetup";
}

@end
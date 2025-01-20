@interface CalDAVSettingsAccountsUIController
- (BOOL)dismissesAfterInitialSetup;
- (BOOL)showDeleteButton;
- (BOOL)transitionsAfterInitialSetup;
- (id)acAccountTypeString;
- (id)settingsPlistName;
- (int64_t)defaultDADataclassesToEnable;
@end

@implementation CalDAVSettingsAccountsUIController

- (id)acAccountTypeString
{
  return ACAccountTypeIdentifierCalDAV;
}

- (int64_t)defaultDADataclassesToEnable
{
  return 20;
}

- (id)settingsPlistName
{
  return @"CalDAVAccountSetup";
}

- (BOOL)showDeleteButton
{
  return 0;
}

- (BOOL)transitionsAfterInitialSetup
{
  return 1;
}

- (BOOL)dismissesAfterInitialSetup
{
  return 0;
}

@end
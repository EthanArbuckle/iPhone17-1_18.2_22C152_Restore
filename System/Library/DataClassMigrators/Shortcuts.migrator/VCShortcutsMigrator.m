@interface VCShortcutsMigrator
- (BOOL)performMigration;
- (id)dataClassName;
@end

@implementation VCShortcutsMigrator

- (BOOL)performMigration
{
  if ([(VCShortcutsMigrator *)self userDataDisposition]) {
    return 1;
  }
  id v10 = 0;
  unsigned __int8 v2 = +[IXAppInstallCoordinator uninstallAppWithBundleID:VCBundleIdentifierShortcutsiOSAppStore requestUserConfirmation:0 waitForDeletion:0 error:&v10];
  id v3 = v10;
  _DMLogFunc();
  if (v2)
  {
    v4 = +[VCVoiceShortcutClient standardClient];
    id v9 = v3;
    unsigned __int8 v5 = [v4 requestDataMigration:&v9];
    id v6 = v9;

    _DMLogFunc();
    BOOL v7 = (v5 & 1) != 0;
    id v3 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)dataClassName
{
  return @"Shortcuts";
}

@end
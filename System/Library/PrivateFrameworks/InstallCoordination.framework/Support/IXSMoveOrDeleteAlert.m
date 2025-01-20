@interface IXSMoveOrDeleteAlert
- (IXSMoveOrDeleteAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)otherButtonLabel;
- (id)title;
- (void)otherButtonActionWithCompletion:(id)a3;
@end

@implementation IXSMoveOrDeleteAlert

- (IXSMoveOrDeleteAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)IXSMoveOrDeleteAlert;
  v6 = [(IXSUninstallAlert *)&v9 initWithAppRecord:a3 bundleIdentifier:a4 removability:a5 deletionIsRestricted:a6];
  v7 = v6;
  if (v6)
  {
    [(IXSUninstallAlert *)v6 setTypeDescription:@"Move or Delete"];
    [(IXSUninstallAlert *)v7 setNeedsArchiveOptionButton:1];
  }
  return v7;
}

- (id)title
{
  v3 = [(IXSUninstallAlert *)self appRecord];
  unsigned int v4 = [v3 isManagedAppDistributor];

  if (v4)
  {
    CFStringRef v5 = @"UNINSTALL_ICON_TITLE_MOVE_TO_APP_LIBRARY_OR_DELETE_MARKETPLACE";
  }
  else if ([(IXSUninstallAlert *)self appIsRemovable])
  {
    CFStringRef v5 = @"UNINSTALL_ICON_TITLE_MOVE_TO_APP_LIBRARY_OR_DELETE";
  }
  else
  {
    CFStringRef v5 = @"UNINSTALL_ICON_TITLE_MOVE_TO_APP_LIBRARY";
  }
  v6 = [(IXSUninstallAlert *)self localizedStringForKey:v5 withFormatHint:@"Remove “%@”?"];
  v7 = [(IXSUninstallAlert *)self appRecord];
  v8 = [v7 localizedName];
  objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

  return v9;
}

- (id)message
{
  v3 = [(IXSUninstallAlert *)self appRecord];
  unsigned int v4 = [v3 isManagedAppDistributor];

  if (v4)
  {
    CFStringRef v5 = @"UNINSTALL_ICON_BODY_MOVE_TO_APP_LIBRARY_MARKETPLACE";
    CFStringRef v6 = @"Removing from Home Screen will keep the app marketplace in your App Library. If you delete this marketplace, apps installed from this marketplace will no longer update.";
  }
  else
  {
    CFStringRef v5 = @"UNINSTALL_ICON_BODY_MOVE_TO_APP_LIBRARY";
    CFStringRef v6 = @"Removing from Home Screen will keep the app in your App Library.";
  }
  v7 = [(IXSUninstallAlert *)self localizedStringForKey:v5 withFormatHint:v6];

  return v7;
}

- (id)defaultButtonLabel
{
  v3 = [(IXSUninstallAlert *)self appRecord];
  unsigned int v4 = [v3 isManagedAppDistributor];

  if (v4)
  {
    CFStringRef v5 = @"UNINSTALL_ICON_BUTTON_DELETE_MARKETPLACE";
    CFStringRef v6 = @"Delete App Marketplace";
  }
  else
  {
    CFStringRef v5 = @"UNINSTALL_ICON_BUTTON_DELETE_APP";
    CFStringRef v6 = @"Delete App";
  }
  v7 = [(IXSUninstallAlert *)self localizedStringForKey:v5 withFormatHint:v6];

  return v7;
}

- (id)cancelButtonLabel
{
  return [(IXSUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_CANCEL" withFormatHint:@"Cancel"];
}

- (id)otherButtonLabel
{
  return [(IXSUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_MOVE" withFormatHint:@"Remove from Home Screen"];
}

- (void)otherButtonActionWithCompletion:(id)a3
{
}

@end
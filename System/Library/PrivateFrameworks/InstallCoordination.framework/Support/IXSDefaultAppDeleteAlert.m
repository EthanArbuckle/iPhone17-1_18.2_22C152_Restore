@interface IXSDefaultAppDeleteAlert
- (IXSDefaultAppDeleteAlert)initWithAppRecord:(id)a3 removability:(unint64_t)a4 defaultAppType:(unint64_t)a5;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)title;
- (unint64_t)appType;
- (void)displayAlertWithCompletion:(id)a3;
@end

@implementation IXSDefaultAppDeleteAlert

- (IXSDefaultAppDeleteAlert)initWithAppRecord:(id)a3 removability:(unint64_t)a4 defaultAppType:(unint64_t)a5
{
  id v8 = a3;
  v9 = [v8 bundleIdentifier];
  v12.receiver = self;
  v12.super_class = (Class)IXSDefaultAppDeleteAlert;
  v10 = [(IXSUninstallAlert *)&v12 initWithAppRecord:v8 bundleIdentifier:v9 removability:a4 deletionIsRestricted:0];

  if (v10)
  {
    [(IXSUninstallAlert *)v10 setTypeDescription:@"Delete Default App"];
    [(IXSUninstallAlert *)v10 setDefaultButtonAppearsDestructive:1];
    v10->_appType = a5;
  }
  return v10;
}

- (id)title
{
  v3 = [(IXSUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_TITLE_DELETE_WITH_NAME" withFormatHint:@"Delete “%@”?"];
  v4 = [(IXSUninstallAlert *)self appRecord];
  v5 = [v4 localizedName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)message
{
  if ([(IXSUninstallAlert *)self appHasiCloudDataOrDocuments])
  {
    CFStringRef v3 = @"UNINSTALL_ICON_BODY_DELETE_DATA_LEAVES_DOCUMENTS_IN_CLOUD";
    CFStringRef v4 = @"Deleting this app will also delete its data, but any documents or data stored in iCloud will not be deleted.";
  }
  else
  {
    CFStringRef v3 = @"UNINSTALL_ICON_BODY_DELETE_DATA";
    CFStringRef v4 = @"Deleting this app will also delete its data.";
  }
  v5 = [(IXSUninstallAlert *)self localizedStringForKey:v3 withFormatHint:v4];
  unint64_t v6 = [(IXSDefaultAppDeleteAlert *)self appType];
  if (v6 == 6)
  {
    CFStringRef v8 = @"UNINSTALL_ICON_BODY_PHONE";
    CFStringRef v9 = @"You do not have any other calling apps on this iPhone.";
    goto LABEL_10;
  }
  uint64_t v7 = v6;
  if (v6 == 5)
  {
    CFStringRef v8 = @"UNINSTALL_ICON_BODY_MAIL";
    CFStringRef v9 = @"You do not have any other email apps on this iPhone.";
    goto LABEL_10;
  }
  if (v6 == 4)
  {
    CFStringRef v8 = @"UNINSTALL_ICON_BODY_CONTACTLESS";
    CFStringRef v9 = @"You do not have any other contactless apps on this iPhone.";
LABEL_10:
    v10 = [(IXSUninstallAlert *)self localizedStringForKey:v8 withFormatHint:v9];
    v11 = +[NSString stringWithFormat:@"%@ %@", v5, v10];

    goto LABEL_14;
  }
  objc_super v12 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10008B624(v7, v12);
  }

  v11 = 0;
LABEL_14:

  return v11;
}

- (id)defaultButtonLabel
{
  return [(IXSUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_DELETE" withFormatHint:@"Delete"];
}

- (id)cancelButtonLabel
{
  return [(IXSUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_CANCEL" withFormatHint:@"Cancel"];
}

- (void)displayAlertWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [IXSUninstallAlertConfiguration alloc];
  unint64_t v6 = [(IXSDefaultAppDeleteAlert *)self title];
  uint64_t v7 = [(IXSDefaultAppDeleteAlert *)self message];
  v14 = [(IXSUninstallAlertConfiguration *)v5 initWithTitle:v6 message:v7];

  CFStringRef v8 = [IXSUninstallButtonConfiguration alloc];
  CFStringRef v9 = [(IXSDefaultAppDeleteAlert *)self cancelButtonLabel];
  v10 = [(IXSUninstallButtonConfiguration *)v8 initWithTitle:v9 buttonType:2];

  [(IXSUninstallAlertConfiguration *)v14 addButtonDefinition:v10 forAction:&stru_1000E9010];
  v11 = [IXSUninstallButtonConfiguration alloc];
  objc_super v12 = [(IXSDefaultAppDeleteAlert *)self defaultButtonLabel];
  v13 = [(IXSUninstallButtonConfiguration *)v11 initWithTitle:v12 buttonType:0];

  [(IXSUninstallAlertConfiguration *)v14 addButtonDefinition:v13 forAction:&stru_1000E9030];
  [(IXSUninstallButtonConfiguration *)v13 setPresentationStyle:1];
  [(IXSUninstallAlert *)self displayAlertWithCompletion:v4 uninstallAlertConfiguration:v14];
}

- (unint64_t)appType
{
  return self->_appType;
}

@end
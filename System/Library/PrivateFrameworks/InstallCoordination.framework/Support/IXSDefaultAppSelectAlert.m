@interface IXSDefaultAppSelectAlert
- (IXSDefaultAppSelectAlert)initWithAppRecord:(id)a3 removability:(unint64_t)a4 defaultAppType:(unint64_t)a5;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)title;
- (unint64_t)appType;
- (unint64_t)notificationFlags;
- (void)displayAlertWithCompletion:(id)a3;
- (void)openSettingsWithBundleID:(id)a3;
@end

@implementation IXSDefaultAppSelectAlert

- (IXSDefaultAppSelectAlert)initWithAppRecord:(id)a3 removability:(unint64_t)a4 defaultAppType:(unint64_t)a5
{
  id v8 = a3;
  v9 = [v8 bundleIdentifier];
  v12.receiver = self;
  v12.super_class = (Class)IXSDefaultAppSelectAlert;
  v10 = [(IXSUninstallAlert *)&v12 initWithAppRecord:v8 bundleIdentifier:v9 removability:a4 deletionIsRestricted:0];

  if (v10)
  {
    [(IXSUninstallAlert *)v10 setTypeDescription:@"Select Default App"];
    [(IXSUninstallAlert *)v10 setDefaultButtonAppearsDestructive:0];
    v10->_appType = a5;
  }
  return v10;
}

- (id)title
{
  switch([(IXSDefaultAppSelectAlert *)self appType])
  {
    case 1uLL:
      CFStringRef v3 = @"DEFAULT_APP_SAFARI_SELECT_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v4 = @"Select Default Browser App";
      goto LABEL_9;
    case 2uLL:
      CFStringRef v3 = @"DEFAULT_APP_APPSTORE_SELECT_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v4 = @"Select Default App Marketplace";
      goto LABEL_9;
    case 3uLL:
      CFStringRef v3 = @"DEFAULT_APP_MESSAGES_SELECT_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v4 = @"Select Another Default Messaging App";
      goto LABEL_9;
    case 4uLL:
      CFStringRef v3 = @"DEFAULT_APP_CONTACTLESS_SELECT_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v4 = @"Select Another Default Contactless App";
      goto LABEL_9;
    case 5uLL:
      CFStringRef v3 = @"DEFAULT_APP_MAIL_SELECT_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v4 = @"Select Another Default Mail App";
      goto LABEL_9;
    case 6uLL:
      CFStringRef v3 = @"DEFAULT_APP_PHONE_SELECT_DELETE_APP_TITLE";
      CFStringRef v4 = @"Select Another Default Calling App";
LABEL_9:
      v5 = [(IXSUninstallAlert *)self localizedStringForKey:v3 withFormatHint:v4];
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (id)message
{
  switch([(IXSDefaultAppSelectAlert *)self appType])
  {
    case 1uLL:
      CFStringRef v3 = @"DEFAULT_APP_SELECT_BROWSER_APP_BODY";
      CFStringRef v4 = @"Select another browser app as your default, and then you'll be able to delete “%@”.";
      goto LABEL_9;
    case 2uLL:
      CFStringRef v3 = @"DEFAULT_APP_SELECT_APP_MARKETPLACE_BODY";
      CFStringRef v4 = @"To delete “%@”, select another app marketplace as your default.";
      goto LABEL_9;
    case 3uLL:
      CFStringRef v3 = @"DEFAULT_APP_SELECT_MESSAGING_APP_BODY";
      CFStringRef v4 = @"To delete “%@”, select another messaging app as your default.";
      goto LABEL_9;
    case 4uLL:
      CFStringRef v3 = @"DEFAULT_APP_SELECT_CONTACTLESS_APP_BODY";
      CFStringRef v4 = @"To delete “%@”, select another contactless app as your default.";
      goto LABEL_9;
    case 5uLL:
      CFStringRef v3 = @"DEFAULT_APP_SELECT_MAIL_APP_BODY";
      CFStringRef v4 = @"To delete “%@”, select another mail app as your default.";
      goto LABEL_9;
    case 6uLL:
      CFStringRef v3 = @"DEFAULT_APP_SELECT_PHONE_APP_BODY";
      CFStringRef v4 = @"To delete “%@”, select another calling app as your default.";
LABEL_9:
      v6 = [(IXSUninstallAlert *)self localizedStringForKey:v3 withFormatHint:v4];
      v7 = [(IXSUninstallAlert *)self appRecord];
      id v8 = [v7 localizedName];
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (id)defaultButtonLabel
{
  v2 = [(IXSUninstallAlert *)self localizedStringForKey:@"DEFAULT_APP_SELECT_DELETE_APP_OPEN_SETTINGS" withFormatHint:@"Go to Settings"];
  CFStringRef v3 = +[NSString stringWithFormat:@" %@ ", v2];

  return v3;
}

- (id)cancelButtonLabel
{
  return [(IXSUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_CANCEL" withFormatHint:@"Cancel"];
}

- (unint64_t)notificationFlags
{
  return 35;
}

- (void)openSettingsWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  if ((char *)[(IXSDefaultAppSelectAlert *)self appType] - 1 > (char *)5)
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[IXSDefaultAppSelectAlert openSettingsWithBundleID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to open settings pane; unknown app type encountered",
        buf,
        0xCu);
    }
  }
  else
  {
    v7 = +[NSString stringWithFormat:@"app-prefs:%@&target=com.apple.settings.default-applications", v6];
    id v8 = +[NSURL URLWithString:v7];

    v9 = +[LSApplicationWorkspace defaultWorkspace];
    id v13 = 0;
    unsigned __int8 v10 = [v9 openSensitiveURL:v8 withOptions:0 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      objc_super v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "-[IXSDefaultAppSelectAlert openSettingsWithBundleID:]";
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to open url at %@: %@", buf, 0x20u);
      }
    }
  }
}

- (void)displayAlertWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [IXSUninstallAlertConfiguration alloc];
  v6 = [(IXSDefaultAppSelectAlert *)self title];
  v7 = [(IXSDefaultAppSelectAlert *)self message];
  v14 = [(IXSUninstallAlertConfiguration *)v5 initWithTitle:v6 message:v7];

  id v8 = [IXSUninstallButtonConfiguration alloc];
  v9 = [(IXSDefaultAppSelectAlert *)self defaultButtonLabel];
  unsigned __int8 v10 = [(IXSUninstallButtonConfiguration *)v8 initWithTitle:v9 buttonType:0];

  [(IXSUninstallAlertConfiguration *)v14 addButtonDefinition:v10 forAction:&stru_1000EB538];
  [(IXSUninstallButtonConfiguration *)v10 setIsPreferredButton:1];
  id v11 = [IXSUninstallButtonConfiguration alloc];
  objc_super v12 = [(IXSDefaultAppSelectAlert *)self cancelButtonLabel];
  id v13 = [(IXSUninstallButtonConfiguration *)v11 initWithTitle:v12 buttonType:2];

  [(IXSUninstallAlertConfiguration *)v14 addButtonDefinition:v13 forAction:&stru_1000EB558];
  [(IXSUninstallAlert *)self displayAlertWithCompletion:v4 uninstallAlertConfiguration:v14];
}

- (unint64_t)appType
{
  return self->_appType;
}

@end
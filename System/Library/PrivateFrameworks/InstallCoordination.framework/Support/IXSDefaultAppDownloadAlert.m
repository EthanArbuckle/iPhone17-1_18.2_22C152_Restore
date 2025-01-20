@interface IXSDefaultAppDownloadAlert
- (BOOL)openDefaultAppStoreWithError:(id *)a3;
- (IXSDefaultAppDownloadAlert)initWithAppRecord:(id)a3 removability:(unint64_t)a4 defaultAppType:(unint64_t)a5;
- (id)_bundleIDForDefaultAppMarketplace:(id *)a3;
- (id)_localizedNameForDefaultAppMarketplace;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)title;
- (unint64_t)appType;
- (void)displayAlertWithCompletion:(id)a3;
@end

@implementation IXSDefaultAppDownloadAlert

- (IXSDefaultAppDownloadAlert)initWithAppRecord:(id)a3 removability:(unint64_t)a4 defaultAppType:(unint64_t)a5
{
  id v8 = a3;
  v9 = [v8 bundleIdentifier];
  v12.receiver = self;
  v12.super_class = (Class)IXSDefaultAppDownloadAlert;
  v10 = [(IXSUninstallAlert *)&v12 initWithAppRecord:v8 bundleIdentifier:v9 removability:a4 deletionIsRestricted:0];

  if (v10)
  {
    [(IXSUninstallAlert *)v10 setTypeDescription:@"Download Default App"];
    [(IXSUninstallAlert *)v10 setDefaultButtonAppearsDestructive:0];
    v10->_appType = a5;
  }
  return v10;
}

- (id)title
{
  unint64_t v3 = [(IXSDefaultAppDownloadAlert *)self appType];
  switch(v3)
  {
    case 3uLL:
      CFStringRef v4 = @"DEFAULT_APP_MESSAGING_NOT_AVAILABLE_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v5 = @"Default Messaging App Required";
      goto LABEL_7;
    case 2uLL:
      CFStringRef v4 = @"DEFAULT_APP_APPSTORE_NOT_AVAILABLE_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v5 = @"App Marketplace Required";
      goto LABEL_7;
    case 1uLL:
      CFStringRef v4 = @"DEFAULT_APP_SAFARI_NOT_AVAILABLE_DELETE_APP_UI_ALERT_TITLE";
      CFStringRef v5 = @"Download Browser App";
LABEL_7:
      v6 = [(IXSUninstallAlert *)self localizedStringForKey:v4 withFormatHint:v5];
      goto LABEL_9;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)message
{
  unint64_t v3 = [(IXSDefaultAppDownloadAlert *)self appType];
  switch(v3)
  {
    case 3uLL:
      CFStringRef v4 = [(IXSUninstallAlert *)self localizedStringForKey:@"DEFAULT_APP_DOWNLOAD_MESSAGING_APP_UI_ALERT_BODY_FIRST" withFormatHint:@"At least one messaging app is required on this iPhone."];
      CFStringRef v5 = @"DEFAULT_APP_DOWNLOAD_MESSAGING_APP_BODY_SECOND";
      CFStringRef v6 = @"Download another messaging app, and then you can delete “%@”.";
      goto LABEL_7;
    case 2uLL:
      CFStringRef v4 = [(IXSUninstallAlert *)self localizedStringForKey:@"DEFAULT_APP_DOWNLOAD_APP_MARKETPLACE_UI_ALERT_BODY_FIRST" withFormatHint:@"At least one app marketplace is required on this iPhone."];
      CFStringRef v5 = @"DEFAULT_APP_DOWNLOAD_APP_MARKETPLACE_BODY_SECOND";
      CFStringRef v6 = @"Download another app marketplace, and then you can delete “%@”.";
      goto LABEL_7;
    case 1uLL:
      CFStringRef v4 = [(IXSUninstallAlert *)self localizedStringForKey:@"DEFAULT_APP_DOWNLOAD_BROWSER_APP_UI_ALERT_BODY_FIRST" withFormatHint:@"At least one browser app is required on this iPhone."];
      CFStringRef v5 = @"DEFAULT_APP_DOWNLOAD_BROWSER_APP_BODY_SECOND";
      CFStringRef v6 = @"Download another browser app, and then you can delete “%@”.";
LABEL_7:
      v7 = [(IXSUninstallAlert *)self localizedStringForKey:v5 withFormatHint:v6];
      id v8 = [(IXSUninstallAlert *)self appRecord];
      v9 = [v8 localizedName];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

      v11 = +[NSString stringWithFormat:@"%@ %@", v4, v10];

      goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)defaultButtonLabel
{
  if (([(IXSDefaultAppDownloadAlert *)self appType] | 2) == 3)
  {
    unint64_t v3 = [(IXSDefaultAppDownloadAlert *)self _localizedNameForDefaultAppMarketplace];
    if (v3)
    {
      CFStringRef v4 = [(IXSUninstallAlert *)self localizedStringForKey:@"DEFAULT_APP_NOT_AVAILABLE_DELETE_APP_OPEN_APP_MARKETPLACE" withFormatHint:@"Open %@"];
      CFStringRef v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v3);
    }
    else
    {
      CFStringRef v5 = 0;
    }
  }
  else
  {
    CFStringRef v5 = 0;
  }

  return v5;
}

- (id)cancelButtonLabel
{
  if ((id)[(IXSDefaultAppDownloadAlert *)self appType] == (id)2)
  {
    CFStringRef v3 = @"DEFAULT_APP_NOT_AVAILABLE_DELETE_APP_DISMISS";
    CFStringRef v4 = @"OK";
  }
  else
  {
    CFStringRef v3 = @"UNINSTALL_ICON_BUTTON_CANCEL";
    CFStringRef v4 = @"Cancel";
  }
  CFStringRef v5 = [(IXSUninstallAlert *)self localizedStringForKey:v3 withFormatHint:v4];

  return v5;
}

- (id)_localizedNameForDefaultAppMarketplace
{
  v2 = [(IXSDefaultAppDownloadAlert *)self _bundleIDForDefaultAppMarketplace:0];
  if (v2)
  {
    id v8 = 0;
    id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      CFStringRef v5 = [v3 localizedName];
    }
    else
    {
      CFStringRef v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10009297C();
      }

      CFStringRef v5 = 0;
    }
  }
  else
  {
    CFStringRef v5 = 0;
  }

  return v5;
}

- (id)_bundleIDForDefaultAppMarketplace:(id *)a3
{
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v16 = 0;
  CFStringRef v5 = [v4 getPreferredAppMarketplacesWithError:&v16];
  id v6 = v16;

  if (v5)
  {
    if ([v5 count])
    {
      v7 = [v5 objectAtIndexedSubscript:0];
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    objc_super v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100092A78();
    }

    v10 = @"Unexpectedly found empty list for preferred app marketplaces";
    uint64_t v11 = 153;
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000929F8();
    }

    v10 = @"Failed to get list of preferred app marketplaces";
    uint64_t v11 = 145;
  }
  uint64_t v13 = sub_10003DAE4((uint64_t)"-[IXSDefaultAppDownloadAlert _bundleIDForDefaultAppMarketplace:]", v11, @"IXErrorDomain", 1uLL, v6, 0, v10, v9, v15);

  v7 = 0;
  id v6 = (id)v13;
  if (!a3) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v7) {
    *a3 = v6;
  }
LABEL_14:

  return v7;
}

- (BOOL)openDefaultAppStoreWithError:(id *)a3
{
  id v3 = [(IXSDefaultAppDownloadAlert *)self _bundleIDForDefaultAppMarketplace:a3];
  if (v3)
  {
    id v4 = +[LSApplicationWorkspace defaultWorkspace];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100043C2C;
    v6[3] = &unk_1000EA550;
    id v7 = v3;
    [v4 openApplicationWithBundleIdentifier:v7 configuration:0 completionHandler:v6];
  }
  return v3 != 0;
}

- (void)displayAlertWithCompletion:(id)a3
{
  id v12 = a3;
  id v4 = [IXSUninstallAlertConfiguration alloc];
  CFStringRef v5 = [(IXSDefaultAppDownloadAlert *)self title];
  id v6 = [(IXSDefaultAppDownloadAlert *)self message];
  id v7 = [(IXSUninstallAlertConfiguration *)v4 initWithTitle:v5 message:v6];

  id v8 = [(IXSDefaultAppDownloadAlert *)self defaultButtonLabel];
  if (v8)
  {
    uint64_t v9 = [[IXSUninstallButtonConfiguration alloc] initWithTitle:v8 buttonType:0];
    [(IXSUninstallAlertConfiguration *)v7 addButtonDefinition:v9 forAction:&stru_1000EA570];
    [(IXSUninstallButtonConfiguration *)v9 setIsPreferredButton:1];
  }
  v10 = [(IXSDefaultAppDownloadAlert *)self cancelButtonLabel];
  if (v10)
  {
    uint64_t v11 = [[IXSUninstallButtonConfiguration alloc] initWithTitle:v10 buttonType:2];
    [(IXSUninstallAlertConfiguration *)v7 addButtonDefinition:v11 forAction:&stru_1000EA590];
    if (!v8) {
      [(IXSUninstallButtonConfiguration *)v11 setIsPreferredButton:1];
    }
  }
  [(IXSUninstallAlert *)self displayAlertWithCompletion:v12 uninstallAlertConfiguration:v7];
}

- (unint64_t)appType
{
  return self->_appType;
}

@end
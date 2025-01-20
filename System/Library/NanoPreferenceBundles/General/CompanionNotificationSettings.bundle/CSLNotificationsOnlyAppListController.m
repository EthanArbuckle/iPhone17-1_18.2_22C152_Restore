@interface CSLNotificationsOnlyAppListController
- (NSString)bundleID;
- (NSString)paneTitle;
- (id)applicationBundleIdentifier;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (void)setBundleID:(id)a3;
- (void)setPaneTitle:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation CSLNotificationsOnlyAppListController

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"bundleID"];
  v6 = (NSString *)[v5 copy];
  bundleID = self->_bundleID;
  self->_bundleID = v6;

  v8 = [v4 propertyForKey:@"localizedName"];
  v9 = (NSString *)[v8 copy];
  paneTitle = self->_paneTitle;
  self->_paneTitle = v9;

  v11.receiver = self;
  v11.super_class = (Class)CSLNotificationsOnlyAppListController;
  [(CSLNotificationsOnlyAppListController *)&v11 setSpecifier:v4];
}

- (id)applicationBundleIdentifier
{
  return self->_bundleID;
}

- (id)localizedPaneTitle
{
  return self->_paneTitle;
}

- (id)localizedMirroringDetailFooter
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  if ([(CSLNotificationsOnlyAppListController *)self showAlerts]) {
    CFStringRef v4 = @"SHOW_ALERTS_FOOTER";
  }
  else {
    CFStringRef v4 = @"DONT_SHOW_ALERTS_FOOTER";
  }
  v5 = [v3 localizedStringForKey:v4 value:&stru_C650 table:@"Notifications"];

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)paneTitle
{
  return self->_paneTitle;
}

- (void)setPaneTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneTitle, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
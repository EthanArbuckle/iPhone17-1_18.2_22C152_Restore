@interface BuddyChinaPhoneNumberPermissionController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BuddyChinaPhoneNumberPermissionController)init;
- (void)viewDidLoad;
@end

@implementation BuddyChinaPhoneNumberPermissionController

- (BuddyChinaPhoneNumberPermissionController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyChinaPhoneNumberPermissionController;
  id location = [(BuddyPhoneNumberPermissionController *)&v4 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    [location setIncludeAppleAccountCheck:0];
    [location setIncludeCellularDataCheck:1];
  }
  v2 = (BuddyChinaPhoneNumberPermissionController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyChinaPhoneNumberPermissionController;
  [(BuddyPhoneNumberPermissionController *)&v6 viewDidLoad];
  id v2 = [(BuddyChinaPhoneNumberPermissionController *)v8 headerView];
  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PHONE_NUMBER_PERMISSION_INFO_WITH_WIRELESS_DATA_NOTICE"];
  SEL v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  [v2 setDetailText:v5];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupMessagingActivationUsingPhoneNumber;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)BuddyChinaPhoneNumberPermissionController;
  if (![(BuddyPhoneNumberPermissionController *)&v10 controllerNeedsToRun]) {
    return 0;
  }
  id v2 = [(BuddyPhoneNumberPermissionController *)v12 capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 mgHasGreenTea];

  if (v3) {
    return 1;
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = oslog;
    os_log_type_t v5 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "PhoneNumber Permission can only be shown in China, skipping", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

@end
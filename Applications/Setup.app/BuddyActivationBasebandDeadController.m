@interface BuddyActivationBasebandDeadController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
- (BuddyActivationBasebandDeadController)init;
- (void)_shutdownTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyActivationBasebandDeadController

- (BuddyActivationBasebandDeadController)init
{
  id v12 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ACTIVATION_ERROR_BASEBAND_DEAD_DETAIL"];
  location[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  id v4 = v12;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"ACTIVATION_ERROR_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v7 = +[UIImage imageNamed:@"Alert Icon"];
  id v12 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)BuddyActivationBasebandDeadController;
  id v12 = [(BuddyActivationBasebandDeadController *)&v10 initWithTitle:v6 detailText:location[0] icon:v7];
  v8 = (BuddyActivationBasebandDeadController *)v12;

  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v8;
}

- (void)viewDidLoad
{
  objc_super v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)BuddyActivationBasebandDeadController;
  [(BuddyActivationBasebandDeadController *)&v8 viewDidLoad];
  id v2 = [(BuddyActivationBasebandDeadController *)v10 headerView];
  [v2 setIconInheritsTint:1];

  id v3 = +[UIColor redColor];
  id v4 = [(BuddyActivationBasebandDeadController *)v10 headerView];
  [v4 setTintColor:v3];

  v5 = v10;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"SHUTDOWN" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v5 addBoldButton:v7 action:"_shutdownTapped:"];
}

- (void)_shutdownTapped:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User requests shutdown UI on baseband dead pane...", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  SBSPresentPowerDownUI();
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerNeedsToRun
{
  id v6 = a1;
  SEL v5 = a2;
  char v4 = 0;
  oslog[2] = (os_log_t)_CTServerConnectionCreateWithIdentifier();
  memset(&oslog[1], 0, sizeof(os_log_t));
  oslog[1] = (os_log_t)_CTServerConnectionGetRadioModuleIsDead();
  if (!LODWORD(oslog[1])) {
    return v4 != 0;
  }
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
  {
    sub_10004F3FC((uint64_t)buf, (int)oslog[1], SHIDWORD(oslog[1]));
    _os_log_error_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_ERROR, "Unable to check baseband status for signs of life: %d - %d", buf, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
  return 0;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

@end
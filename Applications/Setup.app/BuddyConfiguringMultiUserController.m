@interface BuddyConfiguringMultiUserController
- (BOOL)controllerNeedsToRun;
- (BuddyConfiguringMultiUserController)init;
- (DMCReturnToServiceController)mdmReturnToServiceController;
- (MCProfileConnection)managedConfiguration;
- (UIActivityIndicatorView)spinner;
- (UILabel)infoLabel;
- (void)_showConfigurationFailedForError:(id)a3;
- (void)provisionDeviceForMultiUserAndSwitchToLoginWindow;
- (void)setInfoLabel:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMdmReturnToServiceController:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyConfiguringMultiUserController

- (BuddyConfiguringMultiUserController)init
{
  SEL v8 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MULTI_USER_TIME_IPAD" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyConfiguringMultiUserController;
  id location = [(BuddyConfiguringMultiUserController *)&v7 initWithSpinnerText:v4];
  v5 = (BuddyConfiguringMultiUserController *)location;

  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  SEL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyConfiguringMultiUserController;
  [(BuddyConfiguringMultiUserController *)&v5 viewWillAppear:a3];
  id v3 = [(BuddyConfiguringMultiUserController *)v8 navigationItem];
  [v3 setHidesBackButton:1];

  v4 = +[UIApplication sharedApplication];
  [(UIApplication *)v4 setIdleTimerDisabled:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyConfiguringMultiUserController;
  [(BuddyConfiguringMultiUserController *)&v3 viewDidAppear:a3];
  [(BuddyConfiguringMultiUserController *)v6 provisionDeviceForMultiUserAndSwitchToLoginWindow];
}

- (void)provisionDeviceForMultiUserAndSwitchToLoginWindow
{
  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  BOOL v6 = sub_100139388;
  SEL v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_showConfigurationFailedForError:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_100139738;
  SEL v8 = &unk_1002B12F0;
  id v9 = location[0];
  v10 = v12;
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyConfiguringMultiUserController *)self managedConfiguration];
  unsigned int v3 = [(MCProfileConnection *)v2 userMode];
  char v6 = 0;
  char v4 = 0;
  if (v3 == 1)
  {
    SEL v7 = [(BuddyConfiguringMultiUserController *)self managedConfiguration];
    char v6 = 1;
    char v4 = [(MCProfileConnection *)v7 isEphemeralMultiUser] ^ 1;
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
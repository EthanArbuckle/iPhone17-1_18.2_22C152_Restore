@interface BuddyManagedConfigurationMigrationController
- (BOOL)isPaneVisible;
- (BOOL)waitingForMigration;
- (BuddyManagedConfigurationMigrationController)init;
- (MCProfileConnection)managedConfiguration;
- (void)loadView;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setPaneVisible:(BOOL)a3;
- (void)setWaitingForMigration:(BOOL)a3;
@end

@implementation BuddyManagedConfigurationMigrationController

- (BuddyManagedConfigurationMigrationController)init
{
  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"COMPLETING_SETUP"];
  v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id location = [(BuddyManagedConfigurationMigrationController *)self initWithSpinnerText:v5];
  v6 = (BuddyManagedConfigurationMigrationController *)location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)loadView
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyManagedConfigurationMigrationController;
  [(BuddyManagedConfigurationMigrationController *)&v3 loadView];
  id v2 = [(BuddyManagedConfigurationMigrationController *)v5 navigationItem];
  [v2 setHidesBackButton:1];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyManagedConfigurationMigrationController *)v21 setWaitingForMigration:1];
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  SEL v4 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  v16 = sub_10018D74C;
  v17 = &unk_1002B0CD0;
  v18 = v21;
  id v19 = location[0];
  dispatch_after(v3, (dispatch_queue_t)v4, &block);

  v5 = dispatch_get_global_queue(0, 0);
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10018D82C;
  v10 = &unk_1002B0CD0;
  v11 = v21;
  id v12 = location[0];
  dispatch_async(v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BOOL)isPaneVisible
{
  return self->_paneVisible;
}

- (void)setPaneVisible:(BOOL)a3
{
  self->_paneVisible = a3;
}

- (BOOL)waitingForMigration
{
  return self->_waitingForMigration;
}

- (void)setWaitingForMigration:(BOOL)a3
{
  self->_waitingForMigration = a3;
}

- (void).cxx_destruct
{
}

@end
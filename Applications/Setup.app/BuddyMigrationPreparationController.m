@interface BuddyMigrationPreparationController
- (BOOL)_ableToMigrateWithPreflightInformation:(id)a3;
- (BOOL)isPaneVisible;
- (BOOL)waiting;
- (BuddyMigrationPreparationController)init;
- (BuddyMiscState)miscState;
- (id)extendedInitializationCompletion;
- (void)_controllerDone;
- (void)_showError:(id)a3;
- (void)_showErrorController:(id)a3;
- (void)_showOutOfSpaceError;
- (void)_waitForKeychainAndPreflight;
- (void)_waitForPreflight;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setExtendedInitializationCompletion:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPaneVisible:(BOOL)a3;
- (void)setWaiting:(BOOL)a3;
@end

@implementation BuddyMigrationPreparationController

- (BuddyMigrationPreparationController)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MIGRATION_PREPARING" value:&stru_1002B4E18 table:@"Migration"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyMigrationPreparationController;
  id location = [(BuddyMigrationPreparationController *)&v9 initWithSpinnerText:v4];
  objc_storeStrong(&location, location);

  if (location)
  {
    id v5 = [location navigationItem];
    [v5 setTitle:&stru_1002B4E18];

    id v6 = [location navigationItem];
    [v6 setHidesBackButton:1 animated:0];
  }
  v7 = (BuddyMigrationPreparationController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMigrationPreparationController *)v24 miscState];
  v4 = [(BuddyMiscState *)v3 migrationManager];
  unsigned __int8 v5 = [(BuddyTargetDeviceMigrationManager *)v4 requiresUpdateToMigrate];

  if (v5)
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v22 = 1;
  }
  else
  {
    [(BuddyMigrationPreparationController *)v24 setWaiting:1];
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_1000905A4;
    v19 = &unk_1002B0CD0;
    v20 = v24;
    id v21 = location[0];
    dispatch_after(v6, (dispatch_queue_t)v7, &block);

    [(BuddyMigrationPreparationController *)v24 setExtendedInitializationCompletion:location[0]];
    v8 = dispatch_get_global_queue(0, 0);
    objc_super v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_10009061C;
    v13 = &unk_1002B0D20;
    v14 = v24;
    dispatch_async(v8, &v9);

    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
    int v22 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_waitForKeychainAndPreflight
{
  int v10 = self;
  location[1] = (id)a2;
  v2 = [(BuddyMigrationPreparationController *)self miscState];
  location[0] = [(BuddyMiscState *)v2 migrationManager];

  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  dispatch_time_t v6 = sub_100090734;
  v7 = &unk_1002B0FF0;
  v8 = v10;
  [location[0] waitForKeychain:&v3];
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_waitForPreflight
{
  int v10 = self;
  location[1] = (id)a2;
  v2 = [(BuddyMigrationPreparationController *)self miscState];
  location[0] = [(BuddyMiscState *)v2 migrationManager];

  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  dispatch_time_t v6 = sub_1000909F4;
  v7 = &unk_1002B1E38;
  v8 = v10;
  [location[0] waitForPreflight:&v3];
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_controllerDone
{
  -[BuddyMigrationPreparationController setWaiting:](self, "setWaiting:", 0, a2);
  if ([(BuddyMigrationPreparationController *)self isPaneVisible])
  {
    id v2 = [(BuddyMigrationPreparationController *)self delegate];
    [v2 flowItemDone:self];
  }
  else
  {
    id v3 = [(BuddyMigrationPreparationController *)self extendedInitializationCompletion];

    if (v3)
    {
      int v4 = (void (**)(id, void))[(BuddyMigrationPreparationController *)self extendedInitializationCompletion];
      v4[2](v4, 0);

      [(BuddyMigrationPreparationController *)self setExtendedInitializationCompletion:0];
    }
  }
}

- (void)_showOutOfSpaceError
{
  id v3 = self;
  location[1] = (id)a2;
  location[0] = [[BuddyMigrationTargetErrorController alloc] initForInsufficientSpace];
  [(BuddyMigrationPreparationController *)v3 _showErrorController:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_showError:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [BuddyMigrationTargetErrorController alloc];
  int v4 = [(BuddyMigrationTargetErrorController *)v3 initWithError:location[0]];
  -[BuddyMigrationPreparationController _showErrorController:](v7, "_showErrorController:", v4, v4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_showErrorController:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationPreparationController *)v20 miscState];
  int v4 = [(BuddyMiscState *)v3 migrationManager];
  unsigned __int8 v5 = [(BuddyTargetDeviceMigrationManager *)v4 hasTransferredData];
  [location[0] setForceErase:v5 & 1];

  id v6 = [(BuddyMigrationPreparationController *)v20 delegate];
  [location[0] setDelegate:v6];

  [(BuddyMigrationPreparationController *)v20 setWaiting:0];
  if ([(BuddyMigrationPreparationController *)v20 isPaneVisible])
  {
    id v7 = [(BuddyMigrationPreparationController *)v20 delegate];
    [v7 flowItemDone:v20 nextItem:location[0]];
  }
  else
  {
    id v8 = [(BuddyMigrationPreparationController *)v20 extendedInitializationCompletion];

    if (v8)
    {
      objc_super v9 = (void (**)(id, uint64_t))[(BuddyMigrationPreparationController *)v20 extendedInitializationCompletion];
      v9[2](v9, 1);

      [(BuddyMigrationPreparationController *)v20 setExtendedInitializationCompletion:0];
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      int v11 = &_dispatch_main_q;
      block = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      v15 = sub_100090F94;
      int v16 = &unk_1002B12F0;
      int v17 = v20;
      id v18 = location[0];
      dispatch_after(v10, (dispatch_queue_t)v11, &block);

      objc_storeStrong(&v18, 0);
      objc_storeStrong((id *)&v17, 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_ableToMigrateWithPreflightInformation:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = 0;
  if (location[0])
  {
    id v4 = [location[0] sourceDeviceDataSize];
    BOOL v3 = v4 < [location[0] targetDeviceFreeSpaceSize];
  }
  objc_storeStrong(location, 0);
  return v3;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
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

- (BOOL)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (id)extendedInitializationCompletion
{
  return self->_extendedInitializationCompletion;
}

- (void)setExtendedInitializationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
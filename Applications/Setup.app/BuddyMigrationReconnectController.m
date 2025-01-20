@interface BuddyMigrationReconnectController
- (BOOL)didReconnect;
- (BOOL)shouldAllowStartOver;
- (BOOL)userDidCancelReconnect;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMigrationReconnectController)init;
- (BuddyMiscState)miscState;
- (ProximitySetupController)proximitySetupController;
- (id)doesRestartFlowCauseEraseBlock;
- (id)prepareForDeviceMigrationBlock;
- (id)startDeviceMigrationBlock;
- (void)_cancelTapped:(id)a3;
- (void)_startMigration;
- (void)_startMigrationIfPossible;
- (void)exitMigrationReconnectController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setDidReconnect:(BOOL)a3;
- (void)setDoesRestartFlowCauseEraseBlock:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPrepareForDeviceMigrationBlock:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setStartDeviceMigrationBlock:(id)a3;
- (void)setUserDidCancelReconnect:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyMigrationReconnectController

- (BuddyMigrationReconnectController)init
{
  SEL v13 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"RECONNECTING" value:&stru_1002B4E18 table:@"Migration"];
  id location = 0;
  v12.receiver = self;
  v12.super_class = (Class)BuddyMigrationReconnectController;
  id location = [(BuddyMigrationReconnectController *)&v12 initWithSpinnerText:v4];
  objc_storeStrong(&location, location);

  if (location)
  {
    id v5 = [location navigationItem];
    [v5 setTitle:&stru_1002B4E18];

    id v6 = [location navigationItem];
    [v6 setHidesBackButton:1 animated:0];

    id v7 = [location navigationItem];
    id v8 = objc_alloc((Class)UIBarButtonItem);
    id v9 = [v8 initWithBarButtonSystemItem:1 target:location action:"_cancelTapped:"];
    [v7 setLeftBarButtonItem:v9 animated:0];

    [location setDidReconnect:0];
    [location setUserDidCancelReconnect:0];
  }
  v10 = (BuddyMigrationReconnectController *)location;
  objc_storeStrong(&location, 0);
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  v19 = self;
  SEL v18 = a2;
  BOOL v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BuddyMigrationReconnectController;
  [(BuddyMigrationReconnectController *)&v16 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = oslog;
    os_log_type_t v4 = v14;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Waiting for connection...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = [(BuddyMigrationReconnectController *)v19 proximitySetupController];
  [(ProximitySetupController *)v5 startReconnecting];

  id v6 = [(BuddyMigrationReconnectController *)v19 proximitySetupController];
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100109468;
  v11 = &unk_1002B0EC0;
  objc_super v12 = v19;
  [(ProximitySetupController *)v6 waitForSessionReconnection:&v7];

  objc_storeStrong((id *)&v12, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMigrationReconnectController *)v11 proximitySetupController];
  unsigned __int8 v4 = [(ProximitySetupController *)v3 hasConnection];

  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v8;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Already connected, starting migration...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BuddyMigrationReconnectController *)v11 _startMigration];
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
  }
  else if (location[0])
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)_startMigrationIfPossible
{
  unsigned __int8 v4 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10004F3FC((uint64_t)buf, [(BuddyMigrationReconnectController *)v4 didReconnect], [(BuddyMigrationReconnectController *)v4 userDidCancelReconnect]);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Considering starting migration - did reconnect %d, user did cancel %d", buf, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
  if ([(BuddyMigrationReconnectController *)v4 didReconnect]
    && ![(BuddyMigrationReconnectController *)v4 userDidCancelReconnect])
  {
    [(BuddyMigrationReconnectController *)v4 _startMigration];
    id v2 = [(BuddyMigrationReconnectController *)v4 delegate];
    [v2 flowItemDone:v4];
  }
}

- (void)_startMigration
{
  id v2 = (void (**)(id, uint64_t))[(BuddyMigrationReconnectController *)self prepareForDeviceMigrationBlock];
  v2[2](v2, 1);

  v3 = (void (**)(void))[(BuddyMigrationReconnectController *)self startDeviceMigrationBlock];
  v3[2](v3);
}

- (void)_cancelTapped:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyMigrationReconnectController *)v15 setUserDidCancelReconnect:1];
  char v13 = 0;
  v3 = (uint64_t (**)(void))[(BuddyMigrationReconnectController *)v15 doesRestartFlowCauseEraseBlock];
  char v4 = v3[2](v3);

  char v13 = v4 & 1;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = sub_100109A1C;
  int v9 = &unk_1002B3280;
  v10 = v15;
  char v11 = v4 & 1;
  id v12 = +[BuddyMigrationCancelAlertController alertControllerForTargetWithNeedsErase:v4 & 1 completion:&v5];
  [(BuddyMigrationReconnectController *)v15 presentViewController:v12 animated:1 completion:0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)exitMigrationReconnectController
{
  id v2 = [(BuddyMigrationReconnectController *)self delegate];
  id v3 = [v2 popToBuddyControllerWithClass:objc_opt_class() animated:1];
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (id)doesRestartFlowCauseEraseBlock
{
  return self->_doesRestartFlowCauseEraseBlock;
}

- (void)setDoesRestartFlowCauseEraseBlock:(id)a3
{
}

- (id)prepareForDeviceMigrationBlock
{
  return self->_prepareForDeviceMigrationBlock;
}

- (void)setPrepareForDeviceMigrationBlock:(id)a3
{
}

- (id)startDeviceMigrationBlock
{
  return self->_startDeviceMigrationBlock;
}

- (void)setStartDeviceMigrationBlock:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BOOL)didReconnect
{
  return self->_didReconnect;
}

- (void)setDidReconnect:(BOOL)a3
{
  self->_didReconnect = a3;
}

- (BOOL)userDidCancelReconnect
{
  return self->_userDidCancelReconnect;
}

- (void)setUserDidCancelReconnect:(BOOL)a3
{
  self->_userDidCancelReconnect = a3;
}

- (void).cxx_destruct
{
}

@end
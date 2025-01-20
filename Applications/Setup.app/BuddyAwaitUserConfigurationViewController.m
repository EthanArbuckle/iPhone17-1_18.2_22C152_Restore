@interface BuddyAwaitUserConfigurationViewController
- (BOOL)_reverifyUserConfigurationState;
- (BOOL)shouldAllowStartOver;
- (BuddyAwaitUserConfigurationController)awaitUserConfigurationController;
- (MCProfileConnection)managedConfiguration;
- (NSTimer)timer;
- (int)token;
- (void)dealloc;
- (void)setAwaitUserConfigurationController:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setTimer:(id)a3;
- (void)setToken:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyAwaitUserConfigurationViewController

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = [(BuddyAwaitUserConfigurationViewController *)self timer];
  [(NSTimer *)v2 invalidate];

  [(BuddyAwaitUserConfigurationViewController *)v5 setTimer:0];
  if (notify_is_valid_token(v5->_token)) {
    notify_cancel(v5->_token);
  }
  v3.receiver = v5;
  v3.super_class = (Class)BuddyAwaitUserConfigurationViewController;
  [(BuddyAwaitUserConfigurationViewController *)&v3 dealloc];
}

- (BOOL)shouldAllowStartOver
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v36 = self;
  SEL v35 = a2;
  BOOL v34 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BuddyAwaitUserConfigurationViewController;
  [(BuddyAwaitUserConfigurationViewController *)&v33 viewDidAppear:a3];
  if (![(BuddyAwaitUserConfigurationViewController *)v36 _reverifyUserConfigurationState])
  {
    objc_initWeak(&location, v36);
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_100072F70;
    v29 = &unk_1002B0CA8;
    objc_copyWeak(&v30, &location);
    id v31 = objc_retainBlock(&v25);
    int v24 = 0;
    objc_super v3 = (const char *)[DMCUserSettingsChangedNotification UTF8String];
    p_token = &v36->_token;
    v5 = &_dispatch_main_q;
    handler = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = sub_100072FCC;
    v22 = &unk_1002B1528;
    id v23 = v31;
    LODWORD(v3) = notify_register_dispatch(v3, p_token, (dispatch_queue_t)v5, &handler);

    int v24 = (int)v3;
    if (v3)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      char v16 = 16;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v6 = oslog;
        os_log_type_t v7 = v16;
        sub_10004B24C(buf);
        _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Failed to register for user settings changed notification!", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v9 = _NSConcreteStackBlock;
      int v10 = -1073741824;
      int v11 = 0;
      v12 = sub_100073004;
      v13 = &unk_1002B1550;
      id v14 = v31;
      v8 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v9 block:5.0];
      [(BuddyAwaitUserConfigurationViewController *)v36 setTimer:v8];

      objc_storeStrong(&v14, 0);
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v31, 0);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_reverifyUserConfigurationState
{
  v13 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyAwaitUserConfigurationViewController *)self awaitUserConfigurationController];
  objc_super v3 = [(BuddyAwaitUserConfigurationController *)v2 managedConfiguration];
  unsigned __int8 v4 = [(MCProfileConnection *)v3 isAwaitingUserConfigured];

  if (v4) {
    return 0;
  }
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = oslog[0];
    os_log_type_t v6 = v11;
    sub_10004B24C(v10);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Current user is configured", (uint8_t *)v10, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  os_log_type_t v7 = [(BuddyAwaitUserConfigurationViewController *)v13 timer];
  [(NSTimer *)v7 invalidate];

  v8 = [(BuddyAwaitUserConfigurationViewController *)v13 awaitUserConfigurationController];
  [(BuddyAwaitUserConfigurationController *)v8 controllerDone];

  return 1;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyAwaitUserConfigurationController)awaitUserConfigurationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_awaitUserConfigurationController);

  return (BuddyAwaitUserConfigurationController *)WeakRetained;
}

- (void)setAwaitUserConfigurationController:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface InstallationService
- (InstallationService)init;
- (id)_init;
- (void)areInitialContentDownloadsEnabledWithReplyHandler:(id)a3;
- (void)dealloc;
- (void)installAppReviewApps:(id)a3 withReplyHandler:(id)a4;
- (void)installEnterpriseApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installSystemApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installTestFlightApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installWatchApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)setInitialContentDownloadsEnabled:(BOOL)a3;
- (void)setShouldPostNotificationOnDefaultBrowserInstallation:(BOOL)a3;
- (void)shouldPostNotificationOnDefaultBrowserInstallationWithReplyHandler:(id)a3;
@end

@implementation InstallationService

- (InstallationService)init
{
  v3 = objc_alloc_init(_InstallationService_XDC);

  return &v3->super;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)InstallationService;
  [(InstallationService *)&v4 dealloc];
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)InstallationService;
  v2 = [(InstallationService *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.InstallationService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v6;

    uint64_t v8 = sub_1003E0BA4();
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v8;
  }
  return v2;
}

- (void)areInitialContentDownloadsEnabledWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100228B4C;
  v9[3] = &unk_100521698;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(dispatchQueue, v9);
}

- (void)setInitialContentDownloadsEnabled:(BOOL)a3
{
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100228D14;
  v8[3] = &unk_1005229A8;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  sub_100010948(dispatchQueue, v8);
}

- (void)shouldPostNotificationOnDefaultBrowserInstallationWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100228EF4;
  v9[3] = &unk_100521698;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(dispatchQueue, v9);
}

- (void)setShouldPostNotificationOnDefaultBrowserInstallation:(BOOL)a3
{
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002290BC;
  v8[3] = &unk_1005229A8;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  sub_100010948(dispatchQueue, v8);
}

- (void)installAppReviewApps:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002292C8;
  v13[3] = &unk_100522448;
  id v14 = v6;
  id v15 = v8;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  sub_100010948(dispatchQueue, v13);
}

- (void)installEnterpriseApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  sub_100016788();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_10022949C((uint64_t)self, v8, v7, v9);
}

- (void)installSystemApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  sub_100016788();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_100229604((uint64_t)self, v8, v7, v9);
}

- (void)installTestFlightApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  sub_100016788();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_1002297DC((uint64_t)self, v8, 0, v7, v9);
}

- (void)installWatchApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002299B4;
  v14[3] = &unk_100522448;
  v14[4] = self;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  sub_100010948(dispatchQueue, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_requestThrottle, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong(&self->_bagChangedNotification, 0);
}

@end
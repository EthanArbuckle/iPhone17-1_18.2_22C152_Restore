@interface CSLPRFInstalledLiveActivityApplicationsDataSource
- (CSLPRFInstalledLiveActivityApplicationsDataSource)init;
- (CSLPRFInstalledLiveActivityApplicationsDataSourceDelegate)delegate;
- (NSArray)apps;
- (NSMutableArray)mutableApps;
- (id)backgroundModesForBundleId:(id)a3;
- (void)_applicationDatabaseDidChange:(id)a3;
- (void)_setApplications:(id)a3;
- (void)_update;
- (void)_withLock:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setMutableApps:(id)a3;
- (void)start;
@end

@implementation CSLPRFInstalledLiveActivityApplicationsDataSource

- (CSLPRFInstalledLiveActivityApplicationsDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFInstalledLiveActivityApplicationsDataSource;
  v2 = [(CSLPRFInstalledLiveActivityApplicationsDataSource *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableApps = v2->_mutableApps;
    v2->_mutableApps = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)start
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_applicationDatabaseDidChange:" name:ACXRemoteApplicationsInstalledDistributedNotification object:0];

  v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_applicationDatabaseDidChange:" name:ACXRemoteApplicationsUpdatedDistributedNotification object:0];

  v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_applicationDatabaseDidChange:" name:ACXRemoteApplicationsUninstalledDistributedNotification object:0];

  [(CSLPRFInstalledLiveActivityApplicationsDataSource *)self _update];
}

- (void)invalidate
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_setApplications:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_27B4;
  v4[3] = &unk_1CBF0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CSLPRFInstalledLiveActivityApplicationsDataSource *)v5 _withLock:v4];
}

- (void)_update
{
  id v3 = _os_activity_create(&dword_0, "Update Apps", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  v5 = [v4 getActivePairedDevice];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  dispatch_group_t v7 = dispatch_group_create();
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_2AFC;
  v26[3] = &unk_1CC18;
  v8 = v3;
  v27 = v8;
  v9 = v7;
  v28 = v9;
  v29 = self;
  id v10 = v6;
  id v30 = v10;
  v11 = objc_retainBlock(v26);
  dispatch_group_enter(v9);
  v12 = +[ACXDeviceConnection sharedDeviceConnection];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_2D3C;
  v24[3] = &unk_1CC40;
  v13 = v11;
  id v25 = v13;
  [v12 enumerateInstalledApplicationsOnPairedDevice:v5 withBlock:v24];

  dispatch_group_enter(v9);
  v14 = +[ACXDeviceConnection sharedDeviceConnection];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_2D54;
  v22[3] = &unk_1CC68;
  v15 = v13;
  id v23 = v15;
  [v14 enumerateLocallyAvailableApplicationsForPairedDevice:v5 options:1 withBlock:v22];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2D6C;
  block[3] = &unk_1CCB8;
  v19 = v8;
  id v20 = v10;
  v21 = self;
  id v16 = v10;
  v17 = v8;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  os_activity_scope_leave(&state);
}

- (void)_applicationDatabaseDidChange:(id)a3
{
}

- (id)backgroundModesForBundleId:(id)a3
{
  id v4 = a3;
  SEL v5 = NSSelectorFromString(@"uiBackgroundModes");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_apps;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "bundleIdentifier", (void)v15);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v13 = [v10 backgroundModes];
          id v7 = +[NSMutableArray arrayWithArray:v13];

          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v10, "performSelector:", v5));
          }
          goto LABEL_12;
        }
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (CSLPRFInstalledLiveActivityApplicationsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLPRFInstalledLiveActivityApplicationsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)apps
{
  return self->_apps;
}

- (NSMutableArray)mutableApps
{
  return self->_mutableApps;
}

- (void)setMutableApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
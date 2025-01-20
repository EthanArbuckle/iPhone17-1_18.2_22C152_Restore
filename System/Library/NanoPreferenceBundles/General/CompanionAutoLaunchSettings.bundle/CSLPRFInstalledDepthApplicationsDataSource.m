@interface CSLPRFInstalledDepthApplicationsDataSource
- (CSLPRFInstalledDepthApplicationsDataSource)initWithStingModel:(id)a3;
- (CSLPRFInstalledDepthApplicationsDataSourceDelegate)delegate;
- (CSLPRFStingSettingsModel)stingSettingsModel;
- (NSArray)apps;
- (NSMutableArray)mutableApps;
- (void)_applicationDatabaseDidChange:(id)a3;
- (void)_setApplications:(id)a3;
- (void)_stingSettingsModelDidChange:(id)a3;
- (void)_update;
- (void)_withLock:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setMutableApps:(id)a3;
- (void)setStingSettingsModel:(id)a3;
- (void)start;
@end

@implementation CSLPRFInstalledDepthApplicationsDataSource

- (CSLPRFInstalledDepthApplicationsDataSource)initWithStingModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSLPRFInstalledDepthApplicationsDataSource;
  v6 = [(CSLPRFInstalledDepthApplicationsDataSource *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableApps = v6->_mutableApps;
    v6->_mutableApps = v7;

    objc_storeStrong((id *)&v6->_stingSettingsModel, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)start
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_applicationDatabaseDidChange:" name:ACXRemoteApplicationsInstalledDistributedNotification object:0];

  v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_applicationDatabaseDidChange:" name:ACXRemoteApplicationsUpdatedDistributedNotification object:0];

  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_applicationDatabaseDidChange:" name:ACXRemoteApplicationsUninstalledDistributedNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_stingSettingsModelDidChange:" name:CSLPRFStingSettingsModelDidChangeNotification object:0];

  [(CSLPRFInstalledDepthApplicationsDataSource *)self _update];
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
  v4[2] = sub_4118;
  v4[3] = &unk_354D0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CSLPRFInstalledDepthApplicationsDataSource *)v5 _withLock:v4];
}

- (void)_update
{
  id v3 = _os_activity_create(&dword_0, "Update Apps", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  LOBYTE(v4) = [v5 supportsCapability:v6];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  dispatch_group_t v8 = dispatch_group_create();
  v9 = [(CSLPRFInstalledDepthApplicationsDataSource *)self stingSettingsModel];
  objc_super v10 = [v9 bundleIDsForActionType:20];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_44D8;
  v30[3] = &unk_354F8;
  v11 = v3;
  v31 = v11;
  v12 = v8;
  v32 = v12;
  char v36 = (char)v4;
  id v13 = v10;
  id v33 = v13;
  v34 = self;
  id v14 = v7;
  id v35 = v14;
  v15 = objc_retainBlock(v30);
  dispatch_group_enter(v12);
  v16 = +[ACXDeviceConnection sharedDeviceConnection];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_4778;
  v28[3] = &unk_35520;
  v17 = v15;
  id v29 = v17;
  [v16 enumerateInstalledApplicationsOnPairedDevice:v5 withBlock:v28];

  dispatch_group_enter(v12);
  v18 = +[ACXDeviceConnection sharedDeviceConnection];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_4790;
  v26[3] = &unk_35548;
  v19 = v17;
  id v27 = v19;
  [v18 enumerateLocallyAvailableApplicationsForPairedDevice:v5 options:1 withBlock:v26];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_47A8;
  block[3] = &unk_35598;
  v23 = v11;
  id v24 = v14;
  v25 = self;
  id v20 = v14;
  v21 = v11;
  dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

  os_activity_scope_leave(&state);
}

- (void)_applicationDatabaseDidChange:(id)a3
{
}

- (void)_stingSettingsModelDidChange:(id)a3
{
}

- (CSLPRFInstalledDepthApplicationsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLPRFInstalledDepthApplicationsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)apps
{
  return self->_apps;
}

- (CSLPRFStingSettingsModel)stingSettingsModel
{
  return self->_stingSettingsModel;
}

- (void)setStingSettingsModel:(id)a3
{
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
  objc_storeStrong((id *)&self->_stingSettingsModel, 0);
  objc_storeStrong((id *)&self->_apps, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
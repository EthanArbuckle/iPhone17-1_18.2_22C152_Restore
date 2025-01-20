@interface InstallCoordinationObserver
+ (id)sharedInstance;
- (InstallCoordinationObserver)init;
- (void)_handleAppMayBeUninstalledNotification:(id)a3;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorShouldPause:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)coordinatorShouldResume:(id)a3;
- (void)shouldPrioritizeAppWithIdentity:(id)a3;
@end

@implementation InstallCoordinationObserver

+ (id)sharedInstance
{
  if (qword_1005B1378 != -1) {
    dispatch_once(&qword_1005B1378, &stru_10052CF08);
  }
  v2 = (void *)qword_1005B1370;
  return v2;
}

- (InstallCoordinationObserver)init
{
  v19.receiver = self;
  v19.super_class = (Class)InstallCoordinationObserver;
  v2 = [(InstallCoordinationObserver *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AppInstallObserver", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TaskQueue);
    policyQueue = v2->_policyQueue;
    v2->_policyQueue = v6;

    v8 = v2->_policyQueue;
    if (v8) {
      [(NSOperationQueue *)v8->_operationQueue setName:@"com.apple.appstored.AppInstallObserver.policyQueue"];
    }
    uint64_t v9 = sub_1003E0BA4();
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v9;

    v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Observing installation notifications", v18, 2u);
    }

    id v12 = objc_alloc((Class)IXAppInstallObserver);
    v13 = +[NSSet setWithObject:&off_10054D0B0];
    v14 = (IXAppInstallObserver *)[v12 initWithMachServiceName:@"com.apple.appstored.installcoordination" forClients:v13 delegate:v2];
    installObserver = v2->_installObserver;
    v2->_installObserver = v14;

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"_handleAppMayBeUninstalledNotification:" name:IXAppMayUninstallNotificationName object:0];
    [v16 addObserver:v2 selector:"_handleAppMayBeUninstalledNotification:" name:@"com.apple.StorageSettings.AppMayUninstall" object:0];
  }
  return v2;
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  databaseStore = self->_databaseStore;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1003FBD3C;
  objc_super v19 = &unk_100522AB8;
  id v20 = v7;
  id v21 = v8;
  id v10 = v8;
  id v11 = v7;
  [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:&v16];
  id v12 = sub_10040EBA8();
  v13 = objc_msgSend(v11, "identity", v16, v17, v18, v19);
  v14 = [v13 bundleID];
  v15 = [v11 uniqueIdentifier];
  sub_10040FB04((uint64_t)v12, v14, v15);
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = [a4 URL];
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 identity];
    id v10 = [v9 bundleID];
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "coordinatorDidCompleteSuccessfully for bundleID: %{public}@ at URL: %{public}@", buf, 0x16u);
  }
  databaseStore = self->_databaseStore;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003FC550;
  v20[3] = &unk_100522AB8;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:v20];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = sub_10040EBA8();
    v15 = [v12 identity];
    v16 = [v15 bundleID];
    uint64_t v17 = [v12 uniqueIdentifier];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003FC92C;
    v18[3] = &unk_100521388;
    id v19 = v12;
    sub_100412130((uint64_t)v14, v16, v17, v18);
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = [a4 URL];
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 identity];
    id v10 = [v9 bundleID];
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    __int16 v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "coordinatorDidInstallPlaceholder for bundleID: %{public}@ at URL: %{public}@", buf, 0x16u);
  }
  if (v7)
  {
    databaseStore = self->_databaseStore;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003FCB30;
    v12[3] = &unk_100525BC8;
    id v13 = v6;
    id v14 = v7;
    [(AppInstallsDatabaseStore *)databaseStore readUsingSession:v12];
  }
}

- (void)coordinatorShouldPrioritize:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prioritization requested via coordinator %{public}@", buf, 0xCu);
  }

  databaseStore = self->_databaseStore;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003FD1A8;
  v17[3] = &unk_10052CF30;
  id v7 = v4;
  id v19 = self;
  id v20 = &v21;
  id v18 = v7;
  [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:v17];
  if (*((unsigned char *)v22 + 24))
  {
    id v8 = sub_100213454();
    uint64_t v9 = [v7 identity];
    id v10 = [v9 bundleID];
    char v11 = sub_1002137F4((uint64_t)v8, v10);
    *((unsigned char *)v22 + 24) = v11 ^ 1;

    if (*((unsigned char *)v22 + 24)) {
      goto LABEL_8;
    }
    id v12 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v7 identity];
      id v14 = [v13 bundleID];
      *(_DWORD *)buf = 138543362;
      id v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found in-flight purchase for '%{public}@', ignoring prioritization request", buf, 0xCu);
    }
    if (*((unsigned char *)v22 + 24))
    {
LABEL_8:
      v15 = [v7 identity];
      v16 = [v15 bundleID];
      sub_1003FDBC8((uint64_t)self, v16, v7);
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (void)coordinatorShouldPause:(id)a3
{
  id v4 = a3;
  databaseStore = self->_databaseStore;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003FE9C4;
  v11[3] = &unk_1005236D0;
  id v12 = v4;
  id v6 = v4;
  [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:v11];
  id v7 = sub_10040EBA8();
  id v8 = [v6 identity];
  uint64_t v9 = [v8 bundleID];
  id v10 = [v6 uniqueIdentifier];
  sub_100410470((uint64_t)v7, v9, v10);
}

- (void)coordinatorShouldResume:(id)a3
{
  id v4 = a3;
  databaseStore = self->_databaseStore;
  char v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1003FEC20;
  id v14 = &unk_100522AB8;
  id v15 = v4;
  v16 = self;
  id v6 = v4;
  [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:&v11];
  id v7 = sub_10040EBA8();
  id v8 = objc_msgSend(v6, "identity", v11, v12, v13, v14);
  uint64_t v9 = [v8 bundleID];
  id v10 = [v6 uniqueIdentifier];
  sub_1004109A4((uint64_t)v7, v9, v10);
}

- (void)shouldPrioritizeAppWithIdentity:(id)a3
{
  id v4 = [a3 bundleID];
  v5 = +[MadBridge shared];
  unsigned int v6 = [v5 isThirdPartyRestore:v4];

  if (v6)
  {
    id v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forwarding prioritize call", (uint8_t *)&v14, 0xCu);
    }

    id v8 = +[MadBridge shared];
    [v8 prioritize:v4];
  }
  else
  {
    uint64_t v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      __int16 v17 = v4;
      id v10 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Prioritize for %{public}@", (uint8_t *)&v14, 0x16u);
    }
    if ([v4 length])
    {
      sub_1003FDBC8((uint64_t)self, v4, 0);
    }
    else
    {
      char v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        int v14 = 138543362;
        id v15 = v12;
        id v13 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to prioritize due to no bundleID", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)_handleAppMayBeUninstalledNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_1003DA6D4();
  unsigned __int8 v6 = [v5 isHRNMode];

  if ((v6 & 1) == 0)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003FFA9C;
    block[3] = &unk_100521388;
    id v9 = v4;
    dispatch_async(dispatchQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedCoordinators, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_installObserver, 0);
  objc_storeStrong((id *)&self->_policyQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
}

@end
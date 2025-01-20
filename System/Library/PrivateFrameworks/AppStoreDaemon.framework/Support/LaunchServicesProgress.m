@interface LaunchServicesProgress
- (BOOL)observeLaunchProhibitedApps;
- (void)_handleCancelInstallMessage:(id)a3 fromDevice:(id)a4;
- (void)cancelApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5;
- (void)cancelApp:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)pauseApp:(id)a3 withCompletionHandler:(id)a4;
- (void)resumeApp:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation LaunchServicesProgress

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)LaunchServicesProgress;
  [(LaunchServicesProgress *)&v4 dealloc];
}

- (void)cancelApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Canceling remote job for %{public}@", buf, 0xCu);
  }

  v12 = sub_1002DC980();
  sub_1002DD110(v12, v10);
  v13 = (unsigned char *)objc_claimAutoreleasedReturnValue();

  if (v13 && (v13[18] & 1) != 0)
  {
    v16 = objc_alloc_init(XDCCancelInstallRequest);
    v17 = [v8 bundleID];
    sub_1002C8A50((uint64_t)v16, v17);

    v18 = sub_1003177EC();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100216EB8;
    v21[3] = &unk_100522490;
    id v22 = v8;
    v23 = self;
    id v24 = v9;
    sub_100317E54((uint64_t)v18, v16, 0, v13, v21);

    goto LABEL_10;
  }
  v14 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to cancel remote job for %{public}@, not a supported device", buf, 0xCu);
  }

  if (v9)
  {
    v15 = dispatch_get_global_queue(21, 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10021715C;
    v19[3] = &unk_100521F40;
    v20 = (XDCCancelInstallRequest *)v9;
    dispatch_async(v15, v19);

    v16 = v20;
LABEL_10:
  }
}

- (void)cancelApp:(id)a3 withCompletionHandler:(id)a4
{
  v6 = (_TtC9appstored6LogKey *)a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Canceling local job for %{public}@", buf, 0xCu);
  }

  id v9 = +[RestoreKeeper shared];
  id v10 = [(LogKey *)v6 bundleID];
  v11 = [v9 installForBundleID:v10];

  if (v11)
  {
    v12 = sub_100424C14(v11);
    v13 = v12;
    if (v12) {
      v14 = v12;
    }
    else {
      v14 = objc_alloc_init(_TtC9appstored6LogKey);
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  v16 = [(LogKey *)v6 bundleID];
  unsigned int v17 = [v9 hasRestoringCoordinatorForBundleID:v16 logKey:v15];

  v18 = ASDLogHandleForCategory();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@] Prompting the user whether or not to delete restore", buf, 0xCu);
    }

    v20 = [(LogKey *)v6 bundleID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100217558;
    v26[3] = &unk_100521898;
    id v27 = v7;
    [v9 displayDeleteActiveRestoreDialogWithBundleID:v20 logKey:v15 completion:v26];

    v21 = v27;
  }
  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@] Canceling due to user request", buf, 0xCu);
    }

    id v22 = [(LogKey *)v6 bundleID];
    v21 = sub_100217570((uint64_t)self, v22, -30);

    v23 = ASDLogHandleForCategory();
    id v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = [(LogKey *)v6 bundleID];
        *(_DWORD *)buf = 138543362;
        v29 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to cancel, no job found for bundle ID: %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@] Canceled local job", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v21);
    }
  }
}

- (void)pauseApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pausing local job for %{public}@", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [v6 bundleID];
  id v10 = sub_100217570((uint64_t)self, v9, -10);

  v11 = ASDLogHandleForCategory();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = [v6 bundleID];
      int v14 = 138543362;
      id v15 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to pause, no job found for bundle ID: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Paused local job for %{public}@", (uint8_t *)&v14, 0xCu);
  }

  if (v7) {
    v7[2](v7, v10);
  }
}

- (void)resumeApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resuming local job for %{public}@", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [v6 bundleID];
  id v10 = sub_100217570((uint64_t)self, v9, 10);

  v11 = ASDLogHandleForCategory();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = [v6 bundleID];
      int v14 = 138543362;
      id v15 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to resume, no job found for bundle ID: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resumed local job for %{public}@", (uint8_t *)&v14, 0xCu);
  }

  if (v7) {
    v7[2](v7, v10);
  }
}

- (BOOL)observeLaunchProhibitedApps
{
  return 1;
}

- (void)_handleCancelInstallMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Handling cancel install app message", buf, 2u);
  }

  id v10 = [XDCCancelInstallRequest alloc];
  if (v6) {
    id Property = objc_getProperty(v6, v9, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  v13 = [(XDCCancelInstallRequest *)v10 initWithData:v12];

  int v14 = sub_100388088();
  if (v13) {
    bundleID = v13->_bundleID;
  }
  else {
    bundleID = 0;
  }
  v16 = bundleID;
  sub_1003886AC((uint64_t)v14, v16);

  id v17 = objc_alloc((Class)ASDApp);
  if (v13) {
    v18 = v13->_bundleID;
  }
  else {
    v18 = 0;
  }
  BOOL v19 = v18;
  id v20 = [v17 initWithBundleID:v19];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100217FCC;
  v24[3] = &unk_100522508;
  id v25 = v6;
  id v26 = v13;
  id v27 = v7;
  id v21 = v7;
  id v22 = v13;
  id v23 = v6;
  [(LaunchServicesProgress *)self cancelApp:v20 withCompletionHandler:v24];
}

- (void).cxx_destruct
{
}

@end
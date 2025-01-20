@interface _InstallationService_XDC
- (_InstallationService_XDC)init;
- (void)_handleDevicesDidChangeNotification:(id)a3;
- (void)_handleInstallMessage:(id)a3 fromDevice:(id)a4;
- (void)_handleProgressMessage:(id)a3 fromDevice:(id)a4;
- (void)_handleRegisterAppMessage:(id)a3 fromDevice:(id)a4;
- (void)dealloc;
- (void)installEnterpriseApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installSystemApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installTestFlightApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)installWatchApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
@end

@implementation _InstallationService_XDC

- (_InstallationService_XDC)init
{
  v7.receiver = self;
  v7.super_class = (Class)_InstallationService_XDC;
  id v2 = [(InstallationService *)&v7 _init];
  if (v2)
  {
    uint64_t v3 = sub_1003177EC();
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_handleDevicesDidChangeNotification:" name:@"XDCServiceDevicesDidChangeNotification" object:*((void *)v2 + 6)];
    sub_100317B58(*((void *)v2 + 6), v2, (uint64_t)"_handleInstallMessage:fromDevice:", 2);
    sub_100317B58(*((void *)v2 + 6), v2, (uint64_t)"_handleProgressMessage:fromDevice:", 4);
    sub_100317B58(*((void *)v2 + 6), v2, (uint64_t)"_handleRegisterAppMessage:fromDevice:", 5);
  }
  return (_InstallationService_XDC *)v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"XDCServiceDevicesDidChangeNotification" object:self->_service];

  v4.receiver = self;
  v4.super_class = (Class)_InstallationService_XDC;
  [(InstallationService *)&v4 dealloc];
}

- (void)installEnterpriseApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100016788();
  dispatchQueue = self->super._dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10022A2C0;
  v17[3] = &unk_100522A40;
  id v18 = v9;
  id v19 = v8;
  id v21 = v11;
  id v22 = v10;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  sub_100010948(dispatchQueue, v17);
}

- (void)installSystemApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100016788();
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    sub_100416894((uint64_t)XPCRequestToken, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v13;

  dispatchQueue = self->super._dispatchQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10022A80C;
  v20[3] = &unk_100522A68;
  id v21 = v9;
  id v22 = v14;
  id v23 = v8;
  v24 = self;
  id v25 = v10;
  id v16 = v10;
  id v17 = v8;
  id v18 = v14;
  id v19 = v9;
  sub_100010948(dispatchQueue, v20);
}

- (void)installTestFlightApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100016788();
  dispatchQueue = self->super._dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10022AEBC;
  v17[3] = &unk_100522A40;
  id v18 = v9;
  id v19 = v8;
  id v21 = v11;
  id v22 = v10;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  sub_100010948(dispatchQueue, v17);
}

- (void)installWatchApps:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100016788();
  v12 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v11 processInfo];
    id v14 = [v13 bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    v27 = v11;
    __int16 v28 = 2114;
    v29 = v14;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received request from %{public}@ to install watch apps on %{public}@", buf, 0x20u);
  }
  dispatchQueue = self->super._dispatchQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10022B2A8;
  v20[3] = &unk_100522A40;
  id v21 = v9;
  id v22 = v8;
  id v24 = v11;
  id v25 = v10;
  id v23 = self;
  id v16 = v11;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  sub_100010948(dispatchQueue, v20);
}

- (void)_handleDevicesDidChangeNotification:(id)a3
{
  objc_super v4 = +[NSMutableDictionary dictionary];
  databaseStore = self->super._databaseStore;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10022B8BC;
  v8[3] = &unk_100522C00;
  id v9 = v4;
  id v6 = v4;
  [(AppInstallsDatabaseStore *)databaseStore readUsingSession:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10022BC5C;
  v7[3] = &unk_100522B48;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)_handleInstallMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  v40 = sub_100416894((uint64_t)XPCRequestToken, 0);
  id v8 = [XDCInstallRequest alloc];
  if (v6) {
    id Property = objc_getProperty(v6, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v11 = [(XDCInstallRequest *)v8 initWithData:v10];

  if (v11) {
    metadatas = v11->_metadatas;
  }
  else {
    metadatas = 0;
  }
  id v13 = metadatas;
  id v14 = sub_100392008(v13, &stru_100522B68);

  v39 = [v14 objectForKeyedSubscript:&off_10054BA00];
  if ([v39 count])
  {
    id v15 = sub_1003D8AC0((uint64_t)InstallEnterpriseAppsTask, v39, v40);
    taskQueue = self->super._taskQueue;
    v51 = v15;
    id v17 = +[NSArray arrayWithObjects:&v51 count:1];
    if (taskQueue) {
      [(NSOperationQueue *)taskQueue->_operationQueue addOperations:v17 waitUntilFinished:1];
    }
  }
  id v18 = [v14 objectForKeyedSubscript:&off_10054B9B8];
  if ([v18 count])
  {
    id v19 = sub_10036E1E0((uint64_t)InstallSystemAppsTask, v18);
    v20 = self->super._taskQueue;
    v50 = v19;
    id v21 = +[NSArray arrayWithObjects:&v50 count:1];
    if (v20) {
      [(NSOperationQueue *)v20->_operationQueue addOperations:v21 waitUntilFinished:1];
    }
  }
  id v22 = [v14 objectForKeyedSubscript:&off_10054B9D0];
  if ([v22 count])
  {
    id v23 = sub_100303DA8((uint64_t)InstallTestFlightAppsTask, v22);
    id v24 = self->super._taskQueue;
    v49 = v23;
    id v25 = +[NSArray arrayWithObjects:&v49 count:1];
    if (v24) {
      [(NSOperationQueue *)v24->_operationQueue addOperations:v25 waitUntilFinished:1];
    }
  }
  v26 = [v14 objectForKeyedSubscript:&off_10054B9E8];
  if ([v26 count])
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = sub_100017EC8;
    v46 = sub_100017B20;
    id v47 = 0;
    dispatchQueue = self->super._dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022C4B0;
    block[3] = &unk_100521988;
    block[4] = self;
    block[5] = &v42;
    dispatch_sync(dispatchQueue, block);
    __int16 v28 = sub_10036AA54((uint64_t)InstallWatchAppsTask, v26, v40, (void *)v43[5]);
    v29 = self->super._taskQueue;
    v48 = v28;
    __int16 v30 = +[NSArray arrayWithObjects:&v48 count:1];
    if (v29) {
      [(NSOperationQueue *)v29->_operationQueue addOperations:v30 waitUntilFinished:1];
    }

    _Block_object_dispose(&v42, 8);
  }
  if (v11) {
    id v31 = v11->_metadatas;
  }
  else {
    id v31 = 0;
  }
  v32 = v31;
  v33 = sub_1003923F8(v32, &stru_100522BA8);

  v34 = sub_1003A7FB4((uint64_t)XDCInstallResponse, v33);
  v35 = sub_10036927C((uint64_t)v6, v34, 6);
  uint64_t v36 = sub_1003177EC();
  v37 = (void *)v36;
  if (v36) {
    sub_100317CB4(v36, v35, v38, 0, 0);
  }
}

- (void)_handleProgressMessage:(id)a3 fromDevice:(id)a4
{
  id v4 = a3;
  id v24 = sub_100416894((uint64_t)XPCRequestToken, 0);
  id v6 = [XDCProgressMessage alloc];
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  id v9 = [(XDCProgressMessage *)v6 initWithData:v8];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v22 = v9;
  id v23 = v4;
  if (v9) {
    progress = v9->_progress;
  }
  else {
    progress = 0;
  }
  v11 = progress;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v15);
        if (v16)
        {
          id v17 = *(id *)(v16 + 24);
          if (v17)
          {
            id v18 = objc_opt_new();
            objc_msgSend(v18, "setBundleID:", v17, v22, v23);
            [v18 setCompletedUnitCount:*(void *)(v16 + 8)];
            [v18 setTotalUnitCount:*(void *)(v16 + 16)];
            [v18 setReportRemotely:1];
            id v19 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              __int16 v30 = v24;
              __int16 v31 = 2114;
              v32 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Received remote progress: %{public}@", buf, 0x16u);
            }

            v20 = sub_10001A0C8();
            sub_1003D66C0((uint64_t)v20, v18);
          }
        }
        else
        {
          id v17 = 0;
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v21 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      id v13 = v21;
    }
    while (v21);
  }
}

- (void)_handleRegisterAppMessage:(id)a3 fromDevice:(id)a4
{
  id v4 = a3;
  v5 = sub_100416894((uint64_t)XPCRequestToken, 0);
  objc_super v7 = [XDCRegisterAppMessage alloc];
  if (v4) {
    id Property = objc_getProperty(v4, v6, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  id v10 = [(XDCRegisterAppMessage *)v7 initWithData:v9];

  v11 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = v10;
  long long v25 = v4;
  if (v10) {
    metadatas = v10->_metadatas;
  }
  else {
    metadatas = 0;
  }
  id v13 = metadatas;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = sub_1002B1930(*(void *)(*((void *)&v26 + 1) + 8 * i));
        id v19 = objc_alloc_init((Class)ASDProgress);
        v20 = objc_msgSend(v18, "bundleID", v24, v25);
        [v19 setBundleID:v20];

        [v19 setCompletedUnitCount:-1];
        [v19 setTotalUnitCount:1000];
        [v19 setReportRemotely:1];
        [v18 setRemoteProgress:v19];
        id v21 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          __int16 v31 = v5;
          __int16 v32 = 2114;
          v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Received remote register: %{public}@", buf, 0x16u);
        }

        [v11 addObject:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  if ([v11 count])
  {
    id v22 = sub_1002CF63C((uint64_t)ASDNotification, v11);
    id v23 = sub_10001A0C8();
    sub_1003D64D4((uint64_t)v23, v22);
  }
}

- (void).cxx_destruct
{
}

@end
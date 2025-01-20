@interface CacheDeleteCoordinator
- (CacheDeleteCoordinator)init;
- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
@end

@implementation CacheDeleteCoordinator

- (CacheDeleteCoordinator)init
{
  v21.receiver = self;
  v21.super_class = (Class)CacheDeleteCoordinator;
  v2 = [(CacheDeleteCoordinator *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.CacheDeleteCoordinator.run", attr);
    runQueue = v2->_runQueue;
    v2->_runQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    appPurgeCoordinator = v2->_appPurgeCoordinator;
    v2->_appPurgeCoordinator = (CacheDeletePurgeableProvider *)v6;

    objc_initWeak(&location, v2);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002C62A4;
    v28[3] = &unk_100526160;
    objc_copyWeak(&v29, &location);
    v8 = objc_retainBlock(v28);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1002C6650;
    v26[3] = &unk_100526160;
    objc_copyWeak(&v27, &location);
    v9 = objc_retainBlock(v26);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1002C6F14;
    v24[3] = &unk_100525760;
    objc_copyWeak(&v25, &location);
    v10 = objc_retainBlock(v24);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002C70B4;
    v22[3] = &unk_100526160;
    objc_copyWeak(&v23, &location);
    v11 = objc_retainBlock(v22);
    int v12 = CacheDeleteRegisterInfoCallbacks();
    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      __int16 v33 = 2114;
      CFStringRef v34 = @"com.apple.appstored.CacheDelete";
      __int16 v35 = 1024;
      int v36 = v12;
      id v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered cache delete callbacks for clientID: %{public}@ with osResult: %d", buf, 0x1Cu);
    }
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    v16 = sub_1003B3A54();
    sub_1003B409C((uint64_t)v16, v2);

    v17 = objc_alloc_init(PartialDownloadPurgeCoordinator);
    partialDownloadPurgeCoordinator = v2->_partialDownloadPurgeCoordinator;
    v2->_partialDownloadPurgeCoordinator = (CacheDeletePurgeableProvider *)v17;
  }
  return v2;
}

- (void)dealloc
{
  scheduledTimer = self->_scheduledTimer;
  if (scheduledTimer) {
    dispatch_source_cancel(scheduledTimer);
  }
  dispatch_queue_t v4 = sub_1003B3A54();
  sub_1003B42D8((uint64_t)v4, self);

  v5.receiver = self;
  v5.super_class = (Class)CacheDeleteCoordinator;
  [(CacheDeleteCoordinator *)&v5 dealloc];
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  id v4 = a3;
  objc_super v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating purgeable storage after database rsynced for device: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  if (self) {
    sub_1002C73F4(self, 1, 0, 10.0);
  }
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a4;
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating purgeable storage after applications updated for device: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (self) {
    sub_1002C73F4(self, 1, 0, 10.0);
  }
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a4;
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating purgeable storage after applications installed for device: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (self) {
    sub_1002C73F4(self, 1, 0, 10.0);
  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a4;
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating purgeable storage after applications uninstalled for device: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (self) {
    sub_1002C73F4(self, 1, 0, 10.0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialDownloadPurgeCoordinator, 0);
  objc_destroyWeak((id *)&self->_odrPurgeCoordinator);
  objc_storeStrong((id *)&self->_appPurgeCoordinator, 0);
  objc_storeStrong((id *)&self->_scheduledTimer, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
  objc_storeStrong((id *)&self->_combinedSystemSpaceByUrgency, 0);
  objc_storeStrong((id *)&self->_combinedUserSpaceByUrgency, 0);
}

@end
@interface NTKCollieFaceCloudSyncManager
+ (id)_sharedInstance;
+ (unint64_t)status;
- (BOOL)_currentProcessNeedsToMonitorCloudSyncStatus;
- (NTKCollieFaceCloudSyncManager)init;
- (unint64_t)_status;
- (void)_async_refreshStatus:(id)a3;
- (void)_fetchCloudSyncStatus:(id)a3;
- (void)_removeObservers;
- (void)dealloc;
@end

@implementation NTKCollieFaceCloudSyncManager

+ (unint64_t)status
{
  v2 = [a1 _sharedInstance];
  id v3 = [v2 _status];

  return (unint64_t)v3;
}

+ (id)_sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2128;
  block[3] = &unk_286F8;
  block[4] = a1;
  if (qword_2F790 != -1) {
    dispatch_once(&qword_2F790, block);
  }
  v2 = (void *)qword_2F788;

  return v2;
}

- (NTKCollieFaceCloudSyncManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCollieFaceCloudSyncManager;
  v2 = [(NTKCollieFaceCloudSyncManager *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    if ([(NTKCollieFaceCloudSyncManager *)v2 _currentProcessNeedsToMonitorCloudSyncStatus])
    {
      v3->_status = 0;
      [(NTKCollieFaceCloudSyncManager *)v3 _async_refreshStatus:0];
      v4 = +[NSNotificationCenter defaultCenter];
      [v4 addObserver:v3 selector:"_async_refreshStatus:" name:CKAccountChangedNotification object:0];

      v5 = +[NSNotificationCenter defaultCenter];
      [v5 addObserver:v3 selector:"_async_refreshStatus:" name:CKIdentityUpdateNotification object:0];

      v6 = +[NSNotificationCenter defaultCenter];
      [v6 addObserver:v3 selector:"_async_refreshStatus:" name:CLKActiveDeviceChangedTinkerState object:0];
    }
    else
    {
      v7 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Collie Face detected no need to monitor cloud sync status, setting to supported", v9, 2u);
      }

      v3->_status = 4;
    }
  }
  return v3;
}

- (void)_removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CKIdentityUpdateNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:CLKActiveDeviceChangedTinkerState object:0];
}

- (void)dealloc
{
  [(NTKCollieFaceCloudSyncManager *)self _removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)NTKCollieFaceCloudSyncManager;
  [(NTKCollieFaceCloudSyncManager *)&v3 dealloc];
}

- (unint64_t)_status
{
  return self->_status;
}

- (void)_async_refreshStatus:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
    {
      v6 = [v4 name];
    }
    else
    {
      v6 = @"init";
    }
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Refreshing Collie Face cloud sync status for %@", buf, 0xCu);
    if (v4) {
  }
    }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2518;
  v7[3] = &unk_28748;
  v7[4] = self;
  [(NTKCollieFaceCloudSyncManager *)self _fetchCloudSyncStatus:v7];
}

- (BOOL)_currentProcessNeedsToMonitorCloudSyncStatus
{
  int v2 = CLKRunningInProcess();
  if (v2)
  {
    objc_super v3 = +[CLKDevice currentDevice];
    unsigned __int8 v4 = [v3 isTinker];

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (void)_fetchCloudSyncStatus:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, uint64_t))a3;
  id v5 = +[CLKDevice currentDevice];
  unsigned int v6 = [v5 isTinker];

  if (v6)
  {
    v7 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Collie Face tinker state changed to YES, setting cloud sync status to supported", buf, 2u);
    }

    [(NTKCollieFaceCloudSyncManager *)self _removeObservers];
    v4[2](v4, 4);
  }
  else
  {
    id v8 = objc_alloc_init((Class)ACAccountStore);
    v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
    if (v9)
    {
      objc_super v10 = +[CKContainer containerWithIdentifier:@"com.apple.Avatars"];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_28B8;
      v12[3] = &unk_28770;
      v13 = v4;
      [v10 accountInfoWithCompletionHandler:v12];
    }
    else
    {
      v11 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_17C14(v11);
      }

      v4[2](v4, 1);
    }
  }
}

@end
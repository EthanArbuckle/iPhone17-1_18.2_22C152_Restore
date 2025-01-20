@interface FMDMagSafeSetupAgent
+ (id)sharedInstance;
- (FMDMagSafeSetupAgent)init;
- (OS_dispatch_queue)serialQueue;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)launchCompleted;
- (void)_launchRemoteViewWithContext:(id)a3;
- (void)launchSetupModule:(id)a3;
- (void)launchSetupModuleWith:(id)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setLaunchCompleted:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDMagSafeSetupAgent

+ (id)sharedInstance
{
  if (qword_1000312F8 != -1) {
    dispatch_once(&qword_1000312F8, &stru_100024970);
  }
  v2 = (void *)qword_1000312F0;

  return v2;
}

- (FMDMagSafeSetupAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMDMagSafeSetupAgent;
  v2 = [(FMDMagSafeSetupAgent *)&v7 init];
  if (v2)
  {
    v3 = sub_100002AA8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "intitializing setupAgent", v6, 2u);
    }

    dispatch_queue_t v4 = dispatch_queue_create("FMDMagSafeSetupAgent", 0);
    [(FMDMagSafeSetupAgent *)v2 setSerialQueue:v4];
  }
  return v2;
}

- (void)launchSetupModule:(id)a3
{
  id v4 = a3;
  v5 = sub_100002AA8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received notification %@", (uint8_t *)&v7, 0xCu);
  }

  if ([v4 isEqualToString:@"com.apple.icloud.FindMy.addMagSafeAccessory"]) {
    v6 = &off_100028C38;
  }
  else {
    v6 = (_UNKNOWN **)&__NSDictionary0__struct;
  }
  [(FMDMagSafeSetupAgent *)self _launchRemoteViewWithContext:v6];
}

- (void)_launchRemoteViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(FMDMagSafeSetupAgent *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008D68;
  v7[3] = &unk_100024998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)launchSetupModuleWith:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMDMagSafeSetupAgent *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008FD0;
  block[3] = &unk_1000249C0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = sub_100002AA8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "remote handler deactivated", v7, 2u);
  }

  [(FMDMagSafeSetupAgent *)self setRemoteAlertHandle:0];
  v5 = [(FMDMagSafeSetupAgent *)self launchCompleted];

  if (v5)
  {
    id v6 = [(FMDMagSafeSetupAgent *)self launchCompleted];
    v6[2](v6, 0);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100002AA8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "remote handler invalidated with error %@", (uint8_t *)&v9, 0xCu);
  }

  [(FMDMagSafeSetupAgent *)self setRemoteAlertHandle:0];
  id v7 = [(FMDMagSafeSetupAgent *)self launchCompleted];

  if (v7)
  {
    id v8 = [(FMDMagSafeSetupAgent *)self launchCompleted];
    ((void (**)(void, id))v8)[2](v8, v5);
  }
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (id)launchCompleted
{
  return self->_launchCompleted;
}

- (void)setLaunchCompleted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_launchCompleted, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end
@interface ADMultiUserMeDevice
+ (id)sharedInstance;
- (NSNumber)isMeDevice;
- (NSString)meDeviceIDSIdentifier;
- (id)_init;
- (void)_checkMeDevice;
- (void)_setupMeDeviceFetch;
- (void)dealloc;
@end

@implementation ADMultiUserMeDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDeviceIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_isMeDevice, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
}

- (NSString)meDeviceIDSIdentifier
{
  return self->_meDeviceIDSIdentifier;
}

- (NSNumber)isMeDevice
{
  return self->_isMeDevice;
}

- (void)_checkMeDevice
{
  id v3 = [(CUSystemMonitor *)self->_systemMonitor meDeviceIsMe];
  v4 = self->_isMeDevice;
  v5 = +[NSNumber numberWithBool:v3];
  isMeDevice = self->_isMeDevice;
  self->_isMeDevice = v5;

  v7 = [(CUSystemMonitor *)self->_systemMonitor meDeviceIDSDeviceID];
  meDeviceIDSIdentifier = self->_meDeviceIDSIdentifier;
  self->_meDeviceIDSIdentifier = v7;

  if (!v4)
  {
    v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      v14 = "-[ADMultiUserMeDevice _checkMeDevice]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Evaluated", (uint8_t *)&v13, 0xCu);
    }
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"ADMultiUserMeDeviceEvaluatedNotification" object:self->_isMeDevice];
  }
  if (v3 != [(NSNumber *)v4 BOOLValue])
  {
    v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      v14 = "-[ADMultiUserMeDevice _checkMeDevice]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Changed", (uint8_t *)&v13, 0xCu);
    }
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 postNotificationName:@"ADMultiUserMeDeviceChangedNotification" object:self->_isMeDevice];
  }
}

- (void)_setupMeDeviceFetch
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ADMultiUserMeDevice _setupMeDeviceFetch]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v4;

  [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:&_dispatch_main_q];
  objc_initWeak((id *)buf, self);
  v6 = self->_systemMonitor;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100187024;
  v13[3] = &unk_10050B790;
  objc_copyWeak(&v14, (id *)buf);
  [(CUSystemMonitor *)v6 setMeDeviceChangedHandler:v13];
  v7 = self->_systemMonitor;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018712C;
  v11[3] = &unk_10050B790;
  objc_copyWeak(&v12, (id *)buf);
  [(CUSystemMonitor *)v7 activateWithCompletion:v11];
  dispatch_time_t v8 = dispatch_time(0, 15000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187234;
  block[3] = &unk_10050B790;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)ADMultiUserMeDevice;
  [(ADMultiUserMeDevice *)&v4 dealloc];
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)ADMultiUserMeDevice;
  v2 = [(ADMultiUserMeDevice *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(ADMultiUserMeDevice *)v2 _setupMeDeviceFetch];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100585D70 != -1) {
    dispatch_once(&qword_100585D70, &stru_100504758);
  }
  v2 = (void *)qword_100585D78;
  return v2;
}

@end
@interface RPRemoteAlertManager
+ (id)sharedInstance;
- (BOOL)createRemoteHandleForApplication:(id)a3 bundleID:(id)a4;
- (RPRemoteAlertManager)init;
- (void)clearRemoteHandle;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation RPRemoteAlertManager

+ (id)sharedInstance
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    v5 = "+[RPRemoteAlertManager sharedInstance]";
    __int16 v6 = 1024;
    int v7 = 25;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (qword_100047A68 != -1) {
    dispatch_once(&qword_100047A68, &stru_10003D0F8);
  }
  v2 = (void *)qword_100047A60;

  return v2;
}

- (RPRemoteAlertManager)init
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPRemoteAlertManager init]";
    __int16 v10 = 1024;
    int v11 = 35;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v7.receiver = self;
  v7.super_class = (Class)RPRemoteAlertManager;
  v3 = [(RPRemoteAlertManager *)&v7 init];
  int v4 = v3;
  if (v3)
  {
    remoteAlertHandle = v3->_remoteAlertHandle;
    v3->_remoteAlertHandle = 0;
  }
  return v4;
}

- (void)clearRemoteHandle
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPRemoteAlertManager clearRemoteHandle]";
    __int16 v7 = 1024;
    int v8 = 45;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    if (!__RPLogLevel)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136446466;
        __int16 v6 = "-[RPRemoteAlertManager clearRemoteHandle]";
        __int16 v7 = 1024;
        int v8 = 48;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d client handle found, invalidating", (uint8_t *)&v5, 0x12u);
      }
      remoteAlertHandle = self->_remoteAlertHandle;
    }
    [(SBSRemoteAlertHandle *)remoteAlertHandle unregisterObserver:self];
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    int v4 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;
  }
  else if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPRemoteAlertManager clearRemoteHandle]";
    __int16 v7 = 1024;
    int v8 = 53;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d client handle not found", (uint8_t *)&v5, 0x12u);
  }
}

- (BOOL)createRemoteHandleForApplication:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v20 = "-[RPRemoteAlertManager createRemoteHandleForApplication:bundleID:]";
    __int16 v21 = 1024;
    int v22 = 58;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d app=%@ bundleId=%@", buf, 0x26u);
  }
  if (self->_remoteAlertHandle) {
    [(RPRemoteAlertManager *)self clearRemoteHandle];
  }
  id v8 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v9 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.replaykitangel"];
  id v10 = [v8 initWithSceneProvidingProcess:v9 configurationIdentifier:@"reactions-tip-alert"];

  id v11 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v17[0] = @"applicationName";
  v17[1] = @"bundleIdentifier";
  v18[0] = v6;
  v18[1] = v7;
  v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v11 setUserInfo:v12];
  v13 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v10 configurationContext:v11];
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v13;

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle registerObserver:self];
  id v15 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v15];

  return 1;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPRemoteAlertManager remoteAlertHandleDidDeactivate:]";
    __int16 v7 = 1024;
    int v8 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(RPRemoteAlertManager *)self clearRemoteHandle];
}

- (void).cxx_destruct
{
}

@end
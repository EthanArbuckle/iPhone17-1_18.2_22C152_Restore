@interface IOUIAngelServer
+ (id)serviceInterface;
+ (id)sharedServer;
- (BOOL)isPresentingCriticalUI;
- (IOUIAngelServer)init;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)pingWithCompletion:(id)a3;
- (void)removeIntrusiveUIWithCompletion:(id)a3;
- (void)setIntrusiveUIWithCompletion:(id)a3;
- (void)setIsPresentingCriticalUI:(BOOL)a3;
@end

@implementation IOUIAngelServer

+ (id)sharedServer
{
  if (qword_1000130E8 != -1) {
    dispatch_once(&qword_1000130E8, &stru_10000C368);
  }
  v2 = (void *)qword_1000130E0;

  return v2;
}

- (IOUIAngelServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)IOUIAngelServer;
  v2 = [(IOUIAngelServer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100002308;
    v8[3] = &unk_10000C390;
    v4 = v2;
    v9 = v4;
    uint64_t v5 = +[BSServiceConnectionListener listenerWithConfigurator:v8];
    listener = v4->_listener;
    v4->_listener = (BSServiceConnectionListener *)v5;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_isPresentingCriticalUI = 0;
  }
  return v3;
}

- (void)activate
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Activating BSServiceConnectionListener...", v3, 2u);
  }
  [(BSServiceConnectionListener *)self->_listener activate];
}

- (void)invalidate
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalidating BSServiceConnectionListener...", v3, 2u);
  }
  [(BSServiceConnectionListener *)self->_listener invalidate];
}

+ (id)serviceInterface
{
  if (qword_1000130F8 != -1) {
    dispatch_once(&qword_1000130F8, &stru_10000C3B0);
  }
  v2 = (void *)qword_1000130F0;

  return v2;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  v8 = [a5 decodeStringForKey:@"IOUIAngelLDCM"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[BSServiceConnection currentContext];
    objc_super v10 = [v9 remoteProcess];
    *(_DWORD *)buf = 136315906;
    v19 = "-[IOUIAngelServer listener:didReceiveConnection:withContext:]";
    __int16 v20 = 2048;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: received connection %p with identifier %@ from %@", buf, 0x2Au);
  }
  v11 = [v7 remoteProcess];
  if ([v11 hasEntitlement:@"com.apple.IOUIAngel.LDCM.allowUI"])
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100002734;
    v15 = &unk_10000C418;
    id v16 = v8;
    v17 = self;
    [v7 configureConnection:&v12];
    objc_msgSend(v7, "activate", v12, v13, v14, v15);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000651C((uint64_t)v7, (uint64_t)v11);
    }
    [v7 invalidate];
  }
}

- (void)pingWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[BSServiceConnection currentContext];
    uint64_t v5 = [v4 remoteProcess];
    int v6 = 136315394;
    id v7 = "-[IOUIAngelServer pingWithCompletion:]";
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: pinged from %@", (uint8_t *)&v6, 0x16u);
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)setIntrusiveUIWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = +[BSServiceConnection currentContext];
    int v6 = [v5 remoteProcess];
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setIntrusiveUIWithCompletion called from %@", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002A38;
  v8[3] = &unk_10000C468;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)removeIntrusiveUIWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = +[BSServiceConnection currentContext];
    int v6 = [v5 remoteProcess];
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removeIntrusiveUIWithCompletion called from %@", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002E28;
  v8[3] = &unk_10000C468;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (BOOL)isPresentingCriticalUI
{
  return self->_isPresentingCriticalUI;
}

- (void)setIsPresentingCriticalUI:(BOOL)a3
{
  self->_isPresentingCriticalUI = a3;
}

- (void).cxx_destruct
{
}

@end
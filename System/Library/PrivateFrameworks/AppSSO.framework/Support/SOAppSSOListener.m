@interface SOAppSSOListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SOAppSSOListener)init;
@end

@implementation SOAppSSOListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1000160E0 != -1) {
    dispatch_once(&qword_1000160E0, &stru_100010350);
  }
  v7 = qword_1000160E8;
  if (os_log_type_enabled((os_log_t)qword_1000160E8, OS_LOG_TYPE_DEBUG)) {
    sub_100009E28((uint64_t)v5, (uint64_t)v6, v7);
  }
  v8 = [[SODaemon alloc] initWithXPCConnection:v6];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v9 = (void *)qword_1000160F0;
  uint64_t v23 = qword_1000160F0;
  if (!qword_1000160F0)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    location[2] = sub_100003268;
    location[3] = &unk_100010378;
    location[4] = &v20;
    sub_100003268((uint64_t)location);
    v9 = (void *)v21[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v20, 8);
  v11 = [v10 interfaceWithInternalProtocol:&OBJC_PROTOCOL___SOServiceProtocol];
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v8];
  [v6 resume];
  objc_initWeak(location, v8);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000031E4;
  v17 = &unk_100010310;
  objc_copyWeak(&v18, location);
  [(SODaemon *)v8 setInvalidationHandler:&v14];
  v12 = [(SODaemon *)v8 invalidationHandler];
  [v6 setInvalidationHandler:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(location);

  return 1;
}

- (SOAppSSOListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)SOAppSSOListener;
  return [(SODaemonListener *)&v3 initWithMachServiceName:@"com.apple.AppSSO.service-xpc"];
}

@end
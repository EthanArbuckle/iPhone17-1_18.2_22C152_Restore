@interface ANDaemon
+ (id)_nameForProcessWithPID:(int)a3;
+ (id)sharedInstance;
- (ANDaemon)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)dealloc;
- (void)start;
@end

@implementation ANDaemon

+ (id)sharedInstance
{
  if (qword_100011678 != -1) {
    dispatch_once(&qword_100011678, &stru_10000C480);
  }
  v2 = (void *)qword_100011670;
  return v2;
}

- (ANDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANDaemon;
  v2 = [(ANDaemon *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ANNotificationController);
    notificationController = v2->_notificationController;
    v2->_notificationController = v3;
  }
  return v2;
}

- (void)dealloc
{
  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
    v4 = self->_listener;
    self->_listener = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ANDaemon;
  [(ANDaemon *)&v5 dealloc];
}

- (void)start
{
  id v3 = objc_alloc((Class)NSXPCListener);
  v4 = (NSXPCListener *)[v3 initWithMachServiceName:ANDaemonMachServiceName];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  objc_super v6 = self->_listener;
  [(NSXPCListener *)v6 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[ANDaemon _nameForProcessWithPID:](ANDaemon, "_nameForProcessWithPID:", [v5 processIdentifier]);
  v7 = [v5 valueForEntitlement:ANAccountNotificationClientEntitlement];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = _ANLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100007C64();
    }
    goto LABEL_10;
  }
  unsigned __int8 v8 = [v7 BOOLValue];
  v9 = _ANLogSystem();
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100007BE0();
    }
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[ANDaemon listener:shouldAcceptNewConnection:]";
    __int16 v24 = 1024;
    int v25 = 82;
    __int16 v26 = 2112;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"New incoming connection from %@.\"", buf, 0x1Cu);
  }

  v11 = +[ANDaemonInterface XPCInterface];
  [v5 setExportedInterface:v11];

  [v5 setExportedObject:self->_notificationController];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100006364;
  v20[3] = &unk_10000C398;
  v12 = v6;
  v21 = v12;
  [v5 setInterruptionHandler:v20];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1000063B0;
  v18 = &unk_10000C398;
  v19 = v12;
  [v5 setInvalidationHandler:&v15];
  objc_msgSend(v5, "resume", v15, v16, v17, v18);

  BOOL v13 = 1;
  v10 = v21;
LABEL_11:

  return v13;
}

+ (id)_nameForProcessWithPID:(int)a3
{
  size_t v5 = 648;
  dword_10001152C = a3;
  byte_100011773 = 0;
  if (sysctl(dword_100011520, 4u, &unk_100011680, &v5, 0, 0))
  {
    id v3 = @"?";
  }
  else if (byte_100011773)
  {
    id v3 = +[NSString stringWithUTF8String:&byte_100011773];
  }
  else
  {
    id v3 = @"exited?";
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
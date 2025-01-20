@interface AppDelegate
- (AppDelegate)init;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_didBecomeLocked;
- (void)warmUp;
@end

@implementation AppDelegate

- (AppDelegate)init
{
  v15.receiver = self;
  v15.super_class = (Class)AppDelegate;
  v2 = [(AppDelegate *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iMessageAppsViewService.xpcQueue", v3);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v4;

    v6 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.iMessageAppsViewService.warmup-connection"];
    sourceListener = v2->_sourceListener;
    v2->_sourceListener = v6;

    [(NSXPCListener *)v2->_sourceListener _setQueue:v2->_xpcQueue];
    [(NSXPCListener *)v2->_sourceListener setDelegate:v2];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008A80;
    v13[3] = &unk_100010750;
    v8 = v2;
    v14 = v8;
    v9 = objc_retainBlock(v13);
    v8->_lockToken = -1;
    v8 = (AppDelegate *)((char *)v8 + 24);
    notify_register_dispatch(kSBSLockStateNotifyKey, (int *)v8, (dispatch_queue_t)&_dispatch_main_q, v9);
    ((void (*)(void *, void))v9[2])(v9, LODWORD(v8->super.isa));
    v10 = sub_10000A660();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Running but not yet listening", (uint8_t *)&v12, 2u);
    }
  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = sub_10000A660();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Application didFinishLaunching", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008BD0;
  v7[3] = &unk_1000105F0;
  v7[4] = self;
  [UIApp _performBlockAfterCATransactionCommits:v7];
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10000A660();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Accepting new source connection from PID %d", buf, 8u);
  }

  [v7 _setQueue:self->_xpcQueue];
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIKeyboardMediaService];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, v7);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008E7C;
  v16[3] = &unk_100010778;
  objc_copyWeak(&v17, (id *)buf);
  [v7 setInterruptionHandler:v16];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100008F3C;
  v14 = &unk_100010778;
  objc_copyWeak(&v15, (id *)buf);
  [v7 setInvalidationHandler:&v11];
  [v7 resume:v11, v12, v13, v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)warmUp
{
  v2 = sub_10000A660();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = +[NSXPCConnection currentConnection];
    v4[0] = 67109120;
    v4[1] = [v3 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Warmed up by PID %d", (uint8_t *)v4, 8u);
  }
}

- (void)_didBecomeLocked
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceListener, 0);

  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end
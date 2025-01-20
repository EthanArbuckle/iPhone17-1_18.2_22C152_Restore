@interface CRAgent
+ (BOOL)clientMayConnect:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CRAgent)init;
- (id)clientForConnection:(id)a3;
- (id)daemonLibraryForClient:(id)a3;
- (void)_adjustLibraryStoreSyncBehaviorWithLockedState:(BOOL)a3;
- (void)_executeAfterFirstUnlock:(id)a3;
- (void)_lockStateChanged:(id)a3;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation CRAgent

- (id)clientForConnection:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_100008854;
  v13 = sub_100008864;
  uint64_t v14 = 0;
  startupQueue = self->_startupQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006AB4;
  v8[3] = &unk_10002CAF0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync((dispatch_queue_t)startupQueue, v8);
  v5 = [CRDClient alloc];
  v6 = [(CRDClient *)v5 initWithConnection:a3 library:v10[5]];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = [(CRAgent *)self clientForConnection:a4];
  if ([(id)objc_opt_class() clientMayConnect:v6])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    startupQueue = self->_startupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006A8C;
    block[3] = &unk_10002CAF0;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync((dispatch_queue_t)startupQueue, block);
    BOOL v8 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      uint64_t v9 = +[CRWeakReference weakReferenceWithObject:v6];
      v10 = +[CRWeakReference weakReferenceWithObject:a4];
      id v11 = [(CRAgent *)self daemonLibraryForClient:v6];
      objc_msgSend(a4, "setExportedInterface:", +[CRDRecentContactsLibraryInterface XPCInterface](CRDRecentContactsLibraryInterface, "XPCInterface"));
      [a4 setExportedObject:v11];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100008870;
      v16[3] = &unk_10002CB18;
      v16[4] = v9;
      v16[5] = v10;
      v16[6] = self;
      [a4 setInvalidationHandler:v16];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100008978;
      v15[3] = &unk_10002CB18;
      v15[4] = v9;
      v15[5] = v10;
      v15[6] = self;
      [a4 setInterruptionHandler:v15];
      objc_sync_enter(self);
      [(NSMutableSet *)self->_clients addObject:v6];
      [a4 resume];
      objc_sync_exit(self);
    }
    else
    {
      v13 = +[CRLogging log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v18 = 138543362;
        id v19 = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "dropping connection %{public}@ because library is not available (probable cause: device not unlocked after boot)", v18, 0xCu);
      }
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v12 = +[CRLogging log];
    BOOL v8 = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dropping unentitled connection %{public}@", (uint8_t *)&buf, 0xCu);
      return 0;
    }
  }
  return v8;
}

- (id)daemonLibraryForClient:(id)a3
{
  v3 = [[CRDRecentContactsLibrary alloc] initWithClient:a3];
  return v3;
}

+ (BOOL)clientMayConnect:(id)a3
{
  if ([a3 hasEntitlement:@"com.apple.private.corerecents"]) {
    return 1;
  }
  return [a3 hasEntitlement:@"com.apple.private.contactsui"];
}

- (CRAgent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRAgent;
  v2 = [(CRAgent *)&v5 init];
  if (v2)
  {
    v2->_startupQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.contacts.corerecents.agent.startup", 0);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000086E0;
    v4[3] = &unk_10002CA48;
    v4[4] = v2;
    [(CRAgent *)v2 _executeAfterFirstUnlock:v4];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];

  v3.receiver = self;
  v3.super_class = (Class)CRAgent;
  [(CRAgent *)&v3 dealloc];
}

- (void)_adjustLibraryStoreSyncBehaviorWithLockedState:(BOOL)a3
{
  double v4 = *(double *)&qword_100034210;
  if (a3) {
    double v4 = 1.79769313e308;
  }
  [(_CRRecentsLibrary *)self->_library setStoreSyncDelay:v4];
  library = self->_library;
  [(_CRRecentsLibrary *)library synchronize];
}

- (void)_lockStateChanged:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", @"CRPowerMonitorDeviceLockedStateKey"), "BOOLValue");
  [(CRAgent *)self _adjustLibraryStoreSyncBehaviorWithLockedState:v4];
}

- (void)_executeAfterFirstUnlock:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (off_100034148())
  {
    startupQueue = self->_startupQueue;
    dispatch_async((dispatch_queue_t)startupQueue, a3);
  }
  else
  {
    int out_token = -1;
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100008C88;
    handler[3] = &unk_10002CB40;
    handler[4] = self;
    handler[5] = a3;
    uint32_t v7 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, global_queue, handler);
    BOOL v8 = +[CRLogging log];
    uint64_t v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10001A768(v9);
      }
      if (out_token != -1) {
        notify_cancel(out_token);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "waiting for first unlock", v10, 2u);
    }
  }
}

- (void)start
{
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = (NSXPCListener *)[v3 initWithMachServiceName:CRRecentsAgentMachServiceName];
  self->_listener = v4;
  [(NSXPCListener *)v4 setDelegate:self];
  listener = self->_listener;
  [(NSXPCListener *)listener resume];
}

- (void)stop
{
  [(NSXPCListener *)self->_listener invalidate];

  self->_listener = 0;
  library = self->_library;
  [(_CRRecentsLibrary *)library closeDatabaseConnections];
}

@end
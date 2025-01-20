@interface GSDaemon
+ (id)daemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GSDaemon)init;
- (id)_registerSignal:(int)a3 queue:(id)a4;
- (int)resume;
- (void)_resume;
- (void)invalidate;
- (void)waitUntilDeviceIsUnlocked;
@end

@implementation GSDaemon

+ (id)daemon
{
  if (qword_10004CEE8 != -1) {
    dispatch_once(&qword_10004CEE8, &stru_100041100);
  }
  v2 = (void *)qword_10004CEE0;
  return v2;
}

- (GSDaemon)init
{
  v15.receiver = self;
  v15.super_class = (Class)GSDaemon;
  v2 = [(GSDaemon *)&v15 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(0, 0);
    uint64_t v4 = [(GSDaemon *)v2 _registerSignal:1 queue:v3];
    hup_src = v2->_hup_src;
    v2->_hup_src = (OS_dispatch_source *)v4;

    uint64_t v6 = [(GSDaemon *)v2 _registerSignal:2 queue:v3];
    int_src = v2->_int_src;
    v2->_int_src = (OS_dispatch_source *)v6;

    uint64_t v8 = [(GSDaemon *)v2 _registerSignal:15 queue:v3];
    term_src = v2->_term_src;
    v2->_term_src = (OS_dispatch_source *)v8;

    uint64_t v10 = [(GSDaemon *)v2 _registerSignal:3 queue:v3];
    quit_src = v2->_quit_src;
    v2->_quit_src = (OS_dispatch_source *)v10;

    _set_user_dir_suffix();
    v12 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.revisiond"];
    listener = v2->_listener;
    v2->_listener = v12;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
  }
  return v2;
}

- (id)_registerSignal:(int)a3 queue:(id)a4
{
  uint64_t v6 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, v6);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000123C4;
  handler[3] = &unk_100040B00;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  return v7;
}

- (void)waitUntilDeviceIsUnlocked
{
  if (MKBDeviceFormattedForContentProtection())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_create("com.apple.genstore.wait-unlock", v3);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000125E0;
    v14[3] = &unk_100040B00;
    v5 = v2;
    objc_super v15 = v5;
    uint64_t v6 = objc_retainBlock(v14);
    v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    uint64_t v8 = (int *)(v17 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012678;
    handler[3] = &unk_100040CD0;
    v13 = &v16;
    v9 = v6;
    id v12 = v9;
    if (notify_register_dispatch(v7, v8, v4, handler)) {
      abort();
    }
    dispatch_async(v4, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000126A0;
    v10[3] = &unk_100040CF8;
    v10[4] = &v16;
    dispatch_sync(v4, v10);

    _Block_object_dispose(&v16, 8);
  }
}

- (void)_resume
{
  [(GSDaemon *)self waitUntilDeviceIsUnlocked];
  v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    v5 = getprogname();
    __int16 v6 = 2080;
    v7 = "Nov 10 2024";
    __int16 v8 = 2080;
    v9 = "02:37:19";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] %s starting, built @ %s %s", (uint8_t *)&v4, 0x20u);
  }

  xpc_set_event_stream_handler("com.apple.fsevents.matching", 0, &stru_100041120);
  +[GSStorageManager startLibraries];
  [(NSXPCListener *)self->_listener resume];
  CacheDeleteRegisterInfoCallbacks();
}

- (int)resume
{
  [(GSDaemon *)self _resume];
  int v4 = +[NSRunLoop mainRunLoop];
  [v4 run];

  return 0;
}

- (void)invalidate
{
  v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] revisiond shutting down...", buf, 2u);
  }

  [(NSXPCListener *)self->_listener invalidate];
  +[GSStorageManager shutdownLibraries];
  int v4 = sub_100002D4C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] revisiond exiting now", v5, 2u);
  }

  exit(0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [[GSClient alloc] initWithConnection:v4];
  unsigned int v6 = [v4 processIdentifier];
  v7 = sub_100009DFC();
  [v4 setExportedInterface:v7];

  [v4 setExportedObject:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013360;
  v11[3] = &unk_1000411C0;
  unsigned int v12 = v6;
  v11[4] = v4;
  [v4 setInterruptionHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013410;
  v9[3] = &unk_1000411C0;
  unsigned int v10 = v6;
  v9[4] = v4;
  [v4 setInvalidationHandler:v9];
  [v4 resume];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_hup_src, 0);
  objc_storeStrong((id *)&self->_quit_src, 0);
  objc_storeStrong((id *)&self->_term_src, 0);
  objc_storeStrong((id *)&self->_int_src, 0);
}

@end
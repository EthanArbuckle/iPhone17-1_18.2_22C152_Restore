@interface ASServicesMonitor
- (ASServicesMonitor)init;
- (ASServicesMonitorDelegate)delegate;
- (id)_pendingServiceBundlesToReload;
- (id)keepAliveWithReplyHandler:(id)a3;
- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 completion:(id)a5;
- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 syncSnapshotCompletion:(id)a5;
- (void)__CRASH_DUE_TO_STUCK_PLUGIN__;
- (void)_reloadPendingServiceBundles;
- (void)_restartDueToStuckPluginAtPath:(id)a3;
- (void)_restartProcessIfNeeded;
- (void)decrementKeepAliveCount;
- (void)incrementKeepAliveCount;
- (void)reloadServiceBundleAtPath:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ASServicesMonitor

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingServiceBundlesToReload, 0);
  objc_storeStrong((id *)&self->_stuckPluginPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ASServicesMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASServicesMonitorDelegate *)WeakRetained;
}

- (void)_reloadPendingServiceBundles
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(ASServicesMonitor *)self _pendingServiceBundlesToReload];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned __int8 v8 = [v7 isLoaded];
        v9 = (void *)AFSiriLogContextService;
        BOOL v10 = os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO);
        if (v8)
        {
          if (v10)
          {
            v14 = v9;
            v15 = [v7 bundlePath];
            *(_DWORD *)buf = 136315394;
            v22 = "-[ASServicesMonitor _reloadPendingServiceBundles]";
            __int16 v23 = 2114;
            v24 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Reloading service at path: %{public}@ (Note: at this point, we're just killing assistant_service, not really reloading anything. See enhancement request <rdar://problem/48655714> for details)", buf, 0x16u);
          }
          exit(0);
        }
        if (v10)
        {
          v11 = v9;
          v12 = [v7 bundlePath];
          *(_DWORD *)buf = 136315394;
          v22 = "-[ASServicesMonitor _reloadPendingServiceBundles]";
          __int16 v23 = 2114;
          v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Service at path (%{public}@) hasn't been loaded before, no need to reload", buf, 0x16u);
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v4);
  }

  pendingServiceBundlesToReload = self->_pendingServiceBundlesToReload;
  self->_pendingServiceBundlesToReload = 0;
}

- (void)reloadServiceBundleAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[ASServicesMonitor reloadServiceBundleAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  v6 = +[NSBundle bundleWithPath:v4];
  v7 = [(ASServicesMonitor *)self _pendingServiceBundlesToReload];
  [v7 addObject:v6];

  unint64_t keepAliveCount = self->_keepAliveCount;
  if (keepAliveCount)
  {
    v9 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ASServicesMonitor reloadServiceBundleAtPath:]";
      __int16 v12 = 2048;
      unint64_t v13 = keepAliveCount;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s There are %ld alive counts, will defer reload until it hits zero", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    [(ASServicesMonitor *)self _reloadPendingServiceBundles];
  }
}

- (id)keepAliveWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[ASServicesMonitor keepAliveWithReplyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(ASServicesMonitor *)self incrementKeepAliveCount];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000069DC;
  v9[3] = &unk_100014540;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(v9);

  return v7;
}

- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 syncSnapshotCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006CCC;
  v24[3] = &unk_100014940;
  id v13 = v8;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  v27 = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006DA0;
  v21[3] = &unk_100014518;
  id v15 = [v11 initWithTimeoutInterval:queue onQueue:v24 timeoutHandler:567.0];
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  long long v17 = objc_retainBlock(v21);
  long long v18 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ASServicesMonitor startWatchdogForPluginAtPath:syncClassName:syncSnapshotCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Starting watchdog timer", buf, 0xCu);
  }
  [v15 start];
  long long v19 = objc_retainBlock(v17);

  return v19;
}

- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000070B0;
  v24[3] = &unk_100014940;
  id v13 = v8;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  v27 = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100007184;
  v21[3] = &unk_100014648;
  id v15 = [v11 initWithTimeoutInterval:queue onQueue:v24 timeoutHandler:567.0];
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  long long v17 = objc_retainBlock(v21);
  long long v18 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ASServicesMonitor startWatchdogForPluginAtPath:syncClassName:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Starting watchdog timer", buf, 0xCu);
  }
  [v15 start];
  long long v19 = objc_retainBlock(v17);

  return v19;
}

- (void)_restartDueToStuckPluginAtPath:(id)a3
{
  id v5 = a3;
  id v6 = [v5 lastPathComponent];
  v7 = +[NSString stringWithFormat:@"Stuck sync plugin: %@", v6];
  id v8 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ASServicesMonitor _restartDueToStuckPluginAtPath:]";
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_stuckPluginPath, a3);
  self->_abortMethod = "__CRASH_DUE_TO_STUCK_PLUGIN__";
  [(ASServicesMonitor *)self _restartProcessIfNeeded];
}

- (void)__CRASH_DUE_TO_STUCK_PLUGIN__
{
  v2 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[ASServicesMonitor __CRASH_DUE_TO_STUCK_PLUGIN__]";
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v3, 0xCu);
  }
  exit(1);
}

- (void)_restartProcessIfNeeded
{
  if (self->_abortMethod)
  {
    if (!self->_keepAliveCount)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      stuckPluginPath = self->_stuckPluginPath;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000074D4;
      v5[3] = &unk_1000146E8;
      v5[4] = self;
      [WeakRetained serviceMonitorWillCrashAssistantServiceDueToPluginAtPath:stuckPluginPath reply:v5];
    }
  }
}

- (void)decrementKeepAliveCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000075C4;
  block[3] = &unk_1000146E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)incrementKeepAliveCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007720;
  block[3] = &unk_1000146E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ASServicesMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASServicesMonitor;
  v2 = [(ASServicesMonitor *)&v8 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.service.watchdog", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)_pendingServiceBundlesToReload
{
  pendingServiceBundlesToReload = self->_pendingServiceBundlesToReload;
  if (!pendingServiceBundlesToReload)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    dispatch_queue_t v5 = self->_pendingServiceBundlesToReload;
    self->_pendingServiceBundlesToReload = v4;

    pendingServiceBundlesToReload = self->_pendingServiceBundlesToReload;
  }
  return pendingServiceBundlesToReload;
}

@end
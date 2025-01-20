@interface TKCtkdRunner
- (BOOL)hasRegistry;
- (OS_dispatch_source)sigTermSource;
- (TKCtkdRunner)initWithArgc:(int)a3 argv:(const char *)a4;
- (TKHostTokenDriverCache)tokenDriverCache;
- (TKHostTokenRegistry)tokenRegistry;
- (TKSlotServer)slotServer;
- (TKSlotWatcher)slotWatcher;
- (TKTokenServer)tokenServer;
- (void)ensureSlotWatcherIsRunning;
- (void)run;
@end

@implementation TKCtkdRunner

- (TKHostTokenDriverCache)tokenDriverCache
{
  tokenDriverCache = self->_tokenDriverCache;
  if (!tokenDriverCache)
  {
    v4 = objc_alloc_init(TKHostTokenDriverCache);
    v5 = self->_tokenDriverCache;
    self->_tokenDriverCache = v4;

    tokenDriverCache = self->_tokenDriverCache;
  }

  return tokenDriverCache;
}

- (TKHostTokenRegistry)tokenRegistry
{
  tokenRegistry = self->_tokenRegistry;
  if (!tokenRegistry)
  {
    v4 = [TKHostTokenRegistry alloc];
    v5 = [(TKCtkdRunner *)self tokenDriverCache];
    v6 = +[NSXPCListener anonymousListener];
    v7 = objc_alloc_init(TKHostKeychainHandler);
    v8 = [(TKHostTokenRegistry *)v4 initWithDriverCache:v5 listener:v6 keychain:v7];
    v9 = self->_tokenRegistry;
    self->_tokenRegistry = v8;

    tokenRegistry = self->_tokenRegistry;
  }

  return tokenRegistry;
}

- (BOOL)hasRegistry
{
  return self->_tokenRegistry != 0;
}

- (TKCtkdRunner)initWithArgc:(int)a3 argv:(const char *)a4
{
  v23.receiver = self;
  v23.super_class = (Class)TKCtkdRunner;
  v6 = [(TKCtkdRunner *)&v23 init];
  v7 = v6;
  if (v6)
  {
    [(TKCtkdRunner *)v6 initializeSandBox];
    uint64_t v8 = TKClientTokenServerPortName;
    uint64_t v9 = TKProtocolSlotRegistryName;
    uint64_t v10 = TKProtocolSlotClientName;
    do
    {
      while (1)
      {
        int v11 = getopt(a3, (char *const *)a4, "stw");
        if (v11 <= 115) {
          break;
        }
        if (v11 == 116)
        {
          id v13 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v8];
          v19 = [[TKTokenServer alloc] initWithTokenServer:v13];
          tokenServer = v7->_tokenServer;
          v7->_tokenServer = v19;

          id v21 = [(TKCtkdRunner *)v7 tokenRegistry];
LABEL_10:
        }
        else if (v11 == 119)
        {
          v12 = [TKSlotWatcher alloc];
          id v13 = [(TKCtkdRunner *)v7 tokenRegistry];
          v14 = [(TKSlotWatcher *)v12 initWithTokenRegistry:v13];
          slotWatcher = v7->_slotWatcher;
          v7->_slotWatcher = v14;

          goto LABEL_10;
        }
      }
      if (v11 == 115)
      {
        id v13 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v9];
        id v16 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v10];
        v17 = [[TKSlotServer alloc] initWithRegistryListener:v13 clientListener:v16];
        slotServer = v7->_slotServer;
        v7->_slotServer = v17;

        goto LABEL_10;
      }
    }
    while (v11 != -1);
  }
  return v7;
}

- (void)ensureSlotWatcherIsRunning
{
  id v3 = objc_alloc((Class)NSXPCConnection);
  id v5 = [v3 initWithMachServiceName:TKProtocolSlotClientName options:4096];
  v4 = [(TKCtkdRunner *)self slotWatcher];
  [v4 startWithSlotServer:v5];
}

- (void)run
{
  id v3 = sub_100005A74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100013C38(self, v3);
  }

  v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigTermSource = self->_sigTermSource;
  self->_sigTermSource = v4;

  v6 = [(TKCtkdRunner *)self sigTermSource];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005AC8;
  handler[3] = &unk_100020600;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);

  v7 = [(TKCtkdRunner *)self sigTermSource];
  dispatch_activate(v7);

  signal(15, (void (__cdecl *)(int))1);
  uint64_t v8 = [(TKCtkdRunner *)self slotServer];

  if (v8)
  {
    uint64_t v9 = [(TKCtkdRunner *)self slotServer];
    [v9 start];

    LODWORD(out_token) = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100005BB8;
    v20[3] = &unk_100020628;
    v20[4] = self;
    notify_register_dispatch((const char *)[@"com.apple.system.loginwindow.desktopUp" UTF8String], (int *)&out_token, (dispatch_queue_t)&_dispatch_main_q, v20);
  }
  uint64_t v10 = [(TKCtkdRunner *)self tokenServer];

  if (v10)
  {
    int v11 = [(TKCtkdRunner *)self tokenServer];
    [v11 start];
  }
  if ([(TKCtkdRunner *)self hasRegistry])
  {
    v12 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005C18;
    block[3] = &unk_100020600;
    block[4] = self;
    dispatch_async(v12, block);
  }
  id v13 = [(TKCtkdRunner *)self slotWatcher];

  if (v13)
  {
    [(TKCtkdRunner *)self ensureSlotWatcherIsRunning];
    v14 = [(TKCtkdRunner *)self tokenServer];

    if (v14)
    {
      objc_initWeak(&out_token, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100005CA0;
      v16[3] = &unk_100020650;
      objc_copyWeak(&v17, &out_token);
      v15 = [(TKCtkdRunner *)self tokenServer];
      [v15 setEnsureSlotWatcherIsRunning:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&out_token);
    }
  }
}

- (TKTokenServer)tokenServer
{
  return self->_tokenServer;
}

- (TKSlotServer)slotServer
{
  return self->_slotServer;
}

- (TKSlotWatcher)slotWatcher
{
  return self->_slotWatcher;
}

- (OS_dispatch_source)sigTermSource
{
  return self->_sigTermSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigTermSource, 0);
  objc_storeStrong((id *)&self->_slotWatcher, 0);
  objc_storeStrong((id *)&self->_slotServer, 0);
  objc_storeStrong((id *)&self->_tokenServer, 0);
  objc_storeStrong((id *)&self->_tokenRegistry, 0);

  objc_storeStrong((id *)&self->_tokenDriverCache, 0);
}

@end
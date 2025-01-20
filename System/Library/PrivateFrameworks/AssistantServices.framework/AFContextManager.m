@interface AFContextManager
+ (id)defaultContextManager;
- (AFContextManager)init;
- (BOOL)addContextProvider:(id)a3;
- (id)_collateContexts;
- (id)_serverName;
- (void)_collateContextsIntoArray:(id)a3;
- (void)_shutdownServer;
- (void)_startListening;
- (void)_stopListening;
- (void)dealloc;
- (void)removeContextProvider:(id)a3;
- (void)startCenter:(id)a3;
@end

@implementation AFContextManager

- (void)startCenter:(id)a3
{
  id v11 = a3;
  v4 = (void *)MEMORY[0x19F3A4E70]();
  [v11 runServerOnCurrentThreadProtectedByEntitlement:@"com.apple.assistant.contextprovider"];
  v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  id v6 = objc_alloc(MEMORY[0x1E4F1CB00]);
  v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v8 = (void *)[v6 initWithFireDate:v7 interval:self target:sel_nothing selector:0 userInfo:0 repeats:15.0];

  [v5 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];
  do
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:15.0];
    [v5 runUntilDate:v9];
    char v10 = [v11 doesServerExist];
  }
  while ((v10 & 1) != 0);
  [v8 invalidate];
}

- (BOOL)addContextProvider:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    __assert_rtn("-[AFContextManager addContextProvider:]", "AFContextManager.m", 197, "[NSThread isMainThread]");
  }
  CFIndex Count = CFArrayGetCount(self->_contextProviders);
  CFIndex v6 = Count - 1;
  if (Count < 1)
  {
LABEL_7:
    CFArrayAppendValue(self->_contextProviders, v4);
    [(AFContextManager *)self _startListening];
    BOOL v12 = 1;
  }
  else
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(self->_contextProviders, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v4) {
        break;
      }
      if (v7 == ++v8)
      {
        char v10 = CFArrayGetValueAtIndex(self->_contextProviders, v6);
        int v11 = [v10 allowContextProvider:v4];

        if (v11) {
          goto LABEL_7;
        }
        break;
      }
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_startListening
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__shutdownServer object:0];
  if (!self->_center)
  {
    id v5 = [(AFContextManager *)self _serverName];
    v3 = [MEMORY[0x1E4F4BE50] pidRestrictedCenterNamed:v5];
    center = self->_center;
    self->_center = v3;

    [(CPDistributedMessagingCenter *)self->_center setTargetPID:getpid()];
    [(CPDistributedMessagingCenter *)self->_center registerForMessageName:@"CollateContexts" target:self selector:sel__collateContexts];
    [MEMORY[0x1E4F29060] detachNewThreadSelector:sel_startCenter_ toTarget:self withObject:self->_center];
  }
}

- (id)_serverName
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  id v4 = AFContextProviderNameForBundleId(v3);

  return v4;
}

void __41__AFContextManager_defaultContextManager__block_invoke()
{
  v0 = objc_alloc_init(AFContextManager);
  v1 = (void *)__defaultContextManager;
  __defaultContextManager = (uint64_t)v0;
}

- (AFContextManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)AFContextManager;
  v2 = [(AFContextManager *)&v4 init];
  if (v2) {
    v2->_contextProviders = CFArrayCreateMutable(0, 0, 0);
  }
  return v2;
}

+ (id)defaultContextManager
{
  if (defaultContextManager_onceToken != -1) {
    dispatch_once(&defaultContextManager_onceToken, &__block_literal_global_5519);
  }
  v2 = (void *)__defaultContextManager;
  return v2;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  CFRelease(self->_contextProviders);
  v3.receiver = self;
  v3.super_class = (Class)AFContextManager;
  [(AFContextManager *)&v3 dealloc];
}

- (void)removeContextProvider:(id)a3
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    __assert_rtn("-[AFContextManager removeContextProvider:]", "AFContextManager.m", 222, "[NSThread isMainThread]");
  }
  CFIndex Count = CFArrayGetCount(self->_contextProviders);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(self->_contextProviders, v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_8;
      }
    }
    CFArrayRemoveValueAtIndex(self->_contextProviders, v6);
  }
LABEL_8:
  if (!CFArrayGetCount(self->_contextProviders)) {
    [(AFContextManager *)self _stopListening];
  }
}

- (void)_stopListening
{
  if (self->_center) {
    [(AFContextManager *)self performSelector:sel__shutdownServer withObject:0 afterDelay:15.0];
  }
}

- (void)_shutdownServer
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  [(CPDistributedMessagingCenter *)self->_center stopServer];
  center = self->_center;
  self->_center = 0;
}

- (id)_collateContexts
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  [(AFContextManager *)self performSelectorOnMainThread:sel__collateContextsIntoArray_ withObject:v3 waitUntilDone:1];
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Contexts"];

  return v4;
}

- (void)_collateContextsIntoArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    __assert_rtn("-[AFContextManager _collateContextsIntoArray:]", "AFContextManager.m", 77, "[NSThread isMainThread]");
  }
  CFIndex v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[AFContextManager _collateContextsIntoArray:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  CFIndex Count = CFArrayGetCount(self->_contextProviders);
  if (Count >= 1)
  {
    unint64_t v7 = Count + 1;
    do
    {
      id v8 = CFArrayGetValueAtIndex(self->_contextProviders, v7 - 2);
      id v9 = [v8 getCurrentContext];
      char v10 = [v9 firstObject];
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [MEMORY[0x1E4F96508] dictionaryArrayWithAceObjectArray:v9];

          id v9 = (void *)v11;
        }
      }
      if (v9) {
        [v4 addObject:v9];
      }

      --v7;
    }
    while (v7 > 1);
  }
}

@end
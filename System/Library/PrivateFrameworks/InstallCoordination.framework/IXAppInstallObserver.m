@interface IXAppInstallObserver
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IXAppInstallObserver)initWithMachServiceName:(id)a3 forClients:(id)a4 delegate:(id)a5;
- (IXAppInstallObserverDelegate)delegate;
- (NSXPCListener)listener;
- (OS_dispatch_queue)delegateQueue;
- (id)_oncePerBootUniqueIdentifierForServiceName:(id)a3;
- (id)initTransientForClients:(id)a3 delegate:(id)a4;
- (void)_client_coordinatorDidCompleteSuccessfullyWithSeed:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidInstallPlaceholderWithSeed:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorShouldBeginPostProcessingWithSeed:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorShouldBeginRestoringUserDataWithSeed:(id)a3;
- (void)_client_coordinatorShouldPauseWithSeed:(id)a3;
- (void)_client_coordinatorShouldPrioritizeWithSeed:(id)a3;
- (void)_client_coordinatorShouldResumeWithSeed:(id)a3;
- (void)_client_coordinatorWithSeed:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4;
- (void)_client_coordinatorWithSeed:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_client_shouldPrioritizeAppWithBundleID:(id)a3;
- (void)_client_shouldPrioritizeAppWithIdentity:(id)a3;
- (void)_internalInit;
- (void)dealloc;
- (void)setDelegateQueue:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation IXAppInstallObserver

- (void)_internalInit
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.installcoordination.AppInstallObserver.delegate", v5);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v3;
}

- (id)_oncePerBootUniqueIdentifierForServiceName:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_SHA1(v3, v4, md);
  v5 = [MEMORY[0x1E4F28E78] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02hhx", md[i]);
  v7 = (void *)[v5 copy];

  unint64_t v8 = [v7 length];
  if (v8 >= 0x10) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = v8;
  }
  v10 = [v7 substringToIndex:v9];
  v11 = [NSString stringWithFormat:@"installcood.f.%@", v10];

  return v11;
}

- (IXAppInstallObserver)initWithMachServiceName:(id)a3 forClients:(id)a4 delegate:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IXAppInstallObserver;
  v11 = [(IXAppInstallObserver *)&v23 init];
  v12 = v11;
  if (v11)
  {
    [(IXAppInstallObserver *)v11 _internalInit];
    uint64_t v13 = _SelectorsRespondedToByDelegate();
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v8];
    [v14 setDelegate:v12];
    [v14 resume];
    [(IXAppInstallObserver *)v12 setListener:v14];
    v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = _IXStringForObserverRespondsToSelectors(v13);
      *(_DWORD *)buf = 136315906;
      v25 = "-[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]";
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, "%s: Creating IXAppInstallObserver with service name %@ for client IDs %@ responding to selectors %@", buf, 0x2Au);
    }
    v17 = [(IXAppInstallObserver *)v12 _oncePerBootUniqueIdentifierForServiceName:v8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__IXAppInstallObserver_initWithMachServiceName_forClients_delegate___block_invoke;
    v19[3] = &unk_1E5D16FF0;
    id v20 = v8;
    id v21 = v9;
    uint64_t v22 = v13;
    IXRunOncePerBootWork(v17, v19);
  }
  return v12;
}

void __68__IXAppInstallObserver_initWithMachServiceName_forClients_delegate___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[IXServerConnection sharedConnection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2];

  CC_LONG v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    v7 = _IXStringForObserverRespondsToSelectors(a1[6]);
    int v8 = 136315906;
    id v9 = "-[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Notifying installcoordinationd of observer with service name %@ for client IDs %@ responding to selectors %@", (uint8_t *)&v8, 0x2Au);
  }
  objc_msgSend(v3, "_remote_registerObserverMachServiceName:forClientIdentifiers:respondingToSelectors:", a1[4], a1[5], a1[6]);
}

void __68__IXAppInstallObserver_initWithMachServiceName_forClients_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to register mach service name: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)initTransientForClients:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IXAppInstallObserver;
  uint64_t v8 = [(IXAppInstallObserver *)&v16 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    [(IXAppInstallObserver *)v8 _internalInit];
    uint64_t v10 = _SelectorsRespondedToByDelegate();
    objc_storeWeak(p_isa + 1, v7);
    uint64_t v11 = [MEMORY[0x1E4F29290] anonymousListener];
    [v11 setDelegate:p_isa];
    [v11 resume];
    [p_isa setListener:v11];
    __int16 v12 = +[IXServerConnection sharedConnection];
    uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_7];

    __int16 v14 = [v11 endpoint];
    objc_msgSend(v13, "_remote_registerTransientObserver:forClientIdentifiers:respondingToSelectors:", v14, v6, v10);
  }
  return p_isa;
}

void __57__IXAppInstallObserver_initTransientForClients_delegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[IXAppInstallObserver initTransientForClients:delegate:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to register endpoint: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(IXAppInstallObserver *)self listener];
  [v3 invalidate];

  int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[IXAppInstallObserver dealloc]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Deallocing %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)IXAppInstallObserver;
  [(IXAppInstallObserver *)&v5 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = IXHasTrueValueForEntitlement(v5, @"com.apple.private.installcoordinationd.daemon");
  if (v6)
  {
    id v7 = +[IXAppInstallObserverProtocolInterface interface];
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_15];
    [v5 setInvalidationHandler:&__block_literal_global_17];
    [v5 resume];
  }
  else
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = IXCopyClientNameForConnection(v5);
      int v11 = 136315650;
      __int16 v12 = "-[IXAppInstallObserver listener:shouldAcceptNewConnection:]";
      __int16 v13 = 2112;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      objc_super v16 = @"com.apple.private.installcoordinationd.daemon";
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Process %@ is missing %@ entitlement so rejecting connection attempt.", (uint8_t *)&v11, 0x20u);
    }
  }

  return v6;
}

- (void)_client_coordinatorShouldPrioritizeWithSeed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__IXAppInstallObserver__client_coordinatorShouldPrioritizeWithSeed___block_invoke;
    block[3] = &unk_1E5D16FF0;
    uint64_t v10 = v4;
    __int16 v12 = sel_coordinatorShouldPrioritize_;
    id v11 = v5;
    dispatch_async(v6, block);

    id v7 = v10;
  }
  else
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromSelector(sel_coordinatorShouldPrioritize_);
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[IXAppInstallObserver _client_coordinatorShouldPrioritizeWithSeed:]";
      __int16 v15 = 2112;
      objc_super v16 = v8;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __68__IXAppInstallObserver__client_coordinatorShouldPrioritizeWithSeed___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  v3 = +[IXServerConnection sharedConnection];
  [v3 registerAppInstallCoordinatorForUpdates:v2 notifyDaemon:1];

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    char v6 = [v2 bundleID];
    unint64_t v7 = [*(id *)(a1 + 32) intent];
    if (v7 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v7);
      __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v8 = off_1E5D17D38[v7];
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[IXAppInstallObserver _client_coordinatorShouldPrioritizeWithSeed:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v8;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 40) coordinatorShouldPrioritize:v2];
}

- (void)_client_shouldPrioritizeAppWithBundleID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__IXAppInstallObserver__client_shouldPrioritizeAppWithBundleID___block_invoke;
    block[3] = &unk_1E5D16FF0;
    id v12 = sel_shouldPrioritizeAppWithBundleID_;
    uint64_t v10 = v4;
    id v11 = v5;
    dispatch_async(v6, block);

    unint64_t v7 = v10;
  }
  else
  {
    unint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromSelector(sel_shouldPrioritizeAppWithBundleID_);
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithBundleID:]";
      __int16 v15 = 2112;
      objc_super v16 = v8;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

uint64_t __64__IXAppInstallObserver__client_shouldPrioritizeAppWithBundleID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315650;
    unint64_t v7 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithBundleID:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for bundle ID %@", (uint8_t *)&v6, 0x20u);
  }
  return [*(id *)(a1 + 40) shouldPrioritizeAppWithBundleID:*(void *)(a1 + 32)];
}

- (void)_client_shouldPrioritizeAppWithIdentity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__IXAppInstallObserver__client_shouldPrioritizeAppWithIdentity___block_invoke;
    block[3] = &unk_1E5D16FF0;
    uint64_t v12 = sel_shouldPrioritizeAppWithIdentity_;
    __int16 v10 = v4;
    id v11 = v5;
    dispatch_async(v6, block);

    unint64_t v7 = v10;
  }
  else
  {
    unint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromSelector(sel_shouldPrioritizeAppWithIdentity_);
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithIdentity:]";
      __int16 v15 = 2112;
      objc_super v16 = v8;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

uint64_t __64__IXAppInstallObserver__client_shouldPrioritizeAppWithIdentity___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315650;
    unint64_t v7 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithIdentity:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for identity %@", (uint8_t *)&v6, 0x20u);
  }
  return [*(id *)(a1 + 40) shouldPrioritizeAppWithIdentity:*(void *)(a1 + 32)];
}

- (void)_client_coordinatorShouldResumeWithSeed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__IXAppInstallObserver__client_coordinatorShouldResumeWithSeed___block_invoke;
    block[3] = &unk_1E5D16FF0;
    __int16 v10 = v4;
    uint64_t v12 = sel_coordinatorShouldResume_;
    id v11 = v5;
    dispatch_async(v6, block);

    unint64_t v7 = v10;
  }
  else
  {
    unint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromSelector(sel_coordinatorShouldResume_);
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[IXAppInstallObserver _client_coordinatorShouldResumeWithSeed:]";
      __int16 v15 = 2112;
      objc_super v16 = v8;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __64__IXAppInstallObserver__client_coordinatorShouldResumeWithSeed___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  v3 = +[IXServerConnection sharedConnection];
  [v3 registerAppInstallCoordinatorForUpdates:v2 notifyDaemon:1];

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    int v6 = [v2 bundleID];
    unint64_t v7 = [*(id *)(a1 + 32) intent];
    if (v7 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v7);
      __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v8 = off_1E5D17D38[v7];
    }
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[IXAppInstallObserver _client_coordinatorShouldResumeWithSeed:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v8;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 40) coordinatorShouldResume:v2];
}

- (void)_client_coordinatorShouldPauseWithSeed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__IXAppInstallObserver__client_coordinatorShouldPauseWithSeed___block_invoke;
    block[3] = &unk_1E5D16FF0;
    __int16 v10 = v4;
    id v12 = sel_coordinatorShouldPause_;
    id v11 = v5;
    dispatch_async(v6, block);

    unint64_t v7 = v10;
  }
  else
  {
    unint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromSelector(sel_coordinatorShouldPause_);
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[IXAppInstallObserver _client_coordinatorShouldPauseWithSeed:]";
      __int16 v15 = 2112;
      objc_super v16 = v8;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __63__IXAppInstallObserver__client_coordinatorShouldPauseWithSeed___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  v3 = +[IXServerConnection sharedConnection];
  [v3 registerAppInstallCoordinatorForUpdates:v2 notifyDaemon:1];

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    int v6 = [v2 bundleID];
    unint64_t v7 = [*(id *)(a1 + 32) intent];
    if (v7 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v7);
      __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v8 = off_1E5D17D38[v7];
    }
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[IXAppInstallObserver _client_coordinatorShouldPauseWithSeed:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v8;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 40) coordinatorShouldPause:v2];
}

- (void)_client_coordinatorWithSeed:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    __int16 v8 = [(IXAppInstallObserver *)self delegateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__IXAppInstallObserver__client_coordinatorWithSeed_configuredPromiseDidBeginFulfillment___block_invoke;
    v11[3] = &unk_1E5D17CF0;
    id v12 = v6;
    __int16 v14 = sel_coordinator_configuredPromiseDidBeginFulfillment_;
    id v13 = v7;
    unint64_t v15 = a4;
    dispatch_async(v8, v11);

    id v9 = v12;
  }
  else
  {
    id v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = NSStringFromSelector(sel_coordinator_configuredPromiseDidBeginFulfillment_);
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[IXAppInstallObserver _client_coordinatorWithSeed:configuredPromiseDidBeginFulfillment:]";
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __89__IXAppInstallObserver__client_coordinatorWithSeed_configuredPromiseDidBeginFulfillment___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  v3 = +[IXServerConnection sharedConnection];
  [v3 registerAppInstallCoordinatorForUpdates:v2 notifyDaemon:1];

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v2 bundleID];
    unint64_t v7 = [*(id *)(a1 + 32) intent];
    if (v7 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v7);
      __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v8 = off_1E5D17D38[v7];
    }
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[IXAppInstallObserver _client_coordinatorWithSeed:configuredPromiseDidBeginFulfillment:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v8;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 40) coordinator:v2 configuredPromiseDidBeginFulfillment:*(void *)(a1 + 56)];
}

- (void)_client_coordinatorShouldBeginRestoringUserDataWithSeed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__IXAppInstallObserver__client_coordinatorShouldBeginRestoringUserDataWithSeed___block_invoke;
    block[3] = &unk_1E5D16FF0;
    __int16 v10 = v4;
    id v12 = sel_coordinatorShouldBeginRestoringUserData_;
    id v11 = v5;
    dispatch_async(v6, block);

    unint64_t v7 = v10;
  }
  else
  {
    unint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromSelector(sel_coordinatorShouldBeginRestoringUserData_);
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[IXAppInstallObserver _client_coordinatorShouldBeginRestoringUserDataWithSeed:]";
      __int16 v15 = 2112;
      objc_super v16 = v8;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __80__IXAppInstallObserver__client_coordinatorShouldBeginRestoringUserDataWithSeed___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  v3 = +[IXServerConnection sharedConnection];
  [v3 registerAppInstallCoordinatorForUpdates:v2 notifyDaemon:1];

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v2 bundleID];
    unint64_t v7 = [*(id *)(a1 + 32) intent];
    if (v7 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v7);
      __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v8 = off_1E5D17D38[v7];
    }
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[IXAppInstallObserver _client_coordinatorShouldBeginRestoringUserDataWithSeed:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v8;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 40) coordinatorShouldBeginRestoringUserData:v2];
}

- (void)_client_coordinatorDidInstallPlaceholderWithSeed:(id)a3 forRecordPromise:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v9 = 1;
  }
  else {
    char v9 = objc_opt_respondsToSelector();
  }
  if (!-[objc_class modifiesLocalLaunchServicesDatabase](+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", [v6 intent]), "modifiesLocalLaunchServicesDatabase"))
  {
    id v12 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __int16 v10 = [v6 identity];
  __int16 v11 = [v10 bundleID];
  id v12 = IXApplicationRecordForRecordPromise(v7, v11);

  if (v9)
  {
LABEL_8:
    __int16 v13 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__IXAppInstallObserver__client_coordinatorDidInstallPlaceholderWithSeed_forRecordPromise___block_invoke;
    block[3] = &unk_1E5D17D18;
    id v19 = v6;
    id v20 = v8;
    uint64_t v22 = sel_coordinatorDidInstallPlaceholder_;
    objc_super v23 = sel_coordinatorDidInstallPlaceholder_forApplicationRecord_;
    id v21 = v12;
    dispatch_async(v13, block);
  }
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    __int16 v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_);
      *(_DWORD *)buf = 136315394;
      v25 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]";
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_1A7B2D000, v14, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_super v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_forApplicationRecord_);
      *(_DWORD *)buf = 136315394;
      v25 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]";
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_1A7B2D000, v16, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __90__IXAppInstallObserver__client_coordinatorDidInstallPlaceholderWithSeed_forRecordPromise___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  v3 = +[IXServerConnection sharedConnection];
  [v3 registerAppInstallCoordinatorForUpdates:v2 notifyDaemon:1];

  if (objc_opt_respondsToSelector())
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [v2 bundleID];
      unint64_t v7 = [*(id *)(a1 + 32) intent];
      if (v7 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v7);
        __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v8 = off_1E5D17D38[v7];
      }
      *(_DWORD *)buf = 136315906;
      objc_super v16 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
    }
    [*(id *)(a1 + 40) coordinatorDidInstallPlaceholder:v2];
  }
  if (objc_opt_respondsToSelector())
  {
    char v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
      __int16 v11 = [v2 bundleID];
      unint64_t v12 = [*(id *)(a1 + 32) intent];
      if (v12 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v12);
        __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v13 = off_1E5D17D38[v12];
      }
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      objc_super v16 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@) with app record %@", buf, 0x34u);
    }
    [*(id *)(a1 + 40) coordinatorDidInstallPlaceholder:v2 forApplicationRecord:*(void *)(a1 + 48)];
  }
}

- (void)_client_coordinatorShouldBeginPostProcessingWithSeed:(id)a3 forRecordPromise:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (-[objc_class modifiesLocalLaunchServicesDatabase](+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", [v6 intent]), "modifiesLocalLaunchServicesDatabase"))
    {
      char v9 = [v6 identity];
      __int16 v10 = [v9 bundleID];
      __int16 v11 = IXApplicationRecordForRecordPromise(v7, v10);
    }
    else
    {
      __int16 v11 = 0;
    }
    __int16 v13 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(v6, "intent"))), "initWithSeed:", v6);
    uint64_t v14 = +[IXServerConnection sharedConnection];
    [v14 registerAppInstallCoordinatorForUpdates:v13 notifyDaemon:1];

    __int16 v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v17 = [v13 bundleID];
      unint64_t v18 = [v6 intent];
      if (v18 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v18);
        __int16 v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v19 = off_1E5D17D38[v18];
      }
      *(_DWORD *)buf = 136315906;
      __int16 v21 = "-[IXAppInstallObserver _client_coordinatorShouldBeginPostProcessingWithSeed:forRecordPromise:]";
      __int16 v22 = 2112;
      id v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
    }
    [v8 coordinatorShouldBeginPostProcessing:v13 forApplicationRecord:v11];
  }
  else
  {
    __int16 v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[IXAppInstallObserver _client_coordinatorShouldBeginPostProcessingWithSeed:forRecordPromise:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_1A7B2D000, v11, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

- (void)_client_coordinatorDidCompleteSuccessfullyWithSeed:(id)a3 forRecordPromise:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v9 = 1;
  }
  else {
    char v9 = objc_opt_respondsToSelector();
  }
  if (!-[objc_class modifiesLocalLaunchServicesDatabase](+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", [v6 intent]), "modifiesLocalLaunchServicesDatabase"))
  {
    unint64_t v12 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __int16 v10 = [v6 identity];
  __int16 v11 = [v10 bundleID];
  unint64_t v12 = IXApplicationRecordForRecordPromise(v7, v11);

  if (v9)
  {
LABEL_8:
    __int16 v13 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__IXAppInstallObserver__client_coordinatorDidCompleteSuccessfullyWithSeed_forRecordPromise___block_invoke;
    block[3] = &unk_1E5D17D18;
    id v19 = v6;
    id v20 = v12;
    id v21 = v8;
    __int16 v22 = sel_coordinatorDidCompleteSuccessfully_;
    id v23 = sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_;
    dispatch_async(v13, block);
  }
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_);
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]";
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_1A7B2D000, v14, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_);
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]";
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_1A7B2D000, v16, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __92__IXAppInstallObserver__client_coordinatorDidCompleteSuccessfullyWithSeed_forRecordPromise___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  [v2 setComplete:1 forApplicationRecord:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = [v2 bundleID];
      unint64_t v6 = [*(id *)(a1 + 32) intent];
      if (v6 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v6);
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_1E5D17D38[v6];
      }
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
    }
    [*(id *)(a1 + 48) coordinatorDidCompleteSuccessfully:v2];
  }
  if (objc_opt_respondsToSelector())
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      __int16 v10 = [v2 bundleID];
      unint64_t v11 = [*(id *)(a1 + 32) intent];
      if (v11 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v11);
        unint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v12 = off_1E5D17D38[v11];
      }
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      __int16 v15 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@) with app record %@", buf, 0x34u);
    }
    [*(id *)(a1 + 48) coordinatorDidCompleteSuccessfully:v2 forApplicationRecord:*(void *)(a1 + 40)];
  }
}

- (void)_client_coordinatorWithSeed:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(IXAppInstallObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v11 = [(IXAppInstallObserver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__IXAppInstallObserver__client_coordinatorWithSeed_didCancelWithReason_client___block_invoke;
    block[3] = &unk_1E5D17D18;
    __int16 v15 = v8;
    id v16 = v9;
    unint64_t v18 = a5;
    id v19 = sel_coordinator_canceledWithReason_client_;
    id v17 = v10;
    dispatch_async(v11, block);

    unint64_t v12 = v15;
  }
  else
  {
    unint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(sel_coordinator_canceledWithReason_client_);
      *(_DWORD *)buf = 136315394;
      id v21 = "-[IXAppInstallObserver _client_coordinatorWithSeed:didCancelWithReason:client:]";
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1A7B2D000, v12, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);
    }
  }
}

void __79__IXAppInstallObserver__client_coordinatorWithSeed_didCancelWithReason_client___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(void *)(a1 + 32));
  [v2 setError:*(void *)(a1 + 40)];
  [v2 setErrorSourceIdentifier:*(void *)(a1 + 56)];
  v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v2 bundleID];
    unint64_t v6 = [*(id *)(a1 + 32) intent];
    if (v6 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v6);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = off_1E5D17D38[v6];
    }
    *(_DWORD *)buf = 136315906;
    id v9 = "-[IXAppInstallObserver _client_coordinatorWithSeed:didCancelWithReason:client:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 48) coordinator:v2 canceledWithReason:*(void *)(a1 + 40) client:*(void *)(a1 + 56)];
}

- (IXAppInstallObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IXAppInstallObserverDelegate *)WeakRetained;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
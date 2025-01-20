@interface AXUIServiceManager
+ (id)sharedServiceManager;
+ (void)_releaseSharedServiceManager;
- (AXAccessQueue)entitlementsCheckersAccessQueue;
- (AXAccessQueue)resumingConnectionsQueue;
- (AXAccessQueue)servicesAccessQueue;
- (AXUIDisplayManager)displayManager;
- (AXUIMessageSender)messageSender;
- (AXUIServiceManager)init;
- (AXUIServiceManagerDelegate)delegate;
- (BOOL)_extractAndHandleRegistration:(id)a3 clientIdentifier:(id)a4 messageIdentifier:(unint64_t)a5 context:(id)a6 error:(id *)a7;
- (BOOL)_registerClientWithIdentifier:(id)a3 connection:(id)a4 serviceBundleName:(id)a5 initiatingMessageIdentifier:(unint64_t)a6 error:(id *)a7;
- (BOOL)_serviceWithClass:(Class)a3 canProcessMessageWithIdentifier:(unint64_t)a4 fromClientWithConnection:(id)a5 possibleRequiredEntitlements:(id *)a6 needsToRequireEntitlements:(BOOL *)a7;
- (BOOL)_start;
- (BOOL)shouldAllowServicesToProcessMessages;
- (NSMutableArray)pausedConnections;
- (NSMutableArray)serviceContexts;
- (NSMutableDictionary)entitlementsCheckers;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)transactionsQueue;
- (id)_clientMessengerWithIdentifier:(id)a3;
- (id)_extractClientIdentifier:(id)a3;
- (id)_sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 toClientWithMessenger:(id)a5 error:(id *)a6;
- (id)_serviceContextForClientWithIdentifier:(id)a3;
- (id)_serviceContextForService:(id)a3;
- (id)_serviceFromBundlePath:(id)a3 clientIdentifier:(id)a4 connection:(id)a5 initiatingMessageIdentifier:(unint64_t)a6 stopSearching:(BOOL *)a7 error:(id *)a8;
- (id)_services;
- (id)_servicesForUniqueIdentifiers:(id)a3;
- (id)_uniqueIdentifierForService:(id)a3;
- (id)clientsForService:(id)a3;
- (unint64_t)_servicesCount;
- (unint64_t)lastUsedServiceIdentifier;
- (void)_applicationDidFinishLaunching;
- (void)_applicationDidReceiveMemoryWarning:(id)a3;
- (void)_handleConnection:(id)a3;
- (void)_processXPCObject:(id)a3 context:(id)a4;
- (void)_registerForSystemAppDeath;
- (void)_sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 toClientWithMessenger:(id)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8;
- (void)_startLaunchAngel;
- (void)_unregisterAllClientsWithConnection:(id)a3;
- (void)_unregisterClientsIdentifiersLists:(id)a3 serviceContexts:(id)a4;
- (void)beginTransactionWithIdentifier:(id)a3 forService:(id)a4;
- (void)dealloc;
- (void)endTransactionWithIdentifier:(id)a3 forService:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)messageSender:(id)a3 accessLaunchAngelConnectionForMessageWithContext:(void *)a4 usingBlock:(id)a5;
- (void)messageSender:(id)a3 willSendXPCMessage:(id)a4 context:(void *)a5;
- (void)sendBoardServiceMessage:(id)a3 callback:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisplayManager:(id)a3;
- (void)setEntitlementsCheckers:(id)a3;
- (void)setEntitlementsCheckersAccessQueue:(id)a3;
- (void)setLastUsedServiceIdentifier:(unint64_t)a3;
- (void)setMessageSender:(id)a3;
- (void)setPausedConnections:(id)a3;
- (void)setResumingConnectionsQueue:(id)a3;
- (void)setServiceContexts:(id)a3;
- (void)setServicesAccessQueue:(id)a3;
- (void)setShouldAllowServicesToProcessMessages:(BOOL)a3;
- (void)setTransactions:(id)a3;
- (void)setTransactionsQueue:(id)a3;
@end

@implementation AXUIServiceManager

+ (id)sharedServiceManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AXUIServiceManager_sharedServiceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServiceManager__AXUIServiceManagerSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedServiceManager__AXUIServiceManagerSharedInstanceOnceToken, block);
  }
  v2 = (void *)_AXUIServiceManagerSharedInstance;

  return v2;
}

uint64_t __42__AXUIServiceManager_sharedServiceManager__block_invoke()
{
  _AXUIServiceManagerSharedInstance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (void)_releaseSharedServiceManager
{
  v2 = (void *)_AXUIServiceManagerSharedInstance;
  _AXUIServiceManagerSharedInstance = 0;
}

- (AXUIServiceManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)AXUIServiceManager;
  v2 = [(AXUIServiceManager *)&v20 init];
  v3 = (void *)MEMORY[0x223C895D0]();
  if (v2)
  {
    uint64_t v4 = objc_opt_class();
    v5 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:v4 description:@"ServicesAccessQueue" appendUUIDToLabel:0];
    v6 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:v4 description:@"EntitlementsCheckersAccessQueue" appendUUIDToLabel:0];
    v7 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:v4 description:@"ResumingConnectionsQueue" appendUUIDToLabel:0];
    uint64_t v8 = objc_opt_new();
    v9 = (void *)v8;
    if (v5) {
      BOOL v10 = v6 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    BOOL v12 = v10 || v7 == 0 || v8 == 0;
    if (v12
      || (v13 = [[AXUIDisplayManager alloc] initWithServiceManager:v2]) == 0)
    {
      v14 = v2;
      v2 = 0;
    }
    else
    {
      v14 = v13;
      [v9 setDelegate:v2];
      [(AXUIServiceManager *)v2 setServicesAccessQueue:v5];
      [(AXUIServiceManager *)v2 setEntitlementsCheckersAccessQueue:v6];
      [(AXUIServiceManager *)v2 setResumingConnectionsQueue:v7];
      [(AXUIServiceManager *)v2 setMessageSender:v9];
      [(AXUIServiceManager *)v2 setDisplayManager:v14];
      v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 addObserver:v2 selector:sel__applicationDidReceiveMemoryWarning_ name:*MEMORY[0x263F1D060] object:0];

      v16 = [MEMORY[0x263EFF9A0] dictionary];
      [(AXUIServiceManager *)v2 setTransactions:v16];

      v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      dispatch_queue_t v18 = dispatch_queue_create("AXUIServiceManager-transactions", v17);
      [(AXUIServiceManager *)v2 setTransactionsQueue:v18];
    }
  }
  return v2;
}

- (void)dealloc
{
  connectionListener = self->_connectionListener;
  if (connectionListener)
  {
    [(BSServiceConnectionListener *)connectionListener invalidate];
    uint64_t v4 = self->_connectionListener;
    self->_connectionListener = 0;
  }
  v5 = [MEMORY[0x263F22840] server];
  [v5 registerAccessibilityUIServicePID:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  v7 = [(AXUIServiceManager *)self displayManager];
  [v7 _resetServiceManager];

  v8.receiver = self;
  v8.super_class = (Class)AXUIServiceManager;
  [(AXUIServiceManager *)&v8 dealloc];
}

- (void)beginTransactionWithIdentifier:(id)a3 forService:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [MEMORY[0x263F213E0] sharedInstance];
  char v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x263F213E0] identifier];
    v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v14;
        _os_log_impl(&dword_221750000, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v15 = v6;
  [v15 UTF8String];
  v16 = (void *)os_transaction_create();
  v17 = [(AXUIServiceManager *)self transactionsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AXUIServiceManager_beginTransactionWithIdentifier_forService___block_invoke;
  block[3] = &unk_2645C5B98;
  block[4] = self;
  id v21 = v15;
  id v22 = v16;
  id v18 = v16;
  id v19 = v15;
  dispatch_async(v17, block);
}

void __64__AXUIServiceManager_beginTransactionWithIdentifier_forService___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) transactions];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)endTransactionWithIdentifier:(id)a3 forService:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [MEMORY[0x263F213E0] sharedInstance];
  char v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x263F213E0] identifier];
    v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = AXColorizeFormatLog();
      id v17 = v6;
      id v18 = v7;
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v14;
        _os_log_impl(&dword_221750000, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v15 = [(AXUIServiceManager *)self transactionsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__AXUIServiceManager_endTransactionWithIdentifier_forService___block_invoke;
  block[3] = &unk_2645C5AB0;
  block[4] = self;
  id v20 = v6;
  id v16 = v6;
  dispatch_async(v15, block);
}

void __62__AXUIServiceManager_endTransactionWithIdentifier_forService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactions];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)clientsForService:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(AXUIServiceManager *)self servicesAccessQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__AXUIServiceManager_clientsForService___block_invoke;
  v12[3] = &unk_2645C5B98;
  v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 performSynchronousReadingBlock:v12];

  char v9 = v14;
  id v10 = v7;

  return v10;
}

void __40__AXUIServiceManager_clientsForService___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) serviceContexts];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "service", (void)v12);
        char v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          id v10 = *(void **)(a1 + 48);
          v11 = [v7 clientMessengerList];
          [v10 axSafelyAddObjectsFromArray:v11];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_clientMessengerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(AXUIServiceManager *)self servicesAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__AXUIServiceManager__clientMessengerWithIdentifier___block_invoke;
  v9[3] = &unk_2645C5E38;
  v9[4] = self;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performSynchronousReadingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __53__AXUIServiceManager__clientMessengerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) serviceContexts];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "clientMessengerWithIdentifier:", *(void *)(a1 + 40), (void)v10);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 toClientWithMessenger:(id)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = v16;
  id v19 = v18;
  if (!v18)
  {
    if (v17)
    {
      id v20 = AXLogUI();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a4;
        _os_log_impl(&dword_221750000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ sending asynchronous message with identifier %lu and a completion handler but no target access queue; defaulting to the main access queue.",
          buf,
          0x16u);
      }
    }
    id v19 = [MEMORY[0x263F21380] mainAccessQueue];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v21 = v15;
  id v31 = v21;
  id v22 = [(AXUIServiceManager *)self messageSender];
  uint64_t v23 = *(void *)(*(void *)&buf[8] + 40);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __144__AXUIServiceManager__sendAsynchronousMessage_withIdentifier_toClientWithMessenger_targetAccessQueue_completionRequiresWritingBlock_completion___block_invoke;
  v25[3] = &unk_2645C5E60;
  id v24 = v17;
  id v26 = v24;
  v27 = buf;
  [v22 sendAsynchronousMessage:v14 withIdentifier:a4 context:v23 targetAccessQueue:v19 completionRequiresWritingBlock:v9 completion:v25];

  _Block_object_dispose(buf, 8);
}

void __144__AXUIServiceManager__sendAsynchronousMessage_withIdentifier_toClientWithMessenger_targetAccessQueue_completionRequiresWritingBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)_sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 toClientWithMessenger:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  long long v12 = [(AXUIServiceManager *)self messageSender];
  long long v13 = [v12 sendSynchronousMessage:v11 withIdentifier:a4 context:v10 error:a6];

  return v13;
}

- (void)messageSender:(id)a3 accessLaunchAngelConnectionForMessageWithContext:(void *)a4 usingBlock:(id)a5
{
  uint64_t v6 = (void (**)(id, id))a5;
  uint64_t v7 = [a4 connection];
  uint64_t v8 = [v7 serviceConnection];
  id v9 = [v8 remoteTarget];

  v6[2](v6, v9);
}

- (void)messageSender:(id)a3 willSendXPCMessage:(id)a4 context:(void *)a5
{
  uint64_t v6 = (const char *)*MEMORY[0x263F22210];
  id v7 = a4;
  id v8 = [a5 clientIdentifier];
  xpc_dictionary_set_string(v7, v6, (const char *)[v8 UTF8String]);
}

- (BOOL)_start
{
  uint64_t v3 = (void *)MEMORY[0x223C895D0](self, a2);
  UIAccessibilityInstallSafeCategory();
  AXUISetMainBundleFakesSystemExtension(1);
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_1);
  uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v5 = [v4 localeIdentifier];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263EFF458];
  id v8 = [MEMORY[0x263F08A48] mainQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __28__AXUIServiceManager__start__block_invoke_2;
  v14[3] = &unk_2645C5E88;
  id v9 = v5;
  id v15 = v9;
  id v10 = (id)[v6 addObserverForName:v7 object:0 queue:v8 usingBlock:v14];

  if (AXInPreboardScenario())
  {
    id v11 = AXLogUI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl(&dword_221750000, v11, OS_LOG_TYPE_DEFAULT, "AXUI Server started at PreBoard. This is unexpected, but we'll restart once we're done.", v13, 2u);
    }

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_preboardScenarioChanged, (CFStringRef)*MEMORY[0x263F22660], 0, CFNotificationSuspensionBehaviorCoalesce);
  }

  xpc_main((xpc_connection_handler_t)_AXUIServiceManagerHandleConnection);
}

uint64_t __28__AXUIServiceManager__start__block_invoke()
{
  return UIAccessibilityInstallSafeCategory();
}

void __28__AXUIServiceManager__start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v11 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v5 = [v4 localeIdentifier];
  LOBYTE(v3) = [v3 isEqualToString:v5];

  if ((v3 & 1) == 0)
  {
    uint64_t v6 = a1;
    uint64_t v7 = AXLogUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v6 + 32);
      id v9 = [MEMORY[0x263EFF960] currentLocale];
      id v10 = [v9 localeIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, "Current locale did change. Restarting AXUI Server %@ %@", buf, 0x16u);
    }
    exit(0);
  }
}

- (void)_startLaunchAngel
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__AXUIServiceManager__startLaunchAngel__block_invoke;
  v5[3] = &unk_2645C5EB0;
  v5[4] = self;
  uint64_t v3 = [MEMORY[0x263F2B9E0] listenerWithConfigurator:v5];
  [v3 activate];
  connectionListener = self->_connectionListener;
  self->_connectionListener = (BSServiceConnectionListener *)v3;
}

void __39__AXUIServiceManager__startLaunchAngel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.accessibility"];
  [v3 setService:@"com.apple.AccessibilityUIServer"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v7 = AXUIServiceManagerLaunchAngelInterface();
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke;
  long long v12 = &unk_2645C5F00;
  id v13 = v7;
  __int16 v14 = self;
  id v8 = v7;
  [v6 configureConnection:&v9];
  objc_msgSend(v6, "activate", v9, v10, v11, v12);
}

void __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetQueue:MEMORY[0x263EF83A0]];
  uint64_t v4 = [MEMORY[0x263F2B9F0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke_2;
  v5[3] = &unk_2645C5ED8;
  v5[4] = *(void *)(a1 + 40);
  [v3 setInvalidationHandler:v5];
}

void __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 remoteProcess];
  [v4 setProcessHandle:v5];

  [v4 setServiceConnection:v3];
  id v6 = AXLogIPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_221750000, v6, OS_LOG_TYPE_DEFAULT, "Invalidation handler from connection: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) _unregisterAllClientsWithConnection:v4];
}

- (void)sendBoardServiceMessage:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setXpc_handler:", v6);

  id v8 = [MEMORY[0x263F2B9B8] currentContext];
  uint64_t v9 = [v8 remoteProcess];
  [v11 setProcessHandle:v9];

  uint64_t v10 = [MEMORY[0x263F2B9B8] currentContext];
  [v11 setServiceConnection:v10];

  [(AXUIServiceManager *)self _processXPCObject:v7 context:v11];
}

- (void)_handleConnection:(id)a3
{
  uint64_t v4 = (_xpc_connection_s *)a3;
  id v5 = [NSString alloc];
  uint64_t v6 = *MEMORY[0x263F22238];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  uint64_t v10 = [v9 UUIDString];
  id v11 = (void *)[v5 initWithFormat:@"%@.%@.%@-%p", v6, v8, v10, v4];

  id v12 = v11;
  id v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
  xpc_connection_set_target_queue(v4, v13);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __40__AXUIServiceManager__handleConnection___block_invoke;
  handler[3] = &unk_2645C5F28;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  xpc_connection_set_event_handler(v4, handler);
  __int16 v14 = [(AXUIServiceManager *)self resumingConnectionsQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__AXUIServiceManager__handleConnection___block_invoke_2;
  v16[3] = &unk_2645C5AB0;
  v16[4] = self;
  id v15 = v4;
  id v17 = v15;
  [v14 performAsynchronousWritingBlock:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __40__AXUIServiceManager__handleConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = (id)objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 setConnection:WeakRetained];

  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 _processXPCObject:v3 context:v6];
}

void __40__AXUIServiceManager__handleConnection___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldAllowServicesToProcessMessages])
  {
    uint64_t v2 = *(_xpc_connection_s **)(a1 + 40);
    xpc_connection_resume(v2);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) pausedConnections];
    if (!v3)
    {
      id v4 = (id)objc_opt_new();
      [*(id *)(a1 + 32) setPausedConnections:v4];
      id v3 = v4;
    }
    id v5 = v3;
    objc_msgSend(v3, "ax_enqueueObject:", *(void *)(a1 + 40));
  }
}

- (void)_processXPCObject:(id)a3 context:(id)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x223C899E0](v6);
  if (v8 == MEMORY[0x263EF8708])
  {
    id v10 = v6;
    uint64_t uint64 = xpc_dictionary_get_uint64(v10, (const char *)*MEMORY[0x263F22220]);
    if (!uint64)
    {
      id v13 = AXLogUI();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AXUIServiceManager _processXPCObject:context:](v13);
      }
      goto LABEL_81;
    }
    uint64_t v12 = uint64;
    id v13 = [(AXUIServiceManager *)self _extractClientIdentifier:v10];
    *(void *)v77 = 0;
    v78 = v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__0;
    v81 = __Block_byref_object_dispose__0;
    id v82 = 0;
    id v76 = 0;
    BOOL v14 = [(AXUIServiceManager *)self _extractAndHandleRegistration:v10 clientIdentifier:v13 messageIdentifier:v12 context:v7 error:&v76];
    objc_storeStrong(&v82, v76);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke;
    v72[3] = &unk_2645C5F70;
    id v15 = v7;
    id v73 = v15;
    id v16 = v10;
    id v74 = v16;
    BOOL v75 = v14;
    id v17 = (void (**)(void, void, void, void))MEMORY[0x223C897B0](v72);
    if (*((void *)v78 + 5))
    {
LABEL_78:
      uint64_t v45 = *((void *)v78 + 5);
      if (v45) {
        v17[2](v17, 0, v45, 0);
      }

      _Block_object_dispose(v77, 8);
LABEL_81:

      goto LABEL_82;
    }
    if (!v13)
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221D0], @"Couldn't find client identifier associated to message.");
      id v19 = (void *)*((void *)v78 + 5);
      *((void *)v78 + 5) = v28;
LABEL_77:

      goto LABEL_78;
    }
    id v18 = [(AXUIServiceManager *)self _serviceContextForClientWithIdentifier:v13];
    id v19 = v18;
    if (v12 == *MEMORY[0x263F221F8] && v18)
    {
      id v20 = AXLogAssertions();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v13;
        _os_log_impl(&dword_221750000, v20, OS_LOG_TYPE_DEFAULT, "AXUIServer received Clean up from client: %@", buf, 0xCu);
      }

      v84 = v13;
      v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
      v85 = v50;
      id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
      v83 = v19;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
      [(AXUIServiceManager *)self _unregisterClientsIdentifiersLists:v21 serviceContexts:v22];

      goto LABEL_77;
    }
    buf[0] = 0;
    v49 = [v18 service];
    if (v49)
    {
      uint64_t v29 = objc_opt_class();
      id v71 = 0;
      BOOL v30 = [(AXUIServiceManager *)self _serviceWithClass:v29 canProcessMessageWithIdentifier:v12 fromClientWithConnection:v15 possibleRequiredEntitlements:&v71 needsToRequireEntitlements:buf];
      id v51 = v71;
      if (v30)
      {
        uint64_t v48 = xpc_dictionary_get_value(v16, (const char *)*MEMORY[0x263F22218]);
        if (v48 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v31 = v78;
          id obj = (id)*((void *)v78 + 5);
          uint64_t v32 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v48 error:&obj];
          objc_storeStrong((id *)v31 + 5, obj);
          if ([v32 count]) {
            [v49 processInitializationMessage:v32];
          }
        }
        v33 = v78;
        if (*((void *)v78 + 5)
          || (BOOL v34 = xpc_dictionary_get_BOOL(v16, (const char *)*MEMORY[0x263F22228]), v33 = v78, v34))
        {
          v35 = 0;
        }
        else
        {
          id v69 = (id)*((void *)v78 + 5);
          v35 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v16 error:&v69];
          objc_storeStrong((id *)v33 + 5, v69);
          v33 = v78;
        }
        if (*((void *)v33 + 5)) {
          goto LABEL_75;
        }
        v46 = v35;
        v36 = v49;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
        {
          if ([v49 messageWithIdentifierShouldBeProcessedAsynchronously:v12])
          {
            if (objc_opt_respondsToSelector())
            {
              v37 = (id *)v66;
              v66[0] = MEMORY[0x263EF8330];
              v66[1] = 3221225472;
              v66[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_360;
              v66[3] = &unk_2645C5FC0;
              v66[4] = v49;
              v66[5] = v46;
              uint64_t v68 = v12;
              v66[6] = v13;
              v66[7] = v19;
              v67 = v17;
              v47 = (void *)MEMORY[0x223C897B0](v66);
            }
            else
            {
              v37 = (id *)v65;
              v65[0] = MEMORY[0x263EF8330];
              v65[1] = 3221225472;
              v65[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_3_362;
              v65[3] = &unk_2645C5FE8;
              v65[4] = v49;
              v65[5] = v46;
              v65[8] = v12;
              v65[6] = v13;
              v65[7] = v17;
              v47 = (void *)MEMORY[0x223C897B0](v65);
            }

            v36 = v49;
            if (v47)
            {
LABEL_67:
              if ((objc_opt_respondsToSelector() & 1) == 0
                || ([v36 accessQueueForProcessingMessageWithIdentifier:v12],
                    (v44 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                v44 = [MEMORY[0x263F21380] mainAccessQueue];
              }
              if ((objc_opt_respondsToSelector() & 1) != 0
                && ![v36 messageWithIdentifierRequiresWritingBlock:v12])
              {
                [v44 performAsynchronousReadingBlock:v47];
              }
              else
              {
                [v44 performAsynchronousWritingBlock:v47];
              }

              v35 = v46;
LABEL_75:

              v39 = (void *)v48;
              goto LABEL_76;
            }
          }
        }
        if (objc_opt_respondsToSelector())
        {
          v40 = v36;
          v41 = v58;
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_5;
          v58[3] = &unk_2645C6010;
          v58[4] = v40;
          id v59 = v46;
          uint64_t v64 = v12;
          v60 = v13;
          id v61 = v19;
          v63 = v77;
          v62 = v17;
          v47 = (void *)MEMORY[0x223C897B0](v58);
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v43 = AXLogUI();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
              -[AXUIServiceManager _processXPCObject:context:](v43);
            }
            v47 = 0;
            goto LABEL_66;
          }
          v42 = v36;
          v41 = v52;
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_6;
          v52[3] = &unk_2645C6038;
          v52[4] = v42;
          id v53 = v46;
          uint64_t v57 = v12;
          v54 = v13;
          v56 = v77;
          v55 = v17;
          v47 = (void *)MEMORY[0x223C897B0](v52);
        }
        v43 = v41[4];
LABEL_66:

        v36 = v49;
        goto LABEL_67;
      }
      if (buf[0]) {
        objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221D8], @"The service must require entitlements for this operation: %d", v12);
      }
      else {
      uint64_t v38 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221C0], @"One of the following entitlements is required: %@ for this operation: %d. See guidance in rdar://126183364.", v51, v12);
      }
    }
    else
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221D0], @"Couldn't find service associated to client identifier: %@", v13);
      id v51 = 0;
    }
    v39 = (void *)*((void *)v78 + 5);
    *((void *)v78 + 5) = v38;
LABEL_76:

    goto LABEL_77;
  }
  if (v8 == MEMORY[0x263EF8720])
  {
    if (v6 == (id)MEMORY[0x263EF86A8])
    {
      v27 = AXLogUI();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[AXUIServiceManager _processXPCObject:context:](v27);
      }

      [(AXUIServiceManager *)self _unregisterAllClientsWithConnection:v7];
    }
    else
    {
      BOOL v23 = v6 == (id)MEMORY[0x263EF86C0];
      id v24 = AXLogUI();
      uint64_t v25 = v24;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v77 = 0;
          _os_log_impl(&dword_221750000, v25, OS_LOG_TYPE_DEFAULT, "Connection with client was supposed to be terminated imminently, but we are ignoring it for now.", v77, 2u);
        }
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[AXUIServiceManager _processXPCObject:context:].cold.4(v6, v25);
        }
      }
    }
  }
  else
  {
    if (v6) {
      uint64_t v9 = (void *)MEMORY[0x223C89960](v6);
    }
    else {
      uint64_t v9 = 0;
    }
    id v26 = AXLogUI();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[AXUIServiceManager _processXPCObject:context:].cold.5((uint64_t)v9, v26);
    }

    if (v9) {
      free(v9);
    }
  }
LABEL_82:
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) connection];

  if (v10)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_2;
    v20[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
    char v21 = *(unsigned char *)(a1 + 48);
    [MEMORY[0x263F221E8] sendReply:v7 withError:v8 andOriginalXPCMessage:v11 usingConnection:v12 customDataAddingBlock:v20];
  }
  else
  {
    if (v7)
    {
      id v13 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    }
    else
    {
      BOOL v14 = [NSDictionary dictionary];
      id v13 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    }
    if (*(unsigned char *)(a1 + 48)) {
      xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x263F22200], 1);
    }
    id v15 = objc_msgSend(*(id *)(a1 + 32), "xpc_handler");

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "xpc_handler");
      id v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, id))v16)[2](v16, v13, v8);
    }
  }
  if (*(unsigned char *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v17 = [MEMORY[0x263F21380] backgroundAccessQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_3;
    v18[3] = &unk_2645C5968;
    id v19 = v9;
    [v17 performAsynchronousWritingBlock:v18];
  }
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  if (*(unsigned char *)(a1 + 32)) {
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x263F22200], 1);
  }
}

uint64_t __48__AXUIServiceManager__processXPCObject_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) serviceWasFullyInitialized];
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_360(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 56) pidForClientWithIdentifier:v5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_2_361;
  v7[3] = &unk_2645C5F98;
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  [v2 processMessageAsynchronously:v3 withIdentifier:v4 fromClientWithIdentifier:v5 pid:v6 completion:v7];
}

uint64_t __48__AXUIServiceManager__processXPCObject_context___block_invoke_2_361(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_3_362(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_4;
  v6[3] = &unk_2645C5F98;
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  [v2 processMessageAsynchronously:v3 withIdentifier:v5 fromClientWithIdentifier:v4 completion:v6];
}

uint64_t __48__AXUIServiceManager__processXPCObject_context___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 56) pidForClientWithIdentifier:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v2 processMessage:v3 withIdentifier:v4 fromClientWithIdentifier:v5 pid:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_6(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 processMessage:v3 withIdentifier:v5 fromClientWithIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  (*(void (**)(void))(a1[7] + 16))();
  uint64_t v8 = *(void *)(a1[8] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (id)_extractClientIdentifier:(id)a3
{
  string = (char *)xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x263F22210]);
  if (string) {
    string = (char *)[[NSString alloc] initWithUTF8String:string];
  }

  return string;
}

- (BOOL)_extractAndHandleRegistration:(id)a3 clientIdentifier:(id)a4 messageIdentifier:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a6;
  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x263F22230]);
  BOOL v15 = 0;
  if (v12 && string)
  {
    id v16 = (void *)[[NSString alloc] initWithUTF8String:string];
    id v17 = [(AXUIServiceManager *)self _serviceContextForClientWithIdentifier:v12];
    if (v17
      || [(AXUIServiceManager *)self _registerClientWithIdentifier:v12 connection:v13 serviceBundleName:v16 initiatingMessageIdentifier:a5 error:a7])
    {
      BOOL v15 = 1;
    }
    else
    {
      id v19 = AXLogUI();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = *a7;
        int v21 = 138412802;
        id v22 = v12;
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v20;
        _os_log_error_impl(&dword_221750000, v19, OS_LOG_TYPE_ERROR, "Could not register client. ID=%@ serviceBundleName=%@ error=%@", (uint8_t *)&v21, 0x20u);
      }

      BOOL v15 = 0;
    }
  }
  return v15;
}

- (BOOL)_serviceWithClass:(Class)a3 canProcessMessageWithIdentifier:(unint64_t)a4 fromClientWithConnection:(id)a5 possibleRequiredEntitlements:(id *)a6 needsToRequireEntitlements:(BOOL *)a7
{
  id v12 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v13 = NSStringFromClass(a3);
  BOOL v14 = [(AXUIServiceManager *)self entitlementsCheckersAccessQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __153__AXUIServiceManager__serviceWithClass_canProcessMessageWithIdentifier_fromClientWithConnection_possibleRequiredEntitlements_needsToRequireEntitlements___block_invoke;
  v18[3] = &unk_2645C6060;
  void v18[4] = self;
  id v15 = v13;
  id v19 = v15;
  int v21 = &v26;
  Class v22 = a3;
  unint64_t v23 = a4;
  id v16 = v12;
  id v20 = v16;
  id v24 = a6;
  __int16 v25 = a7;
  [v14 performSynchronousWritingBlock:v18];

  LOBYTE(a7) = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return (char)a7;
}

void __153__AXUIServiceManager__serviceWithClass_canProcessMessageWithIdentifier_fromClientWithConnection_possibleRequiredEntitlements_needsToRequireEntitlements___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entitlementsCheckers];
  if (!v2)
  {
    id v4 = (id)objc_opt_new();
    [*(id *)(a1 + 32) setEntitlementsCheckers:v4];
    uint64_t v2 = v4;
  }
  id v5 = v2;
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  if (!v3)
  {
    uint64_t v3 = [[AXUIServiceEntitlementChecker alloc] initWithServiceClass:*(void *)(a1 + 64)];
    [v5 setObject:v3 forKey:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(AXUIServiceEntitlementChecker *)v3 serviceCanProcessMessageWithIdentifier:*(void *)(a1 + 72) fromClientWithConnection:*(void *)(a1 + 48) possibleRequiredEntitlements:*(void *)(a1 + 80) needsToRequireEntitlements:*(void *)(a1 + 88)];
}

- (void)_registerForSystemAppDeath
{
  if (!_AXSMossdeepEnabled())
  {
    uint64_t v3 = [MEMORY[0x263F22998] server];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke;
    v4[3] = &unk_2645C6088;
    v4[4] = self;
    [v3 pid:v4];
  }
}

void __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x80000000) != 0)
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke_2;
    block[3] = &unk_2645C5968;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F3F3F0]);
    *(void *)(*(void *)(a1 + 32) + 8) = [v4 initWithPID:a2 queue:MEMORY[0x263EF83A0] deathHandler:&__block_literal_global_379];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForSystemAppDeath];
}

void __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke_3()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  [v0 terminateWithSuccess];
}

- (void)_applicationDidFinishLaunching
{
  uint64_t v3 = [(AXUIServiceManager *)self resumingConnectionsQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__AXUIServiceManager__applicationDidFinishLaunching__block_invoke;
  v5[3] = &unk_2645C5968;
  v5[4] = self;
  [v3 performAsynchronousWritingBlock:v5];

  id v4 = [MEMORY[0x263F22840] server];
  [v4 registerAccessibilityUIServicePID:getpid()];

  [(AXUIServiceManager *)self _registerForSystemAppDeath];
}

void __52__AXUIServiceManager__applicationDidFinishLaunching__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setShouldAllowServicesToProcessMessages:1];
  uint64_t v2 = [*(id *)(a1 + 32) pausedConnections];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        xpc_connection_resume(*(xpc_connection_t *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 32) setPausedConnections:0];
}

- (void)_applicationDidReceiveMemoryWarning:(id)a3
{
  uint64_t v4 = [(AXUIServiceManager *)self entitlementsCheckersAccessQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__AXUIServiceManager__applicationDidReceiveMemoryWarning___block_invoke;
  v5[3] = &unk_2645C5968;
  v5[4] = self;
  [v4 performAsynchronousWritingBlock:v5];
}

uint64_t __58__AXUIServiceManager__applicationDidReceiveMemoryWarning___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEntitlementsCheckers:0];
}

- (BOOL)_registerClientWithIdentifier:(id)a3 connection:(id)a4 serviceBundleName:(id)a5 initiatingMessageIdentifier:(unint64_t)a6 error:(id *)a7
{
  v66[3] = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v49 = a4;
  id v10 = a5;
  uint64_t v11 = AXSystemRootDirectory();
  uint64_t v12 = [v11 stringByAppendingPathComponent:@"System/Library/AccessibilityBundles"];
  id v13 = [v12 stringByStandardizingPath];

  BOOL v14 = AXSystemRootDirectory();
  id v15 = [v14 stringByAppendingPathComponent:@"Developer/Library/PrivateFrameworks/AccessibilityAudit.framework"];
  uint64_t v16 = [v15 stringByStandardizingPath];

  id v17 = AXSystemRootDirectory();
  id v18 = [v17 stringByAppendingPathComponent:@"AppleInternal/Library/AccessibilityUIServices"];
  uint64_t v19 = [v18 stringByStandardizingPath];

  v66[0] = v13;
  v66[1] = v16;
  v43 = (void *)v16;
  v44 = (void *)v19;
  v66[2] = v19;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:3];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v65 count:16];
  id obj = v20;
  if (!v21)
  {

    BOOL v32 = 0;
    id v23 = 0;
    id v33 = 0;
LABEL_19:
    BOOL v34 = v43;
    if (!a7) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v22 = v21;
  v42 = v13;
  v47 = a7;
  id v23 = 0;
  uint64_t v24 = *(void *)v58;
  uint64_t v45 = *MEMORY[0x263F221C8];
LABEL_3:
  uint64_t v25 = 0;
  while (1)
  {
    if (*(void *)v58 != v24) {
      objc_enumerationMutation(v20);
    }
    uint64_t v26 = *(void **)(*((void *)&v57 + 1) + 8 * v25);
    uint64_t v27 = [v10 stringByAppendingPathExtension:@"axuiservice"];
    uint64_t v28 = [v26 stringByAppendingPathComponent:v27];
    char v29 = [v28 stringByStandardizingPath];

    if (([v29 hasPrefix:v26] & 1) == 0)
    {
      if (v47)
      {
        uint64_t v31 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", v45, @"Invalid service bundle path: %@", v29);

        id v23 = (id)v31;
      }

      goto LABEL_13;
    }

    buf[0] = 0;
    id v56 = 0;
    BOOL v30 = [(AXUIServiceManager *)self _serviceFromBundlePath:v29 clientIdentifier:v50 connection:v49 initiatingMessageIdentifier:a6 stopSearching:buf error:&v56];
    id v23 = v56;
    if (buf[0]) {
      break;
    }

    if (v30)
    {

      goto LABEL_22;
    }
LABEL_13:
    if (v22 == ++v25)
    {
      uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v22) {
        goto LABEL_3;
      }

      goto LABEL_18;
    }
  }

  if (!v30)
  {
LABEL_18:
    BOOL v32 = 0;
    id v33 = 0;
    a7 = v47;
    id v13 = v42;
    goto LABEL_19;
  }
LABEL_22:
  v36 = [(AXUIServiceManager *)self servicesAccessQueue];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __115__AXUIServiceManager__registerClientWithIdentifier_connection_serviceBundleName_initiatingMessageIdentifier_error___block_invoke;
  v52[3] = &unk_2645C60B0;
  v52[4] = self;
  id v33 = v30;
  id v53 = v33;
  id v37 = v50;
  id v54 = v37;
  id v55 = v49;
  [v36 performSynchronousWritingBlock:v52];

  uint64_t v38 = AXLogAssertions();
  a7 = v47;
  id v13 = v42;
  BOOL v34 = v43;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v62 = v33;
    __int16 v63 = 2112;
    id v64 = v37;
    _os_log_impl(&dword_221750000, v38, OS_LOG_TYPE_DEFAULT, "Registered service/client: %@ %@", buf, 0x16u);
  }

  v39 = [(AXUIServiceManager *)self displayManager];
  [v39 serviceDidConnect:v33 clientWithIdentifier:v37];

  v40 = +[AXUIAssertionManager sharedInstance];
  [v40 acquireAssertionIfNeeded];

  v41 = +[AXUIAssertionManager sharedInstance];
  [v41 acquireAssertionUIIfNeededForService:v33 clientIdentifier:v37];

  BOOL v32 = 1;
  if (v47) {
LABEL_20:
  }
    *a7 = v23;
LABEL_21:

  return v32;
}

void __115__AXUIServiceManager__registerClientWithIdentifier_connection_serviceBundleName_initiatingMessageIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C895D0]();
  uint64_t v6 = [*(id *)(a1 + 32) _serviceContextForService:*(void *)(a1 + 40)];
  if (!v6)
  {
    uint64_t v3 = [*(id *)(a1 + 32) serviceContexts];
    if (!v3)
    {
      uint64_t v3 = objc_opt_new();
      [*(id *)(a1 + 32) setServiceContexts:v3];
    }
    uint64_t v4 = [*(id *)(a1 + 32) lastUsedServiceIdentifier] + 1;
    [*(id *)(a1 + 32) setLastUsedServiceIdentifier:v4];
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:v4];
    uint64_t v6 = [[AXUIServiceContext alloc] initWithService:*(void *)(a1 + 40) serviceIdentifier:v5];
    objc_msgSend(v3, "addObject:");
  }
  [(AXUIServiceContext *)v6 addClientWithIdentifier:*(void *)(a1 + 48) connection:*(void *)(a1 + 56)];
}

- (id)_serviceFromBundlePath:(id)a3 clientIdentifier:(id)a4 connection:(id)a5 initiatingMessageIdentifier:(unint64_t)a6 stopSearching:(BOOL *)a7 error:(id *)a8
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = [MEMORY[0x263F086E0] bundleWithPath:v14];
  id v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221C8], @"Failed to create service bundle at path: %@", v14);
    uint64_t v28 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (([v17 isLoaded] & 1) == 0 && (objc_msgSend(v18, "loadAndReturnError:", a8) & 1) == 0 && !*a8)
  {
    objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221C8], @"Failed to load service bundle at path: %@", v14);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([v18 isLoaded])
  {
    v46 = a7;
    uint64_t v19 = (void *)[v18 principalClass];
    id v20 = AXLogUI();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v18 bundlePath];
      *(_DWORD *)buf = 138412546;
      id v50 = v21;
      __int16 v51 = 2112;
      v52 = v19;
      _os_log_impl(&dword_221750000, v20, OS_LOG_TYPE_DEFAULT, "AXUIServer will attempt to load principal class from bundle: %@: '%@'", buf, 0x16u);
    }
    char v48 = 0;
    if (v19)
    {
      id v47 = 0;
      BOOL v22 = [(AXUIServiceManager *)self _serviceWithClass:v19 canProcessMessageWithIdentifier:a6 fromClientWithConnection:v16 possibleRequiredEntitlements:&v47 needsToRequireEntitlements:&v48];
      id v23 = v47;
      if (v22)
      {
        char v24 = objc_opt_respondsToSelector();
        uint64_t v25 = AXLogUI();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v26)
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v19;
            _os_log_impl(&dword_221750000, v25, OS_LOG_TYPE_DEFAULT, "Principal class does respond to sharedInstance. Calling sharedInstance on '%@'", buf, 0xCu);
          }

          uint64_t v27 = [v19 sharedInstance];
        }
        else
        {
          if (v26)
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v19;
            _os_log_impl(&dword_221750000, v25, OS_LOG_TYPE_DEFAULT, "Principal class does not respond to sharedInstance. Calling new on '%@'", buf, 0xCu);
          }

          uint64_t v27 = objc_opt_new();
        }
        uint64_t v28 = v27;
        if (v27)
        {
          a7 = v46;
          if ([v27 conformsToProtocol:&unk_26D3E39C0]) {
            goto LABEL_35;
          }
          objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221C8], @"Service instance does not conform to service protocol: %@.", v28);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

          uint64_t v28 = 0;
LABEL_35:

          if (!*a8) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
        uint64_t v38 = (void *)MEMORY[0x263F087E8];
        uint64_t v39 = *MEMORY[0x263F221C8];
        uint64_t v28 = NSStringFromClass((Class)v19);
        v41 = v28;
        v35 = @"Failed to instantiate service of class %@";
        v36 = v38;
        uint64_t v37 = v39;
      }
      else
      {
        id v33 = (void *)MEMORY[0x263F087E8];
        if (v48)
        {
          uint64_t v34 = *MEMORY[0x263F221D8];
          uint64_t v28 = [NSNumber numberWithUnsignedInteger:a6];
          v41 = v19;
          v42 = v28;
          v35 = @"Service: '%@' unable to process message:'%@'. The service needs to require entitlements.";
        }
        else
        {
          uint64_t v34 = *MEMORY[0x263F221C0];
          uint64_t v28 = [NSNumber numberWithUnsignedInteger:a6];
          id v44 = v15;
          uint64_t v45 = [v16 pid];
          v42 = v28;
          id v43 = v23;
          v41 = v19;
          v35 = @"Service: '%@' unable to process message:'%@'. Entitlements may be missing. See guidance in rdar://126183364. required: %@ [client identifier: %@:%d]";
        }
        v36 = v33;
        uint64_t v37 = v34;
      }
      objc_msgSend(v36, "ax_errorWithDomain:description:", v37, v35, v41, v42, v43, v44, v45);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F221C8];
      uint64_t v28 = [v18 infoDictionary];
      uint64_t v31 = [v28 objectForKeyedSubscript:@"NSPrincipalClass"];
      objc_msgSend(v29, "ax_errorWithDomain:description:", v30, @"Couldn't find principal class for service bundle at path: %@ %@", v14, v31);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      id v23 = 0;
    }
    a7 = v46;
    goto LABEL_34;
  }
  if (*a8)
  {
    uint64_t v28 = 0;
LABEL_36:
    *a7 = 1;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221C8], @"Service bundle still not loaded, weird... Service bundle path: %@", v14);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = 0;
  *a8 = v32;
  if (v32) {
    goto LABEL_36;
  }
LABEL_37:

  return v28;
}

- (void)_unregisterAllClientsWithConnection:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v5 = [(AXUIServiceManager *)self servicesAccessQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke;
  v11[3] = &unk_2645C60D8;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v21;
  id v14 = &v15;
  [v5 performSynchronousReadingBlock:v11];
  [(AXUIServiceManager *)self _unregisterClientsIdentifiersLists:v16[5] serviceContexts:v22[5]];
  long long v7 = [(AXUIServiceManager *)self entitlementsCheckersAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_3;
  v9[3] = &unk_2645C5AB0;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  [v7 performSynchronousWritingBlock:v9];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

void __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) serviceContexts];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v24 + 1) + 8 * v4);
        uint64_t v18 = 0;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x3032000000;
        uint64_t v21 = __Block_byref_object_copy__0;
        BOOL v22 = __Block_byref_object_dispose__0;
        id v23 = 0;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_2;
        v15[3] = &unk_2645C5E10;
        id v16 = *(id *)(a1 + 40);
        uint64_t v17 = &v18;
        [v5 enumerateClientsUsingBlock:v15];
        if (v19[5])
        {
          id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v6)
          {
            uint64_t v7 = objc_opt_new();
            uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
            long long v9 = *(void **)(v8 + 40);
            *(void *)(v8 + 40) = v7;

            id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          [v6 addObject:v5];
          id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          if (!v10)
          {
            uint64_t v11 = objc_opt_new();
            uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
            id v13 = *(void **)(v12 + 40);
            *(void *)(v12 + 40) = v11;

            id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          }
          [v10 addObject:v19[5]];
        }

        _Block_object_dispose(&v18, 8);
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v2);
  }
}

void __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) isEqual:v5])
  {
    objc_msgSend(v5, "setXpc_handler:", 0);
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

void __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entitlementsCheckers];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_4;
  v3[3] = &unk_2645C5DE8;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 clientConnectionWillBeTerminated:*(void *)(a1 + 32)];
}

- (void)_unregisterClientsIdentifiersLists:(id)a3 serviceContexts:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = AXLogAssertions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v5;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_DEFAULT, "Unregister: %@ %@", buf, 0x16u);
  }

  uint64_t v8 = [v6 count];
  if (v8 != [v5 count]) {
    _AXAssert();
  }
  if (v8)
  {
    uint64_t v9 = 0;
    id v36 = v6;
    id v37 = v5;
    uint64_t v35 = v8;
    do
    {
      id v10 = [v6 objectAtIndex:v9];
      uint64_t v11 = [v10 service];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v38 = v10;
        uint64_t v39 = v9;
        uint64_t v12 = [v5 objectAtIndex:v9];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v51 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              [v11 connectionWillBeInterruptedForClientWithIdentifier:v17];
              uint64_t v18 = AXLogAssertions();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v57 = v11;
                __int16 v58 = 2112;
                id v59 = v17;
                _os_log_impl(&dword_221750000, v18, OS_LOG_TYPE_DEFAULT, "Service disconnected client: %@ %@", buf, 0x16u);
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
          }
          while (v14);
        }

        id v6 = v36;
        id v5 = v37;
        uint64_t v8 = v35;
        id v10 = v38;
        uint64_t v9 = v39;
      }

      ++v9;
    }
    while (v9 != v8);
  }
  uint64_t v19 = objc_opt_new();
  uint64_t v20 = [(AXUIServiceManager *)self servicesAccessQueue];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __73__AXUIServiceManager__unregisterClientsIdentifiersLists_serviceContexts___block_invoke;
  v45[3] = &unk_2645C6100;
  v45[4] = self;
  uint64_t v49 = v8;
  id v21 = v6;
  id v46 = v21;
  id v22 = v5;
  id v47 = v22;
  id v23 = v19;
  id v48 = v23;
  v40 = v20;
  [v20 performSynchronousWritingBlock:v45];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        uint64_t v30 = +[AXUIAssertionManager sharedInstance];
        uint64_t v31 = [v29 firstObject];
        id v32 = [v29 lastObject];
        [v30 invalidateAssertionUIIfNeededForService:v31 clientIdentifier:v32];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v26);
  }

  id v33 = +[AXUIAssertionManager sharedInstance];
  [v33 invalidateAssertionIfNeeded];
}

void __73__AXUIServiceManager__unregisterClientsIdentifiersLists_serviceContexts___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v22 = [*(id *)(a1 + 32) serviceContexts];
  if (*(void *)(a1 + 64))
  {
    uint64_t v3 = 0;
    *(void *)&long long v2 = 138412290;
    long long v21 = v2;
    do
    {
      id v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v3, v21);
      uint64_t v23 = v3;
      id v5 = [*(id *)(a1 + 48) objectAtIndex:v3];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            [v4 removeClientWithIdentifier:v10];
            uint64_t v11 = AXLogAssertions();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = [v4 service];
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = v12;
              __int16 v31 = 2112;
              uint64_t v32 = v10;
              _os_log_impl(&dword_221750000, v11, OS_LOG_TYPE_DEFAULT, "ServiceContext removed client: %@ %@", buf, 0x16u);
            }
            uint64_t v13 = [v4 service];

            if (v10) {
              BOOL v14 = v13 == 0;
            }
            else {
              BOOL v14 = 1;
            }
            if (!v14)
            {
              uint64_t v15 = *(void **)(a1 + 56);
              id v16 = [v4 service];
              v28[0] = v16;
              v28[1] = v10;
              uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
              [v15 addObject:v17];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v7);
      }
      if (![v4 clientsCount])
      {
        [v22 removeObjectIdenticalTo:v4];
        uint64_t v18 = AXLogAssertions();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v4 service];
          *(_DWORD *)buf = v21;
          uint64_t v30 = v19;
          _os_log_impl(&dword_221750000, v18, OS_LOG_TYPE_DEFAULT, "Service has no clients, removed: %@", buf, 0xCu);
        }
        if (![v22 count])
        {
          [*(id *)(a1 + 32) setServiceContexts:0];
          uint64_t v20 = AXLogAssertions();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_221750000, v20, OS_LOG_TYPE_DEFAULT, "AXUIServer has no active services, idle", buf, 2u);
          }
        }
      }

      uint64_t v3 = v23 + 1;
    }
    while ((unint64_t)(v23 + 1) < *(void *)(a1 + 64));
  }
}

- (id)_serviceContextForClientWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(AXUIServiceManager *)self servicesAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__AXUIServiceManager__serviceContextForClientWithIdentifier___block_invoke;
  v9[3] = &unk_2645C6128;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 performSynchronousReadingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__AXUIServiceManager__serviceContextForClientWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) serviceContexts];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasClientWithIdentifier:", *(void *)(a1 + 40), (void)v8))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_services
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(AXUIServiceManager *)self servicesAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__AXUIServiceManager__services__block_invoke;
  v9[3] = &unk_2645C5AB0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 performSynchronousReadingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __31__AXUIServiceManager__services__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) serviceContexts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        long long v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) service];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (unint64_t)_servicesCount
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(AXUIServiceManager *)self servicesAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__AXUIServiceManager__servicesCount__block_invoke;
  v6[3] = &unk_2645C6150;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 performSynchronousReadingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __36__AXUIServiceManager__servicesCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceContexts];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)_serviceContextForService:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(AXUIServiceManager *)self servicesAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__AXUIServiceManager__serviceContextForService___block_invoke;
  v9[3] = &unk_2645C6128;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 performSynchronousReadingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__AXUIServiceManager__serviceContextForService___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) serviceContexts];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v8 = objc_msgSend(v7, "service", (void)v10);
        uint64_t v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_uniqueIdentifierForService:(id)a3
{
  return (id)[MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
}

- (id)_servicesForUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(AXUIServiceManager *)self servicesAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__AXUIServiceManager__servicesForUniqueIdentifiers___block_invoke;
  v9[3] = &unk_2645C6128;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 performSynchronousWritingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__AXUIServiceManager__servicesForUniqueIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) serviceContexts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v8 = *(void **)(a1 + 32);
        uint64_t v9 = [v7 service];
        id v10 = [v8 _uniqueIdentifierForService:v9];

        if ([*(id *)(a1 + 40) containsObject:v10])
        {
          long long v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v11)
          {
            uint64_t v12 = objc_opt_new();
            uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v14 = *(void **)(v13 + 40);
            *(void *)(v13 + 40) = v12;

            long long v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          uint64_t v15 = [v7 service];
          [v11 addObject:v15];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (AXUIDisplayManager)displayManager
{
  return self->_displayManager;
}

- (void)setDisplayManager:(id)a3
{
}

- (AXAccessQueue)resumingConnectionsQueue
{
  return self->_resumingConnectionsQueue;
}

- (void)setResumingConnectionsQueue:(id)a3
{
}

- (NSMutableArray)pausedConnections
{
  return self->_pausedConnections;
}

- (void)setPausedConnections:(id)a3
{
}

- (AXAccessQueue)entitlementsCheckersAccessQueue
{
  return self->_entitlementsCheckersAccessQueue;
}

- (void)setEntitlementsCheckersAccessQueue:(id)a3
{
}

- (NSMutableDictionary)entitlementsCheckers
{
  return self->_entitlementsCheckers;
}

- (void)setEntitlementsCheckers:(id)a3
{
}

- (AXUIMessageSender)messageSender
{
  return self->_messageSender;
}

- (void)setMessageSender:(id)a3
{
}

- (NSMutableArray)serviceContexts
{
  return self->_serviceContexts;
}

- (void)setServiceContexts:(id)a3
{
}

- (AXAccessQueue)servicesAccessQueue
{
  return self->_servicesAccessQueue;
}

- (void)setServicesAccessQueue:(id)a3
{
}

- (unint64_t)lastUsedServiceIdentifier
{
  return self->_lastUsedServiceIdentifier;
}

- (void)setLastUsedServiceIdentifier:(unint64_t)a3
{
  self->_lastUsedServiceIdentifier = a3;
}

- (BOOL)shouldAllowServicesToProcessMessages
{
  return self->_shouldAllowServicesToProcessMessages;
}

- (void)setShouldAllowServicesToProcessMessages:(BOOL)a3
{
  self->_shouldAllowServicesToProcessMessages = a3;
}

- (AXUIServiceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXUIServiceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (OS_dispatch_queue)transactionsQueue
{
  return self->_transactionsQueue;
}

- (void)setTransactionsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_servicesAccessQueue, 0);
  objc_storeStrong((id *)&self->_serviceContexts, 0);
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_entitlementsCheckers, 0);
  objc_storeStrong((id *)&self->_entitlementsCheckersAccessQueue, 0);
  objc_storeStrong((id *)&self->_pausedConnections, 0);
  objc_storeStrong((id *)&self->_resumingConnectionsQueue, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);

  objc_storeStrong((id *)&self->_springBoardReaper, 0);
}

- (void)_processXPCObject:(os_log_t)log context:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221750000, log, OS_LOG_TYPE_ERROR, "AXUIServiceManager: Got invalid value for message identifier in client connection event handler: 0.", v1, 2u);
}

- (void)_processXPCObject:(os_log_t)log context:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_221750000, log, OS_LOG_TYPE_FAULT, "Implementors of AXUIService must implement either processMessage:withIdentifier:fromClientWithIdentifier:error: or processMessage:withIdentifier:fromClientWithIdentifier:pid:error:.", v1, 2u);
}

- (void)_processXPCObject:(os_log_t)log context:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221750000, log, OS_LOG_TYPE_ERROR, "Lost connection with client.", v1, 2u);
}

- (void)_processXPCObject:(void *)a1 context:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v4 = 136446210;
  uint64_t v5 = string;
  _os_log_error_impl(&dword_221750000, a2, OS_LOG_TYPE_ERROR, "Got unexpected error in client connection event handler: %{public}s.", (uint8_t *)&v4, 0xCu);
}

- (void)_processXPCObject:(uint64_t)a1 context:(NSObject *)a2 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221750000, a2, OS_LOG_TYPE_ERROR, "Got object of unexpected type in client connection event handler: %{public}s.", (uint8_t *)&v2, 0xCu);
}

@end
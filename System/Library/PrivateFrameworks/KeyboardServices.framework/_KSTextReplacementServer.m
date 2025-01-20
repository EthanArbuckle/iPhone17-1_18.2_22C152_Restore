@interface _KSTextReplacementServer
+ (BOOL)isBlackListed:(unsigned int)a3;
+ (id)textReplacementServer;
- (APSConnection)pushConnection;
- (BOOL)_cancelPendingUpdateForClient:(id)a3;
- (BOOL)isSetupAssistantRunning;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)directoryPath;
- (NSXPCListener)listener;
- (_KSTextReplacementManager)textReplacementManager;
- (_KSTextReplacementServer)init;
- (_KSTextReplacementServer)initWithDatabaseDirectoryPath:(id)a3;
- (id)textReplacementEntries;
- (id)textReplacementEntriesForClient:(id)a3;
- (void)_performCleanup;
- (void)addEntries:(id)a3 removeEntries:(id)a4 forClient:(id)a5 withCompletionHandler:(id)a6;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5;
- (void)buddySetupDidFinish;
- (void)cancelPendingUpdates;
- (void)cleanup;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)dealloc;
- (void)queryTextReplacementsWithCallback:(id)a3;
- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4;
- (void)registerForPushNotifications;
- (void)removeAllEntries;
- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)requestSyncWithCompletionBlock:(id)a3;
- (void)scheduleSyncTask;
- (void)setDirectoryPath:(id)a3;
- (void)setListener:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setTextReplacementManager:(id)a3;
- (void)shutdown;
- (void)start;
@end

@implementation _KSTextReplacementServer

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke;
  v7[3] = &unk_264890A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (_KSTextReplacementManager)textReplacementManager
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(_KSTextReplacementServer *)self isSetupAssistantRunning])
  {
    v3 = KSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      v12 = "-[_KSTextReplacementServer textReplacementManager]";
      _os_log_impl(&dword_22B2BC000, v3, OS_LOG_TYPE_INFO, "%s  >>> Setup Assistance is running, not loading text replacements", (uint8_t *)&v11, 0xCu);
    }

    id v4 = 0;
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    textReplacementManager = self->_textReplacementManager;
    if (!textReplacementManager)
    {
      id v6 = [_KSTextReplacementManager alloc];
      v7 = [(_KSTextReplacementServer *)self directoryPath];
      id v8 = [(_KSTextReplacementManager *)v6 initWithDirectoryPath:v7];
      v9 = self->_textReplacementManager;
      self->_textReplacementManager = v8;

      textReplacementManager = self->_textReplacementManager;
    }
    id v4 = textReplacementManager;
  }
  return v4;
}

- (BOOL)isSetupAssistantRunning
{
  return softLinkBYSetupAssistantNeedsToRun();
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

+ (id)textReplacementServer
{
  if (textReplacementServer_onceToken != -1) {
    dispatch_once(&textReplacementServer_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)textReplacementServer_sharedInstance;
  return v2;
}

- (_KSTextReplacementServer)init
{
  v3 = +[_KSUtilities keyboardServicesDirectory];
  id v4 = [(_KSTextReplacementServer *)self initWithDatabaseDirectoryPath:v3];

  return v4;
}

- (_KSTextReplacementServer)initWithDatabaseDirectoryPath:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_KSTextReplacementServer;
  id v6 = [(_KSTextReplacementServer *)&v20 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.keyboardServices.textReplacementServer.storeWorkQueue", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    v10 = [[_KSTRClient alloc] initWithOwner:v6];
    daemonClient = v6->_daemonClient;
    v6->_daemonClient = v10;

    objc_storeStrong((id *)&v6->_directoryPath, a3);
    id v12 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v13 = +[_KSUtilities machServiceNameTextReplacement];
    uint64_t v14 = [v12 initWithMachServiceName:v13];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v14;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    v16 = v6->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58___KSTextReplacementServer_initWithDatabaseDirectoryPath___block_invoke;
    block[3] = &unk_2648906A8;
    v19 = v6;
    dispatch_async(v16, block);
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)_KSTextReplacementServer;
  [(_KSTextReplacementServer *)&v5 dealloc];
}

- (void)scheduleSyncTask
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  if (scheduleSyncTask_onceToken != -1) {
    dispatch_once(&scheduleSyncTask_onceToken, block);
  }
}

- (void)setTextReplacementManager:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54___KSTextReplacementServer_setTextReplacementManager___block_invoke;
  v7[3] = &unk_264891550;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)cleanup
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35___KSTextReplacementServer_cleanup__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_performCleanup
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = KSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[_KSTextReplacementServer _performCleanup]";
    _os_log_impl(&dword_22B2BC000, v3, OS_LOG_TYPE_INFO, "%s  Cleaning up all resources", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"_KSTRShouldCleanupResources" object:0];

  [(_KSTextReplacementServer *)self setTextReplacementManager:0];
}

- (void)start
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [(NSXPCListener *)self->_listener resume];
  v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[_KSTextReplacementServer start]";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  TextReplacementServer accepting request now", (uint8_t *)&v3, 0xCu);
  }
}

- (void)shutdown
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36___KSTextReplacementServer_shutdown__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(workQueue, block);
  [(NSXPCListener *)self->_listener invalidate];
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 forClient:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    uint64_t v14 = [v12 generation];
    workQueue = self->_workQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke;
    v16[3] = &unk_2648918F0;
    id v17 = v10;
    id v18 = v11;
    uint64_t v22 = v14;
    id v19 = v12;
    objc_super v20 = self;
    id v21 = v13;
    dispatch_async(workQueue, v16);
  }
}

- (void)removeAllEntries
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__5;
  v5[4] = __Block_byref_object_dispose__5;
  id v6 = (id)os_transaction_create();
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44___KSTextReplacementServer_removeAllEntries__block_invoke;
  v4[3] = &unk_264891488;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(workQueue, v4);
  _Block_object_dispose(v5, 8);
}

- (void)cancelPendingUpdates
{
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60___KSTextReplacementServer_requestSync_withCompletionBlock___block_invoke;
  block[3] = &unk_264890AE8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (BOOL)_cancelPendingUpdateForClient:(id)a3
{
  if (a3) {
    [a3 cancel];
  }
  return a3 != 0;
}

- (id)textReplacementEntries
{
  return [(_KSTextReplacementServer *)self textReplacementEntriesForClient:self->_daemonClient];
}

- (id)textReplacementEntriesForClient:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  LODWORD(workQueue) = [v5 hasReadAccess];

  if (workQueue)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = self->_workQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60___KSTextReplacementServer_textReplacementEntriesForClient___block_invoke;
    v12[3] = &unk_264891550;
    v12[4] = self;
    id v8 = v6;
    id v13 = v8;
    dispatch_sync(v7, v12);
    v9 = v13;
    id v10 = v8;
  }
  else
  {
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  return v10;
}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke;
  block[3] = &unk_264890B60;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend((id)objc_opt_class(), "isBlackListed:", objc_msgSend(v7, "effectiveUserIdentifier"));
  if (v8)
  {
    [v7 invalidate];
  }
  else
  {
    id v9 = [[_KSTRClient alloc] initWithOwner:self forConnection:v7];
    id v10 = _KSTextReplacementServerInterface();
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:v9];
    objc_initWeak(&location, v7);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __63___KSTextReplacementServer_listener_shouldAcceptNewConnection___block_invoke;
    v15 = &unk_2648914D8;
    objc_copyWeak(&v16, &location);
    [v7 setInvalidationHandler:&v12];
    objc_msgSend(v7, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v8 ^ 1;
}

- (void)registerForPushNotifications
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F280D0];
  id v4 = objc_alloc(MEMORY[0x263F280F0]);
  id v5 = dispatch_get_global_queue(0, 0);
  id v6 = (APSConnection *)[v4 initWithEnvironmentName:v3 namedDelegatePort:@"com.apple.keyboardServices.textReplacementServer.aps" queue:v5];
  pushConnection = self->_pushConnection;
  self->_pushConnection = v6;

  [(APSConnection *)self->_pushConnection setDelegate:self];
  int v8 = [MEMORY[0x263F086E0] mainBundle];
  id v9 = [v8 bundleIdentifier];

  if (![v9 length])
  {
    id v10 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v11 = [v10 executablePath];
    uint64_t v12 = [v11 lastPathComponent];

    id v9 = (void *)v12;
  }
  uint64_t v13 = [@"com.apple.icloud-container." stringByAppendingString:v9];
  uint64_t v14 = self->_pushConnection;
  v16[0] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [(APSConnection *)v14 setEnabledTopics:v15];

  NSLog(&cfstr_WaitingForPush.isa, v13);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v8 = [v5 userInfo];
  id v6 = [MEMORY[0x263EFD760] notificationFromRemoteNotificationDictionary:v8];
  id v7 = [v5 topic];

  NSLog(&cfstr_ApsPushReceive.isa, v7, v6);
  [(_KSTextReplacementServer *)self requestSync:1 withCompletionBlock:&__block_literal_global_81];
}

- (void)buddySetupDidFinish
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[_KSTextReplacementServer buddySetupDidFinish]";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  >>> buddysetup did finish", (uint8_t *)&v3, 0xCu);
  }

  CFPreferencesAppSynchronize(@"com.apple.keyboard");
}

+ (BOOL)isBlackListed:(unsigned int)a3
{
  return 0;
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void)setDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_textReplacementManager, 0);
  objc_storeStrong((id *)&self->_daemonClient, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
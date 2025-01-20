@interface EMDaemonInterface
+ (BOOL)cachedMailAppIsInstalled;
+ (NSXPCInterface)remoteObjectInterface;
+ (OS_os_log)log;
+ (id)_mailUninstalledFile;
+ (void)setCachedMailAppIsInstalled:(BOOL)a3;
- (BOOL)allowsBackgroundResume;
- (EMAccountRepository)accountRepository;
- (EMActivityRegistry)activityRegistry;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMClientState)clientState;
- (EMDaemonInterface)init;
- (EMDaemonInterface)initWithListenerEndpoint:(id)a3;
- (EMDiagnosticInfoGatherer)diagnosticInfoGatherer;
- (EMFetchController)fetchController;
- (EMInteractionLogger)interactionLogger;
- (EMMailboxRepository)mailboxRepository;
- (EMMessageRepository)messageRepository;
- (EMOutgoingMessageRepository)outgoingMessageRepository;
- (EMSearchableIndex)searchableIndex;
- (EMSenderRepository)senderRepository;
- (EMVIPManager)vipManager;
- (NSXPCConnection)test_connection;
- (NSXPCProxyCreating)proxyCreator;
- (id)_connectionForProtocol:(id)a3 error:(id *)a4;
- (id)_initByAdoptingConnection:(id)a3 useNegotiatedConnection:(BOOL)a4 configureBlockedSenderManager:(BOOL)a5;
- (id)connectionForProtocol:(id)a3;
- (id)generateProxyForProtocol:(id)a3 error:(id *)a4;
- (id)initAndConfigureBlockedSenderManager:(BOOL)a3;
- (id)initForTesting;
- (void)_invalidate;
- (void)dealloc;
- (void)handleDaemonAvailability;
- (void)launchDaemon;
- (void)repopulateBusinessesTables;
- (void)resetProtocolConnections;
- (void)setAllowsBackgroundResume:(BOOL)a3;
- (void)test_tearDown;
@end

@implementation EMDaemonInterface

- (id)generateProxyForProtocol:(id)a3 error:(id *)a4
{
  v4 = [(EMDaemonInterface *)self _connectionForProtocol:a3 error:a4];
  return v4;
}

- (id)_connectionForProtocol:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (_connectionForProtocol_error__onceToken != -1) {
    dispatch_once(&_connectionForProtocol_error__onceToken, &__block_literal_global_9);
  }
  Value = (const char *)CFDictionaryGetValue((CFDictionaryRef)_connectionForProtocol_error__map, v6);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  v8 = [(EMDaemonInterface *)self proxyCreator];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_321;
  v21[3] = &unk_1E63E30E8;
  v21[4] = &v22;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v21];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_2;
  v14[3] = &unk_1E63E3110;
  v14[4] = &v15;
  v10 = (void *)MEMORY[0x1C18A2160](v14);
  objc_msgSend(v9, Value, v10);
  v11 = (void *)v16[5];
  if (v11)
  {
    [(EMDaemonInterface *)self handleDaemonAvailability];
    v11 = (void *)v16[5];
  }
  if (a4 && !v11)
  {
    *a4 = (id) v23[5];
    v11 = (void *)v16[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (NSXPCProxyCreating)proxyCreator
{
  return (NSXPCProxyCreating *)self->_connection;
}

- (void)handleDaemonAvailability
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EMDaemonInterface_handleDaemonAvailability__block_invoke;
  block[3] = &unk_1E63E26B0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (EMMessageRepository)messageRepository
{
  return (EMMessageRepository *)objc_getProperty(self, a2, 64, 1);
}

- (EMInteractionLogger)interactionLogger
{
  return (EMInteractionLogger *)objc_getProperty(self, a2, 120, 1);
}

- (EMFetchController)fetchController
{
  return (EMFetchController *)objc_getProperty(self, a2, 104, 1);
}

- (EMAccountRepository)accountRepository
{
  return (EMAccountRepository *)objc_getProperty(self, a2, 88, 1);
}

- (EMMailboxRepository)mailboxRepository
{
  return (EMMailboxRepository *)objc_getProperty(self, a2, 80, 1);
}

- (EMClientState)clientState
{
  return (EMClientState *)objc_getProperty(self, a2, 112, 1);
}

- (EMOutgoingMessageRepository)outgoingMessageRepository
{
  return (EMOutgoingMessageRepository *)objc_getProperty(self, a2, 72, 1);
}

- (EMActivityRegistry)activityRegistry
{
  return (EMActivityRegistry *)objc_getProperty(self, a2, 128, 1);
}

void __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 remoteObjectProxy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (NSXPCInterface)remoteObjectInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86CD8];
  uint64_t v3 = +[EMAccountRepository remoteInterface];
  [v2 setInterface:v3 forSelector:sel_getAccountRepositoryInterface_ argumentIndex:0 ofReply:1];

  uint64_t v4 = +[EMClientState remoteInterface];
  [v2 setInterface:v4 forSelector:sel_getClientStateInterface_ argumentIndex:0 ofReply:1];

  v5 = +[EMFetchController remoteInterface];
  [v2 setInterface:v5 forSelector:sel_getFetchControllerInterface_ argumentIndex:0 ofReply:1];

  id v6 = +[EMInteractionLogger remoteInterface];
  [v2 setInterface:v6 forSelector:sel_getInteractionLoggerInterface_ argumentIndex:0 ofReply:1];

  v7 = +[EMMailboxRepository remoteInterface];
  [v2 setInterface:v7 forSelector:sel_getMailboxRepositoryInterface_ argumentIndex:0 ofReply:1];

  v8 = +[EMMessageRepository remoteInterface];
  [v2 setInterface:v8 forSelector:sel_getMessageRepositoryInterface_ argumentIndex:0 ofReply:1];

  v9 = +[EMOutgoingMessageRepository remoteInterface];
  [v2 setInterface:v9 forSelector:sel_getOutgoingMessageRepositoryInterface_ argumentIndex:0 ofReply:1];

  v10 = +[EMSenderRepository remoteInterface];
  [v2 setInterface:v10 forSelector:sel_getSenderRepositoryInterface_ argumentIndex:0 ofReply:1];

  v11 = +[EMSearchableIndex remoteInterface];
  [v2 setInterface:v11 forSelector:sel_getSearchableIndexInterface_ argumentIndex:0 ofReply:1];

  id v12 = +[EMVIPManager remoteInterface];
  [v2 setInterface:v12 forSelector:sel_getVIPManagerInterface_ argumentIndex:0 ofReply:1];

  v13 = +[EMActivityRegistry remoteInterface];
  [v2 setInterface:v13 forSelector:sel_getActivityRegistryInterface_ argumentIndex:0 ofReply:1];

  v14 = +[EMDiagnosticInfoGatherer remoteInterface];
  [v2 setInterface:v14 forSelector:sel_getDiagnosticInfoGathererInterface_ argumentIndex:0 ofReply:1];

  return (NSXPCInterface *)v2;
}

void __50__EMDaemonInterface__connectionForProtocol_error___block_invoke()
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
  v1 = +[EMAccountRepository remoteInterface];
  v2 = [v1 protocol];
  CFDictionarySetValue(Mutable, v2, sel_getAccountRepositoryInterface_);

  uint64_t v3 = +[EMClientState remoteInterface];
  uint64_t v4 = [v3 protocol];
  CFDictionarySetValue(Mutable, v4, sel_getClientStateInterface_);

  v5 = +[EMFetchController remoteInterface];
  id v6 = [v5 protocol];
  CFDictionarySetValue(Mutable, v6, sel_getFetchControllerInterface_);

  v7 = +[EMInteractionLogger remoteInterface];
  v8 = [v7 protocol];
  CFDictionarySetValue(Mutable, v8, sel_getInteractionLoggerInterface_);

  v9 = +[EMMailboxRepository remoteInterface];
  v10 = [v9 protocol];
  CFDictionarySetValue(Mutable, v10, sel_getMailboxRepositoryInterface_);

  v11 = +[EMMessageRepository remoteInterface];
  id v12 = [v11 protocol];
  CFDictionarySetValue(Mutable, v12, sel_getMessageRepositoryInterface_);

  v13 = +[EMOutgoingMessageRepository remoteInterface];
  v14 = [v13 protocol];
  CFDictionarySetValue(Mutable, v14, sel_getOutgoingMessageRepositoryInterface_);

  uint64_t v15 = +[EMSenderRepository remoteInterface];
  v16 = [v15 protocol];
  CFDictionarySetValue(Mutable, v16, sel_getSenderRepositoryInterface_);

  uint64_t v17 = +[EMSearchableIndex remoteInterface];
  v18 = [v17 protocol];
  CFDictionarySetValue(Mutable, v18, sel_getSearchableIndexInterface_);

  v19 = +[EMVIPManager remoteInterface];
  id v20 = [v19 protocol];
  CFDictionarySetValue(Mutable, v20, sel_getVIPManagerInterface_);

  v21 = +[EMActivityRegistry remoteInterface];
  uint64_t v22 = [v21 protocol];
  CFDictionarySetValue(Mutable, v22, sel_getActivityRegistryInterface_);

  v23 = +[EMDiagnosticInfoGatherer remoteInterface];
  uint64_t v24 = [v23 protocol];
  CFDictionarySetValue(Mutable, v24, sel_getDiagnosticInfoGathererInterface_);

  _connectionForProtocol_error__map = (uint64_t)Mutable;
}

- (EMDiagnosticInfoGatherer)diagnosticInfoGatherer
{
  return (EMDiagnosticInfoGatherer *)objc_getProperty(self, a2, 152, 1);
}

- (EMVIPManager)vipManager
{
  return (EMVIPManager *)objc_getProperty(self, a2, 136, 1);
}

- (EMSenderRepository)senderRepository
{
  return (EMSenderRepository *)objc_getProperty(self, a2, 96, 1);
}

void __45__EMDaemonInterface_handleDaemonAvailability__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void *)(*(void *)(a1 + 32) + 32) == 1;
  uint64_t v3 = +[EMDaemonInterface log];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v5;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Daemon re-launched, recovering remote connections", buf, 0xCu);
    }

    id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 52);
    os_unfair_lock_lock(v6);
    v7 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
    os_unfair_lock_unlock(v6);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v3 = v7;
    uint64_t v8 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "recover", (void)v17);
        }
        uint64_t v8 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    v11 = *(unsigned char **)(a1 + 32);
    if (v11[48])
    {
      id v12 = [v11 proxyCreator];
      v13 = [v12 remoteObjectProxy];
      [v13 setAllowsBackgroundResume:1];
    }
    v14 = +[EMDaemonInterface log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished recovery", buf, 0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  else if (v4)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v16;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping recovery", buf, 0xCu);
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__EMDaemonInterface_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1) {
    dispatch_once(&log_onceToken_11, block);
  }
  BOOL v2 = (void *)log_log_11;
  return (OS_os_log *)v2;
}

- (id)_initByAdoptingConnection:(id)a3 useNegotiatedConnection:(BOOL)a4 configureBlockedSenderManager:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v81.receiver = self;
  v81.super_class = (Class)EMDaemonInterface;
  uint64_t v9 = [(EMDaemonInterface *)&v81 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = +[EMDaemonInterface remoteObjectInterface];
    [(NSXPCConnection *)v10->_connection setRemoteObjectInterface:v11];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke;
    v78[3] = &unk_1E63E2688;
    objc_copyWeak(&v79, &location);
    [v8 setInterruptionHandler:v78];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_7;
    v76[3] = &unk_1E63E2688;
    objc_copyWeak(&v77, &location);
    [v8 setInvalidationHandler:v76];
    [v8 resume];
    id v12 = [MEMORY[0x1E4F60DD8] observableOnNotifyTokenWithName:@"com.apple.email.maild.launched"];
    v13 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.maild.launched" qualityOfService:17];
    v14 = [v12 debounceWithTimeInterval:v13 scheduler:0.05];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_10;
    v74[3] = &unk_1E63E30C0;
    objc_copyWeak(&v75, &location);
    uint64_t v15 = [v14 subscribeWithResultBlock:v74];
    daemonLaunchToken = v10->_daemonLaunchToken;
    v10->_daemonLaunchToken = (EFCancelable *)v15;

    long long v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v18 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("com.apple.email.EMDaemonInterface", v17, v18);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    connections = v10->_connections;
    v10->_connections = (NSHashTable *)v21;

    uint64_t v23 = [EMAccountRepository alloc];
    uint64_t v24 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A866F0];
    uint64_t v25 = [(EMAccountRepository *)v23 initWithRemoteConnection:v24];
    accountRepository = v10->_accountRepository;
    v10->_accountRepository = (EMAccountRepository *)v25;

    id v27 = [EMMailboxRepository alloc];
    v28 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86978];
    uint64_t v29 = [(EMMailboxRepository *)v27 initWithRemoteConnection:v28 accountRepository:v10->_accountRepository];
    mailboxRepository = v10->_mailboxRepository;
    v10->_mailboxRepository = (EMMailboxRepository *)v29;

    v31 = [EMVIPManager alloc];
    v32 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A869D8];
    uint64_t v33 = [(EMVIPManager *)v31 initWithRemoteConnection:v32];
    vipManager = v10->_vipManager;
    v10->_vipManager = (EMVIPManager *)v33;

    v35 = [EMMessageRepository alloc];
    v36 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86A38];
    uint64_t v37 = [(EMMessageRepository *)v35 initWithRemoteConnection:v36 mailboxRepository:v10->_mailboxRepository vipManager:v10->_vipManager];
    messageRepository = v10->_messageRepository;
    v10->_messageRepository = (EMMessageRepository *)v37;

    v39 = [EMSenderRepository alloc];
    v40 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86A98];
    uint64_t v41 = [(EMRepository *)v39 initWithRemoteConnection:v40];
    senderRepository = v10->_senderRepository;
    v10->_senderRepository = (EMSenderRepository *)v41;

    v43 = [EMFetchController alloc];
    v44 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86AF8];
    uint64_t v45 = [(EMFetchController *)v43 initWithRemoteConnection:v44];
    fetchController = v10->_fetchController;
    v10->_fetchController = (EMFetchController *)v45;

    v47 = [EMOutgoingMessageRepository alloc];
    v48 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86B58];
    uint64_t v49 = [(EMOutgoingMessageRepository *)v47 initWithRemoteConnection:v48];
    outgoingMessageRepository = v10->_outgoingMessageRepository;
    v10->_outgoingMessageRepository = (EMOutgoingMessageRepository *)v49;

    v51 = [EMClientState alloc];
    v52 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A867B0];
    uint64_t v53 = [(EMClientState *)v51 initWithRemoteConnection:v52];
    clientState = v10->_clientState;
    v10->_clientState = (EMClientState *)v53;

    v55 = [EMSearchableIndex alloc];
    v56 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86BB8];
    uint64_t v57 = [(EMSearchableIndex *)v55 initWithRemoteConnection:v56];
    searchableIndex = v10->_searchableIndex;
    v10->_searchableIndex = (EMSearchableIndex *)v57;

    v59 = [EMInteractionLogger alloc];
    v60 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86C18];
    uint64_t v61 = [(EMInteractionLogger *)v59 initWithRemoteConnection:v60];
    interactionLogger = v10->_interactionLogger;
    v10->_interactionLogger = (EMInteractionLogger *)v61;

    v63 = [EMActivityRegistry alloc];
    v64 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86750];
    uint64_t v65 = [(EMActivityRegistry *)v63 initWithRemoteConnection:v64];
    activityRegistry = v10->_activityRegistry;
    v10->_activityRegistry = (EMActivityRegistry *)v65;

    v67 = [EMDiagnosticInfoGatherer alloc];
    v68 = [(EMDaemonInterface *)v10 connectionForProtocol:&unk_1F1A86C78];
    uint64_t v69 = [(EMDiagnosticInfoGatherer *)v67 initWithRemoteConnection:v68];
    diagnosticInfoGatherer = v10->_diagnosticInfoGatherer;
    v10->_diagnosticInfoGatherer = (EMDiagnosticInfoGatherer *)v69;

    atomic_store(0, (unsigned __int8 *)&v10->_invalidated);
    if (v5)
    {
      v71 = objc_alloc_init(EMBlockedSenderManager);
      blockedSenderManager = v10->_blockedSenderManager;
      v10->_blockedSenderManager = v71;
    }
    objc_destroyWeak(&v75);

    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)connectionForProtocol:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[EMRemoteConnection alloc] initWithProtocol:v4 proxyGenerator:self];
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_connections addObject:v5];
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (id)initAndConfigureBlockedSenderManager:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.email.maild" options:4096];
  id v6 = [(EMDaemonInterface *)self _initByAdoptingConnection:v5 useNegotiatedConnection:0 configureBlockedSenderManager:v3];

  return v6;
}

+ (void)setCachedMailAppIsInstalled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v5 = [a1 _mailUninstalledFile];
  if (v3)
  {
    [v8 removeItemAtURL:v5 error:0];
  }
  else
  {
    id v6 = [v5 path];
    v7 = [MEMORY[0x1E4F1C9B8] data];
    [v8 createFileAtPath:v6 contents:v7 attributes:0];
  }
}

+ (id)_mailUninstalledFile
{
  BOOL v2 = +[EMPersistenceLayoutManager mailDataDirectory];
  BOOL v3 = [v2 URLByAppendingPathComponent:@"uninstalled"];

  return v3;
}

- (void)launchDaemon
{
  id v3 = [(EMDaemonInterface *)self proxyCreator];
  BOOL v2 = [v3 remoteObjectProxy];
  [v2 launchForAppLaunch:&__block_literal_global_326];
}

- (void)setAllowsBackgroundResume:(BOOL)a3
{
  if (self->_allowsBackgroundResume != a3)
  {
    BOOL v3 = a3;
    self->_allowsBackgroundResume = a3;
    id v5 = [(EMDaemonInterface *)self proxyCreator];
    id v4 = [v5 remoteObjectProxy];
    [v4 setAllowsBackgroundResume:v3];
  }
}

void __24__EMDaemonInterface_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  BOOL v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;
}

- (EMDaemonInterface)init
{
  return (EMDaemonInterface *)[(EMDaemonInterface *)self initAndConfigureBlockedSenderManager:0];
}

- (EMDaemonInterface)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
  id v6 = [(EMDaemonInterface *)self _initByAdoptingConnection:v5 useNegotiatedConnection:0 configureBlockedSenderManager:0];

  return v6;
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = +[EMDaemonInterface log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_cold_1((uint64_t)WeakRetained, v2);
    }

    [WeakRetained resetProtocolConnections];
  }
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = +[EMDaemonInterface log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_7_cold_1((uint64_t)WeakRetained, v2);
    }
  }
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDaemonAvailability];
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)EMDaemonInterface;
  id result = [(EMDaemonInterface *)&v3 init];
  if (result) {
    atomic_store(0, (unsigned __int8 *)result + 56);
  }
  return result;
}

- (void)dealloc
{
  [(EMDaemonInterface *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)EMDaemonInterface;
  [(EMDaemonInterface *)&v3 dealloc];
}

- (void)_invalidate
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    accountRepository = self->_accountRepository;
    self->_accountRepository = 0;

    mailboxRepository = self->_mailboxRepository;
    self->_mailboxRepository = 0;

    vipManager = self->_vipManager;
    self->_vipManager = 0;

    blockedSenderManager = self->_blockedSenderManager;
    self->_blockedSenderManager = 0;

    messageRepository = self->_messageRepository;
    self->_messageRepository = 0;

    fetchController = self->_fetchController;
    self->_fetchController = 0;

    outgoingMessageRepository = self->_outgoingMessageRepository;
    self->_outgoingMessageRepository = 0;

    senderRepository = self->_senderRepository;
    self->_senderRepository = 0;

    clientState = self->_clientState;
    self->_clientState = 0;

    searchableIndex = self->_searchableIndex;
    self->_searchableIndex = 0;

    interactionLogger = self->_interactionLogger;
    self->_interactionLogger = 0;

    activityRegistry = self->_activityRegistry;
    self->_activityRegistry = 0;

    diagnosticInfoGatherer = self->_diagnosticInfoGatherer;
    self->_diagnosticInfoGatherer = 0;

    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;

    [(EFCancelable *)self->_daemonLaunchToken cancel];
    daemonLaunchToken = self->_daemonLaunchToken;
    self->_daemonLaunchToken = 0;
  }
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EMDaemonInterface.m", 223, @"%s can only be called from unit tests", "-[EMDaemonInterface test_tearDown]");
  }
  id v4 = [(EMDaemonInterface *)self blockedSenderManager];
  objc_msgSend(v4, "test_tearDown");

  [(EMDaemonInterface *)self _invalidate];
}

- (NSXPCConnection)test_connection
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EMDaemonInterface.m", 229, @"%s can only be called from unit tests", "-[EMDaemonInterface test_connection]");
  }
  connection = self->_connection;
  return connection;
}

void __50__EMDaemonInterface__connectionForProtocol_error___block_invoke_321(uint64_t a1, void *a2)
{
}

- (void)resetProtocolConnections
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EMDaemonInterface_resetProtocolConnections__block_invoke;
  block[3] = &unk_1E63E26B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__EMDaemonInterface_resetProtocolConnections__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v1 = *(void *)(*(void *)(a1 + 32) + 32) == 0;
  char v2 = +[EMDaemonInterface log];
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v5;
      _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting remote connections", buf, 0xCu);
    }

    id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 52);
    os_unfair_lock_lock(v6);
    v7 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
    os_unfair_lock_unlock(v6);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    char v2 = v7;
    char v8 = 0;
    uint64_t v9 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v26;
      *(void *)&long long v10 = 138543618;
      long long v22 = v10;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v2);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v13, "reset", v22);
          if ([v13 prefersImmediateActivity])
          {
            v14 = +[EMDaemonInterface log];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v22;
              uint64_t v30 = v15;
              __int16 v31 = 2114;
              v32 = v13;
              _os_log_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ prefers immediate recovery, will force daemon relaunch", buf, 0x16u);
            }

            char v8 = 1;
          }
        }
        uint64_t v9 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v9);
    }

    uint64_t v16 = +[EMDaemonInterface log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v17;
      _os_log_impl(&dword_1BEFDB000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting for daemon re-launch", buf, 0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 32) = 1;
    if (v8)
    {
      long long v18 = +[EMDaemonInterface log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v19;
        _os_log_impl(&dword_1BEFDB000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending early launch recovery message", buf, 0xCu);
      }

      long long v20 = [*(id *)(a1 + 32) proxyCreator];
      uint64_t v21 = [v20 remoteObjectProxy];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __45__EMDaemonInterface_resetProtocolConnections__block_invoke_324;
      v24[3] = &unk_1E63E26B0;
      v24[4] = *(void *)(a1 + 32);
      [v21 launchForEarlyRecovery:v24];
    }
  }
  else if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Already waiting for daemon re-launch", buf, 0xCu);
  }
}

uint64_t __45__EMDaemonInterface_resetProtocolConnections__block_invoke_324(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDaemonAvailability];
}

- (BOOL)allowsBackgroundResume
{
  return self->_allowsBackgroundResume;
}

+ (BOOL)cachedMailAppIsInstalled
{
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [a1 _mailUninstalledFile];
  uint64_t v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5] ^ 1;

  return v6;
}

- (void)repopulateBusinessesTables
{
  id v3 = [(EMDaemonInterface *)self proxyCreator];
  char v2 = [v3 remoteObjectProxy];
  [v2 repopulateBusinessesTables];
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return (EMBlockedSenderManager *)objc_getProperty(self, a2, 144, 1);
}

- (EMSearchableIndex)searchableIndex
{
  return (EMSearchableIndex *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoGatherer, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_activityRegistry, 0);
  objc_storeStrong((id *)&self->_interactionLogger, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
  objc_storeStrong((id *)&self->_accountRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_daemonLaunchToken, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Connection Interrupted (recoverable)", (uint8_t *)&v3, 0xCu);
}

void __101__EMDaemonInterface__initByAdoptingConnection_useNegotiatedConnection_configureBlockedSenderManager___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_FAULT, "%{public}@: Connection Invalidated", (uint8_t *)&v3, 0xCu);
}

@end
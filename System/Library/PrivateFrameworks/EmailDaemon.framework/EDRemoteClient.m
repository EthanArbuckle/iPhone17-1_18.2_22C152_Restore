@interface EDRemoteClient
+ (NSXPCInterface)exportedInterface;
+ (OS_os_log)log;
- (EDAccountRepository)accountRepository;
- (EDActivityRegistry)activityRegistry;
- (EDClientResumer)clientResumer;
- (EDClientState)clientState;
- (EDDaemonInterfaceFactory)daemonInterfaceFactory;
- (EDDiagnosticInfoGatherer)diagnosticInfoGatherer;
- (EDFetchController)fetchController;
- (EDInteractionLogger)interactionLogger;
- (EDMailboxRepository)mailboxRepository;
- (EDMessageRepository)messageRepository;
- (EDOutgoingMessageRepository)outgoingMessageRepository;
- (EDRemoteClient)initWithConnection:(id)a3 daemonInterfaceFactory:(id)a4 serverRemoteClientsProvider:(id)a5;
- (EDSearchableIndex)searchableIndex;
- (EDSenderRepository)senderRepository;
- (EDServerRemoteClientsProvider)serverRemoteClientsProvider;
- (EMVIPManagerInterface)vipManagerInterface;
- (NSXPCConnection)clientConnection;
- (id)messageReconciliationQueries;
- (id)threadReconciliationQueries;
- (void)dealloc;
- (void)getAccountRepositoryInterface:(id)a3;
- (void)getActivityRegistryInterface:(id)a3;
- (void)getClientStateInterface:(id)a3;
- (void)getDiagnosticInfoGathererInterface:(id)a3;
- (void)getFetchControllerInterface:(id)a3;
- (void)getInteractionLoggerInterface:(id)a3;
- (void)getMailboxRepositoryInterface:(id)a3;
- (void)getMessageRepositoryInterface:(id)a3;
- (void)getOutgoingMessageRepositoryInterface:(id)a3;
- (void)getSearchableIndexInterface:(id)a3;
- (void)getSenderRepositoryInterface:(id)a3;
- (void)getVIPManagerInterface:(id)a3;
- (void)launchForAppLaunch:(id)a3;
- (void)launchForEarlyRecovery:(id)a3;
- (void)repopulateBusinessesTables;
- (void)setAllowsBackgroundResume:(BOOL)a3;
- (void)test_tearDown;
@end

@implementation EDRemoteClient

- (EDRemoteClient)initWithConnection:(id)a3 daemonInterfaceFactory:(id)a4 serverRemoteClientsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDRemoteClient;
  v12 = [(EDRemoteClient *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_clientConnection, a3);
    objc_storeStrong((id *)&v13->_daemonInterfaceFactory, a4);
    objc_storeWeak((id *)&v13->_serverRemoteClientsProvider, v11);
    uint64_t v14 = +[EDClientState sharedInstance];
    clientState = v13->_clientState;
    v13->_clientState = (EDClientState *)v14;
  }
  return v13;
}

+ (NSXPCInterface)exportedInterface
{
  if (exportedInterface_onceToken != -1) {
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)exportedInterface_exportedInterface;

  return (NSXPCInterface *)v2;
}

- (void)getFetchControllerInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self fetchController];
  v5[2](v5, v4);
}

- (void)getOutgoingMessageRepositoryInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self outgoingMessageRepository];
  v5[2](v5, v4);
}

- (EDOutgoingMessageRepository)outgoingMessageRepository
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  outgoingMessageRepository = self->_outgoingMessageRepository;
  if (!outgoingMessageRepository)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDOutgoingMessageRepository *)[v5 newOutgoingMessageRepository];
    v7 = self->_outgoingMessageRepository;
    self->_outgoingMessageRepository = v6;

    outgoingMessageRepository = self->_outgoingMessageRepository;
  }
  v8 = outgoingMessageRepository;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)getActivityRegistryInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self activityRegistry];
  v5[2](v5, v4);
}

- (EDActivityRegistry)activityRegistry
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  activityRegistry = self->_activityRegistry;
  if (!activityRegistry)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDActivityRegistry *)[v5 newActivityRegistry];
    v7 = self->_activityRegistry;
    self->_activityRegistry = v6;

    activityRegistry = self->_activityRegistry;
  }
  v8 = activityRegistry;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)getAccountRepositoryInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self accountRepository];
  v5[2](v5, v4);
}

- (EDAccountRepository)accountRepository
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accountRepository = self->_accountRepository;
  if (!accountRepository)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDAccountRepository *)[v5 newAccountRepository];
    v7 = self->_accountRepository;
    self->_accountRepository = v6;

    accountRepository = self->_accountRepository;
  }
  v8 = accountRepository;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)getMessageRepositoryInterface:(id)a3
{
  id v10 = (void (**)(id, id))a3;
  os_unfair_lock_lock(&self->_lock);
  messageRepository = self->_messageRepository;
  if (!messageRepository)
  {
    v5 = [[EDRemoteClientResumer alloc] initWithRemoteClient:self];
    v6 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v7 = (EDMessageRepository *)[v6 newMessageRepositoryWithResumable:v5];
    v8 = self->_messageRepository;
    self->_messageRepository = v7;

    messageRepository = self->_messageRepository;
  }
  id v9 = messageRepository;
  os_unfair_lock_unlock(&self->_lock);
  v10[2](v10, v9);
}

- (void)getMailboxRepositoryInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self mailboxRepository];
  v5[2](v5, v4);
}

- (EDMailboxRepository)mailboxRepository
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mailboxRepository = self->_mailboxRepository;
  if (!mailboxRepository)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDMailboxRepository *)[v5 newMailboxRepository];
    v7 = self->_mailboxRepository;
    self->_mailboxRepository = v6;

    mailboxRepository = self->_mailboxRepository;
  }
  v8 = mailboxRepository;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)getDiagnosticInfoGathererInterface:(id)a3
{
  id v10 = (void (**)(id, id))a3;
  os_unfair_lock_lock(&self->_lock);
  diagnosticInfoGatherer = self->_diagnosticInfoGatherer;
  if (!diagnosticInfoGatherer)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = [(EDRemoteClient *)self serverRemoteClientsProvider];
    v7 = (EDDiagnosticInfoGatherer *)[v5 newDiagnosticInfoGathererWithServerRemoteClientsProvider:v6];
    v8 = self->_diagnosticInfoGatherer;
    self->_diagnosticInfoGatherer = v7;

    diagnosticInfoGatherer = self->_diagnosticInfoGatherer;
  }
  id v9 = diagnosticInfoGatherer;
  os_unfair_lock_unlock(&self->_lock);
  v10[2](v10, v9);
}

- (EDServerRemoteClientsProvider)serverRemoteClientsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverRemoteClientsProvider);

  return (EDServerRemoteClientsProvider *)WeakRetained;
}

- (EDFetchController)fetchController
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchController = self->_fetchController;
  if (!fetchController)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDFetchController *)[v5 newFetchController];
    v7 = self->_fetchController;
    self->_fetchController = v6;

    fetchController = self->_fetchController;
  }
  v8 = fetchController;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (EDDaemonInterfaceFactory)daemonInterfaceFactory
{
  return self->_daemonInterfaceFactory;
}

- (void)launchForAppLaunch:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[EDRemoteClient log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "app requested early daemon launch", v7, 2u);
  }

  v4[2](v4);
  v6 = [(EDDaemonInterfaceFactory *)self->_daemonInterfaceFactory persistence];
  +[EDTruncateMailboxUpgradeStep presentNeedlessAlertIfNecessaryWithPersistence:v6];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__EDRemoteClient_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_76 != -1) {
    dispatch_once(&log_onceToken_76, block);
  }
  v2 = (void *)log_log_76;

  return (OS_os_log *)v2;
}

- (void)getClientStateInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self clientState];
  v5[2](v5, v4);
}

- (void)setAllowsBackgroundResume:(BOOL)a3
{
  clientResumer = self->_clientResumer;
  if (a3)
  {
    if (clientResumer) {
      return;
    }
    daemonInterfaceFactory = self->_daemonInterfaceFactory;
    id v9 = [(EDRemoteClient *)self clientState];
    v7 = -[EDDaemonInterfaceFactory newClientResumerWithClientState:](daemonInterfaceFactory, "newClientResumerWithClientState:");
    v8 = self->_clientResumer;
    self->_clientResumer = v7;

    v5 = v9;
  }
  else
  {
    [(EDClientResumer *)clientResumer invalidate];
    v5 = self->_clientResumer;
    self->_clientResumer = 0;
  }
}

- (EDClientState)clientState
{
  return self->_clientState;
}

void __21__EDRemoteClient_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_76;
  log_log_76 = (uint64_t)v1;
}

void __35__EDRemoteClient_exportedInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60270] remoteObjectInterface];
  os_log_t v1 = (void *)exportedInterface_exportedInterface;
  exportedInterface_exportedInterface = v0;
}

- (void)dealloc
{
  [(EDClientResumer *)self->_clientResumer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)EDRemoteClient;
  [(EDRemoteClient *)&v3 dealloc];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDRemoteClient.m", 102, @"%s can only be called from unit tests", "-[EDRemoteClient test_tearDown]");
  }
  messageRepository = self->_messageRepository;

  [(EDMessageRepository *)messageRepository test_tearDown];
}

- (EDSenderRepository)senderRepository
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  senderRepository = self->_senderRepository;
  if (!senderRepository)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDSenderRepository *)[v5 newSenderRepository];
    v7 = self->_senderRepository;
    self->_senderRepository = v6;

    senderRepository = self->_senderRepository;
  }
  v8 = senderRepository;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (EDSearchableIndex)searchableIndex
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  searchableIndex = self->_searchableIndex;
  if (!searchableIndex)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EDSearchableIndex *)[v5 newSearchableIndex];
    v7 = self->_searchableIndex;
    self->_searchableIndex = v6;

    searchableIndex = self->_searchableIndex;
  }
  v8 = searchableIndex;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (EDInteractionLogger)interactionLogger
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionLogger = self->_interactionLogger;
  if (!interactionLogger)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = [v5 sharedInteractionLogger];
    v7 = self->_interactionLogger;
    self->_interactionLogger = v6;

    interactionLogger = self->_interactionLogger;
  }
  v8 = interactionLogger;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (EMVIPManagerInterface)vipManagerInterface
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  vipManagerInterface = self->_vipManagerInterface;
  if (!vipManagerInterface)
  {
    v5 = [(EDRemoteClient *)self daemonInterfaceFactory];
    v6 = (EMVIPManagerInterface *)[v5 newVIPManagerInterface];
    v7 = self->_vipManagerInterface;
    self->_vipManagerInterface = v6;

    vipManagerInterface = self->_vipManagerInterface;
  }
  v8 = vipManagerInterface;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)getSearchableIndexInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self searchableIndex];
  v5[2](v5, v4);
}

- (void)getInteractionLoggerInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self interactionLogger];
  v5[2](v5, v4);
}

- (void)repopulateBusinessesTables
{
  id v3 = [(EDDaemonInterfaceFactory *)self->_daemonInterfaceFactory persistence];
  v2 = [v3 businessPersistence];
  [v2 repopulateBusinessesTables];
}

- (void)getVIPManagerInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self vipManagerInterface];
  v5[2](v5, v4);
}

- (void)launchForEarlyRecovery:(id)a3
{
  id v3 = (void (**)(void))a3;
  v4 = +[EDRemoteClient log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "app requested early recovery path", v5, 2u);
  }

  v3[2](v3);
}

- (void)getSenderRepositoryInterface:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(EDRemoteClient *)self senderRepository];
  v5[2](v5, v4);
}

- (id)messageReconciliationQueries
{
  v2 = [(EDRemoteClient *)self messageRepository];
  id v3 = [v2 messageReconciliationQueries];

  return v3;
}

- (id)threadReconciliationQueries
{
  v2 = [(EDRemoteClient *)self messageRepository];
  id v3 = [v2 threadReconciliationQueries];

  return v3;
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (EDMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (EDClientResumer)clientResumer
{
  return self->_clientResumer;
}

- (EDDiagnosticInfoGatherer)diagnosticInfoGatherer
{
  return self->_diagnosticInfoGatherer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticInfoGatherer, 0);
  objc_storeStrong((id *)&self->_clientResumer, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_destroyWeak((id *)&self->_serverRemoteClientsProvider);
  objc_storeStrong((id *)&self->_daemonInterfaceFactory, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_activityRegistry, 0);
  objc_storeStrong((id *)&self->_vipManagerInterface, 0);
  objc_storeStrong((id *)&self->_interactionLogger, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);

  objc_storeStrong((id *)&self->_accountRepository, 0);
}

@end
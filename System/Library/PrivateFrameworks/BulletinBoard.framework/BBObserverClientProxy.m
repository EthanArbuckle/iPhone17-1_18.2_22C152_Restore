@interface BBObserverClientProxy
+ (id)xpcInterface;
- (BBObserverClientProxy)initWithServer:(id)a3 connection:(id)a4 calloutQueue:(id)a5;
- (BBObserverClientProxy)initWithServer:(id)a3 connection:(id)a4 queue:(id)a5 calloutQueue:(id)a6;
- (BBServer)server;
- (NSMutableDictionary)bulletinIDsToTransaction;
- (NSString)clientBundleIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)queue;
- (id)currentTransactionForBulletinID:(id)a3;
- (id)description;
- (id)transactionBulletinIDs;
- (unint64_t)incrementedTransactionIDForBulletinID:(id)a3;
- (void)clearBulletinIDs:(id)a3 inSection:(id)a4;
- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5;
- (void)clearSection:(id)a3;
- (void)dealloc;
- (void)finishedWithBulletinID:(id)a3 transactionID:(unint64_t)a4;
- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5;
- (void)getBulletinsWithHandler:(id)a3;
- (void)getObserverDebugInfo:(id)a3;
- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4;
- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3;
- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4;
- (void)getSectionInfoWithHandler:(id)a3;
- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4;
- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4;
- (void)handleResponse:(id)a3 withCompletion:(id)a4;
- (void)noteBulletinsLoadedForSectionID:(id)a3;
- (void)noteServerReceivedResponseForBulletin:(id)a3;
- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeeds:(unint64_t)a5;
- (void)removeSection:(id)a3;
- (void)removeTransaction:(id)a3;
- (void)requestNoticesBulletinsForAllSections;
- (void)requestNoticesBulletinsForSectionID:(id)a3;
- (void)setBulletinIDsToTransaction:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setObserverFeed:(unint64_t)a3 asLightsAndSirensGateway:(id)a4 priority:(unint64_t)a5;
- (void)setObserverFeed:(unint64_t)a3 attachToLightsAndSirensGateway:(id)a4;
- (void)setQueue:(id)a3;
- (void)setServer:(id)a3;
- (void)updateBulletin:(id)a3 withHandler:(id)a4;
- (void)updateGlobalSettings:(id)a3;
- (void)updateSectionInfo:(id)a3;
- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4;
@end

@implementation BBObserverClientProxy

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_128 != -1) {
    dispatch_once(&xpcInterface_onceToken_128, &__block_literal_global_131);
  }
  v2 = (void *)xpcInterface___interface_129;
  return v2;
}

uint64_t __37__BBObserverClientProxy_xpcInterface__block_invoke()
{
  xpcInterface___interface_129 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7BE448];
  return MEMORY[0x270F9A758]();
}

- (BBObserverClientProxy)initWithServer:(id)a3 connection:(id)a4 calloutQueue:(id)a5
{
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.bulletinboard.BBObserverClientProxy", v9);

  v14 = [(BBObserverClientProxy *)self initWithServer:v12 connection:v11 queue:v13 calloutQueue:v10];
  return v14;
}

- (BBObserverClientProxy)initWithServer:(id)a3 connection:(id)a4 queue:(id)a5 calloutQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BBObserverClientProxy;
  v14 = [(BBObserverClientProxy *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeStrong((id *)&v15->_calloutQueue, a6);
    [(BBObserverClientProxy *)v15 setConnection:v11];
    [(BBObserverClientProxy *)v15 setServer:v10];
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bulletinIDsToTransaction = v15->_bulletinIDsToTransaction;
    v15->_bulletinIDsToTransaction = v16;
  }
  return v15;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(BBObserverClientProxy *)self server];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_bulletinIDsToTransaction;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 clearBulletinIDIfPossible:*(void *)(*((void *)&v10 + 1) + 8 * v8++) rescheduleExpirationTimer:1];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v9.receiver = self;
  v9.super_class = (Class)BBObserverClientProxy;
  [(BBObserverClientProxy *)&v9 dealloc];
}

- (NSString)clientBundleIdentifier
{
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if (!clientBundleIdentifier)
  {
    [(NSXPCConnection *)self->_connection processIdentifier];
    v4 = BSBundleIDForPID();
    [(BBObserverClientProxy *)self setClientBundleIdentifier:v4];

    clientBundleIdentifier = self->_clientBundleIdentifier;
  }
  return clientBundleIdentifier;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BBObserverClientProxy *)self clientBundleIdentifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p [%@]>", v4, self, v5];

  return v6;
}

- (void)removeTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 bulletinID];
  uint64_t v7 = [(BBObserverClientProxy *)self currentTransactionForBulletinID:v6];

  uint64_t v8 = [v7 transactionID];
  if (v8 == [v4 transactionID])
  {
    bulletinIDsToTransaction = self->_bulletinIDsToTransaction;
    long long v10 = [v4 bulletinID];
    [(NSMutableDictionary *)bulletinIDsToTransaction removeObjectForKey:v10];
  }
  else if (v7)
  {
    long long v11 = BBLogBulletinLife;
    if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "asked to remove a transaction (%{public}@) but our transaction (%{public}@) doesn't match IDs", (uint8_t *)&v12, 0x16u);
    }
  }

  objc_sync_exit(v5);
}

- (id)transactionBulletinIDs
{
  v3 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_bulletinIDsToTransaction allKeys];
  objc_sync_exit(v3);

  return v4;
}

- (id)currentTransactionForBulletinID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_bulletinIDsToTransaction objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (unint64_t)incrementedTransactionIDForBulletinID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v5);
  uint64_t v6 = [(BBObserverClientProxy *)self currentTransactionForBulletinID:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    [(BBBulletinTransaction *)v6 incrementTransactionID];
  }
  else
  {
    uint64_t v7 = [[BBBulletinTransaction alloc] initWithBulletinID:v4];
    [(NSMutableDictionary *)self->_bulletinIDsToTransaction setObject:v7 forKey:v4];
  }
  unint64_t v8 = [(BBBulletinTransaction *)v7 transactionID];

  objc_sync_exit(v5);
  return v8;
}

- (void)updateBulletin:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke;
  block[3] = &unk_264296260;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_2;
  v5[3] = &unk_264297D88;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 updateBulletin:v3 withHandler:v5];
}

void __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_3;
    block[3] = &unk_264297CC0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)updateSectionInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BBObserverClientProxy_updateSectionInfo___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__BBObserverClientProxy_updateSectionInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 updateSectionInfo:*(void *)(a1 + 40)];
}

- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBObserverClientProxy_updateSectionParameters_forSectionID___block_invoke;
  block[3] = &unk_264296418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __62__BBObserverClientProxy_updateSectionParameters_forSectionID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) remoteObjectProxy];
  [v2 updateSectionParameters:a1[5] forSectionID:a1[6]];
}

- (void)removeSection:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 removeSection:v4];
}

- (void)updateGlobalSettings:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BBObserverClientProxy_updateGlobalSettings___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__BBObserverClientProxy_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 updateGlobalSettings:*(void *)(a1 + 40)];
}

- (void)noteServerReceivedResponseForBulletin:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BBObserverClientProxy_noteServerReceivedResponseForBulletin___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__BBObserverClientProxy_noteServerReceivedResponseForBulletin___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 noteServerReceivedResponseForBulletin:*(void *)(a1 + 40)];
}

- (void)noteBulletinsLoadedForSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BBObserverClientProxy_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__BBObserverClientProxy_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 noteBulletinsLoadedForSectionID:*(void *)(a1 + 40)];
}

- (void)getObserverDebugInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BBObserverClientProxy_getObserverDebugInfo___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__BBObserverClientProxy_getObserverDebugInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 getObserverDebugInfo:*(void *)(a1 + 40)];
}

- (void)setObserverFeed:(unint64_t)a3 attachToLightsAndSirensGateway:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BBObserverClientProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke;
  block[3] = &unk_2642962B0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __72__BBObserverClientProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) setObserverFeed:*(void *)(a1 + 48) attachToLightsAndSirensGateway:*(void *)(a1 + 40)];
}

- (void)setObserverFeed:(unint64_t)a3 asLightsAndSirensGateway:(id)a4 priority:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__BBObserverClientProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke;
  v11[3] = &unk_264297C98;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __75__BBObserverClientProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) setObserverFeed:*(void *)(a1 + 48) asLightsAndSirensGateway:*(void *)(a1 + 40) priority:*(void *)(a1 + 56)];
}

- (void)handleResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BBObserverClientProxy_handleResponse_withCompletion___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __55__BBObserverClientProxy_handleResponse_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = v2;
    id v6 = [v3 server];
    int v8 = 138543874;
    id v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling response %{public}@ with server %{public}@", (uint8_t *)&v8, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) server];
  [v7 observer:*(void *)(a1 + 32) handleResponse:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)finishedWithBulletinID:(id)a3 transactionID:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBObserverClientProxy_finishedWithBulletinID_transactionID___block_invoke;
  block[3] = &unk_2642962B0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __62__BBObserverClientProxy_finishedWithBulletinID_transactionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) finishedWithBulletinID:*(void *)(a1 + 40) transactionID:*(void *)(a1 + 48)];
}

- (void)clearSection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__BBObserverClientProxy_clearSection___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__BBObserverClientProxy_clearSection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) clearSection:*(void *)(a1 + 40)];
}

- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__BBObserverClientProxy_clearBulletinsFromDate_toDate_inSections___block_invoke;
  v15[3] = &unk_2642966D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __66__BBObserverClientProxy_clearBulletinsFromDate_toDate_inSections___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) clearBulletinsFromDate:*(void *)(a1 + 40) toDate:*(void *)(a1 + 48) inSections:*(void *)(a1 + 56)];
}

- (void)clearBulletinIDs:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BBObserverClientProxy_clearBulletinIDs_inSection___block_invoke;
  block[3] = &unk_264296418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__BBObserverClientProxy_clearBulletinIDs_inSection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) clearBulletinIDs:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
}

- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeeds:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__BBObserverClientProxy_removeBulletins_inSection_fromFeeds___block_invoke;
  v13[3] = &unk_264296598;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __61__BBObserverClientProxy_removeBulletins_inSection_fromFeeds___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) removeBulletins:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48) fromFeeds:*(void *)(a1 + 56)];
}

- (void)requestNoticesBulletinsForSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__BBObserverClientProxy_requestNoticesBulletinsForSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__BBObserverClientProxy_requestNoticesBulletinsForSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) requestNoticesBulletinsForSectionID:*(void *)(a1 + 40)];
}

- (void)requestNoticesBulletinsForAllSections
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBObserverClientProxy_requestNoticesBulletinsForAllSections__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __62__BBObserverClientProxy_requestNoticesBulletinsForAllSections__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 requestNoticesBulletinsForAllSections:*(void *)(a1 + 32)];
}

- (void)getSectionInfoWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__BBObserverClientProxy_getSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__BBObserverClientProxy_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) getSectionInfoWithHandler:*(void *)(a1 + 40)];
}

- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__BBObserverClientProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __68__BBObserverClientProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) getSectionInfoForActiveSectionsWithHandler:*(void *)(a1 + 40)];
}

- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BBObserverClientProxy_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __65__BBObserverClientProxy_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 observer:*(void *)(a1 + 32) getSectionInfoForSectionIDs:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__BBObserverClientProxy_getSectionParametersForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __70__BBObserverClientProxy_getSectionParametersForSectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 getSectionParametersForSectionID:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BBObserverClientProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__BBObserverClientProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 getUniversalSectionIDForSectionID:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (void)getBulletinsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BBObserverClientProxy_getBulletinsWithHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__BBObserverClientProxy_getBulletinsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 getBulletinsWithHandler:*(void *)(a1 + 40)];
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__BBObserverClientProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __87__BBObserverClientProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 getPublisherMatchIDsOfBulletinsPublishedAfterDate:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__BBObserverClientProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke;
  v15[3] = &unk_264296210;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __80__BBObserverClientProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 getBulletinsForPublisherMatchIDs:*(void *)(a1 + 40) sectionID:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 56)];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BBServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (BBServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
}

- (NSMutableDictionary)bulletinIDsToTransaction
{
  return self->_bulletinIDsToTransaction;
}

- (void)setBulletinIDsToTransaction:(id)a3
{
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bulletinIDsToTransaction, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
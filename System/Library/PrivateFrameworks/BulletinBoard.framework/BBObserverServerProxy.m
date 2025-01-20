@interface BBObserverServerProxy
+ (id)xpcInterface;
- (BBObserver)observer;
- (BBObserverServerProxy)initWithObserver:(id)a3 connection:(id)a4 queue:(id)a5 calloutQueue:(id)a6;
- (BOOL)established;
- (BOOL)isValid;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)queue;
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
- (void)invalidate;
- (void)noteBulletinsLoadedForSectionID:(id)a3;
- (void)noteServerReceivedResponseForBulletin:(id)a3;
- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeeds:(unint64_t)a5;
- (void)removeSection:(id)a3;
- (void)requestNoticesBulletinsForAllSections;
- (void)requestNoticesBulletinsForSectionID:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setObserver:(id)a3;
- (void)setObserverFeed:(unint64_t)a3 asLightsAndSirensGateway:(id)a4 priority:(unint64_t)a5;
- (void)setObserverFeed:(unint64_t)a3 attachToLightsAndSirensGateway:(id)a4;
- (void)setQueue:(id)a3;
- (void)updateBulletin:(id)a3 withHandler:(id)a4;
- (void)updateGlobalSettings:(id)a3;
- (void)updateSectionInfo:(id)a3;
- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4;
@end

@implementation BBObserverServerProxy

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_1 != -1) {
    dispatch_once(&xpcInterface_onceToken_1, &__block_literal_global_24);
  }
  v2 = (void *)xpcInterface___interface_1;
  return v2;
}

void __37__BBObserverServerProxy_xpcInterface__block_invoke()
{
  v66[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7BE5A0];
  v1 = (void *)xpcInterface___interface_1;
  xpcInterface___interface_1 = v0;

  v2 = (void *)xpcInterface___interface_1;
  v3 = (void *)MEMORY[0x263EFFA08];
  v66[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_clearSection_ argumentIndex:0 ofReply:0];

  v6 = (void *)xpcInterface___interface_1;
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v65 = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
  v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_clearBulletinsFromDate_toDate_inSections_ argumentIndex:0 ofReply:0];

  v10 = (void *)xpcInterface___interface_1;
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v64 = objc_opt_class();
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_clearBulletinsFromDate_toDate_inSections_ argumentIndex:1 ofReply:0];

  v14 = (void *)xpcInterface___interface_1;
  v15 = (void *)MEMORY[0x263EFFA08];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
  v17 = [v15 setWithArray:v16];
  [v14 setClasses:v17 forSelector:sel_clearBulletinsFromDate_toDate_inSections_ argumentIndex:2 ofReply:0];

  v18 = (void *)xpcInterface___interface_1;
  v19 = (void *)MEMORY[0x263EFFA08];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  v21 = [v19 setWithArray:v20];
  [v18 setClasses:v21 forSelector:sel_clearBulletinIDs_inSection_ argumentIndex:0 ofReply:0];

  v22 = (void *)xpcInterface___interface_1;
  v23 = (void *)MEMORY[0x263EFFA08];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
  v25 = [v23 setWithArray:v24];
  [v22 setClasses:v25 forSelector:sel_clearBulletinIDs_inSection_ argumentIndex:0 ofReply:0];

  v26 = (void *)xpcInterface___interface_1;
  v27 = (void *)MEMORY[0x263EFFA08];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  v29 = [v27 setWithArray:v28];
  [v26 setClasses:v29 forSelector:sel_removeBulletins_inSection_fromFeeds_ argumentIndex:0 ofReply:0];

  v30 = (void *)xpcInterface___interface_1;
  v31 = (void *)MEMORY[0x263EFFA08];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
  v33 = [v31 setWithArray:v32];
  [v30 setClasses:v33 forSelector:sel_getSectionInfoWithHandler_ argumentIndex:0 ofReply:1];

  v34 = (void *)xpcInterface___interface_1;
  v35 = (void *)MEMORY[0x263EFFA08];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  v37 = [v35 setWithArray:v36];
  [v34 setClasses:v37 forSelector:sel_getSectionInfoForActiveSectionsWithHandler_ argumentIndex:0 ofReply:1];

  v38 = (void *)xpcInterface___interface_1;
  v39 = (void *)MEMORY[0x263EFFA08];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
  v41 = [v39 setWithArray:v40];
  [v38 setClasses:v41 forSelector:sel_getSectionInfoForSectionIDs_withHandler_ argumentIndex:0 ofReply:0];

  v42 = (void *)xpcInterface___interface_1;
  v43 = (void *)MEMORY[0x263EFFA08];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  v45 = [v43 setWithArray:v44];
  [v42 setClasses:v45 forSelector:sel_getSectionInfoForSectionIDs_withHandler_ argumentIndex:0 ofReply:1];

  v46 = (void *)xpcInterface___interface_1;
  v47 = (void *)MEMORY[0x263EFFA08];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  v49 = [v47 setWithArray:v48];
  [v46 setClasses:v49 forSelector:sel_getBulletinsForPublisherMatchIDs_sectionID_withHandler_ argumentIndex:0 ofReply:1];

  v50 = (void *)xpcInterface___interface_1;
  v51 = (void *)MEMORY[0x263EFFA08];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  v53 = [v51 setWithArray:v52];
  [v50 setClasses:v53 forSelector:sel_getBulletinsWithHandler_ argumentIndex:0 ofReply:1];
}

- (BBObserverServerProxy)initWithObserver:(id)a3 connection:(id)a4 queue:(id)a5 calloutQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)BBObserverServerProxy;
  v14 = [(BBObserverServerProxy *)&v32 init];
  v15 = v14;
  if (v14)
  {
    [(BBObserverServerProxy *)v14 setObserver:v10];
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_storeStrong((id *)&v15->_calloutQueue, a6);
    *(_WORD *)&v15->_isValid = 257;
    objc_storeStrong((id *)&v15->_connection, a4);
    connection = v15->_connection;
    v17 = [(id)objc_opt_class() xpcInterface];
    [(NSXPCConnection *)connection setRemoteObjectInterface:v17];

    v18 = v15->_connection;
    v19 = +[BBObserverClientProxy xpcInterface];
    [(NSXPCConnection *)v18 setExportedInterface:v19];

    [(NSXPCConnection *)v15->_connection setExportedObject:v15];
    objc_initWeak(&location, v15);
    v20 = v15->_connection;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke;
    v29[3] = &unk_264295FE0;
    objc_copyWeak(&v30, &location);
    [(NSXPCConnection *)v20 setInvalidationHandler:v29];
    v21 = v15->_connection;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_60;
    v27[3] = &unk_264295FE0;
    objc_copyWeak(&v28, &location);
    [(NSXPCConnection *)v21 setInterruptionHandler:v27];
    [(NSXPCConnection *)v15->_connection resume];
    queue = v15->_queue;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_2;
    v24[3] = &unk_264295E50;
    id v25 = v10;
    v26 = v15;
    dispatch_async(queue, v24);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBObserverServerProxy (%{public}@) connection invalidated", (uint8_t *)&v3, 0xCu);
    }
    WeakRetained[4] = 0;
  }
}

void __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_60(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = WeakRetained;
      _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBObserverServerProxy (%{public}@) connection interrupted", buf, 0xCu);
    }
    *((unsigned char *)WeakRetained + 9) = 0;
    int v3 = WeakRetained[4];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_61;
    block[3] = &unk_264295E28;
    uint64_t v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_61(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 serverProxy:*(void *)(a1 + 32) connectionStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9)];
}

uint64_t __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) serverProxy:*(void *)(a1 + 40) connectionStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBObserverServerProxy;
  [(BBObserverServerProxy *)&v3 dealloc];
}

- (void)invalidate
{
  *(_WORD *)&self->_isValid = 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)established
{
  return self->_isEstablished;
}

- (void)setObserverFeed:(unint64_t)a3 attachToLightsAndSirensGateway:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BBObserverServerProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke;
  block[3] = &unk_2642962B0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __72__BBObserverServerProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) remoteObjectProxy];
  [v2 setObserverFeed:a1[6] attachToLightsAndSirensGateway:a1[5]];
}

- (void)setObserverFeed:(unint64_t)a3 asLightsAndSirensGateway:(id)a4 priority:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__BBObserverServerProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke;
  v11[3] = &unk_264297C98;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __75__BBObserverServerProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) remoteObjectProxy];
  [v2 setObserverFeed:a1[6] asLightsAndSirensGateway:a1[5] priority:a1[7]];
}

- (void)handleResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ handling response %{public}@", buf, 0x16u);
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_64;
  v7[3] = &unk_264296170;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  [v5 handleResponse:v6 withCompletion:v7];
}

void __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ response handling completed with success %d", buf, 0x12u);
  }
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_65;
    block[3] = &unk_264297CC0;
    id v12 = v8;
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)finishedWithBulletinID:(id)a3 transactionID:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBObserverServerProxy_finishedWithBulletinID_transactionID___block_invoke;
  block[3] = &unk_2642962B0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __62__BBObserverServerProxy_finishedWithBulletinID_transactionID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) remoteObjectProxy];
  [v2 finishedWithBulletinID:a1[5] transactionID:a1[6]];
}

- (void)clearSection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__BBObserverServerProxy_clearSection___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__BBObserverServerProxy_clearSection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  [v2 clearSection:*(void *)(a1 + 40)];
}

- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__BBObserverServerProxy_clearBulletinsFromDate_toDate_inSections___block_invoke;
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

void __66__BBObserverServerProxy_clearBulletinsFromDate_toDate_inSections___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) remoteObjectProxy];
  [v2 clearBulletinsFromDate:a1[5] toDate:a1[6] inSections:a1[7]];
}

- (void)clearBulletinIDs:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BBObserverServerProxy_clearBulletinIDs_inSection___block_invoke;
  block[3] = &unk_264296418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__BBObserverServerProxy_clearBulletinIDs_inSection___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) remoteObjectProxy];
  [v2 clearBulletinIDs:a1[5] inSection:a1[6]];
}

- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeeds:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__BBObserverServerProxy_removeBulletins_inSection_fromFeeds___block_invoke;
  v13[3] = &unk_264296598;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __61__BBObserverServerProxy_removeBulletins_inSection_fromFeeds___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) remoteObjectProxy];
  [v2 removeBulletins:a1[5] inSection:a1[6] fromFeeds:a1[7]];
}

- (void)requestNoticesBulletinsForSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__BBObserverServerProxy_requestNoticesBulletinsForSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__BBObserverServerProxy_requestNoticesBulletinsForSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  [v2 requestNoticesBulletinsForSectionID:*(void *)(a1 + 40)];
}

- (void)requestNoticesBulletinsForAllSections
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBObserverServerProxy_requestNoticesBulletinsForAllSections__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __62__BBObserverServerProxy_requestNoticesBulletinsForAllSections__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  [v1 requestNoticesBulletinsForAllSections];
}

- (void)getSectionInfoWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_2;
  v4[3] = &unk_264297CE8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getSectionInfoWithHandler:v4];
}

void __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_2;
  v4[3] = &unk_264297CE8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getSectionInfoForActiveSectionsWithHandler:v4];
}

void __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_2;
  v5[3] = &unk_264297CE8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 getSectionInfoForSectionIDs:v3 withHandler:v5];
}

void __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_2;
  v5[3] = &unk_264297D10;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 getSectionParametersForSectionID:v3 withHandler:v5];
}

void __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_2;
  v5[3] = &unk_264297D38;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 getUniversalSectionIDForSectionID:v3 withHandler:v5];
}

void __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getBulletinsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_2;
  v4[3] = &unk_264297CE8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getBulletinsWithHandler:v4];
}

void __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_2;
  v5[3] = &unk_264297D60;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 getPublisherMatchIDsOfBulletinsPublishedAfterDate:v3 withHandler:v5];
}

void __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke;
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

void __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_2;
  v6[3] = &unk_264297CE8;
  id v5 = *(id *)(a1 + 56);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 getBulletinsForPublisherMatchIDs:v3 sectionID:v4 withHandler:v6];
}

void __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_3;
    block[3] = &unk_264296570;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateBulletin:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke_2;
  v4[3] = &unk_2642979B8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 updateBulletin:v3 withReply:v4];
}

uint64_t __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)updateSectionInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BBObserverServerProxy_updateSectionInfo___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__BBObserverServerProxy_updateSectionInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 updateSectionInfo:*(void *)(a1 + 40)];
}

- (void)removeSection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__BBObserverServerProxy_removeSection___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __39__BBObserverServerProxy_removeSection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 removeSection:*(void *)(a1 + 40)];
}

- (void)updateGlobalSettings:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BBObserverServerProxy_updateGlobalSettings___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__BBObserverServerProxy_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 updateGlobalSettings:*(void *)(a1 + 40)];
}

- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBObserverServerProxy_updateSectionParameters_forSectionID___block_invoke;
  block[3] = &unk_264296418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __62__BBObserverServerProxy_updateSectionParameters_forSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 updateSectionParameters:*(void *)(a1 + 40) forSectionID:*(void *)(a1 + 48)];
}

- (void)noteServerReceivedResponseForBulletin:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BBObserverServerProxy_noteServerReceivedResponseForBulletin___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__BBObserverServerProxy_noteServerReceivedResponseForBulletin___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 noteServerReceivedResponseForBulletin:*(void *)(a1 + 40)];
}

- (void)noteBulletinsLoadedForSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BBObserverServerProxy_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__BBObserverServerProxy_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 noteBulletinsLoadedForSectionID:*(void *)(a1 + 40)];
}

- (void)getObserverDebugInfo:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(BBObserverServerProxy *)self observer];
  id v10 = [v5 delegate];

  id v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v10];
  v4[2](v4, v9);
}

- (BBObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (BBObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
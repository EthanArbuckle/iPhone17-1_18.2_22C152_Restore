@interface BBObserver
+ (id)gatewayWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6;
+ (id)observerWithQueue:(id)a3 calloutQueue:(id)a4 forGatewayName:(id)a5;
- (BBObserver)init;
- (BBObserver)initWithQueue:(id)a3;
- (BBObserver)initWithQueue:(id)a3 asGateway:(id)a4 priority:(unint64_t)a5;
- (BBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4;
- (BBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4 gatewayName:(id)a5 gatewayPriority:(unint64_t)a6 isGateway:(BOOL)a7 connection:(id)a8;
- (BBObserver)initWithQueue:(id)a3 forGateway:(id)a4;
- (BBObserverDelegate)delegate;
- (BOOL)isValid;
- (NSString)description;
- (NSString)gatewayName;
- (id)_initWithQueue:(id)a3 calloutQueue:(id)a4 gatewayName:(id)a5 gatewayPriority:(unint64_t)a6 isGateway:(BOOL)a7;
- (id)parametersForSectionID:(id)a3;
- (unint64_t)gatewayPriority;
- (unint64_t)observerFeed;
- (void)_queue_invalidate;
- (void)_queue_noteBulletinsLoadedForSectionID:(id)a3;
- (void)_queue_registerBulletin:(id)a3 withTransactionID:(unint64_t)a4;
- (void)_queue_serverProxy:(id)a3 connectionStateDidChange:(BOOL)a4;
- (void)_queue_updateAddBulletin:(id)a3 withReply:(id)a4;
- (void)_queue_updateBulletin:(id)a3 withReply:(id)a4;
- (void)_queue_updateModifyBulletin:(id)a3 withReply:(id)a4;
- (void)_queue_updateRemoveBulletin:(id)a3 withReply:(id)a4;
- (void)assertionExpired:(id)a3 transactionID:(unint64_t)a4;
- (void)clearBulletins:(id)a3 inSection:(id)a4;
- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5;
- (void)clearSection:(id)a3;
- (void)dealloc;
- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withCompletion:(id)a5;
- (void)getBulletinsWithCompletion:(id)a3;
- (void)getComposedImageSizeForAttachment:(id)a3 bulletin:(id)a4 withCompletion:(id)a5;
- (void)getParametersForSectionID:(id)a3 withCompletion:(id)a4;
- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withCompletion:(id)a4;
- (void)getSectionInfoForActiveSectionsWithCompletion:(id)a3;
- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4;
- (void)getSectionInfoWithCompletion:(id)a3;
- (void)getUniversalSectionIDForSectionID:(id)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)noteBulletinsLoadedForSectionID:(id)a3;
- (void)noteServerReceivedResponseForBulletin:(id)a3;
- (void)removeBulletins:(id)a3 inSection:(id)a4;
- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeed:(unint64_t)a5;
- (void)removeSection:(id)a3;
- (void)requestNoticesBulletinsForAllSections;
- (void)requestNoticesBulletinsForSectionID:(id)a3;
- (void)sendResponse:(id)a3;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withCompletionIncludingModifiedResponse:(id)a4;
- (void)serverProxy:(id)a3 connectionStateDidChange:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setObserverFeed:(unint64_t)a3;
- (void)updateBulletin:(id)a3 withReply:(id)a4;
- (void)updateGlobalSettings:(id)a3;
- (void)updateSectionInfo:(id)a3;
- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4;
@end

@implementation BBObserver

+ (id)gatewayWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) _initWithQueue:v12 calloutQueue:v11 gatewayName:v10 gatewayPriority:a6 isGateway:1];

  return v13;
}

+ (id)observerWithQueue:(id)a3 calloutQueue:(id)a4 forGatewayName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithQueue:v10 calloutQueue:v9 gatewayName:v8 gatewayPriority:0 isGateway:0];

  return v11;
}

- (BBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4
{
  return (BBObserver *)[(BBObserver *)self _initWithQueue:a3 calloutQueue:a4 gatewayName:@"BBObserverGatewayLocalName" gatewayPriority:0 isGateway:0];
}

- (id)_initWithQueue:(id)a3 calloutQueue:(id)a4 gatewayName:(id)a5 gatewayPriority:(unint64_t)a6 isGateway:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = (objc_class *)MEMORY[0x263F08D68];
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[[v12 alloc] initWithMachServiceName:@"com.apple.bulletinboard.observerconnection" options:0];
  v17 = [(BBObserver *)self initWithQueue:v15 calloutQueue:v14 gatewayName:v13 gatewayPriority:a6 isGateway:v7 connection:v16];

  return v17;
}

- (BBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4 gatewayName:(id)a5 gatewayPriority:(unint64_t)a6 isGateway:(BOOL)a7 connection:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v40.receiver = self;
  v40.super_class = (Class)BBObserver;
  v18 = [(BBObserver *)&v40 init];
  if (v18)
  {
    if (v14)
    {
      v19 = (OS_dispatch_queue *)v14;
      queue = v18->_queue;
      v18->_queue = v19;
    }
    else
    {
      v21 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v22 = MEMORY[0x263EF83A0];
      queue = v18->_queue;
      v18->_queue = v21;
    }

    if (v15)
    {
      v23 = (OS_dispatch_queue *)v15;
      calloutQueue = v18->_calloutQueue;
      v18->_calloutQueue = v23;
    }
    else
    {
      v25 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v26 = MEMORY[0x263EF83A0];
      calloutQueue = v18->_calloutQueue;
      v18->_calloutQueue = v25;
    }

    uint64_t v27 = BBPrepareQueueForSafeSync(v18->_queue);
    v28 = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v27;

    uint64_t v29 = [v16 copy];
    gatewayName = v18->_gatewayName;
    v18->_gatewayName = (NSString *)v29;

    v18->_gatewayPriority = a6;
    v18->_isGateway = a7;
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sectionParametersBySectionID = v18->_sectionParametersBySectionID;
    v18->_sectionParametersBySectionID = v31;

    uint64_t v33 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
    bulletinLifeAssertions = v18->_bulletinLifeAssertions;
    v18->_bulletinLifeAssertions = (NSMapTable *)v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    remainingFeedsByBulletinID = v18->_remainingFeedsByBulletinID;
    v18->_remainingFeedsByBulletinID = v35;

    v37 = [[BBObserverServerProxy alloc] initWithObserver:v18 connection:v17 queue:v18->_queue calloutQueue:v18->_calloutQueue];
    serverProxy = v18->_serverProxy;
    v18->_serverProxy = v37;
  }
  return v18;
}

- (void)dealloc
{
  [(BBObserverServerProxy *)self->_serverProxy invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBObserver;
  [(BBObserver *)&v3 dealloc];
}

- (void)invalidate
{
  [(BBObserverServerProxy *)self->_serverProxy invalidate];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__BBObserver_invalidate__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_async(calloutQueue, block);
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__BBObserver_invalidate__block_invoke_2;
  v5[3] = &unk_264295E28;
  v5[4] = self;
  dispatch_async(queue, v5);
}

id __24__BBObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), 0);
}

uint64_t __24__BBObserver_invalidate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invalidate");
}

- (void)_queue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableDictionary *)self->_sectionParametersBySectionID removeAllObjects];
  bulletinLifeAssertions = self->_bulletinLifeAssertions;
  [(NSMapTable *)bulletinLifeAssertions removeAllObjects];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = v3;
  unint64_t observerFeed = self->_observerFeed;
  if (observerFeed)
  {
    [v3 addObject:@"notices"];
    unint64_t observerFeed = self->_observerFeed;
    if ((observerFeed & 2) == 0)
    {
LABEL_3:
      if ((observerFeed & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((observerFeed & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"banner"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 4) == 0)
  {
LABEL_4:
    if ((observerFeed & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v4 addObject:@"modal alert"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 8) == 0)
  {
LABEL_5:
    if ((observerFeed & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v4 addObject:@"lockscreen"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x8000) == 0)
  {
LABEL_6:
    if ((observerFeed & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 addObject:@"highlights"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x10) == 0)
  {
LABEL_7:
    if ((observerFeed & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v4 addObject:@"sound"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x20) == 0)
  {
LABEL_8:
    if ((observerFeed & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v4 addObject:@"locked banner"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x40) == 0)
  {
LABEL_9:
    if ((observerFeed & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v4 addObject:@"locked modal alert"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x80) == 0)
  {
LABEL_10:
    if ((observerFeed & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v4 addObject:@"car"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x4000) == 0)
  {
LABEL_11:
    if ((observerFeed & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 addObject:@"remote notifications"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x400) == 0)
  {
LABEL_12:
    if ((observerFeed & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v4 addObject:@"forwarding"];
  unint64_t observerFeed = self->_observerFeed;
  if ((observerFeed & 0x200) == 0)
  {
LABEL_13:
    if (!observerFeed) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_28:
  [v4 addObject:@"settings"];
  if (self->_observerFeed) {
LABEL_14:
  }
    [v4 addObject:@"display"];
LABEL_15:
  if ([v4 count])
  {
    v6 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    v6 = @"(none)";
  }
  BOOL v7 = NSString;
  uint64_t v8 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [v7 stringWithFormat:@"<%@ %p; feeds: %@; delegate: %@>", v8, self, v6, objc_opt_class()];

  return (NSString *)v10;
}

- (void)setObserverFeed:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__BBObserver_setObserverFeed___block_invoke;
  v4[3] = &unk_264296080;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __30__BBObserver_setObserverFeed___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 72);
  uint64_t v4 = *(void *)(v1 + 80);
  if (*(unsigned char *)(v1 + 56)) {
    return [v2 setObserverFeed:v3 asLightsAndSirensGateway:v4 priority:*(void *)(v1 + 88)];
  }
  else {
    return [v2 setObserverFeed:v3 attachToLightsAndSirensGateway:v4];
  }
}

- (BOOL)isValid
{
  return [(BBObserverServerProxy *)self->_serverProxy isValid];
}

- (void)getSectionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  serverProxy = self->_serverProxy;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BBObserver_getSectionInfoWithCompletion___block_invoke;
  v7[3] = &unk_2642960A8;
  id v8 = v4;
  id v6 = v4;
  [(BBObserverServerProxy *)serverProxy getSectionInfoWithHandler:v7];
}

void __43__BBObserver_getSectionInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

- (void)getSectionInfoForActiveSectionsWithCompletion:(id)a3
{
  id v4 = a3;
  serverProxy = self->_serverProxy;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__BBObserver_getSectionInfoForActiveSectionsWithCompletion___block_invoke;
  v7[3] = &unk_2642960A8;
  id v8 = v4;
  id v6 = v4;
  [(BBObserverServerProxy *)serverProxy getSectionInfoForActiveSectionsWithHandler:v7];
}

void __60__BBObserver_getSectionInfoForActiveSectionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__BBObserver_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  v9[3] = &unk_2642960A8;
  id v10 = v6;
  id v8 = v6;
  [(BBObserverServerProxy *)serverProxy getSectionInfoForSectionIDs:a3 withHandler:v9];
}

void __57__BBObserver_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)requestNoticesBulletinsForSectionID:(id)a3
{
}

- (void)requestNoticesBulletinsForAllSections
{
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__BBObserver_getUniversalSectionIDForSectionID_withCompletion___block_invoke;
  v9[3] = &unk_2642960D0;
  id v10 = v6;
  id v8 = v6;
  [(BBObserverServerProxy *)serverProxy getUniversalSectionIDForSectionID:a3 withHandler:v9];
}

uint64_t __63__BBObserver_getUniversalSectionIDForSectionID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBulletinsWithCompletion:(id)a3
{
  id v4 = a3;
  serverProxy = self->_serverProxy;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__BBObserver_getBulletinsWithCompletion___block_invoke;
  v7[3] = &unk_2642960F8;
  id v8 = v4;
  id v6 = v4;
  [(BBObserverServerProxy *)serverProxy getBulletinsWithHandler:v7];
}

uint64_t __41__BBObserver_getBulletinsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__BBObserver_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withCompletion___block_invoke;
  v9[3] = &unk_264296120;
  id v10 = v6;
  id v8 = v6;
  [(BBObserverServerProxy *)serverProxy getPublisherMatchIDsOfBulletinsPublishedAfterDate:a3 withHandler:v9];
}

uint64_t __79__BBObserver_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  serverProxy = self->_serverProxy;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__BBObserver_getBulletinsForPublisherMatchIDs_sectionID_withCompletion___block_invoke;
  v11[3] = &unk_2642960F8;
  id v12 = v8;
  id v10 = v8;
  [(BBObserverServerProxy *)serverProxy getBulletinsForPublisherMatchIDs:a3 sectionID:a4 withHandler:v11];
}

uint64_t __72__BBObserver_getBulletinsForPublisherMatchIDs_sectionID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendResponse:(id)a3
{
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__BBObserver_sendResponse_withCompletion___block_invoke;
  v8[3] = &unk_264296148;
  id v9 = v6;
  id v7 = v6;
  [(BBObserver *)self sendResponse:a3 withCompletionIncludingModifiedResponse:v8];
}

uint64_t __42__BBObserver_sendResponse_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendResponse:(id)a3 withCompletionIncludingModifiedResponse:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = (char *)a3;
  id v8 = (void (**)(id, void, id))a4;
  id v9 = (void *)BBLogGeneral;
  if (!self->_serverProxy)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      id v15 = v9;
      id v16 = objc_opt_class();
      id v17 = v16;
      *(_DWORD *)buf = 138412802;
      v21 = v16;
      __int16 v22 = 2080;
      Name = sel_getName(a2);
      __int16 v24 = 2112;
      v25 = (BBObserverServerProxy *)v7;
      _os_log_error_impl(&dword_217675000, v15, OS_LOG_TYPE_ERROR, "%@-%s: attempting to send a response through an invalidated connection -> %@", buf, 0x20u);

      if (!v8) {
        goto LABEL_8;
      }
    }
    else if (!v8)
    {
      goto LABEL_8;
    }
    v8[2](v8, 0, v7);
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = objc_opt_class();
    serverProxy = self->_serverProxy;
    *(_DWORD *)buf = 138412802;
    v21 = v11;
    __int16 v22 = 2112;
    Name = v7;
    __int16 v24 = 2112;
    v25 = serverProxy;
    id v13 = v11;
    _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "%@: Sending response %@ through server proxy %@", buf, 0x20u);
  }
  id v14 = self->_serverProxy;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__BBObserver_sendResponse_withCompletionIncludingModifiedResponse___block_invoke;
  v18[3] = &unk_264296170;
  v18[4] = self;
  v19 = v8;
  [(BBObserverServerProxy *)v14 handleResponse:v7 withCompletion:v18];

LABEL_8:
}

void __67__BBObserver_sendResponse_withCompletionIncludingModifiedResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v10 = 138412802;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    id v8 = v11;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "%@: Response handling completed with success %d, modified response %@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (void)clearSection:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)uint64_t v9 = 138543618;
    *(void *)&void v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = v4;
    id v8 = *(id *)&v9[4];
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Clearing section %{public}@", v9, 0x16u);
  }
  -[BBObserverServerProxy clearSection:](self->_serverProxy, "clearSection:", v4, *(_OWORD *)v9, *(void *)&v9[16], v10);
}

- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)id v15 = 138544130;
    *(void *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2114;
    *(void *)&v15[14] = v8;
    *(_WORD *)&v15[22] = 2114;
    id v16 = v9;
    LOWORD(v17) = 2114;
    *(void *)((char *)&v17 + 2) = v10;
    id v14 = *(id *)&v15[4];
    _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Clearing from %{public}@ to %{public}@ in sections %{public}@", v15, 0x2Au);
  }
  -[BBObserverServerProxy clearBulletinsFromDate:toDate:inSections:](self->_serverProxy, "clearBulletinsFromDate:toDate:inSections:", v8, v9, v10, *(_OWORD *)v15, *(void *)&v15[16], v16, v17);
}

- (void)clearBulletins:(id)a3 inSection:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v11 = objc_opt_class();
    id v12 = v11;
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = [v6 count];
    __int16 v29 = 2114;
    id v30 = v7;
    _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Clearing %ld bulletins in section %{public}@", buf, 0x20u);
  }
  int v13 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "bulletinID", (void)v20);
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  [(BBObserverServerProxy *)self->_serverProxy clearBulletinIDs:v13 inSection:v7];
}

- (void)removeBulletins:(id)a3 inSection:(id)a4
{
}

- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeed:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v13 = objc_opt_class();
    id v14 = v13;
    int v15 = 138544130;
    uint64_t v16 = v13;
    __int16 v17 = 2048;
    uint64_t v18 = [v8 count];
    __int16 v19 = 2048;
    unint64_t v20 = a5;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Removing %ld bulletins from feed %ld in section %{public}@", (uint8_t *)&v15, 0x2Au);
  }
  [(BBObserverServerProxy *)self->_serverProxy removeBulletins:v8 inSection:v9 fromFeeds:a5];
}

- (id)parametersForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__BBObserver_parametersForSectionID___block_invoke;
  v9[3] = &unk_264296198;
  id v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  BBDispatchSafeSync(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __37__BBObserver_parametersForSectionID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)getParametersForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke;
  v14[3] = &unk_2642961E8;
  id v8 = v7;
  v14[4] = self;
  id v15 = v8;
  id v9 = (void (**)(void, void))MEMORY[0x21D44A270](v14);
  if ([v6 length])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_3;
    block[3] = &unk_264296260;
    block[4] = self;
    id v12 = v6;
    int v13 = v9;
    dispatch_async(queue, block);
  }
  else
  {
    v9[2](v9, 0);
  }
}

void __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_2;
    v6[3] = &unk_2642961C0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(v3 + 48);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_4;
    v6[3] = &unk_264296238;
    void v6[4] = v3;
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    [v5 getSectionParametersForSectionID:v7 withHandler:v6];
  }
}

void __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 8);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_5;
    v7[3] = &unk_264296210;
    void v7[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_5(void *a1)
{
  [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
  v2 = *(uint64_t (**)(void))(a1[7] + 16);
  return v2();
}

- (void)getComposedImageSizeForAttachment:(id)a3 bulletin:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  if (!v7)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BBObserver.m", 401, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BBObserver_getComposedImageSizeForAttachment_bulletin_withCompletion___block_invoke;
  block[3] = &unk_264296288;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(calloutQueue, block);
}

uint64_t __72__BBObserver_getComposedImageSizeForAttachment_bulletin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
}

- (void)assertionExpired:(id)a3 transactionID:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__BBObserver_assertionExpired_transactionID___block_invoke;
  block[3] = &unk_2642962B0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __45__BBObserver_assertionExpired_transactionID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __45__BBObserver_assertionExpired_transactionID___block_invoke_2;
  id v15 = &unk_264295E50;
  uint64_t v16 = v2;
  id v17 = *(id *)(a1 + 40);
  dispatch_async(v3, &v12);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectForKey:", *(void *)(a1 + 40), v12, v13, v14, v15, v16);
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  id v4 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (id *)(*(void *)(a1 + 32) + 64);
    id v6 = v4;
    id WeakRetained = objc_loadWeakRetained(v5);
    id v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    __int16 v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = v10;
    id v11 = v8;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: finished with bulletin %{public}@, transactionID %ld", buf, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) finishedWithBulletinID:*(void *)(a1 + 40) transactionID:*(void *)(a1 + 48)];
}

void __45__BBObserver_assertionExpired_transactionID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 observer:*(void *)(a1 + 32) purgeReferencesToBulletinID:*(void *)(a1 + 40)];
  }
}

- (void)_queue_registerBulletin:(id)a3 withTransactionID:(unint64_t)a4
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = [v8 bulletinID];
  id v7 = [(NSMapTable *)self->_bulletinLifeAssertions objectForKey:v6];
  if (!v7)
  {
    id v7 = [[BBAssertion alloc] initWithDelegate:self identifier:v6];
    [(NSMapTable *)self->_bulletinLifeAssertions setObject:v7 forKey:v6];
  }
  [(BBAssertion *)v7 increaseOrIgnoreTransactionID:a4];
  [v8 addLifeAssertion:v7];
  [v8 addObserver:self];
}

- (void)serverProxy:(id)a3 connectionStateDidChange:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BBObserver_serverProxy_connectionStateDidChange___block_invoke;
  block[3] = &unk_2642962D8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __51__BBObserver_serverProxy_connectionStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serverProxy:connectionStateDidChange:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_queue_serverProxy:(id)a3 connectionStateDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"disconnected";
    if (v4) {
      id v7 = @"connected";
    }
    *(_DWORD *)buf = 138543618;
    __int16 v27 = self;
    __int16 v28 = 2114;
    __int16 v29 = v7;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "BBObserver: (%{public}@) %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    if (self->_observerFeed) {
      -[BBObserver setObserverFeed:](self, "setObserverFeed:");
    }
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9C0] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = self->_bulletinLifeAssertions;
    uint64_t v10 = [(NSMapTable *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 addObject:*(void *)(*((void *)&v21 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMapTable *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    [(BBObserver *)self _queue_invalidate];
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke;
    block[3] = &unk_264295E50;
    void block[4] = self;
    id v20 = v8;
    id v15 = v8;
    dispatch_async(calloutQueue, block);
  }
  uint64_t v16 = self->_calloutQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke_96;
  v17[3] = &unk_264296300;
  v17[4] = self;
  BOOL v18 = v4;
  dispatch_async(v16, v17);
}

void __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    BOOL v4 = BBLogBulletinLife;
    if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating all bulletins for %{public}@", (uint8_t *)&v7, 0xCu);
    }
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v6 observer:*(void *)(a1 + 32) noteInvalidatedBulletinIDs:*(void *)(a1 + 40)];
  }
}

void __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke_96(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 observer:*(void *)(a1 + 32) noteServerConnectionStateChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)updateBulletin:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bulletinUpdate];
  uint64_t v9 = [v8 bulletin];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 sectionID];

    if (v11)
    {
      uint64_t v12 = [v10 sectionID];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __39__BBObserver_updateBulletin_withReply___block_invoke_2;
      v15[3] = &unk_264296328;
      v15[4] = self;
      id v16 = v6;
      id v17 = v7;
      [(BBObserver *)self getParametersForSectionID:v12 withCompletion:v15];

      uint64_t v13 = v16;
LABEL_6:

      goto LABEL_7;
    }
  }
  if (v7)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__BBObserver_updateBulletin_withReply___block_invoke;
    block[3] = &unk_264296288;
    id v19 = v7;
    dispatch_async(calloutQueue, block);
    uint64_t v13 = v19;
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __39__BBObserver_updateBulletin_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__BBObserver_updateBulletin_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BBObserver_updateBulletin_withReply___block_invoke_3;
  block[3] = &unk_264296260;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __39__BBObserver_updateBulletin_withReply___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateBulletin:withReply:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_updateBulletin:(id)a3 withReply:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = [v8 bulletinUpdate];
  uint64_t v10 = [v9 bulletin];
  uint64_t v11 = [v8 transactionID];

  [(BBObserver *)self _queue_registerBulletin:v10 withTransactionID:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(BBObserver *)self _queue_updateAddBulletin:v9 withReply:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BBObserver *)self _queue_updateModifyBulletin:v9 withReply:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(BBObserver *)self _queue_updateRemoveBulletin:v9 withReply:v6];
      }
      else
      {
        uint64_t v12 = BBLogBulletinLife;
        if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543362;
          uint64_t v14 = v9;
          _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Invalid update %{public}@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
}

- (void)_queue_updateAddBulletin:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = [v8 bulletin];
  uint64_t v10 = [v8 feeds];
  unint64_t v11 = self->_observerFeed & v10;
  uint64_t v12 = [v9 bulletinID];
  int v13 = [(NSMutableDictionary *)self->_remainingFeedsByBulletinID objectForKey:v12];
  uint64_t v14 = [v13 integerValue];

  uint64_t v15 = v14 | v10;
  remainingFeedsByBulletinID = self->_remainingFeedsByBulletinID;
  id v17 = [NSNumber numberWithUnsignedInteger:v15];
  [(NSMutableDictionary *)remainingFeedsByBulletinID setObject:v17 forKey:v12];

  LOBYTE(remainingFeedsByBulletinID) = [v8 shouldPlayLightsAndSirens];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke;
  block[3] = &unk_2642963A0;
  id v23 = v6;
  unint64_t v24 = v11;
  void block[4] = self;
  id v22 = v9;
  char v25 = (char)remainingFeedsByBulletinID;
  id v19 = v9;
  id v20 = v6;
  dispatch_async(calloutQueue, block);
}

void __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void (**)(void, void))MEMORY[0x21D44A270](*(void *)(a1 + 48));
  if (*(void *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = (void *)BBLogBulletinDelivery;
      if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (id *)(*(void *)(a1 + 32) + 64);
        id v7 = v5;
        id v8 = objc_loadWeakRetained(v6);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = *(void **)(a1 + 40);
        id v11 = v9;
        uint64_t v12 = [v10 bulletinID];
        *(_DWORD *)buf = 138543618;
        v35 = v9;
        __int16 v36 = 2114;
        v37 = v12;
        _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering ADD bulletin: %{public}@", buf, 0x16u);
      }
      if (v2)
      {
        int v13 = (void *)MEMORY[0x263F29BF0];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_106;
        v32[3] = &unk_264296350;
        uint64_t v14 = v2;
        id v33 = v14;
        uint64_t v15 = [v13 sentinelWithCompletion:v32];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_2;
        v29[3] = &unk_264296378;
        id v30 = v15;
        id v31 = v14;
        id v16 = v15;
        uint64_t v2 = (void (**)(void, void))[v29 copy];
      }
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
      [v17 observer:*(void *)(a1 + 32) addBulletin:*(void *)(a1 + 40) forFeed:*(void *)(a1 + 56) playLightsAndSirens:*(unsigned __int8 *)(a1 + 64) withReply:v2];

      goto LABEL_14;
    }
    id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = (void *)BBLogBulletinDelivery;
      if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = (id *)(*(void *)(a1 + 32) + 64);
        id v22 = v20;
        id v23 = objc_loadWeakRetained(v21);
        unint64_t v24 = objc_opt_class();
        char v25 = *(void **)(a1 + 40);
        id v26 = v24;
        __int16 v27 = [v25 bulletinID];
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        __int16 v36 = 2114;
        v37 = v27;
        _os_log_impl(&dword_217675000, v22, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering ADD bulletin: %{public}@", buf, 0x16u);
      }
      id v28 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
      [v28 observer:*(void *)(a1 + 32) addBulletin:*(void *)(a1 + 40) forFeed:*(void *)(a1 + 56)];
    }
  }
  if (!v2) {
    return;
  }
  v2[2](v2, 0);
LABEL_14:
}

uint64_t __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isFailed];
  if (result)
  {
    char v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

uint64_t __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_queue_updateModifyBulletin:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = [v8 bulletin];
  uint64_t v10 = [v8 feeds];

  unint64_t v11 = self->_observerFeed & v10;
  calloutQueue = self->_calloutQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__BBObserver__queue_updateModifyBulletin_withReply___block_invoke;
  v15[3] = &unk_2642963C8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v6;
  unint64_t v18 = v11;
  id v13 = v6;
  id v14 = v9;
  dispatch_async(calloutQueue, v15);
}

uint64_t __52__BBObserver__queue_updateModifyBulletin_withReply___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!a1[7]) {
    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (id *)(a1[4] + 64);
      id v6 = v4;
      id v7 = objc_loadWeakRetained(v5);
      id v8 = objc_opt_class();
      uint64_t v9 = (void *)a1[5];
      id v10 = v8;
      unint64_t v11 = [v9 bulletinID];
      int v24 = 138543618;
      char v25 = v8;
      __int16 v26 = 2114;
      __int16 v27 = v11;
      _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering MODIFY bulletin: %{public}@", (uint8_t *)&v24, 0x16u);
    }
    id v12 = objc_loadWeakRetained((id *)(a1[4] + 64));
    [v12 observer:a1[4] modifyBulletin:a1[5] forFeed:a1[7]];
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)(a1[4] + 64));
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v15 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id *)(a1[4] + 64);
      id v17 = v15;
      id v18 = objc_loadWeakRetained(v16);
      char v19 = objc_opt_class();
      id v20 = (void *)a1[5];
      id v21 = v19;
      id v22 = [v20 bulletinID];
      int v24 = 138543618;
      char v25 = v19;
      __int16 v26 = 2114;
      __int16 v27 = v22;
      _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering MODIFY bulletin: %{public}@", (uint8_t *)&v24, 0x16u);
    }
    id v12 = objc_loadWeakRetained((id *)(a1[4] + 64));
    [v12 observer:a1[4] modifyBulletin:a1[5]];
  }

LABEL_11:
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_queue_updateRemoveBulletin:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = [v8 bulletin];
  uint64_t v10 = [v8 feeds];

  unint64_t observerFeed = self->_observerFeed;
  id v12 = [v9 bulletinID];
  id v13 = [(NSMutableDictionary *)self->_remainingFeedsByBulletinID objectForKey:v12];
  uint64_t v14 = [v13 integerValue];

  remainingFeedsByBulletinID = self->_remainingFeedsByBulletinID;
  uint64_t v16 = v14 & ~v10;
  if (v16)
  {
    id v17 = [NSNumber numberWithUnsignedInteger:v14 & ~v10];
    [(NSMutableDictionary *)remainingFeedsByBulletinID setObject:v17 forKey:v12];
  }
  else
  {
    [(NSMutableDictionary *)self->_remainingFeedsByBulletinID removeObjectForKey:v12];
  }
  unint64_t v18 = observerFeed & v10;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BBObserver__queue_updateRemoveBulletin_withReply___block_invoke;
  block[3] = &unk_2642963F0;
  void block[4] = self;
  id v23 = v9;
  unint64_t v25 = v18;
  uint64_t v26 = v16;
  id v24 = v6;
  id v20 = v6;
  id v21 = v9;
  dispatch_async(calloutQueue, block);
}

uint64_t __52__BBObserver__queue_updateRemoveBulletin_withReply___block_invoke(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a1[7])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = (void *)BBLogBulletinDelivery;
      if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = (id *)(a1[4] + 64);
        id v6 = v4;
        id v7 = objc_loadWeakRetained(v5);
        id v8 = objc_opt_class();
        uint64_t v9 = (void *)a1[5];
        id v10 = v8;
        unint64_t v11 = [v9 bulletinID];
        int v34 = 138543618;
        v35 = v8;
        __int16 v36 = 2114;
        v37 = v11;
        _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering REMOVE bulletin: %{public}@", (uint8_t *)&v34, 0x16u);
      }
      id v12 = objc_loadWeakRetained((id *)(a1[4] + 64));
      [v12 observer:a1[4] removeBulletin:a1[5] forFeed:a1[7]];
    }
  }
  uint64_t v13 = a1[4];
  uint64_t v14 = *(void *)(v13 + 72) & a1[8];
  id v15 = objc_loadWeakRetained((id *)(v13 + 64));
  char v16 = objc_opt_respondsToSelector();

  if (v14)
  {
    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
    id v17 = (void *)BBLogBulletinDelivery;
    if (!os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    unint64_t v18 = (id *)(a1[4] + 64);
    char v19 = v17;
    id v20 = objc_loadWeakRetained(v18);
    id v21 = objc_opt_class();
    id v22 = (void *)a1[5];
    id v23 = v21;
    id v24 = [v22 bulletinID];
    int v34 = 138543618;
    v35 = v21;
    __int16 v36 = 2112;
    v37 = v24;
    _os_log_impl(&dword_217675000, v19, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Suppressing FINAL REMOVE bulletin until removed from all feeds: %@", (uint8_t *)&v34, 0x16u);
  }
  else
  {
    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
    unint64_t v25 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = (id *)(a1[4] + 64);
      __int16 v27 = v25;
      id v28 = objc_loadWeakRetained(v26);
      __int16 v29 = objc_opt_class();
      id v30 = (void *)a1[5];
      id v31 = v29;
      v32 = [v30 bulletinID];
      int v34 = 138543618;
      v35 = v29;
      __int16 v36 = 2114;
      v37 = v32;
      _os_log_impl(&dword_217675000, v27, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering FINAL REMOVE bulletin: %{public}@", (uint8_t *)&v34, 0x16u);
    }
    char v19 = objc_loadWeakRetained((id *)(a1[4] + 64));
    [v19 observer:a1[4] removeBulletin:a1[5]];
  }

LABEL_15:
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)updateSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__BBObserver_updateSectionInfo___block_invoke;
    v7[3] = &unk_264295E50;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(calloutQueue, v7);
  }
}

void __32__BBObserver_updateSectionInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 observer:*(void *)(a1 + 32) updateSectionInfo:*(void *)(a1 + 40)];
  }
}

- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__BBObserver_updateSectionParameters_forSectionID___block_invoke;
    block[3] = &unk_264296418;
    void block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(queue, block);
  }
}

void __51__BBObserver_updateSectionParameters_forSectionID___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BBObserver_updateSectionParameters_forSectionID___block_invoke_2;
  block[3] = &unk_264296418;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void __51__BBObserver_updateSectionParameters_forSectionID___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 64));
    [v4 observer:a1[4] noteSectionParametersChanged:a1[5] forSectionID:a1[6]];
  }
}

- (void)removeSection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__BBObserver_removeSection___block_invoke;
    v7[3] = &unk_264295E50;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(calloutQueue, v7);
  }
}

void __28__BBObserver_removeSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 observer:*(void *)(a1 + 32) removeSection:*(void *)(a1 + 40)];
  }
}

- (void)updateGlobalSettings:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__BBObserver_updateGlobalSettings___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

void __35__BBObserver_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 observer:*(void *)(a1 + 32) updateGlobalSettings:*(void *)(a1 + 40)];
  }
}

- (void)noteServerReceivedResponseForBulletin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__BBObserver_noteServerReceivedResponseForBulletin___block_invoke;
    v7[3] = &unk_264295E50;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(calloutQueue, v7);
  }
}

void __52__BBObserver_noteServerReceivedResponseForBulletin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 observer:*(void *)(a1 + 32) noteServerReceivedResponseForBulletin:*(void *)(a1 + 40)];
  }
}

- (void)noteBulletinsLoadedForSectionID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke;
  v6[3] = &unk_264296440;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBObserver *)self getParametersForSectionID:v5 withCompletion:v6];
}

void __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke_2;
  v3[3] = &unk_264295E50;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteBulletinsLoadedForSectionID:", *(void *)(a1 + 40));
}

- (void)_queue_noteBulletinsLoadedForSectionID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__BBObserver__queue_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

void __53__BBObserver__queue_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (id *)(*(void *)(a1 + 32) + 64);
      id v6 = v4;
      id v7 = objc_loadWeakRetained(v5);
      id v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      id v10 = v8;
      _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering noteBulletinsLoadedForSectionID: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v11 observer:*(void *)(a1 + 32) noteBulletinsLoadedForSectionID:*(void *)(a1 + 40)];
  }
}

- (BBObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BBObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)observerFeed
{
  return self->_observerFeed;
}

- (NSString)gatewayName
{
  return self->_gatewayName;
}

- (unint64_t)gatewayPriority
{
  return self->_gatewayPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_remainingFeedsByBulletinID, 0);
  objc_storeStrong((id *)&self->_bulletinLifeAssertions, 0);
  objc_storeStrong((id *)&self->_sectionParametersBySectionID, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BBObserver)init
{
  return [(BBObserver *)self initWithQueue:0 calloutQueue:0];
}

- (BBObserver)initWithQueue:(id)a3
{
  return [(BBObserver *)self initWithQueue:a3 calloutQueue:a3];
}

- (BBObserver)initWithQueue:(id)a3 forGateway:(id)a4
{
  return (BBObserver *)[(BBObserver *)self _initWithQueue:a3 calloutQueue:a3 gatewayName:a4 gatewayPriority:0 isGateway:0];
}

- (BBObserver)initWithQueue:(id)a3 asGateway:(id)a4 priority:(unint64_t)a5
{
  return (BBObserver *)[(BBObserver *)self _initWithQueue:a3 calloutQueue:a3 gatewayName:a4 gatewayPriority:a5 isGateway:1];
}

@end
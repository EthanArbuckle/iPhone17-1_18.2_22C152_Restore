@interface BBRemoteDataProvider
- (BBRemoteDataProvider)initWithSectionID:(id)a3 delegate:(id)a4;
- (BOOL)canPerformMigration;
- (BOOL)checkResponds:(BOOL)a3 forSelector:(SEL)a4;
- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4;
- (NSString)debugDescription;
- (id)debugDescriptionWithChildren:(unint64_t)a3;
- (id)sectionIdentifier;
- (void)_logDoesNotRespond:(SEL)a3;
- (void)_sendClientRequest:(id)a3;
- (void)addBulletin:(id)a3 forDestinations:(unint64_t)a4;
- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5;
- (void)calloutToServer:(id)a3;
- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5;
- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4;
- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6;
- (void)dataProviderDidLoad;
- (void)dealloc;
- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4;
- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5;
- (void)getClearedInfoWithCompletion:(id)a3;
- (void)getSectionInfoWithCompletion:(id)a3;
- (void)invalidateBulletins;
- (void)modifyBulletin:(id)a3;
- (void)noteSectionInfoDidChange:(id)a3;
- (void)reloadDefaultSectionInfo:(id)a3;
- (void)reloadIdentityWithCompletion:(id)a3;
- (void)reloadSectionParameters:(id)a3;
- (void)setClearedInfo:(id)a3;
- (void)setClientProxy:(id)a3 completion:(id)a4;
- (void)setSectionInfo:(id)a3;
- (void)setServerIsReady:(BOOL)a3;
- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)withdrawBulletinWithPublisherBulletinID:(id)a3;
- (void)withdrawBulletinWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4;
- (void)withdrawBulletinsWithRecordID:(id)a3;
@end

@implementation BBRemoteDataProvider

- (BBRemoteDataProvider)initWithSectionID:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BBRemoteDataProvider *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sectionID = v8->_sectionID;
    v8->_sectionID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_replyQueue, (id)__BBServerQueue);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProvider.proxyQueue", 0);
    proxyQueue = v8->_proxyQueue;
    v8->_proxyQueue = (OS_dispatch_queue *)v11;

    dispatch_suspend((dispatch_object_t)v8->_proxyQueue);
    v8->_connected = 0;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProvider", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    dispatch_set_target_queue((dispatch_object_t)v8->_proxyQueue, (dispatch_queue_t)v8->_queue);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProvider.serverControlQueue", 0);
    serverControlQueue = v8->_serverControlQueue;
    v8->_serverControlQueue = (OS_dispatch_queue *)v16;

    dispatch_suspend((dispatch_object_t)v8->_serverControlQueue);
    dispatch_set_target_queue((dispatch_object_t)v8->_serverControlQueue, (dispatch_queue_t)__BBServerQueue);
    objc_storeStrong((id *)&v8->_delegate, a4);
  }

  return v8;
}

- (void)dealloc
{
  if (!self->_connected) {
    dispatch_resume((dispatch_object_t)self->_proxyQueue);
  }
  if (!self->_serverIsReady) {
    dispatch_resume((dispatch_object_t)self->_serverControlQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)BBRemoteDataProvider;
  [(BBRemoteDataProvider *)&v3 dealloc];
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  for (i = [MEMORY[0x263F089D8] stringWithString:&stru_26C7952A0];
    [i appendString:@"    "];
  id v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [v6 stringWithFormat:@"%@<%@: %p> %@", i, v8, self, self->_sectionID];

  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)[(BBRemoteDataProvider *)self debugDescriptionWithChildren:0];
}

- (void)setServerIsReady:(BOOL)a3
{
  if (self->_serverIsReady != a3)
  {
    self->_serverIsReady = a3;
    serverControlQueue = self->_serverControlQueue;
    if (a3) {
      dispatch_resume(serverControlQueue);
    }
    else {
      dispatch_suspend(serverControlQueue);
    }
  }
}

- (void)calloutToServer:(id)a3
{
  id v4 = a3;
  serverControlQueue = self->_serverControlQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__BBRemoteDataProvider_calloutToServer___block_invoke;
  block[3] = &unk_264296288;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serverControlQueue, block);
}

uint64_t __40__BBRemoteDataProvider_calloutToServer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sectionIdentifier
{
  return self->_sectionID;
}

- (void)setClientProxy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__BBRemoteDataProvider_setClientProxy_completion___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __50__BBRemoteDataProvider_setClientProxy_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v4 = *(void **)(v3 + 48);
  if (v4 != v2)
  {
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v2 == 0;
    }
    if (v5)
    {
      if (v4) {
        BOOL v6 = v2 == 0;
      }
      else {
        BOOL v6 = 0;
      }
      if (v6)
      {
        *(unsigned char *)(v3 + 56) = 0;
        dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
        uint64_t v7 = *(void *)(a1 + 32);
        id v8 = *(void **)(v7 + 48);
        *(void *)(v7 + 48) = 0;
      }
      else
      {
        objc_storeStrong((id *)(v3 + 48), v2);
      }
    }
    else
    {
      *(unsigned char *)(v3 + 56) = 1;
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)_sendClientRequest:(id)a3
{
  id v4 = a3;
  if (!self->_connected) {
    [(BBRemoteDataProviderDelegate *)self->_delegate remoteDataProviderNeedsToWakeClient:self];
  }
  proxyQueue = self->_proxyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BBRemoteDataProvider__sendClientRequest___block_invoke;
  v7[3] = &unk_2642961C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(proxyQueue, v7);
}

uint64_t __43__BBRemoteDataProvider__sendClientRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_logDoesNotRespond:(SEL)a3
{
  BOOL v5 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
    [(BBRemoteDataProvider *)v5 _logDoesNotRespond:a3];
  }
}

- (BOOL)checkResponds:(BOOL)a3 forSelector:(SEL)a4
{
  if (!a3) {
    [(BBRemoteDataProvider *)self _logDoesNotRespond:a4];
  }
  return a3;
}

- (void)dataProviderDidLoad
{
}

uint64_t __43__BBRemoteDataProvider_dataProviderDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataProviderDidLoad];
}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 496, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__13;
  v26[4] = __Block_byref_object_dispose__13;
  id v27 = 0;
  id v13 = [(BBDataProvider *)self identity];
  if (([v13 traits] & 4) != 0 || (objc_msgSend(v13, "traits") & 8) != 0) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = ([v13 traits] >> 4) & 1;
  }
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", v14, sel_bulletinsWithRequestParameters_lastCleared_completion_)&& [v9 publisherDestination] == 2)
  {
    dispatch_group_enter(v12);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke;
    v21[3] = &unk_264297A28;
    id v22 = v9;
    id v23 = v10;
    v25 = v26;
    v24 = v12;
    [(BBRemoteDataProvider *)self _sendClientRequest:v21];
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_3;
  block[3] = &unk_264297A50;
  id v19 = v11;
  v20 = v26;
  id v16 = v11;
  dispatch_group_notify(v12, replyQueue, block);

  _Block_object_dispose(v26, 8);
}

void __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2;
  v7[3] = &unk_264297A00;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [a2 bulletinsWithRequestParameters:v3 lastCleared:v4 completion:v7];
}

void __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__BBRemoteDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 521, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__13;
  void v21[4] = __Block_byref_object_dispose__13;
  id v22 = 0;
  id v10 = [(BBDataProvider *)self identity];
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", ([v10 traits] >> 6) & 1, sel_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion_))
  {
    dispatch_group_enter(v9);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke;
    v17[3] = &unk_264297AA0;
    id v18 = v7;
    v20 = v21;
    id v19 = v9;
    [(BBRemoteDataProvider *)self _sendClientRequest:v17];
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_3;
  block[3] = &unk_264297A50;
  id v15 = v8;
  id v16 = v21;
  id v12 = v8;
  dispatch_group_notify(v9, replyQueue, block);

  _Block_object_dispose(v21, 8);
}

void __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2;
  v6[3] = &unk_264297A78;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 clearedInfoForClearingAllBulletinsWithLastClearedInfo:v3 completion:v6];
}

void __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__BBRemoteDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 545, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = dispatch_group_create();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__13;
  v29[4] = __Block_byref_object_dispose__13;
  id v30 = 0;
  id v16 = [(BBDataProvider *)self identity];
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", ([v16 traits] >> 6) & 1, sel_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion_))
  {
    dispatch_group_enter(v15);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke;
    v23[3] = &unk_264297AC8;
    id v24 = v11;
    id v25 = v12;
    id v26 = v13;
    v28 = v29;
    id v27 = v15;
    [(BBRemoteDataProvider *)self _sendClientRequest:v23];
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_3;
  block[3] = &unk_264297A50;
  id v21 = v14;
  id v22 = v29;
  id v18 = v14;
  dispatch_group_notify(v15, replyQueue, block);

  _Block_object_dispose(v29, 8);
}

void __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2;
  v8[3] = &unk_264297A78;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v7;
  long long v9 = v7;
  [a2 clearedInfoForClearingBulletinsFromDate:v3 toDate:v4 lastClearedInfo:v5 completion:v8];
}

void __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __98__BBRemoteDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 569, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__13;
  v26[4] = __Block_byref_object_dispose__13;
  id v27 = 0;
  id v13 = [(BBDataProvider *)self identity];
  if (([v13 traits] & 0x20) != 0) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = ([v13 traits] >> 8) & 1;
  }
  if ([(BBRemoteDataProvider *)self checkResponds:v14 forSelector:sel_clearedInfoForBulletins_lastClearedInfo_])
  {
    dispatch_group_enter(v12);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke;
    v21[3] = &unk_264297A28;
    id v22 = v9;
    id v23 = v10;
    id v25 = v26;
    id v24 = v12;
    [(BBRemoteDataProvider *)self _sendClientRequest:v21];
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_3;
  block[3] = &unk_264297A50;
  id v19 = v11;
  v20 = v26;
  id v16 = v11;
  dispatch_group_notify(v12, replyQueue, block);

  _Block_object_dispose(v26, 8);
}

void __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2;
  v7[3] = &unk_264297A78;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [a2 clearedInfoForBulletins:v3 lastClearedInfo:v4 completion:v7];
}

void __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__BBRemoteDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [(BBDataProvider *)self identity];
  if (([v11 traits] & 0x100000) != 0) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = ([v11 traits] >> 21) & 1;
  }
  BOOL v13 = [(BBRemoteDataProvider *)self checkResponds:v12 forSelector:sel_handleBulletinActionResponse_withCompletion_];
  uint64_t v14 = (void *)BBLogGeneral;
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      -[BBRemoteDataProvider deliverResponse:forBulletinRequest:withCompletion:](v14);
      if (!v10) {
        goto LABEL_11;
      }
    }
    else if (!v10)
    {
      goto LABEL_11;
    }
    v10[2](v10, 0);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    *(_DWORD *)buf = 138543618;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2114;
    id v24 = v8;
    id v16 = v22;
    _os_log_impl(&dword_217675000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ sending client request for response %{public}@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke;
  v17[3] = &unk_264297AF0;
  id v18 = v8;
  id v19 = v9;
  v20 = v10;
  [(BBRemoteDataProvider *)self _sendClientRequest:v17];

LABEL_11:
}

void __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ delivering bulletin action for response %{public}@", buf, 0x16u);
  }
  long long v6 = +[BBActionResponse actionResponseForResponse:*(void *)(a1 + 32) bulletinRequest:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke_170;
  v8[3] = &unk_264296378;
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v7 = v3;
  [v7 deliverBulletinActionResponse:v6 withCompletion:v8];
}

uint64_t __74__BBRemoteDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke_170(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ completed action delivery with success=%d", (uint8_t *)&v7, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)noteSectionInfoDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBDataProvider *)self identity];
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", ([v5 traits] >> 18) & 1, sel_noteSectionInfoDidChange_))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__BBRemoteDataProvider_noteSectionInfoDidChange___block_invoke;
    v6[3] = &unk_264297B18;
    id v7 = v4;
    [(BBRemoteDataProvider *)self _sendClientRequest:v6];
  }
}

uint64_t __49__BBRemoteDataProvider_noteSectionInfoDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 noteSectionInfoDidChange:*(void *)(a1 + 32)];
}

- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v9 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 626, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    id v7 = 0;
  }
  (*((void (**)(id, void))v7 + 2))(v7, 0);
}

- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v9 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 632, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    id v7 = 0;
  }
  (*((void (**)(id, void))v7 + 2))(v7, 0);
}

- (BOOL)canPerformMigration
{
  return 0;
}

- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4
{
  return 0;
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BBDataProvider *)self identity];
  if (-[BBRemoteDataProvider checkResponds:forSelector:](self, "checkResponds:forSelector:", ([v8 traits] >> 17) & 1, sel_receiveMessageWithName_userInfo_))
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__BBRemoteDataProvider_deliverMessageWithName_userInfo___block_invoke;
    v9[3] = &unk_264297B40;
    id v10 = v6;
    id v11 = v7;
    [(BBRemoteDataProvider *)self _sendClientRequest:v9];
  }
}

uint64_t __56__BBRemoteDataProvider_deliverMessageWithName_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deliverMessageWithName:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)invalidateBulletins
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__BBRemoteDataProvider_invalidateBulletins__block_invoke;
  v2[3] = &unk_264295E28;
  v2[4] = self;
  [(BBRemoteDataProvider *)self calloutToServer:v2];
}

void __43__BBRemoteDataProvider_invalidateBulletins__block_invoke(uint64_t a1)
{
}

- (void)addBulletin:(id)a3 forDestinations:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__BBRemoteDataProvider_addBulletin_forDestinations___block_invoke;
  v8[3] = &unk_2642962B0;
  void v8[4] = self;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  [(BBRemoteDataProvider *)self calloutToServer:v8];
}

uint64_t __52__BBRemoteDataProvider_addBulletin_forDestinations___block_invoke(void *a1)
{
  return BBDataProviderAddBulletinForDestinations(a1[4], a1[5], a1[6]);
}

- (void)modifyBulletin:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__BBRemoteDataProvider_modifyBulletin___block_invoke;
  v6[3] = &unk_264295E50;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBRemoteDataProvider *)self calloutToServer:v6];
}

void __39__BBRemoteDataProvider_modifyBulletin___block_invoke(uint64_t a1)
{
}

- (void)withdrawBulletinsWithRecordID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__BBRemoteDataProvider_withdrawBulletinsWithRecordID___block_invoke;
  v6[3] = &unk_264295E50;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBRemoteDataProvider *)self calloutToServer:v6];
}

void __54__BBRemoteDataProvider_withdrawBulletinsWithRecordID___block_invoke(uint64_t a1)
{
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3
{
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__BBRemoteDataProvider_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke;
  v8[3] = &unk_2642962D8;
  void v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(BBRemoteDataProvider *)self calloutToServer:v8];
}

void __75__BBRemoteDataProvider_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke(uint64_t a1)
{
}

- (void)reloadIdentityWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)reloadSectionParameters:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(replyQueue, v7);
}

void __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sectionIdentifier];
  id v3 = [*(id *)(a1 + 40) sectionIdentifier];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) setIdentity:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke_2;
    v6[3] = &unk_264295E28;
    void v6[4] = v5;
    [v5 calloutToServer:v6];
  }
}

void __48__BBRemoteDataProvider_reloadSectionParameters___block_invoke_2(uint64_t a1)
{
}

- (void)reloadDefaultSectionInfo:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(replyQueue, v7);
}

void __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identity];
  id v3 = [v2 sectionIdentifier];
  id v4 = [*(id *)(a1 + 40) sectionIdentifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    [*(id *)(a1 + 32) setIdentity:*(void *)(a1 + 40)];
    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke_2;
    v7[3] = &unk_264295E28;
    void v7[4] = v6;
    [v6 calloutToServer:v7];
  }
}

void __49__BBRemoteDataProvider_reloadDefaultSectionInfo___block_invoke_2(uint64_t a1)
{
}

- (void)getClearedInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke;
  v6[3] = &unk_2642964F8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBRemoteDataProvider *)self calloutToServer:v6];
}

void __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke_2;
  v2[3] = &unk_264297B68;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  _BBDataProviderGetClearedInfoWithCompletion(v1, v2);
}

uint64_t __53__BBRemoteDataProvider_getClearedInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setClearedInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__BBRemoteDataProvider_setClearedInfo___block_invoke;
  v6[3] = &unk_264295E50;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBRemoteDataProvider *)self calloutToServer:v6];
}

void __39__BBRemoteDataProvider_setClearedInfo___block_invoke(uint64_t a1)
{
}

- (void)getSectionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke;
  v6[3] = &unk_2642964F8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBRemoteDataProvider *)self calloutToServer:v6];
}

void __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke_2;
  v2[3] = &unk_264297B90;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  _BBDataProviderGetSectionInfoWithCompletion(v1, v2);
}

uint64_t __53__BBRemoteDataProvider_getSectionInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSectionInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__BBRemoteDataProvider_setSectionInfo___block_invoke;
  v6[3] = &unk_264295E50;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBRemoteDataProvider *)self calloutToServer:v6];
}

void __39__BBRemoteDataProvider_setSectionInfo___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serverControlQueue, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_proxyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

- (void)_logDoesNotRespond:(const char *)a3 .cold.1(void *a1, void *a2, const char *a3)
{
  id v5 = a1;
  id v6 = [a2 identity];
  __int16 v13 = NSStringFromSelector(a3);
  OUTLINED_FUNCTION_1_0(&dword_217675000, v7, v8, "BBRemoteDataProvider: %{public}@ does not respond to %{public}@", v9, v10, v11, v12, 2u);
}

- (void)deliverResponse:(void *)a1 forBulletinRequest:withCompletion:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_0(&dword_217675000, v3, v4, "%{public}@ could not deliver response %{public}@", v5, v6, v7, v8, 2u);
}

@end
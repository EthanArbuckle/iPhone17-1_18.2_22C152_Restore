@interface BBDataProviderProxy
- (BBDataProviderIdentity)identity;
- (BBDataProviderProxy)initWithDataProvider:(id)a3 clientReplyQueue:(id)a4;
- (NSString)description;
- (void)_makeClientRequest:(id)a3;
- (void)_makeServerRequest:(id)a3;
- (void)addBulletin:(id)a3 forDestinations:(unint64_t)a4;
- (void)addBulletin:(id)a3 interrupt:(BOOL)a4;
- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5;
- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5;
- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4;
- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6;
- (void)dataProviderDidLoad;
- (void)dealloc;
- (void)deliverBulletinActionResponse:(id)a3 withCompletion:(id)a4;
- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4;
- (void)invalidateBulletins;
- (void)modifyBulletin:(id)a3;
- (void)noteSectionInfoDidChange:(id)a3;
- (void)reloadDefaultSectionInfo;
- (void)reloadSectionParameters;
- (void)setIdentity:(id)a3;
- (void)setServerProxy:(id)a3;
- (void)updateClearedInfoWithHandler:(id)a3;
- (void)updateIdentity:(id)a3;
- (void)updateSectionInfoWithHandler:(id)a3;
- (void)updateSectionInfoWithHandler:(id)a3 completion:(id)a4;
- (void)withdrawBulletinWithPublisherBulletinID:(id)a3;
- (void)withdrawBulletinWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4;
- (void)withdrawBulletinsWithRecordID:(id)a3;
@end

@implementation BBDataProviderProxy

- (BBDataProviderProxy)initWithDataProvider:(id)a3 clientReplyQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(BBDataProviderProxy *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientCalloutQueue, a4);
    objc_storeStrong((id *)&v10->_dataProvider, a3);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderProxy.queue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderProxy.proxyQueue", 0);
    proxyQueue = v10->_proxyQueue;
    v10->_proxyQueue = (OS_dispatch_queue *)v14;

    dispatch_suspend((dispatch_object_t)v10->_proxyQueue);
    dispatch_set_target_queue((dispatch_object_t)v10->_proxyQueue, (dispatch_queue_t)v10->_queue);
    v10->_connected = 0;
  }

  return v10;
}

- (void)dealloc
{
  if (!self->_connected) {
    dispatch_resume((dispatch_object_t)self->_proxyQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)BBDataProviderProxy;
  [(BBDataProviderProxy *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = [(BBRemoteDataProvider *)self->_dataProvider sectionIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@ %p; dataProvider: %@ (%@)>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)updateIdentity:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__BBDataProviderProxy_updateIdentity___block_invoke;
  v6[3] = &unk_264297658;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BBDataProviderProxy *)self _makeClientRequest:v6];
}

void __38__BBDataProviderProxy_updateIdentity___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[BBDataProviderIdentity identityForRemoteDataProvider:a2];
  objc_msgSend(*(id *)(a1 + 32), "setIdentity:");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)setServerProxy:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting server proxy: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__BBDataProviderProxy_setServerProxy___block_invoke;
  v11[3] = &unk_264295E50;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  dispatch_async(queue, v11);
}

void __38__BBDataProviderProxy_setServerProxy___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6 = *(void **)(v2 + 48);
  id v4 = (id *)(v2 + 48);
  id v5 = v6;
  if (v3 != v6)
  {
    if (v3) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7)
    {
      if (v3) {
        BOOL v8 = v5 == 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (v8)
      {
        __int16 v16 = (void *)BBLogConnection;
        if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          uint64_t v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          int v20 = 138543362;
          v21 = v19;
          _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming proxy queue", (uint8_t *)&v20, 0xCu);
        }
        *(unsigned char *)(*(void *)(a1 + 40) + 56) = 1;
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), *(id *)(a1 + 32));
        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 40));
      }
      else
      {
        objc_storeStrong(v4, v3);
      }
    }
    else
    {
      v9 = (void *)BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v9;
        id v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v20 = 138543362;
        v21 = v13;
        _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending proxy queue", (uint8_t *)&v20, 0xCu);
      }
      *(unsigned char *)(*(void *)(a1 + 40) + 56) = 0;
      dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 40) + 40));
      uint64_t v14 = *(void *)(a1 + 40);
      v15 = *(void **)(v14 + 48);
      *(void *)(v14 + 48) = 0;
    }
  }
}

- (void)_makeServerRequest:(id)a3
{
  id v4 = a3;
  proxyQueue = self->_proxyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__BBDataProviderProxy__makeServerRequest___block_invoke;
  v7[3] = &unk_2642961C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(proxyQueue, v7);
}

uint64_t __42__BBDataProviderProxy__makeServerRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48));
}

- (void)_makeClientRequest:(id)a3
{
  id v4 = a3;
  clientCalloutQueue = self->_clientCalloutQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__BBDataProviderProxy__makeClientRequest___block_invoke;
  v7[3] = &unk_2642961C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientCalloutQueue, v7);
}

uint64_t __42__BBDataProviderProxy__makeClientRequest___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 8));
  }
  return result;
}

- (void)invalidateBulletins
{
}

uint64_t __42__BBDataProviderProxy_invalidateBulletins__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateBulletins];
}

- (void)addBulletin:(id)a3 interrupt:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 78;
  }
  else {
    uint64_t v4 = 2;
  }
  [(BBDataProviderProxy *)self addBulletin:a3 forDestinations:v4];
}

- (void)addBulletin:(id)a3 forDestinations:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = [(BBDataProviderProxy *)self identity];
    id v10 = [v9 sectionIdentifier];
    *(_DWORD *)buf = 138543362;
    __int16 v16 = v10;
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "BBDataProviderProxy %{public}@ has enqueued a bulletin request", buf, 0xCu);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__BBDataProviderProxy_addBulletin_forDestinations___block_invoke;
  v12[3] = &unk_2642976A0;
  v12[4] = self;
  id v13 = v6;
  unint64_t v14 = a4;
  id v11 = v6;
  [(BBDataProviderProxy *)self _makeServerRequest:v12];
}

void __51__BBDataProviderProxy_addBulletin_forDestinations___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)a1[4];
    id v6 = v4;
    BOOL v7 = [v5 identity];
    id v8 = [v7 sectionIdentifier];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "BBDataProviderProxy %{public}@ is now sending enqueued bulletin request to BBServer", (uint8_t *)&v9, 0xCu);
  }
  [v3 addBulletin:a1[5] forDestinations:a1[6]];
}

- (void)modifyBulletin:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__BBDataProviderProxy_modifyBulletin___block_invoke;
  v6[3] = &unk_2642976C8;
  id v7 = v4;
  id v5 = v4;
  [(BBDataProviderProxy *)self _makeServerRequest:v6];
}

uint64_t __38__BBDataProviderProxy_modifyBulletin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modifyBulletin:*(void *)(a1 + 32)];
}

- (void)withdrawBulletinsWithRecordID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__BBDataProviderProxy_withdrawBulletinsWithRecordID___block_invoke;
  v6[3] = &unk_2642976C8;
  id v7 = v4;
  id v5 = v4;
  [(BBDataProviderProxy *)self _makeServerRequest:v6];
}

uint64_t __53__BBDataProviderProxy_withdrawBulletinsWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 withdrawBulletinsWithRecordID:*(void *)(a1 + 32)];
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3
{
}

- (void)withdrawBulletinWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__BBDataProviderProxy_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke;
  v8[3] = &unk_2642976F0;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(BBDataProviderProxy *)self _makeServerRequest:v8];
}

uint64_t __74__BBDataProviderProxy_withdrawBulletinWithPublisherBulletinID_shouldSync___block_invoke(uint64_t a1, void *a2)
{
  return [a2 withdrawBulletinWithPublisherBulletinID:*(void *)(a1 + 32) shouldSync:*(unsigned __int8 *)(a1 + 40)];
}

- (void)reloadSectionParameters
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__BBDataProviderProxy_reloadSectionParameters__block_invoke;
  v2[3] = &unk_264297718;
  v2[4] = self;
  [(BBDataProviderProxy *)self updateIdentity:v2];
}

void __46__BBDataProviderProxy_reloadSectionParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__BBDataProviderProxy_reloadSectionParameters__block_invoke_2;
  v6[3] = &unk_2642976C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _makeServerRequest:v6];
}

uint64_t __46__BBDataProviderProxy_reloadSectionParameters__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reloadSectionParameters:*(void *)(a1 + 32)];
}

- (void)reloadDefaultSectionInfo
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke;
  v2[3] = &unk_264297718;
  v2[4] = self;
  [(BBDataProviderProxy *)self updateIdentity:v2];
}

void __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke_2;
  v6[3] = &unk_2642976C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _makeServerRequest:v6];
}

uint64_t __47__BBDataProviderProxy_reloadDefaultSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reloadDefaultSectionInfo:*(void *)(a1 + 32)];
}

- (void)updateClearedInfoWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 174, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke;
  v8[3] = &unk_264297790;
  void v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  [(BBDataProviderProxy *)self _makeServerRequest:v8];
}

void __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_2;
  v4[3] = &unk_264297768;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 getClearedInfoWithCompletion:v4];
}

void __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_3;
    v9[3] = &unk_264297740;
    id v6 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    [v6 _makeClientRequest:v9];
  }
}

void __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = (*(void (**)(void))(a1[6] + 16))();
  id v3 = v2;
  if (v2 != (void *)a1[4])
  {
    id v4 = (void *)a1[5];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_4;
    v5[3] = &unk_2642976C8;
    id v6 = v2;
    [v4 _makeServerRequest:v5];
  }
}

uint64_t __52__BBDataProviderProxy_updateClearedInfoWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setClearedInfo:*(void *)(a1 + 32)];
}

- (void)updateSectionInfoWithHandler:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BBRemoteDataProvider.m", 192, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke;
  v12[3] = &unk_264297858;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(BBDataProviderProxy *)self _makeServerRequest:v12];
}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_2;
  v5[3] = &unk_264297830;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [a2 getSectionInfoWithCompletion:v5];
}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_3;
    v15[3] = &unk_264297808;
    id v9 = &v18;
    id v10 = *(void **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    id v16 = v11;
    uint64_t v17 = v12;
    id v19 = *(id *)(a1 + 48);
    [v10 _makeClientRequest:v15];

    goto LABEL_5;
  }
  id v7 = *(void **)(a1 + 48);
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_7;
    v13[3] = &unk_2642977B8;
    id v9 = &v14;
    id v14 = v7;
    [v8 _makeClientRequest:v13];
LABEL_5:
  }
}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_4;
    v11[3] = &unk_2642977E0;
    id v5 = (id *)v12;
    v12[0] = v2;
    id v6 = *(id *)(a1 + 56);
    v12[1] = *(void *)(a1 + 40);
    id v13 = v6;
    [v4 _makeServerRequest:v11];

LABEL_5:
    goto LABEL_6;
  }
  id v7 = *(void **)(a1 + 56);
  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_6;
    v9[3] = &unk_2642977B8;
    id v5 = &v10;
    id v10 = v7;
    [v8 _makeClientRequest:v9];
    goto LABEL_5;
  }
LABEL_6:
}

void __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_4(void *a1, void *a2)
{
  [a2 setSectionInfo:a1[4]];
  id v3 = (void *)a1[6];
  if (v3)
  {
    id v4 = (void *)a1[5];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_5;
    v5[3] = &unk_2642977B8;
    id v6 = v3;
    [v4 _makeClientRequest:v5];
  }
}

uint64_t __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__BBDataProviderProxy_updateSectionInfoWithHandler_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSectionInfoWithHandler:(id)a3
{
}

- (void)dataProviderDidLoad
{
  if (!self->_dataProviderDidLoad)
  {
    self->_dataProviderDidLoad = 1;
    id v3 = [(BBDataProviderProxy *)self identity];
    char v4 = [v3 traits];

    if ((v4 & 2) != 0)
    {
      [(BBDataProviderProxy *)self _makeClientRequest:&__block_literal_global_24];
    }
  }
}

uint64_t __42__BBDataProviderProxy_dataProviderDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataProviderDidLoad];
}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke;
  v14[3] = &unk_2642978C8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(BBDataProviderProxy *)self _makeClientRequest:v14];
}

void __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) identity];
  if (([v4 traits] & 4) != 0)
  {
    uint64_t v7 = [v3 bulletinsWithRequestParameters:*(void *)(a1 + 40) lastCleared:*(void *)(a1 + 48)];
LABEL_8:
    id v6 = (void *)v7;
    goto LABEL_9;
  }
  if (([v4 traits] & 0x10) != 0)
  {
    id v8 = [*(id *)(a1 + 40) enabledSectionIDs];
    id v6 = objc_msgSend(v3, "bulletinsFilteredBy:enabledSectionIDs:count:lastCleared:", 0, v8, objc_msgSend(*(id *)(a1 + 40), "maximumCount"), *(void *)(a1 + 48));

    goto LABEL_9;
  }
  if (([v4 traits] & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(v3, "bulletinsFilteredBy:count:lastCleared:", 0, objc_msgSend(*(id *)(a1 + 40), "maximumCount"), *(void *)(a1 + 48));
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  NSLog(&cfstr_DataProviderDo.isa, v5, v3);
  id v6 = 0;
LABEL_9:
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2;
  v12[3] = &unk_2642978A0;
  id v10 = *(id *)(a1 + 56);
  id v13 = v6;
  id v14 = v10;
  id v11 = v6;
  [v9 _makeServerRequest:v12];
}

uint64_t __77__BBDataProviderProxy_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke;
  v10[3] = &unk_2642978F0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(BBDataProviderProxy *)self _makeClientRequest:v10];
}

void __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) identity];
  char v5 = [v4 traits];

  if ((v5 & 0x40) != 0)
  {
    id v7 = [v3 clearedInfoForClearingAllBulletinsWithLastClearedInfo:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_DataProviderDo_0.isa, v6, v3);
    id v7 = 0;
  }
  id v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_2642978A0;
  id v9 = *(id *)(a1 + 48);
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  [v8 _makeServerRequest:v11];
}

uint64_t __88__BBDataProviderProxy_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke;
  v18[3] = &unk_264297918;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(BBDataProviderProxy *)self _makeClientRequest:v18];
}

void __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) identity];
  char v5 = [v4 traits];

  if (v5 < 0)
  {
    id v7 = [v3 clearedInfoForClearingBulletinsFromDate:*(void *)(a1 + 40) toDate:*(void *)(a1 + 48) lastClearedInfo:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_DataProviderDo_0.isa, v6, v3);
    id v7 = 0;
  }
  id v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_2642978A0;
  id v9 = *(id *)(a1 + 64);
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  [v8 _makeServerRequest:v11];
}

uint64_t __97__BBDataProviderProxy_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BBDataProviderProxy *)self identity];
  unsigned int v12 = [v11 traits] & 0x20;
  if (v12) {
    LOBYTE(v13) = 0;
  }
  else {
    unsigned int v13 = ([v11 traits] >> 8) & 1;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke;
  v17[3] = &unk_264297940;
  char v22 = v12 >> 5;
  id v18 = v8;
  id v19 = v9;
  char v23 = v13;
  id v20 = self;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(BBDataProviderProxy *)self _makeClientRequest:v17];
}

void __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = [v3 clearedInfoForBulletins:*(void *)(a1 + 32) lastClearedInfo:*(void *)(a1 + 40)];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 65))
    {
      uint64_t v10 = objc_opt_class();
      NSLog(&cfstr_DataProviderDo_1.isa, v10, v4);
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    uint64_t v5 = [v3 clearedInfoForBulletins:*(void *)(a1 + 32)];
  }
  uint64_t v6 = (void *)v5;
LABEL_6:
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2;
  v11[3] = &unk_2642978A0;
  id v7 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v12 = v6;
  id v13 = v8;
  id v9 = v6;
  [v7 _makeServerRequest:v11];
}

uint64_t __74__BBDataProviderProxy_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)noteSectionInfoDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__BBDataProviderProxy_noteSectionInfoDidChange___block_invoke;
  v6[3] = &unk_264297968;
  id v7 = v4;
  id v5 = v4;
  [(BBDataProviderProxy *)self _makeClientRequest:v6];
}

uint64_t __48__BBDataProviderProxy_noteSectionInfoDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 noteSectionInfoDidChange:*(void *)(a1 + 32)];
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__BBDataProviderProxy_deliverMessageWithName_userInfo___block_invoke;
  v10[3] = &unk_264297990;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(BBDataProviderProxy *)self _makeClientRequest:v10];
}

uint64_t __55__BBDataProviderProxy_deliverMessageWithName_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 receiveMessageWithName:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)deliverBulletinActionResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke;
  v10[3] = &unk_264297658;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(BBDataProviderProxy *)self _makeClientRequest:v10];
}

void __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ handling bulletin action response %{public}@", buf, 0x16u);
  }
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke_36;
    v9[3] = &unk_2642979B8;
    id v10 = *(id *)(a1 + 40);
    [v3 handleBulletinActionResponse:v7 withCompletion:v9];
  }
  else
  {
    [v3 handleBulletinActionResponse:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    }
  }
}

uint64_t __68__BBDataProviderProxy_deliverBulletinActionResponse_withCompletion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BBDataProviderIdentity)identity
{
  return (BBDataProviderIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_proxyQueue, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
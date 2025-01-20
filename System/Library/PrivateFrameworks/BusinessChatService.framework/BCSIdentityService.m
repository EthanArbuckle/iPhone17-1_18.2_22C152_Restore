@interface BCSIdentityService
+ (id)sharedInstance;
- (id)businessChatAccount;
- (void)refreshIDStatusForBizID:(id)a3 completion:(id)a4;
- (void)serialDispatchQueue;
@end

@implementation BCSIdentityService

+ (id)sharedInstance
{
  self;
  v0 = (void *)_MergedGlobals_38;
  if (!_MergedGlobals_38)
  {
    if (qword_26ACEFCE0 != -1) {
      dispatch_once(&qword_26ACEFCE0, &__block_literal_global_7);
    }
    v0 = (void *)_MergedGlobals_38;
  }

  return v0;
}

void __36__BCSIdentityService_sharedInstance__block_invoke()
{
  v0 = [BCSIdentityService alloc];
  v1 = objc_alloc_init(BCSIDSServiceFactory);
  v2 = [MEMORY[0x263F4A058] sharedInstance];
  v6 = v1;
  id v3 = v2;
  if (v0)
  {
    v7.receiver = v0;
    v7.super_class = (Class)BCSIdentityService;
    v4 = (BCSIdentityService *)objc_msgSendSuper2(&v7, sel_init);
    v0 = v4;
    if (v4)
    {
      objc_storeStrong((id *)&v4->_IDSServiceFactory, v1);
      objc_storeStrong((id *)&v0->_IDSQueryController, v2);
    }
  }

  v5 = (void *)_MergedGlobals_38;
  _MergedGlobals_38 = (uint64_t)v0;
}

- (id)businessChatAccount
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_businessChatAccount)
  {
    id v3 = v2->_IDSServiceFactory;
    v4 = [(BCSIDSServiceFactoryProtocol *)v3 makeIDSService];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = objc_msgSend(v4, "accounts", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      objc_super v7 = 0;
      v8 = 0;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v11 accountType] == 1)
          {
            id v12 = v11;

            objc_super v7 = v12;
          }
          if (![v11 accountType])
          {
            id v13 = v11;

            v8 = v13;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);

      if (v7)
      {
        id v14 = v7;
        v15 = v14;
LABEL_17:
        businessChatAccount = v2->_businessChatAccount;
        v2->_businessChatAccount = (BCSIdentityAccountProtocol *)v14;

        goto LABEL_18;
      }
    }
    else
    {

      v8 = 0;
    }
    id v14 = v8;
    v15 = 0;
    v8 = v14;
    goto LABEL_17;
  }
LABEL_18:
  objc_sync_exit(v2);

  v17 = v2->_businessChatAccount;

  return v17;
}

- (void)refreshIDStatusForBizID:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = (void (**)(id, BOOL))a4;
  if (v7)
  {
    if (self)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __54__BCSIdentityService__addIDSIDQueryControllerDelegate__block_invoke;
      v28 = &unk_264248CD8;
      v29 = self;
      if (_addIDSIDQueryControllerDelegate_onceToken != -1) {
        dispatch_once(&_addIDSIDQueryControllerDelegate_onceToken, buf);
      }
      IDSQueryController = self->_IDSQueryController;
    }
    else
    {
      IDSQueryController = 0;
    }
    uint64_t v9 = [(BCSIDSQueryControllerProtocol *)IDSQueryController _currentIDStatusForDestination:v6 service:@"com.apple.private.alloy.biz" listenerID:@"com.apple.businesschatservice.bizItemController"];
    v10 = ABSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[BCSIdentityService refreshIDStatusForBizID:completion:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v28 = v6;
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s Cached IDSIDStatus result: %ld for destination: %@", buf, 0x20u);
    }

    if (v9)
    {
      if (self) {
        v11 = self->_IDSQueryController;
      }
      else {
        v11 = 0;
      }
      id v12 = v11;
      id v13 = -[BCSIdentityService serialDispatchQueue](self);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke_13;
      v22[3] = &unk_2642499D0;
      id v23 = v6;
      [(BCSIDSQueryControllerProtocol *)v12 refreshIDStatusForDestination:v23 service:@"com.apple.private.alloy.biz" listenerID:@"com.apple.businesschatservice.bizItemController" queue:v13 completionBlock:v22];

      v7[2](v7, v9 == 1);
      id v14 = v23;
    }
    else
    {
      if (self)
      {
        idStatusCompletionBlocks = self->_idStatusCompletionBlocks;
        if (!idStatusCompletionBlocks)
        {
          id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          objc_storeStrong((id *)&self->_idStatusCompletionBlocks, v16);

          idStatusCompletionBlocks = self->_idStatusCompletionBlocks;
        }
      }
      else
      {

        idStatusCompletionBlocks = 0;
      }
      id v14 = [(NSMutableDictionary *)idStatusCompletionBlocks objectForKey:v6];
      if (!v14)
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        if (self) {
          v17 = self->_idStatusCompletionBlocks;
        }
        else {
          v17 = 0;
        }
        [(NSMutableDictionary *)v17 setValue:v14 forKey:v6];
      }
      v18 = (void *)MEMORY[0x2166BDB40](v7);
      [v14 addObject:v18];

      if (self) {
        long long v19 = self->_IDSQueryController;
      }
      else {
        long long v19 = 0;
      }
      long long v20 = v19;
      long long v21 = -[BCSIdentityService serialDispatchQueue](self);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke;
      v24[3] = &unk_2642499A8;
      id v25 = v6;
      v26 = self;
      [(BCSIDSQueryControllerProtocol *)v20 refreshIDStatusForDestination:v25 service:@"com.apple.private.alloy.biz" listenerID:@"com.apple.businesschatservice.bizItemController" queue:v21 completionBlock:v24];
    }
  }
}

- (void)serialDispatchQueue
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create((const char *)[@"com.apple.businesschatservice.bizItemController.serialqueue" UTF8String], 0);
      v5 = (void *)v2[2];
      v2[2] = v4;

      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_queue_t v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v21 = a2;
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "IDSIDStatus result: %ld for destination: %@", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    objc_super v7 = [*(id *)(v6 + 24) objectForKey:*(void *)(a1 + 32)];
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (a2)
          {
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, a2 == 1);
            v15 = (void *)MEMORY[0x2166BDB40](v14);
            objc_msgSend(v8, "addObject:", v15, (void)v16);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:buf count:16];
      }
      while (v11);
    }

    [v9 minusSet:v8];
  }
}

void __57__BCSIdentityService_refreshIDStatusForBizID_completion___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_queue_t v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "Refreshed IDSIDStatus result: %ld for destination: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __54__BCSIdentityService__addIDSIDQueryControllerDelegate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    v2 = (void *)v1[5];
  }
  else {
    v2 = 0;
  }
  id v3 = v2;
  -[BCSIdentityService serialDispatchQueue](v1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addDelegate:v1 forService:@"com.apple.private.alloy.biz" listenerID:@"com.apple.businesschatservice.bizItemController" queue:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDSQueryController, 0);
  objc_storeStrong((id *)&self->_IDSServiceFactory, 0);
  objc_storeStrong((id *)&self->_idStatusCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);

  objc_storeStrong((id *)&self->_businessChatAccount, 0);
}

@end
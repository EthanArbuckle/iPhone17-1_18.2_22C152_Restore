@interface ASDAppStoreService
+ (id)defaultService;
+ (id)interface;
- (ASDAppStoreChangedObserver)observer;
- (ASDAppStoreService)init;
- (void)_refreshCache:(int)a3 sendActionResponse:;
- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)allBadgeIDsWithReplyHandler:(id)a3;
- (void)allBadgeMetricsWithReplyHandler:(id)a3;
- (void)badgeCountWithReplyHandler:(id)a3;
- (void)dealloc;
- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4;
- (void)reloadWidgetOnConnectivityToEndpoint:(id)a3 parameters:(id)a4 replyHandler:(id)a5;
- (void)removeAllBadgeIDsWithReplyHandler:(id)a3;
- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)removeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)setObserver:(id)a3;
@end

@implementation ASDAppStoreService

- (void)allBadgeMetricsWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = +[ASDServiceBroker defaultBroker];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke;
  v7[3] = &unk_1E58B3A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getAppStoreServiceWithCompletionHandler:v7];
}

uint64_t __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2_14(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BFD8];
}

uint64_t __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return MEMORY[0x1F41817F8]();
}

id __34__ASDAppStoreService_setObserver___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

void __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_9;
    v10[3] = &unk_1E58B2CE0;
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v6 addBadgeIDs:v7 replyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] addBadgeIDs failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __36__ASDAppStoreService_defaultService__block_invoke(uint64_t a1)
{
  _MergedGlobals_30 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDAppStoreService)init
{
  id v3 = +[ASDServiceBroker defaultBroker];
  if (self
    && (v18.receiver = self,
        v18.super_class = (Class)ASDAppStoreService,
        (id v4 = [(ASDAppStoreService *)&v18 init]) != 0))
  {
    id v5 = v4;
    objc_storeWeak((id *)&v4->_serviceBroker, v3);

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ASDAppStoreService.dispatch", v6);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ASDAppStoreService.notification", v9);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v10;

    objc_initWeak(&v18.receiver, v5);
    v5->_badgesChangedNotificationToken = -1;
    v12 = dispatch_get_global_queue(21, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __26__ASDAppStoreService_init__block_invoke;
    handler[3] = &unk_1E58B36F8;
    objc_copyWeak(&v17, &v18.receiver);
    notify_register_dispatch("com.apple.appstored.ASDAppStoreServiceBadgesChanged", &v5->_badgesChangedNotificationToken, v12, handler);

    v5->_badgesChangedForAppStoreNotificationToken = -1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __26__ASDAppStoreService_init__block_invoke_2;
    v14[3] = &unk_1E58B36F8;
    objc_copyWeak(&v15, &v18.receiver);
    notify_register_dispatch("com.apple.appstored.ASDAppStoreServiceBadgeChangedWithActionResponse", &v5->_badgesChangedForAppStoreNotificationToken, v12, v14);

    -[ASDAppStoreService _refreshCache:sendActionResponse:](v5, 0, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v18.receiver);
  }
  else
  {

    return 0;
  }
  return v5;
}

void __26__ASDAppStoreService_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[ASDAppStoreService _refreshCache:sendActionResponse:](WeakRetained, 1, 0);
    WeakRetained = v2;
  }
}

- (void)_refreshCache:(int)a3 sendActionResponse:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    id v7 = *(id *)&buf[4];
    _os_log_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Refreshing caches with notify: %{BOOL}d sendActionResponse: %{BOOL}d", buf, 0x18u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  id v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  id v8 = a1[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke;
  block[3] = &unk_1E58B2DC8;
  block[4] = a1;
  block[5] = buf;
  dispatch_sync(v8, block);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_2;
  v9[3] = &unk_1E58B3B90;
  char v10 = a2;
  v9[4] = a1;
  v9[5] = buf;
  char v11 = a3;
  [a1 allBadgeMetricsWithReplyHandler:v9];
  _Block_object_dispose(buf, 8);
}

void __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_13;
    v10[3] = &unk_1E58B2D80;
    id v11 = *(id *)(a1 + 40);
    [v7 allBadgeMetricsWithReplyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeMetricsWithReplyHandler failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2_14;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_3;
  v7[3] = &unk_1E58B3B68;
  v7[4] = v4;
  id v8 = v3;
  __int16 v10 = *(_WORD *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

+ (id)defaultService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ASDAppStoreService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EB4D6490 != -1) {
    dispatch_once(&qword_1EB4D6490, block);
  }
  v2 = (void *)_MergedGlobals_30;
  return v2;
}

void __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) allKeys];
    id v7 = [v5 setWithArray:v6];

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = [*(id *)(a1 + 40) allKeys];
    __int16 v10 = [v8 setWithArray:v9];

    v57 = [MEMORY[0x1E4F1CA60] dictionary];
    v56 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v66;
      id v14 = (void *)MEMORY[0x1E4F1CC08];
      do
      {
        uint64_t v15 = 0;
        id v59 = (id)v12;
        do
        {
          if (*(void *)v66 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v65 + 1) + 8 * v15);
          if ((objc_msgSend(v10, "containsObject:", v16, v56) & 1) == 0)
          {
            id v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v16];
            objc_opt_class();
            uint64_t v18 = _ASA(v17);

            if (*(unsigned char *)(a1 + 57))
            {
              v19 = v14;
              if (v18)
              {
                v20 = [v18 objectForKeyedSubscript:@"actionMetrics"];

                if (v20)
                {
                  v19 = [v18 objectForKeyedSubscript:@"actionMetrics"];
                }
                else
                {
                  v19 = v14;
                }
                uint64_t v12 = (uint64_t)v59;
              }
            }
            else
            {
              v19 = v14;
            }
            [v57 setValue:v19 forKey:v16];
          }
          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v12);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v60 = v10;
    uint64_t v21 = [v60 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v62;
      v24 = (void *)MEMORY[0x1E4F1CC08];
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v60);
          }
          uint64_t v26 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          if ((objc_msgSend(obj, "containsObject:", v26, v56) & 1) == 0)
          {
            v27 = [*(id *)(a1 + 40) objectForKeyedSubscript:v26];
            objc_opt_class();
            v28 = _ASA(v27);

            if (v28
              && ([v28 objectForKeyedSubscript:@"metrics"],
                  v29 = objc_claimAutoreleasedReturnValue(),
                  v29,
                  v29))
            {
              v30 = [v28 objectForKeyedSubscript:@"metrics"];
            }
            else
            {
              v30 = v24;
            }
            [v56 setValue:v30 forKey:v26];
          }
        }
        uint64_t v22 = [v60 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v22);
    }

    uint64_t v31 = *(void *)(a1 + 32);
    v32 = [v60 allObjects];
    v33 = (void *)[v56 copy];
    v34 = (void *)[v57 copy];
    id v35 = v32;
    id v36 = v33;
    id v37 = v34;
    if (v31)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v31 + 40));
      char v39 = objc_opt_respondsToSelector();

      if (v39)
      {
        v40 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v35;
          id v42 = v41;
          _os_log_impl(&dword_19BF6A000, v40, OS_LOG_TYPE_INFO, "[%{public}@] Handling apps refreshed to %{public}@", buf, 0x16u);
        }
        v43 = *(NSObject **)(v31 + 24);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke;
        v80 = &unk_1E58B2DF0;
        uint64_t v81 = v31;
        id v82 = v35;
        dispatch_async(v43, buf);
      }
      id v44 = objc_loadWeakRetained((id *)(v31 + 40));
      if (objc_opt_respondsToSelector())
      {
        uint64_t v45 = [v36 count];

        if (v45)
        {
          v46 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = objc_opt_class();
            *(_DWORD *)block = 138543618;
            *(void *)&void block[4] = v47;
            *(_WORD *)&block[12] = 2114;
            *(void *)&block[14] = v36;
            id v48 = v47;
            _os_log_impl(&dword_19BF6A000, v46, OS_LOG_TYPE_INFO, "[%{public}@] Handling didAddBadges %{public}@", block, 0x16u);
          }
          v49 = *(NSObject **)(v31 + 24);
          *(void *)block = MEMORY[0x1E4F143A8];
          *(void *)&block[8] = 3221225472;
          *(void *)&block[16] = __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_55;
          v76 = &unk_1E58B2DF0;
          uint64_t v77 = v31;
          id v78 = v36;
          dispatch_async(v49, block);
        }
      }
      else
      {
      }
      id v50 = objc_loadWeakRetained((id *)(v31 + 40));
      if (objc_opt_respondsToSelector())
      {
        uint64_t v51 = [v37 count];

        if (v51)
        {
          v52 = ASDLogHandleForCategory(13);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = objc_opt_class();
            *(_DWORD *)v71 = 138543618;
            *(void *)&v71[4] = v53;
            *(_WORD *)&v71[12] = 2114;
            *(void *)&v71[14] = v37;
            id v54 = v53;
            _os_log_impl(&dword_19BF6A000, v52, OS_LOG_TYPE_INFO, "[%{public}@] Handling didRemoveBadges %{public}@", v71, 0x16u);
          }
          v55 = *(NSObject **)(v31 + 24);
          *(void *)v71 = MEMORY[0x1E4F143A8];
          *(void *)&v71[8] = 3221225472;
          *(void *)&v71[16] = __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_58;
          v72 = &unk_1E58B2DF0;
          uint64_t v73 = v31;
          id v74 = v37;
          dispatch_async(v55, v71);
        }
      }
      else
      {
      }
    }
  }
}

- (void)setObserver:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__ASDAppStoreService_setObserver___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2_10;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke;
  v11[3] = &unk_1E58B3B18;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 getAppStoreServiceWithCompletionHandler:v11];
}

void __26__ASDAppStoreService_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    -[ASDAppStoreService _refreshCache:sendActionResponse:](WeakRetained, 1, 1);
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  int badgesChangedNotificationToken = self->_badgesChangedNotificationToken;
  if (badgesChangedNotificationToken != -1)
  {
    notify_cancel(badgesChangedNotificationToken);
    self->_int badgesChangedNotificationToken = -1;
  }
  int badgesChangedForAppStoreNotificationToken = self->_badgesChangedForAppStoreNotificationToken;
  if (badgesChangedForAppStoreNotificationToken != -1)
  {
    notify_cancel(badgesChangedForAppStoreNotificationToken);
    self->_int badgesChangedForAppStoreNotificationToken = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDAppStoreService;
  [(ASDAppStoreService *)&v5 dealloc];
}

- (ASDAppStoreChangedObserver)observer
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__ASDAppStoreService_observer__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDAppStoreChangedObserver *)v3;
}

uint64_t __30__ASDAppStoreService_observer__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  return MEMORY[0x1F41817F8]();
}

void __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] addBadgeIDs failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeMetricsWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

- (void)allBadgeIDsWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ASDServiceBroker defaultBroker];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke;
  v7[3] = &unk_1E58B3A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getAppStoreServiceWithCompletionHandler:v7];
}

void __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v6;
    int v7 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_16;
    v10[3] = &unk_1E58B2D30;
    id v11 = *(id *)(a1 + 40);
    [v7 allBadgeIDsWithReplyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeIDsWithReplyHandler failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeIDsWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], v3, v5);
}

void __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2_17;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2_17(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)badgeCountWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ASDServiceBroker defaultBroker];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke;
  v7[3] = &unk_1E58B3A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getAppStoreServiceWithCompletionHandler:v7];
}

void __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v6;
    int v7 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_19;
    v10[3] = &unk_1E58B3A78;
    id v11 = *(id *)(a1 + 40);
    [v7 badgeIDCountWithReplyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] badgeCountWithReplyHandler failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] badgeCountWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

uint64_t __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllBadgeIDsWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ASDServiceBroker defaultBroker];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke;
  v7[3] = &unk_1E58B3A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getAppStoreServiceWithCompletionHandler:v7];
}

void __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v6;
    int v7 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_21;
    v10[3] = &unk_1E58B2CE0;
    id v11 = *(id *)(a1 + 40);
    [v7 removeAllBadgeIDsWithReplyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] removeAllBadgeIDsWithReplyHandler failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] removeAllBadgeIDsWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_21(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2_22;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke;
  v11[3] = &unk_1E58B3B18;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 getAppStoreServiceWithCompletionHandler:v11];
}

void __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_23;
    v10[3] = &unk_1E58B2CE0;
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v6 removeBadgeIDs:v7 replyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] removeBadgeIDs failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] removeBadgeIDs failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2_24;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke;
  v11[3] = &unk_1E58B3B18;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 getAppStoreServiceWithCompletionHandler:v11];
}

void __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_25;
    v10[3] = &unk_1E58B2CE0;
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v6 removeBadgeMetricsForBadgeIDs:v7 replyHandler:v10];
  }
  else
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] removeMetricsForBadgeIDs failed with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] removeMetricsForBadgeIDs failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2_26;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASDServiceBroker defaultBroker];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke;
  v11[3] = &unk_1E58B3B18;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getAppStoreServiceWithCompletionHandler:v11];
}

void __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_2;
    v16[3] = &unk_1E58B3AA0;
    id v6 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v6;
    id v18 = *(id *)(a1 + 48);
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v16];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_27;
    v13[3] = &unk_1E58B3AF0;
    id v8 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v8;
    id v15 = *(id *)(a1 + 48);
    [v7 launchAppStoreWithURL:v14 withReplyHandler:v13];
  }
  else
  {
    id v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      id v24 = v5;
      id v12 = v10;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to launch %{public}@ error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v3;
    id v8 = v6;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to launch %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 2, v3, v5);
}

void __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      id v11 = v9;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to launch %{public}@ status: %ld", buf, 0x20u);
    }
  }
  uint64_t v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_28;
  block[3] = &unk_1E58B3AC8;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = a2;
  id v13 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_28(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)reloadWidgetOnConnectivityToEndpoint:(id)a3 parameters:(id)a4 replyHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[ASDServiceBroker defaultBroker];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke;
  v16[3] = &unk_1E58B3B40;
  id v19 = v11;
  SEL v20 = a2;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  [v12 getAppStoreServiceWithCompletionHandler:v16];
}

void __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2;
    v17[3] = &unk_1E58B3158;
    v17[4] = *(void *)(a1 + 32);
    long long v14 = *(_OWORD *)(a1 + 56);
    id v6 = (id)v14;
    long long v18 = v14;
    uint64_t v7 = [a2 remoteObjectProxyWithErrorHandler:v17];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_29;
    v15[3] = &unk_1E58B2CE0;
    id v16 = *(id *)(a1 + 56);
    [v7 reloadWidgetOnConnectivityToEndpoint:v8 parameters:v9 replyHandler:v15];
  }
  else
  {
    id v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      uint64_t v12 = *(const char **)(a1 + 64);
      id v13 = v11;
      *(_DWORD *)buf = 138543874;
      SEL v20 = v11;
      __int16 v21 = 2080;
      Name = sel_getName(v12);
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] %s failed with error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    id v6 = *(const char **)(a1 + 48);
    id v7 = v5;
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    Name = sel_getName(v6);
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] %s failed with xpc error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_29(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2_30;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained service:*(void *)(a1 + 32) badgesDidChange:*(void *)(a1 + 40)];
}

void __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained service:*(void *)(a1 + 32) didAddBadges:*(void *)(a1 + 40)];
}

void __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained service:*(void *)(a1 + 32) didRemoveBadges:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceBroker);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
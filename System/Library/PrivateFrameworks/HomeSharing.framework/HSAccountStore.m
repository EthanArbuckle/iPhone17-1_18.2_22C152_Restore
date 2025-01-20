@interface HSAccountStore
+ (id)defaultStore;
- (BOOL)canDetermineGroupID;
- (HSAccountStore)init;
- (ICURLRequest)groupIDRequest;
- (NSString)appleID;
- (NSString)groupID;
- (OS_dispatch_queue)queue;
- (void)_onBackgroundQueue_determineGroupIDWithCompletionHandler:(id)a3;
- (void)clearAllCredentials;
- (void)clearCaches;
- (void)clearGroupID;
- (void)dealloc;
- (void)determineGroupIDWithCompletionHandler:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupIDRequest:(id)a3;
- (void)setPassword:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HSAccountStore

uint64_t __56__HSAccountStore_determineGroupIDWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBackgroundQueue_determineGroupIDWithCompletionHandler:", *(void *)(a1 + 40));
}

- (NSString)groupID
{
  v2 = (void *)CFPreferencesCopyAppValue(@"homeSharingGroupID", @"com.apple.homesharing");
  return (NSString *)v2;
}

void __25__HSAccountStore_appleID__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 username];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 username];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    CFPreferencesSetAppValue(@"homeSharingAppleID", *(CFPropertyListRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"com.apple.homesharing");
    CFPreferencesSetAppValue(@"homeSharingDidSetDefaultAppleID", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.homesharing");
    CFPreferencesAppSynchronize(@"com.apple.homesharing");
    v9 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_2152C7000, v9, OS_LOG_TYPE_DEFAULT, "Setting anAppleID=%@", (uint8_t *)&v11, 0xCu);
    }

    notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), 0);
    notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __30__HSAccountStore_defaultStore__block_invoke()
{
  defaultStore_defaultStore = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (HSAccountStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)HSAccountStore;
  v2 = [(HSAccountStore *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.HomeSharing.HSAccountStore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __22__HSAccountStore_init__block_invoke;
    handler[3] = &unk_264239C98;
    uint64_t v7 = v2;
    notify_register_dispatch("com.apple.mobileipod.HomeSharingDefaultsDidChange", &v2->_defaultsDidChangeToken, MEMORY[0x263EF83A0], handler);
    CFPreferencesAppSynchronize(@"com.apple.homesharing");
  }
  return v2;
}

- (void)_onBackgroundQueue_determineGroupIDWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HSAccountStore *)self canDetermineGroupID])
  {
    uint64_t v5 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(HSAccountStore *)self appleID];
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_2152C7000, v5, OS_LOG_TYPE_DEFAULT, "Determining Group ID for Apple ID: %@", buf, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x263F89360]);
    objc_super v8 = [MEMORY[0x263F893C0] activeAccount];
    v9 = (void *)[v7 initWithIdentity:v8];

    uint64_t v10 = [MEMORY[0x263F893A0] sharedBagProvider];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke;
    v12[3] = &unk_264239D38;
    id v13 = v9;
    id v14 = v4;
    v12[4] = self;
    id v11 = v9;
    [v10 getBagForRequestContext:v11 withCompletionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (BOOL)canDetermineGroupID
{
  dispatch_queue_t v3 = [(HSAccountStore *)self appleID];
  if (v3)
  {
    id v4 = [(HSAccountStore *)self password];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)appleID
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = (id)CFPreferencesCopyAppValue(@"homeSharingAppleID", @"com.apple.homesharing");
  if (!CFPreferencesGetAppBooleanValue(@"homeSharingDidSetDefaultAppleID", @"com.apple.homesharing", 0)
    && ![(id)v13[5] length])
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = [MEMORY[0x263F893C8] defaultIdentityStore];
    BOOL v5 = [MEMORY[0x263F893C0] activeAccount];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __25__HSAccountStore_appleID__block_invoke;
    v9[3] = &unk_264239CC0;
    id v11 = &v12;
    v9[4] = self;
    uint64_t v6 = v3;
    uint64_t v10 = v6;
    [v4 getPropertiesForUserIdentity:v5 completionHandler:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSString *)v7;
}

+ (id)defaultStore
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HSAccountStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, block);
  }
  v2 = (void *)defaultStore_defaultStore;
  return v2;
}

- (void)determineGroupIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HSAccountStore_determineGroupIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A398;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_groupIDRequest, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setGroupIDRequest:(id)a3
{
}

- (ICURLRequest)groupIDRequest
{
  return self->_groupIDRequest;
}

- (void)setGroupID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_2152C7000, v5, OS_LOG_TYPE_DEFAULT, "Setting groupID=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  CFPreferencesSetAppValue(@"homeSharingGroupID", v4, @"com.apple.homesharing");
  CFPreferencesAppSynchronize(@"com.apple.homesharing");
  notify_set_state(self->_defaultsDidChangeToken, 1uLL);
  notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
}

- (void)clearGroupID
{
  dispatch_semaphore_t v3 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_DEFAULT, "Clearing group id", v4, 2u);
  }

  [(HSAccountStore *)self setGroupID:0];
}

- (void)clearCaches
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = HSLibraryCacheAllKnownCacheDirectories();
  dispatch_semaphore_t v3 = [MEMORY[0x263F08850] defaultManager];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v9;
          _os_log_impl(&dword_2152C7000, v10, OS_LOG_TYPE_DEFAULT, "Removing sharing Home Sharing library caches at path: %{public}@", buf, 0xCu);
        }

        [v3 removeItemAtPath:v9 error:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v6);
  }

  notify_post((const char *)[@"HSCachesClearedNotification" UTF8String]);
}

- (void)clearAllCredentials
{
  dispatch_semaphore_t v3 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all credentials", v4, 2u);
  }

  [(HSAccountStore *)self setAppleID:0];
  [(HSAccountStore *)self setPassword:0];
  [(HSAccountStore *)self setGroupID:0];
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [a2 urlForBagKey:*MEMORY[0x263F89048]];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v5];
    [v6 setHTTPMethod:@"POST"];
    uint64_t v7 = [MEMORY[0x263F89108] currentDeviceInfo];
    uint64_t v8 = [v7 deviceGUID];

    uint64_t v9 = NSDictionary;
    uint64_t v10 = [*(id *)(a1 + 32) appleID];
    long long v11 = [*(id *)(a1 + 32) password];
    long long v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"appleId", v11, @"password", v8, @"guid", 0);

    id v30 = 0;
    long long v13 = [MEMORY[0x263F08AC0] dataWithPropertyList:v12 format:100 options:0 error:&v30];
    id v14 = v30;
    v15 = v14;
    if (!v13 || v14)
    {
      v24 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = v15;
        __int16 v33 = 2114;
        v34 = v12;
        _os_log_impl(&dword_2152C7000, v24, OS_LOG_TYPE_DEFAULT, "failed to serialize body data. err=%{public}@, bodyDictionary=%{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      [v6 setHTTPBody:v13];
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F89368]) initWithURLRequest:v6 requestContext:*(void *)(a1 + 40)];
      id v17 = [MEMORY[0x263F893B8] defaultSession];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_53;
      v27[3] = &unk_264239D10;
      id v18 = *(id *)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 32);
      id v29 = v18;
      v27[4] = v19;
      id v20 = v16;
      id v28 = v20;
      [v17 enqueueDataRequest:v20 withCompletionHandler:v27];

      uint64_t v21 = *(void *)(a1 + 32);
      v22 = *(NSObject **)(v21 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2_62;
      block[3] = &unk_264239E50;
      block[4] = v21;
      id v26 = v20;
      id v23 = v20;
      dispatch_sync(v22, block);
    }
  }
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264239CE8;
  id v13 = v5;
  id v14 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v17 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2_62(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    dispatch_semaphore_t v3 = [MEMORY[0x263F893B8] defaultSession];
    [v3 cancelRequest:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v6 = *(void **)(a1 + 40);
  objc_storeStrong((id *)(v2 + 16), v6);
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) urlResponse];
  dispatch_semaphore_t v3 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 statusCode];
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v22 = v4;
    __int16 v23 = 2114;
    uint64_t v24 = v5;
    _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_DEFAULT, "Request got status code: %ld, error = %{public}@", buf, 0x16u);
  }

  if (*(void *)(a1 + 40) && (uint64_t v6 = *(void *)(a1 + 64)) != 0)
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    if ([v2 statusCode] >= 200
      && [v2 statusCode] <= 299
      && ([*(id *)(a1 + 32) bodyData],
          id v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 length],
          v7,
          v8))
    {
      uint64_t v9 = [*(id *)(a1 + 32) parsedBodyDictionary];
      id v10 = [v9 objectForKey:@"status"];
      uint64_t v11 = [v10 integerValue];

      if (v11)
      {
        long long v12 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = v11;
          _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_DEFAULT, "Determine Group ID request returned status %ld", buf, 0xCu);
        }
      }
      id v13 = [v9 objectForKey:@"sgid"];
      uint64_t v14 = [v13 length];
      if (v14)
      {
        [*(id *)(a1 + 48) setGroupID:v13];
        [*(id *)(a1 + 48) setPassword:0];
      }
      else if (v11 == 5507)
      {
        HSSetKeychainValueForAccountWithService(0);
        CFPreferencesSetAppValue(@"homeSharingAppleID", 0, @"com.apple.homesharing");
        CFPreferencesAppSynchronize(@"com.apple.homesharing");
        notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
      }
      uint64_t v16 = *(void *)(a1 + 64);
      if (v16) {
        (*(void (**)(uint64_t, BOOL, void))(v16 + 16))(v16, v14 != 0, 0);
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 64);
      if (v15) {
        (*(void (**)(uint64_t, void, void))(v15 + 16))(v15, 0, 0);
      }
    }
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = *(NSObject **)(v17 + 24);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_60;
    v19[3] = &unk_264239E50;
    v19[4] = v17;
    id v20 = *(id *)(a1 + 56);
    dispatch_sync(v18, v19);
  }
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  dispatch_semaphore_t v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(void *)(v1 + 16) = 0;
  }
}

- (void)setPassword:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HSAccountStore *)self password];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    if (v4)
    {
      id v7 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2152C7000, v7, OS_LOG_TYPE_DEFAULT, "passwords are different - clearing groupid", buf, 2u);
      }

      [(HSAccountStore *)self clearGroupID];
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__HSAccountStore_setPassword___block_invoke;
    block[3] = &unk_26423A410;
    void block[4] = self;
    dispatch_sync(queue, block);
    HSSetKeychainValueForAccountWithService(v4);
  }
}

void __30__HSAccountStore_setPassword___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = [MEMORY[0x263F893B8] defaultSession];
    [v2 cancelRequest:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
}

- (void)setAppleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HSAccountStore *)self appleID];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(HSAccountStore *)self appleID];
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_2152C7000, v7, OS_LOG_TYPE_DEFAULT, "ids are different new=%@, old=%@", buf, 0x16u);
    }
    [(HSAccountStore *)self clearGroupID];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__HSAccountStore_setAppleID___block_invoke;
    block[3] = &unk_26423A410;
    void block[4] = self;
    dispatch_sync(queue, block);
    CFPreferencesSetAppValue(@"homeSharingAppleID", v4, @"com.apple.homesharing");
    CFPreferencesAppSynchronize(@"com.apple.homesharing");
    notify_set_state(self->_defaultsDidChangeToken, 0);
    notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
  }
}

void __29__HSAccountStore_setAppleID___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = [MEMORY[0x263F893B8] defaultSession];
    [v2 cancelRequest:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
}

- (void)dealloc
{
  notify_cancel(self->_defaultsDidChangeToken);
  if (self->_groupIDRequest)
  {
    uint64_t v3 = [MEMORY[0x263F893B8] defaultSession];
    [v3 cancelRequest:self->_groupIDRequest];

    groupIDRequest = self->_groupIDRequest;
    self->_groupIDRequest = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HSAccountStore;
  [(HSAccountStore *)&v5 dealloc];
}

void __22__HSAccountStore_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFPreferencesAppSynchronize(@"com.apple.homesharing");
  uint64_t state64 = 0;
  if (!notify_get_state(a2, &state64) && state64 == 1)
  {
    id v4 = [*(id *)(a1 + 32) groupID];
    if (v4)
    {
      objc_super v5 = [NSDictionary dictionaryWithObject:v4 forKey:@"groupID"];
    }
    else
    {
      objc_super v5 = 0;
    }
    char v6 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_2152C7000, v6, OS_LOG_TYPE_DEFAULT, "Responding to group id changed notification - newGroupID=%@", buf, 0xCu);
    }

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"HSGroupIDDidChangeNotification" object:*(void *)(a1 + 32) userInfo:v5];
  }
}

@end
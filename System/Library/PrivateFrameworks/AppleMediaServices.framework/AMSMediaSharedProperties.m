@interface AMSMediaSharedProperties
+ (NSMapTable)sharedPropertiesMapTable;
+ (OS_dispatch_queue)accessQueue;
+ (id)_propertiesForClientIdentifier:(id)a3 account:(id)a4 bag:(id)a5 clientInfo:(id)a6 URLKnownToBeTrusted:(BOOL)a7;
+ (id)propertiesForMarketingItemTask:(id)a3;
+ (id)propertiesForMediaTask:(id)a3;
+ (id)propertiesForMercuryCacheFetchTask:(id)a3;
+ (id)propertiesForNotificationSettingsTask:(id)a3;
+ (id)propertiesForRatingsTask:(id)a3;
+ (id)propertiesForStorefrontsTask:(id)a3;
+ (id)propertiesForUserNotificationSettingsTask:(id)a3;
- (AMSMediaTokenServiceProtocol)tokenService;
- (AMSURLSession)session;
- (id)_initWithClientIdentifier:(id)a3 account:(id)a4 bag:(id)a5 clientInfo:(id)a6 URLKnownToBeTrusted:(BOOL)a7;
- (void)dealloc;
@end

@implementation AMSMediaSharedProperties

void __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 48) sharedPropertiesMapTable];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)_propertiesForClientIdentifier:(id)a3 account:(id)a4 bag:(id)a5 clientInfo:(id)a6 URLKnownToBeTrusted:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__41;
  v38 = __Block_byref_object_dispose__41;
  id v39 = 0;
  v16 = [a1 accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke;
  block[3] = &unk_1E55A2470;
  v32 = &v34;
  id v33 = a1;
  id v17 = v12;
  id v31 = v17;
  dispatch_sync(v16, block);

  v18 = (void *)v35[5];
  if (!v18)
  {
    v19 = [a1 accessQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke_2;
    v22[3] = &unk_1E55A3BF8;
    v27 = &v34;
    id v28 = a1;
    id v23 = v17;
    id v24 = v13;
    id v25 = v14;
    id v26 = v15;
    BOOL v29 = a7;
    dispatch_barrier_sync(v19, v22);

    v18 = (void *)v35[5];
  }
  id v20 = v18;

  _Block_object_dispose(&v34, 8);
  return v20;
}

void __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 72) sharedPropertiesMapTable];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v6 = [[AMSMediaSharedProperties alloc] _initWithClientIdentifier:*(void *)(a1 + 32) account:*(void *)(a1 + 40) bag:*(void *)(a1 + 48) clientInfo:*(void *)(a1 + 56) URLKnownToBeTrusted:*(unsigned __int8 *)(a1 + 80)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [*(id *)(a1 + 72) sharedPropertiesMapTable];
    [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

+ (NSMapTable)sharedPropertiesMapTable
{
  uint64_t v2 = [a1 accessQueue];
  dispatch_assert_queue_V2(v2);

  if (qword_1EB38DCB0 != -1) {
    dispatch_once(&qword_1EB38DCB0, &__block_literal_global_8);
  }
  uint64_t v3 = (void *)qword_1EB38DCB8;
  return (NSMapTable *)v3;
}

+ (OS_dispatch_queue)accessQueue
{
  if (_MergedGlobals_121 != -1) {
    dispatch_once(&_MergedGlobals_121, &__block_literal_global_76);
  }
  uint64_t v2 = (void *)qword_1EB38DCA8;
  return (OS_dispatch_queue *)v2;
}

- (id)_initWithClientIdentifier:(id)a3 account:(id)a4 bag:(id)a5 clientInfo:(id)a6 URLKnownToBeTrusted:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)AMSMediaSharedProperties;
  v16 = [(AMSMediaSharedProperties *)&v25 init];
  if (v16)
  {
    id v17 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    v18 = [[AMSURLSession alloc] initWithConfiguration:v17];
    v19 = [[AMSMediaTokenService alloc] initWithClientIdentifier:v12 bag:v14];
    [(AMSMediaTokenService *)v19 setAccount:v13];
    [(AMSMediaTokenService *)v19 setClientInfo:v15];
    [(AMSMediaTokenService *)v19 setSession:v18];
    [(AMSMediaTokenService *)v19 setURLKnownToBeTrusted:v7];
    id v20 = [[AMSMediaProtocolHandler alloc] initWithTokenService:v19];
    [(AMSURLSession *)v18 setProtocolHandler:v20];
    session = v16->_session;
    v16->_session = v18;
    v22 = v18;

    tokenService = v16->_tokenService;
    v16->_tokenService = (AMSMediaTokenServiceProtocol *)v19;
  }
  return v16;
}

+ (id)propertiesForMarketingItemTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 account];
  BOOL v7 = [v4 bag];
  v8 = [v4 clientInfo];

  id v9 = [a1 _propertiesForClientIdentifier:v5 account:v6 bag:v7 clientInfo:v8 URLKnownToBeTrusted:0];

  return v9;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (AMSMediaTokenServiceProtocol)tokenService
{
  return self->_tokenService;
}

+ (id)propertiesForMediaTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 account];
  BOOL v7 = [v4 bag];
  v8 = [v4 clientInfo];
  uint64_t v9 = [v4 URLKnownToBeTrusted];

  v10 = [a1 _propertiesForClientIdentifier:v5 account:v6 bag:v7 clientInfo:v8 URLKnownToBeTrusted:v9];

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = [(AMSMediaSharedProperties *)self session];
  [v3 invalidateAndCancel];

  v4.receiver = self;
  v4.super_class = (Class)AMSMediaSharedProperties;
  [(AMSMediaSharedProperties *)&v4 dealloc];
}

uint64_t __52__AMSMediaSharedProperties_sharedPropertiesMapTable__block_invoke()
{
  qword_1EB38DCB8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:5];
  return MEMORY[0x1F41817F8]();
}

uint64_t __39__AMSMediaSharedProperties_accessQueue__block_invoke()
{
  qword_1EB38DCA8 = (uint64_t)dispatch_queue_create("com.apple.AppleMediaServices.AMSMediaSharedProperties", MEMORY[0x1E4F14430]);
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenService, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

+ (id)propertiesForMercuryCacheFetchTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 account];
  BOOL v7 = [v4 bag];
  v8 = [v4 clientInfo];

  uint64_t v9 = [a1 _propertiesForClientIdentifier:v5 account:v6 bag:v7 clientInfo:v8 URLKnownToBeTrusted:0];

  return v9;
}

+ (id)propertiesForRatingsTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 bag];

  BOOL v7 = [a1 _propertiesForClientIdentifier:v5 account:0 bag:v6 clientInfo:0 URLKnownToBeTrusted:0];

  return v7;
}

+ (id)propertiesForStorefrontsTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 bag];

  BOOL v7 = [a1 _propertiesForClientIdentifier:v5 account:0 bag:v6 clientInfo:0 URLKnownToBeTrusted:0];

  return v7;
}

+ (id)propertiesForNotificationSettingsTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 account];
  id v6 = [v4 bag];
  BOOL v7 = [v4 clientInfo];

  v8 = [a1 _propertiesForClientIdentifier:@"com.apple.AppleMediaServices" account:v5 bag:v6 clientInfo:v7 URLKnownToBeTrusted:0];

  return v8;
}

+ (id)propertiesForUserNotificationSettingsTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 account];
  BOOL v7 = [v4 bag];
  v8 = [v4 clientInfo];

  uint64_t v9 = [a1 _propertiesForClientIdentifier:v5 account:v6 bag:v7 clientInfo:v8 URLKnownToBeTrusted:0];

  return v9;
}

@end
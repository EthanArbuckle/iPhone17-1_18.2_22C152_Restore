@interface CKContextClient
+ (BOOL)isLikelyUnsolicitedUserInteraction;
+ (double)timeIntervalBetweenMachTime:(unint64_t)a3 andMachTime:(unint64_t)a4;
+ (id)clientWithDefaultRequestType:(unint64_t)a3;
+ (id)clientWithPreferredRequestType:(unint64_t)a3;
+ (void)_observeApplicationStateNotifications;
+ (void)initialize;
+ (void)isLikelyUnsolicitedUserInteraction;
- (CKContextClient)initWithDefaultRequestType:(unint64_t)a3;
- (NSSet)capabilities;
- (id)createRequest;
- (id)indexVersionId;
- (id)newRequest;
- (id)retrieveCapabilites;
- (int64_t)tryAcquireServiceSemaphoreNeedsIncPending:(BOOL)a3;
- (unint64_t)defaultRequestType;
- (void)ancestorsForTopics:(id)a3 withReply:(id)a4;
- (void)capabilitiesWithReply:(id)a3;
- (void)didReceiveCKContextServiceUpdateNotification;
- (void)ensureFullyInitialized;
- (void)groupResponses:(id)a3 withReply:(id)a4;
- (void)registerConfigurationUpdateHandler:(id)a3;
- (void)retrieveCapabilitiesWithReply:(id)a3;
- (void)updateCachedCapabilitiesWithReply:(id)a3;
- (void)workWithServiceSemaphore:(id)a3;
@end

@implementation CKContextClient

+ (double)timeIntervalBetweenMachTime:(unint64_t)a3 andMachTime:(unint64_t)a4
{
  unint64_t v4 = a4 - a3;
  if (a3 >= a4) {
    unint64_t v4 = a3 - a4;
  }
  return (double)(v4 * _timebaseInfo / *(unsigned int *)algn_1EB47071C) / 1000.0 / 1000.0 / 1000.0;
}

- (unint64_t)defaultRequestType
{
  return self->_defaultRequestType;
}

- (int64_t)tryAcquireServiceSemaphoreNeedsIncPending:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_serviceSemaphore;
  objc_sync_exit(v4);

  if (v5) {
    int64_t v6 = [(CKContextSemaphore *)v5 tryAcquireNeedsIncPending:v3];
  }
  else {
    int64_t v6 = 2;
  }

  return v6;
}

- (id)newRequest
{
  BOOL v3 = [CKContextRequest alloc];
  return [(CKContextRequest *)v3 initForClient:self];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    mach_timebase_info((mach_timebase_info_t)&_timebaseInfo);
    BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 bundleIdentifier];

    if ([v4 isEqualToString:@"com.apple.mobilesafari"])
    {
      _application_start_mt = mach_continuous_approximate_time();
      [a1 _observeApplicationStateNotifications];
    }
  }
}

+ (void)_observeApplicationStateNotifications
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = (id)[v2 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:&__block_literal_global];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = (id)[v4 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:&__block_literal_global_53];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = (id)[v7 addObserverForName:@"UIApplicationDidBecomeActiveNotification" object:0 queue:0 usingBlock:&__block_literal_global_55];
}

uint64_t __56__CKContextClient__observeApplicationStateNotifications__block_invoke()
{
  uint64_t result = mach_continuous_approximate_time();
  atomic_store(result, &_last_background_mt);
  return result;
}

uint64_t __56__CKContextClient__observeApplicationStateNotifications__block_invoke_2()
{
  uint64_t result = mach_continuous_approximate_time();
  atomic_store(result, &_last_foreground_mt);
  return result;
}

uint64_t __56__CKContextClient__observeApplicationStateNotifications__block_invoke_3()
{
  uint64_t result = mach_continuous_approximate_time();
  atomic_store(result, &_last_foreground_mt);
  return result;
}

- (CKContextClient)initWithDefaultRequestType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKContextClient;
  id v4 = [(CKContextClient *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_defaultRequestType = a3;
    uint64_t v6 = objc_opt_new();
    updateHandlers = v5->_updateHandlers;
    v5->_updateHandlers = (NSMutableArray *)v6;

    +[CKContextXPCClient registerForServiceUpdateNotifications:v5];
    [(CKContextClient *)v5 updateCachedCapabilitiesWithReply:0];
  }
  return v5;
}

- (void)ensureFullyInitialized
{
  obj = self;
  objc_sync_enter(obj);
  objc_sync_exit(obj);
}

- (void)didReceiveCKContextServiceUpdateNotification
{
  v2 = self;
  objc_sync_enter(v2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Received ContextKit configuration update notification", (uint8_t *)buf, 2u);
  }
  id v3 = (void *)[(NSString *)v2->_indexVersionId copy];
  objc_initWeak(buf, v2);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke;
  v5[3] = &unk_1E5B48478;
  objc_copyWeak(&v7, buf);
  id v4 = v3;
  id v6 = v4;
  [(CKContextClient *)v2 updateCachedCapabilitiesWithReply:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);

  objc_sync_exit(v2);
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    id v5 = (void *)*((void *)v4 + 2);
    if (v5)
    {
      if ([v5 isEqualToString:*(void *)(a1 + 32)])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_2((uint64_t *)v4 + 2);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v7 = *((void *)v4 + 2);
          *(_DWORD *)buf = 138412546;
          uint64_t v21 = v6;
          __int16 v22 = 2112;
          uint64_t v23 = v7;
          _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ContextKit indexVersionId changed: %@ to %@", buf, 0x16u);
        }
        v8 = MEMORY[0x1E4F14500];
        id v9 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_3(buf, [*((id *)v4 + 3) count]);
        }

        v10 = dispatch_get_global_queue(17, 0);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v11 = *((id *)v4 + 3);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v11);
              }
              dispatch_async(v10, *(dispatch_block_t *)(*((void *)&v15 + 1) + 8 * i));
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v12);
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_1();
    }
    objc_sync_exit(v4);
  }
}

- (void)updateCachedCapabilitiesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  capabilities = v5->_capabilities;
  v5->_capabilities = 0;

  objc_initWeak(&location, v5);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[CKContextClient updateCachedCapabilitiesWithReply:]();
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CKContextClient_updateCachedCapabilitiesWithReply___block_invoke;
  v8[3] = &unk_1E5B484A0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [(CKContextClient *)v5 retrieveCapabilitiesWithReply:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);
}

void __53__CKContextClient_updateCachedCapabilitiesWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = (id *)WeakRetained;
    objc_sync_enter(v9);
    if (v12) {
      objc_storeStrong(v9 + 1, a2);
    }
    if (v6) {
      objc_storeStrong(v9 + 2, a3);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
    objc_sync_exit(v9);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

+ (id)clientWithDefaultRequestType:(unint64_t)a3
{
  if (a3 <= 0x15) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = [[CKContextClient alloc] initWithDefaultRequestType:v3];
  return v4;
}

+ (id)clientWithPreferredRequestType:(unint64_t)a3
{
  if (a3 <= 0x15) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = [[CKContextClient alloc] initWithDefaultRequestType:v3];
  return v4;
}

- (id)createRequest
{
  id v2 = [[CKContextRequest alloc] initForClient:self];
  return v2;
}

- (void)capabilitiesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(CKContextClient *)self newRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CKContextClient_capabilitiesWithReply___block_invoke;
  v7[3] = &unk_1E5B484C8;
  id v8 = v4;
  id v6 = v4;
  [v5 capabilitiesWithReply:v7];
}

uint64_t __41__CKContextClient_capabilitiesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerConfigurationUpdateHandler:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  updateHandlers = v4->_updateHandlers;
  id v6 = (void *)MEMORY[0x1A625EF90](v7);
  [(NSMutableArray *)updateHandlers addObject:v6];

  objc_sync_exit(v4);
}

- (id)retrieveCapabilites
{
  id v2 = self;
  objc_sync_enter(v2);
  capabilities = v2->_capabilities;
  if (capabilities)
  {
    id v4 = capabilities;
  }
  else
  {
    uint64_t v5 = +[CKContextRequest requestServiceSemaphore];
    serviceSemaphore = v2->_serviceSemaphore;
    v2->_serviceSemaphore = (CKContextSemaphore *)v5;

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy_;
    __int16 v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    id v7 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
    id v8 = [(CKContextClient *)v2 newRequest];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__CKContextClient_retrieveCapabilites__block_invoke;
    v14[3] = &unk_1E5B484F0;
    long long v16 = &v24;
    long long v17 = &v18;
    id v9 = v7;
    id v15 = v9;
    [v8 capabilitiesWithReply:v14];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:10.0];
    char v11 = [v9 waitUntilDate:v10];

    if (v11)
    {
      objc_storeStrong((id *)&v2->_indexVersionId, (id)v19[5]);
      objc_storeStrong((id *)&v2->_capabilities, (id)v25[5]);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "retrieveCapabilites timeout", v13, 2u);
    }
    id v4 = v2->_capabilities;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  objc_sync_exit(v2);

  return v4;
}

void __38__CKContextClient_retrieveCapabilites__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "capabilitiesWithReply returned error: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    if (v8) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    }
  }
  [*(id *)(a1 + 32) signal];
}

- (void)retrieveCapabilitiesWithReply:(id)a3
{
  id v4 = (void (**)(id, NSSet *, NSString *))a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    capabilities = v5->_capabilities;
    if (capabilities)
    {
      v4[2](v4, capabilities, v5->_indexVersionId);
    }
    else if (v5->_serviceSemaphore)
    {
      id v7 = [(CKContextClient *)v5 newRequest];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_67;
      v8[3] = &unk_1E5B484C8;
      id v9 = v4;
      [v7 capabilitiesWithReply:v8];
    }
    else
    {
      objc_initWeak(&location, v5);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke;
      v10[3] = &unk_1E5B48518;
      objc_copyWeak(&v12, &location);
      v10[4] = v5;
      uint64_t v11 = v4;
      +[CKContextRequest requestServiceSemaphoreWithReply:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v5);
  }
}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke(id *a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 4, a2);
    id v7 = (void *)[a1[4] newRequest];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2;
    v8[3] = &unk_1E5B484C8;
    id v9 = a1[5];
    [v7 capabilitiesWithReply:v8];
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2_cold_1((uint64_t)v9);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_67(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2_cold_1((uint64_t)v9);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

- (id)indexVersionId
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_indexVersionId;
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)capabilities
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)workWithServiceSemaphore:(id)a3
{
}

- (void)ancestorsForTopics:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke;
  v9[3] = &unk_1E5B48590;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  _os_activity_initiate(&dword_1A45F4000, "CKContextClient ancestorsForTopics", OS_ACTIVITY_FLAG_DEFAULT, v9);
}

void __48__CKContextClient_ancestorsForTopics_withReply___block_invoke(uint64_t a1)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2810000000;
  v15[3] = &unk_1A460783D;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2810000000;
  v13[3] = &unk_1A460783D;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_2;
  v8[3] = &unk_1E5B48568;
  id v11 = v15;
  id v12 = v13;
  id v10 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1A625EF90](v8);
  unint64_t v3 = +[CKContextXPCClient xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_4;
  v6[3] = &unk_1E5B48540;
  id v4 = v2;
  id v7 = v4;
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v6];
  [v5 ancestorsForTopics:*(void *)(a1 + 32) withReply:v4];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

void __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 1u) & 1) == 0)
  {
    id v7 = +[CKContextXPCClient isXPCConnectionError:v6];
    if (!v7 || (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 32), 1u) & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_3;
      v9[3] = &unk_1E5B48540;
      id v10 = *(id *)(a1 + 40);
      id v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
      [v8 ancestorsForTopics:*(void *)(a1 + 32) withReply:*(void *)(a1 + 40)];
    }
  }
}

uint64_t __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__CKContextClient_ancestorsForTopics_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)groupResponses:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
    if ((unint64_t)[v7 count] >= 0x1F5)
    {
      uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, 500);

      id v7 = (id)v8;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__CKContextClient_groupResponses_withReply___block_invoke;
    v10[3] = &unk_1E5B48590;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    _os_activity_initiate(&dword_1A45F4000, "CKContextClient groupResponses", OS_ACTIVITY_FLAG_DEFAULT, v10);
  }
}

void __44__CKContextClient_groupResponses_withReply___block_invoke(uint64_t a1)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2810000000;
  v15[3] = &unk_1A460783D;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2810000000;
  v13[3] = &unk_1A460783D;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CKContextClient_groupResponses_withReply___block_invoke_2;
  v8[3] = &unk_1E5B485B8;
  id v11 = v15;
  id v12 = v13;
  id v10 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1A625EF90](v8);
  unint64_t v3 = +[CKContextXPCClient xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CKContextClient_groupResponses_withReply___block_invoke_4;
  v6[3] = &unk_1E5B48540;
  id v4 = v2;
  id v7 = v4;
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v6];
  [v5 groupResponses:*(void *)(a1 + 32) withReply:v4];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

void __44__CKContextClient_groupResponses_withReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 1u) & 1) == 0)
  {
    id v7 = +[CKContextXPCClient isXPCConnectionError:v6];
    if (!v7 || (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 32), 1u) & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__CKContextClient_groupResponses_withReply___block_invoke_3;
      v9[3] = &unk_1E5B48540;
      id v10 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
      [v8 groupResponses:*(void *)(a1 + 32) withReply:*(void *)(a1 + 40)];
    }
  }
}

uint64_t __44__CKContextClient_groupResponses_withReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__CKContextClient_groupResponses_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isLikelyUnsolicitedUserInteraction
{
  if (!_application_start_mt) {
    return 0;
  }
  unint64_t v3 = atomic_load(&_last_background_mt);
  unint64_t v4 = atomic_load(&_last_foreground_mt);
  if (v3 > v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[CKContextClient isLikelyUnsolicitedUserInteraction]();
    }
    unint64_t v5 = atomic_load(&_last_foreground_mt);
    atomic_store(v5, &_last_background_mt);
  }
  uint64_t v6 = mach_continuous_approximate_time();
  unint64_t v7 = _application_start_mt;
  if (atomic_load(&_last_background_mt))
  {
    if (atomic_load(&_last_foreground_mt))
    {
      unint64_t v10 = atomic_load(&_last_background_mt);
      unint64_t v11 = atomic_load(&_last_foreground_mt);
      [a1 timeIntervalBetweenMachTime:v10 andMachTime:v11];
      if (v12 > 900.0) {
        unint64_t v7 = atomic_load(&_last_foreground_mt);
      }
    }
  }
  [a1 timeIntervalBetweenMachTime:v7 andMachTime:v6];
  return v13 < 15.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSemaphore, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_indexVersionId, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ContextKit indexVersionId is nil", v0, 2u);
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_2(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "ContextKit indexVersionId unchanged: %@", (uint8_t *)&v2, 0xCu);
}

void __63__CKContextClient_didReceiveCKContextServiceUpdateNotification__block_invoke_cold_3(uint8_t *buf, uint64_t a2)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Notifying %lu registered update handlers", buf, 0xCu);
}

- (void)updateCachedCapabilitiesWithReply:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Updating capabilties asynchronously", v0, 2u);
}

void __49__CKContextClient_retrieveCapabilitiesWithReply___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "CapabilitiesWithReply returned error: %@", (uint8_t *)&v1, 0xCu);
}

+ (void)isLikelyUnsolicitedUserInteraction
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Did not receive an expected foreground notification", v0, 2u);
}

@end
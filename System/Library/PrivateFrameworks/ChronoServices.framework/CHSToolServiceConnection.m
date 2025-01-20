@interface CHSToolServiceConnection
+ (id)sharedInstance;
- (CHSToolServiceConnection)init;
- (id)_init;
- (id)_queue_remoteTarget;
- (void)_queue_addClient:(id)a3;
- (void)_queue_createConnection;
- (void)_queue_invalidateConnection;
- (void)_queue_removeClient:(id)a3;
- (void)addClient:(id)a3;
- (void)allCachedSnapshotURLsWithCompletion:(id)a3;
- (void)contentURLForActivityID:(id)a3 completion:(id)a4;
- (void)expireLocationGracePeriods;
- (void)extensionInfo:(id)a3;
- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchStateWithCompletion:(id)a3;
- (void)fetchWidgetSceneInfoWithCompletion:(id)a3;
- (void)listStateCaptureIdentifiersWithCompletion:(id)a3;
- (void)refreshDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4;
- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)removeClient:(id)a3;
- (void)resetCaches:(unint64_t)a3 completion:(id)a4;
- (void)runMigrationReaper;
- (void)runReaper;
- (void)timelineForWidgetKey:(id)a3 completion:(id)a4;
- (void)widgetsWithTimelines:(id)a3;
@end

@implementation CHSToolServiceConnection

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

void __42__CHSToolServiceConnection_sharedInstance__block_invoke()
{
  id v0 = [[CHSToolServiceConnection alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

- (CHSToolServiceConnection)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSToolServiceConnection.m" lineNumber:42 description:@"use +sharedInstance"];

  return 0;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)CHSToolServiceConnection;
  v2 = [(CHSToolServiceConnection *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    queue_clients = v2->_queue_clients;
    v2->_queue_clients = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.chronoservices.CHSChronoServicesToolConnection", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CHSToolServiceConnection_addClient___block_invoke;
  v7[3] = &unk_1E56C81F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __38__CHSToolServiceConnection_addClient___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_createConnection");
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return objc_msgSend(v2, "_queue_addClient:", v3);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CHSToolServiceConnection_removeClient___block_invoke;
  v7[3] = &unk_1E56C81F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __41__CHSToolServiceConnection_removeClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeClient:", *(void *)(a1 + 40));
}

- (void)refreshDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E56C86F8;
    uint64_t v3 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v2 refreshDescriptorsForExtensionBundleIdentifier:v3 completion:v8];
    id v4 = v9;
  }
  else
  {
    v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

void __86__CHSToolServiceConnection_refreshDescriptorsForExtensionBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  v5 = [a2 extensions];
  uint64_t v6 = [v5 anyObject];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allCachedSnapshotURLsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke_2;
    v8[3] = &unk_1E56C8720;
    id v9 = *(id *)(a1 + 40);
    [v2 allCachedSnapshotURLsWithCompletion:v8];
    uint64_t v3 = v9;
  }
  else
  {
    id v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = [MEMORY[0x1E4F1C978] array];
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v3, v6);
  }
}

uint64_t __64__CHSToolServiceConnection_allCachedSnapshotURLsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listStateCaptureIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke_2;
    v7[3] = &unk_1E56C8720;
    id v8 = *(id *)(a1 + 40);
    [v2 listStateCaptureIdentifiersWithCompletion:v7];
    uint64_t v3 = v8;
  }
  else
  {
    id v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v6, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0], v3);
  }
}

uint64_t __70__CHSToolServiceConnection_listStateCaptureIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke_2;
    v7[3] = &unk_1E56C8770;
    id v8 = *(id *)(a1 + 40);
    [v2 fetchStateWithCompletion:v7];
    uint64_t v3 = v8;
  }
  else
  {
    id v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v6, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, __CFString *, void *))(v5 + 16))(v5, @"<nil>", v3);
  }
}

uint64_t __53__CHSToolServiceConnection_fetchStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E56C8770;
    uint64_t v3 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v2 fetchStateForItemWithIdentifier:v3 completion:v8];
    id v4 = v9;
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "chrono tool service connection unavailable", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, __CFString *, void *))(v6 + 16))(v6, @"<nil>", v4);
  }
}

uint64_t __71__CHSToolServiceConnection_fetchStateForItemWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E56C8798;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    [v2 extensionInfoForBundleIdentifier:v9 completion:v8];

    id v4 = v9;
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "Unable to obtain extension info for %@; unable to obtain the remote target",
        buf,
        0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
  }
}

void __72__CHSToolServiceConnection_extensionInfoForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CHSLogChronoServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEBUG, "Received extension info (%@) for (%@), error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)extensionInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CHSToolServiceConnection_extensionInfo___block_invoke;
  v7[3] = &unk_1E56C8748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__CHSToolServiceConnection_extensionInfo___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__CHSToolServiceConnection_extensionInfo___block_invoke_2;
    v7[3] = &unk_1E56C8720;
    id v8 = *(id *)(a1 + 40);
    [v2 extensionInfoWithCompletion:v7];
    uint64_t v3 = v8;
  }
  else
  {
    id v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "Unable to obtain extension info; unable to obtain the remote target",
        v6,
        2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v3);
  }
}

void __42__CHSToolServiceConnection_extensionInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CHSLogChronoServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__CHSToolServiceConnection_extensionInfo___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)v6, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)widgetsWithTimelines:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke;
  v7[3] = &unk_1E56C8748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke_2;
    v7[3] = &unk_1E56C87C0;
    id v8 = *(id *)(a1 + 40);
    [v2 widgetsWithTimelines:v7];
    uint64_t v3 = v8;
  }
  else
  {
    id v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "Unable to obtain widgets with timelines; unable to obtain the remote target",
        v6,
        2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v3);
  }
}

void __49__CHSToolServiceConnection_widgetsWithTimelines___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 widgetKeys];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);
}

- (void)timelineForWidgetKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1[4], "_queue_remoteTarget");
  if (v2)
  {
    id v3 = a1[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke_2;
    v8[3] = &unk_1E56C87E8;
    id v9 = v3;
    id v10 = a1[6];
    [v2 timelineForWidgetKey:v9 completion:v8];

    id v4 = v9;
  }
  else
  {
    uint64_t v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [a1[5] widget];
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "Unable to obtain timeline for widget (%@); unable to obtain the remote target",
        buf,
        0xCu);
    }
    id v7 = (void (**)(id, void, void *))a1[6];
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    v7[2](v7, 0, v4);
  }
}

void __60__CHSToolServiceConnection_timelineForWidgetKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = CHSLogChronoServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(a1 + 32) widget];
    id v9 = (void *)v8;
    id v10 = @"Yes";
    int v11 = 138412802;
    if (!v5) {
      id v10 = @"No";
    }
    id v12 = v10;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEBUG, "Received timeline (%@) for widget: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (void)resetCaches:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CHSToolServiceConnection_resetCaches_completion___block_invoke;
  block[3] = &unk_1E56C8838;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __51__CHSToolServiceConnection_resetCaches_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2;
    v8[3] = &unk_1E56C8810;
    id v9 = *(id *)(a1 + 40);
    [v2 resetCaches:v3 completion:v8];

    id v4 = v9;
  }
  else
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "Unable to deliver cache reset request; unable to obtain the remote target",
        v7,
        2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 1);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }
}

void __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke;
  block[3] = &unk_1E56C8888;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

void __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2;
    v8[3] = &unk_1E56C8860;
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    [v2 reloadControlsOfKind:v4 containedIn:v9 reason:v5 completion:v8];

    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to deliver controls reload request; unable to obtain the remote target",
        v7,
        2u);
    }
  }
}

void __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke;
  block[3] = &unk_1E56C8888;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

void __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2;
    v8[3] = &unk_1E56C8860;
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    [v2 reloadTimelinesOfKind:v4 containedIn:v9 reason:v5 completion:v8];

    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "Unable to deliver timeline reload request; unable to obtain the remote target",
        v7,
        2u);
    }
  }
}

void __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)expireLocationGracePeriods
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CHSToolServiceConnection_expireLocationGracePeriods__block_invoke;
  block[3] = &unk_1E56C8238;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__CHSToolServiceConnection_expireLocationGracePeriods__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = v1;
  if (v1)
  {
    [v1 expireLocationGracePeriods];
  }
  else
  {
    id v3 = CHSLogChronoServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "notifying server to expire location grace periods failed; unable to obtain the remote target",
        v4,
        2u);
    }
  }
}

- (void)contentURLForActivityID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke;
  block[3] = &unk_1E56C82B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  id v3 = v2;
  if (v2)
  {
    [v2 contentURLForActivityID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke_cold_1();
    }
  }
}

- (void)runReaper
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CHSToolServiceConnection_runReaper__block_invoke;
  block[3] = &unk_1E56C8238;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__CHSToolServiceConnection_runReaper__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = v1;
  if (v1)
  {
    [v1 runReaper];
  }
  else
  {
    id v3 = CHSLogChronoServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__CHSToolServiceConnection_runReaper__block_invoke_cold_1();
    }
  }
}

- (void)fetchWidgetSceneInfoWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  id v3 = v2;
  if (v2)
  {
    [v2 fetchWidgetSceneInfoWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = CHSLogChronoServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke_cold_1();
    }
  }
}

- (void)runMigrationReaper
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CHSToolServiceConnection_runMigrationReaper__block_invoke;
  block[3] = &unk_1E56C8238;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__CHSToolServiceConnection_runMigrationReaper__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = v1;
  if (v1)
  {
    [v1 runMigrationReaper];
  }
  else
  {
    id v3 = CHSLogChronoServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__CHSToolServiceConnection_runMigrationReaper__block_invoke_cold_1();
    }
  }
}

- (id)_queue_remoteTarget
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  if (!v3)
  {
    [(CHSToolServiceConnection *)self _queue_createConnection];
    id v3 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  }
  return v3;
}

- (void)_queue_createConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x1E4F50BB8];
  id v4 = +[CHSToolServiceSpecification identifier];
  uint64_t v5 = [v3 endpointForMachName:@"com.apple.chronoservices" service:v4 instance:0];

  [(CHSToolServiceConnection *)self _queue_invalidateConnection];
  id v6 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
  queue_connection = self->_queue_connection;
  self->_queue_connection = v6;

  id v8 = self->_queue_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__CHSToolServiceConnection__queue_createConnection__block_invoke;
  v9[3] = &unk_1E56C86D0;
  v9[4] = self;
  [(BSServiceConnection *)v8 configureConnection:v9];
  [(BSServiceConnection *)self->_queue_connection activate];
}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[CHSToolServiceSpecification serviceQuality];
  [v5 setServiceQuality:v3];

  id v4 = +[CHSToolServiceSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_35];
  [v5 setInterruptionHandler:&__block_literal_global_38];
  [v5 setInvalidationHandler:&__block_literal_global_41];
}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke_2()
{
  id v0 = CHSLogChronoServices();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190C6F000, v0, OS_LOG_TYPE_DEFAULT, "chrono tool service (service-side) connection activated", v1, 2u);
  }
}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke_36()
{
  id v0 = CHSLogChronoServices();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190C6F000, v0, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection interrupted", v1, 2u);
  }
}

void __51__CHSToolServiceConnection__queue_createConnection__block_invoke_39()
{
  id v0 = CHSLogChronoServices();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190C6F000, v0, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection invalidated", v1, 2u);
  }
}

- (void)_queue_invalidateConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    [(BSServiceConnection *)queue_connection invalidate];
    id v4 = self->_queue_connection;
    self->_queue_connection = 0;
  }
}

- (void)_queue_addClient:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = v7;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CHSToolServiceConnection.m", 348, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_queue_clients addObject:v5];
}

- (void)_queue_removeClient:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = v7;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CHSToolServiceConnection.m", 355, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_queue_clients removeObject:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_clients, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __42__CHSToolServiceConnection_extensionInfo___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_190C6F000, log, OS_LOG_TYPE_DEBUG, "Received extension info (%@), error: %@", (uint8_t *)&v3, 0x16u);
}

void __51__CHSToolServiceConnection_resetCaches_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_190C6F000, a2, OS_LOG_TYPE_DEBUG, "Received cache reset request, error: %@", (uint8_t *)&v2, 0xCu);
}

void __79__CHSToolServiceConnection_reloadControlsOfKind_containedIn_reason_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_190C6F000, v0, v1, "Received controls reload request for (%@) of kind (%@) with reason (%@), error: %@");
}

void __80__CHSToolServiceConnection_reloadTimelinesOfKind_containedIn_reason_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_190C6F000, v0, v1, "Received timeline reload request for (%@) of kind (%@) with reason (%@), error: %@");
}

void __63__CHSToolServiceConnection_contentURLForActivityID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unable to get session content urls; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __37__CHSToolServiceConnection_runReaper__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unable to run reaper; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __63__CHSToolServiceConnection_fetchWidgetSceneInfoWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unable to fetch widget scene info; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __46__CHSToolServiceConnection_runMigrationReaper__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unable to run migration reaper; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end
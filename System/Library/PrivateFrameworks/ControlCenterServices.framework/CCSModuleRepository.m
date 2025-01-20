@interface CCSModuleRepository
+ (CCSModuleRepository)repositoryWithDefaults;
+ (id)_defaultModuleDirectories;
+ (id)_defaultModuleIdentifierAllowedList;
+ (id)_deviceFamily;
+ (void)initialize;
- (BOOL)_queue_arrayContainsInterestingApplicationProxy:(id)a3;
- (BOOL)visibilityForModuleIdentifier:(id)a3;
- (NSSet)loadableModuleIdentifiers;
- (id)_initWithDirectoryURLs:(id)a3 allowedModuleIdentifiers:(id)a4;
- (id)_queue_associatedBundleIdentifiersForModuleMetadata:(id)a3;
- (id)_queue_filterModuleMetadataByAssociatedBundleAvailability:(id)a3;
- (id)_queue_filterModuleMetadataByGestalt:(id)a3;
- (id)_queue_filterModuleMetadataByVisibilityPreference:(id)a3;
- (id)_queue_gestaltQuestionsForModuleMetadata:(id)a3;
- (id)_queue_loadAllModuleMetadata;
- (id)_queue_moduleIdentifiersForMetadata:(id)a3;
- (id)moduleMetadataForModuleIdentifier:(id)a3;
- (void)_applicationsDidChange:(id)a3;
- (void)_queue_registerForInternalPreferenceChanges;
- (void)_queue_registerForVisiblityPreferenceChanges;
- (void)_queue_runBlockOnObservers:(id)a3;
- (void)_queue_setIgnoreAllowedList:(BOOL)a3;
- (void)_queue_startObservingMobileGestaltQuestions:(id)a3 withChangeHandler:(id)a4;
- (void)_queue_stopObservingGestaltQuestions;
- (void)_queue_unregisterForInternalPreferenceChanges;
- (void)_queue_unregisterForVisiblityPreferenceChanges;
- (void)_queue_updateAllModuleMetadata;
- (void)_queue_updateAllModuleMetadataForAllModuleMetadata:(id)a3;
- (void)_queue_updateAvailableModuleMetadata;
- (void)_queue_updateAvailableModuleMetadataForAllModuleMetadata:(id)a3;
- (void)_queue_updateGestaltQuestionsForModuleMetadata:(id)a3;
- (void)_queue_updateInterestingBundleIdentifiersForModuleMetadata:(id)a3;
- (void)_queue_updateLoadableModuleMetadata;
- (void)_queue_updateLoadableModuleMetadataForAvailableModuleMetadata:(id)a3;
- (void)_updateAvailableModuleMetadata;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setVisibility:(BOOL)a3 forModuleIdentifier:(id)a4;
@end

@implementation CCSModuleRepository

- (void)_updateAvailableModuleMetadata
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__CCSModuleRepository__updateAvailableModuleMetadata__block_invoke;
  v4[3] = &unk_2645B6840;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __60__CCSModuleRepository__queue_filterModuleMetadataByGestalt___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue] ^ 1;
}

void __53__CCSModuleRepository__updateAvailableModuleMetadata__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_updateAvailableModuleMetadata");
    id WeakRetained = v2;
  }
}

- (void)_queue_updateAvailableModuleMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(NSDictionary *)self->_allModuleMetadataByIdentifier allValues];
  [(CCSModuleRepository *)self _queue_updateAvailableModuleMetadataForAllModuleMetadata:v3];
}

- (void)_queue_updateAvailableModuleMetadataForAllModuleMetadata:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = [(CCSModuleRepository *)self _queue_filterModuleMetadataByAssociatedBundleAvailability:v7];
  id v5 = [(CCSModuleRepository *)self _queue_filterModuleMetadataByVisibilityPreference:v4];

  v6 = [(CCSModuleRepository *)self _queue_moduleIdentifiersForMetadata:v5];
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_availableModuleIdentifiers, v6);
    [(CCSModuleRepository *)self _queue_updateGestaltQuestionsForModuleMetadata:v5];
    [(CCSModuleRepository *)self _queue_updateLoadableModuleMetadataForAvailableModuleMetadata:v5];
  }
}

- (id)_queue_filterModuleMetadataByVisibilityPreference:(id)a3
{
  queue = self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  id v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_59);

  return v5;
}

- (id)_queue_filterModuleMetadataByAssociatedBundleAvailability:(id)a3
{
  queue = self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  id v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_55);

  return v5;
}

- (void)_queue_updateLoadableModuleMetadataForAvailableModuleMetadata:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(CCSModuleRepository *)self _queue_filterModuleMetadataByGestalt:v4];
  v6 = [(CCSModuleRepository *)self _queue_moduleIdentifiersForMetadata:v5];
  if ((BSEqualObjects() & 1) == 0)
  {
    v16 = v5;
    id v7 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221518000, v7, OS_LOG_TYPE_DEFAULT, "[CCSModuleRepository] Loadable modules changed...", buf, 2u);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = CCSLogModuleSettings;
          if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            *(_DWORD *)buf = 138543362;
            uint64_t v23 = v14;
            _os_log_impl(&dword_221518000, v13, OS_LOG_TYPE_DEFAULT, "[CCSModuleRepository] Loadable module: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }

    v6 = obj;
    objc_storeStrong((id *)&self->_loadableModuleIdentifiers, obj);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __85__CCSModuleRepository__queue_updateLoadableModuleMetadataForAvailableModuleMetadata___block_invoke;
    v17[3] = &unk_2645B6950;
    v17[4] = self;
    [(CCSModuleRepository *)self _queue_runBlockOnObservers:v17];
    id v5 = v16;
  }
}

- (void)_queue_updateGestaltQuestionsForModuleMetadata:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(CCSModuleRepository *)self _queue_gestaltQuestionsForModuleMetadata:v4];
  [(CCSModuleRepository *)self _queue_stopObservingGestaltQuestions];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__CCSModuleRepository__queue_updateGestaltQuestionsForModuleMetadata___block_invoke;
  v6[3] = &unk_2645B6840;
  objc_copyWeak(&v7, &location);
  [(CCSModuleRepository *)self _queue_startObservingMobileGestaltQuestions:v5 withChangeHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_queue_stopObservingGestaltQuestions
{
  if (self->_mobileGestaltNotificationToken != (MGNotificationTokenStruct *)-1)
  {
    MGCancelNotifications();
    self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
  }
}

- (void)_queue_startObservingMobileGestaltQuestions:(id)a3 withChangeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v6 count])
  {
    id v8 = v7;
    self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)MGRegisterForBulkUpdates();
  }
}

- (void)_queue_runBlockOnObservers:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSHashTable *)self->_observers allObjects];
  callOutQueue = self->_callOutQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CCSModuleRepository__queue_runBlockOnObservers___block_invoke;
  v9[3] = &unk_2645B64C0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(callOutQueue, v9);
}

- (id)_queue_filterModuleMetadataByGestalt:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(CCSModuleRepository *)self _queue_gestaltQuestionsForModuleMetadata:v5];
  id v7 = (void *)MGCopyMultipleAnswers();
  id v8 = objc_msgSend(v7, "bs_filter:", &__block_literal_global_62);
  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = [v7 allKeys];
  id v11 = [v9 setWithArray:v10];

  v12 = (void *)MEMORY[0x263EFFA08];
  v13 = [v8 allKeys];
  uint64_t v14 = [v12 setWithArray:v13];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__CCSModuleRepository__queue_filterModuleMetadataByGestalt___block_invoke_2;
  v19[3] = &unk_2645B6A48;
  id v20 = v11;
  id v21 = v14;
  id v15 = v14;
  id v16 = v11;
  v17 = objc_msgSend(v5, "bs_filter:", v19);

  return v17;
}

- (id)moduleMetadataForModuleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CCSModuleRepository_moduleMetadataForModuleIdentifier___block_invoke;
  block[3] = &unk_2645B68B8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)visibilityForModuleIdentifier:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue(@"SBIconVisibility", (CFStringRef)a3);
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setVisibility:(BOOL)a3 forModuleIdentifier:(id)a4
{
  char v4 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    char v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"SBIconVisibility", *v4, (CFStringRef)a4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
}

uint64_t __81__CCSModuleRepository__queue_filterModuleMetadataByAssociatedBundleAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 associatedBundleIdentifier];
  if (v3)
  {
    id v16 = 0;
    char v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v16];
    id v5 = v16;
    if (v4)
    {
      id v6 = [v4 applicationState];
      if (![v6 isInstalled]) {
        goto LABEL_7;
      }
      if ([v6 isRestricted]) {
        goto LABEL_7;
      }
      uint64_t v7 = [v2 associatedBundleMinimumVersion];
      if (!v7) {
        goto LABEL_15;
      }
      id v8 = (void *)v7;
      uint64_t v9 = [v4 shortVersionString];
      uint64_t v10 = [v8 compare:v9 options:65];

      if (v10 == 1)
      {
LABEL_7:
        uint64_t v11 = 0;
      }
      else
      {
LABEL_15:
        uint64_t v14 = (void *)CFPreferencesCopyAppValue(@"SBIconVisibility", v3);
        uint64_t v15 = CCSVisibilityPreferenceForBundleRecord(v4);
        uint64_t v11 = CCSResolveModuleVisibility(v14, v15, 1);
      }
    }
    else
    {
      uint64_t v12 = CCSLogModuleSettings;
      if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR)) {
        __81__CCSModuleRepository__queue_filterModuleMetadataByAssociatedBundleAvailability___block_invoke_cold_1((uint64_t)v3, (uint64_t)v5, v12);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __73__CCSModuleRepository__queue_filterModuleMetadataByVisibilityPreference___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)CFPreferencesCopyAppValue(@"SBIconVisibility", (CFStringRef)[v2 moduleIdentifier]);
  uint64_t v4 = [v2 visibilityPreference];

  uint64_t v5 = CCSResolveModuleVisibility(v3, v4, 1);
  return v5;
}

- (id)_queue_moduleIdentifiersForMetadata:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "moduleIdentifier", (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

uint64_t __60__CCSModuleRepository__queue_filterModuleMetadataByGestalt___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 requiredDeviceCapabilities];
  if ([v4 count]
    && (![v4 isSubsetOfSet:*(void *)(a1 + 32)]
     || ([v4 intersectsSet:*(void *)(a1 + 40)] & 1) != 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v3 requiredDeviceIncapabilities];
    if ([v6 count])
    {
      if ([v6 isSubsetOfSet:*(void *)(a1 + 32)]) {
        uint64_t v5 = [v6 isSubsetOfSet:*(void *)(a1 + 40)];
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  return v5;
}

void __57__CCSModuleRepository_moduleMetadataForModuleIdentifier___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_gestaltQuestionsForModuleMetadata:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "requiredDeviceCapabilities", (void)v16);
        [v5 unionSet:v12];

        v13 = [v11 requiredDeviceIncapabilities];
        [v5 unionSet:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = [v5 allObjects];

  return v14;
}

uint64_t __50__CCSModuleRepository__queue_runBlockOnObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(void *)(a1 + 40));
}

uint64_t __85__CCSModuleRepository__queue_updateLoadableModuleMetadataForAvailableModuleMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 loadableModulesChangedForModuleRepository:*(void *)(a1 + 32)];
}

+ (id)_deviceFamily
{
  if (_deviceFamily_onceToken != -1) {
    dispatch_once(&_deviceFamily_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)_deviceFamily_deviceFamily;

  return v2;
}

void __36__CCSModuleRepository__deviceFamily__block_invoke()
{
  v0 = [MEMORY[0x263F29CA0] sharedInstance];
  unsigned int v1 = [v0 deviceClass];

  if (v1 <= 2)
  {
    uint64_t v2 = (void *)_deviceFamily_deviceFamily;
    _deviceFamily_deviceFamily = qword_2645B6A90[v1];
  }
}

+ (CCSModuleRepository)repositoryWithDefaults
{
  id v3 = objc_alloc((Class)a1);
  id v4 = [a1 _defaultModuleDirectories];
  id v5 = [a1 _defaultModuleIdentifierAllowedList];
  id v6 = (void *)[v3 _initWithDirectoryURLs:v4 allowedModuleIdentifiers:v5];

  return (CCSModuleRepository *)v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    CCSRegisterControlCenterLogging();
  }
}

- (id)_initWithDirectoryURLs:(id)a3 allowedModuleIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CCSModuleRepository;
  uint64_t v8 = [(CCSModuleRepository *)&v25 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    directoryURLs = v8->_directoryURLs;
    v8->_directoryURLs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    allowedModuleIdentifiers = v8->_allowedModuleIdentifiers;
    v8->_allowedModuleIdentifiers = (NSSet *)v11;

    v8->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
    uint64_t v13 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v13;

    long long v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.ControlCenter.ModuleRepository", v15);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v16;

    long long v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.ControlCenter.ModuleRepository.callout", v18);
    callOutQueue = v8->_callOutQueue;
    v8->_callOutQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = v8->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__CCSModuleRepository__initWithDirectoryURLs_allowedModuleIdentifiers___block_invoke;
    block[3] = &unk_2645B6780;
    v24 = v8;
    dispatch_sync(v21, block);
  }
  return v8;
}

uint64_t __71__CCSModuleRepository__initWithDirectoryURLs_allowedModuleIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllModuleMetadata");
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[CCSControlCenterDefaults standardDefaults];
  objc_msgSend(v2, "_queue_setIgnoreAllowedList:", objc_msgSend(v3, "shouldEnablePrototypeFeatures"));

  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  [v4 addObserver:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "_queue_registerForVisiblityPreferenceChanges");
  id v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_queue_registerForInternalPreferenceChanges");
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CCSModuleRepository_invalidate__block_invoke;
  block[3] = &unk_2645B6780;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __33__CCSModuleRepository_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 removeObserver:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "_queue_unregisterForVisiblityPreferenceChanges");
  objc_msgSend(*(id *)(a1 + 32), "_queue_unregisterForInternalPreferenceChanges");
  id v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_queue_stopObservingGestaltQuestions");
}

- (NSSet)loadableModuleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__CCSModuleRepository_loadableModuleIdentifiers__block_invoke;
  v5[3] = &unk_2645B67A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __48__CCSModuleRepository_loadableModuleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];

  return MEMORY[0x270F9A758]();
}

- (void)_queue_setIgnoreAllowedList:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CCSIsInternalInstall() && self->_ignoreAllowedList != v3)
  {
    self->_ignoreAllowedList = v3;
    [(CCSModuleRepository *)self _queue_updateAllModuleMetadata];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__CCSModuleRepository_addObserver___block_invoke;
  v7[3] = &unk_2645B67D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __35__CCSModuleRepository_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__CCSModuleRepository_removeObserver___block_invoke;
  v7[3] = &unk_2645B67D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __38__CCSModuleRepository_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

- (void)_applicationsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CCSModuleRepository__applicationsDidChange___block_invoke;
  block[3] = &unk_2645B68E0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __46__CCSModuleRepository__applicationsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (objc_msgSend(WeakRetained, "_queue_arrayContainsInterestingApplicationProxy:", *(void *)(a1 + 32)))objc_msgSend(v4, "_queue_updateAvailableModuleMetadata"); {
  }
    }

  return MEMORY[0x270F9A758]();
}

+ (id)_defaultModuleDirectories
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (CCSIsInternalInstall())
  {
    BOOL v3 = +[CCSControlCenterDefaults standardDefaults];
    int v4 = [v3 shouldEnableInternalModules];

    if (v4)
    {
      id v5 = [NSString pathWithComponents:&unk_26D39B7E0];
      uint64_t v6 = [v2 arrayByAddingObject:v5];

      uint64_t v2 = (void *)v6;
    }
  }
  id v7 = objc_msgSend(v2, "bs_map:", &__block_literal_global_20_0);

  return v7;
}

id __48__CCSModuleRepository__defaultModuleDirectories__block_invoke(uint64_t a1, void *a2)
{
  v8[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSURL;
  id v3 = a2;
  int v4 = BSSystemRootDirectory();
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = @"ControlCenter";
  v8[3] = @"Bundles";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v2 fileURLWithPathComponents:v5];

  return v6;
}

+ (id)_defaultModuleIdentifierAllowedList
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"ModuleAllowedList-Yodel" withExtension:@"plist"];

  int v4 = [MEMORY[0x263EFF980] arrayWithContentsOfURL:v3];
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

- (void)_queue_updateAllModuleMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(CCSModuleRepository *)self _queue_loadAllModuleMetadata];
  [(CCSModuleRepository *)self _queue_updateAllModuleMetadataForAllModuleMetadata:v3];
}

- (void)_queue_updateLoadableModuleMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(NSSet *)self->_availableModuleIdentifiers allObjects];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__CCSModuleRepository__queue_updateLoadableModuleMetadata__block_invoke;
  v5[3] = &unk_2645B6928;
  v5[4] = self;
  int v4 = objc_msgSend(v3, "bs_mapNoNulls:", v5);

  [(CCSModuleRepository *)self _queue_updateLoadableModuleMetadataForAvailableModuleMetadata:v4];
}

uint64_t __58__CCSModuleRepository__queue_updateLoadableModuleMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) moduleMetadataForModuleIdentifier:a2];
}

- (void)_queue_updateAllModuleMetadataForAllModuleMetadata:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "moduleIdentifier", (void)v15);
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v13 = (NSDictionary *)[v5 copy];
    allModuleMetadataByIdentifier = self->_allModuleMetadataByIdentifier;
    self->_allModuleMetadataByIdentifier = v13;

    [(CCSModuleRepository *)self _queue_updateInterestingBundleIdentifiersForModuleMetadata:v6];
    [(CCSModuleRepository *)self _queue_updateAvailableModuleMetadataForAllModuleMetadata:v6];
  }
}

- (id)_queue_loadAllModuleMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(NSArray *)self->_directoryURLs bs_mapNoNulls:&__block_literal_global_44];
  id v4 = objc_msgSend(v3, "bs_flatten");
  id v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke_3;
  v8[3] = &unk_2645B69B8;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", v8);

  return v6;
}

id __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F08850];
  id v3 = a2;
  id v4 = [v2 defaultManager];
  id v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:0];

  return v5;
}

BOOL __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 pathExtension];
  BOOL v3 = [v2 caseInsensitiveCompare:@"bundle"] == 0;

  return v3;
}

id __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[CCSModuleMetadata metadataForBundleAtURL:v3];
  id v5 = CCSLogModuleSettings;
  if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v3;
    __int16 v18 = 2114;
    dispatch_queue_t v19 = v4;
    _os_log_impl(&dword_221518000, v5, OS_LOG_TYPE_DEFAULT, "Found module metadata at URL %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 80)
    || (uint64_t v7 = *(void **)(v6 + 16),
        [v4 moduleIdentifier],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v7) = [v7 containsObject:v8],
        v8,
        (v7 & 1) != 0))
  {
    uint64_t v9 = [v4 supportedDeviceFamilies];
    uint64_t v10 = [(id)objc_opt_class() _deviceFamily];
    char v11 = [v9 containsObject:v10];

    if (v11)
    {
      id v12 = v4;
      goto LABEL_13;
    }
    uint64_t v13 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v3;
      long long v14 = "Ignoring unsupported module at URL: %{public}@";
LABEL_11:
      _os_log_impl(&dword_221518000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v3;
      long long v14 = "Ignoring disallowed module at URL: %{public}@";
      goto LABEL_11;
    }
  }
  id v12 = 0;
LABEL_13:

  return v12;
}

- (void)_queue_updateInterestingBundleIdentifiersForModuleMetadata:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(CCSModuleRepository *)self _queue_associatedBundleIdentifiersForModuleMetadata:v5];

  interestingBundleIdentifiers = self->_interestingBundleIdentifiers;
  self->_interestingBundleIdentifiers = v6;
}

- (id)_queue_associatedBundleIdentifiersForModuleMetadata:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "associatedBundleIdentifier", (void)v14);
        objc_msgSend(v5, "bs_safeAddObject:", v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];

  return v12;
}

- (BOOL)_queue_arrayContainsInterestingApplicationProxy:(id)a3
{
  id v3 = self;
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CCSModuleRepository__queue_arrayContainsInterestingApplicationProxy___block_invoke;
  v7[3] = &unk_2645B6A00;
  v7[4] = v3;
  LOBYTE(v3) = objc_msgSend(v5, "bs_containsObjectPassingTest:", v7);

  return (char)v3;
}

uint64_t __71__CCSModuleRepository__queue_arrayContainsInterestingApplicationProxy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)_queue_registerForVisiblityPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SBIconVisibilityNotificationRecieved, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_queue_unregisterForVisiblityPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0);
}

void __70__CCSModuleRepository__queue_updateGestaltQuestionsForModuleMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateLoadableModuleMetadata");
}

uint64_t __85__CCSModuleRepository__queue_startObservingMobileGestaltQuestions_withChangeHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_registerForInternalPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  id v3 = +[CCSControlCenterDefaults standardDefaults];
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CCSModuleRepository__queue_registerForInternalPreferenceChanges__block_invoke;
  v7[3] = &unk_2645B6840;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 observeDefault:@"shouldEnablePrototypeFeatures" onQueue:queue withBlock:v7];
  internalDefaultsObserver = self->_internalDefaultsObserver;
  self->_internalDefaultsObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__CCSModuleRepository__queue_registerForInternalPreferenceChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v1 = +[CCSControlCenterDefaults standardDefaults];
  objc_msgSend(WeakRetained, "_queue_setIgnoreAllowedList:", objc_msgSend(v1, "shouldEnablePrototypeFeatures"));
}

- (void)_queue_unregisterForInternalPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  internalDefaultsObserver = self->_internalDefaultsObserver;

  [(BSDefaultObserver *)internalDefaultsObserver invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loadableModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_interestingBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allModuleMetadataByIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedModuleIdentifiers, 0);

  objc_storeStrong((id *)&self->_directoryURLs, 0);
}

void __81__CCSModuleRepository__queue_filterModuleMetadataByAssociatedBundleAvailability___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_221518000, log, OS_LOG_TYPE_ERROR, "Error obtaining application record for object with associated bundleID %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
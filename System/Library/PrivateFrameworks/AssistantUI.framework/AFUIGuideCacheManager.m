@interface AFUIGuideCacheManager
+ (id)sharedManager;
- (AFUIGuideCacheManager)init;
- (BOOL)_shouldCheckForUpdateAtDate:(id)a3 lastAppUpdateTime:(id)a4;
- (BOOL)shouldCheckForUpdateWithLastAppUpdateTime:(id)a3;
- (NSNumber)cachedGuideTag;
- (SAGuidanceGuideSnippet)cachedGuideSnippet;
- (SAGuidanceSuggestedUtterances)cachedSuggestedUtterances;
- (id)_aceObjectDictionaryAtFilepath:(id)a3;
- (id)_cachedGuideUpdate;
- (id)_pathForCachedGuideUpdate;
- (void)_checkGuideUpdateUsingAFClientLiteWithTag:(id)a3;
- (void)_clearCachedGuide;
- (void)_updateLastCheckedWithDate:(id)a3;
- (void)checkGuideUpdate;
- (void)dealloc;
- (void)updateCacheWithGuideUpdate:(id)a3 completion:(id)a4;
- (void)updateLastCheckedDate;
@end

@implementation AFUIGuideCacheManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__AFUIGuideCacheManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __38__AFUIGuideCacheManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (AFUIGuideCacheManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AFUIGuideCacheManager;
  v2 = [(AFUIGuideCacheManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.siri.AFUIGuideCacheManager", MEMORY[0x263EF83A8]);
    cacheFileQueue = v2->_cacheFileQueue;
    v2->_cacheFileQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleKeyboardPreferencesChanged, @"AppleKeyboardsPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AppleKeyboardsPreferencesChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)AFUIGuideCacheManager;
  [(AFUIGuideCacheManager *)&v4 dealloc];
}

- (NSNumber)cachedGuideTag
{
  v2 = [(AFUIGuideCacheManager *)self _cachedGuideUpdate];
  dispatch_queue_t v3 = [v2 guideTag];

  return (NSNumber *)v3;
}

- (SAGuidanceGuideSnippet)cachedGuideSnippet
{
  v2 = [(AFUIGuideCacheManager *)self _cachedGuideUpdate];
  dispatch_queue_t v3 = [v2 guideSnippet];

  return (SAGuidanceGuideSnippet *)v3;
}

- (SAGuidanceSuggestedUtterances)cachedSuggestedUtterances
{
  v2 = [(AFUIGuideCacheManager *)self _cachedGuideUpdate];
  dispatch_queue_t v3 = [v2 suggestedUtterances];

  return (SAGuidanceSuggestedUtterances *)v3;
}

- (BOOL)shouldCheckForUpdateWithLastAppUpdateTime:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  LOBYTE(self) = [(AFUIGuideCacheManager *)self _shouldCheckForUpdateAtDate:v6 lastAppUpdateTime:v5];

  return (char)self;
}

- (void)updateLastCheckedDate
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(AFUIGuideCacheManager *)self _updateLastCheckedWithDate:v3];
}

- (void)updateCacheWithGuideUpdate:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  cacheFileQueue = self->_cacheFileQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke;
  block[3] = &unk_2646926A0;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_barrier_async(cacheFileQueue, block);
}

void __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]_block_invoke";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  objc_super v4 = [a1[4] dictionary];
  id v20 = 0;
  id v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:&v20];
  id v6 = v20;
  id v7 = [a1[5] _pathForCachedGuideUpdate];
  if (v5)
  {
    id v19 = v6;
    char v8 = [v5 writeToFile:v7 options:1 error:&v19];
    id v9 = v19;

    if (v8)
    {
      id v10 = a1[5];
      id v11 = (void *)v10[1];
      v10[1] = 0;

      char v12 = 1;
    }
    else
    {
      id v13 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
        __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_2((uint64_t)v7, (uint64_t)v9, v13);
      }
      char v12 = 0;
    }
    id v6 = v9;
  }
  else
  {
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
      __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_1();
    }
    char v12 = 0;
  }
  if (a1[6])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_9;
    block[3] = &unk_264692678;
    id v17 = a1[6];
    char v18 = v12;
    id v16 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v14 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]_block_invoke_2";
    _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }
}

uint64_t __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_clearCachedGuide
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[AFUIGuideCacheManager _clearCachedGuide]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_super v4 = [(AFUIGuideCacheManager *)self _pathForCachedGuideUpdate];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  cacheFileQueue = self->_cacheFileQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AFUIGuideCacheManager__clearCachedGuide__block_invoke;
  block[3] = &unk_264691E90;
  id v10 = v5;
  id v11 = v4;
  char v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_barrier_async(cacheFileQueue, block);
}

void __42__AFUIGuideCacheManager__clearCachedGuide__block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[AFUIGuideCacheManager _clearCachedGuide]_block_invoke";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  objc_super v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v13 = 0;
  char v6 = [v4 removeItemAtPath:v5 error:&v13];
  id v7 = v13;
  if ((v6 & 1) == 0)
  {
    id v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[5];
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "-[AFUIGuideCacheManager _clearCachedGuide]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s Can't remove %@: %@", buf, 0x20u);
    }
  }
  uint64_t v10 = a1[6];
  id v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = 0;

  char v12 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[AFUIGuideCacheManager _clearCachedGuide]_block_invoke";
    _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }
}

- (void)_checkGuideUpdateUsingAFClientLiteWithTag:(id)a3
{
  id v4 = a3;
  if (!self->_isCheckingGuideUpdate)
  {
    self->_isCheckingGuideUpdate = 1;
    id v5 = objc_alloc_init(MEMORY[0x263F648F8]);
    [v5 setCurrentGuideTag:v4];
    char v6 = objc_msgSend(MEMORY[0x263F648F8], "afui_guideCheckSupportedFeatures");
    [v5 setSupportedFeatures:v6];

    id v7 = objc_alloc_init(MEMORY[0x263F28460]);
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke;
    v10[3] = &unk_2646926E8;
    objc_copyWeak(&v11, &location);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_18;
    v8[3] = &unk_2646925C0;
    objc_copyWeak(&v9, &location);
    [v7 handleCommand:v5 commandHandler:v10 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  char v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s Handle guide update with command: %@", (uint8_t *)&v7, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [WeakRetained updateCacheWithGuideUpdate:v3 completion:&__block_literal_global_7];
  }
  else if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_cold_1();
  }
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_15(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  char v6 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
      _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s Guide update completed successfully", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_15_cold_1(v5);
  }
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_18(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = *MEMORY[0x263F28348];
  id v8 = *MEMORY[0x263F28348];
  if (!a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_18_cold_1();
      if (!WeakRetained) {
        goto LABEL_9;
      }
    }
    else if (!WeakRetained)
    {
      goto LABEL_9;
    }
LABEL_8:
    WeakRetained[24] = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_INFO, "%s Guide update succeeded", (uint8_t *)&v9, 0xCu);
  }
  [WeakRetained updateLastCheckedDate];
  if (WeakRetained) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)checkGuideUpdate
{
  id v3 = [(AFUIGuideCacheManager *)self cachedGuideTag];
  [(AFUIGuideCacheManager *)self _checkGuideUpdateUsingAFClientLiteWithTag:v3];
}

- (BOOL)_shouldCheckForUpdateAtDate:(id)a3 lastAppUpdateTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v8 = [(AFUIGuideCacheManager *)self _cachedGuideUpdate];
  int v9 = [v8 languageCode];

  if (v9
    && (AFUIGetLanguageCode(),
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 isEqualToString:v10],
        v10,
        (v11 & 1) != 0))
  {
    char v12 = [(AFUIGuideCacheManager *)self _pathForCachedGuideUpdate];
    id v13 = [MEMORY[0x263F08850] defaultManager];
    cacheFileQueue = self->_cacheFileQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke;
    block[3] = &unk_264692710;
    id v20 = v13;
    id v21 = v12;
    id v22 = v7;
    v24 = &v25;
    id v23 = v6;
    id v15 = v12;
    id v16 = v13;
    dispatch_sync(cacheFileQueue, block);

    BOOL v17 = *((unsigned char *)v26 + 24) != 0;
  }
  else
  {
    BOOL v17 = 1;
    *((unsigned char *)v26 + 24) = 1;
  }

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[AFUIGuideCacheManager _shouldCheckForUpdateAtDate:lastAppUpdateTime:]_block_invoke";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 32);
  id v14 = 0;
  id v6 = [v5 attributesOfItemAtPath:v4 error:&v14];
  id v7 = v14;
  if (v6)
  {
    id v8 = [v6 objectForKey:*MEMORY[0x263F08048]];
    int v9 = [*(id *)(a1 + 48) dateByAddingTimeInterval:600.0];
    uint64_t v10 = [v8 compare:v9];

    if (v10 == -1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      char v11 = *(void **)(a1 + 56);
      char v12 = [v8 dateByAddingTimeInterval:86400.0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v11 compare:v12] == 1;
    }
  }
  else
  {
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
      __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  id v13 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[AFUIGuideCacheManager _shouldCheckForUpdateAtDate:lastAppUpdateTime:]_block_invoke";
    _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }
}

- (void)_updateLastCheckedWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIGuideCacheManager *)self _pathForCachedGuideUpdate];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  cacheFileQueue = self->_cacheFileQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke;
  block[3] = &unk_264691E90;
  id v12 = v4;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = v4;
  dispatch_barrier_async(cacheFileQueue, block);
}

void __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[AFUIGuideCacheManager _updateLastCheckedWithDate:]_block_invoke";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  uint64_t v4 = a1[4];
  uint64_t v12 = *MEMORY[0x263F08048];
  uint64_t v13 = v4;
  id v5 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v6 = a1[6];
  id v7 = (void *)a1[5];
  id v11 = 0;
  char v8 = [v7 setAttributes:v5 ofItemAtPath:v6 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0 && os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
    __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke_cold_1();
  }
  id v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[AFUIGuideCacheManager _updateLastCheckedWithDate:]_block_invoke";
    _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }
}

- (id)_pathForCachedGuideUpdate
{
  return @"var/mobile/Library/Caches/com.apple.siri.SiriGuideUpdateCache.plist";
}

- (id)_cachedGuideUpdate
{
  id v3 = AFUIGetLanguageCode(self, a2);
  cacheFileQueue = self->_cacheFileQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__AFUIGuideCacheManager__cachedGuideUpdate__block_invoke;
  v8[3] = &unk_264692738;
  void v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(cacheFileQueue, v8);
  uint64_t v6 = self->_cachedGuideUpdate;

  return v6;
}

void __43__AFUIGuideCacheManager__cachedGuideUpdate__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[AFUIGuideCacheManager _cachedGuideUpdate]_block_invoke";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[1];
  if (v5)
  {
    uint64_t v6 = [v5 languageCode];
    char v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

    uint64_t v4 = *(void **)(a1 + 32);
    if ((v7 & 1) == 0)
    {
      char v8 = (void *)v4[1];
      v4[1] = 0;

      uint64_t v4 = *(void **)(a1 + 32);
    }
  }
  if (!v4[1])
  {
    id v9 = [v4 _pathForCachedGuideUpdate];
    id v10 = [v4 _aceObjectDictionaryAtFilepath:v9];

    if (v10)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F64900]) initWithDictionary:v10];
      uint64_t v12 = [v11 languageCode];
      if ([v12 isEqualToString:*(void *)(a1 + 40)])
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v11);
      }
      else
      {
        uint64_t v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 40);
          int v16 = 136315650;
          uint64_t v17 = "-[AFUIGuideCacheManager _cachedGuideUpdate]_block_invoke";
          __int16 v18 = 2112;
          id v19 = v12;
          __int16 v20 = 2112;
          uint64_t v21 = v14;
          _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s Cached guide language code: %@ does not match current language code: %@, ignoring cache", (uint8_t *)&v16, 0x20u);
        }
      }
    }
  }
  id v15 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[AFUIGuideCacheManager _cachedGuideUpdate]_block_invoke";
    _os_log_impl(&dword_223099000, v15, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", (uint8_t *)&v16, 0xCu);
  }
}

- (id)_aceObjectDictionaryAtFilepath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  if (v4)
  {
    id v10 = 0;
    id v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v10];
    id v6 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
    }
    else
    {
      char v8 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = "-[AFUIGuideCacheManager _aceObjectDictionaryAtFilepath:]";
        __int16 v13 = 2112;
        id v14 = v3;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s Can't load aceObject dictionary at: %@, %@", buf, 0x20u);
      }
      id v7 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AFUIGuideCacheManager _aceObjectDictionaryAtFilepath:]();
    }
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheFileQueue, 0);

  objc_storeStrong((id *)&self->_cachedGuideUpdate, 0);
}

void __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Can't serialize %@: %{public}@", v2);
}

void __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 136315650;
  *(void *)&v3[4] = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_2(&dword_223099000, a2, a3, "%s Can't write to %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unexpected response for guide update: %@", v2, v3, v4, v5, 2u);
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_15_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s Guide update failed", (uint8_t *)&v1, 0xCu);
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Guide update failed with error: %@", v2, v3, v4, v5, 2u);
}

void __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Can't retrieve file attributes for %{public}@: %{public}@", v2);
}

void __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Can't update last checked date for cached guide at %{public}@: %{public}@", v2);
}

- (void)_aceObjectDictionaryAtFilepath:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Guide cache file not found at: %@", v2, v3, v4, v5, 2u);
}

@end
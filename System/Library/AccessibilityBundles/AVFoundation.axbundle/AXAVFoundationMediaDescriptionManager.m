@interface AXAVFoundationMediaDescriptionManager
+ (id)sharedManager;
+ (id)sharedManagerIfExists;
- (AXAVFoundationMediaDescriptionManager)init;
- (BOOL)_shouldAttachLegibilityOutputToItem:(id)a3;
- (BOOL)beginObservingPlayer:(id)a3;
- (BOOL)isTappingMediaDescriptions;
- (BOOL)isVoiceOverInTheTripleClickMenu;
- (id)_queue_itemNodeForPlayer:(id)a3;
- (void)endObservingPlayer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AXAVFoundationMediaDescriptionManager

+ (id)sharedManagerIfExists
{
  return (id)_SharedManager;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_SharedManager;

  return v2;
}

uint64_t __54__AXAVFoundationMediaDescriptionManager_sharedManager__block_invoke()
{
  _SharedManager = objc_alloc_init(AXAVFoundationMediaDescriptionManager);

  return MEMORY[0x270F9A758]();
}

- (AXAVFoundationMediaDescriptionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXAVFoundationMediaDescriptionManager;
  v2 = [(AXAVFoundationMediaDescriptionManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXAVFoundationMediaDescriptionManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F21558]) initWithIdentifier:@"avkit-accessibility"];
    engine = v2->_engine;
    v2->_engine = (AXMVisionEngine *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    queue_nodeToPlayerMap = v2->_queue_nodeToPlayerMap;
    v2->_queue_nodeToPlayerMap = (NSMapTable *)v7;
  }
  return v2;
}

- (BOOL)beginObservingPlayer:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"legibility-%p", v4);
    v6 = (void *)[objc_alloc(MEMORY[0x263F214C8]) initWithIdentifier:v5];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke;
    block[3] = &unk_265101440;
    block[4] = self;
    id v8 = v4;
    id v17 = v8;
    id v9 = v6;
    id v18 = v9;
    dispatch_sync(queue, block);
    [v9 addResultHandler:&__block_literal_global_279];
    engine = self->_engine;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_281;
    v14[3] = &unk_265101488;
    v14[4] = self;
    id v15 = v9;
    id v11 = v9;
    [(AXMVisionEngine *)engine updateEngineConfiguration:v14];
    v12 = AXMediaLogCaptionDescriptions();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_241E8C000, v12, OS_LOG_TYPE_INFO, "Will begin observing player: %@", buf, 0xCu);
    }

    [v8 addObserver:self forKeyPath:@"currentItem" options:15 context:AXMediaPlayerObserverContext];
  }

  return v4 != 0;
}

uint64_t __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AXPerformBlockOnMainThread();
}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3(uint64_t a1)
{
  id v2 = AXMediaLogCaptionDescriptions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_2(a1, v2);
  }

  if (*(void *)(a1 + 32) && UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v7 = 0;
    id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
    id v5 = v7;
    if (v5)
    {
      v6 = AXMediaLogCaptionDescriptions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_1(v5, v6);
      }
    }
    else if (v4)
    {
      UIAccessibilityPostNotification(0x420u, v4);
    }
  }
}

uint64_t __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_281(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addSourceNode:*(void *)(a1 + 40)];
}

- (void)endObservingPlayer:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke;
  block[3] = &unk_2651014B0;
  v14 = &v15;
  block[4] = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(queue, block);
  if (v16[5])
  {
    engine = self->_engine;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_2;
    v11[3] = &unk_2651014D8;
    v11[4] = self;
    v11[5] = &v15;
    [(AXMVisionEngine *)engine updateEngineConfiguration:v11];
    id v8 = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_3;
    v10[3] = &unk_2651014D8;
    v10[4] = self;
    v10[5] = &v15;
    dispatch_sync(v8, v10);
  }
  id v9 = AXMediaLogCaptionDescriptions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_241E8C000, v9, OS_LOG_TYPE_INFO, "Will end observing player: %@", buf, 0xCu);
  }

  [v6 removeObserver:self forKeyPath:@"currentItem" context:AXMediaPlayerObserverContext];
  _Block_object_dispose(&v15, 8);
}

uint64_t __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_itemNodeForPlayer:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeSourceNode:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __60__AXAVFoundationMediaDescriptionManager_endObservingPlayer___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (BOOL)isTappingMediaDescriptions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__AXAVFoundationMediaDescriptionManager_isTappingMediaDescriptions__block_invoke;
  v5[3] = &unk_2651014D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __67__AXAVFoundationMediaDescriptionManager_isTappingMediaDescriptions__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "keyEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isTriggeringLegibilityEvents])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_queue_itemNodeForPlayer:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_queue_nodeToPlayerMap keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(NSMapTable *)self->_queue_nodeToPlayerMap objectForKey:v10];
        if (v11 == v4)
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  if ((void *)AXMediaPlayerObserverContext == a6
    && [v10 isEqualToString:@"currentItem"])
  {
    id v13 = AXMediaLogCaptionDescriptions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v35 = v12;
      _os_log_impl(&dword_241E8C000, v13, OS_LOG_TYPE_INFO, "Did observe change on. path:'%@' object:%@ change:%@", buf, 0x20u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2651014B0;
    v31 = buf;
    block[4] = self;
    long long v15 = v11;
    v30 = v15;
    dispatch_sync(queue, block);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      long long v16 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081C0]];
      int v17 = [v16 BOOLValue];

      if (v17)
      {
        id v18 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*(id *)(*(void *)&buf[8] + 40) endAutoTriggerOfLegibilityEvents];
        }
      }
      else
      {
        id v18 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(AXAVFoundationMediaDescriptionManager *)self _shouldAttachLegibilityOutputToItem:v18])
          {
            uint64_t v19 = AXMediaLogCaptionDescriptions();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v32 = 138412290;
              v33 = v18;
              _os_log_impl(&dword_241E8C000, v19, OS_LOG_TYPE_INFO, "Will attach legibility node to item: %@", v32, 0xCu);
            }

            uint64_t v22 = MEMORY[0x263EF8330];
            uint64_t v23 = 3221225472;
            v24 = __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke_286;
            v25 = &unk_265101500;
            v26 = self;
            v28 = buf;
            id v18 = v18;
            v27 = v18;
            AXPerformBlockOnMainThread();
          }
          else
          {
            id v20 = AXMediaLogCaptionDescriptions();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v32 = 138412290;
              v33 = v18;
              _os_log_impl(&dword_241E8C000, v20, OS_LOG_TYPE_INFO, "Will NOT attach legibility node to item: %@", v32, 0xCu);
            }
          }
        }
      }
    }
    else
    {
      id v18 = AXMediaLogCaptionDescriptions();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 138412290;
        v33 = v15;
        _os_log_impl(&dword_241E8C000, v18, OS_LOG_TYPE_DEFAULT, "No legibility node found for player: %@", v32, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)AXAVFoundationMediaDescriptionManager;
    [(AXAVFoundationMediaDescriptionManager *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_itemNodeForPlayer:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t __88__AXAVFoundationMediaDescriptionManager_observeValueForKeyPath_ofObject_change_context___block_invoke_286(uint64_t a1)
{
  if (UIAccessibilityIsVoiceOverRunning()
    || (uint64_t result = [*(id *)(a1 + 32) isVoiceOverInTheTripleClickMenu], result))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return [v4 autoTriggerLegibilityEventsWithAVPlayerItem:v3];
  }
  return result;
}

- (BOOL)isVoiceOverInTheTripleClickMenu
{
  id v2 = (const void *)_AXSTripleClickCopyOptions();
  int v3 = _AXSTripleClickContainsOption();
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (BOOL)_shouldAttachLegibilityOutputToItem:(id)a3
{
  return AXProcessIsSystemApplication() ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_nodeToPlayerMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(a1, "ax_nonRedundantDescription");
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_241E8C000, a2, OS_LOG_TYPE_ERROR, "Failed to archive data: %@", (uint8_t *)&v4, 0xCu);
}

void __62__AXAVFoundationMediaDescriptionManager_beginObservingPlayer___block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_241E8C000, a2, OS_LOG_TYPE_DEBUG, "handling engine legibility result: %@", (uint8_t *)&v3, 0xCu);
}

@end
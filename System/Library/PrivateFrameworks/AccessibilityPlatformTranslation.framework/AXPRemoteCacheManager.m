@interface AXPRemoteCacheManager
- (AXPRemoteCacheManager)init;
- (AXPTranslationTransportCancellable)_transportChannel;
- (AXPTranslationTransportDelegate)transportDelegate;
- (BOOL)_notificationData:(id)a3 containsToken:(id)a4;
- (BOOL)lastAXTreeFullyGenerated;
- (NSLock)axTreeGenerationLock;
- (NSMutableSet)_cachedTranslationsForLayoutChange;
- (NSTimer)_layoutChangeCoalesceTimer;
- (OS_dispatch_queue)_axHierarchyGenerationQueue;
- (unint64_t)failedSendAttempts;
- (unint64_t)treeDumpStatus;
- (void)_attemptToSendResponse:(id)a3;
- (void)_axHierarchyGenerationQueue;
- (void)_elementVisualsUpdatedForNotification:(unint64_t)a3 data:(id)a4;
- (void)_processPlatformTranslationRequest:(id)a3;
- (void)_responseSent:(id)a3 withError:(id)a4;
- (void)_sendAXHierachyOnBackgroundQueue;
- (void)_sendTextRelatedAttributesForTranslation:(id)a3;
- (void)_timerDidFire:(id)a3;
- (void)axAdditionalTreeDumpGeneratedOnBackgroundThreadCallback:(id)a3 success:(BOOL)a4;
- (void)axInitialTreeDumpGeneratedOnBackgroundThreadCallback:(id)a3 success:(BOOL)a4;
- (void)axTreeGenerationEnded;
- (void)dealloc;
- (void)handleNotification:(unint64_t)a3 data:(id)a4 associatedObject:(id)a5;
- (void)setAxTreeGenerationLock:(id)a3;
- (void)setFailedSendAttempts:(unint64_t)a3;
- (void)setLastAXTreeFullyGenerated:(BOOL)a3;
- (void)setTransportDelegate:(id)a3;
- (void)setTreeDumpStatus:(unint64_t)a3;
- (void)set_axHierarchyGenerationQueue:(id)a3;
- (void)set_cachedTranslationsForLayoutChange:(id)a3;
- (void)set_layoutChangeCoalesceTimer:(id)a3;
- (void)set_transportChannel:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation AXPRemoteCacheManager

- (AXPRemoteCacheManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXPRemoteCacheManager;
  v2 = [(AXPRemoteCacheManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    axTreeGenerationLock = v2->_axTreeGenerationLock;
    v2->_axTreeGenerationLock = (NSLock *)v3;
  }
  return v2;
}

- (void)start
{
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  [(AXPRemoteCacheManager *)self set_cachedTranslationsForLayoutChange:v3];

  v4 = +[AXPTranslator sharedInstance];
  [v4 setRuntimeDelegate:self];

  v5 = +[AXPTranslator sharedInstance];
  [v5 setRequestResolvingBehavior:2];

  objc_initWeak(&location, self);
  objc_super v6 = [(AXPRemoteCacheManager *)self transportDelegate];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__AXPRemoteCacheManager_start__block_invoke;
  v11[3] = &unk_2649DF178;
  objc_copyWeak(&v12, &location);
  v7 = [v6 accessibilityTranslationTransportAddReceiveDataHandler:v11];
  [(AXPRemoteCacheManager *)self set_transportChannel:v7];

  v8 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__AXPRemoteCacheManager_start__block_invoke_270;
  block[3] = &unk_2649DF1A0;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __30__AXPRemoteCacheManager_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)MEMORY[0x263F08928];
  objc_super v6 = +[AXPTranslatorRequest allowedDecodableClasses];
  id v10 = 0;
  v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v3 error:&v10];

  id v8 = v10;
  if (v8)
  {
    v9 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __30__AXPRemoteCacheManager_start__block_invoke_cold_1();
    }
  }
  else
  {
    [WeakRetained _processPlatformTranslationRequest:v7];
  }
}

void __30__AXPRemoteCacheManager_start__block_invoke_270(uint64_t a1)
{
  v2 = +[AXPTranslator sharedInstance];
  [v2 setAccessibilityEnabled:1];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__AXPRemoteCacheManager_start__block_invoke_2;
  block[3] = &unk_2649DF1A0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __30__AXPRemoteCacheManager_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _elementVisualsUpdatedForNotification:4 data:0];
}

- (void)stop
{
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_0);
  id v2 = +[AXPTranslator sharedInstance];
  [v2 setRequestResolvingBehavior:0];
}

void __29__AXPRemoteCacheManager_stop__block_invoke()
{
  id v0 = +[AXPTranslator sharediOSInstance];
  [v0 stopGeneratingAXTreeDump];
}

- (void)dealloc
{
  [(AXPRemoteCacheManager *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)AXPRemoteCacheManager;
  [(AXPRemoteCacheManager *)&v3 dealloc];
}

- (OS_dispatch_queue)_axHierarchyGenerationQueue
{
  id v2 = +[AXPTranslator sharediOSInstance];
  objc_super v3 = [v2 axTreeDumpSharedBackgroundQueue];

  if (v3)
  {
    id v4 = +[AXPTranslator sharediOSInstance];
    v5 = [v4 axTreeDumpSharedBackgroundQueue];
  }
  else
  {
    objc_super v6 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AXPRemoteCacheManager *)v6 _axHierarchyGenerationQueue];
    }

    v5 = 0;
  }

  return (OS_dispatch_queue *)v5;
}

- (void)_elementVisualsUpdatedForNotification:(unint64_t)a3 data:(id)a4
{
  id v16 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_super v6 = [(AXPRemoteCacheManager *)self _layoutChangeCoalesceTimer];
  if (v6)
  {
    uint64_t v7 = [(AXPRemoteCacheManager *)self _layoutChangeCoalesceTimer];
    char v8 = [v7 isValid];

    if (!v16)
    {
      double v12 = 0.75;
      if (v8) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    char v9 = v8 ^ 1;
  }
  else
  {

    if (!v16)
    {
      double v12 = 0.75;
      goto LABEL_19;
    }
    char v9 = 1;
  }
  if (a3 == 4)
  {
    BOOL v13 = -[AXPRemoteCacheManager _notificationData:containsToken:](self, "_notificationData:containsToken:");
    char v11 = v13 | v9;
    if (v13) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (a3 == 5)
  {
    BOOL v10 = -[AXPRemoteCacheManager _notificationData:containsToken:](self, "_notificationData:containsToken:");
    char v11 = v10 | v9;
    if (v10)
    {
LABEL_9:
      double v12 = 0.5;
      goto LABEL_14;
    }
LABEL_13:
    double v12 = 0.75;
LABEL_14:
    if ((v11 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_19:
    v14 = [(AXPRemoteCacheManager *)self _layoutChangeCoalesceTimer];
    [v14 invalidate];

    [(AXPRemoteCacheManager *)self set_layoutChangeCoalesceTimer:0];
    v15 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__timerDidFire_ selector:0 userInfo:0 repeats:v12];
    [(AXPRemoteCacheManager *)self set_layoutChangeCoalesceTimer:v15];

    goto LABEL_20;
  }
  double v12 = 0.75;
  if (v9) {
    goto LABEL_19;
  }
LABEL_20:

  MEMORY[0x270F9A790]();
}

- (BOOL)_notificationData:(id)a3 containsToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = [v5 containsObject:v6];
LABEL_6:
    char v9 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v7 = [v5 isEqual:v6];
    goto LABEL_6;
  }
  char v8 = [v5 allObjects];
  char v9 = [v8 containsObject:v6];

LABEL_7:
  return v9;
}

- (void)_timerDidFire:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v5 lock];

  if ([(AXPRemoteCacheManager *)self treeDumpStatus] == 1)
  {
    id v6 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
    [v6 unlock];
  }
  else
  {
    unint64_t v7 = [(AXPRemoteCacheManager *)self treeDumpStatus];
    char v8 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
    [v8 unlock];

    if (v7 != 2)
    {
      objc_initWeak(&location, self);
      double v12 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      id v16 = __39__AXPRemoteCacheManager__timerDidFire___block_invoke;
      v17 = &unk_2649DF1A0;
      objc_copyWeak(&v18, &location);
      dispatch_async(v12, &v14);

      BOOL v13 = [(AXPRemoteCacheManager *)self _layoutChangeCoalesceTimer];
      [v13 invalidate];

      [(AXPRemoteCacheManager *)self set_layoutChangeCoalesceTimer:0];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
  }
  char v9 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v9 lock];

  [(AXPRemoteCacheManager *)self setTreeDumpStatus:2];
  BOOL v10 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v10 unlock];

  char v11 = +[AXPTranslator sharediOSInstance];
  [v11 stopGeneratingAXTreeDump];

LABEL_6:
}

void __39__AXPRemoteCacheManager__timerDidFire___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendAXHierachyOnBackgroundQueue];
}

- (void)_sendAXHierachyOnBackgroundQueue
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v4 lock];

  if ([(AXPRemoteCacheManager *)self treeDumpStatus] == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(AXPRemoteCacheManager *)self setTreeDumpStatus:v5];
  id v6 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v6 unlock];

  unint64_t v7 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v12 = "-[AXPRemoteCacheManager _sendAXHierachyOnBackgroundQueue]";
    _os_log_impl(&dword_22E850000, v7, OS_LOG_TYPE_INFO, "%s: starting to generate initial hierarchy", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  char v8 = +[AXPTranslator sharediOSInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__AXPRemoteCacheManager__sendAXHierachyOnBackgroundQueue__block_invoke;
  v9[3] = &unk_2649DF1C8;
  objc_copyWeak(&v10, (id *)buf);
  [v8 generateAXTreeDumpTypeOnBackgroundThread:@"AXPTreeDumpTypeInitialDump" completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __57__AXPRemoteCacheManager__sendAXHierachyOnBackgroundQueue__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained axInitialTreeDumpGeneratedOnBackgroundThreadCallback:v5 success:a2];
}

- (void)axTreeGenerationEnded
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v4 lock];

  BOOL v5 = [(AXPRemoteCacheManager *)self treeDumpStatus] == 2;
  [(AXPRemoteCacheManager *)self setTreeDumpStatus:0];
  id v6 = [(AXPRemoteCacheManager *)self axTreeGenerationLock];
  [v6 unlock];

  if (v5)
  {
    objc_initWeak(&location, self);
    unint64_t v7 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[AXPRemoteCacheManager axTreeGenerationEnded]";
      _os_log_impl(&dword_22E850000, v7, OS_LOG_TYPE_INFO, "%s: pendingAXTreeGeneration, generating another AX hierarchy", buf, 0xCu);
    }

    char v8 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__AXPRemoteCacheManager_axTreeGenerationEnded__block_invoke;
    v9[3] = &unk_2649DF1A0;
    objc_copyWeak(&v10, &location);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__AXPRemoteCacheManager_axTreeGenerationEnded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendAXHierachyOnBackgroundQueue];
}

- (void)axInitialTreeDumpGeneratedOnBackgroundThreadCallback:(id)a3 success:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
  dispatch_assert_queue_V2(v7);

  char v8 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[AXPRemoteCacheManager axInitialTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
    _os_log_impl(&dword_22E850000, v8, OS_LOG_TYPE_INFO, "%s: finished generating initial hierarchy", buf, 0xCu);
  }

  if (a4)
  {
    char v9 = [MEMORY[0x263EFF9C0] set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = [v6 treeDumpResponse];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v13) associatedTranslationObject];
          if (v14) {
            [v9 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    if ([(AXPRemoteCacheManager *)self lastAXTreeFullyGenerated]
      && ([(AXPRemoteCacheManager *)self _cachedTranslationsForLayoutChange],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v9 isEqualToSet:v15],
          v15,
          v16))
    {
      v17 = AXPlatformTranslationLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[AXPRemoteCacheManager axInitialTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
        _os_log_impl(&dword_22E850000, v17, OS_LOG_TYPE_INFO, "%s: skipping hierarchy dump because elements did not change", buf, 0xCu);
      }

      [(AXPRemoteCacheManager *)self axTreeGenerationEnded];
    }
    else
    {
      [(AXPRemoteCacheManager *)self set_cachedTranslationsForLayoutChange:v9];
      v19 = AXPlatformTranslationLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[AXPRemoteCacheManager axInitialTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
        _os_log_impl(&dword_22E850000, v19, OS_LOG_TYPE_INFO, "%s: sending initial tree dump", buf, 0xCu);
      }

      [(AXPRemoteCacheManager *)self handleUpdatedAXTree:v6];
      v20 = AXPlatformTranslationLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[AXPRemoteCacheManager axInitialTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
        _os_log_impl(&dword_22E850000, v20, OS_LOG_TYPE_INFO, "%s: generating additional tree dump", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v21 = +[AXPTranslator sharediOSInstance];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __86__AXPRemoteCacheManager_axInitialTreeDumpGeneratedOnBackgroundThreadCallback_success___block_invoke;
      v22[3] = &unk_2649DF1C8;
      objc_copyWeak(&v23, (id *)buf);
      [v21 generateAXTreeDumpTypeOnBackgroundThread:@"AXPTreeDumpTypeAdditionalData" completionHandler:v22];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v18 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[AXPRemoteCacheManager axInitialTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
      _os_log_impl(&dword_22E850000, v18, OS_LOG_TYPE_INFO, "%s: initial AX tree dump terminated early!", buf, 0xCu);
    }

    [(AXPRemoteCacheManager *)self axTreeGenerationEnded];
  }
}

void __86__AXPRemoteCacheManager_axInitialTreeDumpGeneratedOnBackgroundThreadCallback_success___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained axAdditionalTreeDumpGeneratedOnBackgroundThreadCallback:v5 success:a2];
}

- (void)axAdditionalTreeDumpGeneratedOnBackgroundThreadCallback:(id)a3 success:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[AXPRemoteCacheManager axAdditionalTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
    _os_log_impl(&dword_22E850000, v7, OS_LOG_TYPE_INFO, "%s: finished generating additional hierarchy", (uint8_t *)&v11, 0xCu);
  }

  char v8 = [(AXPRemoteCacheManager *)self _axHierarchyGenerationQueue];
  dispatch_assert_queue_V2(v8);

  if (a4)
  {
    [(AXPRemoteCacheManager *)self setLastAXTreeFullyGenerated:1];
    char v9 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[AXPRemoteCacheManager axAdditionalTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
      _os_log_impl(&dword_22E850000, v9, OS_LOG_TYPE_INFO, "%s: sending additional tree dump", (uint8_t *)&v11, 0xCu);
    }

    [(AXPRemoteCacheManager *)self handleUpdatedAXTree:v6];
  }
  else
  {
    [(AXPRemoteCacheManager *)self setLastAXTreeFullyGenerated:0];
    id v10 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[AXPRemoteCacheManager axAdditionalTreeDumpGeneratedOnBackgroundThreadCallback:success:]";
      _os_log_impl(&dword_22E850000, v10, OS_LOG_TYPE_INFO, "%s: additional AX tree dump terminated early!", (uint8_t *)&v11, 0xCu);
    }
  }
  [(AXPRemoteCacheManager *)self axTreeGenerationEnded];
}

- (void)_processPlatformTranslationRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[AXPTranslator sharedInstance];
  id v6 = [v5 processTranslatorRequest:v4];

  [(AXPRemoteCacheManager *)self _attemptToSendResponse:v6];
}

- (void)_attemptToSendResponse:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
  id v6 = v15;
  if (v6)
  {
    unint64_t v7 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXPRemoteCacheManager _attemptToSendResponse:]();
    }
  }
  else
  {
    uint64_t v8 = [v5 length];
    char v9 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AXPRemoteCacheManager _attemptToSendResponse:](v8, v9);
    }

    objc_initWeak(&location, self);
    id v10 = [(AXPRemoteCacheManager *)self transportDelegate];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__AXPRemoteCacheManager__attemptToSendResponse___block_invoke;
    v11[3] = &unk_2649DF1F0;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [v10 accessibilityTranslationTransportSendData:v5 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __48__AXPRemoteCacheManager__attemptToSendResponse___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _responseSent:*(void *)(a1 + 32) withError:v4];
}

- (void)_responseSent:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
LABEL_9:
    [(AXPRemoteCacheManager *)self setFailedSendAttempts:0];
    goto LABEL_10;
  }
  unint64_t v8 = [(AXPRemoteCacheManager *)self failedSendAttempts];
  char v9 = AXPlatformTranslationLogCommon();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8 > 4)
  {
    if (v10) {
      -[AXPRemoteCacheManager _responseSent:withError:](self, (uint64_t)v7, v9);
    }

    goto LABEL_9;
  }
  if (v10) {
    -[AXPRemoteCacheManager _responseSent:withError:]();
  }

  [(AXPRemoteCacheManager *)self setFailedSendAttempts:[(AXPRemoteCacheManager *)self failedSendAttempts] + 1];
  [(AXPRemoteCacheManager *)self _attemptToSendResponse:v6];
LABEL_10:
}

- (void)handleNotification:(unint64_t)a3 data:(id)a4 associatedObject:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (a3 <= 0xF && ((1 << a3) & 0x9430) != 0)
  {
    BOOL v10 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[AXPRemoteCacheManager handleNotification:data:associatedObject:]";
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_22E850000, v10, OS_LOG_TYPE_INFO, "%s: notification: %lu", (uint8_t *)&v13, 0x16u);
    }

    [(AXPRemoteCacheManager *)self _elementVisualsUpdatedForNotification:a3 data:v8];
  }
  else
  {
    int v11 = AXPlatformTranslationLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 134218242;
      uint64_t v14 = (const char *)a3;
      __int16 v15 = 2112;
      unint64_t v16 = (unint64_t)v8;
      _os_log_impl(&dword_22E850000, v11, OS_LOG_TYPE_INFO, "handleNotification: sending notification: %lu, Data: %@", (uint8_t *)&v13, 0x16u);
    }

    if (a3 == 6 && v9) {
      [(AXPRemoteCacheManager *)self _sendTextRelatedAttributesForTranslation:v9];
    }
    id v12 = objc_opt_new();
    [v12 setNotification:a3];
    [v12 setAssociatedNotificationObject:v9];
    [v12 setResultData:v8];
    [(AXPRemoteCacheManager *)self _attemptToSendResponse:v12];
  }
}

- (void)_sendTextRelatedAttributesForTranslation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_sendTextRelatedAttributesForTranslation__onceToken != -1) {
    dispatch_once(&_sendTextRelatedAttributesForTranslation__onceToken, &__block_literal_global_290);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)_sendTextRelatedAttributesForTranslation__s_textEditingRelatedAttributes;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = objc_alloc_init(AXPTranslatorRequest);
        [(AXPTranslatorRequest *)v9 setRequestType:2];
        -[AXPTranslatorRequest setAttributeType:](v9, "setAttributeType:", [v8 unsignedIntegerValue]);
        [(AXPTranslatorRequest *)v9 setTranslation:v3];
        BOOL v10 = +[AXPTranslator sharedInstance];
        int v11 = [v10 processTranslatorRequest:v9];

        id v12 = [v11 resultData];

        if (v12)
        {
          [v11 setAssociatedTranslationObject:v3];
          [v11 setAssociatedRequestType:2];
          int v13 = objc_opt_new();
          [v13 setAssociatedRequestType:11];
          id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          __int16 v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v11];
          [v14 setObject:v15 forKeyedSubscript:@"treeDump"];
          [v14 setObject:@"AXPTreeDumpTypeAdditionalData" forKeyedSubscript:@"treeDumpType"];
          [v13 setResultData:v14];
          [(AXPRemoteCacheManager *)self _attemptToSendResponse:v13];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

void __66__AXPRemoteCacheManager__sendTextRelatedAttributesForTranslation___block_invoke()
{
  id v0 = (void *)_sendTextRelatedAttributesForTranslation__s_textEditingRelatedAttributes;
  _sendTextRelatedAttributesForTranslation__s_textEditingRelatedAttributes = (uint64_t)&unk_26E242708;
}

- (AXPTranslationTransportDelegate)transportDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transportDelegate);

  return (AXPTranslationTransportDelegate *)WeakRetained;
}

- (void)setTransportDelegate:(id)a3
{
}

- (AXPTranslationTransportCancellable)_transportChannel
{
  return self->__transportChannel;
}

- (void)set_transportChannel:(id)a3
{
}

- (NSMutableSet)_cachedTranslationsForLayoutChange
{
  return self->__cachedTranslationsForLayoutChange;
}

- (void)set_cachedTranslationsForLayoutChange:(id)a3
{
}

- (NSTimer)_layoutChangeCoalesceTimer
{
  return self->__layoutChangeCoalesceTimer;
}

- (void)set_layoutChangeCoalesceTimer:(id)a3
{
}

- (unint64_t)failedSendAttempts
{
  return self->_failedSendAttempts;
}

- (void)setFailedSendAttempts:(unint64_t)a3
{
  self->_failedSendAttempts = a3;
}

- (void)set_axHierarchyGenerationQueue:(id)a3
{
}

- (BOOL)lastAXTreeFullyGenerated
{
  return self->_lastAXTreeFullyGenerated;
}

- (void)setLastAXTreeFullyGenerated:(BOOL)a3
{
  self->_lastAXTreeFullyGenerated = a3;
}

- (NSLock)axTreeGenerationLock
{
  return self->_axTreeGenerationLock;
}

- (void)setAxTreeGenerationLock:(id)a3
{
}

- (unint64_t)treeDumpStatus
{
  return self->_treeDumpStatus;
}

- (void)setTreeDumpStatus:(unint64_t)a3
{
  self->_treeDumpStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axTreeGenerationLock, 0);
  objc_storeStrong((id *)&self->__axHierarchyGenerationQueue, 0);
  objc_storeStrong((id *)&self->__layoutChangeCoalesceTimer, 0);
  objc_storeStrong((id *)&self->__cachedTranslationsForLayoutChange, 0);
  objc_storeStrong((id *)&self->__transportChannel, 0);

  objc_destroyWeak((id *)&self->_transportDelegate);
}

void __30__AXPRemoteCacheManager_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22E850000, v0, v1, "Error decoding data as AXPTranslatorRequest! %@", v2, v3, v4, v5, v6);
}

- (void)_axHierarchyGenerationQueue
{
}

- (float)_attemptToSendResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  float v2 = (double)a1 * 0.0009765625;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl(&dword_22E850000, a2, OS_LOG_TYPE_DEBUG, "Response: %f Kbytes", (uint8_t *)&v4, 0xCu);
  return result;
}

- (void)_attemptToSendResponse:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22E850000, v0, v1, "Failed to archive response error: %@", v2, v3, v4, v5, v6);
}

- (void)_responseSent:withError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22E850000, v0, v1, "Failed to send message, retrying. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_responseSent:(NSObject *)a3 withError:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 failedSendAttempts];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22E850000, a3, OS_LOG_TYPE_ERROR, "Failed to send data after %lu attemps, error: %@", v5, 0x16u);
}

@end
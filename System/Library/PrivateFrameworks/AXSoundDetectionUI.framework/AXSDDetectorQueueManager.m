@interface AXSDDetectorQueueManager
- (AXSDDetectorQueueManager)init;
- (AXSDDetectorQueueManagerDelegate)delegate;
- (BOOL)containsListenType:(id)a3;
- (BOOL)prepareToListen;
- (BOOL)ready;
- (NSMutableSet)detectorQueue;
- (id)currentDetectionTypes;
- (id)detectorManager;
- (void)_dequeueListenType:(id)a3;
- (void)_queueListenType:(id)a3;
- (void)addDetector:(id)a3;
- (void)addListenType:(id)a3;
- (void)detectorStore:(id)a3 detectorsNeedUpdate:(id)a4 toDetectors:(id)a5;
- (void)detectorsReadyForDetectorStore:(id)a3;
- (void)prepareToListen;
- (void)removeAllListenTypes;
- (void)removeDetector:(id)a3;
- (void)removeListenType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetectorQueue:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)stopListening;
@end

@implementation AXSDDetectorQueueManager

- (AXSDDetectorQueueManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXSDDetectorQueueManager;
  v2 = [(AXSDDetectorQueueManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_ready = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    detectorQueue = v3->_detectorQueue;
    v3->_detectorQueue = v4;

    v6 = +[AXSDDetectorStore sharedInstance];
    [v6 addObserver:v3];

    v7 = +[AXSDDetectorStore sharedInstance];
    [v7 loadDetectors];
  }
  return v3;
}

- (id)detectorManager
{
  v2 = [(AXSDDetectorQueueManager *)self delegate];
  v3 = [v2 detectorManager];

  return v3;
}

- (void)addListenType:(id)a3
{
  id v4 = a3;
  v5 = +[AXSDDetectorStore sharedInstance];
  self->_ready = [v5 areDetectorsReady];

  if (self->_ready)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__AXSDDetectorQueueManager_addListenType___block_invoke;
    v7[3] = &unk_2647F4A58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorQueueManager addListenType:]();
    }

    [(AXSDDetectorQueueManager *)self _queueListenType:v4];
  }
}

void __42__AXSDDetectorQueueManager_addListenType___block_invoke(uint64_t a1)
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__AXSDDetectorQueueManager_addListenType___block_invoke_cold_2();
  }

  uint64_t v3 = a1 + 32;
  id v4 = [*(id *)(a1 + 32) delegate];
  v5 = [v4 detectorManager];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = a1 + 40;
  char v8 = [v5 addDetectorType:v7];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__AXSDDetectorQueueManager_addListenType___block_invoke_cold_1(v3, v6, v9);
    }
  }
}

- (void)addDetector:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__AXSDDetectorQueueManager_addDetector___block_invoke;
  v6[3] = &unk_2647F4A58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __40__AXSDDetectorQueueManager_addDetector___block_invoke(uint64_t a1)
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__AXSDDetectorQueueManager_addDetector___block_invoke_cold_2();
  }

  uint64_t v3 = a1 + 32;
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [v4 detectorManager];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = a1 + 40;
  char v8 = [v5 addDetector:v7];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __40__AXSDDetectorQueueManager_addDetector___block_invoke_cold_1(v3, v6, v9);
    }
  }
}

- (void)removeListenType:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSDDetectorStore sharedInstance];
  self->_ready = [v5 areDetectorsReady];

  if (self->_ready)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__AXSDDetectorQueueManager_removeListenType___block_invoke;
    v7[3] = &unk_2647F4A58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    uint64_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorQueueManager removeListenType:](v6);
    }

    [(AXSDDetectorQueueManager *)self _dequeueListenType:v4];
  }
}

void __45__AXSDDetectorQueueManager_removeListenType___block_invoke(uint64_t a1)
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__AXSDDetectorQueueManager_removeListenType___block_invoke_cold_2();
  }

  uint64_t v3 = a1 + 32;
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [v4 detectorManager];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = a1 + 40;
  char v8 = [v5 removeDetectorType:v7];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __45__AXSDDetectorQueueManager_removeListenType___block_invoke_cold_1(v3, v6, v9);
    }
  }
}

- (BOOL)containsListenType:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSDDetectorQueueManager *)self delegate];
  uint64_t v6 = [v5 detectorManager];
  uint64_t v7 = [v6 currentDetectors];
  char v8 = [v7 containsObject:v4];

  return v8;
}

- (void)removeDetector:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__AXSDDetectorQueueManager_removeDetector___block_invoke;
  v6[3] = &unk_2647F4A58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __43__AXSDDetectorQueueManager_removeDetector___block_invoke(uint64_t a1)
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __43__AXSDDetectorQueueManager_removeDetector___block_invoke_cold_2();
  }

  uint64_t v3 = a1 + 32;
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [v4 detectorManager];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = a1 + 40;
  char v8 = [v5 addDetector:v7];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __43__AXSDDetectorQueueManager_removeDetector___block_invoke_cold_1(v3, v6, v9);
    }
  }
}

- (void)removeAllListenTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke(uint64_t a1)
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [v3 detectorManager];
  [v4 removeAllDetectors];
}

- (BOOL)prepareToListen
{
  uint64_t v3 = +[AXSDDetectorStore sharedInstance];
  [v3 addObserver:self];

  id v4 = +[AXSDDetectorStore sharedInstance];
  self->_BOOL ready = [v4 areDetectorsReady];

  BOOL ready = self->_ready;
  if (!self->_ready)
  {
    uint64_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorQueueManager prepareToListen]();
    }
  }
  return ready;
}

- (void)stopListening
{
  id v3 = +[AXSDDetectorStore sharedInstance];
  [v3 removeObserver:self];
}

- (id)currentDetectionTypes
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(AXSDDetectorQueueManager *)self delegate];
  id v4 = [v3 detectorManager];
  id v5 = [v4 currentDetectors];
  uint64_t v6 = [v2 setWithArray:v5];

  return v6;
}

- (void)_queueListenType:(id)a3
{
  id v4 = a3;
  id v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorQueueManager _queueListenType:]();
  }

  [(NSMutableSet *)self->_detectorQueue addObject:v4];
}

- (void)_dequeueListenType:(id)a3
{
  id v4 = a3;
  id v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorQueueManager _dequeueListenType:]();
  }

  [(NSMutableSet *)self->_detectorQueue removeObject:v4];
}

- (void)detectorsReadyForDetectorStore:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_BOOL ready = 1;
  id v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = (id)objc_opt_class();
    id v5 = v13;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_INFO, "[%@]: detectors ready", buf, 0xCu);
  }
  uint64_t v6 = [(NSMutableSet *)self->_detectorQueue count];
  uint64_t v7 = AXLogUltron();
  char v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorQueueManager detectorsReadyForDetectorStore:]();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke;
    block[3] = &unk_2647F49E0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      id v10 = v9;
      _os_log_impl(&dword_226F20000, v8, OS_LOG_TYPE_INFO, "[%@]: assets ready but no detectors in queue to start", buf, 0xCu);
    }
  }
}

void __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v28 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v3 = *(void **)(a1 + 32);
  v2 = (id *)(a1 + 32);
  id v4 = [v3 detectorQueue];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v34;
    *(void *)&long long v6 = 138412802;
    long long v27 = v6;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * v9);
        v11 = +[AXSDDetectorStore sharedInstance];
        v12 = [v11 detectorWithIdentifier:v10];

        id v13 = AXLogUltron();
        uint64_t v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke_cold_1(v2, v10, v14);
          }
          goto LABEL_24;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = objc_opt_class();
          *(_DWORD *)buf = v27;
          v39 = v15;
          __int16 v40 = 2112;
          uint64_t v41 = v10;
          __int16 v42 = 2112;
          v43 = v12;
          id v16 = v15;
          _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_INFO, "[%@]: adding listen type: %@. with asset: %@", buf, 0x20u);
        }
        v17 = [*v2 delegate];
        v18 = [v17 detectorManager];
        char v19 = [v18 addDetector:v12];

        if ((v19 & 1) == 0)
        {
          uint64_t v14 = AXLogUltron();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke_cold_2(v2, v10, v14);
          }
LABEL_24:

          goto LABEL_25;
        }
        [v28 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v28;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * v24);
        v26 = [*v2 detectorQueue];
        [v26 removeObject:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }

  id v4 = [*v2 delegate];
  [v4 assetsReadyAndDetectorsAdded];
LABEL_25:
}

- (void)detectorStore:(id)a3 detectorsNeedUpdate:(id)a4 toDetectors:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138412546;
    long long v26 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        char v13 = objc_msgSend(v12, "isInstalled", v26);
        uint64_t v14 = AXLogUltron();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
        if (v13)
        {
          if (v15)
          {
            id v16 = objc_opt_class();
            *(_DWORD *)buf = v26;
            v37 = v16;
            __int16 v38 = 2112;
            v39 = v12;
            id v17 = v16;
            _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_INFO, "[%@]: Swapping updated dtector: %@", buf, 0x16u);
          }
          v18 = [v12 identifier];
          [(AXSDDetectorQueueManager *)self removeListenType:v18];

          [(AXSDDetectorQueueManager *)self addDetector:v12];
        }
        else
        {
          if (v15)
          {
            char v19 = objc_opt_class();
            *(_DWORD *)buf = v26;
            v37 = v19;
            __int16 v38 = 2112;
            v39 = v12;
            id v20 = v19;
            _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_INFO, "[%@]: Detector is new but not installed: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v9);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v21 = v6;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        [(AXSDDetectorQueueManager *)self removeDetector:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v23);
  }
}

- (AXSDDetectorQueueManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSDDetectorQueueManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_BOOL ready = a3;
}

- (NSMutableSet)detectorQueue
{
  return self->_detectorQueue;
}

- (void)setDetectorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addListenType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: queue listen type: %@", v4, v5, v6, v7, v8);
}

void __42__AXSDDetectorQueueManager_addListenType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  v0 = (void *)OUTLINED_FUNCTION_9();
  id v1 = OUTLINED_FUNCTION_3_3(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: add listen type: %@", v4, v5, v6, v7, v8);
}

void __40__AXSDDetectorQueueManager_addDetector___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  v0 = (void *)OUTLINED_FUNCTION_9();
  id v1 = OUTLINED_FUNCTION_3_3(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: add detector: %@", v4, v5, v6, v7, v8);
}

- (void)removeListenType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_226F20000, log, OS_LOG_TYPE_DEBUG, "Controller: Dequeue listen type", v1, 2u);
}

void __45__AXSDDetectorQueueManager_removeListenType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  v0 = (void *)OUTLINED_FUNCTION_9();
  id v1 = OUTLINED_FUNCTION_3_3(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: remove listen type: %@", v4, v5, v6, v7, v8);
}

void __43__AXSDDetectorQueueManager_removeDetector___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  v0 = (void *)OUTLINED_FUNCTION_9();
  id v1 = OUTLINED_FUNCTION_3_3(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: remove detector: %@", v4, v5, v6, v7, v8);
}

void __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke_cold_1()
{
  id v0 = (id)OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v1, v2, "[%@]: removing all listen types", v3, v4, v5, v6, 2u);
}

- (void)prepareToListen
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v1, v2, "[%@]: assets and detectors not ready, returning", v3, v4, v5, v6, 2u);
}

- (void)_queueListenType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: assets not ready! will queue request: %@", v4, v5, v6, v7, v8);
}

- (void)_dequeueListenType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: assets not ready! remove request: %@ from queue.", v4, v5, v6, v7, v8);
}

- (void)detectorsReadyForDetectorStore:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  id v1 = objc_opt_class();
  uint64_t v2 = *v0;
  id v3 = v1;
  [v2 count];
  OUTLINED_FUNCTION_3(&dword_226F20000, v4, v5, "[%@]: assets ready, adding %lu detectors that are queued.", v6, v7, v8, v9, 2u);
}

@end
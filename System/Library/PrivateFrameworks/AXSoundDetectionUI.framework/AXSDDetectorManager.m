@interface AXSDDetectorManager
+ (id)detectorRequestForDetector:(id)a3;
+ (id)detectorRequestForGeneralApplianceDetector;
+ (id)modelPathForURL:(id)a3 detectionType:(id)a4;
+ (void)detectorRequestForGeneralApplianceDetector;
+ (void)initializeModelMap;
+ (void)setTestBundle:(id)a3;
- (AXSDDetectorManager)init;
- (AXSDDetectorManagerDelegate)delegate;
- (BOOL)_addRequestToAnalyzer:(id)a3;
- (BOOL)_startDetectionWithFormat:(id)a3;
- (BOOL)_testAudioFile:(id)a3;
- (BOOL)addAllDetectors;
- (BOOL)addDetector:(id)a3;
- (BOOL)addDetectorType:(id)a3;
- (BOOL)addGeneralApplianceDetector;
- (BOOL)removeDetector:(id)a3;
- (BOOL)removeDetectorType:(id)a3;
- (BOOL)removeGeneralApplianceDetector;
- (BOOL)startDetectionWithFormat:(id)a3;
- (BOOL)startGeneralApplianceDetectionWithFormat:(id)a3;
- (BOOL)streamAnalyzerIsRunning;
- (NSArray)currentDetectors;
- (OS_dispatch_queue)analyzerQueue;
- (SNDetectSoundRequest)currentGeneralApplianceRequest;
- (id)_currentAssetIDForDetectionType:(id)a3;
- (id)_currentRequestForDetectionType:(id)a3;
- (id)_currentRequests;
- (id)detectorRequestForDetectionType:(id)a3;
- (void)_addCurrentRequest:(id)a3 withDetector:(id)a4;
- (void)_removeAllRequestsFromAnalyzer;
- (void)_removeCurrentRequestForDetectionType:(id)a3;
- (void)_removeRequestFromAnalyzer:(id)a3;
- (void)_stopDetection;
- (void)addGeneralApplianceDetector;
- (void)processAudioBuffer:(id)a3 atTime:(id)a4;
- (void)removeAllDetectors;
- (void)removeGeneralApplianceDetector;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
- (void)setAnalyzerQueue:(id)a3;
- (void)setCurrentGeneralApplianceRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopDetection;
@end

@implementation AXSDDetectorManager

- (AXSDDetectorManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXSDDetectorManager;
  v2 = [(AXSDDetectorManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    currentAssetIdsByType = v2->_currentAssetIdsByType;
    v2->_currentAssetIdsByType = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    currentRequestsByAssetID = v2->_currentRequestsByAssetID;
    v2->_currentRequestsByAssetID = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accessibility.axhadetector.analyzer", v7);
    analyzerQueue = v2->_analyzerQueue;
    v2->_analyzerQueue = (OS_dispatch_queue *)v8;

    +[AXSDDetectorManager initializeModelMap];
    currentGeneralApplianceRequest = v2->_currentGeneralApplianceRequest;
    v2->_currentGeneralApplianceRequest = 0;
  }
  return v2;
}

- (NSArray)currentDetectors
{
  return (NSArray *)[(NSMutableDictionary *)self->_currentAssetIdsByType allKeys];
}

- (BOOL)streamAnalyzerIsRunning
{
  return self->_streamAnalyzer != 0;
}

- (id)_currentRequests
{
  return (id)[(NSMutableDictionary *)self->_currentRequestsByAssetID allValues];
}

- (id)_currentAssetIDForDetectionType:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_currentAssetIdsByType objectForKey:a3];
}

- (void)_addCurrentRequest:(id)a3 withDetector:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_opt_class();
    id v18 = v17;
    v19 = [v7 model];
    v20 = [v19 assetId];
    int v21 = 138413058;
    v22 = v17;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v20;
    _os_log_debug_impl(&dword_226F20000, v8, OS_LOG_TYPE_DEBUG, "[%@]: Adding current detector: %@, with request: %@, and assetID: %@", (uint8_t *)&v21, 0x2Au);
  }
  currentAssetIdsByType = self->_currentAssetIdsByType;
  v10 = [v7 model];
  v11 = [v10 assetId];
  objc_super v12 = [v7 identifier];
  [(NSMutableDictionary *)currentAssetIdsByType setObject:v11 forKey:v12];

  currentRequestsByAssetID = self->_currentRequestsByAssetID;
  v14 = [v7 model];
  v15 = [v14 assetId];
  [(NSMutableDictionary *)currentRequestsByAssetID setObject:v6 forKey:v15];

  v16 = +[AXSDDetectorStore sharedInstance];
  [v16 enableDetector:v7];
}

- (void)_removeCurrentRequestForDetectionType:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_currentAssetIdsByType objectForKey:v4];
  if (v5)
  {
    id v6 = +[AXSDDetectorStore sharedInstance];
    id v7 = [v6 detectorWithAssetID:v5];

    dispatch_queue_t v8 = +[AXSDDetectorStore sharedInstance];
    [v8 disableDetector:v7];

    v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412802;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      v17 = v7;
      id v11 = v13;
      _os_log_debug_impl(&dword_226F20000, v9, OS_LOG_TYPE_DEBUG, "[%@]: removing current detection type: %@ with asset: %@", (uint8_t *)&v12, 0x20u);
    }
    [(NSMutableDictionary *)self->_currentRequestsByAssetID removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_currentAssetIdsByType removeObjectForKey:v4];
  }
  else
  {
    v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager _removeCurrentRequestForDetectionType:]();
    }

    id v7 = +[AXSDDetectorStore sharedInstance];
    [v7 disableDetectorWithIdentifier:v4];
  }
}

- (id)_currentRequestForDetectionType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_currentAssetIdsByType objectForKey:v4];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_currentRequestsByAssetID objectForKey:v5];
  }
  else
  {
    id v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager _currentRequestForDetectionType:]();
    }

    id v6 = 0;
  }

  return v6;
}

- (BOOL)startDetectionWithFormat:(id)a3
{
  id v4 = a3;
  _AXAssertIsMainThread();
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AXSDDetectorManager_startDetectionWithFormat___block_invoke;
  block[3] = &unk_2647F4E20;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(analyzerQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __48__AXSDDetectorManager_startDetectionWithFormat___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _startDetectionWithFormat:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_startDetectionWithFormat:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorManager _startDetectionWithFormat:].cold.4();
  }

  if ([v4 channelCount] && (objc_msgSend(v4, "sampleRate"), v6 != 0.0))
  {
    streamAnalyzer = self->_streamAnalyzer;
    if (!streamAnalyzer)
    {
      uint64_t v11 = (SNAudioStreamAnalyzer *)[objc_alloc(MEMORY[0x263F179B8]) initWithFormat:v4];
      int v12 = self->_streamAnalyzer;
      self->_streamAnalyzer = v11;

      streamAnalyzer = self->_streamAnalyzer;
    }
    [(SNAudioStreamAnalyzer *)streamAnalyzer removeAllRequests];
    uint64_t v13 = AXLogUltron();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorManager _startDetectionWithFormat:](self);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = [(AXSDDetectorManager *)self _currentRequests];
    uint64_t v14 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v7);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v19 = self->_streamAnalyzer;
          id v25 = 0;
          [(SNAudioStreamAnalyzer *)v19 addRequest:v18 withObserver:self error:&v25];
          id v20 = v25;
          if (self->_streamAnalyzer) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 0;
          }
          if (!v21)
          {
            v22 = v20;
            __int16 v23 = AXLogUltron();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[AXSDDetectorManager _startDetectionWithFormat:]();
            }

            [(AXSDDetectorManager *)self stopDetection];
            goto LABEL_7;
          }
        }
        uint64_t v15 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        BOOL v8 = 1;
        if (v15) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    id v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager _startDetectionWithFormat:]();
    }
LABEL_7:
    BOOL v8 = 0;
  }

  return v8;
}

- (void)stopDetection
{
  _AXAssertIsMainThread();
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__AXSDDetectorManager_stopDetection__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __36__AXSDDetectorManager_stopDetection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopDetection];
}

- (void)_stopDetection
{
  [(SNAudioStreamAnalyzer *)self->_streamAnalyzer removeAllRequests];
  streamAnalyzer = self->_streamAnalyzer;
  self->_streamAnalyzer = 0;
}

- (BOOL)addGeneralApplianceDetector
{
  uint64_t v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorManager addGeneralApplianceDetector].cold.5();
  }

  _AXAssertIsMainThread();
  if (self->_currentGeneralApplianceRequest)
  {
    id v4 = AXLogUltronKShot();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorManager addGeneralApplianceDetector].cold.4();
    }
    goto LABEL_15;
  }
  id v4 = +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector];
  if (!v4)
  {
    BOOL v8 = AXLogUltronKShot();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager addGeneralApplianceDetector]();
    }
    goto LABEL_18;
  }
  if ([(AXSDDetectorManager *)self streamAnalyzerIsRunning])
  {
    uint64_t v5 = AXLogUltronKShot();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorManager addGeneralApplianceDetector]();
    }

    streamAnalyzer = self->_streamAnalyzer;
    id v12 = 0;
    [(SNAudioStreamAnalyzer *)streamAnalyzer addRequest:v4 withObserver:self error:&v12];
    id v7 = v12;
    if (v7)
    {
      BOOL v8 = v7;
      id v9 = AXLogUltronKShot();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXSDDetectorManager addGeneralApplianceDetector]();
      }

LABEL_18:
      BOOL v10 = 0;
      goto LABEL_19;
    }
  }
  objc_storeStrong((id *)&self->_currentGeneralApplianceRequest, v4);
LABEL_15:
  BOOL v10 = 1;
LABEL_19:

  return v10;
}

- (BOOL)removeGeneralApplianceDetector
{
  _AXAssertIsMainThread();
  uint64_t v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorManager removeGeneralApplianceDetector]();
  }

  id v4 = self->_currentGeneralApplianceRequest;
  if (v4)
  {
    if ([(AXSDDetectorManager *)self streamAnalyzerIsRunning]) {
      [(SNAudioStreamAnalyzer *)self->_streamAnalyzer removeRequest:v4];
    }
    currentGeneralApplianceRequest = self->_currentGeneralApplianceRequest;
    self->_currentGeneralApplianceRequest = 0;
  }
  else
  {
    currentGeneralApplianceRequest = AXLogUltronKShot();
    if (os_log_type_enabled(currentGeneralApplianceRequest, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorManager removeGeneralApplianceDetector]();
    }
  }

  return 1;
}

- (BOOL)startGeneralApplianceDetectionWithFormat:(id)a3
{
  id v4 = a3;
  _AXAssertIsMainThread();
  uint64_t v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorManager startGeneralApplianceDetectionWithFormat:].cold.4();
  }

  p_streamAnalyzer = &self->_streamAnalyzer;
  streamAnalyzer = self->_streamAnalyzer;
  if (!streamAnalyzer)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F179B8]) initWithFormat:v4];
    id v9 = *p_streamAnalyzer;
    *p_streamAnalyzer = (SNAudioStreamAnalyzer *)v8;

    streamAnalyzer = *p_streamAnalyzer;
  }
  [(SNAudioStreamAnalyzer *)streamAnalyzer removeAllRequests];
  if (!self->_currentGeneralApplianceRequest
    && ![(AXSDDetectorManager *)self addGeneralApplianceDetector])
  {
    uint64_t v14 = AXLogUltronKShot();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager startGeneralApplianceDetectionWithFormat:]();
    }
    goto LABEL_21;
  }
  BOOL v10 = AXLogUltronKShot();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(AXSDDetectorManager *)(uint64_t *)&self->_currentGeneralApplianceRequest startGeneralApplianceDetectionWithFormat:v10];
  }

  uint64_t v11 = self->_streamAnalyzer;
  currentGeneralApplianceRequest = self->_currentGeneralApplianceRequest;
  id v19 = 0;
  [(SNAudioStreamAnalyzer *)v11 addRequest:currentGeneralApplianceRequest withObserver:self error:&v19];
  uint64_t v13 = v19;
  uint64_t v14 = v13;
  if (self->_streamAnalyzer) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  BOOL v16 = v15;
  if (!v15)
  {
    v17 = AXLogUltronKShot();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager addGeneralApplianceDetector]();
    }

    [(AXSDDetectorManager *)self stopDetection];
LABEL_21:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)addDetector:(id)a3
{
  id v4 = [a3 identifier];
  LOBYTE(self) = [(AXSDDetectorManager *)self addDetectorType:v4];

  return (char)self;
}

- (BOOL)addDetectorType:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _AXAssertIsMainThread();
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_INFO, "[%@]: Add Detection Type: %@", buf, 0x16u);
  }
  id v7 = [(NSMutableDictionary *)self->_currentAssetIdsByType objectForKeyedSubscript:v4];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    uint64_t v11 = +[AXSDDetectorStore sharedInstance];
    id v9 = [v11 detectorWithIdentifier:v4];

    id v12 = AXLogUltron();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorManager addDetectorType:]();
    }

    if (v9)
    {
      uint64_t v13 = +[AXSDDetectorManager detectorRequestForDetector:v9];
      uint64_t v14 = v13;
      if (v13)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v22 = 0;
        analyzerQueue = self->_analyzerQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __39__AXSDDetectorManager_addDetectorType___block_invoke;
        block[3] = &unk_2647F4E20;
        id v20 = buf;
        block[4] = self;
        uint64_t v14 = v13;
        id v19 = v14;
        dispatch_sync(analyzerQueue, block);
        [(AXSDDetectorManager *)self _addCurrentRequest:v14 withDetector:v9];

        _Block_object_dispose(buf, 8);
        BOOL v10 = 1;
LABEL_18:

        goto LABEL_19;
      }
      BOOL v16 = AXLogUltron();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AXSDDetectorManager addDetectorType:]();
      }
    }
    else
    {
      uint64_t v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXSDDetectorManager addDetectorType:]();
      }
    }
    BOOL v10 = 0;
    goto LABEL_18;
  }
  id v9 = AXLogUltron();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorManager addDetectorType:].cold.4();
  }
  BOOL v10 = 1;
LABEL_19:

  return v10;
}

uint64_t __39__AXSDDetectorManager_addDetectorType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _addRequestToAnalyzer:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)removeDetector:(id)a3
{
  id v4 = [a3 identifier];
  LOBYTE(self) = [(AXSDDetectorManager *)self removeDetectorType:v4];

  return (char)self;
}

- (BOOL)removeDetectorType:(id)a3
{
  id v4 = a3;
  _AXAssertIsMainThread();
  uint64_t v5 = [(AXSDDetectorManager *)self _currentRequestForDetectionType:v4];
  id v6 = v5;
  if (v5)
  {
    analyzerQueue = self->_analyzerQueue;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __42__AXSDDetectorManager_removeDetectorType___block_invoke;
    uint64_t v13 = &unk_2647F4A58;
    uint64_t v14 = self;
    id v15 = v5;
    dispatch_async(analyzerQueue, &v10);
    -[AXSDDetectorManager _removeCurrentRequestForDetectionType:](self, "_removeCurrentRequestForDetectionType:", v4, v10, v11, v12, v13, v14);
  }
  else
  {
    BOOL v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AXSDDetectorManager removeDetectorType:]();
    }
  }
  return 1;
}

uint64_t __42__AXSDDetectorManager_removeDetectorType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRequestFromAnalyzer:*(void *)(a1 + 40)];
}

- (BOOL)_addRequestToAnalyzer:(id)a3
{
  id v4 = a3;
  if (![(AXSDDetectorManager *)self streamAnalyzerIsRunning]) {
    goto LABEL_8;
  }
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorManager _addRequestToAnalyzer:]((uint64_t)self, v5);
  }

  streamAnalyzer = self->_streamAnalyzer;
  id v12 = 0;
  [(SNAudioStreamAnalyzer *)streamAnalyzer addRequest:v4 withObserver:self error:&v12];
  id v7 = v12;
  if (v7)
  {
    BOOL v8 = v7;
    id v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager _addRequestToAnalyzer:]();
    }

    BOOL v10 = 0;
  }
  else
  {
LABEL_8:
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_removeRequestFromAnalyzer:(id)a3
{
  id v4 = a3;
  if ([(AXSDDetectorManager *)self streamAnalyzerIsRunning]) {
    [(SNAudioStreamAnalyzer *)self->_streamAnalyzer removeRequest:v4];
  }
}

- (void)_removeAllRequestsFromAnalyzer
{
  if ([(AXSDDetectorManager *)self streamAnalyzerIsRunning])
  {
    streamAnalyzer = self->_streamAnalyzer;
    [(SNAudioStreamAnalyzer *)streamAnalyzer removeAllRequests];
  }
}

- (BOOL)addAllDetectors
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _AXAssertIsMainThread();
  uint64_t v3 = [(id)modelMap keyEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    id v6 = (void *)v4;
    char v7 = 1;
    *(void *)&long long v5 = 138412290;
    long long v11 = v5;
    do
    {
      if (!-[AXSDDetectorManager addDetectorType:](self, "addDetectorType:", v6, v11))
      {
        BOOL v8 = AXLogUltron();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v11;
          uint64_t v13 = v6;
          _os_log_error_impl(&dword_226F20000, v8, OS_LOG_TYPE_ERROR, "Add All Detectors: failed to add %@", buf, 0xCu);
        }

        char v7 = 0;
      }
      uint64_t v9 = [v3 nextObject];

      id v6 = (void *)v9;
    }
    while (v9);
  }
  else
  {
    char v7 = 1;
  }

  return v7 & 1;
}

- (void)removeAllDetectors
{
  _AXAssertIsMainThread();
  [(NSMutableDictionary *)self->_currentAssetIdsByType removeAllObjects];
  [(NSMutableDictionary *)self->_currentRequestsByAssetID removeAllObjects];
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AXSDDetectorManager_removeAllDetectors__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __41__AXSDDetectorManager_removeAllDetectors__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllRequestsFromAnalyzer];
}

- (void)processAudioBuffer:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AXSDDetectorManager_processAudioBuffer_atTime___block_invoke;
  block[3] = &unk_2647F4AD0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(analyzerQueue, block);
}

uint64_t __49__AXSDDetectorManager_processAudioBuffer_atTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 48) sampleTime];
  return [v2 analyzeAudioBuffer:v1 atAudioFramePosition:v3];
}

+ (id)modelPathForURL:(id)a3 detectionType:(id)a4
{
  id v5 = a3;
  id v6 = [(id)modelMap objectForKeyedSubscript:a4];
  if (v6)
  {
    id v7 = [v5 URLByAppendingPathComponent:v6];
    BOOL v8 = [v7 URLByAppendingPathExtension:@"mlmodelc"];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)detectorRequestForDetectionType:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSDDetectorStore sharedInstance];
  id v6 = [v5 detectorWithIdentifier:v4];

  if (v6)
  {
    id v7 = +[AXSDDetectorManager detectorRequestForDetector:v6];
    [(AXSDDetectorManager *)self _addCurrentRequest:v7 withDetector:v6];
  }
  else
  {
    BOOL v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorManager detectorRequestForDetectionType:]();
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)detectorRequestForDetector:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 identifier];
  if (testBundle)
  {
    id v5 = (id)testBundle;
  }
  else
  {
    id v5 = [v3 modelURL];
  }
  id v6 = v5;
  id v7 = AXLogUltron();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = testBundle;
    _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_INFO, "Test bundle - should be null on prod: %@", buf, 0xCu);
  }

  if (v6)
  {
    BOOL v8 = +[AXSDDetectorManager modelPathForURL:v6 detectionType:v4];
    if (!v8)
    {
      long long v11 = AXLogUltron();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[AXSDDetectorManager detectorRequestForDetector:]();
      }
      id v19 = 0;
      goto LABEL_30;
    }
    id v28 = 0;
    id v9 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v8 error:&v28];
    id v10 = v28;
    long long v11 = v10;
    if (v9 && !v10)
    {
      int v12 = [v3 isUsingSoundPrint];
      id v13 = objc_alloc(MEMORY[0x263F179F0]);
      uint64_t v14 = v13;
      if (v12)
      {
        id v27 = 0;
        id v15 = [v13 initWithMLModel:v9 error:&v27];
        id v16 = v27;
        if (v16)
        {
          v17 = v16;
          uint64_t v18 = AXLogUltron();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = objc_opt_class();
            *(_DWORD *)buf = 138413314;
            uint64_t v30 = (uint64_t)v23;
            __int16 v31 = 2112;
            id v32 = v3;
            __int16 v33 = 2112;
            v34 = v8;
            __int16 v35 = 2112;
            v36 = v9;
            __int16 v37 = 2112;
            v38 = v17;
            id v24 = v23;
            _os_log_error_impl(&dword_226F20000, v18, OS_LOG_TYPE_ERROR, "[%@]: unable to create SNDetectSoundRequest from mlmodel init. \n\tdetector: %@, path: %@, model: %@, error: %@", buf, 0x34u);
          }
LABEL_23:
          id v19 = 0;
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
      }
      else
      {
        id v20 = [v3 identifier];
        id v15 = [v14 initWithVGGishBasedMLModel:v9 soundIdentifier:v20];

        if (!v15)
        {
          BOOL v21 = AXLogUltron();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v25 = objc_opt_class();
            *(_DWORD *)buf = 138413058;
            uint64_t v30 = (uint64_t)v25;
            __int16 v31 = 2112;
            id v32 = v3;
            __int16 v33 = 2112;
            v34 = v8;
            __int16 v35 = 2112;
            v36 = v9;
            id v26 = v25;
            _os_log_error_impl(&dword_226F20000, v21, OS_LOG_TYPE_ERROR, "[%@]: unable to create SNDetectSoundRequest from vggish model. \n\tdetector: %@, path: %@, model: %@", buf, 0x2Au);
          }
          id v15 = 0;
        }
      }
      id v15 = v15;
      id v19 = v15;
      goto LABEL_29;
    }
    id v15 = AXLogUltron();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = (uint64_t)v8;
      __int16 v31 = 2112;
      id v32 = v4;
      __int16 v33 = 2112;
      v34 = v11;
      _os_log_error_impl(&dword_226F20000, v15, OS_LOG_TYPE_ERROR, "Unable to create MLModel from path %@ for detectionType %@. error: %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  BOOL v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[AXSDDetectorManager detectorRequestForDetector:]();
  }
  id v19 = 0;
LABEL_31:

  return v19;
}

+ (id)detectorRequestForGeneralApplianceDetector
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (testBundle)
  {
    id v2 = (id)testBundle;
  }
  else
  {
    id v3 = +[AXUltronModelAssetManager sharedInstance];
    id v2 = [v3 localPathForKShotGeneralApplianceDetector];
  }
  id v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = testBundle;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_INFO, "Test bundle - should be null on prod: %@", buf, 0xCu);
  }

  if (v2)
  {
    id v18 = 0;
    id v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v2 error:&v18];
    id v6 = v18;
    id v7 = v6;
    if (!v5 || v6)
    {
      uint64_t v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector]();
      }

      id v13 = 0;
    }
    else
    {
      BOOL v8 = +[AXUltronModelAssetManager sharedInstance];
      char v9 = [v8 isKShotUsingSoundPrint];

      if (v9)
      {
        id v17 = 0;
        id v10 = (void *)[objc_alloc(MEMORY[0x263F179F0]) initWithMLModel:v5 error:&v17];
        id v11 = v17;
        if (v11)
        {
          int v12 = AXLogUltron();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector]();
          }

          id v13 = 0;
        }
        else
        {
          id v13 = v10;
        }
      }
      else
      {
        id v15 = AXLogUltron();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226F20000, v15, OS_LOG_TYPE_INFO, "KShot General Appliance is not using Sound Print", buf, 2u);
        }

        id v13 = (id)[objc_alloc(MEMORY[0x263F179F0]) initWithVGGishBasedMLModel:v5 soundIdentifier:@"general_appliance"];
      }
    }
  }
  else
  {
    id v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector]();
    }
    id v13 = 0;
  }

  return v13;
}

+ (void)initializeModelMap
{
  v13[17] = *MEMORY[0x263EF8340];
  if (!modelMap)
  {
    uint64_t v2 = *MEMORY[0x263F21D20];
    v12[0] = *MEMORY[0x263F21D38];
    v12[1] = v2;
    v13[0] = @"baby_distressed";
    v13[1] = @"car_horn";
    uint64_t v3 = *MEMORY[0x263F21D40];
    v12[2] = *MEMORY[0x263F21D28];
    v12[3] = v3;
    v13[2] = @"cat_meow";
    v13[3] = @"dog_bark";
    uint64_t v4 = *MEMORY[0x263F21D48];
    v12[4] = *MEMORY[0x263F21D50];
    v12[5] = v4;
    v13[4] = @"door_bell";
    v13[5] = @"door_knock";
    uint64_t v5 = *MEMORY[0x263F21D80];
    v12[6] = *MEMORY[0x263F21D58];
    v12[7] = v5;
    v13[6] = @"fire_alarm";
    v13[7] = @"shout";
    uint64_t v6 = *MEMORY[0x263F21D90];
    v12[8] = *MEMORY[0x263F21D88];
    v12[9] = v6;
    v13[8] = @"siren_alarm";
    v13[9] = @"smoke_alarm";
    uint64_t v7 = *MEMORY[0x263F21D08];
    v12[10] = *MEMORY[0x263F21D98];
    v12[11] = v7;
    v13[10] = @"water_running";
    v13[11] = @"beep";
    uint64_t v8 = *MEMORY[0x263F21D10];
    v12[12] = *MEMORY[0x263F21D18];
    v12[13] = v8;
    v13[12] = @"buzzer";
    v13[13] = @"ding_bell";
    uint64_t v9 = *MEMORY[0x263F21D60];
    v12[14] = *MEMORY[0x263F21D30];
    v12[15] = v9;
    v13[14] = @"cough";
    v13[15] = @"glass_breaking";
    v12[16] = *MEMORY[0x263F21D70];
    v13[16] = @"kettle";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:17];
    id v11 = (void *)modelMap;
    modelMap = v10;
  }
}

+ (void)setTestBundle:(id)a3
{
}

- (BOOL)_testAudioFile:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F179A0]) initWithURL:v4 error:&v18];
  id v6 = v18;
  if (v6)
  {
    uint64_t v7 = v6;
    NSLog(&cfstr_Error.isa, v6);
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [(id)modelMap keyEnumerator];
    uint64_t v10 = [v9 nextObject];
    if (v10)
    {
      id v11 = (void *)v10;
      while (1)
      {
        int v12 = [(AXSDDetectorManager *)self detectorRequestForDetectionType:v11];
        id v17 = 0;
        [v5 addRequest:v12 withObserver:self error:&v17];
        id v13 = v17;
        if (v13) {
          break;
        }

        uint64_t v14 = [v9 nextObject];

        id v11 = (void *)v14;
        if (!v14) {
          goto LABEL_7;
        }
      }
      uint64_t v7 = v13;
      id v15 = AXLogUltron();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AXSDDetectorManager _testAudioFile:]();
      }

      BOOL v8 = 0;
    }
    else
    {
LABEL_7:
      [v5 analyze];
      uint64_t v7 = 0;
      BOOL v8 = 1;
    }
  }
  return v8;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 detected])
  {
    BOOL v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
LABEL_10:
      _os_log_impl(&dword_226F20000, v8, OS_LOG_TYPE_DEFAULT, "Results: %@", buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    [v7 timeRange];
    [v7 timeRange];
    float v9 = (float)((uint64_t)v17 / SDWORD2(v14));
  }
  else
  {
    float v9 = 0.0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  if (fmodf(v9, 30.0) == 0.0)
  {
    BOOL v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      goto LABEL_10;
    }
LABEL_11:
  }
  if (v7)
  {
    [v7 timeRange];
    if ((v11 & 0x8000000000000000) != 0) {
      goto LABEL_17;
    }
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
  }
  uint64_t v10 = [(AXSDDetectorManager *)self delegate];
  [v10 receivedObservation:v7 forDetector:v6];

LABEL_17:
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[AXSDDetectorManager request:didFailWithError:]();
  }

  float v9 = [(AXSDDetectorManager *)self delegate];
  [v9 receivedError:v7 fromDetector:v6];
}

- (void)requestDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSDDetectorManager *)self delegate];
  [v5 receivedCompletion:v4];
}

- (AXSDDetectorManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSDDetectorManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SNDetectSoundRequest)currentGeneralApplianceRequest
{
  return self->_currentGeneralApplianceRequest;
}

- (void)setCurrentGeneralApplianceRequest:(id)a3
{
}

- (OS_dispatch_queue)analyzerQueue
{
  return self->_analyzerQueue;
}

- (void)setAnalyzerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerQueue, 0);
  objc_storeStrong((id *)&self->_currentGeneralApplianceRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentRequestsByAssetID, 0);
  objc_storeStrong((id *)&self->_currentAssetIdsByType, 0);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
}

- (void)_removeCurrentRequestForDetectionType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_226F20000, v0, v1, "No asset ID found when trying to remove", v2, v3, v4, v5, v6);
}

- (void)_currentRequestForDetectionType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "[%@]: unable to find SNDetectSoundRequest for Detection Type: %@", v4, v5, v6, v7, v8);
}

- (void)_startDetectionWithFormat:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "[%@]: Received an invalid input format. %@", v4, v5, v6, v7, v8);
}

- (void)_startDetectionWithFormat:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Unable to add request to stream analyzer: %@", v2, v3, v4, v5, v6);
}

- (void)_startDetectionWithFormat:(void *)a1 .cold.3(void *a1)
{
  id v2 = (id)objc_opt_class();
  uint64_t v3 = [a1 _currentRequests];
  [v3 count];
  OUTLINED_FUNCTION_3(&dword_226F20000, v4, v5, "[%@]: adding %lu request to stream analyzer", v6, v7, v8, v9, 2u);
}

- (void)_startDetectionWithFormat:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: startDetectionWithFormat: %@", v4, v5, v6, v7, v8);
}

- (void)addGeneralApplianceDetector
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "KShot Detector Manager: Add General Appliance Detector", v2, v3, v4, v5, v6);
}

- (void)removeGeneralApplianceDetector
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "Remove General Appliance Detector.", v2, v3, v4, v5, v6);
}

- (void)startGeneralApplianceDetectionWithFormat:(os_log_t)log .cold.2(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_226F20000, log, OS_LOG_TYPE_DEBUG, "KShot Detector Manager: adding request %@ to stream analyzer: %@", (uint8_t *)&v5, 0x16u);
}

- (void)startGeneralApplianceDetectionWithFormat:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_226F20000, v0, v1, "KShot Detector Manager: unable to add general appliance request", v2, v3, v4, v5, v6);
}

- (void)startGeneralApplianceDetectionWithFormat:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "KShot Detector Manager: start general appliance detection with format: %@", v1, 0xCu);
}

- (void)addDetectorType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "[%@]: no useable detector found for listen type: %@ even though assets are ready", v4, v5, v6, v7, v8);
}

- (void)addDetectorType:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "[%@]: unable to create request for detection type: %@", v4, v5, v6, v7, v8);
}

- (void)addDetectorType:.cold.3()
{
  OUTLINED_FUNCTION_4_1();
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: Add Detector: %@", v4, v5, v6, v7, v8);
}

- (void)addDetectorType:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "Add Detector: Detection type %@ has already been added to the request.", v1, 0xCu);
}

- (void)removeDetectorType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_3(&dword_226F20000, v2, v3, "[%@]: unable to remove detector. %@ is not currently present.", v4, v5, v6, v7, v8);
}

- (void)_addRequestToAnalyzer:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "[%@]: unable to add request to stream analyzer: %@", v4, v5, v6, v7, v8);
}

- (void)_addRequestToAnalyzer:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  id v4 = v3;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "[%@]: stream analyizer already running - adding request directly", v5, 0xCu);
}

- (void)detectorRequestForDetectionType:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "[%@]: no useable detector found for listen type: %@ even though assets are ready", v4, v5, v6, v7, v8);
}

+ (void)detectorRequestForDetector:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "No asset path found for detection type: %@", v2, v3, v4, v5, v6);
}

+ (void)detectorRequestForDetector:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "No detector known model for detection type %@", v2, v3, v4, v5, v6);
}

+ (void)detectorRequestForGeneralApplianceDetector
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226F20000, v0, v1, "Unable to create SNDetectSoundRequest from KShot General Appliance, model: %@, error: %@");
}

- (void)_testAudioFile:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_226F20000, v0, v1, "Ultron Detector Manager - Error adding detector", v2, v3, v4, v5, v6);
}

- (void)request:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t v1 = [v0 soundIdentifier];
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "Request failed: %@, %@", v4, v5, v6, v7, 2u);
}

@end
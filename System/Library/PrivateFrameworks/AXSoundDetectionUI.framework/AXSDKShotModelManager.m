@interface AXSDKShotModelManager
+ (id)requestForDetector:(id)a3;
- (AXSDKShotModelManager)init;
- (AXSDKShotModelManagerDelegate)delegate;
- (BOOL)addCustomDetector:(id)a3;
- (BOOL)removeCustomDetector:(id)a3;
- (BOOL)startDetectionWithFormat:(id)a3;
- (BOOL)streamAnalyzerIsRunning;
- (NSArray)currentDetectors;
- (NSMutableDictionary)currentRequests;
- (OS_dispatch_queue)audioQueue;
- (void)processAudioBuffer:(id)a3 atTime:(id)a4;
- (void)removeAllDetectors;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
- (void)setAudioQueue:(id)a3;
- (void)setCurrentRequests:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopDetection;
@end

@implementation AXSDKShotModelManager

- (AXSDKShotModelManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXSDKShotModelManager;
  v2 = [(AXSDKShotModelManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    currentRequests = v2->_currentRequests;
    v2->_currentRequests = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("kshot_ultron_audio", v5);
    audioQueue = v2->_audioQueue;
    v2->_audioQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (NSArray)currentDetectors
{
  return (NSArray *)[(NSMutableDictionary *)self->_currentRequests allKeys];
}

- (BOOL)streamAnalyzerIsRunning
{
  return self->_streamAnalyzer != 0;
}

- (BOOL)startDetectionWithFormat:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _AXAssertIsMainThread();
  v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDKShotModelManager startDetectionWithFormat:].cold.4();
  }

  if ([v4 channelCount] && (objc_msgSend(v4, "sampleRate"), v6 != 0.0))
  {
    streamAnalyzer = self->_streamAnalyzer;
    if (!streamAnalyzer)
    {
      v11 = (SNAudioStreamAnalyzer *)[objc_alloc(MEMORY[0x263F179B8]) initWithFormat:v4];
      v12 = self->_streamAnalyzer;
      self->_streamAnalyzer = v11;

      streamAnalyzer = self->_streamAnalyzer;
    }
    [(SNAudioStreamAnalyzer *)streamAnalyzer removeAllRequests];
    v13 = AXLogUltron();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AXSDKShotModelManager startDetectionWithFormat:]((uint64_t)self);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = [(NSMutableDictionary *)self->_currentRequests allValues];
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
            v23 = AXLogUltron();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[AXSDDetectorManager _startDetectionWithFormat:]();
            }

            [(AXSDKShotModelManager *)self stopDetection];
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
    v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotModelManager startDetectionWithFormat:]();
    }
LABEL_7:
    BOOL v8 = 0;
  }

  return v8;
}

- (void)stopDetection
{
  _AXAssertIsMainThread();
  [(SNAudioStreamAnalyzer *)self->_streamAnalyzer removeAllRequests];
  streamAnalyzer = self->_streamAnalyzer;
  self->_streamAnalyzer = 0;
}

- (BOOL)addCustomDetector:(id)a3
{
  id v4 = a3;
  _AXAssertIsMainThread();
  p_currentRequests = (uint64_t *)&self->_currentRequests;
  currentRequests = self->_currentRequests;
  v7 = [v4 identifier];
  BOOL v8 = [(NSMutableDictionary *)currentRequests objectForKeyedSubscript:v7];

  if (!v8)
  {
    objc_super v9 = +[AXSDKShotModelManager requestForDetector:v4];
    if (v9)
    {
      if (![(AXSDKShotModelManager *)self streamAnalyzerIsRunning]) {
        goto LABEL_12;
      }
      v10 = AXLogUltron();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[AXSDKShotModelManager addCustomDetector:].cold.4(v10);
      }

      streamAnalyzer = self->_streamAnalyzer;
      id v21 = 0;
      [(SNAudioStreamAnalyzer *)streamAnalyzer addRequest:v9 withObserver:self error:&v21];
      id v12 = v21;
      if (!v12)
      {
LABEL_12:
        uint64_t v15 = (void *)*p_currentRequests;
        uint64_t v16 = [v4 identifier];
        [v15 setObject:v9 forKeyedSubscript:v16];

        v17 = AXLogUltron();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          [(AXSDKShotModelManager *)v4 addCustomDetector:v17];
        }

        goto LABEL_15;
      }
      v13 = v12;
      uint64_t v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXSDKShotModelManager addCustomDetector:]();
      }
    }
    else
    {
      v19 = AXLogUltron();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AXSDKShotModelManager addCustomDetector:](v4, v19);
      }
    }
    BOOL v18 = 0;
    goto LABEL_20;
  }
  objc_super v9 = AXLogUltron();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AXSDKShotModelManager addCustomDetector:].cold.5(v4);
  }
LABEL_15:
  BOOL v18 = 1;
LABEL_20:

  return v18;
}

- (BOOL)removeCustomDetector:(id)a3
{
  id v4 = a3;
  _AXAssertIsMainThread();
  currentRequests = self->_currentRequests;
  double v6 = [v4 identifier];
  v7 = [(NSMutableDictionary *)currentRequests objectForKeyedSubscript:v6];

  if (v7)
  {
    if ([(AXSDKShotModelManager *)self streamAnalyzerIsRunning]) {
      [(SNAudioStreamAnalyzer *)self->_streamAnalyzer removeRequest:v7];
    }
    BOOL v8 = self->_currentRequests;
    objc_super v9 = [v4 identifier];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];
  }
  else
  {
    v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AXSDKShotModelManager removeCustomDetector:](v4, v10);
    }
  }
  return 1;
}

- (void)removeAllDetectors
{
  _AXAssertIsMainThread();
  [(NSMutableDictionary *)self->_currentRequests removeAllObjects];
  if ([(AXSDKShotModelManager *)self streamAnalyzerIsRunning])
  {
    streamAnalyzer = self->_streamAnalyzer;
    [(SNAudioStreamAnalyzer *)streamAnalyzer removeAllRequests];
  }
}

+ (id)requestForDetector:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mlModel];
  if (v4)
  {
    id v21 = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x263F179D8]) initWithMLModel:v4 error:&v21];
    double v6 = v21;
    v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      BOOL v18 = [v4 modelDescription];
      v11 = [v18 inputDescriptionsByName];
      id v12 = [v11 objectForKeyedSubscript:@"td_audio"];
      v13 = [v12 multiArrayConstraint];
      uint64_t v14 = [v13 shape];
      uint64_t v15 = [v14 lastObject];
      int64_t v16 = [v15 int64ValueSafe];

      CMTimeMake(&v20, v16, 16000);
      CMTime v19 = v20;
      [v5 setWindowDuration:&v19];
      [v5 setOverlapFactor:(float)((float)((float)v16 + -7800.0) / (float)v16)];
      id v10 = v5;
    }
    else
    {
      objc_super v9 = AXLogUltron();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[AXSDKShotModelManager requestForDetector:](v3);
      }

      id v10 = 0;
    }
  }
  else
  {
    v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[AXSDKShotModelManager requestForDetector:](v3);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)processAudioBuffer:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AXSDKShotModelManager_processAudioBuffer_atTime___block_invoke;
  block[3] = &unk_2647F4AD0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(audioQueue, block);
}

uint64_t __51__AXSDKShotModelManager_processAudioBuffer_atTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 48) sampleTime];
  return [v2 analyzeAudioBuffer:v1 atAudioFramePosition:v3];
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v7)
  {
    [v7 timeRange];
    if ((v10 & 0x8000000000000000) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  id v9 = [(AXSDKShotModelManager *)self delegate];
  [v9 receivedObservation:v8 forDetector:v6];

LABEL_6:
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[AXSDKShotModelManager request:didFailWithError:]();
  }

  id v9 = [(AXSDKShotModelManager *)self delegate];
  [v9 receivedError:v6 fromDetector:v7];
}

- (void)requestDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSDKShotModelManager *)self delegate];
  [v5 receivedCompletion:v4];
}

- (AXSDKShotModelManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSDKShotModelManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)currentRequests
{
  return self->_currentRequests;
}

- (void)setCurrentRequests:(id)a3
{
}

- (OS_dispatch_queue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_currentRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
}

- (void)startDetectionWithFormat:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Custom Detection Controller: Received an invalid input format. %@", v2, v3, v4, v5, v6);
}

- (void)startDetectionWithFormat:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 24) allValues];
  [v1 count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v2, v3, "Custom Detection Controller: adding %lu request to stream analyzer", v4, v5, v6, v7, v8);
}

- (void)startDetectionWithFormat:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "Custom Detection Controller: startDetectionWithFormat: %@", v1, 0xCu);
}

- (void)addCustomDetector:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 name];
  uint64_t v5 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Unable to create request for custom detector: %@ %@", v6, 0x16u);
}

- (void)addCustomDetector:(NSObject *)a3 .cold.2(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 name];
  uint64_t v7 = [a1 identifier];
  uint64_t v8 = *a2;
  int v9 = 138412802;
  long long v10 = v6;
  __int16 v11 = 2112;
  long long v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_226F20000, a3, OS_LOG_TYPE_DEBUG, "Custom Detector Model manager: added detector %@ %@ currentRequests: %@", (uint8_t *)&v9, 0x20u);
}

- (void)addCustomDetector:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Custom Detector: Unable to add request to stream analyzer: %@", v2, v3, v4, v5, v6);
}

- (void)addCustomDetector:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_226F20000, log, OS_LOG_TYPE_DEBUG, "Custom Detector: Stream analyzer already running - adding request directly", v1, 2u);
}

- (void)addCustomDetector:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v2, v3, "Add Custom Detector: Detector %@ has already been added to the request.", v4, v5, v6, v7, v8);
}

- (void)removeCustomDetector:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 name];
  uint64_t v5 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "Remove Custom Detector: unable to remove. %@ %@ is not currently present.", v6, 0x16u);
}

+ (void)requestForDetector:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 name];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_226F20000, v4, v5, "Unable to create model from compiled model for detector %@ %@. error: %@", v6, v7, v8, v9, v10);
}

+ (void)requestForDetector:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = [a1 name];
  uint64_t v9 = [a1 identifier];
  OUTLINED_FUNCTION_3_1(&dword_226F20000, v3, v4, "Unable to create request from detector %@ %@. error: %@", v5, v6, v7, v8, 2u);
}

- (void)request:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Request failed: %@", v2, v3, v4, v5, v6);
}

@end
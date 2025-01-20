@interface AXSDKShotController
+ (id)sharedInstance;
- (AXSDDetectorManager)detectorManager;
- (AXSDKShotController)init;
- (BOOL)retrainDetector:(id)a3;
- (BOOL)retrainModelWithIdentifier:(id)a3;
- (unint64_t)visualizationBucketCount;
- (void)_retrainModelIdentifierUpdated;
- (void)addGeneralApplianceDetector;
- (void)addListenType:(id)a3;
- (void)deregisterListener:(id)a3;
- (void)hearingMLHelperService:(id)a3 eventOccurred:(int64_t)a4;
- (void)kickoffTrainingForDetector:(id)a3;
- (void)listenEngineDidStartWithInputFormat:(id)a3;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)receivedBuffer:(id)a3 atTime:(id)a4;
- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5;
- (void)receivedCompletion:(id)a3;
- (void)receivedError:(id)a3 fromDetector:(id)a4;
- (void)receivedObservation:(id)a3 forDetector:(id)a4;
- (void)registerListener:(id)a3 forRecordingUpdates:(id)a4;
- (void)removeAllListenTypes;
- (void)savedTrainingRecordingForDetector:(id)a3;
- (void)setDetectorManager:(id)a3;
- (void)setVisualizationBucketCount:(unint64_t)a3;
- (void)startListening;
- (void)startListeningToTrainDetector:(id)a3;
- (void)stopListening;
@end

@implementation AXSDKShotController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___SharedController;
  return v2;
}

uint64_t __37__AXSDKShotController_sharedInstance__block_invoke()
{
  sharedInstance___SharedController = objc_alloc_init(AXSDKShotController);
  return MEMORY[0x270F9A758]();
}

- (AXSDKShotController)init
{
  v26.receiver = self;
  v26.super_class = (Class)AXSDKShotController;
  v2 = [(AXSDKShotController *)&v26 init];
  v3 = v2;
  if (v2)
  {
    [(AXSDKShotController *)v2 setVisualizationBucketCount:0];
    uint64_t v4 = +[AXSDListenEngine sharedInstance];
    listenEngine = v3->_listenEngine;
    v3->_listenEngine = (AXSDListenEngine *)v4;

    v6 = [[AXSDKShotRecordingManager alloc] initWithSampleLength:0.000022675737 bufferSize:(double)[(AXSDListenEngine *)v3->_listenEngine bufferSize]];
    kShotRecordingManager = v3->_kShotRecordingManager;
    v3->_kShotRecordingManager = v6;

    [(AXSDKShotRecordingManager *)v3->_kShotRecordingManager setDelegate:v3];
    v8 = objc_alloc_init(AXSDDetectorManager);
    [(AXSDKShotController *)v3 setDetectorManager:v8];

    v9 = [(AXSDKShotController *)v3 detectorManager];
    [v9 setDelegate:v3];

    v10 = objc_alloc_init(AXSDKShotDetectorQueueManager);
    detectorQueueManager = v3->_detectorQueueManager;
    v3->_detectorQueueManager = v10;

    [(AXSDDetectorQueueManager *)v3->_detectorQueueManager setDelegate:v3];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.accessibility.kshotcontrollere.listenerqueue", v12);
    listenerQueue = v3->_listenerQueue;
    v3->_listenerQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_opt_new();
    listenerHanders = v3->_listenerHanders;
    v3->_listenerHanders = (NSMutableDictionary *)v15;

    v17 = (HearingMLHelperService *)objc_alloc_init(MEMORY[0x263F472D0]);
    xpcHelperService = v3->_xpcHelperService;
    v3->_xpcHelperService = v17;

    [(HearingMLHelperService *)v3->_xpcHelperService setDelegate:v3];
    v19 = objc_alloc_init(_TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation);
    trainingController = v3->_trainingController;
    v3->_trainingController = (_TtP18AXSoundDetectionUI32AXSDKShotRecordingImplementation_ *)v19;

    if ([MEMORY[0x263F472B0] isInternalInstall])
    {
      objc_initWeak(&location, v3);
      v21 = [MEMORY[0x263F21DA0] sharedInstance];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __27__AXSDKShotController_init__block_invoke;
      v23[3] = &unk_2647F47F8;
      objc_copyWeak(&v24, &location);
      [v21 registerUpdateBlock:v23 forRetrieveSelector:sel_retrainModelIdentifier withListener:v3];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  return v3;
}

void __27__AXSDKShotController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _retrainModelIdentifierUpdated];
}

- (void)setVisualizationBucketCount:(unint64_t)a3
{
  self->_visualizationBucketCount = a3 + 2;
}

- (void)registerListener:(id)a3 forRecordingUpdates:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = AXLogUltronKShot();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_226F20000, v8, OS_LOG_TYPE_DEFAULT, "Register recording listener: %@", buf, 0xCu);
  }

  v9 = [NSNumber numberWithUnsignedLongLong:v6];
  listenerQueue = self->_listenerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__AXSDKShotController_registerListener_forRecordingUpdates___block_invoke;
  block[3] = &unk_2647F4AF8;
  id v14 = v9;
  id v15 = v7;
  block[4] = self;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(listenerQueue, block);
}

void __60__AXSDKShotController_registerListener_forRecordingUpdates___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v4 = (id)[*(id *)(a1 + 48) copy];
  v3 = _Block_copy(v4);
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (void)deregisterListener:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "Deregister audio listener: %@", buf, 0xCu);
  }

  id v6 = [NSNumber numberWithUnsignedLongLong:v4];
  listenerQueue = self->_listenerQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__AXSDKShotController_deregisterListener___block_invoke;
  v9[3] = &unk_2647F4A58;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(listenerQueue, v9);
}

uint64_t __42__AXSDKShotController_deregisterListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)startListening
{
  v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "KShot Controller: Start Listening", buf, 2u);
  }

  if ([(AXSDDetectorQueueManager *)self->_detectorQueueManager prepareToListen])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__AXSDKShotController_startListening__block_invoke;
    block[3] = &unk_2647F49E0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __37__AXSDKShotController_startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addListenDelegate:");
}

- (void)startListeningToTrainDetector:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "KShot Controller: Start listening to train detector: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    [(AXSDKShotController *)self addGeneralApplianceDetector];
    [(AXSDKShotRecordingManager *)self->_kShotRecordingManager setTargetDetector:v4];
    [(AXSDKShotController *)self startListening];
  }
  else
  {
    id v6 = AXLogUltronKShot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotController startListeningToTrainDetector:](v6);
    }
  }
}

- (void)stopListening
{
  v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "KShot Controller: Stop Listening", buf, 2u);
  }

  [(AXSDDetectorQueueManager *)self->_detectorQueueManager stopListening];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__AXSDKShotController_stopListening__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __36__AXSDKShotController_stopListening__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeListenDelegate:");
  v2 = [*(id *)(a1 + 32) detectorManager];
  [v2 removeAllDetectors];

  v3 = [*(id *)(a1 + 32) detectorManager];
  [v3 stopDetection];

  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v4 reset];
}

- (void)addListenType:(id)a3
{
}

- (void)addGeneralApplianceDetector
{
  v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "KShot Controller: Add General Appliance Detector", v4, 2u);
  }

  [(AXSDKShotDetectorQueueManager *)self->_detectorQueueManager addGeneralApplianceDetector];
}

- (void)removeAllListenTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__AXSDKShotController_removeAllListenTypes__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__AXSDKShotController_removeAllListenTypes__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) detectorManager];
  [v1 removeAllDetectors];
}

- (void)kickoffTrainingForDetector:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "KShot Controller: Kicking off training of detector: %@", buf, 0xCu);
  }

  trainingController = self->_trainingController;
  id v9 = 0;
  [(AXSDKShotRecordingImplementation *)trainingController kickoffMLTrainingOfDetector:v4 error:&v9];
  id v7 = v9;
  if (v7)
  {
    id v8 = AXLogUltronKShot();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotController kickoffTrainingForDetector:]();
    }
  }
}

- (BOOL)retrainModelWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[AXSDDetectorStore sharedInstance];
  id v6 = [v5 detectorWithIdentifier:v4];

  if (!v6)
  {
    id v8 = AXLogUltronKShot();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotController retrainModelWithIdentifier:]();
    }
    goto LABEL_8;
  }
  if (([v6 isCustom] & 1) == 0)
  {
    id v8 = AXLogUltronKShot();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotController retrainModelWithIdentifier:]();
    }
LABEL_8:

    BOOL v7 = 0;
    goto LABEL_9;
  }
  BOOL v7 = [(AXSDKShotController *)self retrainDetector:v6];
LABEL_9:

  return v7;
}

- (BOOL)retrainDetector:(id)a3
{
  return 1;
}

- (void)_retrainModelIdentifierUpdated
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Not retraining model with identifier: (%@)", v2, v3, v4, v5, v6);
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "Starting listen engine", buf, 2u);
  }

  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__AXSDKShotController_listenEngineDidStartWithInputFormat___block_invoke;
    v7[3] = &unk_2647F4A58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    uint8_t v6 = AXLogUltronKShot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotController listenEngineDidStartWithInputFormat:](v6);
    }

    [(AXSDKShotController *)self stopListening];
  }
}

void __59__AXSDKShotController_listenEngineDidStartWithInputFormat___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) detectorManager];
  [v2 startGeneralApplianceDetectionWithFormat:*(void *)(a1 + 40)];
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  id v3 = a3;
  id v4 = AXLogUltronKShot();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[AXSDKShotController listenEngineFailedToStartWithError:]();
  }
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v10 = a3;
  id v9 = [(AXSDKShotController *)self detectorManager];
  [v9 processAudioBuffer:v10 atTime:v8];

  [(AXSDKShotRecordingManager *)self->_kShotRecordingManager trackBuffer:v10 atTime:v8 isFile:v5];
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
}

- (void)receivedCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = AXLogUltronKShot();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "Received Completion for: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = AXLogUltronKShot();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[AXSDKShotController receivedError:fromDetector:](v6, (uint64_t)v5, v7);
  }
}

- (void)savedTrainingRecordingForDetector:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(NSMutableDictionary *)self->_listenerHanders allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[NSMutableDictionary objectForKey:](self->_listenerHanders, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v9), v12, v13, v14, v15);
          id v11 = v10;
          if (v10)
          {
            uint64_t v12 = MEMORY[0x263EF8330];
            uint64_t v13 = 3221225472;
            id v14 = __57__AXSDKShotController_savedTrainingRecordingForDetector___block_invoke;
            id v15 = &unk_2647F4B20;
            id v17 = v10;
            id v16 = v4;
            AXPerformBlockOnMainThread();
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
}

uint64_t __57__AXSDKShotController_savedTrainingRecordingForDetector___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)hearingMLHelperService:(id)a3 eventOccurred:(int64_t)a4
{
  uint64_t v6 = AXLogUltronKShot();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AXSDKShotController hearingMLHelperService:eventOccurred:]((uint64_t)self, a4, v6);
  }

  if (self->_trainingDetector)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.kshot.model.error", 0, 0, 1u);
    AXSDSoundDetectionSendKShotModelFailedNotification(self->_trainingDetector);
    uint64_t v8 = [MEMORY[0x263F21DA0] sharedInstance];
    [v8 setKShotDetectorModelFailed:self->_trainingDetector modelFailed:1];

    uint64_t v9 = [MEMORY[0x263F21DA0] sharedInstance];
    [v9 setIsActivelyTrainingAKShotModel:0];

    trainingDetector = self->_trainingDetector;
    self->_trainingDetector = 0;
  }
}

- (AXSDDetectorManager)detectorManager
{
  return self->detectorManager;
}

- (void)setDetectorManager:(id)a3
{
}

- (unint64_t)visualizationBucketCount
{
  return self->_visualizationBucketCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->detectorManager, 0);
  objc_storeStrong((id *)&self->_trainingController, 0);
  objc_storeStrong((id *)&self->_trainingDetector, 0);
  objc_storeStrong((id *)&self->_xpcHelperService, 0);
  objc_storeStrong((id *)&self->_listenerHanders, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_detectorQueueManager, 0);
  objc_storeStrong((id *)&self->_kShotRecordingManager, 0);
  objc_storeStrong((id *)&self->_listenEngine, 0);
}

- (void)startListeningToTrainDetector:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Tried to start training a null detector! This should NOT happen. Please file a radar.", v1, 2u);
}

- (void)kickoffTrainingForDetector:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_226F20000, v0, v1, "KShot Controller: Error kicking off training for detector: %@. Error: %@");
}

- (void)retrainModelWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "No Detector found with identifier: %@", v2, v3, v4, v5, v6);
}

- (void)retrainModelWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Specified detector is not custom! Detector: %@", v2, v3, v4, v5, v6);
}

- (void)listenEngineDidStartWithInputFormat:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Listen engine did not return an audio format - this should NOT happen; bailing. File a radar!",
    v1,
    2u);
}

- (void)listenEngineFailedToStartWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "KShot Controller: Listen Engine failed to start: %@", v2, v3, v4, v5, v6);
}

- (void)receivedError:(NSObject *)a3 fromDetector:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 soundIdentifier];
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_226F20000, a3, OS_LOG_TYPE_ERROR, "Received Error for %@: %@", v6, 0x16u);
}

- (void)hearingMLHelperService:(NSObject *)a3 eventOccurred:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_1(&dword_226F20000, a2, a3, "HearingMLHelperService: Invaidation event occured - code: %ld - detector: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end
@interface AXSDKShotDetectorQueueManager
- (AXSDKShotDetectorQueueManager)init;
- (BOOL)currentGeneralDetectorIsValid;
- (void)addGeneralApplianceDetector;
- (void)assetsNotReadyForUltronManager:(id)a3;
- (void)assetsReadyForUltronManager:(id)a3;
- (void)removeGeneralApplianceDetector;
@end

@implementation AXSDKShotDetectorQueueManager

- (AXSDKShotDetectorQueueManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXSDKShotDetectorQueueManager;
  v2 = [(AXSDDetectorQueueManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_ready = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    detectorQueue = v3->_detectorQueue;
    v3->_detectorQueue = v4;

    v3->_queueGeneralDetector = 0;
  }
  return v3;
}

- (void)addGeneralApplianceDetector
{
  v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "Detector Queue manager: Add General Appliance Detector", buf, 2u);
  }

  if (self->_ready)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke;
    block[3] = &unk_2647F49E0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v4 = AXLogUltronKShot();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "Controller: Queue general detector", buf, 2u);
    }

    self->_queueGeneralDetector = 1;
  }
}

void __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke(uint64_t a1)
{
  v2 = AXLogUltronKShot();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_226F20000, v2, OS_LOG_TYPE_DEFAULT, "Controller: add general detector", v14, 2u);
  }

  v3 = [*(id *)(a1 + 32) delegate];
  v4 = [v3 detectorManager];
  char v5 = [v4 addGeneralApplianceDetector];

  if ((v5 & 1) == 0)
  {
    v6 = AXLogUltronKShot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)removeGeneralApplianceDetector
{
  v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "Detector Queue manager: Remove General Appliance Detector", buf, 2u);
  }

  if (self->_ready)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke;
    block[3] = &unk_2647F49E0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v4 = AXLogUltronKShot();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "Controller: Dequeue general detector", buf, 2u);
    }

    self->_queueGeneralDetector = 0;
  }
}

void __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke(uint64_t a1)
{
  v2 = AXLogUltronKShot();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_226F20000, v2, OS_LOG_TYPE_DEFAULT, "Controller: remove general detector", v14, 2u);
  }

  v3 = [*(id *)(a1 + 32) delegate];
  v4 = [v3 detectorManager];
  char v5 = [v4 removeGeneralApplianceDetector];

  if ((v5 & 1) == 0)
  {
    v6 = AXLogUltronKShot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (BOOL)currentGeneralDetectorIsValid
{
  v2 = [(AXSDDetectorQueueManager *)self delegate];
  v3 = [v2 detectorManager];
  v4 = [v3 currentGeneralApplianceRequest];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)assetsReadyForUltronManager:(id)a3
{
  self->_ready = 1;
  v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "KShot Controller Received: assetsReadyForUltronManager", buf, 2u);
  }

  if (self->_queueGeneralDetector)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke;
    block[3] = &unk_2647F49E0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  v3 = [v2 detectorManager];
  char v4 = [v3 addGeneralApplianceDetector];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = AXLogUltron();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
  uint64_t v13 = [*(id *)(a1 + 32) delegate];
  [v13 assetsReadyAndDetectorsAdded];
}

- (void)assetsNotReadyForUltronManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  self->_ready = 0;
  char v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "Controller: Assets are not ready will add current detectors to queue.", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(AXSDDetectorQueueManager *)self currentDetectionTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = AXLogUltron();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v10;
          _os_log_impl(&dword_226F20000, v11, OS_LOG_TYPE_DEFAULT, "Controller: Adding %@ to queue.", buf, 0xCu);
        }

        [(AXSDDetectorQueueManager *)self addListenType:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }

  [(AXSDDetectorQueueManager *)self removeAllListenTypes];
  if ([(AXSDKShotDetectorQueueManager *)self currentGeneralDetectorIsValid]) {
    self->_queueGeneralDetector = 1;
  }
}

- (void).cxx_destruct
{
}

void __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
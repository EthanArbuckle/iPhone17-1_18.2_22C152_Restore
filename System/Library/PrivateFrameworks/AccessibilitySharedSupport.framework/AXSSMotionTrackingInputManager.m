@interface AXSSMotionTrackingInputManager
- (AXSSMotionTrackingCameraManager)_cameraManager;
- (AXSSMotionTrackingHIDManager)_hidManager;
- (AXSSMotionTrackingInput)inputToUse;
- (AXSSMotionTrackingInputConfiguration)configuration;
- (AXSSMotionTrackingInputManager)initWithConfiguration:(id)a3;
- (AXSSMotionTrackingInputManagerDelegate)delegate;
- (AXSSMotionTrackingVideoFileInputManager)_videoFileInputManager;
- (BOOL)_monitoring;
- (BOOL)_supportsCameraInputs;
- (BOOL)_supportsHIDInputs;
- (BOOL)_supportsMotionTrackingType:(unint64_t)a3;
- (NSArray)allInputs;
- (NSArray)compatibleInputs;
- (NSMutableArray)_allCameraInputs;
- (NSMutableArray)_allInputs;
- (NSMutableArray)_compatibleCameraInputs;
- (NSMutableArray)_compatibleInputs;
- (NSMutableArray)_hidInputs;
- (NSMutableArray)_videoFileInputs;
- (id)_compatibleCameraInputMatchingCaptureDeviceUniqueID:(id)a3;
- (void)_inputUpdated;
- (void)_updateMonitoring;
- (void)motionTrackingCameraManager:(id)a3 updatedCompatibleCaptureDevices:(id)a4;
- (void)motionTrackingHIDManager:(id)a3 updatedDevices:(id)a4;
- (void)motionTrackingVideoFileInputManager:(id)a3 updatedVideoFileInputNames:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInputToUse:(id)a3;
- (void)set_allCameraInputs:(id)a3;
- (void)set_allInputs:(id)a3;
- (void)set_cameraManager:(id)a3;
- (void)set_compatibleCameraInputs:(id)a3;
- (void)set_compatibleInputs:(id)a3;
- (void)set_hidInputs:(id)a3;
- (void)set_hidManager:(id)a3;
- (void)set_monitoring:(BOOL)a3;
- (void)set_videoFileInputManager:(id)a3;
- (void)set_videoFileInputs:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AXSSMotionTrackingInputManager

- (AXSSMotionTrackingInputManager)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AXSSMotionTrackingInputManager;
  v5 = [(AXSSMotionTrackingInputManager *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (AXSSMotionTrackingInputConfiguration *)v6;

    v8 = objc_alloc_init(AXSSMotionTrackingCameraManager);
    cameraManager = v5->__cameraManager;
    v5->__cameraManager = v8;

    [(AXSSMotionTrackingCameraManager *)v5->__cameraManager setDelegate:v5];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    compatibleCameraInputs = v5->__compatibleCameraInputs;
    v5->__compatibleCameraInputs = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    allCameraInputs = v5->__allCameraInputs;
    v5->__allCameraInputs = (NSMutableArray *)v12;

    v14 = objc_alloc_init(AXSSMotionTrackingHIDManager);
    hidManager = v5->__hidManager;
    v5->__hidManager = v14;

    [(AXSSMotionTrackingHIDManager *)v5->__hidManager setDelegate:v5];
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    hidInputs = v5->__hidInputs;
    v5->__hidInputs = (NSMutableArray *)v16;

    if (+[AXSSMotionTrackingVideoFileInputManager allowVideoFileInput])
    {
      v18 = objc_alloc_init(AXSSMotionTrackingVideoFileInputManager);
      videoFileInputManager = v5->__videoFileInputManager;
      v5->__videoFileInputManager = v18;

      [(AXSSMotionTrackingVideoFileInputManager *)v5->__videoFileInputManager setDelegate:v5];
      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      videoFileInputs = v5->__videoFileInputs;
      v5->__videoFileInputs = (NSMutableArray *)v20;
    }
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    allInputs = v5->__allInputs;
    v5->__allInputs = (NSMutableArray *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    compatibleInputs = v5->__compatibleInputs;
    v5->__compatibleInputs = (NSMutableArray *)v24;
  }
  return v5;
}

- (void)startMonitoring
{
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingInputManager: startMonitoring %@ %d", v2, v3, v4, v5, v6);
}

- (void)stopMonitoring
{
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingInputManager: stopMonitoring %@ %d", v2, v3, v4, v5, v6);
}

- (void)_updateMonitoring
{
  if ([(AXSSMotionTrackingInputManager *)self _monitoring]
    && [(AXSSMotionTrackingInputManager *)self _supportsCameraInputs])
  {
    uint64_t v3 = [(AXSSMotionTrackingInputManager *)self _cameraManager];
    [v3 startMonitoring];
  }
  else
  {
    uint64_t v4 = [(AXSSMotionTrackingInputManager *)self _allCameraInputs];
    [v4 removeAllObjects];

    uint64_t v5 = [(AXSSMotionTrackingInputManager *)self _compatibleCameraInputs];
    [v5 removeAllObjects];

    uint64_t v3 = [(AXSSMotionTrackingInputManager *)self _cameraManager];
    [v3 stopMonitoring];
  }

  if ([(AXSSMotionTrackingInputManager *)self _monitoring]
    && [(AXSSMotionTrackingInputManager *)self _supportsCameraInputs])
  {
    uint8_t v6 = [(AXSSMotionTrackingInputManager *)self _videoFileInputManager];
    [v6 startMonitoring];
  }
  else
  {
    v7 = [(AXSSMotionTrackingInputManager *)self _videoFileInputs];
    [v7 removeAllObjects];

    uint8_t v6 = [(AXSSMotionTrackingInputManager *)self _videoFileInputManager];
    [v6 stopMonitoring];
  }

  if ([(AXSSMotionTrackingInputManager *)self _monitoring]
    && [(AXSSMotionTrackingInputManager *)self _supportsHIDInputs])
  {
    id v9 = [(AXSSMotionTrackingInputManager *)self _hidManager];
    [v9 startMonitoring];
  }
  else
  {
    v8 = [(AXSSMotionTrackingInputManager *)self _hidInputs];
    [v8 removeAllObjects];

    id v9 = [(AXSSMotionTrackingInputManager *)self _hidManager];
    [v9 stopMonitoring];
  }
}

- (NSArray)compatibleInputs
{
  uint64_t v2 = [(AXSSMotionTrackingInputManager *)self _compatibleInputs];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allInputs
{
  uint64_t v2 = [(AXSSMotionTrackingInputManager *)self _allInputs];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (AXSSMotionTrackingInputConfiguration)configuration
{
  uint64_t v2 = (void *)[(AXSSMotionTrackingInputConfiguration *)self->_configuration copy];

  return (AXSSMotionTrackingInputConfiguration *)v2;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSSMotionTrackingInputManager *)self configuration];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTrackingInputManager setConfiguration:]((uint64_t)v4, v7);
    }

    v8 = (AXSSMotionTrackingInputConfiguration *)[v4 copy];
    configuration = self->_configuration;
    self->_configuration = v8;

    if ([(AXSSMotionTrackingInputManager *)self _monitoring])
    {
      [(AXSSMotionTrackingInputManager *)self _updateMonitoring];
      [(AXSSMotionTrackingInputManager *)self _inputUpdated];
    }
  }
}

- (BOOL)_supportsMotionTrackingType:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    uint64_t v5 = [(AXSSMotionTrackingInputManager *)self configuration];
    if (v5)
    {
      char v6 = [(AXSSMotionTrackingInputManager *)self configuration];
      LOBYTE(v3) = [v6 supportsTrackingType:v3];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_supportsCameraInputs
{
  if ([(AXSSMotionTrackingInputManager *)self _supportsMotionTrackingType:1]) {
    return 1;
  }

  return [(AXSSMotionTrackingInputManager *)self _supportsMotionTrackingType:3];
}

- (BOOL)_supportsHIDInputs
{
  return [(AXSSMotionTrackingInputManager *)self _supportsMotionTrackingType:2];
}

- (void)motionTrackingCameraManager:(id)a3 updatedCompatibleCaptureDevices:(id)a4
{
  uint64_t v5 = [(AXSSMotionTrackingInputManager *)self _compatibleCameraInputs];
  [v5 removeAllObjects];

  char v6 = [(AXSSMotionTrackingInputManager *)self _allCameraInputs];
  [v6 removeAllObjects];

  v7 = [(AXSSMotionTrackingInputManager *)self _cameraManager];
  v8 = [v7 allCaptureDevices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__AXSSMotionTrackingInputManager_motionTrackingCameraManager_updatedCompatibleCaptureDevices___block_invoke;
  v9[3] = &unk_1E606D4B0;
  v9[4] = self;
  [v8 enumerateObjectsUsingBlock:v9];

  [(AXSSMotionTrackingInputManager *)self _inputUpdated];
}

void __94__AXSSMotionTrackingInputManager_motionTrackingCameraManager_updatedCompatibleCaptureDevices___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _cameraManager];
  char v6 = [v5 compatibleCaptureDevices];
  int v7 = [v6 containsObject:v4];

  id v10 = +[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:v4];

  if (v7
    && objc_msgSend(*(id *)(a1 + 32), "_supportsMotionTrackingType:", objc_msgSend(v10, "trackingType")))
  {
    v8 = [*(id *)(a1 + 32) _compatibleCameraInputs];
    [v8 addObject:v10];
  }
  id v9 = [*(id *)(a1 + 32) _allCameraInputs];
  [v9 addObject:v10];
}

- (void)motionTrackingHIDManager:(id)a3 updatedDevices:(id)a4
{
  uint64_t v5 = [(AXSSMotionTrackingInputManager *)self _hidInputs];
  [v5 removeAllObjects];

  char v6 = [(AXSSMotionTrackingInputManager *)self _hidManager];
  int v7 = [v6 devices];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__AXSSMotionTrackingInputManager_motionTrackingHIDManager_updatedDevices___block_invoke;
  v8[3] = &unk_1E606D4D8;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];

  [(AXSSMotionTrackingInputManager *)self _inputUpdated];
}

void __74__AXSSMotionTrackingInputManager_motionTrackingHIDManager_updatedDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[AXSSMotionTrackingHIDInput motionTrackingHIDInputWithDevice:a2];
  if (v4)
  {
    unint64_t v3 = [*(id *)(a1 + 32) _hidInputs];
    [v3 addObject:v4];
  }
}

- (void)motionTrackingVideoFileInputManager:(id)a3 updatedVideoFileInputNames:(id)a4
{
  if (+[AXSSMotionTrackingVideoFileInputManager allowVideoFileInput])
  {
    uint64_t v5 = [(AXSSMotionTrackingInputManager *)self _videoFileInputs];
    [v5 removeAllObjects];

    char v6 = [(AXSSMotionTrackingInputManager *)self _videoFileInputManager];
    int v7 = [v6 videoFileInputNames];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__AXSSMotionTrackingInputManager_motionTrackingVideoFileInputManager_updatedVideoFileInputNames___block_invoke;
    v8[3] = &unk_1E606D500;
    v8[4] = self;
    [v7 enumerateObjectsUsingBlock:v8];

    [(AXSSMotionTrackingInputManager *)self _inputUpdated];
  }
}

void __97__AXSSMotionTrackingInputManager_motionTrackingVideoFileInputManager_updatedVideoFileInputNames___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 length])
  {
    uint64_t v3 = +[AXSSMotionTrackingVideoFileInput videoFileInputWithName:v6];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [*(id *)(a1 + 32) _videoFileInputs];
      [v5 addObject:v4];
    }
  }
}

- (id)_compatibleCameraInputMatchingCaptureDeviceUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    uint64_t v5 = [(AXSSMotionTrackingInputManager *)self _compatibleInputs];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__AXSSMotionTrackingInputManager__compatibleCameraInputMatchingCaptureDeviceUniqueID___block_invoke;
    v8[3] = &unk_1E606D528;
    id v9 = v4;
    id v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __86__AXSSMotionTrackingInputManager__compatibleCameraInputMatchingCaptureDeviceUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    v8 = [v7 captureDeviceUniqueID];
    if ([v8 length] && objc_msgSend(v8, "isEqualToString:", *(void *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_inputUpdated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _compatibleInputs];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "AXSSMotionTrackingInputManager: inputUpdated _compatibleInputs %@", (uint8_t *)&v4, 0xCu);
}

void __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) _compatibleInputs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke_2;
  v9[3] = &unk_1E606D550;
  id v10 = v6;
  long long v11 = *(_OWORD *)(a1 + 32);
  uint64_t v12 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqual:*(void *)(a1 + 32)]
    && objc_msgSend(*(id *)(a1 + 40), "_supportsMotionTrackingType:", objc_msgSend(v7, "trackingType")))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
}

void __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_supportsMotionTrackingType:", objc_msgSend(v7, "trackingType")))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (AXSSMotionTrackingInput)inputToUse
{
  return self->_inputToUse;
}

- (void)setInputToUse:(id)a3
{
}

- (AXSSMotionTrackingInputManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSSMotionTrackingInputManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_monitoring
{
  return self->__monitoring;
}

- (void)set_monitoring:(BOOL)a3
{
  self->__monitoring = a3;
}

- (AXSSMotionTrackingCameraManager)_cameraManager
{
  return self->__cameraManager;
}

- (void)set_cameraManager:(id)a3
{
}

- (NSMutableArray)_compatibleCameraInputs
{
  return self->__compatibleCameraInputs;
}

- (void)set_compatibleCameraInputs:(id)a3
{
}

- (NSMutableArray)_allCameraInputs
{
  return self->__allCameraInputs;
}

- (void)set_allCameraInputs:(id)a3
{
}

- (AXSSMotionTrackingHIDManager)_hidManager
{
  return self->__hidManager;
}

- (void)set_hidManager:(id)a3
{
}

- (NSMutableArray)_hidInputs
{
  return self->__hidInputs;
}

- (void)set_hidInputs:(id)a3
{
}

- (AXSSMotionTrackingVideoFileInputManager)_videoFileInputManager
{
  return self->__videoFileInputManager;
}

- (void)set_videoFileInputManager:(id)a3
{
}

- (NSMutableArray)_videoFileInputs
{
  return self->__videoFileInputs;
}

- (void)set_videoFileInputs:(id)a3
{
}

- (NSMutableArray)_compatibleInputs
{
  return self->__compatibleInputs;
}

- (void)set_compatibleInputs:(id)a3
{
}

- (NSMutableArray)_allInputs
{
  return self->__allInputs;
}

- (void)set_allInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allInputs, 0);
  objc_storeStrong((id *)&self->__compatibleInputs, 0);
  objc_storeStrong((id *)&self->__videoFileInputs, 0);
  objc_storeStrong((id *)&self->__videoFileInputManager, 0);
  objc_storeStrong((id *)&self->__hidInputs, 0);
  objc_storeStrong((id *)&self->__hidManager, 0);
  objc_storeStrong((id *)&self->__allCameraInputs, 0);
  objc_storeStrong((id *)&self->__compatibleCameraInputs, 0);
  objc_storeStrong((id *)&self->__cameraManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputToUse, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "AXSSMotionTrackingInputManager: setConfinguration %@", (uint8_t *)&v2, 0xCu);
}

@end
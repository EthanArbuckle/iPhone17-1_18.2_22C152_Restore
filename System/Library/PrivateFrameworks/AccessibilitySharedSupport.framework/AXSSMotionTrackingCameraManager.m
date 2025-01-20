@interface AXSSMotionTrackingCameraManager
+ (id)_sortedAndFilteredCaptureDevicesFromDevices:(id)a3;
- (AVCaptureDevice)defaultCaptureDevice;
- (AVCaptureDeviceDiscoverySession)_captureDeviceDiscoverySession;
- (AXSSMotionTrackingCameraManager)init;
- (AXSSMotionTrackingCameraManagerDelegate)delegate;
- (BOOL)_monitoring;
- (NSArray)allCaptureDevices;
- (NSArray)compatibleCaptureDevices;
- (NSMutableArray)_allCaptureDevices;
- (NSMutableArray)_compatibleCaptureDevices;
- (void)_allCaptureDevicesChanged:(id)a3;
- (void)_captureDeviceConnected:(id)a3;
- (void)_captureDeviceDisconnected:(id)a3;
- (void)_captureDeviceUpdated;
- (void)_resetDiscoverySession;
- (void)_startDiscoverySession;
- (void)_stopDiscoverySession;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)set_allCaptureDevices:(id)a3;
- (void)set_captureDeviceDiscoverySession:(id)a3;
- (void)set_compatibleCaptureDevices:(id)a3;
- (void)set_monitoring:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AXSSMotionTrackingCameraManager

- (AXSSMotionTrackingCameraManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXSSMotionTrackingCameraManager;
  v2 = [(AXSSMotionTrackingCameraManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    compatibleCaptureDevices = v2->__compatibleCaptureDevices;
    v2->__compatibleCaptureDevices = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    allCaptureDevices = v2->__allCaptureDevices;
    v2->__allCaptureDevices = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if (self->__monitoring)
  {
    allCaptureDevices = self->__allCaptureDevices;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__AXSSMotionTrackingCameraManager_dealloc__block_invoke;
    v12[3] = &unk_1E606D4B0;
    v12[4] = self;
    [(NSMutableArray *)allCaptureDevices enumerateObjectsUsingBlock:v12];
    captureDeviceDiscoverySession = self->__captureDeviceDiscoverySession;
    uint64_t v5 = NSStringFromSelector(sel_devices);
    [(AVCaptureDeviceDiscoverySession *)captureDeviceDiscoverySession removeObserver:self forKeyPath:v5 context:kCaptureDeviceDiscoverySessionKVOContext];

    v6 = NSStringFromSelector(sel_allCaptureDevices);
    [(AXSSMotionTrackingCameraManager *)self removeObserver:self forKeyPath:v6 context:kAllCaptureDevicesKVOContext];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v8 = getAVCaptureDeviceWasConnectedNotification();
    [v7 removeObserver:self name:v8 object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10 = getAVCaptureDeviceWasDisconnectedNotification();
    [v9 removeObserver:self name:v10 object:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)AXSSMotionTrackingCameraManager;
  [(AXSSMotionTrackingCameraManager *)&v11 dealloc];
}

uint64_t __42__AXSSMotionTrackingCameraManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"connected" context:kCaptureDeviceConnectedKVOContext];
}

- (void)startMonitoring
{
  v1 = [a1 _captureDeviceDiscoverySession];
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1B3B9D000, v2, v3, "AXSSMotionTrackingCameraManager: startMonitoring %@ %@ %d", v4, v5, v6, v7, v8);
}

- (void)stopMonitoring
{
  v1 = [a1 _captureDeviceDiscoverySession];
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1B3B9D000, v2, v3, "AXSSMotionTrackingCameraManager: stopMonitoring %@ %@ %d", v4, v5, v6, v7, v8);
}

void __49__AXSSMotionTrackingCameraManager_stopMonitoring__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a2;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:*(void *)(a1 + 32) name:v4 object:0];
}

- (NSArray)compatibleCaptureDevices
{
  uint64_t v2 = [(AXSSMotionTrackingCameraManager *)self _compatibleCaptureDevices];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allCaptureDevices
{
  uint64_t v2 = [(AXSSMotionTrackingCameraManager *)self _allCaptureDevices];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (AVCaptureDevice)defaultCaptureDevice
{
  id AVCaptureDeviceClass = getAVCaptureDeviceClass();
  id v4 = getAVMediaTypeVideo();
  id v5 = [AVCaptureDeviceClass defaultDeviceWithMediaType:v4];

  if (v5
    && ([(AXSSMotionTrackingCameraManager *)self _compatibleCaptureDevices],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsObject:v5],
        v6,
        v7))
  {
    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return (AVCaptureDevice *)v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kCaptureDeviceDiscoverySessionKVOContext == a6)
  {
    v13 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:]();
    }
    goto LABEL_15;
  }
  if ((void *)kAllCaptureDevicesKVOContext != a6)
  {
    if ((void *)kCaptureDeviceSuspendedKVOContext == a6)
    {
      v13 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:]();
      }
    }
    else
    {
      if ((void *)kCaptureDeviceConnectedKVOContext != a6)
      {
        v15.receiver = self;
        v15.super_class = (Class)AXSSMotionTrackingCameraManager;
        [(AXSSMotionTrackingCameraManager *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
        goto LABEL_16;
      }
      v13 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:].cold.4();
      }
    }
LABEL_15:

    [(AXSSMotionTrackingCameraManager *)self _captureDeviceUpdated];
    goto LABEL_16;
  }
  v14 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:]();
  }

  [(AXSSMotionTrackingCameraManager *)self _allCaptureDevicesChanged:v12];
LABEL_16:
}

+ (id)_sortedAndFilteredCaptureDevicesFromDevices:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_12];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  if ((unint64_t)[v6 count] > 1)
  {
    if (_sortedAndFilteredCaptureDevicesFromDevices__onceToken != -1) {
      dispatch_once(&_sortedAndFilteredCaptureDevicesFromDevices__onceToken, &__block_literal_global_24);
    }
    id AVCaptureDeviceClass = getAVCaptureDeviceClass();
    v9 = getAVMediaTypeVideo();
    id v10 = [AVCaptureDeviceClass defaultDeviceWithMediaType:v9];

    id v11 = (void *)[v6 mutableCopy];
    id v12 = (void *)[v6 copy];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke_30;
    v19 = &unk_1E606DA88;
    id v20 = v10;
    id v21 = v12;
    id v13 = v12;
    id v14 = v10;
    [v11 sortUsingComparator:&v16];
    id v7 = (id)objc_msgSend(v11, "copy", v16, v17, v18, v19);
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

uint64_t __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = getAVMediaTypeVideo();
  if ([v4 hasMediaType:v6])
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    id v8 = (void *)getAVMediaTypeMetadataObjectSymbolLoc_ptr_0;
    uint64_t v15 = getAVMediaTypeMetadataObjectSymbolLoc_ptr_0;
    if (!getAVMediaTypeMetadataObjectSymbolLoc_ptr_0)
    {
      v9 = (void *)AVFoundationLibrary_0();
      v13[3] = (uint64_t)dlsym(v9, "AVMediaTypeMetadataObject");
      getAVMediaTypeMetadataObjectSymbolLoc_ptr_0 = v13[3];
      id v8 = (void *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v8)
    {
      id v11 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
      _Block_object_dispose(&v12, 8);
      _Unwind_Resume(v11);
    }
    uint64_t v7 = [v4 hasMediaType:*v8];
  }

  return v7;
}

void __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke_2()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v0 = getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera();
  v20[0] = v0;
  v1 = getAVCaptureDeviceTypeBuiltInWideAngleMetadataCamera();
  v20[1] = v1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v2 = (id *)getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  uint64_t v19 = getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)AVFoundationLibrary_0();
    v17[3] = (uint64_t)dlsym(v3, "AVCaptureDeviceTypeBuiltInDualCamera");
    getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr = v17[3];
    uint64_t v2 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v2) {
    goto LABEL_11;
  }
  id v4 = *v2;
  v20[2] = v4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v5 = (id *)getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr;
  uint64_t v19 = getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr)
  {
    uint64_t v6 = (void *)AVFoundationLibrary_0();
    v17[3] = (uint64_t)dlsym(v6, "AVCaptureDeviceTypeBuiltInTelephotoCamera");
    getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr = v17[3];
    id v5 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v5) {
    goto LABEL_11;
  }
  id v7 = *v5;
  v20[3] = v7;
  id v8 = getAVCaptureDeviceTypeBuiltInWideAngleCamera();
  v20[4] = v8;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v9 = (id *)getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr;
  uint64_t v19 = getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr)
  {
    id v10 = (void *)AVFoundationLibrary_0();
    v17[3] = (uint64_t)dlsym(v10, "AVCaptureDeviceTypeBuiltInUltraWideCamera");
    getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr = v17[3];
    v9 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v9)
  {
LABEL_11:
    +[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    __break(1u);
  }
  id v21 = *v9;
  id v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = v21;
  uint64_t v13 = [v11 arrayWithObjects:v20 count:6];
  uint64_t v14 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  _sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes = v13;

  uint64_t v15 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
  _sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions = (uint64_t)&unk_1F0C670F8;
}

uint64_t __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6 && ([v5 isEqual:v6] & 1) != 0) {
    goto LABEL_34;
  }
  if (*(void *)(a1 + 32))
  {
    if (objc_msgSend(v5, "isEqual:") && !objc_msgSend(v7, "isEqual:", *(void *)(a1 + 32)))
    {
      uint64_t v23 = -1;
      goto LABEL_35;
    }
    if ([v7 isEqual:*(void *)(a1 + 32)]
      && ![v5 isEqual:*(void *)(a1 + 32)])
    {
      uint64_t v23 = 1;
      goto LABEL_35;
    }
  }
  uint64_t v8 = [v5 deviceType];
  if (!v8)
  {
LABEL_20:
    uint64_t v24 = [v5 position];
    if (v24 != [v7 position])
    {
      v25 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
      v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "position"));
      if ([v25 containsObject:v26])
      {
        v27 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
        v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "position"));
        LODWORD(v27) = [v27 containsObject:v28];

        if (v27)
        {
          v29 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
          uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "position"));
          unint64_t v20 = [v29 indexOfObject:v19];
          id v21 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
          uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "position"));
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    if ([*(id *)(a1 + 40) containsObject:v5]
      && [*(id *)(a1 + 40) containsObject:v7])
    {
      unint64_t v31 = [*(id *)(a1 + 40) indexOfObject:v7];
      if (v31 > [*(id *)(a1 + 40) indexOfObject:v5]) {
        uint64_t v23 = -1;
      }
      else {
        uint64_t v23 = 1;
      }
      goto LABEL_35;
    }
LABEL_34:
    uint64_t v23 = 0;
    goto LABEL_35;
  }
  v9 = (void *)v8;
  uint64_t v10 = [v7 deviceType];
  if (!v10)
  {
LABEL_19:

    goto LABEL_20;
  }
  id v11 = (void *)v10;
  id v12 = [v5 deviceType];
  uint64_t v13 = [v7 deviceType];
  if ([v12 isEqualToString:v13])
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v14 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  uint64_t v15 = [v5 deviceType];
  if (![v14 containsObject:v15])
  {

    goto LABEL_18;
  }
  uint64_t v16 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  uint64_t v17 = [v7 deviceType];
  LODWORD(v16) = [v16 containsObject:v17];

  if (!v16) {
    goto LABEL_20;
  }
  uint64_t v18 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  uint64_t v19 = [v7 deviceType];
  unint64_t v20 = [v18 indexOfObject:v19];
  id v21 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  uint64_t v22 = [v5 deviceType];
LABEL_24:
  v30 = (void *)v22;
  if (v20 > [v21 indexOfObject:v22]) {
    uint64_t v23 = -1;
  }
  else {
    uint64_t v23 = 1;
  }

LABEL_35:
  return v23;
}

- (void)_captureDeviceUpdated
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _compatibleCaptureDevices];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "AXSSMotionTrackingCameraManager: captureDeviceUpdated _compatibleCaptureDevices %@", v4, 0xCu);
}

void __56__AXSSMotionTrackingCameraManager__captureDeviceUpdated__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  if ((unint64_t)(*(void *)(a1 + 48) - 1) > 1)
  {
    if ([v3 isConnected])
    {
      [*(id *)(a1 + 40) addObject:v3];
    }
    else
    {
      id v6 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1B3B9D000, v6, OS_LOG_TYPE_INFO, "AXSSMotionTrackingCameraManager: Skipping device %@ because it is not connected!", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    id v4 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1B3B9D000, v4, OS_LOG_TYPE_INFO, "AXSSMotionTrackingCameraManager: Skipping device %@ due to authorization status: %ld", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_allCaptureDevicesChanged:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F284E0];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke;
  v9[3] = &unk_1E606D4B0;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  int v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke_2;
  v8[3] = &unk_1E606D4B0;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"connected" context:kCaptureDeviceConnectedKVOContext];
}

uint64_t __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32) forKeyPath:@"connected" options:1 context:kCaptureDeviceConnectedKVOContext];
}

- (void)_startDiscoverySession
{
  int v7 = [a1 _captureDeviceDiscoverySession];
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_1_3(&dword_1B3B9D000, v1, v2, "%@ Created and observed session: %@ mainThread %d", v3, v4, v5, v6, 2u);
}

- (void)_stopDiscoverySession
{
  uint64_t v1 = [a1 _captureDeviceDiscoverySession];
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1B3B9D000, v2, v3, "%@ Clearing and removing observer for session: %@, mainThread %d", v4, v5, v6, v7, v8);
}

- (void)_resetDiscoverySession
{
  uint64_t v3 = [(AXSSMotionTrackingCameraManager *)self _captureDeviceDiscoverySession];

  if (v3)
  {
    [(AXSSMotionTrackingCameraManager *)self _stopDiscoverySession];
    [(AXSSMotionTrackingCameraManager *)self _startDiscoverySession];
    [(AXSSMotionTrackingCameraManager *)self _captureDeviceUpdated];
  }
}

- (void)_captureDeviceConnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSSMotionTrackingCameraManager _captureDeviceConnected:]();
  }

  [(AXSSMotionTrackingCameraManager *)self _resetDiscoverySession];
  [(AXSSMotionTrackingCameraManager *)self _captureDeviceUpdated];
}

- (void)_captureDeviceDisconnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSSMotionTrackingCameraManager _captureDeviceDisconnected:]();
  }

  [(AXSSMotionTrackingCameraManager *)self _resetDiscoverySession];
  [(AXSSMotionTrackingCameraManager *)self _captureDeviceUpdated];
}

- (AXSSMotionTrackingCameraManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSSMotionTrackingCameraManagerDelegate *)WeakRetained;
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

- (NSMutableArray)_compatibleCaptureDevices
{
  return self->__compatibleCaptureDevices;
}

- (void)set_compatibleCaptureDevices:(id)a3
{
}

- (NSMutableArray)_allCaptureDevices
{
  return self->__allCaptureDevices;
}

- (void)set_allCaptureDevices:(id)a3
{
}

- (AVCaptureDeviceDiscoverySession)_captureDeviceDiscoverySession
{
  return self->__captureDeviceDiscoverySession;
}

- (void)set_captureDeviceDiscoverySession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__captureDeviceDiscoverySession, 0);
  objc_storeStrong((id *)&self->__allCaptureDevices, 0);
  objc_storeStrong((id *)&self->__compatibleCaptureDevices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on discovery session: %@", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on all devices: %@", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on suspended capture device %@: %@");
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on connected capture device %@: %@");
}

- (void)_captureDeviceConnected:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingCameraManager: _captureDeviceConnected %@", v2, v3, v4, v5, v6);
}

- (void)_captureDeviceDisconnected:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_1B3B9D000, v0, v1, "AXSSMotionTrackingCameraManager: _captureDeviceDisconnected %@", v2, v3, v4, v5, v6);
}

@end
@interface FigCaptureCalibrationMonitor
+ (id)sharedInstance;
+ (void)initialize;
+ (void)initializeSharedInstanceWithCaptureSourceBackings:(id)a3;
- (id)_runAndCreateDictionaryForCalibrationContext:(int)a3 deviceType:(int)a4 devicePosition:(int *)a5 errors:;
- (id)apsSphereInteractionCalibrationData;
- (id)autoFocusCalibrationData;
- (id)autoFocusPositionSensorCalibrationData;
- (id)runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType:(int)a3 devicePosition:(int)a4;
- (id)sphereCalibrationData;
- (id)sphereEndStopCalibrationData;
- (os_unfair_lock_s)_calibrationShouldAbort;
- (void)_attemptToRunCalibrationForCalibrationContext:(int)a3 deviceType:(int)a4 devicePosition:(char)a5 disableHistoryChecking:(void *)a6 resultsBlock:;
- (void)_notifyOfDeviceMotion;
- (void)_setupActivityAndTriggers:(int)a3 interval:(int)a4 batteryLevel:(void *)a5 calibrationBlock:(char)a6 isRepeating:;
- (void)_setupCalibrationForContext:(uint64_t)a1;
- (void)_setupDuetTriggersAndScheduling;
- (void)_setupRepeatingCalibrationScheduling:(void *)a3 withCalibrationBlock:;
- (void)initWithCaptureSourceBackings:(void *)a1;
- (xpc_object_t)_createDefaultXPCSchedulingParametersWithInterval:(int)a3 batteryLevel:;
@end

@implementation FigCaptureCalibrationMonitor

+ (id)sharedInstance
{
  return (id)sFCCalibration;
}

- (id)autoFocusPositionSensorCalibrationData
{
  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = [(FigCaptureCalibrationContext *)self->_autoFocusPositionSensorCalibrationContext lastSuccessfulCalibrationData];
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (id)autoFocusCalibrationData
{
  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = [(FigCaptureCalibrationContext *)self->_autoFocusCalibrationContext lastSuccessfulCalibrationData];
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (id)apsSphereInteractionCalibrationData
{
  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = [(FigCaptureCalibrationContext *)self->_apsSphereInteractionCalibrationContext lastSuccessfulCalibrationData];
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

+ (void)initialize
{
}

+ (void)initializeSharedInstanceWithCaptureSourceBackings:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__FigCaptureCalibrationMonitor_initializeSharedInstanceWithCaptureSourceBackings___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = a3;
  if (initializeSharedInstanceWithCaptureSourceBackings__initSharedFCSCalibration != -1) {
    dispatch_once(&initializeSharedInstanceWithCaptureSourceBackings__initSharedFCSCalibration, block);
  }
}

void *__82__FigCaptureCalibrationMonitor_initializeSharedInstanceWithCaptureSourceBackings___block_invoke(uint64_t a1)
{
  result = -[FigCaptureCalibrationMonitor initWithCaptureSourceBackings:]([FigCaptureCalibrationMonitor alloc], *(void **)(a1 + 32));
  sFCCalibration = (uint64_t)result;
  return result;
}

- (void)initWithCaptureSourceBackings:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v23.receiver = a1;
  v23.super_class = (Class)FigCaptureCalibrationMonitor;
  v3 = objc_msgSendSuper2(&v23, sel_init);
  if (v3)
  {
    uint64_t v18 = (uint64_t)v3;
    v3[1] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)[a2 sourceInfoDictionaries];
    uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      v16 = @"Sphere";
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", 0x1EFA53CC0, v16);
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
          if (v9 <= 0xA && ((1 << v9) & 0x4AC) != 0)
          {
            uint64_t v11 = v9;
            if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"Focus"), "BOOLValue") & 1) != 0
              || objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v16), "BOOLValue"))
            {
              v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v11), @"DeviceType");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", @"NonLocalizedName"), @"DeviceName");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", @"Position"), @"DevicePosition");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), @"SupportedCalibrations");
              [*(id *)(v18 + 8) addObject:v12];
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }
    v3 = (void *)v18;
    *(void *)(v18 + 16) = dispatch_queue_create("com.apple.coremedia.apscal", 0);
    *(void *)(v18 + 24) = FigSimpleMutexCreate();
    FigGetCFPreferenceDoubleWithDefault();
    *(_DWORD *)(v18 + 80) = (int)v13;
    FigGetCFPreferenceDoubleWithDefault();
    *(void *)(v18 + 88) = v14;
    *(_DWORD *)(v18 + 72) = FigGetCFPreferenceNumberWithDefault();
    -[FigCaptureCalibrationMonitor _setupDuetTriggersAndScheduling](v18);
  }
  return v3;
}

- (void)_setupDuetTriggersAndScheduling
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1;
    int v44 = 0;
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    LOBYTE(v27) = 0;
    uint64_t v7 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "registerClientWithPID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceSharingWithAVFlashlightAllowed:clientIsAVFlashlight:deviceAvailabilityChangedHandler:", getpid(), @"FigCaptureCalibrationMonitor", 2, 0, 0, 0, v27, 0);
    v38 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDeviceForClient:informClientWhenDeviceAvailableAgain:error:", v7, 0, &v44);
    if (v38)
    {
      v33 = (void *)v3;
      v34 = (void *)v4;
      v35 = (void *)v5;
      v36 = (void *)v6;
      unsigned int v30 = v7;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v31 = (void *)v2;
      id obj = *(id *)(v2 + 8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v37 = *(void *)v41;
        uint64_t v10 = *MEMORY[0x1E4F547B8];
        uint64_t v11 = *MEMORY[0x1E4F54BB8];
        uint64_t v12 = *MEMORY[0x1E4F547F8];
        uint64_t v13 = *MEMORY[0x1E4F54BC0];
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v41 != v37) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v16 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamFromDevice:position:deviceType:deviceClientPriority:allowsStreamControlLoss:error:", v38, objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"DevicePosition"), "intValue"), objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"DeviceType"), "intValue"), 0, 0, &v44);
            v17 = v16;
            int v18 = v44;
            if (v44)
            {
              fig_log_get_emitter();
              uint64_t v29 = v1;
              LODWORD(v28) = v18;
              FigDebugAssert3();

              uint64_t v2 = (uint64_t)v31;
              uint64_t v7 = v30;
              goto LABEL_28;
            }
            objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v16, "portType"), @"PortType");
            long long v19 = (void *)[v17 supportedProperties];
            uint64_t v20 = [v15 objectForKeyedSubscript:@"DeviceName"];
            long long v21 = (void *)[v15 objectForKeyedSubscript:@"SupportedCalibrations"];
            if ([v19 objectForKeyedSubscript:v10])
            {
              [v21 addObject:v10];
              [v33 addObject:v20];
            }
            if ([v19 objectForKeyedSubscript:v11])
            {
              [v21 addObject:v11];
              [v34 addObject:v20];
            }
            if ([v19 objectForKeyedSubscript:v12])
            {
              [v21 addObject:v12];
              [v35 addObject:v20];
            }
            if ([v19 objectForKeyedSubscript:v13])
            {
              [v21 addObject:v13];
              [v36 addObject:v20];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      uint64_t v2 = (uint64_t)v31;
      if ([v33 count])
      {
        long long v22 = [[FigCaptureAutoFocusCalibrationContext alloc] initWithSupportedDeviceNames:v33];
        v31[13] = v22;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v22);
      }
      if ([v34 count])
      {
        objc_super v23 = [[FigCaptureSphereCalibrationContext alloc] initWithSupportedDeviceNames:v34];
        v31[15] = v23;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v23);
      }
      uint64_t v7 = v30;
      if ([v35 count])
      {
        v24 = [[FigCaptureAPSSphereInteractionCalibrationContext alloc] initWithSupportedDeviceNames:v35];
        v31[14] = v24;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v24);
      }
      if ([v36 count])
      {
        uint64_t v25 = [[FigCaptureSphereEndStopCalibrationContext alloc] initWithSupportedDeviceNames:v36];
        v31[16] = v25;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v25);
      }
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v29 = v1;
      LODWORD(v28) = 0;
      FigDebugAssert3();
    }
LABEL_28:
    if (v44)
    {
      int v26 = *MEMORY[0x1E4F141F8];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __63__FigCaptureCalibrationMonitor__setupDuetTriggersAndScheduling__block_invoke;
      v39[3] = &unk_1E5C24430;
      v39[4] = v2;
      -[FigCaptureCalibrationMonitor _setupActivityAndTriggers:interval:batteryLevel:calibrationBlock:isRepeating:](v2, "com.apple.coremedia.calibration.setup", v26, 50, v39, 0);
    }
    objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor", v28, v29), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", v38, v7, 0, 0);
  }
}

- (id)runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType:(int)a3 devicePosition:(int)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__14;
  long long v21 = __Block_byref_object_dispose__14;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke;
  v16[3] = &unk_1E5C26120;
  v16[4] = v7;
  v16[5] = &v17;
  calibrationRunQueue = self->_calibrationRunQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke_2;
  v13[3] = &unk_1E5C26148;
  int v14 = a3;
  int v15 = a4;
  v13[4] = self;
  v13[5] = v16;
  dispatch_async(calibrationRunQueue, v13);
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    v23[0] = @"Result";
    v23[1] = @"StatusCode";
    v24[0] = MEMORY[0x1E4F1CC28];
    v24[1] = &unk_1EFAFED60;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v18[5] = v10;
  }
  dispatch_release(v7);
  uint64_t v11 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v11;
}

intptr_t __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Result";
  v6[1] = @"StatusCode";
  v7[0] = [NSNumber numberWithBool:a2];
  v7[1] = [NSNumber numberWithUnsignedInt:a3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke_2(uint64_t a1)
{
}

- (void)_attemptToRunCalibrationForCalibrationContext:(int)a3 deviceType:(int)a4 devicePosition:(char)a5 disableHistoryChecking:(void *)a6 resultsBlock:
{
  if (a1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 24));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(unsigned char *)(a1 + 32) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
    uint64_t v22 = 0;
    objc_super v23 = &v22;
    uint64_t v24 = 0x3052000000;
    uint64_t v25 = __Block_byref_object_copy__14;
    int v26 = __Block_byref_object_dispose__14;
    id v27 = 0;
    id v27 = objc_alloc_init(MEMORY[0x1E4F22230]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F22220]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    int v15 = (void *)[a6 copy];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke;
    v21[3] = &unk_1E5C26198;
    v21[4] = a1;
    [v13 startActivityUpdatesToQueue:v14 withHandler:v21];

    [v12 setMaxConcurrentOperationCount:1];
    *(_DWORD *)(a1 + 76) = 0;
    [(id)v23[5] setDeviceMotionUpdateInterval:1.0];
    v16 = (void *)v23[5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke_2;
    v17[3] = &unk_1E5C261C0;
    v17[7] = v15;
    v17[8] = &v22;
    v17[4] = a1;
    v17[5] = a2;
    int v18 = a3;
    int v19 = a4;
    char v20 = a5;
    v17[6] = v13;
    [v16 startDeviceMotionUpdatesUsingReferenceFrame:4 toQueue:v12 withHandler:v17];

    _Block_object_dispose(&v22, 8);
  }
}

- (id)sphereCalibrationData
{
  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  uint64_t v4 = [(FigCaptureCalibrationContext *)self->_sphereCalibrationContext lastSuccessfulCalibrationData];
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (id)sphereEndStopCalibrationData
{
  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  uint64_t v4 = [(FigCaptureCalibrationContext *)self->_sphereEndStopCalibrationContext lastSuccessfulCalibrationData];
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (os_unfair_lock_s)_calibrationShouldAbort
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 9;
    os_unfair_lock_lock(a1 + 9);
    uint64_t v1 = (os_unfair_lock_s *)(LOBYTE(v1[8]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_setupActivityAndTriggers:(int)a3 interval:(int)a4 batteryLevel:(void *)a5 calibrationBlock:(char)a6 isRepeating:
{
  if (a1)
  {
    uint64_t v11 = (void *)[a5 copy];
    id v12 = (void *)*MEMORY[0x1E4F14158];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __109__FigCaptureCalibrationMonitor__setupActivityAndTriggers_interval_batteryLevel_calibrationBlock_isRepeating___block_invoke;
    v13[3] = &unk_1E5C26170;
    int v14 = a3;
    int v15 = a4;
    char v16 = a6;
    v13[4] = a1;
    v13[5] = v11;
    xpc_activity_register(a2, v12, v13);
  }
}

void __109__FigCaptureCalibrationMonitor__setupActivityAndTriggers_interval_batteryLevel_calibrationBlock_isRepeating___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
  else if (!state)
  {
    xpc_object_t v5 = -[FigCaptureCalibrationMonitor _createDefaultXPCSchedulingParametersWithInterval:batteryLevel:](*(void *)(a1 + 32), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], *(unsigned char *)(a1 + 56));
    xpc_object_t v6 = xpc_activity_copy_criteria(activity);
    if (v6)
    {
      uint64_t v7 = v6;
      if (!xpc_equal(v6, v5)) {
        xpc_activity_set_criteria(activity, v5);
      }
      xpc_release(v7);
    }
    else
    {
      xpc_activity_set_criteria(activity, v5);
    }
    xpc_release(v5);
  }
}

- (xpc_object_t)_createDefaultXPCSchedulingParametersWithInterval:(int)a3 batteryLevel:
{
  if (!a1) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141C8], a2);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14340], 1);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F14180], (const char *)*MEMORY[0x1E4F14258]);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v7 = (id *)get_DASCTSMinBatteryLevelKeySymbolLoc_ptr;
  uint64_t v15 = get_DASCTSMinBatteryLevelKeySymbolLoc_ptr;
  if (!get_DASCTSMinBatteryLevelKeySymbolLoc_ptr)
  {
    uint64_t v8 = (void *)DuetActivitySchedulerLibrary();
    v13[3] = (uint64_t)dlsym(v8, "_DASCTSMinBatteryLevelKey");
    get_DASCTSMinBatteryLevelKeySymbolLoc_ptr = v13[3];
    uint64_t v7 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v7) {
    -[FigCaptureCalibrationMonitor _createDefaultXPCSchedulingParametersWithInterval:batteryLevel:]();
  }
  xpc_dictionary_set_int64(v6, (const char *)[*v7 cStringUsingEncoding:4], a3);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  dispatch_time_t v9 = (id *)get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr;
  uint64_t v15 = get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr;
  if (!get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr)
  {
    uint64_t v10 = (void *)DuetActivitySchedulerLibrary();
    v13[3] = (uint64_t)dlsym(v10, "_DASCTSMagneticInterferenceSensitivityKey");
    get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr = v13[3];
    dispatch_time_t v9 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v9) {
    -[FigCaptureCalibrationMonitor _createDefaultXPCSchedulingParametersWithInterval:batteryLevel:]();
  }
  xpc_dictionary_set_BOOL(v6, (const char *)[*v9 cStringUsingEncoding:4], 1);
  xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F14190], v6);
  xpc_release(v6);
  return v5;
}

- (void)_setupCalibrationForContext:(uint64_t)a1
{
  if (a1)
  {
    v3[0] = 0;
    v3[1] = v3;
    v3[2] = 0x3052000000;
    v3[3] = __Block_byref_object_copy__14;
    v3[4] = __Block_byref_object_dispose__14;
    v3[5] = a1;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke;
    v2[3] = &unk_1E5C25210;
    v2[5] = a2;
    v2[6] = v3;
    v2[4] = a1;
    -[FigCaptureCalibrationMonitor _setupRepeatingCalibrationScheduling:withCalibrationBlock:](a1, a2, v2);
    _Block_object_dispose(v3, 8);
  }
}

uint64_t __63__FigCaptureCalibrationMonitor__setupDuetTriggersAndScheduling__block_invoke(uint64_t a1)
{
  return -[FigCaptureCalibrationMonitor _setupDuetTriggersAndScheduling](*(void *)(a1 + 32));
}

- (void)_setupRepeatingCalibrationScheduling:(void *)a3 withCalibrationBlock:
{
  if (a1)
  {
    xpc_object_t v6 = (const char *)objc_msgSend((id)objc_msgSend(a2, "activityName"), "cStringUsingEncoding:", 134217984);
    int v7 = [a2 interval];
    int v8 = [a2 minimumBatteryLevelToRun];
    -[FigCaptureCalibrationMonitor _setupActivityAndTriggers:interval:batteryLevel:calibrationBlock:isRepeating:](a1, v6, v7, v8, a3, 1);
  }
}

void __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 stationary] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    -[FigCaptureCalibrationMonitor _notifyOfDeviceMotion](v3);
  }
}

- (void)_notifyOfDeviceMotion
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(unsigned char *)(a1 + 32) = 1;
    os_unfair_lock_unlock(v2);
  }
}

uint64_t __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  if (!*(void *)(*(void *)(*(void *)(result + 64) + 8) + 40)) {
    return result;
  }
  uint64_t v3 = a3;
  uint64_t v5 = result;
  unsigned __int8 v37 = 0;
  unsigned int v36 = 0;
  uint64_t v6 = *(void *)(result + 32);
  if (v6) {
    double v7 = *(double *)(v6 + 88);
  }
  else {
    double v7 = 0.0;
  }
  if (a2)
  {
    [a2 magneticField];
    [a2 magneticField];
    [a2 magneticField];
    [a2 magneticField];
    [a2 magneticField];
    [a2 magneticField];
    *(double *)(*(void *)(v5 + 32) + 64) = sqrt(*((double *)&v30 + 1) * *((double *)&v28 + 1)+ *(double *)&v34 * *(double *)&v32+ *(double *)&v27 * *(double *)&v25);
    uint64_t v8 = *(void *)(v5 + 32);
    [a2 magneticField];
    *(_OWORD *)(v8 + 40) = v22;
    *(void *)(v8 + 56) = v23;
    [a2 magneticField];
    if (!v3 && DWORD2(v21) != -1)
    {
      LOBYTE(v3) = 0;
      goto LABEL_14;
    }
    result = [a2 magneticField];
    if (DWORD2(v19) == -1)
    {
      uint64_t v10 = *(void *)(v5 + 32);
      int v11 = *(_DWORD *)(v10 + 76);
      if (v11 <= 1)
      {
        *(_DWORD *)(v10 + 76) = v11 + 1;
        return result;
      }
    }
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    *(void *)(v6 + 64) = 0;
    dispatch_time_t v9 = *(void **)(result + 32);
    long long v22 = 0u;
    long long v23 = 0u;
    v9[6] = 0;
    v9[7] = 0;
    v9[5] = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    if (!a3) {
      goto LABEL_14;
    }
    long long v18 = 0uLL;
    long long v19 = 0uLL;
  }
  LOBYTE(v3) = 1;
LABEL_14:
  [*(id *)(*(void *)(*(void *)(v5 + 64) + 8) + 40) stopDeviceMotionUpdates];
  uint64_t v12 = *(void *)(v5 + 32);
  if ((v3 & 1) != 0 || *(double *)(v12 + 64) >= v7)
  {
    id v13 = 0;
    ++*(_DWORD *)(v12 + 72);
    uint64_t v15 = *(void *)(v5 + 32);
    if (*(double *)(v15 + 64) >= v7) {
      LODWORD(v14) = 2;
    }
    else {
      LODWORD(v14) = 128;
    }
  }
  else
  {
    int v17 = 0;
    id v13 = -[FigCaptureCalibrationMonitor _runAndCreateDictionaryForCalibrationContext:deviceType:devicePosition:errors:](v12, *(void **)(v5 + 40), *(_DWORD *)(v5 + 72), *(_DWORD *)(v5 + 76), &v17);
    LODWORD(v14) = v17;
    *(_DWORD *)(*(void *)(v5 + 32) + 72) = 0;
    uint64_t v15 = *(void *)(v5 + 32);
  }
  if (-[FigCaptureCalibrationMonitor _calibrationShouldAbort]((os_unfair_lock_s *)v15)) {
    uint64_t v14 = v14 | 0x20;
  }
  else {
    uint64_t v14 = v14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(v5 + 40) setDisableHistoryChecking:*(unsigned __int8 *)(v5 + 80)];
  }
  objc_msgSend(*(id *)(v5 + 40), "updateWithNewCalibrationData:orExternalErrors:magneticFieldAttempts:magneticField:isCalibrationValid:calibrationStatus:", v13, v14, *(unsigned int *)(*(void *)(v5 + 32) + 72), &v37, &v36, *(double *)(*(void *)(v5 + 32) + 40), *(double *)(*(void *)(v5 + 32) + 48), *(double *)(*(void *)(v5 + 32) + 56));
  uint64_t v16 = *(void *)(v5 + 56);
  if (v16) {
    (*(void (**)(uint64_t, void, void))(v16 + 16))(v16, v37, v36);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(v5 + 40) setDisableHistoryChecking:0];
  }

  [*(id *)(v5 + 48) stopActivityUpdates];
  *(void *)(*(void *)(*(void *)(v5 + 64) + 8) + 40) = 0;
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(void *)(v5 + 32) + 24));
}

- (id)_runAndCreateDictionaryForCalibrationContext:(int)a3 deviceType:(int)a4 devicePosition:(int *)a5 errors:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  LOWORD(v33) = 0;
  uint64_t v8 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "registerClientWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceSharingWithAVFlashlightAllowed:clientIsAVFlashlight:deviceAvailabilityChangedHandler:", getpid(), @"internal", @"FigCaptureCalibrationMonitor", 2, 0, 0, v33, 0);
  dispatch_time_t v9 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDeviceForClient:informClientWhenDeviceAvailableAgain:error:", v8, 0, 0);
  if (!v9)
  {
    uint64_t v10 = 0;
    int v29 = 64;

    goto LABEL_55;
  }
  long long v35 = v9;
  uint64_t v10 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:", v9, &unk_1EFB030E0, &unk_1EFB030F8, 0, 0, 0);
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = 0;
    id v38 = 0;
    goto LABEL_45;
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = *(id *)(a1 + 8);
  uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (!v42)
  {
    int v29 = 0;
    goto LABEL_45;
  }
  unsigned int v34 = v8;
  int v36 = 0;
  uint64_t v44 = *(void *)v51;
  if (a3) {
    BOOL v11 = a4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  int v43 = v12;
  uint64_t v37 = *MEMORY[0x1E4F547D8];
LABEL_12:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v51 != v44) {
      objc_enumerationMutation(obj);
    }
    uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
    int v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
    int v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"DevicePosition"), "intValue");
    if (!v43) {
      break;
    }
    if (v15 == a3 && v16 == a4) {
      break;
    }
LABEL_40:
    if (++v13 == v42)
    {
      uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (!v42)
      {
        int v29 = v36;
        if (v36) {
          goto LABEL_48;
        }
        uint64_t v8 = v34;
LABEL_45:
        dispatch_time_t v9 = v35;
        if (a5) {
          goto LABEL_56;
        }
        goto LABEL_57;
      }
      goto LABEL_12;
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v18 = [v10 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (!v18) {
    goto LABEL_47;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v47;
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v47 != v20) {
        objc_enumerationMutation(v10);
      }
      long long v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      uint64_t v23 = [v22 portType];
      if (v23 == [v14 objectForKeyedSubscript:@"PortType"])
      {
        if (!v22) {
          goto LABEL_47;
        }
        uint64_t v24 = [v14 objectForKeyedSubscript:@"DeviceName"];
        if (objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"SupportedCalibrations"), "containsObject:", objc_msgSend(a2, "propertyName")))
        {
          if (objc_msgSend((id)objc_msgSend(a2, "propertyName"), "isEqualToString:", v37))
          {
            uint64_t v25 = objc_msgSend((id)objc_msgSend(a2, "lastSuccessfulCalibrationData"), "objectForKeyedSubscript:", v24);
            if (v25) {
              objc_msgSend(v22, "setProperty:value:", objc_msgSend(a2, "propertyName"), v25);
            }
          }
          int v45 = 0;
          long long v26 = objc_msgSend(v22, "getProperty:error:", objc_msgSend(a2, "propertyName"), &v45);
          if (v45)
          {
            dispatch_time_t v9 = v35;
            uint64_t v8 = v34;
            int v30 = v36;
            if (v45 == -12688) {
              unsigned int v31 = 64;
            }
            else {
              unsigned int v31 = 0x80000000;
            }
            goto LABEL_53;
          }
          long long v27 = v26;
          uint64_t v28 = [v26 length];
          if (v28 != [a2 expectedDataSize])
          {
            unsigned int v31 = 0x80000000;
            dispatch_time_t v9 = v35;
            uint64_t v8 = v34;
            int v30 = v36;
LABEL_53:
            int v29 = v30 | v31;
            goto LABEL_54;
          }
          if (v27)
          {
            [(id)objc_opt_class() printDebugInfoForRawStreamCalibrationData:v27];
            [v38 setObject:v27 forKeyedSubscript:v24];
          }
          else
          {
            v36 |= 0x80000000;
          }
        }
        goto LABEL_40;
      }
    }
    uint64_t v19 = [v10 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_47:
  int v29 = v36 | 0x40;
LABEL_48:
  uint64_t v8 = v34;
  dispatch_time_t v9 = v35;
LABEL_54:

LABEL_55:
  id v38 = 0;
  if (a5) {
LABEL_56:
  }
    *a5 = v29;
LABEL_57:

  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", v9, v8, 0, 0);
  return v38;
}

void __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke_2;
  v2[3] = &unk_1E5C246B8;
  long long v3 = *(_OWORD *)(a1 + 40);
  dispatch_async(v1, v2);
}

void __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke_2(uint64_t a1)
{
}

- (void)_createDefaultXPCSchedulingParametersWithInterval:batteryLevel:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *get_DASCTSMinBatteryLevelKey(void)"), @"FigCaptureCalibrationMonitor.m", 50, @"%s", dlerror());
  __break(1u);
}

- (void)_createDefaultXPCSchedulingParametersWithInterval:batteryLevel:.cold.2()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *get_DASCTSMagneticInterferenceSensitivityKey(void)"), @"FigCaptureCalibrationMonitor.m", 49, @"%s", dlerror());
  __break(1u);
}

@end
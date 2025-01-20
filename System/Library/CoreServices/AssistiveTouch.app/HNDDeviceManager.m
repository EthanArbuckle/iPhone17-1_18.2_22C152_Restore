@interface HNDDeviceManager
+ (id)sharedManager;
- (ASTUIGazeEnrollmentManager)gazeEnrollmentManager;
- (BOOL)_isTrackingErrorWithFaceImportant:(int64_t)a3;
- (BOOL)_shouldProcessState:(id)a3;
- (BOOL)detectDevices;
- (BOOL)forceEyeTrackerExperience;
- (BOOL)hidDeviceIsConfiguring;
- (BOOL)hidDeviceSentReservedStatus;
- (BOOL)isOnDeviceEyeTrackingEnabled;
- (BOOL)isTrackingInputActive;
- (BOOL)mainDeviceIsMotionTracker;
- (BOOL)mainDeviceIsMotionTrackerWithoutInternalOverride;
- (BOOL)mainDeviceIsOnDeviceEyeTracker;
- (BOOL)mainDeviceIsPointer;
- (BOOL)shouldDisableMainPointerStatusForUnitTesting;
- (BOOL)shouldShowUncalibratedPoints;
- (BOOL)wasSnappedInBubbleMode;
- (BSInvalidatable)virtualMouseClientAssertionForActiveMotionTracker;
- (CGPoint)convertPointToDeviceOrientation:(CGPoint)a3;
- (CGPoint)lastSeenLookAtPoint;
- (CGRect)rotatedScreenBounds;
- (HNDDeviceDetector)deviceDetector;
- (HNDDeviceManager)init;
- (HNDHandManager)handManager;
- (NSTimer)onDeviceEyeTrackingQuitCurrentAppTimer;
- (id)_currentPointSmoother;
- (id)_smoothingBufferSizeForCurrentActiveEyeTracker;
- (int)notifyToken;
- (int64_t)currentDeviceOrientation;
- (int64_t)currentEyeTrackingErrorCode;
- (int64_t)deviceCount;
- (int64_t)deviceCountWithSecondaryButtons;
- (void)_checkBackboardEffectiveDeviceOrientation;
- (void)_motionTrackerInputSourceFailedToTrackFaceWithErrorCode:(int64_t)a3;
- (void)_motionTrackerInputSourceTrackedFaceAtPoint:(CGPoint)a3;
- (void)_notifyDisplayManagerDeviceCountChanged;
- (void)_onDeviceEyeTrackingToggled;
- (void)_processAllOtherMotionTrackerErrorsWithErrorCode:(int64_t)a3;
- (void)_processCameraStolenError;
- (void)_resetCalibrationTimer;
- (void)_resetMotionTrackerErrorAndTimer;
- (void)_startMonitoringEffectiveDeviceOrientation;
- (void)_startTrackingMotionInput:(id)a3;
- (void)_stopMonitoringEffectiveDeviceOrientation;
- (void)_stopTrackingMotionInput;
- (void)addDevice:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 didPostEvent:(id)a4;
- (void)device:(id)a3 didUnload:(BOOL)a4;
- (void)deviceDetector:(id)a3 didFindDevice:(__IOHIDDevice *)a4;
- (void)deviceDetector:(id)a3 unloadDevicesPassingTest:(id)a4;
- (void)disableMotionTrackingDevices;
- (void)enableMotionTrackingDevices;
- (void)eyeTrackingRecalibrateFace;
- (void)hidDeviceDidStartConfiguring:(BOOL)a3;
- (void)motionTracker:(id)a3 updatedState:(id)a4;
- (void)motionTrackingInputManager:(id)a3 updatedInputToUse:(id)a4;
- (void)mousePointerDevicesDidConnect:(id)a3;
- (void)mousePointerDevicesDidDisconnect:(id)a3;
- (void)removeAllDevices;
- (void)removeDevice:(id)a3;
- (void)restartDeviceDetection;
- (void)setCurrentDeviceOrientation:(int64_t)a3;
- (void)setDetectDevices:(BOOL)a3;
- (void)setDeviceDetector:(id)a3;
- (void)setForceEyeTrackerExperience:(BOOL)a3;
- (void)setGazeEnrollmentManager:(id)a3;
- (void)setHandManager:(id)a3;
- (void)setHidDeviceSentReservedStatus:(BOOL)a3;
- (void)setIsOnDeviceEyeTrackingEnabled:(BOOL)a3;
- (void)setIsTrackingInputActive:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setOnDeviceEyeTrackingQuitCurrentAppTimer:(id)a3;
- (void)setShouldDisableMainPointerStatusForUnitTesting:(BOOL)a3;
- (void)setShouldShowUncalibratedPoints:(BOOL)a3;
- (void)setVirtualMouseClientAssertionForActiveMotionTracker:(id)a3;
- (void)setWasSnappedInBubbleMode:(BOOL)a3;
@end

@implementation HNDDeviceManager

+ (id)sharedManager
{
  v2 = +[HNDHandManager sharedManager];
  v3 = [v2 deviceManager];

  return v3;
}

- (HNDDeviceManager)init
{
  v86.receiver = self;
  v86.super_class = (Class)HNDDeviceManager;
  v2 = [(HNDDeviceManager *)&v86 init];
  v3 = (HNDDeviceManager *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 24) = vdupq_n_s64(0xC1E6CEAF20000000);
    *((void *)v2 + 5) = 0x3FE0000000000000;
    v4 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    scrollHysteresisTimer = v3->_scrollHysteresisTimer;
    v3->_scrollHysteresisTimer = v4;

    uint64_t v6 = +[NSMutableArray array];
    devices = v3->_devices;
    v3->_devices = (NSMutableArray *)v6;

    id v8 = objc_alloc_init((Class)AXSSMotionTrackingInputConfiguration);
    if (AXIsInternalInstall())
    {
      v9 = +[AXSettings sharedInstance];
      unsigned int v10 = [v9 assistiveTouchInternalOnlyPearlTrackingEnabled];
    }
    else
    {
      unsigned int v10 = 0;
    }
    v11 = +[NSMutableSet setWithObject:&off_1001BBA78];
    v12 = v11;
    if (v10) {
      [v11 addObject:&off_1001BBA90];
    }
    if (AXDeviceSupportsOnDeviceEyeTracking())
    {
      uint64_t v13 = +[ASTUIGazeEnrollmentManager sharedManager];
      gazeEnrollmentManager = v3->_gazeEnrollmentManager;
      v3->_gazeEnrollmentManager = (ASTUIGazeEnrollmentManager *)v13;

      objc_initWeak(&location, v3);
      v15 = +[AXSettings sharedInstance];
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_100008C84;
      v82[3] = &unk_1001AAA40;
      objc_copyWeak(&v84, &location);
      v16 = v3;
      v83 = v16;
      [v15 registerUpdateBlock:v82 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingEnabled" withListener:v16];

      objc_destroyWeak(&v84);
      v17 = +[AXSettings sharedInstance];
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_100008CD8;
      v80[3] = &unk_1001AAA68;
      objc_copyWeak(&v81, &location);
      [v17 registerUpdateBlock:v80 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints" withListener:v16];

      objc_destroyWeak(&v81);
      v18 = +[AXSettings sharedInstance];
      objc_msgSend(v16[15], "setUseGaussianBlur:", objc_msgSend(v18, "assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur"));

      v19 = +[AXSettings sharedInstance];
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100008D48;
      v78[3] = &unk_1001AAA68;
      objc_copyWeak(&v79, &location);
      [v19 registerUpdateBlock:v78 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints" withListener:v16];

      objc_destroyWeak(&v79);
      v20 = +[AXSettings sharedInstance];
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100008DC4;
      v76[3] = &unk_1001AAA68;
      objc_copyWeak(&v77, &location);
      [v20 registerUpdateBlock:v76 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter" withListener:v16];

      objc_destroyWeak(&v77);
      v21 = +[AXSettings sharedInstance];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100008E40;
      v74[3] = &unk_1001AAA68;
      objc_copyWeak(&v75, &location);
      [v21 registerUpdateBlock:v74 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur" withListener:v16];

      objc_destroyWeak(&v75);
      objc_destroyWeak(&location);
    }
    [v8 setAllowedTrackingTypes:v12];
    v22 = (AXSSMotionTrackingInputManager *)[objc_alloc((Class)AXSSMotionTrackingInputManager) initWithConfiguration:v8];
    motionTrackingInputManager = v3->_motionTrackingInputManager;
    v3->_motionTrackingInputManager = v22;

    [(AXSSMotionTrackingInputManager *)v3->_motionTrackingInputManager setDelegate:v3];
    if (AXDeviceSupportsOnDeviceEyeTracking())
    {
      v24 = +[AXSettings sharedInstance];
      id v25 = [v24 assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize];

      v3->_shouldSmoothOnDeviceEyeTrackingPoints = (unint64_t)v25 >= kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeMinUserPreference;
      objc_initWeak(&location, v3);
      v26 = +[AXSettings sharedInstance];
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_100008EBC;
      v72[3] = &unk_1001AAA68;
      objc_copyWeak(&v73, &location);
      [v26 registerUpdateBlock:v72 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize" withListener:v3];

      objc_destroyWeak(&v73);
      objc_destroyWeak(&location);
    }
    v27 = [(HNDDeviceManager *)v3 _smoothingBufferSizeForCurrentActiveEyeTracker];
    v28 = v27;
    if (v27)
    {
      id v29 = [v27 unsignedIntegerValue];
      BOOL v30 = (unint64_t)v29 > kAXSAssistiveTouchMotionTrackerSmoothingBufferSizeDefault;
    }
    else
    {
      BOOL v30 = 0;
    }
    v3->_shouldSmoothPoints = v30;
    objc_initWeak(&location, v3);
    v31 = +[AXSettings sharedInstance];
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100009064;
    v69[3] = &unk_1001AAA40;
    objc_copyWeak(&v71, &location);
    v32 = v3;
    v70 = v32;
    [v31 registerUpdateBlock:v69 forRetrieveSelector:"assistiveTouchEyeTrackerCustomizedSettings" withListener:v32];

    objc_destroyWeak(&v71);
    v33 = +[AXSettings sharedInstance];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100009218;
    v66[3] = &unk_1001AAA40;
    objc_copyWeak(&v68, &location);
    v34 = v32;
    v67 = v34;
    [v33 registerUpdateBlock:v66 forRetrieveSelector:"assistiveTouchMotionTrackerSmoothingBufferSize" withListener:v34];

    objc_destroyWeak(&v68);
    v35 = +[AXSettings sharedInstance];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000093CC;
    v64[3] = &unk_1001AAA68;
    objc_copyWeak(&v65, &location);
    [v35 registerUpdateBlock:v64 forRetrieveSelector:"assistiveTouchMotionTrackerSmoothingMaxDelta" withListener:v34];

    objc_destroyWeak(&v65);
    v36 = +[AXSettings sharedInstance];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100009518;
    v62[3] = &unk_1001AAA68;
    objc_copyWeak(&v63, &location);
    [v36 registerUpdateBlock:v62 forRetrieveSelector:"assistiveTouchMotionTrackerXNormalizationOrder" withListener:v34];

    objc_destroyWeak(&v63);
    v37 = +[AXSettings sharedInstance];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100009664;
    v60[3] = &unk_1001AAA68;
    objc_copyWeak(&v61, &location);
    [v37 registerUpdateBlock:v60 forRetrieveSelector:"assistiveTouchMotionTrackerYNormalizationOrder" withListener:v34];

    objc_destroyWeak(&v61);
    v38 = +[AXSettings sharedInstance];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000097B0;
    v58[3] = &unk_1001AAA68;
    objc_copyWeak(&v59, &location);
    [v38 registerUpdateBlock:v58 forRetrieveSelector:"assistiveTouchMotionTrackerXNormalizationOffset" withListener:v34];

    objc_destroyWeak(&v59);
    v39 = +[AXSettings sharedInstance];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000098FC;
    v56[3] = &unk_1001AAA68;
    objc_copyWeak(&v57, &location);
    [v39 registerUpdateBlock:v56 forRetrieveSelector:"assistiveTouchMotionTrackerYNormalizationOffset" withListener:v34];

    objc_destroyWeak(&v57);
    v40 = +[AXSettings sharedInstance];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100009A48;
    v54[3] = &unk_1001AAA68;
    objc_copyWeak(&v55, &location);
    [v40 registerUpdateBlock:v54 forRetrieveSelector:"assistiveTouchMotionTrackerShouldOffsetBufferPoints" withListener:v34];

    objc_destroyWeak(&v55);
    v41 = +[AXSettings sharedInstance];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100009B94;
    v52[3] = &unk_1001AAA68;
    objc_copyWeak(&v53, &location);
    [v41 registerUpdateBlock:v52 forRetrieveSelector:"assistiveTouchForceEyeTrackerExperience" withListener:v34];

    objc_destroyWeak(&v53);
    v42 = +[AXSettings sharedInstance];
    v34->_forceEyeTrackerExperience = [v42 assistiveTouchForceEyeTrackerExperience];

    uint64_t v43 = objc_opt_new();
    pointSmoothers = v34->_pointSmoothers;
    v34->_pointSmoothers = (NSMutableDictionary *)v43;

    if (sub_100041014())
    {
      uint64_t v45 = +[NSMutableSet set];
      connectedPointerDevices = v34->_connectedPointerDevices;
      v34->_connectedPointerDevices = (NSMutableSet *)v45;

      v51 = v34;
      AXPerformBlockAsynchronouslyOnMainThread();
    }
    v47 = objc_alloc_init(HNDDeviceDetector);
    deviceDetector = v34->_deviceDetector;
    v34->_deviceDetector = v47;

    if (AXDeviceSupportsOnDeviceEyeTracking())
    {
      v49 = +[AXSettings sharedInstance];
      -[HNDDeviceManager setShouldShowUncalibratedPoints:](v34, "setShouldShowUncalibratedPoints:", [v49 assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints]);

      [(HNDDeviceManager *)v34 _onDeviceEyeTrackingToggled];
    }
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  [(HNDDeviceManager *)self setDetectDevices:0];
  [(HNDDeviceManager *)self _stopMonitoringEffectiveDeviceOrientation];
  [(BSInvalidatable *)self->_pointerDeviceObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HNDDeviceManager;
  [(HNDDeviceManager *)&v3 dealloc];
}

- (void)setDetectDevices:(BOOL)a3
{
  if (self->_detectDevices != a3)
  {
    self->_detectDevices = a3;
    v4 = [(HNDDeviceManager *)self deviceDetector];
    v5 = v4;
    if (self->_detectDevices)
    {
      [v4 setDelegate:self];
      [v5 setDetectDevices:1];
      if (_AXSAssistiveTouchEnabled())
      {
        if (!_AXSAssistiveTouchScannerEnabled()) {
          [(HNDDeviceManager *)self enableMotionTrackingDevices];
        }
      }
    }
    else
    {
      [v4 setDelegate:0];
      [v5 setDetectDevices:0];
      id v6 = [(NSMutableArray *)self->_devices copy];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "unload", (void)v12);
          }
          id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }

      [(NSMutableArray *)self->_devices removeAllObjects];
      [(HNDDeviceManager *)self disableMotionTrackingDevices];
    }
  }
}

- (void)restartDeviceDetection
{
  BOOL v3 = [(HNDDeviceManager *)self detectDevices];
  [(HNDDeviceManager *)self setDetectDevices:0];

  [(HNDDeviceManager *)self setDetectDevices:v3];
}

- (void)deviceDetector:(id)a3 didFindDevice:(__IOHIDDevice *)a4
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = self->_devices;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v10) containsHIDDevice:a4]) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v11 = +[HNDDevice createNewDevice:a4];
    id v6 = v11;
    if (v11)
    {
      [(NSMutableArray *)v11 setDelegate:self];
      if ([(NSMutableArray *)v6 load])
      {
        long long v12 = ASTLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Adding device: %@", buf, 0xCu);
        }

        [(NSMutableArray *)self->_devices addObject:v6];
        [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
        if (([(NSMutableArray *)v6 wheel] & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          _AXSSetAccessibilityEnabled();
          _AXSApplicationAccessibilitySetEnabled();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (sub_100041014() & 1) == 0)
        {
          long long v13 = +[AXCustomizableMouse mouseForHIDDevice:a4];
          long long v14 = v13;
          if (v13)
          {
            long long v15 = [v13 customActionForButtonNumber:1];

            if (!v15) {
              [v14 setDefaultActionForButtonNumber:1];
            }
            if ([(NSMutableArray *)v6 secondaryButton])
            {
              v16 = [v14 customActionForButtonNumber:2];

              if (!v16) {
                [v14 setDefaultActionForButtonNumber:2];
              }
            }
            if ([(NSMutableArray *)v6 tertiaryButton])
            {
              v17 = [v14 customActionForButtonNumber:3];

              if (!v17) {
                [v14 setDefaultActionForButtonNumber:3];
              }
            }
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000A1A0;
            block[3] = &unk_1001AAA90;
            id v19 = v14;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
    }
  }
}

- (void)deviceDetector:(id)a3 unloadDevicesPassingTest:(id)a4
{
  id v5 = a4;
  devices = self->_devices;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A2FC;
  v11[3] = &unk_1001AAAB8;
  id v7 = v5;
  id v12 = v7;
  id v8 = [(NSMutableArray *)devices indexesOfObjectsPassingTest:v11];
  if ([v8 count])
  {
    uint64_t v9 = ASTLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1001138A8((uint64_t)v8, v9);
    }

    uint64_t v10 = [(NSMutableArray *)self->_devices objectsAtIndexes:v8];
    [v10 makeObjectsPerformSelector:"unload"];
  }
}

- (void)device:(id)a3 didUnload:(BOOL)a4
{
  if (a4)
  {
    [(NSMutableArray *)self->_devices removeObject:a3];
    [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
  }
}

- (void)device:(id)a3 didPostEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ASTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100113920((uint64_t)v6, (uint64_t)v7, v8);
  }

  uint64_t v9 = [(HNDDeviceManager *)self handManager];
  if ([v9 shouldHideSystemPointerForFingersView]) {
    unsigned __int8 v10 = 0;
  }
  else {
    unsigned __int8 v10 = [v9 shouldHandleSystemPointerButtonEvent:v7];
  }
  if (!sub_100041014()
    || (v10 & 1) != 0
    || ([v7 isGamepadEvent] & 1) != 0
    || ([v7 isVirtualTrackpadEvent] & 1) != 0
    || !+[HNDVirtualHIDMouse handleEvent:v7])
  {
    [v9 touchSpeedMultiplier];
    double v12 = v11;
    unsigned int v13 = [v7 type];
    if (v13 - 1 < 2)
    {
      [v9 handleButtonEvent:v7];
    }
    else if (v13 == 4)
    {
      [v7 deltaY];
      [v7 setDeltaY:v22 * 25.0];
      [v7 deltaY];
      self->_scrollAmount = (uint64_t)(v23 + (double)self->_scrollAmount);
      if (([(AXDispatchTimer *)self->_scrollHysteresisTimer isPending] & 1) == 0)
      {
        v24 = [(HNDDeviceManager *)self handManager];
        id v25 = [v24 currentDisplayManager];
        [v25 screenPoint];
        double v27 = v26;
        double v29 = v28;

        v35[0] = 0;
        v35[1] = v35;
        v35[2] = 0x3032000000;
        v35[3] = sub_10000A6C0;
        v35[4] = sub_10000A6D0;
        +[AXUIElement uiApplicationAtCoordinate:](AXUIElement, "uiApplicationAtCoordinate:", v27, v29);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        scrollHysteresisTimer = self->_scrollHysteresisTimer;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10000A6D8;
        v34[3] = &unk_1001AAAE0;
        *(double *)&v34[6] = v27;
        *(double *)&v34[7] = v29;
        v34[4] = self;
        v34[5] = v35;
        [(AXDispatchTimer *)scrollHysteresisTimer afterDelay:v34 processBlock:0.025];
        _Block_object_dispose(v35, 8);
      }
    }
    else if (v13 == 3)
    {
      [v7 deltaX];
      [v7 setDeltaX:v14 * self->_allowedMoveRate];
      [v7 deltaY];
      [v7 setDeltaY:v15 * self->_allowedMoveRate];
      [v7 deltaX];
      [v7 setDeltaX:v12 * v16];
      [v7 deltaY];
      [v7 setDeltaY:v12 * v17];
      if ([(HNDDeviceManager *)self isTrackingInputActive])
      {
        v18 = [(HNDDeviceManager *)self handManager];
        [v7 deltaX];
        double v20 = v19;
        [v7 deltaY];
        objc_msgSend(v18, "mouseEventRecordedWithDelta:", v20, v21);
      }
      if ([v7 isVirtualTrackpadEvent])
      {
        +[HNDVirtualHIDMouse handleEvent:v7];
      }
      else
      {
        [v7 deltaX];
        double v32 = v31;
        [v7 deltaY];
        objc_msgSend(v9, "moveFingerByDelta:", v32, v33);
      }
    }
  }
}

- (int64_t)deviceCountWithSecondaryButtons
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_devices;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "secondaryButton", (void)v9);
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)addDevice:(id)a3
{
  [(NSMutableArray *)self->_devices addObject:a3];

  [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
}

- (void)removeDevice:(id)a3
{
  [(NSMutableArray *)self->_devices removeObject:a3];

  [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
}

- (void)removeAllDevices
{
  [(NSMutableArray *)self->_devices removeAllObjects];

  [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
}

- (void)enableMotionTrackingDevices
{
}

- (void)disableMotionTrackingDevices
{
  [(HNDDeviceManager *)self _stopTrackingMotionInput];
  motionTrackingInputManager = self->_motionTrackingInputManager;

  [(AXSSMotionTrackingInputManager *)motionTrackingInputManager stopMonitoring];
}

- (void)_startTrackingMotionInput:(id)a3
{
  id v4 = a3;
  int64_t v5 = ASTLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[HNDDeviceManager _startTrackingMotionInput:]";
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: input: %@", buf, 0x16u);
  }

  uint64_t v6 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager configuration];
  id v7 = [v6 allowedTrackingTypes];

  id v8 = [v7 count];
  int isOnDeviceEyeTrackingEnabled = v8 != 0;
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    int isOnDeviceEyeTrackingEnabled = (isKindOfClass ^ 1) & (v8 != 0);
    if (((isKindOfClass ^ 1) & 1) == 0)
    {
      if (v8) {
        int isOnDeviceEyeTrackingEnabled = self->_isOnDeviceEyeTrackingEnabled;
      }
    }
  }
  if (!self->_motionTracker && isOnDeviceEyeTrackingEnabled)
  {
    long long v11 = (AXSSMotionTracker *)objc_alloc_init((Class)AXSSMotionTracker);
    motionTracker = self->_motionTracker;
    self->_motionTracker = v11;

    [(AXSSMotionTracker *)self->_motionTracker setDelegate:self];
    if (!v4)
    {
LABEL_24:
      [(AXSSMotionTracker *)self->_motionTracker start];
      [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
      v39 = [v4 name];
      v40 = +[NSString stringWithFormat:@"MotionTrackingInput: %@", v39];
      v41 = +[HNDVirtualHIDMouse addActiveClientWithReason:v40];
      [(HNDDeviceManager *)self setVirtualMouseClientAssertionForActiveMotionTracker:v41];

      [(HNDDeviceManager *)self _startMonitoringEffectiveDeviceOrientation];
      goto LABEL_25;
    }
    id v13 = objc_alloc_init((Class)AXSSMotionTrackingInputConfiguration);
    [v13 setAllowedTrackingTypes:v7];
    id v42 = v4;
    double v14 = +[NSArray arrayWithObjects:&v42 count:1];
    [v13 setOrderedInputPreference:v14];

    [(AXSSMotionTracker *)self->_motionTracker setInputConfiguration:v13];
    if (AXDeviceSupportsOnDeviceEyeTracking() && [v4 trackingType] == (id)3)
    {
      if (!self->_onDeviceEyeTrackingSmoother)
      {
        double v15 = +[AXSettings sharedInstance];
        double v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize]);

        if (v16)
        {
          id v17 = [v16 unsignedIntegerValue];
          BOOL v18 = (unint64_t)v17 >= kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeMinUserPreference;
        }
        else
        {
          BOOL v18 = 0;
        }
        self->_shouldSmoothOnDeviceEyeTrackingPoints = v18;
        v35 = objc_opt_new();
        [v35 setDelegate:self];
        objc_msgSend(v35, "setBufferSize:", objc_msgSend(v16, "unsignedIntegerValue"));
        id v36 = +[AXSettings sharedInstance];
        objc_msgSend(v35, "setUseWeightedMovingAverage:", objc_msgSend(v36, "assistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages"));

        v37 = +[AXSettings sharedInstance];
        objc_msgSend(v35, "setUseMedianFilter:", objc_msgSend(v37, "assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter"));

        v38 = +[AXSettings sharedInstance];
        objc_msgSend(v35, "setUseGaussianBlur:", objc_msgSend(v38, "assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur"));

        onDeviceEyeTrackingSmoother = self->_onDeviceEyeTrackingSmoother;
        self->_onDeviceEyeTrackingSmoother = (AXPIPointSmoother *)v35;
LABEL_22:
      }
    }
    else
    {
      pointSmoothers = self->_pointSmoothers;
      double v20 = [v4 uniqueIdentifier];
      double v21 = [(NSMutableDictionary *)pointSmoothers objectForKeyedSubscript:v20];

      if (!v21)
      {
        double v22 = [(HNDDeviceManager *)self _smoothingBufferSizeForCurrentActiveEyeTracker];
        double v16 = v22;
        BOOL v23 = 0;
        if (!self->_shouldSmoothOnDeviceEyeTrackingPoints && v22)
        {
          id v24 = [v22 unsignedIntegerValue];
          BOOL v23 = (unint64_t)v24 > kAXSAssistiveTouchMotionTrackerSmoothingBufferSizeDefault;
        }
        self->_shouldSmoothPoints = v23;
        onDeviceEyeTrackingSmoother = objc_opt_new();
        [onDeviceEyeTrackingSmoother setDelegate:self];
        double v26 = [(HNDDeviceManager *)self _smoothingBufferSizeForCurrentActiveEyeTracker];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setBufferSize:", objc_msgSend(v26, "unsignedIntegerValue"));

        double v27 = +[AXSettings sharedInstance];
        [v27 assistiveTouchMotionTrackerSmoothingMaxDelta];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setSmoothingMaxDelta:");

        double v28 = +[AXSettings sharedInstance];
        [v28 assistiveTouchMotionTrackerXNormalizationOrder];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setXOrder:");

        double v29 = +[AXSettings sharedInstance];
        [v29 assistiveTouchMotionTrackerYNormalizationOrder];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setYOrder:");

        BOOL v30 = +[AXSettings sharedInstance];
        [v30 assistiveTouchMotionTrackerXNormalizationOffset];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setXOffset:");

        double v31 = +[AXSettings sharedInstance];
        [v31 assistiveTouchMotionTrackerYNormalizationOffset];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setYOffset:");

        double v32 = +[AXSettings sharedInstance];
        objc_msgSend(onDeviceEyeTrackingSmoother, "setShouldOffsetBufferPoints:", objc_msgSend(v32, "assistiveTouchMotionTrackerShouldOffsetBufferPoints"));

        [onDeviceEyeTrackingSmoother setUseWeightedMovingAverage:1];
        double v33 = self->_pointSmoothers;
        v34 = [v4 uniqueIdentifier];
        [(NSMutableDictionary *)v33 setObject:onDeviceEyeTrackingSmoother forKeyedSubscript:v34];

        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
LABEL_25:
}

- (void)_stopTrackingMotionInput
{
  id v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    long long v9 = "-[HNDDeviceManager _stopTrackingMotionInput]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(HNDDeviceManager *)self _resetMotionTrackerErrorAndTimer];
  [(HNDDeviceManager *)self setIsTrackingInputActive:0];
  [(NSMutableDictionary *)self->_pointSmoothers removeAllObjects];
  onDeviceEyeTrackingSmoother = self->_onDeviceEyeTrackingSmoother;
  self->_onDeviceEyeTrackingSmoother = 0;

  [(HNDDeviceManager *)self hidDeviceDidStartConfiguring:0];
  [(HNDDeviceManager *)self setHidDeviceSentReservedStatus:0];
  motionTracker = self->_motionTracker;
  if (motionTracker)
  {
    [(AXSSMotionTracker *)motionTracker stop];
    [(AXSSMotionTracker *)self->_motionTracker invalidate];
    uint64_t v6 = self->_motionTracker;
    self->_motionTracker = 0;

    [(HNDDeviceManager *)self _notifyDisplayManagerDeviceCountChanged];
    [(HNDDeviceManager *)self _stopMonitoringEffectiveDeviceOrientation];
    id v7 = [(HNDDeviceManager *)self virtualMouseClientAssertionForActiveMotionTracker];
    [v7 invalidate];
  }
}

- (void)_startMonitoringEffectiveDeviceOrientation
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = sub_10000B22C;
  long long v9 = &unk_1001AAB08;
  objc_copyWeak(&v10, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.backboardd.orientation", &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, &v6);

  if (v4)
  {
    int64_t v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001139A8(v5);
    }
  }
  [(HNDDeviceManager *)self _checkBackboardEffectiveDeviceOrientation];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_checkBackboardEffectiveDeviceOrientation
{
  if (notify_register_check("com.apple.backboardd.orientation", &dword_1001ED570)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = dword_1001ED570 == -1;
  }
  if (!v3)
  {
    uint64_t state64 = 0;
    notify_get_state(dword_1001ED570, &state64);
    [(HNDDeviceManager *)self setCurrentDeviceOrientation:state64];
    uint32_t v4 = ASTLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int64_t v5 = [(HNDDeviceManager *)self currentDeviceOrientation];
      *(_DWORD *)buf = 134217984;
      int64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Detected device orientation: %ld", buf, 0xCu);
    }
  }
}

- (void)_stopMonitoringEffectiveDeviceOrientation
{
  if (notify_is_valid_token([(HNDDeviceManager *)self notifyToken])) {
    notify_cancel([(HNDDeviceManager *)self notifyToken]);
  }

  [(HNDDeviceManager *)self setNotifyToken:0xFFFFFFFFLL];
}

- (void)setIsTrackingInputActive:(BOOL)a3
{
  if (self->_isTrackingInputActive != a3)
  {
    BOOL v3 = a3;
    int64_t v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1001139EC(v3, v5);
    }

    self->_isTrackingInputActive = v3;
    uint64_t v6 = [(HNDDeviceManager *)self handManager];
    [v6 eyeTrackerIsActivelyTracking:v3];
  }
}

- (id)_smoothingBufferSizeForCurrentActiveEyeTracker
{
  uint64_t v3 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  if (!v3) {
    goto LABEL_5;
  }
  uint32_t v4 = (void *)v3;
  int64_t v5 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  if (![v5 isHIDDevice])
  {
    int64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  id v7 = [v6 trackingType];

  if (v7 != (id)2)
  {
LABEL_5:
    int64_t v8 = 0;
    goto LABEL_8;
  }
  uint32_t v4 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  int64_t v5 = +[AXSettings sharedInstance];
  int64_t v8 = [v5 smoothingBufferSizeForEyeTracker:v4];
LABEL_7:

LABEL_8:

  return v8;
}

- (CGRect)rotatedScreenBounds
{
  v2 = [(HNDDeviceManager *)self handManager];
  uint64_t v3 = [v2 mainDisplayManager];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)motionTrackingInputManager:(id)a3 updatedInputToUse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HNDDeviceManager *)self _stopTrackingMotionInput];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && AXDeviceSupportsOnDeviceEyeTracking())
  {
    double v9 = +[AXSettings sharedInstance];
    unsigned int v10 = [v9 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

    if (v7 && ((isKindOfClass | v10) & 1) != 0)
    {
      if (v10)
      {
        double v11 = [v6 compatibleInputs];
        id v12 = [v11 count];

        if ((unint64_t)v12 >= 2)
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v22 = 0x3032000000;
          BOOL v23 = sub_10000A6C0;
          id v24 = sub_10000A6D0;
          id v25 = 0;
          double v13 = [v6 compatibleInputs];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10000B860;
          v18[3] = &unk_1001AAB30;
          id v7 = v7;
          id v19 = v7;
          p_long long buf = &buf;
          [v13 enumerateObjectsUsingBlock:v18];

          double v14 = *(void **)(*((void *)&buf + 1) + 40);
          if (v14)
          {
            id v15 = v14;

            id v7 = v15;
          }

          _Block_object_dispose(&buf, 8);
        }
      }
      goto LABEL_11;
    }
  }
  else if (((v7 != 0) & isKindOfClass) != 0)
  {
LABEL_11:
    double v16 = ASTLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "MotionTrackingInputManager updatedInputToUse: %@", (uint8_t *)&buf, 0xCu);
    }

    [(HNDDeviceManager *)self _startTrackingMotionInput:v7];
    goto LABEL_17;
  }
  id v17 = ASTLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "MotionTrackingInputManager updatedInputToUse: nil", (uint8_t *)&buf, 2u);
  }

LABEL_17:
}

- (void)motionTracker:(id)a3 updatedState:(id)a4
{
  id v5 = a4;
  if ([v5 hasFace])
  {
    id v6 = [v5 error];
    [(HNDDeviceManager *)self setIsTrackingInputActive:v6 == 0];
  }
  else
  {
    [(HNDDeviceManager *)self setIsTrackingInputActive:0];
  }
  if ([(HNDDeviceManager *)self _shouldProcessState:v5])
  {
    [v5 lookAtPoint];
    -[HNDDeviceManager _motionTrackerInputSourceTrackedFaceAtPoint:](self, "_motionTrackerInputSourceTrackedFaceAtPoint:");
  }
  else
  {
    id v7 = [v5 error];

    if (v7)
    {
      double v8 = [v5 error];
      id v9 = [v8 code];

      motionTrackerError = self->_motionTrackerError;
      if (!motionTrackerError || (id)[(NSError *)motionTrackerError code] != v9)
      {
        double v11 = +[AXAccessQueue mainAccessQueue];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10000BA9C;
        v15[3] = &unk_1001AAA90;
        v15[4] = self;
        [v11 performSynchronousWritingBlock:v15];

        [(HNDDeviceManager *)self _resetMotionTrackerErrorAndTimer];
        id v12 = [v5 error];
        double v13 = (NSError *)[v12 copy];
        double v14 = self->_motionTrackerError;
        self->_motionTrackerError = v13;

        if (v9 == (id)15)
        {
          [(HNDDeviceManager *)self setHidDeviceSentReservedStatus:1];
        }
        else if (v9 == (id)14)
        {
          [(HNDDeviceManager *)self hidDeviceDidStartConfiguring:1];
        }
        else
        {
          [(HNDDeviceManager *)self _motionTrackerInputSourceFailedToTrackFaceWithErrorCode:v9];
        }
      }
    }
  }
}

- (BOOL)_shouldProcessState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 error];
  if (v5
    && (id v6 = (void *)v5, v7 = [v4 hasFace], v6, v7)
    && ([v4 error],
        double v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = -[HNDDeviceManager _isTrackingErrorWithFaceImportant:](self, "_isTrackingErrorWithFaceImportant:", [v8 code]), v8, (v9 & 1) != 0)|| !objc_msgSend(v4, "hasFace"))
  {
    BOOL v12 = 0;
  }
  else if (AXDeviceSupportsOnDeviceEyeTracking() {
         && self->_isOnDeviceEyeTrackingEnabled
  }
         && self->_currentEyeTrackingErrorCode
         && (+[ASTUIGazeEnrollmentManager sharedManager],
             unsigned int v10 = objc_claimAutoreleasedReturnValue(),
             unsigned __int8 v11 = [v10 enrollmentComplete],
             v10,
             (v11 & 1) == 0))
  {
    self->_currentEyeTrackingErrorCode = 0;
    double v14 = [(HNDDeviceManager *)self handManager];
    id v15 = [v14 mainDisplayManager];
    BOOL v12 = 1;
    [v15 setNeedsRecalibration:1];
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_isTrackingErrorWithFaceImportant:(int64_t)a3
{
  return 0;
}

- (void)_motionTrackerInputSourceTrackedFaceAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HNDDeviceManager *)self _resetMotionTrackerErrorAndTimer];
  [(HNDDeviceManager *)self hidDeviceDidStartConfiguring:0];
  [(HNDDeviceManager *)self setHidDeviceSentReservedStatus:0];
  id v6 = [(HNDDeviceManager *)self handManager];
  unsigned int v7 = [v6 mainDisplayManager];
  uint64_t v71 = 0;
  v72 = (CGPoint *)&v71;
  uint64_t v73 = 0x3010000000;
  v74 = &unk_10015DFB5;
  CGFloat v75 = x;
  CGFloat v76 = y;
  BOOL v8 = self->_shouldSmoothPoints && !self->_shouldSmoothOnDeviceEyeTrackingPoints;
  unsigned __int8 v9 = [(HNDDeviceManager *)self onDeviceEyeTrackingQuitCurrentAppTimer];
  [v9 invalidate];

  if (v8)
  {
    unsigned int v10 = +[AXAccessQueue mainAccessQueue];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10000C1EC;
    v66[3] = &unk_1001AAB58;
    void v66[4] = self;
    CGFloat v69 = x;
    CGFloat v70 = y;
    id v67 = v6;
    id v68 = &v71;
    [v10 performSynchronousWritingBlock:v66];
  }
  int v11 = AXDeviceSupportsOnDeviceEyeTracking();
  double v12 = CGPointZero.y;
  double v13 = v12;
  double v14 = CGPointZero.x;
  if (v11)
  {
    double v13 = CGPointZero.y;
    double v14 = CGPointZero.x;
    if (self->_isOnDeviceEyeTrackingEnabled)
    {
      [(HNDDeviceManager *)self _resetCalibrationTimer];
      if (self->_shouldSmoothOnDeviceEyeTrackingPoints)
      {
        id v15 = +[AXAccessQueue mainAccessQueue];
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_10000C2DC;
        v65[3] = &unk_1001AAAE0;
        *(CGFloat *)&v65[6] = x;
        *(CGFloat *)&v65[7] = y;
        v65[4] = self;
        v65[5] = &v71;
        [v15 performSynchronousWritingBlock:v65];
      }
      if ([v7 isShowingCalibrationUI]) {
        self->_lastSeenLookAtPoint = v72[2];
      }
      BOOL shouldShowUncalibratedPoints = self->_shouldShowUncalibratedPoints;
      if (self->_shouldShowUncalibratedPoints) {
        goto LABEL_13;
      }
      if ([(ASTUIGazeEnrollmentManager *)self->_gazeEnrollmentManager enrollmentComplete])
      {
        -[ASTUIGazeEnrollmentManager calibratedGazePointForGazePoint:](self->_gazeEnrollmentManager, "calibratedGazePointForGazePoint:", v72[2].x, v72[2].y);
        double v14 = v17;
        double v13 = v18;
        goto LABEL_18;
      }
      double v13 = v12;
      double v14 = CGPointZero.x;
      if (([v7 isShowingCalibrationUI] & 1) == 0)
      {
        id v19 = [v6 mainDisplayManager];
        unsigned __int8 v20 = [v19 didForceDimissCalibration];

        double v13 = v12;
        double v14 = CGPointZero.x;
        if ((v20 & 1) == 0)
        {
LABEL_13:
          [v7 setNeedsRecalibration:!shouldShowUncalibratedPoints];
          double v13 = v12;
          double v14 = CGPointZero.x;
        }
      }
    }
  }
LABEL_18:
  unsigned int v21 = [v6 shouldIgnoreHIDDeviceMovementWhileMouseActive];
  if (((sub_100041014() ^ 1 | v21) & 1) != 0
    || ([(HNDDeviceManager *)self handManager],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v23 = [v22 dwellControlPaused],
        v22,
        (v23 & 1) != 0))
  {
    if ((v21 & 1) == 0)
    {
      [v6 setLastMoveWasMouse:0];
      objc_msgSend(v6, "moveFingerToPoint:", v72[2].x, v72[2].y);
    }
  }
  else
  {
    id v24 = [v6 systemPointerController];

    if (v24)
    {
      id v25 = [v6 systemPointerController];
      [v25 currentAbsoluteSystemPointerPoint];
    }
    else
    {
      id v25 = [v6 mainDisplayManager];
      [v25 screenPoint];
    }
    objc_msgSend(v7, "convertPointToPortraitUpOrientation:");
    double v27 = v26;
    double v29 = v28;

    if (v14 == CGPointZero.x && v13 == v12) {
      objc_msgSend(v7, "convertPointToPortraitUpOrientation:", v72[2].x, v72[2].y);
    }
    else {
      objc_msgSend(v7, "convertPointToPortraitUpOrientation:", v14, v13);
    }
    double v32 = v30;
    double v33 = v31;
    if (AXDeviceSupportsOnDeviceEyeTracking())
    {
      v34 = +[AXSettings sharedInstance];
      unsigned int v35 = [v34 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

      if (v35)
      {
        double v64 = v27;
        id v36 = [v6 currentDisplayManager];
        [v36 portraitUpScreenBounds];
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;

        v77.origin.CGFloat x = v38;
        v77.origin.CGFloat y = v40;
        v77.size.width = v42;
        v77.size.height = v44;
        double MinX = CGRectGetMinX(v77);
        v78.origin.CGFloat x = v38;
        v78.origin.CGFloat y = v40;
        v78.size.width = v42;
        v78.size.height = v44;
        double v46 = CGRectGetMaxX(v78) + -10.0;
        if (v32 < v46) {
          double v46 = v32;
        }
        if (MinX + 10.0 >= v46) {
          double v32 = MinX + 10.0;
        }
        else {
          double v32 = v46;
        }
        v79.origin.CGFloat x = v38;
        v79.origin.CGFloat y = v40;
        v79.size.width = v42;
        v79.size.height = v44;
        double MinY = CGRectGetMinY(v79);
        v80.origin.CGFloat x = v38;
        v80.origin.CGFloat y = v40;
        v80.size.width = v42;
        v80.size.height = v44;
        double v48 = CGRectGetMaxY(v80) + -10.0;
        if (v33 < v48) {
          double v48 = v33;
        }
        if (MinY + 10.0 >= v48) {
          double v33 = MinY + 10.0;
        }
        else {
          double v33 = v48;
        }
        double v27 = v64;
      }
    }
    -[HNDDeviceManager convertPointToDeviceOrientation:](self, "convertPointToDeviceOrientation:", v32, v33);
    double v50 = v49;
    double v52 = v51;
    -[HNDDeviceManager convertPointToDeviceOrientation:](self, "convertPointToDeviceOrientation:", v27, v29);
    double v54 = v53;
    double v56 = v55;
    id v57 = [(HNDDeviceManager *)self handManager];
    v58 = [v57 mainDisplayManager];
    unsigned int v59 = [v58 isViewZoomed];

    if (v59)
    {
      v60 = [(HNDDeviceManager *)self handManager];
      id v61 = [v60 mainDisplayManager];
      objc_msgSend(v61, "zoomConvertToReplicatedViewFromTargetPoint:", v50, v52);
      double v50 = v62;
      double v52 = v63;
    }
    +[HNDVirtualHIDMouse handleEyeTrackingMovementWithDelta:](HNDVirtualHIDMouse, "handleEyeTrackingMovementWithDelta:", v50 - v54, v52 - v56);
  }
  _Block_object_dispose(&v71, 8);
}

- (CGPoint)convertPointToDeviceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(HNDDeviceManager *)self handManager];
  unsigned int v7 = [v6 currentDisplayManager];
  [v7 portraitUpScreenBounds];
  double v9 = v8;
  double v11 = v10;

  int64_t v12 = [(HNDDeviceManager *)self currentDeviceOrientation];
  double v13 = v11 - y;
  double v14 = v9 - x;
  if (v12 == 2) {
    double v15 = v9 - x;
  }
  else {
    double v15 = x;
  }
  if (v12 == 2) {
    double v16 = v11 - y;
  }
  else {
    double v16 = y;
  }
  if (v12 == 3) {
    double v15 = y;
  }
  else {
    double v14 = v16;
  }
  if (v12 == 4) {
    double v14 = x;
  }
  else {
    double v13 = v15;
  }
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)_processCameraStolenError
{
  id v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&stru_1001AAB98 block:5.0];
  [(HNDDeviceManager *)self setOnDeviceEyeTrackingQuitCurrentAppTimer:v3];
}

- (void)_processAllOtherMotionTrackerErrorsWithErrorCode:(int64_t)a3
{
  if (self->_currentEyeTrackingErrorCode != a3)
  {
    self->_currentEyeTrackingErrorCode = a3;
    [(HNDDeviceManager *)self _resetCalibrationTimer];
  }
  unint64_t v5 = a3 - 2;
  double v6 = 60.0;
  if (a3 == 4) {
    double v6 = 5.0;
  }
  if (v5 >= 2) {
    double v7 = v6;
  }
  else {
    double v7 = 5.0;
  }
  BOOL v8 = v5 >= 2;
  double v9 = [(HNDDeviceManager *)self handManager];
  double v10 = [v9 mainDisplayManager];
  if ([v10 isShowingCalibrationUI])
  {
    unsigned __int8 v11 = [(ASTUIGazeEnrollmentManager *)self->_gazeEnrollmentManager enrollmentComplete];

    if (v11) {
      goto LABEL_12;
    }
    int64_t v12 = [(HNDDeviceManager *)self handManager];
    double v13 = [v12 mainDisplayManager];
    [v13 dismissCalibrationUI];

    double v9 = [(HNDDeviceManager *)self handManager];
    double v10 = [v9 mainDisplayManager];
    [v10 setNeedsRecalibration:v8];
  }

LABEL_12:
  if (!self->_eyeTrackingRecalibrationTimer)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C67C;
    v16[3] = &unk_1001AABC0;
    v16[4] = self;
    BOOL v17 = v8;
    double v14 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v16 block:v7];
    eyeTrackingRecalibrationTimer = self->_eyeTrackingRecalibrationTimer;
    self->_eyeTrackingRecalibrationTimer = v14;
  }
}

- (int64_t)currentEyeTrackingErrorCode
{
  return self->_currentEyeTrackingErrorCode;
}

- (void)_motionTrackerInputSourceFailedToTrackFaceWithErrorCode:(int64_t)a3
{
  if (a3 == 11) {
    double v5 = 5.0;
  }
  else {
    double v5 = 1.0;
  }
  AXSSHumanReadableDescriptionForMotionTrackingErrorCode();
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned __int8 v11 = sub_10000C800;
  int64_t v12 = &unk_1001AABE8;
  double v13 = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v6;
  double v7 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v9 block:v5];
  motionTrackerErrorTimer = self->_motionTrackerErrorTimer;
  self->_motionTrackerErrorTimer = v7;

  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    if (a3 == 7) {
      [(HNDDeviceManager *)self _processCameraStolenError];
    }
    else {
      -[HNDDeviceManager _processAllOtherMotionTrackerErrorsWithErrorCode:](self, "_processAllOtherMotionTrackerErrorsWithErrorCode:", a3, v9, v10, v11, v12, v13);
    }
  }
}

- (void)hidDeviceDidStartConfiguring:(BOOL)a3
{
  if (self->_hidDeviceIsConfiguring != a3)
  {
    self->_hidDeviceIsConfiguring = a3;
    double v5 = [(HNDDeviceManager *)self handManager];
    id v8 = v5;
    if (a3)
    {
      [v5 prepareForHIDDeviceConfiguration];

      [(NSError *)self->_motionTrackerError code];
      AXSSHumanReadableDescriptionForMotionTrackingErrorCode();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [(HNDDeviceManager *)self handManager];
      double v7 = [v6 mainDisplayManager];
      [v7 showBubbleNotificationWithError:v8 duration:5.0];
    }
    else
    {
      [v5 didCompleteHIDDeviceConfiguration];
    }
  }
}

- (void)setHidDeviceSentReservedStatus:(BOOL)a3
{
  if (self->_hidDeviceSentReservedStatus != a3)
  {
    self->_hidDeviceSentReservedStatus = a3;
    id v4 = [(HNDDeviceManager *)self handManager];
    id v5 = v4;
    if (a3) {
      [v4 hideUIForEyeTracker];
    }
    else {
      [v4 showUIForEyeTracker];
    }
  }
}

- (void)_resetMotionTrackerErrorAndTimer
{
  motionTrackerError = self->_motionTrackerError;
  self->_motionTrackerError = 0;

  [(NSTimer *)self->_motionTrackerErrorTimer invalidate];
  motionTrackerErrorTimer = self->_motionTrackerErrorTimer;
  self->_motionTrackerErrorTimer = 0;

  id v6 = [(HNDDeviceManager *)self handManager];
  id v5 = [v6 mainDisplayManager];
  [v5 hideBubbleNotification];
}

- (id)_currentPointSmoother
{
  if (AXDeviceSupportsOnDeviceEyeTracking()
    && ([(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse],
        id v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    id v5 = self->_onDeviceEyeTrackingSmoother;
  }
  else
  {
    id v6 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
    double v7 = [v6 uniqueIdentifier];

    if (v7)
    {
      id v5 = [(NSMutableDictionary *)self->_pointSmoothers objectForKeyedSubscript:v7];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (int64_t)deviceCount
{
  unsigned int v3 = [(HNDDeviceManager *)self mainDeviceIsMotionTrackerWithoutInternalOverride];
  id v4 = (char *)[(NSMutableSet *)self->_connectedPointerDevices count] + v3;
  return (int64_t)[(NSMutableArray *)self->_devices count] + (void)v4;
}

- (BOOL)mainDeviceIsPointer
{
  unsigned int v3 = [(NSMutableArray *)self->_devices indexesOfObjectsPassingTest:&stru_1001AAC28];
  if (-[HNDDeviceManager mainDeviceIsMotionTrackerWithoutInternalOverride](self, "mainDeviceIsMotionTrackerWithoutInternalOverride")|| -[NSMutableSet count](self->_connectedPointerDevices, "count")|| [v3 count]&& (id v6 = -[HNDDeviceManager deviceCount](self, "deviceCount"), v6 == objc_msgSend(v3, "count")))
  {
    unsigned int v4 = ![(HNDDeviceManager *)self shouldDisableMainPointerStatusForUnitTesting];
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)mainDeviceIsMotionTracker
{
  if ([(HNDDeviceManager *)self forceEyeTrackerExperience]) {
    return 1;
  }
  unsigned int v4 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  if (v4) {
    unsigned __int8 v3 = [(AXSSMotionTracker *)self->_motionTracker isTracking];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)mainDeviceIsMotionTrackerWithoutInternalOverride
{
  if (AXDeviceSupportsOnDeviceEyeTracking()
    && [(HNDDeviceManager *)self mainDeviceIsOnDeviceEyeTracker])
  {
    return self->_isOnDeviceEyeTrackingEnabled;
  }
  unsigned int v4 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  if (v4) {
    unsigned __int8 v3 = [(AXSSMotionTracker *)self->_motionTracker isTracking];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)mainDeviceIsOnDeviceEyeTracker
{
  if (!AXDeviceSupportsOnDeviceEyeTracking()) {
    return 0;
  }
  uint64_t v3 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  if (!v3) {
    return 0;
  }
  unsigned int v4 = (void *)v3;
  id v5 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  double v7 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager inputToUse];
  BOOL v8 = [v7 trackingType] == (id)3;

  return v8;
}

- (void)_onDeviceEyeTrackingToggled
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

  if (v4 != [(HNDDeviceManager *)self isOnDeviceEyeTrackingEnabled]
    && AXDeviceSupportsOnDeviceEyeTracking())
  {
    id v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      int v14 = 136315394;
      double v15 = "-[HNDDeviceManager _onDeviceEyeTrackingToggled]";
      __int16 v16 = 2112;
      CFStringRef v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: onDeviceEyeTrackingEnabled: %@", (uint8_t *)&v14, 0x16u);
    }

    [(HNDDeviceManager *)self setIsOnDeviceEyeTrackingEnabled:v4];
    double v7 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager configuration];
    BOOL v8 = [v7 allowedTrackingTypes];
    double v9 = +[NSMutableSet setWithSet:v8];

    if (v4)
    {
      [v9 addObject:&off_1001BBAA8];
      [v9 removeObject:&off_1001BBA78];
    }
    else
    {
      [v9 removeObject:&off_1001BBAA8];
      [v9 addObject:&off_1001BBA78];
    }
    uint64_t v10 = [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager configuration];
    id v11 = [v9 copy];
    [v10 setAllowedTrackingTypes:v11];

    [(AXSSMotionTrackingInputManager *)self->_motionTrackingInputManager setConfiguration:v10];
    motionTrackingInputManager = self->_motionTrackingInputManager;
    double v13 = [(AXSSMotionTrackingInputManager *)motionTrackingInputManager inputToUse];
    [(HNDDeviceManager *)self motionTrackingInputManager:motionTrackingInputManager updatedInputToUse:v13];
  }
}

- (void)_resetCalibrationTimer
{
  [(NSTimer *)self->_eyeTrackingRecalibrationTimer invalidate];
  eyeTrackingRecalibrationTimer = self->_eyeTrackingRecalibrationTimer;
  self->_eyeTrackingRecalibrationTimer = 0;

  self->_hasExceededRecalibrationTimeThreshold = 0;
}

- (void)eyeTrackingRecalibrateFace
{
}

- (void)_notifyDisplayManagerDeviceCountChanged
{
  uint64_t v3 = [(HNDDeviceManager *)self handManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D064;
  v4[3] = &unk_1001AAC50;
  v4[4] = self;
  [v3 enumerateDisplayManagersWithBlock:v4];
}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

- (CGPoint)lastSeenLookAtPoint
{
  double x = self->_lastSeenLookAtPoint.x;
  double y = self->_lastSeenLookAtPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)detectDevices
{
  return self->_detectDevices;
}

- (BOOL)hidDeviceIsConfiguring
{
  return self->_hidDeviceIsConfiguring;
}

- (BOOL)hidDeviceSentReservedStatus
{
  return self->_hidDeviceSentReservedStatus;
}

- (BOOL)isTrackingInputActive
{
  return self->_isTrackingInputActive;
}

- (HNDHandManager)handManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handManager);

  return (HNDHandManager *)WeakRetained;
}

- (void)setHandManager:(id)a3
{
}

- (HNDDeviceDetector)deviceDetector
{
  return self->_deviceDetector;
}

- (void)setDeviceDetector:(id)a3
{
}

- (BOOL)shouldDisableMainPointerStatusForUnitTesting
{
  return self->_shouldDisableMainPointerStatusForUnitTesting;
}

- (void)setShouldDisableMainPointerStatusForUnitTesting:(BOOL)a3
{
  self->_shouldDisableMainPointerStatusForUnitTesting = a3;
}

- (int64_t)currentDeviceOrientation
{
  return self->_currentDeviceOrientation;
}

- (void)setCurrentDeviceOrientation:(int64_t)a3
{
  self->_currentDeviceOrientation = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BSInvalidatable)virtualMouseClientAssertionForActiveMotionTracker
{
  return self->_virtualMouseClientAssertionForActiveMotionTracker;
}

- (void)setVirtualMouseClientAssertionForActiveMotionTracker:(id)a3
{
}

- (BOOL)forceEyeTrackerExperience
{
  return self->_forceEyeTrackerExperience;
}

- (void)setForceEyeTrackerExperience:(BOOL)a3
{
  self->_forceEyeTrackerExperience = a3;
}

- (BOOL)wasSnappedInBubbleMode
{
  return self->_wasSnappedInBubbleMode;
}

- (void)setWasSnappedInBubbleMode:(BOOL)a3
{
  self->_wasSnappedInBubbleMode = a3;
}

- (BOOL)isOnDeviceEyeTrackingEnabled
{
  return self->_isOnDeviceEyeTrackingEnabled;
}

- (void)setIsOnDeviceEyeTrackingEnabled:(BOOL)a3
{
  self->_int isOnDeviceEyeTrackingEnabled = a3;
}

- (BOOL)shouldShowUncalibratedPoints
{
  return self->_shouldShowUncalibratedPoints;
}

- (void)setShouldShowUncalibratedPoints:(BOOL)a3
{
  self->_BOOL shouldShowUncalibratedPoints = a3;
}

- (ASTUIGazeEnrollmentManager)gazeEnrollmentManager
{
  return self->_gazeEnrollmentManager;
}

- (void)setGazeEnrollmentManager:(id)a3
{
}

- (NSTimer)onDeviceEyeTrackingQuitCurrentAppTimer
{
  return self->_onDeviceEyeTrackingQuitCurrentAppTimer;
}

- (void)setOnDeviceEyeTrackingQuitCurrentAppTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDeviceEyeTrackingQuitCurrentAppTimer, 0);
  objc_storeStrong((id *)&self->_gazeEnrollmentManager, 0);
  objc_storeStrong((id *)&self->_virtualMouseClientAssertionForActiveMotionTracker, 0);
  objc_storeStrong((id *)&self->_deviceDetector, 0);
  objc_destroyWeak((id *)&self->_handManager);
  objc_storeStrong((id *)&self->_pointerDeviceObserver, 0);
  objc_storeStrong((id *)&self->_connectedPointerDevices, 0);
  objc_storeStrong((id *)&self->_eyeTrackingRecalibrationTimer, 0);
  objc_storeStrong((id *)&self->_onDeviceEyeTrackingSmoother, 0);
  objc_storeStrong((id *)&self->_pointSmoothers, 0);
  objc_storeStrong((id *)&self->_motionTrackerError, 0);
  objc_storeStrong((id *)&self->_motionTrackerErrorTimer, 0);
  objc_storeStrong((id *)&self->_motionTracker, 0);
  objc_storeStrong((id *)&self->_motionTrackingInputManager, 0);
  objc_storeStrong((id *)&self->_scrollHysteresisTimer, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end
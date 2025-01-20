@interface CAMMotionController
- (BKSAccelerometer)_accelerometer;
- (BOOL)_didNotifyCaptureOrientationWasInvalid;
- (BOOL)forceLandscapeOrientation;
- (CAMLevelViewModel)activeLevelViewModel;
- (CAMMotionController)init;
- (CAMPreviewAlignmentModel)activePreviewAlignmentModel;
- (CMMotionManager)_attitudeAlignmentMotionManager;
- (CMMotionManager)_physicalButtonMotionManager;
- (id)_debugStringForDeviceOrientation:(int64_t)a3;
- (id)_debugStringForInterfaceOrientation:(int64_t)a3;
- (int64_t)_cachedCaptureOrientation;
- (int64_t)_fallbackCaptureOrientation;
- (int64_t)_numberOfDominantPhysicalButtonObservers;
- (int64_t)_orientationIfForcedToLandscape;
- (int64_t)captureOrientation;
- (int64_t)deviceOrientation;
- (int64_t)dominantPhysicalButton;
- (int64_t)panoramaCaptureOrientation;
- (void)_handleApplicationDidEnterBackground:(id)a3;
- (void)_handleApplicationWillEnterForeground:(id)a3;
- (void)_handleLevelMotionUpdate:(id)a3 error:(id)a4;
- (void)_setAccelerometer:(id)a3;
- (void)_setActiveLevelViewModel:(id)a3;
- (void)_setActivePreviewAlignmentModel:(id)a3;
- (void)_setCachedCaptureOrientation:(int64_t)a3;
- (void)_setDidNotifyCaptureOrientationWasInvalid:(BOOL)a3;
- (void)_setDominantPhysicalButton:(int64_t)a3;
- (void)_setNumberOfDominantPhysicalButtonObservers:(int64_t)a3;
- (void)_setOrientationWhenForcedToLandscape:(int64_t)a3;
- (void)_updateAttitudeAlignmentMotionManager;
- (void)_updateInitialOrientation;
- (void)_updatePhysicalButtonObservation;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)beginGeneratingDominantPhysicalButtonNotifications;
- (void)beginUpdatingLevelViewModel:(id)a3;
- (void)beginUpdatingPreviewAlignmentModel:(id)a3;
- (void)dealloc;
- (void)debugValidateCaptureOrientationForMode:(int64_t)a3;
- (void)endGeneratingDominantPhysicalButtonNotifications;
- (void)endUpdatingActiveLevelViewModel;
- (void)endUpdatingPreviewAlignmentModel;
- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setForceLandscapeOrientation:(BOOL)a3;
@end

@implementation CAMMotionController

- (CAMMotionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CAMMotionController;
  v2 = [(CAMMotionController *)&v8 init];
  if (v2)
  {
    v3 = (BKSAccelerometer *)objc_alloc_init(MEMORY[0x263F297E0]);
    accelerometer = v2->__accelerometer;
    v2->__accelerometer = v3;

    [(BKSAccelerometer *)v2->__accelerometer setDelegate:v2];
    [(BKSAccelerometer *)v2->__accelerometer setOrientationEventsEnabled:1];
    [(CAMMotionController *)v2 _updateInitialOrientation];
    v5 = +[CAMPriorityNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    [v5 addObserver:v2 selector:sel__handleApplicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    v6 = v2;
  }
  return v2;
}

- (id)_debugStringForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected:%ld", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_263FA1298[a3];
  }
  return v3;
}

- (int64_t)captureOrientation
{
  int64_t v3 = [(CAMMotionController *)self _cachedCaptureOrientation];
  if ([(CAMMotionController *)self forceLandscapeOrientation])
  {
    return [(CAMMotionController *)self _orientationIfForcedToLandscape];
  }
  else if ((unint64_t)(v3 - 1) >= 4)
  {
    return [(CAMMotionController *)self _fallbackCaptureOrientation];
  }
  else
  {
    return v3;
  }
}

- (int64_t)_cachedCaptureOrientation
{
  return self->__cachedCaptureOrientation;
}

- (int64_t)dominantPhysicalButton
{
  return self->_dominantPhysicalButton;
}

- (void)endUpdatingActiveLevelViewModel
{
  int64_t v3 = [(CAMMotionController *)self activeLevelViewModel];
  if (v3)
  {
    id v5 = v3;
    [v3 unregisterChangeObserver:self context:0];
    v4 = [(CAMMotionController *)self activeLevelViewModel];
    [v4 reset];

    [(CAMMotionController *)self _setActiveLevelViewModel:0];
    [(CAMMotionController *)self _updateAttitudeAlignmentMotionManager];
    int64_t v3 = v5;
  }
}

- (CAMLevelViewModel)activeLevelViewModel
{
  return self->_activeLevelViewModel;
}

- (void)beginGeneratingDominantPhysicalButtonNotifications
{
  [(CAMMotionController *)self _setNumberOfDominantPhysicalButtonObservers:[(CAMMotionController *)self _numberOfDominantPhysicalButtonObservers]+ 1];
  [(CAMMotionController *)self _updatePhysicalButtonObservation];
}

- (int64_t)_numberOfDominantPhysicalButtonObservers
{
  return self->__numberOfDominantPhysicalButtonObservers;
}

- (void)_setNumberOfDominantPhysicalButtonObservers:(int64_t)a3
{
  self->__numberOfDominantPhysicalButtonObservers = a3;
}

- (void)_updatePhysicalButtonObservation
{
  int64_t v3 = [(CAMMotionController *)self _physicalButtonMotionManager];
  v4 = +[CAMUserPreferences preferences];
  if ([v4 isLockAsShutterEnabled]
    && [(CAMMotionController *)self _numberOfDominantPhysicalButtonObservers] >= 1)
  {
    if (![(CMMotionManager *)v3 isDeviceMotionActive])
    {
      if (!v3)
      {
        id v5 = (CMMotionManager *)objc_alloc_init(MEMORY[0x263F01788]);
        physicalButtonMotionManager = self->__physicalButtonMotionManager;
        self->__physicalButtonMotionManager = v5;

        [(CMMotionManager *)self->__physicalButtonMotionManager setDeviceMotionUpdateInterval:0.05];
        [(CMMotionManager *)self->__physicalButtonMotionManager setPowerConservationMode:2];
        int64_t v3 = self->__physicalButtonMotionManager;
      }
      objc_initWeak(&location, self);
      v7 = [MEMORY[0x263F08A48] mainQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __55__CAMMotionController__updatePhysicalButtonObservation__block_invoke;
      v8[3] = &unk_263FA1250;
      objc_copyWeak(&v9, &location);
      [(CMMotionManager *)v3 startDeviceMotionUpdatesToQueue:v7 withHandler:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else if ([(CMMotionManager *)v3 isDeviceMotionActive])
  {
    [(CMMotionManager *)v3 stopDeviceMotionUpdates];
  }
}

- (CMMotionManager)_physicalButtonMotionManager
{
  return self->__physicalButtonMotionManager;
}

- (void)debugValidateCaptureOrientationForMode:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v5 = [(CAMMotionController *)self _cachedCaptureOrientation];
  if ((unint64_t)(v5 - 1) >= 4)
  {
    int64_t v6 = v5;
    int64_t v7 = [(CAMMotionController *)self _fallbackCaptureOrientation];
    objc_super v8 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v9 = [v8 activeInterfaceOrientation];

    if ((unint64_t)a3 <= 9 && ((1 << a3) & 0x251) != 0 && !v6)
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v7];
        v18 = [(CAMMotionController *)self _debugStringForDeviceOrientation:0];
        v19 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v9];
        int v20 = 138543874;
        v21 = v17;
        __int16 v22 = 2114;
        v23 = v18;
        __int16 v24 = 2114;
        v25 = v19;
        _os_log_error_impl(&dword_2099F8000, v14, OS_LOG_TYPE_ERROR, "Capturing with fallback orientation %{public}@ because accelerometer returned %{public}@ (activeInterfaceOrientation is %{public}@).", (uint8_t *)&v20, 0x20u);
      }
      v10 = +[CAMCaptureCapabilities capabilities];
      int v15 = [v10 isInternalInstall];
      BOOL v16 = [(CAMMotionController *)self _didNotifyCaptureOrientationWasInvalid];
      if (v15 && !v16)
      {
        CFPreferencesAppSynchronize(@"com.apple.camera");
        if (!CFPreferencesGetAppBooleanValue(@"CAMDebugSuppressOrientationAlert", @"com.apple.camera", 0))
        {
          dispatch_time(0, 600000000);
          pl_dispatch_after();
        }
        [(CAMMotionController *)self _setDidNotifyCaptureOrientationWasInvalid:1];
      }
    }
    else
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v7];
        v12 = [(CAMMotionController *)self _debugStringForDeviceOrientation:v6];
        v13 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v9];
        int v20 = 138543874;
        v21 = v11;
        __int16 v22 = 2114;
        v23 = v12;
        __int16 v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Capturing with fallback orientation %{public}@ because accelerometer returned %{public}@ (activeInterfaceOrientation is %{public}@).", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t v6 = [(CAMMotionController *)self _cachedCaptureOrientation];
  if ((unint64_t)(a4 - 1) < 4)
  {
    if ((unint64_t)(a4 - 3) <= 1) {
      [(CAMMotionController *)self _setOrientationWhenForcedToLandscape:a4];
    }
LABEL_12:
    [(CAMMotionController *)self setDeviceOrientation:a4];
LABEL_13:
    [(CAMMotionController *)self _setCachedCaptureOrientation:a4];
    return;
  }
  int64_t v7 = v6;
  unint64_t v8 = v6 - 1;
  uint64_t v9 = os_log_create("com.apple.camera", "Camera");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 >= 4)
  {
    if (v10)
    {
      v14 = [(CAMMotionController *)self _debugStringForDeviceOrientation:a4];
      int v15 = [(CAMMotionController *)self _debugStringForDeviceOrientation:v7];
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Received device orientation change from accelerometer as %{public}@ (was %{public}@)", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_12;
  }
  unint64_t v11 = v7 - 5;
  if (v10)
  {
    v12 = [(CAMMotionController *)self _debugStringForDeviceOrientation:a4];
    v13 = [(CAMMotionController *)self _debugStringForDeviceOrientation:v7];
    int v16 = 138543618;
    v17 = v12;
    __int16 v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Received device orientation change from accelerometer as %{public}@ (ignoring and keeping %{public}@)", (uint8_t *)&v16, 0x16u);
  }
  [(CAMMotionController *)self setDeviceOrientation:a4];
  if (v11 <= 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_13;
  }
}

- (void)dealloc
{
  int64_t v3 = [(CAMMotionController *)self _accelerometer];
  [v3 setOrientationEventsEnabled:0];

  v4.receiver = self;
  v4.super_class = (Class)CAMMotionController;
  [(CAMMotionController *)&v4 dealloc];
}

- (void)_updateInitialOrientation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t v3 = [(BKSAccelerometer *)self->__accelerometer currentDeviceOrientation];
  objc_super v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [(CAMMotionController *)self _debugStringForDeviceOrientation:v3];
    int v14 = 138543362;
    int v15 = v5;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Capture orientation %{public}@ (initial)", (uint8_t *)&v14, 0xCu);
  }
  self->__cachedCaptureOrientation = v3;
  self->_deviceOrientation = v3;
  if ((unint64_t)(v3 - 3) <= 1)
  {
    [(CAMMotionController *)self _setOrientationWhenForcedToLandscape:v3];
LABEL_6:
    int64_t v6 = 0;
    goto LABEL_7;
  }
  if ((unint64_t)(v3 - 1) < 4) {
    goto LABEL_6;
  }
  int64_t v7 = [MEMORY[0x263F82438] sharedApplication];
  int64_t v6 = [v7 activeInterfaceOrientation];

  unint64_t v8 = os_log_create("com.apple.camera", "Camera");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      BOOL v10 = [(CAMMotionController *)self _debugStringForDeviceOrientation:v3];
      unint64_t v11 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v6];
      int v14 = 138543618;
      int v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Device orientation from accelerometer is not usable for capture orientation: (%{public}@). Will use activeInterfaceOrientation %{public}@ as fallback.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      v12 = [(CAMMotionController *)self _debugStringForDeviceOrientation:v3];
      v13 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:0];
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Device orientation from accelerometer is not usable for capture orientation (%{public}@) and neither is -[UIApplication activeInterfaceOrientation] (%{public}@). Will use Portrait as fallback.", (uint8_t *)&v14, 0x16u);
    }
    int64_t v6 = 1;
  }
LABEL_7:
  self->__fallbackCaptureOrientation = v6;
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  id v3 = [(CAMMotionController *)self _accelerometer];
  [v3 setOrientationEventsEnabled:0];
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  int64_t v4 = [(CAMMotionController *)self captureOrientation];
  int64_t v5 = [(CAMMotionController *)self deviceOrientation];
  [(CAMMotionController *)self _updateInitialOrientation];
  int64_t v6 = [(CAMMotionController *)self _accelerometer];
  [v6 setOrientationEventsEnabled:1];

  if ([(CAMMotionController *)self captureOrientation] != v4)
  {
    int64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"CAMMotionControllerCaptureOrientationChangedNotification" object:self];
  }
  if ([(CAMMotionController *)self deviceOrientation] != v5)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"CAMMotionControllerCaptureDeviceOrientationChangedNotification" object:self];
  }
}

- (void)_setCachedCaptureOrientation:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->__cachedCaptureOrientation != a3)
  {
    self->__cachedCaptureOrientation = a3;
    int64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v6 = [(CAMMotionController *)self _debugStringForDeviceOrientation:a3];
      int v8 = 138543362;
      BOOL v9 = v6;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Capture orientation %{public}@ (updated)", (uint8_t *)&v8, 0xCu);
    }
    int64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"CAMMotionControllerCaptureOrientationChangedNotification" object:self];
  }
}

- (void)setDeviceOrientation:(int64_t)a3
{
  if (self->_deviceOrientation != a3)
  {
    self->_deviceOrientation = a3;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"CAMMotionControllerCaptureDeviceOrientationChangedNotification" object:self];
  }
}

- (int64_t)panoramaCaptureOrientation
{
  int64_t v2 = [(CAMMotionController *)self captureOrientation];
  return +[CAMOrientationUtilities panoramaCaptureOrientationFromCaptureOrientation:v2];
}

- (void)setForceLandscapeOrientation:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_forceLandscapeOrientation != a3)
  {
    if (a3)
    {
      unint64_t v5 = [(CAMMotionController *)self captureOrientation];
      self->_forceLandscapeOrientation = a3;
      int64_t v6 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v7 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v5];
        int v8 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:[(CAMMotionController *)self _orientationIfForcedToLandscape]];
        int v14 = 138543618;
        int v15 = v7;
        __int16 v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Beginning force landscape orientation, changing orientation from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
      }
      if (v5 <= 2)
      {
        [(CAMMotionController *)self _setOrientationWhenForcedToLandscape:3];
LABEL_10:
        v13 = [MEMORY[0x263F08A00] defaultCenter];
        [v13 postNotificationName:@"CAMMotionControllerCaptureOrientationChangedNotification" object:self];
      }
    }
    else
    {
      self->_forceLandscapeOrientation = 0;
      int64_t v9 = [(CAMMotionController *)self captureOrientation];
      uint64_t v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:[(CAMMotionController *)self _orientationIfForcedToLandscape]];
        v12 = [(CAMMotionController *)self _debugStringForInterfaceOrientation:v9];
        int v14 = 138543618;
        int v15 = v11;
        __int16 v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Ending force landscape orientation, changing orientation from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
      }
      if ([(CAMMotionController *)self _orientationIfForcedToLandscape] != v9) {
        goto LABEL_10;
      }
    }
  }
}

void __55__CAMMotionController__updatePhysicalButtonObservation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v19 = [v3 attitude];
  [v3 rotationRate];
  double v5 = v4;

  [v19 roll];
  double v7 = v6 * 57.2957795;
  [v19 pitch];
  double v9 = fabs(v8 * 57.2957795);
  BOOL v10 = v7 < 115.0;
  if (v7 <= 65.0) {
    BOOL v10 = 0;
  }
  BOOL v11 = v9 <= 35.0 && v7 < 0.0;
  if (v9 > 35.0) {
    BOOL v10 = 0;
  }
  BOOL v12 = v11 || v10;
  if (!v11 && !v10 || v5 <= 1.0)
  {
    if (v11)
    {
      uint64_t v14 = _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantLockButton++;
      _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantVolumeButton = 0;
      if (v14 >= 1)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        __int16 v16 = WeakRetained;
        uint64_t v17 = 3;
LABEL_22:
        [WeakRetained _setDominantPhysicalButton:v17];

        goto LABEL_23;
      }
    }
    else
    {
      _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantLockButton = 0;
      if (v10)
      {
        uint64_t v18 = _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantVolumeButton++;
        if (v18 >= 1)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          __int16 v16 = WeakRetained;
          uint64_t v17 = 2;
          goto LABEL_22;
        }
      }
      else
      {
        _updatePhysicalButtonObservation_numberOfConsecutiveSamplesWantingDominantVolumeButton = 0;
      }
    }
    if (v12) {
      goto LABEL_23;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    __int16 v16 = WeakRetained;
    uint64_t v17 = 0;
    goto LABEL_22;
  }
LABEL_23:
}

- (void)endGeneratingDominantPhysicalButtonNotifications
{
  [(CAMMotionController *)self _setNumberOfDominantPhysicalButtonObservers:[(CAMMotionController *)self _numberOfDominantPhysicalButtonObservers]- 1];
  [(CAMMotionController *)self _updatePhysicalButtonObservation];
}

- (void)_setDominantPhysicalButton:(int64_t)a3
{
  if (self->_dominantPhysicalButton != a3)
  {
    self->_dominantPhysicalButton = a3;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"CAMMotionControllerDominantPhysicalCaptureButtonChangedNotification" object:self];
  }
}

- (void)beginUpdatingLevelViewModel:(id)a3
{
  id v5 = a3;
  id v4 = [(CAMMotionController *)self activeLevelViewModel];
  if (v4 != v5)
  {
    if (v4) {
      [(CAMMotionController *)self endUpdatingActiveLevelViewModel];
    }
    [(CAMMotionController *)self _setActiveLevelViewModel:v5];
    [v5 registerChangeObserver:self context:0];
    [(CAMMotionController *)self _updateAttitudeAlignmentMotionManager];
  }
}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  if (!a5 && (a4 & 8) != 0) {
    [(CAMMotionController *)self _updateAttitudeAlignmentMotionManager];
  }
}

- (void)beginUpdatingPreviewAlignmentModel:(id)a3
{
  id v7 = a3;
  id v4 = [(CAMMotionController *)self activePreviewAlignmentModel];

  id v5 = v7;
  if (v4 != v7)
  {
    double v6 = [(CAMMotionController *)self activePreviewAlignmentModel];

    if (v6) {
      [(CAMMotionController *)self endUpdatingPreviewAlignmentModel];
    }
    [v7 reset];
    [(CAMMotionController *)self _setActivePreviewAlignmentModel:v7];
    [(CAMMotionController *)self _updateAttitudeAlignmentMotionManager];
    id v5 = v7;
  }
}

- (void)endUpdatingPreviewAlignmentModel
{
  id v3 = [(CAMMotionController *)self activePreviewAlignmentModel];

  if (v3)
  {
    [(CAMMotionController *)self _setActivePreviewAlignmentModel:0];
    [(CAMMotionController *)self _updateAttitudeAlignmentMotionManager];
  }
}

- (void)_updateAttitudeAlignmentMotionManager
{
  id v3 = [(CAMMotionController *)self _attitudeAlignmentMotionManager];
  uint64_t v4 = [(CAMMotionController *)self activeLevelViewModel];
  uint64_t v5 = [(CAMMotionController *)self activePreviewAlignmentModel];
  if (!v3 && v4 | v5)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F01788]);
    objc_storeStrong((id *)&self->__attitudeAlignmentMotionManager, v3);
  }
  int v6 = [v3 isDeviceMotionActive];
  if (v4 | v5)
  {
    if ((v6 & 1) == 0)
    {
      objc_initWeak(&location, self);
      id v7 = [MEMORY[0x263F08A48] mainQueue];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      int v15 = __60__CAMMotionController__updateAttitudeAlignmentMotionManager__block_invoke;
      __int16 v16 = &unk_263FA1250;
      objc_copyWeak(&v17, &location);
      [v3 startDeviceMotionUpdatesToQueue:v7 withHandler:&v13];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    if (v5 && v4)
    {
      +[CAMPreviewAlignmentModel desiredUpdateInterval];
      double v9 = v8;
      [(id)v4 desiredUpdateInterval];
      if (v9 >= v10) {
        double v9 = v10;
      }
    }
    else
    {
      if (v5)
      {
        BOOL v11 = CAMPreviewAlignmentModel;
      }
      else
      {
        if (!v4)
        {
          double v9 = 0.0;
          goto LABEL_19;
        }
        BOOL v11 = (__objc2_class *)v4;
      }
      [(__objc2_class *)v11 desiredUpdateInterval];
      double v9 = v12;
    }
  }
  else
  {
    double v9 = 0.0;
    if (v6) {
      [v3 stopDeviceMotionUpdates];
    }
  }
LABEL_19:
  objc_msgSend(v3, "setDeviceMotionUpdateInterval:", v9, v13, v14, v15, v16);
}

void __60__CAMMotionController__updateAttitudeAlignmentMotionManager__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleLevelMotionUpdate:v6 error:v5];
}

- (void)_handleLevelMotionUpdate:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    double v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMMotionController _handleLevelMotionUpdate:error:]((uint64_t)v7, v8);
    }

    double v9 = [(CAMMotionController *)self _attitudeAlignmentMotionManager];
    [v9 stopDeviceMotionUpdates];
  }
  else
  {
    double v10 = [(CAMMotionController *)self activeLevelViewModel];
    objc_msgSend(v10, "applyDeviceMotion:captureOrientation:", v6, -[CAMMotionController captureOrientation](self, "captureOrientation"));

    double v9 = [(CAMMotionController *)self activePreviewAlignmentModel];
    [v9 applyDeviceMotion:v6];
  }
}

- (id)_debugStringForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected:%ld", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_263FA12D0[a3];
  }
  return v3;
}

void __62__CAMMotionController_debugValidateCaptureOrientationForMode___block_invoke()
{
  v0 = [MEMORY[0x263F82438] sharedApplication];
  v1 = [v0 delegate];

  if (objc_opt_respondsToSelector())
  {
    int64_t v2 = [v1 window];
    id v3 = [MEMORY[0x263F82418] alertControllerWithTitle:@"Orientation Error", @"There was a problem detecting the orientation for the photo. Please take a sysdiagnose and file a radar.\n\nTo trigger a sysdiagnose, press Volume Up + Down, and Power button simultaneously.\n\n(This message is internal only)", 1 message preferredStyle];
    uint64_t v4 = (void *)MEMORY[0x263F82400];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__CAMMotionController_debugValidateCaptureOrientationForMode___block_invoke_2;
    v8[3] = &unk_263FA1278;
    id v9 = v3;
    id v5 = v3;
    id v6 = [v4 actionWithTitle:@"OK" style:0 handler:v8];
    [v5 addAction:v6];
    id v7 = [v2 rootViewController];
    [v7 presentViewController:v5 animated:1 completion:0];
  }
}

uint64_t __62__CAMMotionController_debugValidateCaptureOrientationForMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (BOOL)forceLandscapeOrientation
{
  return self->_forceLandscapeOrientation;
}

- (void)_setActiveLevelViewModel:(id)a3
{
}

- (CAMPreviewAlignmentModel)activePreviewAlignmentModel
{
  return self->_activePreviewAlignmentModel;
}

- (void)_setActivePreviewAlignmentModel:(id)a3
{
}

- (int64_t)_fallbackCaptureOrientation
{
  return self->__fallbackCaptureOrientation;
}

- (BOOL)_didNotifyCaptureOrientationWasInvalid
{
  return self->__didNotifyCaptureOrientationWasInvalid;
}

- (void)_setDidNotifyCaptureOrientationWasInvalid:(BOOL)a3
{
  self->__didNotifyCaptureOrientationWasInvalid = a3;
}

- (BKSAccelerometer)_accelerometer
{
  return self->__accelerometer;
}

- (void)_setAccelerometer:(id)a3
{
}

- (CMMotionManager)_attitudeAlignmentMotionManager
{
  return self->__attitudeAlignmentMotionManager;
}

- (int64_t)_orientationIfForcedToLandscape
{
  return self->__orientationIfForcedToLandscape;
}

- (void)_setOrientationWhenForcedToLandscape:(int64_t)a3
{
  self->__orientationIfForcedToLandscape = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__attitudeAlignmentMotionManager, 0);
  objc_storeStrong((id *)&self->__physicalButtonMotionManager, 0);
  objc_storeStrong((id *)&self->__accelerometer, 0);
  objc_storeStrong((id *)&self->_activePreviewAlignmentModel, 0);
  objc_storeStrong((id *)&self->_activeLevelViewModel, 0);
}

- (void)_handleLevelMotionUpdate:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "CMMotionManager encountered an error. Device motion will stop delivery to attitude alignment models. %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
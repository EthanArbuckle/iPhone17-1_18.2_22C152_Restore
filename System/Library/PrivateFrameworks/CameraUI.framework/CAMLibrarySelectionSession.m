@interface CAMLibrarySelectionSession
- (BOOL)_applyAutoResetModeAndNotify:(BOOL)a3;
- (BOOL)_canResetDuringSessionWithResult:(id)a3;
- (BOOL)_canTransitionToAutoOn;
- (BOOL)_shouldResetDuringSessionWithResult:(id)a3;
- (BOOL)_shouldResetSessionBasedOnTimeoutDuringTrip:(BOOL)a3 atSameLocation:(BOOL)a4;
- (BOOL)_userWasPreviouslyOnTrip;
- (BOOL)canResetToDefaultMode;
- (BOOL)notifyResetIfNeeded;
- (BOOL)overriddenByUser;
- (BOOL)restoredFromPreferences;
- (BOOL)updateWithMode:(int64_t)a3;
- (BOOL)updateWithResult:(id)a3;
- (BOOL)userWasPreviouslyOnTrip;
- (CAMLibrarySelectionDelegate)delegate;
- (CAMLibrarySelectionSession)initWithMode:(int64_t)a3;
- (NSDate)launchDate;
- (double)timeForSmartSharingAutoDecision;
- (double)timeForUserManualOverride;
- (double)timeToAcquireFirstLocation;
- (double)timeToAcquireFirstPreciseLocation;
- (double)timeToDetectDevicesInProximity;
- (int64_t)_autoResetMode;
- (int64_t)_defaultMode;
- (int64_t)currentMode;
- (int64_t)initialMode;
- (int64_t)userInteractionsCount;
- (void)setDelegate:(id)a3;
- (void)setLaunchDate:(id)a3;
@end

@implementation CAMLibrarySelectionSession

- (CAMLibrarySelectionSession)initWithMode:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)CAMLibrarySelectionSession;
  v4 = [(CAMLibrarySelectionSession *)&v20 init];
  if (v4)
  {
    v5 = +[CAMUserPreferences preferences];
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    launchDate = v4->_launchDate;
    v4->_launchDate = (NSDate *)v6;

    v4->_int64_t initialMode = a3;
    v4->_currentMode = a3;
    v4->_userInteractionsCount = 0;
    v4->_BOOL restoredFromPreferences = +[CAMUserPreferences hasSharedLibraryAlgorithmsPreferences];
    int64_t initialMode = v4->_initialMode;
    v4->_canResetToDefaultMode = initialMode != [(CAMLibrarySelectionSession *)v4 _defaultMode];
    if (([v5 sharedLibraryAutoBehaviorEnabled] & 1) == 0) {
      v4->_canResetToDefaultMode = 0;
    }
    v4->_overriddenByUser = CAMSharedLibraryModeIsUserState(v4->_currentMode);
    v4->_userWasPreviouslyOnTrip = [(CAMLibrarySelectionSession *)v4 _userWasPreviouslyOnTrip];
    v9 = [v5 sharedLibraryLastLocation];

    if (v4->_canResetToDefaultMode
      && [(CAMLibrarySelectionSession *)v4 _shouldResetSessionBasedOnTimeoutDuringTrip:v4->_userWasPreviouslyOnTrip atSameLocation:v9 != 0])
    {
      [(CAMLibrarySelectionSession *)v4 _applyAutoResetModeAndNotify:0];
    }
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v4->_timeToDetectDevicesInProximity = _Q0;
    *(_OWORD *)&v4->_timeToAcquireFirstPreciseLocation = _Q0;
    v4->_timeForUserManualOverride = -1.0;
    CAMSignpostsSmartSharingAutoDecisionBegin();
    CAMSignpostsUserManualOverrideBegin();
    v15 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CAMSharedLibraryModeDescription(v4->_initialMode);
      v17 = CAMSharedLibraryModeDescription(v4->_currentMode);
      BOOL restoredFromPreferences = v4->_restoredFromPreferences;
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      __int16 v23 = 2114;
      v24 = v17;
      __int16 v25 = 1026;
      BOOL v26 = restoredFromPreferences;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] Session created with initial mode: %{public}@, current mode: %{public}@, restoredFromPreferences: %{public}d", buf, 0x1Cu);
    }
  }
  return v4;
}

- (BOOL)updateWithMode:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t currentMode = self->_currentMode;
  if (currentMode != a3)
  {
    self->_int64_t currentMode = a3;
    self->_canResetToDefaultMode = 0;
    int IsUserState = CAMSharedLibraryModeIsUserState(a3);
    self->_overriddenByUser = IsUserState;
    if (IsUserState)
    {
      ++self->_userInteractionsCount;
      if (self->_timeForUserManualOverride < 0.0)
      {
        [(NSDate *)self->_launchDate timeIntervalSinceNow];
        self->_timeForUserManualOverride = fabs(v7);
        CAMSignpostsUserManualOverrideEnd((uint64_t)self, [(CAMLibrarySelectionSession *)self initialMode], [(CAMLibrarySelectionSession *)self currentMode]);
      }
    }
    if (self->_timeForSmartSharingAutoDecision < 0.0 && CAMSharedLibraryModeIsAutoState(a3))
    {
      [(NSDate *)self->_launchDate timeIntervalSinceNow];
      self->_timeForSmartSharingAutoDecision = fabs(v8);
      CAMSignpostsSmartSharingAutoDecisionEnd((uint64_t)self, [(CAMLibrarySelectionSession *)self initialMode], [(CAMLibrarySelectionSession *)self currentMode]);
    }
    v9 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CAMSharedLibraryModeDescription(a3);
      int v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] setSharedLibraryMode: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    v11 = [(CAMLibrarySelectionSession *)self delegate];
    [v11 librarySelectionDidChangeSharedLibraryMode:a3];
  }
  return currentMode != a3;
}

- (BOOL)updateWithResult:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_timeToAcquireFirstLocation < 0.0)
  {
    uint64_t v6 = [v4 currentLocation];

    if (v6)
    {
      [(NSDate *)self->_launchDate timeIntervalSinceNow];
      self->_timeToAcquireFirstLocation = fabs(v7);
    }
  }
  if (self->_timeToAcquireFirstPreciseLocation < 0.0)
  {
    uint64_t v8 = [v5 currentLocation];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v5 currentLocation];
      [v10 horizontalAccuracy];
      double v12 = v11;

      if (v12 < 50.0)
      {
        [(NSDate *)self->_launchDate timeIntervalSinceNow];
        self->_timeToAcquireFirstPreciseLocation = fabs(v13);
      }
    }
  }
  if (self->_timeToDetectDevicesInProximity < 0.0)
  {
    v14 = [v5 identitiesInProximity];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      [(NSDate *)self->_launchDate timeIntervalSinceNow];
      self->_timeToDetectDevicesInProximity = fabs(v16);
    }
  }
  if ([(CAMLibrarySelectionSession *)self _canTransitionToAutoOn]
    && [v5 suggestsSharing])
  {
    BOOL v17 = [(CAMLibrarySelectionSession *)self updateWithMode:4];
  }
  else
  {
    if (!self->_canResetToDefaultMode) {
      goto LABEL_19;
    }
    if (![(CAMLibrarySelectionSession *)self _canResetDuringSessionWithResult:v5])
    {
      BOOL v18 = 0;
      self->_canResetToDefaultMode = 0;
      goto LABEL_21;
    }
    if (![(CAMLibrarySelectionSession *)self _shouldResetDuringSessionWithResult:v5])
    {
LABEL_19:
      BOOL v18 = 0;
      goto LABEL_21;
    }
    BOOL v17 = [(CAMLibrarySelectionSession *)self _applyAutoResetModeAndNotify:1];
  }
  BOOL v18 = v17;
LABEL_21:

  return v18;
}

- (BOOL)notifyResetIfNeeded
{
  if (self->_initialMode == self->_currentMode && self->_restoredFromPreferences) {
    return 0;
  }
  id v4 = [(CAMLibrarySelectionSession *)self delegate];
  [v4 librarySelectionDidChangeSharedLibraryMode:self->_currentMode];

  return 1;
}

- (BOOL)_applyAutoResetModeAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t currentMode = self->_currentMode;
  if (currentMode < 5)
  {
    int64_t v6 = [(CAMLibrarySelectionSession *)self _autoResetMode];
LABEL_3:
    unint64_t v7 = v6;
    goto LABEL_4;
  }
  if (currentMode == 5)
  {
    int64_t v6 = [(CAMLibrarySelectionSession *)self _defaultMode];
    goto LABEL_3;
  }
  unint64_t v7 = 0;
LABEL_4:
  int64_t v8 = self->_currentMode;
  if (v8 != v7)
  {
    self->_unint64_t currentMode = v7;
    *(_WORD *)&self->_canResetToDefaultMode = 0;
    v9 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CAMSharedLibraryModeDescription(v7);
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 1026;
      BOOL v16 = v3;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] autoResetModeAndNotify: %{public}@, notify: %{public}d", (uint8_t *)&v13, 0x12u);
    }
    if (v3)
    {
      double v11 = [(CAMLibrarySelectionSession *)self delegate];
      [v11 librarySelectionDidChangeSharedLibraryMode:v7];
    }
  }
  return v8 != v7;
}

- (int64_t)_defaultMode
{
  v2 = +[CAMUserPreferences preferences];
  int64_t v3 = [v2 defaultToSharedLibraryEnabled];

  return v3;
}

- (int64_t)_autoResetMode
{
  v2 = +[CAMUserPreferences preferences];
  if ([v2 defaultToSharedLibraryEnabled]) {
    int64_t v3 = 4;
  }
  else {
    int64_t v3 = 5;
  }

  return v3;
}

- (BOOL)_canTransitionToAutoOn
{
  int64_t v3 = +[CAMUserPreferences preferences];
  if ([v3 sharedLibraryAutoBehaviorEnabled])
  {
    unint64_t currentMode = self->_currentMode;
    BOOL v5 = currentMode > 5;
    unsigned int v6 = (0x31u >> currentMode) & 1;
    if (v5) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_canResetDuringSessionWithResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSDate *)self->_launchDate timeIntervalSinceNow];
  if (fabs(v5) > 25.0)
  {
    unsigned int v6 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      launchDate = self->_launchDate;
      int v20 = 138543362;
      v21 = launchDate;
      int64_t v8 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: too long after launch: %{public}@";
      v9 = v6;
      uint32_t v10 = 12;
LABEL_16:
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, v10);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (([v4 cameraHasAccessToLocation] & 1) == 0
    && !CAMLocationAccessPendingOrNotDeterminedWithAuthorizationStatus([v4 locationAuthorizationStatus]))
  {
    unsigned int v6 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      int64_t v8 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no access to location";
      v9 = v6;
      uint32_t v10 = 2;
      goto LABEL_16;
    }
LABEL_25:
    BOOL v18 = 0;
    goto LABEL_26;
  }
  double v11 = +[CAMUserPreferences preferences];
  unsigned int v6 = v11;
  if (self->_overriddenByUser)
  {
    double v12 = [v11 sharedLibraryLastUserActionLocation];

    if (!v12)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        __int16 v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no location of last user action";
        goto LABEL_23;
      }
LABEL_24:

      goto LABEL_25;
    }
    int v13 = [v6 sharedLibraryLastUserActionDate];

    if (!v13)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        __int16 v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no time of last user action";
LABEL_23:
        _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
  }
  else
  {
    BOOL v16 = [v11 sharedLibraryLastDiscoveryLocation];

    if (!v16)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        __int16 v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no location of last discovery";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    uint64_t v17 = [v6 sharedLibraryLastDiscoveryDate];

    if (!v17)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        __int16 v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no time of last discovery";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  BOOL v18 = 1;
LABEL_26:

  return v18;
}

- (BOOL)_userWasPreviouslyOnTrip
{
  v2 = +[CAMUserPreferences preferences];
  if ([v2 sharedLibraryLastLocationAcquiredDuringTrip])
  {
    int64_t v3 = [v2 sharedLibraryLastLocation];
    id v4 = [v3 timestamp];
    [v4 timeIntervalSinceNow];
    double v6 = fabs(v5);

    BOOL v7 = +[CAMCaptureCapabilities capabilities];
    [v7 librarySelectionTripResetTimeout];
    BOOL v9 = v6 <= v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldResetSessionBasedOnTimeoutDuringTrip:(BOOL)a3 atSameLocation:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v7 = +[CAMCaptureCapabilities capabilities];
  double v8 = +[CAMUserPreferences preferences];
  if (v5)
  {
    [v7 librarySelectionTripResetTimeout];
  }
  else if (v4)
  {
    [v7 librarySelectionSameLocationResetTimeout];
  }
  else if (self->_overriddenByUser)
  {
    [v7 librarySelectionUserChoiceResetTimeout];
  }
  else
  {
    [v7 librarySelectionAutoOnResetTimeout];
  }
  double v10 = v9;
  if (self->_overriddenByUser) {
    [v8 sharedLibraryLastUserActionDate];
  }
  else {
  double v11 = [v8 sharedLibraryLastDiscoveryDate];
  }
  double v12 = v11;
  if (!v11)
  {
    BOOL v16 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:](v16);
    }
    goto LABEL_20;
  }
  [v11 timeIntervalSinceNow];
  double v14 = fabs(v13);
  __int16 v15 = os_log_create("com.apple.camera", "SharedLibrary");
  BOOL v16 = v15;
  if (v14 >= v10)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218240;
      double v20 = v14;
      __int16 v21 = 2048;
      double v22 = v10;
      _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] Resetting shared library mode based on timeout: %.0f >= %.0f", (uint8_t *)&v19, 0x16u);
    }
LABEL_20:
    BOOL v17 = 1;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:](v16, v14, v10);
  }
  BOOL v17 = 0;
LABEL_21:

  return v17;
}

- (BOOL)_shouldResetDuringSessionWithResult:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 currentLocation];
  if (v5 && ([v4 isOnTrip] & 1) == 0)
  {
    if (self->_userWasPreviouslyOnTrip
      && [(CAMLibrarySelectionSession *)self _shouldResetSessionBasedOnTimeoutDuringTrip:0 atSameLocation:0])
    {
      BOOL v7 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] Resetting shared library mode during session: user was on a trip last time camera was launched, but came back since we acquired a new location", buf, 2u);
      }
      BOOL v6 = 1;
      goto LABEL_46;
    }
    double v8 = +[CAMUserPreferences preferences];
    BOOL v7 = v8;
    if (self->_overriddenByUser) {
      [v8 sharedLibraryLastUserActionLocation];
    }
    else {
    double v9 = [v8 sharedLibraryLastDiscoveryLocation];
    }
    [v9 coordinate];
    CLLocationCoordinate2D v34 = v40;
    if (!CLLocationCoordinate2DIsValid(v40))
    {
      BOOL v6 = 0;
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
    double v10 = [v4 frequentLocationRegionContainingLocation:v9];
    double v11 = [v4 frequentLocationRegionContainingLocation:v5];
    double v12 = v11;
    if (!v10 && v11)
    {
      double v13 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        double v14 = "[CAMLibrarySelectionSession] Resetting shared library mode during session: user moved to a frequent location";
LABEL_42:
        _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    if (v10)
    {
      if (v11)
      {
        [v11 center];
        if ((objc_msgSend(v10, "containsCoordinate:") & 1) == 0)
        {
          double v13 = os_log_create("com.apple.camera", "SharedLibrary");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            double v14 = "[CAMLibrarySelectionSession] Resetting shared library mode during session: User moved from one frequen"
                  "t location to another";
            goto LABEL_42;
          }
LABEL_43:

          BOOL v6 = 1;
          goto LABEL_44;
        }
      }
    }
    [v5 coordinate];
    objc_msgSend(v5, "horizontalAccuracy", v15, v16, *(void *)&v34.latitude, *(void *)&v34.longitude);
    double v18 = v17;
    CLLocationCoordinate2DGetDistanceFrom();
    double v20 = v19 - v18;
    double v21 = fmax(v19 - v18, 0.0);
    if (self->_overriddenByUser) {
      [v7 sharedLibraryLastUserActionDate];
    }
    else {
    double v22 = [v7 sharedLibraryLastDiscoveryDate];
    }
    uint64_t v23 = [MEMORY[0x263EFF910] date];
    [v23 timeIntervalSinceDate:v22];
    double v25 = v24;

    LODWORD(v23) = [(CAMLibrarySelectionSession *)self _shouldResetSessionBasedOnTimeoutDuringTrip:0 atSameLocation:v21 <= 350.0];
    BOOL v26 = os_log_create("com.apple.camera", "SharedLibrary");
    uint64_t v27 = v26;
    if (v23)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v36 = v21 <= 350.0;
        *(_WORD *)&v36[4] = 2048;
        *(double *)&v36[6] = v21;
        __int16 v37 = 2048;
        double v38 = v25;
        v28 = "[CAMLibrarySelectionSession] Resetting shared library mode during session based on timeout: User considere"
              "d at the same location: %d, distance: %.1f, time: %.0f";
        v29 = v27;
        uint32_t v30 = 28;
LABEL_27:
        _os_log_impl(&dword_2099F8000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      }
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v36 = v21 <= 350.0;
        *(_WORD *)&v36[4] = 2048;
        *(double *)&v36[6] = v21;
        __int16 v37 = 2048;
        double v38 = v25;
        _os_log_debug_impl(&dword_2099F8000, v27, OS_LOG_TYPE_DEBUG, "[CAMLibrarySelectionSession] Keeping shared library mode during session: User considered at the same location: %d, distance: %.1f, time: %.0f", buf, 0x1Cu);
      }

      BOOL v6 = 0;
      if (v21 <= 350.0 || v20 <= 0.0 || v25 <= 0.0) {
        goto LABEL_30;
      }
      double v31 = v21 / v25 * 3.6;
      v32 = os_log_create("com.apple.camera", "SharedLibrary");
      uint64_t v27 = v32;
      if (v31 <= 10.0)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[CAMLibrarySelectionSession _shouldResetDuringSessionWithResult:](v27, v31);
        }
        BOOL v6 = 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v36 = v31;
        v28 = "[CAMLibrarySelectionSession] Resetting shared library mode during session: User moved significantly, compu"
              "ted velocity: %.2f";
        v29 = v27;
        uint32_t v30 = 12;
        goto LABEL_27;
      }
    }
    BOOL v6 = 1;
LABEL_29:

LABEL_30:
LABEL_44:

    goto LABEL_45;
  }
  BOOL v6 = 0;
LABEL_47:

  return v6;
}

- (CAMLibrarySelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMLibrarySelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)initialMode
{
  return self->_initialMode;
}

- (int64_t)currentMode
{
  return self->_currentMode;
}

- (int64_t)userInteractionsCount
{
  return self->_userInteractionsCount;
}

- (BOOL)restoredFromPreferences
{
  return self->_restoredFromPreferences;
}

- (BOOL)canResetToDefaultMode
{
  return self->_canResetToDefaultMode;
}

- (BOOL)overriddenByUser
{
  return self->_overriddenByUser;
}

- (BOOL)userWasPreviouslyOnTrip
{
  return self->_userWasPreviouslyOnTrip;
}

- (double)timeToDetectDevicesInProximity
{
  return self->_timeToDetectDevicesInProximity;
}

- (double)timeToAcquireFirstLocation
{
  return self->_timeToAcquireFirstLocation;
}

- (double)timeToAcquireFirstPreciseLocation
{
  return self->_timeToAcquireFirstPreciseLocation;
}

- (double)timeForSmartSharingAutoDecision
{
  return self->_timeForSmartSharingAutoDecision;
}

- (double)timeForUserManualOverride
{
  return self->_timeForUserManualOverride;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_shouldResetSessionBasedOnTimeoutDuringTrip:(os_log_t)log atSameLocation:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "[CAMLibrarySelectionSession] Resetting shared library mode: couldn't find event date for current mode", v1, 2u);
}

- (void)_shouldResetSessionBasedOnTimeoutDuringTrip:(double)a3 atSameLocation:.cold.2(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "[CAMLibrarySelectionSession] Not resetting shared library mode based on timeout: %.0f >= %.0f", (uint8_t *)&v3, 0x16u);
}

- (void)_shouldResetDuringSessionWithResult:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "[CAMLibrarySelectionSession] shouldResetDuringSessionWithResult computed velocity: %.2f", (uint8_t *)&v2, 0xCu);
}

@end
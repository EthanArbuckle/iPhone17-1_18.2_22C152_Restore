@interface CAMLibrarySelectionController
- (BOOL)_resultQueue_needsLocationShiftingForLocation:(id)a3;
- (BOOL)peopleProximityDetectionSupported;
- (CAMLibrarySelectionController)initWithLocationProvider:(id)a3;
- (CAMLibrarySelectionLocationProvider)locationProvider;
- (CAMLibrarySelectionSession)session;
- (CAMLibrarySelectionSignalResult)acquiredSignalResults;
- (CAMPeopleProximityControllerProtocol)proximityController;
- (CLLocation)_resultQueue_currentLocation;
- (Class)smartSharingMetadataProvider;
- (GEOLocationShifter)_resultQueue_locationShifter;
- (NSArray)identitiesToScan;
- (NSMutableSet)_resultQueue_identitiesInProximity;
- (NSNumber)_resultQueue_needsLocationShifting;
- (OS_dispatch_queue)resultQueue;
- (PHCameraSmartSharingMetadata)_resultQueue_smartSharingMetadata;
- (id)_diagnosticsForLocation:(id)a3 currentLocation:(id)a4;
- (id)_retrieveMetadata;
- (id)librarySelectionDiagnostics;
- (id)ppt_changeHandler;
- (id)tapToRadarAlertController;
- (int)_resultQueue_authorizationStatus;
- (int64_t)sharedLibraryInitialMode;
- (int64_t)sharedLibraryMode;
- (int64_t)userInteractionsCount;
- (void)_ensureProximityController;
- (void)_newSessionWithDelegate:(id)a3;
- (void)_ppt_callChangeHandler;
- (void)_resultQueue_clearAcquiredSignals;
- (void)_resultQueue_currentLocationUpdatedAndShiftedIfNeeded:(id)a3;
- (void)_resultQueue_shiftCoordinatesForLocation:(id)a3;
- (void)_resultQueue_startDiscovery;
- (void)_resultQueue_stopDiscovery;
- (void)_resultQueue_updateAcquiredSignalResults;
- (void)_stopAcquiringSignalsAndClear:(BOOL)a3;
- (void)authorizationStatusUpdated:(int)a3;
- (void)currentLocationUpdated:(id)a3;
- (void)didDiscoverIdentity:(id)a3;
- (void)didLoseIdentity:(id)a3;
- (void)ppt_installChangeHandler:(id)a3;
- (void)setAcquiredSignalResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentitiesToScan:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setPeopleProximityDetectionSupported:(BOOL)a3;
- (void)setPpt_changeHandler:(id)a3;
- (void)setProximityController:(id)a3;
- (void)setResultQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSmartSharingMetadataProvider:(Class)a3;
- (void)set_resultQueue_authorizationStatus:(int)a3;
- (void)set_resultQueue_currentLocation:(id)a3;
- (void)set_resultQueue_identitiesInProximity:(id)a3;
- (void)set_resultQueue_locationShifter:(id)a3;
- (void)set_resultQueue_needsLocationShifting:(id)a3;
- (void)set_resultQueue_smartSharingMetadata:(id)a3;
- (void)startAcquiringSignals;
- (void)startNewSession;
- (void)stopAcquiringSignals;
- (void)stopAndClearAcquiredSignals;
- (void)userDidPickSharedLibraryMode:(int64_t)a3;
@end

@implementation CAMLibrarySelectionController

- (CAMLibrarySelectionController)initWithLocationProvider:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMLibrarySelectionController;
  v6 = [(CAMLibrarySelectionController *)&v16 init];
  if (v6)
  {
    v7 = +[CAMCaptureCapabilities capabilities];
    objc_storeStrong((id *)&v6->_locationProvider, a3);
    uint64_t v8 = objc_opt_class();
    Class smartSharingMetadataProvider = v6->_smartSharingMetadataProvider;
    v6->_Class smartSharingMetadataProvider = (Class)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    resultQueue_identitiesInProximity = v6->__resultQueue_identitiesInProximity;
    v6->__resultQueue_identitiesInProximity = v10;

    v6->__resultQueue_authorizationStatus = -1;
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.camera.library-selection.result-queue", v12);
    resultQueue = v6->_resultQueue;
    v6->_resultQueue = (OS_dispatch_queue *)v13;

    v6->_peopleProximityDetectionSupported = [v7 peopleProximityDetectionSupported];
    [(CAMLibrarySelectionController *)v6 _newSessionWithDelegate:0];
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)sharedLibraryMode
{
  return [(CAMLibrarySelectionSession *)self->_session currentMode];
}

- (int64_t)sharedLibraryInitialMode
{
  return [(CAMLibrarySelectionSession *)self->_session initialMode];
}

- (int64_t)userInteractionsCount
{
  return [(CAMLibrarySelectionSession *)self->_session userInteractionsCount];
}

- (CAMPeopleProximityControllerProtocol)proximityController
{
  [(CAMLibrarySelectionController *)self _ensureProximityController];
  proximityController = self->_proximityController;
  return proximityController;
}

- (void)userDidPickSharedLibraryMode:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = a3 & 0xFFFFFFFFFFFFFFFELL;
  v6 = os_log_create("com.apple.camera", "SharedLibrary");
  v7 = v6;
  if (v5 == 2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"unknown";
      if (a3 == 3) {
        uint64_t v8 = @"UserOff";
      }
      if (a3 == 2) {
        uint64_t v8 = @"UserOn";
      }
      v9 = v8;
      int v18 = 138543362;
      v19 = v9;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] userDidPickSharedLibraryMode: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    v10 = [(CAMLibrarySelectionController *)self session];
    [v10 updateWithMode:a3];

    v11 = [MEMORY[0x263EFF910] date];
    v12 = +[CAMUserPreferences preferences];
    [v12 setSharedLibraryLastUserActionDate:v11];

    dispatch_queue_t v13 = [(CAMLibrarySelectionController *)self acquiredSignalResults];
    v14 = [v13 currentLocation];
    v15 = (void *)[v14 copy];
    objc_super v16 = +[CAMUserPreferences preferences];
    [v16 setSharedLibraryLastUserActionLocation:v15];

    v17 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] User overriden state: stopping signal acquisition.", (uint8_t *)&v18, 2u);
    }

    [(CAMLibrarySelectionController *)self stopAcquiringSignals];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAMLibrarySelectionController userDidPickSharedLibraryMode:](a3, v7);
    }
  }
}

- (void)startNewSession
{
  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] startNewSession", v5, 2u);
  }

  v4 = [(CAMLibrarySelectionSession *)self->_session delegate];
  [(CAMLibrarySelectionController *)self _newSessionWithDelegate:v4];

  [(CAMLibrarySelectionSession *)self->_session notifyResetIfNeeded];
}

- (void)startAcquiringSignals
{
  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] startAcquiringSignals", (uint8_t *)buf, 2u);
  }

  [(CAMLibrarySelectionLocationProvider *)self->_locationProvider addListenerForLocationUpdates:self];
  [(CAMLibrarySelectionController *)self _ensureProximityController];
  objc_initWeak(buf, self);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CAMLibrarySelectionController_startAcquiringSignals__block_invoke;
  block[3] = &unk_263FA0E00;
  objc_copyWeak(&v6, buf);
  dispatch_async(resultQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __54__CAMLibrarySelectionController_startAcquiringSignals__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resultQueue_startDiscovery");
}

- (void)stopAcquiringSignals
{
  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] stopAcquiringSignals", v4, 2u);
  }

  [(CAMLibrarySelectionController *)self _stopAcquiringSignalsAndClear:0];
}

- (void)stopAndClearAcquiredSignals
{
  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] stopAndClearAcquiredSignals", v4, 2u);
  }

  [(CAMLibrarySelectionController *)self _stopAcquiringSignalsAndClear:1];
}

- (void)_stopAcquiringSignalsAndClear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMLibrarySelectionController *)self _ensureProximityController];
  [(CAMLibrarySelectionLocationProvider *)self->_locationProvider removeListenerForLocationUpdates:self];
  objc_initWeak(&location, self);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CAMLibrarySelectionController__stopAcquiringSignalsAndClear___block_invoke;
  block[3] = &unk_263FA1138;
  objc_copyWeak(&v7, &location);
  BOOL v8 = v3;
  dispatch_async(resultQueue, block);
  if (v3) {
    [(CAMLibrarySelectionController *)self setAcquiredSignalResults:0];
  }
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__CAMLibrarySelectionController__stopAcquiringSignalsAndClear___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resultQueue_stopDiscovery");

  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_resultQueue_clearAcquiredSignals");
  }
}

- (CAMLibrarySelectionSignalResult)acquiredSignalResults
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  acquiredSignalResults = self->_acquiredSignalResults;
  return acquiredSignalResults;
}

- (void)didDiscoverIdentity:(id)a3
{
  resultQueue = self->_resultQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(resultQueue);
  [(NSMutableSet *)self->__resultQueue_identitiesInProximity addObject:v5];

  [(CAMLibrarySelectionController *)self _resultQueue_updateAcquiredSignalResults];
  [(CAMLibrarySelectionController *)self _ppt_callChangeHandler];
}

- (void)didLoseIdentity:(id)a3
{
  resultQueue = self->_resultQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(resultQueue);
  [(NSMutableSet *)self->__resultQueue_identitiesInProximity removeObject:v5];

  [(CAMLibrarySelectionController *)self _resultQueue_updateAcquiredSignalResults];
}

- (void)authorizationStatusUpdated:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (self->__resultQueue_authorizationStatus != a3)
  {
    id v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Retrieved authorization status update: %d", (uint8_t *)v7, 8u);
    }

    self->__resultQueue_authorizationStatus = a3;
    if (!CAMCanAccessLocationWithAuthorizationStatus(a3))
    {
      resultQueue_currentLocation = self->__resultQueue_currentLocation;
      self->__resultQueue_currentLocation = 0;
    }
    [(CAMLibrarySelectionController *)self _resultQueue_updateAcquiredSignalResults];
  }
}

- (void)currentLocationUpdated:(id)a3
{
  resultQueue = self->_resultQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(resultQueue);
  if ([(CAMLibrarySelectionController *)self _resultQueue_needsLocationShiftingForLocation:v5])
  {
    [(CAMLibrarySelectionController *)self _resultQueue_shiftCoordinatesForLocation:v5];
  }
  else
  {
    [(CAMLibrarySelectionController *)self _resultQueue_currentLocationUpdatedAndShiftedIfNeeded:v5];
  }
}

- (void)_newSessionWithDelegate:(id)a3
{
  id v9 = a3;
  id v4 = +[CAMUserPreferences preferences];
  id v5 = [v4 captureConfiguration];
  uint64_t v6 = [v5 sharedLibraryMode];

  id v7 = [[CAMLibrarySelectionSession alloc] initWithMode:v6];
  session = self->_session;
  self->_session = v7;

  if (v9) {
    [(CAMLibrarySelectionSession *)self->_session setDelegate:v9];
  }
}

- (void)_ensureProximityController
{
  if (self->_peopleProximityDetectionSupported && !self->_proximityController)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    BOOL v3 = [[CAMPeopleProximityController alloc] initWithDelegate:self delegateQueue:self->_resultQueue];
    proximityController = self->_proximityController;
    self->_proximityController = (CAMPeopleProximityControllerProtocol *)v3;
    MEMORY[0x270F9A758](v3, proximityController);
  }
}

- (void)_resultQueue_startDiscovery
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  BOOL v3 = [(CAMLibrarySelectionController *)self _retrieveMetadata];
  id v4 = os_log_create("com.apple.camera", "SharedLibrary");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138477827;
      v31 = v3;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Retrieved smart sharing metadata: %{private}@", buf, 0xCu);
    }

    [(CAMLibrarySelectionController *)self set_resultQueue_smartSharingMetadata:v3];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [v3 identities];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = +[CAMLibrarySelectionIdentity identityWithPhotosIdentity:*(void *)(*((void *)&v25 + 1) + 8 * v10)];
          [v6 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    v12 = +[CAMCaptureCapabilities capabilities];
    dispatch_queue_t v13 = [v12 peopleProximityDetectAdditionalEmail];
    BOOL v14 = [v13 length] == 0;

    if (!v14)
    {
      v15 = [CAMLibrarySelectionIdentity alloc];
      objc_super v16 = [v12 peopleProximityDetectAdditionalEmail];
      v17 = [(CAMLibrarySelectionIdentity *)v15 initWithPhoneNumber:0 emailAddress:v16 contactIdentifiers:0];

      [v6 addObject:v17];
    }
    int v18 = [(CAMLibrarySelectionController *)self proximityController];
    [v18 startDiscoveryForIdentities:v6];

    objc_initWeak((id *)buf, self);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __60__CAMLibrarySelectionController__resultQueue_startDiscovery__block_invoke;
    v22 = &unk_263FA0868;
    objc_copyWeak(&v24, (id *)buf);
    id v4 = v6;
    v23 = v4;
    dispatch_async(MEMORY[0x263EF83A0], &v19);
    [(CAMLibrarySelectionController *)self _resultQueue_updateAcquiredSignalResults];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Unable to retrieve smart sharing metadata", buf, 2u);
  }
}

void __60__CAMLibrarySelectionController__resultQueue_startDiscovery__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) allObjects];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIdentitiesToScan:v3];
}

- (void)_resultQueue_stopDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  id v3 = [(CAMLibrarySelectionController *)self proximityController];
  [v3 stopDiscovery];
}

- (void)_resultQueue_clearAcquiredSignals
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  [(NSMutableSet *)self->__resultQueue_identitiesInProximity removeAllObjects];
  resultQueue_currentLocation = self->__resultQueue_currentLocation;
  self->__resultQueue_currentLocation = 0;

  resultQueue_needsLocationShifting = self->__resultQueue_needsLocationShifting;
  self->__resultQueue_needsLocationShifting = 0;
}

- (void)_resultQueue_updateAcquiredSignalResults
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  id v3 = [(NSMutableSet *)self->__resultQueue_identitiesInProximity allObjects];
  uint64_t resultQueue_authorizationStatus = self->__resultQueue_authorizationStatus;
  BOOL v5 = self->__resultQueue_currentLocation;
  id v6 = [(CAMLibrarySelectionController *)self _resultQueue_smartSharingMetadata];
  id v7 = [v6 homeLocations];

  uint64_t v8 = [(CAMLibrarySelectionController *)self _resultQueue_smartSharingMetadata];
  uint64_t v9 = [v8 frequentLocations];

  uint64_t v10 = +[CAMLibrarySelectionSignalResult librarySelectionSignalResultWithIdentitiesInProximity:v3 currentLocation:v5 locationAuthorizationStatus:resultQueue_authorizationStatus homeLocations:v7 frequentLocations:v9];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CAMLibrarySelectionController__resultQueue_updateAcquiredSignalResults__block_invoke;
  block[3] = &unk_263FA0868;
  objc_copyWeak(&v14, &location);
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__CAMLibrarySelectionController__resultQueue_updateAcquiredSignalResults__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAcquiredSignalResults:v1];
}

- (void)_resultQueue_currentLocationUpdatedAndShiftedIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  p_resultQueue_currentLocation = &self->__resultQueue_currentLocation;
  resultQueue_currentLocation = self->__resultQueue_currentLocation;
  if (!resultQueue_currentLocation) {
    goto LABEL_9;
  }
  [(CLLocation *)resultQueue_currentLocation coordinate];
  double v9 = v8;
  [v5 coordinate];
  double v11 = v9 - v10;
  if (v11 < 0.0) {
    goto LABEL_9;
  }
  if (v11 > 0.0) {
    goto LABEL_9;
  }
  [(CLLocation *)*p_resultQueue_currentLocation coordinate];
  double v13 = v12;
  [v5 coordinate];
  if (v13 - v14 < 0.0) {
    goto LABEL_9;
  }
  if (v13 - v14 > 0.0) {
    goto LABEL_9;
  }
  [(CLLocation *)*p_resultQueue_currentLocation horizontalAccuracy];
  double v16 = v15;
  [v5 horizontalAccuracy];
  double v18 = v16 - v17;
  if (v18 < 0.0
    || v18 > 0.0
    || ([(CLLocation *)*p_resultQueue_currentLocation timestamp],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        [v19 timeIntervalSinceNow],
        double v21 = v20,
        v19,
        v21 >= 5.0))
  {
LABEL_9:
    v22 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138477827;
      id v24 = v5;
      _os_log_impl(&dword_2099F8000, v22, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Retrieved current location update: %{private}@", (uint8_t *)&v23, 0xCu);
    }

    objc_storeStrong((id *)&self->__resultQueue_currentLocation, a3);
    [(CAMLibrarySelectionController *)self _resultQueue_updateAcquiredSignalResults];
  }
}

- (BOOL)_resultQueue_needsLocationShiftingForLocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  resultQueue_needsLocationShifting = self->__resultQueue_needsLocationShifting;
  if (!resultQueue_needsLocationShifting)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    double v21 = __79__CAMLibrarySelectionController__resultQueue_needsLocationShiftingForLocation___block_invoke;
    v22 = &unk_263FA1160;
    int v23 = self;
    id v24 = v4;
    id v6 = (uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(&v19);
    id v7 = NSNumber;
    uint64_t v12 = v6[2](v6, v8, v9, v10, v11);
    objc_msgSend(v7, "numberWithBool:", v12, v19, v20, v21, v22, v23);
    double v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    double v14 = self->__resultQueue_needsLocationShifting;
    self->__resultQueue_needsLocationShifting = v13;

    double v15 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = self->__resultQueue_needsLocationShifting;
      *(_DWORD *)buf = 138543362;
      long long v26 = v16;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Needs location shifting resolved to: %{public}@", buf, 0xCu);
    }

    resultQueue_needsLocationShifting = self->__resultQueue_needsLocationShifting;
  }
  BOOL v17 = [(NSNumber *)resultQueue_needsLocationShifting BOOLValue];

  return v17;
}

uint64_t __79__CAMLibrarySelectionController__resultQueue_needsLocationShiftingForLocation___block_invoke(uint64_t a1)
{
  v2 = +[CAMCaptureCapabilities capabilities];
  int v3 = [v2 librarySelectionMockLocationShiftingEnabled];

  if (v3)
  {
    id v4 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] librarySelectionMockLocationShiftingEnabled: YES", buf, 2u);
    }

    return 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && ([*(id *)(*(void *)(a1 + 32) + 48) locationShiftingRequired] & 1) != 0)
  }
  {
    [*(id *)(a1 + 40) coordinate];
    double v7 = v6;
    [*(id *)(a1 + 40) coordinate];
    uint64_t v8 = (void *)MEMORY[0x263F417D8];
    return [v8 isLocationShiftRequiredForCoordinate:v7];
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] locationShiftingRequiredFromCache: NO", v10, 2u);
    }

    return 0;
  }
}

- (void)_resultQueue_shiftCoordinatesForLocation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (!self->__resultQueue_locationShifter)
  {
    id v5 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x263F417D8]);
    resultQueue_locationShifter = self->__resultQueue_locationShifter;
    self->__resultQueue_locationShifter = v5;
  }
  [v4 coordinate];
  double v8 = v7;
  [v4 coordinate];
  double v10 = v9;
  objc_initWeak(&location, self);
  uint64_t v11 = self->__resultQueue_locationShifter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke;
  v13[3] = &unk_263FA1188;
  id v12 = v4;
  id v14 = v12;
  objc_copyWeak(&v15, &location);
  -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v11, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v13, 0, &__block_literal_global_6, self->_resultQueue, v8, v10, 0.0);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(a2, a3);
  id v7 = objc_alloc(MEMORY[0x263F00A50]);
  [*(id *)(a1 + 32) altitude];
  double v9 = v8;
  [*(id *)(a1 + 32) verticalAccuracy];
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) timestamp];
  double v13 = objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v6.latitude, v6.longitude, v9, a4, v11);

  id v14 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138477827;
    BOOL v17 = v13;
    _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Successfully shifted current location update: %{private}@", (uint8_t *)&v16, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resultQueue_currentLocationUpdatedAndShiftedIfNeeded:", v13);
}

void __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke_235(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke_235_cold_1((uint64_t)v2, v3);
  }
}

- (void)setAcquiredSignalResults:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_storeStrong((id *)&self->_acquiredSignalResults, a3);
  if (v5)
  {
    int v6 = [v5 suggestsSharing];
    [(CAMLibrarySelectionSession *)self->_session updateWithResult:v5];
    if (v6)
    {
      id v7 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Acquired signal results are inferring sharing: stopping signal acquisition.", v14, 2u);
      }

      [(CAMLibrarySelectionController *)self stopAcquiringSignals];
    }
    double v8 = +[CAMUserPreferences preferences];
    if (v6)
    {
      double v9 = [MEMORY[0x263EFF910] date];
      [v8 setSharedLibraryLastDiscoveryDate:v9];
    }
    if ([v5 cameraHasAccessToLocation])
    {
      double v10 = [v5 currentLocation];
      double v11 = v10;
      if (v10)
      {
        id v12 = (void *)[v10 copy];
        [v8 setSharedLibraryLastLocation:v12];

        objc_msgSend(v8, "setSharedLibraryLastLocationAcquiredDuringTrip:", objc_msgSend(v5, "isOnTrip"));
        if (v6)
        {
          double v13 = (void *)[v11 copy];
          [v8 setSharedLibraryLastDiscoveryLocation:v13];
        }
      }
    }
    else if (!CAMLocationAccessPendingOrNotDeterminedWithAuthorizationStatus([v5 locationAuthorizationStatus]))
    {
      [v8 setSharedLibraryLastLocation:0];
      [v8 setSharedLibraryLastUserActionLocation:0];
      [v8 setSharedLibraryLastDiscoveryLocation:0];
      [v8 setSharedLibraryLastLocationAcquiredDuringTrip:0];
    }
  }
}

- (id)_retrieveMetadata
{
  v19[1] = *MEMORY[0x263EF8340];
  int v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 librarySelectionMockAutomationModeEnabled];

  if (v4)
  {
    id v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v17 = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] mockAutomationMode is enabled, providing mock PHCameraSmartSharingMetadata", v17, 2u);
    }

    int v6 = (void *)[objc_alloc(MEMORY[0x263F14D98]) initWithPhoneNumber:0 emailAddress:@"mockAutomationMode@example.com" contactIdentifiers:0];
    id v7 = objc_alloc(MEMORY[0x263F00A28]);
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(1.0, 2.0);
    double v9 = objc_msgSend(v7, "initWithCenter:radius:identifier:", @"mockAutomationModeHome", v8.latitude, v8.longitude, 3.0);
    double v10 = +[CAMCaptureCapabilities capabilities];
    uint64_t v11 = [v10 librarySelectionMockLocationShiftingEnabled];

    id v12 = objc_alloc(MEMORY[0x263F14DA0]);
    v19[0] = v6;
    double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    uint64_t v18 = v9;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    id v15 = (void *)[v12 initWithLibraryScopeIdentifier:@"mockAutomationModeLibraryScopeIdentifier" identities:v13 homeLocations:v14 frequentLocations:0 locationShiftingRequired:v11];
  }
  else
  {
    int v6 = [(CAMLibrarySelectionController *)self smartSharingMetadataProvider];
    id v15 = [v6 retrieveMetadataForPhotoLibrary:0];
  }

  return v15;
}

- (void)ppt_installChangeHandler:(id)a3
{
  [(CAMLibrarySelectionController *)self setPpt_changeHandler:a3];
  [(CAMLibrarySelectionController *)self _ppt_callChangeHandler];
}

- (void)_ppt_callChangeHandler
{
  int v3 = [(CAMLibrarySelectionController *)self ppt_changeHandler];
  int v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__CAMLibrarySelectionController__ppt_callChangeHandler__block_invoke;
    v5[3] = &unk_263FA0C08;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __55__CAMLibrarySelectionController__ppt_callChangeHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
}

- (NSMutableSet)_resultQueue_identitiesInProximity
{
  return self->__resultQueue_identitiesInProximity;
}

- (void)set_resultQueue_identitiesInProximity:(id)a3
{
}

- (CLLocation)_resultQueue_currentLocation
{
  return self->__resultQueue_currentLocation;
}

- (void)set_resultQueue_currentLocation:(id)a3
{
}

- (int)_resultQueue_authorizationStatus
{
  return self->__resultQueue_authorizationStatus;
}

- (void)set_resultQueue_authorizationStatus:(int)a3
{
  self->__uint64_t resultQueue_authorizationStatus = a3;
}

- (PHCameraSmartSharingMetadata)_resultQueue_smartSharingMetadata
{
  return self->__resultQueue_smartSharingMetadata;
}

- (void)set_resultQueue_smartSharingMetadata:(id)a3
{
}

- (NSNumber)_resultQueue_needsLocationShifting
{
  return self->__resultQueue_needsLocationShifting;
}

- (void)set_resultQueue_needsLocationShifting:(id)a3
{
}

- (GEOLocationShifter)_resultQueue_locationShifter
{
  return self->__resultQueue_locationShifter;
}

- (void)set_resultQueue_locationShifter:(id)a3
{
}

- (CAMLibrarySelectionLocationProvider)locationProvider
{
  return self->_locationProvider;
}

- (void)setLocationProvider:(id)a3
{
}

- (BOOL)peopleProximityDetectionSupported
{
  return self->_peopleProximityDetectionSupported;
}

- (void)setPeopleProximityDetectionSupported:(BOOL)a3
{
  self->_peopleProximityDetectionSupported = a3;
}

- (id)ppt_changeHandler
{
  return self->_ppt_changeHandler;
}

- (void)setPpt_changeHandler:(id)a3
{
}

- (void)setProximityController:(id)a3
{
}

- (Class)smartSharingMetadataProvider
{
  return self->_smartSharingMetadataProvider;
}

- (void)setSmartSharingMetadataProvider:(Class)a3
{
}

- (CAMLibrarySelectionSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSArray)identitiesToScan
{
  return self->_identitiesToScan;
}

- (void)setIdentitiesToScan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identitiesToScan, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_smartSharingMetadataProvider, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong(&self->_ppt_changeHandler, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
  objc_storeStrong((id *)&self->__resultQueue_locationShifter, 0);
  objc_storeStrong((id *)&self->__resultQueue_needsLocationShifting, 0);
  objc_storeStrong((id *)&self->__resultQueue_smartSharingMetadata, 0);
  objc_storeStrong((id *)&self->__resultQueue_currentLocation, 0);
  objc_storeStrong((id *)&self->__resultQueue_identitiesInProximity, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_acquiredSignalResults, 0);
}

- (id)librarySelectionDiagnostics
{
  v95[9] = *MEMORY[0x263EF8340];
  id v83 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v81 = [(CAMLibrarySelectionController *)self acquiredSignalResults];
  int v3 = [v81 resultDiagnostics];
  [v83 setObject:v3 forKeyedSubscript:@"acquiredSignalResults"];

  int v4 = +[CAMCaptureCapabilities capabilities];
  v94[0] = @"librarySelectionSupported";
  v78 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "librarySelectionSupported"));
  v95[0] = v78;
  v94[1] = @"librarySelectionAutoOnResetTimeout";
  id v5 = NSNumber;
  [v4 librarySelectionAutoOnResetTimeout];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v95[1] = v6;
  v94[2] = @"librarySelectionUserChoiceResetTimeout";
  id v7 = NSNumber;
  [v4 librarySelectionUserChoiceResetTimeout];
  CLLocationCoordinate2D v8 = objc_msgSend(v7, "numberWithDouble:");
  v95[2] = v8;
  v94[3] = @"librarySelectionTripResetTimeout";
  double v9 = NSNumber;
  [v4 librarySelectionTripResetTimeout];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  v95[3] = v10;
  v94[4] = @"librarySelectionSameLocationResetTimeout";
  uint64_t v11 = NSNumber;
  [v4 librarySelectionSameLocationResetTimeout];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  v95[4] = v12;
  v94[5] = @"deviceProximityDetectionSupported";
  double v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "peopleProximityDetectionSupported"));
  v95[5] = v13;
  v94[6] = @"deviceProximityPersistenceSupported";
  id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "peopleProximityPersistenceSupported"));
  v95[6] = v14;
  v94[7] = @"deviceProximityUsesDeviceDiscovery";
  id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "peopleProximityUsesDeviceDiscovery"));
  v95[7] = v15;
  v94[8] = @"deviceProximityDetectAdditionalEmail";
  v80 = v4;
  int v16 = [v4 peopleProximityDetectAdditionalEmail];
  uint64_t v17 = [v16 length];
  uint64_t v18 = @"yes";
  if (!v17) {
    uint64_t v18 = @"no";
  }
  v95[8] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:9];
  [v83 setObject:v19 forKeyedSubscript:@"capabilitiesDiagnostics"];

  uint64_t v20 = +[CAMUserPreferences preferences];
  v92[0] = @"sharedLibraryEnabled";
  double v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "sharedLibraryEnabled"));
  v93[0] = v21;
  v92[1] = @"sharedLibrarySwitchEnabled";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "sharedLibrarySwitchEnabled"));
  v93[1] = v22;
  v92[2] = @"sharedLibraryAutoBehaviorEnabled";
  int v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "sharedLibraryAutoBehaviorEnabled"));
  v93[2] = v23;
  v92[3] = @"defaultToSharedLibraryEnabled";
  id v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "defaultToSharedLibraryEnabled"));
  v93[3] = v24;
  v92[4] = @"shareWhenAtHomeEnabled";
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "shareWhenAtHomeEnabled"));
  v93[4] = v25;
  long long v26 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:5];
  [v83 setObject:v26 forKeyedSubscript:@"preferencesDiagnostics"];

  uint64_t v27 = [(CAMLibrarySelectionController *)self acquiredSignalResults];
  long long v28 = [v27 currentLocation];
  v29 = v28;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    id v30 = [v20 sharedLibraryLastLocation];
  }
  id v31 = v30;

  v90[0] = @"sharedLibraryLastLocation";
  v77 = [v20 sharedLibraryLastLocation];
  v76 = [(CAMLibrarySelectionController *)self _diagnosticsForLocation:v77 currentLocation:v31];
  v91[0] = v76;
  v90[1] = @"sharedLibraryLastLocationAcquiredDuringTrip";
  v75 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "sharedLibraryLastLocationAcquiredDuringTrip"));
  v91[1] = v75;
  v90[2] = @"sharedLibraryLastDiscoveryDate";
  v74 = [v20 sharedLibraryLastDiscoveryDate];
  uint64_t v32 = [v74 description];
  v33 = (void *)v32;
  if (v32) {
    v34 = (__CFString *)v32;
  }
  else {
    v34 = @"none";
  }
  v91[2] = v34;
  v90[3] = @"sharedLibraryLastDiscoveryTimeInterval";
  v35 = NSNumber;
  v73 = [v20 sharedLibraryLastDiscoveryDate];
  [v73 timeIntervalSinceNow];
  v72 = objc_msgSend(v35, "numberWithDouble:");
  v91[3] = v72;
  v90[4] = @"sharedLibraryLastDiscoveryLocation";
  v71 = [v20 sharedLibraryLastDiscoveryLocation];
  id v36 = v31;
  v79 = v31;
  v37 = [(CAMLibrarySelectionController *)self _diagnosticsForLocation:v71 currentLocation:v31];
  v91[4] = v37;
  v90[5] = @"sharedLibraryLastUserActionDate";
  v38 = [v20 sharedLibraryLastUserActionDate];
  uint64_t v39 = [v38 description];
  v40 = (void *)v39;
  if (v39) {
    v41 = (__CFString *)v39;
  }
  else {
    v41 = @"none";
  }
  v91[5] = v41;
  v90[6] = @"sharedLibraryLastUserActionTimeInterval";
  v42 = NSNumber;
  v43 = [v20 sharedLibraryLastUserActionDate];
  [v43 timeIntervalSinceNow];
  v44 = objc_msgSend(v42, "numberWithDouble:");
  v91[6] = v44;
  v90[7] = @"sharedLibraryLastUserActionLocation";
  v45 = [v20 sharedLibraryLastUserActionLocation];
  v46 = [(CAMLibrarySelectionController *)self _diagnosticsForLocation:v45 currentLocation:v36];
  v91[7] = v46;
  v47 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:8];
  [v83 setObject:v47 forKeyedSubscript:@"preferencesAlgorithmsDiagnostics"];

  v48 = [(CAMLibrarySelectionController *)self session];
  v89[0] = &unk_26BDDE460;
  v88[0] = @"algorithmVersion";
  v88[1] = @"initialMode";
  v49 = CAMSharedLibraryModeDescription([v48 initialMode]);
  v89[1] = v49;
  v88[2] = @"currentMode";
  v50 = CAMSharedLibraryModeDescription([v48 currentMode]);
  v89[2] = v50;
  v88[3] = @"overriddenByUser";
  v51 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v48, "overriddenByUser"));
  v89[3] = v51;
  v88[4] = @"userWasPreviouslyOnTrip";
  v52 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v48, "userWasPreviouslyOnTrip"));
  v89[4] = v52;
  v88[5] = @"canResetToDefaultMode";
  v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v48, "canResetToDefaultMode"));
  v89[5] = v53;
  v54 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:6];
  [v83 setObject:v54 forKeyedSubscript:@"sessionDiagnostics"];

  v86[0] = @"timeToDetectDevicesInProximity";
  v55 = NSNumber;
  [v48 timeToDetectDevicesInProximity];
  v56 = objc_msgSend(v55, "numberWithDouble:");
  v87[0] = v56;
  v86[1] = @"timeToAcquireFirstLocation";
  v57 = NSNumber;
  [v48 timeToAcquireFirstLocation];
  v58 = objc_msgSend(v57, "numberWithDouble:");
  v87[1] = v58;
  v86[2] = @"timeToAcquireFirstPreciseLocation";
  v59 = NSNumber;
  [v48 timeToAcquireFirstPreciseLocation];
  v60 = objc_msgSend(v59, "numberWithDouble:");
  v87[2] = v60;
  v86[3] = @"timeForSmartSharingAutoDecision";
  v61 = NSNumber;
  [v48 timeForSmartSharingAutoDecision];
  v62 = objc_msgSend(v61, "numberWithDouble:");
  v87[3] = v62;
  v86[4] = @"timeForUserManualOverride";
  v63 = NSNumber;
  [v48 timeForUserManualOverride];
  v64 = objc_msgSend(v63, "numberWithDouble:");
  v87[4] = v64;
  v65 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:5];
  [v83 setObject:v65 forKeyedSubscript:@"sessionPerformance"];

  v84 = @"countOfIdentities";
  v66 = NSNumber;
  v67 = [(CAMLibrarySelectionController *)self identitiesToScan];
  v68 = objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
  v85 = v68;
  v69 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  [v83 setObject:v69 forKeyedSubscript:@"scannerDiagnostics"];

  return v83;
}

- (id)_diagnosticsForLocation:(id)a3 currentLocation:(id)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      [v6 distanceFromLocation:v5];
      double v9 = v8;
    }
    else
    {
      double v9 = *MEMORY[0x263F009F8];
    }
    v17[0] = @"coordinateIsValid";
    uint64_t v11 = NSNumber;
    [v5 coordinate];
    id v12 = [v11 numberWithBool:CLLocationCoordinate2DIsValid(v20)];
    v18[0] = v12;
    v17[1] = @"distanceFromCurrentLocation";
    double v13 = [NSNumber numberWithDouble:v9];
    v18[1] = v13;
    v17[2] = @"horizontalAccuracy";
    id v14 = NSNumber;
    [v5 horizontalAccuracy];
    id v15 = objc_msgSend(v14, "numberWithDouble:");
    v18[2] = v15;
    double v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  }
  else
  {
    double v10 = &unk_26BDDF858;
  }

  return v10;
}

- (id)tapToRadarAlertController
{
  v40[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v4 = [(CAMLibrarySelectionController *)self sharedLibraryMode];
  unint64_t v5 = v4;
  if (v4 > 5) {
    id v6 = 0;
  }
  else {
    id v6 = off_263FA39D8[v4];
  }
  if (CAMSharedLibraryModeIsOn(v4))
  {
    [v3 addObject:@"I am not near a participant"];
    id v7 = @"I am not interested to share in this context";
    double v8 = @"I am at home and do not want to share";
  }
  else
  {
    id v7 = @"I am at home and would like to share";
    double v8 = @"I am near a participant";
  }
  [v3 addObject:v8];
  [v3 addObject:v7];
  double v9 = @"I am in a context interesting to share";
  if (v5 && v5 != 3)
  {
    if (v5 != 5) {
      goto LABEL_12;
    }
    double v9 = @"I am in a context still interesting to share";
  }
  [v3 addObject:v9];
LABEL_12:
  long long v28 = [NSString stringWithFormat:@"[Goldilocks] [Live-on Feedback] Unexpected state while '%@'", v6];
  uint64_t v25 = [(CAMLibrarySelectionController *)self librarySelectionDiagnostics];
  uint64_t v10 = +[CAMTapToRadarUtilities writeDictionary:toPlistFileWithName:](CAMTapToRadarUtilities, "writeDictionary:toPlistFileWithName:");
  long long v26 = self;
  id v24 = (void *)v10;
  if (v10)
  {
    v40[0] = v10;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v6, @"If you expect to be in another mode, please select an option below to file a radar:", 1 message preferredStyle];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x263F82400];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke;
        v31[3] = &unk_263FA39B8;
        id v32 = v28;
        uint64_t v33 = v17;
        id v34 = v27;
        uint64_t v19 = [v18 actionWithTitle:v17 style:0 handler:v31];
        [v11 addAction:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v14);
  }

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_2;
  v30[3] = &unk_263FA1278;
  v30[4] = v26;
  CLLocationCoordinate2D v20 = [MEMORY[0x263F82400] actionWithTitle:@"Reset to default (personal)" style:2 handler:v30];
  [v11 addAction:v20];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_3;
  v29[3] = &unk_263FA1278;
  v29[4] = v26;
  double v21 = [MEMORY[0x263F82400] actionWithTitle:@"Reset and rescan" style:2 handler:v29];
  [v11 addAction:v21];

  v22 = [MEMORY[0x263F82400] actionWithTitle:@"Cancel" style:1 handler:0];
  [v11 addAction:v22];

  return v11;
}

void __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke(void *a1)
{
  id v3 = [NSString stringWithFormat:@"%@\n\nReason:\n%@\n\nDetails:\n...", a1[4], a1[5]];
  BYTE2(v2) = 0;
  LOWORD(v2) = 257;
  +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:](CAMTapToRadarUtilities, "fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:", a1[4], v3, @"Other Bug", @"Not Applicable", @"1393606", @"Photos Shared Library Algorithms", @"all", @"1510028", a1[6], v2);
}

uint64_t __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_2(uint64_t a1)
{
  +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences];
  uint64_t v2 = +[CAMUserPreferences preferences];
  [v2 _resetSharedLibraryAlgorithmsPreferences];

  id v3 = *(void **)(a1 + 32);
  return [v3 startNewSession];
}

uint64_t __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_3(uint64_t a1)
{
  +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences];
  uint64_t v2 = +[CAMUserPreferences preferences];
  [v2 _resetSharedLibraryAlgorithmsPreferences];

  [*(id *)(a1 + 32) stopAndClearAcquiredSignals];
  [*(id *)(a1 + 32) startNewSession];
  id v3 = *(void **)(a1 + 32);
  return [v3 startAcquiringSignals];
}

- (void)userDidPickSharedLibraryMode:(unint64_t)a1 .cold.1(unint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 > 5) {
    uint64_t v2 = @"unknown";
  }
  else {
    uint64_t v2 = off_263FA11C8[a1];
  }
  int v3 = 138543362;
  unint64_t v4 = v2;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "[CAMLibrarySelectionController] userDidPickSharedLibraryMode invalid mode: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke_235_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "[CAMLibrarySelectionController] Failed to shift coordinate with error: %{public}@. Ignoring location update.", (uint8_t *)&v2, 0xCu);
}

@end
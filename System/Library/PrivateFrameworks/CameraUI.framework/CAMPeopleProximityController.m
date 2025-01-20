@interface CAMPeopleProximityController
- (BOOL)peopleProximityScanner:(id)a3 shouldDiscoverIdentity:(id)a4;
- (BOOL)queue_hasDiscoveredFirstPerson;
- (BOOL)queue_hasDiscoveredFirstPersonNearby;
- (CAMPeopleProximityController)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (CAMPeopleProximityDelegate)delegate;
- (CAMPeopleProximityScanner)queue_proximityScanner;
- (CNContactStore)queue_contactStore;
- (Class)proximityScannerClass;
- (NSSet)queue_identities;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (unint64_t)queue_discoveryState;
- (void)_queue_handleFinishedWaitingForScanner:(id)a3;
- (void)_queue_handleScannerDidStop;
- (void)_queue_startDiscoveryForIdentities:(id)a3;
- (void)_queue_stopDiscovery;
- (void)peopleProximityScanner:(id)a3 didDiscoverIdentity:(id)a4 distance:(unint64_t)a5 rssi:(int64_t)a6;
- (void)peopleProximityScanner:(id)a3 didLoseIdentity:(id)a4;
- (void)peopleProximityScannerDidStopDiscovery:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setProximityScannerClass:(Class)a3;
- (void)setQueue:(id)a3;
- (void)setQueue_contactStore:(id)a3;
- (void)setQueue_discoveryState:(unint64_t)a3;
- (void)setQueue_hasDiscoveredFirstPerson:(BOOL)a3;
- (void)setQueue_hasDiscoveredFirstPersonNearby:(BOOL)a3;
- (void)setQueue_identities:(id)a3;
- (void)setQueue_proximityScanner:(id)a3;
- (void)startDiscoveryForIdentities:(id)a3;
- (void)stopDiscovery;
@end

@implementation CAMPeopleProximityController

- (CAMPeopleProximityController)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CAMPeopleProximityController;
  v8 = [(CAMPeopleProximityController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.camera.people-proximity.acquisition-queue", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;
  }
  return v9;
}

- (void)startDiscoveryForIdentities:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CAMPeopleProximityController_startDiscoveryForIdentities___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __60__CAMPeopleProximityController_startDiscoveryForIdentities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startDiscoveryForIdentities:", *(void *)(a1 + 40));
}

- (void)stopDiscovery
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CAMPeopleProximityController_stopDiscovery__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__CAMPeopleProximityController_stopDiscovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopDiscovery");
}

- (Class)proximityScannerClass
{
  proximityScannerClass = self->_proximityScannerClass;
  if (!proximityScannerClass)
  {
    v3 = +[CAMCaptureCapabilities capabilities];
    [v3 peopleProximityUsesDeviceDiscovery];

    proximityScannerClass = objc_opt_class();
  }
  return (Class)proximityScannerClass;
}

- (void)_queue_startDiscoveryForIdentities:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = +[CAMCaptureCapabilities capabilities];
  if (([v5 peopleProximityDetectionSupported] & 1) == 0)
  {
    v14 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CAMPeopleProximityController _queue_startDiscoveryForIdentities:](v14);
    }
    goto LABEL_28;
  }
  id v6 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v6)
  {
    uint64_t v7 = [(CAMPeopleProximityController *)self queue_identities];
    if ((id)v7 == v4)
    {

      goto LABEL_29;
    }
    id v8 = (void *)v7;
    v9 = [(CAMPeopleProximityController *)self queue_identities];
    char v10 = [v9 isEqualToSet:v4];

    if (v10) {
      goto LABEL_29;
    }
    v11 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] filter contactIDs changed, restarting.", (uint8_t *)&v32, 2u);
    }

    [(CAMPeopleProximityController *)self stopDiscovery];
  }
  unint64_t v12 = [(CAMPeopleProximityController *)self queue_discoveryState];
  if (v12)
  {
    if (v12 != 2) {
      goto LABEL_29;
    }
    uint64_t v13 = 3;
  }
  else
  {
    uint64_t v13 = 1;
  }
  [(CAMPeopleProximityController *)self setQueue_discoveryState:v13];
  if ([v4 count])
  {
    [(CAMPeopleProximityController *)self setQueue_identities:v4];
    id v15 = objc_alloc([(CAMPeopleProximityController *)self proximityScannerClass]);
    v16 = [(CAMPeopleProximityController *)self queue];
    v17 = (void *)[v15 initWithQueue:v16 delegate:self];
    [(CAMPeopleProximityController *)self setQueue_proximityScanner:v17];

    unint64_t v18 = [(CAMPeopleProximityController *)self queue_discoveryState];
    if (v18 == 1)
    {
      [(CAMPeopleProximityController *)self setQueue_hasDiscoveredFirstPerson:0];
      [(CAMPeopleProximityController *)self setQueue_hasDiscoveredFirstPersonNearby:0];
      v19 = [(CAMPeopleProximityController *)self queue_proximityScanner];
      CAMSignpostsDiscoverPersonBegin();

      v20 = [(CAMPeopleProximityController *)self queue_proximityScanner];
      CAMSignpostsDiscoverPersonNearbyBegin();

      uint64_t v21 = [v5 peopleProximityInitialScanRate];
      [v5 peopleProximityInitialScanDuration];
    }
    else
    {
      uint64_t v21 = [v5 peopleProximitySubsequentScanRate];
      [v5 peopleProximitySubsequentScanDuration];
    }
    double v24 = v22;
    v25 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (v18 == 1) {
        v26 = @"YES";
      }
      else {
        v26 = @"NO";
      }
      uint64_t v27 = [v4 count];
      v28 = [v4 allObjects];
      v29 = [v28 componentsJoinedByString:@", "];
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      int v32 = 138544643;
      v33 = v26;
      __int16 v34 = 2048;
      uint64_t v35 = v21;
      __int16 v36 = 2048;
      double v37 = v24;
      __int16 v38 = 2048;
      uint64_t v39 = v27;
      __int16 v40 = 2113;
      v41 = v29;
      __int16 v42 = 2114;
      v43 = v31;
      _os_log_impl(&dword_2099F8000, v25, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] People discovery start initialScan:%{public}@ scanRate:%lu timeout:%.0fs, scanning for %ld identities:[%{private}@] with %{public}@", (uint8_t *)&v32, 0x3Eu);
    }
    v14 = [(CAMPeopleProximityController *)self queue_proximityScanner];
    [v14 startDiscoveryWithScanRate:v21 timeout:v24];
LABEL_28:

    goto LABEL_29;
  }
  v23 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] No identities to scan for, cannot start device discovery", (uint8_t *)&v32, 2u);
  }

  [(CAMPeopleProximityController *)self setQueue_discoveryState:0];
LABEL_29:
}

- (void)_queue_stopDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CAMPeopleProximityController *)self setQueue_discoveryState:0];
  v3 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v3)
  {
    id v4 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Person discovery stop", v7, 2u);
    }

    v5 = [(CAMPeopleProximityController *)self queue_proximityScanner];
    if (v5)
    {
      [(CAMPeopleProximityController *)self setQueue_proximityScanner:0];
      id v6 = [(CAMPeopleProximityController *)self queue_proximityScanner];
      [v6 stopDiscovery];
    }
  }
}

- (void)_queue_handleScannerDidStop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = +[CAMCaptureCapabilities capabilities];
  unint64_t v4 = [(CAMPeopleProximityController *)self queue_discoveryState];
  if (v4 == 1)
  {
LABEL_4:
    [(CAMPeopleProximityController *)self setQueue_discoveryState:2];
    [v3 peopleProximityScanWaitInterval];
    double v6 = v5;
    uint64_t v7 = [(CAMPeopleProximityController *)self queue_proximityScanner];
    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v9 = [(CAMPeopleProximityController *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CAMPeopleProximityController__queue_handleScannerDidStop__block_invoke;
    block[3] = &unk_263FA0868;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    id v10 = v7;
    dispatch_after(v8, v9, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  if (v4 == 3)
  {
    if (([v3 peopleProximityScanIndefinitely] & 1) == 0)
    {
      [(CAMPeopleProximityController *)self setQueue_discoveryState:0];
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:
}

void __59__CAMPeopleProximityController__queue_handleScannerDidStop__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_handleFinishedWaitingForScanner:", *(void *)(a1 + 32));
}

- (void)_queue_handleFinishedWaitingForScanner:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v5 == v4 && [(CAMPeopleProximityController *)self queue_discoveryState] == 2)
  {
    double v6 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Finished waiting for scanner, restarting:%{public}@", (uint8_t *)&v8, 0xCu);
    }

    [(CAMPeopleProximityController *)self setQueue_proximityScanner:0];
    uint64_t v7 = [(CAMPeopleProximityController *)self queue_identities];
    [(CAMPeopleProximityController *)self _queue_startDiscoveryForIdentities:v7];
  }
}

- (void)setQueue_discoveryState:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_queue_discoveryState != a3)
  {
    self->_queue_discoveryState = a3;
    id v4 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 >= 4)
      {
        double v6 = [NSNumber numberWithUnsignedInteger:a3];
        id v5 = [v6 description];
      }
      else
      {
        id v5 = off_263FA0888[a3];
      }
      int v7 = 138543362;
      int v8 = v5;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] setDiscoveryState: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)peopleProximityScanner:(id)a3 shouldDiscoverIdentity:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v8 != v6)
  {
LABEL_17:
    BOOL v17 = 0;
    goto LABEL_18;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(CAMPeopleProximityController *)self queue_identities];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        if (CAMLibrarySelectionIdentityMatch(*(void **)(*((void *)&v20 + 1) + 8 * i), v7))
        {
          char v14 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  char v14 = 0;
LABEL_12:

  id v15 = +[CAMCaptureCapabilities capabilities];
  char v16 = [v15 librarySelectionMockAutomationModeEnabled];

  BOOL v17 = 1;
  if ((v14 & 1) == 0 && (v16 & 1) == 0)
  {
    unint64_t v18 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[CAMPeopleProximityController peopleProximityScanner:shouldDiscoverIdentity:]((uint64_t)v7, v18);
    }

    goto LABEL_17;
  }
LABEL_18:

  return v17;
}

- (void)peopleProximityScanner:(id)a3 didDiscoverIdentity:(id)a4 distance:(unint64_t)a5 rssi:(int64_t)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v12 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v12 != v10) {
    goto LABEL_22;
  }
  id v13 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((uint64_t)a5 > 19)
    {
      if (a5 == 20)
      {
        char v14 = @"Near";
        goto LABEL_11;
      }
      if (a5 == 30)
      {
        char v14 = @"Far";
        goto LABEL_11;
      }
    }
    else if (a5 == 10)
    {
      char v14 = @"Immediate";
LABEL_11:
      *(_DWORD *)buf = 138478339;
      id v22 = v11;
      __int16 v23 = 2114;
      double v24 = v14;
      __int16 v25 = 2048;
      int64_t v26 = a6;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Found %{private}@, distance: %{public}@, rssi:%ld", buf, 0x20u);
      goto LABEL_12;
    }
    char v14 = @"Unknown";
    goto LABEL_11;
  }
LABEL_12:

  if (![(CAMPeopleProximityController *)self queue_hasDiscoveredFirstPerson])
  {
    CAMSignpostsDiscoverPersonEnd((uint64_t)v10, a5, a6);
    [(CAMPeopleProximityController *)self setQueue_hasDiscoveredFirstPerson:1];
  }
  if (a5 == 20 || a5 == 10)
  {
    if (![(CAMPeopleProximityController *)self queue_hasDiscoveredFirstPersonNearby])
    {
      CAMSignpostsDiscoverPersonNearbyEnd((uint64_t)v10, a5, a6);
      [(CAMPeopleProximityController *)self setQueue_hasDiscoveredFirstPersonNearby:1];
    }
  }
  else
  {
    id v15 = +[CAMCaptureCapabilities capabilities];
    int v16 = [v15 peopleProximityIgnoreNearbyRequirements];

    if (!v16) {
      goto LABEL_22;
    }
  }
  BOOL v17 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v22 = v11;
    _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Found identity: %{private}@", buf, 0xCu);
  }

  delegateQueue = self->_delegateQueue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __89__CAMPeopleProximityController_peopleProximityScanner_didDiscoverIdentity_distance_rssi___block_invoke;
  v19[3] = &unk_263FA0408;
  v19[4] = self;
  id v20 = v11;
  dispatch_sync(delegateQueue, v19);

LABEL_22:
}

void __89__CAMPeopleProximityController_peopleProximityScanner_didDiscoverIdentity_distance_rssi___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDiscoverIdentity:*(void *)(a1 + 40)];
}

- (void)peopleProximityScanner:(id)a3 didLoseIdentity:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v9 == v8)
  {
    id v10 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = v6;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Lost: %{private}@", buf, 0xCu);
    }

    delegateQueue = self->_delegateQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__CAMPeopleProximityController_peopleProximityScanner_didLoseIdentity___block_invoke;
    v12[3] = &unk_263FA0408;
    v12[4] = self;
    id v13 = v6;
    dispatch_sync(delegateQueue, v12);
  }
}

void __71__CAMPeopleProximityController_peopleProximityScanner_didLoseIdentity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didLoseIdentity:*(void *)(a1 + 40)];
}

- (void)peopleProximityScannerDidStopDiscovery:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(CAMPeopleProximityController *)self queue_proximityScanner];

  if (v6 == v5)
  {
    [(CAMPeopleProximityController *)self _queue_handleScannerDidStop];
  }
}

- (void)setProximityScannerClass:(Class)a3
{
}

- (CAMPeopleProximityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPeopleProximityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)queue_discoveryState
{
  return self->_queue_discoveryState;
}

- (NSSet)queue_identities
{
  return self->_queue_identities;
}

- (void)setQueue_identities:(id)a3
{
}

- (CNContactStore)queue_contactStore
{
  return self->_queue_contactStore;
}

- (void)setQueue_contactStore:(id)a3
{
}

- (BOOL)queue_hasDiscoveredFirstPerson
{
  return self->_queue_hasDiscoveredFirstPerson;
}

- (void)setQueue_hasDiscoveredFirstPerson:(BOOL)a3
{
  self->_queue_hasDiscoveredFirstPerson = a3;
}

- (BOOL)queue_hasDiscoveredFirstPersonNearby
{
  return self->_queue_hasDiscoveredFirstPersonNearby;
}

- (void)setQueue_hasDiscoveredFirstPersonNearby:(BOOL)a3
{
  self->_queue_hasDiscoveredFirstPersonNearby = a3;
}

- (CAMPeopleProximityScanner)queue_proximityScanner
{
  return self->_queue_proximityScanner;
}

- (void)setQueue_proximityScanner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_proximityScanner, 0);
  objc_storeStrong((id *)&self->_queue_contactStore, 0);
  objc_storeStrong((id *)&self->_queue_identities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proximityScannerClass, 0);
}

- (void)_queue_startDiscoveryForIdentities:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "[CAMPeopleProximityController] Not starting, device proximity not supported", v1, 2u);
}

- (void)peopleProximityScanner:(uint64_t)a1 shouldDiscoverIdentity:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "[CAMPeopleProximityController] Ignoring identity %{private}@, not part of allow-list.", (uint8_t *)&v2, 0xCu);
}

@end
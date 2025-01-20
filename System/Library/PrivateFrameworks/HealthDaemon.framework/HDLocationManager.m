@interface HDLocationManager
- (HDLocationManager)init;
- (HDLocationManagerUnitTestDelegate)unitTestDelegate;
- (id)_mainQueue_newLocationManagerWithEffectiveBundlePath:(id)a3;
- (id)_unitTest_locationManager;
- (id)takeLocationUpdatingAssertionForOwnerIdentifier:(id)a3 desiredAccuracy:(double)a4;
- (void)_mainQueue_releaseLocationUpdatingAssertion;
- (void)_mainQueue_takeLocationUpdatingAssertionWithAccuracy:(double)a3;
- (void)_mainQueue_updateLocationManager;
- (void)_unitTest_didInvalidateAssertion:(id)a3;
- (void)_unitTest_didTakeAssertion:(id)a3;
- (void)_unitTest_setLocationManagerConfiguration:(id)a3;
- (void)addObserver:(id)a3;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestWhenInUseAuthorization;
- (void)setLocationManagerConfiguration:(void *)a1;
- (void)setUnitTestDelegate:(id)a3;
@end

@implementation HDLocationManager

- (HDLocationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HDLocationManager;
  v2 = [(HDLocationManager *)&v9 init];
  if (v2)
  {
    v3 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v3;

    [(HDAssertionManager *)v2->_assertionManager addObserver:v2 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierLocationUpdating" queue:MEMORY[0x1E4F14428]];
    id v5 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v6 = [v5 initWithName:@"health-location-manager-observers" loggingCategory:*MEMORY[0x1E4F29FB8]];
    observers = v2->_observers;
    v2->_observers = (HKObserverSet *)v6;

    -[HDLocationManager setLocationManagerConfiguration:](v2, 0);
  }
  return v2;
}

- (void)setLocationManagerConfiguration:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = _Block_copy(v3);
      uint64_t v6 = (void *)a1[5];
      a1[5] = v5;
    }
    else
    {
      objc_initWeak(&location, a1);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__HDLocationManager_setLocationManagerConfiguration___block_invoke;
      v9[3] = &unk_1E62F5AB0;
      objc_copyWeak(&v10, &location);
      v7 = _Block_copy(v9);
      v8 = (void *)a1[5];
      a1[5] = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)dealloc
{
  [(HDAssertionManager *)self->_assertionManager removeObserver:self];
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  [(CLInUseAssertion *)self->_inUseAssertion invalidate];
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)HDLocationManager;
  [(HDLocationManager *)&v5 dealloc];
}

- (void)requestWhenInUseAuthorization
{
}

- (id)takeLocationUpdatingAssertionForOwnerIdentifier:(id)a3 desiredAccuracy:(double)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F65CC8];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierLocationUpdating" ownerIdentifier:v7];

  if ([(HDAssertionManager *)self->_assertionManager takeAssertion:v8])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HDLocationManager_takeLocationUpdatingAssertionForOwnerIdentifier_desiredAccuracy___block_invoke;
    block[3] = &unk_1E62F4978;
    block[4] = self;
    double v14 = a4;
    id v9 = v8;
    id v13 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __85__HDLocationManager_takeLocationUpdatingAssertionForOwnerIdentifier_desiredAccuracy___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_takeLocationUpdatingAssertionWithAccuracy:", *(double *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_unitTest_didTakeAssertion:", v3);
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_super v5 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierLocationUpdating"];
  uint64_t v6 = [v5 count];

  if (!v6) {
    [(HDLocationManager *)self _mainQueue_releaseLocationUpdatingAssertion];
  }
  [(HDLocationManager *)self _mainQueue_updateLocationManager];
  [(HDLocationManager *)self _unitTest_didInvalidateAssertion:v7];
}

id __53__HDLocationManager_setLocationManagerConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_mainQueue_newLocationManagerWithEffectiveBundlePath:", @"/System/Library/LocationBundles/AppleWatchWorkout.bundle");

  return v2;
}

- (id)_mainQueue_newLocationManagerWithEffectiveBundlePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundlePath:v4 delegate:self onQueue:v5];

  [v6 setActivityType:3];

  return v6;
}

- (void)_mainQueue_updateLocationManager
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierLocationUpdating"];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(HKObserverSet *)self->_observers count];
  locationManager = self->_locationManager;
  if (v4 | v5)
  {
    if (!locationManager)
    {
      (*((void (**)(void))self->_locationManagerConfiguration + 2))();
      v8 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
      id v9 = self->_locationManager;
      self->_locationManager = v8;

      id v10 = self->_locationManager;
      [(CLLocationManager *)v10 setDelegate:self];
    }
  }
  else
  {
    [(CLLocationManager *)locationManager setDelegate:0];
    id v7 = self->_locationManager;
    self->_locationManager = 0;
  }
}

- (void)_mainQueue_takeLocationUpdatingAssertionWithAccuracy:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(HDLocationManager *)self _mainQueue_updateLocationManager];
  if (!self->_inUseAssertion)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1E5E8];
    uint64_t v6 = HKWorkoutLocationBundle();
    id v7 = (CLInUseAssertion *)[v5 newAssertionForBundle:v6 withReason:@"HDLocationManager requested location"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v7;
  }
  [(CLLocationManager *)self->_locationManager setDesiredAccuracy:a3];
  locationManager = self->_locationManager;

  [(CLLocationManager *)locationManager startUpdatingLocation];
}

- (void)_mainQueue_releaseLocationUpdatingAssertion
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  [(CLInUseAssertion *)self->_inUseAssertion invalidate];
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HDLocationManager_locationManagerDidChangeAuthorization___block_invoke;
  v7[3] = &unk_1E62F5AD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

void __59__HDLocationManager_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v4, "healthLocationManager:didChangeAuthorizationStatus:", v2, objc_msgSend(v3, "authorizationStatus"));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HDLocationManager_locationManager_didUpdateLocations___block_invoke;
  v8[3] = &unk_1E62F5AD8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(HKObserverSet *)observers notifyObservers:v8];
}

uint64_t __56__HDLocationManager_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 healthLocationManager:*(void *)(a1 + 32) didUpdateLocations:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HDLocationManager_locationManager_didFailWithError___block_invoke;
  v8[3] = &unk_1E62F5AD8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(HKObserverSet *)observers notifyObservers:v8];
}

uint64_t __54__HDLocationManager_locationManager_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 healthLocationManager:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__HDLocationManager_addObserver___block_invoke;
  v6[3] = &unk_1E62F31C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __33__HDLocationManager_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) registerObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_mainQueue_updateLocationManager");
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__HDLocationManager_removeObserver___block_invoke;
  v6[3] = &unk_1E62F31C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __36__HDLocationManager_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) unregisterObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_mainQueue_updateLocationManager");
}

- (void)_unitTest_setLocationManagerConfiguration:(id)a3
{
}

- (id)_unitTest_locationManager
{
  return self->_locationManager;
}

- (void)_unitTest_didTakeAssertion:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
    objc_msgSend(v6, "_unitTest_healthLocationManager:didTakeAssertion:", self, v7);
  }
}

- (void)_unitTest_didInvalidateAssertion:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
    objc_msgSend(v6, "_unitTest_healthLocationManager:didInvalidateAssertion:", self, v7);
  }
}

- (HDLocationManagerUnitTestDelegate)unitTestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);

  return (HDLocationManagerUnitTestDelegate *)WeakRetained;
}

- (void)setUnitTestDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTestDelegate);
  objc_storeStrong(&self->_locationManagerConfiguration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_assertionManager, 0);
}

@end
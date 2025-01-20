@interface ENRegionMonitorCoreLocationDataSource
- (BOOL)updateRegionAllowed;
- (CLLocationManager)locationManager;
- (ENRegionMonitorCoreLocationDataSource)initWithDelegate:(id)a3;
- (ENRegionMonitorCoreLocationDataSource)initWithDelegate:(id)a3 routineManager:(id)a4;
- (ENRegionMonitorSourceDelegate)delegate;
- (ENRegionVisit)cachedRegionVisit;
- (OS_dispatch_queue)queue;
- (RTRoutineManager)routineManager;
- (id)currentRegionVisit;
- (void)_processLocation:(id)a3;
- (void)_processLocation:(id)a3 locationOfInterest:(id)a4;
- (void)_processLocation:(id)a3 locationsOfInterest:(id)a4;
- (void)_processVisit:(id)a3;
- (void)_setup;
- (void)_updateRegionVisit:(id)a3;
- (void)_updatedRegion;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)processLocation:(id)a3 locationOfInterest:(id)a4;
- (void)processLocation:(id)a3 locationsOfInterest:(id)a4;
- (void)setCachedRegionVisit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setup;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)updateRegion;
- (void)updateRegionVisit:(id)a3;
@end

@implementation ENRegionMonitorCoreLocationDataSource

- (ENRegionMonitorCoreLocationDataSource)initWithDelegate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5CEB0];
  id v5 = a3;
  v6 = [v4 defaultManager];
  v7 = [(ENRegionMonitorCoreLocationDataSource *)self initWithDelegate:v5 routineManager:v6];

  return v7;
}

- (ENRegionMonitorCoreLocationDataSource)initWithDelegate:(id)a3 routineManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B08] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ENRegionMonitorCoreLocationDataSource.m", 43, @"Invalid parameter not satisfying: %@", @"sourceDelegate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B08] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"ENRegionMonitorCoreLocationDataSource.m", 44, @"Invalid parameter not satisfying: %@", @"routineManager" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)ENRegionMonitorCoreLocationDataSource;
  v10 = [(ENRegionMonitorCoreLocationDataSource *)&v17 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.exposureNotification.regionMonitorCoreLocationDataSource", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_routineManager, a4);
    objc_storeWeak((id *)&v10->delegate, v7);
    [(ENRegionMonitorCoreLocationDataSource *)v10 setup];
  }

  return v10;
}

- (void)_setup
{
  v3 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(MEMORY[0x1E4F1E608]);
  id v8 = [MEMORY[0x1E4F28B58] bundleWithPath:@"/System/Library/LocationBundles/ExposureNotificationBundle.bundle"];
  id v5 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  v6 = (CLLocationManager *)[v4 initWithEffectiveBundle:v8 delegate:self onQueue:v5];
  locationManager = self->_locationManager;
  self->_locationManager = v6;
}

- (void)setup
{
  v3 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ENRegionMonitorCoreLocationDataSource_setup__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__ENRegionMonitorCoreLocationDataSource_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (id)currentRegionVisit
{
  return self->_cachedRegionVisit;
}

- (void)startMonitoring
{
  id v4 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ENRegionMonitorCoreLocationDataSource_startMonitoring__block_invoke;
  v5[3] = &unk_1E69ACC88;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t __56__ENRegionMonitorCoreLocationDataSource_startMonitoring__block_invoke(uint64_t a1)
{
  if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v2 = (objc_class *)objc_opt_class();
    v3 = NSStringFromClass(v2);
    v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    LogPrintF_safe();
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v4 startMonitoringVisits];
}

- (void)stopMonitoring
{
  id v4 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ENRegionMonitorCoreLocationDataSource_stopMonitoring__block_invoke;
  v5[3] = &unk_1E69ACC88;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t __55__ENRegionMonitorCoreLocationDataSource_stopMonitoring__block_invoke(uint64_t a1)
{
  if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v2 = (objc_class *)objc_opt_class();
    v3 = NSStringFromClass(v2);
    v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    LogPrintF_safe();
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v4 stopMonitoringVisits];
}

- (BOOL)updateRegionAllowed
{
  CFDateGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C0] date];
    [v3 timeIntervalSinceDate:v2];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.79769313e308;
  }
  if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 >= 86400.0;
}

- (void)_updatedRegion
{
  v3 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ENRegionMonitorCoreLocationDataSource *)self updateRegionAllowed])
  {
    double v4 = [MEMORY[0x1E4F1C9C0] date];
    CFPrefs_SetValue();

    double v5 = *MEMORY[0x1E4F1E6F0];
    v6 = [(ENRegionMonitorCoreLocationDataSource *)self locationManager];
    [v6 setDesiredAccuracy:v5];

    id v7 = [(ENRegionMonitorCoreLocationDataSource *)self locationManager];
    [v7 requestLocation];
  }
}

- (void)updateRegion
{
  v3 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ENRegionMonitorCoreLocationDataSource_updateRegion__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __53__ENRegionMonitorCoreLocationDataSource_updateRegion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatedRegion];
}

- (void)_updateRegionVisit:(id)a3
{
  id v7 = a3;
  double v5 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v7)
  {
    objc_storeStrong((id *)&self->_cachedRegionVisit, a3);
    v6 = [(ENRegionMonitorCoreLocationDataSource *)self delegate];
    [v6 regionDataSource:self updatedWithVisit:v7];
  }
}

- (void)updateRegionVisit:(id)a3
{
  id v4 = a3;
  double v5 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ENRegionMonitorCoreLocationDataSource_updateRegionVisit___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__ENRegionMonitorCoreLocationDataSource_updateRegionVisit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRegionVisit:*(void *)(a1 + 40)];
}

- (void)_processLocation:(id)a3
{
  id v4 = a3;
  double v5 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ENRegionMonitorCoreLocationDataSource *)self routineManager];
  [v4 horizontalAccuracy];
  v10[1] = 3221225472;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[2] = __58__ENRegionMonitorCoreLocationDataSource__processLocation___block_invoke;
  v10[3] = &unk_1E69ACCB0;
  double v8 = v7 + 250.0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v6 fetchLocationsOfInterestWithinDistance:v9 ofLocation:v10 withHandler:v8];
}

void __58__ENRegionMonitorCoreLocationDataSource__processLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5
    && gLogCategory__ENRegionMonitorCoreLocationDataSource <= 90
    && (gLogCategory__ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    id v6 = v5;
    LogPrintF_safe();
  }
  objc_msgSend(*(id *)(a1 + 32), "processLocation:locationsOfInterest:", *(void *)(a1 + 40), v7, v6);
}

- (void)_processVisit:(id)a3
{
  id v4 = a3;
  id v5 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 _placeInference];
  id v7 = [v6 _loiIdentifier];

  double v8 = [(ENRegionMonitorCoreLocationDataSource *)self routineManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__ENRegionMonitorCoreLocationDataSource__processVisit___block_invoke;
  v10[3] = &unk_1E69ACCD8;
  id v11 = v4;
  dispatch_queue_t v12 = self;
  id v9 = v4;
  [v8 fetchLocationOfInterestWithIdentifier:v7 withHandler:v10];
}

void __55__ENRegionMonitorCoreLocationDataSource__processVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v7 = [v6 isSensitiveLoggingAllowed];

    if (v7)
    {
      if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 90
        && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1E5F8]);
  [*(id *)(a1 + 32) coordinate];
  double v10 = v9;
  double v12 = v11;
  [*(id *)(a1 + 32) horizontalAccuracy];
  double v14 = v13;
  v15 = [*(id *)(a1 + 32) detectionDate];
  v16 = objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v15, v10, v12, 0.0, v14, 0.0);

  [*(id *)(a1 + 40) processLocation:v16 locationOfInterest:v17];
}

- (void)processLocation:(id)a3 locationOfInterest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ENRegionMonitorCoreLocationDataSource_processLocation_locationOfInterest___block_invoke;
  block[3] = &unk_1E69ACD00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __76__ENRegionMonitorCoreLocationDataSource_processLocation_locationOfInterest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processLocation:*(void *)(a1 + 40) locationOfInterest:*(void *)(a1 + 48)];
}

- (void)_processLocation:(id)a3 locationOfInterest:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v9 = [v8 isSensitiveLoggingAllowed];

  if (v9
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v6)
  {
    id v10 = [v6 mapItem];
    double v11 = [v10 address];
    id v12 = [v11 iso3166CountryCode];

    id v13 = [v6 mapItem];
    double v14 = [v13 address];
    v15 = [v14 iso3166SubdivisionCode];

    if (v12)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F257A8]);
      if (v15) {
        uint64_t v17 = [v16 initWithCountryCode:v12 subdivisionCode:v15];
      }
      else {
        uint64_t v17 = [v16 initWithCountryCode:v12];
      }
      v20 = (void *)v17;
      id v21 = objc_alloc(MEMORY[0x1E4F257E0]);
      v22 = [MEMORY[0x1E4F1C9C0] date];
      v23 = (void *)[v21 initWithRegion:v20 date:v22];

      [(ENRegionMonitorCoreLocationDataSource *)self updateRegionVisit:v23];
    }
    else
    {
      v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v19 = [v18 isSensitiveLoggingAllowed];

      if (v19
        && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
        && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30 {
         && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)processLocation:(id)a3 locationsOfInterest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ENRegionMonitorCoreLocationDataSource_processLocation_locationsOfInterest___block_invoke;
  block[3] = &unk_1E69ACD00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __77__ENRegionMonitorCoreLocationDataSource_processLocation_locationsOfInterest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processLocation:*(void *)(a1 + 40) locationsOfInterest:*(void *)(a1 + 48)];
}

- (void)_processLocation:(id)a3 locationsOfInterest:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENRegionMonitorCoreLocationDataSource *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [MEMORY[0x1E4F28F68] predicateWithBlock:&__block_literal_global_1];
  v33 = v7;
  id v10 = [v7 filteredArrayUsingPredicate:v9];

  double v11 = *MEMORY[0x1E4F1E570];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = 0;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v18 = objc_alloc(MEMORY[0x1E4F1E5F8]);
        int v19 = [v17 location];
        [v19 latitude];
        double v21 = v20;
        v22 = [v17 location];
        [v22 longitude];
        id v24 = (void *)[v18 initWithLatitude:v21 longitude:v23];

        [v6 distanceFromLocation:v24];
        if (v25 < v11)
        {
          double v26 = v25;
          id v27 = v17;

          double v11 = v26;
          double v14 = v27;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }
  else
  {
    double v14 = 0;
  }

  v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v29 = [v28 isSensitiveLoggingAllowed];

  if (v29
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    double v32 = v11;
    v30 = v14;
    id v31 = v6;
    LogPrintF_safe();
  }
  -[ENRegionMonitorCoreLocationDataSource _processLocation:locationOfInterest:](self, "_processLocation:locationOfInterest:", v6, v14, v30, v31, *(void *)&v32);
}

BOOL __78__ENRegionMonitorCoreLocationDataSource__processLocation_locationsOfInterest___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mapItem];
  v3 = [v2 address];
  id v4 = [v3 iso3166SubdivisionCode];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v9 = a4;
  BOOL v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v6 = [v5 isSensitiveLoggingAllowed];

  if (v6
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    id v8 = v9;
    LogPrintF_safe();
  }
  id v7 = objc_msgSend(v9, "lastObject", v8);
  if (v7) {
    [(ENRegionMonitorCoreLocationDataSource *)self _processLocation:v7];
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v8 = a4;
  BOOL v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v6 = [v5 isSensitiveLoggingAllowed];

  if (v6
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    id v7 = v8;
    LogPrintF_safe();
  }
  if ((objc_msgSend(v8, "hasDepartureDate", v7) & 1) == 0) {
    [(ENRegionMonitorCoreLocationDataSource *)self _processVisit:v8];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory__ENRegionMonitorCoreLocationDataSource <= 90
    && (gLogCategory__ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (ENRegionMonitorSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (ENRegionMonitorSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ENRegionVisit)cachedRegionVisit
{
  return self->_cachedRegionVisit;
}

- (void)setCachedRegionVisit:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedRegionVisit, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end
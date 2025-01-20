@interface CAMLocationController
+ (id)_sharedGPSDatestampFormatter;
+ (id)_sharedGPSTimestampFormatter;
+ (id)locationMetadataForLocation:(id)a3 heading:(id)a4 device:(int64_t)a5;
- (BOOL)_didRequestLocation;
- (BOOL)_isMonitoringLocation;
- (BOOL)isEnabled;
- (BOOL)isHeadingEnabled;
- (CAMLocationController)init;
- (CLHeading)currentHeading;
- (CLLocation)currentLocation;
- (CLLocationManager)_locationManager;
- (NSHashTable)_listenersWaitingForLocation;
- (NSMutableArray)_enqueuedAssetsWaitingForLocation;
- (OS_dispatch_queue)_listenersQueue;
- (id)headingForOrientation:(int64_t)a3;
- (int)lastKnownAuthorizationStatus;
- (void)_authorizeOrStartLocationManager;
- (void)_notifyListenersForAuthorizationStatusUpdate:(int)a3;
- (void)_notifyListenersWaitingOnLocation:(id)a3;
- (void)_performBlock:(id)a3 andLogIfExecutionExceeds:(double)a4 logPrefix:(id)a5;
- (void)_resetDidRequestLocation;
- (void)_setCurrentLocation:(id)a3;
- (void)_setDidRequestLocation:(BOOL)a3;
- (void)_setLastKnownAuthorizationStatus:(int)a3;
- (void)_startMonitoringLocationUpdates;
- (void)_stopMonitoringLocationUpdates;
- (void)_updateLocationMonitoring;
- (void)addListenerForLocationUpdates:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)removeListenerForLocationUpdates:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHeadingEnabled:(BOOL)a3;
@end

@implementation CAMLocationController

- (CAMLocationController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CAMLocationController;
  v2 = [(CAMLocationController *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.location-listeners-queue", v3);
    listenersQueue = v2->__listenersQueue;
    v2->__listenersQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    listenersWaitingForLocation = v2->__listenersWaitingForLocation;
    v2->__listenersWaitingForLocation = (NSHashTable *)v6;

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel__updateLocationMonitoring name:*MEMORY[0x263F833C0] object:0];
    [v8 addObserver:v2 selector:sel__updateLocationMonitoring name:*MEMORY[0x263F83318] object:0];
    [v8 addObserver:v2 selector:sel__updateLocationMonitoring name:*MEMORY[0x263F833A0] object:0];
    [v8 addObserver:v2 selector:sel__resetDidRequestLocation name:*MEMORY[0x263F83330] object:0];
    v9 = v2;
  }
  return v2;
}

- (void)_updateLocationMonitoring
{
  BOOL v3 = [(CAMLocationController *)self _isMonitoringLocation];
  if (![(CAMLocationController *)self isEnabled])
  {
LABEL_4:
    if (v3)
    {
      [(CAMLocationController *)self _stopMonitoringLocationUpdates];
    }
    return;
  }
  BOOL v4 = +[CAMApplication isAppOrPlugInSuspended];
  if (v4 || v3)
  {
    if (!v4) {
      return;
    }
    goto LABEL_4;
  }
  [(CAMLocationController *)self _startMonitoringLocationUpdates];
}

- (BOOL)_isMonitoringLocation
{
  return self->__monitoringLocation;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(CAMLocationController *)self _updateLocationMonitoring];
  }
}

- (void)_startMonitoringLocationUpdates
{
  if (![(CAMLocationController *)self _isMonitoringLocation]
    && [(CAMLocationController *)self isEnabled])
  {
    if (!self->__locationManager)
    {
      BOOL v3 = (CLLocationManager *)objc_alloc_init(MEMORY[0x263F00A60]);
      locationManager = self->__locationManager;
      self->__locationManager = v3;

      [(CLLocationManager *)self->__locationManager setDelegate:self];
      [(CLLocationManager *)self->__locationManager setDistanceFilter:*MEMORY[0x263F00AF0]];
      [(CLLocationManager *)self->__locationManager setHeadingFilter:5.0];
      [(CLLocationManager *)self->__locationManager setDesiredAccuracy:*MEMORY[0x263F00B10]];
      if (_startMonitoringLocationUpdates_onceToken != -1) {
        dispatch_once(&_startMonitoringLocationUpdates_onceToken, &__block_literal_global_45);
      }
      if (_startMonitoringLocationUpdates_disableIndoorLocation) {
        [(CLLocationManager *)self->__locationManager setActivityType:3];
      }
    }
    [(CAMLocationController *)self _authorizeOrStartLocationManager];
  }
}

- (void)_authorizeOrStartLocationManager
{
  BOOL v3 = [(CAMLocationController *)self _locationManager];
  int v4 = [(CAMLocationController *)self lastKnownAuthorizationStatus];
  if (v4 == 4)
  {
    if (![(CAMLocationController *)self _isMonitoringLocation])
    {
      self->__monitoringLocation = 1;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_2;
      v9[3] = &unk_263FA0408;
      v9[4] = self;
      id v6 = v3;
      id v10 = v6;
      -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v9, @"-[CLLocationManager startUpdatingLocation]", 0.2);
      if ([(CAMLocationController *)self isHeadingEnabled])
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_3;
        v7[3] = &unk_263FA0208;
        id v8 = v6;
        -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v7, @"-[CLLocationManager startUpdatingHeading]", 0.2);
      }
      v5 = v10;
      goto LABEL_9;
    }
  }
  else if (!v4 && ![(CAMLocationController *)self _didRequestLocation])
  {
    [(CAMLocationController *)self _setDidRequestLocation:1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke;
    v11[3] = &unk_263FA0208;
    id v12 = v3;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v11, @"-[CLLocationManager requestWhenInUseAuthorization]", 0.2);
    v5 = v12;
LABEL_9:
  }
}

- (void)setHeadingEnabled:(BOOL)a3
{
  if (self->_headingEnabled != a3)
  {
    self->_headingEnabled = a3;
    if (self->__monitoringLocation)
    {
      if (a3)
      {
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        v14 = __43__CAMLocationController_setHeadingEnabled___block_invoke;
        v15 = &unk_263FA0208;
        v16 = self;
        int v4 = @"-[CLLocationManager startUpdatingHeading]";
        v5 = &v12;
      }
      else
      {
        uint64_t v7 = MEMORY[0x263EF8330];
        uint64_t v8 = 3221225472;
        v9 = __43__CAMLocationController_setHeadingEnabled___block_invoke_2;
        id v10 = &unk_263FA0208;
        objc_super v11 = self;
        int v4 = @"-[CLLocationManager stopUpdatingHeading]";
        v5 = &v7;
      }
      -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v5, v4, 0.2, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
      *(_DWORD *)&a3 = self->_headingEnabled;
    }
    if (!a3)
    {
      currentHeading = self->_currentHeading;
      self->_currentHeading = 0;
    }
  }
}

uint64_t __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWhenInUseAuthorization];
}

uint64_t __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_2(uint64_t a1)
{
  CAMSignpostWithIDAndArgs(84, 0xEEEEB0B5B2B2EEEELL, *(void *)(a1 + 32), 0, 0, 0);
  v2 = *(void **)(a1 + 40);
  return [v2 startUpdatingLocation];
}

- (BOOL)isHeadingEnabled
{
  return self->_headingEnabled;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v18 = a4;
  BOOL v5 = [(CAMLocationController *)self _isMonitoringLocation];
  id v6 = v18;
  if (v5)
  {
    uint64_t v7 = [v18 lastObject];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 horizontalAccuracy];
      double v10 = v9;
      objc_super v11 = [v8 timestamp];
      [v11 timeIntervalSinceNow];
      double v13 = v12;

      if (v13 < -60.0 || v10 < 0.0)
      {

        uint64_t v8 = 0;
      }
      else
      {
        v14 = [(CAMLocationController *)self currentLocation];

        if (!v14)
        {
          [v8 horizontalAccuracy];
          uint64_t v16 = (unint64_t)v15;
          [v8 verticalAccuracy];
          CAMSignpostWithIDAndArgs(85, 0xEEEEB0B5B2B2EEEELL, (uint64_t)self, v16, (unint64_t)v17, 0);
        }
      }
    }
    [(CAMLocationController *)self _setCurrentLocation:v8];
    [(CAMLocationController *)self _notifyListenersWaitingOnLocation:v8];
    [(CAMLocationController *)self _updateAssetsWaitingOnLocation];

    id v6 = v18;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v7 = a4;
  if ([(CAMLocationController *)self isHeadingEnabled])
  {
    [v7 headingAccuracy];
    if (v6 > 0.0)
    {
      [(CAMLocationController *)self willChangeValueForKey:@"currentHeading"];
      objc_storeStrong((id *)&self->_currentHeading, a4);
      [(CAMLocationController *)self didChangeValueForKey:@"currentHeading"];
    }
  }
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (id)headingForOrientation:(int64_t)a3
{
  int v3 = a3;
  if ([(CAMLocationController *)self _isMonitoringLocation])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__CAMLocationController_headingForOrientation___block_invoke;
    v14[3] = &unk_263FA48E0;
    v14[4] = self;
    int v15 = v3;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v14, @"-[CLLocationManager setHeadingOrientation:]", 0.2);
    uint64_t v8 = 0;
    double v9 = &v8;
    uint64_t v10 = 0x3032000000;
    objc_super v11 = __Block_byref_object_copy__21;
    double v12 = __Block_byref_object_dispose__21;
    id v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__CAMLocationController_headingForOrientation___block_invoke_86;
    v7[3] = &unk_263FA35E8;
    void v7[4] = self;
    v7[5] = &v8;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v7, @"-[CLLocationManager heading]", 0.2);
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (CLLocationManager)_locationManager
{
  return self->__locationManager;
}

+ (id)locationMetadataForLocation:(id)a3 heading:(id)a4 device:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_41;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 coordinate];
  float v12 = v11;
  [v8 coordinate];
  float v14 = v13;
  *(float *)&double v15 = fabsf(v12);
  if (v12 >= 0.0) {
    uint64_t v16 = @"N";
  }
  else {
    uint64_t v16 = @"S";
  }
  if (v12 >= 0.0) {
    *(float *)&double v15 = v12;
  }
  float v17 = fabsf(v14);
  if (v14 >= 0.0) {
    id v18 = @"E";
  }
  else {
    id v18 = @"W";
  }
  if (v14 >= 0.0) {
    float v19 = v14;
  }
  else {
    float v19 = v17;
  }
  v20 = [NSNumber numberWithFloat:v15];
  [v10 setObject:v20 forKey:*MEMORY[0x263F0F3E0]];

  [v10 setObject:v16 forKey:*MEMORY[0x263F0F3E8]];
  *(float *)&double v21 = v19;
  v22 = [NSNumber numberWithFloat:v21];
  [v10 setObject:v22 forKey:*MEMORY[0x263F0F3F0]];

  [v10 setObject:v18 forKey:*MEMORY[0x263F0F3F8]];
  v23 = [v8 timestamp];
  if (v23)
  {
    v24 = [a1 _sharedGPSTimestampFormatter];
    v25 = [v24 stringFromDate:v23];
    if (v25) {
      [v10 setObject:v25 forKey:*MEMORY[0x263F0F410]];
    }
    v26 = [a1 _sharedGPSDatestampFormatter];
    v27 = [v26 stringFromDate:v23];
    if (v27) {
      [v10 setObject:v27 forKey:*MEMORY[0x263F0F3A8]];
    }
  }
  [v8 horizontalAccuracy];
  if (v28 >= 0.0)
  {
    v29 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v10 setObject:v29 forKey:*MEMORY[0x263F0F3C8]];
  }
  [v8 verticalAccuracy];
  if (v30 >= 0.0)
  {
    [v8 altitude];
    BOOL v32 = v31 < 0.0;
    double v33 = fabs(v31);
    if (v31 < 0.0) {
      double v31 = v33;
    }
    v34 = [NSNumber numberWithDouble:v31];
    [v10 setObject:v34 forKey:*MEMORY[0x263F0F398]];

    v35 = [NSNumber numberWithInt:v32];
    [v10 setObject:v35 forKey:*MEMORY[0x263F0F3A0]];
  }
  if (v9)
  {
    [v9 headingAccuracy];
    if (v36 >= 0.0)
    {
      if (CFPreferencesGetAppBooleanValue(@"kMagneticNorth", @"com.apple.compass", 0)
        || ([v9 trueHeading], v37 < 0.0))
      {
        [v9 magneticHeading];
        double v39 = v38;
        v40 = @"M";
      }
      else
      {
        [v9 trueHeading];
        double v39 = v41;
        v40 = @"T";
      }
      v42 = [NSNumber numberWithDouble:v39];
      [v10 setObject:v42 forKey:*MEMORY[0x263F0F3B0]];

      [v10 setObject:v40 forKey:*MEMORY[0x263F0F3B8]];
      if ((unint64_t)(a5 - 8) >= 4 && a5 != 1) {
        goto LABEL_39;
      }
      double v39 = v39 + 180.0;
      double v43 = 360.0;
      if (v39 >= 360.0)
      {
        double v43 = -360.0;
      }
      else if (v39 >= 0.0)
      {
        goto LABEL_39;
      }
      double v39 = v39 + v43;
LABEL_39:
      v44 = [NSNumber numberWithDouble:v39];
      [v10 setObject:v44 forKey:*MEMORY[0x263F0F3D0]];

      [v10 setObject:v40 forKey:*MEMORY[0x263F0F3D8]];
    }
  }
  v45 = NSNumber;
  [v8 speed];
  v46 = objc_msgSend(v45, "numberWithDouble:");
  [v10 setObject:v46 forKey:*MEMORY[0x263F0F400]];

  [v10 setObject:@"K" forKey:*MEMORY[0x263F0F408]];
LABEL_41:
  v47 = (void *)[v10 copy];

  return v47;
}

+ (id)_sharedGPSTimestampFormatter
{
  if (_sharedGPSTimestampFormatter_onceToken != -1) {
    dispatch_once(&_sharedGPSTimestampFormatter_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)_sharedGPSTimestampFormatter_formatter;
  return v2;
}

uint64_t __53__CAMLocationController__sharedGPSTimestampFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_sharedGPSTimestampFormatter_formatter;
  _sharedGPSTimestampFormatter_formatter = (uint64_t)v0;

  v2 = (void *)_sharedGPSTimestampFormatter_formatter;
  int v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  int v4 = (void *)_sharedGPSTimestampFormatter_formatter;
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  double v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v6];

  id v7 = (void *)_sharedGPSTimestampFormatter_formatter;
  id v8 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v7 setTimeZone:v8];

  id v9 = (void *)_sharedGPSTimestampFormatter_formatter;
  return [v9 setDateFormat:@"HH:mm:ss.SS"];
}

+ (id)_sharedGPSDatestampFormatter
{
  if (_sharedGPSDatestampFormatter_onceToken != -1) {
    dispatch_once(&_sharedGPSDatestampFormatter_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)_sharedGPSDatestampFormatter_formatter;
  return v2;
}

uint64_t __53__CAMLocationController__sharedGPSDatestampFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_sharedGPSDatestampFormatter_formatter;
  _sharedGPSDatestampFormatter_formatter = (uint64_t)v0;

  v2 = (void *)_sharedGPSDatestampFormatter_formatter;
  int v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  int v4 = (void *)_sharedGPSDatestampFormatter_formatter;
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  double v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v6];

  id v7 = (void *)_sharedGPSDatestampFormatter_formatter;
  id v8 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v7 setTimeZone:v8];

  id v9 = (void *)_sharedGPSDatestampFormatter_formatter;
  return [v9 setDateFormat:@"yyyy:MM:dd"];
}

- (void)dealloc
{
  [(CAMLocationController *)self _stopMonitoringLocationUpdates];
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CAMLocationController;
  [(CAMLocationController *)&v4 dealloc];
}

uint64_t __43__CAMLocationController_setHeadingEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) startUpdatingHeading];
}

uint64_t __43__CAMLocationController_setHeadingEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) stopUpdatingHeading];
}

- (void)_setCurrentLocation:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  double v6 = (CLLocation *)v5;
  id v10 = (CLLocation *)v5;
  if (v5)
  {
    [(id)v5 horizontalAccuracy];
    double v8 = v7;
    [(CLLocation *)v10 verticalAccuracy];
    if (v8 >= v9) {
      double v9 = v8;
    }
    CAMSignpostWithIDAndArgs(86, 0xEEEEB0B5B2B2EEEELL, (uint64_t)self, (unint64_t)v9, 0, 0);
    double v6 = v10;
  }
  if (self->_currentLocation != v6)
  {
    uint64_t v5 = -[CLLocation isEqual:](v6, "isEqual:");
    double v6 = v10;
    if ((v5 & 1) == 0)
    {
      [(CAMLocationController *)self willChangeValueForKey:@"currentLocation"];
      objc_storeStrong((id *)&self->_currentLocation, a3);
      uint64_t v5 = [(CAMLocationController *)self didChangeValueForKey:@"currentLocation"];
      double v6 = v10;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

uint64_t __56__CAMLocationController__startMonitoringLocationUpdates__block_invoke()
{
  uint64_t result = sysctlbyname("hw.memsize", &_block_invoke_amountOfPhysicalMemory, (size_t *)&_block_invoke_size, 0, 0);
  if (result) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = _block_invoke_size == 0;
  }
  if (!v1) {
    _startMonitoringLocationUpdates_disableIndoorLocation = (unint64_t)_block_invoke_amountOfPhysicalMemory < 0x40000001;
  }
  return result;
}

uint64_t __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) startUpdatingHeading];
}

- (void)_stopMonitoringLocationUpdates
{
  if ([(CAMLocationController *)self _isMonitoringLocation])
  {
    self->__monitoringLocation = 0;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke;
    v4[3] = &unk_263FA0208;
    v4[4] = self;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v4, @"-[CLLocationManager stopUpdatingLocation]", 0.2);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke_2;
    v3[3] = &unk_263FA0208;
    v3[4] = self;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v3, @"-[CLLocationManager stopUpdatingHeading]", 0.2);
  }
}

uint64_t __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) stopUpdatingLocation];
}

uint64_t __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) stopUpdatingHeading];
}

- (void)_resetDidRequestLocation
{
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  double v11 = __63__CAMLocationController_locationManagerDidChangeAuthorization___block_invoke;
  float v12 = &unk_263FA35E8;
  float v14 = &v15;
  id v5 = v4;
  id v13 = v5;
  -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", &v9, @"-[CLLocationManager authorizationStatus]", 0.2);
  -[CAMLocationController _setLastKnownAuthorizationStatus:](self, "_setLastKnownAuthorizationStatus:", *((unsigned int *)v16 + 6), v9, v10, v11, v12);
  double v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *((int *)v16 + 6);
    if (v7 > 4) {
      double v8 = 0;
    }
    else {
      double v8 = off_263FA54C8[v7];
    }
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Received location authorization status %{public}@", buf, 0xCu);
  }

  if (*((_DWORD *)v16 + 6) <= 2u) {
    [(CAMLocationController *)self _setCurrentLocation:0];
  }
  [(CAMLocationController *)self _authorizeOrStartLocationManager];
  [(CAMLocationController *)self _notifyListenersForAuthorizationStatusUpdate:*((unsigned int *)v16 + 6)];

  _Block_object_dispose(&v15, 8);
}

uint64_t __63__CAMLocationController_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) authorizationStatus];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __47__CAMLocationController_headingForOrientation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _locationManager];
  [v2 setHeadingOrientation:*(unsigned int *)(a1 + 40)];
}

void __47__CAMLocationController_headingForOrientation___block_invoke_86(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _locationManager];
  uint64_t v2 = [v5 heading];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_performBlock:(id)a3 andLogIfExecutionExceeds:(double)a4 logPrefix:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a5;
  double v8 = (void (**)(void))a3;
  double Current = CFAbsoluteTimeGetCurrent();
  v8[2](v8);

  double v10 = CFAbsoluteTimeGetCurrent() - Current;
  if (v10 > a4)
  {
    double v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2048;
      double v15 = v10;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ took %.3f seconds", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_notifyListenersForAuthorizationStatusUpdate:(int)a3
{
  listenersQueue = self->__listenersQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke;
  v4[3] = &unk_263FA48E0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(listenersQueue, v4);
}

void __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        if (v7)
        {
          double v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) listeningQueue];
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke_2;
          v9[3] = &unk_263FA48E0;
          v9[4] = v7;
          int v10 = *(_DWORD *)(a1 + 40);
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) authorizationStatusUpdated:*(unsigned int *)(a1 + 40)];
}

- (void)_notifyListenersWaitingOnLocation:(id)a3
{
  id v4 = a3;
  listenersQueue = self->__listenersQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke;
  v7[3] = &unk_263FA0408;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenersQueue, v7);
}

void __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        if (v7)
        {
          id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) listeningQueue];
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke_2;
          v9[3] = &unk_263FA0408;
          v9[4] = v7;
          id v10 = *(id *)(a1 + 40);
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) currentLocationUpdated:*(void *)(a1 + 40)];
}

- (void)addListenerForLocationUpdates:(id)a3
{
  id v4 = a3;
  listenersQueue = self->__listenersQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CAMLocationController_addListenerForLocationUpdates___block_invoke;
  v7[3] = &unk_263FA0408;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenersQueue, v7);
}

void __55__CAMLocationController_addListenerForLocationUpdates___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__21;
    v8[4] = __Block_byref_object_dispose__21;
    id v9 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_2;
    block[3] = &unk_263FA54A8;
    block[4] = *(void *)(a1 + 32);
    block[5] = v10;
    block[6] = v8;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    id v2 = [*(id *)(a1 + 40) listeningQueue];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_3;
    v3[3] = &unk_263FA2C30;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = v10;
    id v6 = v8;
    dispatch_async(v2, v3);

    _Block_object_dispose(v8, 8);
    _Block_object_dispose(v10, 8);
  }
}

uint64_t __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) lastKnownAuthorizationStatus];
  uint64_t v2 = [*(id *)(a1 + 32) currentLocation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

uint64_t __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) authorizationStatusUpdated:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "currentLocationUpdated:");
  }
  return result;
}

- (void)removeListenerForLocationUpdates:(id)a3
{
  id v4 = a3;
  listenersQueue = self->__listenersQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CAMLocationController_removeListenerForLocationUpdates___block_invoke;
  v7[3] = &unk_263FA0408;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenersQueue, v7);
}

uint64_t __58__CAMLocationController_removeListenerForLocationUpdates___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (CLHeading)currentHeading
{
  return self->_currentHeading;
}

- (int)lastKnownAuthorizationStatus
{
  return self->_lastKnownAuthorizationStatus;
}

- (void)_setLastKnownAuthorizationStatus:(int)a3
{
  self->_lastKnownAuthorizationStatus = a3;
}

- (NSMutableArray)_enqueuedAssetsWaitingForLocation
{
  return self->__enqueuedAssetsWaitingForLocation;
}

- (NSHashTable)_listenersWaitingForLocation
{
  return self->__listenersWaitingForLocation;
}

- (OS_dispatch_queue)_listenersQueue
{
  return self->__listenersQueue;
}

- (BOOL)_didRequestLocation
{
  return self->__didRequestLocation;
}

- (void)_setDidRequestLocation:(BOOL)a3
{
  self->__didRequestLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__listenersQueue, 0);
  objc_storeStrong((id *)&self->__listenersWaitingForLocation, 0);
  objc_storeStrong((id *)&self->__enqueuedAssetsWaitingForLocation, 0);
  objc_storeStrong((id *)&self->__locationManager, 0);
  objc_storeStrong((id *)&self->_currentHeading, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end
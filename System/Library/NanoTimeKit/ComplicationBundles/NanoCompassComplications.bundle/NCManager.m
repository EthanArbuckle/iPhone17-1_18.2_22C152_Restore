@interface NCManager
+ (BOOL)_showsElevationAccuracy;
+ (BOOL)showingIdealizedData;
+ (NCManager)sharedAppManager;
+ (NCManager)sharedComplicationManager;
- (BOOL)calibrated;
- (BOOL)isAbsoluteAltimeterAvailable;
- (BOOL)isTrueNorthError:(id)a3;
- (BOOL)locationUpdateShouldStart;
- (BOOL)paused;
- (BOOL)usesTrueNorth;
- (BOOL)waypointComplicationIsActive;
- (NCAltitude)altitude;
- (NCBacktrackLocationDataSource)backtrackLocationDataSource;
- (NCBearing)bearing;
- (NCHeading)heading;
- (NCIncline)incline;
- (NCLocation)location;
- (NCLocationUpdateBaseDelegate)locationDelegate;
- (id)_newAltimeter;
- (id)init:(BOOL)a3;
- (id)startAltimeterUpdateWithHandler:(id)a3;
- (id)startLocationServiceUpdateWithHandler:(id)a3;
- (id)startLocationUpdatesWithHandler:(id)a3;
- (id)startMotionUpdatesWithHandler:(id)a3 calibrationHandler:(id)a4;
- (id)startMotionUpdatesWithUpdateRate:(int64_t)a3 updateHandler:(id)a4 calibrationHandler:(id)a5;
- (void)_initLocationDelegate;
- (void)_queue_altimeterError:(id)a3;
- (void)_queue_altimeterUpdate;
- (void)_queue_altimeterUpdate:(id)a3;
- (void)_startAbsoluteAltimeterUpdate;
- (void)_updateAltimeterRunning;
- (void)_updateRunning;
- (void)activateWaypointComplication;
- (void)clearValueForBearing;
- (void)deactivateWaypointComplication;
- (void)dealloc;
- (void)end1HzMode:(id)a3;
- (void)fetchGroundAltitudeNearCurrentLocationWithCompletion:(id)a3;
- (void)fetchGroundAltitudeNearLocation:(id)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performAfterLocationPromptIsShown:(id)a3;
- (void)setAltitude:(id)a3;
- (void)setBearing:(id)a3;
- (void)setCalibrated:(BOOL)a3;
- (void)setHeading:(id)a3;
- (void)setIncline:(id)a3;
- (void)setLocationUpdateShouldStart:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPaused:(BOOL)a3 forAltimeterToken:(id)a4;
- (void)setUsesTrueNorth:(BOOL)a3;
- (void)setValueForBearing:(double)a3;
- (void)setWaypointComplicationIsActive:(BOOL)a3;
- (void)start1HzMode:(id)a3;
- (void)startFurthestWaypointUpdatesWithHandler:(id)a3;
- (void)startLocationUpdateInterestDescriptionUpdatesWithHandler:(id)a3;
- (void)startMotionActivityUpdatesWithHandler:(id)a3;
- (void)startNearestWaypointUpdatesWithHandler:(id)a3;
- (void)stopAltimeterUpdateForToken:(id)a3;
- (void)stopFurthestWaypointUpdates;
- (void)stopLocationServiceUpdatesForToken:(id)a3;
- (void)stopLocationUpdateInterestDescriptionUpdates;
- (void)stopLocationUpdatesForToken:(id)a3;
- (void)stopMotionActivityUpdates;
- (void)stopNearestWaypointUpdates;
- (void)updateLocationManagerWithCurrentAuthorizationStatus;
@end

@implementation NCManager

+ (NCManager)sharedComplicationManager
{
  if (qword_268921148 != -1) {
    dispatch_once(&qword_268921148, &unk_26EA48C40);
  }
  v2 = (void *)qword_268921140;

  return (NCManager *)v2;
}

- (BOOL)isAbsoluteAltimeterAvailable
{
  return self->_altimeterManager != 0;
}

- (id)startMotionUpdatesWithHandler:(id)a3 calibrationHandler:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_startMotionUpdatesWithUpdateRate_updateHandler_calibrationHandler_, 0, a3);
}

- (id)startMotionUpdatesWithUpdateRate:(int64_t)a3 updateHandler:(id)a4 calibrationHandler:(id)a5
{
  v6 = (void (**)(id, uint64_t, void))a5;
  id v7 = a4;
  v11 = objc_msgSend_idealizedHeading(NCHeading, v8, v9, v10);
  v15 = objc_msgSend_idealizedIncline(NCIncline, v12, v13, v14);
  (*((void (**)(id, void *, void *))a4 + 2))(v7, v11, v15);

  if (v6) {
    v6[2](v6, 1, 0);
  }

  return 0;
}

- (void)startMotionActivityUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_locationDelegate(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startMotionActivityUpdatesWithHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)stopMotionActivityUpdates
{
  objc_msgSend_locationDelegate(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMotionActivityUpdates(v7, v4, v5, v6);
}

+ (NCManager)sharedAppManager
{
  if (qword_268921138 != -1) {
    dispatch_once(&qword_268921138, &unk_26EA48C20);
  }
  uint64_t v2 = (void *)qword_268921130;

  return (NCManager *)v2;
}

+ (BOOL)showingIdealizedData
{
  if (qword_268921158 != -1) {
    dispatch_once(&qword_268921158, &unk_26EA48C60);
  }
  return byte_268921150;
}

- (id)init:(BOOL)a3
{
  v45.receiver = self;
  v45.super_class = (Class)NCManager;
  id v4 = [(NCManager *)&v45 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_complicationStyle = a3;
    v4->_externallyPaused = 1;
    id v6 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v9 = objc_msgSend_initWithSuiteName_(v6, v7, @"com.apple.compass", v8);
    id v10 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v9;

    objc_msgSend_addObserver_forKeyPath_options_context_(*(void **)(v5 + 56), v11, v5, @"Bearing", 5, &off_264CD58A8);
    objc_msgSend_addObserver_forKeyPath_options_context_(*(void **)(v5 + 56), v12, v5, @"TargetedWaypointUUID", 5, &off_264CD58B0);
    objc_msgSend_addObserver_forKeyPath_options_context_(*(void **)(v5 + 56), v13, v5, @"TargetedViewUsageTimestamp", 5, &off_264CD58B8);
    uint64_t v17 = objc_msgSend_idealizedHeading(NCHeading, v14, v15, v16);
    v18 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v17;

    uint64_t v22 = objc_msgSend_idealizedIncline(NCIncline, v19, v20, v21);
    v23 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v22;

    *(unsigned char *)(v5 + 72) = 1;
    if (supportAbsoluteAltimeterFeatures())
    {
      uint64_t v27 = objc_msgSend__newAltimeter((void *)v5, v24, v25, v26);
      v28 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v27;

      if (objc_msgSend_showingIdealizedData(NCManager, v29, v30, v31))
      {
        v35 = objc_msgSend_idealizedAltitude(NCAltitude, v32, v33, v34);
        objc_msgSend_setAltitude_((void *)v5, v36, (uint64_t)v35, v37);
      }
      uint64_t v38 = objc_opt_new();
      v39 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v38;

      uint64_t v40 = objc_opt_new();
      v41 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v40;
    }
    objc_msgSend__initLocationDelegate((void *)v5, v24, v25, v26);
    id v42 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v43 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v42;
  }
  return (id)v5;
}

- (void)_initLocationDelegate
{
  uint64_t v3 = objc_alloc_init(NCLocationUpdateDemoDelegate);
  locationDelegate = self->_locationDelegate;
  self->_locationDelegate = &v3->super;

  MEMORY[0x270F9A758](v3, locationDelegate);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NCManager;
  [(NCManager *)&v2 dealloc];
}

- (id)startAltimeterUpdateWithHandler:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isAbsoluteAltimeterAvailable(self, v5, v6, v7) & 1) == 0)
  {
    v18 = NCLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_2375D8184();
    }

    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v19, @"altimeterNotAvailable", @"CMAltimeter is not initialized", 0);
    id v20 = objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  id v10 = objc_msgSend_tokenWithValue_(NCManagerAltimeterToken, v8, self->_altimeterToken, v9);
  ++self->_altimeterToken;
  v11 = (void *)MEMORY[0x237E1C4F0](v4);
  objc_msgSend_setObject_forKeyedSubscript_(self->_altimeterUpdateHandlers, v12, (uint64_t)v11, (uint64_t)v10);

  objc_msgSend__updateAltimeterRunning(self, v13, v14, v15);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2375B2698;
  v21[3] = &unk_264CD58C8;
  v21[4] = self;
  id v22 = v4;
  id v16 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v21);

  return v10;
}

- (void)stopAltimeterUpdateForToken:(id)a3
{
  altimeterUpdateHandlers = self->_altimeterUpdateHandlers;
  id v5 = a3;
  objc_msgSend_removeObjectForKey_(altimeterUpdateHandlers, v6, (uint64_t)v5, v7);
  objc_msgSend_removeObject_(self->_altimeterPausedTokens, v8, (uint64_t)v5, v9);

  objc_msgSend__updateAltimeterRunning(self, v10, v11, v12);
}

- (id)startLocationUpdatesWithHandler:(id)a3
{
  return (id)((uint64_t (*)(NCLocationUpdateBaseDelegate *, char *, id))MEMORY[0x270F9A6D0])(self->_locationDelegate, sel_startLocationUpdatesWithHandler_, a3);
}

- (void)stopLocationUpdatesForToken:(id)a3
{
  objc_msgSend_stopLocationUpdatesForToken_(self->_locationDelegate, a2, (uint64_t)a3, v3);
}

- (id)startLocationServiceUpdateWithHandler:(id)a3
{
  return (id)((uint64_t (*)(NCLocationUpdateBaseDelegate *, char *, id))MEMORY[0x270F9A6D0])(self->_locationDelegate, sel_startLocationServiceUpdateWithHandler_, a3);
}

- (void)stopLocationServiceUpdatesForToken:(id)a3
{
}

- (void)startLocationUpdateInterestDescriptionUpdatesWithHandler:(id)a3
{
}

- (void)stopLocationUpdateInterestDescriptionUpdates
{
}

- (void)performAfterLocationPromptIsShown:(id)a3
{
}

- (void)startNearestWaypointUpdatesWithHandler:(id)a3
{
}

- (void)stopNearestWaypointUpdates
{
}

- (void)startFurthestWaypointUpdatesWithHandler:(id)a3
{
}

- (void)stopFurthestWaypointUpdates
{
}

- (void)updateLocationManagerWithCurrentAuthorizationStatus
{
  objc_msgSend_updateLocationManagerWithCurrentAuthorizationStatus(self->_locationDelegate, a2, v2, v3);
}

- (NCLocation)location
{
  return (NCLocation *)objc_msgSend_location(self->_locationDelegate, a2, v2, v3);
}

- (NCAltitude)altitude
{
  if (supportAbsoluteAltimeterFeatures())
  {
    uint64_t v6 = self->_altitude;
  }
  else
  {
    objc_msgSend_altitude(self->_locationDelegate, v3, v4, v5);
    uint64_t v6 = (NCAltitude *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)paused
{
  return self->_externallyPaused;
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_externallyPaused != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "paused changed to: %d", (uint8_t *)v9, 8u);
    }

    self->_externallyPaused = v3;
    objc_msgSend__updateRunning(self, v6, v7, v8);
  }
}

- (void)setLocationUpdateShouldStart:(BOOL)a3
{
  self->_locationUpdateShouldStart = a3;
  objc_msgSend_setStartLocationUpdate_(self->_locationDelegate, a2, a3, v3);
}

- (void)setWaypointComplicationIsActive:(BOOL)a3
{
  if (self->_complicationStyle) {
    ((void (*)(NCLocationUpdateBaseDelegate *, char *, BOOL))MEMORY[0x270F9A6D0])(self->_locationDelegate, sel_setWaypointComplicationActive_, a3);
  }
}

- (void)activateWaypointComplication
{
  objc_msgSend_activateWaypointComplication(self->_locationDelegate, a2, v2, v3);
}

- (void)deactivateWaypointComplication
{
  objc_msgSend_deactivateWaypointComplication(self->_locationDelegate, a2, v2, v3);
}

- (void)setPaused:(BOOL)a3 forAltimeterToken:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (const char *)a4;
  altimeterPausedTokens = self->_altimeterPausedTokens;
  v19 = (char *)v6;
  if (v4)
  {
    objc_msgSend_addObject_(altimeterPausedTokens, v6, (uint64_t)v6, v7);
  }
  else if (objc_msgSend_containsObject_(altimeterPausedTokens, v6, (uint64_t)v6, v7))
  {
    objc_msgSend_removeObject_(self->_altimeterPausedTokens, v9, (uint64_t)v19, v11);
    objc_msgSend_objectForKeyedSubscript_(self->_altimeterUpdateHandlers, v12, (uint64_t)v19, v13);
    uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_altitude(self, v15, v16, v17);
    ((void (**)(void, void *))v14)[2](v14, v18);
  }
  objc_msgSend__updateAltimeterRunning(self, v9, v10, v11);
}

- (void)_updateRunning
{
  if (supportAbsoluteAltimeterFeatures())
  {
    objc_msgSend__updateAltimeterRunning(self, v3, v4, v5);
  }
}

- (id)_newAltimeter
{
  if (!objc_msgSend_isAbsoluteAltitudeAvailable(MEMORY[0x263F01710], a2, v2, v3)
    || objc_msgSend_authorizationStatus(MEMORY[0x263F01710], v4, v5, v6) != 3)
  {
    if (objc_msgSend_isAbsoluteAltitudeAvailable(MEMORY[0x263F01710], v4, v5, v6))
    {
      if (objc_msgSend_authorizationStatus(MEMORY[0x263F01710], v9, v10, v11) == 3) {
        return 0;
      }
      uint64_t v12 = NCLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_2375D81F8(v12, v13, v14, v15);
      }
    }
    else
    {
      uint64_t v12 = NCLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_2375D8288();
      }
    }

    return 0;
  }
  uint64_t v7 = NCLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_2375D81B8();
  }

  return objc_alloc_init(MEMORY[0x263F01710]);
}

- (void)_updateAltimeterRunning
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (objc_msgSend_showingIdealizedData(NCManager, a2, v2, v3))
  {
    objc_msgSend__queue_altimeterUpdate(self, v5, v6, v7);
  }
  else
  {
    uint64_t v28 = 0;
    v29[0] = &v28;
    v29[1] = 0x2020000000;
    v29[2] = 0;
    uint64_t v8 = objc_msgSend_allKeys(self->_altimeterUpdateHandlers, v5, v6, v7);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2375B2D4C;
    v27[3] = &unk_264CD58F0;
    v27[4] = self;
    v27[5] = &v28;
    objc_msgSend_enumerateObjectsUsingBlock_(v8, v9, (uint64_t)v27, v10);

    uint64_t v11 = NCLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_2375D82BC((uint64_t)v29, v11, v12, v13, v14, v15, v16, v17);
    }

    if (self->_runningAltimeter)
    {
      if (self->_externallyPaused || !*(void *)(v29[0] + 24))
      {
        uint64_t v21 = NCLogForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          BOOL externallyPaused = self->_externallyPaused;
          uint64_t v23 = *(void *)(v29[0] + 24);
          *(_DWORD *)buf = 134218240;
          BOOL v31 = externallyPaused;
          __int16 v32 = 2048;
          uint64_t v33 = v23;
          _os_log_impl(&dword_23759D000, v21, OS_LOG_TYPE_INFO, "stopping absolute altimeter updates. _externallyPaused: %lu, currentNumberOfClients: %lu", buf, 0x16u);
        }

        self->_runningAltimeter = 0;
        objc_msgSend_stopAbsoluteAltitudeUpdates(self->_altimeterManager, v24, v25, v26);
      }
    }
    else if (!self->_externallyPaused && *(void *)(v29[0] + 24))
    {
      self->_runningAltimeter = 1;
      objc_msgSend__startAbsoluteAltimeterUpdate(self, v18, v19, v20);
    }
    _Block_object_dispose(&v28, 8);
  }
}

- (void)_startAbsoluteAltimeterUpdate
{
  objc_initWeak(&location, self);
  uint64_t v3 = NCLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "starting absolute altimeter updates", buf, 2u);
  }

  altimeterManager = self->_altimeterManager;
  uint64_t v8 = objc_msgSend_mainQueue(MEMORY[0x263F08A48], v5, v6, v7);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2375B2ED4;
  v10[3] = &unk_264CD5918;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  objc_msgSend_startAbsoluteAltitudeUpdatesToQueue_withHandler_(altimeterManager, v9, (uint64_t)v8, (uint64_t)v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_queue_altimeterUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_altitude(self, v5, v6, v7);
  objc_msgSend_accuracy(v4, v9, v10, v11);
  if (v14 <= 490.0)
  {
    uint64_t v16 = objc_msgSend_initAltitude_(NCAltitude, v12, (uint64_t)v4, v13);
    objc_msgSend_setAltitude_(self, v22, v16, v23);
  }
  else
  {
    uint64_t v15 = NCLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_23759D000, v15, OS_LOG_TYPE_INFO, "altitude data is not available. reset the altitude and display dash in UI.", v33, 2u);
    }

    uint64_t v16 = 0;
    objc_msgSend_setAltitude_(self, v17, 0, v18);
  }
  if (v16 | v8)
  {
    BOOL v24 = !v8 && v16 != 0;
    BOOL v25 = v8 && v16 == 0;
    if (v25 || v24) {
      goto LABEL_18;
    }
    objc_msgSend_altitude((void *)v8, v19, v20, v21);
    double v27 = v26;
    objc_msgSend_altitude((void *)v16, v28, v29, v30);
    double v32 = v27 - v31;
    if (v32 < 0.0) {
      double v32 = -v32;
    }
    if (v32 > 2.22044605e-16) {
LABEL_18:
    }
      objc_msgSend__queue_altimeterUpdate(self, v19, v20, v21);
  }
}

- (void)_queue_altimeterUpdate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375B3120;
  block[3] = &unk_264CD5570;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_queue_altimeterError:(id)a3
{
  id v3 = a3;
  id v4 = NCLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_2375D8364();
  }

  uint64_t v8 = objc_msgSend_domain(v3, v5, v6, v7);
  uint64_t v9 = (void *)*MEMORY[0x263F01708];

  if (v8 == v9
    && (objc_msgSend_code(v3, v10, v11, v12) == 109
     || objc_msgSend_code(v3, v13, v14, v15) == 110
     || objc_msgSend_code(v3, v16, v17, v18) == 111
     || objc_msgSend_code(v3, v19, v20, v21) == 104
     || objc_msgSend_code(v3, v22, v23, v24) == 106
     || objc_msgSend_code(v3, v25, v26, v27) == 105))
  {
    uint64_t v28 = NCLogForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2375D8330();
    }
  }
}

- (BOOL)isTrueNorthError:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if (self->_usesTrueNorth) {
      int v8 = objc_msgSend_isLocationServiceOff(self->_locationDelegate, v4, v5, v6) ^ 1;
    }
    else {
      LOBYTE(v8) = 1;
    }
    if (objc_msgSend_code(v7, v4, v5, v6) == 102) {
      char v9 = v8 ^ 1;
    }
    else {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)setValueForBearing:(double)a3
{
}

- (void)clearValueForBearing
{
  objc_msgSend_removeObjectForKey_(self->_defaults, a2, @"Bearing", v2);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  isEqualToString = (const char *)a5;
  uint64_t v11 = isEqualToString;
  if (a6 == &off_264CD58A8)
  {
    uint64_t v33 = (char *)isEqualToString;
    isEqualToString = (const char *)objc_msgSend_isEqualToString_(a3, isEqualToString, @"Bearing", v10);
    uint64_t v11 = v33;
    if (isEqualToString)
    {
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v33, v33, *MEMORY[0x263F081B8], v12);
      uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
      char isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

      if (isEqual)
      {
        uint64_t v23 = 0;
        objc_msgSend_setBearing_(self, v21, 0, v22);
      }
      else
      {
        uint64_t v24 = [NCBearing alloc];
        objc_msgSend_doubleValue(v13, v25, v26, v27);
        uint64_t v23 = objc_msgSend_initWithBearing_(v24, v28, v29, v30);
        objc_msgSend_setBearing_(self, v31, (uint64_t)v23, v32);
      }

      uint64_t v11 = v33;
    }
  }

  MEMORY[0x270F9A758](isEqualToString, v11);
}

+ (BOOL)_showsElevationAccuracy
{
  if (qword_268921168 != -1) {
    dispatch_once(&qword_268921168, &unk_26EA48C80);
  }
  return byte_268921160;
}

- (void)start1HzMode:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v7 = objc_msgSend_containsObject_(self->_current1HzModes, v5, (uint64_t)v4, v6);
  int v8 = NCLogForCategory(3uLL);
  char v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_2375D83D8();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_allObjects(self->_current1HzModes, v10, v11, v12);
      uint64_t v16 = objc_msgSend_componentsJoinedByString_(v13, v14, @", ", v15);
      int v25 = 138543618;
      id v26 = v4;
      __int16 v27 = 2114;
      uint64_t v28 = v16;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "Requesting 1Hz location updates for %{public}@. 1Hz update modes before adding incoming mode: [%{public}@].", (uint8_t *)&v25, 0x16u);
    }
    objc_msgSend_addObject_(self->_current1HzModes, v17, (uint64_t)v4, v18);
    BOOL v22 = objc_msgSend_count(self->_current1HzModes, v19, v20, v21) != 0;
    objc_msgSend_setForce1Hz_(self->_locationDelegate, v23, v22, v24);
  }
}

- (void)end1HzMode:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (objc_msgSend_containsObject_(self->_current1HzModes, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_removeObject_(self->_current1HzModes, v7, (uint64_t)v4, v8);
    char v9 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_allObjects(self->_current1HzModes, v10, v11, v12);
      uint64_t v16 = objc_msgSend_componentsJoinedByString_(v13, v14, @", ", v15);
      int v24 = 138543618;
      id v25 = v4;
      __int16 v26 = 2114;
      __int16 v27 = v16;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "Dropping 1Hz location updates for %{public}@. 1Hz update modes after dropping incoming mode: [%{public}@].", (uint8_t *)&v24, 0x16u);
    }
    BOOL v20 = objc_msgSend_count(self->_current1HzModes, v17, v18, v19) != 0;
    objc_msgSend_setForce1Hz_(self->_locationDelegate, v21, v20, v22);
  }
  else
  {
    uint64_t v23 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_2375D8440();
    }
  }
}

- (void)fetchGroundAltitudeNearCurrentLocationWithCompletion:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v8 = objc_msgSend_altitude(self, v5, v6, v7);

  if (v8)
  {
    uint64_t v12 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_msgSend_altitude(self, v13, v14, v15);
      objc_msgSend_altitudeInMeters(v16, v17, v18, v19);
      int v60 = 134217984;
      uint64_t v61 = v20;
      _os_log_impl(&dword_23759D000, v12, OS_LOG_TYPE_DEFAULT, "Use altimeter altitude of %f meters for current location.", (uint8_t *)&v60, 0xCu);
    }
    uint64_t v21 = NSNumber;
    id v25 = objc_msgSend_altitude(self, v22, v23, v24);
    objc_msgSend_altitudeInMeters(v25, v26, v27, v28);
    uint64_t v32 = objc_msgSend_numberWithDouble_(v21, v29, v30, v31);
    v4[2](v4, v32);
  }
  else
  {
    uint64_t v33 = objc_msgSend_location(self, v9, v10, v11);
    uint64_t v37 = objc_msgSend_rawLocation(v33, v34, v35, v36);

    uint64_t v38 = NCLogForCategory(7uLL);
    v39 = v38;
    if (v37)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v43 = objc_msgSend_location(self, v40, v41, v42);
        v47 = objc_msgSend_rawLocation(v43, v44, v45, v46);
        int v60 = 134217984;
        uint64_t v61 = objc_msgSend_hash(v47, v48, v49, v50);
        _os_log_impl(&dword_23759D000, v39, OS_LOG_TYPE_INFO, "Fetching altitude for current location (%lu).", (uint8_t *)&v60, 0xCu);
      }
      v54 = objc_msgSend_location(self, v51, v52, v53);
      v58 = objc_msgSend_rawLocation(v54, v55, v56, v57);
      objc_msgSend_fetchGroundAltitudeNearLocation_completion_(self, v59, (uint64_t)v58, (uint64_t)v4);
    }
    else
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl(&dword_23759D000, v39, OS_LOG_TYPE_DEFAULT, "Asked to fetch altitude for current location, but we do not have a reading from the altimeter, nor do we have a location fix.", (uint8_t *)&v60, 2u);
      }

      v4[2](v4, 0);
    }
  }
}

- (void)fetchGroundAltitudeNearLocation:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend_verticalAccuracy(v6, v8, v9, v10);
  double v12 = v11;
  uint64_t v13 = NCLogForCategory(7uLL);
  uint64_t v14 = v13;
  if (v12 <= 0.0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v35 = 134217984;
      uint64_t v36 = objc_msgSend_hash(v6, v31, v32, v33);
      _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_INFO, "Fetching altitude for waypoint (%lu).", (uint8_t *)&v35, 0xCu);
    }

    objc_msgSend_fetchGroundAltitudeNearLocation_completion_(self->_locationDelegate, v34, (uint64_t)v6, (uint64_t)v7);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend_hash(v6, v15, v16, v17);
      objc_msgSend_altitude(v6, v19, v20, v21);
      int v35 = 134218240;
      uint64_t v36 = v18;
      __int16 v37 = 2048;
      uint64_t v38 = v22;
      _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "CLLocation instance for waypoint (%lu) already contains altitude of %f meters.", (uint8_t *)&v35, 0x16u);
    }

    uint64_t v23 = NSNumber;
    objc_msgSend_altitude(v6, v24, v25, v26);
    uint64_t v30 = objc_msgSend_numberWithDouble_(v23, v27, v28, v29);
    v7[2](v7, v30);

    uint64_t v7 = (void (**)(id, uint64_t))v30;
  }
}

- (NCHeading)heading
{
  return (NCHeading *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHeading:(id)a3
{
}

- (NCIncline)incline
{
  return (NCIncline *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIncline:(id)a3
{
}

- (BOOL)calibrated
{
  return self->_calibrated;
}

- (void)setCalibrated:(BOOL)a3
{
  self->_calibrated = a3;
}

- (void)setAltitude:(id)a3
{
}

- (BOOL)locationUpdateShouldStart
{
  return self->_locationUpdateShouldStart;
}

- (NCBearing)bearing
{
  return self->_bearing;
}

- (void)setBearing:(id)a3
{
}

- (BOOL)usesTrueNorth
{
  return self->_usesTrueNorth;
}

- (void)setUsesTrueNorth:(BOOL)a3
{
  self->_usesTrueNorth = a3;
}

- (NCBacktrackLocationDataSource)backtrackLocationDataSource
{
  return self->_backtrackLocationDataSource;
}

- (BOOL)waypointComplicationIsActive
{
  return self->_waypointComplicationIsActive;
}

- (NCLocationUpdateBaseDelegate)locationDelegate
{
  return self->_locationDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDelegate, 0);
  objc_storeStrong((id *)&self->_backtrackLocationDataSource, 0);
  objc_storeStrong((id *)&self->_bearing, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_incline, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_current1HzModes, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_altimeterPausedTokens, 0);
  objc_storeStrong((id *)&self->_altimeterUpdateHandlers, 0);

  objc_storeStrong((id *)&self->_altimeterManager, 0);
}

@end
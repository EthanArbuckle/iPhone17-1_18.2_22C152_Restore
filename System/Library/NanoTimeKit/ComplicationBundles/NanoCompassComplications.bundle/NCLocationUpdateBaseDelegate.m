@interface NCLocationUpdateBaseDelegate
+ (id)CLAuthorizationStatusToString:(int)a3;
- (BOOL)isLocationServiceOff;
- (BOOL)isPreciseLocationOff;
- (BOOL)isStationary;
- (BOOL)shouldForce1Hz;
- (BOOL)shouldStartLocationUpdate;
- (CLLocationManager)locationManager;
- (NCAltitude)altitude;
- (NCLocation)location;
- (NCLocationUpdateBaseDelegate)init;
- (double)cappedMaxDistanceInMeters;
- (double)getNearestWaypointDistance;
- (id)startLocationServiceUpdateWithHandler:(id)a3;
- (id)startLocationUpdatesWithHandler:(id)a3;
- (int)locationAuthorizationStatus;
- (int64_t)currentUpdateInterest;
- (int64_t)expectedInterest;
- (int64_t)initialInterest;
- (int64_t)motionType;
- (unint64_t)locationClientCount;
- (void)_adjustLocationUpdateInterest;
- (void)_idleTimerFired:(id)a3;
- (void)_invalidateIdleTimer;
- (void)_logCurrentLocation;
- (void)_notifyLocationUpdateHandlers;
- (void)_populateNearestAndFurthestWaypoints;
- (void)_resetLocationAndAltitude;
- (void)_setFurthestWaypoint:(id)a3 withDistance:(double)a4;
- (void)_setNearestWaypoint:(id)a3 withDistance:(double)a4;
- (void)_startIdleTimer;
- (void)_startLocationUpdatesWithInterest:(int64_t)a3;
- (void)_updateMotionType:(int64_t)a3 isDeviceStationary:(BOOL)a4;
- (void)dealloc;
- (void)endSession:(id)a3;
- (void)fetchGroundAltitudeNearLocation:(id)a3 completion:(id)a4;
- (void)fetchIsRemote:(id)a3;
- (void)fetchLocationsWithinInterval:(id)a3 completionHandler:(id)a4;
- (void)fetchLocationsWithinRadius:(double)a3 count:(int64_t)a4 taskIdentifier:(id)a5 completionHandler:(id)a6;
- (void)fetchSmoothedLocationsWithinInterval:(id)a3 completionHandler:(id)a4;
- (void)fetchWillPrompt:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)performAfterLocationPromptIsShown:(id)a3;
- (void)setCurrentUpdateInterest:(int64_t)a3;
- (void)setForce1Hz:(BOOL)a3;
- (void)setParkedCarWaypoint:(id)a3;
- (void)setStartLocationUpdate:(BOOL)a3;
- (void)setWaypoints:(id)a3;
- (void)startFurthestWaypointUpdatesWithHandler:(id)a3;
- (void)startLocationUpdateInterestDescriptionUpdatesWithHandler:(id)a3;
- (void)startMotionActivityUpdatesWithHandler:(id)a3;
- (void)startNearestWaypointUpdatesWithHandler:(id)a3;
- (void)startSession:(id)a3;
- (void)startSessionWithoutLookback:(id)a3;
- (void)stopFurthestWaypointUpdates;
- (void)stopLocationServiceUpdatesForToken:(id)a3;
- (void)stopLocationUpdateInterestDescriptionUpdates;
- (void)stopLocationUpdates;
- (void)stopLocationUpdatesForToken:(id)a3;
- (void)stopMotionActivityUpdates;
- (void)stopNearestWaypointUpdates;
- (void)updateLocation:(id)a3 error:(id)a4;
- (void)updateLocationManagerWithCurrentAuthorizationStatus;
@end

@implementation NCLocationUpdateBaseDelegate

- (NCLocationUpdateBaseDelegate)init
{
  v32.receiver = self;
  v32.super_class = (Class)NCLocationUpdateBaseDelegate;
  v2 = [(NCLocationUpdateBaseDelegate *)&v32 init];
  v3 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "init NCLocationUpdateBaseDelegate", (uint8_t *)buf, 2u);
  }

  if (v2)
  {
    v2[225] = 0;
    uint64_t v4 = objc_opt_new();
    v5 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v4;

    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v6;

    *((_DWORD *)v2 + 57) = 0;
    id v8 = objc_alloc(MEMORY[0x263F00A60]);
    uint64_t v10 = objc_msgSend_initWithEffectiveBundleIdentifier_delegate_onQueue_(v8, v9, @"com.apple.NanoCompass.watchkitapp", (uint64_t)v2, MEMORY[0x263EF83A0]);
    v11 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v10;

    objc_msgSend__setGroundAltitudeEnabled_(*((void **)v2 + 1), v12, 1, v13);
    uint64_t v14 = objc_opt_new();
    v15 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v14;

    v2[224] = 0;
    *((void *)v2 + 29) = objc_msgSend_initialInterest(v2, v16, v17, v18);
    uint64_t v22 = objc_msgSend_array(MEMORY[0x263EFF8C0], v19, v20, v21);
    v23 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v22;

    *(_OWORD *)(v2 + 136) = xmmword_2375DE1B0;
    *((_WORD *)v2 + 84) = 0;
    objc_initWeak(buf, v2);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_2375BF6E0;
    v29[3] = &unk_264CD5BC8;
    objc_copyWeak(&v30, buf);
    uint64_t v24 = MEMORY[0x237E1C4F0](v29);
    v25 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v24;

    dispatch_queue_t v26 = dispatch_queue_create("com.apple.NanoCompass.corelocation-fetch-queue", 0);
    v27 = (void *)*((void *)v2 + 27);
    *((void *)v2 + 27) = v26;

    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
  }
  return (NCLocationUpdateBaseDelegate *)v2;
}

- (void)dealloc
{
  objc_msgSend_pause(self->_rhythmicLocationUpdater, a2, v2, v3);
  objc_msgSend_invalidate(self->_rhythmicLocationUpdater, v5, v6, v7);
  rhythmicLocationUpdater = self->_rhythmicLocationUpdater;
  self->_rhythmicLocationUpdater = 0;

  objc_msgSend_pause(self->_defaultLocationUpdater, v9, v10, v11);
  objc_msgSend_invalidate(self->_defaultLocationUpdater, v12, v13, v14);
  defaultLocationUpdater = self->_defaultLocationUpdater;
  self->_defaultLocationUpdater = 0;

  id locationUpdateHandler = self->_locationUpdateHandler;
  self->_id locationUpdateHandler = 0;

  v17.receiver = self;
  v17.super_class = (Class)NCLocationUpdateBaseDelegate;
  [(NCLocationUpdateBaseDelegate *)&v17 dealloc];
}

- (BOOL)isStationary
{
  return objc_msgSend_isStationary(self->_motionClassificationManager, a2, v2, v3);
}

- (int64_t)motionType
{
  return objc_msgSend_motionType(self->_motionClassificationManager, a2, v2, v3);
}

- (void)setForce1Hz:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"Do not force";
    if (v3) {
      uint64_t v6 = @"Force";
    }
    int v10 = 136315394;
    uint64_t v11 = "-[NCLocationUpdateBaseDelegate setForce1Hz:]";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ 1Hz updates.", (uint8_t *)&v10, 0x16u);
  }

  if (self->_force1Hz != v3)
  {
    self->_force1Hz = v3;
    objc_msgSend__adjustLocationUpdateInterest(self, v7, v8, v9);
  }
}

- (double)getNearestWaypointDistance
{
  location = self->_location;
  if (!location) {
    return INFINITY;
  }
  uint64_t v6 = objc_msgSend_rawLocation(location, a2, v2, v3);
  if (!v6) {
    return INFINITY;
  }
  nearestWaypoint = self->_nearestWaypoint;

  if (!nearestWaypoint) {
    return INFINITY;
  }
  uint64_t v11 = objc_msgSend_rawLocation(self->_location, v8, v9, v10);
  v15 = objc_msgSend_location(self->_nearestWaypoint, v12, v13, v14);
  objc_msgSend_distanceFromLocation_(v11, v16, (uint64_t)v15, v17);
  double v19 = v18;

  return v19;
}

- (double)cappedMaxDistanceInMeters
{
  if (qword_2689213A0 != -1) {
    dispatch_once(&qword_2689213A0, &unk_26EA48DA0);
  }
  uint64_t v4 = objc_msgSend_shared(_TtC24NanoCompassComplications21UnitLengthPreferences, a2, v2, v3);
  int v8 = objc_msgSend_usesMetric(v4, v5, v6, v7);

  double result = *(double *)&qword_268921398;
  if (v8) {
    return 80000.0;
  }
  return result;
}

- (void)_populateNearestAndFurthestWaypoints
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  int v8 = objc_msgSend_initWithArray_copyItems_(v3, v4, (uint64_t)self->_waypoints, 1);
  location = self->_location;
  double v10 = 0.0;
  if (!location) {
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend_rawLocation(location, v5, v6, v7);
  v15 = v11;
  if (v11) {
    BOOL v16 = v8 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {

LABEL_8:
    v25 = 0;
LABEL_9:
    uint64_t v17 = 0;
    double v18 = INFINITY;
    goto LABEL_10;
  }
  v25 = objc_msgSend_count(v8, v12, v13, v14);

  if (!v25) {
    goto LABEL_9;
  }
  objc_msgSend_cappedMaxDistanceInMeters(self, v5, v6, v7);
  double v30 = v29;
  parkedCarWaypoint = self->_parkedCarWaypoint;
  if (parkedCarWaypoint)
  {
    objc_super v32 = objc_msgSend_location(parkedCarWaypoint, v26, v27, v28);

    if (v32)
    {
      v36 = objc_msgSend_rawLocation(self->_location, v33, v34, v35);
      v40 = objc_msgSend_location(self->_parkedCarWaypoint, v37, v38, v39);
      objc_msgSend_distanceFromLocation_(v36, v41, (uint64_t)v40, v42);
      double v44 = v43;

      v45 = [NCWaypointWithDistance alloc];
      v48 = objc_msgSend_initWithWaypoint_distance_(v45, v46, (uint64_t)self->_parkedCarWaypoint, v47, v44);
      objc_msgSend_insertObject_atIndex_(v8, v49, (uint64_t)v48, 0);
    }
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v50 = v8;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v77, (uint64_t)v81, 16);
  if (v52)
  {
    uint64_t v56 = v52;
    v25 = 0;
    uint64_t v17 = 0;
    uint64_t v57 = *(void *)v78;
    double v10 = 0.0;
    double v18 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v78 != v57) {
          objc_enumerationMutation(v50);
        }
        v59 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        objc_msgSend_distance(v59, v53, v54, v55, (void)v77);
        if (v60 < v30)
        {
          double v61 = v60;
          if (v60 < v18)
          {
            uint64_t v62 = objc_msgSend_waypoint(v59, v53, v54, v55);

            uint64_t v17 = (void *)v62;
            double v18 = v61;
          }
          if (v61 > v10)
          {
            uint64_t v63 = objc_msgSend_waypoint(v59, v53, v54, v55);

            v25 = (void *)v63;
            double v10 = v61;
          }
        }
      }
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v77, (uint64_t)v81, 16);
    }
    while (v56);
  }
  else
  {
    v25 = 0;
    uint64_t v17 = 0;
    double v10 = 0.0;
    double v18 = INFINITY;
  }

LABEL_10:
  if (self->_nearestNeedsResend) {
    goto LABEL_40;
  }
  nearestWaypoint = self->_nearestWaypoint;
  if (!nearestWaypoint)
  {
    if (v17) {
      goto LABEL_40;
    }
  }
  if (nearestWaypoint && !v17) {
    goto LABEL_40;
  }
  uint64_t v20 = objc_msgSend_uuid(nearestWaypoint, v5, v6, v7, (void)v77);
  uint64_t v24 = objc_msgSend_uuid(v17, v21, v22, v23);
  if (v20 != v24)
  {

LABEL_40:
    objc_msgSend__setNearestWaypoint_withDistance_(self, v5, (uint64_t)v17, v7, v18, (void)v77);
    int v67 = 1;
    goto LABEL_41;
  }
  double v64 = self->_shortestDistance - v18;
  if (v64 >= 0.0) {
    double v65 = self->_shortestDistance - v18;
  }
  else {
    double v65 = -v64;
  }

  if (v65 > 15.0) {
    goto LABEL_40;
  }
  int v67 = 0;
LABEL_41:
  if (!self->_furthestNeedsResend)
  {
    furthestWaypoint = self->_furthestWaypoint;
    if ((furthestWaypoint || !v25) && (!furthestWaypoint || v25))
    {
      v69 = objc_msgSend_uuid(furthestWaypoint, v5, v66, v7);
      v73 = objc_msgSend_uuid(v25, v70, v71, v72);
      if (v69 == v73)
      {
        double v74 = self->_furthestDistance - v10;
        if (v74 >= 0.0) {
          double v75 = self->_furthestDistance - v10;
        }
        else {
          double v75 = -v74;
        }

        if (v75 <= 15.0)
        {
          if (!v67) {
            goto LABEL_54;
          }
          goto LABEL_53;
        }
      }
      else
      {
      }
    }
  }
  objc_msgSend__setFurthestWaypoint_withDistance_(self, v5, (uint64_t)v25, v7, v10);
LABEL_53:
  objc_msgSend__adjustLocationUpdateInterest(self, v5, v76, v7);
LABEL_54:
}

- (void)_setNearestWaypoint:(id)a3 withDistance:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_nearestWaypoint, a3);
  self->_double shortestDistance = a4;
  id nearestWaypointHandler = self->_nearestWaypointHandler;
  uint64_t v9 = NCLogForCategory(7uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (nearestWaypointHandler)
  {
    if (v10)
    {
      nearestWaypoint = self->_nearestWaypoint;
      double shortestDistance = self->_shortestDistance;
      *(_DWORD *)buf = 136315650;
      v15 = "-[NCLocationUpdateBaseDelegate _setNearestWaypoint:withDistance:]";
      __int16 v16 = 2112;
      uint64_t v17 = nearestWaypoint;
      __int16 v18 = 2048;
      double v19 = shortestDistance;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "%s nearest waypoint is changed to %@ distance: %f", buf, 0x20u);
    }

    self->_nearestNeedsResend = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375BFF68;
    block[3] = &unk_264CD5570;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "_nearestWaypointHandler is nil. Can't update UI with nearest waypoint", buf, 2u);
    }

    self->_nearestNeedsResend = 1;
  }
}

- (void)_setFurthestWaypoint:(id)a3 withDistance:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_furthestWaypoint, a3);
  self->_double furthestDistance = a4;
  id furthestWaypointHandler = self->_furthestWaypointHandler;
  uint64_t v9 = NCLogForCategory(7uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (furthestWaypointHandler)
  {
    if (v10)
    {
      furthestWaypoint = self->_furthestWaypoint;
      double furthestDistance = self->_furthestDistance;
      *(_DWORD *)buf = 136315650;
      v15 = "-[NCLocationUpdateBaseDelegate _setFurthestWaypoint:withDistance:]";
      __int16 v16 = 2112;
      uint64_t v17 = furthestWaypoint;
      __int16 v18 = 2048;
      double v19 = furthestDistance;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "%s furthest waypoint is changed to %@  distance: %f", buf, 0x20u);
    }

    self->_furthestNeedsResend = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375C0124;
    block[3] = &unk_264CD5570;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "_furthestWaypointHandler is nil. Can't update UI with furthest waypoint", buf, 2u);
    }

    self->_furthestNeedsResend = 1;
  }
}

- (void)startNearestWaypointUpdatesWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x237E1C4F0]();
  id nearestWaypointHandler = self->_nearestWaypointHandler;
  self->_id nearestWaypointHandler = v5;

  id v7 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    nearestWaypoint = self->_nearestWaypoint;
    double shortestDistance = self->_shortestDistance;
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[NCLocationUpdateBaseDelegate startNearestWaypointUpdatesWithHandler:]";
    __int16 v15 = 2112;
    __int16 v16 = nearestWaypoint;
    __int16 v17 = 2048;
    double v18 = shortestDistance;
    _os_log_impl(&dword_23759D000, v7, OS_LOG_TYPE_DEFAULT, "%s nearest waypoint is changed to %@ distance: %f", buf, 0x20u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2375C0298;
  v11[3] = &unk_264CD58C8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

- (void)stopNearestWaypointUpdates
{
  self->_id nearestWaypointHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void)startFurthestWaypointUpdatesWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x237E1C4F0](a3, a2);
  id furthestWaypointHandler = self->_furthestWaypointHandler;
  self->_id furthestWaypointHandler = v4;

  uint64_t v6 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[NCLocationUpdateBaseDelegate startFurthestWaypointUpdatesWithHandler:]";
    _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__populateNearestAndFurthestWaypoints(self, v7, v8, v9);
}

- (void)stopFurthestWaypointUpdates
{
  self->_id furthestWaypointHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void)setWaypoints:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    __int16 v17 = "-[NCLocationUpdateBaseDelegate setWaypoints:]";
    __int16 v18 = 2048;
    uint64_t v19 = objc_msgSend_count(v4, v6, v7, v8);
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s %lu waypoints are set", (uint8_t *)&v16, 0x16u);
  }

  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v11 = (NSArray *)objc_msgSend_initWithArray_copyItems_(v9, v10, (uint64_t)v4, 1);
  waypoints = self->_waypoints;
  self->_waypoints = v11;

  objc_msgSend__populateNearestAndFurthestWaypoints(self, v13, v14, v15);
}

- (void)setParkedCarWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_parkedCarWaypoint, a3);

  objc_msgSend__populateNearestAndFurthestWaypoints(self, v4, v5, v6);
}

- (id)startLocationUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_tokenWithValue_(NCManagerLocationToken, v5, self->_locationToken, v6);
  ++self->_locationToken;
  uint64_t v8 = (void *)MEMORY[0x237E1C4F0](v4);
  objc_msgSend_setObject_forKeyedSubscript_(self->_locationUpdateHandlers, v9, (uint64_t)v8, (uint64_t)v7);

  objc_msgSend_updateLocationManagerWithCurrentAuthorizationStatus(self, v10, v11, v12);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2375C05DC;
  v15[3] = &unk_264CD58C8;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v15);

  return v7;
}

- (void)stopLocationUpdatesForToken:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend_removeObjectForKey_(self->_locationUpdateHandlers, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_count(self->_locationUpdateHandlers, v5, v6, v7);
  if (!self->_startLocationUpdate || v8 == 0)
  {
    uint64_t v13 = v8;
    uint64_t v14 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[NCLocationUpdateBaseDelegate stopLocationUpdatesForToken:]";
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "%s Stopping location update (Number of clients? %lu).", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend_stopLocationUpdates(self, v15, v16, v17);
  }
  objc_msgSend__invalidateIdleTimer(self, v9, v10, v11);
}

- (id)startLocationServiceUpdateWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_tokenWithValue_(NCManagerLocationServiceToken, v5, self->_locationServiceToken, v6);
  ++self->_locationServiceToken;
  uint64_t v8 = (void *)MEMORY[0x237E1C4F0](v4);
  objc_msgSend_setObject_forKeyedSubscript_(self->_locationServiceUpdateHandlers, v9, (uint64_t)v8, (uint64_t)v7);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2375C07E8;
  v12[3] = &unk_264CD5BF0;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v12);

  return v7;
}

- (void)stopLocationServiceUpdatesForToken:(id)a3
{
  objc_msgSend_removeObjectForKey_(self->_locationServiceUpdateHandlers, a2, (uint64_t)a3, v3);
}

- (void)startLocationUpdateInterestDescriptionUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x237E1C4F0]();
  id locationInterestDescriptionHandler = self->_locationInterestDescriptionHandler;
  self->_id locationInterestDescriptionHandler = v5;

  uint64_t updated = objc_msgSend_currentUpdateInterest(self, v7, v8, v9);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2375C0928;
  v12[3] = &unk_264CD5C18;
  id v13 = v4;
  uint64_t v14 = updated;
  id v11 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

- (void)stopLocationUpdateInterestDescriptionUpdates
{
  self->_id locationInterestDescriptionHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void)startMotionActivityUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x237E1C4F0]();
  id motionActivityHandler = self->_motionActivityHandler;
  self->_id motionActivityHandler = v5;

  uint64_t v7 = (void *)MEMORY[0x263F01778];
  uint64_t v11 = objc_msgSend_motionType(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_NCMotionTypeToString_(v7, v12, v11, v13);
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2375C0A88;
  v17[3] = &unk_264CD5C40;
  objc_copyWeak(&v20, &location);
  id v18 = v14;
  id v19 = v4;
  id v15 = v14;
  id v16 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)stopMotionActivityUpdates
{
  self->_id motionActivityHandler = 0;
  MEMORY[0x270F9A758]();
}

- (unint64_t)locationClientCount
{
  return objc_msgSend_count(self->_locationUpdateHandlers, a2, v2, v3);
}

- (void)startSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_continuous_time();
  uint64_t v6 = NCLogForCategory(5uLL);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Starting CL/CR Session", "", buf, 2u);
  }

  *(void *)buf = 0;
  double v29 = buf;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2375C0D38;
  v21[3] = &unk_264CD5C68;
  v25 = buf;
  uint64_t v26 = v5;
  uint64_t v10 = v9;
  os_signpost_id_t v27 = v7;
  uint64_t v22 = v10;
  uint64_t v23 = self;
  id v11 = v4;
  id v24 = v11;
  uint64_t v12 = (void *)MEMORY[0x237E1C4F0](v21);
  uint64_t v13 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_23759D000, v13, OS_LOG_TYPE_DEFAULT, "Starting core location session.", v20, 2u);
  }

  locationManager = self->_locationManager;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2375C0F74;
  v18[3] = &unk_264CD5C90;
  id v15 = v12;
  id v19 = v15;
  objc_msgSend_startTranscriptSessionWithCompletion_(locationManager, v16, (uint64_t)v18, v17);

  _Block_object_dispose(buf, 8);
}

- (void)startSessionWithoutLookback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_continuous_time();
  uint64_t v6 = NCLogForCategory(5uLL);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Starting CL/CR Session (without lookback)", "", buf, 2u);
  }

  *(void *)buf = 0;
  double v29 = buf;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2375C11BC;
  v21[3] = &unk_264CD5C68;
  v25 = buf;
  uint64_t v26 = v5;
  uint64_t v10 = v9;
  os_signpost_id_t v27 = v7;
  uint64_t v22 = v10;
  uint64_t v23 = self;
  id v11 = v4;
  id v24 = v11;
  uint64_t v12 = (void *)MEMORY[0x237E1C4F0](v21);
  uint64_t v13 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_23759D000, v13, OS_LOG_TYPE_DEFAULT, "Starting core location session (without lookback).", v20, 2u);
  }

  locationManager = self->_locationManager;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2375C13F8;
  v18[3] = &unk_264CD5C90;
  id v15 = v12;
  id v19 = v15;
  objc_msgSend_startTranscriptSessionInstantlyWithCompletion_(locationManager, v16, (uint64_t)v18, v17);

  _Block_object_dispose(buf, 8);
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_continuous_time();
  uint64_t v6 = NCLogForCategory(5uLL);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Ending CL/CR session", "", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2375C1584;
  v16[3] = &unk_264CD5CB8;
  uint64_t v20 = v5;
  os_signpost_id_t v21 = v7;
  uint64_t v17 = v9;
  id v18 = self;
  id v19 = v4;
  id v10 = v4;
  id v11 = v9;
  uint64_t v12 = (void *)MEMORY[0x237E1C4F0](v16);
  uint64_t v13 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_2375D90B8();
  }

  objc_msgSend_endTranscriptSessionWithCompletion_(self->_locationManager, v14, (uint64_t)v12, v15);
}

- (void)fetchLocationsWithinRadius:(double)a3 count:(int64_t)a4 taskIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v11 = a6;
  uint64_t v15 = objc_msgSend_rawLocation(self->_location, v12, v13, v14);
  if (v15)
  {
    uint64_t v16 = mach_continuous_time();
    uint64_t v17 = NCLogForCategory(5uLL);
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    id v19 = v17;
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_signpost_emit_with_name_impl(&dword_23759D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Begin CL/CR transcript fetch", "(task: %{public}@)", buf, 0xCu);
    }

    objc_msgSend_coordinate(v15, v21, v22, v23);
    double v25 = v24;
    double v27 = v26;
    uint64_t v28 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v55 = v10;
      _os_log_impl(&dword_23759D000, v28, OS_LOG_TYPE_DEFAULT, "Fetching %ld locations within %.0fm of current location (task: %{public}@).", buf, 0x20u);
    }

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v55 = sub_2375C1B30;
    uint64_t v56 = sub_2375C1B40;
    id v57 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    char v53 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_2375C1B30;
    v50[4] = sub_2375C1B40;
    id v51 = (id)objc_opt_new();
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_2375C1B48;
    v41[3] = &unk_264CD5CE0;
    v45 = v50;
    v46 = v52;
    uint64_t v48 = v16;
    double v29 = v20;
    uint64_t v42 = v29;
    os_signpost_id_t v49 = v18;
    double v43 = v10;
    id v44 = v11;
    uint64_t v47 = buf;
    uint64_t v30 = (void *)MEMORY[0x237E1C4F0](v41);
    uint64_t v32 = objc_msgSend_historicalUpdaterWithCenter_radius_dateInterval_sampleCount_queue_handler_(self->_locationManager, v31, 0, a4, self->_clFetchQueue, v30, v25, v27, a3);
    v33 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v32;

    objc_msgSend_resume(*(void **)(*(void *)&buf[8] + 40), v34, v35, v36);
    _Block_object_dispose(v50, 8);

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v37 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_23759D000, v37, OS_LOG_TYPE_DEFAULT, "Asked to fetch locations, but we have no current location (task: %{public}@).", buf, 0xCu);
    }

    double v29 = objc_msgSend_nc_currentLocationUnknownError(MEMORY[0x263F087E8], v38, v39, v40);
    (*((void (**)(id, void, NSObject *))v11 + 2))(v11, MEMORY[0x263EFFA68], v29);
  }
}

- (void)fetchLocationsWithinInterval:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = mach_continuous_time();
  uint64_t v9 = NCLogForCategory(8uLL);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Begin CL/CR transcript fetch (interval)", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = NCLogForCategory(8uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23759D000, v13, OS_LOG_TYPE_DEFAULT, "Fetching locations within %{public}@.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = sub_2375C1B30;
  uint64_t v38 = sub_2375C1B40;
  id v39 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_2375C1B30;
  v31[4] = sub_2375C1B40;
  id v32 = (id)objc_opt_new();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2375C2224;
  v23[3] = &unk_264CD5D08;
  double v26 = v31;
  double v27 = v33;
  uint64_t v29 = v8;
  uint64_t v14 = v12;
  double v24 = v14;
  os_signpost_id_t v30 = v10;
  id v15 = v7;
  id v25 = v15;
  p_long long buf = &buf;
  uint64_t v16 = (void *)MEMORY[0x237E1C4F0](v23);
  uint64_t v18 = objc_msgSend_historicalUpdaterWithDateInterval_sampleCount_queue_handler_(self->_locationManager, v17, (uint64_t)v6, 10, self->_clFetchQueue, v16);
  id v19 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v18;

  objc_msgSend_resume(*(void **)(*((void *)&buf + 1) + 40), v20, v21, v22);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)fetchSmoothedLocationsWithinInterval:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_authorizationStatusForBundlePath_(MEMORY[0x263F00A60], v8, @"/System/Library/LocationBundles/AppleWatchWorkout.bundle", v9)- 3 >= 2)
  {
    double v27 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23759D000, v27, OS_LOG_TYPE_DEFAULT, "Workouts is not authorized to use location; unable to fetch smoothed locations.",
        buf,
        2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x263EFFA68], 0);
  }
  else
  {
    uint64_t v10 = mach_continuous_time();
    id v11 = NCLogForCategory(5uLL);
    os_signpost_id_t v12 = os_signpost_id_generate(v11);
    uint64_t v13 = v11;
    uint64_t v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23759D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Begin CL/CR smoothed fetch", "", buf, 2u);
    }

    id v15 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      id v39 = v6;
      _os_log_impl(&dword_23759D000, v15, OS_LOG_TYPE_INFO, "Fetching smoothed locations within %{public}@.", buf, 0xCu);
    }

    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    os_signpost_id_t v30 = sub_2375C278C;
    char v31 = &unk_264CD5D30;
    uint64_t v35 = v10;
    uint64_t v16 = v14;
    id v32 = v16;
    os_signpost_id_t v36 = v12;
    id v17 = v6;
    id v33 = v17;
    id v34 = v7;
    uint64_t v18 = (void *)MEMORY[0x237E1C4F0](&v28);
    locationSmoother = self->_locationSmoother;
    p_locationSmoother = &self->_locationSmoother;
    uint64_t v20 = locationSmoother;
    uint64_t v22 = locationSmoother;
    if (!locationSmoother) {
      uint64_t v22 = objc_opt_new();
    }
    objc_storeStrong((id *)p_locationSmoother, v22);
    id v24 = v22;
    if (!v20) {

    }
    id v37 = v17;
    id v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, (uint64_t)&v37, 1, v28, v29, v30, v31);
    objc_msgSend_smoothLocations_workoutActivityType_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v24, v26, 0, 52, 0, v25, v18);
  }
}

- (void)fetchIsRemote:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v8 = objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.NanoCompass", v7);
  if (objc_msgSend_BOOLForKey_(v8, v9, @"simulateRemoteStatus", v10))
  {
    uint64_t v14 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "Internal default for simulateRemoteStatus is set to YES; isRemote will return YES.",
        buf,
        2u);
    }

    v4[2](v4, 1);
  }
  else if (objc_msgSend_isLocationServiceOff(self, v11, v12, v13))
  {
    id v15 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_2375D9198();
    }

    v4[2](v4, 0);
  }
  else
  {
    uint64_t v16 = mach_continuous_time();
    id v17 = NCLogForCategory(5uLL);
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    id v19 = v17;
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23759D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Begin CL/CR is remote fetch", "", buf, 2u);
    }

    uint64_t v21 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_2375D91CC();
    }

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_2375C2C98;
    uint64_t v29 = &unk_264CD5D58;
    uint64_t v32 = v16;
    os_signpost_id_t v33 = v18;
    os_signpost_id_t v30 = v20;
    char v31 = v4;
    uint64_t v22 = v20;
    uint64_t v23 = (void *)MEMORY[0x237E1C4F0](&v26);
    objc_msgSend_isConsideredInRemoteAreaWithCompletion_(self->_locationManager, v24, (uint64_t)v23, v25, v26, v27, v28, v29);
  }
}

- (void)fetchWillPrompt:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v8 = objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.NanoCompass", v7);
  if (objc_msgSend_BOOLForKey_(v8, v9, @"simulateRemoteStatus", v10))
  {
    uint64_t v14 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "Internal default for simulateRemoteStatus is set to YES; willPrompt will return YES.",
        buf,
        2u);
    }

    v4[2](v4, 1);
  }
  else if (objc_msgSend_isLocationServiceOff(self, v11, v12, v13))
  {
    id v15 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_2375D92E0();
    }

    v4[2](v4, 0);
  }
  else
  {
    uint64_t v16 = mach_continuous_time();
    id v17 = NCLogForCategory(5uLL);
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    id v19 = v17;
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23759D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Begin CL/CR will prompt fetch", "", buf, 2u);
    }

    uint64_t v21 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_2375D9314();
    }

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_2375C30B4;
    uint64_t v29 = &unk_264CD5D58;
    uint64_t v32 = v16;
    os_signpost_id_t v33 = v18;
    os_signpost_id_t v30 = v20;
    char v31 = v4;
    uint64_t v22 = v20;
    uint64_t v23 = (void *)MEMORY[0x237E1C4F0](&v26);
    objc_msgSend_willPromptForTranscriptSessionWithCompletion_(self->_locationManager, v24, (uint64_t)v23, v25, v26, v27, v28, v29);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_authorizationStatus(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend__limitsPrecision(v4, v9, v10, v11);
  self->_locationAuthorizationStatus = v8;
  uint64_t v13 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend_CLAuthorizationStatusToString_(NCLocationUpdateBaseDelegate, v14, self->_locationAuthorizationStatus, v15);
    int v20 = objc_msgSend__limitsPrecision(v4, v17, v18, v19);
    uint64_t v21 = @"Precise";
    if (v20) {
      uint64_t v21 = @"Coarse";
    }
    uint64_t v22 = @"NOT determined";
    *(_DWORD *)long long buf = 138543874;
    uint64_t v38 = v16;
    uint64_t v40 = v21;
    __int16 v39 = 2112;
    if (v8) {
      uint64_t v22 = @"determined";
    }
    __int16 v41 = 2112;
    uint64_t v42 = v22;
    _os_log_impl(&dword_23759D000, v13, OS_LOG_TYPE_DEFAULT, "Received updated auth status of %{public}@. %@ location is used. Authorization status is %@{public}@.", buf, 0x20u);
  }
  uint64_t v23 = [NCLocationServiceUpdate alloc];
  uint64_t v25 = objc_msgSend_initWithAuthorizationStatus_coarsePrecision_(v23, v24, v8, v12);
  locationServiceUpdateHandlers = self->_locationServiceUpdateHandlers;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_2375C3488;
  v35[3] = &unk_264CD5D80;
  id v27 = v25;
  id v36 = v27;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(locationServiceUpdateHandlers, v28, (uint64_t)v35, v29);
  locationPromptShownAction = (void (**)(void))self->_locationPromptShownAction;
  if (locationPromptShownAction)
  {
    LODWORD(v8) = v8 != 0;
    if (self->_authorizationStatusDetermined != v8)
    {
      locationPromptShownAction[2]();
      id v34 = self->_locationPromptShownAction;
      self->_locationPromptShownAction = 0;
    }
  }
  else
  {
    LOBYTE(v8) = v8 != 0;
  }
  self->_authorizationStatusDetermined = v8;
  objc_msgSend_updateLocationManagerWithCurrentAuthorizationStatus(self, v30, v31, v32);
}

- (void)performAfterLocationPromptIsShown:(id)a3
{
  if (self->_authorizationStatusDetermined)
  {
    uint64_t v3 = (void (*)(id))*((void *)a3 + 2);
    v3(a3);
  }
  else
  {
    self->_locationPromptShownAction = (id)MEMORY[0x237E1C4F0](a3, a2);
    MEMORY[0x270F9A758]();
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[NCLocationUpdateBaseDelegate locationManager:didFailWithError:]";
    _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "%s Unexpected call to CLLocationManagerDelegate.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_updateLocation_error_(self, v7, 0, (uint64_t)v5);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[NCLocationUpdateBaseDelegate locationManager:didUpdateLocations:]";
    _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "%s Unexpected call to CLLocationManagerDelegate.", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v10 = objc_msgSend_lastObject(v5, v7, v8, v9);

  objc_msgSend_updateLocation_error_(self, v11, (uint64_t)v10, 0);
}

- (void)updateLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_domain(v7, v8, v9, v10);
  int v12 = (void *)*MEMORY[0x263F00AF8];

  if (v11 != v12) {
    goto LABEL_2;
  }
  if (objc_msgSend_code(v7, v13, v14, v15) == 1)
  {
    uint64_t v16 = NCLogForCategory(3uLL);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    __int16 v46 = 0;
    id v24 = "CoreLocation has given us a denied error.";
    uint64_t v25 = (uint8_t *)&v46;
LABEL_17:
    _os_log_impl(&dword_23759D000, v16, OS_LOG_TYPE_INFO, v24, v25, 2u);
    goto LABEL_27;
  }
  if (!objc_msgSend_code(v7, v21, v22, v23))
  {
    uint64_t v16 = NCLogForCategory(3uLL);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    *(_WORD *)long long buf = 0;
    id v24 = "CoreLocation has given us a location unknown error.";
    uint64_t v25 = buf;
    goto LABEL_17;
  }
LABEL_2:
  uint64_t v16 = objc_msgSend_rawLocation(self->_location, v13, v14, v15);
  if (objc_msgSend_isEqual_(v6, v17, (uint64_t)v16, v18))
  {
    int v20 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v44 = 0;
      _os_log_impl(&dword_23759D000, v20, OS_LOG_TYPE_INFO, "Avoid processing previous location again.", v44, 2u);
    }
  }
  else
  {
    int v20 = objc_msgSend_locationWithLocation_error_(NCLocation, v19, (uint64_t)v6, (uint64_t)v7);
    int isBetterThan_withStaleTimeThreshold = objc_msgSend_isBetterThan_withStaleTimeThreshold_(v20, v26, (uint64_t)self->_location, v27, 180.0);
    if (isBetterThan_withStaleTimeThreshold)
    {
      uint64_t v29 = NCLogForCategory(3uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_2375D945C();
      }

      objc_storeStrong((id *)&self->_location, v20);
    }
    if (supportAbsoluteAltimeterFeatures())
    {
      int v33 = 0;
    }
    else
    {
      id v34 = objc_msgSend_altitudeWithLocation_error_(NCAltitude, v30, (uint64_t)v6, (uint64_t)v7);
      int v33 = objc_msgSend_isBetterThan_withStaleTimeThreshold_(v34, v35, (uint64_t)self->_altitude, v36, 180.0);
      if (v33)
      {
        id v37 = NCLogForCategory(3uLL);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_2375D9428();
        }

        objc_storeStrong((id *)&self->_altitude, v34);
      }
    }
    if ((isBetterThan_withStaleTimeThreshold | v33) == 1) {
      objc_msgSend__notifyLocationUpdateHandlers(self, v30, v31, v32);
    }
    objc_msgSend__populateNearestAndFurthestWaypoints(self, v30, v31, v32);
    objc_msgSend__adjustLocationUpdateInterest(self, v38, v39, v40);
    objc_msgSend__logCurrentLocation(self, v41, v42, v43);
  }

LABEL_27:
}

- (void)_notifyLocationUpdateHandlers
{
  locationUpdateHandlers = self->_locationUpdateHandlers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2375C39F8;
  v4[3] = &unk_264CD5DA8;
  v4[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(locationUpdateHandlers, a2, (uint64_t)v4, v2);
}

- (void)_logCurrentLocation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (NanoCompassIsInternalBuild())
  {
    id location = self->_location;
    if (location)
    {
      if (self->_locationLogTimestamp)
      {
        id v7 = objc_msgSend_now(MEMORY[0x263EFF910], v3, v4, v5);
        objc_msgSend_timeIntervalSinceDate_(v7, v8, (uint64_t)self->_locationLogTimestamp, v9);
        double v11 = v10;

        if (v11 <= 30.0) {
          return;
        }
        id location = self->_location;
      }
      objc_msgSend_reportedTimestamp(location, v3, v4, v5);
      int v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
      locationLogTimestamp = self->_locationLogTimestamp;
      self->_locationLogTimestamp = v12;

      uint64_t v14 = NCLogForCategory(3uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = self->_location;
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "Received updated location: %@.", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)_startLocationUpdatesWithInterest:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_startLocationUpdate)
  {
    unint64_t v5 = (a3 + 1) & 0xFFFFFFFFFFFFFFFDLL;
    id v6 = NCLogForCategory(3uLL);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        if ((unint64_t)(a3 + 1) > 2) {
          uint64_t v8 = @"Unknown";
        }
        else {
          uint64_t v8 = off_264CD5E38[a3 + 1];
        }
        int v25 = 136315394;
        uint64_t v26 = "-[NCLocationUpdateBaseDelegate _startLocationUpdatesWithInterest:]";
        __int16 v27 = 2114;
        uint64_t v28 = v8;
        _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "%s Location update will not start due to invalid interest (%{public}@).", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      if (v7)
      {
        if ((unint64_t)(a3 + 1) > 2) {
          double v10 = @"Unknown";
        }
        else {
          double v10 = off_264CD5E38[a3 + 1];
        }
        int v25 = 136315394;
        uint64_t v26 = "-[NCLocationUpdateBaseDelegate _startLocationUpdatesWithInterest:]";
        __int16 v27 = 2114;
        uint64_t v28 = v10;
        _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "%s Interest? %{public}@.", (uint8_t *)&v25, 0x16u);
      }

      double v11 = NCLogForCategory(3uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_INFO, "Resume rhythmic configuration live updater.", (uint8_t *)&v25, 2u);
      }

      if (a3 <= 0)
      {
        defaultLocationUpdater = self->_defaultLocationUpdater;
        int v20 = NCLogForCategory(3uLL);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
        if (defaultLocationUpdater)
        {
          if (v21)
          {
            LOWORD(v25) = 0;
            _os_log_impl(&dword_23759D000, v20, OS_LOG_TYPE_INFO, "Rhythmic configuration live updater is all that is needed; pause default configuration live updater.",
              (uint8_t *)&v25,
              2u);
          }

          objc_msgSend_pause(self->_defaultLocationUpdater, v22, v23, v24);
        }
        else
        {
          if (v21)
          {
            LOWORD(v25) = 0;
            _os_log_impl(&dword_23759D000, v20, OS_LOG_TYPE_INFO, "Rhythmic configuration live updater is all that is needed.", (uint8_t *)&v25, 2u);
          }
        }
      }
      else
      {
        int v12 = NCLogForCategory(3uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_23759D000, v12, OS_LOG_TYPE_INFO, "Resume default configuration live updater.", (uint8_t *)&v25, 2u);
        }

        int v16 = self->_defaultLocationUpdater;
        if (!v16)
        {
          objc_msgSend_liveUpdaterWithConfiguration_queue_handler_(self->_locationManager, v13, 0, MEMORY[0x263EF83A0], self->_locationUpdateHandler);
          id v17 = (CLLocationUpdater *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = self->_defaultLocationUpdater;
          self->_defaultLocationUpdater = v17;

          int v16 = self->_defaultLocationUpdater;
        }
        objc_msgSend_resume(v16, v13, v14, v15);
      }
    }
  }
  else
  {
    uint64_t v9 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      uint64_t v26 = "-[NCLocationUpdateBaseDelegate _startLocationUpdatesWithInterest:]";
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "%s Location update should not start.", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)stopLocationUpdates
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[NCLocationUpdateBaseDelegate stopLocationUpdates]";
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend__invalidateIdleTimer(self, v4, v5, v6);
  BOOL v7 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_23759D000, v7, OS_LOG_TYPE_INFO, "Pause default and rhythmic configuration live updaters.", (uint8_t *)&v14, 2u);
  }

  objc_msgSend_pause(self->_defaultLocationUpdater, v8, v9, v10);
  objc_msgSend_pause(self->_rhythmicLocationUpdater, v11, v12, v13);
}

- (void)_adjustLocationUpdateInterest
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (objc_msgSend_shouldStartLocationUpdate(self, v3, v4, v5) && self->_location)
  {
    uint64_t v10 = objc_msgSend_expectedInterest(self, v6, v7, v8);
    objc_msgSend_setCurrentUpdateInterest_(self, v9, v10, v11);
  }
}

- (int64_t)initialInterest
{
  return -1;
}

- (int64_t)expectedInterest
{
  return -1;
}

- (void)updateLocationManagerWithCurrentAuthorizationStatus
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int locationAuthorizationStatus = self->_locationAuthorizationStatus;
  if ((locationAuthorizationStatus - 3) >= 2)
  {
    if (locationAuthorizationStatus)
    {
      uint64_t v16 = NCLogForCategory(3uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_msgSend_CLAuthorizationStatusToString_(NCLocationUpdateBaseDelegate, v17, self->_locationAuthorizationStatus, v18);
        int v26 = 138543362;
        __int16 v27 = v19;
        _os_log_impl(&dword_23759D000, v16, OS_LOG_TYPE_DEFAULT, "Unusable auth: %{public}@.", (uint8_t *)&v26, 0xCu);
      }
      objc_msgSend_stopLocationUpdates(self, v20, v21, v22);
      objc_msgSend__resetLocationAndAltitude(self, v23, v24, v25);
    }
    else
    {
      uint64_t v9 = NCLogForCategory(3uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "Requesting When In Use Auth.", (uint8_t *)&v26, 2u);
      }

      objc_msgSend__resetLocationAndAltitude(self, v10, v11, v12);
      objc_msgSend_requestWhenInUseAuthorization(self->_locationManager, v13, v14, v15);
    }
  }
  else
  {
    uint64_t updated = objc_msgSend_currentUpdateInterest(self, a2, v2, v3);
    objc_msgSend__startLocationUpdatesWithInterest_(self, v6, updated, v8);
  }
}

- (void)_resetLocationAndAltitude
{
  id location = self->_location;
  self->_id location = 0;

  if (!supportAbsoluteAltimeterFeatures())
  {
    altitude = self->_altitude;
    self->_altitude = 0;
  }

  objc_msgSend__notifyLocationUpdateHandlers(self, v4, v5, v6);
}

- (BOOL)isLocationServiceOff
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((self->_locationAuthorizationStatus - 1) >= 2) {
    int v5 = objc_msgSend__limitsPrecision(self->_locationManager, a2, v2, v3);
  }
  else {
    int v5 = 1;
  }
  uint64_t v6 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_CLAuthorizationStatusToString_(NCLocationUpdateBaseDelegate, v7, self->_locationAuthorizationStatus, v8);
    int v13 = objc_msgSend__limitsPrecision(self->_locationManager, v10, v11, v12);
    uint64_t v14 = @"NO";
    if (v13) {
      uint64_t v14 = @"YES";
    }
    uint64_t v15 = @"On";
    int v17 = 138543874;
    uint64_t v18 = v9;
    int v20 = v14;
    __int16 v19 = 2114;
    if (v5) {
      uint64_t v15 = @"Off";
    }
    __int16 v21 = 2114;
    uint64_t v22 = v15;
    _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "Checking location service. Auth status? %{public}@. Is coarse precision only? %{public}@. Consider location service %{public}@.", (uint8_t *)&v17, 0x20u);
  }
  return v5;
}

- (BOOL)isPreciseLocationOff
{
  return objc_msgSend__limitsPrecision(self->_locationManager, a2, v2, v3);
}

+ (id)CLAuthorizationStatusToString:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"kCLAuthorizationStatusNotDetermined";
  }
  else {
    return off_264CD5E18[a3 - 1];
  }
}

- (void)_updateMotionType:(int64_t)a3 isDeviceStationary:(BOOL)a4
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_msgSend_NCMotionTypeToString_(MEMORY[0x263F01778], v6, a3, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id motionActivityHandler = (void (**)(id, id, uint64_t))self->_motionActivityHandler;
  if (motionActivityHandler)
  {
    uint64_t isStationary = objc_msgSend_isStationary(self, v8, v9, v10);
    motionActivityHandler[2](motionActivityHandler, v13, isStationary);
  }
  if (self->_location) {
    objc_msgSend__adjustLocationUpdateInterest(self, v8, v9, v10);
  }
}

- (void)_startIdleTimer
{
  if (self->_locationUpdateIdleTimer) {
    objc_msgSend__invalidateIdleTimer(self, a2, v2, v3);
  }
  if (self->_startLocationUpdate)
  {
    id v5 = objc_alloc(MEMORY[0x263F5D400]);
    uint64_t v7 = (PCPersistentTimer *)objc_msgSend_initWithTimeInterval_serviceIdentifier_target_selector_userInfo_(v5, v6, @"com.apple.NanoCompass.location.wake", (uint64_t)self, sel__idleTimerFired_, 0, 3600.0);
    locationUpdateIdleTimer = self->_locationUpdateIdleTimer;
    self->_locationUpdateIdleTimer = v7;

    objc_msgSend_setUserVisible_(self->_locationUpdateIdleTimer, v9, 1, v10);
    objc_msgSend_setMinimumEarlyFireProportion_(self->_locationUpdateIdleTimer, v11, v12, v13, 1.0);
    uint64_t v16 = self->_locationUpdateIdleTimer;
    uint64_t v17 = MEMORY[0x263EF83A0];
    objc_msgSend_scheduleInQueue_(v16, v14, v17, v15);
  }
  else
  {
    uint64_t v18 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v19 = 0;
      _os_log_impl(&dword_23759D000, v18, OS_LOG_TYPE_DEFAULT, "Asked to start idle timer, but location updates should not start.", v19, 2u);
    }
  }
}

- (void)_idleTimerFired:(id)a3
{
  uint64_t v4 = NCLogForCategory(3uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_23759D000, v4, OS_LOG_TYPE_DEFAULT, "Idle timer fired; restart location update.", v11, 2u);
  }

  uint64_t updated = objc_msgSend_currentUpdateInterest(self, v5, v6, v7);
  objc_msgSend__startLocationUpdatesWithInterest_(self, v9, updated, v10);
}

- (void)_invalidateIdleTimer
{
  locationUpdateIdleTimer = self->_locationUpdateIdleTimer;
  if (locationUpdateIdleTimer)
  {
    objc_msgSend_invalidate(locationUpdateIdleTimer, a2, v2, v3);
    uint64_t v6 = self->_locationUpdateIdleTimer;
    self->_locationUpdateIdleTimer = 0;
  }
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setCurrentUpdateInterest:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t currentUpdateInterest = self->_currentUpdateInterest;
  if (currentUpdateInterest != a3)
  {
    if (a3 == -1)
    {
      objc_msgSend__startIdleTimer(self, a2, -1, v3);
      uint64_t v7 = @"YES";
    }
    else
    {
      if (currentUpdateInterest == -1) {
        objc_msgSend__invalidateIdleTimer(self, a2, a3, v3);
      }
      uint64_t v7 = @"NO";
    }
    uint64_t v8 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 + 1) > 2) {
        uint64_t v9 = @"Unknown";
      }
      else {
        uint64_t v9 = off_264CD5E38[a3 + 1];
      }
      int v14 = 136315650;
      uint64_t v15 = "-[NCLocationUpdateBaseDelegate setCurrentUpdateInterest:]";
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = v7;
      _os_log_impl(&dword_23759D000, v8, OS_LOG_TYPE_DEFAULT, "%s Adjust currentUpdateInterest to %{public}@. Start wakeup timer? %{public}@.", (uint8_t *)&v14, 0x20u);
    }

    self->_int64_t currentUpdateInterest = a3;
    id locationInterestDescriptionHandler = (void (**)(id, __CFString *))self->_locationInterestDescriptionHandler;
    if (locationInterestDescriptionHandler)
    {
      if ((unint64_t)(a3 + 1) > 2) {
        uint64_t v13 = @"Unknown";
      }
      else {
        uint64_t v13 = off_264CD5E38[a3 + 1];
      }
      locationInterestDescriptionHandler[2](locationInterestDescriptionHandler, v13);
    }
    objc_msgSend__startLocationUpdatesWithInterest_(self, v10, a3, v11);
  }
}

- (void)setStartLocationUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (!self->_transcriptSession || v3)
  {
    self->_startLocationUpdate = v3;
    uint64_t v8 = NCLogForCategory(1uLL);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v9)
      {
        *(_DWORD *)long long buf = 136315138;
        id v37 = "-[NCLocationUpdateBaseDelegate setStartLocationUpdate:]";
        _os_log_impl(&dword_23759D000, v8, OS_LOG_TYPE_DEFAULT, "%s Starting location/motion activity updates.", buf, 0xCu);
      }

      uint64_t updated = objc_msgSend_currentUpdateInterest(self, v10, v11, v12);
      id location = self->_location;
      if (!location) {
        goto LABEL_13;
      }
      __int16 v18 = objc_msgSend_timestamp(location, v13, v14, v15);
      objc_msgSend_timeIntervalSinceNow(v18, v19, v20, v21);
      double v23 = v22;

      double v24 = -v23;
      if (v23 >= 0.0) {
        double v24 = v23;
      }
      if (v24 > 300.0) {
LABEL_13:
      }
        uint64_t updated = objc_msgSend_initialInterest(self, v13, v14, v15);
      objc_msgSend__startLocationUpdatesWithInterest_(self, v13, updated, v15);
      objc_initWeak((id *)buf, self);
      motionClassificationManager = self->_motionClassificationManager;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = sub_2375C49F0;
      v34[3] = &unk_264CD5DD0;
      objc_copyWeak(&v35, (id *)buf);
      objc_msgSend_startMotionActivityUpdatesWithHandler_(motionClassificationManager, v26, (uint64_t)v34, v27);
      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)long long buf = 136315138;
        id v37 = "-[NCLocationUpdateBaseDelegate setStartLocationUpdate:]";
        _os_log_impl(&dword_23759D000, v8, OS_LOG_TYPE_DEFAULT, "%s Stopping location/motion activity updates.", buf, 0xCu);
      }

      objc_msgSend_stopLocationUpdates(self, v28, v29, v30);
      objc_msgSend_stopMotionActivityUpdates(self->_motionClassificationManager, v31, v32, v33);
    }
  }
  else
  {
    id v5 = NCLogForCategory(3uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v37 = (const char *)@"Passive Interest";
      _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "We were asked to stop location updates during an active transcript session. We will instead attempt to change the interest to %{public}@.", buf, 0xCu);
    }

    objc_msgSend_setCurrentUpdateInterest_(self, v6, -1, v7);
    self->_startLocationUpdate = v3;
  }
}

- (void)fetchGroundAltitudeNearLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375C4B24;
  block[3] = &unk_264CD5DF8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async((dispatch_queue_t)self->_clFetchQueue, v10);
}

- (int)locationAuthorizationStatus
{
  return self->_locationAuthorizationStatus;
}

- (int64_t)currentUpdateInterest
{
  return self->_currentUpdateInterest;
}

- (BOOL)shouldForce1Hz
{
  return self->_force1Hz;
}

- (BOOL)shouldStartLocationUpdate
{
  return self->_startLocationUpdate;
}

- (NCLocation)location
{
  return (NCLocation *)objc_getProperty(self, a2, 240, 1);
}

- (NCAltitude)altitude
{
  return (NCAltitude *)objc_getProperty(self, a2, 248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_clFetchQueue, 0);
  objc_storeStrong(&self->_locationPromptShownAction, 0);
  objc_storeStrong((id *)&self->_locationLogTimestamp, 0);
  objc_storeStrong(&self->_motionActivityHandler, 0);
  objc_storeStrong(&self->_locationInterestDescriptionHandler, 0);
  objc_storeStrong(&self->_furthestWaypointHandler, 0);
  objc_storeStrong(&self->_nearestWaypointHandler, 0);
  objc_storeStrong((id *)&self->_furthestWaypoint, 0);
  objc_storeStrong((id *)&self->_nearestWaypoint, 0);
  objc_storeStrong((id *)&self->_parkedCarWaypoint, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_transcriptSession, 0);
  objc_storeStrong((id *)&self->_locationUpdateIdleTimer, 0);
  objc_storeStrong((id *)&self->_motionClassificationManager, 0);
  objc_storeStrong((id *)&self->_locationServiceUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_locationUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong(&self->_locationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_rhythmicLocationUpdater, 0);
  objc_storeStrong((id *)&self->_defaultLocationUpdater, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
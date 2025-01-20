@interface CLLocationManagerStateTracker
+ (const)trackerStateTypeName;
+ (unint64_t)trackerStateSize;
- (BOOL)allowsAlteredAccessoryLocations;
- (BOOL)allowsBackgroundLocationUpdates;
- (BOOL)allowsLocationPrompts;
- (BOOL)allowsMapCorrection;
- (BOOL)batchingLocation;
- (BOOL)courtesyPromptNeeded;
- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5;
- (BOOL)dynamicAccuracyReductionEnabled;
- (BOOL)fusionInfoEnabled;
- (BOOL)groundAltitudeEnabled;
- (BOOL)isAuthorizedForWidgetUpdates;
- (BOOL)limitsPrecision;
- (BOOL)matchInfoEnabled;
- (BOOL)paused;
- (BOOL)previousAuthorizationStatusValid;
- (BOOL)requestingLocation;
- (BOOL)showsBackgroundLocationIndicator;
- (BOOL)trackRunInfoEnabled;
- (BOOL)updatingHeading;
- (BOOL)updatingLocation;
- (BOOL)updatingVehicleHeading;
- (BOOL)updatingVehicleSpeed;
- (CLLocationManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4;
- (CLLocationManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5;
- (double)desiredAccuracy;
- (double)distanceFilter;
- (double)headingFilter;
- (id)initInSilo:(id)a3 withIdentifier:(void *)a4;
- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5;
- (int)pausesLocationUpdatesAutomatically;
- (int)previousAuthorizationStatus;
- (int64_t)activityType;
- (void)dealloc;
- (void)identifier;
- (void)setActivityType:(int64_t)a3;
- (void)setAllowsAlteredAccessoryLocations:(BOOL)a3;
- (void)setAllowsBackgroundLocationUpdates:(BOOL)a3;
- (void)setAllowsLocationPrompts:(BOOL)a3;
- (void)setAllowsMapCorrection:(BOOL)a3;
- (void)setBatchingLocation:(BOOL)a3;
- (void)setCourtesyPromptNeeded:(BOOL)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDistanceFilter:(double)a3;
- (void)setDynamicAccuracyReductionEnabled:(BOOL)a3;
- (void)setFusionInfoEnabled:(BOOL)a3;
- (void)setGroundAltitudeEnabled:(BOOL)a3;
- (void)setHeadingFilter:(double)a3;
- (void)setIsAuthorizedForWidgetUpdates:(BOOL)a3;
- (void)setLimitsPrecision:(BOOL)a3;
- (void)setMatchInfoEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPausesLocationUpdatesAutomatically:(int)a3;
- (void)setPreviousAuthorizationStatus:(int)a3;
- (void)setPreviousAuthorizationStatusValid:(BOOL)a3;
- (void)setRequestingLocation:(BOOL)a3;
- (void)setShowsBackgroundLocationIndicator:(BOOL)a3;
- (void)setTrackRunInfoEnabled:(BOOL)a3;
- (void)setUpdatingHeading:(BOOL)a3;
- (void)setUpdatingLocation:(BOOL)a3;
- (void)setUpdatingVehicleHeading:(BOOL)a3;
- (void)setUpdatingVehicleSpeed:(BOOL)a3;
- (void)updateState:(id)a3;
@end

@implementation CLLocationManagerStateTracker

- (double)desiredAccuracy
{
  return self->_state.desiredAccuracy;
}

- (BOOL)courtesyPromptNeeded
{
  return self->_state.courtesyPromptNeeded;
}

- (BOOL)allowsMapCorrection
{
  return self->_state.allowsMapCorrection;
}

- (BOOL)requestingLocation
{
  return self->_state.requestingLocation;
}

- (BOOL)previousAuthorizationStatusValid
{
  return self->_state.previousAuthorizationStatusValid;
}

- (int)previousAuthorizationStatus
{
  return self->_state.previousAuthorizationStatus;
}

- (BOOL)limitsPrecision
{
  return self->_state.limitsPrecision;
}

- (BOOL)isAuthorizedForWidgetUpdates
{
  return self->_state.isAuthorizedForWidgetUpdates;
}

- (void)setPausesLocationUpdatesAutomatically:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      uint64_t pausesLocationUpdatesAutomatically = self->_state.pausesLocationUpdatesAutomatically;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 2082;
      v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      v16 = v6;
      __int16 v17 = 2082;
      v18 = "pausesLocationUpdatesAutomatically";
      __int16 v19 = 2050;
      uint64_t v20 = pausesLocationUpdatesAutomatically;
      __int16 v21 = 2050;
      uint64_t v22 = a3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLAutoPause}lld, \"new\":%{public, location:CLAutoPause}lld}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.uint64_t pausesLocationUpdatesAutomatically = a3;
}

- (int)pausesLocationUpdatesAutomatically
{
  return self->_state.pausesLocationUpdatesAutomatically;
}

- (CLLocationManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CLLocationManagerStateTracker;
  v7 = [(CLStateTracker *)&v16 initWithQueue:a3];
  v8 = v7;
  if (!v7) {
    return v8;
  }
  v7->_identifier = a4;
  if (!a5) {
    goto LABEL_7;
  }
  if (v7->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v14 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      uint64_t v20 = "";
      __int16 v21 = 2082;
      uint64_t v22 = "assert";
      __int16 v23 = 2081;
      v24 = "!_inTransaction";
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
      }
    }
    __int16 v15 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      uint64_t v20 = "";
      __int16 v21 = 2082;
      uint64_t v22 = "assert";
      __int16 v23 = 2081;
      v24 = "!_inTransaction";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Already in a transaction. LocationManager threading bug?", "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
      }
    }
    v8 = (CLLocationManagerStateTracker *)qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      uint64_t v20 = "";
      __int16 v21 = 2082;
      uint64_t v22 = "assert";
      __int16 v23 = 2081;
      v24 = "!_inTransaction";
      _os_log_impl(&dword_1906B8000, &v8->super.super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  else
  {
    v7->_inTransaction = 1;
    (*((void (**)(id, CLLocationManagerStateTracker *))a5 + 2))(a5, v7);
    v8->_inTransaction = 0;
    if (qword_1EB2713D8 == -1) {
      goto LABEL_5;
    }
  }
  dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
LABEL_5:
  __int16 v9 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(CLLocationManagerStateTracker *)v8 identifier];
    *(_DWORD *)buf = 68290562;
    int v18 = 0;
    __int16 v19 = 2082;
    uint64_t v20 = "";
    __int16 v21 = 2082;
    uint64_t v22 = "state_transition";
    __int16 v23 = 2082;
    v24 = "LocationManager";
    __int16 v25 = 2050;
    uint64_t v26 = v10;
    __int16 v27 = 2082;
    v28 = "init";
    __int16 v29 = 1040;
    *(_DWORD *)v30 = 80;
    *(_WORD *)&v30[4] = 2098;
    *(void *)&v30[6] = &v8->_state;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"new\":%{public, location:_CLLocationManagerStateTrackerState}.*P}", buf, 0x4Au);
LABEL_7:
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
  }
  __int16 v11 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(CLLocationManagerStateTracker *)v8 identifier];
    *(_DWORD *)buf = 68290562;
    int v18 = 0;
    __int16 v19 = 2082;
    uint64_t v20 = "";
    __int16 v21 = 2082;
    uint64_t v22 = "state_transition";
    __int16 v23 = 2082;
    v24 = "LocationManager";
    __int16 v25 = 2050;
    uint64_t v26 = v12;
    __int16 v27 = 2082;
    v28 = "lifecycle";
    __int16 v29 = 2050;
    *(void *)v30 = 0;
    *(_WORD *)&v30[8] = 2050;
    *(void *)&v30[10] = v8;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  return v8;
}

- (void)identifier
{
  return self->_identifier;
}

- (void)setHeadingFilter:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      double headingFilter = self->_state.headingFilter;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "headingFilter";
      __int16 v19 = 2050;
      double v20 = headingFilter;
      __int16 v21 = 2050;
      double v22 = a3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}f\", \"new\":\"%{public}f\"}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.double headingFilter = a3;
}

- (void)setDistanceFilter:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      double distanceFilter = self->_state.distanceFilter;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "distanceFilter";
      __int16 v19 = 2050;
      double v20 = distanceFilter;
      __int16 v21 = 2050;
      double v22 = a3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}f\", \"new\":\"%{public}f\"}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.double distanceFilter = a3;
}

- (void)setDesiredAccuracy:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      double desiredAccuracy = self->_state.desiredAccuracy;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "desiredAccuracy";
      __int16 v19 = 2050;
      double v20 = desiredAccuracy;
      __int16 v21 = 2050;
      double v22 = a3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}f\", \"new\":\"%{public}f\"}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.double desiredAccuracy = a3;
}

- (void)setCourtesyPromptNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL courtesyPromptNeeded = self->_state.courtesyPromptNeeded;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "courtesyPromptNeeded";
      __int16 v19 = 1026;
      BOOL v20 = courtesyPromptNeeded;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL courtesyPromptNeeded = v3;
}

- (void)setAllowsMapCorrection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL allowsMapCorrection = self->_state.allowsMapCorrection;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "allowsMapCorrection";
      __int16 v19 = 1026;
      BOOL v20 = allowsMapCorrection;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL allowsMapCorrection = v3;
}

- (void)setAllowsLocationPrompts:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL allowsLocationPrompts = self->_state.allowsLocationPrompts;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "allowsLocationPrompts";
      __int16 v19 = 1026;
      BOOL v20 = allowsLocationPrompts;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL allowsLocationPrompts = v3;
}

- (BOOL)updatingLocation
{
  return self->_state.updatingLocation;
}

- (void)setUpdatingLocation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL updatingLocation = self->_state.updatingLocation;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "updatingLocation";
      __int16 v19 = 1026;
      BOOL v20 = updatingLocation;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL updatingLocation = v3;
}

- (void)setRequestingLocation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL requestingLocation = self->_state.requestingLocation;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "requestingLocation";
      __int16 v19 = 1026;
      BOOL v20 = requestingLocation;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL requestingLocation = v3;
}

- (void)setPreviousAuthorizationStatusValid:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL previousAuthorizationStatusValid = self->_state.previousAuthorizationStatusValid;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "previousAuthorizationStatusValid";
      __int16 v19 = 1026;
      BOOL v20 = previousAuthorizationStatusValid;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL previousAuthorizationStatusValid = v3;
}

- (void)setPreviousAuthorizationStatus:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      uint64_t previousAuthorizationStatus = self->_state.previousAuthorizationStatus;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "previousAuthorizationStatus";
      __int16 v19 = 2050;
      uint64_t v20 = previousAuthorizationStatus;
      __int16 v21 = 2050;
      uint64_t v22 = a3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLClientAuthorizationStatus}lld, \"new\":%{public, location:CLClientAuthorizationStatus}lld}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.uint64_t previousAuthorizationStatus = a3;
}

- (void)setLimitsPrecision:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL limitsPrecision = self->_state.limitsPrecision;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "limitsPrecision";
      __int16 v19 = 1026;
      BOOL v20 = limitsPrecision;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL limitsPrecision = v3;
}

- (void)setIsAuthorizedForWidgetUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL isAuthorizedForWidgetUpdates = self->_state.isAuthorizedForWidgetUpdates;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "isAuthorizedForWidgetUpdates";
      __int16 v19 = 1026;
      BOOL v20 = isAuthorizedForWidgetUpdates;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL isAuthorizedForWidgetUpdates = v3;
}

- (BOOL)paused
{
  return self->_state.paused;
}

- (BOOL)dynamicAccuracyReductionEnabled
{
  return self->_state.dynamicAccuracyReductionEnabled;
}

- (double)distanceFilter
{
  return self->_state.distanceFilter;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  BOOL v3 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290562;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2082;
    uint64_t v10 = "state_transition";
    __int16 v11 = 2082;
    uint64_t v12 = "LocationManager";
    __int16 v13 = 2050;
    v14 = [(CLLocationManagerStateTracker *)self identifier];
    __int16 v15 = 2082;
    objc_super v16 = "lifecycle";
    __int16 v17 = 2050;
    int v18 = self;
    __int16 v19 = 2050;
    uint64_t v20 = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLLocationManagerStateTracker;
  [(CLStateTracker *)&v4 dealloc];
}

- (BOOL)allowsAlteredAccessoryLocations
{
  return self->_state.allowsAlteredAccessoryLocations;
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_initInSilo_withIdentifier_state_);
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5
{
  [a3 assertInside];
  uint64_t v9 = [a3 queue];

  return [(CLLocationManagerStateTracker *)self initWithQueue:v9 identifier:a4 state:a5];
}

- (CLLocationManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4
{
  return [(CLLocationManagerStateTracker *)self initWithQueue:a3 identifier:a4 state:0];
}

- (BOOL)updatingHeading
{
  return self->_state.updatingHeading;
}

- (void)setUpdatingHeading:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL updatingHeading = self->_state.updatingHeading;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "updatingHeading";
      __int16 v19 = 1026;
      BOOL v20 = updatingHeading;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL updatingHeading = v3;
}

- (double)headingFilter
{
  return self->_state.headingFilter;
}

- (BOOL)allowsLocationPrompts
{
  return self->_state.allowsLocationPrompts;
}

- (void)setAllowsAlteredAccessoryLocations:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL allowsAlteredAccessoryLocations = self->_state.allowsAlteredAccessoryLocations;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "allowsAlteredAccessoryLocations";
      __int16 v19 = 1026;
      BOOL v20 = allowsAlteredAccessoryLocations;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL allowsAlteredAccessoryLocations = v3;
}

- (void)setDynamicAccuracyReductionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL dynamicAccuracyReductionEnabled = self->_state.dynamicAccuracyReductionEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "dynamicAccuracyReductionEnabled";
      __int16 v19 = 1026;
      BOOL v20 = dynamicAccuracyReductionEnabled;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL dynamicAccuracyReductionEnabled = v3;
}

- (int64_t)activityType
{
  return self->_state.activityType;
}

- (void)setActivityType:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      int64_t activityType = self->_state.activityType;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "activityType";
      __int16 v19 = 2050;
      int64_t v20 = activityType;
      __int16 v21 = 2050;
      int64_t v22 = a3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLActivityType}lld, \"new\":%{public, location:CLActivityType}lld}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.int64_t activityType = a3;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL paused = self->_state.paused;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "paused";
      __int16 v19 = 1026;
      BOOL v20 = paused;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL paused = v3;
}

- (BOOL)allowsBackgroundLocationUpdates
{
  return self->_state.allowsBackgroundLocationUpdates;
}

- (void)setAllowsBackgroundLocationUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL allowsBackgroundLocationUpdates = self->_state.allowsBackgroundLocationUpdates;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "allowsBackgroundLocationUpdates";
      __int16 v19 = 1026;
      BOOL v20 = allowsBackgroundLocationUpdates;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL allowsBackgroundLocationUpdates = v3;
}

- (BOOL)showsBackgroundLocationIndicator
{
  return self->_state.showsBackgroundLocationIndicator;
}

- (void)setShowsBackgroundLocationIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL showsBackgroundLocationIndicator = self->_state.showsBackgroundLocationIndicator;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "showsBackgroundLocationIndicator";
      __int16 v19 = 1026;
      BOOL v20 = showsBackgroundLocationIndicator;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL showsBackgroundLocationIndicator = v3;
}

- (BOOL)batchingLocation
{
  return self->_state.batchingLocation;
}

- (void)setBatchingLocation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL batchingLocation = self->_state.batchingLocation;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "batchingLocation";
      __int16 v19 = 1026;
      BOOL v20 = batchingLocation;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL batchingLocation = v3;
}

- (BOOL)updatingVehicleSpeed
{
  return self->_state.updatingVehicleSpeed;
}

- (void)setUpdatingVehicleSpeed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL updatingVehicleSpeed = self->_state.updatingVehicleSpeed;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "updatingVehicleSpeed";
      __int16 v19 = 1026;
      BOOL v20 = updatingVehicleSpeed;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL updatingVehicleSpeed = v3;
}

- (BOOL)updatingVehicleHeading
{
  return self->_state.updatingVehicleHeading;
}

- (void)setUpdatingVehicleHeading:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL updatingVehicleHeading = self->_state.updatingVehicleHeading;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "updatingVehicleHeading";
      __int16 v19 = 1026;
      BOOL v20 = updatingVehicleHeading;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL updatingVehicleHeading = v3;
}

- (BOOL)matchInfoEnabled
{
  return self->_state.matchInfoEnabled;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL matchInfoEnabled = self->_state.matchInfoEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "matchInfoEnabled";
      __int16 v19 = 1026;
      BOOL v20 = matchInfoEnabled;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL matchInfoEnabled = v3;
}

- (BOOL)groundAltitudeEnabled
{
  return self->_state.groundAltitudeEnabled;
}

- (void)setGroundAltitudeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL groundAltitudeEnabled = self->_state.groundAltitudeEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "groundAltitudeEnabled";
      __int16 v19 = 1026;
      BOOL v20 = groundAltitudeEnabled;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL groundAltitudeEnabled = v3;
}

- (BOOL)fusionInfoEnabled
{
  return self->_state.fusionInfoEnabled;
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL fusionInfoEnabled = self->_state.fusionInfoEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "fusionInfoEnabled";
      __int16 v19 = 1026;
      BOOL v20 = fusionInfoEnabled;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL fusionInfoEnabled = v3;
}

- (BOOL)trackRunInfoEnabled
{
  return self->_state.trackRunInfoEnabled;
}

- (void)setTrackRunInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    v5 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLLocationManagerStateTracker *)self identifier];
      BOOL trackRunInfoEnabled = self->_state.trackRunInfoEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = "state_transition";
      __int16 v13 = 2082;
      v14 = "LocationManager";
      __int16 v15 = 2050;
      objc_super v16 = v6;
      __int16 v17 = 2082;
      int v18 = "trackRunInfoEnabled";
      __int16 v19 = 1026;
      BOOL v20 = trackRunInfoEnabled;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL trackRunInfoEnabled = v3;
}

- (void)updateState:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_state = &self->_state;
  long long v4 = *(_OWORD *)&self->_state.activityType;
  v11[2] = *(_OWORD *)&self->_state.allowsLocationPrompts;
  v11[3] = v4;
  v11[4] = *(_OWORD *)&self->_state.batchingLocation;
  long long v5 = *(_OWORD *)&self->_state.updatingLocation;
  v11[0] = *(_OWORD *)&self->_state.distanceFilter;
  v11[1] = v5;
  if (self->_inTransaction)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    __int16 v9 = qword_1EB2713D0;
    p_state = (_CLLocationManagerStateTrackerState *)"assert";
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2082;
      __int16 v17 = "assert";
      __int16 v18 = 2081;
      __int16 v19 = "!_inTransaction";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
      }
    }
    uint64_t v10 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2082;
      __int16 v17 = "assert";
      __int16 v18 = 2081;
      __int16 v19 = "!_inTransaction";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Already in a transaction. LocationManager threading bug?", "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
      }
    }
    int v6 = (CLLocationManagerStateTracker *)qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2082;
      __int16 v17 = "assert";
      __int16 v18 = 2081;
      __int16 v19 = "!_inTransaction";
      _os_log_impl(&dword_1906B8000, &v6->super.super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  else
  {
    int v6 = self;
    self->_inTransaction = 1;
    (*((void (**)(id, CLLocationManagerStateTracker *))a3 + 2))(a3, self);
    v6->_inTransaction = 0;
    if (qword_1EB2713D8 == -1) {
      goto LABEL_3;
    }
  }
  dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
LABEL_3:
  __int16 v7 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(CLLocationManagerStateTracker *)v6 identifier];
    *(_DWORD *)buf = 68291074;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "state_transition";
    __int16 v18 = 2082;
    __int16 v19 = "LocationManager";
    __int16 v20 = 2050;
    uint64_t v21 = v8;
    __int16 v22 = 2082;
    uint64_t v23 = "allStates";
    __int16 v24 = 1040;
    int v25 = 80;
    __int16 v26 = 2098;
    __int16 v27 = v11;
    __int16 v28 = 1040;
    int v29 = 80;
    __int16 v30 = 2098;
    uint64_t v31 = p_state;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:_CLLocationManagerStateTrackerState}.*P, \"new\":%{public, location:_CLLocationManagerStateTrackerState}.*P}", buf, 0x5Au);
  }
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4 <= 0x4F)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
    __int16 v9 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      int v12 = 68289538;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2050;
      uint64_t v17 = 80;
      __int16 v18 = 2050;
      unint64_t v19 = a4;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v12, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
      }
    }
    uint64_t v10 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      int v12 = 68289538;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2050;
      uint64_t v17 = 80;
      __int16 v18 = 2050;
      unint64_t v19 = a4;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "state dump failure", "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v12, 0x26u);
    }
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)&self->_state.distanceFilter;
    long long v6 = *(_OWORD *)&self->_state.batchingLocation;
    long long v8 = *(_OWORD *)&self->_state.updatingLocation;
    long long v7 = *(_OWORD *)&self->_state.allowsLocationPrompts;
    *((_OWORD *)a3 + 3) = *(_OWORD *)&self->_state.activityType;
    *((_OWORD *)a3 + 4) = v6;
    *((_OWORD *)a3 + 1) = v8;
    *((_OWORD *)a3 + 2) = v7;
  }
  return a4 > 0x4F;
}

+ (unint64_t)trackerStateSize
{
  return 80;
}

+ (const)trackerStateTypeName
{
  return "_CLLocationManagerStateTrackerState";
}

@end
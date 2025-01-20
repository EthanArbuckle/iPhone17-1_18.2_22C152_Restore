@interface NCLocationUpdateNonRhythmicGNSSDelegate
- (int64_t)expectedInterest;
- (int64_t)initialInterest;
- (void)_cancelLocationAssertion;
- (void)_idleTimerFired:(id)a3;
- (void)_invalidateIdleTimer;
- (void)_invalidateLocationTimersAndAssertion;
- (void)_invalidateQueryDurationTimer;
- (void)_startIdleTimer;
- (void)_startLocationQueryDurationTimer;
- (void)_takeLocationAssertion;
- (void)stopLocationUpdates;
@end

@implementation NCLocationUpdateNonRhythmicGNSSDelegate

- (int64_t)initialInterest
{
  return 1;
}

- (int64_t)expectedInterest
{
  return 1;
}

- (void)stopLocationUpdates
{
  v6.receiver = self;
  v6.super_class = (Class)NCLocationUpdateNonRhythmicGNSSDelegate;
  [(NCLocationUpdateBaseDelegate *)&v6 stopLocationUpdates];
  objc_msgSend__invalidateLocationTimersAndAssertion(self, v3, v4, v5);
}

- (void)_startLocationQueryDurationTimer
{
  if (self->_locationQueryDurationTimer) {
    objc_msgSend__invalidateQueryDurationTimer(self, a2, v2, v3);
  }
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x263EFFA20];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = sub_2375A5C24;
  v20 = &unk_264CD5598;
  objc_copyWeak(&v21, &location);
  objc_msgSend_timerWithTimeInterval_repeats_block_(v5, v6, 0, (uint64_t)&v17, 18.0);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  locationQueryDurationTimer = self->_locationQueryDurationTimer;
  self->_locationQueryDurationTimer = v7;

  v12 = objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v9, v10, v11, v17, v18, v19, v20);
  objc_msgSend_addTimer_forMode_(v12, v13, (uint64_t)self->_locationQueryDurationTimer, *MEMORY[0x263EFF588]);

  objc_msgSend__takeLocationAssertion(self, v14, v15, v16);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_startIdleTimer
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_locationUpdateIdleTimer) {
    objc_msgSend__invalidateIdleTimer(self, a2, v2, v3);
  }
  if (objc_msgSend_shouldStartLocationUpdate(self, a2, v2, v3))
  {
    id v5 = objc_alloc(MEMORY[0x263F5D400]);
    v7 = (PCPersistentTimer *)objc_msgSend_initWithTimeInterval_serviceIdentifier_target_selector_userInfo_(v5, v6, @"com.apple.NanoCompass.location.nonRhythmicGNSSWake", (uint64_t)self, sel__idleTimerFired_, 0, 180.0);
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
    uint64_t v18 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      v20 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _startIdleTimer]";
      _os_log_impl(&dword_23759D000, v18, OS_LOG_TYPE_DEFAULT, "%s location update should not start as the app is in the background", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_idleTimerFired:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _idleTimerFired:]";
    _os_log_impl(&dword_23759D000, v4, OS_LOG_TYPE_DEFAULT, "%s idle timer fired and restart location update", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = objc_msgSend_expectedInterest(self, v5, v6, v7);
  objc_msgSend__startLocationUpdatesWithInterest_(self, v9, v8, v10);
  objc_msgSend__startLocationQueryDurationTimer(self, v11, v12, v13);
}

- (void)_invalidateQueryDurationTimer
{
  locationQueryDurationTimer = self->_locationQueryDurationTimer;
  if (locationQueryDurationTimer)
  {
    objc_msgSend_invalidate(locationQueryDurationTimer, a2, v2, v3);
    uint64_t v6 = self->_locationQueryDurationTimer;
    self->_locationQueryDurationTimer = 0;
  }
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

- (void)_invalidateLocationTimersAndAssertion
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    int v14 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _invalidateLocationTimersAndAssertion]";
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s invalidate location timers and assertion", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend__invalidateIdleTimer(self, v4, v5, v6);
  objc_msgSend__invalidateQueryDurationTimer(self, v7, v8, v9);
  objc_msgSend__cancelLocationAssertion(self, v10, v11, v12);
}

- (void)_takeLocationAssertion
{
  v45[2] = *MEMORY[0x263EF8340];
  objc_msgSend__cancelLocationAssertion(self, a2, v2, v3);
  uint64_t v6 = objc_msgSend_attributeWithDuration_warningDuration_startPolicy_endPolicy_(MEMORY[0x263F64488], v5, 1, 1, 20.0, 1.0);
  v45[0] = v6;
  uint64_t v8 = objc_msgSend_attributeWithDomain_name_(MEMORY[0x263F64480], v7, @"com.apple.compass", @"Location");
  v45[1] = v8;
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, (uint64_t)v45, 2);

  id v11 = objc_alloc(MEMORY[0x263F64408]);
  uint64_t v15 = objc_msgSend_currentProcess(MEMORY[0x263F64630], v12, v13, v14);
  uint64_t v17 = (RBSAssertion *)objc_msgSend_initWithExplanation_target_attributes_(v11, v16, @"Periodic runtime to keep location fresh", (uint64_t)v15, v10);
  locationQueryAssertion = self->_locationQueryAssertion;
  self->_locationQueryAssertion = v17;

  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = sub_2375A6434;
  v38[3] = &unk_264CD55C0;
  objc_copyWeak(&v39, &location);
  int v19 = (void *)MEMORY[0x237E1C4F0](v38);
  v20 = self->_locationQueryAssertion;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_2375A6548;
  v36[3] = &unk_264CD55E8;
  id v21 = v19;
  id v37 = v21;
  objc_msgSend_setExpirationWarningHandler_(v20, v22, (uint64_t)v36, v23);
  v24 = self->_locationQueryAssertion;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_2375A6608;
  v34[3] = &unk_264CD5610;
  id v25 = v21;
  id v35 = v25;
  objc_msgSend_setInvalidationHandler_(v24, v26, (uint64_t)v34, v27);
  v28 = self->_locationQueryAssertion;
  id v33 = 0;
  LODWORD(v24) = objc_msgSend_acquireWithError_(v28, v29, (uint64_t)&v33, v30);
  id v31 = v33;
  if (v24)
  {
    v32 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _takeLocationAssertion]";
      __int16 v43 = 2048;
      uint64_t v44 = 0x4034000000000000;
      _os_log_impl(&dword_23759D000, v32, OS_LOG_TYPE_DEFAULT, "%s taking runtime assertion for updating location for %.0fs", buf, 0x16u);
    }
  }
  else
  {
    v32 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_2375D7D84((uint64_t)v31, v32);
    }
  }

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)_cancelLocationAssertion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_locationQueryAssertion)
  {
    uint64_t v3 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _cancelLocationAssertion]";
      _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s cancelling runtime assertion", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend_invalidate(self->_locationQueryAssertion, v4, v5, v6);
    locationQueryAssertion = self->_locationQueryAssertion;
    self->_locationQueryAssertion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationQueryAssertion, 0);
  objc_storeStrong((id *)&self->_locationUpdateIdleTimer, 0);

  objc_storeStrong((id *)&self->_locationQueryDurationTimer, 0);
}

@end
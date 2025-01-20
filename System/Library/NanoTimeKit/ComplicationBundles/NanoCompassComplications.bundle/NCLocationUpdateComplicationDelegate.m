@interface NCLocationUpdateComplicationDelegate
- (BOOL)isWaypointComplicationActive;
- (id)_endOfDayForDate:(id)a3;
- (id)_getActivationStartDate;
- (id)startLocationUpdatesWithHandler:(id)a3;
- (int64_t)expectedInterest;
- (int64_t)initialInterest;
- (void)_complicationDeactivationTimerFired:(id)a3;
- (void)_invalidateActivationTimer;
- (void)_setupDeactivationTimerWithStartDate:(id)a3;
- (void)activateWaypointComplication;
- (void)deactivateWaypointComplication;
- (void)setWaypointComplicationActive:(BOOL)a3;
@end

@implementation NCLocationUpdateComplicationDelegate

- (int64_t)initialInterest
{
  return 1;
}

- (int64_t)expectedInterest
{
  return -1;
}

- (id)startLocationUpdatesWithHandler:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCLocationUpdateComplicationDelegate;
  v4 = [(NCLocationUpdateBaseDelegate *)&v9 startLocationUpdatesWithHandler:a3];
  objc_msgSend_activateWaypointComplication(self, v5, v6, v7);

  return v4;
}

- (void)activateWaypointComplication
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v8 = objc_msgSend__getActivationStartDate(self, a2, v2, v3);
  if (v8)
  {
    objc_super v9 = objc_msgSend_now(MEMORY[0x263EFF910], v5, v6, v7);
    BOOL IsSameDay = NanoCompassIsSameDay(v8, v9);
    uint64_t v14 = objc_msgSend_locationClientCount(self, v11, v12, v13);
    v15 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (IsSameDay) {
        v19 = @"YES";
      }
      else {
        v19 = @"NO";
      }
      int v33 = 136316418;
      v34 = "-[NCLocationUpdateComplicationDelegate activateWaypointComplication]";
      if (objc_msgSend_isWaypointComplicationActive(self, v16, v17, v18)) {
        v20 = @"YES";
      }
      else {
        v20 = @"NO";
      }
      __int16 v35 = 2112;
      v36 = v8;
      __int16 v37 = 2112;
      v38 = v9;
      __int16 v39 = 2112;
      v40 = v19;
      __int16 v41 = 2048;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_23759D000, v15, OS_LOG_TYPE_DEFAULT, "%s activate date is %@, now is %@, on the same date? %@, client count is %lu, waypoint complication is active? %@", (uint8_t *)&v33, 0x3Eu);
    }

    if (v14) {
      BOOL v24 = IsSameDay;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24 && objc_msgSend_isWaypointComplicationActive(self, v21, v22, v23))
    {
      objc_msgSend__setupDeactivationTimerWithStartDate_(self, v25, (uint64_t)v8, v26);
      if (!self->_waypointIsActivated)
      {
        objc_msgSend_setStartLocationUpdate_(self, v27, 1, v28);
        v29 = NCLogForCategory(7uLL);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl(&dword_23759D000, v29, OS_LOG_TYPE_DEFAULT, "Waypoint complication is activated. Power log is started.", (uint8_t *)&v33, 2u);
        }

        powerLogWaypointComplicationEventStarted(1);
        self->_waypointIsActivated = 1;
      }
      if (ShouldSendComplicationDailyMetricsEvent())
      {
        SendWaypointComplicationActivatedEvent(v14, v30, v31, v32);
        UpdateComplicationDailyMetricsEventTimestamp();
      }
    }
  }
  else
  {
    objc_super v9 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2375D8088(v9);
    }
  }
}

- (void)deactivateWaypointComplication
{
  objc_msgSend__invalidateActivationTimer(self, a2, v2, v3);
  if (self->_waypointIsActivated)
  {
    objc_msgSend_setStartLocationUpdate_(self, v5, 0, v6);
    uint64_t v7 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23759D000, v7, OS_LOG_TYPE_DEFAULT, "Waypoint complication is deactivated. Power log is stopped.", v8, 2u);
    }

    self->_waypointIsActivated = 0;
    powerLogWaypointComplicationEventStarted(0);
  }
}

- (void)_setupDeactivationTimerWithStartDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    BOOL v24 = "-[NCLocationUpdateComplicationDelegate _setupDeactivationTimerWithStartDate:]";
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s setting up deactivation timer with activation start date %@", (uint8_t *)&v23, 0x16u);
  }

  if (self->_waypointComplicationDeactivationTimer) {
    objc_msgSend__invalidateActivationTimer(self, v6, v7, v8);
  }
  id v9 = objc_alloc(MEMORY[0x263F5D400]);
  uint64_t v12 = objc_msgSend__endOfDayForDate_(self, v10, (uint64_t)v4, v11);
  uint64_t v14 = (PCPersistentTimer *)objc_msgSend_initWithFireDate_serviceIdentifier_target_selector_userInfo_(v9, v13, (uint64_t)v12, @"com.apple.NanoCompass.waypoint.activationTimeout", self, sel__complicationDeactivationTimerFired_, 0);
  waypointComplicationDeactivationTimer = self->_waypointComplicationDeactivationTimer;
  self->_waypointComplicationDeactivationTimer = v14;

  objc_msgSend_setUserVisible_(self->_waypointComplicationDeactivationTimer, v16, 1, v17);
  objc_msgSend_setMinimumEarlyFireProportion_(self->_waypointComplicationDeactivationTimer, v18, v19, v20, 1.0);
  objc_msgSend_scheduleInQueue_(self->_waypointComplicationDeactivationTimer, v21, MEMORY[0x263EF83A0], v22);
}

- (id)_endOfDayForDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_currentCalendar(v3, v5, v6, v7);
  v10 = objc_msgSend_components_fromDate_(v8, v9, 28, (uint64_t)v4);

  objc_msgSend_setHour_(v10, v11, 23, v12);
  objc_msgSend_setMinute_(v10, v13, 59, v14);
  objc_msgSend_setSecond_(v10, v15, 59, v16);
  uint64_t v19 = objc_msgSend_dateFromComponents_(v8, v17, (uint64_t)v10, v18);

  return v19;
}

- (id)_getActivationStartDate
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.compass", v4);
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, @"TargetedViewUsageTimestamp", v7);

  return v8;
}

- (void)_complicationDeactivationTimerFired:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[NCLocationUpdateComplicationDelegate _complicationDeactivationTimerFired:]";
    _os_log_impl(&dword_23759D000, v4, OS_LOG_TYPE_DEFAULT, "%s deactivation timer fired and deactivate location update for waypoint complication", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_deactivateWaypointComplication(self, v5, v6, v7);
}

- (void)_invalidateActivationTimer
{
  waypointComplicationDeactivationTimer = self->_waypointComplicationDeactivationTimer;
  if (waypointComplicationDeactivationTimer)
  {
    objc_msgSend_invalidate(waypointComplicationDeactivationTimer, a2, v2, v3);
    uint64_t v6 = self->_waypointComplicationDeactivationTimer;
    self->_waypointComplicationDeactivationTimer = 0;
  }
}

- (BOOL)isWaypointComplicationActive
{
  return self->_waypointComplicationActive;
}

- (void)setWaypointComplicationActive:(BOOL)a3
{
  self->_waypointComplicationActive = a3;
}

- (void).cxx_destruct
{
}

@end
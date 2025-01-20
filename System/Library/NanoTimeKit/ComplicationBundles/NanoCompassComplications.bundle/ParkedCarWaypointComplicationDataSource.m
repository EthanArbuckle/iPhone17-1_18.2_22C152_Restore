@interface ParkedCarWaypointComplicationDataSource
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
+ (id)sectionIdentifier;
- (BOOL)isParkedCarComplication;
- (BOOL)isSmartComplication;
- (ParkedCarWaypointComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_newTemplateWithAlwaysOn:(BOOL)a3;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)sampleTemplate;
- (void)_monitorParkedCarEvents;
- (void)_startMonitoringVehicleEvents;
- (void)_stopMonitoringVehicleEvents;
- (void)_updateParkedCarWaypointWith:(id)a3 withError:(id)a4;
- (void)becomeActive;
- (void)becomeInactive;
- (void)dealloc;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation ParkedCarWaypointComplicationDataSource

+ (id)complicationNameLocalizationKey
{
  return @"PARKED_CAR_WAYPOINT_COMPLICATION_NAME";
}

+ (id)bundleIdentifierSuffix
{
  return @".parkedCar.waypoint";
}

+ (id)sectionIdentifier
{
  return @"com.apple.NanoCompass.watchkitapp.waypoints";
}

- (ParkedCarWaypointComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v25.receiver = self;
  v25.super_class = (Class)ParkedCarWaypointComplicationDataSource;
  v5 = [(SmartWaypointComplicationDataSource *)&v25 initWithComplication:a3 family:a4 forDevice:a5];
  v6 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x263F37F08]);
  routineManager = v5->_routineManager;
  v5->_routineManager = v6;

  objc_msgSend__startMonitoringVehicleEvents(v5, v8, v9, v10);
  v14 = objc_msgSend_idealizedLocation(NCLocation, v11, v12, v13);
  v18 = objc_msgSend_rawLocation(v14, v15, v16, v17);
  v21 = objc_msgSend_sampleParkedCarWaypointWithLocation_(NCWaypoint, v19, (uint64_t)v18, v20);
  objc_msgSend_setWaypoint_(v5, v22, (uint64_t)v21, v23);

  return v5;
}

- (void)dealloc
{
  objc_msgSend__stopMonitoringVehicleEvents(self, a2, v2, v3);
  routineManager = self->_routineManager;
  self->_routineManager = 0;

  v6.receiver = self;
  v6.super_class = (Class)ParkedCarWaypointComplicationDataSource;
  [(SmartWaypointComplicationDataSource *)&v6 dealloc];
}

- (void)becomeActive
{
  objc_msgSend__startMonitoringVehicleEvents(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)ParkedCarWaypointComplicationDataSource;
  [(SmartWaypointComplicationDataSource *)&v5 becomeActive];
}

- (void)becomeInactive
{
  objc_msgSend__stopMonitoringVehicleEvents(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)ParkedCarWaypointComplicationDataSource;
  [(SmartWaypointComplicationDataSource *)&v5 becomeInactive];
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  objc_super v6 = (void (**)(id, void *))a5;
  uint64_t v10 = objc_msgSend_sharedComplicationManager(NCWaypointManager, v7, v8, v9);
  v14 = objc_msgSend_parkedCarWaypoint(v10, v11, v12, v13);
  if (v14)
  {
    BOOL hasVehicleEvents = self->_hasVehicleEvents;

    if (hasVehicleEvents)
    {
      v19 = NSString;
      uint64_t v20 = objc_msgSend_sharedComplicationManager(NCWaypointManager, v16, v17, v18);
      v24 = objc_msgSend_parkedCarWaypoint(v20, v21, v22, v23);
      v28 = objc_msgSend_uuid(v24, v25, v26, v27);
      v32 = objc_msgSend_UUIDString(v28, v29, v30, v31);
      v35 = objc_msgSend_stringWithFormat_(v19, v33, @"nanocompass://launch?uuid=%@", v34, v32);

      v38 = objc_msgSend_URLWithString_(NSURL, v36, (uint64_t)v35, v37);

      goto LABEL_6;
    }
  }
  else
  {
  }
  v38 = objc_msgSend_URLWithString_(NSURL, v16, @"nanocompass://launch", v18);
LABEL_6:
  v39 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[ParkedCarWaypointComplicationDataSource getLaunchURLForTimelineEntryDate:timeTravelDate:withHandler:]";
    __int16 v42 = 2112;
    v43 = v38;
    _os_log_impl(&dword_23759D000, v39, OS_LOG_TYPE_DEFAULT, "%s: launch url is %@", buf, 0x16u);
  }

  v6[2](v6, v38);
}

- (BOOL)isSmartComplication
{
  return 0;
}

- (BOOL)isParkedCarComplication
{
  return 1;
}

- (void)_monitorParkedCarEvents
{
  objc_initWeak(&location, self);
  routineManager = self->_routineManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2375CC9F8;
  v11[3] = &unk_264CD5ED8;
  objc_copyWeak(&v12, &location);
  objc_msgSend_fetchLastVehicleEventsWithHandler_(routineManager, v4, (uint64_t)v11, v5);
  objc_super v6 = self->_routineManager;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2375CCAE0;
  v9[3] = &unk_264CD5ED8;
  objc_copyWeak(&v10, &location);
  objc_msgSend_startMonitoringVehicleEventsWithHandler_(v6, v7, (uint64_t)v9, v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_startMonitoringVehicleEvents
{
  if (!self->_monitoringParkedCarEvents)
  {
    self->_monitoringParkedCarEvents = 1;
    ((void (*)(ParkedCarWaypointComplicationDataSource *, char *))MEMORY[0x270F9A6D0])(self, sel__monitorParkedCarEvents);
  }
}

- (void)_stopMonitoringVehicleEvents
{
  if (self->_monitoringParkedCarEvents)
  {
    objc_msgSend_stopMonitoringVehicleEvents(self->_routineManager, a2, v2, v3);
    self->_monitoringParkedCarEvents = 0;
  }
}

- (void)_updateParkedCarWaypointWith:(id)a3 withError:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v11 = v7;
  if (v6 && !v7 && objc_msgSend_count(v6, v8, v9, v10))
  {
    self->_BOOL hasVehicleEvents = 1;
    v15 = objc_msgSend_firstObject(v6, v12, v13, v14);
    id v16 = objc_alloc(MEMORY[0x263F00A50]);
    uint64_t v20 = objc_msgSend_location(v15, v17, v18, v19);
    objc_msgSend_latitude(v20, v21, v22, v23);
    double v25 = v24;
    v29 = objc_msgSend_location(v15, v26, v27, v28);
    objc_msgSend_longitude(v29, v30, v31, v32);
    uint64_t v37 = objc_msgSend_initWithLatitude_longitude_(v16, v33, v34, v35, v25, v36);

    v38 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 138412290;
      v54 = v37;
      _os_log_impl(&dword_23759D000, v38, OS_LOG_TYPE_DEFAULT, "RTVehicleEvent has parked car location at %@", (uint8_t *)&v53, 0xCu);
    }

    __int16 v42 = objc_msgSend_sharedComplicationManager(NCWaypointManager, v39, v40, v41);
    objc_msgSend_updateParkedCarWaypointWithLocation_(v42, v43, (uint64_t)v37, v44);
  }
  else
  {
    v45 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_23759D000, v45, OS_LOG_TYPE_DEFAULT, "RTVehicleEvent has error or empty parked car location, resetting parked car waypoint", (uint8_t *)&v53, 2u);
    }

    objc_msgSend_setWaypoint_(self, v46, 0, v47);
    self->_BOOL hasVehicleEvents = 0;
    v15 = objc_msgSend_sharedComplicationManager(NCWaypointManager, v48, v49, v50);
    objc_msgSend_updateParkedCarWaypointWithLocation_(v15, v51, 0, v52);
  }
}

- (id)sampleTemplate
{
  uint64_t v5 = objc_msgSend_parkedCarLabel(NCWaypoint, a2, v2, v3);
  uint64_t v9 = objc_msgSend_parkedCarSymbolColor(NCWaypoint, v6, v7, v8);
  v11 = objc_msgSend__templateWithSampleWaypointLabel_symbol_color_(self, v10, (uint64_t)v5, @"car.fill", v9);

  return v11;
}

- (id)newTemplate
{
  objc_msgSend_sampleTemplate(self, a2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)alwaysOnTemplate
{
  uint64_t v3 = objc_msgSend__newTemplateWithAlwaysOn_(self, a2, 1, v2);

  return v3;
}

- (id)_newTemplateWithAlwaysOn:(BOOL)a3
{
  char IsActive = objc_msgSend__complicationTargetingIsActive(self, a2, a3, v3);
  BOOL hasVehicleEvents = self->_hasVehicleEvents;
  if (self->_hasVehicleEvents)
  {
    v11 = objc_msgSend_sharedComplicationManager(NCWaypointManager, v6, v7, v8);
    v15 = objc_msgSend_parkedCarWaypoint(v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
  }
  else
  {
    v11 = objc_msgSend_idealizedLocation(NCLocation, v6, v7, v8);
    v15 = objc_msgSend_rawLocation(v11, v20, v21, v22);
    uint64_t v19 = objc_msgSend_sampleParkedCarWaypointWithLocation_(NCWaypoint, v23, (uint64_t)v15, v24);
  }
  double v25 = (void *)v19;
  if (hasVehicleEvents) {
    char v26 = IsActive ^ 1;
  }
  else {
    char v26 = 1;
  }

  uint64_t v30 = objc_msgSend_location(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_copy(v30, v31, v32, v33);
  v38 = objc_msgSend_heading(self, v35, v36, v37);
  __int16 v42 = objc_msgSend_copy(v38, v39, v40, v41);
  v46 = objc_msgSend_altitude(self, v43, v44, v45);
  uint64_t v50 = objc_msgSend_copy(v46, v47, v48, v49);
  uint64_t v54 = objc_msgSend_calibrated(self, v51, v52, v53);
  BYTE2(v58) = 0;
  BYTE1(v58) = a3;
  LOBYTE(v58) = v26;
  v56 = objc_msgSend__templateWithWaypoint_location_heading_altitude_deviceCalibrated_showNoData_showInactiveState_showAlwaysOnState_showPrivacyOnState_(self, v55, (uint64_t)v25, (uint64_t)v34, v42, v50, v54, 0, v58);

  return v56;
}

- (void).cxx_destruct
{
}

@end
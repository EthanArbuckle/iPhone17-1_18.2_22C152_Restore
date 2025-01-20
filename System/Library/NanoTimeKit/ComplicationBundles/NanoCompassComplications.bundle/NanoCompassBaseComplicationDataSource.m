@interface NanoCompassBaseComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (NSString)appNameLocalizationKey;
+ (NSString)bundleIdentifierSuffix;
+ (NSString)complicationNameLocalizationKey;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)localizedAppName;
+ (id)localizedComplicationName;
+ (id)sectionIdentifier;
- (BOOL)_needsInvalidation;
- (BOOL)calibrated;
- (BOOL)paused;
- (BOOL)useAltimeter;
- (BOOL)usesBearing;
- (BOOL)usesLocation;
- (BOOL)usesMotion;
- (CLKComplicationTemplate)alwaysOnTemplate;
- (CLKComplicationTimelineEntry)timelineEntry;
- (NCAltitude)altitude;
- (NCBearing)bearing;
- (NCHeading)heading;
- (NCIncline)incline;
- (NCLocation)location;
- (NCManager)manager;
- (NCManagerAltimeterToken)altimeterToken;
- (NCManagerLocationToken)locationToken;
- (NCMotionManagerToken)motionToken;
- (NanoCompassBaseComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5 mode:(int64_t)a6;
- (float)tritium_randomizedPossibility;
- (id)currentSwitcherTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)randomizedTemplate;
- (id)tritium_randomizedComplicationTemplateForDate:(id)a3 prevTemplateDate:(id)a4;
- (void)_invalidate;
- (void)_startObservingNotifications;
- (void)_stopObservingNotifications;
- (void)dealloc;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAltimeterToken:(id)a3;
- (void)setAltitude:(id)a3;
- (void)setAlwaysOnTemplate:(id)a3;
- (void)setBearing:(id)a3;
- (void)setCalibrated:(BOOL)a3;
- (void)setHeading:(id)a3;
- (void)setIncline:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationToken:(id)a3;
- (void)setManager:(id)a3;
- (void)setMotionToken:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTimelineEntry:(id)a3;
@end

@implementation NanoCompassBaseComplicationDataSource

+ (id)bundleIdentifier
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375A786C;
  block[3] = &unk_264CD5630;
  block[4] = a1;
  if (qword_268920CD8 != -1) {
    dispatch_once(&qword_268920CD8, block);
  }
  v5 = (void *)qword_268920CD0;
  v6 = objc_msgSend_bundleIdentifierSuffix(a1, a2, v2, v3);
  v9 = objc_msgSend_stringByAppendingString_(v5, v7, (uint64_t)v6, v8);

  return v9;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    __int16 v23 = 2048;
    v24 = self;
    _os_log_impl(&dword_23759D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@<%p> dealloc]", buf, 0x16u);
  }
  motionToken = self->_motionToken;
  if (motionToken)
  {
    objc_msgSend_stopMotionUpdatesForToken_(self->_manager, v3, (uint64_t)motionToken, v4);
    objc_msgSend_setMotionToken_(self, v8, 0, v9);
  }
  locationToken = self->_locationToken;
  if (locationToken)
  {
    objc_msgSend_stopLocationUpdatesForToken_(self->_manager, v3, (uint64_t)locationToken, v4);
    objc_msgSend_setLocationToken_(self, v11, 0, v12);
  }
  if (objc_msgSend_isAbsoluteAltimeterAvailable(self->_manager, v3, (uint64_t)locationToken, v4)
    && self->_altimeterToken)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23759D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "stopping absolute altimeter update.", buf, 2u);
    }
    objc_msgSend_stopAltimeterUpdateForToken_(self->_manager, v16, (uint64_t)self->_altimeterToken, v17);
    objc_msgSend_setAltimeterToken_(self, v18, 0, v19);
  }
  objc_msgSend__stopObservingNotifications(self, v13, v14, v15);
  v20.receiver = self;
  v20.super_class = (Class)NanoCompassBaseComplicationDataSource;
  [(NanoCompassBaseComplicationDataSource *)&v20 dealloc];
}

+ (id)appIdentifier
{
  return @"com.apple.NanoCompass.watchkitapp";
}

+ (id)localizedAppName
{
  uint64_t v4 = objc_msgSend_appNameLocalizationKey(a1, a2, v2, v3);
  v5 = NanoCompassLocalizedString(v4);

  return v5;
}

+ (id)localizedComplicationName
{
  uint64_t v4 = objc_msgSend_complicationNameLocalizationKey(a1, a2, v2, v3);
  v5 = NanoCompassLocalizedString(v4);

  return v5;
}

+ (id)sectionIdentifier
{
  return @"com.apple.NanoCompass.watchkitapp";
}

- (NanoCompassBaseComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5 mode:(int64_t)a6
{
  char v6 = a6;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    v59 = v13;
    __int16 v60 = 2048;
    v61 = self;
    _os_log_impl(&dword_23759D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@<%p> init...]", buf, 0x16u);
  }
  v57.receiver = self;
  v57.super_class = (Class)NanoCompassBaseComplicationDataSource;
  uint64_t v17 = [(CLKCComplicationDataSource *)&v57 initWithComplication:v10 family:a4 forDevice:v11];
  if (v17)
  {
    v18 = objc_msgSend_sharedComplicationManager(NCManager, v14, v15, v16);
    objc_msgSend_setManager_(v17, v19, (uint64_t)v18, v20);

    v17->_usesMotion = v6 & 1;
    v17->_usesBearing = (v6 & 2) != 0;
    v17->_usesLocation = (v6 & 4) != 0;
    if (supportAbsoluteAltimeterFeatures()) {
      v17->_useAltimeter = (v6 & 8) != 0;
    }
    v24 = objc_msgSend_idealizedHeading(NCHeading, v21, v22, v23);
    objc_msgSend_setHeading_(v17, v25, (uint64_t)v24, v26);

    v30 = objc_msgSend_idealizedBearing(NCBearing, v27, v28, v29);
    objc_msgSend_setBearing_(v17, v31, (uint64_t)v30, v32);

    v36 = objc_msgSend_idealizedIncline(NCIncline, v33, v34, v35);
    objc_msgSend_setIncline_(v17, v37, (uint64_t)v36, v38);

    objc_msgSend_setCalibrated_(v17, v39, 1, v40);
    v44 = objc_msgSend_idealizedLocation(NCLocation, v41, v42, v43);
    objc_msgSend_setLocation_(v17, v45, (uint64_t)v44, v46);

    v50 = objc_msgSend_idealizedAltitude(NCAltitude, v47, v48, v49);
    objc_msgSend_setAltitude_(v17, v51, (uint64_t)v50, v52);

    objc_msgSend__startObservingNotifications(v17, v53, v54, v55);
  }

  return v17;
}

- (CLKComplicationTimelineEntry)timelineEntry
{
  timelineEntry = self->_timelineEntry;
  if (!timelineEntry)
  {
    objc_msgSend__invalidate(self, a2, v2, v3);
    timelineEntry = self->_timelineEntry;
  }

  return timelineEntry;
}

- (id)currentSwitcherTemplate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v14 = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = self;
    _os_log_impl(&dword_23759D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@<%p> currentSwitcherTemplate]", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v8 = objc_msgSend_timelineEntry(self, v3, v4, v5);
  uint64_t v12 = objc_msgSend_complicationTemplate(v8, v9, v10, v11);

  return v12;
}

- (CLKComplicationTemplate)alwaysOnTemplate
{
  alwaysOnTemplate = self->_alwaysOnTemplate;
  if (!alwaysOnTemplate)
  {
    char v6 = objc_msgSend_noDataTemplate(self, a2, v2, v3);
    objc_msgSend_setAlwaysOnTemplate_(self, v7, (uint64_t)v6, v8);

    alwaysOnTemplate = self->_alwaysOnTemplate;
  }

  return alwaysOnTemplate;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  objc_msgSend_timelineEntry(self, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v9);
}

- (void)_invalidate
{
  id v5 = (void *)MEMORY[0x263EFD168];
  char v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3);
  uint64_t v10 = objc_msgSend_newTemplate(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_entryWithDate_complicationTemplate_(v5, v11, (uint64_t)v6, (uint64_t)v10);
  objc_msgSend_setTimelineEntry_(self, v13, (uint64_t)v12, v14);

  objc_msgSend_delegate(self, v15, v16, v17);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateEntries(v21, v18, v19, v20);
}

- (BOOL)_needsInvalidation
{
  return objc_msgSend_paused(self, a2, v2, v3) ^ 1;
}

- (float)tritium_randomizedPossibility
{
  return 1.0;
}

- (id)tritium_randomizedComplicationTemplateForDate:(id)a3 prevTemplateDate:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_randomizedTemplate, a3, a4);
}

- (void)_startObservingNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v6, v5, (uint64_t)self, (uint64_t)sel__invalidate, *MEMORY[0x263EFF458], 0);
}

- (void)_stopObservingNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v5, (uint64_t)self, *MEMORY[0x263EFF458], 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  isEqualToString = (const char *)a5;
  uint64_t v11 = isEqualToString;
  if (a6 == &off_264CD5650)
  {
    uint64_t v26 = (char *)isEqualToString;
    isEqualToString = (const char *)objc_msgSend_isEqualToString_(a3, isEqualToString, @"bearing", v10);
    uint64_t v11 = v26;
    if (isEqualToString)
    {
      v13 = objc_msgSend_objectForKeyedSubscript_(v26, v26, *MEMORY[0x263F081B8], v12);
      uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
      int isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

      if (isEqual) {
        objc_msgSend_setBearing_(self, v21, 0, v22);
      }
      else {
        objc_msgSend_setBearing_(self, v21, (uint64_t)v13, v22);
      }
      if (self->_paused) {
        objc_msgSend__invalidate(self, v23, v24, v25);
      }

      uint64_t v11 = v26;
    }
  }

  MEMORY[0x270F9A758](isEqualToString, v11);
}

- (NCManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (BOOL)usesMotion
{
  return self->_usesMotion;
}

- (NCMotionManagerToken)motionToken
{
  return self->_motionToken;
}

- (void)setMotionToken:(id)a3
{
}

- (NCHeading)heading
{
  return self->_heading;
}

- (void)setHeading:(id)a3
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

- (NCIncline)incline
{
  return self->_incline;
}

- (void)setIncline:(id)a3
{
}

- (BOOL)usesLocation
{
  return self->_usesLocation;
}

- (NCLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NCAltitude)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(id)a3
{
}

- (BOOL)useAltimeter
{
  return self->_useAltimeter;
}

- (BOOL)usesBearing
{
  return self->_usesBearing;
}

- (NCBearing)bearing
{
  return self->_bearing;
}

- (void)setBearing:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (NCManagerLocationToken)locationToken
{
  return self->_locationToken;
}

- (void)setLocationToken:(id)a3
{
}

- (NCManagerAltimeterToken)altimeterToken
{
  return self->_altimeterToken;
}

- (void)setAltimeterToken:(id)a3
{
}

- (void)setTimelineEntry:(id)a3
{
}

- (void)setAlwaysOnTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alwaysOnTemplate, 0);
  objc_storeStrong((id *)&self->_timelineEntry, 0);
  objc_storeStrong((id *)&self->_altimeterToken, 0);
  objc_storeStrong((id *)&self->_locationToken, 0);
  objc_storeStrong((id *)&self->_bearing, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_incline, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_motionToken, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

+ (NSString)appNameLocalizationKey
{
  return (NSString *)&stru_26EA49580;
}

+ (NSString)complicationNameLocalizationKey
{
  return (NSString *)&stru_26EA49580;
}

+ (NSString)bundleIdentifierSuffix
{
  return (NSString *)&stru_26EA49580;
}

- (id)newTemplate
{
  sub_2375A34A0();
  sub_2375A3484();

  return (id)objc_opt_new();
}

- (id)noDataTemplate
{
  sub_2375A34A0();
  sub_2375A3484();
  uint64_t v2 = objc_opt_new();

  return v2;
}

- (id)randomizedTemplate
{
  sub_2375A34A0();
  sub_2375A3484();
  uint64_t v2 = objc_opt_new();

  return v2;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

@end
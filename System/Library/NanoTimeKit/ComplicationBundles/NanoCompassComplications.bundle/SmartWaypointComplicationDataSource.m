@interface SmartWaypointComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
+ (id)sectionIdentifier;
- (BOOL)_complicationTargetingIsActive;
- (BOOL)_needsInvalidation;
- (BOOL)isParkedCarComplication;
- (BOOL)isSmartComplication;
- (NCWaypoint)targetedWaypoint;
- (NCWaypoint)waypoint;
- (NSDate)targetedViewUsageTimestamp;
- (SmartWaypointComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateWithSampleWaypointLabel:(id)a3 symbol:(id)a4 color:(id)a5;
- (id)_templateWithWaypoint:(id)a3 location:(id)a4 heading:(id)a5 altitude:(id)a6 deviceCalibrated:(BOOL)a7 showNoData:(BOOL)a8 showInactiveState:(BOOL)a9 showAlwaysOnState:(BOOL)a10 showPrivacyOnState:(BOOL)a11;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)privacyTemplate;
- (id)randomizedTemplate;
- (id)redactionTextProvider;
- (id)sampleTemplate;
- (void)_fetchTargetedWaypoint;
- (void)_handleDeviceLockChange;
- (void)becomeActive;
- (void)becomeInactive;
- (void)dealloc;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)resume;
- (void)setTargetedViewUsageTimestamp:(id)a3;
- (void)setTargetedWaypoint:(id)a3;
- (void)setWaypoint:(id)a3;
@end

@implementation SmartWaypointComplicationDataSource

+ (id)appNameLocalizationKey
{
  return @"WAYPOINTS_COMPLICATION_SECTION_TITLE";
}

+ (id)complicationNameLocalizationKey
{
  return @"SMART_WAYPOINT_COMPLICATION_NAME";
}

+ (id)bundleIdentifierSuffix
{
  return @".waypoint";
}

+ (id)sectionIdentifier
{
  return @"com.apple.NanoCompass.watchkitapp.waypoints";
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_supportsUrsa(v5, v6, v7, v8))
  {
    id v9 = objc_alloc(MEMORY[0x263F08C38]);
    v12 = objc_msgSend_initWithUUIDString_(v9, v10, @"4AF61239-2126-4FD6-8E7A-CDA2D7A0BFE9", v11);
    int v15 = objc_msgSend_supportsCapability_(v5, v13, (uint64_t)v12, v14);

    if (v15)
    {
      if ((objc_msgSend_isTinker(v5, v16, v17, v18) & 1) == 0)
      {
        if (!objc_msgSend_showingIdealizedData(NCManager, v19, v20, v21))
        {
          BOOL v23 = (unint64_t)(a3 - 8) < 5;
          goto LABEL_9;
        }
        v22 = NCLogForCategory(1uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_23759D000, v22, OS_LOG_TYPE_DEFAULT, "running fixture demo mode. disable the waypoint complication in complication picker.", v25, 2u);
        }
      }
    }
  }
  BOOL v23 = 0;
LABEL_9:

  return v23;
}

- (SmartWaypointComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)SmartWaypointComplicationDataSource;
  id v5 = -[NanoCompassBaseComplicationDataSource initWithComplication:family:forDevice:mode:](&v20, sel_initWithComplication_family_forDevice_mode_, a3);
  id v9 = objc_msgSend_idealizedWaypoint(NCWaypoint, v6, v7, v8);
  objc_msgSend_setWaypoint_(v5, v10, (uint64_t)v9, v11);

  id v12 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v15 = objc_msgSend_initWithSuiteName_(v12, v13, @"com.apple.compass", v14);
  defaults = v5->_defaults;
  v5->_defaults = (NSUserDefaults *)v15;

  objc_msgSend_addObserver_forKeyPath_options_context_(v5->_defaults, v17, (uint64_t)v5, @"TargetedWaypointUUID", 5, &off_264CD5E50);
  objc_msgSend_addObserver_forKeyPath_options_context_(v5->_defaults, v18, (uint64_t)v5, @"TargetedViewUsageTimestamp", 5, &off_264CD5E58);
  return v5;
}

- (void)dealloc
{
  objc_msgSend_removeObserver_forKeyPath_context_(self->_defaults, a2, (uint64_t)self, @"TargetedWaypointUUID", &off_264CD5E50);
  objc_msgSend_removeObserver_forKeyPath_context_(self->_defaults, v3, (uint64_t)self, @"TargetedViewUsageTimestamp", &off_264CD5E58);
  v4.receiver = self;
  v4.super_class = (Class)SmartWaypointComplicationDataSource;
  [(NanoCompassBaseComplicationDataSource *)&v4 dealloc];
}

- (void)resume
{
  v19.receiver = self;
  v19.super_class = (Class)SmartWaypointComplicationDataSource;
  [(CLKCComplicationDataSource *)&v19 resume];
  objc_msgSend__fetchTargetedWaypoint(self, v3, v4, v5);
  if ((objc_msgSend__complicationTargetingIsActive(self, v6, v7, v8) & 1) == 0)
  {
    id v12 = objc_msgSend_manager(self, v9, v10, v11);
    v16 = objc_msgSend_motionToken(self, v13, v14, v15);
    objc_msgSend_pauseMotionUpdatesForToken_(v12, v17, (uint64_t)v16, v18);
  }
}

- (BOOL)_needsInvalidation
{
  if (objc_msgSend_paused(self, a2, v2, v3)) {
    return 0;
  }

  return objc_msgSend__complicationTargetingIsActive(self, v5, v6, v7);
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a5;
  uint64_t v10 = objc_msgSend_targetedWaypoint(self, v7, v8, v9);
  if (v10
    && (uint64_t v14 = (void *)v10,
        int IsActive = objc_msgSend__complicationTargetingIsActive(self, v11, v12, v13),
        v14,
        IsActive))
  {
    uint64_t v17 = NSString;
    uint64_t v18 = objc_msgSend_targetedWaypoint(self, v11, v16, v13);
    v22 = objc_msgSend_uuid(v18, v19, v20, v21);
    v26 = objc_msgSend_UUIDString(v22, v23, v24, v25);
    v29 = objc_msgSend_stringWithFormat_(v17, v27, @"nanocompass://launch?uuid=%@", v28, v26);

    v32 = objc_msgSend_URLWithString_(NSURL, v30, (uint64_t)v29, v31);
  }
  else
  {
    v32 = objc_msgSend_URLWithString_(NSURL, v11, @"nanocompass://launch?showPicker", v13);
  }
  v33 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SmartWaypointComplicationDataSource getLaunchURLForTimelineEntryDate:timeTravelDate:withHandler:]";
    __int16 v36 = 2112;
    v37 = v32;
    _os_log_impl(&dword_23759D000, v33, OS_LOG_TYPE_DEFAULT, "%s: launch url is %@", buf, 0x16u);
  }

  v6[2](v6, v32);
}

- (BOOL)isSmartComplication
{
  return 1;
}

- (BOOL)isParkedCarComplication
{
  return 0;
}

- (void)becomeActive
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!self->_isActive)
  {
    self->_isActive = 1;
    uint64_t v3 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315138;
      v32 = "-[SmartWaypointComplicationDataSource becomeActive]";
      _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s face is set as current", (uint8_t *)&v31, 0xCu);
    }

    uint64_t v7 = objc_msgSend_device(self, v4, v5, v6);
    char isLocked = objc_msgSend_isLocked(v7, v8, v9, v10);

    if ((isLocked & 1) == 0)
    {
      uint64_t v15 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_23759D000, v15, OS_LOG_TYPE_DEFAULT, "device is unlocked. activate waypoint complication", (uint8_t *)&v31, 2u);
      }

      objc_super v19 = objc_msgSend_manager(self, v16, v17, v18);
      objc_msgSend_setWaypointComplicationIsActive_(v19, v20, 1, v21);

      uint64_t v25 = objc_msgSend_manager(self, v22, v23, v24);
      objc_msgSend_activateWaypointComplication(v25, v26, v27, v28);
    }
    v29 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v12, v13, v14);
    objc_msgSend_addObserver_selector_name_object_(v29, v30, (uint64_t)self, (uint64_t)sel__handleDeviceLockChange, *MEMORY[0x263EFCF38], 0);
  }
}

- (void)becomeInactive
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_isActive)
  {
    uint64_t v3 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[SmartWaypointComplicationDataSource becomeInactive]";
      _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s face is not set as current, deactivate waypoint complication", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v7 = objc_msgSend_manager(self, v4, v5, v6);
    objc_msgSend_setWaypointComplicationIsActive_(v7, v8, 0, v9);

    uint64_t v13 = objc_msgSend_manager(self, v10, v11, v12);
    objc_msgSend_deactivateWaypointComplication(v13, v14, v15, v16);

    self->_isActive = 0;
    uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v17, v18, v19);
    objc_msgSend_removeObserver_name_object_(v20, v21, (uint64_t)self, *MEMORY[0x263EFCF38], 0);
  }
}

- (void)_fetchTargetedWaypoint
{
  objc_msgSend_sharedManager(NCGuidesManager, a2, v2, v3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_fetchTargetedWaypoint(v15, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setTargetedWaypoint_(self, v13, (uint64_t)v12, v14);
}

- (void)_handleDeviceLockChange
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_device(self, a2, v2, v3);
  int isLocked = objc_msgSend_isLocked(v5, v6, v7, v8);

  uint64_t v10 = NCLogForCategory(7uLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (isLocked)
  {
    if (v11)
    {
      *(_DWORD *)v72 = 136315138;
      *(void *)&v72[4] = "-[SmartWaypointComplicationDataSource _handleDeviceLockChange]";
      _os_log_impl(&dword_23759D000, v10, OS_LOG_TYPE_DEFAULT, "%s device is locked, deactivate waypoint complication", v72, 0xCu);
    }

    id v15 = objc_msgSend_manager(self, v12, v13, v14);
    objc_msgSend_setWaypointComplicationIsActive_(v15, v16, 0, v17);

    uint64_t v21 = objc_msgSend_manager(self, v18, v19, v20);
    objc_msgSend_deactivateWaypointComplication(v21, v22, v23, v24);
LABEL_19:

    goto LABEL_20;
  }
  if (v11)
  {
    uint64_t v25 = &stru_26EA49580;
    BOOL v26 = !self->_isActive;
    if (self->_isActive) {
      uint64_t v27 = &stru_26EA49580;
    }
    else {
      uint64_t v27 = @"not ";
    }
    *(_DWORD *)v72 = 136315650;
    *(void *)&v72[4] = "-[SmartWaypointComplicationDataSource _handleDeviceLockChange]";
    *(void *)&v72[14] = v27;
    *(_WORD *)&v72[12] = 2112;
    if (v26) {
      uint64_t v25 = @"don't ";
    }
    *(_WORD *)&v72[22] = 2112;
    v73 = v25;
    _os_log_impl(&dword_23759D000, v10, OS_LOG_TYPE_DEFAULT, "%s device is unlocked, face is %@active. %@activate waypoint complication", v72, 0x20u);
  }

  if (self->_isActive)
  {
    int v31 = objc_msgSend_manager(self, v28, v29, v30);
    objc_msgSend_setWaypointComplicationIsActive_(v31, v32, 1, v33);

    v37 = objc_msgSend_manager(self, v34, v35, v36);
    objc_msgSend_activateWaypointComplication(v37, v38, v39, v40);
  }
  objc_msgSend__fetchTargetedWaypoint(self, v28, v29, v30, *(_OWORD *)v72, *(void *)&v72[16]);
  if ((objc_msgSend_isSmartComplication(self, v41, v42, v43) & 1) == 0
    && (objc_msgSend_isParkedCarComplication(self, v44, v45, v46) & 1) == 0)
  {
    v47 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend_waypoint(self, v48, v49, v50);
      v55 = objc_msgSend_label(v51, v52, v53, v54);
      *(_DWORD *)v72 = 136315394;
      *(void *)&v72[4] = "-[SmartWaypointComplicationDataSource _handleDeviceLockChange]";
      *(_WORD *)&v72[12] = 2112;
      *(void *)&v72[14] = v55;
      _os_log_impl(&dword_23759D000, v47, OS_LOG_TYPE_DEFAULT, "%s device unlocked, re-reading in waypoint %@", v72, 0x16u);
    }
    uint64_t v21 = objc_msgSend_sharedComplicationManager(NCWaypointManager, v56, v57, v58);
    v62 = objc_msgSend_waypoint(self, v59, v60, v61);
    v66 = objc_msgSend_uuid(v62, v63, v64, v65);
    v69 = objc_msgSend_waypointWithUUID_(v21, v67, (uint64_t)v66, v68);
    objc_msgSend_setWaypoint_(self, v70, (uint64_t)v69, v71);

    goto LABEL_19;
  }
LABEL_20:
  objc_msgSend__invalidate(self, v44, v45, v46);
}

- (BOOL)_complicationTargetingIsActive
{
  uint64_t v8 = objc_msgSend_targetedViewUsageTimestamp(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_targetedViewUsageTimestamp(self, v5, v6, v7);
    uint64_t v13 = objc_msgSend_now(MEMORY[0x263EFF910], v10, v11, v12);
    BOOL IsSameDay = NanoCompassIsSameDay(v9, v13);
  }
  else
  {
    BOOL IsSameDay = 0;
  }

  return IsSameDay;
}

- (id)sampleTemplate
{
  uint64_t v5 = objc_msgSend_idealizedSmartWaypoint(NCWaypoint, a2, v2, v3);
  uint64_t v9 = objc_msgSend_label(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_symbol(v5, v10, v11, v12);
  uint64_t v17 = objc_msgSend_labelColor(v5, v14, v15, v16);
  uint64_t v19 = objc_msgSend__templateWithSampleWaypointLabel_symbol_color_(self, v18, (uint64_t)v9, (uint64_t)v13, v17);

  return v19;
}

- (id)newTemplate
{
  objc_msgSend_sampleTemplate(self, a2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)noDataTemplate
{
  BYTE2(v3) = 0;
  LOWORD(v3) = 0;
  return (id)objc_msgSend__templateWithWaypoint_location_heading_altitude_deviceCalibrated_showNoData_showInactiveState_showAlwaysOnState_showPrivacyOnState_(self, a2, 0, 0, 0, 0, 0, 1, v3);
}

- (id)randomizedTemplate
{
  uint64_t v5 = objc_msgSend_randomizedWaypoint(NCWaypoint, a2, v2, v3);
  uint64_t v9 = objc_msgSend_randomizedLocation(NCLocation, v6, v7, v8);
  uint64_t v13 = objc_msgSend_randomizedHeading(NCHeading, v10, v11, v12);
  uint64_t v17 = objc_msgSend_randomizedAltitude(NCAltitude, v14, v15, v16);
  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  uint64_t v19 = objc_msgSend__templateWithWaypoint_location_heading_altitude_deviceCalibrated_showNoData_showInactiveState_showAlwaysOnState_showPrivacyOnState_(self, v18, (uint64_t)v5, (uint64_t)v9, v13, v17, 1, 0, v21);

  return v19;
}

- (id)alwaysOnTemplate
{
  uint64_t v8 = objc_msgSend_targetedWaypoint(self, a2, v2, v3);
  if (v8)
  {
    int IsActive = objc_msgSend__complicationTargetingIsActive(self, v5, v6, v7);

    if (IsActive)
    {
      uint64_t v10 = objc_msgSend_targetedWaypoint(self, v5, v6, v7);
      uint64_t v8 = objc_msgSend_copy(v10, v11, v12, v13);

      char v14 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = 0;
  }
  char v14 = 1;
LABEL_6:
  uint64_t v15 = objc_msgSend_location(self, v5, v6, v7);
  uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_heading(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_copy(v23, v24, v25, v26);
  int v31 = objc_msgSend_altitude(self, v28, v29, v30);
  uint64_t v35 = objc_msgSend_copy(v31, v32, v33, v34);
  uint64_t v39 = objc_msgSend_calibrated(self, v36, v37, v38);
  *(_WORD *)((char *)&v43 + 1) = 1;
  LOBYTE(v43) = v14;
  v41 = objc_msgSend__templateWithWaypoint_location_heading_altitude_deviceCalibrated_showNoData_showInactiveState_showAlwaysOnState_showPrivacyOnState_(self, v40, (uint64_t)v8, (uint64_t)v19, v27, v35, v39, 0, v43);

  return v41;
}

- (id)privacyTemplate
{
  BYTE2(v3) = 1;
  LOWORD(v3) = 0;
  return (id)objc_msgSend__templateWithWaypoint_location_heading_altitude_deviceCalibrated_showNoData_showInactiveState_showAlwaysOnState_showPrivacyOnState_(self, a2, 0, 0, 0, 0, 0, 1, v3);
}

- (id)_templateWithSampleWaypointLabel:(id)a3 symbol:(id)a4 color:(id)a5
{
  v70[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v69[0] = @"showSampleData";
  v69[1] = @"label";
  v70[0] = &unk_26EA53998;
  v70[1] = v8;
  v69[2] = @"symbol";
  v69[3] = @"color";
  v70[2] = v9;
  v70[3] = v10;
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v70, (uint64_t)v69, 4);
  switch(objc_msgSend_family(self, v13, v14, v15))
  {
    case 8:
      uint64_t v16 = NanoCompassSampleWaypointCornerComplicationTextProvider(v8, v10);
      uint64_t v17 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v18 = objc_opt_class();
      uint64_t v21 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v17, v19, v18, v20);
      objc_msgSend_setMetadata_(v21, v22, (uint64_t)v12, v23);
      uint64_t v25 = objc_msgSend_templateWithTextProvider_imageProvider_(MEMORY[0x263EFD098], v24, (uint64_t)v16, (uint64_t)v21);
      goto LABEL_7;
    case 9:
      uint64_t v16 = NanoCompassSampleWaypointCornerComplicationTextProvider(v8, v10);
      uint64_t v28 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v29 = objc_opt_class();
      uint64_t v21 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v28, v30, v29, v31);
      objc_msgSend_setMetadata_(v21, v32, (uint64_t)v12, v33);
      uint64_t v34 = (void *)MEMORY[0x263EFD018];
      uint64_t v37 = objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v35, (uint64_t)v21, v36);
      uint64_t v25 = objc_msgSend_templateWithCircularTemplate_textProvider_(v34, v38, (uint64_t)v37, (uint64_t)v16);

LABEL_7:
      break;
    case 10:
      uint64_t v39 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v40 = objc_opt_class();
      uint64_t v16 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v39, v41, v40, v42);
      objc_msgSend_setMetadata_(v16, v43, (uint64_t)v12, v44);
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v45, (uint64_t)v16, v46);
      goto LABEL_11;
    case 11:
      v47 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v48 = objc_opt_class();
      uint64_t v16 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v47, v49, v48, v50);
      objc_msgSend_setMetadata_(v16, v51, (uint64_t)v12, v52);
      id v53 = objc_alloc(MEMORY[0x263EFD0D8]);
      uint64_t v56 = objc_msgSend_initWithImageProvider_(v53, v54, (uint64_t)v16, v55);
      goto LABEL_12;
    case 12:
      uint64_t v57 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v58 = objc_opt_class();
      uint64_t v16 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v57, v59, v58, v60);
      objc_msgSend_setMetadata_(v16, v61, (uint64_t)v12, v62);
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD0A0], v63, (uint64_t)v16, v64);
      uint64_t v56 = LABEL_11:;
LABEL_12:
      uint64_t v25 = (void *)v56;
      break;
    default:
      uint64_t v16 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_2375D9490(self, (const char *)v16, v26, v27);
      }
      uint64_t v25 = 0;
      break;
  }

  uint64_t v65 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v25, v66, (uint64_t)v65, v67);

  return v25;
}

- (id)_templateWithWaypoint:(id)a3 location:(id)a4 heading:(id)a5 altitude:(id)a6 deviceCalibrated:(BOOL)a7 showNoData:(BOOL)a8 showInactiveState:(BOOL)a9 showAlwaysOnState:(BOOL)a10 showPrivacyOnState:(BOOL)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  v119[9] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v22 = a6;
  unsigned int v116 = !v12 || v11;
  if (v116 != 1 || a10)
  {
    v118[0] = @"heading";
    if (v18)
    {
      int v112 = 0;
      uint64_t v23 = (uint64_t)v18;
      goto LABEL_7;
    }
  }
  else
  {

    id v17 = 0;
    v118[0] = @"heading";
  }
  uint64_t v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
  id v18 = 0;
  int v112 = 1;
LABEL_7:
  v111 = (void *)v23;
  v119[0] = v23;
  v118[1] = @"location";
  uint64_t v24 = v17;
  if (!v17)
  {
    uint64_t v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
  }
  v119[1] = v24;
  v118[2] = @"waypoint";
  uint64_t v25 = v16;
  if (!v16)
  {
    uint64_t v25 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
  }
  v114 = v18;
  v115 = v17;
  v113 = v16;
  v119[2] = v25;
  v118[3] = @"altitude";
  uint64_t v26 = v22;
  if (!v22)
  {
    uint64_t v26 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
  }
  v119[3] = v26;
  v118[4] = @"nodata";
  uint64_t v27 = objc_msgSend_numberWithBool_(NSNumber, v19, v116, v21);
  v119[4] = v27;
  v118[5] = @"inactive";
  uint64_t v30 = objc_msgSend_numberWithBool_(NSNumber, v28, a9, v29);
  v119[5] = v30;
  v118[6] = @"alwayson";
  uint64_t v33 = objc_msgSend_numberWithBool_(NSNumber, v31, a10, v32);
  v119[6] = v33;
  v118[7] = @"smart";
  uint64_t v34 = NSNumber;
  uint64_t isSmartComplication = objc_msgSend_isSmartComplication(self, v35, v36, v37);
  v41 = objc_msgSend_numberWithBool_(v34, v39, isSmartComplication, v40);
  v119[7] = v41;
  v118[8] = @"showPrivacyRedaction";
  uint64_t v44 = objc_msgSend_numberWithBool_(NSNumber, v42, a11, v43);
  v119[8] = v44;
  uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)v119, (uint64_t)v118, 9);

  if (!v22) {
  if (!v113)
  }

  if (!v115) {
  if (v112)
  }

  switch(objc_msgSend_family(self, v47, v48, v49))
  {
    case 8:
      if (a11)
      {
        objc_msgSend_redactionTextProvider(self, v50, v51, v52);
      }
      else
      {
        int v83 = objc_msgSend_isSmartComplication(self, v50, v51, v52) ^ 1;
        int v87 = objc_msgSend_isSmartComplication(self, v84, v85, v86);
        NanoCompassWaypointCornerAndBezelComplicationTextProvider(v115, (uint64_t)v114, v113, a9, a10, v83, v87);
      id v53 = };
      v88 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v89 = objc_opt_class();
      v92 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v88, v90, v89, v91);
      objc_msgSend_setMetadata_(v92, v93, (uint64_t)v46, v94);
      uint64_t v56 = objc_msgSend_templateWithTextProvider_imageProvider_(MEMORY[0x263EFD098], v95, (uint64_t)v53, (uint64_t)v92);
      goto LABEL_38;
    case 9:
      if ((v116 | a11) == 1) {
        objc_msgSend_redactionTextProvider(self, v50, v51, v52);
      }
      else {
      id v53 = NanoCompassWaypointCornerAndBezelComplicationTextProvider(v115, (uint64_t)v114, v113, a9, a10, 0, 0);
      }
      v96 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v97 = objc_opt_class();
      v92 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v96, v98, v97, v99);
      objc_msgSend_setMetadata_(v92, v100, (uint64_t)v46, v101);
      v102 = (void *)MEMORY[0x263EFD018];
      v105 = objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v103, (uint64_t)v92, v104);
      uint64_t v56 = objc_msgSend_templateWithCircularTemplate_textProvider_(v102, v106, (uint64_t)v105, (uint64_t)v53);

LABEL_38:
      break;
    case 10:
      uint64_t v57 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v58 = objc_opt_class();
      id v53 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v57, v59, v58, v60);
      objc_msgSend_setMetadata_(v53, v61, (uint64_t)v46, v62);
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v63, (uint64_t)v53, v64);
      goto LABEL_32;
    case 11:
      uint64_t v65 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v66 = objc_opt_class();
      id v53 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v65, v67, v66, v68);
      objc_msgSend_setMetadata_(v53, v69, (uint64_t)v46, v70);
      id v71 = objc_alloc(MEMORY[0x263EFD0D8]);
      uint64_t v74 = objc_msgSend_initWithImageProvider_(v71, v72, (uint64_t)v53, v73);
      goto LABEL_33;
    case 12:
      v75 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v76 = objc_opt_class();
      id v53 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v75, v77, v76, v78);
      objc_msgSend_setMetadata_(v53, v79, (uint64_t)v46, v80);
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD0A0], v81, (uint64_t)v53, v82);
      uint64_t v74 = LABEL_32:;
LABEL_33:
      uint64_t v56 = (void *)v74;
      break;
    default:
      id v53 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_2375D950C(self, (const char *)v53, v54, v55);
      }
      uint64_t v56 = 0;
      break;
  }

  v107 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v56, v108, (uint64_t)v107, v109);

  return v56;
}

- (id)redactionTextProvider
{
  if (qword_2689213B0 != -1) {
    dispatch_once(&qword_2689213B0, &unk_26EA48DC0);
  }
  uint64_t v2 = (void *)qword_2689213A8;

  return v2;
}

- (NCWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
}

- (NCWaypoint)targetedWaypoint
{
  return self->_targetedWaypoint;
}

- (void)setTargetedWaypoint:(id)a3
{
}

- (NSDate)targetedViewUsageTimestamp
{
  return self->_targetedViewUsageTimestamp;
}

- (void)setTargetedViewUsageTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedViewUsageTimestamp, 0);
  objc_storeStrong((id *)&self->_targetedWaypoint, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
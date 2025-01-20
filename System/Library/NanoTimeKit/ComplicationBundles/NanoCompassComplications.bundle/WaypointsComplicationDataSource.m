@interface WaypointsComplicationDataSource
+ (BOOL)useComplicationDescriptorsOnCompanion;
+ (id)_descriptorUserInfoForWaypoint:(id)a3;
+ (id)bundleIdentifierSuffix;
+ (id)complicationDescriptors;
+ (id)sectionIdentifier;
- (BOOL)isParkedCarComplication;
- (BOOL)isSmartComplication;
- (WaypointsComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_getWaypointFromDescriptor:(id)a3;
- (id)_getWaypointUUIDFromDescriptor:(id)a3;
- (id)_guidesWaypointWithUUID:(id)a3;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)sampleTemplate;
- (void)dealloc;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation WaypointsComplicationDataSource

+ (id)bundleIdentifierSuffix
{
  return @".waypoints";
}

+ (id)sectionIdentifier
{
  return @"com.apple.NanoCompass.watchkitapp.waypoints";
}

+ (BOOL)useComplicationDescriptorsOnCompanion
{
  return 1;
}

+ (id)complicationDescriptors
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_sharedManager(NCGuidesManager, a2, v2, v3);
  v8 = objc_msgSend_allEnabledWaypoints(v4, v5, v6, v7);

  v51 = v8;
  v11 = objc_msgSend_sortedArrayUsingComparator_(v8, v9, (uint64_t)&unk_26EA48DE0, v10);
  id v12 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v13 = v11;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v52, (uint64_t)v60, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v13);
        }
        v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v23 = objc_msgSend_uuid(v22, v16, v17, v18);

        if (v23)
        {
          id v24 = objc_alloc(MEMORY[0x263EFCF90]);
          v28 = objc_msgSend_uuid(v22, v25, v26, v27);
          v32 = objc_msgSend_UUIDString(v28, v29, v30, v31);
          v36 = objc_msgSend_label(v22, v33, v34, v35);
          v39 = objc_msgSend__descriptorUserInfoForWaypoint_(WaypointsComplicationDataSource, v37, (uint64_t)v22, v38);
          v41 = objc_msgSend_initWithIdentifier_displayName_supportedFamilies_userInfo_(v24, v40, (uint64_t)v32, (uint64_t)v36, &unk_26EA53A88, v39);

          objc_msgSend_addObject_(v12, v42, (uint64_t)v41, v43);
        }
        else
        {
          v41 = NCLogForCategory(7uLL);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v47 = objc_msgSend_label(v22, v44, v45, v46);
            v48 = (void *)v47;
            *(_DWORD *)buf = 136315394;
            v49 = @"also nil";
            if (v47) {
              v49 = (__CFString *)v47;
            }
            v57 = "+[WaypointsComplicationDataSource complicationDescriptors]";
            __int16 v58 = 2112;
            v59 = v49;
            _os_log_impl(&dword_23759D000, v41, OS_LOG_TYPE_DEFAULT, "%s: We have a waypoint without a UUID, skipping.  Label is %@", buf, 0x16u);
          }
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v52, (uint64_t)v60, 16);
    }
    while (v19);
  }

  return v12;
}

- (WaypointsComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)WaypointsComplicationDataSource;
  v5 = [(SmartWaypointComplicationDataSource *)&v30 initWithComplication:a3 family:a4 forDevice:a5];
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_complicationDescriptor(v5, v6, v7, v8);
    id v13 = objc_msgSend__getWaypointFromDescriptor_(v9, v11, (uint64_t)v10, v12);
    objc_msgSend_setWaypoint_(v9, v14, (uint64_t)v13, v15);

    uint64_t v19 = objc_msgSend_waypoint(v9, v16, v17, v18);

    if (v19)
    {
      uint64_t v20 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = objc_msgSend_identifier(v10, v21, v22, v23);
        v28 = objc_msgSend_waypoint(v9, v25, v26, v27);
        *(_DWORD *)buf = 136315650;
        v32 = "-[WaypointsComplicationDataSource initWithComplication:family:forDevice:]";
        __int16 v33 = 2112;
        uint64_t v34 = v24;
        __int16 v35 = 2112;
        v36 = v28;
        _os_log_impl(&dword_23759D000, v20, OS_LOG_TYPE_DEFAULT, "%s descriptor identifier: %@ init waypoint complication %@", buf, 0x20u);
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WaypointsComplicationDataSource;
  [(SmartWaypointComplicationDataSource *)&v2 dealloc];
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a5;
  uint64_t v10 = objc_msgSend_waypoint(self, v7, v8, v9);

  if (v10)
  {
    v14 = NSString;
    uint64_t v15 = objc_msgSend_waypoint(self, v11, v12, v13);
    uint64_t v19 = objc_msgSend_uuid(v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_UUIDString(v19, v20, v21, v22);
    uint64_t v26 = objc_msgSend_stringWithFormat_(v14, v24, @"nanocompass://launch?uuid=%@", v25, v23);

    v29 = objc_msgSend_URLWithString_(NSURL, v27, (uint64_t)v26, v28);
  }
  else
  {
    v29 = objc_msgSend_URLWithString_(NSURL, v11, @"nanocompass://launch", v13);
  }
  objc_super v30 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = objc_msgSend_waypoint(self, v31, v32, v33);
    uint64_t v38 = objc_msgSend_label(v34, v35, v36, v37);
    *(_DWORD *)buf = 136315650;
    v40 = "-[WaypointsComplicationDataSource getLaunchURLForTimelineEntryDate:timeTravelDate:withHandler:]";
    __int16 v41 = 2112;
    v42 = v29;
    __int16 v43 = 2112;
    v44 = v38;
    _os_log_impl(&dword_23759D000, v30, OS_LOG_TYPE_DEFAULT, "%s: launch url is %@, launching to waypoint %@", buf, 0x20u);
  }
  v6[2](v6, v29);
}

- (BOOL)isSmartComplication
{
  return 0;
}

- (BOOL)isParkedCarComplication
{
  return 0;
}

- (id)sampleTemplate
{
  uint64_t v8 = objc_msgSend_waypoint(self, a2, v2, v3);
  if (v8) {
    objc_msgSend_waypoint(self, v5, v6, v7);
  }
  else {
  uint64_t v9 = objc_msgSend_idealizedWaypoint(NCWaypoint, v5, v6, v7);
  }

  uint64_t v13 = objc_msgSend_label(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_symbol(v9, v14, v15, v16);
  uint64_t v21 = objc_msgSend_labelColor(v9, v18, v19, v20);
  uint64_t v23 = objc_msgSend__templateWithSampleWaypointLabel_symbol_color_(self, v22, (uint64_t)v13, (uint64_t)v17, v21);

  return v23;
}

- (id)newTemplate
{
  objc_msgSend_sampleTemplate(self, a2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)alwaysOnTemplate
{
  uint64_t v8 = objc_msgSend_waypoint(self, a2, v2, v3);
  if (v8) {
    int v54 = objc_msgSend__complicationTargetingIsActive(self, v5, v6, v7) ^ 1;
  }
  else {
    LOBYTE(v54) = 0;
  }

  uint64_t v12 = objc_msgSend_waypoint(self, v9, v10, v11);
  BOOL v13 = v12 == 0;

  uint64_t v17 = objc_msgSend_waypoint(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_location(self, v22, v23, v24);
  v29 = objc_msgSend_copy(v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_heading(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_copy(v33, v34, v35, v36);
  __int16 v41 = objc_msgSend_altitude(self, v38, v39, v40);
  uint64_t v45 = objc_msgSend_copy(v41, v42, v43, v44);
  uint64_t v49 = objc_msgSend_calibrated(self, v46, v47, v48);
  *(_WORD *)((char *)&v53 + 1) = 1;
  LOBYTE(v53) = v54;
  v51 = objc_msgSend__templateWithWaypoint_location_heading_altitude_deviceCalibrated_showNoData_showInactiveState_showAlwaysOnState_showPrivacyOnState_(self, v50, (uint64_t)v21, (uint64_t)v29, v37, v45, v49, v13, v53);

  return v51;
}

+ (id)_descriptorUserInfoForWaypoint:(id)a3
{
  v113[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v109 = 0.0;
  double v110 = 0.0;
  double v107 = 0.0;
  double v108 = 0.0;
  uint64_t v7 = objc_msgSend_labelColor(v3, v4, v5, v6);
  objc_msgSend_getRed_green_blue_alpha_(v7, v8, (uint64_t)&v110, (uint64_t)&v109, &v108, &v107);

  uint64_t v9 = NSNumber;
  BOOL v13 = objc_msgSend_timestampOfCreation(v3, v10, v11, v12);
  objc_msgSend_timeIntervalSinceReferenceDate(v13, v14, v15, v16);
  v106 = objc_msgSend_numberWithDouble_(v9, v17, v18, v19);

  uint64_t v23 = objc_msgSend_label(v3, v20, v21, v22);
  uint64_t v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    NanoCompassLocalizedString(@"WAYPOINT_NAME");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v26 = v25;

  objc_super v30 = objc_msgSend_symbol(v3, v27, v28, v29);
  uint64_t v34 = v30;
  if (v30)
  {
    id v35 = v30;
  }
  else
  {
    uint64_t v36 = objc_msgSend_idealizedWaypoint(NCWaypoint, v31, v32, v33);
    objc_msgSend_symbol(v36, v37, v38, v39);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  v112[0] = @"waypointUuid";
  v105 = objc_msgSend_uuid(v3, v40, v41, v42);
  v104 = objc_msgSend_UUIDString(v105, v43, v44, v45);
  v113[0] = v104;
  v113[1] = v26;
  v112[1] = @"waypointLabel";
  v112[2] = @"waypointColor";
  HIDWORD(v46) = HIDWORD(v110);
  *(float *)&double v46 = v110;
  v103 = objc_msgSend_numberWithFloat_(NSNumber, v47, v48, v49, v46);
  v111[0] = v103;
  HIDWORD(v50) = HIDWORD(v109);
  *(float *)&double v50 = v109;
  v102 = objc_msgSend_numberWithFloat_(NSNumber, v51, v52, v53, v50);
  v111[1] = v102;
  HIDWORD(v54) = HIDWORD(v108);
  *(float *)&double v54 = v108;
  v101 = objc_msgSend_numberWithFloat_(NSNumber, v55, v56, v57, v54);
  v111[2] = v101;
  HIDWORD(v58) = HIDWORD(v107);
  *(float *)&double v58 = v107;
  v62 = objc_msgSend_numberWithFloat_(NSNumber, v59, v60, v61, v58);
  v111[3] = v62;
  v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v63, (uint64_t)v111, 4);
  v113[2] = v64;
  v112[3] = @"waypointLatitude";
  v100 = v26;
  v65 = NSNumber;
  v69 = objc_msgSend_location(v3, v66, v67, v68);
  objc_msgSend_coordinate(v69, v70, v71, v72);
  v76 = objc_msgSend_numberWithDouble_(v65, v73, v74, v75);
  v113[3] = v76;
  v112[4] = @"waypointLongitude";
  v77 = NSNumber;
  v81 = objc_msgSend_location(v3, v78, v79, v80);
  objc_msgSend_coordinate(v81, v82, v83, v84);
  v89 = objc_msgSend_numberWithDouble_(v77, v85, v86, v87, v88);
  v113[4] = v89;
  v113[5] = v35;
  v112[5] = @"waypointSymbol";
  v112[6] = @"waypointEnabled";
  uint64_t isEnabled = objc_msgSend_isEnabled(v3, v90, v91, v92);
  v96 = objc_msgSend_numberWithInt_(NSNumber, v94, isEnabled, v95);
  v112[7] = @"dateOfCreation";
  v113[6] = v96;
  v113[7] = v106;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v97, (uint64_t)v113, (uint64_t)v112, 8);
  id v99 = (id)objc_claimAutoreleasedReturnValue();

  return v99;
}

- (id)_getWaypointUUIDFromDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3
    && (objc_msgSend_userInfo(v3, v4, v5, v6), uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    uint64_t v12 = objc_msgSend_userInfo(v7, v9, v10, v11);
    uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, @"waypointUuid", v14);

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v19 = objc_msgSend_initWithUUIDString_(v16, v17, (uint64_t)v15, v18);
    }
    else
    {
      uint64_t v20 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_2375D9588(v20);
      }

      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)_getWaypointFromDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3
    && (objc_msgSend_userInfo(v3, v4, v5, v6), uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    uint64_t v12 = objc_msgSend_userInfo(v7, v9, v10, v11);
    uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, @"waypointUuid", v14);

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F08C38]);
      v134 = objc_msgSend_initWithUUIDString_(v16, v17, (uint64_t)v15, v18);
      uint64_t v22 = objc_msgSend_userInfo(v7, v19, v20, v21);
      v133 = objc_msgSend_objectForKey_(v22, v23, @"waypointLabel", v24);

      uint64_t v28 = objc_msgSend_userInfo(v7, v25, v26, v27);
      v132 = objc_msgSend_objectForKey_(v28, v29, @"waypointLatitude", v30);

      uint64_t v34 = objc_msgSend_userInfo(v7, v31, v32, v33);
      v131 = objc_msgSend_objectForKey_(v34, v35, @"waypointLongitude", v36);

      id v37 = objc_alloc(MEMORY[0x263F00A50]);
      objc_msgSend_doubleValue(v132, v38, v39, v40);
      double v42 = v41;
      objc_msgSend_doubleValue(v131, v43, v44, v45);
      v130 = objc_msgSend_initWithLatitude_longitude_(v37, v46, v47, v48, v42, v49);
      uint64_t v53 = objc_msgSend_userInfo(v7, v50, v51, v52);
      uint64_t v56 = objc_msgSend_objectForKey_(v53, v54, @"waypointSymbol", v55);

      uint64_t v60 = objc_msgSend_userInfo(v7, v57, v58, v59);
      v129 = objc_msgSend_objectForKey_(v60, v61, @"dateOfCreation", v62);

      v63 = (void *)MEMORY[0x263EFF910];
      objc_msgSend_doubleValue(v129, v64, v65, v66);
      v70 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v63, v67, v68, v69);
      uint64_t v74 = objc_msgSend_userInfo(v7, v71, v72, v73);
      v77 = objc_msgSend_objectForKey_(v74, v75, @"waypointColor", v76);

      id v78 = objc_alloc(MEMORY[0x263F1C550]);
      v81 = objc_msgSend_objectAtIndexedSubscript_(v77, v79, 0, v80);
      objc_msgSend_doubleValue(v81, v82, v83, v84);
      double v86 = v85;
      v89 = objc_msgSend_objectAtIndexedSubscript_(v77, v87, 1, v88);
      objc_msgSend_doubleValue(v89, v90, v91, v92);
      double v94 = v93;
      v97 = objc_msgSend_objectAtIndexedSubscript_(v77, v95, 2, v96);
      objc_msgSend_doubleValue(v97, v98, v99, v100);
      double v102 = v101;
      v105 = objc_msgSend_objectAtIndexedSubscript_(v77, v103, 3, v104);
      objc_msgSend_doubleValue(v105, v106, v107, v108);
      v113 = objc_msgSend_initWithRed_green_blue_alpha_(v78, v109, v110, v111, v86, v94, v102, v112);

      v117 = objc_msgSend_userInfo(v7, v114, v115, v116);
      v120 = objc_msgSend_objectForKey_(v117, v118, @"waypointEnabled", v119);

      BOOL v128 = objc_msgSend_intValue(v120, v121, v122, v123) == 1;
      v125 = objc_msgSend_waypointForDescriptorWithUUID_creationTime_label_color_symbol_location_isEnabled_(NCWaypoint, v124, (uint64_t)v134, (uint64_t)v70, v133, v113, v56, v130, v128);
    }
    else
    {
      v126 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
        sub_2375D960C(v126);
      }

      v125 = 0;
    }
  }
  else
  {
    v125 = 0;
  }

  return v125;
}

- (id)_guidesWaypointWithUUID:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedManager(NCGuidesManager, v5, v6, v7);
  uint64_t v12 = objc_msgSend_allEnabledWaypoints(v8, v9, v10, v11);

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_2375C7E18;
  v34[3] = &unk_264CD5E88;
  id v13 = v4;
  id v35 = v13;
  uint64_t v16 = objc_msgSend_indexOfObjectPassingTest_(v12, v14, (uint64_t)v34, v15);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_msgSend_UUIDString(v13, v20, v21, v22);
      *(_DWORD *)buf = 134218498;
      id v37 = self;
      __int16 v38 = 2080;
      uint64_t v39 = "-[WaypointsComplicationDataSource _guidesWaypointWithUUID:]";
      __int16 v40 = 2112;
      double v41 = v23;
      _os_log_impl(&dword_23759D000, v19, OS_LOG_TYPE_DEFAULT, "(%p) %s Did not find waypoint complication with uuid %@ in guide manager.", buf, 0x20u);
    }
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v12, v17, v16, v18);
    uint64_t v19 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_label(v24, v25, v26, v27);
      uint64_t v28 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = objc_msgSend_UUIDString(v13, v29, v30, v31);
      *(_DWORD *)buf = 136315650;
      id v37 = (WaypointsComplicationDataSource *)"-[WaypointsComplicationDataSource _guidesWaypointWithUUID:]";
      __int16 v38 = 2112;
      uint64_t v39 = v28;
      __int16 v40 = 2112;
      double v41 = v32;
      _os_log_impl(&dword_23759D000, v19, OS_LOG_TYPE_DEFAULT, "%s found waypoint complication %@ with uuid %@ in guide manager.", buf, 0x20u);
    }
  }

  return v24;
}

@end
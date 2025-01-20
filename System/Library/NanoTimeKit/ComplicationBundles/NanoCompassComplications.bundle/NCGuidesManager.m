@interface NCGuidesManager
+ (NCGuidesManager)sharedManager;
- (BOOL)_guideWithIdentifierEnabled:(id)a3;
- (BOOL)areWaypointsLimited;
- (BOOL)guideEnabled:(id)a3;
- (BOOL)hasBeenUnlockedSinceBoot;
- (NCGuidesManager)init;
- (NSArray)allEnabledWaypoints;
- (NSArray)allEnabledWaypointsLimitedByDistance;
- (NSArray)allGuideWaypointsLimitedByDistance;
- (NSArray)allWaypoints;
- (NSArray)nonSystemEnabledWaypointsLimitedByDistance;
- (NSArray)systemWaypoints;
- (NSArray)systemWaypointsLimitedByDistance;
- (OS_dispatch_group)storeGroup;
- (_TtC8MapsSync13MapsSyncStore)store;
- (_TtC8MapsSync23MapsSyncStoreController)storeController;
- (id)_allPlaceItemsRestrictingMapGuidesTo:(double)a3 ofLocation:(id)a4;
- (id)_allSystemWaypoints;
- (id)_allWaypointsRestrictingMapGuidesTo:(double)a3 ofLocation:(id)a4;
- (id)_enabledCompassWaypointsRestrictedTo:(double)a3 ofLocation:(id)a4 maxCount:(unint64_t)a5;
- (id)_enabledWaypointsRestrictingMapGuidesTo:(double)a3 ofLocation:(id)a4 maxCount:(unint64_t)a5;
- (id)_getUpdatedGuideWaypoints:(id)a3;
- (id)_mergeSortedWaypoints:(id)a3 withOtherSortedWaypoints:(id)a4 maxCount:(unint64_t)a5;
- (id)_systemWaypointsRestrictedTo:(double)a3 ofLocation:(id)a4;
- (id)_waypointWithUUID:(id)a3;
- (id)compassGuide;
- (id)fetchTargetedWaypoint;
- (id)userGuides;
- (int64_t)numDisabledGuides;
- (int64_t)numEnabledGuideWaypoints;
- (int64_t)numGuideWaypoints;
- (unint64_t)maxAllowedWaypoints;
- (void)_addEnabledWaypointsForGuide:(id)a3;
- (void)_handleFirstUnlock;
- (void)_handleWaypointListChanged:(id)a3;
- (void)_loadDisabledGuidesFromDefaults;
- (void)_loadGuides;
- (void)_refreshAllWaypoints;
- (void)_refreshGuides;
- (void)_refreshNonDistanceLimitedWaypoints;
- (void)_removeDisabledWaypointsForGuide:(id)a3;
- (void)_saveDisabledGuidesToDefaults;
- (void)_updateUserGuidesUsingCollections:(id)a3;
- (void)enableWaypoints:(BOOL)a3 forGuide:(id)a4;
- (void)loadGuides;
- (void)refreshWaypointsWithCenterLocation:(id)a3 maxDiameterInMeters:(double)a4;
- (void)reloadWaypoints;
- (void)setAreWaypointsLimited:(BOOL)a3;
- (void)setHasBeenUnlockedSinceBoot:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)setStoreController:(id)a3;
- (void)setStoreGroup:(id)a3;
- (void)storeControllerWithDataChanged:(id)a3;
- (void)storeControllerWithDidLoad:(id)a3;
- (void)storeControllerWithFailedToLoad:(id)a3;
@end

@implementation NCGuidesManager

+ (NCGuidesManager)sharedManager
{
  if (qword_2689214E0 != -1) {
    dispatch_once(&qword_2689214E0, &unk_26EA48F80);
  }
  v2 = (void *)qword_2689214D8;

  return (NCGuidesManager *)v2;
}

- (NCGuidesManager)init
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)NCGuidesManager;
  v2 = [(NCGuidesManager *)&v57 init];
  v6 = v2;
  if (v2)
  {
    objc_msgSend__loadDisabledGuidesFromDefaults(v2, v3, v4, v5);
    if (sub_2375D1964() == 3)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x2020000000;
      v8 = (unsigned int (*)(void))off_268921508;
      v61 = off_268921508;
      if (!off_268921508)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_2375D5FBC;
        v63 = &unk_264CD5FD0;
        v64 = &v58;
        v9 = (void *)sub_2375D5E48();
        v10 = dlsym(v9, "MKBDeviceUnlockedSinceBoot");
        *(void *)(v64[1] + 24) = v10;
        off_268921508 = *(_UNKNOWN **)(v64[1] + 24);
        v8 = (unsigned int (*)(void))v59[3];
      }
      _Block_object_dispose(&v58, 8);
      if (!v8)
      {
        sub_2375D9958();
        __break(1u);
      }
      BOOL v7 = v8() == 1;
    }
    v6->_hasBeenUnlockedSinceBoot = v7;
    v11 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = @"has";
      if (!v6->_hasBeenUnlockedSinceBoot) {
        v12 = @"has NOT";
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[NCGuidesManager init]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_DEFAULT, "%s: device %@ been unlocked", buf, 0x16u);
    }

    if (!v6->_hasBeenUnlockedSinceBoot)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_2375D1A60, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v14 = NanoCompassLocalizedString(@"COMPASS_WAYPOINTS_GUIDE_NAME");
    v15 = [NCCompassWaypointGuide alloc];
    uint64_t v18 = objc_msgSend_initWithName_(v15, v16, (uint64_t)v14, v17);
    compassGuide = v6->_compassGuide;
    v6->_compassGuide = (NCCompassWaypointGuide *)v18;

    uint64_t v23 = objc_msgSend_enabledWaypoints(v6->_compassGuide, v20, v21, v22);
    allEnabledWaypoints = v6->_allEnabledWaypoints;
    v6->_allEnabledWaypoints = (NSArray *)v23;

    v25 = (void *)MEMORY[0x263EFF8C0];
    v29 = objc_msgSend_fetchWaypoints(v6->_compassGuide, v26, v27, v28);
    v32 = objc_msgSend_arrayWithArray_(v25, v30, (uint64_t)v29, v31);
    v36 = objc_msgSend_systemWaypoints(v6->_compassGuide, v33, v34, v35);
    uint64_t v39 = objc_msgSend_arrayByAddingObjectsFromArray_(v32, v37, (uint64_t)v36, v38);
    allWaypoints = v6->_allWaypoints;
    v6->_allWaypoints = (NSArray *)v39;

    uint64_t v41 = objc_opt_new();
    userGuides = v6->_userGuides;
    v6->_userGuides = (NSArray *)v41;

    uint64_t v43 = objc_opt_new();
    allEnabledWaypointsLimitedByDistance = v6->_allEnabledWaypointsLimitedByDistance;
    v6->_allEnabledWaypointsLimitedByDistance = (NSArray *)v43;

    uint64_t v45 = objc_opt_new();
    nonSystemEnabledWaypointsLimitedByDistance = v6->_nonSystemEnabledWaypointsLimitedByDistance;
    v6->_nonSystemEnabledWaypointsLimitedByDistance = (NSArray *)v45;

    uint64_t v47 = objc_opt_new();
    systemWaypoints = v6->_systemWaypoints;
    v6->_systemWaypoints = (NSArray *)v47;

    uint64_t v49 = objc_opt_new();
    systemWaypointsLimitedByDistance = v6->_systemWaypointsLimitedByDistance;
    v6->_systemWaypointsLimitedByDistance = (NSArray *)v49;

    v6->_areWaypointsLimited = 0;
    dispatch_group_t v51 = dispatch_group_create();
    storeGroup = v6->_storeGroup;
    v6->_storeGroup = (OS_dispatch_group *)v51;

    dispatch_group_enter((dispatch_group_t)v6->_storeGroup);
    objc_initWeak((id *)buf, v6);
    v53 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375D1AA8;
    block[3] = &unk_264CD55C0;
    objc_copyWeak(&v56, (id *)buf);
    dispatch_async(v53, block);

    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

- (unint64_t)maxAllowedWaypoints
{
  if (qword_2689214F0 != -1) {
    dispatch_once(&qword_2689214F0, &unk_26EA48FA0);
  }
  return qword_2689214E8;
}

- (id)compassGuide
{
  return self->_compassGuide;
}

- (id)userGuides
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_userGuides;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)allEnabledWaypoints
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_allEnabledWaypoints;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)allEnabledWaypointsLimitedByDistance
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_allEnabledWaypointsLimitedByDistance;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)nonSystemEnabledWaypointsLimitedByDistance
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_nonSystemEnabledWaypointsLimitedByDistance;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)allWaypoints
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_allWaypoints;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)systemWaypoints
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_systemWaypoints;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)systemWaypointsLimitedByDistance
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_systemWaypointsLimitedByDistance;
  objc_sync_exit(v2);

  return v3;
}

- (id)fetchTargetedWaypoint
{
  uint64_t v5 = objc_msgSend_sharedManager(NCTargetedWaypointManager, a2, v2, v3);
  v9 = objc_msgSend_fetchTargetedWaypointUUID(v5, v6, v7, v8);
  v13 = objc_msgSend_UUIDString(v9, v10, v11, v12);

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v17 = objc_msgSend_initWithUUIDString_(v14, v15, (uint64_t)v13, v16);
    v20 = objc_msgSend__waypointWithUUID_(self, v18, (uint64_t)v17, v19);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_waypointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_allWaypoints(self, v5, v6, v7);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2375D2114;
  v17[3] = &unk_264CD5E88;
  id v9 = v4;
  id v18 = v9;
  uint64_t v12 = objc_msgSend_indexOfObjectPassingTest_(v8, v10, (uint64_t)v17, v11);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend_objectAtIndexedSubscript_(v8, v13, v12, v14);
  }

  return v15;
}

- (id)_mergeSortedWaypoints:(id)a3 withOtherSortedWaypoints:(id)a4 maxCount:(unint64_t)a5
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v12 = objc_msgSend_count(v7, v9, v10, v11);
  v128 = v8;
  uint64_t v16 = objc_msgSend_count(v8, v13, v14, v15);
  unint64_t v17 = v16;
  if (v16 + v12 >= a5) {
    unint64_t v18 = a5;
  }
  else {
    unint64_t v18 = v16 + v12;
  }
  id v19 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v22 = objc_msgSend_initWithCapacity_(v19, v20, v18, v21);
  if (allowVerboseLog())
  {
    v26 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_2375D9B6C();
    }
  }
  unint64_t v30 = 0;
  BOOL v31 = v12 != 0;
  BOOL v32 = v17 != 0;
  if (objc_msgSend_count(v7, v23, v24, v25) < v18 && v12)
  {
    unint64_t v33 = 0;
    if (v17)
    {
      unint64_t v33 = 0;
      unint64_t v30 = 0;
      do
      {
        uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v7, v27, v33, v29);
        v37 = objc_msgSend_objectAtIndexedSubscript_(v128, v35, v30, v36);
        if (objc_msgSend_compare_(v34, v38, (uint64_t)v37, v39) == -1)
        {
          objc_msgSend_addObject_(v22, v40, (uint64_t)v34, v41);
          if (allowVerboseLog())
          {
            v46 = NCLogForCategory(9uLL);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v124 = objc_msgSend_waypoint(v34, v47, v48, v49);
              v126 = objc_msgSend_label(v124, v60, v61, v62);
              objc_msgSend_distance(v34, v63, v64, v65);
              *(_DWORD *)buf = 136446722;
              v130 = "-[NCGuidesManager _mergeSortedWaypoints:withOtherSortedWaypoints:maxCount:]";
              __int16 v131 = 2112;
              v132 = v126;
              __int16 v133 = 2048;
              uint64_t v134 = v66;
              _os_log_debug_impl(&dword_23759D000, v46, OS_LOG_TYPE_DEBUG, "%{public}s: Merge - added waypoint1: %@ with distance %f", buf, 0x20u);
            }
          }
          ++v33;
        }
        else
        {
          objc_msgSend_addObject_(v22, v40, (uint64_t)v37, v41);
          if (allowVerboseLog())
          {
            v42 = NCLogForCategory(9uLL);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v123 = objc_msgSend_waypoint(v37, v43, v44, v45);
              v125 = objc_msgSend_label(v123, v53, v54, v55);
              objc_msgSend_distance(v37, v56, v57, v58);
              *(_DWORD *)buf = 136446722;
              v130 = "-[NCGuidesManager _mergeSortedWaypoints:withOtherSortedWaypoints:maxCount:]";
              __int16 v131 = 2112;
              v132 = v125;
              __int16 v133 = 2048;
              uint64_t v134 = v59;
              _os_log_debug_impl(&dword_23759D000, v42, OS_LOG_TYPE_DEBUG, "%{public}s: Merge - added waypoint2: %@ with distance %f", buf, 0x20u);
            }
          }
          ++v30;
        }

        BOOL v31 = v33 < v12;
        BOOL v32 = v30 < v17;
      }
      while (objc_msgSend_count(v7, v50, v51, v52) < v18 && v33 < v12 && v30 < v17);
    }
  }
  else
  {
    unint64_t v33 = 0;
  }
  if (objc_msgSend_count(v22, v27, v28, v29) < v18)
  {
    uint64_t v70 = objc_msgSend_count(v22, v67, v68, v69);
    if (allowVerboseLog())
    {
      uint64_t v127 = v70;
      NCLogForCategory(9uLL);
      v71 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEBUG)) {
        sub_2375D9AE8(v22, v71, v72, v73);
      }

      uint64_t v70 = v127;
    }
    unint64_t v74 = v18 - v70;
    if (v31)
    {
      if (v12 - v33 >= v74) {
        unint64_t v75 = v18 - v70;
      }
      else {
        unint64_t v75 = v12 - v33;
      }
      if (allowVerboseLog())
      {
        v78 = NCLogForCategory(9uLL);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
          sub_2375D9A00();
        }
      }
      for (; v75; --v75)
      {
        v79 = objc_msgSend_objectAtIndexedSubscript_(v7, v76, v33, v77);
        if (allowVerboseLog())
        {
          v82 = NCLogForCategory(9uLL);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            v86 = objc_msgSend_waypoint(v79, v83, v84, v85);
            v90 = objc_msgSend_label(v86, v87, v88, v89);
            objc_msgSend_distance(v79, v91, v92, v93);
            *(_DWORD *)buf = 136446722;
            v130 = "-[NCGuidesManager _mergeSortedWaypoints:withOtherSortedWaypoints:maxCount:]";
            __int16 v131 = 2112;
            v132 = v90;
            __int16 v133 = 2048;
            uint64_t v134 = v94;
            _os_log_debug_impl(&dword_23759D000, v82, OS_LOG_TYPE_DEBUG, "%{public}s: Merge - added waypoint1: %@ with distance %f", buf, 0x20u);
          }
        }
        objc_msgSend_addObject_(v22, v80, (uint64_t)v79, v81);

        ++v33;
      }
    }
    else if (v32)
    {
      if (v17 - v30 >= v74) {
        unint64_t v95 = v18 - v70;
      }
      else {
        unint64_t v95 = v17 - v30;
      }
      if (allowVerboseLog())
      {
        v98 = NCLogForCategory(9uLL);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG)) {
          sub_2375D9A74();
        }
      }
      for (; v95; --v95)
      {
        v99 = objc_msgSend_objectAtIndexedSubscript_(v128, v96, v30, v97);
        if (allowVerboseLog())
        {
          v102 = NCLogForCategory(9uLL);
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            v106 = objc_msgSend_waypoint(v99, v103, v104, v105);
            v110 = objc_msgSend_label(v106, v107, v108, v109);
            objc_msgSend_distance(v99, v111, v112, v113);
            *(_DWORD *)buf = 136446722;
            v130 = "-[NCGuidesManager _mergeSortedWaypoints:withOtherSortedWaypoints:maxCount:]";
            __int16 v131 = 2112;
            v132 = v110;
            __int16 v133 = 2048;
            uint64_t v134 = v114;
            _os_log_debug_impl(&dword_23759D000, v102, OS_LOG_TYPE_DEBUG, "%{public}s: Merge - added waypoint2: %@ with distance %f", buf, 0x20u);
          }
        }
        objc_msgSend_addObject_(v22, v100, (uint64_t)v99, v101);

        ++v30;
      }
    }
  }
  if (allowVerboseLog())
  {
    NCLogForCategory(9uLL);
    v118 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v118, OS_LOG_TYPE_DEBUG)) {
      sub_2375D997C(v22, v118, v119, v120);
    }
  }
  v121 = objc_msgSend_copy(v22, v115, v116, v117);

  return v121;
}

- (void)refreshWaypointsWithCenterLocation:(id)a3 maxDiameterInMeters:(double)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    id v9 = objc_msgSend__allWaypointsRestrictingMapGuidesTo_ofLocation_(self, v6, (uint64_t)v8, v7, a4);
    unint64_t v12 = objc_msgSend__systemWaypointsRestrictedTo_ofLocation_(self, v10, (uint64_t)v8, v11, a4);
    unint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);
    if (v16 >= objc_msgSend_maxAllowedWaypoints(self, v17, v18, v19)
      || (uint64_t v23 = objc_msgSend_maxAllowedWaypoints(self, v20, v21, v22), v25 = v23 - v16, v23 == v16))
    {
      self->_areWaypointsLimited = 1;
      v26 = self;
      objc_sync_enter(v26);
      uint64_t v29 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v27, (uint64_t)v12, v28);
      allEnabledWaypointsLimitedByDistance = v26->_allEnabledWaypointsLimitedByDistance;
      v26->_allEnabledWaypointsLimitedByDistance = (NSArray *)v29;

      BOOL v31 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
      nonSystemEnabledWaypointsLimitedByDistance = v26->_nonSystemEnabledWaypointsLimitedByDistance;
      v26->_nonSystemEnabledWaypointsLimitedByDistance = v31;

      uint64_t v35 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v33, (uint64_t)v12, v34);
      systemWaypointsLimitedByDistance = v26->_systemWaypointsLimitedByDistance;
      v26->_systemWaypointsLimitedByDistance = (NSArray *)v35;

      uint64_t v39 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v37, (uint64_t)v9, v38);
      allGuideWaypointsLimitedByDistance = v26->_allGuideWaypointsLimitedByDistance;
      v26->_allGuideWaypointsLimitedByDistance = (NSArray *)v39;

      objc_sync_exit(v26);
    }
    else
    {
      objc_msgSend__enabledCompassWaypointsRestrictedTo_ofLocation_maxCount_(self, v24, (uint64_t)v8, v25, a4 * 0.5);
      v26 = (NCGuidesManager *)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = objc_msgSend__enabledWaypointsRestrictingMapGuidesTo_ofLocation_maxCount_(self, v42, (uint64_t)v8, v25, a4);
      uint64_t v47 = objc_msgSend_count(v26, v44, v45, v46);
      unint64_t v51 = v47 + v16 + objc_msgSend_count(v43, v48, v49, v50);
      self->_areWaypointsLimited = v51 > objc_msgSend_maxAllowedWaypoints(self, v52, v53, v54);
      id v56 = objc_msgSend__mergeSortedWaypoints_withOtherSortedWaypoints_maxCount_(self, v55, (uint64_t)v26, (uint64_t)v43, v25);
      uint64_t v60 = objc_msgSend_count(v12, v57, v58, v59);
      uint64_t v64 = objc_msgSend_count(v56, v61, v62, v63);
      uint64_t v66 = objc_msgSend__mergeSortedWaypoints_withOtherSortedWaypoints_maxCount_(self, v65, (uint64_t)v12, (uint64_t)v56, v64 + v60);
      v67 = self;
      objc_sync_enter(v67);
      uint64_t v70 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v68, (uint64_t)v66, v69);
      v71 = v67->_allEnabledWaypointsLimitedByDistance;
      v67->_allEnabledWaypointsLimitedByDistance = (NSArray *)v70;

      uint64_t v74 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v72, (uint64_t)v56, v73);
      unint64_t v75 = v67->_nonSystemEnabledWaypointsLimitedByDistance;
      v67->_nonSystemEnabledWaypointsLimitedByDistance = (NSArray *)v74;

      uint64_t v78 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v76, (uint64_t)v12, v77);
      v79 = v67->_systemWaypointsLimitedByDistance;
      v67->_systemWaypointsLimitedByDistance = (NSArray *)v78;

      uint64_t v82 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v80, (uint64_t)v9, v81);
      v83 = v67->_allGuideWaypointsLimitedByDistance;
      v67->_allGuideWaypointsLimitedByDistance = (NSArray *)v82;

      objc_sync_exit(v67);
    }
  }
  else
  {
    uint64_t v41 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      int v84 = 136446210;
      uint64_t v85 = "-[NCGuidesManager refreshWaypointsWithCenterLocation:maxDiameterInMeters:]";
      _os_log_impl(&dword_23759D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s: Unable to calculate waypoints within range as location is nil", (uint8_t *)&v84, 0xCu);
    }
  }
}

- (id)_getUpdatedGuideWaypoints:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedAppManager(NCWaypointManager, v4, v5, v6);
  uint64_t v11 = objc_msgSend_fetchGuideWaypointsWithElevation(v7, v8, v9, v10);

  unint64_t v12 = convertWaypointArrayToDict(v3);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v11;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_uuid(v22, v16, v17, v18, (void)v40);
        v26 = objc_msgSend_objectForKey_(v12, v24, (uint64_t)v23, v25);

        objc_msgSend_altitude(v22, v27, v28, v29);
        objc_msgSend_setAltitude_(v26, v30, v31, v32);
        objc_msgSend_setAltitudePopulated_(v26, v33, 1, v34);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v19);
  }

  uint64_t v38 = objc_msgSend_allValues(v12, v35, v36, v37);

  return v38;
}

- (void)_addEnabledWaypointsForGuide:(id)a3
{
  id v21 = a3;
  uint64_t v7 = objc_msgSend_mutableCopy(self->_allEnabledWaypoints, v4, v5, v6);
  uint64_t v11 = objc_msgSend_fetchWaypoints(v21, v8, v9, v10);
  objc_msgSend_addObjectsFromArray_(v7, v12, (uint64_t)v11, v13);

  uint64_t v14 = self;
  objc_sync_enter(v14);
  objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v15, (uint64_t)v7, v16);
  uint64_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allEnabledWaypoints = self->_allEnabledWaypoints;
  self->_allEnabledWaypoints = v17;

  objc_sync_exit(v14);
  objc_msgSend__postNotification_(v14, v19, @"GuideEnabledListChangedNotification", v20);
}

- (void)_removeDisabledWaypointsForGuide:(id)a3
{
  id v21 = a3;
  uint64_t v7 = objc_msgSend_mutableCopy(self->_allEnabledWaypoints, v4, v5, v6);
  uint64_t v11 = objc_msgSend_fetchWaypoints(v21, v8, v9, v10);
  objc_msgSend_removeObjectsInArray_(v7, v12, (uint64_t)v11, v13);
  uint64_t v14 = self;
  objc_sync_enter(v14);
  objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v15, (uint64_t)v7, v16);
  uint64_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allEnabledWaypoints = self->_allEnabledWaypoints;
  self->_allEnabledWaypoints = v17;

  objc_sync_exit(v14);
  objc_msgSend__postNotification_(v14, v19, @"GuideEnabledListChangedNotification", v20);
}

- (void)_refreshAllWaypoints
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  objc_msgSend_userGuides(self, v4, v5, v6);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v68, (uint64_t)v76, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v69 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        if (objc_msgSend_guideEnabled_(self, v9, (uint64_t)v14, v10, (void)v68))
        {
          uint64_t v16 = objc_msgSend_fetchWaypoints(v14, v9, v15, v10);
          objc_msgSend_addObjectsFromArray_(v3, v17, (uint64_t)v16, v18);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v68, (uint64_t)v76, 16);
    }
    while (v11);
  }

  uint64_t v19 = (void *)MEMORY[0x263EFF980];
  uint64_t v23 = objc_msgSend_enabledWaypoints(self->_compassGuide, v20, v21, v22);
  v26 = objc_msgSend_arrayWithArray_(v19, v24, (uint64_t)v23, v25);

  objc_msgSend_addObjectsFromArray_(v26, v27, (uint64_t)v3, v28);
  uint64_t v29 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = objc_msgSend_count(v26, v30, v31, v32);
    *(_DWORD *)buf = 136446466;
    uint64_t v73 = "-[NCGuidesManager _refreshAllWaypoints]";
    __int16 v74 = 2048;
    uint64_t v75 = v33;
    _os_log_impl(&dword_23759D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s: setting allEnabledWaypoints with %lu items", buf, 0x16u);
  }

  uint64_t v34 = (void *)MEMORY[0x263EFF980];
  uint64_t v38 = objc_msgSend_fetchWaypoints(self->_compassGuide, v35, v36, v37);
  long long v41 = objc_msgSend_arrayWithArray_(v34, v39, (uint64_t)v38, v40);

  objc_msgSend_addObjectsFromArray_(v41, v42, (uint64_t)v3, v43);
  uint64_t v47 = objc_msgSend__allSystemWaypoints(self, v44, v45, v46);
  objc_msgSend_addObjectsFromArray_(v41, v48, (uint64_t)v47, v49);
  uint64_t v50 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = objc_msgSend_count(v41, v51, v52, v53);
    *(_DWORD *)buf = 136446466;
    uint64_t v73 = "-[NCGuidesManager _refreshAllWaypoints]";
    __int16 v74 = 2048;
    uint64_t v75 = v54;
    _os_log_impl(&dword_23759D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s: setting allWaypoints with %lu items", buf, 0x16u);
  }

  uint64_t v55 = self;
  objc_sync_enter(v55);
  uint64_t v58 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v56, (uint64_t)v26, v57);
  allEnabledWaypoints = v55->_allEnabledWaypoints;
  v55->_allEnabledWaypoints = (NSArray *)v58;

  uint64_t v62 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v60, (uint64_t)v41, v61);
  allWaypoints = v55->_allWaypoints;
  v55->_allWaypoints = (NSArray *)v62;

  uint64_t v66 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v64, (uint64_t)v47, v65);
  systemWaypoints = v55->_systemWaypoints;
  v55->_systemWaypoints = (NSArray *)v66;

  objc_sync_exit(v55);
}

- (id)_allSystemWaypoints
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v6 = objc_msgSend_systemWaypoints(self->_compassGuide, a2, v2, v3);
  uint64_t v9 = objc_msgSend_arrayWithArray_(v5, v7, (uint64_t)v6, v8);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = self->_userGuides;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = objc_msgSend_systemWaypoints(*(void **)(*((void *)&v27 + 1) + 8 * i), v13, v14, v15, (void)v27);
        objc_msgSend_addObjectsFromArray_(v9, v20, (uint64_t)v19, v21);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v16);
  }

  uint64_t v25 = objc_msgSend_copy(v9, v22, v23, v24);

  return v25;
}

- (id)_enabledCompassWaypointsRestrictedTo:(double)a3 ofLocation:(id)a4 maxCount:(unint64_t)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_2375D9BF8();
  }

  uint64_t v12 = objc_msgSend_enabledWaypoints(self->_compassGuide, v9, v10, v11);
  uint64_t v13 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v14 = v12;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v70, (uint64_t)v82, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v71 != v21) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_location(v23, v17, v18, v19);
        objc_msgSend_distanceFromLocation_(v24, v25, (uint64_t)v7, v26);
        double v28 = v27;

        int v29 = allowVerboseLog();
        if (v28 >= a3)
        {
          if (!v29) {
            continue;
          }
          uint64_t v37 = NCLogForCategory(9uLL);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v44 = objc_msgSend_label(v23, v40, v41, v42);
            *(_DWORD *)buf = 136446722;
            uint64_t v75 = "-[NCGuidesManager _enabledCompassWaypointsRestrictedTo:ofLocation:maxCount:]";
            __int16 v76 = 2112;
            uint64_t v77 = (uint64_t)v44;
            __int16 v78 = 2048;
            double v79 = v28;
            _os_log_debug_impl(&dword_23759D000, v37, OS_LOG_TYPE_DEBUG, "%{public}s Excluding compass waypoint %@, distance is %f", buf, 0x20u);
          }
        }
        else
        {
          if (v29)
          {
            long long v30 = NCLogForCategory(9uLL);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v43 = objc_msgSend_label(v23, v31, v32, v33);
              *(_DWORD *)buf = 136446722;
              uint64_t v75 = "-[NCGuidesManager _enabledCompassWaypointsRestrictedTo:ofLocation:maxCount:]";
              __int16 v76 = 2112;
              uint64_t v77 = (uint64_t)v43;
              __int16 v78 = 2048;
              double v79 = v28;
              _os_log_debug_impl(&dword_23759D000, v30, OS_LOG_TYPE_DEBUG, "%{public}s Including compass waypoint %@, distance is %f", buf, 0x20u);
            }
          }
          uint64_t v34 = [NCWaypointWithDistance alloc];
          uint64_t v37 = objc_msgSend_initWithWaypoint_distance_(v34, v35, (uint64_t)v23, v36, v28);
          objc_msgSend_addObject_(v13, v38, (uint64_t)v37, v39);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v70, (uint64_t)v82, 16);
    }
    while (v20);
  }

  uint64_t v45 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    uint64_t v49 = objc_msgSend_count(v13, v46, v47, v48);
    uint64_t v53 = objc_msgSend_count(v14, v50, v51, v52);
    *(_DWORD *)buf = 136446978;
    uint64_t v75 = "-[NCGuidesManager _enabledCompassWaypointsRestrictedTo:ofLocation:maxCount:]";
    __int16 v76 = 2048;
    uint64_t v77 = v49;
    __int16 v78 = 2048;
    double v79 = *(double *)&v53;
    __int16 v80 = 2048;
    unint64_t v81 = a5;
    _os_log_impl(&dword_23759D000, v45, OS_LOG_TYPE_INFO, "%{public}s: found %lu of %lu compass waypoints in range.  Max allowed is: %lu", buf, 0x2Au);
  }

  objc_msgSend_sortUsingSelector_(v13, v54, (uint64_t)sel_compare_, v55);
  if (objc_msgSend_count(v13, v56, v57, v58) > a5)
  {
    uint64_t v62 = objc_msgSend_count(v13, v59, v60, v61);
    uint64_t v64 = objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x263F088D0], v63, a5, v62 - a5);
    objc_msgSend_removeObjectsAtIndexes_(v13, v65, (uint64_t)v64, v66);
  }
  v67 = objc_msgSend_copy(v13, v59, v60, v61);

  return v67;
}

- (id)_systemWaypointsRestrictedTo:(double)a3 ofLocation:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_2375D9C70();
  }

  uint64_t v11 = objc_msgSend_systemWaypoints(self->_compassGuide, v8, v9, v10);
  uint64_t v12 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v13 = v11;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v58, (uint64_t)v68, 16);
  if (v15)
  {
    uint64_t v20 = v15;
    uint64_t v21 = *(void *)v59;
    *(void *)&long long v19 = 136446722;
    long long v57 = v19;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v59 != v21) {
          objc_enumerationMutation(v13);
        }
        uint64_t v23 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_location(v23, v16, v17, v18, v57, (void)v58);
        objc_msgSend_distanceFromLocation_(v24, v25, (uint64_t)v6, v26);
        double v28 = v27;

        int v29 = NCLogForCategory(9uLL);
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v28 >= a3)
        {
          if (v30)
          {
            uint64_t v40 = objc_msgSend_label(v23, v31, v32, v33);
            *(_DWORD *)buf = v57;
            uint64_t v63 = "-[NCGuidesManager _systemWaypointsRestrictedTo:ofLocation:]";
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v40;
            __int16 v66 = 2048;
            double v67 = v28;
            _os_log_debug_impl(&dword_23759D000, v29, OS_LOG_TYPE_DEBUG, "%{public}s Excluding system waypoint %@, distance is %f", buf, 0x20u);
          }
        }
        else
        {
          if (v30)
          {
            uint64_t v39 = objc_msgSend_label(v23, v31, v32, v33);
            *(_DWORD *)buf = v57;
            uint64_t v63 = "-[NCGuidesManager _systemWaypointsRestrictedTo:ofLocation:]";
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v39;
            __int16 v66 = 2048;
            double v67 = v28;
            _os_log_debug_impl(&dword_23759D000, v29, OS_LOG_TYPE_DEBUG, "%{public}s Including system waypoint %@, distance is %f", buf, 0x20u);
          }
          uint64_t v34 = [NCWaypointWithDistance alloc];
          int v29 = objc_msgSend_initWithWaypoint_distance_(v34, v35, (uint64_t)v23, v36, v28);
          objc_msgSend_addObject_(v12, v37, (uint64_t)v29, v38);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v58, (uint64_t)v68, 16);
    }
    while (v20);
  }

  uint64_t v41 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    uint64_t v45 = objc_msgSend_count(v12, v42, v43, v44);
    uint64_t v49 = objc_msgSend_count(v13, v46, v47, v48);
    *(_DWORD *)buf = 136446722;
    uint64_t v63 = "-[NCGuidesManager _systemWaypointsRestrictedTo:ofLocation:]";
    __int16 v64 = 2048;
    uint64_t v65 = v45;
    __int16 v66 = 2048;
    double v67 = *(double *)&v49;
    _os_log_impl(&dword_23759D000, v41, OS_LOG_TYPE_INFO, "%{public}s: including %lu of %lu system waypoints", buf, 0x20u);
  }

  objc_msgSend_sortUsingSelector_(v12, v50, (uint64_t)sel_compare_, v51);
  uint64_t v55 = objc_msgSend_copy(v12, v52, v53, v54);

  return v55;
}

- (id)_enabledWaypointsRestrictingMapGuidesTo:(double)a3 ofLocation:(id)a4 maxCount:(unint64_t)a5
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v106 = objc_opt_new();
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v105 = v7;
  if (v8->_loadedGuides)
  {
    objc_sync_exit(v8);

    uint64_t v101 = v8;
    uint64_t v11 = objc_msgSend__allPlaceItemsRestrictingMapGuidesTo_ofLocation_(v8, v9, (uint64_t)v7, v10, a3);
    uint64_t v12 = objc_opt_new();
    objc_msgSend_allEnabledWaypoints(v8, v13, v14, v15);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v115, (uint64_t)v127, 16);
    if (v20)
    {
      uint64_t v21 = *(void *)v116;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v116 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v115 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend_guideUUID(v23, v17, v18, v19);

          if (v24)
          {
            uint64_t v25 = objc_msgSend_guideUUID(v23, v17, v18, v19);
            int v29 = objc_msgSend_uuid(v23, v26, v27, v28);
            uint64_t v33 = objc_msgSend_UUIDString(v29, v30, v31, v32);
            objc_msgSend_setObject_forKey_(v12, v34, (uint64_t)v25, (uint64_t)v33);
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v115, (uint64_t)v127, 16);
      }
      while (v20);
    }
    uint64_t v35 = objc_opt_new();
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v103 = v11;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v36, (uint64_t)&v111, (uint64_t)v126, 16);
    if (v40)
    {
      uint64_t v41 = *(void *)v112;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v112 != v41) {
            objc_enumerationMutation(v103);
          }
          uint64_t v43 = *(void **)(*((void *)&v111 + 1) + 8 * j);
          uint64_t v44 = objc_msgSend_identifier(v43, v37, v38, v39);
          uint64_t v48 = objc_msgSend_UUIDString(v44, v45, v46, v47);
          uint64_t v51 = objc_msgSend_valueForKey_(v12, v49, (uint64_t)v48, v50);

          if (v51)
          {
            uint64_t v53 = objc_msgSend_waypointForCollectionPlaceItem_inGuide_(NCWaypoint, v52, (uint64_t)v43, (uint64_t)v51);
            objc_msgSend_addObject_(v35, v54, (uint64_t)v53, v55);
          }
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v37, (uint64_t)&v111, (uint64_t)v126, 16);
      }
      while (v40);
    }

    long long v58 = objc_msgSend__getUpdatedGuideWaypoints_(v101, v56, (uint64_t)v35, v57);
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v107, (uint64_t)v125, 16);
    if (v63)
    {
      uint64_t v64 = *(void *)v108;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v108 != v64) {
            objc_enumerationMutation(v58);
          }
          __int16 v66 = *(void **)(*((void *)&v107 + 1) + 8 * k);
          double v67 = objc_msgSend_location(v66, v60, v61, v62);
          objc_msgSend_distanceFromLocation_(v67, v68, (uint64_t)v105, v69);
          double v71 = v70;

          long long v72 = [NCWaypointWithDistance alloc];
          uint64_t v75 = objc_msgSend_initWithWaypoint_distance_(v72, v73, (uint64_t)v66, v74, v71);
          objc_msgSend_addObject_(v106, v76, (uint64_t)v75, v77);
        }
        uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v60, (uint64_t)&v107, (uint64_t)v125, 16);
      }
      while (v63);
    }
    __int16 v78 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      int v82 = objc_msgSend_count(v106, v79, v80, v81);
      *(_DWORD *)buf = 136446722;
      uint64_t v120 = "-[NCGuidesManager _enabledWaypointsRestrictingMapGuidesTo:ofLocation:maxCount:]";
      __int16 v121 = 1024;
      int v122 = v82;
      __int16 v123 = 2048;
      unint64_t v124 = a5;
      _os_log_impl(&dword_23759D000, v78, OS_LOG_TYPE_DEFAULT, "%{public}s: Number of guide places enabled and in range: %d. Max allowed is %lu", buf, 0x1Cu);
    }

    objc_msgSend_sortUsingSelector_(v106, v83, (uint64_t)sel_compare_, v84);
    if (objc_msgSend_count(v106, v85, v86, v87) > a5)
    {
      uint64_t v91 = objc_msgSend_count(v106, v88, v89, v90);
      uint64_t v93 = objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x263F088D0], v92, a5, v91 - a5);
      objc_msgSend_removeObjectsAtIndexes_(v106, v94, (uint64_t)v93, v95);
    }
    id v96 = (id)objc_msgSend_copy(v106, v88, v89, v90);

    uint64_t v97 = v103;
  }
  else
  {
    v98 = NCLogForCategory(9uLL);
    v99 = v8;
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v120 = "-[NCGuidesManager _enabledWaypointsRestrictingMapGuidesTo:ofLocation:maxCount:]";
      _os_log_impl(&dword_23759D000, v98, OS_LOG_TYPE_DEFAULT, "%{public}s: returning empty list, guides are not loaded", buf, 0xCu);
    }

    id v96 = v106;
    uint64_t v97 = v99;
    objc_sync_exit(v99);
  }

  return v96;
}

- (id)_allWaypointsRestrictingMapGuidesTo:(double)a3 ofLocation:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (v8->_loadedGuides)
  {
    objc_sync_exit(v8);

    objc_msgSend__allPlaceItemsRestrictingMapGuidesTo_ofLocation_(v8, v9, (uint64_t)v6, v10, a3);
    uint64_t v8 = (NCGuidesManager *)objc_claimAutoreleasedReturnValue();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v30, (uint64_t)v38, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = objc_msgSend_waypointForCollectionPlaceItem_inGuide_(NCWaypoint, v12, *(void *)(*((void *)&v30 + 1) + 8 * i), 0);
          objc_msgSend_addObject_(v7, v17, (uint64_t)v16, v18);
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v30, (uint64_t)v38, 16);
      }
      while (v13);
    }
    uint64_t v19 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = NSNumber;
      uint64_t v24 = objc_msgSend_count(v7, v20, v21, v22);
      uint64_t v27 = objc_msgSend_numberWithUnsignedInteger_(v23, v25, v24, v26);
      *(_DWORD *)buf = 136446466;
      uint64_t v35 = "-[NCGuidesManager _allWaypointsRestrictingMapGuidesTo:ofLocation:]";
      __int16 v36 = 2112;
      uint64_t v37 = v27;
      _os_log_impl(&dword_23759D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: Number of guide places and in range: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v28 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v35 = "-[NCGuidesManager _allWaypointsRestrictingMapGuidesTo:ofLocation:]";
      _os_log_impl(&dword_23759D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s: returning empty list, guides are not loaded", buf, 0xCu);
    }

    objc_sync_exit(v8);
  }

  return v7;
}

- (id)_allPlaceItemsRestrictingMapGuidesTo:(double)a3 ofLocation:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v39 = "-[NCGuidesManager _allPlaceItemsRestrictingMapGuidesTo:ofLocation:]";
    _os_log_impl(&dword_23759D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Determining which guide waypoints are within range and enabled.", buf, 0xCu);
  }

  id v8 = objc_alloc(MEMORY[0x263F53F88]);
  objc_msgSend_coordinate(v6, v9, v10, v11);
  double v13 = v12;
  objc_msgSend_coordinate(v6, v14, v15, v16);
  double v18 = v17;

  uint64_t v22 = objc_msgSend_initWithCenterLatitude_centerLongitude_squareSideLengthMeters_(v8, v19, v20, v21, v13, v18, a3);
  id v23 = objc_alloc(MEMORY[0x263F53F80]);
  uint64_t v25 = objc_msgSend_initWithPredicate_sortDescriptors_range_(v23, v24, (uint64_t)v22, 0, 0);
  id v26 = objc_alloc(MEMORY[0x263F53F70]);
  long long v30 = objc_msgSend_store(self, v27, v28, v29);
  long long v33 = objc_msgSend_initWithStore_(v26, v31, (uint64_t)v30, v32);

  uint64_t v37 = 0;
  uint64_t v35 = objc_msgSend_fetchSyncWithOptions_error_(v33, v34, (uint64_t)v25, (uint64_t)&v37);

  return v35;
}

- (void)loadGuides
{
  uint64_t v3 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375D44F8;
  block[3] = &unk_264CD5570;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)guideEnabled:(id)a3
{
  uint64_t v5 = objc_msgSend_uuid(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend__guideWithIdentifierEnabled_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (void)enableWaypoints:(BOOL)a3 forGuide:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_uuid(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_UUIDString(v10, v11, v12, v13);

  if (v4)
  {
    if (objc_msgSend_containsObject_(self->_disabledGuides, v15, (uint64_t)v14, v17))
    {
      objc_msgSend_removeObject_(self->_disabledGuides, v18, (uint64_t)v14, v19);
      objc_msgSend__saveDisabledGuidesToDefaults(self, v20, v21, v22);
      objc_msgSend__addEnabledWaypointsForGuide_(self, v23, (uint64_t)v6, v24);
    }
  }
  else if (objc_msgSend_type(v6, v15, v16, v17) == 1)
  {
    if ((objc_msgSend_containsObject_(self->_disabledGuides, v25, (uint64_t)v14, v26) & 1) == 0)
    {
      objc_msgSend_addObject_(self->_disabledGuides, v27, (uint64_t)v14, v28);
      objc_msgSend__saveDisabledGuidesToDefaults(self, v29, v30, v31);
      objc_msgSend__removeDisabledWaypointsForGuide_(self, v32, (uint64_t)v6, v33);
    }
  }
  else
  {
    NCLogForCategory(9uLL);
    uint64_t v34 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR)) {
      sub_2375D9CE8(v6, v34, v35, v36);
    }
  }
}

- (int64_t)numEnabledGuideWaypoints
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_userGuides(self, a2, v2, v3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v12;
          if (objc_msgSend_guideEnabled_(self, v15, (uint64_t)v14, v16)) {
            v9 += objc_msgSend_waypointCount(v14, v17, v18, v19);
          }
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v13, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)numGuideWaypoints
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend_userGuides(self, a2, v2, v3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v8 += objc_msgSend_waypointCount(v11, v12, v13, v14);
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v12, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)numDisabledGuides
{
  return objc_msgSend_count(self->_disabledGuides, a2, v2, v3);
}

- (void)_handleFirstUnlock
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int64_t v8 = "-[NCGuidesManager _handleFirstUnlock]";
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Received notification that device has been unlocked.", buf, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_hasBeenUnlockedSinceBoot)
  {
    objc_sync_exit(v5);
  }
  else
  {
    v5->_hasBeenUnlockedSinceBoot = 1;
    objc_sync_exit(v5);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375D4A20;
    block[3] = &unk_264CD5570;
    void block[4] = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (BOOL)_guideWithIdentifierEnabled:(id)a3
{
  disabledGuides = self->_disabledGuides;
  uint64_t v5 = objc_msgSend_UUIDString(a3, a2, (uint64_t)a3, v3);
  LOBYTE(disabledGuides) = objc_msgSend_containsObject_(disabledGuides, v6, (uint64_t)v5, v7) ^ 1;

  return (char)disabledGuides;
}

- (void)_loadDisabledGuidesFromDefaults
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v13 = (id)objc_msgSend_initWithSuiteName_(v3, v4, @"com.apple.compass", v5);
  uint64_t v10 = objc_msgSend_objectForKey_(v13, v6, @"DisabledGuides", v7);
  if (v10)
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v8, (uint64_t)v10, v9);
    uint64_t v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = (NSMutableArray *)objc_opt_new();
  }
  disabledGuides = self->_disabledGuides;
  self->_disabledGuides = v11;
}

- (void)_saveDisabledGuidesToDefaults
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v6 = objc_msgSend_initWithSuiteName_(v3, v4, @"com.apple.compass", v5);
  objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)self->_disabledGuides, @"DisabledGuides");
  objc_msgSend_synchronize(v6, v8, v9, v10);
  uint64_t v11 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    id v13 = "-[NCGuidesManager _saveDisabledGuidesToDefaults]";
    _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_INFO, "%s: _saveDisabledGuidesToDefaults", (uint8_t *)&v12, 0xCu);
  }
}

- (void)_loadGuides
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hasBeenUnlockedSinceBoot)
  {
    id v3 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[NCGuidesManager _loadGuides]";
      BOOL v4 = "%s: We can't refresh guides until the device is unlocked the first time.";
      goto LABEL_13;
    }
LABEL_14:

    objc_sync_exit(v2);
    uint64_t v5 = v2;
    goto LABEL_15;
  }
  if (!v2->_store)
  {
    id v3 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[NCGuidesManager _loadGuides]";
      BOOL v4 = "%s: We can't refresh guides because store didn't load or failed to load.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v2->_loadingGuides)
  {
    id v3 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[NCGuidesManager _loadGuides]";
      BOOL v4 = "%s: Not refreshing guides as they are currently loading.";
LABEL_13:
      _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_INFO, v4, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v2->_loadedGuides)
  {
    id v3 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[NCGuidesManager _loadGuides]";
      BOOL v4 = "%s: Guides are already loaded.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_sync_exit(v2);

  uint64_t v6 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v36 = "-[NCGuidesManager _loadGuides]";
    _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Fetching map guide collections", buf, 0xCu);
  }

  uint64_t v7 = v2;
  objc_sync_enter(v7);
  v2->_loadingGuides = 1;
  objc_sync_exit(v7);

  uint64_t v11 = objc_msgSend_storeGroup(v7, v8, v9, v10);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  id v12 = objc_alloc(MEMORY[0x263F53F78]);
  long long v16 = objc_msgSend_store(v7, v13, v14, v15);
  long long v19 = objc_msgSend_initWithStore_(v12, v17, (uint64_t)v16, v18);

  id v34 = 0;
  long long v22 = objc_msgSend_fetchSyncAndReturnError_(v19, v20, (uint64_t)&v34, v21);
  uint64_t v5 = (NCGuidesManager *)v34;
  objc_msgSend__updateUserGuidesUsingCollections_(v7, v23, (uint64_t)v22, v24);
  uint64_t v25 = v7;
  objc_sync_enter(v25);
  v2->_loadingGuides = 0;
  objc_sync_exit(v25);

  uint64_t v26 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = objc_msgSend_count(v22, v27, v28, v29);
    *(_DWORD *)buf = 136315394;
    uint64_t v36 = "-[NCGuidesManager _loadGuides]";
    __int16 v37 = 2048;
    uint64_t v38 = v30;
    _os_log_impl(&dword_23759D000, v26, OS_LOG_TYPE_DEFAULT, "%s: Fetched collections, num collections is %lu", buf, 0x16u);
  }

  if (v5)
  {
    uint64_t v31 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2375D9DA0();
    }
  }
  else
  {
    uint64_t v32 = v25;
    objc_sync_enter(v32);
    v2->_loadedGuides = 1;
    objc_sync_exit(v32);

    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2375D5104;
    v33[3] = &unk_264CD5570;
    v33[4] = v32;
    dispatch_async(MEMORY[0x263EF83A0], v33);
  }

LABEL_15:
}

- (void)_refreshGuides
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_loadedGuides = 0;
  objc_sync_exit(v2);

  objc_msgSend_loadGuides(v2, v3, v4, v5);
}

- (void)_updateUserGuidesUsingCollections:(id)a3
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v84 = (NSArray *)objc_opt_new();
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v3;
  uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v92, (uint64_t)v103, 16);
  if (v86)
  {
    uint64_t v85 = *(void *)v93;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v93 != v85)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v87 = v8;
        uint64_t v10 = *(void **)(*((void *)&v92 + 1) + 8 * v8);
        uint64_t v11 = objc_msgSend_title(v10, v5, v6, v7);

        id v12 = NCLogForCategory(9uLL);
        id v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_title(v10, v14, v15, v16);
            id v17 = objc_claimAutoreleasedReturnValue();
            uint64_t v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
            long long v22 = NSNumber;
            uint64_t v26 = objc_msgSend_placesCount(v10, v23, v24, v25);
            uint64_t v29 = objc_msgSend_numberWithInt_(v22, v27, v26, v28);
            *(_DWORD *)buf = 136315650;
            v98 = "-[NCGuidesManager _updateUserGuidesUsingCollections:]";
            __int16 v99 = 2080;
            uint64_t v100 = v21;
            __int16 v101 = 2112;
            v102 = v29;
            _os_log_impl(&dword_23759D000, v13, OS_LOG_TYPE_DEFAULT, "%s: Converting to Guide - Collection: %s, num items is %@", buf, 0x20u);
          }
          id v13 = objc_opt_new();
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          uint64_t v33 = objc_msgSend_fetchPlaces(v10, v30, v31, v32);
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v88, (uint64_t)v96, 16);
          if (v35)
          {
            uint64_t v36 = *(void *)v89;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v89 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void **)(*((void *)&v88 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v40 = v38;
                  uint64_t v44 = objc_msgSend_identifier(v10, v41, v42, v43);
                  uint64_t v46 = objc_msgSend_waypointForCollectionPlaceItem_inGuide_(NCWaypoint, v45, (uint64_t)v40, (uint64_t)v44);

                  objc_msgSend_addObject_(v13, v47, (uint64_t)v46, v48);
                }
              }
              uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v39, (uint64_t)&v88, (uint64_t)v96, 16);
            }
            while (v35);
          }

          uint64_t v49 = NSString;
          objc_msgSend_title(v10, v50, v51, v52);
          id v53 = objc_claimAutoreleasedReturnValue();
          uint64_t v57 = objc_msgSend_UTF8String(v53, v54, v55, v56);
          objc_msgSend_stringWithUTF8String_(v49, v58, v57, v59);
          long long v60 = (char *)objc_claimAutoreleasedReturnValue();

          uint64_t v61 = [NCMapsUserGuide alloc];
          uint64_t v65 = objc_msgSend_identifier(v10, v62, v63, v64);
          double v67 = objc_msgSend_initWithIdentifier_name_waypoints_(v61, v66, (uint64_t)v65, (uint64_t)v60, v13);

          long long v68 = NCLogForCategory(9uLL);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v98 = v60;
            __int16 v99 = 2112;
            uint64_t v100 = (uint64_t)v13;
            _os_log_impl(&dword_23759D000, v68, OS_LOG_TYPE_DEFAULT, "Created guide with name %@ and waypoints %@", buf, 0x16u);
          }

          objc_msgSend_addObject_(v84, v69, (uint64_t)v67, v70);
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v74 = objc_msgSend_identifier(v10, v71, v72, v73);
          *(_DWORD *)buf = 136315394;
          v98 = "-[NCGuidesManager _updateUserGuidesUsingCollections:]";
          __int16 v99 = 2112;
          uint64_t v100 = (uint64_t)v74;
          _os_log_impl(&dword_23759D000, v13, OS_LOG_TYPE_INFO, "%s: Skipping collection %@, it has no title", buf, 0x16u);
        }
        uint64_t v8 = v87 + 1;
      }
      while (v87 + 1 != v86);
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v92, (uint64_t)v103, 16);
    }
    while (v86);
  }

  uint64_t v75 = self;
  objc_sync_enter(v75);
  __int16 v76 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    uint64_t v80 = objc_msgSend_count(v84, v77, v78, v79);
    *(_DWORD *)buf = 136315394;
    v98 = "-[NCGuidesManager _updateUserGuidesUsingCollections:]";
    __int16 v99 = 2048;
    uint64_t v100 = v80;
    _os_log_impl(&dword_23759D000, v76, OS_LOG_TYPE_INFO, "%s: setting _userGuides with %lu guides", buf, 0x16u);
  }

  userGuides = v75->_userGuides;
  v75->_userGuides = v84;

  objc_sync_exit(v75);
}

- (void)_refreshNonDistanceLimitedWaypoints
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[NCGuidesManager _refreshNonDistanceLimitedWaypoints]";
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_INFO, "%s: refreshing allEnabledWaypoints and allWaypoints.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend__refreshAllWaypoints(self, v4, v5, v6);
  objc_msgSend__postNotification_(self, v7, @"GuideWaypointsChangedNotification", v8);
}

- (void)_handleWaypointListChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = objc_msgSend_name(v4, v6, v7, v8);
    int v16 = 136315394;
    id v17 = "-[NCGuidesManager _handleWaypointListChanged:]";
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v16, 0x16u);
  }
  objc_msgSend__loadDisabledGuidesFromDefaults(self, v10, v11, v12);
  objc_msgSend__refreshNonDistanceLimitedWaypoints(self, v13, v14, v15);
}

- (void)reloadWaypoints
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[NCGuidesManager reloadWaypoints]";
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_INFO, "%s: will refresh waypoints/guides.", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__loadDisabledGuidesFromDefaults(self, v4, v5, v6);
  objc_msgSend__refreshAllWaypoints(self, v7, v8, v9);
}

- (void)storeControllerWithDidLoad:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_setStore_(v5, v6, (uint64_t)v4, v7);
  objc_sync_exit(v5);

  uint64_t v11 = objc_msgSend_storeGroup(v5, v8, v9, v10);
  dispatch_group_leave(v11);

  uint64_t v12 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[NCGuidesManager storeControllerWithDidLoad:]";
    _os_log_impl(&dword_23759D000, v12, OS_LOG_TYPE_DEFAULT, "%s: storeControllerWithDidLoad completed, loading guides", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_loadGuides(v5, v13, v14, v15);
}

- (void)storeControllerWithFailedToLoad:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[NCGuidesManager storeControllerWithFailedToLoad:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s: storeControllerWithFailedToLoad, error is %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = objc_msgSend_storeGroup(self, v6, v7, v8);
  dispatch_group_leave(v9);
}

- (void)storeControllerWithDataChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[NCGuidesManager storeControllerWithDataChanged:]";
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s: storeControllerWithDataChanged, error is %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend__refreshGuides(self, v6, v7, v8);
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  return self->_hasBeenUnlockedSinceBoot;
}

- (void)setHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_hasBeenUnlockedSinceBoot = a3;
}

- (BOOL)areWaypointsLimited
{
  return self->_areWaypointsLimited;
}

- (void)setAreWaypointsLimited:(BOOL)a3
{
  self->_areWaypointsLimited = a3;
}

- (NSArray)allGuideWaypointsLimitedByDistance
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (_TtC8MapsSync23MapsSyncStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
}

- (_TtC8MapsSync13MapsSyncStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_group)storeGroup
{
  return self->_storeGroup;
}

- (void)setStoreGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeGroup, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_allGuideWaypointsLimitedByDistance, 0);
  objc_storeStrong((id *)&self->_systemWaypointsLimitedByDistance, 0);
  objc_storeStrong((id *)&self->_systemWaypoints, 0);
  objc_storeStrong((id *)&self->_allWaypoints, 0);
  objc_storeStrong((id *)&self->_nonSystemEnabledWaypointsLimitedByDistance, 0);
  objc_storeStrong((id *)&self->_allEnabledWaypointsLimitedByDistance, 0);
  objc_storeStrong((id *)&self->_allEnabledWaypoints, 0);
  objc_storeStrong((id *)&self->_disabledGuides, 0);
  objc_storeStrong((id *)&self->_userGuides, 0);

  objc_storeStrong((id *)&self->_compassGuide, 0);
}

@end
@interface NCWaypointManager
+ (id)sharedAppManager;
+ (id)sharedCompassToolManager;
+ (id)sharedComplicationManager;
- (BOOL)_allowWriteAccess;
- (BOOL)_commitToCoreData;
- (BOOL)_useCloudKitContainer;
- (BOOL)saveElevationForGuideWaypoints:(id)a3;
- (BOOL)updateWaypoints:(id)a3;
- (NCWaypoint)closestDataWaypoint;
- (NCWaypoint)closestSOSWaypoint;
- (NCWaypoint)parkedCarWaypoint;
- (NCWaypoint)recentDataWaypoint;
- (NCWaypoint)recentSOSWaypoint;
- (NCWaypointManager)initWithSupportsParkedCarWaypoint:(BOOL)a3;
- (NSArray)cellularWaypoints;
- (NSManagedObjectContext)viewContext;
- (NSPersistentContainer)persistentContainer;
- (id)_appBundle;
- (id)_convertToNCWaypointList:(id)a3;
- (id)_coreDataWaypointWithUUID:(id)a3;
- (id)_excludingDisabledWaypoints:(id)a3;
- (id)_fetchCompassWaypointsFromCoreDataIncludingDisabled:(BOOL)a3;
- (id)_fetchCompassWaypointsIncludingDisabled:(BOOL)a3;
- (id)_fetchItemsWithRequest:(id)a3;
- (id)addWaypointAtLocation:(id)a3 withAltitude:(id)a4 withLabel:(id)a5 withColor:(id)a6 withSymbol:(id)a7 withType:(int64_t)a8 isEnabled:(BOOL)a9;
- (id)cellularWaypointsUpdatedHandle;
- (id)fetchCompassWaypoints;
- (id)fetchCompassWaypointsWithAltitude:(BOOL)a3;
- (id)fetchEnabledCompassWaypoints;
- (id)fetchGuideWaypointsWithElevation;
- (id)fetchTargetedWaypoint;
- (id)fetchWaypointsWithType:(int64_t)a3;
- (id)waypointWithUUID:(id)a3;
- (int64_t)_fetchCountItemsWithRequest:(id)a3;
- (int64_t)numWaypointsInElevationTableOfType:(int64_t)a3;
- (int64_t)numWaypointsMissingElevationOfType:(int64_t)a3;
- (unint64_t)waypointCountContainingKeyword:(id)a3;
- (void)_deleteWaypointInViewContext:(id)a3;
- (void)_deleteWaypointInViewContextByUUID:(id)a3;
- (void)_fetchOrCreateParkedCarWaypoint;
- (void)_logSystemWaypointsAnalytics;
- (void)_printWaypointList:(id)a3;
- (void)_publishCellularWaypointsUpdate;
- (void)_saveWaypoint:(id)a3;
- (void)_submitSystemWaypointsAnalytics:(unint64_t)a3;
- (void)_updateWaypointInViewContext:(id)a3;
- (void)deleteAllWaypoints;
- (void)deleteWaypoint:(id)a3;
- (void)deleteWaypointsByUUIDs:(id)a3;
- (void)setCellularWaypointsUpdatedHandle:(id)a3;
- (void)setClosestDataWaypoint:(id)a3;
- (void)setClosestSOSWaypoint:(id)a3;
- (void)setParkedCarWaypoint:(id)a3;
- (void)setRecentDataWaypoint:(id)a3;
- (void)setRecentSOSWaypoint:(id)a3;
- (void)updateParkedCarWaypointWithLocation:(id)a3;
- (void)updateParkedCarWaypointWithLocation:(id)a3 withAltitude:(id)a4;
- (void)updateWaypoint:(id)a3;
- (void)updateWaypointWithUUID:(id)a3 withLocation:(id)a4 withAltitude:(id)a5;
@end

@implementation NCWaypointManager

+ (id)sharedAppManager
{
  if (qword_268921260 != -1) {
    dispatch_once(&qword_268921260, &unk_26EA48CE0);
  }
  v2 = (void *)qword_268921258;

  return v2;
}

+ (id)sharedComplicationManager
{
  if (qword_268921270 != -1) {
    dispatch_once(&qword_268921270, &unk_26EA48D00);
  }
  v2 = (void *)qword_268921268;

  return v2;
}

+ (id)sharedCompassToolManager
{
  if (qword_268921280 != -1) {
    dispatch_once(&qword_268921280, &unk_26EA48D20);
  }
  v2 = (void *)qword_268921278;

  return v2;
}

- (NCWaypointManager)initWithSupportsParkedCarWaypoint:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NCWaypointManager;
  v4 = [(NCWaypointManager *)&v20 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x263F086E0];
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_bundleForClass_(v5, v7, v6, v8);
    bundle = v4->_bundle;
    v4->_bundle = (NSBundle *)v9;

    uint64_t v14 = objc_msgSend_bundleIdentifier(v4->_bundle, v11, v12, v13);
    bundleIdentifier = v4->_bundleIdentifier;
    v4->_bundleIdentifier = (NSString *)v14;

    v4->_lastCellularWaypointCount = -1;
    if (v3) {
      objc_msgSend__fetchOrCreateParkedCarWaypoint(v4, v16, v17, v18);
    }
  }
  return v4;
}

- (void)_fetchOrCreateParkedCarWaypoint
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!self->_parkedCarWaypoint)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v6 = objc_msgSend_initWithSuiteName_(v3, v4, @"com.apple.compass", v5);
    objc_msgSend_synchronize(v6, v7, v8, v9);
    v15 = objc_msgSend_objectForKey_(v6, v10, @"ParkedCarWaypointUUID", v11);
    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F08C38]);
      v19 = objc_msgSend_initWithUUIDString_(v16, v17, (uint64_t)v15, v18);
      objc_msgSend_parkedCarWaypointWithUUID_(NCWaypoint, v20, (uint64_t)v19, v21);
    }
    else
    {
      v19 = objc_msgSend_UUID(MEMORY[0x263F08C38], v12, v13, v14);
      v25 = objc_msgSend_UUIDString(v19, v22, v23, v24);
      objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v25, @"ParkedCarWaypointUUID");

      v27 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_msgSend_UUIDString(v19, v28, v29, v30);
        int v36 = 136315394;
        v37 = "-[NCWaypointManager _fetchOrCreateParkedCarWaypoint]";
        __int16 v38 = 2112;
        v39 = v31;
        _os_log_impl(&dword_23759D000, v27, OS_LOG_TYPE_DEFAULT, "%s: created ParkedCarWaypoint with uuid %@ and saved to defaults.", (uint8_t *)&v36, 0x16u);
      }
      objc_msgSend_parkedCarWaypointWithUUID_(NCWaypoint, v32, (uint64_t)v19, v33);
    }
    v34 = (NCWaypoint *)objc_claimAutoreleasedReturnValue();
    parkedCarWaypoint = self->_parkedCarWaypoint;
    self->_parkedCarWaypoint = v34;
  }
}

- (void)updateParkedCarWaypointWithLocation:(id)a3
{
}

- (void)updateParkedCarWaypointWithLocation:(id)a3 withAltitude:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_parkedCarWaypoint(self, v8, v9, v10);

  if (!v11) {
    objc_msgSend__fetchOrCreateParkedCarWaypoint(self, v12, v13, v14);
  }
  objc_msgSend_setLocation_(self->_parkedCarWaypoint, v12, (uint64_t)v6, v14);
  objc_msgSend__postParkedCarWaypointChangedNotification(self, v15, v16, v17);
  if (!v6)
  {
    v22 = objc_msgSend_sharedManager(NCTargetedWaypointManager, v18, v19, v20);
    v26 = objc_msgSend_targetedWaypointUUID(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v30 = objc_msgSend_uuid(self->_parkedCarWaypoint, v27, v28, v29);
      int isEqual = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32);

      if (isEqual)
      {
        v34 = NCLogForCategory(7uLL);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = 136315138;
          v47 = "-[NCWaypointManager updateParkedCarWaypointWithLocation:withAltitude:]";
          _os_log_impl(&dword_23759D000, v34, OS_LOG_TYPE_DEFAULT, "%s: Clearing Targeted Waypoint because it was set to Parked Car and Parked Car location is now nil.", (uint8_t *)&v46, 0xCu);
        }

        __int16 v38 = objc_msgSend_sharedManager(NCTargetedWaypointManager, v35, v36, v37);
        objc_msgSend_setTargetedWaypointUUID_(v38, v39, 0, v40);
      }
    }

    if (v7) {
      goto LABEL_5;
    }
LABEL_12:
    double v21 = 0.0;
    goto LABEL_13;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_5:
  objc_msgSend_doubleValue(v7, v18, v19, v20);
LABEL_13:
  objc_msgSend_setAltitude_(self->_parkedCarWaypoint, v18, v19, v20, v21);
  objc_msgSend_setAltitudePopulated_(self->_parkedCarWaypoint, v41, v7 != 0, v42);
  objc_msgSend__logSystemWaypointsAnalytics(self, v43, v44, v45);
}

- (id)fetchTargetedWaypoint
{
  uint64_t v5 = objc_msgSend_sharedManager(NCTargetedWaypointManager, a2, v2, v3);
  uint64_t v9 = objc_msgSend_fetchTargetedWaypointUUID(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_UUIDString(v9, v10, v11, v12);

  if (!v13) {
    goto LABEL_5;
  }
  id v14 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v17 = objc_msgSend_initWithUUIDString_(v14, v15, (uint64_t)v13, v16);
  uint64_t v20 = objc_msgSend_waypointWithUUID_(self, v18, (uint64_t)v17, v19);

  if (v20) {
    goto LABEL_6;
  }
  uint64_t v24 = objc_msgSend_parkedCarWaypoint(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_uuid(v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_UUIDString(v28, v29, v30, v31);
  int isEqualToString = objc_msgSend_isEqualToString_(v32, v33, (uint64_t)v13, v34);

  if (isEqualToString)
  {
    uint64_t v20 = objc_msgSend_parkedCarWaypoint(self, v36, v37, v38);
  }
  else
  {
LABEL_5:
    uint64_t v20 = 0;
  }
LABEL_6:

  return v20;
}

- (id)fetchCompassWaypoints
{
  return (id)((uint64_t (*)(NCWaypointManager *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel__fetchCompassWaypointsIncludingDisabled_, 1);
}

- (id)fetchEnabledCompassWaypoints
{
  return (id)((uint64_t (*)(NCWaypointManager *, char *, void))MEMORY[0x270F9A6D0])(self, sel__fetchCompassWaypointsIncludingDisabled_, 0);
}

- (id)fetchCompassWaypointsWithAltitude:(BOOL)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestForCompassWaypointsWithAltitude_(NCWaypointFetchRequests, a2, a3, v3);
  uint64_t v8 = objc_msgSend__fetchItemsWithRequest_(self, v6, (uint64_t)v5, v7);
  uint64_t v11 = objc_msgSend__convertToNCWaypointList_(self, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)fetchWaypointsWithType:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestForCountOfWaypointsInElevationTableOfType_(NCWaypointFetchRequests, a2, a3, v3);
  uint64_t v8 = objc_msgSend__fetchItemsWithRequest_(self, v6, (uint64_t)v5, v7);
  uint64_t v11 = objc_msgSend__convertToNCWaypointList_(self, v9, (uint64_t)v8, v10);

  return v11;
}

- (unint64_t)waypointCountContainingKeyword:(id)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestForWaypointContainingKeyword_(NCWaypointFetchRequests, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend__fetchItemsWithRequest_(self, v6, (uint64_t)v5, v7);
  uint64_t v12 = v8;
  if (v8) {
    unint64_t v13 = objc_msgSend_count(v8, v9, v10, v11);
  }
  else {
    unint64_t v13 = 0;
  }

  return v13;
}

- (void)deleteWaypoint:(id)a3
{
  objc_msgSend__deleteWaypointInViewContext_(self, a2, (uint64_t)a3, v3);
  objc_msgSend__commitToCoreData(self, v5, v6, v7);

  objc_msgSend__postWaypointListChangedNotification(self, v8, v9, v10);
}

- (void)deleteWaypointsByUUIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend__deleteWaypointInViewContextByUUID_(self, v11, *(void *)(*((void *)&v22 + 1) + 8 * v15++), v12, (void)v22);
        }
        while (v13 != v15);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v13);
    }

    objc_msgSend__commitToCoreData(self, v16, v17, v18);
    objc_msgSend__postWaypointListChangedNotification(self, v19, v20, v21);
  }
}

- (void)_deleteWaypointInViewContextByUUID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_viewContext(self, v5, v6, v7);

  if (v8)
  {
    uint64_t v14 = objc_msgSend__coreDataWaypointWithUUID_(self, v9, (uint64_t)v4, v10);
    if (v14)
    {
      uint64_t v15 = objc_msgSend_viewContext(self, v11, v12, v13);
      objc_msgSend_deleteObject_(v15, v16, (uint64_t)v14, v17);

      uint64_t v21 = objc_msgSend_sharedManager(NCTargetedWaypointManager, v18, v19, v20);
      long long v25 = objc_msgSend_targetedWaypointUUID(v21, v22, v23, v24);

      if (v25 && objc_msgSend_isEqual_(v4, v26, (uint64_t)v25, v27))
      {
        uint64_t v31 = objc_msgSend_sharedManager(NCTargetedWaypointManager, v28, v29, v30);
        objc_msgSend_setTargetedWaypointUUID_(v31, v32, 0, v33);
      }
    }
    else
    {
      long long v25 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_2375D86F0();
      }
    }
  }
  else
  {
    uint64_t v14 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2375D8678(v14, v34, v35, v36, v37, v38, v39, v40);
    }
  }
}

- (void)_deleteWaypointInViewContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_label(v4, v6, v7, v8);
    uint64_t v13 = objc_msgSend_uuid(v4, v10, v11, v12);
    uint64_t v17 = objc_msgSend_UUIDString(v13, v14, v15, v16);
    int v24 = 138412546;
    long long v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v17;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "Delete waypoint %@ with uuid %{public}@.", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v21 = objc_msgSend_uuid(v4, v18, v19, v20);
  objc_msgSend__deleteWaypointInViewContextByUUID_(self, v22, (uint64_t)v21, v23);
}

- (void)deleteAllWaypoints
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v3 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "Delete all waypoints in the database", buf, 2u);
  }

  uint64_t v7 = objc_msgSend_viewContext(self, v4, v5, v6);

  if (v7)
  {
    uint64_t v11 = objc_msgSend_fetchRequestForAllWaypoints(NCWaypointFetchRequests, v8, v9, v10);
    uint64_t v14 = objc_msgSend__fetchItemsWithRequest_(self, v12, (uint64_t)v11, v13);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v43, (uint64_t)v48, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v44;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v14);
          }
          uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * v22);
          int v24 = objc_msgSend_viewContext(self, v17, v18, v19);
          objc_msgSend_deleteObject_(v24, v25, v23, v26);

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v43, (uint64_t)v48, 16);
      }
      while (v20);
    }
    objc_msgSend__commitToCoreData(self, v17, v18, v19);
    uint64_t v30 = objc_msgSend_sharedManager(NCTargetedWaypointManager, v27, v28, v29);
    objc_msgSend_setTargetedWaypointUUID_(v30, v31, 0, v32);

    objc_msgSend__postWaypointListChangedNotification(self, v33, v34, v35);
  }
  else
  {
    uint64_t v11 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2375D8774(v11, v36, v37, v38, v39, v40, v41, v42);
    }
  }
}

- (id)addWaypointAtLocation:(id)a3 withAltitude:(id)a4 withLabel:(id)a5 withColor:(id)a6 withSymbol:(id)a7 withType:(int64_t)a8 isEnabled:(BOOL)a9
{
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = [NCWaypoint alloc];
  isEnabled = objc_msgSend_initWithLabel_color_symbol_type_location_altitude_isEnabled_(v20, v21, (uint64_t)v17, (uint64_t)v16, v15, a8, v19, v18, a9);

  objc_msgSend__saveWaypoint_(self, v23, (uint64_t)isEnabled, v24);
  objc_msgSend__commitToCoreData(self, v25, v26, v27);
  objc_msgSend__postWaypointListChangedNotification(self, v28, v29, v30);

  return isEnabled;
}

- (void)updateWaypoint:(id)a3
{
  objc_msgSend__updateWaypointInViewContext_(self, a2, (uint64_t)a3, v3);
  objc_msgSend__commitToCoreData(self, v5, v6, v7);

  objc_msgSend__postWaypointListChangedNotification(self, v8, v9, v10);
}

- (BOOL)updateWaypoints:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend__updateWaypointInViewContext_(self, v11, *(void *)(*((void *)&v24 + 1) + 8 * i), v12, (void)v24);
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v13);
    }

    if (!objc_msgSend__commitToCoreData(self, v16, v17, v18))
    {
      BOOL v22 = 0;
      goto LABEL_13;
    }
    objc_msgSend__postWaypointListChangedNotification(self, v19, v20, v21);
  }
  BOOL v22 = 1;
LABEL_13:

  return v22;
}

- (void)_updateWaypointInViewContext:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_uuid(v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend__coreDataWaypointWithUUID_(self, v9, (uint64_t)v8, v10);

  if (v11)
  {
    id v15 = objc_msgSend_label(v4, v12, v13, v14);
    objc_msgSend_setLabel_(v11, v16, (uint64_t)v15, v17);

    uint64_t v21 = objc_msgSend_labelColor(v4, v18, v19, v20);
    objc_msgSend_setLabelColor_(v11, v22, (uint64_t)v21, v23);

    uint64_t isEnabled = objc_msgSend_isEnabled(v4, v24, v25, v26);
    objc_msgSend_setEnabled_(v11, v28, isEnabled, v29);
    uint64_t v33 = objc_msgSend_symbol(v4, v30, v31, v32);
    objc_msgSend_setSymbol_(v11, v34, (uint64_t)v33, v35);

    uint64_t v39 = objc_msgSend_timestampOfCreation(v4, v36, v37, v38);
    objc_msgSend_setTimeOfCreation_(v11, v40, (uint64_t)v39, v41);

    long long v45 = objc_msgSend_location(v4, v42, v43, v44);
    objc_msgSend_setCoreLocation_(v11, v46, (uint64_t)v45, v47);

    objc_msgSend_altitude(v4, v48, v49, v50);
    objc_msgSend_setAltitude_(v11, v51, v52, v53);
    uint64_t isAltitudePopulated = objc_msgSend_isAltitudePopulated(v4, v54, v55, v56);
    objc_msgSend_setAltitudePopulated_(v11, v58, isAltitudePopulated, v59);
    __int16 v63 = objc_msgSend_type(v4, v60, v61, v62);
    objc_msgSend_setType_(v11, v64, v63, v65);
  }
  else
  {
    NCLogForCategory(7uLL);
    v66 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR)) {
      sub_2375D87EC(v4, v66, v67, v68);
    }
  }
}

- (void)updateWaypointWithUUID:(id)a3 withLocation:(id)a4 withAltitude:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend__coreDataWaypointWithUUID_(self, v11, (uint64_t)v8, v12);
  id v16 = v13;
  if (v13)
  {
    objc_msgSend_setCoreLocation_(v13, v14, (uint64_t)v9, v15);
    if (v10) {
      objc_msgSend_doubleValue(v10, v17, v18, v19);
    }
    else {
      double v20 = 0.0;
    }
    objc_msgSend_setAltitude_(v16, v17, v18, v19, v20);
    objc_msgSend_setAltitudePopulated_(v16, v22, v10 != 0, v23);
    objc_msgSend__commitToCoreData(self, v24, v25, v26);
    objc_msgSend__postWaypointListChangedNotification(self, v27, v28, v29);
  }
  else
  {
    uint64_t v21 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_2375D8880();
    }
  }
}

- (id)waypointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = sub_2375B8B34;
  uint64_t v21 = sub_2375B8B44;
  id v22 = 0;
  id v8 = objc_msgSend_fetchCompassWaypoints(self, v5, v6, v7);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2375B8B4C;
  v14[3] = &unk_264CD5B20;
  id v9 = v4;
  id v15 = v9;
  id v16 = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)v14, v11);

  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)saveElevationForGuideWaypoints:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v39 = v4;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v10)
    {
      uint64_t v14 = v10;
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v8);
          }
          uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v18 = NSNumber;
          objc_msgSend_altitude(v17, v11, v12, v13);
          id v22 = objc_msgSend_numberWithDouble_(v18, v19, v20, v21);
          uint64_t v26 = objc_msgSend_uuid(v17, v23, v24, v25);
          uint64_t v28 = objc_msgSend_guideWaypointInDbWithUUID_altitude_(NCWaypoint, v27, (uint64_t)v26, (uint64_t)v22);

          objc_msgSend__saveWaypoint_(self, v29, (uint64_t)v28, v30);
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v40, (uint64_t)v44, 16);
      }
      while (v14);
    }

    char v34 = objc_msgSend__commitToCoreData(self, v31, v32, v33);
    objc_msgSend__postWaypointListChangedNotification(self, v35, v36, v37);
    id v4 = v39;
  }
  else
  {
    char v34 = 1;
  }

  return v34;
}

- (id)fetchGuideWaypointsWithElevation
{
  uint64_t v3 = objc_msgSend_fetchRequestForWaypointsOfType_withAltitude_(NCWaypointFetchRequests, a2, 2, 1);
  uint64_t v6 = objc_msgSend__fetchItemsWithRequest_(self, v4, (uint64_t)v3, v5);
  id v9 = objc_msgSend__convertToNCWaypointList_(self, v7, (uint64_t)v6, v8);

  return v9;
}

- (NSPersistentContainer)persistentContainer
{
  v90[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer && isFullyFeaturedApp())
  {
    bundle = v2->_bundle;
    if (bundle)
    {
      uint64_t v5 = objc_msgSend_URLForResource_withExtension_(bundle, v3, @"CompassModel", @"momd");
      id v6 = objc_alloc(MEMORY[0x263EFF298]);
      id v9 = objc_msgSend_initWithContentsOfURL_(v6, v7, (uint64_t)v5, v8);
      int v13 = objc_msgSend__useCloudKitContainer(v2, v10, v11, v12);
      uint64_t v14 = (Class *)0x263EFF2C0;
      if (!v13) {
        uint64_t v14 = (Class *)0x263EFF2E8;
      }
      id v15 = objc_alloc(*v14);
      uint64_t v17 = objc_msgSend_initWithName_managedObjectModel_(v15, v16, @"CompassModel", (uint64_t)v9);
      persistentContainer = v2->_persistentContainer;
      v2->_persistentContainer = (NSPersistentContainer *)v17;

      id v22 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v19, v20, v21);
      uint64_t v25 = objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(v22, v23, @"group.com.apple.nanocompass", v24);

      if (v25)
      {
        uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v26, @"%@.sqlite", v27, @"CompassModel");
        uint64_t v31 = objc_msgSend_URLByAppendingPathComponent_(v25, v29, (uint64_t)v28, v30);

        uint64_t v32 = NCLogForCategory(7uLL);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_description(v31, v33, v34, v35);
          uint64_t v36 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v85 = v36;
          _os_log_impl(&dword_23759D000, v32, OS_LOG_TYPE_DEFAULT, "print store URL %@", buf, 0xCu);
        }
        long long v42 = objc_msgSend_persistentStoreDescriptionWithURL_(MEMORY[0x263EFF328], v37, (uint64_t)v31, v38);
        if (v13)
        {
          long long v43 = objc_msgSend__appBundle(v2, v39, v40, v41);
          v90[0] = v43;
          uint64_t v45 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v44, (uint64_t)v90, 1);
          objc_msgSend_setOption_forKey_(v42, v46, (uint64_t)v45, *MEMORY[0x263EFF0C0]);

          id v47 = objc_alloc(MEMORY[0x263EFF2E0]);
          uint64_t v50 = objc_msgSend_initWithContainerIdentifier_(v47, v48, @"com.apple.watch.compass", v49);
          objc_msgSend_setUseDeviceToDeviceEncryption_(v50, v51, 1, v52);
          objc_msgSend_setCloudKitContainerOptions_(v42, v53, (uint64_t)v50, v54);
        }
        int v55 = objc_msgSend__allowWriteAccess(v2, v39, v40, v41);
        uint64_t v57 = *MEMORY[0x263EFF138];
        if (v55)
        {
          objc_msgSend_setOption_forKey_(v42, v56, MEMORY[0x263EFFA80], v57);
          objc_msgSend_setOption_forKey_(v42, v58, MEMORY[0x263EFFA88], *MEMORY[0x263EFF0B0]);
        }
        else
        {
          objc_msgSend_setOption_forKey_(v42, v56, MEMORY[0x263EFFA88], v57);
          objc_msgSend_setOption_forKey_(v42, v65, MEMORY[0x263EFFA80], *MEMORY[0x263EFF0B0]);
        }
        v66 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v59, (uint64_t)v42, v60);
        objc_msgSend_setPersistentStoreDescriptions_(v2->_persistentContainer, v67, (uint64_t)v66, v68);

        objc_initWeak(&location, v2);
        v69 = NCLogForCategory(7uLL);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          bundleIdentifier = v2->_bundleIdentifier;
          int Only = objc_msgSend_isReadOnly(v42, v70, v71, v72);
          v75 = @"not ";
          if (v13) {
            v75 = &stru_26EA49580;
          }
          *(_DWORD *)buf = 138412802;
          v85 = bundleIdentifier;
          __int16 v86 = 2112;
          v87 = v75;
          if (Only) {
            v76 = @"read-only";
          }
          else {
            v76 = @"read-write";
          }
          __int16 v88 = 2112;
          v89 = v76;
          _os_log_impl(&dword_23759D000, v69, OS_LOG_TYPE_DEFAULT, "Start loading store for %@. It's %@a CloudKit container. It's %@.", buf, 0x20u);
        }

        v77 = v2->_persistentContainer;
        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = sub_2375B9380;
        v81[3] = &unk_264CD5B48;
        objc_copyWeak(&v82, &location);
        objc_msgSend_loadPersistentStoresWithCompletionHandler_(v77, v78, (uint64_t)v81, v79);
        objc_destroyWeak(&v82);
        objc_destroyWeak(&location);

        goto LABEL_29;
      }
      uint64_t v62 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_2375D8948(v62);
      }

      __int16 v63 = v2->_persistentContainer;
      v2->_persistentContainer = 0;

      viewContext = v2->_viewContext;
      v2->_viewContext = 0;

      uint64_t v61 = v2->_persistentContainer;
    }
    else
    {
      uint64_t v5 = NCLogForCategory(7uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_2375D8904(v5);
      }
      uint64_t v61 = 0;
    }

    objc_sync_exit(v2);
    goto LABEL_30;
  }
LABEL_29:
  objc_sync_exit(v2);

  uint64_t v61 = v2->_persistentContainer;
LABEL_30:

  return v61;
}

- (BOOL)_useCloudKitContainer
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375B9564;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_268921290 != -1) {
    dispatch_once(&qword_268921290, block);
  }
  return byte_268921288;
}

- (BOOL)_allowWriteAccess
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375B962C;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_2689212A0 != -1) {
    dispatch_once(&qword_2689212A0, block);
  }
  return byte_268921298;
}

- (id)_appBundle
{
  if (qword_2689212B0 != -1) {
    dispatch_once(&qword_2689212B0, &unk_26EA48D40);
  }
  uint64_t v2 = (void *)qword_2689212A8;

  return v2;
}

- (NSManagedObjectContext)viewContext
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_viewContext)
  {
    id v6 = objc_msgSend_persistentContainer(v2, v3, v4, v5);
    uint64_t v10 = objc_msgSend_viewContext(v6, v7, v8, v9);
    viewContext = v2->_viewContext;
    v2->_viewContext = (NSManagedObjectContext *)v10;

    objc_msgSend_setMergePolicy_(v2->_viewContext, v12, *MEMORY[0x263EFF060], v13);
  }
  objc_sync_exit(v2);

  uint64_t v14 = v2->_viewContext;

  return v14;
}

- (id)_fetchItemsWithRequest:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_viewContext(self, v5, v6, v7);

  if (v8)
  {
    uint64_t v12 = objc_msgSend_viewContext(self, v9, v10, v11);
    id v43 = 0;
    uint64_t v14 = objc_msgSend_executeFetchRequest_error_(v12, v13, (uint64_t)v4, (uint64_t)&v43);
    id v15 = v43;
    uint64_t v19 = objc_msgSend_mutableCopy(v14, v16, v17, v18);

    if (v15)
    {
      NCLogForCategory(1uLL);
      uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
        sub_2375D8A04(v15, v23, v24, v25);
      }
    }
    else
    {
      if (v19 && objc_msgSend_count(v19, v20, v21, v22))
      {
        id v29 = v19;
        goto LABEL_6;
      }
      NCLogForCategory(7uLL);
      uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v45 = "-[NCWaypointManager _fetchItemsWithRequest:]";
        _os_log_impl(&dword_23759D000, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "%s no record is found in the database", buf, 0xCu);
      }
    }

    objc_msgSend_array(MEMORY[0x263EFF980], v26, v27, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    uint64_t v30 = v29;

    goto LABEL_10;
  }
  uint64_t v31 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_2375D898C(v31, v32, v33, v34, v35, v36, v37, v38);
  }

  uint64_t v30 = objc_msgSend_array(MEMORY[0x263EFF980], v39, v40, v41);
LABEL_10:

  return v30;
}

- (int64_t)_fetchCountItemsWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_viewContext(self, v5, v6, v7);

  if (!v8)
  {
    id v15 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2375D8A9C(v15, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_8;
  }
  uint64_t v12 = objc_msgSend_viewContext(self, v9, v10, v11);
  id v27 = 0;
  int64_t Request_error = objc_msgSend_countForFetchRequest_error_(v12, v13, (uint64_t)v4, (uint64_t)&v27);
  id v15 = v27;

  if (v15)
  {
    NCLogForCategory(1uLL);
    id v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_2375D8B14(v15, v16, v17, v18);
    }

LABEL_8:
    int64_t Request_error = -1;
  }

  return Request_error;
}

- (BOOL)_commitToCoreData
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_viewContext(self, a2, v2, v3);

  if (!v5)
  {
    uint64_t v20 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_2375D8BAC(v20, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend_viewContext(self, v6, v7, v8);
  if (objc_msgSend_hasChanges(v9, v10, v11, v12))
  {
    id v16 = objc_msgSend_viewContext(self, v13, v14, v15);
    id v34 = 0;
    char v19 = objc_msgSend_save_(v16, v17, (uint64_t)&v34, v18);
    uint64_t v20 = v34;

    if ((v19 & 1) == 0)
    {
      NCLogForCategory(7uLL);
      uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_2375D8C24(v20, v21, v22, v23);
      }

LABEL_9:
      BOOL v31 = 0;
      goto LABEL_14;
    }
  }
  else
  {

    uint64_t v20 = 0;
  }
  uint64_t v32 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v36 = "-[NCWaypointManager _commitToCoreData]";
    _os_log_impl(&dword_23759D000, v32, OS_LOG_TYPE_DEFAULT, "%s Data is saved successfully.", buf, 0xCu);
  }

  BOOL v31 = 1;
LABEL_14:

  return v31;
}

- (id)_fetchCompassWaypointsIncludingDisabled:(BOOL)a3
{
  uint64_t v3 = objc_opt_new();

  return v3;
}

- (id)_fetchCompassWaypointsFromCoreDataIncludingDisabled:(BOOL)a3
{
  if (a3) {
    objc_msgSend_fetchRequestForCompassWaypoints(NCWaypointFetchRequests, a2, a3, v3);
  }
  else {
  uint64_t v5 = objc_msgSend_fetchRequestForEnabledCompassWaypoints(NCWaypointFetchRequests, a2, a3, v3);
  }
  uint64_t v8 = objc_msgSend__fetchItemsWithRequest_(self, v6, (uint64_t)v5, v7);
  uint64_t v11 = objc_msgSend__convertToNCWaypointList_(self, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)_coreDataWaypointWithUUID:(id)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestForWaypointWithUUID_(NCWaypointFetchRequests, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend__fetchItemsWithRequest_(self, v6, (uint64_t)v5, v7);
  uint64_t v12 = v8;
  if (v8 && objc_msgSend_count(v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(v12, v13, 0, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_excludingDisabledWaypoints:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v33, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v26;
    *(void *)&long long v11 = 136315394;
    long long v24 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend_isEnabled(v15, v8, v9, v10, v24, (void)v25))
        {
          id v16 = NCLogForCategory(1uLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = objc_msgSend_label(v15, v17, v18, v19);
            *(_DWORD *)buf = v24;
            uint64_t v30 = "-[NCWaypointManager _excludingDisabledWaypoints:]";
            __int16 v31 = 2112;
            uint64_t v32 = v20;
            _os_log_impl(&dword_23759D000, v16, OS_LOG_TYPE_DEFAULT, "%s waypoint: %@ is enabled.", buf, 0x16u);
          }
          objc_msgSend_addObject_(v4, v21, (uint64_t)v15, v22);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, (uint64_t)v33, 16);
    }
    while (v12);
  }

  return v4;
}

- (void)_printWaypointList:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = a3;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v51, (uint64_t)v67, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v52 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v9 = NCLogForCategory(1uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = objc_msgSend_label(v8, v10, v11, v12);
          uint64_t v50 = objc_msgSend_location(v8, v14, v15, v16);
          objc_msgSend_coordinate(v50, v17, v18, v19);
          uint64_t v21 = v20;
          long long v25 = objc_msgSend_location(v8, v22, v23, v24);
          objc_msgSend_coordinate(v25, v26, v27, v28);
          uint64_t v30 = v29;
          uint64_t v34 = objc_msgSend_uuid(v8, v31, v32, v33);
          objc_msgSend_UUIDString(v34, v35, v36, v37);
          v39 = uint64_t v38 = v6;
          id v43 = objc_msgSend_symbol(v8, v40, v41, v42);
          int isEnabled = objc_msgSend_isEnabled(v8, v44, v45, v46);
          *(_DWORD *)buf = 138413570;
          uint64_t v56 = v13;
          __int16 v57 = 2048;
          uint64_t v58 = v21;
          __int16 v59 = 2048;
          uint64_t v60 = v30;
          __int16 v61 = 2112;
          uint64_t v62 = v39;
          __int16 v63 = 2112;
          v64 = v43;
          __int16 v65 = 1024;
          int v66 = isEnabled;
          _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "waypoint label %@, lat %f, lng %f, UUID %@, symbol name %@, is enabled %d", buf, 0x3Au);

          uint64_t v6 = v38;
        }
      }
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v51, (uint64_t)v67, 16);
    }
    while (v5);
  }
}

- (void)_saveWaypoint:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_viewContext(self, v5, v6, v7);

  if (v8)
  {
    uint64_t v12 = (void *)MEMORY[0x263EFF240];
    uint64_t v13 = objc_msgSend_viewContext(self, v9, v10, v11);
    uint64_t v15 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(v12, v14, @"Waypoint", (uint64_t)v13);

    uint64_t v19 = objc_msgSend_uuid(v4, v16, v17, v18);
    objc_msgSend_setUuid_(v15, v20, (uint64_t)v19, v21);

    long long v25 = objc_msgSend_label(v4, v22, v23, v24);
    objc_msgSend_setLabel_(v15, v26, (uint64_t)v25, v27);

    __int16 v31 = objc_msgSend_labelColor(v4, v28, v29, v30);
    objc_msgSend_setLabelColor_(v15, v32, (uint64_t)v31, v33);

    uint64_t isEnabled = objc_msgSend_isEnabled(v4, v34, v35, v36);
    objc_msgSend_setEnabled_(v15, v38, isEnabled, v39);
    id v43 = objc_msgSend_symbol(v4, v40, v41, v42);
    objc_msgSend_setSymbol_(v15, v44, (uint64_t)v43, v45);

    uint64_t v49 = objc_msgSend_timestampOfCreation(v4, v46, v47, v48);
    objc_msgSend_setTimeOfCreation_(v15, v50, (uint64_t)v49, v51);

    int v55 = objc_msgSend_location(v4, v52, v53, v54);
    objc_msgSend_setCoreLocation_(v15, v56, (uint64_t)v55, v57);

    objc_msgSend_altitude(v4, v58, v59, v60);
    objc_msgSend_setAltitude_(v15, v61, v62, v63);
    uint64_t isAltitudePopulated = objc_msgSend_isAltitudePopulated(v4, v64, v65, v66);
    objc_msgSend_setAltitudePopulated_(v15, v68, isAltitudePopulated, v69);
    __int16 v73 = objc_msgSend_type(v4, v70, v71, v72);
    objc_msgSend_setType_(v15, v74, v73, v75);
  }
  else
  {
    uint64_t v15 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2375D8CE4(v15, v76, v77, v78, v79, v80, v81, v82);
    }
  }
}

- (id)_convertToNCWaypointList:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, (uint64_t)v59, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    uint64_t v10 = &off_264CD5000;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
        uint64_t v13 = NCLogForCategory(7uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = objc_msgSend_label(v12, v14, v15, v16);
          uint64_t v34 = objc_msgSend_symbol(v12, v31, v32, v33);
          uint64_t v38 = objc_msgSend_coreLocation(v12, v35, v36, v37);
          objc_msgSend_altitude(v12, v39, v40, v41);
          *(_DWORD *)buf = 136316162;
          uint64_t v50 = "-[NCWaypointManager _convertToNCWaypointList:]";
          __int16 v51 = 2112;
          long long v52 = v30;
          __int16 v53 = 2112;
          uint64_t v54 = v34;
          __int16 v55 = 2112;
          uint64_t v56 = v38;
          __int16 v57 = 2048;
          uint64_t v58 = v42;
          _os_log_debug_impl(&dword_23759D000, v13, OS_LOG_TYPE_DEBUG, "%s printing core data waypoint label %@, symbol %@, location %@, altitude %f", buf, 0x34u);

          uint64_t v10 = &off_264CD5000;
        }

        uint64_t v20 = objc_msgSend_uuid(v12, v17, v18, v19);

        if (v20)
        {
          uint64_t v23 = objc_msgSend_waypointForCoreDataWaypoint_(v10[58], v21, (uint64_t)v12, v22);
          objc_msgSend_addObject_(v4, v24, (uint64_t)v23, v25);
        }
        else
        {
          uint64_t v23 = NCLogForCategory(7uLL);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v43 = objc_msgSend_label(v12, v26, v27, v28);
            *(_DWORD *)buf = 136315394;
            uint64_t v50 = "-[NCWaypointManager _convertToNCWaypointList:]";
            __int16 v51 = 2112;
            long long v52 = v43;
            _os_log_error_impl(&dword_23759D000, v23, OS_LOG_TYPE_ERROR, "%s Waypoint has no UUID, ignoring (name = %@)", buf, 0x16u);
          }
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v29, (uint64_t)&v45, (uint64_t)v59, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)setClosestDataWaypoint:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((objc_msgSend_isEquivalentCellularWaypoint_(self->_closestDataWaypoint, v6, (uint64_t)v5, v7) & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = objc_msgSend_uuid(v5, v8, v9, v10);
      uint64_t v15 = objc_msgSend_location(v5, v12, v13, v14);
      objc_msgSend_altitude(v15, v16, v17, v18);
      uint64_t v20 = v19;
      uint64_t v21 = NCLogForCategory(8uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543874;
        uint64_t v29 = v11;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        __int16 v32 = 2048;
        uint64_t v33 = v20;
        _os_log_impl(&dword_23759D000, v21, OS_LOG_TYPE_DEFAULT, "Manager receiving update to closest data waypoint (%{public}@ at %@ ^ %.2fm).", (uint8_t *)&v28, 0x20u);
      }
    }
    else
    {
      uint64_t v11 = NCLogForCategory(8uLL);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        objc_storeStrong((id *)&self->_closestDataWaypoint, a3);
        objc_msgSend__publishCellularWaypointsUpdate(self, v25, v26, v27);
        goto LABEL_10;
      }
      uint64_t v15 = objc_msgSend_uuid(self->_closestDataWaypoint, v22, v23, v24);
      int v28 = 138543362;
      uint64_t v29 = v15;
      _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_DEFAULT, "Manager receiving update to clear closest data waypoint (%{public}@).", (uint8_t *)&v28, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)setClosestSOSWaypoint:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((objc_msgSend_isEquivalentCellularWaypoint_(self->_closestSOSWaypoint, v6, (uint64_t)v5, v7) & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = objc_msgSend_uuid(v5, v8, v9, v10);
      uint64_t v15 = objc_msgSend_location(v5, v12, v13, v14);
      objc_msgSend_altitude(v15, v16, v17, v18);
      uint64_t v20 = v19;
      uint64_t v21 = NCLogForCategory(8uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543874;
        uint64_t v29 = v11;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        __int16 v32 = 2048;
        uint64_t v33 = v20;
        _os_log_impl(&dword_23759D000, v21, OS_LOG_TYPE_DEFAULT, "Manager receiving update to closest sos waypoint (%{public}@ at %@ ^ %.2fm).", (uint8_t *)&v28, 0x20u);
      }
    }
    else
    {
      uint64_t v11 = NCLogForCategory(8uLL);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        objc_storeStrong((id *)&self->_closestSOSWaypoint, a3);
        objc_msgSend__publishCellularWaypointsUpdate(self, v25, v26, v27);
        goto LABEL_10;
      }
      uint64_t v15 = objc_msgSend_uuid(self->_closestSOSWaypoint, v22, v23, v24);
      int v28 = 138543362;
      uint64_t v29 = v15;
      _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_DEFAULT, "Manager receiving update to clear closest sos waypoint (%{public}@).", (uint8_t *)&v28, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)setRecentDataWaypoint:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((objc_msgSend_isEquivalentCellularWaypoint_(self->_recentDataWaypoint, v6, (uint64_t)v5, v7) & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = objc_msgSend_uuid(v5, v8, v9, v10);
      uint64_t v15 = objc_msgSend_location(v5, v12, v13, v14);
      objc_msgSend_altitude(v15, v16, v17, v18);
      uint64_t v20 = v19;
      uint64_t v21 = NCLogForCategory(8uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543874;
        uint64_t v29 = v11;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        __int16 v32 = 2048;
        uint64_t v33 = v20;
        _os_log_impl(&dword_23759D000, v21, OS_LOG_TYPE_DEFAULT, "Manager receiving update to recent data waypoint (%{public}@ at %@ ^ %.2fm).", (uint8_t *)&v28, 0x20u);
      }
    }
    else
    {
      uint64_t v11 = NCLogForCategory(8uLL);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        objc_storeStrong((id *)&self->_recentDataWaypoint, a3);
        objc_msgSend__publishCellularWaypointsUpdate(self, v25, v26, v27);
        goto LABEL_10;
      }
      uint64_t v15 = objc_msgSend_uuid(self->_recentDataWaypoint, v22, v23, v24);
      int v28 = 138543362;
      uint64_t v29 = v15;
      _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_DEFAULT, "Manager receiving update to clear recent data waypoint (%{public}@).", (uint8_t *)&v28, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend__logSystemWaypointsAnalytics(self, v8, v9, v10);
}

- (void)setRecentSOSWaypoint:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((objc_msgSend_isEquivalentCellularWaypoint_(self->_recentSOSWaypoint, v6, (uint64_t)v5, v7) & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = objc_msgSend_uuid(v5, v8, v9, v10);
      uint64_t v15 = objc_msgSend_location(v5, v12, v13, v14);
      objc_msgSend_altitude(v15, v16, v17, v18);
      uint64_t v20 = v19;
      uint64_t v21 = NCLogForCategory(8uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543874;
        uint64_t v29 = v11;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        __int16 v32 = 2048;
        uint64_t v33 = v20;
        _os_log_impl(&dword_23759D000, v21, OS_LOG_TYPE_DEFAULT, "Manager receiving update to recent sos waypoint (%{public}@ at %@ ^ %.2fm).", (uint8_t *)&v28, 0x20u);
      }
    }
    else
    {
      uint64_t v11 = NCLogForCategory(8uLL);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        objc_storeStrong((id *)&self->_recentSOSWaypoint, a3);
        objc_msgSend__publishCellularWaypointsUpdate(self, v25, v26, v27);
        goto LABEL_10;
      }
      uint64_t v15 = objc_msgSend_uuid(self->_recentSOSWaypoint, v22, v23, v24);
      int v28 = 138543362;
      uint64_t v29 = v15;
      _os_log_impl(&dword_23759D000, v11, OS_LOG_TYPE_DEFAULT, "Manager receiving update to clear recent sos waypoint. (%{public}@)", (uint8_t *)&v28, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend__logSystemWaypointsAnalytics(self, v8, v9, v10);
}

- (NSArray)cellularWaypoints
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v6 = objc_msgSend_array(MEMORY[0x263EFF980], v3, v4, v5);
  uint64_t v7 = self->_recentDataWaypoint;
  objc_msgSend_nc_safeAddObject_(v6, v8, (uint64_t)v7, v9);
  uint64_t v10 = self->_recentSOSWaypoint;
  uint64_t v13 = v10;
  if (v7) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (!v7 && v10) {
      goto LABEL_11;
    }
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    char isSignificantlyDifferentFrom = objc_msgSend_isSignificantlyDifferentFrom_(v10, v11, (uint64_t)v7, v12);
    if (isSignificantlyDifferentFrom)
    {
LABEL_11:
      objc_msgSend_addObject_(v6, v11, (uint64_t)v13, v12);
      goto LABEL_15;
    }
  }
  uint64_t v16 = NCLogForCategory(8uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v40) = 0;
    _os_log_impl(&dword_23759D000, v16, OS_LOG_TYPE_DEFAULT, "Recent SOS is being excluded.", (uint8_t *)&v40, 2u);
  }

LABEL_15:
  uint64_t v17 = self->_closestDataWaypoint;
  uint64_t v20 = v17;
  if (v7 && v17)
  {
    if (objc_msgSend_isSignificantlyDifferentFrom_(v17, v18, (uint64_t)v7, v19))
    {
      objc_msgSend_addObject_(v6, v21, (uint64_t)v20, v22);
      goto LABEL_23;
    }
  }
  else if (!v17)
  {
    goto LABEL_23;
  }
  uint64_t v23 = NCLogForCategory(8uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LOWORD(v40) = 0;
    _os_log_impl(&dword_23759D000, v23, OS_LOG_TYPE_INFO, "Closest Data is being excluded.", (uint8_t *)&v40, 2u);
  }

LABEL_23:
  uint64_t v24 = self->_closestSOSWaypoint;
  int v28 = v24;
  if (v13 && v24)
  {
    if (objc_msgSend_isSignificantlyDifferentFrom_(v24, v25, (uint64_t)v13, v27))
    {
      objc_msgSend_addObject_(v6, v29, (uint64_t)v28, v30);
      goto LABEL_31;
    }
  }
  else if (!v24)
  {
    goto LABEL_31;
  }
  __int16 v31 = NCLogForCategory(8uLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    LOWORD(v40) = 0;
    _os_log_impl(&dword_23759D000, v31, OS_LOG_TYPE_INFO, "Closest SOS is being excluded.", (uint8_t *)&v40, 2u);
  }

LABEL_31:
  uint64_t v32 = objc_msgSend_count(v6, v25, v26, v27);
  if (v32 != self->_lastCellularWaypointCount)
  {
    unint64_t v36 = v32;
    uint64_t v37 = NCLogForCategory(8uLL);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134217984;
      unint64_t v41 = v36;
      _os_log_impl(&dword_23759D000, v37, OS_LOG_TYPE_DEFAULT, "Showing %lu cellular waypoints.", (uint8_t *)&v40, 0xCu);
    }

    self->_lastCellularWaypointCount = v36;
  }
  uint64_t v38 = objc_msgSend_copy(v6, v33, v34, v35);

  return (NSArray *)v38;
}

- (void)_publishCellularWaypointsUpdate
{
  cellularWaypointsUpdatedHandle = (void (**)(id, SEL))self->_cellularWaypointsUpdatedHandle;
  if (cellularWaypointsUpdatedHandle) {
    cellularWaypointsUpdatedHandle[2](cellularWaypointsUpdatedHandle, a2);
  }

  objc_msgSend__postWaypointListChangedNotification(self, a2, v2, v3);
}

- (int64_t)numWaypointsMissingElevationOfType:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestForCountOfMissingElevationForWaypointsOfType_(NCWaypointFetchRequests, a2, a3, v3);
  int64_t CountItemsWithRequest = objc_msgSend__fetchCountItemsWithRequest_(self, v6, (uint64_t)v5, v7);

  return CountItemsWithRequest;
}

- (int64_t)numWaypointsInElevationTableOfType:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestForCountOfWaypointsInElevationTableOfType_(NCWaypointFetchRequests, a2, a3, v3);
  int64_t CountItemsWithRequest = objc_msgSend__fetchCountItemsWithRequest_(self, v6, (uint64_t)v5, v7);

  return CountItemsWithRequest;
}

- (void)_logSystemWaypointsAnalytics
{
  if (objc_msgSend_isEqualToString_(@"com.apple.NanoCompass.watchkitapp", a2, (uint64_t)self->_bundleIdentifier, v2))
  {
    uint64_t v7 = objc_msgSend_location(self->_parkedCarWaypoint, v4, v5, v6);

    recentDataWaypoint = self->_recentDataWaypoint;
    recentSOSWaypoint = self->_recentSOSWaypoint;
    id v10 = objc_alloc(MEMORY[0x263EFFA40]);
    id v30 = (id)objc_msgSend_initWithSuiteName_(v10, v11, @"com.apple.compass", v12);
    objc_msgSend_synchronize(v30, v13, v14, v15);
    uint64_t v19 = objc_msgSend_currentCalendar(MEMORY[0x263EFF8F0], v16, v17, v18);
    uint64_t v24 = objc_msgSend_objectForKey_(v30, v20, @"systemWaypointsAnalyticsLastLoggedDate", v21);
    if (!v24 || (objc_msgSend_isDateInToday_(v19, v22, (uint64_t)v24, v23) & 1) == 0) {
      objc_msgSend__submitSystemWaypointsAnalytics_(self, v22, 0, v23);
    }
    uint64_t v25 = objc_msgSend_integerForKey_(v30, v22, @"systemWaypointsAnalyticsLastLoggedWaypoints", v23);
    if ((unint64_t)recentDataWaypoint | v25 & 2) {
      uint64_t v28 = ((v7 | v25 & 1) != 0) | 2;
    }
    else {
      uint64_t v28 = (v7 | v25 & 1) != 0;
    }
    if ((unint64_t)recentSOSWaypoint | v25 & 4) {
      uint64_t v29 = v28 | 4;
    }
    else {
      uint64_t v29 = v28;
    }
    if (v25 != v29) {
      objc_msgSend__submitSystemWaypointsAnalytics_(self, v26, v29, v27);
    }
  }
}

- (void)_submitSystemWaypointsAnalytics:(unint64_t)a3
{
  objc_msgSend_now(MEMORY[0x263EFF910], a2, a3, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v8 = objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.compass", v7);
  objc_msgSend_setInteger_forKey_(v8, v9, a3, @"systemWaypointsAnalyticsLastLoggedWaypoints");
  objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v11, @"systemWaypointsAnalyticsLastLoggedDate");
  SendSystemWaypointAvailability(a3 & 1 | (((a3 >> 1) & 1) << 8) & 0xFFFFFFFFFFFEFFFFLL | (((a3 >> 2) & 1) << 16));
}

- (NCWaypoint)parkedCarWaypoint
{
  return self->_parkedCarWaypoint;
}

- (void)setParkedCarWaypoint:(id)a3
{
}

- (NCWaypoint)closestDataWaypoint
{
  return self->_closestDataWaypoint;
}

- (NCWaypoint)closestSOSWaypoint
{
  return self->_closestSOSWaypoint;
}

- (NCWaypoint)recentDataWaypoint
{
  return self->_recentDataWaypoint;
}

- (NCWaypoint)recentSOSWaypoint
{
  return self->_recentSOSWaypoint;
}

- (id)cellularWaypointsUpdatedHandle
{
  return self->_cellularWaypointsUpdatedHandle;
}

- (void)setCellularWaypointsUpdatedHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellularWaypointsUpdatedHandle, 0);
  objc_storeStrong((id *)&self->_recentSOSWaypoint, 0);
  objc_storeStrong((id *)&self->_recentDataWaypoint, 0);
  objc_storeStrong((id *)&self->_closestSOSWaypoint, 0);
  objc_storeStrong((id *)&self->_closestDataWaypoint, 0);
  objc_storeStrong((id *)&self->_parkedCarWaypoint, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
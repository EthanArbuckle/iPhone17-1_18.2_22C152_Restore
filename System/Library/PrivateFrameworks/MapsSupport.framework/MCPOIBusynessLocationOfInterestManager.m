@interface MCPOIBusynessLocationOfInterestManager
+ (MCPOIBusynessLocationOfInterestManager)sharedLocationOfInterestManagerInstance;
- (BOOL)isUserAtSuppressedLocationsOfInterest:(id)a3;
- (MCPOIBusynessLocationOfInterestManager)init;
- (id)suppressedLocationsOfInterestUUIDs;
- (void)_fetchLocationsOfInterest:(int64_t)a3 completionBlock:(id)a4;
- (void)fetchSuppressedLocationsOfInterestWithCompletionBlock:(id)a3;
@end

@implementation MCPOIBusynessLocationOfInterestManager

+ (MCPOIBusynessLocationOfInterestManager)sharedLocationOfInterestManagerInstance
{
  if (qword_1000239F0 != -1) {
    dispatch_once(&qword_1000239F0, &stru_10001C8F8);
  }
  v2 = (void *)qword_1000239E8;

  return (MCPOIBusynessLocationOfInterestManager *)v2;
}

- (MCPOIBusynessLocationOfInterestManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MCPOIBusynessLocationOfInterestManager;
  v2 = [(MCPOIBusynessLocationOfInterestManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.geocorrectiond.poibusynessloimanager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_fetchLocationsOfInterest:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  objc_super v7 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MCPOIBusynessLOIManager: fetching lois of type %d", buf, 8u);
  }

  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000642C;
  v10[3] = &unk_10001C948;
  id v11 = v6;
  int64_t v12 = a3;
  id v9 = v6;
  dispatch_async(dispatchQueue, v10);
}

- (void)fetchSuppressedLocationsOfInterestWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)geo_isolater_create();
  id v6 = +[NSMutableArray array];
  dispatch_group_t v7 = dispatch_group_create();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000678C;
  v20[3] = &unk_10001C970;
  id v8 = v5;
  id v21 = v8;
  id v9 = v6;
  id v22 = v9;
  v10 = v7;
  v23 = v10;
  id v11 = objc_retainBlock(v20);
  for (uint64_t i = 0; i != 3; ++i)
  {
    dispatch_group_enter(v10);
    [(MCPOIBusynessLocationOfInterestManager *)self _fetchLocationsOfInterest:qword_100014BA8[i] completionBlock:v11];
  }
  dispatchQueue = self->_dispatchQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100006850;
  v16[3] = &unk_10001C8D8;
  id v17 = v9;
  v18 = self;
  id v19 = v4;
  id v14 = v4;
  id v15 = v9;
  dispatch_group_notify(v10, dispatchQueue, v16);
}

- (id)suppressedLocationsOfInterestUUIDs
{
  v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_suppressedLocationsOfInterest count]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_suppressedLocationsOfInterest;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
        [v3 addObject:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isUserAtSuppressedLocationsOfInterest:(id)a3
{
  id v4 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = self->_suppressedLocationsOfInterest;
  id v42 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v44;
    *(void *)&long long v5 = 134283777;
    long long v39 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v42; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "location", v39);
        [v8 latitude];
        CLLocationDegrees v10 = v9;
        long long v11 = [v7 location];
        [v11 longitude];
        CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v10, v12);

        id v14 = objc_alloc((Class)CLLocation);
        id v15 = [v7 location];
        [v15 altitude];
        double v17 = v16;
        v18 = [v7 location];
        [v18 horizontalUncertainty];
        double v20 = v19;
        id v21 = [v7 location];
        [v21 verticalUncertainty];
        double v23 = v22;
        v24 = [v7 location];
        v25 = [v24 date];
        v26 = [v7 location];
        id v27 = objc_msgSend(v14, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v25, objc_msgSend(v26, "referenceFrame"), v13.latitude, v13.longitude, v17, v20, v23);

        [v27 distanceFromLocation:v4];
        double v29 = v28;
        [v27 horizontalAccuracy];
        double v31 = v30;
        [v4 horizontalAccuracy];
        double v33 = v31 + v32;
        v34 = GEOGetPOIBusynessLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v39;
          double v48 = v29;
          __int16 v49 = 2049;
          double v50 = v33;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "MCPOIBusynessLOIManager: distance: %{private}f accuracy: %{private}f", buf, 0x16u);
        }

        if (v29 <= v33)
        {
          BOOL v35 = 1;
          goto LABEL_13;
        }
      }
      id v42 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v42) {
        continue;
      }
      break;
    }
  }
  BOOL v35 = 0;
LABEL_13:

  v36 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = "NO";
    if (v35) {
      v37 = "YES";
    }
    *(_DWORD *)buf = 136380675;
    double v48 = *(double *)&v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "MCPOIBusynessLOIManager: isUserAtSuppressedLocationsOfInterest : %{private}s", buf, 0xCu);
  }

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_suppressedLocationsOfInterest, 0);
}

@end
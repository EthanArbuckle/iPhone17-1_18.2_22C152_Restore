@interface NavdDoomGEORoutesUpdater
- (BOOL)updateRoutesForDestinations:(id)a3 withOrigin:(id)a4 completionHandler:(id)a5;
- (BOOL)updateRoutesForTestDestinationsWithCompletionHandler:(id)a3;
- (NSString)uniqueName;
- (NavdDoomGEORoutesUpdater)init;
- (NavdDoomGEORoutesUpdater)initWithRoutesManager:(id)a3;
- (id)_entryWithTitle:(id)a3 coordinate:(id)a4;
- (id)_incidentsFromDirectionsResponse:(id)a3 destination:(id)a4;
- (void)forEachObserver:(id)a3;
- (void)notifyObserversOfRouteRequest;
- (void)registerObserver:(id)a3;
@end

@implementation NavdDoomGEORoutesUpdater

- (NavdDoomGEORoutesUpdater)initWithRoutesManager:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NavdDoomGEORoutesUpdater;
  v6 = [(NavdDoomGEORoutesUpdater *)&v20 init];
  v7 = v6;
  if (v6)
  {
    p_routesManager = (void **)&v6->_routesManager;
    objc_storeStrong((id *)&v6->_routesManager, a3);
    if (!v7->_routesManager)
    {
      v9 = objc_alloc_init(NavdDoomCachingGEORoutesManager);
      v10 = *p_routesManager;
      *p_routesManager = v9;
    }
    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("NavdDoomGEORoutesUpdaterObservers", v13);
    observerQueue = v7->_observerQueue;
    v7->_observerQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("NavdDoomGEORoutesUpdaterRequests", v16);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (OS_dispatch_queue *)v17;
  }
  return v7;
}

- (NavdDoomGEORoutesUpdater)init
{
  return [(NavdDoomGEORoutesUpdater *)self initWithRoutesManager:0];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)forEachObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observerQueue = self->_observerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000585B4;
    v7[3] = &unk_100089158;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(observerQueue, v7);
  }
}

- (void)notifyObserversOfRouteRequest
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000587B8;
  v3[3] = &unk_10008C6B0;
  objc_copyWeak(&v4, &location);
  [(NavdDoomGEORoutesUpdater *)self forEachObserver:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)updateRoutesForDestinations:(id)a3 withOrigin:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v38 = a4;
  id v9 = a5;
  v35 = v9;
  v36 = v8;
  if (!v8)
  {
    v33 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesUpdater.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 114;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdDoomGEORoutesUpdater updateRoutesForDestinations:withOrigin:completionHandler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (destinations)";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires destinations", buf, 0x26u);
    }

    goto LABEL_31;
  }
  BOOL v10 = v9 == 0;
  uint64_t v11 = GEOFindOrCreateLog();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesUpdater.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 115;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdDoomGEORoutesUpdater updateRoutesForDestinations:withOrigin:completionHandler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (completionHandler)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

LABEL_31:
    BOOL v32 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = [(NavdDoomGEORoutesUpdater *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "updateRoutes";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  dispatch_queue_t v14 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateRoutes", "", buf, 2u);
  }

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100058FC4;
  *(void *)&buf[32] = sub_100058FD4;
  id v67 = 0;
  v15 = (NSMutableDictionary *)objc_opt_new();
  routesPerDestination = self->_routesPerDestination;
  self->_routesPerDestination = v15;

  dispatch_queue_t v17 = (NSMutableSet *)objc_opt_new();
  allIncidents = self->_allIncidents;
  self->_allIncidents = v17;

  objc_initWeak(&location, self);
  v19 = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v36;
  id v20 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v53;
LABEL_9:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v53 != v21) {
        objc_enumerationMutation(obj);
      }
      if (!*((unsigned char *)v58 + 24)) {
        break;
      }
      uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * v22);
      dispatch_group_enter(v19);
      routesManager = self->_routesManager;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100058FDC;
      v44[3] = &unk_10008C700;
      v49 = buf;
      v50 = &v57;
      id v45 = v38;
      objc_copyWeak(&v51, &location);
      v25 = v19;
      v46 = v25;
      v47 = self;
      uint64_t v48 = v23;
      if (([(NavdDoomRoutesManager *)routesManager requestWaypointForMapsSuggestionsEntry:v23 completionHandler:v44] & 1) == 0)
      {
        v26 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v61 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Request to resolve waypoint from entry failed", v61, 2u);
        }

        *((unsigned char *)v58 + 24) = 0;
        dispatch_group_leave(v25);
      }
      BOOL v27 = *((unsigned char *)v58 + 24) == 0;

      objc_destroyWeak(&v51);
      if (v27) {
        break;
      }
      if (v20 == (id)++v22)
      {
        id v20 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
        if (v20) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  requestQueue = self->_requestQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059C90;
  block[3] = &unk_10008C728;
  objc_copyWeak(&v43, &location);
  id v40 = v35;
  v41 = &v57;
  v42 = buf;
  dispatch_group_notify(v19, requestQueue, block);
  GEOFindOrCreateLog();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = [(NavdDoomGEORoutesUpdater *)self uniqueName];
    *(_DWORD *)v61 = 138412546;
    v62 = v30;
    __int16 v63 = 2080;
    v64 = "updateRoutes";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v61, 0x16u);
  }
  v31 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)v61 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateRoutes", "", v61, 2u);
  }

  BOOL v32 = *((unsigned char *)v58 + 24) != 0;
  objc_destroyWeak(&v43);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v57, 8);
LABEL_32:

  return v32;
}

- (id)_incidentsFromDirectionsResponse:(id)a3 destination:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "incidentsOnRoutesCount"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [v5 incidentsOnRoutes];
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = MapsSuggestionsNow();
        GEOConfigGetDouble();
        dispatch_queue_t v14 = objc_msgSend(v13, "dateByAddingTimeInterval:");

        v15 = [NavdDoomIncident alloc];
        v16 = [v12 incidentId];
        dispatch_queue_t v17 = [v6 uniqueIdentifier];
        v18 = [(NavdDoomIncident *)v15 initWithUniqueID:v16 destinationID:v17 expiryDate:v14];

        [v7 addObject:v18];
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v9);
  }

  v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [v7 count];
    *(_DWORD *)buf = 134218242;
    id v29 = v20;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Found %lu incidents on route: %@", buf, 0x16u);
  }

  id v21 = [v7 copy];

  return v21;
}

- (BOOL)updateRoutesForTestDestinationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NavdDoomGEORoutesUpdater *)self _entryWithTitle:@"Work", 37.3908, -122.0309 coordinate];
  id v6 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", 37.323488, -121.83988);
  id v9 = v5;
  id v7 = +[NSArray arrayWithObjects:&v9 count:1];
  LOBYTE(self) = [(NavdDoomGEORoutesUpdater *)self updateRoutesForDestinations:v7 withOrigin:v6 completionHandler:v4];

  return (char)self;
}

- (id)_entryWithTitle:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v6 = a3;
  if ([v6 isEqualToString:@"Home"]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v15[1] = @"MapsSuggestionsCoreRoutinePK";
  v16[0] = @"MapsSuggestionsCoreRoutinePK";
  v15[0] = @"MapsSuggestionsPrimaryKey";
  id v8 = +[NSUUID UUID];
  id v9 = [v8 UUIDString];
  v16[1] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  uint64_t v11 = +[MapsSuggestionsEntry entryWithType:v7 title:v6 subtitle:&stru_10008D5E8 weight:0 expires:v10 sourceSpecificInfo:0.45];

  v12 = +[NSNumber numberWithDouble:var0];
  [v11 setNumber:v12 forKey:@"MapsSuggestionsLatitudeKey"];

  v13 = +[NSNumber numberWithDouble:var1];
  [v11 setNumber:v13 forKey:@"MapsSuggestionsLongitudeKey"];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIncidents, 0);
  objc_storeStrong((id *)&self->_routesPerDestination, 0);
  objc_storeStrong((id *)&self->_currentLocationOverride, 0);
  objc_storeStrong((id *)&self->_routeRequestAttributes, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_routesManager, 0);
}

@end
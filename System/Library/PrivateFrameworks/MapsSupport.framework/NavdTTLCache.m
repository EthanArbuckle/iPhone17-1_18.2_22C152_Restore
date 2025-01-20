@interface NavdTTLCache
- (NavdTTLCache)init;
- (NavdTTLCache)initWithCacheOperationQueue:(id)a3 localProxy:(id)a4;
- (double)nextRefreshTimeStamp;
- (id)descriptionOfAllEntries;
- (id)entryAtIndex:(unint64_t)a3;
- (id)findEntryForKey:(id)a3;
- (id)loadEntryForRowId:(int64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_resolvedMapItem:(id)a3 error:(id)a4 forPendingCacheEntry:(id)a5 uuid:(id)a6 osTransaction:(id)a7 clientInfo:(id)a8;
- (void)_resolvedMapItem:(id)a3 toOnlyPerformLocalUpdatesForPlannedDestination:(id)a4 client:(id)a5 osTransaction:(id)a6;
- (void)_resolvedMapItem:(id)a3 toPostUINotification:(unint64_t)a4 forDestination:(id)a5 client:(id)a6 osTransaction:(id)a7;
- (void)_resolvedMapItem:(id)a3 toRefreshPlannedDestination:(id)a4 client:(id)a5 osTransaction:(id)a6;
- (void)_resolvedMapItem:(id)a3 toStopMonitoringPlannedDestination:(id)a4 clientInfo:(id)a5 uuid:(id)a6 osTransaction:(id)a7;
- (void)_resolvedOriginWaypoint:(id)a3 originWaypointError:(id)a4 destinationWaypoint:(id)a5 destinationWaypointError:(id)a6 forKey:(id)a7 pendingCacheEntry:(id)a8 osTransaction:(id)a9 clientInfo:(id)a10;
- (void)callHandlers:(id)a3 withHypothesis:(id)a4;
- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 client:(id)a5 osTransaction:(id)a6;
- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4 osTransaction:(id)a5;
- (void)removeEntry:(id)a3 withKey:(id)a4 value:(id)a5;
- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4 osTransaction:(id)a5;
- (void)saveValue:(id)a3 forKey:(id)a4;
- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3;
- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 osTransaction:(id)a6 handler:(id)a7;
- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 osTransaction:(id)a6;
@end

@implementation NavdTTLCache

- (NavdTTLCache)initWithCacheOperationQueue:(id)a3 localProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NavdTTLCache;
  v9 = [(NavdTTLCache *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheOperationQueue, a3);
    v11 = (GEORouteHypothesisCache *)objc_alloc_init((Class)GEORouteHypothesisCache);
    cache = v10->_cache;
    v10->_cache = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingEntriesByKey = v10->_pendingEntriesByKey;
    v10->_pendingEntriesByKey = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    entries = v10->_entries;
    v10->_entries = v15;

    objc_storeWeak((id *)&v10->_localProxy, v8);
    v10->_shouldPostDarwinNotificationForNextUpdate = 0;
    v17 = v10->_cache;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100008DF8;
    v22[3] = &unk_100088F08;
    v18 = v10;
    v23 = v18;
    [(GEORouteHypothesisCache *)v17 enumerateAllForCacheEntriesWithHandler:v22];
    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingStopUUIDs = v18->_pendingStopUUIDs;
    v18->_pendingStopUUIDs = v19;
  }
  return v10;
}

- (NavdTTLCache)init
{
  return 0;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_entries count];
}

- (id)entryAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_entries objectAtIndex:a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return [(NSMutableArray *)self->_entries objectAtIndex:a3];
}

- (id)descriptionOfAllEntries
{
  return [(GEORouteHypothesisCache *)self->_cache descriptionOfAllEntries];
}

- (id)findEntryForKey:(id)a3
{
  v4 = [(GEORouteHypothesisCache *)self->_cache loadValueForKey:a3];
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_entries;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "rowId", (void)v15);
          if (v11 == [v4 rowId])
          {
            id v13 = v10;
            goto LABEL_14;
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    GEOFindOrCreateLog();
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v4 rowId];
      *(_DWORD *)buf = 134217984;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, &v5->super.super, OS_LOG_TYPE_ERROR, "Found a value (with rowId %lld) but didn't find an entry for it!", buf, 0xCu);
    }
    id v13 = 0;
LABEL_14:
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = @"no";
    if (v3) {
      CFStringRef v6 = @"yes";
    }
    int v7 = 138477827;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_shouldPostDarwinNotificationForNextUpdate set to: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  self->_shouldPostDarwinNotificationForNextUpdate = v3;
}

- (double)nextRefreshTimeStamp
{
  [(GEORouteHypothesisCache *)self->_cache nextRefreshTimeStamp];
  return result;
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 osTransaction:(id)a6 handler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  long long v17 = [[NavdPendingTTLCacheEntry alloc] initWithDestination:v16 forClient:v12 uuid:v13 handler:v15 cacheOperationQueue:self->_cacheOperationQueue navdCache:self];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000092BC;
  v21[3] = &unk_100088F30;
  v21[4] = self;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  id v18 = v12;
  id v19 = v14;
  id v20 = v13;
  [(NavdPendingTTLCacheEntry *)v17 resolveMapItem:v21];
}

- (void)_resolvedMapItem:(id)a3 error:(id)a4 forPendingCacheEntry:(id)a5 uuid:(id)a6 osTransaction:(id)a7 clientInfo:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    id v21 = objc_alloc_init((Class)GEORouteHypothesis);
    [v21 _setError:v15];
    id v22 = [v16 clientInfoStates];
    [(NavdTTLCache *)self callHandlers:v22 withHypothesis:v21];

    goto LABEL_18;
  }
  if (![(NSMutableSet *)self->_pendingStopUUIDs containsObject:v17])
  {
    v43 = v18;
    id v23 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14];
    [v16 setDestinationLocation:v23];

    id v24 = objc_alloc((Class)GEORouteHypothesisKey);
    v25 = [v16 request];
    id v26 = [v24 initWithRouteHypothesisRequest:v25];

    v27 = [(NavdTTLCache *)self findEntryForKey:v26];
    v28 = v27;
    if (v27)
    {
      [v27 subsumePendingEntry:v16];
      v29 = -[NavdTTLCache loadEntryForRowId:](self, "loadEntryForRowId:", [v28 rowId]);
      v42 = [v29 objectAtIndexedSubscript:1];
      uint64_t v30 = [v42 currentHypothesis];
      v31 = (void *)v30;
      if (v30)
      {
        v40 = (void *)v30;
        id v41 = v26;
        v32 = +[NavdLocationLeecher sharedLeecher];
        v33 = [v32 lastLeechedLocation];

        if (v33)
        {
          objc_msgSend(v33, "course", v33);
          v34 = +[GEOLocation locationWithCLLocation:course:](GEOLocation, "locationWithCLLocation:course:", v33);
          v35 = [v42 monitor];
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_100009740;
          v49[3] = &unk_100088F58;
          v49[4] = self;
          id v50 = v16;
          [v35 updateLocation:v34 allowServer:0 hypothesisHandler:v49];

          v31 = v40;
        }
        else
        {
          v37 = objc_msgSend(v16, "clientInfoStates", 0);
          v31 = v40;
          [(NavdTTLCache *)self callHandlers:v37 withHypothesis:v40];
        }
        id v26 = v41;
      }

      v38 = v42;
    }
    else
    {
      v36 = [(NSMutableDictionary *)self->_pendingEntriesByKey objectForKeyedSubscript:v26];
      v29 = v36;
      if (v36)
      {
        [v36 subsumePendingCacheEntry:v16];
LABEL_17:

        id v18 = v43;
        goto LABEL_18;
      }
      [(NSMutableDictionary *)self->_pendingEntriesByKey setObject:v16 forKeyedSubscript:v26];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000097B0;
      v44[3] = &unk_100088F80;
      v44[4] = self;
      id v45 = v26;
      id v46 = v16;
      id v47 = v43;
      id v48 = v19;
      [v46 findWaypointsForKey:v45 handler:v44];

      v38 = v45;
    }

    goto LABEL_17;
  }
  id v20 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v52 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Resolved map item but found pending stop for uuid %{private}@, stopping.", buf, 0xCu);
  }

  [(NSMutableSet *)self->_pendingStopUUIDs removeObject:v17];
LABEL_18:
}

- (void)_resolvedOriginWaypoint:(id)a3 originWaypointError:(id)a4 destinationWaypoint:(id)a5 destinationWaypointError:(id)a6 forKey:(id)a7 pendingCacheEntry:(id)a8 osTransaction:(id)a9 clientInfo:(id)a10
{
  v76 = (NSMutableSet *)a3;
  unint64_t v16 = (unint64_t)a4;
  id v17 = a5;
  unint64_t v18 = (unint64_t)a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!(v16 | v18))
  {
    id v75 = v17;
    if ([(NSMutableSet *)self->_pendingStopUUIDs count])
    {
      [v20 removePendingStops:self->_pendingStopUUIDs];
      uint64_t v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        pendingStopUUIDs = self->_pendingStopUUIDs;
        *(_DWORD *)buf = 138477827;
        v79 = pendingStopUUIDs;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Removed pendingStopUUIDs: %{private}@", buf, 0xCu);
      }

      [(NSMutableSet *)self->_pendingStopUUIDs removeAllObjects];
    }
    v32 = [v20 clientInfoStates];
    id v33 = [v32 count];

    if (!v33)
    {
      v27 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "There are no handlers left, stopping.", buf, 2u);
      }
      goto LABEL_26;
    }
    id v70 = v21;
    unint64_t v71 = v18;
    v72 = self;
    unint64_t v73 = v16;
    v34 = [v19 request];
    id v35 = [v34 transportType];
    v36 = [v19 request];
    [v36 arrivalDate];
    v37 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v38 = +[GEORouteHypothesisMonitor routeAttributesForTransportType:v35 withArrivalDate:v37];

    id v39 = objc_alloc((Class)MNRouteAttributes);
    id v74 = v22;
    v77[0] = v76;
    v77[1] = v17;
    id v40 = v20;
    id v41 = +[NSArray arrayWithObjects:v77 count:2];
    v69 = v38;
    id v42 = [v39 initWithAttributes:v38 waypoints:v41];

    id v66 = objc_alloc((Class)GEORouteHypothesisValue);
    v43 = [v19 request];
    [v43 arrivalDate];
    v44 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v67 = v19;
    id v45 = v19;
    id v46 = v40;
    id v47 = [v45 request];
    [v47 expirationDate];
    id v48 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v49 = [v46 traceName];
    id v50 = +[GEOMapService sharedService];
    v51 = objc_msgSend(v50, "navd_defaultTraitsForNavd");
    v68 = v42;
    id v52 = [v66 initWithSource:v76 toDestination:v75 arrivalDate:v44 expirationDate:v48 traceName:v49 traits:v51 routeAttributes:v42 clientInfo:v74];

    [v52 setValueRefreshTimeStamp:CFAbsoluteTimeGetCurrent()];
    if ([v52 canBePersistedToDisk])
    {
      id v20 = v46;
      self = v72;
      id v19 = v67;
      [(GEORouteHypothesisCache *)v72->_cache saveValue:v52 forKey:v67];
      id v21 = v70;
      if ([v52 rowId] == (id)-1)
      {
        v55 = (NavdTTLCacheEntry *)objc_alloc_init((Class)GEORouteHypothesis);
        id v63 = objc_alloc((Class)NSError);
        v64 = GEOErrorDomain();
        id WeakRetained = [v63 initWithDomain:v64 code:-1501 userInfo:0];

        [(NavdTTLCacheEntry *)v55 _setError:WeakRetained];
        v65 = [v20 clientInfoStates];
        [(NavdTTLCache *)v72 callHandlers:v65 withHypothesis:v55];
      }
      else
      {
        v53 = [NavdTTLCacheEntry alloc];
        id v54 = [v52 rowId];
        [v52 valueRefreshTimeStamp];
        v55 = -[NavdTTLCacheEntry initWithRowId:refreshTimestamp:state:cacheOperationQueue:cache:](v53, "initWithRowId:refreshTimestamp:state:cacheOperationQueue:cache:", v54, 0, v72->_cacheOperationQueue, v72);
        v56 = [v20 traceName];
        [(NavdTTLCacheEntry *)v55 setTraceName:v56];

        [(NavdTTLCacheEntry *)v55 subsumePendingEntry:v20];
        [(NSMutableArray *)v72->_entries addObject:v55];
        id WeakRetained = objc_loadWeakRetained((id *)&v72->_localProxy);
        [WeakRetained _refreshCacheEntriesIfNeededOrForced:0 osTransaction:v70];
      }
      id v22 = v74;
      v27 = v69;
    }
    else
    {
      v58 = [v46 clientInfoStates];
      id v59 = [v58 count];

      self = v72;
      id v20 = v46;
      id v19 = v67;
      v27 = v69;
      id v21 = v70;
      id v22 = v74;
      if (!v59)
      {
LABEL_25:

        unint64_t v16 = v73;
        id v17 = v75;
        unint64_t v18 = v71;
LABEL_26:

        goto LABEL_27;
      }
      v55 = (NavdTTLCacheEntry *)objc_alloc_init((Class)GEORouteHypothesis);
      id v60 = objc_alloc((Class)NSError);
      v61 = GEOErrorDomain();
      id WeakRetained = [v60 initWithDomain:v61 code:-1501 userInfo:0];

      [(NavdTTLCacheEntry *)v55 _setError:WeakRetained];
      v62 = [v20 clientInfoStates];
      [(NavdTTLCache *)v72 callHandlers:v62 withHypothesis:v55];
    }
    goto LABEL_25;
  }
  id v23 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    v79 = v76;
    __int16 v80 = 2114;
    unint64_t v81 = v16;
    __int16 v82 = 2114;
    id v83 = v17;
    __int16 v84 = 2114;
    unint64_t v85 = v18;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to get a waypoints. OriginWaypoint: %{public}@, OriginWaypointError: %{public}@, DestinationWaypoint: %{public}@, Destination Waypoint Error: %{public}@", buf, 0x2Au);
  }

  id v24 = [v20 clientInfoStates];
  id v25 = [v24 count];

  if (v25)
  {
    id v26 = objc_alloc_init((Class)GEORouteHypothesis);
    v27 = v26;
    if (v16) {
      unint64_t v28 = v16;
    }
    else {
      unint64_t v28 = v18;
    }
    [v26 _setError:v28];
    v29 = [v20 clientInfoStates];
    [(NavdTTLCache *)self callHandlers:v29 withHypothesis:v27];

    goto LABEL_26;
  }
LABEL_27:
  [(NSMutableDictionary *)self->_pendingEntriesByKey removeObjectForKey:v19];
}

- (void)_resolvedMapItem:(id)a3 toRefreshPlannedDestination:(id)a4 client:(id)a5 osTransaction:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    id v10 = a4;
    id v11 = a3;
    id v12 = objc_alloc_init((Class)GEORouteHypothesisRequest);
    objc_msgSend(v12, "setTransportType:", objc_msgSend(v10, "transportType"));
    id v13 = [v10 arrivalDate];

    [v13 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setArrivalDate:");

    id v14 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v11];

    [v12 setDestinationLocation:v14];
    id v15 = [objc_alloc((Class)GEORouteHypothesisKey) initWithRouteHypothesisRequest:v12];
    unint64_t v16 = [(NavdTTLCache *)self findEntryForKey:v15];
    if (v16)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_localProxy);
      [WeakRetained _refreshCacheEntriesIfNeededOrForced:0 osTransaction:v9];
    }
    else
    {
      id WeakRetained = GEOFindOrCreateLog();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138477827;
        id v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "No entry found with key: %{private}@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4 osTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[GEOMapService sharedService];
  id v12 = [v8 handle];
  id v13 = +[GEOMapService sharedService];
  id v14 = objc_msgSend(v13, "navd_defaultTraitsForNavd");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A1E0;
  v18[3] = &unk_100088FD0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v11 resolveMapItemFromHandle:v12 withTraits:v14 useCache:1 coordinateOnlyRefinement:1 completionHandler:v18];
}

- (void)_resolvedMapItem:(id)a3 toOnlyPerformLocalUpdatesForPlannedDestination:(id)a4 client:(id)a5 osTransaction:(id)a6
{
  id v19 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)GEORouteHypothesisRequest);
  objc_msgSend(v11, "setTransportType:", objc_msgSend(v9, "transportType"));
  id v12 = [v9 arrivalDate];

  [v12 timeIntervalSinceReferenceDate];
  objc_msgSend(v11, "setArrivalDate:");

  id v13 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v10];

  [v11 setDestinationLocation:v13];
  id v14 = [objc_alloc((Class)GEORouteHypothesisKey) initWithRouteHypothesisRequest:v11];
  id v15 = [(NavdTTLCache *)self findEntryForKey:v14];
  id v16 = v15;
  if (v15)
  {
    [v15 setLocalUpdatesOnlyForClientInfo:v19];
  }
  else
  {
    id v17 = [(NSMutableDictionary *)self->_pendingEntriesByKey objectForKeyedSubscript:v14];
    int v18 = v17;
    if (v17) {
      [v17 setLocalUpdatesOnlyForClientInfo:v19];
    }
  }
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4 osTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[GEOMapService sharedService];
  id v12 = [v8 handle];
  id v13 = +[GEOMapService sharedService];
  id v14 = objc_msgSend(v13, "navd_defaultTraitsForNavd");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A5A4;
  v18[3] = &unk_100088FD0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v11 resolveMapItemFromHandle:v12 withTraits:v14 useCache:1 coordinateOnlyRefinement:1 completionHandler:v18];
}

- (void)_resolvedMapItem:(id)a3 toStopMonitoringPlannedDestination:(id)a4 clientInfo:(id)a5 uuid:(id)a6 osTransaction:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v33 = a5;
  id v14 = a6;
  id v32 = a7;
  id v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    *(void *)&uint8_t buf[4] = v13;
    __int16 v37 = 2113;
    id v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Resolved Map Item to Stop Monitoring Destination %{private}@ with uuid %{private}@", buf, 0x16u);
  }

  if (v12)
  {
    id v16 = objc_alloc_init((Class)GEORouteHypothesisRequest);
    objc_msgSend(v16, "setTransportType:", objc_msgSend(v13, "transportType", v32));
    id v17 = [v13 arrivalDate];
    [v17 timeIntervalSinceReferenceDate];
    objc_msgSend(v16, "setArrivalDate:");

    int v18 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v12];
    [v16 setDestinationLocation:v18];

    id v19 = [objc_alloc((Class)GEORouteHypothesisKey) initWithRouteHypothesisRequest:v16];
    id v20 = [(NavdTTLCache *)self findEntryForKey:v19];
    id v21 = v20;
    if (v20)
    {
      unsigned __int8 v22 = [v20 hasHandlerForClientInfo:v33];
      id v23 = GEOFindOrCreateLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (v22)
      {
        if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Entry found, removing handler", buf, 2u);
        }

        if (v33) {
          [v21 removeHandlerForClientInfo:v33];
        }
        id v25 = [(GEORouteHypothesisCache *)self->_cache loadValueForKey:v19];
        if (![v21 handlerCount])
        {
          id v26 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "No handlers remain, removing entry", buf, 2u);
          }

          [(NavdTTLCache *)self removeEntry:v21 withKey:v19 value:v25];
        }

LABEL_22:
        goto LABEL_23;
      }
      if (!v24)
      {
LABEL_20:

        if (v14)
        {
          [(NSMutableSet *)self->_pendingStopUUIDs addObject:v14];
          *(void *)buf = 0;
          unint64_t v28 = +[GEONavdDefaults sharedInstance];
          [v28 pendingStopTimeToLive];
          dispatch_time_t v30 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));

          v31 = dispatch_get_global_queue(17, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000AB20;
          block[3] = &unk_100089020;
          block[4] = self;
          objc_copyWeak(&v35, (id *)buf);
          dispatch_after(v30, v31, block);

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v14;
      v27 = "Found cache entry but our handle wasn't on it so adding uuid %{private}@ to list of pending stops.";
    }
    else
    {
      id v23 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v14;
      v27 = "No cache entry found, adding uuid %{private}@ to list of pending stops.";
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, v27, buf, 0xCu);
    goto LABEL_20;
  }
LABEL_23:
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 osTransaction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[GEOMapService sharedService];
  id v15 = [v10 handle];
  id v16 = +[GEOMapService sharedService];
  id v17 = objc_msgSend(v16, "navd_defaultTraitsForNavd");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000AE40;
  v22[3] = &unk_100089070;
  void v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  [v14 resolveMapItemFromHandle:v15 withTraits:v17 useCache:1 coordinateOnlyRefinement:1 completionHandler:v22];
}

- (void)_resolvedMapItem:(id)a3 toPostUINotification:(unint64_t)a4 forDestination:(id)a5 client:(id)a6 osTransaction:(id)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138477827;
    id v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Resolved Map Item to Post UI Notification For Destination %{private}@", (uint8_t *)&v18, 0xCu);
  }

  if (v10)
  {
    id v13 = objc_alloc_init((Class)GEORouteHypothesisRequest);
    objc_msgSend(v13, "setTransportType:", objc_msgSend(v11, "transportType"));
    id v14 = [v11 arrivalDate];
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(v13, "setArrivalDate:");

    id v15 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v10];
    [v13 setDestinationLocation:v15];

    id v16 = [objc_alloc((Class)GEORouteHypothesisKey) initWithRouteHypothesisRequest:v13];
    id v17 = [(NavdTTLCache *)self findEntryForKey:v16];
    [v17 clientDisplayedUINotification:a4];
  }
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 client:(id)a5 osTransaction:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init((Class)GEORouteHypothesisRequest);
  objc_msgSend(v13, "setTransportType:", objc_msgSend(v10, "transportType"));
  id v14 = [v10 arrivalDate];
  [v14 timeIntervalSinceReferenceDate];
  objc_msgSend(v13, "setArrivalDate:");

  id v15 = +[GEOMapService sharedService];
  id v16 = [v10 handle];
  id v17 = +[GEOMapService sharedService];
  int v18 = objc_msgSend(v17, "navd_defaultTraitsForNavd");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000B2AC;
  v22[3] = &unk_1000890C0;
  id v25 = v12;
  unint64_t v26 = a3;
  void v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  [v15 resolveMapItemFromHandle:v16 withTraits:v18 useCache:1 coordinateOnlyRefinement:1 completionHandler:v22];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_entries countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)loadEntryForRowId:(int64_t)a3
{
  return [(GEORouteHypothesisCache *)self->_cache loadEntryForRowId:a3];
}

- (void)saveValue:(id)a3 forKey:(id)a4
{
}

- (void)removeEntry:(id)a3 withKey:(id)a4 value:(id)a5
{
  cache = self->_cache;
  id v9 = a3;
  [(GEORouteHypothesisCache *)cache removeKey:a4 value:a5];
  [(NSMutableArray *)self->_entries removeObject:v9];
}

- (void)callHandlers:(id)a3 withHypothesis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 error];
  if (v8)
  {
  }
  else if (self->_shouldPostDarwinNotificationForNextUpdate)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Sending wake up notification to all clients", buf, 2u);
    }

    self->_shouldPostDarwinNotificationForNextUpdate = 0;
    notify_post("com.apple.navd.wakeUpForHypothesisUpdate");
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B56C;
  v11[3] = &unk_1000890E8;
  id v12 = v7;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingStopUUIDs, 0);
  objc_destroyWeak((id *)&self->_localProxy);
  objc_storeStrong((id *)&self->_cacheOperationQueue, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_pendingEntriesByKey, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end
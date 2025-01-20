@interface NavdDoomGEORoutesManager
- (BOOL)requestRouteFrom:(id)a3 to:(id)a4 completionHandler:(id)a5;
- (BOOL)requestRouteFrom:(id)a3 to:(id)a4 routeCache:(id)a5 completionHandler:(id)a6;
- (BOOL)requestWaypointForMapsSuggestionsEntry:(id)a3 completionHandler:(id)a4;
- (id)_routeAttributes;
- (id)_traits;
- (void)dealloc;
@end

@implementation NavdDoomGEORoutesManager

- (void)dealloc
{
  [(GEODirectionsServiceRequest *)self->_routeRequestTicket cancel];
  v3.receiver = self;
  v3.super_class = (Class)NavdDoomGEORoutesManager;
  [(NavdDoomGEORoutesManager *)&v3 dealloc];
}

- (BOOL)requestRouteFrom:(id)a3 to:(id)a4 completionHandler:(id)a5
{
  return [(NavdDoomGEORoutesManager *)self requestRouteFrom:a3 to:a4 routeCache:0 completionHandler:a5];
}

- (BOOL)requestRouteFrom:(id)a3 to:(id)a4 routeCache:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v10)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesManager.m";
    __int16 v33 = 1024;
    int v34 = 59;
    __int16 v35 = 2082;
    v36 = "-[NavdDoomGEORoutesManager requestRouteFrom:to:routeCache:completionHandler:]";
    __int16 v37 = 2082;
    v38 = "nil == (originLocation)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an origin";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v24, location, 0x26u);
    goto LABEL_16;
  }
  if (!v11)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesManager.m";
    __int16 v33 = 1024;
    int v34 = 60;
    __int16 v35 = 2082;
    v36 = "-[NavdDoomGEORoutesManager requestRouteFrom:to:routeCache:completionHandler:]";
    __int16 v37 = 2082;
    v38 = "nil == (destination)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination";
    goto LABEL_15;
  }
  if (!v13)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesManager.m";
      __int16 v33 = 1024;
      int v34 = 61;
      __int16 v35 = 2082;
      v36 = "-[NavdDoomGEORoutesManager requestRouteFrom:to:routeCache:completionHandler:]";
      __int16 v37 = 2082;
      v38 = "nil == (completionHandler)";
      v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
      goto LABEL_15;
    }
LABEL_16:
    BOOL v23 = 0;
    goto LABEL_17;
  }
  v15 = self->_routeRequestTicket;
  v16 = v15;
  if (v15) {
    [(GEODirectionsServiceRequest *)v15 cancel];
  }
  id v17 = objc_alloc_init((Class)GEODirectionsServiceRequestParameters);
  [v17 setRequestType:13];
  [v17 setTransportType:0];
  [v17 setCurrentLocation:v10];
  id v31 = v11;
  v18 = +[NSArray arrayWithObjects:&v31 count:1];
  [v17 setWaypoints:v18];

  [v17 setRequestPriority:GEOConfigGetInteger()];
  v19 = [(NavdDoomGEORoutesManager *)self _routeAttributes];
  [v17 setRouteAttributes:v19];

  v20 = [(NavdDoomGEORoutesManager *)self _traits];
  if (v20) {
    [v17 setTraits:v20];
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000150BC;
  v29[3] = &unk_100089650;
  id v30 = v12;
  [v17 setRequestCallback:v29];
  objc_initWeak((id *)location, self);
  v21 = +[GEODirectionsService sharedService];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001511C;
  v26[3] = &unk_100089678;
  objc_copyWeak(&v28, (id *)location);
  id v27 = v14;
  id v22 = [v21 requestDirections:v17 handler:v26];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)location);

  BOOL v23 = 1;
LABEL_17:

  return v23;
}

- (BOOL)requestWaypointForMapsSuggestionsEntry:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v27 = 136446978;
      id v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesManager.m";
      __int16 v29 = 1024;
      int v30 = 100;
      __int16 v31 = 2082;
      v32 = "-[NavdDoomGEORoutesManager requestWaypointForMapsSuggestionsEntry:completionHandler:]";
      __int16 v33 = 2082;
      int v34 = "nil == (entry)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v27, 0x26u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v7)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v27 = 136446978;
      id v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomGEORoutesManager.m";
      __int16 v29 = 1024;
      int v30 = 101;
      __int16 v31 = 2082;
      v32 = "-[NavdDoomGEORoutesManager requestWaypointForMapsSuggestionsEntry:completionHandler:]";
      __int16 v33 = 2082;
      int v34 = "nil == (completionHandler)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = [v6 geoMapItem];

  if (v9)
  {
    id v10 = [v6 geoMapItem];
    id v11 = [(NavdDoomGEORoutesManager *)self _traits];
    id v12 = +[GEOComposedWaypoint composedWaypointForMapItem:v10 traits:v11 clientAttributes:0 completionHandler:v8 networkActivityHandler:0];

LABEL_22:
    BOOL v15 = 1;
    goto LABEL_23;
  }
  if ([v6 containsKey:@"MapsSuggestionsLatitudeKey"])
  {
    if ([v6 containsKey:@"MapsSuggestionsLongitudeKey"])
    {
      v16 = [v6 numberForKey:@"MapsSuggestionsLatitudeKey"];
      [v16 doubleValue];
      double v18 = v17;
      v19 = [v6 numberForKey:@"MapsSuggestionsLongitudeKey"];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 >= -180.0 && v21 <= 180.0 && v18 >= -90.0 && v18 <= 90.0)
      {
        id v22 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v18, v21);
        BOOL v23 = [(NavdDoomGEORoutesManager *)self _traits];
        id v24 = +[GEOComposedWaypoint composedWaypointForLocation:v22 mapItem:0 traits:v23 completionHandler:v8 networkActivityHandler:0];
LABEL_21:

        goto LABEL_22;
      }
    }
  }
  if ([v6 containsKey:@"MapsSuggestionsDestinationAddressKey"])
  {
    id v22 = [v6 stringForKey:@"MapsSuggestionsDestinationAddressKey"];
    BOOL v23 = [(NavdDoomGEORoutesManager *)self _traits];
    id v25 = +[GEOComposedWaypoint composedWaypointForAddressString:v22 traits:v23 clientAttributes:0 completionHandler:v8 networkActivityHandler:0];
    goto LABEL_21;
  }
LABEL_11:
  BOOL v15 = 0;
LABEL_23:

  return v15;
}

- (id)_traits
{
  v2 = +[GEOMapService sharedService];
  objc_super v3 = [v2 defaultTraits];

  [v3 setRequestMode:2];

  return v3;
}

- (id)_routeAttributes
{
  v2 = self;
  objc_sync_enter(v2);
  routeRequestAttributes = v2->_routeRequestAttributes;
  if (!routeRequestAttributes)
  {
    uint64_t v4 = +[GEORouteAttributes defaultRouteAttributesForTransportType:0];
    v5 = v2->_routeRequestAttributes;
    v2->_routeRequestAttributes = (GEORouteAttributes *)v4;

    [(GEORouteAttributes *)v2->_routeRequestAttributes setIncludeContingencyRoutes:1];
    id v6 = objc_alloc_init((Class)GEOAutomobileOptions);
    [v6 setIncludeHistoricTravelTime:1];
    [v6 setTrafficType:3];
    [(GEORouteAttributes *)v2->_routeRequestAttributes setAutomobileOptions:v6];

    routeRequestAttributes = v2->_routeRequestAttributes;
  }
  id v7 = routeRequestAttributes;
  objc_sync_exit(v2);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestAttributes, 0);
  objc_storeStrong((id *)&self->_routeRequestFeedback, 0);

  objc_storeStrong((id *)&self->_routeRequestTicket, 0);
}

@end
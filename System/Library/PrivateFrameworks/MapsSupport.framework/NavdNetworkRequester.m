@interface NavdNetworkRequester
- (BOOL)requestEtaForWaypoint:(id)a3 at:(id)a4 transportType:(int)a5 attributes:(id)a6 completion:(id)a7;
- (BOOL)requestRouteForWaypoints:(id)a3 at:(id)a4 attributes:(id)a5 completion:(id)a6;
- (BOOL)requestWaypointForCurrentLocation:(id)a3 completion:(id)a4;
- (BOOL)requestWaypointForEntry:(id)a3 completion:(id)a4;
- (BOOL)requestWaypointForLocation:(id)a3 completion:(id)a4;
- (BOOL)requestWaypointForLocation:(id)a3 mapItem:(id)a4 completion:(id)a5;
- (BOOL)requestWaypointForMapItem:(id)a3 completion:(id)a4;
- (NavdNetworkRequester)initWithNetworkRequester:(id)a3 purpose:(int)a4 source:(int)a5;
- (id)networkRequester;
@end

@implementation NavdNetworkRequester

- (NavdNetworkRequester)initWithNetworkRequester:(id)a3 purpose:(int)a4 source:(int)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NavdNetworkRequester;
  v10 = [(NavdNetworkRequester *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_networkRequester, a3);
    v11->_purpose = a4;
    v11->_source = a5;
  }

  return v11;
}

- (BOOL)requestWaypointForMapItem:(id)a3 completion:(id)a4
{
  return [(MapsSuggestionsNetworkRequester *)self->_networkRequester composedWaypointForMapItem:a3 completion:a4];
}

- (BOOL)requestWaypointForEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = MapsSuggestionsLocationForEntry();
    if (v8)
    {
      id v9 = [v6 geoMapItem];

      v10 = GEOFindOrCreateLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v11)
        {
          [v8 coordinate];
          uint64_t v13 = v12;
          [v8 coordinate];
          uint64_t v15 = v14;
          v16 = [v6 geoMapItem];
          v17 = [v16 description];
          int v24 = 134218498;
          uint64_t v25 = v13;
          __int16 v26 = 2048;
          uint64_t v27 = v15;
          __int16 v28 = 2112;
          v29 = v17;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Requesting Waypoint for location <%.6f,%.6f> with mapitem:%@", (uint8_t *)&v24, 0x20u);
        }
        v18 = [v6 geoMapItem];
        BOOL v19 = [(NavdNetworkRequester *)self requestWaypointForMapItem:v18 completion:v7];
      }
      else
      {
        if (v11)
        {
          [v8 coordinate];
          uint64_t v21 = v20;
          [v8 coordinate];
          int v24 = 134218240;
          uint64_t v25 = v21;
          __int16 v26 = 2048;
          uint64_t v27 = v22;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Requesting Waypoint for location <%.6f,%.6f> without mapitem", (uint8_t *)&v24, 0x16u);
        }

        BOOL v19 = [(NavdNetworkRequester *)self requestWaypointForLocation:v8 completion:v7];
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)requestWaypointForCurrentLocation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v7];

  if (v8) {
    unsigned __int8 v9 = [(MapsSuggestionsNetworkRequester *)self->_networkRequester composedWaypointForCurrentLocation:v8 completion:v6];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)requestWaypointForLocation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v7];

  if (v8) {
    unsigned __int8 v9 = [(MapsSuggestionsNetworkRequester *)self->_networkRequester composedWaypointForLocation:v8 completion:v6];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)requestWaypointForLocation:(id)a3 mapItem:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v10];

  if (v11) {
    unsigned __int8 v12 = [(MapsSuggestionsNetworkRequester *)self->_networkRequester composedWaypointForLocation:v11 mapItem:v8 completion:v9];
  }
  else {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)requestRouteForWaypoints:(id)a3 at:(id)a4 attributes:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)GEODirectionsRequestFeedback);
  [v14 setPurpose:self->_purpose];
  [v14 setSource:self->_source];
  if (v11) {
    unsigned __int8 v15 = [(MapsSuggestionsNetworkRequester *)self->_networkRequester routeForWaypoints:v10 currentLocation:v11 routeAttributes:v12 feedback:v14 completion:v13];
  }
  else {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)requestEtaForWaypoint:(id)a3 at:(id)a4 transportType:(int)a5 attributes:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100045DC4;
    v22[3] = &unk_10008C358;
    v23 = v13;
    id v27 = v15;
    int v24 = self;
    id v25 = v12;
    int v28 = a5;
    id v26 = v14;
    BOOL v16 = [(NavdNetworkRequester *)self requestWaypointForLocation:v23 completion:v22];

    v17 = v23;
  }
  else
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [v13 coordinate];
      uint64_t v19 = v18;
      [v13 coordinate];
      *(_DWORD *)buf = 134218240;
      uint64_t v30 = v19;
      __int16 v31 = 2048;
      uint64_t v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to Request ETA for location <%.6f,%.6f> : missing destination waypoint", buf, 0x16u);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (id)networkRequester
{
  return self->_networkRequester;
}

- (void).cxx_destruct
{
}

@end
@interface GEOEnrouteNoticesUtil
+ (id)_enrouteNoticesForRoute:(id)a3 provider:(id)a4;
+ (id)createEnrouteNoticesForComposedRoute:(id)a3 routeInitializerData:(id)a4;
+ (void)_forEachGeoEnrouteNoticeOnRoute:(id)a3 handler:(id)a4;
@end

@implementation GEOEnrouteNoticesUtil

+ (id)createEnrouteNoticesForComposedRoute:(id)a3 routeInitializerData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 geoWaypointRoute];

  if (v7)
  {
    uint64_t v8 = [v5 geoWaypointRoute];
  }
  else
  {
    v9 = [v6 directionsResponse];

    if (v9)
    {
      uint64_t v8 = [v6 directionsResponse];
    }
    else
    {
      v10 = [v6 etaTrafficUpdateResponse];

      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v8 = [v6 etaTrafficUpdateResponse];
    }
  }
  v10 = (void *)v8;
LABEL_8:
  v11 = +[GEOEnrouteNoticesUtil _enrouteNoticesForRoute:v5 provider:v10];

  return v11;
}

+ (id)_enrouteNoticesForRoute:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__91;
  v24 = __Block_byref_object_dispose__91;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v7 _geoTrafficCameras];
  v9 = [v7 _geoTrafficSignals];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__GEOEnrouteNoticesUtil__enrouteNoticesForRoute_provider___block_invoke;
  v15[3] = &unk_1E53ED5C8;
  id v10 = v8;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  v19 = &v20;
  id v12 = v9;
  id v18 = v12;
  [a1 _forEachGeoEnrouteNoticeOnRoute:v11 handler:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

void __58__GEOEnrouteNoticesUtil__enrouteNoticesForRoute_provider___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  int v7 = [v17 type];
  switch(v7)
  {
    case 3:
      id v12 = [GEOComposedRouteAnnotation alloc];
      id v13 = [v17 routeAnnotation];
      id v10 = [(GEOComposedRouteAnnotation *)v12 initWithEnrouteNotice:v17 enrouteNoticeIndex:a3 legIndex:a4 annotation:v13 onRoute:a1[5]];

      if (v10) {
        [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v10];
      }
      break;
    case 2:
      v14 = (void *)a1[6];
      v15 = [v17 objectIdentifier];
      id v10 = [v14 objectForKeyedSubscript:v15];

      if (v10)
      {
        id v11 = [[GEOComposedTrafficSignal alloc] initWithEnrouteNotice:v17 enrouteNoticeIndex:a3 legIndex:a4 trafficSignal:v10 onRoute:a1[5]];
        goto LABEL_10;
      }
      break;
    case 1:
      uint64_t v8 = (void *)a1[4];
      v9 = [v17 objectIdentifier];
      id v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        id v11 = [[GEOComposedTrafficCamera alloc] initWithEnrouteNotice:v17 enrouteNoticeIndex:a3 legIndex:a4 trafficCamera:v10 onRoute:a1[5]];
LABEL_10:
        id v16 = v11;
        if (v11) {
          [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v11];
        }
      }
      break;
    default:
      goto LABEL_14;
  }

LABEL_14:
}

+ (void)_forEachGeoEnrouteNoticeOnRoute:(id)a3 handler:(id)a4
{
  id v23 = a3;
  id v5 = (void (**)(id, void *, unint64_t, unint64_t))a4;
  id v6 = [v23 geoWaypointRoute];
  int v7 = [v6 routeLegs];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v23 geoWaypointRoute];
      id v11 = [v10 routeLegs];
      id v12 = [v11 objectAtIndexedSubscript:v9];

      id v13 = [v12 enrouteNotices];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        unint64_t v15 = 0;
        do
        {
          id v16 = [v12 enrouteNotices];
          id v17 = [v16 objectAtIndexedSubscript:v15];

          v5[2](v5, v17, v15, v9);
          ++v15;
          id v18 = [v12 enrouteNotices];
          unint64_t v19 = [v18 count];
        }
        while (v15 < v19);
      }

      ++v9;
      uint64_t v20 = [v23 geoWaypointRoute];
      v21 = [v20 routeLegs];
      unint64_t v22 = [v21 count];
    }
    while (v9 < v22);
  }
}

@end
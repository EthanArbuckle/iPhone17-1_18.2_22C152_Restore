@interface _GEODirectionsServiceRequestBuilder_ResumeNavAfterPause
- (id)geoOriginalWaypointRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
- (void)setMiscFieldsInDirectionsRequest:(id)a3;
@end

@implementation _GEODirectionsServiceRequestBuilder_ResumeNavAfterPause

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (int)originalWaypointRoutePurpose
{
  return 8;
}

- (id)geoOriginalWaypointRoute
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v4 = [v3 resumeRouteHandle];
  id v5 = [v4 routeGeometry];

  if (!v5)
  {
    v16 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    v17 = [v16 resumeRouteHandle];

    v18 = GEOGetDirectionsServiceLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        LOWORD(v52) = 0;
LABEL_30:
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v52, 2u);
      }
    }
    else if (v19)
    {
      LOWORD(v52) = 0;
      goto LABEL_30;
    }

    v50 = objc_opt_new();
    [v50 setPurpose:8];
    [v50 setCreationMethod:0];
    id v5 = v50;
    id v47 = v5;
    goto LABEL_32;
  }
  v6 = [(GEODirectionsServiceRequestBuilder *)self _waypoints];
  unint64_t v7 = [v6 count] - 1;
  v8 = [v5 routeLegs];
  unint64_t v9 = [v8 count];

  if (v9 <= v7)
  {
    v21 = [v5 routeLegs];
    unint64_t v22 = [v21 count];

    if (v22 < v7)
    {
      v23 = GEOGetDirectionsServiceLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = [v6 count];
        v25 = [v5 routeLegs];
        int v52 = 67109632;
        int v53 = v24;
        __int16 v54 = 1024;
        int v55 = v7;
        __int16 v56 = 1024;
        int v57 = [v25 count];
      }
      v26 = [v5 routeLegs];
      uint64_t v27 = [v26 count];

      if (v7 != v27)
      {
        uint64_t v28 = 0;
        if (v7 - v27 <= 1) {
          uint64_t v29 = 1;
        }
        else {
          uint64_t v29 = v7 - v27;
        }
        do
        {
          v30 = [v5 routeLegs];

          if (!v30)
          {
            v31 = [MEMORY[0x1E4F1CA48] array];
            [v5 setRouteLegs:v31];
          }
          v32 = objc_alloc_init(GEOOriginalRouteLeg);
          v33 = [v5 routeLegs];
          [v33 insertObject:v32 atIndex:v28];

          ++v28;
        }
        while (v29 != v28);
      }
    }
  }
  else
  {
    v10 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = [v6 count];
      v12 = [v5 routeLegs];
      int v52 = 67109632;
      int v53 = v11;
      __int16 v54 = 1024;
      int v55 = v7;
      __int16 v56 = 1024;
      int v57 = [v12 count];
    }
    v13 = [v5 routeLegs];
    unint64_t v14 = [v13 count] - v7;

    v15 = [v5 routeLegs];
    objc_msgSend(v15, "removeObjectsInRange:", 0, v14);
  }
  v34 = [v5 routeLegs];
  uint64_t v35 = [v34 count];

  if (v35 == v7)
  {
    v36 = [v5 routeLegs];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      unint64_t v38 = 0;
      do
      {
        v39 = [v5 routeLegs];
        v40 = [v39 objectAtIndexedSubscript:v38];

        v41 = [v6 objectAtIndexedSubscript:v38];
        v42 = [v41 geoWaypointInfo];
        [v40 setOriginWaypointInfo:v42];

        v43 = [v6 objectAtIndexedSubscript:++v38];
        v44 = [v43 geoWaypointInfo];
        [v40 setDestinationWaypointInfo:v44];

        v45 = [v5 routeLegs];
        unint64_t v46 = [v45 count];
      }
      while (v38 < v46);
    }
    [v5 setCreationMethod:0];
    id v47 = v5;
  }
  else
  {
    v48 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      int v49 = [v6 count];
      int v52 = 67109376;
      int v53 = v49;
      __int16 v54 = 1024;
      int v55 = v7;
    }

    id v47 = 0;
  }

LABEL_32:

  return v47;
}

- (void)setMiscFieldsInDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v6 = [v5 resumeRouteHandle];
  unint64_t v7 = [v6 serverSessionState];
  [v4 setSessionState:v7];

  v8 = [v4 sessionState];

  if (!v8)
  {
    unint64_t v9 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
    }
  }
}

@end
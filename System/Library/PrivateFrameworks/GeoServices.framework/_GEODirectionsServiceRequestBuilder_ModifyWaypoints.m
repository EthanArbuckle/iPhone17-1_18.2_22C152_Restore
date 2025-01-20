@interface _GEODirectionsServiceRequestBuilder_ModifyWaypoints
- (id)waypointsForRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_ModifyWaypoints

- (id)waypointsForRoute
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  uint64_t v4 = [v3 currentLocation];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    v7 = [v6 currentRoute];

    if (v7)
    {
      v8 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      v9 = [v8 currentRoute];
      v10 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      v11 = objc_msgSend(v9, "waypointsFromRouteCoordinate:", objc_msgSend(v10, "routeCoordinate"));

      if (!v11)
      {
        v12 = GEOGetDirectionsServiceLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Waypoints retrieved from the current route is nil", buf, 2u);
        }
      }
      v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count") + 2);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v44 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(v13, "addObject:", *(void *)(*((void *)&v43 + 1) + 8 * i), (void)v43);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v16);
      }

      v19 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      uint64_t v20 = [v19 waypointModificationType];

      if (v20 != 1)
      {
        if (v20)
        {
          v23 = GEOGetDirectionsServiceLog();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
LABEL_28:

            v27 = [GEOComposedWaypoint alloc];
            v28 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
            v29 = [v28 currentLocation];
            v23 = [(GEOComposedWaypoint *)v27 initWithLocation:v29 isCurrentLocation:1];

            [v13 insertObject:v23 atIndex:0];
            id v26 = v13;
LABEL_41:

            goto LABEL_42;
          }
          v24 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
          *(_DWORD *)buf = 138412290;
          v49 = v24;
LABEL_27:

          goto LABEL_28;
        }
        v21 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
        v22 = [v21 waypointToInsert];

        if (v22)
        {
          v23 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
          v24 = [v23 waypointToInsert];
          [v13 insertObject:v24 atIndex:0];
          goto LABEL_27;
        }
        v23 = GEOGetDirectionsServiceLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v39 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
          *(_DWORD *)buf = 138412290;
          v49 = v39;
        }
LABEL_40:
        id v26 = 0;
        goto LABEL_41;
      }
      if ((unint64_t)[v13 count] <= 1)
      {
        v23 = GEOGetDirectionsServiceLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
        }
        goto LABEL_40;
      }
      v30 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      v31 = [v30 currentRoute];
      v23 = [v31 waypoints];

      uint64_t v32 = [v23 count];
      unint64_t v33 = v32 - [v14 count];
      v34 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      unint64_t v35 = [v34 waypointIndexToRemove];

      if (v35 >= v33)
      {
        v40 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
        unint64_t v41 = [v40 waypointIndexToRemove] - v33;

        if (v41 < [v13 count])
        {
          [v13 removeObjectAtIndex:v41];
          goto LABEL_28;
        }
        v36 = GEOGetDirectionsServiceLog();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        v37 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
        *(_DWORD *)buf = 138412290;
        v49 = v37;
      }
      else
      {
        v36 = GEOGetDirectionsServiceLog();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_39:

          goto LABEL_40;
        }
        v37 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
        *(_DWORD *)buf = 138412290;
        v49 = v37;
      }
      _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_ERROR, v38, buf, 0xCu);

      goto LABEL_39;
    }
  }
  else
  {
  }
  v14 = GEOGetDirectionsServiceLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v25 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
    *(_DWORD *)buf = 138412290;
    v49 = v25;
  }
  id v26 = 0;
LABEL_42:

  return v26;
}

- (int)directionsRequestFeedbackPurpose
{
  return 7;
}

- (int)originalWaypointRoutePurpose
{
  return 5;
}

@end
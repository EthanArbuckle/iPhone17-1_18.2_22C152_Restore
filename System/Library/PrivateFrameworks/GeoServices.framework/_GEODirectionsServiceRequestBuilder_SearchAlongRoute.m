@interface _GEODirectionsServiceRequestBuilder_SearchAlongRoute
- (id)waypointsForRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_SearchAlongRoute

- (id)waypointsForRoute
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  uint64_t v4 = [v3 currentLocation];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    uint64_t v7 = [v6 currentRoute];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      v10 = [v9 waypoints];
      uint64_t v11 = [v10 count];

      if (v11) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  v12 = GEOGetDirectionsServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
    int v23 = 138412290;
    v24 = v13;
  }
LABEL_10:
  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [GEOComposedWaypoint alloc];
  v16 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v17 = [v16 currentLocation];
  v18 = [(GEOComposedWaypoint *)v15 initWithLocation:v17 isCurrentLocation:1];

  v19 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v20 = [v19 waypoints];
  v21 = [v20 lastObject];

  [v14 addObject:v18];
  [v14 addObject:v21];

  return v14;
}

- (int)directionsRequestFeedbackPurpose
{
  return 7;
}

- (int)originalWaypointRoutePurpose
{
  v2 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  if ([v2 returnToOriginalDestination]) {
    int v3 = 4;
  }
  else {
    int v3 = 3;
  }

  return v3;
}

@end
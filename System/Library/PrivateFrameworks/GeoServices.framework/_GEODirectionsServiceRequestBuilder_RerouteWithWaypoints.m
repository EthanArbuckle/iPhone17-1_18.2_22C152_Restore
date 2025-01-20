@interface _GEODirectionsServiceRequestBuilder_RerouteWithWaypoints
- (id)waypointsForRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_RerouteWithWaypoints

- (id)waypointsForRoute
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v4 = [v3 currentLocation];

  v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v6 = [v5 waypoints];

  if (v4 && [v6 count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
    v8 = [[GEOComposedWaypoint alloc] initWithLocation:v4 isCurrentLocation:1];
    [v7 addObject:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    GEOGetDirectionsServiceLog();
    v8 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
    {
      v14 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
      *(_DWORD *)buf = 138412290;
      v22 = v14;
    }
    v7 = 0;
  }

  return v7;
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
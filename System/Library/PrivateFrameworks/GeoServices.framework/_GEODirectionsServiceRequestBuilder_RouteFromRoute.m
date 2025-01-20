@interface _GEODirectionsServiceRequestBuilder_RouteFromRoute
- (id)waypointsForRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_RouteFromRoute

- (id)waypointsForRoute
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v4 = [v3 currentRoute];

  if (v4)
  {
    v5 = [v4 waypoints];
  }
  else
  {
    v6 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
      int v9 = 138412290;
      v10 = v7;
    }
    v5 = 0;
  }

  return v5;
}

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (int)originalWaypointRoutePurpose
{
  return 2;
}

@end
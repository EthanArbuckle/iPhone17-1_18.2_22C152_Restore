@interface _GEODirectionsServiceRequestBuilder_ConvertToNavigableRoute
- (id)geoOriginalWaypointRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_ConvertToNavigableRoute

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (int)originalWaypointRoutePurpose
{
  return 12;
}

- (id)geoOriginalWaypointRoute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v4 = [v3 currentRoute];

  if (v4)
  {
    uint64_t v5 = [(_GEODirectionsServiceRequestBuilder_ConvertToNavigableRoute *)self originalWaypointRoutePurpose];
    v6 = [(GEODirectionsServiceRequestBuilder *)self _waypoints];
    v7 = [v6 firstObject];
    v8 = [v4 geoOriginalWaypointRouteFromRouteCoordinate:0 purpose:v5 userPosition:0 origin:v7 startPathSegment:0];
  }
  else
  {
    v9 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
      int v12 = 138412290;
      v13 = v10;
    }
    v8 = 0;
  }

  return v8;
}

@end
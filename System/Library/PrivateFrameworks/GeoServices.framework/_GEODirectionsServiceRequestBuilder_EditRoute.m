@interface _GEODirectionsServiceRequestBuilder_EditRoute
- (id)geoOriginalWaypointRoute;
- (id)typedWaypointsForDirectionsRequest;
- (id)waypointsForRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
@end

@implementation _GEODirectionsServiceRequestBuilder_EditRoute

- (id)waypointsForRoute
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v3 = [v2 anchorPoints];

  if ((unint64_t)[v3 count] > 1)
  {
    v6 = [v3 firstObject];
    v4 = [v6 copy];

    v7 = [v3 lastObject];
    v8 = (void *)[v7 copy];

    v11[0] = v4;
    v11[1] = v8;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  }
  else
  {
    v4 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
    }
    v5 = 0;
  }

  return v5;
}

- (id)typedWaypointsForDirectionsRequest
{
  v2 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v3 = [v2 anchorPoints];

  if ((unint64_t)[v3 count] > 1)
  {
    v6 = [v3 anchorPoints];
    v5 = objc_msgSend(v6, "_geo_map:", &__block_literal_global_144);
  }
  else
  {
    v4 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
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
  return 11;
}

- (id)geoOriginalWaypointRoute
{
  uint64_t v3 = [(_GEODirectionsServiceRequestBuilder_EditRoute *)self originalWaypointRoutePurpose];
  v4 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v5 = [v4 currentRoute];

  if (v5)
  {
    v6 = [(GEODirectionsServiceRequestBuilder *)self _waypoints];
    v7 = [v6 firstObject];
    v8 = [v5 geoOriginalWaypointRouteFromRouteCoordinate:0 purpose:v3 userPosition:0 origin:v7 startPathSegment:0];
  }
  else
  {
    v8 = objc_alloc_init(GEOOriginalWaypointRoute);
    [(GEOOriginalWaypointRoute *)v8 setPurpose:v3];
  }

  return v8;
}

@end
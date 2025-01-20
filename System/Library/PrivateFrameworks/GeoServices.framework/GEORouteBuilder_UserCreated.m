@interface GEORouteBuilder_UserCreated
- (BOOL)_setMiscInfo;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (NSArray)waypoints;
- (id)_newRouteInstance;
- (int)_transportType;
- (void)setAnchorPoints:(id)a3;
- (void)setDirectionsRequest:(id)a3;
- (void)setDirectionsResponse:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation GEORouteBuilder_UserCreated

- (int)_transportType
{
  v2 = [(GEODirectionsRequest *)self->_directionsRequest routeAttributes];
  int v3 = [v2 mainTransportType];

  return v3;
}

- (id)_newRouteInstance
{
  int v3 = [GEORouteInitializerData alloc];
  waypoints = self->_waypoints;
  v5 = [(GEODirectionsRequest *)self->_directionsRequest routeAttributes];
  v6 = [(GEORouteInitializerData *)v3 initWithWaypoints:waypoints routeAttributes:v5 directionsResponse:self->_directionsResponse directionsRequest:self->_directionsRequest];

  v7 = [(GEODirectionsResponse *)self->_directionsResponse waypointRoutes];
  v8 = [v7 firstObject];

  v9 = [(GEOComposedRoute *)[GEOComposedGeometryRoute alloc] initWithGeoWaypointRoute:v8 initializerData:v6];
  return v9;
}

- (BOOL)_setMiscInfo
{
  int v3 = [(GEORouteBuilderBase *)self route];
  v4 = (id *)[(GEOComposedRouteAnchorPointList *)self->_anchorPoints copy];
  BOOL v5 = -[GEOComposedRouteAnchorPointList updateWithRoute:](v4, v3);
  if (v5)
  {
    [v3 setAnchorPoints:v4];
    [v3 setSource:3];
  }

  return v5;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);

  objc_storeStrong((id *)&self->_anchorPoints, 0);
}

@end
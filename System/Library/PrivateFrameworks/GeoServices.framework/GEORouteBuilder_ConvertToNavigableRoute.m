@interface GEORouteBuilder_ConvertToNavigableRoute
- (BOOL)_setMiscInfo;
- (GEOComposedRoute)sourceRoute;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (NSArray)waypoints;
- (id)_newRouteInstance;
- (int)_transportType;
- (void)setDirectionsRequest:(id)a3;
- (void)setDirectionsResponse:(id)a3;
- (void)setSourceRoute:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation GEORouteBuilder_ConvertToNavigableRoute

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

  v9 = [[GEOComposedRoute alloc] initWithGeoWaypointRoute:v8 initializerData:v6];
  return v9;
}

- (BOOL)_setMiscInfo
{
  int v3 = [(GEORouteBuilderBase *)self route];
  v4 = [(GEOComposedRoute *)self->_sourceRoute uniqueRouteID];
  [v3 setUniqueRouteID:v4];

  v5 = [(GEOComposedRoute *)self->_sourceRoute address];
  [v3 setAddress:v5];

  v6 = [(GEOComposedRoute *)self->_sourceRoute anchorPoints];
  [v3 setAnchorPoints:v6];

  objc_msgSend(v3, "setSource:", -[GEOComposedRoute source](self->_sourceRoute, "source"));
  v7 = [(GEOComposedRoute *)self->_sourceRoute storageID];
  [v3 setStorageID:v7];

  v8 = [(GEOComposedRoute *)self->_sourceRoute tourIdentifier];
  [v3 setTourIdentifier:v8];

  objc_msgSend(v3, "setTourMuid:", -[GEOComposedRoute tourMuid](self->_sourceRoute, "tourMuid"));
  objc_msgSend(v3, "setMapItemMuid:", -[GEOComposedRoute mapItemMuid](self->_sourceRoute, "mapItemMuid"));
  v9 = [(GEOComposedRoute *)self->_sourceRoute userProvidedName];
  [v3 setUserProvidedName:v9];

  v10 = [(GEOComposedRoute *)self->_sourceRoute userProvidedNotes];
  [v3 setUserProvidedNotes:v10];

  v11 = [(GEOComposedRoute *)self->_sourceRoute disclaimerText];
  [v3 setDisclaimerText:v11];

  v12 = [(GEOComposedRoute *)self->_sourceRoute disclaimerURL];
  [v3 setDisclaimerURL:v12];

  return 1;
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

- (GEOComposedRoute)sourceRoute
{
  return self->_sourceRoute;
}

- (void)setSourceRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRoute, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);

  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
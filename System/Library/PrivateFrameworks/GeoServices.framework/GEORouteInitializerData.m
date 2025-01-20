@interface GEORouteInitializerData
+ (BOOL)supportsSecureCoding;
- (GEOAddressObject)address;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (GEOETATrafficUpdateResponse)etaTrafficUpdateResponse;
- (GEORouteAttributes)routeAttributes;
- (GEORouteInitializerData)initWithCoder:(id)a3;
- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 directionsResponse:(id)a5;
- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 directionsResponse:(id)a5 directionsRequest:(id)a6;
- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 etauResponse:(id)a5 styleAttributes:(id)a6;
- (GEOStyleAttributes)styleAttributes;
- (NSArray)waypoints;
- (id)_allRoutesWithTypes:(int)a3;
- (id)allETAUAlternateRoutes;
- (id)allRoutes;
- (id)mainRoute;
- (id)nonRecommendedRoutes;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAnchorPoints:(id)a3;
@end

@implementation GEORouteInitializerData

- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 directionsResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEORouteInitializerData;
  v12 = [(GEORouteInitializerData *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_waypoints, a3);
    objc_storeStrong((id *)&v13->_routeAttributes, a4);
    objc_storeStrong((id *)&v13->_directionsResponse, a5);
    uint64_t v14 = [v11 styleAttributes];
    styleAttributes = v13->_styleAttributes;
    v13->_styleAttributes = (GEOStyleAttributes *)v14;

    v16 = v13;
  }

  return v13;
}

- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 etauResponse:(id)a5 styleAttributes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GEORouteInitializerData;
  v15 = [(GEORouteInitializerData *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_waypoints, a3);
    objc_storeStrong((id *)&v16->_routeAttributes, a4);
    objc_storeStrong((id *)&v16->_etaTrafficUpdateResponse, a5);
    objc_storeStrong((id *)&v16->_styleAttributes, a6);
    v17 = v16;
  }

  return v16;
}

- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 directionsResponse:(id)a5 directionsRequest:(id)a6
{
  id v11 = a6;
  id v12 = [(GEORouteInitializerData *)self initWithWaypoints:a3 routeAttributes:a4 directionsResponse:a5];
  id v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_directionsRequest, a6);
  }

  return v13;
}

- (id)allRoutes
{
  return [(GEORouteInitializerData *)self _allRoutesWithTypes:3];
}

- (id)mainRoute
{
  v2 = [(GEORouteInitializerData *)self _allRoutesWithTypes:1];
  v3 = [v2 firstObject];

  return v3;
}

- (id)allETAUAlternateRoutes
{
  v3 = [(GEOETATrafficUpdateResponse *)self->_etaTrafficUpdateResponse waypointRoute];
  v4 = v3;
  if (v3 && (v5 = (void *)[v3 newWaypointRoutes], uint64_t v6 = objc_msgSend(v5, "count"), v5, v6))
  {
    v7 = (void *)[v4 newWaypointRoutes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__GEORouteInitializerData_allETAUAlternateRoutes__block_invoke;
    v10[3] = &unk_1E53F71D8;
    v10[4] = self;
    v8 = objc_msgSend(v7, "_geo_compactMap:", v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

GEOComposedRoute *__49__GEORouteInitializerData_allETAUAlternateRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[GEOComposedRoute alloc] initWithGeoWaypointRoute:v3 initializerData:*(void *)(a1 + 32)];

  return v4;
}

- (id)nonRecommendedRoutes
{
  return [(GEORouteInitializerData *)self _allRoutesWithTypes:48];
}

- (id)_allRoutesWithTypes:(int)a3
{
  directionsResponse = self->_directionsResponse;
  if (!directionsResponse)
  {
    id v11 = 0;
    goto LABEL_24;
  }
  uint64_t v6 = [(GEODirectionsResponse *)directionsResponse suggestedRoutes];
  uint64_t v7 = [v6 count];

  v8 = self->_directionsResponse;
  if (v7)
  {
    id v9 = [(GEODirectionsResponse *)v8 suggestedRoutes];
LABEL_4:
    id v10 = 0;
    goto LABEL_8;
  }
  id v12 = [(GEODirectionsResponse *)v8 waypointRoutes];
  id v9 = (void *)[v12 count];

  if (!v9) {
    goto LABEL_4;
  }
  id v10 = [(GEODirectionsResponse *)self->_directionsResponse waypointRoutes];
  id v9 = 0;
LABEL_8:
  if ([v10 count] || objc_msgSend(v9, "count"))
  {
    if (v10)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__GEORouteInitializerData__allRoutesWithTypes___block_invoke;
      v25[3] = &unk_1E53F7200;
      int v26 = a3;
      v25[4] = self;
      id v11 = objc_msgSend(v10, "_geo_compactMap:", v25);
    }
    else
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      *(void *)buf = 0;
      if ([v9 count])
      {
        do
        {
          id v13 = [v9 objectAtIndexedSubscript:*(void *)buf];
          id v14 = [(GEORouteInitializerData *)self directionsRequest];
          v15 = [(GEORouteInitializerData *)self directionsResponse];
          v16 = +[GEOTransitRouteUpdateRequest transitRouteUpdateRequestWithDirectionsRequest:v14 directionsResponse:v15];

          v17 = [[GEOComposedRoute alloc] initWithSuggestedRoute:v13 initializerData:self updateRequest:v16];
          if (v17)
          {
            objc_super v18 = [(GEODirectionsResponse *)self->_directionsResponse transitRouteUpdateConfiguration];
            -[GEOComposedRoute setTransitUpdateInitialDelay:](v17, "setTransitUpdateInitialDelay:", (double)(unint64_t)[v18 ttlSeconds]);

            objc_super v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:8];
            [(GEOComposedRoute *)v17 setServerRouteID:v19];

            [v11 addObject:v17];
          }

          unint64_t v20 = ++*(void *)buf;
        }
        while (v20 < [v9 count]);
      }
      id v10 = 0;
    }
  }
  else
  {
    v21 = [(GEODirectionsResponse *)self->_directionsResponse routes];
    id v11 = (void *)[v21 count];

    if (v11)
    {
      if (qword_1EB2A0900 != -1) {
        dispatch_once(&qword_1EB2A0900, &__block_literal_global_216);
      }
      v22 = _MergedGlobals_350;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_350, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Attempting to load route from a directions response using deprecated Routing protocol. This is no longer supported.", buf, 2u);
      }
      id v11 = 0;
    }
  }

LABEL_24:

  return v11;
}

GEOComposedRoute *__47__GEORouteInitializerData__allRoutesWithTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(_DWORD *)(a1 + 40) >> [v3 type])) {
    v4 = [[GEOComposedRoute alloc] initWithGeoWaypointRoute:v3 initializerData:*(void *)(a1 + 32)];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteInitializerData)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEORouteInitializerData;
  v5 = [(GEORouteInitializerData *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsRequest"];
    directionsRequest = v5->_directionsRequest;
    v5->_directionsRequest = (GEODirectionsRequest *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsResponse"];
    directionsResponse = v5->_directionsResponse;
    v5->_directionsResponse = (GEODirectionsResponse *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etaTrafficUpdateResponse"];
    etaTrafficUpdateResponse = v5->_etaTrafficUpdateResponse;
    v5->_etaTrafficUpdateResponse = (GEOETATrafficUpdateResponse *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeAttributes"];
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_styleAttributes"];
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPoints"];
    anchorPoints = v5->_anchorPoints;
    v5->_anchorPoints = (GEOComposedRouteAnchorPointList *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_address"];
    address = v5->_address;
    v5->_address = (GEOAddressObject *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  waypoints = self->_waypoints;
  id v5 = a3;
  [v5 encodeObject:waypoints forKey:@"_waypoints"];
  [v5 encodeObject:self->_directionsRequest forKey:@"_directionsRequest"];
  [v5 encodeObject:self->_directionsResponse forKey:@"_directionsResponse"];
  [v5 encodeObject:self->_etaTrafficUpdateResponse forKey:@"_etaTrafficUpdateResponse"];
  [v5 encodeObject:self->_routeAttributes forKey:@"_routeAttributes"];
  [v5 encodeObject:self->_styleAttributes forKey:@"_styleAttributes"];
  [v5 encodeObject:self->_anchorPoints forKey:@"_anchorPoints"];
  [v5 encodeObject:self->_address forKey:@"_address"];
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (GEOETATrafficUpdateResponse)etaTrafficUpdateResponse
{
  return self->_etaTrafficUpdateResponse;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponse, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);

  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
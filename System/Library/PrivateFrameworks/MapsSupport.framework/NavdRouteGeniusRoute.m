@interface NavdRouteGeniusRoute
- (BOOL)hasRouteLoaded;
- (BOOL)isLoadingRoute;
- (NavdRouteGeniusRoute)initWithEntry:(id)a3;
- (double)distanceFromRouteToLocation:(id)a3;
- (id).cxx_construct;
- (id)description;
- (id)destinationWaypoint;
- (id)entry;
- (id)offRouteInfos;
- (id)route;
- (void)destinationGEOLocation:(id)a3;
- (void)loadRoute;
- (void)setDestinationWaypoint:(id)a3;
- (void)setRoute:(id)a3;
- (void)updateForRerouteWithLocation:(id)a3 time:(id)a4;
- (void)updateRerouteInfoForLocation:(id)a3 time:(id)a4;
@end

@implementation NavdRouteGeniusRoute

- (NavdRouteGeniusRoute)initWithEntry:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavdRouteGeniusRoute;
  v6 = [(NavdRouteGeniusRoute *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state.queue._innerQueue, a3);
    v8 = (GEOComposedWaypoint *)objc_alloc_init((Class)NSArray);
    origin = v7->_state.origin;
    v7->_state.origin = v8;
  }
  return v7;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc((Class)NSMutableString);
  if (LOBYTE(v2->_state.routes)) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  innerQueue = v2->_state.queue._innerQueue;
  v6 = [(NSString *)v2->_state.queue._name latLng];
  [v6 lat];
  uint64_t v8 = v7;
  v9 = [(NSString *)v2->_state.queue._name latLng];
  [v9 lng];
  id v11 = [v3 initWithFormat:@"entry: %@\r\nHasRouteLoaded : %@\r\nDestinationWaypoint : <%.6f,%.6f> \r\nOffRouteInfos: count=%lu\r\n", innerQueue, v4, v8, v10, -[GEOComposedWaypoint count](v2->_state.origin, "count")];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = v2->_state.origin;
  id v13 = [(GEOComposedWaypoint *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) description];
        [v11 appendFormat:@"\r\n%@", v16];
      }
      id v13 = [(GEOComposedWaypoint *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v2);

  return v11;
}

- (id)entry
{
  return self->_state.queue._innerQueue;
}

- (id)destinationWaypoint
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_state.queue._name;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDestinationWaypoint:(id)a3
{
  CFStringRef v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  name = obj->_state.queue._name;
  obj->_state.queue._name = v4;

  objc_sync_exit(obj);
}

- (void)destinationGEOLocation:(id)a3
{
  CFStringRef v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  name = obj->_state.queue._name;
  obj->_state.queue._name = v4;

  objc_sync_exit(obj);
}

- (id)route
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_state.route;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRoute:(id)a3
{
  CFStringRef v4 = (NavdRouteGeniusRoute *)a3;
  obj = self;
  objc_sync_enter(obj);
  LOWORD(obj->_state.routes) = 1;
  route = obj->_state.route;
  obj->_state.route = v4;

  objc_sync_exit(obj);
}

- (double)distanceFromRouteToLocation:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEORouteMatcher) initWithRoute:self->_state.route auditToken:0];
  [v4 coordinate];
  double v7 = v6;
  [v4 coordinate];
  [v5 distanceToRouteFrom:v7];
  double v9 = v8;

  return v9;
}

- (BOOL)isLoadingRoute
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE1(v2->_state.routes);
  objc_sync_exit(v2);

  return v3;
}

- (void)loadRoute
{
  obj = self;
  objc_sync_enter(obj);
  BYTE1(obj->_state.routes) = 1;
  objc_sync_exit(obj);
}

- (BOOL)hasRouteLoaded
{
  v2 = self;
  objc_sync_enter(v2);
  char routes = (char)v2->_state.routes;
  objc_sync_exit(v2);

  return routes;
}

- (id)offRouteInfos
{
  return self->_state.origin;
}

- (void)updateRerouteInfoForLocation:(id)a3 time:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  origin = self->_state.origin;
  if (origin)
  {
    [(GEOComposedWaypoint *)origin count];
    double v9 = [NavdOffRouteInfo alloc];
    [v6 coordinate];
    double v11 = v10;
    [v6 coordinate];
    double v13 = v12;
    uint64_t v14 = [(NSString *)self->_state.queue._name latLng];
    [v14 lat];
    double v16 = v15;
    v17 = [(NSString *)self->_state.queue._name latLng];
    [v17 lng];
    long long v19 = -[NavdOffRouteInfo initWithCurrentDate:location:destination:](v9, "initWithCurrentDate:location:destination:", v7, v11, v13, v16, v18);

    long long v20 = [(GEOComposedWaypoint *)self->_state.origin arrayByAddingObject:v19];
    long long v21 = self->_state.origin;
    self->_state.origin = v20;

    id v34 = [(GEOComposedWaypoint *)self->_state.origin copy];
    v22 = (GEOComposedWaypoint *)objc_alloc_init((Class)NSArray);
    v23 = self->_state.origin;
    self->_state.origin = v22;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v34;
    id v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(NavdOffRouteInfo **)(*((void *)&v35 + 1) + 8 * i);
          [v6 coordinate];
          double v30 = v29;
          [v6 coordinate];
          [(NavdOffRouteInfo *)v28 updateWithCurrentDate:v7 location:v28 == v19 isMostRecentReroute:0 throttledReroutesCount:v30];
          [(NavdOffRouteInfo *)v28 penalty];
          if (v31 > 2.22044605e-16)
          {
            v32 = [(GEOComposedWaypoint *)self->_state.origin arrayByAddingObject:v28];
            v33 = self->_state.origin;
            self->_state.origin = v32;
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v25);
    }
  }
}

- (void)updateForRerouteWithLocation:(id)a3 time:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v20 = a4;
  id v7 = [NavdOffRouteInfo alloc];
  double v8 = self->_state.queue._name;
  if ([(NSString *)v8 hasMapItemStorage])
  {
    double v9 = [(NSString *)v8 mapItemStorage];
    [v9 coordinate];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v9 = [(NSString *)v8 latLng];
    [v9 lat];
    double v11 = v14;
    double v15 = [(NSString *)v8 latLng];
    [v15 lng];
    double v13 = v16;
  }
  v17 = -[NavdOffRouteInfo initWithCurrentDate:location:destination:](v7, "initWithCurrentDate:location:destination:", v20, var0, var1, v11, v13);
  double v18 = [(GEOComposedWaypoint *)self->_state.origin arrayByAddingObject:v17];
  origin = self->_state.origin;
  self->_state.origin = v18;
}

- (void).cxx_destruct
{
  innerQueue = self->_state.queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  return self;
}

@end
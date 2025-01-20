@interface GEONavigationMapMatcher
- (BOOL)isSimulation;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedRoute)route;
- (GEOLocationShifter)locationShifter;
- (GEONavigationMapMatcher)initWithRoute:(id)a3 auditToken:(id)a4;
- (GEONavigationMatchResult)previousMatchResult;
- (GEORoadMatcher)roadMatcher;
- (GEORouteMatcher)routeMatcher;
- (id)_routeMatcherForRoute:(id)a3;
- (id)matchLocation:(id)a3 transportType:(int)a4;
- (id)updateForReroute:(id)a3 location:(id)a4 routeStartsFromLocation:(BOOL)a5;
- (int)transportType;
- (unint64_t)targetLegIndex;
- (void)resetToLocation:(id)a3;
- (void)setIsSimulation:(BOOL)a3;
- (void)setLocationShifter:(id)a3;
- (void)setPreviousMatchResult:(id)a3;
- (void)setRequiresRoadNetworkData:(BOOL)a3;
- (void)setRoadMatcher:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouteMatcher:(id)a3;
- (void)setShouldSnapRouteMatchToRoute:(BOOL)a3;
- (void)setShouldWaitForSnappedSegments:(BOOL)a3;
- (void)setTargetLegIndex:(unint64_t)a3;
@end

@implementation GEONavigationMapMatcher

- (GEONavigationMapMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEONavigationMapMatcher;
  v9 = [(GEONavigationMapMatcher *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    objc_storeStrong((id *)&v10->_auditToken, a4);
    v10->_targetLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = [(GEONavigationMapMatcher *)v10 _routeMatcherForRoute:v7];
    routeMatcher = v10->_routeMatcher;
    v10->_routeMatcher = (GEORouteMatcher *)v11;

    v13 = [[GEORoadMatcher alloc] initWithAuditToken:v8];
    roadMatcher = v10->_roadMatcher;
    v10->_roadMatcher = v13;

    v15 = objc_alloc_init(GEOLocationShifter);
    locationShifter = v10->_locationShifter;
    v10->_locationShifter = v15;

    -[GEORoadMatcher setUseRawLocations:](v10->_roadMatcher, "setUseRawLocations:", [v7 transportType] == 0);
    v17 = v10;
  }

  return v10;
}

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  return 0;
}

- (id)updateForReroute:(id)a3 location:(id)a4 routeStartsFromLocation:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = (GEOComposedRoute *)a3;
  if (self->_route == v9)
  {
    v15 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_route, a3);
    id v10 = a4;
    [(GEONavigationMapMatcher *)self setPreviousMatchResult:0];
    uint64_t v11 = [(GEONavigationMapMatcher *)self _routeMatcherForRoute:v9];
    routeMatcher = self->_routeMatcher;
    self->_routeMatcher = v11;

    [(GEORouteMatcher *)self->_routeMatcher setRequiresRoadNetworkData:self->_requiresRoadNetworkData];
    [(GEORouteMatcher *)self->_routeMatcher setShouldSnapRouteMatchToRoute:self->_shouldSnapRouteMatchToRoute];
    [(GEORouteMatcher *)self->_routeMatcher setShouldWaitForSnappedSegments:self->_shouldWaitForSnappedSegments];
    [(GEONavigationMapMatcher *)self setTargetLegIndex:0];
    [(GEORouteMatcher *)self->_routeMatcher setUseStrictInitialOnRouteCriteria:0];
    if (v5)
    {
      v13 = objc_alloc_init(GEONavigationMatchResult);
      v14 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:]([GEORouteMatch alloc], "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v9, 0, 0, 0, -180.0, -180.0, 1.79769313e308, -1.0);
      [(GEORouteMatch *)v14 setIsGoodMatch:1];
      [(GEONavigationMatchResult *)v13 setRouteMatch:v14];
      [(GEONavigationMapMatcher *)self setPreviousMatchResult:v13];
    }
    v15 = [(GEONavigationMapMatcher *)self matchLocation:v10 transportType:[(GEOComposedRoute *)v9 transportType]];

    [(GEORouteMatcher *)self->_routeMatcher setUseStrictInitialOnRouteCriteria:1];
  }

  return v15;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = GEOGetMapMatchingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t targetLegIndex = self->_targetLegIndex;
    v7[0] = 67109376;
    v7[1] = targetLegIndex;
    __int16 v8 = 1024;
    int v9 = a3;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "Changing target leg index from %d to %d", (uint8_t *)v7, 0xEu);
  }

  self->_unint64_t targetLegIndex = a3;
  [(GEORouteMatcher *)self->_routeMatcher setTargetLegIndex:a3];
}

- (void)setRequiresRoadNetworkData:(BOOL)a3
{
  self->_requiresRoadNetworkData = a3;
  -[GEORouteMatcher setRequiresRoadNetworkData:](self->_routeMatcher, "setRequiresRoadNetworkData:");
}

- (void)setShouldSnapRouteMatchToRoute:(BOOL)a3
{
  self->_shouldSnapRouteMatchToRoute = a3;
  [(GEORouteMatcher *)self->_routeMatcher setShouldSnapRouteMatchToRoute:"setShouldSnapRouteMatchToRoute:"];
}

- (int)transportType
{
  return 4;
}

- (void)resetToLocation:(id)a3
{
  routeMatcher = self->_routeMatcher;
  id v5 = a3;
  id v7 = [(GEORouteMatcher *)routeMatcher matchToRouteWithLocation:v5];
  [v7 setIsGoodMatch:1];
  v6 = +[GEONavigationMatchResult matchResultWithRouteMatch:v7 location:v5];

  [(GEONavigationMapMatcher *)self setPreviousMatchResult:v6];
}

- (void)setShouldWaitForSnappedSegments:(BOOL)a3
{
  self->_shouldWaitForSnappedSegments = a3;
  -[GEORouteMatcher setShouldWaitForSnappedSegments:](self->_routeMatcher, "setShouldWaitForSnappedSegments:");
}

- (void)setRoute:(id)a3
{
  id v7 = (GEOComposedRoute *)a3;
  if (self->_route != v7)
  {
    objc_storeStrong((id *)&self->_route, a3);
    [(GEONavigationMapMatcher *)self setPreviousMatchResult:0];
    id v5 = [(GEONavigationMapMatcher *)self _routeMatcherForRoute:v7];
    routeMatcher = self->_routeMatcher;
    self->_routeMatcher = v5;

    [(GEORouteMatcher *)self->_routeMatcher setRequiresRoadNetworkData:self->_requiresRoadNetworkData];
    [(GEORouteMatcher *)self->_routeMatcher setShouldSnapRouteMatchToRoute:self->_shouldSnapRouteMatchToRoute];
    [(GEORouteMatcher *)self->_routeMatcher setShouldWaitForSnappedSegments:self->_shouldWaitForSnappedSegments];
  }
}

- (void)setPreviousMatchResult:(id)a3
{
}

- (id)_routeMatcherForRoute:(id)a3
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEONavigationMatchResult)previousMatchResult
{
  return self->_previousMatchResult;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (BOOL)isSimulation
{
  return self->_isSimulation;
}

- (void)setIsSimulation:(BOOL)a3
{
  self->_isSimulation = a3;
}

- (GEORouteMatcher)routeMatcher
{
  return self->_routeMatcher;
}

- (void)setRouteMatcher:(id)a3
{
}

- (GEORoadMatcher)roadMatcher
{
  return self->_roadMatcher;
}

- (void)setRoadMatcher:(id)a3
{
}

- (GEOLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_roadMatcher, 0);
  objc_storeStrong((id *)&self->_routeMatcher, 0);
  objc_storeStrong((id *)&self->_previousMatchResult, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
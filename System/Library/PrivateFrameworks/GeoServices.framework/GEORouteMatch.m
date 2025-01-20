@interface GEORouteMatch
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate3D;
- ($F24F406B2B787EFB06265DBA3D28CBD5)locationCoordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringScore:(id)a3;
- (BOOL)isGoodMatch;
- (BOOL)isOnParkingLotRoad;
- (BOOL)isTunnelProjection;
- (BOOL)routeMatchBehind:(id)a3;
- (BOOL)routeMatchedToEnd;
- (BOOL)shouldProjectLocationAlongRoute;
- (GEOComposedRoute)route;
- (GEOComposedRouteLeg)leg;
- (GEOComposedRouteSegment)segment;
- (GEOComposedRouteStep)step;
- (GEOComposedTransitStationRouteStep)transitStationStep;
- (GEOComposedTransitTripRouteStep)transitTripStep;
- (GEOMapFeatureRoad)road;
- (GEOMatchedPathSegment)pathSegment;
- (GEONavigationMatchInfo)detailedMatchInfo;
- (GEORouteMatch)initWithCoder:(id)a3;
- (GEORouteMatch)initWithComposedRoute:(id)a3 routeStatus:(id)a4;
- (GEORouteMatch)initWithRoute:(id)a3 routeCoordinate:(PolylineCoordinate)a4 locationCoordinate:(id)a5 stepIndex:(unint64_t)a6 matchedCourse:(double)a7 timestamp:(id)a8;
- (GEORouteMatch)projectedFrom;
- (NSArray)candidateSteps;
- (NSDate)timestamp;
- (PolylineCoordinate)routeCoordinate;
- (double)distanceFromRoute;
- (double)distanceTraveledOffRoute;
- (double)matchedCourse;
- (double)modifiedCourseAccuracy;
- (double)modifiedHorizontalAccuracy;
- (double)roadWidth;
- (id).cxx_construct;
- (id)description;
- (unint64_t)consecutiveProgressionsOffRoute;
- (unint64_t)legIndex;
- (unint64_t)segmentIndex;
- (unint64_t)stepIndex;
- (unint64_t)transitID;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidateSteps:(id)a3;
- (void)setConsecutiveProgressionsOffRoute:(unint64_t)a3;
- (void)setDetailedMatchInfo:(id)a3;
- (void)setDistanceFromRoute:(double)a3;
- (void)setDistanceTraveledOffRoute:(double)a3;
- (void)setIsGoodMatch:(BOOL)a3;
- (void)setIsTunnelProjection:(BOOL)a3;
- (void)setLocationCoordinate3D:(id)a3;
- (void)setMatchedCourse:(double)a3;
- (void)setModifiedCourseAccuracy:(double)a3;
- (void)setModifiedHorizontalAccuracy:(double)a3;
- (void)setPathSegment:(id)a3;
- (void)setProjectedFrom:(id)a3;
- (void)setRoadWidth:(double)a3;
- (void)setRoute:(id)a3;
- (void)setRouteCoordinate:(PolylineCoordinate)a3;
- (void)setShouldProjectLocationAlongRoute:(BOOL)a3;
- (void)setStepIndex:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTransitID:(unint64_t)a3;
- (void)updateOffRouteProgress:(id)a3 minDistanceToGetOnRoute:(double)a4;
@end

@implementation GEORouteMatch

- (GEORouteMatch)initWithComposedRoute:(id)a3 routeStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (![v7 hasRouteLocationIndex]) {
      goto LABEL_9;
    }
    if (![v8 hasRouteLocationOffset]) {
      goto LABEL_9;
    }
    unsigned int v10 = [v8 routeLocationIndex];
    [v8 routeLocationOffset];
    unint64_t v12 = v10 | ((unint64_t)v11 << 32);
    [v6 pointAtRouteCoordinate:v12];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [v8 stepID];
    v20 = [v8 location];
    [v20 course];
    double v22 = v21;
    v23 = [MEMORY[0x1E4F1C9C8] date];
    self = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](self, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v6, v12, v19, v23, v14, v16, v18, v22);

    if (self)
    {
      if ([v8 hasDistanceToRoute])
      {
        -[GEORouteMatch setDistanceFromRoute:](self, "setDistanceFromRoute:", (double)[v8 distanceToRoute]);
        [(GEORouteMatch *)self distanceFromRoute];
        double v25 = v24;
        v26 = [v8 location];
        [v26 horizontalAccuracy];
        [(GEORouteMatch *)self setIsGoodMatch:v25 < v27 + 50.0];
      }
      self = self;
      v9 = self;
    }
    else
    {
LABEL_9:
      v9 = 0;
    }
  }

  return v9;
}

- (GEORouteMatch)initWithRoute:(id)a3 routeCoordinate:(PolylineCoordinate)a4 locationCoordinate:(id)a5 stepIndex:(unint64_t)a6 matchedCourse:(double)a7 timestamp:(id)a8
{
  double var2 = a5.var2;
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v17 = a3;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)GEORouteMatch;
  uint64_t v19 = [(GEORouteMatch *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_route, a3);
    v20->_locationCoordinate.latitude = var0;
    v20->_locationCoordinate.longitude = var1;
    v20->_locationCoordinate.altitude = var2;
    v20->_routeCoordinate = a4;
    v20->_stepIndex = a6;
    v20->_matchedCourse = a7;
    objc_storeStrong((id *)&v20->_timestamp, a8);
    v20->_consecutiveProgressionsOffRoute = 0;
    double v21 = [v17 stepAtIndex:a6];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v21, 0);
    candidateSteps = v20->_candidateSteps;
    v20->_candidateSteps = (NSArray *)v22;
  }
  return v20;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)locationCoordinate
{
  double latitude = self->_locationCoordinate.latitude;
  double longitude = self->_locationCoordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)updateOffRouteProgress:(id)a3 minDistanceToGetOnRoute:(double)a4
{
  id v18 = a3;
  if (v18)
  {
    if (![(GEORouteMatch *)self isGoodMatch])
    {
      [(GEORouteMatch *)self distanceFromRoute];
      if (v6 <= a4)
      {
        [v18 distanceFromRoute];
        if (v7 <= a4)
        {
          uint64_t v8 = [v18 routeCoordinate];
          PolylineCoordinate v9 = [(GEORouteMatch *)self routeCoordinate];
          if (v8 < v9.index || v8 == v9.index && *((float *)&v8 + 1) < v9.offset)
          {
            -[GEORouteMatch setConsecutiveProgressionsOffRoute:](self, "setConsecutiveProgressionsOffRoute:", [v18 consecutiveProgressionsOffRoute] + 1);
            [v18 distanceTraveledOffRoute];
            double v11 = v10;
            [v18 locationCoordinate];
            double v13 = v12;
            double v15 = v14;
            [(GEORouteMatch *)self locationCoordinate];
            [(GEORouteMatch *)self setDistanceTraveledOffRoute:(double)(v11 + GEOCalculateDistanceRadius(v13, v15, v16, v17, 6367000.0))];
          }
        }
      }
    }
  }
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  PolylineCoordinate v3 = a3;
  if ([(GEOComposedRoute *)self->_route pointCount] - 1 <= a3.index)
  {
    unint64_t v5 = 0;
    PolylineCoordinate v3 = (PolylineCoordinate)([(GEOComposedRoute *)self->_route pointCount] - 1);
  }
  else
  {
    unint64_t v5 = HIDWORD(*(unint64_t *)&v3);
  }
  self->_stepIndex = [(GEOComposedRoute *)self->_route stepIndexForRouteCoordinate:v3.index | (v5 << 32)];
  self->_routeCoordinate.index = v3.index;
  LODWORD(self->_routeCoordinate.offset) = v5;
  [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:*(void *)&self->_routeCoordinate];
  self->_locationCoordinate.double latitude = v6;
  self->_locationCoordinate.double longitude = v7;
  self->_locationCoordinate.altitude = v8;
  [(GEOComposedRoute *)self->_route courseAtRouteCoordinateIndex:v3];
  self->_matchedCourse = v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([(GEORouteMatch *)self isEqualIgnoringScore:v4])
  {
    double distanceFromRoute = self->_distanceFromRoute;
    [v4 distanceFromRoute];
    BOOL v7 = distanceFromRoute == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualIgnoringScore:(id)a3
{
  id v4 = (GEORouteMatch *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      BOOL v7 = v4;
      route = self->_route;
      double v9 = [(GEORouteMatch *)v7 route];
      BOOL v6 = route == v9
        && (uint64_t v10 = [(GEORouteMatch *)v7 routeCoordinate], self->_routeCoordinate.index == v10)
        && vabds_f32(self->_routeCoordinate.offset, *((float *)&v10 + 1)) < 0.00000011921
        && (double latitude = self->_locationCoordinate.latitude,
            double longitude = self->_locationCoordinate.longitude,
            double altitude = self->_locationCoordinate.altitude,
            [(GEORouteMatch *)v7 locationCoordinate3D],
            vabdd_f64(latitude, v16) < 0.00000000999999994)
        && vabdd_f64(longitude, v14) < 0.00000000999999994
        && vabdd_f64(altitude, v15) < 0.00000000999999994;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)routeMatchBehind:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_route == (GEOComposedRoute *)*((void *)v4 + 1))
  {
    PolylineCoordinate v7 = [(GEORouteMatch *)self routeCoordinate];
    uint64_t v8 = [v5 routeCoordinate];
    BOOL v10 = v7.offset < *((float *)&v8 + 1) && v7.index == v8;
    BOOL v6 = v7.index < v8 || v10;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)routeMatchedToEnd
{
  return self->_routeCoordinate.index == [(GEOComposedRoute *)self->_route pointCount] - 1
      && fabsf(self->_routeCoordinate.offset) < 0.00000011921;
}

- (GEOMapFeatureRoad)road
{
  return [(GEOMatchedPathSegment *)self->_pathSegment road];
}

- (BOOL)isOnParkingLotRoad
{
  PolylineCoordinate v3 = [(GEORouteMatch *)self road];

  if (!v3) {
    return 0;
  }
  id v4 = [(GEORouteMatch *)self road];
  unsigned int v5 = [v4 formOfWay];

  if (v5 >= 0xD) {
    return 0;
  }
  else {
    return (0x10C0u >> v5) & 1;
  }
}

- (GEOComposedRouteStep)step
{
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[GEOComposedRoute stepAtIndex:](self->_route, "stepAtIndex:");
  }

  return (GEOComposedRouteStep *)v2;
}

- (GEOComposedTransitTripRouteStep)transitTripStep
{
  v2 = [(GEORouteMatch *)self step];
  if ([v2 routeSegmentType] == 6) {
    PolylineCoordinate v3 = v2;
  }
  else {
    PolylineCoordinate v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (GEOComposedTransitStationRouteStep)transitStationStep
{
  v2 = [(GEORouteMatch *)self step];
  if ([v2 routeSegmentType] == 5) {
    PolylineCoordinate v3 = v2;
  }
  else {
    PolylineCoordinate v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (unint64_t)segmentIndex
{
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return -[GEOComposedRoute segmentIndexForStepIndex:](self->_route, "segmentIndexForStepIndex:");
  }
}

- (GEOComposedRouteSegment)segment
{
  unint64_t v3 = [(GEORouteMatch *)self segmentIndex];
  id v4 = [(GEOComposedRoute *)self->_route segments];
  if (v3 >= [v4 count])
  {
    BOOL v6 = 0;
  }
  else
  {
    unsigned int v5 = [(GEOComposedRoute *)self->_route segments];
    BOOL v6 = [v5 objectAtIndexedSubscript:v3];
  }

  return (GEOComposedRouteSegment *)v6;
}

- (unint64_t)legIndex
{
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return -[GEOComposedRoute legIndexForStepIndex:](self->_route, "legIndexForStepIndex:");
  }
}

- (GEOComposedRouteLeg)leg
{
  unint64_t v3 = [(GEORouteMatch *)self legIndex];
  id v4 = [(GEOComposedRoute *)self->_route legs];
  if (v3 >= [v4 count])
  {
    BOOL v6 = 0;
  }
  else
  {
    unsigned int v5 = [(GEOComposedRoute *)self->_route legs];
    BOOL v6 = [v5 objectAtIndexedSubscript:v3];
  }

  return (GEOComposedRouteLeg *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteMatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEORouteMatch;
  unsigned int v5 = [(GEORouteMatch *)&v21 init];
  if (v5)
  {
    unint64_t v20 = 0;
    id v6 = v4;
    PolylineCoordinate v7 = (const void *)[v6 decodeBytesForKey:@"_routeCoordinate" returnedLength:&v20];
    if (v20 && v7)
    {
      if (v20 >= 8) {
        size_t v8 = 8;
      }
      else {
        size_t v8 = v20;
      }
      memcpy(&v5->_routeCoordinate, v7, v8);
    }
    unint64_t v20 = 0;
    id v9 = v6;
    BOOL v10 = (const void *)[v9 decodeBytesForKey:@"_locationCoordinate" returnedLength:&v20];
    if (v20 && v10)
    {
      if (v20 >= 0x18) {
        size_t v11 = 24;
      }
      else {
        size_t v11 = v20;
      }
      memcpy(&v5->_locationCoordinate, v10, v11);
    }
    v5->_stepIndex = [v9 decodeIntegerForKey:@"_stepIndex"];
    [v9 decodeDoubleForKey:@"_matchedCourse"];
    v5->_matchedCourse = v12;
    [v9 decodeDoubleForKey:@"_distanceFromRoute"];
    v5->_double distanceFromRoute = v13;
    [v9 decodeDoubleForKey:@"_modifiedHorizontalAccuracy"];
    v5->_modifiedHorizontalAccuracy = v14;
    [v9 decodeDoubleForKey:@"_modifiedCourseAccuracy"];
    v5->_modifiedCourseAccuracy = v15;
    v5->_isGoodMatch = [v9 decodeBoolForKey:@"_isGoodMatch"];
    v5->_shouldProjectLocationAlongRoute = [v9 decodeBoolForKey:@"_shouldProjectLocationAlongRoute"];
    uint64_t v16 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"_timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    v5->_transitID = [v9 decodeIntegerForKey:@"_transitID"];
    v5->_isTunnelProjection = [v9 decodeBoolForKey:@"_isTunnelProjection"];
    id v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBytes:&self->_routeCoordinate length:8 forKey:@"_routeCoordinate"];
  [v4 encodeBytes:&self->_locationCoordinate length:24 forKey:@"_locationCoordinate"];
  [v4 encodeInteger:self->_stepIndex forKey:@"_stepIndex"];
  [v4 encodeDouble:@"_matchedCourse" forKey:self->_matchedCourse];
  [v4 encodeDouble:@"_distanceFromRoute" forKey:self->_distanceFromRoute];
  [v4 encodeDouble:@"_modifiedHorizontalAccuracy" forKey:self->_modifiedHorizontalAccuracy];
  [v4 encodeDouble:@"_modifiedCourseAccuracy" forKey:self->_modifiedCourseAccuracy];
  [v4 encodeBool:self->_isGoodMatch forKey:@"_isGoodMatch"];
  [v4 encodeBool:self->_shouldProjectLocationAlongRoute forKey:@"_shouldProjectLocationAlongRoute"];
  [v4 encodeObject:self->_timestamp forKey:@"_timestamp"];
  [v4 encodeInteger:self->_transitID forKey:@"_transitID"];
  [v4 encodeBool:self->_isTunnelProjection forKey:@"_isTunnelProjection"];
}

- (id)description
{
  uint64_t v2 = (uint64_t)self;
  unint64_t consecutiveProgressionsOffRoute = self->_consecutiveProgressionsOffRoute;
  if (consecutiveProgressionsOffRoute)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ORP:%lu/%f ", consecutiveProgressionsOffRoute, *(void *)&self->_distanceTraveledOffRoute);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_1ED51F370;
  }
  unsigned int v5 = NSString;
  if (*(unsigned char *)(v2 + 112)) {
    id v6 = "Good";
  }
  else {
    id v6 = "Poor";
  }
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t v9 = *(void *)(v2 + 48);
  unsigned int v10 = *(_DWORD *)(v2 + 40);
  float v11 = *(float *)(v2 + 44);
  uint64_t v12 = *(void *)(v2 + 80);
  uint64_t v13 = *(void *)(v2 + 88);
  uint64_t v14 = *(void *)(v2 + 64);
  uint64_t v15 = *(void *)(v2 + 72);
  uint64_t v16 = [(id)v2 road];
  if (v16)
  {
    uint64_t v2 = [(id)v2 road];
    double v17 = [(id)v2 internalRoadName];
  }
  else
  {
    double v17 = @"unknown";
  }
  id v18 = [v5 stringWithFormat:@"%s RM: %f,%f SI:%lu PT:%f C:%f HA:%f CA:%f DR:%lf %@RD:%@", v6, v7, v8, v9, (float)(v11 + (float)v10), v14, v12, v13, v15, v4, v17];
  if (v16)
  {
  }

  return v18;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate3D
{
  double latitude = self->_locationCoordinate.latitude;
  double longitude = self->_locationCoordinate.longitude;
  double altitude = self->_locationCoordinate.altitude;
  result.double var2 = altitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)setLocationCoordinate3D:(id)a3
{
  self->_locationCoordinate = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (NSArray)candidateSteps
{
  return self->_candidateSteps;
}

- (void)setCandidateSteps:(id)a3
{
}

- (double)matchedCourse
{
  return self->_matchedCourse;
}

- (void)setMatchedCourse:(double)a3
{
  self->_matchedCourse = a3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (GEOMatchedPathSegment)pathSegment
{
  return self->_pathSegment;
}

- (void)setPathSegment:(id)a3
{
}

- (double)roadWidth
{
  return self->_roadWidth;
}

- (void)setRoadWidth:(double)a3
{
  self->_roadWidth = a3;
}

- (double)distanceFromRoute
{
  return self->_distanceFromRoute;
}

- (void)setDistanceFromRoute:(double)a3
{
  self->_double distanceFromRoute = a3;
}

- (double)modifiedHorizontalAccuracy
{
  return self->_modifiedHorizontalAccuracy;
}

- (void)setModifiedHorizontalAccuracy:(double)a3
{
  self->_modifiedHorizontalAccuracy = a3;
}

- (double)modifiedCourseAccuracy
{
  return self->_modifiedCourseAccuracy;
}

- (void)setModifiedCourseAccuracy:(double)a3
{
  self->_modifiedCourseAccuracy = a3;
}

- (GEORouteMatch)projectedFrom
{
  return self->_projectedFrom;
}

- (void)setProjectedFrom:(id)a3
{
}

- (BOOL)isGoodMatch
{
  return self->_isGoodMatch;
}

- (void)setIsGoodMatch:(BOOL)a3
{
  self->_isGoodMatch = a3;
}

- (BOOL)shouldProjectLocationAlongRoute
{
  return self->_shouldProjectLocationAlongRoute;
}

- (void)setShouldProjectLocationAlongRoute:(BOOL)a3
{
  self->_shouldProjectLocationAlongRoute = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (unint64_t)consecutiveProgressionsOffRoute
{
  return self->_consecutiveProgressionsOffRoute;
}

- (void)setConsecutiveProgressionsOffRoute:(unint64_t)a3
{
  self->_unint64_t consecutiveProgressionsOffRoute = a3;
}

- (double)distanceTraveledOffRoute
{
  return self->_distanceTraveledOffRoute;
}

- (void)setDistanceTraveledOffRoute:(double)a3
{
  self->_distanceTraveledOffRoute = a3;
}

- (unint64_t)transitID
{
  return self->_transitID;
}

- (void)setTransitID:(unint64_t)a3
{
  self->_transitID = a3;
}

- (BOOL)isTunnelProjection
{
  return self->_isTunnelProjection;
}

- (void)setIsTunnelProjection:(BOOL)a3
{
  self->_isTunnelProjection = a3;
}

- (GEONavigationMatchInfo)detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (void)setDetailedMatchInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_projectedFrom, 0);
  objc_storeStrong((id *)&self->_pathSegment, 0);
  objc_storeStrong((id *)&self->_candidateSteps, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0xBF80000000000000;
  return self;
}

@end
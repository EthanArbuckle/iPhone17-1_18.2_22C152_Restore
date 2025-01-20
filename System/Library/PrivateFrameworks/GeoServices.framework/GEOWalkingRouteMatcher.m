@interface GEOWalkingRouteMatcher
- (BOOL)_supportsSnapping;
- (GEOWalkingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4;
- (double)_distanceFromRouteForLocation:(id)a3 withinRange:(GEOPolylineCoordinateRange)a4 outRouteCoordinate:(PolylineCoordinate *)a5;
- (double)_followingRouteScoreForRouteCoordinate:(PolylineCoordinate)a3;
- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousMatchGood:(BOOL)a5;
- (double)_scoreForCandidateWithScoreInfos:(id)a3;
- (id).cxx_construct;
- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5;
- (id)_contiguousSegmentsForCandidates:(id)a3;
- (id)_courseScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5;
- (id)_distanceScoreInfoForSegment:(id)a3 location:(id)a4 distanceFromSegment:(double)a5;
- (id)_distanceTraveledScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5;
- (id)_firstTimeOnRouteScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5;
- (id)_nearStartOfStepScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5;
- (id)_nearTurnAroundManeuverScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5;
- (id)_topRouteMatchCandidate;
- (void)_addRecentLocation:(id)a3 isOnRoute:(BOOL)a4;
- (void)_considerCandidateMatch:(id)a3;
- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (void)_resetExpectedCoordinateRange;
- (void)_resetExpectedCoordinateRangeIfNecessary;
- (void)_startRouteMatch;
- (void)_updateNearbyTurnAroundManeuver;
@end

@implementation GEOWalkingRouteMatcher

- (GEOWalkingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOWalkingRouteMatcher;
  v8 = [(GEORouteMatcher *)&v15 initWithRoute:v6 auditToken:v7];
  v9 = v8;
  if (v8)
  {
    [(GEORouteMatcher *)v8 setShouldSnapRouteMatchToRoute:1];
    v10 = [v6 steps];
    uint64_t v11 = objc_msgSend(v10, "_geo_compactMap:", &__block_literal_global_40);
    turnAroundManeuverInfos = v9->_turnAroundManeuverInfos;
    v9->_turnAroundManeuverInfos = (NSArray *)v11;

    v9->_lastReferenceCoordinate = (PolylineCoordinate)0xBF80000000000000;
    v13 = v9;
  }

  return v9;
}

_GEOWalkingRouteMatcherTurnAroundManeuverInfo *__51__GEOWalkingRouteMatcher_initWithRoute_auditToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[_GEOWalkingRouteMatcherTurnAroundManeuverInfo alloc] initWithStep:v2];

  return v3;
}

- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousMatchGood:(BOOL)a5
{
  if (a5) {
    double v6 = 30.0;
  }
  else {
    double v6 = 15.0;
  }
  if (a5) {
    double v7 = 3.0;
  }
  else {
    double v7 = 2.0;
  }
  [(GEORouteMatcher *)self roadWidthForRouteCoordinate:a4];
  double v9 = v8 * 0.5;
  double v10 = v7 * a3;
  if (a3 < 0.0) {
    double v10 = v6;
  }
  double result = v10 + 10.0 + v9;
  if (result > 100.0) {
    return 100.0;
  }
  return result;
}

- (id)_distanceScoreInfoForSegment:(id)a3 location:(id)a4 distanceFromSegment:(double)a5
{
  double v8 = (unsigned int *)a3;
  id v9 = a4;
  [v9 horizontalAccuracy];
  double v10 = 20.0;
  if (v11 > 20.0)
  {
    [v9 horizontalAccuracy];
    double v10 = v12;
  }
  if (v8) {
    uint64_t v13 = v8[2];
  }
  else {
    uint64_t v13 = 0;
  }
  [(GEORouteMatcher *)self roadWidthForRouteCoordinate:v13];
  double v15 = v10 + v14 * 0.5;
  if (v15 >= a5)
  {
    float v19 = a5 / v15;
    double v20 = v19;
    if (v20 < 0.0) {
      double v20 = 0.0;
    }
    if (v20 > 1.0) {
      double v20 = 1.0;
    }
    uint64_t v18 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](v20 * -0.25 + 1.0, 1.0, (uint64_t)_GEORouteMatcherScoreInfo, 1);
  }
  else
  {
    BOOL v16 = [(GEORouteMatcher *)self hasBeenOnRouteOnce];
    double v17 = v15 + 35.0;
    if (!v16) {
      double v17 = v15;
    }
    if (v17 >= a5)
    {
      float v21 = (a5 - v15) / (v17 - v15);
      double v22 = v21;
      if (v22 < 0.0) {
        double v22 = 0.0;
      }
      if (v22 > 1.0) {
        double v22 = 1.0;
      }
      uint64_t v18 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](v22 * -0.75 + 0.75, 1.0, (uint64_t)_GEORouteMatcherScoreInfo, 1);
    }
    else
    {
      uint64_t v18 = +[_GEORouteMatcherScoreInfo doNotMatchToThisSegmentWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 1);
    }
  }
  v23 = (void *)v18;

  return v23;
}

- (id)_distanceTraveledScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  if (![(GEORouteMatcher *)self hasBeenOnRouteOnce])
  {
    uint64_t v13 = +[_GEORouteMatcherScoreInfo ignoredWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 2);
    goto LABEL_25;
  }
  double v7 = [(GEORouteMatcher *)self route];
  [v7 distanceFromStartToRouteCoordinate:a5];
  uint64_t v9 = v8;

  p_expectedCoordinateRange = &self->_expectedCoordinateRange;
  PolylineCoordinate start = self->_expectedCoordinateRange.start;
  PolylineCoordinate end = self->_expectedCoordinateRange.end;
  if (start.index != a5.index)
  {
    if (start.index >= a5.index) {
      goto LABEL_10;
    }
LABEL_6:
    if (a5.index == end.index)
    {
      if (a5.offset > end.offset) {
        goto LABEL_10;
      }
    }
    else if (a5.index >= end.index)
    {
      goto LABEL_10;
    }
    uint64_t v13 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](1.0, 1.5, (uint64_t)_GEORouteMatcherScoreInfo, 2);
LABEL_25:
    double v22 = (void *)v13;
    goto LABEL_26;
  }
  if (start.offset <= a5.offset) {
    goto LABEL_6;
  }
LABEL_10:
  PolylineCoordinate v14 = self->_tolerableCoordinateRange.start;
  PolylineCoordinate v15 = self->_tolerableCoordinateRange.end;
  if (v14.index == a5.index)
  {
    if (v14.offset > a5.offset) {
      goto LABEL_24;
    }
  }
  else if (v14.index >= a5.index)
  {
    goto LABEL_24;
  }
  if (a5.index != v15.index)
  {
    if (a5.index < v15.index) {
      goto LABEL_16;
    }
LABEL_24:
    uint64_t v13 = +[_GEORouteMatcherScoreInfo doNotMatchToThisSegmentWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 2);
    goto LABEL_25;
  }
  if (a5.offset > v15.offset) {
    goto LABEL_24;
  }
LABEL_16:
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __95__GEOWalkingRouteMatcher__distanceTraveledScoreInfoForSegment_location_currentRouteCoordinate___block_invoke;
  v28[3] = &unk_1E53DE058;
  v28[4] = self;
  v28[5] = v9;
  uint64_t v16 = MEMORY[0x18C120660](v28);
  float v19 = (void *)v16;
  if (p_expectedCoordinateRange->start.index > a5.index
    || p_expectedCoordinateRange->start.index == a5.index && self->_expectedCoordinateRange.start.offset > a5.offset)
  {
    p_possibleCoordinateRange = &self->_possibleCoordinateRange;
    unsigned int index = self->_possibleCoordinateRange.start.index;
    if (index <= a5.index)
    {
      v18.n128_u64[0] = 0;
      v17.n128_u64[0] = 1.0;
      if (index != a5.index || self->_possibleCoordinateRange.start.offset <= a5.offset)
      {
LABEL_40:
        uint64_t v26 = (*(void (**)(uint64_t, void, void, __n128, __n128))(v16 + 16))(v16, *(void *)&p_expectedCoordinateRange->start, *(void *)&p_possibleCoordinateRange->start, v17, v18);
        goto LABEL_41;
      }
    }
  }
  else
  {
    unsigned int v24 = self->_expectedCoordinateRange.end.index;
    if (v24 < a5.index || v24 == a5.index && self->_expectedCoordinateRange.end.offset < a5.offset)
    {
      p_possibleCoordinateRange = (GEOPolylineCoordinateRange *)&self->_possibleCoordinateRange.end;
      unsigned int v25 = self->_possibleCoordinateRange.end.index;
      v18.n128_u64[0] = -1.0;
      v17.n128_u64[0] = 0;
      if (v25 < a5.index || v25 == a5.index && self->_possibleCoordinateRange.end.offset < a5.offset)
      {
        p_expectedCoordinateRange = (GEOPolylineCoordinateRange *)&self->_possibleCoordinateRange.end;
        p_possibleCoordinateRange = (GEOPolylineCoordinateRange *)&self->_tolerableCoordinateRange.end;
      }
      else
      {
        v18.n128_u64[0] = 0;
        v17.n128_u64[0] = 1.0;
        p_expectedCoordinateRange = (GEOPolylineCoordinateRange *)&self->_expectedCoordinateRange.end;
      }
      goto LABEL_40;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Should not reach here.", v27, 2u);
    }
  }
  uint64_t v26 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](-1.0, 1.5, (uint64_t)_GEORouteMatcherScoreInfo, 2);
LABEL_41:
  double v22 = (void *)v26;

LABEL_26:

  return v22;
}

id __95__GEOWalkingRouteMatcher__distanceTraveledScoreInfoForSegment_location_currentRouteCoordinate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  double v10 = [*(id *)(a1 + 32) route];
  [v10 distanceFromStartToRouteCoordinate:a2];
  double v12 = v11;

  uint64_t v13 = [*(id *)(a1 + 32) route];
  [v13 distanceFromStartToRouteCoordinate:a3];
  double v15 = v14;

  float v16 = (*(double *)(a1 + 40) - v12) / (v15 - v12);
  double v17 = v16;
  if (v17 < 0.0) {
    double v17 = 0.0;
  }
  if (v17 > 1.0) {
    double v17 = 1.0;
  }
  double v18 = a4 + (a5 - a4) * v17;

  return +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](v18, 1.5, (uint64_t)_GEORouteMatcherScoreInfo, 2);
}

- (id)_courseScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  id v7 = a4;
  [v7 course];
  if (v8 >= 0.0 && ([v7 hasAccurateCourse] & 1) != 0)
  {
    [v7 courseAccuracy];
    BOOL v10 = v9 < 70.0;
    double v11 = [(GEORouteMatcher *)self route];
    [v11 courseAtRouteCoordinateIndex:a5];
    double v13 = v12;

    [v7 course];
    double v14 = dbl_18A632220[v10];
    long double v16 = fmod(v13 - v15 + 180.0, 360.0);
    float v17 = (fabs(fmod(v16 + 360.0, 360.0) + -180.0) + -15.0) / 60.0;
    double v18 = v17;
    if (v18 < 0.0) {
      double v18 = 0.0;
    }
    if (v18 > 1.0) {
      double v18 = 1.0;
    }
    uint64_t v19 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](1.0 - v18, v14, (uint64_t)_GEORouteMatcherScoreInfo, 3);
  }
  else
  {
    uint64_t v19 = +[_GEORouteMatcherScoreInfo ignoredWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 3);
  }
  double v20 = (void *)v19;

  return v20;
}

- (id)_nearStartOfStepScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  id v7 = a3;
  double v8 = [(GEORouteMatcher *)self previousRouteMatch];
  char v9 = [v8 isGoodMatch];

  if (v9)
  {
    BOOL v10 = [(GEORouteMatcher *)self previousRouteMatch];
    double v11 = [v10 step];

    id v12 = [v11 getNextStep];
    if (!v12) {
      goto LABEL_9;
    }
    double v13 = [(GEORouteMatcher *)self route];
    uint64_t v14 = objc_msgSend(v13, "legIndexForStepIndex:", objc_msgSend(v11, "stepIndex"));
    double v15 = [(GEORouteMatcher *)self route];
    uint64_t v16 = objc_msgSend(v15, "legIndexForStepIndex:", objc_msgSend(v12, "stepIndex"));

    if (v14 != v16) {
      goto LABEL_9;
    }
    float v17 = v7 ? (void *)v7[7] : 0;
    id v18 = v17;

    if (v18 != v12) {
      goto LABEL_9;
    }
    uint64_t v22 = [v12 startRouteCoordinate];
    v23 = [(GEORouteMatcher *)self route];
    [v23 distanceBetweenRouteCoordinate:v22 andRouteCoordinate:a5];
    double v25 = v24;

    if (v25 >= 0.0 && v25 <= 20.0)
    {
      uint64_t v20 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](1.0, 1.3, (uint64_t)_GEORouteMatcherScoreInfo, 4);
    }
    else
    {
LABEL_9:
      uint64_t v20 = +[_GEORouteMatcherScoreInfo ignoredWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 4);
    }
    uint64_t v19 = (void *)v20;
  }
  else
  {
    uint64_t v19 = +[_GEORouteMatcherScoreInfo ignoredWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 4);
  }

  return v19;
}

- (id)_nearTurnAroundManeuverScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_nearbyTurnAroundManeuverInfo) {
    goto LABEL_9;
  }
  if (v7) {
    char v9 = (void *)v7[7];
  }
  else {
    char v9 = 0;
  }
  id v10 = v9;
  unint64_t v11 = [v10 stepIndex];

  nearbyTurnAroundManeuverInfo = self->_nearbyTurnAroundManeuverInfo;
  if (nearbyTurnAroundManeuverInfo) {
    step = nearbyTurnAroundManeuverInfo->_step;
  }
  else {
    step = 0;
  }
  unint64_t v14 = [(GEOComposedRouteStep *)step stepIndex];
  if (v11 != v14 + 1)
  {
    double v15 = -1.0;
    if (v11 <= v14) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v16 = +[_GEORouteMatcherScoreInfo ignoredWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 5);
    goto LABEL_11;
  }
  double v15 = 1.0;
LABEL_10:
  uint64_t v16 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](v15, 1.5, (uint64_t)_GEORouteMatcherScoreInfo, 5);
LABEL_11:
  float v17 = (void *)v16;

  return v17;
}

- (id)_firstTimeOnRouteScoreInfoForSegment:(id)a3 location:(id)a4 currentRouteCoordinate:(PolylineCoordinate)a5
{
  if (![(GEORouteMatcher *)self hasBeenOnRouteOnce])
  {
    PolylineCoordinate start = self->_tolerableCoordinateRange.start;
    PolylineCoordinate end = self->_tolerableCoordinateRange.end;
    *(float *)&double v7 = a5.offset;
    if (start.index == a5.index)
    {
      LODWORD(v8) = HIDWORD(*(void *)&self->_tolerableCoordinateRange.start);
      if (start.offset > a5.offset) {
        goto LABEL_10;
      }
    }
    else if (start.index >= a5.index)
    {
      goto LABEL_10;
    }
    if (a5.index == end.index)
    {
      LODWORD(v8) = HIDWORD(*(void *)&self->_tolerableCoordinateRange.end);
      if (a5.offset <= end.offset)
      {
LABEL_8:
        double v11 = 1.7;
        double v12 = 0.0;
LABEL_23:
        uint64_t v20 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](v12, v11, (uint64_t)_GEORouteMatcherScoreInfo, 6);
        goto LABEL_24;
      }
    }
    else if (a5.index < end.index)
    {
      goto LABEL_8;
    }
LABEL_10:
    double v13 = [(GEORouteMatcher *)self route];
    [v13 distanceFromStartToRouteCoordinate:a5];
    double v15 = v14;

    uint64_t v16 = [(GEORouteMatcher *)self route];
    [v16 distance];
    double v18 = v17;

    double v19 = v18 + -804.672;
    if (v18 <= 1609.344) {
      double v19 = v18 * 0.5;
    }
    if (v19 < 804.672) {
      double v19 = 804.672;
    }
    if (v19 > v18) {
      double v19 = v18;
    }
    if (v15 > v19)
    {
      uint64_t v20 = +[_GEORouteMatcherScoreInfo doNotMatchToThisSegmentWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 6);
      goto LABEL_24;
    }
    float v21 = v15 / v19;
    double v22 = v21;
    if (v22 < 0.0) {
      double v22 = 0.0;
    }
    if (v22 > 1.0) {
      double v22 = 1.0;
    }
    double v12 = 0.0 - v22;
    double v11 = 0.9;
    goto LABEL_23;
  }
  uint64_t v20 = +[_GEORouteMatcherScoreInfo ignoredWithType:]((uint64_t)_GEORouteMatcherScoreInfo, 6);
LABEL_24:

  return v20;
}

- (double)_scoreForCandidateWithScoreInfos:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        if (v9)
        {
          double v10 = *(double *)(v9 + 24);
          double v11 = *(double *)(v9 + 16) * v10;
        }
        else
        {
          double v11 = 0.0;
          double v10 = 0.0;
        }
        double v7 = v7 + v11;
        double v6 = v6 + v10;
        ++v8;
      }
      while (v4 != v8);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v4 = v12;
    }
    while (v12);
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
  }

  double v13 = -1.0;
  if (fabs(v6) >= 0.00000001)
  {
    double v14 = v7 / v6;
    if (v7 / v6 < -1.0) {
      double v14 = -1.0;
    }
    if (v14 <= 1.0) {
      double v13 = v14;
    }
    else {
      double v13 = 1.0;
    }
  }

  return v13;
}

- (void)_updateNearbyTurnAroundManeuver
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_nearbyTurnAroundManeuverInfo = &self->_nearbyTurnAroundManeuverInfo;
  nearbyTurnAroundManeuverInfo = self->_nearbyTurnAroundManeuverInfo;
  self->_nearbyTurnAroundManeuverInfo = 0;

  uint64_t v5 = [(GEORouteMatcher *)self currentLocation];
  [v5 horizontalAccuracy];
  double v7 = v6;

  if (v7 < 20.0)
  {
    uint64_t v8 = [(GEORouteMatcher *)self lastGoodRouteMatch];
    if (v8)
    {
      uint64_t v9 = [(GEORouteMatcher *)self lastGoodRouteMatch];
      uint64_t v10 = [v9 stepIndex];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v11 = [(GEORouteMatcher *)self currentLocation];
        [v11 coordinate];
        double v13 = v12;
        double v15 = v14;

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v16 = self->_turnAroundManeuverInfos;
        uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v29;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
              if (v20) {
                uint64_t v21 = (void *)v20[1];
              }
              else {
                uint64_t v21 = 0;
              }
              id v22 = v21;
              objc_msgSend(v22, "endGeoCoordinate", (void)v28);
              double v24 = v23;
              double v26 = v25;

              if (GEOCalculateDistanceRadius(v13, v15, v24, v26, 6367000.0) < 20.0)
              {
                objc_storeStrong((id *)p_nearbyTurnAroundManeuverInfo, v20);
                goto LABEL_18;
              }
              ++v19;
            }
            while (v17 != v19);
            uint64_t v27 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
            uint64_t v17 = v27;
          }
          while (v27);
        }
LABEL_18:
      }
    }
  }
}

- (void)_resetExpectedCoordinateRangeIfNecessary
{
  if ((unint64_t)[(NSMutableArray *)self->_recentLocations count] >= 0xF)
  {
    uint64_t v3 = -1;
    while (1)
    {
      uint64_t v4 = [(NSMutableArray *)self->_recentLocations objectAtIndexedSubscript:[(NSMutableArray *)self->_recentLocations count] + v3];
      if (v4)
      {
        int v5 = v4[8];

        if (v5) {
          break;
        }
      }
      if (--v3 == -16)
      {
        double v6 = [(GEORouteMatcher *)self closestCandidateRouteMatch];
        if (v6) {
          uint64_t v7 = v6[3];
        }
        else {
          uint64_t v7 = 0;
        }

        [(GEOWalkingRouteMatcher *)self _followingRouteScoreForRouteCoordinate:v7];
        if (v8 > 0.75)
        {
          [(GEOWalkingRouteMatcher *)self _resetExpectedCoordinateRange];
        }
        return;
      }
    }
  }
}

- (void)_resetExpectedCoordinateRange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEORouteMatcher *)self route];
  uint64_t v4 = [(GEORouteMatcher *)self closestCandidateRouteMatch];
  if (v4) {
    PolylineCoordinate v5 = (PolylineCoordinate)v4[3];
  }
  else {
    PolylineCoordinate v5 = 0;
  }

  self->_lastReferenceCoordinate = v5;
  p_expectedCoordinateRange = (uint64_t *)&self->_expectedCoordinateRange;
  self->_expectedCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)[v3 routeCoordinateForDistance:v5 beforeRouteCoordinate:50.0];
  self->_expectedCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)[v3 routeCoordinateForDistance:v5 afterRouteCoordinate:50.0];
  self->_possibleCoordinateRange = self->_expectedCoordinateRange;
  self->_tolerableCoordinateRange = self->_expectedCoordinateRange;
  uint64_t v7 = GEOGetGEORouteMatcherLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = GEOPolylineCoordinateRangeAsString(*p_expectedCoordinateRange, p_expectedCoordinateRange[1], v8);
    int v10 = 138412290;
    double v11 = v9;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Resetting the expected coordinate range to [%@] because we think the user is following the route.", (uint8_t *)&v10, 0xCu);
  }
}

- (id)_contiguousSegmentsForCandidates:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if ([v27 count])
  {
    [MEMORY[0x1E4F1CA48] array];
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__17;
    double v25 = v49 = __Block_byref_object_dispose__17;
    id v50 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v37 = 0;
    v38 = (double *)&v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0x7FEFFFFFFFFFFFFFLL;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __59__GEOWalkingRouteMatcher__contiguousSegmentsForCandidates___block_invoke;
    v32[3] = &unk_1E53DE080;
    v34 = &v45;
    v35 = &v41;
    id v26 = v25;
    id v33 = v26;
    v36 = &v37;
    uint64_t v3 = (void (**)(void))MEMORY[0x18C120660](v32);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = v27;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v51 count:16];
    if (!v5) {
      goto LABEL_28;
    }
    uint64_t v6 = *(void *)v29;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * v7);
        uint64_t v9 = [(id)v46[5] lastObject];
        int v10 = (void *)v9;
        if (v9)
        {
          id v11 = *(id *)(v9 + 128);
          uint64_t v12 = v11;
          if (v11)
          {
            unsigned int v13 = *((_DWORD *)v11 + 2);
            float v14 = *((float *)v11 + 4);
            if (v14 >= 1.0)
            {
              v13 += vcvtms_u32_f32(v14);
              float v14 = v14 - (float)floorf(v14);
            }
            if (v8)
            {
LABEL_12:
              id v15 = *(id *)(v8 + 128);
              if (v15)
              {
                unsigned int v16 = *((_DWORD *)v15 + 2);
                float v17 = *((float *)v15 + 3);
                if (v17 >= 1.0)
                {
                  v16 += vcvtms_u32_f32(v17);
                  float v17 = v17 - (float)floorf(v17);
                }
                goto LABEL_15;
              }
LABEL_26:
              unsigned int v16 = 0;
              float v17 = 0.0;
LABEL_15:
              BOOL v18 = vabds_f32(v14 + (float)v13, v17 + (float)v16) < 0.001;

              if (!v18) {
                v3[2](v3);
              }
              goto LABEL_17;
            }
          }
          else
          {
            unsigned int v13 = 0;
            float v14 = 0.0;
            if (v8) {
              goto LABEL_12;
            }
          }
          id v15 = 0;
          goto LABEL_26;
        }
LABEL_17:
        if (v8)
        {
          double v19 = *(double *)(v8 + 40);
          uint64_t v20 = v38 + 3;
          if (v19 >= v38[3]) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
        uint64_t v20 = v38 + 3;
        if (v38[3] > 0.0)
        {
          double v19 = 0.0;
LABEL_19:
          *uint64_t v20 = v19;
          uint64_t v21 = [(id)v46[5] count];
          v42[3] = v21;
        }
LABEL_20:
        [(id)v46[5] addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v22 = [v4 countByEnumeratingWithState:&v28 objects:v51 count:16];
      uint64_t v5 = v22;
      if (!v22)
      {
LABEL_28:

        v3[2](v3);
        id v23 = v26;

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v45, 8);

        goto LABEL_29;
      }
    }
  }
  id v23 = 0;
LABEL_29:

  return v23;
}

void __59__GEOWalkingRouteMatcher__contiguousSegmentsForCandidates___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)v2;
  uint64_t v7 = (void *)v2;
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 8), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v3 = v7;
    v7[2] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  [*(id *)(a1 + 32) addObject:v3];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
}

- (void)_startRouteMatch
{
  uint64_t v3 = [(GEORouteMatcher *)self lastGoodRouteMatch];
  uint64_t v4 = [(GEORouteMatcher *)self route];
  uint64_t v5 = [v4 uniqueRouteID];
  uint64_t v6 = [v3 route];
  uint64_t v7 = [v6 uniqueRouteID];
  char v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {

    uint64_t v3 = 0;
  }
  [(GEOWalkingRouteMatcher *)self _updateNearbyTurnAroundManeuver];
  if (!v3)
  {
    self->_expectedCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    self->_possibleCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    self->_tolerableCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    self->_PolylineCoordinate lastReferenceCoordinate = (PolylineCoordinate)0xBF80000000000000;
    goto LABEL_21;
  }
  uint64_t v9 = [v3 routeCoordinate];
  PolylineCoordinate v10 = (PolylineCoordinate)v9;
  nearbyTurnAroundManeuverInfo = self->_nearbyTurnAroundManeuverInfo;
  if (nearbyTurnAroundManeuverInfo)
  {
    uint64_t v12 = nearbyTurnAroundManeuverInfo->_step;
    uint64_t v13 = [(GEOComposedRouteStep *)v12 endRouteCoordinate];
    if (v13) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = *((float *)&v13 + 1) <= -1.0;
    }
    if (v14) {
      PolylineCoordinate v15 = (PolylineCoordinate)0xBF80000000000000;
    }
    else {
      PolylineCoordinate v15 = (PolylineCoordinate)v13;
    }

    goto LABEL_20;
  }
  PolylineCoordinate lastReferenceCoordinate = self->_lastReferenceCoordinate;
  PolylineCoordinate v15 = (PolylineCoordinate)v9;
  if (lastReferenceCoordinate.offset >= 0.0)
  {
    if (v9 == lastReferenceCoordinate.index)
    {
      PolylineCoordinate v15 = (PolylineCoordinate)v9;
      if (*((float *)&v9 + 1) == lastReferenceCoordinate.offset) {
        goto LABEL_20;
      }
      PolylineCoordinate v15 = (PolylineCoordinate)v9;
      if (*((float *)&v9 + 1) >= lastReferenceCoordinate.offset) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    PolylineCoordinate v15 = (PolylineCoordinate)v9;
    if (v9 < lastReferenceCoordinate.index) {
LABEL_19:
    }
      PolylineCoordinate v15 = self->_lastReferenceCoordinate;
  }
LABEL_20:
  float v17 = [(GEORouteMatcher *)self currentLocation];
  [v17 timestamp];
  double v19 = v18;
  uint64_t v20 = [v3 timestamp];
  [v20 timeIntervalSinceReferenceDate];
  double v22 = v21;

  [v17 speed];
  double v24 = v23;
  [v17 horizontalAccuracy];
  double v26 = v25 + v24 * (v19 - v22);
  self->_expectedCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)[v4 routeCoordinateForDistance:v15 afterRouteCoordinate:v26 + 25.0];
  self->_possibleCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)[v4 routeCoordinateForDistance:v15 afterRouteCoordinate:v26 + 50.0];
  self->_tolerableCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)[v4 routeCoordinateForDistance:v15 afterRouteCoordinate:v26 + 250.0];
  self->_expectedCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)[v4 routeCoordinateForDistance:v10 beforeRouteCoordinate:v26 + 0.0];
  self->_possibleCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)[v4 routeCoordinateForDistance:v10 beforeRouteCoordinate:v26 + 10.0];
  self->_tolerableCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)[v4 routeCoordinateForDistance:v10 beforeRouteCoordinate:v26 + 100.0];
  self->_PolylineCoordinate lastReferenceCoordinate = v10;

LABEL_21:
  [(GEOWalkingRouteMatcher *)self _resetExpectedCoordinateRangeIfNecessary];
  id v27 = [(GEORouteMatcher *)self previousRouteMatch];
  if ([v27 isGoodMatch]) {
    double v28 = 1000.0;
  }
  else {
    double v28 = 1.79769313e308;
  }

  [(GEORouteMatcher *)self setMaxMatchDistanceFromPreviousRouteMatch:v28];
  long long v29 = [MEMORY[0x1E4F1CA48] array];
  candidateMatchesForSecondPass = self->_candidateMatchesForSecondPass;
  self->_candidateMatchesForSecondPass = v29;

  v31.receiver = self;
  v31.super_class = (Class)GEOWalkingRouteMatcher;
  [(GEORouteMatcher *)&v31 _startRouteMatch];
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  v41[6] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  id v8 = a4;
  unint64_t v40 = 0xBF80000000000000;
  [v8 coordinate];
  long double v17 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v7, &v39.latitude, (uint64_t)&v40, v9, v10, v11, v12, v13, v14, v15, v16);
  -[GEOWalkingRouteMatcher _distanceScoreInfoForSegment:location:distanceFromSegment:](self, "_distanceScoreInfoForSegment:location:distanceFromSegment:", v7, v8);
  double v18 = (double *)objc_claimAutoreleasedReturnValue();
  double v19 = [(GEOWalkingRouteMatcher *)self _distanceTraveledScoreInfoForSegment:v7 location:v8 currentRouteCoordinate:v40];
  uint64_t v20 = [(GEOWalkingRouteMatcher *)self _courseScoreInfoForSegment:v7 location:v8 currentRouteCoordinate:v40];
  v38 = [(GEOWalkingRouteMatcher *)self _nearStartOfStepScoreInfoForSegment:v7 location:v8 currentRouteCoordinate:v40];
  double v21 = [(GEOWalkingRouteMatcher *)self _nearTurnAroundManeuverScoreInfoForSegment:v7 location:v8 currentRouteCoordinate:v40];
  double v22 = [(GEOWalkingRouteMatcher *)self _firstTimeOnRouteScoreInfoForSegment:v7 location:v8 currentRouteCoordinate:v40];
  v41[0] = v18;
  v41[1] = v19;
  v41[2] = v20;
  v41[3] = v38;
  v41[4] = v21;
  v41[5] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
  [(GEOWalkingRouteMatcher *)self _scoreForCandidateWithScoreInfos:v23];
  double v25 = v24;
  double v26 = objc_alloc_init(_GEOCandidateRouteMatch);
  id v27 = v26;
  if (v26)
  {
    v26->_isGoodMatch = v25 > 0.0;
    v26->_score = v25;
    v26->_distanceFromRoute = v17;
    v26->_routeCoordinate = (PolylineCoordinate)v40;
    v26->_locationCoordinate = v39;
  }
  if (v7) {
    double v28 = (void *)v7[7];
  }
  else {
    double v28 = 0;
  }
  id v29 = v28;
  uint64_t v30 = [v29 stepIndex];
  if (v27) {
    v27->_stepIndex = v30;
  }

  if (v18)
  {
    double v31 = v18[2];
    if (!v27) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  double v31 = 0.0;
  if (v27) {
LABEL_9:
  }
    v27->_distanceMatchScore = v31;
LABEL_10:
  if (v18)
  {
    double v32 = v18[3];
    if (!v27) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  double v32 = 0.0;
  if (v27) {
LABEL_12:
  }
    v27->_distanceWeight = v32;
LABEL_13:
  if (v19)
  {
    double v33 = v19[2];
    if (!v27) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  double v33 = 0.0;
  if (v27) {
LABEL_15:
  }
    v27->_distanceTraveledMatchScore = v33;
LABEL_16:
  if (v19)
  {
    double v34 = v19[3];
    if (!v27) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  double v34 = 0.0;
  if (v27) {
LABEL_18:
  }
    v27->_distanceTraveledWeight = v34;
LABEL_19:
  if (v20)
  {
    double v35 = v20[2];
    if (!v27) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  double v35 = 0.0;
  if (v27) {
LABEL_21:
  }
    v27->_courseMatchScore = v35;
LABEL_22:
  if (v20)
  {
    double v36 = v20[3];
    if (!v27) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  double v36 = 0.0;
  if (v27) {
LABEL_24:
  }
    v27->_courseWeight = v36;
LABEL_25:
  -[_GEOCandidateRouteMatch setSegment:]((uint64_t)v27, v7);
  -[_GEOCandidateRouteMatch setScoreInfos:]((uint64_t)v27, v23);

  return v27;
}

- (void)_considerCandidateMatch:(id)a3
{
  uint64_t v4 = (double *)a3;
  v5.receiver = self;
  v5.super_class = (Class)GEOWalkingRouteMatcher;
  [(GEORouteMatcher *)&v5 _considerCandidateMatch:v4];
  if (!v4 || v4[7] >= 0.0) {
    [(NSMutableArray *)self->_candidateMatchesForSecondPass addObject:v4];
  }
}

- (id)_topRouteMatchCandidate
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEORouteMatcher *)self candidateRouteMatches];
  uint64_t v4 = [v3 firstObject];

  if (v4 && v4[8])
  {
    objc_super v5 = v4;
LABEL_4:
    id v6 = v5;
    goto LABEL_46;
  }
  if (![(NSMutableArray *)self->_candidateMatchesForSecondPass count])
  {
    objc_super v5 = v44;
    goto LABEL_4;
  }
  uint64_t v45 = [(GEOWalkingRouteMatcher *)self _contiguousSegmentsForCandidates:self->_candidateMatchesForSecondPass];
  v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v45;
  uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v7)
  {
    uint64_t v48 = *(void *)v55;
    do
    {
      uint64_t v49 = v7;
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        if (v9 && (unint64_t v10 = *(void *)(v9 + 16), v10 < [*(id *)(v9 + 8) count]))
        {
          uint64_t v11 = [*(id *)(v9 + 8) objectAtIndexedSubscript:*(void *)(v9 + 16)];
          double v12 = (void *)v11;
          if (v11)
          {
            [(GEOWalkingRouteMatcher *)self _followingRouteScoreForRouteCoordinate:*(void *)(v11 + 24)];
            double v14 = v13;
            if (v13 >= 0.7)
            {
              uint64_t v15 = [v12 copy];
              uint64_t v16 = v15;
              if (v15) {
                long double v17 = *(void **)(v15 + 136);
              }
              else {
                long double v17 = 0;
              }
              double v18 = (void *)MEMORY[0x1E4F1CA48];
              id v19 = v17;
              uint64_t v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

              long long v52 = 0u;
              long long v53 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              if (v16) {
                double v21 = *(void **)(v16 + 136);
              }
              else {
                double v21 = 0;
              }
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v66 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v51;
                do
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v51 != v24) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v50 + 1) + 8 * j);
                    if (!v26 || *(void *)(v26 + 8) != 2) {
                      objc_msgSend(v20, "addObject:");
                    }
                  }
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v66 count:16];
                }
                while (v23);
              }

              id v27 = +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](v14, 1.0, (uint64_t)_GEORouteMatcherScoreInfo, 7);
              [v20 addObject:v27];
              -[_GEOCandidateRouteMatch setScoreInfos:](v16, v20);
              [(GEOWalkingRouteMatcher *)self _scoreForCandidateWithScoreInfos:v20];
              if (v16)
              {
                *(double *)(v16 + 16) = v28;
                *(unsigned char *)(v16 + 8) = v28 > -1.0;
              }
              id v29 = [(GEORouteMatcher *)self route];
              [v29 distanceBetweenRouteCoordinate:*(void *)&self->_lastReferenceCoordinate andRouteCoordinate:v12[3]];
              double v31 = v30;

              double v32 = GEOGetGEORouteMatcherLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                double v33 = [(GEORouteMatcher *)self previousRouteMatch];
                uint64_t v34 = [v33 routeCoordinate];
                GEOPolylineCoordinateAsString(v34, 1, 0, v35);
                id v36 = (id)objc_claimAutoreleasedReturnValue();
                if (v16) {
                  uint64_t v38 = *(void *)(v16 + 24);
                }
                else {
                  uint64_t v38 = 0;
                }
                $AB5116BA7E623E054F959CECB034F4E7 v39 = GEOPolylineCoordinateAsString(v38, 1, 0, v37);
                *(_DWORD *)buf = 138413058;
                id v59 = v36;
                __int16 v60 = 2112;
                v61 = v39;
                __int16 v62 = 2048;
                double v63 = v14;
                __int16 v64 = 2048;
                double v65 = fabs(v31);
                _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_DEFAULT, "Attempting to match location to another part of route because of recent locations. Route coordinate from [%@] to [%@]. Following route score: %0.2f. Distance from expected position: %0.2f", buf, 0x2Au);
              }
              [v46 addObject:v16];
            }
          }
        }
        else
        {
          double v12 = 0;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v7);
  }

  if ([v46 count])
  {
    self;
    id v40 = &__block_literal_global_165;
    uint64_t v41 = [v46 sortedArrayUsingComparator:&__block_literal_global_165];

    v42 = [v41 firstObject];

    id v6 = v42;
  }
  else
  {
    id v6 = v44;
  }

LABEL_46:

  return v6;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[GEOWalkingRouteMatcher _addRecentLocation:isOnRoute:](self, "_addRecentLocation:isOnRoute:", v10, [v8 isGoodMatch]);
  uint64_t v11 = [v8 routeCoordinate];
  [(GEORouteMatcher *)self roadWidthForRouteCoordinate:v11];
  double v13 = v12;
  [v10 horizontalAccuracy];
  double v15 = v14;
  double v16 = -1.0;
  if (v15 >= 0.0)
  {
    objc_msgSend(v10, "horizontalAccuracy", -1.0);
    double v16 = v17 + v13 * 0.5;
  }
  [v8 setModifiedHorizontalAccuracy:v16];
  [v8 setModifiedCourseAccuracy:-1.0];
  if (([v8 isGoodMatch] & 1) == 0)
  {
    [v10 horizontalAccuracy];
    -[GEOWalkingRouteMatcher _maxMatchDistance:routeCoordinate:previousMatchGood:](self, "_maxMatchDistance:routeCoordinate:previousMatchGood:", v11, 0);
    objc_msgSend(v8, "updateOffRouteProgress:minDistanceToGetOnRoute:", v9);
    double v18 = [(GEORouteMatcher *)self route];
    if (([v18 source] & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
LABEL_9:

      goto LABEL_10;
    }
    id v19 = [(GEORouteMatcher *)self closestCandidateRouteMatch];

    if (v19)
    {
      uint64_t v20 = [(GEORouteMatcher *)self closestCandidateRouteMatch];
      double v18 = (void *)v20;
      if (v20) {
        double v21 = *(double *)(v20 + 40);
      }
      else {
        double v21 = 0.0;
      }
      [v8 setDistanceFromRoute:v21];
      goto LABEL_9;
    }
  }
LABEL_10:
  if ([v9 isGoodMatch])
  {
    if ([v8 isGoodMatch])
    {
      uint64_t v22 = [v8 stepIndex];
      if (v22 != [v9 stepIndex])
      {
        unint64_t v23 = self->_newStepProgressions + 1;
        self->_newStepProgressions = v23;
        if (v23 < 5) {
          goto LABEL_17;
        }
        uint64_t v24 = [(GEORouteMatcher *)self route];
        double v25 = [v8 step];
        uint64_t v26 = objc_msgSend(v24, "coordinateAtOffset:fromRoutePoint:", objc_msgSend(v25, "startPointIndex"), 12.0);

        uint64_t v27 = [v8 routeCoordinate];
        if (v27 < v26
          || v27 == v26 && *((float *)&v27 + 1) < *((float *)&v26 + 1))
        {
LABEL_17:
          objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
        }
        else
        {
          self->_newStepProgressions = 0;
        }
      }
    }
  }
  candidateMatchesForSecondPass = self->_candidateMatchesForSecondPass;
  self->_candidateMatchesForSecondPass = 0;

  v29.receiver = self;
  v29.super_class = (Class)GEOWalkingRouteMatcher;
  [(GEORouteMatcher *)&v29 _finishRouteMatch:v8 previousRouteMatch:v9 forLocation:v10];
}

- (BOOL)_supportsSnapping
{
  uint64_t v3 = [(GEORouteMatcher *)self route];
  if ([v3 usesZilch])
  {
    char v4 = 1;
  }
  else
  {
    objc_super v5 = [(GEORouteMatcher *)self route];
    char v4 = [v5 usesRoutingPathPoints];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateMatchesForSecondPass, 0);
  objc_storeStrong((id *)&self->_recentLocations, 0);
  objc_storeStrong((id *)&self->_nearbyTurnAroundManeuverInfo, 0);

  objc_storeStrong((id *)&self->_turnAroundManeuverInfos, 0);
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0xBF80000000000000;
  *((void *)self + 18) = 0xBF80000000000000;
  *((_DWORD *)self + 38) = 0;
  *(void *)((char *)self + 156) = 3212836864;
  *((_DWORD *)self + 41) = -1082130432;
  *((_DWORD *)self + 42) = 0;
  *(void *)((char *)self + 172) = 3212836864;
  *((_DWORD *)self + 45) = -1082130432;
  *((_DWORD *)self + 46) = 0;
  *((_DWORD *)self + 47) = -1082130432;
  return self;
}

- (void)_addRecentLocation:(id)a3 isOnRoute:(BOOL)a4
{
  id v11 = a3;
  if (!self->_recentLocations)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    recentLocations = self->_recentLocations;
    self->_recentLocations = v7;
  }
  uint64_t v9 = objc_opt_new();
  id v10 = (unsigned char *)v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 16), a3);
    v10[8] = a4;
  }
  [(NSMutableArray *)self->_recentLocations addObject:v10];
  while ((unint64_t)[(NSMutableArray *)self->_recentLocations count] >= 0x3D)
    -[NSMutableArray removeObjectsInRange:](self->_recentLocations, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_recentLocations count] - 60);
}

- (double)_followingRouteScoreForRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_recentLocations count]) {
    return 0.0;
  }
  objc_super v5 = [(GEORouteMatcher *)self route];
  id v6 = [(GEORouteMatcher *)self currentLocation];
  [v6 coordinate];
  double v8 = v7;
  double v10 = v9;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = [(NSMutableArray *)self->_recentLocations reverseObjectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v36;
    double v14 = 0.0;
    do
    {
      uint64_t v15 = 0;
      do
      {
        double v16 = v8;
        double v17 = v10;
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * v15);
        if (v18) {
          id v19 = *(void **)(v18 + 16);
        }
        else {
          id v19 = 0;
        }
        id v20 = v19;
        [v20 coordinate];
        double v8 = v21;
        double v10 = v22;

        double v23 = GEOCalculateDistanceRadius(v8, v10, v16, v17, 6367000.0);
        uint64_t v24 = [v5 routeCoordinateForDistance:a3 beforeRouteCoordinate:v23 + 30.0];
        uint64_t v25 = [v5 routeCoordinateForDistance:a3 beforeRouteCoordinate:v23 + -10.0];
        PolylineCoordinate v34 = (PolylineCoordinate)0xBF80000000000000;
        if (v18) {
          uint64_t v26 = *(void **)(v18 + 16);
        }
        else {
          uint64_t v26 = 0;
        }
        id v27 = v26;
        -[GEOWalkingRouteMatcher _distanceFromRouteForLocation:withinRange:outRouteCoordinate:](self, "_distanceFromRouteForLocation:withinRange:outRouteCoordinate:", v27, v24, v25, &v34);
        double v29 = v28;

        double v30 = -1.0;
        if (v29 <= 15.0)
        {
          [v5 distanceBetweenRouteCoordinate:v34 andRouteCoordinate:a3];
          if (v31 < 13.8)
          {
            double v30 = 1.0;
            if (v31 < 0.414)
            {
              if (v31 >= -0.207) {
                double v30 = 0.0;
              }
              else {
                double v30 = -1.0;
              }
            }
          }
        }
        double v14 = v14 + v30;
        a3 = v34;
        ++v15;
      }
      while (v12 != v15);
      uint64_t v32 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v12 = v32;
    }
    while (v32);
  }
  else
  {
    double v14 = 0.0;
  }

  return v14 / 60.0;
}

- (double)_distanceFromRouteForLocation:(id)a3 withinRange:(GEOPolylineCoordinateRange)a4 outRouteCoordinate:(PolylineCoordinate *)a5
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  id v9 = a3;
  double v10 = [(GEORouteMatcher *)self route];
  [v9 coordinate];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = +[GEOPolylineCoordinateIterator iteratorWithRange:](GEOPolylineCoordinateIterator, "iteratorWithRange:", start, end);
  [v15 advance];
  double v16 = 1.79769313e308;
  PolylineCoordinate v17 = (PolylineCoordinate)0xBF80000000000000;
  while ([v15 isCurrentValid])
  {
    uint64_t v18 = [v15 previous];
    uint64_t v19 = [v15 current];
    [v10 pointAtRouteCoordinate:v18];
    double v21 = v20;
    double v23 = v22;
    [v10 pointAtRouteCoordinate:v19];
    double v25 = v24;
    double v27 = v26;
    double v28 = objc_alloc_init(_GEORouteMatchingSegment);
    long long v35 = v28;
    if (v28)
    {
      float v36 = *((float *)&v19 + 1);
      *(void *)&v28->_startPointIndex = v18;
      if (v19 > v18) {
        float v36 = 1.0;
      }
      v28->_endRouteCoordinateOffset = v36;
      v28->_startCoordinate.latitude = v21;
      v28->_startCoordinate.longitude = v23;
      v28->_endCoordinate.latitude = v25;
      v28->_endCoordinate.longitude = v27;
    }
    unint64_t v40 = 0xBF80000000000000;
    double v37 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v28, 0, (uint64_t)&v40, v12, v14, v29, v30, v31, v32, v33, v34);
    unint64_t v38 = v40;
    [v15 advance];
    if (v37 < v16)
    {
      double v16 = v37;
      PolylineCoordinate v17 = (PolylineCoordinate)v38;
    }
  }
  if (a5) {
    *a5 = v17;
  }

  return v16;
}

@end
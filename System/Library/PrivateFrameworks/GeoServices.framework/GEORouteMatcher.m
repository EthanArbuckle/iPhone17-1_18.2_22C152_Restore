@interface GEORouteMatcher
- (BOOL)_shouldConsiderCourseForLocation:(id)a3;
- (BOOL)_supportsSnapping;
- (BOOL)hasBeenOnRouteOnce;
- (BOOL)requiresRoadNetworkData;
- (BOOL)shouldSnapRouteMatchToRoute;
- (BOOL)shouldWaitForSnappedSegments;
- (BOOL)useMatchedCoordinateForMatching;
- (BOOL)useStrictInitialOnRouteCriteria;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedRoute)route;
- (GEOLocation)currentLocation;
- (GEORouteMatch)lastGoodRouteMatch;
- (GEORouteMatch)previousRouteMatch;
- (GEORouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4;
- (NSArray)candidateRouteMatches;
- (NSArray)snappedSegments;
- (PolylineCoordinate)_guaranteedRouteCoordinateForLocationCoordinate:(id)a3;
- (PolylineCoordinate)closestRouteCoordinateForLocationCoordinate:(id)a3;
- (_GEOCandidateRouteMatch)closestCandidateRouteMatch;
- (double)_roadWidthForSnappedSegment:(id)a3;
- (double)_scoreModifierForStep:(id)a3 previousStep:(id)a4;
- (double)distanceToRouteFrom:(id)a3;
- (double)distanceToRouteFrom:(id)a3 startDistance:(double)a4 endDistance:(double)a5;
- (double)maxMatchDistanceFromPreviousRouteMatch;
- (double)roadWidthForRouteCoordinate:(PolylineCoordinate)a3;
- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5;
- (id)_startStepForPreviousRouteMatch:(id)a3;
- (id)_stepForRouteCoordinate:(PolylineCoordinate)a3 stepHint:(id)a4;
- (id)_topRouteMatchCandidate;
- (id)matchToClosestPointOnRouteWithLocation:(id)a3;
- (id)matchToRouteWithLocation:(id)a3;
- (id)matchToRouteWithLocation:(id)a3 previousRouteMatch:(id)a4;
- (id)snappedSegmentForRouteCoordinate:(PolylineCoordinate)a3;
- (unint64_t)targetLegIndex;
- (void)_considerCandidateMatch:(id)a3;
- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (void)_forEachSegmentNearLocation:(id)a3 previousRouteMatch:(id)a4 handler:(id)a5;
- (void)_startRouteMatch;
- (void)setMaxMatchDistanceFromPreviousRouteMatch:(double)a3;
- (void)setRequiresRoadNetworkData:(BOOL)a3;
- (void)setShouldSnapRouteMatchToRoute:(BOOL)a3;
- (void)setShouldWaitForSnappedSegments:(BOOL)a3;
- (void)setTargetLegIndex:(unint64_t)a3;
- (void)setUseMatchedCoordinateForMatching:(BOOL)a3;
- (void)setUseStrictInitialOnRouteCriteria:(BOOL)a3;
@end

@implementation GEORouteMatcher

- (GEORouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEORouteMatcher;
  v9 = [(GEORouteMatcher *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    v10->_targetLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10->_useStrictInitialOnRouteCriteria = 1;
    v10->_maxMatchDistanceFromPreviousRouteMatch = 1000.0;
    *(_WORD *)&v10->_requiresRoadNetworkData = 0;
    v10->_shouldWaitForSnappedSegments = 0;
    v10->_hasBeenOnRouteOnce = 0;
    objc_storeStrong((id *)&v10->_auditToken, a4);
    v11 = v10;
  }

  return v10;
}

- (id)matchToRouteWithLocation:(id)a3
{
  v3 = [(GEORouteMatcher *)self matchToRouteWithLocation:a3 previousRouteMatch:0];

  return v3;
}

- (id)matchToRouteWithLocation:(id)a3 previousRouteMatch:(id)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v47 = a4;
  if (self->_requiresRoadNetworkData)
  {
    if (!self->_pathMatcher)
    {
      id v7 = [GEOPathMatcher alloc];
      route = self->_route;
      v9 = [(GEORouteMatcher *)self auditToken];
      v10 = [(GEOPathMatcher *)v7 initWithRoute:route auditToken:v9 loggingIdentifier:@"RouteMatcher"];
      pathMatcher = self->_pathMatcher;
      self->_pathMatcher = v10;

      [(GEOPathMatcher *)self->_pathMatcher setForceSync:self->_shouldWaitForSnappedSegments];
    }
    if (v47) {
      $212C09783140BCCD23384160D545CE0D v12 = -[GEOComposedRoute routeCoordinateForDistance:beforeRouteCoordinate:](self->_route, "routeCoordinateForDistance:beforeRouteCoordinate:", [v47 routeCoordinate], 100.0);
    }
    else {
      $212C09783140BCCD23384160D545CE0D v12 = 0;
    }
    -[GEOPathMatcher matchedSegmentsFromStart:toEnd:](self->_pathMatcher, "matchedSegmentsFromStart:toEnd:", v12, -[GEOComposedRoute routeCoordinateForDistance:afterRouteCoordinate:](self->_route, "routeCoordinateForDistance:afterRouteCoordinate:", v12, self->_maxMatchDistanceFromPreviousRouteMatch + 100.0, v46));
    objc_super v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    snappedSegments = self->_snappedSegments;
    self->_snappedSegments = v13;
  }
  objc_storeStrong((id *)&self->_currentLocation, a3);
  objc_storeStrong((id *)&self->_previousRouteMatch, a4);
  [(GEORouteMatcher *)self _startRouteMatch];
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__52;
  v57 = __Block_byref_object_dispose__52;
  id v58 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __63__GEORouteMatcher_matchToRouteWithLocation_previousRouteMatch___block_invoke;
  v48[3] = &unk_1E53E4D28;
  v48[4] = self;
  id v15 = v46;
  id v49 = v15;
  id v16 = v47;
  id v50 = v16;
  v51 = v59;
  v52 = &v53;
  [(GEORouteMatcher *)self _forEachSegmentNearLocation:v15 previousRouteMatch:v16 handler:v48];
  objc_storeStrong((id *)&self->_closestCandidateRouteMatch, (id)v54[5]);
  uint64_t v17 = [(GEORouteMatcher *)self _topRouteMatchCandidate];
  uint64_t v18 = v17;
  if (v17)
  {
    [(GEOComposedRoute *)self->_route courseAtRouteCoordinateIndex:*(unsigned int *)(v17 + 24)];
    double v20 = v19;
    uint64_t v21 = *(void *)(v18 + 24);
    [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:v21];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [GEORouteMatch alloc];
    v29 = self->_route;
    uint64_t v30 = *(void *)(v18 + 32);
    v31 = (void *)MEMORY[0x1E4F1C9C8];
    [v15 timestamp];
    v32 = objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
    v33 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v28, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v29, v21, v30, v32, v23, v25, v27, v20);

    [(GEORouteMatch *)v33 setDistanceFromRoute:*(double *)(v18 + 40)];
    [(GEORouteMatch *)v33 setIsGoodMatch:*(unsigned __int8 *)(v18 + 8)];
    if (self->_requiresRoadNetworkData)
    {
      v34 = [(GEORouteMatcher *)self snappedSegmentForRouteCoordinate:v21];
      [(GEORouteMatch *)v33 setPathSegment:v34];
      [(GEORouteMatcher *)self _roadWidthForSnappedSegment:v34];
      -[GEORouteMatch setRoadWidth:](v33, "setRoadWidth:");
      if (self->_shouldSnapRouteMatchToRoute)
      {
        BOOL v35 = [(GEORouteMatcher *)self _supportsSnapping];
        if (v34 && v35)
        {
          [v34 locationCoordinateForRouteCoordinate:v21];
          if (v38 >= -180.0 && v38 <= 180.0 && v37 >= -90.0 && v37 <= 90.0) {
            -[GEORouteMatch setLocationCoordinate3D:](v33, "setLocationCoordinate3D:");
          }
        }
      }
    }
    -[GEORouteMatcher _finishRouteMatch:previousRouteMatch:forLocation:](self, "_finishRouteMatch:previousRouteMatch:forLocation:", v33, v16, v15, v46);
    if (![(GEOComposedRoute *)self->_route transportType]
      || [(GEOComposedRoute *)self->_route transportType] == 3)
    {
      v39 = objc_alloc_init(GEONavigationMatchInfo);
      [(GEONavigationMatchInfo *)v39 setRouteMatchScore:*(double *)(v18 + 16)];
      [(GEONavigationMatchInfo *)v39 setDistanceFromRoute:*(double *)(v18 + 40)];
      [(GEONavigationMatchInfo *)v39 setMaxDistance:*(double *)(v18 + 48)];
      [(GEONavigationMatchInfo *)v39 setDistanceMatchScore:*(double *)(v18 + 56)];
      [(GEONavigationMatchInfo *)v39 setDistanceWeight:*(double *)(v18 + 64)];
      [(GEONavigationMatchInfo *)v39 setCourseDelta:*(double *)(v18 + 72)];
      [(GEONavigationMatchInfo *)v39 setMaxCourseDelta:*(double *)(v18 + 80)];
      [(GEONavigationMatchInfo *)v39 setCourseMatchScore:*(double *)(v18 + 88)];
      [(GEONavigationMatchInfo *)v39 setCourseWeight:*(double *)(v18 + 96)];
      [(GEORouteMatch *)v33 roadWidth];
      [(GEONavigationMatchInfo *)v39 setRoadWidthOnRoute:"setRoadWidthOnRoute:"];
      [(GEORouteMatch *)v33 setDetailedMatchInfo:v39];
    }
    v40 = [(GEORouteMatch *)v33 candidateSteps];
    BOOL v41 = v40 == 0;

    if (v41)
    {
      v42 = [(GEORouteMatch *)v33 step];
      v60[0] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
      [(GEORouteMatch *)v33 setCandidateSteps:v43];
    }
  }
  else
  {
    v33 = 0;
  }
  v44 = self->_snappedSegments;
  self->_snappedSegments = 0;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v59, 8);

  return v33;
}

void __63__GEORouteMatcher_matchToRouteWithLocation_previousRouteMatch___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_candidateForSegment:location:previousRouteMatch:");
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    double v5 = v3[5];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v5 < *(double *)(v6 + 24))
    {
      *(double *)(v6 + 24) = v5;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
    }
    [*(id *)(a1 + 32) _considerCandidateMatch:v4];
  }
}

- (id)matchToClosestPointOnRouteWithLocation:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  [v4 coordinate];
  PolylineCoordinate v9 = [(GEORouteMatcher *)self closestRouteCoordinateForLocationCoordinate:"closestRouteCoordinateForLocationCoordinate:"];
  *(float *)&double v10 = v9.offset;
  if (v9.offset >= 0.0)
  {
    -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v9, v10);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [GEORouteMatch alloc];
    route = self->_route;
    uint64_t v20 = [(GEOComposedRoute *)route stepIndexForRouteCoordinate:v9];
    [(GEOComposedRoute *)self->_route courseAtRouteCoordinateIndex:v9];
    double v22 = v21;
    double v23 = [MEMORY[0x1E4F1C9C8] date];
    v11 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v18, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", route, v9, v20, v23, v13, v15, v17, v22);

    [(GEORouteMatch *)v11 setDistanceFromRoute:(double)GEOCalculateDistanceRadius(v6, v8, v13, v15, 6367000.0)];
    [(GEORouteMatch *)v11 setIsGoodMatch:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PolylineCoordinate)closestRouteCoordinateForLocationCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if ([(GEOComposedRoute *)self->_route pointCount] >= 2)
  {
    double v55 = var0;
    double v56 = var1;
    double v7 = GEOTilePointForCoordinate(var0, var1, 20.0);
    double v9 = v8;
    [(GEOComposedRoute *)self->_route pointAt:[(GEOComposedRoute *)self->_route pointCount] >> 1];
    double v11 = GEOMapPointsPerMeterAtLatitude(v10);
    [(GEOComposedRoute *)self->_route sections];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v64;
      double v57 = -(v11 * -1000.0);
      double v58 = v11 * -1000.0;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      double v16 = 1.79769313e308;
      double v59 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v64 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if (v18)
          {
            [*(id *)(*((void *)&v63 + 1) + 8 * i) bounds];
            double v19 = *((double *)&v60 + 1);
            double v20 = *(double *)&v60;
            double v21 = *((double *)&v61 + 1);
            double v22 = v62;
          }
          else
          {
            long long v61 = 0u;
            double v62 = 0.0;
            double v22 = 0.0;
            double v21 = 0.0;
            double v19 = 0.0;
            double v20 = 0.0;
            long long v60 = 0u;
          }
          double v23 = fabs(v20);
          double v24 = fabs(v19);
          BOOL v25 = v23 == INFINITY || v24 == INFINITY;
          double v26 = v19;
          double v27 = v20;
          double v28 = v21;
          double v29 = v22;
          if (!v25)
          {
            double v27 = v58 + v20;
            double v26 = v58 + v19;
            double v28 = v21 + v57 * 2.0;
            double v29 = v22 + v57 * 2.0;
            double v23 = fabs(v58 + v20);
            double v24 = fabs(v58 + v19);
          }
          double v30 = v27 + v28;
          double v31 = v26 + v29;
          if (v23 != INFINITY && v24 != INFINITY && v7 >= v27 && v7 < v30 && v9 >= v26 && v9 < v31)
          {
            double v37 = (float *)[v18 points];
            unsigned int v38 = [v18 pointCount];
            unsigned int v39 = [v18 startPointIndex];
            if (v38 >= 2)
            {
              double v40 = v19 + (float)(1.0 - v37[1]) * v22;
              double v41 = v20 + *v37 * v21;
              uint64_t v42 = v39;
              uint64_t v43 = v38 - 1;
              v44 = v37 + 4;
              do
              {
                double v45 = v20 + *(v44 - 1) * v21;
                double v46 = v19 + (float)(1.0 - *v44) * v22;
                if (vabdd_f64(v41, v45) >= 0.00000001 || vabdd_f64(v40, v46) >= 0.00000001)
                {
                  double v47 = v45 - v41;
                  double v48 = v46 - v40;
                  double v49 = ((v7 - v41) * (v45 - v41) + 0.0 + (v9 - v40) * (v46 - v40)) / (v47 * v47 + 0.0 + v48 * v48);
                  if (v49 < 0.0) {
                    double v49 = 0.0;
                  }
                  if (v49 > 1.0) {
                    double v49 = 1.0;
                  }
                  double v50 = (v7 - (v41 + (v41 + v47 - v41) * v49)) * (v7 - (v41 + (v41 + v47 - v41) * v49))
                      + 0.0
                      + (v9 - (v40 + (v40 + v48 - v40) * v49)) * (v9 - (v40 + (v40 + v48 - v40) * v49));
                  BOOL v51 = v50 < v16;
                  if (v50 < v16) {
                    double v16 = v50;
                  }
                  double v52 = v59;
                  if (v51) {
                    double v52 = v49;
                  }
                  double v59 = v52;
                  if (v51) {
                    uint64_t v15 = v42;
                  }
                }
                ++v42;
                v44 += 3;
                double v41 = v45;
                double v40 = v46;
                --v43;
              }
              while (v43);
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      double v59 = 0.0;
    }

    if (v15 == 0x7FFFFFFFFFFFFFFFLL || v59 < 0.0 || v59 > 1.0)
    {
      unint64_t v6 = -[GEORouteMatcher _guaranteedRouteCoordinateForLocationCoordinate:](self, "_guaranteedRouteCoordinateForLocationCoordinate:", v55, v56);
    }
    else
    {
      float v53 = v59;
      if (v53 >= 1.0)
      {
        LODWORD(v15) = vcvtms_u32_f32(v53) + v15;
        float v53 = v53 - (float)floorf(v53);
      }
      unint64_t v6 = v15 | ((unint64_t)LODWORD(v53) << 32);
    }
  }
  else
  {
    return (PolylineCoordinate)0xBF80000000000000;
  }
  return (PolylineCoordinate)v6;
}

- (double)distanceToRouteFrom:(id)a3
{
  -[GEORouteMatcher distanceToRouteFrom:startDistance:endDistance:](self, "distanceToRouteFrom:startDistance:endDistance:", a3.var0, a3.var1, 0.0, 1.79769313e308);
  return result;
}

- (double)distanceToRouteFrom:(id)a3 startDistance:(double)a4 endDistance:(double)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unsigned int v10 = [(GEOComposedRoute *)self->_route pointCount];
  if (a5 < a4 || v10 < 2) {
    return 1.79769313e308;
  }
  double v42 = a5;
  [(GEOComposedRoute *)self->_route pointAt:0];
  double v13 = v12;
  double v15 = v14;
  if ([(GEOComposedRoute *)self->_route pointCount] < 2) {
    return 1.79769313e308;
  }
  double v40 = var0;
  double v41 = var1;
  double v16 = 0.0;
  double v17 = 1.79769313e308;
  unint64_t v18 = 1;
  do
  {
    [(GEOComposedRoute *)self->_route pointAt:v18];
    double v20 = v19;
    double v22 = v21;
    double v23 = GEOCalculateDistanceRadius(v13, v15, v19, v21, 6367000.0);
    if (v16 > v42) {
      break;
    }
    double v26 = v23;
    double v27 = v16 + v23;
    if (v16 + v23 >= a4)
    {
      double v28 = v13;
      double v29 = v15;
      if (v16 < a4)
      {
        double v28 = v13;
        double v29 = v15;
        if (v27 >= a4)
        {
          float v30 = (a4 - v16) / v26;
          double v31 = v30;
          double v28 = v13 + (v20 - v13) * v30;
          double v29 = v15 + (v22 - v15) * v31;
        }
      }
      double v32 = v20;
      double v33 = v22;
      if (v27 > v42)
      {
        float v34 = (v42 - v16) / v26;
        double v35 = v34;
        double v32 = v13 + (v20 - v13) * v35;
        double v33 = v15 + (v22 - v15) * v35;
      }
      double v36 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v28, v29, 1.79769313e308, v32, v33, 1.79769313e308, v24, v25, v40, v41);
      double v38 = GEOCalculateDistanceRadius(v40, v41, v36, v37, 6367000.0);
      if (v17 > v38) {
        double v17 = v38;
      }
      double v13 = v20;
      double v15 = v22;
      double v16 = v27;
    }
    ++v18;
  }
  while (v18 < [(GEOComposedRoute *)self->_route pointCount]);
  return v17;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_targetLegIndex != a3)
  {
    double v5 = GEOGetMapMatchingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t targetLegIndex = self->_targetLegIndex;
      v7[0] = 67109376;
      v7[1] = targetLegIndex;
      __int16 v8 = 1024;
      int v9 = a3;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "GEORouteMatcher changed target leg index from %d to %d", (uint8_t *)v7, 0xEu);
    }

    self->_unint64_t targetLegIndex = a3;
  }
}

- (void)setRequiresRoadNetworkData:(BOOL)a3
{
  if (self->_requiresRoadNetworkData != a3)
  {
    self->_requiresRoadNetworkData = a3;
    if (!a3)
    {
      pathMatcher = self->_pathMatcher;
      self->_pathMatcher = 0;
    }
  }
}

- (void)setShouldWaitForSnappedSegments:(BOOL)a3
{
  self->_shouldWaitForSnappedSegments = a3;
}

- (PolylineCoordinate)_guaranteedRouteCoordinateForLocationCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(GEOComposedRoute *)self->_route pointAt:0];
  double v7 = v6;
  double v9 = v8;
  unsigned int v10 = [(GEOComposedRoute *)self->_route pointCount];
  double v30 = v7;
  double v31 = v9;
  unsigned int v11 = 0;
  if (v10 >= 2)
  {
    uint64_t v12 = v10;
    double v13 = 1.79769313e308;
    for (uint64_t i = 1; i != v12; ++i)
    {
      [(GEOComposedRoute *)self->_route pointAt:i];
      double v16 = v15;
      double v18 = v17;
      double v21 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v7, v9, 1.79769313e308, v15, v17, 1.79769313e308, v19, v20, var0, var1);
      double v23 = v22;
      double v24 = GEOCalculateDistanceRadius(var0, var1, v21, v22, 6367000.0);
      if (v13 > v24)
      {
        unsigned int v11 = i - 1;
        double v30 = v21;
        double v31 = v23;
        double v13 = v24;
      }
      double v9 = v18;
      double v7 = v16;
    }
  }
  [(GEOComposedRoute *)self->_route pointAt:v11];
  double v27 = GEOCalculateDistanceRadius(v25, v26, v30, v31, 6367000.0);
  route = self->_route;

  return (PolylineCoordinate)[(GEOComposedRoute *)route coordinateAtOffset:v11 fromRoutePoint:v27];
}

- (void)_forEachSegmentNearLocation:(id)a3 previousRouteMatch:(id)a4 handler:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v70 = (void (**)(id, void *))a5;
  v69 = v8;
  v71 = v9;
  [v8 coordinate];
  double v11 = v10;
  double v13 = v12;
  double v74 = GEOTilePointForCoordinate(v10, v12, 20.0);
  double v78 = v14;
  double v15 = [(GEORouteMatcher *)self _startStepForPreviousRouteMatch:v9];
  uint64_t v16 = [v15 startRouteCoordinate];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = [(GEOComposedRoute *)self->_route sections];
  uint64_t v17 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
  if (!v17) {
    goto LABEL_71;
  }
  double v72 = v13;
  double v73 = v11;
  uint64_t v77 = *(void *)v83;
  double v18 = v74;
LABEL_3:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v83 != v77) {
      objc_enumerationMutation(obj);
    }
    double v20 = *(void **)(*((void *)&v82 + 1) + 8 * v19);
    if (v20)
    {
      [*(id *)(*((void *)&v82 + 1) + 8 * v19) bounds];
      double v21 = *((double *)&v79 + 1);
      double v22 = *(double *)&v79;
      double v24 = *((double *)&v80 + 1);
      double v23 = v81;
    }
    else
    {
      long long v80 = 0u;
      double v81 = 0.0;
      double v23 = 0.0;
      double v24 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
      long long v79 = 0u;
    }
    double v25 = fabs(v22);
    double v26 = fabs(v21);
    if (v25 != INFINITY && v26 != INFINITY)
    {
      long double v28 = exp(((v23 * 0.5 + v21) * 0.0078125 + -1048576.0) / 333772.107);
      long double v29 = atan(v28);
      long double v30 = GEOMapPointsPerMeterAtLatitude((v29 * -2.0 + 1.57079633) * 57.2957795) * -1000.0;
      double v22 = v22 + v30;
      double v21 = v21 + v30;
      double v24 = v24 + v30 * -2.0;
      double v23 = v23 + v30 * -2.0;
      double v25 = fabs(v22);
      double v26 = fabs(v21);
    }
    double v31 = v22 + v24;
    double v32 = v21 + v23;
    BOOL v35 = v25 != INFINITY && v26 != INFINITY && v18 >= v22 && v18 < v31;
    double v36 = v78;
    if (!v35 || v78 < v21 || v78 >= v32) {
      goto LABEL_67;
    }
    float v39 = *((float *)&v16 + 1);
    double v40 = +[GEOPolylineCoordinateIterator iteratorWithRange:](GEOPolylineCoordinateIterator, "iteratorWithRange:", objc_msgSend(v20, "startPointIndex", v78, v26, v31, v32), objc_msgSend(v20, "endPointIndex"));
    [v40 advance];
    if ([v40 isCurrentValid]) {
      break;
    }
LABEL_66:

LABEL_67:
    if (++v19 == v17)
    {
      uint64_t v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16, v36, v26, v31, v32);
      if (!v17) {
        goto LABEL_71;
      }
      goto LABEL_3;
    }
  }
  uint64_t v41 = [v40 previous];
  [v40 current];
  float v42 = *((float *)&v41 + 1);
  double v43 = -180.0;
  *(double *)&unint64_t v44 = -180.0;
  while (2)
  {
    unsigned int v45 = v41;
    float v46 = v42;
    for (double i = *(double *)&v44; ; double i = -180.0)
    {
      if (![v40 isCurrentValid]) {
        goto LABEL_66;
      }
      uint64_t v48 = [v40 current];
      uint64_t v41 = v48;
      if (v48 >= v16)
      {
        float v42 = *((float *)&v48 + 1);
        if (v48 != v16 || *((float *)&v48 + 1) > v39) {
          break;
        }
      }
      [v40 advance];
      uint64_t v49 = [v40 previous];
      float v46 = *((float *)&v49 + 1);
      unsigned int v45 = v49;
      double v43 = -180.0;
    }
    if (v15)
    {
      double v50 = [(GEORouteMatcher *)self _stepForRouteCoordinate:v45 | ((unint64_t)LODWORD(v46) << 32) stepHint:v15];

      uint64_t v51 = [v50 endRouteCoordinate];
      if (v41 > v51
        || (double v52 = 0, v41 == v51) && *((float *)&v41 + 1) > *((float *)&v51 + 1))
      {
        uint64_t v41 = [v50 endRouteCoordinate];
        double v52 = [v50 getNextStep];
        float v42 = *((float *)&v41 + 1);
      }
    }
    else
    {
      double v52 = 0;
      double v50 = 0;
    }
    if (i < -180.0 || i > 180.0 || v43 < -90.0 || v43 > 90.0)
    {
      [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:v45 | ((unint64_t)LODWORD(v46) << 32)];
      double v43 = v53;
      double i = v54;
    }
    [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:v41 | ((unint64_t)LODWORD(v42) << 32)];
    *(double *)&unint64_t v44 = v55;
    double v75 = v56;
    double v59 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v43, i, 1.79769313e308, v56, v55, 1.79769313e308, v57, v58, v73, v72);
    if (GEOCalculateDistanceRadius(v73, v72, v59, v60, 6367000.0) <= self->_maxMatchDistanceFromPreviousRouteMatch)
    {
      double v18 = v74;
      float v39 = *((float *)&v16 + 1);
      if (vabds_f32(v46 + (float)v45, v42 + (float)v41) >= 0.001)
      {
        long long v63 = objc_alloc_init(_GEORouteMatchingSegment);
        long long v64 = v63;
        if (v63)
        {
          v63->_startPointIndex = v45;
          float v65 = 1.0;
          if (v41 <= v45) {
            float v65 = v42;
          }
          v63->_startRouteCoordinateOffset = v46;
          v63->_endRouteCoordinateOffset = v65;
          v63->_startCoordinate.latitude = v43;
          v63->_startCoordinate.longitude = i;
          v63->_endCoordinate.latitude = v75;
          v63->_endCoordinate.longitude = *(double *)&v44;
        }
        -[GEOComposedStringReplacementResult setStyleReplacementResults:]((uint64_t)v63, v50);
        v70[2](v70, v64);
      }
      if (v52)
      {
        uint64_t v41 = [v52 startRouteCoordinate];
        [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:v41];
        double v43 = v66;
        unint64_t v44 = v67;
        id v68 = v52;

        float v42 = *((float *)&v41 + 1);
        double v50 = v68;
      }
      else
      {
        [v40 advance];
        double v43 = v75;
      }
      goto LABEL_65;
    }
    double v18 = v74;
    float v39 = *((float *)&v16 + 1);
    if (!v71
      || (uint64_t v61 = [v71 routeCoordinate], v45 <= v61)
      && (v45 != v61 || v46 <= *((float *)&v61 + 1)))
    {
      [v40 advance];
      uint64_t v62 = [v40 previous];
      float v42 = *((float *)&v62 + 1);
      LODWORD(v41) = v62;
      double v43 = -180.0;
      *(double *)&unint64_t v44 = -180.0;
LABEL_65:

      double v15 = v50;
      continue;
    }
    break;
  }

  double v15 = v50;
LABEL_71:
}

- (id)_stepForRouteCoordinate:(PolylineCoordinate)a3 stepHint:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(GEORouteMatcher *)self route];
    double v10 = [v9 steps];
    id v8 = [v10 firstObject];
  }
  do
  {
    uint64_t v11 = [v8 endRouteCoordinate];
    if (a3.index <= v11 && (a3.index != v11 || a3.offset < *((float *)&v11 + 1))) {
      break;
    }
    uint64_t v12 = [v8 getNextStep];

    id v8 = (id)v12;
  }
  while (v12);

  return v8;
}

- (NSArray)candidateRouteMatches
{
  return (NSArray *)self->_candidateRouteMatches;
}

- (NSArray)snappedSegments
{
  return self->_snappedSegments;
}

- (id)snappedSegmentForRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_snappedSegments;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v8, "range", (void)v15);
      if (v9 == a3.index)
      {
        LODWORD(v12) = HIDWORD(v9);
        if (*((float *)&v9 + 1) <= a3.offset) {
          goto LABEL_10;
        }
      }
      else if (v9 < a3.index)
      {
LABEL_10:
        if (a3.index == v10)
        {
          *(float *)&double v12 = v11;
          if (a3.offset <= v11) {
            goto LABEL_17;
          }
        }
        else if (a3.index < v10)
        {
LABEL_17:
          id v13 = v8;
          goto LABEL_18;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v12);
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  id v13 = 0;
LABEL_18:

  return v13;
}

- (double)roadWidthForRouteCoordinate:(PolylineCoordinate)a3
{
  id v4 = [(GEORouteMatcher *)self snappedSegmentForRouteCoordinate:a3];
  [(GEORouteMatcher *)self _roadWidthForSnappedSegment:v4];
  double v6 = v5;

  return v6;
}

- (double)_roadWidthForSnappedSegment:(id)a3
{
  v3 = [a3 road];
  [v3 roadWidth];
  double v5 = v4;

  double result = 11.1;
  if (v5 > 0.0) {
    return v5;
  }
  return result;
}

- (void)_startRouteMatch
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  candidateRouteMatches = self->_candidateRouteMatches;
  self->_candidateRouteMatches = v3;
}

- (id)_startStepForPreviousRouteMatch:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4
    || (-[GEORouteMatcher _stepForRouteCoordinate:stepHint:](self, "_stepForRouteCoordinate:stepHint:", [v4 routeCoordinate], 0), (double v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [(GEOComposedRoute *)self->_route steps];
    double v6 = [v7 firstObject];
  }

  return v6;
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  id v8 = (double *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    double v11 = v8[3];
    double v12 = v8[4];
    double v14 = v8[5];
    double v13 = v8[6];
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
  }
  if (![(GEORouteMatcher *)self _shouldConsiderCourseForLocation:v9]) {
    goto LABEL_17;
  }
  [v9 course];
  long double v16 = v15;
  long double v17 = GEOBearingFromCoordinateToCoordinate(v11, v12, v14, v13);
  double v18 = fmod(v17, 360.0);
  if (v18 >= 0.0) {
    double v19 = v18;
  }
  else {
    double v19 = v18 + 360.0;
  }
  double v20 = fmod(v16, 360.0);
  if (v20 >= 0.0) {
    double v21 = v20;
  }
  else {
    double v21 = v20 + 360.0;
  }
  double v22 = fmod(v19, 360.0);
  if (v22 < 0.0) {
    double v22 = v22 + 360.0;
  }
  double v23 = v21 - v22;
  if (v21 - v22 >= -180.0)
  {
    if (v23 > 180.0) {
      double v23 = v23 + -360.0;
    }
  }
  else
  {
    double v23 = v23 + 360.0;
  }
  [v9 courseAccuracy];
  if (fabs(v23) > v24 + 45.0)
  {
    float v42 = 0;
  }
  else
  {
LABEL_17:
    unint64_t v48 = 0xBF80000000000000;
    [v9 coordinate];
    double v33 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v8, &v49.latitude, (uint64_t)&v48, v25, v26, v27, v28, v29, v30, v31, v32);
    [v9 horizontalAccuracy];
    double v35 = v34;
    if (v8) {
      double v36 = (void *)*((void *)v8 + 7);
    }
    else {
      double v36 = 0;
    }
    id v37 = v36;
    double v38 = [v10 step];
    [(GEORouteMatcher *)self _scoreModifierForStep:v37 previousStep:v38];
    double v40 = v39;

    uint64_t v41 = objc_alloc_init(_GEOCandidateRouteMatch);
    float v42 = v41;
    if (v41)
    {
      double v43 = 1.0 - v33 / (v35 + 50.0) + v40;
      v41->_isGoodMatch = v43 > 0.0;
      v41->_score = v43;
      v41->_distanceFromRoute = v33;
      v41->_routeCoordinate = (PolylineCoordinate)v48;
      v41->_locationCoordinate = v49;
    }
    if (v8) {
      unint64_t v44 = (void *)*((void *)v8 + 7);
    }
    else {
      unint64_t v44 = 0;
    }
    id v45 = v44;
    uint64_t v46 = [v45 stepIndex];
    if (v42) {
      v42->_stepIndex = v46;
    }

    -[_GEOCandidateRouteMatch setSegment:]((uint64_t)v42, v8);
  }

  return v42;
}

- (void)_considerCandidateMatch:(id)a3
{
  id v8 = a3;
  candidateRouteMatches = self->_candidateRouteMatches;
  uint64_t v5 = [(NSMutableArray *)candidateRouteMatches count];
  self;
  id v6 = &__block_literal_global_165;
  uint64_t v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](candidateRouteMatches, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v5, 1536, &__block_literal_global_165);

  [(NSMutableArray *)self->_candidateRouteMatches insertObject:v8 atIndex:v7];
  while ((unint64_t)[(NSMutableArray *)self->_candidateRouteMatches count] >= 4)
    [(NSMutableArray *)self->_candidateRouteMatches removeLastObject];
}

- (id)_topRouteMatchCandidate
{
  return (id)[(NSMutableArray *)self->_candidateRouteMatches firstObject];
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8 = a3;
  if ([v8 isGoodMatch])
  {
    self->_hasBeenOnRouteOnce = 1;
    objc_storeStrong((id *)&self->_lastGoodRouteMatch, a3);
  }
  else if (!self->_hasBeenOnRouteOnce && [v8 stepIndex] == 1)
  {
    [v8 setStepIndex:0];
  }
  candidateRouteMatches = self->_candidateRouteMatches;
  self->_candidateRouteMatches = 0;
}

- (double)_scoreModifierForStep:(id)a3 previousStep:(id)a4
{
  return 0.0;
}

- (BOOL)_shouldConsiderCourseForLocation:(id)a3
{
  return [a3 hasAccurateCourse];
}

- (BOOL)_supportsSnapping
{
  return 0;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (BOOL)useStrictInitialOnRouteCriteria
{
  return self->_useStrictInitialOnRouteCriteria;
}

- (void)setUseStrictInitialOnRouteCriteria:(BOOL)a3
{
  self->_useStrictInitialOnRouteCriteria = a3;
}

- (double)maxMatchDistanceFromPreviousRouteMatch
{
  return self->_maxMatchDistanceFromPreviousRouteMatch;
}

- (void)setMaxMatchDistanceFromPreviousRouteMatch:(double)a3
{
  self->_maxMatchDistanceFromPreviousRouteMatch = a3;
}

- (BOOL)requiresRoadNetworkData
{
  return self->_requiresRoadNetworkData;
}

- (BOOL)shouldSnapRouteMatchToRoute
{
  return self->_shouldSnapRouteMatchToRoute;
}

- (void)setShouldSnapRouteMatchToRoute:(BOOL)a3
{
  self->_shouldSnapRouteMatchToRoute = a3;
}

- (BOOL)useMatchedCoordinateForMatching
{
  return self->_useMatchedCoordinateForMatching;
}

- (void)setUseMatchedCoordinateForMatching:(BOOL)a3
{
  self->_useMatchedCoordinateForMatching = a3;
}

- (BOOL)shouldWaitForSnappedSegments
{
  return self->_shouldWaitForSnappedSegments;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (GEORouteMatch)previousRouteMatch
{
  return self->_previousRouteMatch;
}

- (GEORouteMatch)lastGoodRouteMatch
{
  return self->_lastGoodRouteMatch;
}

- (BOOL)hasBeenOnRouteOnce
{
  return self->_hasBeenOnRouteOnce;
}

- (_GEOCandidateRouteMatch)closestCandidateRouteMatch
{
  return self->_closestCandidateRouteMatch;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_closestCandidateRouteMatch, 0);
  objc_storeStrong((id *)&self->_lastGoodRouteMatch, 0);
  objc_storeStrong((id *)&self->_previousRouteMatch, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_candidateRouteMatches, 0);
  objc_storeStrong((id *)&self->_snappedSegments, 0);

  objc_storeStrong((id *)&self->_pathMatcher, 0);
}

@end
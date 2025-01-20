@interface GEOTransitRouteMatcher
- (BOOL)_shouldConsiderCourseForLocation:(id)a3;
- (BOOL)_stepsInSameRange:(id)a3 nextStep:(id)a4;
- (BOOL)isStationCoordinateOnRoute:(id)a3;
- (GEOTransitRouteMatcher)initWithRoute:(id)a3 motionContext:(id)a4 auditToken:(id)a5;
- (double)_scoreModifierForStep:(id)a3 previousStep:(id)a4;
- (double)distanceToClosestWalkingSegment;
- (id)motionContext;
- (void)_considerCandidateMatch:(id)a3;
- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (void)_insertUpdater:(id)a3 into:(id)a4;
- (void)_startRouteMatch;
@end

@implementation GEOTransitRouteMatcher

- (GEOTransitRouteMatcher)initWithRoute:(id)a3 motionContext:(id)a4 auditToken:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v52 = a4;
  v62.receiver = self;
  v62.super_class = (Class)GEOTransitRouteMatcher;
  v57 = v8;
  v9 = [(GEORouteMatcher *)&v62 initWithRoute:v8 auditToken:a5];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_motionContext, a4);
    v56 = [MEMORY[0x1E4F1CA80] set];
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = [v8 steps];
    uint64_t v12 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v12)
    {
      uint64_t v54 = *(void *)v59;
      do
      {
        uint64_t v55 = v12;
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v59 != v54) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v15 = [v14 startingStop];
          v16 = [v57 getStationForStop:v15];

          if (v16) {
            [v56 addObject:v16];
          }
          v17 = [v14 endingStop];
          v18 = [v57 getStationForStop:v17];

          if (v18) {
            [v56 addObject:v18];
          }
          if ([v14 shouldCreateEnterBoardGroup])
          {
            v19 = [[_GEORouteMatchUpdater_EnterBoard alloc] initWithTransitRouteMatcher:v10 boardVehicleStep:v14];
            [(GEOTransitRouteMatcher *)v10 _insertUpdater:v19 into:v11];
          }
          if ([v14 shouldCreateTripProgressionGroup])
          {
            v20 = objc_msgSend(v57, "segmentForStepIndex:", objc_msgSend(v14, "stepIndex"));
            v21 = [[_GEORouteMatchUpdater_LineProgression alloc] initWithTransitRouteMatcher:v10 tripSegment:v20];
            [(GEOTransitRouteMatcher *)v10 _insertUpdater:v21 into:v11];
          }
          if ([v14 shouldCreateFerryProgressionGroup])
          {
            v22 = objc_msgSend(v57, "segmentForStepIndex:", objc_msgSend(v14, "stepIndex"));
            v23 = [_GEORouteMatchUpdater_FerryProgression alloc];
            v24 = [(GEORouteMatcher *)v10 route];
            v25 = [(_GEORouteMatchUpdater_FerryProgression *)v23 initWithRoute:v24 tripSegment:v22];

            [(GEOTransitRouteMatcher *)v10 _insertUpdater:v25 into:v11];
          }
          if ([v14 shouldCreateAlightExitGroup])
          {
            v26 = [[_GEORouteMatchUpdater_AlightExit alloc] initWithTransitRouteMatcher:v10 alightStep:v14];
            [(GEOTransitRouteMatcher *)v10 _insertUpdater:v26 into:v11];
          }
          if ([v14 shouldCreateTransferGroup])
          {
            if ([v14 transportType] == 1) {
              v27 = v14;
            }
            else {
              v27 = 0;
            }
            id v28 = v27;
            v29 = [v28 nextTransitStep];
            if ([v29 maneuver] == 6)
            {
              id v30 = [v29 nextTransitStep];
            }
            else
            {
              id v30 = v29;
            }
            v31 = v30;
            v32 = [[_GEORouteMatchUpdater_Transfer alloc] initWithTransitRouteMatcher:v10 alightStep:v28 transferStep:v29 boardStep:v30];
            [(GEOTransitRouteMatcher *)v10 _insertUpdater:v32 into:v11];
          }
          if ([v14 shouldCreateArrivalGroup])
          {
            v33 = [_GEORouteMatchUpdater_Arrival alloc];
            v34 = [(GEORouteMatcher *)v10 route];
            v35 = [(_GEORouteMatchUpdater_Arrival *)v33 initWithRoute:v34 arrivalStep:v14];

            [(GEOTransitRouteMatcher *)v10 _insertUpdater:v35 into:v11];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v12);
    }

    uint64_t v36 = [v56 allObjects];
    stationsOnRoute = v10->_stationsOnRoute;
    v10->_stationsOnRoute = (NSArray *)v36;

    objc_storeStrong((id *)&v10->_routeMatchUpdaters, v11);
    v38 = [MEMORY[0x1E4F1CA48] array];
    v39 = [v57 steps];
    v40 = [v39 firstObject];

    while (v40)
    {
      id v41 = v40;
      v40 = [v41 getNextStep];
      if (v40)
      {
        v42 = v41;
        while ([(GEOTransitRouteMatcher *)v10 _stepsInSameRange:v41 nextStep:v40])
        {
          id v43 = v40;

          uint64_t v44 = [v43 getNextStep];

          v40 = (void *)v44;
          v42 = v43;
          if (!v44) {
            goto LABEL_39;
          }
        }
        id v43 = v42;
      }
      else
      {
        id v43 = v41;
      }
LABEL_39:
      uint64_t v45 = [v41 stepIndex];
      uint64_t v46 = [v43 stepIndex];
      uint64_t v47 = [v41 stepIndex];
      v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v45, v46 - v47 + 1);
      [(NSArray *)v38 addObject:v48];
    }
    stepRanges = v10->_stepRanges;
    v10->_stepRanges = v38;

    v50 = v10;
  }

  return v10;
}

- (BOOL)isStationCoordinateOnRoute:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_stationsOnRoute;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "location", (void)v14);
        [v9 coordinate];
        double v12 = GEOCalculateDistanceRadius(var0, var1, v10, v11, 6367000.0);

        if (v12 < 60.0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)motionContext
{
  return self->_motionContext;
}

- (BOOL)_stepsInSameRange:(id)a3 nextStep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 transportType] == 1) {
    int v7 = [v5 maneuver];
  }
  else {
    int v7 = 2;
  }
  if ([v6 transportType] == 1) {
    int v8 = [v6 maneuver];
  }
  else {
    int v8 = 2;
  }
  BOOL v9 = v7 == v8 || v7 == 2 && v8 == 7 || v7 == 4 && v8 == 5;

  return v9;
}

- (void)_startRouteMatch
{
  self->_distanceToClosestWalkingSegment = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)GEOTransitRouteMatcher;
  [(GEORouteMatcher *)&v2 _startRouteMatch];
}

- (void)_considerCandidateMatch:(id)a3
{
  id v4 = a3;
  id v5 = [(GEORouteMatcher *)self route];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = *((void *)v4 + 4);
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = [v5 stepAtIndex:v7];
  uint64_t v9 = [v8 routeSegmentType];

  if (v9 == 2)
  {
    if (!v4)
    {
      double v10 = 0.0;
      if (self->_distanceToClosestWalkingSegment <= 0.0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    double v10 = *((double *)v4 + 5);
    if (self->_distanceToClosestWalkingSegment > v10) {
LABEL_6:
    }
      self->_distanceToClosestWalkingSegment = v10;
  }
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)GEOTransitRouteMatcher;
  [(GEORouteMatcher *)&v11 _considerCandidateMatch:v4];
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v11 = self->_routeMatchUpdaters;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v11);
      }
      if ([*(id *)(*((void *)&v17 + 1) + 8 * v14) updateRouteMatch:v8 previousRouteMatch:v9 forLocation:v10])break; {
      if (v12 == ++v14)
      }
      {
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v9)
  {
    unint64_t v15 = [v8 stepIndex];
    if (v15 < [v9 stepIndex]) {
      objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)GEOTransitRouteMatcher;
  [(GEORouteMatcher *)&v16 _finishRouteMatch:v8 previousRouteMatch:v9 forLocation:v10];
}

- (double)_scoreModifierForStep:(id)a3 previousStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v8 >= [(NSArray *)self->_stepRanges count]) {
        break;
      }
      objc_super v11 = [(NSArray *)self->_stepRanges objectAtIndex:v8];
      unint64_t v12 = [v11 rangeValue];
      unint64_t v14 = v13;

      unint64_t v15 = [v6 stepIndex];
      unint64_t v16 = [v7 stepIndex];
      if (v15 - v12 < v14 && v15 >= v12) {
        uint64_t v9 = v8;
      }
      if (v16 - v12 < v14 && v16 >= v12) {
        uint64_t v10 = v8;
      }
      ++v8;
    }
    while (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL);
    double v20 = -0.5;
    if (v9 == v10 + 1) {
      double v20 = -0.25;
    }
    if (v9 == v10) {
      double v21 = 0.0;
    }
    else {
      double v21 = v20;
    }
  }
  else if ([v6 routeSegmentType] == 2)
  {
    double v21 = 0.0;
  }
  else
  {
    double v21 = -0.25;
  }

  return v21;
}

- (BOOL)_shouldConsiderCourseForLocation:(id)a3
{
  return 0;
}

- (void)_insertUpdater:(id)a3 into:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_msgSend(v5, "insertObject:atIndex:", v6, objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1536, &__block_literal_global_152));
}

uint64_t __46__GEOTransitRouteMatcher__insertUpdater_into___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "priority"));
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "priority"));
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

- (double)distanceToClosestWalkingSegment
{
  return self->_distanceToClosestWalkingSegment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepRanges, 0);
  objc_storeStrong((id *)&self->_routeMatchUpdaters, 0);
  objc_storeStrong((id *)&self->_stationsOnRoute, 0);

  objc_storeStrong((id *)&self->_motionContext, 0);
}

@end
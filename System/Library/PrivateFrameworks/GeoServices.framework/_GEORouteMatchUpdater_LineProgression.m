@interface _GEORouteMatchUpdater_LineProgression
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater_LineProgression)initWithTransitRouteMatcher:(id)a3 tripSegment:(id)a4;
- (id).cxx_construct;
- (unint64_t)priority;
@end

@implementation _GEORouteMatchUpdater_LineProgression

- (_GEORouteMatchUpdater_LineProgression)initWithTransitRouteMatcher:(id)a3 tripSegment:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEORouteMatchUpdater_LineProgression;
  v7 = [(_GEORouteMatchUpdater *)&v17 initWithTransitRouteMatcher:a3];
  if (v7)
  {
    v8 = [v6 steps];
    v9 = [v8 firstObject];

    v10 = [v6 steps];
    uint64_t v11 = [v10 lastObject];

    boardStep = v7->_boardStep;
    v7->_boardStep = v9;
    v13 = v9;

    alightStep = v7->_alightStep;
    v7->_alightStep = (GEOComposedTransitTripRouteStep *)v11;

    v15 = v7;
  }

  return v7;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 horizontalAccuracy];
  double v12 = v11;
  [v10 coordinate];
  double v14 = v13;
  double v16 = v15;
  [(GEOComposedTransitRouteStep *)self->_boardStep startGeoCoordinate];
  double v18 = v17;
  double v20 = v19;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._routeMatcher);
  [WeakRetained distanceToClosestWalkingSegment];
  double v23 = v22;
  double v24 = v12 + 400.0;
  double v25 = GEOCalculateDistanceRadius(v14, v16, v18, v20, 6367000.0);

  if (v23 <= v24 || v25 <= v24)
  {
    unint64_t v27 = [v8 stepIndex];
    if (v27 > [(GEOComposedRouteStep *)self->_boardStep stepIndex])
    {
      unint64_t v28 = [(GEOComposedRouteStep *)self->_alightStep stepIndex];
      if (v28 >= [v8 stepIndex])
      {
        unint64_t v29 = [v9 stepIndex];
        if (v29 < [(GEOComposedRouteStep *)self->_boardStep stepIndex])
        {
          if ([v8 isGoodMatch])
          {
            if ([v10 hasHorizontalAccuracy])
            {
              [v10 horizontalAccuracy];
              if (v30 <= 65.0)
              {
                p_startRouteCoordinate = &self->_startRouteCoordinate;
                if (self->_startRouteCoordinate.index
                  || fabsf(self->_startRouteCoordinate.offset + 1.0) >= 0.00000011921)
                {
                  -[GEOComposedRoute distanceFromPoint:toPoint:](self->super._route, "distanceFromPoint:toPoint:", *p_startRouteCoordinate, [v8 routeCoordinate]);
                  if (v34 > 100.0
                    && ([(GEOMotionContext *)self->super._motionContext confidence] != 2
                     || ![(GEOComposedTransitTripRouteStep *)self->_boardStep isBus]
                     && ![(GEOComposedTransitTripRouteStep *)self->_boardStep isRail]
                     || [(GEOMotionContext *)self->super._motionContext isDriving]))
                  {
                    goto LABEL_19;
                  }
                }
                else
                {
                  PolylineCoordinate *p_startRouteCoordinate = (PolylineCoordinate)[v8 routeCoordinate];
                }
              }
            }
          }
          v35 = -[GEOComposedRoute stepAtIndex:](self->super._route, "stepAtIndex:", [v8 stepIndex]);
          v36 = -[GEOComposedRoute stepAtIndex:](self->super._route, "stepAtIndex:", [v9 stepIndex]);
          objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
          v38[0] = v36;
          v38[1] = v35;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
          [v8 setCandidateSteps:v37];

LABEL_19:
          BOOL v32 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  BOOL v32 = 0;
LABEL_16:

  return v32;
}

- (unint64_t)priority
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alightStep, 0);

  objc_storeStrong((id *)&self->_boardStep, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0xBF80000000000000;
  return self;
}

@end
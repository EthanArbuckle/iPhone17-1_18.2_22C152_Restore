@interface _GEORouteMatchUpdater_AlightExit
- (BOOL)_isLocationNearAlightNode:(id)a3;
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater_AlightExit)initWithTransitRouteMatcher:(id)a3 alightStep:(id)a4;
- (id).cxx_construct;
@end

@implementation _GEORouteMatchUpdater_AlightExit

- (_GEORouteMatchUpdater_AlightExit)initWithTransitRouteMatcher:(id)a3 alightStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)_GEORouteMatchUpdater_AlightExit;
  v8 = [(_GEORouteMatchUpdater *)&v38 initWithTransitRouteMatcher:v6];
  if (v8)
  {
    v9 = [v7 getNextStep];
    objc_storeStrong((id *)&v8->_alightStep, a4);
    uint64_t v10 = [v7 endingStop];
    alightStop = v8->_alightStop;
    v8->_alightStop = (GEOPBTransitStop *)v10;

    uint64_t v12 = [(GEOComposedRoute *)v8->super._route getStationForStop:v8->_alightStop];
    alightStation = v8->_alightStation;
    v8->_alightStation = (GEOPBTransitStation *)v12;

    v8->_routeCoordinateAlightStation.index = [v7 endPointIndex];
    v8->_routeCoordinateAlightStation.offset = 0.0;
    v14 = v8->_alightStation;
    v15 = [v9 transitStep];
    int v16 = [v15 maneuverType];

    if (v16 == 6)
    {
      v17 = [v9 nextTransitStep];
    }
    else
    {
      v17 = v9;
    }
    v18 = [v17 transitStep];
    int v19 = [v18 maneuverType];

    if (v19 == 8)
    {
      id v20 = v17;
      objc_storeStrong((id *)&v8->_postAlightStep, v17);
      uint64_t v21 = [v20 getNextStep];
      postAlightWalkingStep = v8->_postAlightWalkingStep;
      v8->_postAlightWalkingStep = (GEOComposedRouteStep *)v21;

      if (!v14 || !v20) {
        goto LABEL_15;
      }
      [v20 endGeoCoordinate];
      double v24 = v23;
      double v26 = v25;
      v27 = v8->_alightStation;
      v28 = [v20 accessPoint];
      -[_GEORouteMatchUpdater _stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:](v8, "_stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:", v27, v28, v24, v26);
      v8->super._stationRadius = v29;
    }
    else
    {
      v30 = [v17 transitStep];
      int v31 = [v30 maneuverType];

      if (v31 == 2)
      {
        objc_storeStrong((id *)&v8->_postAlightStep, v17);
        uint64_t v32 = 96;
      }
      else
      {
        v33 = [v17 transitStep];
        int v34 = [v33 maneuverType];

        if (v34 != 10)
        {
          id v20 = 0;
          goto LABEL_15;
        }
        uint64_t v32 = 88;
      }
      v35 = v17;
      id v20 = 0;
      v28 = *(Class *)((char *)&v8->super.super.isa + v32);
      *(Class *)((char *)&v8->super.super.isa + v32) = v35;
    }

LABEL_15:
    v36 = v8;
  }
  return v8;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9
    || !self->_postAlightWalkingStep
    || (unint64_t v11 = [v9 stepIndex],
        v11 < [(GEOComposedRouteStep *)self->_postAlightWalkingStep stepIndex]))
  {
    if ([(_GEORouteMatchUpdater_AlightExit *)self _isLocationNearAlightNode:v10])
    {
      [v8 setIsGoodMatch:1];
      objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_postAlightStep, "stepIndex"));
      alightStation = self->_alightStation;
      if (alightStation) {
        uint64_t v13 = [(GEOPBTransitStation *)alightStation muid];
      }
      else {
        uint64_t v13 = [(GEOPBTransitStop *)self->_alightStop muid];
      }
      [v8 setTransitID:v13];
      int v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", self->_postAlightStep, self->_alightStep, 0);
      if (self->_postAlightWalkingStep)
      {
        if ([(GEOMotionContext *)self->super._motionContext isWalking]) {
          BOOL v18 = [(GEOMotionContext *)self->super._motionContext confidence] == 2;
        }
        else {
          BOOL v18 = 0;
        }
        int v19 = [GEOLocation alloc];
        [(GEOComposedRouteStep *)self->_postAlightWalkingStep endGeoCoordinate];
        double v21 = v20;
        [(GEOComposedRouteStep *)self->_postAlightWalkingStep endGeoCoordinate];
        v22 = -[GEOLocation initWithLatitude:longitude:](v19, "initWithLatitude:longitude:", v21);
        if (v18)
        {
          uint64_t v23 = [v9 stepIndex];
          if (v23 == [(GEOComposedRouteStep *)self->_postAlightStep stepIndex])
          {
            if ([(_GEORouteMatchUpdater_AlightExit *)self _isLocationNearAlightNode:v22]) {
              objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_postAlightWalkingStep, "stepIndex"));
            }
          }
        }
        [v16 addObject:self->_postAlightWalkingStep];
      }
      [v8 setCandidateSteps:v16];
      if ([v10 hasTransitID]) {
        [v8 setModifiedHorizontalAccuracy:self->super._stationRadius];
      }
      char v15 = 1;
LABEL_33:

      goto LABEL_34;
    }
    if (!v9
      || (unint64_t v14 = [v9 stepIndex], v14 <= -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex")))
    {
      int v16 = -[GEOComposedRoute segmentForStepIndex:](self->super._route, "segmentForStepIndex:", [v8 stepIndex]);
      v17 = [(GEOComposedRouteStep *)self->_alightStep segment];
      if (v16 == v17)
      {
        uint64_t v24 = [v8 stepIndex];
        if (v24 + 1 == [(GEOComposedRouteStep *)self->_alightStep stepIndex])
        {
          objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"));
          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          double v26 = v25;
          if (self->_alightStep) {
            objc_msgSend(v25, "addObject:");
          }
          if (self->_postAlightStep) {
            objc_msgSend(v26, "addObject:");
          }
          v27 = (void *)[v26 copy];
          [v8 setCandidateSteps:v27];
        }
        char v15 = [v8 isGoodMatch];
      }
      else
      {
        char v15 = 0;
      }

      goto LABEL_33;
    }
  }
  char v15 = 0;
LABEL_34:

  return v15;
}

- (BOOL)_isLocationNearAlightNode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_GEORouteMatchUpdater *)self _isLocation:v4 nearStation:self->_alightStation]
    || [(_GEORouteMatchUpdater *)self _isLocation:v4 nearStop:self->_alightStop];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postAlightWalkingStep, 0);
  objc_storeStrong((id *)&self->_postAlightStep, 0);
  objc_storeStrong((id *)&self->_alightStep, 0);
  objc_storeStrong((id *)&self->_alightStation, 0);

  objc_storeStrong((id *)&self->_alightStop, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0xBF80000000000000;
  return self;
}

@end
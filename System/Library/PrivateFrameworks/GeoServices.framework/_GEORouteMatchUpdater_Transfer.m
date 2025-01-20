@interface _GEORouteMatchUpdater_Transfer
- (BOOL)_isLocation:(id)a3 nearStation:(id)a4;
- (BOOL)_isLocation:(id)a3 nearStop:(id)a4;
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater_Transfer)initWithTransitRouteMatcher:(id)a3 alightStep:(id)a4 transferStep:(id)a5 boardStep:(id)a6;
@end

@implementation _GEORouteMatchUpdater_Transfer

- (_GEORouteMatchUpdater_Transfer)initWithTransitRouteMatcher:(id)a3 alightStep:(id)a4 transferStep:(id)a5 boardStep:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v24 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_GEORouteMatchUpdater_Transfer;
  v13 = [(_GEORouteMatchUpdater *)&v25 initWithTransitRouteMatcher:v10];
  if (v13)
  {
    uint64_t v14 = [v11 endingStop];
    alightStop = v13->_alightStop;
    v13->_alightStop = (GEOPBTransitStop *)v14;

    uint64_t v16 = [v12 startingStop];
    boardStop = v13->_boardStop;
    v13->_boardStop = (GEOPBTransitStop *)v16;

    uint64_t v18 = [(GEOComposedRoute *)v13->super._route getStationForStop:v13->_alightStop];
    alightStation = v13->_alightStation;
    v13->_alightStation = (GEOPBTransitStation *)v18;

    uint64_t v20 = [(GEOComposedRoute *)v13->super._route getStationForStop:v13->_boardStop];
    boardStation = v13->_boardStation;
    v13->_boardStation = (GEOPBTransitStation *)v20;

    objc_storeStrong((id *)&v13->_alightStep, a4);
    objc_storeStrong((id *)&v13->_transferStep, a5);
    objc_storeStrong((id *)&v13->_boardStep, a6);
    v22 = v13;
  }

  return v13;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    unint64_t v11 = [v9 stepIndex];
    if (v11 > [(GEOComposedRouteStep *)self->_boardStep stepIndex])
    {
LABEL_13:
      BOOL v22 = 0;
      goto LABEL_24;
    }
  }
  BOOL v12 = [(_GEORouteMatchUpdater_Transfer *)self _isLocation:v10 nearStation:self->_alightStation];
  BOOL v13 = v12;
  if (self->_alightStation == self->_boardStation) {
    BOOL v27 = v12;
  }
  else {
    BOOL v27 = -[_GEORouteMatchUpdater_Transfer _isLocation:nearStation:](self, "_isLocation:nearStation:", v10);
  }
  BOOL v14 = [(_GEORouteMatchUpdater_Transfer *)self _isLocation:v10 nearStop:self->_alightStop];
  BOOL v15 = [(_GEORouteMatchUpdater_Transfer *)self _isLocation:v10 nearStop:self->_boardStop];
  BOOL v16 = v15;
  if (v13 || v14)
  {
    v17 = &OBJC_IVAR____GEORouteMatchUpdater_Transfer__transferStep;
  }
  else
  {
    if (!v27 && !v15) {
      goto LABEL_11;
    }
    v17 = &OBJC_IVAR____GEORouteMatchUpdater_Transfer__boardStep;
  }
  uint64_t v18 = [*(id *)((char *)&self->super.super.isa + *v17) stepIndex];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    uint64_t v19 = [v8 stepIndex];
    if (v19 + 1 == [(GEOComposedRouteStep *)self->_alightStep stepIndex])
    {
      objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"));
      boardStep = self->_boardStep;
      v28[0] = self->_alightStep;
      v28[1] = boardStep;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      [v8 setCandidateSteps:v21];
    }
    goto LABEL_13;
  }
  [v8 setIsGoodMatch:1];
  [v8 setStepIndex:v18];
  alightStep = self->_alightStep;
  v29[0] = self->_boardStep;
  v29[1] = alightStep;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v8 setCandidateSteps:v24];

  if (v16) {
    p_boardStop = (id *)&self->_boardStop;
  }
  else {
    p_boardStop = (id *)&self->_alightStop;
  }
  if (v27) {
    p_boardStop = (id *)&self->_boardStation;
  }
  if (v13) {
    p_boardStop = (id *)&self->_alightStation;
  }
  objc_msgSend(v8, "setTransitID:", objc_msgSend(*p_boardStop, "muid"));
  if ([v10 hasTransitID]) {
    [v8 setModifiedHorizontalAccuracy:self->super._stationRadius];
  }
  BOOL v22 = 1;
LABEL_24:

  return v22;
}

- (BOOL)_isLocation:(id)a3 nearStation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 horizontalAccuracy];
  double v8 = 200.0;
  if (v9 < 200.0)
  {
    [v6 horizontalAccuracy];
    double v8 = v10;
  }
  unint64_t v11 = [v7 location];
  [v11 coordinate];
  BOOL v14 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, [v7 muid], v12, v13, v8 + 100.0);

  return v14;
}

- (BOOL)_isLocation:(id)a3 nearStop:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 horizontalAccuracy];
  double v8 = 200.0;
  if (v9 < 200.0)
  {
    [v6 horizontalAccuracy];
    double v8 = v10;
  }
  unint64_t v11 = [v7 latLng];
  [v11 coordinate];
  BOOL v14 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, [v7 muid], v12, v13, v8 + 50.0);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardStep, 0);
  objc_storeStrong((id *)&self->_transferStep, 0);
  objc_storeStrong((id *)&self->_alightStep, 0);
  objc_storeStrong((id *)&self->_boardStop, 0);
  objc_storeStrong((id *)&self->_alightStop, 0);
  objc_storeStrong((id *)&self->_boardStation, 0);

  objc_storeStrong((id *)&self->_alightStation, 0);
}

@end
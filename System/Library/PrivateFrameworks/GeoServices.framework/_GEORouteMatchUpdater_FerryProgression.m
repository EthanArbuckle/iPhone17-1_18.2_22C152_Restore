@interface _GEORouteMatchUpdater_FerryProgression
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater_FerryProgression)initWithRoute:(id)a3 tripSegment:(id)a4;
- (unint64_t)priority;
@end

@implementation _GEORouteMatchUpdater_FerryProgression

- (_GEORouteMatchUpdater_FerryProgression)initWithRoute:(id)a3 tripSegment:(id)a4
{
  id v5 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GEORouteMatchUpdater_FerryProgression;
  v6 = [(_GEORouteMatchUpdater_FerryProgression *)&v19 init];
  if (v6)
  {
    v7 = [v5 endingTransitStop];
    v8 = [v7 latLng];
    [v8 coordinate];
    v6->_alightLocationCoordinate.latitude = v9;
    v6->_alightLocationCoordinate.longitude = v10;

    v11 = [v5 steps];
    uint64_t v12 = [v11 firstObject];
    boardStep = v6->_boardStep;
    v6->_boardStep = (GEOComposedRouteStep *)v12;

    v14 = [v5 steps];
    uint64_t v15 = [v14 lastObject];
    alightStep = v6->_alightStep;
    v6->_alightStep = (GEOComposedRouteStep *)v15;

    v17 = v6;
  }

  return v6;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 stepIndex];
  if (v11 == [(GEOComposedRouteStep *)self->_boardStep stepIndex])
  {
    [v10 coordinate];
    long double v14 = GEOCalculateDistanceRadius(v12, v13, self->_alightLocationCoordinate.latitude, self->_alightLocationCoordinate.longitude, 6367000.0);
    double startProgressionDistanceToDestination = self->_startProgressionDistanceToDestination;
    double v16 = startProgressionDistanceToDestination - v14;
    unint64_t progressionCount = self->_progressionCount;
    if (progressionCount < 0x10 || v16 <= 150.0)
    {
      if (startProgressionDistanceToDestination <= 0.0 || v16 < -100.0)
      {
        unint64_t progressionCount = 0;
        self->_double startProgressionDistanceToDestination = v14;
        self->_unint64_t progressionCount = 0;
      }
      self->_unint64_t progressionCount = progressionCount + 1;
    }
    else
    {
      objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_alightStep, "stepIndex"));
      v21[0] = self->_alightStep;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v8 setCandidateSteps:v18];
    }
  }

  return 0;
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

@end
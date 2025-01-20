@interface MapsSuggestionsRealRoutineConnector
- (MapsSuggestionsRealRoutineConnector)init;
- (void)clearAllVehicleEventsWithHandler:(id)a3;
- (void)fetchLocationOfInterestAtLocation:(id)a3 withHandler:(id)a4;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withHandler:(id)a5;
- (void)fetchNextPLOIsFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withHandler:(id)a6;
- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5;
- (void)fetchRoutineModeFromLocation:(id)a3 withHandler:(id)a4;
- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4;
- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)startMonitoringVehicleEventsWithHandler:(id)a3;
- (void)stopMonitoringVehicleEvents;
@end

@implementation MapsSuggestionsRealRoutineConnector

- (MapsSuggestionsRealRoutineConnector)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsRealRoutineConnector;
  v2 = [(MapsSuggestionsRealRoutineConnector *)&v6 init];
  if (v2)
  {
    v3 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x1E4F5CEB8]);
    routineManager = v2->_routineManager;
    v2->_routineManager = v3;
  }
  return v2;
}

- (void)fetchNextPLOIsFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  kdebug_trace();
  routineManager = self->_routineManager;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__MapsSuggestionsRealRoutineConnector_fetchNextPLOIsFromLocation_startDate_timeInterval_withHandler___block_invoke;
  v15[3] = &unk_1E5CB7EF0;
  id v16 = v10;
  id v14 = v10;
  [(RTRoutineManager *)routineManager fetchNextPredictedLocationsOfInterestFromLocation:v12 startDate:v11 timeInterval:v15 withHandler:a5];
}

void __101__MapsSuggestionsRealRoutineConnector_fetchNextPLOIsFromLocation_startDate_timeInterval_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMonitoringVehicleEventsWithHandler:(id)a3
{
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4
{
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 withHandler:(id)a4
{
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withHandler:(id)a4
{
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 withHandler:(id)a4
{
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withHandler:(id)a5
{
}

- (void)fetchRoutineModeFromLocation:(id)a3 withHandler:(id)a4
{
}

- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4
{
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
}

- (void)stopMonitoringVehicleEvents
{
}

- (void)clearAllVehicleEventsWithHandler:(id)a3
{
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
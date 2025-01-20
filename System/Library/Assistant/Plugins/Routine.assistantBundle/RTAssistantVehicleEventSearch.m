@interface RTAssistantVehicleEventSearch
- (GEOLocationShifter)locationShifter;
- (OS_dispatch_queue)queue;
- (RTRoutineManager)routineManager;
- (void)performWithCompletion:(id)a3;
- (void)setLocationShifter:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRoutineManager:(id)a3;
@end

@implementation RTAssistantVehicleEventSearch

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (!queue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreroutine.assistant", 0);
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }

  return queue;
}

- (RTRoutineManager)routineManager
{
  routineManager = self->_routineManager;
  if (!routineManager)
  {
    v4 = (RTRoutineManager *)objc_opt_new();
    v5 = self->_routineManager;
    self->_routineManager = v4;

    routineManager = self->_routineManager;
  }

  return routineManager;
}

- (GEOLocationShifter)locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (GEOLocationShifter *)objc_opt_new();
    v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }

  return locationShifter;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_235C66CF4(qword_268836238);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235C64000, v5, OS_LOG_TYPE_INFO, "Received vehicle event search command.", buf, 2u);
  }

  v6 = [(RTAssistantVehicleEventSearch *)self routineManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_235C66044;
  v8[3] = &unk_264C72D80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchLastVehicleEventsWithHandler:v8];
}

- (void)setQueue:(id)a3
{
}

- (void)setRoutineManager:(id)a3
{
}

- (void)setLocationShifter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
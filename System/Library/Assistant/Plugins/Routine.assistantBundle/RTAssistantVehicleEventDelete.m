@interface RTAssistantVehicleEventDelete
- (RTRoutineManager)routineManager;
- (void)performWithCompletion:(id)a3;
- (void)setRoutineManager:(id)a3;
@end

@implementation RTAssistantVehicleEventDelete

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

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(RTAssistantVehicleEventDelete *)self routineManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_235C66C58;
  v7[3] = &unk_264C72DA8;
  id v8 = v4;
  id v6 = v4;
  [v5 clearAllVehicleEventsWithHandler:v7];
}

- (void)setRoutineManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
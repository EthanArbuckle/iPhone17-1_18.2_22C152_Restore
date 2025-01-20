@interface RTRoutineManagerExportedObject
- (RTRoutineManager)routineManager;
- (RTRoutineManagerExportedObject)initWithRoutineManager:(id)a3;
- (void)onDensityUpdate:(id)a3 error:(id)a4;
- (void)onLeechedLowConfidenceVisit:(id)a3 withError:(id)a4;
- (void)onLeechedVisit:(id)a3 withError:(id)a4;
- (void)onPlaceInferences:(id)a3 error:(id)a4;
- (void)onScenarioTrigger:(id)a3 withError:(id)a4;
- (void)onVehicleEvents:(id)a3 error:(id)a4;
- (void)onVisit:(id)a3 withError:(id)a4;
- (void)setRoutineManager:(id)a3;
@end

@implementation RTRoutineManagerExportedObject

- (RTRoutineManagerExportedObject)initWithRoutineManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RTRoutineManagerExportedObject;
  v5 = [(RTRoutineManagerExportedObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_routineManager, v4);
  }

  return v6;
}

- (void)onVisit:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onVisit:v7 withError:v6];
}

- (void)onLeechedVisit:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onLeechedVisit:v7 withError:v6];
}

- (void)onLeechedLowConfidenceVisit:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onLeechedLowConfidenceVisit:v7 withError:v6];
}

- (void)onPlaceInferences:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onPlaceInferences:v7 error:v6];
}

- (void)onScenarioTrigger:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onScenarioTrigger:v7 withError:v6];
}

- (void)onVehicleEvents:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onVehicleEvents:v7 error:v6];
}

- (void)onDensityUpdate:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTRoutineManagerExportedObject *)self routineManager];
  [v8 onDensityUpdate:v7 error:v6];
}

- (RTRoutineManager)routineManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routineManager);
  return (RTRoutineManager *)WeakRetained;
}

- (void)setRoutineManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
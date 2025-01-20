@interface RTAssistantVehicleEventCreate
- (RTRoutineManager)routineManager;
- (void)performWithCompletion:(id)a3;
- (void)setRoutineManager:(id)a3;
@end

@implementation RTAssistantVehicleEventCreate

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
  v5 = [(SALocalSearchVehicleEventCreate *)self location];

  if (v5)
  {
    v6 = [(SALocalSearchVehicleEventCreate *)self location];
    v7 = [v6 latitude];
    [v7 doubleValue];
    double v9 = v8;
    [(SALocalSearchVehicleEventCreate *)self location];
    v10 = id v33 = v4;
    v11 = [v10 longitude];
    [v11 doubleValue];
    double v13 = v12;

    if (objc_msgSend(MEMORY[0x263F417D8], "isLocationShiftRequiredForCoordinate:", v9, v13)) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    id v15 = objc_alloc(MEMORY[0x263F00A50]);
    v16 = [(SALocalSearchVehicleEventCreate *)self location];
    v17 = [v16 latitude];
    [v17 doubleValue];
    CLLocationDegrees v19 = v18;
    v20 = [(SALocalSearchVehicleEventCreate *)self location];
    v21 = [v20 longitude];
    [v21 doubleValue];
    CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(v19, v22);
    v24 = [(SALocalSearchVehicleEventCreate *)self location];
    v25 = [v24 accuracy];
    [v25 doubleValue];
    double v27 = v26;
    v28 = [MEMORY[0x263EFF910] date];
    v29 = objc_msgSend(v15, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v28, v14, v23.latitude, v23.longitude, 0.0, v27, -1.0);

    id v4 = v33;
  }
  else
  {
    v29 = 0;
  }
  v30 = [(RTAssistantVehicleEventCreate *)self routineManager];
  v31 = [(SALocalSearchVehicleEventCreate *)self notes];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_235C65B18;
  v34[3] = &unk_264C72C90;
  id v35 = v4;
  id v32 = v4;
  [v30 vehicleEventAtLocation:v29 notes:v31 handler:v34];
}

- (void)setRoutineManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
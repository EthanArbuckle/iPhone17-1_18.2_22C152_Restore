@interface _DKLocationMonitor
+ (id)entitlements;
+ (id)eventStream;
- (_DKLocationMonitor)init;
- (id)_locationFromVisit:(id)a3;
- (unint64_t)placeTypeFromType:(unint64_t)a3;
- (unint64_t)userSpecificPlaceTypeFromType:(unint64_t)a3;
- (void)_handleVisit:(id)a3;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKLocationMonitor

+ (id)eventStream
{
  return @"LocationVisit";
}

+ (id)entitlements
{
  return &unk_26D86D7E8;
}

- (_DKLocationMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)_DKLocationMonitor;
  v2 = [(_DKMonitor *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_INFO, "Enabling location monitor", buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x263F37F08] defaultManager];
    routineManager = v2->_routineManager;
    v2->_routineManager = (RTRoutineManager *)v4;

    v6 = [(_DKMonitor *)v2 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26___DKLocationMonitor_init__block_invoke;
    block[3] = &unk_264714788;
    v9 = v2;
    dispatch_sync(v6, block);
  }
  return v2;
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_DKLocationMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsActivation])
  {
    v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27___DKLocationMonitor_start__block_invoke;
    block[3] = &unk_264714788;
    void block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)_DKLocationMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsDeactivation])
  {
    v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26___DKLocationMonitor_stop__block_invoke;
    block[3] = &unk_264714788;
    void block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (id)_locationFromVisit:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F00A50];
  id v4 = a3;
  id v5 = [v3 alloc];
  [v4 coordinate];
  double v7 = v6;
  double v9 = v8;
  [v4 horizontalAccuracy];
  double v11 = v10;

  v12 = [MEMORY[0x263EFF910] distantPast];
  v13 = objc_msgSend(v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v12, v7, v9, 0.0, v11, 0.0, 0.0, 0.0);

  return v13;
}

- (void)_handleVisit:(id)a3
{
  v48[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  double v6 = [v4 departureDate];
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  double v9 = [MEMORY[0x263F08A00] defaultCenter];
  v42 = (void *)v5;
  if (v8 <= 0.0)
  {
    v47 = @"CLVisit";
    v48[0] = v4;
    v12 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    [v9 postNotificationName:@"DKLocationMonitorDidExitLOI" object:0 userInfo:v12];

    v13 = [MEMORY[0x263F351B8] userContext];
    v14 = [MEMORY[0x263F351D0] keyPathForNearbyLOIIdentifiers];
    [v13 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:v14];

    id v15 = objc_alloc(MEMORY[0x263F2A918]);
    v41 = [v4 _placeInference];
    uint64_t v39 = [v41 userType];
    if (v39)
    {
      v36 = [v4 _placeInference];
      unint64_t v16 = -[_DKLocationMonitor userSpecificPlaceTypeFromType:](self, "userSpecificPlaceTypeFromType:", [v36 userType]);
    }
    else
    {
      unint64_t v16 = 0;
    }
    v21 = [v4 _placeInference];
    uint64_t v22 = [v21 placeType];
    if (v22)
    {
      v13 = [v4 _placeInference];
      unint64_t v23 = -[_DKLocationMonitor placeTypeFromType:](self, "placeTypeFromType:", [v13 placeType]);
    }
    else
    {
      unint64_t v23 = 0;
    }
    v32 = [v4 _placeInference];
    v33 = [v32 _loiIdentifier];
    v34 = [v33 UUIDString];
    v27 = (void *)[v15 initWithUserSpecificPlaceType:v16 placeType:v23 loiIdentifier:v34 starting:0];

    if (v22) {
    v28 = v42;
    }
    if (v39) {

    }
    v30 = [v42 source];
    [v30 sendEvent:v27];
  }
  else
  {
    v45 = @"CLVisit";
    id v46 = v4;
    double v10 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    [v9 postNotificationName:@"DKLocationMonitorDidEnterLOI" object:0 userInfo:v10];

    id v37 = objc_alloc(MEMORY[0x263F2A918]);
    v40 = [v4 _placeInference];
    uint64_t v38 = [v40 userType];
    if (v38)
    {
      v35 = [v4 _placeInference];
      unint64_t v11 = -[_DKLocationMonitor userSpecificPlaceTypeFromType:](self, "userSpecificPlaceTypeFromType:", [v35 userType]);
    }
    else
    {
      unint64_t v11 = 0;
    }
    v17 = [v4 _placeInference];
    uint64_t v18 = [v17 placeType];
    if (v18)
    {
      double v10 = [v4 _placeInference];
      v19 = self;
      unint64_t v20 = -[_DKLocationMonitor placeTypeFromType:](self, "placeTypeFromType:", [v10 placeType]);
    }
    else
    {
      v19 = self;
      unint64_t v20 = 0;
    }
    v24 = [v4 _placeInference];
    v25 = [v24 _loiIdentifier];
    v26 = [v25 UUIDString];
    v27 = (void *)[v37 initWithUserSpecificPlaceType:v11 placeType:v20 loiIdentifier:v26 starting:1];

    if (v18) {
    v28 = v42;
    }
    if (v38) {

    }
    v29 = [v42 source];
    [v29 sendEvent:v27];

    v30 = [(_DKLocationMonitor *)v19 _locationFromVisit:v4];
    v31 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      _os_log_impl(&dword_225002000, v31, OS_LOG_TYPE_INFO, "_DKLocationMonitor visit location %@", buf, 0xCu);
    }

    if (v30) {
      [(RTRoutineManager *)v19->_routineManager fetchLocationsOfInterestWithinDistance:v30 ofLocation:&__block_literal_global_11 withHandler:200.0];
    }
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "authorizationStatus"));
    int v6 = 138412290;
    double v7 = v5;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_INFO, "_DKLocationMonitor Authorization status changed %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v5 = a4;
  int v6 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_225002000, v6, OS_LOG_TYPE_INFO, "_DKLocationMonitor visit occured", v7, 2u);
  }

  if (v5) {
    [(_DKLocationMonitor *)self _handleVisit:v5];
  }
}

- (unint64_t)userSpecificPlaceTypeFromType:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 >= 5)
  {
    id v4 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[_DKLocationMonitor userSpecificPlaceTypeFromType:](v4);
    }

    return 0;
  }
  return result;
}

- (unint64_t)placeTypeFromType:(unint64_t)a3
{
  if (a3 < 3) {
    return a3 + 1;
  }
  id v4 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[_DKLocationMonitor placeTypeFromType:](v4);
  }

  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)userSpecificPlaceTypeFromType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_225002000, log, OS_LOG_TYPE_FAULT, "_CLPlaceInferenceUserSpecificPlaceType does not match expected cases. Please verify.", v1, 2u);
}

- (void)placeTypeFromType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_225002000, log, OS_LOG_TYPE_FAULT, "_CLPlaceInferencePlaceType does not match expected cases. Please verify.", v1, 2u);
}

@end
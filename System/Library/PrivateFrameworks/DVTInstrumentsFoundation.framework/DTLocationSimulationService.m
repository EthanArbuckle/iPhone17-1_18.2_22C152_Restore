@interface DTLocationSimulationService
+ (void)registerCapabilities:(id)a3;
- (DTLocationSimulationService)initWithChannel:(id)a3;
- (void)simulateLocationWithLatitude:(id)a3 longitude:(id)a4;
- (void)stopLocationSimulation;
@end

@implementation DTLocationSimulationService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  if (NSClassFromString(&cfstr_Clsimulationma.isa)) {
    [v4 publishCapability:@"com.apple.instruments.server.services.LocationSimulation" withVersion:1 forClass:a1];
  }
}

- (DTLocationSimulationService)initWithChannel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTLocationSimulationService;
  v5 = [(DTXService *)&v10 initWithChannel:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2308EF2E0;
    v7[3] = &unk_264B8D760;
    objc_copyWeak(&v8, &location);
    [v4 registerDisconnectHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)simulateLocationWithLatitude:(id)a3 longitude:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F00A50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  [v7 doubleValue];
  double v10 = v9;

  [v6 doubleValue];
  double v12 = v11;

  id v14 = (id)[v8 initWithLatitude:v10 longitude:v12];
  id v13 = objc_alloc_init(MEMORY[0x263F00AD0]);
  [v13 clearSimulatedLocations];
  [v13 appendSimulatedLocation:v14];
  [v13 startLocationSimulation];
}

- (void)stopLocationSimulation
{
  id v2 = objc_alloc_init(MEMORY[0x263F00AD0]);
  [v2 clearSimulatedLocations];
  [v2 stopLocationSimulation];
}

@end
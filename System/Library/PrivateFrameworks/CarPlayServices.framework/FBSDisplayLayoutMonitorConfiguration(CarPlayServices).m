@interface FBSDisplayLayoutMonitorConfiguration(CarPlayServices)
+ (id)configurationForCarDisplayMonitor;
+ (id)configurationForCarInstrumentsDisplayMonitor;
+ (id)crs_endpointForInstance:()CarPlayServices;
+ (uint64_t)crs_endpointForCarDisplayMonitor;
+ (uint64_t)crs_endpointForCarInstrumentsDisplayMonitor;
@end

@implementation FBSDisplayLayoutMonitorConfiguration(CarPlayServices)

+ (id)crs_endpointForInstance:()CarPlayServices
{
  v3 = (void *)MEMORY[0x263F3F728];
  id v4 = a3;
  v5 = [v3 serviceIdentifier];
  v6 = [MEMORY[0x263F2B9C0] endpointForMachName:@"com.apple.CarPlayApp.non-launching-service" service:v5 instance:v4];

  return v6;
}

+ (uint64_t)crs_endpointForCarDisplayMonitor
{
  return objc_msgSend(MEMORY[0x263F3F738], "crs_endpointForInstance:", @"com.apple.CarPlayApp.Dashboard");
}

+ (uint64_t)crs_endpointForCarInstrumentsDisplayMonitor
{
  return objc_msgSend(MEMORY[0x263F3F738], "crs_endpointForInstance:", @"com.apple.CarPlayApp.InstrumentCluster");
}

+ (id)configurationForCarDisplayMonitor
{
  v0 = objc_msgSend(MEMORY[0x263F3F738], "crs_endpointForCarDisplayMonitor");
  if (v0)
  {
    v1 = [MEMORY[0x263F3F738] configurationWithEndpoint:v0];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)configurationForCarInstrumentsDisplayMonitor
{
  v0 = objc_msgSend(MEMORY[0x263F3F738], "crs_endpointForCarInstrumentsDisplayMonitor");
  if (v0)
  {
    v1 = [MEMORY[0x263F3F738] configurationWithEndpoint:v0];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
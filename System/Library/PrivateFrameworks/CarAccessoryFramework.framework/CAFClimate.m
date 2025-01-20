@interface CAFClimate
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (CAFCabin)cabinService;
- (CAFRecirculation)recirculationService;
- (CAFSteeringWheelHeatingCooling)steeringWheelHeatingCoolingService;
- (NSArray)autoClimateControlServices;
- (NSArray)autoClimateControls;
- (NSArray)climateControlsLockedServices;
- (NSArray)climateControlsLockeds;
- (NSArray)defrostServices;
- (NSArray)defrosts;
- (NSArray)fanServices;
- (NSArray)fans;
- (NSArray)temperatureServices;
- (NSArray)temperatures;
- (NSArray)ventServices;
- (NSArray)vents;
- (NSArray)zonesSyncedServices;
- (NSDictionary)autoClimateControlsIndexed;
- (NSDictionary)climateControlsLockedsIndexed;
- (NSDictionary)defrostsIndexed;
- (NSDictionary)fansIndexed;
- (NSDictionary)temperaturesIndexed;
- (NSDictionary)ventsIndexed;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFClimate

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFClimate;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFClimate;
  [(CAFAccessory *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFClimate;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (CAFCabin)cabinService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000001"];

  objc_opt_class();
  v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000001"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFCabin *)v10;
}

- (NSArray)autoClimateControlServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000008"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000008"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)climateControlsLockedServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000010"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000010"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)defrostServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000005"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000005"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)temperatureServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000002"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000002"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (CAFSteeringWheelHeatingCooling)steeringWheelHeatingCoolingService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000003"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000003"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFSteeringWheelHeatingCooling *)v10;
}

- (NSArray)ventServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000006"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000006"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)fanServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000007"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000007"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (CAFRecirculation)recirculationService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000011"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000011"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFRecirculation *)v10;
}

- (NSArray)zonesSyncedServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000011000012"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000011000012"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)autoClimateControls
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFClimate *)self autoClimateControlServices];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)autoClimateControlsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000011000008"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)climateControlsLockeds
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFClimate *)self climateControlsLockedServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)climateControlsLockedsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000011000010"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)defrosts
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFClimate *)self defrostServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)defrostsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000011000005"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)temperatures
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFClimate *)self temperatureServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)temperaturesIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000011000002"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)vents
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFClimate *)self ventServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)ventsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000011000006"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)fans
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFClimate *)self fanServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)fansIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000011000007"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

+ (id)accessoryIdentifier
{
  return @"0x0000000001000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB3E88;
}

@end
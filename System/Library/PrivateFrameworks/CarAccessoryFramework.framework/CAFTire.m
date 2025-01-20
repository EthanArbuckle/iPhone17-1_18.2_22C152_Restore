@interface CAFTire
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (CAFTirePressureMonitoringSystem)tirePressureMonitoringSystemService;
- (NSArray)tirePressureServices;
- (NSArray)tirePressures;
- (NSDictionary)tirePressuresIndexed;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTire

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTire;
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
  v6.super_class = (Class)CAFTire;
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
  v6.super_class = (Class)CAFTire;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (NSArray)tirePressureServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x000000001B000001"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x000000001B000001"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (CAFTirePressureMonitoringSystem)tirePressureMonitoringSystemService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x000000001B000006"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x000000001B000006"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFTirePressureMonitoringSystem *)v10;
}

- (NSArray)tirePressures
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFTire *)self tirePressureServices];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)tirePressuresIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x000000001B000001"];
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
  return @"0x000000000A000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB46B8;
}

@end
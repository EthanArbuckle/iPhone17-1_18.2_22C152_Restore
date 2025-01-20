@interface CAFSeat
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (NSArray)fanServices;
- (NSArray)fans;
- (NSArray)heatingCoolingServices;
- (NSArray)heatingCoolings;
- (NSArray)seatBeltServices;
- (NSArray)seatBelts;
- (NSDictionary)fansIndexed;
- (NSDictionary)heatingCoolingsIndexed;
- (NSDictionary)seatBeltsIndexed;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSeat

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeat;
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
  v6.super_class = (Class)CAFSeat;
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
  v6.super_class = (Class)CAFSeat;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (NSArray)seatBeltServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000022000004"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000022000004"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)heatingCoolingServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000022000001"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000022000001"];
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
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000022000002"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000022000002"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)seatBelts
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFSeat *)self seatBeltServices];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)seatBeltsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000022000004"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)heatingCoolings
{
  v8[2] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFSeat *)self heatingCoolingServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v8[0] = v3;
  id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:1 selector:sel_typeCompare_];
  v8[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  objc_super v6 = [v2 sortedArrayUsingDescriptors:v5];

  return (NSArray *)v6;
}

- (NSDictionary)heatingCoolingsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000022000001"];
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
  objc_super v2 = [(CAFSeat *)self fanServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)fansIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x0000000022000002"];
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
  return @"0x0000000001500001";
}

+ (id)observerProtocol
{
  return &unk_26FDAF580;
}

@end
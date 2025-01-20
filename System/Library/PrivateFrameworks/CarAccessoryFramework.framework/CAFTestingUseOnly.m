@interface CAFTestingUseOnly
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (CAFTestControlAsync)testControlAsyncService;
- (CAFTestControlEvent)testControlEventService;
- (CAFTestControlSync)testControlSyncService;
- (CAFTypeTest)typeTestService;
- (CAFTypeTestWithStates)typeTestWithStatesService;
- (NSArray)protocolPerfTestServices;
- (NSArray)protocolPerfTests;
- (NSArray)typeTestIndexByPositionServices;
- (NSArray)typeTestIndexByPositions;
- (NSArray)typeTestIndexByUnitServices;
- (NSArray)typeTestIndexByUnits;
- (NSArray)typeTestMultiServices;
- (NSDictionary)protocolPerfTestsIndexed;
- (NSDictionary)typeTestIndexByPositionsIndexed;
- (NSDictionary)typeTestIndexByUnitsIndexed;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestingUseOnly

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestingUseOnly;
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
  v6.super_class = (Class)CAFTestingUseOnly;
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
  v6.super_class = (Class)CAFTestingUseOnly;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (CAFTypeTest)typeTestService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000001"];

  objc_opt_class();
  v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000001"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFTypeTest *)v10;
}

- (NSArray)typeTestMultiServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000003"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000003"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (CAFTypeTestWithStates)typeTestWithStatesService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000007"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000007"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFTypeTestWithStates *)v10;
}

- (NSArray)typeTestIndexByPositionServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000004"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000004"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)typeTestIndexByUnitServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000005"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000005"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)protocolPerfTestServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000006"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000006"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (CAFTestControlSync)testControlSyncService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000008"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000008"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFTestControlSync *)v10;
}

- (CAFTestControlAsync)testControlAsyncService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE000009"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE000009"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFTestControlAsync *)v10;
}

- (CAFTestControlEvent)testControlEventService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x00000000FE00000A"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x00000000FE00000A"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFTestControlEvent *)v10;
}

- (NSArray)typeTestIndexByPositions
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFTestingUseOnly *)self typeTestIndexByPositionServices];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"vehicleLayoutKey" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)typeTestIndexByPositionsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x00000000FE000004"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)typeTestIndexByUnits
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFTestingUseOnly *)self typeTestIndexByUnitServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"distanceUnit" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)typeTestIndexByUnitsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x00000000FE000005"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)protocolPerfTests
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFTestingUseOnly *)self protocolPerfTestServices];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"testString" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSDictionary)protocolPerfTestsIndexed
{
  objc_opt_class();
  id v3 = [(CAFAccessory *)self servicesForIndexBy:@"0x00000000FE000006"];
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
  return @"0x00000000FD000001";
}

+ (id)observerProtocol
{
  return &unk_26FDAF950;
}

@end
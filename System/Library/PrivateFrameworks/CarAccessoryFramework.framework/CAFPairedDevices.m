@interface CAFPairedDevices
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (CAFPairedDevicesAction)pairedDevicesActionService;
- (CAFPairedDevicesInformation)pairedDevicesInformationService;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFPairedDevices

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDevices;
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
  v6.super_class = (Class)CAFPairedDevices;
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
  v6.super_class = (Class)CAFPairedDevices;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (CAFPairedDevicesInformation)pairedDevicesInformationService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000016000018"];

  objc_opt_class();
  v8 = [(CAFAccessory *)self servicesForType:@"0x0000000016000018"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFPairedDevicesInformation *)v10;
}

- (CAFPairedDevicesAction)pairedDevicesActionService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000016000019"];

  objc_opt_class();
  v8 = [(CAFAccessory *)self servicesForType:@"0x0000000016000019"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFPairedDevicesAction *)v10;
}

+ (id)accessoryIdentifier
{
  return @"0x000000000B000001";
}

+ (id)observerProtocol
{
  return &unk_26FDAF5E0;
}

@end
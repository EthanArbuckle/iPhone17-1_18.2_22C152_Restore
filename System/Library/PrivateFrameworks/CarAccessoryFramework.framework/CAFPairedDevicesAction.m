@interface CAFPairedDevicesAction
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasConnectDevice;
- (BOOL)hasDisconnectDevice;
- (BOOL)hasForgetDevice;
- (BOOL)registeredForConnectDevice;
- (BOOL)registeredForDisconnectDevice;
- (BOOL)registeredForForgetDevice;
- (CAFConnectDeviceControl)connectDeviceControl;
- (CAFDisconnectDeviceControl)disconnectDeviceControl;
- (CAFForgetDeviceControl)forgetDeviceControl;
- (void)connectDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)disconnectDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)forgetDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFPairedDevicesAction

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDevicesAction;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFPairedDevicesAction;
  [(CAFService *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFPairedDevicesAction;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFConnectDeviceControl)connectDeviceControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000003600001A"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFConnectDeviceControl *)v4;
}

- (void)connectDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CAFPairedDevicesAction *)self connectDeviceControl];
  v9 = v8;
  if (v8)
  {
    [v8 connectDeviceWithIdentifier:v6 completion:v7];
  }
  else if (v7)
  {
    v10 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CAFPairedDevicesAction_connectDeviceWithIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __65__CAFPairedDevicesAction_connectDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasConnectDevice
{
  id v2 = [(CAFPairedDevicesAction *)self connectDeviceControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFDisconnectDeviceControl)disconnectDeviceControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000003600001B"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFDisconnectDeviceControl *)v4;
}

- (void)disconnectDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CAFPairedDevicesAction *)self disconnectDeviceControl];
  v9 = v8;
  if (v8)
  {
    [v8 disconnectDeviceWithIdentifier:v6 completion:v7];
  }
  else if (v7)
  {
    v10 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__CAFPairedDevicesAction_disconnectDeviceWithIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __68__CAFPairedDevicesAction_disconnectDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasDisconnectDevice
{
  id v2 = [(CAFPairedDevicesAction *)self disconnectDeviceControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFForgetDeviceControl)forgetDeviceControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000003600001C"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFForgetDeviceControl *)v4;
}

- (void)forgetDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CAFPairedDevicesAction *)self forgetDeviceControl];
  v9 = v8;
  if (v8)
  {
    [v8 forgetDeviceWithIdentifier:v6 completion:v7];
  }
  else if (v7)
  {
    v10 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CAFPairedDevicesAction_forgetDeviceWithIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __64__CAFPairedDevicesAction_forgetDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasForgetDevice
{
  id v2 = [(CAFPairedDevicesAction *)self forgetDeviceControl];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000019";
}

+ (id)observerProtocol
{
  return &unk_26FDAF9E0;
}

- (BOOL)registeredForConnectDevice
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000003600001A"];

  return v10;
}

- (BOOL)registeredForDisconnectDevice
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000003600001B"];

  return v10;
}

- (BOOL)registeredForForgetDevice
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000003600001C"];

  return v10;
}

@end
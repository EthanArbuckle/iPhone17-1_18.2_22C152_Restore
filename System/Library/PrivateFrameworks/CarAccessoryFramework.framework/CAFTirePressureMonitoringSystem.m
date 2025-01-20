@interface CAFTirePressureMonitoringSystem
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasReset;
- (BOOL)registeredForReset;
- (CAFResetControl)resetControl;
- (void)registerObserver:(id)a3;
- (void)resetWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTirePressureMonitoringSystem

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTirePressureMonitoringSystem;
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
  v6.super_class = (Class)CAFTirePressureMonitoringSystem;
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
  v6.super_class = (Class)CAFTirePressureMonitoringSystem;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFResetControl)resetControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x0000000030000062"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFResetControl *)v4;
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTirePressureMonitoringSystem *)self resetControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 resetWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CAFTirePressureMonitoringSystem_resetWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __55__CAFTirePressureMonitoringSystem_resetWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasReset
{
  id v2 = [(CAFTirePressureMonitoringSystem *)self resetControl];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001B000006";
}

+ (id)observerProtocol
{
  return &unk_26FDAFB98;
}

- (BOOL)registeredForReset
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x0000000030000062"];

  return v10;
}

@end
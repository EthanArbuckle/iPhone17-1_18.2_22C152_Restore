@interface CAFTestControlSync
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasTestAccRequestNoParams;
- (BOOL)hasTestAccRequestWithReqAndResParams;
- (BOOL)hasTestAccRequestWithReqParams;
- (BOOL)hasTestAccRequestWithResParams;
- (BOOL)hasTestDevRequestNoParams;
- (BOOL)hasTestDevRequestWithReqAndResParams;
- (BOOL)hasTestDevRequestWithReqParams;
- (BOOL)hasTestDevRequestWithResParams;
- (BOOL)registeredForTestAccRequestNoParams;
- (BOOL)registeredForTestAccRequestWithReqAndResParams;
- (BOOL)registeredForTestAccRequestWithReqParams;
- (BOOL)registeredForTestAccRequestWithResParams;
- (BOOL)registeredForTestDevRequestNoParams;
- (BOOL)registeredForTestDevRequestWithReqAndResParams;
- (BOOL)registeredForTestDevRequestWithReqParams;
- (BOOL)registeredForTestDevRequestWithResParams;
- (BOOL)testDevRequestNoParamsDisabled;
- (BOOL)testDevRequestNoParamsError;
- (BOOL)testDevRequestWithReqAndResParamsDisabled;
- (BOOL)testDevRequestWithReqAndResParamsError;
- (BOOL)testDevRequestWithReqParamsDisabled;
- (BOOL)testDevRequestWithReqParamsError;
- (BOOL)testDevRequestWithResParamsDisabled;
- (BOOL)testDevRequestWithResParamsError;
- (CAFTestAccRequestNoParamsControl)testAccRequestNoParamsControl;
- (CAFTestAccRequestWithReqAndResParamsControl)testAccRequestWithReqAndResParamsControl;
- (CAFTestAccRequestWithReqParamsControl)testAccRequestWithReqParamsControl;
- (CAFTestAccRequestWithResParamsControl)testAccRequestWithResParamsControl;
- (CAFTestDevRequestNoParamsControl)testDevRequestNoParamsControl;
- (CAFTestDevRequestWithReqAndResParamsControl)testDevRequestWithReqAndResParamsControl;
- (CAFTestDevRequestWithReqParamsControl)testDevRequestWithReqParamsControl;
- (CAFTestDevRequestWithResParamsControl)testDevRequestWithResParamsControl;
- (id)testAccRequestNoParamsHandler;
- (id)testAccRequestWithReqAndResParamsHandler;
- (id)testAccRequestWithReqParamsHandler;
- (id)testAccRequestWithResParamsHandler;
- (void)_controlDidUpdate:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setTestAccRequestNoParamsHandler:(id)a3;
- (void)setTestAccRequestWithReqAndResParamsHandler:(id)a3;
- (void)setTestAccRequestWithReqParamsHandler:(id)a3;
- (void)setTestAccRequestWithResParamsHandler:(id)a3;
- (void)testDevRequestNoParamsWithCompletion:(id)a3;
- (void)testDevRequestWithReqAndResParamsWithTestInput5:(unsigned __int8)a3 testInput6:(id)a4 completion:(id)a5;
- (void)testDevRequestWithReqParamsWithTestInput1:(unsigned __int8)a3 testInput2:(id)a4 completion:(id)a5;
- (void)testDevRequestWithResParamsWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestControlSync

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestControlSync;
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
  v6.super_class = (Class)CAFTestControlSync;
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
  v6.super_class = (Class)CAFTestControlSync;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFTestDevRequestNoParamsControl)testDevRequestNoParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF000028"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestDevRequestNoParamsControl *)v4;
}

- (void)testDevRequestNoParamsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlSync *)self testDevRequestNoParamsControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 testDevRequestNoParamsWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CAFTestControlSync_testDevRequestNoParamsWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __59__CAFTestControlSync_testDevRequestNoParamsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasTestDevRequestNoParams
{
  id v2 = [(CAFTestControlSync *)self testDevRequestNoParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestNoParamsError
{
  id v2 = [(CAFTestControlSync *)self testDevRequestNoParamsControl];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDevRequestNoParamsDisabled
{
  id v2 = [(CAFTestControlSync *)self testDevRequestNoParamsControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestDevRequestWithReqParamsControl)testDevRequestWithReqParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF000029"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestDevRequestWithReqParamsControl *)v4;
}

- (void)testDevRequestWithReqParamsWithTestInput1:(unsigned __int8)a3 testInput2:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(CAFTestControlSync *)self testDevRequestWithReqParamsControl];
  v11 = v10;
  if (v10)
  {
    [v10 testDevRequestWithReqParamsWithTestInput1:v6 testInput2:v8 completion:v9];
  }
  else if (v9)
  {
    v12 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__CAFTestControlSync_testDevRequestWithReqParamsWithTestInput1_testInput2_completion___block_invoke;
    block[3] = &unk_265263360;
    id v14 = v9;
    dispatch_async(v12, block);
  }
}

void __86__CAFTestControlSync_testDevRequestWithReqParamsWithTestInput1_testInput2_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasTestDevRequestWithReqParams
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithReqParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestWithReqParamsError
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithReqParamsControl];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDevRequestWithReqParamsDisabled
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithReqParamsControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestDevRequestWithResParamsControl)testDevRequestWithResParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF00002A"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestDevRequestWithResParamsControl *)v4;
}

- (void)testDevRequestWithResParamsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlSync *)self testDevRequestWithResParamsControl];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 testDevRequestWithResParamsWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CAFTestControlSync_testDevRequestWithResParamsWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __64__CAFTestControlSync_testDevRequestWithResParamsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, MEMORY[0x263EFFA68], v2);
}

- (BOOL)hasTestDevRequestWithResParams
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithResParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestWithResParamsError
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithResParamsControl];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDevRequestWithResParamsDisabled
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithResParamsControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestDevRequestWithReqAndResParamsControl)testDevRequestWithReqAndResParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF00002B"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestDevRequestWithReqAndResParamsControl *)v4;
}

- (void)testDevRequestWithReqAndResParamsWithTestInput5:(unsigned __int8)a3 testInput6:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(CAFTestControlSync *)self testDevRequestWithReqAndResParamsControl];
  v11 = v10;
  if (v10)
  {
    [v10 testDevRequestWithReqAndResParamsWithTestInput5:v6 testInput6:v8 completion:v9];
  }
  else if (v9)
  {
    v12 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__CAFTestControlSync_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke;
    block[3] = &unk_265263360;
    id v14 = v9;
    dispatch_async(v12, block);
  }
}

void __92__CAFTestControlSync_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, MEMORY[0x263EFFA68], v2);
}

- (BOOL)hasTestDevRequestWithReqAndResParams
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithReqAndResParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestWithReqAndResParamsError
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithReqAndResParamsControl];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDevRequestWithReqAndResParamsDisabled
{
  id v2 = [(CAFTestControlSync *)self testDevRequestWithReqAndResParamsControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestAccRequestNoParamsControl)testAccRequestNoParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF00002E"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestAccRequestNoParamsControl *)v4;
}

- (id)testAccRequestNoParamsHandler
{
  id v2 = [(CAFTestControlSync *)self testAccRequestNoParamsControl];
  id v3 = [v2 handler];

  return v3;
}

- (void)setTestAccRequestNoParamsHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlSync *)self testAccRequestNoParamsControl];
  [v5 setHandler:v4];
}

- (BOOL)hasTestAccRequestNoParams
{
  id v2 = [(CAFTestControlSync *)self testAccRequestNoParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestAccRequestWithReqParamsControl)testAccRequestWithReqParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF00002F"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestAccRequestWithReqParamsControl *)v4;
}

- (id)testAccRequestWithReqParamsHandler
{
  id v2 = [(CAFTestControlSync *)self testAccRequestWithReqParamsControl];
  id v3 = [v2 handler];

  return v3;
}

- (void)setTestAccRequestWithReqParamsHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlSync *)self testAccRequestWithReqParamsControl];
  [v5 setHandler:v4];
}

- (BOOL)hasTestAccRequestWithReqParams
{
  id v2 = [(CAFTestControlSync *)self testAccRequestWithReqParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestAccRequestWithResParamsControl)testAccRequestWithResParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF000030"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestAccRequestWithResParamsControl *)v4;
}

- (id)testAccRequestWithResParamsHandler
{
  id v2 = [(CAFTestControlSync *)self testAccRequestWithResParamsControl];
  id v3 = [v2 handler];

  return v3;
}

- (void)setTestAccRequestWithResParamsHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlSync *)self testAccRequestWithResParamsControl];
  [v5 setHandler:v4];
}

- (BOOL)hasTestAccRequestWithResParams
{
  id v2 = [(CAFTestControlSync *)self testAccRequestWithResParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestAccRequestWithReqAndResParamsControl)testAccRequestWithReqAndResParamsControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x00000000FF000031"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTestAccRequestWithReqAndResParamsControl *)v4;
}

- (id)testAccRequestWithReqAndResParamsHandler
{
  id v2 = [(CAFTestControlSync *)self testAccRequestWithReqAndResParamsControl];
  id v3 = [v2 handler];

  return v3;
}

- (void)setTestAccRequestWithReqAndResParamsHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTestControlSync *)self testAccRequestWithReqAndResParamsControl];
  [v5 setHandler:v4];
}

- (BOOL)hasTestAccRequestWithReqAndResParams
{
  id v2 = [(CAFTestControlSync *)self testAccRequestWithReqAndResParamsControl];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE000008";
}

+ (id)observerProtocol
{
  return &unk_26FDB42D0;
}

- (void)_controlDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 controlType];
  if ([v5 isEqual:@"0x00000000FF000028"])
  {
    uint64_t v6 = [v4 uniqueIdentifier];
    v7 = [(CAFTestControlSync *)self testDevRequestNoParamsControl];
    id v8 = [v7 uniqueIdentifier];
    int v9 = [v6 isEqual:v8];

    if (v9)
    {
      v10 = [(CAFService *)self observers];
      [v10 testControlSyncServiceDidUpdateTestDevRequestNoParams:self];
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
  }
  v11 = [v4 controlType];
  if ([v11 isEqual:@"0x00000000FF000029"])
  {
    v12 = [v4 uniqueIdentifier];
    v13 = [(CAFTestControlSync *)self testDevRequestWithReqParamsControl];
    id v14 = [v13 uniqueIdentifier];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {
      v10 = [(CAFService *)self observers];
      [v10 testControlSyncServiceDidUpdateTestDevRequestWithReqParams:self];
      goto LABEL_16;
    }
  }
  else
  {
  }
  v16 = [v4 controlType];
  if ([v16 isEqual:@"0x00000000FF00002A"])
  {
    v17 = [v4 uniqueIdentifier];
    v18 = [(CAFTestControlSync *)self testDevRequestWithResParamsControl];
    v19 = [v18 uniqueIdentifier];
    int v20 = [v17 isEqual:v19];

    if (v20)
    {
      v10 = [(CAFService *)self observers];
      [v10 testControlSyncServiceDidUpdateTestDevRequestWithResParams:self];
      goto LABEL_16;
    }
  }
  else
  {
  }
  v10 = [v4 controlType];
  if (![v10 isEqual:@"0x00000000FF00002B"]) {
    goto LABEL_16;
  }
  v21 = [v4 uniqueIdentifier];
  v22 = [(CAFTestControlSync *)self testDevRequestWithReqAndResParamsControl];
  v23 = [v22 uniqueIdentifier];
  int v24 = [v21 isEqual:v23];

  if (v24)
  {
    v10 = [(CAFService *)self observers];
    [v10 testControlSyncServiceDidUpdateTestDevRequestWithReqAndResParams:self];
    goto LABEL_16;
  }
LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)CAFTestControlSync;
  [(CAFService *)&v25 _controlDidUpdate:v4];
}

- (BOOL)registeredForTestDevRequestNoParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF000028"];

  return v10;
}

- (BOOL)registeredForTestDevRequestWithReqParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF000029"];

  return v10;
}

- (BOOL)registeredForTestDevRequestWithResParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF00002A"];

  return v10;
}

- (BOOL)registeredForTestDevRequestWithReqAndResParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF00002B"];

  return v10;
}

- (BOOL)registeredForTestAccRequestNoParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF00002E"];

  return v10;
}

- (BOOL)registeredForTestAccRequestWithReqParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF00002F"];

  return v10;
}

- (BOOL)registeredForTestAccRequestWithResParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF000030"];

  return v10;
}

- (BOOL)registeredForTestAccRequestWithReqAndResParams
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x00000000FF000031"];

  return v10;
}

@end
@interface CAFDisconnectDeviceControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)disconnectDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFDisconnectDeviceControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDisconnectDeviceControl;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8730]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFDisconnectDeviceControl;
  [(CAFControl *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8730]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFDisconnectDeviceControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)disconnectDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13 = @"identifier";
  v14[0] = a3;
  v7 = NSDictionary;
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__CAFDisconnectDeviceControl_disconnectDeviceWithIdentifier_completion___block_invoke;
  v11[3] = &unk_2652632C0;
  id v12 = v6;
  id v10 = v6;
  [(CAFControl *)self requestWithValue:v9 response:v11];
}

uint64_t __72__CAFDisconnectDeviceControl_disconnectDeviceWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (id)controlIdentifier
{
  return @"0x000000003600001B";
}

+ (id)observerProtocol
{
  return &unk_26FDAF800;
}

@end
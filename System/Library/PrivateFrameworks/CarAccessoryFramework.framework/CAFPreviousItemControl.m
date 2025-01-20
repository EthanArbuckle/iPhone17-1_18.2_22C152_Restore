@interface CAFPreviousItemControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)previousItemWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFPreviousItemControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPreviousItemControl;
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
  v6.super_class = (Class)CAFPreviousItemControl;
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
  v6.super_class = (Class)CAFPreviousItemControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)previousItemWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CAFPreviousItemControl_previousItemWithCompletion___block_invoke;
  v6[3] = &unk_2652632C0;
  id v7 = v4;
  id v5 = v4;
  [(CAFControl *)self requestWithValue:0 response:v6];
}

uint64_t __53__CAFPreviousItemControl_previousItemWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (id)controlIdentifier
{
  return @"0x000000000F000036";
}

+ (id)observerProtocol
{
  return &unk_26FDB43F8;
}

@end
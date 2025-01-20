@interface CAFJumpBackwardControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)jumpBackwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFJumpBackwardControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFJumpBackwardControl;
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
  v6.super_class = (Class)CAFJumpBackwardControl;
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
  v6.super_class = (Class)CAFJumpBackwardControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)jumpBackwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v12 = @"jumpInterval";
  v7 = [NSNumber numberWithUnsignedShort:v4];
  v13[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CAFJumpBackwardControl_jumpBackwardWithJumpInterval_completion___block_invoke;
  v10[3] = &unk_2652632C0;
  id v11 = v6;
  id v9 = v6;
  [(CAFControl *)self requestWithValue:v8 response:v10];
}

uint64_t __66__CAFJumpBackwardControl_jumpBackwardWithJumpInterval_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (id)controlIdentifier
{
  return @"0x000000000F00004A";
}

+ (id)observerProtocol
{
  return &unk_26FDB3978;
}

@end
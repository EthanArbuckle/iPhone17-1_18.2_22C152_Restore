@interface CAFTestDevEventWithParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)testDevEventWithParamsWithTestInput9:(unsigned __int8)a3 testInput10:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestDevEventWithParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevEventWithParamsControl;
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
  v6.super_class = (Class)CAFTestDevEventWithParamsControl;
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
  v6.super_class = (Class)CAFTestDevEventWithParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)testDevEventWithParamsWithTestInput9:(unsigned __int8)a3 testInput10:(id)a4
{
  uint64_t v4 = a3;
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"testInput9";
  objc_super v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithUnsignedChar:v4];
  v10[1] = @"testInput10";
  v11[0] = v8;
  v11[1] = v7;
  v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(CAFControl *)self notifyWithValue:v9];
}

+ (id)controlIdentifier
{
  return @"0x00000000FF00002D";
}

+ (id)observerProtocol
{
  return &unk_26FDB5760;
}

@end
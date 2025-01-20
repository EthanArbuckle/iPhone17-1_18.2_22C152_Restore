@interface CAFTestDevEventNoParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)testDevEventNoParams;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestDevEventNoParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevEventNoParamsControl;
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
  v6.super_class = (Class)CAFTestDevEventNoParamsControl;
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
  v6.super_class = (Class)CAFTestDevEventNoParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)testDevEventNoParams
{
}

+ (id)controlIdentifier
{
  return @"0x00000000FF00002C";
}

+ (id)observerProtocol
{
  return &unk_26FDB3600;
}

@end
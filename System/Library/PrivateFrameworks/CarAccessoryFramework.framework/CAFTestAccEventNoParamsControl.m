@interface CAFTestAccEventNoParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (id)handler;
- (void)_didNotifyWithValue:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestAccEventNoParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccEventNoParamsControl;
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
  v6.super_class = (Class)CAFTestAccEventNoParamsControl;
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
  v6.super_class = (Class)CAFTestAccEventNoParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)_didNotifyWithValue:(id)a3
{
  id v4 = [(CAFTestAccEventNoParamsControl *)self handler];

  if (v4)
  {
    id v5 = [(CAFTestAccEventNoParamsControl *)self handler];
    v5[2]();
  }
}

+ (id)controlIdentifier
{
  return @"0x00000000FF000032";
}

+ (id)observerProtocol
{
  return &unk_26FDB5048;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CAFTestAccEventWithParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (id)handler;
- (void)_didNotifyWithValue:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestAccEventWithParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccEventWithParamsControl;
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
  v6.super_class = (Class)CAFTestAccEventWithParamsControl;
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
  v6.super_class = (Class)CAFTestAccEventWithParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)_didNotifyWithValue:(id)a3
{
  id v10 = a3;
  id v4 = [(CAFTestAccEventWithParamsControl *)self handler];

  if (v4)
  {
    objc_opt_class();
    id v5 = [v10 objectForKeyedSubscript:@"testInput9"];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      unint64_t v6 = (unint64_t)v5;
    }
    else {
      unint64_t v6 = 0;
    }

    objc_opt_class();
    id v7 = [v10 objectForKeyedSubscript:@"testInput10"];
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
      unint64_t v8 = (unint64_t)v7;
    }
    else {
      unint64_t v8 = 0;
    }

    if (v6 | v8)
    {
      v9 = [(CAFTestAccEventWithParamsControl *)self handler];
      v9[2](v9, [(id)v6 unsignedCharValue], v8);
    }
  }
}

+ (id)controlIdentifier
{
  return @"0x00000000FF000033";
}

+ (id)observerProtocol
{
  return &unk_26FDB0E40;
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
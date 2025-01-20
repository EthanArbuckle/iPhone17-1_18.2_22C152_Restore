@interface CAFTestAccRequestNoParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4;
- (id)handler;
- (void)registerObserver:(id)a3;
- (void)setHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestAccRequestNoParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccRequestNoParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestNoParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestNoParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(CAFTestAccRequestNoParamsControl *)self handler];

  if (v6)
  {
    v7 = [(CAFTestAccRequestNoParamsControl *)self handler];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__CAFTestAccRequestNoParamsControl__didRequestWithValue_response___block_invoke;
    v9[3] = &unk_265263F48;
    id v10 = v5;
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
  return v6 != 0;
}

uint64_t __66__CAFTestAccRequestNoParamsControl__didRequestWithValue_response___block_invoke(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A790]();
}

+ (id)controlIdentifier
{
  return @"0x00000000FF00002E";
}

+ (id)observerProtocol
{
  return &unk_26FDB1B60;
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
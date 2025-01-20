@interface CAFTestAccRequestWithResParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4;
- (id)handler;
- (void)registerObserver:(id)a3;
- (void)setHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestAccRequestWithResParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccRequestWithResParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestWithResParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestWithResParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(CAFTestAccRequestWithResParamsControl *)self handler];

  if (v6)
  {
    v7 = [(CAFTestAccRequestWithResParamsControl *)self handler];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__CAFTestAccRequestWithResParamsControl__didRequestWithValue_response___block_invoke;
    v9[3] = &unk_265263598;
    id v10 = v5;
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
  return v6 != 0;
}

void __71__CAFTestAccRequestWithResParamsControl__didRequestWithValue_response___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v14[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v8);
    }
    else
    {
      v13[0] = @"testOutput3";
      v11 = [NSNumber numberWithUnsignedChar:a2];
      v13[1] = @"testOutput4";
      v14[0] = v11;
      v14[1] = v7;
      v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v12, 0);
    }
  }
}

+ (id)controlIdentifier
{
  return @"0x00000000FF000030";
}

+ (id)observerProtocol
{
  return &unk_26FDB08E8;
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
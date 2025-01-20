@interface CAFTestAccRequestWithReqParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4;
- (id)handler;
- (void)registerObserver:(id)a3;
- (void)setHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestAccRequestWithReqParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccRequestWithReqParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestWithReqParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestWithReqParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CAFTestAccRequestWithReqParamsControl *)self handler];

  if (v8)
  {
    objc_opt_class();
    id v9 = [v6 objectForKeyedSubscript:@"testInput1"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      unint64_t v10 = (unint64_t)v9;
    }
    else {
      unint64_t v10 = 0;
    }

    objc_opt_class();
    id v11 = [v6 objectForKeyedSubscript:@"testInput2"];
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
      unint64_t v12 = (unint64_t)v11;
    }
    else {
      unint64_t v12 = 0;
    }

    if (v10 | v12)
    {
      v13 = [(CAFTestAccRequestWithReqParamsControl *)self handler];
      uint64_t v14 = [(id)v10 unsignedCharValue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __71__CAFTestAccRequestWithReqParamsControl__didRequestWithValue_response___block_invoke;
      v17[3] = &unk_265263F48;
      id v18 = v7;
      ((void (**)(void, uint64_t, unint64_t, void *))v13)[2](v13, v14, v12, v17);
    }
    else if (v7)
    {
      v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:8 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
    }
  }

  return v8 != 0;
}

uint64_t __71__CAFTestAccRequestWithReqParamsControl__didRequestWithValue_response___block_invoke(uint64_t a1, void *a2)
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
  return @"0x00000000FF00002F";
}

+ (id)observerProtocol
{
  return &unk_26FDB3C00;
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
@interface CAFTestDevRequestWithResParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)testDevRequestWithResParamsWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestDevRequestWithResParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevRequestWithResParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithResParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithResParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)testDevRequestWithResParamsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__CAFTestDevRequestWithResParamsControl_testDevRequestWithResParamsWithCompletion___block_invoke;
  v6[3] = &unk_2652632C0;
  id v7 = v4;
  id v5 = v4;
  [(CAFControl *)self requestWithValue:0 response:v6];
}

void __83__CAFTestDevRequestWithResParamsControl_testDevRequestWithResParamsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_super v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(void, void, void, id))(v7 + 16))(*(void *)(a1 + 32), 0, MEMORY[0x263EFFA68], v5);
    }
    else if (v15)
    {
      objc_opt_class();
      id v8 = [v15 objectForKeyedSubscript:@"testOutput3"];
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
        unint64_t v9 = (unint64_t)v8;
      }
      else {
        unint64_t v9 = 0;
      }

      objc_opt_class();
      id v10 = [v15 objectForKeyedSubscript:@"testOutput4"];
      if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
        unint64_t v11 = (unint64_t)v10;
      }
      else {
        unint64_t v11 = 0;
      }

      if (!(v9 | v11))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:8 userInfo:0];
        (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, MEMORY[0x263EFFA68], v13);
      }
      (*(void (**)(void, uint64_t, unint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [(id)v9 unsignedCharValue], v11, 0);
    }
    else
    {
      v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:7 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v7 + 16))(v7, 0, MEMORY[0x263EFFA68], v14);
    }
  }
}

+ (id)controlIdentifier
{
  return @"0x00000000FF00002A";
}

+ (id)observerProtocol
{
  return &unk_26FDB1A20;
}

@end
@interface CAFTestDevRequestWithReqAndResParamsControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)testDevRequestWithReqAndResParamsWithTestInput5:(unsigned __int8)a3 testInput6:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTestDevRequestWithReqAndResParamsControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevRequestWithReqAndResParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithReqAndResParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithReqAndResParamsControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)testDevRequestWithReqAndResParamsWithTestInput5:(unsigned __int8)a3 testInput6:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = @"testInput5";
  v9 = NSNumber;
  id v10 = a4;
  v11 = [v9 numberWithUnsignedChar:v6];
  v16[1] = @"testInput6";
  v17[0] = v11;
  v17[1] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __117__CAFTestDevRequestWithReqAndResParamsControl_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke;
  v14[3] = &unk_2652632C0;
  id v15 = v8;
  id v13 = v8;
  [(CAFControl *)self requestWithValue:v12 response:v14];
}

void __117__CAFTestDevRequestWithReqAndResParamsControl_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
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
      id v8 = [v15 objectForKeyedSubscript:@"testOutput7"];
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
        unint64_t v9 = (unint64_t)v8;
      }
      else {
        unint64_t v9 = 0;
      }

      objc_opt_class();
      id v10 = [v15 objectForKeyedSubscript:@"testOutput8"];
      if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
        unint64_t v11 = (unint64_t)v10;
      }
      else {
        unint64_t v11 = 0;
      }

      if (!(v9 | v11))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:8 userInfo:0];
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
  return @"0x00000000FF00002B";
}

+ (id)observerProtocol
{
  return &unk_26FDB4458;
}

@end
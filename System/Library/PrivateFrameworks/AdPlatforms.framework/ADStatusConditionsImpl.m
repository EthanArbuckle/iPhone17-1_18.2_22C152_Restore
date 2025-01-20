@interface ADStatusConditionsImpl
- (BOOL)isConditionRateLimited:(id)a3 onOperation:(int64_t)a4;
- (BOOL)operationWithCondition:(id)a3 forType:(int64_t)a4;
- (id)capped:(id)a3 to:(unint64_t)a4;
- (id)setupXPCConnection;
- (void)cleanupExpiredConditionsInBuffer;
- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4;
- (void)initializeRateLimitingBuffer;
- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setStatusCondition:(id)a3 completionHandler:(id)a4;
@end

@implementation ADStatusConditionsImpl

- (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(ADStatusConditionsImpl *)self isConditionRateLimited:v6 onOperation:0])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v8 = [(ADStatusConditionsImpl *)self setupXPCConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke;
    v18[3] = &unk_2644AEDB8;
    v18[4] = self;
    v9 = v7;
    id v19 = v9;
    [v8 setInvalidationHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_2;
    v16[3] = &unk_2644AEDB8;
    v16[4] = self;
    v10 = v9;
    id v17 = v10;
    [v8 setInterruptionHandler:v16];
    v11 = [v8 remoteObjectProxy];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_3;
    v13[3] = &unk_2644AEDE0;
    id v14 = v8;
    v15 = v10;
    id v12 = v8;
    [v11 setStatusCondition:v6 completionHandler:v13];
  }
}

void __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  ADLOG(@"ADStatusConditions XPC connection invalidated. Lost connection.", a2, a3, a4, a5, a6, a7, a8, v13);
  [*(id *)(a1 + 32) initializeRateLimitingBuffer];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"A serious error occurred. The XPC connection was invalidated.";
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"ADStatusConditionsErrorDomain" code:-1101 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);
  }
}

void __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  ADLOG(@"ADStatusConditions XPC connection interrupted. Lost connection.", a2, a3, a4, a5, a6, a7, a8, v13);
  [*(id *)(a1 + 32) initializeRateLimitingBuffer];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"A serious error occurred. The XPC connection was interrupted.";
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"ADStatusConditionsErrorDomain" code:-1101 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);
  }
}

void __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3) {
    ADLOG(@"ERROR: Failed to set the status condition due to error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
  }
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
}

- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if ([(ADStatusConditionsImpl *)self isConditionRateLimited:v6 onOperation:1])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    uint64_t v8 = [(ADStatusConditionsImpl *)self setupXPCConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke;
    v18[3] = &unk_2644AEDB8;
    v18[4] = self;
    uint64_t v9 = v7;
    id v19 = v9;
    [v8 setInvalidationHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_2;
    v16[3] = &unk_2644AEDB8;
    v16[4] = self;
    uint64_t v10 = v9;
    id v17 = v10;
    [v8 setInterruptionHandler:v16];
    uint64_t v11 = [v8 remoteObjectProxy];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_3;
    v13[3] = &unk_2644AEDE0;
    id v14 = v8;
    v15 = v10;
    id v12 = v8;
    [v11 clearStatusCondition:v6 completionHandler:v13];
  }
}

void __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  ADLOG(@"ADStatusConditions XPC connection invalidated. Lost connection.", a2, a3, a4, a5, a6, a7, a8, v13);
  [*(id *)(a1 + 32) initializeRateLimitingBuffer];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"A serious error occurred. The XPC connection was invalidated.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"ADStatusConditionsErrorDomain" code:-1101 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);
  }
}

void __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  ADLOG(@"ADStatusConditions XPC connection interrupted. Lost connection.", a2, a3, a4, a5, a6, a7, a8, v13);
  [*(id *)(a1 + 32) initializeRateLimitingBuffer];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"A serious error occurred. The XPC connection was interrupted.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"ADStatusConditionsErrorDomain" code:-1101 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);
  }
}

void __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3) {
    ADLOG(@"ERROR: Failed to clear the status condition due to error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
  }
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
}

- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ADStatusConditionsImpl *)self setupXPCConnection];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke;
  v22[3] = &unk_2644AEE08;
  id v12 = v8;
  id v23 = v12;
  [v11 setInvalidationHandler:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_2;
  v20[3] = &unk_2644AEE08;
  id v13 = v12;
  id v21 = v13;
  [v11 setInterruptionHandler:v20];
  uint64_t v14 = [v11 remoteObjectProxy];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_3;
  v17[3] = &unk_2644AEE30;
  id v18 = v11;
  id v19 = v13;
  id v15 = v11;
  id v16 = v13;
  [v14 isStatusConditionRegistered:v10 bundleIdentifier:v9 completionHandler:v17];
}

void __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  ADLOG(@"ADStatusConditions XPC connection invalidated. Lost connection.", a2, a3, a4, a5, a6, a7, a8, v13);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"A serious error occurred. The XPC connection was invalidated.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"ADStatusConditionsErrorDomain" code:-1101 userInfo:v11];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
  }
}

void __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  ADLOG(@"ADStatusConditions XPC connection interrupted. Lost connection.", a2, a3, a4, a5, a6, a7, a8, v13);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"A serious error occurred. The XPC connection was interrupted.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v10 errorWithDomain:@"ADStatusConditionsErrorDomain" code:-1101 userInfo:v11];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
  }
}

void __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v13 = @"has not";
  if (a2) {
    uint64_t v13 = @"has";
  }
  id v22 = v5;
  ADLOG(@"The status condition %@ been registered.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v13);
  if (v22) {
    ADLOG(@"ERROR: Failed to read the status condition due to error: %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v22);
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, a2, v22);
  }
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
}

- (BOOL)isConditionRateLimited:(id)a3 onOperation:(int64_t)a4
{
  id v6 = a3;
  [(ADStatusConditionsImpl *)self cleanupExpiredConditionsInBuffer];
  uint64_t v14 = @"Clear";
  if (!a4) {
    uint64_t v14 = @"Set";
  }
  ADLOG(@"ADStatusConditions %@ called. Checking rate limiting.", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ADStatusConditionsImpl_isConditionRateLimited_onOperation___block_invoke;
  block[3] = &unk_2644AEE58;
  block[4] = self;
  if (isConditionRateLimited_onOperation__onceToken != -1) {
    dispatch_once(&isConditionRateLimited_onOperation__onceToken, block);
  }
  BOOL v15 = [(ADStatusConditionsImpl *)self operationWithCondition:v6 forType:a4];

  id v23 = @"CLEAR";
  if (!a4) {
    id v23 = @"SET";
  }
  if (v15) {
    v24 = @"This is a duplicate %@ call which will be rate limited";
  }
  else {
    v24 = @"This is a new %@ call which will execute.";
  }
  ADLOG(v24, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
  return v15;
}

uint64_t __61__ADStatusConditionsImpl_isConditionRateLimited_onOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeRateLimitingBuffer];
}

- (BOOL)operationWithCondition:(id)a3 forType:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = (id)ringBuffer;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 statusCondition];
        if ([v12 isEqual:v5])
        {
          uint64_t v13 = [v11 operation];

          if (v13 == a4)
          {
            BOOL v20 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v14 = (void *)MEMORY[0x263F08A98];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__ADStatusConditionsImpl_operationWithCondition_forType___block_invoke;
  v22[3] = &unk_2644AEE80;
  id v15 = v5;
  id v23 = v15;
  uint64_t v16 = [v14 predicateWithBlock:v22];
  [(id)ringBuffer filterUsingPredicate:v16];
  uint64_t v17 = [ADStatusConditionRateLimitedObject alloc];
  uint64_t v18 = [MEMORY[0x263EFF910] now];
  id v19 = [(ADStatusConditionRateLimitedObject *)v17 init:v15 at:v18 kind:a4];

  [(id)ringBuffer addObject:v19];
  BOOL v20 = 0;
  id v6 = v23;
LABEL_13:

  return v20;
}

uint64_t __57__ADStatusConditionsImpl_operationWithCondition_forType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 statusCondition];
  LODWORD(a1) = [v3 isEqual:*(void *)(a1 + 32)];

  return a1 ^ 1;
}

- (void)cleanupExpiredConditionsInBuffer
{
  v2 = [(ADStatusConditionsImpl *)self capped:ringBuffer to:5];
  uint64_t v3 = [v2 mutableCopy];
  uint64_t v4 = (void *)ringBuffer;
  ringBuffer = v3;

  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = (void *)MEMORY[0x263F08A98];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__ADStatusConditionsImpl_cleanupExpiredConditionsInBuffer__block_invoke;
  v9[3] = &unk_2644AEE80;
  id v10 = v5;
  id v7 = v5;
  uint64_t v8 = [v6 predicateWithBlock:v9];
  [(id)ringBuffer filterUsingPredicate:v8];
}

BOOL __58__ADStatusConditionsImpl_cleanupExpiredConditionsInBuffer__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 setTime];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  return (int)v5 < 86400;
}

- (id)capped:(id)a3 to:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 count];
  if (v6 <= a4)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", v6 - a4, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)initializeRateLimitingBuffer
{
  ringBuffer = [MEMORY[0x263EFF980] array];

  MEMORY[0x270F9A758]();
}

- (id)setupXPCConnection
{
  id v2 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v3 = (void *)[v2 initWithMachServiceName:@"com.apple.ap.adservicesd.statusconditionservice" options:*MEMORY[0x263F24148]];
  double v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF776F0];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];

  return v3;
}

@end
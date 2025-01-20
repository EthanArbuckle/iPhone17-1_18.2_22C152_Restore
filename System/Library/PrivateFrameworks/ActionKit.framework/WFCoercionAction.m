@interface WFCoercionAction
- (Class)coercionItemClass;
- (id)outputContentClasses;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCoercionAction

- (id)outputContentClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = [(WFCoercionAction *)self coercionItemClass];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFCoercionAction *)self coercionItemClass];
  v6 = [v4 defaultCoercionOptions];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__WFCoercionAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_264E5DBA0;
  v7[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 options:v6 completionHandler:v7];
}

void __47__WFCoercionAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v6 = a4;
  if ([v13 numberOfItems]) {
    goto LABEL_2;
  }
  v11 = [v6 domain];
  if ([v11 isEqualToString:*MEMORY[0x263F33A98]])
  {
    uint64_t v12 = [v6 code];

    if (!v12)
    {
LABEL_2:
      v7 = (void *)[v13 copy];
      v9 = *(void **)(a1 + 32);
      v8 = (id *)(a1 + 32);
      [v9 setOutput:v7];

      id v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v8 = (id *)(a1 + 32);
  id v10 = v6;
LABEL_8:
  [*v8 finishRunningWithError:v10];
}

- (Class)coercionItemClass
{
  id v4 = [(WFCoercionAction *)self definition];
  v5 = [v4 objectForKey:@"CoercionItemClass"];

  Class v6 = NSClassFromString(v5);
  if (!v6)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFCoercionAction.m" lineNumber:21 description:@"The coercion item class must exist"];
  }
  v7 = v6;

  return v7;
}

@end
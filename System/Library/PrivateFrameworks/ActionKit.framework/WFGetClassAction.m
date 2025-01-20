@interface WFGetClassAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetClassAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetClassAction *)self parameterValueForKey:@"Class" ofClass:objc_opt_class()];
  Class v6 = NSClassFromString(v5);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E587B0;
  v8[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_264E5E8E8;
  v7[4] = self;
  [v4 enumerateObjectRepresentations:v8 forClass:v6 completionHandler:v7];
}

void __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  Class v6 = *(void **)(a1 + 32);
  v10 = a4;
  id v7 = a3;
  id v8 = a2;
  v9 = [v6 output];
  [v9 addObject:v8 named:v7];

  v10[2](v10, 0);
}

uint64_t __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end
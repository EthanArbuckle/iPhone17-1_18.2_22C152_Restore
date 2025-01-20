@interface WFEvernoteDeleteAction
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFEvernoteDeleteAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5A1F0;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentations:v4 forClass:objc_opt_class()];
}

void __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_4;
    v8[3] = &unk_264E5E8E8;
    v8[4] = *(void *)(a1 + 32);
    objc_msgSend(v6, "if_enumerateAsynchronously:completionHandler:", &__block_literal_global_16706, v8);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

uint64_t __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  id v7 = +[WFEvernoteAccessResource evernoteSession];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_264E5CA00;
  id v10 = v5;
  id v8 = v5;
  [v7 deleteNote:v6 completion:v9];
}

uint64_t __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
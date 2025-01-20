@interface WFMarkupAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (id)inputDictionary;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFMarkupAction

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFMarkupAction;
  v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithPreviewItems_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithPreviewItems_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2360;
}

- (id)inputDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)WFMarkupAction;
  v2 = [(WFMarkupAction *)&v6 inputDictionary];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = (void *)[v3 copy];
  return v4;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_264E5B908;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 generateCollectionByCoercingToItemClasses:v8 completionHandler:v10];
}

void __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_2;
    v10[3] = &unk_264E5DB20;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v6 getFileRepresentations:v10 forType:0];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_41511);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_4;
  v7[3] = &unk_264E5DB20;
  v5 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v6 = v3;
  [v5 showWithPreviewItems:v4 completionHandler:v7];
}

void __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    v5 = objc_msgSend(a2, "if_map:", &__block_literal_global_222);
    id v6 = [MEMORY[0x263F337B0] collectionWithItems:v5];
    [*(id *)(a1 + 32) setOutput:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v7];
}

id __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F337C8];
  id v3 = (void *)MEMORY[0x263F33870];
  uint64_t v4 = [a2 url];
  v5 = [v3 fileWithURL:v4 options:13];
  id v6 = [v2 itemWithFile:v5];

  return v6;
}

id __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08B18];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 fileURL];

  id v6 = (void *)[v4 initWithURL:v5];
  return v6;
}

@end
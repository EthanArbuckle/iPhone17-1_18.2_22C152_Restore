@interface WFSelectContactsAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (void)outputContacts:(id)a3 completionHandler:(id)a4;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFSelectContactsAction

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFSelectContactsAction;
  v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithProperties_selectMultiple_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithProperties_selectMultiple_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1FD8;
}

- (void)outputContacts:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    v8 = [(WFSelectContactsAction *)self definition];
    v9 = [v8 objectForKey:@"ContactProperties"];
    objc_super v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_248);

    if ([v10 count])
    {
      v11 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v31;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            [v11 addObject:*(void *)(*((void *)&v30 + 1) + 8 * v16++)];
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v14);
      }

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __59__WFSelectContactsAction_outputContacts_completionHandler___block_invoke_2;
      v28[3] = &unk_264E5D218;
      v28[4] = self;
      v29 = v7;
      [v11 generateCollectionByCoercingToItemClasses:v10 completionHandler:v28];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v17 = v6;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * v21);
            v23 = [(WFSelectContactsAction *)self output];
            [v23 addObject:v22];

            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v19);
      }

      if (v7) {
        v7[2](v7);
      }
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

uint64_t __59__WFSelectContactsAction_outputContacts_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setOutput:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

id __59__WFSelectContactsAction_outputContacts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isEqualToString:@"Phone"] & 1) != 0
    || ([v2 isEqualToString:@"Email"] & 1) != 0
    || [v2 isEqualToString:@"URL"])
  {
    v3 = objc_opt_class();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  id v6 = [(WFSelectContactsAction *)self definition];
  uint64_t v7 = [v6 objectForKey:@"ContactProperties"];

  v8 = [(WFSelectContactsAction *)self parameterValueForKey:@"WFSelectMultiple" ofClass:objc_opt_class()];
  uint64_t v9 = [v8 BOOLValue];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_264E5EEE8;
  v10[4] = self;
  [v5 showWithProperties:v7 selectMultiple:v9 completionHandler:v10];
}

void __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke_2;
    v9[3] = &unk_264E5DED8;
    v9[4] = v8;
    id v10 = v6;
    [v8 outputContacts:v5 completionHandler:v9];
  }
  else
  {
    [v8 finishRunningWithError:v6];
  }
}

uint64_t __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:*(void *)(a1 + 40)];
}

@end
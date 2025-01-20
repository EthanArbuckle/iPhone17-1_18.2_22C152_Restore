@interface WFOpenURLAction
- (BOOL)allowsAnyURLDestinationWhenAddedToWorkflowByUser;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)requiresRemoteExecution;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFOpenURLAction

- (BOOL)allowsAnyURLDestinationWhenAddedToWorkflowByUser
{
  return 1;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to send %2$@ to “%3$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to open “%2$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOpenURLAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F87080];
  id v8 = a3;
  id v9 = [(WFOpenURLAction *)self userInterface];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__WFOpenURLAction_openURL_completionHandler___block_invoke;
  v18[3] = &unk_264E59C10;
  id v19 = v6;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __45__WFOpenURLAction_openURL_completionHandler___block_invoke_2;
  v16 = &unk_264E5CA00;
  id v17 = v19;
  id v10 = v19;
  v11 = [v7 requestWithURL:v8 scheme:0 userInterface:v9 bundleIdentifier:0 successHandler:v18 failureHandler:&v13];

  v12 = objc_msgSend(MEMORY[0x263F86830], "sharedManager", v13, v14, v15, v16);
  [v12 performRequest:v11];
}

uint64_t __45__WFOpenURLAction_openURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__WFOpenURLAction_openURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F08570];
    uint64_t v8 = *MEMORY[0x263F08320];
    id v6 = WFLocalizedString(@"The URL could not be opened.");
    v9[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v3 = [v4 errorWithDomain:v5 code:-1002 userInfo:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E59BE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 getObjectRepresentations:v6 forClass:objc_opt_class()];
}

void __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v23[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = v6;
  if (a4)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
  else
  {
    if ([v6 count])
    {
      uint64_t v8 = [v7 firstObject];
      if ((unint64_t)[v7 count] > 1
        || ([v8 scheme],
            id v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v9 isEqualToString:@"data"],
            v9,
            v10))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        v21.receiver = *(id *)(a1 + 32);
        v21.super_class = (Class)WFOpenURLAction;
        objc_msgSendSuper2(&v21, sel_runAsynchronouslyWithInput_, v11);
      }
      else
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_2;
        v19[3] = &unk_264E59BC0;
        uint64_t v20 = *(void *)(a1 + 32);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_4;
        v18[3] = &unk_264E5E8E8;
        void v18[4] = v20;
        objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v19, v18);
      }
    }
    else
    {
      v12 = *(void **)(a1 + 32);
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F870B8];
      v22[0] = *MEMORY[0x263F08338];
      uint64_t v8 = WFLocalizedString(@"No URL Specified");
      v23[0] = v8;
      v22[1] = *MEMORY[0x263F08320];
      v15 = WFLocalizedString(@"Make sure to pass a valid URL to the Open URL action.");
      v23[1] = v15;
      v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      id v17 = [v13 errorWithDomain:v14 code:6 userInfo:v16];
      [v12 finishRunningWithError:v17];
    }
  }
}

void __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_264E5CA00;
  id v10 = v6;
  id v8 = v6;
  [v7 openURL:a2 completionHandler:v9];
}

uint64_t __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

uint64_t __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"urls"];

  if (v18)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__WFOpenURLAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v20[3] = &unk_264E5BDE0;
    id v21 = v16;
    [v15 getObjectRepresentations:v20 forClass:objc_opt_class()];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WFOpenURLAction;
    [(WFHandleIntentAction *)&v19 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
  }
}

uint64_t __77__WFOpenURLAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (BOOL)requiresRemoteExecution
{
  return 0;
}

@end
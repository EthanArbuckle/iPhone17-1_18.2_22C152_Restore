@interface WFGiphyAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (WFGiphySessionManager)sessionManager;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithNoUserInterface;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFGiphyAction

+ (id)userInterfaceXPCInterface
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFGiphyAction;
  v2 = objc_msgSendSuper2(&v7, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithQuery_selectMultiple_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1C10;
}

- (void).cxx_destruct
{
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  objc_super v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to send %2$@ to GIPHY?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to search for GIFs on GIPHY?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "giphyLocation", a3);
}

- (void)runWithNoUserInterface
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__WFGiphyAction_runWithNoUserInterface__block_invoke;
  aBlock[3] = &unk_264E5EEE8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  uint64_t v4 = [(WFGiphyAction *)self parameterValueForKey:@"WFGiphyLimit" ofClass:objc_opt_class()];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [(WFGiphyAction *)self parameterValueForKey:@"WFGiphyQuery" ofClass:objc_opt_class()];
  uint64_t v7 = [v6 length];
  id v8 = [(WFGiphyAction *)self sessionManager];
  v9 = v8;
  if (v7) {
    [v8 search:v6 limit:v5 completion:v3];
  }
  else {
    [v8 trendingWithLimit:v5 completion:v3];
  }
}

void __39__WFGiphyAction_runWithNoUserInterface__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) output];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(WFGiphyAction *)self parameterValueForKey:@"WFGiphyQuery" ofClass:objc_opt_class()];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = &stru_26F008428;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  uint64_t v9 = v8;

  uint64_t v10 = [(WFGiphyAction *)self parameterValueForKey:@"WFGiphySelectMultiple" ofClass:objc_opt_class()];
  uint64_t v11 = [v10 BOOLValue];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__WFGiphyAction_runWithRemoteUserInterface_input___block_invoke;
  v12[3] = &unk_264E5EEE8;
  v12[4] = self;
  [v5 showWithQuery:v9 selectMultiple:v11 completionHandler:v12];
}

void __50__WFGiphyAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        long long v13 = objc_msgSend(*(id *)(a1 + 32), "output", (void)v14);
        [v13 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 32) finishRunningWithError:0];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFGiphyAction *)self parameterValueForKey:@"WFGiphyShowPicker" ofClass:objc_opt_class()];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__WFGiphyAction_runAsynchronouslyWithInput___block_invoke;
    v7[3] = &unk_264E59428;
    v7[4] = self;
    id v8 = v4;
    [(WFGiphyAction *)self requestInterfacePresentationWithCompletionHandler:v7];
  }
  else
  {
    [(WFGiphyAction *)self runWithNoUserInterface];
  }
}

id __44__WFGiphyAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2)
  {
    return (id)[v3 runWithRemoteUserInterface:a2 input:v4];
  }
  else
  {
    v6.receiver = v3;
    v6.super_class = (Class)WFGiphyAction;
    return objc_msgSendSuper2(&v6, sel_runAsynchronouslyWithInput_, v4);
  }
}

- (WFGiphySessionManager)sessionManager
{
  sessionManager = self->_sessionManager;
  if (!sessionManager)
  {
    uint64_t v4 = (WFGiphySessionManager *)objc_opt_new();
    id v5 = self->_sessionManager;
    self->_sessionManager = v4;

    [(WFGiphySessionManager *)self->_sessionManager setApiKey:@"3rgXBOG8ANnZAaq4Vi"];
    sessionManager = self->_sessionManager;
  }
  return sessionManager;
}

@end
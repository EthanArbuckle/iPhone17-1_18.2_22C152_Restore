@interface WFPocketAddAction
- (NSError)lastError;
- (OS_dispatch_group)addGroup;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)finishRunningWithError:(id)a3;
- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setAddGroup:(id)a3;
- (void)setLastError:(id)a3;
@end

@implementation WFPocketAddAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_addGroup, 0);
}

- (void)setLastError:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setAddGroup:(id)a3
{
}

- (OS_dispatch_group)addGroup
{
  return self->_addGroup;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add %2$@ to Pocket?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add content to Pocket?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "pocketLocation", a3);
}

- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6
{
  if (a6) {
    -[WFPocketAddAction setLastError:](self, "setLastError:", a6, a4, a5);
  }
  v7 = [(WFPocketAddAction *)self addGroup];
  dispatch_group_leave(v7);
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  [(WFPocketAddAction *)self setAddGroup:0];
  [(WFPocketAddAction *)self setLastError:0];
  v5.receiver = self;
  v5.super_class = (Class)WFPocketAddAction;
  [(WFPocketAddAction *)&v5 finishRunningWithError:v4];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  [(WFPocketAddAction *)self setAddGroup:v5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &unk_264E585E8;
  uint64_t v12 = v5;
  v13 = self;
  uint64_t v6 = objc_opt_class();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_264E58610;
  v9 = v12;
  v10 = self;
  v7 = v12;
  [v4 enumerateObjectRepresentations:v11 forClass:v6 completionHandler:v8];
}

void __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v20[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  v9 = *(NSObject **)(a1 + 32);
  v10 = a4;
  dispatch_group_enter(v9);
  v19[0] = @"url";
  v11 = [v7 absoluteString];
  v20[0] = v11;
  v19[1] = @"title";
  uint64_t v12 = [v8 length];
  v13 = v8;
  if (!v12)
  {
    v13 = [v7 absoluteString];
  }
  v20[1] = v13;
  v19[2] = @"tags";
  uint64_t v14 = [*(id *)(a1 + 40) parameterValueForKey:@"WFPocketTags" ofClass:objc_opt_class()];
  v15 = (void *)v14;
  v16 = &stru_26F008428;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v20[2] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (!v12) {
  v18 = +[PocketAPI sharedAPI];
  }
  [v18 callAPIMethod:@"add" withHTTPMethod:1 arguments:v17 delegate:*(void *)(a1 + 40)];

  v10[2](v10, 0);
}

void __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_group_t v5 = *(NSObject **)(a1 + 32);
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_264E5DED8;
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, v6, v8);
}

void __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 lastError];
  id v4 = (id)v3;
  if (!v3) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  [v2 finishRunningWithError:v3];
}

@end
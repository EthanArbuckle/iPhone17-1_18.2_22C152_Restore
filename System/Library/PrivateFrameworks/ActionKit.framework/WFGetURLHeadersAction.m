@interface WFGetURLHeadersAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetURLHeadersAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
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
    v11 = WFLocalizedString(@"Allow “%1$@” to connect to “%2$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFGetURLHeadersAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke_4;
    v8[3] = &unk_264E5E840;
    v8[4] = *(void *)(a1 + 32);
    [v6 transformItemsUsingBlock:&__block_literal_global_50671 completionHandler:v8];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke_3;
  v6[3] = &unk_264E5D748;
  id v7 = v4;
  id v5 = v4;
  [a2 getHeadersWithCompletionHandler:v6];
}

void __52__WFGetURLHeadersAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v8 allHeaderFields];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
  }
}

@end
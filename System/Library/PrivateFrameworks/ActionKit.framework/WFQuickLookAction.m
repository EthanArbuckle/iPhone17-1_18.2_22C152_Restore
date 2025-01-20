@interface WFQuickLookAction
+ (id)userInterfaceProtocol;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFQuickLookAction

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFQuickLookAction *)self parameterValueForKey:@"WFQuickLookActionFullScreen" ofClass:objc_opt_class()];
  uint64_t v9 = [v8 BOOLValue];

  v10 = objc_msgSend(MEMORY[0x263F08910], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v6, 1);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WFQuickLookAction_runWithRemoteUserInterface_input___block_invoke;
  v11[3] = &unk_264E5EBC8;
  v11[4] = self;
  [v7 showWithItems:v10 fullScreen:v9 completionHandler:v11];
}

uint64_t __54__WFQuickLookAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFQuickLookAction *)self input];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__WFQuickLookAction_getContentDestinationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5CE88;
  id v8 = v4;
  id v6 = v4;
  [v5 getFileRepresentations:v7 forType:0];
}

void __64__WFQuickLookAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = v5;
  if (a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_3:
    v6();
    goto LABEL_4;
  }
  if (![v5 count])
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_3;
  }
  id v7 = objc_msgSend(v10, "if_firstObjectPassingTest:", &__block_literal_global_38797);

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v9 = [MEMORY[0x263F337E8] webpagesLocation];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
  }
LABEL_4:
}

uint64_t __64__WFQuickLookAction_getContentDestinationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 fileURL];
  v3 = [v2 pathExtension];
  uint64_t v4 = [v3 isEqualToString:@"webloc"];

  return v4;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfItems])
  {
    v10.receiver = self;
    v10.super_class = (Class)WFQuickLookAction;
    [(WFQuickLookAction *)&v10 runAsynchronouslyWithInput:v4];
  }
  else
  {
    id v5 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
    id v6 = WFLocalizedString(@"No Items");
    [v5 setTitle:v6];

    id v7 = WFLocalizedString(@"The Quick Look action wasn't passed any items to preview.");
    [v5 setMessage:v7];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__WFQuickLookAction_runAsynchronouslyWithInput___block_invoke;
    v11[3] = &unk_264E5EE70;
    v11[4] = self;
    uint64_t v8 = [MEMORY[0x263F336F0] okButtonWithHandler:v11];
    [v5 addButton:v8];

    uint64_t v9 = [(WFQuickLookAction *)self userInterface];
    [v9 presentAlert:v5];
  }
}

uint64_t __48__WFQuickLookAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2138;
}

@end
@interface WFGetItemNameAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetItemNameAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E58660;
  v4[4] = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_3;
  v3[3] = &unk_264E5E840;
  v3[4] = self;
  [a3 transformItemsUsingBlock:v4 completionHandler:v3];
}

void __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) parameterValueForKey:@"GetWebPageTitle" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) contentPermissionRequestor];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_2;
    v11[3] = &unk_264E58638;
    id v12 = v6;
    [v5 getTitleWithPermissionRequestor:v9 completionHandler:v11];
  }
  else
  {
    v10 = [v5 name];
    (*((void (**)(id, void *, void))v6 + 2))(v6, v10, 0);
  }
}

void __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

uint64_t __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
@interface WFGetOnScreenContentAction
- (id)contentDestinationWithError:(id *)a3;
- (id)disabledOnPlatforms;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetOnScreenContentAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to get current on screen content?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "onScreenContentLocation", a3);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F85398]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__WFGetOnScreenContentAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_264E5E840;
  v5[4] = self;
  [v4 getOnScreenContentForInputContentClasses:0 completionHandler:v5];
}

uint64_t __57__WFGetOnScreenContentAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 setOutput:a2];
    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "finishRunningWithError:");
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFGetOnScreenContentAction;
  v2 = [(WFGetOnScreenContentAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end
@interface WFClearUpNextAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFClearUpNextAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to clear all the music in your Playing Next queue?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)[MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:*MEMORY[0x263F85538] promptingBehaviour:2];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = objc_alloc_init(WFMediaPlaybackController);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__WFClearUpNextAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_264E5EBC8;
  v5[4] = self;
  [(WFMediaPlaybackController *)v4 clearQueueWithCompletion:v5];
}

uint64_t __50__WFClearUpNextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end
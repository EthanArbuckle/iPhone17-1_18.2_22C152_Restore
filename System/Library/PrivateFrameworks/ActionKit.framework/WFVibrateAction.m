@interface WFVibrateAction
- (id)disabledOnPlatforms;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFVibrateAction

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFVibrateAction;
  v2 = [(WFVibrateAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  inCompletionBlock[0] = MEMORY[0x263EF8330];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __46__WFVibrateAction_runAsynchronouslyWithInput___block_invoke;
  inCompletionBlock[3] = &unk_264E5EE70;
  inCompletionBlock[4] = self;
  AudioServicesPlaySystemSoundWithCompletion(0xFFFu, inCompletionBlock);
}

uint64_t __46__WFVibrateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

@end
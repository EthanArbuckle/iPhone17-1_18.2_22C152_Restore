@interface WFViewContentGraphAction
+ (id)userInterfaceProtocol;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFViewContentGraphAction

+ (id)userInterfaceProtocol
{
  return &unk_26F0E28C8;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__WFViewContentGraphAction_runWithRemoteUserInterface_input___block_invoke;
  v4[3] = &unk_264E5EBC8;
  v4[4] = self;
  [a3 showWithContentItems:a4 completionHandler:v4];
}

uint64_t __61__WFViewContentGraphAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end
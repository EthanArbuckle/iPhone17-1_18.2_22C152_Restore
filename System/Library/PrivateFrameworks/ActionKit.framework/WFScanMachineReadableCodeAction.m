@interface WFScanMachineReadableCodeAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (id)disabledOnPlatforms;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFScanMachineReadableCodeAction

+ (id)userInterfaceXPCInterface
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFScanMachineReadableCodeAction;
  v2 = objc_msgSendSuper2(&v5, sel_userInterfaceXPCInterface);
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_showWithCompletionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1300;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__WFScanMachineReadableCodeAction_runWithRemoteUserInterface_input___block_invoke;
  v4[3] = &unk_264E55C90;
  v4[4] = self;
  objc_msgSend(a3, "showWithCompletionHandler:", v4, a4);
}

void __68__WFScanMachineReadableCodeAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    objc_super v5 = *(void **)(a1 + 32);
    id v6 = a2;
    v7 = [v5 output];
    [v7 addObject:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFScanMachineReadableCodeAction;
  v2 = [(WFScanMachineReadableCodeAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end
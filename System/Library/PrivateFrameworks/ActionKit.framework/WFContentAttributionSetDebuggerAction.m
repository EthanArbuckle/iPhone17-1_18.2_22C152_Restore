@interface WFContentAttributionSetDebuggerAction
+ (id)userInterfaceProtocol;
- (WFContentAttributionSetDebuggerAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFContentAttributionSetDebuggerAction

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__WFContentAttributionSetDebuggerAction_runWithRemoteUserInterface_input___block_invoke;
  v4[3] = &unk_264E5EBC8;
  v4[4] = self;
  [a3 showWithInput:a4 completionHandler:v4];
}

uint64_t __74__WFContentAttributionSetDebuggerAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (WFContentAttributionSetDebuggerAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (VCIsInternalBuild())
  {
    v13.receiver = self;
    v13.super_class = (Class)WFContentAttributionSetDebuggerAction;
    self = [(WFContentAttributionSetDebuggerAction *)&v13 initWithIdentifier:v8 definition:v9 serializedParameters:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1CD8;
}

@end
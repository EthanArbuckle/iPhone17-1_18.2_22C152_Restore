@interface WFShowDefinitionAction
+ (id)userInterfaceProtocol;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFShowDefinitionAction

+ (id)userInterfaceProtocol
{
  return &unk_26F0E24E8;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_264E5DF30;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a4 getStringRepresentation:v8];
}

void __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke_2;
    v15[3] = &unk_264E5EBC8;
    id v7 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    [v7 showWithString:v5 completionHandler:v15];
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v6)
    {
      [v8 finishRunningWithError:v6];
    }
    else
    {
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F870B8];
      v16[0] = *MEMORY[0x263F08338];
      v11 = WFLocalizedString(@"No Word Specified");
      v17[0] = v11;
      v16[1] = *MEMORY[0x263F08320];
      v12 = WFLocalizedString(@"No word was passed as input to Show Definition");
      v17[1] = v12;
      v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      v14 = [v9 errorWithDomain:v10 code:6 userInfo:v13];
      [v8 finishRunningWithError:v14];
    }
  }
}

uint64_t __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end
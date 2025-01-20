@interface WFTrimVideoAction
+ (id)userInterfaceProtocol;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFTrimVideoAction

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1788;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_264E5D368;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a4 getFileRepresentation:v8 forType:0];
}

void __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    id v7 = (void *)getUIVideoEditorControllerClass_softClass;
    uint64_t v25 = getUIVideoEditorControllerClass_softClass;
    if (!getUIVideoEditorControllerClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getUIVideoEditorControllerClass_block_invoke;
      v21[3] = &unk_264E5EC88;
      v21[4] = &v22;
      __getUIVideoEditorControllerClass_block_invoke((uint64_t)v21);
      id v7 = (void *)v23[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v22, 8);
    id v9 = [v5 fileURL];
    v10 = [v9 path];
    LOBYTE(v8) = [v8 canEditVideoAtPath:v10];

    if (v8)
    {
      v11 = *(void **)(a1 + 40);
      id v12 = objc_alloc(MEMORY[0x263F08B18]);
      v13 = [v5 fileURL];
      v14 = (void *)[v12 initWithURL:v13];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke_2;
      v19[3] = &unk_264E57090;
      v19[4] = *(void *)(a1 + 32);
      id v20 = v5;
      [v11 showWithVideo:v14 completionHandler:v19];
    }
    else
    {
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      v16 = WFLocalizedString(@"The input was not a video that can be edited.");
      v27[0] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v18 = [v15 errorWithDomain:*MEMORY[0x263F07F70] code:2048 userInfo:v17];

      [*(id *)(a1 + 32) finishRunningWithError:v18];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

void __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    id v5 = (void *)MEMORY[0x263F33870];
    id v6 = [a2 url];
    id v7 = [v5 fileWithURL:v6 options:13];

    id v8 = [*(id *)(a1 + 32) output];
    [v8 addFile:v7];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v9];
}

@end
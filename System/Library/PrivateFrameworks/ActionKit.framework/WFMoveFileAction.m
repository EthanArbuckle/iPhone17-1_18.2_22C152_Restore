@interface WFMoveFileAction
- (WFFileStorageServiceOperation)saveOperation;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setSaveOperation:(id)a3;
@end

@implementation WFMoveFileAction

- (void).cxx_destruct
{
}

- (void)setSaveOperation:(id)a3
{
}

- (WFFileStorageServiceOperation)saveOperation
{
  return self->_saveOperation;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(WFMoveFileAction *)self input];
  uint64_t v10 = [v9 numberOfItems];

  v11 = NSString;
  if (v10 <= 1) {
    v12 = @"Allow “%1$@” to move a file in “%2$@”?";
  }
  else {
    v12 = @"Allow “%1$@” to move files in “%2$@”?";
  }
  v13 = WFLocalizedString(v12);
  v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v7, v8);

  return v14;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = [(WFMoveFileAction *)self parameterValueForKey:@"WFFolder" ofClass:objc_opt_class()];
  v4 = [MEMORY[0x263F337E8] contentLocationForFile:v3];

  return v4;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 numberOfItems] == 1)
  {
    id v5 = [(WFMoveFileAction *)self parameterValueForKey:@"WFFolder" ofClass:objc_opt_class()];
    if (v5)
    {
      v6 = [(WFMoveFileAction *)self parameterValueForKey:@"WFReplaceExisting" ofClass:objc_opt_class()];
      char v7 = [v6 BOOLValue];

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke;
      v14[3] = &unk_264E57508;
      id v5 = v5;
      char v17 = v7;
      id v15 = v5;
      v16 = self;
      [v4 getFileRepresentation:v14 forType:0];
    }
    else
    {
      [(WFMoveFileAction *)self finishRunningWithError:0];
    }
  }
  else
  {
    WFLocalizedString(@"No Input");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = WFLocalizedString(@"No files were passed as input to the Move File action.");
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F870B8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v18[0] = *MEMORY[0x263F08338];
    v18[1] = v11;
    v19[0] = v5;
    v19[1] = v8;
    v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    v13 = [v9 errorWithDomain:v10 code:6 userInfo:v12];
    [(WFMoveFileAction *)self finishRunningWithError:v13];
  }
}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(WFDefaultFileStorageService);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_2;
  aBlock[3] = &unk_264E574E0;
  id v5 = v3;
  id v27 = v5;
  id v28 = *(id *)(a1 + 32);
  v6 = v4;
  char v31 = *(unsigned char *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  v29 = v6;
  uint64_t v30 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  v9 = [*(id *)(a1 + 32) fileURL];
  uint64_t v10 = [v5 fileURL];
  uint64_t v11 = [v10 lastPathComponent];
  v12 = [v9 URLByAppendingPathComponent:v11];

  if ([(WFDefaultFileStorageService *)v6 fileIsInProtectedList:v12])
  {
    v13 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
    v14 = WFLocalizedString(@"Allow this shortcut to make a change to shell configuration file?");
    [v13 setTitle:v14];

    id v15 = WFLocalizedString(@"The content of this file will be executed automatically and could be malicious.");
    [v13 setMessage:v15];

    v16 = (void *)MEMORY[0x263F336F0];
    char v17 = WFLocalizedString(@"Don’t Allow");
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_5;
    v25[3] = &unk_264E5EE70;
    v25[4] = *(void *)(a1 + 40);
    v18 = [v16 buttonWithTitle:v17 style:1 handler:v25];
    [v13 addButton:v18];

    v19 = (void *)MEMORY[0x263F336F0];
    v20 = WFLocalizedString(@"OK");
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_6;
    v23[3] = &unk_264E5EE40;
    v24 = v8;
    v21 = [v19 buttonWithTitle:v20 style:0 preferred:1 handler:v23];
    [v13 addButton:v21];

    v22 = [*(id *)(a1 + 40) userInterface];
    [v22 presentAlert:v13];
  }
  else
  {
    v8[2](v8);
  }
}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fileURL];
  id v3 = objc_msgSend(v2, "wf_fileProviderItem");

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) fileURL];
    id v5 = objc_msgSend(v4, "wf_fileProviderItem");

    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_3;
    v13[3] = &unk_264E5D390;
    uint64_t v7 = *(void **)(a1 + 48);
    v13[4] = *(void *)(a1 + 56);
    [v7 moveItem:v3 replaceExisting:v6 withManagedLevel:0 toDirectory:v5 progress:0 completionHandler:v13];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_4;
    v12[3] = &unk_264E5D390;
    v12[4] = *(void *)(a1 + 56);
    [v8 moveFile:v11 replaceExisting:v10 withManagedLevel:0 toDirectory:v9 progress:0 completionHandler:v12];
  }
}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishRunningWithError:v2];
}

uint64_t __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v8)
    {
      uint64_t v7 = [v6 output];
      [v7 addFileWithOriginAttribution:v8];

      uint64_t v6 = *(void **)(a1 + 32);
    }
    [v6 finishRunningWithError:v5];
  }
}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v8)
    {
      uint64_t v7 = [v6 output];
      [v7 addFileWithOriginAttribution:v8];

      uint64_t v6 = *(void **)(a1 + 32);
    }
    [v6 finishRunningWithError:v5];
  }
}

@end
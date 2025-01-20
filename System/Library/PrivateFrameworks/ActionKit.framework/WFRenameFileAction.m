@interface WFRenameFileAction
- (WFFileRepresentation)parentDirectory;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)finishRunningWithFile:(id)a3 error:(id)a4;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)renameFile:(id)a3 name:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setParentDirectory:(id)a3;
@end

@implementation WFRenameFileAction

- (void).cxx_destruct
{
}

- (void)setParentDirectory:(id)a3
{
}

- (WFFileRepresentation)parentDirectory
{
  return self->_parentDirectory;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to rename a file in “%2$@” using %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v7);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to rename a file in “%2$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v7 = a3;
  v4 = [(WFRenameFileAction *)self input];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F337E8];
    v6 = [(WFRenameFileAction *)self input];
    [v5 getContentLocationFromFile:v6 completionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)finishRunningWithFile:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(WFRenameFileAction *)self isRunning])
  {
    if (v8)
    {
      id v7 = [(WFRenameFileAction *)self output];
      [v7 addFileWithOriginAttribution:v8];
    }
    [(WFRenameFileAction *)self finishRunningWithError:v6];
  }
}

- (void)renameFile:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 updatedFilenameForUserEnteredName:v7 addingExtensionIfNecessary:1];
  id v9 = objc_alloc_init(WFDefaultFileStorageService);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFRenameFileAction_renameFile_name___block_invoke;
  aBlock[3] = &unk_264E5D3E0;
  id v10 = v6;
  id v31 = v10;
  v11 = v9;
  v32 = v11;
  id v12 = v8;
  id v33 = v12;
  v34 = self;
  v13 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v14 = [v10 fileURL];
  v15 = [v14 URLByDeletingLastPathComponent];
  v16 = [v15 URLByAppendingPathComponent:v7];

  if ([(WFDefaultFileStorageService *)v11 fileIsInProtectedList:v16])
  {
    v17 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
    v18 = WFLocalizedString(@"Allow this shortcut to make a change to shell configuration file?");
    [v17 setTitle:v18];

    v19 = WFLocalizedString(@"The content of this file will be executed automatically and could be malicious.");
    [v17 setMessage:v19];

    v20 = (void *)MEMORY[0x263F336F0];
    v21 = WFLocalizedString(@"Don’t Allow");
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_6;
    v29[3] = &unk_264E5EE70;
    v29[4] = self;
    v22 = [v20 buttonWithTitle:v21 style:1 handler:v29];
    [v17 addButton:v22];

    v23 = (void *)MEMORY[0x263F336F0];
    v24 = WFLocalizedString(@"OK");
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_7;
    v27[3] = &unk_264E5EE40;
    v28 = v13;
    v25 = [v23 buttonWithTitle:v24 style:0 preferred:1 handler:v27];
    [v17 addButton:v25];

    v26 = [(WFRenameFileAction *)self userInterface];
    [v26 presentAlert:v17];
  }
  else
  {
    v13[2](v13);
  }
}

void __38__WFRenameFileAction_renameFile_name___block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) fileURL];
  v3 = objc_msgSend(v2, "wf_fileProviderItem");

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_2;
    v30[3] = &unk_264E5D390;
    v30[4] = *(void *)(a1 + 56);
    [v4 renameItem:v3 name:v5 withManagedLevel:0 progress:0 completionHandler:v30];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) fileURL];
    id v7 = [v6 URLByDeletingLastPathComponent];

    id v8 = [MEMORY[0x263F85128] standardClient];
    id v9 = [v7 path];
    id v10 = [*(id *)(a1 + 56) workflow];
    v11 = [v10 workflowID];
    id v12 = [v8 resolveFilePath:v9 workflowID:v11 error:0];

    v13 = [v7 URLByAppendingPathComponent:*(void *)(a1 + 48)];
    if (v12)
    {
      uint64_t v14 = (void *)MEMORY[0x263F33870];
      v15 = [v12 url];
      v16 = [v14 fileWithURL:v15 options:8];
      [*(id *)(a1 + 56) setParentDirectory:v16];

      uint64_t v18 = *(void *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_3;
      v29[3] = &unk_264E5D390;
      v29[4] = *(void *)(a1 + 56);
      [v17 moveFile:v18 destination:v13 withManagedLevel:0 progress:0 completionHandler:v29];
    }
    else
    {
      v19 = [*(id *)(a1 + 56) variableSource];
      v31[0] = v7;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_4;
      v23[3] = &unk_264E5D3B8;
      id v21 = v7;
      uint64_t v22 = *(void *)(a1 + 56);
      id v24 = v21;
      uint64_t v25 = v22;
      id v26 = *(id *)(a1 + 40);
      id v27 = *(id *)(a1 + 32);
      id v28 = v13;
      [v19 requestAccessToFileAtURLs:v20 completionHandler:v23];
    }
  }
}

void __38__WFRenameFileAction_renameFile_name___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishRunningWithError:v2];
}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishRunningWithFile:a2 error:a3];
}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishRunningWithFile:a2 error:a3];
}

void __38__WFRenameFileAction_renameFile_name___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x263F85128] standardClient];
  v3 = [*(id *)(a1 + 32) path];
  v4 = [*(id *)(a1 + 40) workflow];
  uint64_t v5 = [v4 workflowID];
  id v15 = 0;
  id v6 = [v2 resolveFilePath:v3 workflowID:v5 error:&v15];
  id v7 = v15;

  if (v6)
  {
    id v8 = (void *)MEMORY[0x263F33870];
    id v9 = [v6 url];
    id v10 = [v8 fileWithURL:v9 options:8];
    [*(id *)(a1 + 40) setParentDirectory:v10];

    v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_5;
    v14[3] = &unk_264E5D390;
    v14[4] = *(void *)(a1 + 40);
    [v11 moveFile:v12 destination:v13 withManagedLevel:0 progress:0 completionHandler:v14];
  }
  else
  {
    [*(id *)(a1 + 40) finishRunningWithError:v7];
  }
}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishRunningWithFile:a2 error:a3];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFRenameFileAction *)self parameterValueForKey:@"WFNewFilename" ofClass:objc_opt_class()];
  if ([v5 length])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__WFRenameFileAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E5D368;
    v13[4] = self;
    id v14 = v5;
    [v4 getFileRepresentation:v13 forType:0];
  }
  else
  {
    id v6 = WFLocalizedString(@"No Name Provided");
    id v7 = WFLocalizedString(@"Please pass a name to the Rename File action.");
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F870B8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v15[0] = *MEMORY[0x263F08338];
    v15[1] = v10;
    v16[0] = v6;
    v16[1] = v7;
    v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v12 = [v8 errorWithDomain:v9 code:5 userInfo:v11];
    [(WFRenameFileAction *)self finishRunningWithError:v12];
  }
}

uint64_t __49__WFRenameFileAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 renameFile:a2 name:*(void *)(a1 + 40)];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

@end
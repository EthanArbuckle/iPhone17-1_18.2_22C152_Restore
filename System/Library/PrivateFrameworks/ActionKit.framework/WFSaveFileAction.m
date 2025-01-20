@interface WFSaveFileAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)inputsMultipleItems;
- (BOOL)isProgressIndeterminate;
- (BOOL)requiresRemoteExecution;
- (WFFileStorageServiceOperation)saveOperation;
- (id)contentDestinationWithError:(id *)a3;
- (id)filePathKey;
- (id)minimumSupportedClientVersion;
- (id)showPickerKey;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)cancel;
- (void)finishRunningWithError:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4 storageService:(id)a5 subpath:(id)a6;
- (void)runWithStorageService:(id)a3 directory:(id)a4 subpath:(id)a5 input:(id)a6;
- (void)setSaveOperation:(id)a3;
@end

@implementation WFSaveFileAction

+ (id)userInterfaceXPCInterface
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___WFSaveFileAction;
  v2 = objc_msgSendSuper2(&v12, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_retrieveFilesWithConsumingBundleID_options_completionHandler_ argumentIndex:1 ofReply:0];

  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_retrieveFilesWithConsumingBundleID_options_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1E68;
}

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

- (id)minimumSupportedClientVersion
{
  v5.receiver = self;
  v5.super_class = (Class)WFSaveFileAction;
  v2 = [(WFSaveFileAction *)&v5 minimumSupportedClientVersion];
  v3 = WFMaximumBundleVersion();

  return v3;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    uint64_t v9 = WFLocalizedString(@"Allow “%1$@” to save %2$@ to a file?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    uint64_t v9 = WFLocalizedString(@"Allow “%1$@” to save data to a file?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, 0);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  if ([(WFStorageServiceAction *)self showsFilePicker])
  {
    uint64_t v4 = 0;
  }
  else
  {
    objc_super v5 = [(WFSaveFileAction *)self parameterValueForKey:@"WFFolder" ofClass:objc_opt_class()];
    if (v5)
    {
      uint64_t v4 = [MEMORY[0x263F337E8] contentLocationForFile:v5];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFSaveFileAction;
  return [(WFStorageServiceAction *)&v3 requiresRemoteExecution];
}

- (BOOL)inputsMultipleItems
{
  return 1;
}

- (id)showPickerKey
{
  return @"WFAskWhereToSave";
}

- (id)filePathKey
{
  return @"WFFileDestinationPath";
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  [(WFSaveFileAction *)self setSaveOperation:0];
  v5.receiver = self;
  v5.super_class = (Class)WFSaveFileAction;
  [(WFSaveFileAction *)&v5 finishRunningWithError:v4];
}

- (void)cancel
{
  objc_super v3 = [(WFSaveFileAction *)self saveOperation];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)WFSaveFileAction;
  [(WFSaveFileAction *)&v4 cancel];
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4 storageService:(id)a5 subpath:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x263F086E0];
  id v14 = a3;
  v15 = [v13 mainBundle];
  v16 = [v15 bundleIdentifier];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__WFSaveFileAction_runWithRemoteUserInterface_input_storageService_subpath___block_invoke;
  v20[3] = &unk_264E5BD20;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v10;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  [v14 retrieveFilesWithConsumingBundleID:v16 options:8 completionHandler:v20];
}

void __76__WFSaveFileAction_runWithRemoteUserInterface_input_storageService_subpath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 firstObject];
  v7 = v6;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x263F33870];
    uint64_t v9 = [v6 wrappedURL];
    id v10 = [v9 url];
    id v11 = [v8 fileWithURL:v10 options:8];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) variableSource];
      [v12 captureFileRepresentation:v11];

      v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      v15 = [v11 fileURL];
      [v13 runWithStorageService:v14 directory:v15 subpath:*(void *)(a1 + 48) input:*(void *)(a1 + 56)];
    }
    else
    {
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F07F70];
      uint64_t v21 = *MEMORY[0x263F08338];
      id v18 = WFLocalizedString(@"The Save File action failed because there was a problem with the selected destination.");
      v22[0] = v18;
      id v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v20 = [v16 errorWithDomain:v17 code:256 userInfo:v19];

      [*(id *)(a1 + 32) finishRunningWithError:v20];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

- (void)runWithStorageService:(id)a3 directory:(id)a4 subpath:(id)a5 input:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke;
  v15[3] = &unk_264E5BD20;
  v15[4] = self;
  id v16 = v11;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  [v14 getFileRepresentations:v15 forType:0];
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [a1[4] finishRunningWithError:v6];
  }
  else
  {
    v7 = objc_msgSend(v5, "if_map:", &__block_literal_global_26131);
    uint64_t v42 = 0;
    id v8 = [a1[5] attributionSet];
    [v8 isEligibleToShareWithResultManagedLevel:&v42];

    id v9 = [a1[4] parameterValueForKey:@"WFSaveFileOverwrite" ofClass:objc_opt_class()];
    unsigned int v10 = [v9 BOOLValue];

    id v11 = objc_alloc_init(WFDefaultFileStorageService);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_3;
    aBlock[3] = &unk_264E596E8;
    aBlock[4] = a1[4];
    id v12 = v11;
    v36 = v12;
    id v13 = v7;
    id v37 = v13;
    uint64_t v40 = v42;
    id v38 = a1[6];
    id v39 = a1[7];
    uint64_t v41 = v10;
    id v14 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_6;
    v28[3] = &unk_264E59710;
    v30 = &v31;
    id v29 = a1[6];
    [v5 enumerateObjectsUsingBlock:v28];
    if (*((unsigned char *)v32 + 24))
    {
      v15 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
      id v16 = WFLocalizedString(@"Allow this shortcut to make a change to shell configuration file?");
      [v15 setTitle:v16];

      id v17 = WFLocalizedString(@"The content of this file will be executed automatically and could be malicious.");
      [v15 setMessage:v17];

      id v18 = (void *)MEMORY[0x263F336F0];
      id v19 = WFLocalizedString(@"Don’t Allow");
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_7;
      v27[3] = &unk_264E5EE70;
      v27[4] = a1[4];
      v20 = [v18 buttonWithTitle:v19 style:1 handler:v27];
      [v15 addButton:v20];

      uint64_t v21 = (void *)MEMORY[0x263F336F0];
      id v22 = WFLocalizedString(@"OK");
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_8;
      v25[3] = &unk_264E5EE40;
      v26 = v14;
      id v23 = [v21 buttonWithTitle:v22 style:0 preferred:1 handler:v25];
      [v15 addButton:v23];

      v24 = [a1[4] userInterface];
      [v24 presentAlert:v15];
    }
    else
    {
      v14[2](v14);
    }

    _Block_object_dispose(&v31, 8);
  }
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) progress];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_4;
  v10[3] = &unk_264E5EEE8;
  v10[4] = *(void *)(a1 + 32);
  id v9 = [v7 saveFiles:v2 withManagedLevel:v4 toDirectory:v3 subpath:v5 options:v6 progress:v8 completionHandler:v10];
  [*(id *)(a1 + 32) setSaveOperation:v9];
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    v7 = *(void **)(a1 + 32);
    id v8 = [a2 fileURL];
    id v9 = [v8 lastPathComponent];
    unsigned int v10 = [v7 URLByAppendingPathComponent:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10 != 0;
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishRunningWithError:v2];
}

uint64_t __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) isRunning])
  {
    if (v8)
    {
      uint64_t v6 = objc_msgSend(v8, "if_map:", &__block_literal_global_243);
      v7 = [*(id *)(a1 + 32) output];
      [v7 addItems:v6];

      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
    else
    {
      [*(id *)(a1 + 32) finishRunningWithError:v5];
    }
  }
}

uint64_t __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F337C8] itemWithFile:a2];
}

id __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F08B18];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 fileURL];

  uint64_t v6 = (void *)[v4 initWithURL:v5 readonly:1];
  return v6;
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  id v8 = [v6 attributionSet];
  char v9 = [v8 isEligibleToShareWithResultManagedLevel:&v25];

  if (v9)
  {
    if ([v6 numberOfItems])
    {
      unsigned int v10 = [(WFSaveFileAction *)self parameterValueForKey:@"WFAskWhereToSave" ofClass:objc_opt_class()];
      int v11 = [v10 BOOLValue];

      uint64_t v12 = [(WFSaveFileAction *)self parameterValueForKey:@"WFFileDestinationPath" ofClass:objc_opt_class()];
      id v13 = (void *)v12;
      id v14 = &stru_26F008428;
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      v15 = v14;

      if (v11)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __62__WFSaveFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
        v21[3] = &unk_264E596A0;
        v21[4] = self;
        id v22 = v6;
        id v23 = v7;
        v24 = v15;
        [(WFSaveFileAction *)self requestInterfacePresentationWithCompletionHandler:v21];
      }
      else
      {
        id v19 = [(WFSaveFileAction *)self parameterValueForKey:@"WFFolder" ofClass:objc_opt_class()];
        v20 = [v19 fileURL];
        [(WFSaveFileAction *)self runWithStorageService:v7 directory:v20 subpath:v15 input:v6];
      }
    }
    else
    {
      [(WFSaveFileAction *)self finishRunningWithError:0];
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x263F087E8];
    id v17 = [(WFSaveFileAction *)self localizedName];
    id v18 = [v16 sharingMixedMDMContentErrorWithActionName:v17];
    [(WFSaveFileAction *)self finishRunningWithError:v18];
  }
}

uint64_t __62__WFSaveFileAction_runAsynchronouslyWithInput_storageService___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  if (a2) {
    return [v3 runWithRemoteUserInterface:a2 input:a1[5] storageService:a1[6] subpath:a1[7]];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end
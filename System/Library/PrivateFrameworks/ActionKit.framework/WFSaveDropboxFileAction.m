@interface WFSaveDropboxFileAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)inputsMultipleItems;
- (BOOL)isProgressIndeterminate;
- (WFFileStorageServiceOperation)saveOperation;
- (WFSaveDropboxFileActionUserInterface)actionUserInterface;
- (id)filePathKey;
- (id)showPickerKey;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)storageService;
- (void)cancel;
- (void)finishRunningWithError:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
- (void)runWithRemoteUserInterface:(id)a3 path:(id)a4 input:(id)a5 storageService:(id)a6;
- (void)setActionUserInterface:(id)a3;
- (void)setSaveOperation:(id)a3;
@end

@implementation WFSaveDropboxFileAction

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFSaveDropboxFileAction;
  v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithServiceName_input_managedLevel_options_completionHandler_ argumentIndex:1 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithServiceName_input_managedLevel_options_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2DF0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveOperation, 0);
  objc_storeStrong((id *)&self->_actionUserInterface, 0);
}

- (void)setSaveOperation:(id)a3
{
}

- (WFFileStorageServiceOperation)saveOperation
{
  return self->_saveOperation;
}

- (void)setActionUserInterface:(id)a3
{
}

- (WFSaveDropboxFileActionUserInterface)actionUserInterface
{
  return self->_actionUserInterface;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  uint64_t v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to save %2$@ on Dropbox?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to save a file on Dropbox?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  objc_super v10 = };

  return v10;
}

- (id)storageService
{
  v2 = objc_alloc_init(WFDropboxStorageService);
  return v2;
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
  [(WFSaveDropboxFileAction *)self setSaveOperation:0];
  v5.receiver = self;
  v5.super_class = (Class)WFSaveDropboxFileAction;
  [(WFSaveDropboxFileAction *)&v5 finishRunningWithError:v4];
}

- (void)cancel
{
  v3 = [(WFSaveDropboxFileAction *)self actionUserInterface];
  [v3 cancel];

  id v4 = [(WFSaveDropboxFileAction *)self saveOperation];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)WFSaveDropboxFileAction;
  [(WFSaveDropboxFileAction *)&v5 cancel];
}

- (void)runWithRemoteUserInterface:(id)a3 path:(id)a4 input:(id)a5 storageService:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke;
  v18[3] = &unk_264E5EA48;
  v18[4] = self;
  id v19 = v12;
  id v20 = v10;
  id v21 = v13;
  id v22 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  [v17 getFileRepresentations:v18 forType:0];
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v30 = 0;
    id v6 = [*(id *)(a1 + 40) attributionSet];
    [v6 isEligibleToShareWithResultManagedLevel:&v30];

    if (*(void *)(a1 + 48))
    {
      id v7 = (id)*MEMORY[0x263F855A8];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2;
      v28[3] = &unk_264E5E9D0;
      id v29 = v7;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4;
      v23[3] = &unk_264E5EA20;
      v23[4] = *(void *)(a1 + 32);
      id v24 = *(id *)(a1 + 48);
      id v25 = *(id *)(a1 + 56);
      uint64_t v27 = v30;
      id v26 = *(id *)(a1 + 40);
      objc_msgSend(v5, "if_mapAsynchronously:completionHandler:", v28, v23);

      id v8 = v29;
    }
    else
    {
      v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSaveFileOverwrite" ofClass:objc_opt_class()];
      unsigned int v10 = [v9 BOOLValue];

      uint64_t v11 = v30;
      id v12 = *(void **)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      id v14 = [*(id *)(a1 + 32) progress];
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_7;
      id v19 = &unk_264E5EBA0;
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 40);
      id v15 = [v12 saveFiles:v5 withManagedLevel:v11 toPath:v13 options:v10 progress:v14 completionHandler:&v16];
      objc_msgSend(*(id *)(a1 + 32), "setSaveOperation:", v15, v16, v17, v18, v19, v20);

      id v8 = v21;
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [a2 fileURL];
  uint64_t v8 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3;
  v10[3] = &unk_264E5E9A8;
  id v11 = v6;
  id v9 = v6;
  +[WFFileStorageServiceResult getResultWithFileURL:v7 consumingBundleID:v8 resultBlock:v10];
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [(id)objc_opt_class() serviceName];
    uint64_t v9 = *(void *)(a1 + 64);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_5;
    v10[3] = &unk_264E5EBA0;
    void v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    [v7 showWithServiceName:v8 input:v5 managedLevel:v9 options:0 completionHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] isRunning])
  {
    if (v6)
    {
      [a1[4] finishRunningWithError:v6];
    }
    else
    {
      id v7 = (void *)MEMORY[0x263F33708];
      uint64_t v8 = [a1[5] associatedAppDescriptor];
      uint64_t v9 = [v7 locationWithAppDescriptor:v8];
      unsigned int v10 = [a1[4] progress];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_8;
      v12[3] = &unk_264E5E9F8;
      v12[4] = a1[4];
      id v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);
    }
  }
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a2;
  if (!a2) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:v3];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] isRunning])
  {
    if (v6)
    {
      [a1[4] finishRunningWithError:v6];
    }
    else
    {
      id v7 = (void *)MEMORY[0x263F33708];
      uint64_t v8 = [a1[5] associatedAppDescriptor];
      uint64_t v9 = [v7 locationWithAppDescriptor:v8];
      unsigned int v10 = [a1[4] progress];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_6;
      v12[3] = &unk_264E5E9F8;
      v12[4] = a1[4];
      id v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);
    }
  }
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a2;
  if (!a2) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:v3];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

uint64_t __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    uint64_t v21 = 0;
    uint64_t v8 = [v6 attributionSet];
    char v9 = [v8 isEligibleToShareWithResultManagedLevel:&v21];

    if (v9)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
      aBlock[3] = &unk_264E5E938;
      aBlock[4] = self;
      id v10 = v6;
      id v19 = v10;
      id v20 = v7;
      uint64_t v11 = _Block_copy(aBlock);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_4;
      v16[3] = &unk_264E5E980;
      v16[4] = self;
      id v17 = v11;
      id v12 = v11;
      [v10 enumerateFileRepresentations:&__block_literal_global_54922 forType:0 completionHandler:v16];
    }
    else
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      id v14 = [(WFSaveDropboxFileAction *)self localizedName];
      id v15 = [v13 sharingMixedMDMContentErrorWithActionName:v14];
      [(WFSaveDropboxFileAction *)self finishRunningWithError:v15];
    }
  }
  else
  {
    [(WFSaveDropboxFileAction *)self finishRunningWithError:0];
  }
}

void __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke(id *a1)
{
  int v2 = [a1[4] showsFilePicker];
  id v3 = a1[4];
  if (v2)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v9[3] = &unk_264E5E910;
    v9[4] = v3;
    id v10 = a1[5];
    id v11 = a1[6];
    [v3 requestInterfacePresentationWithCompletionHandler:v9];
  }
  else
  {
    id v7 = [v3 parameterValueForKey:@"WFFileDestinationPath" ofClass:objc_opt_class()];
    if ([(__CFString *)v7 hasPrefix:@"/"])
    {
      id v4 = v7;
    }
    else
    {
      if (v7) {
        id v5 = v7;
      }
      else {
        id v5 = &stru_26F008428;
      }
      uint64_t v6 = [@"/" stringByAppendingString:v5];

      id v4 = (__CFString *)v6;
    }
    objc_msgSend(a1[4], "runWithRemoteUserInterface:path:input:storageService:", 0, v4);
  }
}

uint64_t __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if ([v4 representationType] == 1
    && ([v4 fileURL],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "wf_fileIsDirectory"),
        v6,
        v7))
  {
    id v8 = NSString;
    char v9 = WFLocalizedString(@"“%@” is a folder");
    id v10 = [v4 filename];
    id v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);

    id v12 = NSString;
    id v13 = WFLocalizedString(@"“%@” could not be saved because it is a folder or package. Consider zipping this file using Make Archive before saving.");
    id v14 = [v4 filename];
    id v15 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v14);

    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08438];
    uint64_t v18 = *MEMORY[0x263F08320];
    v21[0] = *MEMORY[0x263F08338];
    v21[1] = v18;
    v22[0] = v11;
    v22[1] = v15;
    id v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v20 = [v16 errorWithDomain:v17 code:21 userInfo:v19];

    v5[2](v5, v20);
  }
  else
  {
    v5[2](v5, 0);
  }
}

uint64_t __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  if (a2) {
    return [v3 runWithRemoteUserInterface:a2 path:0 input:a1[5] storageService:a1[6]];
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
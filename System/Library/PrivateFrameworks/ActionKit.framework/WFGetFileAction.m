@interface WFGetFileAction
- (BOOL)requiresRemoteExecution;
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
@end

@implementation WFGetFileAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFGetFileAction;
  return [(WFStorageServiceAction *)&v3 requiresRemoteExecution];
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFGetFileAction *)self parameterValueForKey:@"WFGetFilePath" ofClass:objc_opt_class()];
  if ([v8 hasPrefix:@"/"])
  {
    uint64_t v9 = [v8 substringFromIndex:1];

    v8 = (void *)v9;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
  v12[3] = &unk_264E56E50;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v6 getFileRepresentation:v12 forType:0];
}

void __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) parameterValueForKey:@"WFFileErrorIfNotFound" ofClass:objc_opt_class()];
    unsigned int v7 = [v6 BOOLValue];

    v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFGetFolderContents" ofClass:objc_opt_class()];
    int v9 = [v8 BOOLValue];

    if (v9) {
      uint64_t v10 = v7 | 0x10;
    }
    else {
      uint64_t v10 = v7;
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v13[3] = &unk_264E5EEE8;
    v13[4] = *(void *)(a1 + 32);
    [v11 retrieveFileAtPath:v12 fromDirectory:v5 options:v10 completionHandler:v13];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_7630);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v3 = [*(id *)(a1 + 32) output];
    [v3 addItems:v5];

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishRunningWithError:");
  }
}

id __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F337C8];
  objc_super v3 = (void *)MEMORY[0x263F337E8];
  id v4 = a2;
  id v5 = [v3 contentLocationForFile:v4];
  id v6 = [v2 itemWithFile:v4 origin:v5 disclosureLevel:1];

  return v6;
}

@end
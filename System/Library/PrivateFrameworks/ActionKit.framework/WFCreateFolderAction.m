@interface WFCreateFolderAction
- (BOOL)requiresRemoteExecution;
- (id)filenamePlaceholderText;
- (id)minimumSupportedClientVersion;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
@end

@implementation WFCreateFolderAction

- (id)minimumSupportedClientVersion
{
  v5.receiver = self;
  v5.super_class = (Class)WFCreateFolderAction;
  v2 = [(WFCreateFolderAction *)&v5 minimumSupportedClientVersion];
  v3 = WFMaximumBundleVersion();

  return v3;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v7 = NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a folder name in %3$@?");
  v12 = objc_msgSend(v7, "localizedStringWithFormat:", v11, v8, v10, v9);

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v7 = a3;
  v4 = [(WFCreateFolderAction *)self input];

  if (v4)
  {
    objc_super v5 = (void *)MEMORY[0x263F337E8];
    v6 = [(WFCreateFolderAction *)self input];
    [v5 getContentLocationFromFile:v6 completionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFCreateFolderAction;
  return [(WFStorageServiceAction *)&v3 requiresRemoteExecution];
}

- (id)filenamePlaceholderText
{
  v2 = [(WFStorageServiceAction *)self storageService];
  objc_super v3 = [v2 storageLocationPrefix];
  int v4 = [v3 hasSuffix:@"/"];

  if (v4) {
    objc_super v5 = @"Adventure/";
  }
  else {
    objc_super v5 = @"/Adventure/";
  }
  v6 = WFLocalizedString(v5);
  return v6;
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(WFStorageServiceAction *)self filePathKey];
  id v7 = [(WFCreateFolderAction *)self parameterValueForKey:v6 ofClass:objc_opt_class()];

  if (![v7 length])
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F70];
    v27[0] = *MEMORY[0x263F08338];
    id v10 = WFLocalizedString(@"No path specified");
    v28[0] = v10;
    v27[1] = *MEMORY[0x263F08320];
    v14 = WFLocalizedString(@"Please make sure to specify a path for the new folder in the Create Folder action.");
    v28[1] = v14;
    v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v22 = [v20 errorWithDomain:v21 code:4 userInfo:v17];
    [(WFCreateFolderAction *)self finishRunningWithError:v22];

    goto LABEL_10;
  }
  if (([v7 hasPrefix:@"/"] & 1) == 0)
  {
    uint64_t v8 = [NSString stringWithFormat:@"/%@", v7];

    id v7 = (void *)v8;
  }
  id v9 = [(WFCreateFolderAction *)self parameterValueForKey:@"WFFolder" ofClass:objc_opt_class()];
  id v10 = v9;
  if (!v9
    || ([v9 fileURL],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_msgSend(v11, "wf_fileIsDirectory"),
        v11,
        (v12 & 1) == 0))
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F70];
    v25[0] = *MEMORY[0x263F08338];
    v14 = WFLocalizedString(@"No folder specified!");
    v26[0] = v14;
    v25[1] = *MEMORY[0x263F08320];
    v17 = WFLocalizedString(@"You must specify where the folder should be created.");
    v26[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v19 = [v15 errorWithDomain:v16 code:4 userInfo:v18];
    [(WFCreateFolderAction *)self finishRunningWithError:v19];

LABEL_10:
    goto LABEL_11;
  }
  v13 = [v10 fileURL];
  v14 = objc_msgSend(v13, "wf_fileProviderItem");

  if (v14)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v24[3] = &unk_264E5D390;
    v24[4] = self;
    [v5 createFolderAtPath:v7 parentDirectoryItem:v14 completionHandler:v24];
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v23[3] = &unk_264E5D390;
    v23[4] = self;
    [v5 createFolderAtPath:v7 inDirectory:v10 completionHandler:v23];
  }
LABEL_11:
}

void __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 output];
    [v7 addFileWithOriginAttribution:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

void __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 output];
    [v7 addFileWithOriginAttribution:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

@end
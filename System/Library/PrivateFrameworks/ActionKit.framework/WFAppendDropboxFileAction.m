@interface WFAppendDropboxFileAction
- (BOOL)isProgressIndeterminate;
- (id)filenamePlaceholderText;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)storageService;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
@end

@implementation WFAppendDropboxFileAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to append %2$@ to a Dropbox file?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to append content to a Dropbox file?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)storageService
{
  v2 = objc_alloc_init(WFDropboxStorageService);
  return v2;
}

- (id)filenamePlaceholderText
{
  v2 = [(WFAppendDropboxFileAction *)self storageService];
  v3 = [v2 storageLocationPrefix];
  int v4 = [v3 hasSuffix:@"/"];

  if (v4) {
    v5 = @"example.txt";
  }
  else {
    v5 = @"/example.txt";
  }
  id v6 = WFLocalizedString(v5);
  return v6;
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFStorageServiceAction *)self filePathKey];
  v9 = [(WFAppendDropboxFileAction *)self parameterValueForKey:v8 ofClass:objc_opt_class()];

  if ([v9 length])
  {
    v10 = [(WFAppendDropboxFileAction *)self parameterValueForKey:@"WFAppendOnNewLine" ofClass:objc_opt_class()];
    int v11 = [v10 BOOLValue];

    uint64_t v12 = [(WFAppendDropboxFileAction *)self parameterValueForKey:@"WFAppendFileWriteMode" ofClass:objc_opt_class()];
    int v13 = [v12 isEqualToString:@"Prepend"];

    uint64_t v14 = 9;
    if (!v11) {
      uint64_t v14 = 1;
    }
    uint64_t v15 = 2;
    if (v13) {
      uint64_t v15 = 4;
    }
    uint64_t v16 = v15 | v14;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v23[3] = &unk_264E59CC8;
    v23[4] = self;
    id v24 = v7;
    id v25 = v9;
    uint64_t v26 = v16;
    [v6 getStringRepresentation:v23];
  }
  else
  {
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F870B8];
    v27[0] = *MEMORY[0x263F08338];
    v19 = WFLocalizedString(@"No File Path Provided");
    v28[0] = v19;
    v27[1] = *MEMORY[0x263F08320];
    v20 = WFLocalizedString(@"You must specify a filename or path in Append to File.");
    v28[1] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v22 = [v17 errorWithDomain:v18 code:5 userInfo:v21];
    [(WFAppendDropboxFileAction *)self finishRunningWithError:v22];
  }
}

void __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke(void *a1, __CFString *a2, uint64_t a3)
{
  if (a3)
  {
    int v4 = (void *)a1[4];
    objc_msgSend(v4, "finishRunningWithError:");
  }
  else
  {
    if (a2) {
      v5 = a2;
    }
    else {
      v5 = &stru_26F008428;
    }
    id v6 = (void *)a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v11[3] = &unk_264E5DB20;
    id v9 = v6;
    uint64_t v10 = a1[4];
    id v12 = v9;
    uint64_t v13 = v10;
    [v9 appendText:v5 toPath:v7 options:v8 completionHandler:v11];
  }
}

void __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F33708];
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 associatedAppDescriptor];
  uint64_t v7 = [v3 locationWithAppDescriptor:v6];
  uint64_t v8 = [*(id *)(a1 + 40) progress];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3;
  v10[3] = &unk_264E5E840;
  v10[4] = *(void *)(a1 + 40);
  WFContentCollectionFromStorageServiceResult(v5, v7, v9, v10);
}

void __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end
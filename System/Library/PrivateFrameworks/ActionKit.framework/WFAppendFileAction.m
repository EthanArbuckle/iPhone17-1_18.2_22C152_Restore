@interface WFAppendFileAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)requiresRemoteExecution;
- (id)contentDestinationWithError:(id *)a3;
- (id)filenamePlaceholderText;
- (id)minimumSupportedClientVersion;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
@end

@implementation WFAppendFileAction

- (id)minimumSupportedClientVersion
{
  v5.receiver = self;
  v5.super_class = (Class)WFAppendFileAction;
  v2 = [(WFAppendFileAction *)&v5 minimumSupportedClientVersion];
  v3 = WFMaximumBundleVersion();

  return v3;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [(WFAppendFileAction *)self parameterValueForKey:@"WFAppendFileWriteMode" ofClass:objc_opt_class()];
  int v10 = [v9 isEqualToString:@"Prepend"];

  v11 = NSString;
  if (v10) {
    v12 = @"Allow “%1$@” to prepend %2$@ to a text file?";
  }
  else {
    v12 = @"Allow “%1$@” to append %2$@ to a text file?";
  }
  v13 = WFLocalizedString(v12);
  v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v7, v8);

  return v14;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = [(WFAppendFileAction *)self parameterValueForKey:@"WFFile" ofClass:objc_opt_class()];
  v4 = [MEMORY[0x263F337E8] contentLocationForFile:v3];

  return v4;
}

- (id)filenamePlaceholderText
{
  v2 = [(WFStorageServiceAction *)self storageService];
  v3 = [v2 storageLocationPrefix];
  int v4 = [v3 hasSuffix:@"/"];

  if (v4) {
    objc_super v5 = @"example.txt";
  }
  else {
    objc_super v5 = @"/example.txt";
  }
  v6 = WFLocalizedString(v5);
  return v6;
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFAppendFileAction;
  return [(WFStorageServiceAction *)&v3 requiresRemoteExecution];
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFStorageServiceAction *)self filePathKey];
  v9 = [(WFAppendFileAction *)self parameterValueForKey:v8 ofClass:objc_opt_class()];

  int v10 = [(WFAppendFileAction *)self parameterValueForKey:@"WFFile" ofClass:objc_opt_class()];
  if ([v9 length])
  {
    v11 = [(WFAppendFileAction *)self parameterValueForKey:@"WFAppendOnNewLine" ofClass:objc_opt_class()];
    int v12 = [v11 BOOLValue];

    v13 = [(WFAppendFileAction *)self parameterValueForKey:@"WFAppendFileWriteMode" ofClass:objc_opt_class()];
    int v14 = [v13 isEqualToString:@"Prepend"];

    uint64_t v15 = 9;
    if (!v12) {
      uint64_t v15 = 1;
    }
    uint64_t v16 = 2;
    if (v14) {
      uint64_t v16 = 4;
    }
    uint64_t v17 = v16 | v15;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v24[3] = &unk_264E57CF8;
    v24[4] = self;
    id v25 = v7;
    id v26 = v10;
    id v27 = v9;
    uint64_t v28 = v17;
    [v6 getStringRepresentation:v24];
  }
  else
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F870B8];
    v29[0] = *MEMORY[0x263F08338];
    v20 = WFLocalizedString(@"No File Path Provided");
    v30[0] = v20;
    v29[1] = *MEMORY[0x263F08320];
    v21 = WFLocalizedString(@"You must specify a filename or path in Append to File.");
    v30[1] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    v23 = [v18 errorWithDomain:v19 code:5 userInfo:v22];
    [(WFAppendFileAction *)self finishRunningWithError:v23];
  }
}

void __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_super v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else
  {
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = &stru_26F008428;
    }
    id v8 = *(void **)(a1 + 40);
    v9 = [*(id *)(a1 + 48) fileURL];
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v12[3] = &unk_264E5D390;
    v12[4] = *(void *)(a1 + 32);
    [v8 appendText:v7 toDirectory:v9 subpath:v10 options:v11 completionHandler:v12];
  }
}

void __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v9 = v5;
  if (v5)
  {
    id v7 = [v6 output];
    [v7 addFileWithOriginAttribution:v9];

    id v6 = *(void **)(a1 + 32);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = a3;
  }
  [v6 finishRunningWithError:v8];
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
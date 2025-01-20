@interface WFOpenInAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)inputsMultipleItems;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSArray)contentClasses;
- (id)inputContentClasses;
- (id)selectedApp;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)openContentInSelectedApp:(id)a3;
- (void)openContentUsingDefaultApp:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
- (void)setContentClasses:(id)a3;
- (void)updateContentClasses;
@end

@implementation WFOpenInAction

+ (id)userInterfaceXPCInterface
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFOpenInAction;
  v2 = objc_msgSendSuper2(&v5, sel_userInterfaceXPCInterface);
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_showWithFile_contentManaged_completionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1850;
}

- (void).cxx_destruct
{
}

- (void)setContentClasses:(id)a3
{
}

- (NSArray)contentClasses
{
  return self->_contentClasses;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 length];
  v11 = NSString;
  if (v10)
  {
    v12 = WFLocalizedString(@"Allow “%1$@” to open “%2$@” with %3$@?");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v7);
  }
  else
  {
    v12 = WFLocalizedString(@"Allow “%1$@” to open “%2$@”?");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v15);
  v13 = };

  return v13;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFOpenInAction *)self input];
  id v6 = v4;
  WFGetContentLocationFromURLActionInput();
}

void __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) input];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_264E5E4B8;
    id v5 = *(id *)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    [v4 getFileRepresentations:v6 forType:0];
  }
}

void __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v19 = v5;
  if (!a3)
  {
    if ([v5 count])
    {
      id v7 = objc_msgSend(v19, "if_firstObjectPassingTest:", &__block_literal_global_550);

      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = [MEMORY[0x263F337E8] webpagesLocation];
LABEL_8:
        v11 = (void *)v9;
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, v9, 0);

        goto LABEL_14;
      }
      uint64_t v10 = objc_msgSend(v19, "if_firstObjectPassingTest:", &__block_literal_global_556);

      if (v10)
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = [MEMORY[0x263F337E8] javaScript];
        goto LABEL_8;
      }
      v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFOpenInAskWhenRun" ofClass:objc_opt_class()];
      int v13 = [v12 BOOLValue];

      if (v13)
      {
        v14 = [*(id *)(a1 + 32) selectedApp];

        if (v14)
        {
          uint64_t v15 = (void *)MEMORY[0x263F33708];
          uint64_t v16 = *(void *)(a1 + 40);
          v17 = [*(id *)(a1 + 32) selectedApp];
          v18 = [v15 locationWithAppDescriptor:v17];
          (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v18, 0);

          goto LABEL_14;
        }
      }
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_13;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_13:
  v6();
LABEL_14:
}

uint64_t __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 mappedDataWithError:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 data];
  }
  id v6 = v5;

  id v7 = objc_msgSend(NSString, "wf_stringWithData:", v6);
  uint64_t v8 = [v7 containsString:@"<script>"];

  return v8;
}

uint64_t __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 fileURL];
  v3 = [v2 pathExtension];
  uint64_t v4 = [v3 isEqualToString:@"webloc"];

  return v4;
}

- (id)selectedApp
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFOpenInAction *)self parameterValueForKey:@"WFSelectedApp" ofClass:v3];
}

- (id)inputContentClasses
{
  contentClasses = self->_contentClasses;
  if (!contentClasses)
  {
    [(WFOpenInAction *)self updateContentClasses];
    contentClasses = self->_contentClasses;
  }
  if ([(NSArray *)contentClasses count])
  {
    uint64_t v4 = self->_contentClasses;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFOpenInAction;
    uint64_t v4 = [(WFOpenInAction *)&v6 inputContentClasses];
  }
  return v4;
}

- (void)updateContentClasses
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WFOpenInAction *)self selectedApp];
  uint64_t v4 = [v3 documentTypes];
  id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_11292);

  if ([v5 count])
  {
    objc_super v6 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          int v13 = objc_msgSend(MEMORY[0x263F337D8], "sharedRegistry", (void)v18);
          uint64_t v14 = [v13 contentItemClassForType:v12];

          if (v14) {
            [v6 addObject:v14];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v6 array];
    contentClasses = self->_contentClasses;
    self->_contentClasses = v15;
  }
  else
  {
    v17 = self->_contentClasses;
    self->_contentClasses = 0;
  }
}

uint64_t __38__WFOpenInAction_updateContentClasses__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F852B8] typeWithString:a2];
}

- (BOOL)inputsMultipleItems
{
  return 0;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"WFSelectedApp"])
  {
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 value];

    uint64_t v12 = [v11 bundleIdentifier];
    [(WFOpenInAction *)self setSupplementalParameterValue:v12 forKey:@"WFOpenInAppIdentifier"];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFOpenInAction;
  BOOL v13 = [(WFOpenInAction *)&v15 setParameterState:v6 forKey:v7];
  if (v13) {
    [(WFOpenInAction *)self updateContentClasses];
  }

  return v13;
}

- (void)openContentUsingDefaultApp:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke;
  v8[3] = &unk_264E571E0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v5 getFileRepresentationAndAttributionSet:v8 forType:0];
}

void __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 fileURL];
    id v9 = [v8 path];

    if ([*(id *)(a1 + 40) fileExistsAtPath:v9])
    {
      id v10 = (void *)MEMORY[0x263F86820];
      uint64_t v11 = [v7 fileURL];
      uint64_t v12 = [v10 documentWithURL:v11];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke_2;
      v19[3] = &unk_264E571B8;
      id v13 = v7;
      uint64_t v14 = *(void *)(a1 + 32);
      id v20 = v13;
      uint64_t v21 = v14;
      [v12 openInDefaultAppWithCompletionHandler:v19];
    }
    else
    {
      objc_super v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F07F70];
      uint64_t v22 = *MEMORY[0x263F08068];
      v17 = [v7 fileURL];
      v23[0] = v17;
      long long v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v12 = [v15 errorWithDomain:v16 code:4 userInfo:v18];

      [*(id *)(a1 + 32) finishRunningWithError:v12];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

void __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke_2(uint64_t a1, char a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F08438];
    uint64_t v11 = *MEMORY[0x263F08320];
    id v6 = NSString;
    id v7 = WFLocalizedString(@"Could not open the file %1$@.");
    id v8 = [*(id *)(a1 + 32) filename];
    id v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v11);
    v12[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v3 = [v4 errorWithDomain:v5 code:79 userInfo:v10];
  }
  [*(id *)(a1 + 40) finishRunningWithError:v3];
}

- (void)openContentInSelectedApp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFOpenInAction *)self selectedApp];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__WFOpenInAction_openContentInSelectedApp___block_invoke;
  v8[3] = &unk_264E57190;
  v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v6 getFileRepresentationAndAttributionSet:v8 forType:0];
}

void __43__WFOpenInAction_openContentInSelectedApp___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if (a1[5])
    {
      id v10 = [a1[6] attributionSet];
      char v11 = [v10 isEligibleToShareWithResultManagedLevel:0];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x263F86820];
        id v13 = [v7 fileURL];
        uint64_t v14 = [v12 documentWithURL:v13 annotation:0];

        objc_super v15 = [a1[5] bundleIdentifier];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __43__WFOpenInAction_openContentInSelectedApp___block_invoke_2;
        v28[3] = &unk_264E5C978;
        id v29 = a1[5];
        id v16 = v7;
        id v17 = a1[4];
        id v30 = v16;
        id v31 = v17;
        [v14 openWithAppBundleIdentifier:v15 completionHandler:v28];
      }
      else
      {
        id v24 = a1[4];
        v25 = (void *)MEMORY[0x263F087E8];
        v26 = [v24 localizedName];
        v27 = [v25 sharingMixedMDMContentErrorWithActionName:v26];
        [v24 finishRunningWithError:v27];
      }
    }
    else
    {
      id v18 = a1[4];
      long long v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F870B8];
      uint64_t v32 = *MEMORY[0x263F08320];
      uint64_t v21 = WFLocalizedString(@"Open In… failed because it couldn’t find an app to open in.");
      v33[0] = v21;
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      uint64_t v23 = [v19 errorWithDomain:v20 code:5 userInfo:v22];
      [v18 finishRunningWithError:v23];
    }
  }
  else
  {
    [a1[4] finishRunningWithError:v9];
  }
}

void __43__WFOpenInAction_openContentInSelectedApp___block_invoke_2(id *a1, char a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F08438];
    uint64_t v12 = *MEMORY[0x263F08320];
    id v6 = NSString;
    id v7 = WFLocalizedString(@"%1$@ is not installed or could not open the file %2$@.");
    id v8 = [a1[4] localizedName];
    id v9 = [a1[5] filename];
    id v10 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v9);
    v13[0] = v10;
    char v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v3 = [v4 errorWithDomain:v5 code:79 userInfo:v11];
  }
  [a1[6] finishRunningWithError:v3];
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_264E57190;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 getFileRepresentationAndAttributionSet:v10 forType:0];
}

void __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v5 = [a2 fileURL];
    uint64_t v6 = *MEMORY[0x263F855A8];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_2;
    v9[3] = &unk_264E57168;
    id v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v11 = *(id *)(a1 + 48);
    +[WFFileStorageServiceResult getResultWithFileURL:v5 consumingBundleID:v6 resultBlock:v9];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    [v8 finishRunningWithError:a4];
  }
}

void __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v6 = [*(id *)(a1 + 40) attributionSet];
    char v7 = [v6 isEligibleToShareWithResultManagedLevel:&v14];

    if (v7)
    {
      id v8 = *(void **)(a1 + 48);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      void v13[2] = __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_3;
      v13[3] = &unk_264E5EBC8;
      v13[4] = *(void *)(a1 + 32);
      [v8 showWithFile:v5 contentManaged:v14 == 2 completionHandler:v13];
    }
    else
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = (void *)MEMORY[0x263F087E8];
      id v11 = [v9 localizedName];
      id v12 = [v10 sharingMixedMDMContentErrorWithActionName:v11];
      [v9 finishRunningWithError:v12];
    }
  }
}

uint64_t __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOpenInAction *)self parameterValueForKey:@"WFOpenInAskWhenRun" ofClass:objc_opt_class()];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)WFOpenInAction;
    [(WFOpenInAction *)&v8 runAsynchronouslyWithInput:v4];
  }
  else
  {
    char v7 = [(WFOpenInAction *)self parameterValueForKey:@"WFSelectedApp" ofClass:objc_opt_class()];
    if (v7) {
      [(WFOpenInAction *)self openContentInSelectedApp:v4];
    }
    else {
      [(WFOpenInAction *)self openContentUsingDefaultApp:v4];
    }
  }
}

@end
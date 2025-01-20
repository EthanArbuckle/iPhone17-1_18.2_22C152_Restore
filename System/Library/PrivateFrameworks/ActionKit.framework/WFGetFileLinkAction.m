@interface WFGetFileLinkAction
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
@end

@implementation WFGetFileLinkAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(WFGetFileLinkAction *)self input];
  uint64_t v10 = [v9 numberOfItems];

  v11 = NSString;
  if (v10 <= 1) {
    v12 = @"Allow “%1$@” to get a link to a file in “%2$@”?";
  }
  else {
    v12 = @"Allow “%1$@” to get links to files in “%2$@”?";
  }
  v13 = WFLocalizedString(v12);
  v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v7, v8);

  return v14;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFGetFileLinkAction *)self parameterValueForKey:@"WFUseShortURL" ofClass:objc_opt_class()];
  uint64_t v9 = [v8 BOOLValue];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__WFGetFileLinkAction_runAsynchronouslyWithInput_storageService___block_invoke;
  v11[3] = &unk_264E5DB20;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v10 getSharingURLsForFiles:v7 usePublicURLs:v9 completionHandler:v11];
}

void __65__WFGetFileLinkAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v17 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [*(id *)(a1 + 32) output];
        id v12 = (void *)MEMORY[0x263F337C8];
        v13 = (void *)MEMORY[0x263F33708];
        v14 = [*(id *)(a1 + 40) associatedAppDescriptor];
        v15 = [v13 locationWithAppDescriptor:v14];
        v16 = [v12 itemWithObject:v10 origin:v15 disclosureLevel:1];
        [v11 addItem:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v17];
}

@end
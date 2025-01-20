@interface WFSocialAction
+ (id)userInterfaceProtocol;
- (BOOL)convertsAnimatedImagesToVideo;
- (NSString)postPrefix;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)convertAnimatedImagesToVideoWithInput:(id)a3 completionHandler:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)showUIWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5;
@end

@implementation WFSocialAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to share %2$@ on %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to share content on %2$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x263F33708];
  v4 = [(WFSocialAction *)self appDescriptor];
  v5 = [v3 locationWithAppDescriptor:v4];

  return v5;
}

- (NSString)postPrefix
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(WFSocialAction *)self parameterValueForKey:@"WFSocialPostPrefix" ofClass:v3];
}

- (void)convertAnimatedImagesToVideoWithInput:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_4;
  v7[3] = &unk_264E5E0C0;
  id v8 = v5;
  id v6 = v5;
  [a3 transformItemsUsingBlock:&__block_literal_global_52782 completionHandler:v7];
}

uint64_t __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 preferredFileType];
  uint64_t v7 = *MEMORY[0x263F1DAD0];
  int v8 = [v6 conformsToUTType:*MEMORY[0x263F1DAD0]];

  if (v8)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    id v12 = v5;
    id v11 = v4;
    id v9 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", v7, v10, 3221225472, __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_2, &unk_264E5E098);
    [v11 getFileRepresentation:&v10 forType:v9];
  }
  else
  {
    (*((void (**)(id, id, void))v5 + 2))(v5, v4, 0);
  }
}

void __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mappedData];
  char IsAnimatedGIF = WFImageDataIsAnimatedGIF();

  if (IsAnimatedGIF)
  {
    id v8 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v6 = (id)WFGenerateVideoFromGIF();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = objc_msgSend(MEMORY[0x263F337C8], "itemWithFile:");
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v6;
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
  }
  id v6 = 0;
  id v8 = *(void **)(a1 + 32);
LABEL_6:
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
}

- (void)showUIWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke;
  v12[3] = &unk_264E5E050;
  BOOL v16 = a4;
  id v13 = v8;
  id v14 = v9;
  v15 = self;
  id v10 = v9;
  id v11 = v8;
  [(WFSocialAction *)self requestInterfacePresentationWithCompletionHandler:v12];
}

void __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2;
    v8[3] = &unk_264E5EEE8;
    v8[4] = *(void *)(a1 + 48);
    [a2 showWithArchivedItems:v3 isContentManaged:v2 extensionBundleIdentifier:v4 extensionPointIdentifier:@"com.apple.share-services" completionHandler:v8];
  }
  else
  {
    id v5 = *(void **)(a1 + 48);
    id v6 = [v5 input];
    v7.receiver = v5;
    v7.super_class = (Class)WFSocialAction;
    objc_msgSendSuper2(&v7, sel_runAsynchronouslyWithInput_, v6);
  }
}

void __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        id v12 = [*(id *)(a1 + 32) output];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFSocialAction *)self postPrefix];
  if ([v5 length] && objc_msgSend(v4, "numberOfItems") == 1)
  {
    id v6 = [v4 items];
    uint64_t v7 = [v6 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v9 = [v4 items];
      uint64_t v10 = [v9 firstObject];

      uint64_t v11 = (void *)MEMORY[0x263F337B0];
      id v12 = (void *)MEMORY[0x263F337C8];
      long long v13 = [(WFSocialAction *)self postPrefix];
      long long v14 = [v12 itemWithObject:v13];
      v19[0] = v14;
      v19[1] = v10;
      long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
      uint64_t v16 = [v11 collectionWithItems:v15];

      id v4 = (id)v16;
    }
  }
  else
  {
  }
  if ([(WFSocialAction *)self convertsAnimatedImagesToVideo])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __45__WFSocialAction_runAsynchronouslyWithInput___block_invoke;
    v18[3] = &unk_264E5E020;
    v18[4] = self;
    [(WFSocialAction *)self convertAnimatedImagesToVideoWithInput:v4 completionHandler:v18];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WFSocialAction;
    [(WFSocialAction *)&v17 runAsynchronouslyWithInput:v4];
  }
}

id __45__WFSocialAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)WFSocialAction;
  return objc_msgSendSuper2(&v3, sel_runAsynchronouslyWithInput_, a2);
}

- (BOOL)convertsAnimatedImagesToVideo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFSocialAction *)self definition];
  objc_super v3 = [v2 objectForKey:@"ConvertsAnimatedImagesToVideo"];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315906;
      id v12 = "WFEnforceClass";
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      id v8 = v16;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v11, 0x2Au);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  char v9 = [v6 BOOLValue];
  return v9;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2D08;
}

@end
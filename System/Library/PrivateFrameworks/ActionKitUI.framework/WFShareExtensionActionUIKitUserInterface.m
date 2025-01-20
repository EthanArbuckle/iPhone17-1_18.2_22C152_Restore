@interface WFShareExtensionActionUIKitUserInterface
- (id)completionHandler;
- (id)contentItemClassesFromInputConfiguration:(id)a3;
- (id)inputContentItemClassesFromInputConfiguration:(id)a3;
- (void)addContentToShareController:(id)a3 withInput:(id)a4 inputConfiguration:(id)a5 extensionUserInfo:(id)a6 completionHandler:(id)a7;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithContentCollection:(id)a3 error:(id)a4;
- (void)performActionWithInput:(id)a3 inputConfiguration:(id)a4 socialServiceType:(id)a5 extensionBundleIdentifier:(id)a6 extensionUserInfo:(id)a7 completionHandler:(id)a8;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WFShareExtensionActionUIKitUserInterface

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__WFShareExtensionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFShareExtensionActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __84__WFShareExtensionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithContentCollection:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithContentCollection:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(WFShareExtensionActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFShareExtensionActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFShareExtensionActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (id)inputContentItemClassesFromInputConfiguration:(id)a3
{
  v3 = [a3 objectForKey:*MEMORY[0x263F232D0]];
  id v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_481);

  return v4;
}

Class __90__WFShareExtensionActionUIKitUserInterface_inputContentItemClassesFromInputConfiguration___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (id)contentItemClassesFromInputConfiguration:(id)a3
{
  v3 = [a3 objectForKey:*MEMORY[0x263F232C8]];
  id v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_4435);

  return v4;
}

Class __85__WFShareExtensionActionUIKitUserInterface_contentItemClassesFromInputConfiguration___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (void)addContentToShareController:(id)a3 withInput:(id)a4 inputConfiguration:(id)a5 extensionUserInfo:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = *MEMORY[0x263F232E0];
  id v17 = a4;
  v18 = [v13 objectForKey:v16];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke;
  aBlock[3] = &unk_264900A80;
  id v19 = v18;
  id v30 = v19;
  v31 = self;
  id v20 = v13;
  id v32 = v20;
  id v21 = v15;
  id v35 = v21;
  id v22 = v12;
  id v33 = v22;
  id v23 = v14;
  id v34 = v23;
  v24 = _Block_copy(aBlock);
  v25 = [(WFShareExtensionActionUIKitUserInterface *)self contentItemClassesFromInputConfiguration:v20];
  if ([v25 count])
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_6;
    v26[3] = &unk_264900AA8;
    id v27 = v21;
    id v28 = v24;
    [v17 generateCollectionByCoercingToItemClasses:v25 completionHandler:v26];

    id v17 = v27;
  }
  else
  {
    (*((void (**)(void *, id))v24 + 2))(v24, v17);
  }
}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F232E8]])
  {
    id v4 = [*(id *)(a1 + 40) inputContentItemClassesFromInputConfiguration:*(void *)(a1 + 48)];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_2;
    v25[3] = &unk_264900A08;
    id v27 = *(id *)(a1 + 72);
    id v26 = *(id *)(a1 + 56);
    [v3 generateCollectionByCoercingToItemClasses:v4 completionHandler:v25];

LABEL_16:
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F232D8]])
  {
    id v4 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F23308]];
    char v5 = [v4 isEqualToString:*MEMORY[0x263F232F0]];
    id v6 = (void *)MEMORY[0x263F232F8];
    if (v5) {
      char v7 = 1;
    }
    else {
      char v7 = [v4 isEqualToString:*MEMORY[0x263F232F8]];
    }
    if ([v4 isEqualToString:*MEMORY[0x263F23300]]) {
      char v8 = 1;
    }
    else {
      char v8 = [v4 isEqualToString:*v6];
    }
    id v9 = objc_opt_new();
    v10 = [v3 items];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_4;
    v21[3] = &unk_264900A30;
    char v23 = v7;
    id v11 = v9;
    id v22 = v11;
    char v24 = v8;
    id v12 = objc_msgSend(v10, "if_compactMap:", v21);

    id v13 = objc_opt_new();
    id v14 = [MEMORY[0x263F086E0] mainBundle];
    id v15 = [v14 bundleIdentifier];
    [v13 setObject:v15 forKey:*MEMORY[0x263F33A90]];

    [v13 setObject:v12 forKey:*MEMORY[0x263F07FE8]];
    [v13 addEntriesFromDictionary:*(void *)(a1 + 64)];
    uint64_t v16 = objc_opt_new();
    [v16 setUserInfo:v13];
    if ([v11 count])
    {
      id v17 = [v11 componentsJoinedByString:@"\n"];
      v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v17];
      [v16 setAttributedContentText:v18];
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 56) addExtensionItem:v16];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_5;
    block[3] = &unk_264900A58;
    id v20 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x263EF83A0], block);

    goto LABEL_16;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_17:
}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v6 = a4;
  if ([v7 numberOfItems]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_3;
    v8[3] = &unk_2649009E0;
    id v10 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    [v6 getShareableObjectsOfTypes:15 options:1 completionHandler:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = *(void **)(a1 + 32);
    char v5 = [v3 string];
    [v4 addObject:v5];
  }
  if (!*(unsigned char *)(a1 + 41))
  {
    id v6 = 0;
  }
  else
  {
LABEL_5:
    id v6 = [v3 minimalItemProvider];
  }

  return v6;
}

uint64_t __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    id v31 = v7;
    id v32 = v6;
    id v33 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    uint64_t v10 = a1;
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v36;
      unint64_t v13 = 0x263EFF000uLL;
      unint64_t v14 = 0x263F08000uLL;
      do
      {
        uint64_t v15 = 0;
        uint64_t v34 = v11;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [*(id *)(v10 + 32) addURL:v16];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v33 addObject:v16];
            }
            else
            {
              uint64_t v17 = v12;
              uint64_t v18 = v10;
              unint64_t v19 = v13;
              id v20 = v8;
              unint64_t v21 = v14;
              id v22 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
              char v23 = [MEMORY[0x263F33910] typeWithClassName:@"UIImage" frameworkName:@"UIKit" location:2];
              int v24 = [v22 conformsToType:v23];

              if (v24)
              {
                uint64_t v10 = v18;
                [*(id *)(v18 + 32) addImage:v16];
                unint64_t v14 = v21;
                id v8 = v20;
                unint64_t v13 = v19;
                uint64_t v12 = v17;
                uint64_t v11 = v34;
              }
              else
              {
                objc_opt_class();
                unint64_t v14 = v21;
                id v8 = v20;
                unint64_t v13 = v19;
                uint64_t v10 = v18;
                uint64_t v12 = v17;
                uint64_t v11 = v34;
                if (objc_opt_isKindOfClass())
                {
                  objc_setAssociatedObject(*(id *)(v18 + 32), v16, v16, (void *)1);
                  v25 = *(void **)(v18 + 32);
                  id v26 = [v16 fileURL];
                  id v27 = v25;
                  uint64_t v10 = v18;
                  [v27 addURL:v26];
                }
              }
            }
          }
          ++v15;
        }
        while (v11 != v15);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v11);
    }

    uint64_t v28 = v10;
    v29 = *(void **)(v10 + 32);
    id v30 = [v33 componentsJoinedByString:@"\n"];
    [v29 setInitialText:v30];

    (*(void (**)(void))(*(void *)(v28 + 40) + 16))();
    id v7 = v31;
    id v6 = v32;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)performActionWithInput:(id)a3 inputConfiguration:(id)a4 socialServiceType:(id)a5 extensionBundleIdentifier:(id)a6 extensionUserInfo:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  [(WFShareExtensionActionUIKitUserInterface *)self setCompletionHandler:a8];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke;
  v24[3] = &unk_2649009B8;
  id v25 = v16;
  id v26 = v17;
  id v27 = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v18;
  id v19 = v18;
  id v20 = v15;
  id v21 = v14;
  id v22 = v17;
  id v23 = v16;
  dispatch_async(MEMORY[0x263EF83A0], v24);
}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) length]
    || ([getSLComposeViewControllerClass_4457() composeViewControllerForServiceType:*(void *)(a1 + 32)], (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (getSLComposeViewControllerClass_4457(), (objc_opt_respondsToSelector() & 1) != 0))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v15 = 0;
      id v4 = [MEMORY[0x263F08800] extensionWithIdentifier:v3 error:&v15];
      id v5 = v15;
      if (!v4)
      {
        [*(id *)(a1 + 48) finishWithContentCollection:0 error:v5];
        goto LABEL_9;
      }
      v2 = [getSLComposeViewControllerClass_4457() composeViewControllerForExtension:v4];
    }
    else
    {
      v2 = 0;
    }
  }
  id v6 = (void *)MEMORY[0x263F08928];
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_2;
  v10[3] = &unk_264900990;
  v10[4] = *(void *)(a1 + 48);
  id v11 = v2;
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 32);
  id v5 = v2;
  id v9 = (id)objc_msgSend(v6, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v7, v8, v10);

LABEL_9:
}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_3;
  v8[3] = &unk_264900968;
  objc_copyWeak(&v11, &location);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 64);
  [v4 addContentToShareController:v5 withInput:v3 inputConfiguration:v6 extensionUserInfo:v7 completionHandler:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_3(id *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v10 = WeakRetained;
  if (a2)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_4;
    v15[3] = &unk_264900918;
    v15[4] = WeakRetained;
    id v16 = v7;
    [a1[4] setCompletionHandler:v15];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_5;
    block[3] = &unk_264900940;
    id v12 = a1[5];
    id v13 = a1[4];
    id v14 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [WeakRetained finishWithContentCollection:0 error:v8];
  }
}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 finishWithContentCollection:0 error:0];
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] userCancelledError];
    [v5 finishWithContentCollection:0 error:v6];
  }
}

uint64_t __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.social.twitter"]) {
    [*(id *)(a1 + 40) setModalPresentationStyle:1];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  return [v2 presentContent:v3];
}

@end
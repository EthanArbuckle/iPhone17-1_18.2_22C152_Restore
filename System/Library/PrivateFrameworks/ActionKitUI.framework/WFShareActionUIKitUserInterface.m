@interface WFShareActionUIKitUserInterface
- (id)completionHandler;
- (id)excludedActivityTypes;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithExtensionItems:(id)a3 error:(id)a4;
- (void)presentActivityViewControllerForItems:(id)a3 isContentManaged:(BOOL)a4;
- (void)presentExtensionViewControllerForItems:(id)a3 extensionBundleIdentifier:(id)a4 extensionPointIdentifier:(id)a5 isContentManaged:(BOOL)a6;
- (void)presentItems:(id)a3 extensionBundleIdentifier:(id)a4 extensionPointIdentifier:(id)a5 isContentManaged:(BOOL)a6;
- (void)prewarmInput:(id)a3 completion:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)showWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5 extensionPointIdentifier:(id)a6 completionHandler:(id)a7;
@end

@implementation WFShareActionUIKitUserInterface

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

- (id)excludedActivityTypes
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)prewarmInput:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v15 = a4;
  v6 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [v5 items];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        dispatch_group_enter(v6);
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke;
        v19[3] = &unk_264900E20;
        v20 = v6;
        [v12 prepareForPresentationWithCompletionHandler:v19];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke_2;
  block[3] = &unk_264900EB0;
  id v17 = v5;
  id v18 = v15;
  id v13 = v5;
  id v14 = v15;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);
}

void __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke(uint64_t a1)
{
}

void __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) items];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__WFShareActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFShareActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __75__WFShareActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithExtensionItems:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithExtensionItems:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(WFShareActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFShareActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFShareActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5 extensionPointIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_6:
    long long v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFShareActionUIKitUserInterface.m", 332, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
LABEL_7:
    long long v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFShareActionUIKitUserInterface.m", 333, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  long long v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFShareActionUIKitUserInterface.m", 331, @"Invalid parameter not satisfying: %@", @"archivedItems" object file lineNumber description];

  if (!v15) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v16) {
    goto LABEL_7;
  }
LABEL_4:
  [(WFShareActionUIKitUserInterface *)self setCompletionHandler:v16];
  id v17 = (void *)MEMORY[0x263F08928];
  id v18 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_264900580;
  v25[4] = self;
  id v26 = v14;
  id v27 = v15;
  BOOL v28 = a4;
  id v19 = v15;
  id v20 = v14;
  id v21 = (id)objc_msgSend(v17, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v13, v18, v25);
}

void __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke_2;
    v6[3] = &unk_264900558;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    char v9 = *(unsigned char *)(a1 + 56);
    [v4 prewarmInput:a2 completion:v6];
  }
  else
  {
    id v5 = getWFActionsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[WFShareActionUIKitUserInterface showWithArchivedItems:isContentManaged:extensionBundleIdentifier:extension"
            "PointIdentifier:completionHandler:]_block_invoke";
      _os_log_impl(&dword_22BEF1000, v5, OS_LOG_TYPE_FAULT, "%s Could not unarchive input items.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) cancelPresentationWithCompletionHandler:&__block_literal_global_223];
  }
}

uint64_t __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentItems:a2 extensionBundleIdentifier:*(void *)(a1 + 40) extensionPointIdentifier:*(void *)(a1 + 48) isContentManaged:*(unsigned __int8 *)(a1 + 56)];
}

- (void)presentItems:(id)a3 extensionBundleIdentifier:(id)a4 extensionPointIdentifier:(id)a5 isContentManaged:(BOOL)a6
{
  if (a4) {
    [(WFShareActionUIKitUserInterface *)self presentExtensionViewControllerForItems:a3 extensionBundleIdentifier:a4 extensionPointIdentifier:a5 isContentManaged:a6];
  }
  else {
    -[WFShareActionUIKitUserInterface presentActivityViewControllerForItems:isContentManaged:](self, "presentActivityViewControllerForItems:isContentManaged:", a3, a6, a5);
  }
}

- (void)presentActivityViewControllerForItems:(id)a3 isContentManaged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x263F6BC98];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithActivityItems:v7 applicationActivities:0];

  char v9 = [(WFShareActionUIKitUserInterface *)self excludedActivityTypes];
  [v8 setExcludedActivityTypes:v9];

  [v8 setIsContentManaged:v4];
  [v8 setAllowsCustomPresentationStyle:1];
  [v8 setModalPresentationStyle:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke;
  v13[3] = &unk_264900530;
  v13[4] = self;
  [v8 setCompletionWithItemsHandler:v13];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke_2;
  block[3] = &unk_264900E88;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = *(void **)(a1 + 32);
  if (a5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a5;
  }
  else
  {
    uint64_t v6 = a4;
    uint64_t v7 = 0;
  }
  return [v5 finishWithExtensionItems:v6 error:v7];
}

uint64_t __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentContent:*(void *)(a1 + 40)];
}

- (void)presentExtensionViewControllerForItems:(id)a3 extensionBundleIdentifier:(id)a4 extensionPointIdentifier:(id)a5 isContentManaged:(BOOL)a6
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v62 = a5;
  v60 = v9;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v43 = v10;
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"WFShareActionUIKitUserInterface.m", 233, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

    id v10 = v43;
    if (v43) {
      goto LABEL_3;
    }
  }
  id v45 = v10;
  v46 = [MEMORY[0x263F08690] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"WFShareActionUIKitUserInterface.m", 234, @"Invalid parameter not satisfying: %@", @"extensionBundleIdentifier" object file lineNumber description];

  id v10 = v45;
LABEL_3:
  if (!v62)
  {
    id v47 = v10;
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"WFShareActionUIKitUserInterface.m", 235, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier" object file lineNumber description];

    id v10 = v47;
  }
  id v75 = 0;
  v56 = v10;
  v61 = [MEMORY[0x263F08800] extensionWithIdentifier:v10 error:&v75];
  id v57 = v75;
  if (!v61)
  {
    id v26 = getWFActionsLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFShareActionUIKitUserInterface presentExtensionViewControllerForItems:extensionBundleIdent"
                           "ifier:extensionPointIdentifier:isContentManaged:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v56;
      *(_WORD *)&buf[22] = 2114;
      v93 = v57;
      _os_log_impl(&dword_22BEF1000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create NSExtrension for %{public}@: %{public}@", buf, 0x20u);
    }

    [(WFShareActionUIKitUserInterface *)self finishWithExtensionItems:0 error:v57];
    goto LABEL_43;
  }
  objc_initWeak(&location, self);
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__2875;
  v72[4] = __Block_byref_object_dispose__2876;
  id v73 = v9;
  id v11 = v73;
  if (!v9)
  {
    v49 = [MEMORY[0x263F08690] currentHandler];
    v50 = [NSString stringWithUTF8String:"NSArray * _Nonnull WFActivityItemValuesFromContentItems(NSArray<WFContentItem *> * _Nonnull __strong)"];
    [v49 handleFailureInFunction:v50, @"WFShareActionUIKitUserInterface.m", 77, @"Invalid parameter not satisfying: %@", @"contentItems" file lineNumber description];
  }
  id v12 = objc_alloc(MEMORY[0x263F6BC98]);
  id v13 = (void *)[v12 initWithActivityItems:MEMORY[0x263EFFA68] applicationActivities:0];
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __WFActivityItemValuesFromContentItems_block_invoke;
  v93 = &unk_2649005A8;
  id v94 = v13;
  id v14 = v13;
  id v15 = objc_msgSend(v11, "if_compactMap:", buf);

  id v16 = v15;
  id v59 = v62;
  v63 = v16;
  if (!v16)
  {
    v51 = [MEMORY[0x263F08690] currentHandler];
    v52 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<NSExtensionItem *> * _Nonnull WFExtensionItemsForActivityItemValues(NSArray * _Nonnull __strong, NSString * _Nonnull __strong, BOOL)");
    [v51 handleFailureInFunction:v52, @"WFShareActionUIKitUserInterface.m", 89, @"Invalid parameter not satisfying: %@", @"activityItemValues" file lineNumber description];

    if (v62) {
      goto LABEL_10;
    }
LABEL_47:
    v53 = [MEMORY[0x263F08690] currentHandler];
    v54 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<NSExtensionItem *> * _Nonnull WFExtensionItemsForActivityItemValues(NSArray * _Nonnull __strong, NSString * _Nonnull __strong, BOOL)");
    [v53 handleFailureInFunction:v54, @"WFShareActionUIKitUserInterface.m", 90, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier" file lineNumber description];

    goto LABEL_10;
  }
  if (!v62) {
    goto LABEL_47;
  }
LABEL_10:
  if ([v59 isEqualToString:*MEMORY[0x263F23310]])
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v17 = v63;
    id v18 = 0;
    uint64_t v19 = [v17 countByEnumeratingWithState:&v82 objects:buf count:16];
    if (!v19) {
      goto LABEL_25;
    }
    uint64_t v20 = *(void *)v83;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v83 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v82 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        if (v18)
        {
          long long v24 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
          [v18 appendAttributedString:v24];

          if (isKindOfClass) {
            goto LABEL_20;
          }
        }
        else
        {
          id v18 = objc_alloc_init(MEMORY[0x263F089B8]);
          if (isKindOfClass)
          {
LABEL_20:
            v25 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v22];
            [v18 appendAttributedString:v25];

            continue;
          }
        }
        [v18 appendAttributedString:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v82 objects:buf count:16];
      if (!v19)
      {
LABEL_25:

        goto LABEL_30;
      }
    }
  }
  id v18 = 0;
LABEL_30:
  id v27 = _NSExtensionItemsFromActivityItemValues();
  BOOL v28 = v27;
  if (v18)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v29 = v27;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v79;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v79 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          if (([v63 containsObject:v33] & 1) == 0)
          {
            [v33 setAttributedContentText:v18];
            BOOL v28 = v29;
            goto LABEL_41;
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v78 objects:v91 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    id v34 = objc_alloc_init(MEMORY[0x263F08810]);
    [v34 setAttributedContentText:v18];
    BOOL v28 = [v29 arrayByAddingObject:v34];

    id v29 = v34;
LABEL_41:
  }
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __WFExtensionItemsForActivityItemValues_block_invoke;
  v76[3] = &__block_descriptor_33_e32_v32__0__NSExtensionItem_8Q16_B24l;
  BOOL v77 = a6;
  [v28 enumerateObjectsUsingBlock:v76];

  uint64_t v35 = *MEMORY[0x263F07FF8];
  id v88 = v59;
  v89[0] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
  v89[1] = @"NSExtensionActivationRule";
  v90[0] = v36;
  v86 = @"extensionItems";
  v37 = objc_msgSend(v28, "if_compactMap:", &__block_literal_global_2880);
  v87 = v37;
  v38 = [NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
  v90[1] = v38;
  v39 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];

  v40 = (void *)MEMORY[0x263F08800];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2;
  v64[3] = &unk_264900508;
  v70 = v72;
  objc_copyWeak(&v71, &location);
  id v41 = v39;
  id v65 = v41;
  id v66 = v61;
  v67 = self;
  id v42 = v28;
  id v68 = v42;
  id v69 = v59;
  [v40 extensionsWithMatchingAttributes:v41 completion:v64];

  objc_destroyWeak(&v71);
  _Block_object_dispose(v72, 8);

  objc_destroyWeak(&location);
LABEL_43:
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  v85[3] = __Block_byref_object_copy__2875;
  v85[4] = __Block_byref_object_dispose__2876;
  id v86 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3;
  aBlock[3] = &unk_264900468;
  aBlock[4] = *(void *)(a1 + 72);
  aBlock[5] = v85;
  uint64_t v7 = (id *)(a1 + 80);
  objc_copyWeak(&v84, (id *)(a1 + 80));
  id v8 = _Block_copy(aBlock);
  if (v5)
  {
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_205;
    v81[3] = &unk_264900490;
    id v82 = *(id *)(a1 + 40);
    id v9 = objc_msgSend(v5, "if_firstObjectPassingTest:", v81);
    BOOL v10 = v9 == 0;

    if (v10)
    {
      v36 = *(void **)(a1 + 48);
      v37 = WFLocalizedString(@"Input Not Supported");
      v38 = WFLocalizedString(@"Selected app does not support the provided input.");
      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08320];
      *(void *)&long long v104 = *MEMORY[0x263F08338];
      *((void *)&v104 + 1) = v40;
      *(void *)buf = v37;
      *(void *)&buf[8] = v38;
      id v41 = [NSDictionary dictionaryWithObjects:buf forKeys:&v104 count:2];
      id v42 = [v39 errorWithDomain:@"WFShareActionUIKitUserInterfaceErrorDomain" code:0 userInfo:v41];

      [v36 finishWithExtensionItems:0 error:v42];
LABEL_39:

      goto LABEL_40;
    }
    id v11 = *(void **)(a1 + 40);
    id v13 = *(void **)(a1 + 56);
    id v12 = *(void **)(a1 + 64);
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    BOOL v77 = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2_207;
    long long v78 = &unk_2649004E0;
    long long v79 = v85;
    objc_copyWeak(&v80, v7);
    id v14 = v11;
    id v15 = v13;
    id v75 = v12;
    id v74 = v8;
    id v73 = v76;
    if (!v14)
    {
      id v54 = v15;
      v55 = [MEMORY[0x263F08690] currentHandler];
      v56 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      [v55 handleFailureInFunction:v56, @"WFShareActionUIKitUserInterface.m", 220, @"Invalid parameter not satisfying: %@", @"extension" file lineNumber description];

      id v15 = v54;
    }
    v72 = v15;
    if (!v15)
    {
      id v57 = [MEMORY[0x263F08690] currentHandler];
      v58 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      [v57 handleFailureInFunction:v58, @"WFShareActionUIKitUserInterface.m", 221, @"Invalid parameter not satisfying: %@", @"extensionItems" file lineNumber description];
    }
    if (!v75)
    {
      id v59 = [MEMORY[0x263F08690] currentHandler];
      v60 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      [v59 handleFailureInFunction:v60, @"WFShareActionUIKitUserInterface.m", 222, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier" file lineNumber description];
    }
    if (!v74)
    {
      v61 = [MEMORY[0x263F08690] currentHandler];
      id v62 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      [v61 handleFailureInFunction:v62, @"WFShareActionUIKitUserInterface.m", 223, @"Invalid parameter not satisfying: %@", @"presentationCompletionBlock" file lineNumber description];
    }
    if (![v75 isEqualToString:*MEMORY[0x263F23310]])
    {
      id v43 = v14;
      id v44 = v72;
      id v45 = v74;
      v46 = v73;
      v96[0] = 0;
      v96[1] = v96;
      v96[2] = 0x2020000000;
      char v97 = 0;
      *(void *)&long long v104 = MEMORY[0x263EF8330];
      *((void *)&v104 + 1) = 3221225472;
      *(void *)&long long v105 = __WFConfiguredViewControllerForActionExtension_block_invoke;
      *((void *)&v105 + 1) = &unk_264900630;
      *((void *)&v106 + 1) = v96;
      id v47 = v45;
      *(void *)&long long v106 = v47;
      [v43 setRequestCompletionBlock:&v104];
      uint64_t v90 = MEMORY[0x263EF8330];
      uint64_t v91 = 3221225472;
      v92 = __WFConfiguredViewControllerForActionExtension_block_invoke_2;
      v93 = &unk_264900658;
      uint64_t v95 = v96;
      v48 = (void (**)(id, void, void *))v47;
      id v94 = v48;
      [v43 setRequestCancellationBlock:&v90];
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __WFConfiguredViewControllerForActionExtension_block_invoke_3;
      v87[3] = &unk_264900680;
      v89 = v96;
      v49 = v48;
      id v88 = v49;
      [v43 setRequestInterruptionBlock:v87];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __WFConfiguredViewControllerForActionExtension_block_invoke_4;
      v99 = &unk_2649006A8;
      v103 = v96;
      v50 = v49;
      id v101 = v50;
      id v51 = v43;
      id v100 = v51;
      v52 = v46;
      id v102 = v52;
      [v51 instantiateViewControllerWithInputItems:v44 connectionHandler:buf];

      _Block_object_dispose(v96, 8);
LABEL_38:

      objc_destroyWeak(&v80);
      goto LABEL_39;
    }
    id v16 = v14;
    id v70 = v72;
    id v71 = (void (**)(id, void, void *))v74;
    id v69 = v73;
    if (([getSLComposeViewControllerClass() isAvailableForExtension:v16] & 1) == 0)
    {
      id v17 = WFExtensionCommunicationError(0);
      v71[2](v71, 0, v17);
LABEL_37:

      goto LABEL_38;
    }
    id v17 = [getSLComposeViewControllerClass() composeViewControllerForExtension:v16];
    if (!v17)
    {
      WFExtensionCommunicationError(0);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v71[2](v71, 0, v33);
      goto LABEL_36;
    }
    uint64_t v90 = MEMORY[0x263EF8330];
    uint64_t v91 = 3221225472;
    v92 = __WFConfiguredViewControllerForShareExtension_block_invoke;
    v93 = &unk_2649005F0;
    id v94 = v71;
    [v17 setCompletionHandler:&v90];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v18 = v70;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v104 objects:buf count:16];
    id v65 = v16;
    id v20 = v14;
    if (v19)
    {
      uint64_t v21 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v105 != v21) {
            objc_enumerationMutation(v18);
          }
          [v17 addExtensionItem:*(void *)(*((void *)&v104 + 1) + 8 * i)];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v104 objects:buf count:16];
      }
      while (v19);
    }

    id v16 = v65;
    id v14 = v20;
    long long v23 = [v65 infoDictionary];
    long long v24 = [v23 objectForKeyedSubscript:@"NSExtension"];

    id v25 = objc_alloc(MEMORY[0x263F01858]);
    id v26 = [v65 identifier];
    id v68 = (void *)[v25 initWithBundleIdentifier:v26 error:0];

    uint64_t v27 = [v68 SDKVersion];
    BOOL v28 = (void *)v27;
    id v29 = @"1.0";
    if (v27) {
      id v29 = (__CFString *)v27;
    }
    id v66 = v29;

    v67 = [v24 objectForKeyedSubscript:@"NSExtensionActionWantsFullScreenPresentation"];
    if (([v67 BOOLValue] & 1) == 0)
    {
      v64 = [v24 objectForKeyedSubscript:@"NSExtensionAttributes"];
      uint64_t v30 = [v64 objectForKeyedSubscript:@"NSExtensionActionWantsFullScreenPresentation"];
      if (![v30 BOOLValue])
      {
        v53 = [MEMORY[0x263F01880] defaultWorkspace];
        char v63 = [v53 isVersion:v66 greaterThanOrEqualToVersion:@"13.0"];

        if (v63)
        {
          uint64_t v31 = 0;
          uint64_t v32 = -2;
          goto LABEL_28;
        }
LABEL_27:
        uint64_t v31 = 1;
        uint64_t v32 = 5;
LABEL_28:
        [v17 setModalPresentationStyle:v32];
        [v17 setShouldForceNonAnimatedTransition:v31];
        v77((uint64_t)v69, v17);

        id v33 = v94;
LABEL_36:

        goto LABEL_37;
      }
    }
    goto LABEL_27;
  }
  id v34 = getWFActionsLogObject();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[WFShareActionUIKitUserInterface presentExtensionViewControllerForItems:extensionBundleIdentif"
                         "ier:extensionPointIdentifier:isContentManaged:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2114;
    v99 = v6;
    _os_log_impl(&dword_22BEF1000, v34, OS_LOG_TYPE_ERROR, "%s Failed to find matching extensions for attributes %@: %{public}@", buf, 0x20u);
  }

  (*((void (**)(void *, void, id))v8 + 2))(v8, 0, v6);
LABEL_40:

  objc_destroyWeak(&v84);
  _Block_object_dispose(v85, 8);
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_4;
  block[3] = &unk_264900440;
  long long v12 = *(_OWORD *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v13);
}

uint64_t __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_205(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  BOOL v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2_207(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3_208;
  v3[3] = &unk_2649004B8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3_208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentContent:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_5;
    v8[3] = &unk_264900418;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v4 dismissViewControllerAnimated:1 completion:v8];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    objc_destroyWeak(&v11);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained finishWithExtensionItems:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained finishWithExtensionItems:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

uint64_t __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _matchingDictionaryRepresentation];
}

@end
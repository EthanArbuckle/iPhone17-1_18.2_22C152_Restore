@interface WFQuickLookActionUIKitUserInterface
- (BOOL)previewController:(id)a3 canShareItem:(id)a4;
- (NSError)exitError;
- (QLPreviewController)previewController;
- (WFContentCollection)dataSource;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)previewControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setExitError:(id)a3;
- (void)setPreviewController:(id)a3;
- (void)showWithItems:(id)a3 fullScreen:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation WFQuickLookActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitError, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setExitError:(id)a3
{
}

- (NSError)exitError
{
  return self->_exitError;
}

- (void)setPreviewController:(id)a3
{
}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setDataSource:(id)a3
{
}

- (WFContentCollection)dataSource
{
  return self->_dataSource;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)previewController:(id)a3 canShareItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v18 = 136315906;
      *(void *)&v18[4] = "WFEnforceClass";
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v8;
      *(_WORD *)&v18[22] = 2114;
      id v19 = (id)objc_opt_class();
      LOWORD(v20) = 2114;
      *(void *)((char *)&v20 + 2) = v7;
      id v11 = v19;
      _os_log_impl(&dword_22BEF1000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v18, 0x2Au);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  v12 = [v9 item];
  v13 = [v12 attributionSet];
  int v14 = [v6 isContentManaged];

  if (v14) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  char v16 = objc_msgSend(v13, "isAllowedToBeSentToDestinationWithManagedLevel:", v15, *(_OWORD *)v18, *(void *)&v18[16], v19, v20);

  return v16;
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v10 = a3;
  v4 = [(WFActionUserInterface *)self viewControllerForPresenting];
  id v5 = [v4 parentViewController];

  if (v5)
  {
    do
    {
      id v6 = [v4 parentViewController];

      uint64_t v7 = [v6 parentViewController];

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    id v6 = v4;
  }
  id v8 = [v6 view];
  [v8 setAccessibilityElementsHidden:0];

  [v10 setDataSource:0];
  [(WFQuickLookActionUIKitUserInterface *)self setDataSource:0];
  [(WFQuickLookActionUIKitUserInterface *)self setPreviewController:0];
  id v9 = [(WFQuickLookActionUIKitUserInterface *)self exitError];
  [(WFQuickLookActionUIKitUserInterface *)self finishWithError:v9];
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  v4 = [(WFQuickLookActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFQuickLookActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(WFQuickLookActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F087E8] userCancelledError];
  [(WFQuickLookActionUIKitUserInterface *)self setExitError:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__WFQuickLookActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v8[3] = &unk_264900A58;
  id v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)WFQuickLookActionUIKitUserInterface;
  id v6 = v4;
  [(WFActionUserInterface *)&v7 cancelPresentationWithCompletionHandler:v8];
}

uint64_t __79__WFQuickLookActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showWithItems:(id)a3 fullScreen:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFQuickLookActionUIKitUserInterface.m", 38, @"Invalid parameter not satisfying: %@", @"itemsData" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    char v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFQuickLookActionUIKitUserInterface.m", 39, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFQuickLookActionUIKitUserInterface *)self setCompletionHandler:v11];
  v12 = (void *)MEMORY[0x263F08928];
  v13 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke;
  v17[3] = &unk_2648FFF10;
  v17[4] = self;
  BOOL v18 = a4;
  id v14 = (id)objc_msgSend(v12, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v9, v13, v17);
}

void __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_2;
  block[3] = &unk_264900CF0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  char v9 = *(unsigned char *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_3;
  v3[3] = &unk_2648FFF10;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  return [v1 generatePreviewControllerDataSource:v3];
}

void __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setDataSource:v3];
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  char v4 = [v3 items];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_4;
  v12[3] = &unk_2648FFEE8;
  v12[4] = &v17;
  v12[5] = &v13;
  [v4 enumerateObjectsUsingBlock:v12];

  id v5 = objc_alloc_init(MEMORY[0x263F865F0]);
  [v5 setDelegate:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 32) dataSource];
  [v5 setDataSource:v6];

  [v5 setIsContentManaged:v14[3] > v18[3]];
  [v5 setOverrideParentApplicationDisplayIdentifier:*MEMORY[0x263F85610]];
  [v5 reloadData];
  [v5 setCurrentPreviewItemIndex:0];
  [v5 setModalPresentationStyle:2 * (*(unsigned char *)(a1 + 40) == 0)];
  [*(id *)(a1 + 32) setPreviewController:v5];
  id v7 = [*(id *)(a1 + 32) viewControllerForPresenting];
  for (i = v7; ; i = (void *)v10)
  {
    char v9 = [i parentViewController];

    if (!v9) {
      break;
    }
    uint64_t v10 = [i parentViewController];
  }
  id v11 = [i view];
  [v11 setAccessibilityElementsHidden:1];

  [v7 presentViewController:v5 animated:1 completion:0];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 attributionSet];
  int v4 = [v3 isAllowedToBeSentToDestinationWithManagedLevel:1];

  if (v4)
  {
    uint64_t v5 = a1 + 32;
    id v6 = v9;
  }
  else
  {
    id v7 = [v9 attributionSet];
    int v8 = [v7 isAllowedToBeSentToDestinationWithManagedLevel:2];

    id v6 = v9;
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v5 = a1 + 40;
  }
  ++*(void *)(*(void *)(*(void *)v5 + 8) + 24);
LABEL_6:
}

@end
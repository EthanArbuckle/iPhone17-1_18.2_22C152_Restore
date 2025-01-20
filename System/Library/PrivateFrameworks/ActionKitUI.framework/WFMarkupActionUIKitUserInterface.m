@interface WFMarkupActionUIKitUserInterface
- (NSArray)previewItems;
- (NSMutableDictionary)editedPreviewItems;
- (id)completionHandler;
- (id)editedItems;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5;
- (void)previewControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEditedPreviewItems:(id)a3;
- (void)setPreviewItems:(id)a3;
- (void)showWithPreviewItems:(id)a3 completionHandler:(id)a4;
@end

@implementation WFMarkupActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_editedPreviewItems, 0);
  objc_storeStrong((id *)&self->_previewItems, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setEditedPreviewItems:(id)a3
{
}

- (NSMutableDictionary)editedPreviewItems
{
  return self->_editedPreviewItems;
}

- (void)setPreviewItems:(id)a3
{
}

- (NSArray)previewItems
{
  return self->_previewItems;
}

- (id)editedItems
{
  v3 = [(WFMarkupActionUIKitUserInterface *)self previewItems];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__WFMarkupActionUIKitUserInterface_editedItems__block_invoke;
  v6[3] = &unk_2649003B8;
  v6[4] = self;
  v4 = objc_msgSend(v3, "if_compactMap:", v6);

  return v4;
}

id __47__WFMarkupActionUIKitUserInterface_editedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) editedPreviewItems];
  v5 = [v4 objectForKey:v3];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 previewItemURL];
  }
  v8 = v7;

  v9 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v8];
  return v9;
}

- (void)previewControllerDidDismiss:(id)a3
{
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(WFMarkupActionUIKitUserInterface *)self editedPreviewItems];
  id v12 = v7;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v12;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  [v9 setObject:v8 forKey:v11];
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 2;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  v5 = [(WFMarkupActionUIKitUserInterface *)self previewItems];
  v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  id v3 = [(WFMarkupActionUIKitUserInterface *)self previewItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__WFMarkupActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFMarkupActionUIKitUserInterface;
  id v5 = v4;
  [(WFActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __76__WFMarkupActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(WFMarkupActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFMarkupActionUIKitUserInterface *)self completionHandler];
    objc_super v6 = [(WFMarkupActionUIKitUserInterface *)self editedItems];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
  [(WFMarkupActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithPreviewItems:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFMarkupActionUIKitUserInterface.m", 41, @"Invalid parameter not satisfying: %@", @"previewItems" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFMarkupActionUIKitUserInterface.m", 42, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = objc_msgSend(v7, "if_map:", &__block_literal_global_2736);
  [(WFMarkupActionUIKitUserInterface *)self setPreviewItems:v10];

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  [(WFMarkupActionUIKitUserInterface *)self setEditedPreviewItems:v11];

  [(WFMarkupActionUIKitUserInterface *)self setCompletionHandler:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__WFMarkupActionUIKitUserInterface_showWithPreviewItems_completionHandler___block_invoke_2;
  block[3] = &unk_264900E20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75__WFMarkupActionUIKitUserInterface_showWithPreviewItems_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getQLPreviewControllerClass_softClass;
  uint64_t v10 = getQLPreviewControllerClass_softClass;
  if (!getQLPreviewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getQLPreviewControllerClass_block_invoke;
    v6[3] = &unk_264900EF8;
    v6[4] = &v7;
    __getQLPreviewControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);
  [v4 setDataSource:*(void *)(a1 + 32)];
  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 setAppearanceActions:4];
  id v5 = [*(id *)(a1 + 32) viewControllerForPresenting];
  [v5 presentViewController:v4 animated:1 completion:0];
}

uint64_t __75__WFMarkupActionUIKitUserInterface_showWithPreviewItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 url];
}

@end
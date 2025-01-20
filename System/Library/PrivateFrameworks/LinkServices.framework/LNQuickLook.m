@interface LNQuickLook
- (LNQuickLook)initWithItems:(id)a3;
- (NSArray)items;
- (NSMutableDictionary)editedPreviewItems;
- (QLPreviewController)previewController;
- (UIViewController)viewControllerForPresenting;
- (id)completionHandler;
- (id)editedItems;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)editingMode;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)presentOverViewController:(id)a3 completionHandler:(id)a4;
- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5;
- (void)previewControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEditedPreviewItems:(id)a3;
- (void)setEditingMode:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setPreviewController:(id)a3;
- (void)setViewControllerForPresenting:(id)a3;
@end

@implementation LNQuickLook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerForPresenting, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_editedPreviewItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setViewControllerForPresenting:(id)a3
{
}

- (UIViewController)viewControllerForPresenting
{
  return self->_viewControllerForPresenting;
}

- (void)setPreviewController:(id)a3
{
}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setEditedPreviewItems:(id)a3
{
}

- (NSMutableDictionary)editedPreviewItems
{
  return self->_editedPreviewItems;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setEditingMode:(int64_t)a3
{
  self->_editingMode = a3;
}

- (int64_t)editingMode
{
  return self->_editingMode;
}

- (id)editedItems
{
  v3 = [(LNQuickLook *)self items];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__LNQuickLook_editedItems__block_invoke;
  v6[3] = &unk_1E5B39460;
  v6[4] = self;
  v4 = objc_msgSend(v3, "if_map:", v6);

  return v4;
}

id __26__LNQuickLook_editedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) editedPreviewItems];
  v5 = [v4 objectForKeyedSubscript:v3];
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

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v8];
  return v9;
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v9 = a3;
  v4 = [(LNQuickLook *)self viewControllerForPresenting];
  v5 = [v4 parentViewController];

  if (v5)
  {
    do
    {
      v6 = [v4 parentViewController];

      id v7 = [v6 parentViewController];

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }
  v8 = [v6 view];
  [v8 setAccessibilityElementsHidden:0];

  [v9 setDataSource:0];
  [(LNQuickLook *)self setPreviewController:0];
  [(LNQuickLook *)self finishWithError:0];
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(LNQuickLook *)self editedPreviewItems];
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
  int64_t v4 = [(LNQuickLook *)self editingMode];
  if (v4 == 2) {
    return 1;
  }
  else {
    return 2 * (v4 == 1);
  }
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  v5 = [(LNQuickLook *)self items];
  v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  id v3 = [(LNQuickLook *)self items];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)finishWithError:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(LNQuickLook *)self completionHandler];

  if (v4)
  {
    v5 = [(LNQuickLook *)self completionHandler];
    v6 = [(LNQuickLook *)self editedItems];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
  [(LNQuickLook *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  int64_t v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(UIViewController *)self->_viewControllerForPresenting presentedViewController];

  if (v5)
  {
    viewControllerForPresenting = self->_viewControllerForPresenting;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__LNQuickLook_cancelPresentationWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5B395F8;
    v8[4] = self;
    id v9 = v4;
    [(UIViewController *)viewControllerForPresenting dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(LNQuickLook *)self finishWithError:v7];

    v4[2](v4);
  }
}

uint64_t __55__LNQuickLook_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  [v2 finishWithError:v3];

  int64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)presentOverViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(LNQuickLook *)self setCompletionHandler:v7];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v8 = (void *)getQLPreviewControllerClass_softClass;
  uint64_t v21 = getQLPreviewControllerClass_softClass;
  if (!getQLPreviewControllerClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getQLPreviewControllerClass_block_invoke;
    v17[3] = &unk_1E5B39E50;
    v17[4] = &v18;
    __getQLPreviewControllerClass_block_invoke((uint64_t)v17);
    id v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  id v10 = objc_alloc_init(v9);
  [v10 setDelegate:self];
  [v10 setDataSource:self];
  if ([(LNQuickLook *)self editingMode]) {
    [v10 setAppearanceActions:4];
  }
  [v10 reloadData];
  [v10 setCurrentPreviewItemIndex:0];
  [v10 setModalPresentationStyle:2];
  [(LNQuickLook *)self setPreviewController:v10];
  [(LNQuickLook *)self setViewControllerForPresenting:v6];
  id v11 = v6;
  id v12 = [v11 parentViewController];

  v13 = v11;
  if (v12)
  {
    v14 = v11;
    do
    {
      v13 = [v14 parentViewController];

      v15 = [v13 parentViewController];

      v14 = v13;
    }
    while (v15);
  }
  v16 = [v13 view];
  [v16 setAccessibilityElementsHidden:1];

  [v11 presentViewController:v10 animated:1 completion:0];
}

- (LNQuickLook)initWithItems:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNQuickLook.m", 42, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNQuickLook;
  id v6 = [(LNQuickLook *)&v14 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v5, "if_map:", &__block_literal_global_8134);
    items = v6->_items;
    v6->_items = (NSArray *)v7;

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    editedPreviewItems = v6->_editedPreviewItems;
    v6->_editedPreviewItems = (NSMutableDictionary *)v9;

    v6->_editingMode = 0;
    id v11 = v6;
  }

  return v6;
}

uint64_t __29__LNQuickLook_initWithItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 url];
}

@end
@interface QLListViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (QLListViewController)initWithPreviewItemStore:(id)a3 currentPreviewItem:(id)a4;
- (QLListViewControllerDelegate)archiveDelegate;
- (UIBarButtonItem)barButton;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addPath:(id)a3 fromPreviewItem:(id)a4 intoArray:(id)a5;
- (void)_dismiss;
- (void)_generateItemsAndFolders;
- (void)_updateNavigationBarVisibilityForPresentationStyle:(int64_t)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)setArchiveDelegate:(id)a3;
- (void)setBarButton:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation QLListViewController

- (QLListViewController)initWithPreviewItemStore:(id)a3 currentPreviewItem:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)QLListViewController;
  v9 = [(QLListViewController *)&v24 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    cellManager = v9->_cellManager;
    v9->_cellManager = (QLListCellManager *)v10;

    objc_storeStrong((id *)&v9->_previewItemStore, a3);
    objc_storeStrong((id *)&v9->_currentPreviewItem, a4);
    uint64_t v12 = [objc_alloc(MEMORY[0x263F82C88]) initWithStyle:0];
    tableViewController = v9->_tableViewController;
    v9->_tableViewController = (UITableViewController *)v12;

    v14 = [(UITableViewController *)v9->_tableViewController tableView];
    [v14 setDataSource:v9];

    v15 = [(UITableViewController *)v9->_tableViewController tableView];
    [v15 setDelegate:v9];

    v16 = [(QLItem *)v9->_currentPreviewItem previewItemTitle];
    [(UITableViewController *)v9->_tableViewController setTitle:v16];

    id v17 = objc_alloc(MEMORY[0x263F824A8]);
    v18 = QLLocalizedString();
    v19 = (void *)[v17 initWithTitle:v18 style:2 target:v9 action:sel__dismiss];

    v20 = [(UITableViewController *)v9->_tableViewController navigationItem];
    [v20 setRightBarButtonItem:v19];

    v25[0] = v9->_tableViewController;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    [(QLListViewController *)v9 setViewControllers:v21];

    [(QLListViewController *)v9 setModalPresentationStyle:0];
    if ([(QLPreviewItemStore *)v9->_previewItemStore isArchive]) {
      [(QLListViewController *)v9 _generateItemsAndFolders];
    }
    v22 = v9;
  }
  return v9;
}

- (void)_dismiss
{
}

- (void)_updateNavigationBarVisibilityForPresentationStyle:(int64_t)a3
{
  [(QLListViewController *)self setNavigationBarHidden:a3 == 7];
}

- (void)setBarButton:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButton);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_barButton, obj);

    if (obj)
    {
      [(QLListViewController *)self setModalPresentationStyle:7];
      v6 = [(QLListViewController *)self popoverPresentationController];
      [v6 setBarButtonItem:obj];
      id v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
      [v6 setBackgroundColor:v7];

      [v6 setDelegate:self];
      [v6 setPermittedArrowDirections:15];
    }
  }
}

- (void)prepareForPopoverPresentation:(id)a3
{
  uint64_t v4 = [a3 presentationStyle];

  [(QLListViewController *)self _updateNavigationBarVisibilityForPresentationStyle:v4];
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_itemsWithFolders) {
    return [(NSArray *)self->_itemsWithFolders count];
  }
  else {
    return [(QLPreviewItemStore *)self->_previewItemStore numberOfItems];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dequeueReusableCellWithIdentifier:kQLArchiveCellIdentifier];
  if (!v8)
  {
    id v8 = +[QLListCell listCell];
  }
  uint64_t v17 = 0;
  v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  itemsWithFolders = self->_itemsWithFolders;
  if (itemsWithFolders)
  {
    uint64_t v10 = -[NSArray objectAtIndexedSubscript:](itemsWithFolders, "objectAtIndexedSubscript:", [v7 item]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong(v18 + 5, v10);
      v11 = [v10 relativePath];
      [v11 pathComponents];
    }
    else
    {
      v11 = [v10 lastPathComponent];
      [v8 setFolderName:v11];
      [v10 pathComponents];
    uint64_t v12 = };
    objc_msgSend(v8, "setFileDepthLevel:", objc_msgSend(v12, "count"));
  }
  else
  {
    previewItemStore = self->_previewItemStore;
    uint64_t v14 = [v7 item];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__QLListViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v16[3] = &unk_2642F5520;
    v16[4] = &v17;
    [(QLPreviewItemStore *)previewItemStore previewItemAtIndex:v14 withCompletionHandler:v16];
  }
  if (v18[5])
  {
    objc_msgSend(v8, "setItem:");
    -[QLListCellManager setupCell:withItem:atIndex:](self->_cellManager, "setupCell:withItem:atIndex:", v8, v18[5], [v7 item]);
  }
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __56__QLListViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 54.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  itemsWithFolders = self->_itemsWithFolders;
  if (itemsWithFolders)
  {
    id v5 = -[NSArray objectAtIndexedSubscript:](itemsWithFolders, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v7 = isKindOfClass ^ 1;
  }
  else
  {
    char v7 = 1;
  }
  return v7 & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  itemsWithFolders = self->_itemsWithFolders;
  if (itemsWithFolders)
  {
    uint64_t v10 = -[NSArray objectAtIndexedSubscript:](itemsWithFolders, "objectAtIndexedSubscript:", [v7 item]);
    v11 = (void *)v17[5];
    v17[5] = v10;
  }
  else
  {
    previewItemStore = self->_previewItemStore;
    uint64_t v13 = [v7 item];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__QLListViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v15[3] = &unk_2642F5520;
    v15[4] = &v16;
    [(QLPreviewItemStore *)previewItemStore previewItemAtIndex:v13 withCompletionHandler:v15];
  }
  uint64_t v14 = [(QLListViewController *)self archiveDelegate];
  [v14 didSelectPreviewItem:v17[5]];

  [(QLListViewController *)self _dismiss];
  _Block_object_dispose(&v16, 8);
}

void __58__QLListViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_generateItemsAndFolders
{
  v3 = (NSArray *)objc_opt_new();
  if ([(QLPreviewItemStore *)self->_previewItemStore numberOfItems])
  {
    unint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      previewItemStore = self->_previewItemStore;
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __48__QLListViewController__generateItemsAndFolders__block_invoke;
      v8[3] = &unk_2642F58D0;
      v8[4] = self;
      v9 = v3;
      [(QLPreviewItemStore *)previewItemStore previewItemAtIndex:v4 withCompletionHandler:v8];

      ++v4;
    }
    while ([(QLPreviewItemStore *)self->_previewItemStore numberOfItems] > v4);
  }
  itemsWithFolders = self->_itemsWithFolders;
  self->_itemsWithFolders = v3;
}

void __48__QLListViewController__generateItemsAndFolders__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 relativePath];
  [v3 _addPath:v5 fromPreviewItem:v4 intoArray:*(void *)(a1 + 40)];
}

- (void)_addPath:(id)a3 fromPreviewItem:(id)a4 intoArray:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14
    && ([v14 isEqualToString:&stru_26C8FAD38] & 1) == 0
    && ([v14 isEqualToString:@"/"] & 1) == 0)
  {
    uint64_t v10 = [v14 stringByDeletingLastPathComponent];
    [(QLListViewController *)self _addPath:v10 fromPreviewItem:v8 intoArray:v9];

    v11 = [v8 relativePath];
    LODWORD(v10) = [v14 isEqualToString:v11];

    uint64_t v12 = v9;
    if (v10)
    {
      id v13 = v8;
    }
    else
    {
      if ([v9 containsObject:v14]) {
        goto LABEL_9;
      }
      uint64_t v12 = v9;
      id v13 = v14;
    }
    [v12 addObject:v13];
  }
LABEL_9:
}

- (QLListViewControllerDelegate)archiveDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_archiveDelegate);

  return (QLListViewControllerDelegate *)WeakRetained;
}

- (void)setArchiveDelegate:(id)a3
{
}

- (UIBarButtonItem)barButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barButton);
  objc_destroyWeak((id *)&self->_archiveDelegate);
  objc_storeStrong((id *)&self->_itemsWithFolders, 0);
  objc_storeStrong((id *)&self->_cellManager, 0);
  objc_storeStrong((id *)&self->_previewItemStore, 0);
  objc_storeStrong((id *)&self->_currentPreviewItem, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);

  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end
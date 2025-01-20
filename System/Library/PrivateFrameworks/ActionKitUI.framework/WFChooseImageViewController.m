@interface WFChooseImageViewController
- (WFChooseImageViewController)initWithCollection:(id)a3 selectedIndexes:(id)a4;
- (WFChooseImageViewControllerDelegate)delegate;
- (WFContentCollection)collection;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)itemsPerRow;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)maximumNumberOfItems;
- (unint64_t)minimumNumberOfItems;
- (void)cancel;
- (void)cell:(id)a3 didSelectImageViewAtIndex:(unint64_t)a4;
- (void)done;
- (void)setDelegate:(id)a3;
- (void)setItemsPerRow:(int64_t)a3;
- (void)setMaximumNumberOfItems:(unint64_t)a3;
- (void)setMinimumNumberOfItems:(unint64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFChooseImageViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedItems, 0);
}

- (int64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (WFContentCollection)collection
{
  return self->_collection;
}

- (void)setMaximumNumberOfItems:(unint64_t)a3
{
  self->_maximumNumberOfItems = a3;
}

- (unint64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (void)setMinimumNumberOfItems:(unint64_t)a3
{
  self->_minimumNumberOfItems = a3;
}

- (unint64_t)minimumNumberOfItems
{
  return self->_minimumNumberOfItems;
}

- (void)setDelegate:(id)a3
{
}

- (WFChooseImageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFChooseImageViewControllerDelegate *)WeakRetained;
}

- (void)cell:(id)a3 didSelectImageViewAtIndex:(unint64_t)a4
{
  id v19 = a3;
  v6 = [(WFChooseImageViewController *)self tableView];
  v7 = [v6 indexPathForCell:v19];
  unint64_t v8 = a4 + self->_itemsPerRow * [v7 row];

  v9 = [(WFContentCollection *)self->_collection items];
  if (v8 >= [v9 count])
  {
    v11 = v9;
  }
  else
  {
    v10 = [(WFContentCollection *)self->_collection items];
    v11 = [v10 objectAtIndex:v8];

    if (!v11) {
      goto LABEL_13;
    }
    unint64_t v12 = [(WFChooseImageViewController *)self maximumNumberOfItems];
    unint64_t v13 = [(WFChooseImageViewController *)self minimumNumberOfItems];
    int v14 = [(NSMutableSet *)self->_selectedItems containsObject:v11];
    selectedItems = self->_selectedItems;
    if (v14)
    {
      [(NSMutableSet *)selectedItems removeObject:v11];
    }
    else if (v12 - 1 >= [(NSMutableSet *)selectedItems count])
    {
      [(NSMutableSet *)self->_selectedItems addObject:v11];
    }
    if ([(NSMutableSet *)self->_selectedItems count] == 1
      && [(WFChooseImageViewController *)self maximumNumberOfItems] == 1)
    {
      [(WFChooseImageViewController *)self done];
    }
    else
    {
      objc_msgSend(v19, "setSelected:atIndex:", -[NSMutableSet containsObject:](self->_selectedItems, "containsObject:", v11), v8 % self->_itemsPerRow);
      BOOL v16 = [(NSMutableSet *)self->_selectedItems count] >= v13;
      v17 = [(WFChooseImageViewController *)self navigationItem];
      v18 = [v17 rightBarButtonItem];
      [v18 setEnabled:v16];
    }
  }

LABEL_13:
}

- (void)done
{
  v3 = (void *)MEMORY[0x263F337B0];
  v4 = [(NSMutableSet *)self->_selectedItems allObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__WFChooseImageViewController_done__block_invoke;
  v8[3] = &unk_2649007E8;
  v8[4] = self;
  v5 = [v4 sortedArrayUsingComparator:v8];
  v6 = [v3 collectionWithItems:v5];

  v7 = [(WFChooseImageViewController *)self delegate];
  [v7 chooseImageController:self didSelectItems:v6];
}

uint64_t __35__WFChooseImageViewController_done__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSNumber;
  v6 = *(void **)(*(void *)(a1 + 32) + 1096);
  id v7 = a3;
  id v8 = a2;
  v9 = [v6 items];
  uint64_t v10 = [v9 indexOfObject:v8];

  v11 = [v5 numberWithUnsignedInteger:v10];
  unint64_t v12 = NSNumber;
  unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 1096) items];
  uint64_t v14 = [v13 indexOfObject:v7];

  v15 = [v12 numberWithUnsignedInteger:v14];
  uint64_t v16 = [v11 compare:v15];

  return v16;
}

- (void)cancel
{
  id v3 = [(WFChooseImageViewController *)self delegate];
  [v3 chooseImageControllerDidCancel:self];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v5 = [(WFChooseImageViewController *)self tableView];
  [v5 bounds];
  double v6 = floor((CGRectGetWidth(v8) - (double)self->_itemsPerRow + 1.0) / (double)self->_itemsPerRow);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"WFImageContentItemCellIdentifier"];
  if (!v7) {
    id v7 = [[WFImageContentItemCell alloc] initWithStyle:0 reuseIdentifier:@"WFImageContentItemCellIdentifier"];
  }
  uint64_t v8 = [v6 row];
  unint64_t itemsPerRow = self->_itemsPerRow;
  unint64_t v10 = itemsPerRow * v8;
  v11 = [(WFContentCollection *)self->_collection items];
  uint64_t v12 = [v11 count];
  unint64_t v13 = v12 - self->_itemsPerRow * [v6 row];

  if (itemsPerRow >= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = itemsPerRow;
  }
  v15 = [(WFContentCollection *)self->_collection items];
  uint64_t v16 = objc_msgSend(v15, "subarrayWithRange:", v10, v14);
  v17 = (void *)[v16 mutableCopy];

  while ((unint64_t)[v17 count] < self->_itemsPerRow)
  {
    v18 = [MEMORY[0x263EFF9D0] null];
    [v17 addObject:v18];
  }
  [(WFImageContentItemCell *)v7 setItems:v17];
  [(WFImageContentItemCell *)v7 setDelegate:self];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __63__WFChooseImageViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v22[3] = &unk_2649007C0;
  id v19 = v7;
  v23 = v19;
  v24 = self;
  [v17 enumerateObjectsUsingBlock:v22];
  v20 = v19;

  return v20;
}

void __63__WFChooseImageViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v5 = 0;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  objc_msgSend(*(id *)(a1 + 32), "setSelected:atIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1032), "containsObject:", v5), a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFContentCollection *)self->_collection items];
  int64_t v6 = vcvtpd_s64_f64((double)(unint64_t)[v5 count] / (double)self->_itemsPerRow);

  return v6;
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)WFChooseImageViewController;
  [(WFChooseImageViewController *)&v17 viewDidLayoutSubviews];
  p_lastFrame = &self->_lastFrame;
  v4 = [(WFChooseImageViewController *)self tableView];
  [v4 frame];
  v18.origin.x = v5;
  v18.origin.y = v6;
  v18.size.width = v7;
  v18.size.height = v8;
  BOOL v9 = CGRectEqualToRect(self->_lastFrame, v18);

  if (!v9)
  {
    unint64_t v10 = [(WFChooseImageViewController *)self tableView];
    [v10 contentSize];
    [(WFChooseImageViewController *)self setItemsPerRow:vcvtmd_s64_f64(v11 / 80.0)];

    uint64_t v12 = [(WFChooseImageViewController *)self tableView];
    [v12 frame];
    p_lastFrame->origin.x = v13;
    p_lastFrame->origin.y = v14;
    p_lastFrame->size.width = v15;
    p_lastFrame->size.height = v16;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFChooseImageViewController;
  [(WFChooseImageViewController *)&v12 viewWillAppear:a3];
  if ([(WFChooseImageViewController *)self maximumNumberOfItems] == 1) {
    v4 = @"Choose Image";
  }
  else {
    v4 = @"Choose Images";
  }
  CGFloat v5 = WFLocalizedString(v4);
  [(WFChooseImageViewController *)self setTitle:v5];

  unint64_t v6 = [(NSMutableSet *)self->_selectedItems count];
  BOOL v7 = v6 >= [(WFChooseImageViewController *)self minimumNumberOfItems];
  CGFloat v8 = [(WFChooseImageViewController *)self navigationItem];
  BOOL v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];

  unint64_t v10 = [(WFChooseImageViewController *)self tableView];
  [v10 contentSize];
  [(WFChooseImageViewController *)self setItemsPerRow:vcvtmd_s64_f64(v11 / 80.0)];
}

- (void)setItemsPerRow:(int64_t)a3
{
  if (a3)
  {
    self->_unint64_t itemsPerRow = a3;
    id v3 = [(WFChooseImageViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WFChooseImageViewController;
  [(WFChooseImageViewController *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(WFChooseImageViewController *)self tableView];
  [v4 setSeparatorColor:v3];
}

- (WFChooseImageViewController)initWithCollection:(id)a3 selectedIndexes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFChooseImageViewController;
  BOOL v9 = [(WFChooseImageViewController *)&v21 initWithNibName:0 bundle:0];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v10->_unint64_t itemsPerRow = 4;
    id v11 = objc_alloc(MEMORY[0x263EFF9C0]);
    objc_super v12 = [v7 items];
    CGFloat v13 = [v12 objectsAtIndexes:v8];
    uint64_t v14 = [v11 initWithArray:v13];
    selectedItems = v10->_selectedItems;
    v10->_selectedItems = (NSMutableSet *)v14;

    CGFloat v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v10 action:sel_done];
    [v16 setStyle:2];
    objc_super v17 = [(WFChooseImageViewController *)v10 navigationItem];
    [v17 setRightBarButtonItem:v16];

    CGRect v18 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v10 action:sel_cancel];
    id v19 = [(WFChooseImageViewController *)v10 navigationItem];
    [v19 setLeftBarButtonItem:v18];
  }
  return v10;
}

@end
@interface HUMediaServiceDefaultAccountsItemModuleController
- (BOOL)shouldClearSpinnerOnNextUpdate;
- (Class)cellClassForItem:(id)a3;
- (HUMediaServiceDefaultAccountsItemModuleController)initWithModule:(id)a3 delegate:(id)a4 host:(id)a5;
- (HUMediaServiceDefaultAccountsItemModuleControllerDelegate)delegate;
- (id)_indexPathForItem:(id)a3;
- (id)host;
- (id)updateDefaultAccount:(id)a3;
- (int64_t)selectedMediaServiceIndex;
- (unint64_t)didSelectItem:(id)a3;
- (void)_clearSpinner;
- (void)setHost:(id)a3;
- (void)setSelectedMediaServiceIndex:(int64_t)a3;
- (void)setShouldClearSpinnerOnNextUpdate:(BOOL)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUMediaServiceDefaultAccountsItemModuleController

- (HUMediaServiceDefaultAccountsItemModuleController)initWithModule:(id)a3 delegate:(id)a4 host:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceDefaultAccountsItemModuleController;
  v10 = [(HUItemModuleController *)&v13 initWithModule:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_host, v9);
    v11->_selectedMediaServiceIndex = 0x7FFFFFFFFFFFFFFFLL;
    v11->_shouldClearSpinnerOnNextUpdate = 0;
  }

  return v11;
}

- (id)updateDefaultAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 updateDefaultAccount:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke;
  v10[3] = &unk_1E6386150;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = [v6 addCompletionBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke_2;
  block[3] = &unk_1E6386340;
  id v8 = v4;
  id v9 = WeakRetained;
  id v10 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 _clearSpinner];
    id v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = [v2 delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    [*(id *)(a1 + 40) setShouldClearSpinnerOnNextUpdate:1];
    id v6 = [*(id *)(a1 + 40) delegate];
    [v6 mediaServiceDefaultAccountsItemModuleController:*(void *)(a1 + 40) didUpdateDefaultAccount:*(void *)(a1 + 48)];
  }
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(HUMediaServiceDefaultAccountsItemModuleController *)self shouldClearSpinnerOnNextUpdate])
  {
    [(HUMediaServiceDefaultAccountsItemModuleController *)self setShouldClearSpinnerOnNextUpdate:0];
    [(HUMediaServiceDefaultAccountsItemModuleController *)self _clearSpinner];
  }
  objc_opt_class();
  id v21 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v21;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v8 latestResults];
  id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v10 setTitleText:v12];

  objc_super v13 = [v8 latestResults];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  int v15 = [v14 BOOLValue];

  if (v15) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [v10 setAccessoryType:v16];
  v17 = [(HUMediaServiceDefaultAccountsItemModuleController *)self _indexPathForItem:v8];
  v18 = v17;
  if (v17
    && (uint64_t v19 = [v17 row] - 1,
        v19 == [(HUMediaServiceDefaultAccountsItemModuleController *)self selectedMediaServiceIndex]))
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [v20 startAnimating];
    [v21 setAccessoryView:v20];
  }
  else
  {
    [v21 setAccessoryView:0];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  char v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 mediaServiceItemProvider];
  id v7 = [v6 items];
  int v8 = [v7 containsObject:v4];

  if (v8)
  {
    objc_opt_class();
    id v9 = v4;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = [(HUMediaServiceDefaultAccountsItemModuleController *)self _indexPathForItem:v9];
      objc_super v13 = v12;
      if (v12)
      {
        -[HUMediaServiceDefaultAccountsItemModuleController setSelectedMediaServiceIndex:](self, "setSelectedMediaServiceIndex:", [v12 row] - 1);
        v14 = [v11 mediaService];
        id v15 = [(HUMediaServiceDefaultAccountsItemModuleController *)self updateDefaultAccount:v14];
      }
    }
  }
  return 0;
}

- (void)setSelectedMediaServiceIndex:(int64_t)a3
{
  if (self->_selectedMediaServiceIndex != a3)
  {
    id v18 = (id)objc_opt_new();
    char v5 = [(HUItemModuleController *)self module];
    id v6 = [v5 mediaServiceItemProvider];
    id v7 = [v6 items];
    int64_t v8 = [v7 count];

    int64_t selectedMediaServiceIndex = self->_selectedMediaServiceIndex;
    if (selectedMediaServiceIndex != 0x7FFFFFFFFFFFFFFFLL && selectedMediaServiceIndex + 1 < v8)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      [v18 addObject:v11];
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + 1 < v8)
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      [v18 addObject:v12];
    }
    self->_int64_t selectedMediaServiceIndex = a3;
    if ([v18 count])
    {
      objc_super v13 = [(HUMediaServiceDefaultAccountsItemModuleController *)self host];
      v14 = [(HUItemModuleController *)self module];
      id v15 = [v14 mediaServiceItemProvider];
      uint64_t v16 = [v15 items];
      v17 = [v16 allObjects];
      [v13 updateCellForItems:v17];
    }
  }
}

- (void)_clearSpinner
{
}

- (id)_indexPathForItem:(id)a3
{
  id v4 = a3;
  char v5 = [(HUMediaServiceDefaultAccountsItemModuleController *)self host];
  id v6 = [v5 presentingViewControllerForModuleController:self];

  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v9 itemManager];
    id v11 = [v10 indexPathForItem:v4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (HUMediaServiceDefaultAccountsItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaServiceDefaultAccountsItemModuleControllerDelegate *)WeakRetained;
}

- (int64_t)selectedMediaServiceIndex
{
  return self->_selectedMediaServiceIndex;
}

- (BOOL)shouldClearSpinnerOnNextUpdate
{
  return self->_shouldClearSpinnerOnNextUpdate;
}

- (void)setShouldClearSpinnerOnNextUpdate:(BOOL)a3
{
  self->_shouldClearSpinnerOnNextUpdate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_host);
}

@end
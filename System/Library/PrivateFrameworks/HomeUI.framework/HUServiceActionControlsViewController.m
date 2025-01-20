@interface HUServiceActionControlsViewController
- (BOOL)itemManager:(id)a3 shouldShowControlPanelItem:(id)a4;
- (BOOL)itemManager:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4;
- (BOOL)requiresPresentingViewControllerDismissal;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFServiceActionItem)serviceActionItem;
- (HUControlPanelController)controlPanelController;
- (HUPresentationDelegate)presentationDelegate;
- (HUServiceActionControlsViewController)initWithServiceActionItem:(id)a3 mode:(unint64_t)a4;
- (HUServiceActionControlsViewControllerDelegate)serviceActionControlsDelegate;
- (UIColor)overrideCellColor;
- (unint64_t)mode;
- (void)_done:(id)a3;
- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)setControlPanelController:(id)a3;
- (void)setOverrideCellColor:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setServiceActionControlsDelegate:(id)a3;
- (void)setServiceActionItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUServiceActionControlsViewController

- (HUServiceActionControlsViewController)initWithServiceActionItem:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  v7 = [[HUServiceActionControlsItemManager alloc] initWithServiceActionItem:v6 mode:a4 delegate:self];
  v13.receiver = self;
  v13.super_class = (Class)HUServiceActionControlsViewController;
  v8 = [(HUItemTableViewController *)&v13 initWithItemManager:v7 tableViewStyle:1];
  v9 = v8;
  if (v8)
  {
    [(HUServiceActionControlsViewController *)v8 setServiceActionItem:v6];
    v10 = [[HUControlPanelController alloc] initWithDelegate:v9];
    [(HUServiceActionControlsViewController *)v9 setControlPanelController:v10];

    v9->_mode = a4;
    overrideCellColor = v9->_overrideCellColor;
    v9->_overrideCellColor = 0;
  }
  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HUServiceActionControlsViewController;
  [(HUItemTableViewController *)&v5 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  v4 = [(HUServiceActionControlsViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];
}

- (void)_done:(id)a3
{
  id v5 = [(HUServiceActionControlsViewController *)self presentationDelegate];
  id v4 = (id)[v5 finishPresentation:self animated:1];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(HUServiceActionControlsViewController *)self controlPanelController];
    v8 = [v7 cellClassForItem:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HUServiceActionControlsViewController.m", 75, @"Couldn't find a cell class for item: %@", v6 object file lineNumber description];
    v8 = 0;
  }

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(HUServiceActionControlsViewController *)self controlPanelController];
      [v8 setupCell:v9 forItem:v7];
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUServiceActionControlsViewController;
  [(HUItemTableViewController *)&v15 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v12 = [(HUServiceActionControlsViewController *)self controlPanelController];
    [v12 updateCell:v10 forItem:v11 animated:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setDestructive:1];
    }
  }
  objc_super v13 = [(HUServiceActionControlsViewController *)self overrideCellColor];

  if (v13)
  {
    v14 = [(HUServiceActionControlsViewController *)self overrideCellColor];
    [v10 setBackgroundColor:v14];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [v6 changes];
  v8 = [v7 itemOperations];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        v14 = [v13 item];
        if (objc_opt_isKindOfClass()) {
          objc_super v15 = v14;
        }
        else {
          objc_super v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          if ([v13 type] == 1)
          {
            v17 = [(HUServiceActionControlsViewController *)self controlPanelController];
            [v17 addItem:v16];
          }
          else
          {
            if ([v13 type] != 2) {
              goto LABEL_15;
            }
            v17 = [(HUServiceActionControlsViewController *)self controlPanelController];
            [v17 removeItem:v16];
          }
        }
LABEL_15:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v19.receiver = self;
  v19.super_class = (Class)HUServiceActionControlsViewController;
  [(HUItemTableViewController *)&v19 itemManager:v18 performUpdateRequest:v6];
}

- (BOOL)itemManager:(id)a3 shouldShowControlPanelItem:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServiceActionControlsViewController *)self controlPanelController];
  char v7 = [v6 shouldDisplayItem:v5];

  return v7;
}

- (BOOL)itemManager:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServiceActionControlsViewController *)self controlPanelController];
  char v7 = [v6 shouldShowSectionTitleForItem:v5];

  return v7;
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  BOOL v7 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HUServiceActionControlsViewController;
  id v12 = a6;
  id v13 = a5;
  [(HUItemTableViewController *)&v16 diffableDataItemManager:a3 willUpdateItems:a4 addItems:v13 removeItems:v12 isInitialLoad:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke;
  v15[3] = &unk_1E63889F8;
  v15[4] = self;
  objc_msgSend(v13, "na_each:", v15);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2;
  v14[3] = &unk_1E63889F8;
  v14[4] = self;
  objc_msgSend(v12, "na_each:", v14);
}

void __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v10 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v10;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) controlPanelController];
    BOOL v7 = [v6 allItems];
    char v8 = [v7 containsObject:v5];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [*(id *)(a1 + 32) controlPanelController];
      [v9 addItem:v5];
    }
  }
}

void __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) controlPanelController];
    [v6 removeItem:v5];
  }
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HFServiceActionItem)serviceActionItem
{
  return self->_serviceActionItem;
}

- (void)setServiceActionItem:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HUServiceActionControlsViewControllerDelegate)serviceActionControlsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceActionControlsDelegate);

  return (HUServiceActionControlsViewControllerDelegate *)WeakRetained;
}

- (void)setServiceActionControlsDelegate:(id)a3
{
}

- (HUControlPanelController)controlPanelController
{
  return self->_controlPanelController;
}

- (void)setControlPanelController:(id)a3
{
}

- (UIColor)overrideCellColor
{
  return self->_overrideCellColor;
}

- (void)setOverrideCellColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCellColor, 0);
  objc_storeStrong((id *)&self->_controlPanelController, 0);
  objc_destroyWeak((id *)&self->_serviceActionControlsDelegate);
  objc_storeStrong((id *)&self->_serviceActionItem, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
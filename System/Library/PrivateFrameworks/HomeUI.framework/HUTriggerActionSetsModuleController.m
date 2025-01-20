@interface HUTriggerActionSetsModuleController
- (Class)cellClassForItem:(id)a3;
- (HUTriggerActionSetsModuleControllerDelegate)delegate;
- (HUTriggerSummaryActionGridViewControllerProtocol)actionSetsGridViewController;
- (HUTriggerSummaryActionGridViewControllerProtocol)actionsGridViewController;
- (HUTriggerSummaryActionGridViewControllerProtocol)prioritizedActionsGridViewController;
- (id)childViewControllersToPreload;
- (void)reloadActions;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)triggerActionGridViewController:(id)a3 didUpdate:(id)a4;
- (void)triggerActionSetGridViewController:(id)a3 didUpdate:(id)a4;
@end

@implementation HUTriggerActionSetsModuleController

- (void)reloadActions
{
  if (self->_actionSetsGridViewController) {
    goto LABEL_3;
  }
  v3 = [(HUItemModuleController *)self module];
  v4 = [v3 itemUpdater];
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 actionSetsGridItem];
  int v7 = [v4 itemIsBeingDisplayed:v6];

  if (v7)
  {
LABEL_3:
    v8 = [(HUTriggerActionSetsModuleController *)self actionSetsGridViewController];
    [v8 reloadActions];
  }
  if (self->_actionsGridViewController) {
    goto LABEL_6;
  }
  v9 = [(HUItemModuleController *)self module];
  v10 = [v9 itemUpdater];
  v11 = [(HUItemModuleController *)self module];
  v12 = [v11 serviceActionsGridItem];
  int v13 = [v10 itemIsBeingDisplayed:v12];

  if (v13)
  {
LABEL_6:
    v14 = [(HUTriggerActionSetsModuleController *)self actionsGridViewController];
    [v14 reloadActions];
  }
  if (self->_prioritizedActionsGridViewController) {
    goto LABEL_9;
  }
  v15 = [(HUItemModuleController *)self module];
  v16 = [v15 itemUpdater];
  v17 = [(HUItemModuleController *)self module];
  v18 = [v17 prioritizedServiceActionsGridItem];
  int v19 = [v16 itemIsBeingDisplayed:v18];

  if (v19)
  {
LABEL_9:
    id v20 = [(HUTriggerActionSetsModuleController *)self prioritizedActionsGridViewController];
    [v20 reloadActions];
  }
}

- (id)childViewControllersToPreload
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(HUTriggerActionSetsModuleController *)self actionsGridViewController];
  [v3 addObject:v4];

  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 itemUpdater];
  int v7 = [(HUItemModuleController *)self module];
  v8 = [v7 actionSetsGridItem];
  int v9 = [v6 itemIsBeingDisplayed:v8];

  if (v9)
  {
    v10 = [(HUTriggerActionSetsModuleController *)self actionSetsGridViewController];
    [v3 addObject:v10];
  }
  v11 = [(HUItemModuleController *)self module];
  v12 = [v11 itemUpdater];
  int v13 = [(HUItemModuleController *)self module];
  v14 = [v13 prioritizedServiceActionsGridItem];
  int v15 = [v12 itemIsBeingDisplayed:v14];

  if (v15)
  {
    v16 = [(HUTriggerActionSetsModuleController *)self prioritizedActionsGridViewController];
    [v3 addObject:v16];
  }
  objc_msgSend(v3, "na_safeAddObject:", self->_actionSetsGridViewController);
  objc_msgSend(v3, "na_safeAddObject:", self->_prioritizedActionsGridViewController);
  v17 = [v3 allObjects];

  return v17;
}

- (HUTriggerSummaryActionGridViewControllerProtocol)actionSetsGridViewController
{
  actionSetsGridViewController = self->_actionSetsGridViewController;
  if (!actionSetsGridViewController)
  {
    v4 = [HUEmbeddedTriggerActionSetGridViewController alloc];
    v5 = [(HUItemModuleController *)self module];
    v6 = [v5 triggerBuilder];
    int v7 = [(HUEmbeddedTriggerActionSetGridViewController *)v4 initWithTriggerBuilder:v6];

    [(HUEmbeddedTriggerActionSetGridViewController *)v7 setDelegate:self];
    v8 = self->_actionSetsGridViewController;
    self->_actionSetsGridViewController = (HUTriggerSummaryActionGridViewControllerProtocol *)v7;

    actionSetsGridViewController = self->_actionSetsGridViewController;
  }

  return actionSetsGridViewController;
}

- (HUTriggerSummaryActionGridViewControllerProtocol)actionsGridViewController
{
  actionsGridViewController = self->_actionsGridViewController;
  if (!actionsGridViewController)
  {
    v4 = [HUEmbeddedTriggerActionGridViewController alloc];
    v5 = [(HUItemModuleController *)self module];
    v6 = [v5 triggerBuilder];
    int v7 = [(HUEmbeddedTriggerActionGridViewController *)v4 initWithTriggerBuilder:v6];

    v8 = [(HUItemModuleController *)self module];
    int v9 = [v8 prioritizedAccessories];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v11 = [(HUItemModuleController *)self module];
      v12 = [v11 prioritizedAccessories];
      int v13 = [v12 allObjects];
      [(ActionGridViewController *)v7 setDenylistedAccessories:v13];
    }
    [(HUEmbeddedTriggerActionGridViewController *)v7 setTriggerActionGridDelegate:self];
    v14 = self->_actionsGridViewController;
    self->_actionsGridViewController = (HUTriggerSummaryActionGridViewControllerProtocol *)v7;

    actionsGridViewController = self->_actionsGridViewController;
  }

  return actionsGridViewController;
}

- (HUTriggerSummaryActionGridViewControllerProtocol)prioritizedActionsGridViewController
{
  prioritizedActionsGridViewController = self->_prioritizedActionsGridViewController;
  if (!prioritizedActionsGridViewController)
  {
    v4 = [HUEmbeddedTriggerActionGridViewController alloc];
    v5 = [(HUItemModuleController *)self module];
    v6 = [v5 triggerBuilder];
    int v7 = [(HUEmbeddedTriggerActionGridViewController *)v4 initWithTriggerBuilder:v6];

    v8 = [(HUItemModuleController *)self module];
    int v9 = [v8 prioritizedAccessories];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v11 = [(HUItemModuleController *)self module];
      v12 = [v11 prioritizedAccessories];
      int v13 = [v12 allObjects];
      [(ActionGridViewController *)v7 setAllowlistedAccessories:v13];
    }
    v14 = self->_prioritizedActionsGridViewController;
    self->_prioritizedActionsGridViewController = (HUTriggerSummaryActionGridViewControllerProtocol *)v7;

    prioritizedActionsGridViewController = self->_prioritizedActionsGridViewController;
  }

  return prioritizedActionsGridViewController;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 actionSetsGridItem];
  if ([v4 isEqual:v6]) {
    goto LABEL_4;
  }
  int v7 = [(HUItemModuleController *)self module];
  v8 = [v7 serviceActionsGridItem];
  if ([v4 isEqual:v8])
  {

LABEL_4:
LABEL_5:
    int v9 = objc_opt_class();
    goto LABEL_6;
  }
  v11 = [(HUItemModuleController *)self module];
  v12 = [v11 prioritizedServiceActionsGridItem];
  char v13 = [v4 isEqual:v12];

  if (v13) {
    goto LABEL_5;
  }
  v14 = [(HUItemModuleController *)self module];
  id v15 = [v14 shortcutItem];

  if (v15 == v4) {
    goto LABEL_5;
  }
  int v9 = 0;
LABEL_6:

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  int v7 = [(HUItemModuleController *)self module];
  id v8 = [v7 actionSetsGridItem];

  if (v8 == v6)
  {
    id v20 = (void *)MEMORY[0x1E4F428B8];
    id v19 = v33;
    v21 = [v20 clearColor];
    [v19 setBackgroundColor:v21];

    v22 = [MEMORY[0x1E4F428B8] clearColor];
    v23 = [v19 contentView];
    [v23 setBackgroundColor:v22];

    [v19 setIgnoreRounding:1];
    uint64_t v24 = [(HUTriggerActionSetsModuleController *)self actionSetsGridViewController];
LABEL_10:
    id v16 = (id)v24;
    [v19 setViewController:v24];
    goto LABEL_11;
  }
  int v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 serviceActionsGridItem];

  if (v10 == v6)
  {
    v25 = (void *)MEMORY[0x1E4F428B8];
    id v19 = v33;
    v26 = [v25 clearColor];
    [v19 setBackgroundColor:v26];

    v27 = [MEMORY[0x1E4F428B8] clearColor];
    v28 = [v19 contentView];
    [v28 setBackgroundColor:v27];

    [v19 setIgnoreRounding:1];
    uint64_t v24 = [(HUTriggerActionSetsModuleController *)self actionsGridViewController];
    goto LABEL_10;
  }
  v11 = [(HUItemModuleController *)self module];
  id v12 = [v11 prioritizedServiceActionsGridItem];

  if (v12 == v6)
  {
    v29 = (void *)MEMORY[0x1E4F428B8];
    id v19 = v33;
    v30 = [v29 clearColor];
    [v19 setBackgroundColor:v30];

    v31 = [MEMORY[0x1E4F428B8] clearColor];
    v32 = [v19 contentView];
    [v32 setBackgroundColor:v31];

    [v19 setIgnoreRounding:1];
    uint64_t v24 = [(HUTriggerActionSetsModuleController *)self prioritizedActionsGridViewController];
    goto LABEL_10;
  }
  char v13 = [(HUItemModuleController *)self module];
  v14 = [v13 shortcutItem];
  int v15 = [v6 isEqual:v14];

  if (!v15) {
    goto LABEL_13;
  }
  id v16 = v33;
  v17 = [v16 traitCollection];
  uint64_t v18 = [v17 userInterfaceStyle];

  if (v18 == 1)
  {
    id v19 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [v16 setCellColor:v19];
LABEL_11:
  }
LABEL_13:
}

- (void)triggerActionGridViewController:(id)a3 didUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [(HUTriggerActionSetsModuleController *)self delegate];
  [v6 actionSetsModuleController:self didUpdateTriggerBuilder:v5];
}

- (void)triggerActionSetGridViewController:(id)a3 didUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [(HUTriggerActionSetsModuleController *)self delegate];
  [v6 actionSetsModuleController:self didUpdateTriggerBuilder:v5];
}

- (HUTriggerActionSetsModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerActionSetsModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prioritizedActionsGridViewController, 0);
  objc_storeStrong((id *)&self->_actionsGridViewController, 0);

  objc_storeStrong((id *)&self->_actionSetsGridViewController, 0);
}

@end
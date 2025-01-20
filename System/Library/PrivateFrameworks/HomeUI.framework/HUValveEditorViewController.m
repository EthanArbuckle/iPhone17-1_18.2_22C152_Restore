@interface HUValveEditorViewController
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUNameItemModuleController)nameModuleController;
- (HUValveEditorItemManager)valveEditorItemManager;
- (HUValveEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUValveEditorViewController)initWithSourceItem:(id)a3 editorMode:(unint64_t)a4;
- (NSMutableSet)moduleControllers;
- (id)itemModuleControllers;
- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)setModuleControllers:(id)a3;
- (void)setNameModuleController:(id)a3;
- (void)setValveEditorItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUValveEditorViewController

- (HUValveEditorViewController)initWithSourceItem:(id)a3 editorMode:(unint64_t)a4
{
  id v6 = a3;
  v7 = [[HUValveEditorItemManager alloc] initWithDelegate:self sourceItem:v6 editorMode:a4];

  v13.receiver = self;
  v13.super_class = (Class)HUValveEditorViewController;
  v8 = [(HUItemTableViewController *)&v13 initWithItemManager:v7 tableViewStyle:1];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_valveEditorItemManager, v7);
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
    moduleControllers = v9->_moduleControllers;
    v9->_moduleControllers = (NSMutableSet *)v10;
  }
  return v9;
}

- (HUValveEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithSourceItem_editorMode_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUValveEditorViewController.m", 49, @"%s is unavailable; use %@ instead",
    "-[HUValveEditorViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = [(HUValveEditorViewController *)self valveEditorItemManager];
  v8 = v7;
  if (isKindOfClass)
  {
    v9 = [v7 controlPanelController];
    uint64_t v10 = [v9 cellClassForItem:v5];
  }
  else
  {
    v11 = [v7 identifyItem];
    [v5 isEqual:v11];

    uint64_t v10 = objc_opt_class();
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(HUValveEditorViewController *)self valveEditorItemManager];
    v9 = [v8 controlPanelController];
    [v9 setupCell:v10 forItem:v7];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUValveEditorViewController;
  [(HUItemTableViewController *)&v14 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [(HUValveEditorViewController *)self valveEditorItemManager];
    objc_super v13 = [v12 controlPanelController];
    [v13 updateCell:v10 forItem:v11 animated:1];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUValveEditorViewController;
  [(HUItemTableViewController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUValveEditorViewController *)self valveEditorItemManager];
  id v11 = [v10 identifyItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    objc_opt_class();
    objc_super v13 = [(HUValveEditorViewController *)self valveEditorItemManager];
    objc_super v14 = [v13 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    objc_opt_class();
    v17 = [v16 service];

    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    v20 = [v19 accessory];

    [v20 identifyWithCompletionHandler:&__block_literal_global_153];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

void __65__HUValveEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = (void *)MEMORY[0x1E4F69110];
    id v3 = a2;
    id v4 = [v2 sharedHandler];
    [v4 handleError:v3];
  }
}

- (id)itemModuleControllers
{
  uint64_t v3 = [(HUValveEditorViewController *)self nameModuleController];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = (void *)v3;
  id v5 = [(HUValveEditorViewController *)self valveEditorItemManager];
  id v6 = [v5 nameModule];

  if (!v6)
  {
LABEL_3:
    id v7 = [HUNameItemModuleController alloc];
    v8 = [(HUValveEditorViewController *)self valveEditorItemManager];
    v9 = [v8 nameModule];
    id v10 = [(HUNameItemModuleController *)v7 initWithModule:v9 host:self];
    [(HUValveEditorViewController *)self setNameModuleController:v10];

    id v11 = [(HUValveEditorViewController *)self nameModuleController];
    [v11 setNameFieldHasClearButton:1];

    int v12 = [(HUValveEditorViewController *)self nameModuleController];
    [v12 setShowIcon:0];

    objc_super v13 = [(HUValveEditorViewController *)self moduleControllers];
    objc_super v14 = [(HUValveEditorViewController *)self nameModuleController];
    [v13 addObject:v14];
  }

  return [(HUValveEditorViewController *)self moduleControllers];
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v5 = [a3 text];
  id v6 = [(HUValveEditorViewController *)self nameModuleController];
  id v7 = [v6 prepareForCommit];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke;
  v10[3] = &unk_1E63859F8;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  id v9 = (id)[v7 addSuccessBlock:v10];
}

void __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valveEditorItemManager];
  uint64_t v3 = [v2 serviceBuilder];
  id v4 = [v3 commitItem];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke_2;
  v6[3] = &unk_1E6386708;
  id v7 = *(id *)(a1 + 40);
  id v5 = (id)[v4 addFailureBlock:v6];
}

void __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  id v5 = [v3 sharedHandler];
  uint64_t v6 = *MEMORY[0x1E4F68780];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v9 = *MEMORY[0x1E4F68420];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 handleError:v4 operationType:v6 options:v8 retryBlock:0 cancelBlock:0];
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 changes];
  id v8 = [v7 itemOperations];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        objc_opt_class();
        objc_super v14 = [v13 item];
        if (objc_opt_isKindOfClass()) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          if ([v13 type] == 1)
          {
            v17 = [(HUValveEditorViewController *)self valveEditorItemManager];
            v18 = [v17 controlPanelController];
            [v18 addItem:v16];
          }
          else
          {
            if ([v13 type] != 2) {
              goto LABEL_15;
            }
            v17 = [(HUValveEditorViewController *)self valveEditorItemManager];
            v18 = [v17 controlPanelController];
            [v18 removeItem:v16];
          }
        }
LABEL_15:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v20.receiver = self;
  v20.super_class = (Class)HUValveEditorViewController;
  [(HUItemTableViewController *)&v20 itemManager:v19 performUpdateRequest:v6];
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  BOOL v7 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HUValveEditorViewController;
  id v12 = a6;
  id v13 = a5;
  [(HUItemTableViewController *)&v16 diffableDataItemManager:a3 willUpdateItems:a4 addItems:v13 removeItems:v12 isInitialLoad:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke;
  v15[3] = &unk_1E63889F8;
  v15[4] = self;
  objc_msgSend(v13, "na_each:", v15);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2;
  v14[3] = &unk_1E63889F8;
  v14[4] = self;
  objc_msgSend(v12, "na_each:", v14);
}

void __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v12 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v12;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) valveEditorItemManager];
    BOOL v7 = [v6 controlPanelController];
    id v8 = [v7 allItems];
    char v9 = [v8 containsObject:v5];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [*(id *)(a1 + 32) valveEditorItemManager];
      uint64_t v11 = [v10 controlPanelController];
      [v11 addItem:v5];
    }
  }
}

void __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v8 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v8;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) valveEditorItemManager];
    BOOL v7 = [v6 controlPanelController];
    [v7 removeItem:v5];
  }
}

- (HUValveEditorItemManager)valveEditorItemManager
{
  return self->_valveEditorItemManager;
}

- (void)setValveEditorItemManager:(id)a3
{
}

- (HUNameItemModuleController)nameModuleController
{
  return self->_nameModuleController;
}

- (void)setNameModuleController:(id)a3
{
}

- (NSMutableSet)moduleControllers
{
  return self->_moduleControllers;
}

- (void)setModuleControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleControllers, 0);
  objc_storeStrong((id *)&self->_nameModuleController, 0);

  objc_storeStrong((id *)&self->_valveEditorItemManager, 0);
}

@end
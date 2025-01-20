@interface HUUserCamerasAccessLevelViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFUserItem)userItem;
- (HUUserCamerasAccessLevelItemManager)camerasAccessLevelItemManager;
- (HUUserCamerasAccessLevelViewController)initWithUserItem:(id)a3 home:(id)a4;
- (NSIndexPath)selectedIndexPath;
- (void)setSelectedIndexPath:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUUserCamerasAccessLevelViewController

- (HUUserCamerasAccessLevelViewController)initWithUserItem:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [HUUserCamerasAccessLevelItemManager alloc];
  v9 = (void *)[v6 copy];
  v10 = [(HUUserCamerasAccessLevelItemManager *)v8 initWithHome:v7 userItem:v9 delegate:self];

  v15.receiver = self;
  v15.super_class = (Class)HUUserCamerasAccessLevelViewController;
  v11 = [(HUItemTableViewController *)&v15 initWithItemManager:v10 tableViewStyle:1];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    userItem = v11->_userItem;
    v11->_userItem = (HFUserItem *)v12;

    objc_storeStrong((id *)&v11->_camerasAccessLevelItemManager, v10);
  }

  return v11;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HUUserCamerasAccessLevelViewController;
  [(HUItemTableViewController *)&v4 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUUsersCamerasTitle", @"HUUsersCamerasTitle", 1);
  [(HUUserCamerasAccessLevelViewController *)self setTitle:v3];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HUUserCamerasAccessLevelViewController *)self camerasAccessLevelItemManager];
  v9 = [v8 accessLevelItems];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUUserCamerasAccessLevelViewController;
    uint64_t v11 = [(HUItemTableViewController *)&v14 cellClassForItem:v6 indexPath:v7];
  }
  uint64_t v12 = (void *)v11;

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUUserCamerasAccessLevelViewController;
  [(HUItemTableViewController *)&v20 setupCell:v8 forItem:v9 indexPath:a5];
  int v10 = [(HUUserCamerasAccessLevelViewController *)self camerasAccessLevelItemManager];
  uint64_t v11 = [v10 accessLevelItems];
  int v12 = [v11 containsObject:v9];

  if (v12)
  {
    v13 = [v9 latestResults];
    objc_super v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    objc_super v15 = [v8 textLabel];
    [v15 setText:v14];

    v16 = [v9 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    LODWORD(v15) = [v17 BOOLValue];

    [v8 setUserInteractionEnabled:v15 ^ 1];
    v18 = [v8 textLabel];
    [v18 setEnabled:v15 ^ 1];

    if (v15) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 3;
    }
    [v8 setSelectionStyle:v19];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HUUserCamerasAccessLevelViewController;
  [(HUItemTableViewController *)&v20 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
  v13 = [(HUUserCamerasAccessLevelViewController *)self camerasAccessLevelItemManager];
  objc_super v14 = [v13 accessLevelItems];
  int v15 = [v14 containsObject:v11];

  if (v15)
  {
    v16 = [v11 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    int v18 = [v17 BOOLValue];

    if (v18)
    {
      [(HUUserCamerasAccessLevelViewController *)self setSelectedIndexPath:v12];
      uint64_t v19 = 3;
    }
    else
    {
      uint64_t v19 = 0;
    }
    [v10 setAccessoryType:v19];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HUUserCamerasAccessLevelViewController *)self selectedIndexPath];
  char v7 = [v6 isEqual:v5];

  return v7 ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HUUserCamerasAccessLevelViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v36 tableView:v7 didSelectRowAtIndexPath:v6];
  [(HUUserCamerasAccessLevelViewController *)self setSelectedIndexPath:v6];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  id v10 = [(HUUserCamerasAccessLevelViewController *)self camerasAccessLevelItemManager];
  id v11 = [v10 user];

  id v12 = [(HUItemTableViewController *)self itemManager];
  v13 = [v12 home];
  objc_super v14 = [v13 homeAccessControlForUser:v11];

  int v15 = [(HUUserCamerasAccessLevelViewController *)self camerasAccessLevelItemManager];
  v16 = [v15 accessLevelItems];
  int v17 = [v16 containsObject:v9];

  if (v17)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E63877F8;
    id v34 = v9;
    id v35 = v14;
    int v18 = _Block_copy(aBlock);
  }
  else
  {
    int v18 = 0;
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F7A0D8];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v31[3] = &unk_1E638B498;
  id v32 = v18;
  id v20 = v18;
  v21 = [v19 futureWithErrorOnlyHandlerAdapterBlock:v31];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v28 = &unk_1E63859F8;
  v29 = self;
  id v30 = v11;
  id v22 = v11;
  id v23 = (id)[v21 addSuccessBlock:&v25];
  id v24 = (id)objc_msgSend(v21, "addFailureBlock:", &__block_literal_global_146, v25, v26, v27, v28, v29);
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v7 = a2;
  objc_super v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:@"HFAccessLevelValueResultKey"];
  uint64_t v6 = [v5 integerValue];

  [*(id *)(a1 + 40) updateCamerasAccessLevel:v6 completionHandler:v7];
}

uint64_t __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v4[3] = &unk_1E6387408;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 dispatchHomeObserverMessage:v4 sender:0];
}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [*(id *)(a1 + 32) itemManager];
    objc_super v4 = [v3 home];
    [v5 home:v4 didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F687E0] options:0 retryBlock:0 cancelBlock:0];
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUUserCamerasAccessLevelItemManager)camerasAccessLevelItemManager
{
  return self->_camerasAccessLevelItemManager;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_camerasAccessLevelItemManager, 0);

  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
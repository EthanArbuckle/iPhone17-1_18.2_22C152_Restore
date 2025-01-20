@interface HURemoteAccessTableViewController
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFUserItem)userItem;
- (HURemoteAccessItemManager)remoteAccessItemManager;
- (HURemoteAccessTableViewController)initWithItem:(id)a3 home:(id)a4;
- (id)user;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation HURemoteAccessTableViewController

- (HURemoteAccessTableViewController)initWithItem:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [HURemoteAccessItemManager alloc];
  v9 = (void *)[v6 copy];
  v10 = [(HURemoteAccessItemManager *)v8 initWithHome:v7 userItem:v9 delegate:self];

  v15.receiver = self;
  v15.super_class = (Class)HURemoteAccessTableViewController;
  v11 = [(HUItemTableViewController *)&v15 initWithItemManager:v10 tableViewStyle:1];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    userItem = v11->_userItem;
    v11->_userItem = (HFUserItem *)v12;

    objc_storeStrong((id *)&v11->_remoteAccessItemManager, v10);
  }

  return v11;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HURemoteAccessTableViewController;
  [(HUItemTableViewController *)&v4 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HURemoteAccessTitle", @"HURemoteAccessTitle", 1);
  [(HURemoteAccessTableViewController *)self setTitle:v3];
}

- (id)user
{
  v2 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
  v3 = [v2 user];

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
  v9 = [v8 allowRemoteAccessItem];
  int v10 = [v6 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HURemoteAccessTableViewController;
    uint64_t v11 = [(HUItemTableViewController *)&v14 cellClassForItem:v6 indexPath:v7];
  }
  uint64_t v12 = (void *)v11;

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HURemoteAccessTableViewController;
  id v9 = a4;
  [(HUItemTableViewController *)&v14 setupCell:v8 forItem:v9 indexPath:a5];
  int v10 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
  uint64_t v11 = [v10 allowRemoteAccessItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = v8;
    [v13 setDelegate:self];
    [v13 setSelectionStyle:0];
  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [(id)v8 displayedItemAtIndexPath:v6];

  v14.receiver = self;
  v14.super_class = (Class)HURemoteAccessTableViewController;
  LOBYTE(v8) = [(HUItemTableViewController *)&v14 shouldHideSeparatorsForCell:v7 indexPath:v6];

  if (v8)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v11 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
    int v12 = [v11 allowRemoteAccessItem];
    char v10 = [v9 isEqual:v12];
  }
  return v10;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HURemoteAccessTableViewController *)self tableView];
  uint64_t v8 = [v7 indexPathForCell:v6];

  id v9 = [(HUItemTableViewController *)self itemManager];
  v27 = (void *)v8;
  char v10 = [v9 displayedItemAtIndexPath:v8];

  uint64_t v11 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
  int v12 = [v11 user];

  id v13 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
  objc_super v14 = [v13 home];
  objc_super v15 = [v14 homeAccessControlForUser:v12];

  v16 = [(HURemoteAccessTableViewController *)self remoteAccessItemManager];
  v17 = [v16 allowRemoteAccessItem];
  int v18 = [v10 isEqual:v17];

  if (v18)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E63888B0;
    id v36 = v15;
    BOOL v37 = a4;
    v19 = _Block_copy(aBlock);
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x1E4F7A0D8];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_2;
  v33[3] = &unk_1E638B498;
  id v34 = v19;
  id v21 = v19;
  v22 = [v20 futureWithErrorOnlyHandlerAdapterBlock:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_3;
  v31[3] = &unk_1E63859F8;
  v31[4] = self;
  id v32 = v12;
  id v23 = v12;
  id v24 = (id)[v22 addSuccessBlock:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_5;
  v28[3] = &unk_1E63899B8;
  id v29 = v6;
  BOOL v30 = a4;
  id v25 = v6;
  id v26 = (id)[v22 addFailureBlock:v28];
}

uint64_t __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateRemoteAccess:*(unsigned __int8 *)(a1 + 40) completionHandler:a2];
}

uint64_t __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_4;
  v4[3] = &unk_1E6387408;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 dispatchHomeObserverMessage:v4 sender:0];
}

void __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [*(id *)(a1 + 32) itemManager];
    objc_super v4 = [v3 home];
    [v5 home:v4 didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

uint64_t __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  id v5 = [v3 sharedHandler];
  [v5 handleError:v4 operationType:*MEMORY[0x1E4F687E0] options:0 retryBlock:0 cancelBlock:0];

  id v6 = *(void **)(a1 + 32);
  BOOL v7 = *(unsigned char *)(a1 + 40) == 0;

  return [v6 setOn:v7 animated:1];
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HURemoteAccessItemManager)remoteAccessItemManager
{
  return self->_remoteAccessItemManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccessItemManager, 0);

  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
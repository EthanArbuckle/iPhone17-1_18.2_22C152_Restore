@interface HUMediaServiceDefaultAccountsTableViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFUserItem)userItem;
- (HUMediaServiceDefaultAccountsItemManager)mediaServiceDefaultAccountsItemManager;
- (HUMediaServiceDefaultAccountsItemModuleController)mediaServiceDefaultAccountsItemModuleController;
- (HUMediaServiceDefaultAccountsTableViewController)initWithItem:(id)a3 home:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)itemModuleControllers;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)mediaServiceDefaultAccountsItemModuleController:(id)a3 didUpdateDefaultAccount:(id)a4;
- (void)setMediaServiceDefaultAccountsItemModuleController:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
@end

@implementation HUMediaServiceDefaultAccountsTableViewController

- (HUMediaServiceDefaultAccountsTableViewController)initWithItem:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [HUMediaServiceDefaultAccountsItemManager alloc];
  v9 = (void *)[v7 copy];

  v10 = [(HUMediaServiceDefaultAccountsItemManager *)v8 initWithHome:v6 sourceItem:v9 delegate:self];
  v18.receiver = self;
  v18.super_class = (Class)HUMediaServiceDefaultAccountsTableViewController;
  v11 = [(HUItemTableViewController *)&v18 initWithItemManager:v10 tableViewStyle:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaServiceDefaultAccountsItemManager, v10);
    id v13 = objc_alloc(MEMORY[0x1E4F69710]);
    v14 = [v6 currentUser];
    uint64_t v15 = [v13 initWithHome:v6 user:v14 nameStyle:0];
    userItem = v12->_userItem;
    v12->_userItem = (HFUserItem *)v15;
  }
  return v12;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemManager];
  id v7 = [v6 defaultAccountsTitleItem];
  [v5 isEqual:v7];

  v8 = objc_opt_class();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUMediaServiceDefaultAccountsTableViewController;
  [(HUItemTableViewController *)&v20 setupCell:v8 forItem:v9 indexPath:a5];
  v10 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemManager];
  id v11 = [v10 defaultAccountsTitleItem];

  if (v11 == v9)
  {
    objc_opt_class();
    id v12 = v8;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    uint64_t v15 = [v9 latestResults];
    v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    v17 = [v14 textLabel];
    [v17 setText:v16];

    objc_super v18 = [v14 textLabel];
    [v18 setNumberOfLines:0];

    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [v14 setBackgroundColor:v19];
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 displayedSectionIdentifierForSectionIndex:a4];

  if ([v6 isEqualToString:@"HUMediaServiceDefaultAccountsTitleSectionIdentifier"]) {
    double v7 = 0.01;
  }
  else {
    double v7 = *MEMORY[0x1E4F43D18];
  }

  return v7;
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v4 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemModuleController];
  if (!v4)
  {
    id v5 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemManager];
    id v6 = [v5 defaultAccountsItemModule];

    if (!v6) {
      goto LABEL_5;
    }
    double v7 = [HUMediaServiceDefaultAccountsItemModuleController alloc];
    v4 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemManager];
    id v8 = [v4 defaultAccountsItemModule];
    id v9 = [(HUMediaServiceDefaultAccountsItemModuleController *)v7 initWithModule:v8 delegate:self host:self];
    [(HUMediaServiceDefaultAccountsTableViewController *)self setMediaServiceDefaultAccountsItemModuleController:v9];
  }
LABEL_5:
  v10 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v10);

  return v3;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (void)mediaServiceDefaultAccountsItemModuleController:(id)a3 didUpdateDefaultAccount:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(HUMediaServiceDefaultAccountsTableViewController *)self mediaServiceDefaultAccountsItemManager];
  id v7 = (id)[v6 reloadAndUpdateAllItemsFromSenderSelector:a2];

  id v8 = [(HUItemTableViewController *)self itemManager];
  LODWORD(v6) = [v8 diffableDataSourceDisabled];

  if (v6)
  {
    id v14 = [(HUMediaServiceDefaultAccountsTableViewController *)self tableView];
    id v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v14 reloadSections:v9 withRowAnimation:5];
  }
  else
  {
    v10 = [(HUItemTableViewController *)self itemManager];
    id v11 = [v10 itemSectionForSectionIndex:0];

    if (v11)
    {
      id v12 = [(HUItemTableViewController *)self itemManager];
      v15[0] = v11;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v12 reloadUIRepresentationForSections:v13 withAnimation:0];
    }
  }
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUMediaServiceDefaultAccountsItemManager)mediaServiceDefaultAccountsItemManager
{
  return self->_mediaServiceDefaultAccountsItemManager;
}

- (HUMediaServiceDefaultAccountsItemModuleController)mediaServiceDefaultAccountsItemModuleController
{
  return self->_mediaServiceDefaultAccountsItemModuleController;
}

- (void)setMediaServiceDefaultAccountsItemModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceDefaultAccountsItemModuleController, 0);
  objc_storeStrong((id *)&self->_mediaServiceDefaultAccountsItemManager, 0);

  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
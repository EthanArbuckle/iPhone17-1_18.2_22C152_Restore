@interface HUNetworkRouterSettingsViewController
- (BOOL)_shouldShowNetworkRouterDetails;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)_networkRouterDetailsViewControllerClass;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUNetworkConfigurationItemListModuleController)networkConfigurationItemListModuleController;
- (HUNetworkRouterSettingsViewController)initWithHome:(id)a3;
- (HUNetworkRouterSettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)presentNetworkConfigurationSettingsForProfile:(id)a3 animated:(BOOL)a4;
- (id)presentNetworkRouterSettingsForAccessory:(id)a3 animated:(BOOL)a4;
- (id)presentNetworkRouterSettingsForItem:(id)a3 animated:(BOOL)a4;
- (void)setNetworkConfigurationItemListModuleController:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUNetworkRouterSettingsViewController

- (HUNetworkRouterSettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkRouterSettingsViewController.m", 36, @"%s is unavailable; use %@ instead",
    "-[HUNetworkRouterSettingsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUNetworkRouterSettingsViewController)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = [[HUNetworkRouterSettingsItemManager alloc] initWithHome:v4 delegate:self];

  v9.receiver = self;
  v9.super_class = (Class)HUNetworkRouterSettingsViewController;
  v6 = [(HUItemTableViewController *)&v9 initWithItemManager:v5 tableViewStyle:1];
  if (v6)
  {
    v7 = HULocalizedWiFiString(@"HUNetworkRouterSettingsTitle");
    [(HUNetworkRouterSettingsViewController *)v6 setTitle:v7];
  }
  return v6;
}

- (id)presentNetworkConfigurationSettingsForProfile:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self hu_preloadContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__HUNetworkRouterSettingsViewController_presentNetworkConfigurationSettingsForProfile_animated___block_invoke;
  v11[3] = &unk_1E63853B8;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  objc_super v9 = [v7 flatMap:v11];

  return v9;
}

id __96__HUNetworkRouterSettingsViewController_presentNetworkConfigurationSettingsForProfile_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  v3 = [v2 networkConfigurationItemListModule];
  id v4 = [v3 networkConfigurationGroupItemForProfile:*(void *)(a1 + 40)];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) networkConfigurationItemListModuleController];
    id v6 = [v5 presentNetworkConfigurationSettingsForItem:v4 animated:*(unsigned __int8 *)(a1 + 48)];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (id)presentNetworkRouterSettingsForAccessory:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self hu_preloadContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForAccessory_animated___block_invoke;
  v11[3] = &unk_1E63853B8;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  objc_super v9 = [v7 flatMap:v11];

  return v9;
}

id __91__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForAccessory_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  v3 = [v2 networkRouterServiceItemForAccessory:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(a1 + 32) presentNetworkRouterSettingsForItem:v3 animated:*(unsigned __int8 *)(a1 + 48)];
  }
  else {
  id v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v4;
}

- (id)presentNetworkRouterSettingsForItem:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self hu_preloadContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForItem_animated___block_invoke;
  v11[3] = &unk_1E63853B8;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  objc_super v9 = [v7 flatMap:v11];

  return v9;
}

id __86__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForItem_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  int v3 = [v2 isItemNetworkRouterServiceItem:*(void *)(a1 + 40)];

  if (!v3) {
    goto LABEL_6;
  }
  if (([*(id *)(a1 + 32) _shouldShowNetworkRouterDetails] & 1) == 0) {
    NSLog(&cfstr_AttemptingToDi_1.isa);
  }
  if ([*(id *)(a1 + 32) _shouldShowNetworkRouterDetails])
  {
    id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "_networkRouterDetailsViewControllerClass")), "initWithServiceLikeItem:", *(void *)(a1 + 40));
    [v4 setPresentationDelegate:*(void *)(a1 + 32)];
    v5 = [*(id *)(a1 + 32) navigationController];
    id v6 = objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v4, *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
LABEL_6:
    id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self itemManager];
  v7 = [v6 networkConfigurationItemListModule];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    objc_super v9 = [[HUNetworkConfigurationItemListModuleController alloc] initWithModule:v5];
    [(HUNetworkRouterSettingsViewController *)self setNetworkConfigurationItemListModuleController:v9];

    v10 = [(HUNetworkRouterSettingsViewController *)self networkConfigurationItemListModuleController];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUNetworkRouterSettingsViewController.m", 100, @"Unexpected module %@", v5 object file lineNumber description];

    v10 = 0;
  }

  return v10;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self itemManager];
  int v8 = [v7 isItemNetworkRouterServiceItem:v6];

  if (v8
    || ([(HUItemTableViewController *)self itemManager],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        [v9 homeProtectionItem],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v6 isEqual:v10],
        v10,
        v9,
        v11))
  {
    id v12 = objc_opt_class();
  }
  else
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUNetworkRouterSettingsViewController.m", 110, @"Couldn't find a cell class for item: %@", v6 object file lineNumber description];

    id v12 = 0;
  }

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUNetworkRouterSettingsViewController;
  [(HUItemTableViewController *)&v16 setupCell:v8 forItem:v9 indexPath:a5];
  v10 = [(HUItemTableViewController *)self itemManager];
  int v11 = [v10 isItemNetworkRouterServiceItem:v9];

  if (v11)
  {
    id v12 = v8;
    objc_msgSend(v12, "setAccessoryType:", -[HUNetworkRouterSettingsViewController _shouldShowNetworkRouterDetails](self, "_shouldShowNetworkRouterDetails"));
    [v12 setHideIcon:1];
  }
  else
  {
    BOOL v13 = [(HUItemTableViewController *)self itemManager];
    v14 = [v13 homeProtectionItem];
    int v15 = [v9 isEqual:v14];

    if (v15) {
      [v8 setDelegate:self];
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUNetworkRouterSettingsViewController;
  [(HUItemTableViewController *)&v18 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  id v12 = [(HUItemTableViewController *)self itemManager];
  BOOL v13 = [v12 homeProtectionItem];
  LODWORD(self) = [v11 isEqual:v13];

  if (self)
  {
    id v14 = v10;
    int v15 = [v11 latestResults];
    objc_super v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
    BOOL v17 = [v16 integerValue] == 2;

    [v14 setOn:v17 animated:1];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self itemManager];
  int v11 = [v10 isItemNetworkRouterServiceItem:v9];

  if (v11)
  {
    unsigned __int8 v12 = [(HUNetworkRouterSettingsViewController *)self _shouldShowNetworkRouterDetails];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HUNetworkRouterSettingsViewController;
    unsigned __int8 v12 = [(HUItemTableViewController *)&v15 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }
  BOOL v13 = v12;

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUNetworkRouterSettingsViewController;
  [(HUItemTableViewController *)&v16 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self itemManager];
  int v11 = [v10 isItemNetworkRouterServiceItem:v9];

  if (v11)
  {
    objc_opt_class();
    id v12 = v9;
    if (objc_opt_isKindOfClass()) {
      BOOL v13 = v12;
    }
    else {
      BOOL v13 = 0;
    }
    id v14 = v13;

    id v15 = [(HUNetworkRouterSettingsViewController *)self presentNetworkRouterSettingsForItem:v14 animated:1];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HUNetworkRouterSettingsViewController *)self navigationController];
  id v8 = [v7 viewControllers];
  uint64_t v9 = [v8 indexOfObject:self];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v23 = [(HUNetworkRouterSettingsViewController *)self navigationController];
      v24 = [(HUNetworkRouterSettingsViewController *)self navigationController];
      v25 = [v24 viewControllers];
      int v26 = 138412802;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v25;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@ not in %@ navigation stack: %@", (uint8_t *)&v26, 0x20u);
    }
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  else if (v9 <= 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = v9 - 1;
  }
  id v12 = v6;
  if ([v12 conformsToProtocol:&unk_1F19E7BA8]) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = v13;

  int v15 = [v14 requiresPresentingViewControllerDismissal];
  if (v15) {
    uint64_t v9 = v11;
  }
  objc_super v16 = [(HUNetworkRouterSettingsViewController *)self navigationController];
  BOOL v17 = [(HUNetworkRouterSettingsViewController *)self navigationController];
  objc_super v18 = [v17 viewControllers];
  v19 = [v18 objectAtIndex:v9];
  id v20 = (id)[v16 popToViewController:v19 animated:v4];

  v21 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v21;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(HUNetworkRouterSettingsViewController *)self tableView];
  uint64_t v9 = [v8 indexPathForCell:v7];

  id v10 = [(HUItemTableViewController *)self itemManager];
  uint64_t v11 = [v10 displayedItemAtIndexPath:v9];

  id v12 = [(HUItemTableViewController *)self itemManager];
  BOOL v13 = [v12 homeProtectionItem];
  int v14 = [v11 isEqual:v13];

  if (v14)
  {
    int v15 = [(HUItemTableViewController *)self itemManager];
    objc_super v16 = [v15 home];
    BOOL v17 = objc_msgSend(v16, "hf_updateNetworkProtection:", v4);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__HUNetworkRouterSettingsViewController_switchCell_didTurnOn___block_invoke;
    v20[3] = &unk_1E63899B8;
    id v21 = v7;
    BOOL v22 = v4;
    id v18 = (id)[v17 addFailureBlock:v20];
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUNetworkRouterSettingsViewController.m", 202, @"Invalid item: %@", v11 object file lineNumber description];
  }
}

uint64_t __62__HUNetworkRouterSettingsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
}

- (BOOL)_shouldShowNetworkRouterDetails
{
  return [(HUNetworkRouterSettingsViewController *)self _networkRouterDetailsViewControllerClass] != 0;
}

- (Class)_networkRouterDetailsViewControllerClass
{
  v2 = +[HUViewControllerRegistry sharedInstance];
  int v3 = [v2 viewControllerClassForIdentifier:@"serviceLikeItemDetails"];

  return (Class)v3;
}

- (HUNetworkConfigurationItemListModuleController)networkConfigurationItemListModuleController
{
  return self->_networkConfigurationItemListModuleController;
}

- (void)setNetworkConfigurationItemListModuleController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
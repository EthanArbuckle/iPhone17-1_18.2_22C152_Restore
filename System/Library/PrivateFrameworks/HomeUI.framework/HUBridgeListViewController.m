@interface HUBridgeListViewController
- (BOOL)shouldShowHomeHubWarningHeader;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)_bridgeDetailsViewControllerClass;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUBridgeListViewController)initWithHome:(id)a3;
- (HUBridgeListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUHomeHubHeaderView)homehubHeaderView;
- (id)_presentBridgeSettingsForItem:(id)a3 animated:(BOOL)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)itemTableHeaderView;
- (id)presentBridgeSettingsForAccessory:(id)a3 animated:(BOOL)a4;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)setHomehubHeaderView:(id)a3;
- (void)setShouldShowHomeHubWarningHeader:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUBridgeListViewController

- (HUBridgeListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUBridgeListViewController.m", 32, @"%s is unavailable; use %@ instead",
    "-[HUBridgeListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUBridgeListViewController)initWithHome:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [[HUBridgeListItemManager alloc] initWithHome:v5 delegate:self];
  v20.receiver = self;
  v20.super_class = (Class)HUBridgeListViewController;
  v7 = [(HUItemTableViewController *)&v20 initWithItemManager:v6 tableViewStyle:1];
  if (v7)
  {
    v8 = _HULocalizedStringWithDefaultValue(@"HUBridgeAndResidentListItemTitle", @"HUBridgeAndResidentListItemTitle", 1);
    [(HUBridgeListViewController *)v7 setTitle:v8];

    v9 = [v5 residentDevices];
    v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_7);
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSStringFromSelector(a2);
      uint64_t v13 = [v9 count];
      uint64_t v14 = [v10 count];
      *(_DWORD *)buf = 138413314;
      v22 = v7;
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Total residents: %lu - Reachable (%lu): %@", buf, 0x34u);
    }
    v15 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v16 = [v15 homeManager];
    int v17 = [v16 hasOptedToHH2];

    BOOL v18 = v17 && [v9 count] && objc_msgSend(v10, "count") == 0;
    v7->_shouldShowHomeHubWarningHeader = v18;
  }
  return v7;
}

uint64_t __43__HUBridgeListViewController_initWithHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

- (id)itemTableHeaderView
{
  if ([(HUBridgeListViewController *)self shouldShowHomeHubWarningHeader])
  {
    v3 = [(HUBridgeListViewController *)self homehubHeaderView];

    if (!v3)
    {
      v4 = HULocalizedWiFiString(@"HUBridgeAndResidentListHomeHubWarningHeader");
      id v5 = [[HUHomeHubHeaderView alloc] initWithMessage:v4];
      [(HUBridgeListViewController *)self setHomehubHeaderView:v5];

      v6 = [(HUBridgeListViewController *)self homehubHeaderView];
      [v6 layoutIfNeeded];
    }
    v7 = [(HUBridgeListViewController *)self homehubHeaderView];
  }
  else
  {
    [(HUBridgeListViewController *)self setHomehubHeaderView:0];
    v7 = 0;
  }

  return v7;
}

- (id)presentBridgeSettingsForAccessory:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self hu_preloadContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HUBridgeListViewController_presentBridgeSettingsForAccessory_animated___block_invoke;
  v11[3] = &unk_1E63853B8;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  v9 = [v7 flatMap:v11];

  return v9;
}

id __73__HUBridgeListViewController_presentBridgeSettingsForAccessory_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  v3 = [v2 bridgeItemForAccessory:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(a1 + 32) _presentBridgeSettingsForItem:v3 animated:*(unsigned __int8 *)(a1 + 48)];
  }
  else {
  v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUBridgeListViewController;
  [(HUItemTableViewController *)&v15 setupCell:v8 forItem:v9 indexPath:a5];
  id v10 = v8;
  [v10 setIconDisplayStyle:1];
  v11 = [(HUItemTableViewController *)self itemManager];
  int v12 = [v11 isBridgeItem:v9];

  if (v12)
  {
    objc_msgSend(v10, "setAccessoryType:", -[HUBridgeListViewController _bridgeDetailsViewControllerClass](self, "_bridgeDetailsViewControllerClass") != 0);
    [v10 setHideValue:1];
  }
  else
  {
    BOOL v13 = [(HUItemTableViewController *)self itemManager];
    int v14 = [v13 isResidentDeviceItem:v9];

    if (v14) {
      [v10 setHideIcon:1];
    }
  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  uint64_t v7 = [v5 section];

  id v8 = [v6 displayedSectionIdentifierForSectionIndex:v7];
  LODWORD(v7) = [v8 isEqualToString:@"HUBridgeAndResidentDeviceBridgeSectionIdentifier"];

  return v7
      && [(HUBridgeListViewController *)self _bridgeDetailsViewControllerClass] != 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HUBridgeListViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  id v10 = [(HUBridgeListViewController *)self _presentBridgeSettingsForItem:v9 animated:1];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (Class)_bridgeDetailsViewControllerClass
{
  v2 = +[HUViewControllerRegistry sharedInstance];
  v3 = [v2 viewControllerClassForIdentifier:@"serviceLikeItemDetails"];

  return (Class)v3;
}

- (id)_presentBridgeSettingsForItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self itemManager];
  int v8 = [v7 isBridgeItem:v6];

  if (!v8) {
    goto LABEL_12;
  }
  id v9 = &unk_1F1A3D558;
  id v10 = v6;
  objc_super v11 = v10;
  if (v10)
  {
    if ([v10 conformsToProtocol:v9]) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    BOOL v13 = v11;
    if (v12) {
      goto LABEL_9;
    }
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v16 = NSStringFromProtocol((Protocol *)v9);
    [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v16 file lineNumber description];
  }
  BOOL v13 = 0;
LABEL_9:

  if ([(HUBridgeListViewController *)self _bridgeDetailsViewControllerClass])
  {
    int v17 = objc_msgSend(objc_alloc(-[HUBridgeListViewController _bridgeDetailsViewControllerClass](self, "_bridgeDetailsViewControllerClass")), "initWithServiceLikeItem:", v13);
    [v17 setPresentationDelegate:self];
    BOOL v18 = [(HUBridgeListViewController *)self navigationController];
    v19 = objc_msgSend(v18, "hu_pushPreloadableViewController:animated:", v17, v4);

    goto LABEL_13;
  }

LABEL_12:
  v19 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_13:

  return v19;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = [(HUBridgeListViewController *)self navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  id v6 = (void *)MEMORY[0x1E4F7A0D8];

  return (id)[v6 futureWithNoResult];
}

- (HUHomeHubHeaderView)homehubHeaderView
{
  return self->_homehubHeaderView;
}

- (void)setHomehubHeaderView:(id)a3
{
}

- (BOOL)shouldShowHomeHubWarningHeader
{
  return self->_shouldShowHomeHubWarningHeader;
}

- (void)setShouldShowHomeHubWarningHeader:(BOOL)a3
{
  self->_shouldShowHomeHubWarningHeader = a3;
}

- (void).cxx_destruct
{
}

@end
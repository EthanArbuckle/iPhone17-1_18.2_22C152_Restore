@interface HUMediaServiceTableViewController
- (BOOL)moduleController:(id)a3 shouldDisableItem:(id)a4;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFUserItem)userItem;
- (HUAccessorySettingsItemModuleController)userSettingsItemModuleController;
- (HUMediaServiceItem)mediaServiceItem;
- (HUMediaServiceItemManager)mediaServiceItemManager;
- (HUMediaServiceTableViewController)initWithItem:(id)a3 mediaServiceItem:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)itemModuleControllers;
- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_removeService;
- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6;
- (void)moduleController:(id)a3 presentGroup:(id)a4;
- (void)setUserSettingsItemModuleController:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUMediaServiceTableViewController

- (HUMediaServiceTableViewController)initWithItem:(id)a3 mediaServiceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [HUMediaServiceItemManager alloc];
  v9 = [v6 home];
  v10 = (void *)[v7 copy];
  v11 = [(HUMediaServiceItemManager *)v8 initWithHome:v9 mediaServiceItem:v10 delegate:self];

  v18.receiver = self;
  v18.super_class = (Class)HUMediaServiceTableViewController;
  v12 = [(HUItemTableViewController *)&v18 initWithItemManager:v11 tableViewStyle:1];
  if (v12)
  {
    uint64_t v13 = [v6 copy];
    userItem = v12->_userItem;
    v12->_userItem = (HFUserItem *)v13;

    uint64_t v15 = [v7 copy];
    mediaServiceItem = v12->_mediaServiceItem;
    v12->_mediaServiceItem = (HUMediaServiceItem *)v15;

    objc_storeStrong((id *)&v12->_mediaServiceItemManager, v11);
  }

  return v12;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HUMediaServiceTableViewController;
  [(HUItemTableViewController *)&v6 viewDidLoad];
  v3 = [(HUMediaServiceTableViewController *)self mediaServiceItem];
  v4 = [v3 latestResults];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [(HUMediaServiceTableViewController *)self setTitle:v5];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  v9 = [v8 mediaServiceItem];
  int v10 = [v6 isEqual:v9];

  if (v10) {
    goto LABEL_7;
  }
  v11 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  v12 = [v11 updateListeningHistoryItem];
  int v13 = [v6 isEqual:v12];

  if (v13) {
    goto LABEL_7;
  }
  v14 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  uint64_t v15 = [v14 updateListeningHistoryFooterItem];
  int v16 = [v6 isEqual:v15];

  if (v16) {
    goto LABEL_7;
  }
  v17 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  objc_super v18 = [v17 removeItem];
  int v19 = [v6 isEqual:v18];

  if (v19) {
    goto LABEL_7;
  }
  v20 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  v21 = [v20 reconnectItem];
  int v22 = [v6 isEqual:v21];

  if (v22
    || ([(HUMediaServiceTableViewController *)self mediaServiceItemManager],
        v23 = objc_claimAutoreleasedReturnValue(),
        [v23 reconnectTitleItem],
        v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = [v6 isEqual:v24],
        v24,
        v23,
        v25))
  {
LABEL_7:
    uint64_t v26 = objc_opt_class();
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)HUMediaServiceTableViewController;
    uint64_t v26 = [(HUItemTableViewController *)&v29 cellClassForItem:v6 indexPath:v7];
  }
  v27 = (void *)v26;

  return (Class)v27;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HUMediaServiceTableViewController;
  [(HUItemTableViewController *)&v31 setupCell:v8 forItem:v9 indexPath:a5];
  int v10 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  v11 = [v10 updateListeningHistoryItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = v8;
    [v13 setDelegate:self];
    [v13 setSelectionStyle:0];
  }
  v14 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  uint64_t v15 = [v14 removeItem];
  int v16 = [v9 isEqual:v15];

  if (v16)
  {
    id v17 = v8;
    [v17 setDestructive:1];
    [v17 setUseFullWidthSeparator:0];
  }
  objc_super v18 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  int v19 = [v18 reconnectItem];
  int v20 = [v9 isEqual:v19];

  if (v20)
  {
    id v21 = v8;
    [v21 setTitleColorFollowsTintColor:1];
    [v21 setHideIcon:1];
  }
  int v22 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  v23 = [v22 reconnectTitleItem];
  int v24 = [v9 isEqual:v23];

  if (v24)
  {
    id v25 = v8;
    uint64_t v26 = [v9 latestResults];
    v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    v28 = [v25 textLabel];
    [v28 setText:v27];

    objc_super v29 = [v25 textLabel];
    [v29 setNumberOfLines:0];

    v30 = [MEMORY[0x1E4F428B8] clearColor];
    [v25 setBackgroundColor:v30];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUMediaServiceTableViewController;
  [(HUItemTableViewController *)&v26 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  int v12 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  id v13 = [v12 updateListeningHistoryItem];
  int v14 = [v11 isEqual:v13];

  if (v14)
  {
    uint64_t v15 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
    int v16 = [v15 mediaServiceItem];

    id v17 = [v16 mediaService];
    uint64_t v18 = [v17 updateListeningHistoryEnabled];

    [v10 setOn:v18 animated:1];
  }
  int v19 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  int v20 = [v19 removeItem];
  int v21 = [v11 isEqual:v20];

  if (v21)
  {
    id v22 = v10;
    v23 = [v11 latestResults];
    int v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    id v25 = [v22 textLabel];

    [v25 setText:v24];
  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [(id)v8 displayedItemAtIndexPath:v6];

  v14.receiver = self;
  v14.super_class = (Class)HUMediaServiceTableViewController;
  LOBYTE(v8) = [(HUItemTableViewController *)&v14 shouldHideSeparatorsForCell:v7 indexPath:v6];

  if (v8)
  {
    char v10 = 1;
  }
  else
  {
    id v11 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
    int v12 = [v11 updateListeningHistoryItem];
    char v10 = [v9 isEqual:v12];
  }
  return v10;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  v4 = [(HUItemTableViewController *)self itemManager];
  v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUMediaServiceUpdateListeningHistoryFooterSectionIdentifier"];

  return v6;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v5 = [(HUItemTableViewController *)self itemManager];
  char v6 = [v5 displayedSectionIdentifierForSectionIndex:a4];

  double v7 = 0.01;
  if (([v6 isEqualToString:@"HUMediaServiceUpdateListeningHistorySectionIdentifier"] & 1) == 0
    && ([v6 isEqualToString:@"HUMediaServiceReconnectServiceTitleSectionIdentifier"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"HUMediaServiceAccountInfoSectionIdentifier"]) {
      double v7 = 10.0;
    }
    else {
      double v7 = *MEMORY[0x1E4F43D18];
    }
  }

  return v7;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  v4 = [(HUItemTableViewController *)self itemManager];
  v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];

  if ([v5 isEqualToString:@"HUMediaServiceUpdateListeningHistorySectionIdentifier"]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 isEqualToString:@"HUMediaServiceUpdateListeningHistoryFooterSectionIdentifier"];
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v46.receiver = self;
  v46.super_class = (Class)HUMediaServiceTableViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v46 tableView:v7 didSelectRowAtIndexPath:v6];
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  [v7 deselectRowAtIndexPath:v6 animated:1];
  char v10 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  id v11 = [v10 removeItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = [(HUMediaServiceTableViewController *)self mediaServiceItem];
    v43 = [v13 home];

    objc_super v14 = [(HUMediaServiceTableViewController *)self mediaServiceItem];
    uint64_t v15 = [v14 mediaService];
    int v16 = [v15 serviceName];

    v23 = HULocalizedStringWithFormat(@"HUMediaServiceRemoveServiceAlertTitle", @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    v42 = [v43 name];
    v44 = HULocalizedStringWithFormat(@"HUMediaServiceRemoveServiceAlertConfirmationMessage", @"%@%@", v24, v25, v26, v27, v28, v29, (uint64_t)v16);

    v30 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
    objc_super v31 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
    v32 = [(UITableViewController *)self hu_actionSheetWithTitle:v23 message:v44 indexPath:v6];
    v33 = [MEMORY[0x1E4F42720] actionWithTitle:v30 style:1 handler:0];
    [v32 addAction:v33];

    v34 = v43;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __71__HUMediaServiceTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v45[3] = &unk_1E6385188;
    v45[4] = self;
    v35 = [MEMORY[0x1E4F42720] actionWithTitle:v31 style:2 handler:v45];
    [v32 addAction:v35];

    [(HUMediaServiceTableViewController *)self presentViewController:v32 animated:1 completion:0];
LABEL_5:

    goto LABEL_6;
  }
  v36 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  v37 = [v36 reconnectItem];
  int v38 = [v9 isEqual:v37];

  if (v38)
  {
    v39 = [(HUMediaServiceTableViewController *)self mediaServiceItem];
    v40 = [v39 mediaService];
    v34 = [v40 bundleIdentifier];

    int v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_appStoreURLForBundleIdentifier:", v34);
    v23 = [MEMORY[0x1E4F69378] sharedInstance];
    id v41 = (id)[v23 openURL:v16];
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __71__HUMediaServiceTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeService];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUMediaServiceTableViewController;
  [(HUItemTableViewController *)&v10 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [MEMORY[0x1E4F428B8] clearColor];
    [v8 setBackgroundColor:v9];
  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v4 = [(HUMediaServiceTableViewController *)self userSettingsItemModuleController];
  if (!v4)
  {
    v5 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
    id v6 = [v5 userSettingsItemModule];

    if (!v6) {
      goto LABEL_5;
    }
    id v7 = [HUAccessorySettingsItemModuleController alloc];
    v4 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
    id v8 = [v4 userSettingsItemModule];
    id v9 = [(HUAccessorySettingsItemModuleController *)v7 initWithModule:v8 delegate:self];
    [(HUMediaServiceTableViewController *)self setUserSettingsItemModuleController:v9];
  }
LABEL_5:
  objc_super v10 = [(HUMediaServiceTableViewController *)self userSettingsItemModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v10);

  return v3;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUMediaServiceTableViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(HUItemTableViewController *)self itemManager];
  objc_super v10 = [v9 displayedItemAtIndexPath:v8];

  id v11 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  int v12 = [v11 updateListeningHistoryItem];
  int v13 = [v10 isEqual:v12];

  if (v13)
  {
    objc_super v14 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
    uint64_t v15 = [v14 mediaServiceItem];

    int v16 = objc_opt_new();
    uint64_t v17 = [NSNumber numberWithBool:v4];
    objc_msgSend(v16, "na_safeSetObject:forKey:", v17, &unk_1F19B53C0);

    uint64_t v18 = [MEMORY[0x1E4F692B8] sharedManager];
    uint64_t v19 = [v15 mediaService];
    uint64_t v20 = [v15 home];
    uint64_t v21 = [v18 updateProperty:v19 forHome:v20 withOptions:v16];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke;
    v23[3] = &unk_1E63899B8;
    id v24 = v6;
    BOOL v25 = v4;
    id v22 = (id)[v21 addFailureBlock:v23];
  }
}

void __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke_2;
  block[3] = &unk_1E6390870;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F69110] sharedHandler];
    [v2 handleError:*(void *)(a1 + 32)];
  }
  id v3 = *(void **)(a1 + 40);
  BOOL v4 = *(unsigned char *)(a1 + 48) == 0;

  return [v3 setOn:v4 animated:1];
}

- (void)moduleController:(id)a3 presentGroup:(id)a4
{
  id v15 = a4;
  v5 = [v15 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68A08];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  if (!v7)
  {

    goto LABEL_5;
  }
  char v8 = (void *)v7;
  id v9 = [v15 latestResults];
  objc_super v10 = [v9 objectForKeyedSubscript:v6];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
LABEL_5:
    int v12 = +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:v15];
    int v13 = [(HUMediaServiceTableViewController *)self navigationController];
    id v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);
  }
}

- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  id v8 = a4;
  id v9 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__HUMediaServiceTableViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke;
  v12[3] = &unk_1E6386018;
  id v10 = v9;
  id v13 = v10;
  [(HUMediaServiceTableViewController *)self presentViewController:v8 animated:v6 completion:v12];

  return v10;
}

uint64_t __107__HUMediaServiceTableViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v11)
  {
    id v13 = NSStringFromSelector(a2);
    NSLog(&cfstr_CalledWithNoSe.isa, v13);
  }
  id v14 = [v11 settingKeyPath];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F68550]];

  if (v15) {
    BOOL v16 = !v7;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    uint64_t v17 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
    uint64_t v18 = [v17 userSettingsItemModule];
    uint64_t v19 = [v18 accessorySettingsItemProvider];
    uint64_t v20 = [v19 homeKitSettingsVendor];
    uint64_t v21 = [v20 settings];

    v36 = objc_msgSend(v21, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68570]);
    id v22 = [v36 value];
    int v23 = [v22 BOOLValue];

    id v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v23;
      _os_log_debug_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEBUG, "isVoiceIDSetup = %{BOOL}d", (uint8_t *)location, 8u);
    }

    if ((v23 & 1) == 0)
    {
      BOOL v25 = (void *)MEMORY[0x1E4F42728];
      uint64_t v26 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Title", @"HUPlaybackInfluencesActivation_Alert_Title", 1);
      uint64_t v27 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Description", @"HUPlaybackInfluencesActivation_Alert_Description", 1);
      uint64_t v28 = [v25 alertControllerWithTitle:v26 message:v27 preferredStyle:1];

      uint64_t v29 = (void *)MEMORY[0x1E4F42720];
      v30 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Action_NotNow", @"HUPlaybackInfluencesActivation_Alert_Action_NotNow", 1);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke;
      v41[3] = &unk_1E638B538;
      id v42 = v21;
      v43 = self;
      SEL v45 = a2;
      id v31 = v12;
      id v44 = v31;
      v32 = [v29 actionWithTitle:v30 style:1 handler:v41];

      objc_initWeak(location, self);
      v33 = (void *)MEMORY[0x1E4F42720];
      v34 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice", @"HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice", 1);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_71;
      v38[3] = &unk_1E638B560;
      objc_copyWeak(&v40, location);
      id v39 = v31;
      v35 = [v33 actionWithTitle:v34 style:0 handler:v38];

      [v28 addAction:v32];
      [v28 addAction:v35];
      [(HUMediaServiceTableViewController *)self presentViewController:v28 animated:1 completion:0];

      objc_destroyWeak(&v40);
      objc_destroyWeak(location);
    }
  }
  (*((void (**)(id, void))v12 + 2))(v12, 0);
}

void __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(location[0]) = 0;
    _os_log_debug_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEBUG, "User tapped Not Now Action", (uint8_t *)location, 2u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68550]);
  objc_initWeak(location, *(id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_65;
  v7[3] = &unk_1E638B510;
  id v6 = v5;
  id v8 = v6;
  objc_copyWeak(v9, location);
  v9[1] = *(id *)(a1 + 56);
  [v6 updateValue:MEMORY[0x1E4F1CC28] completionHandler:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_destroyWeak(v9);

  objc_destroyWeak(location);
}

void __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained mediaServiceItemManager];
    uint64_t v7 = [v6 sectionIndexForDisplayedSectionIdentifier:*MEMORY[0x1E4F68548]];

    id v8 = [WeakRetained itemManager];
    id v9 = (id)[v8 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];

    id v10 = [WeakRetained itemManager];
    LODWORD(v8) = [v10 diffableDataSourceDisabled];

    if (v8)
    {
      id v11 = [WeakRetained tableView];
      id v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
      [v11 reloadSections:v12 withRowAnimation:5];
    }
    else
    {
      id v13 = [WeakRetained itemManager];
      id v11 = [v13 itemSectionForSectionIndex:v7];

      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v12 = [WeakRetained itemManager];
      int v15 = v11;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      [v12 reloadUIRepresentationForSections:v14 withAnimation:0];
    }
    goto LABEL_9;
  }
  WeakRetained = HFLogForCategory();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1BE345000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Error [%@] setting value for setting [%@] to NO", buf, 0x16u);
  }
LABEL_10:
}

void __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_71(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_debug_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEBUG, "User tapped Identify Voice Action", v9, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [WeakRetained mediaServiceItem];
  id v6 = [v5 home];
  id v10 = @"OnboardingDisplayOption_OnboardingFromUserInput";
  v11[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = +[HUHomeFeatureOnboardingUtilities home:v6 onboardIdentifyVoiceFromPresentingViewController:WeakRetained usageOptions:v7];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
}

- (BOOL)moduleController:(id)a3 shouldDisableItem:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F69758];
  id v6 = a4;
  int v7 = [v5 isAMac];
  id v8 = [v6 settingKeyPath];

  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F68550]];
  if (!v7)
  {
    if (v9)
    {
      id v11 = [(HUMediaServiceTableViewController *)self userItem];
      id v12 = [v11 user];
      id v13 = [(HUMediaServiceTableViewController *)self userItem];
      id v14 = [v13 home];
      int v15 = [v14 currentUser];
      int v10 = [v12 isEqual:v15] ^ 1;

      return v10;
    }
LABEL_6:
    LOBYTE(v10) = 0;
    return v10;
  }
  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v21, 0x16u);
  }

  int v9 = [v7 absoluteString];
  int v10 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
  id v11 = [v10 absoluteString];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(HUMediaServiceTableViewController *)self navigationController];
    id v14 = (void *)v13;
    if (v13) {
      int v15 = (HUMediaServiceTableViewController *)v13;
    }
    else {
      int v15 = self;
    }
    BOOL v16 = v15;

    id v17 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B10]];
    __int16 v18 = [v17 splashController];
    [v18 setDisplayDeviceType:6];

    [v17 setPresentingViewController:v16];
    [v17 present];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F69378] sharedInstance];
    id v19 = (id)[v17 openURL:v7];
  }

  return 0;
}

- (void)_removeService
{
  id v3 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  uint64_t v4 = [(HUMediaServiceTableViewController *)self mediaServiceItemManager];
  uint64_t v5 = [v4 removeItem];
  id v6 = [v3 indexPathForItem:v5];

  id v7 = [(HUMediaServiceTableViewController *)self tableView];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  int v9 = [MEMORY[0x1E4F692B8] sharedManager];
  int v10 = [(HUMediaServiceTableViewController *)self mediaServiceItem];
  id v11 = [v10 mediaService];
  int v12 = [(HUMediaServiceTableViewController *)self mediaServiceItem];
  uint64_t v13 = [v12 home];
  id v14 = [v9 removeMediaService:v11 forHome:v13];

  [v8 setShowSpinner:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__HUMediaServiceTableViewController__removeService__block_invoke;
  v17[3] = &unk_1E6384CE0;
  id v18 = v8;
  id v19 = self;
  id v15 = v8;
  id v16 = (id)[v14 addCompletionBlock:v17];
}

void __51__HUMediaServiceTableViewController__removeService__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HUMediaServiceTableViewController__removeService__block_invoke_2;
  block[3] = &unk_1E6386340;
  id v9 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__HUMediaServiceTableViewController__removeService__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setShowSpinner:0];
    id v3 = [MEMORY[0x1E4F69110] sharedHandler];
    [v3 handleError:*(void *)(a1 + 32)];
  }
  else
  {
    id v3 = [*(id *)(a1 + 48) navigationController];
    id v2 = (id)[v3 popViewControllerAnimated:1];
  }
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUMediaServiceItem)mediaServiceItem
{
  return self->_mediaServiceItem;
}

- (HUMediaServiceItemManager)mediaServiceItemManager
{
  return self->_mediaServiceItemManager;
}

- (HUAccessorySettingsItemModuleController)userSettingsItemModuleController
{
  return self->_userSettingsItemModuleController;
}

- (void)setUserSettingsItemModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_mediaServiceItemManager, 0);
  objc_storeStrong((id *)&self->_mediaServiceItem, 0);

  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
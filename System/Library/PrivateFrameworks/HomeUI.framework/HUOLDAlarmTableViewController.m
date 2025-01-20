@interface HUOLDAlarmTableViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared;
- (BOOL)isAccessoryControllable;
- (BOOL)isAlarmsSettingReady;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (CGSize)preferredContentSize;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUHomePodAlarmItemModuleController)alarmModuleController;
- (HUOLDAlarmTableViewController)initWithMediaProfileContainer:(id)a3;
- (HUPresentationDelegate)presentationDelegate;
- (UIBarButtonItem)doneButtonItem;
- (_UIContentUnavailableView)noItemsView;
- (double)heightForFooterInTableView:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)backgroundView;
- (id)editViewControllerForAlarmItem:(id)a3;
- (id)itemModuleControllers;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_discernReachabilityForAccessory:(id)a3;
- (void)_editDoneAction:(id)a3;
- (void)_layoutNoItemsLabel;
- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3;
- (void)_updateAccessoryControllable:(BOOL)a3 alarmsSettingReady:(BOOL)a4;
- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4 forMediaProfile:(id)a5;
- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4 forMediaProfile:(id)a5;
- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4 forMediaProfile:(id)a5;
- (void)alarmEditControllerDidCancel:(id)a3;
- (void)alarmEditControllerGettingDismissed:(id)a3;
- (void)alarmItemModuleController:(id)a3 didSelectAlarmItem:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)mobileTimerAdapterDidUpdateReadiness:(id)a3;
- (void)presentAddNewAlarmViewController;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAlarmModuleController:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNoItemsView:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUOLDAlarmTableViewController

- (HUOLDAlarmTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HUOLDAlarmTableViewController.m", 62, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F691C0]) initWithDelegate:self mediaProfileContainer:v6];
  v32.receiver = self;
  v32.super_class = (Class)HUOLDAlarmTableViewController;
  v8 = [(HUItemTableViewController *)&v32 initWithItemManager:v7 tableViewStyle:2];
  if (v8)
  {
    v9 = [HUHomePodAlarmItemModuleController alloc];
    v10 = [v7 alarmItemModule];
    uint64_t v11 = [(HUHomePodAlarmItemModuleController *)v9 initWithModule:v10];
    alarmModuleController = v8->_alarmModuleController;
    v8->_alarmModuleController = (HUHomePodAlarmItemModuleController *)v11;

    [(HUHomePodAlarmItemModuleController *)v8->_alarmModuleController setDelegate:v8];
    v13 = objc_msgSend(v6, "hf_settingsAdapterManager");
    v14 = [v13 adapterForIdentifier:*MEMORY[0x1E4F67FB8]];
    [v14 addObserver:v8];

    v15 = [MEMORY[0x1E4F42A80] imageNamed:@"BarAlarmTemplate"];
    v16 = [(HUOLDAlarmTableViewController *)v8 tabBarItem];
    [v16 setImage:v15];

    v17 = [MEMORY[0x1E4F42A80] imageNamed:@"BarAlarmOn"];
    v18 = [(HUOLDAlarmTableViewController *)v8 tabBarItem];
    [v18 setSelectedImage:v17];

    v19 = objc_msgSend(v6, "hf_serviceNameComponents");
    v20 = [v19 serviceName];
    v27 = HULocalizedStringWithFormat(@"HUAlarmClock", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

    [(HUOLDAlarmTableViewController *)v8 setTitle:v27];
    [(HUTableViewController *)v8 setSectionContentInsetFollowsLayoutMargins:0];
    [(HUItemTableViewController *)v8 setWantsPreferredContentSize:1];
    id v28 = (id)[v7 reloadAndUpdateAllItemsFromSenderSelector:a2];
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a3);
    [(HUOLDAlarmTableViewController *)v8 _discernReachabilityForAccessory:0];
    v29 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v29 addAccessoryObserver:v8];
  }
  return v8;
}

- (id)itemModuleControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUOLDAlarmTableViewController *)self alarmModuleController];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUItemTableViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(HUOLDAlarmTableViewController *)self _numberOfItemsDidChangeAnimated:v3];
}

- (CGSize)preferredContentSize
{
  v2 = [(HUOLDAlarmTableViewController *)self tableView];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HUOLDAlarmTableViewController;
  [(HUItemTableViewController *)&v14 viewDidLayoutSubviews];
  double v3 = [(HUOLDAlarmTableViewController *)self tableView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  MTUIMainScreenScale();
  double v11 = -1.0 / v10;
  v12 = [(HUOLDAlarmTableViewController *)self tableView];
  objc_msgSend(v12, "setContentInset:", v11, v5, v7, v9);

  v13 = [(HUOLDAlarmTableViewController *)self noItemsView];

  if (v13) {
    [(HUOLDAlarmTableViewController *)self _layoutNoItemsLabel];
  }
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)HUOLDAlarmTableViewController;
  [(HUItemTableViewController *)&v19 viewDidLoad];
  double v3 = [(HUOLDAlarmTableViewController *)self tableView];
  [v3 setAllowsSelectionDuringEditing:1];

  double v4 = [(HUOLDAlarmTableViewController *)self tableView];
  [v4 setAllowsSelection:1];

  double v5 = [(HUOLDAlarmTableViewController *)self tableView];
  [v5 _setMarginWidth:1.0];

  double v6 = [(HUOLDAlarmTableViewController *)self tableView];
  [v6 setLayoutMarginsFollowReadableWidth:1];

  double v7 = [(HUOLDAlarmTableViewController *)self tableView];
  [v7 setEstimatedRowHeight:88.0];

  double v8 = *MEMORY[0x1E4F43D18];
  double v9 = [(HUOLDAlarmTableViewController *)self tableView];
  [v9 setRowHeight:v8];

  double v10 = [(HUOLDAlarmTableViewController *)self tableView];
  [v10 setSectionFooterHeight:0.0];

  double v11 = [(HUOLDAlarmTableViewController *)self tableView];
  [v11 setSeparatorStyle:0];

  v12 = [MEMORY[0x1E4F428B8] clearColor];
  v13 = [(HUOLDAlarmTableViewController *)self tableView];
  [v13 setBackgroundColor:v12];

  objc_super v14 = [(HUOLDAlarmTableViewController *)self tableView];
  [v14 _setTopPadding:0.0];

  v15 = [(HUOLDAlarmTableViewController *)self tableView];
  [v15 _setBottomPadding:0.0];

  v16 = [(HUOLDAlarmTableViewController *)self view];
  [v16 setClipsToBounds:1];

  v17 = [(HUOLDAlarmTableViewController *)self tableView];
  v18 = [v17 layer];
  [v18 setCornerRadius:10.0];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v5 = [(HUItemTableViewController *)self itemManager];
  double v6 = [v5 titleForSection:a4];

  if (v6) {
    double v7 = *MEMORY[0x1E4F43D18];
  }
  else {
    double v7 = 8.0;
  }

  return v7;
}

- (double)heightForFooterInTableView:(id)a3
{
  return 10.0;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentAddNewAlarmViewController
{
  double v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "adding new alarm", v5, 2u);
  }

  double v4 = [(HUOLDAlarmTableViewController *)self editViewControllerForAlarmItem:0];
  [(HUOLDAlarmTableViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)alarmItemModuleController:(id)a3 didSelectAlarmItem:(id)a4
{
  id v5 = [(HUOLDAlarmTableViewController *)self editViewControllerForAlarmItem:a4];
  [(HUOLDAlarmTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (id)editViewControllerForAlarmItem:(id)a3
{
  id v4 = a3;
  id v5 = [HUAlarmEditViewController alloc];
  double v6 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
  double v7 = [v4 alarm];

  double v8 = [(HUAlarmEditViewController *)v5 initWithMediaProfileContainer:v6 alarm:v7];
  double v9 = [(HUOLDAlarmTableViewController *)self alarmItemManager];
  double v10 = [v9 mediaProfileContainer];
  double v11 = objc_msgSend(v10, "hf_appleMusicCurrentLoggedInAccountDSID");
  [(HUAlarmEditViewController *)v8 setLoggedInAppleMusicAccountDSID:v11];

  [(HUAlarmEditViewController *)v8 setDelegate:self];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
    [v12 setOverrideUserInterfaceStyle:2];
  }
  v13 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsBackgroundColor");
  objc_super v14 = [v12 view];
  [v14 setBackgroundColor:v13];

  return v12;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__HUOLDAlarmTableViewController_dismissViewControllerAnimated_completion___block_invoke;
  v8[3] = &unk_1E63862A0;
  objc_copyWeak(&v9, &location);
  v7.receiver = self;
  v7.super_class = (Class)HUOLDAlarmTableViewController;
  [(HUOLDAlarmTableViewController *)&v7 dismissViewControllerAnimated:v4 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__HUOLDAlarmTableViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tableView];
  [v1 setUserInteractionEnabled:1];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (HUIsVeryWidePhoneSize() && HUIsPhoneIdiom()) {
    [v8 setModalPresentationStyle:2];
  }
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__HUOLDAlarmTableViewController_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E63862C8;
  objc_copyWeak(&v14, &location);
  id v10 = v9;
  id v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)HUOLDAlarmTableViewController;
  [(HUOLDAlarmTableViewController *)&v11 presentViewController:v8 animated:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__HUOLDAlarmTableViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained tableView];
  [v2 setUserInteractionEnabled:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  if ([(HUOLDAlarmTableViewController *)self isAccessoryControllable])
  {
    v7.receiver = self;
    v7.super_class = (Class)HUOLDAlarmTableViewController;
    id v5 = [(HUItemTableViewController *)&v7 numberOfSectionsInTableView:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (int64_t)v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1 && a5)
  {
    id v7 = a5;
    id v8 = [(HUOLDAlarmTableViewController *)self alarmItemManager];
    id v14 = [v8 displayedItemAtIndexPath:v7];

    id v9 = [v14 alarm];
    id v10 = [(HUOLDAlarmTableViewController *)self alarmItemManager];
    objc_super v11 = [v10 alarmItemModule];
    v12 = [v11 mobileTimerAdapterForAlarmItem:v14];
    id v13 = (id)[v12 removeAlarm:v9];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(HUOLDAlarmTableViewController *)self alarmModuleController];
  unsigned int v5 = [v4 allowsCellSelection];

  return v5;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUOLDAlarmTableViewController;
  [(HUItemTableViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUOLDAlarmTableViewController *)self _numberOfItemsDidChangeAnimated:[(HUOLDAlarmTableViewController *)self isViewLoaded]];
}

- (void)alarmEditControllerDidCancel:(id)a3
{
}

- (void)alarmEditControllerGettingDismissed:(id)a3
{
  id v3 = [(HUOLDAlarmTableViewController *)self tableView];
  [v3 setUserInteractionEnabled:1];
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4 forMediaProfile:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    objc_super v11 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
    v12 = [v11 mediaProfiles];
    id v10 = [v12 anyObject];
  }
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315906;
    objc_super v19 = "-[HUOLDAlarmTableViewController alarmEditController:didAddAlarm:forMediaProfile:]";
    __int16 v20 = 2112;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@): Adding alarm %@ to profile %@", (uint8_t *)&v18, 0x2Au);
  }

  id v14 = [(HUOLDAlarmTableViewController *)self alarmItemManager];
  v15 = [v14 alarmItemModule];
  v16 = [v15 mobileTimerAdapterForMediaProfile:v10];
  id v17 = (id)[v16 addAlarm:v9];

  [(HUOLDAlarmTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4 forMediaProfile:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    objc_super v11 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
    v12 = [v11 mediaProfiles];
    id v10 = [v12 anyObject];
  }
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315906;
    objc_super v19 = "-[HUOLDAlarmTableViewController alarmEditController:didEditAlarm:forMediaProfile:]";
    __int16 v20 = 2112;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@): Editing alarm %@ for profile %@", (uint8_t *)&v18, 0x2Au);
  }

  id v14 = [(HUOLDAlarmTableViewController *)self alarmItemManager];
  v15 = [v14 alarmItemModule];
  v16 = [v15 mobileTimerAdapterForMediaProfile:v10];
  id v17 = (id)[v16 updateAlarm:v9];

  [(HUOLDAlarmTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4 forMediaProfile:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    objc_super v11 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
    v12 = [v11 mediaProfiles];
    id v10 = [v12 anyObject];
  }
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315906;
    objc_super v19 = "-[HUOLDAlarmTableViewController alarmEditController:didDeleteAlarm:forMediaProfile:]";
    __int16 v20 = 2112;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@): Deleting alarm %@ from profile %@", (uint8_t *)&v18, 0x2Au);
  }

  id v14 = [(HUOLDAlarmTableViewController *)self alarmItemManager];
  v15 = [v14 alarmItemModule];
  v16 = [v15 mobileTimerAdapterForMediaProfile:v10];
  id v17 = (id)[v16 removeAlarm:v9];

  [(HUOLDAlarmTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  v7.receiver = self;
  v7.super_class = (Class)HUOLDAlarmTableViewController;
  [(HUOLDAlarmTableViewController *)&v7 setEditing:v5 animated:v4];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)_editDoneAction:(id)a3
{
}

- (id)backgroundView
{
  id v3 = [(HUOLDAlarmTableViewController *)self tableView];
  BOOL v4 = [v3 backgroundView];

  if (!v4)
  {
    BOOL v4 = objc_opt_new();
    BOOL v5 = [(HUOLDAlarmTableViewController *)self tableView];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");

    BOOL v6 = [(HUOLDAlarmTableViewController *)self tableView];
    [v6 setBackgroundView:v4];
  }

  return v4;
}

- (void)_layoutNoItemsLabel
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HUOLDAlarmTableViewController *)self backgroundView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(HUOLDAlarmTableViewController *)self noItemsView];
  [v8 frame];

  if (v5 <= v7) {
    double v9 = v7;
  }
  else {
    double v9 = v5;
  }
  if (v5 <= v7) {
    double v10 = v5;
  }
  else {
    double v10 = v7;
  }
  MTUIRoundToPixel();
  double v12 = v11;
  MTUIRoundToPixel();
  double v14 = v13;
  v15 = [(HUOLDAlarmTableViewController *)self noItemsView];
  objc_msgSend(v15, "setFrame:", v12, v14, v9, v10);

  v16 = [(HUOLDAlarmTableViewController *)self noItemsView];
  id v17 = [v16 message];

  if (v17)
  {
    int v18 = objc_opt_new();
    [v18 setAlignment:1];
    LODWORD(v19) = 1.0;
    [v18 setHyphenationFactor:v19];
    [v18 setLineBreakMode:0];
    v28[0] = *MEMORY[0x1E4F42508];
    __int16 v20 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v28[1] = *MEMORY[0x1E4F42540];
    v29[0] = v20;
    v29[1] = v18;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v23 = [(HUOLDAlarmTableViewController *)self noItemsView];
    __int16 v24 = [v23 message];
    id v25 = (void *)[v22 initWithString:v24 attributes:v21];
    uint64_t v26 = [(HUOLDAlarmTableViewController *)self noItemsView];
    v27 = [v26 _messageLabel];
    [v27 setAttributedText:v25];
  }
}

- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(HUItemTableViewController *)self itemManager];
  double v6 = [v5 allDisplayedItems];
  uint64_t v7 = [v6 count];

  if ([(HUOLDAlarmTableViewController *)self isAccessoryControllable])
  {
    BOOL v8 = [(HUOLDAlarmTableViewController *)self isAlarmsSettingReady];
    if (v7) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v3;
    }
    BOOL v10 = v8 && v7 != 0;
    if (v8) {
      BOOL v3 = v9;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  double v11 = [(HUOLDAlarmTableViewController *)self noItemsView];

  if (v11)
  {
    double v12 = [(HUOLDAlarmTableViewController *)self noItemsView];
    [v12 removeFromSuperview];

    [(HUOLDAlarmTableViewController *)self setNoItemsView:0];
  }
  if (!v10 && [(HUOLDAlarmTableViewController *)self isViewLoaded])
  {
    double v13 = _HULocalizedStringWithDefaultValue(@"HUNoAlarms", @"HUNoAlarms", 1);
    id v14 = objc_alloc(MEMORY[0x1E4F43120]);
    v15 = objc_msgSend(v14, "initWithFrame:title:style:includeBackdrop:", v13, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUOLDAlarmTableViewController *)self setNoItemsView:v15];

    if ([(HUOLDAlarmTableViewController *)self isAlarmsSettingReady])
    {
      if ([(HUOLDAlarmTableViewController *)self isAccessoryControllable])
      {
LABEL_20:
        v30 = [(HUOLDAlarmTableViewController *)self noItemsView];
        [v30 setVibrantOptions:0];

        v31 = [(HUOLDAlarmTableViewController *)self noItemsView];
        [v31 setUserInteractionEnabled:0];

        [(HUOLDAlarmTableViewController *)self _layoutNoItemsLabel];
        objc_super v32 = [(HUOLDAlarmTableViewController *)self backgroundView];
        v33 = [(HUOLDAlarmTableViewController *)self noItemsView];
        [v32 addSubview:v33];

        goto LABEL_21;
      }
      v16 = _HULocalizedStringWithDefaultValue(@"HUHomePodNotReachable", @"HUHomePodNotReachable", 1);
      id v17 = [(HUOLDAlarmTableViewController *)self noItemsView];
      [v17 setTitle:v16];

      int v18 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
      double v19 = objc_msgSend(v18, "hf_categoryLowercaseLocalizedDescription");
      uint64_t v26 = HULocalizedStringWithFormat(@"HUHomePodAlarmsUnavailableExplanation", @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      v27 = [(HUOLDAlarmTableViewController *)self noItemsView];
      [v27 setMessage:v26];
    }
    else
    {
      id v28 = _HULocalizedStringWithDefaultValue(@"HUHomePodAlarmsSettingNotReadyTitle", @"HUHomePodAlarmsSettingNotReadyTitle", 1);
      v29 = [(HUOLDAlarmTableViewController *)self noItemsView];
      [v29 setTitle:v28];

      int v18 = [(HUOLDAlarmTableViewController *)self noItemsView];
      [v18 setMessage:0];
    }

    goto LABEL_20;
  }
LABEL_21:
  v34 = [(HUOLDAlarmTableViewController *)self tableView];
  [v34 setSeparatorStyle:v10];

  double v35 = 0.2;
  v36[1] = 3221225472;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[2] = __65__HUOLDAlarmTableViewController__numberOfItemsDidChangeAnimated___block_invoke;
  v36[3] = &unk_1E6385A70;
  if (!v3) {
    double v35 = 0.0;
  }
  v36[4] = self;
  BOOL v37 = v10;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v36 animations:v35];
}

void __65__HUOLDAlarmTableViewController__numberOfItemsDidChangeAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) noItemsView];
  [v2 setAlpha:v1];
}

- (void)_discernReachabilityForAccessory:(id)a3
{
  id v18 = a3;
  if (!v18) {
    goto LABEL_3;
  }
  double v4 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
  double v5 = [v4 accessories];
  int v6 = [v5 containsObject:v18];

  uint64_t v7 = v18;
  if (v6)
  {
LABEL_3:
    BOOL v8 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
    BOOL v9 = [v8 settings];
    char v10 = [v9 isControllable];

    if (v10)
    {
      BOOL v11 = 1;
    }
    else
    {
      double v12 = objc_msgSend(v8, "hf_backingAccessory");
      double v13 = objc_msgSend(v12, "hf_siriEndpointProfile");
      BOOL v11 = v13 != 0;
    }
    id v14 = [(HUOLDAlarmTableViewController *)self mediaProfileContainer];
    v15 = objc_msgSend(v14, "hf_settingsAdapterManager");
    v16 = [v15 adapterForIdentifier:*MEMORY[0x1E4F67FB8]];
    uint64_t v17 = [v16 isAdapterReady];

    [(HUOLDAlarmTableViewController *)self _updateAccessoryControllable:v11 alarmsSettingReady:v17];
    uint64_t v7 = v18;
  }
}

- (void)_updateAccessoryControllable:(BOOL)a3 alarmsSettingReady:(BOOL)a4
{
  if (self->_isAccessoryControllable != a3 || self->_isAlarmsSettingReady != a4)
  {
    if ([(HUOLDAlarmTableViewController *)self isViewLoaded]) {
      [MEMORY[0x1E4F39CF8] begin];
    }
    self->_isAccessoryControllable = a3;
    self->_isAlarmsSettingReady = a4;
    if ([(HUOLDAlarmTableViewController *)self isViewLoaded])
    {
      uint64_t v7 = [(HUOLDAlarmTableViewController *)self tableView];
      [v7 reloadData];

      [(HUOLDAlarmTableViewController *)self _numberOfItemsDidChangeAnimated:1];
      BOOL v8 = (void *)MEMORY[0x1E4F39CF8];
      [v8 commit];
    }
  }
}

- (void)mobileTimerAdapterDidUpdateReadiness:(id)a3
{
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (HUHomePodAlarmItemModuleController)alarmModuleController
{
  return self->_alarmModuleController;
}

- (void)setAlarmModuleController:(id)a3
{
}

- (_UIContentUnavailableView)noItemsView
{
  return self->_noItemsView;
}

- (void)setNoItemsView:(id)a3
{
}

- (BOOL)isAccessoryControllable
{
  return self->_isAccessoryControllable;
}

- (BOOL)isAlarmsSettingReady
{
  return self->_isAlarmsSettingReady;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_alarmModuleController, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
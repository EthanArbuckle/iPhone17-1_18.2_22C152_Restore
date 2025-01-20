@interface HUEditUserViewController
- (BOOL)moduleController:(id)a3 shouldDisableItem:(id)a4;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFPinCodeManager)pinCodeManager;
- (HFUserItem)userItem;
- (HUAboutResidentDeviceFooterView)aboutResidentDeviceFooterView;
- (HUAccessorySettingsItemModuleController)userSettingsItemModuleController;
- (HUEditUserItemManager)editUserItemManager;
- (HUEditUserViewController)initWithItem:(id)a3 home:(id)a4 pinCodeManager:(id)a5;
- (HUMediaServiceSettingsItemModuleController)mediaServiceSettingsItemModuleController;
- (HUPendingAccessoriesGridViewController)pendingAccessoriesViewController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_lazyAboutResidentDeviceFooterView;
- (id)childViewControllersToPreload;
- (id)itemModuleControllers;
- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (id)presentDefaultAccountViewController;
- (id)presentPinDetailsViewController;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)user;
- (void)_handleUpdatedItem:(id)a3 atIndexPath:(id)a4;
- (void)_removeUser;
- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3;
- (void)didSelectDefaultAccounts:(id)a3;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)doneButtonTapped:(id)a3;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)learnMoreLinkTapped:(id)a3;
- (void)mediaServiceSettingsItemModuleController:(id)a3 didSelectMediaService:(id)a4;
- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6;
- (void)moduleController:(id)a3 presentGroup:(id)a4;
- (void)moduleController:(id)a3 settingUpdatedForItem:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setAboutResidentDeviceFooterView:(id)a3;
- (void)setMediaServiceSettingsItemModuleController:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setUserSettingsItemModuleController:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUEditUserViewController

- (HUEditUserViewController)initWithItem:(id)a3 home:(id)a4 pinCodeManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [HUEditUserItemManager alloc];
  v13 = (void *)[v9 copy];
  v14 = [(HUEditUserItemManager *)v12 initWithHome:v10 userItem:v13 delegate:self];

  v27.receiver = self;
  v27.super_class = (Class)HUEditUserViewController;
  v15 = [(HUUserTableViewController *)&v27 initWithUserItemManager:v14 home:v10];
  if (v15)
  {
    uint64_t v16 = [v9 copy];
    userItem = v15->_userItem;
    v15->_userItem = (HFUserItem *)v16;

    objc_storeStrong((id *)&v15->_pinCodeManager, a5);
    objc_storeStrong((id *)&v15->_editUserItemManager, v14);
    [(HFItemManager *)v15->_editUserItemManager setDelegate:v15];
    v18 = [HUPendingAccessoriesGridViewController alloc];
    v19 = [v9 user];
    uint64_t v20 = [(HUPendingAccessoriesGridViewController *)v18 initWithUser:v19 home:v10];
    pendingAccessoriesViewController = v15->_pendingAccessoriesViewController;
    v15->_pendingAccessoriesViewController = (HUPendingAccessoriesGridViewController *)v20;

    v22 = [(HFUserItem *)v15->_userItem home];
    LODWORD(v19) = [v22 isMultiUserEnabled];

    if (v19)
    {
      objc_initWeak(&location, v15);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __61__HUEditUserViewController_initWithItem_home_pinCodeManager___block_invoke;
      v24[3] = &unk_1E638B470;
      objc_copyWeak(v25, &location);
      v25[1] = (id)a2;
      +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:v24];
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
  }

  return v15;
}

void __61__HUEditUserViewController_initWithItem_home_pinCodeManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v14 = 138412802;
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", (uint8_t *)&v14, 0x20u);
  }
  if (!v6)
  {
    id v10 = [WeakRetained editUserItemManager];
    [v10 setSupportedMULanguageCodes:v5];

    id v11 = [WeakRetained editUserItemManager];
    id v12 = (id)[v11 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];

    v13 = [WeakRetained tableView];
    [v13 reloadData];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUEditUserViewController;
  [(HUItemTableViewController *)&v8 viewDidLoad];
  v3 = [(HUEditUserViewController *)self navigationController];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v5 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    id v6 = (void *)[v4 initWithTitle:v5 style:2 target:self action:sel_doneButtonTapped_];
    v7 = [(HUEditUserViewController *)self navigationItem];
    [v7 setRightBarButtonItem:v6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUEditUserViewController;
  [(HUItemTableViewController *)&v7 viewWillAppear:a3];
  id v4 = [(HUEditUserViewController *)self navigationController];
  id v5 = [v4 delegate];

  if (!v5)
  {
    id v6 = [(HUEditUserViewController *)self navigationController];
    [v6 setDelegate:self];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4 == self)
  {
    objc_msgSend(a4, "tableView", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 reloadData];
  }
}

- (void)doneButtonTapped:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HUEditUserViewController *)self userItem];
    objc_super v7 = [v6 user];
    objc_super v8 = objc_msgSend(v7, "hf_prettyDescription");
    int v9 = 136315650;
    id v10 = "-[HUEditUserViewController doneButtonTapped:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'done' button %@. user = %@", (uint8_t *)&v9, 0x20u);
  }
  [(HUEditUserViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)user
{
  v2 = [(HUEditUserViewController *)self editUserItemManager];
  v3 = [v2 userBeingEdited];

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(HUEditUserViewController *)self editUserItemManager];
  int v9 = [v8 allowEditingItem];
  int v10 = [v6 isEqual:v9];

  if (v10) {
    goto LABEL_15;
  }
  __int16 v11 = [(HUEditUserViewController *)self editUserItemManager];
  id v12 = [v11 localAccessItem];
  int v13 = [v6 isEqual:v12];

  if (v13) {
    goto LABEL_15;
  }
  int v14 = [(HUEditUserViewController *)self editUserItemManager];
  uint64_t v15 = [v14 personalRequestsFooterItem];
  int v16 = [v6 isEqual:v15];

  if (v16) {
    goto LABEL_15;
  }
  id v17 = [(HUEditUserViewController *)self editUserItemManager];
  __int16 v18 = [v17 pendingAccessoriesItem];
  int v19 = [v6 isEqual:v18];

  if (v19) {
    goto LABEL_15;
  }
  uint64_t v20 = [(HUEditUserViewController *)self editUserItemManager];
  v21 = [v20 camerasItem];
  if ([v6 isEqual:v21])
  {
LABEL_14:

LABEL_15:
    uint64_t v30 = objc_opt_class();
    goto LABEL_16;
  }
  v22 = [(HUEditUserViewController *)self editUserItemManager];
  v23 = [v22 locksItem];
  if ([v6 isEqual:v23])
  {
LABEL_13:

    goto LABEL_14;
  }
  v24 = [(HUEditUserViewController *)self editUserItemManager];
  v25 = [v24 personalRequestsItem];
  if ([v6 isEqual:v25])
  {
LABEL_12:

    goto LABEL_13;
  }
  v46 = v24;
  v26 = [(HUEditUserViewController *)self editUserItemManager];
  objc_super v27 = [v26 tvViewingProfilesItem];
  if ([v6 isEqual:v27])
  {
LABEL_11:

    v24 = v46;
    goto LABEL_12;
  }
  v44 = v27;
  v45 = v26;
  v28 = [(HUEditUserViewController *)self editUserItemManager];
  v29 = [v28 remoteAccessItem];
  if ([v6 isEqual:v29])
  {

    objc_super v27 = v44;
    v26 = v45;
    goto LABEL_11;
  }
  v41 = v29;
  v42 = v28;
  v40 = [(HUEditUserViewController *)self editUserItemManager];
  v33 = [v40 updateListeningHistoryItem];
  if (objc_msgSend(v6, "isEqual:"))
  {
    char v43 = 1;
  }
  else
  {
    v39 = [(HUEditUserViewController *)self editUserItemManager];
    v38 = [v39 allowedAccessoryCategoryItemProvider];
    v34 = [v38 items];
    char v43 = [v34 containsObject:v6];
  }
  if (v43) {
    goto LABEL_15;
  }
  v35 = [(HUEditUserViewController *)self editUserItemManager];
  v36 = [v35 homeScheduleItem];
  int v37 = [v6 isEqual:v36];

  if (v37) {
    goto LABEL_15;
  }
  v47.receiver = self;
  v47.super_class = (Class)HUEditUserViewController;
  uint64_t v30 = [(HUUserTableViewController *)&v47 cellClassForItem:v6 indexPath:v7];
LABEL_16:
  v31 = (void *)v30;

  return (Class)v31;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v61.receiver = self;
  v61.super_class = (Class)HUEditUserViewController;
  [(HUUserTableViewController *)&v61 setupCell:v8 forItem:v9 indexPath:a5];
  int v10 = [(HUEditUserViewController *)self editUserItemManager];
  __int16 v11 = [v10 allowEditingItem];
  int v12 = [v9 isEqual:v11];

  if (!v12)
  {
    int v14 = [(HUEditUserViewController *)self editUserItemManager];
    uint64_t v15 = [v14 pendingAccessoriesItem];
    int v16 = [v9 isEqual:v15];

    if (v16)
    {
      id v17 = (void *)MEMORY[0x1E4F428B8];
      id v18 = v8;
      int v19 = [v17 clearColor];
      [v18 setBackgroundColor:v19];

      uint64_t v20 = [MEMORY[0x1E4F428B8] clearColor];
      v21 = [v18 contentView];
      [v21 setBackgroundColor:v20];

      id v13 = [(HUEditUserViewController *)self pendingAccessoriesViewController];
      [v18 setViewController:v13];
LABEL_5:

      goto LABEL_13;
    }
    v22 = [(HUEditUserViewController *)self editUserItemManager];
    v23 = [v22 camerasItem];
    if ([v9 isEqual:v23])
    {

LABEL_9:
      objc_opt_class();
      id v27 = v8;
      if (objc_opt_isKindOfClass()) {
        v28 = v27;
      }
      else {
        v28 = 0;
      }
      id v13 = v28;

      [v13 setIconDisplayStyle:1];
      v29 = +[HUIconCellContentMetrics compactMetrics];
      [v13 setContentMetrics:v29];

      [v13 setDisableContinuousIconAnimation:1];
      [v13 setAccessoryType:1];
      goto LABEL_13;
    }
    v24 = [(HUEditUserViewController *)self editUserItemManager];
    v25 = [v24 locksItem];
    int v26 = [v9 isEqual:v25];

    if (v26) {
      goto LABEL_9;
    }
    uint64_t v30 = [(HUEditUserViewController *)self editUserItemManager];
    v31 = [v30 personalRequestsItem];
    if (([v9 isEqual:v31] & 1) == 0)
    {
      v32 = [(HUEditUserViewController *)self editUserItemManager];
      v33 = [v32 tvViewingProfilesItem];
      if (([v9 isEqual:v33] & 1) == 0)
      {
        v34 = [(HUEditUserViewController *)self editUserItemManager];
        v35 = [v34 remoteAccessItem];
        if (([v9 isEqual:v35] & 1) == 0)
        {
          v36 = [(HUEditUserViewController *)self editUserItemManager];
          v60 = [v36 updateListeningHistoryItem];
          if ((objc_msgSend(v9, "isEqual:") & 1) == 0)
          {
            v57 = [(HUEditUserViewController *)self editUserItemManager];
            v56 = [v57 allowedAccessoryCategoryItemProvider];
            [v56 items];
            v44 = v58 = v36;
            char v59 = [v44 containsObject:v9];

            if ((v59 & 1) == 0)
            {
              v45 = [(HUEditUserViewController *)self editUserItemManager];
              v46 = [v45 homeScheduleItem];
              int v47 = [v9 isEqual:v46];

              if (!v47) {
                goto LABEL_14;
              }
              objc_opt_class();
              id v48 = v8;
              if (objc_opt_isKindOfClass()) {
                v49 = v48;
              }
              else {
                v49 = 0;
              }
              id v50 = v49;

              [v50 setIconDisplayStyle:1];
              [v50 setDisableContinuousIconAnimation:1];
              HUDefaultSizeForIconSize();
              double v52 = v51;
              double v54 = v53;
              v55 = [v50 contentMetrics];
              objc_msgSend(v55, "setIconSize:", v52, v54);

              [v50 setAccessoryType:0];
              [v50 setValueColorFollowsTintColor:1];
              id v13 = [v9 latestResults];
              id v18 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
              [v50 setAccessibilityIdentifier:v18];

              goto LABEL_5;
            }
LABEL_23:
            objc_opt_class();
            id v37 = v8;
            if (objc_opt_isKindOfClass()) {
              v38 = v37;
            }
            else {
              v38 = 0;
            }
            id v13 = v38;

            [v13 setAccessoryView:0];
            [v13 setHideIcon:1];
            [v13 setAccessoryType:1];
            v39 = [(HUEditUserViewController *)self editUserItemManager];
            v40 = [v39 allowedAccessoryCategoryItemProvider];
            v41 = [v40 items];
            int v42 = [v41 containsObject:v9];

            if (v42)
            {
              [v13 setHideIcon:0];
              char v43 = +[HUIconCellContentMetrics compactMetrics];
              [v13 setContentMetrics:v43];
            }
            goto LABEL_13;
          }
        }
      }
    }
    goto LABEL_23;
  }
  id v13 = v8;
  [v13 setDelegate:self];
  [v13 setSelectionStyle:0];
LABEL_13:

LABEL_14:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HUEditUserViewController;
  [(HUItemTableViewController *)&v28 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  int v12 = [(HUEditUserViewController *)self editUserItemManager];
  id v13 = [v12 personalRequestsFooterItem];
  int v14 = [v11 isEqual:v13];

  if (v14)
  {
    id v15 = v10;
    int v16 = [v15 headerFooterView];
    [v16 setType:1];

    id v17 = [v11 latestResults];
    id v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    int v19 = [v15 headerFooterView];
    [v19 setMessage:v18];

    uint64_t v20 = [v15 headerFooterView];
    v21 = [v20 messageTextView];
    [v21 setDelegate:self];

    v22 = [v11 latestResults];
    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    v24 = [v15 headerFooterView];

    [v24 setAccessibilityIdentifier:v23];
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v25 = v10;
    if (objc_opt_isKindOfClass()) {
      int v26 = v25;
    }
    else {
      int v26 = 0;
    }
    id v27 = v26;

    v22 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v11];
    [v27 setContentConfiguration:v22];
    v23 = [v11 latestResults];
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v27 setAccessibilityIdentifier:v24];

    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [(id)v8 displayedItemAtIndexPath:v6];

  v16.receiver = self;
  v16.super_class = (Class)HUEditUserViewController;
  LOBYTE(v8) = [(HUItemTableViewController *)&v16 shouldHideSeparatorsForCell:v7 indexPath:v6];

  if (v8)
  {
    char v10 = 1;
  }
  else
  {
    id v11 = [(HUEditUserViewController *)self editUserItemManager];
    int v12 = [v11 allowEditingItem];
    if ([v9 isEqual:v12])
    {
      char v10 = 1;
    }
    else
    {
      id v13 = [(HUEditUserViewController *)self editUserItemManager];
      int v14 = [v13 pendingAccessoriesItem];
      char v10 = [v9 isEqual:v14];
    }
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v158.receiver = self;
  v158.super_class = (Class)HUEditUserViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v158 tableView:v7 didSelectRowAtIndexPath:v6];
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  v152 = v6;
  [v7 deselectRowAtIndexPath:v6 animated:1];

  char v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(HUEditUserViewController *)self userItem];
    int v12 = [v11 user];
    id v13 = objc_msgSend(v12, "hf_prettyDescription");
    *(_DWORD *)buf = 136315650;
    v160 = (HUEditUserViewController *)"-[HUEditUserViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v161 = 2112;
    v162 = v9;
    __int16 v163 = 2112;
    id v164 = v13;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' for user = %@", buf, 0x20u);
  }
  int v14 = [(HUEditUserViewController *)self editUserItemManager];
  id v15 = [v14 removeItem];
  int v16 = [v9 isEqual:v15];

  if (v16)
  {
    id v17 = [(HUItemTableViewController *)self itemManager];
    id v18 = [v17 home];

    if ((objc_msgSend(v18, "hf_currentUserIsAdministrator") & 1) != 0
      || objc_msgSend(v18, "hf_currentUserIsOwner"))
    {
      int v19 = [(HUEditUserViewController *)self editUserItemManager];
      uint64_t v20 = [v19 userBeingEdited];
      v21 = [v20 name];
      objc_super v28 = HULocalizedStringWithFormat(@"HUUsersRemovePersonAlertTitle", @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v21);

      v29 = [(HUEditUserViewController *)self editUserItemManager];
      uint64_t v30 = [v29 userBeingEdited];
      v31 = [v30 name];
      v149 = [v18 name];
      v38 = HULocalizedStringWithFormat(@"HUUsersRemovePersonConfirmationMessage", @"%@%@", v32, v33, v34, v35, v36, v37, (uint64_t)v31);

      v39 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
      v40 = @"HURemoveTitle";
    }
    else
    {
      v41 = [v18 name];
      objc_super v28 = HULocalizedStringWithFormat(@"HUEditLocationLeaveHomeAlertTitle", @"%@", v42, v43, v44, v45, v46, v47, (uint64_t)v41);

      id v48 = [v18 name];
      v38 = HULocalizedStringWithFormat(@"HUEditLocationLeaveHomeConfirmationMessage", @"%@", v49, v50, v51, v52, v53, v54, (uint64_t)v48);

      v39 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
      v40 = @"HUDeleteTitle";
    }
    v55 = _HULocalizedStringWithDefaultValue(v40, v40, 1);
    v56 = [(UITableViewController *)self hu_actionSheetWithTitle:v28 message:v38 indexPath:v6];
    v57 = (void *)MEMORY[0x1E4F42720];
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3221225472;
    v156[2] = __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v156[3] = &unk_1E6385188;
    id v157 = v39;
    id v58 = v39;
    char v59 = [v57 actionWithTitle:v58 style:1 handler:v156];
    [v56 addAction:v59];

    v60 = (void *)MEMORY[0x1E4F42720];
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke_60;
    v153[3] = &unk_1E6389708;
    id v154 = v55;
    v155 = self;
    id v61 = v55;
    v62 = [v60 actionWithTitle:v61 style:2 handler:v153];
    [v56 addAction:v62];

    [(HUEditUserViewController *)self presentViewController:v56 animated:1 completion:0];
  }
  v63 = [(HUEditUserViewController *)self editUserItemManager];
  v64 = [v63 homeScheduleItem];
  int v65 = [v9 isEqual:v64];

  if (v65)
  {
    v66 = [HURestrictedGuestScheduleViewController alloc];
    v67 = [(HUItemTableViewController *)self itemManager];
    v68 = [v67 home];
    v69 = [(HUEditUserViewController *)self userItem];
    v70 = [v69 user];
    v71 = [(HURestrictedGuestScheduleViewController *)v66 initWithHome:v68 user:v70];

    v72 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v71];
    [v72 setModalPresentationStyle:2];
    id v73 = [(UIViewController *)self hu_presentPreloadableViewController:v72 animated:1];
  }
  v74 = [(HUEditUserViewController *)self editUserItemManager];
  v75 = [v74 allowedAccessoryCategoryItemProvider];
  v76 = [v75 items];
  int v77 = [v76 containsObject:v9];

  if (v77)
  {
    objc_opt_class();
    id v78 = v9;
    if (objc_opt_isKindOfClass()) {
      v79 = v78;
    }
    else {
      v79 = 0;
    }
    id v80 = v79;

    objc_opt_class();
    v81 = [v80 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v82 = v81;
    }
    else {
      v82 = 0;
    }
    id v83 = v82;

    v84 = [v83 categoryType];
    int v85 = [v84 isEqualToString:*MEMORY[0x1E4F2C1B0]];

    v86 = [(HUEditUserViewController *)self editUserItemManager];
    v87 = [v86 home];
    int v88 = objc_msgSend(v87, "hf_canAddAccessCode");

    if (v85 && v88)
    {
      id v89 = [(HUEditUserViewController *)self presentPinDetailsViewController];
    }
    else
    {
      id v150 = v80;
      v90 = [HUUserAccessoryAccessViewController alloc];
      v91 = [(HUEditUserViewController *)self editUserItemManager];
      v92 = [v91 home];
      v93 = [(HUEditUserViewController *)self editUserItemManager];
      v94 = [v93 userBeingEdited];
      v95 = [v83 categoryType];
      v96 = [(HUUserAccessoryAccessViewController *)v90 initWithHome:v92 user:v94 accessoryCategoryType:v95];

      v97 = [(HUEditUserViewController *)self navigationController];
      id v98 = (id)objc_msgSend(v97, "hu_pushPreloadableViewController:animated:", v96, 1);

      v99 = HFLogForCategory();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        v100 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v160 = self;
        __int16 v161 = 2112;
        v162 = v100;
        __int16 v163 = 2112;
        id v164 = v83;
        _os_log_impl(&dword_1BE345000, v99, OS_LOG_TYPE_DEFAULT, "%@: %@ Checking for allowed accessory category item: categoryItem=%@.", buf, 0x20u);
      }
      id v80 = v150;
    }
  }
  v101 = [(HUEditUserViewController *)self editUserItemManager];
  v102 = [v101 remoteAccessItem];
  int v103 = [v9 isEqual:v102];

  if (v103)
  {
    v104 = [HURemoteAccessTableViewController alloc];
    v105 = [(HUEditUserViewController *)self userItem];
    v106 = [(HUItemTableViewController *)self itemManager];
    v107 = [v106 home];
    v108 = [(HURemoteAccessTableViewController *)v104 initWithItem:v105 home:v107];

    v109 = [(HUEditUserViewController *)self navigationController];
    id v110 = (id)objc_msgSend(v109, "hu_pushPreloadableViewController:animated:", v108, 1);
  }
  v111 = [(HUEditUserViewController *)self editUserItemManager];
  v112 = [v111 camerasItem];
  int v113 = [v9 isEqual:v112];

  if (v113)
  {
    v114 = [HUUserCamerasAccessLevelViewController alloc];
    v115 = [(HUEditUserViewController *)self userItem];
    v116 = [(HUItemTableViewController *)self itemManager];
    v117 = [v116 home];
    v118 = [(HUUserCamerasAccessLevelViewController *)v114 initWithUserItem:v115 home:v117];

    v119 = [(HUEditUserViewController *)self navigationController];
    id v120 = (id)objc_msgSend(v119, "hu_pushPreloadableViewController:animated:", v118, 1);
  }
  v121 = [(HUEditUserViewController *)self editUserItemManager];
  v122 = [v121 locksItem];
  int v123 = [v9 isEqual:v122];

  if (v123) {
    id v124 = [(HUEditUserViewController *)self presentPinDetailsViewController];
  }
  v125 = [(HUEditUserViewController *)self editUserItemManager];
  v126 = [v125 personalRequestsItem];
  int v127 = [v9 isEqual:v126];

  if (v127)
  {
    v128 = [HUPersonalRequestsEditorTableViewController alloc];
    v129 = [(HUEditUserViewController *)self userItem];
    v130 = [(HUPersonalRequestsEditorTableViewController *)v128 initWithUserItem:v129 onlyShowDeviceSwitches:0];

    v131 = [(HUEditUserViewController *)self navigationController];
    id v132 = (id)objc_msgSend(v131, "hu_pushPreloadableViewController:animated:", v130, 1);
  }
  v133 = [(HUEditUserViewController *)self editUserItemManager];
  v134 = [v133 tvViewingProfilesItem];
  int v135 = [v9 isEqual:v134];

  if (v135)
  {
    v136 = [HUTVViewingProfilesEditorTableViewController alloc];
    v137 = [(HUEditUserViewController *)self userItem];
    v138 = [(HUTVViewingProfilesEditorTableViewController *)v136 initWithUserItem:v137];

    v139 = [(HUEditUserViewController *)self navigationController];
    id v140 = (id)objc_msgSend(v139, "hu_pushPreloadableViewController:animated:", v138, 1);
  }
  v141 = [(HUEditUserViewController *)self editUserItemManager];
  v142 = [v141 updateListeningHistoryItem];
  int v143 = [v9 isEqual:v142];

  if (v143)
  {
    v144 = [HUUpdateListeningHistorySettingsViewController alloc];
    v145 = [(HUEditUserViewController *)self userItem];
    v146 = [(HUUpdateListeningHistorySettingsViewController *)v144 initWithUserItem:v145];

    v147 = [(HUEditUserViewController *)self navigationController];
    id v148 = (id)objc_msgSend(v147, "hu_pushPreloadableViewController:animated:", v146, 1);
  }
}

void __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    uint64_t v5 = "-[HUEditUserViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel butotn '%@' from the alert popup", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke_60(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    __int16 v6 = "-[HUEditUserViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped commit button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 40) _removeUser];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  __int16 v7 = [(HUEditUserViewController *)self editUserItemManager];
  uint64_t v8 = [v7 reuseIdentifierForFooterViewInSection:a4];

  if ([v8 isEqualToString:@"HUAboutResidentDeviceFooterViewReuseIdentifier"])
  {
    uint64_t v9 = [(HUEditUserViewController *)self _lazyAboutResidentDeviceFooterView];
  }
  else
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F68548]])
    {
      v18.receiver = self;
      v18.super_class = (Class)HUEditUserViewController;
      char v10 = [(HUItemTableViewController *)&v18 tableView:v6 viewForFooterInSection:a4];
      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        int v12 = v11;
      }
      else {
        int v12 = 0;
      }
      id v13 = v12;

      int v14 = [v13 messageTextView];
      id v15 = [v14 textDragInteraction];
      [v15 setEnabled:1];

      goto LABEL_10;
    }
    v17.receiver = self;
    v17.super_class = (Class)HUEditUserViewController;
    uint64_t v9 = [(HUItemTableViewController *)&v17 tableView:v6 viewForFooterInSection:a4];
  }
  id v11 = (id)v9;
LABEL_10:

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  __int16 v7 = [(HUEditUserViewController *)self editUserItemManager];
  uint64_t v8 = [v7 reuseIdentifierForFooterViewInSection:a4];

  if ([v8 isEqualToString:@"HUAboutResidentDeviceFooterViewReuseIdentifier"])
  {
    uint64_t v9 = [(HUEditUserViewController *)self _lazyAboutResidentDeviceFooterView];
    [v9 bounds];
    double v11 = v10;
  }
  else if ([v8 isEqualToString:*MEMORY[0x1E4F68548]])
  {
    double v11 = *MEMORY[0x1E4F43D18];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUEditUserViewController;
    [(HUItemTableViewController *)&v14 tableView:v6 heightForFooterInSection:a4];
    double v11 = v12;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  __int16 v7 = [(HUEditUserViewController *)self editUserItemManager];
  uint64_t v8 = [v7 displayedSectionIdentifierForSectionIndex:a4];

  if ([v8 isEqualToString:@"HUMediaServiceSettingsItemModule_PrimaryServiceSectionIdentifier"])
  {
    double v9 = 0.01;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUEditUserViewController;
    [(HUItemTableViewController *)&v12 tableView:v6 heightForHeaderInSection:a4];
    double v9 = v10;
  }

  return v9;
}

- (id)childViewControllersToPreload
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HUEditUserViewController *)self pendingAccessoriesViewController];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)learnMoreLinkTapped:(id)a3
{
  int v5 = [[HUAboutResidentDeviceViewController alloc] initWithStyle:1];
  [(HUAboutResidentDeviceViewController *)v5 setDelegate:self];
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5];
  [v4 setModalPresentationStyle:2];
  [(HUEditUserViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v7 = [(HUEditUserViewController *)self tableView];
  uint64_t v8 = [v7 indexPathForCell:v6];

  double v9 = [(HUItemTableViewController *)self itemManager];
  double v10 = [v9 displayedItemAtIndexPath:v8];

  double v11 = [(HUEditUserViewController *)self editUserItemManager];
  objc_super v12 = [v11 userBeingEdited];

  id v13 = [(HUItemTableViewController *)self itemManager];
  objc_super v14 = [v13 home];
  id v15 = [v14 homeAccessControlForUser:v12];

  int v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v17 = objc_msgSend(v12, "hf_prettyDescription");
    *(_DWORD *)buf = 136315906;
    v41 = "-[HUEditUserViewController switchCell:didTurnOn:]";
    __int16 v42 = 2112;
    uint64_t v43 = v10;
    __int16 v44 = 2112;
    uint64_t v45 = v17;
    __int16 v46 = 1024;
    BOOL v47 = v4;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch of %@ for %@ to be %{BOOL}d", buf, 0x26u);
  }
  objc_super v18 = [(HUEditUserViewController *)self editUserItemManager];
  int v19 = [v18 allowEditingItem];
  int v20 = [v10 isEqual:v19];

  if (v20)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E63888B0;
    id v38 = v15;
    BOOL v39 = v4;
    v21 = _Block_copy(aBlock);
  }
  else
  {
    v21 = 0;
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F7A0D8];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_2;
  v35[3] = &unk_1E638B498;
  id v23 = v21;
  id v36 = v23;
  uint64_t v24 = [v22 futureWithErrorOnlyHandlerAdapterBlock:v35];
  objc_initWeak((id *)buf, self);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_3;
  v32[3] = &unk_1E638B4E8;
  objc_copyWeak(&v34, (id *)buf);
  id v25 = v12;
  id v33 = v25;
  id v26 = (id)[v24 addSuccessBlock:v32];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_5;
  v29[3] = &unk_1E63899B8;
  id v27 = v6;
  id v30 = v27;
  BOOL v31 = v4;
  id v28 = (id)[v24 addFailureBlock:v29];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

uint64_t __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAdministratorAccess:*(unsigned __int8 *)(a1 + 40) completionHandler:a2];
}

uint64_t __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_4;
  v5[3] = &unk_1E638B4C0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v5 sender:0];

  objc_destroyWeak(&v7);
}

void __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v4 = [WeakRetained itemManager];
    int v5 = [v4 home];
    [v6 home:v5 didUpdateAccessControlForUser:*(void *)(a1 + 32)];
  }
}

uint64_t __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  int v5 = [v3 sharedHandler];
  [v5 handleError:v4 operationType:*MEMORY[0x1E4F687E0] options:0 retryBlock:0 cancelBlock:0];

  id v6 = *(void **)(a1 + 32);
  BOOL v7 = *(unsigned char *)(a1 + 40) == 0;

  return [v6 setOn:v7 animated:1];
}

- (id)itemModuleControllers
{
  id v3 = objc_opt_new();
  id v4 = [(HUEditUserViewController *)self userSettingsItemModuleController];
  if (!v4)
  {
    int v5 = [(HUEditUserViewController *)self editUserItemManager];
    id v6 = [v5 userSettingsItemModule];

    if (!v6) {
      goto LABEL_5;
    }
    BOOL v7 = [HUAccessorySettingsItemModuleController alloc];
    id v4 = [(HUEditUserViewController *)self editUserItemManager];
    uint64_t v8 = [v4 userSettingsItemModule];
    double v9 = [(HUAccessorySettingsItemModuleController *)v7 initWithModule:v8 delegate:self];
    [(HUEditUserViewController *)self setUserSettingsItemModuleController:v9];
  }
LABEL_5:
  double v10 = [(HUEditUserViewController *)self userSettingsItemModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v10);

  double v11 = [(HUEditUserViewController *)self mediaServiceSettingsItemModuleController];
  if (!v11)
  {
    objc_super v12 = [(HUEditUserViewController *)self editUserItemManager];
    id v13 = [v12 mediaServiceItemModule];

    if (!v13) {
      goto LABEL_9;
    }
    objc_super v14 = [HUMediaServiceSettingsItemModuleController alloc];
    id v15 = [(HUEditUserViewController *)self editUserItemManager];
    int v16 = [v15 mediaServiceItemModule];
    objc_super v17 = [(HUItemModuleController *)v14 initWithModule:v16];
    [(HUEditUserViewController *)self setMediaServiceSettingsItemModuleController:v17];

    double v11 = [(HUEditUserViewController *)self mediaServiceSettingsItemModuleController];
    [v11 setDelegate:self];
  }

LABEL_9:
  objc_super v18 = [(HUEditUserViewController *)self mediaServiceSettingsItemModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v18);

  return v3;
}

- (void)moduleController:(id)a3 presentGroup:(id)a4
{
  id v15 = a4;
  int v5 = [v15 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68A08];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  if (!v7)
  {

    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  double v9 = [v15 latestResults];
  double v10 = [v9 objectForKeyedSubscript:v6];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
LABEL_5:
    objc_super v12 = +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:v15];
    id v13 = [(HUEditUserViewController *)self navigationController];
    id v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);
  }
}

- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  id v8 = a4;
  double v9 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__HUEditUserViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke;
  v12[3] = &unk_1E6386018;
  id v10 = v9;
  id v13 = v10;
  [(HUEditUserViewController *)self presentViewController:v8 animated:v6 completion:v12];

  return v10;
}

uint64_t __98__HUEditUserViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  v56[1] = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v11 = a4;
  objc_super v12 = (void (**)(id, void *))a6;
  if (!v11)
  {
    id v13 = NSStringFromSelector(a2);
    NSLog(&cfstr_CalledWithNoSe.isa, v13);
  }
  id v14 = [v11 settingKeyPath];
  uint64_t v15 = *MEMORY[0x1E4F68570];
  int v16 = [v14 isEqualToString:*MEMORY[0x1E4F68570]];

  if (v16) {
    BOOL v17 = !v7;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    id v37 = [(HUItemTableViewController *)self itemManager];
    id v38 = [v37 home];
    v55 = @"OnboardingDisplayOption_OnboardingFromUserInput";
    v56[0] = MEMORY[0x1E4F1CC38];
    BOOL v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    v40 = +[HUHomeFeatureOnboardingUtilities home:v38 onboardIdentifyVoiceFromPresentingViewController:self usageOptions:v39];
    v12[2](v12, v40);
    goto LABEL_16;
  }
  objc_super v18 = [v11 settingKeyPath];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F68550]];

  if (v19) {
    BOOL v20 = !v7;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20)
  {
    v21 = [(HUEditUserViewController *)self editUserItemManager];
    uint64_t v22 = [v21 userSettingsItemModule];
    id v23 = [v22 accessorySettingsItemProvider];
    uint64_t v24 = [v23 homeKitSettingsVendor];
    id v37 = [v24 settings];

    id v38 = objc_msgSend(v37, "hf_accessorySettingAtKeyPath:", v15);
    id v25 = [v38 value];
    int v26 = [v25 BOOLValue];

    id v27 = HFLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v52 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:]";
      __int16 v53 = 1024;
      int v54 = v26;
      _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "(%s) isVoiceIDSetup = %{BOOL}d", buf, 0x12u);
    }

    if (v26) {
      goto LABEL_17;
    }
    id v28 = (void *)MEMORY[0x1E4F42728];
    v29 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Title", @"HUPlaybackInfluencesActivation_Alert_Title", 1);
    id v30 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Description", @"HUPlaybackInfluencesActivation_Alert_Description", 1);
    BOOL v39 = [v28 alertControllerWithTitle:v29 message:v30 preferredStyle:1];

    BOOL v31 = (void *)MEMORY[0x1E4F42720];
    uint64_t v32 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Action_NotNow", @"HUPlaybackInfluencesActivation_Alert_Action_NotNow", 1);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke;
    v46[3] = &unk_1E638B538;
    id v37 = v37;
    id v47 = v37;
    uint64_t v48 = self;
    SEL v50 = a2;
    id v33 = v12;
    uint64_t v49 = v33;
    v41 = [v31 actionWithTitle:v32 style:1 handler:v46];

    objc_initWeak((id *)buf, self);
    id v34 = (void *)MEMORY[0x1E4F42720];
    uint64_t v35 = _HULocalizedStringWithDefaultValue(@"HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice", @"HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice", 1);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_112;
    v43[3] = &unk_1E638B560;
    objc_copyWeak(&v45, (id *)buf);
    __int16 v44 = v33;
    id v36 = [v34 actionWithTitle:v35 style:0 handler:v43];

    [v39 addAction:v41];
    [v39 addAction:v36];
    [(HUEditUserViewController *)self presentViewController:v39 animated:1 completion:0];

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);

    v40 = v47;
LABEL_16:

LABEL_17:
  }
  v12[2](v12, 0);
}

void __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withComp"
          "letion:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Not Now Action", buf, 0xCu);
  }

  int v5 = objc_msgSend(*(id *)(a1 + 32), "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68550]);
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_107;
  v7[3] = &unk_1E638B510;
  id v6 = v5;
  id v8 = v6;
  objc_copyWeak(v9, (id *)buf);
  v9[1] = *(id *)(a1 + 56);
  [v6 updateValue:MEMORY[0x1E4F1CC28] completionHandler:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_destroyWeak(v9);

  objc_destroyWeak((id *)buf);
}

void __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained editUserItemManager];
    uint64_t v7 = [v6 sectionIndexForDisplayedSectionIdentifier:*MEMORY[0x1E4F68548]];

    id v8 = [WeakRetained itemManager];
    id v9 = (id)[v8 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];

    id v10 = [WeakRetained itemManager];
    LODWORD(v8) = [v10 diffableDataSourceDisabled];

    if (v8)
    {
      id v11 = [WeakRetained tableView];
      uint64_t v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
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
      uint64_t v12 = [WeakRetained itemManager];
      uint64_t v15 = v11;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      [v12 reloadUIRepresentationForSections:v14 withAnimation:0];
    }
    goto LABEL_9;
  }
  id WeakRetained = HFLogForCategory();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    BOOL v17 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withComp"
          "letion:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v3;
    __int16 v20 = 2112;
    uint64_t v21 = v5;
    _os_log_impl(&dword_1BE345000, WeakRetained, OS_LOG_TYPE_DEFAULT, "(%s) Error [%@] setting value for setting [%@] to NO", buf, 0x20u);
  }
LABEL_10:
}

void __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_112(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withComp"
          "letion:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Identify Voice Action", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [WeakRetained itemManager];
  id v6 = [v5 home];
  id v9 = @"OnboardingDisplayOption_OnboardingFromUserInput";
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v8 = +[HUHomeFeatureOnboardingUtilities home:v6 onboardIdentifyVoiceFromPresentingViewController:WeakRetained usageOptions:v7];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
}

- (void)moduleController:(id)a3 settingUpdatedForItem:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 settingKeyPath];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F68570]];

    if (v11)
    {
      uint64_t v12 = [(HUEditUserViewController *)self editUserItemManager];
      uint64_t v13 = [v12 sectionIndexForDisplayedSectionIdentifier:*MEMORY[0x1E4F685A0]];

      id v14 = [(HUItemTableViewController *)self itemManager];
      id v15 = (id)[v14 reloadAndUpdateAllItemsFromSenderSelector:a2];

      int v16 = [(HUItemTableViewController *)self itemManager];
      LODWORD(v14) = [v16 diffableDataSourceDisabled];

      if (v14)
      {
        BOOL v17 = [(HUEditUserViewController *)self tableView];
        __int16 v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v13];
        [v17 reloadSections:v18 withRowAnimation:5];
      }
      else
      {
        id v19 = [(HUItemTableViewController *)self itemManager];
        __int16 v20 = [v19 itemSectionForSectionIndex:v13];

        if (v20)
        {
          uint64_t v21 = [(HUItemTableViewController *)self itemManager];
          v23[0] = v20;
          uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
          [v21 reloadUIRepresentationForSections:v22 withAnimation:0];
        }
      }
    }
  }
}

- (BOOL)moduleController:(id)a3 shouldDisableItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F69758] isAMac];
  id v7 = [v5 settingKeyPath];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F68550]];

  if (!v6)
  {
    if (v8)
    {
      uint64_t v10 = [(HUEditUserViewController *)self userItem];
      int v11 = [v10 user];
      uint64_t v12 = [(HUEditUserViewController *)self editUserItemManager];
      uint64_t v13 = [v12 home];
      id v14 = [v13 currentUser];
      int v9 = [v11 isEqual:v14] ^ 1;

      goto LABEL_13;
    }
LABEL_15:
    LOBYTE(v9) = 0;
    goto LABEL_16;
  }
  if ((v8 & 1) == 0)
  {
    id v15 = [v5 settingKeyPath];
    int v16 = [v15 isEqualToString:*MEMORY[0x1E4F68570]];

    if (v16)
    {
      BOOL v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = [(HUEditUserViewController *)self editUserItemManager];
        id v19 = [v18 home];
        int v24 = 136315394;
        id v25 = "-[HUEditUserViewController moduleController:shouldDisableItem:]";
        __int16 v26 = 1024;
        int v27 = objc_msgSend(v19, "hf_hasRMVCapableAppleTV");
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "(%s) hasRMVCapableAppleTV = %{BOOL}d", (uint8_t *)&v24, 0x12u);
      }
      __int16 v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(HUEditUserViewController *)self editUserItemManager];
        int v22 = [v21 isUserBeingEditedTheDeviceUser];
        int v24 = 136315394;
        id v25 = "-[HUEditUserViewController moduleController:shouldDisableItem:]";
        __int16 v26 = 1024;
        int v27 = v22;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "(%s) isUserBeingEditedTheDeviceUser = %{BOOL}d", (uint8_t *)&v24, 0x12u);
      }
      uint64_t v10 = [(HUEditUserViewController *)self editUserItemManager];
      int v11 = [v10 home];
      if (!objc_msgSend(v11, "hf_hasRMVCapableAppleTV"))
      {
        LOBYTE(v9) = 1;
        goto LABEL_14;
      }
      uint64_t v12 = [(HUEditUserViewController *)self editUserItemManager];
      int v9 = [v12 isUserBeingEditedTheDeviceUser] ^ 1;
LABEL_13:

LABEL_14:
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  LOBYTE(v9) = 1;
LABEL_16:

  return v9;
}

- (void)mediaServiceSettingsItemModuleController:(id)a3 didSelectMediaService:(id)a4
{
  id v5 = a4;
  int v6 = [HUMediaServiceTableViewController alloc];
  id v7 = [(HUEditUserViewController *)self userItem];
  uint64_t v10 = [(HUMediaServiceTableViewController *)v6 initWithItem:v7 mediaServiceItem:v5];

  int v8 = [(HUEditUserViewController *)self navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
}

- (void)didSelectDefaultAccounts:(id)a3
{
  uint64_t v4 = [HUMediaServiceDefaultAccountsTableViewController alloc];
  id v5 = [(HUEditUserViewController *)self editUserItemManager];
  int v6 = [v5 mediaServiceItemModule];
  id v7 = [v6 defaultAccountsItem];
  int v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 home];
  uint64_t v12 = [(HUMediaServiceDefaultAccountsTableViewController *)v4 initWithItem:v7 home:v9];

  uint64_t v10 = [(HUEditUserViewController *)self navigationController];
  id v11 = (id)objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v12, 1);
}

- (void)_removeUser
{
  id v3 = [(HUEditUserViewController *)self editUserItemManager];
  uint64_t v4 = [v3 userBeingEdited];

  id v5 = [(HUItemTableViewController *)self itemManager];
  int v6 = [v5 home];

  if (objc_msgSend(v6, "hf_currentUserIsAdministrator")) {
    char v7 = 1;
  }
  else {
    char v7 = objc_msgSend(v6, "hf_currentUserIsOwner");
  }
  int v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(HUEditUserViewController *)self pinCodeManager];
  uint64_t v10 = [v9 deleteUserPinCodeWithUser:v4];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__HUEditUserViewController__removeUser__block_invoke;
  v33[3] = &unk_1E638B588;
  id v11 = v4;
  id v34 = v11;
  id v12 = v6;
  id v35 = v12;
  uint64_t v13 = [v10 recover:v33];
  objc_msgSend(v8, "na_safeAddObject:", v13);

  id v14 = (void *)MEMORY[0x1E4F7A0D8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __39__HUEditUserViewController__removeUser__block_invoke_119;
  v29[3] = &unk_1E63864C8;
  char v32 = v7;
  id v15 = v12;
  id v30 = v15;
  id v16 = v11;
  id v31 = v16;
  BOOL v17 = [v14 lazyFutureWithBlock:v29];
  [v8 addObject:v17];

  __int16 v18 = [MEMORY[0x1E4F7A0D8] chainFutures:v8];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int v24 = __39__HUEditUserViewController__removeUser__block_invoke_2;
  id v25 = &unk_1E638B600;
  char v28 = v7;
  id v26 = v15;
  id v27 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = (id)[v18 addSuccessBlock:&v22];
  -[HUUserTableViewController performRemovalAction:](self, "performRemovalAction:", v18, v22, v23, v24, v25);
}

id __39__HUEditUserViewController__removeUser__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v17 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 136315650;
    id v21 = "-[HUEditUserViewController _removeUser]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to remove user PIN Code before removing user (%@): %@", buf, 0x20u);
  }
  id v5 = [*(id *)(a1 + 40) currentUser];
  int v6 = [v5 uniqueIdentifier];
  char v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F687F8];
    id v11 = objc_msgSend(*(id *)(a1 + 32), "name", *MEMORY[0x1E4F68420]);
    id v19 = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v13 = objc_msgSend(v9, "hf_errorWithCode:operation:options:", 78, v10, v12);

    id v14 = [MEMORY[0x1E4F69110] sharedHandler];
    [v14 handleError:v13];
  }
  id v15 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v15;
}

void __39__HUEditUserViewController__removeUser__block_invoke_119(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = a2;
    id v11 = [v5 errorOnlyCompletionHandlerAdapter];

    [v4 removeUserWithoutConfirmation:v3 completionHandler:v11];
  }
  else
  {
    int v6 = (void *)MEMORY[0x1E4F691A0];
    id v7 = a2;
    char v8 = [v6 sharedDispatcher];
    id v11 = [v8 homeManager];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v7 errorOnlyCompletionHandlerAdapter];

    [v11 removeHome:v9 completionHandler:v10];
  }
}

void __39__HUEditUserViewController__removeUser__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__HUEditUserViewController__removeUser__block_invoke_3;
  v3[3] = &unk_1E638B5D8;
  char v6 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 dispatchHomeObserverMessage:v3 sender:0];
}

void __39__HUEditUserViewController__removeUser__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    if (objc_opt_respondsToSelector()) {
      [v3 home:*(void *)(a1 + 32) didRemoveUser:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v5 = [v4 homeManager];

    char v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__HUEditUserViewController__removeUser__block_invoke_4;
    v8[3] = &unk_1E638B5B0;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    id v7 = v5;
    [v6 dispatchHomeManagerObserverMessage:v8 sender:0];
  }
}

uint64_t __39__HUEditUserViewController__removeUser__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 homeManager:*(void *)(a1 + 32) didRemoveHome:*(void *)(a1 + 40)];
}

- (id)_lazyAboutResidentDeviceFooterView
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];

  if (!v3)
  {
    id v4 = [[HUAboutResidentDeviceFooterView alloc] initWithReuseIdentifier:@"HUAboutResidentDeviceFooterViewReuseIdentifier"];
    [(HUEditUserViewController *)self setAboutResidentDeviceFooterView:v4];

    id v5 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];
    [v5 setDelegate:self];

    char v6 = [(HUEditUserViewController *)self tableView];
    [v6 bounds];
    uint64_t v9 = HUViewSizeSubclassForViewSize(v7, v8);

    v28[0] = &unk_1F19B45F8;
    v28[1] = &unk_1F19B4610;
    v29[0] = &unk_1F19B6170;
    v29[1] = &unk_1F19B6180;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    double v11 = HUConstantFloatForViewSizeSubclass(v9, v10);

    id v12 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];
    objc_msgSend(v12, "setMessageInsets:", 0.0, v11, 0.0, v11);

    uint64_t v13 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;

    uint64_t v18 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];
    id v19 = [(HUEditUserViewController *)self tableView];
    [v19 bounds];
    objc_msgSend(v18, "sizeThatFits:", v20, 10000.0);
    double v22 = v21;
    double v24 = v23;

    id v25 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];
    objc_msgSend(v25, "setFrame:", v15, v17, v22, v24);
  }
  uint64_t v26 = [(HUEditUserViewController *)self aboutResidentDeviceFooterView];

  return v26;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    double v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v21, 0x16u);
  }

  uint64_t v9 = [v7 absoluteString];
  id v10 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
  double v11 = [v10 absoluteString];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(HUEditUserViewController *)self navigationController];
    double v14 = (void *)v13;
    if (v13) {
      double v15 = (HUEditUserViewController *)v13;
    }
    else {
      double v15 = self;
    }
    double v16 = v15;

    double v17 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B10]];
    uint64_t v18 = [v17 splashController];
    [v18 setDisplayDeviceType:6];

    [v17 setPresentingViewController:v16];
    [v17 present];
  }
  else
  {
    double v17 = [MEMORY[0x1E4F69378] sharedInstance];
    id v19 = (id)[v17 openURL:v7];
  }

  return 0;
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)HUEditUserViewController;
  id v8 = a5;
  id v9 = a4;
  [(HUItemTableViewController *)&v10 itemManager:a3 didUpdateResultsForItem:v9 atIndexPath:v8];
  -[HUEditUserViewController _handleUpdatedItem:atIndexPath:](self, "_handleUpdatedItem:atIndexPath:", v9, v8, v10.receiver, v10.super_class);
}

- (void)_handleUpdatedItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v21 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v21;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  objc_super v10 = [v9 settingKeyPath];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F68570]];

  if (v11)
  {
    int v12 = [v21 latestResults];
    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F67FF8]];

    double v14 = [v13 value];
    int v15 = [v14 BOOLValue];

    double v16 = [v9 value];
    int v17 = [v16 BOOLValue];

    if (v15 == v17)
    {
      uint64_t v18 = [(HUEditUserViewController *)self tableView];
      id v19 = [v18 cellForRowAtIndexPath:v7];

      double v20 = [v9 value];
      objc_msgSend(v19, "setOn:animated:", objc_msgSend(v20, "BOOLValue"), 1);
    }
  }
}

- (id)presentPinDetailsViewController
{
  id v3 = [(HUEditUserViewController *)self editUserItemManager];
  id v4 = [v3 sourceItem];

  id v5 = [(HUEditUserViewController *)self editUserItemManager];
  id v6 = [v5 home];

  objc_initWeak(&location, self);
  id v7 = [(HUEditUserViewController *)self editUserItemManager];
  id v8 = [v7 userBeingEdited];

  id v9 = [(HUEditUserViewController *)self pinCodeManager];
  objc_super v10 = [v9 userPinCodes];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke;
  v16[3] = &unk_1E6389E50;
  objc_copyWeak(&v20, &location);
  id v11 = v8;
  id v17 = v11;
  id v12 = v6;
  id v18 = v12;
  id v13 = v4;
  id v19 = v13;
  id v14 = (id)[v10 addSuccessBlock:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v10;
}

void __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke_2;
  v16[3] = &unk_1E6389E28;
  id v17 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v16);

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v6 inHome:*(void *)(a1 + 40) onAccessory:0];
    id v8 = [HUPinCodeDetailsViewController alloc];
    id v9 = [WeakRetained pinCodeManager];
    objc_super v10 = [(HUPinCodeDetailsViewController *)v8 initWithItem:v7 pinCodeManager:v9 home:*(void *)(a1 + 40)];
  }
  else
  {
    id v11 = [HUPinCodeDetailsViewController alloc];
    uint64_t v12 = *(void *)(a1 + 48);
    id v7 = [WeakRetained pinCodeManager];
    objc_super v10 = [(HUPinCodeDetailsViewController *)v11 initWithItem:v12 pinCodeManager:v7 home:*(void *)(a1 + 40)];
  }

  id v13 = _HULocalizedStringWithDefaultValue(@"HUUsersLocksTitle", @"HUUsersLocksTitle", 1);
  [(HUPinCodeDetailsViewController *)v10 setTitle:v13];

  id v14 = [WeakRetained navigationController];
  id v15 = (id)objc_msgSend(v14, "hu_pushPreloadableViewController:animated:", v10, 1);
}

uint64_t __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 userLabel];
  id v4 = [v3 user];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUEditUserViewController;
  [(HUItemTableViewController *)&v17 diffableDataItemManager:v10 didUpdateItems:v11 addItems:v12 removeItems:v13];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__HUEditUserViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v14[3] = &unk_1E6389908;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "na_each:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __88__HUEditUserViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained itemManager];
  uint64_t v5 = [v4 indexPathForItem:v3];

  [WeakRetained _handleUpdatedItem:v3 atIndexPath:v5];
}

- (id)presentDefaultAccountViewController
{
  id v3 = [HUMediaServiceDefaultAccountsTableViewController alloc];
  id v4 = [(HUEditUserViewController *)self editUserItemManager];
  uint64_t v5 = [v4 mediaServiceItemModule];
  id v6 = [v5 defaultAccountsItem];
  id v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 home];
  id v9 = [(HUMediaServiceDefaultAccountsTableViewController *)v3 initWithItem:v6 home:v8];

  id v10 = [(HUEditUserViewController *)self navigationController];
  id v11 = objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v9, 1);

  return v11;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUEditUserItemManager)editUserItemManager
{
  return self->_editUserItemManager;
}

- (HUPendingAccessoriesGridViewController)pendingAccessoriesViewController
{
  return self->_pendingAccessoriesViewController;
}

- (HUAccessorySettingsItemModuleController)userSettingsItemModuleController
{
  return self->_userSettingsItemModuleController;
}

- (void)setUserSettingsItemModuleController:(id)a3
{
}

- (HUMediaServiceSettingsItemModuleController)mediaServiceSettingsItemModuleController
{
  return self->_mediaServiceSettingsItemModuleController;
}

- (void)setMediaServiceSettingsItemModuleController:(id)a3
{
}

- (HUAboutResidentDeviceFooterView)aboutResidentDeviceFooterView
{
  return self->_aboutResidentDeviceFooterView;
}

- (void)setAboutResidentDeviceFooterView:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_aboutResidentDeviceFooterView, 0);
  objc_storeStrong((id *)&self->_mediaServiceSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_userSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_pendingAccessoriesViewController, 0);
  objc_storeStrong((id *)&self->_editUserItemManager, 0);

  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
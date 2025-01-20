@interface HUAppleMusicAccountViewController
- (BOOL)_accessorySupportsMultiUser;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HUAppleMusicAccountModuleController)appleMusicAccountModuleController;
- (HUAppleMusicAccountViewController)initWithAccessoryGroupItem:(id)a3;
- (HUAppleMusicAccountViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (HUAppleMusicAccountViewController)initWithHFItem:(id)a3 mediaProfileContainer:(id)a4;
- (HUPrimaryUserSettingsItemModuleController)primaryUserModuleController;
- (NADeallocationSentinel)appleMusicLoadingViewControllerDeallocationSentinel;
- (NAFuture)accountArbitrationFuture;
- (UIAlertController)appleMusicLoadingViewController;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_appleMusicFooterMessage;
- (id)_appleMusicFooterView;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)itemModuleControllers;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)appleMusicModuleController:(id)a3 willPresentContext:(id)a4 account:(id)a5;
- (void)appleMusicModuleControllerDidUpdateAuthenticationState:(id)a3;
- (void)appleMusicModuleControllerPresentSignInFlow:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAccountArbitrationFuture:(id)a3;
- (void)setAppleMusicAccountModuleController:(id)a3;
- (void)setAppleMusicLoadingViewController:(id)a3;
- (void)setAppleMusicLoadingViewControllerDeallocationSentinel:(id)a3;
- (void)setPrimaryUserModuleController:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAppleMusicAccountViewController

- (HUAppleMusicAccountViewController)initWithHFItem:(id)a3 mediaProfileContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[HUAppleMusicAccountItemManager alloc] initWithMediaProfileContainer:v7 delegate:self];

  v13.receiver = self;
  v13.super_class = (Class)HUAppleMusicAccountViewController;
  v9 = [(HUItemTableViewController *)&v13 initWithItemManager:v8 tableViewStyle:1];
  if (v9)
  {
    v10 = [v6 latestResults];
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [(HUAppleMusicAccountViewController *)v9 setTitle:v11];
  }
  return v9;
}

- (HUAppleMusicAccountViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 homeKitSettingsVendor];
  id v6 = [v5 homeKitObject];
  id v7 = &unk_1F1AD86A8;
  id v8 = v6;
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if ([v8 conformsToProtocol:v7]) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  v11 = v9;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v14 = NSStringFromProtocol((Protocol *)v7);
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v14 file lineNumber description];

LABEL_7:
    v11 = 0;
  }

  if (!v11)
  {
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, "-[HUAppleMusicAccountViewController initWithAccessoryGroupItem:] called without a HFMediaProfileContainer", buf, 2u);
    }
  }
  v16 = [(HUAppleMusicAccountViewController *)self initWithHFItem:v4 mediaProfileContainer:v11];

  return v16;
}

- (HUAppleMusicAccountViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HUAppleMusicAccountViewController.m" lineNumber:72 description:@"HUAppleMusicAccountViewController initialized without HUHomeKitAccessorySettingsItemModule"];
  }
  v9 = [v8 sourceItem];
  v10 = [v9 accessories];
  v11 = [v10 anyObject];

  v12 = [v11 mediaProfile];
  objc_super v13 = [(HUAppleMusicAccountViewController *)self initWithHFItem:v7 mediaProfileContainer:v12];

  return v13;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  id v6 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 appleMusicAccountModule];

  if (v9 == v5)
  {
    objc_super v13 = [HUAppleMusicAccountModuleController alloc];
    v14 = [v8 appleMusicAccountModule];
    v15 = [(HUAppleMusicAccountModuleController *)v13 initWithModule:v14];
    [(HUAppleMusicAccountViewController *)self setAppleMusicAccountModuleController:v15];

    v16 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
    [v16 setDelegate:self];

    uint64_t v17 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
  }
  else
  {
    id v10 = [v8 primaryUserSettingsItemModule];

    if (v10 != v5)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"HUAppleMusicAccountViewController.m", 93, @"Unknown module %@", v5 object file lineNumber description];

      v12 = 0;
      goto LABEL_10;
    }
    v18 = [(HUItemModuleController *)[HUPrimaryUserSettingsItemModuleController alloc] initWithModule:v5];
    [(HUAppleMusicAccountViewController *)self setPrimaryUserModuleController:v18];

    uint64_t v17 = [(HUAppleMusicAccountViewController *)self primaryUserModuleController];
  }
  v12 = (void *)v17;
LABEL_10:

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HUAppleMusicAccountViewController;
  [(HUItemTableViewController *)&v4 viewDidLoad];
  v3 = [(HUAppleMusicAccountViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"HOAppleMusicAccountViewFooterViewReuseIdentifier"];
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)HUAppleMusicAccountViewController;
  objc_super v4 = [(HUItemTableViewController *)&v8 itemModuleControllers];
  [v3 unionSet:v4];

  id v5 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  id v6 = [(HUAppleMusicAccountViewController *)self primaryUserModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  return v3;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self itemManager];
  objc_super v8 = [v7 displayedSectionIdentifierForSectionIndex:a4];

  if (![v8 isEqualToString:@"HUAppleMusicAccountModule_MusicActionsSectionIdentifier"])
  {
    v15.receiver = self;
    v15.super_class = (Class)HUAppleMusicAccountViewController;
    uint64_t v12 = [(HUItemTableViewController *)&v15 tableView:v6 viewForHeaderInSection:a4];
    goto LABEL_6;
  }
  uint64_t v9 = [(HUAppleMusicAccountViewController *)self _appleMusicFooterMessage];
  if (v9)
  {
    id v10 = (void *)v9;
    BOOL v11 = [(HUAppleMusicAccountViewController *)self _accessorySupportsMultiUser];

    if (v11)
    {
      uint64_t v12 = [(HUAppleMusicAccountViewController *)self _appleMusicFooterView];
LABEL_6:
      objc_super v13 = (void *)v12;
      goto LABEL_8;
    }
  }
  objc_super v13 = 0;
LABEL_8:

  return v13;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self itemManager];
  objc_super v8 = [v7 displayedSectionIdentifierForSectionIndex:a4];

  if ([v8 isEqualToString:@"HUAppleMusicAccountModule_MusicActionsSectionIdentifier"])
  {
    if ([(HUAppleMusicAccountViewController *)self _accessorySupportsMultiUser])
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [(HUAppleMusicAccountViewController *)self _appleMusicFooterView];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUAppleMusicAccountViewController;
    uint64_t v10 = [(HUItemTableViewController *)&v12 tableView:v6 viewForFooterInSection:a4];
  }
  uint64_t v9 = (void *)v10;
LABEL_7:

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 displayedSectionIdentifierForSectionIndex:a4];

  if ([v6 isEqualToString:@"HUPrimaryUserSettingsUserSectionIdentifier"]) {
    double v7 = 0.01;
  }
  else {
    double v7 = *MEMORY[0x1E4F43D18];
  }

  return v7;
}

- (void)appleMusicModuleController:(id)a3 willPresentContext:(id)a4 account:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  objc_super v8 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicPromptTitle", @"HUAppleMusicPromptTitle", 1);
  [v13 setTitle:v8];

  if (v7)
  {
    uint64_t v9 = [v7 username];
    [v13 setUsername:v9];

    [v13 setIsUsernameEditable:0];
    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicPromptReason", @"HUAppleMusicPromptReason", 1);
    BOOL v11 = [v7 username];
    objc_super v12 = [v10 stringByAppendingFormat:@"\n\n%@", v11];
    [v13 setReason:v12];
  }
  else
  {
    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicPromptReason", @"HUAppleMusicPromptReason", 1);
    [v13 setReason:v10];
  }

  [v13 setPresentingViewController:self];
}

- (void)appleMusicModuleControllerDidUpdateAuthenticationState:(id)a3
{
  id v13 = a3;
  objc_super v4 = [v13 module];
  if ([v4 state] == 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v13 module];
    BOOL v5 = [v6 state] != 3;
  }
  id v7 = [(HUAppleMusicAccountViewController *)self navigationItem];
  objc_super v8 = [v7 backBarButtonItem];
  [v8 setEnabled:v5];

  uint64_t v9 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
  uint64_t v10 = [(HUAppleMusicAccountViewController *)self tableView];
  uint64_t v11 = [v10 numberOfSections];

  if (v11 >= 2) {
    [v9 addIndex:1];
  }
  objc_super v12 = [(HUAppleMusicAccountViewController *)self tableView];
  [v12 _reloadSectionHeaderFooters:v9 withRowAnimation:100];
}

- (void)appleMusicModuleControllerPresentSignInFlow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUAppleMusicAccountViewController *)self tableView];
  objc_opt_class();
  id v6 = self;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  objc_super v8 = v7;

  if (v8)
  {
    uint64_t v9 = [(UITableViewController *)v8 hu_getSelectedCell];

    BOOL v5 = (void *)v9;
  }
  objc_initWeak(&location, v6);
  uint64_t v10 = (void *)MEMORY[0x1E4F42728];
  uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountSignInActionSheetTitle", @"HUAppleMusicAccountSignInActionSheetTitle", 1);
  objc_super v12 = objc_msgSend(v10, "hu_actionSheetWithTitle:message:anchorView:", 0, v11, v5);

  id v13 = (void *)MEMORY[0x1E4F42720];
  v14 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountActionSheetChangeDefaultAccountButtonTitle", @"HUAppleMusicAccountActionSheetChangeDefaultAccountButtonTitle", 1);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke;
  v22 = &unk_1E638C920;
  objc_copyWeak(&v23, &location);
  objc_super v15 = [v13 actionWithTitle:v14 style:0 handler:&v19];
  objc_msgSend(v12, "addAction:", v15, v19, v20, v21, v22);

  v16 = (void *)MEMORY[0x1E4F42720];
  uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountActionSheetCancelButtonTitle", @"HUAppleMusicAccountActionSheetCancelButtonTitle", 1);
  v18 = [v16 actionWithTitle:v17 style:1 handler:0];
  [v12 addAction:v18];

  [(HUAppleMusicAccountViewController *)v6 presentViewController:v12 animated:1 completion:0];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (void *)MEMORY[0x1E4F42728];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText", @"HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText", 1);
  objc_super v8 = objc_msgSend(v6, "hu_alertControllerWithActivityIndicatorAndTitle:", v7);
  [WeakRetained setAppleMusicLoadingViewController:v8];

  uint64_t v9 = [WeakRetained appleMusicLoadingViewController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_2;
  v10[3] = &unk_1E63862A0;
  objc_copyWeak(&v11, v4);
  [WeakRetained presentViewController:v9 animated:1 completion:v10];

  objc_destroyWeak(&v11);
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained appleMusicAccountModuleController];
  id v4 = [v3 kickOffManualLogin];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_3;
  v6[3] = &unk_1E63867B0;
  objc_copyWeak(&v7, v1);
  BOOL v5 = [v4 addCompletionBlock:v6];
  [WeakRetained setAccountArbitrationFuture:v5];

  objc_destroyWeak(&v7);
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [WeakRetained appleMusicLoadingViewController];
  uint64_t v10 = [WeakRetained presentedViewController];

  if (v9 == v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_4;
    v11[3] = &unk_1E63862A0;
    objc_copyWeak(&v12, v7);
    [WeakRetained dismissViewControllerAnimated:1 completion:v11];
    objc_destroyWeak(&v12);
  }
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAppleMusicLoadingViewController:0];
  [WeakRetained setAccountArbitrationFuture:0];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  id v11 = [MEMORY[0x1E4F696F8] musicLoginURL];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
    v14 = [v13 module];
    uint64_t v15 = [v14 state];

    if ((v15 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      v16 = (void *)MEMORY[0x1E4F42728];
      uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText", @"HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText", 1);
      v18 = objc_msgSend(v16, "hu_alertControllerWithActivityIndicatorAndTitle:", v17);
      [(HUAppleMusicAccountViewController *)self setAppleMusicLoadingViewController:v18];

      objc_initWeak((id *)buf, self);
      uint64_t v19 = [(HUAppleMusicAccountViewController *)self appleMusicLoadingViewController];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
      v21[3] = &unk_1E63862A0;
      objc_copyWeak(&v22, (id *)buf);
      [(HUAppleMusicAccountViewController *)self presentViewController:v19 animated:1 completion:v21];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }

  return 0;
}

void __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained appleMusicAccountModuleController];
  id v4 = [v3 kickOffManualLogin];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_2;
  v6[3] = &unk_1E63867B0;
  objc_copyWeak(&v7, v1);
  id v5 = [v4 addCompletionBlock:v6];
  [WeakRetained setAccountArbitrationFuture:v5];

  objc_destroyWeak(&v7);
}

void __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [WeakRetained appleMusicLoadingViewController];
  uint64_t v10 = [WeakRetained presentedViewController];

  if (v9 == v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_3;
    v11[3] = &unk_1E63862A0;
    objc_copyWeak(&v12, v7);
    [WeakRetained dismissViewControllerAnimated:1 completion:v11];
    objc_destroyWeak(&v12);
  }
}

void __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAppleMusicLoadingViewController:0];
  [WeakRetained setAccountArbitrationFuture:0];
}

- (id)_appleMusicFooterView
{
  id v3 = [(HUAppleMusicAccountViewController *)self tableView];
  id v4 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:@"HOAppleMusicAccountViewFooterViewReuseIdentifier"];

  [v4 setType:1];
  id v5 = [(HUAppleMusicAccountViewController *)self _appleMusicFooterMessage];
  [v4 setMessage:v5];

  id v6 = [v4 messageTextView];
  [v6 setDelegate:self];

  return v4;
}

- (id)_appleMusicFooterMessage
{
  BOOL v3 = [(HUAppleMusicAccountViewController *)self _accessorySupportsMultiUser];
  id v4 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
  id v5 = [v4 module];
  id v6 = [v5 signInMessage:v3];

  if (![v6 length]
    && [(HUAppleMusicAccountViewController *)self _accessorySupportsMultiUser])
  {
    id v7 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
    id v8 = [v7 module];
    uint64_t v9 = [v8 explicitAccountSignedInMessage];

    id v6 = (void *)v9;
LABEL_6:
    if ([v6 length]) {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
    }
    else {
      uint64_t v10 = 0;
    }
    goto LABEL_11;
  }
  if (![v6 length]
    || [(HUAppleMusicAccountViewController *)self _accessorySupportsMultiUser])
  {
    goto LABEL_6;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
  id v11 = [(HUAppleMusicAccountViewController *)self appleMusicAccountModuleController];
  id v12 = [v11 module];
  uint64_t v13 = [v12 numberOfKnownAccounts];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v15 = (void *)MEMORY[0x1E4F28B18];
    v16 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountSignInUsingADifferentAppleID", @"HUAppleMusicAccountSignInUsingADifferentAppleID", 1);
    uint64_t v17 = [MEMORY[0x1E4F696F8] musicLoginURL];
    v18 = objc_msgSend(v15, "hf_attributedString:withAppendedLinkString:linkURL:", v6, v16, v17);
    uint64_t v19 = [v14 initWithAttributedString:v18];

    uint64_t v10 = (void *)v19;
  }
LABEL_11:

  return v10;
}

- (BOOL)_accessorySupportsMultiUser
{
  objc_opt_class();
  BOOL v3 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 appleMusicAccountModule];

  id v7 = [v6 mediaProfileContainer];
  char v8 = objc_msgSend(v7, "hf_homePodSupportsMultiUser");

  return v8;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v10 = [(HUAppleMusicAccountViewController *)self accountArbitrationFuture];
  if (!v10
    || ([(HUAppleMusicAccountViewController *)self appleMusicLoadingViewController],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11 == v8))
  {
    v12.receiver = self;
    v12.super_class = (Class)HUAppleMusicAccountViewController;
    [(HUAppleMusicAccountViewController *)&v12 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke;
    v13[3] = &unk_1E638E8A8;
    id v14 = v8;
    BOOL v18 = v6;
    id v16 = v9;
    objc_copyWeak(&v17, &location);
    uint64_t v15 = self;
    [(HUAppleMusicAccountViewController *)self dismissViewControllerAnimated:1 completion:v13];
    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

void __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_2;
  v6[3] = &unk_1E638E880;
  id v8 = *(id *)(a1 + 48);
  objc_copyWeak(&v9, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 32);
  v5.receiver = v3;
  v5.super_class = (Class)HUAppleMusicAccountViewController;
  objc_msgSendSuper2(&v5, sel_presentViewController_animated_completion_, v2, v4, v6);

  objc_destroyWeak(&v9);
}

void __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_alloc(MEMORY[0x1E4F7A0C0]);
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_3;
  v7[3] = &unk_1E63874A0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  BOOL v6 = (void *)[v4 initWithTargetObject:v5 finalizer:v7];
  [WeakRetained setAppleMusicLoadingViewControllerDeallocationSentinel:v6];

  objc_destroyWeak(&v8);
}

void __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained appleMusicLoadingViewController];
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = [WeakRetained accountArbitrationFuture];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [WeakRetained accountArbitrationFuture];
      char v6 = [v5 isFinished];

      if (v6) {
        goto LABEL_6;
      }
      uint64_t v2 = [WeakRetained appleMusicLoadingViewController];
      [WeakRetained presentViewController:v2 animated:1 completion:0];
    }
  }
LABEL_6:
  [WeakRetained setAppleMusicLoadingViewControllerDeallocationSentinel:0];
}

- (HUAppleMusicAccountModuleController)appleMusicAccountModuleController
{
  return self->_appleMusicAccountModuleController;
}

- (void)setAppleMusicAccountModuleController:(id)a3
{
}

- (HUPrimaryUserSettingsItemModuleController)primaryUserModuleController
{
  return self->_primaryUserModuleController;
}

- (void)setPrimaryUserModuleController:(id)a3
{
}

- (NAFuture)accountArbitrationFuture
{
  return self->_accountArbitrationFuture;
}

- (void)setAccountArbitrationFuture:(id)a3
{
}

- (NADeallocationSentinel)appleMusicLoadingViewControllerDeallocationSentinel
{
  return self->_appleMusicLoadingViewControllerDeallocationSentinel;
}

- (void)setAppleMusicLoadingViewControllerDeallocationSentinel:(id)a3
{
}

- (UIAlertController)appleMusicLoadingViewController
{
  return self->_appleMusicLoadingViewController;
}

- (void)setAppleMusicLoadingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicLoadingViewController, 0);
  objc_storeStrong((id *)&self->_appleMusicLoadingViewControllerDeallocationSentinel, 0);
  objc_storeStrong((id *)&self->_accountArbitrationFuture, 0);
  objc_storeStrong((id *)&self->_primaryUserModuleController, 0);

  objc_storeStrong((id *)&self->_appleMusicAccountModuleController, 0);
}

@end
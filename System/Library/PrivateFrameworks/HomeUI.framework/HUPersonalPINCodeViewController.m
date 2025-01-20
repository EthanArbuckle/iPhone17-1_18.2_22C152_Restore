@interface HUPersonalPINCodeViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)showDoneButtonInNavBar;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFPinCodeManager)pinCodeManager;
- (HUPersonalPINCodeItemManager)personalPINCodeItemManager;
- (HUPersonalPINCodeViewController)initWithItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5;
- (HUPersonalPINCodeViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUPersonalPINCodeViewControllerDelegate)delegate;
- (HUPresentationDelegate)presentationDelegate;
- (id)currentPinCodeValue;
- (void)_hideSpinner;
- (void)_presentPinCodeErrorDialog;
- (void)_shareCode;
- (void)_showSpinner;
- (void)copy:(id)a3;
- (void)doneButtonPressed:(id)a3;
- (void)openPINCodeEditor;
- (void)setDelegate:(id)a3;
- (void)setPersonalPINCodeItemManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setShowDoneButtonInNavBar:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUPersonalPINCodeViewController

- (HUPersonalPINCodeViewController)initWithItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      NSLog(&cfstr_SuppliedItemIs.isa, v8);
    }
  }
  v11 = (void *)[v8 copy];
  v12 = [[HUPersonalPINCodeItemManager alloc] initWithDelegate:self item:v11 pinCodeManager:v9 home:v10];

  v16.receiver = self;
  v16.super_class = (Class)HUPersonalPINCodeViewController;
  v13 = [(HUItemTableViewController *)&v16 initWithItemManager:v12 tableViewStyle:1];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pinCodeManager, a4);
    objc_storeWeak((id *)&v14->_personalPINCodeItemManager, v12);
  }

  return v14;
}

- (HUPersonalPINCodeViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithItem_pinCodeManager_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalPINCodeViewController.m", 68, @"%s is unavailable; use %@ instead",
    "-[HUPersonalPINCodeViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HUPersonalPINCodeViewController;
  [(HUItemTableViewController *)&v5 viewDidLoad];
  if ([(HUPersonalPINCodeViewController *)self showDoneButtonInNavBar])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
    v4 = [(HUPersonalPINCodeViewController *)self navigationItem];
    [v4 setRightBarButtonItem:v3];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)doneButtonPressed:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[HUPersonalPINCodeViewController doneButtonPressed:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'done' button", (uint8_t *)&v6, 0xCu);
  }

  objc_super v5 = [(HUPersonalPINCodeViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HUPersonalPINCodeViewController;
  [(HUItemTableViewController *)&v34 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  v12 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  v13 = [v12 pinCodeValueItem];
  int v14 = [v11 isEqual:v13];

  if (!v14)
  {
    v18 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
    v19 = [v18 pinCodeChangeItem];
    if ([v11 isEqual:v19])
    {
    }
    else
    {
      v20 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
      v21 = [v20 shareButtonItem];
      int v22 = [v11 isEqual:v21];

      if (!v22)
      {
        v23 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
        v24 = [v23 createUserPINButtonItem];
        int v25 = [v11 isEqual:v24];

        if (!v25)
        {
          v28 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
          v29 = [v28 removeUserPINButtonItem];
          int v30 = [v11 isEqual:v29];

          if (!v30) {
            goto LABEL_10;
          }
          objc_super v16 = +[HUListContentConfigurationUtilities buttonStyleConfigurationForItem:v11 isDestructive:1];
          v31 = [v11 latestResults];
          v17 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];

          if ([v17 BOOLValue])
          {
            v32 = [MEMORY[0x1E4F428B8] systemGrayColor];
            v33 = [v16 textProperties];
            [v33 setColor:v32];
          }
          [v10 setContentConfiguration:v16];
          goto LABEL_3;
        }
      }
    }
    objc_super v16 = +[HUListContentConfigurationUtilities buttonStyleConfigurationForItem:v11 isDestructive:0];
    [v10 setContentConfiguration:v16];
    goto LABEL_9;
  }
  v15 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
  objc_super v16 = +[HUListContentConfigurationUtilities labelConfiguration:v15 forItem:v11];

  [v10 setContentConfiguration:v16];
  v17 = [v10 layer];
  [v17 setDisableUpdateMask:16];
LABEL_3:

LABEL_9:
LABEL_10:
  v26 = [v11 latestResults];
  v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v10 setAccessibilityIdentifier:v27];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HUItemTableViewController *)self itemManager];
  v7 = [v6 displayedItemAtIndexPath:v5];

  objc_opt_class();
  uint64_t v8 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  id v9 = [v8 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  v12 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  v13 = [v12 pinCodeValueItem];
  if (v13 == v7)
  {
    v17 = [v11 user];

    if (v17)
    {
      char v16 = 0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  int v14 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  v15 = [v14 removeUserPINButtonItem];
  if (v15 == v7)
  {
    v18 = [v7 latestResults];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    char v20 = [v19 BOOLValue];

    char v16 = v20 ^ 1;
  }
  else
  {

    char v16 = 1;
  }
LABEL_11:

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)HUPersonalPINCodeViewController;
  [(HUItemTableViewController *)&v65 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 deselectRowAtIndexPath:v7 animated:1];
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v67 = self;
    __int16 v68 = 2080;
    v69 = "-[HUPersonalPINCodeViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v70 = 2112;
    v71 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "In %@'s %s, user selected item %@", buf, 0x20u);
  }

  objc_opt_class();
  id v11 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  v12 = [v11 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  v15 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  char v16 = [v15 pinCodeValueItem];
  char v17 = [v9 isEqual:v16];
  if (v14) {
    char v18 = v17;
  }
  else {
    char v18 = 0;
  }
  if (v18)
  {
    v19 = [v14 user];
    BOOL v20 = v19 == 0;

    if (v20)
    {
      v21 = [MEMORY[0x1E4F42B88] sharedMenuController];
      int v22 = [v6 cellForRowAtIndexPath:v7];
      [(HUPersonalPINCodeViewController *)self becomeFirstResponder];
      v23 = [(HUPersonalPINCodeViewController *)self view];
      [v22 frame];
      objc_msgSend(v21, "showMenuFromView:rect:", v23);

      goto LABEL_24;
    }
  }
  else
  {
  }
  v24 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  int v25 = [v24 pinCodeChangeItem];
  int v26 = [v9 isEqual:v25];

  if (v26) {
    goto LABEL_14;
  }
  v27 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  v28 = [v27 shareButtonItem];
  int v29 = [v9 isEqual:v28];

  if (v29)
  {
    [(HUPersonalPINCodeViewController *)self _shareCode];
    goto LABEL_24;
  }
  int v30 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  v31 = [v30 createUserPINButtonItem];
  int v32 = [v9 isEqual:v31];

  if (v32)
  {
LABEL_14:
    [(HUPersonalPINCodeViewController *)self openPINCodeEditor];
  }
  else
  {
    v33 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
    objc_super v34 = [v33 removeUserPINButtonItem];
    int v35 = [v9 isEqual:v34];

    if (v35)
    {
      v36 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
      char v37 = [v36 operationInProgress];

      if ((v37 & 1) == 0)
      {
        v38 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
        v39 = [v38 home];
        v61 = [v39 currentUser];

        v40 = [v61 uniqueIdentifier];
        v41 = [v14 user];
        v42 = [v41 uniqueIdentifier];
        LODWORD(v38) = [v40 isEqual:v42];

        v59 = _HULocalizedStringWithDefaultValue(@"HUPinCodeDeleteAlertTitle", @"HUPinCodeDeleteAlertTitle", 1);
        v43 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
        v60 = [v43 home];

        if (v38) {
          v44 = @"HUPinCodeDeleteCurrentUserPINCodeAlertMessage";
        }
        else {
          v44 = @"HUPinCodeDeleteOtherUserPINCodeAlertMessage";
        }
        v45 = [v60 name];
        v58 = HULocalizedStringWithFormat(v44, @"%@", v46, v47, v48, v49, v50, v51, (uint64_t)v45);

        v57 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
        v52 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
        v53 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v59 message:v58 preferredStyle:1];
        objc_initWeak((id *)buf, self);
        v54 = (void *)MEMORY[0x1E4F42720];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v62[3] = &unk_1E6387430;
        objc_copyWeak(&v64, (id *)buf);
        id v63 = v14;
        v55 = [v54 actionWithTitle:v57 style:2 handler:v62];
        [v53 addAction:v55];

        v56 = [MEMORY[0x1E4F42720] actionWithTitle:v52 style:0 handler:&__block_literal_global_189];
        [v53 addAction:v56];

        [(HUPersonalPINCodeViewController *)self presentViewController:v53 animated:1 completion:0];
        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)buf);
      }
    }
  }
LABEL_24:
}

void __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[HUPersonalPINCodeViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v15 = 2112;
    char v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped confirm button with title '%@' from the alert popup", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showSpinner];
  id v7 = [*(id *)(a1 + 32) user];
  uint64_t v8 = [WeakRetained pinCodeManager];
  id v9 = [v8 deleteUserPinCodeWithUser:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_46;
  v11[3] = &unk_1E63852A8;
  v11[4] = WeakRetained;
  id v12 = *(id *)(a1 + 32);
  id v10 = (id)[v9 addCompletionBlock:v11];
}

void __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v14 = v4;
  if (v4)
  {
    [v5 _hideSpinner];
    id v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:v14 operationType:*MEMORY[0x1E4F687F8] options:0 retryBlock:0 cancelBlock:0];
  }
  else
  {
    int v7 = [v5 showDoneButtonInNavBar];
    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      id v6 = [v8 presentingViewController];
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      id v9 = [v8 navigationController];
      id v10 = (id)[v9 popViewControllerAnimated:1];

      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 personalPinCodeViewController:*(void *)(a1 + 32) pinCodeDidChange:0];
    }
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = [*(id *)(a1 + 32) personalPINCodeItemManager];
  v13 = [v12 home];
  objc_msgSend(v11, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E4F681A0]);

  objc_msgSend(v11, "na_safeSetObject:forKey:", &unk_1F19B4AA8, *MEMORY[0x1E4F68048]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", *(void *)(a1 + 40), *MEMORY[0x1E4F68040]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v14, *MEMORY[0x1E4F68190]);
  [MEMORY[0x1E4F68EE0] sendEvent:26 withData:v11];
}

void __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_53()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[HUPersonalPINCodeViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v1, 0xCu);
  }
}

- (id)currentPinCodeValue
{
  objc_opt_class();
  uint64_t v3 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  id v4 = [v3 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  int v7 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  uint64_t v8 = [v7 home];

  uint64_t v9 = [v8 currentUser];
  id v10 = [(id)v9 uniqueIdentifier];
  id v11 = [v6 user];
  id v12 = [v11 uniqueIdentifier];
  int v13 = [v10 isEqual:v12];

  LOBYTE(v9) = [v6 isGuest];
  if ((v9 & 1) != 0 || (id v14 = 0, v13))
  {
    __int16 v15 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
    char v16 = [v15 pinCodeValueItem];
    uint64_t v17 = [v16 latestResults];
    id v14 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  }

  return v14;
}

- (void)openPINCodeEditor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2080;
    v21 = "-[HUPersonalPINCodeViewController openPINCodeEditor]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Opening PINCode Editor", buf, 0x16u);
  }

  id v5 = [(HUPersonalPINCodeViewController *)self pinCodeManager];
  id v6 = [v5 hasValidConstraints];

  objc_initWeak((id *)buf, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke;
  v16[3] = &unk_1E638E700;
  objc_copyWeak(v17, (id *)buf);
  v17[1] = (id)a2;
  id v7 = (id)[v6 addSuccessBlock:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_61;
  v14[3] = &unk_1E6386FB8;
  objc_copyWeak(&v15, (id *)buf);
  id v8 = (id)[v6 addFailureBlock:v14];
  uint64_t v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_64;
  v12[3] = &unk_1E6386018;
  id v10 = v6;
  id v13 = v10;
  id v11 = (id)[v9 afterDelay:v12 performBlock:1.0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x3032000000;
  objc_super v34 = __Block_byref_object_copy__24;
  int v35 = __Block_byref_object_dispose__24;
  id v5 = [WeakRetained personalPINCodeItemManager];
  id v36 = [v5 home];

  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__24;
  int v29 = __Block_byref_object_dispose__24;
  id v6 = [WeakRetained personalPINCodeItemManager];
  id v30 = [v6 sourceItem];

  if ([v3 BOOLValue] && v32[5] && v26[5])
  {
    id v7 = [WeakRetained currentPinCodeValue];
    id v8 = [HUPinCodeEditorViewController alloc];
    uint64_t v9 = v26[5];
    id v10 = [WeakRetained pinCodeManager];
    uint64_t v11 = v32[5];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    __int16 v20 = __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_55;
    v21 = &unk_1E638E6D8;
    objc_copyWeak(v24, (id *)(a1 + 32));
    uint64_t v22 = &v25;
    v23 = &v31;
    v24[1] = *(id *)(a1 + 40);
    id v12 = [(HUPinCodeEditorViewController *)v8 initForEditingPinCodeWithItem:v9 pinCodeManager:v10 pinCodeValue:v7 home:v11 completionBlock:&v18];

    id v13 = objc_msgSend(WeakRetained, "hu_delegateForModalPresentation", v18, v19, v20, v21);
    [v12 setPresentationDelegate:v13];

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v12];
    [WeakRetained presentViewController:v14 animated:1 completion:0];

    objc_destroyWeak(v24);
  }
  else
  {
    id v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v32[5];
      uint64_t v17 = v26[5];
      *(_DWORD *)buf = 138412802;
      uint64_t v38 = v16;
      __int16 v39 = 2112;
      uint64_t v40 = v17;
      __int16 v41 = 2112;
      id v42 = v3;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Unable to update pincode. Home:%@, sourceItem:%@, validConstraints:%@", buf, 0x20u);
    }

    [WeakRetained _presentPinCodeErrorDialog];
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_55(uint64_t a1, void *a2)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_opt_class();
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v3 && v7)
  {
    [v7 updateFromPinCode:v3];
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v3 inHome:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) onAccessory:0];
    id v10 = [WeakRetained personalPINCodeItemManager];
    [v10 setSourceItem:v9];

    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v9;

    uint64_t v8 = 0;
  }
  id v13 = [WeakRetained personalPINCodeItemManager];
  [v13 resetItemProvidersAndModules];

  id v14 = [WeakRetained personalPINCodeItemManager];
  id v15 = (id)[v14 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 56)];

  uint64_t v16 = [WeakRetained delegate];
  [v16 personalPinCodeViewController:WeakRetained pinCodeDidChange:v3];

  uint64_t v17 = *MEMORY[0x1E4F681A0];
  v22[0] = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v18 = *MEMORY[0x1E4F68048];
  v21[0] = v17;
  v21[1] = v18;
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v8];
  v22[1] = v19;
  v21[2] = *MEMORY[0x1E4F68040];
  v22[2] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  [MEMORY[0x1E4F68EE0] sendEvent:26 withData:v20];
}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[HUPersonalPINCodeViewController openPINCodeEditor]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "(%s) Unable to retrieve valid Pin Code constraints with error: %@", (uint8_t *)&v6, 0x16u);
  }

  [WeakRetained _presentPinCodeErrorDialog];
}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_64(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v3];
  }
}

- (void)copy:(id)a3
{
  id v5 = [(HUPersonalPINCodeViewController *)self currentPinCodeValue];
  if (v5)
  {
    id v3 = [MEMORY[0x1E4F42C50] generalPasteboard];
    id v4 = [(id)*MEMORY[0x1E4F44470] identifier];
    [v3 setValue:v5 forPasteboardType:v4];
  }
}

- (void)_shareCode
{
  objc_opt_class();
  id v3 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  id v4 = [v3 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v17 = v5;

  int v6 = [v17 pinCodeValue];

  if (v6)
  {
    id v7 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
    __int16 v8 = [v7 home];
    id v9 = +[HUPinCodeUtilities createSharingViewControllerForPinCodeItem:v17 inHome:v8];

    if ([v9 modalPresentationStyle] == 7)
    {
      uint64_t v10 = [v9 popoverPresentationController];
      uint64_t v11 = [(HUPersonalPINCodeViewController *)self tableView];
      id v12 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
      id v13 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
      id v14 = [v13 shareButtonItem];
      id v15 = [v12 indexPathForItem:v14];
      uint64_t v16 = [v11 cellForRowAtIndexPath:v15];
      [v10 setSourceView:v16];
    }
    [(HUPersonalPINCodeViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (void)_showSpinner
{
  id v13 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v13];
  id v5 = [(HUPersonalPINCodeViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  [v13 startAnimating];
  int v6 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  [v6 setOperationInProgress:1];

  id v7 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  __int16 v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  uint64_t v10 = [v9 removeUserPINButtonItem];
  uint64_t v11 = [v8 setWithObject:v10];
  id v12 = (id)[v7 updateResultsForItems:v11 senderSelector:a2];
}

- (void)_hideSpinner
{
  objc_opt_class();
  id v4 = [(HUPersonalPINCodeViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];
  int v6 = [v5 customView];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [(HUPersonalPINCodeViewController *)self navigationItem];
  [v9 setRightBarButtonItem:0];

  [v8 stopAnimating];
  uint64_t v10 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  [v10 setOperationInProgress:0];

  id v16 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = [(HUPersonalPINCodeViewController *)self personalPINCodeItemManager];
  id v13 = [v12 removeUserPINButtonItem];
  id v14 = [v11 setWithObject:v13];
  id v15 = (id)[v16 updateResultsForItems:v14 senderSelector:a2];
}

- (void)_presentPinCodeErrorDialog
{
  _HULocalizedStringWithDefaultValue(@"HUPinCodeEditUnavailableAlertTitle", @"HUPinCodeEditUnavailableAlertTitle", 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = _HULocalizedStringWithDefaultValue(@"HUPinCodeEditUnavailableAlertMessage", @"HUPinCodeEditUnavailableAlertMessage", 1);
  id v4 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v8 message:v3 preferredStyle:1];
  id v5 = (void *)MEMORY[0x1E4F42720];
  int v6 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  id v7 = [v5 actionWithTitle:v6 style:2 handler:&__block_literal_global_81_0];
  [v4 addAction:v7];

  [(HUPersonalPINCodeViewController *)self presentViewController:v4 animated:1 completion:0];
}

void __61__HUPersonalPINCodeViewController__presentPinCodeErrorDialog__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[HUPersonalPINCodeViewController _presentPinCodeErrorDialog]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped ok button from the alert popup", (uint8_t *)&v1, 0xCu);
  }
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUPersonalPINCodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPersonalPINCodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showDoneButtonInNavBar
{
  return self->_showDoneButtonInNavBar;
}

- (void)setShowDoneButtonInNavBar:(BOOL)a3
{
  self->_showDoneButtonInNavBar = a3;
}

- (HUPersonalPINCodeItemManager)personalPINCodeItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personalPINCodeItemManager);

  return (HUPersonalPINCodeItemManager *)WeakRetained;
}

- (void)setPersonalPINCodeItemManager:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_destroyWeak((id *)&self->_personalPINCodeItemManager);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
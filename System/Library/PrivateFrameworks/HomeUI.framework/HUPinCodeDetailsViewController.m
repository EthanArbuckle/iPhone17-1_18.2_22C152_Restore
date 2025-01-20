@interface HUPinCodeDetailsViewController
- (BOOL)_codeLabelHasChanged;
- (BOOL)_codeValueHasChanged;
- (BOOL)canBecomeFirstResponder;
- (BOOL)creatingNewPinCode;
- (BOOL)isClosing;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFPinCodeManager)pinCodeManager;
- (HUPinCodeDetailsItemManager)pinCodeItemManager;
- (HUPinCodeDetailsViewController)initWithItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5;
- (HUPinCodeDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUPinCodeDetailsViewDelegate)delegate;
- (HUPresentationDelegate)presentationDelegate;
- (NSArray)pinAccessories;
- (NSMutableArray)accessoriesToEdit;
- (NSMutableSet)inFlightAllowedAccessoryAdditions;
- (NSMutableSet)inFlightAllowedAccessoryRemovals;
- (NSString)editedPinCodeLabel;
- (NSString)editedPinCodeValue;
- (id)_allTextFields;
- (id)_validatePinCodeLabel;
- (id)commitAccessoryChanges;
- (id)commitNewPinCode;
- (id)commitPinCodeChanges;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)_presentPinCodeErrorDialog;
- (void)_resignFirstResponderForAllTextFields;
- (void)_updateSaveEnabled;
- (void)hideSpinner;
- (void)itemManagerDidFinishUpdate:(id)a3;
- (void)personalPinCodeViewController:(id)a3 pinCodeDidChange:(id)a4;
- (void)pinCodeManagerFetchDidComplete:(id)a3;
- (void)setAccessoriesToEdit:(id)a3;
- (void)setCreatingNewPinCode:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditedPinCodeLabel:(id)a3;
- (void)setEditedPinCodeValue:(id)a3;
- (void)setInFlightAllowedAccessoryAdditions:(id)a3;
- (void)setInFlightAllowedAccessoryRemovals:(id)a3;
- (void)setIsClosing:(BOOL)a3;
- (void)setPinAccessories:(id)a3;
- (void)setPinCodeItemManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)showSpinner;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUPinCodeDetailsViewController

- (HUPinCodeDetailsViewController)initWithItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        NSLog(&cfstr_SuppliedItemIs.isa, v8);
      }
    }
  }
  v11 = (void *)[v8 copy];
  v12 = [[HUPinCodeDetailsItemManager alloc] initWithDelegate:self sourceItem:v11 pinCodeManager:v9 home:v10];
  v44.receiver = self;
  v44.super_class = (Class)HUPinCodeDetailsViewController;
  v13 = [(HUItemTableViewController *)&v44 initWithItemManager:v12 tableViewStyle:1];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pinCodeManager, a4);
    objc_storeWeak((id *)&v14->_pinCodeItemManager, v12);
    v14->_isClosing = 0;
    [(HUItemTableViewController *)v14 setAutomaticallyUpdatesViewControllerTitle:0];
    objc_opt_class();
    id v15 = v11;
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (v8)
    {
      v18 = [v17 accessories];
      v19 = (void *)[v18 copy];
      [(HUPinCodeDetailsViewController *)v14 setPinAccessories:v19];

      v20 = [(HUPinCodeDetailsViewController *)v14 pinAccessories];
      v21 = (void *)[v20 mutableCopy];
      [(HUPinCodeDetailsViewController *)v14 setAccessoriesToEdit:v21];

      v22 = [(HUPinCodeDetailsViewController *)v14 pinCodeItemManager];
      v23 = [v22 sourceItem];
      [v23 latestResults];
      id v41 = v8;
      v24 = v12;
      v25 = v11;
      id v26 = v10;
      id v27 = v9;
      v29 = id v28 = v17;
      v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [(HUPinCodeDetailsViewController *)v14 setTitle:v30];

      id v17 = v28;
      id v9 = v27;
      id v10 = v26;
      v11 = v25;
      v12 = v24;
      id v8 = v41;
    }
    else
    {
      v31 = _HULocalizedStringWithDefaultValue(@"HUAddGuestPinCodeTitle", @"HUAddGuestPinCodeTitle", 1);
      [(HUPinCodeDetailsViewController *)v14 setTitle:v31];

      [(HUPinCodeDetailsViewController *)v14 setCreatingNewPinCode:1];
      [(HUPinCodeDetailsViewController *)v14 setPinAccessories:MEMORY[0x1E4F1CBF0]];
      v32 = objc_msgSend(v10, "hf_accessoriesSupportingAccessCodes");
      v33 = (void *)[v32 mutableCopy];
      [(HUPinCodeDetailsViewController *)v14 setAccessoriesToEdit:v33];

      v34 = [v9 generateNewCodeValue];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __67__HUPinCodeDetailsViewController_initWithItem_pinCodeManager_home___block_invoke;
      v42[3] = &unk_1E638FF38;
      v43 = v14;
      id v35 = (id)[v34 addSuccessBlock:v42];

      v22 = v43;
    }

    uint64_t v36 = objc_opt_new();
    inFlightAllowedAccessoryRemovals = v14->_inFlightAllowedAccessoryRemovals;
    v14->_inFlightAllowedAccessoryRemovals = (NSMutableSet *)v36;

    uint64_t v38 = objc_opt_new();
    inFlightAllowedAccessoryAdditions = v14->_inFlightAllowedAccessoryAdditions;
    v14->_inFlightAllowedAccessoryAdditions = (NSMutableSet *)v38;
  }
  return v14;
}

void __67__HUPinCodeDetailsViewController_initWithItem_pinCodeManager_home___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEditedPinCodeValue:a2];
  v3 = [*(id *)(a1 + 32) pinCodeItemManager];
  v4 = [v3 pinCodeValueItem];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 updateCellForItems:v6];
  }
}

- (HUPinCodeDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithItem_pinCodeManager_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPinCodeDetailsViewController.m", 140, @"%s is unavailable; use %@ instead",
    "-[HUPinCodeDetailsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUPinCodeDetailsViewController *)self setIsClosing:1];
  v5 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HUPinCodeDetailsViewController;
  [(HUItemTableViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUPinCodeDetailsViewController;
  [(HUItemTableViewController *)&v10 viewDidAppear:a3];
  v4 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
  [v4 addObserver:self];

  v5 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  objc_super v6 = [v5 pinCodeLabelItem];
  v7 = [(HUItemTableViewController *)self textFieldForVisibleItem:v6];

  id v8 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v9 = [v8 sourceItem];

  if (!v9 && v7) {
    [v7 becomeFirstResponder];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)showSpinner
{
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  v4 = [(HUPinCodeDetailsViewController *)self delegate];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v16];
  if (v4)
  {
    objc_super v6 = [(HUPinCodeDetailsViewController *)self delegate];
    [v6 setAddButtonItem:v5];
  }
  else
  {
    objc_super v6 = [(HUPinCodeDetailsViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }

  [v16 startAnimating];
  v7 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  [v7 setOperationInProgress:1];

  id v8 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v10 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v11 = [v10 deleteGuestPINCodeItem];
  v12 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v13 = [v12 pinCodeRestoreAccessItem];
  v14 = objc_msgSend(v9, "setWithObjects:", v11, v13, 0);
  id v15 = (id)[v8 updateResultsForItems:v14 senderSelector:a2];
}

- (void)hideSpinner
{
  v4 = [(HUPinCodeDetailsViewController *)self delegate];

  objc_opt_class();
  if (v4)
  {
    v5 = [(HUPinCodeDetailsViewController *)self delegate];
    objc_super v6 = [v5 addButtonItem];
    v7 = [v6 customView];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v23 = v8;

    id v9 = [(HUPinCodeDetailsViewController *)self delegate];
    [v9 setAddButtonItem:0];
  }
  else
  {
    objc_super v10 = [(HUPinCodeDetailsViewController *)self navigationItem];
    v11 = [v10 rightBarButtonItem];
    v12 = [v11 customView];
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v23 = v13;

    id v9 = [(HUPinCodeDetailsViewController *)self navigationItem];
    [v9 setRightBarButtonItem:0];
  }

  [v23 stopAnimating];
  v14 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  [v14 setOperationInProgress:0];

  id v15 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  id v17 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v18 = [v17 deleteGuestPINCodeItem];
  v19 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v20 = [v19 pinCodeRestoreAccessItem];
  v21 = objc_msgSend(v16, "setWithObjects:", v18, v20, 0);
  id v22 = (id)[v15 updateResultsForItems:v21 senderSelector:a2];
}

- (id)commitAccessoryChanges
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(HUPinCodeDetailsViewController *)self creatingNewPinCode])
  {
    v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    [(HUPinCodeDetailsViewController *)self showSpinner];
    objc_opt_class();
    v5 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    objc_super v6 = [v5 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    id v9 = [(HUPinCodeDetailsViewController *)self accessoriesToEdit];
    objc_super v10 = [(HUPinCodeDetailsViewController *)self pinAccessories];
    v11 = [v9 differenceFromArray:v10];

    v12 = [v11 insertions];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = [v11 insertions];
      id v15 = objc_msgSend(v14, "na_map:", &__block_literal_global_235);

      id v16 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
      id v17 = [v16 setPinCodeWithItem:v8 enabled:1 onAccessories:v15];
      [v3 addObject:v17];
    }
    v18 = [v11 removals];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v20 = [v11 removals];
      v21 = objc_msgSend(v20, "na_map:", &__block_literal_global_29_3);

      id v22 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
      id v23 = [v22 setPinCodeWithItem:v8 enabled:0 onAccessories:v21];
      [v3 addObject:v23];
    }
    v24 = [(HUPinCodeDetailsViewController *)self accessoriesToEdit];
    v25 = (void *)[v24 copy];

    objc_initWeak(&location, self);
    id v26 = (void *)MEMORY[0x1E4F7A0D8];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_3;
    v33[3] = &unk_1E6386D18;
    objc_copyWeak(&v35, &location);
    id v27 = v25;
    id v34 = v27;
    id v28 = [v26 futureWithBlock:v33];
    [v3 addObject:v28];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

    objc_initWeak(&location, self);
    v29 = [MEMORY[0x1E4F7A0D8] chainFutures:v3];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_4;
    v31[3] = &unk_1E63867B0;
    objc_copyWeak(&v32, &location);
    v4 = [v29 addCompletionBlock:v31];
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 object];
}

void __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setPinAccessories:*(void *)(a1 + 32)];
  [v4 finishWithNoResult];
}

void __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hideSpinner];
  if (v6)
  {
    v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v6 operationType:*MEMORY[0x1E4F68830] options:0 retryBlock:0 cancelBlock:0];
  }
}

- (id)commitPinCodeChanges
{
  objc_opt_class();
  id v4 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v5 = [v4 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if ([(HUPinCodeDetailsViewController *)self creatingNewPinCode])
  {
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    if ([(HUPinCodeDetailsViewController *)self _codeLabelHasChanged]
      && ([(HUPinCodeDetailsViewController *)self editedPinCodeLabel],
          id v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 length],
          v9,
          v10))
    {
      [(HUPinCodeDetailsViewController *)self showSpinner];
      objc_initWeak(&location, self);
      v11 = [(HUPinCodeDetailsViewController *)self _validatePinCodeLabel];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke;
      v17[3] = &unk_1E638FF80;
      objc_copyWeak(&v19, &location);
      id v18 = v7;
      v12 = [v11 flatMap:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_2;
    v14[3] = &unk_1E6387B88;
    objc_copyWeak(v16, &location);
    id v15 = v7;
    v16[1] = (id)a2;
    id v8 = [v12 addCompletionBlock:v14];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained pinCodeManager];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [WeakRetained editedPinCodeLabel];
  id v6 = [v3 updateGuestPinCodeWithItem:v4 withLabel:v5];

  return v6;
}

void __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained hideSpinner];
  if (a3)
  {
    [WeakRetained setEditedPinCodeValue:0];
    [WeakRetained setEditedPinCodeLabel:0];
    id v6 = [WeakRetained pinCodeItemManager];
    id v7 = [v6 pinCodeValueItem];
    v19[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [WeakRetained updateCellForItems:v8];
  }
  else
  {
    id v9 = [WeakRetained editedPinCodeValue];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) pinCodeValue];
    }
    id v6 = v11;

    v12 = [WeakRetained pinCodeManager];
    uint64_t v13 = [v12 pinCodeForCodeValue:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_3;
    v15[3] = &unk_1E638FCA0;
    id v16 = *(id *)(a1 + 32);
    id v17 = WeakRetained;
    uint64_t v18 = *(void *)(a1 + 48);
    id v14 = (id)[v13 addSuccessBlock:v15];

    id v7 = v16;
  }
}

void __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) updateFromPinCode:a2];
  [*(id *)(a1 + 40) setEditedPinCodeValue:0];
  [*(id *)(a1 + 40) setEditedPinCodeLabel:0];
  id v4 = [*(id *)(a1 + 40) pinCodeItemManager];
  id v3 = (id)[v4 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];
}

- (id)commitNewPinCode
{
  [(HUPinCodeDetailsViewController *)self showSpinner];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  if ([(HUPinCodeDetailsViewController *)self creatingNewPinCode])
  {
    [(HUPinCodeDetailsViewController *)self _resignFirstResponderForAllTextFields];
    objc_initWeak(&location, self);
    id v4 = [(HUPinCodeDetailsViewController *)self _validatePinCodeLabel];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke;
    v14[3] = &unk_1E638B350;
    objc_copyWeak(&v15, &location);
    uint64_t v5 = [v4 flatMap:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    id v3 = (void *)v5;
  }
  else
  {
    NSLog(&cfstr_Commitnewpinco.isa);
  }
  id v6 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v7 = [v6 home];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2;
  v11[3] = &unk_1E638FFA8;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = [v3 addCompletionBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

id __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained pinCodeManager];
  id v3 = [WeakRetained editedPinCodeValue];
  id v4 = [WeakRetained editedPinCodeLabel];
  uint64_t v5 = [WeakRetained accessoriesToEdit];
  id v6 = [v2 addGuestPinCode:v3 withLabel:v4 onAccessories:v5];

  return v6;
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v7 inHome:*(void *)(a1 + 32) onAccessory:0];

  id v10 = (id)[v9 updateWithOptions:MEMORY[0x1E4F1CC08]];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", *(void *)(a1 + 32), *MEMORY[0x1E4F681A0]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", &unk_1F19B4DD8, *MEMORY[0x1E4F68048]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E4F68040]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E4F68190]);

  [MEMORY[0x1E4F68EE0] sendEvent:26 withData:v11];
  if (WeakRetained)
  {
    [WeakRetained hideSpinner];
    if (v7)
    {
      dispatch_time_t v12 = dispatch_time(0, 650000000);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_41;
      v13[3] = &unk_1E63850E0;
      id v14 = v9;
      id v15 = *(id *)(a1 + 32);
      dispatch_after(v12, MEMORY[0x1E4F14428], v13);
    }
  }
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_41(uint64_t a1)
{
  if ([MEMORY[0x1E4F22448] isCurrentProcessAnApplicationExtension])
  {
    NSLog(&cfstr_WeAreCurrently.isa);
  }
  else
  {
    v2 = [MEMORY[0x1E4F42738] performSelector:sel_sharedApplication];
    id v3 = [v2 keyWindow];
    id v4 = [v3 rootViewController];
    uint64_t v5 = [v4 presentedViewController];
    id v6 = v4;
    if (v5)
    {
      id v7 = (void *)v5;
      id v8 = v4;
      while (1)
      {
        id v9 = [v8 presentedViewController];
        char v10 = [v9 isBeingDismissed];

        if (v10) {
          break;
        }
        id v6 = [v8 presentedViewController];

        id v7 = [v6 presentedViewController];
        id v8 = v6;
        if (!v7) {
          goto LABEL_9;
        }
      }
      id v6 = v8;
    }
LABEL_9:
    id v11 = (void *)MEMORY[0x1E4F42728];
    dispatch_time_t v12 = _HULocalizedStringWithDefaultValue(@"HUPinCodeShareButtonTitle", @"HUPinCodeShareButtonTitle", 1);
    id v13 = _HULocalizedStringWithDefaultValue(@"HUPinCodeShareAlertMessage", @"HUPinCodeShareAlertMessage", 1);
    id v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

    id v15 = (void *)MEMORY[0x1E4F42720];
    id v16 = _HULocalizedStringWithDefaultValue(@"HUPinCodeShareAlertButton", @"HUPinCodeShareAlertButton", 1);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2_60;
    v22[3] = &unk_1E63896E0;
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v25 = v6;
    id v17 = v6;
    uint64_t v18 = [v15 actionWithTitle:v16 style:0 handler:v22];
    [v14 addAction:v18];

    id v19 = (void *)MEMORY[0x1E4F42720];
    v20 = _HULocalizedStringWithDefaultValue(@"HUPinCodeShareAlertNotNowButton", @"HUPinCodeShareAlertNotNowButton", 1);
    v21 = [v19 actionWithTitle:v20 style:1 handler:&__block_literal_global_72_0];
    [v14 addAction:v21];

    [v17 presentViewController:v14 animated:1 completion:0];
  }
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2_60(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 title];
    int v9 = 136315394;
    char v10 = "-[HUPinCodeDetailsViewController commitNewPinCode]_block_invoke_2";
    __int16 v11 = 2112;
    dispatch_time_t v12 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped share button '%@' from the alert popup", (uint8_t *)&v9, 0x16u);
  }
  id v6 = +[HUPinCodeUtilities createSharingViewControllerForPinCodeItem:*(void *)(a1 + 32) inHome:*(void *)(a1 + 40)];
  if ([v6 modalPresentationStyle] == 7)
  {
    id v7 = [v6 popoverPresentationController];
    id v8 = [*(id *)(a1 + 48) view];
    [v7 setSourceView:v8];
  }
  [*(id *)(a1 + 48) presentViewController:v6 animated:1 completion:&__block_literal_global_65_0];
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_62()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[HUPinCodeDetailsViewController commitNewPinCode]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) Completed presenting activity view controller", (uint8_t *)&v1, 0xCu);
  }
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 title];
    int v5 = 136315394;
    id v6 = "-[HUPinCodeDetailsViewController commitNewPinCode]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Not now button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);
  }
}

- (void)pinCodeManagerFetchDidComplete:(id)a3
{
  int v5 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v6 = [v5 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    id v8 = (id)[v9 reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
}

- (void)itemManagerDidFinishUpdate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUPinCodeDetailsViewController;
  [(HUItemTableViewController *)&v9 itemManagerDidFinishUpdate:a3];
  id v4 = [(HUPinCodeDetailsViewController *)self title];

  if (!v4)
  {
    int v5 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    id v6 = [v5 sourceItem];
    __int16 v7 = [v6 latestResults];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [(HUPinCodeDetailsViewController *)self setTitle:v8];
  }
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  __int16 v7 = [v6 addOrShowHomeKeyItem];
  if ([v5 isEqual:v7])
  {
LABEL_2:

LABEL_19:
    uint64_t v36 = objc_opt_class();
    goto LABEL_20;
  }
  id v8 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v9 = [v8 restoreHomeKeyAccessItem];

  if (v9 == v5) {
    goto LABEL_19;
  }
  char v10 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v11 = [v10 deleteGuestPINCodeItem];
  dispatch_time_t v12 = v5;
  if ((id)v11 == v5)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v13 = (void *)v11;
  id v14 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v15 = [v14 pinCodeRestoreAccessItem];
  if ((id)v15 == v5)
  {

    dispatch_time_t v12 = v13;
    goto LABEL_18;
  }
  id v16 = (void *)v15;
  id v17 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v18 = [v17 pinCodeChangeItem];
  char v19 = [v5 isEqual:v18];

  if (v19) {
    goto LABEL_19;
  }
  v20 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v21 = [v20 transformedLocksItemProvider];
  id v22 = [v21 items];
  int v23 = [v22 containsObject:v5];

  if (!v23)
  {
    uint64_t v38 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    v39 = [v38 pinCodeLabelItem];
    int v40 = [v5 isEqual:v39];

    if (v40) {
      goto LABEL_19;
    }
    id v6 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    __int16 v7 = [v6 pinCodeValueItem];
    if (![v5 isEqual:v7])
    {
      id v41 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
      v42 = [v41 personalPINCodeItem];
      [v5 isEqual:v42];
    }
    goto LABEL_2;
  }
  objc_opt_class();
  id v24 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v25 = [v24 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }
  id v27 = v26;

  objc_opt_class();
  id v28 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v29 = [v28 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v30 = v29;
  }
  else {
    v30 = 0;
  }
  unint64_t v31 = v30;

  id v32 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v33 = [v32 home];

  id v34 = [(id)v31 user];

  if (v34)
  {
    id v35 = v34;
  }
  else
  {
    id v35 = [v27 user];
  }
  v43 = v35;

  if (!objc_msgSend(v33, "hf_currentUserIsAdministrator")
    || (objc_msgSend(v33, "hf_userIsRestrictedGuest:", v43) & 1) == 0)
  {
    uint64_t v44 = [v27 user];
    if (v44 | v31) {

    }
    else {
      [v27 isUnknownGuestFromMatter];
    }
  }
  uint64_t v36 = objc_opt_class();

LABEL_20:

  return (Class)v36;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v83.receiver = self;
  v83.super_class = (Class)HUPinCodeDetailsViewController;
  [(HUItemTableViewController *)&v83 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  dispatch_time_t v12 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v13 = [v12 deleteGuestPINCodeItem];

  if (v13 == v11)
  {
    id v31 = v10;
    [v31 setDestructive:1];
    id v32 = [v11 latestResults];
    id v20 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];

    uint64_t v33 = [v20 BOOLValue] ^ 1;
    id v21 = [v31 textLabel];

    [v21 setEnabled:v33];
  }
  else
  {
    id v14 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    id v15 = [v14 pinCodeRestoreAccessItem];

    if (v15 != v11)
    {
      id v16 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
      id v17 = [v16 pinCodeLabelItem];

      if (v17 == v11)
      {
        objc_opt_class();
        id v39 = v10;
        if (objc_opt_isKindOfClass()) {
          int v40 = v39;
        }
        else {
          int v40 = 0;
        }
        id v20 = v40;

        id v41 = [v11 latestResults];
        v42 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        v43 = [v20 textField];
        [v43 setText:v42];

        uint64_t v44 = [v11 latestResults];
        v45 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        v46 = [v20 textField];
        [v46 setAccessibilityIdentifier:v45];

        v47 = _HULocalizedStringWithDefaultValue(@"HUAddPersonPinGuestNamePlaceholder", @"HUAddPersonPinGuestNamePlaceholder", 1);
        v48 = [v20 textField];
        [v48 setPlaceholder:v47];

        v49 = [v20 textField];
        [v49 setClearButtonMode:3];

        v50 = [v20 textField];
        [v50 setKeyboardType:1];

        v51 = [v11 latestResults];
        id v21 = [v51 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];

        objc_msgSend(v20, "setDisabled:", objc_msgSend(v21, "BOOLValue"));
        v52 = [(HUPinCodeDetailsViewController *)self editedPinCodeLabel];

        if (!v52) {
          goto LABEL_23;
        }
        id v25 = [(HUPinCodeDetailsViewController *)self editedPinCodeLabel];
        v29 = [v20 textField];
        [v29 setText:v25];
        goto LABEL_21;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        id v18 = v10;
        if (objc_opt_isKindOfClass()) {
          char v19 = v18;
        }
        else {
          char v19 = 0;
        }
        id v20 = v19;

        [v20 setDelegate:self];
        id v21 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v11];
        objc_opt_class();
        id v22 = [v11 latestResults];
        int v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F68AB0]];
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;

        if (v25)
        {
          id v26 = [v21 imageProperties];
          [v26 setTintColor:v25];
        }
        id v27 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
        id v28 = [v21 imageProperties];
        [v28 setPreferredSymbolConfiguration:v27];

        [v20 setContentConfiguration:v21];
        v29 = [v11 latestResults];
        v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v20 setAccessibilityIdentifier:v30];

LABEL_21:
LABEL_22:

        goto LABEL_23;
      }
      v53 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
      v54 = [v53 pinCodeValueItem];
      int v55 = [v11 isEqual:v54];

      if (v55)
      {
        v56 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
        id v20 = +[HUListContentConfigurationUtilities labelConfiguration:v56 forItem:v11];

        v57 = [(HUPinCodeDetailsViewController *)self editedPinCodeValue];

        if (v57)
        {
          v58 = [(HUPinCodeDetailsViewController *)self editedPinCodeValue];
          [v20 setSecondaryText:v58];
        }
        [v10 setContentConfiguration:v20];
        v59 = [v11 latestResults];
        v60 = [v59 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v10 setAccessibilityIdentifier:v60];

        id v21 = [v10 layer];
        [v21 setDisableUpdateMask:16];
        goto LABEL_23;
      }
      v61 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
      v62 = [v61 personalPINCodeItem];
      int v63 = [v11 isEqual:v62];

      if (v63)
      {
        v64 = [MEMORY[0x1E4F42B58] sidebarCellConfiguration];
        id v20 = +[HUListContentConfigurationUtilities labelConfiguration:v64 forItem:v11];

        [v10 setContentConfiguration:v20];
        [v10 setAccessoryType:1];
      }
      else
      {
        v65 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
        v66 = [v65 addOrShowHomeKeyItem];
        int v67 = [v11 isEqual:v66];

        if (!v67)
        {
          v73 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
          v74 = [v73 transformedLocksItemProvider];
          v75 = [v74 items];
          int v76 = [v75 containsObject:v11];

          if (!v76) {
            goto LABEL_24;
          }
          id v20 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v11];
          objc_opt_class();
          v77 = [v11 latestResults];
          v78 = [v77 objectForKeyedSubscript:*MEMORY[0x1E4F68AB0]];
          if (objc_opt_isKindOfClass()) {
            v79 = v78;
          }
          else {
            v79 = 0;
          }
          id v21 = v79;

          if (v21)
          {
            v80 = [v20 imageProperties];
            [v80 setTintColor:v21];
          }
          v81 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
          v82 = [v20 imageProperties];
          [v82 setPreferredSymbolConfiguration:v81];

          [v10 setContentConfiguration:v20];
          id v25 = [v11 latestResults];
          v29 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
          [v10 setAccessibilityIdentifier:v29];
          goto LABEL_21;
        }
        id v20 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
        v68 = [v11 latestResults];
        v69 = [v68 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        [v20 setText:v69];

        v70 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        v71 = [v20 textProperties];
        [v71 setColor:v70];

        v72 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_walletAppIconImage");
        [v20 setImage:v72];

        [v10 setContentConfiguration:v20];
      }
      id v21 = [v11 latestResults];
      id v25 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v10 setAccessibilityIdentifier:v25];
      goto LABEL_22;
    }
    id v34 = v10;
    id v35 = [v11 latestResults];
    id v20 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];

    uint64_t v36 = [v20 BOOLValue] ^ 1;
    v37 = [v34 textLabel];
    [v37 setEnabled:v36];

    id v21 = [v11 latestResults];
    uint64_t v38 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v34 setAccessibilityIdentifier:v38];
  }
LABEL_23:

LABEL_24:
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  id v8 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v9 = [v8 pinCodeLabelItem];

  if (v9 == v7) {
    [(HUPinCodeDetailsViewController *)self setEditedPinCodeLabel:v10];
  }
  [(HUPinCodeDetailsViewController *)self _updateSaveEnabled];
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = [a3 text];
  if ([v4 length] || -[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode"))
  {

    return 1;
  }
  BOOL v6 = [(HUPinCodeDetailsViewController *)self isClosing];

  return v6;
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(HUPinCodeDetailsViewController *)self commitPinCodeChanges];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke;
  v9[3] = &unk_1E6385A20;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  id v8 = (id)[v6 addFailureBlock:v9];
}

void __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isClosing])
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[HUPinCodeDetailsViewController textFieldDidEndEditing:item:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Supressing PIN Code validation error because we're closing view: %@", buf, 0x16u);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v6 = *MEMORY[0x1E4F68830];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke_91;
    v7[3] = &unk_1E6386018;
    id v8 = *(id *)(a1 + 40);
    [v5 handleError:v3 operationType:v6 options:0 retryBlock:0 cancelBlock:v7];

    id v4 = v8;
  }
}

uint64_t __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke_91(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v9 = [v8 sourceItem];

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    __int16 v11 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    id v12 = [v11 pinCodeValueItem];
    BOOL v10 = v12 != v7;
  }
  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v9 = [v8 transformedLocksItemProvider];
  BOOL v10 = [v9 items];
  char v11 = [v10 containsObject:v7];

  if (v11) {
    id v12 = 0;
  }
  else {
    id v12 = v5;
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v130.receiver = self;
  v130.super_class = (Class)HUPinCodeDetailsViewController;
  [(HUItemTableViewController *)&v130 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  BOOL v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v132 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v133 = 2112;
    v134 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "(%s) User selected item %@", buf, 0x16u);
  }

  objc_opt_class();
  char v11 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v12 = [v11 sourceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v104 = v13;

  id v14 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v15 = [v14 deleteGuestPINCodeItem];
  BOOL v16 = v9 == v15;

  id v17 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v18 = v17;
  if (v16)
  {
    char v28 = [v17 operationInProgress];

    if (v28) {
      goto LABEL_46;
    }
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E6387430;
    objc_copyWeak(&v129, (id *)buf);
    id v29 = v104;
    id v128 = v29;
    v30 = (void (**)(void *, void))_Block_copy(aBlock);
    if ([v29 isUnknownGuestFromMatter])
    {
      id v31 = [v29 latestResults];
      v101 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      v100 = HULocalizedStringWithFormat(@"HUUsersRemovePersonAlertTitle", @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v101);
      uint64_t v38 = [(HUItemTableViewController *)self itemManager];
      id v39 = [v38 home];
      v99 = [v39 name];
      v46 = HULocalizedStringWithFormat(@"HUUsersRemovePersonConfirmationMessage", @"%@%@", v40, v41, v42, v43, v44, v45, (uint64_t)v101);

      v47 = [(UITableViewController *)self hu_actionSheetWithTitle:v100 message:v46 indexPath:v7];
      v48 = (void *)MEMORY[0x1E4F42720];
      v49 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
      v50 = [v48 actionWithTitle:v49 style:1 handler:&__block_literal_global_116_1];
      [v47 addAction:v50];

      v51 = (void *)MEMORY[0x1E4F42720];
      v52 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
      v53 = [v51 actionWithTitle:v52 style:2 handler:v30];
      [v47 addAction:v53];

      [(HUPinCodeDetailsViewController *)self presentViewController:v47 animated:1 completion:0];
    }
    else
    {
      v30[2](v30, 0);
    }

    objc_destroyWeak(&v129);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    char v19 = [v17 pinCodeChangeItem];
    int v20 = [v9 isEqual:v19];

    if (v20)
    {
      id v21 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
      id v22 = [v21 hasValidConstraints];

      objc_initWeak((id *)buf, self);
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_120;
      v125[3] = &unk_1E638FFF8;
      objc_copyWeak(&v126, (id *)buf);
      id v23 = (id)[v22 addSuccessBlock:v125];
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
      v123[3] = &unk_1E6386FB8;
      objc_copyWeak(&v124, (id *)buf);
      id v24 = (id)[v22 addFailureBlock:v123];
      id v25 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_125;
      v121[3] = &unk_1E6386018;
      id v26 = v22;
      id v122 = v26;
      id v27 = (id)[v25 afterDelay:v121 performBlock:1.0];

      objc_destroyWeak(&v124);
      objc_destroyWeak(&v126);
      objc_destroyWeak((id *)buf);

      goto LABEL_33;
    }
    v54 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    int v55 = [v54 pinCodeRestoreAccessItem];
    BOOL v56 = v9 == v55;

    v57 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    v58 = v57;
    if (v56)
    {
      char v70 = [v57 operationInProgress];

      if (v70) {
        goto LABEL_46;
      }
      [(HUPinCodeDetailsViewController *)self showSpinner];
      v71 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
      v72 = [v71 restoreFullAccessForUserWithItem:v104];
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_127;
      v117[3] = &unk_1E6390020;
      id v118 = v104;
      v119 = self;
      SEL v120 = a2;
      v73 = [v72 addCompletionBlock:v117];
      id v74 = (id)[v73 addFailureBlock:&__block_literal_global_130_2];

      goto LABEL_33;
    }
    v59 = [v57 personalPINCodeItem];
    int v60 = [v9 isEqual:v59];

    if (v60)
    {
      [(HUPinCodeDetailsViewController *)self _resignFirstResponderForAllTextFields];
      objc_opt_class();
      v61 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
      v62 = [v61 sourceItem];
      if (objc_opt_isKindOfClass()) {
        int v63 = v62;
      }
      else {
        int v63 = 0;
      }
      id v64 = v63;

      objc_initWeak(&location, self);
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v114[3] = &unk_1E63862A0;
      objc_copyWeak(&v115, &location);
      v65 = (void (**)(void))_Block_copy(v114);
      id v66 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      id v113 = 0;
      int v67 = [v66 canEvaluatePolicy:2 error:&v113];
      id v68 = v113;
      v69 = v68;
      if (v64) {
        goto LABEL_18;
      }
      if (v67)
      {
        v75 = _HULocalizedStringWithDefaultValue(@"HUPinCodePassCodeAuthString", @"HUPinCodePassCodeAuthString", 1);
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
        v110[3] = &unk_1E6390048;
        v112 = v65;
        id v111 = v66;
        [v111 evaluatePolicy:2 localizedReason:v75 reply:v110];
      }
      else
      {
        int v76 = [v68 domain];
        if ([v76 isEqualToString:*MEMORY[0x1E4F30B38]])
        {
          BOOL v102 = [v69 code] == -5;

          if (v102)
          {
LABEL_18:
            v65[2](v65);
LABEL_32:

            objc_destroyWeak(&v115);
            objc_destroyWeak(&location);

            goto LABEL_33;
          }
        }
        else
        {
        }
        v75 = HFLogForCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v132 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]";
          __int16 v133 = 2112;
          v134 = v69;
          _os_log_error_impl(&dword_1BE345000, v75, OS_LOG_TYPE_ERROR, "(%s) cannot local authenticate. error = %@", buf, 0x16u);
        }
      }

      goto LABEL_32;
    }
  }
LABEL_33:
  v77 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v78 = [v77 addOrShowHomeKeyItem];
  int v79 = [v9 isEqual:v78];

  if (v79)
  {
    [(HUPinCodeDetailsViewController *)self _resignFirstResponderForAllTextFields];
    v80 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    id v81 = [v80 home];

    v82 = HFLogForCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v132 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v133 = 2112;
      v134 = v9;
      __int16 v135 = 2112;
      id v136 = v81;
      _os_log_impl(&dword_1BE345000, v82, OS_LOG_TYPE_DEFAULT, "(%s) user tapped %@ in home %@", buf, 0x20u);
    }

    objc_super v83 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    id v84 = v83;
    if (objc_opt_isKindOfClass()) {
      v85 = v84;
    }
    else {
      v85 = 0;
    }
    id v86 = v85;

    [v86 setShowSpinner:1];
    v87 = [MEMORY[0x1E4F69770] handleAddOrShowHomeKeyButtonTapForHome:v81];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_138;
    v108[3] = &unk_1E63850B8;
    id v109 = v86;
    id v88 = v86;
    id v89 = (id)[v87 addCompletionBlock:v108];

    goto LABEL_45;
  }
  v90 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  v91 = [v90 restoreHomeKeyAccessItem];
  int v92 = [v9 isEqual:v91];

  if (v92)
  {
    v93 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    id v81 = v93;
    if (objc_opt_isKindOfClass()) {
      v94 = v81;
    }
    else {
      v94 = 0;
    }
    id v95 = v94;

    [v95 setShowSpinner:1];
    v96 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
    v97 = [v96 restoreFuture];
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_139;
    v105[3] = &unk_1E6390098;
    id v106 = v95;
    SEL v107 = a2;
    v105[4] = self;
    id v84 = v95;
    id v98 = (id)[v97 addSuccessBlock:v105];

LABEL_45:
  }
LABEL_46:
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v15 = 2112;
    BOOL v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showSpinner];
  id v7 = [WeakRetained pinCodeManager];
  id v8 = [v7 deleteGuestPinCodeWithItem:*(void *)(a1 + 32)];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_95;
  v10[3] = &unk_1E6389AC0;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  id v9 = (id)[v8 addCompletionBlock:v10];

  objc_destroyWeak(&v12);
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_95(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11)
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v11 operationType:*MEMORY[0x1E4F68830] options:0 retryBlock:0 cancelBlock:0];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [WeakRetained pinCodeItemManager];
  id v8 = [v7 home];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E4F681A0]);

  objc_msgSend(v6, "na_safeSetObject:forKey:", &unk_1F19B4DF0, *MEMORY[0x1E4F68048]);
  objc_msgSend(v6, "na_safeSetObject:forKey:", *(void *)(a1 + 32), *MEMORY[0x1E4F68040]);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F68190]);
  [MEMORY[0x1E4F68EE0] sendEvent:26 withData:v6];
  id v9 = [WeakRetained navigationController];
  id v10 = (id)[v9 popViewControllerAnimated:1];
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_114()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v1, 0xCu);
  }
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_120(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 BOOLValue])
  {
    id v6 = [WeakRetained editedPinCodeValue];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = [WeakRetained pinCodeItemManager];
      id v10 = [v9 pinCodeValueItem];
      id v11 = [v10 latestResults];
      id v8 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    }
    id v12 = [WeakRetained pinCodeItemManager];
    uint64_t v13 = [v12 home];

    id v14 = [HUPinCodeEditorViewController alloc];
    __int16 v15 = [WeakRetained pinCodeManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v19[3] = &unk_1E638FFD0;
    objc_copyWeak(&v20, v4);
    id v16 = [(HUPinCodeEditorViewController *)v14 initForCreatingNewPinCodeWithManager:v15 initialPinCodeValue:v8 home:v13 completionBlock:v19];

    uint64_t v17 = objc_msgSend(WeakRetained, "hu_delegateForModalPresentation");
    [v16 setPresentationDelegate:v17];

    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v16];
    [WeakRetained presentViewController:v18 animated:1 completion:0];

    objc_destroyWeak(&v20);
  }
  else
  {
    [WeakRetained _presentPinCodeErrorDialog];
  }
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained setEditedPinCodeValue:v3];
    id v6 = [v5 pinCodeItemManager];
    id v7 = [v6 pinCodeValueItem];
    v9[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v5 updateCellForItems:v8];
  }
  [v5 _updateSaveEnabled];
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke_3";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "(%s) Unable to retrieve valid Pin Code constraints with error: %@", (uint8_t *)&v6, 0x16u);
  }

  [WeakRetained _presentPinCodeErrorDialog];
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_125(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    id v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v3];
  }
}

uint64_t __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_127(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) updateFromPinCode:a2];
    id v3 = [*(id *)(a1 + 40) pinCodeItemManager];
    id v4 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];
  }
  id v5 = *(void **)(a1 + 40);

  return [v5 hideSpinner];
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_128(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F68830] options:0 retryBlock:0 cancelBlock:0];
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v1 = [WeakRetained pinCodeItemManager];
  id v2 = [v1 home];

  id v3 = [WeakRetained itemManager];
  id v4 = [v3 sourceItem];

  id v5 = [HUPersonalPINCodeViewController alloc];
  int v6 = [WeakRetained pinCodeManager];
  id v7 = [(HUPersonalPINCodeViewController *)v5 initWithItem:v4 pinCodeManager:v6 home:v2];

  [(HUPersonalPINCodeViewController *)v7 setDelegate:WeakRetained];
  __int16 v8 = [WeakRetained navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v7, 1);
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      __int16 v8 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke_5";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(%s) When evaluating authentication policy, authError = %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (a2) {
      dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
    }
    [*(id *)(a1 + 32) invalidate];
  }
}

uint64_t __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_138(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowSpinner:0];
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_139(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 pinCodeItemManager];
  int v6 = [v5 home];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_140;
  v9[3] = &unk_1E6390070;
  v9[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v8;
  long long v10 = v8;
  [v6 restoreMissingWalletKeys:v4 completion:v9];
}

uint64_t __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_140(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:a2];
  id v4 = [*(id *)(a1 + 32) pinCodeItemManager];
  [v4 setRestoreFuture:v3];

  id v5 = [*(id *)(a1 + 32) pinCodeItemManager];
  id v6 = (id)[v5 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];

  id v7 = *(void **)(a1 + 40);

  return [v7 setShowSpinner:0];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v50 = a4;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HUPinCodeDetailsViewController *)self tableView];
  v49 = [v6 indexPathForCell:v5];

  id v7 = [(HUItemTableViewController *)self itemManager];
  long long v8 = [v7 displayedItemAtIndexPath:v49];

  objc_opt_class();
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    long long v10 = v9;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 sourceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v48 = v13;

  id v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [v5 text];
    *(_DWORD *)buf = 136315906;
    char v70 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]";
    __int16 v71 = 2112;
    v72 = v15;
    __int16 v73 = 1024;
    BOOL v74 = v50;
    __int16 v75 = 2112;
    id v76 = v9;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch cell: %@ | isOn = %{BOOL}d | item = %@", buf, 0x26u);
  }
  objc_opt_class();
  id v16 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v17 = [v16 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v47 = v18;

  objc_opt_class();
  char v19 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v20 = [v19 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  id v23 = v22;
  id v24 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v25 = [v24 home];

  id v26 = [v22 user];
  id v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    id v28 = [v47 user];
  }
  id v29 = v28;

  if (objc_msgSend(v25, "hf_currentUserIsAdministrator")
    && objc_msgSend(v25, "hf_userIsRestrictedGuest:", v29))
  {
    v30 = [v48 accessory];
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E63900C0;
    objc_copyWeak(&v67, (id *)buf);
    id v46 = v25;
    id v63 = v46;
    id v45 = v29;
    id v64 = v45;
    BOOL v68 = v50;
    id v31 = v30;
    id v65 = v31;
    id v32 = v5;
    id v66 = v32;
    uint64_t v33 = _Block_copy(aBlock);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_155;
    v57[3] = &unk_1E63900E8;
    objc_copyWeak(&v60, (id *)buf);
    id v34 = v31;
    id v58 = v34;
    BOOL v61 = v50;
    id v43 = v33;
    id v59 = v43;
    uint64_t v35 = _Block_copy(v57);
    id v44 = v9;
    uint64_t v36 = v29;
    uint64_t v37 = v23;
    uint64_t v38 = (void *)MEMORY[0x1E4F42FF8];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_157;
    v54[3] = &unk_1E6385A70;
    id v55 = v32;
    BOOL v56 = v50;
    objc_msgSend(v38, "hu_presentingLockLimitAlertIfNeededFromViewController:home:user:accessory:include:continueActionBlock:cancelActionBlock:", self, v46, v45, v34, v54);

    id v23 = v37;
    id v29 = v36;
    id v9 = v44;

    objc_destroyWeak(&v60);
    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v39 = [(HUPinCodeDetailsViewController *)self accessoriesToEdit];
    uint64_t v40 = [v48 accessory];
    if (v50) {
      [v39 addObject:v40];
    }
    else {
      [v39 removeObject:v40];
    }

    [(HUPinCodeDetailsViewController *)self _updateSaveEnabled];
    uint64_t v41 = [(HUPinCodeDetailsViewController *)self commitAccessoryChanges];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_158;
    v51[3] = &unk_1E63899B8;
    id v52 = v5;
    BOOL v53 = v50;
    id v42 = (id)[v41 addFailureBlock:v51];

    id v34 = v52;
  }
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [*(id *)(a1 + 32) homeAccessControlForUser:*(void *)(a1 + 40)];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v6 = [v4 restrictedGuestAccessSettings];
  id v7 = [v6 accessAllowedToAccessories];
  long long v8 = (void *)[v5 initWithSet:v7];

  if (*(unsigned char *)(a1 + 72)) {
    [WeakRetained inFlightAllowedAccessoryAdditions];
  }
  else {
  id v9 = [WeakRetained inFlightAllowedAccessoryRemovals];
  }
  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 48));

  long long v10 = [WeakRetained inFlightAllowedAccessoryAdditions];
  id v11 = [v8 setByAddingObjectsFromSet:v10];
  id v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = [WeakRetained inFlightAllowedAccessoryRemovals];
  id v14 = objc_msgSend(v12, "na_setByRemovingObjectsFromSet:", v13);
  __int16 v15 = (void *)[v14 mutableCopy];

  id v16 = [v4 restrictedGuestAccessSettings];
  uint64_t v17 = (void *)[v16 mutableCopy];

  [v17 setAccessAllowedToAccessories:v15];
  id v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    char v19 = [WeakRetained inFlightAllowedAccessoryAdditions];
    id v20 = [WeakRetained inFlightAllowedAccessoryRemovals];
    *(_DWORD *)buf = 136315906;
    uint64_t v41 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke";
    __int16 v42 = 2112;
    id v43 = v15;
    __int16 v44 = 2112;
    id v45 = v19;
    __int16 v46 = 2112;
    id v47 = v20;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "(%s) Updating allowed accessories to: %@ | In flight additions: %@ | In flight removals: %@", buf, 0x2Au);
  }
  id v21 = (void *)MEMORY[0x1E4F7A0D8];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_145;
  v37[3] = &unk_1E6385D90;
  id v22 = v4;
  id v38 = v22;
  id v23 = v17;
  id v39 = v23;
  id v24 = [v21 futureWithBlock:v37];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_146;
  v34[3] = &unk_1E6386150;
  objc_copyWeak(&v36, v2);
  id v35 = *(id *)(a1 + 48);
  id v25 = (id)[v24 addCompletionBlock:v34];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_147;
  v31[3] = &unk_1E63859F8;
  id v32 = *(id *)(a1 + 32);
  id v33 = *(id *)(a1 + 40);
  id v26 = (id)[v24 addSuccessBlock:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_154;
  v28[3] = &unk_1E63899B8;
  id v29 = *(id *)(a1 + 56);
  char v30 = *(unsigned char *)(a1 + 72);
  id v27 = (id)[v24 addFailureBlock:v28];

  objc_destroyWeak(&v36);
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2;
  v7[3] = &unk_1E6386708;
  id v8 = v3;
  id v6 = v3;
  [v5 updateRestrictedGuestSettings:v4 completionHandler:v7];
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = *(void **)(a1 + 32);
  if (v3) {
    [v5 finishWithError:v3];
  }
  else {
    [v5 finishWithNoResult];
  }
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_146(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained inFlightAllowedAccessoryAdditions];
  [v2 removeObject:*(void *)(a1 + 32)];

  id v3 = [WeakRetained inFlightAllowedAccessoryRemovals];
  [v3 removeObject:*(void *)(a1 + 32)];
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_147(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke_2";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories.", buf, 0xCu);
  }

  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_149;
  v4[3] = &unk_1E6387408;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 dispatchHomeObserverMessage:v4 sender:0];
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_149(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_154(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories with error: %@.", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  [v5 handleError:v3 operationType:*MEMORY[0x1E4F687E8] options:0 retryBlock:0 cancelBlock:0];

  [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_155(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_servicesWithBulletinBoardNotificationTurnedOff");
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v5 = [v3 count] != 0;
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(unsigned __int8 *)(a1 + 56);
    int v9 = 136316162;
    uint64_t v10 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke";
    __int16 v11 = 1024;
    BOOL v12 = v5;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = [v4 count];
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%s) displayNotificationAlert = %{BOOL}d because cell isOn = %{BOOL}d and servicesWithNotificationOff = (%ld) %@", (uint8_t *)&v9, 0x2Cu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v5) {
    objc_msgSend(WeakRetained, "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", v4, 1, v8, *(void *)(a1 + 40));
  }
  else {
    (*(void (**)(void))(v8 + 16))(*(void *)(a1 + 40));
  }
}

uint64_t __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_157(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0];
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_158(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  BOOL v5 = [v3 sharedHandler];
  uint64_t v6 = *MEMORY[0x1E4F68830];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_3;
  v7[3] = &unk_1E6385A70;
  id v8 = *(id *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  [v5 handleError:v4 operationType:v6 options:0 retryBlock:0 cancelBlock:v7];
}

uint64_t __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0];
}

- (void)personalPinCodeViewController:(id)a3 pinCodeDidChange:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  uint64_t v6 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  int v7 = [v6 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  uint64_t v10 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  __int16 v11 = [v10 sourceItem];
  if (objc_opt_isKindOfClass()) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }

  __int16 v13 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  int v14 = [v13 home];

  if (v5 && v9)
  {
    [v9 updateFromPinCode:v5];
  }
  else
  {
    __int16 v15 = [v9 user];

    if (v5 || !v15)
    {
      if (v5 && v12)
      {
        id v20 = [objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v5 inHome:v14 onAccessory:0];
        id v21 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
        [v21 setSourceItem:v20];
      }
      else
      {
        id v20 = HFLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v23 = 136315650;
          id v24 = "-[HUPinCodeDetailsViewController personalPinCodeViewController:pinCodeDidChange:]";
          __int16 v25 = 2112;
          id v26 = v9;
          __int16 v27 = 2112;
          id v28 = v5;
          _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "(%s): Unexpected state. pinCodeItem: %@ newPinCode: %@", (uint8_t *)&v23, 0x20u);
        }
      }
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x1E4F69710]);
      __int16 v17 = [v9 user];
      id v18 = (void *)[v16 initWithHome:v14 user:v17 nameStyle:0];
      uint64_t v19 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
      [v19 setSourceItem:v18];
    }
  }
  id v22 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  [v22 resetItemProvidersAndModules];
}

- (id)_allTextFields
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(HUPinCodeDetailsViewController *)self tableView];
  id v5 = [v4 visibleCells];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        __int16 v11 = &unk_1F19E8A08;
        if ([v10 conformsToProtocol:v11]) {
          BOOL v12 = v10;
        }
        else {
          BOOL v12 = 0;
        }
        id v13 = v12;

        int v14 = [v13 textField];

        objc_msgSend(v3, "na_safeAddObject:", v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_resignFirstResponderForAllTextFields
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(HUPinCodeDetailsViewController *)self _allTextFields];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resignFirstResponder];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_codeValueHasChanged
{
  uint64_t v3 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v4 = [v3 pinCodeValueItem];

  uint64_t v5 = [(HUPinCodeDetailsViewController *)self editedPinCodeValue];
  if (v5)
  {
    uint64_t v6 = [(HUPinCodeDetailsViewController *)self editedPinCodeValue];
    long long v7 = [v4 latestResults];
    long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    int v9 = [v6 isEqualToString:v8] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_codeLabelHasChanged
{
  uint64_t v3 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v4 = [v3 pinCodeLabelItem];

  uint64_t v5 = [(HUPinCodeDetailsViewController *)self editedPinCodeLabel];
  if (v5)
  {
    uint64_t v6 = [(HUPinCodeDetailsViewController *)self editedPinCodeLabel];
    long long v7 = [v4 latestResults];
    long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    int v9 = [v6 isEqualToString:v8] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_updateSaveEnabled
{
  uint64_t v3 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  id v24 = [v3 pinCodeLabelItem];

  uint64_t v4 = [(HUPinCodeDetailsViewController *)self pinCodeItemManager];
  uint64_t v5 = [v4 pinCodeValueItem];

  uint64_t v6 = [v24 latestResults];
  long long v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  int v8 = [v7 BOOLValue];

  BOOL v9 = [(HUPinCodeDetailsViewController *)self _codeValueHasChanged];
  uint64_t v10 = v9;
  if (v8)
  {
    id v11 = [(HUPinCodeDetailsViewController *)self editedPinCodeValue];
    BOOL v12 = [v11 length] == 0;
  }
  else
  {
    uint64_t v10 = v9 || [(HUPinCodeDetailsViewController *)self _codeLabelHasChanged];
    id v13 = [(HUPinCodeDetailsViewController *)self editedPinCodeLabel];
    int v14 = v13;
    if (v13)
    {
      id v11 = v13;
    }
    else
    {
      __int16 v15 = [v24 latestResults];
      id v11 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    }
    long long v16 = [(HUPinCodeDetailsViewController *)self editedPinCodeValue];
    long long v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      long long v19 = [v5 latestResults];
      id v18 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    }
    if ([v11 length]) {
      BOOL v12 = [v18 length] == 0;
    }
    else {
      BOOL v12 = 1;
    }
  }
  char v20 = v10 ^ 1 | v12;
  if (v20)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v10 = [(HUPinCodeDetailsViewController *)self accessoriesToEdit];
    if ([(id)v10 count]) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = [(HUPinCodeDetailsViewController *)self creatingNewPinCode] ^ 1;
    }
  }
  id v22 = [(HUPinCodeDetailsViewController *)self delegate];
  int v23 = [v22 addButtonItem];
  [v23 setEnabled:v21];

  if ((v20 & 1) == 0) {
}
  }

- (id)_validatePinCodeLabel
{
  if ([(HUPinCodeDetailsViewController *)self creatingNewPinCode]
    || [(HUPinCodeDetailsViewController *)self _codeLabelHasChanged])
  {
    uint64_t v3 = [(HUPinCodeDetailsViewController *)self editedPinCodeLabel];
    uint64_t v4 = [(HUPinCodeDetailsViewController *)self pinCodeManager];
    uint64_t v5 = [v4 guestPinCodes];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke;
    v9[3] = &unk_1E6385620;
    id v10 = v3;
    id v6 = v3;
    long long v7 = [v5 flatMap:v9];
  }
  else
  {
    long long v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v7;
}

id __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke_2;
  v8[3] = &unk_1E6389E28;
  id v9 = *(id *)(a1 + 32);
  int v3 = objc_msgSend(a2, "na_any:", v8);
  uint64_t v4 = (void *)MEMORY[0x1E4F7A0D8];
  if (v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 76);
    id v6 = [v4 futureWithError:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

uint64_t __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = [a2 userLabel];
  uint64_t v4 = [v3 simpleLabel];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_presentPinCodeErrorDialog
{
  _HULocalizedStringWithDefaultValue(@"HUPinCodeEditUnavailableAlertTitle", @"HUPinCodeEditUnavailableAlertTitle", 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  int v3 = _HULocalizedStringWithDefaultValue(@"HUPinCodeEditUnavailableAlertMessage", @"HUPinCodeEditUnavailableAlertMessage", 1);
  uint64_t v4 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v8 message:v3 preferredStyle:1];
  uint64_t v5 = (void *)MEMORY[0x1E4F42720];
  id v6 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  long long v7 = [v5 actionWithTitle:v6 style:0 handler:&__block_literal_global_217];
  [v4 addAction:v7];

  [(HUPinCodeDetailsViewController *)self presentViewController:v4 animated:1 completion:0];
}

void __60__HUPinCodeDetailsViewController__presentPinCodeErrorDialog__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[HUPinCodeDetailsViewController _presentPinCodeErrorDialog]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped OK button from the alert popup", (uint8_t *)&v1, 0xCu);
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

- (HUPinCodeDetailsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPinCodeDetailsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUPinCodeDetailsItemManager)pinCodeItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinCodeItemManager);

  return (HUPinCodeDetailsItemManager *)WeakRetained;
}

- (void)setPinCodeItemManager:(id)a3
{
}

- (NSString)editedPinCodeLabel
{
  return self->_editedPinCodeLabel;
}

- (void)setEditedPinCodeLabel:(id)a3
{
}

- (NSString)editedPinCodeValue
{
  return self->_editedPinCodeValue;
}

- (void)setEditedPinCodeValue:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (BOOL)creatingNewPinCode
{
  return self->_creatingNewPinCode;
}

- (void)setCreatingNewPinCode:(BOOL)a3
{
  self->_creatingNewPinCode = a3;
}

- (BOOL)isClosing
{
  return self->_isClosing;
}

- (void)setIsClosing:(BOOL)a3
{
  self->_isClosing = a3;
}

- (NSArray)pinAccessories
{
  return self->_pinAccessories;
}

- (void)setPinAccessories:(id)a3
{
}

- (NSMutableArray)accessoriesToEdit
{
  return self->_accessoriesToEdit;
}

- (void)setAccessoriesToEdit:(id)a3
{
}

- (NSMutableSet)inFlightAllowedAccessoryRemovals
{
  return self->_inFlightAllowedAccessoryRemovals;
}

- (void)setInFlightAllowedAccessoryRemovals:(id)a3
{
}

- (NSMutableSet)inFlightAllowedAccessoryAdditions
{
  return self->_inFlightAllowedAccessoryAdditions;
}

- (void)setInFlightAllowedAccessoryAdditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryAdditions, 0);
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryRemovals, 0);
  objc_storeStrong((id *)&self->_accessoriesToEdit, 0);
  objc_storeStrong((id *)&self->_pinAccessories, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_editedPinCodeValue, 0);
  objc_storeStrong((id *)&self->_editedPinCodeLabel, 0);
  objc_destroyWeak((id *)&self->_pinCodeItemManager);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
@interface WDAddDataViewController
- (BOOL)savingEnabled;
- (NSDate)initialStartDate;
- (WDAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (WDAddDataViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WDAddDataViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)defaultEditingItem;
- (id)defaultMetadata;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dataValidated;
- (void)_showValidationConfirmAlertWithErrorString:(id)a3;
- (void)_showValidationErrorAlertWithErrorString:(id)a3;
- (void)addButtonTapped:(id)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)reloadContent;
- (void)saveHKObjectWithCompletion:(id)a3;
- (void)setInitialStartDate:(id)a3;
- (void)setSavingEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePreferredContentSize;
- (void)validateDataWithCompletion:(id)a3;
- (void)validateMaximumAllowedDurationFor:(id)a3 endDate:(id)a4 competion:(id)a5;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDAddDataViewController

- (WDAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  id v13 = a3;
  id v24 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WDAddDataViewController;
  v17 = [(HKTableViewController *)&v25 initWithUsingInsetStyling:1];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayType, a3);
    objc_storeStrong((id *)&v18->_healthStore, a4);
    objc_storeStrong((id *)&v18->_unitController, a5);
    objc_storeStrong((id *)&v18->_initialStartDate, a6);
    objc_storeStrong((id *)&v18->_dateCache, a7);
    v19 = (HKManualEntryValidationController *)objc_alloc_init(MEMORY[0x1E4F67B50]);
    validationController = v18->_validationController;
    v18->_validationController = v19;

    v21 = [v13 localization];
    v22 = [v21 displayName];
    [(WDAddDataViewController *)v18 setTitle:v22];
  }
  return v18;
}

- (WDAddDataViewController)initWithStyle:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (WDAddDataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (void)viewDidLoad
{
  v56[2] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)WDAddDataViewController;
  [(HKTableViewController *)&v46 viewDidLoad];
  v3 = [(WDAddDataViewController *)self tableView];
  [v3 setRowHeight:44.0];

  v56[0] = @"UIA.Health.AddData";
  v56[1] = @"View";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v5 = HKUIJoinStringsForAutomationIdentifier();
  uint64_t v6 = [(WDAddDataViewController *)self view];
  [v6 setAccessibilityIdentifier:v5];

  v41 = [MEMORY[0x1E4FB1618] systemBlueColor];
  uint64_t v54 = *MEMORY[0x1E4FB0700];
  uint64_t v7 = v54;
  v55 = v41;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v9 = HABundle();
  v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v42 = (void *)[v8 initWithTitle:v10 style:0 target:self action:sel_cancelButtonTapped_];

  [v42 setTitleTextAttributes:v40 forState:0];
  v53[0] = @"UIA.Health.AddData";
  v53[1] = @"Cancel";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v12 = HKUIJoinStringsForAutomationIdentifier();
  [v42 setAccessibilityIdentifier:v12];

  id v13 = [(WDAddDataViewController *)self navigationItem];
  [v13 setLeftBarButtonItem:v42];

  id v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  id v15 = [v14 fontDescriptor];
  v39 = [v15 fontDescriptorWithSymbolicTraits:2];

  id v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v39 size:17.0];
  id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v18 = HABundle();
  v19 = [v18 localizedStringForKey:@"ADD" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v20 = (void *)[v17 initWithTitle:v19 style:0 target:self action:sel_addButtonTapped_];

  v51[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v21 = v51[0];
  v51[1] = v7;
  v52[0] = v16;
  v52[1] = v41;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v20 setTitleTextAttributes:v38 forState:0];
  v37 = [MEMORY[0x1E4FB1618] lightGrayColor];
  v49[0] = v21;
  v49[1] = v7;
  v50[0] = v16;
  v50[1] = v37;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  [v20 setTitleTextAttributes:v22 forState:2];
  v48[0] = @"UIA.Health.AddData";
  v48[1] = @"Add";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  id v24 = HKUIJoinStringsForAutomationIdentifier();
  [v20 setAccessibilityIdentifier:v24];

  objc_super v25 = [(WDAddDataViewController *)self navigationItem];
  [v25 setRightBarButtonItem:v20];

  v26 = (void *)MEMORY[0x1E4FB18D0];
  v27 = HABundle();
  v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v29 = [v26 commandWithTitle:v28 image:0 action:sel_cancelButtonTapped_ input:*MEMORY[0x1E4FB2B08] modifierFlags:0 propertyList:0];

  v30 = (void *)MEMORY[0x1E4FB18D0];
  v31 = HABundle();
  v32 = [v31 localizedStringForKey:@"ADD" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v33 = [v30 commandWithTitle:v32 image:0 action:sel_addButtonTapped_ input:@"\r" modifierFlags:0 propertyList:0];

  [(WDAddDataViewController *)self addKeyCommand:v29];
  [(WDAddDataViewController *)self addKeyCommand:v33];
  [(WDAddDataViewController *)self reloadContent];
  objc_initWeak(&location, self);
  v34 = self;
  v47 = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __38__WDAddDataViewController_viewDidLoad__block_invoke;
  v43[3] = &unk_1E5E7CE30;
  objc_copyWeak(&v44, &location);
  id v36 = (id)[(WDAddDataViewController *)self registerForTraitChanges:v35 withHandler:v43];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

void __38__WDAddDataViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePreferredContentSize];

  id v3 = objc_loadWeakRetained(v1);
  v4 = [v3 tableView];
  [v4 beginUpdates];

  id v5 = objc_loadWeakRetained(v1);
  uint64_t v6 = [v5 tableView];
  [v6 endUpdates];

  id v7 = objc_loadWeakRetained(v1);
  [v7 updatePreferredContentSize];
}

- (void)reloadContent
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [(WDAddDataViewController *)self numberOfSections];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [(WDAddDataViewController *)self manualEntryItemsForSection:i];
      id v7 = [[WDAddDataManualEntrySectionData alloc] initWithItems:v6];
      [v11 addObject:v7];
    }
  }
  id v8 = [[WDAddDataManualEntryTableData alloc] initWithSections:v11];
  model = self->_model;
  self->_model = v8;

  v10 = [(WDAddDataViewController *)self tableView];
  [v10 reloadData];

  [(WDAddDataViewController *)self updatePreferredContentSize];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDAddDataViewController;
  [(WDAddDataViewController *)&v5 viewIsAppearing:a3];
  uint64_t v4 = [(WDAddDataViewController *)self defaultEditingItem];
  [v4 beginEditing];

  [(WDAddDataViewController *)self updatePreferredContentSize];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDAddDataViewController;
  [(WDAddDataViewController *)&v4 viewWillAppear:a3];
  [(WDAddDataViewController *)self updatePreferredContentSize];
}

- (void)updatePreferredContentSize
{
  uint64_t v3 = [(WDAddDataViewController *)self traitCollection];
  lhs = [v3 preferredContentSizeCategory];

  double v4 = dbl_1AD7494F0[UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) == NSOrderedAscending];
  objc_super v5 = [(WDAddDataViewController *)self tableView];
  [v5 layoutIfNeeded];

  uint64_t v6 = [(WDAddDataViewController *)self tableView];
  [v6 contentSize];
  double v8 = v7;

  -[WDAddDataViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v8);
  v9 = [(WDAddDataViewController *)self navigationController];
  objc_msgSend(v9, "setPreferredContentSize:", v4, v8);
}

- (void)setSavingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WDAddDataViewController *)self navigationItem];
  double v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (BOOL)savingEnabled
{
  v2 = [(WDAddDataViewController *)self navigationItem];
  BOOL v3 = [v2 rightBarButtonItem];
  char v4 = [v3 isEnabled];

  return v4;
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)addButtonTapped:(id)a3
{
  char v4 = [(WDAddDataViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:0];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__WDAddDataViewController_addButtonTapped___block_invoke;
  v6[3] = &unk_1E5E7CE58;
  v6[4] = self;
  [(WDAddDataViewController *)self validateDataWithCompletion:v6];
}

void __43__WDAddDataViewController_addButtonTapped___block_invoke(uint64_t a1, int a2, void *a3, int a4)
{
  id v7 = a3;
  double v8 = *(void **)(a1 + 32);
  id v9 = v7;
  if (a2)
  {
    [v8 _dataValidated];
  }
  else if (a4)
  {
    [v8 _showValidationConfirmAlertWithErrorString:v7];
  }
  else
  {
    [v8 _showValidationErrorAlertWithErrorString:v7];
  }
}

- (void)_showValidationErrorAlertWithErrorString:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = a3;
  uint64_t v6 = HABundle();
  id v7 = [v6 localizedStringForKey:@"OUT_OF_RANGE_ALERT_ERROR_TITLE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  double v8 = [v4 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  v10 = HABundle();
  id v11 = [v10 localizedStringForKey:@"OUT_OF_RANGE_ALERT_OK" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__WDAddDataViewController__showValidationErrorAlertWithErrorString___block_invoke;
  v13[3] = &unk_1E5E7CE80;
  v13[4] = self;
  v12 = [v9 actionWithTitle:v11 style:0 handler:v13];

  [v8 addAction:v12];
  [(WDAddDataViewController *)self presentViewController:v8 animated:1 completion:0];
}

void __68__WDAddDataViewController__showValidationErrorAlertWithErrorString___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  v1 = [v2 rightBarButtonItem];
  [v1 setEnabled:1];
}

- (void)_showValidationConfirmAlertWithErrorString:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = a3;
  uint64_t v6 = HABundle();
  id v7 = [v6 localizedStringForKey:@"OUT_OF_RANGE_ALERT_CONFIRM_TITLE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  double v8 = [v4 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  v10 = HABundle();
  id v11 = [v10 localizedStringForKey:@"OUT_OF_RANGE_ALERT_CONFIRM" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke;
  v18[3] = &unk_1E5E7CE80;
  v18[4] = self;
  v12 = [v9 _actionWithTitle:v11 image:0 style:0 handler:v18 shouldDismissHandler:&__block_literal_global_2];

  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = HABundle();
  id v15 = [v14 localizedStringForKey:@"OUT_OF_RANGE_ALERT_CANCEL" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke_3;
  v17[3] = &unk_1E5E7CE80;
  v17[4] = self;
  id v16 = [v13 actionWithTitle:v15 style:1 handler:v17];

  [v8 addAction:v12];
  [v8 addAction:v16];
  [(WDAddDataViewController *)self presentViewController:v8 animated:1 completion:0];
}

void __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _dataValidated];
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 endEditing:1];
}

uint64_t __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke_2()
{
  return 0;
}

void __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  v1 = [v2 rightBarButtonItem];
  [v1 setEnabled:1];
}

- (void)_dataValidated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__WDAddDataViewController__dataValidated__block_invoke;
  v2[3] = &unk_1E5E7CEC8;
  v2[4] = self;
  [(WDAddDataViewController *)self saveHKObjectWithCompletion:v2];
}

void __41__WDAddDataViewController__dataValidated__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __41__WDAddDataViewController__dataValidated__block_invoke_cold_1(a1, v6, (uint64_t)v5);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__WDAddDataViewController__dataValidated__block_invoke_354;
  block[3] = &unk_1E5E7CB60;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__WDAddDataViewController__dataValidated__block_invoke_354(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)validateMaximumAllowedDurationFor:(id)a3 endDate:(id)a4 competion:(id)a5
{
  id v36 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *, uint64_t))a5;
  [v8 timeIntervalSinceDate:v36];
  double v11 = v10;
  validationController = self->_validationController;
  id v13 = [(HKDisplayType *)self->_displayType sampleType];
  uint64_t v14 = [(HKManualEntryValidationController *)validationController validateMaximumAllowedDuration:v13 ofType:v11];

  if (v14)
  {
    if (v14 == 1)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      v28 = CPDateFormatStringForFormatType();
      [v19 setDateFormat:v28];

      uint64_t v21 = [v19 stringFromDate:v36];
      v29 = [v19 stringFromDate:v8];
      v30 = NSString;
      v31 = HABundle();
      v32 = [v31 localizedStringForKey:@"OUT_OF_RANGE_ALERT_TWO_ITEMS_FORMAT_%@_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
      v33 = objc_msgSend(v30, "stringWithFormat:", v32, v21, v29);

      v9[2](v9, 0, v33, 1);
    }
    else
    {
      if (v14 != 2) {
        goto LABEL_14;
      }
      id v15 = [(HKDisplayType *)self->_displayType sampleType];
      [v15 maximumAllowedDuration];
      double v17 = v16;

      int v18 = (int)(v17 / 86400.0);
      id v19 = objc_alloc_init(MEMORY[0x1E4F28C00]);
      [v19 setAllowedUnits:16];
      if (v18 > 10) {
        uint64_t v20 = 3;
      }
      else {
        uint64_t v20 = 4;
      }
      [v19 setUnitsStyle:v20];
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDays:", v18);
      v22 = [(HKDisplayType *)self->_displayType wd_outOfRangeAlertDisplayName];
      v23 = NSString;
      id v24 = HABundle();
      objc_super v25 = v24;
      if (v22)
      {
        v26 = [v24 localizedStringForKey:@"OUT_OF_RANGE_ALERT_SAMPLE_DURATION_ERROR_%@_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
        v27 = [v19 stringFromDateComponents:v21];
        objc_msgSend(v23, "stringWithFormat:", v26, v27, v22);
      }
      else
      {
        v26 = [v24 localizedStringForKey:@"OUT_OF_RANGE_ALERT_DEFAULT_DURATION_ERROR_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
        v27 = [v19 stringFromDateComponents:v21];
        objc_msgSend(v23, "stringWithFormat:", v26, v27, v35);
      v34 = };

      v9[2](v9, 0, v34, 0);
    }
  }
  else
  {
    v9[2](v9, 1, 0, 0);
  }
LABEL_14:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(WDAddDataManualEntryTableData *)self->_model numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(WDAddDataManualEntryTableData *)self->_model numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return [(WDAddDataManualEntryTableData *)self->_model cellForRowAtIndexPath:a4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [v6 cellForRowAtIndexPath:v7];
  id v9 = [(WDAddDataManualEntryTableData *)self->_model itemForCell:v8];
  [v9 cellForItemTapped:v8];
  double v10 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__WDAddDataViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v13[3] = &unk_1E5E7CEF0;
  id v14 = v6;
  id v15 = v7;
  double v16 = self;
  id v11 = v7;
  id v12 = v6;
  [v10 animateWithDuration:v13 animations:0.2];
}

uint64_t __61__WDAddDataViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend(a1[4], "indexPathsForVisibleRows", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [a1[4] cellForRowAtIndexPath:v7];
        if ([v8 conformsToProtocol:&unk_1F0477EC8])
        {
          id v9 = v8;
          if ([a1[5] isEqual:v7]) {
            uint64_t v10 = [v9 expanded] ^ 1;
          }
          else {
            uint64_t v10 = 0;
          }
          [v9 setExpanded:v10];
          if (([v9 expanded] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v9 endEditing];
            }
          }
        }
        else if (([a1[5] isEqual:v7] & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v8 endEditing];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  [a1[4] beginUpdates];
  [a1[4] endUpdates];
  [a1[6] updatePreferredContentSize];
  return [a1[4] scrollToRowAtIndexPath:a1[5] atScrollPosition:0 animated:1];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(WDAddDataManualEntryTableData *)self->_model cellForRowAtIndexPath:a4];
  if ([v4 conformsToProtocol:&unk_1F0477EC8])
  {
    id v5 = v4;
    if ([v5 expanded])
    {
      [v5 expandedHeight];
      double v7 = v6;
    }
    else
    {
      id v8 = [v5 contentView];
      [v8 bounds];
      double v10 = v9;

      objc_msgSend(v5, "sizeThatFits:", v10, 10000.0);
      double v7 = v11;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4FB2F28];
  }

  return v7;
}

- (void)saveHKObjectWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WDAddDataViewController *)self generateHKObjects];
  [(HKHealthStore *)self->_healthStore saveObjects:v5 withCompletion:v4];
}

- (void)validateDataWithCompletion:(id)a3
{
}

- (id)defaultMetadata
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F2A228];
  v5[0] = MEMORY[0x1E4F1CC38];
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)defaultEditingItem
{
  return 0;
}

- (NSDate)initialStartDate
{
  return self->_initialStartDate;
}

- (void)setInitialStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStartDate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_validationController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

- (id)generateHKObjects
{
  return 0;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  return 0;
}

void __41__WDAddDataViewController__dataValidated__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1AD1A4000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error saving HKObjects: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end
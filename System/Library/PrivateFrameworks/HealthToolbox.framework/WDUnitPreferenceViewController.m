@interface WDUnitPreferenceViewController
- (BOOL)requiresChangeConfirmation;
- (UIFont)bodyFont;
- (WDUnitPreferenceViewController)initWithUnits:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (id)_sortedUnitPreferenceRows;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonTapped:(id)a3;
- (void)_doneButtonTapped:(id)a3;
- (void)_updateCurrentUnit:(id)a3;
- (void)setBodyFont:(id)a3;
- (void)setRequiresChangeConfirmation:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDUnitPreferenceViewController

- (WDUnitPreferenceViewController)initWithUnits:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)WDUnitPreferenceViewController;
  v11 = [(HKTableViewController *)&v29 initWithUsingInsetStyling:1];
  if (v11)
  {
    v12 = WDBundle();
    v13 = [v12 localizedStringForKey:@"UNIT" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(WDUnitPreferenceViewController *)v11 setTitle:v13];

    uint64_t v14 = [v8 copy];
    units = v11->_units;
    v11->_units = (NSSet *)v14;

    objc_storeStrong((id *)&v11->_displayType, a4);
    objc_storeStrong((id *)&v11->_unitController, a5);
    uint64_t v16 = [(WDUnitPreferenceViewController *)v11 _sortedUnitPreferenceRows];
    rows = v11->_rows;
    v11->_rows = (NSArray *)v16;

    v18 = [v10 unitForDisplayType:v11->_displayType];
    v19 = v11->_rows;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __75__WDUnitPreferenceViewController_initWithUnits_displayType_unitController___block_invoke;
    v26 = &unk_26458E8C0;
    id v27 = v18;
    v20 = v11;
    v28 = v20;
    id v21 = v18;
    [(NSArray *)v19 enumerateObjectsUsingBlock:&v23];
    -[WDUnitPreferenceViewController setModalPresentationStyle:](v20, "setModalPresentationStyle:", 2, v23, v24, v25, v26);
  }
  return v11;
}

void __75__WDUnitPreferenceViewController_initWithUnits_displayType_unitController___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 unit];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    *(void *)(*(void *)(a1 + 40) + 1064) = a3;
    *(void *)(*(void *)(a1 + 40) + 1072) = a3;
  }
}

- (id)_sortedUnitPreferenceRows
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_units;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_alloc_init(_WDUnitPreferenceViewControllerRow);
        -[_WDUnitPreferenceViewControllerRow setUnit:](v10, "setUnit:", v9, (void)v14);
        v11 = [(HKUnitPreferenceController *)self->_unitController localizedDisplayNameForUnit:v9 value:0 nameContext:2];
        [(_WDUnitPreferenceViewControllerRow *)v10 setLocalizedDisplayName:v11];

        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v3 sortedArrayUsingComparator:&__block_literal_global_7];

  return v12;
}

uint64_t __59__WDUnitPreferenceViewController__sortedUnitPreferenceRows__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 localizedDisplayName];
  uint64_t v6 = [v4 localizedDisplayName];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (UIFont)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
    id v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }

  return bodyFont;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WDUnitPreferenceViewController;
  [(HKTableViewController *)&v6 viewDidLoad];
  id v3 = [(WDUnitPreferenceViewController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  id v4 = HKUIJoinStringsForAutomationIdentifier();
  uint64_t v5 = [(WDUnitPreferenceViewController *)self tableView];
  [v5 setAccessibilityIdentifier:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WDUnitPreferenceViewController;
  [(WDUnitPreferenceViewController *)&v12 viewWillAppear:a3];
  if ([(WDUnitPreferenceViewController *)self requiresChangeConfirmation])
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped_];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v4;

    objc_super v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
    doneButton = self->_doneButton;
    self->_doneButton = v6;

    [(UIBarButtonItem *)self->_doneButton setEnabled:self->_selectedRowIndex != self->_originalSelectedRowIndex];
    id v8 = [(WDUnitPreferenceViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:self->_cancelButton];

    uint64_t v9 = [(WDUnitPreferenceViewController *)self navigationItem];
    [v9 setRightBarButtonItem:self->_doneButton];

    id v10 = [(HKDisplayType *)self->_displayType localization];
    v11 = [v10 displayName];
    [(WDUnitPreferenceViewController *)self setTitle:v11];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDUnitPreferenceViewController;
  [(WDUnitPreferenceViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    uint64_t v5 = [(WDUnitPreferenceViewController *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      bodyFont = self->_bodyFont;
      self->_bodyFont = 0;
    }
  }
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (void)_doneButtonTapped:(id)a3
{
  id v4 = [(NSArray *)self->_rows objectAtIndexedSubscript:self->_selectedRowIndex];
  uint64_t v5 = (void *)MEMORY[0x263F1C3F0];
  objc_super v6 = WDBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  char v8 = [v5 actionWithTitle:v7 style:1 handler:0];

  uint64_t v9 = (void *)MEMORY[0x263F1C3F0];
  objc_super v10 = WDBundle();
  v11 = [v10 localizedStringForKey:@"CHANGE_UNITS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__WDUnitPreferenceViewController__doneButtonTapped___block_invoke;
  v20[3] = &unk_26458DE98;
  v20[4] = self;
  id v21 = v4;
  id v12 = v4;
  v13 = [v9 actionWithTitle:v11 style:0 handler:v20];

  long long v14 = NSString;
  long long v15 = WDBundle();
  long long v16 = [v15 localizedStringForKey:@"CONFIRM_UNIT_CHANGE %@" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  long long v17 = [v12 localizedDisplayName];
  v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);

  uint64_t v19 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:&stru_26D2EA890 message:v18 preferredStyle:1];
  [v19 addAction:v8];
  [v19 addAction:v13];
  [(WDUnitPreferenceViewController *)self presentViewController:v19 animated:1 completion:0];
}

uint64_t __52__WDUnitPreferenceViewController__doneButtonTapped___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) unit];
  [v2 _updateCurrentUnit:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateCurrentUnit:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_rows count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"Cell"];
  }
  char v8 = -[NSArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", [v6 row]);
  uint64_t v9 = [v7 textLabel];
  objc_super v10 = [v8 localizedDisplayName];
  [v9 setText:v10];

  int64_t selectedRowIndex = self->_selectedRowIndex;
  uint64_t v12 = [v6 row];

  if (selectedRowIndex == v12) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  long long v14 = [v7 textLabel];
  long long v15 = [(WDUnitPreferenceViewController *)self bodyFont];
  [v14 setFont:v15];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if ([v7 row] != self->_selectedRowIndex)
  {
    char v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:");
    int64_t v9 = [v7 row];
    self->_int64_t selectedRowIndex = v9;
    [(UIBarButtonItem *)self->_doneButton setEnabled:v9 != self->_originalSelectedRowIndex];
    v15[0] = v7;
    objc_super v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v6 reloadRowsAtIndexPaths:v10 withRowAnimation:100];

    long long v14 = v8;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [v6 reloadRowsAtIndexPaths:v11 withRowAnimation:5];

    if (![(WDUnitPreferenceViewController *)self requiresChangeConfirmation])
    {
      uint64_t v12 = [(NSArray *)self->_rows objectAtIndexedSubscript:self->_selectedRowIndex];
      uint64_t v13 = [v12 unit];
      [(WDUnitPreferenceViewController *)self _updateCurrentUnit:v13];
    }
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(HKDisplayType *)self->_displayType localization];
  uint64_t v5 = [v4 unitChangeCautionaryText];

  return v5;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  id v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  objc_super v10 = __70__WDUnitPreferenceViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_26458DD38;
  objc_copyWeak(&v12, &location);
  uint64_t v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  id v7 = [(WDUnitPreferenceViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__WDUnitPreferenceViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(WDUnitPreferenceViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (BOOL)requiresChangeConfirmation
{
  return self->_requiresChangeConfirmation;
}

- (void)setRequiresChangeConfirmation:(BOOL)a3
{
  self->_requiresChangeConfirmation = a3;
}

- (void)setBodyFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);

  objc_storeStrong((id *)&self->_units, 0);
}

@end
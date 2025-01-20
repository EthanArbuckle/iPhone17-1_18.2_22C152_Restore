@interface WDWatchStoredDataViewController
- (BOOL)_shouldDisplayPrivacySection;
- (BOOL)watchPaired;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateFont;
- (void)addUnpairedWatchHeaderView;
- (void)handlePairedDevicesSnapshot:(id)a3;
- (void)setWatchPaired:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTableHeaderViewForUnpairedWatch;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDWatchStoredDataViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDWatchStoredDataViewController;
  [(WDStoredDataByCategoryViewController *)&v4 viewWillAppear:a3];
  [(WDWatchStoredDataViewController *)self updateTableHeaderViewForUnpairedWatch];
}

- (void)addUnpairedWatchHeaderView
{
  v3 = [(WDStoredDataByCategoryViewController *)self profile];
  objc_super v4 = [v3 healthStore];
  v5 = [v4 profileIdentifier];
  uint64_t v6 = [v5 type];

  if (v6 != 3)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v7 setTextColor:v8];

    [(UILabel *)v7 setNumberOfLines:0];
    [(UILabel *)v7 setTextAlignment:1];
    v9 = WDBundle();
    id v32 = [v9 localizedStringForKey:@"SOURCES_WATCH_UNPAIRED" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    v10 = NSString;
    v11 = [(WDSourceStoredDataViewController *)self source];
    v12 = [v11 name];
    v13 = objc_msgSend(v10, "localizedStringWithFormat:", v32, v12);
    [(UILabel *)v7 setText:v13];

    id v14 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 addSubview:v7];
    v15 = [(UILabel *)v7 topAnchor];
    v16 = [v14 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:30.0];
    [v17 setActive:1];

    v18 = [(UILabel *)v7 bottomAnchor];
    v19 = [v14 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(UILabel *)v7 leadingAnchor];
    v22 = [v14 leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:40.0];
    [v23 setActive:1];

    v24 = [(UILabel *)v7 trailingAnchor];
    v25 = [v14 trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:-40.0];
    [v26 setActive:1];

    v27 = [v14 widthAnchor];
    v28 = [(WDWatchStoredDataViewController *)self view];
    [v28 frame];
    v29 = [v27 constraintEqualToConstant:CGRectGetWidth(v34)];
    [v29 setActive:1];

    messageLabel = self->_messageLabel;
    self->_messageLabel = v7;

    [(WDWatchStoredDataViewController *)self _updateFont];
    [v14 layoutIfNeeded];
    v31 = [(WDWatchStoredDataViewController *)self tableView];
    [v31 setTableHeaderView:v14];
  }
}

- (void)updateTableHeaderViewForUnpairedWatch
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F0A558]);
  objc_super v4 = [(WDStoredDataByCategoryViewController *)self profile];
  v5 = [v4 healthStore];
  uint64_t v6 = (void *)[v3 initWithHealthStore:v5];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke;
  v7[3] = &unk_26458DD88;
  objc_copyWeak(&v8, &location);
  [v6 fetchNanoSyncPairedDevicesWithCompletion:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke_2;
  v5[3] = &unk_26458DD60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handlePairedDevicesSnapshot:*(void *)(a1 + 32)];
}

- (void)handlePairedDevicesSnapshot:(id)a3
{
  id v4 = a3;
  v5 = [(WDSourceStoredDataViewController *)self source];
  id v6 = [v5 bundleIdentifier];
  id v7 = [v4 deviceInfoForSourceBundleIdentifier:v6];

  if (v7)
  {
    if (![(WDWatchStoredDataViewController *)self watchPaired])
    {
      [(WDWatchStoredDataViewController *)self setWatchPaired:1];
      id v8 = [(WDWatchStoredDataViewController *)self tableView];
      [v8 setTableHeaderView:0];

      v9 = [(WDWatchStoredDataViewController *)self tableView];
      [v9 beginUpdates];

      v10 = [(WDWatchStoredDataViewController *)self tableView];
      v11 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
      [v10 insertSections:v11 withRowAnimation:3];

      id v12 = [(WDWatchStoredDataViewController *)self tableView];
      [v12 endUpdates];
    }
  }
  else
  {
    [(WDWatchStoredDataViewController *)self addUnpairedWatchHeaderView];
  }
}

- (void)_updateFont
{
  id v3 = (void *)MEMORY[0x263F1C658];
  id v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v5 _scaledValueForValue:20.0];
  id v4 = objc_msgSend(v3, "systemFontOfSize:");
  [(UILabel *)self->_messageLabel setFont:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDWatchStoredDataViewController;
  [(WDStoredDataByCategoryViewController *)&v13 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(WDWatchStoredDataViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(WDWatchStoredDataViewController *)self _updateFont];
      v9 = [(WDWatchStoredDataViewController *)self tableView];
      [v9 beginUpdates];

      v10 = [(WDWatchStoredDataViewController *)self tableView];
      v11 = [v10 tableHeaderView];
      [v11 setNeedsLayout];

      id v12 = [(WDWatchStoredDataViewController *)self tableView];
      [v12 endUpdates];
    }
  }
}

- (BOOL)_shouldDisplayPrivacySection
{
  v2 = [(WDStoredDataByCategoryViewController *)self profile];
  id v3 = [v2 healthStore];
  id v4 = [v3 profileIdentifier];
  BOOL v5 = [v4 type] != 3;

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  if ([(WDWatchStoredDataViewController *)self watchPaired]
    && [(WDWatchStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    v7.receiver = self;
    v7.super_class = (Class)WDWatchStoredDataViewController;
    BOOL v5 = (char *)[(WDStoredDataByCategoryViewController *)&v7 numberOfSectionsInTableView:v4]+ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WDWatchStoredDataViewController;
    BOOL v5 = [(WDStoredDataByCategoryViewController *)&v8 numberOfSectionsInTableView:v4];
  }

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(WDWatchStoredDataViewController *)self watchPaired]
    && [(WDWatchStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    if (!a4)
    {
      int64_t v8 = 1;
      goto LABEL_7;
    }
    id v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v10, sel_tableView_numberOfRowsInSection_, v6, a4 - 1, self, WDWatchStoredDataViewController, v11.receiver, v11.super_class);
  }
  else
  {
    id v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v11, sel_tableView_numberOfRowsInSection_, v6, a4, v10.receiver, v10.super_class, self, WDWatchStoredDataViewController);
  }
  int64_t v8 = (int64_t)v7;
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WDWatchStoredDataViewController *)self watchPaired]
    && [(WDWatchStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    if ([v7 section])
    {
      int64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section") - 1);
      v19.receiver = self;
      v19.super_class = (Class)WDWatchStoredDataViewController;
      v9 = [(WDStoredDataByCategoryViewController *)&v19 tableView:v6 cellForRowAtIndexPath:v8];
    }
    else
    {
      v9 = [v6 dequeueReusableCellWithIdentifier:@"WDWatchStoredDataViewControllerPrivacyCellIdentifier"];
      if (!v9) {
        v9 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDWatchStoredDataViewControllerPrivacyCellIdentifier"];
      }
      objc_super v11 = WDBundle();
      id v12 = [v11 localizedStringForKey:@"PRIVACY_SETTINGS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
      objc_super v13 = [v9 textLabel];
      [v13 setText:v12];

      id v14 = [(WDWatchStoredDataViewController *)self view];
      v15 = [v14 tintColor];
      v16 = [v9 textLabel];
      [v16 setTextColor:v15];

      v17 = [(WDStoredDataByCategoryViewController *)self bodyFont];
      v18 = [v9 textLabel];
      [v18 setFont:v17];
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WDWatchStoredDataViewController;
    v9 = [(WDStoredDataByCategoryViewController *)&v20 tableView:v6 cellForRowAtIndexPath:v7];
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(WDWatchStoredDataViewController *)self watchPaired]
    && [(WDWatchStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    if (!a4) {
      goto LABEL_7;
    }
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v8, sel_tableView_titleForHeaderInSection_, v6, a4 - 1, self, WDWatchStoredDataViewController, v9.receiver, v9.super_class);
  }
  else
  {
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v9, sel_tableView_titleForHeaderInSection_, v6, a4, v8.receiver, v8.super_class, self, WDWatchStoredDataViewController);
  a4 = };
LABEL_7:

  return (id)a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 cellForRowAtIndexPath:v7];
  objc_super v9 = [v8 reuseIdentifier];
  int v10 = [v9 isEqualToString:@"WDWatchStoredDataViewControllerPrivacyCellIdentifier"];

  if (v10)
  {
    objc_super v11 = [MEMORY[0x263F01880] defaultWorkspace];
    id v12 = [NSURL URLWithString:@"bridge:root=PRIVACY_ID"];
    [v11 openSensitiveURL:v12 withOptions:0];

    [v8 setSelected:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WDWatchStoredDataViewController;
    [(WDStoredDataByCategoryViewController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (BOOL)watchPaired
{
  return self->_watchPaired;
}

- (void)setWatchPaired:(BOOL)a3
{
  self->_watchPaired = a3;
}

- (void).cxx_destruct
{
}

@end
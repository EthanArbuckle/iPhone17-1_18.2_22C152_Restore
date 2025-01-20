@interface LAPSPasscodeOptionsSheetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_tableRowShouldDismissOnSelection;
- (BOOL)_tableViewNeedsHeaderView;
- (CGSize)preferredContentSize;
- (LAPSPasscodeOptionsSheetViewController)initWithConfiguration:(id)a3;
- (LAPSPasscodeOptionsSheetViewController)initWithConfiguration:(id)a3 style:(int64_t)a4;
- (LAPSPasscodeOptionsViewControllerDelegate)delegate;
- (double)_heightForFooterInSection:(int64_t)a3;
- (double)_heightForHeaderInSection:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_cellIdentifierForIndexPath:(id)a3;
- (id)_tableCellTextColor;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_tableViewStyle;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_changePasscodeRecoveryStatus:(id)a3;
- (void)_changeSelectedPasscodeTypeIndex:(int64_t)a3;
- (void)_close:(id)a3;
- (void)_setup;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LAPSPasscodeOptionsSheetViewController

- (LAPSPasscodeOptionsSheetViewController)initWithConfiguration:(id)a3
{
  return [(LAPSPasscodeOptionsSheetViewController *)self initWithConfiguration:a3 style:0];
}

- (LAPSPasscodeOptionsSheetViewController)initWithConfiguration:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LAPSPasscodeOptionsSheetViewController;
  v8 = [(LAPSPasscodeOptionsSheetViewController *)&v16 init];
  v9 = v8;
  if (v8)
  {
    p_config = (id *)&v8->_config;
    objc_storeStrong((id *)&v8->_config, a3);
    v9->_style = a4;
    uint64_t v11 = [*p_config allowedPasscodeTypes];
    allowedPasscodeTypes = v9->_allowedPasscodeTypes;
    v9->_allowedPasscodeTypes = (NSOrderedSet *)v11;

    v13 = v9->_allowedPasscodeTypes;
    v14 = [*p_config selectedPasscodeType];
    v9->_selectedPasscodeTypeIndex = [(NSOrderedSet *)v13 indexOfObject:v14];
  }
  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LAPSPasscodeOptionsSheetViewController;
  [(LAPSPasscodeOptionsSheetViewController *)&v3 viewDidLoad];
  [(LAPSPasscodeOptionsSheetViewController *)self _setup];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LAPSPasscodeOptionsSheetViewController;
  [(LAPSPasscodeOptionsSheetViewController *)&v5 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeOptionsViewControllerDidDisappear:self];
}

- (CGSize)preferredContentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (![(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoverySupported])return 1; {
  if ([(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryOptionVisible])
  }
  {
    return 2;
  }
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return [(NSOrderedSet *)self->_allowedPasscodeTypes count];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(LAPSPasscodeOptionsSheetViewController *)self _cellIdentifierForIndexPath:v7];
  v9 = [v6 dequeueReusableCellWithIdentifier:v8];
  if (!v9) {
    v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:v8];
  }
  [v9 setAccessoryType:0];
  [v9 setSelectionStyle:0];
  if ([v7 section])
  {
    if ([v7 section] != 1) {
      -[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:]();
    }
    v10 = [v9 defaultContentConfiguration];
    uint64_t v11 = [(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config passcodeRecoveryTitle];
    [v10 setText:v11];

    [v9 setContentConfiguration:v10];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v19[3] = &unk_26506EF50;
    v19[4] = self;
    v12 = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_2((uint64_t)v19);
    [v9 setAccessoryView:v12];
    goto LABEL_9;
  }
  unint64_t v13 = [v7 row];
  if (v13 >= [(NSOrderedSet *)self->_allowedPasscodeTypes count]) {
    -[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:]();
  }
  v10 = [v9 defaultContentConfiguration];
  v14 = [v10 textProperties];
  v15 = [(LAPSPasscodeOptionsSheetViewController *)self _tableCellTextColor];
  [v14 setColor:v15];

  objc_super v16 = -[NSOrderedSet objectAtIndex:](self->_allowedPasscodeTypes, "objectAtIndex:", [v7 row]);
  v17 = [v16 localizedName];
  [v10 setText:v17];

  [v9 setContentConfiguration:v10];
  if ([v7 row] == self->_selectedPasscodeTypeIndex)
  {
    [v9 setSelected:1];
    [v6 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke;
    block[3] = &unk_26506EF00;
    block[4] = self;
    id v21 = v6;
    id v22 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);

    v12 = v21;
LABEL_9:
  }

  return v9;
}

uint64_t __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tableView:*(void *)(a1 + 40) didSelectRowAtIndexPath:*(void *)(a1 + 48)];
}

id __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F82C40]);
  [v2 setPreferredStyle:2];
  objc_msgSend(v2, "setOn:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "isPasscodeRecoveryEnabled"));
  objc_msgSend(v2, "setEnabled:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "isPasscodeRecoveryRestricted") ^ 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  double v8 = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v9 = &unk_26506EF28;
  objc_copyWeak(&v10, &location);
  double v4 = [v3 actionWithHandler:&v6];
  objc_msgSend(v2, "addAction:forControlEvents:", v4, 4096, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v2;
}

void __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [v3 sender];

  [WeakRetained _changePasscodeRecoveryStatus:v4];
}

- (id)_cellIdentifierForIndexPath:(id)a3
{
  id v3 = a3;
  if ([v3 section])
  {
    if ([v3 section] != 1) {
      -[LAPSPasscodeOptionsSheetViewController _cellIdentifierForIndexPath:]();
    }
    double v4 = @"PasscodeRecovery";
  }
  else
  {
    double v4 = @"PasscodeType";
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    unint64_t v7 = [v6 row];
    if (v7 < [(NSOrderedSet *)self->_allowedPasscodeTypes count])
    {
      -[LAPSPasscodeOptionsSheetViewController _changeSelectedPasscodeTypeIndex:](self, "_changeSelectedPasscodeTypeIndex:", [v6 row]);
      double v8 = [v9 cellForRowAtIndexPath:v6];
      [v8 setAccessoryType:3];
    }
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    id v7 = 0;
  }
  else
  {
    double v8 = [v5 indexPathForSelectedRow];
    if ([v8 isEqual:v6]) {
      id v9 = 0;
    }
    else {
      id v9 = v6;
    }
    id v7 = v9;
  }

  return v7;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (![v5 section])
  {
    id v6 = [v9 indexPathForSelectedRow];
    char v7 = [v6 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      double v8 = [v9 cellForRowAtIndexPath:v5];
      [v8 setAccessoryType:0];
    }
  }
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  [(LAPSPasscodeOptionsSheetViewController *)self _heightForHeaderInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  [(LAPSPasscodeOptionsSheetViewController *)self _heightForHeaderInSection:a4];
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  double v4 = objc_opt_new();

  return v4;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  [(LAPSPasscodeOptionsSheetViewController *)self _heightForFooterInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  [(LAPSPasscodeOptionsSheetViewController *)self _heightForFooterInSection:a4];
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  double v4 = objc_opt_new();

  return v4;
}

- (double)_heightForHeaderInSection:(int64_t)a3
{
  return 12.0;
}

- (double)_heightForFooterInSection:(int64_t)a3
{
  return 1.0;
}

- (void)_setup
{
  v29[4] = *MEMORY[0x263EF8340];
  id v3 = [(LAPSPasscodeOptionsSheetViewController *)self view];
  double v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F82C78]);
  int64_t v6 = [(LAPSPasscodeOptionsSheetViewController *)self _tableViewStyle];
  char v7 = objc_msgSend(v5, "initWithFrame:style:", v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setDataSource:self];
  [v7 setDelegate:self];
  [v7 setAllowsMultipleSelection:0];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setSectionHeaderTopPadding:0.0];
  double v8 = [(LAPSPasscodeOptionsSheetViewController *)self view];
  [v8 addSubview:v7];

  v20 = (void *)MEMORY[0x263F08938];
  v26 = [v7 topAnchor];
  v27 = [(LAPSPasscodeOptionsSheetViewController *)self view];
  v25 = [v27 topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  id v22 = [v7 bottomAnchor];
  v23 = [(LAPSPasscodeOptionsSheetViewController *)self view];
  id v21 = [v23 bottomAnchor];
  v19 = [v22 constraintEqualToAnchor:v21];
  v29[1] = v19;
  v18 = [v7 leadingAnchor];
  id v9 = [(LAPSPasscodeOptionsSheetViewController *)self view];
  id v10 = [v9 leadingAnchor];
  uint64_t v11 = [v18 constraintEqualToAnchor:v10];
  v29[2] = v11;
  v12 = [v7 trailingAnchor];
  unint64_t v13 = [(LAPSPasscodeOptionsSheetViewController *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v29[3] = v15;
  objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  [v20 activateConstraints:v16];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke;
  v28[3] = &unk_26506EFB8;
  v28[4] = self;
  v17 = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke((uint64_t)v28);
  [v7 setTableHeaderView:v17];

  objc_storeWeak((id *)&self->_tableView, v7);
}

id __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke(uint64_t a1)
{
  v36[2] = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) _tableViewNeedsHeaderView];
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  if (v2)
  {
    double v4 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 60.0);
    v30 = (id *)(a1 + 32);
    id v31 = objc_alloc_init(MEMORY[0x263F828E0]);
    id v5 = [*(id *)(*(void *)(a1 + 32) + 976) title];
    [v31 setText:v5];

    int64_t v6 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83628] weight:*MEMORY[0x263F81800]];
    [v31 setFont:v6];

    [v4 addSubview:v31];
    [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
    char v7 = (void *)MEMORY[0x263F08938];
    double v8 = [v31 centerYAnchor];
    id v9 = [v4 centerYAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    v36[0] = v10;
    uint64_t v11 = [v31 leadingAnchor];
    v12 = [v4 leadingAnchor];
    unint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:20.0];
    v36[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    [v7 activateConstraints:v14];

    v15 = (void *)MEMORY[0x263F824E8];
    objc_super v16 = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_2();
    v17 = [MEMORY[0x263F823D0] actionWithHandler:&__block_literal_global_38];
    v18 = [v15 buttonWithConfiguration:v16 primaryAction:v17];

    [v4 addSubview:v18];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = (void *)MEMORY[0x263F08938];
    v20 = [v18 centerYAnchor];
    id v21 = [v4 centerYAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    v35[0] = v22;
    v23 = [v18 trailingAnchor];
    v24 = [v4 trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:-20.0];
    v35[1] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    [v19 activateConstraints:v26];

    objc_initWeak(&location, *v30);
    v27 = (void *)MEMORY[0x263F823D0];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_6;
    v32[3] = &unk_26506EF28;
    objc_copyWeak(&v33, &location);
    v28 = [v27 actionWithHandler:v32];
    [v18 addAction:v28 forControlEvents:64];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    double v4 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  }

  return v4;
}

id __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_2()
{
  v0 = [MEMORY[0x263F824F0] grayButtonConfiguration];
  v1 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark"];
  [v0 setImage:v1];

  [v0 setImageColorTransformer:&__block_literal_global_32];
  char v2 = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_4();
  [v0 setPreferredSymbolConfigurationForImage:v2];

  [v0 setCornerStyle:4];
  objc_msgSend(v0, "setContentInsets:", 5.0, 5.0, 5.0, 5.0);

  return v0;
}

uint64_t __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_3()
{
  return [MEMORY[0x263F825C8] secondaryLabelColor];
}

id __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_4()
{
  v0 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F81800]];
  v1 = [MEMORY[0x263F82818] configurationWithFont:v0 scale:1];

  return v1;
}

void __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_6(uint64_t a1, void *a2)
{
  char v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [v3 sender];

  [WeakRetained _close:v4];
}

- (void)_close:(id)a3
{
}

- (void)_changePasscodeRecoveryStatus:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[LAPSPasscodeOptionsSheetViewController _changePasscodeRecoveryStatus:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeOptionsViewController:didSetPasscodeRecoveryEnabled:", self, objc_msgSend(v5, "isOn"));
}

- (void)_changeSelectedPasscodeTypeIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSOrderedSet *)self->_allowedPasscodeTypes count] <= a3) {
    -[LAPSPasscodeOptionsSheetViewController _changeSelectedPasscodeTypeIndex:]();
  }
  if (self->_selectedPasscodeTypeIndex != a3)
  {
    self->_selectedPasscodeTypeIndex = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v6 = [(NSOrderedSet *)self->_allowedPasscodeTypes objectAtIndex:a3];
    [WeakRetained passcodeOptionsViewController:self didSelectPasscodeType:v6];

    if ([(LAPSPasscodeOptionsSheetViewController *)self _tableRowShouldDismissOnSelection])
    {
      [(LAPSPasscodeOptionsSheetViewController *)self _close:0];
    }
  }
}

- (int64_t)_tableViewStyle
{
  return 2 * (self->_style == 0);
}

- (BOOL)_tableViewNeedsHeaderView
{
  return self->_style == 0;
}

- (id)_tableCellTextColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    self = [MEMORY[0x263F825C8] labelColor];
  }
  else if (!style)
  {
    self = [MEMORY[0x263F825C8] tableCellBlueTextColor];
  }

  return self;
}

- (BOOL)_tableRowShouldDismissOnSelection
{
  return self->_style != 0;
}

- (LAPSPasscodeOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAPSPasscodeOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, 0);
  objc_destroyWeak((id *)&self->_tableView);

  objc_storeStrong((id *)&self->_config, 0);
}

- (void)tableView:cellForRowAtIndexPath:.cold.1()
{
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:]", "LAPSPasscodeOptionsSheetViewController.m", 112, "[indexPath section] == 1");
}

- (void)_cellIdentifierForIndexPath:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController _cellIdentifierForIndexPath:]", "LAPSPasscodeOptionsSheetViewController.m", 136, "[indexPath section] == 1");
}

- (void)_changePasscodeRecoveryStatus:.cold.1()
{
}

- (void)_changeSelectedPasscodeTypeIndex:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController _changeSelectedPasscodeTypeIndex:]", "LAPSPasscodeOptionsSheetViewController.m", 281, "index >= 0 && index < [_allowedPasscodeTypes count]");
}

@end
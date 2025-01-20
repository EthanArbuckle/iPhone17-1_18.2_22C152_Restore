@interface NPHBSCellularConfirmationCodeViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (NPHBSCellularConfirmationCodeViewController)init;
- (NPHBSCellularConfirmationCodeViewControllerDelegate)delegate;
- (NSLayoutConstraint)infoTableViewHeightConstraint;
- (UILabel)confirmationCodeTitleLabel;
- (UITableView)infoTableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)confirm:(id)a3;
- (void)setConfirmationCodeTitleLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoTableView:(id)a3;
- (void)setInfoTableViewHeightConstraint:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NPHBSCellularConfirmationCodeViewController

- (NPHBSCellularConfirmationCodeViewController)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[NPHBSCellularConfirmationCodeViewController init]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13.receiver = self;
  v13.super_class = (Class)NPHBSCellularConfirmationCodeViewController;
  v5 = [(NPHBSCellularConfirmationCodeViewController *)&v13 initWithNibName:@"NPHBSCellularConfirmationCode" bundle:v4];

  if (v5)
  {
    v6 = [[NPHSetupTableViewCell alloc] initWithTag:0 delegate:v5];
    confirmationCodeCell = v5->_confirmationCodeCell;
    v5->_confirmationCodeCell = v6;

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_LABEL" value:&stru_26E895688 table:0];
    v10 = [(NPHSetupTableViewCell *)v5->_confirmationCodeCell textLabel];
    [v10 setText:v9];

    v11 = [(NPHSetupTableViewCell *)v5->_confirmationCodeCell editableTextField];
    [v11 setKeyboardType:2];
  }
  return v5;
}

- (void)viewDidLoad
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[NPHBSCellularConfirmationCodeViewController viewDidLoad]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)NPHBSCellularConfirmationCodeViewController;
  [(NPHBSCellularConfirmationCodeViewController *)&v9 viewDidLoad];
  v4 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F0]];
  v5 = (void *)MEMORY[0x263F1C658];
  v6 = [v4 fontDescriptorWithSymbolicTraits:2];
  v7 = [v5 fontWithDescriptor:v6 size:0.0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_confirmationCodeTitleLabel);
  [WeakRetained setFont:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NPHBSCellularConfirmationCodeViewController;
  [(NPHBSCellularConfirmationCodeViewController *)&v12 viewDidAppear:a3];
  id v4 = objc_alloc(MEMORY[0x263F1C468]);
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_NEXT" value:&stru_26E895688 table:0];
  v7 = (void *)[v4 initWithTitle:v6 style:2 target:self action:sel_confirm_];

  v8 = [(NPHBSCellularConfirmationCodeViewController *)self navigationController];
  objc_super v9 = [v8 navigationBar];

  v10 = [v9 topItem];
  [v10 setRightBarButtonItem:v7];
  v11 = [(NPHSetupTableViewCell *)self->_confirmationCodeCell editableTextField];
  [v11 becomeFirstResponder];
}

- (void)viewDidLayoutSubviews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  [(NPHBSCellularConfirmationCodeViewController *)self tableView:WeakRetained heightForRowAtIndexPath:0];
  double v5 = v4;

  id v6 = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  [v6 setConstant:v5 + -0.5];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_confirmationCodeCell;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[NPHSetupTableViewCell rowHeight];
  return result;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)confirm:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(NPHSetupTableViewCell *)self->_confirmationCodeCell editableTextField];
    id v6 = [v5 text];
    int v11 = 136315394;
    objc_super v12 = "-[NPHBSCellularConfirmationCodeViewController confirm:]";
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s confirmation code:%@", (uint8_t *)&v11, 0x16u);
  }
  v7 = [(NPHBSCellularConfirmationCodeViewController *)self presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  v8 = [(NPHBSCellularConfirmationCodeViewController *)self delegate];
  objc_super v9 = [(NPHSetupTableViewCell *)self->_confirmationCodeCell editableTextField];
  v10 = [v9 text];
  [v8 cellularConfirmationCodeViewController:self confirmedWithCode:v10];
}

- (NPHBSCellularConfirmationCodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPHBSCellularConfirmationCodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)confirmationCodeTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_confirmationCodeTitleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setConfirmationCodeTitleLabel:(id)a3
{
}

- (UITableView)infoTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  return (UITableView *)WeakRetained;
}

- (void)setInfoTableView:(id)a3
{
}

- (NSLayoutConstraint)infoTableViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setInfoTableViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_infoTableViewHeightConstraint);
  objc_destroyWeak((id *)&self->_infoTableView);
  objc_destroyWeak((id *)&self->_confirmationCodeTitleLabel);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationCodeCell, 0);
}

@end
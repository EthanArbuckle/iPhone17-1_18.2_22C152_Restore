@interface AAUIOBTableWelcomeController
- (AAUIOBTableWelcomeController)initWithViewModel:(id)a3;
- (AAUIOBTableWelcomeControllerDelegate)delegate;
- (OBTrayButton)primaryButton;
- (OBTrayButton)secondaryButton;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_helpLinkFooterView;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_addPrimaryButtonWithViewModel:(id)a3;
- (void)_addSecondaryButtonWithViewModel:(id)a3;
- (void)_addSecondaryViewWithViewModel:(id)a3;
- (void)_delegate_tableViewControllerDidTapSecondaryButton;
- (void)_delegate_tableWelcomeViewControllerDidTapPrimaryButton;
- (void)_openHelpLink;
- (void)_setupTableViewWithViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation AAUIOBTableWelcomeController

- (AAUIOBTableWelcomeController)initWithViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
  id v5 = a3;
  v6 = [v5 title];
  v7 = [v5 detailText];
  v8 = [v5 image];
  v11.receiver = self;
  v11.super_class = (Class)AAUIOBTableWelcomeController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v11, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v6, v7, v8, [v5 adoptTableViewScrollView]);

  [(AAUIOBTableWelcomeController *)v9 _addSecondaryViewWithViewModel:v9->_viewModel];
  [(AAUIOBTableWelcomeController *)v9 _addPrimaryButtonWithViewModel:v9->_viewModel];
  [(AAUIOBTableWelcomeController *)v9 _addSecondaryButtonWithViewModel:v9->_viewModel];

  [(AAUIOBTableWelcomeController *)v9 setModalInPresentation:1];
  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIOBTableWelcomeController;
  [(OBTableWelcomeController *)&v3 viewDidLoad];
  [(AAUIOBTableWelcomeController *)self _setupTableViewWithViewModel:self->_viewModel];
}

- (void)_setupTableViewWithViewModel:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F82C78]);
  uint64_t v5 = [(AAUIOBTableWelcomeControllerViewModelProtocol *)self->_viewModel tableViewStyle];
  v6 = objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v6];

  v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v8 = *MEMORY[0x263F839B8];
  v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setRowHeight:v8];

  id v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setBackgroundColor:v11];
}

- (void)_addSecondaryViewWithViewModel:(id)a3
{
  v22[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 secondaryView];

  if (v5)
  {
    v6 = [v4 secondaryView];
    v7 = [(AAUIOBTableWelcomeController *)self secondaryContentView];
    [v7 addSubview:v6];

    v17 = (void *)MEMORY[0x263F08938];
    v20 = [v6 leadingAnchor];
    v21 = [(AAUIOBTableWelcomeController *)self secondaryContentView];
    v19 = [v21 leadingAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v22[0] = v18;
    v16 = [v6 trailingAnchor];
    double v8 = [(AAUIOBTableWelcomeController *)self secondaryContentView];
    v9 = [v8 trailingAnchor];
    v10 = [v16 constraintEqualToAnchor:v9];
    v22[1] = v10;
    id v11 = [v6 topAnchor];
    v12 = [(AAUIOBTableWelcomeController *)self secondaryContentView];
    v13 = [v12 topAnchor];
    v14 = [v11 constraintEqualToAnchor:v13 constant:20.0];
    v22[2] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
    [v17 activateConstraints:v15];
  }
}

- (void)_addPrimaryButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 primaryButton];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F5B898] boldButton];
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    v7 = self->_primaryButton;
    double v8 = [v10 primaryButton];
    [(OBTrayButton *)v7 setTitle:v8 forState:0];

    [(OBTrayButton *)self->_primaryButton addTarget:self action:sel__delegate_tableWelcomeViewControllerDidTapPrimaryButton forControlEvents:64];
    v9 = [(AAUIOBTableWelcomeController *)self buttonTray];
    [v9 addButton:self->_primaryButton];
  }
}

- (void)_addSecondaryButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 secondaryButton];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F5B8D0] linkButton];
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    v7 = self->_secondaryButton;
    double v8 = [v10 secondaryButton];
    [(OBTrayButton *)v7 setTitle:v8 forState:0];

    [(OBTrayButton *)self->_secondaryButton addTarget:self action:sel__delegate_tableViewControllerDidTapSecondaryButton forControlEvents:64];
    v9 = [(AAUIOBTableWelcomeController *)self buttonTray];
    [v9 addButton:self->_secondaryButton];
  }
}

- (void)_delegate_tableWelcomeViewControllerDidTapPrimaryButton
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUIOBTableWelcomeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 tableWelcomeViewControllerDidTapPrimaryButton];
  }
}

- (void)_delegate_tableViewControllerDidTapSecondaryButton
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUIOBTableWelcomeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 tableWelcomeViewControllerDidTapSecondaryButton];
  }
}

- (id)_helpLinkFooterView
{
  v16[2] = *MEMORY[0x263EF8340];
  helpLinkFooterView = self->_helpLinkFooterView;
  if (!helpLinkFooterView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    uint64_t v5 = self->_helpLinkFooterView;
    self->_helpLinkFooterView = v4;

    v6 = [MEMORY[0x263F5B8B8] accessoryButton];
    v7 = [(AAUIOBTableWelcomeControllerViewModelProtocol *)self->_viewModel helpLinkTitle];
    [v6 setTitle:v7 forState:0];

    [v6 addTarget:self action:sel__openHelpLink forControlEvents:64];
    [(UIView *)self->_helpLinkFooterView addSubview:v6];
    double v8 = [v6 bottomAnchor];
    v9 = [(UIView *)self->_helpLinkFooterView bottomAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9 constant:0.0];
    v16[0] = v10;
    id v11 = [v6 centerXAnchor];
    v12 = [(UIView *)self->_helpLinkFooterView centerXAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v16[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

    [MEMORY[0x263F08938] activateConstraints:v14];
    helpLinkFooterView = self->_helpLinkFooterView;
  }
  return helpLinkFooterView;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v6 = [(OBTableWelcomeController *)self tableView];
  uint64_t v7 = [v6 numberOfSections];

  if (v7 - 1 == a4
    && ([(AAUIOBTableWelcomeControllerViewModelProtocol *)self->_viewModel helpLinkTitle],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [(AAUIOBTableWelcomeController *)self _helpLinkFooterView];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 40.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void)_openHelpLink
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(AAUIOBTableWelcomeControllerViewModelProtocol *)self->_viewModel helpLinkURL];
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Help link was tapped, URL is: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F82438] sharedApplication];
  v6 = NSURL;
  uint64_t v7 = [(AAUIOBTableWelcomeControllerViewModelProtocol *)self->_viewModel helpLinkURL];
  double v8 = [v6 URLWithString:v7];
  [v5 openURL:v8 withCompletionHandler:0];
}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (AAUIOBTableWelcomeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIOBTableWelcomeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_helpLinkFooterView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
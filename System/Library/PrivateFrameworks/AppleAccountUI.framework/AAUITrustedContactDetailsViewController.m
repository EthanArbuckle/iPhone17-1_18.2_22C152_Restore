@interface AAUITrustedContactDetailsViewController
- (AAUITrustedContactDetailsViewController)initWithContact:(id)a3 viewModel:(id)a4 actionHandler:(id)a5;
- (id)_bigContactSpecifier;
- (id)_destructiveActionRowSpecifier;
- (id)_detailsRowSpecifier;
- (id)_optionsGroupSpecifier;
- (id)_primaryActionRowSpecifier;
- (id)_secondaryActionRowSpecifier;
- (id)specifiers;
- (void)_doDestructiveAction:(id)a3;
- (void)_doPrimaryAction:(id)a3;
- (void)_doSecondaryAction:(id)a3;
- (void)_showDestructiveAlert:(id)a3;
@end

@implementation AAUITrustedContactDetailsViewController

- (AAUITrustedContactDetailsViewController)initWithContact:(id)a3 viewModel:(id)a4 actionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AAUITrustedContactDetailsViewController;
  v12 = [(AAUITrustedContactDetailsViewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_viewModel, a4);
    objc_storeStrong((id *)&v13->_actionHandler, a5);
  }

  return v13;
}

- (id)specifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Loading Trusted Contact details specifiers.", (uint8_t *)&v21, 2u);
    }

    v5 = objc_opt_new();
    v6 = [(AAUITrustedContactDetailsViewController *)self _bigContactSpecifier];
    [v5 addObject:v6];

    v7 = [(AAUITrustedContactDetailsViewController *)self _optionsGroupSpecifier];
    [v5 addObject:v7];

    v8 = [(AAUITrustedContactDetailsViewController *)self _detailsRowSpecifier];
    [v5 addObject:v8];

    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AATrustedContactDetailsViewModel *)self->_viewModel primaryActionText];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        id v11 = [(AAUITrustedContactDetailsViewController *)self _primaryActionRowSpecifier];
        [v5 addObject:v11];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v12 = [(AATrustedContactDetailsViewModel *)self->_viewModel secondaryActionText];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        v14 = [(AAUITrustedContactDetailsViewController *)self _secondaryActionRowSpecifier];
        [v5 addObject:v14];
      }
    }
    objc_super v15 = [(AAUITrustedContactDetailsViewController *)self _destructiveActionRowSpecifier];
    [v5 addObject:v15];

    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
  }
  v17 = _AAUILogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    int v21 = 138412290;
    uint64_t v22 = v18;
    _os_log_impl(&dword_209754000, v17, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactDetailsViewController specifiers: returning %@", (uint8_t *)&v21, 0xCu);
  }

  v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v19;
}

- (id)_bigContactSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  v4 = [(AALocalContactInfo *)self->_contact displayName];
  v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v6 = [(AALocalContactInfo *)self->_contact displayName];
  [v5 setProperty:v6 forKey:*MEMORY[0x263F602D0]];

  v7 = [(AALocalContactInfo *)self->_contact handle];
  [v5 setProperty:v7 forKey:*MEMORY[0x263F602C8]];

  v8 = objc_opt_new();
  id v9 = [v8 profilePictureForLocalContact:self->_contact];
  [v5 setProperty:v9 forKey:*MEMORY[0x263F60140]];
  [v5 setProperty:&unk_26BD70CB0 forKey:*MEMORY[0x263F602A8]];

  return v5;
}

- (id)_optionsGroupSpecifier
{
  v2 = (void *)MEMORY[0x263F5FC40];
  uint64_t v3 = [(AATrustedContactDetailsViewModel *)self->_viewModel title];
  v4 = [v2 groupSpecifierWithID:v3 name:0];

  return v4;
}

- (id)_detailsRowSpecifier
{
  uint64_t v3 = objc_opt_new();
  v4 = [(AATrustedContactDetailsViewModel *)self->_viewModel detailsLabel];
  v5 = [(AATrustedContactDetailsViewModel *)self->_viewModel detailsLabel];
  v6 = [(AATrustedContactDetailsViewModel *)self->_viewModel detailsSubtitle];
  v7 = [v3 createSubtitleTableCellWithName:v4 title:v5 subtitle:v6 image:0];

  return v7;
}

- (id)_primaryActionRowSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  v4 = [(AATrustedContactDetailsViewModel *)self->_viewModel primaryActionText];
  v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  v6 = [(AATrustedContactDetailsViewModel *)self->_viewModel primaryActionText];
  [v5 setIdentifier:v6];

  [v5 setButtonAction:sel__doPrimaryAction_];
  return v5;
}

- (id)_secondaryActionRowSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  v4 = [(AATrustedContactDetailsViewModel *)self->_viewModel secondaryActionText];
  v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  v6 = [(AATrustedContactDetailsViewModel *)self->_viewModel secondaryActionText];
  [v5 setIdentifier:v6];

  [v5 setButtonAction:sel__doSecondaryAction_];
  return v5;
}

- (id)_destructiveActionRowSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  v4 = [(AATrustedContactDetailsViewModel *)self->_viewModel destructiveActionText];
  v5 = [v3 deleteButtonSpecifierWithName:v4 target:self action:sel__showDestructiveAlert_];

  v6 = [(AATrustedContactDetailsViewModel *)self->_viewModel destructiveActionText];
  [v5 setIdentifier:v6];

  [v5 setProperty:&unk_26BD70BB0 forKey:*MEMORY[0x263F5FEF0]];
  return v5;
}

- (void)_doPrimaryAction:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(AAUITrustedContactDetailsActionHandler *)self->_actionHandler doPrimaryAction:self specifier:v4];
  }
}

- (void)_doSecondaryAction:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(AAUITrustedContactDetailsActionHandler *)self->_actionHandler doSecondaryAction:self specifier:v4];
  }
}

- (void)_showDestructiveAlert:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x263F82418];
  v6 = [(AATrustedContactDetailsViewModel *)self->_viewModel destructiveActionSheetDetails];
  v7 = [v5 alertWithTitle:0 message:v6];

  v8 = (void *)MEMORY[0x263F82400];
  id v9 = [(AATrustedContactDetailsViewModel *)self->_viewModel destructiveActionText];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke;
  v15[3] = &unk_263F93BE8;
  objc_copyWeak(&v17, &location);
  id v10 = v4;
  id v16 = v10;
  id v11 = [v8 actionWithTitle:v9 style:2 handler:v15];
  [v7 addAction:v11];

  v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = [(AATrustedContactDetailsViewModel *)self->_viewModel destructiveActionSheetCancelText];
  v14 = [v12 actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];

  [(AAUITrustedContactDetailsViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke(uint64_t a1)
{
  v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doDestructiveAction:*(void *)(a1 + 32)];
}

- (void)_doDestructiveAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

void __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Confirmed destructive action.", v1, 2u);
}

@end
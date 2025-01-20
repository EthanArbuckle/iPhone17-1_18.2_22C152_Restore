@interface DMCReauthSpecifierProvider
- (BOOL)_shouldAutoPresentReauthFlow;
- (BOOL)handleURL:(id)a3;
- (DMCEnrollmentInterface)enrollmentInterface;
- (DMCReauthSpecifierProvider)initWithAccount:(id)a3;
- (DMCReauthSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (PSListController)presenter;
- (id)_reauthSpecifier;
- (id)specifiers;
- (void)presentReauthFlow:(id)a3;
- (void)setEnrollmentInterface:(id)a3;
@end

@implementation DMCReauthSpecifierProvider

- (DMCReauthSpecifierProvider)initWithAccount:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F52E70];
  v5.receiver = self;
  v5.super_class = (Class)DMCReauthSpecifierProvider;
  return [(DMCSpecifierProvider *)&v5 initWithAccount:a3 reloadNotification:v3 isLocalNotification:0 reloadIfMissingRMAccount:0];
}

- (DMCReauthSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F52E70];
  v11.receiver = self;
  v11.super_class = (Class)DMCReauthSpecifierProvider;
  v8 = [(DMCSpecifierProvider *)&v11 initWithAccountManager:a3 reloadNotification:v7 isLocalNotification:0 reloadIfMissingRMAccount:0];
  v9 = v8;
  if (v8) {
    objc_storeWeak((id *)&v8->_presenter, v6);
  }

  return v9;
}

- (id)specifiers
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)DMCReauthSpecifierProvider;
  uint64_t v3 = [(DMCSpecifierProvider *)&v12 specifiers];

  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DMCReauthSpecifierProvider;
    uint64_t v4 = [(DMCSpecifierProvider *)&v11 specifiers];
LABEL_3:
    objc_super v5 = (void *)v4;
    goto LABEL_6;
  }
  id v6 = [(DMCSpecifierProvider *)self rmAccount];
  uint64_t v7 = objc_msgSend(v6, "dmc_bearerReauthURL");

  if (!v7)
  {
    uint64_t v4 = [(DMCSpecifierProvider *)self cachedSpecifiers:MEMORY[0x263EFFA68]];
    goto LABEL_3;
  }
  v8 = [(DMCReauthSpecifierProvider *)self _reauthSpecifier];
  v13[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  objc_super v5 = [(DMCSpecifierProvider *)self cachedSpecifiers:v9];

LABEL_6:
  return v5;
}

- (id)_reauthSpecifier
{
  uint64_t v3 = [(DMCReauthSpecifierProvider *)self presenter];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    [v4 setTarget:self];
    [v4 setButtonAction:sel_presentReauthFlow_];
    if (![(DMCSpecifierProvider *)self isReloading]
      && [(DMCReauthSpecifierProvider *)self _shouldAutoPresentReauthFlow])
    {
      objc_super v5 = [v3 specifier];
      [v5 setProperty:MEMORY[0x263EFFA80] forKey:@"PSDMCHandleReauthKey"];

      [(DMCReauthSpecifierProvider *)self presentReauthFlow:0];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F23130];
    uint64_t v7 = [(DMCSpecifierProvider *)self rmAccount];
    v8 = (void *)[v7 copy];
    uint64_t v4 = [v6 specifierWithStyle:0 account:v8 target:self controllerLoadAction:sel_presentReauthFlow_];

    [v4 setProperty:MEMORY[0x263EFFA88] forKey:@"PSDMCHandleReauthKey"];
  }
  v9 = [(DMCSpecifierProvider *)self rmAccount];
  v10 = [v9 username];
  objc_super v11 = +[DMCAccountSpecifierProvider itemSpecifierIDForReauthAccountUsername:v10];
  [v4 setIdentifier:v11];

  objc_super v12 = DMCLocalizedString();
  [v4 setName:v12];

  [v4 setCellType:1];
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  [v4 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v4 setProperty:&unk_26D44B128 forKey:*MEMORY[0x263F5FF18]];

  return v4;
}

- (void)presentReauthFlow:(id)a3
{
  uint64_t v4 = [(DMCReauthSpecifierProvider *)self presenter];
  if (v4)
  {
    if (!self->_enrollmentInterface)
    {
      objc_super v5 = [DMCEnrollmentInterface alloc];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__DMCReauthSpecifierProvider_presentReauthFlow___block_invoke;
      v11[3] = &unk_2645E95F0;
      v11[4] = self;
      id v6 = [(DMCEnrollmentInterface *)v5 initFromViewController:v4 enrollmentResultBlock:v11];
      enrollmentInterface = self->_enrollmentInterface;
      self->_enrollmentInterface = v6;
    }
    v8 = [(DMCReauthSpecifierProvider *)self enrollmentInterface];
    v9 = [(DMCSpecifierProvider *)self rmAccount];
    v10 = [v9 identifier];
    [v8 startReauthWithRMAccountID:v10];
  }
}

id __48__DMCReauthSpecifierProvider_presentReauthFlow___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DMCReauthSpecifierProvider;
  return objc_msgSendSuper2(&v2, sel_reloadSpecifiers);
}

- (BOOL)_shouldAutoPresentReauthFlow
{
  objc_super v2 = [(DMCReauthSpecifierProvider *)self presenter];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 specifier];
    objc_super v5 = [v4 propertyForKey:@"PSDMCHandleReauthKey"];

    if (v5) {
      char v6 = [v5 BOOLValue];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)handleURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(DMCSpecifierProvider *)self rmAccount];
    char v6 = [v5 username];

    if (v6)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"path"];
      v8 = [(DMCSpecifierProvider *)self rmAccount];
      v9 = [v8 username];
      v10 = +[DMCAccountSpecifierProvider itemSpecifierIDForReauthAccountUsername:v9];
      LODWORD(v6) = [v7 containsString:v10];

      if (v6) {
        [(DMCReauthSpecifierProvider *)self presentReauthFlow:0];
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (PSListController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (PSListController *)WeakRetained;
}

- (DMCEnrollmentInterface)enrollmentInterface
{
  return self->_enrollmentInterface;
}

- (void)setEnrollmentInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInterface, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end
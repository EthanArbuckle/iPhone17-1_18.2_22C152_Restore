@interface RMAccountDetailsViewController
- (ACAccount)account;
- (id)_specifiersForAccount;
- (id)accountDescription:(id)a3;
- (id)accountEmail:(id)a3;
- (id)specifiers;
- (void)_processUserInfoDictionary;
- (void)cancelButtonTapped:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)setAccount:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RMAccountDetailsViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMAccountDetailsViewController;
  [(RMAccountDetailsViewController *)&v4 viewWillAppear:a3];
  if (([(RMAccountDetailsViewController *)self isMovingToParentViewController] & 1) == 0) {
    [(RMAccountDetailsViewController *)self reloadSpecifiers];
  }
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)doneButtonTapped:(id)a3
{
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    [(RMAccountDetailsViewController *)self _processUserInfoDictionary];
    v5 = [(RMAccountDetailsViewController *)self _specifiersForAccount];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_processUserInfoDictionary
{
  uint64_t v3 = [(RMAccountDetailsViewController *)self account];

  if (!v3)
  {
    id v9 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
    objc_super v4 = [v9 objectForKeyedSubscript:*MEMORY[0x263F23118]];
    [(RMAccountDetailsViewController *)self setAccount:v4];

    v5 = [(RMAccountDetailsViewController *)self account];

    if (!v5)
    {
      v6 = [v9 objectForKeyedSubscript:*MEMORY[0x263F23110]];
      v7 = [(ACUIViewController *)self accountStore];
      v8 = [v7 accountWithIdentifier:v6];
      [(RMAccountDetailsViewController *)self setAccount:v8];
    }
  }
}

- (id)_specifiersForAccount
{
  v17[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ACCOUNT_INFO"];
  objc_super v4 = (void *)MEMORY[0x263F5FC40];
  v5 = DMCLocalizedString();
  v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:sel_accountEmail_ detail:0 cell:4 edit:0];

  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = DMCLocalizedString();
  id v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:sel_accountDescription_ detail:0 cell:4 edit:0];

  v10 = DMCLocalizedString();
  v11 = [(RMAccountDetailsViewController *)self account];
  v12 = objc_msgSend(v11, "dmc_enrollmentToken");
  v13 = +[RMDeviceIDCell specifierWithTitle:v10 value:v12];

  v17[0] = v3;
  v17[1] = v6;
  v17[2] = v9;
  v14 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v17[3] = v14;
  v17[4] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];

  return v15;
}

- (id)accountEmail:(id)a3
{
  uint64_t v3 = [(RMAccountDetailsViewController *)self account];
  objc_super v4 = [v3 username];

  return v4;
}

- (id)accountDescription:(id)a3
{
  uint64_t v3 = [(RMAccountDetailsViewController *)self account];
  objc_super v4 = [v3 accountDescription];

  return v4;
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
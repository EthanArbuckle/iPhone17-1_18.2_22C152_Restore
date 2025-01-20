@interface DMCAccountSpecifierProvider
+ (id)groupSpecifierID;
+ (id)itemSpecifierIDForAccountUsername:(id)a3;
+ (id)itemSpecifierIDForReauthAccountUsername:(id)a3;
+ (id)itemSpecifierIDPrefix;
- (DMCAccountSpecifierProvider)init;
- (DMCAccountSpecifierProvider)initWithAccountStore:(id)a3;
- (DMCAccountSpecifierProviderDelegate)delegate;
- (DMCSecondaryAccountViewModelDelegate)viewModelDelegate;
- (id)_reauthSpecifierForAccount:(id)a3;
- (id)_specifierForManagedAccount:(id)a3;
- (id)_specifierForManagedAccountGroupWithTitle:(BOOL)a3 plural:(BOOL)a4;
- (id)secondaryAccountViewModels;
- (id)specifiersWithTitle:(BOOL)a3 includePrimaryAccounts:(BOOL)a4;
- (void)_accountCellWasTappedWithSpecifier:(id)a3;
- (void)appleAccountsDidChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setViewModelDelegate:(id)a3;
- (void)specifiersWithCompletion:(id)a3;
@end

@implementation DMCAccountSpecifierProvider

- (void)setViewModelDelegate:(id)a3
{
}

- (DMCAccountSpecifierProvider)init
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = [(DMCAccountSpecifierProvider *)self initWithAccountStore:v3];

  return v4;
}

- (DMCAccountSpecifierProvider)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMCAccountSpecifierProvider;
  v6 = [(DMCAccountSpecifierProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_appleAccountsDidChange_ name:*MEMORY[0x263EFB060] object:0];
  }
  return v7;
}

- (id)secondaryAccountViewModels
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(ACAccountStore *)self->_accountStore dmc_visibleSecondaryRemoteManagementAccounts];
  if ([v3 count])
  {
    v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v23 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      uint64_t v8 = *MEMORY[0x263F5FF18];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(obj);
          }
          objc_super v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v11 = objc_opt_new();
          [v11 setAccount:v10];
          v12 = [v10 username];
          v13 = +[DMCAccountSpecifierProvider itemSpecifierIDForAccountUsername:v12];
          [v11 setIdentifier:v13];

          v14 = [v10 accountDescription];
          [v11 setTitle:v14];

          v15 = [v10 username];
          [v11 setSubtitle:v15];

          v16 = +[DMCIconFactory lanyardCardIcon];
          [v11 setIcon:v16];

          v17 = [(DMCAccountSpecifierProvider *)self _reauthSpecifierForAccount:v10];
          v18 = v17;
          if (v17)
          {
            v19 = [v17 identifier];
            [v11 setReauthIdentifer:v19];

            v20 = [v18 name];
            [v11 setReauthTitle:v20];

            v21 = [v18 objectForKeyedSubscript:v8];
            [v11 setReauthBadgeNumber:v21];
          }
          objc_msgSend(v4, "addObject:", v11, v23);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }

    v3 = v23;
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMCAccountSpecifierProvider;
  [(DMCAccountSpecifierProvider *)&v4 dealloc];
}

- (void)appleAccountsDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadAccountSpecifiersForProvider:self];

  id v5 = objc_loadWeakRetained((id *)&self->_viewModelDelegate);
  [v5 secondaryAccountViewModelsDidChange];
}

+ (id)groupSpecifierID
{
  return (id)*MEMORY[0x263F52EB0];
}

+ (id)itemSpecifierIDPrefix
{
  return (id)[NSString stringWithFormat:@"%@:", *MEMORY[0x263F52EA8]];
}

+ (id)itemSpecifierIDForAccountUsername:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[DMCAccountSpecifierProvider itemSpecifierIDPrefix];
  id v5 = [v4 stringByAppendingString:v3];

  return v5;
}

+ (id)itemSpecifierIDForReauthAccountUsername:(id)a3
{
  id v3 = NSString;
  objc_super v4 = +[DMCAccountSpecifierProvider itemSpecifierIDForAccountUsername:a3];
  id v5 = [v3 stringWithFormat:@"%@:%@", v4, *MEMORY[0x263F52EC8]];

  return v5;
}

- (void)specifiersWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_updateQueue)
  {
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.devicemanagementclient.secondaryAccountUpdate", 0);
    updateQueue = self->_updateQueue;
    self->_updateQueue = v5;
  }
  objc_initWeak(&location, self);
  uint64_t v7 = self->_updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DMCAccountSpecifierProvider_specifiersWithCompletion___block_invoke;
  block[3] = &unk_2645E8E88;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__DMCAccountSpecifierProvider_specifiersWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained specifiersWithTitle:0 includePrimaryAccounts:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, MEMORY[0x263EFFA68]);
  }
}

- (id)specifiersWithTitle:(BOOL)a3 includePrimaryAccounts:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  accountStore = self->_accountStore;
  if (a4) {
    [(ACAccountStore *)accountStore dmc_visibleRemoteManagementAccounts];
  }
  else {
  uint64_t v7 = [(ACAccountStore *)accountStore dmc_visibleSecondaryRemoteManagementAccounts];
  }
  if ([v7 count])
  {
    id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
    v9 = -[DMCAccountSpecifierProvider _specifierForManagedAccountGroupWithTitle:plural:](self, "_specifierForManagedAccountGroupWithTitle:plural:", v4, (unint64_t)[v7 count] > 1);
    [v8 addObject:v9];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v16 = -[DMCAccountSpecifierProvider _specifierForManagedAccount:](self, "_specifierForManagedAccount:", v15, (void)v19);
          [v8 addObject:v16];

          v17 = [(DMCAccountSpecifierProvider *)self _reauthSpecifierForAccount:v15];
          if (v17) {
            [v8 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)_specifierForManagedAccountGroupWithTitle:(BOOL)a3 plural:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = DMCLocalizedString();
    id v5 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v4];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x263F5FC40], "emptyGroupSpecifier", a3, a4);
  }
  uint64_t v6 = +[DMCAccountSpecifierProvider groupSpecifierID];
  [v5 setIdentifier:v6];

  return v5;
}

- (id)_specifierForManagedAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[DMCEnrollmentInterface preferredViewControllerClassForAccount:v3 preferiCloudAccount:1];
  id v5 = (void *)MEMORY[0x263F23130];
  uint64_t v6 = (void *)[v3 copy];
  uint64_t v7 = [v5 specifierWithStyle:3 account:v6 detailControllerClass:v4 presentationStyle:1];

  id v8 = [v3 username];
  v9 = +[DMCAccountSpecifierProvider itemSpecifierIDForAccountUsername:v8];
  [v7 setIdentifier:v9];

  id v10 = [v3 accountDescription];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F602D0]];

  uint64_t v11 = [v3 username];

  [v7 setProperty:v11 forKey:*MEMORY[0x263F602C8]];
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v12 = +[DMCIconFactory lanyardCardIcon];
  [v7 setProperty:v12 forKey:*MEMORY[0x263F60140]];

  return v7;
}

- (id)_reauthSpecifierForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [[DMCReauthSpecifierProvider alloc] initWithAccount:v4];

  uint64_t v6 = [(DMCReauthSpecifierProvider *)v5 specifiers];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    [v7 setTarget:self];
    [v7 setButtonAction:sel__accountCellWasTappedWithSpecifier_];
    id v8 = v7;
  }

  return v7;
}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCAccountSpecifierProvider *)self delegate];
  [v5 accountCellWasTapped:v4];
}

- (DMCAccountSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCAccountSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMCSecondaryAccountViewModelDelegate)viewModelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModelDelegate);
  return (DMCSecondaryAccountViewModelDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewModelDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
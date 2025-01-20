@interface DMCSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ACAccount)rmAccount;
- (AIDAAccountManager)accountManager;
- (BOOL)isReloading;
- (DMCSpecifierProvider)initWithAccount:(id)a3 reloadNotification:(id)a4 isLocalNotification:(BOOL)a5 reloadIfMissingRMAccount:(BOOL)a6;
- (DMCSpecifierProvider)initWithAccountManager:(id)a3;
- (DMCSpecifierProvider)initWithAccountManager:(id)a3 reloadNotification:(id)a4 isLocalNotification:(BOOL)a5 reloadIfMissingRMAccount:(BOOL)a6;
- (NSArray)specifiers;
- (id)cachedSpecifiers:(id)a3;
- (id)cellForSpecifier:(id)a3 inTableView:(id)a4;
- (id)specifiersReloadedNotificationName;
- (id)tableCellsForSpecifiersInTableView:(id)a3;
- (void)_listenForNotification:(id)a3 isLocalNotification:(BOOL)a4;
- (void)dealloc;
- (void)registerSpecifierBridgeForTableView:(id)a3;
- (void)reloadSpecifiers;
- (void)setDelegate:(id)a3;
- (void)setIsReloading:(BOOL)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation DMCSpecifierProvider

- (DMCSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(DMCSpecifierProvider *)self initWithAccountManager:a3 reloadNotification:0 isLocalNotification:1 reloadIfMissingRMAccount:0];
}

- (DMCSpecifierProvider)initWithAccountManager:(id)a3 reloadNotification:(id)a4 isLocalNotification:(BOOL)a5 reloadIfMissingRMAccount:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  v13 = objc_msgSend(v11, "dmc_remoteManagementAccount");
  v14 = [(DMCSpecifierProvider *)self initWithAccount:v13 reloadNotification:v12 isLocalNotification:v7 reloadIfMissingRMAccount:v6];

  if (v14) {
    objc_storeStrong((id *)&v14->_accountManager, a3);
  }

  return v14;
}

- (DMCSpecifierProvider)initWithAccount:(id)a3 reloadNotification:(id)a4 isLocalNotification:(BOOL)a5 reloadIfMissingRMAccount:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DMCSpecifierProvider;
  v13 = [(DMCSpecifierProvider *)&v15 init];
  if (v13)
  {
    if (objc_msgSend(v11, "dmc_isVisibleRemoteManagementAccount"))
    {
      objc_storeStrong((id *)&v13->_rmAccount, a3);
      if (!v12) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    if (v12 && v6) {
LABEL_7:
    }
      [(DMCSpecifierProvider *)v13 _listenForNotification:v12 isLocalNotification:v7];
  }
LABEL_8:

  return v13;
}

- (void)_listenForNotification:(id)a3 isLocalNotification:(BOOL)a4
{
  v5 = (void **)0x263F08A00;
  if (!a4) {
    v5 = (void **)0x263F087C8;
  }
  BOOL v6 = *v5;
  id v7 = a3;
  id v8 = [v6 defaultCenter];
  [v8 addObserver:self selector:sel_reloadNotificationPosted_ name:v7 object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)DMCSpecifierProvider;
  [(DMCSpecifierProvider *)&v5 dealloc];
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (id)cachedSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_specifiers, a3);
  id v5 = a3;
  BOOL v6 = self->_specifiers;

  return v6;
}

- (void)reloadSpecifiers
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__DMCSpecifierProvider_reloadSpecifiers__block_invoke;
  v2[3] = &unk_2645E9398;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__DMCSpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [WeakRetained rmAccount];
    [v1 refresh];

    v2 = (void *)[WeakRetained[2] copy];
    id v3 = WeakRetained[2];
    WeakRetained[2] = 0;

    v4 = [WeakRetained specifiersReloadedNotificationName];

    if (v4)
    {
      id v5 = [MEMORY[0x263F08A00] defaultCenter];
      BOOL v6 = [WeakRetained specifiersReloadedNotificationName];
      [v5 postNotificationName:v6 object:0 userInfo:0];
    }
    [WeakRetained setIsReloading:1];
    id v7 = [WeakRetained delegate];
    [v7 reloadSpecifiersForProvider:WeakRetained oldSpecifiers:v2 animated:1];

    [WeakRetained setIsReloading:0];
  }
}

- (void)registerSpecifierBridgeForTableView:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kDMCSpecifierTableCellIdentifier"];
}

- (id)tableCellsForSpecifiersInTableView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DMCSpecifierProvider *)self specifiers];

  if (v5)
  {
    BOOL v6 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(DMCSpecifierProvider *)self specifiers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [(DMCSpecifierProvider *)self cellForSpecifier:*(void *)(*((void *)&v14 + 1) + 8 * i) inTableView:v4];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (id)cellForSpecifier:(id)a3 inTableView:(id)a4
{
  id v5 = a3;
  BOOL v6 = [a4 dequeueReusableCellWithIdentifier:@"kDMCSpecifierTableCellIdentifier"];
  id v7 = [MEMORY[0x263F1C780] valueCellConfiguration];
  uint64_t v8 = [v5 name];
  [v7 setText:v8];

  if ([v5 hasValidGetter])
  {
    uint64_t v9 = [v5 performGetter];
    [v7 setSecondaryText:v9];
  }
  uint64_t v10 = *MEMORY[0x263F60140];
  id v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F60140]];

  if (v11)
  {
    id v12 = [v5 objectForKeyedSubscript:v10];
    [v7 setImage:v12];
  }
  uint64_t v13 = *MEMORY[0x263F600A8];
  long long v14 = [v5 objectForKeyedSubscript:*MEMORY[0x263F600A8]];

  if (v14)
  {
    long long v15 = [v5 objectForKeyedSubscript:v13];
    [v6 setUserInteractionEnabled:v15 != 0];
  }
  if ([v5 cellType] == 15)
  {
    long long v16 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [v16 startAnimating];
    [v6 setBackgroundView:v16];
  }
  else
  {
    [v6 setAccessoryType:1];
  }
  [v6 setContentConfiguration:v7];
  [v5 detailControllerClass];
  long long v17 = objc_opt_new();
  [v6 setDetailViewController:v17];

  v18 = [v6 detailViewController];
  [v18 setSpecifier:v5];

  return v6;
}

- (id)specifiersReloadedNotificationName
{
  return 0;
}

- (void)setSpecifiers:(id)a3
{
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (ACAccount)rmAccount
{
  return self->_rmAccount;
}

- (BOOL)isReloading
{
  return self->_isReloading;
}

- (void)setIsReloading:(BOOL)a3
{
  self->_isReloading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
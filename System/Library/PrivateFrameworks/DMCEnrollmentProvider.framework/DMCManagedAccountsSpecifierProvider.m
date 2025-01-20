@interface DMCManagedAccountsSpecifierProvider
- (BOOL)isReloadingManagedAccounts;
- (DMCManagedAccountsSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)managedAccounts;
- (id)specifiers;
- (void)_accountCellWasTappedWithSpecifier:(id)a3;
- (void)_reloadManagedAccounts;
- (void)setIsReloadingManagedAccounts:(BOOL)a3;
- (void)setManagedAccounts:(id)a3;
@end

@implementation DMCManagedAccountsSpecifierProvider

- (DMCManagedAccountsSpecifierProvider)initWithAccountManager:(id)a3
{
  uint64_t v3 = *MEMORY[0x263EFB060];
  v5.receiver = self;
  v5.super_class = (Class)DMCManagedAccountsSpecifierProvider;
  return [(DMCSpecifierProvider *)&v5 initWithAccountManager:a3 reloadNotification:v3 isLocalNotification:1 reloadIfMissingRMAccount:0];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)DMCManagedAccountsSpecifierProvider;
  uint64_t v3 = [(DMCSpecifierProvider *)&v32 specifiers];

  if (v3)
  {
    v31.receiver = v2;
    v31.super_class = (Class)DMCManagedAccountsSpecifierProvider;
    uint64_t v4 = [(DMCSpecifierProvider *)&v31 specifiers];
LABEL_3:
    objc_super v5 = (void *)v4;
    goto LABEL_4;
  }
  v7 = [(DMCSpecifierProvider *)v2 rmAccount];

  if (!v7)
  {
    uint64_t v4 = [(DMCSpecifierProvider *)v2 cachedSpecifiers:MEMORY[0x263EFFA68]];
    goto LABEL_3;
  }
  v8 = [(DMCManagedAccountsSpecifierProvider *)v2 managedAccounts];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    v10 = [(DMCManagedAccountsSpecifierProvider *)v2 managedAccounts];
    v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count") + 1);

    v12 = [(DMCManagedAccountsSpecifierProvider *)v2 managedAccounts];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = v11;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v15 = v2;
      id obj = [(DMCManagedAccountsSpecifierProvider *)v2 managedAccounts];
      uint64_t v16 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        uint64_t v19 = *MEMORY[0x263F60140];
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(obj);
            }
            v21 = (void *)MEMORY[0x263F23130];
            v22 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copy];
            v23 = [v21 specifierWithStyle:3 account:v22 target:v15 controllerLoadAction:sel__accountCellWasTappedWithSpecifier_];

            if (v23)
            {
              v24 = +[DMCIconFactory accountIcon];
              [v23 setProperty:v24 forKey:v19];

              [v14 addObject:v23];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v17);
      }

      v11 = v14;
      v2 = v15;
    }
    if ([v11 count])
    {
      v25 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v11 insertObject:v25 atIndex:0];
    }
    objc_super v5 = [(DMCSpecifierProvider *)v2 cachedSpecifiers:v11];
  }
  else
  {
    if (![(DMCManagedAccountsSpecifierProvider *)v2 isReloadingManagedAccounts])
    {
      [(DMCManagedAccountsSpecifierProvider *)v2 setIsReloadingManagedAccounts:1];
      [(DMCManagedAccountsSpecifierProvider *)v2 _reloadManagedAccounts];
    }
    objc_super v5 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_4:
  return v5;
}

- (void)_reloadManagedAccounts
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v3 = ACUIVisibleAccountTypes();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke;
  v4[3] = &unk_2645E9758;
  objc_copyWeak(&v5, &location);
  [v2 visibleTopLevelAccountsWithAccountTypeIdentifiers:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id val = WeakRetained;
    id v21 = v3;
    v22 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      uint64_t v10 = *MEMORY[0x263EFADF0];
      uint64_t v23 = *MEMORY[0x263EFAE58];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = [v12 objectForKeyedSubscript:v10];
          if (v13)
          {
            v14 = [val rmAccount];
            v15 = [v14 identifier];
            int v16 = [v13 isEqualToString:v15];

            if (v16)
            {
              uint64_t v17 = [v12 accountType];
              uint64_t v18 = [v17 identifier];
              char v19 = [v18 isEqualToString:v23];

              if ((v19 & 1) == 0) {
                [v22 addObject:v12];
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v8);
    }

    id v5 = val;
    objc_initWeak(&location, val);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke_2;
    block[3] = &unk_2645E9480;
    objc_copyWeak(&v27, &location);
    id v26 = v22;
    id v20 = v22;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    id v3 = v21;
  }
}

void __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (void *)[*(id *)(a1 + 32) copy];
    [WeakRetained setManagedAccounts:v2];

    [WeakRetained setIsReloadingManagedAccounts:0];
    [WeakRetained reloadSpecifiers];
  }
}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  id v5 = +[DMCEnrollmentInterface accountControllerFromSpecifier:a3 baseViewController:0 preferiCloudAccount:0];
  uint64_t v4 = [(DMCSpecifierProvider *)self delegate];
  [v4 specifierProvider:self showViewController:v5];
}

- (NSArray)managedAccounts
{
  return self->_managedAccounts;
}

- (void)setManagedAccounts:(id)a3
{
}

- (BOOL)isReloadingManagedAccounts
{
  return self->_isReloadingManagedAccounts;
}

- (void)setIsReloadingManagedAccounts:(BOOL)a3
{
  self->_isReloadingManagedAccounts = a3;
}

- (void).cxx_destruct
{
}

@end
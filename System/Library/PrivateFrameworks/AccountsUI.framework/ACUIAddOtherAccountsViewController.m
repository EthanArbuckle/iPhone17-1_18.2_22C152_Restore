@interface ACUIAddOtherAccountsViewController
- (id)_specifiersForOtherCalendarAccounts;
- (id)_specifiersForOtherContactsAccounts;
- (id)_specifiersForOtherMailAccounts;
- (id)specifiers;
@end

@implementation ACUIAddOtherAccountsViewController

- (id)specifiers
{
  v11 = self;
  v10[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]))
  {
    v10[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = v10[0];
    id v5 = [(ACUIAddOtherAccountsViewController *)v11 _specifiersForOtherMailAccounts];
    objc_msgSend(v4, "addObjectsFromArray:");

    id v6 = v10[0];
    id v7 = [(ACUIAddOtherAccountsViewController *)v11 _specifiersForOtherContactsAccounts];
    objc_msgSend(v6, "addObjectsFromArray:");

    id v8 = v10[0];
    id v9 = [(ACUIAddOtherAccountsViewController *)v11 _specifiersForOtherCalendarAccounts];
    objc_msgSend(v8, "addObjectsFromArray:");

    objc_storeStrong((id *)((char *)&v11->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), v10[0]);
    objc_storeStrong(v10, 0);
  }
  v2 = *(Class *)((char *)&v11->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  return v2;
}

- (id)_specifiersForOtherMailAccounts
{
  v26 = self;
  v25[1] = (id)a2;
  v25[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v24 = 1;
  v20 = [(ACUIAddAccountViewController *)v26 filteredDataclass];

  if (v20)
  {
    v18 = [(ACUIAddAccountViewController *)v26 filteredDataclass];
    BOOL v2 = [(NSString *)v18 isEqualToString:*MEMORY[0x1E4F17AD8]];
    char v22 = 0;
    char v19 = 1;
    if (!v2)
    {
      v23 = [(ACUIAddAccountViewController *)v26 filteredDataclass];
      char v22 = 1;
      char v19 = [(NSString *)v23 isEqualToString:*MEMORY[0x1E4F17B00]];
    }
    char v24 = v19 & 1;
    if (v22) {
  }
    }
  if (v24)
  {
    v16 = [(ACUIAddAccountViewController *)v26 addAccountDataSource];
    uint64_t v14 = *MEMORY[0x1E4F177E8];
    v15 = [(ACUIAddAccountViewController *)v26 viewProvidersManager];
    uint64_t v17 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v16, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v14);

    if (v17)
    {
      id v5 = (void *)MEMORY[0x1E4F92E70];
      id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"MAIL_LABEL");
      id v6 = (id)objc_msgSend(v5, "groupSpecifierWithName:");
      objc_msgSend(v25[0], "addObject:");

      id v9 = (void *)MEMORY[0x1E4F92E70];
      id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v11 = (id)[v12 localizedStringForKey:@"ADD_OTHER_MAIL_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
      v10 = [(ACUIAddAccountViewController *)v26 addAccountDataSource];
      id v21 = (id)objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v26, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v10, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

      [v21 setButtonAction:sel__addAccountSpecifierWasTapped_];
      [v21 setProperty:*MEMORY[0x1E4F177E8] forKey:@"ACUIAccountType"];
      v13 = [(ACUIAddAccountViewController *)v26 addAccountDataSource];
      [(ACUIAddAccountDataSource *)v13 configureSpecifierForOtherAccountSpecifier:v21];

      [v25[0] addObject:v21];
      objc_storeStrong(&v21, 0);
    }
  }
  id v4 = v25[0];
  objc_storeStrong(v25, 0);
  return v4;
}

- (id)_specifiersForOtherContactsAccounts
{
  v35 = self;
  v34[1] = (id)a2;
  v34[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v33 = 1;
  v28 = [(ACUIAddAccountViewController *)v35 filteredDataclass];

  if (v28)
  {
    v27 = [(ACUIAddAccountViewController *)v35 filteredDataclass];
    char v33 = [(NSString *)v27 isEqualToString:*MEMORY[0x1E4F17A90]];
  }
  if (v33)
  {
    BOOL v32 = 0;
    id v21 = [(ACUIAddAccountViewController *)v35 addAccountDataSource];
    uint64_t v19 = *MEMORY[0x1E4F17818];
    v20 = [(ACUIAddAccountViewController *)v35 viewProvidersManager];
    BOOL v22 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v21, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v19) != 0;

    BOOL v32 = v22;
    BOOL v31 = 0;
    v25 = [(ACUIAddAccountViewController *)v35 addAccountDataSource];
    uint64_t v23 = *MEMORY[0x1E4F17778];
    char v24 = [(ACUIAddAccountViewController *)v35 viewProvidersManager];
    BOOL v26 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v25, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v23) != 0;

    BOOL v31 = v26;
    if (v22 || v31)
    {
      v15 = (void *)MEMORY[0x1E4F92E70];
      id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v18 localizedStringForKey:@"CONTACTS_LABEL" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v16 = (id)objc_msgSend(v15, "groupSpecifierWithName:");
      objc_msgSend(v34[0], "addObject:");

      if (v32)
      {
        v10 = (void *)MEMORY[0x1E4F92E70];
        id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v12 = (id)[v13 localizedStringForKey:@"ADD_LDAP_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v11 = [(ACUIAddAccountViewController *)v35 addAccountDataSource];
        id v30 = (id)objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, v35, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v11, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        [v30 setButtonAction:sel__addAccountSpecifierWasTapped_];
        [v30 setProperty:*MEMORY[0x1E4F17818] forKey:@"ACUIAccountType"];
        uint64_t v14 = [(ACUIAddAccountViewController *)v35 addAccountDataSource];
        [(ACUIAddAccountDataSource *)v14 configureSpecifierForOtherAccountSpecifier:v30];

        [v34[0] addObject:v30];
        objc_storeStrong(&v30, 0);
      }
      if (v31)
      {
        id v5 = (void *)MEMORY[0x1E4F92E70];
        id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v7 = (id)[v8 localizedStringForKey:@"ADD_CARDDAV_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v4 = v35;
        id v6 = [(ACUIAddAccountViewController *)v35 addAccountDataSource];
        id v29 = (id)objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v4, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v6, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        [v29 setButtonAction:sel__addAccountSpecifierWasTapped_];
        [v29 setProperty:*MEMORY[0x1E4F17778] forKey:@"ACUIAccountType"];
        id v9 = [(ACUIAddAccountViewController *)v35 addAccountDataSource];
        [(ACUIAddAccountDataSource *)v9 configureSpecifierForOtherAccountSpecifier:v29];

        [v34[0] addObject:v29];
        objc_storeStrong(&v29, 0);
      }
    }
  }
  id v3 = v34[0];
  objc_storeStrong(v34, 0);
  return v3;
}

- (id)_specifiersForOtherCalendarAccounts
{
  v39 = self;
  v38[1] = (id)a2;
  v38[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v37 = 1;
  id v30 = [(ACUIAddAccountViewController *)v39 filteredDataclass];

  if (v30)
  {
    v28 = [(ACUIAddAccountViewController *)v39 filteredDataclass];
    BOOL v2 = [(NSString *)v28 isEqualToString:*MEMORY[0x1E4F17A80]];
    char v35 = 0;
    char v29 = 1;
    if (!v2)
    {
      v36 = [(ACUIAddAccountViewController *)v39 filteredDataclass];
      char v35 = 1;
      char v29 = [(NSString *)v36 isEqualToString:*MEMORY[0x1E4F17B08]];
    }
    char v37 = v29 & 1;
    if (v35) {
  }
    }
  if (v37)
  {
    BOOL v34 = 0;
    BOOL v22 = [(ACUIAddAccountViewController *)v39 addAccountDataSource];
    uint64_t v20 = *MEMORY[0x1E4F17770];
    id v21 = [(ACUIAddAccountViewController *)v39 viewProvidersManager];
    BOOL v23 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v22, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v20) != 0;

    BOOL v34 = v23;
    BOOL v33 = 0;
    BOOL v26 = [(ACUIAddAccountViewController *)v39 addAccountDataSource];
    uint64_t v24 = *MEMORY[0x1E4F17858];
    v25 = [(ACUIAddAccountViewController *)v39 viewProvidersManager];
    BOOL v27 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v26, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v24) != 0;

    BOOL v33 = v27;
    if (v23 || v33)
    {
      id v16 = (void *)MEMORY[0x1E4F92E70];
      id v19 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v18 = (id)[v19 localizedStringForKey:@"CALENDARS_LABEL" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v17 = (id)objc_msgSend(v16, "groupSpecifierWithName:");
      objc_msgSend(v38[0], "addObject:");

      if (v34)
      {
        id v11 = (void *)MEMORY[0x1E4F92E70];
        id v14 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v13 = (id)[v14 localizedStringForKey:@"ADD_CALDAV_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v12 = [(ACUIAddAccountViewController *)v39 addAccountDataSource];
        id v32 = (id)objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, v39, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v12, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        [v32 setButtonAction:sel__addAccountSpecifierWasTapped_];
        [v32 setProperty:*MEMORY[0x1E4F17770] forKey:@"ACUIAccountType"];
        v15 = [(ACUIAddAccountViewController *)v39 addAccountDataSource];
        [(ACUIAddAccountDataSource *)v15 configureSpecifierForOtherAccountSpecifier:v32];

        [v38[0] addObject:v32];
        objc_storeStrong(&v32, 0);
      }
      if (v33)
      {
        id v6 = (void *)MEMORY[0x1E4F92E70];
        id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v8 = (id)[v9 localizedStringForKey:@"ADD_SUBCAL_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v5 = v39;
        id v7 = [(ACUIAddAccountViewController *)v39 addAccountDataSource];
        id v31 = (id)objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v5, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v7, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        [v31 setButtonAction:sel__addAccountSpecifierWasTapped_];
        [v31 setProperty:*MEMORY[0x1E4F17858] forKey:@"ACUIAccountType"];
        v10 = [(ACUIAddAccountViewController *)v39 addAccountDataSource];
        [(ACUIAddAccountDataSource *)v10 configureSpecifierForOtherAccountSpecifier:v31];

        [v38[0] addObject:v31];
        objc_storeStrong(&v31, 0);
      }
    }
  }
  id v4 = v38[0];
  objc_storeStrong(v38, 0);
  return v4;
}

@end
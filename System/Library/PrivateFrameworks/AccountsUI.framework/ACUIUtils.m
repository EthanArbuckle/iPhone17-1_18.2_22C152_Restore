@interface ACUIUtils
+ (id)_accountGroupIdentifier:(id)a3 ignoringGroups:(id)a4;
+ (id)sortedAccountsFromAccounts:(id)a3;
+ (id)sortedDataclassesFrom:(id)a3;
+ (void)emitNavigationEventForSubPane:(id)a3 subPath:(id)a4 account:(id)a5 inHostAppBundleID:(id)a6;
+ (void)filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6;
@end

@implementation ACUIUtils

+ (void)filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v28 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  memset(__b, 0, sizeof(__b));
  id v18 = location[0];
  uint64_t v19 = [v18 countByEnumeratingWithState:__b objects:v29 count:16];
  if (v19)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v19;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void *)(__b[1] + 8 * v13);
      id v21 = (id)[v28 _accountGroupIdentifier:v23 ignoringGroups:v24];
      if (v21)
      {
        id v10 = (id)[v25 objectForKey:v21];
        id v20 = (id)[v10 mutableCopy];

        if (!v20)
        {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v7 = v20;
          id v20 = v6;
        }
        [v20 addObject:v23];
        id v8 = v25;
        id v9 = (id)[v20 copy];
        objc_msgSend(v8, "setObject:forKey:");

        objc_storeStrong(&v20, 0);
      }
      else
      {
        [v26 addObject:v23];
      }
      objc_storeStrong(&v21, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [v18 countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

+ (id)_accountGroupIdentifier:(id)a3 ignoringGroups:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v8 = (id)[location[0] accountType];
  id v7 = (id)[v8 identifier];
  char v9 = [v7 isEqualToString:*MEMORY[0x1E4F17858]];

  if (v9 & 1) == 0 || ([v10 containsObject:*MEMORY[0x1E4F17858]]) {
    id v12 = 0;
  }
  else {
    id v12 = (id)*MEMORY[0x1E4F17858];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  v4 = v12;
  return v4;
}

+ (id)sortedAccountsFromAccounts:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = ACUISortedAccountTypes();
  id v4 = location[0];
  id v6 = v8;
  id v7 = (id)objc_msgSend(v4, "sortedArrayUsingComparator:");
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __40__ACUIUtils_sortedAccountsFromAccounts___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = (id)[location[0] accountType];
    v13[0] = (id)[v4 identifier];

    id v5 = (id)[v14 accountType];
    id v12 = (id)[v5 identifier];

    uint64_t v11 = [a1[4] indexOfObject:v13[0]];
    uint64_t v10 = [a1[4] indexOfObject:v12];
    id v7 = (id)[NSNumber numberWithInteger:v11];
    id v6 = (id)[NSNumber numberWithInteger:v10];
    uint64_t v16 = objc_msgSend(v7, "compare:");

    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    uint64_t v16 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)sortedDataclassesFrom:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([location[0] containsObject:*MEMORY[0x1E4F17B38]]) {
    [v5 addObject:*MEMORY[0x1E4F17B38]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AE0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AE0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AD8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AD8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A90]]) {
    [v5 addObject:*MEMORY[0x1E4F17A90]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A80]]) {
    [v5 addObject:*MEMORY[0x1E4F17A80]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17B08]]) {
    [v5 addObject:*MEMORY[0x1E4F17B08]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A70]]) {
    [v5 addObject:*MEMORY[0x1E4F17A70]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AC0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AC0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17B00]]) {
    [v5 addObject:*MEMORY[0x1E4F17B00]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AF8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AF8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AB8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AB8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17B20]]) {
    [v5 addObject:*MEMORY[0x1E4F17B20]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AC8]]) {
    [v5 addObject:*MEMORY[0x1E4F17AC8]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AD0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AD0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17A68]]) {
    [v5 addObject:*MEMORY[0x1E4F17A68]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AB0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AB0]];
  }
  if ([location[0] containsObject:*MEMORY[0x1E4F17AF0]]) {
    [v5 addObject:*MEMORY[0x1E4F17AF0]];
  }
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (void)emitNavigationEventForSubPane:(id)a3 subPath:(id)a4 account:(id)a5 inHostAppBundleID:(id)a6
{
  v82[3] = *MEMORY[0x1E4F143B8];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v80 = 0;
  objc_storeStrong(&v80, a4);
  id v79 = 0;
  objc_storeStrong(&v79, a5);
  id v78 = 0;
  objc_storeStrong(&v78, a6);
  PreferencesExtendedLibrary();
  id v77 = 0;
  if (v78)
  {
    v64 = (void *)MEMORY[0x1E4F1CB10];
    id v65 = (id)[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.InternetAccounts/%@?internetAccountsApplicationTarget=%@", v80, v78];
    id v6 = (id)objc_msgSend(v64, "URLWithString:");
    id v7 = v77;
    id v77 = v6;
  }
  else
  {
    v62 = (void *)MEMORY[0x1E4F1CB10];
    id v63 = (id)[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.InternetAccounts/%@", v80];
    id v8 = (id)objc_msgSend(v62, "URLWithString:");
    id v9 = v77;
    id v77 = v8;
  }
  id v54 = objc_alloc(MEMORY[0x1E4F292B8]);
  id v57 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
  id v56 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v55 = (id)[v56 bundleURL];
  id v76 = (id)objc_msgSend(v54, "initWithKey:table:locale:bundleURL:", @"ACCOUNTS");

  id v58 = objc_alloc(MEMORY[0x1E4F292B8]);
  id v61 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
  id v60 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v59 = (id)[v60 bundleURL];
  id v75 = (id)objc_msgSend(v58, "initWithKey:table:locale:bundleURL:", @"APPS_NAVIGATION_PATH", 0, v61);

  id v74 = 0;
  id v73 = 0;
  id v72 = +[ACUILocalization localizedNameForApplicationBundleID:v78];
  if (v72)
  {
    id v42 = objc_alloc(MEMORY[0x1E4F292B8]);
    id v45 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
    id v44 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v43 = (id)[v44 bundleURL];
    uint64_t v10 = objc_msgSend(v42, "initWithKey:defaultValue:table:locale:bundleURL:", @"DO_NOT_LOCALIZE_HOST_APP_IN_DEFAULT_VALUE", v72);
    id v11 = v74;
    id v74 = v10;

    id v47 = objc_alloc(MEMORY[0x1E4F292B8]);
    v46 = NSString;
    id v53 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v52 = (id)[v53 localizedStringForKey:@"HOST_APP_ACCOUNTS_PATH_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v51 = (id)[v46 localizedStringWithFormat:v72];
    id v50 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
    id v49 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v48 = (id)[v49 bundleURL];
    id v12 = objc_msgSend(v47, "initWithKey:defaultValue:table:locale:bundleURL:", @"DO_NOT_LOCALIZE_HOST_APP_ACCOUNTS_FORMAT_IN_DEFAULT_VALUE", v51, 0, v50);
    id v13 = v73;
    id v73 = v12;
  }
  else
  {
    id v34 = objc_alloc(MEMORY[0x1E4F292B8]);
    id v37 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
    id v36 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v35 = (id)[v36 bundleURL];
    id v14 = objc_msgSend(v34, "initWithKey:table:locale:bundleURL:", @"CONTACTS_APP_PATH");
    id v15 = v74;
    id v74 = v14;

    id v38 = objc_alloc(MEMORY[0x1E4F292B8]);
    id v41 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
    id v40 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v39 = (id)[v40 bundleURL];
    uint64_t v16 = objc_msgSend(v38, "initWithKey:table:locale:bundleURL:", @"CONTACTS_ACCOUNTS_PATH", 0, v41);
    id v17 = v73;
    id v73 = v16;
  }
  v82[0] = v75;
  v82[1] = v74;
  v82[2] = v73;
  id v33 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
  id v71 = (id)[v33 mutableCopy];

  if (([v80 isEqualToString:@"root"] & 1) == 0)
  {
    if ([v80 hasPrefix:@"ADD_ACCOUNT"])
    {
      id v29 = objc_alloc(MEMORY[0x1E4F292B8]);
      id v32 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
      id v31 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v30 = (id)[v31 bundleURL];
      id v18 = objc_msgSend(v29, "initWithKey:table:locale:bundleURL:", @"ADD_ACCOUNT", 0, v32);
      id v19 = v76;
      id v76 = v18;

      [v71 addObject:v76];
    }
    else
    {
      char v69 = 0;
      char v28 = 0;
      if (v79)
      {
        id v27 = v80;
        id v70 = (id)[v79 identifier];
        char v69 = 1;
        char v28 = objc_msgSend(v27, "hasPrefix:");
      }
      if (v69) {

      }
      if (v28)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F292B8]);
        id v26 = (id)[v79 accountDescription];
        id v25 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
        id v24 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v23 = (id)[v24 bundleURL];
        id v20 = objc_msgSend(v22, "initWithKey:defaultValue:table:locale:bundleURL:", @"DO_NOT_LOCALIZE_ACCOUNT_DESCIRPTION_IN_DEFAULT_VALUE", v26, 0, v25);
        id v21 = v76;
        id v76 = v20;

        [v71 addObject:v76];
      }
    }
  }
  objc_msgSend(location[0], "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.accounts.generic-account", v76, v71, v77);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(location, 0);
}

@end
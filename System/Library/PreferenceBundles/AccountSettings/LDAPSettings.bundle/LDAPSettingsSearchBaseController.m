@interface LDAPSettingsSearchBaseController
- (BOOL)_isNewSearchSettings;
- (BOOL)_searchSettingsAreEmpty;
- (CalCancelable)confirmDeleteSettingsSheetOrAlert;
- (LDAPAccount)account;
- (LDAPSearchSettings)searchSettings;
- (LDAPSettingsAccountsUIController)accountController;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)specifiers;
- (void)_checkScopeCell;
- (void)_confirmationView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)_updateDescriptionFromSearchBase:(id)a3;
- (void)actionSheet:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)confirmDeleteSettings:(id)a3;
- (void)dealloc;
- (void)didConfirmDeleteSettings:(BOOL)a3;
- (void)setAccount:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setAccountIntProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setConfirmDeleteSettingsSheetOrAlert:(id)a3;
- (void)setSearchSettings:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LDAPSettingsSearchBaseController

- (void)dealloc
{
  [(CalCancelable *)self->_confirmDeleteSettingsSheetOrAlert cancel];
  v3.receiver = self;
  v3.super_class = (Class)LDAPSettingsSearchBaseController;
  [(LDAPSettingsSearchBaseController *)&v3 dealloc];
}

- (BOOL)_isNewSearchSettings
{
  v2 = [(LDAPSettingsSearchBaseController *)self specifier];
  objc_super v3 = [v2 propertyForKey:@"LDAPSettingsSearchSettingsKey"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)_searchSettingsAreEmpty
{
  searchSettings = self->_searchSettings;
  if (!searchSettings) {
    return 1;
  }
  if ([(LDAPSearchSettings *)searchSettings scope] != (char *)&dword_0 + 2) {
    return 0;
  }
  BOOL v4 = [(LDAPSearchSettings *)self->_searchSettings searchBase];
  if ([v4 length])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [(LDAPSearchSettings *)self->_searchSettings searchDescription];
    BOOL v5 = [v6 length] == 0;
  }
  return v5;
}

- (void)_checkScopeCell
{
  searchSettings = self->_searchSettings;
  CFStringRef v4 = @"SUBTREE";
  if (searchSettings)
  {
    BOOL v5 = (char *)[(LDAPSearchSettings *)searchSettings scope];
    CFStringRef v6 = @"ONE_LEVEL";
    if (v5 != (unsigned char *)&dword_0 + 1) {
      CFStringRef v6 = @"SUBTREE";
    }
    if (v5) {
      CFStringRef v4 = v6;
    }
    else {
      CFStringRef v4 = @"BASE";
    }
  }
  id v8 = [(LDAPSettingsSearchBaseController *)self specifierForID:v4];
  v7 = [(LDAPSettingsSearchBaseController *)self specifierForID:@"SCOPE_HEADER"];
  [v7 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  CFStringRef v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    CFStringRef v6 = [(LDAPSettingsSearchBaseController *)self specifier];
    v7 = [v6 propertyForKey:@"LDAPSettingsAccountKey"];
    account = self->_account;
    self->_account = v7;

    v9 = [(LDAPSettingsSearchBaseController *)self specifier];
    v10 = [v9 propertyForKey:@"LDAPSettingsSearchSettingsKey"];
    searchSettings = self->_searchSettings;
    self->_searchSettings = v10;

    v12 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
    id WeakRetained = objc_loadWeakRetained(v12);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v24 = +[NSAssertionHandler currentHandler];
      id v25 = objc_loadWeakRetained(v12);
      [v24 handleFailureInMethod:a2, self, @"LDAPSettingsSearchBaseController.m", 74, @"My parent is of unknown origin, is class %@", objc_opt_class() object file lineNumber description];
    }
    id v15 = objc_loadWeakRetained(v12);
    objc_storeWeak((id *)&self->_accountController, v15);

    v16 = [(LDAPSettingsSearchBaseController *)self loadSpecifiersFromPlistName:@"LDAPSearchBase" target:self];
    id v17 = [v16 mutableCopy];

    if (self->_searchSettings)
    {
      v18 = +[PSSpecifier emptyGroupSpecifier];
      [v17 addObject:v18];

      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"DELETE_SEARCH_SETTINGS" value:&stru_8300 table:@"LDAPAccountSetup"];
      v21 = +[PSSpecifier deleteButtonSpecifierWithName:v20 target:self action:"confirmDeleteSettings:"];

      [v17 addObject:v21];
    }
    v22 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v17;

    [(LDAPSettingsSearchBaseController *)self _checkScopeCell];
    CFStringRef v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);
  CFStringRef v6 = [WeakRetained navigationItem];

  v7 = [v6 prompt];
  id v8 = [(LDAPSettingsSearchBaseController *)self navigationItem];
  [v8 setPrompt:v7];

  v9.receiver = self;
  v9.super_class = (Class)LDAPSettingsSearchBaseController;
  [(LDAPSettingsSearchBaseController *)&v9 viewWillAppear:v3];
}

- (void)_updateDescriptionFromSearchBase:(id)a3
{
  id v20 = a3;
  CFStringRef v4 = [(LDAPSearchSettings *)self->_searchSettings searchBase];
  BOOL v5 = [v4 ldapHumanReadableStringFromSearchBase];

  uint64_t v6 = [(LDAPSearchSettings *)self->_searchSettings searchDescription];
  if (!v6
    || (v7 = (void *)v6,
        [(LDAPSearchSettings *)self->_searchSettings searchDescription],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:v5],
        v8,
        v7,
        v9))
  {
    v10 = [v20 ldapHumanReadableStringFromSearchBase];
    [(LDAPSearchSettings *)self->_searchSettings setSearchDescription:v10];
    uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
    id v12 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0;
      while (1)
      {
        id v15 = [*(id *)&self->PSListController_opaque[v11] objectAtIndexedSubscript:v14];
        v16 = [v15 identifier];

        if ([v16 isEqualToString:@"DESCRIPTION"]) {
          break;
        }

        if (v13 == (id)++v14) {
          goto LABEL_9;
        }
      }
      id v17 = [(LDAPSettingsSearchBaseController *)self table];
      v18 = [(LDAPSettingsSearchBaseController *)self indexPathForIndex:v14];
      v19 = [v17 cellForRowAtIndexPath:v18];

      [v19 setValue:v10];
    }
LABEL_9:
  }
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v10 = a3;
  uint64_t v6 = [a4 identifier];
  if (!self->_searchSettings)
  {
    v7 = (LDAPSearchSettings *)objc_opt_new();
    searchSettings = self->_searchSettings;
    self->_searchSettings = v7;

    [(LDAPSearchSettings *)self->_searchSettings setScope:2];
    [(LDAPAccount *)self->_account addSearchSettings:self->_searchSettings];
  }
  if ([v6 isEqualToString:@"SEARCH_BASE"])
  {
    [(LDAPSettingsSearchBaseController *)self _updateDescriptionFromSearchBase:v10];
    [(LDAPSearchSettings *)self->_searchSettings setSearchBase:v10];
  }
  else if ([v6 isEqualToString:@"DESCRIPTION"])
  {
    [(LDAPSearchSettings *)self->_searchSettings setSearchDescription:v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);
  [WeakRetained _markAccountDirty];
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  CFStringRef v4 = [a3 identifier];
  if ([v4 isEqualToString:@"SEARCH_BASE"])
  {
    uint64_t v5 = [(LDAPSearchSettings *)self->_searchSettings searchBase];
LABEL_5:
    uint64_t v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"DESCRIPTION"])
  {
    uint64_t v5 = [(LDAPSearchSettings *)self->_searchSettings searchDescription];
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (void)setAccountIntProperty:(id)a3 withSpecifier:(id)a4
{
  id v10 = [a4 propertyForKey:@"bundleID"];
  if ([v10 isEqualToString:@"BASE_CELL"])
  {
    id v5 = 0;
  }
  else if ([v10 isEqualToString:@"ONE_LEVEL_CELL"])
  {
    id v5 = &dword_0 + 1;
  }
  else
  {
    id v5 = &dword_0 + 2;
  }
  searchSettings = self->_searchSettings;
  if (!searchSettings)
  {
    v7 = (LDAPSearchSettings *)objc_opt_new();
    id v8 = self->_searchSettings;
    self->_searchSettings = v7;

    [(LDAPAccount *)self->_account addSearchSettings:self->_searchSettings];
    goto LABEL_10;
  }
  if ([(LDAPSearchSettings *)searchSettings scope] != v5)
  {
LABEL_10:
    [(LDAPSearchSettings *)self->_searchSettings setScope:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);
    [WeakRetained _markAccountDirty];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)LDAPSettingsSearchBaseController;
  id v6 = a4;
  id v7 = a3;
  [(LDAPSettingsSearchBaseController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [(LDAPSettingsSearchBaseController *)self specifierAtIndex:[(LDAPSettingsSearchBaseController *)self indexForIndexPath:v6]];
  v10.receiver = self;
  v10.super_class = (Class)LDAPSettingsSearchBaseController;
  unsigned int v9 = [(LDAPSettingsSearchBaseController *)&v10 tableView:v7 cellForRowAtIndexPath:v6];

  if ([v9 type] == (char *)&dword_0 + 3) {
    [(LDAPSettingsSearchBaseController *)self setAccountIntProperty:0 withSpecifier:v8];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  if ([(LDAPSettingsSearchBaseController *)self _isNewSearchSettings]
    && [(LDAPSettingsSearchBaseController *)self _searchSettingsAreEmpty])
  {
    [(LDAPAccount *)self->_account removeSearchSettings:self->_searchSettings];
  }
  v6.receiver = self;
  v6.super_class = (Class)LDAPSettingsSearchBaseController;
  [(LDAPSettingsSearchBaseController *)&v6 viewWillDisappear:v3];
}

- (void)confirmDeleteSettings:(id)a3
{
  CFStringRef v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v25 = objc_alloc((Class)UIAlertView);
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"LDAP_ACCOUNT" value:&stru_8300 table:@"LDAPAccountSetup"];
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v9 = [v8 localizedStringForKey:@"DELETE_SEARCH_SETTINGS_WARNING" value:&stru_8300 table:@"LDAPAccountSetup"];
    objc_super v10 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v11 = [v10 localizedStringForKey:@"DELETE" value:&stru_8300 table:@"LDAPAccountSetup"];
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_8300 table:@"LDAPAccountSetup"];
    id v14 = objc_msgSend(v25, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", v7, v9, self, 0, v11, v13, 0);

    [v14 setCancelButtonIndex:1];
    [v14 show];
    confirmDeleteSettingsSheetOrAlert = self->_confirmDeleteSettingsSheetOrAlert;
    self->_confirmDeleteSettingsSheetOrAlert = (CalCancelable *)v14;
  }
  else
  {
    id v16 = objc_alloc((Class)UIActionSheet);
    id v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"DELETE_SEARCH_SETTINGS_WARNING" value:&stru_8300 table:@"LDAPAccountSetup"];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    id v20 = [v19 localizedStringForKey:@"DELETE_SEARCH_SETTINGS" value:&stru_8300 table:@"LDAPAccountSetup"];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_8300 table:@"LDAPAccountSetup"];
    id v23 = objc_msgSend(v16, "initWithTitle:delegate:cancelButtonTitle:destructiveButtonTitle:otherButtonTitles:", v18, self, 0, 0, v20, v22, 0);

    [v23 setDestructiveButtonIndex:0];
    [v23 setCancelButtonIndex:1];
    v24 = [(LDAPSettingsSearchBaseController *)self view];
    [v23 showInView:v24];

    confirmDeleteSettingsSheetOrAlert = self->_confirmDeleteSettingsSheetOrAlert;
    self->_confirmDeleteSettingsSheetOrAlert = (CalCancelable *)v23;
  }
}

- (void)didConfirmDeleteSettings:(BOOL)a3
{
  if (a3)
  {
    [(LDAPAccount *)self->_account removeSearchSettings:self->_searchSettings];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);
    [WeakRetained _markAccountDirty];

    [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] selectRowAtIndexPath:0 animated:0 scrollPosition:0];
    id v7 = [(LDAPSettingsSearchBaseController *)self rootController];
    id v5 = [v7 popViewControllerAnimated:1];
  }
  else
  {
    objc_super v6 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__table];
    [v6 selectRowAtIndexPath:0 animated:0 scrollPosition:0];
  }
}

- (void)_confirmationView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  objc_super v6 = (CalCancelable *)a3;
  id v7 = [(CalCancelable *)v6 cancelButtonIndex];
  confirmDeleteSettingsSheetOrAlert = self->_confirmDeleteSettingsSheetOrAlert;

  if (confirmDeleteSettingsSheetOrAlert == v6)
  {
    [(LDAPSettingsSearchBaseController *)self didConfirmDeleteSettings:v7 != (id)a4];
    unsigned int v9 = self->_confirmDeleteSettingsSheetOrAlert;
    self->_confirmDeleteSettingsSheetOrAlert = 0;
  }
}

- (void)actionSheet:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
}

- (LDAPAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (LDAPSearchSettings)searchSettings
{
  return self->_searchSettings;
}

- (void)setSearchSettings:(id)a3
{
}

- (LDAPSettingsAccountsUIController)accountController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);

  return (LDAPSettingsAccountsUIController *)WeakRetained;
}

- (void)setAccountController:(id)a3
{
}

- (CalCancelable)confirmDeleteSettingsSheetOrAlert
{
  return self->_confirmDeleteSettingsSheetOrAlert;
}

- (void)setConfirmDeleteSettingsSheetOrAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmDeleteSettingsSheetOrAlert, 0);
  objc_destroyWeak((id *)&self->_accountController);
  objc_storeStrong((id *)&self->_searchSettings, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
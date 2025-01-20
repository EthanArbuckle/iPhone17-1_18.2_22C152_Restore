@interface LDAPSettingsAccountsUIController
- (BOOL)haveEnoughValues;
- (BOOL)validateAccount;
- (NSArray)specifiersToInsert;
- (id)_searchBaseSpecifiers;
- (id)accountBooleanPropertyWithSpecifier:(id)a3;
- (id)accountSpecifiers;
- (id)localizedAccountSetupTitleString;
- (id)localizedConfirmSaveUnvalidatedAccountMessageString;
- (id)localizedConfirmSaveUnvalidatedAccountTitleString;
- (id)localizedValidationFailureTitleString;
- (id)newDefaultAccount;
- (void)_markAccountDirty;
- (void)_updateDescriptionFromServer:(id)a3;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setSpecifiersToInsert:(id)a3;
- (void)showConfirmationForDeletingAccount:(id)a3 completion:(id)a4;
@end

@implementation LDAPSettingsAccountsUIController

- (id)newDefaultAccount
{
  v2 = [(LDAPSettingsAccountsUIController *)self accountStore];
  v3 = [v2 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierLDAP];

  id v4 = [objc_alloc((Class)ACAccount) initWithAccountType:v3];
  v5 = [v3 supportedDataclasses];
  id v6 = [v5 mutableCopy];

  [v4 setProvisionedDataclasses:v6];
  v7 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v4];
  [v7 setUseSSL:1];
  [v7 setEnabled:1 forDADataclass:8];

  return v7;
}

- (id)_searchBaseSpecifiers
{
  v3 = +[NSMutableArray array];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"SEARCH_BASE_SETTINGS" value:&stru_8300 table:@"LDAPAccountSetup"];
  id v6 = +[PSSpecifier groupSpecifierWithName:v5];
  [v3 addObject:v6];

  v7 = [(LDAPSettingsAccountsUIController *)self account];
  v8 = [v7 searchSettings];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 searchDescription];
        if (!v14)
        {
          v15 = +[NSBundle bundleForClass:objc_opt_class()];
          v14 = [v15 localizedStringForKey:@"EMPTY_SEARCH_BASE" value:&stru_8300 table:@"LDAPAccountSetup"];
        }
        v16 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
        [v16 setProperty:v13 forKey:@"LDAPSettingsSearchSettingsKey"];
        v17 = [(LDAPSettingsAccountsUIController *)self account];
        [v16 setProperty:v17 forKey:@"LDAPSettingsAccountKey"];

        [v3 addObject:v16];
      }
      id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"ADD_SEARCH_SETTINGS" value:&stru_8300 table:@"LDAPAccountSetup"];
  v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  v21 = [(LDAPSettingsAccountsUIController *)self account];
  [v20 setProperty:v21 forKey:@"LDAPSettingsAccountKey"];

  [v3 addObject:v20];

  return v3;
}

- (id)accountSpecifiers
{
  v3 = [(LDAPSettingsAccountsUIController *)self loadSpecifiersFromPlistName:@"LDAPAccountSetup" target:self];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  if ([(LDAPSettingsAccountsUIController *)self isSettingUpNewAccount]
    && [(LDAPSettingsAccountsUIController *)self accountNeedsAdd])
  {
    v5 = objc_opt_new();
    [(LDAPSettingsAccountsUIController *)self setSpecifiersToInsert:v5];

    id v6 = [(LDAPSettingsAccountsUIController *)self specifiersToInsert];
    v7 = [v4 specifierForID:@"USE_SSL"];
    [v6 addObject:v7];

    v8 = [(LDAPSettingsAccountsUIController *)self specifiersToInsert];
    [v4 removeObjectsInArray:v8];
  }
  else
  {
    v8 = [(LDAPSettingsAccountsUIController *)self _searchBaseSpecifiers];
    [v4 addObjectsFromArray:v8];
  }

  id v9 = &DAAccountDescriptionFromHostname_ptr;
  if (([(LDAPSettingsAccountsUIController *)self isSettingUpNewAccount] & 1) == 0)
  {
    id v10 = +[DADiagnosticsPSController linkSpecifier];
    if (v10)
    {
      uint64_t v11 = +[PSSpecifier emptyGroupSpecifier];
      [v4 addObject:v11];

      [v4 addObject:v10];
    }
    unsigned int v12 = [(LDAPSettingsAccountsUIController *)self accountIsManaged];
    v13 = [(LDAPSettingsAccountsUIController *)self account];
    v14 = v13;
    if (v12)
    {
      v15 = [v13 backingAccountInfo];
      v16 = [v15 mcBackingProfile];

      if (v16)
      {
        v17 = +[NSBundle bundleForClass:objc_opt_class()];
        v18 = [v17 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_8300 table:@"LDAPAccountSetup"];
        v19 = [v16 friendlyName];
        v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);

        v21 = [(LDAPSettingsAccountsUIController *)self lastGroupSpecifierInSpecifiers:v4];
        if (!v21)
        {
          v22 = DALoggingwithCategory();
          os_log_type_t v23 = _CPLog_to_os_log_type[3];
          if (os_log_type_enabled(v22, v23))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v4;
            _os_log_impl(&dword_0, v22, v23, "No group found, not setting the profile text.  Specifiers: %@", buf, 0xCu);
          }
        }
        [v21 setProperty:v20 forKey:PSFooterTextGroupKey];
      }
      v45 = v16;
      v46 = v10;
      long long v24 = [v10 identifier];
      long long v25 = +[NSSet setWithObjects:@"PASSWORD", @"DESCRIPTION", @"ENABLED", v24, 0];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = v4;
      id v27 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v48;
        uint64_t v30 = PSEnabledKey;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v48 != v29) {
              objc_enumerationMutation(v26);
            }
            v32 = *(char **)(*((void *)&v47 + 1) + 8 * i);
            v33 = [v32 identifier];
            if (([v25 containsObject:v33] & 1) == 0
              && *(void *)&v32[OBJC_IVAR___PSSpecifier_cellType] != 1)
            {
              [v32 setProperty:&__kCFBooleanFalse forKey:v30];
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v28);
      }

      id v9 = &DAAccountDescriptionFromHostname_ptr;
      id v10 = v46;
    }
    else
    {
      v34 = [v13 accountDescription];
      [(LDAPSettingsAccountsUIController *)self setTitle:v34];

      v35 = +[PSSpecifier emptyGroupSpecifier];
      [v4 addObject:v35];

      v36 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_8300 table:@"Localizable"];
      v38 = +[PSSpecifier deleteButtonSpecifierWithName:v37 target:self action:"deleteAccountButtonTapped"];

      [v4 addObject:v38];
    }
  }
  if ([(LDAPSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    v39 = [v4 specifierForID:@"ENABLED"];
    [v4 removeObject:v39];

    v40 = [v4 specifierForID:@"LDAP_INFO"];
    [v4 removeObject:v40];
  }
  else
  {
    v41 = v9[63];
    v40 = +[NSBundle bundleForClass:objc_opt_class()];
    v42 = [v40 localizedStringForKey:@"LDAP_INFO" value:&stru_8300 table:@"LDAPAccountSetup"];
    v43 = [v41 groupSpecifierWithName:v42];
    [v4 setObject:v43 atIndexedSubscript:2];
  }

  return v4;
}

- (BOOL)validateAccount
{
  v3 = [(LDAPSettingsAccountsUIController *)self table];
  id v4 = [v3 firstResponder];
  [v4 resignFirstResponder];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"VERIFYING" value:&stru_8300 table:@"Localizable"];
  [(LDAPSettingsAccountsUIController *)self startValidationWithPrompt:v6];

  v7 = [(LDAPSettingsAccountsUIController *)self account];
  v8 = [(LDAPSettingsAccountsUIController *)self accountStore];
  [v7 checkValidityOnAccountStore:v8 withConsumer:self inQueue:&_dispatch_main_q];

  return 1;
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    if ([(LDAPSettingsAccountsUIController *)self accountNeedsAdd])
    {
      id v10 = [(LDAPSettingsAccountsUIController *)self account];
      [v10 setEnabled:0 forDADataclass:1];

      uint64_t v11 = [(LDAPSettingsAccountsUIController *)self account];
      [v11 setEnabled:0 forDADataclass:2];

      unsigned int v12 = [(LDAPSettingsAccountsUIController *)self account];
      [v12 setEnabled:0 forDADataclass:4];

      v13 = [(LDAPSettingsAccountsUIController *)self account];
      [v13 setEnabled:0 forDADataclass:16];

      v14 = [(LDAPSettingsAccountsUIController *)self account];
      [v14 setEnabled:0 forDADataclass:32];

      v15 = [(LDAPSettingsAccountsUIController *)self account];
      [v15 setEnabled:1 forDADataclass:8];

      dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x2020000000;
      char v36 = 1;
      v17 = [(LDAPSettingsAccountsUIController *)self accountStore];
      v18 = [(LDAPSettingsAccountsUIController *)self account];
      v19 = [v18 backingAccountInfo];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_30DC;
      v31[3] = &unk_8280;
      p_long long buf = &buf;
      v20 = v16;
      v32 = v20;
      [v17 canSaveAccount:v19 withCompletionHandler:v31];

      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v21 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        [(LDAPSettingsAccountsUIController *)self setAccountNeedsAdd:0];
        [(LDAPSettingsAccountsUIController *)self setValidatedSuccessfully:1];
        v22 = [(LDAPSettingsAccountsUIController *)self specifiersToInsert];
        [(LDAPSettingsAccountsUIController *)self insertContiguousSpecifiers:v22 afterSpecifierID:@"PASSWORD" animated:1];

        os_log_type_t v23 = [(LDAPSettingsAccountsUIController *)self _searchBaseSpecifiers];
        [(LDAPSettingsAccountsUIController *)self insertContiguousSpecifiers:v23 afterSpecifierID:@"DESCRIPTION" animated:1];
      }
      else
      {
        [(LDAPSettingsAccountsUIController *)self showIdenticalAccountFailureView];
        [(LDAPSettingsAccountsUIController *)self setAttemptedValidation:0];
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      BOOL v21 = 1;
      [(LDAPSettingsAccountsUIController *)self setValidatedSuccessfully:1];
    }
    id v28 = 0;
  }
  else
  {
    long long v24 = DALoggingwithCategory();
    os_log_type_t v25 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v24, v25))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_0, v24, v25, "validation failed with error %@", (uint8_t *)&buf, 0xCu);
    }

    id v26 = [(LDAPSettingsAccountsUIController *)self account];
    unsigned int v27 = [v26 useSSL];

    if (v27)
    {
      [(LDAPSettingsAccountsUIController *)self showSSLFailureView];
      id v28 = 0;
    }
    else
    {
      uint64_t v29 = +[NSBundle bundleForClass:objc_opt_class()];
      id v28 = [v29 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_8300 table:@"LDAPAccountSetup"];
    }
    [(LDAPSettingsAccountsUIController *)self setValidatedSuccessfully:0];
    BOOL v21 = 1;
  }
  [(LDAPSettingsAccountsUIController *)self hideProgressWithPrompt:v28];
  v30.receiver = self;
  v30.super_class = (Class)LDAPSettingsAccountsUIController;
  [(LDAPSettingsAccountsUIController *)&v30 account:v8 isValid:v21 & v6 validationError:v9];
}

- (BOOL)haveEnoughValues
{
  v3 = [(LDAPSettingsAccountsUIController *)self specifiers];
  id v4 = [v3 count];

  if (qword_D3F0 == -1)
  {
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 0;
      BOOL v6 = &DAAccountDescriptionFromHostname_ptr;
      v7 = &selRef_startValidationWithPrompt_;
      id v20 = v4;
      while (1)
      {
        id v8 = [(LDAPSettingsAccountsUIController *)self specifiers];
        id v9 = [v8 objectAtIndexedSubscript:v5];

        if (v5 == [(LDAPSettingsAccountsUIController *)self indexOfCurrentlyEditingCell])
        {
          id v10 = [(LDAPSettingsAccountsUIController *)self currentlyEditingCell];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          uint64_t v11 = v7[125];
          unsigned int v12 = [v9 identifier];
          if (![v11 containsObject:v12])
          {
            char v18 = 1;
            goto LABEL_13;
          }
          v13 = [v10 textField];
          [v13 text];
          v14 = v7;
          dispatch_semaphore_t v16 = v15 = v6;
          id v17 = [v16 length];

          BOOL v6 = v15;
          v7 = v14;
          id v4 = v20;
        }
        else
        {
          id v10 = [v9 identifier];
          if (![v10 isEqualToString:@"HOST"])
          {
LABEL_11:
            char v18 = 1;
            goto LABEL_14;
          }
          unsigned int v12 = [(LDAPSettingsAccountsUIController *)self account];
          v13 = [v12 host];
          id v17 = [v13 length];
        }
        char v18 = v17 != 0;

LABEL_13:
LABEL_14:

        if (++v5 >= (unint64_t)v4 || (v18 & 1) == 0) {
          return v18;
        }
      }
    }
  }
  else
  {
    dispatch_once(&qword_D3F0, &stru_82C0);
    if (v4) {
      goto LABEL_3;
    }
  }
  return 0;
}

- (void)_markAccountDirty
{
}

- (void)_updateDescriptionFromServer:(id)a3
{
  id v27 = a3;
  id v4 = [(LDAPSettingsAccountsUIController *)self account];
  uint64_t v5 = [v4 accountDescription];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    v7 = [(LDAPSettingsAccountsUIController *)self account];
    id v8 = [v7 accountDescription];
    id v9 = [(LDAPSettingsAccountsUIController *)self account];
    id v10 = [v9 host];
    unsigned int v11 = [v8 isEqualToString:v10];

    unsigned int v12 = v27;
    if (!v11) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v13 = DAAccountDescriptionFromHostname();
  v14 = [(LDAPSettingsAccountsUIController *)self accountStore];
  unsigned int v15 = [v14 hasAccountWithDescription:v13];

  if (v15)
  {
    id v16 = v27;

    v13 = v16;
  }
  id v17 = [(LDAPSettingsAccountsUIController *)self account];
  [v17 setAccountDescription:v13];

  char v18 = [(LDAPSettingsAccountsUIController *)self specifiers];
  id v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = 0;
    while (1)
    {
      BOOL v21 = [(LDAPSettingsAccountsUIController *)self specifiers];
      v22 = [v21 objectAtIndexedSubscript:v20];
      os_log_type_t v23 = [v22 identifier];

      if ([v23 isEqualToString:@"DESCRIPTION"]) {
        break;
      }

      if (v19 == (id)++v20) {
        goto LABEL_13;
      }
    }
    long long v24 = [(LDAPSettingsAccountsUIController *)self table];
    os_log_type_t v25 = [(LDAPSettingsAccountsUIController *)self indexPathForIndex:v20];
    id v26 = [v24 cellForRowAtIndexPath:v25];

    [v26 setValue:v13];
  }
LABEL_13:

  unsigned int v12 = v27;
LABEL_14:
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  id v9 = [(LDAPSettingsAccountsUIController *)self accountPropertyWithSpecifier:v7];
  unsigned int v10 = [v6 isEqualToString:v9];

  if ([v8 isEqualToString:@"HOST"])
  {
    [(LDAPSettingsAccountsUIController *)self _updateDescriptionFromServer:v6];
    unsigned int v11 = [(LDAPSettingsAccountsUIController *)self account];
    [v11 setHost:v6];
LABEL_8:

    goto LABEL_9;
  }
  if ((([v8 isEqualToString:@"DESCRIPTION"] ^ 1 | v10) & 1) == 0)
  {
    if (![v6 length])
    {
      unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"DESCRIPTION_PLACEHOLDER" value:&stru_8300 table:@"LDAPAccountSetup"];

      id v6 = (id)v13;
    }
    unsigned int v11 = [(LDAPSettingsAccountsUIController *)self account];
    [v11 setAccountDescription:v6];
    goto LABEL_8;
  }
  v14.receiver = self;
  v14.super_class = (Class)LDAPSettingsAccountsUIController;
  [(LDAPSettingsAccountsUIController *)&v14 setAccountProperty:v6 withSpecifier:v7];
LABEL_9:
  [(LDAPSettingsAccountsUIController *)self updateDoneButton];
  [(LDAPSettingsAccountsUIController *)self setNeedsSave:1];
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  id v9 = [v7 identifier];
  if ([v9 isEqualToString:@"ENABLED"])
  {
    unsigned int v10 = [(LDAPSettingsAccountsUIController *)self account];
    [v10 setEnabled:v8 forDADataclass:8];
  }
  else if ([v9 isEqualToString:@"USE_SSL"])
  {
    unsigned int v11 = [(LDAPSettingsAccountsUIController *)self account];
    [v11 setUseSSL:v8];

    [(LDAPSettingsAccountsUIController *)self updateDoneButton];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)LDAPSettingsAccountsUIController;
    [(LDAPSettingsAccountsUIController *)&v12 setAccountBooleanProperty:v6 withSpecifier:v7];
  }
  [(LDAPSettingsAccountsUIController *)self setNeedsSave:1];
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if ([v5 isEqualToString:@"ENABLED"])
  {
    id v6 = [(LDAPSettingsAccountsUIController *)self account];
    id v7 = [v6 enabledForDADataclass:8];
LABEL_5:
    id v8 = v7;

    uint64_t v9 = +[NSNumber numberWithBool:v8];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"USE_SSL"])
  {
    id v6 = [(LDAPSettingsAccountsUIController *)self account];
    id v7 = [v6 useSSL];
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)LDAPSettingsAccountsUIController;
  uint64_t v9 = [(LDAPSettingsAccountsUIController *)&v12 accountBooleanPropertyWithSpecifier:v4];
LABEL_7:
  unsigned int v10 = (void *)v9;

  return v10;
}

- (void)showConfirmationForDeletingAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DELETE_ACCOUNT_WARNING"];
  id v8 = [v6 localizedStringForKey:v7 value:&stru_8300 table:@"LDAPAccountSetup"];

  uint64_t v9 = +[UIDevice currentDevice];
  unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

  unint64_t v11 = v10 & 0xFFFFFFFFFFFFFFFBLL;
  objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = v12;
  if (v11 == 1) {
    CFStringRef v14 = @"DELETE";
  }
  else {
    CFStringRef v14 = @"DELETE_ACCOUNT";
  }
  unsigned int v15 = [v12 localizedStringForKey:v14 value:&stru_8300 table:@"LDAPAccountSetup"];
  v21[0] = v15;
  id v16 = +[NSBundle bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_8300 table:@"LDAPAccountSetup"];
  v21[1] = v17;
  char v18 = +[NSArray arrayWithObjects:v21 count:2];

  id v19 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v20 = [v19 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_8300 table:@"LDAPAccountSetup"];
  [(LDAPSettingsAccountsUIController *)self showConfirmationWithButtons:v18 title:v20 message:v8 destructive:1 completion:v5];
}

- (id)localizedValidationFailureTitleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"LDAP_ACCOUNT" value:&stru_8300 table:@"LDAPAccountSetup"];

  return v3;
}

- (id)localizedConfirmSaveUnvalidatedAccountTitleString
{
  return [(LDAPSettingsAccountsUIController *)self localizedValidationFailureTitleString];
}

- (id)localizedConfirmSaveUnvalidatedAccountMessageString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CONFIRM_SAVE_ACCOUNT_ANYWAYS_MESSAGE" value:&stru_8300 table:@"LDAPAccountSetup"];

  return v3;
}

- (id)localizedAccountSetupTitleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"NEW_ACCOUNT_SETTINGS" value:&stru_8300 table:@"LDAPAccountSetup"];

  return v3;
}

- (NSArray)specifiersToInsert
{
  return self->_specifiersToInsert;
}

- (void)setSpecifiersToInsert:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
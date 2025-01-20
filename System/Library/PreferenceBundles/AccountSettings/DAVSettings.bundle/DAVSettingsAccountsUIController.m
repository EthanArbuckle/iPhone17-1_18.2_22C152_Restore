@interface DAVSettingsAccountsUIController
- (BOOL)attemptedInitialValidation;
- (BOOL)dismissesAfterInitialSetup;
- (BOOL)haveEnoughValues;
- (BOOL)isReloadingProperties;
- (BOOL)showDeleteButton;
- (BOOL)validateAccount;
- (id)acAccountTypeString;
- (id)accountBooleanPropertyWithSpecifier:(id)a3;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)accountSpecifiers;
- (id)localizedAccountSetupTitleString;
- (id)localizedConfirmSaveUnvalidatedAccountMessageString;
- (id)localizedValidationFailureTitleString;
- (id)newDefaultAccount;
- (id)settingsPlistName;
- (int64_t)defaultDADataclassesToEnable;
- (void)_updateDescriptionFromServer:(id)a3;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)didConfirmTryWithoutSSL:(BOOL)a3;
- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAttemptedInitialValidation:(BOOL)a3;
- (void)setIsReloadingProperties:(BOOL)a3;
@end

@implementation DAVSettingsAccountsUIController

- (BOOL)showDeleteButton
{
  v2 = [(DAVSettingsAccountsUIController *)self account];
  v3 = [v2 backingAccountInfo];
  v4 = [v3 managingOwnerIdentifier];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)newDefaultAccount
{
  v3 = [(DAVSettingsAccountsUIController *)self accountStore];
  v4 = [(DAVSettingsAccountsUIController *)self acAccountTypeString];
  BOOL v5 = [v3 accountTypeWithAccountTypeIdentifier:v4];

  id v6 = [objc_alloc((Class)ACAccount) initWithAccountType:v5];
  v7 = [v5 supportedDataclasses];
  id v8 = [v7 mutableCopy];

  [v6 setProvisionedDataclasses:v8];
  v9 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v6];
  [v9 setUseSSL:1];
  unint64_t v10 = [(DAVSettingsAccountsUIController *)self defaultDADataclassesToEnable];
  [v9 setEnabled:(v10 >> 1) & 1 forDADataclass:2];
  [v9 setEnabled:(v10 >> 3) & 1 forDADataclass:8];
  [v9 setEnabled:(v10 >> 2) & 1 forDADataclass:4];
  [v9 setEnabled:(v10 >> 4) & 1 forDADataclass:16];

  return v9;
}

- (id)accountSpecifiers
{
  v3 = [(DAVSettingsAccountsUIController *)self settingsPlistName];
  v4 = [(DAVSettingsAccountsUIController *)self loadSpecifiersFromPlistName:v3 target:self];
  BOOL v5 = +[NSMutableArray arrayWithArray:v4];

  if (([(DAVSettingsAccountsUIController *)self isSettingUpNewAccount] & 1) == 0)
  {
    id v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];

    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"ADVANCED_SETTINGS" value:&stru_8298 table:@"Localizable"];
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    unint64_t v10 = [(DAVSettingsAccountsUIController *)self account];
    [v9 setProperty:v10 forKey:@"DAVAdvancedControllerAccountKey"];

    [v5 addObject:v9];
    v11 = +[DADiagnosticsPSController linkSpecifier];
    if (v11)
    {
      v12 = +[PSSpecifier emptyGroupSpecifier];
      [v5 addObject:v12];

      [v5 addObject:v11];
    }
    if ([(DAVSettingsAccountsUIController *)self accountIsManaged])
    {
      v49 = v9;
      v13 = [(DAVSettingsAccountsUIController *)self account];
      v14 = [v13 backingAccountInfo];
      v15 = [v14 mcBackingProfile];

      if (v15)
      {
        v16 = +[NSBundle bundleForClass:objc_opt_class()];
        v17 = [v16 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_8298 table:@"Localizable"];
        v18 = [v15 friendlyName];
        v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);

        v20 = [(DAVSettingsAccountsUIController *)self lastGroupSpecifierInSpecifiers:v5];
        if (!v20)
        {
          v21 = DALoggingwithCategory();
          os_log_type_t v22 = _CPLog_to_os_log_type[3];
          if (os_log_type_enabled(v21, v22))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v5;
            _os_log_impl(&dword_0, v21, v22, "No group found, not setting the profile text.  Specifiers: %@", buf, 0xCu);
          }
        }
        [v20 setProperty:v19 forKey:PSFooterTextGroupKey];
      }
      v47 = v15;
      v48 = v11;
      v23 = [v11 identifier];
      v24 = +[NSSet setWithObjects:@"PASSWORD", @"DESCRIPTION", @"ENABLED", v23, 0];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v25 = v5;
      id v26 = [v25 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v51;
        uint64_t v29 = PSEnabledKey;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v51 != v28) {
              objc_enumerationMutation(v25);
            }
            v31 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            v32 = [v31 identifier];
            if (([v24 containsObject:v32] & 1) == 0) {
              [v31 setProperty:&__kCFBooleanFalse forKey:v29];
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v27);
      }

      v9 = v49;
      v11 = v48;
    }
    else if ([(DAVSettingsAccountsUIController *)self showDeleteButton])
    {
      v33 = [(DAVSettingsAccountsUIController *)self account];
      v34 = [v33 accountDescription];
      [(DAVSettingsAccountsUIController *)self setTitle:v34];

      v35 = +[PSSpecifier emptyGroupSpecifier];
      [v5 addObject:v35];

      v36 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_8298 table:@"Localizable"];
      v38 = +[PSSpecifier deleteButtonSpecifierWithName:v37 target:self action:"deleteAccountButtonTapped"];

      [v5 addObject:v38];
    }
  }
  if ([(DAVSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    v39 = [v5 specifierForID:@"ENABLED"];
    [v5 removeObject:v39];

    v40 = [v5 specifierForID:@"DAV_INFO"];
    [v5 removeObject:v40];

    if ([(DAVSettingsAccountsUIController *)self attemptedValidation])
    {
      if (([(DAVSettingsAccountsUIController *)self validatedSuccessfully] & 1) == 0
        && ([(DAVSettingsAccountsUIController *)self validationInProgress] & 1) != 0)
      {
        goto LABEL_29;
      }
    }
    if ([(DAVSettingsAccountsUIController *)self attemptedInitialValidation])
    {
LABEL_29:
      v41 = +[PSSpecifier emptyGroupSpecifier];
      [v5 addObject:v41];

      v42 = +[NSBundle bundleForClass:objc_opt_class()];
      v43 = [v42 localizedStringForKey:@"ADVANCED_SETTINGS" value:&stru_8298 table:@"Localizable"];
      v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      v45 = [(DAVSettingsAccountsUIController *)self account];
      [v44 setProperty:v45 forKey:@"DAVAdvancedControllerAccountKey"];

      [v5 addObject:v44];
    }
  }

  return v5;
}

- (BOOL)validateAccount
{
  v3 = [*(id *)&self->DASettingsAccountsUIController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v3 resignFirstResponder];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v5 = [v4 localizedStringForKey:@"VERIFYING" value:&stru_8298 table:@"Localizable"];
  [(DAVSettingsAccountsUIController *)self startValidationWithPrompt:v5];

  id v6 = [(DAVSettingsAccountsUIController *)self account];
  [v6 saveModifiedPropertiesOnBackingAccount];

  v7 = [(DAVSettingsAccountsUIController *)self account];
  id v8 = [(DAVSettingsAccountsUIController *)self accountStore];
  [v7 checkValidityOnAccountStore:v8 withConsumer:self inQueue:&_dispatch_main_q];

  return 1;
}

- (void)didConfirmTryWithoutSSL:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    BOOL v5 = [(DAVSettingsAccountsUIController *)self account];
    [v5 setUseSSL:0];
  }
  else
  {
    [(DAVSettingsAccountsUIController *)self reloadSpecifiers];
  }
  v6.receiver = self;
  v6.super_class = (Class)DAVSettingsAccountsUIController;
  [(DAVSettingsAccountsUIController *)&v6 didConfirmTryWithoutSSL:v3];
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v6)
  {
    v17 = DALoggingwithCategory();
    os_log_type_t v18 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v17, v18))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_0, v17, v18, "validation failed with error %@", (uint8_t *)&buf, 0xCu);
    }

    v19 = [(DAVSettingsAccountsUIController *)self account];
    if ([v19 useSSL])
    {
      v20 = [v9 domain];
      if (([v20 isEqualToString:DAAccountValidationDomain] & 1) == 0)
      {

LABEL_15:
        [(DAVSettingsAccountsUIController *)self showSSLFailureView];
        int v29 = 0;
        v23 = 0;
LABEL_16:
        [(DAVSettingsAccountsUIController *)self setAttemptedValidation:1];
        [(DAVSettingsAccountsUIController *)self setValidatedSuccessfully:0];
        [(DAVSettingsAccountsUIController *)self hideProgressWithPrompt:v23];
        if (!v29)
        {
LABEL_20:
          uint64_t v22 = 1;
          goto LABEL_21;
        }
        goto LABEL_17;
      }
      BOOL v21 = [v9 code] == (char *)&stru_20.flags + 2;

      if (!v21) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    id v25 = [v24 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED_FORMAT" value:&stru_8298 table:@"Localizable"];
    id v26 = +[NSBundle bundleForClass:objc_opt_class()];
    id v27 = [(DAVSettingsAccountsUIController *)self settingsPlistName];
    uint64_t v28 = [v26 localizedStringForKey:@"NEW_ACCOUNT_SETTINGS" value:&stru_8298 table:v27];
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v28);

    int v29 = 1;
    goto LABEL_16;
  }
  if ([(DAVSettingsAccountsUIController *)self accountNeedsAdd])
  {
    unint64_t v10 = [(DAVSettingsAccountsUIController *)self defaultDADataclassesToEnable];
    [v8 setEnabled:(v10 >> 1) & 1 forDADataclass:2];
    [v8 setEnabled:(v10 >> 3) & 1 forDADataclass:8];
    [v8 setEnabled:(v10 >> 2) & 1 forDADataclass:4];
    [v8 setEnabled:(v10 >> 4) & 1 forDADataclass:16];
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    char v36 = 1;
    v12 = [(DAVSettingsAccountsUIController *)self accountStore];
    v13 = [(DAVSettingsAccountsUIController *)self account];
    v14 = [v13 backingAccountInfo];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_3BB0;
    v31[3] = &unk_8258;
    p_long long buf = &buf;
    v15 = v11;
    v32 = v15;
    [v12 canSaveAccount:v14 withCompletionHandler:v31];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    int v16 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      [(DAVSettingsAccountsUIController *)self setAccountNeedsAdd:0];
      [(DAVSettingsAccountsUIController *)self setValidatedSuccessfully:1];
    }
    else
    {
      [(DAVSettingsAccountsUIController *)self showIdenticalAccountFailureView];
      [(DAVSettingsAccountsUIController *)self setAttemptedValidation:0];
    }

    _Block_object_dispose(&buf, 8);
    [(DAVSettingsAccountsUIController *)self hideProgressWithPrompt:0];
    v23 = 0;
    if (v16) {
      goto LABEL_20;
    }
LABEL_17:
    [(DAVSettingsAccountsUIController *)self reloadSpecifiers];
    uint64_t v22 = !v6;
    goto LABEL_21;
  }
  uint64_t v22 = 1;
  [(DAVSettingsAccountsUIController *)self setValidatedSuccessfully:1];
  [(DAVSettingsAccountsUIController *)self hideProgressWithPrompt:0];
  v23 = 0;
LABEL_21:
  [(DAVSettingsAccountsUIController *)self setAttemptedInitialValidation:v22];
  v30.receiver = self;
  v30.super_class = (Class)DAVSettingsAccountsUIController;
  [(DAVSettingsAccountsUIController *)&v30 account:v8 isValid:v22 & v6 validationError:v9];
}

- (BOOL)dismissesAfterInitialSetup
{
  return 1;
}

- (BOOL)haveEnoughValues
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = [*(id *)&self->DASettingsAccountsUIController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  unint64_t v5 = (unint64_t)v4;
  p_superclass = DAVSettingsDataclassConfigurationViewController.superclass;
  if (qword_D130)
  {
    if (v4)
    {
LABEL_3:
      uint64_t v7 = 0;
      while (1)
      {
        id v8 = [*(id *)&self->DASettingsAccountsUIController_opaque[v3] objectAtIndexedSubscript:v7];
        if (v7 == [(DAVSettingsAccountsUIController *)self indexOfCurrentlyEditingCell])
        {
          id v9 = [(DAVSettingsAccountsUIController *)self currentlyEditingCell];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v10 = p_superclass[38];
            dispatch_semaphore_t v11 = [v8 identifier];
            if ([(__objc2_class *)v10 containsObject:v11])
            {
              v12 = [v9 textField];
              v13 = [v12 text];
              id v14 = [v13 length];

              p_superclass = (__objc2_class **)(DAVSettingsDataclassConfigurationViewController + 8);
              goto LABEL_16;
            }
            char v16 = 1;
LABEL_17:

            goto LABEL_19;
          }
        }
        else
        {
          id v9 = [v8 identifier];
          if ([v9 isEqualToString:@"USERNAME"])
          {
            dispatch_semaphore_t v11 = [(DAVSettingsAccountsUIController *)self account];
            v15 = [v11 usernameWithoutDomain];
            goto LABEL_15;
          }
          if ([v9 isEqualToString:@"PASSWORD"])
          {
            dispatch_semaphore_t v11 = [(DAVSettingsAccountsUIController *)self account];
            v15 = [v11 passwordWithExpected:0];
            goto LABEL_15;
          }
          if ([v9 isEqualToString:@"HOST"])
          {
            dispatch_semaphore_t v11 = [(DAVSettingsAccountsUIController *)self account];
            v15 = [v11 host];
LABEL_15:
            v12 = v15;
            id v14 = [v15 length];
LABEL_16:
            char v16 = v14 != 0;

            goto LABEL_17;
          }
        }
        char v16 = 1;
LABEL_19:

        if (++v7 >= v5 || (v16 & 1) == 0) {
          return v16;
        }
      }
    }
  }
  else
  {
    p_superclass = DAVSettingsDataclassConfigurationViewController.superclass;
    id v17 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"HOST", @"USERNAME", @"PASSWORD", 0);
    os_log_type_t v18 = (void *)qword_D130;
    qword_D130 = (uint64_t)v17;

    if (v5) {
      goto LABEL_3;
    }
  }
  return 0;
}

- (void)_updateDescriptionFromServer:(id)a3
{
  id v27 = a3;
  id v4 = [(DAVSettingsAccountsUIController *)self account];
  uint64_t v5 = [v4 accountDescription];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    uint64_t v7 = [(DAVSettingsAccountsUIController *)self account];
    id v8 = [v7 accountDescription];
    id v9 = [(DAVSettingsAccountsUIController *)self account];
    unint64_t v10 = [v9 host];
    unsigned int v11 = [v8 isEqualToString:v10];

    v12 = v27;
    if (!v11) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v13 = DAAccountDescriptionFromHostname();
  id v14 = [(DAVSettingsAccountsUIController *)self accountStore];
  unsigned int v15 = [v14 hasAccountWithDescription:v13];

  if (v15)
  {
    id v16 = v27;

    v13 = v16;
  }
  id v17 = [(DAVSettingsAccountsUIController *)self account];
  [v17 setAccountDescription:v13];

  uint64_t v18 = OBJC_IVAR___PSListController__specifiers;
  id v19 = [*(id *)&self->DASettingsAccountsUIController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = 0;
    while (1)
    {
      uint64_t v22 = [*(id *)&self->DASettingsAccountsUIController_opaque[v18] objectAtIndexedSubscript:v21];
      v23 = [v22 identifier];

      if ([v23 isEqualToString:@"DESCRIPTION"]) {
        break;
      }

      if (v20 == (id)++v21) {
        goto LABEL_13;
      }
    }
    v24 = [(DAVSettingsAccountsUIController *)self table];
    id v25 = [(DAVSettingsAccountsUIController *)self indexPathForIndex:v21];
    id v26 = [v24 cellForRowAtIndexPath:v25];

    [v26 setValue:v27];
  }
LABEL_13:

  v12 = v27;
LABEL_14:
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  id v9 = [(DAVSettingsAccountsUIController *)self accountPropertyWithSpecifier:v7];
  unsigned int v10 = [v6 isEqualToString:v9];

  if (![v8 isEqualToString:@"HOST"] || (v10 & 1) != 0)
  {
    if (([v8 isEqualToString:@"USERNAME"] ^ 1 | v10))
    {
      if (([v8 isEqualToString:@"DESCRIPTION"] ^ 1 | v10))
      {
        v20.receiver = self;
        v20.super_class = (Class)DAVSettingsAccountsUIController;
        [(DAVSettingsAccountsUIController *)&v20 setAccountProperty:v6 withSpecifier:v7];
        goto LABEL_16;
      }
      if (![v6 length])
      {
        id v17 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v18 = [(DAVSettingsAccountsUIController *)self settingsPlistName];
        uint64_t v19 = [v17 localizedStringForKey:@"DESCRIPTION_PLACEHOLDER" value:&stru_8298 table:v18];

        id v6 = (id)v19;
      }
      v13 = [(DAVSettingsAccountsUIController *)self account];
      [v13 setAccountDescription:v6];
    }
    else
    {
      v13 = objc_msgSend(v6, "da_stringByAddingPercentEscapesForUsername");
      id v14 = [(DAVSettingsAccountsUIController *)self account];
      [v14 setUsername:v13];

      if (!self->_isReloadingProperties)
      {
        self->_isReloadingProperties = 1;
        unsigned int v15 = [(DAVSettingsAccountsUIController *)self currentlyEditingCell];
        id v16 = [(DAVSettingsAccountsUIController *)self accountPropertyWithSpecifier:v7];
        [v15 setValue:v16];

        [(DAVSettingsAccountsUIController *)self reloadSpecifierID:@"DESCRIPTION"];
        self->_isReloadingProperties = 0;
      }
      [(DAVSettingsAccountsUIController *)self setAttemptedValidation:0];
      [(DAVSettingsAccountsUIController *)self updateDoneButton];
    }

    goto LABEL_16;
  }
  [(DAVSettingsAccountsUIController *)self setHostString:v6];
  [(DAVSettingsAccountsUIController *)self _updateDescriptionFromServer:v6];
  if (!self->_isReloadingProperties)
  {
    self->_isReloadingProperties = 1;
    unsigned int v11 = [(DAVSettingsAccountsUIController *)self currentlyEditingCell];
    v12 = [(DAVSettingsAccountsUIController *)self accountPropertyWithSpecifier:v7];
    [v11 setValue:v12];

    [(DAVSettingsAccountsUIController *)self reloadSpecifierID:@"DESCRIPTION"];
    self->_isReloadingProperties = 0;
  }
  [(DAVSettingsAccountsUIController *)self setAttemptedValidation:0];
  [(DAVSettingsAccountsUIController *)self updateDoneButton];
LABEL_16:
  [(DAVSettingsAccountsUIController *)self setNeedsSave:1];
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if ([v5 isEqualToString:@"USERNAME"])
  {
    id v6 = [(DAVSettingsAccountsUIController *)self account];
    id v7 = [v6 username];

    id v8 = objc_msgSend(v7, "da_stringByRemovingPercentEscapesForUsername");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DAVSettingsAccountsUIController;
    id v8 = [(DAVSettingsAccountsUIController *)&v10 accountPropertyWithSpecifier:v4];
  }

  return v8;
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 BOOLValue];
  id v9 = [v7 identifier];
  if ([v9 isEqualToString:@"ENABLED"])
  {
    unsigned __int8 v10 = [(DAVSettingsAccountsUIController *)self defaultDADataclassesToEnable];
    unsigned int v11 = [(DAVSettingsAccountsUIController *)self account];
    [v11 setEnabled:v8 & ((v10 & 2) != 0) forDADataclass:2];

    v12 = [(DAVSettingsAccountsUIController *)self account];
    [v12 setEnabled:v8 & ((v10 & 8) != 0) forDADataclass:8];

    v13 = [(DAVSettingsAccountsUIController *)self account];
    [v13 setEnabled:v8 & ((v10 & 4) != 0) forDADataclass:4];

    id v14 = [(DAVSettingsAccountsUIController *)self account];
    [v14 setEnabled:v8 & ((v10 & 0x10) != 0) forDADataclass:16];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DAVSettingsAccountsUIController;
    [(DAVSettingsAccountsUIController *)&v15 setAccountBooleanProperty:v6 withSpecifier:v7];
  }
  [(DAVSettingsAccountsUIController *)self setNeedsSave:1];
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (![v5 isEqualToString:@"ENABLED"])
  {
    v16.receiver = self;
    v16.super_class = (Class)DAVSettingsAccountsUIController;
    uint64_t v9 = [(DAVSettingsAccountsUIController *)&v16 accountBooleanPropertyWithSpecifier:v4];
    goto LABEL_12;
  }
  unsigned __int8 v6 = [(DAVSettingsAccountsUIController *)self defaultDADataclassesToEnable];
  unsigned __int8 v7 = v6;
  if ((v6 & 2) != 0)
  {
    unsigned __int8 v10 = [(DAVSettingsAccountsUIController *)self account];
    id v8 = [v10 enabledForDADataclass:2];

    if ((v7 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v8 = 0;
  if ((v6 & 8) != 0)
  {
LABEL_7:
    unsigned int v11 = [(DAVSettingsAccountsUIController *)self account];
    id v8 = (id)(v8 | [v11 enabledForDADataclass:8]);
  }
LABEL_8:
  if ((v7 & 4) != 0)
  {
    objc_super v15 = [(DAVSettingsAccountsUIController *)self account];
    id v8 = (id)(v8 | [v15 enabledForDADataclass:4]);

    if ((v7 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((v7 & 0x10) != 0)
  {
LABEL_10:
    v12 = [(DAVSettingsAccountsUIController *)self account];
    id v8 = (id)(v8 | [v12 enabledForDADataclass:16]);
  }
LABEL_11:
  uint64_t v9 = +[NSNumber numberWithBool:v8];
LABEL_12:
  v13 = (void *)v9;

  return v13;
}

- (id)localizedValidationFailureTitleString
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(DAVSettingsAccountsUIController *)self settingsPlistName];
  uint64_t v5 = [v3 localizedStringForKey:@"DAV_ACCOUNT" value:&stru_8298 table:v4];

  return v5;
}

- (id)localizedConfirmSaveUnvalidatedAccountMessageString
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(DAVSettingsAccountsUIController *)self settingsPlistName];
  uint64_t v5 = [v3 localizedStringForKey:@"CONFIRM_SAVE_ACCOUNT_ANYWAYS_MESSAGE" value:&stru_8298 table:v4];

  return v5;
}

- (id)localizedAccountSetupTitleString
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(DAVSettingsAccountsUIController *)self settingsPlistName];
  uint64_t v5 = [v3 localizedStringForKey:@"NEW_ACCOUNT_SETTINGS" value:&stru_8298 table:v4];

  return v5;
}

- (id)acAccountTypeString
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DAVSettingsAccountsUIController.m" lineNumber:391 description:@"MUST be overridden in subclass"];

  return 0;
}

- (int64_t)defaultDADataclassesToEnable
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DAVSettingsAccountsUIController.m" lineNumber:392 description:@"MUST be overridden in subclass"];

  return 0;
}

- (id)settingsPlistName
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DAVSettingsAccountsUIController.m" lineNumber:393 description:@"MUST be overridden in subclass"];

  return 0;
}

- (BOOL)isReloadingProperties
{
  return self->_isReloadingProperties;
}

- (void)setIsReloadingProperties:(BOOL)a3
{
  self->_isReloadingProperties = a3;
}

- (BOOL)attemptedInitialValidation
{
  return self->_attemptedInitialValidation;
}

- (void)setAttemptedInitialValidation:(BOOL)a3
{
  self->_attemptedInitialValidation = a3;
}

@end
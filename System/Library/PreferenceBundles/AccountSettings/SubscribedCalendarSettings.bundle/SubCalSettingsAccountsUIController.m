@interface SubCalSettingsAccountsUIController
- (BOOL)_showingSecondarySpecifiers;
- (BOOL)broughtUpInitialKeyboard;
- (BOOL)haveEnoughValues;
- (BOOL)validateAccount;
- (NSArray)plistSpecifiers;
- (id)_primarySpecifiers;
- (id)_secondarySpecifiers;
- (id)accountBooleanPropertyWithSpecifier:(id)a3;
- (id)accountSpecifiers;
- (id)localizedAccountSetupTitleString;
- (id)localizedConfirmSaveUnvalidatedAccountMessageString;
- (id)localizedConfirmSaveUnvalidatedAccountTitleString;
- (id)localizedValidationFailureTitleString;
- (id)newDefaultAccount;
- (void)_insertSecondarySpecifiers;
- (void)_reloadHostDependentSepcifiers;
- (void)_setHostKeyboardForLoneSpecifierOnTraits:(id)a3;
- (void)_setHostKeyboardToDefaultOnTraits:(id)a3;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)cancelButtonTapped:(id)a3;
- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setBroughtUpInitialKeyboard:(BOOL)a3;
- (void)setPlistSpecifiers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SubCalSettingsAccountsUIController

- (void)_setHostKeyboardForLoneSpecifierOnTraits:(id)a3
{
  id v3 = a3;
  [v3 setReturnKeyType:4];
  [v3 setEnablesReturnKeyAutomatically:1];
}

- (void)_setHostKeyboardToDefaultOnTraits:(id)a3
{
  id v3 = a3;
  [v3 setReturnKeyType:0];
  [v3 setEnablesReturnKeyAutomatically:0];
}

- (NSArray)plistSpecifiers
{
  plistSpecifiers = self->_plistSpecifiers;
  if (!plistSpecifiers)
  {
    v4 = [(SubCalSettingsAccountsUIController *)self loadSpecifiersFromPlistName:@"SubCalAccountSetup" target:self];
    v5 = self->_plistSpecifiers;
    self->_plistSpecifiers = v4;

    plistSpecifiers = self->_plistSpecifiers;
  }

  return plistSpecifiers;
}

- (id)_primarySpecifiers
{
  v2 = [(SubCalSettingsAccountsUIController *)self plistSpecifiers];
  id v3 = objc_msgSend(v2, "subarrayWithRange:", 2, 2);

  return v3;
}

- (id)_secondarySpecifiers
{
  id v3 = [(SubCalSettingsAccountsUIController *)self plistSpecifiers];
  v4 = (char *)[v3 count] - 4;

  v5 = [(SubCalSettingsAccountsUIController *)self plistSpecifiers];
  v6 = objc_msgSend(v5, "subarrayWithRange:", 4, v4);

  return v6;
}

- (BOOL)_showingSecondarySpecifiers
{
  return (unint64_t)[*(id *)&self->DASettingsAccountsUIController_opaque[OBJC_IVAR___PSListController__specifiers] count] > 4;
}

- (void)_insertSecondarySpecifiers
{
  id v3 = [(SubCalSettingsAccountsUIController *)self specifierForID:@"HOST"];
  id v17 = [v3 properties];

  v4 = [v17 objectForKeyedSubscript:PSTableCellKey];
  v5 = [v4 textField];

  [(SubCalSettingsAccountsUIController *)self _setHostKeyboardToDefaultOnTraits:v5];
  v6 = [(SubCalSettingsAccountsUIController *)self account];
  v7 = [v6 accountDescription];
  id v8 = [v7 length];

  if (!v8)
  {
    v9 = [(SubCalSettingsAccountsUIController *)self account];
    v10 = [v9 host];

    v11 = DAAccountDescriptionFromHostname();
    v12 = [(SubCalSettingsAccountsUIController *)self accountStore];
    unsigned int v13 = [v12 hasAccountWithDescription:v11];

    if (v13)
    {
      id v14 = v10;

      v11 = v14;
    }
    v15 = [(SubCalSettingsAccountsUIController *)self account];
    [v15 setAccountDescription:v11];
  }
  v16 = [(SubCalSettingsAccountsUIController *)self _secondarySpecifiers];
  [(SubCalSettingsAccountsUIController *)self insertContiguousSpecifiers:v16 afterSpecifierID:@"HOST" animated:1];
}

- (id)newDefaultAccount
{
  v2 = [(SubCalSettingsAccountsUIController *)self accountStore];
  id v3 = [v2 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSubscribedCalendar];

  id v4 = [objc_alloc((Class)ACAccount) initWithAccountType:v3];
  v5 = [v3 supportedDataclasses];
  id v6 = [v5 mutableCopy];

  [v4 setProvisionedDataclasses:v6];
  v7 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v4];
  [v7 setEnabled:1 forDADataclass:4];

  return v7;
}

- (id)accountSpecifiers
{
  id v3 = [(SubCalSettingsAccountsUIController *)self plistSpecifiers];
  if ([(SubCalSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    [v4 localizedStringForKey:@"NEW_ACCOUNT_SETTINGS" value:&stru_82D0 table:@"SubCalAccountSetup"];
  }
  else
  {
    id v4 = [(SubCalSettingsAccountsUIController *)self account];
    [v4 accountDescription];
  v5 = };
  [(SubCalSettingsAccountsUIController *)self setTitle:v5];

  if ([(SubCalSettingsAccountsUIController *)self isSettingUpNewAccount]
    && ([(SubCalSettingsAccountsUIController *)self attemptedValidation] & 1) == 0)
  {
    v36 = [(SubCalSettingsAccountsUIController *)self _primarySpecifiers];
  }
  else
  {
    id v6 = [(SubCalSettingsAccountsUIController *)self plistSpecifiers];
    id v7 = [v6 mutableCopy];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"SUBCAL_INFO" value:&stru_82D0 table:@"SubCalAccountSetup"];
    v10 = +[PSSpecifier groupSpecifierWithName:v9];
    [v7 setObject:v10 atIndexedSubscript:2];

    if ([(SubCalSettingsAccountsUIController *)self isSettingUpNewAccount])
    {
      objc_msgSend(v7, "subarrayWithRange:", 3, (char *)objc_msgSend(v7, "count") - 3);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = [(SubCalSettingsAccountsUIController *)self account];
      unsigned int v13 = [v12 accountDescription];
      [(SubCalSettingsAccountsUIController *)self setTitle:v13];

      id v14 = +[DADiagnosticsPSController linkSpecifier];
      if (v14)
      {
        v15 = +[PSSpecifier emptyGroupSpecifier];
        [v7 addObject:v15];

        [v7 addObject:v14];
      }
      if ([(SubCalSettingsAccountsUIController *)self accountIsManaged])
      {
        v43 = v14;
        v16 = [(SubCalSettingsAccountsUIController *)self account];
        id v17 = [v16 backingAccountInfo];
        v18 = [v17 mcBackingProfile];

        if (v18)
        {
          v19 = +[NSBundle bundleForClass:objc_opt_class()];
          v20 = [v19 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_82D0 table:@"SubCalAccountSetup"];
          v21 = [v18 friendlyName];
          v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);

          v23 = [(SubCalSettingsAccountsUIController *)self lastGroupSpecifierInSpecifiers:v7];
          if (!v23)
          {
            v24 = DALoggingwithCategory();
            os_log_type_t v25 = _CPLog_to_os_log_type[3];
            if (os_log_type_enabled(v24, v25))
            {
              *(_DWORD *)buf = 138412290;
              id v51 = v7;
              _os_log_impl(&dword_0, v24, v25, "No group found, not setting the profile text.  Specifiers: %@", buf, 0xCu);
            }
          }
          [v23 setProperty:v22 forKey:PSFooterTextGroupKey];
        }
        v42 = v18;
        v26 = +[NSSet setWithObjects:@"HOST", 0];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v44 = v7;
        id v27 = v7;
        id v28 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v46;
          uint64_t v31 = PSEnabledKey;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v46 != v30) {
                objc_enumerationMutation(v27);
              }
              v33 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v34 = [v33 identifier];
              unsigned int v35 = [v26 containsObject:v34];

              if (v35) {
                [v33 setProperty:&__kCFBooleanFalse forKey:v31];
              }
            }
            id v29 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
          }
          while (v29);
        }

        id v14 = v43;
        id v7 = v44;
      }
      else
      {
        v37 = +[PSSpecifier emptyGroupSpecifier];
        [v7 addObject:v37];

        v38 = +[NSBundle bundleForClass:objc_opt_class()];
        v39 = [v38 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_82D0 table:@"Localizable"];
        v40 = +[PSSpecifier deleteButtonSpecifierWithName:v39 target:self action:"deleteAccountButtonTapped"];

        [v7 addObject:v40];
      }

      id v11 = v7;
    }
    v36 = v11;
  }

  return v36;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SubCalSettingsAccountsUIController;
  [(SubCalSettingsAccountsUIController *)&v8 viewDidAppear:a3];
  if ([(SubCalSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    if (![(SubCalSettingsAccountsUIController *)self broughtUpInitialKeyboard])
    {
      [(SubCalSettingsAccountsUIController *)self setBroughtUpInitialKeyboard:1];
      id v4 = [(SubCalSettingsAccountsUIController *)self specifierForID:@"HOST"];
      v5 = [v4 properties];

      id v6 = [v5 objectForKeyedSubscript:PSTableCellKey];
      id v7 = [v6 editableTextField];
      [(SubCalSettingsAccountsUIController *)self _setHostKeyboardForLoneSpecifierOnTraits:v7];
      [v6 becomeFirstResponder];
    }
  }
}

- (BOOL)validateAccount
{
  id v3 = [*(id *)&self->DASettingsAccountsUIController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v3 resignFirstResponder];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"VERIFYING" value:&stru_82D0 table:@"Localizable"];
  [(SubCalSettingsAccountsUIController *)self startValidationWithPrompt:v5];

  id v6 = [(SubCalSettingsAccountsUIController *)self account];
  if (([v6 useSSL] & 1) == 0)
  {
    if ([(SubCalSettingsAccountsUIController *)self _showingSecondarySpecifiers]) {
      [v6 setAllowInsecureConnection:1];
    }
    else {
      [v6 setUseSSL:1];
    }
  }
  id v7 = [(SubCalSettingsAccountsUIController *)self accountStore];
  [v6 checkValidityOnAccountStore:v7 withConsumer:self inQueue:&_dispatch_main_q];

  return 1;
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v41 = v6;
  if (!v6)
  {
    v10 = DALoggingwithCategory();
    os_log_type_t v11 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v10, v11))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_0, v10, v11, "validation failed with error %@", (uint8_t *)&buf, 0xCu);
    }

    [(SubCalSettingsAccountsUIController *)self setValidatedSuccessfully:0];
    if (![v9 isSubCalAuthError])
    {
      v18 = [(SubCalSettingsAccountsUIController *)self account];
      unsigned int v19 = [v18 useSSL];

      if (v19)
      {
        [(SubCalSettingsAccountsUIController *)self showSSLFailureView];
        v20 = 0;
      }
      else
      {
        id v28 = +[NSBundle bundleForClass:objc_opt_class()];
        v20 = [v28 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_82D0 table:@"SubCalAccountSetup"];
      }
LABEL_24:
      if (![(SubCalSettingsAccountsUIController *)self _showingSecondarySpecifiers]) {
        [(SubCalSettingsAccountsUIController *)self _insertSecondarySpecifiers];
      }
      goto LABEL_26;
    }
    v12 = [v8 username];
    if ([v12 length])
    {
      unsigned int v13 = [v8 passwordWithExpected:0];
      BOOL v14 = [v13 length] == 0;

      if (!v14)
      {
        v15 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v16 = [v15 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_82D0 table:@"SubCalAccountSetup"];
        goto LABEL_22;
      }
    }
    else
    {
    }
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"ACCOUNT_VERIFICATION_AUTH_CHALLENGE" value:&stru_82D0 table:@"SubCalAccountSetup"];
LABEL_22:
    v20 = (void *)v16;

    if (![(SubCalSettingsAccountsUIController *)self _showingSecondarySpecifiers])
    {
      id v29 = [(SubCalSettingsAccountsUIController *)self account];
      [v29 setUseSSL:1];

      [(SubCalSettingsAccountsUIController *)self _insertSecondarySpecifiers];
    }
    goto LABEL_24;
  }
  if ([(SubCalSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    if ([(SubCalSettingsAccountsUIController *)self _showingSecondarySpecifiers])
    {
      [(SubCalSettingsAccountsUIController *)self reloadSpecifierID:@"DESCRIPTION" animated:1];
      [(SubCalSettingsAccountsUIController *)self reloadSpecifierID:@"USE_SSL" animated:1];
    }
    else
    {
      [(SubCalSettingsAccountsUIController *)self _insertSecondarySpecifiers];
    }
    if ([(SubCalSettingsAccountsUIController *)self accountNeedsAdd])
    {
      v21 = [(SubCalSettingsAccountsUIController *)self account];
      [v21 setEnabled:1 forDADataclass:4];

      v22 = [(SubCalSettingsAccountsUIController *)self account];
      [v22 saveTmpICSData];

      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v48 = 0x2020000000;
      char v49 = 1;
      v24 = [(SubCalSettingsAccountsUIController *)self accountStore];
      os_log_type_t v25 = [(SubCalSettingsAccountsUIController *)self account];
      v26 = [v25 backingAccountInfo];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_5320;
      v43[3] = &unk_8210;
      p_long long buf = &buf;
      id v27 = v23;
      id v44 = v27;
      [v24 canSaveAccount:v26 withCompletionHandler:v43];

      dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v17 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        [(SubCalSettingsAccountsUIController *)self setAccountNeedsAdd:0];
        [(SubCalSettingsAccountsUIController *)self setValidatedSuccessfully:1];
      }
      else
      {
        [(SubCalSettingsAccountsUIController *)self showIdenticalAccountFailureView];
        [(SubCalSettingsAccountsUIController *)self setAttemptedValidation:0];
      }

      _Block_object_dispose(&buf, 8);
      goto LABEL_29;
    }
    v20 = 0;
LABEL_26:
    BOOL v17 = 1;
    goto LABEL_30;
  }
  BOOL v17 = 1;
  [(SubCalSettingsAccountsUIController *)self setValidatedSuccessfully:1];
LABEL_29:
  v20 = 0;
LABEL_30:
  if ([v20 length])
  {
    uint64_t v30 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v31 = [v30 localizedStringForKey:@"OK" value:&stru_82D0 table:@"Localizable"];
    long long v46 = v31;
    v32 = +[NSArray arrayWithObjects:&v46 count:1];
    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"SUBCAL_ACCOUNT" value:&stru_82D0 table:@"SubCalAccountSetup"];
    [(SubCalSettingsAccountsUIController *)self showAlertWithButtons:v32 title:v34 message:v20 completion:0];
  }
  unsigned int v35 = +[NSBundle bundleForClass:objc_opt_class()];
  v36 = [v35 localizedStringForKey:@"NEW_ACCOUNT_SETTINGS" value:&stru_82D0 table:@"SubCalAccountSetup"];
  [(SubCalSettingsAccountsUIController *)self stopValidationWithPrompt:v36 showButtons:1];

  v37 = [(SubCalSettingsAccountsUIController *)self specifierForID:@"HOST"];
  v38 = [v37 properties];

  v39 = [v38 objectForKeyedSubscript:PSTableCellKey];
  v40 = [v39 textField];
  [v40 setEnabled:1];

  v42.receiver = self;
  v42.super_class = (Class)SubCalSettingsAccountsUIController;
  [(SubCalSettingsAccountsUIController *)&v42 account:v8 isValid:v17 & v41 validationError:v9];
}

- (BOOL)haveEnoughValues
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = [*(id *)&self->DASettingsAccountsUIController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  unint64_t v5 = (unint64_t)v4;
  if (qword_CB48 == -1)
  {
    if (v4)
    {
LABEL_3:
      uint64_t v6 = 0;
      id v7 = &DAAccountDescriptionFromHostname_ptr;
      unint64_t v19 = v5;
      while (1)
      {
        id v8 = [*(id *)&self->DASettingsAccountsUIController_opaque[v3] objectAtIndexedSubscript:v6];
        if (v6 == [(SubCalSettingsAccountsUIController *)self indexOfCurrentlyEditingCell])
        {
          id v9 = [(SubCalSettingsAccountsUIController *)self currentlyEditingCell];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          v10 = (void *)qword_CB40;
          os_log_type_t v11 = [v8 identifier];
          if (![v10 containsObject:v11])
          {
            char v17 = 1;
            goto LABEL_13;
          }
          v12 = [v9 textField];
          [v12 text];
          uint64_t v13 = v3;
          v15 = BOOL v14 = v7;
          id v16 = [v15 length];

          id v7 = v14;
          uint64_t v3 = v13;
          unint64_t v5 = v19;
        }
        else
        {
          id v9 = [v8 identifier];
          if (![v9 isEqualToString:@"HOST"])
          {
LABEL_11:
            char v17 = 1;
            goto LABEL_14;
          }
          os_log_type_t v11 = [(SubCalSettingsAccountsUIController *)self account];
          v12 = [v11 host];
          id v16 = [v12 length];
        }
        char v17 = v16 != 0;

LABEL_13:
LABEL_14:

        if (++v6 >= v5 || (v17 & 1) == 0) {
          return v17;
        }
      }
    }
  }
  else
  {
    dispatch_once(&qword_CB48, &stru_8250);
    if (v5) {
      goto LABEL_3;
    }
  }
  return 0;
}

- (void)_reloadHostDependentSepcifiers
{
  [(SubCalSettingsAccountsUIController *)self reloadSpecifierID:@"HOST" animated:1];
  uint64_t v3 = [(SubCalSettingsAccountsUIController *)self account];
  id v4 = [v3 username];

  if (!v4)
  {
LABEL_4:
    [(SubCalSettingsAccountsUIController *)self reloadSpecifierID:@"USE_SSL" animated:1];
    return;
  }
  if ([(SubCalSettingsAccountsUIController *)self _showingSecondarySpecifiers])
  {
    [(SubCalSettingsAccountsUIController *)self reloadSpecifierID:@"USERNAME" animated:1];
    [(SubCalSettingsAccountsUIController *)self reloadSpecifierID:@"PASSWORD" animated:1];
    goto LABEL_4;
  }

  [(SubCalSettingsAccountsUIController *)self _insertSecondarySpecifiers];
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  id v9 = [(SubCalSettingsAccountsUIController *)self accountPropertyWithSpecifier:v7];
  unsigned int v10 = [v6 isEqualToString:v9];

  if ([v8 isEqualToString:@"HOST"])
  {
    os_log_type_t v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    v12 = [v6 stringByTrimmingCharactersInSet:v11];

    uint64_t v13 = [(SubCalSettingsAccountsUIController *)self account];
    [v13 setHost:v12];

    if (v12)
    {
      BOOL v14 = [(SubCalSettingsAccountsUIController *)self account];
      v15 = [v14 host];
      unsigned __int8 v16 = [v12 isEqualToString:v15];

      if ((v16 & 1) == 0) {
        [(SubCalSettingsAccountsUIController *)self _reloadHostDependentSepcifiers];
      }
    }
    [(SubCalSettingsAccountsUIController *)self updateDoneButton];
LABEL_11:

    goto LABEL_12;
  }
  if ((([v8 isEqualToString:@"DESCRIPTION"] ^ 1 | v10) & 1) == 0)
  {
    if (![v6 length])
    {
      char v17 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v18 = [v17 localizedStringForKey:@"DESCRIPTION_PLACEHOLDER" value:&stru_82D0 table:@"SubCalAccountSetup"];

      id v6 = (id)v18;
    }
    v12 = [(SubCalSettingsAccountsUIController *)self account];
    [v12 setAccountDescription:v6];
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)SubCalSettingsAccountsUIController;
  [(SubCalSettingsAccountsUIController *)&v19 setAccountProperty:v6 withSpecifier:v7];
LABEL_12:
  [(SubCalSettingsAccountsUIController *)self setNeedsSave:1];
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  id v9 = [v7 identifier];
  [(SubCalSettingsAccountsUIController *)self setNeedsSave:1];
  if ([v9 isEqualToString:@"REMOVE_ALARMS"])
  {
    unsigned int v10 = [(SubCalSettingsAccountsUIController *)self account];
    [v10 setShouldRemoveAlarms:v8];
  }
  else
  {
    if (![v9 isEqualToString:@"ENABLED"])
    {
      v11.receiver = self;
      v11.super_class = (Class)SubCalSettingsAccountsUIController;
      [(SubCalSettingsAccountsUIController *)&v11 setAccountBooleanProperty:v6 withSpecifier:v7];
      goto LABEL_7;
    }
    unsigned int v10 = [(SubCalSettingsAccountsUIController *)self account];
    [v10 setEnabled:v8 forDADataclass:4];
  }

LABEL_7:
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 identifier];
  if ([v5 isEqualToString:@"REMOVE_ALARMS"])
  {
    id v6 = [(SubCalSettingsAccountsUIController *)self account];
    id v7 = [v6 shouldRemoveAlarms];
LABEL_5:
    id v8 = v7;

    uint64_t v9 = +[NSNumber numberWithBool:v8];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"ENABLED"])
  {
    id v6 = [(SubCalSettingsAccountsUIController *)self account];
    id v7 = [v6 enabledForDADataclass:4];
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)SubCalSettingsAccountsUIController;
  uint64_t v9 = [(SubCalSettingsAccountsUIController *)&v12 accountBooleanPropertyWithSpecifier:v4];
LABEL_7:
  unsigned int v10 = (void *)v9;

  return v10;
}

- (void)cancelButtonTapped:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SubCalSettingsAccountsUIController *)self account];
  [v5 clearTmpICSData];

  v6.receiver = self;
  v6.super_class = (Class)SubCalSettingsAccountsUIController;
  [(SubCalSettingsAccountsUIController *)&v6 cancelButtonTapped:v4];
}

- (id)localizedValidationFailureTitleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"SUBCAL_ACCOUNT" value:&stru_82D0 table:@"SubCalAccountSetup"];

  return v3;
}

- (id)localizedConfirmSaveUnvalidatedAccountTitleString
{
  return [(SubCalSettingsAccountsUIController *)self localizedValidationFailureTitleString];
}

- (id)localizedConfirmSaveUnvalidatedAccountMessageString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"CONFIRM_SAVE_ACCOUNT_ANYWAYS_MESSAGE" value:&stru_82D0 table:@"SubCalAccountSetup"];

  return v3;
}

- (id)localizedAccountSetupTitleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"NEW_ACCOUNT_SETTINGS" value:&stru_82D0 table:@"SubCalAccountSetup"];

  return v3;
}

- (BOOL)broughtUpInitialKeyboard
{
  return self->_broughtUpInitialKeyboard;
}

- (void)setBroughtUpInitialKeyboard:(BOOL)a3
{
  self->_broughtUpInitialKeyboard = a3;
}

- (void)setPlistSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
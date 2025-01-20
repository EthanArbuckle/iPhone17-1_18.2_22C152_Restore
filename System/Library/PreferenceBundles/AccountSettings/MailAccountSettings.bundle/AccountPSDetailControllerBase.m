@interface AccountPSDetailControllerBase
+ (id)normalizeAccountProperties:(id)a3 withAccountClass:(Class)a4;
- (BOOL)haveEnoughValues;
- (Class)accountClass;
- (MFAccount)account;
- (MFAccountValidator)accountValidator;
- (NSDictionary)accountValuesAfterFailedValidation;
- (NSMutableDictionary)accountValues;
- (NSMutableDictionary)originalAccountValues;
- (id)existingAccountForAccountValues:(id)a3;
- (id)fixAccountInputValues:(id)a3;
- (id)setOfKeysForAlteredValuesInDictionary:(id)a3 originalDictionary:(id)a4;
- (int64_t)validateAccount;
- (int64_t)validateAccount:(id)a3 withFallbacks:(BOOL)a4;
- (int64_t)validateAccountUsingFallbacks;
- (void)_presentAlertForAccount:(id)a3 accountValidator:(id)a4 error:(id)a5;
- (void)_promptUserForWebLoginForAccount:(id)a3 accountValidator:(id)a4 error:(id)a5;
- (void)_redirectToRecoveryURL:(id)a3;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)cancelAccountValidation;
- (void)dealloc;
- (void)displaySSLAlertForAccount:(id)a3 accountValidator:(id)a4;
- (void)displaySaveAccountAnywaysAlertSheet;
- (void)doneButtonClickedForExistingAccount;
- (void)doneButtonClickedForNewAccount;
- (void)doneButtonTapped:(id)a3;
- (void)handleSSLAlertForAccount:(id)a3 accountValidator:(id)a4 attemptWithoutSSL:(BOOL)a5;
- (void)setAccount:(id)a3;
- (void)setAccountValidator:(id)a3;
- (void)setAccountValues:(id)a3;
- (void)setAccountValuesAfterFailedValidation:(id)a3;
- (void)setOriginalAccountValues:(id)a3;
- (void)setViewsEnabled:(BOOL)a3;
- (void)suspend;
- (void)viewDidLoad;
@end

@implementation AccountPSDetailControllerBase

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)AccountPSDetailControllerBase;
  [(AccountPSDetailControllerBase *)&v27 viewDidLoad];
  v3 = *(void **)&self->ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier];
  if (!v3) {
    sub_7B508();
  }
  v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"values"];
  v6 = v5;
  if (v5)
  {
    v7 = (NSMutableDictionary *)[v5 mutableCopy];
    accountValues = self->_accountValues;
    self->_accountValues = v7;
  }
  v9 = [v4 objectForKey:@"originalValues"];

  if (v9)
  {
    v10 = (NSMutableDictionary *)[v9 mutableCopy];
    originalAccountValues = self->_originalAccountValues;
    self->_originalAccountValues = v10;
  }
  v12 = [(AccountPSDetailControllerBase *)self account];

  if (v12)
  {
    if (!self->_accountValues)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_accountValues;
      self->_accountValues = v13;

      v15 = [(AccountPSDetailControllerBase *)self account];
      uint64_t v16 = *(void *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers];
      v17 = [(AccountPSDetailControllerBase *)self accountValues];
      [v15 copyAccountPropertiesForSpecifiers:v16 intoDictionary:v17];
    }
    if (!self->_originalAccountValues)
    {
      v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v19 = self->_originalAccountValues;
      self->_originalAccountValues = v18;

      v20 = [(AccountPSDetailControllerBase *)self account];
      uint64_t v21 = *(void *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers];
      v22 = [(AccountPSDetailControllerBase *)self originalAccountValues];
      [v20 copyAccountPropertiesForSpecifiers:v21 intoDictionary:v22];
    }
  }
  v23 = [(AccountPSDetailControllerBase *)self navigationItem];
  v24 = [v23 title];
  initialTitle = self->_initialTitle;
  self->_initialTitle = v24;

  v26 = [(AccountPSDetailControllerBase *)self navigationItem];
  [v26 setHidesBackButton:1];
}

- (void)dealloc
{
  [(MFAccountValidator *)self->_accountValidator setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)AccountPSDetailControllerBase;
  [(AccountPSDetailControllerBase *)&v3 dealloc];
}

- (void)doneButtonTapped:(id)a3
{
  [(AccountPSDetailControllerBase *)self setTaskCompletionAssertionEnabled:1];
  v4 = [*(id *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v4 resignFirstResponder];

  if (self->_account)
  {
    [(AccountPSDetailControllerBase *)self doneButtonClickedForExistingAccount];
  }
  else
  {
    [(AccountPSDetailControllerBase *)self doneButtonClickedForNewAccount];
  }
}

- (void)suspend
{
  if (*((unsigned char *)self + 232)) {
    [(AccountPSDetailControllerBase *)self cancelAccountValidation];
  }
  v3.receiver = self;
  v3.super_class = (Class)AccountPSDetailControllerBase;
  [(AccountPSDetailControllerBase *)&v3 suspend];
}

- (Class)accountClass
{
  v2 = [(AccountPSDetailControllerBase *)self account];
  objc_super v3 = objc_opt_class();

  return (Class)v3;
}

- (int64_t)validateAccount
{
  return [(AccountPSDetailControllerBase *)self validateAccount:self->_account withFallbacks:0];
}

- (int64_t)validateAccountUsingFallbacks
{
  return [(AccountPSDetailControllerBase *)self validateAccount:self->_account withFallbacks:1];
}

- (int64_t)validateAccount:(id)a3 withFallbacks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1B5A0;
  v16[3] = &unk_B8E88;
  v16[4] = self;
  v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:v16];

  v8 = [(AccountPSDetailControllerBase *)self accountValidator];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)[(id)objc_opt_class() accountValidatorClass]);
    [(AccountPSDetailControllerBase *)self setAccountValidator:v9];
  }
  v10 = [(AccountPSDetailControllerBase *)self accountValidator];

  char v11 = *((unsigned char *)self + 232);
  if (v10)
  {
    *((unsigned char *)self + 232) = v11 | 1;
    v12 = [(AccountPSDetailControllerBase *)self accountValidator];
    [v12 setDelegate:self];

    [(AccountPSDetailControllerBase *)self accountValidator];
    if (v4) {
      v13 = {;
    }
      [v13 validateAccount:v6 useSSL:1];
    }
    else {
      v13 = {;
    }
      [v13 validateAccountWithoutFallbacks:v6];
    }

    *((unsigned char *)self + 232) |= 2u;
    int64_t v14 = 2;
  }
  else
  {
    *((unsigned char *)self + 232) = v11 & 0xFE;
    int64_t v14 = 3;
  }

  return v14;
}

- (id)setOfKeysForAlteredValuesInDictionary:(id)a3 originalDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v29 = objc_alloc_init((Class)NSMutableSet);
  id v7 = objc_alloc((Class)NSSet);
  v8 = [v5 allKeys];
  id v27 = [v7 initWithArray:v8];

  id v9 = objc_alloc((Class)NSMutableSet);
  v10 = [v6 allKeys];
  id v11 = [v9 initWithArray:v10];

  v28 = v11;
  [v11 intersectSet:v27];
  id v12 = objc_alloc((Class)NSMutableSet);
  v13 = [v6 allKeys];
  id v14 = [v12 initWithArray:v13];

  v26 = v14;
  [v14 unionSet:v27];
  [v14 minusSet:v28];
  v15 = [v14 allObjects];
  [v29 addObjectsFromArray:v15];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v16 = [v28 allObjects];
  id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v31;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v21 = [v5 objectForKey:v20];

        if (v21)
        {
          v22 = [v6 objectForKey:v20];
          v23 = [v5 objectForKey:v20];
          unsigned __int8 v24 = [v22 isEqual:v23];

          if ((v24 & 1) == 0) {
            [v29 addObject:v20];
          }
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }

  return v29;
}

- (void)setViewsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OBJC_IVAR___PSListController__table;
  if (!a3)
  {
    id v6 = [*(id *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
    if ([v6 resignFirstResponder]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    lastFirstResponder = self->_lastFirstResponder;
    self->_lastFirstResponder = v7;
  }
  [*(id *)&self->ACUIViewController_opaque[v5] setUserInteractionEnabled:v3];
  id v9 = (char *)[*(id *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      id v12 = *(void **)&self->ACUIViewController_opaque[v5];
      v13 = [(AccountPSDetailControllerBase *)self indexPathForIndex:i];
      id v14 = [v12 cellForRowAtIndexPath:v13];

      if (v14) {
        [v14 setUserInteractionEnabled:v3];
      }
    }
  }
  if (v3)
  {
    v15 = self->_lastFirstResponder;
    if (v15)
    {
      [(UIResponder *)v15 becomeFirstResponder];
    }
  }
}

- (id)fixAccountInputValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AccountPSDetailControllerBase *)self accountClass];
  id v6 = [(id)objc_opt_class() normalizeAccountProperties:v4 withAccountClass:v5];
  uint64_t v7 = MailAccountHostname;
  v8 = [v6 objectForKey:MailAccountHostname];
  id v9 = v8;
  if (v8)
  {
    v10 = (char *)[v8 rangeOfString:@":"];
    id v11 = v10;
    if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = [v9 substringFromIndex:v10 + 1];
      id v13 = [v12 integerValue];

      uint64_t v14 = [v9 substringToIndex:v11];

      [v6 setObject:v14 forKey:v7];
      v15 = +[NSNumber numberWithInteger:v13];
      [v6 setObject:v15 forKey:MailAccountPortNumber];

      id v9 = (void *)v14;
    }
  }
  if ([(objc_class *)v5 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v16 = [v6 objectForKey:MFMailAccountUsername];

    if (v16) {
      [v6 setObject:@"YES" forKey:DeliveryAccountShouldUseAuthentication];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = MailAccountPassword;
    uint64_t v18 = [v6 objectForKey:MailAccountPassword];
    unsigned int v19 = [v18 isEqualToString:@"********"];

    if (v19) {
      [v6 removeObjectForKey:v17];
    }
  }

  return v6;
}

- (id)existingAccountForAccountValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:MailAccountHostname];
  if (![v5 length])
  {
    id v6 = [(AccountPSDetailControllerBase *)self account];
    uint64_t v7 = [v6 hostname];

    uint64_t v5 = (void *)v7;
  }
  v8 = [v4 objectForKey:MFMailAccountUsername];
  id v9 = [(AccountPSDetailControllerBase *)self accountClass];
  v10 = v9;
  if (!v5)
  {
    uint64_t v5 = [(objc_class *)v9 hostname];
  }
  id v11 = NSStringFromClass(v10);
  id v12 = [(objc_class *)v10 existingAccountWithType:v11 hostname:v5 username:v8];

  return v12;
}

- (BOOL)haveEnoughValues
{
  return 1;
}

- (void)doneButtonClickedForNewAccount
{
  if ((*((unsigned char *)self + 232) & 2) == 0)
  {
    if ((*((unsigned char *)self + 232) & 1) == 0
      && [(AccountPSDetailControllerBase *)self haveEnoughValues])
    {
      *((unsigned char *)self + 232) |= 1u;
      [(AccountPSDetailControllerBase *)self setViewsEnabled:0];
      [(AccountPSDetailControllerBase *)self validateForNewAccount];
    }
    return;
  }
  BOOL v3 = [(AccountPSDetailControllerBase *)self accountValuesAfterFailedValidation];

  if (!v3) {
    goto LABEL_12;
  }
  id v4 = [(AccountPSDetailControllerBase *)self accountValues];
  uint64_t v5 = [(AccountPSDetailControllerBase *)self accountValuesAfterFailedValidation];
  id v8 = [(AccountPSDetailControllerBase *)self setOfKeysForAlteredValuesInDictionary:v4 originalDictionary:v5];

  if (!v8)
  {
LABEL_12:
    id v8 = 0;
    goto LABEL_13;
  }
  id v6 = [(objc_class *)[(AccountPSDetailControllerBase *)self accountClass] propertiesWhichRequireValidation];
  unsigned int v7 = [v6 intersectsSet:v8];

  if (!v7)
  {
LABEL_13:
    [(AccountPSDetailControllerBase *)self displaySaveAccountAnywaysAlertSheet];
    goto LABEL_14;
  }
  [(AccountPSDetailControllerBase *)self validateForNewAccount];
LABEL_14:
}

- (void)doneButtonClickedForExistingAccount
{
  BOOL v3 = [(AccountPSDetailControllerBase *)self accountValuesAfterFailedValidation];

  if (v3)
  {
    id v4 = [(AccountPSDetailControllerBase *)self accountValues];
    uint64_t v5 = [(AccountPSDetailControllerBase *)self accountValuesAfterFailedValidation];
    id v6 = [(AccountPSDetailControllerBase *)self setOfKeysForAlteredValuesInDictionary:v4 originalDictionary:v5];

    if ([v6 count]) {
      *((unsigned char *)self + 232) &= ~2u;
    }
  }
  unsigned int v7 = [(AccountPSDetailControllerBase *)self account];
  [v7 removeValueInAccountPropertiesForKey:MFHealAccountDateLastFetched];

  id v8 = [(AccountPSDetailControllerBase *)self account];
  [v8 removeValueInAccountPropertiesForKey:MFHealAccountShouldShowAlert];

  if ((*((unsigned char *)self + 232) & 2) != 0)
  {
    [(AccountPSDetailControllerBase *)self displaySaveAccountAnywaysAlertSheet];
  }
  else
  {
    [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
    id v9 = [(AccountPSDetailControllerBase *)self setOfKeysForAlteredValuesInDictionary:self->_accountValues originalDictionary:self->_originalAccountValues];
    v10 = [(AccountPSDetailControllerBase *)self account];
    id v11 = [(id)objc_opt_class() propertiesWhichRequireValidation];
    unsigned int v12 = [v11 intersectsSet:v9];

    if (v12)
    {
      if ([v9 containsObject:MailAccountHostname])
      {
        uint64_t v13 = MailAccountPassword;
        if (([v9 containsObject:MailAccountPassword] & 1) == 0)
        {
          [(NSMutableDictionary *)self->_accountValues setValue:&stru_B9F70 forKey:v13];
          uint64_t v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [(AccountPSDetailControllerBase *)self account];
            int v19 = 138412290;
            uint64_t v20 = v15;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "#Warning Reset password because host was changed, account %@ ", (uint8_t *)&v19, 0xCu);
          }
        }
      }
      [(AccountPSDetailControllerBase *)self validateForExistingAccount];
    }
    else
    {
      if ([v9 count]) {
        [(AccountPSDetailControllerBase *)self accountValues];
      }
      else {
      uint64_t v16 = [(AccountPSDetailControllerBase *)self originalAccountValues];
      }
      uint64_t v17 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:v16];

      uint64_t v18 = [(AccountPSDetailControllerBase *)self account];
      [v18 setAccountPropertiesWithDictionary:v17];

      [(AccountPSDetailControllerBase *)self saveAndDismiss];
    }
  }
}

- (void)displaySaveAccountAnywaysAlertSheet
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"CONFIRM_SAVE_ACCOUNT_ANYWAYS_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SAVE" value:&stru_B9F70 table:@"AccountPreferences"];
  v11[0] = v6;
  unsigned int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"EDIT" value:&stru_B9F70 table:@"AccountPreferences"];
  v11[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v11 count:2];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1C690;
  v10[3] = &unk_B8E38;
  v10[4] = self;
  [(AccountPSDetailControllerBase *)self showConfirmationWithButtons:v9 title:0 message:v4 destructive:0 completion:v10];
}

- (void)displaySSLAlertForAccount:(id)a3 accountValidator:(id)a4
{
  id v24 = a3;
  id v23 = a4;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v7 = [v6 localizedStringForKey:@"SETUP_WITHOUT_SSL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"SETUP_WITHOUT_SSL_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v12 = [v11 localizedStringForKey:@"YES" value:&stru_B9F70 table:@"AccountPreferences"];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1CB40;
  v28[3] = &unk_B8ED8;
  v28[4] = self;
  id v13 = v24;
  id v29 = v13;
  id v14 = v23;
  id v30 = v14;
  v15 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v28];
  [v10 addAction:v15];

  uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"NO" value:&stru_B9F70 table:@"AccountPreferences"];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1CB54;
  v25[3] = &unk_B8ED8;
  v25[4] = self;
  id v18 = v13;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  uint64_t v20 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v25];
  [v10 addAction:v20];

  uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"VERIFYING_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
  [(AccountPSDetailControllerBase *)self stopValidationWithPrompt:v22 showButtons:0];

  [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
  [(AccountPSDetailControllerBase *)self presentViewController:v10 animated:1 completion:0];
  [(AccountPSDetailControllerBase *)self setTaskCompletionAssertionEnabled:0];
}

- (void)handleSSLAlertForAccount:(id)a3 accountValidator:(id)a4 attemptWithoutSSL:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  if (v5)
  {
    [v11 applySettingsAsDefault:self->_originalConnectionSettings];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"VERIFYING_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
    [(AccountPSDetailControllerBase *)self startValidationWithPrompt:v10];

    [(AccountPSDetailControllerBase *)self setTaskCompletionAssertionEnabled:1];
    [v8 validateAccount:v11 useSSL:0];
  }
  else
  {
    [(AccountPSDetailControllerBase *)self handleInvalidAccount:v11];
    [(AccountPSDetailControllerBase *)self setAccountValuesAfterFailedValidation:self->_accountValues];
    [(AccountPSDetailControllerBase *)self stopValidationWithPrompt:self->_initialTitle showButtons:1];
    [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
  }
}

- (void)cancelAccountValidation
{
  accountValidator = self->_accountValidator;
  if (accountValidator)
  {
    [(MFAccountValidator *)accountValidator cancelValidation];
    [(MFAccountValidator *)self->_accountValidator setDelegate:0];
    id v4 = self->_accountValidator;
    self->_accountValidator = 0;
  }
  *((unsigned char *)self + 232) &= ~2u;
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  BOOL v5 = a5;
  id v28 = a3;
  id v8 = a4;
  *((unsigned char *)self + 232) &= ~1u;
  id v9 = +[MFNetworkController sharedInstance];
  if ([v28 accountIsValid])
  {
    [(AccountPSDetailControllerBase *)self handleValidAccount:v8];
    goto LABEL_27;
  }
  v10 = [v28 error];
  if (([v9 isNetworkUp] & v5) != 1
    || (id v11 = (uint32_t *)[v10 code],
        unsigned int v12 = (char *)[v10 code],
        id v13 = (uint32_t *)[v10 code],
        id v14 = (uint32_t *)[v10 code],
        v15 = (char *)[v10 code],
        v11 == &stru_3D8.reserved1)
    || v12 == (unsigned char *)&stru_3D8.reserved1 + 3
    || v13 == &stru_3D8.reserved2
    || v14 == &stru_3D8.offset
    || v15 == (unsigned char *)&stru_3D8.reserved2 + 3
    || [v10 code] == (char *)&stru_3D8.align + 3
    || ![(id)objc_opt_class() isSSLEditable]
    || ([v8 shouldEnableAfterError:v10] & 1) != 0)
  {
    uint64_t v16 = (uint32_t *)[v10 code];
    if (v16 == &stru_3D8.offset)
    {
      id v18 = MFLookupLocalizedString();
      id v19 = [v8 hostname];
      uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
      [v10 setLocalizedDescription:v20];
    }
    else if (v16 == (uint32_t *)((char *)&stru_3D8.align + 3))
    {
      id v18 = MFLookupLocalizedString();
      id v19 = [v8 displayName];
      uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
      [v10 setLocalizedDescription:v20];
    }
    else
    {
      if (v16 != (uint32_t *)((char *)&stru_3D8.reserved2 + 2)) {
        goto LABEL_19;
      }
      uint64_t v17 = +[NSBundle bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"ACCOUNT_IN_USE" value:&stru_B9F70 table:@"AccountPreferences"];

      id v19 = [v8 displayName];
      uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
      [v10 setLocalizedDescription:v20];
    }

LABEL_19:
    if ([v8 shouldEnableAfterError:v10])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = [v21 localizedStringForKey:@"GMAIL_IMAP_ACCESS_NEEDED" value:&stru_B9F70 table:@"AccountPreferences"];

        id v23 = +[NSBundle bundleForClass:objc_opt_class()];
        id v24 = [v23 localizedStringForKey:@"GMAIL" value:&stru_B9F70 table:@"AccountPreferences"];
        v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v24);
        [v10 setLocalizedDescription:v25];
      }
    }
    [(AccountPSDetailControllerBase *)self setAccountValuesAfterFailedValidation:self->_accountValues];
    id v26 = +[NSBundle bundleForClass:objc_opt_class()];
    id v27 = [v26 localizedStringForKey:@"VERIFYING_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
    [(AccountPSDetailControllerBase *)self stopValidationWithPrompt:v27 showButtons:1];

    [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
    if ([v10 code] == (char *)&stru_3D8.reserved2 + 3) {
      [(AccountPSDetailControllerBase *)self _promptUserForWebLoginForAccount:v8 accountValidator:v28 error:v10];
    }
    else {
      [(AccountPSDetailControllerBase *)self _presentAlertForAccount:v8 accountValidator:v28 error:v10];
    }
    [(AccountPSDetailControllerBase *)self setTaskCompletionAssertionEnabled:0];
    [(AccountPSDetailControllerBase *)self handleInvalidAccount:v8];
    goto LABEL_26;
  }
  [(AccountPSDetailControllerBase *)self displaySSLAlertForAccount:v8 accountValidator:v28];
LABEL_26:

LABEL_27:
}

- (void)_promptUserForWebLoginForAccount:(id)a3 accountValidator:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 userInfo];
  unsigned int v12 = [v11 objectForKey:MFRequestedWebLoginURLKey];

  if (!v12) {
    goto LABEL_3;
  }
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_1D40C;
  uint64_t v17 = &unk_B8F00;
  id v18 = self;
  id v19 = v8;
  unsigned __int8 v13 = [v19 promptUserForWebLoginWithURL:v12 shouldConfirm:1 completionHandler:&v14];

  if ((v13 & 1) == 0) {
LABEL_3:
  }
    -[AccountPSDetailControllerBase _presentAlertForAccount:accountValidator:error:](self, "_presentAlertForAccount:accountValidator:error:", v8, v9, v10, v14, v15, v16, v17, v18);
}

- (void)_presentAlertForAccount:(id)a3 accountValidator:(id)a4 error:(id)a5
{
  id v6 = a5;
  unsigned int v7 = [v6 recoveryAttempter];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v6 localizedRecoverySuggestion], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_B9F70 table:@"AccountPreferences"];
    char v11 = 0;
  }
  else
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
    id v8 = 0;
    char v11 = 1;
  }

  unsigned int v12 = objc_msgSend(v6, "mf_shortDescription");
  unsigned __int8 v13 = [v6 localizedDescription];
  id v14 = +[UIAlertController alertControllerWithTitle:v12 message:v13 preferredStyle:1];

  uint64_t v15 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v14 addAction:v15];

  if ((v11 & 1) == 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1D814;
    v17[3] = &unk_B8ED8;
    v17[4] = self;
    id v18 = v7;
    id v19 = v6;
    uint64_t v16 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v17];
    [v14 addAction:v16];
  }
  [(AccountPSDetailControllerBase *)self presentViewController:v14 animated:1 completion:0];
}

- (void)_redirectToRecoveryURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = +[UIApplication sharedApplication];
    [v4 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];

    id v3 = v5;
  }
}

+ (id)normalizeAccountProperties:(id)a3 withAccountClass:(Class)a4
{
  id v5 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1D9F4;
  char v11 = &unk_B8F28;
  Class v13 = a4;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v8];
  if (!objc_msgSend(v6, "count", v8, v9, v10, v11))
  {

    id v6 = 0;
  }

  return v6;
}

- (MFAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MFAccountValidator)accountValidator
{
  return self->_accountValidator;
}

- (void)setAccountValidator:(id)a3
{
}

- (NSMutableDictionary)accountValues
{
  return self->_accountValues;
}

- (void)setAccountValues:(id)a3
{
}

- (NSMutableDictionary)originalAccountValues
{
  return self->_originalAccountValues;
}

- (void)setOriginalAccountValues:(id)a3
{
}

- (NSDictionary)accountValuesAfterFailedValidation
{
  return self->_accountValuesAfterFailedValidation;
}

- (void)setAccountValuesAfterFailedValidation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFirstResponder, 0);
  objc_storeStrong((id *)&self->_initialTitle, 0);
  objc_storeStrong((id *)&self->_originalConnectionSettings, 0);
  objc_storeStrong((id *)&self->_accountValidator, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountValuesAfterFailedValidation, 0);
  objc_storeStrong((id *)&self->_originalAccountValues, 0);

  objc_storeStrong((id *)&self->_accountValues, 0);
}

@end
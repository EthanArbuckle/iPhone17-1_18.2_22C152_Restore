@interface AAUIAccountViewsProvider
- (ACUISignInControllerDelegate)delegate;
- (BOOL)setDelegate:(id)a3 forSignInController:(id)a4;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)_accountStore;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5;
- (id)supportedAccountTypeIdentifiers;
- (void)setDelegate:(id)a3;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
@end

@implementation AAUIAccountViewsProvider

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (id)supportedAccountTypeIdentifiers
{
  uint64_t v4 = ACAccountTypeIdentifierAppleAccount;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  v3 = [(AAUIAccountViewsProvider *)self _accountStore];
  objc_msgSend(v3, "aa_primaryAppleAccount");

  uint64_t v4 = objc_opt_class();

  return (Class)v4;
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  id v3 = a3;
  if (+[AAUIFeatureFlags isShowDataclassDetailFromAppsEnabled](AAUIFeatureFlags, "isShowDataclassDetailFromAppsEnabled"))objc_msgSend(v3, "aa_isAccountClass:", AAAccountClassPrimary); {
  uint64_t v4 = objc_opt_class();
  }

  return (Class)v4;
}

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  id v3 = [(AAUIAccountViewsProvider *)self _accountStore];
  uint64_t v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (v4)
  {
    uint64_t v11 = ACUIAccountIdentifierKey;
    CFStringRef v12 = @"secondary";
    v5 = &v12;
    v6 = &v11;
  }
  else
  {
    uint64_t v9 = ACUIAccountIdentifierKey;
    CFStringRef v10 = @"primary";
    v5 = &v10;
    v6 = &v9;
  }
  v7 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v6 count:1];

  return v7;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  return 0;
}

- (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5
{
  id v6 = a4;
  if ([a3 isEqualToString:kAccountDataclassMail])
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [@"ICLOUD_MAIL_" stringByAppendingString:v6];
    uint64_t v9 = [v7 localizedStringForKey:v8 value:&stru_76890 table:@"Localizable"];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)setDelegate:(id)a3 forSignInController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v7 setDelegate:self];
    objc_storeWeak((id *)&self->_delegate, v6);
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  id v7 = [(AAUIAccountViewsProvider *)self delegate];

  if (v7)
  {
    BOOL v8 = [(AAUIAccountViewsProvider *)self delegate];
    [v8 signInControllerDidCompleteWithSuccess:v5 error:v9];
  }
}

- (void)signInControllerDidCancel:(id)a3
{
  uint64_t v4 = [(AAUIAccountViewsProvider *)self delegate];

  if (v4)
  {
    id v5 = [(AAUIAccountViewsProvider *)self delegate];
    [v5 signInControllerDidCancel];
  }
}

- (ACUISignInControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACUISignInControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
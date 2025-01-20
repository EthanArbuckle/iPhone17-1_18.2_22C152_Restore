@interface ASSettingsHotmailAccountsUIController
+ (BOOL)isHotmailAccount;
- (DAEASOAuthWebViewController)webAuthController;
- (UIViewController)settingsViewController;
- (id)accountSpecifiers;
- (id)completion;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setSettingsViewController:(id)a3;
- (void)setWebAuthController:(id)a3;
@end

@implementation ASSettingsHotmailAccountsUIController

+ (BOOL)isHotmailAccount
{
  return 1;
}

- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)((char *)&self->_completion + 1), a4);
  [(ASSettingsHotmailAccountsUIController *)self setCompletion:v10];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_18788;
  v16[3] = &unk_30AB8;
  v16[4] = self;
  id v11 = [objc_alloc((Class)DAEASOAuthWebViewController) initWithAccountDescription:@"Outlook" presentationBlock:v16];
  v12 = *(void **)((char *)&self->super._backgroundTaskID + 1);
  *(unint64_t *)((char *)&self->super._backgroundTaskID + 1) = (unint64_t)v11;

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_187A8;
  v13[3] = &unk_30AE0;
  objc_copyWeak(&v14, &location);
  [*(id *)((char *)&self->super._backgroundTaskID + 1) setCompletion:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)ASSettingsHotmailAccountsUIController;
  -[ASSettingsAccountsUIController account:isValid:validationError:](&v14, "account:isValid:validationError:", a3, a4);
  v7 = [(ASSettingsHotmailAccountsUIController *)self completion];

  if (v7)
  {
    if (a5
      && ([(ASSettingsAccountsUIController *)self account],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 accountTypeIdentifier],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isEqualToString:ACAccountTypeIdentifierHotmail],
          v9,
          v8,
          v10))
    {
      id v11 = [(ASSettingsHotmailAccountsUIController *)self completion];
      v12 = [(ASSettingsAccountsUIController *)self account];
      v13 = [v12 backingAccountInfo];
      ((void (**)(void, void *, void, void))v11)[2](v11, v13, 0, 0);
    }
    else
    {
      id v11 = [(ASSettingsHotmailAccountsUIController *)self completion];
      v12 = [(ASSettingsAccountsUIController *)self account];
      v13 = [v12 backingAccountInfo];
      ((void (**)(void, void *, uint64_t, void))v11)[2](v11, v13, 1, 0);
    }
  }
}

- (id)accountSpecifiers
{
  v4.receiver = self;
  v4.super_class = (Class)ASSettingsHotmailAccountsUIController;
  v2 = [(ASSettingsAccountsUIController *)&v4 accountSpecifiers];

  return v2;
}

- (DAEASOAuthWebViewController)webAuthController
{
  return *(DAEASOAuthWebViewController **)((char *)&self->super._backgroundTaskID + 1);
}

- (void)setWebAuthController:(id)a3
{
}

- (id)completion
{
  return *(DAEASOAuthWebViewController **)((char *)&self->_webAuthController + 1);
}

- (void)setCompletion:(id)a3
{
}

- (UIViewController)settingsViewController
{
  return *(UIViewController **)((char *)&self->_completion + 1);
}

- (void)setSettingsViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_completion + 1), 0);
  objc_storeStrong((id *)((char *)&self->_webAuthController + 1), 0);

  objc_storeStrong((id *)((char *)&self->super._backgroundTaskID + 1), 0);
}

@end
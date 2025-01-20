@interface AccountCreationControllerBase
- (ACAccountStore)accountStore;
- (Class)accountClass;
- (NSArray)grantedDataclasses;
- (PSSpecifier)specifier;
- (PSViewController)viewController;
- (id)completion;
- (void)_showDuplicateAccountAlertForAccount:(id)a3 completion:(id)a4;
- (void)beginAccountCreation;
- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5;
- (void)setAccountStore:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setGrantedDataclasses:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setViewController:(id)a3;
- (void)validateUniquenessAndAddAccountWithUsername:(id)a3 fullUserName:(id)a4 token:(id)a5 refreshToken:(id)a6 completion:(id)a7;
@end

@implementation AccountCreationControllerBase

- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  objc_storeStrong((id *)&self->_specifier, a3);
  id v10 = a5;
  objc_storeStrong((id *)&self->_viewController, a4);
  id v11 = objc_retainBlock(v10);

  id completion = self->_completion;
  self->_id completion = v11;

  v13 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
  accountStore = self->_accountStore;
  self->_accountStore = v13;

  [(AccountCreationControllerBase *)self beginAccountCreation];
}

- (void)validateUniquenessAndAddAccountWithUsername:(id)a3 fullUserName:(id)a4 token:(id)a5 refreshToken:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v17)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AccountCreationControllerBase.m", 36, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4A08;
  block[3] = &unk_B8C80;
  block[4] = self;
  id v25 = v13;
  id v26 = v15;
  id v27 = v16;
  id v28 = v14;
  id v29 = v17;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  id v22 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_showDuplicateAccountAlertForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v28 = [v6 accountPropertyForKey:MFMailAccountDescription];
  v31 = [(objc_class *)[(AccountCreationControllerBase *)self accountClass] displayedAccountTypeString];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"ALREADY_EXISTING_ACCOUNT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  id v27 = (void *)v8;
  id v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v28);
  if ([v6 isActive])
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ALREADY_EXISTING_ACCOUNT_DESC"];
    id v11 = [v9 localizedStringForKey:v10 value:&stru_B9F70 table:@"AccountPreferences"];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v31);

    id v13 = +[UIAlertController alertControllerWithTitle:v29 message:v12 preferredStyle:1];
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_54D4;
    v32[3] = &unk_B8CD0;
    id v33 = v30;
    id v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v32];
    [v13 addAction:v16];
    id v17 = &v33;
  }
  else
  {
    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    id v19 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ACTIVATE_EXISTING_ACCOUNT_DESC"];
    id v20 = [v18 localizedStringForKey:v19 value:&stru_B9F70 table:@"AccountPreferences"];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v31);

    id v13 = +[UIAlertController alertControllerWithTitle:v29 message:v12 preferredStyle:1];
    id v21 = +[NSBundle bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"SETTINGS" value:&stru_B9F70 table:@"AccountPreferences"];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_542C;
    v36[3] = &unk_B8CA8;
    id v37 = v6;
    v23 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v36];
    [v13 addAction:v23];

    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    id v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_B9F70 table:@"AccountPreferences"];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_54C4;
    v34[3] = &unk_B8CD0;
    id v35 = v30;
    id v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v34];
    [v13 addAction:v26];
    id v17 = &v37;

    id v14 = v35;
  }

  [(PSViewController *)self->_viewController presentViewController:v13 animated:1 completion:0];
}

- (void)beginAccountCreation
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"AccountCreationControllerBase.m" lineNumber:113 description:@"Subclass must implement."];
}

- (Class)accountClass
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"AccountCreationControllerBase.m" lineNumber:117 description:@"Subclass must implement."];

  return 0;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (PSViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)grantedDataclasses
{
  return self->_grantedDataclasses;
}

- (void)setGrantedDataclasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
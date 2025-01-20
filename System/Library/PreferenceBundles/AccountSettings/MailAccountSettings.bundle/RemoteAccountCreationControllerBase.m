@interface RemoteAccountCreationControllerBase
- (ACAccountStore)accountStore;
- (ACUIRemoteAccountHostProtocol)host;
- (BOOL)_hasAccountWithDescription:(id)a3;
- (BOOL)_isAccountUsernameUnique:(id)a3 typeIdentifer:(id)a4;
- (Class)accountClass;
- (NSArray)grantedDataclasses;
- (PSSpecifier)specifier;
- (PSViewController)viewController;
- (id)completion;
- (id)supportedDataclasses;
- (void)_displayAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)_showDuplicateAccountAlertWithCompletion:(id)a3;
- (void)beginAccountCreation;
- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5;
- (void)setAccountStore:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setGrantedDataclasses:(id)a3;
- (void)setHost:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setViewController:(id)a3;
- (void)validateUniquenessAndAddAccountWithUsername:(id)a3 fullUserName:(id)a4 token:(id)a5 refreshToken:(id)a6 completion:(id)a7;
@end

@implementation RemoteAccountCreationControllerBase

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

  [(RemoteAccountCreationControllerBase *)self beginAccountCreation];
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
    [v23 handleFailureInMethod:a2, self, @"RemoteAccountCreationControllerBase.m", 35, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_77E54;
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

- (BOOL)_isAccountUsernameUnique:(id)a3 typeIdentifer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(RemoteAccountCreationControllerBase *)self host];
  id v9 = [v8 accounts];

  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 username];
        if ([v14 isEqualToString:v6])
        {
          id v15 = [v13 accountType];
          id v16 = [v15 identifier];
          unsigned __int8 v17 = [v16 isEqualToString:v7];

          if (v17)
          {
            BOOL v18 = 0;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

- (BOOL)_hasAccountWithDescription:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(RemoteAccountCreationControllerBase *)self host];
  id v6 = [v5 accounts];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) accountDescription];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)_showDuplicateAccountAlertWithCompletion:(id)a3
{
  id v6 = self;
  id v3 = a3;
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performSyncBlock:&v5];
}

- (void)_displayAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v13 = a5;
  uint64_t v8 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned __int8 v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];
  [v8 addAction:v11];

  v12 = [(RemoteAccountCreationControllerBase *)self viewController];
  [v12 presentViewController:v8 animated:1 completion:v13];
}

- (void)beginAccountCreation
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RemoteAccountCreationControllerBase.m" lineNumber:132 description:@"Subclass must implement."];
}

- (Class)accountClass
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RemoteAccountCreationControllerBase.m" lineNumber:136 description:@"Subclass must implement."];

  return 0;
}

- (id)supportedDataclasses
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", kAccountDataclassMail, kAccountDataclassContacts, kAccountDataclassCalendars, 0);
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

- (ACUIRemoteAccountHostProtocol)host
{
  return (ACUIRemoteAccountHostProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
@interface ICloudMailCreator
+ (id)log;
- (ICloudMailCreationDelegate)delegate;
- (ICloudMailCreator)initWithViewController:(id)a3 appleAccount:(id)a4 accountStore:(id)a5;
- (id)parentViewControllerForObjectModel:(id)a3;
- (id)sessionConfigurationForLoader:(id)a3;
- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4;
- (void)_cleanupLoader;
- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
- (void)setDelegate:(id)a3;
- (void)showAlertForMailSetup;
@end

@implementation ICloudMailCreator

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_716CC;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7530 != -1) {
    dispatch_once(&qword_D7530, block);
  }
  v2 = (void *)qword_D7528;

  return v2;
}

- (ICloudMailCreator)initWithViewController:(id)a3 appleAccount:(id)a4 accountStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICloudMailCreator;
  v12 = [(ICloudMailCreator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_presenter, a3);
    objc_storeStrong((id *)&v13->_appleAccount, a4);
    objc_storeStrong((id *)&v13->_accountStore, a5);
  }

  return v13;
}

- (void)showAlertForMailSetup
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TURN_ON_MAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TURN_ON_MAIL_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_71C64;
  v21[3] = &unk_B9B60;
  objc_copyWeak(&v22, location);
  objc_super v15 = objc_retainBlock(v21);
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_71EE0;
  v19[3] = &unk_B8FE8;
  objc_copyWeak(&v20, location);
  id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v19];

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CREATE_EMAIL_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_71FA0;
  v16[3] = &unk_B9BD8;
  objc_copyWeak(&v18, location);
  v13 = v15;
  id v17 = v13;
  v14 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v16];

  [v7 addAction:v10];
  [v7 addAction:v14];
  [(UIViewController *)self->_presenter presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(location);
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 statusCode] == (char *)&stru_158.reloff + 1)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v9 = +[ICloudMailCreator log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 URL];
      *(_DWORD *)buf = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "received 401 for URL %@", buf, 0xCu);
    }
    v19[0] = kACRenewCredentialsShouldAvoidUIKey;
    v19[1] = kACRenewCredentialsShouldForceKey;
    v20[0] = &__kCFBooleanTrue;
    v20[1] = &__kCFBooleanFalse;
    id v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    v12 = [(ACAccount *)self->_appleAccount accountStore];
    appleAccount = self->_appleAccount;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_7256C;
    v14[3] = &unk_B9C00;
    objc_copyWeak(&v17, &location);
    id v15 = v7;
    id v16 = v8;
    [v12 renewCredentialsForAccount:appleAccount options:v11 completion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (id)sessionConfigurationForLoader:(id)a3
{
  v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  id v4 = objc_alloc_init((Class)AKAppleIDSession);
  objc_msgSend(v3, "set_appleIDContext:", v4);

  return v3;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([v8 topSignal] == (char *)&dword_0 + 1)
  {
    id v9 = +[ICloudMailCreator log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "dismissing icloud mail create flow", buf, 2u);
    }

    [(ACAccount *)self->_appleAccount setEnabled:1 forDataclass:ACAccountDataclassMail];
    id v10 = self->_appleAccount;
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_72C50;
    block[3] = &unk_B9C78;
    block[4] = self;
    v29 = v10;
    v12 = v10;
    objc_copyWeak(&v31, &location);
    id v30 = v7;
    dispatch_async(v11, block);

    objc_destroyWeak(&v31);
  }
  else if ([v8 topSignal] == (char *)&dword_0 + 2)
  {
    addEmailObjectModels = self->_addEmailObjectModels;
    if (addEmailObjectModels)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v14 = addEmailObjectModels;
      id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v25;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v17), "stopActivityIndicator", (void)v24);
            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v15);
      }
    }
    objc_msgSend(v7, "presentInParentViewController:animated:", self->_addEmailNavController, 1, (void)v24);
    [v7 setDelegate:self];
    id v18 = [(UIViewController *)self->_presenter presentedViewController];
    BOOL v19 = v18 == self->_addEmailNavController;

    if (!v19) {
      [(UIViewController *)self->_presenter presentViewController:self->_addEmailNavController animated:1 completion:0];
    }
    id v20 = self->_addEmailObjectModels;
    if (!v20)
    {
      v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v23 = self->_addEmailObjectModels;
      p_addEmailObjectModels = &self->_addEmailObjectModels;
      *p_addEmailObjectModels = v21;

      id v20 = *p_addEmailObjectModels;
    }
    [(NSMutableArray *)v20 addObject:v7];
  }
  objc_destroyWeak(&location);
}

- (void)_cleanupLoader
{
  [(RUILoader *)self->_addEmailLoader cancel];
  [(RUILoader *)self->_addEmailLoader setDelegate:0];
  addEmailLoader = self->_addEmailLoader;
  self->_addEmailLoader = 0;
}

- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = [a4 absoluteString];
  id v10 = [objc_alloc((Class)AAAddEmailUIRequest) initWithURLString:v9 account:self->_appleAccount];
  id v11 = [v10 urlRequest];
  id v12 = [v11 mutableCopy];

  [v12 setHTTPMethod:v8];
  if ([v8 isEqualToString:@"POST"])
  {
    v13 = [v14 postbackData];
    [v12 setHTTPBody:v13];
  }
  [(RUILoader *)self->_addEmailLoader loadXMLUIWithRequest:v12];
  [v14 startActivityIndicator];
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  if ([a4 isEqualToString:@"cancel"])
  {
    id v8 = [(ICloudMailCreator *)self delegate];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 icloudMailCreationNeedsViewUpdate:self withAccount:self->_appleAccount];
    }
    [(UIViewController *)self->_presenter dismissViewControllerAnimated:1 completion:0];
    addEmailObjectModels = self->_addEmailObjectModels;
    self->_addEmailObjectModels = 0;

    addEmailNavController = self->_addEmailNavController;
    self->_addEmailNavController = 0;

    [(ICloudMailCreator *)self _cleanupLoader];
  }
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_addEmailNavController;
}

- (ICloudMailCreationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICloudMailCreationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_addEmailObjectModels, 0);
  objc_storeStrong((id *)&self->_addEmailLoader, 0);

  objc_storeStrong((id *)&self->_addEmailNavController, 0);
}

@end
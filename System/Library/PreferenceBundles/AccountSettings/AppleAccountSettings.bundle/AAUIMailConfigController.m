@interface AAUIMailConfigController
- (AAUIMailConfigController)initWithAccount:(id)a3 presenter:(id)a4;
- (id)parentViewControllerForObjectModel:(id)a3;
- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4;
- (void)_cleanupLoader;
- (void)configureEmailAccount;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
- (void)presentCreateFreeEmailPromptWithCompletion:(id)a3 isForNotes:(BOOL)a4;
@end

@implementation AAUIMailConfigController

- (AAUIMailConfigController)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIMailConfigController;
  v9 = [(AAUIMailConfigController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (void)presentCreateFreeEmailPromptWithCompletion:(id)a3 isForNotes:(BOOL)a4
{
  id v6 = a3;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = v7;
  if (a4)
  {
    id v19 = [v7 localizedStringForKey:@"TURN_ON_NOTES_MESSAGE" value:&stru_76890 table:@"Localizable"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = v9;
    CFStringRef v11 = @"TURN_ON_NOTES_TITLE";
  }
  else
  {
    id v19 = [v7 localizedStringForKey:@"TURN_ON_MAIL_MESSAGE" value:&stru_76890 table:@"Localizable"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = v9;
    CFStringRef v11 = @"TURN_ON_MAIL_TITLE";
  }
  objc_super v12 = [v9 localizedStringForKey:v11 value:&stru_76890 table:@"Localizable"];

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"CREATE_EMAIL_BUTTON" value:&stru_76890 table:@"Localizable"];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_76890 table:@"Localizable"];

  v17 = +[UIAlertController alertWithTitle:v12 message:v19 cancelButtonTitle:v16 defaultButtonTitle:v14 actionHandler:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [WeakRetained presentViewController:v17 animated:0 completion:0];
}

- (void)configureEmailAccount
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_101C4;
  v12[3] = &unk_756F8;
  v12[4] = self;
  v3 = objc_retainBlock(v12);
  v4 = +[UIApplication sharedApplication];
  [v4 setNetworkActivityIndicatorVisible:1];

  uint64_t v5 = [(ACAccount *)self->_account identifier];
  if (v5
    && (id v6 = (void *)v5,
        [(ACAccount *)self->_account aa_authToken],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    id v8 = +[ACAccountStore defaultStore];
    account = self->_account;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10460;
    v10[3] = &unk_757E8;
    CFStringRef v11 = v3;
    [v8 renewCredentialsForAccount:account completion:v10];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v7 = a4;
  id v8 = +[UIApplication sharedApplication];
  [v8 setNetworkActivityIndicatorVisible:0];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10740;
  v24[3] = &unk_756F8;
  v24[4] = self;
  v9 = objc_retainBlock(v24);
  if (a5 == 2)
  {
    [v7 presentInParentViewController:self->_addEmailNavController animated:1];
    [v7 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    v15 = [WeakRetained presentedViewController];
    addEmailNavController = self->_addEmailNavController;

    if (v15 != addEmailNavController)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_presenter);
      [v17 presentViewController:self->_addEmailNavController animated:1 completion:0];
    }
    addEmailObjectModels = self->_addEmailObjectModels;
    if (!addEmailObjectModels)
    {
      id v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v20 = self->_addEmailObjectModels;
      self->_addEmailObjectModels = v19;

      addEmailObjectModels = self->_addEmailObjectModels;
    }
    [(NSMutableArray *)addEmailObjectModels addObject:v7];
  }
  else if (a5 == 1)
  {
    v10 = self->_account;
    [(ACAccount *)self->_account setEnabled:1 forDataclass:ACAccountDataclassMail];
    id v11 = objc_loadWeakRetained((id *)&self->_presenter);
    [v11 reloadSpecifiers];

    objc_super v12 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10754;
    block[3] = &unk_75888;
    v22 = v10;
    v23 = v9;
    v13 = v10;
    dispatch_async(v12, block);
  }
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  id v4 = +[UIApplication sharedApplication];
  [v4 setNetworkActivityIndicatorVisible:0];
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_addEmailNavController;
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  if ([a4 isEqualToString:RUIClientInfoActionCancel])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained reloadSpecifiers];

    id v7 = objc_loadWeakRetained((id *)&self->_presenter);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10A88;
    v10[3] = &unk_756F8;
    void v10[4] = self;
    [v7 dismissViewControllerAnimated:1 completion:v10];

    addEmailObjectModels = self->_addEmailObjectModels;
    self->_addEmailObjectModels = 0;

    addEmailNavController = self->_addEmailNavController;
    self->_addEmailNavController = 0;

    [(AAUIMailConfigController *)self _cleanupLoader];
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  v9 = [a4 absoluteString];
  id v10 = [objc_alloc((Class)AAAddEmailUIRequest) initWithURLString:v9 account:self->_account];
  id v11 = [v10 urlRequest];
  id v12 = [v11 mutableCopy];

  [v12 setHTTPMethod:v8];
  LODWORD(v11) = [v8 isEqualToString:@"POST"];

  if (v11)
  {
    v13 = [v15 postbackData];
    [v12 setHTTPBody:v13];
  }
  [(RUILoader *)self->_addEmailLoader loadXMLUIWithRequest:v12];
  v14 = +[UIApplication sharedApplication];
  [v14 setNetworkActivityIndicatorVisible:1];
}

- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)_cleanupLoader
{
  [(RUILoader *)self->_addEmailLoader cancel];
  [(RUILoader *)self->_addEmailLoader setDelegate:0];
  addEmailLoader = self->_addEmailLoader;
  self->_addEmailLoader = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addEmailObjectModels, 0);
  objc_storeStrong((id *)&self->_addEmailLoader, 0);
  objc_storeStrong((id *)&self->_addEmailNavController, 0);
  objc_destroyWeak((id *)&self->_presenter);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
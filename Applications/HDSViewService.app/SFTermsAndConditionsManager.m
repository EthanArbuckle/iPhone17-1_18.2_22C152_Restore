@interface SFTermsAndConditionsManager
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (RemoteUIController)termsController;
- (SFTermsAndConditionsManager)initWithPresenter:(id)a3 showWarranty:(BOOL)a4;
- (id)completionHandler;
- (id)loadedHandler;
- (void)_handleAgreeFromObjectModel:(id)a3;
- (void)_termsDisagree;
- (void)activate;
- (void)dismissTerms:(BOOL)a3;
- (void)handleAgreeButton;
- (void)handleDisagreeButton;
- (void)loadOfflineTerms;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setLoadedHandler:(id)a3;
- (void)setTermsController:(id)a3;
@end

@implementation SFTermsAndConditionsManager

- (SFTermsAndConditionsManager)initWithPresenter:(id)a3 showWarranty:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFTermsAndConditionsManager;
  v8 = [(SFTermsAndConditionsManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_showWarranty = a4;
    objc_storeStrong((id *)&v8->_presenter, a3);
  }

  return v9;
}

- (void)activate
{
  v3 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
  termsController = self->_termsController;
  self->_termsController = v3;

  [(RemoteUIController *)self->_termsController setHostViewController:self->_presenter];
  v5 = [(RemoteUIController *)self->_termsController loader];
  [v5 setAllowNonSecureHTTP:IsAppleInternalBuild() != 0];

  v6 = self->_termsController;
  id v7 = +[RUIStyle setupAssistantStyle];
  [(RemoteUIController *)v6 setStyle:v7];

  [(RemoteUIController *)self->_termsController setDelegate:self];
  v8 = +[ACAccountStore defaultStore];
  v9 = [v8 aa_primaryAppleAccount];

  id v10 = [objc_alloc((Class)NSMutableArray) initWithObjects:&off_1000DEFD8, &off_1000DF028, 0];
  objc_super v11 = v10;
  if (self->_showWarranty) {
    [v10 insertObject:&off_1000DF000 atIndex:1];
  }
  if (objc_msgSend(v9, "aa_needsToVerifyTerms")) {
    [v11 addObject:&off_1000DF050];
  }
  v23[0] = @"terms";
  v23[1] = @"format";
  v24[0] = v11;
  v24[1] = kAAProtocolGenericTermsUIBuddyMLKey;
  v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v13 = [objc_alloc((Class)AAGenericTermsUIRequest) initWithAccount:v9 parameters:v12 preferPassword:0];
  if (v13)
  {
    objc_initWeak(&location, self);
    v14 = self->_termsController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006818;
    v20[3] = &unk_1000D9B48;
    objc_copyWeak(&v21, &location);
    [(RemoteUIController *)v14 setHandlerForElementName:@"agree" handler:v20];
    v15 = self->_termsController;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006874;
    v18[3] = &unk_1000D9B48;
    objc_copyWeak(&v19, &location);
    [(RemoteUIController *)v15 setHandlerForElementName:@"disagree" handler:v18];
    v16 = self->_termsController;
    v17 = [v13 urlRequest];
    [(RemoteUIController *)v16 loadRequest:v17 completion:&stru_1000D9BB0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SFTermsAndConditionsManager *)self loadOfflineTerms];
  }
}

- (void)_handleAgreeFromObjectModel:(id)a3
{
  v4 = [a3 clientInfo];
  v5 = [v4 objectForKey:@"agreeUrl"];
  v6 = +[ACAccountStore defaultStore];
  id v7 = [v6 aa_primaryAppleAccount];

  id v8 = [objc_alloc((Class)AAiCloudTermsAgreeRequest) initWithURLString:v5 account:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006A84;
  v9[3] = &unk_1000D9BD8;
  v9[4] = self;
  [v8 performRequestWithHandler:v9];
}

- (void)_termsDisagree
{
}

- (void)loadOfflineTerms
{
  v3 = +[NSBundle mainBundle];
  id v13 = [v3 localizations];

  v4 = +[NSLocale preferredLanguages];
  v5 = +[NSBundle preferredLocalizationsFromArray:v13 forPreferences:v4];

  v6 = +[NSBundle mainBundle];
  id v7 = [v5 objectAtIndex:0];
  id v8 = [v6 pathForResource:@"HomePod_Offline_Terms_Warranty" ofType:@"xml" inDirectory:0 forLocalization:v7];

  v9 = +[NSData dataWithContentsOfFile:v8];
  self->_showingOfflineTerms = 1;
  termsController = self->_termsController;
  objc_super v11 = +[NSBundle mainBundle];
  v12 = [v11 resourceURL];
  [(RemoteUIController *)termsController loadData:v9 baseURL:v12];
}

- (void)handleDisagreeButton
{
}

- (void)handleAgreeButton
{
}

- (void)dismissTerms:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RemoteUIController *)self->_termsController dismissObjectModelsAnimated:1 completion:0];
  v6 = [(SFTermsAndConditionsManager *)self completionHandler];
  v6[2](v6, v3);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  if (a4) {
    [(SFTermsAndConditionsManager *)self loadOfflineTerms];
  }
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5 = a4;
  v6 = objc_opt_new();
  id v7 = [v6 appleIDHeadersForRequest:v5];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v14 = [v8 objectForKeyedSubscript:v13];
        [v5 setValue:v14 forHTTPHeaderField:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v15 = +[AADeviceInfo userAgentHeader];
  [v5 setValue:v15 forHTTPHeaderField:@"User-Agent"];

  v16 = +[AADeviceInfo clientInfoHeader];
  [v5 setValue:v16 forHTTPHeaderField:@"X-MMe-Client-Info"];

  v17 = +[NSLocale currentLocale];
  v18 = [v17 objectForKey:NSLocaleCountryCode];
  id v19 = [v18 uppercaseString];
  [v5 setValue:v19 forHTTPHeaderField:@"X-MMe-Country"];

  return 1;
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v5 = a4;
  v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)1) {
    [v5 setModalPresentationStyle:2];
  }
  if (self->_showingOfflineTerms)
  {
    id v8 = objc_alloc((Class)UIBarButtonItem);
    id v9 = sub_100007214(@"TERMS_DISAGREE_BUTTON_TITLE");
    id v10 = [v8 initWithTitle:v9 style:0 target:self action:"handleDisagreeButton"];

    id v11 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v12 = objc_alloc((Class)UIBarButtonItem);
    uint64_t v13 = sub_100007214(@"TERMS_AGREE_BUTTON_TITLE");
    id v14 = [v12 initWithTitle:v13 style:2 target:self action:"handleAgreeButton"];

    [v5 setToolbarHidden:0];
    v15 = [v5 topViewController];
    v18[0] = v10;
    v18[1] = v11;
    v18[2] = v14;
    v16 = +[NSArray arrayWithObjects:v18 count:3];
    [v15 setToolbarItems:v16 animated:0];
  }
  v17 = [(SFTermsAndConditionsManager *)self loadedHandler];
  v17[2]();
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)loadedHandler
{
  return self->_loadedHandler;
}

- (void)setLoadedHandler:(id)a3
{
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setTermsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong(&self->_loadedHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_genericTermsUIViewController, 0);
}

@end
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
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setLoadedHandler:(id)a3;
- (void)setTermsController:(id)a3;
@end

@implementation SFTermsAndConditionsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong(&self->_loadedHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_genericTermsUIViewController, 0);
}

- (void)setTermsController:(id)a3
{
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setLoadedHandler:(id)a3
{
}

- (id)loadedHandler
{
  return self->_loadedHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
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
    v9 = SFLocalizedStringForKey();
    id v10 = [v8 initWithTitle:v9 style:0 target:self action:"handleDisagreeButton"];

    id v11 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v12 = objc_alloc((Class)UIBarButtonItem);
    v13 = SFLocalizedStringForKey();
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
        id v14 = [v8 objectForKeyedSubscript:v13];
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
  v19 = [v18 uppercaseString];
  [v5 setValue:v19 forHTTPHeaderField:@"X-MMe-Country"];

  return 1;
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  if (a4) {
    [(SFTermsAndConditionsManager *)self loadOfflineTerms];
  }
}

- (void)dismissTerms:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RemoteUIController *)self->_termsController dismissObjectModelsAnimated:1 completion:0];
  v6 = [(SFTermsAndConditionsManager *)self completionHandler];
  v6[2](v6, v3);
}

- (void)handleAgreeButton
{
}

- (void)handleDisagreeButton
{
}

- (void)loadOfflineTerms
{
  BOOL v3 = +[NSBundle mainBundle];
  id v13 = [v3 localizations];

  v4 = +[NSLocale preferredLanguages];
  id v5 = +[NSBundle preferredLocalizationsFromArray:v13 forPreferences:v4];

  v6 = +[NSBundle mainBundle];
  id v7 = [v5 objectAtIndex:0];
  id v8 = [v6 pathForResource:@"HomePod_Offline_Terms_Warranty" ofType:@"xml" inDirectory:0 forLocalization:v7];

  id v9 = +[NSData dataWithContentsOfFile:v8];
  self->_showingOfflineTerms = 1;
  termsController = self->_termsController;
  uint64_t v11 = +[NSBundle mainBundle];
  id v12 = [v11 resourceURL];
  [(RemoteUIController *)termsController loadData:v9 baseURL:v12];
}

- (void)_termsDisagree
{
}

- (void)_handleAgreeFromObjectModel:(id)a3
{
  v4 = [a3 clientInfo];
  id v5 = [v4 objectForKey:@"agreeUrl"];
  v6 = objc_opt_new();
  id v7 = [v6 aa_primaryAppleAccount];
  id v8 = [objc_alloc((Class)AAiCloudTermsAgreeRequest) initWithURLString:v5 account:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012B5A4;
  v9[3] = &unk_1001A1560;
  v9[4] = self;
  [v8 performRequestWithHandler:v9];
}

- (void)activate
{
  BOOL v3 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
  termsController = self->_termsController;
  self->_termsController = v3;

  [(RemoteUIController *)self->_termsController setHostViewController:self->_presenter];
  id v5 = [(RemoteUIController *)self->_termsController loader];
  [v5 setAllowNonSecureHTTP:IsAppleInternalBuild() != 0];

  v6 = self->_termsController;
  id v7 = +[RUIStyle setupAssistantStyle];
  [(RemoteUIController *)v6 setStyle:v7];

  [(RemoteUIController *)self->_termsController setDelegate:self];
  id v8 = objc_opt_new();
  id v9 = [v8 aa_primaryAppleAccount];
  id v10 = [objc_alloc((Class)NSMutableArray) initWithObjects:&off_1001A7140, &off_1001A7190, 0];
  uint64_t v11 = v10;
  if (self->_showWarranty) {
    [v10 insertObject:&off_1001A7168 atIndex:1];
  }
  if (objc_msgSend(v9, "aa_needsToVerifyTerms")) {
    [v11 addObject:&off_1001A71B8];
  }
  v23[0] = @"terms";
  v23[1] = @"format";
  v24[0] = v11;
  v24[1] = kAAProtocolGenericTermsUIBuddyMLKey;
  id v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v13 = [objc_alloc((Class)AAGenericTermsUIRequest) initWithAccount:v9 parameters:v12 preferPassword:0];
  if (v13)
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v14 = self->_termsController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10012B9A0;
    v20[3] = &unk_1001A14D0;
    objc_copyWeak(&v21, &location);
    [(RemoteUIController *)v14 setHandlerForElementName:@"agree" handler:v20];
    v15 = self->_termsController;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10012B9FC;
    void v18[3] = &unk_1001A14D0;
    objc_copyWeak(&v19, &location);
    [(RemoteUIController *)v15 setHandlerForElementName:@"disagree" handler:v18];
    v16 = self->_termsController;
    v17 = [v13 urlRequest];
    [(RemoteUIController *)v16 loadRequest:v17 completion:&stru_1001A1538];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SFTermsAndConditionsManager *)self loadOfflineTerms];
  }
}

- (SFTermsAndConditionsManager)initWithPresenter:(id)a3 showWarranty:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFTermsAndConditionsManager;
  id v8 = [(SFTermsAndConditionsManager *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    v8->_showWarranty = a4;
    objc_storeStrong((id *)&v8->_presenter, a3);
  }

  return v9;
}

@end
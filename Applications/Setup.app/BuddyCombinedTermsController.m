@interface BuddyCombinedTermsController
+ (id)_termsVersionFromObjectModel:(id)a3;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BOOL)presentationCanceled;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BuddyCombinedTermsProvider)combinedTermsProvider;
- (BuddyNetworkProvider)networkProvider;
- (NSURL)termsURL;
- (RemoteUIController)remoteUIController;
- (UINavigationController)navigationController;
- (id)presentationCompletion;
- (void)_addHandlersForTermsButtonsToRemoteUIController:(id)a3;
- (void)_addHeadersToRequest:(id)a3;
- (void)_callPresentationCompletionWithNothing;
- (void)_cleanupRemoteUI;
- (void)_userRespondedToCombinedTCsWithAgreement:(BOOL)a3 withSLAVersion:(id)a4;
- (void)cancelHostedPresentation;
- (void)controllerDone;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)presentHostedViewControllerOnNavigationController:(id)a3 completion:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)setCombinedTermsProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPresentationCanceled:(BOOL)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)setTermsURL:(id)a3;
@end

@implementation BuddyCombinedTermsController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTOS;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyCombinedTermsController *)self networkProvider];
  unsigned __int8 v3 = [(BuddyNetworkProvider *)v2 networkReachable];

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BuddyAppleIDConfigurationManager sharedManager];
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001BACF4;
  v8 = &unk_1002B2E20;
  v9 = v12;
  id v10 = location[0];
  [v3 getURLConfigurationWithHandler:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)presentHostedViewControllerOnNavigationController:(id)a3 completion:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  [(BuddyCombinedTermsController *)v16 setPresentationCanceled:0];
  int v5 = [(BuddyCombinedTermsController *)v16 combinedTermsProvider];
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1001BAF2C;
  id v10 = &unk_1002B4868;
  v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  [(BuddyCombinedTermsProvider *)v5 fetchTerms:&v6];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelHostedPresentation
{
}

- (void)controllerDone
{
  id v2 = [(BuddyCombinedTermsController *)self presentationCompletion];

  if (v2)
  {
    [(BuddyCombinedTermsController *)self _callPresentationCompletionWithNothing];
    [(BuddyCombinedTermsController *)self _cleanupRemoteUI];
  }
  else
  {
    id v3 = [(BuddyCombinedTermsController *)self delegate];
    [(BFFFlowItemDelegate *)v3 flowItemDone:self];
  }
}

- (void)_addHeadersToRequest:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BuddyAccountTools sharedBuddyAccountTools];
  [v3 addAccountHeadersToRequest:location[0]];

  v4 = objc_opt_new();
  id v13 = [v4 appleIDHeadersForRequest:location[0]];

  memset(v11, 0, sizeof(v11));
  id v5 = v13;
  id v6 = [v5 countByEnumeratingWithState:v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(void *)v11[2] != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v9 = location[0];
        id v10 = [v13 objectForKeyedSubscript:v12];
        [v9 setValue:v10 forHTTPHeaderField:v12];
      }
      id v6 = [v5 countByEnumeratingWithState:v11 objects:v15 count:16];
    }
    while (v6);
  }

  if (+[BYWarranty shouldDisplay]) {
    [location[0] setValue:@"true" forHTTPHeaderField:@"X-MMe-Show-Warranty"];
  }
  [location[0] setValue:@"true" forHTTPHeaderField:@"X-Mme-Setup-FCE048DE-F34F-4FAF-A6DD-6C8AC9DF0C54"];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_addHandlersForTermsButtonsToRemoteUIController:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1001BB59C;
  v15 = &unk_1002B4890;
  v16 = v18;
  [v3 setHandlerForElementName:@"agree" handler:&v11];
  id v4 = location[0];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_1001BB6D4;
  id v9 = &unk_1002B4890;
  id v10 = v18;
  [v4 setHandlerForElementName:@"disagree" handler:&v5];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)_callPresentationCompletionWithNothing
{
  id v4 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyCombinedTermsController *)self presentationCompletion];

  if (v2)
  {
    location[0] = [(BuddyCombinedTermsController *)v4 presentationCompletion];
    [(BuddyCombinedTermsController *)v4 setPresentationCompletion:0];
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    objc_storeStrong(location, 0);
  }
}

- (void)_cleanupRemoteUI
{
  id v2 = [(BuddyCombinedTermsController *)self remoteUIController];
  id v3 = [(RemoteUIController *)v2 loader];
  [v3 cancel];

  [(BuddyCombinedTermsController *)self setRemoteUIController:0];
}

+ (id)_termsVersionFromObjectModel:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] clientInfo];
  id v9 = [v3 objectForKey:@"SLAVersion"];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004BB7C((uint64_t)buf, (uint64_t)v9);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "SLA version in combined terms: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ([v9 hasPrefix:@"EA"])
  {
    id v4 = [v9 substringFromIndex:2];
    id v5 = v9;
    id v9 = v4;
  }
  if ((uint64_t)[v9 integerValue] <= 0) {
    id v11 = 0;
  }
  else {
    id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 integerValue]);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  id v6 = v11;

  return v6;
}

- (void)_userRespondedToCombinedTCsWithAgreement:(BOOL)a3 withSLAVersion:(id)a4
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  if (v9)
  {
    id v4 = +[NSFileManager defaultManager];
    [(NSFileManager *)v4 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowLicense" error:0];

    +[BYWarranty acknowledge];
    if (v8) {
      +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", [v8 unsignedIntegerValue]);
    }
    +[BuddyTermsConditionsFlow didAgreeToServerTerms];
    [(BuddyCombinedTermsController *)v11 controllerDone];
  }
  id v5 = [(BuddyCombinedTermsController *)v11 remoteUIController];
  id v6 = [(RemoteUIController *)v5 navigationController];
  id v7 = [v6 presentedViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  objc_storeStrong(&v8, 0);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = a5;
  if (*a5 == 1)
  {
    id v7 = [v25 clientInfo];
    id v8 = [v7 objectForKeyedSubscript:@"continue"];
    objc_opt_class();
    char v22 = 0;
    char v20 = 0;
    unsigned __int8 v9 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v23 = [v25 clientInfo];
      char v22 = 1;
      id v21 = [v23 objectForKeyedSubscript:@"continue"];
      char v20 = 1;
      unsigned __int8 v9 = [v21 BOOLValue];
    }
    if (v20) {

    }
    if (v22) {
    if (v9)
    }
      +[BuddyTermsConditionsFlow didAgreeToServerTerms];
    [(BuddyCombinedTermsController *)v27 controllerDone];
    int v19 = 1;
  }
  else
  {
    if (*v24 == 2)
    {
      id v10 = [v25 defaultPages];
      id v18 = [v10 firstObject];

      id v11 = [v18 presentingViewController];
      if (!v11)
      {
        unint64_t *v24 = 5;
        id v12 = [v18 toolbar];

        if (v12)
        {
          id v13 = [v18 leftToolbarButtonItem];

          if (v13)
          {
            id v14 = [v18 leftToolbarButtonItem];
            [v18 setLeftNavigationBarButtonItem:v14];
          }
          id v15 = [v18 rightToolbarButtonItem];

          if (v15)
          {
            id v16 = [v18 rightToolbarButtonItem];
            [v18 setRightNavigationBarButtonItem:v16];
          }
          id v17 = [v18 toolbar];
          [v17 setHidden:1];
        }
      }
      objc_storeStrong(&v18, 0);
    }
    int v19 = 0;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [v7 setModalPresentationStyle:2];
  +[OBBaseWelcomeController preferredContentSize];
  [v7 setPreferredContentSize:v5, v6, *(void *)&v5, *(void *)&v6, *(void *)&v5, *(void *)&v6];
  [v7 setModalInPresentation:1];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  BOOL v11 = a5;
  id v7 = [(BuddyCombinedTermsController *)v14 presentationCompletion];

  if (v7)
  {
    id v10 = (void (**)(id, id))[(BuddyCombinedTermsController *)v14 presentationCompletion];
    [(BuddyCombinedTermsController *)v14 setPresentationCompletion:0];
    id v8 = [v12 displayedPages];
    id v9 = [v8 firstObject];
    v10[2](v10, v9);

    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  if (v9)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v9);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Failed to load combined terms: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BuddyCombinedTermsController *)v11 _callPresentationCompletionWithNothing];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  [(BuddyCombinedTermsController *)v11 _addHeadersToRequest:v9];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BuddyCombinedTermsProvider)combinedTermsProvider
{
  return self->_combinedTermsProvider;
}

- (void)setCombinedTermsProvider:(id)a3
{
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
}

- (BOOL)presentationCanceled
{
  return self->_presentationCanceled;
}

- (void)setPresentationCanceled:(BOOL)a3
{
  self->_presentationCanceled = a3;
}

- (void).cxx_destruct
{
}

@end
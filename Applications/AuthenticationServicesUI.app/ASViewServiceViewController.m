@interface ASViewServiceViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissAndExit;
- (void)_invalidateLookupConnection;
- (void)_performQueuedUpdatesIfNecessary;
- (void)_setUpRemoteProxy;
- (void)_setupWithXPCEndpoint:(id)a3;
- (void)_showAuthorizationFlow;
- (void)_showExportFlow;
- (void)authorizationViewController:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)authorizationViewController:(id)a3 didRequestCredentialForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6;
- (void)authorizationViewController:(id)a3 startCABLEAuthenticationWithCompletionHandler:(id)a4;
- (void)authorizationViewController:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5;
- (void)authorizationViewControllerDidCompleteInitialPresentation:(id)a3;
- (void)cableClientWillAuthenticate;
- (void)cableClientWillConnect;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissAndPresentAgain:(id)a3;
- (void)dismissWithError:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)presentPINEntryInterface;
- (void)setUpWithPresentationContextData:(id)a3 xpcEndpoint:(id)a4;
- (void)setupWithExportedCredentialData:(id)a3 exporterBundleID:(id)a4 xpcEndpoint:(id)a5;
- (void)updateInterfaceForUserVisibleError:(id)a3;
- (void)updateInterfaceWithLoginChoices:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ASViewServiceViewController

- (void)_setUpRemoteProxy
{
  id v2 = [(ASViewServiceViewController *)self _remoteViewControllerProxy];
  [v2 setShouldDisableFadeInAnimation:1];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setAllowsSiri:0];
  [v2 setAllowsAlertStacking:1];
  [v2 setDesiredHardwareButtonEvents:17];
  [v2 setSwipeDismissalStyle:0];
  [v2 setDismissalAnimationStyle:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[_ASDevice isPad]) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASViewServiceViewController;
  [(ASViewServiceViewController *)&v4 viewWillAppear:a3];
  [(ASViewServiceViewController *)self _setUpRemoteProxy];
  if (self->_presentationContext)
  {
    [(ASViewServiceViewController *)self _showAuthorizationFlow];
  }
  else if (self->_exportedCredentialData)
  {
    [(ASViewServiceViewController *)self _showExportFlow];
  }
}

- (void)_showAuthorizationFlow
{
  v3 = (PMAuthorizationViewController *)[objc_alloc((Class)PMAuthorizationViewController) initWithPresentationContext:self->_presentationContext activity:self->_authorizationActivity];
  authorizationViewController = self->_authorizationViewController;
  self->_authorizationViewController = v3;

  [(PMAuthorizationViewController *)self->_authorizationViewController setDelegate:self];
  unsigned int v5 = [(ASCAuthorizationPresentationContext *)self->_presentationContext isConditionalRegistrationRequest];
  v6 = self->_authorizationViewController;
  if (v5)
  {
    v7 = self->_authorizationViewController;
    [(PMAuthorizationViewController *)v7 performConditionalRegistrationIfPossible];
  }
  else
  {
    -[ASViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6);
  }
}

- (void)_showExportFlow
{
  v3 = (PMCredentialExchangeViewController *)[objc_alloc((Class)PMCredentialExchangeViewController) initWithExportedCredentialData:self->_exportedCredentialData exporterBundleID:self->_exporterBundleID];
  credentialExchangeViewController = self->_credentialExchangeViewController;
  self->_credentialExchangeViewController = v3;

  [(PMCredentialExchangeViewController *)self->_credentialExchangeViewController setDelegate:self];
  unsigned int v5 = self->_credentialExchangeViewController;

  [(ASViewServiceViewController *)self presentViewController:v5 animated:0 completion:0];
}

- (void)dealloc
{
  [(ASViewServiceViewController *)self _invalidateLookupConnection];
  v3.receiver = self;
  v3.super_class = (Class)ASViewServiceViewController;
  [(ASViewServiceViewController *)&v3 dealloc];
}

- (void)_dismissAndExit
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002A48;
  block[3] = &unk_10000C580;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_invalidateLookupConnection
{
  [(NSXPCConnection *)self->_lookupConnection invalidate];
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;
}

- (void)_performQueuedUpdatesIfNecessary
{
  if (self->_loginChoicesForQueuedUpdate) {
    -[PMAuthorizationViewController updateInterfaceWithLoginChoices:](self->_authorizationViewController, "updateInterfaceWithLoginChoices:");
  }
  if (self->_hasQueuedPINEntryRequest) {
    [(PMAuthorizationViewController *)self->_authorizationViewController presentPINEntryInterface];
  }
  loginChoicesForQueuedUpdate = self->_loginChoicesForQueuedUpdate;
  self->_loginChoicesForQueuedUpdate = 0;

  self->_hasQueuedPINEntryRequest = 0;
}

- (void)updateInterfaceWithLoginChoices:(id)a3
{
  id v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002D00;
  v7[3] = &unk_10000C5A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);
}

- (void)presentPINEntryInterface
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002DBC;
  block[3] = &unk_10000C580;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

- (void)updateInterfaceForUserVisibleError:(id)a3
{
  authorizationViewController = self->_authorizationViewController;
  id v4 = [a3 code];

  [(PMAuthorizationViewController *)authorizationViewController pushOrUpdateBasicPaneViewControllerWithError:v4];
}

- (void)dismissWithError:(id)a3
{
  id v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002EE0;
  v7[3] = &unk_10000C5A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);
}

- (void)cableClientWillConnect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002F70;
  block[3] = &unk_10000C580;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cableClientWillAuthenticate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002FF8;
  block[3] = &unk_10000C580;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(void))a4;
  v7 = (OS_os_activity *)_os_activity_create((void *)&_mh_execute_header, "Authorization view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  authorizationActivity = self->_authorizationActivity;
  self->_authorizationActivity = v7;

  v9 = [v16 userInfo];
  v10 = [v9 safari_dataForKey:ASCAuthorizationPresentationContextDataKey];

  v11 = [v16 userInfo];
  v12 = [v11 safari_stringForKey:ASCAuthorizationCredentialExchangeExporterBundleIDKey];

  v13 = [v16 userInfo];
  v14 = [v13 safari_dataForKey:ASCAuthorizationCredentialExchangeDataKey];

  if (v10)
  {
    v15 = [v16 xpcEndpoint];
    [(ASViewServiceViewController *)self setUpWithPresentationContextData:v10 xpcEndpoint:v15];
  }
  else
  {
    if (!v14) {
      goto LABEL_6;
    }
    v15 = [v16 xpcEndpoint];
    [(ASViewServiceViewController *)self setupWithExportedCredentialData:v14 exporterBundleID:v12 xpcEndpoint:v15];
  }

LABEL_6:
  v6[2](v6);
}

- (void)_setupWithXPCEndpoint:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AuthenticationServicesUI.InterfaceUpdateQueue", 0);
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  self->_interfaceUpdateQueue = v5;

  v7 = objc_opt_new();
  [v7 _setEndpoint:v4];
  id v8 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v7];
  v9 = +[ASCAuthorizationPresenterHostInterface xpcInterface];
  [v8 setRemoteObjectInterface:v9];

  v10 = +[ASCViewServiceInterface xpcInterface];
  [v8 setExportedInterface:v10];

  [v8 setExportedObject:self];
  [v8 resume];
  objc_storeStrong((id *)&self->_lookupConnection, v8);
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100003364;
  id v16 = &unk_10000C5D0;
  objc_copyWeak(&v17, &location);
  v11 = [v8 remoteObjectProxyWithErrorHandler:&v13];
  hostProxy = self->_hostProxy;
  self->_hostProxy = v11;

  [(ASCAuthorizationPresenterHostProtocol *)self->_hostProxy initializeClientToViewServiceConnection];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)setUpWithPresentationContextData:(id)a3 xpcEndpoint:(id)a4
{
  id v6 = a3;
  [(ASViewServiceViewController *)self _setupWithXPCEndpoint:a4];
  if ([v6 length])
  {
    id v12 = 0;
    v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
    id v8 = v12;
    presentationContext = self->_presentationContext;
    self->_presentationContext = v7;

    if (v8)
    {
      v10 = sub_100002680();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100007798(v10, v8);
      }
      [(ASViewServiceViewController *)self _dismissAndExit];
    }
  }
  else
  {
    v11 = sub_100002680();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100007754(v11);
    }
    [(ASViewServiceViewController *)self _dismissAndExit];
  }
}

- (void)setupWithExportedCredentialData:(id)a3 exporterBundleID:(id)a4 xpcEndpoint:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(ASViewServiceViewController *)self _setupWithXPCEndpoint:a5];
  v10 = (NSString *)[v8 copy];

  exporterBundleID = self->_exporterBundleID;
  self->_exporterBundleID = v10;

  id v12 = (NSData *)[v9 copy];
  exportedCredentialData = self->_exportedCredentialData;
  self->_exportedCredentialData = v12;
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = ASCAuthorizationErrorDomain;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v11 = (unint64_t)[v10 events] & 0x10;
        if (v11 & 0xFFFFFFFFFFFFFFFELL | (unint64_t)[v10 events] & 1)
        {
          id v12 = sub_100002680();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Dismissing credential picker because of home button or lock button event.", buf, 2u);
          }
          v13 = +[NSError errorWithDomain:v8 code:2 userInfo:0];
          hostProxy = self->_hostProxy;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10000378C;
          v15[3] = &unk_10000C580;
          v15[4] = self;
          [(ASCAuthorizationPresenterHostProtocol *)hostProxy authorizationRequestFinishedWithCredential:0 error:v13 completionHandler:v15];
        }
        [v10 sendResponseWithUnHandledEvents:[v10 events] & ~v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)authorizationViewController:(id)a3 didRequestCredentialForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  hostProxy = self->_hostProxy;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003868;
  v14[3] = &unk_10000C5F8;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [(ASCAuthorizationPresenterHostProtocol *)hostProxy authorizationRequestInitiatedWithLoginChoice:a4 authenticatedContext:v13 completionHandler:v14];
}

- (void)authorizationViewController:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 userInfo];
  uint64_t v10 = AKErrorAlertShouldDismissUIAfterPresentationKey;
  unint64_t v11 = [v9 objectForKeyedSubscript:AKErrorAlertShouldDismissUIAfterPresentationKey];

  if (v11
    && ([v8 userInfo],
        id v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = objc_msgSend(v12, "safari_BOOLForKey:", v10),
        v12,
        (v13 & 1) == 0))
  {
    id v15 = sub_100002680();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Skipping UI dismissal after failed Sign in with Apple credential sign in attempt.", buf, 2u);
    }
  }
  else
  {
    hostProxy = self->_hostProxy;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000039C8;
    v16[3] = &unk_10000C580;
    v16[4] = self;
    [(ASCAuthorizationPresenterHostProtocol *)hostProxy authorizationRequestFinishedWithCredential:v7 error:v8 completionHandler:v16];
  }
}

- (void)authorizationViewController:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5
{
}

- (void)authorizationViewControllerDidCompleteInitialPresentation:(id)a3
{
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A64;
  block[3] = &unk_10000C580;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

- (void)dismissAndPresentAgain:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AF4;
  block[3] = &unk_10000C580;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)authorizationViewController:(id)a3 startCABLEAuthenticationWithCompletionHandler:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialExchangeViewController, 0);
  objc_storeStrong((id *)&self->_exportedCredentialData, 0);
  objc_storeStrong((id *)&self->_exporterBundleID, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_loginChoicesForQueuedUpdate, 0);
  objc_storeStrong((id *)&self->_interfaceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_lookupConnection, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_authorizationViewController, 0);
}

@end
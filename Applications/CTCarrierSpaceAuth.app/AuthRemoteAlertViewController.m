@interface AuthRemoteAlertViewController
- (BOOL)_loadAuthUrl;
- (BOOL)_loadPlanTermsUrl;
- (BOOL)_validateRedirectURL:(id)a3 withExpectedURL:(id)a4;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (id)_base64EncodedDictionary:(id)a3;
- (id)_decodeBase64Dictionary:(id)a3;
- (id)_generateStateDict;
- (id)_getNSURLSessionConfiguration;
- (id)_getURLFromContextForKey:(id)a3;
- (id)_getValueFromContextForKey:(id)a3;
- (id)_itemWithName:(id)a3 items:(id)a4;
- (void)_addOptionalParametersForAuthCodeRequest:(id)a3;
- (void)_configure;
- (void)_deactivate;
- (void)_evaluateBiometry:(id)a3;
- (void)_exchangeAuthCode:(id)a3;
- (void)_handleTokenResponse:(id)a3;
- (void)_loadRemoteUIController;
- (void)_loadURL:(id)a3;
- (void)_presentAlertController:(int64_t)a3;
- (void)_sendAuthFailure:(int64_t)a3 completion:(id)a4;
- (void)_sendAuthInfo:(id)a3 completion:(id)a4;
- (void)handleAppURL:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AuthRemoteAlertViewController

- (void)_loadURL:(id)a3
{
  id v4 = a3;
  v5 = sub_1000031A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading URL: %@", buf, 0xCu);
  }

  remoteUIController = self->_remoteUIController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000036DC;
  v7[3] = &unk_10000C428;
  v7[4] = self;
  [(RemoteUIController *)remoteUIController loadURL:v4 postBody:0 completion:v7];
}

- (BOOL)_loadPlanTermsUrl
{
  v3 = [(AuthRemoteAlertViewController *)self _getURLFromContextForKey:@"kCTCarrierSpacePlanTermsURL"];
  if (v3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    remoteUIController = self->_remoteUIController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003894;
    v9[3] = &unk_10000C478;
    objc_copyWeak(&v10, &location);
    [(RemoteUIController *)remoteUIController setHandlerForElementName:@"agree" handler:v9];
    v5 = self->_remoteUIController;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000039BC;
    v7[3] = &unk_10000C478;
    objc_copyWeak(&v8, &location);
    [(RemoteUIController *)v5 setHandlerForElementName:@"disagree" handler:v7];
    [(AuthRemoteAlertViewController *)self _loadURL:v3];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v3 != 0;
}

- (void)_addOptionalParametersForAuthCodeRequest:(id)a3
{
  id v6 = a3;
  id v4 = [(AuthRemoteAlertViewController *)self _getValueFromContextForKey:@"kCTCarrierSpaceAuthICCID"];
  if (v4) {
    [v6 setIccid:v4];
  }
  v5 = [(AuthRemoteAlertViewController *)self _getValueFromContextForKey:@"kCTCarrierSpaceAuthScope"];
  if (v5) {
    [v6 setScope:v5];
  }
}

- (id)_generateStateDict
{
  v2 = +[NSMutableData dataWithLength:32];
  id v3 = [v2 length];
  id v4 = v2;
  if (SecRandomCopyBytes(kSecRandomDefault, (size_t)v3, [v4 mutableBytes]))
  {
    v5 = 0;
  }
  else
  {
    v9[0] = @"timestamp";
    id v6 = +[NSDate date];
    v9[1] = @"nonce";
    v10[0] = v6;
    v7 = [v4 base64EncodedStringWithOptions:0];
    v10[1] = v7;
    v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  }

  return v5;
}

- (id)_base64EncodedDictionary:(id)a3
{
  uint64_t v6 = 0;
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

- (id)_decodeBase64Dictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  if (v4)
  {
    uint64_t v7 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_loadAuthUrl
{
  id v3 = [(AuthRemoteAlertViewController *)self _getURLFromContextForKey:@"kCTCarrierSpaceAuthorizationURL"];
  if (v3
    && ([(AuthRemoteAlertViewController *)self _getValueFromContextForKey:@"kCTCarrierSpaceClientID"], id v4 = (NSString *)objc_claimAutoreleasedReturnValue(), clientID = self->_clientID, self->_clientID = v4, clientID, self->_clientID))
  {
    uint64_t v6 = [[AuthCodeHttpRequest alloc] initWithBaseURL:v3 clientID:self->_clientID];
    [(AuthRemoteAlertViewController *)self _addOptionalParametersForAuthCodeRequest:v6];
    uint64_t v7 = [(AuthRemoteAlertViewController *)self _getValueFromContextForKey:@"kCTCarrierSpaceAuthSupportsStateParameter"];
    if ([v7 BOOLValue])
    {
      id v8 = [(AuthRemoteAlertViewController *)self _generateStateDict];
      authState = self->_authState;
      self->_authState = v8;

      id v10 = [(AuthRemoteAlertViewController *)self _base64EncodedDictionary:self->_authState];
      [(AuthCodeHttpRequest *)v6 setState:v10];
    }
    authCodeRequest = self->_authCodeRequest;
    self->_authCodeRequest = v6;
    v12 = v6;

    v13 = [(AuthCodeHttpRequest *)v12 url];

    [(AuthRemoteAlertViewController *)self _loadURL:v13];
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_getNSURLSessionConfiguration
{
  v2 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  uint64_t v5 = objc_opt_class();
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];
  [v2 setProtocolClasses:v3];

  [v2 set_sourceApplicationSecondaryIdentifier:kCTCarrierSpaceConnectionAccountIdentifier];

  return v2;
}

- (void)_loadRemoteUIController
{
  id v3 = [LoadingIndicatorViewController alloc];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"LOADING" value:&stru_10000C9B8 table:@"Localizable"];
  uint64_t v6 = [(LoadingIndicatorViewController *)v3 initWithTitle:v5 message:0];

  [(AuthViewController *)self->_authViewController pushViewController:v6 animated:0];
  uint64_t v7 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v7;

  [(RemoteUIController *)self->_remoteUIController setDelegate:self];
  if (sub_100003240())
  {
    id v9 = [(RemoteUIController *)self->_remoteUIController loader];
    [v9 setAllowNonSecureHTTP:1];
  }
  [(RemoteUIController *)self->_remoteUIController setNavigationController:self->_authViewController];
  id v10 = [(AuthRemoteAlertViewController *)self _getNSURLSessionConfiguration];
  [(RemoteUIController *)self->_remoteUIController setSessionConfiguration:v10];

  if (![(AuthRemoteAlertViewController *)self _loadPlanTermsUrl]
    && ![(AuthRemoteAlertViewController *)self _loadAuthUrl])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004140;
    v11[3] = &unk_10000C450;
    v11[4] = self;
    [(AuthRemoteAlertViewController *)self _sendAuthFailure:8 completion:v11];
  }
}

- (void)_configure
{
  id v3 = [(AuthRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v3 setDesiredHardwareButtonEvents:16];

  id v4 = [(AuthRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v4 setDesiredAutoLockDuration:150.0];

  uint64_t v5 = [(AuthRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  uint64_t v6 = (CTCarrierSpaceClient *)[objc_alloc((Class)CTCarrierSpaceClient) initWithQueue:&_dispatch_main_q];
  client = self->_client;
  self->_client = v6;

  id v8 = self->_client;

  [(CTCarrierSpaceClient *)v8 setUserInAuthFlow:1 completion:&stru_10000C4B8];
}

- (void)_deactivate
{
  id location = 0;
  objc_initWeak(&location, self);
  client = self->_client;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000042E4;
  v4[3] = &unk_10000C508;
  objc_copyWeak(&v5, &location);
  [(CTCarrierSpaceClient *)client setUserInAuthFlow:0 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_getValueFromContextForKey:(id)a3
{
  return [(NSDictionary *)self->_launchContext valueForKey:a3];
}

- (id)_getURLFromContextForKey:(id)a3
{
  id v3 = [(AuthRemoteAlertViewController *)self _getValueFromContextForKey:a3];
  id v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AuthRemoteAlertViewController;
  [(AuthRemoteAlertViewController *)&v4 viewDidAppear:a3];
  [(AuthRemoteAlertViewController *)self _configure];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)AuthRemoteAlertViewController;
  [(AuthRemoteAlertViewController *)&v11 viewDidLoad];
  id v3 = +[UIApplication sharedApplication];
  objc_super v4 = [v3 delegate];

  id v5 = [v4 launchContext];
  launchContext = self->_launchContext;
  self->_launchContext = v5;

  [v4 setAlertViewController:self];
  uint64_t v7 = [[AuthViewController alloc] initWithNibName:0 bundle:0];
  authViewController = self->_authViewController;
  self->_authViewController = v7;

  [(AuthViewController *)self->_authViewController loadView];
  [(AuthViewController *)self->_authViewController setDelegate:self];
  id v9 = self->_authViewController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100004610;
  v10[3] = &unk_10000C4E0;
  v10[4] = self;
  [(AuthRemoteAlertViewController *)self presentViewController:v9 animated:1 completion:v10];
  [(AuthRemoteAlertViewController *)self _loadRemoteUIController];
}

- (void)_sendAuthInfo:(id)a3 completion:(id)a4
{
}

- (void)_sendAuthFailure:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[CTCarrierSpaceError errorForCode:a3];
  [(CTCarrierSpaceClient *)self->_client authenticationDidFail:v7 completion:v6];
}

- (void)_presentAlertController:(int64_t)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000047F4;
  v7[3] = &unk_10000C4E0;
  void v7[4] = self;
  +[AlertControllerFactory alertControllerWithError:a3 completion:v7];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004870;
  block[3] = &unk_10000C530;
  block[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_itemWithName:(id)a3 items:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000049C0;
  v11[3] = &unk_10000C558;
  id v7 = v5;
  id v12 = v7;
  id v8 = [v6 indexOfObjectPassingTest:v11];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 objectAtIndex:v8];
  }

  return v9;
}

- (void)_evaluateBiometry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)LAContext);
  id v12 = 0;
  unsigned __int8 v6 = [v5 canEvaluatePolicy:1 error:&v12];
  id v7 = v12;
  if ((v6 & 1) != 0 && (id v8 = [v5 biometryType]) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_100004B2C;
    v9[3] = &unk_10000C580;
    void v9[4] = self;
    id v11 = v8;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_handleTokenResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];

  if (v5)
  {
    unsigned __int8 v6 = sub_1000031A8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100005C98(v4);
    }

    id v7 = self;
    uint64_t v8 = 1;
    goto LABEL_11;
  }
  uint64_t v9 = [v4 token];
  if (!v9 || (id v10 = (void *)v9, v11 = [v4 statusCode], v10, v11 != (id)200))
  {
    sub_100002784(v4);
    id v7 = self;
    uint64_t v8 = 2;
LABEL_11:
    [(AuthRemoteAlertViewController *)v7 _presentAlertController:v8];
    goto LABEL_12;
  }
  sub_100002680(2, 0);
  id v12 = sub_1000031A8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v4 token];
    *(_DWORD *)buf = 138412290;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully received acess token %@", buf, 0xCu);
  }
  id v14 = objc_alloc_init((Class)CTCarrierSpaceAuthInfo);
  v15 = [v4 token];
  v16 = [v15 dataUsingEncoding:4];
  [v14 setAccessToken:v16];

  v17 = [v4 refreshToken];
  v18 = [v17 dataUsingEncoding:4];
  [v14 setRefreshToken:v18];

  v19 = [v4 expiryDate];
  [v14 setExpiresAt:v19];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100004E44;
  v21[3] = &unk_10000C5A8;
  id v22 = v14;
  v23 = self;
  id v20 = v14;
  [(AuthRemoteAlertViewController *)self _evaluateBiometry:v21];

LABEL_12:
}

- (void)_exchangeAuthCode:(id)a3
{
  id v4 = a3;
  id v5 = [(AuthRemoteAlertViewController *)self _getURLFromContextForKey:@"kCTCarrierSpaceAuthTokenURL"];
  unsigned __int8 v6 = +[AuthTokenHttpRequest urlRequestForBaseURL:v5 clientID:self->_clientID authCode:v4];
  id v7 = sub_1000031A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending request for auth code exchange: %@", buf, 0xCu);
  }

  uint64_t v8 = [(AuthRemoteAlertViewController *)self _getNSURLSessionConfiguration];
  uint64_t v9 = +[NSURLSession sessionWithConfiguration:v8];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000050D4;
  v11[3] = &unk_10000C5D0;
  objc_copyWeak(&v12, (id *)buf);
  id v10 = [v9 dataTaskWithRequest:v6 completionHandler:v11];
  [v10 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_validateRedirectURL:(id)a3 withExpectedURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 scheme];
  uint64_t v8 = [v6 scheme];
  if ((v7 != 0) == (v8 != 0))
  {
    id v10 = [v5 host];
    id v11 = [v6 host];
    if ((v10 != 0) != (v11 != 0))
    {
      unsigned __int8 v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
    v13 = [v5 path];
    id v14 = [v6 path];
    char v15 = (v13 != 0) ^ (v14 != 0);

    if (v15)
    {
LABEL_10:
      unsigned __int8 v9 = 0;
      goto LABEL_8;
    }
    uint64_t v16 = [v5 scheme];
    if (v16)
    {
      v17 = (void *)v16;
      uint64_t v18 = [v6 scheme];
      if (v18)
      {
        v19 = (void *)v18;
        id v20 = [v5 scheme];
        v21 = [v6 scheme];
        unsigned int v22 = [v20 isEqualToString:v21];

        if (!v22) {
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v23 = [v5 host];
    if (v23)
    {
      v24 = (void *)v23;
      uint64_t v25 = [v6 host];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [v5 host];
        v28 = [v6 host];
        unsigned int v29 = [v27 isEqualToString:v28];

        if (!v29) {
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v30 = [v5 path];
    if (!v30)
    {
      unsigned __int8 v9 = 1;
      goto LABEL_8;
    }
    id v7 = (void *)v30;
    uint64_t v31 = [v6 path];
    if (!v31)
    {
      unsigned __int8 v9 = 1;
      goto LABEL_7;
    }
    uint64_t v8 = (void *)v31;
    id v10 = [v5 path];
    id v11 = [v6 path];
    unsigned __int8 v9 = [v10 isEqualToString:v11];
    goto LABEL_5;
  }
  unsigned __int8 v9 = 0;
LABEL_6:

LABEL_7:
LABEL_8:

  return v9;
}

- (void)handleAppURL:(id)a3
{
  id v4 = a3;
  authCodeRequest = self->_authCodeRequest;
  if (authCodeRequest)
  {
    id v6 = [(AuthCodeHttpRequest *)authCodeRequest redirectURI];
    id v7 = +[NSURL URLWithString:v6];

    if ([(AuthRemoteAlertViewController *)self _validateRedirectURL:v4 withExpectedURL:v7])
    {
      uint64_t v8 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:0];
      unsigned __int8 v9 = [v8 queryItems];
      if (!self->_authState) {
        goto LABEL_8;
      }
      id v10 = [(AuthRemoteAlertViewController *)self _itemWithName:@"state" items:v9];
      if (!v10)
      {
        id v11 = sub_1000031A8();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100005DC4();
        }
        goto LABEL_25;
      }
      id v11 = v10;
      id v12 = [v10 value];
      v13 = [(AuthRemoteAlertViewController *)self _decodeBase64Dictionary:v12];

      if (v13)
      {
        if ([v13 isEqualToDictionary:self->_authState])
        {

LABEL_8:
          id v14 = [(AuthRemoteAlertViewController *)self _itemWithName:@"code" items:v9];
          id v11 = v14;
          if (v14)
          {
            char v15 = [v14 value];
            [(AuthRemoteAlertViewController *)self _exchangeAuthCode:v15];

            uint64_t v16 = self->_authCodeRequest;
            self->_authCodeRequest = 0;

            authState = self->_authState;
            self->_authState = 0;
          }
          else
          {
            sub_100002680(2, 1);
            v19 = sub_1000031A8();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_100005D50();
            }

            [(AuthRemoteAlertViewController *)self _presentAlertController:2];
          }
          goto LABEL_25;
        }
        sub_100002680(2, 5);
        id v20 = sub_1000031A8();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100005E2C();
        }
      }
      else
      {
        id v20 = sub_1000031A8();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100005DF8();
        }
      }

      [(AuthRemoteAlertViewController *)self _presentAlertController:2];
LABEL_25:

      goto LABEL_26;
    }
    sub_100002680(2, 4);
    uint64_t v18 = sub_1000031A8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100005E60();
    }

    [(AuthRemoteAlertViewController *)self _presentAlertController:2];
  }
  else
  {
    id v7 = sub_1000031A8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005D1C();
    }
  }
LABEL_26:
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  return 1;
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005774;
  v5[3] = &unk_10000C5F8;
  v5[4] = self;
  [a3 setHandlerForElementName:@"cancel" handler:v5, a5];
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    unsigned __int8 v9 = [v7 domain];
    unsigned int v10 = [v9 isEqualToString:NSURLErrorDomain];

    if (v10)
    {
      if ([v8 code] != (id)-999)
      {
        id v11 = sub_1000031A8();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100005EE4();
        }

        [(AuthRemoteAlertViewController *)self _presentAlertController:1];
      }
    }
  }
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5 = a4;
  if ([v5 statusCode] != (id)200 && objc_msgSend(v5, "statusCode") != (id)302)
  {
    id v6 = sub_1000031A8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100005F58(v5);
    }

    sub_100002680(3, (uint64_t)[v5 statusCode]);
    [(AuthRemoteAlertViewController *)self _presentAlertController:1];
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (*a5 == 1)
  {
    *a5 = 2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000059D4;
    v5[3] = &unk_10000C450;
    v5[4] = self;
    [(AuthRemoteAlertViewController *)self _sendAuthFailure:10 completion:v5];
  }
}

- (void)handleButtonActions:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if (((unint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) events] & 0x11) != 0)
        {
          unsigned __int8 v9 = sub_1000031A8();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "User pressed lock or home button, dismissing ourselves", buf, 2u);
          }

          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          void v10[2] = sub_100005B84;
          v10[3] = &unk_10000C450;
          v10[4] = self;
          [(AuthRemoteAlertViewController *)self _sendAuthFailure:10 completion:v10];
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authState, 0);
  objc_storeStrong((id *)&self->_authCodeRequest, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);

  objc_storeStrong((id *)&self->_authViewController, 0);
}

@end
@interface AKAppSSOExtensionViewController
- (AKAppSSOExtensionViewController)init;
- (AKWebAuthorizationController)proxy;
- (BOOL)_auditTokenFromData:(id)a3 auditToken:(id *)a4;
- (BOOL)_canProcessRequestForFirstParty:(id)a3;
- (BOOL)checkEntitlementForAuditToken:(id *)a3 entitlement:(id)a4;
- (id)topPresentedViewControllerForController:(id)a3;
- (void)_handleUnknowRequest:(id)a3;
- (void)_performAuthorizationWithRequest:(id)a3;
- (void)_performPasswordResetNativeTakeOverWithRequest:(id)a3;
- (void)beginAuthorizationWithRequest:(id)a3;
- (void)cancelAuthorizationWithRequest:(id)a3;
- (void)setProxy:(id)a3;
- (void)viewDidLoad;
@end

@implementation AKAppSSOExtensionViewController

- (AKAppSSOExtensionViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKAppSSOExtensionViewController;
  v2 = [(AKAppSSOExtensionViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AKWebAuthorizationController);
    proxy = v2->_proxy;
    v2->_proxy = v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AKAppSSOExtensionViewController;
  [(AKAppSSOExtensionViewController *)&v5 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(AKAppSSOExtensionViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)beginAuthorizationWithRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 url];
    int v24 = 138412290;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Begin authorization request with url %@", (uint8_t *)&v24, 0xCu);
  }
  proxy = self->_proxy;
  v8 = [v4 url];
  v9 = [(AKWebAuthorizationController *)proxy _parseURLQueryParams:v8];

  v10 = [v4 url];
  v11 = [v4 authorizationOptions];
  v12 = [v11 objectForKeyedSubscript:SOAuthorizationOptionInitiatorOrigin];
  v13 = +[NSURL URLWithString:v12];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = [v9 objectForKeyedSubscript:@"originURL"];
    id v15 = +[NSURL URLWithString:v16];
  }
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = v10;
  }
  if (+[AKAuthorizationController isURLFromAppleOwnedDomain:v17]&& ![(AKAppSSOExtensionViewController *)self _canProcessRequestForFirstParty:v4])
  {
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100008FB4(v21);
    }

    [v4 doNotHandle];
  }
  else
  {
    v18 = [v4 url];
    id v19 = +[AKAuthorizationController appSSORequestTypeForURL:v18];

    if (v19)
    {
      if (v19 == (id)2)
      {
        v23 = _AKLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SSO Request type: password reset native take over", (uint8_t *)&v24, 2u);
        }

        [(AKAppSSOExtensionViewController *)self _performPasswordResetNativeTakeOverWithRequest:v4];
      }
      else if (v19 == (id)1)
      {
        v20 = _AKLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SSO Request type: authorization/authentication", (uint8_t *)&v24, 2u);
        }

        [(AKAppSSOExtensionViewController *)self _performAuthorizationWithRequest:v4];
      }
    }
    else
    {
      v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SSO Request type: unknown", (uint8_t *)&v24, 2u);
      }

      [(AKAppSSOExtensionViewController *)self _handleUnknowRequest:v4];
    }
  }
}

- (void)cancelAuthorizationWithRequest:(id)a3
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AKAppSSOExtensionViewController cancelAuthorizationWithRequest called", v4, 2u);
  }
}

- (void)_performAuthorizationWithRequest:(id)a3
{
}

- (void)_performPasswordResetNativeTakeOverWithRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[AKFeatureManager sharedManager];
  unsigned __int8 v6 = [v5 isForgotPasswordNativeTakeoverEnabled];

  if (v6)
  {
    v7 = objc_alloc_init(AKPasswordResetController);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000083F8;
    v10[3] = &unk_100010660;
    id v11 = v4;
    v12 = v7;
    v8 = v7;
    [(AKPasswordResetController *)v8 presentPasswordResetForRequest:v11 completion:v10];
  }
  else
  {
    v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100008FF8(v9);
    }

    [(AKAppSSOExtensionViewController *)self _handleUnknowRequest:v4];
  }
}

- (void)_handleUnknowRequest:(id)a3
{
  uint64_t v3 = AKAppleIDAuthenticationErrorDomain;
  id v4 = a3;
  id v5 = +[NSError errorWithDomain:v3 code:-7111 userInfo:0];
  [v4 completeWithError:v5];
}

- (id)topPresentedViewControllerForController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 presentedViewController];

  id v5 = v3;
  if (v4)
  {
    unsigned __int8 v6 = v3;
    do
    {
      id v5 = [v6 presentedViewController];

      v7 = [v5 presentedViewController];

      unsigned __int8 v6 = v5;
    }
    while (v7);
  }

  return v5;
}

- (BOOL)_canProcessRequestForFirstParty:(id)a3
{
  id v4 = a3;
  id v5 = +[AKURLBag sharedBag];
  unsigned int v6 = [v5 isFirstPartyURLEntitlementCheckDisabled];

  if (v6)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server has disabled the entitlement checks for first party URLs. Proceeding.", buf, 2u);
    }
    BOOL v8 = 1;
  }
  else
  {
    v9 = [v4 authorizationRequest];
    v7 = [v9 auditTokenData];

    *(_OWORD *)buf = 0u;
    long long v13 = 0u;
    if ([(AKAppSSOExtensionViewController *)self _auditTokenFromData:v7 auditToken:buf])
    {
      v11[0] = *(_OWORD *)buf;
      v11[1] = v13;
      BOOL v8 = [(AKAppSSOExtensionViewController *)self checkEntitlementForAuditToken:v11 entitlement:@"com.apple.developer.web-browser"];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_auditTokenFromData:(id)a3 auditToken:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (!v5)
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if ([v5 length] != (id)32)
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = [v6 length];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unexpected size of auditToken: %u", (uint8_t *)v12, 8u);
    }

    goto LABEL_9;
  }
  if (a4)
  {
    v7 = [v6 bytes];
    long long v8 = v7[1];
    *(_OWORD *)a4->var0 = *v7;
    *(_OWORD *)&a4->var0[4] = v8;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)checkEntitlementForAuditToken:(id *)a3 entitlement:(id)a4
{
  id v5 = (__CFString *)a4;
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v6;
  v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  long long v8 = v7;
  CFErrorRef error = 0;
  if (v7)
  {
    CFBooleanRef v9 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v7, v5, &error);
    CFBooleanRef v10 = v9;
    if (v9)
    {
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue(v10);
        BOOL v13 = Value != 0;
        v14 = _AKLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v15 = @"NO";
          if (Value) {
            CFStringRef v15 = @"YES";
          }
          token.val[0] = 138412546;
          *(void *)&token.val[1] = v5;
          LOWORD(token.val[3]) = 2112;
          *(void *)((char *)&token.val[3] + 2) = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Process hasEntitlement to %@: %@", (uint8_t *)&token, 0x16u);
        }

LABEL_18:
        CFRelease(v10);
        BOOL v20 = v13;
        goto LABEL_19;
      }
    }
    CFErrorRef v16 = error;
    id v17 = _AKLogSystem();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100009198();
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138412290;
      *(void *)&token.val[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Entitlement %@ is not present", (uint8_t *)&token, 0xCu);
    }

    BOOL v13 = 0;
    BOOL v20 = 0;
    if (v10) {
      goto LABEL_18;
    }
  }
  else
  {
    id v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100009124();
    }

    BOOL v20 = 0;
  }
LABEL_19:
  if (error) {
    CFRelease(error);
  }
  if (v8) {
    CFRelease(v8);
  }

  return v20;
}

- (AKWebAuthorizationController)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
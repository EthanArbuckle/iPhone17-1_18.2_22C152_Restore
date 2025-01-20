@interface KerberosBaseViewController
- (BOOL)requestContainsNegotiateChallenge:(id)a3;
- (BOOL)retrievePasswordFromKeychain:(id)a3;
- (KerberosBaseViewController)initWithCoder:(id)a3;
- (KerberosBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (KerberosViewControllerData)loginViewController;
- (KerberosViewControllerData)passwordSyncViewController;
- (KerberosViewControllerData)passwordViewController;
- (NSOperationQueue)requestQueue;
- (SOKerberosExtensionProcess)process;
- (SOKeychainHelper)keychainHelper;
- (void)addViewControllerAsChildViewController:(id)a3;
- (void)beginAuthorizationWithRequest:(id)a3;
- (void)cancelAuthorizationWithRequest:(id)a3;
- (void)createLoginViewControllerWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleChangePasswordWithRequest:(id)a3;
- (void)handleKerberosOperations:(id)a3;
- (void)handleResult:(unint64_t)a3 context:(id)a4 error:(id)a5;
- (void)setKeychainHelper:(id)a3;
- (void)setLoginViewController:(id)a3;
- (void)setPasswordSyncViewController:(id)a3;
- (void)setPasswordViewController:(id)a3;
- (void)setProcess:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation KerberosBaseViewController

- (KerberosBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)KerberosBaseViewController;
  v4 = [(KerberosBaseViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (SOKerberosExtensionProcess *)objc_alloc_init((Class)SOKerberosExtensionProcess);
    process = v4->_process;
    v4->_process = v5;

    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    requestQueue = v4->_requestQueue;
    v4->_requestQueue = v7;

    [(NSOperationQueue *)v4->_requestQueue setMaxConcurrentOperationCount:1];
    v9 = (SOKeychainHelper *)objc_alloc_init((Class)SOKeychainHelper);
    keychainHelper = v4->_keychainHelper;
    v4->_keychainHelper = v9;
  }
  return v4;
}

- (KerberosBaseViewController)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)KerberosBaseViewController;
  v3 = [(KerberosBaseViewController *)&v11 initWithCoder:a3];
  if (v3)
  {
    v4 = (SOKerberosExtensionProcess *)objc_alloc_init((Class)SOKerberosExtensionProcess);
    process = v3->_process;
    v3->_process = v4;

    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    requestQueue = v3->_requestQueue;
    v3->_requestQueue = v6;

    [(NSOperationQueue *)v3->_requestQueue setMaxConcurrentOperationCount:1];
    v8 = (SOKeychainHelper *)objc_alloc_init((Class)SOKeychainHelper);
    keychainHelper = v3->_keychainHelper;
    v3->_keychainHelper = v8;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)KerberosBaseViewController;
  [(KerberosBaseViewController *)&v3 encodeWithCoder:a3];
}

- (void)beginAuthorizationWithRequest:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B580;
  v7[3] = &unk_100014428;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelAuthorizationWithRequest:(id)a3
{
  id v4 = a3;
  v5 = sub_10000B7C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000D778((uint64_t)v4, v5);
  }

  id v6 = [(KerberosBaseViewController *)self process];
  [v6 cancelAuthorizationWithRequest:v4];
}

- (void)handleKerberosOperations:(id)a3
{
  id v4 = a3;
  v5 = sub_10000B7C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000D7F0(v4);
  }

  id v6 = [(KerberosBaseViewController *)self process];
  [v6 handleKerberosOperations:v4 andDelegate:self];
}

- (void)handleChangePasswordWithRequest:(id)a3
{
  id v4 = a3;
  v5 = sub_10000B7C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000D878(v4);
  }

  id v6 = [(KerberosBaseViewController *)self process];
  v7 = [v6 createContextForRequest:v4];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BA10;
  v9[3] = &unk_100014428;
  id v10 = v7;
  objc_super v11 = self;
  id v8 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)addViewControllerAsChildViewController:(id)a3
{
  id v4 = a3;
  [(KerberosBaseViewController *)self addChildViewController:v4];
  v5 = [v4 view];

  id v6 = +[UIColor clearColor];
  v7 = [(KerberosBaseViewController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = [(KerberosBaseViewController *)self view];
  [v8 addSubview:v5];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [v5 topAnchor];
  v29 = [(KerberosBaseViewController *)self view];
  v27 = [v29 topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v30[0] = v26;
  v24 = [v5 bottomAnchor];
  v25 = [(KerberosBaseViewController *)self view];
  v23 = [v25 bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v30[1] = v22;
  v21 = [v5 leadingAnchor];
  v9 = [(KerberosBaseViewController *)self view];
  id v10 = [v9 leadingAnchor];
  objc_super v11 = [v21 constraintEqualToAnchor:v10];
  v30[2] = v11;
  objc_super v12 = [v5 trailingAnchor];
  v13 = [(KerberosBaseViewController *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v30[3] = v15;
  v16 = +[NSArray arrayWithObjects:v30 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  v17 = [(KerberosBaseViewController *)self view];
  v18 = [v17 window];
  [v18 layoutIfNeeded];

  v19 = [(KerberosBaseViewController *)self view];
  v20 = [v19 window];
  [v20 center];
}

- (BOOL)requestContainsNegotiateChallenge:(id)a3
{
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = objc_msgSend(v3, "httpHeaders", 0);
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
      id v10 = [v9 lowercaseString];
      unsigned __int8 v11 = [v10 isEqualToString:@"www-authenticate"];

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (v12)
    {
      v13 = [v3 httpHeaders];
      v14 = [v13 objectForKeyedSubscript:v12];

      BOOL v15 = 1;
      id v16 = [v14 rangeOfString:@"Negotiate" options:1];

      if (v16 != (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_9:

    id v12 = 0;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (void)createLoginViewControllerWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [KerberosLoginViewController alloc];
  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [(KerberosLoginViewController *)v5 initWithNibName:@"KerberosLoginViewController" bundle:v6];
  [(KerberosBaseViewController *)self setLoginViewController:v7];

  uint64_t v8 = [(KerberosBaseViewController *)self process];
  v9 = [(KerberosBaseViewController *)self loginViewController];
  [v9 setProcess:v8];

  id v10 = [(KerberosBaseViewController *)self keychainHelper];
  unsigned __int8 v11 = [(KerberosBaseViewController *)self loginViewController];
  [v11 setKeychainHelper:v10];

  id v12 = [(KerberosBaseViewController *)self loginViewController];
  [v12 setCurrentUIContext:v4];

  id v13 = [(KerberosBaseViewController *)self loginViewController];
  [(KerberosBaseViewController *)self addViewControllerAsChildViewController:v13];
}

- (void)handleResult:(unint64_t)a3 context:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10000B7C8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v43 = a3;
    __int16 v44 = 2112;
    id v45 = v8;
    __int16 v46 = 2112;
    id v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "handleResult: %lu, %@, %@", buf, 0x20u);
  }

  if (a3 == 18)
  {
    v17 = [v8 extensionData];
    if ([v17 requireUserPresence])
    {
      long long v18 = [v8 extensionData];
      long long v19 = [v18 certificateUUID];

      if (!v19)
      {
        long long v20 = [v8 extensionData];
        long long v21 = [v20 customUsernameLabel];

        if (![v21 length])
        {
          v22 = +[NSBundle mainBundle];
          uint64_t v23 = [v22 localizedStringForKey:@"ACTIVE_DIRECTORY_PRODUCTNAME" value:&stru_100014860 table:0];

          long long v21 = (void *)v23;
        }
        v24 = +[NSBundle mainBundle];
        v25 = [v24 localizedStringForKey:@"LAPOLICY_REASON" value:&stru_100014860 table:0];
        v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v21);

        id v27 = objc_alloc_init((Class)LAContext);
        [v8 setKeychainLAContext:v27];

        v28 = [v8 keychainLAContext];
        [v28 setOptionCallerName:@"Kerberos"];

        v29 = [v8 keychainLAContext];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10000C68C;
        v40[3] = &unk_100014450;
        v40[4] = self;
        id v41 = v8;
        [v29 evaluatePolicy:4 localizedReason:v26 reply:v40];

        goto LABEL_32;
      }
    }
    else
    {
    }
    goto LABEL_22;
  }
  if (a3 != 1) {
    goto LABEL_22;
  }
  if (([v8 attemptedToGetCredsFromKeychain] & 1) == 0
    && ([v8 credsCameFromKeychain] & 1) == 0)
  {
    unsigned __int8 v11 = [v8 extensionUserData];
    if (![v11 useKeychain])
    {
LABEL_10:

      goto LABEL_11;
    }
    id v12 = [v8 extensionData];
    if ([v12 requireUserPresence])
    {

      goto LABEL_10;
    }
    unsigned int v35 = [(KerberosBaseViewController *)self retrievePasswordFromKeychain:v8];

    if (v35) {
      goto LABEL_31;
    }
  }
LABEL_11:
  if (([v8 attemptedToGetCredsFromKeychain] & 1) == 0
    && ([v8 credsCameFromKeychain] & 1) == 0)
  {
    if (+[SOUtils isInternalBuild])
    {
      id v13 = [v8 extensionData];
      v14 = [v13 password];

      if (v14)
      {
        BOOL v15 = [v8 extensionData];
        id v16 = [v15 password];
        [v8 setPassword:v16];

LABEL_31:
        [v8 setAttemptedToGetCredsFromKeychain:1];
        long long v21 = [(KerberosBaseViewController *)self process];
        [v21 attemptKerberosWithContext:v8 andDelegate:self];
LABEL_32:

        goto LABEL_33;
      }
    }
  }
LABEL_22:
  v30 = [v8 extensionData];
  unsigned int v31 = [v30 usePlatformSSOTGT];

  if (!v31)
  {
LABEL_25:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C724;
    block[3] = &unk_100014738;
    block[4] = self;
    id v37 = v8;
    unint64_t v39 = a3;
    id v38 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_33;
  }
  v32 = [v8 extensionData];
  if ([v32 allowPlatformSSOAuthFallback])
  {
    unsigned __int8 v33 = [v8 returnCredentialOnly];

    if (v33) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  v34 = sub_10000B7C8();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "allowPlatformSSOAuthFallback not enabled", buf, 2u);
  }

  [v8 completeRequestWithDoNotHandle];
LABEL_33:
}

- (BOOL)retrievePasswordFromKeychain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serviceName];
  id v6 = sub_10000B7C8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting credentials from the keychain", buf, 2u);
  }

  uint64_t v7 = [(KerberosBaseViewController *)self keychainHelper];
  id v8 = [v4 keychainLAContext];
  id v14 = 0;
  id v15 = 0;
  unsigned int v9 = [v7 retrieveCredentialsFromKeychainWithContext:v8 service:v5 returnedUsername:&v15 returnedPassword:&v14];
  id v10 = v15;
  id v11 = v14;

  id v12 = sub_10000B7C8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "keychainErr returned %d", buf, 8u);
  }

  if (!v9)
  {
    [v4 setPassword:v11];
    [v4 setUserName:v10];
    [v4 setCredsCameFromKeychain:1];
  }

  return v9 == 0;
}

- (KerberosViewControllerData)passwordSyncViewController
{
  return self->_passwordSyncViewController;
}

- (void)setPasswordSyncViewController:(id)a3
{
}

- (KerberosViewControllerData)loginViewController
{
  return self->_loginViewController;
}

- (void)setLoginViewController:(id)a3
{
}

- (KerberosViewControllerData)passwordViewController
{
  return self->_passwordViewController;
}

- (void)setPasswordViewController:(id)a3
{
}

- (SOKerberosExtensionProcess)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (SOKeychainHelper)keychainHelper
{
  return self->_keychainHelper;
}

- (void)setKeychainHelper:(id)a3
{
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_passwordViewController, 0);
  objc_storeStrong((id *)&self->_loginViewController, 0);
  objc_storeStrong((id *)&self->_passwordSyncViewController, 0);
}

@end
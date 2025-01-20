@interface PassbookUIServiceAppDelegate
- (BOOL)_handleIssuerBindingRequestWithIssuerData:(id)a3 signature:(id)a4;
- (BOOL)_handleProvisioningContinuityNotification:(id)a3;
- (BOOL)_handleURLWithHost:(id)a3 components:(id)a4 userActivity:(id)a5;
- (BOOL)_handleUniversalLinkWithUserActivity:(id)a3;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (id)_componentsForURL:(id)a3;
- (void)_openURLInSafari:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)remoteNetworkPaymentCoordinator:(id)a3 didPresentPaymentSheet:(BOOL)a4;
@end

@implementation PassbookUIServiceAppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  v4 = +[PSListController appearance];
  v5 = +[UIColor labelColor];
  [v4 setTextColor:v5];

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = +[PKPassLibrary sharedInstance];
  passLibrary = self->_passLibrary;
  self->_passLibrary = v5;

  v7 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
  paymentService = self->_paymentService;
  self->_paymentService = v7;

  v9 = (PKRemoteNetworkPaymentCoordinator *)objc_alloc_init((Class)PKRemoteNetworkPaymentCoordinator);
  remotePaymentCoordinator = self->_remotePaymentCoordinator;
  self->_remotePaymentCoordinator = v9;

  [(PKRemoteNetworkPaymentCoordinator *)self->_remotePaymentCoordinator setDelegate:self];
  v11 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005E50;
  v14[3] = &unk_1000145A8;
  v15 = &stru_100014558;
  dispatch_async(v11, v14);

  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Passbook UI Service Did Finish Launching", (uint8_t *)v14, 2u);
  }

  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  v7 = [v6 scheme];
  if ([v7 isEqual:@"shoebox-service"])
  {
    v8 = [v6 host];
    if ([v8 isEqualToString:@"daemon-launch"])
    {
      v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Launch request received from daemon; notifying.",
          (uint8_t *)&v11,
          2u);
      }

      [(PKPaymentService *)self->_paymentService passbookUIServiceDidLaunch];
      goto LABEL_9;
    }
  }
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PassbookUIService did not understand URL %{public}@.", (uint8_t *)&v11, 0xCu);
  }
LABEL_9:

  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6 = a4;
  v7 = [v6 activityType];
  unsigned int v8 = [v7 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v8) {
    BOOL v9 = [(PassbookUIServiceAppDelegate *)self _handleUniversalLinkWithUserActivity:v6];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_componentsForURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)NSURLComponents) initWithURL:v3 resolvingAgainstBaseURL:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_handleUniversalLinkWithUserActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 webpageURL];
  id v6 = [(PassbookUIServiceAppDelegate *)self _componentsForURL:v5];
  if (!v6)
  {
    BOOL v23 = 0;
    goto LABEL_26;
  }
  v31 = self;
  id v32 = v4;
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Processing URL %{public}@", buf, 0xCu);
  }

  unsigned int v8 = [v6 scheme];
  v33 = [v6 host];
  BOOL v9 = [v6 URL];
  v10 = [v9 pathComponents];

  id v11 = [v10 count];
  id v12 = v8;
  v13 = v12;
  if (v12 != @"http")
  {
    if (!v12) {
      goto LABEL_24;
    }
    unsigned __int8 v14 = [(__CFString *)v12 isEqualToString:@"http"];

    if ((v14 & 1) == 0)
    {
      v15 = v13;
      if (v15 != @"https")
      {
        v16 = v15;
        unsigned int v17 = [(__CFString *)v15 isEqualToString:@"https"];

        if (!v17) {
          goto LABEL_24;
        }
      }
    }
  }
  v18 = (void *)PKWalletUniversalLinkHostName;
  id v19 = v33;
  id v20 = v18;
  if (v19 == v20)
  {

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
    v21 = v20;
    if (!v19 || !v20)
    {

      goto LABEL_24;
    }
    unsigned int v22 = [v19 isEqualToString:v20];

    if (!v22 || !v11) {
      goto LABEL_24;
    }
  }
  uint64_t v24 = 0;
  uint64_t v25 = PKURLActionRouteAppleCardPaymentPass;
  while (1)
  {
    v26 = [v10 objectAtIndexedSubscript:v24];
    if (![v26 isEqualToString:@"/"]) {
      break;
    }

LABEL_21:
    if (v11 == (id)++v24) {
      goto LABEL_24;
    }
  }
  unsigned int v27 = [v26 isEqualToString:v25];

  if (v27) {
    goto LABEL_21;
  }
  if (v24 == -1
    || ([v10 objectAtIndexedSubscript:v24],
        v29 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v30 = [(PassbookUIServiceAppDelegate *)v31 _handleURLWithHost:v29 components:v6 userActivity:v32], v29, (v30 & 1) == 0))
  {
LABEL_24:
    [(PassbookUIServiceAppDelegate *)v31 _openURLInSafari:v5];
    BOOL v23 = 0;
    goto LABEL_25;
  }
  BOOL v23 = 1;
LABEL_25:

  id v4 = v32;
LABEL_26:

  return v23;
}

- (BOOL)_handleURLWithHost:(id)a3 components:(id)a4 userActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_37;
  }
  id v11 = (void *)PKURLActionSecurePassSession;
  id v12 = v8;
  id v13 = v11;
  if (v13 == v12)
  {

    goto LABEL_7;
  }
  unsigned __int8 v14 = v13;
  if (!v13)
  {

    goto LABEL_12;
  }
  unsigned int v15 = [v12 isEqualToString:v13];

  if (v15)
  {
LABEL_7:
    v16 = [v9 fragment];
    unsigned int v17 = [v16 componentsSeparatedByString:@"&"];

    if ([v17 count] == (id)2)
    {
      id v18 = objc_alloc((Class)NSData);
      id v19 = [v17 objectAtIndexedSubscript:0];
      id v20 = [v18 initWithBase64EncodedString:v19 options:0];

      id v21 = objc_alloc((Class)NSData);
      unsigned int v22 = [v17 objectAtIndexedSubscript:1];
      id v23 = [v21 initWithBase64EncodedString:v22 options:0];

      BOOL v24 = [(PassbookUIServiceAppDelegate *)self _handleIssuerBindingRequestWithIssuerData:v20 signature:v23];
LABEL_19:

LABEL_24:
      goto LABEL_38;
    }
    uint64_t v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      v26 = "Missing required parameter for securePassSession.";
      unsigned int v27 = v25;
      uint32_t v28 = 2;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v45, v28);
    }
LABEL_23:

    BOOL v24 = 0;
    goto LABEL_24;
  }
LABEL_12:
  v29 = (void *)PKURLActionProvisioningContinuityKey;
  id v30 = v12;
  id v31 = v29;
  id v32 = v31;
  if (v31 == v30)
  {

    goto LABEL_17;
  }
  if (v31)
  {
    unsigned int v33 = [v30 isEqualToString:v31];

    if (!v33) {
      goto LABEL_26;
    }
LABEL_17:
    v34 = [v9 path];
    unsigned int v17 = [v34 pathComponents];

    v35 = (char *)[v17 indexOfObject:v32] + 1;
    if (v35 < [v17 count])
    {
      id v20 = [v17 objectAtIndexedSubscript:v35];
      BOOL v24 = [(PassbookUIServiceAppDelegate *)self _handleProvisioningContinuityNotification:v20];
      goto LABEL_19;
    }
    uint64_t v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = 138412290;
      v46 = v17;
      v26 = "Unable to handle provisioningContinuity url with path components: %@";
      unsigned int v27 = v25;
      uint32_t v28 = 12;
      goto LABEL_22;
    }
    goto LABEL_23;
  }

LABEL_26:
  v36 = (void *)PKURLActionRemoteNetworkPaymentInitiate;
  id v37 = v30;
  id v38 = v36;
  if (v38 == v37)
  {
  }
  else
  {
    v39 = v38;
    if (!v38)
    {

LABEL_37:
      BOOL v24 = 0;
      goto LABEL_38;
    }
    unsigned int v40 = [v37 isEqualToString:v38];

    if (!v40) {
      goto LABEL_37;
    }
  }
  if ((PKRemoteNetworkPaymentEnabled() & 1) == 0)
  {
    v43 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "App Delegate: URL not handled, feature not enabled", (uint8_t *)&v45, 2u);
    }

    goto LABEL_37;
  }
  remotePaymentCoordinator = self->_remotePaymentCoordinator;
  v42 = [v10 _originatingProcess];
  [(PKRemoteNetworkPaymentCoordinator *)remotePaymentCoordinator handlePaymentUserActivity:v10 originProcess:v42];

  BOOL v24 = 1;
LABEL_38:

  return v24;
}

- (BOOL)_handleIssuerBindingRequestWithIssuerData:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = PKValidateIssuerBindingData();
  if (v8) {
    [(PKPassLibrary *)self->_passLibrary presentIssuerBindingFlowForIssuerData:v6 signature:v7 orientation:&off_100014EF8];
  }

  return v8;
}

- (BOOL)_handleProvisioningContinuityNotification:(id)a3
{
  return 1;
}

- (void)_openURLInSafari:(id)a3
{
  id v3 = a3;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cannot handle universal link to URL: %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init((Class)_LSOpenConfiguration);
  uint64_t v11 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  id v12 = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 setFrontBoardOptions:v6];

  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005C34;
  v9[3] = &unk_100014580;
  id v10 = v3;
  id v8 = v3;
  [v7 openURL:v8 configuration:v5 completionHandler:v9];
}

- (void)buildMenuWithBuilder:(id)a3
{
}

- (void)remoteNetworkPaymentCoordinator:(id)a3 didPresentPaymentSheet:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App Delegate: Received didPresentPaymentSheet: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePaymentCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);

  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end
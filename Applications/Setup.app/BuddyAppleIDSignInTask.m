@interface BuddyAppleIDSignInTask
- (AAUISignInFlowControllerDelegate)flowControllerDelegate;
- (BOOL)enableFindMy;
- (BOOL)forceForegroundSignIn;
- (BOOL)ignoreLockAssertErrors;
- (BOOL)makeStoreServiceActive;
- (BOOL)requireAppleMAID;
- (BOOL)restoreFromBackupMode;
- (BOOL)skipDataclassEnablement;
- (BYPasscodeCacheManager)cacheManager;
- (BuddyAccountTools)accountTools;
- (BuddyAppleIDSignInTask)initWithFeatureFlags:(id)a3 accountTools:(id)a4;
- (BuddyFeatureFlags)featureFlags;
- (CDPUIController)cdpUIController;
- (CUMessageSession)messageSession;
- (UINavigationController)navigationController;
- (id)_createAuthenticationContext;
- (id)_createServiceContextWithAuthenticationResults:(id)a3;
- (id)_requiredTerms;
- (int64_t)serviceType;
- (void)_addCachedLocalSecretToCDPContext:(id)a3;
- (void)_authenticateWithContext:(id)a3 completion:(id)a4;
- (void)_signInToAllServicesUsingContext:(id)a3 serviceOwnersManager:(id)a4 completion:(id)a5;
- (void)_updateAgreedTerms:(id)a3;
- (void)authenticateForAccountCreationWithCompletion:(id)a3;
- (void)authenticateForCredentialRecoveryWithCompletion:(id)a3;
- (void)authenticateWithProximity:(id)a3;
- (void)authenticateWithUsername:(id)a3 companionDevice:(id)a4 anisetteDataProvider:(id)a5 completion:(id)a6;
- (void)authenticateWithUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)prepareSignInContext:(id)a3;
- (void)setCacheManager:(id)a3;
- (void)setCdpUIController:(id)a3;
- (void)setEnableFindMy:(BOOL)a3;
- (void)setFlowControllerDelegate:(id)a3;
- (void)setForceForegroundSignIn:(BOOL)a3;
- (void)setIgnoreLockAssertErrors:(BOOL)a3;
- (void)setMakeStoreServiceActive:(BOOL)a3;
- (void)setMessageSession:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setRequireAppleMAID:(BOOL)a3;
- (void)setRestoreFromBackupMode:(BOOL)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setSkipDataclassEnablement:(BOOL)a3;
- (void)signInToAllServicesWithAuthenticationResults:(id)a3 completion:(id)a4;
- (void)signInToServices:(id)a3 authenticationResults:(id)a4 completion:(id)a5;
@end

@implementation BuddyAppleIDSignInTask

- (BuddyAppleIDSignInTask)initWithFeatureFlags:(id)a3 accountTools:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v12;
  id v12 = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyAppleIDSignInTask;
  id v12 = [(BuddyAppleIDSignInTask *)&v9 init];
  objc_storeStrong(&v12, v12);
  if (v12)
  {
    *((void *)v12 + 3) = 1;
    *((unsigned char *)v12 + 10) = 1;
    *((unsigned char *)v12 + 11) = 1;
    unsigned __int8 v6 = +[AMSDevice deviceIsBundle];
    *((unsigned char *)v12 + 14) = v6 & 1;
    objc_storeStrong((id *)v12 + 6, location[0]);
    objc_storeStrong((id *)v12 + 7, obj);
  }
  v7 = (BuddyAppleIDSignInTask *)v12;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v7;
}

- (void)authenticateWithProximity:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc_init((Class)AKAppleIDProximityAuthenticationContext);
  [v5 setProximityAIDAHandler:&stru_1002B3870];
  v3 = [(BuddyAppleIDSignInTask *)v7 navigationController];
  [v5 setPresentingViewController:v3];

  if ([(BuddyAppleIDSignInTask *)v7 requireAppleMAID]) {
    [v5 setAppProvidedContext:kAppleMAIDSignInProvidedContext];
  }
  id v4 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  [v4 authenticateWithContext:v5 completion:location[0]];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = [(BuddyAppleIDSignInTask *)v16 _createAuthenticationContext];
  id v7 = location[0];
  v8 = +[NSCharacterSet whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];
  id v10 = location[0];
  location[0] = v9;

  v11 = [(BuddyAppleIDSignInTask *)v16 navigationController];
  [v12 setPresentingViewController:v11];

  [v12 setUsername:location[0]];
  [v12 _setPassword:v14];
  if ([(BuddyAppleIDSignInTask *)v16 requireAppleMAID]) {
    [v12 setAppProvidedContext:kAppleMAIDSignInProvidedContext];
  }
  [(BuddyAppleIDSignInTask *)v16 _authenticateWithContext:v12 completion:v13];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithUsername:(id)a3 companionDevice:(id)a4 anisetteDataProvider:(id)a5 completion:(id)a6
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  id v10 = [(BuddyAppleIDSignInTask *)v15 _createAuthenticationContext];
  [v10 setUsername:location[0]];
  id v9 = [(BuddyAppleIDSignInTask *)v15 navigationController];
  [v10 setPresentingViewController:v9];

  [v10 setCompanionDevice:v13];
  [v10 setAnisetteDataProvider:v12];
  [v10 setIsUsernameEditable:0];
  [v10 setShouldAllowAppleIDCreation:0];
  [v10 setShouldForceInteractiveAuth:0];
  [v10 setShouldUpdatePersistentServiceTokens:1];
  [v10 _setProxyingForApp:1];
  if ([(BuddyAppleIDSignInTask *)v15 requireAppleMAID]) {
    [v10 setAppProvidedContext:kAppleMAIDSignInProvidedContext];
  }
  [(BuddyAppleIDSignInTask *)v15 _authenticateWithContext:v10 completion:v11];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateForAccountCreationWithCompletion:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(BuddyAppleIDSignInTask *)v6 _createAuthenticationContext];
  v3 = [(BuddyAppleIDSignInTask *)v6 navigationController];
  [v4 setPresentingViewController:v3];

  [v4 setNeedsNewAppleID:1];
  [(BuddyAppleIDSignInTask *)v6 _authenticateWithContext:v4 completion:location[0]];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateForCredentialRecoveryWithCompletion:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(BuddyAppleIDSignInTask *)v6 _createAuthenticationContext];
  v3 = [(BuddyAppleIDSignInTask *)v6 navigationController];
  [v4 setPresentingViewController:v3];

  [v4 setNeedsCredentialRecovery:1];
  [(BuddyAppleIDSignInTask *)v6 _authenticateWithContext:v4 completion:location[0]];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)signInToAllServicesWithAuthenticationResults:(id)a3 completion:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v5 = v16;
  unsigned __int8 v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_10013EDB0;
  id v10 = &unk_1002B1758;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  [(BuddyAppleIDSignInTask *)v5 prepareSignInContext:&v6];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)signInToServices:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  int v7 = v20;
  int v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_10013F7BC;
  id v12 = &unk_1002B34B0;
  id v13 = v20;
  id v14 = v18;
  id v15 = location[0];
  id v16 = v17;
  [(BuddyAppleIDSignInTask *)v7 prepareSignInContext:&v8];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)prepareSignInContext:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyAppleIDSignInTask *)v6 accountTools];

  if (v3)
  {
    id v4 = [(BuddyAppleIDSignInTask *)v6 accountTools];
    [(BuddyAccountTools *)v4 waitUntilSafeToSignInWithCompletion:location[0]];
  }
  else if (location[0])
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (id)_createAuthenticationContext
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)AKAppleIDAuthenticationPurpleBuddyContext);
  [location[0] setShouldOfferSecurityUpgrade:1];
  [location[0] setServiceType:[v5 serviceType]];
  [location[0] setAnticipateEscrowAttempt:1];
  if (+[BYWarranty shouldDisplay]) {
    [location[0] setHttpHeadersForRemoteUI:&off_1002C15E8];
  }
  id v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

- (id)_createServiceContextWithAuthenticationResults:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc((Class)CDPUIController);
  id v4 = [(BuddyAppleIDSignInTask *)v38 navigationController];
  id v5 = [v3 initWithPresentingViewController:v4];
  [(BuddyAppleIDSignInTask *)v38 setCdpUIController:v5];

  unsigned __int8 v6 = [(BuddyAppleIDSignInTask *)v38 cdpUIController];
  [(CDPUIController *)v6 setForceInlinePresentation:1];

  id v7 = objc_alloc((Class)AAUISignInFlowControllerDelegate);
  int v8 = [(BuddyAppleIDSignInTask *)v38 navigationController];
  id v9 = [v7 initWithPresentingViewController:v8];
  [(BuddyAppleIDSignInTask *)v38 setFlowControllerDelegate:v9];

  int v10 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
  [(AAUISignInFlowControllerDelegate *)v10 setShouldStashLoginResponse:1];

  id v11 = [location[0] objectForKeyedSubscript:AKAuthenticationAcceptedTermsKey];
  if (!v11)
  {
    id v12 = [(BuddyAppleIDSignInTask *)v38 _requiredTerms];
    id v13 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
    [(AAUISignInFlowControllerDelegate *)v13 setRequiredTerms:v12];
  }
  if ([(BuddyAppleIDSignInTask *)v38 enableFindMy])
  {
    id v14 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
    [(AAUISignInFlowControllerDelegate *)v14 setFindMyActivationAction:0];
  }
  else
  {
    id v14 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
    [(AAUISignInFlowControllerDelegate *)v14 setFindMyActivationAction:2];
  }

  id v15 = objc_alloc((Class)CDPContext);
  id v16 = [v15 initWithAuthenticationResults:location[0]];
  id v17 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
  [(AAUISignInFlowControllerDelegate *)v17 setCdpContext:v16];

  LOBYTE(v16) = [(BuddyAppleIDSignInTask *)v38 ignoreLockAssertErrors];
  id v18 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
  id v19 = [(AAUISignInFlowControllerDelegate *)v18 cdpContext];
  [v19 set_ignoreLockAssertErrors:v16 & 1];

  v20 = [(BuddyAppleIDSignInTask *)v38 messageSession];
  v21 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
  id v22 = [(AAUISignInFlowControllerDelegate *)v21 cdpContext];
  [v22 setSharingChannel:v20];

  LOBYTE(v20) = [(BuddyAppleIDSignInTask *)v38 restoreFromBackupMode];
  v23 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
  id v24 = [(AAUISignInFlowControllerDelegate *)v23 cdpContext];
  [v24 setIsAttemptingBackupRestore:v20 & 1];

  v25 = [(BuddyAppleIDSignInTask *)v38 featureFlags];
  LOBYTE(v23) = [(BuddyFeatureFlags *)v25 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v23)
  {
    v26 = v38;
    v27 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
    id v28 = [(AAUISignInFlowControllerDelegate *)v27 cdpContext];
    [(BuddyAppleIDSignInTask *)v26 _addCachedLocalSecretToCDPContext:v28];
  }
  id v36 = objc_alloc_init((Class)AMSSignInContext);
  [v36 setIgnoreAccountConversion:1];
  [v36 setDebugReason:@"Setup Assistant"];
  id v35 = objc_alloc_init((Class)AIDAMutableServiceContext);
  [v35 setAuthenticationResults:location[0]];
  v29 = [(BuddyAppleIDSignInTask *)v38 navigationController];
  [v35 setViewController:v29];

  v30 = [(BuddyAppleIDSignInTask *)v38 cdpUIController];
  [v35 setCdpUiProvider:v30];

  [v35 setShouldForceOperation:0];
  [v35 setOperationUIPermissions:1];
  v39[0] = AIDAServiceTypeCloud;
  v31 = [(BuddyAppleIDSignInTask *)v38 flowControllerDelegate];
  v40[0] = v31;
  v39[1] = AIDAServiceTypeStore;
  v40[1] = v36;
  v32 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  [v35 setSignInContexts:v32];

  id v33 = v35;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v33;
}

- (void)_addCachedLocalSecretToCDPContext:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v11 = [(BuddyAppleIDSignInTask *)v16 cacheManager];
    if (v11)
    {
      id v8 = [v11 cachedLocalSecret];
      if (v8)
      {
        id v3 = [v8 validatedSecret];
        [location[0] setCachedLocalSecret:v3];

        id v4 = [v8 secretType];
        [location[0] setCachedLocalSecretType:v4];
        os_log_t v5 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          sub_100095D98((uint64_t)v17, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Successfully updated local secret within CDPContext.", v17, 0xCu);
        }
        objc_storeStrong((id *)&v5, 0);
        int v12 = 0;
      }
      else
      {
        os_log_t v7 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          sub_100095D98((uint64_t)v18, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
          _os_log_impl((void *)&_mh_execute_header, v7, v6, "%s: No cached local secret.", v18, 0xCu);
        }
        objc_storeStrong((id *)&v7, 0);
        int v12 = 1;
      }
      objc_storeStrong(&v8, 0);
    }
    else
    {
      os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_100095D98((uint64_t)v19, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
        _os_log_error_impl((void *)&_mh_execute_header, v10, v9, "%s: Cache manager was released.", v19, 0xCu);
      }
      objc_storeStrong((id *)&v10, 0);
      int v12 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100095D98((uint64_t)buf, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v13, "%s: Could not add cached local secret to nil CDPContext", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_authenticateWithContext:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  [v5 authenticateWithContext:location[0] completion:v6];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)_requiredTerms
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableSet);
  if (+[BYWarranty shouldDisplay]) {
    [location[0] addObject:AATermsEntryWarranty];
  }
  if (+[BYLicenseAgreement needsToAcceptNewAgreement](BYLicenseAgreement, "needsToAcceptNewAgreement"))[location[0] addObject:AATermsEntryDevice]; {
  id v2 = location[0];
  }
  objc_storeStrong(location, 0);
  return v2;
}

- (void)_updateAgreedTerms:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [location[0] accountForService:AIDAServiceTypeCloud];
  id v3 = [v5 aa_lastAgreedTermsInfo];
  id v4 = [v3 objectForKeyedSubscript:@"SLAVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", [v4 integerValue]);
    +[BuddyTermsConditionsFlow didAgreeToServerTerms];
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_signInToAllServicesUsingContext:(id)a3 serviceOwnersManager:(id)a4 completion:(id)a5
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  if ([(BuddyAppleIDSignInTask *)v24 forceForegroundSignIn])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v7 = oslog;
      os_log_type_t v8 = v19;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Forcing synchronous sign-in of all services...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v25[0] = AIDAServiceTypeCloud;
    v25[1] = AIDAServiceTypeStore;
    v25[2] = AIDAServiceTypeFaceTime;
    v25[3] = AIDAServiceTypeMessages;
    v25[4] = AIDAServiceTypeGameCenter;
    id v17 = +[NSArray arrayWithObjects:v25 count:5];
    id v9 = v22;
    id v10 = location[0];
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = sub_100140948;
    id v15 = &unk_1002B3910;
    id v16 = v21;
    [v9 signInToServices:v17 usingContext:v10 completion:&v11];
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    [v22 signInToAllServicesInBackgroundUsingContext:location[0] completion:v21];
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (BOOL)skipDataclassEnablement
{
  return self->_skipDataclassEnablement;
}

- (void)setSkipDataclassEnablement:(BOOL)a3
{
  self->_skipDataclassEnablement = a3;
}

- (BOOL)makeStoreServiceActive
{
  return self->_makeStoreServiceActive;
}

- (void)setMakeStoreServiceActive:(BOOL)a3
{
  self->_makeStoreServiceActive = a3;
}

- (BOOL)enableFindMy
{
  return self->_enableFindMy;
}

- (void)setEnableFindMy:(BOOL)a3
{
  self->_enableFindMy = a3;
}

- (BOOL)restoreFromBackupMode
{
  return self->_restoreFromBackupMode;
}

- (void)setRestoreFromBackupMode:(BOOL)a3
{
  self->_restoreFromBackupMode = a3;
}

- (BOOL)requireAppleMAID
{
  return self->_requireAppleMAID;
}

- (void)setRequireAppleMAID:(BOOL)a3
{
  self->_requireAppleMAID = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (BOOL)forceForegroundSignIn
{
  return self->_forceForegroundSignIn;
}

- (void)setForceForegroundSignIn:(BOOL)a3
{
  self->_forceForegroundSignIn = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
}

- (BYPasscodeCacheManager)cacheManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheManager);

  return (BYPasscodeCacheManager *)WeakRetained;
}

- (void)setCacheManager:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BuddyAccountTools)accountTools
{
  return self->_accountTools;
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
}

- (AAUISignInFlowControllerDelegate)flowControllerDelegate
{
  return self->_flowControllerDelegate;
}

- (void)setFlowControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface AKFollowUpViewController
- (BOOL)_shouldFetchUserInformationForAccount:(id)a3;
- (id)_URLWithString:(id)a3 byAppendingParameters:(id)a4;
- (id)_primaryAppleAccount;
- (void)_beginServerUIRequest:(id)a3 completion:(id)a4;
- (void)_fetchUserInformationIfNeededForAltDSID:(id)a3 completion:(id)a4;
- (void)_handleAuthKitAction:(id)a3 forItem:(id)a4 completion:(id)a5;
- (void)_handleAuthKitSignal:(unint64_t)a3 forItem:(id)a4 completion:(id)a5;
- (void)_handleFinalServerResponse:(id)a3 completion:(id)a4;
- (void)_handleLocalURLKey:(id)a3 withActionIdentifier:(id)a4 forItem:(id)a5 completion:(id)a6;
- (void)_handleSensitiveURL:(id)a3 withActionIdentifier:(id)a4 completion:(id)a5;
- (void)_handleURL:(id)a3 withActionIdentifier:(id)a4 completion:(id)a5;
- (void)_prepareAuthContextForAltDSID:(id)a3;
- (void)_reauthenticateContext:(id)a3;
- (void)_refreshServerUIDelegateWithParentContext:(id)a3 item:(id)a4 completion:(id)a5;
- (void)_startCDPRepairWithAdditionalData:(id)a3 completion:(id)a4;
- (void)_startShowingServerUI:(id)a3;
- (void)_updateAccountUsernameWithHarvestedData:(id)a3;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AKFollowUpViewController

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "authkit-ext/synchronize-follow-ups", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000036DC;
  v19[3] = &unk_10000C3F0;
  id v6 = v4;
  id v20 = v6;
  v7 = objc_retainBlock(v19);
  v8 = objc_alloc_init(AKFollowUpSynchronizer);
  v9 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
  [(AKFollowUpSynchronizer *)v8 setFollowupProvider:v9];

  v10 = [(AKFollowUpViewController *)self _primaryAppleAccount];
  v11 = +[AKAccountManager sharedInstance];
  v12 = [v11 store];
  id v18 = 0;
  unsigned int v13 = [(AKFollowUpSynchronizer *)v8 synchronizeFollowUpsForAccount:v10 inStore:v12 error:&v18];
  id v14 = v18;

  if ((v13 & 1) == 0)
  {
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100007E50();
    }
  }
  v16 = [v14 domain];
  if ([v16 isEqualToString:AKAppleIDAuthenticationErrorDomain]) {
    BOOL v17 = [v14 code] != (id)-7064;
  }
  else {
    BOOL v17 = 1;
  }

  ((void (*)(void *, void))v7[2])(v7, (v13 ^ 1) & v17);
  os_activity_scope_leave(&state);
}

- (id)_primaryAppleAccount
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching primary account for refreshing follow ups", v6, 2u);
  }

  v3 = +[AKAccountManager sharedInstance];
  id v4 = [v3 primaryiCloudAccount];

  return v4;
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v50 = _os_activity_create((void *)&_mh_execute_header, "authkit-ext/process-follow-up-action", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v50, &state);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100003FDC;
  v67[3] = &unk_10000C440;
  id v12 = v10;
  id v68 = v12;
  v69 = self;
  id v13 = v9;
  id v70 = v13;
  id v49 = v11;
  id v71 = v49;
  v54 = objc_retainBlock(v67);
  objc_storeStrong((id *)&self->_item, a3);
  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v12 userInfo];
    sub_100007FBC((uint64_t)v13, v15, v73, v14);
  }

  v16 = [v12 userInfo];
  uint64_t v17 = AKActionKey;
  id v18 = [v16 objectForKeyedSubscript:AKActionKey];

  v19 = [v12 identifier];
  unsigned int v20 = [v19 isEqualToString:@"continuity_push_followup_notification"];

  v21 = [v13 userInfo];
  v53 = [v21 objectForKeyedSubscript:AKFollowUpAltDSIDKey];

  v22 = [v12 userInfo];
  v23 = [v22 objectForKeyedSubscript:AKFollowUpURLKey];

  v24 = [v12 userInfo];
  v25 = [v24 objectForKeyedSubscript:AKFollowUpSafariURLKey];
  v52 = +[NSURL URLWithString:v25];

  v26 = [v12 userInfo];
  v51 = [v26 objectForKeyedSubscript:@"AKFollowUpLocalURLKey"];

  if (!v18)
  {
    if (v23)
    {
      objc_storeStrong((id *)&self->_urlKey, v23);
      v28 = +[AKURLBag bagForAltDSID:v53];
      v29 = [v28 urlAtKey:v23];
      url = self->_url;
      self->_url = v29;

      v31 = self->_url;
      if (!v31)
      {
        v32 = _AKLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_100007F54();
        }

        ((void (*)(void *, void))v54[2])(v54, 0);
        v31 = self->_url;
      }
      if (v31) {
        unsigned int v33 = v20;
      }
      else {
        unsigned int v33 = 0;
      }
      if (v33 == 1)
      {
        v27 = +[NSMutableDictionary dictionary];
        [v27 setObject:v23 forKeyedSubscript:@"urlKey"];
        [v27 setObject:0 forKeyedSubscript:v17];
        v34 = [v13 uniqueIdentifier];
        [v27 setObject:v34 forKeyedSubscript:AKFollowUpPayloadIdentifierKey];

        v35 = [v12 userInfo];
        uint64_t v47 = [v35 objectForKeyedSubscript:@"AKFollowUpAppleAccountRootKey"];

        v36 = +[AKURLBag bagForAltDSID:v53];
        v37 = [v36 urlAtKey:v47];

        if (!v37)
        {
          v38 = _AKLogSystem();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to find root redirect url for continuity action, using default root url.", buf, 2u);
          }

          v37 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=IDMSUrl"];
        }
        v39 = objc_msgSend(v37, "absoluteString", v47, v49, v50);
        v40 = [(AKFollowUpViewController *)self _URLWithString:v39 byAppendingParameters:v27];

        v41 = _AKLogSystem();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          sub_100007EEC();
        }

        v42 = [v12 identifier];
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_10000411C;
        v62[3] = &unk_10000C468;
        v63 = v54;
        [(AKFollowUpViewController *)self _handleSensitiveURL:v40 withActionIdentifier:v42 completion:v62];

        goto LABEL_5;
      }
      if (v31)
      {
        [(AKFollowUpViewController *)self _prepareAuthContextForAltDSID:v53];
        authContext = self->_authContext;
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_100004130;
        v60[3] = &unk_10000C490;
        v61 = v54;
        [(AKFollowUpViewController *)self _refreshServerUIDelegateWithParentContext:authContext item:v13 completion:v60];
        v27 = v61;
        goto LABEL_5;
      }
    }
    else
    {
      if (v52)
      {
        v43 = [v12 identifier];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100004144;
        v58[3] = &unk_10000C468;
        v59 = v54;
        [(AKFollowUpViewController *)self _handleURL:v52 withActionIdentifier:v43 completion:v58];

        v27 = v59;
        goto LABEL_5;
      }
      if (v51)
      {
        v45 = [v12 identifier];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100004158;
        v55[3] = &unk_10000C4B8;
        v57 = v54;
        id v56 = v13;
        [(AKFollowUpViewController *)self _handleLocalURLKey:v51 withActionIdentifier:v45 forItem:v56 completion:v55];

        v27 = v57;
        goto LABEL_5;
      }
      v46 = _AKLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        sub_100007EB8();
      }
    }
    ((void (*)(void *, BOOL))v54[2])(v54, v23 == 0);
    goto LABEL_6;
  }
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100004108;
  v65[3] = &unk_10000C468;
  v66 = v54;
  [(AKFollowUpViewController *)self _handleAuthKitAction:v18 forItem:v13 completion:v65];
  v27 = v66;
LABEL_5:

LABEL_6:
  os_activity_scope_leave(&state);
}

- (void)_handleURL:(id)a3 withActionIdentifier:(id)a4 completion:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a5;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100008094();
  }

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000042F8;
  v11[3] = &unk_10000C4E0;
  id v12 = v6;
  id v10 = v6;
  [v9 openURL:v10 configuration:0 completionHandler:v11];

  v7[2](v7, 1, 0);
}

- (void)_handleSensitiveURL:(id)a3 withActionIdentifier:(id)a4 completion:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a5;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100008180();
  }

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v11 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  id v12 = &__kCFBooleanTrue;
  id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v9 openSensitiveURL:v6 withOptions:v10];

  v7[2](v7, 1, 0);
}

- (void)_handleLocalURLKey:(id)a3 withActionIdentifier:(id)a4 forItem:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100008250((uint64_t)v10);
  }

  v15 = [v12 userInfo];
  v16 = [v15 objectForKeyedSubscript:AKFollowUpAltDSIDKey];

  uint64_t v17 = +[AKURLBag bagForAltDSID:v16];
  id v18 = [v17 urlAtKey:v10];
  url = self->_url;
  self->_url = v18;

  unsigned int v20 = self->_url;
  if (v20)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100004650;
    v22[3] = &unk_10000C468;
    id v23 = v13;
    [(AKFollowUpViewController *)self _handleSensitiveURL:v20 withActionIdentifier:v11 completion:v22];
  }
  else
  {
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000081E8();
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

- (void)_handleAuthKitAction:(id)a3 forItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100008328((uint64_t)v8);
  }

  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_100004AE8;
  v52[4] = sub_100004AF8;
  id v12 = self;
  v53 = v12;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100004B00;
  v49[3] = &unk_10000C508;
  v51 = v52;
  id v13 = v10;
  id v50 = v13;
  id v14 = objc_retainBlock(v49);
  v15 = [v9 userInfo];
  v16 = [v15 objectForKeyedSubscript:AKFollowUpAltDSIDKey];
  v34 = v14;

  uint64_t v17 = [v9 userInfo];
  v35 = [v17 objectForKeyedSubscript:@"txnid"];

  id v18 = [v9 userInfo];
  v19 = [v18 objectForKeyedSubscript:AKIdmsDataKey];

  unsigned int v20 = [v9 actions];
  id v21 = [v20 count];

  if (v21)
  {
    v22 = [v9 actions];
    id v23 = [v22 firstObject];
    v24 = [v23 identifier];
    unsigned int v25 = [v24 isEqualToString:@"continuity_push_followup_notification"];
  }
  else
  {
    unsigned int v25 = 0;
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_100004AE8;
  uint64_t v47 = sub_100004AF8;
  id v48 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v26 = objc_opt_new();
  v27 = [v9 uniqueIdentifier];
  [v26 setItemIdentifier:v27];

  [v26 setAkAction:v8];
  [v26 setAltDSID:v16];
  if (v25)
  {
    [v26 setTxnid:v35];
    [v26 setIdmsData:v19];
    [v26 setIsContinuityPush:1];
    if ([v8 isEqualToString:AKFollowUpActionClear]) {
      [v26 setAkAction:@"clear"];
    }
  }
  v28 = _AKLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_1000082C0();
  }

  v29 = (void *)v44[5];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100004B78;
  v36[3] = &unk_10000C530;
  id v30 = v9;
  id v37 = v30;
  id v31 = v8;
  id v38 = v31;
  id v32 = v16;
  id v39 = v32;
  v40 = v12;
  id v33 = v34;
  id v41 = v33;
  v42 = &v43;
  [v29 teardownFollowUpWithContext:v26 completion:v36];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v52, 8);
}

- (void)_prepareAuthContextForAltDSID:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preparing context for altDSID: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = (AKAppleIDAuthenticationInAppExtensionContext *)objc_alloc_init((Class)AKAppleIDAuthenticationInAppExtensionContext);
  authContext = self->_authContext;
  self->_authContext = v6;

  [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext set_shouldSendIdentityTokenForRemoteUI:0];
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 authKitAccountWithAltDSID:v4 error:0];
  id v10 = [v9 username];
  [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setUsername:v10];

  [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setAltDSID:v4];
  [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setCellularDataAttributionAppBundleID:AKCellularDataAttributionAppBundleIDAuthKit];
  [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext setPresentingViewController:self];
  id v11 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  authController = self->_authController;
  self->_authController = v11;
}

- (void)_refreshServerUIDelegateWithParentContext:(id)a3 item:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    sub_100008454();
  }
  id v11 = v10;
  id v12 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  int v13 = [v8 altDSID];
  [v12 setAltDSID:v13];

  [v12 setAnticipateEscrowAttempt:1];
  authController = self->_authController;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004FD4;
  v17[3] = &unk_10000C558;
  v17[4] = self;
  id v18 = v9;
  id v19 = v11;
  id v15 = v11;
  id v16 = v9;
  [(AKAppleIDAuthenticationController *)authController getServerUILoadDelegateWithContext:v12 completion:v17];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AKFollowUpViewController;
  [(AKFollowUpViewController *)&v5 viewDidLoad];
  v3 = +[UIColor clearColor];
  id v4 = [(AKFollowUpViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKFollowUpViewController;
  [(AKFollowUpViewController *)&v5 viewDidAppear:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000051CC;
  v4[3] = &unk_10000C580;
  v4[4] = self;
  [(AKFollowUpViewController *)self _startShowingServerUI:v4];
}

- (void)_startShowingServerUI:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100008480();
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000053D0;
  v13[3] = &unk_10000C5D0;
  v13[4] = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = objc_retainBlock(v13);
  id v7 = [objc_alloc((Class)NSURLRequest) initWithURL:self->_url];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000056A8;
  v10[3] = &unk_10000C620;
  id v11 = v7;
  id v12 = v6;
  v10[4] = self;
  id v8 = v7;
  id v9 = v6;
  [(AKFollowUpViewController *)self _beginServerUIRequest:v8 completion:v10];
}

- (void)_handleFinalServerResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling final server responese: %@", (uint8_t *)&v9, 0xCu);
  }

  [(AKFollowUpViewController *)self _handleAuthKitSignal:+[AKAppleIDServerResourceLoadDelegate signalFromServerResponse:v6] forItem:self->_item completion:v7];
}

- (void)_handleAuthKitSignal:(unint64_t)a3 forItem:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    unint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending tear down with signal: %lu", (uint8_t *)&v13, 0xCu);
  }

  if (a3 == 8)
  {
    id v11 = (id *)&AKActionTeardown;
  }
  else
  {
    if (a3 != 7)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    id v11 = (id *)&AKActionDelete;
  }
  id v12 = *v11;
LABEL_9:
  [(AKFollowUpViewController *)self _handleAuthKitAction:v12 forItem:v9 completion:v8];
}

- (void)_beginServerUIRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting server UI at... %@", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)AKServerRequestConfiguration) initWithRequest:v6 requestType:0];
  [v9 setResourceLoadDelegate:self->_serverUIDelegate];
  authContext = self->_authContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005BCC;
  v12[3] = &unk_10000C5D0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(AKAppleIDAuthenticationInAppExtensionContext *)authContext presentServerProvidedUIWithConfiguration:v9 completion:v12];
}

- (void)_updateAccountUsernameWithHarvestedData:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:AKAuthenticationUsernameKey];
  if ([v4 length])
  {
    id v5 = +[AKAccountManager sharedInstance];
    id v6 = [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext altDSID];
    [v5 updateUsername:v4 forAccountsWithAltDSID:v6];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CFU flow completed without updated username", v8, 2u);
    }
  }
}

- (void)_startCDPRepairWithAdditionalData:(id)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005F50;
  block[3] = &unk_10000C670;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_reauthenticateContext:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100008548();
  }

  id v6 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  id v7 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  id v8 = [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext username];
  [v6 setUsername:v8];

  id v9 = [(AKAppleIDAuthenticationInAppExtensionContext *)self->_authContext altDSID];
  [v6 setAltDSID:v9];

  [v6 setIsUsernameEditable:0];
  [v6 setPresentingViewController:self];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006210;
  v11[3] = &unk_10000C698;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v7 authenticateWithContext:v6 completion:v11];
}

- (void)_fetchUserInformationIfNeededForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 authKitAccountWithAltDSID:v6 error:0];

  if (v9
    && [(AKFollowUpViewController *)self _shouldFetchUserInformationForAccount:v9])
  {
    id v10 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006378;
    v11[3] = &unk_10000C6C0;
    id v12 = v7;
    [v10 getUserInformationForAltDSID:v6 completion:v11];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

- (BOOL)_shouldFetchUserInformationForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  unint64_t v5 = (unint64_t)[v4 repairStateForAccount:v3];

  return (v5 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)_URLWithString:(id)a3 byAppendingParameters:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v5 keyEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v5 objectForKeyedSubscript:v12];
        [v6 appendFormat:@"&%@=%@", v12, v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  unint64_t v14 = +[NSURL URLWithString:v6];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_urlKey, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_authContext, 0);

  objc_storeStrong((id *)&self->_serverUIDelegate, 0);
}

@end
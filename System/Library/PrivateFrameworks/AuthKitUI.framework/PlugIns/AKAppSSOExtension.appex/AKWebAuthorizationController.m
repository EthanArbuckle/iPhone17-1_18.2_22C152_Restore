@interface AKWebAuthorizationController
+ (id)_acceptedResponseModes;
- (BOOL)_canProcessRequestURLParams:(id)a3;
- (id)_activeStoreAccount;
- (id)_appProvidedDataFromParams:(id)a3;
- (id)_appSSOProvidedInformationForBundleIDFromParams:(id)a3;
- (id)_authorizationController;
- (id)_fetchPrimaryApplicationInformationForContext:(id)a3 requestParameters:(id)a4;
- (id)_getIconNameForHostName:(id)a3;
- (id)_parseURLQueryParams:(id)a3;
- (id)_requestedScopesFromString:(id)a3;
- (id)_responseDictWithCredential:(id)a3 requestParams:(id)a4;
- (void)_sendAuthorizationResponseToRequest:(id)a3 usingTemplate:(id)a4 withCredential:(id)a5 requestParams:(id)a6;
- (void)beginAuthorizationWithRequest:(id)a3;
@end

@implementation AKWebAuthorizationController

- (void)beginAuthorizationWithRequest:(id)a3
{
  id v4 = a3;
  v59 = [v4 url];
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v59;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AKWebAuthorizationController beginAuthorizationWithRequest: %@", (uint8_t *)&buf, 0xCu);
  }

  v6 = [(AKWebAuthorizationController *)self _parseURLQueryParams:v59];
  v60 = [v4 authorizationOptions];
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100008C5C();
  }

  uint64_t v8 = SOAuthorizationOptionInitiatorOrigin;
  v9 = [v60 objectForKeyedSubscript:SOAuthorizationOptionInitiatorOrigin];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    v11 = [v60 objectForKeyedSubscript:v8];
    [v6 setObject:v11 forKeyedSubscript:@"originURL"];
  }
  if ([(AKWebAuthorizationController *)self _canProcessRequestURLParams:v6])
  {
    v57 = [(AKWebAuthorizationController *)self _authorizationController];
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v75 = 0x3032000000;
    v76 = sub_100006874;
    v77 = sub_100006884;
    id v78 = 0;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10000688C;
    v70[3] = &unk_1000105C8;
    v55 = v12;
    v71 = v55;
    p_long long buf = &buf;
    [v57 fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:v70];
    id v13 = objc_alloc_init((Class)AKCredentialRequestContext);
    v14 = +[AKConfiguration sharedConfiguration];
    id v15 = [v14 shouldAutocycleAppsInWebTakeover];

    if (v15 == (id)1)
    {
      v16 = +[AKTestData testTiburonWebBundleIdentifier];
      objc_msgSend(v13, "set_proxiedClientBundleID:", v16);

      v17 = +[AKTestData testTiburonWebApplicationName];
      objc_msgSend(v13, "set_proxiedClientAppName:", v17);
    }
    else
    {
      v19 = [(AKWebAuthorizationController *)self _fetchPrimaryApplicationInformationForContext:v13 requestParameters:v6];
      v58 = v19;
      v17 = v19;
      if (v19)
      {
        v20 = [v19 userInfo];
        v21 = [v20 objectForKeyedSubscript:AKErrorStatusCodeKey];
        BOOL v22 = [v21 integerValue] == (id)-24002;

        if (v22)
        {
          v23 = _AKLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_100008BF4();
          }

          [v4 completeWithError:v58];
          goto LABEL_49;
        }
        v17 = v58;
      }
    }

    objc_msgSend(v13, "set_shouldForceUI:", 1);
    objc_msgSend(v13, "set_isWebLogin:", 1);
    v24 = [v4 callerBundleIdentifier];
    objc_msgSend(v13, "set_callerBundleID:", v24);

    v25 = [v6 objectForKeyedSubscript:@"client_id"];
    objc_msgSend(v13, "set_proxiedClientServiceID:", v25);

    v26 = [v6 objectForKeyedSubscript:@"originURL"];
    v58 = +[NSURL URLWithString:v26];

    unsigned int v54 = +[AKAuthorizationController isURLFromAppleOwnedDomain:v58];
    if (v54)
    {
      objc_msgSend(v13, "set_isFirstPartyLogin:", 1);
      v27 = [v58 host];
      v28 = [(AKWebAuthorizationController *)self _getIconNameForHostName:v27];

      objc_msgSend(v13, "set_iconName:", v28);
    }
    else
    {
      +[AKIcon defaultScale];
      v30 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v29 * 48.0, v29 * 48.0);
      objc_msgSend(v13, "set_iconSize:", v30);

      +[AKIcon defaultScale];
      v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      objc_msgSend(v13, "set_iconScale:", v28);
    }

    id v31 = objc_alloc_init((Class)AKAuthorizationRequest);
    v32 = [v6 objectForKeyedSubscript:@"client_id"];
    [v31 setClientID:v32];

    v33 = [(AKWebAuthorizationController *)self _appProvidedDataFromParams:v6];
    [v31 setAppProvidedData:v33];

    v34 = [v6 objectForKeyedSubscript:@"scope"];
    v35 = [(AKWebAuthorizationController *)self _requestedScopesFromString:v34];
    [v31 setRequestedScopes:v35];

    [v13 setAuthorizationRequest:v31];
    v56 = +[AKAccountManager sharedInstance];
    v36 = [v6 objectForKeyedSubscript:@"account_ind"];
    LODWORD(v35) = [v36 isEqualToString:@"1"];

    if (v35)
    {
      v37 = _AKLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Requesting store account authorization", v73, 2u);
      }

      objc_msgSend(v13, "set_isItunesLogin:", 1);
      v38 = [(AKWebAuthorizationController *)self _activeStoreAccount];
      if (v38)
      {
        v39 = _AKLogSystem();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          v40 = +[AKAccountManager sharedInstance];
          v41 = [v40 primaryEmailAddressForAccount:v38];
          sub_100008B94(v41, v73, v39, v40);
        }

        v42 = [v56 altDSIDForAccount:v38];
        v43 = [v56 authKitAccountWithAltDSID:v42 error:0];
        v44 = _AKLogSystem();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Account manager contains store account", v69, 2u);
        }

        if (v43)
        {
          v45 = [v13 authorizationRequest];
          [v45 setAuthkitAccount:v43];
        }
        else
        {
          v48 = _AKLogSystem();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v69 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Account manager doesn't contain an active store account", v69, 2u);
          }

          v45 = [v56 primaryAuthKitAccount];
          v49 = [v13 authorizationRequest];
          [v49 setAuthkitAccount:v45];
        }
      }
      else
      {
        v47 = _AKLogSystem();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Account manager doesn't contain an active store account", v73, 2u);
        }

        v42 = [v56 primaryAuthKitAccount];
        v43 = [v13 authorizationRequest];
        [v43 setAuthkitAccount:v42];
      }
    }
    else
    {
      v46 = _AKLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Requesting primary account authorization", v73, 2u);
      }

      v38 = [v56 primaryAuthKitAccount];
      v42 = [v13 authorizationRequest];
      [v42 setAuthkitAccount:v38];
    }

    id v68 = 0;
    unsigned __int8 v50 = +[AKAuthorizationValidator canPerformCredentialRequest:v13 error:&v68];
    id v51 = v68;
    if (v50)
    {
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1000068DC;
      v61[3] = &unk_100010618;
      v66 = &buf;
      v62 = v55;
      v63 = self;
      id v64 = v4;
      id v65 = v6;
      char v67 = v54;
      v52 = objc_retainBlock(v61);
      [v57 performAuthorizationWithContext:v13 completion:v52];
    }
    else
    {
      v53 = _AKLogSystem();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_100008B2C();
      }

      [v4 completeWithError:v51];
    }

LABEL_49:
    _Block_object_dispose(&buf, 8);

    goto LABEL_50;
  }
  v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100008C28();
  }

  [v4 doNotHandle];
LABEL_50:
}

- (id)_fetchPrimaryApplicationInformationForContext:(id)a3 requestParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKWebAuthorizationController *)self _authorizationController];
  id v22 = 0;
  v9 = [v8 primaryApplicationInformationForWebServiceWithInfo:v7 error:&v22];
  id v10 = v22;

  if (v10)
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100008D2C(v7, (uint64_t)v10, v11);
    }
  }
  v12 = [v9 objectForKeyedSubscript:@"client_id"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v14 = [v9 objectForKeyedSubscript:@"client_id"];
    objc_msgSend(v6, "set_proxiedClientBundleID:", v14);
  }
  id v15 = [v9 objectForKeyedSubscript:@"client_name"];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    v17 = [v9 objectForKeyedSubscript:@"client_name"];
  }
  else
  {
    v17 = 0;
  }
  v18 = [v7 objectForKeyedSubscript:@"originURL"];
  v19 = +[NSURL URLWithString:v18];

  if (v17)
  {
    objc_msgSend(v6, "set_proxiedClientAppName:", v17);
  }
  else
  {
    v20 = objc_msgSend(v19, "_lp_simplifiedDisplayString");
    objc_msgSend(v6, "set_proxiedClientAppName:", v20);
  }

  return v10;
}

- (id)_authorizationController
{
  id v2 = objc_alloc_init((Class)AKAuthorizationController);

  return v2;
}

- (id)_appSSOProvidedInformationForBundleIDFromParams:(id)a3
{
  id v4 = a3;
  v5 = [(AKWebAuthorizationController *)self _appProvidedDataFromParams:v4];
  id v6 = [v5 mutableCopy];

  id v7 = [v4 objectForKeyedSubscript:@"client_id"];

  [v6 setObject:v7 forKeyedSubscript:@"client_id"];
  id v8 = [v6 copy];

  return v8;
}

- (id)_parseURLQueryParams:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  v5 = +[NSURLComponents componentsWithURL:v3 resolvingAgainstBaseURL:0];
  id v6 = [v5 percentEncodedQuery];
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"+" withString:@"%20"];
  [v5 setPercentEncodedQuery:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v5, "queryItems", 0);
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v13 value];
        id v15 = [v13 name];
        [v4 setObject:v14 forKeyedSubscript:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v4;
}

- (BOOL)_canProcessRequestURLParams:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100008EB0();
  }

  v5 = [v3 objectForKeyedSubscript:@"originURL"];

  if (!v5)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100008DE0();
    }
    goto LABEL_21;
  }
  id v6 = [v3 objectForKeyedSubscript:@"client_id"];

  if (!v6)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100008E14();
    }
    goto LABEL_21;
  }
  id v7 = [v3 objectForKeyedSubscript:@"redirect_uri"];

  if (!v7)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      id v15 = "Request parameters are missing 'redirect_uri'. Unable to proceed.";
      char v16 = (uint8_t *)&v21;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
    }
LABEL_21:
    BOOL v14 = 0;
    goto LABEL_22;
  }
  id v8 = [v3 objectForKeyedSubscript:@"response_type"];

  if (!v8)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v15 = "Request parameters are missing 'response_type'. Unable to proceed.";
      char v16 = buf;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v9 = [v3 objectForKeyedSubscript:@"scope"];
  if ([v9 length])
  {
    id v10 = [v3 objectForKeyedSubscript:@"response_mode"];
    uint64_t v11 = +[AKWebAuthorizationController _acceptedResponseModes];
    unsigned __int8 v12 = [v11 containsObject:v10];

    if ((v12 & 1) == 0)
    {
      long long v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100008E48();
      }

      BOOL v14 = 0;
      goto LABEL_29;
    }
  }
  id v13 = [v3 objectForKeyedSubscript:@"frame_id"];

  if (!v13)
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request parameters are missing 'frame_id'. Response data will be insufficient. ", v19, 2u);
    }
    BOOL v14 = 1;
LABEL_29:

    goto LABEL_22;
  }
  BOOL v14 = 1;
LABEL_22:

  return v14;
}

- (id)_appProvidedDataFromParams:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  v5 = [v3 objectForKeyedSubscript:@"originURL"];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"originURL"];
    [v4 setObject:v6 forKeyedSubscript:@"originURL"];
  }
  id v7 = [v3 objectForKeyedSubscript:@"frame_id"];

  if (v7)
  {
    id v8 = [v3 objectForKeyedSubscript:@"frame_id"];
    [v4 setObject:v8 forKeyedSubscript:@"frame_id"];
  }
  id v9 = [v3 objectForKeyedSubscript:@"redirect_uri"];

  if (v9)
  {
    id v10 = [v3 objectForKeyedSubscript:@"redirect_uri"];
    [v4 setObject:v10 forKeyedSubscript:@"redirect_uri"];
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:@"response_mode"];

  if (v11)
  {
    unsigned __int8 v12 = [v3 objectForKeyedSubscript:@"response_mode"];
    [v4 setObject:v12 forKeyedSubscript:@"response_mode"];
  }
  id v13 = [v3 objectForKeyedSubscript:@"response_type"];

  if (v13)
  {
    BOOL v14 = [v3 objectForKeyedSubscript:@"response_type"];
    [v4 setObject:v14 forKeyedSubscript:@"response_type"];
  }
  id v15 = [v3 objectForKeyedSubscript:@"state"];

  if (v15)
  {
    char v16 = [v3 objectForKeyedSubscript:@"state"];
    [v4 setObject:v16 forKeyedSubscript:@"state"];
  }
  long long v17 = [v3 objectForKeyedSubscript:@"nonce"];

  if (v17)
  {
    long long v18 = [v3 objectForKeyedSubscript:@"nonce"];
    [v4 setObject:v18 forKeyedSubscript:@"nonce"];
  }
  id v19 = [v4 copy];

  return v19;
}

- (id)_requestedScopesFromString:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  if ([v3 length])
  {
    v5 = [v3 componentsSeparatedByString:@" "];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  id v10 = [v4 copy];

  return v10;
}

- (id)_getIconNameForHostName:(id)a3
{
  if ([a3 containsString:@"icloud"]) {
    return @"iCloudLogo";
  }
  else {
    return @"AppleLogo";
  }
}

- (id)_activeStoreAccount
{
  id v2 = +[ACAccountStore ams_sharedAccountStore];
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100008F18();
  }

  return v3;
}

- (id)_responseDictWithCredential:(id)a3 requestParams:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"response_mode"];
  [v7 setObject:v8 forKeyedSubscript:@"response_mode"];

  id v9 = [v6 objectForKeyedSubscript:@"redirect_uri"];
  [v7 setObject:v9 forKeyedSubscript:@"redirect_uri"];

  [v7 setObject:@"AppSSOTakeoverDidComplete" forKeyedSubscript:@"event"];
  id v10 = +[NSMutableDictionary dictionary];
  id v11 = objc_alloc((Class)NSString);
  long long v12 = [v5 identityToken];
  id v13 = [v11 initWithData:v12 encoding:4];
  [v10 setObject:v13 forKeyedSubscript:@"id_token"];

  id v14 = objc_alloc((Class)NSString);
  long long v15 = [v5 authorizationCode];
  id v16 = [v14 initWithData:v15 encoding:4];
  [v10 setObject:v16 forKeyedSubscript:@"grant_code"];

  long long v17 = [v6 objectForKeyedSubscript:@"state"];

  [v10 setObject:v17 forKeyedSubscript:@"state"];
  [v7 setObject:v10 forKeyedSubscript:@"authorization"];
  long long v18 = +[NSMutableDictionary dictionary];
  id v19 = [v5 userInformation];
  long long v20 = [v19 selectedEmail];
  [v18 setObject:v20 forKeyedSubscript:@"email"];

  __int16 v21 = [v5 userInformation];
  id v22 = [v21 givenName];
  if (v22)
  {

LABEL_4:
    v36[0] = @"firstName";
    v25 = [v5 userInformation];
    uint64_t v26 = [v25 givenName];
    v27 = (void *)v26;
    if (v26) {
      CFStringRef v28 = (const __CFString *)v26;
    }
    else {
      CFStringRef v28 = &stru_100011160;
    }
    v36[1] = @"lastName";
    v37[0] = v28;
    double v29 = [v5 userInformation];
    uint64_t v30 = [v29 familyName];
    id v31 = (void *)v30;
    if (v30) {
      CFStringRef v32 = (const __CFString *)v30;
    }
    else {
      CFStringRef v32 = &stru_100011160;
    }
    v37[1] = v32;
    v33 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v18 setObject:v33 forKeyedSubscript:@"name"];

    goto LABEL_11;
  }
  v23 = [v5 userInformation];
  v24 = [v23 familyName];

  if (v24) {
    goto LABEL_4;
  }
LABEL_11:
  [v7 setObject:v18 forKeyedSubscript:@"user"];
  id v34 = [v7 copy];

  return v34;
}

- (void)_sendAuthorizationResponseToRequest:(id)a3 usingTemplate:(id)a4 withCredential:(id)a5 requestParams:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  if (v10)
  {
    long long v12 = [(AKWebAuthorizationController *)self _responseDictWithCredential:a5 requestParams:a6];
    id v13 = +[AAFSerialization ofType:@"application/json"];
    id v14 = [v13 stringFromDictionary:v12];

    long long v15 = [v10 stringByReplacingOccurrencesOfString:@"{{%-- AUTHKIT_DATA --%}}" withString:v14];
    id v16 = [v15 dataUsingEncoding:4];
    id v17 = objc_alloc((Class)NSHTTPURLResponse);
    long long v18 = [v11 url];
    id v19 = [v17 initWithURL:v18 statusCode:200 HTTPVersion:0 headerFields:0];

    [v11 completeWithHTTPResponse:v19 httpBody:v16];
  }
  else
  {
    long long v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100008F80();
    }

    long long v12 = +[NSError ak_errorWithCode:-7029];
    [v11 completeWithError:v12];
  }
}

+ (id)_acceptedResponseModes
{
  if (qword_1000151E8 != -1) {
    dispatch_once(&qword_1000151E8, &stru_100010638);
  }
  id v2 = (void *)qword_1000151E0;

  return v2;
}

@end
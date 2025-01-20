@interface ISAppleIDLoginPlugin
- (ISAppleIDLoginPlugin)init;
- (id)_accountWithParameters:(id)a3;
- (id)handler;
- (id)parametersForIdentityEstablishmentRequest;
- (id)parametersForLoginRequest;
- (id)serviceIdentifier;
- (void)_setCookiesWithString:(id)a3 userIdentifier:(id)a4 withCookieStorage:(id)a5;
- (void)_setupHomeSharingWithParameters:(id)a3;
- (void)_setupITunesMatchWithParameters:(id)a3;
- (void)_setupiTunesBiometricsWithParameters:(id)a3;
- (void)handleLoginResponse:(id)a3 completion:(id)a4;
- (void)setHandler:(id)a3;
@end

@implementation ISAppleIDLoginPlugin

- (ISAppleIDLoginPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISAppleIDLoginPlugin;
  v2 = [(ISAppleIDLoginPlugin *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ISAppleIDLoginPlugin", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  kdebug_trace();
  val = self;
  v61 = v8;
  [(ISAppleIDLoginPlugin *)self setHandler:v8];
  v65 = +[NSMutableDictionary dictionaryWithDictionary:v7];
  [v65 removeObjectForKey:@"password"];
  v9 = ISAppleIDPluginLogConfig();
  if (!v9)
  {
    v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    v10 |= 2u;
  }
  v11 = [v9 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (v12)
  {
    v13 = objc_opt_class();
    id v14 = v13;
    NSStringFromSelector(a2);
    *(_DWORD *)from = 138543874;
    *(void *)&from[4] = v13;
    __int16 v81 = 2114;
    id v82 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v83 = 2112;
    v84 = v65;
    LODWORD(v58) = 32;
    v15 = (void *)_os_log_send_and_compose_impl();

    if (v15)
    {
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, from, v58);
      free(v15);
      SSFileLog();
    }
  }
  else
  {
  }
  id v64 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Cookies", @"com.apple.itunesstored.2.sqlitedb", 0);
  v66 = +[NSString pathWithComponents:v64];
  id v63 = objc_alloc_init((Class)NSFileManager);
  v17 = [v66 stringByDeletingLastPathComponent];
  [v63 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:0];

  id v18 = objc_alloc((Class)SSVCookieStorage);
  v19 = +[NSURL fileURLWithPath:v66];
  id v62 = [v18 initWithStorageLocation:v19];

  v20 = [v7 objectForKey:@"dsid"];
  v67 = SSAccountGetUniqueIdentifierFromValue();

  if (!v67)
  {
    v22 = ISAppleIDPluginLogConfig();
    if (!v22)
    {
      v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    v25 = [v22 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (v24)
    {
      v26 = objc_opt_class();
      *(_DWORD *)from = 138543362;
      *(void *)&from[4] = v26;
      id v27 = v26;
      LODWORD(v59) = 12;
      v57 = from;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_26:

        v29 = +[NSError errorWithDomain:@"ISAppleIDLoginErrorDomain" code:1 userInfo:0];
        v30 = 0;
        goto LABEL_35;
      }
      v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, from, v59);
      free(v28);
      v57 = v25;
      SSFileLog();
    }

    goto LABEL_26;
  }
  v21 = [v7 objectForKey:@"cookies"];
  if (v21)
  {
    [(ISAppleIDLoginPlugin *)val _setCookiesWithString:v21 userIdentifier:v67 withCookieStorage:v62];
  }
  else
  {
    v31 = [v7 objectForKey:@"pod"];
    [(ISAppleIDLoginPlugin *)val _setCookiesWithString:v31 userIdentifier:v67 withCookieStorage:v62];

    v32 = [v7 objectForKey:@"weak-token"];
    [(ISAppleIDLoginPlugin *)val _setCookiesWithString:v32 userIdentifier:v67 withCookieStorage:v62];
  }
  v30 = [(ISAppleIDLoginPlugin *)val _accountWithParameters:v7];
  v33 = +[SSAccountStore defaultStore];
  [v33 saveAccount:v30 verifyCredentials:0 error:0];

  if ([v30 isActive])
  {
    +[SSAccountStore resetExpiration];
    v34 = [v7 objectForKey:@"storefront"];
    if (v34)
    {
      v35 = +[SSDevice currentDevice];
      [v35 setStoreFrontIdentifier:v34];
    }
    if (PSIsRunningInAssistant())
    {
      v36 = +[SSDevice currentDevice];
      [v36 enableAllAutomaticDownloadKindsWithCompletionBlock:0];
    }
  }

  v29 = 0;
LABEL_35:
  objc_initWeak(&location, val);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_253C;
  v73[3] = &unk_83F8;
  v73[4] = val;
  objc_copyWeak(&v77, &location);
  id v37 = v7;
  id v74 = v37;
  id v38 = v30;
  id v75 = v38;
  BOOL v78 = v67 != 0;
  id v60 = v29;
  id v76 = v60;
  v39 = objc_retainBlock(v73);
  v40 = [v37 objectForKeyedSubscript:@"password"];
  v41 = v40;
  if (!v38 || ![v40 length])
  {
    ((void (*)(void *))v39[2])(v39);
    goto LABEL_50;
  }
  v42 = ISAppleIDPluginLogConfig();
  if (!v42)
  {
    v42 = +[SSLogConfig sharedConfig];
  }
  unsigned int v43 = objc_msgSend(v42, "shouldLog", v57);
  unsigned int v44 = [v42 shouldLogToDisk];
  v45 = [v42 OSLogObject];
  v46 = v45;
  if (v44) {
    v43 |= 2u;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
    int v47 = v43;
  }
  else {
    int v47 = v43 & 2;
  }
  if (!v47) {
    goto LABEL_47;
  }
  id v48 = (id)objc_opt_class();
  v49 = [v38 accountName];
  v50 = SSHashIfNeeded();
  *(_DWORD *)from = 138543618;
  *(void *)&from[4] = v48;
  __int16 v81 = 2114;
  id v82 = v50;
  LODWORD(v59) = 22;
  v51 = (void *)_os_log_send_and_compose_impl();

  if (v51)
  {
    v46 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, from, v59);
    free(v51);
    SSFileLog();
LABEL_47:
  }
  v52 = +[SSMutableAuthenticationContext contextForSignIn];
  v53 = [v38 accountName];
  [v52 setAccountName:v53];

  v54 = [v38 altDSID];
  [v52 setAltDSID:v54];

  [v52 setAllowsRetry:0];
  [v52 setCanSetActiveAccount:0];
  [v52 setCanCreateNewAccount:0];
  v55 = [v38 uniqueIdentifier];
  [v52 setRequiredUniqueIdentifier:v55];

  [v52 setShouldSuppressDialogs:1];
  [v52 setPasswordEquivalentToken:v41];
  [v52 setPromptStyle:1];
  id v56 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v52];
  objc_initWeak((id *)from, val);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_2EA4;
  v69[3] = &unk_8420;
  objc_copyWeak(&v72, (id *)from);
  id v70 = v38;
  v71 = v39;
  [v56 startWithAuthenticateResponseBlock:v69];

  objc_destroyWeak(&v72);
  objc_destroyWeak((id *)from);

LABEL_50:
  objc_destroyWeak(&v77);
  objc_destroyWeak(&location);
}

- (id)parametersForIdentityEstablishmentRequest
{
  v2 = +[NSMutableDictionary dictionary];
  dispatch_queue_t v3 = +[SSAccountStore defaultStore];
  v4 = [v3 activeAccount];

  if (v4)
  {
    [v2 setObject:&__kCFBooleanTrue forKey:@"account-exists"];
    v5 = [v4 accountName];
    if (v5) {
      [v2 setObject:v5 forKey:@"apple-id"];
    }
    objc_super v6 = [v4 secureToken];

    if (v6) {
      [v2 setObject:v6 forKey:@"auth-token"];
    }
    id v7 = [v4 uniqueIdentifier];

    if (v7) {
      [v2 setObject:v7 forKey:@"dsid"];
    }
  }
  else
  {
    [v2 setObject:&__kCFBooleanFalse forKey:@"account-exists"];
  }

  return v2;
}

- (id)parametersForLoginRequest
{
  v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:@"iTunes" forKey:@"drm-client"];
  dispatch_queue_t v3 = +[ISDevice sharedInstance];
  v4 = [v3 hardwareName];
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 lowercaseString];
    [v2 setObject:v6 forKey:@"drm-type"];
  }
  id v7 = [v3 guid];

  if (v7) {
    [v2 setObject:v7 forKey:@"guid"];
  }
  id v8 = [v3 deviceName];

  if (v8) {
    [v2 setObject:v8 forKey:@"device-name"];
  }
  v9 = +[SSDevice currentDevice];
  unsigned int v10 = [v9 productVersion];

  if (v10) {
    [v2 setObject:v10 forKey:@"drm-version"];
  }
  v11 = [v9 userAgent];

  if (v11) {
    [v2 setObject:v11 forKey:@"user-agent"];
  }

  return v2;
}

- (id)serviceIdentifier
{
  return @"com.apple.itunes";
}

- (id)_accountWithParameters:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"dsid"];
  uint64_t v5 = SSAccountGetUniqueIdentifierFromValue();

  objc_super v6 = +[SSAccountStore defaultStore];
  v88 = (void *)v5;
  id v7 = [v6 accountWithUniqueIdentifier:v5];

  uint64_t v8 = ISAppleIDPluginLogConfig();
  v9 = (void *)v8;
  if (!v7)
  {
    if (!v8)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [v9 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      int v22 = v20;
    }
    else {
      int v22 = v20 & 2;
    }
    if (v22)
    {
      unsigned int v23 = objc_opt_class();
      id v24 = v23;
      v25 = [v88 description];
      v26 = SSHashIfNeeded();
      int v89 = 138543618;
      v90 = v23;
      __int16 v91 = 2114;
      v92 = v26;
      LODWORD(v84) = 22;
      __int16 v81 = &v89;
      id v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
      {
LABEL_27:

        id v7 = objc_alloc_init((Class)SSAccount);
        goto LABEL_28;
      }
      v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v89, v84);
      free(v27);
      __int16 v81 = (int *)v21;
      SSFileLog();
    }

    goto LABEL_27;
  }
  if (!v8)
  {
    v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  int v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (!v13) {
    goto LABEL_13;
  }
  id v14 = objc_opt_class();
  id v15 = v14;
  v16 = [v88 description];
  v17 = SSHashIfNeeded();
  int v89 = 138543618;
  v90 = v14;
  __int16 v91 = 2114;
  v92 = v17;
  LODWORD(v84) = 22;
  __int16 v81 = &v89;
  id v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v89, v84);
    free(v18);
    __int16 v81 = (int *)v12;
    SSFileLog();
LABEL_13:
  }
LABEL_28:
  v28 = objc_msgSend(v3, "objectForKeyedSubscript:", @"email", v81);
  [v7 setAccountName:v28];

  v29 = [v3 objectForKeyedSubscript:@"altDSID"];
  [v7 setAltDSID:v29];

  [v7 setAuthenticated:1];
  v30 = [v3 objectForKeyedSubscript:@"firstName"];
  [v7 setFirstName:v30];

  v31 = [v3 objectForKeyedSubscript:@"lastName"];
  [v7 setLastName:v31];

  v32 = [v3 objectForKey:@"is-managed-id"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v32 BOOLValue])
  {
    v33 = v32;
    v34 = ISAppleIDPluginLogConfig();
    if (!v34)
    {
      v34 = +[SSLogConfig sharedConfig];
    }
    unsigned int v35 = [v34 shouldLog];
    if ([v34 shouldLogToDisk]) {
      int v36 = v35 | 2;
    }
    else {
      int v36 = v35;
    }
    id v37 = [v34 OSLogObject];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      int v38 = v36;
    }
    else {
      int v38 = v36 & 2;
    }
    if (v38)
    {
      v39 = objc_opt_class();
      int v89 = 138543362;
      v90 = v39;
      id v40 = v39;
      LODWORD(v84) = 12;
      id v82 = &v89;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (!v41)
      {
LABEL_42:

        uint64_t v42 = 1;
        v32 = v33;
        goto LABEL_44;
      }
      id v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v89, v84);
      free(v41);
      id v82 = (int *)v37;
      SSFileLog();
    }

    goto LABEL_42;
  }
  uint64_t v42 = 0;
LABEL_44:
  objc_msgSend(v7, "setManagedAppleID:", v42, v82);
  unsigned int v43 = [v3 objectForKeyedSubscript:@"newCustomer"];
  objc_msgSend(v7, "setNewCustomer:", objc_msgSend(v43, "BOOLValue"));

  unsigned int v44 = [v3 objectForKeyedSubscript:@"strong-token"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    unsigned int v44 = 0;
  }
  v87 = v44;
  [v7 setSecureToken:v44];
  v45 = [v3 objectForKeyedSubscript:@"storefront"];
  v46 = ISAppleIDPluginLogConfig();
  if (!v46)
  {
    v46 = +[SSLogConfig sharedConfig];
  }
  unsigned int v47 = [v46 shouldLog];
  if ([v46 shouldLogToDisk]) {
    int v48 = v47 | 2;
  }
  else {
    int v48 = v47;
  }
  v49 = [v46 OSLogObject];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
    int v50 = v48;
  }
  else {
    int v50 = v48 & 2;
  }
  if (v50)
  {
    v51 = objc_opt_class();
    id v52 = v51;
    v53 = SSHashIfNeeded();
    int v89 = 138543618;
    v90 = v51;
    __int16 v91 = 2114;
    v92 = v53;
    LODWORD(v84) = 22;
    __int16 v83 = &v89;
    v54 = (void *)_os_log_send_and_compose_impl();

    if (!v54) {
      goto LABEL_58;
    }
    v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v54, 4, &v89, v84);
    free(v54);
    __int16 v83 = (int *)v49;
    SSFileLog();
  }

LABEL_58:
  [v7 setStoreFrontIdentifier:v45];
  [v7 setUniqueIdentifier:v88];
  v55 = +[SSAccountStore defaultStore];
  id v56 = [v55 activeAccount];

  if (v56)
  {
    v86 = v45;
    v57 = [v56 uniqueIdentifier];
    uint64_t v58 = [v7 uniqueIdentifier];
    unsigned __int8 v59 = [v57 isEqualToNumber:v58];

    uint64_t v60 = ISAppleIDPluginLogConfig();
    v61 = (void *)v60;
    if ((v59 & 1) == 0)
    {
      if (!v60)
      {
        v61 = +[SSLogConfig sharedConfig];
      }
      unsigned int v74 = objc_msgSend(v61, "shouldLog", v83);
      if ([v61 shouldLogToDisk]) {
        v74 |= 2u;
      }
      id v63 = [v61 OSLogObject];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v73 = v74;
      }
      else {
        uint64_t v73 = v74 & 2;
      }
      if (!v73) {
        goto LABEL_95;
      }
      v85 = v32;
      id v75 = objc_opt_class();
      id v76 = v75;
      id v77 = [v7 accountName];
      BOOL v78 = SSHashIfNeeded();
      int v89 = 138543618;
      v90 = v75;
      __int16 v91 = 2114;
      v92 = v78;
      LODWORD(v84) = 22;
      uint64_t v73 = _os_log_send_and_compose_impl();

      if (v73)
      {
        id v63 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4, &v89, v84);
        free((void *)v73);
        SSFileLog();
        uint64_t v73 = 0;
        goto LABEL_90;
      }
LABEL_92:
      v32 = v85;
      v45 = v86;
      v79 = v87;
      goto LABEL_97;
    }
    if (!v60)
    {
      v61 = +[SSLogConfig sharedConfig];
    }
    unsigned int v62 = objc_msgSend(v61, "shouldLog", v83);
    if ([v61 shouldLogToDisk]) {
      v62 |= 2u;
    }
    id v63 = [v61 OSLogObject];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
      int v64 = v62;
    }
    else {
      int v64 = v62 & 2;
    }
    if (!v64)
    {
      uint64_t v73 = 1;
      goto LABEL_95;
    }
    v85 = v32;
    v65 = objc_opt_class();
    id v66 = v65;
    v67 = [v7 accountName];
    v68 = SSHashIfNeeded();
    int v89 = 138543618;
    v90 = v65;
    __int16 v91 = 2114;
    v92 = v68;
    LODWORD(v84) = 22;
LABEL_78:
    id v72 = (void *)_os_log_send_and_compose_impl();

    if (v72)
    {
      id v63 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v72, 4, &v89, v84);
      free(v72);
      SSFileLog();
      uint64_t v73 = 1;
LABEL_90:
      v32 = v85;
LABEL_95:
      v45 = v86;
      goto LABEL_96;
    }
    uint64_t v73 = 1;
    goto LABEL_92;
  }
  v61 = ISAppleIDPluginLogConfig();
  if (!v61)
  {
    v61 = +[SSLogConfig sharedConfig];
  }
  unsigned int v69 = objc_msgSend(v61, "shouldLog", v83);
  if ([v61 shouldLogToDisk]) {
    v69 |= 2u;
  }
  id v63 = [v61 OSLogObject];
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
    int v70 = v69;
  }
  else {
    int v70 = v69 & 2;
  }
  if (v70)
  {
    v85 = v32;
    v86 = v45;
    v71 = objc_opt_class();
    id v66 = v71;
    v67 = [v7 accountName];
    v68 = SSHashIfNeeded();
    int v89 = 138543618;
    v90 = v71;
    __int16 v91 = 2114;
    v92 = v68;
    LODWORD(v84) = 22;
    goto LABEL_78;
  }
  uint64_t v73 = 1;
LABEL_96:
  v79 = v87;

LABEL_97:
  [v7 setActive:v73];

  return v7;
}

- (void)_setCookiesWithString:(id)a3 userIdentifier:(id)a4 withCookieStorage:(id)a5
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a5;
    id v9 = a4;
    unsigned int v10 = ISAppleIDPluginLogConfig();
    if (!v10)
    {
      unsigned int v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    int v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      *(_DWORD *)int v20 = 138543618;
      *(void *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v7;
      id v14 = *(id *)&v20[4];
      LODWORD(v19) = 22;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        id v16 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v7, @"Set-Cookie", 0);
        v17 = +[NSURL URLWithString:@"https://itunes.apple.com"];
        id v18 = +[NSHTTPCookie cookiesWithResponseHeaderFields:v16 forURL:v17];

        [v8 setCookies:v18 forUserIdentifier:v9];
        goto LABEL_14;
      }
      int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v20, v19, *(_OWORD *)v20, *(void *)&v20[16]);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_setupHomeSharingWithParameters:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_423C;
  block[3] = &unk_8470;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = self;
  v4 = v8;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_setupiTunesBiometricsWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v6 = [v5 isPasscodeSet];

  if (v6)
  {
    id v7 = [(id)ISWeakLinkedClassForString() manager];
    dispatch_semaphore_t v8 = [v7 identities:0];
    if (![v8 count])
    {
      id v16 = ISAppleIDPluginLogConfig();
      if (!v16)
      {
        id v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v22 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      id v24 = [v16 OSLogObject];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        v23 &= 2u;
      }
      if (v23)
      {
        int v33 = 138543362;
        id v34 = (id)objc_opt_class();
        id v25 = v34;
        LODWORD(v31) = 12;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26) {
          goto LABEL_47;
        }
        id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v33, v31);
        free(v26);
        SSFileLog();
      }

      goto LABEL_47;
    }

    id v9 = [v4 objectForKey:@"dsid"];
    id v7 = SSAccountGetUniqueIdentifierFromValue();

    uint64_t v10 = ISAppleIDPluginLogConfig();
    dispatch_semaphore_t v8 = v10;
    if (v7)
    {
      if (!v10)
      {
        dispatch_semaphore_t v8 = +[SSLogConfig sharedConfig];
      }
      unsigned int v11 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      int v13 = [v8 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        v12 &= 2u;
      }
      if (v12)
      {
        int v33 = 138543618;
        id v34 = (id)objc_opt_class();
        __int16 v35 = 2114;
        int v36 = v7;
        id v14 = v34;
        LODWORD(v31) = 22;
        id v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
        {
LABEL_15:

          dispatch_semaphore_t v8 = objc_opt_new();
          [v8 setBiometricState:2];
          [v8 saveIdentityMapForAccountIdentifier:v7];
          [v8 registerAccountIdentifier:v7];
          id v16 = [objc_alloc((Class)ISBiometricUpdateTouchIDSettingsOperation) initWithAccountIdentifier:v7];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_4B04;
          v32[3] = &unk_8498;
          v32[4] = self;
          [v16 setResultBlock:v32];
          v17 = +[ISOperationQueue mainQueue];
          [v17 addOperation:v16];

LABEL_47:
          goto LABEL_48;
        }
        int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v33, v31);
        free(v15);
        SSFileLog();
      }

      goto LABEL_15;
    }
    if (!v10)
    {
      dispatch_semaphore_t v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    id v16 = [v8 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v28 &= 2u;
    }
    if (!v28) {
      goto LABEL_47;
    }
    int v33 = 138543362;
    id v34 = (id)objc_opt_class();
    id v29 = v34;
    LODWORD(v31) = 12;
    v30 = (void *)_os_log_send_and_compose_impl();

    if (v30)
    {
      id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v33, v31);
      free(v30);
      SSFileLog();
      goto LABEL_47;
    }
LABEL_48:

    goto LABEL_49;
  }
  id v7 = ISAppleIDPluginLogConfig();
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v18 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  dispatch_semaphore_t v8 = [v7 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_48;
  }
  int v33 = 138543362;
  id v34 = (id)objc_opt_class();
  id v20 = v34;
  LODWORD(v31) = 12;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    dispatch_semaphore_t v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v33, v31);
    free(v21);
    SSFileLog();
    goto LABEL_48;
  }
LABEL_49:
}

- (void)_setupITunesMatchWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"slot-acquired"];
  if (objc_opt_respondsToSelector())
  {
    if ([v5 BOOLValue])
    {
      unsigned __int8 v6 = +[ML3MusicLibrary sharedLibrary];
      unsigned int v7 = [v6 isLibraryEmpty];

      if (v7)
      {
        dispatch_semaphore_t v8 = +[SSAccountStore defaultStore];
        id v9 = [v8 activeAccount];
        unsigned int v44 = [v9 uniqueIdentifier];

        uint64_t v10 = ISAppleIDPluginLogConfig();
        if (!v10)
        {
          uint64_t v10 = +[SSLogConfig sharedConfig];
        }
        unsigned int v11 = [v10 shouldLog];
        if ([v10 shouldLogToDisk]) {
          v11 |= 2u;
        }
        int v12 = [v10 OSLogObject];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          int v13 = v11;
        }
        else {
          int v13 = v11 & 2;
        }
        if (v13)
        {
          id v14 = objc_opt_class();
          id v15 = v14;
          id v16 = [v44 description];
          v17 = SSHashIfNeeded();
          *(_DWORD *)id v52 = 138543618;
          *(void *)&v52[4] = v14;
          *(_WORD *)&v52[12] = 2114;
          *(void *)&v52[14] = v17;
          LODWORD(v41) = 22;
          id v40 = v52;
          unsigned int v18 = (void *)_os_log_send_and_compose_impl();

          if (v18)
          {
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, v52, v41);
            int v19 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            free(v18);
            id v40 = v19;
            SSFileLog();
          }
        }
        else
        {
        }
        unsigned int v43 = +[SSURLBagContext contextWithBagType:0];
        if (v44) {
          [v43 setUserIdentifier:v44];
        }
        id v20 = [objc_alloc((Class)SSURLBag) initWithURLBagContext:v43];
        [v20 invalidate];
        *(void *)id v52 = 0;
        *(void *)&v52[8] = v52;
        *(void *)&v52[16] = 0x2020000000;
        char v53 = 0;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_5464;
        v47[3] = &unk_84C0;
        v47[4] = self;
        v49 = v52;
        v21 = dispatch_semaphore_create(0);
        int v48 = v21;
        [v20 loadWithCompletionBlock:v47];
        dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
        if (!*(unsigned char *)(*(void *)&v52[8] + 24))
        {
          ISAppleIDPluginLogConfig();
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            id v22 = +[SSLogConfig sharedConfig];
          }
          unsigned int v34 = objc_msgSend(v22, "shouldLog", v40);
          unsigned int v35 = [v22 shouldLogToDisk];
          int v36 = [v22 OSLogObject];
          int v33 = v36;
          if (v35) {
            v34 |= 2u;
          }
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
            v34 &= 2u;
          }
          if (v34)
          {
            id v37 = objc_opt_class();
            int v50 = 138543362;
            v51 = v37;
            id v38 = v37;
            LODWORD(v41) = 12;
            v39 = (void *)_os_log_send_and_compose_impl();

            if (!v39) {
              goto LABEL_32;
            }
            int v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v50, v41);
            free(v39);
            SSFileLog();
          }
LABEL_31:

LABEL_32:
          _Block_object_dispose(v52, 8);

          goto LABEL_33;
        }
        id v22 = objc_alloc_init((Class)HSCloudClient);
        dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
        int v23 = ISAppleIDPluginLogConfig();
        if (!v23)
        {
          int v23 = +[SSLogConfig sharedConfig];
        }
        unsigned int v24 = objc_msgSend(v23, "shouldLog", v40);
        unsigned int v25 = [v23 shouldLogToDisk];
        v26 = [v23 OSLogObject];
        unsigned int v27 = v26;
        if (v25) {
          int v28 = v24 | 2;
        }
        else {
          int v28 = v24;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          int v29 = v28;
        }
        else {
          int v29 = v28 & 2;
        }
        if (v29)
        {
          v30 = objc_opt_class();
          int v50 = 138543362;
          v51 = v30;
          id v31 = v30;
          LODWORD(v41) = 12;
          v32 = (void *)_os_log_send_and_compose_impl();

          if (!v32)
          {
LABEL_30:

            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_5674;
            v45[3] = &unk_84E8;
            int v33 = v42;
            v46 = v33;
            [v22 authenticateWithCompletionHandler:v45];
            dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

            goto LABEL_31;
          }
          unsigned int v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v50, v41);
          free(v32);
          SSFileLog();
        }

        goto LABEL_30;
      }
    }
  }
LABEL_33:
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
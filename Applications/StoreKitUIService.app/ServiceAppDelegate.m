@interface ServiceAppDelegate
- (BOOL)_handleSafariScriptDataUpdate:(id)a3;
- (BOOL)_handleUniversalLinkInURLComponents:(id)a3 forApplication:(id)a4;
- (BOOL)_handleUniversalLinkInUserActivity:(id)a3 forApplication:(id)a4;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation ServiceAppDelegate

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 scheme];
  if (![v11 isEqualToString:@"itms-ui"])
  {
    v12 = [v9 scheme];
    unsigned int v13 = [v12 isEqualToString:@"ams-ui"];

    if (v13) {
      goto LABEL_4;
    }
    v30 = [v9 scheme];
    unsigned int v31 = [v30 isEqualToString:@"itms-services"];

    if (v31)
    {
      id v32 = [objc_alloc((Class)SKUIURL) initWithURL:v9];
      v33 = [v32 actionString];
      if ([v33 isEqualToString:SSScriptURLSafariDataUpdate])
      {
        v34 = +[SSLogConfig sharedConfig];
        unsigned int v35 = [v34 shouldLog];
        if ([v34 shouldLogToDisk]) {
          int v36 = v35 | 2;
        }
        else {
          int v36 = v35;
        }
        v37 = [v34 OSLogObject];
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
          v36 &= 2u;
        }
        if (v36)
        {
          *(_DWORD *)v102 = 138543618;
          *(void *)&v102[4] = objc_opt_class();
          *(_WORD *)&v102[12] = 2112;
          *(void *)&v102[14] = v9;
          id v38 = *(id *)&v102[4];
          LODWORD(v91) = 22;
          v39 = (void *)_os_log_send_and_compose_impl();

          if (v39)
          {
            v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, v102, v91);
            free(v39);
            SSFileLog();
          }
        }
        else
        {
        }
        unsigned __int8 v28 = [(ServiceAppDelegate *)self _handleSafariScriptDataUpdate:v32];
        goto LABEL_91;
      }
      if ([v33 isEqualToString:@"purchaseIntent"])
      {
        v52 = +[SSLogConfig sharedDaemonConfig];
        if (!v52)
        {
          v52 = +[SSLogConfig sharedConfig];
        }
        unsigned int v53 = [v52 shouldLog];
        if ([v52 shouldLogToDisk]) {
          int v54 = v53 | 2;
        }
        else {
          int v54 = v53;
        }
        v55 = [v52 OSLogObject];
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
          v54 &= 2u;
        }
        if (v54)
        {
          *(_DWORD *)v102 = 138412546;
          *(void *)&v102[4] = objc_opt_class();
          *(_WORD *)&v102[12] = 2112;
          *(void *)&v102[14] = v9;
          id v56 = *(id *)&v102[4];
          LODWORD(v91) = 22;
          v90 = v102;
          v57 = (void *)_os_log_send_and_compose_impl();

          if (v57)
          {
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 4, v102, v91);
            v58 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            free(v57);
            v90 = v58;
            SSFileLog();
          }
        }
        else
        {
        }
        *(void *)v102 = 0;
        *(void *)&v102[8] = v102;
        *(void *)&v102[16] = 0x3032000000;
        v103 = sub_100012158;
        v104 = sub_100012168;
        id v105 = 0;
        uint64_t v94 = 0;
        v95 = &v94;
        uint64_t v96 = 0x3032000000;
        v97 = sub_100012158;
        v98 = sub_100012168;
        id v99 = 0;
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_100012170;
        v93[3] = &unk_10004D418;
        v93[4] = v102;
        v93[5] = &v94;
        [v9 enumerateQueryWithBlock:v93];
        if (!*(void *)(*(void *)&v102[8] + 40) || !v95[5]) {
          goto LABEL_89;
        }
        v74 = [v10 objectForKeyedSubscript:_UIApplicationOpenURLOptionsSourceProcessHandleKey];
        v75 = [v74 bundleIdentifier];
        v92 = v74;
        if ([v75 isEqualToString:@"com.apple.appstored"])
        {
          unsigned __int8 v76 = [v74 hasEntitlement:@"com.apple.itunesstored.private"];

          if (v76) {
            goto LABEL_85;
          }
        }
        else
        {
        }
        +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", *(void *)(*(void *)&v102[8] + 40), v90);
        id v77 = (id)objc_claimAutoreleasedReturnValue();
        v78 = [v77 appState];
        unsigned int v79 = [v78 isValid];

        if (v79)
        {
          unsigned int v80 = [v77 profileValidated];

          if (!v80) {
            goto LABEL_88;
          }
        }
        else
        {
          v84 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:*(void *)(*(void *)&v102[8] + 40)];
          v85 = [v84 containingBundle];
          v86 = [v85 bundleType];
          unsigned __int8 v87 = [v86 isEqualToString:LSUserApplicationType];

          if ((v87 & 1) == 0)
          {

            goto LABEL_87;
          }
          unsigned __int8 v88 = [v84 profileValidated];

          if ((v88 & 1) == 0)
          {
LABEL_88:

LABEL_89:
            _Block_object_dispose(&v94, 8);

            _Block_object_dispose(v102, 8);
LABEL_90:
            unsigned __int8 v28 = 1;
LABEL_91:

            goto LABEL_14;
          }
        }
LABEL_85:
        id v89 = objc_alloc((Class)SKPurchaseIntent);
        id v77 = [v89 initWithBundleId:*(void *)(*(void *)&v102[8] + 40) productIdentifier:v95[5] appName:0 productName:0];
        [v77 send:&stru_10004D438];
LABEL_87:

        goto LABEL_88;
      }
      if ([v9 isStoreServicesURL])
      {
        v59 = +[SSLogConfig sharedConfig];
        unsigned int v60 = [v59 shouldLog];
        if ([v59 shouldLogToDisk]) {
          int v61 = v60 | 2;
        }
        else {
          int v61 = v60;
        }
        v62 = [v59 OSLogObject];
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
          v61 &= 2u;
        }
        if (v61)
        {
          *(_DWORD *)v102 = 138543618;
          *(void *)&v102[4] = objc_opt_class();
          *(_WORD *)&v102[12] = 2112;
          *(void *)&v102[14] = v9;
          id v63 = *(id *)&v102[4];
          LODWORD(v91) = 22;
          v64 = (void *)_os_log_send_and_compose_impl();

          if (v64)
          {
            v65 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v64, 4, v102, v91);
            free(v64);
            SSFileLog();
          }
        }
        else
        {
        }
        id v81 = objc_alloc((Class)SSURLConnectionRequest);
        v82 = +[NSURLRequest requestWithURL:v9];
        id v83 = [v81 initWithURLRequest:v82];

        [v83 start];
        +[NSThread sleepForTimeInterval:5.0];

        goto LABEL_90;
      }

LABEL_70:
      unsigned __int8 v28 = 0;
      goto LABEL_14;
    }
    v41 = [v9 scheme];
    unsigned int v42 = [v41 isEqualToString:@"appstore-ui"];

    if (!v42) {
      goto LABEL_70;
    }
    v43 = [v10 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
    v44 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
    v45 = +[SSLogConfig sharedConfig];
    unsigned int v46 = [v45 shouldLog];
    if ([v45 shouldLogToDisk]) {
      int v47 = v46 | 2;
    }
    else {
      int v47 = v46;
    }
    v48 = [v45 OSLogObject];
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
      v47 &= 2u;
    }
    if (v47)
    {
      *(_DWORD *)v102 = 138543874;
      *(void *)&v102[4] = objc_opt_class();
      *(_WORD *)&v102[12] = 2112;
      *(void *)&v102[14] = v9;
      *(_WORD *)&v102[22] = 2112;
      v103 = v43;
      id v49 = *(id *)&v102[4];
      LODWORD(v91) = 32;
      v90 = v102;
      v50 = (void *)_os_log_send_and_compose_impl();

      v44 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
      if (v50)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v50, 4, v102, v91);
        v51 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        free(v50);
        v90 = v51;
        SSFileLog();
      }
    }
    else
    {
    }
    unsigned __int8 v28 = [&off_100050C30 containsObject:v43];
    if (v28)
    {
      id v66 = objc_alloc_init((Class)ASCAppLaunchTrampoline);
      id v67 = [v66 handleURL:v9];
LABEL_68:

      goto LABEL_14;
    }
    id v66 = [v44[300] sharedConfig];
    unsigned int v68 = [v66 shouldLog];
    if ([v66 shouldLogToDisk]) {
      int v69 = v68 | 2;
    }
    else {
      int v69 = v68;
    }
    v70 = [v66 OSLogObject:v90];
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      v69 &= 2u;
    }
    if (v69)
    {
      v71 = objc_opt_class();
      *(_DWORD *)v102 = 138543618;
      *(void *)&v102[4] = v71;
      *(_WORD *)&v102[12] = 2112;
      *(void *)&v102[14] = v43;
      id v72 = v71;
      LODWORD(v91) = 22;
      v73 = (void *)_os_log_send_and_compose_impl();

      if (!v73) {
        goto LABEL_68;
      }
      v70 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4, v102, v91);
      free(v73);
      SSFileLog();
    }

    goto LABEL_68;
  }

LABEL_4:
  v14 = [v10 objectForKeyedSubscript:_UIApplicationOpenURLOptionsSourceProcessHandleKey];
  v15 = [v14 bundleIdentifier];
  v16 = +[SSLogConfig sharedConfig];
  unsigned int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  v19 = [v16 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    v18 &= 2u;
  }
  if (v18)
  {
    *(_DWORD *)v102 = 138543874;
    *(void *)&v102[4] = objc_opt_class();
    *(_WORD *)&v102[12] = 2112;
    *(void *)&v102[14] = v9;
    *(_WORD *)&v102[22] = 2114;
    v103 = v15;
    id v20 = *(id *)&v102[4];
    LODWORD(v91) = 32;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (v21)
    {
      v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, v102, v91);
      free(v21);
      SSFileLog();
    }
  }
  else
  {
  }
  dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
  id v24 = objc_alloc_init((Class)SSRemoteWebViewRequest);
  [v24 setReferrer:v15];
  v25 = [v9 absoluteString];
  [v24 setURLString:v25];

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100012150;
  v100[3] = &unk_10004CD30;
  dispatch_semaphore_t v101 = v23;
  v26 = v23;
  [v24 startWithCompletionBlock:v100];
  dispatch_time_t v27 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v26, v27);

  unsigned __int8 v28 = 1;
LABEL_14:

  return v28;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return -[ServiceAppDelegate _handleUniversalLinkInUserActivity:forApplication:](self, "_handleUniversalLinkInUserActivity:forApplication:", a4, a3, a5);
}

- (BOOL)_handleUniversalLinkInUserActivity:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 activityType];
  unsigned int v9 = [v8 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v9)
  {
    id v10 = [v6 webpageURL];
    if (v10)
    {
      id v11 = [objc_alloc((Class)NSURLComponents) initWithURL:v10 resolvingAgainstBaseURL:1];
      if (v11) {
        BOOL v12 = [(ServiceAppDelegate *)self _handleUniversalLinkInURLComponents:v11 forApplication:v7];
      }
      else {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_handleUniversalLinkInURLComponents:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 host];
  unsigned int v9 = [v8 isEqualToString:@"one.apple.com"];

  if (v9)
  {
    [v6 setScheme:@"ams-ui"];
    id v10 = [v6 URL];
    BOOL v11 = [(ServiceAppDelegate *)self application:v7 openURL:v10 options:&__NSDictionary0__struct];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_handleSafariScriptDataUpdate:(id)a3
{
  v3 = [a3 underlyingURL];
  unsigned int v4 = +[SSScriptURLHandler shouldHandleSafariScriptURL:v3];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:SSScriptSafariViewControllerDataUpdateNotification object:v3];

    id v6 = +[ServiceHostRegistry sharedInstance];
    id v7 = [v6 registeredHostBundleId];

    if (!v7)
    {
LABEL_13:

      goto LABEL_14;
    }
    id v8 = +[SSLogConfig sharedConfig];
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    BOOL v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      *(_DWORD *)unsigned int v17 = 138543618;
      *(void *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = v7;
      id v12 = *(id *)&v17[4];
      LODWORD(v16) = 22;
      unsigned int v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_12:

        v14 = +[FBSSystemService sharedService];
        [v14 openApplication:v7 options:0 withResult:0];

        goto LABEL_13;
      }
      BOOL v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, v17, v16, *(_OWORD *)v17, *(void *)&v17[16]);
      free(v13);
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_14:

  return v4;
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
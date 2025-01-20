@interface BuddyActivationEngine
+ (id)cellularActivationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4 usingBootstrap:(BOOL)a5;
+ (id)wifiActivationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4;
- (BOOL)allowAnyHTTPSCertificate;
- (BOOL)useCellular;
- (BOOL)usingBootstrap;
- (BuddyActivationEngine)initWithOverrideActivationURL:(id)a3 sessionURL:(id)a4;
- (CoreTelephonyClient)telephonyClient;
- (NSDictionary)responseHeaders;
- (NSString)userAgent;
- (NSTimer)connectivityTimer;
- (NSURL)overrideActivationURL;
- (NSURL)overrideSessionURL;
- (NSURLRequest)activationRequest;
- (NSURLSession)session;
- (NSURLSessionConfiguration)sessionConfiguration;
- (OS_dispatch_queue)telephonyClientQueue;
- (id)_newActivationRequestWithOptions:(id)a3 sessionData:(id)a4 error:(id *)a5;
- (id)completion;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)_addCommonHeaders:(id)a3;
- (void)_cleanup;
- (void)_sendSessionRequest:(id)a3 withOptions:(id)a4;
- (void)cancel;
- (void)makeRequest:(id)a3 completion:(id)a4;
- (void)setActivationRequest:(id)a3;
- (void)setAllowAnyHTTPSCertificate:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setConnectivityTimer:(id)a3;
- (void)setOverrideActivationURL:(id)a3;
- (void)setOverrideSessionURL:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyClientQueue:(id)a3;
- (void)setUseCellular:(BOOL)a3;
- (void)setUserAgent:(id)a3;
- (void)setUsingBootstrap:(BOOL)a3;
- (void)tryActivateWithOptions:(id)a3 requestMutator:(id)a4 completion:(id)a5;
@end

@implementation BuddyActivationEngine

+ (id)wifiActivationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = [BuddyActivationEngine alloc];
  id v8 = [(BuddyActivationEngine *)v5 initWithOverrideActivationURL:location[0] sessionURL:v9];
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)cellularActivationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4 usingBootstrap:(BOOL)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  BOOL v11 = a5;
  v7 = [BuddyActivationEngine alloc];
  id v10 = [(BuddyActivationEngine *)v7 initWithOverrideActivationURL:location[0] sessionURL:v12];
  [v10 setUseCellular:1];
  [v10 setUsingBootstrap:a5];
  id v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (BuddyActivationEngine)initWithOverrideActivationURL:(id)a3 sessionURL:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = v15;
  id v15 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)BuddyActivationEngine;
  id v15 = [(BuddyActivationEngine *)&v12 init];
  objc_storeStrong(&v15, v15);
  if (v15)
  {
    [v15 setOverrideActivationURL:location[0]];
    [v15 setOverrideSessionURL:v13];
    dispatch_queue_t v6 = dispatch_queue_create("Telephony Client Queue", 0);
    [v15 setTelephonyClientQueue:v6];

    id v7 = objc_alloc((Class)CoreTelephonyClient);
    id v8 = [v15 telephonyClientQueue];
    id v9 = [v7 initWithQueue:v8];
    [v15 setTelephonyClient:v9];
  }
  id v10 = (BuddyActivationEngine *)v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v10;
}

- (void)cancel
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = [(BuddyActivationEngine *)self completion];
  BOOL v7 = 0;
  BOOL v7 = v9->_session != 0;
  [(BuddyActivationEngine *)v9 _cleanup];
  if (v7)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog;
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Canceling any in-flight activation", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  if (location[0]) {
    (*((void (**)(id, void, void, void, void))location[0] + 2))(location[0], 0, 0, 0, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_cleanup
{
  [(NSURLSession *)self->_session invalidateAndCancel];
  v2 = [(BuddyActivationEngine *)self connectivityTimer];
  [(NSTimer *)v2 invalidate];

  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  id completion = self->_completion;
  self->_id completion = 0;

  [(BuddyActivationEngine *)self setConnectivityTimer:0];
}

- (NSURLSession)session
{
  v44 = self;
  v43[1] = (id)a2;
  if (!self->_session)
  {
    v43[0] = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [v43[0] setWaitsForConnectivity:1];
    if (v44->_useCellular)
    {
      [v43[0] set_CTDataConnectionServiceType:kCTDataConnectionServiceTypeOTAActivation];
      id location = 0;
      id v41 = 0;
      id v40 = 0;
      v2 = [(BuddyActivationEngine *)v44 telephonyClient];
      id obj = 0;
      id v3 = [(CoreTelephonyClient *)v2 getPreferredDataSubscriptionContextSync:&obj];
      objc_storeStrong(&location, obj);
      id v39 = v3;

      if (v39)
      {
        id v37 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
        v4 = [(BuddyActivationEngine *)v44 telephonyClient];
        id v36 = location;
        id v5 = [(CoreTelephonyClient *)v4 copyCarrierBundleValue:v39 key:@"OTAActivationProxyHost" bundleType:v37 error:&v36];
        objc_storeStrong(&location, v36);
        id v6 = v41;
        id v41 = v5;

        if (!v41 && location)
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            sub_10004B238((uint64_t)buf, (uint64_t)location);
            _os_log_impl((void *)&_mh_execute_header, oslog, v34, "Failed to get proxy host from telephony: %@", buf, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        BOOL v7 = [(BuddyActivationEngine *)v44 telephonyClient];
        id v33 = location;
        id v8 = [(CoreTelephonyClient *)v7 copyCarrierBundleValue:v39 key:@"OTAActivationProxyPort" bundleType:v37 error:&v33];
        objc_storeStrong(&location, v33);
        id v9 = v40;
        id v40 = v8;

        if (!v40 && location)
        {
          os_log_t v32 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            sub_10004B238((uint64_t)v49, (uint64_t)location);
            _os_log_impl((void *)&_mh_execute_header, v32, v31, "Failed to get proxy port from telephony: %@", v49, 0xCu);
          }
          objc_storeStrong((id *)&v32, 0);
        }
        id v10 = [v39 uuid];
        id v11 = [v10 UUIDString];
        [v43[0] set_sourceApplicationSecondaryIdentifier:v11];

        objc_storeStrong(&v37, 0);
      }
      else if (location)
      {
        os_log_t v30 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v29 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          sub_10004B238((uint64_t)v48, (uint64_t)location);
          _os_log_error_impl((void *)&_mh_execute_header, v30, v29, "Failed to get data preferred subscription context: %@", v48, 0xCu);
        }
        objc_storeStrong((id *)&v30, 0);
      }
      if (v41 && v40)
      {
        v46[0] = kCFStreamPropertyHTTPProxyHost;
        v47[0] = v41;
        v46[1] = kCFStreamPropertyHTTPProxyPort;
        v47[1] = v40;
        v46[2] = kCFStreamPropertyHTTPSProxyHost;
        v47[2] = v41;
        v46[3] = kCFStreamPropertyHTTPSProxyPort;
        v47[3] = v40;
        id v28 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];

        [v43[0] setConnectionProxyDictionary:v28];
        os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B238((uint64_t)v45, (uint64_t)v28);
          _os_log_impl((void *)&_mh_execute_header, v27, v26, "Set Proxy Settings %@", v45, 0xCu);
        }
        objc_storeStrong((id *)&v27, 0);
        objc_storeStrong(&v28, 0);
      }
      else
      {
        os_log_t v25 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v12 = v25;
          os_log_type_t v13 = v24;
          sub_10004B24C(v23);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "No Proxy Settings Detected!", (uint8_t *)v23, 2u);
        }
        objc_storeStrong((id *)&v25, 0);
      }
      if (v40)
      {
        if ([v40 integerValue] == (id)443)
        {
          id v14 = +[BuddyActivationConfiguration currentConfiguration];
          id v15 = [v14 cellularActivationMethod];

          if (v15 == (id)1) {
            [v43[0] set_requiresSecureHTTPSProxyConnection:1];
          }
        }
      }
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&location, 0);
    }
    id v16 = v43[0];
    v17 = v44;
    v18 = +[NSOperationQueue mainQueue];
    v19 = +[NSURLSession sessionWithConfiguration:v16 delegate:v17 delegateQueue:v18];
    session = v44->_session;
    v44->_session = v19;

    objc_storeStrong(v43, 0);
  }
  v21 = v44->_session;

  return v21;
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  v2 = [(BuddyActivationEngine *)self session];
  id v3 = [(NSURLSession *)v2 configuration];

  return v3;
}

- (id)_newActivationRequestWithOptions:(id)a3 sessionData:(id)a4 error:(id *)a5
{
  v83 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v81 = 0;
  objc_storeStrong(&v81, a4);
  v80 = a5;
  id v79 = 0;
  id v78 = 0;
  uint64_t v77 = 0;
  uint64_t v76 = 0;
  id v7 = (id)_BYSignpostSubsystem();
  uint64_t v8 = _BYSignpostCreate();
  uint64_t v75 = v9;
  uint64_t v74 = v8;

  os_log_t log = (os_log_t)(id)_BYSignpostSubsystem();
  char v72 = 1;
  uint64_t v71 = v74;
  if (v74 && v71 != -1 && os_signpost_enabled(log))
  {
    id v10 = log;
    os_signpost_type_t v11 = v72;
    os_signpost_id_t v12 = v71;
    sub_10004B24C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, v11, v12, "ActivationCreateActivationRequest", "", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  os_log_t oslog = (os_log_t)(id)_BYSignpostSubsystem();
  os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v91, v74);
    _os_log_impl((void *)&_mh_execute_header, oslog, v68, "BEGIN [%lld]: ActivationCreateActivationRequest ", v91, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  uint64_t v76 = v74;
  uint64_t v77 = v75;
  id obj = v79;
  id v66 = v78;
  char v13 = MAECreateActivationRequestWithError();
  objc_storeStrong(&v79, obj);
  objc_storeStrong(&v78, v66);
  if (v13)
  {
    double v58 = (double)(unint64_t)_BYSignpostGetNanoseconds() / 1000000000.0;
    os_log_t v57 = (os_log_t)(id)_BYSignpostSubsystem();
    char v56 = 2;
    uint64_t v55 = v76;
    if (v76 && v55 != -1 && os_signpost_enabled(v57))
    {
      id v16 = v57;
      os_signpost_type_t v17 = v56;
      os_signpost_id_t v18 = v55;
      sub_10004B24C(v54);
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, v17, v18, "ActivationCreateActivationRequest", "", v54, 2u);
    }
    objc_storeStrong((id *)&v57, 0);
    os_log_t v53 = (os_log_t)(id)_BYSignpostSubsystem();
    os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000A0448((uint64_t)v89, v76, *(uint64_t *)&v58);
      _os_log_impl((void *)&_mh_execute_header, v53, v52, "END [%lld] %fs: ActivationCreateActivationRequest ", v89, 0x16u);
    }
    objc_storeStrong((id *)&v53, 0);
    id v51 = [v79 valueForHTTPHeaderField:@"User-Agent"];
    v19 = v83;
    id v20 = sub_100147CA8();
    id v21 = [v20 stringByAppendingFormat:@" %@", v51];
    [(BuddyActivationEngine *)v19 setUserAgent:v21];

    os_log_t v50 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = [v79 URL];
      sub_10004B238((uint64_t)v88, (uint64_t)v48);
      _os_log_impl((void *)&_mh_execute_header, v50, v49, "Setting override URL with old URL: %@", v88, 0xCu);

      objc_storeStrong(&v48, 0);
    }
    objc_storeStrong((id *)&v50, 0);
    if (v83->_overrideActivationURL) {
      [v79 setURL:v83->_overrideActivationURL];
    }
    id v22 = v79;
    v23 = [(BuddyActivationEngine *)v83 userAgent];
    [v22 setValue:v23 forHTTPHeaderField:@"User-Agent"];

    id v24 = +[NSLocale _deviceLanguage];
    id v87 = v24;
    os_log_t v25 = +[NSArray arrayWithObjects:&v87 count:1];
    id v26 = +[NSLocale minimizedLanguagesFromLanguages:v25];
    id v47 = [v26 componentsJoinedByString:@","];

    os_log_t v46 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)v86, (uint64_t)v47);
      _os_log_impl((void *)&_mh_execute_header, v46, v45, "Accepted languages: %@", v86, 0xCu);
    }
    objc_storeStrong((id *)&v46, 0);
    [v79 setValue:v47 forHTTPHeaderField:@"Accept-Language"];
    char v43 = 0;
    char v41 = 0;
    unsigned __int8 v27 = 0;
    if (os_variant_allows_internal_security_policies())
    {
      id v44 = [v79 URL];
      char v43 = 1;
      id v42 = [v44 absoluteString];
      char v41 = 1;
      unsigned __int8 v27 = [v42 hasSuffix:@"/deviceActivation"];
    }
    if (v41) {

    }
    if (v43) {
    if (v27)
    }
    {
      id v28 = +[NSUserDefaults standardUserDefaults];
      id v40 = [(NSUserDefaults *)v28 dictionaryForKey:@"CustomActivationHeaders"];

      memset(__b, 0, sizeof(__b));
      id v29 = v40;
      id v30 = [v29 countByEnumeratingWithState:__b objects:v85 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)__b[2];
        do
        {
          for (unint64_t i = 0; i < (unint64_t)v30; ++i)
          {
            if (*(void *)__b[2] != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v39 = *(void *)(__b[1] + 8 * i);
            id v33 = v79;
            id v34 = [v40 objectForKeyedSubscript:v39];
            [v33 setValue:v34 forHTTPHeaderField:v39];
          }
          id v30 = [v29 countByEnumeratingWithState:__b objects:v85 count:16];
        }
        while (v30);
      }

      objc_storeStrong(&v40, 0);
    }
    if (v83->_allowAnyHTTPSCertificate)
    {
      id v35 = [v79 URL];
      id v36 = [v35 host];
      +[NSURLRequest setAllowsAnyHTTPSCertificate:1 forHost:v36];
    }
    [(BuddyActivationEngine *)v83 _addCommonHeaders:v79];
    id v84 = v79;
    int v59 = 1;
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v51, 0);
  }
  else
  {
    os_log_t v65 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      char v62 = 0;
      char v60 = 0;
      if (_BYIsInternalInstall())
      {
        id v14 = (NSString *)v78;
      }
      else if (v78)
      {
        id v63 = [v78 domain];
        char v62 = 1;
        id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v63, [v78 code]);
        id v61 = v14;
        char v60 = 1;
      }
      else
      {
        id v14 = 0;
      }
      sub_10004BB7C((uint64_t)v90, (uint64_t)v14);
      _os_log_impl((void *)&_mh_execute_header, v65, v64, "Buddy Activate: Failed to create activation request: %{public}@", v90, 0xCu);
      if (v60) {

      }
      if (v62) {
    }
      }
    objc_storeStrong((id *)&v65, 0);
    if (v80)
    {
      id v15 = v78;
      id *v80 = v15;
    }
    id v84 = 0;
    int v59 = 1;
  }
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, 0);
  return v84;
}

- (void)_sendSessionRequest:(id)a3 withOptions:(id)a4
{
  id v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  long long v37 = 0uLL;
  id v5 = (id)_BYSignpostSubsystem();
  *(void *)&long long v36 = _BYSignpostCreate();
  *((void *)&v36 + 1) = v6;

  id v35 = (id)_BYSignpostSubsystem();
  char v34 = 1;
  os_signpost_id_t v33 = v36;
  if ((void)v36 && v33 != -1 && os_signpost_enabled((os_log_t)v35))
  {
    id v7 = v35;
    os_signpost_type_t v8 = v34;
    os_signpost_id_t v9 = v33;
    sub_10004B24C(&buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, v8, v9, "ActivationSendRequest", "", (uint8_t *)&buf, 2u);
  }
  objc_storeStrong(&v35, 0);
  id v31 = (id)_BYSignpostSubsystem();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v42, v36);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v31, v30, "BEGIN [%lld]: ActivationSendRequest ", v42, 0xCu);
  }
  objc_storeStrong(&v31, 0);
  long long v37 = v36;
  uint64_t v23 = 0;
  id v24 = &v23;
  int v25 = 838860800;
  int v26 = 48;
  unsigned __int8 v27 = sub_1001B5608;
  id v28 = sub_1001B564C;
  id v29 = 0;
  id v10 = [(BuddyActivationEngine *)v40 session];
  id v11 = location[0];
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  os_signpost_id_t v18 = sub_1001B5658;
  v19 = &unk_1002B47C0;
  long long v22 = v37;
  id v20 = v40;
  v21[0] = v38;
  v21[1] = &v23;
  os_signpost_id_t v12 = [(NSURLSession *)v10 dataTaskWithRequest:v11 completionHandler:&v15];
  char v13 = (void *)v24[5];
  v24[5] = (uint64_t)v12;

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004BB7C((uint64_t)v41, v24[5]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activation: Created session data task: %{public}@", v41, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(id)v24[5] resume];
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)tryActivateWithOptions:(id)a3 requestMutator:(id)a4 completion:(id)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  [(BuddyActivationEngine *)v20 setCompletion:v17];
  objc_storeStrong((id *)&v20->_activationData, 0);
  id v7 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_1001B66DC;
  os_signpost_id_t v12 = &unk_1002B47E8;
  id v15 = v17;
  char v13 = v20;
  id v16 = v18;
  id v14 = location[0];
  dispatch_async(v7, &block);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)makeRequest:(id)a3 completion:(id)a4
{
  char v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  id v31 = [location[0] mutableCopy];
  id v5 = [(BuddyActivationEngine *)v34 userAgent];
  [v31 setValue:v5 forHTTPHeaderField:@"User-Agent"];

  objc_storeStrong((id *)&v34->_activationRequest, v31);
  os_log_type_t v30 = 0;
  id v29 = 0;
  id v6 = (id)_BYSignpostSubsystem();
  id v7 = (void *)_BYSignpostCreate();
  id v28 = v8;
  unsigned __int8 v27 = v7;

  os_log_t log = (os_log_t)(id)_BYSignpostSubsystem();
  char v25 = 1;
  id v24 = v27;
  if (v27 && v24 != (void *)-1 && os_signpost_enabled(log))
  {
    int v9 = log;
    os_signpost_type_t v10 = v25;
    os_signpost_id_t v11 = (os_signpost_id_t)v24;
    sub_10004B24C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, v10, v11, "ActivationSendRequest", "", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  os_log_t oslog = (os_log_t)(id)_BYSignpostSubsystem();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v36, (uint64_t)v27);
    _os_log_impl((void *)&_mh_execute_header, oslog, v21, "BEGIN [%lld]: ActivationSendRequest ", v36, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v29 = v27;
  os_log_type_t v30 = v28;
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_1001B710C;
  v19 = &unk_1002B4798;
  v20[1] = v27;
  v20[2] = v28;
  v20[0] = v32;
  [(BuddyActivationEngine *)v34 setCompletion:&v15];
  os_signpost_id_t v12 = [(BuddyActivationEngine *)v34 session];
  id v14 = [(NSURLSession *)v12 dataTaskWithRequest:v34->_activationRequest];

  os_log_t v13 = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004BB7C((uint64_t)v35, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Buddy Activation: Created arbitrary data task: %{public}@", v35, 0xCu);
  }
  objc_storeStrong((id *)&v13, 0);
  [v14 resume];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
}

- (void)_addCommonHeaders:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  if ([(BuddyActivationEngine *)v7 useCellular])
  {
    if ([(BuddyActivationEngine *)v7 usingBootstrap]) {
      objc_storeStrong(&v5, &off_1002C1638);
    }
    else {
      objc_storeStrong(&v5, &off_1002C1660);
    }
  }
  if ([v5 count])
  {
    id v3 = [location[0] allHTTPHeaderFields];
    id v4 = [v3 mutableCopy];

    [v4 addEntriesFromDictionary:v5];
    [location[0] setAllHTTPHeaderFields:v4];
    objc_storeStrong(&v4, 0);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v21);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v18, "Session received response: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v9 = [(BuddyActivationEngine *)v24 connectivityTimer];

  if (v9)
  {
    os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_type_t v10 = v17;
      os_log_type_t v11 = v16;
      sub_10004B24C(v15);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Invalidating connectivity timer...", (uint8_t *)v15, 2u);
    }
    objc_storeStrong((id *)&v17, 0);
    os_signpost_id_t v12 = [(BuddyActivationEngine *)v24 connectivityTimer];
    [(NSTimer *)v12 invalidate];

    [(BuddyActivationEngine *)v24 setConnectivityTimer:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_log_t v13 = v24;
    id v14 = [v21 allHeaderFields];
    [(BuddyActivationEngine *)v13 setResponseHeaders:v14];
  }
  else
  {
    [(BuddyActivationEngine *)v24 setResponseHeaders:0];
  }
  if (v20) {
    (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  os_log_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  if (location[0] == v13->_session)
  {
    if (v13->_activationData)
    {
      [(NSMutableData *)v13->_activationData appendData:v10];
    }
    else
    {
      id v7 = objc_alloc((Class)NSMutableData);
      os_signpost_type_t v8 = (NSMutableData *)[v7 initWithData:v10];
      activationData = v13->_activationData;
      v13->_activationData = v8;
    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  int v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v24;
    int64_t v8 = [(NSMutableData *)v26->_activationData length];
    char v19 = 0;
    char v17 = 0;
    if (_BYIsInternalInstall())
    {
      int v9 = (NSString *)v23;
    }
    else if (v23)
    {
      id v20 = [v23 domain];
      char v19 = 1;
      int v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v20, [v23 code]);
      id v18 = v9;
      char v17 = 1;
    }
    else
    {
      int v9 = 0;
    }
    sub_10004D1D8((uint64_t)buf, (uint64_t)v7, v8, (uint64_t)v9);
    _os_log_impl((void *)&_mh_execute_header, oslog, v21, "Task %{public}@ completed with activationData length = %llu, error: %{public}@", buf, 0x20u);
    if (v17) {

    }
    if (v19) {
  }
    }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0] == v26->_session)
  {
    id v10 = [(BuddyActivationEngine *)v26 completion];

    if (v10)
    {
      id v16 = [(NSMutableData *)v26->_activationData copy];
      id v11 = [(BuddyActivationEngine *)v26 responseHeaders];
      id v15 = [(NSDictionary *)v11 copy];

      id v14 = [(BuddyActivationEngine *)v26 completion];
      [(BuddyActivationEngine *)v26 _cleanup];
      id v12 = [v24 response];
      id v13 = [v12 URL];
      (*((void (**)(id, id, id, id, id))v14 + 2))(v14, v16, v15, v13, v23);

      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  unsigned __int8 v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = 0;
  objc_storeStrong(&v23, a6);
  id v22 = 0;
  objc_storeStrong(&v22, a7);
  id v21 = [v24 statusCode];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_1001B7E48((uint64_t)buf, (int)v21, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v19, "Activate: Will redirect, code %i: %@, new request: %@", buf, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v17 = 0;
  BOOL v11 = 0;
  if (v24)
  {
    BOOL v11 = 0;
    if (v21 == (id)302)
    {
      BOOL v11 = 0;
      if (v27->_activationRequest)
      {
        id v18 = [(NSURLRequest *)v27->_activationRequest HTTPBody];
        char v17 = 1;
        BOOL v11 = v18 != 0;
      }
    }
  }
  if (v17) {

  }
  if (v11)
  {
    id obj = [v23 mutableCopy];
    [obj setHTTPMethod:@"POST"];
    id v12 = [(NSURLRequest *)v27->_activationRequest valueForHTTPHeaderField:@"Content-Type"];
    [obj setValue:v12 forHTTPHeaderField:@"Content-Type"];

    id v13 = [(NSURLRequest *)v27->_activationRequest valueForHTTPHeaderField:@"Content-Length"];
    [obj setValue:v13 forHTTPHeaderField:@"Content-Length"];

    id v14 = [(BuddyActivationEngine *)v27 userAgent];
    [obj setValue:v14 forHTTPHeaderField:@"User-Agent"];

    id v15 = [(NSURLRequest *)v27->_activationRequest HTTPBody];
    [obj setHTTPBody:v15];

    objc_storeStrong(&v23, obj);
    objc_storeStrong(&obj, 0);
  }
  if (location[0] == v27->_session && v27->_activationRequest != v23) {
    [(BuddyActivationEngine *)v27 setActivationRequest:v23];
  }
  if (v22) {
    (*((void (**)(id, id))v22 + 2))(v22, v23);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  os_log_type_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  double v16 = 15.0;
  if (v19->_useCellular)
  {
    id v5 = +[BuddyActivationConfiguration currentConfiguration];
    id v6 = [v5 cellularActivationMethod];

    if (v6 == (id)1) {
      double v16 = 60.0;
    }
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, *(uint64_t *)&v16);
    _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Waiting %0.f seconds for connectivity for activation...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  double v7 = v16;
  int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  BOOL v11 = sub_1001B80B4;
  id v12 = &unk_1002B2528;
  id v13 = v17;
  int64_t v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v9 block:v7];
  -[BuddyActivationEngine setConnectivityTimer:](v19, "setConnectivityTimer:", v8, v9, v10, v11, v12);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)useCellular
{
  return self->_useCellular;
}

- (void)setUseCellular:(BOOL)a3
{
  self->_useCellular = a3;
}

- (BOOL)allowAnyHTTPSCertificate
{
  return self->_allowAnyHTTPSCertificate;
}

- (void)setAllowAnyHTTPSCertificate:(BOOL)a3
{
  self->_allowAnyHTTPSCertificate = a3;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (NSURL)overrideActivationURL
{
  return self->_overrideActivationURL;
}

- (void)setOverrideActivationURL:(id)a3
{
}

- (NSURL)overrideSessionURL
{
  return self->_overrideSessionURL;
}

- (void)setOverrideSessionURL:(id)a3
{
}

- (BOOL)usingBootstrap
{
  return self->_usingBootstrap;
}

- (void)setUsingBootstrap:(BOOL)a3
{
  self->_usingBootstrap = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSURLRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (OS_dispatch_queue)telephonyClientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTelephonyClientQueue:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTelephonyClient:(id)a3
{
}

- (NSTimer)connectivityTimer
{
  return self->_connectivityTimer;
}

- (void)setConnectivityTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
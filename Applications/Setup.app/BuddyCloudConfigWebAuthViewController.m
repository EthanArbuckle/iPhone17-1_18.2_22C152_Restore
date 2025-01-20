@interface BuddyCloudConfigWebAuthViewController
- (BOOL)willDownloadError;
- (BuddyCloudConfigWebAuthDelegate)delegate;
- (NSArray)anchorCerts;
- (NSData)downloadedResponseData;
- (NSData)machineInfo;
- (NSString)downloadDestination;
- (NSURL)webURL;
- (WKWebView)webView;
- (id)_getEncodedMachineInfo;
- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5;
- (void)_download:(id)a3 didCreateDestination:(id)a4;
- (void)_download:(id)a3 didFailWithError:(id)a4;
- (void)_download:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)_downloadDidCancel:(id)a3;
- (void)_downloadDidFinish:(id)a3;
- (void)_downloadDidStart:(id)a3;
- (void)_downloadProcessDidCrash:(id)a3;
- (void)_showFailureAlertWithTitle:(id)a3 andMessage:(id)a4;
- (void)cancelButtonTapped;
- (void)evaluateAuthenticationChallenge:(id)a3 withCompletionHandler:(id)a4;
- (void)setAnchorCerts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadDestination:(id)a3;
- (void)setDownloadedResponseData:(id)a3;
- (void)setMachineInfo:(id)a3;
- (void)setWebURL:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWillDownloadError:(BOOL)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation BuddyCloudConfigWebAuthViewController

- (void)viewDidLoad
{
  v27 = self;
  SEL v26 = a2;
  v25.receiver = self;
  v25.super_class = (Class)BuddyCloudConfigWebAuthViewController;
  [(BuddyCloudConfigWebAuthViewController *)&v25 viewDidLoad];
  id v2 = objc_alloc((Class)UIBarButtonItem);
  id v3 = [v2 initWithBarButtonSystemItem:1 target:v27 action:"cancelButtonTapped"];
  id v4 = [(BuddyCloudConfigWebAuthViewController *)v27 navigationItem];
  [v4 setLeftBarButtonItem:v3];

  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyCloudConfigWebAuthViewController *)v27 setTitle:v6];

  id v24 = (id)objc_opt_new();
  v7 = +[WKWebsiteDataStore nonPersistentDataStore];
  [v24 setWebsiteDataStore:v7];

  id v8 = [v24 preferences];
  [v8 _setDiagnosticLoggingEnabled:1];

  id v23 = [objc_alloc((Class)WKWebView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height configuration:v24];
  [(BuddyCloudConfigWebAuthViewController *)v27 setView:v23];
  [(BuddyCloudConfigWebAuthViewController *)v27 setWebView:v23];
  v9 = v27;
  v10 = [(BuddyCloudConfigWebAuthViewController *)v27 webView];
  [(WKWebView *)v10 setUIDelegate:v9];

  v11 = v27;
  v12 = [(BuddyCloudConfigWebAuthViewController *)v27 webView];
  [(WKWebView *)v12 setNavigationDelegate:v11];

  v13 = v27;
  v14 = [(BuddyCloudConfigWebAuthViewController *)v27 webView];
  v15 = [(WKWebView *)v14 configuration];
  v16 = [(WKWebViewConfiguration *)v15 processPool];
  [(WKProcessPool *)v16 _setDownloadDelegate:v13];

  id v17 = objc_alloc((Class)NSMutableURLRequest);
  v18 = [(BuddyCloudConfigWebAuthViewController *)v27 webURL];
  id location = [v17 initWithURL:v18];

  id v19 = [(BuddyCloudConfigWebAuthViewController *)v27 _getEncodedMachineInfo];
  [location setValue:v19 forHTTPHeaderField:@"x-apple-aspen-deviceinfo"];

  v20 = [(BuddyCloudConfigWebAuthViewController *)v27 webView];
  id v21 = [(WKWebView *)v20 loadRequest:location];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  id v7 = [v26 domain];
  BOOL v8 = 0;
  if ([v7 isEqualToString:WebKitErrorDomain]) {
    BOOL v8 = [v26 code] == (id)102;
  }

  if (v8)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = oslog;
      os_log_type_t v10 = v24;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Suppressing web navigation error caused by policy change", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v22 = 1;
  }
  else
  {
    v11 = +[NSBundle mainBundle];
    id v21 = [(NSBundle *)v11 localizedStringForKey:@"REMOTE_MANAGEMENT_FAILED_TO_LOAD_PAGE" value:&stru_1002B4E18 table:@"Localizable"];

    id v12 = [v26 domain];
    BOOL v13 = 0;
    if ([v12 isEqualToString:NSURLErrorDomain]) {
      BOOL v13 = [v26 code] == (id)-1003;
    }

    if (v13)
    {
      id v14 = [v26 userInfo];
      id v20 = [v14 objectForKeyedSubscript:NSURLErrorFailingURLErrorKey];

      id v19 = [v20 host];
      v15 = +[NSBundle mainBundle];
      v16 = [(NSBundle *)v15 localizedStringForKey:@"REMOTE_MANAGEMENT_UNABLE_TO_RESOLVE_HOST" value:&stru_1002B4E18 table:@"Localizable"];
      id v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v19);

      [(BuddyCloudConfigWebAuthViewController *)v29 _showFailureAlertWithTitle:v21 andMessage:v18];
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v20, 0);
    }
    else
    {
      id v17 = [v26 description];
      [(BuddyCloudConfigWebAuthViewController *)v29 _showFailureAlertWithTitle:v21 andMessage:v17];
      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v21, 0);
    int v22 = 0;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  id v31 = [v33 response];
  id v7 = [v31 MIMEType];
  LOBYTE(a4) = [v7 isEqualToString:@"application/x-apple-aspen-config"];

  if (a4)
  {
    BOOL v8 = [(BuddyCloudConfigWebAuthViewController *)v35 webURL];
    id v30 = [(NSURL *)v8 host];

    id v9 = [v31 URL];
    id v29 = [v9 host];

    if ([v30 caseInsensitiveCompare:v29])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      char v27 = 16;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v10 = oslog;
        os_log_type_t v11 = v27;
        sub_10004B24C(buf);
        _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "domain of download does not match domain of initial URL from cloud config!", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, void))v32 + 2))(v32, 0);
      int v25 = 1;
    }
    else
    {
      (*((void (**)(id, uint64_t))v32 + 2))(v32, 2);
      int v25 = 1;
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    char v23 = 0;
    unsigned __int8 v12 = 0;
    if ([v31 statusCode] == (id)403)
    {
      id v24 = [v31 MIMEType];
      char v23 = 1;
      unsigned __int8 v12 = [v24 isEqualToString:DMCHTTPContentTypeApplicationJSON];
    }
    if (v23) {

    }
    if (v12)
    {
      [(BuddyCloudConfigWebAuthViewController *)v35 setWillDownloadError:1];
      (*((void (**)(id, uint64_t))v32 + 2))(v32, 2);
      int v25 = 1;
    }
    else if ([v31 statusCode] == (id)404)
    {
      os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
      char v21 = 16;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = v22;
        os_log_type_t v14 = v21;
        sub_10004B24C(v20);
        _os_log_error_impl((void *)&_mh_execute_header, v13, v14, "recieved 404 response from website!", v20, 2u);
      }
      objc_storeStrong((id *)&v22, 0);
      (*((void (**)(id, void))v32 + 2))(v32, 0);
      int v25 = 1;
    }
    else
    {
      (*((void (**)(id, uint64_t))v32 + 2))(v32, 1);
      os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
      char v18 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v15 = v19;
        os_log_type_t v16 = v18;
        sub_10004B24C(v17);
        _os_log_error_impl((void *)&_mh_execute_header, v15, v16, "did not recieve download response!", (uint8_t *)v17, 2u);
      }
      objc_storeStrong((id *)&v19, 0);
      int v25 = 0;
    }
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = oslog;
    os_log_type_t v8 = v10;
    sub_10004B24C(v9);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "webview didReceiveAuthenticationChallenge", (uint8_t *)v9, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigWebAuthViewController *)v15 evaluateAuthenticationChallenge:v13 withCompletionHandler:v12];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_downloadDidStart:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "download did Start!", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  id v7 = +[NSString stringWithFormat:@"/tmp/%@", v9];
  (*((void (**)(id, uint64_t, id))v8 + 2))(v8, 1, v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v9);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, v7, "download failed with error from WKDownload!: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = +[NSError errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-2 userInfo:0];
  v5 = [(BuddyCloudConfigWebAuthViewController *)v11 delegate];
  [(BuddyCloudConfigWebAuthDelegate *)v5 webAuthCanceled:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_downloadDidCancel:(id)a3
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  char v8 = 16;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    id v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(buf);
    _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "download canceled! ", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = +[NSError errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-3 userInfo:0];
  v5 = [(BuddyCloudConfigWebAuthViewController *)v11 delegate];
  [(BuddyCloudConfigWebAuthDelegate *)v5 webAuthCanceled:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 didCreateDestination:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = oslog;
    os_log_type_t v6 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "download did create destination", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigWebAuthViewController *)v12 setDownloadDestination:v10];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_downloadDidFinish:(id)a3
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyCloudConfigWebAuthViewController *)v32 webView];
  [(WKWebView *)v3 stopLoading];

  os_log_type_t v4 = [(BuddyCloudConfigWebAuthViewController *)v32 downloadDestination];
  v5 = +[NSData dataWithContentsOfFile:v4];
  [(BuddyCloudConfigWebAuthViewController *)v32 setDownloadedResponseData:v5];

  if ([(BuddyCloudConfigWebAuthViewController *)v32 willDownloadError])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v6 = [(BuddyCloudConfigWebAuthViewController *)v32 downloadedResponseData];
      id v28 = +[NSString stringWithFormat:@"%lu", [(NSData *)v6 length]];
      sub_10004BB7C((uint64_t)buf, (uint64_t)v28);
      _os_log_impl((void *)&_mh_execute_header, oslog, v29, "we downloaded an error with data length of %{public}@!", buf, 0xCu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_type_t v7 = [(BuddyCloudConfigWebAuthViewController *)v32 downloadedResponseData];
    id v27 = +[DMCHTTPRequestor jsonDictFromResponse:v7];

    id v26 = 0;
    id obj = 0;
    unsigned __int8 v8 = +[DMCHTTPRequestor parsePredefined403ErrorWithResponseDictionary:v27 outError:&obj];
    objc_storeStrong(&v26, obj);
    if (v8)
    {
      os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        char v21 = 0;
        char v19 = 0;
        if (_BYIsInternalInstall())
        {
          id v9 = (NSString *)v26;
        }
        else if (v26)
        {
          id v22 = [v26 domain];
          char v21 = 1;
          id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v22, [v26 code]);
          id v20 = v9;
          char v19 = 1;
        }
        else
        {
          id v9 = 0;
        }
        sub_10004BB7C((uint64_t)v34, (uint64_t)v9);
        _os_log_impl((void *)&_mh_execute_header, v24, v23, "WebAuthView received 403 error %{public}@!", v34, 0xCu);
        if (v19) {

        }
        if (v21) {
      }
        }
      objc_storeStrong((id *)&v24, 0);
    }
    id v10 = [(BuddyCloudConfigWebAuthViewController *)v32 delegate];
    [(BuddyCloudConfigWebAuthDelegate *)v10 webAuthCanceled:v26];

    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    os_log_t v18 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v11 = [(BuddyCloudConfigWebAuthViewController *)v32 downloadedResponseData];
      id v16 = +[NSString stringWithFormat:@"%lu", [(NSData *)v11 length]];
      sub_10004BB7C((uint64_t)v33, (uint64_t)v16);
      _os_log_impl((void *)&_mh_execute_header, v18, v17, "we downloaded a profile with data length of %{public}@!", v33, 0xCu);

      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong((id *)&v18, 0);
    id v12 = +[NSFileManager defaultManager];
    id v13 = [(BuddyCloudConfigWebAuthViewController *)v32 downloadDestination];
    [(NSFileManager *)v12 removeItemAtPath:v13 error:0];

    os_log_type_t v14 = [(BuddyCloudConfigWebAuthViewController *)v32 delegate];
    v15 = [(BuddyCloudConfigWebAuthViewController *)v32 downloadedResponseData];
    [(BuddyCloudConfigWebAuthDelegate *)v14 recievedProfile:v15];
  }
  objc_storeStrong(location, 0);
}

- (void)_downloadProcessDidCrash:(id)a3
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  char v8 = 16;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    id v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(buf);
    _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "the download process crashed!", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = +[NSError errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-4 userInfo:0];
  v5 = [(BuddyCloudConfigWebAuthViewController *)v11 delegate];
  [(BuddyCloudConfigWebAuthDelegate *)v5 webAuthCanceled:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v7 = oslog;
    os_log_type_t v8 = v10;
    sub_10004B24C(v9);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "wkdownload didReceiveAuthenticationChallenge", (uint8_t *)v9, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigWebAuthViewController *)v15 evaluateAuthenticationChallenge:v13 withCompletionHandler:v12];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)_getEncodedMachineInfo
{
  id location[2] = self;
  location[1] = (id)a2;
  id v2 = [(BuddyCloudConfigWebAuthViewController *)self machineInfo];
  location[0] = [(NSData *)v2 base64EncodedStringWithOptions:0];

  id v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (void)cancelButtonTapped
{
  os_log_type_t v10 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyCloudConfigWebAuthViewController *)self delegate];

  if (v2)
  {
    location[0] = +[NSError errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-1 userInfo:0];
    id v3 = [(BuddyCloudConfigWebAuthViewController *)v10 delegate];
    [(BuddyCloudConfigWebAuthDelegate *)v3 webAuthCanceled:location[0]];

    objc_storeStrong(location, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v7 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v4 = oslog;
      os_log_type_t v5 = v7;
      sub_10004B24C(v6);
      _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "no delegate defined for buddy web auth!", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
}

- (void)_showFailureAlertWithTitle:(id)a3 andMessage:(id)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100051470((uint64_t)buf, (uint64_t)location[0], (uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Showing failure alert title: %@, message: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v14 = +[UIAlertController alertControllerWithTitle:location[0] message:v17 preferredStyle:1];
  id v5 = v14;
  id v6 = +[NSBundle mainBundle];
  char v7 = [(NSBundle *)v6 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  os_log_type_t v11 = sub_10010EA08;
  id v12 = &unk_1002B1040;
  id v13 = v19;
  os_log_type_t v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:&v9];
  [v5 addAction:v8, v9, v10, v11, v12];

  [v19 presentViewController:v14 animated:1 completion:0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)evaluateAuthenticationChallenge:(id)a3 withCompletionHandler:(id)a4
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  uint64_t v38 = 1;
  id v37 = 0;
  id v5 = [location[0] protectionSpace];
  id v6 = [v5 authenticationMethod];
  unsigned __int8 v7 = [v6 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v7)
  {
    id v36 = [location[0] protectionSpace];
    id v35 = [v36 host];
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100063D38((uint64_t)buf, (uint64_t)v35, [(NSArray *)v41->_anchorCerts count]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v33, "evaluating trust for %@ using %lu anchor certs", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v41->_anchorCerts)
    {
      OSStatus v32 = 0;
      id v8 = [location[0] protectionSpace];
      id v9 = (__SecTrust *)[v8 serverTrust];
      OSStatus v10 = SecTrustSetAnchorCertificates(v9, (CFArrayRef)v41->_anchorCerts);

      OSStatus v32 = v10;
      if (v10)
      {
        os_log_t v31 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          sub_10005A060(v43, v32);
          _os_log_error_impl((void *)&_mh_execute_header, v31, v30, "Failed to set Anchor Certs on trust! With secError code: %d", v43, 8u);
        }
        objc_storeStrong((id *)&v31, 0);
      }
    }
    SecTrustResultType result = kSecTrustResultInvalid;
    id v11 = [location[0] protectionSpace];
    OSStatus v12 = SecTrustEvaluate((SecTrustRef)[v11 serverTrust], &result);

    OSStatus v28 = v12;
    if (!v12 && (result == kSecTrustResultProceed || result == kSecTrustResultUnspecified))
    {
      id v13 = [location[0] protectionSpace];
      id v14 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v13 serverTrust]);
      id v15 = v37;
      id v37 = v14;

      os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v27;
        os_log_type_t v17 = v26;
        sub_10004B24C(v25);
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Accepting server trust!", v25, 2u);
      }
      objc_storeStrong((id *)&v27, 0);
      uint64_t v38 = 0;
    }
    else
    {
      os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        sub_10005A060(v42, v28);
        _os_log_error_impl((void *)&_mh_execute_header, v24, v23, "Could not evaluate trust! Error Code:  %d", v42, 8u);
      }
      objc_storeStrong((id *)&v24, 0);
      uint64_t v38 = 3;
    }
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  else
  {
    os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
    char v21 = 16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      os_log_t v18 = v22;
      os_log_type_t v19 = v21;
      sub_10004B24C(v20);
      _os_log_error_impl((void *)&_mh_execute_header, v18, v19, "Received an Authentication method other than Server Trust!!", (uint8_t *)v20, 2u);
    }
    objc_storeStrong((id *)&v22, 0);
    uint64_t v38 = 3;
  }
  if (v39) {
    (*((void (**)(id, uint64_t, id))v39 + 2))(v39, v38, v37);
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSArray)anchorCerts
{
  return self->_anchorCerts;
}

- (void)setAnchorCerts:(id)a3
{
}

- (NSData)machineInfo
{
  return self->_machineInfo;
}

- (void)setMachineInfo:(id)a3
{
}

- (BuddyCloudConfigWebAuthDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyCloudConfigWebAuthDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)downloadDestination
{
  return self->_downloadDestination;
}

- (void)setDownloadDestination:(id)a3
{
}

- (NSData)downloadedResponseData
{
  return self->_downloadedResponseData;
}

- (void)setDownloadedResponseData:(id)a3
{
}

- (BOOL)willDownloadError
{
  return self->_willDownloadError;
}

- (void)setWillDownloadError:(BOOL)a3
{
  self->_willDownloadError = a3;
}

- (void).cxx_destruct
{
}

@end
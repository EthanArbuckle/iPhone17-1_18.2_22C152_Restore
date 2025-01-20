@interface DMCTestWebViewController
- (DMCCloudConfigWebAuthDelegate)delegate;
- (NSArray)anchorCerts;
- (NSData)downloadedProfileData;
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
- (void)setDownloadedProfileData:(id)a3;
- (void)setMachineInfo:(id)a3;
- (void)setWebURL:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation DMCTestWebViewController

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)DMCTestWebViewController;
  [(DMCTestWebViewController *)&v23 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped];
  v4 = [(DMCTestWebViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  v5 = [MEMORY[0x263F086E0] mainBundle];
  v6 = [v5 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_26D435FC0 table:@"Localizable"];
  [(DMCTestWebViewController *)self setTitle:v6];

  v7 = objc_opt_new();
  v8 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
  [v7 setWebsiteDataStore:v8];

  v9 = [v7 preferences];
  [v9 _setDiagnosticLoggingEnabled:1];

  id v10 = objc_alloc(MEMORY[0x263F1FA58]);
  v11 = objc_msgSend(v10, "initWithFrame:configuration:", v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DMCTestWebViewController *)self setView:v11];
  [(DMCTestWebViewController *)self setWebView:v11];
  v12 = [(DMCTestWebViewController *)self webView];
  [v12 setUIDelegate:self];

  v13 = [(DMCTestWebViewController *)self webView];
  [v13 setNavigationDelegate:self];

  v14 = [(DMCTestWebViewController *)self webView];
  v15 = [v14 configuration];
  v16 = [v15 processPool];
  [v16 _setDownloadDelegate:self];

  id v17 = objc_alloc(MEMORY[0x263F089E0]);
  v18 = [(DMCTestWebViewController *)self webURL];
  v19 = (void *)[v17 initWithURL:v18];

  v20 = [(DMCTestWebViewController *)self _getEncodedMachineInfo];
  [v19 setValue:v20 forHTTPHeaderField:@"x-apple-aspen-deviceinfo"];

  v21 = [(DMCTestWebViewController *)self webView];
  id v22 = (id)[v21 loadRequest:v19];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  v7 = [v6 domain];
  if (![v7 isEqualToString:*MEMORY[0x263F86258]])
  {

LABEL_6:
    id v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:@"REMOTE_MANAGEMENT_FAILED_TO_LOAD_PAGE" value:&stru_26D435FC0 table:@"Localizable"];

    v12 = [v6 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F08570]])
    {
      uint64_t v13 = [v6 code];

      if (v13 == -1003)
      {
        v14 = [v6 userInfo];
        v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F08578]];

        v16 = [v15 host];
        id v17 = NSString;
        v18 = [MEMORY[0x263F086E0] mainBundle];
        v19 = [v18 localizedStringForKey:@"REMOTE_MANAGEMENT_UNABLE_TO_RESOLVE_HOST" value:&stru_26D435FC0 table:@"Localizable"];
        v20 = objc_msgSend(v17, "localizedStringWithFormat:", v19, v16);

        [(DMCTestWebViewController *)self _showFailureAlertWithTitle:v11 andMessage:v20];
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
    }
    v15 = [v6 description];
    [(DMCTestWebViewController *)self _showFailureAlertWithTitle:v11 andMessage:v15];
    goto LABEL_11;
  }
  uint64_t v8 = [v6 code];

  if (v8 != 102) {
    goto LABEL_6;
  }
  v9 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "Suppressing web navigation error caused by policy change", buf, 2u);
  }
LABEL_12:
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  v7 = (void (**)(id, void))a5;
  uint64_t v8 = [a4 response];
  v9 = [v8 MIMEType];
  int v10 = [v9 isEqualToString:@"application/x-apple-aspen-config"];

  if (v10)
  {
    v11 = [(DMCTestWebViewController *)self webURL];
    v12 = [v11 host];

    uint64_t v13 = [v8 URL];
    v14 = [v13 host];

    if ([v12 caseInsensitiveCompare:v14])
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v15, OS_LOG_TYPE_ERROR, "domain of download does not match domain of initial URL from cloud config!", buf, 2u);
      }
      v7[2](v7, 0);
    }
    else
    {
      v7[2](v7, 2);
    }
  }
  else if ([v8 statusCode] == 404)
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_221CC5000, v16, OS_LOG_TYPE_ERROR, "recieved 404 response from website!", v19, 2u);
    }
    v7[2](v7, 0);
  }
  else
  {
    v7[2](v7, 1);
    id v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_221CC5000, v17, OS_LOG_TYPE_ERROR, "did not recieve download response!", v18, 2u);
    }
  }
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "webview didReceiveAuthenticationChallenge", v10, 2u);
  }
  [(DMCTestWebViewController *)self evaluateAuthenticationChallenge:v8 withCompletionHandler:v7];
}

- (void)_downloadDidStart:(id)a3
{
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_221CC5000, v3, OS_LOG_TYPE_DEFAULT, "download did Start!", v4, 2u);
  }
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id v6 = NSString;
  id v7 = (void (**)(id, uint64_t, id))a5;
  id v8 = [v6 stringWithFormat:@"/tmp/%@", a4];
  v7[2](v7, 1, v8);
}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_ERROR, "download failed with error from WKDownload!: %@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-2 userInfo:0];
  id v8 = [(DMCTestWebViewController *)self delegate];
  [v8 webAuthCanceled:v7];
}

- (void)_downloadDidCancel:(id)a3
{
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_ERROR, "download canceled! ", v7, 2u);
  }
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-3 userInfo:0];
  id v6 = [(DMCTestWebViewController *)self delegate];
  [v6 webAuthCanceled:v5];
}

- (void)_download:(id)a3 didCreateDestination:(id)a4
{
  id v5 = a4;
  id v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_DEFAULT, "download did create destination", v7, 2u);
  }
  [(DMCTestWebViewController *)self setDownloadDestination:v5];
}

- (void)_downloadDidFinish:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF8F8];
  id v5 = [(DMCTestWebViewController *)self downloadDestination];
  id v6 = [v4 dataWithContentsOfFile:v5];
  [(DMCTestWebViewController *)self setDownloadedProfileData:v6];

  id v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSString;
    int v9 = v7;
    id v10 = [(DMCTestWebViewController *)self downloadedProfileData];
    uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", @"%lu", objc_msgSend(v10, "length"));
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "we downloaded a profile with data length of %@!", buf, 0xCu);
  }
  v12 = [(DMCTestWebViewController *)self webView];
  [v12 stopLoading];

  uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
  v14 = [(DMCTestWebViewController *)self downloadDestination];
  [v13 removeItemAtPath:v14 error:0];

  v15 = [(DMCTestWebViewController *)self delegate];
  v16 = [(DMCTestWebViewController *)self downloadedProfileData];
  [v15 recievedProfile:v16];
}

- (void)_downloadProcessDidCrash:(id)a3
{
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_ERROR, "the download process crashed!", v7, 2u);
  }
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-4 userInfo:0];
  id v6 = [(DMCTestWebViewController *)self delegate];
  [v6 webAuthCanceled:v5];
}

- (void)_download:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  int v9 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_DEFAULT, "wkdownload didReceiveAuthenticationChallenge", v10, 2u);
  }
  [(DMCTestWebViewController *)self evaluateAuthenticationChallenge:v8 withCompletionHandler:v7];
}

- (id)_getEncodedMachineInfo
{
  v2 = [(DMCTestWebViewController *)self machineInfo];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

- (void)cancelButtonTapped
{
  v3 = [(DMCTestWebViewController *)self delegate];

  if (v3)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-1 userInfo:0];
    v4 = [(DMCTestWebViewController *)self delegate];
    [v4 webAuthCanceled:v6];
  }
  else
  {
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_ERROR, "no delegate defined for buddy web auth!", buf, 2u);
    }
  }
}

- (void)_showFailureAlertWithTitle:(id)a3 andMessage:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_221CC5000, v8, OS_LOG_TYPE_DEFAULT, "Showing failure alert title: %@, message: %@", buf, 0x16u);
  }
  int v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  id v10 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
  v12 = [v11 localizedStringForKey:@"OK" value:&stru_26D435FC0 table:@"Localizable"];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__DMCTestWebViewController__showFailureAlertWithTitle_andMessage___block_invoke;
  v14[3] = &unk_2645E9AF8;
  v14[4] = self;
  uint64_t v13 = [v10 actionWithTitle:v12 style:1 handler:v14];
  [v9 addAction:v13];

  [(DMCTestWebViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __66__DMCTestWebViewController__showFailureAlertWithTitle_andMessage___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"BYCloudConfigRetreiveProfileFromWebErrorDomain" code:-5 userInfo:0];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 webAuthCanceled:v3];
}

- (void)evaluateAuthenticationChallenge:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  id v8 = [v6 protectionSpace];
  int v9 = [v8 authenticationMethod];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F08560]];

  if (v10)
  {
    uint64_t v11 = [v6 protectionSpace];
    v12 = [v11 host];
    uint64_t v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      anchorCerts = self->_anchorCerts;
      v15 = v13;
      *(_DWORD *)buf = 138412546;
      v30 = v12;
      __int16 v31 = 2048;
      uint64_t v32 = [(NSArray *)anchorCerts count];
      _os_log_impl(&dword_221CC5000, v15, OS_LOG_TYPE_DEFAULT, "evaluating trust for %@ using %lu anchor certs", buf, 0x16u);
    }
    if (self->_anchorCerts)
    {
      id v16 = [v6 protectionSpace];
      OSStatus v17 = SecTrustSetAnchorCertificates((SecTrustRef)[v16 serverTrust], (CFArrayRef)self->_anchorCerts);

      if (v17)
      {
        id v18 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = v17;
          _os_log_impl(&dword_221CC5000, v18, OS_LOG_TYPE_ERROR, "Failed to set Anchor Certs on trust! With secError code: %d", buf, 8u);
        }
      }
    }
    int v28 = 0;
    uint64_t v19 = [v6 protectionSpace];
    int v20 = MEMORY[0x223C8FF30]([v19 serverTrust], &v28);

    if (!v20 && (v28 == 4 || v28 == 1))
    {
      v25 = (void *)MEMORY[0x263F08BB8];
      v26 = [v6 protectionSpace];
      id v22 = objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v26, "serverTrust"));

      v27 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221CC5000, v27, OS_LOG_TYPE_DEFAULT, "Accepting server trust!", buf, 2u);
      }
      uint64_t v23 = 0;
    }
    else
    {
      v21 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v20;
        _os_log_impl(&dword_221CC5000, v21, OS_LOG_TYPE_ERROR, "Could not evaluate trust! Error Code:  %d", buf, 8u);
      }
      id v22 = 0;
      uint64_t v23 = 3;
    }

    if (v7) {
LABEL_22:
    }
      v7[2](v7, v23, v22);
  }
  else
  {
    v24 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221CC5000, v24, OS_LOG_TYPE_ERROR, "Received an Authentication method other than Server Trust!!", buf, 2u);
    }
    id v22 = 0;
    uint64_t v23 = 3;
    if (v7) {
      goto LABEL_22;
    }
  }
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

- (DMCCloudConfigWebAuthDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCCloudConfigWebAuthDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)downloadDestination
{
  return (NSString *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setDownloadDestination:(id)a3
{
}

- (NSData)downloadedProfileData
{
  return (NSData *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setDownloadedProfileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedProfileData, 0);
  objc_storeStrong((id *)&self->_downloadDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_machineInfo, 0);
  objc_storeStrong((id *)&self->_anchorCerts, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
}

@end
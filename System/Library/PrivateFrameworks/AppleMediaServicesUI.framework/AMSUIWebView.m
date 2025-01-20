@interface AMSUIWebView
+ (id)_getSetCookiesForResponse:(id)a3;
- (AMSBinaryPromise)contentRulesPromise;
- (AMSBinaryPromise)currentLoadPromise;
- (AMSUIWebClientContext)context;
- (AMSUIWebView)initWithContext:(id)a3 additionalScripts:(id)a4;
- (BOOL)contentLoaded;
- (NSArray)baseScripts;
- (WKWebView)underlyingWebView;
- (double)bottomInset;
- (double)topInset;
- (id)_jsonLogStringWithDictionary:(id)a3;
- (id)_parseRequestError:(id)a3 logKey:(id)a4;
- (id)_prepareWithURL:(id)a3 loadBlock:(id)a4;
- (id)_setupContentRulesForWebView:(id)a3 context:(id)a4;
- (id)loadRequest:(id)a3;
- (id)loadRequest:(id)a3 response:(id)a4 responseData:(id)a5;
- (id)sendJSRequest:(id)a3;
- (void)_addScriptsToContentController:(id)a3 additionalScripts:(id)a4;
- (void)_finishedLoading;
- (void)_openURL:(id)a3 completionHandler:(id)a4;
- (void)_receiveJSObject:(id)a3 logKey:(id)a4 replyHandler:(id)a5;
- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6;
- (void)_webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5 userInfo:(id)a6;
- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6;
- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)dealloc;
- (void)setBaseScripts:(id)a3;
- (void)setContentRulesPromise:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentLoadPromise:(id)a3;
- (void)takeSnapshotWithCompletion:(id)a3;
- (void)updateUserScriptsWithScripts:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation AMSUIWebView

- (AMSUIWebView)initWithContext:(id)a3 additionalScripts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)AMSUIWebView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[AMSUICommonView initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_context, v6);
    id v14 = objc_alloc_init(MEMORY[0x263F1FA60]);
    [v14 _setWaitsForPaintAfterViewDidMoveToWindow:0];
    v15 = [v14 preferences];
    [v15 _setPunchOutWhiteBackgroundsInDarkMode:1];

    v16 = [v14 preferences];
    [v16 setJavaScriptCanOpenWindowsAutomatically:0];

    [v14 _setDrawsBackground:0];
    [v14 _setPrintsBackgrounds:0];
    [v14 _setApplePayEnabled:1];
    [v14 setMediaTypesRequiringUserActionForPlayback:MEMORY[0x263EFFA68]];
    [v14 setAllowsInlineMediaPlayback:1];
    v17 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
    [v14 setWebsiteDataStore:v17];

    id v18 = objc_alloc_init(MEMORY[0x263F1FA38]);
    v19 = [[AMSUIWebDelegateProxy alloc] initWithDelegate:v13];
    v20 = [MEMORY[0x263F1FA10] pageWorld];
    [v18 addScriptMessageHandlerWithReply:v19 contentWorld:v20 name:@"callback"];

    [(AMSUIWebView *)v13 _addScriptsToContentController:v18 additionalScripts:v7];
    [v14 setUserContentController:v18];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA58]), "initWithFrame:configuration:", v14, v8, v9, v10, v11);
    underlyingWebView = v13->_underlyingWebView;
    v13->_underlyingWebView = (WKWebView *)v21;

    [(WKWebView *)v13->_underlyingWebView setAllowsBackForwardNavigationGestures:0];
    [(WKWebView *)v13->_underlyingWebView setUIDelegate:v13];
    [(WKWebView *)v13->_underlyingWebView setAccessibilityIdentifier:@"AMS.WebPage"];
    [(WKWebView *)v13->_underlyingWebView setNavigationDelegate:v13];
    v23 = (void *)MEMORY[0x263F27F08];
    v24 = [v6 clientInfo];
    v25 = [v23 userAgentForProcessInfo:v24];
    [(WKWebView *)v13->_underlyingWebView setCustomUserAgent:v25];

    v26 = [MEMORY[0x263F825C8] clearColor];
    [(WKWebView *)v13->_underlyingWebView ams_setBackgroundColor:v26];

    [(WKWebView *)v13->_underlyingWebView setOpaque:0];
    v27 = [MEMORY[0x263F825C8] clearColor];
    v28 = [(WKWebView *)v13->_underlyingWebView scrollView];
    [v28 setBackgroundColor:v27];

    [(WKWebView *)v13->_underlyingWebView _setAllowsRemoteInspection:os_variant_has_internal_content()];
    [(AMSUIWebView *)v13 addSubview:v13->_underlyingWebView];
    [(WKWebView *)v13->_underlyingWebView setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [(AMSUIWebView *)v13 bottomAnchor];
    v30 = [(WKWebView *)v13->_underlyingWebView bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(AMSUIWebView *)v13 leadingAnchor];
    v33 = [(WKWebView *)v13->_underlyingWebView leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(WKWebView *)v13->_underlyingWebView topAnchor];
    v36 = [(AMSUIWebView *)v13 topAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];

    [v37 setActive:1];
    v38 = [(AMSUIWebView *)v13 trailingAnchor];
    v39 = [(WKWebView *)v13->_underlyingWebView trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v40 setActive:1];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [(AMSUIWebView *)self underlyingWebView];
  [v3 stopLoading];

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebView;
  [(AMSUIWebView *)&v4 dealloc];
}

- (double)bottomInset
{
  v2 = [(AMSUIWebView *)self underlyingWebView];
  v3 = [v2 scrollView];
  [v3 contentInset];
  double v5 = v4;

  return v5;
}

- (double)topInset
{
  return 0.0;
}

- (id)loadRequest:(id)a3 response:(id)a4 responseData:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v11)
  {
    double v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    id v14 = v13;
    v15 = [(AMSUIWebView *)self context];
    v16 = [v15 logKey];
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    __int16 v29 = 2114;
    v30 = v16;
    __int16 v31 = 2048;
    uint64_t v32 = [v10 length];
    _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading HTML into WebView (length: %ld)", buf, 0x20u);
  }
  v17 = [v9 URL];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __50__AMSUIWebView_loadRequest_response_responseData___block_invoke;
  v23[3] = &unk_2643E38F0;
  v23[4] = self;
  id v24 = v9;
  id v25 = v8;
  id v26 = v10;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  uint64_t v21 = [(AMSUIWebView *)self _prepareWithURL:v17 loadBlock:v23];

  return v21;
}

void __50__AMSUIWebView_loadRequest_response_responseData___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() _getSetCookiesForResponse:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 32) underlyingWebView];
        id v9 = [v8 configuration];
        id v10 = [v9 websiteDataStore];
        double v11 = [v10 httpCookieStore];
        [v11 setCookie:v7 completionHandler:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  v12 = [*(id *)(a1 + 32) underlyingWebView];
  id v13 = (id)[v12 loadSimulatedRequest:*(void *)(a1 + 48) response:*(void *)(a1 + 40) responseData:*(void *)(a1 + 56)];
}

- (id)loadRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(AMSUIWebView *)self context];
    id v10 = [v9 logKey];
    double v11 = [v4 URL];
    v12 = AMSLogableURL();
    *(_DWORD *)buf = 138543874;
    id v20 = v7;
    __int16 v21 = 2114;
    v22 = v10;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading request into WebView: %{public}@", buf, 0x20u);
  }
  id v13 = [v4 URL];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __28__AMSUIWebView_loadRequest___block_invoke;
  v17[3] = &unk_2643E34D0;
  v17[4] = self;
  id v18 = v4;
  id v14 = v4;
  long long v15 = [(AMSUIWebView *)self _prepareWithURL:v13 loadBlock:v17];

  return v15;
}

void __28__AMSUIWebView_loadRequest___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) underlyingWebView];
  id v2 = (id)[v3 loadRequest:*(void *)(a1 + 40)];
}

- (id)sendJSRequest:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v6 = [MEMORY[0x263EFF910] now];
  uint64_t v7 = [v4 options];
  if (v7
    && (id v8 = (void *)v7,
        id v9 = (void *)MEMORY[0x263F08900],
        [v4 options],
        id v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = [v9 isValidJSONObject:v10],
        v10,
        v8,
        v9))
  {
    double v11 = (void *)MEMORY[0x263F08900];
    v12 = [v4 options];
    id v43 = 0;
    id v13 = [v11 dataWithJSONObject:v12 options:0 error:&v43];
    id v14 = v43;

    if (!v13 || v14)
    {
      long long v16 = self;
      long long v17 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v17)
      {
        long long v17 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        [v4 logKey];
        id v20 = v36 = v5;
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v19;
        __int16 v46 = 2114;
        v47 = v20;
        __int16 v48 = 2114;
        id v49 = v14;
        _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error encoding service options. %{public}@", buf, 0x20u);

        id v5 = v36;
      }

      long long v15 = 0;
      self = v16;
    }
    else
    {
      long long v15 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
    }
  }
  else
  {
    long long v15 = 0;
  }
  __int16 v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v21)
  {
    __int16 v21 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v6;
    id v23 = v5;
    id v24 = self;
    uint64_t v25 = objc_opt_class();
    id v26 = [v4 logKey];
    v27 = [v4 service];
    v28 = v15;
    if (!v15)
    {
      v28 = [v4 options];
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v45 = v25;
    __int16 v46 = 2114;
    v47 = v26;
    __int16 v48 = 2114;
    id v49 = v27;
    __int16 v50 = 2112;
    v51 = v28;
    _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling service: %{public}@ %@", buf, 0x2Au);
    if (!v15) {

    }
    id v5 = v23;
    self = v24;
    uint64_t v6 = v37;
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__AMSUIWebView_sendJSRequest___block_invoke;
  block[3] = &unk_2643E3DA8;
  block[4] = self;
  id v39 = v4;
  id v40 = v15;
  id v41 = v6;
  id v29 = v5;
  id v42 = v29;
  id v30 = v6;
  id v31 = v15;
  id v32 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v33 = v42;
  id v34 = v29;

  return v34;
}

void __30__AMSUIWebView_sendJSRequest___block_invoke(uint64_t a1)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) underlyingWebView];
  v16[0] = @"name";
  uint64_t v3 = [*(id *)(a1 + 40) service];
  id v4 = (void *)v3;
  v16[1] = @"data";
  id v5 = *(__CFString **)(a1 + 48);
  if (!v5) {
    id v5 = &stru_26CC491D8;
  }
  v17[0] = v3;
  v17[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v7 = [MEMORY[0x263F1FA10] pageWorld];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__AMSUIWebView_sendJSRequest___block_invoke_2;
  v11[3] = &unk_2643E57D0;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v10;
  id v15 = *(id *)(a1 + 64);
  objc_msgSend(v2, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", @"return AMS.callService(name, data);",
    v6,
    0,
    v7,
    v11);
}

void __30__AMSUIWebView_sendJSRequest___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [a1[4] timeIntervalSinceNow];
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = -v7;
  }
  if (v6)
  {
    id v9 = a1[5];
    id v10 = [a1[6] logKey];
    id v11 = [v9 _parseRequestError:v6 logKey:v10];

    id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = [a1[6] logKey];
      float v16 = v8;
      *(_DWORD *)buf = 138544130;
      uint64_t v40 = v14;
      __int16 v41 = 2114;
      id v42 = v15;
      __int16 v43 = 2048;
      double v44 = v16;
      __int16 v45 = 2114;
      id v46 = v11;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Service call failed [%f] %{public}@", buf, 0x2Au);
    }
    id v17 = a1[7];
LABEL_10:
    [v17 finishWithError:v11];
    goto LABEL_35;
  }
  uint64_t v18 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  uint64_t v19 = (void *)v18;
  if (!v5)
  {
    if (!v18)
    {
      uint64_t v19 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v27 = [v19 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = objc_opt_class();
      id v29 = [a1[6] logKey];
      float v30 = v8;
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v28;
      __int16 v41 = 2114;
      id v42 = v29;
      __int16 v43 = 2048;
      double v44 = v30;
      _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Service call finished [%f] (no result)", buf, 0x20u);
    }
    id v31 = a1[7];
    AMSError();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v31;
    goto LABEL_10;
  }
  if (!v18)
  {
    uint64_t v19 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    v22 = [a1[6] logKey];
    float v23 = v8;
    double v24 = v23;
    uint64_t v25 = [a1[5] _jsonLogStringWithDictionary:v5];
    *(_DWORD *)buf = 138544130;
    uint64_t v40 = v21;
    __int16 v41 = 2114;
    id v42 = v22;
    __int16 v43 = 2048;
    double v44 = v24;
    __int16 v45 = 2112;
    id v46 = v25;
    _os_log_impl(&dword_21C134000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Service call succeeded [%f] %@", buf, 0x2Au);
  }
  id v26 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v26;
  }
  else {
    id v11 = 0;
  }

  if (!v11)
  {
    id v32 = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }

    id v34 = [v33 dataUsingEncoding:4];

    if (v34)
    {
      id v38 = 0;
      v35 = [MEMORY[0x263F08900] JSONObjectWithData:v34 options:0 error:&v38];
      id v36 = v38;
      objc_opt_class();
      id v11 = 0;
      if (objc_opt_isKindOfClass()) {
        id v11 = v35;
      }
    }
    else
    {
      id v36 = 0;
      id v11 = 0;
    }
  }
  v37 = [[AMSUIWebJSResponse alloc] initWithRequest:a1[6] duration:v8];
  [(AMSUIWebJSResponse *)v37 setBody:v11];
  [a1[7] finishWithResult:v37];

LABEL_35:
}

- (void)takeSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebView *)self underlyingWebView];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AMSUIWebView_takeSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_2643E57F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 takeSnapshotWithConfiguration:0 completionHandler:v7];
}

void __43__AMSUIWebView_takeSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  image = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = (void *)MEMORY[0x21D4A4900]();
    double v7 = (void *)MEMORY[0x263F827E8];
    id v8 = UIImageJPEGRepresentation(image, 0.9);
    id v9 = [*(id *)(a1 + 32) traitCollection];
    [v9 displayScale];
    id v10 = objc_msgSend(v7, "imageWithData:scale:", v8);

    id v11 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateUserScriptsWithScripts:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__AMSUIWebView_updateUserScriptsWithScripts___block_invoke;
  v6[3] = &unk_2643E34D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __45__AMSUIWebView_updateUserScriptsWithScripts___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingWebView];
  uint64_t v3 = [v2 configuration];
  id v4 = [v3 userContentController];

  [*(id *)(a1 + 32) _addScriptsToContentController:v4 additionalScripts:*(void *)(a1 + 40)];
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  id v6 = (void (**)(id, void, void *))a5;
  if (os_variant_has_internal_content()
    && (([MEMORY[0x263F27BE0] QAMode] & 1) != 0
     || [MEMORY[0x263F27BE0] ignoreServerTrustEvaluation]))
  {
    id v7 = (void *)MEMORY[0x263F08BB8];
    id v8 = [v10 protectionSpace];
    id v9 = objc_msgSend(v7, "credentialForTrust:", objc_msgSend(v8, "serverTrust"));
    v6[2](v6, 0, v9);
  }
  else
  {
    v6[2](v6, 1, 0);
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AMSUIWebView *)self context];
  id v10 = [v9 logKey];
  id v11 = AMSUIWebSetSubLogKey(v10, 0);

  id v12 = [v7 body];
  objc_opt_class();
  id v13 = 0;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }

  uint64_t v14 = (void *)MEMORY[0x263EFFA78];
  if (v13) {
    uint64_t v14 = v13;
  }
  id v15 = v14;

  float v16 = [v15 objectForKeyedSubscript:@"command"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if ([v17 isEqualToString:@"pageDataServiceRegistered"])
  {
    uint64_t v18 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v18)
    {
      uint64_t v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = objc_opt_class();
      __int16 v39 = 2114;
      uint64_t v40 = v11;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] PageData service registered", buf, 0x16u);
    }

    [(AMSUIWebView *)self _finishedLoading];
  }
  else if ([v17 isEqualToString:@"run"])
  {
    id v20 = [v15 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    id v33 = v21;
    uint64_t v22 = [v21 dataUsingEncoding:4];
    id v32 = (void *)v22;
    if (v22)
    {
      id v36 = 0;
      float v23 = [MEMORY[0x263F08900] JSONObjectWithData:v22 options:0 error:&v36];
      id v24 = v36;
      objc_opt_class();
      id v25 = 0;
      if (objc_opt_isKindOfClass()) {
        id v25 = v23;
      }
    }
    else
    {
      id v25 = 0;
      id v24 = 0;
    }
    if (![v25 count] || v24)
    {
      id v26 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", v24, v32);
      if (!v26)
      {
        id v26 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v29 = [v7 body];
        *(_DWORD *)buf = 138544130;
        uint64_t v38 = v28;
        __int16 v39 = 2114;
        uint64_t v40 = v11;
        __int16 v41 = 2112;
        uint64_t v42 = v29;
        float v30 = (void *)v29;
        __int16 v43 = 2114;
        double v44 = v31;
        _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode action. %@ %{public}@", buf, 0x2Au);
      }
      id v24 = v31;
    }
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __75__AMSUIWebView_userContentController_didReceiveScriptMessage_replyHandler___block_invoke;
    v34[3] = &unk_2643E5820;
    v34[4] = self;
    id v35 = v8;
    [(AMSUIWebView *)self _receiveJSObject:v25 logKey:v11 replyHandler:v34];
  }
  else
  {
    (*((void (**)(id, void, __CFString *))v8 + 2))(v8, 0, @"AMS INTERNAL ERROR: Invalid Command");
  }
}

void __75__AMSUIWebView_userContentController_didReceiveScriptMessage_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    if ([MEMORY[0x263F08900] isValidJSONObject:v5])
    {
      uint64_t v11 = 0;
      id v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:&v11];
      if (v6) {
        id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    if (v7) {
      id v10 = v7;
    }
    else {
      id v10 = v5;
    }
    (*(void (**)(void, id, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, 0);
  }
  else
  {
    id v8 = AMSUIWebJSError(a3);
    id v9 = [*(id *)(a1 + 32) _jsonLogStringWithDictionary:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [a4 request];
  id v9 = [v8 URL];

  id v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v10)
  {
    id v10 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    id v13 = [(AMSUIWebView *)self context];
    uint64_t v14 = [v13 logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    float v23 = v14;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deciding navigation policy for: %{public}@", buf, 0x20u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__AMSUIWebView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  void v17[3] = &unk_2643E5848;
  v17[4] = self;
  id v18 = v9;
  id v19 = v7;
  id v15 = v7;
  id v16 = v9;
  [(AMSUIWebView *)self _openURL:v16 completionHandler:v17];
}

void __72__AMSUIWebView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [*(id *)(a1 + 32) context];
      uint64_t v11 = [v10 logKey];
      uint64_t v12 = *(void *)(a1 + 40);
      int v24 = 138543874;
      uint64_t v25 = v9;
      __int16 v26 = 2114;
      v27 = v11;
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opened: %{public}@", (uint8_t *)&v24, 0x20u);
    }
  }
  else
  {
    if (v5)
    {
      id v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v13)
      {
        id v13 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        id v16 = [*(id *)(a1 + 32) context];
        id v17 = [v16 logKey];
        uint64_t v18 = *(void *)(a1 + 40);
        id v19 = AMSLogableError();
        int v24 = 138544130;
        uint64_t v25 = v15;
        __int16 v26 = 2114;
        v27 = v17;
        __int16 v28 = 2114;
        uint64_t v29 = v18;
        __int16 v30 = 2114;
        id v31 = v19;
        _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open: %{public}@, error: %{public}@", (uint8_t *)&v24, 0x2Au);
      }
    }
    id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = [*(id *)(a1 + 32) context];
      __int16 v22 = [v21 logKey];
      uint64_t v23 = *(void *)(a1 + 40);
      int v24 = 138543874;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      v27 = v22;
      __int16 v28 = 2114;
      uint64_t v29 = v23;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Redirecting to: %{public}@", (uint8_t *)&v24, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4);
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [(AMSUIWebView *)self context];
    uint64_t v9 = [v8 logKey];
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did commit navigation", (uint8_t *)&v13, 0x16u);
  }
  id v10 = [(AMSUIWebView *)self context];
  uint64_t v11 = [v10 dataProvider];
  id v12 = (id)[v11 syncProperties];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4);
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [(AMSUIWebView *)self context];
    uint64_t v9 = [v8 logKey];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    int v13 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did finish navigation", (uint8_t *)&v10, 0x16u);
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4);
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [(AMSUIWebView *)self context];
    uint64_t v9 = [v8 logKey];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    int v13 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did start provisional navigation", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4, a5);
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(AMSUIWebView *)self context];
    int v10 = [v9 logKey];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did finish same page nav", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3, a4);
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [(AMSUIWebView *)self context];
    uint64_t v9 = [v8 logKey];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did finish doc load", (uint8_t *)&v10, 0x16u);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  int v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    __int16 v12 = [(AMSUIWebView *)self context];
    __int16 v13 = [v12 logKey];
    uint64_t v14 = [v7 _request];
    uint64_t v15 = [v14 URL];
    int v17 = 138544130;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    __int16 v22 = v15;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Did fail provisional navigation: %@. %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  id v16 = [(AMSUIWebView *)self currentLoadPromise];
  [v16 finishWithError:v8];
}

- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a6;
  int v10 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = objc_opt_class();
    __int16 v13 = [(AMSUIWebView *)self context];
    uint64_t v14 = [v13 logKey];
    int v15 = 138544130;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load in frame: %{public}@ error: %{public}@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)_webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5 userInfo:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [MEMORY[0x263F27CB8] sharedConfig];
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(AMSUIWebView *)self context];
    uint64_t v12 = [v11 logKey];
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to navigation. %{public}@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a6;
  if ([a5 blockedLoad])
  {
    id v9 = [MEMORY[0x263F27CB8] sharedConfig];
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = [(AMSUIWebView *)self context];
      int v13 = [v12 logKey];
      int v14 = 138543874;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load UNTRUSTED resource: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_addScriptsToContentController:(id)a3 additionalScripts:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = [(AMSUIWebView *)self baseScripts];

  if (!v8)
  {
    id v39 = v7;
    id v41 = v6;
    id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v9 = [&unk_26CC73C08 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v59;
      unint64_t v12 = 0x263F08000uLL;
      uint64_t v43 = *(void *)v59;
      double v44 = self;
      do
      {
        uint64_t v13 = 0;
        uint64_t v45 = v10;
        do
        {
          if (*(void *)v59 != v11) {
            objc_enumerationMutation(&unk_26CC73C08);
          }
          uint64_t v14 = *(void *)(*((void *)&v58 + 1) + 8 * v13);
          uint64_t v15 = (void *)MEMORY[0x21D4A4900]();
          __int16 v16 = [*(id *)(v12 + 1760) bundleForClass:objc_opt_class()];
          __int16 v17 = [v16 URLForResource:v14 withExtension:@"js"];

          id v57 = 0;
          uint64_t v18 = [NSString stringWithContentsOfURL:v17 encoding:4 error:&v57];
          id v19 = v57;
          if (v19)
          {
            uint64_t v47 = (void *)v18;
            __int16 v48 = v15;
            uint64_t v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
            if (!v20)
            {
              uint64_t v20 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            __int16 v21 = objc_msgSend(v20, "OSLogObject", v39, v41);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              unint64_t v22 = v12;
              uint64_t v23 = objc_opt_class();
              id v24 = [(AMSUIWebView *)self context];
              uint64_t v25 = [v24 logKey];
              *(_DWORD *)buf = 138544130;
              uint64_t v65 = v23;
              unint64_t v12 = v22;
              uint64_t v10 = v45;
              __int16 v66 = 2114;
              v67 = v25;
              __int16 v68 = 2114;
              uint64_t v69 = v14;
              __int16 v70 = 2114;
              id v71 = v19;
              _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load resource: %{public}@. %{public}@", buf, 0x2Au);

              uint64_t v11 = v43;
              self = v44;
            }

            __int16 v26 = v47;
            uint64_t v15 = v48;
          }
          else
          {
            __int16 v26 = (void *)v18;
            uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v18 injectionTime:0 forMainFrameOnly:1];
            [v46 addObject:v20];
          }

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [&unk_26CC73C08 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v10);
    }
    v27 = objc_msgSend(v46, "copy", v39, v41);
    [(AMSUIWebView *)self setBaseScripts:v27];

    id v7 = v40;
    id v6 = v42;
  }
  [v6 removeAllUserScripts];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  __int16 v28 = [(AMSUIWebView *)self baseScripts];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v28);
        }
        [v6 addUserScript:*(void *)(*((void *)&v53 + 1) + 8 * i)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v30);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v33 = v7;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:*(void *)(*((void *)&v49 + 1) + 8 * j) injectionTime:0 forMainFrameOnly:1];
        [v6 addUserScript:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v35);
  }
}

- (void)_finishedLoading
{
  self->_contentLoaded = 1;
  uint64_t v3 = [(AMSUIWebView *)self currentLoadPromise];
  [v3 finishWithSuccess];

  [(AMSUIWebView *)self setCurrentLoadPromise:0];
}

+ (id)_getSetCookiesForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F08888];
    id v6 = [v4 allHeaderFields];
    id v7 = [v4 URL];
    id v8 = [v5 cookiesWithResponseHeaderFields:v6 forURL:v7];
    uint64_t v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v4 allHeaderFields];
    uint64_t v11 = [v10 objectForKey:*MEMORY[0x263F278B8]];

    if ([v11 length])
    {
      unint64_t v12 = [v4 allHeaderFields];
      uint64_t v13 = (void *)[v12 mutableCopy];

      [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x263F278B0]];
      uint64_t v14 = (void *)MEMORY[0x263F08888];
      uint64_t v15 = [v4 URL];
      __int16 v16 = [v14 cookiesWithResponseHeaderFields:v13 forURL:v15];
      [v9 addObjectsFromArray:v16];
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

- (id)_jsonLogStringWithDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    id v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:0 error:0];
    if (v4) {
      id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v3;
    }
    else
    {
      id v6 = [NSString stringWithFormat:@"%@", v3];
    }
    id v5 = v6;
  }

  return v5;
}

- (void)_openURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"tel", @"telprompt", 0);
  id v8 = [v5 scheme];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F01880] defaultWorkspace];
    id v16 = 0;
    int v11 = [v10 isApplicationAvailableToOpenURL:v5 error:&v16];
    id v12 = v16;

    if (v11)
    {
      uint64_t v13 = [MEMORY[0x263F82438] sharedApplication];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __43__AMSUIWebView__openURL_completionHandler___block_invoke;
      v14[3] = &unk_2643E45B8;
      id v15 = v6;
      [v13 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:v14];
    }
    else
    {
      (*((void (**)(id, void, id))v6 + 2))(v6, 0, v12);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

uint64_t __43__AMSUIWebView__openURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_parseRequestError:(id)a3 logKey:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"WKJavaScriptExceptionMessage"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  uint64_t v10 = [v9 dataUsingEncoding:4];
  if (!v10)
  {
    id v15 = 0;
    int v11 = 0;
    id v12 = 0;
    goto LABEL_15;
  }
  id v25 = 0;
  int v11 = [MEMORY[0x263F08900] JSONObjectWithData:v10 options:0 error:&v25];
  id v12 = v25;
  if (!v11)
  {
    id v15 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = [v11 objectForKeyedSubscript:@"message"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  id v16 = [v11 objectForKeyedSubscript:@"userInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v16;
  }
  else {
    id v15 = 0;
  }

  if (!v14)
  {
LABEL_15:
    if (v9)
    {
      __int16 v17 = [v5 domain];
      if ([v17 isEqualToString:*MEMORY[0x263F1FAD0]])
      {
        uint64_t v18 = [v5 code];

        if (v18 == 4)
        {
          id v19 = v9;
LABEL_21:
          id v14 = v19;
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    id v19 = [v5 description];
    goto LABEL_21;
  }
LABEL_22:
  if (v12)
  {
    uint64_t v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v20)
    {
      uint64_t v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v22;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] JS error does not contain an object: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v23 = AMSCustomError();

  return v23;
}

- (id)_prepareWithURL:(id)a3 loadBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F27B58]);
  id v9 = NSString;
  uint64_t v10 = [v6 host];
  int v11 = [v9 stringWithFormat:@"AMS %@", v10];
  id v12 = [(AMSUIWebView *)self underlyingWebView];
  [v12 _setRemoteInspectionNameOverride:v11];

  uint64_t v13 = [(AMSUIWebView *)self contentRulesPromise];

  if (!v13)
  {
    id v14 = [(AMSUIWebView *)self underlyingWebView];
    id v15 = [(AMSUIWebView *)self context];
    id v16 = [(AMSUIWebView *)self _setupContentRulesForWebView:v14 context:v15];
    [(AMSUIWebView *)self setContentRulesPromise:v16];
  }
  objc_initWeak(&location, self);
  __int16 v17 = [(AMSUIWebView *)self contentRulesPromise];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke;
  v23[3] = &unk_2643E5870;
  objc_copyWeak(&v26, &location);
  id v18 = v8;
  id v24 = v18;
  id v19 = v7;
  id v25 = v19;
  [v17 addFinishBlock:v23];

  uint64_t v20 = v25;
  id v21 = v18;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v21;
}

void __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (v4)
  {
    [a1[4] finishWithError:v4];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke_2;
    block[3] = &unk_2643E4948;
    block[4] = WeakRetained;
    id v8 = a1[4];
    id v9 = a1[5];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentLoadPromise:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_receiveJSObject:(id)a3 logKey:(id)a4 replyHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (id)AMSSetLogKey();
  id v12 = [MEMORY[0x263EFF910] now];
  uint64_t v13 = [v8 objectForKeyedSubscript:@"actionClass"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  __int16 v30 = v14;
  char v15 = [v14 isEqualToString:@"AMSLogAction"];
  if ((v15 & 1) == 0)
  {
    id v16 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v16)
    {
      id v16 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      id v19 = [(AMSUIWebView *)self _jsonLogStringWithDictionary:v8];
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v18;
      __int16 v39 = 2114;
      id v40 = v9;
      __int16 v41 = 2114;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      double v44 = v19;
      _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Receiving action: [%{public}@] %@", buf, 0x2Au);
    }
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke;
  aBlock[3] = &unk_2643E58C0;
  id v20 = v10;
  id v34 = v20;
  objc_copyWeak(&v35, (id *)buf);
  id v21 = v9;
  id v32 = v21;
  id v22 = v12;
  id v33 = v22;
  char v36 = v15;
  uint64_t v23 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v8)
  {
    id v24 = [(AMSUIWebView *)self context];
    BOOL v25 = v24 == 0;

    if (v25)
    {
      uint64_t v27 = AMSError();
      v23[2](v23, 0, v27);
    }
    else
    {
      id v26 = [(AMSUIWebView *)self context];
      uint64_t v27 = +[AMSUIWebActionMapper actionFromJSObject:v8 context:v26];

      if (v27)
      {
        __int16 v28 = [v27 runAction];
        [v28 addFinishBlock:v23];
      }
      else
      {
        __int16 v28 = AMSError();
        v23[2](v23, 0, v28);
      }
    }
    id v29 = 0;
  }
  else
  {
    id v29 = AMSError();
    v23[2](v23, 0, v29);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);
}

void __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke_2;
  block[3] = &unk_2643E5898;
  id v14 = *(id *)(a1 + 48);
  objc_copyWeak(&v15, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v6;
  char v16 = *(unsigned char *)(a1 + 64);
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v15);
}

void __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (WeakRetained)
    {
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      if (v3 >= 0.0) {
        double v4 = v3;
      }
      else {
        double v4 = -v3;
      }
      if (*(void *)(a1 + 48))
      {
        if (!*(unsigned char *)(a1 + 80))
        {
          id v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
          if (!v5)
          {
            id v5 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          id v6 = [v5 OSLogObject];
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v7 = objc_opt_class();
            uint64_t v8 = *(void *)(a1 + 32);
            float v9 = v4;
            id v10 = *(void **)(a1 + 48);
            int v23 = 138544130;
            uint64_t v24 = v7;
            __int16 v25 = 2114;
            uint64_t v26 = v8;
            __int16 v27 = 2048;
            double v28 = v9;
            __int16 v29 = 2114;
            __int16 v30 = v10;
            _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Action failed. [%f] %{public}@", (uint8_t *)&v23, 0x2Au);
          }
        }
        id v11 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      else
      {
        if (!*(unsigned char *)(a1 + 80))
        {
          char v16 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
          if (!v16)
          {
            char v16 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          __int16 v17 = [v16 OSLogObject];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = objc_opt_class();
            uint64_t v19 = *(void *)(a1 + 32);
            float v20 = v4;
            double v21 = v20;
            id v22 = [WeakRetained _jsonLogStringWithDictionary:*(void *)(a1 + 56)];
            int v23 = 138544130;
            uint64_t v24 = v18;
            __int16 v25 = 2114;
            uint64_t v26 = v19;
            __int16 v27 = 2048;
            double v28 = v21;
            __int16 v29 = 2112;
            __int16 v30 = v22;
            _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action succeeded. [%f] Result: %@", (uint8_t *)&v23, 0x2Au);
          }
        }
        id v11 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      v11();
    }
    else
    {
      id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v12)
      {
        id v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = *(void *)(a1 + 32);
        int v23 = 138543618;
        uint64_t v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Self has vanished", (uint8_t *)&v23, 0x16u);
      }
    }
  }
}

- (id)_setupContentRulesForWebView:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AMSUIWebView *)self context];
  int v9 = [v8 disableTrustedDomains];

  if (v9)
  {
    id v10 = [MEMORY[0x263F27B58] promiseWithSuccess];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F27B58]);
    id v12 = [v7 bag];
    id v13 = [v12 arrayForKey:@"trustedDomains"];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke;
    void v17[3] = &unk_2643E5910;
    v17[4] = self;
    id v14 = v11;
    id v18 = v14;
    id v19 = v6;
    [v13 valueWithCompletion:v17];
    uint64_t v15 = v19;
    id v10 = v14;
  }
  return v10;
}

void __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v62 = v10;
      __int16 v63 = 2114;
      v64 = v11;
      __int16 v65 = 2114;
      id v66 = v7;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch trusted domains. %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v7];
  }
  else
  {
    uint64_t v43 = a1;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v42 = v6;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v52 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(id *)(*((void *)&v51 + 1) + 8 * i);
          id v19 = v18;
          if ([v18 hasPrefix:@"."])
          {
            id v19 = objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", 0, 1, @"*");
          }
          if ([v18 hasPrefix:@"*."])
          {
            uint64_t v20 = objc_msgSend(v19, "stringByReplacingCharactersInRange:withString:", 0, 2, @"*");

            id v19 = (void *)v20;
          }
          [v12 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v15);
    }

    v56[1] = v12;
    v57[0] = @"trigger";
    v55[0] = @"url-filter";
    v55[1] = @"unless-domain";
    v56[0] = @".*";
    double v21 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    v57[1] = @"action";
    v58[0] = v21;
    v58[1] = &unk_26CC73AB0;
    id v22 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    long long v59 = v22;
    int v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];

    id v50 = 0;
    uint64_t v24 = [MEMORY[0x263F08900] dataWithJSONObject:v23 options:0 error:&v50];
    id v25 = v50;
    if (v25)
    {
      uint64_t v26 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v26)
      {
        uint64_t v26 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      __int16 v27 = [v26 OSLogObject];
      id v7 = 0;
      id v6 = v42;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        __int16 v29 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v62 = v28;
        __int16 v63 = 2114;
        v64 = v29;
        __int16 v65 = 2114;
        id v66 = v25;
        _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode content rules. %{public}@", buf, 0x20u);
      }
      [*(id *)(v43 + 40) finishWithError:v25];
    }
    else
    {
      if (v24 && (uint64_t v30 = [[NSString alloc] initWithData:v24 encoding:4]) != 0)
      {
        uint64_t v31 = (void *)v30;
        id v32 = [MEMORY[0x263F08C38] UUID];
        id v33 = [v32 UUIDString];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_179;
        block[3] = &unk_2643E3DA8;
        id v45 = v33;
        id v46 = v31;
        id v34 = *(void **)(v43 + 40);
        uint64_t v47 = *(void *)(v43 + 32);
        id v48 = v34;
        id v49 = *(id *)(v43 + 48);
        id v35 = v31;
        id v36 = v33;
        dispatch_async(MEMORY[0x263EF83A0], block);

        id v6 = v42;
      }
      else
      {
        v37 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        id v6 = v42;
        if (!v37)
        {
          v37 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        uint64_t v38 = [v37 OSLogObject];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = objc_opt_class();
          id v40 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v62 = v39;
          __int16 v63 = 2114;
          v64 = v40;
          _os_log_impl(&dword_21C134000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode content rules into JSON. (nil)", buf, 0x16u);
        }
        __int16 v41 = *(void **)(v43 + 40);
        AMSError();
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        [v41 finishWithError:v35];
      }

      id v7 = 0;
    }
  }
}

void __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_179(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1FA08] defaultStore];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_2;
  v6[3] = &unk_2643E58E8;
  id v5 = *(void **)(a1 + 56);
  v6[4] = *(void *)(a1 + 48);
  id v7 = v5;
  id v8 = *(id *)(a1 + 64);
  [v2 compileContentRuleListForIdentifier:v3 encodedContentRuleList:v4 completionHandler:v6];
}

void __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6))
  {
    uint64_t v6 = AMSError();
  }
  if (v6)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to compile content rules. %{public}@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (v5)
    {
      id v11 = [*(id *)(a1 + 48) configuration];
      id v12 = [v11 userContentController];
      [v12 addContentRuleList:v5];
    }
    else
    {
      id v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v11)
      {
        id v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = AMSLogKey();
        int v15 = 138543618;
        uint64_t v16 = v13;
        __int16 v17 = 2114;
        id v18 = v14;
        _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] WARNING: No contentRuleList", (uint8_t *)&v15, 0x16u);
      }
    }

    [*(id *)(a1 + 40) finishWithSuccess];
  }
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (WKWebView)underlyingWebView
{
  return self->_underlyingWebView;
}

- (NSArray)baseScripts
{
  return self->_baseScripts;
}

- (void)setBaseScripts:(id)a3
{
}

- (AMSBinaryPromise)contentRulesPromise
{
  return self->_contentRulesPromise;
}

- (void)setContentRulesPromise:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (AMSBinaryPromise)currentLoadPromise
{
  return self->_currentLoadPromise;
}

- (void)setCurrentLoadPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLoadPromise, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_contentRulesPromise, 0);
  objc_storeStrong((id *)&self->_baseScripts, 0);
  objc_storeStrong((id *)&self->_underlyingWebView, 0);
}

@end
@interface AMSUIWebSafariWebView
+ (id)_createContentControllerWithScheme:(id)a3 data:(id)a4 messageHandler:(id)a5;
- (AMSUIWebSafariWebView)initWithAppearance:(id)a3 scheme:(id)a4 data:(id)a5 delegate:(id)a6;
- (NSString)logKey;
- (NSString)scheme;
- (WKNavigationDelegate)safariDelegate;
- (double)topInset;
- (void)setLogKey:(id)a3;
- (void)setSafariDelegate:(id)a3;
- (void)setScheme:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation AMSUIWebSafariWebView

- (AMSUIWebSafariWebView)initWithAppearance:(id)a3 scheme:(id)a4 data:(id)a5 delegate:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263F1FA60];
  id v12 = a5;
  id v13 = objc_alloc_init(v11);
  v14 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
  [v13 setWebsiteDataStore:v14];

  v15 = [v13 preferences];
  [v15 setJavaScriptCanOpenWindowsAutomatically:0];

  v16 = [v13 preferences];
  [v16 _setPunchOutWhiteBackgroundsInDarkMode:1];

  [v13 _setDrawsBackground:0];
  [v13 _setPrintsBackgrounds:0];
  v17 = NSString;
  v18 = [MEMORY[0x263F27BF8] productVersion];
  v19 = [MEMORY[0x263F27BF8] buildVersion];
  v20 = [v17 stringWithFormat:@"Version/%@ Mobile/%@ Safari", v18, v19];
  [v13 setApplicationNameForUserAgent:v20];

  v21 = [(id)objc_opt_class() _createContentControllerWithScheme:v9 data:v12 messageHandler:self];

  [v13 setUserContentController:v21];
  if ([v9 length]) {
    [v13 setURLSchemeHandler:self forURLScheme:v9];
  }
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebSafariWebView;
  v22 = -[AMSUIWebSafariWebView initWithFrame:configuration:](&v28, sel_initWithFrame_configuration_, v13, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_scheme, v9);
    objc_storeWeak((id *)&v23->_safariDelegate, v10);
    [(AMSUIWebSafariWebView *)v23 setNavigationDelegate:v10];
    v24 = [MEMORY[0x263F825C8] clearColor];
    [(UIView *)v23 ams_setBackgroundColor:v24];

    [(AMSUIWebSafariWebView *)v23 setOpaque:0];
    v25 = [MEMORY[0x263F825C8] clearColor];
    v26 = [(AMSUIWebSafariWebView *)v23 scrollView];
    objc_msgSend(v26, "ams_setBackgroundColor:", v25);
  }
  [(AMSUIWebSafariWebView *)v23 setUIDelegate:v23];

  return v23;
}

- (double)topInset
{
  return 0.0;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = [a4 body];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  id v10 = [v9 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v12 = [v9 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v11)
  {
    v14 = [(AMSUIWebSafariWebView *)self safariDelegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = [(AMSUIWebSafariWebView *)self safariDelegate];
      [v16 safariView:self didReceiveAction:v11 body:v13 replyHandler:v7];
    }
    else
    {
      v16 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v16)
      {
        v16 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        v19 = [(AMSUIWebSafariWebView *)self logKey];
        int v20 = 138543874;
        uint64_t v21 = v18;
        __int16 v22 = 2114;
        v23 = v19;
        __int16 v24 = 2114;
        id v25 = v11;
        _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari VC not responding to action delegate: %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [v5 request];
  id v7 = [v6 URL];

  v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v8)
  {
    v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = [(AMSUIWebSafariWebView *)self logKey];
    id v12 = [v7 scheme];
    id v13 = [(AMSUIWebSafariWebView *)self scheme];
    int v27 = 138544130;
    uint64_t v28 = v10;
    __int16 v29 = 2114;
    v30 = v11;
    __int16 v31 = 2114;
    v32 = v12;
    __int16 v33 = 2114;
    v34 = v13;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling scheme: %{public}@ expected: %{public}@", (uint8_t *)&v27, 0x2Au);
  }
  v14 = [v7 scheme];
  char v15 = [v14 lowercaseString];
  v16 = [(AMSUIWebSafariWebView *)self scheme];
  v17 = [v16 lowercaseString];
  int v18 = [v15 isEqualToString:v17];

  v19 = [(AMSUIWebSafariWebView *)self safariDelegate];
  if (v18)
  {
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v21 = [(AMSUIWebSafariWebView *)self safariDelegate];
      [v21 safariView:self didRedirectToSchemeWithURL:v7];
    }
    else
    {
      uint64_t v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v21)
      {
        uint64_t v21 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      __int16 v24 = [v21 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = [(AMSUIWebSafariWebView *)self logKey];
        int v27 = 138543618;
        uint64_t v28 = v25;
        __int16 v29 = 2114;
        v30 = v26;
        _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari VC not responding to scheme delegate", (uint8_t *)&v27, 0x16u);
      }
    }

    goto LABEL_16;
  }
  char v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) == 0)
  {
LABEL_16:
    v23 = AMSError();
    [v5 didFailWithError:v23];
    goto LABEL_17;
  }
  v23 = [(AMSUIWebSafariWebView *)self safariDelegate];
  [v23 webView:self startURLSchemeTask:v5];
LABEL_17:
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [(AMSUIWebSafariWebView *)self logKey];
    uint64_t v10 = [v5 request];
    id v11 = [v10 URL];
    id v12 = [v11 scheme];
    int v13 = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    __int16 v17 = 2114;
    int v18 = v12;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Stopping scheme handling: %{public}@", (uint8_t *)&v13, 0x20u);
  }
}

+ (id)_createContentControllerWithScheme:(id)a3 data:(id)a4 messageHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (objc_class *)MEMORY[0x263F1FA38];
  id v10 = a5;
  id v11 = objc_alloc_init(v9);
  id v12 = [MEMORY[0x263F1FA10] pageWorld];
  [v11 addScriptMessageHandlerWithReply:v10 contentWorld:v12 name:@"callback"];

  int v13 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"];
  uint64_t v14 = [v13 URLForResource:@"JSSafariSandbox" withExtension:@"js"];

  id v35 = 0;
  __int16 v15 = [NSString stringWithContentsOfURL:v14 encoding:4 error:&v35];
  id v16 = v35;
  if (v16 || !v15)
  {
    __int16 v17 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v17)
    {
      __int16 v17 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v14;
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v37 = v20;
      uint64_t v14 = v19;
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)v21;
      __int16 v40 = 2114;
      v41 = @"JSSafariSandbox";
      __int16 v42 = 2114;
      id v43 = v16;
      _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load resource: %{public}@. %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    __int16 v17 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v15 injectionTime:0 forMainFrameOnly:0];
    [v11 addUserScript:v17];
  }

  if ([v7 length])
  {
    char v22 = [NSString stringWithFormat:@"AMSSafari.callbackScheme = \"%@\"", v7];;
    v23 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v22 injectionTime:0 forMainFrameOnly:0];
    [v11 addUserScript:v23];
  }
  if ([MEMORY[0x263F08900] isValidJSONObject:v8])
  {
    __int16 v33 = v14;
    id v34 = 0;
    __int16 v24 = [MEMORY[0x263F08900] dataWithJSONObject:v8 options:0 error:&v34];
    id v25 = v34;
    if (v25 || !v24)
    {
      int v27 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v27)
      {
        int v27 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v28 = [v27 OSLogObject];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v30 = objc_opt_class();
      uint64_t v31 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v37 = v30;
      __int16 v38 = 2114;
      uint64_t v39 = v31;
      __int16 v29 = (void *)v31;
      __int16 v40 = 2114;
      v41 = @"JSSafariSandbox";
      __int16 v42 = 2114;
      id v43 = v25;
      _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load resource: %{public}@. %{public}@", buf, 0x2Au);
    }
    else
    {
      uint64_t v26 = [[NSString alloc] initWithData:v24 encoding:4];
      if (!v26)
      {
LABEL_22:

        uint64_t v14 = v33;
        goto LABEL_23;
      }
      int v27 = (void *)v26;
      uint64_t v28 = [NSString stringWithFormat:@"AMSSafari.data = %@", v26];;
      __int16 v29 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v28 injectionTime:0 forMainFrameOnly:0];
      [v11 addUserScript:v29];
    }

LABEL_21:
    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

- (NSString)logKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logKey);
  return (NSString *)WeakRetained;
}

- (void)setLogKey:(id)a3
{
}

- (WKNavigationDelegate)safariDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safariDelegate);
  return (WKNavigationDelegate *)WeakRetained;
}

- (void)setSafariDelegate:(id)a3
{
}

- (NSString)scheme
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheme);
  return (NSString *)WeakRetained;
}

- (void)setScheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scheme);
  objc_destroyWeak((id *)&self->_safariDelegate);
  objc_destroyWeak((id *)&self->_logKey);
}

@end
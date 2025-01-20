@interface EMWebViewScriptHandler
+ (void)addScriptHandlerForWebView:(id)a3 key:(id)a4 handler:(id)a5;
- (NSString)name;
- (WKWebView)webView;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setName:(id)a3;
- (void)setWebView:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation EMWebViewScriptHandler

+ (void)addScriptHandlerForWebView:(id)a3 key:(id)a4 handler:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v16)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"EMWebViewScriptHandler.m", 18, @"Invalid parameter not satisfying: %@", @"webView" object file lineNumber description];
  }
  v11 = objc_alloc_init(EMWebViewScriptHandler);
  [(EMWebViewScriptHandler *)v11 setName:v9];
  [(EMWebViewScriptHandler *)v11 setWebView:v16];
  [(EMWebViewScriptHandler *)v11 setHandler:v10];
  v12 = [v16 configuration];
  v13 = [v12 userContentController];
  v14 = [(EMWebViewScriptHandler *)v11 name];
  [v13 addScriptMessageHandler:v11 name:v14];
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v9 = a4;
  v5 = [(EMWebViewScriptHandler *)self webView];
  v6 = [v9 webView];
  if (v6 == v5)
  {
    v7 = [(EMWebViewScriptHandler *)self handler];

    if (!v7) {
      goto LABEL_5;
    }
    v6 = [(EMWebViewScriptHandler *)self handler];
    v8 = [v9 body];
    ((void (**)(void, void *))v6)[2](v6, v8);
  }
LABEL_5:
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
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
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_webView);
}

@end
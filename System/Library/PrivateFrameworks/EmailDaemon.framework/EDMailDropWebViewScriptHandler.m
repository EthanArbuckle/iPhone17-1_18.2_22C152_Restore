@interface EDMailDropWebViewScriptHandler
- (NSString)name;
- (WKWebView)webView;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setName:(id)a3;
- (void)setWebView:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation EDMailDropWebViewScriptHandler

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = _ef_log_EDMailDropMetadataGenerator();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "MailDrop: Received Script message with %@", (uint8_t *)&v12, 0xCu);
  }

  v7 = [(EDMailDropWebViewScriptHandler *)self webView];
  v8 = [v5 webView];
  if (v8 != v7) {
    goto LABEL_6;
  }
  v9 = [(EDMailDropWebViewScriptHandler *)self handler];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    v8 = [(EDMailDropWebViewScriptHandler *)self handler];
    v11 = [v5 body];
    ((void (**)(void, void *))v8)[2](v8, v11);

LABEL_6:
  }
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
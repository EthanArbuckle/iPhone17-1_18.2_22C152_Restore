@interface QLWKURLSchemeHandlerProxy
- (QLWKURLSchemeHandlerProxy)initWithHandler:(id)a3;
- (WKURLSchemeHandler)handler;
- (void)setHandler:(id)a3;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation QLWKURLSchemeHandlerProxy

- (QLWKURLSchemeHandlerProxy)initWithHandler:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLWKURLSchemeHandlerProxy;
  v5 = [(QLWKURLSchemeHandlerProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(QLWKURLSchemeHandlerProxy *)v5 setHandler:v4];
  }

  return v6;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLWKURLSchemeHandlerProxy *)self handler];
  [v8 webView:v7 startURLSchemeTask:v6];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLWKURLSchemeHandlerProxy *)self handler];
  [v8 webView:v7 stopURLSchemeTask:v6];
}

- (WKURLSchemeHandler)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);

  return (WKURLSchemeHandler *)WeakRetained;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _SFSyntheticClickContext
- (WKNavigationAction)navigationAction;
- (WKWebView)webView;
- (_SFSyntheticClickContext)initWithWebView:(id)a3 navigationAction:(id)a4;
@end

@implementation _SFSyntheticClickContext

- (_SFSyntheticClickContext)initWithWebView:(id)a3 navigationAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFSyntheticClickContext;
  v9 = [(_SFSyntheticClickContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeStrong((id *)&v10->_navigationAction, a4);
    v11 = v10;
  }

  return v10;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (WKNavigationAction)navigationAction
{
  return self->_navigationAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationAction, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end
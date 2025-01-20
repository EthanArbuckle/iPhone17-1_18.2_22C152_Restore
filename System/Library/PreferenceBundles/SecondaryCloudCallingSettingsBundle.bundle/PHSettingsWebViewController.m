@interface PHSettingsWebViewController
- (BOOL)isPresentingURL;
- (NSData)body;
- (NSURL)url;
- (PHSettingsWebViewController)init;
- (PHSettingsWebViewController)initWithCoder:(id)a3;
- (PHSettingsWebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHSettingsWebViewController)initWithType:(int64_t)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UIWebView)webView;
- (id)completionBlock;
- (int64_t)type;
- (void)_cancelButtonClicked:(id)a3;
- (void)cancelWebView;
- (void)doProvisioningCanceled;
- (void)doProvisioningDone;
- (void)doProvisioningFailed;
- (void)doWebViewTimedOut;
- (void)loadURL:(id)a3 body:(id)a4 completion:(id)a5;
- (void)loadView;
- (void)loadWebViewWithSpinner:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setBody:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setupControllerInWebFrame:(id)a3;
- (void)uiWebView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4;
@end

@implementation PHSettingsWebViewController

- (PHSettingsWebViewController)init
{
  return 0;
}

- (PHSettingsWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PHSettingsWebViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PHSettingsWebViewController)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHSettingsWebViewController;
  v4 = [(PHSettingsWebViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = (UIWebView *)objc_alloc_init((Class)UIWebView);
    webView = v5->_webView;
    v5->_webView = v6;
  }
  return v5;
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v21 = objc_msgSend(v3, "initWithFrame:");

  v5 = +[UIColor whiteColor];
  [v21 setBackgroundColor:v5];

  [v21 setAutoresizingMask:18];
  [(PHSettingsWebViewController *)self setView:v21];
  [v21 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(PHSettingsWebViewController *)self webView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [(PHSettingsWebViewController *)self webView];
  [v15 setScalesPageToFit:1];

  v16 = [(PHSettingsWebViewController *)self webView];
  [v16 setDelegate:self];

  v17 = [(PHSettingsWebViewController *)self webView];
  [v17 setAutoresizingMask:18];

  v18 = [(PHSettingsWebViewController *)self webView];
  [v21 addSubview:v18];

  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonClicked:"];
  v20 = [(PHSettingsWebViewController *)self navigationItem];
  [v20 setLeftBarButtonItem:v19];
}

- (BOOL)isPresentingURL
{
  return self->_url || self->_body != 0;
}

- (void)loadWebViewWithSpinner:(id)a3
{
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "loadWebViewWithSpinner", buf, 2u);
  }

  [(PHSettingsWebViewController *)self setCompletionBlock:v4];
  if (!self->_activityIndicator)
  {
    double v6 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:2];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v6;

    [(UIActivityIndicatorView *)self->_activityIndicator setAutoresizingMask:45];
    double v8 = [(PHSettingsWebViewController *)self view];
    [v8 center];
    -[UIActivityIndicatorView setCenter:](self->_activityIndicator, "setCenter:");

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(UIWebView *)self->_webView addSubview:self->_activityIndicator];
  }
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6BC8;
  block[3] = &unk_C450;
  block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
}

- (void)loadURL:(id)a3 body:(id)a4 completion:(id)a5
{
  double v8 = (NSURL *)a3;
  dispatch_time_t v9 = (NSData *)a4;
  id v10 = a5;
  double v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    __int16 v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "LoadURL: %@ body: %@", buf, 0x16u);
  }

  url = self->_url;
  self->_url = v8;
  double v13 = v8;

  body = self->_body;
  self->_body = v9;
  v15 = v9;

  [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  [(UIActivityIndicatorView *)self->_activityIndicator removeFromSuperview];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  [(PHSettingsWebViewController *)self setCompletionBlock:v10];
  v17 = (NSURL *)[objc_alloc((Class)NSMutableURLRequest) initWithURL:v13 cachePolicy:1 timeoutInterval:30.0];
  [(NSURL *)v17 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  v18 = +[NSLocale preferredLanguages];
  id v19 = [v18 firstObject];

  if (v19) {
    CFStringRef v20 = v19;
  }
  else {
    CFStringRef v20 = @"en";
  }
  [(NSURL *)v17 setValue:v20 forHTTPHeaderField:@"Accept-Language"];
  [(NSURL *)v17 setHTTPMethod:@"POST"];
  [(NSURL *)v17 setHTTPBody:v15];
  id v21 = +[NSString stringWithFormat:@"%lu", [(NSData *)v15 length]];

  [(NSURL *)v17 setValue:v21 forHTTPHeaderField:@"Content-Length"];
  v22 = PHDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Loading URL request: %@", buf, 0xCu);
  }

  v23 = [(PHSettingsWebViewController *)self webView];
  [v23 loadRequest:v17];
}

- (void)cancelWebView
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Asked to cancel web view", v4, 2u);
  }

  [(PHSettingsWebViewController *)self doProvisioningCanceled];
}

- (void)_cancelButtonClicked:(id)a3
{
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_cancelButtonClicked", v5, 2u);
  }

  [(PHSettingsWebViewController *)self doProvisioningCanceled];
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  id v5 = a4;
  double v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_7BD0((uint64_t)v5, v6);
  }

  if ([v5 code] != (id)-999) {
    [(PHSettingsWebViewController *)self doProvisioningFailed];
  }
}

- (void)doProvisioningDone
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "doProvisioningDone", buf, 2u);
  }

  id v4 = [(PHSettingsWebViewController *)self completionBlock];
  id v5 = [v4 copy];

  [(PHSettingsWebViewController *)self setCompletionBlock:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7168;
  v7[3] = &unk_C478;
  id v8 = v5;
  id v6 = v5;
  [(PHSettingsWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

- (void)doProvisioningCanceled
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "doProvisioningCanceled", buf, 2u);
  }

  id v4 = [(PHSettingsWebViewController *)self completionBlock];
  id v5 = [v4 copy];

  [(PHSettingsWebViewController *)self setCompletionBlock:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_728C;
  v7[3] = &unk_C478;
  id v8 = v5;
  id v6 = v5;
  [(PHSettingsWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

- (void)doProvisioningFailed
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_7C48(v3);
  }

  id v4 = [(PHSettingsWebViewController *)self completionBlock];
  id v5 = [v4 copy];

  [(PHSettingsWebViewController *)self setCompletionBlock:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7394;
  v7[3] = &unk_C478;
  id v8 = v5;
  id v6 = v5;
  [(PHSettingsWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

- (void)doWebViewTimedOut
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[WARN] doWebViewTimedOut", buf, 2u);
  }

  id v4 = [(PHSettingsWebViewController *)self completionBlock];
  id v5 = [v4 copy];

  [(PHSettingsWebViewController *)self setCompletionBlock:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_74B8;
  v7[3] = &unk_C478;
  id v8 = v5;
  id v6 = v5;
  [(PHSettingsWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

- (void)setupControllerInWebFrame:(id)a3
{
  id v12 = a3;
  id v4 = (const OpaqueJSContext *)[v12 globalContext];
  if (!v4) {
    sub_7C8C();
  }
  id v5 = v4;
  id v6 = (OpaqueJSClass *)qword_114F8;
  if (!qword_114F8)
  {
    id v6 = JSClassCreate((const JSClassDefinition *)&unk_11448);
    qword_114F8 = (uint64_t)v6;
  }
  JSObjectRef v7 = JSObjectMake(v5, v6, self);
  if (!v7) {
    sub_7CB8();
  }
  id v8 = v7;
  dispatch_time_t v9 = [v12 windowObject];
  id v10 = (OpaqueJSValue *)[v9 JSObject];

  if (!v10) {
    sub_7CE4();
  }
  double v11 = JSStringCreateWithCFString(@"WiFiCallingWebViewController");
  JSObjectSetProperty(v5, v10, v11, v8, 0, 0);
}

- (void)uiWebView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end
@interface QLWebviewSnapshotter
- (BOOL)loaded;
- (BOOL)startedLoad;
- (CGSize)previewSize;
- (NSTimer)loadingTimeoutTimer;
- (QLThumbnailItem)item;
- (QLWebPaginationManager)paginationManager;
- (QLWebviewSnapshotter)initWithItem:(id)a3 previewSize:(CGSize)a4;
- (WKWebView)webView;
- (id)loadCompletion;
- (void)_configureWebView;
- (void)_didFinishLoad;
- (void)_loadIfNeededAndExecuteBlock:(id)a3;
- (void)_requestSnapshotThumbnailForRect:(CGRect)a3 completion:(id)a4;
- (void)_setupLoadTimeoutTimer;
- (void)_setupWebView;
- (void)_teardownLoadTimeoutTimer;
- (void)_webPageLoadingTimedOut:(id)a3;
- (void)_webView:(id)a3 didFailLoadWithRequest:(id)a4 inFrame:(id)a5 withError:(id)a6;
- (void)cleanup;
- (void)load:(id)a3;
- (void)requestSnapshotThumbnail:(id)a3;
- (void)requestSnapshotThumbnailForPage:(int64_t)a3 withXPathQuery:(id)a4 completion:(id)a5;
- (void)setItem:(id)a3;
- (void)setLoadCompletion:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setLoadingTimeoutTimer:(id)a3;
- (void)setPaginationManager:(id)a3;
- (void)setPreviewSize:(CGSize)a3;
- (void)setStartedLoad:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
@end

@implementation QLWebviewSnapshotter

- (QLWebviewSnapshotter)initWithItem:(id)a3 previewSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLWebviewSnapshotter;
  v9 = [(QLWebviewSnapshotter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    v10->_previewSize.CGFloat width = width;
    v10->_previewSize.CGFloat height = height;
  }

  return v10;
}

- (void)load:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003574;
  v4[3] = &unk_100008300;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)cleanup
{
}

- (void)_setupLoadTimeoutTimer
{
  id v3 = objc_alloc((Class)NSTimer);
  v4 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
  id v5 = [v3 initWithFireDate:v4 interval:self target:"_webPageLoadingTimedOut:" selector:0 userInfo:0 repeats:0.0];
  [(QLWebviewSnapshotter *)self setLoadingTimeoutTimer:v5];

  id v7 = +[NSRunLoop currentRunLoop];
  v6 = [(QLWebviewSnapshotter *)self loadingTimeoutTimer];
  [v7 addTimer:v6 forMode:NSRunLoopCommonModes];
}

- (void)_teardownLoadTimeoutTimer
{
  id v3 = [(QLWebviewSnapshotter *)self loadingTimeoutTimer];
  [v3 invalidate];

  [(QLWebviewSnapshotter *)self setLoadingTimeoutTimer:0];
}

- (void)_webPageLoadingTimedOut:(id)a3
{
  [(QLWebviewSnapshotter *)self _teardownLoadTimeoutTimer];

  [(QLWebviewSnapshotter *)self _didFinishLoad];
}

- (void)_setupWebView
{
  id v10 = objc_alloc_init((Class)WKWebViewConfiguration);
  id v3 = objc_opt_new();
  [v10 _setAllowedNetworkHosts:v3];

  v4 = +[WKWebsiteDataStore nonPersistentDataStore];
  [v10 setWebsiteDataStore:v4];

  [v10 setURLSchemeHandler:self forURLScheme:@"cid"];
  id v5 = objc_alloc((Class)WKWebView);
  [(QLWebviewSnapshotter *)self previewSize];
  double v7 = v6;
  [(QLWebviewSnapshotter *)self previewSize];
  id v9 = objc_msgSend(v5, "initWithFrame:configuration:", v10, 0.0, 0.0, v7, v8);
  [(QLWebviewSnapshotter *)self setWebView:v9];
}

- (void)_configureWebView
{
  id v3 = [(WKWebView *)self->_webView configuration];
  id v12 = [v3 preferences];

  v4 = [(WKWebView *)self->_webView configuration];
  id v5 = [v4 processPool];
  WKContextSetCacheModel();

  double v6 = [(WKWebView *)self->_webView configuration];
  double v7 = [v6 websiteDataStore];
  double v8 = +[WKWebsiteDataStore allWebsiteDataTypes];
  id v9 = +[NSDate distantPast];
  [v7 removeDataOfTypes:v8 modifiedSince:v9 completionHandler:&stru_100008340];

  [v12 setJavaScriptCanOpenWindowsAutomatically:0];
  WKPreferencesSetLocalStorageEnabled();
  WKPreferencesSetDatabasesEnabled();
  WKPreferencesSetEncodingDetectorEnabled();
  id v10 = objc_opt_new();
  [v10 setAllowsContentJavaScript:0];
  v11 = [(WKWebView *)self->_webView configuration];
  [v11 setDefaultWebpagePreferences:v10];

  [(WKWebView *)self->_webView _setBackgroundExtendsBeyondPage:1];
}

- (void)requestSnapshotThumbnailForPage:(int64_t)a3 withXPathQuery:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003B60;
  v10[3] = &unk_100008390;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  int64_t v14 = a3;
  id v8 = v11;
  id v9 = v13;
  [(QLWebviewSnapshotter *)self _loadIfNeededAndExecuteBlock:v10];
}

- (void)requestSnapshotThumbnail:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003E78;
  v4[3] = &unk_1000083B8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(QLWebviewSnapshotter *)v5 _loadIfNeededAndExecuteBlock:v4];
}

- (void)_requestSnapshotThumbnailForRect:(CGRect)a3 completion:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = [(QLWebviewSnapshotter *)self webView];
  objc_msgSend(v10, "_convertPointFromContentsToView:", x, y);
  double v12 = v11;
  double v14 = v13;

  v15 = [(QLWebviewSnapshotter *)self webView];
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  objc_msgSend(v15, "_convertPointFromContentsToView:", MaxX, CGRectGetMaxY(v26));
  double v18 = v17;
  double v20 = v19;

  v21 = [(QLWebviewSnapshotter *)self webView];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100004074;
  v23[3] = &unk_1000083E0;
  id v24 = v9;
  id v22 = v9;
  objc_msgSend(v21, "_snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:", 0, v23, v12, v14, v18 - v12, v20 - v14, 0.0);
}

- (void)_loadIfNeededAndExecuteBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if ([(QLWebviewSnapshotter *)self startedLoad])
  {
    if ([(QLWebviewSnapshotter *)self loaded])
    {
      v4[2](v4, 0);
    }
    else
    {
      id v5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
      ((void (**)(id, void *))v4)[2](v4, v5);
    }
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004194;
    v6[3] = &unk_100008408;
    double v7 = v4;
    [(QLWebviewSnapshotter *)self load:v6];
  }
}

- (void)_didFinishLoad
{
  [(QLWebviewSnapshotter *)self _teardownLoadTimeoutTimer];
  [(QLWebviewSnapshotter *)self setLoaded:1];
  id v3 = [(QLWebviewSnapshotter *)self loadCompletion];

  if (v3)
  {
    v4 = [(QLWebviewSnapshotter *)self loadCompletion];
    v4[2]();

    [(QLWebviewSnapshotter *)self setLoadCompletion:0];
  }
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5 = a4;
  id v6 = [v5 request];
  double v7 = [v6 URL];
  id v20 = +[NSURLComponents componentsWithURL:v7 resolvingAgainstBaseURL:0];

  id v8 = [v20 path];
  id v9 = [(QLWebviewSnapshotter *)self item];
  id v10 = [v9 attachments];
  double v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    id v12 = objc_alloc((Class)NSURLResponse);
    double v13 = [v5 request];
    double v14 = [v13 URL];
    v15 = [v11 contentType];
    v16 = [v15 preferredMIMEType];
    double v17 = [v11 data];
    id v18 = objc_msgSend(v12, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v14, v16, objc_msgSend(v17, "length"), 0);

    [v5 didReceiveResponse:v18];
    double v19 = [v11 data];
    [v5 didReceiveData:v19];

    [v5 didFinish];
  }
  else
  {
    id v18 = +[NSError errorWithDomain:NSURLErrorDomain code:-1100 userInfo:0];
    [v5 didFailWithError:v18];
  }
}

- (void)_webView:(id)a3 didFailLoadWithRequest:(id)a4 inFrame:(id)a5 withError:(id)a6
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

- (WKWebView)webView
{
  return (WKWebView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWebView:(id)a3
{
}

- (QLThumbnailItem)item
{
  return (QLThumbnailItem *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItem:(id)a3
{
}

- (BOOL)startedLoad
{
  return self->_startedLoad;
}

- (void)setStartedLoad:(BOOL)a3
{
  self->_startedLoad = a3;
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (id)loadCompletion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setLoadCompletion:(id)a3
{
}

- (NSTimer)loadingTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLoadingTimeoutTimer:(id)a3
{
}

- (CGSize)previewSize
{
  objc_copyStruct(v4, &self->_previewSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_previewSize, &v3, 16, 1, 0);
}

- (QLWebPaginationManager)paginationManager
{
  return (QLWebPaginationManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPaginationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationManager, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end
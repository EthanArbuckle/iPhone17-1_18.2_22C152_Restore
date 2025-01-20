@interface MUWebViewFactory
+ (id)sharedWebViewFactory;
- (MUWebViewFactory)init;
- (id)dequeueItemWithBridgeConfiguration:(id)a3;
- (void)requeueItem:(id)a3;
@end

@implementation MUWebViewFactory

+ (id)sharedWebViewFactory
{
  if (qword_1EB4F7168 != -1) {
    dispatch_once(&qword_1EB4F7168, &__block_literal_global_16);
  }
  v2 = (void *)_MergedGlobals_120;
  return v2;
}

uint64_t __40__MUWebViewFactory_sharedWebViewFactory__block_invoke()
{
  v0 = objc_alloc_init(MUWebViewFactory);
  uint64_t v1 = _MergedGlobals_120;
  _MergedGlobals_120 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MUWebViewFactory)init
{
  v9.receiver = self;
  v9.super_class = (Class)MUWebViewFactory;
  v2 = [(MUWebViewFactory *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F46780]);
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v3];
    processPool = v2->_processPool;
    v2->_processPool = (WKProcessPool *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    webViewCache = v2->_webViewCache;
    v2->_webViewCache = v6;
  }
  return v2;
}

- (id)dequeueItemWithBridgeConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_webViewCache objectForKey:v4];
  if ([v5 count])
  {
    v6 = [v5 lastObject];
    [v5 removeLastObject];
  }
  else
  {
    v7 = objc_alloc_init(MUWebViewMessageHandlerProxy);
    id v8 = objc_alloc_init(MEMORY[0x1E4F466A0]);
    objc_super v9 = [v4 nativeControllerName];
    [v8 addScriptMessageHandler:v7 name:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    [v10 _setClientNavigationsRunAtForegroundPriority:1];
    [v10 setIgnoresViewportScaleLimits:0];
    [v10 setSuppressesIncrementalRendering:1];
    [v10 setProcessPool:self->_processPool];
    [v10 setUserContentController:v8];
    id v11 = objc_alloc(MEMORY[0x1E4F466F0]);
    v12 = objc_msgSend(v11, "initWithFrame:configuration:", v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [v12 scrollView];
    [v13 setScrollsToTop:0];

    v14 = [v12 scrollView];
    [v14 setBounces:0];

    v15 = [v12 scrollView];
    [v15 setScrollEnabled:0];

    v16 = [v12 scrollView];
    [v16 setMaximumZoomScale:1.0];

    v17 = [v12 scrollView];
    [v17 setMinimumZoomScale:1.0];

    [v12 setOpaque:0];
    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [v12 setBackgroundColor:v18];

    v6 = [[MUWebViewFactoryItem alloc] initWithBridgeConfiguration:v4 webView:v12 messageHandlerProxy:v7];
  }

  return v6;
}

- (void)requeueItem:(id)a3
{
  id v13 = a3;
  id v4 = [v13 messageHandlerProxy];
  [v4 setTarget:0];

  v5 = [v13 webView];
  [v5 setNavigationDelegate:0];

  v6 = [v13 webView];
  [v6 setUIDelegate:0];

  v7 = [v13 webView];
  [v7 stopLoading];

  webViewCache = self->_webViewCache;
  objc_super v9 = [v13 bridgeConfiguration];
  id v10 = [(NSCache *)webViewCache objectForKey:v9];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = self->_webViewCache;
    v12 = [v13 bridgeConfiguration];
    [(NSCache *)v11 setObject:v10 forKey:v12];
  }
  [v10 addObject:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewCache, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
}

@end
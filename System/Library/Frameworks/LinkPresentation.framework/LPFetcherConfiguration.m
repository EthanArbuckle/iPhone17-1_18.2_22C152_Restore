@interface LPFetcherConfiguration
- (BOOL)fetchIsNotUserInitiated;
- (BOOL)loadingIsNonAppInitiated;
- (LPEvent)rootEvent;
- (LPFetcherConfiguration)init;
- (WKWebView)webViewForProcessSharing;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maximumResponseCount;
- (void)dealloc;
- (void)setFetchIsNotUserInitiated:(BOOL)a3;
- (void)setLoadingIsNonAppInitiated:(BOOL)a3;
- (void)setMaximumResponseCount:(int64_t)a3;
- (void)setRootEvent:(id)a3;
- (void)setWebViewForProcessSharing:(id)a3;
@end

@implementation LPFetcherConfiguration

- (LPFetcherConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPFetcherConfiguration;
  v2 = [(LPFetcherConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_maximumResponseCount = 1;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPFetcherConfiguration allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPFetcherConfiguration *)self webViewForProcessSharing];
    [(LPFetcherConfiguration *)v4 setWebViewForProcessSharing:v5];

    [(LPFetcherConfiguration *)v4 setMaximumResponseCount:[(LPFetcherConfiguration *)self maximumResponseCount]];
    objc_super v6 = [(LPFetcherConfiguration *)self rootEvent];
    [(LPFetcherConfiguration *)v4 setRootEvent:v6];

    [(LPFetcherConfiguration *)v4 setLoadingIsNonAppInitiated:[(LPFetcherConfiguration *)self loadingIsNonAppInitiated]];
    [(LPFetcherConfiguration *)v4 setFetchIsNotUserInitiated:[(LPFetcherConfiguration *)self fetchIsNotUserInitiated]];
    v7 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  v7 = self->_webViewForProcessSharing;
  webViewForProcessSharing = self->_webViewForProcessSharing;
  self->_webViewForProcessSharing = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__LPFetcherConfiguration_dealloc__block_invoke;
  block[3] = &unk_1E5B04EB8;
  block[4] = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
  _Block_object_dispose(v6, 8);

  v4.receiver = self;
  v4.super_class = (Class)LPFetcherConfiguration;
  [(LPFetcherConfiguration *)&v4 dealloc];
}

void __33__LPFetcherConfiguration_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (WKWebView)webViewForProcessSharing
{
  return self->_webViewForProcessSharing;
}

- (void)setWebViewForProcessSharing:(id)a3
{
}

- (BOOL)loadingIsNonAppInitiated
{
  return self->_loadingIsNonAppInitiated;
}

- (void)setLoadingIsNonAppInitiated:(BOOL)a3
{
  self->_loadingIsNonAppInitiated = a3;
}

- (int64_t)maximumResponseCount
{
  return self->_maximumResponseCount;
}

- (void)setMaximumResponseCount:(int64_t)a3
{
  self->_maximumResponseCount = a3;
}

- (LPEvent)rootEvent
{
  return self->_rootEvent;
}

- (void)setRootEvent:(id)a3
{
}

- (BOOL)fetchIsNotUserInitiated
{
  return self->_fetchIsNotUserInitiated;
}

- (void)setFetchIsNotUserInitiated:(BOOL)a3
{
  self->_fetchIsNotUserInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootEvent, 0);

  objc_storeStrong((id *)&self->_webViewForProcessSharing, 0);
}

@end
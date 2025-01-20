@interface LPMetadataProvider
+ (id)_callbackQueue;
+ (id)_copyDefaultWebViewConfiguration;
+ (id)_defaultUserAgent;
+ (id)_incompleteMetadataRequests;
+ (id)_postProcessingQueue;
+ (id)_requestMetadataForRequest:(id)a3 completionHandler:(id)a4;
+ (id)_visionAnalysisQueue;
+ (id)requestMetadataForURL:(id)a3 completionHandler:(id)a4;
+ (id)requestMetadataForWebView:(id)a3 completionHandler:(id)a4;
+ (void)_requestSourceApplicationMetadataForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (BOOL)_fetchIsNotUserInitiated;
- (BOOL)_firstImage:(id)a3 isSimilarToSecondImage:(id)a4 usingAnalyzer:(id)a5;
- (BOOL)_shouldDownloadImageSubresources;
- (BOOL)_shouldDownloadMediaSubresources;
- (BOOL)_shouldFailFetchDueToLockdownModeWithCompletionHandler:(id)a3;
- (BOOL)_switchToSpecializationIfPossibleForMIMEType:(id)a3 URL:(id)a4 hasLoadedResource:(BOOL)a5;
- (BOOL)_switchToSpecializationIfPossibleForMetadata:(id)a3 URL:(id)a4;
- (BOOL)_switchToSpecializationIfPossibleForURL:(id)a3;
- (BOOL)cancelled;
- (BOOL)fetchSubresources;
- (BOOL)requirePrivateRelayForAllNetworkTraffic;
- (BOOL)shouldFetchSubresources;
- (BOOL)useSpecializedProviders;
- (LPEvent)_event;
- (LPMetadataProvider)init;
- (NSTimeInterval)timeout;
- (id)_copyWebViewConfiguration;
- (id)_startFetchingMetadataForRequest:(id)a3 completionHandler:(id)a4;
- (id)_startFetchingMetadataForURL:(id)a3 completionHandler:(id)a4;
- (id)_startFetchingMetadataForWebView:(id)a3 completionHandler:(id)a4;
- (id)_startFetchingMetadataForWebView:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (id)subresourceFetcherConfiguration;
- (unint64_t)allowedSpecializedProviders;
- (void)_cancelDueToTimeout;
- (void)_completedWithError:(id)a3;
- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4;
- (void)_fetchAssociatedApplicationMetadataWithCompletionHandler:(id)a3;
- (void)_fetchImplicitIcons;
- (void)_fetchMetadataFromWebView;
- (void)_fetchSubresources;
- (void)_fetchedMetadata:(id)a3;
- (void)_filteredUniqueContentImages:(id)a3;
- (void)_generateSpecializationIfPossibleForCompleteMetadata:(id)a3 completionHandler:(id)a4;
- (void)_internalPostProcessResolvedMetadataWithEvent:(id)a3 completionHandler:(id)a4;
- (void)_internalStartFetchingMetadataForWebView:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5;
- (void)_internalStartFetchingMetadataFromURLRequest;
- (void)_postProcessResolvedMetadataWithEvent:(id)a3 completionHandler:(id)a4;
- (void)_propagateYouTubeTimestamps;
- (void)_redistinguishImagesAndIcons;
- (void)_setFetchIsNotUserInitiated:(BOOL)a3;
- (void)_setMetadata:(id)a3 onlyUpgradeFields:(BOOL)a4;
- (void)_setShouldDownloadImageSubresources:(BOOL)a3;
- (void)_setShouldDownloadMediaSubresources:(BOOL)a3;
- (void)_simplifyTitle;
- (void)_startFetchingSubresourcesForPartialMetadata:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5;
- (void)_startWatchdogTimer;
- (void)_stopWatchdogTimer;
- (void)_willStartFetchingMetadata;
- (void)cancel;
- (void)dealloc;
- (void)deduplicateContentImagesWithEvent:(id)a3 inGroup:(id)a4;
- (void)metadataProviderSpecialization:(id)a3 didCompleteWithMetadata:(id)a4;
- (void)metadataProviderSpecialization:(id)a3 didFetchPreliminaryMetadata:(id)a4;
- (void)metadataProviderSpecializationDidFail:(id)a3;
- (void)setAllowedSpecializedProviders:(unint64_t)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setFetchSubresources:(BOOL)a3;
- (void)setRequirePrivateRelayForAllNetworkTraffic:(BOOL)a3;
- (void)setShouldFetchSubresources:(BOOL)shouldFetchSubresources;
- (void)setTimeout:(NSTimeInterval)timeout;
- (void)setUseSpecializedProviders:(BOOL)a3;
- (void)startFetchingMetadataForRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler;
- (void)startFetchingMetadataForURL:(NSURL *)URL completionHandler:(void *)completionHandler;
- (void)startFetchingMetadataForWebView:(id)a3 completionHandler:(id)a4;
- (void)startFetchingSubresourcesForPartialMetadata:(id)a3 completionHandler:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation LPMetadataProvider

+ (id)_callbackQueue
{
  v2 = (void *)_callbackQueue_queue;
  if (!_callbackQueue_queue)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.LinkPresentation.MetadataProvider", v3);
    v5 = (void *)_callbackQueue_queue;
    _callbackQueue_queue = (uint64_t)v4;

    v2 = (void *)_callbackQueue_queue;
  }

  return v2;
}

+ (id)_postProcessingQueue
{
  v2 = (void *)_postProcessingQueue_queue;
  if (!_postProcessingQueue_queue)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.LinkPresentation.MetadataProvider.PostProcessing", v3);
    v5 = (void *)_postProcessingQueue_queue;
    _postProcessingQueue_queue = (uint64_t)v4;

    v2 = (void *)_postProcessingQueue_queue;
  }

  return v2;
}

+ (id)_visionAnalysisQueue
{
  v2 = (void *)_visionAnalysisQueue_queue;
  if (!_visionAnalysisQueue_queue)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.LinkPresentation.MetadataProvider.VisionAnalysis", v3);
    v5 = (void *)_visionAnalysisQueue_queue;
    _visionAnalysisQueue_queue = (uint64_t)v4;

    v2 = (void *)_visionAnalysisQueue_queue;
  }

  return v2;
}

+ (id)_incompleteMetadataRequests
{
  if (_incompleteMetadataRequests_onceToken != -1) {
    dispatch_once(&_incompleteMetadataRequests_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)_incompleteMetadataRequests_incompleteRequests;

  return v2;
}

void __49__LPMetadataProvider__incompleteMetadataRequests__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_incompleteMetadataRequests_incompleteRequests;
  _incompleteMetadataRequests_incompleteRequests = (uint64_t)v0;
}

+ (id)requestMetadataForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v6];
  v9 = [a1 _requestMetadataForRequest:v8 completionHandler:v7];

  return v9;
}

+ (id)_requestMetadataForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  [v8 startFetchingMetadataForRequest:v6 completionHandler:v7];

  return v8;
}

+ (id)requestMetadataForWebView:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  [v8 startFetchingMetadataForWebView:v6 completionHandler:v7];

  return v8;
}

+ (id)_copyDefaultWebViewConfiguration
{
  v2 = (void *)_copyDefaultWebViewConfiguration_configuration;
  if (!_copyDefaultWebViewConfiguration_configuration)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    dispatch_queue_t v4 = (void *)_copyDefaultWebViewConfiguration_configuration;
    _copyDefaultWebViewConfiguration_configuration = (uint64_t)v3;

    [(id)_copyDefaultWebViewConfiguration_configuration _setAllowsJavaScriptMarkup:0];
    [(id)_copyDefaultWebViewConfiguration_configuration _setAllowsMetaRefresh:0];
    [(id)_copyDefaultWebViewConfiguration_configuration _setLoadsSubresources:0];
    [(id)_copyDefaultWebViewConfiguration_configuration _setClientNavigationsRunAtForegroundPriority:1];
    [(id)_copyDefaultWebViewConfiguration_configuration _setIgnoresAppBoundDomains:1];
    v5 = [(id)_copyDefaultWebViewConfiguration_configuration preferences];
    [v5 _setExtensibleSSOEnabled:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F46780]);
    [v6 setJITEnabled:0];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v6];
    [(id)_copyDefaultWebViewConfiguration_configuration setProcessPool:v7];

    v2 = (void *)_copyDefaultWebViewConfiguration_configuration;
  }
  id v8 = (void *)[v2 copy];
  v9 = [MEMORY[0x1E4F46710] nonPersistentDataStore];
  [v8 setWebsiteDataStore:v9];

  if (+[LPApplicationCompatibilityQuirks needsFreshWKUserContentController])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F466A0]);
    [(id)_copyDefaultWebViewConfiguration_configuration setUserContentController:v10];
  }
  v11 = +[LPTestingOverrides customLoader];

  if (v11)
  {
    v12 = +[LPTestingOverrides customLoader];
    [v12 installCustomWebViewLoader:v8];
  }
  return v8;
}

- (id)_copyWebViewConfiguration
{
  id v3 = (void *)[(id)objc_opt_class() _copyDefaultWebViewConfiguration];
  dispatch_queue_t v4 = v3;
  if (self->_requirePrivateRelayForAllNetworkTraffic)
  {
    v5 = [v3 defaultWebpagePreferences];
    objc_msgSend(v5, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v5, "_networkConnectionIntegrityPolicy") | 0x10);
  }
  return v4;
}

+ (id)_defaultUserAgent
{
  return @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0";
}

- (LPMetadataProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)LPMetadataProvider;
  v2 = [(LPMetadataProvider *)&v9 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingFetchers = v2->_pendingFetchers;
    v2->_pendingFetchers = v3;

    v2->_useSpecializedProviders = 1;
    v2->_allowedSpecializedProviders = -1;
    v2->_shouldFetchSubresources = 1;
    *(_WORD *)&v2->_shouldDownloadMediaSubresources = 257;
    v2->_timeout = 30.0;
    dispatch_group_t v5 = dispatch_group_create();
    subresourceFetchGroup = v2->_subresourceFetchGroup;
    v2->_subresourceFetchGroup = (OS_dispatch_group *)v5;

    v2->_loggingID = ++init_nextLoggingID_0;
    id v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A35DC000, v0, v1, "LPMetadataProvider<%d>: dealloc", v2, v3, v4, v5, v6);
}

- (BOOL)_shouldFailFetchDueToLockdownModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[LPTestingOverrides forceEnableLockdownMode];
  uint8_t v6 = [MEMORY[0x1E4F73068] shared];
  int v7 = v5 | [v6 enabled];

  if (v7)
  {
    id v8 = _Block_copy(v4);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v8;

    [(LPMetadataProvider *)self _failedWithErrorCode:5 underlyingError:0];
  }

  return v7;
}

- (void)_willStartFetchingMetadata
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[LPEventTimeline eventWithType:0 subtitle:0];
  event = self->_event;
  self->_event = v3;

  BOOL v5 = +[LPMetadataProvider _incompleteMetadataRequests];
  objc_sync_enter(v5);
  uint8_t v6 = +[LPMetadataProvider _incompleteMetadataRequests];
  [v6 addObject:self];

  objc_sync_exit(v5);
  [(LPMetadataProvider *)self _startWatchdogTimer];
  if (self->_fetchIsNotUserInitiated)
  {
    int v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int loggingID = self->_loggingID;
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = loggingID;
      _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: using zero-click fetch mode", (uint8_t *)&buf, 8u);
    }
  }
  objc_super v9 = LPLogChannelFetching();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = self->_loggingID;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v10;
    _os_log_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: acquiring process assertion", (uint8_t *)&buf, 8u);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F4E280]);
  uint64_t v12 = getpid();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke;
  v17[3] = &unk_1E5B052E0;
  v17[4] = self;
  v13 = (BKSProcessAssertion *)[v11 initWithPID:v12 flags:1 reason:4 name:@"com.apple.LinkPresentation.MetadataProvider.Fetch" withHandler:v17];
  processAssertion = self->_processAssertion;
  self->_processAssertion = v13;

  objc_initWeak(&buf, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_30;
  v15[3] = &unk_1E5B055A0;
  objc_copyWeak(&v16, &buf);
  [(BKSProcessAssertion *)self->_processAssertion setInvalidationHandler:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);
}

void __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_2;
    block[3] = &unk_1E5B04DF0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1A35DC000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling fetch because process assertion was not acquired", (uint8_t *)v5, 8u);
  }
  return [*(id *)(a1 + 32) _cancelDueToTimeout];
}

void __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_30(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = LPLogChannelFetching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = WeakRetained[2];
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_1A35DC000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling fetch due to process assertion expiration", (uint8_t *)v4, 8u);
    }
    [WeakRetained _stopWatchdogTimer];
    [WeakRetained _cancelDueToTimeout];
  }
}

- (void)startFetchingMetadataForURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  id v8 = URL;
  uint64_t v6 = completionHandler;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v8];
  [(LPMetadataProvider *)self startFetchingMetadataForRequest:v7 completionHandler:v6];
}

- (void)startFetchingMetadataForRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v7 = request;
  id v8 = completionHandler;
  if (![(LPMetadataProvider *)self _shouldFailFetchDueToLockdownModeWithCompletionHandler:v8])
  {
    if (v7 && ([(NSURLRequest *)v7 URL], objc_super v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      [(LPMetadataProvider *)self _willStartFetchingMetadata];
      unsigned int v10 = _Block_copy(v8);
      id v11 = self->_completionHandler;
      self->_id completionHandler = v10;

      p_URLRequest = &self->_URLRequest;
      objc_storeStrong((id *)&self->_URLRequest, request);
      v13 = [(NSURLRequest *)self->_URLRequest URL];
      originalURL = self->_originalURL;
      self->_originalURL = v13;

      v15 = +[LPPresentationSpecializations canonicalMetadataURLForURL:self->_originalURL];
      if ([v15 isEqual:self->_originalURL])
      {
        id v16 = 0;
      }
      else
      {
        id v16 = (NSURLRequest *)[(NSURLRequest *)*p_URLRequest mutableCopy];
        [(NSURLRequest *)v16 setURL:v15];
      }
      v18 = urlByRemovingTrackingInformation(v15);
      if (([v15 isEqual:v18] & 1) == 0)
      {
        if (!v16) {
          id v16 = (NSURLRequest *)[(NSURLRequest *)*p_URLRequest mutableCopy];
        }
        [(NSURLRequest *)v16 setURL:v18];
        uint64_t v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int loggingID = self->_loggingID;
          *(_DWORD *)id buf = 67109120;
          unsigned int v30 = loggingID;
          _os_log_impl(&dword_1A35DC000, v19, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: removed known tracking information from URL", buf, 8u);
        }
      }
      v21 = v16;
      if (!v16) {
        v21 = *p_URLRequest;
      }
      objc_storeStrong((id *)&self->_URLRequest, v21);
      v22 = LPLogChannelFetching();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = self->_loggingID;
        *(_DWORD *)id buf = 67109120;
        unsigned int v30 = v23;
        _os_log_impl(&dword_1A35DC000, v22, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: start fetching for URL", buf, 8u);
      }
      if (self->_hasStartedFetching) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to start fetching on an LPMetadataProvider that has already started. LPMetadataProvider is a one-shot object."];
      }
      self->_hasStartedFetching = 1;
      v24 = [(NSURLRequest *)self->_URLRequest URL];
      BOOL v25 = [(LPMetadataProvider *)self _switchToSpecializationIfPossibleForURL:v24];

      if (!v25)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke_36;
        v26[3] = &unk_1E5B04DF0;
        v26[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v26);
      }
    }
    else
    {
      v17 = +[LPMetadataProvider _callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke;
      block[3] = &unk_1E5B05068;
      block[4] = self;
      id v28 = v8;
      dispatch_async(v17, block);
    }
  }
}

void __72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A35DC000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: failing fetch due to nil URL", (uint8_t *)v6, 8u);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = makeLPError(2, 0);
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
}

unsigned char *__72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke_36(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[88]) {
    return (unsigned char *)[result _internalStartFetchingMetadataFromURLRequest];
  }
  return result;
}

- (void)_internalStartFetchingMetadataFromURLRequest
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v3 = [(NSURLRequest *)self->_URLRequest URL];
  char v4 = objc_msgSend(v3, "_lp_isHTTPFamilyURL");

  if (v4)
  {
    [(LPEvent *)self->_mainResourceLoadEvent didCompleteWithStatus:3];
    uint64_t v5 = [(LPEvent *)self->_event childWithType:2 subtitle:@"Main Resource"];
    mainResourceLoadEvent = self->_mainResourceLoadEvent;
    self->_mainResourceLoadEvent = v5;

    uint64_t v7 = [(NSURLRequest *)self->_URLRequest URL];
    [(LPEvent *)self->_mainResourceLoadEvent setURL:v7];

    [(LPEvent *)self->_webProcessLaunchEvent didCompleteWithStatus:3];
    id v8 = [(LPEvent *)self->_event childWithType:7 subtitle:0];
    webProcessLaunchEvent = self->_webProcessLaunchEvent;
    self->_webProcessLaunchEvent = v8;

    self->_hasStartedFetchingMetadataFromWebView = 0;
    webView = self->_webView;
    if (!webView)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F466F0]);
      id v12 = [(LPMetadataProvider *)self _copyWebViewConfiguration];
      v13 = (WKWebView *)objc_msgSend(v11, "initWithFrame:configuration:", v12, 0.0, 0.0, 1024.0, 768.0);
      v14 = self->_webView;
      self->_webView = v13;

      [(WKWebView *)self->_webView setNavigationDelegate:self];
      v15 = [(NSURLRequest *)self->_URLRequest URL];
      id v16 = +[LPPresentationSpecializations userAgentForURL:v15];
      [(WKWebView *)self->_webView setCustomUserAgent:v16];

      webView = self->_webView;
    }
    id v17 = [(WKWebView *)webView loadRequest:self->_URLRequest];
    if (self->_shouldFetchSubresources)
    {
      [(LPMetadataProvider *)self _fetchImplicitIcons];
    }
  }
  else
  {
    v18 = LPLogChannelFetching();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int loggingID = self->_loggingID;
      v20[0] = 67109120;
      v20[1] = loggingID;
      _os_log_impl(&dword_1A35DC000, v18, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling before main resource load due to non-HTTP-family URL", (uint8_t *)v20, 8u);
    }
    [(LPMetadataProvider *)self _failedWithErrorCode:2 underlyingError:0];
  }
}

- (id)_startFetchingMetadataForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v6];
  objc_super v9 = [(LPMetadataProvider *)self _startFetchingMetadataForRequest:v8 completionHandler:v7];

  return v9;
}

- (id)_startFetchingMetadataForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 URL];
  objc_super v9 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v9;

  id v11 = [(LPLinkMetadata *)self->_metadata _createAsynchronousLoadDeferralToken];
  objc_storeStrong((id *)&self->_originalURL, v8);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __73__LPMetadataProvider__startFetchingMetadataForRequest_completionHandler___block_invoke;
  uint64_t v19 = &unk_1E5B05BC8;
  id v12 = v11;
  id v20 = v12;
  id v13 = v7;
  id v21 = v13;
  [(LPMetadataProvider *)self startFetchingMetadataForRequest:v6 completionHandler:&v16];
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", v8, v16, v17, v18, v19);
  v14 = self->_metadata;

  return v14;
}

void __73__LPMetadataProvider__startFetchingMetadataForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)startFetchingMetadataForWebView:(id)a3 completionHandler:(id)a4
{
}

- (void)_internalStartFetchingMetadataForWebView:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (![(LPMetadataProvider *)self _shouldFailFetchDueToLockdownModeWithCompletionHandler:v10])
  {
    id v11 = [v9 URL];
    originalURL = self->_originalURL;
    self->_originalURL = v11;

    id v13 = [(NSURL *)self->_originalURL _lp_requestWithAttribution:v6];
    URLRequest = self->_URLRequest;
    self->_URLRequest = v13;

    v15 = self->_URLRequest;
    if (v15
      && ([(NSURLRequest *)v15 URL], uint64_t v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      uint64_t v17 = [(NSURLRequest *)self->_URLRequest URL];
      BOOL v18 = +[LPPresentationSpecializations shouldLoadInsteadOfUsingExistingWebViewForURL:v17];

      if (v18)
      {
        uint64_t v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int loggingID = self->_loggingID;
          *(_DWORD *)id buf = 67109120;
          unsigned int v31 = loggingID;
          id v21 = "LPMetadataProvider<%d>: falling back from using existing WKWebView to fetching because of specializations";
LABEL_11:
          _os_log_impl(&dword_1A35DC000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 8u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      if ([v9 isLoading])
      {
        uint64_t v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = self->_loggingID;
          *(_DWORD *)id buf = 67109120;
          unsigned int v31 = v23;
          id v21 = "LPMetadataProvider<%d>: falling back from using existing WKWebView to fetching because web view is still loading";
          goto LABEL_11;
        }
LABEL_12:
        [(LPMetadataProvider *)self startFetchingMetadataForRequest:self->_URLRequest completionHandler:v10];
        goto LABEL_20;
      }
      [(LPMetadataProvider *)self _willStartFetchingMetadata];
      v24 = _Block_copy(v10);
      id completionHandler = self->_completionHandler;
      self->_id completionHandler = v24;

      objc_storeStrong((id *)&self->_webView, a3);
      self->_fetchingFromExistingWebView = 1;
      v26 = LPLogChannelFetching();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v27 = self->_loggingID;
        *(_DWORD *)id buf = 67109120;
        unsigned int v31 = v27;
        _os_log_impl(&dword_1A35DC000, v26, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: start fetching for WKWebView", buf, 8u);
      }
      [(LPMetadataProvider *)self _fetchMetadataFromWebView];
      if (self->_shouldFetchSubresources) {
        [(LPMetadataProvider *)self _fetchImplicitIcons];
      }
      if (self->_hasStartedFetching) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to start fetching on an LPMetadataProvider that has already started. LPMetadataProvider is a one-shot object."];
      }
      self->_hasStartedFetching = 1;
    }
    else
    {
      v22 = +[LPMetadataProvider _callbackQueue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __99__LPMetadataProvider__internalStartFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke;
      v28[3] = &unk_1E5B05068;
      v28[4] = self;
      id v29 = v10;
      dispatch_async(v22, v28);
    }
  }
LABEL_20:
}

void __99__LPMetadataProvider__internalStartFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A35DC000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: failing fetch from existing WKWebView due to nil URL", (uint8_t *)v6, 8u);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = makeLPError(2, 0);
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
}

- (id)_startFetchingMetadataForWebView:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v8;

  id v10 = [(LPLinkMetadata *)self->_metadata _createAsynchronousLoadDeferralToken];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  BOOL v18 = __73__LPMetadataProvider__startFetchingMetadataForWebView_completionHandler___block_invoke;
  uint64_t v19 = &unk_1E5B05BC8;
  id v11 = v10;
  id v20 = v11;
  id v12 = v7;
  id v21 = v12;
  [(LPMetadataProvider *)self _internalStartFetchingMetadataForWebView:v6 isNonAppInitiated:0 completionHandler:&v16];
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", self->_originalURL, v16, v17, v18, v19);
  id v13 = [v6 title];
  [(LPLinkMetadata *)self->_metadata setTitle:v13];

  v14 = self->_metadata;
  return v14;
}

void __73__LPMetadataProvider__startFetchingMetadataForWebView_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (id)_startFetchingMetadataForWebView:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v10;

  id v12 = [(LPLinkMetadata *)self->_metadata _createAsynchronousLoadDeferralToken];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __91__LPMetadataProvider__startFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke;
  id v21 = &unk_1E5B05BC8;
  id v13 = v12;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  [(LPMetadataProvider *)self _internalStartFetchingMetadataForWebView:v8 isNonAppInitiated:v6 completionHandler:&v18];
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", self->_originalURL, v18, v19, v20, v21);
  v15 = [v8 title];
  [(LPLinkMetadata *)self->_metadata setTitle:v15];

  uint64_t v16 = self->_metadata;
  return v16;
}

void __91__LPMetadataProvider__startFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)startFetchingSubresourcesForPartialMetadata:(id)a3 completionHandler:(id)a4
{
}

- (void)_startFetchingSubresourcesForPartialMetadata:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (![(LPMetadataProvider *)self _shouldFailFetchDueToLockdownModeWithCompletionHandler:v10])
  {
    self->_subresourceFetchIsNonAppInitiated = a4;
    [(LPMetadataProvider *)self _willStartFetchingMetadata];
    id v11 = _Block_copy(v10);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v11;

    objc_storeStrong((id *)&self->_metadata, a3);
    id v13 = [v9 originalURL];
    originalURL = self->_originalURL;
    self->_originalURL = v13;

    v15 = LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int loggingID = self->_loggingID;
      v17[0] = 67109120;
      v17[1] = loggingID;
      _os_log_impl(&dword_1A35DC000, v15, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: performing deferred fetch of subresources", (uint8_t *)v17, 8u);
    }
    [(LPMetadataProvider *)self _fetchImplicitIcons];
    [(LPMetadataProvider *)self _fetchSubresources];
    if (self->_hasStartedFetching) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to start fetching on an LPMetadataProvider that has already started. LPMetadataProvider is a one-shot object."];
    }
    self->_hasStartedFetching = 1;
  }
}

- (void)_startWatchdogTimer
{
  objc_initWeak(&location, self);
  int v3 = (void *)MEMORY[0x1E4F1CB00];
  double timeout = self->_timeout;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__LPMetadataProvider__startWatchdogTimer__block_invoke;
  v7[3] = &unk_1E5B05BF0;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 scheduledTimerWithTimeInterval:0 repeats:v7 block:timeout];
  watchdog = self->_watchdog;
  self->_watchdog = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__LPMetadataProvider__startWatchdogTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 88))
    {
      int v3 = LPLogChannelFetching();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __41__LPMetadataProvider__startWatchdogTimer__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v4 = LPLogChannelFetching();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = v2[2];
        v6[0] = 67109120;
        v6[1] = v5;
        _os_log_impl(&dword_1A35DC000, v4, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: watchdog timer fired, cancelling", (uint8_t *)v6, 8u);
      }
      [v2 _cancelDueToTimeout];
    }
  }
}

- (void)_stopWatchdogTimer
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A35DC000, v0, v1, "LPMetadataProvider<%d>: invalidating watchdog timer", v2, v3, v4, v5, v6);
}

- (void)_setMetadata:(id)a3 onlyUpgradeFields:(BOOL)a4
{
  id v6 = a3;
  metadata = self->_metadata;
  p_metadata = &self->_metadata;
  uint64_t v7 = metadata;
  id v10 = v6;
  if (metadata) {
    -[LPLinkMetadata _copyPropertiesFrom:onlyUpgradeFields:](v7, "_copyPropertiesFrom:onlyUpgradeFields:");
  }
  else {
    objc_storeStrong((id *)p_metadata, a3);
  }
}

- (void)_fetchMetadataFromWebView
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A35DC000, v0, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: unexpectedly reached _fetchMetadataFromWebView more than once; ignoring",
    v1,
    8u);
}

void __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) _failedWithErrorCode:2 underlyingError:v6];
    [*(id *)(a1 + 40) didCompleteWithStatus:2];
  }
  else
  {
    [*(id *)(a1 + 40) didCompleteWithStatus:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      id v8 = [v7 objectForKeyedSubscript:@"error"];

      if (v8)
      {
        id v9 = (id)LPLogChannelFetching();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
          id v11 = [v7 objectForKeyedSubscript:@"error"];
          __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_1(v11, v15, v10, v9);
        }

        [*(id *)(a1 + 32) _failedWithErrorCode:2 underlyingError:0];
      }
      else
      {
        [*(id *)(a1 + 32) _fetchedMetadata:v7];
      }
    }
    else
    {
      id v12 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
        id v14 = objc_opt_class();
        __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_2(v14, (uint64_t)v15, v13, v12);
      }

      [*(id *)(a1 + 32) _failedWithErrorCode:2 underlyingError:0];
    }
  }
}

- (BOOL)_switchToSpecializationIfPossibleForMIMEType:(id)a3 URL:(id)a4 hasLoadedResource:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_useSpecializedProviders && !self->_specializationState)
  {
    id v11 = [LPMetadataProviderSpecializationContext alloc];
    LOBYTE(v19) = self->_fetchIsNotUserInitiated;
    id v12 = [(LPMetadataProviderSpecializationContext *)v11 initWithOriginalURL:self->_originalURL postRedirectURL:v9 MIMEType:v8 webView:self->_webView hasLoadedResource:v5 shouldFetchSubresources:self->_shouldFetchSubresources allowedSpecializations:self->_allowedSpecializedProviders fetchIsNotUserInitiated:v19];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _DWORD v20[2] = __89__LPMetadataProvider__switchToSpecializationIfPossibleForMIMEType_URL_hasLoadedResource___block_invoke;
    v20[3] = &unk_1E5B05C40;
    v20[4] = self;
    [(LPMetadataProviderSpecializationContext *)v12 setEventGenerator:v20];
    int v13 = +[LPMetadataProviderSpecialization specializedMetadataProviderForResourceWithContext:v12];
    BOOL v10 = v13 != 0;
    if (v13)
    {
      id v14 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int loggingID = self->_loggingID;
        uint64_t v16 = objc_opt_class();
        *(_DWORD *)id buf = 67109378;
        unsigned int v22 = loggingID;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: switching to specialization (%@) due to MIME type", buf, 0x12u);
      }

      [(LPFetcherGroup *)self->_iconFetcherGroup cancel];
      iconFetcherGroup = self->_iconFetcherGroup;
      self->_iconFetcherGroup = 0;

      objc_storeStrong((id *)&self->_specializedMetadataProvider, v13);
      [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider setDelegate:self];
      [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider start];
      self->_specializationState = 1;
      -[LPMetadataProviderSpecializationContext ensureEventWithSpecialization:](v12, "ensureEventWithSpecialization:", [(id)objc_opt_class() specialization]);
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __89__LPMetadataProvider__switchToSpecializationIfPossibleForMIMEType_URL_hasLoadedResource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) childWithType:4 subtitle:@"MIME Type"];
}

- (BOOL)_switchToSpecializationIfPossibleForMetadata:(id)a3 URL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_useSpecializedProviders && !self->_specializationState)
  {
    id v9 = [LPMetadataProviderSpecializationContext alloc];
    originalURL = self->_originalURL;
    id v11 = [(WKWebView *)self->_webView _MIMEType];
    LOBYTE(v19) = self->_fetchIsNotUserInitiated;
    id v12 = [(LPMetadataProviderSpecializationContext *)v9 initWithOriginalURL:originalURL postRedirectURL:v7 MIMEType:v11 webView:self->_webView hasLoadedResource:1 shouldFetchSubresources:self->_shouldFetchSubresources allowedSpecializations:self->_allowedSpecializedProviders fetchIsNotUserInitiated:v19];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _DWORD v20[2] = __71__LPMetadataProvider__switchToSpecializationIfPossibleForMetadata_URL___block_invoke;
    v20[3] = &unk_1E5B05C40;
    v20[4] = self;
    [(LPMetadataProviderSpecializationContext *)v12 setEventGenerator:v20];
    int v13 = +[LPMetadataProviderSpecialization specializedMetadataProviderForMetadata:v6 withContext:v12];
    BOOL v8 = v13 != 0;
    if (v13)
    {
      id v14 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int loggingID = self->_loggingID;
        uint64_t v16 = objc_opt_class();
        *(_DWORD *)id buf = 67109378;
        unsigned int v22 = loggingID;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: switching to specialization (%@) due to retrieved metadata", buf, 0x12u);
      }

      [(LPFetcherGroup *)self->_iconFetcherGroup cancel];
      iconFetcherGroup = self->_iconFetcherGroup;
      self->_iconFetcherGroup = 0;

      objc_storeStrong((id *)&self->_specializedMetadataProvider, v13);
      [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider setDelegate:self];
      [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider start];
      self->_specializationState = 1;
      -[LPMetadataProviderSpecializationContext ensureEventWithSpecialization:](v12, "ensureEventWithSpecialization:", [(id)objc_opt_class() specialization]);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __71__LPMetadataProvider__switchToSpecializationIfPossibleForMetadata_URL___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) childWithType:4 subtitle:@"Metadata"];
}

- (BOOL)_switchToSpecializationIfPossibleForURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_useSpecializedProviders && !self->_specializationState)
  {
    id v6 = [LPMetadataProviderSpecializationContext alloc];
    LOBYTE(v15) = self->_fetchIsNotUserInitiated;
    id v7 = [(LPMetadataProviderSpecializationContext *)v6 initWithOriginalURL:self->_originalURL postRedirectURL:v4 MIMEType:0 webView:self->_webView hasLoadedResource:0 shouldFetchSubresources:self->_shouldFetchSubresources allowedSpecializations:self->_allowedSpecializedProviders fetchIsNotUserInitiated:v15];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__LPMetadataProvider__switchToSpecializationIfPossibleForURL___block_invoke;
    v16[3] = &unk_1E5B05C40;
    v16[4] = self;
    [(LPMetadataProviderSpecializationContext *)v7 setEventGenerator:v16];
    BOOL v8 = +[LPMetadataProviderSpecialization specializedMetadataProviderForURLWithContext:v7];
    BOOL v5 = v8 != 0;
    if (v8)
    {
      id v9 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int loggingID = self->_loggingID;
        id v11 = objc_opt_class();
        *(_DWORD *)id buf = 67109378;
        unsigned int v18 = loggingID;
        __int16 v19 = 2112;
        id v20 = v11;
        id v12 = v11;
        _os_log_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: switching to specialization (%@) due to URL", buf, 0x12u);
      }
      [(LPFetcherGroup *)self->_iconFetcherGroup cancel];
      iconFetcherGroup = self->_iconFetcherGroup;
      self->_iconFetcherGroup = 0;

      objc_storeStrong((id *)&self->_specializedMetadataProvider, v8);
      [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider setDelegate:self];
      [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider start];
      self->_specializationState = 1;
      -[LPMetadataProviderSpecializationContext ensureEventWithSpecialization:](v7, "ensureEventWithSpecialization:", [(id)objc_opt_class() specialization]);
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __62__LPMetadataProvider__switchToSpecializationIfPossibleForURL___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) childWithType:4 subtitle:@"URL"];
}

- (void)_generateSpecializationIfPossibleForCompleteMetadata:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_useSpecializedProviders && self->_specializationState != 1)
  {
    id v9 = [LPMetadataProviderSpecializationContext alloc];
    originalURL = self->_originalURL;
    id v11 = [v6 URL];
    id v12 = [(WKWebView *)self->_webView _MIMEType];
    LOBYTE(v15) = self->_fetchIsNotUserInitiated;
    int v13 = [(LPMetadataProviderSpecializationContext *)v9 initWithOriginalURL:originalURL postRedirectURL:v11 MIMEType:v12 webView:self->_webView hasLoadedResource:1 shouldFetchSubresources:self->_shouldFetchSubresources allowedSpecializations:self->_allowedSpecializedProviders fetchIsNotUserInitiated:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _DWORD v20[2] = __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke;
    v20[3] = &unk_1E5B05C40;
    v20[4] = self;
    [(LPMetadataProviderSpecializationContext *)v13 setEventGenerator:v20];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke_2;
    block[3] = &unk_1E5B05308;
    id v17 = v6;
    unsigned int v18 = v13;
    id v19 = v8;
    id v14 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) childWithType:4 subtitle:@"Complete Metadata"];
}

uint64_t __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke_2(void *a1)
{
  uint64_t result = +[LPMetadataProviderSpecialization generateSpecializedMetadataForCompleteMetadata:a1[4] withContext:a1[5] completionHandler:a1[6]];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(a1[6] + 16);
    return v3();
  }
  return result;
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = LPLogChannelFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v6[0] = 67109120;
    v6[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v3, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: fetch cancelled by client", (uint8_t *)v6, 8u);
  }
  [(LPMetadataProvider *)self setCancelled:1];
  specializedMetadataProvider = self->_specializedMetadataProvider;
  if (specializedMetadataProvider) {
    [(LPMetadataProviderSpecialization *)specializedMetadataProvider cancel];
  }
  [(LPMetadataProvider *)self _failedWithErrorCode:3 underlyingError:0];
}

- (void)_cancelDueToTimeout
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = LPLogChannelFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v6[0] = 67109120;
    v6[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v3, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling due to timeout", (uint8_t *)v6, 8u);
  }
  [(LPMetadataProvider *)self _stopWatchdogTimer];
  [(LPMetadataProvider *)self setCancelled:1];
  self->_timedOut = 1;
  specializedMetadataProvider = self->_specializedMetadataProvider;
  if (specializedMetadataProvider) {
    [(LPMetadataProviderSpecialization *)specializedMetadataProvider cancel];
  }
  [(LPMetadataProvider *)self _failedWithErrorCode:4 underlyingError:0];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = (void (**)(id, uint64_t))a5;
  id v9 = [v7 targetFrame];
  char v10 = [v9 isMainFrame];

  if ((v10 & 1) == 0
    || ([v7 request],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 URL],
        id v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [(LPMetadataProvider *)self _switchToSpecializationIfPossibleForURL:v12], v12, v11, v13))
  {
    uint64_t v14 = 0;
LABEL_4:
    v8[2](v8, v14);
    goto LABEL_5;
  }
  uint64_t v15 = [v7 request];
  uint64_t v16 = [v15 URL];
  char v17 = objc_msgSend(v16, "_lp_isHTTPFamilyURL");

  if (v17)
  {
    uint64_t v14 = 1;
    goto LABEL_4;
  }
  unsigned int v18 = LPLogChannelFetching();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v20[0] = 67109120;
    v20[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v18, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to non-HTTP-family URL", (uint8_t *)v20, 8u);
  }
  v8[2](v8, 0);
  [(LPMetadataProvider *)self _failedWithErrorCode:2 underlyingError:0];
LABEL_5:
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = (void (**)(id, uint64_t))a5;
  id v9 = [v7 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    uint64_t v14 = [v7 response];
    uint64_t v15 = [v14 expectedContentLength];

    uint64_t v16 = [v7 response];
    char v17 = [v16 MIMEType];
    BOOL v18 = +[LPMIMETypeRegistry isWebPageType:v17];

    if (v18)
    {
      if (v15 > 0x100000)
      {
        id v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        goto LABEL_21;
      }
    }
    else
    {
      id v20 = [v7 response];
      uint64_t v21 = [v20 MIMEType];
      BOOL v22 = +[LPMIMETypeRegistry isImageType:v21];

      if (v22)
      {
        if (v15 > 10485760)
        {
          id v19 = LPLogChannelFetching();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
LABEL_14:
            unsigned int loggingID = self->_loggingID;
            int v34 = 67109376;
            unsigned int v35 = loggingID;
            __int16 v36 = 2048;
            uint64_t v37 = v15;
            _os_log_impl(&dword_1A35DC000, v19, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to excessive size: %{iec-bytes}lld", (uint8_t *)&v34, 0x12u);
          }
LABEL_21:
          uint64_t v33 = 0;
LABEL_26:
          v8[2](v8, v33);
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v24 = [v7 response];
        uint64_t v25 = [v24 MIMEType];
        v26 = [v7 response];
        unsigned int v27 = [v26 URL];
        BOOL v28 = [(LPMetadataProvider *)self _switchToSpecializationIfPossibleForMIMEType:v25 URL:v27 hasLoadedResource:0];

        if (v28) {
          goto LABEL_21;
        }
        if (!self->_useSpecializedProviders || (self->_allowedSpecializedProviders & 2) == 0)
        {
          id v29 = (id)LPLogChannelFetching();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v30 = self->_loggingID;
            unsigned int v31 = [v7 response];
            uint64_t v32 = [v31 MIMEType];
            int v34 = 67109378;
            unsigned int v35 = v30;
            __int16 v36 = 2112;
            uint64_t v37 = (uint64_t)v32;
            _os_log_impl(&dword_1A35DC000, v29, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to unknown MIME type: \"%@\"", (uint8_t *)&v34, 0x12u);
          }
          goto LABEL_21;
        }
        if (v15 >= 104857601)
        {
          id v19 = LPLogChannelFetching();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          goto LABEL_14;
        }
      }
    }
    uint64_t v33 = 1;
    goto LABEL_26;
  }
  id v11 = [v7 response];
  if (!objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(v11, "statusCode")))
  {

    goto LABEL_7;
  }
  id v12 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = self->_loggingID;
    int v34 = 67109376;
    unsigned int v35 = v13;
    __int16 v36 = 2048;
    uint64_t v37 = [v11 statusCode];
    _os_log_impl(&dword_1A35DC000, v12, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to error status code: %ld", (uint8_t *)&v34, 0x12u);
  }

  v8[2](v8, 0);
LABEL_27:
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  -[LPEvent didCompleteWithStatus:](self->_webProcessLaunchEvent, "didCompleteWithStatus:", 1, a4);
  webProcessLaunchEvent = self->_webProcessLaunchEvent;
  self->_webProcessLaunchEvent = 0;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v8[0] = 67109120;
    v8[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: -webView:didFinishNavigation:", (uint8_t *)v8, 8u);
  }
  [(LPEvent *)self->_mainResourceLoadEvent didCompleteWithStatus:1];
  mainResourceLoadEvent = self->_mainResourceLoadEvent;
  self->_mainResourceLoadEvent = 0;

  [(LPMetadataProvider *)self _fetchMetadataFromWebView];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = LPLogChannelFetching();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v10[0] = 67109120;
    v10[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: -webView:didFailNavigation:", (uint8_t *)v10, 8u);
  }
  [(LPEvent *)self->_mainResourceLoadEvent didCompleteWithStatus:2];
  mainResourceLoadEvent = self->_mainResourceLoadEvent;
  self->_mainResourceLoadEvent = 0;

  [(LPMetadataProvider *)self _failedWithErrorCode:2 underlyingError:v6];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if (!self->_specializedMetadataProvider)
  {
    id v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int loggingID = self->_loggingID;
      v10[0] = 67109120;
      v10[1] = loggingID;
      _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: -webView:didFailProvisionalNavigation:", (uint8_t *)v10, 8u);
    }
    [(LPEvent *)self->_mainResourceLoadEvent didCompleteWithStatus:2];
    mainResourceLoadEvent = self->_mainResourceLoadEvent;
    self->_mainResourceLoadEvent = 0;

    [(LPMetadataProvider *)self _failedWithErrorCode:2 underlyingError:v6];
  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4 = LPLogChannelFetching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[LPMetadataProvider webViewWebContentProcessDidTerminate:]();
  }
  [(LPEvent *)self->_mainResourceLoadEvent didCompleteWithStatus:2];
  mainResourceLoadEvent = self->_mainResourceLoadEvent;
  self->_mainResourceLoadEvent = 0;

  [(LPMetadataProvider *)self _failedWithErrorCode:2 underlyingError:0];
}

- (void)_fetchedMetadata:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    int v12 = 67109120;
    unsigned int v13 = loggingID;
    _os_log_impl(&dword_1A35DC000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: fetched metadata", (uint8_t *)&v12, 8u);
  }
  if (![(LPMetadataProvider *)self cancelled])
  {
    id v7 = [[LPLinkMetadata alloc] _initWithDictionary:v4];
    [v7 setOriginalURL:self->_originalURL];
    [(LPMetadataProvider *)self _setMetadata:v7 onlyUpgradeFields:1];
    metadata = self->_metadata;
    uint64_t v9 = [(WKWebView *)self->_webView URL];
    LOBYTE(metadata) = [(LPMetadataProvider *)self _switchToSpecializationIfPossibleForMetadata:metadata URL:v9];

    if ((metadata & 1) == 0)
    {
      [(LPMetadataProvider *)self _redistinguishImagesAndIcons];
      [(LPMetadataProvider *)self _simplifyTitle];
      [(LPMetadataProvider *)self _propagateYouTubeTimestamps];
      if (self->_shouldFetchSubresources)
      {
        [(LPMetadataProvider *)self _fetchSubresources];
        [(LPLinkMetadata *)self->_metadata _invokePendingAsynchronousLoadUpdateHandlers];
      }
      else
      {
        char v10 = LPLogChannelFetching();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v11 = self->_loggingID;
          int v12 = 67109120;
          unsigned int v13 = v11;
          _os_log_impl(&dword_1A35DC000, v10, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: skipping subresource fetch", (uint8_t *)&v12, 8u);
        }
        [(LPMetadataProvider *)self _completedWithError:0];
      }
    }
  }
}

- (id)subresourceFetcherConfiguration
{
  uint64_t v3 = objc_alloc_init(LPFetcherConfiguration);
  [(LPFetcherConfiguration *)v3 setRootEvent:self->_event];
  BOOL v4 = [(NSURLRequest *)self->_URLRequest attribution] == NSURLRequestAttributionUser
    || self->_subresourceFetchIsNonAppInitiated;
  [(LPFetcherConfiguration *)v3 setLoadingIsNonAppInitiated:v4];
  [(LPFetcherConfiguration *)v3 setWebViewForProcessSharing:self->_webView];
  [(LPFetcherConfiguration *)v3 setFetchIsNotUserInitiated:self->_fetchIsNotUserInitiated];

  return v3;
}

- (void)_fetchImplicitIcons
{
  v34[3] = *MEMORY[0x1E4F143B8];
  if (!self->_iconFetcherGroup)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v25 = [(NSURLRequest *)self->_URLRequest URL];
    BOOL v4 = [v3 URLWithString:@"/apple-touch-icon-precomposed.png" relativeToURL:v25];
    BOOL v5 = [v4 absoluteURL];
    v34[0] = v5;
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = [(NSURLRequest *)self->_URLRequest URL];
    BOOL v8 = [v6 URLWithString:@"/apple-touch-icon.png" relativeToURL:v7];
    uint64_t v9 = [v8 absoluteURL];
    v34[1] = v9;
    char v10 = (void *)MEMORY[0x1E4F1CB10];
    unsigned int v11 = [(NSURLRequest *)self->_URLRequest URL];
    int v12 = [v10 URLWithString:@"/favicon.ico" relativeToURL:v11];
    unsigned int v13 = [v12 absoluteURL];
    v34[2] = v13;
    id obja = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];

    uint64_t v14 = [LPFetcherGroup alloc];
    uint64_t v15 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __41__LPMetadataProvider__fetchImplicitIcons__block_invoke;
    v32[3] = &unk_1E5B05768;
    v32[4] = self;
    uint64_t v16 = [(LPFetcherGroup *)v14 initWithPolicy:1 configuration:v15 description:@"Icons" completionHandler:v32];
    iconFetcherGroup = self->_iconFetcherGroup;
    self->_iconFetcherGroup = v16;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = obja;
    uint64_t v18 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * v20);
          BOOL v22 = objc_alloc_init(LPIconMetadata);
          [(LPIconMetadata *)v22 setURL:v21];
          __int16 v23 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
          uint64_t v24 = +[LPImageFetcher imageFetcherForConfiguration:v23];

          [v24 setURL:v21];
          [v24 setUserData:v22];
          [v24 setResponseClass:objc_opt_class()];
          [(LPFetcherGroup *)self->_iconFetcherGroup appendFetcher:v24];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v18);
    }

    [(NSMutableArray *)self->_pendingFetchers addObject:self->_iconFetcherGroup];
  }
}

void __41__LPMetadataProvider__fetchImplicitIcons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  id v8 = v3;
  if (v3)
  {
    BOOL v4 = [v3 image];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = a1 + 32;
    [*(id *)(v6 + 80) setIcon:v4];

    id v7 = [v8 userData];
    [*(id *)(*(void *)v5 + 80) setIconMetadata:v7];

    [*(id *)(*(void *)v5 + 80) _invokePendingAsynchronousLoadUpdateHandlers];
  }
  else
  {
    uint64_t v5 = a1 + 32;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)v5 + 112));
}

- (void)setFetchSubresources:(BOOL)a3
{
  self->_shouldFetchSubresources = a3;
}

- (BOOL)fetchSubresources
{
  return self->_shouldFetchSubresources;
}

- (void)_fetchSubresources
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata streamingVideos];

  if (v3)
  {
    BOOL v4 = [(LPLinkMetadata *)self->_metadata streamingVideos];
    [v92 addObjectsFromArray:v4];
  }
  uint64_t v5 = [(LPLinkMetadata *)self->_metadata videos];

  if (v5)
  {
    uint64_t v6 = [(LPLinkMetadata *)self->_metadata videos];
    [v92 addObjectsFromArray:v6];
  }
  id v7 = [(LPLinkMetadata *)self->_metadata audios];

  if (v7)
  {
    id v8 = [(LPLinkMetadata *)self->_metadata audios];
    [v92 addObjectsFromArray:v8];
  }
  uint64_t v9 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v100 = [(LPLinkMetadata *)self->_metadata images];
    uint64_t v90 = [v100 count];
    v97 = [(LPLinkMetadata *)self->_metadata contentImagesMetadata];
    uint64_t v87 = [v97 count];
    v95 = [(LPLinkMetadata *)self->_metadata icons];
    uint64_t v86 = [v95 count];
    uint64_t v84 = [v92 count];
    v88 = [(LPLinkMetadata *)self->_metadata arAssets];
    uint64_t v10 = [v88 count];
    v85 = [(LPLinkMetadata *)self->_metadata images];
    uint64_t v11 = [v85 count];
    int v12 = [(LPLinkMetadata *)self->_metadata contentImagesMetadata];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [(LPLinkMetadata *)self->_metadata icons];
    uint64_t v15 = [v14 count];
    uint64_t v16 = [v92 count];
    char v17 = [(LPLinkMetadata *)self->_metadata arAssets];
    *(_DWORD *)id buf = 67110656;
    unsigned int v137 = loggingID;
    __int16 v138 = 2048;
    *(void *)v139 = v87 + v90 + v86 + v84 + v10;
    *(_WORD *)&v139[8] = 2048;
    uint64_t v140 = v11;
    *(_WORD *)v141 = 2048;
    *(void *)&v141[2] = v13;
    __int16 v142 = 2048;
    uint64_t v143 = v15;
    __int16 v144 = 2048;
    uint64_t v145 = v16;
    __int16 v146 = 2048;
    uint64_t v147 = [v17 count];
    _os_log_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: resolving %lu subresources (%lu images, %lu content images, %lu icons, %lu videos/audios, %lu AR assets)", buf, 0x44u);
  }
  if (!self->_shouldDownloadImageSubresources)
  {
    uint64_t v18 = LPLogChannelFetching();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = self->_loggingID;
      *(_DWORD *)id buf = 67109120;
      unsigned int v137 = v19;
      _os_log_impl(&dword_1A35DC000, v18, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: skipping image subresources because _shouldDownloadImageSubresources is set", buf, 8u);
    }
  }
  v91 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
  uint64_t v20 = [(LPLinkMetadata *)self->_metadata images];
  uint64_t v21 = [v20 count];

  BOOL v22 = [(LPLinkMetadata *)self->_metadata associatedApplication];
  __int16 v23 = [v22 bundleIdentifier];
  BOOL v24 = v23 != 0;
  v89 = v23;

  if ((v21 != 0 || v24) && self->_shouldDownloadImageSubresources)
  {
    dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
    v101 = (void *)[v91 copy];
    uint64_t v25 = [(NSURLRequest *)self->_URLRequest URL];
    BOOL v26 = +[LPPresentationSpecializations shouldAllowMultipleImagesForURL:v25];

    if (v26) {
      [v101 setMaximumResponseCount:4];
    }
    if (v89) {
      [v101 setMaximumResponseCount:1];
    }
    unsigned int v27 = [LPFetcherGroup alloc];
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke;
    v130[3] = &unk_1E5B05768;
    v130[4] = self;
    v94 = [(LPFetcherGroup *)v27 initWithPolicy:2 configuration:v101 description:@"Images" completionHandler:v130];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v28 = [(LPLinkMetadata *)self->_metadata images];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v126 objects:v135 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v127 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          uint64_t v33 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
          int v34 = +[LPImageFetcher imageFetcherForConfiguration:v33];

          unsigned int v35 = [v32 URL];
          [v34 setURL:v35];

          [v34 setUserData:v32];
          [v34 setResponseClass:objc_opt_class()];
          [(LPFetcherGroup *)v94 appendFetcher:v34];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v126 objects:v135 count:16];
      }
      while (v29);
    }

    if (!v89) {
      [(LPFetcherGroup *)v94 doneAddingFetchers];
    }
    [(NSMutableArray *)self->_pendingFetchers addObject:v94];
  }
  else
  {
    v94 = 0;
  }
  __int16 v36 = [(LPLinkMetadata *)self->_metadata contentImagesMetadata];
  BOOL v37 = [v36 count] == 0;

  if (v37 || !self->_shouldDownloadImageSubresources)
  {
    v96 = 0;
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
    v102 = (void *)[v91 copy];
    [v102 setMaximumResponseCount:4];
    uint64_t v38 = [LPFetcherGroup alloc];
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_2;
    v125[3] = &unk_1E5B05768;
    v125[4] = self;
    v96 = [(LPFetcherGroup *)v38 initWithPolicy:2 configuration:v102 description:@"Content Images" completionHandler:v125];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v39 = [(LPLinkMetadata *)self->_metadata contentImagesMetadata];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v121 objects:v134 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v122;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v122 != v41) {
            objc_enumerationMutation(v39);
          }
          v43 = *(void **)(*((void *)&v121 + 1) + 8 * j);
          v44 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
          v45 = +[LPImageFetcher imageFetcherForConfiguration:v44];

          v46 = [v43 URL];
          [v45 setURL:v46];

          [v45 setUserData:v43];
          [v45 setResponseClass:objc_opt_class()];
          [(LPFetcherGroup *)v96 appendFetcher:v45];
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v121 objects:v134 count:16];
      }
      while (v40);
    }

    [(LPFetcherGroup *)v96 doneAddingFetchers];
    [(NSMutableArray *)self->_pendingFetchers addObject:v96];
  }
  dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v47 = [(LPLinkMetadata *)self->_metadata icons];
  v48 = [v47 reverseObjectEnumerator];

  uint64_t v49 = [v48 countByEnumeratingWithState:&v117 objects:v133 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v118;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v118 != v50) {
          objc_enumerationMutation(v48);
        }
        v52 = *(void **)(*((void *)&v117 + 1) + 8 * k);
        v53 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
        v54 = +[LPImageFetcher imageFetcherForConfiguration:v53];

        v55 = [v52 URL];
        [v54 setURL:v55];

        [v54 setUserData:v52];
        [v54 setResponseClass:objc_opt_class()];
        [(LPFetcherGroup *)self->_iconFetcherGroup prependFetcher:v54];
      }
      uint64_t v49 = [v48 countByEnumeratingWithState:&v117 objects:v133 count:16];
    }
    while (v49);
  }

  [(LPFetcherGroup *)self->_iconFetcherGroup doneAddingFetchers];
  v56 = [(LPLinkMetadata *)self->_metadata arAssets];
  BOOL v57 = [v56 count] == 0;

  if (v57)
  {
    v103 = 0;
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
    v98 = (void *)[v91 copy];
    v58 = [LPFetcherGroup alloc];
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_3;
    v116[3] = &unk_1E5B05768;
    v116[4] = self;
    v103 = [(LPFetcherGroup *)v58 initWithPolicy:1 configuration:v98 description:@"ARAssets" completionHandler:v116];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v59 = [(LPLinkMetadata *)self->_metadata arAssets];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v112 objects:v132 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v113;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v113 != v61) {
            objc_enumerationMutation(v59);
          }
          v63 = *(void **)(*((void *)&v112 + 1) + 8 * m);
          v64 = objc_alloc_init(LPRawURLContentsFetcher);
          v65 = [v63 URL];
          [(LPRawURLContentsFetcher *)v64 setURL:v65];

          [(LPFetcher *)v64 setUserData:v63];
          [(LPFetcher *)v64 setResponseClass:objc_opt_class()];
          [(LPFetcherGroup *)v103 appendFetcher:v64];
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v112 objects:v132 count:16];
      }
      while (v60);
    }

    [(LPFetcherGroup *)v103 doneAddingFetchers];
    [(NSMutableArray *)self->_pendingFetchers addObject:v103];
  }
  if (![v92 count])
  {
    v99 = 0;
    if (!v89) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
  v66 = [LPFetcherGroup alloc];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_4;
  v111[3] = &unk_1E5B05768;
  v111[4] = self;
  v99 = [(LPFetcherGroup *)v66 initWithPolicy:1 configuration:v91 description:@"Videos" completionHandler:v111];
  if (!self->_shouldDownloadMediaSubresources)
  {
    v67 = LPLogChannelFetching();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v68 = self->_loggingID;
      *(_DWORD *)id buf = 67109120;
      unsigned int v137 = v68;
      _os_log_impl(&dword_1A35DC000, v67, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: only fetching metadata for media subresources because _shouldDownloadMediaSubresources is not set", buf, 8u);
    }
  }
  long long v110 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v107 = 0u;
  id v69 = v92;
  uint64_t v70 = [v69 countByEnumeratingWithState:&v107 objects:v131 count:16];
  if (v70)
  {
    uint64_t v71 = *(void *)v108;
    do
    {
      for (uint64_t n = 0; n != v70; ++n)
      {
        if (*(void *)v108 != v71) {
          objc_enumerationMutation(v69);
        }
        v73 = *(void **)(*((void *)&v107 + 1) + 8 * n);
        v74 = objc_alloc_init(LPMediaAssetFetcher);
        [(LPMediaAssetFetcher *)v74 setShouldDownloadIfPossible:self->_shouldDownloadMediaSubresources];
        objc_opt_class();
        objc_opt_isKindOfClass();
        v75 = [v73 URL];
        [(LPMediaAssetFetcher *)v74 setURL:v75];

        [(LPFetcher *)v74 setUserData:v73];
        [(LPFetcherGroup *)v99 appendFetcher:v74];
      }
      uint64_t v70 = [v69 countByEnumeratingWithState:&v107 objects:v131 count:16];
    }
    while (v70);
  }

  [(LPFetcherGroup *)v99 doneAddingFetchers];
  [(NSMutableArray *)self->_pendingFetchers addObject:v99];
  if (v89)
  {
LABEL_71:
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_120;
    v105[3] = &unk_1E5B05C68;
    v105[4] = self;
    v106 = v94;
    [(LPMetadataProvider *)self _fetchAssociatedApplicationMetadataWithCompletionHandler:v105];
  }
LABEL_72:
  unsigned int v76 = [(LPFetcherGroup *)v99 loggingID];
  v77 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v78 = self->_loggingID;
    unsigned int v79 = [(LPFetcherGroup *)v94 loggingID];
    unsigned int v80 = [(LPFetcherGroup *)v96 loggingID];
    unsigned int v81 = [(LPFetcherGroup *)self->_iconFetcherGroup loggingID];
    unsigned int v82 = [(LPFetcherGroup *)v103 loggingID];
    *(_DWORD *)id buf = 67110400;
    unsigned int v137 = v78;
    __int16 v138 = 1024;
    *(_DWORD *)v139 = v79;
    *(_WORD *)&v139[4] = 1024;
    *(_DWORD *)&v139[6] = v80;
    LOWORD(v140) = 1024;
    *(_DWORD *)((char *)&v140 + 2) = v81;
    HIWORD(v140) = 1024;
    *(_DWORD *)v141 = v82;
    *(_WORD *)&v141[4] = 1024;
    *(_DWORD *)&v141[6] = v76;
    _os_log_impl(&dword_1A35DC000, v77, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: started subresource fetcher group ids: images=%d, contentImages=%d, icons=%d, arAssets=%d, media=%d", buf, 0x26u);
  }

  subresourceFetchGroup = self->_subresourceFetchGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_122;
  block[3] = &unk_1E5B04DF0;
  void block[4] = self;
  dispatch_group_notify(subresourceFetchGroup, MEMORY[0x1E4F14428], block);
}

void __40__LPMetadataProvider__fetchSubresources__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    BOOL v4 = [v3 valueForKey:@"image"];
    if ((unint64_t)[v4 count] >= 2)
    {
      uint64_t v5 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
      [*(id *)(*(void *)(a1 + 32) + 80) setAlternateImages:v5];
    }
    uint64_t v6 = [v10 firstObject];
    id v7 = [v6 image];
    [*(id *)(*(void *)(a1 + 32) + 80) setImage:v7];

    id v8 = [v10 firstObject];
    uint64_t v9 = [v8 userData];
    [*(id *)(*(void *)(a1 + 32) + 80) setImageMetadata:v9];

    [*(id *)(*(void *)(a1 + 32) + 80) _invokePendingAsynchronousLoadUpdateHandlers];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
  }
}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    BOOL v4 = [v3 valueForKey:@"image"];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = a1 + 32;
    [*(id *)(v6 + 80) setContentImages:v4];

    id v7 = [v8 valueForKey:@"userData"];
    [*(id *)(*(void *)v5 + 80) setContentImagesMetadata:v7];

    [*(id *)(*(void *)v5 + 80) _invokePendingAsynchronousLoadUpdateHandlers];
  }
  else
  {
    uint64_t v5 = a1 + 32;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)v5 + 112));
}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    BOOL v4 = [v3 firstObject];
    uint64_t v5 = [v4 arAsset];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    [*(id *)(v7 + 80) setArAsset:v5];

    id v8 = [v10 firstObject];
    uint64_t v9 = [v8 userData];
    [*(id *)(*(void *)v6 + 80) setArAssetMetadata:v9];

    [*(id *)(*(void *)v6 + 80) _invokePendingAsynchronousLoadUpdateHandlers];
  }
  else
  {
    uint64_t v6 = a1 + 32;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)v6 + 112));
}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_4(uint64_t a1, void *a2)
{
  id v22 = [a2 firstObject];
  if (!v22)
  {
    uint64_t v15 = a1 + 32;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v22 video];
    [*(id *)(*(void *)(a1 + 32) + 80) setVideo:v3];

    BOOL v4 = [v22 userData];
    uint64_t v5 = objc_alloc_init(LPVideoMetadata);
    [*(id *)(*(void *)(a1 + 32) + 80) setVideoMetadata:v5];

    uint64_t v6 = [v4 URL];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 80) videoMetadata];
    [v7 setURL:v6];

    id v8 = [v4 type];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 80) videoMetadata];
    [v9 setType:v8];

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    [v4 size];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 80) videoMetadata];
    objc_msgSend(v14, "setSize:", v11, v13);
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v22 audio];
    [*(id *)(*(void *)(a1 + 32) + 80) setAudio:v16];

    BOOL v4 = [v22 userData];
    char v17 = objc_alloc_init(LPAudioMetadata);
    [*(id *)(*(void *)(a1 + 32) + 80) setAudioMetadata:v17];

    uint64_t v18 = [v4 URL];
    unsigned int v19 = [*(id *)(*(void *)(a1 + 32) + 80) audioMetadata];
    [v19 setURL:v18];

    uint64_t v14 = [v4 type];
    uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 80) audioMetadata];
    [v20 setType:v14];

    goto LABEL_8;
  }
LABEL_10:
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v15 = a1 + 32;
  [*(id *)(v21 + 80) _invokePendingAsynchronousLoadUpdateHandlers];
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)v15 + 112));
}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_120(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 clipHeroImageURL];

  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) subresourceFetcherConfiguration];
    uint64_t v5 = +[LPImageFetcher imageFetcherForConfiguration:v4];

    uint64_t v6 = [v7 clipHeroImageURL];
    [v5 setURL:v6];

    [v5 setResponseClass:objc_opt_class()];
    [*(id *)(a1 + 40) appendFetcher:v5];
  }
  [*(id *)(a1 + 40) doneAddingFetchers];
}

uint64_t __40__LPMetadataProvider__fetchSubresources__block_invoke_122(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 80) video];

  BOOL v4 = [*(id *)(*(void *)v2 + 80) audio];

  uint64_t v5 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(v6 + 8);
    double v13 = [*(id *)(v6 + 80) image];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 80) contentImages];
    uint64_t v9 = [v8 count];
    double v10 = [*(id *)(*(void *)(a1 + 32) + 80) icon];
    double v11 = [*(id *)(*(void *)(a1 + 32) + 80) arAsset];
    *(_DWORD *)id buf = 67110656;
    int v15 = v7;
    __int16 v16 = 1024;
    BOOL v17 = v13 != 0;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v10 != 0;
    __int16 v22 = 1024;
    BOOL v23 = v11 != 0;
    __int16 v24 = 1024;
    BOOL v25 = v3 != 0;
    __int16 v26 = 1024;
    BOOL v27 = v4 != 0;
    _os_log_impl(&dword_1A35DC000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: subresource fetch finished: got image=%d, contentImages=%lu, icons=%d, arAssets=%d, video=%d, audio=%d", buf, 0x30u);
  }
  return [*(id *)(a1 + 32) _completedWithError:0];
}

- (void)_fetchAssociatedApplicationMetadataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
  uint64_t v5 = [(LPMetadataProvider *)self subresourceFetcherConfiguration];
  uint64_t v6 = [LPFetcherGroup alloc];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  __int16 v16 = __79__LPMetadataProvider__fetchAssociatedApplicationMetadataWithCompletionHandler___block_invoke;
  BOOL v17 = &unk_1E5B05C90;
  id v7 = v4;
  __int16 v18 = self;
  id v19 = v7;
  id v8 = [(LPFetcherGroup *)v6 initWithPolicy:1 configuration:v5 description:@"App Clip Icon URL" completionHandler:&v14];
  uint64_t v9 = objc_alloc_init(LPAssociatedApplicationMetadataFetcher);
  double v10 = [(LPLinkMetadata *)self->_metadata URL];
  double v11 = v10;
  if (!v10)
  {
    double v11 = [(LPLinkMetadata *)self->_metadata originalURL];
  }
  [(LPAssociatedApplicationMetadataFetcher *)v9 setURL:v11];
  if (!v10) {

  }
  double v12 = [(LPLinkMetadata *)self->_metadata associatedApplication];
  double v13 = [v12 bundleIdentifier];
  [(LPAssociatedApplicationMetadataFetcher *)v9 setBundleIdentifier:v13];

  [(LPFetcherGroup *)v8 appendFetcher:v9];
  [(LPFetcherGroup *)v8 doneAddingFetchers];
  [(NSMutableArray *)self->_pendingFetchers addObject:v8];
}

void __79__LPMetadataProvider__fetchAssociatedApplicationMetadataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v21 = [a2 firstObject];
  if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = v21;
    id v4 = [v3 metadata];
    uint64_t v5 = [v4 clipCaption];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 80) associatedApplication];
    [v6 setCaption:v5];

    id v7 = [v3 metadata];
    id v8 = [v7 clipOpenButtonTitle];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 80) associatedApplication];
    [v9 setAction:v8];

    double v10 = [v3 metadata];
    uint64_t v11 = [v10 clipAction];
    double v12 = [*(id *)(*(void *)(a1 + 32) + 80) associatedApplication];
    [v12 setClipAction:v11];

    double v13 = [v3 iconURL];
    LODWORD(v12) = [v13 isFileURL];

    if (v12)
    {
      uint64_t v14 = objc_alloc_init(LPImageProperties);
      [(LPImageProperties *)v14 setType:6];
      uint64_t v15 = [LPImage alloc];
      __int16 v16 = [v3 iconURL];
      id v17 = [(LPImage *)v15 initByReferencingFileURL:v16 MIMEType:@"image/png" properties:v14];
      __int16 v18 = [*(id *)(*(void *)(a1 + 32) + 80) associatedApplication];
      [v18 setIcon:v17];
    }
    uint64_t v19 = *(void *)(a1 + 40);
    __int16 v20 = [v3 metadata];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
}

- (void)_redistinguishImagesAndIcons
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = [(LPLinkMetadata *)self->_metadata arAssets];
  uint64_t v50 = (void *)[v3 mutableCopy];

  id v4 = [(LPLinkMetadata *)self->_metadata icons];
  v52 = (void *)[v4 mutableCopy];

  uint64_t v5 = [(LPLinkMetadata *)self->_metadata images];
  v46 = (void *)[v5 mutableCopy];

  uint64_t v6 = [(LPLinkMetadata *)self->_metadata contentImagesMetadata];
  v47 = (void *)[v6 mutableCopy];

  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![v46 count])
  {
    if ([v47 count])
    {
      v43 = [(NSURLRequest *)self->_URLRequest URL];
      BOOL v44 = +[LPPresentationSpecializations shouldAllowHoistingContentImagesForURL:v43];

      if (v44)
      {
        v45 = [v47 firstObject];
        [v46 addObject:v45];

        [v47 removeObjectAtIndex:0];
      }
    }
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v46;
  uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        double v12 = [v11 URL];
        BOOL v13 = +[LPPresentationSpecializations isTwitterProfileImageURL:v12];

        if (v13) {
          [v7 addObject:v11];
        }
        if (+[LPPresentationSpecializations isTwitterSummaryCardMetadata:](LPPresentationSpecializations, "isTwitterSummaryCardMetadata:", self->_metadata)&& +[LPPresentationSpecializations isArticleWithActivityPub:self->_metadata])
        {
          [v7 addObject:v11];
        }
        uint64_t v14 = [v11 URL];
        if (+[LPPresentationSpecializations isAppleNewsURL:v14])
        {
        }
        else
        {
          uint64_t v15 = [(NSURLRequest *)self->_URLRequest URL];
          BOOL v16 = +[LPPresentationSpecializations isStocksNewsURL:v15];

          if (!v16) {
            goto LABEL_16;
          }
        }
        [v7 addObject:v11];
LABEL_16:
        id v17 = [v11 URL];
        BOOL v18 = +[LPPresentationSpecializations isRedditStaticImage:v17];

        if (v18) {
          [v7 addObject:v11];
        }
        uint64_t v19 = [(NSURLRequest *)self->_URLRequest URL];
        BOOL v20 = +[LPPresentationSpecializations isWebexSiteURL:v19];

        if (v20) {
          [v51 addObject:v11];
        }
        id v21 = [v11 URL];
        BOOL v22 = +[LPPresentationSpecializations isKnownBlankImageURL:v21];

        if (v22) {
          [v51 addObject:v11];
        }
        BOOL v23 = [(NSURLRequest *)self->_URLRequest URL];
        if (+[LPPresentationSpecializations isStockSymbolURL:v23])
        {
          BOOL v24 = [v52 count] == 0;

          if (!v24) {
            [v51 addObject:v11];
          }
        }
        else
        {
        }
        BOOL v25 = [v11 type];
        BOOL v26 = +[LPMIMETypeRegistry isARAssetType:v25];

        if (v26) {
          [v48 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v8);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  BOOL v27 = [v7 reverseObjectEnumerator];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v58 != v29) {
          objc_enumerationMutation(v27);
        }
        long long v31 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        uint64_t v32 = [LPIconMetadata alloc];
        uint64_t v33 = [v31 URL];
        id v34 = [(LPIconMetadata *)v32 _initWithURL:v33];

        [v52 insertObject:v34 atIndex:0];
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v28);
  }

  [obj removeObjectsInArray:v7];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  unsigned int v35 = [v48 reverseObjectEnumerator];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = *(void **)(*((void *)&v53 + 1) + 8 * k);
        uint64_t v40 = [LPARAssetMetadata alloc];
        uint64_t v41 = [v39 URL];
        id v42 = [(LPARAssetMetadata *)v40 _initWithURL:v41];

        [v50 insertObject:v42 atIndex:0];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v36);
  }

  [obj removeObjectsInArray:v48];
  [obj removeObjectsInArray:v51];
  [(LPLinkMetadata *)self->_metadata setIcons:v52];
  [(LPLinkMetadata *)self->_metadata setImages:obj];
  [(LPLinkMetadata *)self->_metadata setArAssets:v50];
  [(LPLinkMetadata *)self->_metadata setContentImagesMetadata:v47];
}

- (void)_simplifyTitle
{
  id v6 = [(LPLinkMetadata *)self->_metadata title];
  -[LPLinkMetadata setOriginalTitle:](self->_metadata, "setOriginalTitle:");

  id v3 = [(LPLinkMetadata *)self->_metadata title];

  if (v3)
  {
    id v7 = [(LPLinkMetadata *)self->_metadata title];
    id v4 = [(NSURLRequest *)self->_URLRequest URL];
    uint64_t v5 = +[LPPresentationSpecializations articleTitleFromTitle:v7 withURL:v4];
    [(LPLinkMetadata *)self->_metadata setTitle:v5];
  }
}

- (void)_propagateYouTubeTimestamps
{
  id v3 = [(NSURLRequest *)self->_URLRequest URL];
  id v27 = +[LPPresentationSpecializations youTubeVideoComponentsForVideoURL:v3];

  id v4 = v27;
  if (v27)
  {
    [v27 startTime];
    id v4 = v27;
    if (v5 != 0.0)
    {
      id v6 = [(LPLinkMetadata *)self->_metadata videos];
      uint64_t v7 = [v6 count];

      id v4 = v27;
      if (v7 == 1)
      {
        uint64_t v8 = [(LPLinkMetadata *)self->_metadata videos];
        uint64_t v9 = [v8 objectAtIndexedSubscript:0];
        double v10 = [v9 URL];
        uint64_t v11 = +[LPPresentationSpecializations youTubeVideoComponentsForEmbedURL:v10];

        if (v11)
        {
          [v11 startTime];
          if (v12 == 0.0)
          {
            BOOL v13 = [(LPLinkMetadata *)self->_metadata videos];
            uint64_t v14 = [v13 objectAtIndexedSubscript:0];
            uint64_t v15 = [v14 URL];
            BOOL v16 = objc_msgSend(v15, "_lp_components");

            id v17 = [v16 queryItems];
            BOOL v18 = (void *)MEMORY[0x1E4F290C8];
            uint64_t v19 = NSNumber;
            [v27 startTime];
            BOOL v20 = objc_msgSend(v19, "numberWithDouble:");
            id v21 = [v20 stringValue];
            BOOL v22 = [v18 queryItemWithName:@"start" value:v21];
            BOOL v23 = [v17 arrayByAddingObject:v22];
            [v16 setQueryItems:v23];

            BOOL v24 = [v16 URL];
            BOOL v25 = [(LPLinkMetadata *)self->_metadata videos];
            BOOL v26 = [v25 objectAtIndexedSubscript:0];
            [v26 setURL:v24];
          }
        }

        id v4 = v27;
      }
    }
  }
}

- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = LPLogChannelFetching();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v10[0] = 67109376;
    v10[1] = loggingID;
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: fetch failed with error code %ld", (uint8_t *)v10, 0x12u);
  }
  uint64_t v9 = makeLPError(a3, v6);
  [(LPMetadataProvider *)self _completedWithError:v9];
}

- (void)_completedWithError:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    BOOL v7 = self->_metadata != 0;
    *(_DWORD *)id buf = 67109632;
    unsigned int v31 = loggingID;
    __int16 v32 = 1024;
    BOOL v33 = v7;
    __int16 v34 = 1024;
    BOOL v35 = v4 != 0;
    _os_log_impl(&dword_1A35DC000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: starting postprocessing (has metadata=%d, has error=%d)", buf, 0x14u);
  }
  if (!self->_complete)
  {
    self->_complete = 1;
    uint64_t v8 = (void *)[(NSMutableArray *)self->_pendingFetchers copy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) cancel];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    pendingFetchers = self->_pendingFetchers;
    self->_pendingFetchers = 0;

    [(LPAnimatedImageTranscoder *)self->_imageTranscoder cancel];
    [(LPEvent *)self->_mainResourceLoadEvent didCompleteWithStatus:4];
    mainResourceLoadEvent = self->_mainResourceLoadEvent;
    self->_mainResourceLoadEvent = 0;

    [(LPEvent *)self->_webProcessLaunchEvent didCompleteWithStatus:4];
    webProcessLaunchEvent = self->_webProcessLaunchEvent;
    self->_webProcessLaunchEvent = 0;

    [(LPLinkMetadata *)self->_metadata setOriginalURL:self->_originalURL];
    BOOL v16 = [(LPLinkMetadata *)self->_metadata URL];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      BOOL v18 = [(NSURLRequest *)self->_URLRequest URL];
      [(LPLinkMetadata *)self->_metadata setURL:v18];
    }
    if (self->_fetchIsNotUserInitiated) {
      [(LPLinkMetadata *)self->_metadata _setIncomplete:1];
    }
    uint64_t v19 = [(LPEvent *)self->_event childWithType:5 subtitle:0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42__LPMetadataProvider__completedWithError___block_invoke;
    v21[3] = &unk_1E5B05AF8;
    id v22 = v19;
    BOOL v23 = self;
    id v24 = v4;
    id v20 = v19;
    [(LPMetadataProvider *)self _postProcessResolvedMetadataWithEvent:v20 completionHandler:v21];
  }
}

void __42__LPMetadataProvider__completedWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didCompleteWithStatus:1];
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v2 + 89))
  {
    [*(id *)(v2 + 16) _close];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  id v19 = *(id *)(v2 + 16);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 92))
  {
    uint64_t v6 = 4;
  }
  else
  {
    char v7 = [(id)v5 cancelled];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v6 = 3;
    }
    else if (*(void *)(v5 + 80) && !*(void *)(a1 + 48))
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 2;
    }
  }
  [*(id *)(v5 + 56) didCompleteWithStatus:v6];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__139;
  v16[4] = __Block_byref_object_dispose__140;
  id v17 = _Block_copy(*(const void **)(*(void *)(a1 + 40) + 176));
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 176);
  *(void *)(v8 + 176) = 0;

  uint64_t v10 = +[LPMetadataProvider _callbackQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__LPMetadataProvider__completedWithError___block_invoke_141;
  v12[3] = &unk_1E5B05CE0;
  uint64_t v11 = *(void **)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  id v13 = v11;
  uint64_t v14 = v16;
  uint64_t v15 = v18;
  dispatch_async(v10, v12);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __42__LPMetadataProvider__completedWithError___block_invoke_141(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v4 = *(_DWORD *)(v3 + 8);
    LODWORD(v3) = *(void *)(v3 + 80) != 0;
    BOOL v5 = a1[5] != 0;
    *(_DWORD *)id buf = 67109632;
    int v11 = v4;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl(&dword_1A35DC000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: completed (has metadata=%d, has error=%d)", buf, 0x14u);
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
  uint64_t v6 = *(void *)(a1[6] + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__LPMetadataProvider__completedWithError___block_invoke_142;
  v9[3] = &unk_1E5B05CB8;
  uint64_t v8 = a1[7];
  v9[4] = a1[4];
  v9[5] = v8;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __42__LPMetadataProvider__completedWithError___block_invoke_142(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  int v4 = +[LPMetadataProvider _incompleteMetadataRequests];
  objc_sync_enter(v4);
  BOOL v5 = +[LPMetadataProvider _incompleteMetadataRequests];
  [v5 removeObject:*(void *)(a1 + 32)];

  objc_sync_exit(v4);
  uint64_t v6 = LPLogChannelFetching();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_1A35DC000, v6, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: invalidating process assertion", (uint8_t *)v9, 8u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
}

- (void)_postProcessResolvedMetadataWithEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_metadata)
  {
    uint64_t v8 = +[LPMetadataProvider _postProcessingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke;
    block[3] = &unk_1E5B05308;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5B05500;
  id v4 = *(id *)(a1 + 48);
  [v1 _internalPostProcessResolvedMetadataWithEvent:v2 completionHandler:v3];
}

void __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2(uint64_t a1)
{
}

- (BOOL)_firstImage:(id)a3 isSimilarToSecondImage:(id)a4 usingAnalyzer:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v20 = 0;
  id v11 = [v10 computeSimilarityOf:v8 with:v9 error:&v20];
  id v12 = v20;
  if (v12)
  {
    int v13 = LPLogChannelFetching();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[LPMetadataProvider _firstImage:isSimilarToSecondImage:usingAnalyzer:]();
    }
    goto LABEL_5;
  }
  [v11 floatValue];
  if (v14 > 0.5)
  {
LABEL_5:
    BOOL v15 = 0;
    goto LABEL_6;
  }
  id v17 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    [v11 floatValue];
    *(_DWORD *)id buf = 67109376;
    unsigned int v22 = loggingID;
    __int16 v23 = 2048;
    double v24 = v19;
    _os_log_impl(&dword_1A35DC000, v17, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding content image because it is a duplicate. (similarity score %f)", buf, 0x12u);
  }

  BOOL v15 = 1;
LABEL_6:

  return v15;
}

- (void)_filteredUniqueContentImages:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
  for (unint64_t i = 0; ; ++i)
  {
    id v7 = [(LPLinkMetadata *)self->_metadata contentImages];
    unint64_t v8 = [v7 count];

    if (i >= v8) {
      break;
    }
    id v9 = [(LPLinkMetadata *)self->_metadata contentImages];
    id v10 = [v9 objectAtIndexedSubscript:i];

    id v11 = [(LPLinkMetadata *)self->_metadata contentImagesMetadata];
    id v12 = [v11 objectAtIndexedSubscript:i];

    [v5 setObject:v12 forKey:v10];
  }
  int v13 = [MEMORY[0x1E4F1CA48] array];
  float v14 = [MEMORY[0x1E4F1CA48] array];
  BOOL v15 = +[LPMetadataProvider _visionAnalysisQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke;
  block[3] = &unk_1E5B05D30;
  void block[4] = self;
  id v21 = v13;
  id v22 = v5;
  id v23 = v14;
  id v24 = v4;
  id v16 = v4;
  id v17 = v14;
  id v18 = v5;
  id v19 = v13;
  dispatch_async(v15, block);
}

void __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(_TtC16LinkPresentation16LPVisionAnalyzer);
  for (unint64_t i = 0; ; ++i)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 80) contentImages];
    BOOL v5 = i < [v4 count];

    if (!v5) {
      break;
    }
    id v6 = [*(id *)(*(void *)(a1 + 32) + 80) contentImages];
    id v7 = [v6 objectAtIndexedSubscript:i];

    unint64_t v8 = *(id **)(a1 + 32);
    id v9 = [v8[10] image];
    LOBYTE(v8) = [v8 _firstImage:v9 isSimilarToSecondImage:v7 usingAnalyzer:v2];

    if ((v8 & 1) == 0)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      long long v26 = __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_2;
      long long v27 = &unk_1E5B05D08;
      uint64_t v10 = *(void *)(a1 + 32);
      unint64_t v31 = i;
      uint64_t v28 = v10;
      id v11 = v7;
      id v29 = v11;
      uint64_t v30 = v2;
      if ((((uint64_t (*)(void *))v26)(v25) & 1) == 0) {
        [*(id *)(a1 + 40) addObject:v11];
      }
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [*(id *)(a1 + 48) objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v15)];
        [*(id *)(a1 + 56) addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_3;
  block[3] = &unk_1E5B04E68;
  id v20 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

BOOL __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56) + 1;
  do
  {
    unint64_t v3 = v2;
    id v4 = [*(id *)(*(void *)(a1 + 32) + 80) contentImages];
    unint64_t v5 = [v4 count];

    if (v3 >= v5) {
      break;
    }
    id v6 = [*(id *)(*(void *)(a1 + 32) + 80) contentImages];
    id v7 = [v6 objectAtIndexedSubscript:v3];

    LODWORD(v6) = [*(id *)(a1 + 32) _firstImage:*(void *)(a1 + 40) isSimilarToSecondImage:v7 usingAnalyzer:*(void *)(a1 + 48)];
    uint64_t v2 = v3 + 1;
  }
  while (!v6);
  return v3 < v5;
}

uint64_t __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deduplicateContentImagesWithEvent:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LPLinkMetadata *)self->_metadata contentImages];
  if (![v8 count]) {
    goto LABEL_4;
  }
  BOOL v9 = +[LPTestingOverrides forceDisableImageDeduplication];

  if (!v9)
  {
    uint64_t v10 = [v6 childWithType:9 subtitle:0];
    dispatch_group_enter(v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__LPMetadataProvider_deduplicateContentImagesWithEvent_inGroup___block_invoke;
    v11[3] = &unk_1E5B05D58;
    id v12 = v10;
    uint64_t v13 = self;
    uint64_t v14 = v7;
    id v8 = v10;
    [(LPMetadataProvider *)self _filteredUniqueContentImages:v11];

LABEL_4:
  }
}

void __64__LPMetadataProvider_deduplicateContentImagesWithEvent_inGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) didCompleteWithStatus:1];
  if ([v8 count]) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 80) setContentImages:v6];
  if ([v5 count]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 80) setContentImagesMetadata:v7];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_internalPostProcessResolvedMetadataWithEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  dispatch_group_t v9 = dispatch_group_create();
  group = dispatch_group_create();
  uint64_t v50 = objc_msgSend(v6, "childWithType:subtitle:", 8, 0, v9, v8, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5B04E18;
  uint64_t v10 = v9;
  unsigned int v82 = v10;
  v83 = self;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v49 = v11;
  id v12 = [(LPLinkMetadata *)self->_metadata video];
  if (v12)
  {
  }
  else
  {
    uint64_t v13 = [(LPLinkMetadata *)self->_metadata image];
    int v14 = [v13 _isAnimated];

    if (v14)
    {
      dispatch_group_enter(v8);
      uint64_t v15 = [(LPEvent *)self->_event childWithType:6 subtitle:0];
      id v16 = [(LPLinkMetadata *)self->_metadata imageMetadata];
      id v17 = [v16 URL];
      [v15 setURL:v17];

      id v18 = [LPAnimatedImageTranscoder alloc];
      id v19 = [(LPLinkMetadata *)self->_metadata image];
      id v20 = [(LPAnimatedImageTranscoder *)v18 initWithAnimatedImage:v19];
      imageTranscoder = self->_imageTranscoder;
      self->_imageTranscoder = v20;

      long long v22 = self->_imageTranscoder;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_149;
      v76[3] = &unk_1E5B05DA8;
      id v23 = v15;
      id v77 = v23;
      unsigned int v78 = self;
      unsigned int v80 = v11;
      unsigned int v79 = v8;
      [(LPAnimatedImageTranscoder *)v22 transcodeWithCompletionHandler:v76];

      goto LABEL_6;
    }
  }
  v11[2](v11);
LABEL_6:
  dispatch_group_enter(v10);
  long long v24 = [(LPLinkMetadata *)self->_metadata icon];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_151;
  v74[3] = &unk_1E5B05D80;
  v74[4] = self;
  uint64_t v25 = v10;
  v75 = v25;
  fitImageInSize(v24, v74, 1024.0, 1024.0);

  dispatch_group_enter(v25);
  long long v26 = [(LPLinkMetadata *)self->_metadata alternateImages];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3;
  v72[3] = &unk_1E5B05DD0;
  v72[4] = self;
  long long v27 = v25;
  v73 = v27;
  fitImagesInSize(v26, v72, 1024.0, 1024.0);

  dispatch_group_enter(v27);
  uint64_t v28 = [(LPLinkMetadata *)self->_metadata contentImages];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_152;
  v68[3] = &unk_1E5B05DF8;
  v68[4] = self;
  id v29 = v6;
  id v69 = v29;
  uint64_t v30 = v8;
  uint64_t v70 = v30;
  unint64_t v31 = v27;
  uint64_t v71 = v31;
  fitImagesInSize(v28, v68, 1024.0, 1024.0);

  dispatch_group_enter(v30);
  __int16 v32 = +[LPMetadataProvider _postProcessingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_153;
  block[3] = &unk_1E5B04E18;
  id v33 = v50;
  id v66 = v33;
  __int16 v34 = v30;
  v67 = v34;
  dispatch_group_notify(v31, v32, block);

  if (self->_webView)
  {
    BOOL v35 = [v29 childWithType:10 subtitle:0];
    dispatch_group_enter(v34);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_154;
    v62[3] = &unk_1E5B05AF8;
    v62[4] = self;
    id v36 = v35;
    id v63 = v36;
    uint64_t v37 = v34;
    long long v64 = v37;
    dispatch_async(MEMORY[0x1E4F14428], v62);
    uint64_t v38 = [(LPLinkMetadata *)self->_metadata selectedText];

    if (!v38)
    {
      v39 = [v29 childWithType:11 subtitle:0];
      dispatch_group_enter(v37);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_4;
      v59[3] = &unk_1E5B05AF8;
      v59[4] = self;
      id v60 = v39;
      long long v61 = v37;
      id v40 = v39;
      uint64_t v41 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v59);
    }
  }
  if (self->_specializedMetadataProvider)
  {
    id v42 = [v29 childWithType:12 subtitle:0];
    dispatch_group_enter(v34);
    dispatch_group_enter(group);
    v43 = +[LPMetadataProvider _postProcessingQueue];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_6;
    v57[3] = &unk_1E5B04E18;
    v57[4] = self;
    BOOL v44 = group;
    long long v58 = v44;
    dispatch_group_notify(v31, v43, v57);

    v45 = +[LPMetadataProvider _postProcessingQueue];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_8;
    v54[3] = &unk_1E5B04E18;
    id v55 = v42;
    long long v56 = v34;
    id v46 = v42;
    dispatch_group_notify(v44, v45, v54);
  }
  v47 = +[LPMetadataProvider _postProcessingQueue];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_9;
  v52[3] = &unk_1E5B05068;
  v52[4] = self;
  id v53 = v7;
  id v48 = v7;
  dispatch_group_notify(v34, v47, v52);
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 80) image];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5B05D80;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  fitImageInSize(v2, v5, 1024.0, 1024.0);
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 _computeDominantColorForProperties];
  if (imageIsInteresting(v3))
  {
    [*(id *)(*(void *)(a1 + 32) + 80) setImage:v3];
  }
  else
  {
    int8x16_t v4 = LPLogChannelFetching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_1A35DC000, v4, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding primary image because it is uninteresting", (uint8_t *)v6, 8u);
    }
    [*(id *)(*(void *)(a1 + 32) + 80) setImage:0];
    [*(id *)(*(void *)(a1 + 32) + 80) setImageMetadata:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_149(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = *(void **)(a1 + 32);
  id v13 = v3;
  if (v3)
  {
    [v4 didCompleteWithStatus:1];
    [*(id *)(*(void *)(a1 + 40) + 80) setVideo:v13];
    int v5 = objc_alloc_init(LPVideoMetadata);
    [*(id *)(*(void *)(a1 + 40) + 80) setVideoMetadata:v5];

    int8x16_t v6 = [*(id *)(*(void *)(a1 + 40) + 80) imageMetadata];
    uint64_t v7 = [v6 URL];
    id v8 = [*(id *)(*(void *)(a1 + 40) + 80) videoMetadata];
    [v8 setURL:v7];

    dispatch_group_t v9 = [v13 MIMEType];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 80) videoMetadata];
    [v10 setType:v9];

    [*(id *)(*(void *)(a1 + 40) + 80) setImage:0];
    [*(id *)(*(void *)(a1 + 40) + 80) setImageMetadata:0];
  }
  else
  {
    [v4 didCompleteWithStatus:2];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(v11 + 128);
  *(void *)(v11 + 128) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_151(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setIcon:");
  id v3 = [*(id *)(*(void *)(a1 + 32) + 80) icon];
  [v3 _computeDominantColorForProperties];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) _computeDominantColorForProperties];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v4);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v19;
    *(void *)&long long v10 = 67109120;
    long long v17 = v10;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        if (imageIsInteresting(v13))
        {
          [v7 addObject:v13];
        }
        else
        {
          int v14 = LPLogChannelFetching();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
            *(_DWORD *)id buf = v17;
            int v27 = v15;
            _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding alternate image because it is uninteresting", buf, 8u);
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }

  if ([v7 count]) {
    id v16 = v7;
  }
  else {
    id v16 = 0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setAlternateImages:", v16, v17, (void)v18);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v6++) _computeDominantColorForProperties];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v4);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v9 = 0;
  *(void *)&long long v10 = 67109120;
  long long v21 = v10;
  while (1)
  {
    unint64_t v11 = v9;
    if (objc_msgSend(v3, "count", v21, (void)v22) <= (unint64_t)v9) {
      break;
    }
    id v12 = [v3 objectAtIndexedSubscript:v9];
    if (imageIsInteresting(v12))
    {
      [v7 addObject:v12];
      id v13 = [*(id *)(*(void *)(a1 + 32) + 80) contentImagesMetadata];
      BOOL v14 = [v13 count] > v11;

      if (v14)
      {
        int v15 = [*(id *)(*(void *)(a1 + 32) + 80) contentImagesMetadata];
        id v16 = [v15 objectAtIndexedSubscript:v11];
        [v8 addObject:v16];
      }
    }
    else
    {
      long long v17 = LPLogChannelFetching();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)id buf = v21;
        int v27 = v18;
        _os_log_impl(&dword_1A35DC000, v17, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding content image because it is uninteresting", buf, 8u);
      }
    }

    unsigned int v9 = v11 + 1;
  }
  if ([v7 count]) {
    id v19 = v7;
  }
  else {
    id v19 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 80) setContentImages:v19];
  if ([v8 count]) {
    id v20 = v8;
  }
  else {
    id v20 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 80) setContentImagesMetadata:v20];
  [*(id *)(a1 + 32) deduplicateContentImagesWithEvent:*(void *)(a1 + 40) inGroup:*(void *)(a1 + 48)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_153(uint64_t a1)
{
  [*(id *)(a1 + 32) didCompleteWithStatus:1];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_154(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3_155;
  v5[3] = &unk_1E5B05AF8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 _doAfterNextPresentationUpdate:v5];
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3_155(uint64_t a1)
{
  [*(id *)(a1 + 32) didCompleteWithStatus:1];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 16) themeColor];
  [*(id *)(*(void *)(a1 + 40) + 80) setThemeColor:v2];

  id v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_5;
  v5[3] = &unk_1E5B05E20;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 _getTextFragmentMatchWithCompletionHandler:v5];
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 length];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 didCompleteWithStatus:1];
    [*(id *)(*(void *)(a1 + 40) + 80) setSelectedText:v5];
  }
  else
  {
    [v4 didCompleteWithStatus:2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 152);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_7;
  v2[3] = &unk_1E5B04DF0;
  id v3 = *(id *)(a1 + 40);
  [v1 _internalPostProcessResolvedMetadataWithCompletionHandler:v2];
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_7(uint64_t a1)
{
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) didCompleteWithStatus:1];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_9(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) _reduceSizeByDroppingResourcesIfNeeded];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_10;
  v4[3] = &unk_1E5B05E48;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  [v2 _generateSpecializationIfPossibleForCompleteMetadata:v3 completionHandler:v4];
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _setMetadata:v3 onlyUpgradeFields:0];
    uint64_t v4 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(v5 + 8);
      uint64_t v7 = [*(id *)(v5 + 80) specialization];
      v8[0] = 67109378;
      v8[1] = v6;
      __int16 v9 = 2112;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_1A35DC000, v4, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: generated specialization (%@) due to retrieved metadata", (uint8_t *)v8, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_requestSourceApplicationMetadataForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)metadataProviderSpecialization:(id)a3 didFetchPreliminaryMetadata:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = LPLogChannelFetching();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v8[0] = 67109120;
    v8[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v6, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: specialization provided preliminary metadata", (uint8_t *)v8, 8u);
  }
  [v5 _populateMetadataForBackwardCompatibility];
  [(LPMetadataProvider *)self _setMetadata:v5 onlyUpgradeFields:1];
  [(LPLinkMetadata *)self->_metadata _invokePendingAsynchronousLoadUpdateHandlers];
}

- (void)metadataProviderSpecialization:(id)a3 didCompleteWithMetadata:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider context];
  uint64_t v7 = [v6 event];
  [v7 didCompleteWithStatus:1];

  id v8 = LPLogChannelFetching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v10[0] = 67109120;
    v10[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v8, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: completed from specialization", (uint8_t *)v10, 8u);
  }
  [v5 _populateMetadataForBackwardCompatibility];
  [(LPMetadataProvider *)self _setMetadata:v5 onlyUpgradeFields:0];
  [(LPMetadataProvider *)self _completedWithError:0];
}

- (void)metadataProviderSpecializationDidFail:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(LPMetadataProviderSpecialization *)self->_specializedMetadataProvider context];
  id v5 = [v4 event];
  [v5 didCompleteWithStatus:2];

  specializedMetadataProvider = self->_specializedMetadataProvider;
  self->_specializationState = 2;
  self->_specializedMetadataProvider = 0;

  uint64_t v7 = LPLogChannelFetching();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    *(_DWORD *)id buf = 67109120;
    unsigned int v11 = loggingID;
    _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: specialization failed, retrying without specialization", buf, 8u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__LPMetadataProvider_metadataProviderSpecializationDidFail___block_invoke;
  block[3] = &unk_1E5B04DF0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__LPMetadataProvider_metadataProviderSpecializationDidFail___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalStartFetchingMetadataFromURLRequest];
}

- (unint64_t)allowedSpecializedProviders
{
  return self->_allowedSpecializedProviders;
}

- (void)setAllowedSpecializedProviders:(unint64_t)a3
{
  self->_allowedSpecializedProviders = a3;
}

- (BOOL)requirePrivateRelayForAllNetworkTraffic
{
  return self->_requirePrivateRelayForAllNetworkTraffic;
}

- (void)setRequirePrivateRelayForAllNetworkTraffic:(BOOL)a3
{
  self->_requirePrivateRelayForAllNetworkTraffic = a3;
}

- (LPEvent)_event
{
  return self->_event;
}

- (BOOL)_shouldDownloadMediaSubresources
{
  return self->_shouldDownloadMediaSubresources;
}

- (void)_setShouldDownloadMediaSubresources:(BOOL)a3
{
  self->_shouldDownloadMediaSubresources = a3;
}

- (BOOL)_shouldDownloadImageSubresources
{
  return self->_shouldDownloadImageSubresources;
}

- (void)_setShouldDownloadImageSubresources:(BOOL)a3
{
  self->_shouldDownloadImageSubresources = a3;
}

- (BOOL)_fetchIsNotUserInitiated
{
  return self->_fetchIsNotUserInitiated;
}

- (void)_setFetchIsNotUserInitiated:(BOOL)a3
{
  self->_fetchIsNotUserInitiated = a3;
}

- (BOOL)shouldFetchSubresources
{
  return self->_shouldFetchSubresources;
}

- (void)setShouldFetchSubresources:(BOOL)shouldFetchSubresources
{
  self->_shouldFetchSubresources = shouldFetchSubresources;
}

- (NSTimeInterval)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(NSTimeInterval)timeout
{
  self->_double timeout = timeout;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)useSpecializedProviders
{
  return self->_useSpecializedProviders;
}

- (void)setUseSpecializedProviders:(BOOL)a3
{
  self->_useSpecializedProviders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_specializedMetadataProvider, 0);
  objc_storeStrong((id *)&self->_pendingFetchers, 0);
  objc_storeStrong((id *)&self->_imageTranscoder, 0);
  objc_storeStrong((id *)&self->_iconFetcherGroup, 0);
  objc_storeStrong((id *)&self->_subresourceFetchGroup, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_webProcessLaunchEvent, 0);
  objc_storeStrong((id *)&self->_mainResourceLoadEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

void __41__LPMetadataProvider__startWatchdogTimer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A35DC000, v0, v1, "LPMetadataProvider<%d>: watchdog timer fired after completion", v2, v3, v4, v5, v6);
}

void __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_1(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)id buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a1;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: error thrown in MetadataExtractor.js: %@", buf, 0x12u);
}

void __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_2(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(void *)(a2 + 10) = a1;
  id v6 = a1;
  _os_log_error_impl(&dword_1A35DC000, a4, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: non-dictionary object returned in MetadataExtractor.js: %@", (uint8_t *)a2, 0x12u);
}

- (void)webViewWebContentProcessDidTerminate:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A35DC000, v0, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: Web Content process was terminated", v1, 8u);
}

- (void)_firstImage:isSimilarToSecondImage:usingAnalyzer:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A35DC000, v1, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: failed to determine similarity between images (%@)", v2, 0x12u);
}

@end
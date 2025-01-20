@interface SWHighlightCenter
+ (BOOL)isEnabled;
+ (BOOL)isSystemCollaborationSupportAvailable;
+ (NSString)highlightCollectionTitle;
+ (OS_dispatch_queue)shareURLFetchQueue;
+ (id)SWVariantDefault;
+ (id)SWVariantNewsToday;
+ (id)noticeHandlerQueue;
+ (id)signingQueue;
- (NSArray)highlights;
- (NSCache)fileURLToShareURLCache;
- (NSCache)identifierToCollaborationHighlightCache;
- (NSCache)pendingClearCache;
- (NSCache)pendingEventCache;
- (NSCache)supplementaryURLToCollaborationHighlightCache;
- (NSCache)urlToCollaborationHighlightCache;
- (NSCache)urlToHighlightCache;
- (NSString)variant;
- (OS_dispatch_queue)_highlightArrayQueue;
- (SLDServiceProxy)cloudDocsServiceProxy;
- (SLDServiceProxy)noticeServiceProxy;
- (SLHighlightCenter)_highlightCenterAdapter;
- (SWCollaborationHighlight)collaborationHighlightForIdentifier:(SWCollaborationIdentifier)collaborationIdentifier error:(NSError *)error;
- (SWHighlightCenter)init;
- (SWHighlightCenter)initWithAppIdentifier:(id)a3;
- (double)highlightsRankingScore;
- (id)_attributionIdentifiersForHighlight:(id)a3;
- (id)_fetchHighlightFromAnyCacheForURL:(id)a3;
- (id)_sandboxExtensionIssueFileURL:(id)a3 withAuditToken:(id *)a4;
- (id)collaborationHighlightForURL:(id)a3 error:(id *)a4;
- (id)delegate;
- (id)fetchAttributionForAttributionIdentifier:(id)a3;
- (id)fetchAttributionsForHighlight:(id)a3;
- (id)getShareURLForFileURL:(id)a3;
- (id)highlightForURL:(id)a3 error:(id *)a4;
- (id)originalSenderForCollaborationHighlight:(id)a3;
- (void)_disconnectNoticeServiceConnectionIfNecessary;
- (void)_getCollaborationHighlightForShareURL:(id)a3 fileURL:(id)a4 completionHandler:(id)a5;
- (void)_getShareURLForFileURL:(id)a3 completionHandler:(id)a4;
- (void)_notifyDelegateHighlightsDidChange;
- (void)_processClearNoticesFor:(id)a3;
- (void)_processPendingHighlightEvent:(id)a3;
- (void)_sendCurrentClearNoticesToDaemonAndDisconnect;
- (void)_sendCurrentNoticesToDaemonAndDisconnect;
- (void)apiAdapterHighlightsDidChange:(id)a3;
- (void)clearNoticesForHighlight:(SWCollaborationHighlight *)highlight;
- (void)getCollaborationHighlightForURL:(NSURL *)URL completionHandler:(void *)completionHandler;
- (void)getHighlightForURL:(NSURL *)URL completionHandler:(void *)completionHandler;
- (void)getSignedIdentityProofForCollaborationHighlight:(SWCollaborationHighlight *)collaborationHighlight usingData:(NSData *)data completionHandler:(void *)completionHandler;
- (void)postNoticeForHighlightEvent:(id)event;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setCloudDocsServiceProxy:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setFileURLToShareURLCache:(id)a3;
- (void)setIdentifierToCollaborationHighlightCache:(id)a3;
- (void)setNoticeServiceProxy:(id)a3;
- (void)setPendingClearCache:(id)a3;
- (void)setPendingEventCache:(id)a3;
- (void)setSupplementaryURLToCollaborationHighlightCache:(id)a3;
- (void)setUrlToCollaborationHighlightCache:(id)a3;
- (void)setUrlToHighlightCache:(id)a3;
- (void)setVariant:(id)a3;
@end

@implementation SWHighlightCenter

void __44__SWHighlightCenter_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) noticeServiceProxy];

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) _sendCurrentNoticesToDaemonAndDisconnect];
    v4 = *(void **)(a1 + 40);
    [v4 _sendCurrentClearNoticesToDaemonAndDisconnect];
  }
}

void __39__SWHighlightCenter_noticeHandlerQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SharedWithYou.NoticeHandlerQueue", v2);
  v1 = (void *)noticeHandlerQueue__noticeHandlerQueue;
  noticeHandlerQueue__noticeHandlerQueue = (uint64_t)v0;
}

void __39__SWHighlightCenter_shareURLFetchQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SharedWithYou.SWShareURLFetchQueue", v2);
  v1 = (void *)shareURLFetchQueue_shareURLFetchQueue;
  shareURLFetchQueue_shareURLFetchQueue = (uint64_t)v0;
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = [(SWHighlightCenter *)self highlights];
    uint64_t v7 = [v6 count];

    v5 = obj;
    if (v7)
    {
      [(SWHighlightCenter *)self _notifyDelegateHighlightsDidChange];
      v5 = obj;
    }
  }
}

- (NSArray)highlights
{
  v2 = [(SWHighlightCenter *)self _highlightCenterAdapter];
  v3 = [v2 highlights];
  v4 = +[SWHighlight highlightsForSLHighlights:v3];

  return (NSArray *)v4;
}

- (SLHighlightCenter)_highlightCenterAdapter
{
  return self->__highlightCenterAdapter;
}

- (void)serviceProxyDidConnect:(id)a3
{
  id v4 = a3;
  v5 = +[SWHighlightCenter noticeHandlerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SWHighlightCenter_serviceProxyDidConnect___block_invoke;
  v7[3] = &unk_1E5665BF0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (SLDServiceProxy)noticeServiceProxy
{
  v3 = +[SWHighlightCenter noticeHandlerQueue];
  dispatch_assert_queue_V2(v3);

  noticeServiceProxy = self->_noticeServiceProxy;
  if (!noticeServiceProxy)
  {
    v5 = (void *)MEMORY[0x1E4FA5640];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = +[SWHighlightCenter noticeHandlerQueue];
    id v8 = [v5 proxyForServiceClass:v6 targetSerialQueue:v7 delegate:self];
    v9 = self->_noticeServiceProxy;
    self->_noticeServiceProxy = v8;

    noticeServiceProxy = self->_noticeServiceProxy;
  }

  return noticeServiceProxy;
}

+ (id)noticeHandlerQueue
{
  if (noticeHandlerQueue_onceToken != -1) {
    dispatch_once(&noticeHandlerQueue_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)noticeHandlerQueue__noticeHandlerQueue;

  return v2;
}

- (SWHighlightCenter)initWithAppIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWHighlightCenter;
  v5 = [(SWHighlightCenter *)&v13 init];
  if (v5)
  {
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SharedWithYou.HighlightArrayQueue", v6);
    highlightArrayQueue = v5->__highlightArrayQueue;
    v5->__highlightArrayQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FA5658]) initWithAppIdentifier:v4 apiAdapterDelegate:v5];
    highlightCenterAdapter = v5->__highlightCenterAdapter;
    v5->__highlightCenterAdapter = (SLHighlightCenter *)v9;

    v11 = [(SWHighlightCenter *)v5 cloudDocsServiceProxy];
    [v11 connect];
  }
  return v5;
}

- (SLDServiceProxy)cloudDocsServiceProxy
{
  cloudDocsServiceProxy = self->_cloudDocsServiceProxy;
  if (!cloudDocsServiceProxy)
  {
    id v4 = (void *)MEMORY[0x1E4FA5640];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = +[SWHighlightCenter shareURLFetchQueue];
    dispatch_queue_t v7 = [v4 proxyForServiceClass:v5 targetSerialQueue:v6 delegate:self];
    id v8 = self->_cloudDocsServiceProxy;
    self->_cloudDocsServiceProxy = v7;

    cloudDocsServiceProxy = self->_cloudDocsServiceProxy;
  }

  return cloudDocsServiceProxy;
}

+ (OS_dispatch_queue)shareURLFetchQueue
{
  if (shareURLFetchQueue_onceToken != -1) {
    dispatch_once(&shareURLFetchQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)shareURLFetchQueue_shareURLFetchQueue;

  return (OS_dispatch_queue *)v2;
}

- (SWHighlightCenter)init
{
  return [(SWHighlightCenter *)self initWithAppIdentifier:0];
}

+ (NSString)highlightCollectionTitle
{
  return (NSString *)[MEMORY[0x1E4FA5658] displayName];
}

+ (BOOL)isSystemCollaborationSupportAvailable
{
  return 1;
}

+ (BOOL)isEnabled
{
  return [MEMORY[0x1E4FA5658] isEnabled];
}

+ (id)SWVariantDefault
{
  return (id)[MEMORY[0x1E4FA5658] SLVariantDefault];
}

+ (id)SWVariantNewsToday
{
  return (id)[MEMORY[0x1E4FA5658] SLVariantNewsToday];
}

+ (id)signingQueue
{
  if (signingQueue_onceToken != -1) {
    dispatch_once(&signingQueue_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)signingQueue_signingQueue;

  return v2;
}

void __33__SWHighlightCenter_signingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SharedWithYou.SigningQueue", v2);
  v1 = (void *)signingQueue_signingQueue;
  signingQueue_signingQueue = (uint64_t)v0;
}

- (NSCache)urlToHighlightCache
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(NSCache *)self->_urlToHighlightCache allObjects];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [(SWHighlightCenter *)self highlights];
  uint64_t v6 = [v5 count];

  if (v4 != v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [(SWHighlightCenter *)self highlights];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = [v13 URL];
          [v7 setObject:v13 forKey:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [(SWHighlightCenter *)self setUrlToHighlightCache:v7];
  }
  urlToHighlightCache = self->_urlToHighlightCache;

  return urlToHighlightCache;
}

- (NSCache)urlToCollaborationHighlightCache
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(NSCache *)self->_urlToCollaborationHighlightCache allObjects];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [(SWHighlightCenter *)self highlights];
  uint64_t v6 = [v5 count];

  if (v4 != v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = [(SWHighlightCenter *)self highlights];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
            v15 = [v14 URL];
            v16 = SLURLMinusFragmentForCKURLs();
            [v7 setObject:v14 forKey:v16];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [(SWHighlightCenter *)self setUrlToCollaborationHighlightCache:v7];
  }
  urlToCollaborationHighlightCache = self->_urlToCollaborationHighlightCache;

  return urlToCollaborationHighlightCache;
}

- (NSCache)supplementaryURLToCollaborationHighlightCache
{
  supplementaryURLToCollaborationHighlightCache = self->_supplementaryURLToCollaborationHighlightCache;
  if (!supplementaryURLToCollaborationHighlightCache)
  {
    uint64_t v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v5 = self->_supplementaryURLToCollaborationHighlightCache;
    self->_supplementaryURLToCollaborationHighlightCache = v4;

    [(NSCache *)self->_supplementaryURLToCollaborationHighlightCache setCountLimit:50];
    supplementaryURLToCollaborationHighlightCache = self->_supplementaryURLToCollaborationHighlightCache;
  }

  return supplementaryURLToCollaborationHighlightCache;
}

- (NSCache)fileURLToShareURLCache
{
  fileURLToShareURLCache = self->_fileURLToShareURLCache;
  if (!fileURLToShareURLCache)
  {
    uint64_t v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v5 = self->_fileURLToShareURLCache;
    self->_fileURLToShareURLCache = v4;

    [(NSCache *)self->_fileURLToShareURLCache setCountLimit:50];
    fileURLToShareURLCache = self->_fileURLToShareURLCache;
  }

  return fileURLToShareURLCache;
}

- (NSCache)identifierToCollaborationHighlightCache
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(NSCache *)self->_identifierToCollaborationHighlightCache allObjects];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [(SWHighlightCenter *)self highlights];
  uint64_t v6 = [v5 count];

  if (v4 != v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = [(SWHighlightCenter *)self highlights];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
            v15 = [v14 collaborationIdentifier];
            [v7 setObject:v14 forKey:v15];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(SWHighlightCenter *)self setIdentifierToCollaborationHighlightCache:v7];
  }
  identifierToCollaborationHighlightCache = self->_identifierToCollaborationHighlightCache;

  return identifierToCollaborationHighlightCache;
}

- (NSCache)pendingEventCache
{
  pendingEventCache = self->_pendingEventCache;
  if (!pendingEventCache)
  {
    uint64_t v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v5 = self->_pendingEventCache;
    self->_pendingEventCache = v4;

    pendingEventCache = self->_pendingEventCache;
  }

  return pendingEventCache;
}

- (NSCache)pendingClearCache
{
  pendingClearCache = self->_pendingClearCache;
  if (!pendingClearCache)
  {
    uint64_t v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v5 = self->_pendingClearCache;
    self->_pendingClearCache = v4;

    pendingClearCache = self->_pendingClearCache;
  }

  return pendingClearCache;
}

- (void)getSignedIdentityProofForCollaborationHighlight:(SWCollaborationHighlight *)collaborationHighlight usingData:(NSData *)data completionHandler:(void *)completionHandler
{
  id v7 = collaborationHighlight;
  id v8 = completionHandler;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4FA5618];
  uint64_t v10 = data;
  id v11 = [v9 alloc];
  uint64_t v12 = +[SWHighlightCenter signingQueue];
  objc_super v13 = (void *)[v11 initWithTargetSerialQueue:v12 synchronous:1];

  id v14 = [(SWCollaborationHighlight *)v7 localIdentity];
  v15 = [v14 trackingPreventionSalt];

  if (!v15)
  {
    long long v17 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter getSignedIdentityProofForCollaborationHighlight:usingData:completionHandler:](v7);
    }
    goto LABEL_7;
  }
  v16 = [(SWCollaborationHighlight *)v7 localProofOfInclusion];

  if (!v16)
  {
    long long v17 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter getSignedIdentityProofForCollaborationHighlight:usingData:completionHandler:](v7);
    }
LABEL_7:
  }
  long long v18 = [(SWCollaborationHighlight *)v7 collaborationIdentifier];
  long long v19 = [(SWCollaborationHighlight *)v7 localIdentity];
  long long v20 = [v19 trackingPreventionSalt];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__SWHighlightCenter_getSignedIdentityProofForCollaborationHighlight_usingData_completionHandler___block_invoke;
  v23[3] = &unk_1E5665A38;
  uint64_t v24 = v7;
  id v25 = v8;
  id v21 = v8;
  long long v22 = v7;
  [v13 signData:v10 forCollaborationIdentifier:v18 trackingPreventionSalt:v20 timeout:v23 completion:3.0];
}

void __97__SWHighlightCenter_getSignedIdentityProofForCollaborationHighlight_usingData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"Unable to sign data.";
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    objc_super v13 = (__CFString **)v19;
    id v14 = &v18;
LABEL_6:
    v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    uint64_t v10 = [v11 errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:1 userInfo:v15];

    uint64_t v9 = 0;
    goto LABEL_7;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F3BDD0]);
  id v8 = [*(id *)(a1 + 32) localProofOfInclusion];
  uint64_t v9 = (void *)[v7 initWithPersonIdentityProof:v8 signatureData:v5];

  if (!v9)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    long long v17 = @"Unable to create a signed identity proof.";
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    objc_super v13 = &v17;
    id v14 = &v16;
    goto LABEL_6;
  }
  uint64_t v10 = 0;
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearNoticesForHighlight:(SWCollaborationHighlight *)highlight
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = highlight;
  id v5 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SWHighlightCenter clearNoticesForHighlight:]";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_INFO, "%s: received clearNotices for highlight: %@", (uint8_t *)&v6, 0x16u);
  }

  [(SWHighlightCenter *)self _processClearNoticesFor:v4];
}

- (void)postNoticeForHighlightEvent:(id)event
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = event;
  id v5 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SWHighlightCenter postNoticeForHighlightEvent:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_INFO, "%s: received postNoticeForHighlightEvent for event: %@", (uint8_t *)&v7, 0x16u);
  }

  if (+[_SWHighlightEventAllowList eventTypeForClass:objc_opt_class()])
  {
    [(SWHighlightCenter *)self _processPendingHighlightEvent:v4];
  }
  else
  {
    int v6 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter postNoticeForHighlightEvent:]();
    }
  }
}

- (id)fetchAttributionForAttributionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SWHighlightCenter *)self _highlightCenterAdapter];
  int v6 = [v5 fetchAttributionForAttributionIdentifier:v4];

  return v6;
}

- (id)originalSenderForCollaborationHighlight:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 attributions],
        int v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    __int16 v8 = [v5 attributions];
    unint64_t v9 = [v8 count];

    if (v9 >= 2)
    {
      id v10 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v27 = 136315138;
        v28 = "-[SWHighlightCenter originalSenderForCollaborationHighlight:]";
        _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_INFO, "%s: Found more than 1 attributions for the highlight, defaulting to the first.", (uint8_t *)&v27, 0xCu);
      }
    }
    uint64_t v11 = [v5 attributions];
    uint64_t v12 = [v11 firstObject];
    objc_super v13 = [v12 uniqueIdentifier];

    id v14 = [v5 earliestAttributionIdentifiers];
    v15 = [v14 objectForKey:v13];
    uint64_t v16 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v27 = 136315394;
      v28 = "-[SWHighlightCenter originalSenderForCollaborationHighlight:]";
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_18FB18000, v16, OS_LOG_TYPE_INFO, "%s: Refetching Earliest attribution with ID: %@.", (uint8_t *)&v27, 0x16u);
    }

    long long v17 = [(SWHighlightCenter *)self fetchAttributionForAttributionIdentifier:v15];
    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F3BE10]);
      long long v19 = [v17 sender];
      long long v20 = [v19 handle];
      id v21 = [v17 sender];
      long long v22 = [v21 displayName];
      uint64_t v23 = (void *)[v18 initWithHandle:v20 identity:0 displayName:v22 thumbnailImageData:0];

      uint64_t v24 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v27 = 136315394;
        v28 = "-[SWHighlightCenter originalSenderForCollaborationHighlight:]";
        __int16 v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_18FB18000, v24, OS_LOG_TYPE_INFO, "%s: Returning original sender %@.", (uint8_t *)&v27, 0x16u);
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    id v25 = v23;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)fetchAttributionsForHighlight:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SWHighlightCenter *)self _highlightCenterAdapter];
  int v6 = [v4 slHighlight];
  uint64_t v7 = [(id)v5 fetchAttributionsForHighlight:v6];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5) {
    __int16 v8 = [[SWCollaborationHighlight alloc] initWithSLCollaborationHighlight:v7];
  }
  else {
    __int16 v8 = [[SWHighlight alloc] initWithSLHighlight:v7];
  }
  unint64_t v9 = v8;

  return v9;
}

- (double)highlightsRankingScore
{
  v2 = [(SWHighlightCenter *)self _highlightCenterAdapter];
  [v2 highlightsRankingScore];
  double v4 = v3;

  return v4;
}

- (void)_getShareURLForFileURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([v6 isFileURL])
  {
    __int16 v8 = [(SWHighlightCenter *)self fileURLToShareURLCache];
    unint64_t v9 = [v8 objectForKey:v6];

    if (v9)
    {
      id v10 = [(SWHighlightCenter *)self fileURLToShareURLCache];
      uint64_t v11 = [v10 objectForKey:v6];

      uint64_t v12 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        long long v19 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]";
        __int16 v20 = 2112;
        id v21 = v11;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_18FB18000, v12, OS_LOG_TYPE_INFO, "%s: Found cached shareURL: %@ for URL: %@.", buf, 0x20u);
      }

      v7[2](v7, v11);
    }
    else
    {
      id v14 = +[SWHighlightCenter shareURLFetchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke;
      block[3] = &unk_1E5665970;
      block[4] = self;
      id v16 = v6;
      long long v17 = v7;
      dispatch_async(v14, block);
    }
  }
  else
  {
    objc_super v13 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v19 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]";
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_18FB18000, v13, OS_LOG_TYPE_INFO, "%s: URL passed in NOT a file URL: %@.", buf, 0x16u);
    }

    v7[2](v7, 0);
  }
}

void __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cloudDocsServiceProxy];
  double v3 = [v2 synchronousRemoteService];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x4010000000;
  id v23 = &unk_18FB6200D;
  long long v24 = 0u;
  long long v25 = 0u;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2;
  v19[3] = &unk_1E5665A60;
  v19[4] = &v20;
  [v3 prepareConnectionWithReply:v19];
  double v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = *((_OWORD *)v21 + 3);
  *(_OWORD *)buf = *((_OWORD *)v21 + 2);
  *(_OWORD *)&buf[16] = v6;
  uint64_t v7 = [v4 _sandboxExtensionIssueFileURL:v5 withAuditToken:buf];
  if (v7)
  {
    __int16 v8 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v7;
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_INFO, "%s: Sending request to fetch the shareURL for URL: %@. tokenData: %@", buf, 0x20u);
    }

    if (objc_opt_respondsToSelector())
    {
      id v10 = *(void **)(a1 + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_102;
      v15[3] = &unk_1E5665A88;
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 32);
      id v16 = v11;
      uint64_t v17 = v12;
      id v18 = *(id *)(a1 + 48);
      [v3 shareURLForFileURL:v11 sandboxTokenData:v7 reply:v15];
    }
  }
  else
  {
    objc_super v13 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_18FB18000, v13, OS_LOG_TYPE_INFO, "%s: Failed to get tokendata for URL: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(&v20, 8);
}

void __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 auditToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;
}

void __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2_103;
  v8[3] = &unk_1E5665890;
  id v9 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __62__SWHighlightCenter__getShareURLForFileURL_completionHandler___block_invoke_2_103(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = SWFrameworkLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 136315650;
      id v12 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke_2";
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_INFO, "%s: Obtained shareURL: %@ for URL: %@.", (uint8_t *)&v11, 0x20u);
    }

    id v7 = [*(id *)(a1 + 48) fileURLToShareURLCache];
    [v7 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

    __int16 v8 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (v4)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 136315394;
      id v12 = "-[SWHighlightCenter _getShareURLForFileURL:completionHandler:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_INFO, "%s: Failed to fetch shareURL for URL: %@.", (uint8_t *)&v11, 0x16u);
    }

    __int16 v8 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  return v8();
}

- (void)_getCollaborationHighlightForShareURL:(id)a3 fileURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (v8 && v9)
  {
    int v11 = [(SWHighlightCenter *)self supplementaryURLToCollaborationHighlightCache];
    id v12 = [v11 objectForKey:v8];

    if (v12)
    {
      __int16 v13 = [(SWHighlightCenter *)self supplementaryURLToCollaborationHighlightCache];
      uint64_t v14 = [v13 objectForKey:v8];

      __int16 v15 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v23 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]";
        __int16 v24 = 2112;
        long long v25 = v14;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_18FB18000, v15, OS_LOG_TYPE_DEFAULT, "%s: Found cached highlight: %@ for URL: %@.", buf, 0x20u);
      }

      v10[2](v10, v14);
    }
    else
    {
      uint64_t v17 = +[SWHighlightCenter shareURLFetchQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke;
      v18[3] = &unk_1E5665890;
      v18[4] = self;
      id v19 = v9;
      id v20 = v8;
      id v21 = v10;
      dispatch_async(v17, v18);
    }
  }
  else
  {
    uint64_t v16 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]();
    }

    v10[2](v10, 0);
  }
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cloudDocsServiceProxy];
  id v3 = [v2 synchronousRemoteService];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x4010000000;
  v40 = &unk_18FB6200D;
  long long v41 = 0u;
  long long v42 = 0u;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2;
  v36[3] = &unk_1E5665A60;
  v36[4] = &v37;
  [v3 prepareConnectionWithReply:v36];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 32);
  long long v6 = *((_OWORD *)v38 + 3);
  *(_OWORD *)buf = *((_OWORD *)v38 + 2);
  *(_OWORD *)&buf[16] = v6;
  id v7 = [v5 _sandboxExtensionIssueFileURL:v4 withAuditToken:buf];
  if (!v7)
  {
    uint64_t v16 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_cold_1();
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_112;
    v27[3] = &unk_1E5665B00;
    __int16 v15 = &v28;
    id v28 = *(id *)(a1 + 56);
    uint64_t v17 = MEMORY[0x1E4F14428];
    id v18 = v27;
    goto LABEL_12;
  }
  id v8 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v10;
    __int16 v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending request to fetch the collaboration highlight for shareURL: %@ fileURL: %@ tokenData: %@", buf, 0x2Au);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v19 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_111;
    block[3] = &unk_1E5665B00;
    __int16 v15 = &v30;
    id v30 = *(id *)(a1 + 56);
    uint64_t v17 = MEMORY[0x1E4F14428];
    id v18 = block;
LABEL_12:
    dispatch_async(v17, v18);
    goto LABEL_13;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  int v11 = *(void **)(a1 + 48);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_108;
  v31[3] = &unk_1E5665AD8;
  id v32 = v11;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v33 = v13;
  uint64_t v34 = v14;
  id v35 = *(id *)(a1 + 56);
  [v3 getCollaborationHighlightForShareURL:v32 fileURL:v12 sandboxTokenData:v7 reply:v31];

  __int16 v15 = &v32;
LABEL_13:

  _Block_object_dispose(&v37, 8);
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 auditToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_108(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_109;
  block[3] = &unk_1E5665AB0;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  long long v6 = *(void **)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_109(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = SWFrameworkLogHandle();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v10 = 136315906;
      id v11 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke_2";
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "%s: Obtained collaborationHighlight: %@ for shareURL: %@ fileURL: %@", (uint8_t *)&v10, 0x2Au);
    }

    id v8 = [[SWCollaborationHighlight alloc] initWithSLCollaborationHighlight:*(void *)(a1 + 32)];
    id v9 = [*(id *)(a1 + 56) supplementaryURLToCollaborationHighlightCache];
    [v9 setObject:v8 forKey:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_109_cold_1(a1, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_112(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getHighlightForURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = URL;
  uint64_t v7 = completionHandler;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5665A88;
  aBlock[4] = self;
  id v8 = v6;
  id v27 = v8;
  id v9 = v7;
  id v28 = v9;
  int v10 = _Block_copy(aBlock);
  id v11 = [(SWHighlightCenter *)self urlToHighlightCache];
  __int16 v12 = [v11 allObjects];
  uint64_t v13 = [v12 count];

  __int16 v14 = SWFrameworkLogHandle();
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SWHighlightCenter getHighlightForURL:completionHandler:]";
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_18FB18000, v15, OS_LOG_TYPE_INFO, "%s: Fetching highlight for URL: %@.", buf, 0x16u);
    }

    __int16 v16 = SLURLMinusFragmentForCKURLs();
    if ([v16 isFileURL])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_117;
      v24[3] = &unk_1E5665B28;
      id v25 = v10;
      [(SWHighlightCenter *)self _getShareURLForFileURL:v16 completionHandler:v24];
    }
    else
    {
      (*((void (**)(void *, void *))v10 + 2))(v10, v16);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter getHighlightForURL:completionHandler:](v15, v17, v18, v19, v20, v21, v22, v23);
    }

    (*((void (**)(void *, NSURL *))v10 + 2))(v10, v8);
  }
}

void __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!v3
    || ([v3 scheme], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v6 = (void *)v5,
        [v4 host],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    id v11 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_cold_1();
    }

    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:0];
    goto LABEL_9;
  }
  id v8 = [*(id *)(a1 + 32) urlToHighlightCache];
  id v9 = [v8 objectForKey:v4];

  if (!v9)
  {
    __int16 v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = [NSString stringWithFormat:@"Highlight not found or hasn't yet been loaded for: %@", v4, *MEMORY[0x1E4F28228]];
    v16[0] = v13;
    __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    int v10 = [v12 errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:v14];

LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  int v10 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCollaborationHighlightForURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = URL;
  uint64_t v7 = completionHandler;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5665A88;
  aBlock[4] = self;
  id v8 = v6;
  uint64_t v22 = v8;
  id v9 = v7;
  id v23 = v9;
  int v10 = _Block_copy(aBlock);
  id v11 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SWHighlightCenter getCollaborationHighlightForURL:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "%s: Fetching collaboration highlight for URL: %@.", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  SLURLMinusFragmentForCKURLs();
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(*(void *)&buf[8] + 40) isFileURL])
  {
    uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_121;
    v19[3] = &unk_1E5665BA0;
    v19[4] = self;
    id v20 = v10;
    [(SWHighlightCenter *)self _getShareURLForFileURL:v12 completionHandler:v19];
  }
  else
  {
    uint64_t v13 = [(SWHighlightCenter *)self _highlightCenterAdapter];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_123;
    v16[3] = &unk_1E5665BC8;
    uint64_t v18 = buf;
    id v17 = v10;
    uint64_t v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
    [v13 runAfterInitialFetch:v16 onQueue:v14];
  }
  _Block_object_dispose(buf, 8);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  if (!v3
    || ([v3 scheme], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([v4 host],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = v6 == 0,
        v6,
        v5,
        v7))
  {
    id v11 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_1();
    }

    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:0];
    uint64_t v13 = (void *)v35[5];
    v35[5] = v12;
    goto LABEL_9;
  }
  id v8 = [*(id *)(a1 + 32) urlToCollaborationHighlightCache];
  uint64_t v9 = [v8 objectForKey:v4];
  int v10 = (void *)v29[5];
  v29[5] = v9;

  if (v29[5])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  uint64_t v14 = [v4 absoluteString];
  int v15 = [v14 containsString:@"www.icloud.com/iclouddrive"];

  if (!v15)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28228];
    uint64_t v13 = [NSString stringWithFormat:@"Highlight not found or hasn't yet been loaded for: %@", v4];
    v41[0] = v13;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v21 = [v19 errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:v20];
    uint64_t v22 = (void *)v35[5];
    v35[5] = v21;

LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  __int16 v16 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_2();
  }

  id v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_118;
  v23[3] = &unk_1E5665B50;
  uint64_t v26 = &v28;
  id v27 = &v34;
  id v24 = v4;
  id v25 = *(id *)(a1 + 48);
  [v17 _getCollaborationHighlightForShareURL:v24 fileURL:v18 completionHandler:v23];

LABEL_10:
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_118(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = [NSString stringWithFormat:@"Highlight not found or hasn't yet been loaded for: %@", a1[4], *MEMORY[0x1E4F28228]];
    v12[0] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = [v5 errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:v7];
    uint64_t v9 = *(void *)(a1[7] + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_121(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _highlightCenterAdapter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5665B78;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 runAfterInitialFetch:v6 onQueue:MEMORY[0x1E4F14428]];
}

uint64_t __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = SWFrameworkLogHandle();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v14 = 138412290;
    uint64_t v15 = v12;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "getCollaborationHighlightForURL: highlight center has finished its first fetch. Now performing lookup for URL: %@.", (uint8_t *)&v14, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_123(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = SWFrameworkLogHandle();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_123_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "getCollaborationHighlightForURL: highlight center has finished its first fetch. Now performing lookup for URL: %@.", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SWCollaborationHighlight)collaborationHighlightForIdentifier:(SWCollaborationIdentifier)collaborationIdentifier error:(NSError *)error
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = collaborationIdentifier;
  uint64_t v7 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[SWHighlightCenter collaborationHighlightForIdentifier:error:]";
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "%s: Fetching collaboration highlight for identifier: %@.", (uint8_t *)&v12, 0x16u);
  }

  if (v6)
  {
    int v8 = [(SWHighlightCenter *)self identifierToCollaborationHighlightCache];
    uint64_t v9 = [v8 objectForKey:v6];
  }
  else if (error)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:0];
    uint64_t v9 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[SWHighlightCenter collaborationHighlightForIdentifier:error:]";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_DEFAULT, "%s: Returning highlight: %@.", (uint8_t *)&v12, 0x16u);
  }

  return (SWCollaborationHighlight *)v9;
}

- (void)_notifyDelegateHighlightsDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SWHighlightCenter__notifyDelegateHighlightsDidChange__block_invoke;
  block[3] = &unk_1E5665868;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__SWHighlightCenter__notifyDelegateHighlightsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 highlightCenterHighlightsDidChange:*(void *)(a1 + 32)];
    }
  }
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  id v4 = a3;
  char v5 = +[SWHighlightCenter noticeHandlerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SWHighlightCenter_serviceProxyDidDisconnect___block_invoke;
  v7[3] = &unk_1E5665BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__SWHighlightCenter_serviceProxyDidDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) noticeServiceProxy];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 40) pendingEventCache];
    char v5 = [v4 allObjects];
    if ([v5 count])
    {
    }
    else
    {
      id v6 = [*(id *)(a1 + 40) pendingClearCache];
      uint64_t v7 = [v6 allObjects];
      uint64_t v8 = [v7 count];

      if (!v8) {
        return;
      }
    }
    id v9 = [*(id *)(a1 + 40) noticeServiceProxy];
    [v9 connect];
  }
}

- (id)_fetchHighlightFromAnyCacheForURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = SLURLMinusFragmentForCKURLs();
  char v5 = [(SWHighlightCenter *)self urlToHighlightCache];
  id v6 = [v5 objectForKey:v4];
  uint64_t v7 = (void *)[v6 copy];

  if (v7)
  {
    uint64_t v8 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      id v20 = "-[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:]";
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_INFO, "%s: Returning highlight from urlToHighlightCache", (uint8_t *)&v19, 0xCu);
    }

    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(SWHighlightCenter *)self urlToCollaborationHighlightCache];
    uint64_t v11 = [v10 objectForKey:v4];
    int v12 = (void *)[v11 copy];

    if (v12)
    {
      uint64_t v13 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315138;
        id v20 = "-[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:]";
        _os_log_impl(&dword_18FB18000, v13, OS_LOG_TYPE_INFO, "%s: Returning highlight from urlToCollaborationHighlightCache", (uint8_t *)&v19, 0xCu);
      }

      id v9 = v12;
    }
    else
    {
      __int16 v14 = [(SWHighlightCenter *)self supplementaryURLToCollaborationHighlightCache];
      uint64_t v15 = [v14 objectForKey:v4];
      id v9 = (id)[v15 copy];

      if (v9)
      {
        uint64_t v16 = SWFrameworkLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v19 = 136315138;
          id v20 = "-[SWHighlightCenter _fetchHighlightFromAnyCacheForURL:]";
          _os_log_impl(&dword_18FB18000, v16, OS_LOG_TYPE_INFO, "%s: Returning highlight from supplementaryURLToCollaborationHighlightCache", (uint8_t *)&v19, 0xCu);
        }

        id v17 = v9;
      }
    }
  }

  return v9;
}

- (void)_processPendingHighlightEvent:(id)a3
{
  id v4 = a3;
  char v5 = [v4 highlightURL];
  id v6 = [(SWHighlightCenter *)self _fetchHighlightFromAnyCacheForURL:v5];

  if (v6)
  {
    uint64_t v7 = +[SWCachedHighlightEvent cachedEvent:v4 forHighlight:v6];
    uint64_t v8 = [v7 copy];

    if (v8)
    {
      id v9 = +[SWHighlightCenter noticeHandlerQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__SWHighlightCenter__processPendingHighlightEvent___block_invoke;
      v11[3] = &unk_1E5665BF0;
      v11[4] = self;
      uint64_t v8 = v8;
      int v12 = v8;
      dispatch_async(v9, v11);
    }
    else
    {
      uint64_t v10 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SWHighlightCenter _processPendingHighlightEvent:]();
      }
    }
  }
  else
  {
    uint64_t v8 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter _processPendingHighlightEvent:]();
    }
  }
}

void __51__SWHighlightCenter__processPendingHighlightEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingEventCache];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKey:v4];

  char v5 = [*(id *)(a1 + 32) noticeServiceProxy];
  LODWORD(v3) = [v5 connectionActive];

  id v6 = *(void **)(a1 + 32);
  if (v3)
  {
    [v6 _sendCurrentNoticesToDaemonAndDisconnect];
  }
  else
  {
    id v7 = [v6 noticeServiceProxy];
    [v7 connect];
  }
}

- (void)_processClearNoticesFor:(id)a3
{
  id v4 = a3;
  char v5 = +[SWHighlightCenter noticeHandlerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SWHighlightCenter__processClearNoticesFor___block_invoke;
  v7[3] = &unk_1E5665BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__SWHighlightCenter__processClearNoticesFor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingClearCache];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 collaborationIdentifier];
  [v2 setObject:v3 forKey:v4];

  char v5 = [*(id *)(a1 + 32) noticeServiceProxy];
  LODWORD(v3) = [v5 connectionActive];

  id v6 = *(void **)(a1 + 32);
  if (v3)
  {
    [v6 _sendCurrentClearNoticesToDaemonAndDisconnect];
  }
  else
  {
    id v7 = [v6 noticeServiceProxy];
    [v7 connect];
  }
}

- (void)_sendCurrentClearNoticesToDaemonAndDisconnect
{
  id v3 = +[SWHighlightCenter noticeHandlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke;
  block[3] = &unk_1E5665868;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) noticeServiceProxy];
  int v4 = [v3 connectionActive];

  char v5 = [*v2 noticeServiceProxy];
  id obj = v5;
  if (v4)
  {
    __int16 v31 = [v5 synchronousRemoteService];

    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      id v6 = [*(id *)(a1 + 32) pendingClearCache];
      id v7 = [v6 allObjects];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F1C978] array];
      }
      uint64_t v10 = v9;

      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3032000000;
      v38[3] = __Block_byref_object_copy_;
      v38[4] = __Block_byref_object_dispose_;
      id v39 = (id)[v10 mutableCopy];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obja = v10;
      uint64_t v11 = [obja countByEnumeratingWithState:&v34 objects:v45 count:16];
      if (v11)
      {
        uint64_t v13 = *(void *)v35;
        *(void *)&long long v12 = 136315394;
        long long v28 = v12;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(obja);
            }
            uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "_attributionIdentifiersForHighlight:", v15, v28);
            if (![v16 count])
            {
              id v20 = SWFrameworkLogHandle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
              }

              _Block_object_dispose(v38, 8);
              objc_destroyWeak(&location);
              goto LABEL_23;
            }
            id v17 = SWFrameworkLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = [v15 identifier];
              *(_DWORD *)buf = v28;
              long long v42 = "-[SWHighlightCenter _sendCurrentClearNoticesToDaemonAndDisconnect]_block_invoke";
              __int16 v43 = 2112;
              __int16 v44 = v18;
              _os_log_impl(&dword_18FB18000, v17, OS_LOG_TYPE_INFO, "%s: Sending clear notice for highlight: '%@'", buf, 0x16u);
            }
            int v19 = [v15 collaborationIdentifier];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_130;
            v32[3] = &unk_1E5665C18;
            objc_copyWeak(&v33, &location);
            v32[4] = v15;
            v32[5] = v38;
            [v31 sendClearNoticesFor:v19 forAttributionIdentifiers:v16 reply:v32];

            objc_destroyWeak(&v33);
          }
          uint64_t v11 = [obja countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      _Block_object_dispose(v38, 8);
      objc_destroyWeak(&location);
    }
LABEL_23:
  }
  else
  {
    [v5 connect];
  }
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_130(uint64_t a1, char a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v5 = SWFrameworkLogHandle();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) identifier];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_INFO, "Received success for clear notice for highlight: '%@'", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_130_cold_1(a1, v6);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:*(void *)(a1 + 32)];
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    [WeakRetained _disconnectNoticeServiceConnectionIfNecessary];
  }
}

- (void)_sendCurrentNoticesToDaemonAndDisconnect
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[SWHighlightCenter _sendCurrentNoticesToDaemonAndDisconnect]";
  _os_log_debug_impl(&dword_18FB18000, log, OS_LOG_TYPE_DEBUG, "%s: Not currently connected to notice service. We'll wait for the connection to finish posting pending notices.", (uint8_t *)&v1, 0xCu);
}

void __61__SWHighlightCenter__sendCurrentNoticesToDaemonAndDisconnect__block_invoke(uint64_t a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v5 = SWFrameworkLogHandle();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      long long v12 = v8;
      _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_INFO, "Received success for notice for event: '%@' highlight: '%@'", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __61__SWHighlightCenter__sendCurrentNoticesToDaemonAndDisconnect__block_invoke_cold_1(a1);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:*(void *)(a1 + 32)];
  if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) {
    [WeakRetained _disconnectNoticeServiceConnectionIfNecessary];
  }
}

- (void)_disconnectNoticeServiceConnectionIfNecessary
{
  uint64_t v3 = +[SWHighlightCenter noticeHandlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SWHighlightCenter__disconnectNoticeServiceConnectionIfNecessary__block_invoke;
  block[3] = &unk_1E5665868;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __66__SWHighlightCenter__disconnectNoticeServiceConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = [*(id *)(a1 + 32) pendingEventCache];
  uint64_t v2 = [v8 allObjects];
  if ([v2 count])
  {
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) pendingClearCache];
    int v4 = [v3 allObjects];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      id v6 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v10 = "-[SWHighlightCenter _disconnectNoticeServiceConnectionIfNecessary]_block_invoke";
        _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_INFO, "%s: No more notices to post, disconnecting from service proxy.", buf, 0xCu);
      }

      uint64_t v7 = [*(id *)(a1 + 32) noticeServiceProxy];
      [v7 disconnect];
    }
  }
}

- (id)_attributionIdentifiersForHighlight:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [v4 attributions];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = objc_msgSend(v4, "attributions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          __int16 v14 = [v13 uniqueIdentifier];

          if (v14)
          {
            uint64_t v15 = [v13 uniqueIdentifier];
            [v5 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v8 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter _attributionIdentifiersForHighlight:]((uint64_t)self, v4);
    }
  }

  return v5;
}

- (void)apiAdapterHighlightsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(SWHighlightCenter *)self _highlightCenterAdapter];

  if (v5 == v4)
  {
    [(SWHighlightCenter *)self setUrlToHighlightCache:0];
    [(SWHighlightCenter *)self setSupplementaryURLToCollaborationHighlightCache:0];
    [(SWHighlightCenter *)self setUrlToCollaborationHighlightCache:0];
    [(SWHighlightCenter *)self setIdentifierToCollaborationHighlightCache:0];
    [(SWHighlightCenter *)self _notifyDelegateHighlightsDidChange];
  }
}

- (id)_sandboxExtensionIssueFileURL:(id)a3 withAuditToken:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 path];
  int v7 = [v5 hasDirectoryPath];

  if (v7)
  {
    uint64_t v8 = [v6 stringByAppendingString:@"/"];

    id v6 = (void *)v8;
  }
  id v9 = v6;
  [v9 fileSystemRepresentation];
  long long v13 = *(_OWORD *)a4->var0;
  long long v14 = *(_OWORD *)&a4->var0[4];
  uint64_t v10 = (const char *)sandbox_extension_issue_file_to_process();
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v10, strlen(v10) + 1, 1, v13, v14);
  }

  return v11;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (OS_dispatch_queue)_highlightArrayQueue
{
  return self->__highlightArrayQueue;
}

- (void)setUrlToHighlightCache:(id)a3
{
}

- (void)setUrlToCollaborationHighlightCache:(id)a3
{
}

- (void)setSupplementaryURLToCollaborationHighlightCache:(id)a3
{
}

- (void)setIdentifierToCollaborationHighlightCache:(id)a3
{
}

- (void)setFileURLToShareURLCache:(id)a3
{
}

- (void)setNoticeServiceProxy:(id)a3
{
}

- (void)setPendingEventCache:(id)a3
{
}

- (void)setPendingClearCache:(id)a3
{
}

- (void)setCloudDocsServiceProxy:(id)a3
{
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_cloudDocsServiceProxy, 0);
  objc_storeStrong((id *)&self->_pendingClearCache, 0);
  objc_storeStrong((id *)&self->_pendingEventCache, 0);
  objc_storeStrong((id *)&self->_noticeServiceProxy, 0);
  objc_storeStrong((id *)&self->_fileURLToShareURLCache, 0);
  objc_storeStrong((id *)&self->_identifierToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_supplementaryURLToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_urlToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_urlToHighlightCache, 0);
  objc_storeStrong((id *)&self->__highlightCenterAdapter, 0);
  objc_storeStrong((id *)&self->__highlightArrayQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_highlights, 0);
}

- (id)highlightForURL:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(SWHighlightCenter *)self urlToHighlightCache];
  uint64_t v8 = [v7 allObjects];
  uint64_t v9 = [v8 count];

  uint64_t v10 = SWFrameworkLogHandle();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v28 = 136315394;
      __int16 v29 = "-[SWHighlightCenter(Deprecations) highlightForURL:error:]";
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_INFO, "%s: Fetching collaboration highlight for URL: %@.", (uint8_t *)&v28, 0x16u);
    }

    long long v12 = SLURLMinusFragmentForCKURLs();
    if ([v12 isFileURL])
    {
      uint64_t v13 = [(SWHighlightCenter *)self getShareURLForFileURL:v6];

      long long v12 = (void *)v13;
    }
    if (v12
      && ([v12 scheme], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v15 = (void *)v14,
          [v12 host],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      long long v17 = [(SWHighlightCenter *)self urlToHighlightCache];
      long long v18 = [v17 objectForKey:v12];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:0];
      long long v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v18 = 0;
    }
    uint64_t v11 = v18;

    uint64_t v26 = v11;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter(Deprecations) highlightForURL:error:](v11, v19, v20, v21, v22, v23, v24, v25);
    }
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)collaborationHighlightForURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315394;
    __int16 v30 = "-[SWHighlightCenter(Deprecations) collaborationHighlightForURL:error:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_INFO, "%s: Fetching collaboration highlight for URL: %@.", (uint8_t *)&v29, 0x16u);
  }

  uint64_t v8 = [(SWHighlightCenter *)self urlToCollaborationHighlightCache];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = SLURLMinusFragmentForCKURLs();
    if ([v11 isFileURL])
    {
      uint64_t v12 = [(SWHighlightCenter *)self getShareURLForFileURL:v6];

      uint64_t v11 = (void *)v12;
    }
    if (v11
      && ([v11 scheme], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v14 = (void *)v13,
          [v11 host],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      uint64_t v16 = [(SWHighlightCenter *)self urlToCollaborationHighlightCache];
      long long v17 = [v16 objectForKey:v11];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SharedWithYou.SWHighlightErrorDomain" code:2 userInfo:0];
      long long v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v17 = 0;
    }
    uint64_t v27 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315394;
      __int16 v30 = "-[SWHighlightCenter(Deprecations) collaborationHighlightForURL:error:]";
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_18FB18000, v27, OS_LOG_TYPE_INFO, "%s: Returning highlight: %@.", (uint8_t *)&v29, 0x16u);
    }

    long long v18 = v17;
    uint64_t v26 = v18;
  }
  else
  {
    long long v18 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightCenter(Deprecations) collaborationHighlightForURL:error:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)getShareURLForFileURL:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy_;
  long long v36 = __Block_byref_object_dispose_;
  id v4 = a3;
  id v37 = v4;
  if (([v4 isFileURL] & 1) == 0)
  {
    uint64_t v11 = SWFrameworkLogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    uint64_t v13 = "%s: Obtained URL is NOT a file URL: %@.";
    uint64_t v14 = v11;
    uint32_t v15 = 22;
    goto LABEL_7;
  }
  id v5 = [(SWHighlightCenter *)self fileURLToShareURLCache];
  id v6 = [v5 objectForKey:v4];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    uint64_t v8 = [(SWHighlightCenter *)self fileURLToShareURLCache];
    uint64_t v9 = [v8 objectForKey:v4];
    uint64_t v10 = (void *)v33[5];
    v33[5] = v9;

    uint64_t v11 = SWFrameworkLogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    uint64_t v12 = v33[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v40 = v4;
    uint64_t v13 = "%s: Obtained cached shareURL: %@ for URL: %@.";
    uint64_t v14 = v11;
    uint32_t v15 = 32;
LABEL_7:
    _os_log_impl(&dword_18FB18000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    goto LABEL_18;
  }
  uint64_t v16 = [(SWHighlightCenter *)self cloudDocsServiceProxy];
  [v16 connect];

  long long v17 = [(SWHighlightCenter *)self cloudDocsServiceProxy];
  uint64_t v11 = [v17 synchronousRemoteService];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4010000000;
  uint64_t v40 = &unk_18FB6200D;
  long long v41 = 0u;
  long long v42 = 0u;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke;
  v31[3] = &unk_1E5665A60;
  void v31[4] = buf;
  [v11 prepareConnectionWithReply:v31];
  uint64_t v18 = v33[5];
  long long v19 = *(_OWORD *)(*(void *)&buf[8] + 48);
  *(_OWORD *)v38 = *(_OWORD *)(*(void *)&buf[8] + 32);
  *(_OWORD *)&v38[16] = v19;
  uint64_t v20 = [(SWHighlightCenter *)self _sandboxExtensionIssueFileURL:v18 withAuditToken:v38];
  if (v20)
  {
    uint64_t v21 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = v33[5];
      *(_DWORD *)v38 = 136315650;
      *(void *)&v38[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
      *(_WORD *)&v38[12] = 2112;
      *(void *)&v38[14] = v22;
      *(_WORD *)&v38[22] = 2112;
      *(void *)&v38[24] = v20;
      _os_log_impl(&dword_18FB18000, v21, OS_LOG_TYPE_INFO, "%s: Trying to fetch the shareURL for URL: %@. tokenData: %@", v38, 0x20u);
    }

    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_17;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke_275;
    v27[3] = &unk_1E5665C68;
    int v29 = self;
    __int16 v30 = &v32;
    id v28 = v4;
    [v11 shareURLForFileURL:v28 sandboxTokenData:v20 reply:v27];
    uint64_t v23 = v28;
  }
  else
  {
    uint64_t v24 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v38 = 136315394;
      *(void *)&v38[4] = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]";
      *(_WORD *)&v38[12] = 2112;
      *(void *)&v38[14] = v4;
      _os_log_impl(&dword_18FB18000, v24, OS_LOG_TYPE_INFO, "%s: Failed to get tokendata for URL: %@", v38, 0x16u);
    }

    uint64_t v23 = (void *)v33[5];
    v33[5] = 0;
  }

LABEL_17:
  _Block_object_dispose(buf, 8);
LABEL_18:

  id v25 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v25;
}

void __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 auditToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;
}

void __57__SWHighlightCenter_Deprecations__getShareURLForFileURL___block_invoke_275(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v5 = SWFrameworkLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 136315650;
      uint64_t v12 = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_INFO, "%s: Obtained shareURL: %@ for URL: %@.", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v8 = [*(id *)(a1 + 40) fileURLToShareURLCache];
    [v8 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = *(void **)(a1 + 32);
      int v11 = 136315394;
      uint64_t v12 = "-[SWHighlightCenter(Deprecations) getShareURLForFileURL:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_INFO, "%s: Failed to fetch shareURL for URL: %@.", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

- (void)getSignedIdentityProofForCollaborationHighlight:(void *)a1 usingData:completionHandler:.cold.1(void *a1)
{
  int v1 = [a1 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18FB18000, v2, v3, "%s Local identity for highlight %@ did not contain a tps. This may prevent the client app from verifying the proof of inclusion correctly.", v4, v5, v6, v7, 2u);
}

- (void)getSignedIdentityProofForCollaborationHighlight:(void *)a1 usingData:completionHandler:.cold.2(void *a1)
{
  int v1 = [a1 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18FB18000, v2, v3, "%s Highlight %@ did not contain a local proof of inclusion.", v4, v5, v6, v7, 2u);
}

- (void)postNoticeForHighlightEvent:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  id v1 = v0;
  OUTLINED_FUNCTION_1(&dword_18FB18000, v2, v3, "%s: Event type '%@' is not an allowed type. Dropping notice.", v4, v5, v6, v7, 2u);
}

- (void)_getCollaborationHighlightForShareURL:fileURL:completionHandler:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_18FB18000, v0, v1, "%s: invalid URL passed in shareURL:%@ fileURL: %@.", v2);
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_18FB18000, v0, v1, "%s: Failed to get tokendata for URL: %@", (uint8_t *)v2);
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__SWHighlightCenter__getCollaborationHighlightForShareURL_fileURL_completionHandler___block_invoke_2_109_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 136315650;
  uint64_t v5 = "-[SWHighlightCenter _getCollaborationHighlightForShareURL:fileURL:completionHandler:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_18FB18000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to fetch collaborationHighlight for shareURL: %@ fileURL: %@", (uint8_t *)&v4, 0x20u);
}

- (void)getHighlightForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18FB18000, a1, a3, "%s: No highlights, early return!.", a5, a6, a7, a8, 2u);
}

void __58__SWHighlightCenter_getHighlightForURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_18FB18000, v0, v1, "%s: Failed to fetch a highlight for URL: %@.", (uint8_t *)v2);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_18FB18000, v0, v1, "%s: Failed to fetch a collaboration highlight for URL: %@.", (uint8_t *)v2);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_18FB18000, v0, v1, "%s: Requesting an all collaborations lookup for fileURL: %@ shareURL: %@.", v2);
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__SWHighlightCenter_getCollaborationHighlightForURL_completionHandler___block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2(&dword_18FB18000, v0, v1, "getCollaborationHighlightForURL: timed out waiting for initial fetch of highlights. There may not be highlights in the cache. Now performing lookup for: %@", v2, v3, v4, v5, 2u);
}

- (void)_processPendingHighlightEvent:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_18FB18000, v0, v1, "%s: no current highlight found for highlightEvent: %@. Dropping notice.", (uint8_t *)v2);
}

- (void)_processPendingHighlightEvent:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_18FB18000, v0, v1, "%s: no cached event found for highlightEvent: %@. Dropping notice.", (uint8_t *)v2);
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__SWHighlightCenter__sendCurrentClearNoticesToDaemonAndDisconnect__block_invoke_130_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18FB18000, a2, OS_LOG_TYPE_ERROR, "Unsuccessful sending clear notice for highlight: '%@'", (uint8_t *)&v4, 0xCu);
}

void __61__SWHighlightCenter__sendCurrentNoticesToDaemonAndDisconnect__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
  OUTLINED_FUNCTION_1(&dword_18FB18000, v1, v2, "Unsuccessful sending notice for event: '%@'  highlight: '%@'", v3, v4, v5, v6, 2u);
}

- (void)_attributionIdentifiersForHighlight:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  __int16 v8 = [a2 identifier];
  OUTLINED_FUNCTION_1(&dword_18FB18000, v2, v3, "[SLHighlightPillView: %p] Highlight does not have any attributions! We won't be able to display a pill for this highlight: %@", v4, v5, v6, v7, 2u);
}

@end
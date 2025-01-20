@interface SFBrowserDocumentTrackerInfo
+ (BOOL)trackingPreventionEnabled;
- (NSSet)allowedKnownTrackingThirdParties;
- (NSSet)blockedKnownTrackingThirdParties;
- (NSSet)preventedKnownTrackingThirdParties;
- (SFBrowserDocumentTrackerInfo)initWithDocument:(id)a3;
- (WBSQueryParameterFilteringDataQueue)queryParameterFilteringDataQueue;
- (_SFBrowserDocument)document;
- (void)_flushKnownTrackingThirdParties;
- (void)_resetKnownTrackingThirdParties;
- (void)_updateKnownTrackingThirdPartiesWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)documentDidCommitNavigation;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateKnownTrackingThirdPartiesWithCompletionHandler:(id)a3;
@end

@implementation SFBrowserDocumentTrackerInfo

- (SFBrowserDocumentTrackerInfo)initWithDocument:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFBrowserDocumentTrackerInfo;
  v5 = [(SFBrowserDocumentTrackerInfo *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_document, v4);
    v6->_cachedTrackingPreventionEnabled = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled];
    v7 = (WBSQueryParameterFilteringDataQueue *)objc_alloc_init(MEMORY[0x1E4F98D40]);
    queryParameterFilteringDataQueue = v6->_queryParameterFilteringDataQueue;
    v6->_queryParameterFilteringDataQueue = v7;

    [(SFBrowserDocumentTrackerInfo *)v6 _resetKnownTrackingThirdParties];
    v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "webui_defaults");
    [v9 addObserver:v6 forKeyPath:*MEMORY[0x1E4FB6F30] options:0 context:kvoContext];

    v10 = v6;
  }

  return v6;
}

+ (BOOL)trackingPreventionEnabled
{
  v2 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  char v3 = objc_msgSend(v2, "webui_trackerProtectionEnabled");

  return v3;
}

- (void)dealloc
{
  char v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "webui_defaults");
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4FB6F30] context:kvoContext];

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserDocumentTrackerInfo;
  [(SFBrowserDocumentTrackerInfo *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kvoContext == a6 && [v10 isEqualToString:*MEMORY[0x1E4FB6F30]])
  {
    [(SFBrowserDocumentTrackerInfo *)self _flushKnownTrackingThirdParties];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SFBrowserDocumentTrackerInfo;
    [(SFBrowserDocumentTrackerInfo *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)updateKnownTrackingThirdPartiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  self->_cachedTrackingPreventionEnabled = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled];
  [(SFBrowserDocumentTrackerInfo *)self _updateKnownTrackingThirdPartiesWithCompletionHandler:v4];
}

- (void)documentDidCommitNavigation
{
  char v3 = [MEMORY[0x1E4F1C9C8] date];
  lastNavigationCommitDate = self->_lastNavigationCommitDate;
  self->_lastNavigationCommitDate = v3;

  [(SFBrowserDocumentTrackerInfo *)self _resetKnownTrackingThirdParties];
  queryParameterFilteringDataQueue = self->_queryParameterFilteringDataQueue;

  [(WBSQueryParameterFilteringDataQueue *)queryParameterFilteringDataQueue commitPendingData];
}

- (void)_updateKnownTrackingThirdPartiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL cachedTrackingPreventionEnabled = self->_cachedTrackingPreventionEnabled;
  v6 = (void *)MEMORY[0x1E4F98CF8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v8 = [WeakRetained webView];
  lastNavigationCommitDate = self->_lastNavigationCommitDate;
  id v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SFBrowserDocumentTrackerInfo__updateKnownTrackingThirdPartiesWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5C73A80;
  BOOL v14 = cachedTrackingPreventionEnabled;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v6 getKnownTrackingDomainsForWebView:v8 after:lastNavigationCommitDate before:v10 completionHandler:v12];
}

void __86__SFBrowserDocumentTrackerInfo__updateKnownTrackingThirdPartiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  v5 = (id *)(*(void *)(a1 + 32) + 24);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  int v8 = [WeakRetained privacyReportShouldSeparateBlockedTrackers];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    uint64_t v10 = [*(id *)(v9 + 40) setByAddingObjectsFromArray:v6];

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = [*(id *)(v9 + 48) setByAddingObjectsFromArray:v6];

    uint64_t v14 = *(void *)(a1 + 32);
    id v12 = *(void **)(v14 + 48);
    *(void *)(v14 + 48) = v13;
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v16 = [*(id *)(v15 + 48) setByAddingObjectsFromArray:v21];
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 48);
    *(void *)(v17 + 48) = v16;
  }
  else
  {
    uint64_t v19 = [*(id *)(v15 + 32) setByAddingObjectsFromArray:v21];
    uint64_t v20 = *(void *)(a1 + 32);
    v18 = *(void **)(v20 + 32);
    *(void *)(v20 + 32) = v19;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_resetKnownTrackingThirdParties
{
  char v3 = [MEMORY[0x1E4F1CAD0] set];
  allowedKnownTrackingThirdParties = self->_allowedKnownTrackingThirdParties;
  self->_allowedKnownTrackingThirdParties = v3;

  v5 = [MEMORY[0x1E4F1CAD0] set];
  blockedKnownTrackingThirdParties = self->_blockedKnownTrackingThirdParties;
  self->_blockedKnownTrackingThirdParties = v5;

  v7 = [MEMORY[0x1E4F1CAD0] set];
  preventedKnownTrackingThirdParties = self->_preventedKnownTrackingThirdParties;
  self->_preventedKnownTrackingThirdParties = v7;
}

- (void)_flushKnownTrackingThirdParties
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke;
  v3[3] = &unk_1E5C724D8;
  v3[4] = self;
  [(SFBrowserDocumentTrackerInfo *)self _updateKnownTrackingThirdPartiesWithCompletionHandler:v3];
  self->_BOOL cachedTrackingPreventionEnabled = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled];
}

void __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke_2;
  block[3] = &unk_1E5C724D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v5 = [WeakRetained webView];

  v2 = v5;
  if (v5)
  {
    char v3 = [v5 configuration];
    id v4 = [v3 websiteDataStore];

    if (objc_opt_respondsToSelector())
    {
      [v4 _clearLoadedSubresourceDomainsFor:v5];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v4 _clearLoadedThirdPartyDomainsFor:v5];
    }

    v2 = v5;
  }
}

- (_SFBrowserDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

  return (_SFBrowserDocument *)WeakRetained;
}

- (NSSet)allowedKnownTrackingThirdParties
{
  return self->_allowedKnownTrackingThirdParties;
}

- (NSSet)blockedKnownTrackingThirdParties
{
  return self->_blockedKnownTrackingThirdParties;
}

- (NSSet)preventedKnownTrackingThirdParties
{
  return self->_preventedKnownTrackingThirdParties;
}

- (WBSQueryParameterFilteringDataQueue)queryParameterFilteringDataQueue
{
  return self->_queryParameterFilteringDataQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryParameterFilteringDataQueue, 0);
  objc_storeStrong((id *)&self->_preventedKnownTrackingThirdParties, 0);
  objc_storeStrong((id *)&self->_blockedKnownTrackingThirdParties, 0);
  objc_storeStrong((id *)&self->_allowedKnownTrackingThirdParties, 0);
  objc_destroyWeak((id *)&self->_document);

  objc_storeStrong((id *)&self->_lastNavigationCommitDate, 0);
}

@end
@interface ATXSuggestedPagesClient
+ (BOOL)shouldShowInternalFeedbackUI;
+ (id)tapToRadarURLForModeName:(id)a3;
- (ATXSuggestedPagesClient)init;
- (BOOL)allowsSuggestionsForModeUUID:(id)a3;
- (CGImage)cachedSnapshotForSuggestedPageWithIdentifier:(id)a3;
- (void)_createInstalledPagesTrackerIfNeeded;
- (void)didAddAppsWithBundleIds:(id)a3 suggestedPage:(id)a4;
- (void)didInstallSuggestedPage:(id)a3;
- (void)didRemoveAppsWithBundleIds:(id)a3 suggestedPage:(id)a4;
- (void)sendModificationMetricsToCoreAnalyticsWithBundleIds:(id)a3 suggestedPage:(id)a4 isAdded:(BOOL)a5;
- (void)suggestedPagesWithFilter:(id)a3 layoutOptions:(id)a4 completionHandler:(id)a5;
- (void)updateSuggestedPagesWithCompletionHandler:(id)a3;
@end

@implementation ATXSuggestedPagesClient

- (ATXSuggestedPagesClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)ATXSuggestedPagesClient;
  v2 = [(ATXSuggestedPagesClient *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.SuggestedPages" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = v2->_xpcConnection;
    v6 = ATXSuggestedPagesInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_5];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_4];
    [(NSXPCConnection *)v2->_xpcConnection resume];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("ATXSuggestedPagesClient.queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

void __31__ATXSuggestedPagesClient_init__block_invoke()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __31__ATXSuggestedPagesClient_init__block_invoke_cold_1(v0);
  }
}

void __31__ATXSuggestedPagesClient_init__block_invoke_2()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_INFO, "ATXSuggestedPagesClient: invalidation handler called", v1, 2u);
  }
}

- (void)suggestedPagesWithFilter:(id)a3 layoutOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = dispatch_get_global_queue(25, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke;
  v15[3] = &unk_1E5D05A70;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = objc_msgSend(v2, "cachedSuggestedPagesForPageType:", objc_msgSend(*(id *)(a1 + 32), "pageType"));
  if ([v3 count])
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesClient: Shortcircuiting call to duetexpertd and returning cached pages", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void **)(*(void *)(a1 + 40) + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_7;
    v7[3] = &unk_1E5D04F50;
    id v8 = *(id *)(a1 + 56);
    v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
    [v6 suggestedPagesWithFilter:*(void *)(a1 + 32) layoutOptions:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
}

void __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_7_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSuggestedPagesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__ATXSuggestedPagesClient_updateSuggestedPagesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 updateSuggestedPagesWithCompletionHandler:v6];
}

uint64_t __69__ATXSuggestedPagesClient_updateSuggestedPagesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)allowsSuggestionsForModeUUID:(id)a3
{
  id v4 = a3;
  [(ATXSuggestedPagesClient *)self _createInstalledPagesTrackerIfNeeded];
  v5 = objc_alloc_init(ATXHomeScreenConfigCache);
  id v6 = [(ATXHomeScreenConfigCache *)v5 loadHomeScreenPageConfigurationsIncludingHidden:1 error:0];
  if ([v6 count] == 15)
  {
    v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Not allowing suggested pages; the user is already at the page limit",
        buf,
        2u);
    }
    BOOL v8 = 0;
  }
  else
  {
    v7 = [(ATXInstalledSuggestedPagesTracker *)self->_tracker identifierOfSuggestedPageForModeUUID:v4];
    if ([v7 length])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__ATXSuggestedPagesClient_allowsSuggestionsForModeUUID___block_invoke;
      v13[3] = &unk_1E5D05A98;
      v7 = v7;
      id v14 = v7;
      id v9 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v13);
      id v10 = v9;
      if (v9)
      {
        objc_super v11 = [v9 associatedModeUUIDs];
        BOOL v8 = [v11 count] == 0;
      }
      else
      {
        BOOL v8 = 1;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }

  return v8;
}

uint64_t __56__ATXSuggestedPagesClient_allowsSuggestionsForModeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (CGImage)cachedSnapshotForSuggestedPageWithIdentifier:(id)a3
{
  return 0;
}

- (void)didInstallSuggestedPage:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(ATXSuggestedPagesClient *)self _createInstalledPagesTrackerIfNeeded];
    tracker = self->_tracker;
    BOOL v8 = [v4 uniqueIdentifier];
    id v9 = [v4 associatedModeUUIDs];
    id v10 = [v9 anyObject];
    -[ATXInstalledSuggestedPagesTracker storePageIdentifier:modeUUID:forPageType:](tracker, "storePageIdentifier:modeUUID:forPageType:", v8, v10, [v4 suggestedPageType]);
  }
  else
  {
    objc_super v11 = __atxlog_handle_modes();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestedPagesClient didInstallSuggestedPage:](v11);
    }
  }
}

- (void)didAddAppsWithBundleIds:(id)a3 suggestedPage:(id)a4
{
  tracker = self->_tracker;
  id v7 = a4;
  id v10 = a3;
  uint64_t v8 = [v7 suggestedPageType];
  id v9 = [v7 uniqueIdentifier];
  [(ATXInstalledSuggestedPagesTracker *)tracker trackSuggestedHomePageWithAction:2 pageType:v8 identifier:v9];

  [(ATXSuggestedPagesClient *)self sendModificationMetricsToCoreAnalyticsWithBundleIds:v10 suggestedPage:v7 isAdded:1];
}

- (void)didRemoveAppsWithBundleIds:(id)a3 suggestedPage:(id)a4
{
  tracker = self->_tracker;
  id v7 = a4;
  id v10 = a3;
  uint64_t v8 = [v7 suggestedPageType];
  id v9 = [v7 uniqueIdentifier];
  [(ATXInstalledSuggestedPagesTracker *)tracker trackSuggestedHomePageWithAction:2 pageType:v8 identifier:v9];

  [(ATXSuggestedPagesClient *)self sendModificationMetricsToCoreAnalyticsWithBundleIds:v10 suggestedPage:v7 isAdded:0];
}

- (void)sendModificationMetricsToCoreAnalyticsWithBundleIds:(id)a3 suggestedPage:(id)a4 isAdded:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__ATXSuggestedPagesClient_sendModificationMetricsToCoreAnalyticsWithBundleIds_suggestedPage_isAdded___block_invoke;
  block[3] = &unk_1E5D05AC0;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

void __101__ATXSuggestedPagesClient_sendModificationMetricsToCoreAnalyticsWithBundleIds_suggestedPage_isAdded___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v7 = objc_opt_new();
        [v7 setSource:0];
        id v8 = NSStringFromATXSuggestedPageType([*(id *)(a1 + 40) suggestedPageType]);
        [v7 setSuggestedPageType:v8];

        if (*(unsigned char *)(a1 + 48)) {
          id v9 = @"AppAdded";
        }
        else {
          id v9 = @"AppRemoved";
        }
        [v7 setEventType:v9];
        [v7 setAppBundleId:v6];
        [v7 logToCoreAnalytics];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

- (void)_createInstalledPagesTrackerIfNeeded
{
  if (!self->_tracker)
  {
    uint64_t v3 = objc_alloc_init(ATXInstalledSuggestedPagesTracker);
    tracker = self->_tracker;
    self->_tracker = v3;
    MEMORY[0x1F41817F8](v3, tracker);
  }
}

+ (BOOL)shouldShowInternalFeedbackUI
{
  return [MEMORY[0x1E4F93B08] isInternalBuild];
}

+ (id)tapToRadarURLForModeName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F93B10] currentOsBuild];
  v5 = [MEMORY[0x1E4F93B08] internalDeviceCode];
  id v6 = [NSString alloc];
  if (v5) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    uint64_t v8 = [v6 initWithFormat:@"💬 %@ Page Suggestion Feedback", v3, v18, v19];
  }
  else {
    uint64_t v8 = [v6 initWithFormat:@"💬 %@/%@: %@ Page Suggestion Feedback", v5, v4, v3];
  }
  id v9 = (void *)v8;
  id v10 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  long long v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  long long v12 = (void *)[[NSString alloc] initWithFormat:@"= = = Provide %@ Suggestion Feedback = = =\n\nAre there any apps or widgets that are missing that you would expect to see? If so, which ones?\n- - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n\nAre there any apps or widgets that should not be there? If so, which ones?\n- - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n\nAdditional Notes\n- - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n", v3];
  long long v13 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  long long v14 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v13];

  id v15 = (void *)[[NSString alloc] initWithFormat:@"tap-to-radar://new?ComponentID=1153724&ComponentName=Proactive%%20Mode%%20Intelligence&ComponentVersion=All&Classification=Enhancement&Reproducibility=Not%%20Applicable&Title=%@&Description=%@", v11, v14];
  uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __31__ATXSuggestedPagesClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesClient: interruption handler called", v1, 2u);
}

void __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesClient: XPC failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)didInstallSuggestedPage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "A suggested page was installed but we did not get a unique identifier back in feedback.", v1, 2u);
}

@end
@interface ATXSuggestedPagesHomeScreenModificationsMetricsLogger
- (ATXBMBookmark)atxBookmark;
- (ATXSuggestedPagesHomeScreenModificationsMetricsLogger)init;
- (ATXSuggestedPagesHomeScreenModificationsMetricsLogger)initWithStream:(id)a3 bookmarkURLPath:(id)a4;
- (ATXUniversalBiomeUIStream)stream;
- (NSArray)acceptedEventTypes;
- (NSURL)bookmarkURLPath;
- (id)generateBookmark;
- (id)generateBookmarkURLPath;
- (int64_t)logMetrics;
- (void)setAcceptedEventTypes:(id)a3;
- (void)setAtxBookmark:(id)a3;
- (void)setBookmarkURLPath:(id)a3;
- (void)setStream:(id)a3;
- (void)writeBookmarkToFile:(id)a3;
@end

@implementation ATXSuggestedPagesHomeScreenModificationsMetricsLogger

- (ATXSuggestedPagesHomeScreenModificationsMetricsLogger)initWithStream:(id)a3 bookmarkURLPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stream, a3);
    objc_storeStrong((id *)&v10->_bookmarkURLPath, a4);
  }

  return v10;
}

- (ATXSuggestedPagesHomeScreenModificationsMetricsLogger)init
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)ATXSuggestedPagesHomeScreenModificationsMetricsLogger;
  v2 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)&v8 init];
  if (v2)
  {
    v9[0] = @"StackDeleted";
    v9[1] = @"StackCreated";
    v9[2] = @"AppRemoved";
    v9[3] = @"AppAdded";
    v9[4] = @"PinnedWidgetAdded";
    v9[5] = @"PinnedWidgetDeleted";
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
    acceptedEventTypes = v2->_acceptedEventTypes;
    v2->_acceptedEventTypes = (NSArray *)v3;

    uint64_t v5 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)v2 generateBookmark];
    atxBookmark = v2->_atxBookmark;
    v2->_atxBookmark = (ATXBMBookmark *)v5;
  }
  return v2;
}

- (ATXUniversalBiomeUIStream)stream
{
  stream = self->_stream;
  if (!stream)
  {
    v4 = (ATXUniversalBiomeUIStream *)objc_alloc_init(MEMORY[0x1E4F939F0]);
    uint64_t v5 = self->_stream;
    self->_stream = v4;

    stream = self->_stream;
  }
  return stream;
}

- (id)generateBookmarkURLPath
{
  bookmarkURLPath = self->_bookmarkURLPath;
  if (bookmarkURLPath)
  {
    uint64_t v3 = bookmarkURLPath;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    v6 = [MEMORY[0x1E4F4B650] metricsRootDirectory];
    id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
    objc_super v8 = [v6 stringByAppendingPathComponent:v5];
    uint64_t v3 = (NSURL *)[v7 initFileURLWithPath:v8];
  }
  return v3;
}

- (id)generateBookmark
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4B618];
  v4 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)self generateBookmarkURLPath];
  uint64_t v5 = [v3 bookmarkFromURLPath:v4 maxFileSize:3000000 versionNumber:&unk_1F27F06A8];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4B618]);
    id v7 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)self generateBookmarkURLPath];
    uint64_t v5 = (void *)[v6 initWithURLPath:v7 versionNumber:&unk_1F27F06A8 bookmark:0 metadata:0];
  }
  return v5;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v5 = 0;
  [a3 saveBookmarkWithError:&v5];
  id v3 = v5;
  if (v3)
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger writeBookmarkToFile:]((uint64_t)v3, v4);
    }
  }
}

- (int64_t)logMetrics
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v3 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)self stream];
  v4 = [v3 genericEventPublisherFromStartTime:0.0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke;
  v13[3] = &unk_1E68AF140;
  v13[4] = self;
  id v5 = [v4 filterWithIsIncluded:v13];
  id v6 = [(ATXSuggestedPagesHomeScreenModificationsMetricsLogger *)self atxBookmark];
  id v7 = [v6 bookmark];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2;
  v12[3] = &unk_1E68ABA68;
  v12[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_18;
  v11[3] = &unk_1E68AC8E8;
  v11[4] = &v14;
  id v8 = (id)[v5 drivableSinkWithBookmark:v7 completion:v12 shouldContinue:v11];

  int64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  id v6 = [v3 eventBody];
  id v7 = [v6 homeScreenEvent];
  id v8 = [v7 metadata];
  int64_t v9 = v8;
  if (!v8 || ![v8 suggestedPageType])
  {

    goto LABEL_7;
  }
  v10 = [*(id *)(a1 + 32) acceptedEventTypes];
  v11 = [v7 eventTypeString];
  char v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = 1;
LABEL_8:

  return v13;
}

void __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 state] == 1)
  {
    id v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2_cold_1(v6);
    }
  }
  id v7 = [*(id *)(a1 + 32) atxBookmark];
  [v7 setBookmark:v5];

  id v8 = *(void **)(a1 + 32);
  int64_t v9 = [v8 atxBookmark];
  [v8 writeBookmarkToFile:v9];
}

uint64_t __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = [a2 eventBody];
  id v3 = [v2 homeScreenEvent];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 metadata];
    id v6 = [v5 widgetsInStack];

    id v7 = [v4 metadata];
    id v8 = [v7 bundleIds];

    if ([v6 count])
    {
      v41 = v8;
      v42 = v6;
      v43 = v2;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v50 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            v15 = objc_opt_new();
            [v15 setSource:1];
            uint64_t v16 = [v4 metadata];
            [v16 suggestedPageType];
            uint64_t v17 = NSStringFromATXSuggestedPageType();
            [v15 setSuggestedPageType:v17];

            v18 = [v4 eventTypeString];
            [v15 setEventType:v18];

            v19 = [v4 widgetBundleId];
            [v15 setWidgetBundleId:v19];

            v20 = [v14 widgetKind];
            [v15 setWidgetKind:v20];

            v21 = [v14 appBundleId];
            [v15 setAppBundleId:v21];

            [v4 widgetSize];
            v22 = ATXStringForStackLayoutSize();
            [v15 setWidgetSize:v22];

            objc_msgSend(v15, "setIsSuggestedWidget:", objc_msgSend(v14, "isSuggestedWidget"));
            [v15 logToCoreAnalytics];
            ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v11);
      }
    }
    else
    {
      if (![v8 count])
      {
        v33 = objc_opt_new();
        [v33 setSource:1];
        v34 = [v4 metadata];
        [v34 suggestedPageType];
        v35 = NSStringFromATXSuggestedPageType();
        [v33 setSuggestedPageType:v35];

        v36 = [v4 eventTypeString];
        [v33 setEventType:v36];

        v37 = [v4 widgetBundleId];
        [v33 setWidgetBundleId:v37];

        v38 = [v4 widgetKind];
        [v33 setWidgetKind:v38];

        v39 = [v4 appBundleId];
        [v33 setAppBundleId:v39];

        [v4 widgetSize];
        v40 = ATXStringForStackLayoutSize();
        [v33 setWidgetSize:v40];

        objc_msgSend(v33, "setIsSuggestedWidget:", objc_msgSend(v4, "isSuggestedWidget"));
        [v33 logToCoreAnalytics];
        ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

        goto LABEL_20;
      }
      v42 = v6;
      v43 = v2;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v41 = v8;
      id v9 = v8;
      uint64_t v23 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v9);
            }
            uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * j);
            v28 = objc_opt_new();
            [v28 setSource:1];
            v29 = [v4 metadata];
            [v29 suggestedPageType];
            v30 = NSStringFromATXSuggestedPageType();
            [v28 setSuggestedPageType:v30];

            v31 = [v4 eventTypeString];
            [v28 setEventType:v31];

            [v28 setAppBundleId:v27];
            [v28 logToCoreAnalytics];
            ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          }
          uint64_t v24 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v24);
      }
    }

    id v6 = v42;
    v2 = v43;
    id v8 = v41;
LABEL_20:
  }
  return 1;
}

- (void)setStream:(id)a3
{
}

- (NSArray)acceptedEventTypes
{
  return self->_acceptedEventTypes;
}

- (void)setAcceptedEventTypes:(id)a3
{
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (void)setBookmarkURLPath:(id)a3
{
}

- (ATXBMBookmark)atxBookmark
{
  return self->_atxBookmark;
}

- (void)setAtxBookmark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atxBookmark, 0);
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_acceptedEventTypes, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)writeBookmarkToFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesHomeScreenModificationsMetricsLogger: Unable to save bookmark due to : %@", (uint8_t *)&v2, 0xCu);
}

void __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesHomeScreenModificationsMetricsLogger: Failed to retrieve UI events", v1, 2u);
}

@end
@interface ATXBlendingBiomeStreamLogger
+ (id)biomeStreamLoggerWithPath:(id)a3 dataStoreWrapper:(id)a4;
+ (id)biomeStreamLoggerWithPath:(id)a3 tracker:(id)a4 dataStoreWrapper:(id)a5;
+ (id)defaultBiomeStreamLogger;
- (ATXAppClipSingleSuggestionLogger)appClipLogger;
- (ATXBMBookmark)bookmark;
- (ATXBlendingBiomeStreamLogger)initWithBookmark:(id)a3 tracker:(id)a4 dataStoreWrapper:(id)a5;
- (ATXHeroAppSingleSuggestionLogger)heroLogger;
- (ATXPETEventTracker2Protocol)tracker;
- (BPSPublisher)blendingModelPublisher;
- (BPSPublisher)clientModelPublisher;
- (BPSPublisher)uiPublisher;
- (NSString)abGroup;
- (id)_anchorModelEngagementMetricFromAnchorPrediction:(id)a3 proactiveSuggestion:(id)a4 feedbackMetadata:(id)a5 engagementType:(int)a6 consumerSubType:(id)a7 completedSession:(id)a8;
- (id)_blendingModelPublisher;
- (id)_clientModelPublisher;
- (id)_loggerContextPublisherWithPublisher:(id)a3;
- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4;
- (id)_uiPublisher;
- (id)mergedSessionEventWithContextPublisher;
- (unsigned)_ensureWidgetsInStackBetweenZeroAndTen:(unint64_t)a3;
- (void)_logCacheAgeMetricEventWithCacheAge:(double)a3 clientModelId:(id)a4;
- (void)_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4;
- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4;
- (void)_logLayoutSelectedWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4;
- (void)_logUnaggregatedAnchorModelEngagementMetric:(id)a3;
- (void)handleBlendingModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4;
- (void)handleClientModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4;
- (void)handleUIEvent:(id)a3 loggerContext:(id)a4;
- (void)logAnchorModelEngagementMetricsWithCompletedSession:(id)a3;
- (void)logBlendingLayerRefreshMetricWithBlendingModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4;
- (void)logBlendingMetricsFromBiomeStream;
- (void)logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent:(id)a3;
- (void)logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:(id)a3;
- (void)logScreenUnlockSessionsIfPossibleWithLoggerContext:(id)a3;
- (void)logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent:(id)a3;
- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:(id)a3;
- (void)persistContext;
- (void)setAppClipLogger:(id)a3;
- (void)setBlendingModelPublisher:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setClientModelPublisher:(id)a3;
- (void)setHeroLogger:(id)a3;
- (void)setTracker:(id)a3;
- (void)setUiPublisher:(id)a3;
- (void)tryLogSingleSuggestionSessionMetricsWithLoggerContext:(id)a3;
- (void)updateCurrentABGroup:(id)a3;
@end

@implementation ATXBlendingBiomeStreamLogger

+ (id)defaultBiomeStreamLogger
{
  v3 = objc_opt_new();
  v4 = [a1 biomeStreamLoggerWithPath:@"biomeStreamMetricsLogger" dataStoreWrapper:v3];

  return v4;
}

+ (id)biomeStreamLoggerWithPath:(id)a3 dataStoreWrapper:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [a1 biomeStreamLoggerWithPath:v7 tracker:v8 dataStoreWrapper:v6];

  return v9;
}

+ (id)biomeStreamLoggerWithPath:(id)a3 tracker:(id)a4 dataStoreWrapper:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F4B650];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 metricsRootDirectory];
  v12 = [v11 stringByAppendingPathComponent:v10];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v12];
  v14 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v13 maxFileSize:1000000 versionNumber:&unk_1F27F1890];
  if (!v14) {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F4B618]) initWithURLPath:v13 versionNumber:&unk_1F27F1890 bookmark:0 metadata:0];
  }
  v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBookmark:v14 tracker:v9 dataStoreWrapper:v8];

  return v15;
}

- (ATXBlendingBiomeStreamLogger)initWithBookmark:(id)a3 tracker:(id)a4 dataStoreWrapper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXBlendingBiomeStreamLogger;
  v12 = [(ATXBlendingBiomeStreamLogger *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmark, a3);
    objc_storeStrong((id *)&v13->_tracker, a4);
    objc_storeStrong((id *)&v13->_dataStoreWrapper, a5);
    v14 = [[ATXHeroAppSingleSuggestionLogger alloc] initWithTracker:v10];
    heroLogger = v13->_heroLogger;
    v13->_heroLogger = v14;

    v16 = [[ATXAppClipSingleSuggestionLogger alloc] initWithTracker:v10];
    appClipLogger = v13->_appClipLogger;
    v13->_appClipLogger = v16;
  }
  return v13;
}

- (NSString)abGroup
{
  currentABGroup = self->_currentABGroup;
  if (!currentABGroup)
  {
    v4 = [MEMORY[0x1E4F93550] sharedInstance];
    v5 = [v4 abGroup];
    id v6 = self->_currentABGroup;
    self->_currentABGroup = v5;

    currentABGroup = self->_currentABGroup;
  }
  return currentABGroup;
}

- (void)updateCurrentABGroup:(id)a3
{
}

- (void)logBlendingMetricsFromBiomeStream
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = [(ATXBlendingBiomeStreamLogger *)self mergedSessionEventWithContextPublisher];
  sel_getName(a2);
  v5 = (void *)os_transaction_create();
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  objc_initWeak(&location, self);
  id v7 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    bookmark = self->_bookmark;
    *(_DWORD *)buf = 138412546;
    v37 = v9;
    __int16 v38 = 2112;
    v39 = bookmark;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - starting with bookmark %@", buf, 0x16u);
  }
  id v11 = [(ATXBMBookmark *)self->_bookmark bookmark];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke;
  v27[3] = &unk_1E68B32F8;
  objc_copyWeak(&v30, &location);
  v29 = &v32;
  v12 = v6;
  v28 = v12;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke_25;
  v24 = &unk_1E68B3320;
  objc_copyWeak(&v26, &location);
  v25 = &v32;
  id v13 = (id)[v4 sinkWithBookmark:v11 completion:v27 receiveInput:&v21];

  if (objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v12, 2.0, v21, v22, v23, v24) == 1)
  {
    v14 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412290;
      v37 = v16;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "%@ - event processing timeout", buf, 0xCu);
    }
  }
  else
  {
    v17 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      objc_super v19 = NSStringFromClass(v18);
      v20 = (ATXBMBookmark *)v33[3];
      *(_DWORD *)buf = 138412546;
      v37 = v19;
      __int16 v38 = 2048;
      v39 = v20;
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "%@ - processed %ld events", buf, 0x16u);
    }
    if (v33[3] >= 1) {
      [(ATXBlendingBiomeStreamLogger *)self persistContext];
    }
  }
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v32, 8);
}

void __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_semaphore_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1)
    {
      [WeakRetained[8] flushEventBuffers];
      [v6[9] flushEventBuffers];
      id v7 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        int v14 = 138412290;
        v15 = v9;
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - obtained new bookmark", (uint8_t *)&v14, 0xCu);
      }
      id v10 = objc_alloc(MEMORY[0x1E4F4B618]);
      id v11 = [v6[3] urlPath];
      uint64_t v12 = [v10 initWithURLPath:v11 versionNumber:&unk_1F27F1890 bookmark:v4 metadata:0];
      id v13 = v6[3];
      v6[3] = (id)v12;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke_25(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1D25F6CC0]();
    v5 = [v8 event];
    dispatch_semaphore_t v6 = [v5 eventBody];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v8 loggerContext];
      [WeakRetained handleClientModelCacheUpdateEvent:v6 loggerContext:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v8 loggerContext];
        [WeakRetained handleBlendingModelCacheUpdateEvent:v6 loggerContext:v7];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_9:
          ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

          goto LABEL_10;
        }
        id v7 = [v8 loggerContext];
        [WeakRetained handleUIEvent:v6 loggerContext:v7];
      }
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)persistContext
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  bookmark = self->_bookmark;
  id v9 = 0;
  [(ATXBMBookmark *)bookmark saveBookmarkWithError:&v9];
  id v4 = v9;
  v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [(ATXBMBookmark *)self->_bookmark urlPath];
    *(_DWORD *)buf = 138412802;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - persisted bookmark to path %@ with error: %@", buf, 0x20u);
  }
}

- (id)mergedSessionEventWithContextPublisher
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(ATXBlendingBiomeStreamLogger *)self _clientModelPublisher];
  id v4 = [(ATXBlendingBiomeStreamLogger *)self _blendingModelPublisher];
  v5 = [(ATXBlendingBiomeStreamLogger *)self _uiPublisher];
  v10[0] = v4;
  v10[1] = v5;
  dispatch_semaphore_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v7 = [(ATXBlendingBiomeStreamLogger *)self _timeBasedMergePublisher:v3 withOtherPublishers:v6];

  id v8 = [(ATXBlendingBiomeStreamLogger *)self _loggerContextPublisherWithPublisher:v7];

  return v8;
}

- (id)_clientModelPublisher
{
  clientModelPublisher = self->_clientModelPublisher;
  if (!clientModelPublisher)
  {
    id v4 = objc_opt_new();
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    dispatch_semaphore_t v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_clientModelPublisher;
    self->_clientModelPublisher = v6;

    clientModelPublisher = self->_clientModelPublisher;
  }
  return clientModelPublisher;
}

- (id)_blendingModelPublisher
{
  blendingModelPublisher = self->_blendingModelPublisher;
  if (!blendingModelPublisher)
  {
    id v4 = objc_opt_new();
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    dispatch_semaphore_t v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_blendingModelPublisher;
    self->_blendingModelPublisher = v6;

    blendingModelPublisher = self->_blendingModelPublisher;
  }
  return blendingModelPublisher;
}

- (id)_uiPublisher
{
  uiPublisher = self->_uiPublisher;
  if (!uiPublisher)
  {
    id v4 = objc_opt_new();
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "genericEventPublisherFromStartTime:");
    dispatch_semaphore_t v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_uiPublisher;
    self->_uiPublisher = v6;

    uiPublisher = self->_uiPublisher;
  }
  return uiPublisher;
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)[a3 orderedMergeWithOthers:a4 comparator:&__block_literal_global_144];
}

uint64_t __77__ATXBlendingBiomeStreamLogger__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  dispatch_semaphore_t v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)_loggerContextPublisherWithPublisher:(id)a3
{
  id v3 = a3;
  id v4 = [ATXBlendingBiomeStreamLoggerContextWrapper alloc];
  id v5 = objc_opt_new();
  dispatch_semaphore_t v6 = [(ATXBlendingBiomeStreamLoggerContextWrapper *)v4 initWithEvent:0 loggerContext:v5];

  id v7 = [v3 scanWithInitial:v6 nextPartialResult:&__block_literal_global_41_1];

  return v7;
}

ATXBlendingBiomeStreamLoggerContextWrapper *__69__ATXBlendingBiomeStreamLogger__loggerContextPublisherWithPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  dispatch_semaphore_t v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v7 = [v5 eventBody];
  if (v7)
  {
    double v8 = [v4 loggerContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 updateWithClientModelCacheUpdate:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 updateWithBlendingUICacheUpdate:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 updateWithUIEvent:v7];
        }
      }
    }
    id v10 = [[ATXBlendingBiomeStreamLoggerContextWrapper alloc] initWithEvent:v5 loggerContext:v8];
  }
  else
  {
    double v9 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __69__ATXBlendingBiomeStreamLogger__loggerContextPublisherWithPublisher___block_invoke_cold_1(v9);
    }

    id v10 = (ATXBlendingBiomeStreamLoggerContextWrapper *)v4;
  }

  return v10;
}

- (void)handleClientModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4
{
  id v6 = a4;
  id v9 = [a3 clientModelId];
  id v7 = [v6 cacheUpdateContext];

  double v8 = [v7 cacheAgeForPreviousClientModelCacheWithClientModelId:v9];

  if (v8 && v9)
  {
    [v8 doubleValue];
    -[ATXBlendingBiomeStreamLogger _logCacheAgeMetricEventWithCacheAge:clientModelId:](self, "_logCacheAgeMetricEventWithCacheAge:clientModelId:", v9);
  }
}

- (void)handleBlendingModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [(ATXBlendingBiomeStreamLogger *)self logBlendingLayerRefreshMetricWithBlendingModelCacheUpdateEvent:v6 loggerContext:v7];
  [(ATXBlendingBiomeStreamLogger *)self logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:v6];
  [(ATXBlendingBiomeStreamLogger *)self logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent:v6];
  [(ATXBlendingBiomeStreamLogger *)self logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent:v6];

  [(ATXBlendingBiomeStreamLogger *)self tryLogSingleSuggestionSessionMetricsWithLoggerContext:v7];
}

- (void)handleUIEvent:(id)a3 loggerContext:(id)a4
{
  id v5 = a4;
  [(ATXBlendingBiomeStreamLogger *)self tryLogSingleSuggestionSessionMetricsWithLoggerContext:v5];
  [(ATXBlendingBiomeStreamLogger *)self logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:v5];
  [(ATXBlendingBiomeStreamLogger *)self logScreenUnlockSessionsIfPossibleWithLoggerContext:v5];
}

- (void)tryLogSingleSuggestionSessionMetricsWithLoggerContext:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 sessionTrackingContext];
  id v6 = [v5 completedSessions];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v22 = v4;
  double v8 = [v4 sessionTrackingContext];
  id v9 = [v8 removeStoredCompletedSessionsAndReturnCompletedSessionsCopy];

  id v10 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:1];
  v24 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:23];
  v23 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:13];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      v17 = [v16 suggestion];
      v18 = [v17 clientModelSpecification];
      objc_super v19 = [v18 clientModelId];

      if ([v19 isEqualToString:v10])
      {
        [(ATXBlendingBiomeStreamLogger *)self logAnchorModelEngagementMetricsWithCompletedSession:v16];
        goto LABEL_14;
      }
      if ([v19 isEqualToString:v24])
      {
        heroLogger = self->_heroLogger;
      }
      else
      {
        if (![v19 isEqualToString:v23]) {
          goto LABEL_14;
        }
        heroLogger = self->_appClipLogger;
      }
      [heroLogger handleSingleSuggestion:v16];
LABEL_14:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v13);
LABEL_16:

  uint64_t v21 = __atxlog_handle_metrics();
  id v4 = v22;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[ATXBlendingBiomeStreamLogger tryLogSingleSuggestionSessionMetricsWithLoggerContext:](v22);
  }

LABEL_19:
}

- (void)logScreenUnlockSessionsIfPossibleWithLoggerContext:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 screenLogUnlockSessionContext];
  id v5 = [v4 unlockSessionManager];
  id v6 = [v5 removeCompletedSessions];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v75 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v56;
    *(void *)&long long v9 = 138413826;
    long long v49 = v9;
    v51 = self;
    uint64_t v52 = *(void *)v56;
    id v53 = v7;
    do
    {
      uint64_t v12 = 0;
      uint64_t v54 = v10;
      do
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v55 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "sessionEndDate", v49);
        id v15 = [v13 sessionStartDate];
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;

        uint64_t v18 = fmax(v17, 0.0);
        if (v18 >= 0x64) {
          uint64_t v18 = 100 * (v18 / 0x64);
        }
        objc_super v19 = objc_opt_new();
        [v19 setSessionLengthInSeconds:v18];
        objc_msgSend(v19, "setSpotlightEnabled:", objc_msgSend(v13, "spotlightEnabled"));
        objc_msgSend(v19, "setAppLibraryEnabled:", objc_msgSend(v13, "appLibraryEnabled"));
        objc_msgSend(v19, "setSuggestionsWidgetEnabled:", objc_msgSend(v13, "hasSuggestionsWidget"));
        objc_msgSend(v19, "setSuggestionsWidgetTodayPageEnabled:", objc_msgSend(v13, "hasSuggestionsWidgetInTodayPage"));
        objc_msgSend(v19, "setAppPredictionPanelEnabled:", objc_msgSend(v13, "hasAppPredictionPanel"));
        objc_msgSend(v19, "setAppPredictionPanelTodayPageEnabled:", objc_msgSend(v13, "hasAppPredictionPanelInTodayPage"));
        objc_msgSend(v19, "setNumEngagementsInSpotlightApps:", objc_msgSend(v13, "numEngagementsInSpotlightApps"));
        objc_msgSend(v19, "setNumEngagementsInSpotlightActions:", objc_msgSend(v13, "numEngagementsInSpotlightActions"));
        objc_msgSend(v19, "setNumEngagementsInSuggestionsWidget:", objc_msgSend(v13, "numEngagementsInSuggestionsWidget"));
        objc_msgSend(v19, "setNumEngagementsInSuggestionsWidgetTodayPage:", objc_msgSend(v13, "numEngagementsInSuggestionsWidgetTodayPage"));
        objc_msgSend(v19, "setNumEngagementsInAppPredictionPanel:", objc_msgSend(v13, "numEngagementsInAppPredictionPanel"));
        objc_msgSend(v19, "setNumEngagementsInAppPredictionPanelTodayPage:", objc_msgSend(v13, "numEngagementsInAppPredictionPanelTodayPage"));
        objc_msgSend(v19, "setNumEngagementsInAppLibrary:", objc_msgSend(v13, "numEngagementsInAppLibrary"));
        objc_msgSend(v19, "setSpotlightAppsViewed:", objc_msgSend(v13, "numViewsInSpotlightApps") != 0);
        objc_msgSend(v19, "setSpotlightActionsViewed:", objc_msgSend(v13, "numViewsInSpotlightActions") != 0);
        objc_msgSend(v19, "setSuggestionsWidgetViewed:", objc_msgSend(v13, "numViewsInSuggestionsWidget") != 0);
        objc_msgSend(v19, "setAppPredictionPanelViewed:", objc_msgSend(v13, "numViewsInAppPredictionPanel") != 0);
        objc_msgSend(v19, "setAppLibraryViewed:", objc_msgSend(v13, "numViewsInAppLibrary") != 0);
        objc_msgSend(v19, "setAppPredictionPanelTodayPageViewed:", objc_msgSend(v13, "numViewsInAppPredictionPanelTodayPage") != 0);
        objc_msgSend(v19, "setSuggestionsWidgetTodayPageViewed:", objc_msgSend(v13, "numViewsInSuggestionsWidgetTodayPage") != 0);
        [(ATXPETEventTracker2Protocol *)self->_tracker logMessage:v19];
        v20 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v23 = (objc_class *)objc_opt_class();
          v24 = NSStringFromClass(v23);
          int v50 = [v19 sessionLengthInSeconds];
          uint64_t v25 = [v19 numEngagementsInSpotlightApps];
          uint64_t v26 = [v19 numEngagementsInSpotlightActions];
          uint64_t v27 = [v19 numEngagementsInSuggestionsWidget];
          uint64_t v28 = [v19 numEngagementsInSuggestionsWidgetTodayPage];
          uint64_t v29 = [v19 numEngagementsInAppPredictionPanel];
          uint64_t v30 = [v19 numEngagementsInAppPredictionPanelTodayPage];
          unsigned int v31 = [v19 numEngagementsInAppLibrary];
          *(_DWORD *)buf = 138414338;
          v60 = v24;
          __int16 v61 = 1024;
          int v62 = v50;
          __int16 v63 = 2048;
          *(void *)v64 = v25;
          *(_WORD *)&v64[8] = 2048;
          uint64_t v65 = v26;
          uint64_t v11 = v52;
          id v7 = v53;
          *(_WORD *)v66 = 2048;
          *(void *)&v66[2] = v27;
          __int16 v67 = 2048;
          uint64_t v68 = v28;
          __int16 v69 = 2048;
          uint64_t v70 = v29;
          self = v51;
          __int16 v71 = 2048;
          uint64_t v72 = v30;
          uint64_t v10 = v54;
          __int16 v73 = 2048;
          uint64_t v74 = v31;
          _os_log_debug_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBScreenLogUnlockSessionTracker with sessionLengthInSeconds: %u, spotlightAppEngagements: %lu, spotlightActionEngagements: %lu, suggestionsWidgetEngagements: %lu, suggestionsWidgetTodayPageEngagements: %lu appPredictionPanelEngagements: %lu, appPredictionPanelTodayPageEngagements: %lu, appLibraryEngagements: %lu", buf, 0x58u);
        }
        uint64_t v21 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          int v34 = [v19 spotlightAppsViewed];
          int v35 = [v19 spotlightActionsViewed];
          int v36 = [v19 suggestionsWidgetViewed];
          int v37 = [v19 suggestionsWidgetTodayPageViewed];
          int v38 = [v19 appPredictionPanelViewed];
          int v39 = [v19 appPredictionPanelTodayPageViewed];
          int v40 = [v19 appLibraryViewed];
          *(_DWORD *)buf = 138414082;
          v60 = v33;
          __int16 v61 = 1024;
          int v62 = v34;
          __int16 v63 = 1024;
          *(_DWORD *)v64 = v35;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v36;
          LOWORD(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 2) = v37;
          HIWORD(v65) = 1024;
          *(_DWORD *)v66 = v38;
          self = v51;
          uint64_t v11 = v52;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v39;
          id v7 = v53;
          uint64_t v10 = v54;
          __int16 v67 = 1024;
          LODWORD(v68) = v40;
          _os_log_debug_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBScreenLogUnlockSessionTracker (continued) with spotlightAppsViewed: %u, spotlightActionsViewed: %u, suggestionsWidgetViewed: %u, suggestionsWidgetTodayPageViewed: %u appPredictionPanelViewed: %u, appPredictionPanelTodayPageViewed: %u, appLibraryViewed: %u", buf, 0x36u);
        }
        uint64_t v22 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v41 = (objc_class *)objc_opt_class();
          v42 = NSStringFromClass(v41);
          int v43 = [v19 spotlightEnabled];
          int v44 = [v19 appLibraryEnabled];
          int v45 = [v19 suggestionsWidgetEnabled];
          int v46 = [v19 suggestionsWidgetTodayPageEnabled];
          int v47 = [v19 appPredictionPanelEnabled];
          int v48 = [v19 appPredictionPanelTodayPageEnabled];
          *(_DWORD *)buf = v49;
          v60 = v42;
          __int16 v61 = 1024;
          int v62 = v43;
          __int16 v63 = 1024;
          *(_DWORD *)v64 = v44;
          uint64_t v11 = v52;
          id v7 = v53;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v45;
          LOWORD(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 2) = v46;
          uint64_t v10 = v54;
          HIWORD(v65) = 1024;
          *(_DWORD *)v66 = v47;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v48;
          _os_log_debug_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBScreenLogUnlockSessionTracker (continued) with spotlightEnabled: %d, appLibraryEnabled: %d, hasSuggestionsWidgetEnabled: %d, hasSuggestionsWidgetTodayPageEnabled: %d, hasAppPredictionPanelEnabled: %d, hasAppPredictionPanelTodayPageEnabled: %d", buf, 0x30u);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v55 objects:v75 count:16];
    }
    while (v10);
  }
}

- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 stackSuggestTrackingContext];
  id v5 = [v4 removeAllAndReturnCompletedSystemSuggestSessions];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v5;
  uint64_t v59 = [obj countByEnumeratingWithState:&v60 objects:v84 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v61;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v61 != v58) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v60 + 1) + 8 * v6);
        uint64_t v8 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v36 = (objc_class *)objc_opt_class();
          int v37 = NSStringFromClass(v36);
          *(_DWORD *)buf = 138412546;
          id v65 = v37;
          __int16 v66 = 2112;
          __int16 v67 = v7;
          _os_log_debug_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEBUG, "%@ - handling completed session: %@", buf, 0x16u);
        }
        long long v9 = [v7 systemSuggestSuggestionLayout];
        if (!v9)
        {
          uint64_t v10 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            -[ATXBlendingBiomeStreamLogger logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:]();
          }
          goto LABEL_41;
        }
        uint64_t v10 = v9;
        uint64_t v11 = [v9 allSuggestionsInLayout];
        uint64_t v12 = [v11 firstObject];

        if (!v12)
        {
          int v46 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            -[ATXBlendingBiomeStreamLogger logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:]();
          }

LABEL_41:
          goto LABEL_42;
        }
        if ([v7 isNPlusOneRotation]) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 2;
        }
        unint64_t v14 = [v7 engagementStatus];
        if (v14 > 7) {
          uint64_t v15 = 0;
        }
        else {
          uint64_t v15 = dword_1D142B8C8[v14];
        }
        unsigned int v16 = [v7 stackLocation];
        if (v16 - 1 >= 5) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = v16;
        }
        uint64_t v18 = objc_opt_new();
        objc_super v19 = objc_msgSend(MEMORY[0x1E4F939C8], "stringFromUILayoutType:", -[NSObject layoutType](v10, "layoutType"));
        [v18 setLayoutType:v19];

        [v18 setEngagementType:v15];
        v20 = [v12 clientModelSpecification];
        uint64_t v21 = [v20 clientModelId];
        [v18 setClientModelId:v21];

        id v22 = [NSString alloc];
        v23 = [v7 widgetBundleId];
        v24 = [v7 widgetKind];
        uint64_t v25 = (void *)[v22 initWithFormat:@"%@-%@", v23, v24];
        [v18 setWidgetIdentifier:v25];

        [v18 setSelectionType:v13];
        uint64_t v26 = (void *)MEMORY[0x1E4F93968];
        uint64_t v27 = [v12 scoreSpecification];
        uint64_t v28 = objc_msgSend(v26, "stringForSuggestedConfidenceCategory:", objc_msgSend(v27, "suggestedConfidenceCategory"));
        [v18 setHighestConfidenceCategory:v28];

        uint64_t v29 = (void *)MEMORY[0x1E4F93950];
        uint64_t v30 = [v12 executableSpecification];
        unsigned int v31 = objc_msgSend(v29, "stringForExecutableType:", objc_msgSend(v30, "executableType"));
        [v18 setExecutableType:v31];

        [v18 setStackLocation:v17];
        uint64_t v32 = [(ATXBlendingBiomeStreamLogger *)self abGroup];
        [v18 setAbGroup:v32];

        v33 = [v12 clientModelSpecification];
        int v34 = [v33 clientModelVersion];
        [v18 setClientModelABGroup:v34];

        [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v18];
        int v35 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          int v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          id v56 = (id)objc_claimAutoreleasedReturnValue();
          long long v55 = [v18 clientModelId];
          uint64_t v39 = [v18 engagementType];
          if ((v39 - 1) >= 8)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v39);
            int v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            int v40 = off_1E68B33B0[(int)v39 - 1];
          }
          uint64_t v54 = v40;
          id v53 = [v18 widgetIdentifier];
          uint64_t v52 = [v18 highestConfidenceCategory];
          v51 = [v18 executableType];
          uint64_t v41 = [v18 stackLocation];
          if (v41 >= 6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v41);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = off_1E68B33F0[(int)v41];
          }
          int v50 = v42;
          long long v49 = [v18 abGroup];
          int v48 = [v18 clientModelABGroup];
          uint64_t v43 = [v18 selectionType];
          if (v43 == 1)
          {
            int v44 = @"NPlusOne";
          }
          else if (v43 == 2)
          {
            int v44 = @"StackRotation";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v43);
            int v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          int v47 = v44;
          *(_DWORD *)buf = 138414594;
          id v65 = v56;
          __int16 v66 = 2112;
          __int16 v67 = v55;
          __int16 v68 = 2112;
          __int16 v69 = v54;
          __int16 v70 = 2112;
          __int16 v71 = v53;
          __int16 v72 = 2112;
          __int16 v73 = v52;
          __int16 v74 = 2112;
          v75 = v51;
          __int16 v76 = 2112;
          v77 = v50;
          __int16 v78 = 2112;
          v79 = v49;
          __int16 v80 = 2112;
          v81 = v48;
          __int16 v82 = 2112;
          v83 = v44;
          _os_log_debug_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingWidgetRotationEngagementTracker with clientModelId: %@ and engagementType: %@ widgetIdentifier: %@ highestConfidenceCategory: %@ executableType: %@ stackLocation: %@ abGroup: %@ clientModelABGroup: %@ selectionType: %@", buf, 0x66u);
        }
        ++v6;
      }
      while (v59 != v6);
      uint64_t v45 = [obj countByEnumeratingWithState:&v60 objects:v84 count:16];
      uint64_t v59 = v45;
    }
    while (v45);
  }
LABEL_42:
}

- (id)_anchorModelEngagementMetricFromAnchorPrediction:(id)a3 proactiveSuggestion:(id)a4 feedbackMetadata:(id)a5 engagementType:(int)a6 consumerSubType:(id)a7 completedSession:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_new();
  objc_super v19 = [v17 anchorType];
  [v18 setAnchorType:v19];

  [v17 score];
  objc_msgSend(v18, "setScore:");
  objc_msgSend(v18, "setNumUniqueOccurrencesAfterAnchor:", objc_msgSend(v17, "numUniqueOccurrencesAfterAnchor"));
  [v17 posteriorProbability];
  objc_msgSend(v18, "setPosteriorProbability:");
  [v17 classConditionalProbability];
  objc_msgSend(v18, "setClassConditionalProbability:");
  [v17 standardDeviationOfOffsetFromAnchor];
  objc_msgSend(v18, "setStandardDeviationOfOffsetFromAnchor:");
  [v17 anchorPopularity];
  objc_msgSend(v18, "setAnchorPopularity:");
  [v17 globalPopularity];
  objc_msgSend(v18, "setGlobalPopularity:");
  v20 = [v17 candidateType];
  [v18 setCandidateType:v20];

  uint64_t v21 = [v17 offsetFromAnchorToShowPrediction];

  [v21 startSecondsAfterAnchor];
  [v18 setSecondsAfterAnchor:v22];

  uint64_t v23 = [v15 numberOfAnchorModelPredictions];
  [v18 setNumPredictionsforAnchor:v23];
  [v18 setEngagementType:v9];
  [v18 setConsumerSubType:v14];

  v24 = [v13 suggestion];

  uint64_t v25 = [v24 clientModelSpecification];
  uint64_t v26 = [v25 clientModelVersion];
  [v18 setAbGroup:v26];

  uint64_t v27 = [v16 genericStringForSuggestionExecutableObject];

  [v18 setExecutableObject:v27];
  return v18;
}

- (void)_logUnaggregatedAnchorModelEngagementMetric:(id)a3
{
  id v4 = a3;
  [(ATXPETEventTracker2Protocol *)self->_tracker logMessage:v4];
  id v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ATXBlendingBiomeStreamLogger *)(uint64_t)self _logUnaggregatedAnchorModelEngagementMetric:v5];
  }
}

- (void)logAnchorModelEngagementMetricsWithCompletedSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 feedbackMetadata];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 feedbackMetadata];
    v44[0] = 0;
    uint64_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:v44];
    id v11 = v44[0];

    if (v10 && !v11)
    {
      uint64_t v12 = [v4 suggestion];
      id v13 = [v10 anchorModelPredictionForProactiveSuggestion:v12];

      if (v13)
      {
        uint64_t v40 = 0;
        uint64_t v41 = &v40;
        uint64_t v42 = 0x2020000000;
        char v43 = 0;
        uint64_t v36 = 0;
        int v37 = &v36;
        uint64_t v38 = 0x2020000000;
        int v39 = 2;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __84__ATXBlendingBiomeStreamLogger_logAnchorModelEngagementMetricsWithCompletedSession___block_invoke;
        v30[3] = &unk_1E68B3368;
        v30[4] = self;
        id v14 = v13;
        id v31 = v14;
        id v15 = v4;
        id v32 = v15;
        id v16 = v10;
        id v33 = v16;
        int v34 = &v40;
        int v35 = &v36;
        [v15 enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:v30];
        uint64_t v17 = *((int *)v37 + 6);
        uint64_t v26 = v15;
        uint64_t v27 = v13;
        id v25 = v16;
        if (v17 >= 3) {
          uint64_t v29 = 0;
        }
        else {
          uint64_t v29 = qword_1D142B8E8[v17];
        }
        dataStoreWrapper = self->_dataStoreWrapper;
        uint64_t v18 = objc_opt_new();
        objc_super v19 = [v14 anchorType];
        v20 = [v14 anchorEvent];
        uint64_t v21 = [v20 identifier];
        double v22 = [v14 candidateId];
        [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper insertAnchorSuggestionOutcome:v29 date:v18 anchorType:v19 anchorEventIdentifier:v21 candidateId:v22];

        id v13 = v27;
        if (*((unsigned char *)v41 + 24))
        {
          uint64_t v23 = [v26 suggestion];
          v24 = [(ATXBlendingBiomeStreamLogger *)self _anchorModelEngagementMetricFromAnchorPrediction:v14 proactiveSuggestion:v23 feedbackMetadata:v25 engagementType:*((unsigned int *)v37 + 6) consumerSubType:@"SingleSuggestionAnyConsumerSubType" completedSession:v26];

          [(ATXBlendingBiomeStreamLogger *)self _logUnaggregatedAnchorModelEngagementMetric:v24];
        }

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
      }
    }
  }
}

void __84__ATXBlendingBiomeStreamLogger_logAnchorModelEngagementMetricsWithCompletedSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 3) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (a3 == 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 48) suggestion];
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a2];
  id v13 = [v7 _anchorModelEngagementMetricFromAnchorPrediction:v8 proactiveSuggestion:v9 feedbackMetadata:v10 engagementType:v6 consumerSubType:v11 completedSession:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) _logUnaggregatedAnchorModelEngagementMetric:v13];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
  if ((int)v6 < *(_DWORD *)(v12 + 24)) {
    *(_DWORD *)(v12 + 24) = v6;
  }
}

- (void)logBlendingLayerRefreshMetricWithBlendingModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F4B680];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v6, "stringForConsumerSubtype:", objc_msgSend(v8, "consumerSubType"));
  uint64_t v10 = [v7 cacheUpdateContext];

  uint64_t v11 = [v8 consumerSubType];
  uint64_t v12 = [v10 cacheAgeForPreviousBlendingUICacheUpdateForConsumerSubType:v11];

  [v12 doubleValue];
  if (v12)
  {
    double v14 = v13;
    if (v13 >= 0.0)
    {
      id v15 = objc_opt_new();
      [v15 setConsumerSubType:v9];
      id v16 = [(ATXBlendingBiomeStreamLogger *)self abGroup];
      [v15 setAbGroup:v16];

      [(ATXPETEventTracker2Protocol *)self->_tracker trackDistributionForMessage:v15 value:v14];
      uint64_t v17 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = (objc_class *)objc_opt_class();
        objc_super v19 = NSStringFromClass(v18);
        v20 = [v15 abGroup];
        int v21 = 138413058;
        double v22 = v19;
        __int16 v23 = 2112;
        v24 = v9;
        __int16 v25 = 2048;
        double v26 = v14;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        _os_log_debug_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingLayerRefreshTracker with consumerSubType: %@ interarrivalTime: %f abGroup: %@", (uint8_t *)&v21, 0x2Au);
      }
    }
  }
}

- (void)logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 uiCache];

  if (v5)
  {
    uint64_t v6 = [v4 uiCache];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v8 = [v4 uiCache];
    if (isKindOfClass)
    {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSuggestionLayout:consumerSubType:](self, "_logLayoutSelectedWithSuggestionLayout:consumerSubType:", v8, [v4 consumerSubType]);
    }
    else
    {
      objc_opt_class();
      char v9 = objc_opt_isKindOfClass();

      uint64_t v10 = [v4 uiCache];
      id v8 = v10;
      if (v9)
      {
        uint64_t v11 = [v10 cachedSuggestionWidgetLayouts];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke;
        v15[3] = &unk_1E68B3390;
        v15[4] = self;
        [v11 enumerateKeysAndObjectsUsingBlock:v15];

        uint64_t v12 = [v8 cachedAppPredictionPanelLayouts];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke_2;
        v14[3] = &unk_1E68B3390;
        v14[4] = self;
        [v12 enumerateKeysAndObjectsUsingBlock:v14];
      }
      else
      {
        objc_opt_class();
        char v13 = objc_opt_isKindOfClass();

        if (v13)
        {
          id v8 = [v4 uiCache];
          -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:](self, "_logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:", v8, [v4 consumerSubType]);
        }
        else
        {
          id v8 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
            [(ATXBlendingBiomeStreamLogger *)(uint64_t)self logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:v8];
          }
        }
      }
    }
  }
}

uint64_t __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _logLayoutSelectedWithSuggestionLayout:a3 consumerSubType:36];
}

uint64_t __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _logLayoutSelectedWithSuggestionLayout:a3 consumerSubType:37];
}

- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = [a3 highestConfidenceSuggestion];
  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = [MEMORY[0x1E4F939C8] stringFromUILayoutType:11];
    [v7 setLayoutType:v8];

    char v9 = (void *)MEMORY[0x1E4F93968];
    uint64_t v10 = [v6 scoreSpecification];
    uint64_t v11 = objc_msgSend(v9, "stringForSuggestedConfidenceCategory:", objc_msgSend(v10, "suggestedConfidenceCategory"));
    [v7 setHighestConfidenceCategory:v11];

    uint64_t v12 = [v6 clientModelSpecification];
    char v13 = [v12 clientModelId];
    [v7 setHighestRankingClientModelId:v13];

    double v14 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    [v7 setConsumerSubType:v14];

    id v15 = (void *)MEMORY[0x1E4F93950];
    id v16 = [v6 executableSpecification];
    uint64_t v17 = objc_msgSend(v15, "stringForExecutableType:", objc_msgSend(v16, "executableType"));
    [v7 setExecuableTypeOfHighestRankingSuggestion:v17];

    uint64_t v18 = [(ATXBlendingBiomeStreamLogger *)self abGroup];
    [v7 setAbGroup:v18];

    objc_super v19 = [v6 clientModelSpecification];
    v20 = [v19 clientModelVersion];
    [v7 setHighestRankingClientModelABGroup:v20];

    [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v7];
    int v21 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:]((uint64_t)self, v7);
    }
  }
  else
  {
    id v7 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:]();
    }
  }
}

- (void)_logLayoutSelectedWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 uuidOfHighestConfidenceSuggestion];
  id v8 = [v6 suggestionWithUUID:v7];

  if (v8)
  {
    char v9 = objc_opt_new();
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F939C8], "stringFromUILayoutType:", objc_msgSend(v6, "layoutType"));
    [v9 setLayoutType:v10];

    uint64_t v11 = (void *)MEMORY[0x1E4F93968];
    uint64_t v12 = [v8 scoreSpecification];
    char v13 = objc_msgSend(v11, "stringForSuggestedConfidenceCategory:", objc_msgSend(v12, "suggestedConfidenceCategory"));
    [v9 setHighestConfidenceCategory:v13];

    double v14 = [v8 clientModelSpecification];
    id v15 = [v14 clientModelId];
    [v9 setHighestRankingClientModelId:v15];

    id v16 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    [v9 setConsumerSubType:v16];

    uint64_t v17 = (void *)MEMORY[0x1E4F93950];
    uint64_t v18 = [v8 executableSpecification];
    objc_super v19 = objc_msgSend(v17, "stringForExecutableType:", objc_msgSend(v18, "executableType"));
    [v9 setExecuableTypeOfHighestRankingSuggestion:v19];

    v20 = [(ATXBlendingBiomeStreamLogger *)self abGroup];
    [v9 setAbGroup:v20];

    int v21 = [v8 clientModelSpecification];
    double v22 = [v21 clientModelVersion];
    [v9 setHighestRankingClientModelABGroup:v22];

    [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v9];
    __int16 v23 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:]((uint64_t)self, v9);
    }
  }
  else
  {
    char v9 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:]();
    }
  }
}

- (void)logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 uiCache];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 uiCache];
    id v8 = [v7 cachedSuggestionWidgetLayouts];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke;
    v11[3] = &unk_1E68B3390;
    v11[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];

    char v9 = [v7 cachedAppPredictionPanelLayouts];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke_2;
    void v10[3] = &unk_1E68B3390;
    v10[4] = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

uint64_t __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:a3 consumerSubType:36];
}

uint64_t __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:a3 consumerSubType:37];
}

- (void)_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 uuidOfHighestConfidenceSuggestion];
  id v8 = [v6 suggestionWithUUID:v7];

  char v9 = [v8 clientModelSpecification];
  uint64_t v10 = [v9 clientModelId];

  if (v8)
  {
    uint64_t v28 = self;
    uint64_t v29 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = [v6 minSuggestionListInLayout];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    unsigned int v27 = v4;
    if (v12)
    {
      uint64_t v13 = v12;
      LODWORD(v14) = 0;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = [*(id *)(*((void *)&v30 + 1) + 8 * i) clientModelSpecification];
          uint64_t v18 = [v17 clientModelId];
          int v19 = [v18 isEqualToString:v10];

          uint64_t v14 = (v14 + v19);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    v20 = objc_opt_new();
    int v21 = objc_msgSend(MEMORY[0x1E4F939C8], "stringFromUILayoutType:", objc_msgSend(v6, "layoutType"));
    [v20 setLayoutType:v21];

    [v20 setClientModelId:v10];
    [v20 setNumSuggestionsForClientModelInLayout:v14];
    double v22 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v27];
    [v20 setConsumerSubType:v22];

    __int16 v23 = [(ATXBlendingBiomeStreamLogger *)v28 abGroup];
    [v20 setAbGroup:v23];

    id v8 = v29;
    v24 = [v29 clientModelSpecification];
    __int16 v25 = [v24 clientModelVersion];
    [v20 setClientModelABGroup:v25];

    [(ATXPETEventTracker2Protocol *)v28->_tracker trackScalarForMessage:v20];
    double v26 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[ATXBlendingBiomeStreamLogger _logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:consumerSubType:]((uint64_t)v28, v20, v26);
    }
  }
  else
  {
    v20 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:]();
    }
  }
}

- (void)logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 uiCache];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 uiCache];
    id v8 = [v7 cachedTopOfStackLayouts];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke;
    v9[3] = &unk_1E68B3390;
    v9[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unsigned int v5 = [v4 uuidOfHighestConfidenceSuggestion];
  id v6 = [v4 suggestionWithUUID:v5];

  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = objc_msgSend(MEMORY[0x1E4F939C8], "stringFromUILayoutType:", objc_msgSend(v4, "layoutType"));
    [v7 setLayoutType:v8];

    if ([v4 isNPlusOne]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    [v7 setSelectionType:v9];
    uint64_t v10 = [v6 clientModelSpecification];
    uint64_t v11 = [v10 clientModelId];
    [v7 setClientModelIdOfHighestRankingSuggestion:v11];

    uint64_t v12 = (void *)MEMORY[0x1E4F93968];
    uint64_t v13 = [v6 scoreSpecification];
    uint64_t v14 = objc_msgSend(v12, "stringForSuggestedConfidenceCategory:", objc_msgSend(v13, "suggestedConfidenceCategory"));
    [v7 setHighestConfidenceCategory:v14];

    uint64_t v15 = (void *)MEMORY[0x1E4F93950];
    id v16 = [v6 executableSpecification];
    uint64_t v17 = objc_msgSend(v15, "stringForExecutableType:", objc_msgSend(v16, "executableType"));
    [v7 setExecuableTypeOfHighestRankingSuggestion:v17];

    int v19 = *(void **)(a1 + 32);
    uint64_t v18 = (id *)(a1 + 32);
    v20 = [v19 abGroup];
    [v7 setAbGroup:v20];

    int v21 = [v6 clientModelSpecification];
    double v22 = [v21 clientModelVersion];
    [v7 setClientModelABGroup:v22];

    objc_msgSend(v7, "setWidgetsInStack:", objc_msgSend(*v18, "_ensureWidgetsInStackBetweenZeroAndTen:", objc_msgSend(v4, "numWidgetsInStack")));
    [*((id *)*v18 + 7) trackScalarForMessage:v7];
    __int16 v23 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke_cold_1((uint64_t)v18, v7, v23);
    }
  }
}

- (unsigned)_ensureWidgetsInStackBetweenZeroAndTen:(unint64_t)a3
{
  if (a3 >= 0xA) {
    return 10;
  }
  else {
    return a3;
  }
}

- (void)_logCacheAgeMetricEventWithCacheAge:(double)a3 clientModelId:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setCacheName:v6];

  [(ATXPETEventTracker2Protocol *)self->_tracker trackDistributionForMessage:v7 value:a3];
  id v8 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = [v7 cacheName];
    int v12 = 138412802;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    double v17 = a3;
    _os_log_debug_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMCacheAgeAtCacheRefreshTracker with cacheName: %@ and cacheAge: %f", (uint8_t *)&v12, 0x20u);
  }
}

- (ATXBMBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (BPSPublisher)clientModelPublisher
{
  return self->_clientModelPublisher;
}

- (void)setClientModelPublisher:(id)a3
{
}

- (BPSPublisher)blendingModelPublisher
{
  return self->_blendingModelPublisher;
}

- (void)setBlendingModelPublisher:(id)a3
{
}

- (BPSPublisher)uiPublisher
{
  return self->_uiPublisher;
}

- (void)setUiPublisher:(id)a3
{
}

- (ATXPETEventTracker2Protocol)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- (ATXHeroAppSingleSuggestionLogger)heroLogger
{
  return self->_heroLogger;
}

- (void)setHeroLogger:(id)a3
{
}

- (ATXAppClipSingleSuggestionLogger)appClipLogger
{
  return self->_appClipLogger;
}

- (void)setAppClipLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipLogger, 0);
  objc_storeStrong((id *)&self->_heroLogger, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_uiPublisher, 0);
  objc_storeStrong((id *)&self->_blendingModelPublisher, 0);
  objc_storeStrong((id *)&self->_clientModelPublisher, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_currentABGroup, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
}

void __69__ATXBlendingBiomeStreamLogger__loggerContextPublisherWithPublisher___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "event from biome stream can't be deserialized", v1, 2u);
}

- (void)tryLogSingleSuggestionSessionMetricsWithLoggerContext:(void *)a1 .cold.1(void *a1)
{
  v2 = [a1 sessionTrackingContext];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v11 = [a1 sessionTrackingContext];
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v5, v6, "%@ - finished logging sessions, state is: %@", v7, v8, v9, v10, 2u);
}

- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - did not find suggestion layout: %@", v4, v5, v6, v7, v8);
}

- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - did not find suggestion inside suggestion layout: %@", v4, v5, v6, v7, v8);
}

- (void)_logUnaggregatedAnchorModelEngagementMetric:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [a2 consumerSubType];
  uint64_t v8 = [a2 engagementType];
  if (v8 > 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = off_1E68B3420[(int)v8];
  }
  uint64_t v10 = [a2 anchorType];
  [a2 score];
  uint64_t v12 = v11;
  uint64_t v13 = [a2 candidateType];
  int v14 = [a2 secondsAfterAnchor];
  int v15 = [a2 numPredictionsforAnchor];
  __int16 v16 = [a2 abGroup];
  double v17 = [a2 executableObject];
  OUTLINED_FUNCTION_3_5();
  __int16 v21 = v18;
  double v22 = v10;
  __int16 v23 = 2048;
  uint64_t v24 = v12;
  __int16 v25 = v18;
  double v26 = v13;
  __int16 v27 = 1024;
  int v28 = v14;
  __int16 v29 = 1024;
  int v30 = v15;
  __int16 v31 = v18;
  long long v32 = v16;
  __int16 v33 = v18;
  uint64_t v34 = v19;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelEngagementTracker with consumerSubType: %@ engagementType: %@ anchorType: %@ score: %f candidateType: %@ secondsAfterAnchor: %u numPredictionsforAnchor: %u abGroup: %@ executableObject: %@", buf, 0x5Eu);
}

- (void)logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 uiCache];
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(a2, "consumerSubType"));
  int v11 = 138412802;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  int v14 = v9;
  __int16 v15 = 2112;
  __int16 v16 = v10;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "%@ - got blending cache update with unsupported class: %@ for consumerSubType: %@", (uint8_t *)&v11, 0x20u);
}

- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - could not determine highest confidence suggestion from suggestion layout", v4, v5, v6, v7, 2u);
}

- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:(uint64_t)a1 consumerSubType:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 layoutType];
  uint64_t v6 = [a2 consumerSubType];
  uint64_t v7 = [a2 highestConfidenceCategory];
  uint64_t v8 = [a2 highestRankingClientModelId];
  uint64_t v9 = [a2 execuableTypeOfHighestRankingSuggestion];
  uint64_t v10 = [a2 abGroup];
  int v11 = [a2 highestRankingClientModelABGroup];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_5_2(&dword_1D0FA3000, v12, v13, "LOGGED: %@ - ATXMPBBlendingLayoutSelectionTracker with layoutType: %@ consumerSubType: %@ highestConfidenceCategory: %@ highestRankingClientModelId: %@ execuableTypeOfHighestRankingSuggestion: %@ abGroup: %@ highestRankingClientModelABGroup: %@", v14, v15, v16, v17, v18);
}

- (void)_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:(NSObject *)a3 consumerSubType:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 layoutType];
  uint64_t v8 = [a2 clientModelId];
  int v9 = [a2 numSuggestionsForClientModelInLayout];
  uint64_t v10 = [a2 consumerSubType];
  int v11 = [a2 abGroup];
  uint64_t v12 = [a2 clientModelABGroup];
  int v13 = 138413826;
  uint64_t v14 = v6;
  __int16 v15 = 2112;
  uint64_t v16 = v7;
  __int16 v17 = 2112;
  uint8_t v18 = v8;
  __int16 v19 = 1024;
  int v20 = v9;
  __int16 v21 = 2112;
  double v22 = v10;
  __int16 v23 = 2112;
  uint64_t v24 = v11;
  __int16 v25 = 2112;
  double v26 = v12;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelHomeScreenLayoutTracker with layoutType: %@ clientModelId: %@ numSuggestionsForClientModelInLayout: %u consumerSubType: %@ abGroup: %@ clientModelABGroup: %@", (uint8_t *)&v13, 0x44u);
}

void __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [a2 layoutType];
  uint64_t v8 = [a2 selectionType];
  if (v8 == 1)
  {
    int v9 = @"NPlusOne";
  }
  else if (v8 == 2)
  {
    int v9 = @"StackRotation";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  int v10 = [a2 widgetsInStack];
  int v11 = [a2 clientModelIdOfHighestRankingSuggestion];
  uint64_t v12 = [a2 highestConfidenceCategory];
  int v13 = [a2 execuableTypeOfHighestRankingSuggestion];
  uint64_t v14 = [a2 abGroup];
  __int16 v15 = [a2 clientModelABGroup];
  OUTLINED_FUNCTION_3_5();
  __int16 v19 = 1024;
  int v20 = v10;
  __int16 v21 = v16;
  double v22 = v11;
  __int16 v23 = v16;
  uint64_t v24 = v12;
  __int16 v25 = v16;
  double v26 = v13;
  __int16 v27 = v16;
  int v28 = v14;
  __int16 v29 = v16;
  uint64_t v30 = v17;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker with layoutType: %@, selectionType: %@, widgetsInStack: %u clientModelIdOfHighestRankingSuggestion: %@ highestConfidenceCategory: %@ execuableTypeOfHighestRankingSuggestion: %@ abGroup: %@ clientModelABGroup: %@", buf, 0x58u);
}

@end
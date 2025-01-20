@interface MUPlaceCardImpressionsLogger
- (MUPlaceCardImpressionsLogger)init;
- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4;
- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5;
@end

@implementation MUPlaceCardImpressionsLogger

- (MUPlaceCardImpressionsLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceCardImpressionsLogger;
  v2 = [(MUPlaceCardImpressionsLogger *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MapsUI.MUPlaceCardImpressionsLogger", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__MUPlaceCardImpressionsLogger_logImpressionElementDidEnter_onDate___block_invoke;
  v11[3] = &unk_1E574EE08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);
}

void __68__MUPlaceCardImpressionsLogger_logImpressionElementDidEnter_onDate___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) customData];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  double v4 = v3;
  v5 = MUGetMUPlaceCardImpressionLoggingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) debugString];
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    __int16 v17 = 2048;
    double v18 = v4;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "Logging element did enter @%@ with start date %f", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1E4F63E30];
  v8 = [*(id *)(a1 + 32) sessionIdentifier];
  id v9 = [v2 query];
  uint64_t v10 = [v2 businessId];
  uint64_t v11 = [v2 localSearchProviderId];
  uint64_t v12 = [v2 moduleIndex];
  uint64_t v13 = [v2 moduleType];
  HIDWORD(v14) = 1;
  LOBYTE(v14) = [v2 isEnriched];
  objc_msgSend(v7, "capturePlaceCardImpressionEventWithImpressionObjectId:query:businessId:localSearchProviderId:elementIndex:moduleType:isEnriched:impressionEvent:impressionVisibleTimestamp:impressionNonvisibleTimestamp:", v8, v9, v10, v11, v12, v13, v4, 0.0, v14);
}

- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a4 timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v13 = v12;

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MUPlaceCardImpressionsLogger_logImpressionElementDidExit_usingEnterDate_exitDate___block_invoke;
  block[3] = &unk_1E5751198;
  id v17 = v8;
  uint64_t v18 = v11;
  uint64_t v19 = v13;
  id v15 = v8;
  dispatch_async(isolationQueue, block);
}

void __84__MUPlaceCardImpressionsLogger_logImpressionElementDidExit_usingEnterDate_exitDate___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) customData];
  double v3 = MUGetMUPlaceCardImpressionLoggingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = [*(id *)(a1 + 32) debugString];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_INFO, "Logging element did exit @%@ with start date %f, end date %f", buf, 0x20u);
  }
  id v7 = (void *)MEMORY[0x1E4F63E30];
  id v8 = [*(id *)(a1 + 32) sessionIdentifier];
  id v9 = [v2 query];
  uint64_t v10 = [v2 businessId];
  uint64_t v11 = [v2 localSearchProviderId];
  uint64_t v12 = [v2 moduleIndex];
  uint64_t v13 = [v2 moduleType];
  HIDWORD(v14) = 2;
  LOBYTE(v14) = [v2 isEnriched];
  objc_msgSend(v7, "capturePlaceCardImpressionEventWithImpressionObjectId:query:businessId:localSearchProviderId:elementIndex:moduleType:isEnriched:impressionEvent:impressionVisibleTimestamp:impressionNonvisibleTimestamp:", v8, v9, v10, v11, v12, v13, *(double *)(a1 + 40), *(double *)(a1 + 48), v14);
}

- (void).cxx_destruct
{
}

@end
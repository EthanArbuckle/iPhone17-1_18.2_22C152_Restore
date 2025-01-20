@interface VCPMADCoreAnalyticsManager
+ (id)sharedManager;
- (VCPMADCoreAnalyticsManager)init;
- (id)fetchSessionEvent:(id)a3;
- (id)valueForField:(id)a3 andEvent:(id)a4;
- (void)accumulateDoubleValue:(double)a3 forField:(id)a4 andEvent:(id)a5;
- (void)accumulateInt64Value:(int64_t)a3 forField:(id)a4 andEvent:(id)a5;
- (void)dealloc;
- (void)flush;
- (void)sendEvent:(id)a3 withAnalytics:(id)a4;
- (void)sendSessionEvent:(id)a3;
- (void)setValue:(id)a3 forField:(id)a4 andEvent:(id)a5;
@end

@implementation VCPMADCoreAnalyticsManager

- (VCPMADCoreAnalyticsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPMADCoreAnalyticsManager;
  v2 = [(VCPMADCoreAnalyticsManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaanalysis.coreanalytics", v3);
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    sessionAnalytics = v2->_sessionAnalytics;
    v2->_sessionAnalytics = (NSMutableDictionary *)v6;

    v2->_singleAnalyticsSentCount = 0;
    v2->_sessionAnalyticsSentCount = 0;
  }
  return v2;
}

+ (id)sharedManager
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = [v2 sharedInstanceWithIdentifier:@"VCPMADCoreAnalyticsManager" andCreationBlock:&__block_literal_global_92];

  return v3;
}

VCPMADCoreAnalyticsManager *__43__VCPMADCoreAnalyticsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(VCPMADCoreAnalyticsManager);
  return v0;
}

- (void)dealloc
{
  [(VCPMADCoreAnalyticsManager *)self flush];
  v3.receiver = self;
  v3.super_class = (Class)VCPMADCoreAnalyticsManager;
  [(VCPMADCoreAnalyticsManager *)&v3 dealloc];
}

- (void)sendEvent:(id)a3 withAnalytics:(id)a4
{
}

- (void)setValue:(id)a3 forField:(id)a4 andEvent:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_12;
    }
    v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session event name is nil; skipping",
        buf,
        2u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_12;
    }
    v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session fields name is nil for event %@; skipping",
        buf,
        0xCu);
    }
    goto LABEL_11;
  }
  managementQueue = self->_managementQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__VCPMADCoreAnalyticsManager_setValue_forField_andEvent___block_invoke;
  v14[3] = &unk_1E6299898;
  v14[4] = self;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  dispatch_sync(managementQueue, v14);

LABEL_12:
}

void __57__VCPMADCoreAnalyticsManager_setValue_forField_andEvent___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1[4] + 32) setObject:v3 forKeyedSubscript:a1[5]];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      dispatch_queue_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a1[5];
        uint64_t v6 = [*(id *)(a1[4] + 32) count];
        int v8 = 138412546;
        uint64_t v9 = v5;
        __int16 v10 = 2048;
        uint64_t v11 = v6;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Start session event %@ (total session count %lu)", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  v7 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  [v7 setValue:a1[6] forKey:a1[7]];
}

- (void)accumulateInt64Value:(int64_t)a3 forField:(id)a4 andEvent:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = v9;
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_17;
    }
    uint64_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session event name is nil; skipping",
        buf,
        2u);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_17;
    }
    uint64_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session fields name is nil for event %@; skipping",
        buf,
        0xCu);
    }
    goto LABEL_16;
  }
  if (!a3)
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_17;
    }
    uint64_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[CoreAnalyticManager] Ignore 0-accumulation for event %@ field %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  managementQueue = self->_managementQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__VCPMADCoreAnalyticsManager_accumulateInt64Value_forField_andEvent___block_invoke;
  v13[3] = &unk_1E629CB48;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a3;
  dispatch_sync(managementQueue, v13);

LABEL_17:
}

void __69__VCPMADCoreAnalyticsManager_accumulateInt64Value_forField_andEvent___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1[4] + 32) setObject:v3 forKeyedSubscript:a1[5]];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      dispatch_queue_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a1[5];
        uint64_t v6 = [*(id *)(a1[4] + 32) count];
        int v11 = 138412546;
        uint64_t v12 = v5;
        __int16 v13 = 2048;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Start session event %@ (total session count %lu)", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  v7 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  id v8 = [v7 valueForKey:a1[6]];

  id v9 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  __int16 v10 = objc_msgSend(NSNumber, "numberWithLongLong:", a1[7] + objc_msgSend(v8, "longLongValue"));
  [v9 setValue:v10 forKey:a1[6]];
}

- (void)accumulateDoubleValue:(double)a3 forField:(id)a4 andEvent:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = v9;
  if (v9)
  {
    if (v8)
    {
      if (a3 != 0.0)
      {
        managementQueue = self->_managementQueue;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __70__VCPMADCoreAnalyticsManager_accumulateDoubleValue_forField_andEvent___block_invoke;
        v13[3] = &unk_1E629CB48;
        v13[4] = self;
        id v14 = v9;
        id v15 = v8;
        double v16 = a3;
        dispatch_sync(managementQueue, v13);

        goto LABEL_17;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v10;
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[CoreAnalyticManager] Ignore 0-accumulation for event %@ field %@", buf, 0x16u);
        }
LABEL_15:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      int v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session fields name is nil for event %@; skipping",
          buf,
          0xCu);
      }
      goto LABEL_15;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    int v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session event name is nil; skipping",
        buf,
        2u);
    }
    goto LABEL_15;
  }
LABEL_17:
}

void __70__VCPMADCoreAnalyticsManager_accumulateDoubleValue_forField_andEvent___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      dispatch_queue_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        int v13 = 138412546;
        uint64_t v14 = v5;
        __int16 v15 = 2048;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Start session event %@ (total session count %lu)", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v8 = [v7 valueForKey:*(void *)(a1 + 48)];

  id v9 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  __int16 v10 = NSNumber;
  [v8 doubleValue];
  uint64_t v12 = [v10 numberWithDouble:v11 + *(double *)(a1 + 56)];
  [v9 setValue:v12 forKey:*(void *)(a1 + 48)];
}

- (id)valueForField:(id)a3 andEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__58;
  uint64_t v21 = __Block_byref_object_dispose__58;
  id v22 = 0;
  managementQueue = self->_managementQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__VCPMADCoreAnalyticsManager_valueForField_andEvent___block_invoke;
  v13[3] = &unk_1E629CB70;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  uint64_t v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __53__VCPMADCoreAnalyticsManager_valueForField_andEvent___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    id v8 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
    uint64_t v3 = [v8 valueForKey:a1[6]];
    uint64_t v4 = *(void *)(a1[7] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Session event %@ not available", buf, 0xCu);
    }
  }
}

- (void)sendSessionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    managementQueue = self->_managementQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__VCPMADCoreAnalyticsManager_sendSessionEvent___block_invoke;
    v8[3] = &unk_1E62982E8;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(managementQueue, v8);
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Session event name is nil; skipping",
        buf,
        2u);
    }
  }
}

void __47__VCPMADCoreAnalyticsManager_sendSessionEvent___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    AnalyticsSendEvent();

    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
    [v5 removeObjectForKey:v4];
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Session event %@ not available; skip sending",
        (uint8_t *)&v8,
        0xCu);
    }
  }
}

- (id)fetchSessionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__58;
  uint64_t v16 = __Block_byref_object_dispose__58;
  id v17 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCPMADCoreAnalyticsManager_fetchSessionEvent___block_invoke;
  block[3] = &unk_1E6298070;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(managementQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__VCPMADCoreAnalyticsManager_fetchSessionEvent___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v9 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
    uint64_t v4 = [v3 initWithDictionary:v9 copyItems:1];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "[CoreAnalyticManager] Session event %@ not available; skip fetching",
        buf,
        0xCu);
    }
  }
}

- (void)flush
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[CoreAnalyticManager] flushing analytics ... ", buf, 2u);
    }
  }
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCPMADCoreAnalyticsManager_flush__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

uint64_t __35__VCPMADCoreAnalyticsManager_flush__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "[CoreAnalyticManager] flushSessionAnalytics (total count %lu)", buf, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__VCPMADCoreAnalyticsManager_flush__block_invoke_199;
  v7[3] = &unk_1E629CB98;
  v7[4] = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
  return [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
}

void __35__VCPMADCoreAnalyticsManager_flush__block_invoke_199(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:");
  AnalyticsSendEvent();

  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
}

@end
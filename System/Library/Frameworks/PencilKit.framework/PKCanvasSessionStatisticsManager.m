@interface PKCanvasSessionStatisticsManager
+ (id)sharedStatisticsManager;
- (void)_logFeatureUsed:(uint64_t)a1;
- (void)_sendUsageSessionStatistics;
- (void)endSession;
- (void)logFeatureUsed:(uint64_t)a1;
@end

@implementation PKCanvasSessionStatisticsManager

+ (id)sharedStatisticsManager
{
  self;
  if (_MergedGlobals_146 != -1) {
    dispatch_once(&_MergedGlobals_146, &__block_literal_global_60);
  }
  v0 = (void *)qword_1EB3C60A8;

  return v0;
}

void __59__PKCanvasSessionStatisticsManager_sharedStatisticsManager__block_invoke()
{
  v0 = objc_alloc_init(PKCanvasSessionStatisticsManager);
  v1 = (void *)qword_1EB3C60A8;
  qword_1EB3C60A8 = (uint64_t)v0;
}

- (void)_logFeatureUsed:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    id v11 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      id v3 = v11;
      v4 = *(void **)(a1 + 8);
    }
    v7 = [v4 objectForKey:v3];
    v8 = v7;
    if (v7) {
      uint64_t v9 = [v7 integerValue] + 1;
    }
    else {
      uint64_t v9 = 1;
    }
    v10 = [NSNumber numberWithInteger:v9];
    [*(id *)(a1 + 8) setObject:v10 forKeyedSubscript:v11];

    id v3 = v11;
  }
}

- (void)logFeatureUsed:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      -[PKCanvasSessionStatisticsManager _logFeatureUsed:](a1, v3);
    }
    else
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __51__PKCanvasSessionStatisticsManager_logFeatureUsed___block_invoke;
      v4[3] = &unk_1E64C5F60;
      v4[4] = a1;
      id v5 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
}

void __51__PKCanvasSessionStatisticsManager_logFeatureUsed___block_invoke(uint64_t a1)
{
}

- (void)_sendUsageSessionStatistics
{
  v28[16] = *MEMORY[0x1E4F143B8];
  v2 = +[PKRecognitionSessionManager enabledLocales];
  id v3 = [v2 firstObject];
  v18 = [v3 localeIdentifier];

  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [*(id *)(a1 + 8) allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v10 = [*(id *)(a1 + 8) objectForKeyedSubscript:v9];
        if ((int)[v10 intValue] <= 0) {
          id v11 = &unk_1F200E778;
        }
        else {
          id v11 = &unk_1F200E760;
        }
        [v4 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v20 = __63__PKCanvasSessionStatisticsManager__sendUsageSessionStatistics__block_invoke;
  v21 = &unk_1E64C9930;
  id v22 = v4;
  id v23 = v18;
  id v12 = v18;
  id v13 = v4;
  v14 = v19;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.handwritingd.pkanalytics" options:0];
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F20A7548];
  [v15 setRemoteObjectInterface:v16];
  [v15 resume];
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = &v24;
  *(void *)&long long v25 = 0x2020000000;
  BYTE8(v25) = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__PKCanvasSessionStatisticsManager__messageHandwritingAnalyticsWithProxyBlock___block_invoke;
  v28[3] = &unk_1E64C9958;
  v28[4] = &v24;
  v17 = [v15 remoteObjectProxyWithErrorHandler:v28];
  if (!*(unsigned char *)(*((void *)&v24 + 1) + 24)) {
    v20((uint64_t)v14, v17);
  }
  [v15 invalidate];

  _Block_object_dispose(&v24, 8);
}

- (void)endSession
{
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      -[PKCanvasSessionStatisticsManager _sendUsageSessionStatistics](a1);
      v2 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__PKCanvasSessionStatisticsManager_endSession__block_invoke;
      block[3] = &unk_1E64C61C0;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __46__PKCanvasSessionStatisticsManager_endSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    -[PKCanvasSessionStatisticsManager _sendUsageSessionStatistics](*(void *)(a1 + 32));
    v2 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = 0;
  }
}

uint64_t __63__PKCanvasSessionStatisticsManager__sendUsageSessionStatistics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndPKCanvasSession:*(void *)(a1 + 32) withInputMode:*(void *)(a1 + 40)];
}

void __79__PKCanvasSessionStatisticsManager__messageHandwritingAnalyticsWithProxyBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection for analytics: %@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (void).cxx_destruct
{
}

@end
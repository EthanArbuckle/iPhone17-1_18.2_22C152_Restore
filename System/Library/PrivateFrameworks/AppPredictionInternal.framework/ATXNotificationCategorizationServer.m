@interface ATXNotificationCategorizationServer
+ (id)sharedInstance;
- (ATXNotificationCategorizationServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)collectCoreAnalyticsJsonForNotification:(id)a3 completion:(id)a4;
- (void)collectDynamicBreakthroughFeaturesForNotification:(id)a3 completion:(id)a4;
- (void)fetchContextForMailWithRequest:(id)a3 completion:(id)a4;
- (void)fetchContextForMessageWithRequest:(id)a3 completion:(id)a4;
- (void)fetchContextForNotificationWithRequest:(id)a3 completion:(id)a4;
- (void)rankUserNotificationWithRequest:(id)a3 completion:(id)a4;
@end

@implementation ATXNotificationCategorizationServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_16 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_16, &__block_literal_global_109);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_21;
  return v2;
}

void __53__ATXNotificationCategorizationServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_21;
  sharedInstance__pasExprOnceResult_21 = v1;
}

- (ATXNotificationCategorizationServer)init
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)ATXNotificationCategorizationServer;
  v2 = [(ATXNotificationCategorizationServer *)&v28 init];
  if (v2)
  {
    v3 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXNotificationCategorizationServer: launched", buf, 2u);
    }

    objc_initWeak(&location, v2);
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B68]) initWithBlock:&__block_literal_global_32_0];
    contactStore = v2->_contactStore;
    v2->_contactStore = (_PASLazyResult *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F93B68]);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __43__ATXNotificationCategorizationServer_init__block_invoke_2;
    v25 = &unk_1E68B1908;
    objc_copyWeak(&v26, &location);
    uint64_t v7 = [v6 initWithBlock:&v22];
    contactRelationships = v2->_contactRelationships;
    v2->_contactRelationships = (_PASLazyResult *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F93B68]);
    uint64_t v10 = objc_msgSend(v9, "initWithBlock:", &__block_literal_global_38, v22, v23, v24, v25);
    featuresCorrelator = v2->_featuresCorrelator;
    v2->_featuresCorrelator = (_PASLazyResult *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93B68]) initWithBlock:&__block_literal_global_42];
    notificationSenderImportanceModel = v2->_notificationSenderImportanceModel;
    v2->_notificationSenderImportanceModel = (_PASLazyResult *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F93B68]) initWithBlock:&__block_literal_global_46];
    mailSenderImportanceModel = v2->_mailSenderImportanceModel;
    v2->_mailSenderImportanceModel = (_PASLazyResult *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F93B68]) initWithBlock:&__block_literal_global_50_0];
    messageSenderImportanceModel = v2->_messageSenderImportanceModel;
    v2->_messageSenderImportanceModel = (_PASLazyResult *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.personalization.notificationCategorization"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v18;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v20 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ATXNotificationCategorizationServer init]";
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%s: Listening for connections", buf, 0xCu);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

ATXContactRelationshipsCollector *__43__ATXNotificationCategorizationServer_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [ATXContactRelationshipsCollector alloc];
    v3 = [WeakRetained[6] result];
    uint64_t v4 = [(ATXContactRelationshipsCollector *)v2 initWithContactStore:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_3()
{
  v0 = objc_opt_new();
  return v0;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_4()
{
  v0 = objc_opt_new();
  return v0;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_5()
{
  v0 = objc_opt_new();
  return v0;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_6()
{
  v0 = objc_opt_new();
  return v0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ATXNotificationCategorizationServer listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "%s: Connection attempted", buf, 0xCu);
  }

  id v9 = [v7 valueForEntitlement:@"com.apple.personalization.notificationCategorization"];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && ([v9 BOOLValue] & 1) != 0)
  {
    uint64_t v10 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[ATXNotificationCategorizationServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "%s: Connection established", buf, 0xCu);
    }

    v11 = ATXNotificationCategorizationXPCInterface();
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:self];
    objc_initWeak((id *)buf, v7);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke;
    v26[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v27, (id *)buf);
    [v7 setInterruptionHandler:v26];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_58;
    v24 = &unk_1E68AC2D0;
    objc_copyWeak(&v25, (id *)buf);
    [v7 setInvalidationHandler:&v21];
    objc_msgSend(v7, "resume", v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    BOOL v12 = 1;
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationServer listener:shouldAcceptNewConnection:]((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);
    }

    BOOL v12 = 0;
  }

  return v12;
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_58_cold_1();
  }
}

- (void)collectDynamicBreakthroughFeaturesForNotification:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  v8 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    v20 = "-[ATXNotificationCategorizationServer collectDynamicBreakthroughFeaturesForNotification:completion:]";
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Starting %s", (uint8_t *)&v19, 0xCu);
  }

  id v9 = __atxlog_handle_notification_categorization();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = __atxlog_handle_notification_categorization();
  BOOL v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ATXNotificationCategorizationServer.dynamicBreakthroughDataCollection", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  v13 = [(_PASLazyResult *)self->_featuresCorrelator result];
  uint64_t v14 = [(_PASLazyResult *)self->_contactStore result];
  uint64_t v15 = [(_PASLazyResult *)self->_contactRelationships result];
  uint64_t v16 = [v13 collectDynamicBreakthroughFeaturesForNotification:v7 contactStore:v14 withContactRelationships:v15];

  uint64_t v17 = __atxlog_handle_notification_categorization();
  uint64_t v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v18, OS_SIGNPOST_INTERVAL_END, v10, "ATXNotificationCategorizationServer.dynamicBreakthroughDataCollection", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  v6[2](v6, v16, 0);
}

- (void)collectCoreAnalyticsJsonForNotification:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  v8 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[ATXNotificationCategorizationServer collectCoreAnalyticsJsonForNotification:completion:]";
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  id v9 = __atxlog_handle_notification_categorization();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = __atxlog_handle_notification_categorization();
  BOOL v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ATXNotificationCategorizationServer.collectCoreAnalyticsJsonForNotification", " enableTelemetry=YES ", buf, 2u);
  }

  v13 = objc_opt_new();
  uint64_t v14 = [v6 bundleID];
  uint64_t v15 = [v6 notificationID];
  uint64_t v16 = [v6 recordDate];
  [v16 timeIntervalSinceReferenceDate];
  uint64_t v17 = objc_msgSend(v13, "telemetryDataForNotificationWithBundleId:notificationId:recordTimestamp:", v14, v15);

  if (!v17)
  {
    uint64_t v18 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationServer collectCoreAnalyticsJsonForNotification:completion:](v6, v18);
    }
  }
  int v19 = [(_PASLazyResult *)self->_featuresCorrelator result];
  v20 = [(_PASLazyResult *)self->_contactStore result];
  uint64_t v21 = [(_PASLazyResult *)self->_contactRelationships result];
  uint64_t v22 = [v19 collectDynamicBreakthroughFeaturesForNotification:v6 contactStore:v20 withContactRelationships:v21];

  uint64_t v23 = +[ATXNotificationBreakthroughEventMetric coreAnalyticsDictionaryFromQueryResult:v17 featureCollectionSet:v22];
  v24 = __atxlog_handle_notification_categorization();
  id v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v25, OS_SIGNPOST_INTERVAL_END, v10, "ATXNotificationCategorizationServer.collectCoreAnalyticsJsonForNotification", " enableTelemetry=YES ", buf, 2u);
  }

  id v31 = 0;
  id v26 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v23 options:1 error:&v31];
  id v27 = v31;
  objc_super v28 = (void *)[[NSString alloc] initWithData:v26 encoding:4];
  if (v27)
  {
    v29 = 0;
    id v30 = v27;
  }
  else
  {
    v29 = v28;
    id v30 = 0;
  }
  v7[2](v7, v29, v30);
}

- (void)rankUserNotificationWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v23 = a4;
  v5 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v25 userNotifications];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ATXNotificationCategorizationServer rankUserNotificationWithRequest:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: Received request to rank: %ld notifications", buf, 0x16u);
  }
  id v27 = objc_opt_new();
  int v7 = [v25 useLLM];
  v8 = &unk_1F27F3C48;
  [v27 setObject:&unk_1F27F3C48 forKeyedSubscript:@"critical"];
  if (v7)
  {
    v8 = &unk_1F27F3C58;
    id v9 = &unk_1F27F3C68;
  }
  else
  {
    id v9 = &unk_1F27F3C78;
  }
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, @"timeSensitive", v23);
  [v27 setObject:&unk_1F27F3C48 forKeyedSubscript:@"isMessage"];
  [v27 setObject:v8 forKeyedSubscript:@"personScore"];
  [v27 setObject:v8 forKeyedSubscript:@"tendencyToOpenAppAfterNotification"];
  [v27 setObject:v9 forKeyedSubscript:@"llmScore"];
  os_signpost_id_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("ATXNotificationCategorizationServer.rankUserNotificationWithRequest.concurrent", v10);

  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("ATXNotificationCategorizationServer.rankUserNotificationWithRequest.serial", v11);

  v13 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__52;
  v43 = __Block_byref_object_dispose__52;
  id v44 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = [v25 userNotifications];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke;
        block[3] = &unk_1E68B0E08;
        block[4] = v18;
        id v29 = v27;
        id v30 = v12;
        id v31 = buf;
        dispatch_group_async(v13, queue, block);
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v15);
  }

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  id v19 = objc_alloc(MEMORY[0x1E4F4B1F8]);
  v20 = (void *)[v19 initWithnotificationRankingSections:*(void *)(*(void *)&buf[8] + 40)];
  uint64_t v21 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [*(id *)(*(void *)&buf[8] + 40) count];
    *(_DWORD *)v36 = 136315394;
    v37 = "-[ATXNotificationCategorizationServer rankUserNotificationWithRequest:completion:]";
    __int16 v38 = 2048;
    uint64_t v39 = v22;
    _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "%s: Ranked notifications into %ld sections", v36, 0x16u);
  }

  ((void (**)(void, void *, void))v24)[2](v24, v20, 0);
  _Block_object_dispose(buf, 8);
}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke(uint64_t a1)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_cold_1(a1, v2);
  }

  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F4B1E8]);
  v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"critical"];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "urgency") == 0);
  int v7 = (void *)[v4 initWithWeight:v5 value:v6];
  [v3 setObject:v7 forKeyedSubscript:@"critical"];

  id v8 = objc_alloc(MEMORY[0x1E4F4B1E8]);
  id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"timeSensitive"];
  os_signpost_id_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "urgency") == 1);
  v11 = (void *)[v8 initWithWeight:v9 value:v10];
  [v3 setObject:v11 forKeyedSubscript:@"timeSensitive"];

  id v12 = objc_alloc(MEMORY[0x1E4F4B1E8]);
  v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isMessage"];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isMessage"));
  uint64_t v15 = (void *)[v12 initWithWeight:v13 value:v14];
  [v3 setObject:v15 forKeyedSubscript:@"isMessage"];

  id v16 = objc_alloc(MEMORY[0x1E4F4B1E8]);
  uint64_t v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"personScore"];
  uint64_t v18 = (void *)[v16 initWithWeight:v17 value:&unk_1F27F0ED0];
  [v3 setObject:v18 forKeyedSubscript:@"personScore"];

  id v19 = objc_alloc(MEMORY[0x1E4F4B1E8]);
  v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"tendencyToOpenAppAfterNotification"];
  uint64_t v21 = (void *)[v19 initWithWeight:v20 value:&unk_1F27F0ED0];
  [v3 setObject:v21 forKeyedSubscript:@"tendencyToOpenAppAfterNotification"];

  id v22 = objc_alloc(MEMORY[0x1E4F4B1E8]);
  id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"llmScore"];
  v24 = (void *)[v22 initWithWeight:v23 value:&unk_1F27F0ED0];
  [v3 setObject:v24 forKeyedSubscript:@"llmScore"];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__52;
  v43 = __Block_byref_object_dispose__52;
  id v44 = (id)objc_opt_new();
  id v25 = objc_alloc(MEMORY[0x1E4F4B1F0]);
  id v26 = (void *)[v25 initWithFeatures:v3 metadata:v40[5]];
  id v27 = objc_alloc(MEMORY[0x1E4F4B200]);
  v45[0] = *(void *)(a1 + 32);
  objc_super v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  id v29 = (void *)[v27 initWithUserNotifications:v28 featureSet:v26];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_79;
  v34[3] = &unk_1E68B19B0;
  id v31 = *(NSObject **)(a1 + 48);
  uint64_t v30 = *(void *)(a1 + 56);
  uint64_t v32 = *(void *)(a1 + 32);
  id v35 = v29;
  uint64_t v36 = v32;
  uint64_t v37 = v30;
  __int16 v38 = &v39;
  id v33 = v29;
  dispatch_sync(v31, v34);

  _Block_object_dispose(&v39, 8);
}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_79(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(a1 + 32)];
  v2 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_79_cold_1(a1, v2);
  }
}

- (void)fetchContextForNotificationWithRequest:(id)a3 completion:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  id v8 = objc_opt_new();
  id v9 = [v6 userNotification];
  if (v9)
  {
    os_signpost_id_t v10 = [(_PASLazyResult *)self->_notificationSenderImportanceModel result];
    v11 = [v10 calculateSenderImportanceForNotificationWithContextRequest:v6];

    [v11 senderImportanceScore];
    double v13 = v12;
    [v8 notificationSenderImportanceThreshold];
    if (v13 >= v14)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F4B1A8]);
      [v11 senderImportanceScore];
      double v30 = v29;
      id v22 = [v11 featureDictionary];
      id v31 = (void *)[v28 initWithNotificationSenderImportance:2 importanceConfidenceScore:v22 notificationFeatureDictionary:v30];
    }
    else
    {
      [v11 senderImportanceScore];
      double v16 = v15;
      [v8 notificationSenderImportanceThreshold];
      double v18 = v17;
      id v19 = objc_alloc(MEMORY[0x1E4F4B1A8]);
      [v11 senderImportanceScore];
      double v21 = v20;
      id v22 = [v11 featureDictionary];
      id v31 = (void *)[v19 initWithNotificationSenderImportance:v16 < v18 importanceConfidenceScore:v22 notificationFeatureDictionary:v21];
    }
    v7[2](v7, v31, 0);
  }
  else
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F4ADC8];
    uint64_t v25 = *MEMORY[0x1E4F4ADD0];
    uint64_t v32 = *MEMORY[0x1E4F28228];
    v33[0] = @"ATXNotificationCategorizationServer: Invalid Request Object: Nil ATXUserNotification object.";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v27 = [v23 errorWithDomain:v24 code:v25 userInfo:v26];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v27);
  }
}

- (void)fetchContextForMailWithRequest:(id)a3 completion:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  id v8 = objc_opt_new();
  id v9 = [v6 mailMessage];
  if (v9)
  {
    os_signpost_id_t v10 = [(_PASLazyResult *)self->_mailSenderImportanceModel result];
    v11 = [(_PASLazyResult *)self->_contactStore result];
    double v12 = [(_PASLazyResult *)self->_contactRelationships result];
    double v13 = [v10 calculateSenderImportanceForMailWithContextRequest:v6 contactStore:v11 contactRelationships:v12];

    [v13 senderImportanceScore];
    double v15 = v14;
    [v8 mailSenderImportanceThreshold];
    if (v15 >= v16)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F4B140]);
      [v13 senderImportanceScore];
      double v32 = v31;
      uint64_t v24 = [v13 featureDictionary];
      id v33 = (void *)[v30 initWithMailSenderImportance:2 importanceConfidenceScore:v24 mailFeatureDictionary:v32];
    }
    else
    {
      [v13 senderImportanceScore];
      double v18 = v17;
      [v8 mailSenderImportanceThreshold];
      double v20 = v19;
      id v21 = objc_alloc(MEMORY[0x1E4F4B140]);
      [v13 senderImportanceScore];
      double v23 = v22;
      uint64_t v24 = [v13 featureDictionary];
      id v33 = (void *)[v21 initWithMailSenderImportance:v18 < v20 importanceConfidenceScore:v24 mailFeatureDictionary:v23];
    }
    v7[2](v7, v33, 0);
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F4ADA8];
    uint64_t v27 = *MEMORY[0x1E4F4ADB0];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    v35[0] = @"ATXNotificationCategorizationServer: Invalid Request Object: Nil ATXMailMessage object.";
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    double v29 = [v25 errorWithDomain:v26 code:v27 userInfo:v28];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v29);
  }
}

- (void)fetchContextForMessageWithRequest:(id)a3 completion:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  id v8 = objc_opt_new();
  id v9 = [v6 textMessage];
  if (v9)
  {
    os_signpost_id_t v10 = [(_PASLazyResult *)self->_messageSenderImportanceModel result];
    v11 = [(_PASLazyResult *)self->_contactStore result];
    double v12 = [(_PASLazyResult *)self->_contactRelationships result];
    double v13 = [v10 calculateSenderImportanceForMessageWithContextRequest:v6 contactStore:v11 contactRelationships:v12];

    [v13 senderImportanceScore];
    double v15 = v14;
    [v8 messageSenderImportanceThreshold];
    if (v15 >= v16)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F4B148]);
      [v13 senderImportanceScore];
      double v32 = v31;
      uint64_t v24 = [v13 featureDictionary];
      id v33 = (void *)[v30 initWithMessageSenderImportance:2 importanceConfidenceScore:v24 messageFeatureDictionary:v32];
    }
    else
    {
      [v13 senderImportanceScore];
      double v18 = v17;
      [v8 messageSenderImportanceThreshold];
      double v20 = v19;
      id v21 = objc_alloc(MEMORY[0x1E4F4B148]);
      [v13 senderImportanceScore];
      double v23 = v22;
      uint64_t v24 = [v13 featureDictionary];
      id v33 = (void *)[v21 initWithMessageSenderImportance:v18 < v20 importanceConfidenceScore:v24 messageFeatureDictionary:v23];
    }
    v7[2](v7, v33, 0);
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F4ADB8];
    uint64_t v27 = *MEMORY[0x1E4F4ADC0];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    v35[0] = @"ATXNotificationCategorizationServer: Invalid Request Object: Nil ATXTextMessage object.";
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    double v29 = [v25 errorWithDomain:v26 code:v27 userInfo:v28];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v29);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactRelationships, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_messageSenderImportanceModel, 0);
  objc_storeStrong((id *)&self->_mailSenderImportanceModel, 0);
  objc_storeStrong((id *)&self->_notificationSenderImportanceModel, 0);
  objc_storeStrong((id *)&self->_featuresCorrelator, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Unexpected Interruption: %@", v2, v3, v4, v5, 2u);
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Connection invalidated: %@", v2, v3, v4, v5, 2u);
}

- (void)collectCoreAnalyticsJsonForNotification:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 bundleID];
  uint64_t v5 = [a1 notificationID];
  id v6 = [a1 recordDate];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;
  id v9 = [a1 body];
  int v10 = 136316163;
  v11 = "-[ATXNotificationCategorizationServer collectCoreAnalyticsJsonForNotification:completion:]";
  __int16 v12 = 2112;
  double v13 = v4;
  __int16 v14 = 2112;
  double v15 = v5;
  __int16 v16 = 2048;
  uint64_t v17 = v8;
  __int16 v18 = 2117;
  double v19 = v9;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Got nil queryResult. Failed to find notification in database with bundleId: %@ notificationId: %@ recordTimestamp: %f body: %{sensitive}@", (uint8_t *)&v10, 0x34u);
}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Ranking notification %@", (uint8_t *)v4, 0x16u);
}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_79_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  int v6 = 136315650;
  uint64_t v7 = "-[ATXNotificationCategorizationServer rankUserNotificationWithRequest:completion:]_block_invoke";
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Done ranking notification %@, llmMetadata: %@", (uint8_t *)&v6, 0x20u);
}

@end
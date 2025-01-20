@interface ATXDigestSetupFlowClient
- (ATXDigestSetupFlowClient)init;
- (id)sortDigestResponseWithNoNotificationVolume:(id)a3;
- (void)_helperAppsSortedByNotificationsReceivedInPreviousNumDays:(id)a3 completionHandler:(id)a4;
- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(id)a3 completionHandler:(id)a4;
@end

@implementation ATXDigestSetupFlowClient

- (ATXDigestSetupFlowClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestSetupFlowClient;
  v2 = [(ATXDigestSetupFlowClient *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ATXDigestSetupFlowClient.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    xpcClient = v2->_xpcClient;
    v2->_xpcClient = (ATXNotificationDigestRankerClient *)v6;
  }
  return v2;
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__ATXDigestSetupFlowClient_appsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke;
  v8[3] = &unk_1E5D09660;
  id v9 = v6;
  id v7 = v6;
  [(ATXDigestSetupFlowClient *)self _helperAppsSortedByNotificationsReceivedInPreviousNumDays:a3 completionHandler:v8];
}

uint64_t __97__ATXDigestSetupFlowClient_appsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_helperAppsSortedByNotificationsReceivedInPreviousNumDays:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = &unk_1EFDF46B0;
  }
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v23 = [v9 unsignedIntegerValue];
  v10 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (id)objc_opt_class();
    v12 = NSStringFromSelector(a2);
    [(ATXDigestSetupFlowClient *)v11 _helperAppsSortedByNotificationsReceivedInPreviousNumDays:buf completionHandler:v10];
  }

  xpcClient = self->_xpcClient;
  uint64_t v14 = v21[3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke;
  v16[3] = &unk_1E5D096B0;
  v18 = &v20;
  SEL v19 = a2;
  v16[4] = self;
  id v15 = v8;
  id v17 = v15;
  [(ATXNotificationDigestRankerClient *)xpcClient appsSortedByNotificationsReceivedInPreviousNumDays:v14 reply:v16];

  _Block_object_dispose(&v20, 8);
}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, unint64_t a4, void *a5)
{
  *(void *)&v25[13] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  if (v10)
  {
    id v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_2(a1, (uint64_t)v10, v11);
    }
  }
  v12 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = (uint64_t)v13;
    __int16 v24 = 2048;
    *(void *)uint64_t v25 = a4;
    _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "%@: Number of days of data = %lu", buf, 0x16u);
  }
  if (a4)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(void *)(v14 + 24) > a4) {
      *(void *)(v14 + 24) = a4;
    }
  }
  else
  {
    id v15 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_1(a1, v15);
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3;
  v21[3] = &unk_1E5D09688;
  v21[4] = *(void *)(a1 + 48);
  v16 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v21);
  id v17 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v16 count];
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 134218496;
    uint64_t v23 = v18;
    __int16 v24 = 1024;
    *(_DWORD *)uint64_t v25 = a3;
    v25[2] = 2048;
    *(void *)&v25[3] = v19;
    _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "Returning %ld apps with notification counts, containsMessageAndTimeSensitiveData=%{BOOL}d, numberOfDays=%ld", buf, 0x1Cu);
  }

  uint64_t v20 = [*(id *)(a1 + 32) sortDigestResponseWithNoNotificationVolume:v16];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

ATXDigestSetupResponse *__104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 numBasicNotifications];
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t v6 = [v3 numMessageNotifications];
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t v8 = [v3 numTimeSensitiveNonMessageNotifications];
  unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v10 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3_cold_1(v3, v10);
  }
  unint64_t v11 = v4 / v5;

  v12 = [ATXDigestSetupResponse alloc];
  v13 = [v3 bundleId];
  uint64_t v14 = -[ATXDigestSetupResponse initWithBundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:numBasicNotifications:numMessageNotifications:numTimeSensitiveNonMessageNotifications:](v12, "initWithBundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:numBasicNotifications:numMessageNotifications:numTimeSensitiveNonMessageNotifications:", v13, v11, v6 / v7, v8 / v9, [v3 numBasicNotifications], objc_msgSend(v3, "numMessageNotifications"), objc_msgSend(v3, "numTimeSensitiveNonMessageNotifications"));

  return v14;
}

- (id)sortDigestResponseWithNoNotificationVolume:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v28 = objc_opt_new();
  unint64_t v4 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    unint64_t v9 = 0x1E5D03000uLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        if ([v11 numBasicNotifications]
          || [v11 numMessageNotifications]
          || [v11 numTimeSensitiveNonMessageNotifications])
        {
          [v4 addObject:v11];
        }
        else
        {
          v12 = *(void **)(v9 + 2632);
          v13 = [v11 bundleId];
          uint64_t v14 = [v12 localizedNameForBundle:v13];
          id v15 = v14;
          if (v14)
          {
            id v16 = v14;
          }
          else
          {
            id v17 = *(void **)(v9 + 2632);
            uint64_t v18 = [v11 bundleId];
            id v16 = [v17 localizedShortnameForBundle:v18];
          }
          uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v16 second:v11];
          [v28 addObject:v19];

          unint64_t v9 = 0x1E5D03000;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v20 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      uint64_t v7 = v20;
    }
    while (v20);
  }

  [v28 sortUsingComparator:&__block_literal_global_73];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v28;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v29 + 1) + 8 * i) second];
        [v4 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  return v4;
}

uint64_t __71__ATXDigestSetupFlowClient_sortDigestResponseWithNoNotificationVolume___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 first];
  uint64_t v6 = [v4 first];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_helperAppsSortedByNotificationsReceivedInPreviousNumDays:(uint8_t *)buf completionHandler:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "[%@ %@] Fetching sorted apps", buf, 0x16u);
}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "%@: Received number of days of data = 0", (uint8_t *)&v4, 0xCu);
}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "Error in %@: %@", (uint8_t *)&v6, 0x16u);
}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 bundleId];
  int v5 = 138413058;
  int v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 numBasicNotifications];
  __int16 v9 = 2048;
  uint64_t v10 = [a1 numMessageNotifications];
  __int16 v11 = 2048;
  uint64_t v12 = [a1 numTimeSensitiveNonMessageNotifications];
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "%@: %lu / %lu / %lu", (uint8_t *)&v5, 0x2Au);
}

@end
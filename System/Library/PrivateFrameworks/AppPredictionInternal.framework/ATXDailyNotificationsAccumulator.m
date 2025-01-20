@interface ATXDailyNotificationsAccumulator
- (BOOL)successfullyAccumulatedNotificationEvents;
- (NSArray)allDeliveredNotifications;
- (void)successfullyAccumulatedNotificationEvents;
@end

@implementation ATXDailyNotificationsAccumulator

- (BOOL)successfullyAccumulatedNotificationEvents
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v5 = +[_ATXAppIconState sharedInstance];
  v6 = [v5 allInstalledAppsKnownToSpringBoard];
  v7 = (void *)[v4 initWithArray:v6];

  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v9 = BiomeLibrary();
  v10 = [v9 Notification];
  v11 = [v10 Usage];

  v12 = objc_msgSend(v11, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v8, 0, 0, 0, 0);
  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__48;
  v24[3] = __Block_byref_object_dispose__48;
  id v25 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke;
  v22[3] = &unk_1E68AC060;
  v22[4] = &v23;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke_2;
  v19[3] = &unk_1E68AD360;
  id v13 = v7;
  id v20 = v13;
  id v14 = v3;
  id v21 = v14;
  id v15 = (id)[v12 sinkWithCompletion:v22 receiveInput:v19];
  uint64_t v16 = *(void *)(v24[0] + 40);
  if (v16)
  {
    v17 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(ATXDailyNotificationsAccumulator *)(uint64_t)v24 successfullyAccumulatedNotificationEvents];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_allDeliveredNotifications, v3);
    v17 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[ATXDailyNotificationsAccumulator successfullyAccumulatedNotificationEvents]";
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_INFO, "%s: Successfully accumulated notification events", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  return v16 == 0;
}

uint64_t __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v37 = v3;
  uint64_t v5 = [v3 eventBody];
  v6 = [v5 bundleID];
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4)
  {
    v7 = [v37 eventBody];
    int v8 = [v7 usageType];

    if (v8 == 17)
    {
      v9 = [v37 eventBody];
      v10 = [v9 bundleID];
      v11 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v10];
      uint64_t v12 = [v11 unsignedIntegerValue];

      id v13 = *(void **)(a1 + 40);
      id v14 = objc_alloc(MEMORY[0x1E4F4B3A8]);
      id v15 = [v37 eventBody];
      uint64_t v16 = [v15 bundleID];
      v17 = [v37 eventBody];
      v18 = [v17 absoluteTimestamp];
      v19 = [v37 eventBody];
      id v20 = [v19 contactIDs];
      id v21 = [v37 eventBody];
      uint64_t v22 = [v21 isGroupMessage];
      uint64_t v23 = v14;
      v24 = v16;
      uint64_t v25 = v12;
      v26 = v18;
      v27 = v20;
      uint64_t v28 = 1;
    }
    else
    {
      v29 = [v37 eventBody];
      int v30 = [v29 usageType];

      if (v30 != 18) {
        goto LABEL_7;
      }
      v31 = [v37 eventBody];
      v32 = [v31 bundleID];
      v33 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v32];
      uint64_t v34 = [v33 unsignedIntegerValue];

      id v13 = *(void **)(a1 + 40);
      id v35 = objc_alloc(MEMORY[0x1E4F4B3A8]);
      id v15 = [v37 eventBody];
      uint64_t v16 = [v15 bundleID];
      v17 = [v37 eventBody];
      v18 = [v17 absoluteTimestamp];
      v19 = [v37 eventBody];
      id v20 = [v19 contactIDs];
      id v21 = [v37 eventBody];
      uint64_t v22 = [v21 isGroupMessage];
      uint64_t v23 = v35;
      v24 = v16;
      uint64_t v25 = v34;
      v26 = v18;
      v27 = v20;
      uint64_t v28 = 2;
    }
    v36 = (void *)[v23 initWithBundleID:v24 category:v25 eventTime:v26 contactIDs:v27 isGroupMessage:v22 deliveryType:v28];
    [v13 addObject:v36];
  }
LABEL_7:
}

- (NSArray)allDeliveredNotifications
{
  return self->_allDeliveredNotifications;
}

- (void).cxx_destruct
{
}

- (void)successfullyAccumulatedNotificationEvents
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  uint64_t v4 = "-[ATXDailyNotificationsAccumulator successfullyAccumulatedNotificationEvents]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading notifications stream: %@", (uint8_t *)&v3, 0x16u);
}

@end
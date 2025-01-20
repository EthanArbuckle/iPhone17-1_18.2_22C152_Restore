@interface ATXNotificationTelemetryLogger
- (ATXNotificationTelemetryLogger)initWithContactStore:(id)a3;
- (ATXNotificationTelemetryLogger)initWithDatastore:(id)a3 featuresCorrelator:(id)a4 modeConfigClient:(id)a5 contactStore:(id)a6;
- (id)summaryMetricsForActivityType:(unint64_t)a3;
- (id)userNotificationWithUUID:(id)a3 withTimeStamp:(double)a4 urgency:(int64_t)a5 fromNotificationStreamWithStartTime:(id)a6 endTime:(id)a7;
- (void)logNotificationMetricsFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withXPCActivity:(id)a5;
- (void)logNotificationMetricsWithBreakthroughFeaturesFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withTelemetryQueryResult:(id)a5 withXPCActivity:(id)a6;
- (void)logNotificationMetricsWithXPCActivity:(id)a3;
@end

@implementation ATXNotificationTelemetryLogger

- (ATXNotificationTelemetryLogger)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [MEMORY[0x1E4F4AF78] sharedInstance];
  v8 = [(ATXNotificationTelemetryLogger *)self initWithDatastore:v5 featuresCorrelator:v6 modeConfigClient:v7 contactStore:v4];

  return v8;
}

- (ATXNotificationTelemetryLogger)initWithDatastore:(id)a3 featuresCorrelator:(id)a4 modeConfigClient:(id)a5 contactStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ATXNotificationTelemetryLogger;
  v15 = [(ATXNotificationTelemetryLogger *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_datastore, a3);
    objc_storeStrong((id *)&v16->_featuresCorrelator, a4);
    objc_storeStrong((id *)&v16->_modeConfigClient, a5);
    uint64_t v17 = objc_opt_new();
    summaryMetrics = v16->_summaryMetrics;
    v16->_summaryMetrics = (NSMutableDictionary *)v17;

    objc_storeStrong((id *)&v16->_contactStore, a6);
    v19 = [[ATXContactRelationshipsCollector alloc] initWithContactStore:v14];
    contactRelationships = v16->_contactRelationships;
    v16->_contactRelationships = v19;
  }
  return v16;
}

- (void)logNotificationMetricsFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withXPCActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = __atxlog_handle_metrics();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  [(ATXNotificationAndSuggestionDatastore *)self->_datastore updateDatabase];
  datastore = self->_datastore;
  [v8 timeIntervalSinceReferenceDate];
  double v15 = v14;
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v17 = [(ATXNotificationAndSuggestionDatastore *)datastore telemetryDataForNotificationsFromTimestamp:v15 endTimestamp:v16];
  v18 = objc_alloc_init(ATXBundleIdRedactor);
  v19 = objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_228);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __106__ATXNotificationTelemetryLogger_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withXPCActivity___block_invoke_2;
  v24[3] = &unk_1E68B5C00;
  id v25 = v17;
  v26 = self;
  id v27 = v10;
  id v28 = v8;
  id v29 = v9;
  os_signpost_id_t v30 = v12;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  id v23 = v17;
  [(ATXBundleIdRedactor *)v18 redactWithBundleIds:v19 completionHandler:v24];
}

uint64_t __106__ATXNotificationTelemetryLogger_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

void __106__ATXNotificationTelemetryLogger_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v4 = 0;
    do
    {
      if (v4 >= [v3 count])
      {
        v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
        [v5 setBundleId:@"redacted-failed-count-mismatch"];
      }
      else
      {
        v5 = [v3 objectAtIndexedSubscript:v4];
        v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
        [v6 setBundleId:v5];
      }
      ++v4;
    }
    while (v4 < [*(id *)(a1 + 32) count]);
  }
  id v37 = v3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v7 = *(id *)(a1 + 32);
  uint64_t v39 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(v7);
        }
        id v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1D25F6CC0]();
        id v11 = [[ATXNotificationEventMetric alloc] initWithQueryResult:v9];
        [(_ATXCoreAnalyticsMetric *)v11 logToCoreAnalytics];
        os_signpost_id_t v12 = [v9 receiveModeIdentifier];
        if (v12)
        {
          id v13 = *(void **)(*(void *)(a1 + 40) + 24);
          double v14 = v7;
          id v15 = objc_alloc(MEMORY[0x1E4F29128]);
          double v16 = [v9 receiveModeIdentifier];
          uint64_t v17 = (void *)[v15 initWithUUIDString:v16];
          [v13 atxModeForDNDMode:v17];
          uint64_t v18 = ATXActivityTypeFromMode();

          v7 = v14;
        }
        else
        {
          uint64_t v18 = ATXActivityTypeFromMode();
        }

        v19 = [*(id *)(a1 + 40) summaryMetricsForActivityType:v18];
        [v19 handleTelemetryResult:v9];

        if ([*(id *)(a1 + 48) didDefer])
        {
          v31 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = (objc_class *)objc_opt_class();
            v33 = NSStringFromClass(v32);
            *(_DWORD *)buf = 138412290;
            v50 = v33;
            _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", buf, 0xCu);
          }
LABEL_39:
          id v25 = v37;
          goto LABEL_40;
        }
      }
      uint64_t v39 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v7 = [*(id *)(*(void *)(a1 + 40) + 32) allValues];
  uint64_t v20 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v41;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v7);
        }
        v24 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        id v10 = (void *)MEMORY[0x1D25F6CC0]();
        [v24 logToCoreAnalytics];
        if ([*(id *)(a1 + 48) didDefer])
        {
          v34 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            *(_DWORD *)buf = 138412290;
            v50 = v36;
            _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", buf, 0xCu);
          }
          goto LABEL_39;
        }
      }
      uint64_t v21 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  id v25 = v37;
  if ([MEMORY[0x1E4F4B628] isBreakthroughDataCollectionEnabled])
  {
    v26 = __atxlog_handle_metrics();
    id v27 = v26;
    os_signpost_id_t v28 = *(void *)(a1 + 72);
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v28, "FocusMetricsLogging.NotificationBreakthroughMetrics", " enableTelemetry=YES ", buf, 2u);
    }

    [*(id *)(a1 + 40) logNotificationMetricsWithBreakthroughFeaturesFromStartTimestamp:*(void *)(a1 + 56) toEndTimestamp:*(void *)(a1 + 64) withTelemetryQueryResult:*(void *)(a1 + 32) withXPCActivity:*(void *)(a1 + 48)];
    id v29 = __atxlog_handle_metrics();
    v7 = v29;
    os_signpost_id_t v30 = *(void *)(a1 + 72);
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v7, OS_SIGNPOST_INTERVAL_END, v30, "FocusMetricsLogging.NotificationBreakthroughMetrics", " enableTelemetry=YES ", buf, 2u);
    }
LABEL_40:
  }
}

- (id)summaryMetricsForActivityType:(unint64_t)a3
{
  unint64_t v4 = [ATXModeDimensionSet alloc];
  v5 = ATXActivityTypeToString();
  v6 = [(ATXModeDimensionSet *)v4 initWithMode:v5];

  v7 = [(NSMutableDictionary *)self->_summaryMetrics objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = [[ATXNotificationHandleSummaryMetrics alloc] initWithDimensions:v6];
    [(NSMutableDictionary *)self->_summaryMetrics setObject:v8 forKeyedSubscript:v6];
  }
  id v9 = [(NSMutableDictionary *)self->_summaryMetrics objectForKeyedSubscript:v6];

  return v9;
}

- (void)logNotificationMetricsWithBreakthroughFeaturesFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withTelemetryQueryResult:(id)a5 withXPCActivity:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v31 = a4;
  id v10 = a5;
  id v30 = a6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v34;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v13 + 1;
      uint64_t v28 = v13 + v12;
      do
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
        uint64_t v18 = (void *)MEMORY[0x1D25F6CC0]();
        v19 = [v17 notificationUUID];
        uint64_t v20 = [v17 receiveTimestamp];
        [v20 timeIntervalSinceReferenceDate];
        uint64_t v22 = -[ATXNotificationTelemetryLogger userNotificationWithUUID:withTimeStamp:urgency:fromNotificationStreamWithStartTime:endTime:](self, "userNotificationWithUUID:withTimeStamp:urgency:fromNotificationStreamWithStartTime:endTime:", v19, [v17 urgency], v32, v31, v21);

        id v23 = [(ATXDynamicBreakthroughFeaturesCorrelator *)self->_featuresCorrelator collectDynamicBreakthroughFeaturesForNotification:v22 contactStore:self->_contactStore withContactRelationships:self->_contactRelationships];
        v24 = [[ATXNotificationBreakthroughEventMetric alloc] initWithQueryResult:v17 featureCollectionSet:v23];
        [(_ATXCoreAnalyticsMetric *)v24 logToCoreAnalytics];
        if ((unint64_t)(v16 + v15) > 0x63) {
          goto LABEL_14;
        }
        if ([v30 didDefer])
        {
          id v25 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = (objc_class *)objc_opt_class();
            id v27 = NSStringFromClass(v26);
            *(_DWORD *)buf = 138412290;
            uint64_t v38 = v27;
            _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", buf, 0xCu);
          }
LABEL_14:

          goto LABEL_15;
        }

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      uint64_t v13 = v28;
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)logNotificationMetricsWithXPCActivity:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v22 = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "[%@] - Logging notification metrics", (uint8_t *)&v22, 0xCu);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v9 = (void *)[v8 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v9 doubleForKey:@"notificationTelemetryLoggingTimestampKey"];
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  uint64_t v12 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v10 timeIntervalSinceReferenceDate];
    uint64_t v16 = v15;
    [v11 timeIntervalSinceReferenceDate];
    int v22 = 138412802;
    id v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = v16;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "[%@] - Start timestamp found: %f, End Timestamp: %f", (uint8_t *)&v22, 0x20u);
  }
  if ([v10 compare:v11] == -1)
  {
    [(ATXNotificationTelemetryLogger *)self logNotificationMetricsFromStartTimestamp:v10 toEndTimestamp:v11 withXPCActivity:v4];
    uint64_t v18 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      [v11 timeIntervalSinceReferenceDate];
      int v22 = 138412546;
      id v23 = v20;
      __int16 v24 = 2048;
      uint64_t v25 = v21;
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_INFO, "[%@] - Finished logging.  Setting stored timestamp to timestamp: %f", (uint8_t *)&v22, 0x16u);
    }
    [v11 timeIntervalSinceReferenceDate];
    objc_msgSend(v9, "setDouble:forKey:", @"notificationTelemetryLoggingTimestampKey");
  }
}

- (id)userNotificationWithUUID:(id)a3 withTimeStamp:(double)a4 urgency:(int64_t)a5 fromNotificationStreamWithStartTime:(id)a6 endTime:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [v11 UUIDString];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__102;
  long long v34 = __Block_byref_object_dispose__102;
  id v35 = 0;
  uint64_t v15 = BiomeLibrary();
  uint64_t v16 = [v15 Notification];
  uint64_t v17 = [v16 Usage];
  uint64_t v18 = objc_msgSend(v17, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v12, v13, 0, 0, 0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_34;
  v24[3] = &unk_1E68B5C28;
  id v19 = v14;
  id v25 = v19;
  uint64_t v27 = &v30;
  id v20 = v11;
  id v26 = v20;
  double v28 = a4;
  int64_t v29 = a5;
  id v21 = (id)[v18 sinkWithCompletion:&__block_literal_global_33_0 shouldContinue:v24];

  id v22 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_cold_1(v2, v4);
    }
  }
}

uint64_t __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_34(double *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  v5 = [v4 notificationID];
  int v6 = [v5 isEqualToString:*((void *)a1 + 4)];

  if (v6)
  {
    v7 = [v3 eventBody];
    id v23 = objc_alloc(MEMORY[0x1E4F4B3F8]);
    uint64_t v24 = *((void *)a1 + 5);
    double v8 = a1[7];
    id v9 = [v7 title];
    id v22 = [v7 subtitle];
    id v21 = [v7 body];
    uint64_t v20 = [v7 badge];
    id v19 = [v7 bundleID];
    uint64_t v18 = [v7 threadID];
    id v10 = [v7 categoryID];
    id v11 = [v7 sectionID];
    id v12 = [v7 contactIDs];
    LOBYTE(v17) = [v7 isGroupMessage];
    uint64_t v13 = [v23 initFromNotificationData:v24 timestamp:v9 title:v22 subtitle:v21 body:v20 badge:0 userInfo:v8 bundleID:v19 threadID:v18 categoryID:v10 sectionID:v11 contactIDs:v12 rawIdentifiers:0 isGroupMessage:v17 derivedData:0 urgency:*((void *)a1 + 8)];
    uint64_t v14 = *(void *)(*((void *)a1 + 6) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  return v6 ^ 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactRelationships, 0);
  objc_storeStrong((id *)&self->_summaryMetrics, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_featuresCorrelator, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

void __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXNotificationTelemetryLogger: Error reading Notification.Usage stream: %@", (uint8_t *)&v4, 0xCu);
}

@end
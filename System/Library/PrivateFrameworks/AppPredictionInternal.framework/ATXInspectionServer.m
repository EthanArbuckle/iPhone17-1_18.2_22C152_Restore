@interface ATXInspectionServer
@end

@implementation ATXInspectionServer

void __38___ATXInspectionServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_43;
  sharedInstance__pasExprOnceResult_43 = v1;
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_19()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_19_cold_1();
  }
}

uint64_t __55___ATXInspectionServer_appHistoryActionWithUUID_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = [v4 description];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if ((ATXDetailedActionLoggingEnabled() & 1) == 0)
  {
    v10 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mutableCopy];
    v11 = [v4 actionTitle];
    [v10 appendFormat:@"actionTitle: %@\n", v11];

    v12 = [v4 actionSubtitle];
    [v10 appendFormat:@"actionSubtitle: %@\n", v12];

    v13 = [v4 actionDescription];
    [v10 appendFormat:@"actionDescription: %@\n", v13];

    uint64_t v14 = [v10 copy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  return 0;
}

void __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully donated INIntent!", v6, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48___ATXInspectionServer_createAppPredictionLogs___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_128(uint64_t a1)
{
  v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Successfully generated app prediction logs", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_129(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Requesting app prediction logs timed out";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:666 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
}

uint64_t __38___ATXInspectionServer_getActionLogs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8, double a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14)
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v20 = a3;
  id v64 = a4;
  id v63 = a7;
  id v62 = a8;
  id v61 = a11;
  id v58 = a12;
  v69[0] = @"action";
  v60 = v19;
  v57 = [v19 json];
  v70[0] = v57;
  v69[1] = @"slotSets";
  id v21 = v20;
  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v72[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];

  v24 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v66 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v65 + 1) + 8 * i) parameters];
        v31 = [v30 sortedArrayUsingDescriptors:v23];
        if (v31)
        {
          [v24 addObject:v31];
        }
        else
        {
          v32 = [MEMORY[0x1E4F1CA98] null];
          [v24 addObject:v32];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [v24 copy];
  v56 = (void *)v33;
  v70[1] = v33;
  v69[2] = @"date";
  v34 = NSNumber;
  [v64 timeIntervalSinceReferenceDate];
  v51 = objc_msgSend(v34, "numberWithDouble:");
  v70[2] = v51;
  v69[3] = @"timeOfDay";
  v53 = [NSNumber numberWithInteger:a5];
  v70[3] = v53;
  v69[4] = @"dayOfWeek";
  v55 = [NSNumber numberWithInteger:a6];
  v70[4] = v55;
  v69[5] = @"prevLocationUUID";
  if (v63)
  {
    v35 = [v63 UUIDString];
  }
  else
  {
    v35 = @"No previous location";
  }
  v50 = v35;
  v70[5] = v35;
  v69[6] = @"locationUUID";
  if (v62)
  {
    v36 = [v62 UUIDString];
  }
  else
  {
    v36 = @"No location";
  }
  v70[6] = v36;
  v69[7] = @"motionType";
  v37 = objc_msgSend(MEMORY[0x1E4F93608], "getMotionStringFromMotionType:", a10, v36);
  v70[7] = v37;
  v69[8] = @"appSessionStartDate";
  if (v61)
  {
    v38 = NSNumber;
    [v61 timeIntervalSinceReferenceDate];
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = @"No app session start date";
  }
  v70[8] = v39;
  v69[9] = @"appSessionEndDate";
  if (v58)
  {
    v40 = NSNumber;
    [v58 timeIntervalSinceReferenceDate];
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = @"No app session end date";
  }
  v70[9] = v41;
  v69[10] = @"weight";
  v42 = [NSNumber numberWithDouble:a9];
  v70[10] = v42;
  v69[11] = @"geohash";
  v43 = [NSNumber numberWithLongLong:a13];
  v70[11] = v43;
  v69[12] = @"coarseGeohash";
  v44 = [NSNumber numberWithLongLong:a14];
  v70[12] = v44;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:13];
  v46 = (void *)[v45 mutableCopy];

  if (v58) {
  if (v61)
  }

  if (v62) {
  if (v63)
  }

  if ([v60 actionType] == 1)
  {
    v47 = [v60 userActivityString];
    [v46 setObject:v47 forKeyedSubscript:@"userActivityString"];
  }
  [*(id *)(a1 + 32) addObject:v46];

  return 1;
}

uint64_t __38___ATXInspectionServer_getActionLogs___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a2;
  id v19 = [a3 parameters];
  id v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v43[0] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  v22 = [v19 sortedArrayUsingDescriptors:v21];

  v41[0] = @"action";
  uint64_t v23 = [v18 json];

  uint64_t v37 = v23;
  v42[0] = v23;
  v41[1] = @"slotSet";
  v24 = v22;
  if (!v22)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v23);
  }
  v42[1] = v24;
  v41[2] = @"confirms";
  id v25 = objc_msgSend(NSNumber, "numberWithDouble:", a9, v37);
  v42[2] = v25;
  v41[3] = @"rejects";
  uint64_t v26 = [NSNumber numberWithDouble:a10];
  v42[3] = v26;
  v41[4] = @"geohash";
  uint64_t v27 = [NSNumber numberWithLongLong:a7];
  v42[4] = v27;
  v41[5] = @"coarseGeohash";
  uint64_t v28 = [NSNumber numberWithLongLong:a8];
  v42[5] = v28;
  v41[6] = @"feedbackType";
  v29 = [MEMORY[0x1E4F4AE58] actionFeedbackTypeToString:a6];
  v42[6] = v29;
  v41[7] = @"date";
  v30 = NSNumber;
  [v17 timeIntervalSince1970];
  double v32 = v31;

  uint64_t v33 = [v30 numberWithDouble:v32];
  v42[7] = v33;
  v41[8] = @"consumerSubType";
  v34 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a5];
  v42[8] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:9];

  if (!v22) {
  [*(id *)(a1 + 32) addObject:v35];
  }

  return 1;
}

void __43___ATXInspectionServer_histogramsInMemory___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[_ATXDataStore stringForHistogramType:a2];
  [v2 addObject:v3];
}

void __43___ATXInspectionServer_histogramsInMemory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[_ATXDataStore stringForHistogramType:a2];
  [v2 addObject:v3];
}

void __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) histogramDataForHistogramType:a2];
  if (v4)
  {
    uint64_t v5 = +[_ATXDataStore stringForHistogramType:a2];
    uint64_t v6 = *(void **)(a1 + 40);
    v9 = v5;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v6 addObject:v8];
  }
}

void __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) categoricalHistogramDataForHistogramType:a2];
  if (v4)
  {
    uint64_t v5 = +[_ATXDataStore stringForHistogramType:a2];
    uint64_t v6 = *(void **)(a1 + 40);
    v9 = v5;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v6 addObject:v8];
  }
}

uint64_t __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 allValues];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v4 allValues];

  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

id __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v3 allValues];

  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = (void *)[v4 initWithFormat:@"%@:%@", v6, v8];

  return v9;
}

uint64_t __44___ATXInspectionServer_allHistogramsBySize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 allValues];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v4 allValues];

  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

id __44___ATXInspectionServer_allHistogramsBySize___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v3 allValues];

  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = (void *)[v4 initWithFormat:@"%@:%@", v6, v8];

  return v9;
}

uint64_t __48___ATXInspectionServer_updateAppDirectoryCache___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59___ATXInspectionServer_generateDataForStressTestWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59___ATXInspectionServer_clearAllDataForStressTestWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Unexpected interruption on App Prediction inspection interface", v2, v3, v4, v5, v6);
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Connection invalidated on App Prediction inspection interface. Client went away.", v2, v3, v4, v5, v6);
}

void __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ERROR: %@", (uint8_t *)&v2, 0xCu);
}

void __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "logs flushed", v2, v3, v4, v5, v6);
}

@end
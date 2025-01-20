@interface DEDFeedbackAnalytics
+ (void)logDataLoadWithContentItemCount:(unint64_t)a3 formItemsCount:(unint64_t)a4 teamCount:(unint64_t)a5 errorsCount:(unint64_t)a6 startedAt:(double)a7 endedAt:(double)a8;
+ (void)logEventWithRequest:(id)a3 httpStatusCode:(int64_t)a4 nsurlErrorCode:(int64_t)a5 success:(BOOL)a6 startedAt:(double)a7 endedAt:(double)a8;
+ (void)logFBKBugSessionStartWithDeviceType:(id)a3 isRemote:(BOOL)a4 success:(BOOL)a5 errorCode:(int64_t)a6 startedAt:(double)a7 getSessionEndedAt:(double)a8 showExtensionsEndedAt:(double)a9 getStatusEndedAt:(double)a10;
@end

@implementation DEDFeedbackAnalytics

+ (void)logEventWithRequest:(id)a3 httpStatusCode:(int64_t)a4 nsurlErrorCode:(int64_t)a5 success:(BOOL)a6 startedAt:(double)a7 endedAt:(double)a8
{
  id v13 = a3;
  if (logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__onceToken != -1) {
    dispatch_once(&logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__onceToken, &__block_literal_global_20);
  }
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2;
  v21 = &unk_26453B598;
  id v22 = v13;
  int64_t v23 = a4;
  int64_t v24 = a5;
  double v25 = a7;
  double v26 = a8;
  BOOL v27 = a6;
  id v14 = v13;
  char v15 = AnalyticsSendEventLazy();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_34;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v17 = v15;
  if (logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__logOnceToken != -1) {
    dispatch_once(&logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__logOnceToken, block);
  }
}

uint64_t __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke()
{
  logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog = (uint64_t)os_log_create("com.apple.feedback.analytics", "network");
  return MEMORY[0x270F9A758]();
}

id __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2(uint64_t a1)
{
  v43[7] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 URL];
    v4 = [v3 path];

    if (v4) {
      goto LABEL_8;
    }
    v5 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
    if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_ERROR))
    {
      __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    id v13 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
    if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_ERROR))
    {
      __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v4 = @"Unknown";
LABEL_8:
  v21 = [*(id *)(a1 + 32) HTTPMethod];
  if (!v21)
  {
    id v22 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
    if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_ERROR))
    {
      __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    v21 = @"Unknown";
  }
  v42[0] = @"api_route";
  v42[1] = @"method";
  v43[0] = v4;
  v43[1] = v21;
  v42[2] = @"http_status_code";
  v30 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v43[2] = v30;
  v42[3] = @"nsurl_error_code";
  v31 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v43[3] = v31;
  v42[4] = @"duration";
  v32 = objc_msgSend(NSNumber, "numberWithDouble:", DEDTimeElapsed(*(double *)(a1 + 56), *(double *)(a1 + 64)));
  v43[4] = v32;
  v42[5] = @"success";
  v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v43[5] = v33;
  v42[6] = @"process_name";
  v34 = +[DEDConstants processName];
  v43[6] = v34;
  v35 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:7];

  v36 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
  if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_INFO))
  {
    int v38 = 138543618;
    v39 = @"com.apple.feedback.networkEvent";
    __int16 v40 = 2114;
    v41 = v35;
    _os_log_impl(&dword_21FE04000, v36, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v38, 0x16u);
  }

  return v35;
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_34(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
  BOOL v3 = os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    uint64_t v6 = @"com.apple.feedback.networkEvent";
    v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    uint64_t v6 = @"com.apple.feedback.networkEvent";
    v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

+ (void)logDataLoadWithContentItemCount:(unint64_t)a3 formItemsCount:(unint64_t)a4 teamCount:(unint64_t)a5 errorsCount:(unint64_t)a6 startedAt:(double)a7 endedAt:(double)a8
{
  if (logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__onceToken != -1) {
    dispatch_once(&logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__onceToken, &__block_literal_global_36);
  }
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_2;
  uint64_t v20 = &__block_descriptor_80_e19___NSDictionary_8__0l;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  unint64_t v23 = a5;
  unint64_t v24 = a6;
  double v25 = a8;
  double v26 = a7;
  char v14 = AnalyticsSendEventLazy();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_54;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v16 = v14;
  if (logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__logOnceToken != -1) {
    dispatch_once(&logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__logOnceToken, block);
  }
}

uint64_t __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke()
{
  logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog = (uint64_t)os_log_create("com.apple.feedback.analytics", "data-load");
  return MEMORY[0x270F9A758]();
}

id __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_2(uint64_t a1)
{
  v16[6] = *MEMORY[0x263EF8340];
  v15[0] = @"content_item_count";
  v2 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v16[0] = v2;
  v15[1] = @"form_item_count";
  BOOL v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 40)];
  v16[1] = v3;
  v15[2] = @"team_count";
  v4 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 48)];
  v16[2] = v4;
  v15[3] = @"errors_count";
  int v5 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 56)];
  v16[3] = v5;
  v15[4] = @"total_duration";
  uint64_t v6 = [NSNumber numberWithDouble:*(double *)(a1 + 64) - *(double *)(a1 + 72)];
  v16[4] = v6;
  v15[5] = @"process_name";
  uint64_t v7 = +[DEDConstants processName];
  v16[5] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  uint64_t v9 = logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog;
  if (os_log_type_enabled((os_log_t)logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    uint64_t v12 = @"com.apple.feedback.dataLoad";
    __int16 v13 = 2114;
    char v14 = v8;
    _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  return v8;
}

void __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_54(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog;
  BOOL v3 = os_log_type_enabled((os_log_t)logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    uint64_t v6 = @"com.apple.feedback.dataLoad";
    v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    uint64_t v6 = @"com.apple.feedback.dataLoad";
    v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

+ (void)logFBKBugSessionStartWithDeviceType:(id)a3 isRemote:(BOOL)a4 success:(BOOL)a5 errorCode:(int64_t)a6 startedAt:(double)a7 getSessionEndedAt:(double)a8 showExtensionsEndedAt:(double)a9 getStatusEndedAt:(double)a10
{
  id v17 = a3;
  if (logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__onceToken != -1) {
    dispatch_once(&logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__onceToken, &__block_literal_global_56);
  }
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  unint64_t v24 = __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_2;
  double v25 = &unk_26453B5E0;
  double v27 = a7;
  double v28 = a8;
  double v29 = a9;
  double v30 = a10;
  id v26 = v17;
  BOOL v32 = a4;
  BOOL v33 = a5;
  int64_t v31 = a6;
  id v18 = v17;
  char v19 = AnalyticsSendEventLazy();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_76;
  v20[3] = &__block_descriptor_33_e5_v8__0l;
  char v21 = v19;
  if (logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__logOnceToken != -1) {
    dispatch_once(&logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__logOnceToken, v20);
  }
}

uint64_t __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke()
{
  logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log = (uint64_t)os_log_create("com.apple.feedback.analytics", "fbk-session");
  return MEMORY[0x270F9A758]();
}

id __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_2(uint64_t a1)
{
  v21[8] = *MEMORY[0x263EF8340];
  double v2 = DEDTimeElapsed(*(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = DEDTimeElapsed(*(double *)(a1 + 48), *(double *)(a1 + 56));
  double v4 = DEDTimeElapsed(*(double *)(a1 + 56), *(double *)(a1 + 64));
  int v5 = @"Unknown";
  if (*(void *)(a1 + 32)) {
    int v5 = *(__CFString **)(a1 + 32);
  }
  v21[0] = v5;
  v20[0] = @"device_type";
  v20[1] = @"is_remote";
  uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  v21[1] = v6;
  v20[2] = @"success";
  uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  v21[2] = v7;
  v20[3] = @"error_code";
  uint64_t v8 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  v21[3] = v8;
  void v20[4] = @"process_name";
  uint64_t v9 = +[DEDConstants processName];
  v21[4] = v9;
  v20[5] = @"session_time_interval";
  uint64_t v10 = [NSNumber numberWithDouble:v2];
  v21[5] = v10;
  v20[6] = @"show_extensions_time_interval";
  int v11 = [NSNumber numberWithDouble:v3];
  v21[6] = v11;
  v20[7] = @"status_time_interval";
  uint64_t v12 = [NSNumber numberWithDouble:v4];
  v21[7] = v12;
  __int16 v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:8];

  char v14 = logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log;
  if (os_log_type_enabled((os_log_t)logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543618;
    id v17 = @"com.apple.feedback.fbkSideSessionStart";
    __int16 v18 = 2114;
    char v19 = v13;
    _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  return v13;
}

void __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_76(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = *(unsigned __int8 *)(a1 + 32);
  double v2 = logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log;
  BOOL v3 = os_log_type_enabled((os_log_t)logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    uint64_t v6 = @"com.apple.feedback.fbkSideSessionStart";
    double v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    uint64_t v6 = @"com.apple.feedback.fbkSideSessionStart";
    double v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
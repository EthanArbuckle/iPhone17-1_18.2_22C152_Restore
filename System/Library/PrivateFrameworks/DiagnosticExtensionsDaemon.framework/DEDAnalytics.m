@interface DEDAnalytics
+ (id)log;
+ (void)didCheckInDeferredExtensionsWithCount:(unint64_t)a3;
+ (void)didCompleteBugSessionWithState:(int64_t)a3;
+ (void)didCreateBugSessionForApp:(id)a3;
+ (void)didStartDaemon;
+ (void)didStartExtensionWithIdentifier:(id)a3;
+ (void)extensionDidScheduleExtensionWithIdentifier:(id)a3 delay:(unint64_t)a4;
+ (void)extensionWithIdentifier:(id)a3 didCompleteWithFileCount:(unint64_t)a4 bytesCollected:(unint64_t)a5 duration:(unint64_t)a6 errorCode:(int64_t)a7;
+ (void)finisherDidCompleteWithDuration:(unint64_t)a3 uploadedByteCount:(unint64_t)a4 usingFinishingMove:(int64_t)a5 withState:(int64_t)a6;
+ (void)finisherDidStartWithFileCount:(unint64_t)a3 expectedByteUploadCount:(unint64_t)a4 finishingMove:(int64_t)a5;
+ (void)logBugSessionStartWithDeviceType:(id)a3 isRemote:(BOOL)a4 success:(BOOL)a5 errorCode:(int64_t)a6;
@end

@implementation DEDAnalytics

+ (id)log
{
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, &__block_literal_global_14);
  }
  v2 = (void *)log_log_2;
  return v2;
}

void __19__DEDAnalytics_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-analytics");
  v1 = (void *)log_log_2;
  log_log_2 = (uint64_t)v0;
}

+ (void)didStartDaemon
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = [a1 log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    v5 = "+[DEDAnalytics didStartDaemon]";
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  v3 = objc_opt_new();
  AWDPostMetric();
}

+ (void)didCheckInDeferredExtensionsWithCount:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = [a1 log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    v7 = "+[DEDAnalytics didCheckInDeferredExtensionsWithCount:]";
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  v5 = objc_opt_new();
  [v5 setNumtasks:a3];
  AWDPostMetric();
}

+ (void)didCreateBugSessionForApp:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446210;
    uint64_t v8 = "+[DEDAnalytics didCreateBugSessionForApp:]";
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  int v6 = objc_opt_new();
  [v6 setHostapp:v4];

  AWDPostMetric();
}

+ (void)didStartExtensionWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446210;
    uint64_t v8 = "+[DEDAnalytics didStartExtensionWithIdentifier:]";
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  int v6 = objc_opt_new();
  [v6 setExtension:v4];

  AWDPostMetric();
}

+ (void)extensionDidScheduleExtensionWithIdentifier:(id)a3 delay:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [a1 log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136446210;
    v10 = "+[DEDAnalytics extensionDidScheduleExtensionWithIdentifier:delay:]";
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = objc_opt_new();
  [v8 setExtension:v6];

  [v8 setDelay:a4];
  AWDPostMetric();
}

+ (void)extensionWithIdentifier:(id)a3 didCompleteWithFileCount:(unint64_t)a4 bytesCollected:(unint64_t)a5 duration:(unint64_t)a6 errorCode:(int64_t)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v13 = [a1 log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 136446210;
    v16 = "+[DEDAnalytics extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:]";
    _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v15, 0xCu);
  }

  v14 = objc_opt_new();
  [v14 setExtension:v12];

  [v14 setNumfiles:a4];
  [v14 setNumbytes:a5];
  [v14 setDuration:a6];
  [v14 setError:a7];
  AWDPostMetric();
}

+ (void)finisherDidStartWithFileCount:(unint64_t)a3 expectedByteUploadCount:(unint64_t)a4 finishingMove:(int64_t)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v8 = [a1 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136446210;
    id v12 = "+[DEDAnalytics finisherDidStartWithFileCount:expectedByteUploadCount:finishingMove:]";
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v11, 0xCu);
  }

  int v9 = objc_opt_new();
  [v9 setNumfiles:a3];
  [v9 setNumbytes:a4];
  if ((unint64_t)(a5 - 1) < 3) {
    uint64_t v10 = a5;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setType:v10];
  AWDPostMetric();
}

+ (void)finisherDidCompleteWithDuration:(unint64_t)a3 uploadedByteCount:(unint64_t)a4 usingFinishingMove:(int64_t)a5 withState:(int64_t)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v10 = [a1 log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 136446210;
    v14 = "+[DEDAnalytics finisherDidCompleteWithDuration:uploadedByteCount:usingFinishingMove:withState:]";
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v13, 0xCu);
  }

  int v11 = objc_opt_new();
  [v11 setDuration:a3];
  [v11 setNumbytes:a4];
  if ((unint64_t)(a5 - 1) < 3) {
    uint64_t v12 = a5;
  }
  else {
    uint64_t v12 = 0;
  }
  [v11 setType:v12];
  [v11 setState:a6];
  AWDPostMetric();
}

+ (void)didCompleteBugSessionWithState:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [a1 log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    int v7 = "+[DEDAnalytics didCompleteBugSessionWithState:]";
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  v5 = objc_opt_new();
  [v5 setSessionState:a3];
  AWDPostMetric();
}

+ (void)logBugSessionStartWithDeviceType:(id)a3 isRemote:(BOOL)a4 success:(BOOL)a5 errorCode:(int64_t)a6
{
  id v9 = a3;
  if (logBugSessionStartWithDeviceType_isRemote_success_errorCode__onceToken != -1) {
    dispatch_once(&logBugSessionStartWithDeviceType_isRemote_success_errorCode__onceToken, &__block_literal_global_13);
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_2;
  uint64_t v17 = &unk_26453B288;
  BOOL v20 = a4;
  BOOL v21 = a5;
  id v18 = v9;
  int64_t v19 = a6;
  id v10 = v9;
  char v11 = AnalyticsSendEventLazy();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_34;
  v12[3] = &__block_descriptor_33_e5_v8__0l;
  char v13 = v11;
  if (logBugSessionStartWithDeviceType_isRemote_success_errorCode__logOnceToken != -1) {
    dispatch_once(&logBugSessionStartWithDeviceType_isRemote_success_errorCode__logOnceToken, v12);
  }
}

uint64_t __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke()
{
  logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog = (uint64_t)os_log_create("com.apple.feedback.analytics", "session-start");
  return MEMORY[0x270F9A758]();
}

id __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_2(uint64_t a1)
{
  v15[5] = *MEMORY[0x263EF8340];
  id v2 = @"Unknown";
  if (*(void *)(a1 + 32)) {
    id v2 = *(__CFString **)(a1 + 32);
  }
  v15[0] = v2;
  v14[0] = @"device_type";
  v14[1] = @"is_remote";
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v15[1] = v3;
  v14[2] = @"success";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v15[2] = v4;
  v14[3] = @"error_code";
  v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v15[3] = v5;
  v14[4] = @"process_name";
  int v6 = +[DEDConstants processName];
  v15[4] = v6;
  int v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  uint64_t v8 = logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog;
  if (os_log_type_enabled((os_log_t)logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543618;
    char v11 = @"com.apple.feedback.bugSessionStart";
    __int16 v12 = 2114;
    char v13 = v7;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

void __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_34(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = *(unsigned __int8 *)(a1 + 32);
  id v2 = logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog;
  BOOL v3 = os_log_type_enabled((os_log_t)logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    int v6 = @"com.apple.feedback.bugSessionStart";
    id v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3) {
      return;
    }
    int v5 = 138543362;
    int v6 = @"com.apple.feedback.bugSessionStart";
    id v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

@end
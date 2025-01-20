@interface DEExtensionTracker
+ (BOOL)hasInactiveLoggingSession:(id)a3;
+ (BOOL)shouldSetupWithIdentifier:(id)a3 session:(id)a4 expirationDate:(id)a5;
+ (BOOL)shouldTeardownWithIdentifier:(id)a3 session:(id)a4;
+ (double)xpcActivityTimeInterval;
+ (id)criteria:(id)a3;
+ (id)currentLoggingExtensions;
+ (id)sharedSerialQueue;
+ (id)userDefaults;
+ (void)_updateExtensionExpirationDateWithIdentifier:(id)a3 expirationDate:(id)a4;
+ (void)_updateXPCActivityDate;
+ (void)checkIn;
+ (void)decreaseRetainCountWithIdentifier:(id)a3 session:(id)a4;
+ (void)extensionTrackerCleanup;
+ (void)increaseRetainCountWithIdentifier:(id)a3 session:(id)a4;
+ (void)saveCurrentLoggingExtensionsWithDictionary:(id)a3;
+ (void)scheduleXPCActivity;
+ (void)updateExpirationDateWithIdentifier:(id)a3 expirationDate:(id)a4;
+ (void)updateRetainCountWithIdentifier:(id)a3 session:(id)a4 offsetBy:(int)a5;
@end

@implementation DEExtensionTracker

+ (void)checkIn
{
  objc_initWeak(&location, a1);
  v2 = [(id)objc_opt_class() sharedSerialQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__DEExtensionTracker_checkIn__block_invoke;
  v3[3] = &unk_1E5D2FF08;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __29__DEExtensionTracker_checkIn__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "+[DEExtensionTracker checkIn]_block_invoke";
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %s", (uint8_t *)&v5, 0xCu);
  }

  v3 = +[DEExtensionManager sharedInstance];
  [v3 loadExtensions];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(id)objc_opt_class() _updateXPCActivityDate];
}

+ (BOOL)shouldSetupWithIdentifier:(id)a3 session:(id)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  objc_initWeak(&location, a1);
  v11 = [(id)objc_opt_class() sharedSerialQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__DEExtensionTracker_shouldSetupWithIdentifier_session_expirationDate___block_invoke;
  v16[3] = &unk_1E5D2FF30;
  id v17 = v8;
  id v18 = v9;
  v20 = &v23;
  id v12 = v9;
  id v13 = v8;
  objc_copyWeak(&v21, &location);
  id v19 = v10;
  id v14 = v10;
  dispatch_sync(v11, v16);

  LOBYTE(v11) = *((unsigned char *)v24 + 24);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v23, 8);
  return (char)v11;
}

void __71__DEExtensionTracker_shouldSetupWithIdentifier_session_expirationDate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 136315650;
    v11 = "+[DEExtensionTracker shouldSetupWithIdentifier:session:expirationDate:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_INFO, "%s %@, %@", (uint8_t *)&v10, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(id)objc_opt_class() hasInactiveLoggingSession:*(void *)(a1 + 32)];

  id v6 = objc_loadWeakRetained((id *)(a1 + 64));
  [(id)objc_opt_class() increaseRetainCountWithIdentifier:*(void *)(a1 + 32) session:*(void *)(a1 + 40)];

  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  [(id)objc_opt_class() updateExpirationDateWithIdentifier:*(void *)(a1 + 32) expirationDate:*(void *)(a1 + 48)];

  id v8 = Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v10 = 67109120;
    LODWORD(v11) = v9;
    _os_log_impl(&dword_1A7E51000, v8, OS_LOG_TYPE_INFO, "isFirstTimeRunningExtension: %i", (uint8_t *)&v10, 8u);
  }
}

+ (BOOL)shouldTeardownWithIdentifier:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  objc_initWeak(&location, a1);
  id v8 = [(id)objc_opt_class() sharedSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__DEExtensionTracker_shouldTeardownWithIdentifier_session___block_invoke;
  block[3] = &unk_1E5D2FF58;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_copyWeak(&v16, &location);
  uint64_t v15 = &v18;
  dispatch_sync(v8, block);

  LOBYTE(v8) = *((unsigned char *)v19 + 24);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
  return (char)v8;
}

void __59__DEExtensionTracker_shouldTeardownWithIdentifier_session___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v15 = 136315650;
    id v16 = "+[DEExtensionTracker shouldTeardownWithIdentifier:session:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_INFO, "%s %@, %@", (uint8_t *)&v15, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v6 = [(id)objc_opt_class() hasInactiveLoggingSession:*(void *)(a1 + 32)];

  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  [v7 decreaseRetainCountWithIdentifier:*(void *)(a1 + 32) session:*(void *)(a1 + 40)];

  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v8 = a1 + 48;
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = 0;
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 56));
    char v11 = [(id)objc_opt_class() hasInactiveLoggingSession:*(void *)(a1 + 32)];
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v8 = a1 + 48;
    *(unsigned char *)(*(void *)(v12 + 8) + 24) = v11;
  }
  id v13 = Log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = *(unsigned __int8 *)(*(void *)(*(void *)v8 + 8) + 24);
    int v15 = 67109120;
    LODWORD(v16) = v14;
    _os_log_impl(&dword_1A7E51000, v13, OS_LOG_TYPE_INFO, "shouldTeardownExtension: %i", (uint8_t *)&v15, 8u);
  }
}

+ (id)currentLoggingExtensions
{
  v2 = [(id)objc_opt_class() userDefaults];
  uint64_t v3 = [v2 dictionaryForKey:@"com.apple.DiagnosticExtensions.extensionTracker"];

  return v3;
}

+ (id)userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DiagnosticExtensions.extensionTracker"];
  return v2;
}

+ (void)saveCurrentLoggingExtensionsWithDictionary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() userDefaults];
  [v4 setObject:v3 forKey:@"com.apple.DiagnosticExtensions.extensionTracker"];

  [v4 synchronize];
  int v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(id)objc_opt_class() currentLoggingExtensions];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: currentLoggingExtensions: %@", (uint8_t *)&v7, 0xCu);
  }
}

+ (BOOL)hasInactiveLoggingSession:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() currentLoggingExtensions];
  int v5 = [v4 objectForKeyedSubscript:v3];
  int v6 = [v5 objectForKeyedSubscript:@"Sessions"];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__DEExtensionTracker_hasInactiveLoggingSession___block_invoke;
  v10[3] = &unk_1E5D2FF80;
  v10[4] = &v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  int v7 = [v4 objectForKeyedSubscript:v3];
  if (v7) {
    BOOL v8 = *((_DWORD *)v12 + 6) == 0;
  }
  else {
    BOOL v8 = 1;
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __48__DEExtensionTracker_hasInactiveLoggingSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 intValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)sharedSerialQueue
{
  if (sharedSerialQueue_onceToken != -1) {
    dispatch_once(&sharedSerialQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedSerialQueue_sharedDispatchQueue;
  return v2;
}

uint64_t __39__DEExtensionTracker_sharedSerialQueue__block_invoke()
{
  sharedSerialQueue_sharedDispatchQueue = (uint64_t)dispatch_queue_create((const char *)[@"com.apple.DiagnosticExtensions.extensionTracker" UTF8String], 0);
  return MEMORY[0x1F41817F8]();
}

+ (void)updateExpirationDateWithIdentifier:(id)a3 expirationDate:(id)a4
{
  [a1 _updateExtensionExpirationDateWithIdentifier:a3 expirationDate:a4];
  [a1 _updateXPCActivityDate];
}

+ (void)_updateExtensionExpirationDateWithIdentifier:(id)a3 expirationDate:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [(id)objc_opt_class() currentLoggingExtensions];
  BOOL v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  if (!v7) {
    int v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v10 = (void *)[v7 mutableCopy];

  uint64_t v11 = [v10 objectForKeyedSubscript:v5];
  uint64_t v12 = v11;
  if (!v11) {
    uint64_t v11 = v9;
  }
  uint64_t v13 = (void *)[v11 mutableCopy];

  uint64_t v14 = [v13 objectForKeyedSubscript:@"ExpirationDate"];
  int v15 = (void *)v14;
  if (v14) {
    id v16 = (void *)v14;
  }
  else {
    id v16 = v6;
  }
  id v17 = v16;

  uint64_t v18 = [v17 laterDate:v6];

  [v13 setObject:v18 forKeyedSubscript:@"ExpirationDate"];
  [v10 setObject:v13 forKeyedSubscript:v5];
  __int16 v19 = Log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v18;
    _os_log_impl(&dword_1A7E51000, v19, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: Updating %@ expiration date to %@", (uint8_t *)&v22, 0x16u);
  }

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = (void *)[v10 copy];
  [v20 saveCurrentLoggingExtensionsWithDictionary:v21];
}

+ (void)_updateXPCActivityDate
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() currentLoggingExtensions];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = (void *)[v3 mutableCopy];

  id v6 = [v5 allKeys];
  if ([v6 count] == 1)
  {
    int v7 = [v5 objectForKeyedSubscript:@"XPCActivity"];

    if (v7)
    {
      [v5 setObject:0 forKeyedSubscript:@"XPCActivity"];
      BOOL v8 = objc_opt_class();
      uint64_t v9 = (void *)[v5 copy];
      [v8 saveCurrentLoggingExtensionsWithDictionary:v9];

      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v23 = 0;
  __int16 v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__DEExtensionTracker__updateXPCActivityDate__block_invoke;
  v22[3] = &unk_1E5D2FFC8;
  v22[4] = &v23;
  [v5 enumerateKeysAndObjectsUsingBlock:v22];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  if ([v24[5] compare:v10] == -1)
  {
    uint64_t v11 = Log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (__CFString *)v24[5];
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_1A7E51000, v11, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: extensionEarliestDate is aged out (%@), assign to %@ instead", buf, 0x16u);
    }

    objc_storeStrong(v24 + 5, v10);
  }
  id v13 = v24[5];
  [(id)objc_opt_class() xpcActivityTimeInterval];
  uint64_t v14 = objc_msgSend(v13, "dateByAddingTimeInterval:");
  id v15 = v24[5];
  v29[0] = @"EarliestExpirationDate";
  v29[1] = @"XPCActivityScheduledDate";
  v30[0] = v15;
  v30[1] = v14;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v5 setObject:v16 forKeyedSubscript:@"XPCActivity"];

  id v17 = Log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = v24[5];
    *(_DWORD *)buf = 138412546;
    v32 = @"XPCActivity";
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1A7E51000, v17, OS_LOG_TYPE_INFO, "DEExtensionTracker: Updating %@ to %@", buf, 0x16u);
  }

  __int16 v19 = Log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v32 = @"XPCActivityScheduledDate";
    __int16 v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1A7E51000, v19, OS_LOG_TYPE_INFO, "DEExtensionTracker: Updating %@ to %@", buf, 0x16u);
  }

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = (void *)[v5 copy];
  [v20 saveCurrentLoggingExtensionsWithDictionary:v21];

  [a1 scheduleXPCActivity];
  _Block_object_dispose(&v23, 8);

LABEL_16:
}

uint64_t __44__DEExtensionTracker__updateXPCActivityDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"ExpirationDate"];
  if (v4)
  {
    id obj = v4;
    if ([v4 compare:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)] == -1) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
    }
  }
  return MEMORY[0x1F41817F8]();
}

+ (double)xpcActivityTimeInterval
{
  return 7200.0;
}

+ (id)criteria:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8], 0);
  [v3 timeIntervalSinceNow];
  double v6 = v5;

  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v6);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141A8], 30);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  return v4;
}

+ (void)scheduleXPCActivity
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "+[DEExtensionTracker scheduleXPCActivity]";
    _os_log_impl(&dword_1A7E51000, v3, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %s", buf, 0xCu);
  }

  xpc_object_t v4 = [(id)objc_opt_class() currentLoggingExtensions];
  double v5 = v4;
  if (!v4) {
    xpc_object_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  double v6 = (void *)[v4 mutableCopy];

  int v7 = [v6 objectForKeyedSubscript:@"XPCActivity"];
  BOOL v8 = [v7 objectForKeyedSubscript:@"XPCActivityScheduledDate"];

  uint64_t v9 = Log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: scheduleXPCActivityToDate %@", buf, 0xCu);
    }

    uint64_t v11 = (const char *)[@"com.apple.DiagnosticExtensions.extensionTracker" UTF8String];
    uint64_t v12 = (void *)*MEMORY[0x1E4F14158];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__DEExtensionTracker_scheduleXPCActivity__block_invoke;
    v13[3] = &unk_1E5D2FFF0;
    id v15 = a1;
    uint64_t v14 = v8;
    xpc_activity_register(v11, v12, v13);
    uint64_t v9 = v14;
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: tracker dict is empty. There's nothing to schedule.", buf, 2u);
  }
}

void __41__DEExtensionTracker_scheduleXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    int v7 = Log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1A7E51000, v7, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: XPC_ACTIVITY_STATE_RUN", v8, 2u);
    }

    [(id)objc_opt_class() extensionTrackerCleanup];
  }
  else if (!state)
  {
    double v5 = Log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: XPC_ACTIVITY_STATE_CHECK_IN", buf, 2u);
    }

    double v6 = [*(id *)(a1 + 40) criteria:*(void *)(a1 + 32)];
    xpc_activity_set_criteria(v3, v6);
  }
}

+ (void)extensionTrackerCleanup
{
  objc_initWeak(&location, a1);
  id v3 = [(id)objc_opt_class() sharedSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke;
  block[3] = &unk_1E5D30040;
  objc_copyWeak(v5, &location);
  v5[1] = a1;
  dispatch_async(v3, block);

  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[DEExtensionTracker extensionTrackerCleanup]_block_invoke";
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %s", (uint8_t *)&buf, 0xCu);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [(id)objc_opt_class() currentLoggingExtensions];

  if ([v5 count])
  {
    double v6 = [v5 objectForKeyedSubscript:@"XPCActivity"];
    int v7 = [v6 objectForKeyedSubscript:@"XPCActivityScheduledDate"];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    __int16 v19 = __Block_byref_object_copy_;
    uint64_t v20 = __Block_byref_object_dispose_;
    id v21 = (id)[v5 mutableCopy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_32;
    v13[3] = &unk_1E5D30018;
    BOOL v8 = v7;
    uint64_t v14 = v8;
    p_long long buf = &buf;
    uint64_t v16 = *(void *)(a1 + 40);
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
    id v9 = objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v10 = objc_opt_class();
    uint64_t v11 = (void *)[*(id *)(*((void *)&buf + 1) + 40) copy];
    [v10 saveCurrentLoggingExtensionsWithDictionary:v11];

    id v12 = objc_loadWeakRetained(v3);
    [(id)objc_opt_class() _updateXPCActivityDate];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v8 = Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A7E51000, v8, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: Exit early. Nothing to clean up.", (uint8_t *)&buf, 2u);
    }
  }
}

void __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"ExpirationDate"];
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 compare:*(void *)(a1 + 32)];
    BOOL v10 = Log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 == 1)
    {
      if (v11)
      {
        id v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        id v28 = v12;
        _os_log_impl(&dword_1A7E51000, v10, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %@ (%@) is NOT due (%@). Start cleaning up '0' retain count.", buf, 0x20u);
      }

      id v13 = [v6 objectForKeyedSubscript:@"Sessions"];
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      id v28 = __Block_byref_object_copy_;
      v29 = __Block_byref_object_dispose_;
      id v30 = (id)[v13 mutableCopy];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_33;
      v26[3] = &unk_1E5D2FF80;
      v26[4] = buf;
      [v13 enumerateKeysAndObjectsUsingBlock:v26];
      uint64_t v14 = (void *)[v6 mutableCopy];
      id v15 = (void *)[*(id *)(*(void *)&buf[8] + 40) copy];
      [v14 setObject:v15 forKeyedSubscript:@"Sessions"];

      uint64_t v16 = (void *)[v14 copy];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v16 forKeyedSubscript:v5];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v11)
      {
        id v17 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        id v28 = v17;
        _os_log_impl(&dword_1A7E51000, v10, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %@ (%@) is due (%@). Calling checkAndTeardownWithHandler:", buf, 0x20u);
      }

      uint64_t v18 = +[DEExtensionManager sharedInstance];
      id v13 = [v18 extensionForIdentifier:v5];

      int v19 = [v13 checkAndTeardown];
      uint64_t v20 = Log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v5;
          _os_log_impl(&dword_1A7E51000, v20, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %@ is done cleaning up.", buf, 0xCu);
        }

        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:0 forKeyedSubscript:v5];
      }
      else
      {
        if (v21)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A7E51000, v20, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: extension failed to turn off. Reschedule to (now + 2 hours).", buf, 2u);
        }

        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        [(id)objc_opt_class() xpcActivityTimeInterval];
        uint64_t v23 = objc_msgSend(v22, "dateByAddingTimeInterval:");

        __int16 v24 = (void *)[v6 mutableCopy];
        [v24 setObject:v23 forKeyedSubscript:@"ExpirationDate"];
        uint64_t v25 = (void *)[v24 copy];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v25 forKeyedSubscript:v5];
      }
    }
  }
}

void __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (![a3 intValue])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:0 forKeyedSubscript:v5];
    id v6 = Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1A7E51000, v6, OS_LOG_TYPE_INFO, "DEExtensionTracker: %@ retain count is 0. Removing it.", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (void)increaseRetainCountWithIdentifier:(id)a3 session:(id)a4
{
}

+ (void)decreaseRetainCountWithIdentifier:(id)a3 session:(id)a4
{
}

+ (void)updateRetainCountWithIdentifier:(id)a3 session:(id)a4 offsetBy:(int)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() currentLoggingExtensions];
  BOOL v10 = v9;
  BOOL v11 = (void *)MEMORY[0x1E4F1CC08];
  if (!v9) {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v26 = (id)[v9 mutableCopy];

  id v12 = [v26 objectForKeyedSubscript:v8];
  id v13 = v12;
  if (!v12) {
    id v12 = v11;
  }
  uint64_t v14 = (void *)[v12 mutableCopy];

  id v15 = [v14 objectForKeyedSubscript:@"Sessions"];
  uint64_t v16 = v15;
  if (!v15) {
    id v15 = v11;
  }
  id v17 = (void *)[v15 mutableCopy];

  uint64_t v18 = [v17 objectForKeyedSubscript:v7];
  int v19 = (void *)v18;
  uint64_t v20 = &unk_1EFE526B0;
  if (v18) {
    uint64_t v20 = (void *)v18;
  }
  id v21 = v20;

  uint64_t v22 = [v21 integerValue];
  uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:(v22 + a5) & ~((v22 + a5) >> 63)];
  [v17 setObject:v23 forKeyedSubscript:v7];

  [v14 setObject:v17 forKeyedSubscript:@"Sessions"];
  [v26 setObject:v14 forKeyedSubscript:v8];

  __int16 v24 = objc_opt_class();
  uint64_t v25 = (void *)[v26 copy];
  [v24 saveCurrentLoggingExtensionsWithDictionary:v25];
}

@end
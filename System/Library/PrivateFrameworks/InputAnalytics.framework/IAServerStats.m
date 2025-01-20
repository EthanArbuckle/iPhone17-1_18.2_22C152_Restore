@interface IAServerStats
+ (void)logShutdown;
+ (void)logStart;
+ (void)reportConnectionStatusSuccessful:(BOOL)a3;
+ (void)reportDailyStats;
@end

@implementation IAServerStats

+ (void)logStart
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.inputAnalytics.serverStats", v4);
  uint64_t v8 = objc_msgSend_integerForKey_(v5, v6, @"serviceStartCount", v7);
  objc_msgSend_setInteger_forKey_(v5, v9, v8 + 1, @"serviceStartCount");
  v10 = sub_2529FF470();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2529F1000, v10, OS_LOG_TYPE_DEFAULT, "logStart", v11, 2u);
  }
}

+ (void)logShutdown
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.inputAnalytics.serverStats", v4);
  uint64_t v8 = objc_msgSend_integerForKey_(v5, v6, @"serviceShutdownCount", v7);
  objc_msgSend_setInteger_forKey_(v5, v9, v8 + 1, @"serviceShutdownCount");
  v10 = sub_2529FF470();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2529F1000, v10, OS_LOG_TYPE_DEFAULT, "logShutdown", v11, 2u);
  }
}

+ (void)reportConnectionStatusSuccessful:(BOOL)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2529FF5F4;
  block[3] = &unk_265387C90;
  BOOL v4 = a3;
  if (qword_26B230118 != -1) {
    dispatch_once(&qword_26B230118, block);
  }
}

+ (void)reportDailyStats
{
  v48[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.inputAnalytics.serverStats", v4);
  uint64_t v8 = objc_msgSend_integerForKey_(v5, v6, @"serviceStartCount", v7);
  uint64_t v11 = objc_msgSend_integerForKey_(v5, v9, @"serviceShutdownCount", v10);
  v15 = objc_msgSend_now(MEMORY[0x263EFF910], v12, v13, v14);
  v21 = objc_msgSend_objectForKey_(v5, v16, @"lastPublishDate", v17);
  if (!v21) {
    v21 = objc_msgSend_copy(v15, v18, v19, v20);
  }
  objc_msgSend_timeIntervalSinceDate_(v15, v18, (uint64_t)v21, v20);
  double v23 = v22;
  uint64_t v24 = (unint64_t)v22;
  v47[0] = @"serviceStartCount";
  v27 = objc_msgSend_numberWithInteger_(NSNumber, v25, v8, v26);
  v48[0] = v27;
  v47[1] = @"serviceShutdownCount";
  v30 = objc_msgSend_numberWithInteger_(NSNumber, v28, v11, v29);
  v48[1] = v30;
  v47[2] = @"secondsSinceLastPublish";
  v33 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v31, v24, v32);
  v48[2] = v33;
  v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)v48, (uint64_t)v47, 3);
  objc_msgSend_dispatchEvent_payload_(IAEventDispatcher, v36, @"com.apple.inputAnalytics.serverStats", (uint64_t)v35);

  v37 = sub_2529FF470();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 134218496;
    double v42 = v23;
    __int16 v43 = 2048;
    uint64_t v44 = v8;
    __int16 v45 = 2048;
    uint64_t v46 = v11;
    _os_log_impl(&dword_2529F1000, v37, OS_LOG_TYPE_DEFAULT, "reportDailyStats: Interval %f Starts %lu Shutdowns %lu", (uint8_t *)&v41, 0x20u);
  }

  objc_msgSend_setInteger_forKey_(v5, v38, 0, @"serviceStartCount");
  objc_msgSend_setInteger_forKey_(v5, v39, 0, @"serviceShutdownCount");
  objc_msgSend_setObject_forKey_(v5, v40, (uint64_t)v15, @"lastPublishDate");
}

@end
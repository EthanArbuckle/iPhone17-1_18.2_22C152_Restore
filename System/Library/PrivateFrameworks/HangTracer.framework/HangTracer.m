void __HTCreateAnalyticsEventForAlwaysOnHang_block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

uint64_t HTTelemetryHasRunThisBoot()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1)
  {
    if (*__error() == 2) {
      return 0;
    }
    v2 = shared_ht_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_1B3C06000, v2, OS_LOG_TYPE_DEFAULT, "sem_open() failed: %{errno}d", (uint8_t *)v4, 8u);
    }
  }
  else
  {
    sem_close(v0);
  }
  return 1;
}

__CFString *getStringForSubtype(unint64_t a1)
{
  if (a1 <= 0xA) {
    a1 = *off_1E60721F8[a1];
  }
  return (__CFString *)(id)a1;
}

void __HTGatherHomeVolumeSpaceInfo_block_invoke()
{
  uint64_t v0 = HTGetHomeDirectoryURL();
  uint64_t v1 = (void *)HTGatherHomeVolumeSpaceInfo_homeURL;
  HTGatherHomeVolumeSpaceInfo_homeURL = v0;

  if (!HTGatherHomeVolumeSpaceInfo_homeURL)
  {
    v2 = shared_ht_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v3 = 0;
      _os_log_impl(&dword_1B3C06000, v2, OS_LOG_TYPE_DEFAULT, "Unable to get home dir URL", v3, 2u);
    }
  }
}

uint64_t checkForAssertionOverlap(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = 0;
  unint64_t v33 = 0;
  int v8 = 0;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unint64_t v30 = a2 - a1;
  uint64_t v32 = a3 + 32;
  do
  {
    if (*(void *)(a3 + v7))
    {
      ++v8;
      uint64_t v9 = a3 + v7;
      unint64_t v10 = *(void *)(a3 + v7 + 24);
      if (v10 >= *(void *)(a3 + v7 + 16)) {
        unint64_t v10 = *(void *)(a3 + v7 + 16);
      }
      unint64_t v11 = *(void *)(a3 + v7 + 8) <= a1 ? a1 : *(void *)(a3 + v7 + 8);
      unint64_t v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        v13 = shared_ht_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          double v14 = *(double *)(a3 + v7);
          double v15 = *(double *)(v9 + 8);
          uint64_t v16 = *(void *)(v9 + 24);
          *(_DWORD *)buf = 134219266;
          double v37 = v14;
          __int16 v38 = 2080;
          *(void *)&double v39 = v32 + v7;
          __int16 v40 = 2048;
          double v41 = v15;
          __int16 v42 = 2048;
          uint64_t v43 = v16;
          __int16 v44 = 2048;
          unint64_t v45 = a1;
          __int16 v46 = 2048;
          unint64_t v47 = a2;
          _os_log_impl(&dword_1B3C06000, v13, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end=%llu, hangstart=%llu, hangend=%llu)", buf, 0x3Eu);
        }

        if (*(unsigned char *)(a3 + v7 + 96))
        {
          if (*(void *)(v9 + 24) < a2)
          {
            v17 = shared_ht_log_handle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v18 = v17;
              v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              uint32_t v20 = 2;
LABEL_22:
              _os_log_impl(&dword_1B3C06000, v18, OS_LOG_TYPE_INFO, v19, buf, v20);
              goto LABEL_23;
            }
            goto LABEL_23;
          }
          if (*(void *)(v9 + 8) > a1)
          {
            v17 = shared_ht_log_handle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v18 = v17;
              v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }
LABEL_23:

            goto LABEL_30;
          }
          double v21 = MATU_TO_MS(v30);
          v22 = shared_ht_log_handle();
          v17 = v22;
          if (v21 >= 1000.0)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            double v23 = MATU_TO_MS(v30);
            *(_DWORD *)buf = 134217984;
            double v37 = v23;
            v18 = v17;
            v19 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            uint32_t v20 = 12;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            checkForAssertionOverlap_cold_3(v34, v30, &v35, v17);
          }
        }
        v33 += v12 - v11;
        if (a4) {
          AnalyticsSendEventLazy();
        }
      }
    }
LABEL_30:
    v7 += 104;
  }
  while (v7 != 1040);
  if (!v8)
  {
    v28 = shared_ht_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      checkForAssertionOverlap_cold_1(v28);
    }
    goto LABEL_48;
  }
  double v24 = MATU_TO_MS(v33);
  double v25 = MATU_TO_MS(v30) - v24;
  if (v25 >= 250.0)
  {
    v29 = shared_ht_log_handle();
    v28 = v29;
    if (v33)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v37 = v25;
        _os_log_impl(&dword_1B3C06000, v28, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      checkForAssertionOverlap_cold_2(v28);
    }
LABEL_48:

    return 0;
  }
  v26 = shared_ht_log_handle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    double v37 = v24;
    __int16 v38 = 2048;
    double v39 = (double)v33 * 100.0 / (double)v30;
    __int16 v40 = 2048;
    double v41 = v25;
    _os_log_impl(&dword_1B3C06000, v26, OS_LOG_TYPE_DEFAULT, "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap", buf, 0x20u);
  }

  if (a4)
  {
    HTAggdPushValueForDistributionKey();
    HTAggdPushValueForDistributionKey();
    AnalyticsSendEventLazy();
  }
  return 1;
}

void __HTTelemetryCheckForUpdates_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int HasRunThisBoot = HTTelemetryHasRunThisBoot();
  int v3 = shared_ht_log_handle();
  empty = v3;
  if (HasRunThisBoot)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __HTTelemetryCheckForUpdates_block_invoke_cold_1(empty);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B3C06000, empty, OS_LOG_TYPE_INFO, "Updating telemetry", (uint8_t *)&v10, 2u);
    }

    uint64_t v5 = dispatch_get_global_queue(21, 0);
    mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v5, 0);

    xpc_connection_set_event_handler(mach_service, &__block_literal_global_3);
    xpc_connection_activate(mach_service);
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "command", 1uLL);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (MEMORY[0x1B3EC2D70]() == MEMORY[0x1E4F145A8])
    {
      int v8 = shared_ht_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x1E4F14530]);
        int v10 = 136315138;
        unint64_t v11 = string;
        _os_log_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEFAULT, "Received error updating telemetry: %s", (uint8_t *)&v10, 0xCu);
      }
    }
    dispatch_sync(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_8);
  }
}

id HTGetHomeDirectoryURL()
{
  uint64_t v0 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  if (v0)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v0 isDirectory:1];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

void HTTelemetryCheckForUpdates(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __HTTelemetryCheckForUpdates_block_invoke;
  block[3] = &unk_1E60718C0;
  id v5 = v1;
  uint64_t v2 = HTTelemetryCheckForUpdates_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&HTTelemetryCheckForUpdates_onceToken, block);
  }
}

void *hangEventCaptureUserActionCreateData(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v1 = *(void (**)(void))(a1 + 376);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1();
  id v3 = shared_ht_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v2 length];
    _os_log_impl(&dword_1B3C06000, v3, OS_LOG_TYPE_DEFAULT, "User action data captured with size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

uint64_t isAppBeingDebugged(int a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = [v2 environment];
  v4 = [v3 objectForKeyedSubscript:@"HT_DISABLE_DEBUGGER_CHECK"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = shared_ht_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C06000, v6, OS_LOG_TYPE_DEFAULT, "Check for app is being debugged is disabled", buf, 2u);
    }

    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)buf = 0u;
  long long v16 = 0u;
  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    int v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_INFO, "Failed to check if app is being debugged", (uint8_t *)&v11, 2u);
    }
    uint64_t v7 = 0;
    goto LABEL_18;
  }
  if ((v17 & 2) != 0)
  {
    int v8 = [NSString stringWithUTF8String:&v16];
    if (([v8 isEqualToString:@"xctest"] & 1) != 0
      || ([v8 isEqualToString:@"hangman"] & 1) != 0
      || [v8 hasSuffix:@"-Runner"])
    {
      uint64_t v9 = shared_ht_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = v8;
        __int16 v13 = 1024;
        int v14 = a1;
        _os_log_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO", (uint8_t *)&v11, 0x12u);
      }
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v9 = shared_ht_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_DEFAULT, "App is being debugged, do not track this hang", (uint8_t *)&v11, 2u);
      }
      uint64_t v7 = 1;
    }

LABEL_18:
    return v7;
  }
  return 0;
}

void __HTCAQueue_block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.hangtracer.coreanalytics", v0);
  uint64_t v2 = (void *)HTCAQueue_caQueue;
  HTCAQueue_caQueue = (uint64_t)v1;
}

void HTCreateAnalyticsEventForAlwaysOnHang(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v6 = HTCAQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __HTCreateAnalyticsEventForAlwaysOnHang_block_invoke;
  block[3] = &unk_1E6071AF8;
  id v9 = v5;
  uint64_t v10 = a1;
  double v11 = a3;
  id v7 = v5;
  dispatch_async(v6, block);
}

void signpostHangInterval(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  uint64_t v10 = a2;
  double v11 = a5;
  *(void *)buf = 0;
  mach_get_times();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = v11;
    __int16 v13 = v12;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v14 = @"Unknown";
      *(_DWORD *)buf = 134349826;
      *(void *)&uint8_t buf[4] = a3;
      if (v10) {
        double v15 = v10;
      }
      else {
        double v15 = @"Unknown";
      }
      __int16 v17 = 2050;
      uint64_t v18 = a4;
      __int16 v19 = 2114;
      if (v9) {
        int v14 = v9;
      }
      uint32_t v20 = v15;
      __int16 v21 = 2114;
      v22 = v14;
      _os_signpost_emit_with_name_impl(&dword_1B3C06000, v13, OS_SIGNPOST_EVENT, a3, "HangInterval", "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{public, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x2Au);
    }
  }
}

uint64_t __HTPrefsQueue_block_invoke()
{
  HTPrefsQueue__htPrefsQueue = (uint64_t)dispatch_queue_create("com.apple.hangtracer.prefsqueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __HTConnectionQueue_block_invoke()
{
  HTConnectionQueue__htConnectionQueue = (uint64_t)dispatch_queue_create("com.apple.hangtracer.connectionqueue", 0);
  return MEMORY[0x1F41817F8]();
}

void __StartMonitoringWatchdogDisablement_block_invoke_117(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "setPredicates:", v5, v6, v7);

  [v4 setStateDescriptor:a1[5]];
  [v4 setUpdateHandler:a1[6]];
}

void __connectToHangTracer_block_invoke()
{
  if (!hangTracerConnection)
  {
    uint64_t v0 = HTConnectionQueue();
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangtracerd", v0, 0);
    uint64_t v2 = (void *)hangTracerConnection;
    hangTracerConnection = (uint64_t)mach_service;

    xpc_connection_set_event_handler((xpc_connection_t)hangTracerConnection, &__block_literal_global_128);
    id v3 = (_xpc_connection_s *)hangTracerConnection;
    xpc_connection_resume(v3);
  }
}

id __HTCreateAnalyticsEventForAlwaysOnHang_block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = HTPrefsQueue();
  HTTelemetryCheckForUpdates(v2);

  if (HTGatherHomeVolumeSpaceInfo_onceToken != -1) {
    dispatch_once(&HTGatherHomeVolumeSpaceInfo_onceToken, &__block_literal_global_177);
  }
  if (!HTGatherHomeVolumeSpaceInfo_homeURL) {
    goto LABEL_8;
  }
  memset(&v27, 0, 512);
  if (statfs((const char *)[(id)HTGatherHomeVolumeSpaceInfo_homeURL fileSystemRepresentation], &v27))
  {
    id v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *__error();
      v26[0] = 67109120;
      v26[1] = v4;
      _os_log_impl(&dword_1B3C06000, v3, OS_LOG_TYPE_DEFAULT, "Unable to get volume space info: %{errno}d", (uint8_t *)v26, 8u);
    }

LABEL_8:
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = v27.f_blocks * v27.f_bsize;
  uint64_t v6 = v27.f_bavail * v27.f_bsize;
LABEL_10:
  uint64_t v7 = +[HTPrefs sharedPrefs];
  uint64_t v8 = [v7 numOSCryptexFileExtents];

  id v9 = +[HTPrefs sharedPrefs];
  uint64_t v10 = [v9 haveRootsInstalled];

  double v11 = +[HTPrefs sharedPrefs];
  uint64_t v12 = [v11 haveNonDefaultFeatureFlags];

  __int16 v13 = +[HTPrefs sharedPrefs];
  uint64_t v14 = [v13 haveSerialLoggingEnabled];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v15 setObject:kHTCoreAnalyticsAlwaysOn forKeyedSubscript:kHTCoreAnalyticsMode];
  long long v16 = getStringForSubtype(*(void *)(a1 + 40));
  [v15 setObject:v16 forKeyedSubscript:kHTCoreAnalyticsHangType];

  [v15 setObject:*(void *)(a1 + 32) forKeyedSubscript:kHTCoreAnalyticsHangBundleID];
  __int16 v17 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v15 setObject:v17 forKeyedSubscript:kHTCoreAnalyticsHangDuration];

  if (v5)
  {
    uint64_t v18 = [NSNumber numberWithDouble:(double)v6 * 100.0 / (double)v5];
    [v15 setObject:v18 forKeyedSubscript:kHTCoreAnalyticsDiskAvailablePercent];

    __int16 v19 = [NSNumber numberWithUnsignedLongLong:v6];
    [v15 setObject:v19 forKeyedSubscript:kHTCoreAnalyticsDiskAvailableBytes];
  }
  if ((int)v8 >= 1)
  {
    uint32_t v20 = [NSNumber numberWithInt:v8];
    [v15 setObject:v20 forKeyedSubscript:kHTCoreAnalyticsNumOSCryptexFileExtents];
  }
  __int16 v21 = [NSNumber numberWithBool:v12];
  [v15 setObject:v21 forKeyedSubscript:kHTCoreAnalyticsHaveNonDefaultFeatureFlags];

  v22 = [NSNumber numberWithBool:v14];
  [v15 setObject:v22 forKeyedSubscript:kHTCoreAnalyticsHaveSerialLoggingEnabled];

  uint64_t v23 = [NSNumber numberWithBool:v10];
  [v15 setObject:v23 forKeyedSubscript:kHTCoreAnalyticsHaveRootsInstalled];

  double v24 = shared_ht_log_handle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v27.f_bsize = 138412290;
    *(void *)&v27.f_iosize = v15;
    _os_log_impl(&dword_1B3C06000, v24, OS_LOG_TYPE_INFO, "Logging always-on telemetry: %@", (uint8_t *)&v27, 0xCu);
  }

  return v15;
}

void HTHangEventAddUserActionCaptureCallback(uint64_t a1, uint64_t a2)
{
  if (!a1 || !a2)
  {
    uint64_t v5 = shared_ht_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      uint64_t v7 = "User action capture callback not set";
      uint64_t v8 = (uint8_t *)&v11;
LABEL_11:
      _os_log_impl(&dword_1B3C06000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
LABEL_12:

    return;
  }
  int v4 = *(unsigned __int8 *)(a1 + 30);
  uint64_t v5 = shared_ht_log_handle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Skip setting user action callback for 3rd party apps";
      uint64_t v8 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v6)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1B3C06000, v5, OS_LOG_TYPE_DEFAULT, "User action capture callback set", v9, 2u);
  }

  *(void *)(a1 + 376) = a2;
}

void __connectToHTMonitorProcess_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1B3EC2CE0]();
  uint64_t v4 = MEMORY[0x1B3EC2D70](v2);

  if (v4 != MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = shared_ht_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1B3C06000, v5, OS_LOG_TYPE_DEFAULT, "HangTraceMonitor:Received unhandled event from daemon: %s", (uint8_t *)&v6, 0xCu);
    }
  }
  free(v3);
}

void __handleSettingChange_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E6071998;
    long long v6 = *(_OWORD *)off_1E60719A8;
    v4[0] = xpc_int64_create(1);
    v4[1] = xpc_string_create((const char *)(*(void *)(a1 + 32) + 52));
    _DWORD v4[2] = xpc_string_create((const char *)(*(void *)(a1 + 32) + 116));
    v4[3] = xpc_shmem_create(*(void **)(a1 + 40), 0x1028uLL);
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 3; i != -1; --i)
  }
}

void __HTConnectToHTMonitor_block_invoke_23(uint64_t a1)
{
  xpc_object_t v2 = shared_ht_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B3C06000, v2, OS_LOG_TYPE_INFO, "HTConnectToHTMonitor: htMonitor message is sent", v3, 2u);
  }

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

void __connectToHangTracer_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1B3EC2CE0]();
  uint64_t v4 = MEMORY[0x1B3EC2D70](v2);

  if (v4 != MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = shared_ht_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = (uint64_t)v3;
      _os_log_impl(&dword_1B3C06000, v5, OS_LOG_TYPE_DEFAULT, "Received unhandled event from daemon: %s", (uint8_t *)&v7, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (hangTracerConnection)
  {
    long long v6 = shared_ht_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218242;
      uint64_t v8 = hangTracerConnection;
      __int16 v9 = 2080;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1B3C06000, v6, OS_LOG_TYPE_DEFAULT, "XPC Error when we still had a connection (%p): %s", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v5 = hangTracerConnection;
    hangTracerConnection = 0;
    goto LABEL_8;
  }
LABEL_9:
  free(v3);
}

void __StartMonitoringWatchdogDisablement_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = [a4 state];
  uint64_t v5 = [v4 tags];
  int v6 = [v5 containsObject:@"FBDisableWatchdog"];

  os_unfair_lock_lock((os_unfair_lock_t)&gHTWatchdogLock);
  if (!gHTWatchdogMonitor)
  {
    __int16 v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __StartMonitoringWatchdogDisablement_block_invoke_cold_1();
    }
    goto LABEL_17;
  }
  uint64_t v7 = gHTWatchdogDisabledAssertion;
  uint64_t v8 = shared_ht_log_handle();
  __int16 v9 = v8;
  if (v6)
  {
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __StartMonitoringWatchdogDisablement_block_invoke_cold_2();
      }
LABEL_17:

      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_INFO, "Watchdog monitoring: watchdog disabled, beginning assertion", buf, 2u);
    }

    uint64_t v12 = kHTWatchdogDisabledAssertionName;
    uint64_t v13 = mach_absolute_time();
    gHTWatchdogDisabledAssertion = _HTBeginNonResponsiveAssertionAtStartTime(v12, v13, 0, 1, 0.0);
  }
  else
  {
    if (!v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __StartMonitoringWatchdogDisablement_block_invoke_cold_3();
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_INFO, "Watchdog monitoring: watchdog enabled, ending assertion", v14, 2u);
    }

    os_signpost_id_t v10 = gHTWatchdogDisabledAssertion;
    uint64_t v11 = mach_absolute_time();
    HTEndNonResponsiveTaskAtTime(v10, v11);
    gHTWatchdogDisabledAssertion = 0;
  }
LABEL_18:
  os_unfair_lock_unlock((os_unfair_lock_t)&gHTWatchdogLock);
}

void __HTConnectToHTMonitor_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)keys = xmmword_1E6072328;
  long long v13 = *(_OWORD *)off_1E6072338;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_string_create((const char *)(*(void *)(a1 + 32) + 52));
  values[2] = xpc_string_create((const char *)(*(void *)(a1 + 32) + 116));
  values[3] = xpc_shmem_create(*(void **)(a1 + 40), 0x1028uLL);
  xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  id v3 = dispatch_get_global_queue(0, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangtracermonitor", v3, 0);

  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_35);
    xpc_connection_resume(mach_service);
  }
  uint64_t v5 = shared_ht_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v10 = mach_service;
    _os_log_impl(&dword_1B3C06000, v5, OS_LOG_TYPE_INFO, "HTConnectToHTMonitor: htMonitor Connection %@", buf, 0xCu);
  }

  if (mach_service)
  {
    xpc_connection_send_message(mach_service, v2);
    barrier[0] = MEMORY[0x1E4F143A8];
    barrier[1] = 3221225472;
    barrier[2] = __HTConnectToHTMonitor_block_invoke_23;
    barrier[3] = &unk_1E60718C0;
    uint64_t v8 = mach_service;
    xpc_connection_send_barrier(v8, barrier);
  }
  for (uint64_t i = 3; i != -1; --i)
}

void __HTInitializeHangTracerMonitor_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1B3EC2D70]();
  if (v4 == MEMORY[0x1E4F14578])
  {
    int v6 = (_xpc_connection_s *)v3;
    pid_t pid = xpc_connection_get_pid(v6);
    xpc_connection_set_target_queue(v6, *(dispatch_queue_t *)(a1 + 32));
    uint64_t v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = pid;
      _os_log_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor:New XPC connection from Application for pid: %d listening ", buf, 8u);
    }

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __HTInitializeHangTracerMonitor_block_invoke_28;
    handler[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    pid_t v17 = pid;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(v6);
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14470], pid, 0xA0000000uLL, *(dispatch_queue_t *)(a1 + 32));
    dispatch_source_t v10 = v9;
    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __HTInitializeHangTracerMonitor_block_invoke_33;
      v13[3] = &unk_1E6072370;
      pid_t v15 = pid;
      uint64_t v11 = v9;
      uint64_t v14 = v11;
      dispatch_source_set_event_handler(v11, v13);
      dispatch_resume(v11);
      uint64_t v12 = v14;
    }
    else
    {
      uint64_t v12 = shared_ht_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = pid;
        _os_log_impl(&dword_1B3C06000, v12, OS_LOG_TYPE_DEFAULT, "HangTracerMonitor:Unable to setup up dispatch source to monitor PROC_EXIT for new proc %u", buf, 8u);
      }
    }
  }
  else
  {
    uint64_t v5 = v4;
    shared_ht_log_handle();
    int v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v5;
      _os_log_impl(&dword_1B3C06000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "HTInitializeHangTracerMonitor : xpc_get_type is not connection @%@ ", buf, 0xCu);
    }
  }
}

void __HTInitializeHangTracerMonitor_block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1B3EC2D70]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = shared_ht_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_1B3C06000, v5, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor: XPC_TYPE_ERR for appConnection", (uint8_t *)v25, 2u);
    }
    goto LABEL_24;
  }
  if (MEMORY[0x1B3EC2D70](v3) == MEMORY[0x1E4F14590] && xpc_dictionary_get_int64(v3, "command") == 1)
  {
    uint64_t v4 = xpc_dictionary_get_value(v3, "shmem");
    uint64_t v5 = v4;
    if (v4)
    {
      v25[0] = 0;
      size_t v6 = xpc_shmem_map(v4, v25);
      uint64_t v7 = v25[0];
      uint64_t v8 = (void *)pidHangEventDict;
      unsigned int v10 = *(_DWORD *)(a1 + 32);
      dispatch_source_t v9 = (unsigned int *)(a1 + 32);
      uint64_t v11 = [NSNumber numberWithInt:v10];
      if (v7 && v6)
      {
        uint64_t v12 = [v8 objectForKeyedSubscript:v11];

        if (v12)
        {
          long long v13 = shared_ht_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            __HTInitializeHangTracerMonitor_block_invoke_28_cold_1((int *)v9, v13);
          }

          uint64_t v14 = (void *)pidHangEventDict;
          pid_t v15 = [NSNumber numberWithInt:*v9];
          [v14 removeObjectForKey:v15];
        }
        long long v16 = [HTMonitorPidHangEvent alloc];
        pid_t v17 = [(HTMonitorPidHangEvent *)v16 initHTMonitorPidHangEvent:v25[0] shmem_size:v6];
        uint64_t v18 = (void *)pidHangEventDict;
        if (!pidHangEventDict)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v20 = (void *)pidHangEventDict;
          pidHangEventDict = (uint64_t)v19;

          uint64_t v18 = (void *)pidHangEventDict;
        }
        __int16 v21 = [NSNumber numberWithInt:*v9];
        [v18 setObject:v17 forKeyedSubscript:v21];

        v22 = shared_ht_log_handle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v23 = *v9;
          *(_DWORD *)buf = 67109120;
          int v27 = v23;
          _os_log_impl(&dword_1B3C06000, v22, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor: Monitoring pid @%d", buf, 8u);
        }
      }
      else
      {
        [v8 removeObjectForKey:v11];

        pid_t v17 = shared_ht_log_handle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3C06000, v17, OS_LOG_TYPE_DEFAULT, "HTInitializeHangTracerMonitor: Something wrong with shmem", buf, 2u);
        }
      }
    }
    else
    {
      double v24 = shared_ht_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_impl(&dword_1B3C06000, v24, OS_LOG_TYPE_DEFAULT, "HTInitializeHangTracerMonitor:shmemObj is NULL ", (uint8_t *)v25, 2u);
      }
    }
LABEL_24:
  }
}

void HTSuspendHangTracing(uint64_t a1)
{
  if (a1)
  {
    xpc_object_t v2 = *(_opaque_pthread_t **)(a1 + 32);
    if ((v2 == -1 || v2 == pthread_self()) && !atomic_fetch_add((atomic_uint *volatile)(a1 + 24), 1u))
    {
      checkForHang(a1);
    }
  }
}

uint64_t HTResumeHangTracing(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 32);
    if (v2 == -1 || (result = (uint64_t)pthread_self(), v2 == result))
    {
      result = mach_absolute_time();
      *(void *)uint64_t v1 = result;
      *(unsigned char *)(v1 + 372) = 0;
      int add = atomic_fetch_add((atomic_uint *volatile)(v1 + 24), 0xFFFFFFFF);
      if (add <= 0)
      {
        uint64_t v4 = shared_ht_log_handle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
          HTResumeHangTracing_cold_1(add, v4);
        }

        return HTAggdAddValueForScalarKey();
      }
    }
  }
  return result;
}

uint64_t HTUpdateHangTracing(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 32);
    if (v2 == -1 || (result = (uint64_t)pthread_self(), v2 == result))
    {
      if (!atomic_load((unsigned int *)(v1 + 24)))
      {
        checkForHang(v1);
        result = mach_absolute_time();
        *(void *)uint64_t v1 = result;
        *(unsigned char *)(v1 + 372) = 0;
      }
    }
  }
  return result;
}

void checkForHangWithUserMovedAwayAndRecentAssertions(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 372))
  {
    uint64_t v6 = mach_absolute_time();
    os_signpost_id_t v7 = *(void *)a1;
    double v8 = MATU_TO_MS((unint64_t)((double)v6 - (double)*(unint64_t *)a1));
    if (v8 > 100.0) {
      kdebug_trace();
    }
    if (*(unsigned char *)(a1 + 29)) {
      BOOL v9 = v8 > (double)*(unint64_t *)(a1 + 8);
    }
    else {
      BOOL v9 = 0;
    }
    if (v8 < 250.0 && !v9)
    {
      if (!a2) {
        return;
      }
      uint64_t v12 = shared_ht_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = v16;
        _os_log_impl(&dword_1B3C06000, v12, OS_LOG_TYPE_INFO, "checkForHang:Hang is not detected for pid @%u during user switched away from App", buf, 8u);
      }
      goto LABEL_68;
    }
    unint64_t v11 = 1;
    if (a2)
    {
      *(unsigned char *)(a1 + 372) = 1;
      unint64_t v11 = 10;
    }
    uint64_t v12 = [NSString stringWithUTF8String:a1 + 116];
    if (isAppBeingDebugged(*(_DWORD *)(a1 + 48)))
    {
      long long v13 = shared_ht_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl(&dword_1B3C06000, v13, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (debugger attached, not reporting)", buf, 0xCu);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.ht_debugger_attached.%s.%s", a1 + 52, a1 + 116);
      HTAggdPushValueForDistributionKey();
      HTCreateAnalyticsEventForAlwaysOnHang(6, v12, v8);
      uint64_t v14 = alwaysOnSignpost();
      signpostHangInterval(@"Debugger Attached Runloop Hang", v12, v7, v6, v14);

      if (!*(unsigned char *)(a1 + 29)) {
        goto LABEL_68;
      }
      uint64_t v47 = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      v49 = __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke;
      v50 = &unk_1E6071A68;
      uint64_t v52 = 6;
      v51 = v12;
      double v53 = v8;
      AnalyticsSendEventLazy();
      pid_t v15 = v51;
LABEL_67:

LABEL_68:
      return;
    }
    if ((a2 & 1) == 0 && alm_app_measurement_ongoing())
    {
      pid_t v17 = shared_ht_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl(&dword_1B3C06000, v17, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (overlaps extended launch)", buf, 0xCu);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.ht_extended_launch_overlap.%s.%s", a1 + 52, a1 + 116);
      HTAggdPushValueForDistributionKey();
      unint64_t v11 = 7;
    }
    if (a3 && checkForAssertionOverlap(v7, v6, a3, 1))
    {
      uint64_t v18 = shared_ht_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl(&dword_1B3C06000, v18, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (overlaps with non-responsive assertion)", buf, 0xCu);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.ht_assertion_overlap.%s.%s", a1 + 52, a1 + 116);
      HTAggdPushValueForDistributionKey();
      unint64_t v11 = 9;
      HTCreateAnalyticsEventForAlwaysOnHang(9, v12, v8);
    }
    else
    {
      id v19 = shared_ht_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl(&dword_1B3C06000, v19, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (always-on hang reporting)", buf, 0xCu);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.ht_always_on.%s.%s", a1 + 52, a1 + 116);
      HTAggdPushValueForDistributionKey();
      HTCreateAnalyticsEventForAlwaysOnHang(v11, v12, v8);
      uint64_t v20 = getStringForSubtype(v11);
      __int16 v21 = [NSString stringWithUTF8String:a1 + 116];
      v22 = alwaysOnSignpost();
      signpostHangInterval(v20, v21, v7, v6, v22);

      if (v8 < 250.0)
      {
        int v23 = shared_ht_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          checkForHangWithUserMovedAwayAndRecentAssertions_cold_1(v23, v8);
        }
      }
    }
    if (!*(unsigned char *)(a1 + 29)) {
      goto LABEL_68;
    }
    BOOL v24 = v9;
    if (v8 < 250.0) {
      BOOL v24 = 1;
    }
    if (v24 || !*(unsigned char *)(a1 + 30))
    {
      BOOL v27 = 0;
    }
    else
    {
      double v25 = (double)arc4random_uniform(0xFFFFFFFF) * 100.0 / 4294967300.0;
      double v26 = *(double *)(a1 + 16);
      BOOL v27 = v25 < v26;
      uint64_t v28 = shared_ht_log_handle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        double v41 = *(__CFString **)(a1 + 16);
        if (v25 >= v26) {
          v29 = @"(diceRoll over threshold)";
        }
        else {
          v29 = @"(diceRoll under threshold)";
        }
        unint64_t v30 = [NSNumber numberWithBool:v25 < v26];
        *(_DWORD *)buf = 134218754;
        double v55 = v25;
        __int16 v56 = 2048;
        v57 = v41;
        __int16 v58 = 2112;
        v59 = v30;
        __int16 v60 = 2112;
        v61 = v29;
        _os_log_impl(&dword_1B3C06000, v28, OS_LOG_TYPE_INFO, "Micro Hang Sampling: random sampling diceRoll=%.2f samplingPercent=%.2f%% -> shouldCapture=%@ %@", buf, 0x2Au);

        BOOL v27 = v25 < v26;
      }
    }
    if (v8 < 250.0) {
      goto LABEL_68;
    }
    v31 = shared_ht_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = @"(over capture threshold)";
      if (!v9) {
        uint64_t v32 = @"(not over capture threshold)";
      }
      *(_DWORD *)buf = 134218498;
      double v55 = v8 / 1000.0;
      __int16 v56 = 2112;
      v57 = v32;
      if (!v9 && v27) {
        unint64_t v33 = @", (capture microhang)";
      }
      else {
        unint64_t v33 = &stru_1F0C6A9F0;
      }
      __int16 v58 = 2112;
      v59 = v33;
      _os_log_impl(&dword_1B3C06000, v31, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs %@ %@", buf, 0x20u);
    }

    BOOL v43 = v27;
    if (a2)
    {
      CFDataRef v42 = 0;
      uint64_t v34 = 13;
    }
    else
    {
      CFDataRef Data = (const __CFData *)hangEventCaptureUserActionCreateData(a1);
      if (Data)
      {
        CFDataRef v36 = Data;
        if (CFDataGetLength(Data) <= 0x20000)
        {
          uint64_t v34 = 3;
          CFDataRef v42 = v36;
          goto LABEL_66;
        }
        double v37 = shared_ht_log_handle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          double v38 = COERCE_DOUBLE(CFDataGetLength(v36));
          *(_DWORD *)buf = 134217984;
          double v55 = v38;
          _os_log_impl(&dword_1B3C06000, v37, OS_LOG_TYPE_DEFAULT, "User action data size %ld exceeding limit", buf, 0xCu);
        }

        CFRelease(v36);
      }
      CFDataRef v42 = 0;
      uint64_t v34 = 3;
    }
LABEL_66:
    uint64_t v39 = *(void *)(a1 + 40);
    char v40 = *(unsigned char *)(a1 + 28);
    pid_t v15 = HTConnectionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke_162;
    block[3] = &__block_descriptor_98_e5_v8__0l;
    void block[4] = v34;
    block[5] = a1 + 52;
    block[6] = v39;
    block[7] = v7;
    char v45 = v40;
    block[8] = v6;
    block[9] = v11;
    BOOL v46 = v43;
    block[10] = a1;
    block[11] = v42;
    dispatch_async(v15, block);
    goto LABEL_67;
  }
}

double MATU_TO_MS(unint64_t a1)
{
  if (timebaseConversionFactor_onceToken != -1) {
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  }
  return *(double *)&timebaseConversionFactor_timebaseConversion * (double)a1;
}

void checkForHang(uint64_t a1)
{
  if (GetSharedPage_onceToken != -1) {
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_83);
  }
  if (GetSharedPage__sharedPage) {
    uint64_t v2 = GetSharedPage__sharedPage + 3080;
  }
  else {
    uint64_t v2 = 0;
  }
  checkForHangWithUserMovedAwayAndRecentAssertions(a1, 0, v2);
}

id shared_ht_log_handle()
{
  if (shared_ht_log_handle_onceToken != -1) {
    dispatch_once(&shared_ht_log_handle_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)shared_ht_log_handle___ht_log_handle;
  return v0;
}

uint64_t HTAggdPushValueForDistributionKey()
{
  return MEMORY[0x1F4107208]();
}

uint64_t HTAppActivationEvent()
{
  return 0;
}

uint64_t HTAppActivationGenerateAppIdentifier()
{
  return 0;
}

uint64_t HTHangEventCreate(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  uint64_t v4 = HTHangEventCreateWithBundleID(a1, v3);
  return v4;
}

uint64_t HTHangEventCreateWithBundleID(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&frameworkLock);
  if (GetSharedPage_onceToken != -1) {
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_83);
  }
  uint64_t v4 = GetSharedPage__sharedPage;
  if (GetSharedPage__sharedPage && (unsigned int v5 = *(_DWORD *)(GetSharedPage__sharedPage + 4), v5 != 8))
  {
    *(_DWORD *)(GetSharedPage__sharedPage + 4) = v5 + 1;
    uint64_t v7 = v4 + 384 * v5;
    atomic_store(0, (unsigned int *)(v7 + 32));
    *(void *)(v7 + 8) = mach_absolute_time();
    uint64_t v6 = v7 + 8;
    *(unsigned char *)(v7 + 380) = 0;
    pthread_t v8 = pthread_self();
    *(void *)(v7 + 48) = 0;
    v7 += 48;
    *(void *)(v7 - 8) = v8;
    *(_DWORD *)(v7 + 8) = getpid();
    *(_WORD *)(v7 - 12) = 0;
    *(void *)(v7 - 32) = -1;
    *(void *)(v7 - 24) = 0;
    *(void *)(v7 + 336) = 0;
    BOOL v9 = pthread_self();
    pthread_threadid_np(v9, (__uint64_t *)v7);
    if (a1)
    {
      __strlcpy_chk();
    }
    else
    {
      unsigned int v10 = shared_ht_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "ServiceName == NULL", buf, 2u);
      }
    }
    id v11 = v3;
    if ([v11 cStringUsingEncoding:1])
    {
      __strlcpy_chk();
    }
    else
    {
      uint64_t v12 = shared_ht_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3C06000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get bundle id", buf, 2u);
      }
    }
    uint64_t v13 = [v11 rangeOfString:@"com.apple." options:1];
    if (v14) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    char v16 = v15;
    *(unsigned char *)(v4 + 384 * v5 + 38) = v16;
    os_unfair_lock_lock((os_unfair_lock_t)&gHTWatchdogLock);
    uint64_t v17 = gHTWatchdogMonitor;
    uint64_t v18 = shared_ht_log_handle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v19) {
        HTHangEventCreateWithBundleID_cold_2();
      }
    }
    else
    {
      if (v19) {
        HTHangEventCreateWithBundleID_cold_1();
      }

      uint64_t v20 = (void *)MEMORY[0x1E4F96430];
      __int16 v21 = [MEMORY[0x1E4F963F8] identifierForCurrentProcess];
      v22 = [v20 predicateMatchingIdentifier:v21];

      int v23 = [MEMORY[0x1E4F96448] descriptor];
      [v23 setValues:2];
      BOOL v24 = (void *)MEMORY[0x1E4F96418];
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      double v38 = __StartMonitoringWatchdogDisablement_block_invoke_117;
      uint64_t v39 = &unk_1E6071A20;
      id v40 = v22;
      id v41 = v23;
      id v42 = &__block_literal_global_111;
      uint64_t v18 = v22;
      id v25 = v23;
      uint64_t v26 = [v24 monitorWithConfiguration:buf];
      BOOL v27 = (void *)gHTWatchdogMonitor;
      gHTWatchdogMonitor = v26;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&gHTWatchdogLock);
    if ([v11 isEqualToString:@"com.apple.springboard"])
    {
      *(_DWORD *)buf = 0;
      uint64_t v28 = dispatch_queue_create("com.apple.hangtracer.display.notification", 0);
      notify_register_dispatch("com.apple.iokit.hid.displayStatus", (int *)buf, v28, &__block_literal_global_32);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&frameworkLock);
    v29 = HTPrefsQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __HTHangEventCreateWithBundleID_block_invoke_33;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = v6;
    dispatch_async(v29, block);

    unint64_t v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v31 = [MEMORY[0x1E4F28F08] mainQueue];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __HTHangEventCreateWithBundleID_block_invoke_2;
    v34[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
    uint8_t v34[4] = v6;
    id v32 = (id)[v30 addObserverForName:@"com.apple.hangtracer.daemonstate" object:0 queue:v31 usingBlock:v34];

    HTConnectToHTMonitor(v6, v4);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&frameworkLock);
    uint64_t v6 = 0;
  }

  return v6;
}

void __HTHangEventCreateWithBundleID_block_invoke_33(uint64_t a1)
{
  uint64_t v2 = +[HTPrefs sharedPrefs];
  id v3 = HTPrefsQueue();
  [v2 setupPrefsWithQueue:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  handleSettingChange(v4);
}

id HTPrefsQueue()
{
  if (HTPrefsQueue_onceToken != -1) {
    dispatch_once(&HTPrefsQueue_onceToken, &__block_literal_global_85);
  }
  uint64_t v0 = (void *)HTPrefsQueue__htPrefsQueue;
  return v0;
}

void HTConnectToHTMonitor(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __HTConnectToHTMonitor_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = a1;
  v2[5] = a2;
  if (HTConnectToHTMonitor_onceToken != -1) {
    dispatch_once(&HTConnectToHTMonitor_onceToken, v2);
  }
}

void sub_1B3C0B070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  objc_destroyWeak((id *)(v34 - 104));
  _Unwind_Resume(a1);
}

double timebaseConversionFactor()
{
  if (timebaseConversionFactor_onceToken != -1) {
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  }
  return *(double *)&timebaseConversionFactor_timebaseConversion;
}

void handleSettingChange(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 29);
  id v3 = +[HTPrefs sharedPrefs];
  int v4 = [v3 hangtracerDaemonEnabled];

  if (!v4)
  {
    *(unsigned char *)(a1 + 28) = 0;
    *(void *)(a1 + 8) = -1;
    *(void *)(a1 + 16) = 0;
    if (v2)
    {
      pthread_t v8 = HTConnectionQueue();
      BOOL v9 = v8;
      unsigned int v10 = &__block_literal_global_92;
LABEL_12:
      dispatch_async(v8, v10);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!*(unsigned char *)(a1 + 30))
  {
    id v11 = +[HTPrefs sharedPrefs];
    *(unsigned char *)(a1 + 28) = [v11 thirdPartyRunLoopHangLogsEnabled];

    uint64_t v12 = +[HTPrefs sharedPrefs];
    *(void *)(a1 + 8) = [v12 runloopHangThirdPartyDurationThresholdMSec];

    *(void *)(a1 + 16) = 0;
    if (!v2) {
      goto LABEL_8;
    }
LABEL_13:
    *(unsigned char *)(a1 + 29) = v4;
    return;
  }
  *(unsigned char *)(a1 + 28) = 1;
  unsigned int v5 = +[HTPrefs sharedPrefs];
  *(void *)(a1 + 8) = [v5 runloopHangDurationThresholdMSec];

  uint64_t v6 = +[HTPrefs sharedPrefs];
  [v6 samplingPercentForMicroHangs];
  *(void *)(a1 + 16) = v7;

  if (v2) {
    goto LABEL_13;
  }
LABEL_8:
  connectToHangTracer();
  if (GetSharedPage_onceToken != -1) {
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_83);
  }
  uint64_t v13 = GetSharedPage__sharedPage;
  if (GetSharedPage__sharedPage)
  {
    pthread_t v8 = HTConnectionQueue();
    BOOL v9 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __handleSettingChange_block_invoke;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = a1;
    v14[5] = v13;
    unsigned int v10 = v14;
    goto LABEL_12;
  }
}

id HTConnectionQueue()
{
  if (HTConnectionQueue_onceToken != -1) {
    dispatch_once(&HTConnectionQueue_onceToken, &__block_literal_global_130);
  }
  uint64_t v0 = (void *)HTConnectionQueue__htConnectionQueue;
  return v0;
}

uint64_t ht_fence_start(uint64_t a1)
{
  if (setupPrefs_onceToken != -1) {
    dispatch_once(&setupPrefs_onceToken, &__block_literal_global_121);
  }
  int v2 = +[HTPrefs sharedPrefs];
  char v3 = [v2 hangtracerDaemonEnabled];

  if ((v3 & 1) == 0)
  {
    unsigned int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      ht_fence_start_cold_4();
    }
    goto LABEL_14;
  }
  int v4 = +[HTPrefs sharedPrefs];
  char v5 = [v4 fenceTrackingEnabled];

  if ((v5 & 1) == 0)
  {
    unsigned int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      ht_fence_start_cold_3();
    }
    goto LABEL_14;
  }
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = (char *)__recentCAFences;
  if (!__recentCAFences)
  {
    uint64_t v7 = (char *)malloc_type_malloc(0x190uLL, 0x1000040451B5BE8uLL);
    __recentCAFences = (uint64_t)v7;
    if (!v7)
    {
      unsigned int v10 = shared_ht_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        ht_fence_start_cold_1();
      }
LABEL_14:
      uint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v8 = __nextFenceIndex;
  __nextFenceIndex = (__nextFenceIndex + 1) % 25;
  BOOL v9 = &v7[16 * v8];
  *(void *)BOOL v9 = a1;
  *((void *)v9 + 1) = v6;
  unsigned int v10 = shared_ht_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    ht_fence_start_cold_2();
  }
  uint64_t v11 = 1;
LABEL_15:

  return v11;
}

void connectToHangTracer()
{
  uint64_t v0 = HTConnectionQueue();
  dispatch_async(v0, &__block_literal_global_124);
}

uint64_t __shared_ht_log_handle_block_invoke()
{
  shared_ht_log_handle___ht_log_handle = (uint64_t)os_log_create("com.apple.hangtracer", "");
  return MEMORY[0x1F41817F8]();
}

double __timebaseConversionFactor_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  double result = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
  *(double *)&timebaseConversionFactor_timebaseConversion = result;
  return result;
}

void __GetSharedPage_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = mmap(0, 0x1028uLL, 3, 4097, -1, 0);
  GetSharedPage__sharedPage = (uint64_t)v0;
  if (v0 == (void *)-1)
  {
    GetSharedPage__sharedPage = 0;
    uint64_t v1 = shared_ht_log_handle();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = *__error();
      v3[0] = 67109120;
      v3[1] = v2;
      _os_log_impl(&dword_1B3C06000, v1, OS_LOG_TYPE_DEFAULT, "Unable to create shared page: %{errno}d", (uint8_t *)v3, 8u);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v0 = 7;
    v0[516] = 1;
    *((_DWORD *)v0 + 1030) = 0;
  }
}

id alwaysOnSignpost()
{
  if (alwaysOnSignpost_onceToken != -1) {
    dispatch_once(&alwaysOnSignpost_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)alwaysOnSignpost_signpostLog;
  return v0;
}

void __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke_162(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    long long v12 = xmmword_1E6071AA8;
    long long v13 = *(_OWORD *)off_1E6071AB8;
    uint64_t v14 = "saveMicroHang";
    *(_OWORD *)keys = xmmword_1E6071A88;
    long long v11 = *(_OWORD *)&off_1E6071A98;
    values[0] = xpc_int64_create(*(void *)(a1 + 32));
    values[1] = xpc_string_create(*(const char **)(a1 + 40));
    values[2] = xpc_int64_create(*(void *)(a1 + 48));
    values[3] = xpc_int64_create(*(void *)(a1 + 56));
    xpc_object_t values[4] = xpc_int64_create(*(void *)(a1 + 64));
    values[5] = xpc_BOOL_create(*(unsigned char *)(a1 + 96) != 0);
    values[6] = xpc_int64_create(*(void *)(a1 + 72));
    values[7] = xpc_int64_create(*(int *)(*(void *)(a1 + 80) + 48));
    values[8] = xpc_BOOL_create(*(unsigned char *)(a1 + 97));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 9uLL);
    CFDataRef v3 = *(const __CFData **)(a1 + 88);
    if (v3)
    {
      BytePtr = CFDataGetBytePtr(v3);
      size_t Length = CFDataGetLength(*(CFDataRef *)(a1 + 88));
      xpc_object_t v6 = xpc_data_create(BytePtr, Length);
      xpc_dictionary_set_value(v2, "userActionData", v6);
    }
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 8; i != -1; --i)
  }
  uint64_t v8 = *(const void **)(a1 + 88);
  if (v8) {
    CFRelease(v8);
  }
}

uint64_t __alwaysOnSignpost_block_invoke()
{
  alwaysOnSignpost_signpostLog = (uint64_t)os_log_create("com.apple.hangtracer", "always_on_hang");
  return MEMORY[0x1F41817F8]();
}

id HTCAQueue()
{
  if (HTCAQueue_onceToken != -1) {
    dispatch_once(&HTCAQueue_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)HTCAQueue_caQueue;
  return v0;
}

__CFString *exitNamespaceString(unsigned int a1)
{
  if (a1 >= 0x2A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6070F78[(char)a1];
  }
  return v1;
}

__CFString *exitNamespaceDisplayString(unsigned int a1)
{
  char v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    CFDataRef v3 = off_1E60710C8[v1];
  }
  else
  {
    xpc_object_t v2 = exitNamespaceString(a1);
    CFDataRef v3 = [v2 capitalizedString];
  }
  return v3;
}

__CFString *exitReasonStringForNamespaceSignal(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SIG%d", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E60711F8[(int)a1 - 1];
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceJetsam(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E60712F0[(int)a1];
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceJetsam(uint64_t a1)
{
  int v1 = a1 - 2;
  if (a1 - 2) < 0xE && ((0x2655u >> v1))
  {
    CFDataRef v3 = off_1E6071370[v1];
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceJetsam(a1);
    CFDataRef v3 = [v2 capitalizedString];
  }
  return v3;
}

__CFString *exitReasonStringForNamespaceSpringBoard(uint64_t a1)
{
  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          xpc_object_t v2 = @"thermal pressure";
          return v2;
        case 3306925313:
          xpc_object_t v2 = @"cpu violation";
          return v2;
        case 3306925314:
          xpc_object_t v2 = @"walltime violation";
          return v2;
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
      {
        xpc_object_t v2 = @"user quit";
        return v2;
      }
      if (a1 == 4227595259)
      {
        xpc_object_t v2 = @"force quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3306925315)
      {
        xpc_object_t v2 = @"system busy";
        return v2;
      }
      if (a1 == 3735883980)
      {
        xpc_object_t v2 = @"resource exclusion";
        return v2;
      }
    }
LABEL_62:
    objc_msgSend(NSString, "stringWithFormat:", @"%#llx", a1);
    xpc_object_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        xpc_object_t v2 = @"application assertion";
        return v2;
      case 439025681:
        xpc_object_t v2 = @"input ui scene";
        return v2;
      case 732775916:
        xpc_object_t v2 = @"secure draw violation";
        return v2;
    }
    goto LABEL_62;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      xpc_object_t v2 = @"legacy clear the board";
      return v2;
    }
    if (a1 == 2343432205)
    {
      xpc_object_t v2 = @"watchdog";
      return v2;
    }
    goto LABEL_62;
  }
  if (a1 != 1539435073)
  {
    if (a1 == 1539435076)
    {
      xpc_object_t v2 = @"clear the board";
      return v2;
    }
    goto LABEL_62;
  }
  xpc_object_t v2 = @"languages changed";
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceSpringBoard(uint64_t a1)
{
  if (a1 > 1539435076)
  {
    if (a1 != 1539435077)
    {
      if (a1 == 3306925313)
      {
        uint64_t v1 = @"CPU Violation";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    uint64_t v1 = @"Legacy Clear the Board";
  }
  else
  {
    if (a1 != 439025681)
    {
      if (a1 == 1539435076)
      {
        uint64_t v1 = @"Clear the Board";
        goto LABEL_11;
      }
LABEL_8:
      xpc_object_t v2 = exitReasonStringForNamespaceSpringBoard(a1);
      uint64_t v1 = [v2 capitalizedString];

      goto LABEL_11;
    }
    uint64_t v1 = @"InputUI Scene";
  }
LABEL_11:
  return v1;
}

__CFString *exitReasonStringForNamespaceCodeSigning(uint64_t a1)
{
  if ((a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60713E0[(int)a1 - 1];
  }
  return v1;
}

id exitReasonDisplayStringForNamespaceCodeSigning(uint64_t a1)
{
  uint64_t v1 = exitReasonStringForNamespaceCodeSigning(a1);
  xpc_object_t v2 = [v1 capitalizedString];

  return v2;
}

__CFString *exitReasonStringForNamespaceExec(uint64_t a1)
{
  if ((a1 - 1) >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6071400[(int)a1 - 1];
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceExec(uint64_t a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 0x13 && ((0x55F7Fu >> v1))
  {
    CFDataRef v3 = off_1E6071498[v1];
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceExec(a1);
    CFDataRef v3 = [v2 capitalizedString];
  }
  return v3;
}

__CFString *exitReasonStringForNamespaceGuard(uint64_t a1)
{
  if ((a1 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E6071530[(int)a1 - 1];
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceGuard(uint64_t a1)
{
  if (a1 == 5)
  {
    int v1 = @"JIT";
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceGuard(a1);
    int v1 = [v2 capitalizedString];
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceLibXPC(uint64_t a1)
{
  if ((a1 - 1) >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E6071558[(int)a1 - 1];
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceLibXPC(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      int v1 = @"Unknown IPC";
      break;
    case 6:
      int v1 = @"Sandbox Filtered IPC";
      break;
    case 4:
      int v1 = @"SIGTERM Timeout";
      break;
    default:
      xpc_object_t v2 = exitReasonStringForNamespaceLibXPC(a1);
      int v1 = [v2 capitalizedString];

      break;
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1))
  {
    xpc_object_t v2 = off_1E60715A0[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    xpc_object_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 7 && ((0x47u >> v1))
  {
    CFDataRef v3 = off_1E60715E8[v1];
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceDYLD(a1);
    CFDataRef v3 = [v2 capitalizedString];
  }
  return v3;
}

__CFString *exitReasonStringForNamespaceRunningBoard(uint64_t a1)
{
  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      switch(a1)
      {
        case 0:
          xpc_object_t v2 = @"none";
          return v2;
        case 97132013:
          xpc_object_t v2 = @"conditions changed";
          return v2;
        case 562215597:
          xpc_object_t v2 = @"assertion timeout";
          return v2;
      }
    }
    else
    {
      if (a1 <= 562215635)
      {
        if (a1 == 562215634)
        {
          xpc_object_t v2 = @"background task assertion timeout";
        }
        else
        {
          xpc_object_t v2 = @"background url session completion timeout";
        }
        return v2;
      }
      if (a1 == 562215636)
      {
        xpc_object_t v2 = @"background fetch completion timeout";
        return v2;
      }
      if (a1 == 732775916)
      {
        xpc_object_t v2 = @"security violation";
        return v2;
      }
    }
LABEL_66:
    objc_msgSend(NSString, "stringWithFormat:", @"%#llx", a1);
    xpc_object_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        xpc_object_t v2 = @"termination assertion";
        return v2;
      }
      if (a1 == 3735943697)
      {
        xpc_object_t v2 = @"user initiated quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3490524077)
      {
        xpc_object_t v2 = @"max assertions violation";
        return v2;
      }
      if (a1 == 3735883980)
      {
        xpc_object_t v2 = @"resource exclusion";
        return v2;
      }
    }
    goto LABEL_66;
  }
  if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      xpc_object_t v2 = @"process exited";
      return v2;
    }
    if (a1 == 3221229823)
    {
      xpc_object_t v2 = @"thermal pressure";
      return v2;
    }
    goto LABEL_66;
  }
  if (a1 != 2343432205)
  {
    if (a1 == 2970405393)
    {
      xpc_object_t v2 = @"max states violation";
      return v2;
    }
    goto LABEL_66;
  }
  xpc_object_t v2 = @"watchdog violation";
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceRunningBoard(uint64_t a1)
{
  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      uint64_t v1 = @"None Provided";
      goto LABEL_13;
    }
    if (a1 == 562215635)
    {
      uint64_t v1 = @"Background URL Session Completion Timeout";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a1)
    {
      case 2970405393:
        uint64_t v1 = @"Maximum States Violation";
        goto LABEL_13;
      case 3490524077:
        uint64_t v1 = @"Maximum Assertions Violation";
        goto LABEL_13;
      case 3735943697:
        uint64_t v1 = @"User-Initiated Quit";
        goto LABEL_13;
    }
  }
  xpc_object_t v2 = exitReasonStringForNamespaceRunningBoard(a1);
  uint64_t v1 = [v2 capitalizedString];

LABEL_13:
  return v1;
}

__CFString *exitReasonStringForNamespaceLibSystem(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6071620[a1 - 1];
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceLibSystem(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1))
  {
    CFDataRef v3 = off_1E6071648[v1];
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceLibSystem(a1);
    CFDataRef v3 = [v2 capitalizedString];
  }
  return v3;
}

__CFString *exitReasonStringForNamespaceEndpointSecurity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6071670[a1 - 1];
  }
  return v1;
}

id exitReasonDisplayStringForNamespaceEndpointSecurity(uint64_t a1)
{
  uint64_t v1 = exitReasonStringForNamespaceEndpointSecurity(a1);
  xpc_object_t v2 = [v1 capitalizedString];

  return v2;
}

__CFString *exitReasonStringForNamespaceWatchdog(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      xpc_object_t v2 = @"service timeout";
      break;
    case 1001:
      xpc_object_t v2 = @"chronokit";
      break;
    case 2:
      xpc_object_t v2 = @"timeout no diags";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
      xpc_object_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceWatchdog(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = @"Service Timeout Diagnostics Unavailable";
  }
  else if (a1 == 1001)
  {
    uint64_t v1 = @"ChronoKit";
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceWatchdog(a1);
    uint64_t v1 = [v2 capitalizedString];
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceWatchKit(uint64_t a1)
{
  if (a1 == 1)
  {
    xpc_object_t v2 = @"api violation";
  }
  else if (a1 == 2)
  {
    xpc_object_t v2 = @"internal error";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    xpc_object_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceWatchKit(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"API Violation";
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceWatchKit(a1);
    uint64_t v1 = [v2 capitalizedString];
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1))
  {
    xpc_object_t v2 = off_1E6071688[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a1);
    xpc_object_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1 = a1 - 11;
  if (unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1))
  {
    CFDataRef v3 = off_1E6071730[v1];
  }
  else
  {
    xpc_object_t v2 = exitReasonStringForNamespaceBacklightServices(a1);
    CFDataRef v3 = [v2 capitalizedString];
  }
  return v3;
}

id exitReasonString(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      xpc_object_t v2 = exitReasonStringForNamespaceJetsam(a2);
      break;
    case 2:
      xpc_object_t v2 = exitReasonStringForNamespaceSignal(a2);
      break;
    case 3:
      xpc_object_t v2 = exitReasonStringForNamespaceCodeSigning(a2);
      break;
    case 6:
      xpc_object_t v2 = exitReasonStringForNamespaceDYLD(a2);
      break;
    case 7:
      xpc_object_t v2 = exitReasonStringForNamespaceLibXPC(a2);
      break;
    case 9:
      xpc_object_t v2 = exitReasonStringForNamespaceExec(a2);
      break;
    case 10:
      xpc_object_t v2 = exitReasonStringForNamespaceSpringBoard(a2);
      break;
    case 15:
      xpc_object_t v2 = exitReasonStringForNamespaceRunningBoard(a2);
      break;
    case 18:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceLibSystem(a2);
      break;
    case 20:
      xpc_object_t v2 = exitReasonStringForNamespaceWatchdog(a2);
      break;
    case 22:
      xpc_object_t v2 = exitReasonStringForNamespaceWatchKit(a2);
      break;
    case 23:
      xpc_object_t v2 = exitReasonStringForNamespaceGuard(a2);
      break;
    case 27:
      xpc_object_t v2 = exitReasonStringForNamespaceEndpointSecurity(a2);
      break;
    case 32:
      xpc_object_t v2 = exitReasonStringForNamespaceBacklightServices(a2);
      break;
    default:
      xpc_object_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a2);
      break;
  }
  return v2;
}

id exitReasonDisplayString(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceJetsam(a2);
      break;
    case 2:
      xpc_object_t v2 = exitReasonStringForNamespaceSignal(a2);
      break;
    case 3:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceCodeSigning(a2);
      break;
    case 6:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceDYLD(a2);
      break;
    case 7:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceLibXPC(a2);
      break;
    case 9:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceExec(a2);
      break;
    case 10:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceSpringBoard(a2);
      break;
    case 15:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceRunningBoard(a2);
      break;
    case 18:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceLibSystem(a2);
      break;
    case 20:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceWatchdog(a2);
      break;
    case 22:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceWatchKit(a2);
      break;
    case 23:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceGuard(a2);
      break;
    case 27:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceEndpointSecurity(a2);
      break;
    case 32:
      xpc_object_t v2 = exitReasonDisplayStringForNamespaceBacklightServices(a2);
      break;
    default:
      xpc_object_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%#llx", a2);
      break;
  }
  return v2;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void __HTHangEventCreateWithBundleID_block_invoke(int a1, int token)
{
  uint64_t state64 = 0;
  if (!notify_get_state(token, &state64))
  {
    uint64_t v2 = state64;
    BOOL v3 = state64 != 0;
    uint64_t v4 = shared_ht_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __HTHangEventCreateWithBundleID_block_invoke_cold_2(v3, v4);
    }

    os_signpost_id_t v5 = kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion;
    if (v2 || kHTAppActivationFailureReasonWatchdog_block_invoke_prevDisplayState != 1)
    {
      if (!v2 || !kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion) {
        goto LABEL_15;
      }
      uint64_t v10 = mach_absolute_time();
      HTEndNonResponsiveTaskAtTime(v5, v10);
      os_signpost_id_t started = 0;
    }
    else
    {
      if (kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion)
      {
        xpc_object_t v6 = shared_ht_log_handle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          __HTHangEventCreateWithBundleID_block_invoke_cold_1();
        }
      }
      uint64_t v7 = kHTScreenOffAssertionName;
      uint64_t v8 = mach_absolute_time();
      os_signpost_id_t started = _HTBeginNonResponsiveAssertionAtStartTime(v7, v8, 1, 1, 0.0);
    }
    kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion = started;
LABEL_15:
    kHTAppActivationFailureReasonWatchdog_block_invoke_prevDisplayState = v3;
  }
}

void HTEndNonResponsiveTask(os_signpost_id_t a1)
{
  uint64_t v2 = mach_absolute_time();
  HTEndNonResponsiveTaskAtTime(a1, v2);
}

void __HTHangEventCreateWithBundleID_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HTPrefsQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __HTHangEventCreateWithBundleID_block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __HTHangEventCreateWithBundleID_block_invoke_3(uint64_t a1)
{
}

uint64_t HTStartHangTracing(uint64_t a1)
{
  return HTHangEventCreate(a1);
}

uint64_t HTAllowAnyThread(uint64_t result)
{
  if (result) {
    *(void *)(result + 32) = -1;
  }
  return result;
}

os_signpost_id_t HTBeginNonResponsiveTaskWithNameAndExpirationAtTime(const char *a1, unint64_t a2, double a3)
{
  return _HTBeginNonResponsiveAssertionAtStartTime(a1, a2, 0, 0, a3);
}

os_signpost_id_t _HTBeginNonResponsiveAssertionAtStartTime(const char *a1, unint64_t a2, int a3, int a4, double a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = shared_ht_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    double v28 = *(double *)&a1;
    __int16 v29 = 2048;
    double v30 = a5;
    __int16 v31 = 1024;
    *(_DWORD *)id v32 = a3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = a4;
    _os_log_debug_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEBUG, "name=%s timeout=%f screenOffAssertion=%{BOOL}i noTimeout=%{BOOL}i", buf, 0x22u);
  }

  if (GetSharedPage_onceToken != -1) {
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_83);
  }
  uint64_t v11 = GetSharedPage__sharedPage;
  if (!GetSharedPage__sharedPage) {
    return 0;
  }
  os_signpost_id_t v12 = *(void *)(GetSharedPage__sharedPage + 4128);
  *(void *)(GetSharedPage__sharedPage + 4128) = v12 + 1;
  double v13 = a5;
  if (a5 > 120.0)
  {
    uint64_t v14 = shared_ht_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v28 = a5;
      __int16 v29 = 2048;
      double v30 = 120.0;
      _os_log_impl(&dword_1B3C06000, v14, OS_LOG_TYPE_DEFAULT, "HTAssertion: desired timeout (%f) is greater than max allowed timeout (%f), using max allowed timeout", buf, 0x16u);
    }

    double v13 = 120.0;
  }
  int v15 = *(_DWORD *)(v11 + 4120);
  *(_DWORD *)(v11 + 4120) = (v15 + 1) % 10;
  uint64_t v16 = v11 + 104 * v15;
  uint64_t v17 = (os_signpost_id_t *)(v16 + 3080);
  *(void *)(v16 + 3080) = 0;
  *(void *)(v16 + 3088) = a2;
  unint64_t v18 = -1;
  *(void *)(v16 + 3104) = -1;
  *(unsigned char *)(v16 + 3176) = a3;
  if ((a4 & 1) == 0) {
    unint64_t v18 = (unint64_t)(SEC_TO_MATU(v13) + (double)a2);
  }
  uint64_t v19 = v11 + 104 * v15;
  *(void *)(v19 + 3096) = v18;
  strncpy((char *)(v19 + 3112), a1, 0x3FuLL);
  *(unsigned char *)(v19 + 3175) = 0;
  os_signpost_id_t *v17 = v12;
  uint64_t v20 = shared_ht_log_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(v19 + 3096);
    *(_DWORD *)buf = 134218754;
    double v28 = *(double *)&v12;
    __int16 v29 = 2080;
    *(void *)&double v30 = v19 + 3112;
    __int16 v31 = 2048;
    *(void *)id v32 = a2;
    *(_WORD *)&v32[8] = 2048;
    uint64_t v33 = v21;
    _os_log_impl(&dword_1B3C06000, v20, OS_LOG_TYPE_DEFAULT, "HTAssertion: HTBeginAssertion: track assertionId=%llu assertionname=(%s) starttime=%llu expirationTime=%llu", buf, 0x2Au);
  }

  v22 = assertionSignpost();
  BOOL v23 = os_signpost_enabled(v22);

  if (v23)
  {
    BOOL v24 = assertionSignpost();
    id v25 = v24;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&double v28 = v19 + 3112;
      __int16 v29 = 2050;
      double v30 = v13;
      _os_signpost_emit_with_name_impl(&dword_1B3C06000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v12, "HTNonResponsiveTaskAssertion", "name=%{public, signpost.description:attribute}s appliedTimeoutSecs=%{public, signpost.telemetry:number1}f", buf, 0x16u);
    }
  }
  AnalyticsSendEventLazy();
  return v12;
}

os_signpost_id_t HTBeginNonResponsiveTaskWithNameAndExpiration(const char *a1, double a2)
{
  uint64_t v4 = mach_absolute_time();
  return _HTBeginNonResponsiveAssertionAtStartTime(a1, v4, 0, 0, a2);
}

void HTEndNonResponsiveTaskAtTime(os_signpost_id_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (GetSharedPage_onceToken != -1) {
      dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_83);
    }
    uint64_t v4 = GetSharedPage__sharedPage;
    if (GetSharedPage__sharedPage)
    {
      if (*(void *)(GetSharedPage__sharedPage + 4128))
      {
        if (*(_DWORD *)(GetSharedPage__sharedPage + 4120)) {
          int v5 = *(_DWORD *)(GetSharedPage__sharedPage + 4120) - 1;
        }
        else {
          int v5 = 9;
        }
        int v7 = 0;
        while (1)
        {
          int v8 = (v5 + v7) % 10;
          if (*(void *)(GetSharedPage__sharedPage + 104 * v8 + 3080) == a1) {
            break;
          }
          if (++v7 == 10)
          {
            xpc_object_t v6 = shared_ht_log_handle();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
              HTEndNonResponsiveTaskAtTime_cold_2();
            }
            goto LABEL_16;
          }
        }
        int v9 = (v5 + v7) % 10;
        uint64_t v10 = GetSharedPage__sharedPage + 104 * v8;
        uint64_t v11 = (unint64_t *)(v10 + 3104);
        *(void *)(v10 + 3104) = a2;
        uint64_t v12 = v10 + 3112;
        double v13 = shared_ht_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          os_signpost_id_t v31 = a1;
          __int16 v32 = 2080;
          uint64_t v33 = v12;
          __int16 v34 = 2048;
          double v35 = *(double *)&a2;
          _os_log_impl(&dword_1B3C06000, v13, OS_LOG_TYPE_DEFAULT, "HTAssertions: HTEndAssertion: update assertionId=%llu assertionname=(%s) endTime is now=%llu", buf, 0x20u);
        }

        unint64_t v14 = *v11;
        int v15 = (unint64_t *)(v4 + 104 * v9 + 3096);
        unint64_t v16 = *v15;
        if (*v11 > *v15)
        {
          uint64_t v17 = shared_ht_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            double v18 = MATU_TO_MS(*v11 - *v15);
            *(_DWORD *)buf = 134218498;
            os_signpost_id_t v31 = a1;
            __int16 v32 = 2080;
            uint64_t v33 = v12;
            __int16 v34 = 2048;
            double v35 = v18;
            _os_log_impl(&dword_1B3C06000, v17, OS_LOG_TYPE_DEFAULT, "HTAssertions: HTEndAssertion: assertionId=%llu assertionname=(%s) missed timeout (endTime was %fms after timeout)!", buf, 0x20u);
          }
        }
        uint64_t v19 = assertionSignpost();
        BOOL v20 = os_signpost_enabled(v19);

        if (!v20)
        {
LABEL_33:
          AnalyticsSendEventLazy();
          return;
        }
        if (v14 <= v16)
        {
          double v28 = assertionSignpost();
          BOOL v23 = v28;
          if (a1 == -1 || !os_signpost_enabled(v28)) {
            goto LABEL_32;
          }
          *(_DWORD *)buf = 67240192;
          LODWORD(v31) = 0;
          BOOL v24 = "missedTimeout=%{public, signpost.telemetry:number2}i";
          id v25 = v23;
          os_signpost_id_t v26 = a1;
          uint32_t v27 = 8;
        }
        else
        {
          uint64_t v29 = mach_continuous_time();
          unint64_t v21 = *v15;
          v22 = assertionSignpost();
          BOOL v23 = v22;
          if (a1 == -1 || !os_signpost_enabled(v22)) {
            goto LABEL_32;
          }
          *(_DWORD *)buf = 134349312;
          os_signpost_id_t v31 = v29 - a2 + v21;
          __int16 v32 = 1026;
          LODWORD(v33) = 1;
          BOOL v24 = "%{public, signpost.description:end_time}llu missedTimeout=%{public, signpost.telemetry:number2}i";
          id v25 = v23;
          os_signpost_id_t v26 = a1;
          uint32_t v27 = 18;
        }
        _os_signpost_emit_with_name_impl(&dword_1B3C06000, v25, OS_SIGNPOST_INTERVAL_END, v26, "HTNonResponsiveTaskAssertion", v24, buf, v27);
LABEL_32:

        goto LABEL_33;
      }
      xpc_object_t v6 = shared_ht_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        HTEndNonResponsiveTaskAtTime_cold_1();
      }
LABEL_16:
    }
  }
}

id __HTEndNonResponsiveTaskAtTime_block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"assertionDurationMs";
  uint64_t v2 = [NSNumber numberWithDouble:MATU_TO_MS(*(void *)(a1 + 32) - *(void *)(*(void *)(a1 + 40) + 8))];
  v8[0] = v2;
  v7[1] = @"missedTimeout";
  BOOL v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v8[1] = v3;
  v7[2] = @"assertionName";
  uint64_t v4 = [NSString stringWithUTF8String:*(void *)(a1 + 48)];
  v8[2] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

uint64_t ht_fence_timeout(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (setupPrefs_onceToken != -1) {
    dispatch_once(&setupPrefs_onceToken, &__block_literal_global_121);
  }
  uint64_t v2 = +[HTPrefs sharedPrefs];
  char v3 = [v2 hangtracerDaemonEnabled];

  if ((v3 & 1) == 0)
  {
    uint64_t v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      ht_fence_timeout_cold_3();
    }
    goto LABEL_26;
  }
  uint64_t v4 = +[HTPrefs sharedPrefs];
  char v5 = [v4 fenceTrackingEnabled];

  if ((v5 & 1) == 0)
  {
    uint64_t v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      ht_fence_timeout_cold_2();
    }
    goto LABEL_26;
  }
  uint64_t v6 = mach_absolute_time();
  int v7 = shared_ht_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = a1;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1B3C06000, v7, OS_LOG_TYPE_DEFAULT, "HT CA Fence Tracking: ca fence blown, fence=%llu blown_timestamp=%llu", buf, 0x16u);
  }

  connectToHangTracer();
  if (!__recentCAFences)
  {
    uint64_t v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "HT CA Fence Tracking: recent fence array has not been malloc'ed yet", buf, 2u);
    }
    goto LABEL_26;
  }
  if (__nextFenceIndex) {
    LODWORD(v8) = __nextFenceIndex - 1;
  }
  else {
    LODWORD(v8) = 24;
  }
  if (*(void *)(__recentCAFences + 16 * (int)v8) == a1)
  {
    uint64_t v8 = (int)v8;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v12 = (uint64_t *)__recentCAFences;
    while (1)
    {
      uint64_t v13 = *v12;
      v12 += 2;
      if (v13 == a1) {
        break;
      }
      if (++v8 == 25) {
        goto LABEL_24;
      }
    }
  }
  uint64_t v9 = *(void *)(__recentCAFences + 16 * v8 + 8);
  if (v9 == -1)
  {
LABEL_24:
    uint64_t v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      ht_fence_timeout_cold_1();
    }
LABEL_26:
    uint64_t v11 = 0;
    goto LABEL_27;
  }
  uint64_t v10 = HTConnectionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ht_fence_timeout_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  void block[4] = a1;
  void block[5] = v9;
  block[6] = v6;
  dispatch_async(v10, block);
  uint64_t v11 = 1;
LABEL_27:

  return v11;
}

void __ht_fence_timeout_block_invoke(uint64_t *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E6071908;
    long long v6 = *(_OWORD *)off_1E6071918;
    v4[0] = xpc_int64_create(10);
    v4[1] = xpc_uint64_create(a1[4]);
    _DWORD v4[2] = xpc_uint64_create(a1[5]);
    v4[3] = xpc_uint64_create(a1[6]);
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 3; i != -1; --i)
  }
}

void HTCollectHangLogsBundle(void *a1, char a2)
{
  id v3 = a1;
  connectToHangTracer();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HTCollectHangLogsBundle_block_invoke;
  void v7[3] = &unk_1E6071968;
  id v8 = v3;
  char v9 = a2;
  id v4 = v3;
  char v5 = (void *)MEMORY[0x1B3EC2A60](v7);
  long long v6 = HTConnectionQueue();
  dispatch_sync(v6, v5);
}

void __HTCollectHangLogsBundle_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E6071948;
    long long v6 = "archiveCompressionBypass";
    values[0] = xpc_int64_create(11);
    values[1] = xpc_string_create((const char *)[*(id *)(a1 + 32) UTF8String]);
    values[2] = xpc_BOOL_create(*(unsigned char *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 2; i != -1; --i)
  }
}

void HTReportHangLogsProcessed(void *a1)
{
  id v1 = a1;
  connectToHangTracer();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __HTReportHangLogsProcessed_block_invoke;
  v5[3] = &unk_1E60718C0;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)MEMORY[0x1B3EC2A60](v5);
  id v4 = HTConnectionQueue();
  dispatch_sync(v4, v3);
}

void __HTReportHangLogsProcessed_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E6071988;
    uint64_t v1 = *(void *)(a1 + 32);
    id v8 = 0;
    id v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v8];
    id v3 = v8;
    if (v2)
    {
      *(void *)&long long values = xpc_int64_create(12);
      id v4 = v2;
      *((void *)&values + 1) = xpc_data_create((const void *)[v4 bytes], objc_msgSend(v4, "length"));
      xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, (xpc_object_t *)&values, 2uLL);
      xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v5);

      for (uint64_t i = 1; i != -1; --i)
    }
    else
    {
      uint64_t v7 = shared_ht_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(values) = 136315138;
        *(void *)((char *)&values + 4) = "HTReportHangLogsProcessed_block_invoke";
        _os_log_impl(&dword_1B3C06000, v7, OS_LOG_TYPE_DEFAULT, "%s: Unable to encode hang log info data", (uint8_t *)&values, 0xCu);
      }
    }
  }
}

void HTCheckForHangForHTMonitor(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = shared_ht_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1B3C06000, v4, OS_LOG_TYPE_INFO, "HTCheckForHangForHTMonitor: check hang for  pid=%u ", (uint8_t *)v6, 8u);
  }

  checkForHangWithUserMovedAwayAndRecentAssertions(a1, 1, a2);
}

void HTTestingResetNumOfHangEventsInSharedPage()
{
  if (GetSharedPage_onceToken != -1) {
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_83);
  }
  if (GetSharedPage__sharedPage && *(_DWORD *)(GetSharedPage__sharedPage + 4) == 8)
  {
    *(_DWORD *)(GetSharedPage__sharedPage + 4) = 0;
    uint64_t v0 = shared_ht_log_handle();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
      HTTestingResetNumOfHangEventsInSharedPage_cold_1();
    }
  }
}

void __handleSettingChange_block_invoke_2()
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    keys[0] = "command";
    xpc_object_t values = xpc_int64_create(2);
    xpc_object_t v0 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v0);
  }
}

void __setupPrefs_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.hangtracer.fencePrefs", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __setupPrefs_block_invoke_2;
  block[3] = &unk_1E60718C0;
  dispatch_queue_t v3 = v0;
  uint64_t v1 = v0;
  dispatch_async(v1, block);
}

void __setupPrefs_block_invoke_2(uint64_t a1)
{
  id v2 = +[HTPrefs sharedPrefs];
  [v2 setupPrefsWithQueue:*(void *)(a1 + 32)];
}

id __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke(uint64_t a1)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = kHTCoreAnalyticsDaemonEnabled;
  v7[0] = kHTCoreAnalyticsMode;
  v7[1] = kHTCoreAnalyticsHangType;
  id v2 = getStringForSubtype(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v8[1] = v2;
  v8[2] = v3;
  v7[2] = kHTCoreAnalyticsHangBundleID;
  void v7[3] = kHTCoreAnalyticsHangDuration;
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v8[3] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id HTPrefsKeysToRestoreForPrefix(void *a1)
{
  _DWORD v3[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isEqualToString:@"HTThirdPartyDevSupport"])
  {
    v3[0] = @"HangTracerHUDThresholdMSec";
    v3[1] = @"HangTracerThirdPartyHangThreshold";
    uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  }
  else
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v1;
}

id pathForPid()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(v0, buffer, 0x1000u))
  {
    uint64_t v1 = [NSString stringWithUTF8String:buffer];
    if (!v1)
    {
      uint64_t v1 = [NSString stringWithCString:buffer encoding:1];
      id v2 = shared_ht_log_handle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        pathForPid_cold_1((uint64_t)v1, v2);
      }
    }
  }
  else
  {
    uint64_t v1 = 0;
  }
  return v1;
}

__CFString *bundleIDFromPath(void *a1)
{
  uint64_t v1 = a1;
  if (v1 && (CFURLRef v2 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 1u)) != 0)
  {
    CFURLRef v3 = v2;
    id v4 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
    if (v4)
    {
      uint64_t v5 = v4;
      CFBundleGetIdentifier(v4);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v5);
    }
    else
    {
      id v6 = &stru_1F0C6A9F0;
    }
    CFRelease(v3);
  }
  else
  {
    id v6 = &stru_1F0C6A9F0;
  }

  return v6;
}

id STYErrorWithCode(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a2 forKey:*MEMORY[0x1E4F28568]];
  uint64_t v5 = [v3 errorWithDomain:@"SentryTailspinError" code:a1 userInfo:v4];

  return v5;
}

uint64_t ensureDirectoryExists(void *a1, int a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v19 = 0;
  if ([v4 fileExistsAtPath:v3 isDirectory:&v19]) {
    BOOL v5 = v19 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = shared_ht_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v3;
      _os_log_impl(&dword_1B3C06000, v6, OS_LOG_TYPE_INFO, "Directory doesn't exist -> trying to create directory at path: %@", buf, 0xCu);
    }

    if (a2)
    {
      uint64_t v24 = *MEMORY[0x1E4F28320];
      v25[0] = @"mobile";
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v18 = 0;
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v7 error:&v18];
    id v9 = v18;
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:v3 isDirectory:&v19];

    if (v19) {
      uint64_t v8 = v11;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v12 = shared_ht_log_handle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v8 == 1)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v3;
        unint64_t v14 = "Successfully created directory at path %@";
        int v15 = v12;
        uint32_t v16 = 12;
LABEL_19:
        _os_log_impl(&dword_1B3C06000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = v9;
      unint64_t v14 = "Error: error creating directory at path %@ %@";
      int v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  uint64_t v8 = 1;
LABEL_21:

  return v8;
}

void cleanupDiagnosticLogsDirectory(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CFURLRef v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = shared_ht_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    cleanupDiagnosticLogsDirectory_cold_1((uint64_t)v1, v3);
  }

  uint32_t v16 = v1;
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  BOOL v5 = [v2 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:&__block_literal_global_1];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        char v12 = [v2 removeItemAtURL:v11 error:&v17];
        id v13 = v17;
        unint64_t v14 = shared_ht_log_handle();
        int v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_debug_impl(&dword_1B3C06000, v15, OS_LOG_TYPE_DEBUG, "Successfully deleted file at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v11;
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_impl(&dword_1B3C06000, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete file at %@ : %@", buf, 0x16u);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }
}

uint64_t __cleanupDiagnosticLogsDirectory_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = shared_ht_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1B3C06000, v6, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void persistAndUnredactLogs()
{
  int v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_DEFAULT, "persistAndUnredactLogs not supported", v1, 2u);
  }
}

uint64_t getTimeBetweenAbsoluteAndContinuousTime()
{
  return 0;
}

id legacySignpost()
{
  if (legacySignpost_onceToken != -1) {
    dispatch_once(&legacySignpost_onceToken, &__block_literal_global_11);
  }
  int v0 = (void *)legacySignpost_signpostLog;
  return v0;
}

uint64_t __legacySignpost_block_invoke()
{
  legacySignpost_signpostLog = (uint64_t)os_log_create("com.apple.hangtracer", "signpost_hang");
  return MEMORY[0x1F41817F8]();
}

id tailspinConversionSignpost()
{
  if (tailspinConversionSignpost_onceToken != -1) {
    dispatch_once(&tailspinConversionSignpost_onceToken, &__block_literal_global_18);
  }
  int v0 = (void *)tailspinConversionSignpost_signpostLog;
  return v0;
}

uint64_t __tailspinConversionSignpost_block_invoke()
{
  tailspinConversionSignpost_signpostLog = (uint64_t)os_log_create("com.apple.hangtracer", "hangreporter_tailspin_conversion");
  return MEMORY[0x1F41817F8]();
}

id assertionSignpost()
{
  if (assertionSignpost_onceToken != -1) {
    dispatch_once(&assertionSignpost_onceToken, &__block_literal_global_24);
  }
  int v0 = (void *)assertionSignpost_signpostLog;
  return v0;
}

uint64_t __assertionSignpost_block_invoke()
{
  assertionSignpost_signpostLog = (uint64_t)os_log_create("com.apple.hangtracer", "non_responsive_assertion");
  return MEMORY[0x1F41817F8]();
}

__CFString *getStringForRequestType(unint64_t a1)
{
  if (a1 > 4)
  {
    CFURLRef v2 = @"Unknown";
  }
  else
  {
    CFURLRef v2 = *off_1E60721D0[a1];
  }
  return v2;
}

BOOL isFenceHang(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 3;
}

__CFString *getTailspinCaptureFailReasonString(unint64_t a1)
{
  if (a1 > 0xE) {
    return @"tailspin capture failed for unknown reason";
  }
  else {
    return *(&off_1E6072250 + a1);
  }
}

__CFString *getSpindumpConversionFailReasonString(unint64_t a1)
{
  if (a1 > 0xB) {
    return @"failed due to unknown reason";
  }
  else {
    return *(&off_1E60722C8 + a1);
  }
}

uint64_t getHTBugType(int a1, int a2, double a3)
{
  if (a1)
  {
    id v4 = +[HTPrefs sharedPrefs];
    double v5 = (double)(unint64_t)[v4 runloopLongHangDurationThresholdMSec];

    if (v5 <= a3)
    {
      return 222;
    }
    else
    {
      id v6 = +[HTPrefs sharedPrefs];
      double v7 = (double)(unint64_t)[v6 runloopHangDurationThresholdMSec];

      if (v7 <= a3) {
        return 223;
      }
      else {
        return 310;
      }
    }
  }
  else if (a2)
  {
    return 328;
  }
  else
  {
    return 228;
  }
}

uint64_t HTEventTypeFromServiceName(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"UIKit-runloop"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 containsString:@"Fence-hang"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 containsString:@"Slow-Launch"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 containsString:@"Sentry"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 containsString:@"Force-Quit"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 5;
  }

  return v2;
}

uint64_t isM9Watch()
{
  int v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqualToString:@"t8006"];

  return v1;
}

double getWallTimeForMachAbsTime(unint64_t a1)
{
  mach_get_times();
  double v2 = (double)0 - *MEMORY[0x1E4F1CF78] + (double)0 / 1000000000.0;
  double v3 = MATU_TO_MS(0) / 1000.0;
  return v2 + MATU_TO_MS(a1) / 1000.0 - v3;
}

id getFirstHangInfoDict(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v15;
    unint64_t v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v1);
        }
        int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 objectForKeyedSubscript:@"StartTime"];
        unint64_t v10 = [v9 longLongValue];

        if (v6 > v10)
        {
          id v11 = [v8 objectForKeyedSubscript:@"StartTime"];
          unint64_t v6 = [v11 longLongValue];

          id v12 = v8;
          id v4 = v12;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t HTGetNSDateFromMachAbsoluteTime(uint64_t a1, void *a2, unint64_t a3)
{
  [a2 timeIntervalSinceReferenceDate];
  double v6 = MS_TO_MATU((unint64_t)(v5 * 1000.0));
  double v7 = MATU_TO_SEC((unint64_t)(v6 - (double)a3) + a1);
  int v8 = (void *)MEMORY[0x1E4F1C9C8];
  return [v8 dateWithTimeIntervalSinceReferenceDate:v7];
}

BOOL checkForHUDUpdateForHangEvent(unint64_t a1, uint64_t a2, double *a3)
{
  unsigned int v3 = atomic_load((unsigned int *)(a2 + 24));
  BOOL result = 0;
  if (!v3)
  {
    unint64_t v5 = *(void *)a2;
    double v6 = MATU_TO_MS(a1);
    double v7 = v6 - MATU_TO_MS(v5);
    *a3 = v7;
    if (v7 > 100.0) {
      return 1;
    }
  }
  return result;
}

uint64_t HTAggdAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t HTAggdSetValueForScalarKey()
{
  return MEMORY[0x1F4107218]();
}

double MATU_TO_SEC(unint64_t a1)
{
  if (timebaseConversionFactor_onceToken != -1) {
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  }
  return *(double *)&timebaseConversionFactor_timebaseConversion * (double)a1 / 1000.0;
}

double MS_TO_MATU(unint64_t a1)
{
  if (timebaseConversionFactor_onceToken != -1) {
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  }
  return (double)a1 / *(double *)&timebaseConversionFactor_timebaseConversion;
}

double SEC_TO_MATU(double a1)
{
  if (timebaseConversionFactor_onceToken != -1) {
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  }
  return (double)(unint64_t)(a1 * 1000.0) / *(double *)&timebaseConversionFactor_timebaseConversion;
}

uint64_t machTimebaseForLiveMachine()
{
  if (machTimebaseForLiveMachine_once != -1) {
    dispatch_once(&machTimebaseForLiveMachine_once, &__block_literal_global_2);
  }
  return machTimebaseForLiveMachine_timebase;
}

uint64_t __machTimebaseForLiveMachine_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimebaseForLiveMachine_timebase);
}

uint64_t applyTailspinConfig()
{
  int v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: configureTailspin not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForSelfEnableConfig()
{
  int v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForSelfEnableConfig not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForEPL()
{
  int v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForEPL not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForThirdPartyDevelopment()
{
  int v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForThirdPartyDevelopment not supported", v2, 2u);
  }

  return 0;
}

void __HTTelemetryCheckForUpdates_block_invoke_5()
{
  id v0 = +[HTPrefs sharedPrefs];
  [v0 refreshHTPrefs];
}

void HTInitializeHangTracerMonitor()
{
  id v0 = shared_ht_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor: HT Monitor is monitoring Hang Event", v1, 2u);
  }

  if (HTInitializeHangTracerMonitor_onceToken != -1) {
    dispatch_once(&HTInitializeHangTracerMonitor_onceToken, &__block_literal_global_4);
  }
}

void __HTInitializeHangTracerMonitor_block_invoke()
{
  id v0 = dispatch_queue_create("com.apple.htmonitor.connectionqueue", 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangtracermonitor", v0, 1uLL);
  uint64_t v2 = (void *)HTInitializeHangTracerMonitor_htConnection;
  HTInitializeHangTracerMonitor_htConnection = (uint64_t)mach_service;

  unsigned int v3 = (_xpc_connection_s *)HTInitializeHangTracerMonitor_htConnection;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __HTInitializeHangTracerMonitor_block_invoke_2;
  handler[3] = &unk_1E6072398;
  double v6 = v0;
  id v4 = v0;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_resume((xpc_connection_t)HTInitializeHangTracerMonitor_htConnection);
}

void __HTInitializeHangTracerMonitor_block_invoke_33(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = shared_ht_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1B3C06000, v2, OS_LOG_TYPE_INFO, "HangTracerMonitor: Detected app exit (pid=%u)", (uint8_t *)v6, 8u);
  }

  id v4 = (void *)pidHangEventDict;
  unint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v4 removeObjectForKey:v5];

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void HTUserSwitchedAwayFromApp(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = shared_ht_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109378;
    v5[1] = a1;
    __int16 v6 = 2112;
    id v7 = v3;
    _os_log_impl(&dword_1B3C06000, v4, OS_LOG_TYPE_INFO, "HTUserSwitchedAwayFromApp for pid %d reason %@", (uint8_t *)v5, 0x12u);
  }

  +[HTMonitorPidHangEvent checkHangForPid:a1];
}

uint64_t keyWithPrefix(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@.%@", a2, a1];
}

id arrayOfCFPrefsWithPrefix(const __CFString *a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  __int16 v6 = [NSString stringWithFormat:@"%@.", a3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFArrayRef v8 = CFPreferencesCopyKeyList(a1, v5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CFArrayRef v9 = v8;
  uint64_t v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v14 hasPrefix:v6]) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [(__CFArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v7;
}

id getPrefWithOverrideProfile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = NSString;
  id v5 = a2;
  __int16 v6 = [v4 stringWithFormat:@"HTProfile.%@", v3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = v7;
  }
  else
  {
    CFArrayRef v9 = (void *)CFPreferencesCopyValue(v3, @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      id v8 = v9;
    }
    else {
      id v8 = 0;
    }
  }
  return v8;
}

id __checkForAssertionOverlap_block_invoke(void *a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"assertionOverlapMs";
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:a1[4] - a1[5]];
  v6[1] = @"assertionOverlapName";
  v7[0] = v2;
  id v3 = [NSString stringWithUTF8String:a1[6]];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id __checkForAssertionOverlap_block_invoke_16(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"hangDurationOverlapMs";
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v6[1] = @"hangDurationOverlapPercent";
  v7[0] = v2;
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id HTTerminationAllAvailableReasons()
{
  if (HTTerminationAllAvailableReasons_onceToken != -1) {
    dispatch_once(&HTTerminationAllAvailableReasons_onceToken, &__block_literal_global_5);
  }
  id v0 = (void *)HTTerminationAllAvailableReasons_allReasons;
  return v0;
}

void __HTTerminationAllAvailableReasons_block_invoke()
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v0 = 2;
  do
  {
    id v1 = [NSNumber numberWithUnsignedLongLong:v0];
    [v5 addObject:v1];

    unint64_t v2 = v0 >> 41;
    v0 *= 2;
  }
  while (!v2);
  uint64_t v3 = [v5 copy];
  id v4 = (void *)HTTerminationAllAvailableReasons_allReasons;
  HTTerminationAllAvailableReasons_allReasons = v3;
}

void HTHangEventCreateWithBundleID_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Watchdog monitoring: starting monitor", v2, v3, v4, v5, v6);
}

void HTHangEventCreateWithBundleID_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Watchdog monitoring: already started", v2, v3, v4, v5, v6);
}

void __HTHangEventCreateWithBundleID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1B3C06000, v0, v1, "HangTracer SB Screen State: Detected Screen ON -> OFF but an old HT Assertion still exists when we're about to create a new one", v2, v3, v4, v5, v6);
}

void __HTHangEventCreateWithBundleID_block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = kHTAppActivationFailureReasonWatchdog_block_invoke_prevDisplayState == 1;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_debug_impl(&dword_1B3C06000, a2, OS_LOG_TYPE_DEBUG, "Display state changed %i -> %i", (uint8_t *)v2, 0xEu);
}

void HTResumeHangTracing_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 - 1;
  _os_log_fault_impl(&dword_1B3C06000, a2, OS_LOG_TYPE_FAULT, "HangTracer: HTResumeHangTracing over resumed! decremented suspendCount to %u\n", (uint8_t *)v2, 8u);
}

void HTEndNonResponsiveTaskAtTime_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1B3C06000, v0, v1, "HTAssertions: HTEndAssertion:assertionCounter is 0", v2, v3, v4, v5, v6);
}

void HTEndNonResponsiveTaskAtTime_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1B3C06000, v0, v1, "HTAssertions: HTEndAssertion: assertionId not found in recent array", v2, v3, v4, v5, v6);
}

void ht_fence_start_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1B3C06000, v0, v1, "HT CA Fence Tracking: recent fence array not malloc'ed", v2, v3, v4, v5, v6);
}

void ht_fence_start_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_DEBUG, "HT CA Fence Tracking: ca fence=%llu with timestamp=%llu", v1, 0x16u);
}

void ht_fence_start_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Hangtracer fence start: Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

void ht_fence_start_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Hangtracer fence start: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

void ht_fence_timeout_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1B3C06000, v0, OS_LOG_TYPE_FAULT, "HT CA Fence Tracking: unable to find start timestamp for blown fence, fence=%llu blown_timestamp=%llu", v1, 0x16u);
}

void ht_fence_timeout_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Hangtracer fenceTimeout: Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

void ht_fence_timeout_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Hangtracer fenceTimeout: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

void checkForHangWithUserMovedAwayAndRecentAssertions_cold_1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 1024;
  int v5 = 250;
  _os_log_fault_impl(&dword_1B3C06000, log, OS_LOG_TYPE_FAULT, "Hang detected below aggd threshold: hang duration = %.2fms, aggd treshold = %.2dms", (uint8_t *)&v2, 0x12u);
}

void HTTestingResetNumOfHangEventsInSharedPage_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Reset Num Of HangEvents In SharedPage", v2, v3, v4, v5, v6);
}

void __StartMonitoringWatchdogDisablement_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Watchdog monitoring: state callback when not enabled, ignoring", v2, v3, v4, v5, v6);
}

void __StartMonitoringWatchdogDisablement_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Watchdog monitoring: watchdog disabled, already have assertion", v2, v3, v4, v5, v6);
}

void __StartMonitoringWatchdogDisablement_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Watchdog monitoring: watchdog enabled, no assertion active", v2, v3, v4, v5, v6);
}

void pathForPid_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B3C06000, a2, OS_LOG_TYPE_FAULT, "HangTracer: pathForPid was found invalid UTF8 string, trying ascii encoding = %@", (uint8_t *)&v2, 0xCu);
}

void cleanupDiagnosticLogsDirectory_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B3C06000, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

void __HTTelemetryCheckForUpdates_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B3C06000, log, OS_LOG_TYPE_DEBUG, "Telemetry is current", v1, 2u);
}

void __HTInitializeHangTracerMonitor_block_invoke_28_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1B3C06000, a2, OS_LOG_TYPE_FAULT, "HTInitializeHangTracerMonitor: pidHangEvent is present in dict for pid  %d ", (uint8_t *)v3, 8u);
}

void checkForAssertionOverlap_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B3C06000, log, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: no assertions have been tracked", v1, 2u);
}

void checkForAssertionOverlap_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B3C06000, log, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: hang does not overlap any assertions", v1, 2u);
}

void checkForAssertionOverlap_cold_3(uint8_t *a1, unint64_t a2, double *a3, NSObject *a4)
{
  double v7 = MATU_TO_MS(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B3C06000, a4, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms", a1, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t alm_app_measurement_ongoing()
{
  return MEMORY[0x1F417DDD0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1F40CDEE8](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1F40CDEF0](a1, *(void *)&a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}
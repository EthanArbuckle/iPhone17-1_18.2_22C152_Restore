id AFLogDirectory()
{
  void *v0;
  void *v1;
  uint64_t vars8;

  v0 = MEMORY[0x2455F02E0]();
  v1 = [v0 stringByAppendingPathComponent:@"/Library/Logs/CrashReporter/Assistant/"];

  return v1;
}

id AFSpeechLogsDirectory()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = AFLogDirectory();
  v1 = [v0 stringByAppendingPathComponent:@"SpeechLogs"];

  v2 = [MEMORY[0x263F08850] defaultManager];
  id v7 = 0;
  char v3 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;

  if ((v3 & 1) == 0)
  {
    v5 = AFSiriLogContextSpeech;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "AFSpeechLogsDirectory";
      __int16 v10 = 2114;
      v11 = v1;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_error_impl(&dword_2405ED000, v5, OS_LOG_TYPE_ERROR, "%s Couldn't create speech log directory at path %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v1;
}

id AFAnalyticsLogsDirectory()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = AFLogDirectory();
  v1 = [v0 stringByAppendingPathComponent:@"Analytics"];

  v2 = [MEMORY[0x263F08850] defaultManager];
  id v7 = 0;
  char v3 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;

  if ((v3 & 1) == 0)
  {
    v5 = AFSiriLogContextSpeech;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "AFAnalyticsLogsDirectory";
      __int16 v10 = 2114;
      v11 = v1;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_error_impl(&dword_2405ED000, v5, OS_LOG_TYPE_ERROR, "%s Couldn't create analytics log directory at path %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v1;
}

void AFClearInternalLogFiles()
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (AFIsInternalInstall())
  {
    v0 = [MEMORY[0x263EFF910] date];
    v1 = [v0 dateByAddingTimeInterval:-1296000.0];

    id v2 = objc_alloc_init(MEMORY[0x263F08850]);
    AFSpeechLogsDirectory();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v26 = v29[1] = 0;
    v27 = v2;
    char v3 = objc_msgSend(v2, "contentsOfDirectoryAtPath:error:");
    id v4 = (__CFString *)0;
    id obj = v3;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      v23 = 0;
      uint64_t v8 = *(void *)v31;
      uint64_t v24 = *MEMORY[0x263F08008];
      *(void *)&long long v6 = 136315650;
      long long v20 = v6;
      v21 = v1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          __int16 v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "pathExtension", v20);
          if (![v11 compare:@"opx" options:1]
            || ![v11 compare:@"pcm" options:1])
          {
            __int16 v12 = [v26 stringByAppendingPathComponent:v10];
            v29[0] = v4;
            id v13 = [v27 attributesOfItemAtPath:v12 error:v29];
            uint64_t v14 = (__CFString *)v29[0];

            if (!v14)
            {
              v15 = [v13 objectForKey:v24];
              if ([v15 compare:v1] == -1)
              {
                id v28 = 0;
                int v22 = [v27 removeItemAtPath:v12 error:&v28];
                uint64_t v14 = (__CFString *)v28;
                v16 = AFSiriLogContextUtility;
                if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v20;
                  v17 = &stru_26F4B8CF8;
                  if (!v22) {
                    v17 = v14;
                  }
                  v35 = "AFClearInternalLogFiles";
                  __int16 v36 = 2112;
                  v37 = v10;
                  __int16 v38 = 2112;
                  v39 = v17;
                  _os_log_impl(&dword_2405ED000, v16, OS_LOG_TYPE_INFO, "%s Removing speech log %@ %@", buf, 0x20u);
                }
                ++v23;
                v1 = v21;
              }
              else
              {
                uint64_t v14 = 0;
              }
            }
            id v4 = v14;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v7);
    }
    else
    {
      v23 = 0;
    }

    v19 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "AFClearInternalLogFiles";
      __int16 v36 = 2048;
      v37 = v23;
      _os_log_impl(&dword_2405ED000, v19, OS_LOG_TYPE_INFO, "%s Finished, and removed %ld files", buf, 0x16u);
    }
  }
  else
  {
    v18 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "AFClearInternalLogFiles";
      _os_log_impl(&dword_2405ED000, v18, OS_LOG_TYPE_INFO, "%s Nothing to do on non-internal install", buf, 0xCu);
    }
  }
}

void AFLogInitIfNeeded()
{
  if (qword_268C8AB88 != -1) {
    dispatch_once(&qword_268C8AB88, &unk_26F4B8B58);
  }
}

uint64_t sub_2405EEAB8()
{
  os_log_t v0 = os_log_create("com.apple.siri", (const char *)kAFLogContextConnection);
  v1 = (void *)AFSiriLogContextConnection;
  AFSiriLogContextConnection = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.siri", (const char *)kAFLogContextClientFlow);
  char v3 = (void *)AFSiriLogContextClientFlow;
  AFSiriLogContextClientFlow = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.siri", (const char *)kAFLogContextDaemon);
  uint64_t v5 = (void *)AFSiriLogContextDaemon;
  AFSiriLogContextDaemon = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.siri", (const char *)kAFLogContextPersisted);
  uint64_t v7 = (void *)AFSiriLogContextPersisted;
  AFSiriLogContextPersisted = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.siri", (const char *)kAFLogContextSession);
  v9 = (void *)AFSiriLogContextSession;
  AFSiriLogContextSession = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.siri", (const char *)kAFLogContextSpeech);
  v11 = (void *)AFSiriLogContextSpeech;
  AFSiriLogContextSpeech = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.siri", (const char *)kAFLogContextFides);
  id v13 = (void *)AFSiriLogContextFides;
  AFSiriLogContextFides = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.siri", (const char *)kAFLogContextLocation);
  v15 = (void *)AFSiriLogContextLocation;
  AFSiriLogContextLocation = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.siri", (const char *)kAFLogContextDaemonAce);
  v17 = (void *)AFSiriLogContextDaemonAce;
  AFSiriLogContextDaemonAce = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.siri", (const char *)kAFLogContextService);
  v19 = (void *)AFSiriLogContextService;
  AFSiriLogContextService = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.siri", (const char *)kAFLogContextPlugin);
  v21 = (void *)AFSiriLogContextPlugin;
  AFSiriLogContextPlugin = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.siri", (const char *)kAFLogContextUtility);
  v23 = (void *)AFSiriLogContextUtility;
  AFSiriLogContextUtility = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.siri", (const char *)kAFLogContextAnalysis);
  v25 = (void *)AFSiriLogContextAnalysis;
  AFSiriLogContextAnalysis = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.siri", (const char *)kAFLogContextPerformance);
  v27 = (void *)AFSiriLogContextPerformance;
  AFSiriLogContextPerformance = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.siri", (const char *)kAFLogContextIDS);
  v29 = (void *)AFSiriLogContextIDS;
  AFSiriLogContextIDS = (uint64_t)v28;

  os_log_t v30 = os_log_create("com.apple.siri", (const char *)kAFLogContextProxy);
  long long v31 = (void *)AFSiriLogContextProxy;
  AFSiriLogContextProxy = (uint64_t)v30;

  os_log_t v32 = os_log_create("com.apple.siri", (const char *)kAFLogContextDispatch);
  long long v33 = (void *)AFSiriLogContextDispatch;
  AFSiriLogContextDispatch = (uint64_t)v32;

  os_log_t v34 = os_log_create("com.apple.siri", (const char *)kAFLogContextAnalytics);
  v35 = (void *)AFSiriLogContextAnalytics;
  AFSiriLogContextAnalytics = (uint64_t)v34;

  os_log_t v36 = os_log_create("com.apple.siri", (const char *)kAFLogContextTinyCDB);
  v37 = (void *)AFSiriLogContextTinyCDB;
  AFSiriLogContextTinyCDB = (uint64_t)v36;

  os_log_t v38 = os_log_create("com.apple.siri", (const char *)kAFLogContextMediaSupport);
  v39 = (void *)AFSiriLogContextMediaSupport;
  AFSiriLogContextMediaSupport = (uint64_t)v38;

  os_log_t v40 = os_log_create("com.apple.siri", (const char *)kAFLogContextMockServer);
  uint64_t v41 = (void *)AFSiriLogContextMockServer;
  AFSiriLogContextMockServer = (uint64_t)v40;

  os_log_t v42 = os_log_create("com.apple.siri", (const char *)kAFLogContextMusicIndexer);
  v43 = (void *)AFSiriLogContextMusicIndexer;
  AFSiriLogContextMusicIndexer = (uint64_t)v42;

  os_log_t v44 = os_log_create("com.apple.siri", (const char *)kAFLogContextDatabase);
  v45 = (void *)AFSiriLogContextDatabase;
  AFSiriLogContextDatabase = (uint64_t)v44;

  os_log_t v46 = os_log_create("com.apple.siri", (const char *)kAFLogContextSync);
  v47 = (void *)AFSiriLogContextSync;
  AFSiriLogContextSync = (uint64_t)v46;

  os_log_t v48 = os_log_create("com.apple.siri", (const char *)kAFLogContextDeviceSync);
  v49 = (void *)AFSiriLogContextDeviceSync;
  AFSiriLogContextDeviceSync = (uint64_t)v48;

  os_log_t v50 = os_log_create("com.apple.siri", (const char *)kAFLogContextInternalAuth);
  v51 = (void *)AFSiriLogContextInternalAuth;
  AFSiriLogContextInternalAuth = (uint64_t)v50;

  os_log_t v52 = os_log_create("com.apple.siri", (const char *)kAFLogContextMyriad);
  v53 = (void *)AFSiriLogContextMyriad;
  AFSiriLogContextMyriad = (uint64_t)v52;

  os_log_t v54 = os_log_create("com.apple.siri", (const char *)kAFLogContextPower);
  v55 = (void *)AFSiriLogContextPower;
  AFSiriLogContextPower = (uint64_t)v54;

  os_log_t v56 = os_log_create("com.apple.siri", (const char *)AFLogContextNetworkingFunctional);
  v57 = (void *)AFNetworkingLogContextFunctional;
  AFNetworkingLogContextFunctional = (uint64_t)v56;

  os_log_t v58 = os_log_create("com.apple.siri", (const char *)AFLogContextNetworkingPerformance);
  v59 = (void *)AFNetworkingLogContextPerformance;
  AFNetworkingLogContextPerformance = (uint64_t)v58;

  AFSiriLogContextMUXReverseSync = (uint64_t)os_log_create("com.apple.siri", (const char *)kAFSiriLogContextMUXReverseSync);
  return MEMORY[0x270F9A758]();
}

uint64_t AFLogWantsToLogParsedCommandObjects()
{
  return 0;
}

void AFLogParsedCommandObject(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a1;
  id v11 = a2;
  os_log_t v12 = AFLogDirectory();
  id v13 = [v12 stringByAppendingPathComponent:@"CommandLogs"];

  os_log_t v14 = [MEMORY[0x263F08850] defaultManager];
  id v28 = 0;
  char v15 = [v14 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v28];
  id v16 = v28;

  if (v15)
  {
    id v27 = 0;
    v17 = [MEMORY[0x263F08AC0] dataWithPropertyList:v10 format:200 options:0 error:&v27];
    id v18 = v27;

    if (v17)
    {
      v26[1] = &a9;
      v19 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
      os_log_t v20 = [v13 stringByAppendingPathComponent:v19];
      v21 = [v20 stringByAppendingPathExtension:@"plist"];

      v26[0] = v18;
      char v22 = [v17 writeToFile:v21 options:1 error:v26];
      id v16 = v26[0];

      if ((v22 & 1) == 0)
      {
        v23 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          os_log_t v30 = "AFLogParsedCommandObject";
          __int16 v31 = 2112;
          id v32 = v21;
          __int16 v33 = 2112;
          id v34 = v16;
          _os_log_impl(&dword_2405ED000, v23, OS_LOG_TYPE_INFO, "%s Couldn't write to %@: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      v25 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        os_log_t v30 = "AFLogParsedCommandObject";
        __int16 v31 = 2112;
        id v32 = v18;
        _os_log_impl(&dword_2405ED000, v25, OS_LOG_TYPE_INFO, "%s Couldn't serialize: %@", buf, 0x16u);
      }
      id v16 = v18;
    }
  }
  else
  {
    os_log_t v24 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      os_log_t v30 = "AFLogParsedCommandObject";
      __int16 v31 = 2112;
      id v32 = v13;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl(&dword_2405ED000, v24, OS_LOG_TYPE_INFO, "%s Couldn't create %@: %@", buf, 0x20u);
    }
  }
}

unint64_t AFTruncateMachTimeToTenthOfASecond(uint64_t a1)
{
  if (qword_268C8AB98 != -1) {
    dispatch_once(&qword_268C8AB98, &unk_26F4B8B78);
  }
  return 1000000000
       * (unint64_t)dword_268C8AB90
       * a1
       / *(unsigned int *)algn_268C8AB94
       / 0x3B9ACA00
       * *(unsigned int *)algn_268C8AB94
       / dword_268C8AB90;
}

uint64_t sub_2405EF264()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_268C8AB90);
}

void AFDispatchSyncLogged(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v9 = a1;
  id v10 = a2;
  label = dispatch_queue_get_label(v9);
  os_log_t v12 = AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AFDispatchSyncLogged";
    __int16 v22 = 2080;
    uint64_t v23 = a3;
    __int16 v24 = 2048;
    uint64_t v25 = a4;
    __int16 v26 = 2080;
    id v27 = label;
    _os_log_impl(&dword_2405ED000, v12, OS_LOG_TYPE_INFO, "%s Queue block at %s line %lu (queue: %s)", buf, 0x2Au);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2405EF3EC;
  block[3] = &unk_2650C6578;
  uint64_t v17 = a4;
  id v18 = label;
  uint64_t v19 = a5;
  id v15 = v10;
  uint64_t v16 = a3;
  id v13 = v10;
  dispatch_sync(v9, block);
}

void sub_2405EF3EC(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_log_t v2 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    os_log_t v6 = v2;
    uint64_t v7 = mach_absolute_time();
    unint64_t v8 = sub_2405EF59C(v7 - a1[8]);
    int v17 = 136316162;
    id v18 = "AFDispatchSyncLogged_block_invoke";
    __int16 v19 = 2080;
    uint64_t v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v4;
    __int16 v23 = 2080;
    uint64_t v24 = v5;
    __int16 v25 = 2048;
    unint64_t v26 = v8;
    _os_log_impl(&dword_2405ED000, v6, OS_LOG_TYPE_INFO, "%s Enter block at %s line %lu (queue: %s, waitingTime: %llums)", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v9 = mach_absolute_time();
  (*(void (**)(void))(a1[4] + 16))();
  id v10 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    os_log_t v14 = v10;
    uint64_t v15 = mach_absolute_time();
    unint64_t v16 = sub_2405EF59C(v15 - v9);
    int v17 = 136316162;
    id v18 = "AFDispatchSyncLogged_block_invoke";
    __int16 v19 = 2080;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2080;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = v16;
    _os_log_impl(&dword_2405ED000, v14, OS_LOG_TYPE_INFO, "%s Leave block at %s line %lu (queue: %s, executionTime: %llums)", (uint8_t *)&v17, 0x34u);
  }
}

unint64_t sub_2405EF59C(uint64_t a1)
{
  if (qword_268C8ABA8 != -1) {
    dispatch_once(&qword_268C8ABA8, &unk_26F4B8B98);
  }
  return (unint64_t)dword_268C8ABA0 * a1 / *(unsigned int *)algn_268C8ABA4 / 0xF4240;
}

uint64_t sub_2405EF610()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_268C8ABA0);
}

void AFDispatchAsyncLogged(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  id v10 = a2;
  label = dispatch_queue_get_label(v9);
  uint64_t v12 = AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v21 = "AFDispatchAsyncLogged";
    __int16 v22 = 2080;
    uint64_t v23 = a3;
    __int16 v24 = 2048;
    uint64_t v25 = a4;
    __int16 v26 = 2080;
    uint64_t v27 = label;
    _os_log_impl(&dword_2405ED000, v12, OS_LOG_TYPE_INFO, "%s Queue block at %s line %lu (queue: %s)", buf, 0x2Au);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2405EF798;
  block[3] = &unk_2650C6578;
  uint64_t v17 = a4;
  id v18 = label;
  uint64_t v19 = a5;
  id v15 = v10;
  uint64_t v16 = a3;
  id v13 = v10;
  dispatch_async(v9, block);
}

void sub_2405EF798(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_log_t v2 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    os_log_t v6 = v2;
    uint64_t v7 = mach_absolute_time();
    unint64_t v8 = sub_2405EF59C(v7 - a1[8]);
    int v17 = 136316162;
    id v18 = "AFDispatchAsyncLogged_block_invoke";
    __int16 v19 = 2080;
    uint64_t v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v4;
    __int16 v23 = 2080;
    uint64_t v24 = v5;
    __int16 v25 = 2048;
    unint64_t v26 = v8;
    _os_log_impl(&dword_2405ED000, v6, OS_LOG_TYPE_INFO, "%s Enter block at %s line %lu (queue: %s, waitingTime: %llums)", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v9 = mach_absolute_time();
  (*(void (**)(void))(a1[4] + 16))();
  id v10 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    os_log_t v14 = v10;
    uint64_t v15 = mach_absolute_time();
    unint64_t v16 = sub_2405EF59C(v15 - v9);
    int v17 = 136316162;
    id v18 = "AFDispatchAsyncLogged_block_invoke";
    __int16 v19 = 2080;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2080;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = v16;
    _os_log_impl(&dword_2405ED000, v14, OS_LOG_TYPE_INFO, "%s Leave block at %s line %lu (queue: %s, executionTime: %llums)", (uint8_t *)&v17, 0x34u);
  }
}

void sub_2405EFAA0(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_t v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SiriCloudKitAccountsNotifier account:didChangeWithType:inStore:oldAccount:]_block_invoke";
    _os_log_impl(&dword_2405ED000, v2, OS_LOG_TYPE_INFO, "%s Responding to CloudKit Account Update", (uint8_t *)&v8, 0xCu);
  }
  if (*(unsigned char *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 33)) {
      return;
    }
    uint64_t v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SiriCloudKitAccountsNotifier account:didChangeWithType:inStore:oldAccount:]_block_invoke";
      _os_log_impl(&dword_2405ED000, v3, OS_LOG_TYPE_INFO, "%s Disabling Siri Cloud Sync.", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v5 = v4;
    uint64_t v6 = 0;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 33)) {
      return;
    }
    uint64_t v7 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SiriCloudKitAccountsNotifier account:didChangeWithType:inStore:oldAccount:]_block_invoke";
      _os_log_impl(&dword_2405ED000, v7, OS_LOG_TYPE_INFO, "%s Enabling Siri Cloud Sync.", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v5 = v4;
    uint64_t v6 = 1;
  }
  [v4 setCloudSyncEnabled:v6];
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFSharedResourcesDirectory()
{
  return MEMORY[0x270F0EF28]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}
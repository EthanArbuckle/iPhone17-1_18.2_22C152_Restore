@interface CDMSSUService
+ (BOOL)isEnabled;
+ (id)acquireOrBuildMatcher:(id)a3 systemState:(id)a4 error:(id *)a5;
+ (id)assetDirectoryURLForServiceAssetBundle:(id)a3;
+ (id)buildDeviceSystemStateLocale:(id)a3;
+ (id)buildMatcherRequestQueue;
+ (id)buildSystemStateForServiceStateDirectory:(id)a3 locale:(id)a4;
+ (id)buildSystemStateForSsuSandboxDirectories:(id)a3 locale:(id)a4;
+ (id)buildSystemStateForSystemEventWithLocale:(id)a3;
+ (id)getAssetsDirectory:(id)a3 factorName:(id)a4 error:(id *)a5;
+ (id)getCDMServiceAssetConfig;
+ (id)getMatcherWithAssetCollection:(id)a3 systemState:(id)a4;
+ (id)getSystemEventStreamQueue;
+ (id)lookupSSUSandboxDirectories:(id)a3;
+ (id)xpcActivitySupported;
+ (id)xpcEventStreamsSupported;
+ (void)dispatchAsyncWithTransaction:(id)a3 block:(id)a4;
+ (void)fetchVoiceShortcutsWithMatcher:(id)a3 assetCollection:(id)a4 block:(id)a5;
+ (void)handleMaintenanceMode:(id)a3;
+ (void)handlePostInstall:(id)a3;
+ (void)handleTrialAssetUpdate:(id)a3;
+ (void)handleVoiceShortcutsCompletion:(id)a3 voiceShortcuts:(id)a4 voiceShortcutsError:(id)a5 block:(id)a6;
+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5;
+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6;
+ (void)handleXPCEventApplicationInner:(id)a3 assetCollection:(id)a4 block:(id)a5;
+ (void)handleXPCEventApplicationRegistered:(id)a3 assetCollection:(id)a4;
+ (void)handleXPCEventApplicationUnregistered:(id)a3 assetCollection:(id)a4;
+ (void)handleXPCEventShortcutsDatabaseChanged:(id)a3;
+ (void)performFullCacheUpdate:(id)a3 assetCollection:(id)a4 systemState:(id)a5;
- (BOOL)executeMatcherRequestBlockWithTimeout:(id)a3;
- (OS_dispatch_queue)_matcherRequestQueue;
- (SNLPSSUMatcher)_matcher;
- (SSUSystemState)_systemState;
- (double)_matcherRequestTimeoutSec;
- (id)abortHandleWithErrorCode:(int64_t)a3 description:(id)a4;
- (id)errorSetupWithErrorDescription:(id)a3;
- (id)failSetupWithErrorDescription:(id)a3;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (void)forceAppsRescanIfEnabled;
- (void)forceFullCacheUpdateIfEnabled;
- (void)performAppRescanForSandboxInstalledApps;
- (void)set_matcherRequestTimeoutSec:(double)a3;
@end

@implementation CDMSSUService

- (id)handleRequestCommandTypeNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return v5;
}

+ (id)xpcActivitySupported
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.siri.cdm.xpc_activity.maintenance", @"com.apple.siri.cdm.xpc_activity.post_install", 0);
}

+ (id)xpcEventStreamsSupported
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.distnoted.matching" eventName:@"com.apple.LaunchServices.applicationRegistered" dagServiceClass:objc_opt_class()];
  v4 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.distnoted.matching" eventName:@"com.apple.LaunchServices.applicationUnregistered" dagServiceClass:objc_opt_class()];
  v5 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.notifyd.matching" eventName:@"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL" dagServiceClass:objc_opt_class()];
  v6 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.notifyd.matching" eventName:@"com.apple.siri.uaf.com.apple.siri.understanding" dagServiceClass:objc_opt_class()];
  v7 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.notifyd.matching" eventName:*MEMORY[0x263F85620] dagServiceClass:objc_opt_class()];
  v8 = objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, v6, v7, 0);

  return v8;
}

+ (BOOL)isEnabled
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v2 = +[CDMFeatureFlags isSSUEnabled];
  if (!v2)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      v6 = "+[CDMSSUService isEnabled]";
    }
  }
  return v2;
}

+ (void)dispatchAsyncWithTransaction:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 getSystemEventStreamQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__CDMSSUService_SystemEvent__dispatchAsyncWithTransaction_block___block_invoke;
  v11[3] = &unk_2647A4ED8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[SSUXPCUtils dispatchAsyncWithTransaction:v8 block:v11];
}

uint64_t __65__CDMSSUService_SystemEvent__dispatchAsyncWithTransaction_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)getMatcherWithAssetCollection:(id)a3 systemState:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v9 = 0;
  v4 = [a1 acquireOrBuildMatcher:a3 systemState:a4 error:&v9];
  id v5 = v9;
  if (!v4)
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = +[CDMPlatformUtils prettyPrintError:v5];
      *(_DWORD *)buf = 136315394;
      v11 = "+[CDMSSUService(SystemEvent) getMatcherWithAssetCollection:systemState:]";
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not acquire/build SNLPSSUMatcher instance: %@.", buf, 0x16u);
    }
  }

  return v4;
}

+ (void)handleXPCEventApplicationInner:(id)a3 assetCollection:(id)a4 block:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[SSUXPCUtils isPlaceholder:v8])
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationInner:assetCollection:block:]";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Received placeholder application XPC event. We only want to action non-placeholder ones. Aborting XPC event handling.", buf, 0xCu);
    }
  }
  else
  {
    v11 = +[SSUXPCUtils extractSingleBundleId:v8];
    if (v11)
    {
      os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)CDMLogContext);
      id v13 = (id)CDMLogContext;
      uint64_t v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CDMSSUService+SystemEvent enqueue for handling", "", buf, 2u);
      }

      v15 = [v9 languageCode];
      v16 = [a1 buildSystemStateForSystemEventWithLocale:v15];

      v17 = [a1 getMatcherWithAssetCollection:v9 systemState:v16];
      if (v17)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __83__CDMSSUService_SystemEvent__handleXPCEventApplicationInner_assetCollection_block___block_invoke;
        v21[3] = &unk_2647A4828;
        v25 = v10;
        v22 = v16;
        id v23 = v17;
        v24 = v11;
        [a1 dispatchAsyncWithTransaction:v9 block:v21];
        v18 = (id)CDMLogContext;
        v19 = v18;
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2263A0000, v19, OS_SIGNPOST_INTERVAL_END, v12, "CDMSSUService+SystemEvent enqueue for handling", "", buf, 2u);
        }

        v20 = v25;
      }
      else
      {
        v20 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationInner:assetCollection:block:]";
          _os_log_error_impl(&dword_2263A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting XPC event handling.", buf, 0xCu);
        }
      }
    }
    else
    {
      v16 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationInner:assetCollection:block:]";
        _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to extract app bundle ID from XPC event. Aborting XPC event handling.", buf, 0xCu);
      }
    }
  }
}

void __83__CDMSSUService_SystemEvent__handleXPCEventApplicationInner_assetCollection_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) installedAppProvider];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

+ (void)performFullCacheUpdate:(id)a3 assetCollection:(id)a4 systemState:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "+[CDMSSUService(SystemEvent) performFullCacheUpdate:assetCollection:systemState:]";
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Performing full cache update", buf, 0xCu);
  }

  os_signpost_id_t v12 = [v8 installedAppProvider];

  id v13 = [v12 lookupAllSSUEnabledApps];

  uint64_t v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v13 count];
    *(_DWORD *)buf = 136315394;
    v20 = "+[CDMSSUService(SystemEvent) performFullCacheUpdate:assetCollection:systemState:]";
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps on device", buf, 0x16u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__CDMSSUService_SystemEvent__performFullCacheUpdate_assetCollection_systemState___block_invoke;
  v17[3] = &unk_2647A4800;
  id v18 = v13;
  id v15 = v13;
  [a1 fetchVoiceShortcutsWithMatcher:v10 assetCollection:v9 block:v17];
}

void __81__CDMSSUService_SystemEvent__performFullCacheUpdate_assetCollection_systemState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  char v4 = [a2 performFullCacheUpdateWithUserShortcuts:a3 applicationInfos:v3 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = +[CDMPlatformUtils prettyPrintError:v5];
      *(_DWORD *)buf = 136315394;
      id v10 = "+[CDMSSUService(SystemEvent) performFullCacheUpdate:assetCollection:systemState:]_block_invoke";
      __int16 v11 = 2112;
      os_signpost_id_t v12 = v7;
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to perform full cache update with error: %@.", buf, 0x16u);
    }
  }
}

+ (id)buildSystemStateForSystemEventWithLocale:(id)a3
{
  return (id)[a1 buildSystemStateForServiceStateDirectory:0 locale:a3];
}

+ (void)handleVoiceShortcutsCompletion:(id)a3 voiceShortcuts:(id)a4 voiceShortcutsError:(id)a5 block:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_signpost_id_t v12 = (void (**)(id, void, NSObject *))a6;
  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)CDMLogContext);
  uint64_t v14 = (id)CDMLogContext;
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CDMSSUService+SystemEvent handle user shortcuts completion", "", buf, 2u);
  }

  uint64_t v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "+[CDMSSUService(SystemEvent) handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:]";
    _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Fetch voice shortcuts completion handler called", buf, 0xCu);
  }

  v17 = CDMOSLoggerForCategory(0);
  id v18 = v17;
  if (v10)
  {
    os_signpost_id_t spid = v13;
    unint64_t v33 = v13 - 1;
    id v34 = v11;
    id v35 = v9;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = [v10 count];
      *(_DWORD *)buf = 136315394;
      v42 = "+[CDMSSUService(SystemEvent) handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:]";
      __int16 v43 = 2048;
      uint64_t v44 = v31;
      _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Received %lu voice shortcuts. Extracting identifiers/phrases from these.", buf, 0x16u);
    }

    id v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v25 = objc_alloc(MEMORY[0x263F71FD8]);
          v26 = [v24 identifier];
          v27 = [v24 phrase];
          uint64_t v28 = (void *)[v25 initWithIdentifier:v26 phrase:v27];

          [v18 addObject:v28];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v21);
    }

    id v9 = v35;
    ((void (**)(id, id, NSObject *))v12)[2](v12, v35, v18);
    v29 = (id)CDMLogContext;
    v30 = v29;
    if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v30, OS_SIGNPOST_INTERVAL_END, spid, "CDMSSUService+SystemEvent handle user shortcuts completion", "", buf, 2u);
    }

    id v11 = v34;
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "+[CDMSSUService(SystemEvent) handleVoiceShortcutsCompletion:voiceShortcuts:voiceShortcutsError:block:]";
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v11;
    _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Hit error fetching voice shortcuts: %@. Aborting handling.", buf, 0x16u);
  }
}

+ (void)fetchVoiceShortcutsWithMatcher:(id)a3 assetCollection:(id)a4 block:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "+[CDMSSUService(SystemEvent) fetchVoiceShortcutsWithMatcher:assetCollection:block:]";
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Fetching voice shortcuts", buf, 0xCu);
  }

  os_signpost_id_t v12 = (void *)os_transaction_create();
  os_signpost_id_t v13 = [MEMORY[0x263F85128] standardClient];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__CDMSSUService_SystemEvent__fetchVoiceShortcutsWithMatcher_assetCollection_block___block_invoke;
  v18[3] = &unk_2647A47D8;
  id v22 = v10;
  id v23 = a1;
  id v19 = v9;
  id v20 = v8;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  [v13 getVoiceShortcutsWithCompletion:v18];
}

void __83__CDMSSUService_SystemEvent__fetchVoiceShortcutsWithMatcher_assetCollection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  id v6 = *(void **)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  [v6 handleVoiceShortcutsCompletion:v5 voiceShortcuts:a2 voiceShortcutsError:a3 block:v7];
}

+ (void)handlePostInstall:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "+[CDMSSUService(SystemEvent) handlePostInstall:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling post install event by adding a block to the event queue", buf, 0xCu);
  }

  id v6 = [v4 languageCode];
  uint64_t v7 = [a1 buildSystemStateForSystemEventWithLocale:v6];

  id v8 = [a1 getMatcherWithAssetCollection:v4 systemState:v7];
  id v9 = v8;
  if (v8)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __48__CDMSSUService_SystemEvent__handlePostInstall___block_invoke;
    id v16 = &unk_2647A47B0;
    id v20 = a1;
    id v17 = v8;
    id v10 = v4;
    id v18 = v10;
    id v19 = v7;
    id v11 = _Block_copy(&v13);
    objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v10, v11, v13, v14, v15, v16);

    os_signpost_id_t v12 = v17;
  }
  else
  {
    os_signpost_id_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "+[CDMSSUService(SystemEvent) handlePostInstall:]";
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting post install handling.", buf, 0xCu);
    }
  }
}

void __48__CDMSSUService_SystemEvent__handlePostInstall___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    id v9 = "+[CDMSSUService(SystemEvent) handlePostInstall:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Handling post install event (inner block)", (uint8_t *)&v8, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v4 = (id)CDMLogContext;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "[CDMSSUService+SystemEvent handlePostInstall]", "", (uint8_t *)&v8, 2u);
  }

  [*(id *)(a1 + 56) performFullCacheUpdate:*(void *)(a1 + 32) assetCollection:*(void *)(a1 + 40) systemState:*(void *)(a1 + 48)];
  id v6 = (id)CDMLogContext;
  uint64_t v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "[CDMSSUService+SystemEvent handlePostInstall]", "", (uint8_t *)&v8, 2u);
  }
}

+ (void)handleMaintenanceMode:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "+[CDMSSUService(SystemEvent) handleMaintenanceMode:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling maintenance mode event by adding a block to the event queue", buf, 0xCu);
  }

  id v6 = [v4 languageCode];
  uint64_t v7 = [a1 buildSystemStateForSystemEventWithLocale:v6];

  int v8 = [a1 getMatcherWithAssetCollection:v4 systemState:v7];
  id v9 = v8;
  if (v8)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __52__CDMSSUService_SystemEvent__handleMaintenanceMode___block_invoke;
    id v16 = &unk_2647A47B0;
    id v20 = a1;
    id v17 = v8;
    id v10 = v4;
    id v18 = v10;
    id v19 = v7;
    id v11 = _Block_copy(&v13);
    objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v10, v11, v13, v14, v15, v16);

    os_signpost_id_t v12 = v17;
  }
  else
  {
    os_signpost_id_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "+[CDMSSUService(SystemEvent) handleMaintenanceMode:]";
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting maintanence mode handling.", buf, 0xCu);
    }
  }
}

void __52__CDMSSUService_SystemEvent__handleMaintenanceMode___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    id v9 = "+[CDMSSUService(SystemEvent) handleMaintenanceMode:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Handling maintenance mode event (inner block)", (uint8_t *)&v8, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v4 = (id)CDMLogContext;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "[CDMSSUService+SystemEvent handleMaintenanceMode]", "", (uint8_t *)&v8, 2u);
  }

  [*(id *)(a1 + 56) performFullCacheUpdate:*(void *)(a1 + 32) assetCollection:*(void *)(a1 + 40) systemState:*(void *)(a1 + 48)];
  id v6 = (id)CDMLogContext;
  uint64_t v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "[CDMSSUService+SystemEvent handleMaintenanceMode]", "", (uint8_t *)&v8, 2u);
  }
}

+ (void)handleTrialAssetUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "+[CDMSSUService(SystemEvent) handleTrialAssetUpdate:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling Trial asset update event by adding a block to the event queue", buf, 0xCu);
  }

  id v6 = [v4 languageCode];
  uint64_t v7 = [a1 buildSystemStateForSystemEventWithLocale:v6];

  int v8 = [a1 getMatcherWithAssetCollection:v4 systemState:v7];
  id v9 = v8;
  if (v8)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __53__CDMSSUService_SystemEvent__handleTrialAssetUpdate___block_invoke;
    id v16 = &unk_2647A47B0;
    id v20 = a1;
    id v17 = v8;
    id v10 = v4;
    id v18 = v10;
    id v19 = v7;
    id v11 = _Block_copy(&v13);
    objc_msgSend(a1, "dispatchAsyncWithTransaction:block:", v10, v11, v13, v14, v15, v16);

    os_signpost_id_t v12 = v17;
  }
  else
  {
    os_signpost_id_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "+[CDMSSUService(SystemEvent) handleTrialAssetUpdate:]";
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting Trial asset update handling.", buf, 0xCu);
    }
  }
}

void __53__CDMSSUService_SystemEvent__handleTrialAssetUpdate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    id v9 = "+[CDMSSUService(SystemEvent) handleTrialAssetUpdate:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Handling Trial asset update event (inner block)", (uint8_t *)&v8, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v4 = (id)CDMLogContext;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMSSUService+SystemEvent handle Trial asset update", "", (uint8_t *)&v8, 2u);
  }

  [*(id *)(a1 + 56) performFullCacheUpdate:*(void *)(a1 + 32) assetCollection:*(void *)(a1 + 40) systemState:*(void *)(a1 + 48)];
  id v6 = (id)CDMLogContext;
  uint64_t v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v7, OS_SIGNPOST_INTERVAL_END, v3, "CDMSSUService+SystemEvent handle Trial asset update", "", (uint8_t *)&v8, 2u);
  }
}

+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = (__CFString *)a3;
  id v8 = a4;
  if (+[CDMFeatureFlags isSSUEnableIndexingEnabled])
  {
    if (v7 == @"com.apple.siri.cdm.xpc_activity.maintenance")
    {
      [a1 handleMaintenanceMode:v8];
      goto LABEL_10;
    }
    if (v7 == @"com.apple.siri.cdm.xpc_activity.post_install")
    {
      [a1 handlePostInstall:v8];
      goto LABEL_10;
    }
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      os_signpost_id_t v12 = "+[CDMSSUService(SystemEvent) handleXPCActivity:withAssets:withSelfMetadata:]";
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      uint64_t v10 = "%s [ERR]: Unhandled activity type: %@";
LABEL_12:
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      os_signpost_id_t v12 = "+[CDMSSUService(SystemEvent) handleXPCActivity:withAssets:withSelfMetadata:]";
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      uint64_t v10 = "%s [ERR]: handleXPCActivity:withAssets: called for activity type %ld with SSU indexing FF disabled";
      goto LABEL_12;
    }
  }

LABEL_10:
}

+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (+[CDMFeatureFlags isSSUEnableIndexingEnabled])
  {
    uint64_t v12 = +[XPCStreamEventUtils getXPCEventName:v9];
    if (v12)
    {
      __int16 v13 = v12;
      if ([@"com.apple.notifyd.matching" isEqualToString:v10]
        && (([@"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL" isEqualToString:v13] & 1) != 0
         || [@"com.apple.siri.uaf.com.apple.siri.understanding" isEqualToString:v13]))
      {
        [a1 handleTrialAssetUpdate:v11];
      }
      else if ([@"com.apple.distnoted.matching" isEqualToString:v10] {
             && [@"com.apple.LaunchServices.applicationRegistered" isEqualToString:v13])
      }
      {
        [a1 handleXPCEventApplicationRegistered:v9 assetCollection:v11];
      }
      else if ([@"com.apple.distnoted.matching" isEqualToString:v10] {
             && [@"com.apple.LaunchServices.applicationUnregistered" isEqualToString:v13])
      }
      {
        [a1 handleXPCEventApplicationUnregistered:v9 assetCollection:v11];
      }
      else if ([@"com.apple.notifyd.matching" isEqualToString:v10] {
             && [(id)*MEMORY[0x263F85620] isEqualToString:v13])
      }
      {
        [a1 handleXPCEventShortcutsDatabaseChanged:v11];
      }
      else
      {
        uint64_t v15 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136315650;
          id v17 = "+[CDMSSUService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
          __int16 v18 = 2112;
          id v19 = v10;
          __int16 v20 = 2112;
          id v21 = v13;
          _os_log_error_impl(&dword_2263A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled XPC event with streamName=%@, eventName=%@", (uint8_t *)&v16, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315394;
        id v17 = "+[CDMSSUService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
        __int16 v18 = 2048;
        id v19 = v9;
        _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not extract XPC event name for event %p", (uint8_t *)&v16, 0x16u);
      }

      __int16 v13 = 0;
    }
  }
  else
  {
    __int16 v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315138;
      id v17 = "+[CDMSSUService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s handleXPCEvent:fromStream:withAssets: called with SSU indexing FF disabled", (uint8_t *)&v16, 0xCu);
    }
  }
}

+ (void)handleXPCEventShortcutsDatabaseChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "+[CDMSSUService(SystemEvent) handleXPCEventShortcutsDatabaseChanged:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Handling shortcuts database changed notification", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [v4 languageCode];
  uint64_t v7 = [a1 buildSystemStateForSystemEventWithLocale:v6];

  id v8 = [a1 getMatcherWithAssetCollection:v4 systemState:v7];
  if (v8)
  {
    [a1 fetchVoiceShortcutsWithMatcher:v8 assetCollection:v4 block:&__block_literal_global_382];
  }
  else
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "+[CDMSSUService(SystemEvent) handleXPCEventShortcutsDatabaseChanged:]";
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Could not get matcher. Aborting Trial asset update handling.", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __69__CDMSSUService_SystemEvent__handleXPCEventShortcutsDatabaseChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = 0;
  char v3 = [a2 handleUserShortcutsDatabaseChanged:a3 error:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = +[CDMPlatformUtils prettyPrintError:v4];
      *(_DWORD *)buf = 136315394;
      id v9 = "+[CDMSSUService(SystemEvent) handleXPCEventShortcutsDatabaseChanged:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error handling shortcuts database changed notification: %@.", buf, 0x16u);
    }
  }
}

+ (void)handleXPCEventApplicationUnregistered:(id)a3 assetCollection:(id)a4
{
}

void __84__CDMSSUService_SystemEvent__handleXPCEventApplicationUnregistered_assetCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CDMLogContext;
  id v7 = a3;
  os_signpost_id_t v8 = os_signpost_id_generate(v6);
  id v9 = (id)CDMLogContext;
  __int16 v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "[CDMSSUService+SystemEvent handleXPCEventApplicationUnregistered]", "", buf, 2u);
  }

  id v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationUnregistered:assetCollection:]_block_invoke";
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Handling SSUXPCStreamEventTypeApplicationUnregistered for bundleId: %@", buf, 0x16u);
  }

  id v21 = 0;
  char v12 = [v7 deregisterApp:v5 error:&v21];

  id v13 = v21;
  uint64_t v14 = v13;
  if ((v12 & 1) == 0)
  {
    uint64_t v15 = [v13 code];
    int v16 = CDMOSLoggerForCategory(0);
    id v17 = v16;
    if (v15 == 3)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationUnregistered:assetCollection:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v5;
        _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s App %@ is not registered. Doing nothing.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = +[CDMPlatformUtils prettyPrintError:v14];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationUnregistered:assetCollection:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error deregistering app %@: Error: %@.", buf, 0x20u);
    }
  }
  __int16 v18 = (id)CDMLogContext;
  id v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v19, OS_SIGNPOST_INTERVAL_END, v8, "[CDMSSUService+SystemEvent handleXPCEventApplicationUnregistered]", "", buf, 2u);
  }
}

+ (void)handleXPCEventApplicationRegistered:(id)a3 assetCollection:(id)a4
{
}

void __82__CDMSSUService_SystemEvent__handleXPCEventApplicationRegistered_assetCollection___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = CDMLogContext;
  id v9 = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v8);
  id v11 = (id)CDMLogContext;
  char v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "[CDMSSUService+SystemEvent handleXPCEventApplicationRegistered]", "", buf, 2u);
  }

  id v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationRegistered:assetCollection:]_block_invoke";
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Handling SSUXPCStreamEventTypeApplicationRegistered for bundleId: %@", buf, 0x16u);
  }

  uint64_t v14 = [v9 lookupSSUEnabledAppByBundleId:v7];

  if (v14)
  {
    id v21 = 0;
    char v15 = [v6 registerApp:v14 error:&v21];
    int v16 = v21;
    if ((v15 & 1) == 0)
    {
      id v17 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = +[CDMPlatformUtils prettyPrintError:v16];
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationRegistered:assetCollection:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v7;
        __int16 v26 = 2112;
        v27 = v20;
        _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error registering app %@: Error: %@.", buf, 0x20u);
      }
    }
    __int16 v18 = (id)CDMLogContext;
    id v19 = v18;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v19, OS_SIGNPOST_INTERVAL_END, v10, "[CDMSSUService+SystemEvent handleXPCEventApplicationRegistered]", "", buf, 2u);
    }
  }
  else
  {
    int v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "+[CDMSSUService(SystemEvent) handleXPCEventApplicationRegistered:assetCollection:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Could not lookup SSU app info for the bundle ID: %@. This is likely because the app is not SSU-enabled. Aborting.", buf, 0x16u);
    }
  }
}

+ (id)getSystemEventStreamQueue
{
  if (getSystemEventStreamQueue_once != -1) {
    dispatch_once(&getSystemEventStreamQueue_once, &__block_literal_global_1062);
  }
  uint64_t v2 = (void *)SSUSystemEventStreamQueue;
  return v2;
}

void __55__CDMSSUService_SystemEvent__getSystemEventStreamQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.siri.cdm.CDMSSUService", attr);
  uint64_t v2 = (void *)SSUSystemEventStreamQueue;
  SSUSystemEventStreamQueue = (uint64_t)v1;
}

+ (id)buildMatcherRequestQueue
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  char v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri.cdm.CDMSSUService", v3);

  return v4;
}

+ (id)getCDMServiceAssetConfig
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_alloc_init(CDMServiceAssetConfig);
  os_signpost_id_t v8 = @"ssu_encoder";
  v9[0] = @"com.apple.siri.nl.ssu.encoder";
  char v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  v9[1] = @"com.apple.siri.nl.ssu.datasets";
  v10[0] = v3;
  id v7 = @"ssu_datasets";
  dispatch_queue_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  v10[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v5 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__matcher, 0);
  objc_storeStrong((id *)&self->__systemState, 0);
  objc_storeStrong((id *)&self->__matcherRequestQueue, 0);
}

- (SNLPSSUMatcher)_matcher
{
  return self->__matcher;
}

- (SSUSystemState)_systemState
{
  return self->__systemState;
}

- (OS_dispatch_queue)_matcherRequestQueue
{
  return self->__matcherRequestQueue;
}

- (void)set_matcherRequestTimeoutSec:(double)a3
{
  self->__matcherRequestTimeoutSec = a3;
}

- (double)_matcherRequestTimeoutSec
{
  return self->__matcherRequestTimeoutSec;
}

- (void)forceAppsRescanIfEnabled
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (+[CDMFeatureFlags isSSUCacheUpdateOnEveryRequestEnabled])
  {
    char v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[CDMSSUService forceAppsRescanIfEnabled]";
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Forcing app rescan due to feature flag", buf, 0xCu);
    }

    dispatch_queue_t v4 = [(SSUSystemState *)self->__systemState installedAppProvider];
    id v5 = [v4 lookupAllSSUEnabledApps];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(id *)(*((void *)&v17 + 1) + 8 * v9);
          matcher = self->__matcher;
          id v16 = 0;
          char v12 = [(SNLPSSUMatcher *)matcher registerApp:v10 error:&v16];
          id v13 = v16;
          if ((v12 & 1) == 0)
          {
            uint64_t v14 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              char v15 = +[CDMPlatformUtils prettyPrintError:v13];
              *(_DWORD *)buf = 136315394;
              uint64_t v22 = "-[CDMSSUService forceAppsRescanIfEnabled]";
              __int16 v23 = 2112;
              __int16 v24 = v15;
              _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to register app: %@. We will continue processing, despite this failure.", buf, 0x16u);
            }
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

- (void)forceFullCacheUpdateIfEnabled
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (+[CDMFeatureFlags isSSUCacheUpdateOnEveryRequestEnabled])
  {
    char v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      char v15 = "-[CDMSSUService forceFullCacheUpdateIfEnabled]";
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Forcing full cache update due to feature flag", buf, 0xCu);
    }

    dispatch_queue_t v4 = [(SSUSystemState *)self->__systemState installedAppProvider];
    id v5 = [v4 lookupAllSSUEnabledApps];

    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v5 count];
      *(_DWORD *)buf = 136315394;
      char v15 = "-[CDMSSUService forceFullCacheUpdateIfEnabled]";
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps on device", buf, 0x16u);
    }

    matcher = self->__matcher;
    id v13 = 0;
    char v8 = [(SNLPSSUMatcher *)matcher performFullCacheUpdate:v5 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      id v10 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v12 = +[CDMPlatformUtils prettyPrintError:v9];
        *(_DWORD *)buf = 136315394;
        char v15 = "-[CDMSSUService forceFullCacheUpdateIfEnabled]";
        __int16 v16 = 2112;
        uint64_t v17 = (uint64_t)v12;
        _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to perform full cache update with error: %@. We will continue processing, despite this failure.", buf, 0x16u);
      }
    }
  }
}

- (void)performAppRescanForSandboxInstalledApps
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v3 = [(SSUSystemState *)self->__systemState installedAppProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v24 = "-[CDMSSUService performAppRescanForSandboxInstalledApps]";
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Performing app rescan due to service state directory apps", buf, 0xCu);
    }

    id v6 = [(SSUSystemState *)self->__systemState installedAppProvider];
    uint64_t v7 = [v6 lookupAllSSUEnabledApps];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(id *)(*((void *)&v19 + 1) + 8 * v11);
          matcher = self->__matcher;
          id v18 = 0;
          char v14 = [(SNLPSSUMatcher *)matcher registerApp:v12 error:&v18];
          id v15 = v18;
          if ((v14 & 1) == 0)
          {
            __int16 v16 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v17 = +[CDMPlatformUtils prettyPrintError:v15];
              *(_DWORD *)buf = 136315394;
              __int16 v24 = "-[CDMSSUService performAppRescanForSandboxInstalledApps]";
              __int16 v25 = 2112;
              uint64_t v26 = v17;
              _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to register app: %@. We will continue processing, despite this failure.", buf, 0x16u);
            }
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v9);
    }
  }
}

- (id)failSetupWithErrorDescription:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->super.super._serviceState = 4;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[CDMSSUService failSetupWithErrorDescription:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Aborting [CDMSSUService setup:] due to error: %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(CDMBaseService *)self createSetupResponseCommand];
  uint64_t v7 = [(CDMBaseService *)self createErrorWithCode:4 description:v4];
  [v6 setCmdError:v7];

  return v6;
}

- (id)errorSetupWithErrorDescription:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->super.super._serviceState = 3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[CDMSSUService errorSetupWithErrorDescription:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error [CDMSSUService setup:] due to error: %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(CDMBaseService *)self createSetupResponseCommand];
  uint64_t v7 = [(CDMBaseService *)self createErrorWithCode:4 description:v4];
  [v6 setCmdError:v7];

  return v6;
}

- (id)abortHandleWithErrorCode:(int64_t)a3 description:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315394;
    id v12 = "-[CDMSSUService abortHandleWithErrorCode:description:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Aborting [CDMSSUService handle:] due to error: %@", (uint8_t *)&v11, 0x16u);
  }

  id v8 = [(CDMBaseService *)self createErrorWithCode:a3 description:v6];
  int v9 = [[CDMSSUResponseCommand alloc] initWithCmdError:v8];

  return v9;
}

- (BOOL)executeMatcherRequestBlockWithTimeout:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __55__CDMSSUService_executeMatcherRequestBlockWithTimeout___block_invoke;
  v9[3] = &unk_2647A4ED8;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async((dispatch_queue_t)self->__matcherRequestQueue, v6);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(self->__matcherRequestTimeoutSec * 1000000000.0));
  LOBYTE(self) = dispatch_block_wait(v6, v7) != 0;

  return (char)self;
}

uint64_t __55__CDMSSUService_executeMatcherRequestBlockWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _matcherRequestQueue];
  dispatch_assert_queue_V2(v2);

  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (id)setup:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v35 = "-[CDMSSUService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Running [CDMSSUService setup:]", buf, 0xCu);
  }

  dispatch_block_t v6 = [v4 dynamicConfig];
  dispatch_time_t v7 = [v6 graphName];
  id v8 = (objc_class *)objc_opt_class();
  int v9 = NSStringFromClass(v8);
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    int v11 = [v4 dynamicConfig];
    id v12 = [v11 languageCode];
    +[CDMUAFAssetsManager subscribeToSsuAssetsForLocale:v12];
  }
  self->__matcherRequestTimeoutSec = 0.5;
  __int16 v13 = [(id)objc_opt_class() buildMatcherRequestQueue];
  matcherRequestQueue = self->__matcherRequestQueue;
  self->__matcherRequestQueue = v13;

  uint64_t v15 = objc_opt_class();
  __int16 v16 = [v4 dynamicConfig];
  uint64_t v17 = [v16 serviceStateDirectory];
  id v18 = [v4 dynamicConfig];
  long long v19 = [v18 languageCode];
  long long v20 = [v15 buildSystemStateForServiceStateDirectory:v17 locale:v19];
  systemState = self->__systemState;
  self->__systemState = v20;

  long long v22 = objc_opt_class();
  __int16 v23 = [v4 dynamicConfig];
  __int16 v24 = [v23 assetCollection];
  __int16 v25 = self->__systemState;
  id v33 = 0;
  uint64_t v26 = [v22 acquireOrBuildMatcher:v24 systemState:v25 error:&v33];
  id v27 = v33;

  if (v26)
  {
    objc_storeStrong((id *)&self->__matcher, v26);
    [(CDMSSUService *)self forceFullCacheUpdateIfEnabled];
    [(CDMSSUService *)self performAppRescanForSandboxInstalledApps];
    self->super.super._serviceState = 2;
    uint64_t v28 = [(CDMBaseService *)self createSetupResponseCommand];
  }
  else
  {
    v29 = NSString;
    v30 = +[CDMPlatformUtils prettyPrintError:v27];
    uint64_t v31 = [v29 stringWithFormat:@"Could not acquire/build SNLPSSUMatcher instance: %@", v30];

    if (v10) {
      [(CDMSSUService *)self errorSetupWithErrorDescription:v31];
    }
    else {
    uint64_t v28 = [(CDMSSUService *)self failSetupWithErrorDescription:v31];
    }
  }
  return v28;
}

- (id)handle:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CDMSSUService handle:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Running [CDMSSUService handle:]", (uint8_t *)&buf, 0xCu);
  }

  if (self->super.super._serviceState != 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Cannot handle request since CDMSSUService is in non-READY state: %tu", self->super.super._serviceState);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    int v11 = [(CDMSSUService *)self abortHandleWithErrorCode:1 description:v8];
    goto LABEL_22;
  }
  dispatch_block_t v6 = [v4 parserRequest];
  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    uint64_t v33 = 0;
    id v7 = +[CDMNluLogUtil writeSSURequestToDisk:v6 error:&v33];
  }
  [(CDMSSUService *)self forceAppsRescanIfEnabled];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2707;
  v41 = __Block_byref_object_dispose__2708;
  id v42 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2707;
  uint64_t v31 = __Block_byref_object_dispose__2708;
  id v32 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__CDMSSUService_handle___block_invoke;
  aBlock[3] = &unk_2647A49A0;
  p_long long buf = &buf;
  aBlock[4] = self;
  id v8 = v6;
  id v24 = v8;
  uint64_t v26 = &v27;
  int v9 = (void (**)(void))_Block_copy(aBlock);
  if (+[CDMUserDefaultsUtils isSSURequestTimeoutDisabled])
  {
    int v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v34 = 136315138;
      id v35 = "-[CDMSSUService handle:]";
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Executing [CDMSSUService handle] without a timeout because user defaults flag is enabled.", v34, 0xCu);
    }

    v9[2](v9);
  }
  else if ([(CDMSSUService *)self executeMatcherRequestBlockWithTimeout:v9])
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double matcherRequestTimeoutSec = self->__matcherRequestTimeoutSec;
      *(_DWORD *)id v34 = 136315394;
      id v35 = "-[CDMSSUService handle:]";
      __int16 v36 = 2048;
      double v37 = matcherRequestTimeoutSec;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: The call to [SNLPSSUMatcher responseForRequest:error:] timed out after %f seconds. Returning empty parse list.", v34, 0x16u);
    }

    id v13 = objc_alloc_init(MEMORY[0x263F71F00]);
    id v14 = [[CDMSSUResponseCommand alloc] initWithSSUResponse:v13];
    goto LABEL_20;
  }
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
      uint64_t v22 = 0;
      id v16 = +[CDMNluLogUtil writeSSUResponseToDisk:v15 error:&v22];
    }
    uint64_t v17 = [CDMSSUResponseCommand alloc];
    int v11 = [(CDMSSUResponseCommand *)v17 initWithSSUResponse:*(void *)(*((void *)&buf + 1) + 40)];
    goto LABEL_21;
  }
  id v18 = NSString;
  long long v19 = +[CDMPlatformUtils prettyPrintError:v28[5]];
  id v13 = [v18 stringWithFormat:@"Cannot handle request since the underlying SNLPSSUMatcher instance encountered an error: %@", v19];

  id v14 = [(CDMSSUService *)self abortHandleWithErrorCode:4 description:v13];
LABEL_20:
  int v11 = v14;

LABEL_21:
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
LABEL_22:

  return v11;
}

void __24__CDMSSUService_handle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _matcher];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 responseForRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)buildDeviceSystemStateLocale:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(SSUCacheDirectoryProviderDevice);
  uint64_t v5 = [[SSUInstalledAppProviderDevice alloc] initWithLocale:v3];

  uint64_t v6 = [[SSUSystemState alloc] initWithCacheDirectoryProviderDevice:v4 installedAppProviderDevice:v5];
  return v6;
}

+ (id)buildSystemStateForSsuSandboxDirectories:(id)a3 locale:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [SSUInstalledAppProviderSandbox alloc];
  id v8 = [v5 installedAppsDirectoryURL];
  int v9 = [(SSUInstalledAppProviderSandbox *)v7 initWithDirectory:v8 locale:v6];

  int v10 = [v5 cacheDirectoryURL];

  int v11 = CDMOSLoggerForCategory(0);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
    {
      int v19 = 136315138;
      long long v20 = "+[CDMSSUService(SystemState) buildSystemStateForSsuSandboxDirectories:locale:]";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Using SSU service state directory cache subdirectory via SSUCacheDirectoryProviderSandbox", (uint8_t *)&v19, 0xCu);
    }

    id v13 = [SSUCacheDirectoryProviderSandbox alloc];
    id v14 = [v5 cacheDirectoryURL];
    uint64_t v15 = [(SSUCacheDirectoryProviderSandbox *)v13 initWithDirectory:v14];

    id v16 = [[SSUSystemState alloc] initWithCacheDirectoryProviderSandbox:v15 installedAppProviderSandbox:v9];
  }
  else
  {
    if (v12)
    {
      int v19 = 136315138;
      long long v20 = "+[CDMSSUService(SystemState) buildSystemStateForSsuSandboxDirectories:locale:]";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Using temporary cache directory", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v15 = objc_alloc_init(SSUCacheDirectoryProviderTemporary);
    id v16 = [[SSUSystemState alloc] initWithCacheDirectoryProviderTemporary:v15 installedAppProviderSandbox:v9];
  }
  uint64_t v17 = v16;

  return v17;
}

+ (id)lookupSSUSandboxDirectories:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = (__CFString *)a3;
  char v27 = 0;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v27];

  if (v5) {
    BOOL v6 = v27 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v10 = [(__CFString *)v3 stringByAppendingPathComponent:v9];
    char v26 = 0;
    int v11 = [MEMORY[0x263F08850] defaultManager];
    char v12 = [v11 fileExistsAtPath:v10 isDirectory:&v26];

    if (v12)
    {
      if (v26)
      {
        id v13 = [v10 stringByAppendingPathComponent:@"installed_apps"];
        char v25 = 0;
        id v14 = [MEMORY[0x263F08850] defaultManager];
        int v15 = [v14 fileExistsAtPath:v13 isDirectory:&v25];

        if (!v15 || !v25)
        {
          id v16 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315650;
            uint64_t v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
            __int16 v30 = 2112;
            uint64_t v31 = v10;
            __int16 v32 = 2112;
            uint64_t v33 = @"installed_apps";
            _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory %@ folder does not have a %@ subdirectory. Ignoring service state directory and falling back on device state.", buf, 0x20u);
          }
          id v7 = 0;
          goto LABEL_32;
        }
        id v16 = [v10 stringByAppendingPathComponent:@"cache"];
        char v24 = 0;
        uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
        int v18 = [v17 fileExistsAtPath:v16 isDirectory:&v24];

        if (v18)
        {
          if (v24)
          {
            int v19 = [NSURL fileURLWithPath:v16];
LABEL_31:
            id v7 = objc_alloc_init(SSUSandboxDirectories);
            uint64_t v22 = [NSURL fileURLWithPath:v13];
            [(SSUSandboxDirectories *)v7 setInstalledAppsDirectoryURL:v22];

            [(SSUSandboxDirectories *)v7 setCacheDirectoryURL:v19];
LABEL_32:

            goto LABEL_33;
          }
          uint64_t v21 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315650;
            uint64_t v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
            __int16 v30 = 2112;
            uint64_t v31 = v10;
            __int16 v32 = 2112;
            uint64_t v33 = @"cache";
            _os_log_error_impl(&dword_2263A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory %@ folder has a non-folder cache subdirectory %@. Ignoring it.", buf, 0x20u);
          }
        }
        else
        {
          long long v20 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
            _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Optional SSU cache subdirectory does not exist in the service state directory", buf, 0xCu);
          }
        }
        int v19 = 0;
        goto LABEL_31;
      }
      id v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
        __int16 v30 = 2112;
        uint64_t v31 = v10;
        _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory has a non-directory file: %@. Ignoring service state directory and falling back on device state.", buf, 0x16u);
      }
    }
    else
    {
      id v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315650;
        uint64_t v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
        __int16 v30 = 2112;
        uint64_t v31 = v9;
        __int16 v32 = 2112;
        uint64_t v33 = v3;
        _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s The given service state directory does not contain a %@ subdirectory: %@. Ignoring service state directory and falling back on device state.", buf, 0x20u);
      }
    }
    id v7 = 0;
LABEL_33:

    goto LABEL_34;
  }
  int v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v29 = "+[CDMSSUService(SystemState) lookupSSUSandboxDirectories:]";
    __int16 v30 = 2112;
    uint64_t v31 = v3;
    _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: The given service state directory does not exist or is not a directory: %@. Ignoring service state directory and falling back on device state.", buf, 0x16u);
  }
  id v7 = 0;
LABEL_34:

  return v7;
}

+ (id)buildSystemStateForServiceStateDirectory:(id)a3 locale:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_8;
  }
  id v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    id v16 = "+[CDMSSUService(SystemState) buildSystemStateForServiceStateDirectory:locale:]";
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Service state directory supplied: looking for CDMSSUService subdirectory", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v9 = [a1 lookupSSUSandboxDirectories:v6];
  if (v9)
  {
    int v10 = (void *)v9;
    int v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      id v16 = "+[CDMSSUService(SystemState) buildSystemStateForServiceStateDirectory:locale:]";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Building SSU system state from sandbox directories", (uint8_t *)&v15, 0xCu);
    }

    char v12 = [a1 buildSystemStateForSsuSandboxDirectories:v10 locale:v7];
  }
  else
  {
LABEL_8:
    id v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      id v16 = "+[CDMSSUService(SystemState) buildSystemStateForServiceStateDirectory:locale:]";
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Building device SSU system state", (uint8_t *)&v15, 0xCu);
    }

    char v12 = [a1 buildDeviceSystemStateLocale:v7];
  }

  return v12;
}

+ (id)getAssetsDirectory:(id)a3 factorName:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [a3 getAssetBundlePathForFactorName:v8];
  if (v9)
  {
    int v10 = [a1 assetDirectoryURLForServiceAssetBundle:v9];
    if (v10)
    {
      id v11 = v10;
      char v12 = v11;
    }
    else
    {
      id v16 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        char v25 = "+[CDMSSUService(Matcher) getAssetsDirectory:factorName:error:]";
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to get asset directory URL for factor: %@", buf, 0x16u);
      }

      if (a5)
      {
        uint64_t v17 = *MEMORY[0x263F08338];
        v20[0] = *MEMORY[0x263F08320];
        v20[1] = v17;
        v21[0] = @"Could not acquire/build SNLPSSUMatcher instance.";
        v21[1] = @"Could not find SSU assets directory inside asset bundle";
        int v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"CDMSSUServiceMatcherErrorDomain" code:1 userInfo:v18];
      }
      id v11 = 0;
      char v12 = 0;
    }
    goto LABEL_13;
  }
  id v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    char v25 = "+[CDMSSUService(Matcher) getAssetsDirectory:factorName:error:]";
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to get asset bundle for factor: %@", buf, 0x16u);
  }

  if (a5)
  {
    uint64_t v14 = *MEMORY[0x263F08338];
    v22[0] = *MEMORY[0x263F08320];
    v22[1] = v14;
    v23[0] = @"Could not acquire/build SNLPSSUMatcher instance.";
    int v15 = [NSString stringWithFormat:@"Could not find SSU service asset bundle for factor %@", v8];
    v23[1] = v15;
    id v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    [MEMORY[0x263F087E8] errorWithDomain:@"CDMSSUServiceMatcherErrorDomain" code:1 userInfo:v11];
    char v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  char v12 = 0;
LABEL_14:

  return v12;
}

+ (id)assetDirectoryURLForServiceAssetBundle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 resourcePath];
  char v11 = 0;
  int v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v11];

  if (v11) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  if (v7)
  {
    id v8 = [NSURL fileURLWithPath:v4 isDirectory:1];
  }
  else
  {
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "+[CDMSSUService(Matcher) assetDirectoryURLForServiceAssetBundle:]";
      __int16 v14 = 2112;
      int v15 = v4;
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: SSU assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)acquireOrBuildMatcher:(id)a3 systemState:(id)a4 error:(id *)a5
{
  v27[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = [a1 getAssetsDirectory:v8 factorName:@"com.apple.siri.nl.ssu.encoder" error:a5];
  uint64_t v11 = [a1 getAssetsDirectory:v8 factorName:@"com.apple.siri.nl.ssu.datasets" error:a5];
  char v12 = (void *)v11;
  id v13 = 0;
  if (v10 && v11)
  {
    __int16 v14 = [v9 cacheDirectoryProvider];
    id v25 = 0;
    int v15 = [v14 lookupOrCreateCacheDirectory:&v25];
    id v16 = v25;

    if (v15)
    {
      uint64_t v17 = +[SSUMatcherBuilder sharedBuilder];
      int v18 = [[SSUMatcherBuildParams alloc] initWithModelAssetsDirectoryURL:v10 datasetAssetsDirectoryURL:v12 cacheDirectoryURL:v15];
      id v13 = [v17 getMatcherForBuildParams:v18 error:a5];
    }
    else
    {
      if (!a5)
      {
        id v13 = 0;
        goto LABEL_8;
      }
      uint64_t v19 = *MEMORY[0x263F08320];
      v27[0] = @"Could not acquire/build SNLPSSUMatcher instance.";
      uint64_t v20 = *MEMORY[0x263F08338];
      v26[0] = v19;
      v26[1] = v20;
      uint64_t v21 = NSString;
      uint64_t v22 = +[CDMPlatformUtils prettyPrintError:v16];
      __int16 v23 = [v21 stringWithFormat:@"Could not lookup/create SSU cache directory: %@", v22];
      v27[1] = v23;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

      [MEMORY[0x263F087E8] errorWithDomain:@"CDMSSUServiceMatcherErrorDomain" code:1 userInfo:v17];
      id v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
  }

  return v13;
}

@end
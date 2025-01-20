@interface ATXInitializeInOwnerProcess
@end

@implementation ATXInitializeInOwnerProcess

void ___ATXInitializeInOwnerProcess_block_invoke()
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v2 = dispatch_queue_create("deferredInit", v1);

  [MEMORY[0x1E4F25550] setPredicatePropertyLoadMode:2];
  id v3 = +[ATXPrivacyReset sharedInstance];
  [MEMORY[0x1E4F4B650] createDirectoriesIfNeeded];
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_368];
    char v4 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
    if (_ATXDECBackupNeedsRestoring(v5))
    {
      v6 = __atxlog_handle_backup();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Taking old backup path", buf, 2u);
      }

      v7 = [v5 stringByAppendingPathComponent:@"Backups/AppPredictionExpert"];
      int v8 = _ATXExtractFilesFromDECBackupArchiveIfExists(v7, v5);
      char v4 = v8;
      if (v8)
      {
        v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v9 removeItemAtPath:v7 error:0];

        v10 = __atxlog_handle_backup();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Restored old backup", buf, 2u);
        }
      }
    }
    else
    {
      v11 = +[ATXBackupService backupService];
      [v11 restoreFromBackupIfNeccessary:&__block_literal_global_373];

      char v4 = 0;
    }
  }
  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v14 = [v13 stringByAppendingPathComponent:@"restore_finished"];
  int v15 = [v12 fileExistsAtPath:v14];

  if (v15)
  {
    v16 = __atxlog_handle_backup();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "already restored, not registering for restore state notifications", buf, 2u);
    }
  }
  else
  {
    if (!registerForRestoreStateNotifications_mobileBackup)
    {
      registerForRestoreStateNotifications_mobileBackup = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileBackup.framework/MobileBackup", 1);
      if (!registerForRestoreStateNotifications_mobileBackup)
      {
        v17 = __atxlog_handle_backup();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          ___ATXInitializeInOwnerProcess_block_invoke_cold_1();
        }
      }
    }
    v16 = restoreStateQueue();
    dispatch_async(v16, &__block_literal_global_463);
  }

  v18 = (void *)*MEMORY[0x1E4F14158];
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.apppredictionupdate", (void *)*MEMORY[0x1E4F14158], &__block_literal_global_472);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.atxbackupnow", v18, &__block_literal_global_475);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.atxbackup", v18, &__block_literal_global_487);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.atxtrain", v18, &__block_literal_global_493);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.action.timeestimate", v18, &__block_literal_global_495);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.everydayshortcuts", v18, &__block_literal_global_498);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.everydayshortcuts-trigger", v18, &__block_literal_global_502);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.dailyroutines", v18, &__block_literal_global_504);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.dailyroutines-trigger", v18, &__block_literal_global_507);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.updateAssetMetadata", v18, &__block_literal_global_510);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.magicalmoments", v18, &__block_literal_global_514);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.anchormodeldataharvesting", v18, &__block_literal_global_517);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.anchormodeltraining", v18, &__block_literal_global_522);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.biome-ui-feedback-result-stream-writing", v18, &__block_literal_global_526);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.mode-entity-model-training", v18, &__block_literal_global_530);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.mode-setup-prediction-training", v18, &__block_literal_global_534);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.urgency-tuning-global-metrics-logging", v18, &__block_literal_global_538);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.periodiclog", v18, &__block_literal_global_542);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.infoStorePeriodicCleanup", v18, &__block_literal_global_548);
  atxRegisterCTSJobHandlerForNonClassCLocked((const char *)[@"com.apple.duetexpertd.appdirectory" UTF8String], v18, &__block_literal_global_554);
  atxRegisterCTSJobHandler((const char *)[@"com.apple.duetexpertd.appdirectorylogging" UTF8String], v18, &__block_literal_global_559);
  v19 = (void *)MEMORY[0x1E4F5B6E8];
  v20 = [MEMORY[0x1E4F5B6B8] keyPathForFirstWakeupStatus];
  v21 = [v19 predicateForKeyPath:v20 equalToValue:&unk_1F27F0CF0 withMinimumDurationInPreviousState:14400.0];

  v22 = [MEMORY[0x1E4F5B6C8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.information.userWakeUp" contextualPredicate:v21 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:&__block_literal_global_563];
  v23 = [MEMORY[0x1E4F5B6A8] userContext];
  [v23 registerCallback:v22];

  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.timelinerelevance", v18, &__block_literal_global_574);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.tl_prediction", v18, &__block_literal_global_577);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.cardSuggestionClientCacheCleanup", v18, &__block_literal_global_583);
  id v24 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v25 = (void *)[v24 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v26 = [v25 integerForKey:*MEMORY[0x1E4F4B5F0]];
  if (v26 < 1)
  {
    atxRegisterCTSJobHandlerForNonClassCLocked((const char *)[@"com.apple.duetexpertd.defaultwidgetsuggester" UTF8String], v18, &__block_literal_global_588);
  }
  else
  {
    uint64_t v27 = v26;
    v28 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v60 = v27;
      _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "No longer running ATXDefaultWidgetSuggester CTS job due to feedback: %ld", buf, 0xCu);
    }
  }
  atxRegisterCTSJobHandler("com.apple.duetexpertd.widgetonboarding", v18, &__block_literal_global_591);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.biomepruning", v18, &__block_literal_global_599);
  atxRegisterCTSJobHandler((const char *)[@"com.apple.duetexpertd.focusMetricsLogging" UTF8String], v18, &__block_literal_global_605);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.homescreenlogging", v18, &__block_literal_global_610);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.nPlusOneStudyLogging", v18, &__block_literal_global_614);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.blendingbiomestreamlogging", v18, &__block_literal_global_618);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.blendingfeedbackmetricslogging", v18, &__block_literal_global_622);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.refreshfacesuggestions", v18, &__block_literal_global_627);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.collectlockscreenmetrics", v18, &__block_literal_global_634);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.collectzkwmetrics", v18, &__block_literal_global_638);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.verticalmodelstraining", v18, &__block_literal_global_642);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.modelscoreharvesting", v18, &__block_literal_global_646);
  atxRegisterCTSJobHandlerForNonClassCLocked((const char *)[@"com.apple.duetexpertd.updateInferredModeBiomeStream" UTF8String], v18, &__block_literal_global_652);
  atxRegisterCTSJobHandlerForNonClassCLocked((const char *)[@"com.apple.duetexpertd.updateSuggestedPages" UTF8String], v18, &__block_literal_global_658);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.blending-shadow-logging", v18, &__block_literal_global_661);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.logModeActivityMetrics", v18, &__block_literal_global_665);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.logNotificationDigestMetrics", v18, &__block_literal_global_668);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.logDigestGlobalNotificationFeedback", v18, &__block_literal_global_672);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.pruneNotificationSuggestionDatastore", v18, &__block_literal_global_676);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.pruneNotificationsBasedOnHardLimits", v18, &__block_literal_global_681);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.pruneSuggestionsBasedOnHardLimits", v18, &__block_literal_global_684);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.analyzeNotificationsAndSuggestionsDatabase", v18, &__block_literal_global_687);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.notificationAndSuggestionDatastorePerfMetricsLogging", v18, &__block_literal_global_690);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.datastoremaintenance", v18, &__block_literal_global_693);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.activitySuggestionFeedbackProcessing", v18, &__block_literal_global_697);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.homeScreenModificationMetricsLogger", v18, &__block_literal_global_701);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.ambientmetrics", v18, &__block_literal_global_705);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.timelinedonationspruning", v18, &__block_literal_global_710);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)languagePrefChanged, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v30 = (void *)MEMORY[0x1E4F93B10];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = ___ATXInitializeInOwnerProcess_block_invoke_380;
  v57[3] = &unk_1E68AB818;
  v31 = v2;
  v58 = v31;
  [v30 runBlockWhenDeviceIsClassCUnlocked:v57];
  v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v33 = (id)[v32 addObserverForName:*MEMORY[0x1E4F4B570] object:0 queue:0 usingBlock:&__block_literal_global_400];

  v34 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v35 = (id)[v34 addObserverForName:*MEMORY[0x1E4F5ACD0] object:0 queue:0 usingBlock:&__block_literal_global_405];

  dispatch_async(v31, &__block_literal_global_409);
  PMMInitializeInOwnerProcess();
  id v36 = +[ATXServer sharedInstance];
  id v37 = +[ATXActionPredictionServer sharedInstance];
  if (_PASIsInternalDevice()) {
    id v38 = +[ATXModeAutomationSuggestionTester sharedInstance];
  }
  [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_415];
  [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlockedWithQoS:25 block:&__block_literal_global_438];
  id v39 = +[ATXWifiStateMonitor sharedInstance];
  v40 = [MEMORY[0x1E4F28CB8] defaultManager];
  v41 = restoreStateFinishedPath();
  if ([v40 fileExistsAtPath:v41])
  {
    BOOL v42 = +[ATXBackupService isBackupRestore];

    if (!v42)
    {
      v43 = __atxlog_handle_backup();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_DEFAULT, "Scheduling app directory update after restore", buf, 2u);
      }

      [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_448];
    }
  }
  else
  {
  }
  v44 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v45 = [v44 stringByAppendingPathComponent:@"restored"];

  if ((v4 & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v46 = objc_claimAutoreleasedReturnValue(),
        int v47 = [v46 fileExistsAtPath:v45],
        v46,
        v47))
  {
    v48 = __atxlog_handle_backup();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v48, OS_LOG_TYPE_DEFAULT, "Restore marker seen, updating predictions immediately", buf, 2u);
    }

    v49 = __atxlog_handle_backup();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v50 = +[ATXBackupService isBackupRestore];
      *(_DWORD *)buf = 67109120;
      LODWORD(v60) = v50;
      _os_log_impl(&dword_1D0FA3000, v49, OS_LOG_TYPE_DEFAULT, "Scheduling app directory update after restore (based on ATXBackupService marker); isBackupRestore=%{BOOL}d",
        buf,
        8u);
    }

    v51 = (void *)MEMORY[0x1E4F93B10];
    uint64_t v52 = MEMORY[0x1E4F143A8];
    uint64_t v53 = 3221225472;
    v54 = ___ATXInitializeInOwnerProcess_block_invoke_449;
    v55 = &unk_1E68AB818;
    id v56 = v45;
    [v51 runBlockWhenDeviceIsClassCUnlocked:&v52];
  }
  objc_msgSend(MEMORY[0x1E4F93B10], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_453, v52, v53, v54, v55);
}

uint64_t ___ATXInitializeInOwnerProcess_block_invoke_2()
{
  v0 = __atxlog_handle_backup();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v2 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Unlock seen. Checking for restore.", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void ___ATXInitializeInOwnerProcess_block_invoke_370(uint64_t a1, int a2)
{
  id v3 = __atxlog_handle_backup();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Restored new style backup. Restarting process...", buf, 2u);
    }

    v5 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
    uint64_t v6 = [v5 stringByAppendingPathComponent:@"restored"];

    v7 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
    uint64_t v8 = [v7 stringByAppendingPathComponent:@"restore_finished"];

    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 createFileAtPath:v6 contents:0 attributes:0];

    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v10 createFileAtPath:v8 contents:0 attributes:0];

    exit(0);
  }
  if (v4)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Didn't restore new style backup", v11, 2u);
  }
}

void ___ATXInitializeInOwnerProcess_block_invoke_380(uint64_t a1)
{
  ATXEnableMobileAssetDataVault();
  id v2 = +[ATXHeuristicActionProducer sharedInstance];
  id v3 = +[ATXIntentMetadataCache sharedInstance];
  id v4 = +[_ATXAppPredictor sharedInstance];
  id v5 = +[_ATXFeedback sharedInstance];
  id v6 = +[ATXUpdatePredictionsManager sharedInstance];
  dispatch_time_t v7 = dispatch_time(0, 100000000);
  dispatch_after(v7, *(dispatch_queue_t *)(a1 + 32), &__block_literal_global_388);
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = (id)[v9 addObserverForName:*MEMORY[0x1E4F4B548] object:0 queue:0 usingBlock:&__block_literal_global_395];
}

void ___ATXInitializeInOwnerProcess_block_invoke_2_386()
{
  id v0 = +[ATXDigitalHealthBlacklist sharedInstance];
  id v1 = (id)[MEMORY[0x1E4F4B430] sharedInstance];
  id v2 = [MEMORY[0x1E4F4B428] sharedInstance];
  [v2 refreshWithCompletion:0];
}

void ___ATXInitializeInOwnerProcess_block_invoke_3()
{
  id v3 = [MEMORY[0x1E4F4B430] sharedInstance];
  id v0 = [v3 fetchHomeScreenWidgetDescriptorMetadataWithError:0];
  if (v0)
  {
    id v1 = ATXSharedDefaultHomeScreenItemUpdater();
    id v2 = [v3 homeScreenDescriptors];
    [v1 updateDefaultsWithSystemDescriptors:v2 installDatesCache:v0 reason:@"Descriptor change"];
  }
}

uint64_t ___ATXInitializeInOwnerProcess_block_invoke_4()
{
  return [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_402];
}

void ___ATXInitializeInOwnerProcess_block_invoke_5()
{
  ATXSharedDefaultHomeScreenItemUpdater();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 updateDefaultsDueToRelevantHomeScreenConfigUpdate];
}

uint64_t ___ATXInitializeInOwnerProcess_block_invoke_6()
{
  return [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_407];
}

void ___ATXInitializeInOwnerProcess_block_invoke_7()
{
  ATXSharedDefaultHomeScreenItemUpdater();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 updateDefaultsDueToAmbientConfigUpdate];
}

id ___ATXInitializeInOwnerProcess_block_invoke_8()
{
  return +[_ATXInspectionServer sharedInstance];
}

id ___ATXInitializeInOwnerProcess_block_invoke_9()
{
  id v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ___ATXInitializeInOwnerProcess_block_invoke_9_cold_1();
  }

  id v1 = +[ATXMagicalMomentsAppPredictor sharedInstance];
  id v2 = +[ATXClientModelSuggestionReceiver sharedInstance];
  [v2 start];

  id v3 = +[ATXActionPredictionServer sharedInstance];
  id v4 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v5 = [v4 blendingLayerServer];
  [v3 registerForRealTimeRequestsWithBlendingLayerServer:v5];

  id v6 = +[ATXModeAnchorModelSuggestionClient sharedInstance];
  id v7 = +[ATXNotificationsLoggingServer sharedInstance];
  id v8 = +[ATXActionNotificationServer sharedInstance];
  id v9 = +[ATXInfoSuggestionServer sharedInstance];
  id v10 = +[ATXContextHeuristicsServer sharedInstance];
  id v11 = +[ATXModeEntityScorerServer sharedInstance];
  id v12 = +[ATXSmartActivationEarlyExitDetectionLogger sharedInstance];
  id v13 = +[ATXNotificationDigestRankerServer sharedInstance];
  id v14 = +[ATXUserEducationSuggestionServer sharedInstance];
  id v15 = +[ATXContextualEngine sharedInstance];
  v16 = +[ATXAnchorModelInferenceEngine sharedInstance];
  [v16 start];

  id v17 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v18 = *MEMORY[0x1E4F4B688];
  v19 = (void *)[v17 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  if ([v19 BOOLForKey:@"ATXInitializationLanguageChangeDirty"])
  {
    v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v54) = 0;
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "Language change detected upon process start - updating predictions once and immediately", (uint8_t *)&v54, 2u);
    }

    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    id v56 = __updatePredictionsIfLanguageChanged_block_invoke;
    v57 = &unk_1E68AB818;
    id v58 = v19;
    dispatch_async(MEMORY[0x1E4F14428], &v54);
  }
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v18];
  uint64_t v22 = *MEMORY[0x1E4F4B700];
  v23 = [v21 objectForKey:*MEMORY[0x1E4F4B700]];

  if (!v23)
  {
    id v24 = [MEMORY[0x1E4F1C9C8] now];
    [v21 setObject:v24 forKey:v22];
    if ([v21 BOOLForKey:*MEMORY[0x1E4F4B6A8]])
    {
      [v21 setObject:v24 forKey:*MEMORY[0x1E4F4B6A0]];
      id v25 = objc_alloc_init(MEMORY[0x1E4F4B078]);
      int v26 = [v25 hasWidgetsOnTheHomeScreen];

      uint64_t v27 = *MEMORY[0x1E4F4B698];
      if (v26) {
        v28 = @"active";
      }
      else {
        v28 = @"abandoned";
      }
    }
    else
    {
      uint64_t v27 = *MEMORY[0x1E4F4B698];
      v28 = @"neverUsed";
    }
    [v21 setObject:v28 forKey:v27];
  }
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v18];
  uint64_t v30 = *MEMORY[0x1E4F4B6D0];
  uint64_t v31 = [v29 integerForKey:*MEMORY[0x1E4F4B6D0]];
  v32 = [MEMORY[0x1E4F28F80] processInfo];
  id v33 = v32;
  if (v32)
  {
    [v32 operatingSystemVersion];
    uint64_t v34 = v55;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    id v56 = 0;
  }

  id v35 = [MEMORY[0x1E4F28F80] processInfo];
  id v36 = v35;
  if (v35)
  {
    [v35 operatingSystemVersion];
    uint64_t v37 = v59;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
  }

  id v38 = (void *)MEMORY[0x1E4F4B6E0];
  id v39 = (void *)MEMORY[0x1E4F4B6D8];
  if (v37 <= v31)
  {
    uint64_t v40 = [v29 integerForKey:*MEMORY[0x1E4F4B6E0]];
  }
  else
  {
    [v29 removeObjectForKey:*MEMORY[0x1E4F4B6D8]];
    uint64_t v40 = -1;
  }
  if (v34 > v40)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v29, "setDouble:forKey:", *v39);
    [v29 setInteger:v34 forKey:*v38];
  }

  v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v18];
  uint64_t v42 = [v41 integerForKey:v30];
  v43 = [MEMORY[0x1E4F28F80] processInfo];
  v44 = v43;
  if (v43)
  {
    [v43 operatingSystemVersion];
    uint64_t v45 = v54;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    id v56 = 0;
  }

  if (v45 > v42)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v41, "setDouble:forKey:", *MEMORY[0x1E4F4B6C8]);
    [v41 setInteger:v45 forKey:v30];
  }

  v46 = [MEMORY[0x1E4F5AC68] sharedInstance];
  int v47 = +[ATXClientModelSuggestionReceiver sharedInstance];
  v48 = [v47 blendingLayerServer];
  [v46 startWithBlendingLayerServer:v48];

  id v49 = +[ATXSleepSuggestionServer sharedInstance];
  id v50 = +[ATXSportsServer sharedInstance];
  if ([MEMORY[0x1E4F4B628] isDigitalBalanceEnabled]) {
    id v51 = +[ATXUsageInsightsServer sharedInstance];
  }
  if (objc_msgSend(MEMORY[0x1E4F4B628], "isNotificationCategorizationEnabled", v54, v55, v56)) {
    id v52 = +[ATXNotificationCategorizationServer sharedInstance];
  }
  return +[ATXSettingsActionsServer sharedInstance];
}

id ___ATXInitializeInOwnerProcess_block_invoke_436()
{
  id v0 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  id v1 = +[ATXAppDirectoryServer sharedInstance];
  id v2 = +[ATXDefaultWidgetSuggesterServer sharedInstance];
  id v3 = +[ATXSuggestedPagesServer sharedInstance];
  id v4 = +[ATXFaceSuggestionServer sharedInstance];
  return +[_ATXAppProtectionMonitor sharedInstance];
}

void ___ATXInitializeInOwnerProcess_block_invoke_446()
{
  performPostRestoreTasks();
  id v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v0 = restoreStateFinishedPath();
  [v1 removeItemAtPath:v0 error:0];
}

void ___ATXInitializeInOwnerProcess_block_invoke_449(uint64_t a1)
{
  performPostRestoreTasks();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ATXInitializeInOwnerProcess_block_invoke_2_450;
  block[3] = &unk_1E68AB818;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void ___ATXInitializeInOwnerProcess_block_invoke_2_450(uint64_t a1)
{
  ATXUpdatePredictionsImmediatelyWithReason(11);
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

void ___ATXInitializeInOwnerProcess_block_invoke_3_451()
{
  id v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ___ATXInitializeInOwnerProcess_block_invoke_3_451_cold_1();
  }

  id v1 = +[ATXServer consumerSubTypesToUpdate];
  BOOL v2 = +[ATXFileUtil cachesAreValidForConsumerSubTypes:v1];

  if (!v2)
  {
    id v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "At least one cache is invalid or stale. Triggering an update", v4, 2u);
    }

    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_457);
  }
}

void ___ATXInitializeInOwnerProcess_block_invoke_455()
{
}

void ___ATXInitializeInOwnerProcess_block_invoke_cold_1()
{
  dlerror();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v0, v1, "Could not load MobileBackup: %s", v2, v3, v4, v5, v6);
}

void ___ATXInitializeInOwnerProcess_block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXMM: Creating the MagicalMomentsAppPredictor", v1, 2u);
}

void ___ATXInitializeInOwnerProcess_block_invoke_3_451_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Running startup check of caches to see if their format is valid", v1, 2u);
}

@end
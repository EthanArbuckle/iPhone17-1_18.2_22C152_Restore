@interface HTPrefs
+ (id)sharedPrefs;
- (BOOL)BOOLProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (BOOL)_isInternalNoOverride;
- (BOOL)appActivationLoggingEnabled;
- (BOOL)appLaunchMonitoringEnabled;
- (BOOL)customerModeEnabled;
- (BOOL)enableLoggingForPoster;
- (BOOL)enableLoggingForWidgetRenderer;
- (BOOL)eplEnabled;
- (BOOL)eplEnabledProfile;
- (BOOL)fenceTrackingEnabled;
- (BOOL)forceQuitDetectionEnabled;
- (BOOL)hangtracerDaemonEnabled;
- (BOOL)hasInternalSettings;
- (BOOL)haveNonDefaultFeatureFlags;
- (BOOL)haveRootsInstalled;
- (BOOL)haveSerialLoggingEnabled;
- (BOOL)htTailspinEnabled;
- (BOOL)hudEnabled;
- (BOOL)isCarryDevice;
- (BOOL)isInternal;
- (BOOL)keepTailspinsLegacy;
- (BOOL)memoryLoggingEnabled;
- (BOOL)pdseAllowEnableTailspin;
- (BOOL)pdseAppLaunchKillSwitch;
- (BOOL)pdseCATailspinKillSwitch;
- (BOOL)pdseHTBadDayKillSwitch;
- (BOOL)pdseHTRateOnlyKillSwitch;
- (BOOL)pdseHTThirdPartyKillSwitch;
- (BOOL)pdseHangTracerKillSwitch;
- (BOOL)pdseSentryKillSwitch;
- (BOOL)pdseWorkflowResponsivenessKillSwitch;
- (BOOL)shouldAllowSentryEnablement;
- (BOOL)shouldAllowWorkflowResponsivenessEnablement;
- (BOOL)shouldCollectOSSignposts;
- (BOOL)shouldCollectOSSignpostsDeferred;
- (BOOL)shouldCompressSavedTailspins;
- (BOOL)shouldDisplayFenceHangToHUD;
- (BOOL)shouldIncludeDiskInfo;
- (BOOL)shouldIncludeDisplayData;
- (BOOL)shouldIncludeNetworkState;
- (BOOL)shouldPostHTPrefsChangedNotification;
- (BOOL)shouldSaveTailspins;
- (BOOL)shouldUpdateHangsHUD;
- (BOOL)shouldUploadToDiagPipe;
- (BOOL)signpostMonitoringEnabled;
- (BOOL)slowAppActivationTailspinEnabled;
- (BOOL)thirdPartyDevHangHUDEnabled;
- (BOOL)thirdPartyIncludeNonDevelopmentApps;
- (BOOL)thirdPartyRunLoopHangLogsEnabled;
- (BOOL)workflowResponsivenessEnabled;
- (HTPrefInit)prefInitList;
- (NSArray)prefContextPrefixPriorityOrder;
- (NSArray)thirdPartyDevPreferredLanguages;
- (NSDictionary)_installedHTProfileDict;
- (NSString)_profilePath;
- (NSString)automationGroup;
- (NSString)enablementPrefix;
- (NSString)experimentGroup;
- (NSString)tailspinSaveFormat;
- (NSString)thirdPartyDevBootSessionUUID;
- (OS_dispatch_queue)_prefsQueue;
- (__CFString)_htDomain;
- (__CFString)_htTaskingDomain;
- (double)appActivationLoggingCPUUtilizationThresholdMSec;
- (double)badDaySecondsBetweenLastEnablementAndReferenceDate;
- (double)doubleProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (double)eplTimeoutTimestampSec;
- (double)runloopHangPercentHeavyLogs;
- (double)samplingPercentForMicroHangs;
- (id)getHighestPrioritySettingValue:(id)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5;
- (id)objectProperty:(HTPrefInit *)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5;
- (id)prefNamed:(__CFString *)a3 domain:(__CFString *)a4 profile:(id)a5 matchingSelector:(SEL)a6 contextPrefixOut:(id *)a7;
- (id)stringProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (int)fenceHangDailyLogLimit;
- (int)intProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (int)numOSCryptexFileExtents;
- (int)pdseAppLaunchPeriodDays;
- (int)pdseCATailspinPeriodDays;
- (int)pdseHTPeriodDays;
- (int)pdseHTRateOnlyPeriodDays;
- (int)pdseHTThirdPartyNoLogUploadPeriodDays;
- (int)pdseHTThirdPartyPeriodDays;
- (int)pdseSentryPeriodDays;
- (int)pdseWorkflowResponsivenessPeriodDays;
- (int)runLoopHangDailyLogLimit;
- (int)runLoopHangPerPeriodLogLimit;
- (int)runLoopLongHangDailyLogLimit;
- (int)runLoopMicroHangDailyLogLimit;
- (int)runloopHangThirdPartyDailyLogLimit;
- (int)signpostMonitoringDailyLogLimit;
- (int)signpostMonitoringPerPeriodLogLimit;
- (int)slowAppActivationDailyLogLimit;
- (int)slowAppActivationPerAppMaxLogLimit;
- (int)workflowResponsivenessDailyLogLimit;
- (int)workflowResponsivenessPerPeriodLogLimit;
- (unint64_t)badDayEnablementForHangDurationMSec;
- (unint64_t)hangWaitTimeoutDurationMSec;
- (unint64_t)reportPeriodMATU;
- (unint64_t)runloopHangDurationThresholdMSec;
- (unint64_t)runloopHangThirdPartyDurationThresholdMSec;
- (unint64_t)runloopHangTimeoutDurationMSec;
- (unint64_t)runloopLongHangDurationThresholdMSec;
- (unint64_t)savedTailspinMaxMB;
- (unint64_t)slowAppActivationThresholdMSec;
- (unint64_t)springBoardHangIORegGPUDumpTimeoutMSec;
- (unint64_t)unsignedLongLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (unint64_t)unsignedLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (unsigned)appActivationLoggingMaxActivationLimit;
- (unsigned)badDayEnablementDurationDays;
- (unsigned)badDayEnablementForLogCount;
- (unsigned)badDayEnablementForPreviousDays;
- (unsigned)badDayEnablementMinimumBreakDurationDays;
- (unsigned)forceQuitDetectionThresholdMSec;
- (unsigned)hudThresholdMSec;
- (unsigned)memoryLoggingIntervalSec;
- (unsigned)unsignedIntProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (void)__createInternalSettings;
- (void)_removeAllPrefs;
- (void)dealloc;
- (void)earlyInitNecessaryPrefs;
- (void)initBoolProperty:(HTPrefInit *)a3;
- (void)initDoubleProperty:(HTPrefInit *)a3;
- (void)initIntProperty:(HTPrefInit *)a3;
- (void)initNSObjectProperty:(HTPrefInit *)a3;
- (void)initNSStringProperty:(HTPrefInit *)a3;
- (void)initPropertyHangtracerDaemonEnabled:(HTPrefInit *)a3;
- (void)initPropertyHaveInternalSettings:(HTPrefInit *)a3;
- (void)initPropertyIsInternal:(HTPrefInit *)a3;
- (void)initPropertyMemoryLoggingIntervalSec:(HTPrefInit *)a3;
- (void)initPropertyReportPeriod:(HTPrefInit *)a3;
- (void)initPropertyShouldSaveAndCompressTailspins:(HTPrefInit *)a3;
- (void)initPropertyThirdPartyDevPreferredLanguages:(HTPrefInit *)a3;
- (void)initUnsignedIntProperty:(HTPrefInit *)a3;
- (void)initUnsignedLongLongProperty:(HTPrefInit *)a3;
- (void)initUnsignedLongProperty:(HTPrefInit *)a3;
- (void)prefInitList;
- (void)refreshHTPrefs;
- (void)setAutomationGroup:(id)a3;
- (void)setEnableLoggingForPoster:(BOOL)a3;
- (void)setEnableLoggingForWidgetRenderer:(BOOL)a3;
- (void)setExperimentGroup:(id)a3;
- (void)setKeepTailspinsLegacy:(BOOL)a3;
- (void)setMemoryLoggingIntervalSec:(unsigned int)a3;
- (void)setShouldAllowSentryEnablement:(BOOL)a3;
- (void)setShouldAllowWorkflowResponsivenessEnablement:(BOOL)a3;
- (void)setShouldPostHTPrefsChangedNotification:(BOOL)a3;
- (void)setTailspinSaveFormat:(id)a3;
- (void)set_htDomain:(__CFString *)a3;
- (void)set_htTaskingDomain:(__CFString *)a3;
- (void)set_installedHTProfileDict:(id)a3;
- (void)set_isInternalNoOverride:(BOOL)a3;
- (void)set_prefsQueue:(id)a3;
- (void)set_profilePath:(id)a3;
- (void)setupPrefsWithQueue:(id)a3;
- (void)setupPrefsWithQueue:(id)a3 profilePath:(id)a4 taskingDomainName:(__CFString *)a5 hangtracerDomain:(__CFString *)a6 setupInternalPrefs:(BOOL)a7;
@end

@implementation HTPrefs

void __41__HTPrefs_prefContextPrefixPriorityOrder__block_invoke()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HTProfile";
  v2[1] = @"HTEPL";
  v2[2] = @"HTThirdPartyDevSupport";
  v2[3] = @"PLTasking";
  v2[4] = &stru_1F0C6A9F0;
  v2[5] = @"PDSEHangTracer";
  v2[6] = @"PDSEHTBadDay";
  v2[7] = @"PDSEHTThirdParty";
  v2[8] = @"PDSEWorkflowResponsiveness";
  v2[9] = @"PDSEHTRateOnly";
  v2[10] = @"PDSESentry";
  v2[11] = @"PDSEAppLaunch";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];
  v1 = (void *)prefContextPrefixPriorityOrder_prefContextPriorityOrder;
  prefContextPrefixPriorityOrder_prefContextPriorityOrder = v0;
}

- (id)prefNamed:(__CFString *)a3 domain:(__CFString *)a4 profile:(id)a5 matchingSelector:(SEL)a6 contextPrefixOut:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v25 = a5;
  v27 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = [(HTPrefs *)self prefContextPrefixPriorityOrder];
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    CFStringRef hostName = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(__CFString **)(*((void *)&v28 + 1) + 8 * i);
        int v15 = [(__CFString *)v14 isEqualToString:&stru_1F0C6A9F0];
        if (v15)
        {
          v16 = v27;
        }
        else
        {
          v16 = [NSString stringWithFormat:@"%@.%@", v14, v27];
        }
        v17 = v16;
        if ([(__CFString *)v14 isEqualToString:@"HTProfile"])
        {
          uint64_t v18 = [v25 objectForKeyedSubscript:v17];
        }
        else
        {
          uint64_t v18 = (uint64_t)CFPreferencesCopyValue(v17, a4, @"mobile", hostName);
        }
        v19 = (void *)v18;
        if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v20 = shared_ht_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v22 = @"<base context>";
            *(_DWORD *)buf = 138412802;
            if (!v15) {
              v22 = v14;
            }
            v33 = v22;
            __int16 v34 = 2112;
            v35 = v27;
            __int16 v36 = 2112;
            v37 = v19;
            _os_log_debug_impl(&dword_1B3C06000, v20, OS_LOG_TYPE_DEBUG, "HTPrefs: Overriden by %@: %@ = %@", buf, 0x20u);
          }

          if (a7) {
            *a7 = v14;
          }

          goto LABEL_25;
        }
        if (a7) {
          *a7 = 0;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  obj = shared_ht_log_handle();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
    -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]((uint64_t)v27, (uint64_t)a4, obj);
  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (NSArray)prefContextPrefixPriorityOrder
{
  if (prefContextPrefixPriorityOrder_onceToken != -1) {
    dispatch_once(&prefContextPrefixPriorityOrder_onceToken, &__block_literal_global);
  }
  v2 = (void *)prefContextPrefixPriorityOrder_prefContextPriorityOrder;
  return (NSArray *)v2;
}

- (void)setupPrefsWithQueue:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[HTPrefs setupPrefsWithQueue:]();
  }
  id v5 = v4;
  [(HTPrefs *)self setupPrefsWithQueue:v4 profilePath:@"/Library/Managed Preferences/mobile/.GlobalPreferences.plist" taskingDomainName:@"com.apple.da" hangtracerDomain:@"com.apple.hangtracer" setupInternalPrefs:0];
}

- (void)setupPrefsWithQueue:(id)a3 profilePath:(id)a4 taskingDomainName:(__CFString *)a5 hangtracerDomain:(__CFString *)a6 setupInternalPrefs:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v12 = a3;
  id v13 = a4;
  v14 = shared_ht_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C06000, v14, OS_LOG_TYPE_INFO, "HTPrefs initialization", buf, 2u);
  }

  objc_storeStrong((id *)&self->__profilePath, a4);
  self->__htTaskingDomain = a5;
  self->__htDomain = a6;
  *(_WORD *)&self->_shouldAllowSentryEnablement = 0;
  [(HTPrefs *)self earlyInitNecessaryPrefs];
  if (v7) {
    [(HTPrefs *)self __createInternalSettings];
  }
  int v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v16 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.hangtracer.preferences", v15, v12);
  prefsQueue = self->__prefsQueue;
  self->__prefsQueue = v16;

  objc_initWeak(&location, self);
  *(void *)buf = 0;
  v44 = buf;
  uint64_t v45 = 0x2020000000;
  int v46 = 0;
  uint64_t v39 = 0;
  v40 = (int *)&v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  uint64_t v35 = 0;
  __int16 v36 = (int *)&v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  uint64_t v31 = 0;
  v32 = (int *)&v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v27 = 0;
  long long v28 = (int *)&v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v23 = 0;
  v24 = (int *)&v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__HTPrefs_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs___block_invoke;
  v21[3] = &unk_1E60717B0;
  v21[5] = buf;
  v21[6] = &v39;
  v21[7] = &v35;
  v21[8] = &v31;
  v21[9] = &v27;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  uint64_t v18 = (void *)MEMORY[0x1B3EC2A60](v21);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__HTPrefs_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs___block_invoke_101;
  v20[3] = &unk_1E60717D8;
  v20[4] = &v23;
  v19 = (void *)MEMORY[0x1B3EC2A60](v20);
  notify_register_dispatch(EPL_STATE_CHANGED_NOTIFICATION[0], v32 + 6, (dispatch_queue_t)self->__prefsQueue, v18);
  notify_register_dispatch(HANGTRACER_TASKING_CHANGED_NOTIFICATION[0], (int *)v44 + 6, (dispatch_queue_t)self->__prefsQueue, v18);
  notify_register_dispatch(HANGTRACER_TELEMETRY_CHANGED_NOTIFICATION[0], v40 + 6, (dispatch_queue_t)self->__prefsQueue, v18);
  notify_register_dispatch(HANGTRACER_PROFILE_LIST_CHANGED_NOTIFICATION[0], v36 + 6, (dispatch_queue_t)self->__prefsQueue, v18);
  notify_register_dispatch(HTSE_SELF_ENABLE_STATE_CHANGED_NOTIFICATION[0], v28 + 6, (dispatch_queue_t)self->__prefsQueue, v18);
  notify_register_dispatch(TEST_RESET_LOG_LIMITS_NOTIFICATION[0], v24 + 6, (dispatch_queue_t)self->__prefsQueue, v19);
  [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  [(HTPrefs *)self refreshHTPrefs];

  objc_destroyWeak(&v22);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

- (void)initNSStringProperty:(HTPrefInit *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)a3->var1;
  v6 = [(HTPrefs *)self stringProperty:a3 contextPrefixOut:0];
  if (([v6 isEqualToString:v5] & 1) == 0)
  {
    BOOL v7 = shared_ht_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v12 = 138412802;
      id v13 = var0;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1B3C06000, v7, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %@ -> %@", (uint8_t *)&v12, 0x20u);
    }

    uint64_t v8 = [(HTPrefs *)self stringProperty:a3 contextPrefixOut:0];
    var1 = (void **)a3->var1;
    uint64_t v10 = *var1;
    *var1 = (void *)v8;

    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (id)stringProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 16;
  if (!self->_isInternal) {
    uint64_t v7 = 24;
  }
  id v8 = *(id *)((char *)&a3->var0 + v7);
  v9 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_isEqualToString_ contextPrefixOut:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    if ((a3->var4 & 4) != 0 && ![v9 length])
    {
      id v13 = shared_ht_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        unint64_t var4 = a3->var4;
        int v16 = 138412802;
        v17 = var0;
        __int16 v18 = 2048;
        unint64_t v19 = var4;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1B3C06000, v13, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %@", (uint8_t *)&v16, 0x20u);
      }
    }
    else
    {
      id v11 = v10;

      id v8 = v11;
    }
  }

  return v8;
}

- (void)initPropertyShouldSaveAndCompressTailspins:(HTPrefInit *)a3
{
  int shouldSaveTailspins = self->_shouldSaveTailspins;
  int shouldCompressSavedTailspins = self->_shouldCompressSavedTailspins;
  tailspinSaveFormat = self->_tailspinSaveFormat;
  if (tailspinSaveFormat)
  {
    BOOL isInternal = self->_isInternal;
    if ([(NSString *)tailspinSaveFormat isEqualToString:@"compressed"])
    {
      int keepTailspinsLegacy = 1;
      int v9 = 1;
    }
    else if ([(NSString *)self->_tailspinSaveFormat isEqualToString:@"uncompressed"])
    {
      int v9 = 0;
      int keepTailspinsLegacy = 1;
    }
    else
    {
      int keepTailspinsLegacy = ![(NSString *)self->_tailspinSaveFormat isEqualToString:@"none"];
      if (!isInternal) {
        int keepTailspinsLegacy = 0;
      }
      int v9 = keepTailspinsLegacy;
    }
  }
  else
  {
    int v9 = 0;
    int keepTailspinsLegacy = self->_keepTailspinsLegacy;
  }
  unint64_t savedTailspinMaxMB = self->_savedTailspinMaxMB;
  if (savedTailspinMaxMB) {
    int v11 = keepTailspinsLegacy;
  }
  else {
    int v11 = 0;
  }
  if (savedTailspinMaxMB) {
    int v12 = v9;
  }
  else {
    int v12 = 0;
  }
  if (shouldSaveTailspins != v11)
  {
    id v13 = shared_ht_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[HTPrefs initPropertyShouldSaveAndCompressTailspins:]();
    }

    self->_int shouldSaveTailspins = v11;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
  if (shouldCompressSavedTailspins != v12)
  {
    __int16 v14 = shared_ht_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[HTPrefs initPropertyShouldSaveAndCompressTailspins:]();
    }

    self->_int shouldCompressSavedTailspins = v12;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)refreshHTPrefs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = shared_ht_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_1B3C06000, v3, OS_LOG_TYPE_INFO, "HTPrefs: Refreshing preferences", (uint8_t *)v11, 2u);
  }

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 dictionaryRepresentation];
  installedHTProfileDict = self->__installedHTProfileDict;
  self->__installedHTProfileDict = v5;

  CFPreferencesAppSynchronize(self->__htTaskingDomain);
  CFPreferencesAppSynchronize(self->__htDomain);
  [(HTPrefs *)self earlyInitNecessaryPrefs];
  uint64_t v7 = [(HTPrefs *)self prefInitList];
  v11[3] = 0;
  v11[0] = @"HangTracerEnabled";
  v11[1] = &self->_hangtracerDaemonEnabled;
  v11[2] = 1;
  v11[4] = 0;
  v11[5] = sel_initPropertyHangtracerDaemonEnabled_;
  [(HTPrefs *)self initPropertyHangtracerDaemonEnabled:v11];
  if (self->_hangtracerDaemonEnabled)
  {
    for (uint64_t i = v7->var5; i; ++v7)
    {
      objc_msgSend(self, i, v7);
      uint64_t i = v7[1].var5;
    }
  }
  if ([(HTPrefs *)self shouldPostHTPrefsChangedNotification])
  {
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:0];
    int v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = @"com.apple.hangtracer.htprefs.refreshed";
      _os_log_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_INFO, "Posting notification %@", buf, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"com.apple.hangtracer.htprefs.refreshed" object:self userInfo:0];
  }
}

- (void)initBoolProperty:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = *(unsigned __int8 *)a3->var1;
  int v6 = -[HTPrefs BOOLProperty:contextPrefixOut:](self, "BOOLProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    int v7 = v6;
    id v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int v11 = var0;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", (uint8_t *)&v10, 0x18u);
    }

    *(unsigned char *)a3->var1 = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (BOOL)BOOLProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v4 = 16;
  if (!self->_isInternal) {
    uint64_t v4 = 24;
  }
  char v5 = *((unsigned char *)&a3->var0 + v4) != 0;
  int v6 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_BOOLValue contextPrefixOut:a4];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v6 BOOLValue];
  }

  return v5;
}

- (void)initIntProperty:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = *(_DWORD *)a3->var1;
  int v6 = -[HTPrefs intProperty:contextPrefixOut:](self, "intProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    int v7 = v6;
    id v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int v11 = var0;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %d -> %d", (uint8_t *)&v10, 0x18u);
    }

    *(_DWORD *)a3->var1 = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)setShouldPostHTPrefsChangedNotification:(BOOL)a3
{
  self->_shouldPostHTPrefsChangedNotification = a3;
}

- (int)intProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 16;
  if (!self->_isInternal) {
    uint64_t v5 = 24;
  }
  int v6 = *(_DWORD *)((char *)&a3->var0 + v5);
  int v7 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_intValue contextPrefixOut:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  int v8 = [v7 intValue];
  int v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v14 = 138412802;
      int v15 = var0;
      __int16 v16 = 2048;
      unint64_t v17 = var4;
      __int16 v18 = 1024;
      int v19 = 0;
      _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %d", (uint8_t *)&v14, 0x1Cu);
    }

LABEL_9:
    int v9 = v6;
  }

  return v9;
}

- (void)initUnsignedIntProperty:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = *(_DWORD *)a3->var1;
  unsigned int v6 = -[HTPrefs unsignedIntProperty:contextPrefixOut:](self, "unsignedIntProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unsigned int v7 = v6;
    int v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int v11 = var0;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 1024;
      unsigned int v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %u -> %u", (uint8_t *)&v10, 0x18u);
    }

    *(_DWORD *)a3->var1 = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (unsigned)unsignedIntProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 16;
  if (!self->_isInternal) {
    uint64_t v5 = 24;
  }
  unsigned int v6 = *(_DWORD *)((char *)&a3->var0 + v5);
  unsigned int v7 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_unsignedIntValue contextPrefixOut:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  unsigned int v8 = [v7 unsignedIntValue];
  unsigned int v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v14 = 138412802;
      unsigned int v15 = var0;
      __int16 v16 = 2048;
      unint64_t v17 = var4;
      __int16 v18 = 1024;
      int v19 = 0;
      _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %u", (uint8_t *)&v14, 0x1Cu);
    }

LABEL_9:
    unsigned int v9 = v6;
  }

  return v9;
}

- (void)initUnsignedLongProperty:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)a3->var1;
  unint64_t v6 = -[HTPrefs unsignedLongProperty:contextPrefixOut:](self, "unsignedLongProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unint64_t v7 = v6;
    unsigned int v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int v11 = var0;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      unint64_t v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %lu -> %lu", (uint8_t *)&v10, 0x20u);
    }

    *(void *)a3->var1 = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (unint64_t)unsignedLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 16;
  if (!self->_isInternal) {
    uint64_t v5 = 24;
  }
  unint64_t v6 = *(unint64_t *)((char *)&a3->var0 + v5);
  unint64_t v7 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_unsignedLongValue contextPrefixOut:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v8 = [v7 unsignedLongValue];
  unint64_t v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v14 = 138412802;
      unint64_t v15 = var0;
      __int16 v16 = 2048;
      unint64_t v17 = var4;
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %lu", (uint8_t *)&v14, 0x20u);
    }

LABEL_9:
    unint64_t v9 = v6;
  }

  return v9;
}

- (void)initDoubleProperty:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = *(double *)a3->var1;
  -[HTPrefs doubleProperty:contextPrefixOut:](self, "doubleProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    double v7 = v6;
    uint64_t v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int v11 = var0;
      __int16 v12 = 2048;
      double v13 = v5;
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %f -> %f", (uint8_t *)&v10, 0x20u);
    }

    *(double *)a3->var1 = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (double)doubleProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 16;
  if (!self->_isInternal) {
    uint64_t v5 = 24;
  }
  double v6 = *(double *)((char *)&a3->var0 + v5);
  double v7 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_doubleValue contextPrefixOut:a4];
  if (objc_opt_respondsToSelector())
  {
    [v7 doubleValue];
    double v9 = v8;
    if ((a3->var4 & 2) != 0 && v8 < v6)
    {
      int v10 = shared_ht_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        unint64_t var4 = a3->var4;
        int v14 = 138412802;
        double v15 = var0;
        __int16 v16 = 2048;
        unint64_t v17 = var4;
        __int16 v18 = 2048;
        double v19 = v9;
        _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %f", (uint8_t *)&v14, 0x20u);
      }
    }
    else
    {
      double v6 = v8;
    }
  }

  return v6;
}

- (void)earlyInitNecessaryPrefs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5[0] = @"HangTracerEnableCustomerMode";
  v5[1] = &self->_customerModeEnabled;
  char v6 = 0;
  char v7 = 0;
  v2 = sel_initBoolProperty_;
  uint64_t v8 = 0;
  double v9 = sel_initBoolProperty_;
  uint64_t v10 = 0;
  p_BOOL isInternal = &self->_isInternal;
  char v12 = 0;
  char v13 = 0;
  uint64_t v14 = 0;
  double v15 = sel_initPropertyIsInternal_;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (sel_initBoolProperty_)
  {
    uint64_t v4 = v5;
    do
    {
      objc_msgSend(self, v2, v4);
      v2 = (const char *)v4[11];
      v4 += 6;
    }
    while (v2);
  }
}

- (void)initPropertyIsInternal:(HTPrefInit *)a3
{
  int isInternalNoOverride = self->__isInternalNoOverride;
  int v5 = MGGetBoolAnswer();
  if (isInternalNoOverride != v5)
  {
    BOOL v6 = v5;
    char v7 = shared_ht_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[HTPrefs initPropertyIsInternal:]();
    }

    self->__int isInternalNoOverride = v6;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
  BOOL v8 = !self->_customerModeEnabled && self->__isInternalNoOverride;
  if (self->_isInternal != v8)
  {
    double v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[HTPrefs initPropertyIsInternal:]();
    }

    self->_BOOL isInternal = v8;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (BOOL)shouldPostHTPrefsChangedNotification
{
  return self->_shouldPostHTPrefsChangedNotification;
}

- (HTPrefInit)prefInitList
{
  result = self->_prefInitList;
  if (!result)
  {
    uint64_t v4 = shared_ht_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[HTPrefs prefInitList](v4);
    }

    long long v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v18 timeIntervalSinceReferenceDate];
    HTPrefDefaultVal v6 = v5;
    long long v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v17 timeIntervalSinceReferenceDate];
    HTPrefDefaultVal v8 = v7;
    long long v85 = 0u;
    HIBYTE(v85) = 0;

    result = (HTPrefInit *)malloc_type_malloc(0xF00uLL, 0x3506460CuLL);
    result[61].var0 = @"PDSEPrefHTThirdPartyPeriodDays";
    result[61].var1 = &self->_pdseHTThirdPartyPeriodDays;
    result[62].var0 = @"PDSEPrefHTThirdPartyNoLogUploadPeriodDays";
    result[62].var1 = &self->_pdseHTThirdPartyNoLogUploadPeriodDays;
    result[63].var0 = @"PDSEPrefCATailspinPeriodDays";
    result->var0 = @"HangTracerEnableTailspin";
    result->var1 = &self->_htTailspinEnabled;
    result[63].var1 = &self->_pdseCATailspinPeriodDays;
    result[64].var0 = @"PDSEPrefAppLaunchPeriodDays";
    result[64].var1 = &self->_pdseAppLaunchPeriodDays;
    result[65].var0 = @"PDSEPrefSentryPeriodDays";
    result[1].var0 = @"HangTracerEnableHUD";
    result[1].var1 = &self->_hudEnabled;
    result[65].var1 = &self->_pdseSentryPeriodDays;
    result[66].var0 = @"PDSEPrefWorkflowResponsivenessPeriodDays";
    result[66].var1 = &self->_pdseWorkflowResponsivenessPeriodDays;
    result[67].var0 = @"PDSEPrefHTBadDayKillSwitch";
    result[2].var0 = @"HangTracerCollectOSSignposts";
    result[2].var1 = &self->_shouldCollectOSSignposts;
    result[67].var1 = &self->_pdseHTBadDayKillSwitch;
    result[68].var0 = @"PDSEPrefAllowEnableTailspin";
    result[68].var1 = &self->_pdseAllowEnableTailspin;
    result[69].var0 = @"BadDaySecondsBetweenLastEnablementAndReferenceDate";
    result[3].var0 = @"HangTracerCollectOSSignpostsDeferred";
    result[3].var1 = &self->_shouldCollectOSSignpostsDeferred;
    result[69].var1 = &self->_badDaySecondsBetweenLastEnablementAndReferenceDate;
    result[70].var0 = @"BadDayEnablementMinimumBreakDurationDays";
    result[70].var1 = &self->_badDayEnablementMinimumBreakDurationDays;
    result[71].var0 = @"BadDayEnablementDurationDaysKey";
    result[4].var0 = @"HangTracerSavedTailspinsMaxMB";
    result[4].var1 = &self->_savedTailspinMaxMB;
    result[5].var0 = @"HangTracerKeepTailspins";
    result[5].var1 = &self->_keepTailspinsLegacy;
    result[71].var1 = &self->_badDayEnablementDurationDays;
    result[72].var0 = @"BadDayEnablementForHangDurationMSec";
    result[72].var1 = &self->_badDayEnablementForHangDurationMSec;
    result[73].var0 = @"BadDayEnablementForLogCount";
    result[73].var1 = &self->_badDayEnablementForLogCount;
    result[74].var0 = @"BadDayEnablementForPreviousDays";
    result[74].var1 = &self->_badDayEnablementForPreviousDays;
    result[75].var0 = @"HangTracerTelemetryHaveNonDefaultFeatureFlags";
    result[6].var0 = @"HangTracerKeepTailspinsWithFormat";
    result[6].var1 = &self->_tailspinSaveFormat;
    result[6].var2.var3 = (unint64_t)@"compressed";
    result[6].var3.var3 = (unint64_t)@"none";
    result[75].var1 = &self->_haveNonDefaultFeatureFlags;
    result[76].var0 = @"HangTracerTelemetrySerialLoggingEnabled";
    result[76].var1 = &self->_haveSerialLoggingEnabled;
    result[77].var0 = @"HangTracerTelemetryNumOSCryptexFileExtents";
    result[77].var1 = &self->_numOSCryptexFileExtents;
    result[78].var0 = @"HangTracerTelemetryHaveRootsInstalled";
    result[78].var1 = &self->_haveRootsInstalled;
    result[6].var5 = sel_initNSStringProperty_;
    result[8].var0 = @"HangTracerIncludeDiskInfo";
    result[8].var1 = &self->_shouldIncludeDiskInfo;
    result[7].var1 = &self->_shouldSaveTailspins;
    result[7].var5 = sel_initPropertyShouldSaveAndCompressTailspins_;
    HIDWORD(result[5].var2.var3) = *(_DWORD *)&v82[3];
    *(_DWORD *)(&result[5].var2.var0 + 1) = *(_DWORD *)v82;
    HIDWORD(result[5].var3.var3) = *(_DWORD *)&v81[3];
    *(_DWORD *)(&result[5].var3.var0 + 1) = *(_DWORD *)v81;
    HIDWORD(result[7].var2.var3) = *(_DWORD *)&v80[3];
    *(_DWORD *)(&result[7].var2.var0 + 1) = *(_DWORD *)v80;
    HIDWORD(result[7].var3.var3) = *(_DWORD *)&v79[3];
    *(_DWORD *)(&result[7].var3.var0 + 1) = *(_DWORD *)v79;
    HIDWORD(result[8].var2.var3) = *(_DWORD *)&v78[3];
    *(_DWORD *)(&result[8].var2.var0 + 1) = *(_DWORD *)v78;
    HIDWORD(result[8].var3.var3) = *(_DWORD *)&v77[3];
    *(_DWORD *)(&result[8].var3.var0 + 1) = *(_DWORD *)v77;
    HIDWORD(result[9].var2.var3) = *(_DWORD *)&v76[3];
    *(_DWORD *)(&result[9].var2.var0 + 1) = *(_DWORD *)v76;
    HIDWORD(result[9].var3.var3) = *(_DWORD *)&v75[3];
    *(_DWORD *)(&result[9].var3.var0 + 1) = *(_DWORD *)v75;
    HIDWORD(result[10].var2.var3) = *(_DWORD *)&v74[3];
    *(_DWORD *)(&result[10].var2.var0 + 1) = *(_DWORD *)v74;
    HIDWORD(result[10].var3.var3) = *(_DWORD *)&v73[3];
    *(_DWORD *)(&result[10].var3.var0 + 1) = *(_DWORD *)v73;
    HIDWORD(result[11].var2.var3) = *(_DWORD *)&v72[3];
    *(_DWORD *)(&result[11].var2.var0 + 1) = *(_DWORD *)v72;
    HIDWORD(result[11].var3.var3) = *(_DWORD *)&v71[3];
    *(_DWORD *)(&result[11].var3.var0 + 1) = *(_DWORD *)v71;
    *(_DWORD *)(&result[25].var2.var0 + 1) = *(_DWORD *)v70;
    *(_DWORD *)(&result[25].var3.var0 + 1) = *(_DWORD *)v69;
    *(_DWORD *)(&result[28].var2.var0 + 1) = *(_DWORD *)v68;
    *(_DWORD *)(&result[28].var3.var0 + 1) = *(_DWORD *)v67;
    HIDWORD(result[30].var2.var3) = *(_DWORD *)&v66[3];
    *(_DWORD *)(&result[30].var2.var0 + 1) = *(_DWORD *)v66;
    HIDWORD(result[30].var3.var3) = *(_DWORD *)&v65[3];
    *(_DWORD *)(&result[30].var3.var0 + 1) = *(_DWORD *)v65;
    *(_DWORD *)(&result[33].var2.var0 + 1) = *(_DWORD *)v64;
    *(_DWORD *)(&result[33].var3.var0 + 1) = *(_DWORD *)v63;
    HIDWORD(result[34].var2.var3) = *(_DWORD *)&v62[3];
    *(_DWORD *)(&result[34].var2.var0 + 1) = *(_DWORD *)v62;
    HIDWORD(result[34].var3.var3) = *(_DWORD *)&v61[3];
    *(_DWORD *)(&result[34].var3.var0 + 1) = *(_DWORD *)v61;
    *(_DWORD *)(&result[37].var2.var0 + 1) = *(_DWORD *)v60;
    *(_DWORD *)(&result[37].var3.var0 + 1) = *(_DWORD *)v59;
    HIDWORD(result[39].var2.var3) = *(_DWORD *)&v58[3];
    *(_DWORD *)(&result[39].var2.var0 + 1) = *(_DWORD *)v58;
    HIDWORD(result[39].var3.var3) = *(_DWORD *)&v57[3];
    *(_DWORD *)(&result[39].var3.var0 + 1) = *(_DWORD *)v57;
    *(_DWORD *)(&result[40].var2.var0 + 1) = *(_DWORD *)v56;
    HIDWORD(result[40].var3.var3) = *(_DWORD *)&v55[3];
    *(_DWORD *)(&result[40].var3.var0 + 1) = *(_DWORD *)v55;
    HIDWORD(result[43].var2.var3) = *(_DWORD *)&v54[3];
    *(_DWORD *)(&result[43].var2.var0 + 1) = *(_DWORD *)v54;
    HIDWORD(result[43].var3.var3) = *(_DWORD *)&v53[3];
    *(_DWORD *)(&result[43].var3.var0 + 1) = *(_DWORD *)v53;
    *(_DWORD *)(&result[46].var2.var0 + 1) = *(_DWORD *)v52;
    *(_DWORD *)(&result[46].var3.var0 + 1) = *(_DWORD *)v51;
    HIDWORD(result[47].var2.var3) = *(_DWORD *)&v50[3];
    *(_DWORD *)(&result[47].var2.var0 + 1) = *(_DWORD *)v50;
    HIDWORD(result[47].var3.var3) = *(_DWORD *)&v49[3];
    *(_DWORD *)(&result[47].var3.var0 + 1) = *(_DWORD *)v49;
    HIDWORD(result[49].var2.var3) = *(_DWORD *)&v48[3];
    *(_DWORD *)(&result[49].var2.var0 + 1) = *(_DWORD *)v48;
    HIDWORD(result[49].var3.var3) = *(_DWORD *)&v47[3];
    *(_DWORD *)(&result[49].var3.var0 + 1) = *(_DWORD *)v47;
    HIDWORD(result[50].var2.var3) = *(_DWORD *)&v46[3];
    *(_DWORD *)(&result[50].var2.var0 + 1) = *(_DWORD *)v46;
    HIDWORD(result[50].var3.var3) = *(_DWORD *)&v45[3];
    *(_DWORD *)(&result[50].var3.var0 + 1) = *(_DWORD *)v45;
    HIDWORD(result[51].var2.var3) = *(_DWORD *)&v44[3];
    *(_DWORD *)(&result[51].var2.var0 + 1) = *(_DWORD *)v44;
    HIDWORD(result[51].var3.var3) = *(_DWORD *)&v43[3];
    *(_DWORD *)(&result[51].var3.var0 + 1) = *(_DWORD *)v43;
    HIDWORD(result[52].var2.var3) = *(_DWORD *)&v42[3];
    *(_DWORD *)(&result[52].var2.var0 + 1) = *(_DWORD *)v42;
    HIDWORD(result[52].var3.var3) = *(_DWORD *)&v41[3];
    *(_DWORD *)(&result[52].var3.var0 + 1) = *(_DWORD *)v41;
    *(_DWORD *)(&result[3].var2.var0 + 1) = *(_DWORD *)v84;
    HIDWORD(result[3].var2.var3) = *(_DWORD *)&v84[3];
    *(_DWORD *)(&result[3].var3.var0 + 1) = *(_DWORD *)v83;
    HIDWORD(result[3].var3.var3) = *(_DWORD *)&v83[3];
    result[4].var2.var1 = 50;
    result[9].var0 = @"HangTracerEnableDisplayData";
    result[9].var1 = &self->_shouldIncludeDisplayData;
    result[10].var0 = @"HangTracerIncludeNetworkState";
    result[10].var1 = &self->_shouldIncludeNetworkState;
    result[11].var0 = @"HangTracerThirdPartyRunloopLogsEnabled";
    result[11].var1 = &self->_thirdPartyRunLoopHangLogsEnabled;
    result[12].var0 = @"HangTracerSamplingPercentForMicroHangs";
    result[12].var1 = &self->_samplingPercentForMicroHangs;
    result[13].var0 = @"HangTracerPercentFullSpinReports";
    result[13].var1 = &self->_runloopHangPercentHeavyLogs;
    result[14].var0 = @"HangTracerDailyMicroHangLogLimit";
    result[14].var1 = &self->_runLoopMicroHangDailyLogLimit;
    result[15].var0 = @"HangTracerDailyLogLimit";
    result[15].var1 = &self->_runLoopHangDailyLogLimit;
    result[16].var0 = @"HangTracerPerPeriodLogLimit";
    result[16].var1 = &self->_runLoopHangPerPeriodLogLimit;
    result[17].var0 = @"HangTracerDailyLongLogLimit";
    result[17].var1 = &self->_runLoopLongHangDailyLogLimit;
    result[18].var0 = @"HangTracerDailyThirdPartyLogLimit";
    result[18].var1 = &self->_runloopHangThirdPartyDailyLogLimit;
    result[19].var0 = @"HangTracerFenceHangLogLimit";
    result[19].var1 = &self->_fenceHangDailyLogLimit;
    result[20].var0 = @"HangTracerHangTimeoutDuration";
    result[20].var1 = &self->_runloopHangTimeoutDurationMSec;
    int64x2_t v9 = vdupq_n_s64(0x2328uLL);
    result[21].var0 = @"HangTracerDuration";
    result[21].var1 = &self->_runloopHangDurationThresholdMSec;
    result[22].var0 = @"HangTracerLongHangDurationThreshold";
    result[22].var1 = &self->_runloopLongHangDurationThresholdMSec;
    int64x2_t v10 = vdupq_n_s64(0x7D0uLL);
    result[23].var0 = @"HangTracerThirdPartyHangThreshold";
    result[23].var1 = &self->_runloopHangThirdPartyDurationThresholdMSec;
    result[24].var0 = @"HangTracerSpringBoardHangIORegGPUDumpTimeout";
    result[24].var1 = &self->_springBoardHangIORegGPUDumpTimeoutMSec;
    result[25].var0 = @"HangTracerFenceTrackingEnabled";
    result[25].var1 = &self->_fenceTrackingEnabled;
    HIDWORD(result[25].var2.var3) = *(_DWORD *)&v70[3];
    HIDWORD(result[25].var3.var3) = *(_DWORD *)&v69[3];
    result[26].var0 = @"HangTracerSlowActPerAppMax";
    result[26].var1 = &self->_slowAppActivationPerAppMaxLogLimit;
    result[27].var0 = @"HangTracerSlowActDailyLogLimit";
    result[27].var1 = &self->_slowAppActivationDailyLogLimit;
    result[28].var0 = @"HangTracerSlowActTailspinsEnabled";
    result[28].var1 = &self->_slowAppActivationTailspinEnabled;
    HIDWORD(result[28].var2.var3) = *(_DWORD *)&v68[3];
    HIDWORD(result[28].var3.var3) = *(_DWORD *)&v67[3];
    result[29].var0 = @"HangTracerSlowActLaunchTailspinThreshold";
    result[29].var1 = &self->_slowAppActivationThresholdMSec;
    int64x2_t v11 = vdupq_n_s64(0x1388uLL);
    result[30].var0 = @"HangTracerEnableSignpostMonitoring";
    result[30].var1 = &self->_signpostMonitoringEnabled;
    result[31].var0 = @"HangTracerSignpostMonitoringDailyLogLimit";
    result[31].var1 = &self->_signpostMonitoringDailyLogLimit;
    result[32].var0 = @"HangTracerSignpostMonitoringPerPeriodLogLimit";
    result[32].var1 = &self->_signpostMonitoringPerPeriodLogLimit;
    result[33].var0 = @"HangTracerEnableAppLaunchMonitoring";
    result[33].var1 = &self->_appLaunchMonitoringEnabled;
    HIDWORD(result[33].var2.var3) = *(_DWORD *)&v64[3];
    HIDWORD(result[33].var3.var3) = *(_DWORD *)&v63[3];
    result[34].var0 = @"HangTracerEnableWorkflowResponsiveness";
    result[34].var1 = &self->_workflowResponsivenessEnabled;
    result[35].var0 = @"HangTracerWorkflowResponsivenessDailyLogLimit";
    result[35].var1 = &self->_workflowResponsivenessDailyLogLimit;
    result[36].var0 = @"HangTracerWorkflowResponsivenessPerPeriodLogLimit";
    result[36].var1 = &self->_workflowResponsivenessPerPeriodLogLimit;
    result[16].var2.var1 = 4;
    result[16].var3.var1 = 4;
    result[32].var2.var1 = 4;
    result[32].var3.var1 = 4;
    result[36].var2.var1 = 4;
    result[36].var3.var1 = 4;
    result[37].var0 = @"HangTracerEnableMemoryLogging";
    result[37].var1 = &self->_memoryLoggingEnabled;
    HIDWORD(result[37].var2.var3) = *(_DWORD *)&v60[3];
    HIDWORD(result[37].var3.var3) = *(_DWORD *)&v59[3];
    result[38].var0 = @"HangTracerMemoryLoggingInterval";
    result[38].var1 = &self->_memoryLoggingIntervalSec;
    result[38].var2.var1 = 3600;
    result[38].var3.var1 = 3600;
    result[38].var5 = sel_initPropertyMemoryLoggingIntervalSec_;
    result[39].var0 = @"EPLEnabledProfile";
    result[39].var1 = &self->_eplEnabledProfile;
    result[40].var0 = @"EPLEnabled";
    result[40].var1 = &self->_eplEnabled;
    HIDWORD(result[40].var2.var3) = *(_DWORD *)&v56[3];
    result[41].var0 = @"EPLTimeoutTimestampSec";
    result[41].var1 = &self->_eplTimeoutTimestampSec;
    result[42].var0 = @"HangTracerReportPeriod";
    result[42].var1 = &self->_reportPeriodMATU;
    result[42].var5 = sel_initPropertyReportPeriod_;
    result[43].var0 = @"HangTracerInternalSettingCreated";
    result[43].var1 = &self->_hasInternalSettings;
    result[43].var5 = sel_initPropertyHaveInternalSettings_;
    result[44].var0 = @"HangTracerHUDThresholdMSec";
    result[44].var1 = &self->_hudThresholdMSec;
    result[44].var2.var1 = 500;
    result[44].var3.var1 = 500;
    result[45].var0 = @"HangTracerForceQuitDetectionThresholdMSec";
    result[45].var1 = &self->_forceQuitDetectionThresholdMSec;
    result[45].var2.var1 = 3000;
    result[45].var3.var1 = 3000;
    result[46].var0 = @"HangTracerThirdPartyDevHangHUDEnabled";
    result[46].var1 = &self->_thirdPartyDevHangHUDEnabled;
    HIDWORD(result[46].var2.var3) = *(_DWORD *)&v52[3];
    HIDWORD(result[46].var3.var3) = *(_DWORD *)&v51[3];
    result[47].var0 = @"HangTracerThirdPartyIncludeNonDevelopmentApps";
    result[47].var1 = &self->_thirdPartyIncludeNonDevelopmentApps;
    result[48].var0 = @"HangTracerHangWaitTimeoutDuration";
    result[48].var1 = &self->_hangWaitTimeoutDurationMSec;
    result[20].var5 = sel_initUnsignedLongProperty_;
    result[21].var5 = sel_initUnsignedLongProperty_;
    result[22].var5 = sel_initUnsignedLongProperty_;
    result[23].var5 = sel_initUnsignedLongProperty_;
    result[24].var5 = sel_initUnsignedLongProperty_;
    result[29].var5 = sel_initUnsignedLongProperty_;
    result[48].var5 = sel_initUnsignedLongProperty_;
    result[49].var0 = @"enableLoggingForPoster";
    result[49].var1 = &self->_enableLoggingForPoster;
    result[6].unint64_t var4 = 0;
    result[7].var0 = 0;
    result[7].unint64_t var4 = 0;
    __asm { FMOV            V6.2D, #2.0 }
    *(_OWORD *)&result[12].var2.var0 = _Q6;
    *(_OWORD *)&result[13].var2.var0 = xmmword_1B3C17100;
    *(int64x2_t *)&result[21].var2.var0 = vdupq_n_s64(0x1F4uLL);
    result[50].var0 = @"enableLoggingForWidgetRenderer";
    *(int64x2_t *)&result[23].var2.var0 = vdupq_n_s64(0x3E8uLL);
    *(int64x2_t *)&result[20].var2.var0 = v9;
    *(int64x2_t *)&result[24].var2.var0 = v9;
    result[50].var1 = &self->_enableLoggingForWidgetRenderer;
    result->var2.var0 = 1;
    result->var3.var0 = 0;
    result->unint64_t var4 = 0;
    result->var5 = sel_initBoolProperty_;
    result[1].var2.var0 = 0;
    result[1].var3.var0 = 0;
    result[1].unint64_t var4 = 0;
    result[1].var5 = sel_initBoolProperty_;
    result[2].var2.var0 = 0;
    result[2].var3.var0 = 0;
    result[2].unint64_t var4 = 0;
    result[2].var5 = sel_initBoolProperty_;
    result[3].var2.var0 = 1;
    result[3].var3.var0 = 0;
    result[3].unint64_t var4 = 0;
    result[3].var5 = sel_initBoolProperty_;
    result[51].var0 = @"PDSEPrefHangTracerKillSwitch";
    result[4].var3.var1 = 20;
    result[4].unint64_t var4 = 0;
    result[4].var5 = sel_initUnsignedIntProperty_;
    result[5].var2.var0 = 0;
    result[5].var3.var0 = 0;
    result[5].unint64_t var4 = 0;
    result[5].var5 = sel_initBoolProperty_;
    result[7].var2.var0 = 0;
    result[7].var3.var0 = 0;
    result[8].var2.var0 = 0;
    result[8].var3.var0 = 0;
    result[8].unint64_t var4 = 0;
    result[8].var5 = sel_initBoolProperty_;
    result[9].var2.var0 = 1;
    result[9].var3.var0 = 1;
    result[9].unint64_t var4 = 0;
    result[9].var5 = sel_initBoolProperty_;
    result[10].var2.var0 = 0;
    result[10].var3.var0 = 0;
    result[10].unint64_t var4 = 0;
    result[10].var5 = sel_initBoolProperty_;
    result[11].var2.var0 = 1;
    result[11].var3.var0 = 1;
    result[11].unint64_t var4 = 0;
    result[11].var5 = sel_initBoolProperty_;
    result[12].unint64_t var4 = 0;
    result[12].var5 = sel_initDoubleProperty_;
    result[13].unint64_t var4 = 0;
    result[13].var5 = sel_initDoubleProperty_;
    result[51].var1 = &self->_pdseHangTracerKillSwitch;
    result[14].var2.var1 = 10;
    result[14].var3.var1 = 10;
    result[14].unint64_t var4 = 0;
    result[14].var5 = sel_initIntProperty_;
    result[52].var0 = @"PDSEPrefHTRateOnlyKillSwitch";
    result[15].var2.var1 = 25;
    result[15].var3.var1 = 25;
    result[15].unint64_t var4 = 0;
    result[15].var5 = sel_initIntProperty_;
    result[16].unint64_t var4 = 0;
    result[16].var5 = sel_initIntProperty_;
    result[17].var2.var1 = 25;
    result[17].var3.var1 = 25;
    result[17].unint64_t var4 = 0;
    result[17].var5 = sel_initIntProperty_;
    result[18].var2.var1 = 10;
    result[18].var3.var1 = 10;
    result[18].unint64_t var4 = 0;
    result[18].var5 = sel_initIntProperty_;
    result[19].var2.var1 = 25;
    result[19].var3.var1 = 25;
    result[19].unint64_t var4 = 0;
    result[19].var5 = sel_initIntProperty_;
    result[20].unint64_t var4 = 1;
    result[21].unint64_t var4 = 1;
    *(int64x2_t *)&result[22].var2.var0 = v10;
    result[22].unint64_t var4 = 1;
    result[23].unint64_t var4 = 1;
    result[24].unint64_t var4 = 0;
    result[25].var2.var0 = 1;
    result[25].var3.var0 = 1;
    result[25].unint64_t var4 = 0;
    result[25].var5 = sel_initBoolProperty_;
    result[26].var2.var1 = 25;
    result[26].var3.var1 = 25;
    result[26].unint64_t var4 = 0;
    result[26].var5 = sel_initIntProperty_;
    result[27].var2.var1 = 25;
    result[27].var3.var1 = 25;
    result[27].unint64_t var4 = 0;
    result[27].var5 = sel_initIntProperty_;
    result[28].var2.var0 = 0;
    result[28].var3.var0 = 0;
    result[28].unint64_t var4 = 0;
    result[28].var5 = sel_initBoolProperty_;
    result[41].var2 = v6;
    result[41].var3 = v8;
    result[41].unint64_t var4 = 0;
    result[41].var5 = sel_initDoubleProperty_;
    *(int64x2_t *)&result[29].var2.var0 = v11;
    result[29].unint64_t var4 = 1;
    result[30].var2.var0 = 1;
    result[40].var3.var0 = 0;
    result[40].unint64_t var4 = 0;
    result[40].var5 = sel_initBoolProperty_;
    result[30].var3.var0 = 0;
    result[30].unint64_t var4 = 0;
    result[30].var5 = sel_initBoolProperty_;
    result[39].unint64_t var4 = 0;
    result[39].var5 = sel_initBoolProperty_;
    result[40].var2.var0 = 0;
    result[31].var2.var1 = 25;
    result[31].var3.var1 = 25;
    result[31].unint64_t var4 = 0;
    result[31].var5 = sel_initIntProperty_;
    result[39].var2.var0 = 0;
    result[39].var3.var0 = 0;
    result[32].unint64_t var4 = 0;
    result[32].var5 = sel_initIntProperty_;
    result[33].var2.var0 = 1;
    result[33].var3.var0 = 0;
    result[37].var5 = sel_initBoolProperty_;
    result[38].unint64_t var4 = 1;
    result[33].unint64_t var4 = 0;
    result[33].var5 = sel_initBoolProperty_;
    result[34].var2.var0 = 1;
    result[37].var2.var0 = 1;
    result[37].var3.var0 = 0;
    result[37].unint64_t var4 = 0;
    result[34].var3.var0 = 0;
    result[34].unint64_t var4 = 0;
    result[34].var5 = sel_initBoolProperty_;
    result[35].var2.var1 = 25;
    result[36].unint64_t var4 = 0;
    result[36].var5 = sel_initIntProperty_;
    result[35].var3.var1 = 25;
    result[35].unint64_t var4 = 0;
    result[35].var5 = sel_initIntProperty_;
    *(int64x2_t *)&result[42].var2.var0 = vdupq_n_s64(0x40AC200000000000uLL);
    result[42].unint64_t var4 = 2;
    result[43].var2.var0 = 0;
    result[43].var3.var0 = 0;
    result[43].unint64_t var4 = 0;
    result[44].unint64_t var4 = 1;
    result[44].var5 = sel_initUnsignedIntProperty_;
    result[45].unint64_t var4 = 1;
    result[45].var5 = sel_initUnsignedIntProperty_;
    result[46].var2.var0 = 0;
    result[46].var3.var0 = 0;
    result[46].unint64_t var4 = 0;
    result[46].var5 = sel_initBoolProperty_;
    result[47].var2.var0 = 0;
    result[47].var3.var0 = 0;
    result[47].unint64_t var4 = 0;
    result[47].var5 = sel_initBoolProperty_;
    *(int64x2_t *)&result[48].var2.var0 = v11;
    result[48].unint64_t var4 = 0;
    result[49].var2.var0 = 0;
    result[49].var3.var0 = 0;
    result[49].unint64_t var4 = 0;
    result[49].var5 = sel_initBoolProperty_;
    result[50].var2.var0 = 0;
    result[50].var3.var0 = 0;
    result[50].unint64_t var4 = 0;
    result[50].var5 = sel_initBoolProperty_;
    result[51].var2.var0 = 0;
    result[51].var3.var0 = 0;
    result[51].unint64_t var4 = 0;
    result[51].var5 = sel_initBoolProperty_;
    result[52].var1 = &self->_pdseHTRateOnlyKillSwitch;
    result[52].var2.var0 = 0;
    result[52].var3.var0 = 0;
    result[52].unint64_t var4 = 0;
    result[52].var5 = sel_initBoolProperty_;
    result[53].var0 = @"PDSEPrefHTThirdPartyKillSwitch";
    result[53].var1 = &self->_pdseHTThirdPartyKillSwitch;
    result[53].var2.var0 = 0;
    HIDWORD(result[53].var2.var3) = *(_DWORD *)&v40[3];
    *(_DWORD *)(&result[53].var2.var0 + 1) = *(_DWORD *)v40;
    result[53].var3.var0 = 0;
    HIDWORD(result[53].var3.var3) = *(_DWORD *)&v39[3];
    *(_DWORD *)(&result[53].var3.var0 + 1) = *(_DWORD *)v39;
    result[53].unint64_t var4 = 0;
    result[53].var5 = sel_initBoolProperty_;
    result[54].var0 = @"PDSEPrefAppLaunchKillSwitch";
    result[54].var1 = &self->_pdseAppLaunchKillSwitch;
    result[54].var2.var0 = 0;
    HIDWORD(result[54].var2.var3) = *(_DWORD *)&v38[3];
    *(_DWORD *)(&result[54].var2.var0 + 1) = *(_DWORD *)v38;
    result[54].var3.var0 = 0;
    HIDWORD(result[54].var3.var3) = *(_DWORD *)&v37[3];
    *(_DWORD *)(&result[54].var3.var0 + 1) = *(_DWORD *)v37;
    result[54].unint64_t var4 = 0;
    result[54].var5 = sel_initBoolProperty_;
    result[55].var0 = @"HangTracerShouldUploadToDiagPipe";
    result[55].var1 = &self->_shouldUploadToDiagPipe;
    result[55].var2.var0 = 1;
    HIDWORD(result[55].var2.var3) = *(_DWORD *)&v36[3];
    *(_DWORD *)(&result[55].var2.var0 + 1) = *(_DWORD *)v36;
    result[55].var3.var0 = 1;
    HIDWORD(result[55].var3.var3) = *(_DWORD *)&v35[3];
    *(_DWORD *)(&result[55].var3.var0 + 1) = *(_DWORD *)v35;
    result[55].unint64_t var4 = 0;
    result[55].var5 = sel_initBoolProperty_;
    result[56].var0 = @"PDSEPrefSentryKillSwitch";
    result[56].var1 = &self->_pdseSentryKillSwitch;
    result[56].var2.var0 = 0;
    HIDWORD(result[56].var2.var3) = *(_DWORD *)&v34[3];
    *(_DWORD *)(&result[56].var2.var0 + 1) = *(_DWORD *)v34;
    result[56].var3.var0 = 1;
    HIDWORD(result[56].var3.var3) = *(_DWORD *)&v33[3];
    *(_DWORD *)(&result[56].var3.var0 + 1) = *(_DWORD *)v33;
    result[56].unint64_t var4 = 0;
    result[56].var5 = sel_initBoolProperty_;
    result[57].var0 = @"PDSEPrefWorkflowResponsivenessKillSwitch";
    result[57].var1 = &self->_pdseWorkflowResponsivenessKillSwitch;
    result[57].var2.var0 = 0;
    HIDWORD(result[57].var2.var3) = *(_DWORD *)&v32[3];
    *(_DWORD *)(&result[57].var2.var0 + 1) = *(_DWORD *)v32;
    result[57].var3.var0 = 1;
    HIDWORD(result[57].var3.var3) = *(_DWORD *)&v31[3];
    *(_DWORD *)(&result[57].var3.var0 + 1) = *(_DWORD *)v31;
    result[57].unint64_t var4 = 0;
    result[57].var5 = sel_initBoolProperty_;
    result[58].var0 = @"PDSEPrefCATailspinKillSwitch";
    result[58].var1 = &self->_pdseCATailspinKillSwitch;
    result[58].var2.var0 = 0;
    HIDWORD(result[58].var2.var3) = *(_DWORD *)&v30[3];
    *(_DWORD *)(&result[58].var2.var0 + 1) = *(_DWORD *)v30;
    result[58].var3.var0 = 1;
    HIDWORD(result[58].var3.var3) = *(_DWORD *)&v29[3];
    *(_DWORD *)(&result[58].var3.var0 + 1) = *(_DWORD *)v29;
    result[58].unint64_t var4 = 0;
    result[58].var5 = sel_initBoolProperty_;
    result[59].var0 = @"HTSEEnablementPeriodDays";
    result[59].var1 = &self->_pdseHTPeriodDays;
    result[59].var2.var1 = 200;
    result[59].var3.var1 = 1000;
    result[59].unint64_t var4 = 0;
    result[59].var5 = sel_initIntProperty_;
    result[60].var0 = @"PDSEPrefHTRateOnlyPeriodDays";
    result[60].var1 = &self->_pdseHTRateOnlyPeriodDays;
    result[60].var2.var1 = 200;
    result[60].var3.var1 = 25;
    result[60].unint64_t var4 = 0;
    result[60].var5 = sel_initIntProperty_;
    result[61].var2.var1 = 200;
    result[61].var3.var1 = 200;
    result[61].unint64_t var4 = 0;
    result[61].var5 = sel_initIntProperty_;
    result[62].var2.var1 = 200;
    result[62].var3.var1 = 200;
    result[62].unint64_t var4 = 0;
    result[62].var5 = sel_initIntProperty_;
    result[63].var2.var1 = 100;
    result[63].var3.var1 = 0x7FFFFFFF;
    result[63].unint64_t var4 = 0;
    result[63].var5 = sel_initIntProperty_;
    result[64].var2.var1 = 200;
    result[64].var3.var1 = 400;
    result[64].unint64_t var4 = 0;
    result[64].var5 = sel_initIntProperty_;
    result[65].var2.var1 = 10;
    result[65].var3.var1 = 0x7FFFFFFF;
    result[65].unint64_t var4 = 0;
    result[65].var5 = sel_initIntProperty_;
    result[66].var2.var1 = 20;
    result[66].var3.var1 = 1000;
    result[66].unint64_t var4 = 0;
    result[66].var5 = sel_initIntProperty_;
    result[67].var2.var0 = 0;
    *(_DWORD *)(&result[67].var2.var0 + 1) = *(_DWORD *)v28;
    HIDWORD(result[67].var2.var3) = *(_DWORD *)&v28[3];
    result[67].var3.var0 = 1;
    *(_DWORD *)(&result[67].var3.var0 + 1) = *(_DWORD *)v27;
    HIDWORD(result[67].var3.var3) = *(_DWORD *)&v27[3];
    result[67].unint64_t var4 = 0;
    result[67].var5 = sel_initBoolProperty_;
    result[68].var2.var0 = 1;
    HIDWORD(result[68].var2.var3) = *(_DWORD *)&v26[3];
    *(_DWORD *)(&result[68].var2.var0 + 1) = *(_DWORD *)v26;
    result[68].var3.var0 = 1;
    HIDWORD(result[68].var3.var3) = *(_DWORD *)&v25[3];
    *(_DWORD *)(&result[68].var3.var0 + 1) = *(_DWORD *)v25;
    result[68].unint64_t var4 = 0;
    result[68].var5 = sel_initBoolProperty_;
    *(_OWORD *)&result[69].var2.var0 = 0u;
    result[69].unint64_t var4 = 0;
    result[69].var5 = sel_initDoubleProperty_;
    result[70].var2.var1 = 14;
    result[70].var3.var1 = 14;
    result[70].unint64_t var4 = 0;
    result[70].var5 = sel_initUnsignedIntProperty_;
    result[71].var2.var1 = 2;
    result[71].var3.var1 = 2;
    result[71].unint64_t var4 = 0;
    result[71].var5 = sel_initUnsignedIntProperty_;
    *(int64x2_t *)&result[72].var2.var0 = v10;
    result[72].unint64_t var4 = 0;
    result[72].var5 = sel_initUnsignedIntProperty_;
    result[73].var2.var1 = 8;
    result[73].var3.var1 = 8;
    result[73].unint64_t var4 = 0;
    result[73].var5 = sel_initUnsignedIntProperty_;
    result[74].var2.var1 = 1;
    result[74].var3.var1 = 1;
    result[74].unint64_t var4 = 1;
    result[74].var5 = sel_initUnsignedIntProperty_;
    result[75].var2.var0 = 0;
    *(_DWORD *)(&result[75].var2.var0 + 1) = *(_DWORD *)v24;
    HIDWORD(result[75].var2.var3) = *(_DWORD *)&v24[3];
    result[75].var3.var0 = 0;
    *(_DWORD *)(&result[75].var3.var0 + 1) = *(_DWORD *)v23;
    HIDWORD(result[75].var3.var3) = *(_DWORD *)&v23[3];
    result[75].unint64_t var4 = 0;
    result[75].var5 = sel_initBoolProperty_;
    result[76].var2.var0 = 0;
    HIDWORD(result[76].var2.var3) = *(_DWORD *)&v22[3];
    *(_DWORD *)(&result[76].var2.var0 + 1) = *(_DWORD *)v22;
    result[76].var3.var0 = 0;
    HIDWORD(result[76].var3.var3) = *(_DWORD *)&v21[3];
    *(_DWORD *)(&result[76].var3.var0 + 1) = *(_DWORD *)v21;
    result[76].unint64_t var4 = 0;
    result[76].var5 = sel_initBoolProperty_;
    result[77].var2.var1 = 0;
    result[77].var3.var1 = 0;
    result[77].unint64_t var4 = 0;
    result[77].var5 = sel_initIntProperty_;
    result[78].var2.var0 = 0;
    HIDWORD(result[78].var2.var3) = *(_DWORD *)&v20[3];
    *(_DWORD *)(&result[78].var2.var0 + 1) = *(_DWORD *)v20;
    result[78].var3.var0 = 0;
    HIDWORD(result[78].var3.var3) = *(_DWORD *)&v19[3];
    *(_DWORD *)(&result[78].var3.var0 + 1) = *(_DWORD *)v19;
    result[78].unint64_t var4 = 0;
    result[78].var5 = sel_initBoolProperty_;
    *(_OWORD *)&result[79].var0 = 0u;
    result[79].var2.var0 = 0;
    HIDWORD(result[79].var2.var3) = 0;
    *(_DWORD *)(&result[79].var2.var0 + 1) = 0;
    result[79].var5 = 0;
    *(_OWORD *)(&result[79].var3.var0 + 1) = v85;
    result[79].var3.var0 = 0;
    self->_prefInitList = result;
  }
  return result;
}

- (void)initPropertyReportPeriod:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double reportPeriodMATU = (double)self->_reportPeriodMATU;
  [(HTPrefs *)self doubleProperty:a3 contextPrefixOut:0];
  double v7 = v6 * 1000.0 / timebaseConversionFactor();
  if (v7 != reportPeriodMATU)
  {
    HTPrefDefaultVal v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int64x2_t v11 = var0;
      __int16 v12 = 2048;
      double v13 = reportPeriodMATU;
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %f -> %f", (uint8_t *)&v10, 0x20u);
    }

    self->_double reportPeriodMATU = (unint64_t)v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)initPropertyMemoryLoggingIntervalSec:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int memoryLoggingIntervalSec = self->_memoryLoggingIntervalSec;
  uint64_t v6 = [(HTPrefs *)self unsignedIntProperty:a3 contextPrefixOut:0];
  if (memoryLoggingIntervalSec != v6)
  {
    uint64_t v7 = v6;
    HTPrefDefaultVal v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int64x2_t v11 = var0;
      __int16 v12 = 1024;
      unsigned int v13 = memoryLoggingIntervalSec;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %u -> %u", (uint8_t *)&v10, 0x18u);
    }

    [(HTPrefs *)self setMemoryLoggingIntervalSec:v7];
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)setMemoryLoggingIntervalSec:(unsigned int)a3
{
  self->_unsigned int memoryLoggingIntervalSec = a3;
}

- (void)initPropertyHaveInternalSettings:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  HTPrefDefaultVal v5 = (void *)CFPreferencesCopyValue(@"HangTracerInternalSettingCreated", self->__htTaskingDomain, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  int hasInternalSettings = self->_hasInternalSettings;
  int v7 = v5 != 0;
  if (hasInternalSettings != v7)
  {
    HTPrefDefaultVal v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int64x2_t v11 = var0;
      __int16 v12 = 1024;
      int v13 = hasInternalSettings;
      __int16 v14 = 1024;
      BOOL v15 = v5 != 0;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", (uint8_t *)&v10, 0x18u);
    }

    self->_int hasInternalSettings = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)initPropertyHangtracerDaemonEnabled:(HTPrefInit *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int hangtracerDaemonEnabled = self->_hangtracerDaemonEnabled;
  id v13 = 0;
  int v6 = [(HTPrefs *)self BOOLProperty:a3 contextPrefixOut:&v13];
  id v7 = v13;
  id v8 = v13;
  int64x2_t v9 = self->_enablementPrefix;
  if (![(NSString *)v9 isEqualToString:v8])
  {
    objc_storeStrong((id *)&self->_enablementPrefix, v7);
    int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(HTPrefs *)(uint64_t)v9 initPropertyHangtracerDaemonEnabled:v10];
    }
  }
  if (hangtracerDaemonEnabled != v6)
  {
    self->_int hangtracerDaemonEnabled = v6;
    int64x2_t v11 = shared_ht_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      *(_DWORD *)buf = 138412802;
      BOOL v15 = var0;
      __int16 v16 = 1024;
      int v17 = hangtracerDaemonEnabled;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_debug_impl(&dword_1B3C06000, v11, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", buf, 0x18u);
    }

    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

+ (id)sharedPrefs
{
  if (sharedPrefs_onceToken != -1) {
    dispatch_once(&sharedPrefs_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)sharedPrefs_htPrefs;
  return v2;
}

- (BOOL)hangtracerDaemonEnabled
{
  return self->_hangtracerDaemonEnabled;
}

- (BOOL)fenceTrackingEnabled
{
  return self->_fenceTrackingEnabled;
}

- (double)samplingPercentForMicroHangs
{
  return self->_samplingPercentForMicroHangs;
}

- (unint64_t)runloopHangDurationThresholdMSec
{
  return self->_runloopHangDurationThresholdMSec;
}

uint64_t __22__HTPrefs_sharedPrefs__block_invoke()
{
  sharedPrefs_htPrefs = objc_alloc_init(HTPrefs);
  return MEMORY[0x1F41817F8]();
}

- (int)numOSCryptexFileExtents
{
  return self->_numOSCryptexFileExtents;
}

- (BOOL)haveSerialLoggingEnabled
{
  return self->_haveSerialLoggingEnabled;
}

- (BOOL)haveRootsInstalled
{
  return self->_haveRootsInstalled;
}

- (BOOL)haveNonDefaultFeatureFlags
{
  return self->_haveNonDefaultFeatureFlags;
}

- (id)getHighestPrioritySettingValue:(id)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5
{
  return [(HTPrefs *)self prefNamed:a3 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:a4 contextPrefixOut:a5];
}

- (unint64_t)unsignedLongLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 16;
  if (!self->_isInternal) {
    uint64_t v5 = 24;
  }
  unint64_t v6 = *(unint64_t *)((char *)&a3->var0 + v5);
  id v7 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:sel_unsignedLongLongValue contextPrefixOut:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v8 = [v7 unsignedLongLongValue];
  unint64_t v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    int v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v14 = 138412802;
      BOOL v15 = var0;
      __int16 v16 = 2048;
      unint64_t v17 = var4;
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      _os_log_impl(&dword_1B3C06000, v10, OS_LOG_TYPE_DEFAULT, "HTPrefs: %@ failed policy check (%lu) for value %llu", (uint8_t *)&v14, 0x20u);
    }

LABEL_9:
    unint64_t v9 = v6;
  }

  return v9;
}

- (id)objectProperty:(HTPrefInit *)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5
{
  uint64_t v9 = 16;
  if (!self->_isInternal) {
    uint64_t v9 = 24;
  }
  id v10 = *(id *)((char *)&a3->var0 + v9);
  int64x2_t v11 = [(HTPrefs *)self prefNamed:a3->var0 domain:self->__htTaskingDomain profile:self->__installedHTProfileDict matchingSelector:a4 contextPrefixOut:a5];
  __int16 v12 = v11;
  if (v11)
  {
    id v13 = v11;

    id v10 = v13;
  }

  return v10;
}

- (void)initUnsignedLongLongProperty:(HTPrefInit *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)a3->var1;
  unint64_t v6 = -[HTPrefs unsignedLongProperty:contextPrefixOut:](self, "unsignedLongProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v10 = 138412802;
      int64x2_t v11 = var0;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      unint64_t v15 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v8, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %llu -> %llu", (uint8_t *)&v10, 0x20u);
    }

    *(void *)a3->var1 = v7;
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)initNSObjectProperty:(HTPrefInit *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)a3->var1;
  uint64_t v6 = [(HTPrefs *)self objectProperty:a3 matchingSelector:sel_isEqual_ contextPrefixOut:0];
  unint64_t v7 = (void *)v6;
  if ((v5 == 0) == (v6 != 0) || (v5 ? (BOOL v8 = v6 == 0) : (BOOL v8 = 1), !v8 && ([v5 isEqual:v6] & 1) == 0))
  {
    uint64_t v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v14 = 138412802;
      unint64_t v15 = var0;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_debug_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %@ -> %@", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v10 = [(HTPrefs *)self objectProperty:a3 matchingSelector:sel_isEqual_ contextPrefixOut:0];
    var1 = (void **)a3->var1;
    __int16 v12 = *var1;
    *var1 = (void *)v10;

    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)initPropertyThirdPartyDevPreferredLanguages:(HTPrefInit *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = self->_thirdPartyDevPreferredLanguages;
  uint64_t v6 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  }
  BOOL v8 = v7;
  if (![(NSArray *)v5 isEqualToArray:v7])
  {
    uint64_t v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      __int16 v12 = var0;
      __int16 v13 = 2112;
      int v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v8;
      _os_log_debug_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %@ -> %@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, v8);
    [(HTPrefs *)self setShouldPostHTPrefsChangedNotification:1];
  }
}

- (void)dealloc
{
  prefInitList = self->_prefInitList;
  if (prefInitList) {
    free(prefInitList);
  }
  v4.receiver = self;
  v4.super_class = (Class)HTPrefs;
  [(HTPrefs *)&v4 dealloc];
}

- (BOOL)shouldDisplayFenceHangToHUD
{
  return [(HTPrefs *)self hudEnabled] && [(HTPrefs *)self isInternal];
}

- (BOOL)shouldUpdateHangsHUD
{
  if ([(HTPrefs *)self hudEnabled] && [(HTPrefs *)self isInternal]) {
    return 1;
  }
  return [(HTPrefs *)self thirdPartyDevHangHUDEnabled];
}

- (void)__createInternalSettings
{
  if (![(HTPrefs *)self isInternal]) {
    return;
  }
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  objc_super v4 = (void *)CFPreferencesCopyValue(@"HangTracerInternalSettingCreated", self->__htTaskingDomain, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v5 = v4;
  uint64_t v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v4 || ([v4 BOOLValue] & 1) == 0)
  {
    id v7 = shared_ht_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl(&dword_1B3C06000, v7, OS_LOG_TYPE_INFO, "checkPreferences: Internal install, force enabled.", v13, 2u);
    }

    CFPropertyListRef v8 = *v6;
    CFPreferencesSetValue(@"HangTracerEnabled", *v6, self->__htTaskingDomain, @"mobile", v3);
    CFPreferencesSetValue(@"HangTracerInternalSettingCreated", v8, self->__htTaskingDomain, @"mobile", v3);
  }
  uint64_t v9 = (void *)CFPreferencesCopyValue(@"HangTracerInternalSettingsVersion", self->__htTaskingDomain, @"mobile", v3);
  uint64_t v10 = v9;
  if (v9)
  {
    if ([v9 unsignedIntegerValue] == 2) {
      goto LABEL_12;
    }
  }
  else
  {
    CFPreferencesSetValue(@"HangTracerDuration", 0, self->__htTaskingDomain, @"mobile", v3);
  }
  CFPreferencesSetValue(@"HangTracerInternalSettingsVersion", &unk_1F0C6E348, self->__htTaskingDomain, @"mobile", v3);
LABEL_12:
  int v11 = (void *)CFPreferencesCopyValue(@"HangTracerEnableTailspin", self->__htTaskingDomain, @"mobile", v3);
  CFPropertyListRef v12 = *v6;
  if (!v11) {
    CFPreferencesSetValue(@"HangTracerEnableTailspin", v12, self->__htTaskingDomain, @"mobile", v3);
  }
  CFPreferencesSetValue(@"HangTracerEnableMemoryLogging", v12, self->__htTaskingDomain, @"mobile", v3);
}

void __97__HTPrefs_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs___block_invoke(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    CFStringRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      objc_super v4 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl(&dword_1B3C06000, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == a2)
  {
    CFStringRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      objc_super v4 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
  {
    CFStringRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      objc_super v4 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == a2)
  {
    CFStringRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      objc_super v4 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != a2) {
      goto LABEL_18;
    }
    CFStringRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      objc_super v4 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  id v5 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  int v7 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v8 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v8 hangtracerDaemonEnabled];

  if (v7 != WeakRetained)
  {
    uint64_t v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        uint64_t v10 = @"ON";
      }
      else {
        uint64_t v10 = @"OFF";
      }
      id v11 = objc_loadWeakRetained(v5);
      if ([v11 hangtracerDaemonEnabled]) {
        CFPropertyListRef v12 = @"ON";
      }
      else {
        CFPropertyListRef v12 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1B3C06000, v9, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);
    }
    __int16 v13 = NSNumber;
    id v14 = objc_loadWeakRetained(v5);
    __int16 v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "hangtracerDaemonEnabled", @"Enabled"));
    uint64_t v20 = v15;
    __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v18 = objc_loadWeakRetained(v5);
    [v17 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v18 userInfo:v16];
  }
}

void __97__HTPrefs_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs___block_invoke_101(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == a2)
  {
    v2 = shared_ht_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFStringRef v3 = 0;
      _os_log_impl(&dword_1B3C06000, v2, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v3, 2u);
    }
  }
}

- (void)_removeAllPrefs
{
  v24[48] = *MEMORY[0x1E4F143B8];
  v24[0] = @"HangTracerInternalSettingCreated";
  v24[1] = @"HangTracerInternalSettingsVersion";
  v24[2] = @"HangTracerReportPeriod";
  v24[3] = @"HangTracerEnableCustomerMode";
  v24[4] = @"HangTracerEnabled";
  v24[5] = @"HangTracerThirdPartyRunloopLogsEnabled";
  v24[6] = @"HangTracerEnableHUD";
  unsigned char v24[7] = @"HangTracerEnableForceQuitDetection";
  v24[8] = @"HangTracerCollectOSSignposts";
  v24[9] = @"HangTracerCollectOSSignpostsDeferred";
  v24[10] = @"HangTracerEnableTailspin";
  v24[11] = @"HangTracerSavedTailspinsMaxMB";
  v24[12] = @"HangTracerKeepTailspins";
  v24[13] = @"HangTracerKeepTailspinsWithFormat";
  v24[14] = @"HangTracerPercentFullSpinReports";
  v24[15] = @"HangTracerDailyLogLimit";
  v24[16] = @"HangTracerPerPeriodLogLimit";
  v24[17] = @"HangTracerDailyLongLogLimit";
  v24[18] = @"HangTracerDailyThirdPartyLogLimit";
  v24[19] = @"HangTracerDuration";
  v24[20] = @"HangTracerLongHangDurationThreshold";
  v24[21] = @"HangTracerThirdPartyHangThreshold";
  v24[22] = @"HangTracerHangTimeoutDuration";
  v24[23] = @"HangTracerSpringBoardHangIORegGPUDumpTimeout";
  v24[24] = @"HangTracerIncludeDiskInfo";
  v24[25] = @"HangTracerEnableDisplayData";
  v24[26] = @"HangTracerIncludeNetworkState";
  v24[27] = @"HangTracerFenceTrackingEnabled";
  v24[28] = @"HangTracerSlowActTailspinsEnabled";
  v24[29] = @"HangTracerSlowActPerAppMax";
  v24[30] = @"HangTracerSlowActDailyLogLimit";
  v24[31] = @"HangTracerSlowActLaunchTailspinThreshold";
  v24[32] = @"HangTracerEnableSignpostMonitoring";
  v24[33] = @"HangTracerSignpostMonitoringDailyLogLimit";
  v24[34] = @"HangTracerSignpostMonitoringPerPeriodLogLimit";
  v24[35] = @"HangTracerEnableAppLaunchMonitoring";
  v24[36] = @"HangTracerEnableWorkflowResponsiveness";
  v24[37] = @"HangTracerWorkflowResponsivenessDailyLogLimit";
  v24[38] = @"HangTracerWorkflowResponsivenessPerPeriodLogLimit";
  v24[39] = @"HangTracerEnableMemoryLogging";
  v24[40] = @"HangTracerMemoryLoggingInterval";
  v24[41] = @"EPLEnabled";
  v24[42] = @"EPLTimeoutTimestampSec";
  v24[43] = @"HangTracerHUDThresholdMSec";
  v24[44] = @"HangTracerForceQuitDetectionThresholdMSec";
  v24[45] = @"AutomatedDeviceGroup";
  v24[46] = @"ExperimentGroup";
  v24[47] = @"HangTracerHangWaitTimeoutDuration";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:48];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        CFPreferencesSetValue(*(CFStringRef *)(*((void *)&v18 + 1) + 8 * v8++), 0, self->__htTaskingDomain, @"mobile", v5);
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [MEMORY[0x1E4F1CBF0] countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    CFPropertyListRef v12 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v12);
        }
        CFPreferencesSetValue(*(CFStringRef *)(*((void *)&v14 + 1) + 8 * v13++), 0, self->__htDomain, @"mobile", v5);
      }
      while (v10 != v13);
      uint64_t v10 = [v12 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
  CFPreferencesSynchronize(self->__htTaskingDomain, @"mobile", v5);
  CFPreferencesSynchronize(self->__htDomain, @"mobile", v5);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)customerModeEnabled
{
  return self->_customerModeEnabled;
}

- (BOOL)htTailspinEnabled
{
  return self->_htTailspinEnabled;
}

- (BOOL)hudEnabled
{
  return self->_hudEnabled;
}

- (BOOL)forceQuitDetectionEnabled
{
  return self->_forceQuitDetectionEnabled;
}

- (BOOL)shouldCollectOSSignposts
{
  return self->_shouldCollectOSSignposts;
}

- (BOOL)shouldCollectOSSignpostsDeferred
{
  return self->_shouldCollectOSSignpostsDeferred;
}

- (BOOL)shouldSaveTailspins
{
  return self->_shouldSaveTailspins;
}

- (BOOL)shouldCompressSavedTailspins
{
  return self->_shouldCompressSavedTailspins;
}

- (unint64_t)savedTailspinMaxMB
{
  return self->_savedTailspinMaxMB;
}

- (BOOL)thirdPartyRunLoopHangLogsEnabled
{
  return self->_thirdPartyRunLoopHangLogsEnabled;
}

- (double)runloopHangPercentHeavyLogs
{
  return self->_runloopHangPercentHeavyLogs;
}

- (int)runLoopMicroHangDailyLogLimit
{
  return self->_runLoopMicroHangDailyLogLimit;
}

- (int)runLoopHangDailyLogLimit
{
  return self->_runLoopHangDailyLogLimit;
}

- (int)runLoopHangPerPeriodLogLimit
{
  return self->_runLoopHangPerPeriodLogLimit;
}

- (int)runLoopLongHangDailyLogLimit
{
  return self->_runLoopLongHangDailyLogLimit;
}

- (int)runloopHangThirdPartyDailyLogLimit
{
  return self->_runloopHangThirdPartyDailyLogLimit;
}

- (int)fenceHangDailyLogLimit
{
  return self->_fenceHangDailyLogLimit;
}

- (unint64_t)runloopHangTimeoutDurationMSec
{
  return self->_runloopHangTimeoutDurationMSec;
}

- (unint64_t)runloopLongHangDurationThresholdMSec
{
  return self->_runloopLongHangDurationThresholdMSec;
}

- (unint64_t)runloopHangThirdPartyDurationThresholdMSec
{
  return self->_runloopHangThirdPartyDurationThresholdMSec;
}

- (unint64_t)springBoardHangIORegGPUDumpTimeoutMSec
{
  return self->_springBoardHangIORegGPUDumpTimeoutMSec;
}

- (BOOL)shouldIncludeDiskInfo
{
  return self->_shouldIncludeDiskInfo;
}

- (BOOL)shouldIncludeDisplayData
{
  return self->_shouldIncludeDisplayData;
}

- (BOOL)shouldIncludeNetworkState
{
  return self->_shouldIncludeNetworkState;
}

- (BOOL)shouldUploadToDiagPipe
{
  return self->_shouldUploadToDiagPipe;
}

- (BOOL)slowAppActivationTailspinEnabled
{
  return self->_slowAppActivationTailspinEnabled;
}

- (unint64_t)slowAppActivationThresholdMSec
{
  return self->_slowAppActivationThresholdMSec;
}

- (int)slowAppActivationPerAppMaxLogLimit
{
  return self->_slowAppActivationPerAppMaxLogLimit;
}

- (int)slowAppActivationDailyLogLimit
{
  return self->_slowAppActivationDailyLogLimit;
}

- (BOOL)signpostMonitoringEnabled
{
  return self->_signpostMonitoringEnabled;
}

- (BOOL)appLaunchMonitoringEnabled
{
  return self->_appLaunchMonitoringEnabled;
}

- (BOOL)workflowResponsivenessEnabled
{
  return self->_workflowResponsivenessEnabled;
}

- (int)signpostMonitoringDailyLogLimit
{
  return self->_signpostMonitoringDailyLogLimit;
}

- (int)signpostMonitoringPerPeriodLogLimit
{
  return self->_signpostMonitoringPerPeriodLogLimit;
}

- (int)workflowResponsivenessDailyLogLimit
{
  return self->_workflowResponsivenessDailyLogLimit;
}

- (int)workflowResponsivenessPerPeriodLogLimit
{
  return self->_workflowResponsivenessPerPeriodLogLimit;
}

- (BOOL)appActivationLoggingEnabled
{
  return self->_appActivationLoggingEnabled;
}

- (double)appActivationLoggingCPUUtilizationThresholdMSec
{
  return self->_appActivationLoggingCPUUtilizationThresholdMSec;
}

- (unsigned)appActivationLoggingMaxActivationLimit
{
  return self->_appActivationLoggingMaxActivationLimit;
}

- (BOOL)enableLoggingForPoster
{
  return self->_enableLoggingForPoster;
}

- (void)setEnableLoggingForPoster:(BOOL)a3
{
  self->_enableLoggingForPoster = a3;
}

- (BOOL)enableLoggingForWidgetRenderer
{
  return self->_enableLoggingForWidgetRenderer;
}

- (void)setEnableLoggingForWidgetRenderer:(BOOL)a3
{
  self->_enableLoggingForWidgetRenderer = a3;
}

- (BOOL)memoryLoggingEnabled
{
  return self->_memoryLoggingEnabled;
}

- (unsigned)memoryLoggingIntervalSec
{
  return self->_memoryLoggingIntervalSec;
}

- (BOOL)pdseHangTracerKillSwitch
{
  return self->_pdseHangTracerKillSwitch;
}

- (BOOL)pdseHTBadDayKillSwitch
{
  return self->_pdseHTBadDayKillSwitch;
}

- (BOOL)pdseHTRateOnlyKillSwitch
{
  return self->_pdseHTRateOnlyKillSwitch;
}

- (BOOL)pdseHTThirdPartyKillSwitch
{
  return self->_pdseHTThirdPartyKillSwitch;
}

- (BOOL)pdseSentryKillSwitch
{
  return self->_pdseSentryKillSwitch;
}

- (BOOL)pdseAppLaunchKillSwitch
{
  return self->_pdseAppLaunchKillSwitch;
}

- (BOOL)pdseWorkflowResponsivenessKillSwitch
{
  return self->_pdseWorkflowResponsivenessKillSwitch;
}

- (BOOL)pdseCATailspinKillSwitch
{
  return self->_pdseCATailspinKillSwitch;
}

- (BOOL)pdseAllowEnableTailspin
{
  return self->_pdseAllowEnableTailspin;
}

- (int)pdseHTPeriodDays
{
  return self->_pdseHTPeriodDays;
}

- (int)pdseHTRateOnlyPeriodDays
{
  return self->_pdseHTRateOnlyPeriodDays;
}

- (int)pdseHTThirdPartyPeriodDays
{
  return self->_pdseHTThirdPartyPeriodDays;
}

- (int)pdseHTThirdPartyNoLogUploadPeriodDays
{
  return self->_pdseHTThirdPartyNoLogUploadPeriodDays;
}

- (int)pdseSentryPeriodDays
{
  return self->_pdseSentryPeriodDays;
}

- (int)pdseAppLaunchPeriodDays
{
  return self->_pdseAppLaunchPeriodDays;
}

- (int)pdseWorkflowResponsivenessPeriodDays
{
  return self->_pdseWorkflowResponsivenessPeriodDays;
}

- (int)pdseCATailspinPeriodDays
{
  return self->_pdseCATailspinPeriodDays;
}

- (BOOL)eplEnabledProfile
{
  return self->_eplEnabledProfile;
}

- (BOOL)eplEnabled
{
  return self->_eplEnabled;
}

- (double)eplTimeoutTimestampSec
{
  return self->_eplTimeoutTimestampSec;
}

- (unint64_t)reportPeriodMATU
{
  return self->_reportPeriodMATU;
}

- (BOOL)hasInternalSettings
{
  return self->_hasInternalSettings;
}

- (unsigned)hudThresholdMSec
{
  return self->_hudThresholdMSec;
}

- (unsigned)forceQuitDetectionThresholdMSec
{
  return self->_forceQuitDetectionThresholdMSec;
}

- (BOOL)thirdPartyDevHangHUDEnabled
{
  return self->_thirdPartyDevHangHUDEnabled;
}

- (BOOL)thirdPartyIncludeNonDevelopmentApps
{
  return self->_thirdPartyIncludeNonDevelopmentApps;
}

- (NSArray)thirdPartyDevPreferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (unint64_t)hangWaitTimeoutDurationMSec
{
  return self->_hangWaitTimeoutDurationMSec;
}

- (BOOL)isCarryDevice
{
  return self->_isCarryDevice;
}

- (NSString)enablementPrefix
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (double)badDaySecondsBetweenLastEnablementAndReferenceDate
{
  return self->_badDaySecondsBetweenLastEnablementAndReferenceDate;
}

- (unsigned)badDayEnablementMinimumBreakDurationDays
{
  return self->_badDayEnablementMinimumBreakDurationDays;
}

- (unsigned)badDayEnablementDurationDays
{
  return self->_badDayEnablementDurationDays;
}

- (unint64_t)badDayEnablementForHangDurationMSec
{
  return self->_badDayEnablementForHangDurationMSec;
}

- (unsigned)badDayEnablementForLogCount
{
  return self->_badDayEnablementForLogCount;
}

- (unsigned)badDayEnablementForPreviousDays
{
  return self->_badDayEnablementForPreviousDays;
}

- (OS_dispatch_queue)_prefsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 320, 1);
}

- (void)set_prefsQueue:(id)a3
{
}

- (NSString)tailspinSaveFormat
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setTailspinSaveFormat:(id)a3
{
}

- (NSString)experimentGroup
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setExperimentGroup:(id)a3
{
}

- (NSString)automationGroup
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAutomationGroup:(id)a3
{
}

- (BOOL)keepTailspinsLegacy
{
  return self->_keepTailspinsLegacy;
}

- (void)setKeepTailspinsLegacy:(BOOL)a3
{
  self->_int keepTailspinsLegacy = a3;
}

- (NSDictionary)_installedHTProfileDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (void)set_installedHTProfileDict:(id)a3
{
}

- (NSString)_profilePath
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)set_profilePath:(id)a3
{
}

- (__CFString)_htTaskingDomain
{
  return self->__htTaskingDomain;
}

- (void)set_htTaskingDomain:(__CFString *)a3
{
  self->__htTaskingDomain = a3;
}

- (__CFString)_htDomain
{
  return self->__htDomain;
}

- (void)set_htDomain:(__CFString *)a3
{
  self->__htDomain = a3;
}

- (BOOL)shouldAllowSentryEnablement
{
  return self->_shouldAllowSentryEnablement;
}

- (void)setShouldAllowSentryEnablement:(BOOL)a3
{
  self->_shouldAllowSentryEnablement = a3;
}

- (BOOL)shouldAllowWorkflowResponsivenessEnablement
{
  return self->_shouldAllowWorkflowResponsivenessEnablement;
}

- (void)setShouldAllowWorkflowResponsivenessEnablement:(BOOL)a3
{
  self->_shouldAllowWorkflowResponsivenessEnablement = a3;
}

- (BOOL)_isInternalNoOverride
{
  return self->__isInternalNoOverride;
}

- (void)set_isInternalNoOverride:(BOOL)a3
{
  self->__int isInternalNoOverride = a3;
}

- (NSString)thirdPartyDevBootSessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyDevBootSessionUUID, 0);
  objc_storeStrong((id *)&self->__profilePath, 0);
  objc_storeStrong((id *)&self->__installedHTProfileDict, 0);
  objc_storeStrong((id *)&self->_automationGroup, 0);
  objc_storeStrong((id *)&self->_experimentGroup, 0);
  objc_storeStrong((id *)&self->_tailspinSaveFormat, 0);
  objc_storeStrong((id *)&self->__prefsQueue, 0);
  objc_storeStrong((id *)&self->_enablementPrefix, 0);
  objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, 0);
}

- (void)prefNamed:(os_log_t)log domain:profile:matchingSelector:contextPrefixOut:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1B3C06000, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

- (void)initPropertyHangtracerDaemonEnabled:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0(&dword_1B3C06000, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

- (void)initPropertyIsInternal:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B3C06000, v0, v1, "HTPrefs: %@: %@ -> %@");
}

- (void)initPropertyIsInternal:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B3C06000, v0, v1, "HTPrefs: %@: %@ -> %@");
}

- (void)initPropertyShouldSaveAndCompressTailspins:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B3C06000, v0, v1, "HTPrefs: %@: %@ -> %@");
}

- (void)initPropertyShouldSaveAndCompressTailspins:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B3C06000, v0, v1, "HTPrefs: %@: %@ -> %@");
}

- (void)prefInitList
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1B3C06000, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

- (void)setupPrefsWithQueue:.cold.1()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

@end
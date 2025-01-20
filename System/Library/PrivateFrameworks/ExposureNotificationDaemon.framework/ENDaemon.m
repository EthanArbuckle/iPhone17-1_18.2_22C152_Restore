@interface ENDaemon
+ (BOOL)deviceSupportsFaceID;
- (BOOL)_bluetoothMonitorShouldRun;
- (BOOL)_getExposureMatchAttemptBool;
- (BOOL)_isNKDActive;
- (BOOL)_postExposureNotificationForClassification:(id)a3 status:(int64_t)a4 region:(id)a5;
- (BOOL)_shouldDisableMonthlySummary;
- (BOOL)_writePreferenceActiveEntity:(id)a3;
- (BOOL)_writePreferenceRegionPendingOnboarding:(id)a3;
- (BOOL)automaticRegionSwitchEnabled;
- (BOOL)availabilityAlertDisabled;
- (BOOL)isDeviceUnlocked;
- (BOOL)isOnboardingNeeded;
- (BOOL)isProxyEnabledForTestResultManager:(id)a3;
- (BOOL)monthlySummaryDisabled;
- (BOOL)onboardingFirstTime;
- (BOOL)prefAggressiveScanning;
- (BOOL)prefConfigurationManagerEnabled;
- (BOOL)prefDeveloperServerConfiguration;
- (BOOL)prefEnableNKD;
- (BOOL)prefEnabled;
- (BOOL)prefLoggingRPI;
- (BOOL)prefLoggingSensitive;
- (BOOL)prefNetworkProxyEnabled;
- (BOOL)prefPaused;
- (BOOL)prefRegionMonitorTestMode;
- (BOOL)prefServerForceDisable;
- (BOOL)prefSkipExposureWindowShuffling;
- (BOOL)prefSkipFileSigning;
- (BOOL)prefStoreDemoMode;
- (BOOL)prefTCCAllowWithoutApps;
- (BOOL)wasInDifferentActiveRegion;
- (BOOL)wasInRestrictedStatus;
- (CUSystemMonitor)systemMonitor;
- (ENActiveEntity)activeEntity;
- (ENConfigurationManager)configurationManager;
- (ENDaemon)init;
- (ENDaemonDelegate)delegate;
- (ENDifferentialPrivacyManager)differentialPrivacyManager;
- (ENDownloadManager)downloadManager;
- (ENExposureDetectionManager)exposureDetectionManager;
- (ENOnboardingManager)onboardingManager;
- (ENRegion)onboardingRegionTrigger;
- (ENRegionMonitor)regionMonitor;
- (ENTemporaryExposureKeyManager)temporaryExposureKeyManager;
- (ENTestResultManager)testResultManager;
- (ENTextMessageManager)textMessageManager;
- (ENUserAlert)userAlert;
- (ENXPCTimer)monthlyNotificationTimer;
- (ENXPCTimer)onboardingTimer;
- (NSBackgroundActivityScheduler)persistencePurgeScheduler;
- (NSMutableDictionary)appActivities;
- (NSMutableDictionary)remoteUISessions;
- (NSMutableDictionary)screenUnlockPendingActions;
- (NSMutableOrderedSet)previouslyTrackedApps;
- (NSString)btTracingAppID;
- (NSString)description;
- (NSString)prefRegionIdentifierOverride;
- (OS_dispatch_queue)dispatchDownloadManagingQueue;
- (OS_dispatch_queue)dispatchExposureDetectionManagingQueue;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)dispatchTestResultManagingQueue;
- (PrivacyProxyServiceStatus)networkProxyStatus;
- (SBSRemoteAlertHandle)buddyAlertHandle;
- (SFClient)sharingClient;
- (UNUserNotificationCenter)userNotificationCenter;
- (double)prefDatabasePurgeInterval;
- (double)prefServerConfigurationRefreshInterval;
- (double)timeForAvailabilityAlertCycleReset;
- (id)_getBundleIDFromBundle:(__CFBundle *)a3;
- (id)_getDelegateAndReturnError:(id *)a3;
- (id)_getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:(id)a3;
- (id)_getDownloadEndpointsAndReturnError:(id *)a3;
- (id)_getInfoDictFromAppProxy:(id)a3;
- (id)_getInfoDictFromBundle:(__CFBundle *)a3;
- (id)_getReportTypeForSession:(id)a3;
- (id)_getReportTypeFromMetadata:(id)a3;
- (id)_readPreferenceActiveEntity;
- (id)_readPreferenceRegionPendingOnboarding;
- (id)activeRegionForExposureDetectionManager:(id)a3;
- (id)advertisementDatabaseQuerySessionWithAttenuationThreshold:(unsigned __int8)a3 error:(id *)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)exposureDetectionManager:(id)a3 advertisementDatabaseQuerySessionWithAttenuationThreshold:(unsigned __int8)a4 error:(id *)a5;
- (id)getExposureDatabaseAndReturnError:(id *)a3;
- (id)legacyHistoryPath;
- (id)loadHistorySinceTime:(double)a3;
- (id)loadLegacyHistorySinceTime:(double)a3;
- (id)regionForBundleInfo:(id)a3;
- (id)temporaryExposureKeyManager:(id)a3 retrieveTEKHistoryIncludingActive:(BOOL)a4 generateNewTEK:(BOOL)a5;
- (id)xpcConnectionForBundleID:(id)a3;
- (int64_t)getOverallStatus;
- (int64_t)onboardingLegalConsentLastViewCount;
- (int64_t)overallStatus;
- (int64_t)prefDifferentialPrivacyConsent;
- (int64_t)tccAccessForBundleID:(id)a3;
- (int64_t)travelStatus;
- (unint64_t)networkProxyTraffic;
- (unsigned)_getAvailabilityAlertCountIncrement:(BOOL)a3 reset:(BOOL)a4;
- (unsigned)_getLatestExposureForDifferentialPrivacy;
- (unsigned)_getLegalConsentPageCount;
- (unsigned)appDequeueActivityFlagsWithBundleID:(id)a3;
- (unsigned)onboardingTrigger;
- (unsigned)prefRateLimitMaxAPICount;
- (unsigned)prefRateLimitMaxAPICountV2;
- (unsigned)stateMetricVersion;
- (unsigned)usageExposureDetectFileActivate;
- (unsigned)usageExposureDetectFileAddKeys;
- (unsigned)usageExposureDetectFileFinish;
- (unsigned)usageExposureDetectFileGetExposureWindows;
- (unsigned)usageExposureDetectFileGetExposures;
- (unsigned)usageGetDiagnosisKeys;
- (unsigned)usageManagerActivate;
- (unsigned)usageResetAllData;
- (unsigned)usageUserAlertDontReset;
- (unsigned)usageUserAlertDontShare;
- (unsigned)usageUserAlertReset;
- (unsigned)usageUserAlertShare;
- (unsigned)usageUserDisabled;
- (unsigned)usageUserEnabled;
- (unsigned)usageUserPaused;
- (unsigned)usageUserUnpaused;
- (void)_activate;
- (void)_bluetoothMonitorEnsureStarted;
- (void)_bluetoothMonitorEnsureStopped;
- (void)_bluetoothTracingEnsureStarted;
- (void)_bluetoothTracingEnsureStopped;
- (void)_bluetoothTracingStop;
- (void)_configurationManagerEnsureStarted;
- (void)_configurationManagerEnsureStopped;
- (void)_databasesEnsureClosed;
- (void)_databasesEnsureOpened;
- (void)_deferConsentForPendingRegion;
- (void)_differentialPrivacyEnsureStarted;
- (void)_differentialPrivacyEnsureStopped;
- (void)_disableAvailabilityAlertIfNeeded;
- (void)_enApplicationDidInstall:(id)a3;
- (void)_enApplicationDidUninstall:(id)a3;
- (void)_enqueueScreenUnlockAction:(id)a3 withIdentifier:(id)a4;
- (void)_exposureManagersEnsureStarted;
- (void)_exposureManagersEnsureStopped;
- (void)_exposureNotificationRegionConfigurationChanged:(id)a3;
- (void)_exposureNotificationRegionConfigurationRemoved:(id)a3;
- (void)_fetchPrefRegionConfig:(id)a3 oldCustomCountryCode:(id)a4;
- (void)_handleTestVerificationErrors:(id)a3;
- (void)_invalidate;
- (void)_migrateLegacyHistoryIfNecessary;
- (void)_networkProxyStatusCheck;
- (void)_periodicPersistencePurge;
- (void)_postUserNotificationWithRequest:(id)a3 authorizationFailureHandler:(id)a4;
- (void)_regionMonitorEnsureStarted;
- (void)_regionMonitorEnsureStopped;
- (void)_resetDataWithFlags:(unsigned int)a3;
- (void)_resetDeveloperSettings;
- (void)_schedulePeriodicPersistencePurge;
- (void)_scheduleUpdate;
- (void)_setActiveRegionForApp:(id)a3 infoDict:(id)a4;
- (void)_startPreauthorizedTestVerificationAction;
- (void)_tccChanged;
- (void)_turnOffEN;
- (void)_update;
- (void)_updateOverallStatus;
- (void)_updatePhase1ConfigurationIfNeeded:(id)a3;
- (void)_xpcConnectionAccept:(id)a3;
- (void)_xpcListenerEvent:(id)a3;
- (void)activate;
- (void)appLaunchWithBundleID:(id)a3 activity:(unsigned int)a4 shouldEnterForeground:(BOOL)a5 requiredRuntimeInSeconds:(int)a6;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)bluetoothPowerStateChanged;
- (void)configurationManager:(id)a3 didResolveCurrentRegion:(BOOL)a4;
- (void)configurationManager:(id)a3 errorDetected:(unsigned int)a4;
- (void)configurationManager:(id)a3 exposureNotificationRegionConfigurationChanged:(id)a4;
- (void)configurationManager:(id)a3 exposureNotificationRegionConfigurationRemovedForRegion:(id)a4;
- (void)enqueuePreauthorizedTestVerificationUnlockAction;
- (void)enqueueScreenUnlockAction:(id)a3 withIdentifier:(id)a4;
- (void)exposureDetectionManager:(id)a3 errorDetected:(unsigned int)a4;
- (void)exposureDetectionManager:(id)a3 finishedSessionWithResult:(id)a4;
- (void)fetchServerConfigurationForAppBundleIdentifier:(id)a3 infoDictionary:(id)a4;
- (void)fetchServerConfigurationForRegion:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)monthlyTriggerActivateWithIntervalOverride:(unsigned int)a3;
- (void)monthlyTriggerDeactivate;
- (void)notifyUserWithStatus:(int64_t)a3;
- (void)onboardingManagerDidObserveDeviceUnlock:(id)a3;
- (void)onboardingTriggerDeactivate;
- (void)onboardingTriggerResumeIfNeeded;
- (void)onboardingTriggerRetry:(unsigned int)a3;
- (void)pauseUpdate;
- (void)postAnalyticsOptInNotificationForRegion:(id)a3;
- (void)postENOffNotification;
- (void)postExposureNotification:(id)a3;
- (void)postExposureSummaryAccessNotificationWithAppBundleIdentifier:(id)a3 string:(id)a4;
- (void)postGeneralNotificationWithTitle:(id)a3 message:(id)a4;
- (void)postMonthlySummaryNotificationForAppBundleIdentifier:(id)a3;
- (void)postOnboardingNotificationForRegion:(id)a3;
- (void)postPreAuthorizationNotificationForRegion:(id)a3;
- (void)postTestVerificationReceivedNotification:(id)a3 region:(id)a4 reportType:(unsigned int)a5;
- (void)prefsChanged;
- (void)presentBuddyForRegion:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setActiveEntity:(id)a3;
- (void)setAppActivities:(id)a3;
- (void)setAutomaticRegionSwitchEnabled:(BOOL)a3;
- (void)setAvailabilityAlertDisabled:(BOOL)a3;
- (void)setBtTracingAppID:(id)a3;
- (void)setBuddyAlertHandle:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDifferentialPrivacyManager:(id)a3;
- (void)setDispatchDownloadManagingQueue:(id)a3;
- (void)setDispatchExposureDetectionManagingQueue:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDispatchTestResultManagingQueue:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setExposureDetectionManager:(id)a3;
- (void)setMonthlyNotificationTimer:(id)a3;
- (void)setMonthlySummaryDisabled:(BOOL)a3;
- (void)setNetworkProxyStatus:(id)a3;
- (void)setNetworkProxyTraffic:(unint64_t)a3;
- (void)setOnboardingFirstTime:(BOOL)a3;
- (void)setOnboardingLegalConsentLastViewCount:(int64_t)a3;
- (void)setOnboardingManager:(id)a3;
- (void)setOnboardingRegionTrigger:(id)a3;
- (void)setOnboardingTimer:(id)a3;
- (void)setOnboardingTrigger:(unsigned int)a3;
- (void)setOverallStatus:(int64_t)a3;
- (void)setPersistencePurgeScheduler:(id)a3;
- (void)setPrefAggressiveScanning:(BOOL)a3;
- (void)setPrefConfigurationManagerEnabled:(BOOL)a3;
- (void)setPrefDatabasePurgeInterval:(double)a3;
- (void)setPrefDeveloperServerConfiguration:(BOOL)a3;
- (void)setPrefDifferentialPrivacyConsent:(int64_t)a3;
- (void)setPrefEnableNKD:(BOOL)a3;
- (void)setPrefEnabled:(BOOL)a3;
- (void)setPrefLoggingRPI:(BOOL)a3;
- (void)setPrefLoggingSensitive:(BOOL)a3;
- (void)setPrefNetworkProxyEnabled:(BOOL)a3;
- (void)setPrefPaused:(BOOL)a3;
- (void)setPrefRateLimitMaxAPICount:(unsigned int)a3;
- (void)setPrefRateLimitMaxAPICountV2:(unsigned int)a3;
- (void)setPrefRegionIdentifierOverride:(id)a3;
- (void)setPrefRegionMonitorTestMode:(BOOL)a3;
- (void)setPrefServerConfigurationRefreshInterval:(double)a3;
- (void)setPrefServerForceDisable:(BOOL)a3;
- (void)setPrefSkipExposureWindowShuffling:(BOOL)a3;
- (void)setPrefSkipFileSigning:(BOOL)a3;
- (void)setPrefStoreDemoMode:(BOOL)a3;
- (void)setPrefTCCAllowWithoutApps:(BOOL)a3;
- (void)setPreviouslyTrackedApps:(id)a3;
- (void)setRegionMonitor:(id)a3;
- (void)setRemoteUISessions:(id)a3;
- (void)setScreenUnlockPendingActions:(id)a3;
- (void)setSharingClient:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTemporaryExposureKeyManager:(id)a3;
- (void)setTestResultManager:(id)a3;
- (void)setTextMessageManager:(id)a3;
- (void)setTravelStatus:(int64_t)a3;
- (void)setUsageExposureDetectFileActivate:(unsigned int)a3;
- (void)setUsageExposureDetectFileAddKeys:(unsigned int)a3;
- (void)setUsageExposureDetectFileFinish:(unsigned int)a3;
- (void)setUsageExposureDetectFileGetExposureWindows:(unsigned int)a3;
- (void)setUsageExposureDetectFileGetExposures:(unsigned int)a3;
- (void)setUsageGetDiagnosisKeys:(unsigned int)a3;
- (void)setUsageManagerActivate:(unsigned int)a3;
- (void)setUsageResetAllData:(unsigned int)a3;
- (void)setUsageUserAlertDontReset:(unsigned int)a3;
- (void)setUsageUserAlertDontShare:(unsigned int)a3;
- (void)setUsageUserAlertReset:(unsigned int)a3;
- (void)setUsageUserAlertShare:(unsigned int)a3;
- (void)setUsageUserDisabled:(unsigned int)a3;
- (void)setUsageUserEnabled:(unsigned int)a3;
- (void)setUsageUserPaused:(unsigned int)a3;
- (void)setUsageUserUnpaused:(unsigned int)a3;
- (void)setUserAlert:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)setWasInDifferentActiveRegion:(BOOL)a3;
- (void)setWasInRestrictedStatus:(BOOL)a3;
- (void)startAvailabilityAlertCycleWithBuddy:(BOOL)a3;
- (void)startServerConfigurationFetchForRegion:(id)a3;
- (void)tearDownAlertHandle;
- (void)textMessageManager:(id)a3 errorDetected:(unsigned int)a4;
- (void)updateExistingConsentForPhase1ActiveRegion:(int64_t)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)xpcConnectionInvalidated:(id)a3;
- (void)xpcPreAuthorizedDiagnosisKeysAvailable;
- (void)xpcReportStatus;
@end

@implementation ENDaemon

uint64_t __27__ENDaemon__scheduleUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __33__ENDaemon__xpcConnectionAccept___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcConnectionEvent:a2];
}

- (void)_xpcListenerEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = MEMORY[0x1D943A770]();
  if (v4 == MEMORY[0x1E4F14578])
  {
    uint64_t v4 = [(ENDaemon *)self _xpcConnectionAccept:v7];
    goto LABEL_7;
  }
  id v5 = v7;
  if (v7 == (id)MEMORY[0x1E4F14528])
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
      {
        uint64_t v4 = LogPrintF_safe();
        goto LABEL_7;
      }
    }
  }
  else if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
    {
      v6 = CUPrintXPC();
      LogPrintF_safe();

LABEL_7:
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_xpcConnectionAccept:(id)a3
{
  uint64_t v4 = (_xpc_connection_s *)a3;
  uint64_t pid = xpc_connection_get_pid(v4);
  xpc_connection_get_audit_token();
  memset(v19, 0, sizeof(v19));
  v6 = +[ENXPCClient clientWithAuditToken:v19 pid:pid];
  if ([v6 entitledForLogging])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setENAppHasLoggingEntitlement:1];

    v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
    [v8 setLoggingEntitledApp:1];
  }
  if (gLogCategory_ENDaemon <= 20 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintPID();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    [v6 signingIdentity];
    v17 = v16 = v9;
    LogPrintF_safe();
  }
  v10 = objc_alloc_init(ENXPCConnection);
  [(ENXPCConnection *)v10 setClient:v6];
  [(ENXPCConnection *)v10 setDaemon:self];
  [(ENXPCConnection *)v10 setDispatchQueue:self->_dispatchQueue];
  [(ENXPCConnection *)v10 setXpcCnx:v4];
  if (([v6 entitledToSkipFileSigningVerification] & 1) != 0
    || [(ENDaemon *)self prefSkipFileSigning])
  {
    -[ENXPCConnection setSkipFileSigningVerification:](v10, "setSkipFileSigningVerification:", 1, v16, v17);
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      BOOL v11 = [(ENDaemon *)self prefSkipFileSigning];
      v12 = "entitlement";
      if (v11) {
        v12 = "development mode pref";
      }
      v16 = v12;
      LogPrintF_safe();
    }
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __33__ENDaemon__xpcConnectionAccept___block_invoke;
  handler[3] = &unk_1E69ACB68;
  handler[4] = v10;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(v4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA88]);
    v15 = self->_xpcConnections;
    self->_xpcConnections = v14;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v10, v16);
  [(ENXPCConnection *)v10 activate];
}

- (BOOL)prefSkipFileSigning
{
  return self->_prefSkipFileSigning;
}

- (void)_update
{
  self->_updatePending = 0;
  if ([(ENDaemon *)self _bluetoothMonitorShouldRun]) {
    [(ENDaemon *)self _bluetoothMonitorEnsureStarted];
  }
  else {
    [(ENDaemon *)self _bluetoothMonitorEnsureStopped];
  }
  if (self->_prefEnabled
    && !self->_prefPaused
    && [(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    [(ENDaemon *)self _bluetoothTracingEnsureStarted];
  }
  else
  {
    [(ENDaemon *)self _bluetoothTracingEnsureStopped];
  }
  if (self->_prefEnabled) {
    [(ENDaemon *)self _databasesEnsureOpened];
  }
  else {
    [(ENDaemon *)self _databasesEnsureClosed];
  }
  if (self->_prefEnabled) {
    [(ENDaemon *)self _exposureManagersEnsureStarted];
  }
  else {
    [(ENDaemon *)self _exposureManagersEnsureStopped];
  }
  if (self->_prefConfigurationManagerEnabled) {
    [(ENDaemon *)self _configurationManagerEnsureStarted];
  }
  else {
    [(ENDaemon *)self _configurationManagerEnsureStopped];
  }
  if (self->_prefEnabled || !self->_availabilityAlertDisabled)
  {
    [(ENRegionMonitor *)self->_regionMonitor enableRegionMonitor];
    [(ENRegionMonitor *)self->_regionMonitor updateRegionHistoryFileStatus];
  }
  else
  {
    [(ENRegionMonitor *)self->_regionMonitor disableRegionMonitor];
  }
  if (self->_prefDifferentialPrivacyConsent == 2) {
    [(ENDaemon *)self _differentialPrivacyEnsureStarted];
  }
  else {
    [(ENDaemon *)self _differentialPrivacyEnsureStopped];
  }
  if (!self->_prefDeveloperServerConfiguration)
  {
    prefRegionIdentifierOverride = self->_prefRegionIdentifierOverride;
    if (!prefRegionIdentifierOverride || ![(NSString *)prefRegionIdentifierOverride length])
    {
      uint64_t v4 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      [v4 clearTemporaryServerConfigurations];

      id v5 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      [v5 clearTemporaryCountrySubdivisionList];
    }
  }
  [(ENDaemon *)self _schedulePeriodicPersistencePurge];

  [(ENDaemon *)self _updateOverallStatus];
}

- (void)_schedulePeriodicPersistencePurge
{
  if (!self->_persistencePurgeScheduler)
  {
    v3 = (NSBackgroundActivityScheduler *)[objc_alloc(MEMORY[0x1E4F28B30]) initWithIdentifier:@"com.apple.bluetooth.exposurenotification.databasepurge"];
    persistencePurgeScheduler = self->_persistencePurgeScheduler;
    self->_persistencePurgeScheduler = v3;

    [(NSBackgroundActivityScheduler *)self->_persistencePurgeScheduler setQualityOfService:17];
  }
  double prefDatabasePurgeInterval = 86400.0;
  if (self->_prefDatabasePurgeInterval > 0.0 && IsAppleInternalBuild()) {
    double prefDatabasePurgeInterval = self->_prefDatabasePurgeInterval;
  }
  [(NSBackgroundActivityScheduler *)self->_persistencePurgeScheduler interval];
  if (v6 != prefDatabasePurgeInterval)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      [(NSBackgroundActivityScheduler *)self->_persistencePurgeScheduler identifier];
      v10 = double v11 = prefDatabasePurgeInterval;
      LogPrintF_safe();
    }
    -[NSBackgroundActivityScheduler setInterval:](self->_persistencePurgeScheduler, "setInterval:", prefDatabasePurgeInterval, v10, *(void *)&v11);
    [(NSBackgroundActivityScheduler *)self->_persistencePurgeScheduler setRepeats:1];
    dispatchQueue = self->_dispatchQueue;
    v8 = self->_persistencePurgeScheduler;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke;
    v12[3] = &unk_1E69AD2E8;
    v12[4] = dispatchQueue;
    v12[5] = self;
    v9 = dispatchQueue;
    [(NSBackgroundActivityScheduler *)v8 scheduleWithBlock:v12];
  }
}

- (void)_exposureManagersEnsureStopped
{
  downloadManager = self->_downloadManager;
  if (downloadManager || self->_exposureDetectionManager || self->_testResultManager || self->_textMessageManager)
  {
    [(ENDownloadManager *)downloadManager invalidate];
    uint64_t v4 = self->_downloadManager;
    self->_downloadManager = 0;

    [(ENExposureDetectionManager *)self->_exposureDetectionManager invalidate];
    exposureDetectionManager = self->_exposureDetectionManager;
    self->_exposureDetectionManager = 0;

    [(ENTestResultManager *)self->_testResultManager invalidate];
    testResultManager = self->_testResultManager;
    self->_testResultManager = 0;

    [(ENTextMessageManager *)self->_textMessageManager invalidate];
    textMessageManager = self->_textMessageManager;
    self->_textMessageManager = 0;
  }
}

- (void)_differentialPrivacyEnsureStopped
{
  if (self->_differentialPrivacyManager)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    differentialPrivacyManager = self->_differentialPrivacyManager;
    self->_differentialPrivacyManager = 0;
  }
}

- (void)_databasesEnsureClosed
{
  [(ENExposureDatabase *)self->_exposureDatabase close];
  exposureDatabase = self->_exposureDatabase;
  self->_exposureDatabase = 0;
}

- (void)_configurationManagerEnsureStarted
{
  if (!self->_configurationManager)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    v3 = [[ENConfigurationManager alloc] initWithDelegate:self activeEntity:self->_activeEntity];
    [(ENConfigurationManager *)v3 setRegionMonitor:self->_regionMonitor];
    configurationManager = self->_configurationManager;
    self->_configurationManager = v3;
    id v5 = v3;

    [(ENConfigurationManager *)self->_configurationManager activate];
  }
}

- (void)_bluetoothTracingEnsureStopped
{
  if (self->_btTracingAppID)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(ENDaemon *)self _bluetoothTracingStop];
    btTracingAppID = self->_btTracingAppID;
    self->_btTracingAppID = 0;
  }
}

- (BOOL)_bluetoothMonitorShouldRun
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_xpcConnections;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "manager", (void)v8);

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_bluetoothMonitorEnsureStarted
{
  if (!self->_btMonitorStarted)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id location = 0;
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__ENDaemon__bluetoothMonitorEnsureStarted__block_invoke;
    v4[3] = &unk_1E69AD1F8;
    objc_copyWeak(&v5, &location);
    [WeakRetained startPowerMonitoringWithStateChangeHandler:v4];

    self->_btMonitorStarted = 1;
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (ENActiveEntity)activeEntity
{
  return self->_activeEntity;
}

- (void)_updateOverallStatus
{
  v18[1] = *MEMORY[0x1E4F143B8];
  unint64_t overallStatus = self->_overallStatus;
  int64_t v4 = [(ENDaemon *)self getOverallStatus];
  if (v4 != overallStatus)
  {
    unint64_t v5 = v4;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (overallStatus > 6) {
        double v6 = "?";
      }
      else {
        double v6 = off_1E69ADBA0[overallStatus];
      }
      if (v5 > 6) {
        id v7 = "?";
      }
      else {
        id v7 = off_1E69ADBA0[v5];
      }
      v15 = v6;
      BOOL wasInDifferentActiveRegion = (BOOL)v7;
      LogPrintF_safe();
    }
    self->_unint64_t overallStatus = v5;
    if (overallStatus - 1 < 2)
    {
      if (overallStatus == 1 && v5 == 4)
      {
        [(ENDaemon *)self notifyUserWithStatus:4];
      }
      else if (v5 == 1)
      {
        long long v10 = [(ENDaemon *)self userNotificationCenter];
        v18[0] = @"com.apple.ExposureNotification.UserNotification.off";
        long long v11 = [MEMORY[0x1E4F1C970] arrayWithObjects:v18 count:1];
        [v10 removeDeliveredNotificationsWithIdentifiers:v11];
      }
      *(_WORD *)&self->_BOOL wasInRestrictedStatus = 0;
      CFPrefs_RemoveValue();
      goto LABEL_29;
    }
    if (overallStatus != 3)
    {
      if (overallStatus != 4) {
        goto LABEL_30;
      }
      if (v5 != 3)
      {
        if (v5 == 1)
        {
          long long v8 = self;
          uint64_t v9 = 1;
LABEL_25:
          -[ENDaemon notifyUserWithStatus:](v8, "notifyUserWithStatus:", v9, v15, wasInDifferentActiveRegion);
          goto LABEL_30;
        }
        goto LABEL_30;
      }
      self->_BOOL wasInRestrictedStatus = 1;
LABEL_29:
      CFPrefs_RemoveValue();
      goto LABEL_30;
    }
    if (v5 != 1)
    {
      if (v5 == 4)
      {
        long long v8 = self;
        uint64_t v9 = 4;
        goto LABEL_25;
      }
LABEL_30:
      -[ENDaemon monthlyTriggerActivateWithIntervalOverride:](self, "monthlyTriggerActivateWithIntervalOverride:", 0, v15, wasInDifferentActiveRegion);
      [(ENDaemon *)self xpcReportStatus];
      return;
    }
    BOOL wasInRestrictedStatus = self->_wasInRestrictedStatus;
    if (!self->_wasInRestrictedStatus && !self->_wasInDifferentActiveRegion) {
      goto LABEL_30;
    }
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_39;
        }
        BOOL wasInRestrictedStatus = self->_wasInRestrictedStatus;
      }
      v15 = (const char *)wasInRestrictedStatus;
      BOOL wasInDifferentActiveRegion = self->_wasInDifferentActiveRegion;
      LogPrintF_safe();
    }
LABEL_39:
    *(_WORD *)&self->_BOOL wasInRestrictedStatus = 0;
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    dispatch_time_t v13 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__ENDaemon__updateOverallStatus__block_invoke;
    block[3] = &unk_1E69ACC88;
    block[4] = self;
    block[5] = 1;
    dispatch_after(v13, dispatchQueue, block);
    goto LABEL_30;
  }
}

- (int64_t)getOverallStatus
{
  if (self->_prefServerForceDisable || self->_prefStoreDemoMode) {
    return 4;
  }
  if (!self->_prefEnabled) {
    return 2;
  }
  if (self->_prefPaused) {
    return 5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = [WeakRetained isBluetoothPoweredOn];

  if (v4) {
    return 1;
  }
  else {
    return 3;
  }
}

- (unsigned)usageManagerActivate
{
  return self->_usageManagerActivate;
}

- (void)setUsageManagerActivate:(unsigned int)a3
{
  self->_usageManagerActivate = a3;
}

- (ENRegionMonitor)regionMonitor
{
  return self->_regionMonitor;
}

- (BOOL)prefPaused
{
  return self->_prefPaused;
}

- (BOOL)prefEnabled
{
  return self->_prefEnabled;
}

- (int64_t)prefDifferentialPrivacyConsent
{
  return self->_prefDifferentialPrivacyConsent;
}

- (ENConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

uint64_t __21__ENDaemon__activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcListenerEvent:a2];
}

- (unsigned)appDequeueActivityFlagsWithBundleID:(id)a3
{
  appActivities = self->_appActivities;
  id v5 = a3;
  double v6 = [(NSMutableDictionary *)appActivities objectForKeyedSubscript:v5];
  unsigned int v7 = [v6 unsignedIntValue];

  [(NSMutableDictionary *)self->_appActivities setObject:0 forKeyedSubscript:v5];
  return v7;
}

- (void)_scheduleUpdate
{
  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__ENDaemon__scheduleUpdate__block_invoke;
    block[3] = &unk_1E69ACA50;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)xpcConnectionInvalidated:(id)a3
{
  [(NSMutableSet *)self->_xpcConnections removeObject:a3];

  [(ENDaemon *)self _scheduleUpdate];
}

- (ENRegion)onboardingRegionTrigger
{
  return self->_onboardingRegionTrigger;
}

- (ENDaemon)init
{
  if (objc_opt_class()
    && (v31.receiver = self,
        v31.super_class = (Class)ENDaemon,
        (self = [(ENDaemon *)&v31 init]) != 0))
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v4 = (OS_dispatch_queue *)dispatch_queue_create("ENDaemon", v3);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v4;

    double v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned int v7 = (OS_dispatch_queue *)dispatch_queue_create("ENDetection", v6);
    dispatchExposureDetectionManagingQueue = self->_dispatchExposureDetectionManagingQueue;
    self->_dispatchExposureDetectionManagingQueue = v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v10 = (OS_dispatch_queue *)dispatch_queue_create("ENDownload", v9);
    dispatchDownloadManagingQueue = self->_dispatchDownloadManagingQueue;
    self->_dispatchDownloadManagingQueue = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_time_t v13 = (OS_dispatch_queue *)dispatch_queue_create("ENTestResult", v12);
    dispatchTestResultManagingQueue = self->_dispatchTestResultManagingQueue;
    self->_dispatchTestResultManagingQueue = v13;

    self->_tccChangedNotifyToken = -1;
    *(void *)&self->_prefsChangedNotifyToken = -1;
    *(void *)&self->_proxyStatusChangedNotifyToken = -1;
    self->_screenLockNotifyToken = -1;
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA78]) initWithCapacity:5];
    [(ENDaemon *)self setPreviouslyTrackedApps:v15];

    _CFPreferencesSetBackupDisabled();
    v16 = ENDataVaultURL();
    uint64_t v17 = *MEMORY[0x1E4F1C638];
    id v30 = 0;
    char v18 = [v16 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v17 error:&v30];
    id v19 = v30;

    if ((v18 & 1) == 0
      && gLogCategory_ENDaemon <= 90
      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v29 = ENDataVaultURL();
      LogPrintF_safe();
    }
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F44678]) initWithBundleIdentifier:@"com.apple.ExposureNotification.UserNotification" queue:self->_dispatchQueue];
    [(ENDaemon *)self setUserNotificationCenter:v21];

    v22 = [(ENDaemon *)self userNotificationCenter];
    [v22 setDelegate:self];

    v23 = [(ENDaemon *)self userNotificationCenter];
    [v23 setWantsNotificationResponsesDelivered];

    [(ENTemporaryExposureKeyManager *)self->_temporaryExposureKeyManager resetClientState];
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA68]);
    remoteUISessions = self->_remoteUISessions;
    self->_remoteUISessions = v24;

    v26 = objc_alloc_init(ENOnboardingManager);
    onboardingManager = self->_onboardingManager;
    self->_onboardingManager = v26;

    [(ENOnboardingManager *)self->_onboardingManager setDelegate:self];
    self = self;

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)description
{
  return (NSString *)[(ENDaemon *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  unsigned int v121 = a3;
  uint64_t v172 = 0;
  v173 = &v172;
  uint64_t v174 = 0x3032000000;
  v175 = __Block_byref_object_copy__3;
  v176 = __Block_byref_object_dispose__3;
  id v177 = 0;
  obuint64_t j = 0;
  NSAppendPrintF_safe();
  objc_storeStrong(&v177, 0);
  uint64_t v3 = (id *)(v173 + 5);
  id v170 = (id)v173[5];
  mach_continuous_time();
  UpTicksToSeconds();
  mach_absolute_time();
  uint64_t v4 = UpTicksToSeconds();
  unint64_t v5 = [(ENDaemon *)self getOverallStatus];
  if (v5 > 6) {
    double v6 = "?";
  }
  else {
    double v6 = off_1E69ADBA0[v5];
  }
  v106 = v6;
  NSAppendPrintF();
  objc_storeStrong(v3, v170);
  unsigned int v7 = (id *)(v173 + 5);
  id v169 = (id)v173[5];
  activeEntity = self->_activeEntity;
  NSAppendPrintF_safe();
  objc_storeStrong(v7, v169);
  v122 = self->_configurationManager;
  v123 = [(ENConfigurationManager *)v122 configurationStore];
  long long v8 = [(ENActiveEntity *)self->_activeEntity entity];
  uint64_t v9 = [v8 region];

  if (v9)
  {
    long long v10 = [v123 configurationForRegion:v9];
    long long v11 = [v123 serverConfigurationForRegion:v9];
    v12 = [v10 userConsent];
    dispatch_time_t v13 = (id *)(v173 + 5);
    id v168 = (id)v173[5];
    int v14 = [v11 enEnabled];
    uint64_t v15 = [v10 enVersion];
    v16 = "enabled";
    if (!v14) {
      v16 = "disabled";
    }
    v88 = v16;
    uint64_t v101 = v15;
    NSAppendPrintF_safe();
    objc_storeStrong(v13, v168);
    uint64_t v17 = (id *)(v173 + 5);
    id v167 = (id)v173[5];
    objc_msgSend(v12, "consent", v88, v101);
    unint64_t v18 = [v12 differentialPrivacyConsent];
    if (v18 > 4) {
      id v19 = "?";
    }
    else {
      id v19 = off_1E69ADB50[v18];
    }
    v100 = v19;
    NSAppendPrintF_safe();
    objc_storeStrong(v17, v167);
    v20 = (id *)(v173 + 5);
    id v166 = (id)v173[5];
    v87 = v11;
    NSAppendPrintF_safe();
    objc_storeStrong(v20, v166);
  }
  v21 = [(ENActiveEntity *)self->_activeEntity entity];
  v22 = [v21 bundleIdentifier];

  if (v22)
  {
    v23 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v22 placeholder:0];
    v24 = (id *)(v173 + 5);
    id v165 = (id)v173[5];
    v25 = [v23 appState];
    [v25 isInstalled];
    v26 = objc_msgSend(v23, "appState", v87, v100);
    [v26 isPlaceholder];
    [(ENDaemon *)self tccAccessForBundleID:v22];
    NSAppendPrintF_safe();
    objc_storeStrong(v24, v165);
  }
  v27 = (id *)(v173 + 5);
  id v164 = (id)v173[5];
  if ([(ENConfigurationManager *)v122 isInGracePeriodTransition]) {
    v28 = "yes";
  }
  else {
    v28 = "no";
  }
  v89 = v28;
  NSAppendPrintF_safe();
  objc_storeStrong(v27, v164);
  if ([(NSMutableDictionary *)self->_appActivities count])
  {
    v29 = (id *)(v173 + 5);
    id v163 = (id)v173[5];
    NSAppendPrintF();
    objc_storeStrong(v29, v163);
  }
  id v30 = (id *)(v173 + 5);
  id v162 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v30, v162);
  objc_super v31 = (id *)(v173 + 5);
  id v161 = (id)v173[5];
  v32 = "enabled";
  if (self->_availabilityAlertDisabled) {
    v32 = "disabled";
  }
  v90 = v32;
  NSAppendPrintF_safe();
  objc_storeStrong(v31, v161);
  -[ENDaemon _getAvailabilityAlertCountIncrement:reset:](self, "_getAvailabilityAlertCountIncrement:reset:", 0, 0, v90);
  v33 = (id *)(v173 + 5);
  id v160 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v33, v160);
  v34 = (id *)(v173 + 5);
  id v159 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v34, v159);
  v35 = (id *)(v173 + 5);
  id v158 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v35, v158);
  v36 = (id *)(v173 + 5);
  id v157 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v36, v157);
  v37 = (id *)(v173 + 5);
  id v156 = (id)v173[5];
  if (self->_prefStoreDemoMode) {
    v38 = "yes";
  }
  else {
    v38 = "no";
  }
  v91 = v38;
  NSAppendPrintF_safe();
  objc_storeStrong(v37, v156);
  if ([(NSMutableOrderedSet *)self->_previouslyTrackedApps count])
  {
    v39 = (id *)(v173 + 5);
    id v155 = (id)v173[5];
    NSAppendPrintF();
    objc_storeStrong(v39, v155);
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  v41 = (id *)(v173 + 5);
  id v154 = (id)v173[5];
  if (Int64) {
    v42 = "yes";
  }
  else {
    v42 = "no";
  }
  v92 = v42;
  NSAppendPrintF_safe();
  objc_storeStrong(v41, v154);
  v43 = (id *)(v173 + 5);
  id v153 = (id)v173[5];
  v44 = [(ENActiveEntity *)self->_activeEntity entity];
  v93 = [v44 bundleIdentifier];
  btTracingAppID = self->_btTracingAppID;
  NSAppendPrintF_safe();
  objc_storeStrong(v43, v153);

  unsigned int v45 = [(ENDaemon *)self _getLegalConsentPageCount];
  v46 = (id *)(v173 + 5);
  id v152 = (id)v173[5];
  uint64_t v94 = v45;
  NSAppendPrintF_safe();
  objc_storeStrong(v46, v152);
  [(ENDaemon *)self _getExposureMatchAttemptBool];
  v47 = (id *)(v173 + 5);
  id v151 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v47, v151);
  v48 = (id *)(v173 + 5);
  id v150 = (id)v173[5];
  if (self->_monthlySummaryDisabled) {
    v49 = "yes";
  }
  else {
    v49 = "no";
  }
  v95 = v49;
  NSAppendPrintF_safe();
  objc_storeStrong(v48, v150);
  v50 = (id *)(v173 + 5);
  id v149 = (id)v173[5];
  uint64_t v51 = [(PrivacyProxyServiceStatus *)self->_networkProxyStatus serviceStatus];
  if ((self->_networkProxyTraffic & 0x800) != 0) {
    v52 = "yes";
  }
  else {
    v52 = "no";
  }
  uint64_t v96 = v51;
  v103 = v52;
  NSAppendPrintF_safe();
  objc_storeStrong(v50, v149);
  v53 = [(ENActiveEntity *)self->_activeEntity entity];
  v54 = [v53 region];
  v55 = [v123 serverConfigurationForRegion:v54];

  if (v55)
  {
    v56 = (id *)(v173 + 5);
    id v148 = (id)v173[5];
    [v55 isChaffingEnabled];
    if (self->_prefNetworkProxyEnabled) {
      [v55 chaffingSelectionPercentageAlternative];
    }
    else {
      [v55 chaffingSelectionPercentage];
    }
    NSAppendPrintF_safe();
    objc_storeStrong(v56, v148);
  }

  v57 = (id *)(v173 + 5);
  id v147 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v57, v147);
  v58 = (id *)(v173 + 5);
  id v146 = (id)v173[5];
  uint64_t usageExposureDetectFileGetExposures = self->_usageExposureDetectFileGetExposures;
  uint64_t usageExposureDetectFileGetExposureWindows = self->_usageExposureDetectFileGetExposureWindows;
  uint64_t usageExposureDetectFileAddKeys = self->_usageExposureDetectFileAddKeys;
  uint64_t usageExposureDetectFileFinish = self->_usageExposureDetectFileFinish;
  uint64_t usageResetAllData = self->_usageResetAllData;
  uint64_t usageExposureDetectFileActivate = self->_usageExposureDetectFileActivate;
  uint64_t usageManagerActivate = self->_usageManagerActivate;
  uint64_t usageGetDiagnosisKeys = self->_usageGetDiagnosisKeys;
  uint64_t usageUserAlertReset = self->_usageUserAlertReset;
  uint64_t usageUserAlertDontReset = self->_usageUserAlertDontReset;
  uint64_t usageUserAlertShare = self->_usageUserAlertShare;
  uint64_t usageUserAlertDontShare = self->_usageUserAlertDontShare;
  uint64_t usageUserPaused = self->_usageUserPaused;
  uint64_t usageUserUnpaused = self->_usageUserUnpaused;
  uint64_t usageUserEnabled = self->_usageUserEnabled;
  uint64_t usageUserDisabled = self->_usageUserDisabled;
  NSAppendPrintF_safe();
  objc_storeStrong(v58, v146);
  uint64_t v59 = [(NSMutableSet *)self->_xpcConnections count];
  BOOL v60 = v59 != 0;
  if (v59)
  {
    v61 = (id *)(v173 + 5);
    id v145 = (id)v173[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v61, v145);
    v62 = (id *)(v173 + 5);
    id v144 = (id)v173[5];
    uint64_t v98 = v59;
    NSAppendPrintF_safe();
    objc_storeStrong(v62, v144);
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v63 = self->_xpcConnections;
    uint64_t v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v140, v179, 16, v98);
    if (v64)
    {
      uint64_t v65 = *(void *)v141;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v141 != v65) {
            objc_enumerationMutation(v63);
          }
          v67 = (id *)(v173 + 5);
          id v139 = (id)v173[5];
          v99 = CUDescriptionWithLevel();
          NSAppendPrintF_safe();
          objc_storeStrong(v67, v139);
        }
        uint64_t v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v140, v179, 16, v99);
      }
      while (v64);
    }

    v68 = (id *)(v173 + 5);
    id v138 = (id)v173[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v68, v138);
  }
  if (v121 <= 0x13)
  {
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v69 = (void *)CFPrefs_CopyKeys();
    uint64_t v70 = [v69 countByEnumeratingWithState:&v134 objects:v178 count:16];
    if (!v70)
    {
LABEL_62:

      goto LABEL_63;
    }
    int v71 = 0;
    uint64_t v72 = *(void *)v135;
    do
    {
      for (uint64_t j = 0; j != v70; ++j)
      {
        if (*(void *)v135 != v72) {
          objc_enumerationMutation(v69);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v60)
          {
            v74 = (id *)(v173 + 5);
            id v133 = (id)v173[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v74, v133);
          }
          v75 = (void *)CFPrefs_CopyTypedValue();
          v76 = (id *)(v173 + 5);
          id v132 = (id)v173[5];
          v105 = CUPrintNSObjectOneLine();
          NSAppendPrintF();
          objc_storeStrong(v76, v132);

          ++v71;
          BOOL v60 = 1;
        }
      }
      uint64_t v70 = [v69 countByEnumeratingWithState:&v134 objects:v178 count:16];
    }
    while (v70);

    if (v71 >= 1)
    {
      v77 = v173;
      id v131 = (id)v173[5];
      NSAppendPrintF_safe();
      id v78 = v131;
      v69 = (void *)v77[5];
      v77[5] = (uint64_t)v78;
      goto LABEL_62;
    }
  }
LABEL_63:
  v79 = (id *)(v173 + 5);
  id v130 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v79, v130);
  v80 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
  v81 = [v123 allRegionServerConfigurations];
  BOOL v82 = (unint64_t)[v81 count] > 0xA;

  if (v82)
  {
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __33__ENDaemon_descriptionWithLevel___block_invoke;
    v127[3] = &unk_1E69ACF00;
    v127[4] = v123;
    id v128 = v80;
    v129 = &v172;
    [v123 enumerateCachedRegionServerConfigurationsWithHandler:v127];
  }
  else
  {
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __33__ENDaemon_descriptionWithLevel___block_invoke_2;
    v126[3] = &unk_1E69ACF28;
    v126[4] = v123;
    v126[5] = &v172;
    [v123 enumerateCachedRegionServerConfigurationsWithHandler:v126];
  }
  v83 = (id *)(v173 + 5);
  id v125 = (id)v173[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v83, v125);
  id v84 = (id)v173[5];

  _Block_object_dispose(&v172, 8);

  return v84;
}

void __33__ENDaemon_descriptionWithLevel___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  unint64_t v5 = [v3 region];
  double v6 = [v4 configurationForRegion:v5];

  unsigned int v7 = [v6 userConsent];
  if ([v7 consent] || objc_msgSend(v6, "everStartedOnboarding"))
  {
  }
  else
  {
    long long v11 = (void *)a1[5];
    v12 = [v6 region];
    LODWORD(v11) = [v11 isEqual:v12];

    if (!v11) {
      goto LABEL_5;
    }
  }
  uint64_t v8 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v8 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v14 = *(id *)(v9 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v9 + 40), v14);
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v13 = *(id *)(v10 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v10 + 40), v13);
LABEL_5:
}

void __33__ENDaemon_descriptionWithLevel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  id v5 = a2;
  double v6 = [v5 region];
  unsigned int v7 = [v3 configurationForRegion:v6];
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(id *)(v8 + 40);
  NSAppendPrintF_safe();

  objc_storeStrong((id *)(v8 + 40), v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(id *)(v9 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v9 + 40), v10);
}

- (void)activate
{
  if (GestaltGetDeviceClass() == 1)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__ENDaemon_activate__block_invoke;
    block[3] = &unk_1E69ACA50;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

uint64_t __20__ENDaemon_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 16) = 1;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v3 = *(void **)(v2 + 32);
    return [v3 _activate];
  }
  return result;
}

- (id)_readPreferenceActiveEntity
{
  CFDataGetTypeID();
  uint64_t v2 = (void *)CFPrefs_CopyTypedValue();
  if (![v2 length])
  {
    id v3 = 0;
    goto LABEL_7;
  }
  id v10 = 0;
  id v3 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v10];
  id v4 = v10;
  if (!v4)
  {
LABEL_7:
    id v6 = v3;
    id v3 = v6;
    goto LABEL_8;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v8 = v4, v9 = _LogCategory_Initialize(), id v4 = v8, v9))
    {
      id v5 = v4;
      LogPrintF_safe();
      id v4 = v5;
    }
  }

  id v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_writePreferenceActiveEntity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v16 = 0;
    id v5 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v16];
    id v6 = v16;
    if (v6)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    else if (v5)
    {
      CFPrefs_SetValue();
      unsigned int v7 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      id v8 = [v4 entity];
      int v9 = [v8 region];
      id v10 = [v7 serverConfigurationForRegion:v9];

      if (v10)
      {
        id v11 = (void *)MEMORY[0x1E4F28DA8];
        v12 = [v4 entity];
        id v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

        if (v13) {
          CFPrefs_SetValue();
        }
      }
      BOOL v14 = 1;
      goto LABEL_19;
    }
    BOOL v14 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  BOOL v14 = 0;
LABEL_20:

  return v14;
}

- (id)_readPreferenceRegionPendingOnboarding
{
  CFDataGetTypeID();
  uint64_t v2 = (void *)CFPrefs_CopyTypedValue();
  if (![v2 length])
  {
    id v3 = 0;
    goto LABEL_7;
  }
  id v10 = 0;
  id v3 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v10];
  id v4 = v10;
  if (!v4)
  {
LABEL_7:
    id v6 = v3;
    id v3 = v6;
    goto LABEL_8;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v8 = v4, v9 = _LogCategory_Initialize(), id v4 = v8, v9))
    {
      id v5 = v4;
      LogPrintF_safe();
      id v4 = v5;
    }
  }

  id v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_writePreferenceRegionPendingOnboarding:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
    id v5 = v8;
    if (v5)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    else if (v4)
    {
      CFPrefs_SetValue();
      BOOL v6 = 1;
LABEL_15:

      goto LABEL_16;
    }
    BOOL v6 = 0;
    goto LABEL_15;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  BOOL v6 = 0;
LABEL_16:

  return v6;
}

- (BOOL)_isNKDActive
{
  id v3 = [(ENDaemon *)self activeEntity];
  BOOL v4 = [v3 activeStatus] == 3 && self->_prefEnableNKD;

  return v4;
}

- (void)_activate
{
  id v3 = [MEMORY[0x1E4F1CA68] dictionary];
  screenUnlockPendingActions = self->_screenUnlockPendingActions;
  self->_screenUnlockPendingActions = v3;

  self->_startTicks = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  CFStringGetTypeID();
  id v5 = (void *)CFPrefs_CopyTypedValue();
  BOOL v6 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v5];
  CFStringGetTypeID();
  unsigned int v7 = (ENActiveEntity *)CFPrefs_CopyTypedValue();
  if (v6)
  {
    id v8 = [v6 appState];
    int v9 = [v8 isInstalled];

    if (v9)
    {
      if (v7)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v49 = v7;
          v50 = v5;
          LogPrintF_safe();
        }
        id v13 = +[ENConfigurationManager staticRegionForBundleID:](ENConfigurationManager, "staticRegionForBundleID:", v5, v49, v50);
        if (v13)
        {
          uint64_t v11 = [MEMORY[0x1E4F257A8] regionWithCode:v13];
        }
        else
        {
          BOOL v14 = +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:v7];
          if (v14)
          {
            uint64_t v11 = [objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v14];
          }
          else
          {
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v49 = v7;
              v50 = v5;
              LogPrintF_safe();
            }
            uint64_t v11 = 0;
          }
        }
        uint64_t v15 = [ENActiveEntity alloc];
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v5 region:v11];
        id v10 = [(ENActiveEntity *)v15 initWithEntity:v16 activeStatus:2];

        [(ENDaemon *)self _writePreferenceActiveEntity:v10];
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v49 = v10;
          LogPrintF_safe();
        }

        goto LABEL_25;
      }
    }
  }
  id v10 = [(ENDaemon *)self _readPreferenceActiveEntity];
  uint64_t v11 = 0;
  v12 = 0;
  if (v7)
  {
LABEL_25:
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    v12 = (void *)v11;
  }
  uint64_t v51 = v12;
  if (v5)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    CFPrefs_RemoveValue();
    uint64_t v17 = (void *)TCCAccessCopyInformation();
    unint64_t v18 = [MEMORY[0x1E4F28F68] predicateWithFormat:@"%K == %@", *MEMORY[0x1E4FA99F0], *MEMORY[0x1E4F1CFD8]];
    id v19 = [v17 filteredArrayUsingPredicate:v18];
    if ([v19 count]) {
      [(ENDaemon *)self _disableAvailabilityAlertIfNeeded];
    }
  }
  int v65 = 0;
  p_activeEntity = &self->_activeEntity;
  objc_storeStrong((id *)&self->_activeEntity, v10);
  self->_prefTCCAllowWithoutApps = CFPrefs_GetInt64() != 0;
  self->_BOOL wasInRestrictedStatus = CFPrefs_GetInt64() != 0;
  self->_BOOL wasInDifferentActiveRegion = CFPrefs_GetInt64() != 0;
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v65)
  {
    BOOL v22 = CFPrefs_GetInt64() != 0;
  }
  else
  {
    BOOL v22 = Int64 == 0;
    CFPrefs_RemoveValue();
  }
  -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", v22, v49, v50);
  LogSetAppID();
  LogControl();
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.ExposureNotification", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __21__ENDaemon__activate__block_invoke;
    handler[3] = &unk_1E69ACB68;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;
    v25 = mach_service;

    xpc_connection_activate(v25);
  }
  if (self->_screenLockNotifyToken == -1)
  {
    v26 = (const char *)*MEMORY[0x1E4FA77C0];
    dispatchQueue = self->_dispatchQueue;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __21__ENDaemon__activate__block_invoke_2;
    v63[3] = &unk_1E69ACFA0;
    v63[4] = self;
    notify_register_dispatch(v26, &self->_screenLockNotifyToken, dispatchQueue, v63);
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    v28 = self->_dispatchQueue;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __21__ENDaemon__activate__block_invoke_5;
    v62[3] = &unk_1E69ACFA0;
    v62[4] = self;
    notify_register_dispatch("com.apple.ExposureNotification.prefsChanged", &self->_prefsChangedNotifyToken, v28, v62);
  }
  if (self->_profileChangedNotifyToken == -1)
  {
    v29 = self->_dispatchQueue;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __21__ENDaemon__activate__block_invoke_6;
    v61[3] = &unk_1E69ACFA0;
    v61[4] = self;
    notify_register_dispatch("com.apple.MCX._managementStatusChangedForDomains", &self->_profileChangedNotifyToken, v29, v61);
  }
  if (self->_proxyConfigChangedNotifyToken == -1)
  {
    id v30 = (const char *)[@"com.apple.networkserviceproxy.privacy-proxy-configuration-changed" utf8ValueSafe];
    objc_super v31 = self->_dispatchQueue;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __21__ENDaemon__activate__block_invoke_7;
    v60[3] = &unk_1E69ACFA0;
    v60[4] = self;
    notify_register_dispatch(v30, &self->_proxyConfigChangedNotifyToken, v31, v60);
  }
  if (self->_proxyStatusChangedNotifyToken == -1)
  {
    v32 = (const char *)[@"com.apple.networkserviceproxy.privacy-proxy-service-status-changed" utf8ValueSafe];
    v33 = self->_dispatchQueue;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __21__ENDaemon__activate__block_invoke_8;
    v59[3] = &unk_1E69ACFA0;
    v59[4] = self;
    notify_register_dispatch(v32, &self->_proxyStatusChangedNotifyToken, v33, v59);
  }
  if (!self->_systemMonitor)
  {
    v34 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1F8]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v34;
    v36 = v34;

    [(CUSystemMonitor *)v36 setDispatchQueue:self->_dispatchQueue];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __21__ENDaemon__activate__block_invoke_9;
    v58[3] = &unk_1E69ACA50;
    v58[4] = self;
    [(CUSystemMonitor *)v36 setFirstUnlockHandler:v58];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __21__ENDaemon__activate__block_invoke_10;
    v57[3] = &unk_1E69ACA50;
    v57[4] = self;
    [(CUSystemMonitor *)v36 setSystemLockStateChangedHandler:v57];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __21__ENDaemon__activate__block_invoke_11;
    v56[3] = &unk_1E69ACA50;
    v56[4] = self;
    [(CUSystemMonitor *)v36 activateWithCompletion:v56];
  }
  if (self->_tccChangedNotifyToken == -1)
  {
    v37 = self->_dispatchQueue;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __21__ENDaemon__activate__block_invoke_12;
    v55[3] = &unk_1E69ACFA0;
    v55[4] = self;
    notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccChangedNotifyToken, v37, v55);
  }
  if (!self->_stateHandler)
  {
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __21__ENDaemon__activate__block_invoke_13;
    location[4] = &unk_1E69ACFC8;
    location[5] = self;
    self->_stateHandler = os_state_add_handler();
  }
  if (!self->_temporaryExposureKeyManager)
  {
    v38 = [[ENTemporaryExposureKeyManager alloc] initWithQueue:self->_dispatchQueue];
    temporaryExposureKeyManager = self->_temporaryExposureKeyManager;
    self->_temporaryExposureKeyManager = v38;

    [(ENTemporaryExposureKeyManager *)self->_temporaryExposureKeyManager setDelegate:self];
  }
  location[0] = 0;
  objc_initWeak(location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __21__ENDaemon__activate__block_invoke_14;
  v52[3] = &unk_1E69ACFF0;
  v52[4] = self;
  objc_copyWeak(&v53, location);
  [WeakRetained registerStateMetricPullCallback:v52];

  [(ENDaemon *)self _regionMonitorEnsureStarted];
  [(ENDaemon *)self _configurationManagerEnsureStarted];
  uint64_t v41 = [(ENDaemon *)self _readPreferenceActiveEntity];
  v42 = *p_activeEntity;
  *p_activeEntity = (ENActiveEntity *)v41;

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  v43 = (ApplicationObserver *)objc_opt_new();
  applicationObserver = self->_applicationObserver;
  self->_applicationObserver = v43;

  [(ApplicationObserver *)self->_applicationObserver setDelegate:self];
  unsigned int v45 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
  if (v45)
  {
    v46 = [(ENDaemon *)self configurationManager];
    v47 = [v46 configurationStore];
    v48 = [v47 serverConfigurationForRegion:v45];

    if (!v48) {
      [(ENDaemon *)self onboardingTriggerDeactivate];
    }
  }

  [(ENDaemon *)self onboardingTriggerResumeIfNeeded];
  [(ENDaemon *)self _tccChanged];
  [(ENDaemon *)self pauseUpdate];
  [(ENDaemon *)self prefsChanged];
  [(ENDaemon *)self _networkProxyStatusCheck];
  objc_destroyWeak(&v53);
  objc_destroyWeak(location);
}

void __21__ENDaemon__activate__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isDeviceUnlocked];
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    if (v2) {
      id v3 = "yes";
    }
    else {
      id v3 = "no";
    }
    BOOL v4 = [*(id *)(a1 + 32) screenUnlockPendingActions];
    id v8 = v3;
    uint64_t v9 = [v4 count];
    LogPrintF_safe();
  }
  id v5 = objc_msgSend(*(id *)(a1 + 32), "screenUnlockPendingActions", v8, v9);
  if (![v5 count]) {
    int v2 = 0;
  }

  if (v2 == 1)
  {
    BOOL v6 = [*(id *)(a1 + 32) screenUnlockPendingActions];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __21__ENDaemon__activate__block_invoke_3;
    v10[3] = &unk_1E69ACF78;
    v10[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v10];

    unsigned int v7 = [*(id *)(a1 + 32) screenUnlockPendingActions];
    [v7 removeAllObjects];
  }
}

void __21__ENDaemon__activate__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = dispatch_time(0, 2500000000);
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 224);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __21__ENDaemon__activate__block_invoke_4;
  v11[3] = &unk_1E69ACF50;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_after(v7, v8, v11);
}

uint64_t __21__ENDaemon__activate__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __21__ENDaemon__activate__block_invoke_5(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 prefsChanged];
}

uint64_t __21__ENDaemon__activate__block_invoke_6(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 prefsChanged];
}

uint64_t __21__ENDaemon__activate__block_invoke_7(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 _networkProxyStatusCheck];
}

uint64_t __21__ENDaemon__activate__block_invoke_8(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 _networkProxyStatusCheck];
}

uint64_t __21__ENDaemon__activate__block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) _tccChanged];
  int v2 = *(void **)(a1 + 32);

  return [v2 _update];
}

uint64_t __21__ENDaemon__activate__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __21__ENDaemon__activate__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __21__ENDaemon__activate__block_invoke_12(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 _tccChanged];
}

uint64_t __21__ENDaemon__activate__block_invoke_13(uint64_t a1)
{
  return MEMORY[0x1F41161B8]("ENDaemon", *(void *)(a1 + 32), &gLogCategory_ENDaemon);
}

void __21__ENDaemon__activate__block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(NSObject **)(v1 + 224);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __21__ENDaemon__activate__block_invoke_15;
  v3[3] = &unk_1E69ACFF0;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __21__ENDaemon__activate__block_invoke_15(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 232) entity];
  id v3 = [v2 region];
  id v4 = v3;
  if (v3)
  {
    id v23 = v3;
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 368) getCurrentRegionVisitWithError:0];
    id v23 = [v5 region];
  }
  if ([v23 validSubdivisionCode])
  {
    id v6 = [v23 subdivisionCode];
  }
  else
  {
    id v6 = 0;
  }
  dispatch_time_t v7 = [v6 componentsSeparatedByString:@"-"];
  if ([v7 count] == 2)
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    int v9 = [v8 isEqualToString:@"US"];

    if (v9)
    {
      id v10 = [v7 objectAtIndexedSubscript:1];
      [v10 utf8ValueSafe];
    }
  }
  unsigned __int8 v11 = [*(id *)(a1 + 32) _getAvailabilityAlertCountIncrement:0 reset:1];
  id v12 = [*(id *)(a1 + 32) configurationManager];
  id v13 = [v12 configurationStore];
  BOOL v14 = [v13 configurationForRegion:v23];

  uint64_t v15 = [v14 diagnosisKeysPreAuthorization];
  uint64_t v16 = [v15 userAuthorization];

  if (v16 == 1) {
    unsigned __int8 v17 = v11 | 0x80;
  }
  else {
    unsigned __int8 v17 = v11;
  }
  unsigned __int8 v18 = [*(id *)(a1 + 32) _getLegalConsentPageCount];
  CFPrefs_RemoveValue();
  if ([*(id *)(a1 + 32) _getExposureMatchAttemptBool])
  {
    v18 |= 0x40u;
    CFPrefs_SetValue();
  }
  if (CFPrefs_GetInt64())
  {
    v18 |= 0x80u;
    CFPrefs_RemoveValue();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  id v20 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v21 = [v20 stateMetricVersion];
  if ([v23 validSubdivisionCode])
  {
    BOOL v22 = [v23 subdivisionCode];
    [WeakRetained sendStateMetricWithVersion:v21 subdivisionCode:v22 availabilityAlertCount:v17 legalConsentPageCount:v18];
  }
  else
  {
    [WeakRetained sendStateMetricWithVersion:v21 subdivisionCode:@"Unknown" availabilityAlertCount:v17 legalConsentPageCount:v18];
  }
}

- (void)_disableAvailabilityAlertIfNeeded
{
}

- (unsigned)_getAvailabilityAlertCountIncrement:(BOOL)a3 reset:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned __int8 Int64 = CFPrefs_GetInt64();
  if (v4)
  {
    CFPrefs_RemoveValue();
  }
  else if (v5)
  {
    ++Int64;
    CFPrefs_SetInt64();
  }
  return Int64;
}

- (id)_getBundleIDFromBundle:(__CFBundle *)a3
{
  CFURLRef v3 = CFBundleCopyBundleURL(a3);
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F28B58] bundleWithURL:v3];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = [v4 bundleIdentifier];
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v6 = 0;
    }
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_getExposureMatchAttemptBool
{
  return CFPrefs_GetInt64() != 0;
}

- (id)_getInfoDictFromBundle:(__CFBundle *)a3
{
  CFURLRef v3 = CFBundleCopyBundleURL(a3);
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F28B58] bundleWithURL:v3];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = [v4 infoDictionary];
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v6 = 0;
    }
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_getInfoDictFromAppProxy:(id)a3
{
  CFURLRef v3 = [a3 bundleURL];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F28B58] bundleWithURL:v3];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = [v4 infoDictionary];
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v6 = 0;
    }
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = 0;
  }

  return v6;
}

- (unsigned)_getLegalConsentPageCount
{
  return CFPrefs_GetInt64();
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__ENDaemon_invalidate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__ENDaemon_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 _invalidate];
}

- (void)_invalidate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v5 = v3;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "invalidate", (void)v23);
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)v5 removeAllObjects];
  [(NSBackgroundActivityScheduler *)self->_persistencePurgeScheduler invalidate];
  persistencePurgeScheduler = self->_persistencePurgeScheduler;
  self->_persistencePurgeScheduler = 0;

  [(ENDaemon *)self _bluetoothMonitorEnsureStopped];
  [(ENDaemon *)self _bluetoothTracingEnsureStopped];
  [(ENDaemon *)self _configurationManagerEnsureStopped];
  [(ENDaemon *)self _databasesEnsureClosed];
  [(ENDaemon *)self _exposureManagersEnsureStopped];
  [(ENDaemon *)self _regionMonitorEnsureStopped];
  [(ENDaemon *)self setUserNotificationCenter:0];
  [(ENDaemon *)self setMonthlySummaryDisabled:1];
  pauseTimer = self->_pauseTimer;
  if (pauseTimer)
  {
    id v12 = pauseTimer;
    dispatch_source_cancel(v12);
    id v13 = self->_pauseTimer;
    self->_pauseTimer = 0;
  }
  int prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_int prefsChangedNotifyToken = -1;
  }
  int profileChangedNotifyToken = self->_profileChangedNotifyToken;
  if (profileChangedNotifyToken != -1)
  {
    notify_cancel(profileChangedNotifyToken);
    self->_int profileChangedNotifyToken = -1;
  }
  int proxyStatusChangedNotifyToken = self->_proxyStatusChangedNotifyToken;
  if (proxyStatusChangedNotifyToken != -1)
  {
    notify_cancel(proxyStatusChangedNotifyToken);
    self->_int proxyStatusChangedNotifyToken = -1;
  }
  int proxyConfigChangedNotifyToken = self->_proxyConfigChangedNotifyToken;
  if (proxyConfigChangedNotifyToken != -1)
  {
    notify_cancel(proxyConfigChangedNotifyToken);
    self->_int proxyConfigChangedNotifyToken = -1;
  }
  int screenLockNotifyToken = self->_screenLockNotifyToken;
  if (screenLockNotifyToken != -1)
  {
    notify_cancel(screenLockNotifyToken);
    self->_int screenLockNotifyToken = -1;
  }
  int tccChangedNotifyToken = self->_tccChangedNotifyToken;
  if (tccChangedNotifyToken != -1)
  {
    notify_cancel(tccChangedNotifyToken);
    self->_int tccChangedNotifyToken = -1;
  }
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    uint64_t v21 = xpcListener;
    xpc_connection_cancel(v21);
    BOOL v22 = self->_xpcListener;
    self->_xpcListener = 0;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (id)_getDelegateAndReturnError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else if (a3)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __32__ENDaemon__updateOverallStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyUserWithStatus:*(void *)(a1 + 40)];
}

- (void)notifyUserWithStatus:(int64_t)a3
{
  if (a3 == 4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      [(ENDaemon *)self overallStatus];
      LogPrintF_safe();
    }
    [(ENDaemon *)self postENOffNotification];
  }
}

- (void)pauseUpdate
{
  int v18 = 0;
  CFPrefs_GetDouble();
  double v4 = v3;
  if (v3 - CFAbsoluteTimeGetCurrent() + -10.0 > 0.0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      BOOL v5 = CUPrintDateCF();
      uint64_t v16 = CUPrintDurationDouble();
      LogPrintF_safe();
    }
    pauseTimer = self->_pauseTimer;
    if (pauseTimer)
    {
      int v9 = pauseTimer;
      dispatch_source_cancel(v9);
      id v10 = self->_pauseTimer;
      self->_pauseTimer = 0;
    }
    unsigned __int8 v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v12 = self->_pauseTimer;
    self->_pauseTimer = v11;
    id v13 = v11;

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __23__ENDaemon_pauseUpdate__block_invoke;
    handler[3] = &unk_1E69AD018;
    handler[4] = v13;
    void handler[5] = self;
    *(double *)&handler[6] = v4;
    dispatch_source_set_event_handler(v13, handler);
    CUDispatchTimerSet();
    dispatch_activate(v13);
    goto LABEL_15;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v6 = CUPrintDateCF();
    uint64_t v7 = CUPrintDurationDouble();
    LogPrintF_safe();
  }
  CFPrefs_SetValue();
  CFPrefs_RemoveValue();
  BOOL v14 = self->_pauseTimer;
  if (v14)
  {
    id v13 = v14;
    dispatch_source_cancel(v13);
    uint64_t v15 = self->_pauseTimer;
    self->_pauseTimer = 0;

LABEL_15:
  }
}

uint64_t __23__ENDaemon_pauseUpdate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  if (v1 == *(void **)(*(void *)(result + 40) + 32))
  {
    uint64_t v2 = result;
    if (v1)
    {
      double v3 = v1;
      dispatch_source_cancel(v3);
      uint64_t v4 = *(void *)(v2 + 40);
      BOOL v5 = *(void **)(v4 + 32);
      *(void *)(v4 + 32) = 0;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = CUPrintDateCF();
      LogPrintF_safe();
    }
    CFPrefs_SetValue();
    CFPrefs_RemoveValue();
    id v6 = *(void **)(v2 + 40);
    return [v6 prefsChanged];
  }
  return result;
}

- (void)prefsChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v215 = 0;
  if (!CFPrefs_GetInt64()) {
    [(ENDaemon *)self _resetDeveloperSettings];
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v5 = Int64 != 0;
  if (self->_prefStoreDemoMode != v5)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v6 = Int64;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        uint64_t v7 = "yes";
        if (v6) {
          uint64_t v8 = "no";
        }
        else {
          uint64_t v8 = "yes";
        }
        if (!v6) {
          uint64_t v7 = "no";
        }
        v182 = v8;
        v190 = v7;
        LogPrintF_safe();
      }
    }
    self->_prefStoreDemoMode = v5;
  }
  uint64_t v9 = CFPrefs_GetInt64();
  BOOL v10 = v9 != 0;
  if (self->_prefRegionMonitorTestMode != v10)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v11 = v9;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        id v12 = "yes";
        if (v11) {
          id v13 = "no";
        }
        else {
          id v13 = "yes";
        }
        if (!v11) {
          id v12 = "no";
        }
        v182 = v13;
        v190 = v12;
        LogPrintF_safe();
      }
    }
    self->_prefRegionMonitorTestMode = v10;
  }
  BOOL v14 = [(ENDaemon *)self _readPreferenceActiveEntity];
  activeEntity = self->_activeEntity;
  id location = (id *)&self->_activeEntity;
  uint64_t v16 = v14;
  unsigned __int8 v17 = activeEntity;
  if (v16 == v17)
  {

    id v20 = v16;
LABEL_36:

    goto LABEL_37;
  }
  int v18 = v17;
  if ((v16 == 0) == (v17 != 0))
  {

LABEL_31:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v183 = *location;
      v191 = v16;
      LogPrintF_safe();
    }
    objc_storeStrong(location, v14);
    [(ENConfigurationManager *)self->_configurationManager setActiveEntity:self->_activeEntity];
    [(ENTemporaryExposureKeyManager *)self->_temporaryExposureKeyManager resetClientState];
    notify_post("com.apple.ExposureNotification.trackedAppChanged");
    CFPrefs_RemoveValue();
    id v20 = [(ENDaemon *)self screenUnlockPendingActions];
    [v20 removeAllObjects];
    goto LABEL_36;
  }
  BOOL v19 = [(ENActiveEntity *)v16 isEqual:v17];

  if (!v19) {
    goto LABEL_31;
  }
LABEL_37:
  v201 = v16;
  id v202 = WeakRetained;
  uint64_t v21 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  BOOL v22 = [(ENActiveEntity *)self->_activeEntity entity];
  long long v23 = [v22 region];
  v211 = v21;
  v204 = [v21 serverConfigurationForRegion:v23];

  CFStringGetTypeID();
  long long v24 = (void *)CFPrefs_CopyTypedValue();
  prefRegionIdentifierOverride = self->_prefRegionIdentifierOverride;
  long long v26 = v24;
  v27 = prefRegionIdentifierOverride;
  if (v26 == v27)
  {

    id v30 = v26;
LABEL_48:

    goto LABEL_49;
  }
  uint64_t v28 = v27;
  if ((v26 == 0) == (v27 != 0))
  {

LABEL_43:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v184 = self->_prefRegionIdentifierOverride;
      v192 = v26;
      LogPrintF_safe();
    }
    id v30 = self->_prefRegionIdentifierOverride;
    objc_storeStrong((id *)&self->_prefRegionIdentifierOverride, v24);
    [(ENDaemon *)self _fetchPrefRegionConfig:self->_prefRegionIdentifierOverride oldCustomCountryCode:v30];
    goto LABEL_48;
  }
  char v29 = [(NSString *)v26 isEqual:v27];

  if ((v29 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_49:
  v200 = v26;
  objc_super v31 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  v32 = [(ENActiveEntity *)self->_activeEntity entity];
  v33 = [v32 region];
  v34 = [v31 agencyConfigurationForRegion:v33];

  v210 = [v34 agencyColor];
  uint64_t v35 = [v34 agencyHeaderStyle];
  v209 = [v34 agencyHeaderTextColor];
  v208 = [v34 agencyDisplayName];
  v36 = [v34 localizedConfiguration];
  v207 = [v36 regionName];

  v37 = [v34 localizedConfiguration];
  v206 = [v37 agencyTurndownMessage];

  v199 = v34;
  v205 = [v34 agencyImageURL];
  v38 = [(ENActiveEntity *)self->_activeEntity entity];
  if (!v38) {
    goto LABEL_60;
  }
  id v39 = objc_alloc(MEMORY[0x1E4F25728]);
  v40 = [v38 bundleIdentifier];
  uint64_t v41 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInteger:v35];
  v42 = [v38 region];
  v43 = (void *)[v39 initWithBundleID:v40 agencyColor:v210 agencyHeaderStyle:v41 agencyHeaderTextColor:v209 localizedAgencyName:v208 localizedAgencyImageURL:v205 localizedAgencyTurndownMessage:v206 localizedRegionName:v207 region:v42];

  if (v204)
  {
    CFDataGetTypeID();
    uint64_t v44 = CFPrefs_CopyTypedValue();
    if (!v44)
    {
LABEL_58:
      id v50 = objc_alloc(MEMORY[0x1E4F25728]);
      uint64_t v51 = [v38 bundleIdentifier];
      v52 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInteger:v35];
      id v53 = [v38 region];
      v54 = (void *)[v50 initWithBundleID:v51 agencyColor:v210 agencyHeaderStyle:v52 agencyHeaderTextColor:v209 localizedAgencyName:v208 localizedAgencyImageURL:v205 localizedAgencyTurndownMessage:v206 localizedRegionName:v207 region:v53];
      [(ENActiveEntity *)self->_activeEntity setEntity:v54];

      [(ENDaemon *)self _writePreferenceActiveEntity:self->_activeEntity];
      goto LABEL_59;
    }
    unsigned int v45 = (void *)v44;
    id v46 = v43;
    id v47 = v38;
    v48 = v47;
    if (v46 != v47)
    {
      if (v46)
      {
        char v49 = [v46 isEqual:v47];

        if (v49) {
          goto LABEL_59;
        }
      }
      else
      {
      }
      goto LABEL_58;
    }
  }
LABEL_59:

LABEL_60:
  v55 = [(ENRegionMonitor *)self->_regionMonitor getCurrentRegionVisitWithError:0];
  uint64_t v56 = [v55 region];

  BOOL v57 = CFPrefs_GetInt64() != 0;
  if (v215)
  {
    v58 = [v211 serverConfigurationForRegion:v56];
    uint64_t v59 = v58;
    BOOL v60 = v202;
    p_activeEntity = &self->_activeEntity;
    if (!v58
      || ([v58 enEnabled] & 1) != 0
      || [(ENConfigurationManager *)self->_configurationManager isInGracePeriodTransition])
    {
      BOOL v57 = 0;
    }
    else
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v185 = v56;
        LogPrintF_safe();
      }
      BOOL v57 = 1;
    }
  }
  else
  {
    BOOL v60 = v202;
    p_activeEntity = &self->_activeEntity;
  }
  if (self->_prefServerForceDisable != v57)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v62 = "yes";
      if (v57) {
        v63 = "no";
      }
      else {
        v63 = "yes";
      }
      if (!v57) {
        v62 = "no";
      }
      v193 = v63;
      v198 = v62;
      uint64_t v185 = v56;
      LogPrintF_safe();
    }
    self->_prefServerForceDisable = v57;
  }
  v203 = (void *)v56;
  uint64_t v64 = CFPrefs_GetInt64();
  BOOL v65 = v64 != 0;
  if (self->_prefAggressiveScanning != v65)
  {
    uint64_t v66 = v64;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v67 = "yes";
      if (v66) {
        v68 = "no";
      }
      else {
        v68 = "yes";
      }
      if (!v66) {
        v67 = "no";
      }
      uint64_t v185 = (uint64_t)v68;
      v193 = v67;
      LogPrintF_safe();
    }
    self->_prefAggressiveScanning = v65;
    objc_msgSend(v60, "setAggressiveScanningEnabled:", v66 != 0, v185, v193, v198);
  }
  uint64_t v69 = CFPrefs_GetInt64();
  BOOL v70 = v69 != 0;
  if (self->_automaticRegionSwitchEnabled != v70)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v71 = v69;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        uint64_t v72 = "yes";
        if (v71) {
          v73 = "no";
        }
        else {
          v73 = "yes";
        }
        if (!v71) {
          uint64_t v72 = "no";
        }
        uint64_t v185 = (uint64_t)v73;
        v193 = v72;
        LogPrintF_safe();
      }
    }
    self->_automaticRegionSwitchEnabled = v70;
  }
  uint64_t v74 = CFPrefs_GetInt64();
  BOOL v75 = v74 != 0;
  if (self->_availabilityAlertDisabled != v75)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v76 = v74;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v77 = "yes";
        if (v76) {
          id v78 = "no";
        }
        else {
          id v78 = "yes";
        }
        if (!v76) {
          v77 = "no";
        }
        uint64_t v185 = (uint64_t)v78;
        v193 = v77;
        LogPrintF_safe();
      }
    }
    self->_availabilityAlertDisabled = v75;
  }
  v79 = [(ENActiveEntity *)*p_activeEntity entity];
  unint64_t v80 = [v79 region];

  if (v80)
  {
    v81 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    BOOL v82 = [v81 configurationForRegion:v80];

    v213[0] = MEMORY[0x1E4F143A8];
    v213[1] = 3221225472;
    v213[2] = __24__ENDaemon_prefsChanged__block_invoke;
    v213[3] = &unk_1E69ACBE0;
    v213[4] = v211;
    id v83 = v82;
    id v214 = v83;
    id v84 = v213;
    if (prefsChanged_onceToken != -1) {
      dispatch_once(&prefsChanged_onceToken, v84);
    }

    p_activeEntity = &self->_activeEntity;
    if (v83) {
      unint64_t v80 = [v83 travelerModeEnabled];
    }
    else {
      unint64_t v80 = 0;
    }
  }
  else
  {

    id v83 = 0;
  }
  unint64_t travelStatus = self->_travelStatus;
  if (v80 != travelStatus)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon != -1)
      {
LABEL_124:
        if (travelStatus > 2) {
          v86 = "?";
        }
        else {
          v86 = off_1E69ADCF8[travelStatus];
        }
        if (v80 > 2) {
          v87 = "?";
        }
        else {
          v87 = off_1E69ADCF8[v80];
        }
        double v186 = *(double *)&v86;
        double v194 = *(double *)&v87;
        LogPrintF_safe();
        goto LABEL_133;
      }
      if (_LogCategory_Initialize())
      {
        unint64_t travelStatus = self->_travelStatus;
        goto LABEL_124;
      }
    }
LABEL_133:
    self->_unint64_t travelStatus = v80;
  }
  uint64_t v88 = CFPrefs_GetInt64();
  if (v215) {
    BOOL v89 = 0;
  }
  else {
    BOOL v89 = v88 == 0;
  }
  BOOL v90 = !v89;
  if (self->_prefConfigurationManagerEnabled != v90)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v91 = "yes";
      if (v90) {
        v92 = "no";
      }
      else {
        v92 = "yes";
      }
      if (!v90) {
        v91 = "no";
      }
      double v186 = *(double *)&v92;
      double v194 = *(double *)&v91;
      LogPrintF_safe();
    }
    self->_prefConfigurationManagerEnabled = v90;
  }
  CFPrefs_GetDouble();
  if (v215) {
    double v94 = 0.0;
  }
  else {
    double v94 = v93;
  }
  double prefDatabasePurgeInterval = self->_prefDatabasePurgeInterval;
  if (v94 != prefDatabasePurgeInterval)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_159;
        }
        double prefDatabasePurgeInterval = self->_prefDatabasePurgeInterval;
      }
      double v186 = prefDatabasePurgeInterval;
      double v194 = v94;
      LogPrintF_safe();
    }
LABEL_159:
    self->_double prefDatabasePurgeInterval = v94;
  }
  uint64_t v96 = CFPrefs_GetInt64();
  BOOL v97 = v96 != 0;
  if (self->_prefDeveloperServerConfiguration != v97)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v98 = v96;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v99 = "yes";
        if (v98) {
          v100 = "no";
        }
        else {
          v100 = "yes";
        }
        if (!v98) {
          v99 = "no";
        }
        double v186 = *(double *)&v100;
        double v194 = *(double *)&v99;
        LogPrintF_safe();
      }
    }
    self->_prefDeveloperServerConfiguration = v97;
    uint64_t v101 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    [v101 prefsChanged];
  }
  uint64_t v102 = CFPrefs_GetInt64();
  if (v215 || (unint64_t v103 = v102, v102 < 0) || v102 >= 5)
  {
    v104 = [(ENActiveEntity *)self->_activeEntity entity];
    v105 = [v104 region];

    v106 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    v107 = [v106 configurationForRegion:v105];
    v108 = [v107 userConsent];
    unint64_t v103 = [v108 differentialPrivacyConsent];

    p_activeEntity = &self->_activeEntity;
  }
  unint64_t prefDifferentialPrivacyConsent = self->_prefDifferentialPrivacyConsent;
  if (v103 != prefDifferentialPrivacyConsent)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon != -1)
      {
LABEL_178:
        if (prefDifferentialPrivacyConsent > 4) {
          v110 = "?";
        }
        else {
          v110 = off_1E69ADB50[prefDifferentialPrivacyConsent];
        }
        if (v103 > 4) {
          v111 = "?";
        }
        else {
          v111 = off_1E69ADB50[v103];
        }
        double v186 = *(double *)&v110;
        double v194 = *(double *)&v111;
        LogPrintF_safe();
        goto LABEL_187;
      }
      if (_LogCategory_Initialize())
      {
        unint64_t prefDifferentialPrivacyConsent = self->_prefDifferentialPrivacyConsent;
        goto LABEL_178;
      }
    }
LABEL_187:
    self->_unint64_t prefDifferentialPrivacyConsent = v103;
  }
  uint64_t v112 = CFPrefs_GetInt64();
  if (v215) {
    BOOL v113 = 0;
  }
  else {
    BOOL v113 = v112 == 0;
  }
  BOOL v114 = !v113;
  if (self->_prefEnableNKD != v114)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v115 = "yes";
      if (v114) {
        v116 = "no";
      }
      else {
        v116 = "yes";
      }
      if (!v114) {
        v115 = "no";
      }
      double v186 = *(double *)&v116;
      double v194 = *(double *)&v115;
      LogPrintF_safe();
    }
    self->_prefEnableNKD = v114;
  }
  BOOL v117 = !self->_prefServerForceDisable && !self->_prefStoreDemoMode && CFPrefs_GetInt64() != 0;
  v118 = [(ENActiveEntity *)*p_activeEntity entity];
  uint64_t v119 = [v118 bundleIdentifier];
  if (!v119)
  {
    int v129 = 0;
    goto LABEL_228;
  }
  v120 = (void *)v119;
  int v121 = [(ENActiveEntity *)*p_activeEntity activeStatus];

  if (v121 == 2)
  {
    v122 = [(ENActiveEntity *)*p_activeEntity entity];
    v118 = [v122 bundleIdentifier];

    v123 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v118 placeholder:0];
    v124 = [v123 appState];
    if ([v124 isInstalled])
    {
      id v125 = [v123 appState];
      char v126 = [v125 isPlaceholder];

      if ((v126 & 1) == 0 && [(ENDaemon *)self tccAccessForBundleID:v118] == 1)
      {
        v127 = [v204 appBundleID];
        uint64_t v128 = [v127 length];

        if (v128)
        {
          int v129 = 0;
          goto LABEL_223;
        }
      }
    }
    else
    {
    }
    if (gLogCategory_ENDaemon <= 30)
    {
      p_activeEntity = &self->_activeEntity;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        v187 = (const char *)v118;
        LogPrintF_safe();
      }
      int v129 = 1;
      goto LABEL_227;
    }
    int v129 = 1;
LABEL_223:
    p_activeEntity = &self->_activeEntity;
LABEL_227:

LABEL_228:
    if (v117) {
      goto LABEL_229;
    }
LABEL_217:
    int v130 = 0;
    goto LABEL_233;
  }
  int v129 = 0;
  if (!v117) {
    goto LABEL_217;
  }
LABEL_229:
  int v130 = *p_activeEntity && (([(ENActiveEntity *)*p_activeEntity activeStatus] > 1) & ~v129) != 0
      || self->_prefTCCAllowWithoutApps;
LABEL_233:
  int prefEnabled = self->_prefEnabled;
  if (prefEnabled != v130)
  {
    int prefEnabled = v130;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v132 = "yes";
      if (v130) {
        id v133 = "no";
      }
      else {
        id v133 = "yes";
      }
      if (!v130) {
        id v132 = "no";
      }
      v187 = v133;
      uint64_t v195 = (uint64_t)v132;
      LogPrintF_safe();
    }
    self->_int prefEnabled = v130;
  }
  if (prefEnabled) {
    CFPrefs_RemoveValue();
  }
  uint64_t v134 = CFPrefs_GetInt64();
  int v135 = v134 != 0;
  int prefLoggingRPI = self->_prefLoggingRPI;
  if (prefLoggingRPI != v135)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v137 = v134;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        id v138 = "yes";
        if (v137) {
          id v139 = "no";
        }
        else {
          id v139 = "yes";
        }
        if (!v137) {
          id v138 = "no";
        }
        v187 = v139;
        uint64_t v195 = (uint64_t)v138;
        LogPrintF_safe();
      }
    }
    self->_int prefLoggingRPI = v135;
  }
  uint64_t v140 = CFPrefs_GetInt64();
  BOOL v141 = v140 != 0;
  if (self->_prefLoggingSensitive != v141)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v143 = v140;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        id v144 = "yes";
        if (v143) {
          id v145 = "no";
        }
        else {
          id v145 = "yes";
        }
        if (!v143) {
          id v144 = "no";
        }
        v187 = v145;
        uint64_t v195 = (uint64_t)v144;
        LogPrintF_safe();
      }
    }
    self->_prefLoggingSensitive = v141;
    long long v142 = v204;
    goto LABEL_271;
  }
  BOOL v89 = prefLoggingRPI == v135;
  long long v142 = v204;
  if (!v89)
  {
LABEL_271:
    id v146 = +[ENLoggingPrefs sharedENLoggingPrefs];
    [v146 loadLoggingPrefs];

    [v60 setLoggingParams:self->_prefLoggingRPI loggingSensitive:self->_prefLoggingSensitive];
  }
  uint64_t v147 = CFPrefs_GetInt64();
  BOOL v148 = v147 != 0;
  if (self->_prefPaused != v148)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v149 = v147;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        id v150 = "yes";
        if (v149) {
          id v151 = "no";
        }
        else {
          id v151 = "yes";
        }
        if (!v149) {
          id v150 = "no";
        }
        v187 = v151;
        uint64_t v195 = (uint64_t)v150;
        LogPrintF_safe();
      }
    }
    self->_prefPaused = v148;
  }
  BOOL v152 = CFPrefs_GetInt64() != 0;
  if (v215)
  {
    if (([v142 supportsFeatures:32] & 1) == 0
      && (networkProxyStatus = self->_networkProxyStatus) != 0
      && [(PrivacyProxyServiceStatus *)networkProxyStatus serviceStatus] == 1)
    {
      BOOL v152 = (BYTE1(self->_networkProxyTraffic) >> 3) & 1;
    }
    else
    {
      BOOL v152 = 0;
    }
  }
  if (self->_prefNetworkProxyEnabled != v152)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v154 = "yes";
      if (v152) {
        id v155 = "no";
      }
      else {
        id v155 = "yes";
      }
      if (!v152) {
        id v154 = "no";
      }
      v187 = v155;
      uint64_t v195 = (uint64_t)v154;
      LogPrintF_safe();
    }
    self->_prefNetworkProxyEnabled = v152;
  }
  uint64_t v156 = CFPrefs_GetInt64();
  if (v215 || (uint64_t v157 = v156, v156 < 0) || v156 >= 1001)
  {
    unsigned int v158 = objc_msgSend(v142, "dailyDetectExposureLimit", v187, v195);
    if (v158 - 1001 >= 0xFFFFFC18) {
      uint64_t v157 = v158;
    }
    else {
      uint64_t v157 = 15;
    }
  }
  prefRateLimitMaxAPICount = (const char *)self->_prefRateLimitMaxAPICount;
  if ((const char *)v157 != prefRateLimitMaxAPICount)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_311;
        }
        prefRateLimitMaxAPICount = (const char *)self->_prefRateLimitMaxAPICount;
      }
      v187 = prefRateLimitMaxAPICount;
      uint64_t v195 = v157;
      LogPrintF_safe();
    }
LABEL_311:
    self->_prefRateLimitMaxAPICount = v157;
  }
  uint64_t v160 = CFPrefs_GetInt64();
  if (v215 || (uint64_t v161 = v160, v160 < 0) || v160 >= 1001)
  {
    unsigned int v162 = objc_msgSend(v142, "detectExposureNKDLimit", v187, v195);
    if (v162 - 1001 >= 0xFFFFFC18) {
      uint64_t v161 = v162;
    }
    else {
      uint64_t v161 = 6;
    }
  }
  prefRateLimitMaxAPICountV2 = (const char *)self->_prefRateLimitMaxAPICountV2;
  if ((const char *)v161 != prefRateLimitMaxAPICountV2)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      if (gLogCategory_ENDaemon == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_323;
        }
        prefRateLimitMaxAPICountV2 = (const char *)self->_prefRateLimitMaxAPICountV2;
      }
      v187 = prefRateLimitMaxAPICountV2;
      uint64_t v195 = v161;
      LogPrintF_safe();
    }
LABEL_323:
    self->_prefRateLimitMaxAPICountV2 = v161;
  }
  uint64_t v164 = CFPrefs_GetInt64();
  BOOL v165 = v164 != 0;
  if (self->_prefSkipExposureWindowShuffling != v165)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v166 = v164;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        id v167 = "yes";
        if (v166) {
          id v168 = "no";
        }
        else {
          id v168 = "yes";
        }
        if (!v166) {
          id v167 = "no";
        }
        v187 = v168;
        uint64_t v195 = (uint64_t)v167;
        LogPrintF_safe();
      }
    }
    self->_prefSkipExposureWindowShuffling = v165;
  }
  uint64_t v169 = CFPrefs_GetInt64();
  BOOL v170 = v169 != 0;
  if (self->_prefSkipFileSigning != v170)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v171 = v169;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        uint64_t v172 = "yes";
        if (v171) {
          v173 = "no";
        }
        else {
          v173 = "yes";
        }
        if (!v171) {
          uint64_t v172 = "no";
        }
        v187 = v173;
        uint64_t v195 = (uint64_t)v172;
        LogPrintF_safe();
      }
    }
    self->_prefSkipFileSigning = v170;
  }
  uint64_t v174 = CFPrefs_GetInt64();
  BOOL v175 = v174 != 0;
  if (self->_prefTCCAllowWithoutApps != v175)
  {
    if (gLogCategory_ENDaemon <= 30)
    {
      uint64_t v176 = v174;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        id v177 = "yes";
        if (v176) {
          v178 = "no";
        }
        else {
          v178 = "yes";
        }
        if (!v176) {
          id v177 = "no";
        }
        v187 = v178;
        uint64_t v195 = (uint64_t)v177;
        LogPrintF_safe();
      }
    }
    self->_prefTCCAllowWithoutApps = v175;
  }
  uint64_t v179 = CFPrefs_GetInt64();
  if ((v179 != 0) != [(ENDaemon *)self monthlySummaryDisabled])
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v180 = "yes";
      if (v179) {
        v181 = "no";
      }
      else {
        v181 = "yes";
      }
      if (!v179) {
        uint64_t v180 = "no";
      }
      v189 = v181;
      v197 = v180;
      LogPrintF_safe();
      -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", v179 != 0, v189, v197);
    }
    else
    {
      -[ENDaemon setMonthlySummaryDisabled:](self, "setMonthlySummaryDisabled:", v179 != 0, v188, v196);
    }
  }
  [(ENConfigurationManager *)self->_configurationManager prefsChanged];
  [(ENDaemon *)self _scheduleUpdate];
}

uint64_t __24__ENDaemon_prefsChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveRegionConfiguration:*(void *)(a1 + 40) error:0];
}

- (void)_resetDeveloperSettings
{
  if (!IsAppleInternalBuild())
  {
    CFPrefs_RemoveValue();
    id v3 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    [v3 clearTemporaryCountrySubdivisionList];
    [v3 clearTemporaryServerConfigurations];
    CFPrefs_RemoveValue();
  }
}

- (void)_resetDataWithFlags:(unsigned int)a3
{
  BOOL v5 = [(ENDaemon *)self delegate];
  if ((~a3 & 0xFFF) != 0)
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      BOOL v19 = CUPrintFlags32();
      LogPrintF_safe();
    }
  }
  else
  {
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(ENDaemon *)self setUsageResetAllData:[(ENDaemon *)self usageResetAllData] + 1];
  }
  id v24 = 0;
  uint64_t v6 = -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v24, v19);
  id v7 = v24;
  if ((a3 & 0x40) == 0)
  {
    if ((a3 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_21:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [v5 purgeAdvertisementDatabase];
    if ((a3 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  [v5 resetTEKHistory];
  uint64_t v9 = [(ENDaemon *)self temporaryExposureKeyManager];
  [v9 resetClientState];

  if (a3) {
    goto LABEL_21;
  }
LABEL_12:
  if ((a3 & 4) == 0)
  {
LABEL_13:
    id v8 = v7;
    goto LABEL_35;
  }
LABEL_26:
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v23 = v7;
  char v10 = [v6 deleteExposureDetectionHistoryWithError:&v23];
  id v8 = v23;

  if ((v10 & 1) == 0
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v20 = v8;
    LogPrintF_safe();
  }
LABEL_35:
  if ((a3 & 8) != 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v12 = [(ENDaemon *)self downloadManager];
    [v12 purgeAllDownloads];

    if ((a3 & 0x10) == 0)
    {
LABEL_37:
      if ((a3 & 0x20) == 0) {
        goto LABEL_38;
      }
      goto LABEL_50;
    }
  }
  else if ((a3 & 0x10) == 0)
  {
    goto LABEL_37;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  objc_msgSend(v6, "purgeAllAndCloseWithReason:", @"ResetData", v20);
  if ((a3 & 0x20) == 0)
  {
LABEL_38:
    id v11 = v8;
    if ((a3 & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_60;
  }
LABEL_50:
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v13 = [(ENDaemon *)self configurationManager];
  [v13 resetConfigurationCache];

  BOOL v14 = [(ENDaemon *)self regionMonitor];
  id v22 = v8;
  char v15 = [v14 purgeAllRegionHistoryWithError:&v22];
  id v11 = v22;

  if ((v15 & 1) == 0
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    uint64_t v21 = CUPrintNSError();
    LogPrintF_safe();
  }
  uint64_t v16 = [(ENDaemon *)self regionMonitor];
  [v16 resetRegionMonitor];

  if ((a3 & 0x80) != 0)
  {
LABEL_60:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    unsigned __int8 v17 = [(ENDaemon *)self textMessageManager];
    [v17 purgeAllHashes];
  }
LABEL_65:
  if ((a3 & 2) != 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_SetValue();
    int v18 = [(ENDaemon *)self userNotificationCenter];
    [v18 removeAllDeliveredNotifications];

    [(ENDaemon *)self onboardingTriggerDeactivate];
    TCCAccessReset();
    TCCAccessReset();
    if ((a3 & 0x100) != 0) {
      goto LABEL_67;
    }
  }
  else if ((a3 & 0x100) != 0)
  {
LABEL_67:
    CFPrefs_RemoveValue();
  }
  -[ENDaemon setOnboardingTrigger:](self, "setOnboardingTrigger:", 0, v20);
  [(ENDaemon *)self setOnboardingRegionTrigger:0];
  [(ENDaemon *)self setOnboardingFirstTime:0];
  [(ENDaemon *)self setOnboardingLegalConsentLastViewCount:0];
  [(ENDaemon *)self prefsChanged];
}

- (void)_fetchPrefRegionConfig:(id)a3 oldCustomCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  [v8 prefsChanged];

  id v9 = v6;
  char v10 = v9;
  if (v9 && [v9 length])
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v10];
    configurationManager = self->_configurationManager;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke;
    v21[3] = &unk_1E69ACCB0;
    id v13 = (id *)v22;
    v22[0] = v10;
    v22[1] = self;
    [(ENConfigurationManager *)configurationManager fetchServerConfigurationsForRegion:v11 userInitiated:0 withCompletion:v21];
LABEL_11:

    goto LABEL_12;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  BOOL v14 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  [v14 clearTemporaryServerConfigurations];

  char v15 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  [v15 clearTemporaryCountrySubdivisionList];

  uint64_t v16 = [(ENActiveEntity *)self->_activeEntity entity];
  unsigned __int8 v17 = [v16 region];
  id v11 = [v17 countryCode];

  if (v11 && [v7 isEqualToString:v11])
  {
    dispatchQueue = self->_dispatchQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_3;
    v19[3] = &unk_1E69ACBE0;
    id v13 = (id *)v20;
    v20[0] = v7;
    v20[1] = self;
    dispatch_async(dispatchQueue, v19);
    goto LABEL_11;
  }
LABEL_12:
}

void __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v13 = CUPrintNSError();
      LogPrintF_safe();
    }
LABEL_22:
    id v8 = 0;
    goto LABEL_23;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v5;
    LogPrintF_safe();
  }
  id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 264), "configurationStore", v11, v12);
  id v16 = 0;
  [v7 saveTemporaryServerConfigurations:v5 error:&v16];
  id v8 = v16;

  if (!v8)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v9 = *(void *)(a1 + 40);
    char v10 = *(NSObject **)(v9 + 224);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_2;
    block[3] = &unk_1E69ACA50;
    block[4] = v9;
    dispatch_async(v10, block);
    goto LABEL_22;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    BOOL v14 = CUPrintNSError();
    LogPrintF_safe();
  }
LABEL_23:
}

uint64_t __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefsChanged];
}

uint64_t __56__ENDaemon__fetchPrefRegionConfig_oldCustomCountryCode___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 _turnOffEN];
}

- (void)_tccChanged
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (([(CUSystemMonitor *)self->_systemMonitor firstUnlocked] & 1) == 0)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return;
  }
  char v81 = 0;
  TCCAccessGetOverride();
  id v3 = (void *)TCCAccessCopyInformation();
  uint64_t v4 = (void *)MEMORY[0x1E4FA99F0];
  id v5 = [MEMORY[0x1E4F28F68] predicateWithFormat:@"%K == %@", *MEMORY[0x1E4FA99F0], *MEMORY[0x1E4F1CFC0]];
  id v6 = [v3 filteredArrayUsingPredicate:v5];
  id v7 = [MEMORY[0x1E4F28F68] predicateWithFormat:@"%K == %@", *v4, *MEMORY[0x1E4F1CFD8]];
  BOOL v65 = [v3 filteredArrayUsingPredicate:v7];
  id v8 = [(ENActiveEntity *)self->_activeEntity entity];
  uint64_t v66 = [v8 bundleIdentifier];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v78;
    id v13 = (void *)MEMORY[0x1E4FA99E0];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v78 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = [*(id *)(*((void *)&v77 + 1) + 8 * i) objectForKey:*v13];
        if (v15)
        {
          id v16 = [(ENDaemon *)self _getBundleIDFromBundle:v15];
          unsigned __int8 v17 = v16;
          if (v16 && [v16 isEqualToString:v66])
          {
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              uint64_t v56 = (uint64_t)v17;
              LogPrintF_safe();
            }
            [(ENDaemon *)self _turnOffEN];

            v43 = v65;
            goto LABEL_87;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v77 objects:v84 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v64 = v7;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v74;
    id v22 = (void *)MEMORY[0x1E4FA99E0];
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v74 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = [*(id *)(*((void *)&v73 + 1) + 8 * j) objectForKey:*v22];
        if (v24)
        {
          long long v25 = [(ENDaemon *)self _getBundleIDFromBundle:v24];
          long long v26 = v25;
          if (v25 && ([v25 isEqualToString:v66] & 1) != 0)
          {

            int v27 = 1;
            goto LABEL_29;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  int v27 = 0;
LABEL_29:

  int v72 = 0;
  CFPrefs_GetInt64();
  uint64_t v28 = [(ENActiveEntity *)self->_activeEntity entity];
  char v29 = [v28 region];

  if ([(ENActiveEntity *)self->_activeEntity activeStatus] == 2)
  {
    v63 = v29;
    id v30 = v5;
    objc_super v31 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v66];
    v32 = [v31 appState];
    int v33 = [v32 isPlaceholder];

    v34 = [v31 appState];
    int v35 = [v34 isInstalled];

    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v36 = "no";
      if (v33) {
        v37 = "yes";
      }
      else {
        v37 = "no";
      }
      if (v35) {
        v36 = "yes";
      }
      uint64_t v59 = v37;
      BOOL v60 = v36;
      uint64_t v56 = (uint64_t)v66;
      LogPrintF_safe();
    }
    -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 4, v56, v59, v60);
    id v7 = v64;
    if ((v33 | v35))
    {
      v43 = v65;
      if (((v27 | v33 & (v35 ^ 1)) & 1) == 0)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          BOOL v57 = v66;
          LogPrintF_safe();
        }
        -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 0, v57);
        [(ENDaemon *)self _turnOffEN];
        [(ENDaemon *)self postENOffNotification];
      }
    }
    else
    {
      v43 = v65;
      if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }

    id v5 = v30;
LABEL_65:
    char v29 = v63;
    goto LABEL_86;
  }
  if (v29 && [(ENActiveEntity *)self->_activeEntity activeStatus] == 3)
  {
    v38 = [(ENDaemon *)self configurationManager];
    id v39 = [v38 configurationStore];

    v40 = [v39 configurationForRegion:v29];
    uint64_t v41 = [v40 userConsent];
    uint64_t v42 = [v41 consent];

    id v7 = v64;
    if (!v42)
    {
      if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v56 = (uint64_t)v29;
        LogPrintF_safe();
      }
      [(ENDaemon *)self _turnOffEN];
      CFPrefs_RemoveValue();
      [(ENDaemon *)self postENOffNotification];
    }

    v43 = v65;
  }
  else
  {
    id v7 = v64;
    v43 = v65;
    if (!v66 && [v65 count])
    {
      v62 = v3;
      v63 = v29;
      v61 = v5;
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v56 = [v65 count];
        LogPrintF_safe();
      }
      [(ENDaemon *)self _turnOffEN];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v44 = v65;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v68 objects:v82 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        id v47 = (void *)MEMORY[0x1E4FA99E0];
        uint64_t v48 = *(void *)v69;
        do
        {
          for (uint64_t k = 0; k != v46; ++k)
          {
            if (*(void *)v69 != v48) {
              objc_enumerationMutation(v44);
            }
            uint64_t v50 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * k), "objectForKey:", *v47, v58, v59);
            if (v50)
            {
              uint64_t v51 = v50;
              int v52 = TCCAccessResetForBundle();
              id v53 = [(ENDaemon *)self _getBundleIDFromBundle:v51];
              if (gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                v54 = "yes";
                if (!v52) {
                  v54 = "no";
                }
                v58 = v53;
                uint64_t v59 = v54;
                LogPrintF_safe();
              }
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v68 objects:v82 count:16];
        }
        while (v46);
      }

      [(ENDaemon *)self postENOffNotification];
      id v5 = v61;
      id v3 = v62;
      id v7 = v64;
      v43 = v65;
      goto LABEL_65;
    }
  }
LABEL_86:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__ENDaemon__tccChanged__block_invoke;
  block[3] = &unk_1E69ACBE0;
  block[4] = v29;
  void block[5] = self;
  dispatch_async(dispatchQueue, block);

LABEL_87:
}

uint64_t __23__ENDaemon__tccChanged__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "startServerConfigurationFetchForRegion:");
  }
  return result;
}

- (void)_turnOffEN
{
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  TCCAccessReset();
  self->_monthlySummaryDisabled = 0;
  [(ENDaemon *)self monthlyTriggerDeactivate];
  [(ENDaemon *)self onboardingTriggerDeactivate];
  if (!self->_prefTCCAllowWithoutApps) {
    CFPrefs_SetValue();
  }
  id v3 = [MEMORY[0x1E4F1C9C0] date];
  [v3 timeIntervalSince1970];
  CFPrefs_SetDouble();

  [(ENDaemon *)self prefsChanged];
}

- (BOOL)_shouldDisableMonthlySummary
{
  return self->_monthlySummaryDisabled || [(ENDaemon *)self overallStatus] != 1;
}

- (void)setMonthlySummaryDisabled:(BOOL)a3
{
  self->_monthlySummaryDisabled = a3;
  if (a3)
  {
    [(ENDaemon *)self monthlyTriggerDeactivate];
  }
  else
  {
    CFPrefs_RemoveValue();
    [(ENDaemon *)self monthlyTriggerActivateWithIntervalOverride:0];
  }
}

- (void)monthlyTriggerActivateWithIntervalOverride:(unsigned int)a3
{
  if ([(ENDaemon *)self _shouldDisableMonthlySummary])
  {
LABEL_2:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v14 = CUPrintDuration32();
      int v27 = [(ENDaemon *)self monthlyNotificationTimer];
      LogPrintF_safe();
    }
    return;
  }
  if (a3)
  {
    int v31 = 0;
    double v6 = (double)a3;
  }
  else
  {
    uint64_t v12 = [(ENDaemon *)self monthlyNotificationTimer];

    if (v12) {
      goto LABEL_2;
    }
    int v31 = 0;
    CFPrefs_GetDouble();
    double v6 = v13;
  }
  if (v6 == 0.0)
  {
    id v7 = [MEMORY[0x1E4F1C9C0] date];
    id v8 = [MEMORY[0x1E4F1C9A0] currentCalendar];
    id v9 = objc_msgSend(v8, "nextDateAfterDate:matchingUnit:value:options:", v7, 16, objc_msgSend(v8, "component:fromDate:", 16, v7), 1024);
    uint64_t v10 = [v8 dateBySettingUnit:32 value:10 ofDate:v9 options:0];
    [v10 timeIntervalSinceDate:v7];
    double v6 = v11;
    CFPrefs_SetDouble();
  }
  if (gLogCategory_ENDaemon <= 30)
  {
    if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()) {
      LogPrintF_safe();
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = NSStringFromSelector(a2);
      uint64_t v28 = CUPrintDuration32();
      LogPrintF_safe();
    }
  }
  unint64_t v16 = 2592000;
  if (IsAppleInternalBuild())
  {
    BOOL v17 = a3 != 0;
    uint64_t Int64 = CFPrefs_GetInt64();
    BOOL v19 = v31 != 0;
    BOOL v20 = !v17 || !v19;
    double v21 = 7200.0;
    double v22 = 10.0;
    if (v17 && v19) {
      double v21 = 10.0;
    }
    uint64_t v23 = 60;
    if (v20) {
      uint64_t v23 = 2592000;
    }
    if ((unint64_t)(Int64 - 60) >= 0x278CC5)
    {
      double v22 = v21;
      unint64_t v16 = v23;
    }
    else
    {
      unint64_t v16 = (unint64_t)(double)(unint64_t)Int64;
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        long long v26 = CUPrintDurationDouble();
        LogPrintF_safe();
      }
    }
  }
  else
  {
    double v22 = 7200.0;
  }
  uint64_t v24 = [ENXPCTimer alloc];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __55__ENDaemon_monthlyTriggerActivateWithIntervalOverride___block_invoke;
  v30[3] = &unk_1E69AD040;
  v30[4] = self;
  long long v25 = [(ENXPCTimer *)v24 initWithName:@"com.apple.exposurenotification.weeklynotification" delay:v16 gracePeriod:1 cadence:8739 priority:v30 options:v6 block:v22];
  [(ENDaemon *)self setMonthlyNotificationTimer:v25];
}

void __55__ENDaemon_monthlyTriggerActivateWithIntervalOverride___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if ([*(id *)(a1 + 32) _shouldDisableMonthlySummary])
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [*(id *)(a1 + 32) monthlyTriggerDeactivate];
  }
  else
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 232) entity];
    uint64_t v4 = [v3 bundleIdentifier];
    if ([v4 length])
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 232) entity];
      double v6 = [v5 bundleIdentifier];
    }
    else
    {
      double v6 = 0;
    }

    [*(id *)(a1 + 32) postMonthlySummaryNotificationForAppBundleIdentifier:v6];
  }
}

- (void)monthlyTriggerDeactivate
{
  id v3 = [(ENDaemon *)self monthlyNotificationTimer];
  [v3 invalidate];

  [(ENDaemon *)self setMonthlyNotificationTimer:0];
  CFPrefs_SetValue();
  CFPrefs_RemoveValue();

  CFPrefs_RemoveValue();
}

- (void)_setActiveRegionForApp:(id)a3 infoDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v12 = v6;
    LogPrintF_safe();
  }
  id v8 = [(ENDaemon *)self configurationManager];
  id v9 = [v8 configurationStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__ENDaemon__setActiveRegionForApp_infoDict___block_invoke;
  v13[3] = &unk_1E69AD068;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 allRegionServerConfigurationsWithCompletion:v13];
}

void __44__ENDaemon__setActiveRegionForApp_infoDict___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
      id v9 = objc_msgSend(v8, "appBundleID", (void)v18);
      int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

      if (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v11 = v8;

    if (v11)
    {
      id v12 = [ENActiveEntity alloc];
      id v13 = objc_alloc(MEMORY[0x1E4F25728]);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [v11 region];
      id v16 = (void *)[v13 initWithBundleID:v14 region:v15];
      BOOL v17 = [(ENActiveEntity *)v12 initWithEntity:v16 activeStatus:2];

      [*(id *)(a1 + 40) _writePreferenceActiveEntity:v17];
      goto LABEL_17;
    }
  }
  else
  {
LABEL_9:
  }
  objc_msgSend(*(id *)(a1 + 40), "fetchServerConfigurationForAppBundleIdentifier:infoDictionary:", *(void *)(a1 + 32), *(void *)(a1 + 48), (void)v18);
LABEL_17:
}

- (void)updateExistingConsentForPhase1ActiveRegion:(int64_t)a3
{
  activeEntity = self->_activeEntity;
  if (activeEntity && [(ENActiveEntity *)activeEntity activeStatus] == 2)
  {
    uint64_t v6 = [(ENActiveEntity *)self->_activeEntity entity];
    uint64_t v7 = [v6 region];

    if (v7)
    {
      id v8 = [(ENDaemon *)self configurationManager];
      id v9 = [v8 configurationStore];
      int v10 = [v9 configurationForRegion:v7];

      id v11 = [v10 userConsent];
      uint64_t v12 = [v11 consent];

      if (v12)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          if ((unint64_t)a3 > 4) {
            id v13 = "?";
          }
          else {
            id v13 = off_1E69ADB50[a3];
          }
          long long v19 = self->_activeEntity;
          long long v20 = v13;
          LogPrintF_safe();
        }
        uint64_t v14 = objc_msgSend(v10, "userConsent", v19, v20);
        [v14 setConsent:a3];

        uint64_t v15 = [(ENDaemon *)self configurationManager];
        id v16 = [v15 configurationStore];
        id v21 = 0;
        char v17 = [v16 saveRegionConfiguration:v10 error:&v21];
        id v18 = v21;

        if ((v17 & 1) == 0
          && gLogCategory__ENDaemon <= 90
          && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
  }
  else if (gLogCategory_ENDaemon <= 10 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (id)xpcConnectionForBundleID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_xpcConnections;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "client", (void)v14);
        id v11 = [v10 signingIdentity];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)appLaunchWithBundleID:(id)a3 activity:(unsigned int)a4 shouldEnterForeground:(BOOL)a5 requiredRuntimeInSeconds:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v12 = [v11 isSensitiveLoggingAllowed];

  if (v12 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = CUPrintFlags32();
    long long v14 = (void *)v13;
    long long v15 = "no";
    if (v7) {
      long long v15 = "yes";
    }
    id v30 = v15;
    uint64_t v31 = v6;
    id v28 = v10;
    uint64_t v29 = v13;
    LogPrintF_safe();
  }
  long long v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appActivities, "objectForKeyedSubscript:", v10, v28, v29, v30, v31);
  if (!self->_appActivities)
  {
    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA68]);
    appActivities = self->_appActivities;
    self->_appActivities = v17;
  }
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInt:", objc_msgSend(v16, "unsignedIntValue") | a4);
  [(NSMutableDictionary *)self->_appActivities setObject:v19 forKeyedSubscript:v10];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke;
  v39[3] = &unk_1E69ACBE0;
  v39[4] = self;
  id v20 = v10;
  id v40 = v20;
  id v21 = (void *)MEMORY[0x1D9439FF0](v39);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  uint64_t v23 = v22;
  if (v7)
  {
    [v22 setObject:&unk_1F2B35F38 forKeyedSubscript:*MEMORY[0x1E4F62690]];
    uint64_t v24 = (void *)MEMORY[0x1E4F626A8];
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F62600];
  }
  [v23 setObject:&unk_1F2B35F38 forKeyedSubscript:*v24];
  long long v25 = [MEMORY[0x1E4F629D0] optionsWithDictionary:v23];
  long long v26 = [MEMORY[0x1E4F629D8] serviceWithDefaultShellEndpoint];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_540;
  v32[3] = &unk_1E69AD090;
  BOOL v38 = v7;
  v34 = self;
  int v35 = v21;
  unsigned int v36 = a4;
  int v37 = v6;
  id v33 = v20;
  id v27 = v20;
  [v26 openApplication:v27 withOptions:v25 completion:v32];
}

void __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) xpcConnectionForBundleID:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    int v3 = [*(id *)(a1 + 32) appDequeueActivityFlagsWithBundleID:*(void *)(a1 + 40)];
    uint64_t v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "xpcReportActivityFlags:");
      uint64_t v2 = v4;
    }
  }
}

void __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_540(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (!v5 || v6)
  {
    long long v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v15 = [v14 isSensitiveLoggingAllowed];

    if (v15 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      long long v16 = CUPrintFlags32();
      id v30 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    uint64_t v8 = [v5 pid];
    id v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v10 = [v9 isSensitiveLoggingAllowed];

    if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v27 = CUPrintFlags32();
      uint64_t v29 = v8;
      uint64_t v26 = v13;
      LogPrintF_safe();
    }
    if (*(unsigned char *)(a1 + 64))
    {
      (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v11, v12);
    }
    else
    {
      long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F4E288]) initWithPID:v8 flags:1 reason:5 name:*(void *)(a1 + 32)];
      if ([v17 acquire])
      {
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v18, v19);
        dispatch_time_t v20 = dispatch_time(0, 1000000000 * *(int *)(a1 + 60));
        id v21 = *(NSObject **)(*(void *)(a1 + 40) + 224);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_2;
        block[3] = &unk_1E69AD018;
        id v22 = *(id *)(a1 + 32);
        int v34 = *(_DWORD *)(a1 + 56);
        int v35 = v8;
        id v32 = v22;
        id v33 = v17;
        dispatch_after(v20, v21, block);
      }
      else
      {
        uint64_t v23 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v24 = [v23 isSensitiveLoggingAllowed];

        if (v24
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          uint64_t v25 = *(void *)(a1 + 32);
          id v28 = CUPrintFlags32();
          LogPrintF_safe();

          objc_msgSend(v17, "invalidate", v25, v28, v8);
        }
        else
        {
          objc_msgSend(v17, "invalidate", v26, v27, v29);
        }
      }
    }
  }
}

uint64_t __90__ENDaemon_appLaunchWithBundleID_activity_shouldEnterForeground_requiredRuntimeInSeconds___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v3 = [v2 isSensitiveLoggingAllowed];

  if (v3 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v6 = CUPrintFlags32();
    LogPrintF_safe();
  }
  id v4 = *(void **)(a1 + 40);

  return [v4 invalidate];
}

- (void)postAnalyticsOptInNotificationForRegion:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v4)
  {
    id v5 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v6 = [v5 serverConfigurationForRegion:v4];

    if (v6)
    {
      if ([v6 telemetryAuthorization])
      {
        if ((unint64_t)[v6 enVersion] > 1)
        {
          BOOL v7 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
          uint64_t v8 = [v7 agencyConfigurationForRegion:v4];

          int v24 = [v8 agencyDisplayName];
          id v9 = [v8 localizedConfiguration];
          int v10 = [v9 regionName];

          uint64_t v11 = (void *)MEMORY[0x1E4F29020];
          uint64_t v12 = [v4 regionCode];
          uint64_t v13 = [v11 stringWithFormat:@"prefs:root=EXPOSURE_NOTIFICATION&path=ANALYTICS-CONSENT/%@", v12];

          id v14 = objc_alloc_init(MEMORY[0x1E4F445A8]);
          [v14 setTitle:v10];
          int v15 = (void *)MEMORY[0x1E4F29020];
          v27[0] = v24;
          long long v16 = [MEMORY[0x1E4F1C970] arrayWithObjects:v27 count:1];
          long long v17 = [v15 localizedUserNotificationStringForKey:@"EN_ANALYTICS_CONSENT_SUBTITLE" arguments:v16];
          [v14 setSubtitle:v17];

          uint64_t v18 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_ANALYTICS_CONSENT_BODY" arguments:0];
          [v14 setBody:v18];

          uint64_t v19 = [MEMORY[0x1E4F44648] defaultSound];
          [v14 setSound:v19];

          [v14 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.endaemon"];
          [v14 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.analyticsConsent"];
          dispatch_time_t v20 = [MEMORY[0x1E4F1CB08] URLWithString:v13];
          [v14 setDefaultActionURL:v20];

          uint64_t v25 = @"regionCode";
          id v21 = [v4 regionCode];
          uint64_t v26 = v21;
          id v22 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          [v14 setUserInfo:v22];

          [v14 setShouldBackgroundDefaultAction:1];
          [v14 setShouldAuthenticateDefaultAction:1];
          uint64_t v23 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.UserNotification" content:v14 trigger:0 destinations:7];
          [(ENDaemon *)self _postUserNotificationWithRequest:v23 authorizationFailureHandler:0];

LABEL_10:
          goto LABEL_11;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_10;
        }
      }
      else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_10;
      }
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_10;
    }
    LogPrintF_safe();
    goto LABEL_10;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_11:
}

- (void)postExposureSummaryAccessNotificationWithAppBundleIdentifier:(id)a3 string:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v6 placeholder:0];
    id v9 = [v8 localizedName];

    id v10 = objc_alloc_init(MEMORY[0x1E4F445A8]);
    [v10 setTitle:v9];
    uint64_t v11 = [v7 length];
    uint64_t v12 = (void *)MEMORY[0x1E4F29020];
    if (v11)
    {
      uint64_t v13 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_COBRANDED_SUBTITLE" arguments:0];
      [v10 setSubtitle:v13];

      uint64_t v12 = (void *)MEMORY[0x1E4F29020];
      v27[0] = v7;
      id v14 = [MEMORY[0x1E4F1C970] arrayWithObjects:v27 count:1];
      int v15 = @"EN_COBRANDED_BODY";
    }
    else
    {
      id v26 = v7;
      id v14 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v26 count:1];
      int v15 = @"EN_COBRANDED_BODY_STANDALONE";
    }
    long long v16 = [v12 localizedUserNotificationStringForKey:v15 arguments:v14];
    [v10 setBody:v16];

    long long v17 = [MEMORY[0x1E4F44618] iconForApplicationIdentifier:v6];
    [v10 setIcon:v17];

    uint64_t v18 = [MEMORY[0x1E4F44648] defaultSound];
    [v10 setSound:v18];

    [v10 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.cobranded"];
    [v10 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.summary"];
    [v10 setShouldBackgroundDefaultAction:1];
    uint64_t v19 = [(ENActiveEntity *)self->_activeEntity entity];
    dispatch_time_t v20 = [v19 region];
    id v21 = [v20 regionCode];

    if (v21)
    {
      int v24 = @"regionCode";
      uint64_t v25 = v21;
      id v22 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v10 setUserInfo:v22];
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v23 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.summary" content:v10 trigger:0 destinations:7];
    [(ENDaemon *)self _postUserNotificationWithRequest:v23 authorizationFailureHandler:0];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)postGeneralNotificationWithTitle:(id)a3 message:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v12 && v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F445A8]);
    [v7 setTitle:&stru_1F2B29B10];
    uint64_t v8 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:v12 arguments:0];
    [v7 setSubtitle:v8];

    id v9 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:v6 arguments:0];
    [v7 setBody:v9];

    id v10 = [MEMORY[0x1E4F44648] defaultSound];
    [v7 setSound:v10];

    [v7 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.endaemon"];
    [v7 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.preArm"];
    [v7 setShouldBackgroundDefaultAction:1];
    [v7 setShouldAuthenticateDefaultAction:1];
    uint64_t v11 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.preArm" content:v7 trigger:0 destinations:7];
    [(ENDaemon *)self _postUserNotificationWithRequest:v11 authorizationFailureHandler:0];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)postMonthlySummaryNotificationForAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F445A8]);
    uint64_t v8 = [MEMORY[0x1E4F44618] iconForApplicationIdentifier:@"com.apple.Preferences"];
    [v7 setIcon:v8];

    [v7 setTitle:&stru_1F2B29B10];
    id v9 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_MONTHLY_SUBTITLE" arguments:0];
    [v7 setSubtitle:v9];

    id v10 = [MEMORY[0x1E4F44648] defaultSound];
    [v7 setSound:v10];

    [v7 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.weeklyupdatenotification"];
    [v7 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.weekly"];
    uint64_t v11 = [MEMORY[0x1E4F1CB08] URLWithString:@"prefs:root=EXPOSURE_NOTIFICATION"];
    [v7 setDefaultActionURL:v11];

    id v12 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_MONTHLY_ZERO_COUNT_BODY" arguments:0];
    [v7 setBody:v12];

    uint64_t v13 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.weekly" content:v7 trigger:0 destinations:7];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__ENDaemon_postMonthlySummaryNotificationForAppBundleIdentifier___block_invoke;
    v14[3] = &unk_1E69ACA50;
    v14[4] = self;
    [(ENDaemon *)self _postUserNotificationWithRequest:v13 authorizationFailureHandler:v14];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

uint64_t __65__ENDaemon_postMonthlySummaryNotificationForAppBundleIdentifier___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 117) = 1;
  return result;
}

- (void)postOnboardingNotificationForRegion:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v4)
  {
    unsigned int v5 = [(ENDaemon *)self _getAvailabilityAlertCountIncrement:1 reset:0];
    if (gLogCategory_ENDaemon <= 30)
    {
      unsigned int v6 = v5;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
      {
        uint64_t v22 = v6;
        LogPrintF_safe();
      }
    }
    id v7 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    uint64_t v8 = [v7 agencyConfigurationForRegion:v4];

    uint64_t v9 = [v8 agencyDisplayName];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      uint64_t v11 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      id v12 = [v11 serverConfigurationForRegion:v4];

      if ((unint64_t)[v12 enVersion] <= 1)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
      }
      else
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F445A8]);
        [v13 setTitle:&stru_1F2B29B10];
        id v14 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_AVAILABLE_SUBTITLE" arguments:0];
        [v13 setSubtitle:v14];

        int v15 = (void *)MEMORY[0x1E4F29020];
        v25[0] = v10;
        long long v16 = [MEMORY[0x1E4F1C970] arrayWithObjects:v25 count:1];
        long long v17 = [v15 localizedUserNotificationStringForKey:@"EN_AVAILABLE_BODY_PHA" arguments:v16];
        [v13 setBody:v17];

        uint64_t v18 = [MEMORY[0x1E4F44648] defaultSound];
        [v13 setSound:v18];

        [v13 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.endaemon"];
        [v13 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.onboarding"];
        uint64_t v23 = @"regionCode";
        uint64_t v19 = [v4 regionCode];
        int v24 = v19;
        dispatch_time_t v20 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v13 setUserInfo:v20];

        [v13 setShouldBackgroundDefaultAction:1];
        [v13 setShouldAuthenticateDefaultAction:1];
        id v21 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.onboarding" content:v13 trigger:0 destinations:7];
        [(ENDaemon *)self _postUserNotificationWithRequest:v21 authorizationFailureHandler:0];
      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)postPreAuthorizationNotificationForRegion:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v4)
  {
    unsigned int v5 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    unsigned int v6 = [v5 agencyConfigurationForRegion:v4];

    uint64_t v7 = [v6 agencyDisplayName];
    uint64_t v8 = (void *)v7;
    if (!v6 || !v7)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_23;
    }
    uint64_t v9 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v10 = [v9 serverConfigurationForRegion:v4];

    if ([(ENDaemon *)self _isNKDActive])
    {
      if (!v10)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v11 = [v10 appBundleID];
      id v12 = v11;
      if (!v10 || !v11 || ![v11 length])
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_21;
      }
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F445A8]);
    [v12 setTitle:v8];
    if ([(ENDaemon *)self _isNKDActive])
    {
      id v13 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_PREARM_SUBTITLE_ENX" arguments:0];
      [v12 setSubtitle:v13];

      id v14 = (void *)MEMORY[0x1E4F29020];
      v26[0] = v8;
      int v15 = [MEMORY[0x1E4F1C970] arrayWithObjects:v26 count:1];
      long long v16 = @"EN_PREARM_BODY_ENX";
    }
    else
    {
      long long v17 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_PREARM_SUBTITLE" arguments:0];
      [v12 setSubtitle:v17];

      id v14 = (void *)MEMORY[0x1E4F29020];
      uint64_t v25 = v8;
      int v15 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v25 count:1];
      long long v16 = @"EN_PREARM_BODY";
    }
    uint64_t v18 = [v14 localizedUserNotificationStringForKey:v16 arguments:v15];
    [v12 setBody:v18];

    uint64_t v19 = [MEMORY[0x1E4F44648] defaultSound];
    [v12 setSound:v19];

    [v12 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.endaemon"];
    [v12 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.preArm"];
    v23[0] = @"regionCode";
    dispatch_time_t v20 = [v4 regionCode];
    v23[1] = @"isKeyReleased";
    v24[0] = v20;
    v24[1] = MEMORY[0x1E4F1CC40];
    id v21 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v12 setUserInfo:v21];

    [v12 setShouldBackgroundDefaultAction:1];
    [v12 setShouldAuthenticateDefaultAction:1];
    [v12 setInterruptionLevel:2];
    uint64_t v22 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.preArm" content:v12 trigger:0 destinations:5];
    [(ENDaemon *)self _postUserNotificationWithRequest:v22 authorizationFailureHandler:0];

LABEL_21:
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_24:
}

- (void)postTestVerificationReceivedNotification:(id)a3 region:(id)a4 reportType:(unsigned int)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v8 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v46)
  {
    if (v8)
    {
      uint64_t v9 = [v46 ensTestVerificationURL];
      uint64_t v10 = [v9 absoluteString];

      uint64_t v45 = (void *)v10;
      if (!v10)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_24;
      }
      uint64_t v11 = [MEMORY[0x1E4F28E70] stringWithString:v10];
      id v12 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      id v13 = [v12 agencyConfigurationForRegion:v8];

      uint64_t v14 = [v13 agencyDisplayName];
      int v15 = (void *)v14;
      if (!v13 || !v14)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_23;
      }
      if (a5 == 3)
      {
        if (![(ENConfigurationManager *)self->_configurationManager regionSupportsFeatures:v8 featureFlags:2])
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          uint64_t v22 = 0;
          goto LABEL_22;
        }
        v43 = v11;
        long long v16 = [v13 localizedConfiguration];
        long long v17 = [v16 selfReportNotificationBody];

        if (![v17 length])
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }

          uint64_t v22 = 0;
          uint64_t v11 = v43;
          goto LABEL_22;
        }
        uint64_t v18 = (void *)MEMORY[0x1E4F29020];
        v49[0] = v17;
        [MEMORY[0x1E4F1C970] arrayWithObjects:v49 count:1];
        v20 = uint64_t v19 = v13;
        uint64_t v21 = [v18 localizedUserNotificationStringForKey:@"EN_SELF_REPORT_BODY_%@" arguments:v20];

        id v13 = v19;
        uint64_t v22 = (void *)v21;
        uint64_t v23 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_SELF_REPORT_SUBTITLE" arguments:0];

        uint64_t v11 = v43;
      }
      else
      {
        int v24 = [v13 localizedConfiguration];
        uint64_t v22 = [v24 testVerificationNotificationBody];

        if (![v22 length])
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          goto LABEL_22;
        }
        uint64_t v23 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_SMS_SUBTITLE_TOUCH_ID" arguments:0];
        if (+[ENDaemon deviceSupportsFaceID])
        {
          uint64_t v25 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_SMS_SUBTITLE_FACE_ID" arguments:0];

          uint64_t v23 = (void *)v25;
        }
      }
      id v26 = objc_msgSend(MEMORY[0x1E4F29020], "stringWithFormat:", @"&t=%lu", a5);
      [v11 appendString:v26];
      id v27 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      id v28 = [v27 serverConfigurationForRegion:v8];

      if (v28)
      {
        if ((unint64_t)[v28 enVersion] <= 1)
        {
          if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
            goto LABEL_21;
          }
        }
        else
        {
          if ([(ENDaemon *)self _isNKDActive])
          {
            id v29 = objc_alloc_init(MEMORY[0x1E4F445A8]);
            [v29 setTitle:v15];
            [v29 setSubtitle:v23];
            [v29 setBody:v22];
            [MEMORY[0x1E4F44648] defaultSound];
            id v30 = v42 = v28;
            [v29 setSound:v30];

            [v29 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.endaemon"];
            [v29 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.exposure"];
            [v29 setInterruptionLevel:2];
            v47[0] = @"regionCode";
            uint64_t v31 = [v8 regionCode];
            v47[1] = @"isTextMessageVerificationURL";
            v48[0] = v31;
            v48[1] = v11;
            [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v48 forKeys:v47 count:2];
            id v44 = v26;
            id v32 = self;
            id v33 = v23;
            int v34 = v15;
            int v35 = v13;
            unsigned int v36 = v11;
            id v37 = v8;
            id v39 = v38 = v22;
            [v29 setUserInfo:v39];

            uint64_t v22 = v38;
            id v8 = v37;
            uint64_t v11 = v36;
            id v13 = v35;
            int v15 = v34;
            uint64_t v23 = v33;

            [v29 setShouldBackgroundDefaultAction:1];
            [v29 setShouldAuthenticateDefaultAction:1];
            id v40 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.textMessage" content:v29 trigger:0 destinations:7];
            uint64_t v41 = v32;
            id v26 = v44;
            [(ENDaemon *)v41 _postUserNotificationWithRequest:v40 authorizationFailureHandler:0];

            id v28 = v42;
LABEL_21:

LABEL_22:
LABEL_23:

LABEL_24:
            goto LABEL_25;
          }
          if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
            goto LABEL_21;
          }
        }
      }
      else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_21;
      }
      LogPrintF_safe();
      goto LABEL_21;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
LABEL_31:
    }
      LogPrintF_safe();
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_31;
  }
LABEL_25:
}

- (void)presentBuddyForRegion:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v11 = [(ENDaemon *)self buddyAlertHandle];
  int v12 = [v11 isValid];

  if (v12)
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v19 = ENErrorF();
    if (v9) {
      v9[2](v9, v19);
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke;
    v23[3] = &unk_1E69AD0B8;
    v23[4] = self;
    id v13 = v9;
    uint64_t v25 = v13;
    id v24 = v8;
    id v26 = v10;
    uint64_t v14 = (void *)MEMORY[0x1D9439FF0](v23);
    int v15 = [(ENDaemon *)self sharingClient];

    if (v15)
    {
      long long v16 = [(ENDaemon *)self sharingClient];
      [v16 invalidate];

      [(ENDaemon *)self setSharingClient:0];
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F9F680]);
    [(ENDaemon *)self setSharingClient:v17];

    uint64_t v18 = [(ENDaemon *)self sharingClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_2;
    v20[3] = &unk_1E69AD108;
    v20[4] = self;
    uint64_t v21 = v13;
    uint64_t v22 = v14;
    [v18 startProxCardTransactionWithOptions:0 completion:v20];
  }
}

void __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) buddyAlertHandle];
  int v3 = [v2 isValid];

  if (v3)
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v13 = ENErrorF();
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      uint64_t v17 = v13;
      uint64_t v14 = (*(uint64_t (**)(void))(v14 + 16))();
      uint64_t v13 = v17;
    }
    MEMORY[0x1F41817F8](v14, v13);
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB8]) initWithServiceName:@"com.apple.HealthENBuddy" viewControllerClassName:@"HealthENBuddy.HealthENBuddyContainer"];
    id v5 = objc_alloc_init(MEMORY[0x1E4FA6BA8]);
    uint64_t v18 = @"regionCountryCode";
    unsigned int v6 = [*(id *)(a1 + 40) countryCode];
    v19[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = [*(id *)(a1 + 40) subdivisionCode];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) subdivisionCode];
      [v8 setObject:v10 forKeyedSubscript:@"regionSubdivisionCode"];
    }
    [v5 setUserInfo:v8];
    uint64_t v11 = (void *)[MEMORY[0x1E4FA6BC0] newHandleWithDefinition:v4 configurationContext:v5];
    [*(id *)(a1 + 32) setBuddyAlertHandle:v11];

    uint64_t v12 = *(void *)(a1 + 56);
    if (v12 && ((*(uint64_t (**)(void))(v12 + 16))() & 1) == 0)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [*(id *)(a1 + 32) tearDownAlertHandle];
    }
    else
    {
      if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      int v15 = [*(id *)(a1 + 32) buddyAlertHandle];
      [v15 addObserver:*(void *)(a1 + 32)];

      long long v16 = [*(id *)(a1 + 32) buddyAlertHandle];
      [v16 activateWithContext:0];
    }
  }
}

void __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_2(void *a1, char a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    int v3 = [MEMORY[0x1E4F629D8] serviceWithDefaultShellEndpoint];
    id v4 = (void *)MEMORY[0x1E4F629D0];
    uint64_t v16 = *MEMORY[0x1E4F62600];
    v17[0] = MEMORY[0x1E4F1CC40];
    id v5 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    unsigned int v6 = [v4 optionsWithDictionary:v5];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_3;
    v13[3] = &unk_1E69AD0E0;
    uint64_t v7 = (void *)a1[5];
    void v13[4] = a1[4];
    id v8 = v7;
    uint64_t v9 = a1[6];
    id v14 = v8;
    uint64_t v15 = v9;
    [v3 openApplication:@"com.apple.HealthENBuddy" withOptions:v6 completion:v13];
  }
  else
  {
    if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v10 = ENErrorF();
    uint64_t v11 = a1[5];
    if (v11)
    {
      uint64_t v12 = v10;
      uint64_t v11 = (*(uint64_t (**)(void))(v11 + 16))();
      uint64_t v10 = v12;
    }
    MEMORY[0x1F41817F8](v11, v10);
  }
}

void __65__ENDaemon_presentBuddyForRegion_errorHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v7 = v5;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "tearDownAlertHandle", v7);
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    }
  }
  else
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)tearDownAlertHandle
{
  int v3 = [(ENDaemon *)self buddyAlertHandle];
  [v3 removeObserver:self];

  id v4 = [(ENDaemon *)self buddyAlertHandle];
  [v4 invalidate];

  [(ENDaemon *)self setBuddyAlertHandle:0];
  id v5 = [(ENDaemon *)self sharingClient];
  [v5 invalidate];

  [(ENDaemon *)self setSharingClient:0];
}

- (void)postENOffNotification
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F445A8]);
  int v3 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_OFF_TITLE" arguments:0];
  [v8 setTitle:v3];

  id v4 = [MEMORY[0x1E4F29020] localizedUserNotificationStringForKey:@"EN_OFF_BODY" arguments:0];
  [v8 setBody:v4];

  id v5 = [MEMORY[0x1E4F44648] defaultSound];
  [v8 setSound:v5];

  [v8 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.endaemon"];
  [v8 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.off"];
  uint64_t v6 = [MEMORY[0x1E4F1CB08] URLWithString:@"prefs:root=EXPOSURE_NOTIFICATION"];
  [v8 setDefaultActionURL:v6];

  id v7 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.off" content:v8 trigger:0 destinations:7];
  [(ENDaemon *)self _postUserNotificationWithRequest:v7 authorizationFailureHandler:0];
}

- (void)postExposureNotification:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 region];
  if (v5)
  {
    uint64_t v6 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v7 = [v6 agencyConfigurationForRegion:v5];

    id v8 = [v7 agencyDisplayName];
    uint64_t v9 = (void *)MEMORY[0x1E4F29020];
    uint64_t v10 = [v5 regionCode];
    uint64_t v11 = [v9 stringWithFormat:@"prefs:root=EXPOSURE_NOTIFICATION&path=EXPOSURE/LATEST/%@", v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F445A8]);
    uint64_t v13 = [v4 classification];
    id v14 = v13;
    if (v13)
    {
      uint64_t v22 = @"classificationIndex";
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedChar:", objc_msgSend(v13, "index"));
      v23[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      [v12 setUserInfo:v16];
    }
    [v12 setTitle:v8];
    uint64_t v17 = [v4 localizedSubjectText];
    [v12 setSubtitle:v17];

    uint64_t v18 = [v4 localizedBodyText];
    [v12 setBody:v18];

    uint64_t v19 = [MEMORY[0x1E4F44648] defaultSound];
    [v12 setSound:v19];

    [v12 setThreadIdentifier:@"com.apple.ExposureNotification.UserNotification.cobranded"];
    [v12 setCategoryIdentifier:@"com.apple.ExposureNotification.UserNotification.exposure"];
    dispatch_time_t v20 = [MEMORY[0x1E4F1CB08] URLWithString:v11];
    [v12 setDefaultActionURL:v20];

    [v12 setShouldBackgroundDefaultAction:1];
    [v12 setInterruptionLevel:2];
    uint64_t v21 = [MEMORY[0x1E4F44620] requestWithIdentifier:@"com.apple.ExposureNotification.exposure" content:v12 trigger:0 destinations:7];
    [(ENDaemon *)self _postUserNotificationWithRequest:v21 authorizationFailureHandler:0];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_postUserNotificationWithRequest:(id)a3 authorizationFailureHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENDaemon *)self userNotificationCenter];
  uint64_t v9 = [v6 content];
  id v32 = [v9 categoryIdentifier];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v10 = [v8 deliveredNotifications];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v11) {
    goto LABEL_12;
  }
  uint64_t v12 = v11;
  id v28 = v7;
  id v29 = v6;
  id v30 = self;
  uint64_t v31 = v8;
  char v33 = 0;
  uint64_t v13 = *(void *)v38;
  char v14 = 1;
  uint64_t v15 = @"com.apple.ExposureNotification.UserNotification";
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v38 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "request", v28, v29, v30, v31);
      uint64_t v18 = [v17 identifier];
      int v19 = [v18 isEqualToString:v15];

      if (v19)
      {
        dispatch_time_t v20 = [v17 content];
        uint64_t v21 = [v20 categoryIdentifier];
        uint64_t v22 = v15;
        uint64_t v23 = v10;
        char v24 = [v21 isEqualToString:v32];

        v14 &= v24;
        v33 |= v24;
        uint64_t v10 = v23;
        uint64_t v15 = v22;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  }
  while (v12);

  char v25 = v33 & v14;
  self = v30;
  id v8 = v31;
  id v7 = v28;
  id v6 = v29;
  if (v25)
  {
    uint64_t v41 = v15;
    uint64_t v10 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v41 count:1];
    [v31 removeDeliveredNotificationsWithIdentifiers:v10];
LABEL_12:
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke;
  v34[3] = &unk_1E69AD180;
  v34[4] = self;
  v34[5] = v8;
  id v35 = v6;
  id v36 = v7;
  id v26 = v6;
  id v27 = v7;
  [v8 requestAuthorizationWithOptions:18 completionHandler:v34];
}

void __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 224);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_2;
  block[3] = &unk_1E69AD158;
  char v16 = a2;
  id v12 = v5;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

void __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    int v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_3;
    v6[3] = &unk_1E69AD130;
    id v7 = v2;
    [v3 addNotificationRequest:v7 withCompletionHandler:v6];
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

uint64_t __73__ENDaemon__postUserNotificationWithRequest_authorizationFailureHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      id v8 = v3;
      if (gLogCategory__ENDaemon != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v8, v3))
      {
        id v5 = [*(id *)(a1 + 32) content];
        id v7 = [v5 threadIdentifier];
        LogPrintF_safe();

        id v4 = v8;
      }
    }
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v8 = a4;
  id v9 = a5;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v65[3] = &unk_1E69AD1A8;
  id v58 = v9;
  id v66 = v58;
  id v10 = (void (**)(void))MEMORY[0x1D9439FF0](v65);
  uint64_t v11 = [v8 notification];
  id v12 = [v11 request];
  uint64_t v13 = [v12 content];
  id v14 = [v13 categoryIdentifier];

  id v15 = [v8 notification];
  char v16 = [v15 request];
  uint64_t v17 = [v16 content];
  v62 = [v17 userInfo];

  uint64_t v18 = [v8 actionIdentifier];
  uint64_t v19 = [v18 isEqualToString:*MEMORY[0x1E4F446C8]];

  BOOL v60 = [MEMORY[0x1E4F223D8] defaultWorkspace];
  uint64_t v20 = *MEMORY[0x1E4F626A8];
  v67[0] = *MEMORY[0x1E4F62690];
  v67[1] = v20;
  v68[0] = MEMORY[0x1E4F1CC40];
  v68[1] = MEMORY[0x1E4F1CC40];
  uint64_t v59 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v68 forKeys:v67 count:2];
  if ([v14 isEqualToString:@"com.apple.ExposureNotification.UserNotification.summary"])
  {
    CFStringGetTypeID();
    v61 = CFDictionaryGetTypedValue();
    activeEntity = self->_activeEntity;
    if (activeEntity)
    {
      uint64_t v22 = [(ENActiveEntity *)activeEntity entity];
      uint64_t v23 = [v22 bundleIdentifier];

      uint64_t Int64 = CFDictionaryGetInt64();
      char v25 = [(ENActiveEntity *)self->_activeEntity entity];
      id v26 = [v25 region];
      id v27 = [v26 regionCode];

      if ([v61 isEqualToString:v27])
      {
        if (!Int64)
        {
          id v32 = objc_alloc_init(MEMORY[0x1E4F22498]);
          [v32 setFrontBoardOptions:v59];
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
          v64[3] = &unk_1E69AD1D0;
          v64[4] = v23;
          [v60 openApplicationWithBundleIdentifier:v23 configuration:v32 completionHandler:v64];
          goto LABEL_100;
        }
        if (v19)
        {
          if (v23 && [v23 length])
          {
            [(ENDaemon *)self appLaunchWithBundleID:v23 activity:8 shouldEnterForeground:1 requiredRuntimeInSeconds:0];
            goto LABEL_101;
          }
          [MEMORY[0x1E4F29020] stringWithFormat:@"prefs:root=EXPOSURE_NOTIFICATION&path=KEY-RELEASED"];
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          id v36 = [MEMORY[0x1E4F1CB08] URLWithString:v32];
          if (v36)
          {
            long long v37 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v38 = [v37 isSensitiveLoggingAllowed];

            if (v38
              && gLogCategory_ENDaemon <= 30
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
              objc_msgSend(v60, "openSensitiveURL:withOptions:", v36, v59, v32);
            }
            else
            {
              objc_msgSend(v60, "openSensitiveURL:withOptions:", v36, v59, v54);
            }
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }

LABEL_100:
        }
LABEL_101:

        goto LABEL_102;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_101;
      }
LABEL_25:
      LogPrintF_safe();
      goto LABEL_101;
    }
    if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
      goto LABEL_103;
    }
    goto LABEL_107;
  }
  if ([v14 isEqualToString:@"com.apple.ExposureNotification.UserNotification.preArm"])
  {
    if (v19)
    {
      CFStringGetTypeID();
      v61 = CFDictionaryGetTypedValue();
      if (!self->_activeEntity)
      {
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_103;
        }
        goto LABEL_107;
      }
      uint64_t v28 = CFDictionaryGetInt64();
      id v29 = [(ENActiveEntity *)self->_activeEntity entity];
      uint64_t v23 = [v29 bundleIdentifier];

      if (v23 && [v23 length])
      {
        [(ENDaemon *)self appLaunchWithBundleID:v23 activity:8 shouldEnterForeground:1 requiredRuntimeInSeconds:0];
        goto LABEL_102;
      }
      if (v28)
      {
        [MEMORY[0x1E4F29020] stringWithFormat:@"prefs:root=EXPOSURE_NOTIFICATION&path=KEY-RELEASED"];
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v32 = [MEMORY[0x1E4F1CB08] URLWithString:v27];
        if (v32)
        {
          char v33 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v34 = [v33 isSensitiveLoggingAllowed];

          if (v34
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(v60, "openSensitiveURL:withOptions:", v32, v59, v27);
            goto LABEL_100;
          }
LABEL_99:
          objc_msgSend(v60, "openSensitiveURL:withOptions:", v32, v59, v54);
          goto LABEL_100;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_100;
        }
      }
      else
      {
        [MEMORY[0x1E4F29020] stringWithFormat:@"prefs:root=EXPOSURE_NOTIFICATION"];
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v32 = [MEMORY[0x1E4F1CB08] URLWithString:v27];
        if (v32)
        {
          long long v39 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v40 = [v39 isSensitiveLoggingAllowed];

          if (v40
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(v60, "openSensitiveURL:withOptions:", v32, v59, v32);
            goto LABEL_100;
          }
          goto LABEL_99;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_100;
        }
      }
      LogPrintF_safe();
      goto LABEL_100;
    }
  }
  else if ([v14 isEqualToString:@"com.apple.ExposureNotification.UserNotification.onboarding"])
  {
    if (v19)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      CFStringGetTypeID();
      v61 = CFDictionaryGetTypedValue();
      if (v61)
      {
        uint64_t v41 = [(ENDaemon *)self onboardingManager];
        [v41 setPendingBuddyOnboarding:0];

        uint64_t v23 = [MEMORY[0x1E4F29020] stringWithFormat:@"prefs:root=EXPOSURE_NOTIFICATION&path=ONBOARDING/%@", v61];
        id v27 = [MEMORY[0x1E4F1CB08] URLWithString:v23];
        if (v27)
        {
          uint64_t v42 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v43 = [v42 isSensitiveLoggingAllowed];

          if (v43
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v55 = v23;
            LogPrintF_safe();
          }
          objc_msgSend(v60, "openSensitiveURL:withOptions:", v27, v59, v55);
          CFPrefs_SetValue();
          goto LABEL_101;
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_101;
        }
        goto LABEL_25;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_103;
      }
LABEL_107:
      LogPrintF_safe();
      goto LABEL_103;
    }
    id v35 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];

    if (v35)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      v61 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
      if (!v61) {
        goto LABEL_103;
      }
      id v44 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      uint64_t v23 = [v44 configurationForRegion:v61];

      if (!v23)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_102;
      }
      uint64_t v45 = [v23 userConsent];
      BOOL v46 = [v45 consent] == 2;

      if (!v46)
      {
        id v47 = [v23 userConsent];
        [v47 setConsent:3];

        uint64_t v48 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
        id v63 = 0;
        char v49 = [v48 saveRegionConfiguration:v23 error:&v63];
        id v27 = v63;

        if (v49)
        {
          uint64_t v50 = [(ENDaemon *)self activeEntity];
          uint64_t v51 = [v50 entity];
          int v52 = [v51 region];
          int v56 = [v61 isEqual:v52];

          if (v56)
          {
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            [(ENDaemon *)self _turnOffEN];
          }
          [(ENDaemon *)self onboardingTriggerDeactivate];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
        goto LABEL_101;
      }
LABEL_102:

      goto LABEL_103;
    }
  }
  else
  {
    if ([v14 isEqualToString:@"com.apple.ExposureNotification.UserNotification.exposure"])
    {
      CFStringGetTypeID();
      v61 = CFDictionaryGetTypedValue();
      id v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v31 = [v30 isSensitiveLoggingAllowed];

      if (v31
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      if (!v61)
      {
        id v53 = NSDictionaryGetNSNumber();
        uint64_t v23 = v53;
        if (v53) {
          -[ENDifferentialPrivacyManager reportUserExposureNotificationTapped:classificationIndex:](self->_differentialPrivacyManager, "reportUserExposureNotificationTapped:classificationIndex:", v19, [v53 unsignedCharValue]);
        }
        goto LABEL_102;
      }
      if (!v19)
      {
LABEL_103:

        goto LABEL_104;
      }
      uint64_t v23 = [MEMORY[0x1E4F1CB08] URLWithString:@"prefs:root=EXPOSURE_NOTIFICATION"];
      [v60 openSensitiveURL:v23 withOptions:v59];
      id v27 = [MEMORY[0x1E4F1CB08] URLWithString:v61];
      [v60 openURL:v27 withOptions:v59];
      goto LABEL_101;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
LABEL_104:

  v10[2](v10);
}

uint64_t __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__ENDaemon_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_ENDaemon <= 30)
  {
    id v6 = v3;
    if (gLogCategory_ENDaemon != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v6, v3))
    {
      id v3 = (id)LogPrintF_safe();
      id v4 = v6;
    }
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_ENDaemon <= 40)
  {
    id v5 = v3;
    if (gLogCategory_ENDaemon != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v5, v3))
    {
      id v3 = (id)LogPrintF_safe();
      id v4 = v5;
    }
  }

  MEMORY[0x1F41817F8](v3, v4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  [(ENDaemon *)self _deferConsentForPendingRegion];
  [(ENDaemon *)self tearDownAlertHandle];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v10 = a4;
  id v5 = [v10 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4FA7178]];

  if (v6)
  {
    uint64_t v7 = [v10 code];
    int v8 = gLogCategory_ENDaemon;
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        id v9 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithInteger:", objc_msgSend(v10, "code"));
        LogPrintF_safe();
      }
      goto LABEL_13;
    }
  }
  else
  {
    int v8 = gLogCategory_ENDaemon;
  }
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v10;
    LogPrintF_safe();
  }
LABEL_13:
  [(ENDaemon *)self _deferConsentForPendingRegion];
  [(ENDaemon *)self tearDownAlertHandle];
}

- (void)_deferConsentForPendingRegion
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
  if (v3)
  {
    id v4 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v5 = [v4 configurationForRegion:v3];

    if (v5)
    {
      int v6 = [v5 userConsent];
      uint64_t v7 = [v6 consent];

      if (!v7)
      {
        if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        int v8 = [v5 userConsent];
        [v8 setConsent:3];

        id v9 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
        id v20 = 0;
        char v10 = [v9 saveRegionConfiguration:v5 error:&v20];
        id v11 = v20;

        if (v10)
        {
          id v12 = [(ENDaemon *)self activeEntity];
          uint64_t v13 = [v12 entity];
          id v14 = [v13 region];
          int v15 = [v3 isEqual:v14];

          if (v15)
          {
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            [(ENDaemon *)self _turnOffEN];
          }
          char v16 = [(ENDaemon *)self userNotificationCenter];
          v21[0] = @"com.apple.ExposureNotification.onboarding";
          uint64_t v17 = [MEMORY[0x1E4F1C970] arrayWithObjects:v21 count:1];
          [v16 removeDeliveredNotificationsWithIdentifiers:v17];

          uint64_t v18 = [(ENDaemon *)self onboardingManager];
          [v18 setShouldObserveDeviceUnlocks:0];

          uint64_t v19 = [(ENDaemon *)self onboardingManager];
          [v19 setPendingBuddyOnboarding:0];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)_enApplicationDidInstall:(id)a3
{
  id v11 = a3;
  id v4 = [v11 bundleIdentifier];
  if (v4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      char v10 = v4;
      LogPrintF_safe();
    }
    id v5 = objc_msgSend(v11, "bundleURL", v10);
    if (v5)
    {
      int v6 = [MEMORY[0x1E4F28B58] bundleWithURL:v5];
      uint64_t v7 = v6;
      if (v6
        && ([v6 infoDictionary], int v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
      {
        id v9 = [v7 infoDictionary];
        [(ENDaemon *)self fetchServerConfigurationForAppBundleIdentifier:v4 infoDictionary:v9];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ENDaemon_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__ENDaemon_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "appState", (void)v12);
        char v9 = [v8 isPlaceholder];

        if ((v9 & 1) == 0)
        {
          char v10 = [v7 entitlementValueForKey:@"com.apple.developer.exposure-notification" ofClass:objc_opt_class()];
          int v11 = [v10 BOOLValueSafe];

          if (v11) {
            [*(id *)(a1 + 40) _enApplicationDidInstall:v7];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)_enApplicationDidUninstall:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 bundleIdentifier];
  if (v4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      char v9 = v4;
      LogPrintF_safe();
    }
    uint64_t v5 = [(ENActiveEntity *)self->_activeEntity entity];
    id v6 = [v5 bundleIdentifier];
    if ([v6 length])
    {
      uint64_t v7 = [(ENActiveEntity *)self->_activeEntity entity];
      id v8 = [v7 bundleIdentifier];
    }
    else
    {
      id v8 = 0;
    }

    if ([v8 length]
      && [v4 length]
      && [v4 isEqualToString:v8])
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [(ENDaemon *)self updateExistingConsentForPhase1ActiveRegion:0];
      [(ENDaemon *)self _turnOffEN];
      [(ENDaemon *)self postENOffNotification];
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ENDaemon_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __37__ENDaemon_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "entitlementValueForKey:ofClass:", @"com.apple.developer.exposure-notification", objc_opt_class(), (void)v10);
        int v9 = [v8 BOOLValueSafe];

        if (v9) {
          [*(id *)(a1 + 40) _enApplicationDidUninstall:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __42__ENDaemon__bluetoothMonitorEnsureStarted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bluetoothPowerStateChanged];
}

- (void)_bluetoothMonitorEnsureStopped
{
  if (self->_btMonitorStarted)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stopPowerMonitoring];

    self->_btMonitorStarted = 0;
  }
}

- (void)bluetoothPowerStateChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained isBluetoothPoweredOn];

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }

  [(ENDaemon *)self _scheduleUpdate];
}

- (void)_bluetoothTracingEnsureStarted
{
  uint64_t v3 = [(ENActiveEntity *)self->_activeEntity entity];
  uint64_t v4 = [v3 bundleIdentifier];

  id WeakRetained = self->_btTracingAppID;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = @"com.apple.ENDaemon";
  }
  uint64_t v7 = v6;

  id v8 = v7;
  p_isa = &v8->isa;
  if (!WeakRetained)
  {
LABEL_13:
    id WeakRetained = (NSString *)objc_loadWeakRetained((id *)&self->_delegate);
    long long v13 = [(ENActiveEntity *)self->_activeEntity entity];
    long long v14 = [v13 region];

    uint64_t v15 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    char v16 = [v15 serverConfigurationForRegion:v14];

    if (v16) {
      [(NSString *)WeakRetained setRegionServerConfiguration:v16];
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = p_isa;
      LogPrintF_safe();
    }
    if (-[NSString startTracingWithAppBundleIdentifier:](WeakRetained, "startTracingWithAppBundleIdentifier:", p_isa, v17))
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_btTracingAppID, v6);
    }

    long long v12 = 0;
    goto LABEL_26;
  }
  int v9 = v8;
  if (v9 != WeakRetained)
  {
    long long v10 = v9;
    char v11 = [(NSString *)v9 isEqual:WeakRetained];

    if (v11) {
      goto LABEL_27;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = WeakRetained;
      uint64_t v18 = v10;
      LogPrintF_safe();
    }
    [(ENDaemon *)self _bluetoothTracingStop];

    goto LABEL_13;
  }
  long long v12 = WeakRetained;
LABEL_26:

  id WeakRetained = v12;
LABEL_27:
}

- (void)_bluetoothTracingStop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v3 = [WeakRetained stopTracing];

  if (v3 && gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (id)regionForBundleInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"ENDeveloperRegion"];
  if (!v4)
  {
    uint64_t v5 = (void *)*MEMORY[0x1E4F1D000];
    uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1D000]];

    uint64_t v4 = +[ENConfigurationManager staticRegionForBundleID:v6];
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }

    if (!v4) {
      goto LABEL_20;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F257A8] regionWithCode:v4];
  }
  else
  {
LABEL_20:
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)fetchServerConfigurationForAppBundleIdentifier:(id)a3 infoDictionary:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v8 = v9;
    LogPrintF_safe();
  }
  uint64_t v7 = -[ENDaemon regionForBundleInfo:](self, "regionForBundleInfo:", v6, v8);
  if (v7)
  {
    [(ENDaemon *)self startServerConfigurationFetchForRegion:v7];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)startServerConfigurationFetchForRegion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ENDaemon_startServerConfigurationFetchForRegion___block_invoke;
  v6[3] = &unk_1E69AD220;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ENDaemon *)self fetchServerConfigurationForRegion:v5 completion:v6];
}

void __51__ENDaemon_startServerConfigurationFetchForRegion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [*(id *)(a1 + 32) configurationManager];
  id v5 = [v4 configurationStore];
  id v6 = [v5 configurationForRegion:*(void *)(a1 + 40)];

  if (v6)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 32), "_exposureNotificationRegionConfigurationChanged:", v6, v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_exposureNotificationRegionConfigurationChanged:", v6, v7);
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)fetchServerConfigurationForRegion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  id v9 = [v8 serverConfigurationForRegion:v6];

  if (v9)
  {
    long long v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v11 = [v10 isSensitiveLoggingAllowed];

    if (v11 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      [v9 enVersion];
      [v9 enEnabled];
      LogPrintF_safe();
    }
    v7[2](v7, v9, 0);
  }
  else
  {
    configurationManager = self->_configurationManager;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke;
    v13[3] = &unk_1E69AD270;
    void v13[4] = self;
    id v14 = v6;
    uint64_t v15 = v7;
    [(ENConfigurationManager *)configurationManager fetchServerConfigurationsForRegion:v14 userInitiated:0 withCompletion:v13];
  }
}

void __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 224);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke_2;
  v8[3] = &unk_1E69AD248;
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __57__ENDaemon_fetchServerConfigurationForRegion_completion___block_invoke_2(uint64_t a1)
{
  id v7 = *(id *)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 264) configurationStore];
  id v3 = [v2 serverConfigurationForRegion:*(void *)(a1 + 48)];

  if (v3)
  {
    id v4 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v5 = [v4 isSensitiveLoggingAllowed];

    if (v5 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      [v3 enVersion];
      [v3 enEnabled];
LABEL_9:
      LogPrintF_safe();
    }
  }
  else if (*(void *)(a1 + 32))
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      goto LABEL_9;
    }
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v6 = NSErrorF();

    id v7 = (id)v6;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3, v7);
}

- (void)configurationManager:(id)a3 exposureNotificationRegionConfigurationChanged:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__ENDaemon_configurationManager_exposureNotificationRegionConfigurationChanged___block_invoke;
  v8[3] = &unk_1E69ACBE0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __80__ENDaemon_configurationManager_exposureNotificationRegionConfigurationChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exposureNotificationRegionConfigurationChanged:*(void *)(a1 + 40)];
}

- (void)configurationManager:(id)a3 errorDetected:(unsigned int)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ENDaemon_configurationManager_errorDetected___block_invoke;
  v5[3] = &unk_1E69AD298;
  v5[4] = self;
  unsigned int v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

void __47__ENDaemon_configurationManager_errorDetected___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained sendErrorMetricWithType:*(unsigned int *)(a1 + 40)];
}

- (void)_exposureNotificationRegionConfigurationChanged:(id)a3
{
  id v5 = a3;
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __60__ENDaemon__exposureNotificationRegionConfigurationChanged___block_invoke;
  v97[3] = &unk_1E69ACA50;
  v97[4] = self;
  unsigned int v6 = (void (**)(void))MEMORY[0x1D9439FF0](v97);
  double v94 = [(ENDaemon *)self activeEntity];
  id v7 = [(ENDaemon *)self configurationManager];
  uint64_t v8 = [v7 configurationStore];

  id v9 = [v5 region];
  uint64_t v10 = [v8 serverConfigurationForRegion:v9];

  double v93 = v10;
  unsigned int v11 = [v10 enEnabled];
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    uint64_t v82 = v11;
    v79 = id v83 = v5;
    char v81 = v94;
    LogPrintF_safe();
  }
  if (v11)
  {
    uint64_t v92 = [v5 region];
    [(ENDaemon *)self _updatePhase1ConfigurationIfNeeded:v5];
    if ([v5 enVersion] != 2)
    {
LABEL_108:
      uint64_t v23 = (ENActiveEntity *)v92;
      goto LABEL_109;
    }
    id v12 = [v5 userConsent];
    unint64_t v13 = [v12 consent];

    id v14 = [v5 userConsent];
    unint64_t v15 = [v14 differentialPrivacyConsent];

    char v16 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v17 = [v16 isSensitiveLoggingAllowed];

    if (v17 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v13 > 4) {
        uint64_t v18 = "?";
      }
      else {
        uint64_t v18 = off_1E69ADB50[v13];
      }
      if (v15 > 4) {
        char v24 = "?";
      }
      else {
        char v24 = off_1E69ADB50[v15];
      }
      long long v79 = (void *)v18;
      char v81 = v24;
      LogPrintF_safe();
    }
    if (v13 == 2)
    {
      char v25 = (void *)MEMORY[0x1E4F1C9C0];
      [v5 creationDateTimeInterval];
      objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      CFPrefs_GetDouble();
      if (v26 <= 0.0) {
        double v27 = 2592000.0;
      }
      else {
        double v27 = v26;
      }
      uint64_t v28 = objc_msgSend(v5, "userConsent", v79, v81, v82, v83);
      uint64_t v29 = [v28 differentialPrivacyConsent];

      if ([v93 telemetryAuthorization])
      {
        id v30 = [v94 entity];
        int v31 = [v30 region];
        char v32 = [v31 isEqual:v92];

        if ((v32 & 1) == 0) {
          goto LABEL_107;
        }
        char v33 = [MEMORY[0x1E4F1C9C0] date];
        [v33 timeIntervalSinceDate:v89];
        double v35 = v34;

        if (v35 <= v27 || (v29 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
          goto LABEL_107;
        }
        id v36 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v37 = [v36 isSensitiveLoggingAllowed];

        if (v37
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        uint64_t v54 = [v5 userConsent];
        [v54 setDifferentialPrivacyConsent:3];

        if ([v8 saveRegionConfiguration:v5 error:0]) {
          [(ENDaemon *)self postAnalyticsOptInNotificationForRegion:v92];
        }
      }
      else
      {
        uint64_t v48 = [v5 userConsent];
        [v48 setDifferentialPrivacyConsent:4];

        id v96 = 0;
        char v49 = [v8 saveRegionConfiguration:v5 error:&v96];
        id v50 = v96;
        if ((v49 & 1) == 0
          && gLogCategory__ENDaemon <= 90
          && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      if (!v94)
      {
LABEL_107:

        goto LABEL_108;
      }
      v55 = [v94 entity];
      int v56 = [v55 region];
      id v57 = [v8 agencyConfigurationForRegion:v56];

      uint64_t v58 = [v57 agencyColor];
      uint64_t v59 = [v57 agencyHeaderStyle];
      BOOL v90 = [v57 agencyHeaderTextColor];
      uint64_t v88 = [v57 agencyDisplayName];
      v87 = [v57 agencyImageURL];
      v91 = v57;
      BOOL v60 = [v57 localizedConfiguration];
      v86 = [v60 regionName];
      uint64_t v85 = (void *)v58;

      v61 = [v57 localizedConfiguration];
      id v84 = [v61 agencyTurndownMessage];

      id v62 = objc_alloc(MEMORY[0x1E4F25728]);
      id v63 = [v94 entity];
      uint64_t v64 = [v63 bundleIdentifier];
      BOOL v65 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInteger:v59];
      id v66 = [v94 entity];
      v67 = [v66 region];
      long long v68 = (void *)[v62 initWithBundleID:v64 agencyColor:v85 agencyHeaderStyle:v65 agencyHeaderTextColor:v90 localizedAgencyName:v88 localizedAgencyImageURL:v87 localizedAgencyTurndownMessage:v84 localizedRegionName:v86 region:v67];

      long long v69 = [v94 entity];
      id v70 = v68;
      id v71 = v69;
      if (v70 == v71)
      {
      }
      else
      {
        int v72 = v71;
        if ((v70 == 0) != (v71 != 0))
        {
          char v73 = [v70 isEqual:v71];

          if (v73) {
            goto LABEL_67;
          }
        }
        else
        {
        }
        [(ENActiveEntity *)self->_activeEntity setEntity:v70];
        [(ENDaemon *)self _writePreferenceActiveEntity:self->_activeEntity];
      }
LABEL_67:

      uint64_t v41 = v85;
LABEL_68:

      goto LABEL_104;
    }
    regionMonitor = self->_regionMonitor;
    id v95 = 0;
    long long v39 = [(ENRegionMonitor *)regionMonitor getCurrentRegionVisitWithError:&v95];
    id v89 = v95;
    v91 = [v39 region];

    if (v91)
    {
      if ([v91 isEqual:v92])
      {
        int v40 = [v8 serverConfigurationForRegion:v92];
        uint64_t v41 = [v40 appBundleID];

        if (v41 && [v41 length])
        {
          BOOL v90 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v41 placeholder:0];
          uint64_t v42 = [v90 appState];
          if ([v42 isInstalled])
          {

            goto LABEL_38;
          }
          int v43 = [v90 appState];
          int v44 = [v43 isPlaceholder];

          if (v44)
          {
LABEL_38:
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            goto LABEL_104;
          }
          if ([(ENActiveEntity *)self->_activeEntity activeStatus] == 2)
          {
            uint64_t v51 = [(ENActiveEntity *)self->_activeEntity entity];
            int v52 = [v51 region];
            int v53 = [v91 isEqual:v52];

            if (v53)
            {
              if (gLogCategory__ENDaemon > 90
                || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
              {
                goto LABEL_104;
              }
              uint64_t v88 = [(ENActiveEntity *)self->_activeEntity entity];
              v87 = [v88 bundleIdentifier];
              LogPrintF_safe();
              goto LABEL_68;
            }
          }
        }
        else if ([(ENActiveEntity *)self->_activeEntity activeStatus] >= 1 {
               && [(ENActiveEntity *)self->_activeEntity activeStatus] <= 2)
        }
        {
          uint64_t v45 = [(ENActiveEntity *)self->_activeEntity entity];
          BOOL v46 = [v45 region];
          int v47 = [v46 isEqual:v91];

          if (v47)
          {
            [(ENDaemon *)self updateExistingConsentForPhase1ActiveRegion:0];
            CFPrefs_RemoveValue();
            self->_availabilityAlertDisabled = 0;
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            unint64_t v13 = 0;
          }
        }
        if (self->_availabilityAlertDisabled)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          goto LABEL_105;
        }
        BOOL v90 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
        int v74 = [v90 isEqual:v92];
        if (v13 == 1) {
          int v75 = 1;
        }
        else {
          int v75 = v74;
        }
        if (v75 == 1)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            if (v13 > 4) {
              long long v76 = "?";
            }
            else {
              long long v76 = off_1E69ADB78[v13];
            }
            char v81 = v76;
            long long v79 = (void *)v92;
            LogPrintF_safe();
          }
          long long v77 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v78 = [v77 isSensitiveLoggingAllowed];

          if (v78
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            long long v80 = v91;
            LogPrintF_safe();
          }
          -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v91, v80);
          [(ENDaemon *)self onboardingTriggerRetry:0];
        }
        else if (v13 == 3)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v91, v92);
          }
          else
          {
            -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v91, v79);
          }
        }
        else if (!v13)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            long long v79 = (void *)v92;
            LogPrintF_safe();
          }
          -[ENDaemon startAvailabilityAlertCycleWithBuddy:](self, "startAvailabilityAlertCycleWithBuddy:", 1, v79);
        }
LABEL_104:

LABEL_105:
LABEL_106:

        goto LABEL_107;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_106;
      }
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_106;
    }
    LogPrintF_safe();
    goto LABEL_106;
  }
  uint64_t v19 = [ENActiveEntity alloc];
  id v20 = objc_alloc(MEMORY[0x1E4F25728]);
  uint64_t v21 = [v5 region];
  uint64_t v22 = (void *)[v20 initWithBundleID:0 region:v21];
  uint64_t v23 = [(ENActiveEntity *)v19 initWithEntity:v22 activeStatus:1];

  [(ENDaemon *)self _writePreferenceActiveEntity:v23];
LABEL_109:

  v6[2](v6);
}

uint64_t __60__ENDaemon__exposureNotificationRegionConfigurationChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefsChanged];
}

- (void)_updatePhase1ConfigurationIfNeeded:(id)a3
{
  id v5 = self->_activeEntity;
  id v6 = a3;
  id v7 = [(ENDaemon *)self configurationManager];
  uint64_t v8 = [v7 configurationStore];

  id v9 = [v6 region];
  uint64_t v10 = [v8 serverConfigurationForRegion:v9];
  unsigned int v11 = [v10 appBundleID];

  uint64_t v12 = [v6 enVersion];
  if ((v12 == 1 || -[ENActiveEntity activeStatus](v5, "activeStatus") == 2) && [v11 length])
  {
    unint64_t v13 = [(ENActiveEntity *)self->_activeEntity entity];
    id v14 = [v13 bundleIdentifier];

    if (![v14 length] || !objc_msgSend(v14, "isEqualToString:", v11)) {
      goto LABEL_27;
    }
    unint64_t v15 = [(ENActiveEntity *)self->_activeEntity entity];
    char v16 = [v15 region];
    if ([v16 isEqual:v9])
    {
      int v17 = [(ENActiveEntity *)self->_activeEntity activeStatus];

      if (v17 != 1) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    uint64_t v18 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v11 placeholder:0];
    if (!v18)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_27;
    }
    uint64_t v19 = v18;
    id v20 = [v18 bundleIdentifier];
    if (v20)
    {
      if ([(ENDaemon *)self tccAccessForBundleID:v20] == 1)
      {
        uint64_t v21 = [(ENDaemon *)self _getInfoDictFromAppProxy:v19];
        if (v21)
        {
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          double v34 = v20;
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            uint64_t v22 = [(ENActiveEntity *)self->_activeEntity entity];
            uint64_t v23 = [v22 region];
            char v24 = (void *)v23;
            char v25 = @"<>";
            if (v23) {
              char v25 = (__CFString *)v23;
            }
            char v32 = v9;
            char v33 = v25;
            int v31 = v14;
            LogPrintF_safe();
          }
          double v26 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v27 = [v26 isSensitiveLoggingAllowed];

          if (v27
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          uint64_t v28 = [ENActiveEntity alloc];
          uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v11 region:v9];
          id v30 = [(ENActiveEntity *)v28 initWithEntity:v29 activeStatus:2];

          [(ENDaemon *)self _writePreferenceActiveEntity:v30];
          goto LABEL_26;
        }
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }

LABEL_49:
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_49;
    }
    LogPrintF_safe();
    goto LABEL_49;
  }
LABEL_28:
}

- (int64_t)tccAccessForBundleID:(id)a3
{
  CFArrayRef v3 = (const __CFArray *)TCCAccessCopyInformationForBundleId();
  if (!v3) {
    return 0;
  }
  CFArrayRef v4 = v3;
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1) {
    goto LABEL_12;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  uint64_t v8 = (const void **)MEMORY[0x1E4FA99F8];
  id v9 = (CFTypeRef *)MEMORY[0x1E4FA9A58];
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
    Value = CFDictionaryGetValue(ValueAtIndex, *v8);
    if (CFEqual(Value, *v9)) {
      break;
    }
    if (v6 == ++v7) {
      goto LABEL_12;
    }
  }
  CFBooleanRef v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4FA99F0]);
  if (v13)
  {
    if (CFBooleanGetValue(v13)) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = 2;
    }
  }
  else
  {
LABEL_12:
    int64_t v12 = 0;
  }
  CFRelease(v4);
  return v12;
}

- (void)configurationManager:(id)a3 exposureNotificationRegionConfigurationRemovedForRegion:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__ENDaemon_configurationManager_exposureNotificationRegionConfigurationRemovedForRegion___block_invoke;
  v8[3] = &unk_1E69ACBE0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __89__ENDaemon_configurationManager_exposureNotificationRegionConfigurationRemovedForRegion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exposureNotificationRegionConfigurationRemoved:*(void *)(a1 + 40)];
}

- (void)_exposureNotificationRegionConfigurationRemoved:(id)a3
{
  id v46 = a3;
  id v5 = [(ENDaemon *)self activeEntity];
  if (v5)
  {
    CFIndex v6 = [(ENDaemon *)self configurationManager];
    id v7 = [v6 configurationStore];

    int64_t overallStatus = self->_overallStatus;
    id v9 = [v5 entity];
    uint64_t v10 = [v9 region];
    int v11 = [v10 isEqual:v46];

    uint64_t v12 = [v7 configurationForRegion:v46];
    CFBooleanRef v13 = (void *)v12;
    BOOL v14 = overallStatus != 4 && v12 == 0;
    if (v14) {
      int v15 = v11;
    }
    else {
      int v15 = 0;
    }
    int v45 = v15;
    char v16 = [v5 entity];
    int v17 = [v16 bundleIdentifier];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      int v44 = v11;
      uint64_t v19 = a2;
      id v20 = v7;
      uint64_t v21 = [v5 entity];
      uint64_t v22 = [v21 bundleIdentifier];

      uint64_t v23 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v22 placeholder:0];
      char v24 = [v23 entitlementValueForKey:@"com.apple.developer.exposure-notification-test" ofClass:objc_opt_class()];
      int v25 = [v24 BOOLValueSafe];

      BOOL v14 = overallStatus == 4;
      BOOL v26 = overallStatus == 4;
      if (v14 && v13)
      {
        int v27 = [v13 userConsent];
        BOOL v26 = [v27 consent] == 2;
      }
      id v7 = v20;
      a2 = v19;
      int v11 = v44;
    }
    else
    {
      if (!v13)
      {
        int v25 = 0;
        BOOL v26 = v11;
        goto LABEL_19;
      }
      uint64_t v22 = [v13 userConsent];
      int v25 = 0;
      if ([v22 consent] == 2) {
        BOOL v26 = v11;
      }
      else {
        BOOL v26 = 0;
      }
    }

LABEL_19:
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v28 = NSStringFromSelector(a2);
      uint64_t v29 = (void *)v28;
      unint64_t v30 = self->_overallStatus;
      if (v30 > 6) {
        int v31 = "?";
      }
      else {
        int v31 = off_1E69ADBA0[v30];
      }
      char v32 = "no";
      if (v26) {
        char v33 = "yes";
      }
      else {
        char v33 = "no";
      }
      if (v45) {
        double v34 = "yes";
      }
      else {
        double v34 = "no";
      }
      if (v25) {
        char v32 = "yes";
      }
      int v38 = v31;
      long long v39 = v13;
      uint64_t v36 = v28;
      activeEntity = self->_activeEntity;
      uint64_t v42 = v34;
      int v43 = v32;
      id v40 = v46;
      uint64_t v41 = v33;
      LogPrintF_safe();

      if (v26) {
        goto LABEL_25;
      }
    }
    else if (v26)
    {
LABEL_25:
      -[ENDaemon updateExistingConsentForPhase1ActiveRegion:](self, "updateExistingConsentForPhase1ActiveRegion:", 0, v36, activeEntity, v38, v39, v40, v41, v42, v43);
      [(ENDaemon *)self _turnOffEN];
LABEL_26:
      [(ENDaemon *)self postENOffNotification];
LABEL_27:

      goto LABEL_28;
    }
    if ((v45 ^ 1 | v25)) {
      goto LABEL_27;
    }
    if ((v11 ^ 1)) {
      goto LABEL_27;
    }
    CFPrefs_RemoveValue();
    int v35 = [v5 activeStatus];
    [v5 setActiveStatus:1];
    [(ENDaemon *)self _writePreferenceActiveEntity:v5];
    [(ENDaemon *)self prefsChanged];
    if (v35 < 2) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_28:
}

- (void)configurationManager:(id)a3 didResolveCurrentRegion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = v6;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(ENDaemon *)self onboardingTriggerRetry:0];
    id v6 = v7;
  }
}

- (void)_configurationManagerEnsureStopped
{
  if (self->_configurationManager)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    configurationManager = self->_configurationManager;
    self->_configurationManager = 0;
  }
}

- (void)_databasesEnsureOpened
{
  id v7 = 0;
  CFArrayRef v3 = [(ENDaemon *)self getExposureDatabaseAndReturnError:&v7];
  id v4 = v7;
  if (!v3 && gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v6 = CUPrintNSError();
    LogPrintF_safe();
  }
  if ([(CUSystemMonitor *)self->_systemMonitor systemLockState] != 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained switchToCentralAdvertisementStoreAsync];
  }
}

- (id)getExposureDatabaseAndReturnError:(id *)a3
{
  exposureDatabase = self->_exposureDatabase;
  if (!exposureDatabase)
  {
    CFStringGetTypeID();
    id v6 = (void *)CFPrefs_CopyTypedValue();
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = ENDataVaultPath();
      id v8 = [v9 stringByAppendingPathComponent:@"Exposure"];
    }
    uint64_t v10 = [ENExposureDatabase alloc];
    int v11 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v8];
    uint64_t v12 = [(ENExposureDatabase *)v10 initWithDirectoryURL:v11];
    CFBooleanRef v13 = self->_exposureDatabase;
    self->_exposureDatabase = v12;

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __46__ENDaemon_getExposureDatabaseAndReturnError___block_invoke;
    v22[3] = &unk_1E69AD2C0;
    v22[4] = self;
    [(ENExposureDatabase *)self->_exposureDatabase setErrorMetricReporter:v22];

    exposureDatabase = self->_exposureDatabase;
  }
  if ([(ENExposureDatabase *)exposureDatabase isOpen]) {
    goto LABEL_9;
  }
  BOOL v14 = self->_exposureDatabase;
  id v21 = 0;
  BOOL v15 = [(ENExposureDatabase *)v14 openWithError:&v21];
  id v16 = v21;
  int v17 = v16;
  if (v15)
  {

LABEL_9:
    uint64_t v18 = self->_exposureDatabase;
    goto LABEL_10;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v20 = CUPrintNSError();
    LogPrintF_safe();
  }
  if (a3) {
    *a3 = v17;
  }

  uint64_t v18 = 0;
LABEL_10:

  return v18;
}

void __46__ENDaemon_getExposureDatabaseAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained sendErrorMetricWithType:a2];
}

- (void)_periodicPersistencePurge
{
  if (self->_persistencePurgeScheduler)
  {
    [(ENDaemon *)self _databasesEnsureOpened];
    CFPrefs_GetDouble();
    double v4 = v3;
    int v5 = IsAppleInternalBuild();
    if (v4 <= 0.0 || v5 == 0) {
      double v4 = 1209600.0;
    }
    id v7 = [MEMORY[0x1E4F1C9C0] date];
    id v8 = [v7 dateByAddingTimeInterval:-v4];
    CFPrefs_GetDouble();
    double v10 = v9;
    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      char v24 = [(NSBackgroundActivityScheduler *)self->_persistencePurgeScheduler identifier];
      BOOL v26 = v8;
      LogPrintF_safe();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained performPeriodicAdvertisementDatabasePurgeWithDate:v8];

    id v29 = 0;
    uint64_t v12 = [(ENDaemon *)self getExposureDatabaseAndReturnError:&v29];
    id v13 = v29;
    BOOL v14 = v13;
    if (!v12
      || (id v28 = v13,
          char v15 = [v12 purgeRecordsWithInterval:v7 nowDate:&v28 error:v4],
          id v16 = v28,
          v14,
          BOOL v14 = v16,
          (v15 & 1) == 0))
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        char v24 = CUPrintNSError();
        LogPrintF_safe();
      }
    }
    regionMonitor = self->_regionMonitor;
    id v27 = v14;
    BOOL v18 = -[ENRegionMonitor purgeRegionsOlderThanDate:error:](regionMonitor, "purgeRegionsOlderThanDate:error:", v8, &v27, v24, v26);
    id v19 = v27;

    if (!v18
      && gLogCategory__ENDaemon <= 90
      && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      int v25 = CUPrintNSError();
      LogPrintF_safe();
    }
    -[ENDownloadManager purgeExpiredDownloadsWithDate:](self->_downloadManager, "purgeExpiredDownloadsWithDate:", v8, v25);
    [(ENTextMessageManager *)self->_textMessageManager purgeOldHashes];
    activeEntity = self->_activeEntity;
    if ((!activeEntity || [(ENActiveEntity *)activeEntity activeStatus] == 1) && v10 > 0.0)
    {
      [v7 timeIntervalSince1970];
      if (v21 - v10 > v4)
      {
        if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        CFDataGetTypeID();
        uint64_t v22 = (void *)CFPrefs_CopyTypedValue();
        if (v22) {
          uint64_t v23 = 3839;
        }
        else {
          uint64_t v23 = 4095;
        }
        [(ENDaemon *)self _resetDataWithFlags:v23];
      }
    }
    [(ENDaemon *)self _scheduleUpdate];
  }
}

void __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke_2;
  block[3] = &unk_1E69ACA50;
  id v2 = *(NSObject **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  double v3 = a2;
  dispatch_sync(v2, block);
  v3[2](v3, 1);
}

uint64_t __45__ENDaemon__schedulePeriodicPersistencePurge__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _periodicPersistencePurge];
}

- (id)advertisementDatabaseQuerySessionWithAttenuationThreshold:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  id v6 = [(ENDaemon *)self _getDelegateAndReturnError:a4];
  id v7 = v6;
  if (v6)
  {
    id v16 = 0;
    id v8 = [v6 createAdvertisementQuerySessionWithThreshold:v5 error:&v16];
    id v9 = v16;
    double v10 = v9;
    if (!a4 || v8) {
      goto LABEL_10;
    }
    int v11 = [v9 domain];
    if ([v11 isEqualToString:@"ENAdvertisementStoreErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 6)
      {
        id v13 = ENErrorF();
LABEL_9:
        id v14 = v13;
        *a4 = v14;

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v13 = ENNestedErrorF();
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (void)_differentialPrivacyEnsureStarted
{
  double v3 = [(ENActiveEntity *)self->_activeEntity entity];
  uint64_t v13 = [v3 region];

  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v7 = [v6 serverConfigurationForRegion:v13];

    if (v7)
    {
      id v8 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      id v9 = [v8 serverExposureConfigurationForRegion:v13];

      if (v9)
      {
        differentialPrivacyManager = self->_differentialPrivacyManager;
        if (differentialPrivacyManager)
        {
          [(ENDifferentialPrivacyManager *)differentialPrivacyManager updatedServerConfiguration:v7 serverExposureConfiguration:v9];
        }
        else
        {
          if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          int v11 = [[ENDifferentialPrivacyManager alloc] initWithServerConfiguration:v7 serverExposureConfiguration:v9];
          uint64_t v12 = self->_differentialPrivacyManager;
          self->_differentialPrivacyManager = v11;
        }
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    goto LABEL_13;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = 0, v4))
    {
      uint64_t v4 = LogPrintF_safe();
LABEL_13:
      uint64_t v5 = v13;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (unsigned)_getLatestExposureForDifferentialPrivacy
{
  id v21 = 0;
  id v2 = [(ENDaemon *)self getExposureDatabaseAndReturnError:&v21];
  id v3 = v21;
  uint64_t v4 = v3;
  if (v2)
  {
    id v20 = 0;
    id v19 = v3;
    char v5 = [v2 getValue:&v20 forKey:@"LastExposureNotification" ofClass:objc_opt_class() error:&v19];
    id v6 = v20;
    id v7 = v19;

    if (v5)
    {
      if (v6)
      {
        id v8 = [v6 classification];
        char v9 = [v8 index];

        double v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v11 = [v10 isSensitiveLoggingAllowed];

        if (v11
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        unsigned __int8 v16 = v9 + 1;
      }
      else
      {
        uint64_t v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v13 = [v12 isSensitiveLoggingAllowed];

        if (v13
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        id v6 = 0;
        unsigned __int8 v16 = 1;
      }
      goto LABEL_27;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v18 = v7;
      LogPrintF_safe();
    }
  }
  else
  {
    id v6 = 0;
    id v7 = v3;
  }
  id v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v15 = [v14 isSensitiveLoggingAllowed];

  if (v15 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  unsigned __int8 v16 = 0;
LABEL_27:

  return v16;
}

- (id)_getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:(id)a3
{
  int v5 = [a3 BOOLValue];
  id v24 = 0;
  id v6 = [(ENDaemon *)self getExposureDatabaseAndReturnError:&v24];
  id v7 = v24;
  id v8 = v7;
  if (v6)
  {
    id v23 = 0;
    id v22 = v7;
    char v9 = [v6 getValue:&v23 forKey:@"LastExposureNotification" ofClass:objc_opt_class() error:&v22];
    id v10 = v23;
    id v11 = v22;

    if ((v9 & 1) == 0
      && gLogCategory__ENDaemon <= 90
      && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v21 = v11;
      LogPrintF_safe();
    }
    if (v10)
    {
      int v13 = [v10 classification];
      id v14 = [v13 date];
      int v15 = ENDefaultExpirationDate();

      unsigned __int8 v16 = [MEMORY[0x1E4F1C9C0] date];
      BOOL v12 = [v16 compare:v15] == -1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
    id v11 = v7;
  }
  int v17 = malloc_type_calloc(0xFuLL, 1uLL, 0x100004077774924uLL);
  if (v17)
  {
    unsigned char *v17 = 1;
    if (a3)
    {
      if (v5)
      {
        v17[1] = 1;
        if (v12)
        {
          v17[6] = 1;
          uint64_t v18 = 7;
        }
        else
        {
          v17[3] = 1;
          uint64_t v18 = 4;
        }
      }
      else
      {
        void v17[2] = 1;
        if (v12)
        {
          v17[6] = 1;
          uint64_t v18 = 8;
        }
        else
        {
          v17[3] = 1;
          uint64_t v18 = 5;
        }
      }
    }
    else
    {
      uint64_t v18 = 3;
      if (v12) {
        uint64_t v18 = 6;
      }
    }
    v17[v18] = 1;
    id v19 = objc_msgSend(MEMORY[0x1E4F1C9B0], "dataWithBytesNoCopy:length:", v21);
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v19 = 0;
  }

  return v19;
}

- (unsigned)stateMetricVersion
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = self->_activeEntity;
  BOOL prefEnabled = self->_prefEnabled;
  BOOL prefServerForceDisable = self->_prefServerForceDisable;
  if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v6 = "no";
    if (prefEnabled) {
      id v7 = "yes";
    }
    else {
      id v7 = "no";
    }
    if (prefServerForceDisable) {
      id v6 = "yes";
    }
    id v46 = v7;
    int v47 = v6;
    int v45 = v3;
    LogPrintF_safe();
  }
  if (prefServerForceDisable)
  {
    id v8 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    char v9 = [v8 allRegionServerConfigurations];

    if (v9)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v53;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v53 != v13) {
              objc_enumerationMutation(v10);
            }
            if ((objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "enEnabled", v45, v46, v47) & 1) == 0)
            {
              if (gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }

              goto LABEL_28;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_68;
      }
    }
    else if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_68;
    }
    LogPrintF_safe();
LABEL_68:

    unsigned int v32 = 6;
    goto LABEL_78;
  }
LABEL_28:
  if (!prefEnabled || prefServerForceDisable || !v3)
  {
    int v25 = -[ENRegionMonitor getCurrentRegionVisitWithError:](self->_regionMonitor, "getCurrentRegionVisitWithError:", 0, v45, v46);
    BOOL v26 = [v25 region];

    if (v26)
    {
      id v27 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
      id v28 = [v27 configurationForRegion:v26];

      id v29 = [v28 userConsent];
      uint64_t v30 = [v29 consent];

      if (v30)
      {
        int v31 = [v28 userConsent];

        if (v31) {
          goto LABEL_59;
        }
        goto LABEL_48;
      }
    }
LABEL_48:
    char v33 = (void *)MEMORY[0x1D9439DC0]();
    double v34 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    int v35 = [v34 allRegionConfigurations];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v36 = v35;
    int v31 = (void *)[v36 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v31)
    {
      uint64_t v37 = *(void *)v49;
      while (2)
      {
        for (uint64_t j = 0; j != v31; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v49 != v37) {
            objc_enumerationMutation(v36);
          }
          long long v39 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
          id v40 = [v39 userConsent];
          uint64_t v41 = [v40 consent];

          if (v41)
          {
            int v31 = [v39 userConsent];
            goto LABEL_58;
          }
        }
        int v31 = (void *)[v36 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
LABEL_58:

    if (!v31) {
      goto LABEL_66;
    }
LABEL_59:
    uint64_t v42 = [v31 consent];
    if (v42 == 3) {
      int v43 = 7;
    }
    else {
      int v43 = 1;
    }
    if (v42 == 1) {
      unsigned int v32 = 8;
    }
    else {
      unsigned int v32 = v43;
    }

    goto LABEL_78;
  }
  int v15 = [(ENActiveEntity *)v3 activeStatus];
  if (v15 == 3)
  {
    unsigned int v32 = 4;
    goto LABEL_78;
  }
  if (v15 != 2)
  {
LABEL_66:
    unsigned int v32 = 1;
    goto LABEL_78;
  }
  unsigned __int8 v16 = [(ENActiveEntity *)v3 entity];
  int v17 = [v16 bundleIdentifier];

  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v17 placeholder:0];
    id v19 = v18;
    if (v18)
    {
      id v20 = [v18 bundleURL];
      if (v20)
      {
        id v21 = [MEMORY[0x1E4F28B58] bundleWithURL:v20];
        id v22 = v21;
        if (v21)
        {
          id v23 = [v21 infoDictionary];
          if (v23)
          {
            int Int64Ranged = CFDictionaryGetInt64Ranged();
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            if (Int64Ranged < 2) {
              unsigned int v32 = 2;
            }
            else {
              unsigned int v32 = 3;
            }
          }
          else
          {
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            unsigned int v32 = 0;
          }
        }
        else
        {
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          unsigned int v32 = 0;
        }
      }
      else
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        unsigned int v32 = 0;
      }
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      unsigned int v32 = 0;
    }
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    unsigned int v32 = 0;
  }

LABEL_78:
  return v32;
}

- (void)_exposureManagersEnsureStarted
{
  BOOL v3 = [(ENDaemon *)self _isNKDActive];
  if (!self->_downloadManager)
  {
    uint64_t v4 = [[ENDownloadManager alloc] initWithQueue:self->_dispatchDownloadManagingQueue];
    downloadManager = self->_downloadManager;
    self->_downloadManager = v4;

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __42__ENDaemon__exposureManagersEnsureStarted__block_invoke;
    v27[3] = &unk_1E69AD2C0;
    v27[4] = self;
    [(ENDownloadManager *)self->_downloadManager setErrorMetricReporter:v27];
    [(ENDownloadManager *)self->_downloadManager activate];
  }
  id v26 = 0;
  id v6 = [(ENDaemon *)self _getDownloadEndpointsAndReturnError:&v26];
  id v7 = v26;
  if (v6)
  {
    [(ENDownloadManager *)self->_downloadManager setDownloadEndpoints:v6];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    int v25 = CUPrintNSError();
    LogPrintF_safe();
  }
  [(ENDownloadManager *)self->_downloadManager update];
  id v8 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  char v9 = self->_downloadManager;
  id v10 = self->_exposureDatabase;
  uint64_t v11 = v10;
  if (v8 && v9 && v10)
  {
    exposureDetectionManager = self->_exposureDetectionManager;
    if (!exposureDetectionManager)
    {
      uint64_t v13 = [[ENExposureDetectionManager alloc] initWithConfigurationStore:v8 downloadManager:v9 exposureDatabase:v11 queue:self->_dispatchExposureDetectionManagingQueue];
      id v14 = self->_exposureDetectionManager;
      self->_exposureDetectionManager = v13;

      [(ENExposureDetectionManager *)self->_exposureDetectionManager setDelegate:self];
      [(ENExposureDetectionManager *)self->_exposureDetectionManager activate];
      exposureDetectionManager = self->_exposureDetectionManager;
    }
    [(ENExposureDetectionManager *)exposureDetectionManager setEnableNativeExposureDetection:v3];
    [(ENExposureDetectionManager *)self->_exposureDetectionManager scheduleNativeExposureDetectionForced:0];
    if (!self->_testResultManager)
    {
      int v15 = [[ENTestResultManager alloc] initWithConfigurationStore:v8 exposureDatabase:v11 temporaryExposureKeyManager:self->_temporaryExposureKeyManager queue:self->_dispatchTestResultManagingQueue];
      testResultManager = self->_testResultManager;
      self->_testResultManager = v15;

      [(ENTestResultManager *)self->_testResultManager setDelegate:self];
    }
    int v17 = [(ENActiveEntity *)self->_activeEntity entity];
    uint64_t v18 = [v17 region];

    if (v18 && [(ENDaemon *)self _isNKDActive]) {
      [(ENTestResultManager *)self->_testResultManager activateAutomatedChaffingWithRegion:v18];
    }
    else {
      [(ENTestResultManager *)self->_testResultManager deactivateAutomatedChaffing];
    }
    textMessageManager = self->_textMessageManager;
    if (!textMessageManager)
    {
      id v20 = ENDataVaultPath();
      id v21 = [v20 stringByAppendingPathComponent:@"VerificationHash"];

      id v22 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v21];
      id v23 = [[ENTextMessageManager alloc] initWithDirectoryURL:v22];
      id v24 = self->_textMessageManager;
      self->_textMessageManager = v23;

      [(ENTextMessageManager *)self->_textMessageManager setDelegate:self];
      textMessageManager = self->_textMessageManager;
    }
    [(ENTextMessageManager *)textMessageManager activateIfNeeded];
    [(ENDaemon *)self enqueuePreauthorizedTestVerificationUnlockAction];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __42__ENDaemon__exposureManagersEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained sendErrorMetricWithType:a2];
}

- (id)_getDownloadEndpointsAndReturnError:(id *)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  int v5 = [(ENActiveEntity *)self->_activeEntity entity];
  long long v54 = [v5 region];

  BOOL v6 = [(ENDaemon *)self _isNKDActive];
  id v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v8 = [v7 isSensitiveLoggingAllowed];

  if (v8 && gLogCategory_ENDaemon <= 10 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    char v9 = @"<>";
    if (v54) {
      char v9 = v54;
    }
    id v10 = "no";
    if (v6) {
      id v10 = "yes";
    }
    long long v49 = v9;
    long long v50 = v10;
    LogPrintF_safe();
  }
  if (v54) {
    BOOL v11 = v6;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v12 = self->_regionMonitor;
    if (!v12)
    {
      if (a3)
      {
        ENErrorF();
        uint64_t v30 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v30 = 0;
      }
      goto LABEL_66;
    }
    uint64_t v13 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v14 = v13;
    if (!v13)
    {
      if (a3)
      {
        ENErrorF();
        uint64_t v30 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v30 = 0;
      }
      goto LABEL_65;
    }
    long long v53 = v12;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    int v15 = [v13 allCachedRegions];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      char v18 = 0;
      uint64_t v19 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = objc_msgSend(v14, "configurationForRegion:", *(void *)(*((void *)&v64 + 1) + 8 * i), v49, v50);
          id v22 = [v21 userConsent];
          v18 |= [v22 consent] == 2;
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v17);

      if (v18)
      {
        regionMonitor = self->_regionMonitor;
        id v63 = 0;
        uint64_t v24 = [(ENRegionMonitor *)regionMonitor getAllRegionsWithError:&v63];
        id v25 = v63;
        id v26 = v25;
        if (v24)
        {
LABEL_46:
          long long v52 = v26;
          long long v51 = (void *)v24;
          int v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA88]) initWithSet:v24];
          [v31 addObject:v54];
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v33 = v31;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v68 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v60;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v60 != v36) {
                  objc_enumerationMutation(v33);
                }
                int v38 = *(__CFString **)(*((void *)&v59 + 1) + 8 * j);
                long long v39 = objc_msgSend(v14, "downloadConfigurationForRegion:", v38, v49);
                id v40 = v39;
                if (v39)
                {
                  uint64_t v41 = [v39 tekLocalDownloadBaseURL];
                  uint64_t v42 = [v32 objectForKeyedSubscript:v41];
                  if (!v42 || [(__CFString *)v38 isEqual:v54]) {
                    [v32 setObject:v40 forKeyedSubscript:v41];
                  }
                }
                else
                {
                  int v43 = +[ENLoggingPrefs sharedENLoggingPrefs];
                  int v44 = [v43 isSensitiveLoggingAllowed];

                  if (v44
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    long long v49 = v38;
                    LogPrintF_safe();
                  }
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v68 count:16];
            }
            while (v35);
          }

          BOOL v45 = (unint64_t)[v32 count] > 1;
          id v46 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __48__ENDaemon__getDownloadEndpointsAndReturnError___block_invoke;
          v55[3] = &unk_1E69AD310;
          v55[4] = v14;
          id v56 = v46;
          id v57 = v54;
          BOOL v58 = v45;
          id v47 = v46;
          [v32 enumerateKeysAndObjectsUsingBlock:v55];
          uint64_t v30 = (void *)[v47 copy];

LABEL_64:
          uint64_t v12 = v53;
LABEL_65:

LABEL_66:
          goto LABEL_67;
        }
        id v27 = (__CFString *)v25;
        id v28 = [(__CFString *)v27 domain];
        if ([v28 isEqualToString:*MEMORY[0x1E4F25700]])
        {
          uint64_t v29 = [(__CFString *)v27 code];

          if (v29 == 4)
          {
            if (gLogCategory_ENDaemon > 10 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
              goto LABEL_45;
            }
            goto LABEL_39;
          }
        }
        else
        {
        }
        if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_45;
        }
        long long v49 = v27;
LABEL_39:
        LogPrintF_safe();
LABEL_45:
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CAD8], "set", v49);
        goto LABEL_46;
      }
    }
    else
    {
    }
    if (gLogCategory_ENDaemon <= 10)
    {
      uint64_t v12 = v53;
      if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()) {
        LogPrintF_safe();
      }
      uint64_t v30 = (void *)MEMORY[0x1E4F1CBF8];
      goto LABEL_65;
    }
    uint64_t v30 = (void *)MEMORY[0x1E4F1CBF8];
    goto LABEL_64;
  }
  uint64_t v30 = (void *)MEMORY[0x1E4F1CBF8];
LABEL_67:

  return v30;
}

void __48__ENDaemon__getDownloadEndpointsAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 region];
  int v8 = [*(id *)(a1 + 32) configurationForRegion:v7];
  if ((unint64_t)[v8 enVersion] >= 2)
  {
    char v9 = [ENDownloadEndpoint alloc];
    id v10 = [v6 tekLocalDownloadIndexURL];
    [v6 tekPublishInterval];
    double v12 = v11;
    uint64_t v13 = [v6 region];
    id v14 = [(ENDownloadEndpoint *)v9 initWithBaseURL:v5 indexURL:v10 interval:1 enabled:v13 region:v12];

    [*(id *)(a1 + 40) addObject:v14];
    int v15 = [v6 region];
    LODWORD(v13) = [v15 isEqual:*(void *)(a1 + 48)];

    if (v13)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        if (*(_DWORD *)(a1 + 56)) {
          uint64_t v16 = "yes";
        }
        else {
          uint64_t v16 = "no";
        }
        uint64_t v17 = [v6 travelerDownloadConfigurations];
        id v33 = v16;
        uint64_t v34 = [v17 count];
        LogPrintF_safe();
      }
      char v18 = objc_msgSend(v6, "travelerDownloadConfigurations", v33, v34);
      uint64_t v19 = [v18 count];

      if (v19 && *(_DWORD *)(a1 + 56))
      {
        uint64_t v35 = v14;
        uint64_t v36 = v8;
        uint64_t v37 = v7;
        id v38 = v5;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v20 = [v6 travelerDownloadConfigurations];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v26 = [ENDownloadEndpoint alloc];
              id v27 = [v25 tekTravelerDownloadBaseURL];
              id v28 = [v25 tekTravelerDownloadIndexURL];
              [v6 tekPublishInterval];
              double v30 = v29;
              int v31 = [v6 region];
              id v32 = [(ENDownloadEndpoint *)v26 initWithBaseURL:v27 indexURL:v28 interval:1 enabled:v31 region:v30];

              [*(id *)(a1 + 40) addObject:v32];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v22);
        }

        id v7 = v37;
        id v5 = v38;
        id v14 = v35;
        int v8 = v36;
      }
    }
  }
}

- (id)exposureDetectionManager:(id)a3 advertisementDatabaseQuerySessionWithAttenuationThreshold:(unsigned __int8)a4 error:(id *)a5
{
  return [(ENDaemon *)self advertisementDatabaseQuerySessionWithAttenuationThreshold:a4 error:a5];
}

- (void)exposureDetectionManager:(id)a3 errorDetected:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sendErrorMetricWithType:v4];
}

- (void)exposureDetectionManager:(id)a3 finishedSessionWithResult:(id)a4
{
  id v19 = a4;
  differentialPrivacyManager = self->_differentialPrivacyManager;
  id v6 = [v19 summary];
  [(ENDifferentialPrivacyManager *)differentialPrivacyManager reportUserRiskScoreWithSummary:v6];

  id v7 = self->_differentialPrivacyManager;
  int v8 = [v19 differentialPrivacyRiskParameters];
  [(ENDifferentialPrivacyManager *)v7 reportUserRiskParameters:v8];

  char v9 = self->_differentialPrivacyManager;
  id v10 = [v19 differentialPrivacyBeaconCount];
  [(ENDifferentialPrivacyManager *)v9 reportUserBeaconCount:v10];

  unint64_t v11 = [v19 exposureClassificationStatus];
  double v12 = [v19 exposureClassification];
  uint64_t v13 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v14 = [v13 isSensitiveLoggingAllowed];

  if (v14 && gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    int v15 = [v12 name];
    LogPrintF_safe();
  }
  if (v11 >= 2)
  {
    uint64_t v16 = [v19 region];
    if (v16)
    {
      [(ENDaemon *)self _postExposureNotificationForClassification:v12 status:v11 region:v16];
    }
    else
    {
      uint64_t v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v18 = [v17 isSensitiveLoggingAllowed];

      if (v18
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (id)activeRegionForExposureDetectionManager:(id)a3
{
  BOOL v3 = [(ENActiveEntity *)self->_activeEntity entity];
  uint64_t v4 = [v3 region];

  return v4;
}

- (BOOL)_postExposureNotificationForClassification:(id)a3 status:(int64_t)a4 region:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  unint64_t v11 = [v10 configurationForRegion:v9];
  if ((unint64_t)[v11 enVersion] > 1)
  {
    double v12 = [v10 agencyConfigurationForRegion:v9];
    if (!v12)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      BOOL v45 = 0;
      goto LABEL_55;
    }
    id v63 = v11;
    uint64_t v13 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v14 = [v13 isSensitiveLoggingAllowed];

    if (v14 && gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = [v8 name];
      uint64_t v16 = (void *)v15;
      uint64_t v17 = @"<none>";
      if (v15) {
        uint64_t v17 = (__CFString *)v15;
      }
      int64_t v59 = a4;
      id v61 = v9;
      long long v55 = v17;
      LogPrintF_safe();
    }
    long long v64 = v12;
    long long v65 = objc_msgSend(v12, "localizedConfiguration", v55, v59, v61);
    id v18 = objc_alloc_init(MEMORY[0x1E4F25778]);
    [v18 setClassification:v8];
    id v19 = [MEMORY[0x1E4F29120] UUID];
    [v18 setIdentifier:v19];

    id v20 = [MEMORY[0x1E4F1C9C0] date];
    [v18 setNotificationDate:v20];

    [v18 setRegion:v9];
    uint64_t v21 = [v8 date];
    [v21 timeIntervalSinceNow];
    double v23 = v22;

    uint64_t v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v25 = [v24 isSensitiveLoggingAllowed];

    if (v25 && gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      double v56 = -v23;
      uint64_t v60 = (int)(v23 / -86400.0);
      LogPrintF_safe();
    }
    -[ENDifferentialPrivacyManager reportUserExposureNotificationWithClassificationIndex:daysDelay:](self->_differentialPrivacyManager, "reportUserExposureNotificationWithClassificationIndex:daysDelay:", objc_msgSend(v8, "index", *(void *)&v56, v60), (int)(v23 / -86400.0));
    if (a4 == 3)
    {
      id v26 = v65;
      uint64_t v36 = [v65 revokedNotificationBody];
      if (v36)
      {
        id v28 = (void *)v36;
        uint64_t v37 = [v65 revokedNotificationSubject];
        if (v37)
        {
          double v30 = (void *)v37;
          id v62 = v9;
          int v31 = v10;
          id v38 = [v64 revokedClassificationURL];
          [v18 setLearnMoreURL:v38];

          [v18 setLocalizedBodyText:v28];
          [v18 setLocalizedSubjectText:v30];
          [v18 setRevoked:1];
LABEL_23:

          id v67 = 0;
          long long v39 = [(ENDaemon *)self getExposureDatabaseAndReturnError:&v67];
          id v40 = v67;
          long long v41 = [v18 notificationDate];
          long long v42 = ENDefaultExpirationDate();
          id v66 = v40;
          char v43 = [v39 setValue:v18 forKey:@"LastExposureNotification" expiryDate:v42 error:&v66];
          id v44 = v66;

          if ((v43 & 1) == 0
            && gLogCategory__ENDaemon <= 90
            && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            id v57 = CUPrintNSError();
            LogPrintF_safe();
          }
          -[ENDaemon postExposureNotification:](self, "postExposureNotification:", v18, v57);

          BOOL v45 = 1;
          id v10 = v31;
          id v9 = v62;
          goto LABEL_34;
        }
        long long v53 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v54 = [v53 isSensitiveLoggingAllowed];

        if (v54
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_72;
      }
      long long v50 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v51 = [v50 isSensitiveLoggingAllowed];

      if (v51 && gLogCategory_ENDaemon <= 90)
      {
        if (gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_73;
        }
LABEL_52:
        LogPrintF_safe();
LABEL_73:
        BOOL v45 = 0;
LABEL_34:
        unint64_t v11 = v63;
        double v12 = v64;
        id v26 = v65;
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
    }
    else
    {
      id v26 = v65;
      if (a4 == 2)
      {
        uint64_t v27 = [v8 name];
        if (v27)
        {
          id v28 = (void *)v27;
          double v29 = [v65 notificationConfigurationForName:v27];
          if (v29)
          {
            double v30 = v29;
            id v62 = v9;
            int v31 = v10;
            id v32 = [v29 classificationURL];
            [v18 setLearnMoreURL:v32];

            id v33 = [v30 localizedNotificationBody];
            [v18 setLocalizedBodyText:v33];

            uint64_t v34 = [v30 localizedNotificationSubject];
            [v18 setLocalizedSubjectText:v34];

            uint64_t v35 = [v30 localizedExposureDetailBody];
            [v18 setLocalizedDetailBodyText:v35];

            goto LABEL_23;
          }
          long long v48 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v49 = [v48 isSensitiveLoggingAllowed];

          if (v49
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            BOOL v58 = [v8 name];
            LogPrintF_safe();
          }
LABEL_72:

          goto LABEL_73;
        }
        id v46 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v47 = [v46 isSensitiveLoggingAllowed];

        if (v47 && gLogCategory_ENDaemon <= 90)
        {
          if (gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
            goto LABEL_73;
          }
          goto LABEL_52;
        }
      }
      else if (gLogCategory__ENDaemon <= 90)
      {
        double v12 = v64;
        if (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()) {
          LogPrintF_safe();
        }
        BOOL v45 = 0;
        goto LABEL_54;
      }
    }
    BOOL v45 = 0;
    double v12 = v64;
    goto LABEL_54;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    [v11 enVersion];
    LogPrintF_safe();
  }
  BOOL v45 = 0;
LABEL_56:

  return v45;
}

- (void)onboardingManagerDidObserveDeviceUnlock:(id)a3
{
  uint64_t v4 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v5 = [(ENDaemon *)self onboardingManager];
    int v6 = [v5 pendingBuddyOnboarding];
    id v7 = "no";
    if (v6) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (v4) {
      id v7 = "yes";
    }
    double v12 = v8;
    uint64_t v13 = v7;
    LogPrintF_safe();
  }
  id v9 = [(ENDaemon *)self onboardingManager];
  if ([v9 isDeviceUnlocked] && v4)
  {
    id v10 = [(ENDaemon *)self onboardingManager];
    int v11 = [v10 pendingBuddyOnboarding];

    if (v11)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__ENDaemon_onboardingManagerDidObserveDeviceUnlock___block_invoke_2;
      v14[3] = &unk_1E69AD358;
      v14[4] = self;
      [(ENDaemon *)self presentBuddyForRegion:v4 errorHandler:&__block_literal_global_3 completionHandler:v14];
    }
  }
  else
  {
  }
}

uint64_t __52__ENDaemon_onboardingManagerDidObserveDeviceUnlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) onboardingManager];
  uint64_t v3 = [v2 isIdealTimeForBuddy];

  uint64_t v4 = [*(id *)(a1 + 32) onboardingManager];
  [v4 setShouldObserveDeviceUnlocks:v3 ^ 1];

  id v5 = [*(id *)(a1 + 32) onboardingManager];
  [v5 setPendingBuddyOnboarding:v3 ^ 1];

  return v3;
}

- (void)textMessageManager:(id)a3 errorDetected:(unsigned int)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ENDaemon_textMessageManager_errorDetected___block_invoke;
  v5[3] = &unk_1E69AD298;
  v5[4] = self;
  unsigned int v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

void __45__ENDaemon_textMessageManager_errorDetected___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained sendErrorMetricWithType:*(unsigned int *)(a1 + 40)];
}

- (id)legacyHistoryPath
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = [WeakRetained bluetoothSystemContainerURL];

  if (v3)
  {
    uint64_t v4 = [v3 URLByAppendingPathComponent:@"Library/ExposureNotification"];
    id v5 = [v4 URLByAppendingPathComponent:@"DetectionHistory.plist"];
    unsigned int v6 = [v5 path];
  }
  else
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    unsigned int v6 = 0;
  }

  return v6;
}

- (id)loadLegacyHistorySinceTime:(double)a3
{
  uint64_t v43 = 0;
  id v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__3;
  int v47 = __Block_byref_object_dispose__3;
  id v48 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __39__ENDaemon_loadLegacyHistorySinceTime___block_invoke;
  v42[3] = &unk_1E69ACBB8;
  v42[4] = &v43;
  id v5 = (void (**)(void))MEMORY[0x1D9439FF0](v42, a2);
  unsigned int v6 = [(ENDaemon *)self legacyHistoryPath];
  uint64_t v37 = v6;
  if (!v6) {
    goto LABEL_64;
  }
  id v7 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (!v8)
  {
LABEL_63:
    unsigned int v6 = 0;
    goto LABEL_64;
  }
  int v9 = open_dprotected_np((const char *)[v6 fileSystemRepresentation], 0, 2, 0, 384);
  int v10 = v9;
  if (v9 < 0)
  {
    if (!*__error() || *__error())
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v34 = CUPrintErrorCode();
        LogPrintF_safe();
      }
      goto LABEL_63;
    }
    uint64_t v17 = ENErrorF();
    goto LABEL_20;
  }
  if (lseek(v9, 0, 0))
  {
    __error();
    uint64_t v17 = ENErrorF();
LABEL_20:
    id v18 = v44[5];
    v44[5] = (id)v17;

    goto LABEL_63;
  }
  memset(&v41, 0, sizeof(v41));
  if (fstat(v10, &v41))
  {
    __error();
    uint64_t v31 = ENErrorF();
  }
  else
  {
    off_t st_size = v41.st_size;
    if (v41.st_size <= 0x8000)
    {
      if (v41.st_size >= 1)
      {
        id v12 = (id) [objc_alloc(MEMORY[0x1E4F1CA50]) initWithLength:v41.st_size];
        uint64_t v13 = (char *)[v12 mutableBytes];
        int v14 = &v13[st_size];
        do
        {
          ssize_t v15 = read(v10, v13, v14 - v13);
          if (!v15) {
            break;
          }
          if (v15 <= 0)
          {
            __error();
            uint64_t v30 = ENErrorF();
            unsigned int v6 = 0;
            id v39 = v44[5];
            v44[5] = (id)v30;

            goto LABEL_61;
          }
          v13 += v15;
        }
        while (v13 < v14);
        uint64_t v16 = v44;
        obuint64_t j = 0;
        id v38 = [MEMORY[0x1E4F28FA0] propertyListWithData:v12 options:0 format:0 error:&obj];
        objc_storeStrong(v16 + 5, obj);
        id v36 = v12;
        if (v38)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (gLogCategory_ENDaemon <= 30)
            {
              if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
              {
                double v33 = COERCE_DOUBLE([v38 count]);
                LogPrintF_safe();
              }
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                double v33 = a3;
                LogPrintF_safe();
              }
            }
            id v19 = objc_msgSend(v38, "mutableCopy", *(void *)&v33);
            id v20 = v19;
            if (v19) {
              id v21 = v19;
            }
            else {
              id v21 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
            }
            unsigned int v6 = v21;

            unint64_t v22 = [v6 count];
            unint64_t v23 = v22;
            if (v22 < 0x65)
            {
              if (!v22)
              {
LABEL_50:
                if (gLogCategory_ENDaemon < 31
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  [v6 count];
                  LogPrintF_safe();
                }
                if (!close(v10)
                  || gLogCategory__ENDaemon > 90
                  || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
                {
                  goto LABEL_60;
                }
                __error();
                CUPrintErrorCode();
                id v28 = (id)objc_claimAutoreleasedReturnValue();
                LogPrintF_safe();
LABEL_58:

LABEL_60:
                id v12 = v36;

                goto LABEL_61;
              }
            }
            else
            {
              do
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v24 = [v6 objectAtIndexedSubscript:0];
                  uint64_t v35 = CUPrintNSObjectOneLine();
                  LogPrintF_safe();
                }
                objc_msgSend(v6, "removeObjectAtIndex:", 0, v35);
                --v23;
              }
              while (v23 > 0x64);
              unint64_t v23 = 100;
            }
            unint64_t v25 = 0;
            do
            {
              id v26 = [v6 objectAtIndexedSubscript:v25];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (CFDictionaryGetDouble(), v27 >= a3))
              {
                ++v25;
              }
              else
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v35 = CUPrintNSObjectOneLine();
                  LogPrintF_safe();
                }
                objc_msgSend(v6, "removeObjectAtIndex:", v25, v35);
                --v23;
              }
            }
            while (v25 < v23);
            goto LABEL_50;
          }
          uint64_t v32 = ENErrorF();
        }
        else
        {
          uint64_t v32 = ENNestedErrorF();
        }
        unsigned int v6 = 0;
        id v28 = v44[5];
        v44[5] = (id)v32;
        goto LABEL_58;
      }
      goto LABEL_63;
    }
    uint64_t v31 = ENErrorF();
  }
  unsigned int v6 = 0;
  id v12 = v44[5];
  v44[5] = (id)v31;
LABEL_61:

LABEL_64:
  v5[2](v5);

  _Block_object_dispose(&v43, 8);

  return v6;
}

void __39__ENDaemon_loadLegacyHistorySinceTime___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }
}

- (void)_migrateLegacyHistoryIfNecessary
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ENDaemon *)self loadLegacyHistorySinceTime:1209600.0];
  if (v3)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v26 = [v3 count];
      LogPrintF_safe();
    }
    id v45 = 0;
    uint64_t v4 = -[ENDaemon getExposureDatabaseAndReturnError:](self, "getExposureDatabaseAndReturnError:", &v45, v26);
    id v5 = v45;
    uint64_t v30 = v4;
    if (v4)
    {
      id v44 = 0;
      char v6 = [v4 openWithError:&v44];
      id v7 = v44;
      if (v6)
      {
        double v27 = self;
        id v28 = v5;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        double v29 = v3;
        obuint64_t j = v3;
        uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (!v35) {
          goto LABEL_40;
        }
        uint64_t v34 = *(void *)v41;
        int v8 = v30;
        while (1)
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v41 != v34) {
              objc_enumerationMutation(obj);
            }
            CFStringGetTypeID();
            int v10 = CFDictionaryGetTypedValue();
            int v11 = NSDictionaryGetNSNumber();
            CFDataGetTypeID();
            id v12 = CFDictionaryGetTypedValue();
            id v36 = NSDictionaryGetNSNumber();
            uint64_t v13 = NSDictionaryGetNSNumber();
            if (v10) {
              BOOL v14 = v12 == 0;
            }
            else {
              BOOL v14 = 1;
            }
            if (!v14)
            {
              id v15 = objc_alloc(MEMORY[0x1E4F1C9C0]);
              uint64_t v32 = v11;
              [v11 doubleValue];
              uint64_t v16 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
              id v17 = objc_alloc_init(MEMORY[0x1E4F25758]);
              [v17 setAppBundleIdentifier:v10];
              [v17 setDate:v16];
              [v17 setFileCount:1];
              objc_msgSend(v17, "setMatchCount:", objc_msgSend(v13, "unsignedLongLongValue"));
              id v39 = v7;
              char v18 = [v8 upsertExposureDetectionHistorySession:v17 error:&v39];
              id v19 = v39;

              double v33 = (void *)v16;
              if (v18)
              {
                id v20 = objc_alloc_init(MEMORY[0x1E4F25750]);
                [v20 setFileHash:v12];
                [v20 setProcessDate:v16];
                [v20 setKeyCount:v36];
                [v20 setMatchCount:v13];
                [v20 setSourceAppBundleIdentifier:v10];
                id v38 = v19;
                char v21 = [v8 insertExposureDetectionFile:v20 session:v17 error:&v38];
                id v7 = v38;

                if ((v21 & 1) == 0
                  && gLogCategory__ENDaemon <= 90
                  && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }

                int v8 = v30;
LABEL_36:
                int v11 = v32;
              }
              else
              {
                if (gLogCategory__ENDaemon > 90)
                {
                  id v7 = v19;
                  goto LABEL_36;
                }
                int v11 = v32;
                if (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()) {
                  LogPrintF_safe();
                }
                id v7 = v19;
              }

              goto LABEL_38;
            }
            if (gLogCategory__ENDaemon <= 90
              && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
LABEL_38:
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (!v35)
          {
LABEL_40:

            unint64_t v22 = [(ENDaemon *)v27 legacyHistoryPath];
            if (v22)
            {
              unint64_t v23 = [MEMORY[0x1E4F28CC0] defaultManager];
              id v37 = 0;
              char v24 = [v23 removeItemAtPath:v22 error:&v37];
              id v25 = v37;

              if ((v24 & 1) == 0
                && gLogCategory__ENDaemon <= 90
                && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
            }
            id v5 = v28;
            uint64_t v3 = v29;
            goto LABEL_48;
          }
        }
      }
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
LABEL_48:
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (id)loadHistorySinceTime:(double)a3
{
  uint64_t v16 = 0;
  id v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__3;
  id v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__ENDaemon_loadHistorySinceTime___block_invoke;
  v15[3] = &unk_1E69ACBB8;
  v15[4] = &v16;
  id v5 = (void (**)(void))MEMORY[0x1D9439FF0](v15, a2);
  char v6 = v17;
  obuint64_t j = v17[5];
  id v7 = [(ENDaemon *)self getExposureDatabaseAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    int v9 = v17;
    id v13 = v17[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__ENDaemon_loadHistorySinceTime___block_invoke_2;
    v12[3] = &unk_1E69AD3A8;
    *(double *)&v12[7] = a3;
    v12[5] = v8;
    void v12[6] = &v16;
    v12[4] = v7;
    [v7 enumerateExposureDetectionHistorySessionsWithError:&v13 handler:v12];
    objc_storeStrong(v9 + 5, v13);
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  v5[2](v5);
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __33__ENDaemon_loadHistorySinceTime___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }
}

void __33__ENDaemon_loadHistorySinceTime___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  char v6 = [v5 date];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;
  double v9 = *(double *)(a1 + 56);

  if (v8 >= v9)
  {
    id v10 = [v5 appBundleIdentifier];

    if (v10)
    {
      int v11 = *(void **)(a1 + 32);
      id v12 = [v5 UUID];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v14 = *(void **)(v13 + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __33__ENDaemon_loadHistorySinceTime___block_invoke_3;
      v15[3] = &unk_1E69AD380;
      v15[4] = *(void *)(a1 + 40);
      obuint64_t j = v14;
      [v11 enumerateExposureDetectionHistoryFilesForSessionUUID:v12 error:&obj handler:v15];
      objc_storeStrong((id *)(v13 + 40), obj);
    }
  }
  else
  {
    *a3 = 1;
  }
}

void __33__ENDaemon_loadHistorySinceTime___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA68];
  id v4 = a2;
  id v14 = objc_alloc_init(v3);
  id v5 = [v4 sourceAppBundleIdentifier];
  [v14 setObject:v5 forKeyedSubscript:@"bundleID"];

  char v6 = [v4 fileHash];
  [v14 setObject:v6 forKeyedSubscript:@"hash"];

  double v7 = [v4 keyCount];
  [v14 setObject:v7 forKeyedSubscript:@"keyCount"];

  uint64_t v8 = [v4 matchCount];
  double v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &unk_1F2B35F50;
  }
  [v14 setObject:v10 forKeyedSubscript:@"matchCount"];

  int v11 = (void *)MEMORY[0x1E4F28EC8];
  id v12 = [v4 processDate];

  [v12 timeIntervalSinceReferenceDate];
  uint64_t v13 = objc_msgSend(v11, "numberWithDouble:");
  [v14 setObject:v13 forKeyedSubscript:@"time"];

  [*(id *)(a1 + 32) insertObject:v14 atIndex:0];
}

- (void)startAvailabilityAlertCycleWithBuddy:(BOOL)a3
{
  BOOL v3 = a3;
  [(ENDaemon *)self onboardingTriggerDeactivate];
  id v5 = [(ENDaemon *)self regionMonitor];
  id v20 = 0;
  char v6 = [v5 getCurrentRegionVisitWithError:&v20];
  id v7 = v20;
  uint64_t v8 = [v6 region];

  if (v8)
  {
    double v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v10 = [v9 isSensitiveLoggingAllowed];

    if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      int v11 = "no";
      if (v3) {
        int v11 = "yes";
      }
      uint64_t v18 = v8;
      id v19 = v11;
      LogPrintF_safe();
    }
    -[ENDaemon _writePreferenceRegionPendingOnboarding:](self, "_writePreferenceRegionPendingOnboarding:", v8, v18, v19);
    [(ENDaemon *)self postOnboardingNotificationForRegion:v8];
    uint64_t Int64 = CFPrefs_GetInt64();
    if (v3 && !Int64)
    {
      activeEntity = self->_activeEntity;
      if (!activeEntity || [(ENActiveEntity *)activeEntity activeStatus] <= 2)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        id v14 = [(ENDaemon *)self onboardingManager];
        [v14 setShouldObserveDeviceUnlocks:1];

        id v15 = [(ENDaemon *)self onboardingManager];
        char v16 = [v15 isDeviceUnlocked];

        if ((v16 & 1) == 0)
        {
          id v17 = [(ENDaemon *)self onboardingManager];
          [v17 setPendingBuddyOnboarding:1];
        }
      }
    }
    if (!CFPrefs_GetInt64()) {
      [(ENDaemon *)self onboardingTriggerRetry:2];
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)onboardingTriggerRetry:(unsigned int)a3
{
  if (a3)
  {
    CFPrefs_GetDouble();
    if (v5 == 0.0)
    {
      char v6 = [MEMORY[0x1E4F1C9C0] date];
      id v7 = [MEMORY[0x1E4F1C9A0] currentCalendar];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D0]);
      [v8 setDay:a3];
      double v9 = [v7 dateByAddingComponents:v8 toDate:v6 options:2];
      int v10 = [v7 dateBySettingUnit:32 value:10 ofDate:v9 options:0];
    }
    else
    {
      int v10 = objc_msgSend(MEMORY[0x1E4F1C9C0], "dateWithTimeIntervalSince1970:");
    }
    id v12 = [(ENDaemon *)self onboardingTimer];
    [v12 invalidate];

    [(ENDaemon *)self setOnboardingTimer:0];
LABEL_8:
    if ([(ENDaemon *)self isOnboardingNeeded])
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      if (a3 == 2 || a3 == 5)
      {
        CFPrefs_SetInt64();
        [v10 timeIntervalSince1970];
        CFPrefs_SetDouble();
      }
      if (gLogCategory_ENDaemon <= 30)
      {
        if (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())
        {
          id v25 = [MEMORY[0x1E4F1C9C0] date];
          LogPrintF_safe();
        }
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          id v25 = v10;
          LogPrintF_safe();
        }
      }
      objc_msgSend(v10, "timeIntervalSinceNow", v25);
      double v15 = v14;
      double v16 = 7200.0;
      if (IsAppleInternalBuild())
      {
        CFPrefs_GetDouble();
        if (a3)
        {
          if (v17 > 0.0)
          {
            CFPrefs_GetDouble();
            double v15 = v18;
            double v16 = 30.0;
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
          }
        }
      }
      id v19 = [ENXPCTimer alloc];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      void v26[2] = __35__ENDaemon_onboardingTriggerRetry___block_invoke;
      v26[3] = &unk_1E69AD040;
      v26[4] = self;
      id v20 = [(ENXPCTimer *)v19 initWithName:@"com.apple.exposurenotification.onboarding.retry" delay:1 gracePeriod:577 priority:v26 options:v15 block:v16];
      [(ENDaemon *)self setOnboardingTimer:v20];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_35;
  }
  [(ENDaemon *)self timeForAvailabilityAlertCycleReset];
  if (v11 == 0.0)
  {
    CFPrefs_RemoveValue();
    int v10 = 0;
    goto LABEL_35;
  }
  double v13 = v11;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v25 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:v13];
    LogPrintF_safe();
  }
  int v10 = objc_msgSend(MEMORY[0x1E4F1C9C0], "dateWithTimeIntervalSince1970:", v13, v25);
  [(ENDaemon *)self onboardingTriggerDeactivate];
  id v21 = [(ENDaemon *)self regionMonitor];
  id v27 = 0;
  unint64_t v22 = [v21 getCurrentRegionVisitWithError:&v27];
  id v23 = v27;
  char v24 = [v22 region];

  if (v24)
  {
    [(ENDaemon *)self _writePreferenceRegionPendingOnboarding:v24];

    goto LABEL_8;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }

LABEL_35:
}

void __35__ENDaemon_onboardingTriggerRetry___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v4 = [*(id *)(a1 + 32) onboardingManager];
  [v4 setShouldObserveDeviceUnlocks:0];

  double v5 = [*(id *)(a1 + 32) onboardingManager];
  [v5 setPendingBuddyOnboarding:0];

  char v6 = [*(id *)(a1 + 32) regionMonitor];
  id v7 = [v6 getCurrentRegionVisitWithError:0];
  id v8 = [v7 region];

  double v9 = [*(id *)(a1 + 32) _readPreferenceRegionPendingOnboarding];
  if ([v9 isEqual:v8])
  {
    if ([*(id *)(a1 + 32) isOnboardingNeeded])
    {
      int v10 = [*(id *)(a1 + 32) userNotificationCenter];
      v14[0] = @"com.apple.ExposureNotification.onboarding";
      double v11 = [MEMORY[0x1E4F1C970] arrayWithObjects:v14 count:1];
      [v10 removeDeliveredNotificationsWithIdentifiers:v11];

      [*(id *)(a1 + 32) postOnboardingNotificationForRegion:v9];
      uint64_t Int64 = CFPrefs_GetInt64();
      uint64_t v13 = CFPrefs_GetInt64();
      CFPrefs_RemoveValue();
      CFPrefs_RemoveValue();
      if (v13 == 2)
      {
        if (gLogCategory_ENDaemon > 50 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
          goto LABEL_23;
        }
      }
      else
      {
        if (v13 != 1)
        {
          if (!v13)
          {
            if (!Int64) {
              [*(id *)(a1 + 32) onboardingTriggerRetry:2];
            }
            CFPrefs_RemoveValue();
          }
          goto LABEL_24;
        }
        if (Int64) {
          goto LABEL_24;
        }
        [*(id *)(a1 + 32) onboardingTriggerRetry:5];
        if (gLogCategory_ENDaemon > 50 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        {
LABEL_23:
          CFPrefs_SetValue();
          goto LABEL_24;
        }
      }
      LogPrintF_safe();
      goto LABEL_23;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [*(id *)(a1 + 32) onboardingTriggerDeactivate];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_24:
}

- (void)onboardingTriggerResumeIfNeeded
{
  id v3 = [MEMORY[0x1E4F1C9C0] now];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  CFPrefs_GetDouble();
  if (v6 == 0.0) {
    return;
  }
  double v7 = v6;
  uint64_t Int64 = CFPrefs_GetInt64();
  if (Int64 == 2)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      double v17 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:v7];
      LogPrintF_safe();
    }
    if (v7 > v5)
    {
      double v9 = self;
      uint64_t v10 = 5;
      goto LABEL_20;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
  }
  else
  {
    if (Int64 != 1) {
      return;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      double v16 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:v7];
      LogPrintF_safe();
    }
    if (v7 > v5)
    {
      double v9 = self;
      uint64_t v10 = 2;
LABEL_20:
      [(ENDaemon *)v9 onboardingTriggerRetry:v10];
      return;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    objc_msgSend(MEMORY[0x1E4F1C9C0], "dateWithTimeIntervalSince1970:", v7, v16);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    double v11 = [MEMORY[0x1E4F1C9A0] currentCalendar];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D0]);
    [v12 setDay:5];
    uint64_t v13 = [v11 dateByAddingComponents:v12 toDate:v18 options:2];
    double v14 = [v11 dateBySettingUnit:32 value:10 ofDate:v13 options:0];
    [v14 timeIntervalSince1970];
    if (v15 <= v5)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      CFPrefs_RemoveValue();
      CFPrefs_RemoveValue();
    }
    else
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      CFPrefs_SetInt64();
      [v14 timeIntervalSince1970];
      CFPrefs_SetDouble();
      [(ENDaemon *)self onboardingTriggerRetry:5];
    }
  }
}

- (void)onboardingTriggerDeactivate
{
  if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v3 = [(ENDaemon *)self onboardingManager];
  [v3 setShouldObserveDeviceUnlocks:0];

  double v4 = [(ENDaemon *)self onboardingManager];
  [v4 setPendingBuddyOnboarding:0];

  double v5 = [(ENDaemon *)self onboardingTimer];
  [v5 invalidate];

  [(ENDaemon *)self setOnboardingTimer:0];
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();

  CFPrefs_RemoveValue();
}

- (double)timeForAvailabilityAlertCycleReset
{
  if ([(ENDaemon *)self isOnboardingNeeded])
  {
    regionMonitor = self->_regionMonitor;
    id v33 = 0;
    double v4 = [(ENRegionMonitor *)regionMonitor getCurrentRegionVisitWithError:&v33];
    id v5 = v33;
    double v6 = [v4 region];

    if (!v6)
    {
      double v7 = 0.0;
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_32;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v30 = v6;
      LogPrintF_safe();
    }
    id v8 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    double v9 = [v8 configurationForRegion:v6];

    if ((unint64_t)[v9 enVersion] <= 1)
    {
      double v7 = 0.0;
      if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_31;
      }
      [v9 enVersion];
    }
    else
    {
      uint64_t v10 = [v9 userConsent];
      uint64_t v11 = [v10 consent];

      if (v11 != 2)
      {
        id v12 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
        uint64_t v13 = [v12 serverConfigurationForRegion:v6];

        if (!v13)
        {
          double v7 = 0.0;
          if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          goto LABEL_30;
        }
        [v13 timeToResetAvailabilityAlert];
        double v15 = v14;
        double v16 = [MEMORY[0x1E4F1C9C0] now];
        [v16 timeIntervalSince1970];
        double v18 = v17;

        CFPrefs_GetDouble();
        if (v19 > 0.0)
        {
          double v20 = v19;
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            double v31 = v20;
            LogPrintF_safe();
          }
          double v15 = v18 + v20;
        }
        if (v15 <= v18)
        {
          double v7 = 0.0;
          if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
            goto LABEL_30;
          }
        }
        else
        {
          id v21 = [(ENDaemon *)self onboardingTimer];

          if (!v21) {
            goto LABEL_29;
          }
          uint64_t Int64 = CFPrefs_GetInt64();
          id v23 = [(ENDaemon *)self onboardingTimer];
          char v24 = [v23 date];
          [v24 timeIntervalSince1970];
          double v26 = v25;

          if (Int64 >= 1)
          {
            if (v26 < v15)
            {
              double v7 = 0.0;
              if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
                goto LABEL_30;
              }
              id v27 = [(ENDaemon *)self onboardingTimer];
              id v28 = [v27 date];
              uint64_t v32 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:v15];
              LogPrintF_safe();

              goto LABEL_28;
            }
LABEL_29:
            double v7 = v15;
            goto LABEL_30;
          }
          if (v26 != v15) {
            goto LABEL_29;
          }
          double v7 = 0.0;
          if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
            goto LABEL_30;
          }
        }
        id v27 = objc_msgSend(MEMORY[0x1E4F1C9C0], "dateWithTimeIntervalSince1970:", v15, *(void *)&v31);
        LogPrintF_safe();
LABEL_28:

LABEL_30:
LABEL_31:

LABEL_32:
        return v7;
      }
      double v7 = 0.0;
      if (gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_31;
      }
    }
    LogPrintF_safe();
    goto LABEL_31;
  }
  [(ENDaemon *)self onboardingTriggerDeactivate];
  CFPrefs_RemoveValue();
  return 0.0;
}

- (BOOL)isOnboardingNeeded
{
  if (self->_availabilityAlertDisabled)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    return 0;
  }
  else
  {
    id v3 = [(ENDaemon *)self _readPreferenceRegionPendingOnboarding];
    if (v3)
    {
      double v4 = [(ENDaemon *)self configurationManager];
      id v5 = [v4 configurationStore];
      double v6 = [v5 configurationForRegion:v3];

      if (v6)
      {
        double v7 = [(ENDaemon *)self configurationManager];
        id v8 = [v7 configurationStore];
        double v9 = [v8 serverConfigurationForRegion:v3];

        char v10 = [v9 resetAvailabilityAlertForDeclinedUsers];
        uint64_t v11 = [v6 userConsent];
        uint64_t v12 = [v11 consent];

        if (v12 == 2 || v12 == 1 && (v10 & 1) == 0)
        {
          double v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v15 = [v14 isSensitiveLoggingAllowed];

          if (v15
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            double v16 = "?";
            if (v12 == 1) {
              double v16 = "NotAuthorized";
            }
            if (v12 == 2) {
              double v16 = "Authorized";
            }
            double v18 = v3;
            double v19 = v16;
            LogPrintF_safe();
          }
          [(ENDaemon *)self onboardingTriggerDeactivate];
          BOOL v13 = 0;
        }
        else
        {
          BOOL v13 = 1;
        }
      }
      else
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        BOOL v13 = 0;
      }
    }
    else
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (void)_regionMonitorEnsureStarted
{
  if (!self->_regionMonitor)
  {
    p_regionMonitor = &self->_regionMonitor;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    double v7 = objc_alloc_init(ENRegionMonitor);
    objc_storeStrong((id *)p_regionMonitor, v7);
    [(ENConfigurationManager *)self->_configurationManager setRegionMonitor:v7];
    double v4 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v5 = [v4 isSensitiveLoggingAllowed];

    if (v5 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      double v6 = [(ENRegionMonitor *)*p_regionMonitor getCurrentRegionVisitWithError:0];
      LogPrintF_safe();
    }
  }
}

- (void)_regionMonitorEnsureStopped
{
  if (self->_regionMonitor)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    regionMonitor = self->_regionMonitor;
    self->_regionMonitor = 0;
  }
}

- (void)_networkProxyStatusCheck
{
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__ENDaemon__networkProxyStatusCheck__block_invoke;
  v3[3] = &unk_1E69AD3F8;
  v3[4] = self;
  [MEMORY[0x1E4F7A148] getServiceStatus:dispatchQueue completionHandler:v3];
}

void __36__ENDaemon__networkProxyStatusCheck__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      char v10 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 504), a2);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 224);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__ENDaemon__networkProxyStatusCheck__block_invoke_2;
    v11[3] = &unk_1E69AD3D0;
    void v11[4] = v8;
    [MEMORY[0x1E4F7A148] getTrafficState:v9 completionandler:v11];
  }
}

uint64_t __36__ENDaemon__networkProxyStatusCheck__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v10 = 0;
    if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = a2;
      LogPrintF_safe();
    }
    *(void *)(*(void *)(a1 + 32) + 512) = a2;
    if ((a2 & 0x800) != 0)
    {
      if (gLogCategory_ENDaemon > 40 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_21;
      }
    }
    else if (gLogCategory_ENDaemon > 40 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    LogPrintF_safe();
LABEL_21:
    id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "prefsChanged", v8);
    goto LABEL_22;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    id v10 = v5;
    if (gLogCategory__ENDaemon != -1 || (id v5 = (id)_LogCategory_Initialize(), v6 = v10, v5))
    {
      uint64_t v9 = CUPrintNSError();
      LogPrintF_safe();

LABEL_22:
      id v6 = v10;
    }
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (id)temporaryExposureKeyManager:(id)a3 retrieveTEKHistoryIncludingActive:(BOOL)a4 generateNewTEK:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [WeakRetained retrieveTEKHistoryIncludingActive:v6 generateNewTEK:v5];

  return v8;
}

- (BOOL)isProxyEnabledForTestResultManager:(id)a3
{
  return self->_networkProxyStatus && self->_prefNetworkProxyEnabled;
}

- (void)enqueuePreauthorizedTestVerificationUnlockAction
{
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__3;
  uint64_t v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke;
  v29[3] = &unk_1E69ACBB8;
  v29[4] = &v30;
  id v3 = (void (**)(void))MEMORY[0x1D9439FF0](v29, a2);
  double v4 = [(ENDaemon *)self screenUnlockPendingActions];
  BOOL v5 = [v4 objectForKey:@"PreArmUnlockActionIdentifier"];

  if (v5)
  {
    double v20 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v21 = [v20 isSensitiveLoggingAllowed];

    if (v21 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  else if ([(ENDaemon *)self getOverallStatus] == 1 {
         && [(ENDaemon *)self _isNKDActive])
  }
  {
    BOOL v6 = [(ENDaemon *)self activeEntity];
    id v7 = [v6 entity];
    uint64_t v8 = [v7 region];

    if (!v8)
    {
      uint64_t v22 = ENErrorF();
      uint64_t v9 = (void *)v31[5];
      v31[5] = v22;
      goto LABEL_17;
    }
    uint64_t v9 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
    id v10 = [v9 configurationForRegion:v8];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 diagnosisKeysPreAuthorization];

      if (!v12)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      BOOL v13 = [v11 diagnosisKeysPreAuthorization];
      double v14 = [v13 verificationCode];

      if (!v14)
      {
        char v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v25 = [v24 isSensitiveLoggingAllowed];

        if (!v25
          || gLogCategory_ENDaemon > 30
          || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_15;
        }
        goto LABEL_28;
      }
      int v15 = [v11 diagnosisKeysPreAuthorization];
      int v16 = [v15 reportType];

      if (v16 != 3)
      {
        double v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v18 = [v17 isSensitiveLoggingAllowed];

        if (v18
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke_2;
        v28[3] = &unk_1E69ACA50;
        v28[4] = self;
        double v19 = (void *)MEMORY[0x1D9439FF0](v28);
        [(ENDaemon *)self _enqueueScreenUnlockAction:v19 withIdentifier:@"PreArmUnlockActionIdentifier"];

        goto LABEL_15;
      }
      double v26 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v27 = [v26 isSensitiveLoggingAllowed];

      if (v27
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
LABEL_28:
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v23 = ENErrorF();
      double v14 = (void *)v31[5];
      v31[5] = v23;
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_18:
  v3[2](v3);

  _Block_object_dispose(&v30, 8);
}

void __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v1 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v2 = [v1 isSensitiveLoggingAllowed];

    if (v2)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }
    }
  }
}

uint64_t __60__ENDaemon_enqueuePreauthorizedTestVerificationUnlockAction__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startPreauthorizedTestVerificationAction];
}

- (id)_getReportTypeForSession:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__3;
  double v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__ENDaemon__getReportTypeForSession___block_invoke;
  v12[3] = &unk_1E69ACBB8;
  v12[4] = &v13;
  BOOL v5 = (void (**)(void))MEMORY[0x1D9439FF0](v12);
  BOOL v6 = self->_testResultManager;
  id v7 = (id *)(v14 + 5);
  obuint64_t j = (id)v14[5];
  uint64_t v8 = [(ENTestResultManager *)v6 metadataForSessionWithUUID:v4 error:&obj];
  objc_storeStrong(v7, obj);
  uint64_t v9 = [(ENDaemon *)self _getReportTypeFromMetadata:v8];

  v5[2](v5);
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __37__ENDaemon__getReportTypeForSession___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v1 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v2 = [v1 isSensitiveLoggingAllowed];

    if (v2)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }
    }
  }
}

- (id)_getReportTypeFromMetadata:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v9 = [v8 isSensitiveLoggingAllowed];

    if (!v9 || gLogCategory_ENDaemon > 90 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
      goto LABEL_20;
    }
LABEL_14:
    LogPrintF_safe();
LABEL_20:
    BOOL v5 = &unk_1F2B35F68;
    goto LABEL_21;
  }
  BOOL v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F256D8]];
  BOOL v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v7 = [v6 isSensitiveLoggingAllowed];

  if (!v5)
  {
    if (!v7 || gLogCategory_ENDaemon > 90 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (v7 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_21:

  return v5;
}

- (void)_startPreauthorizedTestVerificationAction
{
  id v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v4 = [v3 isSensitiveLoggingAllowed];

  if (v4 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__3;
  uint64_t v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke;
  v29[3] = &unk_1E69ACBB8;
  v29[4] = &v30;
  BOOL v5 = (void (**)(void))MEMORY[0x1D9439FF0](v29);
  if ([(ENDaemon *)self getOverallStatus] != 1 || ![(ENDaemon *)self _isNKDActive])
  {
    uint64_t v19 = ENErrorF();
    uint64_t v8 = (void *)v31[5];
    v31[5] = v19;
    goto LABEL_18;
  }
  BOOL v6 = [(ENDaemon *)self activeEntity];
  int v7 = [v6 entity];
  uint64_t v8 = [v7 region];

  if (!v8)
  {
    uint64_t v20 = ENErrorF();
    int v9 = (ENTestResultManager *)v31[5];
    v31[5] = v20;
    goto LABEL_17;
  }
  int v9 = self->_testResultManager;
  if (!v9)
  {
    uint64_t v21 = ENErrorF();
    id v10 = (void *)v31[5];
    v31[5] = v21;
    goto LABEL_16;
  }
  id v10 = [(ENConfigurationManager *)self->_configurationManager configurationStore];
  uint64_t v11 = [v10 configurationForRegion:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 diagnosisKeysPreAuthorization];

    if (!v13)
    {
      uint64_t v23 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v24 = [v23 isSensitiveLoggingAllowed];

      if (v24
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_15;
    }
    double v14 = [v12 diagnosisKeysPreAuthorization];
    uint64_t v15 = [v14 verificationCode];

    if (v15)
    {
      BOOL prefNetworkProxyEnabled = self->_prefNetworkProxyEnabled;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_2;
      v28[3] = &unk_1E69AD470;
      v28[4] = self;
      void v28[5] = v12;
      v28[6] = v8;
      v28[7] = v9;
      v28[8] = v10;
      v28[9] = &v30;
      [(ENTestResultManager *)v9 startTestVerficationSessionWithCode:v15 proxyEnabled:prefNetworkProxyEnabled region:v8 completionHandler:v28];
      double v17 = [v12 diagnosisKeysPreAuthorization];
      [v17 setVerificationCode:0];

      id v18 = (id *)(v31 + 5);
      obuint64_t j = (id)v31[5];
      [v10 saveRegionConfiguration:v12 error:&obj];
      objc_storeStrong(v18, obj);
    }
    else
    {
      int v25 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v26 = [v25 isSensitiveLoggingAllowed];

      if (v26
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    uint64_t v22 = ENErrorF();
    uint64_t v15 = (void *)v31[5];
    v31[5] = v22;
  }

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

  v5[2](v5);
  _Block_object_dispose(&v30, 8);
}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v1 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v2 = [v1 isSensitiveLoggingAllowed];

    if (v2)
    {
      if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();
      }
    }
  }
}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(*(void *)(a1 + 32) + 224);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 32);
  v13[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_3;
  v13[3] = &unk_1E69AD448;
  id v14 = v5;
  long long v16 = v8;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  id v18 = v6;
  uint64_t v19 = v9;
  uint64_t v17 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, v13);
}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) _getReportTypeForSession:v2];
    int v4 = [*(id *)(a1 + 40) differentialPrivacyManager];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) _getLatestExposureForDifferentialPrivacy];
      id v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v7 = [v6 isSensitiveLoggingAllowed];

      if (v7 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v30 = v5;
        double v31 = v3;
        LogPrintF_safe();
      }
      uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "differentialPrivacyManager", v30, v31);
      objc_msgSend(v10, "reportUserCodeVerified:reportType:", v5, objc_msgSend(v3, "unsignedIntValue"));
    }
    id v11 = [*(id *)(a1 + 48) diagnosisKeysPreAuthorization];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 expirationStatus];
      id v14 = [MEMORY[0x1E4F1CA68] dictionaryWithCapacity:2];
      long long v15 = [v12 symptomOnsetDate];
      if (v15) {
        [v14 setObject:v15 forKey:*MEMORY[0x1E4F256F0]];
      }

      long long v16 = [v12 didUserTravel];
      if (v16) {
        [v14 setObject:v16 forKey:*MEMORY[0x1E4F256F8]];
      }

      if ([*(id *)(*(void *)(a1 + 40) + 264) regionSupportsFeatures:*(void *)(a1 + 56) featureFlags:1])
      {
        uint64_t v17 = [v12 isUserVaccinated];
        if (v17) {
          [v14 setObject:v17 forKey:*MEMORY[0x1E4F256E8]];
        }
      }
      id v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v19 = [v18 isSensitiveLoggingAllowed];

      if (v19
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_4;
      v33[3] = &unk_1E69AD420;
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v38 = *(void *)(a1 + 88);
      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v22 = *(void **)(a1 + 64);
      v33[4] = v20;
      v33[5] = v21;
      BOOL v39 = v13 == 2;
      id v34 = v3;
      id v35 = v12;
      uint64_t v23 = *(void *)(a1 + 72);
      uint64_t v36 = *(void *)(a1 + 48);
      uint64_t v37 = v23;
      [v22 finishSessionWithUUID:v2 userDidConsent:v13 == 2 metadata:v14 completionHandler:v33];
    }
    else
    {
      id v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v29 = [v28 isSensitiveLoggingAllowed];

      if (v29
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    long long v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v9 = [v8 isSensitiveLoggingAllowed];

    if (v9 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v30 = *(void *)(a1 + 80);
      LogPrintF_safe();
    }
    if (*(void *)(a1 + 80)) {
      [*(id *)(a1 + 40) _handleTestVerificationErrors:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    }
    objc_msgSend(*(id *)(a1 + 48), "setDiagnosisKeysPreAuthorization:", 0, v30);
    int v24 = *(void **)(a1 + 72);
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8);
    id v32 = *(id *)(v26 + 40);
    [v24 saveRegionConfiguration:v25 error:&v32];
    id v27 = v32;
    id v3 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v27;
  }
}

void __53__ENDaemon__startPreauthorizedTestVerificationAction__block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v7 = [v6 isSensitiveLoggingAllowed];

  if (a2)
  {
    if (v7 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [*(id *)(a1 + 32) postPreAuthorizationNotificationForRegion:*(void *)(a1 + 40)];
    long long v8 = [*(id *)(a1 + 32) differentialPrivacyManager];
    if (v8)
    {
      int v9 = *(_DWORD *)(a1 + 88);

      if (v9)
      {
        uint64_t v10 = [*(id *)(a1 + 32) _getLatestExposureForDifferentialPrivacy];
        id v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v12 = [v11 isSensitiveLoggingAllowed];

        if (v12
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          unint64_t v22 = v10;
          uint64_t v23 = *(void *)(a1 + 48);
          LogPrintF_safe();
        }
        uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "differentialPrivacyManager", v22, v23);
        objc_msgSend(v13, "reportUserKeysUploaded:reportType:", v10, objc_msgSend(*(id *)(a1 + 48), "unsignedIntValue"));

        id v14 = [*(id *)(a1 + 56) isUserVaccinated];
        long long v15 = [*(id *)(a1 + 32) _getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:v14];
        if (v15)
        {
          long long v16 = [*(id *)(a1 + 32) differentialPrivacyManager];
          [v16 reportUserDiagnosedVaccineStatus:v15];
        }
        else
        {
          uint64_t v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v18 = [v17 isSensitiveLoggingAllowed];

          if (v18
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
      }
    }
  }
  else
  {
    if (v7 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      unint64_t v22 = (unint64_t)v5;
      LogPrintF_safe();
    }
    if (v5) {
      [*(id *)(a1 + 32) _handleTestVerificationErrors:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "setDiagnosisKeysPreAuthorization:", 0, v22);
  uint64_t v20 = *(void *)(a1 + 64);
  int v19 = *(void **)(a1 + 72);
  uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
  obuint64_t j = *(id *)(v21 + 40);
  [v19 saveRegionConfiguration:v20 error:&obj];
  objc_storeStrong((id *)(v21 + 40), obj);
}

- (void)_handleTestVerificationErrors:(id)a3
{
  unint64_t v4 = [a3 code] - 2;
  if (v4 > 0xB)
  {
    id v6 = @"VERIFICATION_FAILED_GENERIC_ERROR_MESSAGE";
    id v5 = @"VERIFICATION_FAILED_GENERIC_ERROR_TITLE";
  }
  else
  {
    id v5 = (__CFString *)*((void *)&off_1E69ADBD8 + v4);
    id v6 = (__CFString *)*((void *)&off_1E69ADC38 + v4);
  }

  [(ENDaemon *)self postGeneralNotificationWithTitle:v5 message:v6];
}

+ (BOOL)deviceSupportsFaceID
{
  return MEMORY[0x1F417CE00](@"8olRm6C1xqr7AJGpLRnpSw", a2);
}

- (BOOL)isDeviceUnlocked
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v2 = SBSGetScreenLockStatus();
  int v7 = @"ExtendedDeviceLockState";
  v8[0] = MEMORY[0x1E4F1CC40];
  [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v3 = MKBGetDeviceLockState();
  return v3 != 6 && (v3 - 3) < 0xFFFFFFFE && v2 == 0;
}

- (void)enqueueScreenUnlockAction:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ENDaemon_enqueueScreenUnlockAction_withIdentifier___block_invoke;
    block[3] = &unk_1E69AD498;
    void block[4] = self;
    id v11 = v6;
    id v10 = v7;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

uint64_t __53__ENDaemon_enqueueScreenUnlockAction_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueScreenUnlockAction:*(void *)(a1 + 48) withIdentifier:*(void *)(a1 + 40)];
}

- (void)_enqueueScreenUnlockAction:(id)a3 withIdentifier:(id)a4
{
  id v10 = (void (**)(void))a3;
  id v6 = a4;
  if ([(ENDaemon *)self isDeviceUnlocked])
  {
    v10[2]();
  }
  else
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v9 = v6;
      LogPrintF_safe();
    }
    id v7 = [(ENDaemon *)self screenUnlockPendingActions];
    long long v8 = (void *)MEMORY[0x1D9439FF0](v10);
    [v7 setObject:v8 forKey:v6];
  }
}

- (void)xpcPreAuthorizedDiagnosisKeysAvailable
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = self->_xpcConnections;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "xpcPreAuthorizedDiagnosisKeysAvailable", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)xpcReportStatus
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = self->_xpcConnections;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "xpcStatusChanged", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (ENDaemonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENDaemonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setActiveEntity:(id)a3
{
}

- (NSMutableDictionary)appActivities
{
  return self->_appActivities;
}

- (void)setAppActivities:(id)a3
{
}

- (BOOL)automaticRegionSwitchEnabled
{
  return self->_automaticRegionSwitchEnabled;
}

- (void)setAutomaticRegionSwitchEnabled:(BOOL)a3
{
  self->_automaticRegionSwitchEnabled = a3;
}

- (BOOL)availabilityAlertDisabled
{
  return self->_availabilityAlertDisabled;
}

- (void)setAvailabilityAlertDisabled:(BOOL)a3
{
  self->_availabilityAlertDisabled = a3;
}

- (int64_t)travelStatus
{
  return self->_travelStatus;
}

- (void)setTravelStatus:(int64_t)a3
{
  self->_unint64_t travelStatus = a3;
}

- (NSString)btTracingAppID
{
  return self->_btTracingAppID;
}

- (void)setBtTracingAppID:(id)a3
{
}

- (void)setConfigurationManager:(id)a3
{
}

- (ENDifferentialPrivacyManager)differentialPrivacyManager
{
  return self->_differentialPrivacyManager;
}

- (void)setDifferentialPrivacyManager:(id)a3
{
}

- (OS_dispatch_queue)dispatchExposureDetectionManagingQueue
{
  return self->_dispatchExposureDetectionManagingQueue;
}

- (void)setDispatchExposureDetectionManagingQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchDownloadManagingQueue
{
  return self->_dispatchDownloadManagingQueue;
}

- (void)setDispatchDownloadManagingQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchTestResultManagingQueue
{
  return self->_dispatchTestResultManagingQueue;
}

- (void)setDispatchTestResultManagingQueue:(id)a3
{
}

- (ENDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (ENExposureDetectionManager)exposureDetectionManager
{
  return self->_exposureDetectionManager;
}

- (void)setExposureDetectionManager:(id)a3
{
}

- (ENOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
}

- (BOOL)onboardingFirstTime
{
  return self->_onboardingFirstTime;
}

- (void)setOnboardingFirstTime:(BOOL)a3
{
  self->_onboardingFirstTime = a3;
}

- (int64_t)onboardingLegalConsentLastViewCount
{
  return self->_onboardingLegalConsentLastViewCount;
}

- (void)setOnboardingLegalConsentLastViewCount:(int64_t)a3
{
  self->_onboardingLegalConsentLastViewCFIndex Count = a3;
}

- (unsigned)onboardingTrigger
{
  return self->_onboardingTrigger;
}

- (void)setOnboardingTrigger:(unsigned int)a3
{
  self->_onboardingTrigger = a3;
}

- (void)setOnboardingRegionTrigger:(id)a3
{
}

- (int64_t)overallStatus
{
  return self->_overallStatus;
}

- (void)setOverallStatus:(int64_t)a3
{
  self->_int64_t overallStatus = a3;
}

- (NSBackgroundActivityScheduler)persistencePurgeScheduler
{
  return self->_persistencePurgeScheduler;
}

- (void)setPersistencePurgeScheduler:(id)a3
{
}

- (NSMutableOrderedSet)previouslyTrackedApps
{
  return self->_previouslyTrackedApps;
}

- (void)setPreviouslyTrackedApps:(id)a3
{
}

- (void)setRegionMonitor:(id)a3
{
}

- (NSMutableDictionary)remoteUISessions
{
  return self->_remoteUISessions;
}

- (void)setRemoteUISessions:(id)a3
{
}

- (NSMutableDictionary)screenUnlockPendingActions
{
  return self->_screenUnlockPendingActions;
}

- (void)setScreenUnlockPendingActions:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (ENTemporaryExposureKeyManager)temporaryExposureKeyManager
{
  return self->_temporaryExposureKeyManager;
}

- (void)setTemporaryExposureKeyManager:(id)a3
{
}

- (ENTestResultManager)testResultManager
{
  return self->_testResultManager;
}

- (void)setTestResultManager:(id)a3
{
}

- (ENTextMessageManager)textMessageManager
{
  return self->_textMessageManager;
}

- (void)setTextMessageManager:(id)a3
{
}

- (ENUserAlert)userAlert
{
  return self->_userAlert;
}

- (void)setUserAlert:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (BOOL)wasInRestrictedStatus
{
  return self->_wasInRestrictedStatus;
}

- (void)setWasInRestrictedStatus:(BOOL)a3
{
  self->_BOOL wasInRestrictedStatus = a3;
}

- (BOOL)wasInDifferentActiveRegion
{
  return self->_wasInDifferentActiveRegion;
}

- (void)setWasInDifferentActiveRegion:(BOOL)a3
{
  self->_BOOL wasInDifferentActiveRegion = a3;
}

- (BOOL)monthlySummaryDisabled
{
  return self->_monthlySummaryDisabled;
}

- (ENXPCTimer)monthlyNotificationTimer
{
  return self->_monthlyNotificationTimer;
}

- (void)setMonthlyNotificationTimer:(id)a3
{
}

- (ENXPCTimer)onboardingTimer
{
  return self->_onboardingTimer;
}

- (void)setOnboardingTimer:(id)a3
{
}

- (BOOL)prefAggressiveScanning
{
  return self->_prefAggressiveScanning;
}

- (void)setPrefAggressiveScanning:(BOOL)a3
{
  self->_prefAggressiveScanning = a3;
}

- (BOOL)prefConfigurationManagerEnabled
{
  return self->_prefConfigurationManagerEnabled;
}

- (void)setPrefConfigurationManagerEnabled:(BOOL)a3
{
  self->_prefConfigurationManagerEnabled = a3;
}

- (double)prefDatabasePurgeInterval
{
  return self->_prefDatabasePurgeInterval;
}

- (void)setPrefDatabasePurgeInterval:(double)a3
{
  self->_double prefDatabasePurgeInterval = a3;
}

- (BOOL)prefDeveloperServerConfiguration
{
  return self->_prefDeveloperServerConfiguration;
}

- (void)setPrefDeveloperServerConfiguration:(BOOL)a3
{
  self->_prefDeveloperServerConfiguration = a3;
}

- (BOOL)prefEnableNKD
{
  return self->_prefEnableNKD;
}

- (void)setPrefEnableNKD:(BOOL)a3
{
  self->_prefEnableNKD = a3;
}

- (double)prefServerConfigurationRefreshInterval
{
  return self->_prefServerConfigurationRefreshInterval;
}

- (void)setPrefServerConfigurationRefreshInterval:(double)a3
{
  self->_prefServerConfigurationRefreshInterval = a3;
}

- (void)setPrefDifferentialPrivacyConsent:(int64_t)a3
{
  self->_unint64_t prefDifferentialPrivacyConsent = a3;
}

- (void)setPrefEnabled:(BOOL)a3
{
  self->_BOOL prefEnabled = a3;
}

- (BOOL)prefLoggingSensitive
{
  return self->_prefLoggingSensitive;
}

- (void)setPrefLoggingSensitive:(BOOL)a3
{
  self->_prefLoggingSensitive = a3;
}

- (BOOL)prefLoggingRPI
{
  return self->_prefLoggingRPI;
}

- (void)setPrefLoggingRPI:(BOOL)a3
{
  self->_int prefLoggingRPI = a3;
}

- (void)setPrefPaused:(BOOL)a3
{
  self->_prefPaused = a3;
}

- (BOOL)prefNetworkProxyEnabled
{
  return self->_prefNetworkProxyEnabled;
}

- (void)setPrefNetworkProxyEnabled:(BOOL)a3
{
  self->_BOOL prefNetworkProxyEnabled = a3;
}

- (unsigned)prefRateLimitMaxAPICount
{
  return self->_prefRateLimitMaxAPICount;
}

- (void)setPrefRateLimitMaxAPICount:(unsigned int)a3
{
  self->_prefRateLimitMaxAPICFIndex Count = a3;
}

- (unsigned)prefRateLimitMaxAPICountV2
{
  return self->_prefRateLimitMaxAPICountV2;
}

- (void)setPrefRateLimitMaxAPICountV2:(unsigned int)a3
{
  self->_prefRateLimitMaxAPICountV2 = a3;
}

- (NSString)prefRegionIdentifierOverride
{
  return self->_prefRegionIdentifierOverride;
}

- (void)setPrefRegionIdentifierOverride:(id)a3
{
}

- (BOOL)prefRegionMonitorTestMode
{
  return self->_prefRegionMonitorTestMode;
}

- (void)setPrefRegionMonitorTestMode:(BOOL)a3
{
  self->_prefRegionMonitorTestMode = a3;
}

- (BOOL)prefServerForceDisable
{
  return self->_prefServerForceDisable;
}

- (void)setPrefServerForceDisable:(BOOL)a3
{
  self->_BOOL prefServerForceDisable = a3;
}

- (BOOL)prefSkipExposureWindowShuffling
{
  return self->_prefSkipExposureWindowShuffling;
}

- (void)setPrefSkipExposureWindowShuffling:(BOOL)a3
{
  self->_prefSkipExposureWindowShuffling = a3;
}

- (void)setPrefSkipFileSigning:(BOOL)a3
{
  self->_prefSkipFileSigning = a3;
}

- (BOOL)prefStoreDemoMode
{
  return self->_prefStoreDemoMode;
}

- (void)setPrefStoreDemoMode:(BOOL)a3
{
  self->_prefStoreDemoMode = a3;
}

- (BOOL)prefTCCAllowWithoutApps
{
  return self->_prefTCCAllowWithoutApps;
}

- (void)setPrefTCCAllowWithoutApps:(BOOL)a3
{
  self->_prefTCCAllowWithoutApps = a3;
}

- (unsigned)usageUserEnabled
{
  return self->_usageUserEnabled;
}

- (void)setUsageUserEnabled:(unsigned int)a3
{
  self->_uint64_t usageUserEnabled = a3;
}

- (unsigned)usageUserDisabled
{
  return self->_usageUserDisabled;
}

- (void)setUsageUserDisabled:(unsigned int)a3
{
  self->_uint64_t usageUserDisabled = a3;
}

- (unsigned)usageUserPaused
{
  return self->_usageUserPaused;
}

- (void)setUsageUserPaused:(unsigned int)a3
{
  self->_uint64_t usageUserPaused = a3;
}

- (unsigned)usageUserUnpaused
{
  return self->_usageUserUnpaused;
}

- (void)setUsageUserUnpaused:(unsigned int)a3
{
  self->_uint64_t usageUserUnpaused = a3;
}

- (unsigned)usageUserAlertShare
{
  return self->_usageUserAlertShare;
}

- (void)setUsageUserAlertShare:(unsigned int)a3
{
  self->_uint64_t usageUserAlertShare = a3;
}

- (unsigned)usageUserAlertDontShare
{
  return self->_usageUserAlertDontShare;
}

- (void)setUsageUserAlertDontShare:(unsigned int)a3
{
  self->_uint64_t usageUserAlertDontShare = a3;
}

- (unsigned)usageUserAlertReset
{
  return self->_usageUserAlertReset;
}

- (void)setUsageUserAlertReset:(unsigned int)a3
{
  self->_uint64_t usageUserAlertReset = a3;
}

- (unsigned)usageUserAlertDontReset
{
  return self->_usageUserAlertDontReset;
}

- (void)setUsageUserAlertDontReset:(unsigned int)a3
{
  self->_uint64_t usageUserAlertDontReset = a3;
}

- (unsigned)usageGetDiagnosisKeys
{
  return self->_usageGetDiagnosisKeys;
}

- (void)setUsageGetDiagnosisKeys:(unsigned int)a3
{
  self->_uint64_t usageGetDiagnosisKeys = a3;
}

- (unsigned)usageResetAllData
{
  return self->_usageResetAllData;
}

- (void)setUsageResetAllData:(unsigned int)a3
{
  self->_uint64_t usageResetAllData = a3;
}

- (unsigned)usageExposureDetectFileActivate
{
  return self->_usageExposureDetectFileActivate;
}

- (void)setUsageExposureDetectFileActivate:(unsigned int)a3
{
  self->_uint64_t usageExposureDetectFileActivate = a3;
}

- (unsigned)usageExposureDetectFileAddKeys
{
  return self->_usageExposureDetectFileAddKeys;
}

- (void)setUsageExposureDetectFileAddKeys:(unsigned int)a3
{
  self->_uint64_t usageExposureDetectFileAddKeys = a3;
}

- (unsigned)usageExposureDetectFileFinish
{
  return self->_usageExposureDetectFileFinish;
}

- (void)setUsageExposureDetectFileFinish:(unsigned int)a3
{
  self->_uint64_t usageExposureDetectFileFinish = a3;
}

- (unsigned)usageExposureDetectFileGetExposures
{
  return self->_usageExposureDetectFileGetExposures;
}

- (void)setUsageExposureDetectFileGetExposures:(unsigned int)a3
{
  self->_uint64_t usageExposureDetectFileGetExposures = a3;
}

- (unsigned)usageExposureDetectFileGetExposureWindows
{
  return self->_usageExposureDetectFileGetExposureWindows;
}

- (void)setUsageExposureDetectFileGetExposureWindows:(unsigned int)a3
{
  self->_uint64_t usageExposureDetectFileGetExposureWindows = a3;
}

- (SBSRemoteAlertHandle)buddyAlertHandle
{
  return self->_buddyAlertHandle;
}

- (void)setBuddyAlertHandle:(id)a3
{
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
}

- (PrivacyProxyServiceStatus)networkProxyStatus
{
  return self->_networkProxyStatus;
}

- (void)setNetworkProxyStatus:(id)a3
{
}

- (unint64_t)networkProxyTraffic
{
  return self->_networkProxyTraffic;
}

- (void)setNetworkProxyTraffic:(unint64_t)a3
{
  self->_networkProxyTraffic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProxyStatus, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_buddyAlertHandle, 0);
  objc_storeStrong((id *)&self->_prefRegionIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_onboardingTimer, 0);
  objc_storeStrong((id *)&self->_monthlyNotificationTimer, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_userAlert, 0);
  objc_storeStrong((id *)&self->_textMessageManager, 0);
  objc_storeStrong((id *)&self->_testResultManager, 0);
  objc_storeStrong((id *)&self->_temporaryExposureKeyManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_screenUnlockPendingActions, 0);
  objc_storeStrong((id *)&self->_remoteUISessions, 0);
  objc_storeStrong((id *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_previouslyTrackedApps, 0);
  objc_storeStrong((id *)&self->_persistencePurgeScheduler, 0);
  objc_storeStrong((id *)&self->_onboardingRegionTrigger, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_exposureDetectionManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_dispatchTestResultManagingQueue, 0);
  objc_storeStrong((id *)&self->_dispatchDownloadManagingQueue, 0);
  objc_storeStrong((id *)&self->_dispatchExposureDetectionManagingQueue, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_btTracingAppID, 0);
  objc_storeStrong((id *)&self->_appActivities, 0);
  objc_storeStrong((id *)&self->_activeEntity, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);

  objc_storeStrong((id *)&self->_applicationObserver, 0);
}

@end
@interface HMDMetricsManager
+ (HMMLogEventSubmitting)sharedLogEventSubmitter;
+ (HMMRadarInitiating)defaultRadarInitiator;
+ (NSUUID)namespaceUUID;
+ (id)logCategory;
+ (void)submitMinimalCoreAnalyticsEvent:(id)a3;
- (BOOL)_canRunCountersManagerCommand:(id)a3;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isDemoModeConfigured;
- (BOOL)isSubmissionEnabled;
- (BOOL)metricsCollectionStarted;
- (BOOL)updateCachedWidgetCount;
- (HMDAppleAccountManager)accountManager;
- (HMDCloudSyncLogEventsAnalyzer)cloudSyncLogEventsAnalyzer;
- (HMDConfigurationLogEvent)cachedConfiguration;
- (HMDCoreAnalyticsLogEventObserverDelegate)coreAnalyticsDelegate;
- (HMDDevice)currentDevice;
- (HMDDiagnosticReporterLogObserver)diagnosticReporterLogObserver;
- (HMDEWSLogging)ewsLogger;
- (HMDEventCountersManager)legacyCountersManager;
- (HMDHH2AutoMigrationEligibilityChecker)hh2AutoMigrationEligibilityChecker;
- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)hh2AutoMigrationEligibilitySubmitter;
- (HMDHH2MigrationLogEventsAnalyzer)hh2MigrationAnalyzer;
- (HMDHomeManager)homeManager;
- (HMDHouseholdMetricsManager)householdMetricsManager;
- (HMDLogEventAccessoryFirmwareUpdateEventAnalyzer)firmwareUpdateEventsAnalyzer;
- (HMDLogEventBulletinNotificationsAnalyzer)bulletinNotificationsAnalyzer;
- (HMDLogEventCountingAnalyzer)eventCountingAnalyzer;
- (HMDLogEventDailyScheduler)dailyScheduler;
- (HMDLogEventElectionEventsAnalyzer)electionEventsAnalyzer;
- (HMDLogEventErrorEventsAnalyzer)errorEventsAnalyzer;
- (HMDLogEventHAPMetricsEventAnalyzer)hapEventsAnalyzer;
- (HMDLogEventMessageEventsAnalyzer)messagingEventsAnalyzer;
- (HMDLogEventProcessLaunchAnalyzer)processLaunchEventsAnalyzer;
- (HMDLogEventProcessMemoryEventsAnalyzer)processMemoryEventsAnalyzer;
- (HMDLogEventReachabilityEventsAnalyzer)reachabilityEventsAnalyzer;
- (HMDLogEventUserActivityAnalyzer)userActivityEventsAnalyzer;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDMetricsAccessoryDetailsManager)accessoryDetailsManager;
- (HMDMetricsDeviceStateManager)deviceStateManager;
- (HMDMetricsManager)initWithMessageDispatcher:(id)a3 accountManager:(id)a4 notificationSettingsProvider:(id)a5;
- (HMDMetricsManager)initWithMessageDispatcher:(id)a3 accountManager:(id)a4 notificationSettingsProvider:(id)a5 logEventDispatcher:(id)a6 dailyScheduler:(id)a7 dateProvider:(id)a8 legacyCountersManager:(id)a9 flagsManager:(id)a10 ewsLogger:(id)a11 deviceStateManager:(id)a12 networkObserver:(id)a13 coreAnalyticsTagObserver:(id)a14 backgroundLoggingTimer:(id)a15 radarInitiator:(id)a16 notificationCenter:(id)a17 userDefaults:(id)a18 currentSoftwareVersion:(id)a19;
- (HMDMetricsPreferencesDebugManager)preferencesDebugManager;
- (HMDNetworkObserver)networkObserver;
- (HMDPowerLogObserver)powerLogObserver;
- (HMDThreadNetworkObserver)threadNetworkObserver;
- (HMDTimeBasedFlagsManager)flagsManager;
- (HMDUserNotificationCenterSettingsProviding)notificationSettingsProvider;
- (HMDWidgetTimelineRefresherEventsAnalyzer)widgetTimelineRefresherEventsAnalyzer;
- (HMFTimer)backgroundLoggingTimer;
- (HMMCoreAnalyticsLogEventObserver)coreAnalyticsObserver;
- (HMMCoreAnalyticsTagObserver)coreAnalyticsTagObserver;
- (HMMDateProvider)dateProvider;
- (HMMLogEventDispatching)logEventDispatcher;
- (HMMRadarInitiating)radarInitiator;
- (HMMSiriSELFLogEventObserver)siriSELFLoggingObserver;
- (NSArray)configurationObservers;
- (NSArray)coreAnalyticsFilters;
- (NSArray)devicesOnCurrentAccount;
- (NSArray)homeDataSources;
- (NSMutableArray)aggregationAnalysisEventContributingAnalyzers;
- (NSNotificationCenter)notificationCenter;
- (NSString)PRKitDateString;
- (NSString)PRKitUUIDString;
- (NSString)currentSoftwareVersion;
- (NSUUID)homeUUIDForCurrentResidentDevice;
- (NSUUID)messageTargetUUID;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)accessoryForIdentifier:(id)a3;
- (id)cachedHomeConfigurationForHomeUUID:(id)a3;
- (id)homeKitAggregationAnalysisLogEventForDate:(id)a3;
- (id)messageDestination;
- (int64_t)configuredWidgetsCount;
- (void)_configureManagers;
- (void)_configureObservers;
- (void)_handleAddEphemeralContainer:(id)a3;
- (void)_handleDeactivateEphemeralContainer:(id)a3;
- (void)_handleDeleteCounters:(id)a3;
- (void)_handleDeleteEphemeralContainer:(id)a3;
- (void)_handleFetchEventCounters:(id)a3;
- (void)_handleListEphemeralContainers:(id)a3;
- (void)_handleLogEventDailySchedulerStatusRequest:(id)a3;
- (void)_handleLogEventDailySchedulerSubmitRequest:(id)a3;
- (void)_handleReadCounters:(id)a3;
- (void)_handleResetEventCounters:(id)a3;
- (void)_handleSaveCounters:(id)a3;
- (void)_handleStartupEphemeralContainer:(id)a3;
- (void)_registerForMessages;
- (void)addAnalyzer:(id)a3 toListOfAggregationAnalysisEventContributing:(id)a4;
- (void)addConfigurationChangedObserver:(id)a3;
- (void)addRateTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 windowSize:(unint64_t)a7;
- (void)addThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6;
- (void)addThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 uploadImmediately:(BOOL)a7;
- (void)configureHAPMetricsDispatcher:(id)a3;
- (void)homeKitConfigurationChanged;
- (void)logEventAggregationAnalysisLogEvents;
- (void)notifyConfigurationObserversWithUpdatedEvent:(id)a3;
- (void)registerTaggedLoggingProcessors;
- (void)resetHomeKitAggregationAnalysisContext;
- (void)runDailyTask;
- (void)saveCounters;
- (void)setConfiguredWidgetsCount:(int64_t)a3;
- (void)setHomeManager:(id)a3;
- (void)setMetricsCollectionStarted:(BOOL)a3;
- (void)startAnalyzers;
- (void)startMetricsCollection;
- (void)submitCurrentUserSettings;
- (void)submitDailyAggregationAnalysisEvents;
- (void)submitHAPMetricsCounters;
- (void)timerDidFire:(id)a3;
- (void)updateCachedConfiguration;
- (void)waitToCompleteCurrentlyQueuedTasks;
@end

@implementation HMDMetricsManager

- (BOOL)isSubmissionEnabled
{
  return ![(HMDMetricsManager *)self isDemoModeConfigured];
}

- (BOOL)isDemoModeConfigured
{
  v2 = [(HMDMetricsManager *)self homeManager];
  char v3 = [v2 demoFinalized];

  return v3;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (HMDMetricsDeviceStateManager)deviceStateManager
{
  return self->_deviceStateManager;
}

+ (HMMLogEventSubmitting)sharedLogEventSubmitter
{
  os_unfair_lock_lock_with_options();
  v2 = (void *)sharedDispatcher;
  if (!sharedDispatcher)
  {
    v2 = (void *)bufferedSubmitter;
    if (!bufferedSubmitter)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F6A248]);
      v4 = (void *)bufferedSubmitter;
      bufferedSubmitter = (uint64_t)v3;

      v2 = (void *)bufferedSubmitter;
    }
  }
  id v5 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedSubmitterLock);
  return (HMMLogEventSubmitting *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLoggingTimer, 0);
  objc_storeStrong((id *)&self->_aggregationAnalysisEventContributingAnalyzers, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsTagObserver, 0);
  objc_storeStrong((id *)&self->_preferencesDebugManager, 0);
  objc_storeStrong((id *)&self->_widgetTimelineRefresherEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_userActivityEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_reachabilityEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_processMemoryEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_processLaunchEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_messagingEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_hh2MigrationAnalyzer, 0);
  objc_storeStrong((id *)&self->_hapEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_eventCountingAnalyzer, 0);
  objc_storeStrong((id *)&self->_errorEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_electionEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_cloudSyncLogEventsAnalyzer, 0);
  objc_storeStrong((id *)&self->_bulletinNotificationsAnalyzer, 0);
  objc_storeStrong((id *)&self->_siriSELFLoggingObserver, 0);
  objc_storeStrong((id *)&self->_powerLogObserver, 0);
  objc_storeStrong((id *)&self->_diagnosticReporterLogObserver, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsObserver, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsFilters, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsDelegate, 0);
  objc_storeStrong((id *)&self->_householdMetricsManager, 0);
  objc_storeStrong((id *)&self->_accessoryDetailsManager, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationEligibilitySubmitter, 0);
  objc_storeStrong((id *)&self->_notificationSettingsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_deviceStateManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_currentSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_threadNetworkObserver, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_PRKitUUIDString, 0);
  objc_storeStrong((id *)&self->_PRKitDateString, 0);
  objc_storeStrong((id *)&self->_cachedConfiguration, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_radarInitiator, 0);
  objc_destroyWeak((id *)&self->_ewsLogger);
  objc_storeStrong((id *)&self->_flagsManager, 0);
  objc_storeStrong((id *)&self->_legacyCountersManager, 0);
  objc_storeStrong((id *)&self->_logEventDispatcher, 0);
  objc_storeStrong((id *)&self->_bridgedCountersManager, 0);
  objc_storeStrong((id *)&self->_configurationObservers, 0);
}

- (HMFTimer)backgroundLoggingTimer
{
  return self->_backgroundLoggingTimer;
}

- (NSMutableArray)aggregationAnalysisEventContributingAnalyzers
{
  return self->_aggregationAnalysisEventContributingAnalyzers;
}

- (HMMCoreAnalyticsTagObserver)coreAnalyticsTagObserver
{
  return self->_coreAnalyticsTagObserver;
}

- (HMDMetricsPreferencesDebugManager)preferencesDebugManager
{
  return self->_preferencesDebugManager;
}

- (HMDWidgetTimelineRefresherEventsAnalyzer)widgetTimelineRefresherEventsAnalyzer
{
  return self->_widgetTimelineRefresherEventsAnalyzer;
}

- (HMDLogEventAccessoryFirmwareUpdateEventAnalyzer)firmwareUpdateEventsAnalyzer
{
  return self->_firmwareUpdateEventsAnalyzer;
}

- (HMDLogEventUserActivityAnalyzer)userActivityEventsAnalyzer
{
  return self->_userActivityEventsAnalyzer;
}

- (HMDLogEventReachabilityEventsAnalyzer)reachabilityEventsAnalyzer
{
  return self->_reachabilityEventsAnalyzer;
}

- (HMDLogEventProcessMemoryEventsAnalyzer)processMemoryEventsAnalyzer
{
  return self->_processMemoryEventsAnalyzer;
}

- (HMDLogEventProcessLaunchAnalyzer)processLaunchEventsAnalyzer
{
  return self->_processLaunchEventsAnalyzer;
}

- (HMDLogEventMessageEventsAnalyzer)messagingEventsAnalyzer
{
  return self->_messagingEventsAnalyzer;
}

- (HMDHH2MigrationLogEventsAnalyzer)hh2MigrationAnalyzer
{
  return self->_hh2MigrationAnalyzer;
}

- (HMDLogEventHAPMetricsEventAnalyzer)hapEventsAnalyzer
{
  return self->_hapEventsAnalyzer;
}

- (HMDLogEventCountingAnalyzer)eventCountingAnalyzer
{
  return self->_eventCountingAnalyzer;
}

- (HMDLogEventErrorEventsAnalyzer)errorEventsAnalyzer
{
  return self->_errorEventsAnalyzer;
}

- (HMDLogEventElectionEventsAnalyzer)electionEventsAnalyzer
{
  return self->_electionEventsAnalyzer;
}

- (HMDCloudSyncLogEventsAnalyzer)cloudSyncLogEventsAnalyzer
{
  return self->_cloudSyncLogEventsAnalyzer;
}

- (HMDLogEventBulletinNotificationsAnalyzer)bulletinNotificationsAnalyzer
{
  return self->_bulletinNotificationsAnalyzer;
}

- (HMMSiriSELFLogEventObserver)siriSELFLoggingObserver
{
  return self->_siriSELFLoggingObserver;
}

- (HMDPowerLogObserver)powerLogObserver
{
  return self->_powerLogObserver;
}

- (HMDDiagnosticReporterLogObserver)diagnosticReporterLogObserver
{
  return self->_diagnosticReporterLogObserver;
}

- (HMMCoreAnalyticsLogEventObserver)coreAnalyticsObserver
{
  return self->_coreAnalyticsObserver;
}

- (NSArray)coreAnalyticsFilters
{
  return self->_coreAnalyticsFilters;
}

- (HMDCoreAnalyticsLogEventObserverDelegate)coreAnalyticsDelegate
{
  return self->_coreAnalyticsDelegate;
}

- (HMDHouseholdMetricsManager)householdMetricsManager
{
  return self->_householdMetricsManager;
}

- (HMDMetricsAccessoryDetailsManager)accessoryDetailsManager
{
  return self->_accessoryDetailsManager;
}

- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)hh2AutoMigrationEligibilitySubmitter
{
  return self->_hh2AutoMigrationEligibilitySubmitter;
}

- (HMDUserNotificationCenterSettingsProviding)notificationSettingsProvider
{
  return self->_notificationSettingsProvider;
}

- (HMDAppleAccountManager)accountManager
{
  return self->_accountManager;
}

- (HMDMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMetricsCollectionStarted:(BOOL)a3
{
  self->_metricsCollectionStarted = a3;
}

- (BOOL)metricsCollectionStarted
{
  return self->_metricsCollectionStarted;
}

- (void)setHomeManager:(id)a3
{
}

- (void)setConfiguredWidgetsCount:(int64_t)a3
{
  self->_configuredWidgetsCount = a3;
}

- (int64_t)configuredWidgetsCount
{
  return self->_configuredWidgetsCount;
}

- (NSString)currentSoftwareVersion
{
  return self->_currentSoftwareVersion;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMDThreadNetworkObserver)threadNetworkObserver
{
  return self->_threadNetworkObserver;
}

- (HMDNetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (NSString)PRKitUUIDString
{
  return self->_PRKitUUIDString;
}

- (NSString)PRKitDateString
{
  return self->_PRKitDateString;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return self->_dailyScheduler;
}

- (HMMRadarInitiating)radarInitiator
{
  return self->_radarInitiator;
}

- (HMDEWSLogging)ewsLogger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ewsLogger);
  return (HMDEWSLogging *)WeakRetained;
}

- (HMDTimeBasedFlagsManager)flagsManager
{
  return self->_flagsManager;
}

- (HMDEventCountersManager)legacyCountersManager
{
  return self->_legacyCountersManager;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  return self->_logEventDispatcher;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  v2 = [(HMDMetricsManager *)self homeManager];
  id v3 = [v2 homes];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_377);

  return v4;
}

uint64_t __60__HMDMetricsManager_isCurrentDeviceConfirmedPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDeviceConfirmedPrimaryResident];
}

- (HMDHH2AutoMigrationEligibilityChecker)hh2AutoMigrationEligibilityChecker
{
  v2 = [(HMDMetricsManager *)self homeManager];
  id v3 = [v2 hh2AutoMigrationEligibilityChecker];

  return (HMDHH2AutoMigrationEligibilityChecker *)v3;
}

- (NSUUID)homeUUIDForCurrentResidentDevice
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [(HMDMetricsManager *)self homeManager];
  id v3 = [v2 homes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v9 = objc_msgSend(v8, "residentDeviceManager", 0);
        v10 = [v9 residentDevices];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v17 + 1) + 8 * j) isCurrentDevice])
              {
                v15 = [v8 uuid];

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return (NSUUID *)v15;
}

- (NSArray)homeDataSources
{
  v2 = [(HMDMetricsManager *)self homeManager];
  id v3 = [v2 homes];

  return (NSArray *)v3;
}

- (NSArray)devicesOnCurrentAccount
{
  v2 = [(HMDMetricsManager *)self accountManager];
  id v3 = [v2 account];
  uint64_t v4 = [v3 devices];

  return (NSArray *)v4;
}

- (HMDDevice)currentDevice
{
  v2 = [(HMDMetricsManager *)self accountManager];
  id v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = [(HMDMetricsManager *)self logEventDispatcher];
  id v3 = [v2 clientQueue];

  return (OS_dispatch_queue *)v3;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v4 = [(HMDMetricsManager *)self messageTargetUUID];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  v2 = objc_opt_class();
  return (NSUUID *)[v2 namespaceUUID];
}

- (void)saveCounters
{
  id v2 = [(HMDMetricsManager *)self legacyCountersManager];
  [v2 forceSave];
}

- (void)waitToCompleteCurrentlyQueuedTasks
{
  id v3 = [(HMDMetricsManager *)self logEventDispatcher];
  id v2 = [v3 clientQueue];
  dispatch_sync(v2, &__block_literal_global_373);
}

- (void)_handleLogEventDailySchedulerSubmitRequest:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(HMDMetricsManager *)self dailyScheduler];
  [v4 runHomeutilTasks];

  [v5 respondWithSuccess];
}

- (void)_handleLogEventDailySchedulerStatusRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDMetricsManager *)self dailyScheduler];
  id v5 = [v6 statusSummary];
  [v4 respondWithPayload:v5];
}

- (void)_handleResetEventCounters:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDMetricsManager *)self legacyCountersManager];
  [v4 resetAllEventCounters];

  [v5 respondWithSuccess];
}

- (void)_handleFetchEventCounters:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMetricsManager *)self legacyCountersManager];
  id v6 = [v5 fetchAllEventCounters];

  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __47__HMDMetricsManager__handleFetchEventCounters___block_invoke;
  uint64_t v13 = &unk_1E6A0D4C8;
  id v14 = v7;
  id v8 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v10];
  v15 = @"countersManager";
  v16[0] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v10, v11, v12, v13);
  [v4 respondWithPayload:v9];
}

void __47__HMDMetricsManager__handleFetchEventCounters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 description];
  [v4 setObject:v5 forKey:v6];
}

- (void)_handleListEphemeralContainers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMetricsManager *)self _canRunCountersManagerCommand:v4])
  {
    id v5 = [(HMMCountersManager *)self->_bridgedCountersManager managedEphemeralContainers];
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isActive", (void)v17));
          id v14 = [v12 containerName];
          [v6 setObject:v13 forKeyedSubscript:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v9);
    }

    long long v21 = @"ephemeralContainers";
    v15 = (void *)[v6 copy];
    long long v22 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v4 respondWithPayload:v16];
  }
}

- (void)_handleStartupEphemeralContainer:(id)a3
{
  id v7 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    id v4 = [v7 stringForKey:@"ephemeralContainerName"];
    id v5 = [(HMDMetricsManager *)self userDefaults];
    id v6 = v5;
    if (v4) {
      [v5 setObject:v4 forKey:@"HMDStartupEphemeralContainer"];
    }
    else {
      [v5 removeObjectForKey:@"HMDStartupEphemeralContainer"];
    }

    [v7 respondWithSuccess];
  }
}

- (void)_handleDeleteEphemeralContainer:(id)a3
{
  id v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    id v4 = [v6 stringForKey:@"ephemeralContainerName"];
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Ephemeral container name required"];
      [v6 respondWithError:v5];
    }
    [(HMMCountersManager *)self->_bridgedCountersManager removeEphemeralContainerWithName:v4];
    [v6 respondWithSuccess];
  }
}

- (void)_handleDeactivateEphemeralContainer:(id)a3
{
  id v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    id v4 = [v6 stringForKey:@"ephemeralContainerName"];
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Ephemeral container name required"];
      [v6 respondWithError:v5];
    }
    [(HMMCountersManager *)self->_bridgedCountersManager deactivateEphemeralContainerWithName:v4];
    [v6 respondWithSuccess];
  }
}

- (void)_handleAddEphemeralContainer:(id)a3
{
  id v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    id v4 = [v6 stringForKey:@"ephemeralContainerName"];
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Ephemeral container name required"];
      [v6 respondWithError:v5];
    }
    [(HMMCountersManager *)self->_bridgedCountersManager addEphemeralContainerWithName:v4];
    [v6 respondWithSuccess];
  }
}

- (void)_handleDeleteCounters:(id)a3
{
  id v6 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    id v4 = [v6 dateForKey:@"beforeDate"];
    id v5 = [v6 dateForKey:@"afterDate"];
    if (v4) {
      [(HMMCountersManager *)self->_bridgedCountersManager deletePartitionsBeforeDate:v4];
    }
    if (v5) {
      [(HMMCountersManager *)self->_bridgedCountersManager deletePartitionsAfterDate:v5];
    }
    [v6 respondWithSuccess];
  }
}

- (void)_handleSaveCounters:(id)a3
{
  id v4 = a3;
  if (-[HMDMetricsManager _canRunCountersManagerCommand:](self, "_canRunCountersManagerCommand:"))
  {
    [(HMMCountersManager *)self->_bridgedCountersManager save];
    [v4 respondWithSuccess];
  }
}

- (void)_handleReadCounters:(id)a3
{
  v75[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMetricsManager *)self _canRunCountersManagerCommand:v4])
  {
    id v5 = [v4 stringForKey:@"groupName"];
    id v6 = [v4 stringForKey:@"homeUUID"];
    id v7 = [v4 stringForKey:@"accessoryUUID"];
    uint64_t v8 = [v4 stringForKey:@"counter"];
    uint64_t v9 = [v4 stringForKey:@"statistics"];
    v54 = [v4 dateForKey:@"partition"];
    v55 = [v4 stringForKey:@"ephemeralContainerName"];
    if (v8 && v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = @"You can only choose a counter or statistic and not both";
    }
    else
    {
      if (!v54 || !v55)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        id v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
        [v13 setLocale:v14];

        [v13 setDateFormat:@"MM/dd/yyyy"];
        v15 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
        v53 = v13;
        [v13 setTimeZone:v15];

        v16 = [MEMORY[0x1E4F1CA48] array];
        if (!v9)
        {
          bridgedCountersManager = self->_bridgedCountersManager;
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __41__HMDMetricsManager__handleReadCounters___block_invoke;
          v65[3] = &unk_1E6A0D478;
          id v66 = v5;
          id v67 = v6;
          id v68 = v7;
          id v69 = v55;
          id v70 = v8;
          id v71 = v16;
          id v72 = v54;
          id v73 = v13;
          [(HMMCountersManager *)bridgedCountersManager enumerateCounterGroupsUsingBlock:v65];
        }
        if (!v8)
        {
          long long v18 = self->_bridgedCountersManager;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __41__HMDMetricsManager__handleReadCounters___block_invoke_2;
          v56[3] = &unk_1E6A0D4A0;
          id v57 = v5;
          id v58 = v6;
          id v59 = v7;
          id v60 = v55;
          id v61 = v9;
          id v62 = v16;
          id v63 = v54;
          id v64 = v13;
          [(HMMCountersManager *)v18 enumerateStatisticsGroupsUsingBlock:v56];
        }
        v49 = v16;
        v50 = v7;
        v51 = v6;
        v52 = v5;
        long long v19 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v20 = [MEMORY[0x1E4F65548] productInfo];
        long long v21 = [MEMORY[0x1E4F65570] systemInfo];
        long long v22 = [(HMDMetricsManager *)self cachedConfiguration];
        long long v23 = [v20 softwareVersion];
        uint64_t v24 = [v23 buildVersion];
        [v19 setObject:v24 forKeyedSubscript:@"build"];

        v25 = [v20 modelIdentifier];
        [v19 setObject:v25 forKeyedSubscript:@"model"];

        v48 = v21;
        v26 = [v21 serialNumber];
        [v19 setObject:v26 forKeyedSubscript:@"serialNumber"];

        [v20 productPlatform];
        uint64_t v27 = HMFProductPlatformToString();
        [v19 setObject:v27 forKeyedSubscript:@"platform"];

        v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalHomes"));
        [v19 setObject:v28 forKeyedSubscript:@"totalHomes"];

        v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "totalUsers"));
        [v19 setObject:v29 forKeyedSubscript:@"totalUsers"];

        v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalAccessories"));
        [v19 setObject:v30 forKeyedSubscript:@"totalAccessories"];

        v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalHAPAccessories"));
        [v19 setObject:v31 forKeyedSubscript:@"totalHAPAccessories"];

        v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalCHIPAccessories"));
        [v19 setObject:v32 forKeyedSubscript:@"totalMatterAccessories"];

        v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalThreadAccessories"));
        [v19 setObject:v33 forKeyedSubscript:@"totalThreadAccessories"];

        v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalCameraAccessories"));
        [v19 setObject:v34 forKeyedSubscript:@"totalCameraAccessories"];

        v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalAppleAudioAccessories"));
        [v19 setObject:v35 forKeyedSubscript:@"totalAppleAudioAccessories"];

        v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalAppleTVAccessories"));
        [v19 setObject:v36 forKeyedSubscript:@"totalAppleTVAccessories"];

        v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalScenes"));
        [v19 setObject:v37 forKeyedSubscript:@"totalScenes"];

        v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "totalTriggers"));
        [v19 setObject:v38 forKeyedSubscript:@"totalTriggers"];

        v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "totalWidgets"));
        [v19 setObject:v39 forKeyedSubscript:@"totalWidgets"];

        v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "isFMFDevice"));
        [v19 setObject:v40 forKeyedSubscript:@"isFMFDevice"];

        [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isHH2Enabled"];
        if (v55)
        {
          v41 = NSNumber;
          v42 = [(HMMCountersManager *)self->_bridgedCountersManager managedEphemeralContainerForName:v55];
          [v42 activeDuration];
          v44 = [v41 numberWithLong:llround(v43)];
          [v19 setObject:v44 forKeyedSubscript:@"durationSecs"];
        }
        v74[0] = @"commonDimensions";
        v45 = (void *)[v19 copy];
        v74[1] = @"groups";
        v75[0] = v45;
        v46 = (void *)[v49 copy];
        v75[1] = v46;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
        [v4 respondWithPayload:v47];

        id v6 = v51;
        id v5 = v52;
        id v7 = v50;
        goto LABEL_16;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = @"You can only choose a partition or ephemeral container and not both";
    }
    uint64_t v12 = [v10 hmfErrorWithCode:3 reason:v11];
    [v4 respondWithError:v12];

LABEL_16:
  }
}

void __41__HMDMetricsManager__handleReadCounters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v41 = a3;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v3 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6A218]];
    if (![v8 isEqual:v3])
    {
LABEL_29:

      goto LABEL_30;
    }
  }
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v4 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6A220]];
    if (([v9 isEqual:v4] & 1) == 0)
    {

      if (!v8) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    uint64_t v10 = *(void **)(a1 + 48);
    if (!v10)
    {
      int v11 = 1;
LABEL_9:

LABEL_10:
      if (v8) {
        goto LABEL_11;
      }
      goto LABEL_16;
    }
LABEL_8:
    uint64_t v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6A210]];
    int v11 = [v10 isEqual:v12];

    if (!v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v10 = *(void **)(a1 + 48);
  if (v10) {
    goto LABEL_8;
  }
  int v11 = 1;
  if (v8)
  {
LABEL_11:

    if ((v11 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_17;
  }
LABEL_16:
  if (v11)
  {
LABEL_17:
    if (*(void *)(a1 + 56))
    {
      id v3 = [MEMORY[0x1E4F1CA60] dictionary];
      [v3 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"container"];
      id v13 = (void *)[v7 copy];
      [v3 setObject:v13 forKeyedSubscript:@"descriptor"];

      uint64_t v14 = *(void *)(a1 + 64);
      if (v14)
      {
        uint64_t v15 = [v41 valueForCounter:v14 inEphemeralContainer:*(void *)(a1 + 56)];
        if (!v15) {
          goto LABEL_27;
        }
        uint64_t v50 = *(void *)(a1 + 64);
        v16 = [NSNumber numberWithInteger:v15];
        v51[0] = v16;
        long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
        long long v18 = _counterArrayFromDictionary(v17);
        [v3 setObject:v18 forKeyedSubscript:@"counters"];
      }
      else
      {
        v16 = [v41 countersInEphemeralContainer:*(void *)(a1 + 56)];
        if (![v16 count])
        {
LABEL_26:

LABEL_27:
          long long v20 = [v3 objectForKeyedSubscript:@"counters"];

          if (v20)
          {
            long long v21 = *(void **)(a1 + 72);
            long long v22 = (void *)[v3 copy];
            [v21 addObject:v22];
          }
          goto LABEL_29;
        }
        long long v17 = _counterArrayFromDictionary(v16);
        [v3 setObject:v17 forKeyedSubscript:@"counters"];
      }

      goto LABEL_26;
    }
    if (*(void *)(a1 + 80))
    {
      uint64_t v49 = *(void *)(a1 + 80);
      long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    }
    else
    {
      long long v19 = [v41 datePartitions];
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = v19;
    uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (!v23)
    {
LABEL_48:

      goto LABEL_30;
    }
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    id v26 = v7;
LABEL_34:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v43 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * v27);
      v29 = [MEMORY[0x1E4F1CA60] dictionary];
      v30 = [*(id *)(a1 + 88) stringFromDate:v28];
      [v29 setObject:v30 forKeyedSubscript:@"partition"];

      v31 = (void *)[v7 copy];
      [v29 setObject:v31 forKeyedSubscript:@"descriptor"];

      uint64_t v32 = *(void *)(a1 + 64);
      if (!v32) {
        break;
      }
      uint64_t v33 = [v41 valueForCounter:v32 inDatePartition:v28];
      if (v33)
      {
        uint64_t v46 = *(void *)(a1 + 64);
        v34 = [NSNumber numberWithInteger:v33];
        v47 = v34;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        v36 = _counterArrayFromDictionary(v35);
        [v29 setObject:v36 forKeyedSubscript:@"counters"];

        goto LABEL_42;
      }
LABEL_44:
      v37 = [v29 objectForKeyedSubscript:@"counters"];

      if (v37)
      {
        v38 = *(void **)(a1 + 72);
        v39 = (void *)[v29 copy];
        [v38 addObject:v39];
      }
      ++v27;
      id v7 = v26;
      if (v24 == v27)
      {
        uint64_t v24 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (!v24) {
          goto LABEL_48;
        }
        goto LABEL_34;
      }
    }
    v34 = [v41 countersInDatePartition:v28];
    if ([v34 count])
    {
      v35 = _counterArrayFromDictionary(v34);
      [v29 setObject:v35 forKeyedSubscript:@"counters"];
LABEL_42:
    }
    goto LABEL_44;
  }
LABEL_30:
}

void __41__HMDMetricsManager__handleReadCounters___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v43 = a3;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v3 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6A218]];
    if (![v8 isEqual:v3])
    {
LABEL_29:

      goto LABEL_30;
    }
  }
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v4 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6A220]];
    if (([v9 isEqual:v4] & 1) == 0)
    {

      if (!v8) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    uint64_t v10 = *(void **)(a1 + 48);
    if (!v10)
    {
      int v11 = 1;
LABEL_9:

LABEL_10:
      if (v8) {
        goto LABEL_11;
      }
      goto LABEL_16;
    }
LABEL_8:
    uint64_t v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6A210]];
    int v11 = [v10 isEqual:v12];

    if (!v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v10 = *(void **)(a1 + 48);
  if (v10) {
    goto LABEL_8;
  }
  int v11 = 1;
  if (v8)
  {
LABEL_11:

    if ((v11 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_17;
  }
LABEL_16:
  if (v11)
  {
LABEL_17:
    if (*(void *)(a1 + 56))
    {
      id v3 = [MEMORY[0x1E4F1CA60] dictionary];
      [v3 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"container"];
      id v13 = (void *)[v7 copy];
      [v3 setObject:v13 forKeyedSubscript:@"descriptor"];

      uint64_t v14 = *(void *)(a1 + 64);
      if (v14)
      {
        uint64_t v15 = [v43 statistics:v14 inEphemeralContainer:*(void *)(a1 + 56)];
        v16 = (void *)v15;
        if (v15)
        {
          uint64_t v52 = *(void *)(a1 + 64);
          v53[0] = v15;
          long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
          long long v18 = _statisticsArrayFromDictionary(v17);
          [v3 setObject:v18 forKeyedSubscript:@"statistics"];
        }
      }
      else
      {
        long long v20 = [v43 statisticsInEphemeralContainer:*(void *)(a1 + 56)];
        if ([v20 count])
        {
          long long v21 = _statisticsArrayFromDictionary(v20);
          [v3 setObject:v21 forKeyedSubscript:@"statistics"];
        }
      }
      long long v22 = [v3 objectForKeyedSubscript:@"statistics"];

      if (v22)
      {
        uint64_t v23 = *(void **)(a1 + 72);
        uint64_t v24 = (void *)[v3 copy];
        [v23 addObject:v24];
      }
      goto LABEL_29;
    }
    if (*(void *)(a1 + 80))
    {
      uint64_t v51 = *(void *)(a1 + 80);
      long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    }
    else
    {
      long long v19 = [v43 datePartitions];
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v19;
    uint64_t v25 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (!v25)
    {
LABEL_47:

      goto LABEL_30;
    }
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    id v28 = v7;
LABEL_34:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v45 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8 * v29);
      v31 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v32 = [*(id *)(a1 + 88) stringFromDate:v30];
      [v31 setObject:v32 forKeyedSubscript:@"partition"];

      uint64_t v33 = (void *)[v7 copy];
      [v31 setObject:v33 forKeyedSubscript:@"descriptor"];

      uint64_t v34 = *(void *)(a1 + 64);
      if (v34)
      {
        uint64_t v35 = [v43 statistics:v34 inDatePartition:v30];
        v36 = (void *)v35;
        if (v35)
        {
          uint64_t v48 = *(void *)(a1 + 64);
          uint64_t v49 = v35;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          v38 = _statisticsArrayFromDictionary(v37);
          [v31 setObject:v38 forKeyedSubscript:@"statistics"];

LABEL_42:
        }
      }
      else
      {
        v36 = [v43 statisticsInDatePartition:v30];
        if ([v36 count])
        {
          v37 = _statisticsArrayFromDictionary(v36);
          [v31 setObject:v37 forKeyedSubscript:@"statistics"];
          goto LABEL_42;
        }
      }

      v39 = [v31 objectForKeyedSubscript:@"statistics"];

      if (v39)
      {
        v40 = *(void **)(a1 + 72);
        id v41 = (void *)[v31 copy];
        [v40 addObject:v41];
      }
      ++v29;
      id v7 = v28;
      if (v26 == v29)
      {
        uint64_t v26 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (!v26) {
          goto LABEL_47;
        }
        goto LABEL_34;
      }
    }
  }
LABEL_30:
}

- (BOOL)_canRunCountersManagerCommand:(id)a3
{
  bridgedCountersManager = self->_bridgedCountersManager;
  if (!bridgedCountersManager)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    id v5 = a3;
    id v6 = [v4 hmfErrorWithCode:5 reason:@"New counters manager is not enabled"];
    [v5 respondWithError:v6];
  }
  return bridgedCountersManager != 0;
}

- (void)addRateTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 windowSize:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v18 = [(HMDMetricsManager *)self legacyCountersManager];
  uint64_t v15 = [HMDCounterRateLoggingTrigger alloc];
  v16 = [(HMDMetricsManager *)self ewsLogger];
  long long v17 = [(HMDCounterRateLoggingTrigger *)v15 initWithThreshold:a6 windowSize:a7 counterName:v14 ewsLogger:v16];

  [v18 addObserver:v17 forEventName:v13 requestGroup:v12];
}

- (void)addThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 uploadImmediately:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v18 = [(HMDMetricsManager *)self legacyCountersManager];
  uint64_t v15 = [HMDCounterThresholdLoggingTrigger alloc];
  v16 = [(HMDMetricsManager *)self ewsLogger];
  long long v17 = [(HMDCounterThresholdLoggingTrigger *)v15 initWithThreshold:a6 counterName:v14 uploadImmediately:v7 ewsLogger:v16];

  [v18 addObserver:v17 forEventName:v13 requestGroup:v12];
}

- (void)addThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v16 = [(HMDMetricsManager *)self legacyCountersManager];
  id v13 = [HMDCounterThresholdLoggingTrigger alloc];
  id v14 = [(HMDMetricsManager *)self ewsLogger];
  uint64_t v15 = [(HMDCounterThresholdLoggingTrigger *)v13 initWithThreshold:a6 counterName:v12 ewsLogger:v14];

  [v16 addObserver:v15 forEventName:v11 requestGroup:v10];
}

- (void)startAnalyzers
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMetricsManager *)self logEventDispatcher];
  id v4 = [(HMDMetricsManager *)self processMemoryEventsAnalyzer];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v3 addObserver:v4 forEventClasses:v5];

  id v6 = [(HMDMetricsManager *)self logEventDispatcher];
  BOOL v7 = [(HMDMetricsManager *)self userActivityEventsAnalyzer];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];
  [v6 addObserver:v7 forEventClasses:v8];

  uint64_t v9 = [(HMDMetricsManager *)self logEventDispatcher];
  id v10 = [(HMDMetricsManager *)self hapEventsAnalyzer];
  uint64_t v25 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v9 addObserver:v10 forEventClasses:v11];

  id v12 = [(HMDMetricsManager *)self logEventDispatcher];
  id v13 = [(HMDMetricsManager *)self firmwareUpdateEventsAnalyzer];
  uint64_t v24 = objc_opt_class();
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v12 addObserver:v13 forEventClasses:v14];

  uint64_t v15 = [(HMDMetricsManager *)self logEventDispatcher];
  id v16 = [(HMDMetricsManager *)self reachabilityEventsAnalyzer];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  [v15 addObserver:v16 forEventClasses:v17];

  if (isInternalBuild())
  {
    id v18 = [(HMDMetricsManager *)self eventCountingAnalyzer];

    if (v18)
    {
      long long v19 = [(HMDMetricsManager *)self logEventDispatcher];
      long long v20 = [(HMDMetricsManager *)self eventCountingAnalyzer];
      [v19 addObserver:v20 forProtocol:&unk_1F2DCC580];
    }
  }
  long long v21 = [(HMDMetricsManager *)self logEventDispatcher];
  long long v22 = [(HMDMetricsManager *)self widgetTimelineRefresherEventsAnalyzer];
  [v21 addObserver:v22 forEventClass:objc_opt_class()];
}

- (void)registerTaggedLoggingProcessors
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F6A2A8];
  v6[0] = *MEMORY[0x1E4F6A078];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HMDMetricsManager_registerTaggedLoggingProcessors__block_invoke;
  v5[3] = &unk_1E6A0D450;
  v5[4] = self;
  [v3 addObserverForStartTags:v4 usingCreatorBlock:v5];
}

HMDMatterThirdPartyPairingTagProcessor *__52__HMDMetricsManager_registerTaggedLoggingProcessors__block_invoke(uint64_t a1)
{
  id v2 = [HMDMatterThirdPartyPairingTagProcessor alloc];
  id v3 = [*(id *)(a1 + 32) logEventSubmitter];
  id v4 = [(HMDMatterThirdPartyPairingTagProcessor *)v2 initWithSubmitter:v3];

  return v4;
}

- (BOOL)updateCachedWidgetCount
{
  id v3 = [(HMDMetricsManager *)self homeManager];
  id v4 = [v3 widgetConfigurationReader];
  int64_t v5 = [v4 homeWidgetsEnabledCount];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v5 < 0 || v5 == self->_configuredWidgetsCount)
  {
    BOOL v7 = 0;
  }
  else
  {
    self->_configuredWidgetsCount = v5;
    BOOL v7 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)accessoryForIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int64_t v5 = [(HMDMetricsManager *)self homeManager];
  id v6 = [v5 homes];

  uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v7 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = objc_msgSend(v9, "accessories", v20);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v16 = [v15 identifier];
              char v17 = [v16 isEqual:v4];

              if (v17)
              {
                id v18 = v15;

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
      }
      id v18 = 0;
      uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)cachedHomeConfigurationForHomeUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int64_t v5 = [(HMDMetricsManager *)self cachedConfiguration];
  id v6 = [v5 homeConfigurations];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 homeUUID];
        char v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (HMDConfigurationLogEvent)cachedConfiguration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_cachedConfiguration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)notifyConfigurationObserversWithUpdatedEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = [(HMDMetricsManager *)self configurationObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)updateCachedConfiguration
{
  id v3 = +[HMDHAPMetadata getSharedInstance];
  id v4 = [v3 version];
  uint64_t v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = [HMDConfigurationLogEvent alloc];
  uint64_t v7 = [(HMDMetricsManager *)self homeManager];
  uint64_t v8 = [(HMDConfigurationLogEvent *)v6 initWithHomeManager:v7 widgetDataSource:self metadataVersion:v5];

  os_unfair_lock_lock_with_options();
  cachedConfiguration = self->_cachedConfiguration;
  self->_cachedConfiguration = v8;
  long long v10 = v8;

  os_unfair_lock_unlock(&self->_lock);
  [(HMDMetricsManager *)self notifyConfigurationObserversWithUpdatedEvent:v10];
}

- (void)homeKitConfigurationChanged
{
  id v3 = [(HMDMetricsManager *)self homeManager];
  if (v3)
  {
    id v4 = [(HMDMetricsManager *)self processLaunchEventsAnalyzer];
    [v4 homeKitConfigurationChangedWithHomeManager:v3];

    uint64_t v5 = [(HMDMetricsManager *)self cachedConfiguration];

    if (v5)
    {
      [(HMDMetricsManager *)self updateCachedConfiguration];
    }
    else
    {
      uint64_t v6 = [(HMDMetricsManager *)self logEventDispatcher];
      uint64_t v7 = [v6 clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__HMDMetricsManager_homeKitConfigurationChanged__block_invoke;
      block[3] = &unk_1E6A19B30;
      block[4] = self;
      dispatch_async(v7, block);
    }
  }
}

void __48__HMDMetricsManager_homeKitConfigurationChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCachedWidgetCount];
  [*(id *)(a1 + 32) updateCachedConfiguration];
  id v3 = [*(id *)(a1 + 32) logEventDispatcher];
  id v2 = [*(id *)(a1 + 32) cachedConfiguration];
  [v3 submitLogEvent:v2];
}

- (NSArray)configurationObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_configurationObservers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addConfigurationChangedObserver:(id)a3
{
  id aBlock = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configurationObservers = self->_configurationObservers;
  uint64_t v6 = _Block_copy(aBlock);
  [(NSMutableArray *)configurationObservers addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)submitHAPMetricsCounters
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(HMDHAPMetricsLogEvent);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v21 = self;
  id v4 = [(HMDMetricsManager *)self homeManager];
  uint64_t v5 = [v4 homes];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v11 = [v10 hapAccessories];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              long long v17 = [v16 identifier];
              id v18 = [v16 matchingHAPAccessoryWithServerIdentifier:v17];

              uint64_t v19 = [v18 server];
              if (v19) {
                [(HMDHAPMetricsLogEvent *)v3 updateWithHAPAccessoryServer:v19];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  uint64_t v20 = [(HMDMetricsManager *)v21 logEventDispatcher];
  [v20 submitLogEvent:v3];
}

- (void)logEventAggregationAnalysisLogEvents
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMetricsManager *)self dateProvider];
  id v4 = [v3 startOfCurrentDay];

  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(HMDMetricsManager *)v6 homeKitAggregationAnalysisLogEventForDate:v4];
    long long v10 = [v9 description];
    int v17 = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Current state of aggregated event counts since last metric submission (reset every 24 hrs): %{public}@", (uint8_t *)&v17, 0x16u);
  }
  long long v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = v6;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDMetricsManager *)v12 errorEventsAnalyzer];
    long long v16 = [v15 errorEventsAnalyzedSummaryForDate:v4];
    int v17 = 138543618;
    id v18 = v14;
    __int16 v19 = 2114;
    uint64_t v20 = v16;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Current state of aggregated error counts since last metric submission (reset every 24 hrs): %{public}@", (uint8_t *)&v17, 0x16u);
  }
}

- (void)timerDidFire:(id)a3
{
  [(HMDMetricsManager *)self logEventAggregationAnalysisLogEvents];
  [(HMDMetricsManager *)self submitHAPMetricsCounters];
}

- (void)resetHomeKitAggregationAnalysisContext
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(HMDMetricsManager *)self aggregationAnalysisEventContributingAnalyzers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resetAggregationAnalysisContext];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)homeKitAggregationAnalysisLogEventForDate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HMDAggregationAnalysisLogEvent);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(HMDMetricsManager *)self aggregationAnalysisEventContributingAnalyzers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) populateAggregationAnalysisLogEvent:v5 forDate:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)submitDailyAggregationAnalysisEvents
{
  uint64_t v3 = [(HMDMetricsManager *)self logEventDispatcher];
  id v4 = [v3 clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDMetricsManager_submitDailyAggregationAnalysisEvents__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __57__HMDMetricsManager_submitDailyAggregationAnalysisEvents__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dateProvider];
  id v10 = [v2 startOfDayByAddingDayCount:-1];

  uint64_t v3 = [*(id *)(a1 + 32) homeKitAggregationAnalysisLogEventForDate:v10];
  id v4 = [*(id *)(a1 + 32) cloudSyncLogEventsAnalyzer];
  uint64_t v5 = [v4 cloudSyncAnalysisResultForDate:v10];

  [*(id *)(a1 + 32) resetHomeKitAggregationAnalysisContext];
  uint64_t v6 = [*(id *)(a1 + 32) cloudSyncLogEventsAnalyzer];
  [v6 resetDataSource];

  uint64_t v7 = [*(id *)(a1 + 32) legacyCountersManager];
  [v7 forceSave];

  uint64_t v8 = [*(id *)(a1 + 32) logEventDispatcher];
  [v8 submitLogEvent:v3];

  uint64_t v9 = [*(id *)(a1 + 32) logEventDispatcher];
  [v9 submitLogEvent:v5];
}

- (void)submitCurrentUserSettings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(HMDMetricsManager *)self homeManager];
  id v4 = [v3 homes];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = [HMDUserSettingsPerHomeLogEvent alloc];
        long long v11 = [v9 currentUser];
        long long v12 = [(HMDUserSettingsPerHomeLogEvent *)v10 initWithUser:v11];

        long long v13 = [(HMDMetricsManager *)self logEventDispatcher];
        [v13 submitLogEvent:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)runDailyTask
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v4 = [v3 productVariant];

  if (v4 == 3)
  {
    uint64_t v5 = [MEMORY[0x1E4F65570] systemInfo];
    uint64_t v6 = [v5 serialNumber];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      uint64_t v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v45 = v10;
        __int16 v46 = 2112;
        long long v47 = v6;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[CA] Serial Number: %@", buf, 0x16u);
      }
    }
  }
  if ([(HMDMetricsManager *)self updateCachedWidgetCount]) {
    [(HMDMetricsManager *)self homeKitConfigurationChanged];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v11 = [(HMDMetricsManager *)self cachedConfiguration];
  long long v12 = [v11 homeConfigurations];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * v16);
        id v18 = [(HMDMetricsManager *)self logEventDispatcher];
        [v18 submitLogEvent:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v14);
  }

  uint64_t v19 = [(HMDMetricsManager *)self logEventDispatcher];
  uint64_t v20 = [(HMDMetricsManager *)self cachedConfiguration];
  [v19 submitLogEvent:v20];

  [(HMDMetricsManager *)self submitCurrentUserSettings];
  uint64_t v21 = [HMDCameraConfigurationsLogEvent alloc];
  long long v22 = (void *)MEMORY[0x1E4F1C978];
  long long v23 = [(HMDMetricsManager *)self homeManager];
  long long v24 = [v23 homes];
  long long v25 = [v22 arrayWithArray:v24];
  long long v26 = [(HMDCameraConfigurationsLogEvent *)v21 initWithHomes:v25];

  long long v27 = [(HMDMetricsManager *)self logEventDispatcher];
  [v27 submitLogEvent:v26];

  long long v28 = objc_alloc_init(HMDWatchConnectivityLogEvent);
  long long v29 = [(HMDMetricsManager *)self logEventDispatcher];
  [v29 submitLogEvent:v28];

  long long v30 = [(HMDMetricsManager *)self messagingEventsAnalyzer];
  [v30 submitDailyMessageEvents];

  [(HMDMetricsManager *)self submitDailyAggregationAnalysisEvents];
  v31 = [MEMORY[0x1E4F1CA60] dictionary];
  if (isInternalBuild())
  {
    uint64_t v32 = [(HMDMetricsManager *)self PRKitUUIDString];
    [v31 setObject:v32 forKeyedSubscript:@"HomePRKitUUID"];

    uint64_t v33 = [(HMDMetricsManager *)self PRKitDateString];
    [v31 setObject:v33 forKeyedSubscript:@"HomePRKitDate"];
  }
  uint64_t v34 = [(HMDMetricsManager *)self ewsLogger];
  [v34 submitEventWithName:@"Daily heartbeat" serviceName:@"EWS Heartbeat" uploadImmediately:0 payload:v31];

  uint64_t v35 = [(HMDMetricsManager *)self dateProvider];
  v36 = [v35 startOfDayByAddingDayCount:-7];

  v37 = [(HMDMetricsManager *)self dateProvider];
  v38 = [v37 startOfDayByAddingDayCount:1];

  [(HMMCountersManager *)self->_bridgedCountersManager deletePartitionsBeforeDate:v36];
  [(HMMCountersManager *)self->_bridgedCountersManager deletePartitionsAfterDate:v38];
}

- (void)startMetricsCollection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDMetricsManager *)self metricsCollectionStarted])
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = self;
    HMFGetOSLogHandle();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Metrics collection already started", (uint8_t *)&v19, 0xCu);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(HMDMetricsManager *)self setMetricsCollectionStarted:1];
    os_unfair_lock_unlock(p_lock);
    uint64_t v8 = [(HMDMetricsManager *)self logEventDispatcher];
    uint64_t v9 = [(HMDMetricsManager *)self coreAnalyticsObserver];
    [v8 addObserver:v9 forProtocol:&unk_1F2DCDC30];

    [(HMDMetricsManager *)self registerTaggedLoggingProcessors];
    id v10 = [(HMDMetricsManager *)self diagnosticReporterLogObserver];
    [v10 start];

    long long v11 = [(HMDMetricsManager *)self powerLogObserver];
    [v11 start];

    long long v12 = [(HMDMetricsManager *)self coreAnalyticsTagObserver];
    [v12 configure];

    [(HMDMetricsManager *)self startAnalyzers];
    uint64_t v13 = [(HMDMetricsManager *)self dailyScheduler];
    [v13 registerDailyTaskRunner:self];

    os_unfair_lock_lock_with_options();
    uint64_t v14 = (void *)bufferedSubmitter;
    uint64_t v15 = [(HMDMetricsManager *)self logEventDispatcher];
    [v14 processLogEventsWithSubmitter:v15];

    uint64_t v16 = (void *)bufferedSubmitter;
    bufferedSubmitter = 0;

    uint64_t v17 = [(HMDMetricsManager *)self logEventDispatcher];
    id v18 = (void *)sharedDispatcher;
    sharedDispatcher = v17;

    os_unfair_lock_unlock((os_unfair_lock_t)&sharedSubmitterLock);
  }
}

- (void)configureHAPMetricsDispatcher:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMetricsManager *)self logEventDispatcher];
  [v4 setLogDispatcher:v5];
}

- (void)_registerForMessages
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v4 = [v3 productVariant];

  if (v4 == 3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v58 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for homeutil messages", buf, 0xCu);
    }
    uint64_t v9 = [(HMDMetricsManager *)v6 messageDispatcher];
    id v10 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v56 = v10;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    [v9 registerForMessage:@"readCounters" receiver:v6 policies:v11 selector:sel__handleReadCounters_];

    long long v12 = [(HMDMetricsManager *)v6 messageDispatcher];
    uint64_t v13 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v55 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    [v12 registerForMessage:@"saveCounters" receiver:v6 policies:v14 selector:sel__handleSaveCounters_];

    uint64_t v15 = [(HMDMetricsManager *)v6 messageDispatcher];
    uint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v54 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    [v15 registerForMessage:@"deleteCounters" receiver:v6 policies:v17 selector:sel__handleDeleteCounters_];

    id v18 = [(HMDMetricsManager *)v6 messageDispatcher];
    int v19 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v53 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    [v18 registerForMessage:@"addEphemeralContainer" receiver:v6 policies:v20 selector:sel__handleAddEphemeralContainer_];

    uint64_t v21 = [(HMDMetricsManager *)v6 messageDispatcher];
    long long v22 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v52 = v22;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    [v21 registerForMessage:@"deactivateEphemeralContainer" receiver:v6 policies:v23 selector:sel__handleDeactivateEphemeralContainer_];

    long long v24 = [(HMDMetricsManager *)v6 messageDispatcher];
    long long v25 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v51 = v25;
    long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [v24 registerForMessage:@"deleteEphemeralContainer" receiver:v6 policies:v26 selector:sel__handleDeleteEphemeralContainer_];

    long long v27 = [(HMDMetricsManager *)v6 messageDispatcher];
    long long v28 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v50 = v28;
    long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [v27 registerForMessage:@"startupEphemeralContainer" receiver:v6 policies:v29 selector:sel__handleStartupEphemeralContainer_];

    long long v30 = [(HMDMetricsManager *)v6 messageDispatcher];
    v31 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v49 = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    [v30 registerForMessage:@"listEphemeralContainers" receiver:v6 policies:v32 selector:sel__handleListEphemeralContainers_];

    uint64_t v33 = [(HMDMetricsManager *)v6 messageDispatcher];
    uint64_t v34 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v48 = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v33 registerForMessage:@"fetchEventCounters" receiver:v6 policies:v35 selector:sel__handleFetchEventCounters_];

    v36 = [(HMDMetricsManager *)v6 messageDispatcher];
    v37 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    long long v47 = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v36 registerForMessage:@"resetEventCounters" receiver:v6 policies:v38 selector:sel__handleResetEventCounters_];

    long long v39 = [(HMDMetricsManager *)v6 messageDispatcher];
    long long v40 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    __int16 v46 = v40;
    long long v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [v39 registerForMessage:@"logEventDailySchedulerRequestStatus" receiver:v6 policies:v41 selector:sel__handleLogEventDailySchedulerStatusRequest_];

    long long v42 = [(HMDMetricsManager *)v6 messageDispatcher];
    id v43 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    long long v45 = v43;
    long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v42 registerForMessage:@"logEventDailySchedulerRunRegisteredBlocks" receiver:v6 policies:v44 selector:sel__handleLogEventDailySchedulerSubmitRequest_];
  }
}

- (void)_configureManagers
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[HMDMetricsAccessoryDetailsManager alloc] initWithDataSource:self];
  accessoryDetailsManager = self->_accessoryDetailsManager;
  self->_accessoryDetailsManager = v3;

  id v5 = [HMDHouseholdMetricsManager alloc];
  uint64_t v6 = [(HMDMetricsManager *)self legacyCountersManager];
  uint64_t v7 = [(HMDMetricsManager *)self accessoryDetailsManager];
  uint64_t v8 = [(HMDMetricsManager *)self dailyScheduler];
  uint64_t v9 = [(HMDMetricsManager *)self logEventDispatcher];
  dateProvider = self->_dateProvider;
  v14[0] = self->_userActivityEventsAnalyzer;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  long long v12 = [(HMDHouseholdMetricsManager *)v5 initWithCountersManager:v6 dataSource:self accessoryDetailsManager:v7 dailyScheduler:v8 logEventSubmitter:v9 dateProvider:dateProvider activityContributors:v11];
  householdMetricsManager = self->_householdMetricsManager;
  self->_householdMetricsManager = v12;
}

- (void)addAnalyzer:(id)a3 toListOfAggregationAnalysisEventContributing:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 conformsToProtocol:&unk_1F2E06AC0]) {
    [v5 addObject:v6];
  }
}

- (void)_configureObservers
{
  v59[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[HMDCoreAnalyticsLogEventObserverDelegate alloc] initWithDataSource:self];
  coreAnalyticsDelegate = self->_coreAnalyticsDelegate;
  self->_coreAnalyticsDelegate = v3;

  id v5 = [[HMDLogEventWeekBasedFilter alloc] initWithDateProvider:self->_dateProvider];
  v59[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
  coreAnalyticsFilters = self->_coreAnalyticsFilters;
  self->_coreAnalyticsFilters = v6;

  uint64_t v8 = (HMMCoreAnalyticsLogEventObserver *)[objc_alloc(MEMORY[0x1E4F6A250]) initWithDelegate:self->_coreAnalyticsDelegate filters:self->_coreAnalyticsFilters];
  coreAnalyticsObserver = self->_coreAnalyticsObserver;
  self->_coreAnalyticsObserver = v8;

  id v10 = [[HMDDiagnosticReporterLogObserver alloc] initWithLogEventDispatcher:self->_logEventDispatcher];
  diagnosticReporterLogObserver = self->_diagnosticReporterLogObserver;
  self->_diagnosticReporterLogObserver = v10;

  long long v12 = [[HMDPowerLogObserver alloc] initWithLogEventDispatcher:self->_logEventDispatcher];
  powerLogObserver = self->_powerLogObserver;
  self->_powerLogObserver = v12;

  id v14 = objc_alloc(MEMORY[0x1E4F6A290]);
  uint64_t v15 = [MEMORY[0x1E4F9F9A8] sharedStream];
  uint64_t v16 = (HMMSiriSELFLogEventObserver *)[v14 initWithSiriAnalyticsStream:v15 logEventDispatcher:self->_logEventDispatcher];
  siriSELFLoggingObserver = self->_siriSELFLoggingObserver;
  self->_siriSELFLoggingObserver = v16;

  id v18 = [HMDHH2AutoMigrationEligibilityLogEventSubmitter alloc];
  int v19 = dispatch_get_global_queue(-32768, 0);
  uint64_t v20 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)v18 initWithEligibilityStatusDataSource:self analyzerDataSource:self workQueue:v19];
  hh2AutoMigrationEligibilitySubmitter = self->_hh2AutoMigrationEligibilitySubmitter;
  self->_hh2AutoMigrationEligibilitySubmitter = v20;

  if (isInternalBuild())
  {
    long long v22 = [HMDLogEventCountingAnalyzer alloc];
    legacyCountersManager = self->_legacyCountersManager;
    dailyScheduler = self->_dailyScheduler;
    dateProvider = self->_dateProvider;
    long long v26 = [MEMORY[0x1E4F65570] systemInfo];
    long long v27 = [(HMMLogEventDispatching *)self->_logEventDispatcher clientQueue];
    long long v28 = [(HMDLogEventCountingAnalyzer *)v22 initWithEventCountersManager:legacyCountersManager dailyScheduler:dailyScheduler dateProvider:dateProvider systemInfo:v26 queue:v27];
    eventCountingAnalyzer = self->_eventCountingAnalyzer;
    self->_eventCountingAnalyzer = v28;

    long long v30 = [[HMDHH2MigrationLogEventsAnalyzer alloc] initWithDataSource:self];
    hh2MigrationAnalyzer = self->_hh2MigrationAnalyzer;
    self->_hh2MigrationAnalyzer = v30;
  }
  uint64_t v32 = [[HMDCloudSyncLogEventsAnalyzer alloc] initWithDataSource:self];
  cloudSyncLogEventsAnalyzer = self->_cloudSyncLogEventsAnalyzer;
  self->_cloudSyncLogEventsAnalyzer = v32;

  [(HMDMetricsManager *)self addAnalyzer:self->_cloudSyncLogEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  uint64_t v34 = [[HMDLogEventErrorEventsAnalyzer alloc] initWithDataSource:self];
  errorEventsAnalyzer = self->_errorEventsAnalyzer;
  self->_errorEventsAnalyzer = v34;

  [(HMDMetricsManager *)self addAnalyzer:self->_errorEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  v36 = [[HMDLogEventHAPMetricsEventAnalyzer alloc] initWithEventCountersManager:self->_legacyCountersManager];
  hapEventsAnalyzer = self->_hapEventsAnalyzer;
  self->_hapEventsAnalyzer = v36;

  [(NSMutableArray *)self->_aggregationAnalysisEventContributingAnalyzers addObject:self->_hapEventsAnalyzer];
  v38 = [[HMDLogEventMessageEventsAnalyzer alloc] initWithDataSource:self];
  messagingEventsAnalyzer = self->_messagingEventsAnalyzer;
  self->_messagingEventsAnalyzer = v38;

  [(HMDMetricsManager *)self addAnalyzer:self->_messagingEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  long long v40 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:8 options:300.0];
  long long v41 = [[HMDMetricsPreferencesDebugManager alloc] initWithDataSource:self];
  preferencesDebugManager = self->_preferencesDebugManager;
  self->_preferencesDebugManager = v41;

  id v43 = [[HMDLogEventProcessLaunchAnalyzer alloc] initWithProcessLaunchInfoTimer:v40 dataSource:self preferencesDebugManager:self->_preferencesDebugManager];
  processLaunchEventsAnalyzer = self->_processLaunchEventsAnalyzer;
  self->_processLaunchEventsAnalyzer = v43;

  [(HMDMetricsManager *)self addAnalyzer:self->_processLaunchEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  long long v45 = [[HMDLogEventProcessMemoryEventsAnalyzer alloc] initWithDataSource:self];
  processMemoryEventsAnalyzer = self->_processMemoryEventsAnalyzer;
  self->_processMemoryEventsAnalyzer = v45;

  [(HMDMetricsManager *)self addAnalyzer:self->_processMemoryEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  long long v47 = [[HMDLogEventReachabilityEventsAnalyzer alloc] initWithEventCountersManager:self->_legacyCountersManager];
  reachabilityEventsAnalyzer = self->_reachabilityEventsAnalyzer;
  self->_reachabilityEventsAnalyzer = v47;

  [(HMDMetricsManager *)self addAnalyzer:self->_reachabilityEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  uint64_t v49 = [[HMDLogEventUserActivityAnalyzer alloc] initWithEventCountersManager:self->_legacyCountersManager flagsManager:self->_flagsManager dateProvider:self->_dateProvider];
  userActivityEventsAnalyzer = self->_userActivityEventsAnalyzer;
  self->_userActivityEventsAnalyzer = v49;

  [(HMDMetricsManager *)self addAnalyzer:self->_userActivityEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  uint64_t v51 = [[HMDLogEventElectionEventsAnalyzer alloc] initWithDataSource:self];
  electionEventsAnalyzer = self->_electionEventsAnalyzer;
  self->_electionEventsAnalyzer = v51;

  [(HMDMetricsManager *)self addAnalyzer:self->_electionEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  v53 = [[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer alloc] initWithEventCountersManager:self->_legacyCountersManager];
  firmwareUpdateEventsAnalyzer = self->_firmwareUpdateEventsAnalyzer;
  self->_firmwareUpdateEventsAnalyzer = v53;

  v55 = [[HMDLogEventBulletinNotificationsAnalyzer alloc] initWithDataSource:self notificationSettingsProvider:self->_notificationSettingsProvider];
  bulletinNotificationsAnalyzer = self->_bulletinNotificationsAnalyzer;
  self->_bulletinNotificationsAnalyzer = v55;

  [(HMDMetricsManager *)self addAnalyzer:self->_bulletinNotificationsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
  id v57 = [[HMDWidgetTimelineRefresherEventsAnalyzer alloc] initWithEventCountersManager:self->_legacyCountersManager logEventSubmitter:self->_logEventDispatcher dailyScheduler:self->_dailyScheduler];
  widgetTimelineRefresherEventsAnalyzer = self->_widgetTimelineRefresherEventsAnalyzer;
  self->_widgetTimelineRefresherEventsAnalyzer = v57;

  [(HMDMetricsManager *)self addAnalyzer:self->_widgetTimelineRefresherEventsAnalyzer toListOfAggregationAnalysisEventContributing:self->_aggregationAnalysisEventContributingAnalyzers];
}

- (HMDMetricsManager)initWithMessageDispatcher:(id)a3 accountManager:(id)a4 notificationSettingsProvider:(id)a5 logEventDispatcher:(id)a6 dailyScheduler:(id)a7 dateProvider:(id)a8 legacyCountersManager:(id)a9 flagsManager:(id)a10 ewsLogger:(id)a11 deviceStateManager:(id)a12 networkObserver:(id)a13 coreAnalyticsTagObserver:(id)a14 backgroundLoggingTimer:(id)a15 radarInitiator:(id)a16 notificationCenter:(id)a17 userDefaults:(id)a18 currentSoftwareVersion:(id)a19
{
  id v57 = a3;
  id v42 = a4;
  id v56 = a4;
  id v43 = a5;
  id v55 = a5;
  id v54 = a6;
  id v53 = a7;
  id v52 = a8;
  id v51 = a9;
  id v50 = a10;
  id v24 = a11;
  id v49 = a12;
  id v48 = a13;
  id v47 = a14;
  id v25 = a15;
  id v46 = a16;
  id v45 = a17;
  id v26 = a18;
  id v27 = a19;
  v58.receiver = self;
  v58.super_class = (Class)HMDMetricsManager;
  long long v28 = [(HMDMetricsManager *)&v58 init];
  long long v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_messageDispatcher, a3);
    objc_storeStrong((id *)&v29->_accountManager, v42);
    objc_storeStrong((id *)&v29->_notificationSettingsProvider, v43);
    objc_storeStrong((id *)&v29->_dailyScheduler, a7);
    objc_storeStrong((id *)&v29->_dateProvider, a8);
    objc_storeStrong((id *)&v29->_legacyCountersManager, a9);
    objc_storeStrong((id *)&v29->_flagsManager, a10);
    objc_storeWeak((id *)&v29->_ewsLogger, v24);
    objc_storeStrong((id *)&v29->_deviceStateManager, a12);
    objc_storeStrong((id *)&v29->_networkObserver, a13);
    objc_storeStrong((id *)&v29->_coreAnalyticsTagObserver, a14);
    objc_storeStrong((id *)&v29->_logEventDispatcher, a6);
    [(HMMLogEventDispatching *)v29->_logEventDispatcher setDataSource:v29];
    [v25 setDelegate:v29];
    long long v30 = [(HMDMetricsManager *)v29 logEventDispatcher];
    v31 = [v30 clientQueue];
    [v25 setDelegateQueue:v31];

    [v25 resume];
    objc_storeStrong((id *)&v29->_backgroundLoggingTimer, a15);
    objc_storeStrong((id *)&v29->_radarInitiator, a16);
    objc_storeStrong((id *)&v29->_notificationCenter, a17);
    objc_storeStrong((id *)&v29->_userDefaults, a18);
    objc_storeStrong((id *)&v29->_currentSoftwareVersion, a19);
    uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
    aggregationAnalysisEventContributingAnalyzers = v29->_aggregationAnalysisEventContributingAnalyzers;
    v29->_aggregationAnalysisEventContributingAnalyzers = (NSMutableArray *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA48] array];
    configurationObservers = v29->_configurationObservers;
    v29->_configurationObservers = (NSMutableArray *)v34;

    if (isInternalBuild())
    {
      v36 = (NSString *)CFPreferencesCopyAppValue(@"HMDUpdaterCurrentUUID", @"com.apple.homed");
      PRKitUUIDString = v29->_PRKitUUIDString;
      v29->_PRKitUUIDString = v36;

      v38 = (NSString *)CFPreferencesCopyAppValue(@"HMDUpdaterCurrentDate", @"com.apple.homed");
      PRKitDateString = v29->_PRKitDateString;
      v29->_PRKitDateString = v38;
    }
    objc_msgSend(v24, "addCommonField:withValue:", @"isHH2Enabled", &unk_1F2DC80C8, a3);
    [(HMDMetricsManager *)v29 _configureObservers];
    [(HMDMetricsManager *)v29 _configureManagers];
    [(HMDMetricsManager *)v29 _registerForMessages];
  }

  return v29;
}

- (HMDMetricsManager)initWithMessageDispatcher:(id)a3 accountManager:(id)a4 notificationSettingsProvider:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v58 = a4;
  id v57 = a5;
  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v9 = objc_alloc_init(MEMORY[0x1E4F6A280]);
  id v51 = +[HMDLogEventDailyScheduler createSchedulerWithLogEventSubmitter:v9];
  uint64_t v10 = [MEMORY[0x1E4F6A268] sharedInstance];
  long long v11 = +[HMDMetricsManager defaultRadarInitiator];
  id v52 = [[HMDTimeBasedFlagsManager alloc] initWithDateProvider:v10];
  LOBYTE(a4) = _os_feature_enabled_impl();
  long long v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  id v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  id v55 = v11;
  id v56 = v8;
  id v53 = v13;
  if (a4)
  {
    if (v15)
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v62 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Using Core Data metric counters", buf, 0xCu);
    }
    id v17 = (id)metricsCountersPersistentStorePath;
    id v18 = objc_alloc(MEMORY[0x1E4F6A260]);
    uint64_t v19 = [v18 initWithDataModelName:*MEMORY[0x1E4F6A208] atPath:v17];
    bridgedCountersManager = v13->_bridgedCountersManager;
    v13->_bridgedCountersManager = (HMMCountersManager *)v19;

    uint64_t v21 = v13->_bridgedCountersManager;
    id v60 = 0;
    int v22 = [(HMMCountersManager *)v21 loadPersistentStoreWithError:&v60];
    id v23 = v60;
    if (v22)
    {
      id v24 = [[HMDEventCountersManager alloc] initWithBridgedCountersManager:v13->_bridgedCountersManager bridgedDateProvider:v10];
      if (isInternalBuild())
      {
        id v25 = [v8 objectForKey:@"HMDStartupEphemeralContainer"];
        if (v25) {
          [(HMMCountersManager *)v13->_bridgedCountersManager addEphemeralContainerWithName:v25];
        }
      }
    }
    else
    {
      id v27 = (void *)MEMORY[0x1D9452090]();
      long long v28 = v13;
      long long v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        long long v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v62 = v30;
        __int16 v63 = 2112;
        id v64 = v23;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new counters manager. Falling back to legacy manager. Error: %@", buf, 0x16u);

        uint64_t v13 = v53;
      }

      [v11 requestRadarWithDisplayReason:@"persistent counter storage failed to load" radarTitle:@"Failed to load persistent counter storage"];
      v31 = v13->_bridgedCountersManager;
      v13->_bridgedCountersManager = 0;

      id v24 = objc_alloc_init(HMDEventCountersManager);
    }
  }
  else
  {
    if (v15)
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v62 = v26;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Using legacy metric counters", buf, 0xCu);
    }
    id v24 = objc_alloc_init(HMDEventCountersManager);
  }
  id v32 = objc_alloc(MEMORY[0x1E4F6A258]);
  uint64_t v33 = [MEMORY[0x1E4F6A2A0] sharedInstance];
  uint64_t v34 = objc_alloc_init(HMDCoreAnalyticsLogEventFactory);
  id v48 = (void *)[v32 initWithTagDispatcher:v33 logEventSubmitter:v9 logEventFactory:v34];

  uint64_t v35 = [[HMDNetworkObserver alloc] initWithLogEventDispatcher:v9 countersManager:v24 dailyScheduler:v51 currentHomeDataSource:v13 dateProvider:v10];
  id v50 = [[HMDMetricsDeviceStateManager alloc] initWithLogEventSubmitter:v9 dailyScheduler:v51 dateProvider:v10];
  v36 = [MEMORY[0x1E4F65530] sharedPreferences];
  v37 = [v36 preferenceForKey:@"backgroundLoggingPeriod"];
  id v49 = [v37 numberValue];

  id v38 = objc_alloc(MEMORY[0x1E4F65580]);
  [v49 doubleValue];
  id v47 = objc_msgSend(v38, "initWithTimeInterval:options:", 4);
  id v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [MEMORY[0x1E4F65548] productInfo];
  v40 = long long v39 = (void *)v10;
  [v40 softwareVersion];
  v42 = long long v41 = v9;
  id v43 = [v42 versionString];

  long long v44 = [MEMORY[0x1E4F6A288] sharedManager];
  id v54 = -[HMDMetricsManager initWithMessageDispatcher:accountManager:notificationSettingsProvider:logEventDispatcher:dailyScheduler:dateProvider:legacyCountersManager:flagsManager:ewsLogger:deviceStateManager:networkObserver:coreAnalyticsTagObserver:backgroundLoggingTimer:radarInitiator:notificationCenter:userDefaults:currentSoftwareVersion:](v53, "initWithMessageDispatcher:accountManager:notificationSettingsProvider:logEventDispatcher:dailyScheduler:dateProvider:legacyCountersManager:flagsManager:ewsLogger:deviceStateManager:networkObserver:coreAnalyticsTagObserver:backgroundLoggingTimer:radarInitiator:notificationCenter:userDefaults:currentSoftwareVersion:", v59, v58, v57, v41, v51, v39, v24, v52, v44, v50, v35, v48, v47, v55, v46,
          v56,
          v43);

  return v54;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_79271 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_79271, &__block_literal_global_368);
  }
  id v2 = (void *)logCategory__hmf_once_v17_79272;
  return v2;
}

uint64_t __32__HMDMetricsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_79272;
  logCategory__hmf_once_v17_79272 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)submitMinimalCoreAnalyticsEvent:(id)a3
{
  id v3 = a3;
  id v6 = objc_alloc_init(HMDMinimalCoreAnalyticsLogEventObserverDelegate);
  id v4 = objc_alloc(MEMORY[0x1E4F6A250]);
  id v5 = (void *)[v4 initWithDelegate:v6 filters:MEMORY[0x1E4F1CBF0]];
  [v5 didReceiveEventFromDispatcher:v3];
}

+ (HMMRadarInitiating)defaultRadarInitiator
{
  return (HMMRadarInitiating *)+[HMDTTRManager sharedManager];
}

+ (NSUUID)namespaceUUID
{
  if (namespaceUUID_onceToken != -1) {
    dispatch_once(&namespaceUUID_onceToken, &__block_literal_global_79279);
  }
  id v2 = (void *)namespaceUUID_namespaceUUID;
  return (NSUUID *)v2;
}

uint64_t __34__HMDMetricsManager_namespaceUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  uint64_t v1 = namespaceUUID_namespaceUUID;
  namespaceUUID_namespaceUUID = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
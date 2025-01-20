@interface HDDaemon
- (BOOL)isTerminating;
- (BOOL)shouldEnqueueMaintenanceWork;
- (HDAnalyticsSubmissionCoordinator)analyticsSubmissionCoordinator;
- (HDAutoBugCaptureReporter)autoBugCaptureReporter;
- (HDBackgroundObservationServerExtensionManager)extensionManager;
- (HDBackgroundTaskScheduler)backgroundTaskScheduler;
- (HDCacheDeleteCoordinator)cacheDeleteCoordinator;
- (HDCloudSyncCoordinator)cloudSyncCoordinator;
- (HDContentProtectionManager)contentProtectionManager;
- (HDDaemon)init;
- (HDDaemon)initWithContainerDirectoryPath:(id)a3;
- (HDDaemon)initWithHealthDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4;
- (HDDaemonConnectionManager)connectionManager;
- (HDDaemonTester)daemonTester;
- (HDDatabasePruningCoordinator)databasePruningCoordinator;
- (HDDevicePowerMonitor)devicePowerMonitor;
- (HDHealthAppNewDeviceNotificationService)healthAppNewDeviceNotificationService;
- (HDMaintenanceWorkCoordinator)maintenanceWorkCoordinator;
- (HDNanoAlertSuppressionService)alertSuppressionService;
- (HDNotificationInstructionSyncService)notificationInstructionSyncService;
- (HDOTAFeatureAvailabilityManager)OTAFeatureAvailabilityManager;
- (HDOntologyAssetProvider)ontologyAssetProvider;
- (HDOntologyBackingStore)ontologyBackingStore;
- (HDOntologyConfigurationProvider)ontologyConfigurationProvider;
- (HDOntologyUpdateCoordinator)ontologyUpdateCoordinator;
- (HDPairedDeviceCapabilityProviding)nanoRegistryDeviceCapabilityProvider;
- (HDPluginManager)pluginManager;
- (HDPostInstallUpdateManager)postInstallUpdateManager;
- (HDPrimaryProfile)primaryProfile;
- (HDProcessStateManager)processStateManager;
- (HDProfileManager)profileManager;
- (HDQueryManager)queryManager;
- (HDTaskServerRegistry)taskServerRegistry;
- (HDUserDomainConceptEntityRegistry)userDomainConceptEntityRegistry;
- (HDWorkoutPluginDaemonExtension)workoutPluginExtension;
- (HDXPCAlarmScheduler)alarmScheduler;
- (HDXPCEventManager)xpcEventManager;
- (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource)featureAvailabilityRequirementSatisfactionOverridesDataSource;
- (HKWatchLowPowerModeDataSource)watchLowPowerModeDataSource;
- (HKWristDetectionSettingManager)wristDetectionSettingManager;
- (NSObject)_setupSignal:(void *)a3 handler:;
- (NSString)healthDirectoryPath;
- (NSString)medicalIDDirectoryPath;
- (NSURL)healthDirectoryURL;
- (NSURL)localContentURL;
- (_HKBehavior)behavior;
- (id)IDSServiceWithIdentifier:(id)a3;
- (id)_newAnalyticsSubmissionCoordinator;
- (id)_newAutoBugCaptureReporter;
- (id)_newBackgroundTaskScheduler;
- (id)_newCacheDeleteCoordinator;
- (id)_newCloudSyncCoordinator;
- (id)_newConnectionManager;
- (id)_newContentProtectionManager;
- (id)_newDatabasePruningCoordinator;
- (id)_newDevicePowerMonitor;
- (id)_newHealthAppNewDeviceNotificationService;
- (id)_newMaintenanceWorkCoordinator;
- (id)_newNanoRegistryDeviceCapabilityProvider;
- (id)_newNotificationInstructionSyncService;
- (id)_newOTAFeatureAvailabilityManager;
- (id)_newPluginManager;
- (id)_newPrimaryProfile;
- (id)_newProcessStateManager;
- (id)_newProfileManager;
- (id)_newTaskServerRegistry;
- (id)createApplicationStateMonitor;
- (id)createApplicationStateMonitorWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5;
- (id)createRBSProcessStateProvider;
- (id)daemonExtensionWithIdentifier:(id)a3;
- (id)daemonExtensionsConformingToProtocol:(id)a3;
- (id)diagnosticDescription;
- (id)healthDirectorySizeInBytes;
- (id)healthDomainAccessorWithPairedDevice:(id)a3;
- (id)healthLiteUserDefaultsDomain;
- (id)nanoPairedDeviceRegistry;
- (id)pairedSyncCoordinatorWithServiceName:(id)a3;
- (id)protectedResourceStoreProviders;
- (id)taskServerClasses;
- (void)_localeOrLanguageChanged:(id)a3;
- (void)_postDaemonLaunchDarwinNotification;
- (void)_resetPrivacySettings;
- (void)_terminationCleanup;
- (void)applicationStateDidChange:(id)a3;
- (void)dealloc;
- (void)exitClean:(BOOL)a3 reason:(id)a4;
- (void)invalidateAllServersForProfile:(id)a3;
- (void)invalidateAndWaitWithReason:(id)a3;
- (void)obliterateAndTerminateProfiles:(id)a3 options:(unint64_t)a4 reason:(id)a5 completion:(id)a6;
- (void)obliterateAndTerminateWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5;
- (void)performBlockWithPowerAssertionIdentifier:(id)a3 transactionName:(id)a4 powerAssertionInterval:(double)a5 block:(id)a6;
- (void)registerDaemonActivatedObserver:(id)a3 queue:(id)queue;
- (void)registerDaemonReadyObserver:(id)a3 queue:(id)queue;
- (void)registerForDaemonReady:(id)a3;
- (void)registerForLaunchNotification:(const char *)a3;
- (void)registerProtectedResourceStoreProvider:(id)a3;
- (void)setAlertSuppressionService:(id)a3;
- (void)setDaemonTester:(id)a3;
- (void)setShouldEnqueueMaintenanceWork:(BOOL)a3;
- (void)start;
- (void)terminateClean:(BOOL)a3 reason:(id)a4;
- (void)unregisterForLaunchNotification:(const char *)a3;
- (void)unregisterProtectedResourceStoreProvider:(id)a3;
@end

@implementation HDDaemon

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (HDQueryManager)queryManager
{
  return self->_queryManager;
}

- (HDPrimaryProfile)primaryProfile
{
  return self->_primaryProfile;
}

- (HDProfileManager)profileManager
{
  profileManager = self->_profileManager;
  if (!profileManager)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDDaemon.m", 1084, @"Invalid parameter not satisfying: %@", @"_profileManager != nil" object file lineNumber description];

    profileManager = self->_profileManager;
  }

  return profileManager;
}

- (HDProcessStateManager)processStateManager
{
  processStateManager = self->_processStateManager;
  if (!processStateManager)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDDaemon.m", 1070, @"Invalid parameter not satisfying: %@", @"_processStateManager != nil" object file lineNumber description];

    processStateManager = self->_processStateManager;
  }

  return processStateManager;
}

- (HDPluginManager)pluginManager
{
  pluginManager = self->_pluginManager;
  if (!pluginManager)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDDaemon.m", 1075, @"Invalid parameter not satisfying: %@", @"_pluginManager != nil" object file lineNumber description];

    pluginManager = self->_pluginManager;
  }

  return pluginManager;
}

- (HDNanoAlertSuppressionService)alertSuppressionService
{
  return self->_alertSuppressionService;
}

- (void)performBlockWithPowerAssertionIdentifier:(id)a3 transactionName:(id)a4 powerAssertionInterval:(double)a5 block:(id)a6
{
  id v18 = a3;
  id v11 = a4;
  v12 = (void (**)(void))a6;
  if (v18)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDDaemon.m", 918, @"Invalid parameter not satisfying: %@", @"transactionName != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HDDaemon.m", 917, @"Invalid parameter not satisfying: %@", @"powerAssertionIdentifier != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HDDaemon.m", 919, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

LABEL_4:
  v13 = +[HKDaemonTransaction transactionWithOwner:self activityName:v11];
  v14 = +[HDPowerAssertion powerAssertionWithIdentifier:v18 timeout:0 timeoutHandler:a5];
  v12[2](v12);
  [v14 invalidate];
  [v13 invalidate];
}

uint64_t __38__HDDaemon__setupMemoryWarningHandler__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HDBackgroundTaskScheduler)backgroundTaskScheduler
{
  backgroundTaskScheduler = self->_backgroundTaskScheduler;
  if (!backgroundTaskScheduler)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDDaemon.m", 1057, @"Invalid parameter not satisfying: %@", @"_backgroundTaskScheduler != nil" object file lineNumber description];

    backgroundTaskScheduler = self->_backgroundTaskScheduler;
  }

  return backgroundTaskScheduler;
}

- (void)registerForDaemonReady:(id)a3
{
}

- (void)setAlertSuppressionService:(id)a3
{
}

- (NSObject)_setupSignal:(void *)a3 handler:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = dispatch_source_create(MEMORY[0x1E4F14480], a2, 0, *(dispatch_queue_t *)(a1 + 32));
  if (v6)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33__HDDaemon__setupSignal_handler___block_invoke;
    handler[3] = &unk_1E62F2F20;
    id v10 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    signal(a2, (void (__cdecl *)(int))1);
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v12 = a2;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Could not set up signal handler for %d", buf, 8u);
    }
  }

  return v6;
}

void __38__HDDaemon__setupMemoryWarningHandler__block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current >= *a2 + 1.0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = a3;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
    }
    *a2 = Current;
  }
}

- (HDContentProtectionManager)contentProtectionManager
{
  contentProtectionManager = self->_contentProtectionManager;
  if (!contentProtectionManager)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDDaemon.m", 1052, @"Invalid parameter not satisfying: %@", @"_contentProtectionManager != nil" object file lineNumber description];

    contentProtectionManager = self->_contentProtectionManager;
  }

  return contentProtectionManager;
}

- (id)nanoPairedDeviceRegistry
{
  return (id)[MEMORY[0x1E4F79EF0] sharedInstance];
}

- (void)registerForLaunchNotification:(const char *)a3
{
  if (self)
  {
    id v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "Notification", a3);
    xpc_set_event();
  }
}

- (HDDaemonTester)daemonTester
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonTester);

  return (HDDaemonTester *)WeakRetained;
}

- (id)IDSServiceWithIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F6AB90];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithService:v4];

  return v5;
}

- (id)taskServerClasses
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:51];
  +[HDQueryServer builtInQueryServerClasses](HDQueryServer, "builtInQueryServerClasses", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
  v3 = v55);
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (id)pairedSyncCoordinatorWithServiceName:(id)a3
{
  return +[HDPairedSyncManager syncCoordinatorWithServiceName:a3];
}

- (id)healthDomainAccessorWithPairedDevice:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F79CD8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithDomain:@"com.apple.healthd" pairedDevice:v4];

  return v5;
}

- (id)healthLiteUserDefaultsDomain
{
  v3 = [HDKeyValueDomain alloc];
  id v4 = [(HDDaemon *)self primaryProfile];
  id v5 = [(HDKeyValueDomain *)v3 initWithCategory:105 domainName:@"HealthLite" profile:v4];

  return v5;
}

- (HDDaemon)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDaemon)initWithContainerDirectoryPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringByAppendingPathComponent:@"Health"];
  uint64_t v6 = [v4 stringByAppendingPathComponent:@"MedicalID"];

  uint64_t v7 = [(HDDaemon *)self initWithHealthDirectoryPath:v5 medicalIDDirectoryPath:v6];
  return v7;
}

- (HDDaemon)initWithHealthDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HDDaemon;
  uint64_t v8 = [(HDDaemon *)&v27 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_isTerminating = 0;
    atomic_store(0, (unsigned __int8 *)&v8->_hasCalledExit);
    uint64_t v10 = [MEMORY[0x1E4F2B860] sharedBehavior];
    behavior = v9->_behavior;
    v9->_behavior = (_HKBehavior *)v10;

    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    daemonReadyBlocks = v9->_daemonReadyBlocks;
    v9->_daemonReadyBlocks = v14;

    uint64_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    daemonActivatedBlocks = v9->_daemonActivatedBlocks;
    v9->_daemonActivatedBlocks = v16;

    uint64_t v18 = [v6 copy];
    healthDirectoryPath = v9->_healthDirectoryPath;
    v9->_healthDirectoryPath = (NSString *)v18;

    uint64_t v20 = [v7 copy];
    medicalIDDirectoryPath = v9->_medicalIDDirectoryPath;
    v9->_medicalIDDirectoryPath = (NSString *)v20;

    v9->_daemonReadyLock._os_unfair_lock_opaque = 0;
    v9->_protectedResourceStoreProvidersLock._os_unfair_lock_opaque = 0;
    uint64_t v22 = [(HDDaemon *)v9 _newConnectionManager];
    connectionManager = v9->_connectionManager;
    v9->_connectionManager = (HDDaemonConnectionManager *)v22;

    uint64_t v24 = objc_alloc_init(HDBackgroundObservationServerExtensionManager);
    extensionManager = v9->_extensionManager;
    v9->_extensionManager = v24;
  }
  return v9;
}

- (void)start
{
  v157[13] = *(id *)MEMORY[0x1E4F143B8];
  if (atomic_exchange(&self->_didStart._Value, 1u))
  {
    v131 = [MEMORY[0x1E4F28B00] currentHandler];
    [v131 handleFailureInMethod:a2, self, @"HDDaemon.m", 167, @"Invalid parameter not satisfying: %@", @"alreadyStarted == false" object file lineNumber description];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    healthDirectoryPath = self->_healthDirectoryPath;
    id v139 = 0;
    char v5 = [v3 createDirectoryAtPath:healthDirectoryPath withIntermediateDirectories:1 attributes:0 error:&v139];
    id v130 = v139;

    id v6 = (os_log_t *)MEMORY[0x1E4F29F28];
    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      id v7 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v127 = self->_healthDirectoryPath;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v127;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v130;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to create \"%{public}@\": %{public}@", buf, 0x16u);
      }
    }
    if (([(_HKBehavior *)self->_behavior isDeviceSupported] & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v8 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Device is unsupported", buf, 2u);
      }
    }
    uint64_t v9 = [[HDPostInstallUpdateManager alloc] initWithDaemon:self];
    postInstallUpdateManager = self->_postInstallUpdateManager;
    self->_postInstallUpdateManager = v9;

    if ([(_HKBehavior *)self->_behavior isDeviceSupported])
    {
      uint64_t v11 = [(HDDaemon *)self _newPluginManager];
      pluginManager = self->_pluginManager;
      self->_pluginManager = v11;

      uint64_t v13 = [(HDDaemon *)self _newCacheDeleteCoordinator];
      cacheDeleteCoordinator = self->_cacheDeleteCoordinator;
      self->_cacheDeleteCoordinator = v13;

      uint64_t v15 = [(HDDaemon *)self _newContentProtectionManager];
      contentProtectionManager = self->_contentProtectionManager;
      self->_contentProtectionManager = v15;

      uint64_t v17 = [(HDDaemon *)self _newProcessStateManager];
      processStateManager = self->_processStateManager;
      self->_processStateManager = v17;

      uint64_t v19 = [(HDDaemon *)self _newBackgroundTaskScheduler];
      backgroundTaskScheduler = self->_backgroundTaskScheduler;
      self->_backgroundTaskScheduler = v19;

      uint64_t v21 = [(HDDaemon *)self _newNotificationInstructionSyncService];
      notificationInstructionSyncService = self->_notificationInstructionSyncService;
      self->_notificationInstructionSyncService = v21;

      if ([(_HKBehavior *)self->_behavior healthAppSupportedOnDevice])
      {
        uint64_t v23 = [(HDDaemon *)self _newHealthAppNewDeviceNotificationService];
        healthAppNewDeviceNotificationService = self->_healthAppNewDeviceNotificationService;
        self->_healthAppNewDeviceNotificationService = v23;
      }
      uint64_t v25 = [(HDDaemon *)self _newNanoRegistryDeviceCapabilityProvider];
      nanoRegistryDeviceCapabilityProvider = self->_nanoRegistryDeviceCapabilityProvider;
      self->_nanoRegistryDeviceCapabilityProvider = v25;

      objc_super v27 = [(HDDaemon *)self _newOTAFeatureAvailabilityManager];
      OTAFeatureAvailabilityManager = self->_OTAFeatureAvailabilityManager;
      self->_OTAFeatureAvailabilityManager = v27;

      uint64_t v29 = (HDXPCAlarmScheduler *)objc_alloc_init(MEMORY[0x1E4F65DA8]);
      alarmScheduler = self->_alarmScheduler;
      self->_alarmScheduler = v29;

      uint64_t v31 = [(HDDaemon *)self _newMaintenanceWorkCoordinator];
      maintenanceWorkCoordinator = self->_maintenanceWorkCoordinator;
      self->_maintenanceWorkCoordinator = v31;

      uint64_t v33 = [MEMORY[0x1E4F2B020] requirementSatisfactionOverridesDataSource];
      featureAvailabilityRequirementSatisfactionOverridesDataSource = self->_featureAvailabilityRequirementSatisfactionOverridesDataSource;
      self->_featureAvailabilityRequirementSatisfactionOverridesDataSource = v33;

      uint64_t v35 = (HKWatchLowPowerModeDataSource *)objc_alloc_init(MEMORY[0x1E4F2B710]);
      watchLowPowerModeDataSource = self->_watchLowPowerModeDataSource;
      self->_watchLowPowerModeDataSource = v35;

      uint64_t v37 = (HKWristDetectionSettingManager *)objc_alloc_init(MEMORY[0x1E4F2B820]);
      wristDetectionSettingManager = self->_wristDetectionSettingManager;
      self->_wristDetectionSettingManager = v37;

      uint64_t v39 = [(HDDaemon *)self _newPrimaryProfile];
      primaryProfile = self->_primaryProfile;
      self->_primaryProfile = v39;

      [(HDDaemon *)self unitTest_didCreateProfile:self->_primaryProfile];
      uint64_t v41 = [(HDDaemon *)self _newProfileManager];
      profileManager = self->_profileManager;
      self->_profileManager = v41;

      [(HDProfileManager *)self->_profileManager addProfile:self->_primaryProfile];
      uint64_t v43 = [(HDDaemon *)self _newCloudSyncCoordinator];
      cloudSyncCoordinator = self->_cloudSyncCoordinator;
      self->_cloudSyncCoordinator = v43;

      uint64_t v45 = [(HDDaemon *)self _newDatabasePruningCoordinator];
      databasePruningCoordinator = self->_databasePruningCoordinator;
      self->_databasePruningCoordinator = v45;

      uint64_t v47 = [(HDDaemon *)self _newAnalyticsSubmissionCoordinator];
      analyticsSubmissionCoordinator = self->_analyticsSubmissionCoordinator;
      self->_analyticsSubmissionCoordinator = v47;

      uint64_t v49 = [(HDDaemon *)self _newAutoBugCaptureReporter];
      autoBugCaptureReporter = self->_autoBugCaptureReporter;
      self->_autoBugCaptureReporter = v49;

      if ([(_HKBehavior *)self->_behavior supportsOntology])
      {
        uint64_t v51 = [[HDOntologyBackingStore alloc] initWithDaemon:self];
        ontologyBackingStore = self->_ontologyBackingStore;
        self->_ontologyBackingStore = v51;

        uint64_t v53 = objc_alloc_init(HDOntologyConfigurationProvider);
        ontologyConfigurationProvider = self->_ontologyConfigurationProvider;
        self->_ontologyConfigurationProvider = v53;

        uint64_t v55 = [[HDOntologyUpdateCoordinator alloc] initWithDaemon:self];
        ontologyUpdateCoordinator = self->_ontologyUpdateCoordinator;
        self->_ontologyUpdateCoordinator = v55;
      }
      uint64_t v57 = [(HDDaemon *)self _newDevicePowerMonitor];
      devicePowerMonitor = self->_devicePowerMonitor;
      self->_devicePowerMonitor = v57;

      v59 = [[HDQueryManager alloc] initWithDaemon:self];
      queryManager = self->_queryManager;
      self->_queryManager = v59;

      v61 = [(HDDaemon *)self _newTaskServerRegistry];
      taskServerRegistry = self->_taskServerRegistry;
      self->_taskServerRegistry = v61;

      v63 = +[HDUserDomainConceptEntityRegistry registryWithDaemon:self setSharedInstance:1];
      userDomainConceptEntityRegistry = self->_userDomainConceptEntityRegistry;
      self->_userDomainConceptEntityRegistry = v63;

      v149 = self;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v149 count:1];
      v129 = [(HDPluginManager *)self->_pluginManager pluginsConformingToProtocol:&unk_1F1803C88];
      v66 = [v129 allValues];
      v67 = [v65 arrayByAddingObjectsFromArray:v66];

      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v68 = v67;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v135 objects:v148 count:16];
      if (v69)
      {
        uint64_t v70 = *(void *)v136;
        do
        {
          uint64_t v71 = 0;
          do
          {
            if (*(void *)v136 != v70) {
              objc_enumerationMutation(v68);
            }
            uint64_t v72 = *(void *)(*((void *)&v135 + 1) + 8 * v71);
            v73 = self->_taskServerRegistry;
            id v134 = 0;
            BOOL v74 = [(HDTaskServerRegistry *)v73 registerTaskServerClassesWithProvider:v72 error:&v134];
            id v75 = v134;
            if (!v74)
            {
              _HKInitializeLogging();
              v76 = *v6;
              if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v72;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v75;
                _os_log_error_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_ERROR, "Failed to register task server classes from provider %{public}@: %{public}@", buf, 0x16u);
              }
            }

            ++v71;
          }
          while (v69 != v71);
          uint64_t v69 = [v68 countByEnumeratingWithState:&v135 objects:v148 count:16];
        }
        while (v69);
      }

      v77 = [(HDPluginManager *)self->_pluginManager createExtensionsForDaemon:self];
      daemonExtensionsByIdentifier = self->_daemonExtensionsByIdentifier;
      self->_daemonExtensionsByIdentifier = v77;

      if (!_HDIsUnitTesting)
      {
        id from = @"UserAssignedDeviceName";
        v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&from count:1];
        objc_initWeak(location, self);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __41__HDDaemon__registerForDeviceNameChanges__block_invoke;
        v156 = &unk_1E62FB490;
        objc_copyWeak(v157, location);
        self->_deviceNameChangesToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();
        objc_destroyWeak(v157);
        objc_destroyWeak(location);
      }
    }
    else
    {
      +[HDCloudSyncPeriodicActivityScheduler registerDisabledPeriodicActivitiesForUnsupportedDaemon:self];
      +[HDDatabasePruningCoordinator registerDisabledPeriodicActivitiesForUnsupportedDaemon:self];
      self->_healthdStateHandler = HDAddStateHandler((uint64_t)self->_queue, @"Sensitive Logging Status", &__block_literal_global_64);
    }
    v80 = objc_alloc_init(HDXPCEventManager);
    xpcEventManager = self->_xpcEventManager;
    self->_xpcEventManager = v80;

    objc_initWeak(location, self);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __32__HDDaemon__setUpSignalHandlers__block_invoke;
    v156 = &unk_1E62F6BD0;
    objc_copyWeak(v157, location);
    uint64_t v82 = -[HDDaemon _setupSignal:handler:]((uint64_t)self, 0xFu, buf);
    v83 = (void *)_MergedGlobals_201;
    _MergedGlobals_201 = v82;

    uint64_t v84 = -[HDDaemon _setupSignal:handler:]((uint64_t)self, 0x1Eu, &__block_literal_global_407);
    v85 = (void *)qword_1EBA18B68;
    qword_1EBA18B68 = v84;

    id from = (id)MEMORY[0x1E4F143A8];
    uint64_t v151 = 3221225472;
    v152 = __32__HDDaemon__setUpSignalHandlers__block_invoke_3;
    v153 = &unk_1E62F6BD0;
    objc_copyWeak(v154, location);
    uint64_t v86 = -[HDDaemon _setupSignal:handler:]((uint64_t)self, 0x1Fu, &from);
    v87 = (void *)qword_1EBA18B70;
    qword_1EBA18B70 = v86;

    objc_destroyWeak(v154);
    objc_destroyWeak(v157);
    objc_destroyWeak(location);
    v88 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v88 addObserver:self];

    v89 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v89 addObject:self];

    os_unfair_lock_lock(&self->_daemonReadyLock);
    self->_daemonReady = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonTester);
    v91 = self->_daemonReadyBlocks;
    daemonReadyBlocks = self->_daemonReadyBlocks;
    self->_daemonReadyBlocks = 0;

    os_unfair_lock_unlock(&self->_daemonReadyLock);
    _HKInitializeLogging();
    os_log_t v93 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v94 = v93;
      uint64_t v95 = [(NSMutableArray *)v91 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v95;
      _os_log_impl(&dword_1BCB7D000, v94, OS_LOG_TYPE_DEFAULT, "Notify (%lu) Daemon Ready Observers", buf, 0xCu);
    }
    _HKInitializeLogging();
    v96 = _HKLogPersistedSignposts();
    BOOL v97 = os_signpost_enabled(v96);

    if (v97)
    {
      v98 = _HKLogPersistedSignposts();
      if (os_signpost_enabled(v98))
      {
        uint64_t v99 = [(NSMutableArray *)v91 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v99;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v98, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Notify Daemon Ready Observers", "count=%lu", buf, 0xCu);
      }
    }
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v100 = v91;
    uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v140 objects:&from count:16];
    if (v101)
    {
      uint64_t v102 = *(void *)v141;
      do
      {
        for (uint64_t i = 0; i != v101; ++i)
        {
          if (*(void *)v141 != v102) {
            objc_enumerationMutation(v100);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v140 + 1) + 8 * i) + 16))();
        }
        uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v140 objects:&from count:16];
      }
      while (v101);
    }

    os_unfair_lock_lock(&self->_daemonReadyLock);
    v104 = self->_daemonActivatedBlocks;
    daemonActivatedBlocks = self->_daemonActivatedBlocks;
    self->_daemonActivatedBlocks = 0;

    os_unfair_lock_unlock(&self->_daemonReadyLock);
    _HKInitializeLogging();
    os_log_t v106 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v107 = v106;
      uint64_t v108 = [(NSMutableArray *)v104 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v108;
      _os_log_impl(&dword_1BCB7D000, v107, OS_LOG_TYPE_DEFAULT, "Notify (%lu) Daemon Activated Observers", buf, 0xCu);
    }
    long long v146 = 0u;
    long long v147 = 0u;
    *(_OWORD *)location = 0u;
    long long v145 = 0u;
    v109 = v104;
    uint64_t v110 = [(NSMutableArray *)v109 countByEnumeratingWithState:location objects:buf count:16];
    if (v110)
    {
      uint64_t v111 = *(void *)v145;
      do
      {
        for (uint64_t j = 0; j != v110; ++j)
        {
          if (*(void *)v145 != v111) {
            objc_enumerationMutation(v109);
          }
          (*(void (**)(void))(*((void *)location[1] + j) + 16))();
        }
        uint64_t v110 = [(NSMutableArray *)v109 countByEnumeratingWithState:location objects:buf count:16];
      }
      while (v110);
    }

    _HKInitializeLogging();
    v113 = _HKLogPersistedSignposts();
    BOOL v114 = os_signpost_enabled(v113);

    if (v114)
    {
      v115 = _HKLogPersistedSignposts();
      if (os_signpost_enabled(v115))
      {
        uint64_t v116 = [(NSMutableArray *)v100 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v116;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v115, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Notify Daemon Ready Observers", "cound=%lu", buf, 0xCu);
      }
    }
    [(HDDaemon *)self _postDaemonLaunchDarwinNotification];
    [WeakRetained daemonReadyComplete:self];

    objc_initWeak(&from, self);
    queue = self->_queue;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __48__HDDaemon__setUpDarwinNotificationEventHandler__block_invoke;
    v156 = &unk_1E62FB408;
    objc_copyWeak(v157, &from);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, buf);
    objc_destroyWeak(v157);
    objc_destroyWeak(&from);
    objc_initWeak(&from, self);
    id v118 = MEMORY[0x1E4F14428];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __53__HDDaemon__setUpDistributedNotificationEventHandler__block_invoke;
    v156 = &unk_1E62FB408;
    objc_copyWeak(v157, &from);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x1E4F14428], buf);

    objc_destroyWeak(v157);
    objc_destroyWeak(&from);
    dispatch_source_t v119 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 1uLL, MEMORY[0x1E4F14428]);
    v120 = (void *)qword_1EBA18B88;
    qword_1EBA18B88 = (uint64_t)v119;

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __38__HDDaemon__setupMemoryWarningHandler__block_invoke_443;
    v156 = &unk_1E62F2F20;
    v157[0] = &__block_literal_global_442;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1EBA18B88, buf);
    dispatch_activate((dispatch_object_t)qword_1EBA18B88);
    dispatch_source_t v121 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 2uLL, MEMORY[0x1E4F14428]);
    v122 = (void *)qword_1EBA18B90;
    qword_1EBA18B90 = (uint64_t)v121;

    id from = (id)MEMORY[0x1E4F143A8];
    uint64_t v151 = 3221225472;
    v152 = __38__HDDaemon__setupMemoryWarningHandler__block_invoke_2;
    v153 = &unk_1E62F2F20;
    v154[0] = &__block_literal_global_442;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1EBA18B90, &from);
    dispatch_activate((dispatch_object_t)qword_1EBA18B90);
    dispatch_source_t v123 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 4uLL, MEMORY[0x1E4F14428]);
    v124 = (void *)qword_1EBA18B98;
    qword_1EBA18B98 = (uint64_t)v123;

    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    *(void *)&long long v145 = __38__HDDaemon__setupMemoryWarningHandler__block_invoke_3;
    *((void *)&v145 + 1) = &unk_1E62F2F20;
    *(void *)&long long v146 = &__block_literal_global_442;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1EBA18B98, location);
    dispatch_activate((dispatch_object_t)qword_1EBA18B98);

    xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)self->_queue, &__block_literal_global_449);
    [(HDPostInstallUpdateManager *)self->_postInstallUpdateManager start];
    v125 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v125 addObserver:self selector:sel__localeOrLanguageChanged_ name:*MEMORY[0x1E4F1C370] object:0];

    objc_initWeak((id *)buf, self);
    v126 = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __17__HDDaemon_start__block_invoke_2;
    handler[3] = &unk_1E62F3490;
    objc_copyWeak(&v133, (id *)buf);
    notify_register_dispatch("com.apple.language.changed", &self->_languageChangeNotifyToken, v126, handler);
    [(HDCacheDeleteCoordinator *)self->_cacheDeleteCoordinator activate];
    [(HDDaemonConnectionManager *)self->_connectionManager resume];
    objc_destroyWeak(&v133);
    objc_destroyWeak((id *)buf);
  }
}

id __17__HDDaemon_start__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"Sensitive Logging";
  int v0 = HKShowSensitiveLogItems();
  v1 = @"Disabled";
  if (v0) {
    v1 = @"Enabled";
  }
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

void __17__HDDaemon_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _localeOrLanguageChanged:0];
}

- (void)dealloc
{
  MGCancelNotifications();
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  notify_cancel(self->_languageChangeNotifyToken);
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 removeObserver:self];

  if (self->_healthdStateHandler) {
    os_state_remove_handler();
  }
  v5.receiver = self;
  v5.super_class = (Class)HDDaemon;
  [(HDDaemon *)&v5 dealloc];
}

- (id)daemonExtensionWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_daemonExtensionsByIdentifier objectForKeyedSubscript:a3];
}

- (id)daemonExtensionsConformingToProtocol:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NSDictionary *)self->_daemonExtensionsByIdentifier allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__HDDaemon_daemonExtensionsConformingToProtocol___block_invoke;
  v9[3] = &unk_1E62FB3B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "hk_filter:", v9);

  return v7;
}

uint64_t __49__HDDaemon_daemonExtensionsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

- (void)invalidateAndWaitWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating (%{public}@).", (uint8_t *)&v6, 0x16u);
  }

  [(HDDaemonConnectionManager *)self->_connectionManager invalidate];
  [(HDMaintenanceWorkCoordinator *)self->_maintenanceWorkCoordinator cancelAllOperations];
  [(HDOntologyBackingStore *)self->_ontologyBackingStore invalidate];
  [(HDProfileManager *)self->_profileManager invalidateAndWaitWithReason:v4];
}

- (void)invalidateAllServersForProfile:(id)a3
{
}

- (void)obliterateAndTerminateWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(HDDaemon *)self profileManager];
  uint64_t v10 = [v11 allProfileIdentifiers];
  [(HDDaemon *)self obliterateAndTerminateProfiles:v10 options:a3 reason:v9 completion:v8];
}

- (void)obliterateAndTerminateProfiles:(id)a3 options:(unint64_t)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"Obliteration"];
  self->_isTerminating = 1;
  _HKInitializeLogging();
  uint64_t v14 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = v14;
    uint64_t v21 = [v10 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v21;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "*** OBLITERATING HEALTH DATA (%{public}@): %{public}@ (%ld)", buf, 0x20u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__HDDaemon_obliterateAndTerminateProfiles_options_reason_completion___block_invoke;
  v24[3] = &unk_1E62FB3E0;
  v24[4] = self;
  uint64_t v15 = objc_msgSend(v10, "hk_map:", v24);
  uint64_t v23 = v12;
  uint64_t v22 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v15;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

id __69__HDDaemon_obliterateAndTerminateProfiles_options_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 112) profileForIdentifier:v3];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to find profile %{public}@ during obliteration", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5;
}

void __69__HDDaemon_obliterateAndTerminateProfiles_options_reason_completion___block_invoke_344(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA80] set];
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.ActivityMonitorApp", @"com.apple.DeepBreathing", @"com.apple.Fitness", @"com.apple.Health", @"com.apple.HeartRatecom.apple.SessionTrackerApp", @"com.apple.NanoHeartRhythm", @"com.apple.NanoMenstrualCycles", @"com.apple.NanoSleep.watchkitapp", @"com.apple.NanoOxygenSaturation.watchkitapp", @"com.apple.NanoHealthBalance", 0);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    objc_super v5 = [*(id *)(v2 + 336) clientProcesses];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v74 objects:buf count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v75;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v75 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v74 + 1) + 8 * v9) bundleIdentifier];
          uint64_t v11 = v10;
          if (v10
            && (![v10 hasPrefix:@"com.apple."]
             || [v4 containsObject:v11]))
          {
            [v3 addObject:v11];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v74 objects:buf count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v3 = 0;
  }
  _HKInitializeLogging();
  id v12 = (os_log_t *)MEMORY[0x1E4F29F28];
  uint64_t v13 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "*** PREPARING FOR OBLITERATION ***", buf, 2u);
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v71;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v71 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * v18++) prepareForObliterationWithReason:*(void *)(a1 + 48)];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v16);
  }

  _HKInitializeLogging();
  id v19 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "*** INVALIDATING PROFILES", buf, 2u);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v67;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v67 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v66 + 1) + 8 * v24++) invalidateAndWaitWithReason:@"OBLITERATION"];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v22);
  }

  _HKInitializeLogging();
  uint64_t v25 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "*** OBLITERATING PROFILES", buf, 2u);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v26 = *(id *)(a1 + 40);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v78 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v63;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v63 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * v30++) obliterateWithOptions:*(void *)(a1 + 72) reason:*(void *)(a1 + 48)];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v62 objects:v78 count:16];
    }
    while (v28);
  }

  _HKInitializeLogging();
  uint64_t v31 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "*** OBLITERATING DAEMON OWNED DATA", buf, 2u);
  }
  uint64_t v32 = *(id **)(a1 + 32);
  uint64_t v33 = *(void *)(a1 + 72);
  id v34 = *(id *)(a1 + 48);
  if (v32)
  {
    [v32[51] invalidate];
    if (v33) {
      [v32[51] obliterateWithReason:v34];
    }
    id v35 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v36 = [v32 localContentURL];
    *(void *)&long long v74 = 0;
    char v37 = [v35 removeItemAtURL:v36 error:&v74];
    id v38 = (id)v74;

    if ((v37 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v39 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "Failed to remove local content during obliteration: %{public}@", buf, 0xCu);
      }
    }
  }
  _HKInitializeLogging();
  uint64_t v40 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "*** KILLING CLIENTS", buf, 2u);
  }
  uint64_t v41 = *(void *)(a1 + 32);
  id v42 = v3;
  uint64_t v43 = v42;
  if (v41 && [v42 count])
  {
    _HKInitializeLogging();
    os_log_t v44 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = v44;
      uint64_t v46 = [v43 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_DEFAULT, "Terminating %lu clients in response to obliteration", buf, 0xCu);
    }
    uint64_t v47 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifiers:v43];
    uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"Health database obliterated"];
    uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v47 context:v48];
    *(void *)&long long v74 = 0;
    int v50 = [v49 execute:&v74];
    id v51 = (id)v74;
    _HKInitializeLogging();
    uint64_t v52 = *v12;
    uint64_t v53 = *v12;
    if (v50)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v43;
        _os_log_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_DEFAULT, "Did terminate clients (%{public}@) in response to obliteration", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "Failed to terminate clients in response to obliteration: %{public}@ (%{public}@)", buf, 0x16u);
    }
  }
  _HKInitializeLogging();
  uint64_t v54 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "*** CLEARING USER DEFAULTS DOMAINS", buf, 2u);
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v55 = (void *)MEMORY[0x1E4F1CB18];
    uint64_t v56 = *MEMORY[0x1E4F2BF20];
    *(void *)buf = *MEMORY[0x1E4F2BC98];
    *(void *)&buf[8] = v56;
    uint64_t v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
    objc_msgSend(v55, "hk_deleteDomainsNamed:", v57);
  }
  _HKInitializeLogging();
  v58 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_ERROR, "*** NOTIFYING PLUGINS", buf, 2u);
  }
  v59 = [*(id *)(a1 + 32) pluginManager];
  [v59 notifyPluginsOfDatabaseObliteration];

  uint64_t v60 = *(void *)(a1 + 64);
  if (v60) {
    (*(void (**)(void))(v60 + 16))();
  }
  _HKInitializeLogging();
  v61 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_ERROR, "*** EXITING", buf, 2u);
  }
  [*(id *)(a1 + 32) terminateClean:0 reason:@"obliterating"];
  [*(id *)(a1 + 56) invalidate];
}

- (void)terminateClean:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  self->_isTerminating = 1;
  id v8 = a4;
  -[HDDaemon _terminationCleanup]((uint64_t)self);
  uint64_t v6 = "";
  if (v4) {
    uint64_t v6 = " clean";
  }
  uint64_t v7 = [NSString stringWithFormat:@"Terminating%s: %@", v6, v8];
  [(HDDaemon *)self invalidateAndWaitWithReason:v7];

  [(HDDaemon *)self exitClean:v4 reason:v8];
}

- (void)_terminationCleanup
{
  if (a1)
  {
    [*(id *)(a1 + 128) terminationCleanup];
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v1 synchronize];
  }
}

- (void)_localeOrLanguageChanged:(id)a3
{
}

- (void)exitClean:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "";
    if (v4) {
      id v8 = " clean";
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Exiting%s: %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__HDDaemon_exitClean_reason___block_invoke;
    block[3] = &unk_1E62F3208;
    block[4] = self;
    if (exitClean_reason__onceToken != -1) {
      dispatch_once(&exitClean_reason__onceToken, block);
    }
    xpc_transaction_exit_clean();
  }
  else if ((atomic_exchange((atomic_uchar *volatile)&self->_hasCalledExit, 1u) & 1) == 0)
  {
    exit(0);
  }
}

void __29__HDDaemon_exitClean_reason___block_invoke(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
  id v3 = (void *)exitClean_reason__timerSource;
  exitClean_reason__timerSource = (uint64_t)v2;

  BOOL v4 = exitClean_reason__timerSource;
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __29__HDDaemon_exitClean_reason___block_invoke_2;
  handler[3] = &unk_1E62F3208;
  void handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)exitClean_reason__timerSource, handler);
  dispatch_resume((dispatch_object_t)exitClean_reason__timerSource);
}

uint64_t __29__HDDaemon_exitClean_reason___block_invoke_2(uint64_t a1)
{
  xpc_transaction_try_exit_clean();
  dispatch_source_t v2 = *(void **)(a1 + 32);

  return [v2 exitClean:0 reason:@"forcing as xpc failed to quiesce"];
}

void __32__HDDaemon__setUpSignalHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    -[HDDaemon _terminationCleanup]((uint64_t)WeakRetained);
    [WeakRetained exitClean:0 reason:@"received SIGTERM"];
  }
}

void __32__HDDaemon__setUpSignalHandlers__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v0 logAllDiagnostics];
}

void __32__HDDaemon__setUpSignalHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"HDUSR2SignalNotification" object:WeakRetained];
  }
}

void __48__HDDaemon__setUpDarwinNotificationEventHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  xpc_object_t xdict = a2;
  if (MEMORY[0x1C187CC20]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
    if (string)
    {
      BOOL v4 = string;
      id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
      id v6 = xdict;
      if (WeakRetained)
      {
        _HKInitializeLogging();
        uint64_t v7 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v25 = v4;
          _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "Received notifyd notification \"%s\"", buf, 0xCu);
        }
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = [WeakRetained[26] allValues];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:buf count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && ([v13 daemonDidReceiveNotification:v4] & 1) != 0)
            {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:buf count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_15;
            }
          }
        }
        else
        {
LABEL_15:

          if (!strcasecmp("com.apple.Preferences.ResetPrivacyWarningsNotification", v4)) {
            [WeakRetained _resetPrivacySettings];
          }
          if (strcasecmp("com.apple.springboard.homescreenunlocked", v4)) {
            goto LABEL_20;
          }
          BOOL v14 = xpc_dictionary_get_uint64(v6, "_State") != 0;
          uint64_t v22 = @"HDDaemonHomescreenUnlockedAtHomescreenKey";
          uint64_t v15 = [NSNumber numberWithBool:v14];
          uint64_t v23 = v15;
          id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

          uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v16 postNotificationName:@"HDDaemonHomescreenUnlockedNotification" object:WeakRetained userInfo:v8];
        }
      }
LABEL_20:
    }
  }
}

void __53__HDDaemon__setUpDistributedNotificationEventHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  xpc_object_t xdict = a2;
  if (MEMORY[0x1C187CC20]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
    if (string)
    {
      BOOL v4 = string;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v6 = xdict;
      if (WeakRetained)
      {
        uint64_t v7 = [NSString stringWithUTF8String:v4];
        _HKInitializeLogging();
        id v8 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Received distnoted notification \"%@\"", (uint8_t *)&buf, 0xCu);
        }
        if ([v7 hasPrefix:@"com.apple.LaunchServices"])
        {
          id v9 = v6;
          id v10 = v7;
          char v11 = [v10 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"];
          int v12 = [v10 isEqualToString:@"com.apple.LaunchServices.applicationUnregistered"];
          if ((v11 & 1) != 0 || v12)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke;
            block[3] = &unk_1E62F3208;
            block[4] = WeakRetained;
            if (qword_1EBA18B80 != -1) {
              dispatch_once(&qword_1EBA18B80, block);
            }
            id v13 = +[HKDaemonTransaction transactionWithOwner:WeakRetained activityName:@"AppInstallation"];
            BOOL v14 = qword_1EBA18B78;
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            long long v20 = __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke_2;
            long long v21 = &unk_1E62F77F0;
            id v15 = v9;
            char v26 = v11;
            id v22 = v15;
            id v23 = WeakRetained;
            id v24 = v10;
            id v25 = v13;
            id v16 = v13;
            dispatch_async(v14, &buf);
          }
        }
      }
    }
  }
}

void __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke()
{
  uint64_t v0 = HKCreateSerialDispatchQueueWithQOSClass();
  id v1 = (void *)qword_1EBA18B78;
  qword_1EBA18B78 = v0;
}

void __44__HDDaemon__handleLaunchServicesEvent_name___block_invoke_2(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  dispatch_source_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "UserInfo");
  BOOL v4 = objc_msgSend(v2, "hd_dictionaryFromXPCObject:", v3);

  dispatch_time_t v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  id v6 = [v4 objectForKeyedSubscript:@"isPlaceholder"];
  char v7 = [v6 BOOLValue];

  if (v5)
  {
    if (v7)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring LaunchServices notification for placeholder", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 64)) {
        char v11 = HDHealthDaemonApplicationsInstalledNotification;
      }
      else {
        char v11 = HDHealthDaemonApplicationsUninstalledNotification;
      }
      int v12 = *v11;
      if (*(unsigned char *)(a1 + 64)) {
        id v13 = HDHealthDaemonApplicationsInstalledBundleIdentifiersKey;
      }
      else {
        id v13 = HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey;
      }
      long long v21 = *v13;
      v22[0] = v5;
      BOOL v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v21;
      id v16 = v12;
      uint64_t v17 = [v14 dictionaryWithObjects:v22 forKeys:&v21 count:1];
      long long v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 postNotificationName:v16 object:*(void *)(a1 + 40) userInfo:v17];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v19 = 138412290;
      uint64_t v20 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%@ notification missing bundle identifiers", (uint8_t *)&v19, 0xCu);
    }
  }
  [*(id *)(a1 + 56) invalidate];
}

uint64_t __38__HDDaemon__setupMemoryWarningHandler__block_invoke_443(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__HDDaemon__setupMemoryWarningHandler__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__HDDaemon__setupRapportEventHandler__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1C187CC20]() == MEMORY[0x1E4F14590]
    && xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560])
    && xpc_dictionary_get_BOOL(xdict, "replyRequired"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    if (reply) {
      xpc_dictionary_send_reply();
    }
  }
}

- (BOOL)isTerminating
{
  return self->_isTerminating;
}

- (void)registerDaemonReadyObserver:(id)a3 queue:(id)queue
{
  id v6 = a3;
  char v7 = self;
  id v8 = v7;
  if (!queue) {
    queue = v7->_queue;
  }
  id v9 = queue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke;
  int v19 = &unk_1E62F6A40;
  uint64_t v20 = v8;
  id v10 = v6;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  int v12 = v8;
  id v23 = v12;
  id v13 = (void (**)(void))_Block_copy(&v16);
  os_unfair_lock_lock(v12 + 36);
  if (LOBYTE(v12[44]._os_unfair_lock_opaque))
  {
    ++*(void *)&v12[42]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v12 + 36);
    v13[2](v13);
  }
  else
  {
    BOOL v14 = *(void **)&v12[38]._os_unfair_lock_opaque;
    ++*(void *)&v12[40]._os_unfair_lock_opaque;
    id v15 = _Block_copy(v13);
    objc_msgSend(v14, "addObject:", v15, v16, v17, v18, v19, v20, v21, v22);

    os_unfair_lock_unlock(v12 + 36);
  }
}

void __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  dispatch_source_t v2 = HKLogInfrastructure();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    BOOL v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 48));
      *(_DWORD *)long long buf = 138543874;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = label;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "%{public}@: notify daemon ready for observer %{public}@ on queue %s", buf, 0x20u);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke_454;
  v9[3] = &unk_1E62F31C0;
  id v8 = *(NSObject **)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);
}

uint64_t __46__HDDaemon_registerDaemonReadyObserver_queue___block_invoke_454(uint64_t a1)
{
  return [*(id *)(a1 + 32) daemonReady:*(void *)(a1 + 40)];
}

- (void)_postDaemonLaunchDarwinNotification
{
}

- (void)registerDaemonActivatedObserver:(id)a3 queue:(id)queue
{
  id v6 = a3;
  char v7 = self;
  id v8 = v7;
  if (!queue) {
    queue = v7->_queue;
  }
  id v9 = queue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke;
  int v19 = &unk_1E62F6A40;
  uint64_t v20 = v8;
  id v10 = v6;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  int v12 = v8;
  id v23 = v12;
  uint64_t v13 = (void (**)(void))_Block_copy(&v16);
  os_unfair_lock_lock(v12 + 36);
  if (LOBYTE(v12[44]._os_unfair_lock_opaque))
  {
    os_unfair_lock_unlock(v12 + 36);
    v13[2](v13);
  }
  else
  {
    __int16 v14 = *(void **)&v12[46]._os_unfair_lock_opaque;
    uint64_t v15 = _Block_copy(v13);
    objc_msgSend(v14, "addObject:", v15, v16, v17, v18, v19, v20, v21, v22);

    os_unfair_lock_unlock(v12 + 36);
  }
}

void __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  dispatch_source_t v2 = HKLogInfrastructure();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    BOOL v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 48));
      *(_DWORD *)long long buf = 138543874;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = label;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "%{public}@: notify daemon activated for observer %{public}@ on queue %s", buf, 0x20u);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke_455;
  v9[3] = &unk_1E62F31C0;
  id v8 = *(NSObject **)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);
}

uint64_t __50__HDDaemon_registerDaemonActivatedObserver_queue___block_invoke_455(uint64_t a1)
{
  return [*(id *)(a1 + 32) daemonActivated:*(void *)(a1 + 40)];
}

- (void)registerProtectedResourceStoreProvider:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_protectedResourceStoreProvidersLock);
  protectedResourceStoreProviders = self->_protectedResourceStoreProviders;
  if (!protectedResourceStoreProviders)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = self->_protectedResourceStoreProviders;
    self->_protectedResourceStoreProviders = v5;

    protectedResourceStoreProviders = self->_protectedResourceStoreProviders;
  }
  [(NSHashTable *)protectedResourceStoreProviders addObject:v7];
  os_unfair_lock_unlock(&self->_protectedResourceStoreProvidersLock);
}

- (void)unregisterProtectedResourceStoreProvider:(id)a3
{
  p_protectedResourceStoreProvidersLock = &self->_protectedResourceStoreProvidersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_protectedResourceStoreProvidersLock);
  [(NSHashTable *)self->_protectedResourceStoreProviders removeObject:v5];

  os_unfair_lock_unlock(p_protectedResourceStoreProvidersLock);
}

- (id)protectedResourceStoreProviders
{
  p_protectedResourceStoreProvidersLock = &self->_protectedResourceStoreProvidersLock;
  os_unfair_lock_lock(&self->_protectedResourceStoreProvidersLock);
  protectedResourceStoreProviders = self->_protectedResourceStoreProviders;
  if (protectedResourceStoreProviders)
  {
    id v5 = [(NSHashTable *)protectedResourceStoreProviders allObjects];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  os_unfair_lock_unlock(p_protectedResourceStoreProvidersLock);

  return v5;
}

- (void)setDaemonTester:(id)a3
{
  obuint64_t j = a3;
  os_unfair_lock_lock(&self->_daemonReadyLock);
  objc_storeWeak((id *)&self->_daemonTester, obj);
  BOOL daemonReady = self->_daemonReady;
  os_unfair_lock_unlock(&self->_daemonReadyLock);
  if (daemonReady) {
    [obj daemonReadyComplete:self];
  }
}

- (void)unregisterForLaunchNotification:(const char *)a3
{
  if (self) {
    xpc_set_event();
  }
}

- (id)healthDirectorySizeInBytes
{
  v34[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = [(HDDaemon *)self healthDirectoryURL];
  uint64_t v5 = *MEMORY[0x1E4F1C718];
  v34[0] = *MEMORY[0x1E4F1C718];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v7 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:v6 options:0 errorHandler:&__block_literal_global_469];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v26;
    *(void *)&long long v10 = 138543618;
    long long v22 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v23 = 0;
        id v24 = 0;
        int v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v24, v5, &v23, v22);
        id v17 = v24;
        id v18 = v23;
        if (v16)
        {
          v12 += [v17 unsignedLongLongValue];
        }
        else
        {
          _HKInitializeLogging();
          int v19 = *MEMORY[0x1E4F29F28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v22;
            uint64_t v30 = v15;
            __int16 v31 = 2114;
            id v32 = v18;
            _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Unable to determine file size for %{public}@: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v12];

  return v20;
}

uint64_t __38__HDDaemon_healthDirectorySizeInBytes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void __41__HDDaemon__registerForDeviceNameChanges__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v1 = [WeakRetained profileManager];
    dispatch_source_t v2 = [v1 allProfileIdentifiers];

    uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v20;
      *(void *)&long long v4 = 138543618;
      long long v16 = v4;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          __int16 v10 = objc_msgSend(WeakRetained, "profileManager", v16);
          id v11 = [v10 profileForIdentifier:v9];

          if (v11)
          {
            uint64_t v12 = [v11 sourceManager];
            id v18 = v6;
            char v13 = [v12 updateCurrentDeviceNameWithError:&v18];
            id v14 = v18;

            if ((v13 & 1) == 0)
            {
              _HKInitializeLogging();
              uint64_t v15 = *MEMORY[0x1E4F29F28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = v16;
                uint64_t v24 = v9;
                __int16 v25 = 2114;
                id v26 = v14;
                _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Current device source name update failed for profile with identifier %{public}@: %{public}@", buf, 0x16u);
              }
            }
            uint64_t v6 = v14;
          }
        }
        uint64_t v5 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
}

- (void)_resetPrivacySettings
{
  v30[2] = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "Resetting privacy settings", buf, 2u);
  }
  long long v4 = [(HDDaemon *)self primaryProfile];
  uint64_t v5 = [v4 authorizationManager];
  [v5 resetAllAuthorizationRecordsWithCompletion:0];

  id v6 = objc_alloc(MEMORY[0x1E4F79CD8]);
  uint64_t v7 = *MEMORY[0x1E4F2BF20];
  int v8 = (void *)[v6 initWithDomain:*MEMORY[0x1E4F2BF20]];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = *MEMORY[0x1E4F2BF28];
  v30[0] = *MEMORY[0x1E4F2BF30];
  v30[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v12 = [v9 setWithArray:v11];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v8, "removeObjectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  id v18 = [v8 synchronize];
  if (v18)
  {
    _HKInitializeLogging();
    long long v19 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v26 = v8;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to synchronize %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
    [v20 synchronizeNanoDomain:v7 keys:v13];
  }
}

uint64_t __33__HDDaemon__setupSignal_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)healthDirectoryPath
{
  return self->_healthDirectoryPath;
}

- (NSURL)healthDirectoryURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:self->_healthDirectoryPath isDirectory:1];
}

- (NSURL)localContentURL
{
  dispatch_source_t v2 = [(HDDaemon *)self healthDirectoryURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Local" isDirectory:1];

  return (NSURL *)v3;
}

- (HDBackgroundObservationServerExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (HDPostInstallUpdateManager)postInstallUpdateManager
{
  return self->_postInstallUpdateManager;
}

- (HDWorkoutPluginDaemonExtension)workoutPluginExtension
{
  return (HDWorkoutPluginDaemonExtension *)[(HDDaemon *)self daemonExtensionWithIdentifier:@"com.apple.health.WorkoutPlugin"];
}

- (id)createApplicationStateMonitor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4E278]);

  return v2;
}

- (id)createApplicationStateMonitorWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F4E278];
  id v8 = a3;
  uint64_t v9 = (void *)[[v7 alloc] initWithBundleIDs:v8 states:v6 elevatedPriority:v5];

  return v9;
}

- (id)createRBSProcessStateProvider
{
  id v2 = objc_alloc_init(HDRBSProcessStateProvider);

  return v2;
}

- (id)diagnosticDescription
{
  p_daemonReadyLock = &self->_daemonReadyLock;
  os_unfair_lock_lock(&self->_daemonReadyLock);
  int64_t numberOfDaemonReadyObserversBeforeReady = self->_numberOfDaemonReadyObserversBeforeReady;
  int64_t numberOfDaemonReadyObserversAfterReady = self->_numberOfDaemonReadyObserversAfterReady;
  os_unfair_lock_unlock(p_daemonReadyLock);
  return (id)[NSString stringWithFormat:@"DaemonReadyObservers: %ld (%ld before ready, %ld after ready)", numberOfDaemonReadyObserversAfterReady + numberOfDaemonReadyObserversBeforeReady, numberOfDaemonReadyObserversBeforeReady, numberOfDaemonReadyObserversAfterReady];
}

- (id)_newCacheDeleteCoordinator
{
  return objc_alloc_init(HDCacheDeleteCoordinator);
}

- (id)_newConnectionManager
{
  uint64_t v3 = [HDDaemonConnectionManager alloc];
  uint64_t v4 = *MEMORY[0x1E4F29E70];

  return [(HDDaemonConnectionManager *)v3 initWithMachServiceName:v4 daemon:self];
}

- (id)_newContentProtectionManager
{
  return objc_alloc_init(MEMORY[0x1E4F65CE0]);
}

- (id)_newDatabasePruningCoordinator
{
  uint64_t v3 = [HDDatabasePruningCoordinator alloc];

  return [(HDDatabasePruningCoordinator *)v3 initWithDaemon:self];
}

- (id)_newCloudSyncCoordinator
{
  uint64_t v3 = [HDCloudSyncCoordinator alloc];

  return [(HDCloudSyncCoordinator *)v3 initWithDaemon:self];
}

- (id)_newAnalyticsSubmissionCoordinator
{
  uint64_t v3 = [HDAnalyticsSubmissionCoordinator alloc];

  return [(HDAnalyticsSubmissionCoordinator *)v3 initWithDaemon:self];
}

- (id)_newAutoBugCaptureReporter
{
  uint64_t v3 = [HDAutoBugCaptureReporter alloc];

  return [(HDAutoBugCaptureReporter *)v3 initWithDaemon:self];
}

- (id)_newNotificationInstructionSyncService
{
  uint64_t v3 = [HDNotificationInstructionSyncService alloc];

  return [(HDNotificationInstructionSyncService *)v3 initWithDaemon:self];
}

- (id)_newHealthAppNewDeviceNotificationService
{
  return objc_alloc_init(HDHealthAppNewDeviceNotificationService);
}

- (id)_newNanoRegistryDeviceCapabilityProvider
{
  return objc_alloc_init(HDNanoRegistryDeviceCapabilityProvider);
}

- (id)_newOTAFeatureAvailabilityManager
{
  uint64_t v3 = [HDOTAFeatureAvailabilityManager alloc];

  return [(HDOTAFeatureAvailabilityManager *)v3 initWithDaemon:self];
}

- (id)_newPrimaryProfile
{
  if (!self->_healthDirectoryPath)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDDaemon.m", 1187, @"Invalid parameter not satisfying: %@", @"_healthDirectoryPath" object file lineNumber description];
  }
  uint64_t v3 = [HDPrimaryProfile alloc];
  healthDirectoryPath = self->_healthDirectoryPath;
  medicalIDDirectoryPath = self->_medicalIDDirectoryPath;

  return [(HDPrimaryProfile *)v3 initWithDirectoryPath:healthDirectoryPath medicalIDDirectoryPath:medicalIDDirectoryPath daemon:self];
}

- (id)_newProcessStateManager
{
  uint64_t v3 = [HDProcessStateManager alloc];

  return [(HDProcessStateManager *)v3 initWithApplicationStateMonitorProvider:self];
}

- (id)_newBackgroundTaskScheduler
{
  return objc_alloc_init(HDBackgroundTaskScheduler);
}

- (id)_newPluginManager
{
  uint64_t v3 = [HDPluginManager alloc];

  return [(HDPluginManager *)v3 initWithDaemon:self];
}

- (id)_newProfileManager
{
  uint64_t v3 = [HDProfileManager alloc];

  return [(HDProfileManager *)v3 initWithDaemon:self];
}

- (id)_newMaintenanceWorkCoordinator
{
  return objc_alloc_init(HDMaintenanceWorkCoordinator);
}

- (id)_newTaskServerRegistry
{
  uint64_t v3 = [HDTaskServerRegistry alloc];

  return [(HDTaskServerRegistry *)v3 initWithDaemon:self];
}

- (id)_newDevicePowerMonitor
{
  return 0;
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F17E94C8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__HDDaemon_applicationStateDidChange___block_invoke;
  v23[3] = &unk_1E62FB4B8;
  id v6 = v5;
  id v24 = v6;
  uint64_t v7 = objc_msgSend(v4, "hk_filter:", v23);
  if ([v7 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v18 = self;
      uint64_t v11 = *(void *)v20;
      uint64_t v12 = HDHealthDaemonFitnessAppsRestrictedNotification;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * v13) appState];
        char v15 = [v14 isRestricted];

        if (v15) {
          break;
        }
        if (v10 == ++v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v10) {
            goto LABEL_4;
          }
          uint64_t v12 = HDHealthDaemonFitnessAppsAllowedNotification;
          break;
        }
      }
      self = v18;
    }
    else
    {
      uint64_t v12 = HDHealthDaemonFitnessAppsAllowedNotification;
    }

    uint64_t v16 = *v12;
    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:v16 object:self];
  }
}

uint64_t __38__HDDaemon_applicationStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (NSString)medicalIDDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (HDAnalyticsSubmissionCoordinator)analyticsSubmissionCoordinator
{
  return self->_analyticsSubmissionCoordinator;
}

- (HDAutoBugCaptureReporter)autoBugCaptureReporter
{
  return self->_autoBugCaptureReporter;
}

- (HDCloudSyncCoordinator)cloudSyncCoordinator
{
  return self->_cloudSyncCoordinator;
}

- (HDDatabasePruningCoordinator)databasePruningCoordinator
{
  return self->_databasePruningCoordinator;
}

- (HDMaintenanceWorkCoordinator)maintenanceWorkCoordinator
{
  return self->_maintenanceWorkCoordinator;
}

- (HDPairedDeviceCapabilityProviding)nanoRegistryDeviceCapabilityProvider
{
  return self->_nanoRegistryDeviceCapabilityProvider;
}

- (HDOntologyConfigurationProvider)ontologyConfigurationProvider
{
  return self->_ontologyConfigurationProvider;
}

- (HDOntologyUpdateCoordinator)ontologyUpdateCoordinator
{
  return self->_ontologyUpdateCoordinator;
}

- (HKWatchLowPowerModeDataSource)watchLowPowerModeDataSource
{
  return self->_watchLowPowerModeDataSource;
}

- (HKWristDetectionSettingManager)wristDetectionSettingManager
{
  return self->_wristDetectionSettingManager;
}

- (HDCacheDeleteCoordinator)cacheDeleteCoordinator
{
  return self->_cacheDeleteCoordinator;
}

- (BOOL)shouldEnqueueMaintenanceWork
{
  return self->_shouldEnqueueMaintenanceWork;
}

- (void)setShouldEnqueueMaintenanceWork:(BOOL)a3
{
  self->_shouldEnqueueMaintenanceWork = a3;
}

- (HDDaemonConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (HDTaskServerRegistry)taskServerRegistry
{
  return self->_taskServerRegistry;
}

- (HDDevicePowerMonitor)devicePowerMonitor
{
  return self->_devicePowerMonitor;
}

- (HDNotificationInstructionSyncService)notificationInstructionSyncService
{
  return self->_notificationInstructionSyncService;
}

- (HDHealthAppNewDeviceNotificationService)healthAppNewDeviceNotificationService
{
  return self->_healthAppNewDeviceNotificationService;
}

- (HDOTAFeatureAvailabilityManager)OTAFeatureAvailabilityManager
{
  return self->_OTAFeatureAvailabilityManager;
}

- (HDXPCAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (HDXPCEventManager)xpcEventManager
{
  return self->_xpcEventManager;
}

- (HDOntologyAssetProvider)ontologyAssetProvider
{
  return self->_ontologyAssetProvider;
}

- (HDOntologyBackingStore)ontologyBackingStore
{
  return self->_ontologyBackingStore;
}

- (HDUserDomainConceptEntityRegistry)userDomainConceptEntityRegistry
{
  return self->_userDomainConceptEntityRegistry;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource)featureAvailabilityRequirementSatisfactionOverridesDataSource
{
  return self->_featureAvailabilityRequirementSatisfactionOverridesDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityRequirementSatisfactionOverridesDataSource, 0);
  objc_storeStrong((id *)&self->_userDomainConceptEntityRegistry, 0);
  objc_storeStrong((id *)&self->_ontologyBackingStore, 0);
  objc_storeStrong((id *)&self->_ontologyAssetProvider, 0);
  objc_storeStrong((id *)&self->_xpcEventManager, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_OTAFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_healthAppNewDeviceNotificationService, 0);
  objc_storeStrong((id *)&self->_notificationInstructionSyncService, 0);
  objc_storeStrong((id *)&self->_devicePowerMonitor, 0);
  objc_storeStrong((id *)&self->_taskServerRegistry, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_destroyWeak((id *)&self->_daemonTester);
  objc_storeStrong((id *)&self->_cacheDeleteCoordinator, 0);
  objc_storeStrong((id *)&self->_alertSuppressionService, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingManager, 0);
  objc_storeStrong((id *)&self->_watchLowPowerModeDataSource, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_ontologyUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_nanoRegistryDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_maintenanceWorkCoordinator, 0);
  objc_storeStrong((id *)&self->_databasePruningCoordinator, 0);
  objc_storeStrong((id *)&self->_autoBugCaptureReporter, 0);
  objc_storeStrong((id *)&self->_analyticsSubmissionCoordinator, 0);
  objc_storeStrong((id *)&self->_medicalIDDirectoryPath, 0);
  objc_storeStrong((id *)&self->_daemonExtensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_protectedResourceStoreProviders, 0);
  objc_storeStrong((id *)&self->_daemonActivatedBlocks, 0);
  objc_storeStrong((id *)&self->_daemonReadyBlocks, 0);
  objc_storeStrong((id *)&self->_primaryProfile, 0);
  objc_storeStrong((id *)&self->_postInstallUpdateManager, 0);
  objc_storeStrong((id *)&self->_profileManager, 0);
  objc_storeStrong((id *)&self->_processStateManager, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_ontologyConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_cloudSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_backgroundTaskScheduler, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthDirectoryPath, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
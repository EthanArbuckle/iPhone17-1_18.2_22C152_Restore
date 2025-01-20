@interface BYConcreteEnvironment
- (AppearanceModeProvider)appearanceModeProvider;
- (BFFBackupDeviceController)backupDeviceController;
- (BFFSettingsManager)settingsManager;
- (BYAnalyticsEventAppearance)analyticsEventAppearance;
- (BYAnalyticsManager)analyticsManager;
- (BYCapabilities)capabilities;
- (BYChronicle)chronicle;
- (BYDeviceConfiguration)deviceConfiguration;
- (BYDeviceProvider)deviceProvider;
- (BYExpressSettingsSetupCache)expressSettingsCache;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (BYSeedProgramManager)seedProgramManager;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyActivationRecord)activationRecord;
- (BuddyActivationState)activationState;
- (BuddyBackgroundViewController)buddyBackgroundViewController;
- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager;
- (BuddyButtonMonitor)buttonMonitor;
- (BuddyChildSetupPresenter)childSetupPresenter;
- (BuddyCombinedTermsProvider)combinedTermsProvider;
- (BuddyDisplayZoomExecutor)displayZoomExecutor;
- (BuddyEmergencyExecutor)emergencyExecutor;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (BuddyExistingSettings)existingSettings;
- (BuddyFeatureFlags)featureFlags;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyMiscState)miscState;
- (BuddyMultilingualFlowManager)multilingualFlowManager;
- (BuddyNetworkProvider)networkProvider;
- (BuddyPendingRestoreState)pendingRestoreState;
- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController;
- (BuddySetupMethod)setupMethod;
- (BuddySuspendTask)suspendTask;
- (BuddySystemTimeUpdateManager)systemTimeUpdateManager;
- (DMCReturnToServiceController)mdmReturnToServiceController;
- (IntelligenceProvider)intelligenceProvider;
- (LockdownModeProvider)lockdownModeProvider;
- (MCProfileConnection)managedConfiguration;
- (ProximitySetupController)proximitySetupController;
- (SetupUserDispositionProvider)userDispositionProvider;
- (id)doesRestartFlowCauseEraseBlock;
- (id)exitBuddyForDemoSetUpBlock;
- (id)menuButtonPressedBlock;
- (id)prepareForCloudRestoreRebootBlock;
- (id)prepareForDeviceMigrationBlock;
- (id)showModalWiFiSettingsBlock;
- (id)startDeviceMigrationBlock;
- (id)willPerformSoftwareUpdateBlock;
- (id)writeGreenInformedDefaultPlistIfNecessaryBlock;
- (void)_faultForNilPropertyWithDescription:(char *)a3;
- (void)setActivationRecord:(id)a3;
- (void)setActivationState:(id)a3;
- (void)setAnalyticsEventAppearance:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAppearanceModeProvider:(id)a3;
- (void)setBackupDeviceController:(id)a3;
- (void)setBetaEnrollmentStateManager:(id)a3;
- (void)setBuddyBackgroundViewController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setButtonMonitor:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChildSetupPresenter:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setCombinedTermsProvider:(id)a3;
- (void)setDeviceConfiguration:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setDisplayZoomExecutor:(id)a3;
- (void)setDoesRestartFlowCauseEraseBlock:(id)a3;
- (void)setEmergencyExecutor:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
- (void)setExistingSettings:(id)a3;
- (void)setExitBuddyForDemoSetUpBlock:(id)a3;
- (void)setExpressSettingsCache:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setIntelligenceProvider:(id)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMdmReturnToServiceController:(id)a3;
- (void)setMenuButtonPressedBlock:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setMultilingualFlowManager:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setPrepareForCloudRestoreRebootBlock:(id)a3;
- (void)setPrepareForDeviceMigrationBlock:(id)a3;
- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSeedProgramManager:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)setShowModalWiFiSettingsBlock:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
- (void)setStartDeviceMigrationBlock:(id)a3;
- (void)setSuspendTask:(id)a3;
- (void)setSystemTimeUpdateManager:(id)a3;
- (void)setUserDispositionProvider:(id)a3;
- (void)setWillPerformSoftwareUpdateBlock:(id)a3;
- (void)setWriteGreenInformedDefaultPlistIfNecessaryBlock:(id)a3;
@end

@implementation BYConcreteEnvironment

- (BuddyPendingRestoreState)pendingRestoreState
{
  if (!self->_pendingRestoreState) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "pendingRestoreState", a2);
  }
  pendingRestoreState = self->_pendingRestoreState;

  return pendingRestoreState;
}

- (BYChronicle)chronicle
{
  if (!self->_chronicle) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "chronicle", a2);
  }
  chronicle = self->_chronicle;

  return chronicle;
}

- (BuddyMiscState)miscState
{
  if (!self->_miscState) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "miscState", a2);
  }
  miscState = self->_miscState;

  return miscState;
}

- (ProximitySetupController)proximitySetupController
{
  if (!self->_proximitySetupController) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "proximitySetupController", a2);
  }
  proximitySetupController = self->_proximitySetupController;

  return proximitySetupController;
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  if (!self->_proximityAutomatedDeviceEnrollmentController) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "proximityAutomatedDeviceEnrollmentController", a2);
  }
  proximityAutomatedDeviceEnrollmentController = self->_proximityAutomatedDeviceEnrollmentController;

  return proximityAutomatedDeviceEnrollmentController;
}

- (BFFBackupDeviceController)backupDeviceController
{
  if (!self->_backupDeviceController) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "backupDeviceController", a2);
  }
  backupDeviceController = self->_backupDeviceController;

  return backupDeviceController;
}

- (BuddySystemTimeUpdateManager)systemTimeUpdateManager
{
  if (!self->_systemTimeUpdateManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "systemTimeUpdateManager", a2);
  }
  systemTimeUpdateManager = self->_systemTimeUpdateManager;

  return systemTimeUpdateManager;
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  if (!self->_enrollmentCoordinator) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "enrollmentCoordinator", a2);
  }
  enrollmentCoordinator = self->_enrollmentCoordinator;

  return enrollmentCoordinator;
}

- (id)menuButtonPressedBlock
{
  if (!self->_menuButtonPressedBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "menuButtonPressedBlock", a2);
  }
  id v2 = objc_retainBlock(self->_menuButtonPressedBlock);

  return v2;
}

- (id)showModalWiFiSettingsBlock
{
  if (!self->_showModalWiFiSettingsBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "showModalWiFiSettingsBlock", a2);
  }
  id v2 = objc_retainBlock(self->_showModalWiFiSettingsBlock);

  return v2;
}

- (id)writeGreenInformedDefaultPlistIfNecessaryBlock
{
  if (!self->_writeGreenInformedDefaultPlistIfNecessaryBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "writeGreenInformedDefaultPlistIfNecessaryBlock", a2);
  }
  id v2 = objc_retainBlock(self->_writeGreenInformedDefaultPlistIfNecessaryBlock);

  return v2;
}

- (id)doesRestartFlowCauseEraseBlock
{
  if (!self->_doesRestartFlowCauseEraseBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "doesRestartFlowCauseEraseBlock", a2);
  }
  id v2 = objc_retainBlock(self->_doesRestartFlowCauseEraseBlock);

  return v2;
}

- (id)prepareForCloudRestoreRebootBlock
{
  if (!self->_prepareForCloudRestoreRebootBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "prepareForCloudRestoreRebootBlock", a2);
  }
  id v2 = objc_retainBlock(self->_prepareForCloudRestoreRebootBlock);

  return v2;
}

- (id)exitBuddyForDemoSetUpBlock
{
  if (!self->_exitBuddyForDemoSetUpBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "exitBuddyForDemoSetUpBlock", a2);
  }
  id v2 = objc_retainBlock(self->_exitBuddyForDemoSetUpBlock);

  return v2;
}

- (id)prepareForDeviceMigrationBlock
{
  if (!self->_prepareForDeviceMigrationBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "prepareForDeviceMigrationBlock", a2);
  }
  id v2 = objc_retainBlock(self->_prepareForDeviceMigrationBlock);

  return v2;
}

- (id)startDeviceMigrationBlock
{
  if (!self->_startDeviceMigrationBlock) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "startDeviceMigrationBlock", a2);
  }
  id v2 = objc_retainBlock(self->_startDeviceMigrationBlock);

  return v2;
}

- (BYSeedProgramManager)seedProgramManager
{
  if (!self->_seedProgramManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "seedProgramManager", a2);
  }
  seedProgramManager = self->_seedProgramManager;

  return seedProgramManager;
}

- (BYPreferencesController)buddyPreferences
{
  if (!self->_buddyPreferences) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "buddyPreferences", a2);
  }
  buddyPreferences = self->_buddyPreferences;

  return buddyPreferences;
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  if (!self->_buddyPreferencesExcludedFromBackup) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "buddyPreferencesExcludedFromBackup", a2);
  }
  buddyPreferencesExcludedFromBackup = self->_buddyPreferencesExcludedFromBackup;

  return buddyPreferencesExcludedFromBackup;
}

- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager
{
  if (!self->_betaEnrollmentStateManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "betaEnrollmentStateManager", a2);
  }
  betaEnrollmentStateManager = self->_betaEnrollmentStateManager;

  return betaEnrollmentStateManager;
}

- (BYCapabilities)capabilities
{
  if (!self->_capabilities) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "capabilities", a2);
  }
  capabilities = self->_capabilities;

  return capabilities;
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  if (!self->_softwareUpdateCache) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "softwareUpdateCache", a2);
  }
  softwareUpdateCache = self->_softwareUpdateCache;

  return softwareUpdateCache;
}

- (BFFSettingsManager)settingsManager
{
  if (!self->_settingsManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "settingsManager", a2);
  }
  settingsManager = self->_settingsManager;

  return settingsManager;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  if (!self->_passcodeCacheManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "passcodeCacheManager", a2);
  }
  passcodeCacheManager = self->_passcodeCacheManager;

  return passcodeCacheManager;
}

- (BYRunState)runState
{
  if (!self->_runState) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "runState", a2);
  }
  runState = self->_runState;

  return runState;
}

- (BYAnalyticsManager)analyticsManager
{
  if (!self->_analyticsManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "analyticsManager", a2);
  }
  analyticsManager = self->_analyticsManager;

  return analyticsManager;
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  if (!self->_paneFeatureAnalyticsManager) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "paneFeatureAnalyticsManager", a2);
  }
  paneFeatureAnalyticsManager = self->_paneFeatureAnalyticsManager;

  return paneFeatureAnalyticsManager;
}

- (MCProfileConnection)managedConfiguration
{
  if (!self->_managedConfiguration) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "managedConfiguration", a2);
  }
  managedConfiguration = self->_managedConfiguration;

  return managedConfiguration;
}

- (BuddyActivationRecord)activationRecord
{
  if (!self->_activationRecord) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "activationRecord", a2);
  }
  activationRecord = self->_activationRecord;

  return activationRecord;
}

- (BuddyCombinedTermsProvider)combinedTermsProvider
{
  if (!self->_combinedTermsProvider) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "combinedTermsProvider", a2);
  }
  combinedTermsProvider = self->_combinedTermsProvider;

  return combinedTermsProvider;
}

- (BuddyFeatureFlags)featureFlags
{
  if (!self->_featureFlags) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "featureFlags", a2);
  }
  featureFlags = self->_featureFlags;

  return featureFlags;
}

- (BuddyButtonMonitor)buttonMonitor
{
  if (!self->_buttonMonitor) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "buttonMonitor", a2);
  }
  buttonMonitor = self->_buttonMonitor;

  return buttonMonitor;
}

- (BuddyEmergencyExecutor)emergencyExecutor
{
  if (!self->_emergencyExecutor) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "emergencyExecutor", a2);
  }
  emergencyExecutor = self->_emergencyExecutor;

  return emergencyExecutor;
}

- (BuddyActivationState)activationState
{
  if (!self->_activationState) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "activationState", a2);
  }
  activationState = self->_activationState;

  return activationState;
}

- (BYFlowSkipController)flowSkipController
{
  if (!self->_flowSkipController) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "flowSkipController", a2);
  }
  flowSkipController = self->_flowSkipController;

  return flowSkipController;
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  if (!self->_mdmReturnToServiceController) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "mdmReturnToServiceController", a2);
  }
  mdmReturnToServiceController = self->_mdmReturnToServiceController;

  return mdmReturnToServiceController;
}

- (AppearanceModeProvider)appearanceModeProvider
{
  if (!self->_appearanceModeProvider) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "appearanceModeProvider", a2);
  }
  appearanceModeProvider = self->_appearanceModeProvider;

  return appearanceModeProvider;
}

- (SetupUserDispositionProvider)userDispositionProvider
{
  if (!self->_userDispositionProvider) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "userDispositionProvider", a2);
  }
  userDispositionProvider = self->_userDispositionProvider;

  return userDispositionProvider;
}

- (BYDeviceConfiguration)deviceConfiguration
{
  if (!self->_deviceConfiguration) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "deviceConfiguration", a2);
  }
  deviceConfiguration = self->_deviceConfiguration;

  return deviceConfiguration;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  if (!self->_flowItemDispositionProvider) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "flowItemDispositionProvider", a2);
  }
  flowItemDispositionProvider = self->_flowItemDispositionProvider;

  return flowItemDispositionProvider;
}

- (BYAnalyticsEventAppearance)analyticsEventAppearance
{
  if (!self->_analyticsEventAppearance) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "analyticsEventAppearance", a2);
  }
  analyticsEventAppearance = self->_analyticsEventAppearance;

  return analyticsEventAppearance;
}

- (BuddyChildSetupPresenter)childSetupPresenter
{
  if (!self->_childSetupPresenter) {
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "childSetupPresenter", a2);
  }
  childSetupPresenter = self->_childSetupPresenter;

  return childSetupPresenter;
}

- (void)_faultForNilPropertyWithDescription:(char *)a3
{
  v6 = self;
  SEL v5 = a2;
  v4 = a3;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    sub_10013CE6C((uint64_t)buf, (uint64_t)v4);
    _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "Environment has nil %{public}s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
}

- (void)setPendingRestoreState:(id)a3
{
}

- (void)setChronicle:(id)a3
{
}

- (void)setMiscState:(id)a3
{
}

- (void)setProximitySetupController:(id)a3
{
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
}

- (void)setBackupDeviceController:(id)a3
{
}

- (void)setSystemTimeUpdateManager:(id)a3
{
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (void)setMenuButtonPressedBlock:(id)a3
{
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
}

- (void)setWriteGreenInformedDefaultPlistIfNecessaryBlock:(id)a3
{
}

- (void)setDoesRestartFlowCauseEraseBlock:(id)a3
{
}

- (void)setPrepareForCloudRestoreRebootBlock:(id)a3
{
}

- (void)setExitBuddyForDemoSetUpBlock:(id)a3
{
}

- (void)setPrepareForDeviceMigrationBlock:(id)a3
{
}

- (void)setStartDeviceMigrationBlock:(id)a3
{
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
}

- (void)setSeedProgramManager:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (void)setBuddyPreferences:(id)a3
{
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (id)willPerformSoftwareUpdateBlock
{
  return self->_willPerformSoftwareUpdateBlock;
}

- (void)setWillPerformSoftwareUpdateBlock:(id)a3
{
}

- (void)setBetaEnrollmentStateManager:(id)a3
{
}

- (void)setCapabilities:(id)a3
{
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (void)setSettingsManager:(id)a3
{
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (void)setRunState:(id)a3
{
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setActivationRecord:(id)a3
{
}

- (void)setCombinedTermsProvider:(id)a3
{
}

- (void)setFeatureFlags:(id)a3
{
}

- (void)setButtonMonitor:(id)a3
{
}

- (void)setEmergencyExecutor:(id)a3
{
}

- (void)setActivationState:(id)a3
{
}

- (void)setFlowSkipController:(id)a3
{
}

- (void)setMdmReturnToServiceController:(id)a3
{
}

- (void)setAppearanceModeProvider:(id)a3
{
}

- (void)setUserDispositionProvider:(id)a3
{
}

- (void)setDeviceConfiguration:(id)a3
{
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (void)setAnalyticsEventAppearance:(id)a3
{
}

- (void)setChildSetupPresenter:(id)a3
{
}

- (BuddyBackgroundViewController)buddyBackgroundViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buddyBackgroundViewController);

  return (BuddyBackgroundViewController *)WeakRetained;
}

- (void)setBuddyBackgroundViewController:(id)a3
{
}

- (IntelligenceProvider)intelligenceProvider
{
  return self->_intelligenceProvider;
}

- (void)setIntelligenceProvider:(id)a3
{
}

- (BuddyMultilingualFlowManager)multilingualFlowManager
{
  return self->_multilingualFlowManager;
}

- (void)setMultilingualFlowManager:(id)a3
{
}

- (BYExpressSettingsSetupCache)expressSettingsCache
{
  return self->_expressSettingsCache;
}

- (void)setExpressSettingsCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end